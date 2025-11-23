<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-23T13:07:57+00:00",
  "source_file": "docs/microsoft-foundry/ai-workshop-lab.md",
  "language_code": "hu"
}
-->
# AI Workshop Lab: AI-megoldások AZD-telepítésre alkalmassá tétele

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [AI gyártási legjobb gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)

## Workshop áttekintés

Ez a gyakorlati labor bemutatja a fejlesztőknek, hogyan lehet egy meglévő AI sablont az Azure Developer CLI (AZD) segítségével telepíteni. Megtanulhatod a Microsoft Foundry szolgáltatásokkal történő AI telepítések alapvető mintáit.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alapvető Azure-ismeretek, AI/ML fogalmak ismerete

## 🎓 Tanulási célok

A workshop végére képes leszel:
- ✅ Egy meglévő AI alkalmazást AZD sablonok használatára átalakítani
- ✅ Microsoft Foundry szolgáltatásokat AZD-vel konfigurálni
- ✅ Biztonságos hitelesítési adatkezelést megvalósítani AI szolgáltatásokhoz
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
- Hozzáférés az Azure OpenAI szolgáltatásokhoz (vagy kérelmezési lehetőség)
- Erőforráscsoport létrehozási jogosultságok

### Tudás előfeltételek
- Alapvető ismeretek az Azure szolgáltatásokról
- Parancssori felületek ismerete
- Alapvető AI/ML fogalmak (API-k, modellek, promptok)

## Labor előkészítése

### 1. lépés: Környezet előkészítése

1. **Ellenőrizd az eszközök telepítését:**
```bash
# Ellenőrizze az AZD telepítést
azd version

# Ellenőrizze az Azure CLI-t
az --version

# Jelentkezzen be az Azure-ba
az login
azd auth login
```

2. **Klónozd a workshop repót:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. modul: AZD struktúra megértése AI alkalmazásokhoz

### Egy AI AZD sablon felépítése

Fedezd fel az AI-re kész AZD sablon kulcsfontosságú fájljait:

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

### **1.1 labor gyakorlat: Konfiguráció felfedezése**

1. **Vizsgáld meg az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Mire figyelj:**
- Szolgáltatásdefiníciók AI komponensekhez
- Környezeti változók hozzárendelése
- Hoszt konfigurációk

2. **Tekintsd át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Kulcsfontosságú AI minták:**
- Azure OpenAI szolgáltatás létrehozása
- Cognitive Search integráció
- Biztonságos kulcskezelés
- Hálózati biztonsági konfigurációk

### **Megbeszélési pont:** Miért fontosak ezek a minták az AI számára

- **Szolgáltatásfüggőségek**: Az AI alkalmazások gyakran több koordinált szolgáltatást igényelnek
- **Biztonság**: Az API kulcsok és végpontok biztonságos kezelést igényelnek
- **Skálázhatóság**: Az AI munkaterhelések egyedi skálázási igényekkel rendelkeznek
- **Költségkezelés**: Az AI szolgáltatások drágák lehetnek, ha nem megfelelően konfiguráltak

## 2. modul: Az első AI alkalmazás telepítése

### 2.1 lépés: A környezet inicializálása

1. **Hozz létre egy új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Állítsd be a szükséges paramétereket:**
```bash
# Állítsa be az előnyben részesített Azure régiót
azd env set AZURE_LOCATION eastus

# Opcionális: Állítson be konkrét OpenAI modellt
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 2.2 lépés: Az infrastruktúra és az alkalmazás telepítése

1. **Telepítés AZD-vel:**
```bash
azd up
```

**Mi történik az `azd up` során:**
- ✅ Azure OpenAI szolgáltatás létrehozása
- ✅ Cognitive Search szolgáltatás létrehozása
- ✅ Webalkalmazás App Service beállítása
- ✅ Hálózati és biztonsági konfigurációk
- ✅ Alkalmazáskód telepítése
- ✅ Monitorozás és naplózás beállítása

2. **Kövesd nyomon a telepítés előrehaladását**, és jegyezd fel a létrehozott erőforrásokat.

### 2.3 lépés: A telepítés ellenőrzése

1. **Ellenőrizd a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyisd meg a telepített alkalmazást:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Teszteld az AI funkciókat:**
   - Navigálj a webalkalmazásra
   - Próbálj ki mintakérdéseket
   - Ellenőrizd, hogy az AI válaszok működnek-e

### **2.1 labor gyakorlat: Hibaelhárítás gyakorlása**

**Forgatókönyv**: A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori problémák ellenőrzése:**
1. **OpenAI API kulcsok**: Ellenőrizd, hogy helyesen vannak-e beállítva
2. **Modellelérhetőség**: Ellenőrizd, hogy a régiód támogatja-e a modellt
3. **Hálózati kapcsolat**: Győződj meg róla, hogy a szolgáltatások tudnak kommunikálni
4. **RBAC jogosultságok**: Ellenőrizd, hogy az alkalmazás hozzáfér-e az OpenAI-hoz

**Hibaelhárító parancsok:**
```bash
# Ellenőrizze a környezeti változókat
azd env get-values

