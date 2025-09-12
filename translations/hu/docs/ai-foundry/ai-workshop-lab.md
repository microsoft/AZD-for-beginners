<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T23:01:38+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "hu"
}
-->
# AI Workshop Lab: AI megoldások AZD-telepíthetővé tétele

**Előző:** [AI Model Deployment](ai-model-deployment.md) | **Következő:** [Production AI Practices](production-ai-practices.md)

## Workshop Áttekintés

Ez a gyakorlati labor bemutatja a fejlesztőknek, hogyan tegyenek egy meglévő AI alkalmazást telepíthetővé az Azure Developer CLI (AZD) használatával. Megtanulhatod az alapvető mintákat a termelési AI telepítésekhez az Azure AI Foundry szolgáltatásokkal.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alapvető Azure ismeretek, AI/ML fogalmak ismerete

## 🎓 Tanulási Célok

A workshop végére képes leszel:
- ✅ Egy meglévő AI alkalmazást AZD sablonokra konvertálni
- ✅ Az Azure AI Foundry szolgáltatásokat AZD-vel konfigurálni
- ✅ Biztonságos hitelesítő adatok kezelését megvalósítani AI szolgáltatásokhoz
- ✅ Termelésre kész AI alkalmazásokat telepíteni monitorozással
- ✅ Gyakori AI telepítési problémákat elhárítani

## Előfeltételek

