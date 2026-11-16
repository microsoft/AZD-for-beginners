# 4. Konfigurirajte predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Započnite s stvarnim predloškom

Otvorite [`azure.yaml` u Započnite s AI agentima](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) u repozitoriju koji ste inicijalizirali. Izvorni predložak može se neovisno mijenjati u odnosu na ovaj radionički materijal. Sljedeći **izvadak** je provjeren 4. studenoga 2026.; nije zamjena za cjelovitu datoteku:

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

- `name` identificira AZD projekt; `metadata.template` evidentira verziju predloška.
- `requiredVersions.azd` je minimalni zahtjev predloška, a ne preporuka za ostanak na starom CLI-ju. Koristite trenutačno podržanu AZD verziju.
- `services` definira ciljeve za implementaciju aplikacije. Ovaj predložak implementira svoj Python API i frontend kao jednu Container Apps uslugu.
- `project` je relativan u odnosu na `azure.yaml`.
- `remoteBuild` zahtijeva daljinsku izgradnju kontejnera. Vaš identitet još uvijek treba odgovarajuće Azure dozvole.

Bicep datoteke predloška pod `infra/`, a ne samo lista `services`, deklamiraju resurse poput Microsoft Foundry, implementacije modela, skladišta i opcionalnog AI pretraživanja.

## 2. Razumite lifecycle hooks

Pregledajte `hooks` odjeljak i skripte na koje se poziva prije pokretanja predloška. Pregledana verzija sadrži:

| Hook | Svrha | Važno ponašanje |
|------|---------|--------------------|
| `preup` | Provjerava unosne varijable okruženja predloška prije `up` workflowa | Platformski specifične shell skripte mogu zaustaviti workflow u slučaju greške |
| `postdeploy` | Pokreće specifično postavljanje predloška nakon implementacije aplikacije | Pregledajte `continueOnError` i ispis skripte; uspješna implementacija ne dokazuje da su svi zadaci postavljanja uspješno izvršeni |

Ova verzija **ne** sadrži starije `postprovision` / `write_env` hookove prikazane u ranijem materijalu radionice. Nemojte kopirati referencije hookova na skripte koje više ne postoje.

Ključevi hookova biraju lifecycle događaje; `posix` i `windows` biraju implementacije platforme. `shell`, `run`, `interactive` i `continueOnError` kontroliraju izvršavanje. To su izvršne skripte s vašim dozvolama, stoga ih pregledajte kao što biste pregledali kod aplikacije.

Pogledajte [AZD hooks dokumentaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) za potpuni lifecycle.

## 3. Pratite unose okruženja do infrastrukture

Pokrenite ove naredbe u inicijaliziranom uzorku repozitorija:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Pregledajte `infra/main.parameters.json` da vidite koje varijable okruženja predložak zapravo koristi. Postavljanje proizvoljnog imena s `azd env set` ne mijenja automatski Azure resurs.

Pregledani zadani su:

| Ulaz | Zadano / svrha |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; jedinice kvote ovise o modelu i tipu implementacije |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; ostavite onemogućeno osim ako pregled obrade podataka nije izvršen |

Ovo su specifikacije za pojedine uzorke, a ne globalne AZD postavke. Provjerite [dokumentaciju o podršci modela i regije](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) i kvotu pretplate prije odabira modela, SKU-a, kapaciteta ili lokacije. Nemojte tumačiti svaku jedinicu kapaciteta kao 1000 tokena u minuti.

Da biste odabrali drugi chat model, ažurirajte kompatibilno **ime, verziju, format, SKU i kapacitet zajedno**, slijedeći [vodič za prilagodbu uzorka](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Promjena samo imena može ostaviti nekompatibilnu verziju ili tip implementacije.

## 4. Laboratorij: omogućite opcionalno pretraživanje i praćenje

!!! upozorenje "Ove postavke mogu dodati naplatne resurse"

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

Infrastrukturne promjene zahtijevaju provisioning; samo `azd deploy` implementira usluge aplikacije. Za indeksiranje pretraživanja i podržane opcije dohvaćanja, slijedite [vodič za AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Za nadzor, slijedite [vodič za observability](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Ne omogućujte snimanje sadržaja upita/odgovora nad stvarnim podacima korisnika bez potrebnih dozvola, kontrola pristupa, politike zadržavanja i redactiranja.

## 5. Postojeći resursi i CI/CD

Za ponovno korištenje Foundry projekta, slijedite upute [za postojeće resurse](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) u uzorku. Postavljanje `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` mijenja put implementacije; u tom slučaju predložak neće za vas kreirati Application Insights ili AI Search. Izričito provjerite ovisnosti, dodjele uloga i implementacije modela.

`pipeline.variables` odjeljak kontrolira vrijednosti proslijeđene u generirani pipeline; nije spremište tajni i ne kreira Azure resurse. Preferirajte upravljani identitet u aplikaciji i OIDC za CI/CD. AZD datoteke okruženja su običan tekst i ne bi se trebale dodavati u repozitorij.

AZD podržava uvoz pouzdane, lokalno pripremljene dotenv datoteke:

```bash
azd env set --file .env
```

Pregledajte tu datoteku prije uvoza, i nemojte ispisivati datoteke okruženja koje sadrže tajne u zajedničkim terminalima ili CI zapisima.

## 6. Provjerite svoje razumijevanje

- Koja `azure.yaml` usluga implementira aplikaciju?
- Koji infrastrukturni parametar koristi svaku vrijednost koju ste promijenili?
- Koje promjene zahtijevaju provisioning, a ne samo implementaciju?
- Podržava li odabrana regija i pretplata model i kvotu?
- Jesu li svi setup hookovi uspješno izvršeni i možete li provjeriti ponašanje implementirane aplikacije?

Nastavite na [Prilagodba predloška](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->