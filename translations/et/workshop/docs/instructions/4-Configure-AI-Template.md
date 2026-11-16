# 4. Konfigureeri mall

!!! tip "SELLE MOODULI LÕPUS OMA OLEVAD SUL VÕIMALUSED"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Alusta tegelikust mallist

Ava [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) hoidlas, mille sa algatasid. Ülemall võib sõltumatult sellest töötoast muutuda. Järgmine **katkend** kontrolliti 4. novembril 2026; see ei asenda kogu faili:

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

- `name` tuvastab AZD projekti; `metadata.template` salvestab malli versiooni.
- `requiredVersions.azd` on malli minimaalne tugi, mitte soovitus vana CLI-ga jätkamiseks. Kasuta uuemat toetatud AZD versiooni.
- `services` määrab rakenduse juurutamise sihtmärgid. See mall juurutab oma Python API ja frontendi ühe Container Apps teenusena.
- `project` on suhteline suhtega `azure.yaml`.
- `remoteBuild` taotleb külgserveri konteineri ehitamist. Sinu identiteedil peavad siiski olema vajalikud Azure õigused.

Malle Bicep failid kaustas `infra/`, mitte ainult `services` loend, deklareerivad ressursse nagu Microsoft Foundry, mudelijuhtumid, salvestus ja valikuline AI Search.

## 2. Sõltuvuste mõistmine elutsüklis

Kontrolli `hooks` ja selle viidatud skripte enne malli käivitamist. Läbitud versioon sisaldab:

| Käepide | Eesmärk | Oluline käitumine |
|------|---------|--------------------|
| `preup` | Kontrolli malli keskkonna sisendeid enne `up` töövoogu | Platvormisõltuvad shell-skriptid võivad töövoo nurjata ebaõnnestumisel |
| `postdeploy` | Käivita mallispetsiifiline häälestus pärast rakenduse juurutamist | Kontrolli `continueOnError` ja skripti väljundit; edukas juurutamine ei tõenda, et kõik häälestustööd õnnestusid |

See versioon **ei sisalda** vanemat `postprovision` / `write_env` käepidet, mis oli varasemates töötoa materjalides. Ära kopeeri viiteid skriptidele, mis enam ei eksisteeri.

Käepide võtmed valivad elutsükli sündmused; `posix` ja `windows` valivad platvormi rakendused. `shell`, `run`, `interactive` ja `continueOnError` juhivad täitmist. Need on täidetavad skriptid sinu õigustega, seega vaata neid üle nagu rakenduse koodi.

Vaata täispikka elutsüklit [AZD hooks documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility).

## 3. Jälgi keskkonna sisendeid infrastruktuuri

Käivita need käsud algatatud näidishoones:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Kontrolli `infra/main.parameters.json`, et näha, milliseid keskkonnamuutujaid mall tegelikult kasutab. Suvalise nime määramine `azd env set` ei muuda automaatselt Azure ressurssi.

Läbitud vaikeväärtused hõlmavad:

| Sisend | Vaikeväärtus / eesmärk |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvotaühikud sõltuvad mudelist ja juurutustüübist |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; jäta keelatuks, kui andmete töötlemine ei ole üle vaadatud |

Need on näidispetsiifilised sisendid, mitte globaalsed AZD seaded. Kontrolli enne mudeli, SKU, mahutavuse või asukoha valimist [mudeli ja regiooni toetuse dokumentatsiooni](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) ja oma tellimuse kvotat. Ära tõlgenda iga mahutavuse ühikut kui 1000 tokenit minutis.

Erineva vestlusmudeli valimiseks uuenda selle sobivat **nime, versiooni, formaati, SKU-d ja mahutavust koos**, järgides [näidise kohandamise juhendit](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Ainult nime muutmine võib jätta sobimatu versiooni või juurutustüübi.

## 4. Labor: lubage valikuline otsing ja jälgimine

!!! warning "Need seaded võivad lisada arvestatavaid ressursse"

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

Infrastruktuuri muudatused vajavad proviisorit; `azd deploy` ise juurutab ainult rakenduse teenuseid. Indekseerimise ja toetatud otsinguvõimaluste jaoks järgi [AI Search juhendit](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Jälgimise jaoks järgi [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Ära luba prompti/vastuse sisu kogumist päris kliendiandmetel ilma vajaliku nõusoleku, ligipääsukontrolli, säilituspoliitika ja valgevärbamiseta.

## 5. Olemasolevad ressursid ja CI/CD

Foundry projekti taaskasutamiseks järgi näidise [olemasoleva ressursi juhiseid](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` seadmine muudab juurutusraja; sel juhul mall ei loo sinu eest Application Insights ega AI Search'i. Kontrolli sõltuvusi, rollimääranguid ja mudelijuhtumeid selgesõnaliselt.

Sektsioon `pipeline.variables` kontrollib väärtusi, mis antakse genereeritud torujuhtmele; see ei ole salajane hoiukoht ega loo Azure ressursse. Eelista haldatud identiteeti rakenduses ja OIDC-d CI/CD jaoks. AZD keskkonnafailid on lihttekstis ja neid ei tohiks kohustavalt hoidlasse panna.

AZD toetab usaldusväärse, kohapeal ette valmistatud dotenv faili impordimist:

```bash
azd env set --file .env
```

Vaata fail enne selle importimist läbi ning ära väljasta salajasi keskkonnafaile jagatud terminalides või CI logides.

## 6. Kontrolli oma arusaamist

- Milline `azure.yaml` teenus juurutab rakenduse?
- Milline infrastruktuuri parameeter tarbib iga sinu muudetud väärtuse?
- Millised muudatused vajavad proviisorit, mitte ainult juurutust?
- Kas valitud regioon ja tellimus toetasid mudelit ja kvotat?
- Kas kõik häälestuskäepidemed õnnestusid ja kas saad kinnitada juurutatud rakenduse käitumist?

Jätka [Customize a Template](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->