### Szükséges Eszközök
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) telepítve
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) telepítve
- [Git](https://git-scm.com/) telepítve
- Kódszerkesztő (VS Code ajánlott)

### Azure Erőforrások
- Azure előfizetés hozzájárulói hozzáféréssel
- Hozzáférés az Azure OpenAI szolgáltatásokhoz (vagy hozzáférési kérelem lehetősége)
- Erőforráscsoport létrehozási jogosultságok

### Tudás Előfeltételek
- Alapvető Azure szolgáltatások ismerete
- Parancssori felületek ismerete
- Alapvető AI/ML fogalmak (API-k, modellek, promptok)

## Labor Előkészítése

### 1. lépés: Környezet Előkészítése

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

2. **Klónozd a workshop repozitóriumot:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. Modul: AZD Struktúra Megértése AI Alkalmazásokhoz

### Az AI AZD Sablon Felépítése

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

### **Labor Gyakorlat 1.1: Konfiguráció Felfedezése**

1. **Vizsgáld meg az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Mit keress:**  
- Szolgáltatásdefiníciók AI komponensekhez  
- Környezeti változók leképezése  
- Host konfigurációk  

2. **Tekintsd át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Kulcsfontosságú AI minták:**  
- Azure OpenAI szolgáltatás előkészítése  
- Cognitive Search integráció  
- Biztonságos kulcskezelés  
- Hálózati biztonsági konfigurációk  

### **Vita Téma:** Miért Fontosak Ezek a Minták AI-hoz

- **Szolgáltatásfüggőségek**: Az AI alkalmazások gyakran több összehangolt szolgáltatást igényelnek  
- **Biztonság**: Az API kulcsok és végpontok biztonságos kezelést igényelnek  
- **Skálázhatóság**: Az AI munkaterhelések egyedi skálázási igényekkel rendelkeznek  
- **Költségkezelés**: Az AI szolgáltatások drágák lehetnek, ha nem megfelelően konfigurálják őket  

## 2. Modul: Az Első AI Alkalmazás Telepítése

### 2.1 lépés: Környezet Inicializálása

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

### 2.2 lépés: Infrastruktúra és Alkalmazás Telepítése

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

### 2.3 lépés: Telepítés Ellenőrzése

1. **Ellenőrizd a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyisd meg a telepített alkalmazást:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Teszteld az AI funkciót:**  
   - Navigálj a webalkalmazásra  
   - Próbálj ki mintakérdéseket  
   - Ellenőrizd, hogy az AI válaszok működnek-e  

### **Labor Gyakorlat 2.1: Hibakeresési Gyakorlat**

**Forgatókönyv**: A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori problémák ellenőrzése:**  
1. **OpenAI API kulcsok**: Ellenőrizd, hogy helyesen vannak-e beállítva  
2. **Modellek elérhetősége**: Ellenőrizd, hogy a régió támogatja-e a modellt  
3. **Hálózati kapcsolat**: Biztosítsd, hogy a szolgáltatások kommunikálni tudnak  
4. **RBAC jogosultságok**: Ellenőrizd, hogy az alkalmazás hozzáférhet-e az OpenAI-hoz  

**Hibakeresési parancsok:**  
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. Modul: AI Alkalmazások Testreszabása Saját Igényeidre

### 3.1 lépés: AI Konfiguráció Módosítása

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

### 3.2 lépés: Környezet-specifikus Konfigurációk

**Legjobb gyakorlat**: Különböző konfigurációk fejlesztéshez és termeléshez.

1. **Hozz létre egy termelési környezetet:**
```bash
azd env new myai-production
```

2. **Állítsd be a termelés-specifikus paramétereket:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labor Gyakorlat 3.1: Költségoptimalizálás**

**Kihívás**: Konfiguráld a sablont költséghatékony fejlesztéshez.

**Feladatok:**  
1. Azonosítsd, mely SKU-k állíthatók ingyenes/alap szintre  
2. Állítsd be a környezeti változókat minimális költségre  
3. Telepítsd, és hasonlítsd össze a költségeket a termelési konfigurációval  

**Megoldási tippek:**  
- Használj F0 (ingyenes) szintet a Cognitive Services-hez, ha lehetséges  
- Használj Basic szintet a Search Service-hez fejlesztés során  
- Fontold meg a Consumption terv használatát a Functions-hez  

## 4. Modul: Biztonság és Termelési Legjobb Gyakorlatok

### 4.1 lépés: Hitelesítő Adatok Biztonságos Kezelése

**Jelenlegi kihívás**: Sok AI alkalmazás hardcode-olja az API kulcsokat vagy nem biztonságos tárolást használ.

**AZD Megoldás**: Managed Identity + Key Vault integráció.

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

### 4.2 lépés: Hálózati Biztonság

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

### 4.3 lépés: Monitorozás és Megfigyelhetőség

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

### **Labor Gyakorlat 4.1: Biztonsági Audit**

**Feladat**: Vizsgáld át a telepítésedet a biztonsági legjobb gyakorlatok szerint.

**Ellenőrzőlista:**  
- [ ] Nincsenek hardcode-olt titkok a kódban vagy konfigurációban  
- [ ] Managed Identity használata szolgáltatás-szolgáltatás hitelesítéshez  
- [ ] Key Vault tárolja az érzékeny konfigurációt  
- [ ] Hálózati hozzáférés megfelelően korlátozott  
- [ ] Monitorozás és naplózás engedélyezve  

## 5. Modul: Saját AI Alkalmazás Konvertálása

### 5.1 lépés: Értékelési Munkalap

**Mielőtt konvertálnád az alkalmazásodat**, válaszolj ezekre a kérdésekre:

1. **Alkalmazás Architektúra:**  
   - Milyen AI szolgáltatásokat használ az alkalmazásod?  
   - Milyen számítási erőforrásokra van szüksége?  
   - Szüksége van adatbázisra?  
   - Milyen függőségek vannak a szolgáltatások között?  

2. **Biztonsági Követelmények:**  
   - Milyen érzékeny adatokat kezel az alkalmazásod?  
   - Milyen megfelelőségi követelmények vannak?  
   - Szükséged van privát hálózatra?  

3. **Skálázási Követelmények:**  
   - Mi az elvárt terhelés?  
   - Szükséged van automatikus skálázásra?  
   - Vannak regionális követelmények?  

### 5.2 lépés: AZD Sablon Létrehozása

**Kövesd ezt a mintát az alkalmazásod konvertálásához:**

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

### **Labor Gyakorlat 5.1: Sablon Létrehozási Kihívás**

**Kihívás**: Hozz létre egy AZD sablont egy dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**  
- Azure OpenAI tartalomelemzéshez  
- Document Intelligence OCR-hez  
- Storage Account dokumentumfeltöltésekhez  
- Function App feldolgozási logikához  
- Webalkalmazás felhasználói felülethez  

**Bónusz pontok:**  
- Adj hozzá megfelelő hibakezelést  
- Tartalmazd a költségbecslést  
- Állítsd be a monitorozási irányítópultokat  

## 6. Modul: Gyakori Problémák Hibakeresése

### Gyakori Telepítési Problémák

#### Probléma 1: OpenAI Szolgáltatás Kvóta Túllépése  
**Tünetek:** Telepítés kvóta hibával meghiúsul  
**Megoldások:**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Probléma 2: Modell Nem Elérhető a Régióban  
**Tünetek:** AI válaszok meghiúsulnak vagy modell telepítési hibák  
**Megoldások:**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probléma 3: Jogosultsági Problémák  
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

### Teljesítmény Problémák

#### Probléma 4: Lassú AI Válaszok  
**Vizsgálati lépések:**  
1. Ellenőrizd az Application Insights teljesítménymetrikáit  
2. Tekintsd át az OpenAI szolgáltatás metrikáit az Azure portálon  
3. Ellenőrizd a hálózati kapcsolatot és késleltetést  

**Megoldások:**  
- Implementálj gyorsítótárazást gyakori lekérdezésekhez  
- Használj megfelelő OpenAI modellt az esetedhez  
- Fontold meg olvasási replikák használatát nagy terhelés esetén  

### **Labor Gyakorlat 6.1: Hibakeresési Kihívás**

**Forgatókönyv**: A telepítés sikeres volt, de az alkalmazás 500-as hibákat ad vissza.

**Hibakeresési feladatok:**  
1. Ellenőrizd az alkalmazás naplóit  
2. Ellenőrizd a szolgáltatáskapcsolatot  
3. Teszteld a hitelesítést  
4. Tekintsd át a konfigurációt  

**Használható eszközök:**  
- `azd show` a telepítés áttekintéséhez  
- Azure portál részletes szolgáltatásnaplókhoz  
- Application Insights az alkalmazás telemetriájához  

## 7. Modul: Monitorozás és Optimalizálás

### 7.1 lépés: Átfogó Monitorozás Beállítása

1. **Hozz létre egyedi irányítópultokat:**

Navigálj az Azure portálra, és hozz létre egy irányítópultot:  
- OpenAI kérés szám és késleltetés  
- Alkalmazás hibaarányok  
- Erőforrás kihasználtság  
- Költségkövetés  

2. **Állítsd be az értesítéseket:**  
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

1. **Elemezd a jelenlegi költségeket:**  
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Valósítsd meg a költségkontrollokat:**  
- Állítsd be költségkeret értesítéseket  
- Használj automatikus skálázási szabályokat  
- Implementálj kérés gyorsítótárazást  
- Kövesd az OpenAI tokenhasználatot  

### **Labor Gyakorlat 7.1: Teljesítmény Optimalizálás**

**Feladat**: Optimalizáld az AI alkalmazásodat teljesítményre és költségre.

**Javítandó metrikák:**  
- Csökkentsd az átlagos válaszidőt 20%-kal  
- Csökkentsd a havi költségeket 15%-kal  
- Tartsd fenn a 99.9%-os rendelkezésre állást  

**Próbálandó stratégiák:**  
- Implementálj válasz gyorsítótárazást  
- Optimalizáld a promptokat a tokenhatékonyság érdekében  
- Használj megfelelő számítási SKU-kat  
- Állítsd be a megfelelő automatikus skálázást  

## Végső Kihívás: Teljes Körű Megvalósítás

### Kihívás Forgatókönyv

Feladatod egy termelésre kész AI-alapú ügyfélszolgálati chatbot létrehozása az alábbi követelményekkel:

**Funkcionális Követelmények:**  
- Webes felület ügyfélinterakciókhoz  
- Integráció Azure OpenAI-val válaszokhoz  
- Dokumentumkeresési képesség Cognitive Search segítségével  
- Integráció meglévő ügyféladatbázissal  
- Többnyelvű támogatás  

**Nem Funkcionális Követelmények:**  
- 1000 egyidejű felhasználó kezelése  
- 99.9%-os rendelkezésre állási SLA  
- SOC 2 megfelelőség  
- Költség 500 USD/hó alatt  
- Telepítés több környezetbe (fejlesztés, tesztelés, termelés)  

### Megvalósítási Lépések

1. **Tervezd
- ✅ Valósítsd meg a biztonsági legjobb gyakorlatokat AI munkaterhelésekhez
- ✅ Figyeld és optimalizáld az AI alkalmazások teljesítményét
- ✅ Hárítsd el a gyakori telepítési problémákat

### Következő lépések
1. Alkalmazd ezeket a mintákat saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösséghez
3. Csatlakozz az Azure AI Foundry Discordhoz folyamatos támogatásért
4. Fedezd fel a haladó témákat, mint például a több régiós telepítések

---

**Workshop visszajelzés**: Segíts nekünk javítani ezt a workshopot azzal, hogy megosztod tapasztalataidat az [Azure AI Foundry Discord #Azure csatornán](https://discord.gg/microsoft-azure).

---

**Előző:** [AI Model Deployment](ai-model-deployment.md) | **Következő:** [Production AI Practices](production-ai-practices.md)

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és AZD, valamint AI telepítésekkel kapcsolatos beszélgetésekért.

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.