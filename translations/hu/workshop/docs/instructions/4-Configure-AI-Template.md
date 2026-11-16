# 4. Sablon konfigurálása

!!! tip "ENNEK A MODULNAK A VÉGÉRE ENNYIT FOGSZ TUDNI"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Kezdj a tényleges sablonnal

Nyisd meg a [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) fájlt a létrehozott tárhelyen. A forrás sablon függetlenül változhat ettől a workshop-tól. A következő **kivonat** 2026. november 4-én ellenőrzött; nem helyettesíti a teljes fájlt:

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

- `name` azonosítja az AZD projektet; `metadata.template` rögzíti a sablon verzióját.
- `requiredVersions.azd` a sablon minimuma, nem javaslat egy régi CLI használatára. Használj egy aktuálisan támogatott AZD verziót.
- `services` definiálja az alkalmazás telepítési célpontjait. Ez a sablon egyetlen Container Apps szolgáltatásként telepíti a Python API-t és frontend-et.
- `project` relatív a `azure.yaml`-hoz.
- `remoteBuild` távoli konténerépítést kér. Az identitásodnak még mindig szüksége van a megfelelő Azure jogosultságokra.

A sablon Bicep fájljai a `infra/` alatt vannak, nem csak a `services` lista, amelyek Microsoft Foundry, modell telepítések, tároló és opcionális AI Search erőforrásokat deklarálnak.

## 2. Életciklus horgok megértése

Tekintsd át az `hooks` szakaszt és a hivatkozott script-eket a sablon futtatása előtt. Az ellenőrzött verzió tartalmazza:

| Horog | Cél | Fontos viselkedés |
|------|---------|--------------------|
| `preup` | Érvényesíti a sablon környezeti bemeneteit az `up` munkafolyamat előtt | Platform-specifikus shell scriptek leállíthatják a munkafolyamatot hiba esetén |
| `postdeploy` | Lefuttatja a sablon-specifikus beállítást az alkalmazás telepítése után | Tekintsd meg az `continueOnError` és a script kimenetét; a sikeres telepítés nem bizonyítja, hogy minden beállítási feladat sikeres volt |

Ez a verzió **nem** tartalmazza a korábbi `postprovision` / `write_env` horgot, amit korábbi workshop anyag mutatott. Ne másolj hivatkozásokat olyan script-ekre, amelyek már nem léteznek.

A horog kulcsok életciklus eseményeket választanak; `posix` és `windows` platform megvalósításokat választanak. `shell`, `run`, `interactive`, és `continueOnError` az végrehajtást irányítják. Ezek futtatható scriptek a te jogosultságaiddal, ezért tekintsd át őket épp úgy, mint az alkalmazáskódot.

Lásd az [AZD horgok dokumentációját](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) a teljes életciklushoz.

## 3. Kövesd a környezeti bemeneteket az infrastruktúrában

Futtasd ezeket a parancsokat a létrehozott minta tárhelyből:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Tekintsd át az `infra/main.parameters.json`-t, hogy lásd, mely környezeti változókat használja a sablon ténylegesen. Egy tetszőleges név beállítása `azd env set`-vel nem változtat automatikusan egy Azure erőforrást.

Ellenőrzött alapértelmezettek tartalmazzák:

| Bemenet | Alapértelmezett / cél |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; a kvóta egységek a modell és telepítési típus függvényében változnak |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; hagyd letiltva, hacsak az adatkezelést nem nézték át |

Ezek minta-specifikus bemenetek, nem globális AZD beállítások. Ellenőrizd a [modell és régió támogatási dokumentációját](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) és az előfizetésed kvótáját modell, SKU, kapacitás vagy hely kiválasztása előtt. Ne értelmezd minden kapacitás egységet 1,000 token/perc értékként.

Más chat modell kiválasztásához frissítsd annak kompatibilitás szerinti **nevét, verzióját, formátumát, SKU-ját és kapacitását együtt**, az [minta testreszabási útmutatójával](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Csak a név megváltoztatása inkompatibilis verziót vagy telepítési típust hagyhat hátra.

## 4. Labor: opcionális keresés és követés engedélyezése

!!! warning "Ezek a beállítások számlázható erőforrásokat adhatnak hozzá"

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

Az infrastruktúra változtatások előkészítést igényelnek; `azd deploy` önmagában csak az alkalmazás szolgáltatásokat telepíti. A kereső indexeléshez és támogatott lekérdezési opciókhoz kövesd az [AI Search útmutatót](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). A megfigyeléshez pedig a [megfigyelhetőségi útmutatót](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Ne engedélyezd prompt/válasz tartalom rögzítését valós ügyféladatokon a szükséges hozzájárulás, hozzáférés szabályozás, adatmegőrzési szabályzat és anonimizálás nélkül.

## 5. Létező erőforrások és CI/CD

Foundry projekt újrafelhasználásához kövesd a minta [létező erőforrás útmutatóját](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Az `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` beállítása megváltoztatja a telepítési útvonalat; ebben az esetben a sablon nem hoz létre Application Insights vagy AI Search szolgáltatást. Ellenőrizd kifejezetten a függőségeket, szerepkiosztásokat és modell telepítéseket.

Az `pipeline.variables` szakasz irányítja a generált pipeline-ba átadott értékeket; nem titkos tárhely és nem hoz létre Azure erőforrásokat. Előnyben részesítsd az alkalmazásban a kezelt identitást és CI/CD-hez az OIDC-t. Az AZD környezeti fájlok sima szövegek, ezért nem szabad őket feltölteni.

Az AZD támogatja egy megbízható, helyben előkészített dotenv fájl importálását:

```bash
azd env set --file .env
```

Nézd át ezt a fájlt importálás előtt, és ne jelenítsd meg titkokat tartalmazó környezeti fájlokat megosztott terminálokon vagy CI naplókban.

## 6. Ellenőrizd a megértésed

- Melyik `azure.yaml` szolgáltatás telepíti az alkalmazást?
- Melyik infrastruktúra paraméter fogyasztja az általad megváltoztatott értékeket?
- Mely változtatások igényelnek előkészítést telepítés helyett?
- A kiválasztott régió és előfizetés támogatta a modellt és kvótát?
- Sikeresek voltak az összes beállítási horog, és képes vagy ellenőrizni a telepített alkalmazás viselkedését?

Folytasd a [Sablon testreszabásával](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->