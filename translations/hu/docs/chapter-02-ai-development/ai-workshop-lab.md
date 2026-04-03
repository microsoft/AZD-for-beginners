# AI Workshop Lab: AZD-be telepíthető AI megoldások készítése

**Fejezet navigáció:**  
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)  
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés  
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)  
- **➡️ Következő**: [AI legjobb gyakorlatok éles környezetben](production-ai-practices.md)  
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Műhely áttekintése

Ez a gyakorlati laborvezető fejlesztőknek mutatja be, hogyan vehetnek egy meglévő AI sablont és telepíthetik azt Azure Developer CLI (AZD) használatával. Megtanulhatod az alapvető mintákat az éles környezetbe szánt AI telepítésekhez a Microsoft Foundry szolgáltatások segítségével.

> **Érvényesítési megjegyzés (2026-03-25):** Ez a műhely az `azd` `1.23.12` verziója alapján lett ellenőrizve. Ha a helyi telepítésed régebbi, frissíts AZD-re a kezdés előtt, hogy az autentikáció, sablon és telepítési munkafolyamat megegyezzen az alábbi lépésekkel.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alapvető Azure ismeretek, AI/ML alapfogalmak ismerete  

## 🎓 Tanulási célok

A labor végére képes leszel:  
- ✅ Egy meglévő AI alkalmazást AZD sablonokká alakítani  
- ✅ Konfigurálni Microsoft Foundry szolgáltatásokat AZD-vel  
- ✅ Biztonságos hitelesítő adatkezelést megvalósítani AI szolgáltatásokhoz  
- ✅ Éles környezetbe kész AI alkalmazásokat telepíteni megfigyeléssel  
- ✅ Gyakori AI telepítési hibákat elhárítani

## Előfeltételek

