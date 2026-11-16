# 4. Konfigurace šablony

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Začněte skutečnou šablonou

Otevřete [`azure.yaml` v Začínáme s AI agenty](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) v repozitáři, který jste inicializovali. Výchozí šablona se může nezávisle změnit od této workshopu. Následující **výňatek** byl zkontrolován 4. listopadu 2026; není náhradou za kompletní soubor:

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

- `name` označuje projekt AZD; `metadata.template` zaznamenává verzi šablony.
- `requiredVersions.azd` je minimální verze šablony, nikoli doporučení zůstávat na starém CLI. Použijte aktuální podporované vydání AZD.
- `services` definuje cíle nasazení aplikace. Tato šablona nasazuje své Python API a frontend jako jednu službu Container Apps.
- `project` je relativní k `azure.yaml`.
- `remoteBuild` požaduje vzdálené sestavení kontejneru. Vaše identita stále potřebuje potřebná oprávnění Azure.

Bicep soubory šablony pod `infra/`, nikoli pouze seznam `services`, deklarují zdroje jako Microsoft Foundry, nasazení modelů, úložiště a volitelný AI Search.

## 2. Pochopte životní cyklus hooků

Prohlédněte si sekci `hooks` a její odkazované skripty před spuštěním šablony. Zkontrolovaná verze obsahuje:

| Hook | Účel | Důležité chování |
|------|---------|--------------------|
| `preup` | Ověřit vstupy prostředí šablony před `up` workflow | Platformově specifické shell skripty mohou zastavit workflow při neúspěchu |
| `postdeploy` | Spustit specifické nastavení šablony po nasazení aplikace | Prohlédněte `continueOnError` a výstup skriptu; úspěšné nasazení neznamená, že všechny úkoly nastavení byly úspěšné |

Tato verze **neobsahuje** starší háček `postprovision` / `write_env` zobrazený v dřívějším workshopovém materiálu. Nekopírujte odkazy na háčky do skriptů, které již neexistují.

Klíče háčků vybírají životní události; `posix` a `windows` vybírají implementace platformy. `shell`, `run`, `interactive` a `continueOnError` řídí vykonávání. Jde o spustitelné skripty s vašimi oprávněními, proto je zkontrolujte stejně jako aplikační kód.

Podívejte se na [dokumentaci háčků AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) pro kompletní životní cyklus.

## 3. Sledujte vstupy prostředí do infrastruktury

Spusťte tyto příkazy z inicializovaného vzorového repozitáře:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Prohlédněte si `infra/main.parameters.json`, abyste viděli, které proměnné prostředí šablona skutečně používá. Nastavení libovolného jména pomocí `azd env set` automaticky nezmění zdroj Azure.

Přezkoumané výchozí hodnoty zahrnují:

| Vstup | Výchozí / účel |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvótní jednotky závisí na modelu a typu nasazení |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; ponechte vypnuto, pokud nebylo přezkoumáno zpracování dat |

Toto jsou specifické vstupy vzorku, nikoli globální nastavení AZD. Před výběrem modelu, SKU, kapacity nebo umístění si ověřte [dokumentaci podpory modelu a regionu](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) a kvóty vašeho předplatného. Neinterpretuje každou kapacitní jednotku jako 1 000 tokenů za minutu.

Pro výběr jiného chatovacího modelu aktualizujte kompatibilní **jméno, verzi, formát, SKU a kapacitu současně**, podle [průvodce přizpůsobením vzorku](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Změna pouze jména může ponechat nekompatibilní verzi nebo typ nasazení.

## 4. Laboratoř: povolení volitelného vyhledávání a sledování

!!! warning "Tato nastavení mohou přidat zpoplatněné zdroje"

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

Změny v infrastruktuře vyžadují provisioning; samotný `azd deploy` pouze nasazuje aplikační služby. Pro indexování vyhledávání a podporované možnosti vyhledávání podle [průvodce AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Pro monitoring podle [průvodce observability](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Nepovolujte zachytávání obsahu výzev/odpovědí na skutečných zákaznických datech bez požadovaného souhlasu, přístupových kontrol, politiky uchování a redakce.

## 5. Existující zdroje a CI/CD

Pro opětovné použití projektu Foundry postupujte podle [pokynů pro existující zdroje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) vzorku. Nastavení `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` změní cestu nasazení; v tomto scénáři šablona nevytváří Application Insights ani AI Search. Explicite ověřte závislosti, role a nasazení modelů.

Sekce `pipeline.variables` řídí hodnoty předávané generovanému pipeline; není to uložiště tajemství a nevytváří zdroje Azure. V aplikaci preferujte spravovanou identitu a pro CI/CD OIDC. Soubory prostředí AZD jsou v prostém textu a neměly by se ukládat do verzovacího systému.

AZD podporuje import důvěryhodného, lokálně připraveného dotenv souboru:

```bash
azd env set --file .env
```

Přezkoumejte soubor před jeho importem a nezobrazujte soubory s tajnými proměnnými v sdílených terminálech nebo v logech CI.

## 6. Ověřte své porozumění

- Která služba `azure.yaml` nasazuje aplikaci?
- Který infrastrukturní parametr spotřebovává každou změněnou hodnotu?
- Které změny vyžadují provisioning a ne pouze nasazení?
- Podporoval vybraný region a předplatné model a kvótu?
- Prošly všechny nastavené háčky úspěšně a můžete ověřit chování nasazené aplikace?

Pokračujte na [Přizpůsobení šablony](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->