# AI Műhely Labor: AI Megoldásaid AZD-Deployálhatóvá Tétele

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi Fejezet**: 2. fejezet - AI-First Fejlesztés
- **⬅️ Előző**: [AI Modell Telepítés](ai-model-deployment.md)
- **➡️ Következő**: [Termelési AI Legjobb Gyakorlatok](production-ai-practices.md)
- **🚀 Következő Fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Műhely Áttekintése

Ez a gyakorlati labor végigvezeti a fejlesztőket azon a folyamaton, hogy egy meglévő AI sablont hogyan lehet Azure Developer CLI (AZD) használatával telepíteni. Megtanulod a Microsoft Foundry szolgáltatások felhasználásával a termelésbe szánt AI telepítések alapvető mintáit.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alap Azure ismeretek, AI/ML fogalmak ismerete

## 🎓 Tanulási Célok

A műhely végére képes leszel:
- ✅ Egy meglévő AI alkalmazást AZD sablonokra átalakítani
- ✅ Microsoft Foundry szolgáltatásokat konfigurálni AZD segítségével
- ✅ Biztonságos hitelesítő adatkezelést megvalósítani AI szolgáltatásokhoz
- ✅ Termelésre kész AI alkalmazásokat telepíteni monitorozással
- ✅ Gyakori AI telepítési hibákat elhárítani

## Előfeltételek

