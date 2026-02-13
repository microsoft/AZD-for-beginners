# AI Workshop Lab: Az AI megoldásainak AZD-telepíthetővé tétele

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [Termelési AI bevált gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Workshop áttekintése

Ez a gyakorlati labor végigvezeti a fejlesztőket azon a folyamaton, hogyan lehet egy meglévő AI sablont AZD segítségével telepíteni. Megismerheti a Microsoft Foundry szolgáltatások használatának alapvető mintáit a gyártási AI-telepítésekhez.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alap Azure-ismeretek, ismeretek az AI/ML koncepciókról

## 🎓 Tanulási célok

A workshop végére képes lesz:
- ✅ Egy meglévő AI-alkalmazás átalakítása AZD-sablonok használatára
- ✅ Microsoft Foundry szolgáltatások konfigurálása AZD-vel
- ✅ Biztonságos hitelesítő adat-kezelés megvalósítása AI szolgáltatásokhoz
- ✅ Élesre kész AI-alkalmazások telepítése megfigyeléssel
- ✅ Gyakori AI-telepítési problémák elhárítása

## Előfeltételek

### Szükséges eszközök
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) telepítve
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) telepítve
- [Git](https://git-scm.com/) telepítve
- Kódszerkesztő (ajánlott: VS Code)

### Azure-erőforrások
- Azure-előfizetés contributor jogosultsággal
- Hozzáférés az Azure OpenAI szolgáltatásokhoz (vagy lehetőség hozzáférés igénylésére)
- Jogosultságok erőforráscsoport létrehozásához

### Tudásbeli előfeltételek
- Azure szolgáltatások alapvető ismerete
- Parancssori felületek ismerete
- Alap AI/ML fogalmak (API-k, modellek, promptok)

## Labor beállítása

### 1. lépés: Környezet előkészítése

1. **Ellenőrizze az eszközök telepítését:**
```bash
# Ellenőrizze az AZD telepítését
azd version

# Ellenőrizze az Azure CLI-t
az --version

# Jelentkezzen be az Azure-ba
az login
azd auth login
```

2. **Klónozza a workshop repozitóriumát:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. modul: AZD szerkezetének megértése AI-alkalmazásokhoz

### Egy AI-hez készült AZD-sablon anatómiája

Ismerje meg az AI-ra kész AZD-sablon fő fájljait:

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

### **Laborgyakorlat 1.1: A konfiguráció felfedezése**

1. **Vizsgálja meg az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Mire figyeljen:**
- AI komponensek szolgáltatásdefiníciói
- Környezeti változók leképezése
- Kiszolgáló (host) konfigurációk

2. **Nézze át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Azonosítandó fő AI mintázatok:**
- Azure OpenAI szolgáltatás létrehozása
- Cognitive Search integrációja
- Biztonságos kulcskezelés
- Hálózati biztonsági konfigurációk

### **Megbeszélési pont:** Miért fontosak ezek a mintázatok az AI számára

- **Szolgáltatásfüggőségek**: Az AI alkalmazások gyakran több, összehangolt szolgáltatást igényelnek
- **Biztonság**: Az API-kulcsokat és végpontokat biztonságosan kell kezelni
- **Skálázhatóság**: Az AI terheléseknek egyedi skálázási követelményei vannak
- **Költséggazdálkodás**: Az AI szolgáltatások költségesek lehetnek, ha nincsenek megfelelően konfigurálva

## 2. modul: Telepítse első AI-alkalmazását

### 2.1 lépés: Inicializálja a környezetet

1. **Hozzon létre egy új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Állítsa be a szükséges paramétereket:**
```bash
# Állítsa be a preferált Azure-régiót
azd env set AZURE_LOCATION eastus

# Opcionális: Állítsa be a konkrét OpenAI-modellt
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 2.2 lépés: Telepítse az infrastruktúrát és az alkalmazást

1. **Telepítés AZD-del:**
```bash
azd up
```

**Mi történik az `azd up` parancs során:**
- ✅ Létrehozza az Azure OpenAI szolgáltatást
- ✅ Létrehozza a Cognitive Search szolgáltatást
- ✅ Beállítja az App Service-t a webalkalmazáshoz
- ✅ Konfigurálja a hálózatot és a biztonságot
- ✅ Telepíti az alkalmazáskódot
- ✅ Beállítja a megfigyelést és a naplózást

2. **Kövesse a telepítés előrehaladását** és jegyezze fel a létrejövő erőforrásokat.

### 2.3 lépés: Ellenőrizze a telepítést

1. **Ellenőrizze a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyissa meg a telepített alkalmazást:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Tesztelje az AI funkciókat:**
   - Nyissa meg a webalkalmazást
   - Próbáljon ki mintakérdéseket
   - Ellenőrizze, hogy az AI válaszok működnek-e

### **Laborgyakorlat 2.1: Hibakeresési gyakorlat**

**Forgatókönyv**: A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori ellenőrizendő problémák:**
1. **OpenAI API-kulcsok**: Ellenőrizze, hogy helyesen vannak-e beállítva
2. **Model elérhetősége**: Ellenőrizze, hogy az Ön régiója támogatja-e a modellt
3. **Hálózati kapcsolat**: Győződjön meg róla, hogy a szolgáltatások tudnak kommunikálni egymással
4. **RBAC jogosultságok**: Ellenőrizze, hogy az alkalmazás hozzáfér-e az OpenAI-hoz

**Hibakereső parancsok:**
```bash
# Ellenőrizze a környezeti változókat
azd env get-values

# Tekintse meg a telepítési naplókat
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Ellenőrizze az OpenAI telepítés állapotát
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. modul: AI-alkalmazások testreszabása az Ön igényeihez

### 3.1 lépés: Módosítsa az AI konfigurációt

1. **Frissítse az OpenAI modellt:**
```bash
# Váltson egy másik modellre (ha elérhető az Ön régiójában)
azd env set AZURE_OPENAI_MODEL gpt-4

# Telepítse újra az új konfigurációval
azd deploy
```

2. **Adjon hozzá további AI szolgáltatásokat:**

Szerkessze a `infra/main.bicep` fájlt, hogy hozzáadja a Document Intelligence-t:

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

### 3.2 lépés: Környezetre szabott konfigurációk

**Legjobb gyakorlat**: Különböző konfigurációk fejlesztéshez és éles környezethez.

1. **Hozzon létre egy éles környezetet:**
```bash
azd env new myai-production
```

2. **Állítsa be az éles környezetre jellemző paramétereket:**
```bash
# A termelési környezet általában magasabb SKU-kat használ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# További biztonsági funkciók engedélyezése
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laborgyakorlat 3.1: Költségoptimalizálás**

**Kihívás**: Konfigurálja a sablont költséghatékony fejlesztésre.

**Feladatok:**
1. Azonosítsa, mely SKUk állíthatók ingyenes/alap szintre
2. Konfigurálja a környezeti változókat a minimális költség érdekében
3. Telepítse és hasonlítsa össze a költségeket az éles konfigurációval

**Megoldási tippek:**
- Használja az F0 (ingyenes) szintet a Cognitive Services esetén, ha lehetséges
- Fejlesztésben használja a Basic szintet a Search Service-hez
- Fontolja meg a Consumption (fogyasztás alapú) terv használatát a Funkciókhoz

## 4. modul: Biztonság és éles környezetben alkalmazandó bevált gyakorlatok

### 4.1 lépés: Biztonságos hitelesítőadat-kezelés

**Jelenlegi kihívás**: Sok AI alkalmazás keménykódolja az API-kulcsokat vagy nem biztonságos tárolást használ.

**AZD megoldás**: Managed Identity + Key Vault integráció.

1. **Nézze át a sablon biztonsági konfigurációját:**
```bash
# Keresse a Key Vault és a Managed Identity konfigurációját
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizze, hogy a Managed Identity működik-e:**
```bash
# Ellenőrizze, hogy a webalkalmazás rendelkezik-e a megfelelő azonosítási konfigurációval.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 lépés: Hálózati biztonság

1. **Engedélyezze a privát végpontokat** (ha még nincsenek konfigurálva):

Adja hozzá a bicep sablonjához:
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

### 4.3 lépés: Megfigyelés és észlelhetőség

1. **Konfigurálja az Application Insights-ot:**
```bash
# Az Application Insights-ot automatikusan kell konfigurálni
# Ellenőrizze a konfigurációt:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Állítson be AI-specifikus megfigyelést:**

Adjon hozzá egyedi metrikákat az AI műveletekhez:
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

### **Laborgyakorlat 4.1: Biztonsági áttekintés**

**Feladat**: Vizsgálja át a telepítést biztonsági bevált gyakorlatok szempontjából.

**Ellenőrzőlista:**
- [ ] Nincs keménykódolt titok a kódban vagy konfigurációban
- [ ] Managed Identity használata szolgáltatások közötti hitelesítéshez
- [ ] A Key Vault tárolja az érzékeny konfigurációt
- [ ] A hálózati hozzáférés megfelelően korlátozott
- [ ] A megfigyelés és naplózás engedélyezve van

## 5. modul: Saját AI-alkalmazás átalakítása

### 5.1 lépés: Értékelési munkalap

**Mielőtt átalakítja az alkalmazását**, válaszolja meg az alábbi kérdéseket:

1. **Alkalmazás architektúra:**
   - Milyen AI szolgáltatásokat használ az alkalmazása?
   - Milyen számítási erőforrásokra van szüksége?
   - Szüksége van-e adatbázisra?
   - Mik a szolgáltatások közötti függőségek?

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokat kezel az alkalmazása?
   - Milyen megfelelőségi követelményeknek kell eleget tennie?
   - Szüksége van-e privát hálózatra?

3. **Skálázási követelmények:**
   - Mekkora terhelést vár?
   - Szüksége van-e automatikus skálázásra?
   - Vannak-e regionális követelmények?

### 5.2 lépés: Hozza létre az AZD sablonját

**Kövesse ezt a mintát az alkalmazás átalakításához:**

1. **Hozza létre az alapvető szerkezetet:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializálja az AZD sablont
azd init --template minimal
```

2. **Hozza létre az azure.yaml fájlt:**
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

3. **Hozza létre az infrastruktúra sablonokat:**

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

### **Laborgyakorlat 5.1: Sablon létrehozási kihívás**

**Kihívás**: Hozzon létre egy AZD sablont egy dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**
- Azure OpenAI a tartalomelemzéshez
- Document Intelligence OCR-hez
- Storage Account a dokumentumfeltöltésekhez
- Function App a feldolgozó logikához
- Webalkalmazás a felhasználói felülethez

**Bónuszpontok:**
- Adjunk hozzá megfelelő hibakezelést
- Tartalmazzon költségbecslést
- Állítson be megfigyelési műszerfalakat

## 6. modul: Gyakori problémák hibakeresése

### Gyakori telepítési problémák

#### Probléma 1: OpenAI szolgáltatási kvóta túllépve
**Tünetek:** A telepítés kvótahiba miatt meghiúsul
**Megoldások:**
```bash
# Ellenőrizze a jelenlegi kvótákat
az cognitiveservices usage list --location eastus

# Kérjen kvótaemelést, vagy használjon másik régiót
azd env set AZURE_LOCATION westus2
azd up
```

#### Probléma 2: A modell nem elérhető a régióban
**Tünetek:** Az AI válaszok hibásak vagy a modell telepítése hibát jelez
**Megoldások:**
```bash
# Ellenőrizze a modell elérhetőségét régiónként
az cognitiveservices model list --location eastus

# Frissítse az elérhető modellre
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probléma 3: Jogosultsági problémák
**Tünetek:** 403 Forbidden hibák az AI szolgáltatások hívásakor
**Megoldások:**
```bash
# Szerepkiosztások ellenőrzése
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Hiányzó szerepek hozzáadása
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Teljesítményproblémák

#### Probléma 4: Lassú AI válaszok
**Vizsgálati lépések:**
1. Ellenőrizze az Application Insights teljesítménymutatóit
2. Nézze át az OpenAI szolgáltatás mutatóit az Azure portálon
3. Ellenőrizze a hálózati kapcsolatot és késleltetést

**Megoldások:**
- Valósítson meg gyorsítótárazást gyakori lekérdezésekhez
- Használjon megfelelő OpenAI modellt az esethez
- Fontolja meg olvasó replika használatát nagy terhelés esetén

### **Laborgyakorlat 6.1: Hibakeresési kihívás**

**Forgatókönyv**: A telepítés sikeres volt, de az alkalmazás 500-as hibával tér vissza.

**Hibakeresési feladatok:**
1. Ellenőrizze az alkalmazás naplóit
2. Ellenőrizze a szolgáltatások közötti kapcsolatot
3. Tesztelje a hitelesítést
4. Ellenőrizze a konfigurációt

**Használható eszközök:**
- `azd show` a telepítés áttekintéséhez
- Azure portál a részletes szolgáltatásnaplókhoz
- Application Insights az alkalmazástelemzéshez

## 7. modul: Megfigyelés és optimalizálás

### 7.1 lépés: Átfogó megfigyelés beállítása

1. **Egyedi műszerfalak létrehozása:**

Nyissa meg az Azure portált és hozzon létre egy műszerfalat a következőkkel:
- OpenAI kérések száma és késleltetés
- Alkalmazás hibaarányai
- Erőforrás-kihasználtság
- Költségkövetés

2. **Értesítések beállítása:**
```bash
# Riasztás magas hibaarány esetén
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 7.2 lépés: Költségoptimalizálás

1. **Elemezze a jelenlegi költségeket:**
```bash
# Használja az Azure CLI-t a költségadatok lekéréséhez
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Vezessen be költségkontrollokat:**
- Állítson be költségvetési riasztásokat
- Használjon automatikus skálázási szabályzatokat
- Valósítson meg kérések gyorsítótárazását
- Figyelje az OpenAI tokenhasználatát

### **Laborgyakorlat 7.1: Teljesítményoptimalizálás**

**Feladat**: Optimalizálja AI alkalmazását teljesítmény és költség szempontjából.

**Mérőszámok, amelyeket javítani kell:**
- Csökkentse az átlagos válaszidőt 20%-kal
- Csökkentse a havi költségeket 15%-kal
- Tartsa a 99,9%-os rendelkezésre állást

**Próbálkozási stratégiák:**
- Válaszok gyorsítótárazása
- Optimalizálja a promptokat tokenhatékonyság szempontjából
- Használjon megfelelő számítási SKU-kat
- Állítson be megfelelő automatikus skálázást

## Végső kihívás: Végpontok közötti megvalósítás

### Kihívás forgatókönyv

Az a feladata, hogy hozzon létre egy élesre kész, AI-alapú ügyfélszolgálati chatbotot az alábbi követelményekkel:

**Funkcionális követelmények:**
- Webes felület az ügyfélkapcsolatokhoz
- Integráció az Azure OpenAI-val a válaszokhoz
- Dokumentumkeresési képesség Cognitive Search használatával
- Integráció a meglévő ügyféladatbázissal
- Többnyelvű támogatás

**Nem funkcionális követelmények:**
- Kiszolgálja az 1000 egyidejű felhasználót
- 99,9% rendelkezésre állás (SLA)
- SOC 2 megfelelés
- Költség havi szinten kevesebb, mint $500
- Telepítés több környezetbe (dev, staging, prod)

### Megvalósítás lépései

1. Tervezze meg az architektúrát
2. Hozza létre az AZD sablont
3. Valósítsa meg a biztonsági intézkedéseket
4. Állítsa be a megfigyelést és riasztásokat
5. Hozza létre a telepítési csővezetékeket
6. Dokumentálja a megoldást

### Értékelési kritériumok

- ✅ **Funkcionalitás**: Teljesíti-e minden követelményt?
- ✅ **Biztonság**: Alkalmazzák-e a bevált gyakorlatokat?
- ✅ **Skálázhatóság**: Képes kezelni a terhelést?
- ✅ **Karbantarthatóság**: Jól szervezett-e a kód és az infrastruktúra?
- ✅ **Költség**: Megfelel-e a költségvetésnek?

## További források

### Microsoft dokumentáció
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI szolgáltatás dokumentációja](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

### Példa sablonok
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Közösségi források
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Teljesítési igazolás
Gratulálunk! Befejezted az AI Workshop Labot. Most már képesnek kell lenned a következőkre:

- ✅ A meglévő AI-alkalmazások átalakítása AZD-sablonokká
- ✅ Élesre kész AI-alkalmazások telepítése
- ✅ Biztonsági bevált gyakorlatok alkalmazása az AI-munkaterhelésekhez
- ✅ Az AI-alkalmazások teljesítményének figyelése és optimalizálása
- ✅ Gyakori telepítési problémák elhárítása

### Következő lépések
1. Alkalmazd ezeket a mintákat a saját AI projektjeidben
2. Juttasd vissza a sablonokat a közösségnek
3. Csatlakozz a Microsoft Foundry Discordhoz a folyamatos támogatásért
4. Fedezd fel a haladó témákat, például a több régiós telepítéseket

---

**Workshop Feedback**: Segíts nekünk javítani ezt a workshopot azzal, hogy megosztod tapasztalataidat a [Microsoft Foundry Discord #Azure csatornában](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [AI éles környezet bevált gyakorlatai](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Szükséged van segítségre?** Csatlakozz közösségünkhöz, ahol támogatást és beszélgetéseket találsz az AZD-vel és az AI-telepítésekkel kapcsolatban.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ezt a dokumentumot mesterséges intelligencia (AI) alapú fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvi változatát kell tekinteni irányadónak. Kritikus jelentőségű információk esetén emberi, szakmai fordítást javaslunk. Nem vállalunk felelősséget az e fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->