### Szükséges eszközök
- Telepített [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- Telepített [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- Telepített [Git](https://git-scm.com/)  
- Kódszerkesztő (VS Code ajánlott)  

### Azure erőforrások
- Azure előfizetés közreműködői jogosultsággal  
- Hozzáférés a Microsoft Foundry Models szolgáltatásokhoz (vagy az igénylés lehetősége)  
- Erőforráscsoport létrehozási jogosultság  

### Szakmai előfeltételek
- Az Azure szolgáltatások alapvető ismerete  
- Parancssori felületek használatának ismerete  
- AI/ML alapfogalmak (API-k, modellek, promptok)  

## Labor beállítása

### 1. lépés: Környezet előkészítése

1. **Ellenőrizd az eszközök telepítését:**  
```bash
# Ellenőrizze az AZD telepítését
azd version

# Ellenőrizze az Azure CLI-t
az --version

# Jelentkezzen be az Azure-ba az AZD munkafolyamatokhoz
azd auth login

# Csak akkor jelentkezzen be az Azure CLI-be, ha az diagnosztika közben az az parancsokat kíván futtatni
az login
```
  
Ha több bérlőn dolgozol vagy az előfizetés nem észlelhető automatikusan, próbáld újra a `azd auth login --tenant-id <tenant-id>` paranccsal.

2. **Klónozd a műhely kódtárát:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## 1. modul: AZD szerkezetének megértése AI alkalmazásokhoz

### Egy AI-ready AZD sablon felépítése

Fedezd fel az AI-ready AZD sablon kulcsfontosságú fájljait:  

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
  
### **Labor gyakorlat 1.1: A konfiguráció felfedezése**

1. **Nézd meg az azure.yaml fájlt:**  
```bash
cat azure.yaml
```
  
**Amit keresünk:**  
- AI komponensek szolgáltatásdefiníciói  
- Környezeti változók leképezései  
- Host konfigurációk  

2. **Nézd át a main.bicep infrastruktúrát:**  
```bash
cat infra/main.bicep
```
  
**Fő AI minták azonosítása:**  
- Microsoft Foundry Models szolgáltatás létrehozása  
- Cognitive Search integráció  
- Biztonságos kulcskezelés  
- Hálózati biztonsági beállítások  

### **Beszélgetési pont:** Miért fontosak ezek a minták AI esetén?

- **Szolgáltatásfüggőségek:** Az AI alkalmazások gyakran több összehangolt szolgáltatást igényelnek  
- **Biztonság:** Az API kulcsokat és végpontokat biztonságosan kell kezelni  
- **Skálázhatóság:** Az AI munkaterhelések egyedi skálázási igényekkel rendelkeznek  
- **Költséggazdálkodás:** Az AI szolgáltatások költségesek lehetnek, ha nem megfelelően vannak beállítva  

## 2. modul: Az első AI alkalmazás telepítése

### 2.1 lépés: A környezet inicializálása

1. **Hozz létre egy új AZD környezetet:**  
```bash
azd env new myai-workshop
```
  
2. **Állítsd be a szükséges paramétereket:**  
```bash
# Állítsa be a kívánt Azure régiót
azd env set AZURE_LOCATION eastus

# Opcionális: Állítsa be a specifikus OpenAI modellt
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### 2.2 lépés: Infrastruktúra és alkalmazás telepítése

1. **Telepítés AZD-vel:**  
```bash
azd up
```
  
**Mi történik az `azd up` során:**  
- ✅ Microsoft Foundry Models szolgáltatás létrehozása  
- ✅ Cognitive Search szolgáltatás létrehozása  
- ✅ App Service beállítása a webalkalmazáshoz  
- ✅ Hálózat és biztonság konfigurálása  
- ✅ Alkalmazáskód telepítése  
- ✅ Megfigyelés és naplózás beállítása  

2. **Kövesd a telepítés előrehaladását**, és jegyezd meg az létrehozott erőforrásokat.

### 2.3 lépés: Telepítés ellenőrzése

1. **Ellenőrizd a telepített erőforrásokat:**  
```bash
azd show
```
  
2. **Nyisd meg a telepített alkalmazást:**  
```bash
azd show
```
  
Nyisd meg a `azd show` által megjelenített webes végpontot.

3. **Teszteld az AI funkcionalitást:**  
   - Navigálj a webalkalmazásba  
   - Próbálj ki minta lekérdezéseket  
   - Ellenőrizd, hogy az AI válaszok működnek-e  

### **Labor gyakorlat 2.1: Hibakeresés gyakorlása**

**Forgatókönyv:** A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori hibák ellenőrzése:**  
1. **OpenAI API kulcsok:** Ellenőrizd, hogy helyesen vannak-e beállítva  
2. **Modell elérhetőség:** Ellenőrizd, hogy a régiód támogatja-e a modellt  
3. **Hálózati kapcsolat:** Győződj meg róla, hogy a szolgáltatások kommunikálnak  
4. **RBAC jogosultságok:** Ellenőrizd, hogy az alkalmazás hozzáfér az OpenAI-hoz  

**Hibakereső parancsok:**  
```bash
# Környezeti változók ellenőrzése
azd env get-values

# Telepítési naplók megtekintése
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Az OpenAI telepítés állapotának ellenőrzése
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## 3. modul: AI alkalmazások testreszabása igény szerint

### 3.1 lépés: AI konfiguráció módosítása

1. **Frissítsd az OpenAI modellt:**  
```bash
# Váltson másik modellre (ha elérhető az Ön régiójában)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Telepítse újra az új konfigurációval
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
  
### 3.2 lépés: Környezet-specifikus konfigurációk

**Legjobb gyakorlat:** Fejlesztés és éles környezet külön beállításai.

1. **Hozz létre egy éles környezetet:**  
```bash
azd env new myai-production
```
  
2. **Állíts be éles környezet specifikus paramétereket:**  
```bash
# A gyártás általában magasabb SKU-kat használ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# További biztonsági funkciók engedélyezése
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Labor gyakorlat 3.1: Költségoptimalizálás**

**Feladat:** Állítsd be a sablont költséghatékony fejlesztéshez.

**Teendők:**  
1. Azonosítsd, mely SKU-k állíthatók díjmentes/alapszintű szintre  
2. Konfiguráld a környezeti változókat minimális költséghez  
3. Telepítsd és hasonlítsd össze a költségeket az éles konfigurációval  

**Megoldási tippek:**  
- Használj F0 (ingyenes) szintet Cognitive Services esetén, ha lehet  
- Fejlesztéshez válassz Basic szintű Search szolgáltatást  
- Fontold meg Functions esetén a Consumption terv használatát  

## 4. modul: Biztonság és éles környezet legjobb gyakorlatai

### 4.1 lépés: Biztonságos hitelesítő adatkezelés

**Jelenlegi kihívás:** Sok AI alkalmazás kulcsokat keménykódol vagy nem biztonságos tárolást használ.

**AZD megoldás:** Kezelt identitás + Key Vault integráció.

1. **Nézd át a sablonod biztonsági beállításait:**  
```bash
# Keresd a Key Vault és a Kezelt Identitás beállításokat
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Ellenőrizd a Kezelt Identitás működését:**  
```bash
# Ellenőrizze, hogy a webalkalmazás rendelkezik-e a megfelelő azonosító konfigurációval
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### 4.2 lépés: Hálózati biztonság

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
  
### 4.3 lépés: Megfigyelés és láthatóság

1. **Konfiguráld az Application Insights-t:**  
```bash
# Az Application Insights-nak automatikusan kell konfigurálódnia
# Ellenőrizze a konfigurációt:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Állíts be AI-specifikus megfigyelést:**

Adj hozzá egyedi mérőszámokat az AI műveletekhez:  
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
  
### **Labor gyakorlat 4.1: Biztonsági audit**

**Feladat:** Vizsgáld át a telepítésed biztonsági legjobb gyakorlatait.

**Ellenőrző lista:**  
- [ ] Nincsenek keménykódolt titkok a kódban vagy konfigurációban  
- [ ] Kezelt Identitás szerepel a szolgáltatás-közötti hitelesítéshez  
- [ ] Key Vault tárolja az érzékeny konfigurációt  
- [ ] Hálózati hozzáférés megfelelően korlátozott  
- [ ] Megfigyelés és naplózás engedélyezve  

## 5. modul: Saját AI alkalmazás átalakítása

### 5.1 lépés: Kiértékelő munkalap

**Alkalmazás átkonvertálása előtt válaszold meg ezeket:**  

1. **Alkalmazás architektúra:**  
   - Milyen AI szolgáltatásokat használ az alkalmazásod?  
   - Milyen számítási erőforrások szükségesek?  
   - Szükség van adatbázisra?  
   - Milyen függőségek vannak a szolgáltatások között?

2. **Biztonsági követelmények:**  
   - Milyen érzékeny adatokat kezel az alkalmazás?  
   - Milyen megfelelőségi követelmények vannak?  
   - Szükséges privát hálózat?

3. **Skálázási igények:**  
   - Mekkora várható terhelés?  
   - Szükség van automatikus skálázásra?  
   - Van régióspecifikus követelmény?

### 5.2 lépés: Hozd létre az AZD sablont

**Kövesd ezt a mintát az alkalmazás átalakításához:**

1. **Hozd létre az alap szerkezetet:**  
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
  
3. **Készíts infrastruktúra sablonokat:**  

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
  
### **Labor gyakorlat 5.1: Sablon készítési kihívás**

**Feladat:** Hozz létre egy AZD sablont egy dokumentum feldolgozó AI alkalmazáshoz.

**Követelmények:**  
- Microsoft Foundry Models tartalomelemzéshez  
- Document Intelligence OCR-hez  
- Storage Account dokumentumfeltöltéshez  
- Function App feldolgozó logikához  
- Webalkalmazás felhasználói felülethez  

**Bónusz pontok:**  
- Hibakezelés implementálása  
- Költségbecslés beépítése  
- Megfigyelési dashboardok létrehozása  

## 6. modul: Gyakori hibák elhárítása

### Gyakori telepítési problémák

#### Probléma 1: OpenAI szolgáltatási kvóta túllépés  
**Tünetek:** Telepítés kvóta hiba miatt meghiúsul  
**Megoldások:**  
```bash
# Aktuális kvóták ellenőrzése
az cognitiveservices usage list --location eastus

# Kvótaemelés kérése vagy más régió kipróbálása
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Probléma 2: Modell nem elérhető a régióban  
**Tünetek:** AI válaszok hibásak vagy modell telepítési hibák  
**Megoldások:**  
```bash
# Ellenőrizze a modell elérhetőségét régiónként
az cognitiveservices model list --location eastus

# Frissítés elérhető modellre
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Probléma 3: Jogosultsági problémák  
**Tünetek:** 403 Forbidden hibák AI szolgáltatások hívásakor  
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
  
### Teljesítmény problémák

#### Probléma 4: Lassú AI válaszok  
**Vizsgálati lépések:**  
1. Nézd meg az Application Insights teljesítménymutatóit  
2. Ellenőrizd az OpenAI szolgáltatási metrikákat az Azure portálon  
3. Vizsgáld a hálózati kapcsolatot és késleltetést  

**Megoldások:**  
- Implementálj gyorsítótárazást gyakori lekérdezésekhez  
- Használj megfelelő OpenAI modellt az esetedhez  
- Gondolkodj olvasó replikákon nagy terheléshez  

### **Labor gyakorlat 6.1: Hibakeresési kihívás**

**Forgatókönyv:** A telepítés sikeres, de az alkalmazás 500-as hibákat ad vissza.

**Hibakeresési feladatok:**  
1. Ellenőrizd az alkalmazás naplóit  
2. Ellenőrizd a szolgáltatás kapcsolatokat  
3. Teszteld az autentikációt  
4. Vizsgáld át a konfigurációt  

**Használható eszközök:**  
- `azd show` a telepítési áttekintéshez  
- Azure portál részletes szolgáltatásnaplókhoz  
- Application Insights az alkalmazás telemetriához  

## 7. modul: Megfigyelés és optimalizálás

### 7.1 lépés: Átfogó megfigyelés beállítása

1. **Készíts egyedi dashboardokat:**  

Az Azure portálon navigálva hozz létre dashboardot a következőkkel:  
- OpenAI kérés darabszám és késleltetés  
- Alkalmazáshibák aránya  
- Erőforrás kihasználás  
- Költségkövetés  

2. **Állíts be riasztásokat:**  
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

1. **Elemezd a jelenlegi költségeket:**  
```bash
# Használja az Azure CLI-t a költségadatok lekéréséhez
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Vezess be költségkontrollokat:**  
- Állíts be költségkeret riasztásokat  
- Használj automatikus skálázási szabályokat  
- Implementálj lekérdezés gyorsítótárazást  
- Figyeld az OpenAI token használatot  

### **Labor gyakorlat 7.1: Teljesítmény optimalizálás**

**Feladat:** Optimalizáld AI alkalmazásodat teljesítmény és költség szempontból.

**Javítandó mutatók:**  
- Átlagos válaszidő 20%-os csökkentése  
- Havi költségek 15%-os csökkentése  
- 99,9%-os rendelkezésre állás megőrzése  

**Próbálandó stratégiák:**  
- Válasz gyorsítótárazás bevezetése  
- Promptok optimalizálása tokenhatékonyságra  
- Megfelelő számítási SKU-k választása  
- Helyes automatikus skálázás beállítása  

## Végső kihívás: Végponttól végpontig megvalósítás

### Kihívás forgatókönyv

Te feladatod egy éles környezetbe szánt, AI-alapú ügyfélszolgálati chatbot létrehozása a következő követelményekkel:

**Funkcionális követelmények:**  
- Webes felület ügyfél-interakciókra  
- Microsoft Foundry Models integráció válaszokhoz  
- Dokumentumkeresési képesség Cognitive Search segítségével  
- Integráció meglévő ügyfél adatbázissal  
- Többnyelvű támogatás  

**Nem funkcionális követelmények:**  
- 1000 párhuzamos felhasználó kezelése  
- 99,9%-os rendelkezésre állási SLA  
- SOC 2 megfelelőség  
- Költség havi max. 500 USD  
- Több környezetbe telepítés (fejlesztés, staging, éles)  

### Megvalósítási lépések

1. Tervezd meg az architektúrát  
2. Készítsd el az AZD sablont  
3. Valósítsd meg a biztonsági intézkedéseket  
4. Állíts be megfigyelést és riasztást  
5. Készíts telepítési csővezetéket  
6. Dokumentáld a megoldást  

### Értékelési szempontok

- ✅ **Funkcionalitás:** Minden követelmény teljesül?  
- ✅ **Biztonság:** Be vannak-e tartva a legjobb gyakorlatok?  
- ✅ **Skálázhatóság:** Kezeli a terhelést?  
- ✅ **Karbantarthatóság:** Jól szervezett kód és infrastruktúra?  
- ✅ **Költség:** Határértéken belül marad?  

## További források

### Microsoft dokumentáció  
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models szolgáltatás dokumentáció](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

### Mintasablonok
- [Microsoft Foundry Modellek Csevegőalkalmazás](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Csevegőalkalmazás Gyorsindítás](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Csevegés](https://github.com/Azure-Samples/contoso-chat)

### Közösségi Források
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Sablonok](https://azure.github.io/awesome-azd/)

## 🎓 Teljesítési Tanúsítvány

Gratulálunk! Befejezted az AI Műhely Laborját. Mostantól képesnek kell lenned:

- ✅ Meglévő AI alkalmazásokat AZD sablonokká alakítani
- ✅ Termelésre kész AI alkalmazásokat telepíteni
- ✅ AI munkaterhelések biztonsági legjobb gyakorlatait megvalósítani
- ✅ Figyelni és optimalizálni az AI alkalmazások teljesítményét
- ✅ Gyakori telepítési problémákat elhárítani

### Következő lépések
1. Alkalmazd ezeket a mintákat a saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösséghez
3. Csatlakozz a Microsoft Foundry Discord csatornához a folyamatos támogatásért
4. Fedezz fel haladó témákat, mint például a több régiós telepítések

---

**Műhely visszajelzés**: Segíts nekünk fejleszteni ezt a műhelyt azzal, hogy megosztod a tapasztalataidat a [Microsoft Foundry Discord #Azure csatornáján](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-központú fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [Termelési AI legjobb gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és beszélgetésekért az AZD és AI telepítések témájában.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) használatával készült. Miközben a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítás ajánlott. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->