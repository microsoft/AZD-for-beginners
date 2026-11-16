# AI Workshop Lab: AI megoldásaid AZD-ben való telepíthetősége

**Fejezeti navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [AI működésbe helyezés legjobb gyakorlatai](../chapter-08-production/production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Workshop áttekintése

Ez a gyakorlati labor átvezeti a fejlesztőket egy meglévő AI sablon használatán és az Azure Developer CLI-vel (AZD) történő telepítésen keresztül. Megtanulod a Microsoft Foundry szolgáltatások segítségével végzett termelési AI telepítések alapvető mintáit.

> **Kiadás áttekintése (2026-11-04):** Az AZD parancs útmutatásait és a minta konfigurációs neveket ellenőriztük a `azd` `1.37.2` kiadásával és a kapcsolódó minta aktuális konfigurációjával. Ez dokumentációs ellenőrzés, nem élő telepítés validációja. A RAG lab nem igényli az agent bővítményt; agent értékelésekhez külön `azure.ai.evaluations` kiterjesztést és [aktuális értékelési munkafolyamatot](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) használj, ne a hagyományos agent értékelési parancsokat.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Azure alapok ismerete, AI/ML fogalmakban jártaság

## 🎓 Tanulási célok

A workshop végére képes leszel:
- ✅ Megvizsgálni egy meglévő AI AZD sablont és megtervezni a saját alkalmazásod átalakítását
- ✅ Konfigurálni Microsoft Foundry szolgáltatásokat AZD-vel
- ✅ Biztonságos hitelesítő adatok kezelését megvalósítani AI szolgáltatásokhoz
- ✅ Telepíteni egy AI referenciális alkalmazást monitorozással
- ✅ Hibakeresni gyakori AI telepítési problémákat

## Előfeltételek

### Szükséges eszközök
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) telepítve
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) telepítve
- [Git](https://git-scm.com/) telepítve
- Kódszerkesztő (VS Code ajánlott)

Ezek a parancsblokkok Bash szintaxist használnak (beleértve a sorfolytatásokat és `grep`). Windowson Git Bash/WSL használata vagy PowerShell-re fordítás javasolt. Telepítsd továbbá a mintában szereplő nyelv, csomagkezelő és konténer eszközöket a [minta helyi környezet beállítása](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) alapján.

### Azure erőforrások
- Azure előfizetés, amellyel erőforrás-telepítési és szerepkör-hozzárendelési jogosultságok vannak (önmagában a Contributor nem képes RBAC hozzárendeléseket létrehozni; használj engedélyezett szerepkör adminisztrátort vagy a minta dokumentált megfelelőjét)
- Hozzáférés a Microsoft Foundry Modellek szolgáltatásokhoz (vagy kérd hozzáférést)
- Erőforráscsoport létrehozásához jogosultság

### Tudás előfeltételek
- Azure szolgáltatások alapvető ismerete
- Parancssoros felületek ismerete
- AI/ML alapfogalmak (API-k, modellek, promptok)

## Labor beállítása

### 1. lépés: Környezet előkészítése

1. **Ellenőrizd az eszközök telepítését:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Ha több bérlővel dolgozol, vagy az előfizetésed nem észlelhető automatikusan, próbáld újra `azd auth login --tenant-id <tenant-id>` használatával.

2. **Klónozd a workshop tárolóját:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. modul: AZD szerkezet megértése AI alkalmazásokhoz

### AI AZD sablon anatómiája

Ismerd meg egy AI-kész AZD sablon kulcsfontosságú fájljait:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

A kicsomagolt minta változhat; `.azure/` környezeti inicializáció után jelenik meg, nem feltétlenül friss klónban. Vizsgáld meg a tényleges kicsomagolást a hiányzó könyvtárak létrehozása helyett, hogy megfelelj ennek az ábrának.

### **Labor gyakorlat 1.1: Konfiguráció feltérképezése**

1. **Nézd át az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Mit keress:**
- AI komponensek szolgáltatásdefiníciói
- Környezeti változók leképezése
- Host konfigurációk

2. **Tekintsd át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Fontos AI minták:**
- Microsoft Foundry Modellek szolgáltatás előkészítése
- Azure AI Search integráció
- Biztonságos kulcskezelés
- Hálózati biztonsági beállítások

### **Megbeszélési pont:** Miért fontosak ezek a minták az AI számára

- **Szolgáltatásfüggőségek**: AI alkalmazások több koordinált szolgáltatást igényelnek
- **Biztonság**: API kulcsokat és végpontokat védeni kell
- **Skálázhatóság**: Az AI feladatok egyedi skálázási igényei vannak
- **Költségkezelés**: AI szolgáltatások drágák lehetnek, ha nem megfelelően vannak beállítva

## 2. modul: Telepítsd első AI alkalmazásodat

### 2.1 lépés: Környezet inicializálása

1. **Hozz létre új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Állítsd be a szükséges paramétereket:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### 2.2 lépés: Infrastruktúra és alkalmazás telepítése

1. **Telepítés AZD-vel:**
```bash
azd up
```

**Mi történik az `azd up` alatt:**
- ✅ Microsoft Foundry Modellek szolgáltatás előkészítése
- ✅ Azure AI Search szolgáltatás létrehozása
- ✅ Azure Container Apps beállítása backendnek és beépített frontendnek (a minta alapértelmezettje)
- ✅ Hálózat és biztonság konfigurálása
- ✅ Alkalmazáskód telepítése
- ✅ Monitorozás és naplózás beállítása

2. **Kövesd a telepítés előrehaladását** és jegyezd meg az készült erőforrásokat.

### 2.3 lépés: Ellenőrizd a telepítést

1. **Vizsgáld meg a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyisd meg az alkalmazást:**
```bash
azd show
```

Nyisd meg a webes végpontot a `azd show` kimenetben.

3. **Teszteld az AI funkciókat:**
   - Navigálj a webalkalmazáshoz
   - Próbálj ki mintakérdéseket
   - Ellenőrizd, hogy az AI válaszok működnek-e

### **Labor gyakorlat 2.1: Hibakeresési gyakorlat**

**Eszkaláció:** A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori problémák ellenőrzése:**
1. **Hitelesítés**: Ellenőrizd az Managed Identity-t és a szerepkör-hozzárendeléseket; API kulcsokat csak akkor ellenőrizz, ha szándékosan engedélyezted kulcs alapú hitelesítést
2. **Modell elérhetőség**: Nézd meg, támogatja-e a régiód a modellt
3. **Hálózati kapcsolódás**: Győződj meg róla, hogy a szolgáltatások kommunikálnak
4. **RBAC jogosultságok**: Ellenőrizd, hogy az alkalmazás hozzáfér az OpenAI-hoz

**Hibakeresési parancsok:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. modul: AI alkalmazások testreszabása az igényekhez

### 3.1 lépés: AI konfiguráció módosítása

1. **Frissítsd az OpenAI modellt:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Adj hozzá további AI szolgáltatásokat:**

Szerkeszd az `infra/main.bicep`-t a Document Intelligence hozzáadásához:

A következő csak egy illusztratív részlet, nem teljes sablon. A minta már előkészítheti a dokumentumfeldolgozó szolgáltatásokat: nézd meg a jelenlegi infrastruktúrát, mielőtt duplikált erőforrásokat adnál hozzá. Egyedi bővítésekhez kimenetek, identitások és alkalmazáskonfiguráció összekapcsolása szükséges.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### 3.2 lépés: Környezet-specifikus konfigurációk

**Legjobb gyakorlat**: Különböző konfigurációk fejlesztési és termelési környezetekhez.

1. **Hozz létre termelési környezetet:**
```bash
azd env new myai-production
```

2. **Állítsd be a termelés-specifikus paramétereket:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Ezek a nevek a minta [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) fájljából származnak. Az `azd env set` tárol egy értéket, de nem tesz egy változót automatikusan hatékonnyá: a sablonnak fel kell használnia azt. Nézd át a minta [hálózati izolációs útmutatóját](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) a nyilvános hozzáférés letiltása előtt, és használd az `azd up`-et az infrastruktúra módosítások alkalmazásához. Az OpenAI SKU `S0` önmagában nem határozza meg a modell áteresztőképességét; a modell telepítés típusa és kapacitása is számít.

### **Labor gyakorlat 3.1: Költségoptimalizálás**

**Kihívás:** Konfiguráld a sablont költséghatékony fejlesztéshez.

**Feladatok:**
1. Válaszd ki az eldobható workshop környezetet: `azd env select myai-workshop`.
2. Jegyezd fel a jelenlegi Search SKU-t és modell kapacitást az `infra/main.parameters.json` és a kiválasztott környezet alapján.
3. Használd az alábbi támogatott bemeneteket, miután megerősítetted a modell/régió kvótát:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Ellenőrizd a Search SKU-t és a telepítési kapacitást a portálon, becsüld meg a különbséget az árkalkulátorral. Ne várd el, hogy a számlázási adatok azonnal frissülnek.

**Siker kritériumok:** A Search Basic-t használ, a chat telepítés a kért támogatott kapacitással rendelkezik, és az app még mindig válaszol egy mintakérdésre. A kapacitás `10` sebességkorlát hozzárendelés, nem token árengedmény. A Search szint változtatások korlátozottak lehetnek vagy újraalkotást igényelnek; ne kísérletezz termelési erőforrásokon. Az F0 egy szolgáltatás-specifikus szint, nem Azure OpenAI modell SKU.

## 4. modul: Biztonság és termelési legjobb gyakorlatok

### 4.1 lépés: Biztonságos hitelesítő adat-kezelés

**Jelenlegi probléma:** Sok AI alkalmazás keménykódolt API kulcsokat vagy nem biztonságos tárolást használ.

**AZD megoldás:** Kezelt identitás + Key Vault integráció.

1. **Nézd át a biztonsági konfigurációt a sablonodban:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizd, hogy a Kezelt Identitás működik-e:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### 4.2 lépés: Hálózati biztonság

1. **Engedélyezd a privát végpontokat** a minta támogatott hálózati konfigurációja szerint (ha még nincs beállítva).

Saját sablonod esetén ez az illusztratív részlet az OpenAI végpont csatlakozást mutatja. Ehhez szükséges még egy VNet, privát DNS beállítás és alkalmazás kapcsolódás; ne illeszd be változtatás nélkül a minta kódba, amelynek már vannak privát végpont moduljai:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### 4.3 lépés: Monitorozás és megfigyelhetőség

1. **Konfiguráld az Application Insights-ot:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Kapcsold be a minta Application Insights integrációját:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

A minta instrumentációja telemetriát küld; egy tetszőleges `OPENAI_MONITOR_ENABLED` beállítás nem engedélyezi az AI metrikákat. Vizsgáld meg a trace-ket modellhívások, késleltetés, hibák és token-felhasználás szerint, és kerüld a érzékeny promptok vagy válaszok naplózását.

### **Labor gyakorlat 4.1: Biztonsági audit**

**Feladat:** Vizsgáld át a telepítésed biztonsági legjobb gyakorlatait.

**Ellenőrző lista:**
- [ ] Nincsenek keménykódolt titkok kódban vagy konfigurációban
- [ ] Szolgáltatásközi hitelesítéshez Kezelt Identitás használata
- [ ] Key Vault tárol érzékeny konfigurációkat
- [ ] Hálózati hozzáférés megfelelően korlátozva
- [ ] Monitorozás és naplózás engedélyezve

## 5. modul: Saját AI alkalmazás konvertálása

### 5.1 lépés: Értékelő munkalap

**Alkalmazásod átalakítása előtt válaszolj ezekre a kérdésekre:**

1. **Alkalmazás architektúrája:**
   - Milyen AI szolgáltatásokat használ az alkalmazásod?
   - Milyen számítási erőforrásokat igényel?
   - Szüksége van-e adatbázisra?
   - Mik a szolgáltatások közötti függőségek?

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokat kezel az alkalmazás?
   - Milyen megfelelőségi követelmények vannak?
   - Szükséges privát hálózat?

3. **Skálázási követelmények:**
   - Mekkora terhelést vársz?
   - Szükséges automatikus skálázás?
   - Vannak regionális követelmények?

### 5.2 lépés: Hozd létre AZD sablonod

**Kövesd ezt a mintát az alkalmazás konvertálásához:**

**Csak keret:** Ez a rész nem tartalmaz API/webalkalmazás forráskódot, host infrastruktúrát, modell telepítéseket, identitás/RBAC-t vagy kész `main.parameters.json`-t. Az erőforráscsoport szintű Bicep modulkompozíciót illusztrál; egy tipikus AZD előfizetés szintű belépési pontnak erőforráscsoportot kell létrehoznia és azt meghívnia azon a szinten. Ne várd, hogy `azd up` teljes alkalmazást telepít, ha csak ezeket a részleteket másoltad. Futó alapnak használd továbbra is az 1. modul RAG sablonját.

1. **Hozd létre az alapstruktúrát:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Készítsd el az azure.yaml-t:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Készíts infrastuktúra sablonokat:**

**infra/main.bicep** - Fő sablon:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI modul:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Labor gyakorlat 5.1: Sablon-készítési kihívás**

**Kihívás:** Készíts AZD sablont dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**
- Microsoft Foundry Modellek tartalom elemzéshez
- Document Intelligence OCR-hez
- Tároló fiók dokumentum feltöltésekhez
- Funkció alkalmazás feldolgozó logikához
- Webes alkalmazás felhasználói felülethez

**Bónusz pontok:**
- Helyes hibakezelés hozzáadása
- Költségbecslés mellékelése
- Monitorozási dashboardok kialakítása

## 6. modul: Gyakori problémák hibakeresése

### Gyakori telepítési problémák

#### Probléma 1: OpenAI szolgáltatás kvóta túllépve
**Tünetek:** A telepítés kvóta hibával meghiúsul
**Megoldások:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Probléma 2: Modell nem elérhető a régióban
**Tünetek:** AI válaszok hibák vagy modell telepítés hibák
**Megoldások:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Probléma 3: Jogosultsági problémák
**Tünetek:** 403 Forbidden hibák AI szolgáltatás hívásakor
**Megoldások:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Teljesítmény problémák

#### Probléma 4: Lassú AI válaszok
**Vizsgálati lépések:**
1. Nézd meg az Application Insights teljesítmény mutatóit
2. Vizsgáld meg az OpenAI szolgáltatás mutatókat az Azure portálon
3. Ellenőrizd a hálózati kapcsolatot és késleltetést

**Megoldások:**
- Általános lekérdezésekhez cache bevezetése
- Használj az esetedhez illeszkedő OpenAI modellt
- Skálázd az alkalmazás példányokat csak a modell RPM/TPM limit ellenőrzése után; az Azure OpenAI telepítések nem tesznek elérhetővé általános adatbázis-stílusú "read replica" beállítást

### **Labor gyakorlat 6.1: Hibakeresési kihívás**

**Eszkaláció:** A telepítés sikeres volt, de az alkalmazás 500 hibával válaszol.

**Hibakeresési feladatok:**
1. Ellenőrizd az alkalmazás naplóit
2. Nézd meg a szolgáltatás kapcsolatot
3. Hitelesítés tesztelése
4. Konfiguráció áttekintése

**Használható eszközök:**
- `azd show` a telepítés áttekintéséhez
- Azure portál a részletes szolgáltatási naplókhoz
- Application Insights az alkalmazás telemetriájához

## 7. modul: Felügyelet és optimalizálás

### 7.1 lépés: Átfogó felügyelet beállítása

1. **Egyedi műszerfalak létrehozása:**

Lépj az Azure portálra, és hozz létre a következőket tartalmazó műszerfalat:
- OpenAI kérés szám és késleltetés
- Alkalmazás hibaarányai
- Erőforrás kihasználtság
- Költségkövetés

2. **Riasztások beállítása:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Ellenőrizd, hogy a komponens kibocsátja-e a kérés telemetriát, és ha szükséges, adj hozzá műveletcsoportot az értesítésekhez. A metrika egy számlálás, nem hibaarány; egy riasztáshoz megfelelő lekérdezés és nevező kell.

### 7.2 lépés: Költségoptimalizálás

1. **Aktuális költségek elemzése:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Cseréld ki a dátum helyőrzőket. A fogyasztási API támogatás az elszámolási megállapodástól függ; ha nem elérhető a felhasználási adat, használd a portálon a Költségkezelést. A költségek késve jelennek meg, nem valós idejű tesztadatok.

2. **Költségkontrollok bevezetése:**
- Költségkeret riasztások beállítása
- Autoscaling szabályok használata
- Kérések gyorsítótárazása
- OpenAI tokenhasználat figyelése

### **Labor gyakorlat 7.1: Teljesítmény optimalizálás**

**Feladat**: Optimalizáld az AI alkalmazásodat mind teljesítmény, mind költség szempontjából.

**Fejlesztendő mutatók:**
- Átlagos válaszidő 20%-os csökkentése
- Havi költségek 15%-os csökkentése
- 99,9%-os rendelkezésre állási SLO és mérési időablak definiálása (egy rövid labor nem képes havi rendelkezésre állást bemutatni)

**Próbálkozási stratégiák:**
- Válaszok gyorsítótárazásának bevezetése
- Tokenhatékony promptok optimalizálása
- Megfelelő számítási SKU-k használata
- Megfelelő autoscaling beállítása

## Záró kihívás: Teljes körű megvalósítás

### Kihívás forgatókönyv

Ez egy **választható architektúra/dizájn kihívás**, nem futtatható feladat vagy termelési minősítés. Javasolj egy AI-val vezérelt ügyfélszolgálati chatbotot, és dokumentáld, mely követelmények igényelnek további megvalósítást és bizonyítékot:

**Funkcionális követelmények:**
- Webes felület az ügyfél interakciókhoz
- Integráció a Microsoft Foundry modellekkel válaszadásra
- Dokumentumkeresési képesség Azure AI Search segítségével
- Integráció meglévő ügyféladatbázissal
- Többnyelvű támogatás

**Nem-funkcionális követelmények:**
- 1000 egyidejű felhasználó kezelése
- 99,9%-os rendelkezésre állási SLA
- SOC 2 megfelelőség
- Havonta 500 dollár alatti költség
- Több környezetben való telepítés (fejlesztő, staging, éles)

Ezek elméleti érintetti korlátok, nem egyidejűleg garantált eredmények. A költségek becslése előtt definiáld a kérés-sebességet, prompt/kimenet méreteket és munkamenet hosszát; az 1000 egyidejű felhasználó nem tesz bizonyossá egy terhelésről vagy a 500 dolláros költségkeretről. A SOC 2 egy szervezeti audit eredménye, nem csak egy AZD sablon kapcsolója. Azonosítsd a kompromisszumokat, és bizonyítékkal utasítsd el a megvalósíthatatlan követelményeket.

### Megvalósítási lépések

1. **Tervezd meg az architektúrát**
2. **Hozd létre az AZD sablont**
3. **Valósítsd meg a biztonsági intézkedéseket**
4. **Állítsd be a felügyeletet és riasztásokat**
5. **Hozz létre telepítési folyamatokat**
6. **Dokumentáld megoldást**

### Értékelési szempontok

- ✅ **Funkcionalitás**: Bemutatottak-e a megvalósított képességek, világosak-e a hiányosságok?
- ✅ **Biztonság**: Alkalmazzák-e a legjobb gyakorlatokat?
- ✅ **Skálázhatóság**: Képes kezelni a terhelést?
- ✅ **Karbantarthatóság**: Rendezett a kód és az infrastruktúra?
- ✅ **Költség**: Betartja-e a költségkeretet?

## További források

### Microsoft dokumentáció
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models szolgáltatás dokumentáció](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

### Mintasablonok
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App gyorsindítás](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Közösségi források
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Királ AZD sablonok](https://azure.github.io/awesome-azd/)

## 🎓 Teljesítési mérföldkő

Gratulálunk! Befejezted az AI Workshop Labot. Most már képes vagy:

- ✅ Megmagyarázni, hogyan kell meglévő AI alkalmazást egy AZD sablonhoz igazítani
- ✅ Telepíteni és tesztelni egy AI referenciaalkalmazást
- ✅ Biztonsági legjobb gyakorlatokat megvalósítani AI terhelésekhez
- ✅ Felügyelni és optimalizálni az AI alkalmazás teljesítményét
- ✅ Hibakeresni a gyakori telepítési problémákat

**Takarítás:** Futtasd a `azd env list` parancsot, válaszd ki a labor során létrehozott minden eldobható környezetet (`myai-workshop`, és ha telepítve van `myai-production`/`myai-quota-test`), majd futtasd a `azd down`-t mindegyiken. Vizsgáld át a törlési tervet; a környezet helyi konfigurációjának törlése önmagában nem törli az Azure erőforrásokat. Kerüld a `--purge` használatát, hacsak nem érted a visszafordíthatatlan puha törléses erőforrástörlést.

### Következő lépések
1. Alkalmazd ezeket a mintákat saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösségnek
3. Csatlakozz a Microsoft Foundry Discord közösséghez folyamatos támogatásért
4. Fedezd fel a fejlett témákat, például a több régiós telepítéseket

---

**Workshop visszajelzés**: Segíts nekünk javítani ezt a workshopot, oszd meg tapasztalataidat a [Microsoft Foundry Discord #Azure csatornában](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Tanfolyam főoldal**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítés](ai-model-deployment.md)
- **➡️ Következő**: [Termelési AI legjobb gyakorlatok](../chapter-08-production/production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és AZD, AI telepítési vitákért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->