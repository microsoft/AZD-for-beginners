# 4. Nakonfigurujte šablónu

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Začnite so skutočnou šablónou

Otvorte [`azure.yaml` v Začíname s AI agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) v repozitári, ktorý ste inicializovali. Zdrojová šablóna sa môže meniť nezávisle od tohto workshopu. Nasledujúci **výňatok** bol skontrolovaný 4. novembra 2026; nie je náhradou za kompletný súbor:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identifikuje projekt AZD; `metadata.template` zaznamenáva verziu šablóny.
- `requiredVersions.azd` je minimálna verzia šablóny, nie odporúčanie zostať na starej CLI. Použite aktuálne podporovanú verziu AZD.
- `services` definuje ciele nasadenia aplikácie. Táto šablóna nasadzuje svoje Python API a front-end ako jednu službu Container Apps.
- `project` je relatívny voči `azure.yaml`.
- `remoteBuild` požaduje vzdialené zostavenie kontajnera. Vaša identita stále potrebuje príslušné povolenia v Azure.

Súbory Bicep šablóny pod `infra/`, nie iba zoznam `services`, deklarujú zdroje ako Microsoft Foundry, nasadenia modelov, úložisko a voliteľné AI Search.

## 2. Pochopte životný cyklus háčikov

Prezrite si sekciu `hooks` a jej referencované skripty pred spustením šablóny. Revidovaná verzia obsahuje:

| Háčik | Účel | Dôležité správanie |
|------|-------|--------------------|
| `preup` | Overenie vstupov prostredia šablóny pred pracovným tokom `up` | Platformovo špecifické shell skripty môžu zastaviť pracovný tok v prípade zlyhania |
| `postdeploy` | Spustenie nastavenia špecifického pre šablónu po nasadení aplikácie | Skontrolujte `continueOnError` a výstup skriptu; úspešné nasadenie neznamená, že každá úloha nastavenia bola úspešná |

Táto verzia **neobsahuje** starší háčik `postprovision` / `write_env`, ktorý bol uvedený v skorších materiáloch workshopu. Nekopírujte odkazy na háčiky do skriptov, ktoré už neexistujú.

Kľúče háčikov vyberajú životné cykly udalostí; `posix` a `windows` vyberajú platformové implementácie. `shell`, `run`, `interactive` a `continueOnError` riadia vykonávanie. Sú to spustiteľné skripty s vašimi povoleniami, takže ich skontrolujte rovnako dôkladne ako aplikačný kód.

Pozrite si dokumentáciu [AZD háčikov](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) pre kompletný životný cyklus.

## 3. Sledovanie vstupov prostredia do infraštruktúry

Spustite tieto príkazy z inicializovaného vzorového repozitára:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Prezrite si `infra/main.parameters.json`, aby ste videli, ktoré premenné prostredia šablóna skutočne využíva. Nastavenie ľubovoľného mena pomocou `azd env set` automaticky nezmení zdroj Azure.

Skontrolované predvolené hodnoty zahŕňajú:

| Vstup | Predvolené / účel |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvóty jednotiek závisia od modelu a typu nasadenia |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; nechajte vypnuté, pokiaľ nebola preskúmaná manipulácia s údajmi |

Toto sú vstupy špecifické pre vzor, nie globálne nastavenia AZD. Pred výberom modelu, SKU, kapacity alebo lokality si skontrolujte [dokumentáciu podpory modelu a regiónu](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) a kvótu vášho predplatného. Neposudzujte každú kapacitnú jednotku ako 1 000 tokenov za minútu.

Ak chcete vybrať iný chatovací model, aktualizujte jeho kompatibilné **meno, verziu, formát, SKU a kapacitu spoločne**, podľa [návodu na prispôsobenie vzoru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Zmena iba mena môže nechať nekompatibilnú verziu alebo typ nasadenia.

## 4. Laboratórium: povolenie voliteľného vyhľadávania a sledovania

!!! warning "Tieto nastavenia môžu pridať fakturovateľné zdroje"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Zmeny infraštruktúry potrebujú provisionovanie; samotné `azd deploy` nasadzuje len aplikačné služby. Pre indexovanie vyhľadávania a podporované možnosti vyhľadávania postupujte podľa [návodu AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Pre monitoring postupujte podľa [návodu na observabilitu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Nezapojujte zachytávanie obsahu výziev/odpovedí na reálnych zákazníckych údajoch bez potrebného súhlasu, prístupových kontrol, politiky uchovávania a redakcie.

## 5. Existujúce zdroje a CI/CD

Ak chcete znovu použiť projekt Foundry, riaďte sa pokynmi pre [existujúce zdroje vzoru](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Nastavenie `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` mení cestu nasadenia; v takom prípade šablóna nevytvára Application Insights ani AI Search za vás. Explicitne skontrolujte závislosti, priradenia rolí a nasadenia modelov.

Sekcia `pipeline.variables` riadi hodnoty odovzdané do generovaného pipeline; nie je to úložisko tajomstiev a nevytvára zdroje Azure. Preferujte spravovanú identitu v aplikácii a OIDC pre CI/CD. Súbory prostredia AZD sú čistý text a nemali by sa commitovať.

AZD podporuje import dôveryhodného, lokálne pripraveného dotenv súboru:

```bash
azd env set --file .env
```

Pred importom tento súbor skontrolujte a nezobrazujte súbory prostredia obsahujúce tajomstvá v zdieľaných termináloch alebo CI záznamoch.

## 6. Otestujte svoje porozumenie

- Ktorá služba `azure.yaml` nasadzuje aplikáciu?
- Ktorý infraštruktúrny parameter spotrebúva každú hodnotu, ktorú ste zmenili?
- Ktoré zmeny vyžadujú provisionovanie namiesto iba nasadenia?
- Podporoval vybraný región a predplatné model a kvótu?
- Podarilo sa všetkým inštalačným háčikom, a dokážete overiť správanie nasadenej aplikácie?

Pokračujte na [Prispôsobenie šablóny](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->