# Tekintse meg a telepítési naplókat
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Ellenőrizze az OpenAI telepítési állapotát
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. modul: AI alkalmazások testreszabása az igényeidhez

### 3.1 lépés: Az AI konfiguráció módosítása

1. **Frissítsd az OpenAI modellt:**
```bash
# Váltson egy másik modellre (ha elérhető az Ön régiójában)
azd env set AZURE_OPENAI_MODEL gpt-4

# Telepítse újra az új konfigurációval
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
# A gyártás általában magasabb SKU-kat használ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# További biztonsági funkciók engedélyezése
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **3.1 labor gyakorlat: Költségoptimalizálás**

**Kihívás**: Konfiguráld a sablont költséghatékony fejlesztéshez.

**Feladatok:**
1. Azonosítsd, mely SKU-k állíthatók ingyenes/alap szintre
2. Állítsd be a környezeti változókat minimális költségre
3. Telepítsd, és hasonlítsd össze a költségeket a gyártási konfigurációval

**Megoldási tippek:**
- Használj F0 (ingyenes) szintet a Cognitive Services-hez, ha lehetséges
- Használj Basic szintet a Search Service-hez fejlesztés során
- Fontold meg a Consumption terv használatát a Functions-hoz

## 4. modul: Biztonság és gyártási legjobb gyakorlatok

### 4.1 lépés: Hitelesítési adatok biztonságos kezelése

**Jelenlegi kihívás**: Sok AI alkalmazás keménykódolt API kulcsokat vagy nem biztonságos tárolást használ.

**AZD megoldás**: Kezelt identitás + Key Vault integráció.

1. **Tekintsd át a sablon biztonsági konfigurációját:**
```bash
# Keresse meg a Key Vault és a Managed Identity konfigurációt
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizd, hogy a kezelt identitás működik-e:**
```bash
# Ellenőrizze, hogy a webalkalmazás helyes identitáskonfigurációval rendelkezik
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 lépés: Hálózati biztonság

1. **Engedélyezd a privát végpontokat** (ha még nem konfiguráltad):

Add hozzá a bicep sablonodhoz:
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

1. **Konfiguráld az Application Insights-t:**
```bash
# Az Application Insights automatikusan konfigurálva kell legyen
# Ellenőrizze a konfigurációt:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Állíts be AI-specifikus monitorozást:**

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

### **4.1 labor gyakorlat: Biztonsági audit**

**Feladat**: Vizsgáld át a telepítésedet a biztonsági legjobb gyakorlatok szerint.

**Ellenőrzőlista:**
- [ ] Nincsenek keménykódolt titkok a kódban vagy konfigurációban
- [ ] Kezelt identitás használata szolgáltatásközi hitelesítéshez
- [ ] Key Vault tárolja az érzékeny konfigurációkat
- [ ] A hálózati hozzáférés megfelelően korlátozott
- [ ] Monitorozás és naplózás engedélyezve van

## 5. modul: Saját AI alkalmazás átalakítása

### 5.1 lépés: Értékelési munkalap

**Mielőtt átalakítanád az alkalmazásod**, válaszolj ezekre a kérdésekre:

1. **Alkalmazás architektúra:**
   - Milyen AI szolgáltatásokat használ az alkalmazásod?
   - Milyen számítási erőforrásokra van szüksége?
   - Szüksége van adatbázisra?
   - Milyen függőségek vannak a szolgáltatások között?

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokat kezel az alkalmazásod?
   - Milyen megfelelőségi követelmények vannak?
   - Szükséges-e privát hálózat?

3. **Skálázási követelmények:**
   - Mekkora terhelés várható?
   - Szükséges-e automatikus skálázás?
   - Vannak-e regionális követelmények?

### 5.2 lépés: Hozd létre az AZD sablonodat

**Kövesd ezt a mintát az alkalmazásod átalakításához:**

1. **Hozd létre az alapstruktúrát:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD sablon inicializálása
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

### **5.1 labor gyakorlat: Sablon létrehozási kihívás**

**Kihívás**: Hozz létre egy AZD sablont egy dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**
- Azure OpenAI tartalomelemzéshez
- Document Intelligence OCR-hez
- Tárfiók dokumentumfeltöltésekhez
- Function App feldolgozási logikához
- Webalkalmazás felhasználói felülethez

**Bónusz pontok:**
- Helyes hibakezelés hozzáadása
- Költségbecslés beillesztése
- Monitorozási irányítópultok beállítása

## 6. modul: Gyakori problémák hibaelhárítása

### Gyakori telepítési problémák

#### Probléma 1: OpenAI szolgáltatás kvóta túllépése
**Tünetek:** A telepítés kvóta hibával meghiúsul
**Megoldások:**
```bash
# Ellenőrizze az aktuális kvótákat
az cognitiveservices usage list --location eastus

# Kérjen kvótanövelést, vagy próbáljon ki egy másik régiót
azd env set AZURE_LOCATION westus2
azd up
```

