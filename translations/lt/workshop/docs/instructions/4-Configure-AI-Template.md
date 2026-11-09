# 4. Konfigūruokite Šabloną

!!! tip "MODULIO PABAIGOJE SUKURSITE SU GALIĄ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Pradėkite nuo tikrojo šablono

Atidarykite [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) savo inicijuotame saugykloje. Pirmaujančio šablono versija gali keistis nepriklausomai nuo šio seminaro. Šis **ištraukas** buvo patikrintas 2026 m. lapkričio 4 d.; jis nėra visiško failo pakaitalas:

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

- `name` identifikuoja AZD projektą; `metadata.template` įrašo šablono versiją.
- `requiredVersions.azd` yra šablono minimumas, o ne rekomendacija naudoti seną CLI. Naudokite dabartinę palaikomą AZD versiją.
- `services` apibrėžia programėlės diegimo tikslus. Šis šablonas diegia savo Python API ir frontend kaip vieną Container Apps paslaugą.
- `project` yra susijęs su `azure.yaml`.
- `remoteBuild` prašo nuotolinio konteinerio sudarymo. Jūsų tapatybė vis dar turi turėti reikiamas Azure teises.

Šablono Bicep failai po `infra/`, o ne vien tik `services` sąrašas, deklaruoja išteklius, tokius kaip Microsoft Foundry, modelių diegimai, saugykla ir pasirenkama AI Search.

## 2. Supraskite gyvenimo ciklo kablius

Prieš paleisdami šabloną, peržiūrėkite `hooks` skyrių ir nurodytus scenarijus. Peržiūrėtoje versijoje yra:

| Kabliukas | Paskirtis | Svarbus elgesys |
|----------|-----------|-----------------|
| `preup` | Patikrinti šablono aplinkos įvestis prieš `up` darbo eigą | Platformai būdingi apvalkalo scenarijai gali sustabdyti darbo eigą, jei nepavyksta |
| `postdeploy` | Vykdyti šablono specifinę konfigūraciją po programėlės diegimo | Patikrinkite `continueOnError` ir scenarijaus išvestį; sėkmingas diegimas nereiškia, kad visi konfigūracijos darbai pavyko |

Šioje versijoje **nėra** senojo `postprovision` / `write_env` kablio, rodyto ankstesnio seminaro medžiagoje. Nekopijuokite kablio nuorodų į neegzistuojančius scenarijus.

Kablių raktai pasirenka gyvenimo ciklo įvykius; `posix` ir `windows` pasirenka platformos įgyvendinimus. `shell`, `run`, `interactive` ir `continueOnError` valdo vykdymą. Tai yra vykdomieji scenarijai su jūsų leidimais, todėl peržiūrėkite juos taip pat atidžiai kaip programėlės kodą.

Peržiūrėkite [AZD kablių dokumentaciją](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) dėl pilno gyvenimo ciklo.

## 3. Sekite aplinkos įvestis į infrastruktūrą

Paleiskite šias komandas inicializuotoje pavyzdžio saugykloje:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Peržiūrėkite `infra/main.parameters.json`, kad pamatytumėte, kuriuos aplinkos kintamuosius šablonas tikrai naudoja. Atsitiktinės reikšmės nustatymas su `azd env set` automatiškai nekeičia Azure ištekliaus.

Peržiūrėti numatytieji parametrai apima:

| Įvestis | Numatytoji / paskirtis |
|---------|-----------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kvotos vienetai priklauso nuo modelio ir diegimo tipo |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; palikite išjungtą, nebent buvo peržiūrėtas duomenų tvarkymas |

Tai yra pavyzdžiui specifiniai įėjimai, o ne globalūs AZD nustatymai. Pasitikrinkite [modelio ir regiono palaikymo dokumentaciją](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) bei savo prenumeratos kvotą prieš pasirinkdami modelį, SKU, talpą ar vietą. Neklaidinkite kiekvieno talpos vieneto kaip 1 000 žetonų per minutę.

Norėdami pasirinkti kitą pokalbių modelį, atnaujinkite jo suderinamą **vardą, versiją, formatą, SKU ir talpą kartu**, laikantis [pavyzdžio pritaikymo vadovo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Tik pakeitus vardą gali likti nesuderinama versija ar diegimo tipas.

## 4. Užduotis: įjunkite pasirenkamą paiešką ir sekimą

!!! warning "Šie nustatymai gali pridėti mokamų išteklių"

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

Infrastruktūros pakeitimams reikia aprovisionavimo; `azd deploy` pats tik diegia programėlių paslaugas. Paieškos indeksavimui ir palaikomoms paieškos galimybėms laikykitės [AI Search vadovo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Stebėsenai laikykitės [stebėjimo vadovo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Neįjunkite užklausų/atsakymų turinio fiksavimo su tikrais klientų duomenimis be reikiamo sutikimo, prieigos kontrolės, duomenų saugojimo politikos ir raudakcijos.

## 5. Esami ištekliai ir CI/CD

Norėdami pakartotinai naudoti Foundry projektą, laikykitės pavyzdžio [esamų išteklių instrukcijų](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Nustatymas `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` keičia diegimo kelią; tokiu atveju šablonas jums nesukuria Application Insights ar AI Search. Aiškiai patikrinkite priklausomybes, vaidmenų priskyrimus ir modelių diegimus.

`pipeline.variables` skyrius valdo reikšmes, perduodamas sugeneruotam pipeline'ui; tai nėra slaptažodžių saugykla ir nesukuria Azure išteklių. Rinkitės valdomą tapatybę programėlėje ir OIDC CI/CD. AZD aplinkos failai yra nešifruoti tekstai ir neturėtų būti įkeliami į saugyklas.

AZD palaiko patikimo, vietoje paruošto dotenv failo importavimą:

```bash
azd env set --file .env
```

Prieš importuodami peržiūrėkite tą failą ir nespausdinkite slaptų aplinkos failų bendrinamuose terminaluose ar CI žurnaluose.

## 6. Patikrinkite savo supratimą

- Kuris `azure.yaml` servisas diegia programėlę?
- Koks infrastruktūros parametras naudoja kiekvieną pakeistą reikšmę?
- Kurie pakeitimai reikalauja aprovisionavimo, o ne tik diegimo?
- Ar pasirinktas regionas ir prenumerata palaikė modelį ir kvotą?
- Ar visi konfigūracijos kabliai sėkmingi, ir ar galite patikrinti diegtos programėlės elgesį?

Toliau eikite į [Customizuoti šabloną](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->