### Szükséges Eszközök
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) telepítve
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) telepítve
- [Git](https://git-scm.com/) telepítve
- Kódszerkesztő (VS Code ajánlott)

### Azure Erőforrások
- Azure előfizetés hozzájárlói jogosultsággal
- Hozzáférés a Microsoft Foundry Models szolgáltatásokhoz (vagy hozzáférési kérés lehetősége)
- Erőforrás-csoport létrehozási jogosultság

### Tudás Előfeltételek
- Azure szolgáltatások alapvető ismerete
- Parancssori felületek ismerete
- AI/ML alapfogalmak (API-k, modellek, promptok)

## Labor Beállítása

### 1. lépés: Környezet Előkészítése

1. **Ellenőrizd az eszközök telepítését:**
```bash
# Ellenőrizze az AZD telepítését
azd version

# Ellenőrizze az Azure CLI-t
az --version

# Jelentkezzen be az Azure-ba
az login
azd auth login
```

2. **Klónozd a műhely tárházát:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. Modul: AZD Szerkezet Megértése AI Alkalmazásokhoz

### Egy AI AZD Sablon Anatómia

Fedezd fel az AI-kész AZD sablon kulcsfontosságú fájljait:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Labor Gyakorlat 1.1: A Konfiguráció Felfedezése**

1. **Vizsgáld meg az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Figyeld meg:**
- AI komponensek szolgáltatásdefiníciói
- Környezeti változók hozzárendelései
- Host konfigurációk

2. **Tekintsd át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Fontos AI minták azonosítása:**
- Microsoft Foundry Models szolgáltatás létrehozása
- Cognitive Search integrációja
- Biztonságos kulcskezelés
- Hálózati biztonsági beállítások

### **Megbeszélés:** Miért Fontosak Ezek a Minták AI Számára

- **Szolgáltatási Függőségek**: AI alkalmazások gyakran több koordinált szolgáltatást igényelnek
- **Biztonság**: API kulcsokat és végpontokat biztonságosan kell kezelni
- **Skálázhatóság**: AI munkaterhelések egyedi skálázási követelményeket támasztanak
- **Költséggazdálkodás**: AI szolgáltatások költségesek lehetnek nem megfelelő beállítás esetén

## 2. Modul: Az Első AI Alkalmazásod Telepítése

### 2.1 lépés: Környezet Inicializálása

1. **Hozz létre egy új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Add meg a szükséges paramétereket:**
```bash
# Állítsa be a kívánt Azure régiót
azd env set AZURE_LOCATION eastus

# Opcionális: Állítson be egy adott OpenAI modellt
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 2.2 lépés: Infrastruktúra és Alkalmazás Telepítése

1. **Telepítés az AZD-vel:**
```bash
azd up
```

**Mi történik az `azd up` alatt:**
- ✅ Microsoft Foundry Models szolgáltatás létrehozása
- ✅ Cognitive Search szolgáltatás létrehozása
- ✅ App Service létrehozása a webalkalmazáshoz
- ✅ Hálózati és biztonsági beállítások konfigurálása
- ✅ Alkalmazáskód telepítése
- ✅ Monitorozás és naplózás beállítása

2. **Kövesd a telepítés folyamatát** és jegyezd fel a létrejövő erőforrásokat.

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
   - Próbálj ki tesztkérdéseket
   - Ellenőrizd, hogy az AI válaszok működnek

### **Labor Gyakorlat 2.1: Hibakeresési Gyakorlat**

**Forgatókönyv**: A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori problémák ellenőrzése:**
1. **OpenAI API kulcsok**: Ellenőrizd, hogy helyesen vannak beállítva
2. **Modell elérhetőség**: Ellenőrizd, támogatja-e a régió a modellt
3. **Hálózati kapcsolódás**: Győződj meg, hogy a szolgáltatások kommunikálni tudnak
4. **RBAC jogosultságok**: Ellenőrizd, hogy az alkalmazás hozzáfér az OpenAI-hoz

**Hibakeresési parancsok:**
```bash
# Környezeti változók ellenőrzése
azd env get-values

# Telepítési naplók megtekintése
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI telepítési státusz ellenőrzése
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. Modul: AI Alkalmazások Testreszabása Szükségleteidhez

### 3.1 lépés: AI Konfiguráció Módosítása

1. **Frissítsd az OpenAI modellt:**
```bash
# Válts más modellre (ha elérhető a régiódban)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Telepítsd újra az új konfigurációval
azd deploy
```

2. **Adj hozzá további AI szolgáltatásokat:**

Szerkeszd az `infra/main.bicep` fájlt a Document Intelligence hozzáadásához:

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

### 3.2 lépés: Környezet-Specifikus Konfigurációk

**Legjobb gyakorlat**: Különböző konfigurációk fejlesztéshez és termeléshez.

1. **Hozz létre egy termelési környezetet:**
```bash
azd env new myai-production
```

2. **Állítsd be a termelés-specifikus paramétereket:**
```bash
# A gyártás általában magasabb SKU-kat használ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# További biztonsági funkciók engedélyezése
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labor Gyakorlat 3.1: Költségoptimalizálás**

**Feladat**: Állítsd be a sablont költséghatékony fejlesztéshez.

**Feladatok:**
1. Azonosítsd, mely SKU-k állíthatók ingyenes/alap szintre
2. Állíts be környezeti változókat minimális költség érdekében
3. Telepítsd és hasonlítsd össze a költségeket a termelési konfigurációval

**Megoldási tippek:**
- Használd az F0 (ingyenes) szintet Cognitive Services esetében, ha lehet
- A fejlesztéshez használj Basic szintű Search Service-t
- Fontold meg a Consumption terv használatát Functions-hez

## 4. Modul: Biztonság és Termelési Legjobb Gyakorlatok

### 4.1 lépés: Biztonságos Hitelesítő Adatkezelés

**Jelenlegi kihívás**: Sok AI alkalmazás keménykódolja az API kulcsokat vagy nem biztonságos tárolást használ.

**AZD Megoldás**: Kezelt Identity + Key Vault integráció.

1. **Tekintsd át a sablon biztonsági konfigurációját:**
```bash
# Keresse meg a Key Vault és a Kezelt Identitás konfigurációját
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizd, hogy a Kezelt Identity működik:**
```bash
# Ellenőrizze, hogy a webalkalmazásnak megfelelő azonosítási konfigurációja van-e
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 lépés: Hálózati Biztonság

1. **Engedélyezd a privát végpontokat** (ha még nincs beállítva):

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

### 4.3 lépés: Monitorozás és Megfigyelhetőség

1. **Konfiguráld az Application Insights-t:**
```bash
# Az Application Insights-et automatikusan kell konfigurálni
# Ellenőrizze a konfigurációt:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Állíts be AI-specifikus monitorozást:**

Adj hozzá egyedi AI műveleti metrikákat:
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

**Feladat**: Vizsgáld át a telepítésed biztonsági legjobb gyakorlatait.

**Ellenőrzőlista:**
- [ ] Nincs keménykódolt titok sem kódban, sem konfigurációban
- [ ] Kezelt Identity szolgál szolgáltatás közti hitelesítésre
- [ ] Key Vault tárol érzékeny konfigurációt
- [ ] Hálózati hozzáférés megfelelően korlátozott
- [ ] Monitorozás és naplózás aktív

## 5. Modul: Saját AI Alkalmazás Átalakítása

### 5.1 lépés: Értékelő Munkalap

**Az alkalmazás átalakítása előtt** válaszold meg a következőket:

1. **Alkalmazás architektúra:**
   - Milyen AI szolgáltatásokat használ az alkalmazás?
   - Milyen számítási erőforrásokat igényel?
   - Szüksége van adatbázisra?
   - Milyen függőségek vannak a szolgáltatások között?

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokat kezel az alkalmazás?
   - Milyen megfelelőségi követelmények vannak?
   - Szükséges-e privát hálózat?

3. **Skálázási követelmények:**
   - Mekkora a várható terhelés?
   - Kell-e automatikus skálázás?
   - Vannak-e régiós követelmények?

### 5.2 lépés: AZD Sablon Létrehozása

**Kövesd ezt a mintát az alkalmazás átalakításához:**

1. **Hozd létre az alap szerkezetet:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD sablon inicializálása
azd init --template minimal
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

### **Labor Gyakorlat 5.1: Sablonkészítés Kihívás**

**Kihívás**: Hozz létre egy AZD sablont egy dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**
- Microsoft Foundry Models tartalomelemzéshez
- Document Intelligence OCR-hez
- Tárfiók dokumentum feltöltésekhez
- Function App feldolgozó logikához
- Webalkalmazás felhasználói felülethez

**Extra pontok:**
- Hibakezelés megfelelő hozzáadása
- Költségbecslés beillesztése
- Monitorozási műszerfal biztosítása

## 6. Modul: Gyakori Hibák Hibakeresése

### Gyakori Telepítési Hibák

#### Hiba 1: OpenAI Szolgáltatás Kvóta Túllépve
**Tünetek:** Telepítés kvóta hiba miatt meghiúsul  
**Megoldások:**
```bash
# Ellenőrizze az aktuális kvótákat
az cognitiveservices usage list --location eastus

# Kérjen kvótaemelést vagy próbáljon meg egy másik régiót használni
azd env set AZURE_LOCATION westus2
azd up
```

#### Hiba 2: Modell Nem Elérhető a Régióban
**Tünetek:** AI válaszok sikertelenek vagy modell telepítési hibák  
**Megoldások:**
```bash
# Ellenőrizze a modell elérhetőségét régiónként
az cognitiveservices model list --location eastus

# Frissítés elérhető modellre
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Hiba 3: Jogosultsági Problémák
**Tünetek:** 403 Forbidden hibák AI szolgáltatások hívásakor  
**Megoldások:**
```bash
# Szerepkiosztások ellenőrzése
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Hiányzó szerepkörök hozzáadása
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Teljesítményproblémák

#### Hiba 4: Lassú AI Válaszok
**Vizsgálati lépések:**
1. Nézd meg az Application Insights teljesítménymutatóit
2. Vizsgáld az OpenAI szolgáltatás mérőszámait az Azure portálon
3. Ellenőrizd a hálózati kapcsolódást és késleltetést

**Megoldások:**
- Gyakori lekérdezések gyorsítótárazása
- Megfelelő OpenAI modell használata az esethez
- Olvasó replika használata nagy terhelés esetén

### **Labor Gyakorlat 6.1: Hibakeresési Kihívás**

**Forgatókönyv**: A telepítés sikeres volt, de az alkalmazás 500-as hibákat dob.

**Hibakeresési feladatok:**
1. Nézd meg az alkalmazás naplóit
2. Ellenőrizd a szolgáltatáskapcsolatot
3. Teszteld a hitelesítést
4. Vizsgáld át a konfigurációt

**Használható eszközök:**
- `azd show` a telepítés áttekintéséhez
- Azure portál részletes szolgáltatásnaplóinak megtekintéséhez
- Application Insights az alkalmazás telemetriájához

## 7. Modul: Monitorozás és Optimalizálás

### 7.1 lépés: Átfogó Monitorozás Beállítása

1. **Egyedi műszerfalak létrehozása:**

Navigálj az Azure portálra és hozz létre egy műszerfalat az alábbiakkal:
- OpenAI kérések száma és késleltetés
- Alkalmazás hibaarányai
- Erőforrás kihasználtság
- Költségkövetés

2. **Értesítések beállítása:**
```bash
# Figyelmeztetés magas hibaarány esetén
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 7.2 lépés: Költségoptimalizálás

1. **Elemzd a jelenlegi költségeket:**
```bash
# Használja az Azure CLI-t a költségadatok lekéréséhez
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Valósíts meg költségkontrollokat:**
- Költségkeret értesítések beállítása
- Automatikus skálázási szabályok alkalmazása
- Kérések gyorsítótárazása
- OpenAI token felhasználás figyelése

### **Labor Gyakorlat 7.1: Teljesítményoptimalizálás**

**Feladat**: Optimalizáld az AI alkalmazásod teljesítményt és költséget egyaránt.

**Javítandó mutatók:**
- Átlagos válaszidő 20%-kal csökkentése
- Havi költség 15%-kal csökkentése
- 99,9%-os rendelkezésre állás fenntartása

**Próbálandó stratégiák:**
- Válaszgyorsítótárazás bevezetése
- Promptok finomhangolása tokenhatékonyságra
- Megfelelő számítási SKU kiválasztása
- Megfelelő automatikus skálázás beállítása

## Végső Kihívás: Végponttól-Végpontig Megvalósítás

### Kihívás Forgatókönyv

Feladat egy termelésre kész AI-alapú ügyfélszolgálati chatbot létrehozása a következő követelményekkel:

**Funkcionális követelmények:**
- Webes interfész az ügyfélkapcsolathoz
- Microsoft Foundry Models integráció válaszokhoz
- Dokumentumkeresés a Cognitive Search segítségével
- Integráció meglévő ügyféladatbázissal
- Többnyelvű támogatás

**Nem funkcionális követelmények:**
- 1000 egyidejű felhasználó kezelése
- 99,9% rendelkezésre állási SLA
- SOC 2 megfelelőség
- Költség max. 500 USD/hónap
- Több környezetbe telepítés (fejlesztői, teszt, termelési)

### Megvalósítási Lépések

1. **Tervezd meg az architektúrát**
2. **Hozd létre az AZD sablont**
3. **Valósítsd meg a biztonsági intézkedéseket**
4. **Állíts be monitorozást és értesítéseket**
5. **Hozz létre telepítési pipeline-okat**
6. **Dokumentáld a megoldást**

### Értékelési Kritériumok

- ✅ **Funkcionalitás**: Minden követelmény teljesül?
- ✅ **Biztonság**: Be vannak-e tartva a legjobb gyakorlatok?
- ✅ **Skálázhatóság**: Kezeli-e a terhelést?
- ✅ **Karbantarthatóság**: Jól szervezett-e a kód és infrastruktúra?
- ✅ **Költség**: Költségvetésen belül marad?

## További Források

### Microsoft Dokumentáció
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Szolgáltatás Dokumentáció](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

### Minta Sablonok
- [Microsoft Foundry Models Chat Alkalmazás](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat Alkalmazás Gyorsindító](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Közösségi Források
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Remek AZD Sablonok](https://azure.github.io/awesome-azd/)

## 🎓 Teljesítési Tanúsítvány

Gratulálunk! Teljesítetted az AI Műhely Laboratóriumot. Most már képes vagy:
- ✅ Konvertáld a meglévő AI alkalmazásokat AZD sablonokká  
- ✅ Telepíts éles használatra kész AI alkalmazásokat  
- ✅ Vezesd be a biztonsági legjobb gyakorlatokat az AI munkaterhelésekhez  
- ✅ Kövesd nyomon és optimalizáld az AI alkalmazások teljesítményét  
- ✅ Hibaelhárítás a gyakori telepítési problémákkal kapcsolatban  

### Következő lépések  
1. Alkalmazd ezeket a mintákat a saját AI projektjeidben  
2. Juttasd vissza a sablonokat a közösségnek  
3. Csatlakozz a Microsoft Foundry Discordhoz a folyamatos támogatásért  
4. Fedezz fel haladó témákat, mint például a több régiós telepítések  

---

**Workshop visszajelzés**: Segíts nekünk fejleszteni ezt a workshopot, és oszd meg tapasztalataidat a [Microsoft Foundry Discord #Azure csatornáján](https://discord.gg/microsoft-azure).  

---

**Fejezet navigáció:**  
- **📚 Kurzus főoldala**: [AZD kezdőknek](../../README.md)  
- **📖 Jelenlegi fejezet**: 2. fejezet – AI-első fejlesztés  
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)  
- **➡️ Következő**: [Produci AI legjobb gyakorlatok](production-ai-practices.md)  
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)  

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és az AZD, valamint AI telepítések témájú beszélgetésekért.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) használatával fordítottuk le. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvi változatát tekintsék a hiteles forrásnak. Kritikus információk esetén javasolt szakmai, emberi fordítást igénybe venni. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->