#### Probléma 2: Modell nem elérhető a régióban
**Tünetek:** Az AI válaszok nem működnek vagy modell telepítési hibák
**Megoldások:**
```bash
# Ellenőrizze a modell elérhetőségét régiónként
az cognitiveservices model list --location eastus

# Frissítés az elérhető modellre
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probléma 3: Jogosultsági problémák
**Tünetek:** 403 Forbidden hibák AI szolgáltatások hívásakor
**Megoldások:**
```bash
# Ellenőrizze a szerepkör-hozzárendeléseket
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adja hozzá a hiányzó szerepköröket
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Teljesítményproblémák

#### Probléma 4: Lassú AI válaszok
**Vizsgálati lépések:**
1. Ellenőrizd az Application Insights teljesítménymutatóit
2. Tekintsd át az OpenAI szolgáltatás metrikáit az Azure portálon
3. Ellenőrizd a hálózati kapcsolatot és késleltetést

**Megoldások:**
- Gyakori lekérdezések gyorsítótárazása
- Megfelelő OpenAI modell használata az esetedhez
- Olvasási replikák használata nagy terhelés esetén

### **6.1 labor gyakorlat: Hibakeresési kihívás**

**Forgatókönyv**: A telepítés sikeres volt, de az alkalmazás 500-as hibákat ad vissza.

**Hibakeresési feladatok:**
1. Ellenőrizd az alkalmazás naplóit
2. Ellenőrizd a szolgáltatáskapcsolatokat
3. Teszteld a hitelesítést
4. Tekintsd át a konfigurációt

**Használható eszközök:**
- `azd show` a telepítés áttekintéséhez
- Azure portál részletes szolgáltatásnaplókhoz
- Application Insights az alkalmazástelemetriához

## 7. modul: Monitorozás és optimalizálás

### 7.1 lépés: Átfogó monitorozás beállítása

1. **Hozz létre egyedi irányítópultokat:**

Navigálj az Azure portálra, és hozz létre egy irányítópultot az alábbiakkal:
- OpenAI kérések száma és késleltetése
- Alkalmazási hibaarányok
- Erőforrás-felhasználás
- Költségkövetés

2. **Állíts be riasztásokat:**
```bash
# Figyelmeztetés magas hibaarányra
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
# Használja az Azure CLI-t a költségadatok lekéréséhez
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Valósíts meg költségkontrollokat:**
- Költségkeret riasztások beállítása
- Automatikus skálázási szabályok használata
- Kérések gyorsítótárazása
- Tokenhasználat monitorozása az OpenAI-hoz

### **7.1 labor gyakorlat: Teljesítményoptimalizálás**

**Feladat**: Optimalizáld az AI alkalmazásodat mind teljesítmény, mind költség szempontjából.

**Javítandó mutatók:**
- Csökkentsd az átlagos válaszidőt 20%-kal
- Csökkentsd a havi költségeket 15%-kal
- Tartsd fenn a 99,9%-os rendelkezésre állást

**Próbáld ki ezeket a stratégiákat:**
- Válaszok gyorsítótárazása
- Promptok optimalizálása tokenhatékonyság érdekében
- Megfelelő számítási SKU-k használata
- Helyes automatikus skálázás beállítása

## Végső kihívás: Teljes körű megvalósítás

### Kihívás forgatókönyv

Egy gyártásra kész, AI-alapú ügyfélszolgálati chatbotot kell létrehoznod az alábbi követelményekkel:

**Funkcionális követelmények:**
- Webes felület az ügyfélinterakciókhoz
- Integráció az Azure OpenAI-val válaszokhoz
- Dokumentumkeresési képesség Cognitive Search segítségével
- Integráció meglévő ügyféladatbázissal
- Többnyelvű támogatás

**Nem funkcionális követelmények:**
- 1000 egyidejű felhasználó kezelése
- 99,9%-os
Gratulálunk! Sikeresen befejezted az AI Workshop Labot. Mostantól képesnek kell lenned:

- ✅ Meglévő AI alkalmazásokat AZD sablonokká alakítani
- ✅ Üzemkész AI alkalmazásokat telepíteni
- ✅ Biztonsági legjobb gyakorlatokat alkalmazni AI munkaterhelésekhez
- ✅ Figyelni és optimalizálni az AI alkalmazások teljesítményét
- ✅ Gyakori telepítési problémákat elhárítani

### Következő lépések
1. Alkalmazd ezeket a mintákat saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösséghez
3. Csatlakozz a Microsoft Foundry Discordhoz folyamatos támogatásért
4. Fedezd fel a haladó témákat, például a több régiós telepítéseket

---

**Workshop visszajelzés**: Segíts nekünk javítani ezt a workshopot azzal, hogy megosztod tapasztalataidat a [Microsoft Foundry Discord #Azure csatornáján](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-First fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [Üzemkész AI legjobb gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és az AZD-vel, valamint AI telepítésekkel kapcsolatos megbeszélésekért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->