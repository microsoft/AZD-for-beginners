<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:39:32+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "hu"
}
-->
# AI Workshop Lab: AI-megoldások AZD-telepíthetővé tétele

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI Modell Telepítése](ai-model-deployment.md)
- **➡️ Következő**: [AI Gyártási Legjobb Gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)

## Workshop áttekintés

Ez a gyakorlati labor bemutatja a fejlesztőknek, hogyan lehet egy meglévő AI sablont telepíteni az Azure Developer CLI (AZD) segítségével. Megtanulhatod az alapvető mintákat az AI gyártási telepítésekhez az Azure AI Foundry szolgáltatások használatával.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alapvető Azure ismeretek, AI/ML fogalmak ismerete

## 🎓 Tanulási célok

A workshop végére képes leszel:
- ✅ Egy meglévő AI alkalmazást AZD sablonokkal átalakítani
- ✅ Az Azure AI Foundry szolgáltatásokat AZD-vel konfigurálni
- ✅ Biztonságos hitelesítési kezelést megvalósítani AI szolgáltatásokhoz
- ✅ Gyártásra kész AI alkalmazásokat telepíteni monitorozással
- ✅ Gyakori AI telepítési problémákat elhárítani

## Előfeltételek

### Szükséges eszközök
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) telepítve
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) telepítve
- [Git](https://git-scm.com/) telepítve
- Kódszerkesztő (VS Code ajánlott)

### Azure erőforrások
- Azure előfizetés hozzájárulói hozzáféréssel
- Hozzáférés az Azure OpenAI szolgáltatásokhoz (vagy hozzáférési kérelem lehetősége)
- Erőforráscsoport létrehozási jogosultságok

### Tudás előfeltételek
- Alapvető Azure szolgáltatások ismerete
- Parancssori felületek ismerete
- Alapvető AI/ML fogalmak (API-k, modellek, promptok)

## Labor beállítása

### 1. lépés: Környezet előkészítése

1. **Ellenőrizd az eszközök telepítését:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Klónozd a workshop repót:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## 1. modul: AZD struktúra megértése AI alkalmazásokhoz

### Az AI AZD sablon anatómiája

Fedezd fel az AI-kész AZD sablon kulcsfontosságú fájljait:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```


### **Lab gyakorlat 1.1: Konfiguráció felfedezése**

1. **Vizsgáld meg az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Mit keress:**
- Szolgáltatásdefiníciók AI komponensekhez
- Környezeti változók hozzárendelése
- Host konfigurációk

2. **Tekintsd át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Kulcsfontosságú AI minták azonosítása:**
- Azure OpenAI szolgáltatás előkészítése
- Cognitive Search integráció
- Biztonságos kulcskezelés
- Hálózati biztonsági konfigurációk

### **Vitaindító:** Miért fontosak ezek a minták az AI számára

- **Szolgáltatásfüggőségek**: Az AI alkalmazások gyakran több koordinált szolgáltatást igényelnek
- **Biztonság**: API kulcsok és végpontok biztonságos kezelése szükséges
- **Skálázhatóság**: Az AI munkaterhelések egyedi skálázási igényekkel rendelkeznek
- **Költségkezelés**: Az AI szolgáltatások költségesek lehetnek, ha nem megfelelően konfigurálják őket

## 2. modul: Az első AI alkalmazás telepítése

### 2.1 lépés: Környezet inicializálása

1. **Hozz létre egy új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Állítsd be a szükséges paramétereket:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### 2.2 lépés: Infrastruktúra és alkalmazás telepítése

1. **Telepítsd AZD-vel:**
```bash
azd up
```

**Mi történik az `azd up` során:**
- ✅ Azure OpenAI szolgáltatás előkészítése
- ✅ Cognitive Search szolgáltatás létrehozása
- ✅ App Service beállítása a webalkalmazáshoz
- ✅ Hálózat és biztonság konfigurálása
- ✅ Alkalmazáskód telepítése
- ✅ Monitorozás és naplózás beállítása

2. **Figyeld a telepítés előrehaladását**, és jegyezd fel a létrehozott erőforrásokat.

### 2.3 lépés: Telepítés ellenőrzése

1. **Ellenőrizd a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyisd meg a telepített alkalmazást:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Teszteld az AI funkcionalitást:**
   - Navigálj a webalkalmazásra
   - Próbálj ki mintakérdéseket
   - Ellenőrizd, hogy az AI válaszok működnek-e

### **Lab gyakorlat 2.1: Hibaelhárítás gyakorlása**

**Forgatókönyv**: A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori problémák ellenőrzése:**
1. **OpenAI API kulcsok**: Ellenőrizd, hogy helyesen vannak-e beállítva
2. **Modellek elérhetősége**: Ellenőrizd, hogy a régió támogatja-e a modellt
3. **Hálózati kapcsolat**: Biztosítsd, hogy a szolgáltatások kommunikálni tudnak
4. **RBAC jogosultságok**: Ellenőrizd, hogy az alkalmazás hozzáférhet-e az OpenAI-hoz

**Hibaelhárító parancsok:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## 3. modul: AI alkalmazások testreszabása saját igényeidhez

### 3.1 lépés: AI konfiguráció módosítása

1. **Frissítsd az OpenAI modellt:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Adj hozzá további AI szolgáltatásokat:**

Szerkeszd az `infra/main.bicep` fájlt, hogy hozzáadd a Document Intelligence-t:

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

**Legjobb gyakorlat**: Különböző konfigurációk fejlesztéshez és gyártáshoz.

1. **Hozz létre egy gyártási környezetet:**
```bash
azd env new myai-production
```

2. **Állítsd be a gyártás-specifikus paramétereket:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Lab gyakorlat 3.1: Költségoptimalizálás**

**Kihívás**: Konfiguráld a sablont költséghatékony fejlesztéshez.

**Feladatok:**
1. Azonosítsd, mely SKU-k állíthatók ingyenes/alap szintre
2. Állítsd be a környezeti változókat minimális költségre
3. Telepítsd, és hasonlítsd össze a költségeket a gyártási konfigurációval

**Megoldási tippek:**
- Használj F0 (ingyenes) szintet a Cognitive Services-hez, ha lehetséges
- Használj Basic szintet a Search Service-hez fejlesztés során
- Fontold meg a Consumption terv használatát a Functions-hez

## 4. modul: Biztonság és gyártási legjobb gyakorlatok

### 4.1 lépés: Hitelesítési kezelés biztonságossá tétele

**Jelenlegi kihívás**: Sok AI alkalmazás hardcode-olja az API kulcsokat vagy nem biztonságos tárolást használ.

**AZD megoldás**: Managed Identity + Key Vault integráció.

1. **Tekintsd át a sablon biztonsági konfigurációját:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizd, hogy a Managed Identity működik-e:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### 4.2 lépés: Hálózati biztonság

1. **Privát végpontok engedélyezése** (ha még nincs konfigurálva):

Add hozzá a bicep sablonhoz:
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

1. **Application Insights konfigurálása:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-specifikus monitorozás beállítása:**

Adj hozzá egyedi metrikákat az AI műveletekhez:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```


### **Lab gyakorlat 4.1: Biztonsági audit**

**Feladat**: Vizsgáld meg a telepítést a biztonsági legjobb gyakorlatok szerint.

**Ellenőrző lista:**
- [ ] Nincsenek hardcode-olt titkok a kódban vagy konfigurációban
- [ ] Managed Identity használata szolgáltatásközi hitelesítéshez
- [ ] Key Vault tárolja az érzékeny konfigurációt
- [ ] Hálózati hozzáférés megfelelően korlátozott
- [ ] Monitorozás és naplózás engedélyezve van

## 5. modul: Saját AI alkalmazás átalakítása

### 5.1 lépés: Értékelési munkalap

**Mielőtt átalakítanád az alkalmazásodat**, válaszolj ezekre a kérdésekre:

1. **Alkalmazás architektúra:**
   - Milyen AI szolgáltatásokat használ az alkalmazásod?
   - Milyen számítási erőforrásokra van szüksége?
   - Szüksége van adatbázisra?
   - Milyen függőségek vannak a szolgáltatások között?

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokat kezel az alkalmazásod?
   - Milyen megfelelőségi követelmények vannak?
   - Szükséged van privát hálózatra?

3. **Skálázási követelmények:**
   - Mi az elvárt terhelés?
   - Szükséged van automatikus skálázásra?
   - Vannak regionális követelmények?

### 5.2 lépés: AZD sablon létrehozása

**Kövesd ezt a mintát az alkalmazásod átalakításához:**

1. **Hozd létre az alapstruktúrát:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Hozd létre az azure.yaml fájlt:**
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

3. **Hozd létre az infrastruktúra sablonokat:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```


### **Lab gyakorlat 5.1: Sablon létrehozási kihívás**

**Kihívás**: Hozz létre egy AZD sablont egy dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**
- Azure OpenAI tartalomelemzéshez
- Document Intelligence OCR-hez
- Storage Account dokumentumfeltöltésekhez
- Function App feldolgozási logikához
- Webalkalmazás felhasználói felülethez

**Bónusz pontok:**
- Helyes hibakezelés hozzáadása
- Költségbecslés beépítése
- Monitorozási irányítópultok beállítása

## 6. modul: Gyakori problémák hibaelhárítása

### Gyakori telepítési problémák

#### Probléma 1: OpenAI szolgáltatás kvóta túllépése
**Tünetek:** Telepítés kvóta hibával meghiúsul
**Megoldások:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### Probléma 2: Modell nem elérhető a régióban
**Tünetek:** AI válaszok meghiúsulnak vagy modell telepítési hibák
**Megoldások:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### Probléma 3: Jogosultsági problémák
**Tünetek:** 403 Forbidden hibák AI szolgáltatások hívásakor
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


### Teljesítményproblémák

#### Probléma 4: Lassú AI válaszok
**Vizsgálati lépések:**
1. Ellenőrizd az Application Insights teljesítménymetrikáit
2. Tekintsd át az OpenAI szolgáltatás metrikáit az Azure portálon
3. Ellenőrizd a hálózati kapcsolatot és késleltetést

**Megoldások:**
- Gyakori kérdésekhez cache-t alkalmazz
- Használj megfelelő OpenAI modellt az esetedhez
- Fontold meg olvasási replikák használatát nagy terhelés esetén

### **Lab gyakorlat 6.1: Hibaelhárítási kihívás**

**Forgatókönyv**: A telepítés sikeres volt, de az alkalmazás 500-as hibákat ad vissza.

**Hibaelhárítási feladatok:**
1. Ellenőrizd az alkalmazás naplóit
2. Ellenőrizd a szolgáltatáskapcsolatokat
3. Teszteld a hitelesítést
4. Tekintsd át a konfigurációt

**Használható eszközök:**
- `azd show` a telepítés áttekintéséhez
- Azure portál részletes szolgáltatásnaplókhoz
- Application Insights az alkalmazás telemetriájához

## 7. modul: Monitorozás és optimalizálás

### 7.1 lépés: Átfogó monitorozás beállítása

1. **Hozz létre egyedi irányítópultokat:**

Navigálj az Azure portálra, és hozz létre egy irányítópultot:
- OpenAI kérés szám és késleltetés
- Alkalmazási hibaarányok
- Erőforrás kihasználtság
- Költségkövetés

2. **Állíts be riasztásokat:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### 7.2 lépés: Költségoptimalizálás

1. **Elemezd az aktuális költségeket:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Valósíts meg költségkontrollokat:**
- Állíts be költségkeret riasztásokat
- Használj automatikus skálázási szabályokat
- Valósíts meg kérés cache-t
- Kövesd az OpenAI tokenhasználatot

### **Lab gyakorlat 7.1: Teljesítményoptimalizálás**

**Feladat**: Optimalizáld az AI alkalmazásodat teljesítményre és költségre.

**Javítandó metrikák:**
- Csökkentsd az átlagos válaszidőt 20%-kal
- Csökkentsd a havi költségeket 15%-kal
- Tartsd fenn a 99.9%-os rendelkezésre állást

**Próbálandó stratégiák:**
- Valósíts meg válasz cache-t
- Optimalizáld a promptokat a tokenhatékonyság érdekében
- Használj megfelelő számítási SKU-kat
- Állíts be megfelelő automatikus skálázást

## Végső kihívás: Teljes körű megvalósítás

### Kihívás forgatókönyv

Feladatod egy gyártásra kész AI-alapú ügyfélszolgálati chatbot létrehozása az alábbi követelményekkel:

**Funkcionális követelmények:**
- Webes felület ügyfélinterakciókhoz
- Integráció az Azure OpenAI-val válaszokhoz
- Dokumentumkeresési képesség Cognitive Search segítségével
- Integráció meglévő ügyféladatbázissal
- Többnyelvű támogatás

**Nem funkcionális követelmények:**
- 1000 egyidejű felhasználó kezelése
- 99.9%-os rendelkezésre állási SLA
- SOC 2 megfelelőség
- Költség 500 USD/hó alatt
- Telepítés több
Gratulálunk! Sikeresen befejezted az AI Workshop Labot. Most már képes vagy:

- ✅ Meglévő AI alkalmazásokat AZD sablonokká alakítani
- ✅ Éles környezetre kész AI alkalmazásokat telepíteni
- ✅ Biztonsági legjobb gyakorlatokat alkalmazni AI munkaterhelésekhez
- ✅ AI alkalmazások teljesítményét monitorozni és optimalizálni
- ✅ Gyakori telepítési problémákat elhárítani

### Következő lépések
1. Alkalmazd ezeket a mintákat saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösséghez
3. Csatlakozz az Azure AI Foundry Discordhoz folyamatos támogatásért
4. Fedezd fel haladó témákat, például több régióra kiterjedő telepítéseket

---

**Workshop visszajelzés**: Segíts nekünk javítani a workshopot azzal, hogy megosztod tapasztalataidat az [Azure AI Foundry Discord #Azure csatornáján](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [Éles AI legjobb gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és AZD, valamint AI telepítésekkel kapcsolatos beszélgetésekért.

---

