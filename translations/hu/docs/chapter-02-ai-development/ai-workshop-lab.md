# AI Workshop Lab: AI Megoldásaid AZD-Deploy-kezelhetővé Tétele

**Fejezet Navigáció:**
- **📚 Kurzus Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 2. fejezet - AI-First Fejlesztés
- **⬅️ Előző**: [AI Modell Kiszolgálás](ai-model-deployment.md)
- **➡️ Következő**: [Termelési AI Legjobb Gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Workshop Áttekintés

Ez a gyakorlati labor útmutatja a fejlesztőket egy meglévő AI sablon átvételén és Azure Developer CLI (AZD) használatával való telepítésén keresztül. Megtanulod a lényeges mintákat a termelési AI telepítésekhez Microsoft Foundry szolgáltatások használatával.

> **Érvényességi megjegyzés (2026-03-25):** Ezt a workshopot a `azd` `1.23.12` verzióval ellenőriztük. Ha a helyi telepítésed régebbi, frissítsd az AZD-t a kezdés előtt, hogy az autentikáció, sablon és telepítési folyamat megfeleljen az alábbi lépéseknek.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alap Azure ismeretek, AI/ML fogalmak ismerete

## 🎓 Tanulási Célok

A workshop végére képes leszel:
- ✅ Átalakítani egy meglévő AI alkalmazást AZD sablonok használatára
- ✅ Konfigurálni Microsoft Foundry szolgáltatásokat AZD segítségével
- ✅ Megvalósítani biztonságos hitelesítő adat kezelést AI szolgáltatásokhoz
- ✅ Termelésre kész AI alkalmazásokat telepíteni monitorozással
- ✅ Gyakori AI telepítési hibákat elhárítani

## Előfeltételek

### Szükséges Eszközök
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) telepítve
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) telepítve
- [Git](https://git-scm.com/) telepítve
- Kódszerkesztő (VS Code ajánlott)

### Azure Erőforrások
- Azure előfizetés szerkesztői jogosultsággal
- Hozzáférés Microsoft Foundry Models szolgáltatásokhoz (vagy kérhető hozzáférés)
- Erőforráscsoport létrehozási jogosultságok

### Ismeretek
- Alapvető Azure szolgáltatások ismerete
- Parancssori felületek ismerete
- Alap AI/ML fogalmak (API-k, modellek, utasítások)

## Labor Beállítás

### 1. lépés: Környezet Előkészítése

1. **Ellenőrizd az eszközök telepítését:**
```bash
# Az AZD telepítés ellenőrzése
azd version

# Az Azure CLI ellenőrzése
az --version

# Bejelentkezés Azure-ba az AZD munkafolyamatokhoz
azd auth login

# Jelentkezzen be az Azure CLI-be, csak ha az az parancsokat tervezi futtatni a diagnosztika során
az login
```

Ha több tenant között dolgozol vagy az előfizetésed nem kerül automatikusan felismerésre, próbáld meg újra a `azd auth login --tenant-id <tenant-id>` paranccsal.

2. **Klónozd a workshop repót:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. modul: AZD Struktúra Megértése AI Alkalmazásokhoz

### Egy AI AZD Sablon Felépítése

Fedezd fel a kulcsfontosságú fájlokat egy AI-ra kész AZD sablonban:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Laborgyakorlat 1.1: Konfiguráció Áttekintése**

1. **Nézd át az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Figyeld meg:**
- AI komponensek szolgáltatásdefiníciói
- Környezeti változó hozzárendelések
- Host konfigurációk

2. **Vizsgáld meg a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Jellegzetes AI minták, amiket felismerhetsz:**
- Microsoft Foundry Models szolgáltatás kiépítése
- Azure AI Search integráció
- Biztonságos kulcskezelés
- Hálózati biztonsági beállítások

### **Megbeszélési pont:** Miért lényegesek ezek a minták az AI számára

- **Szolgáltatásfüggőségek:** AI alkalmazások gyakran több összhangban működő szolgáltatást igényelnek  
- **Biztonság:** API kulcsok és végpontok biztonságos kezelése szükséges  
- **Skálázhatóság:** Az AI terhelések egyedi méretezési igényekkel rendelkeznek  
- **Költségmenedzsment:** AI szolgáltatások drágák lehetnek, ha nem megfelelően konfigurálják

## 2. modul: Az Első AI Alkalmazásod Telepítése

### 2.1 lépés: Környezet Inicializálása

1. **Hozz létre egy új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Állítsd be a szükséges paramétereket:**
```bash
# Állítsa be a kívánt Azure régiót
azd env set AZURE_LOCATION eastus

# Opcionális: Állítsa be a konkrét OpenAI modellt
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 2.2 lépés: Infrastruktúra és Alkalmazás Telepítése

1. **Telepítsd AZD-vel:**
```bash
azd up
```

**Mi történik az `azd up` végrehajtásakor:**
- ✅ Microsoft Foundry Models szolgáltatás kiépítése  
- ✅ Azure AI Search szolgáltatás létrehozása  
- ✅ Webalkalmazás App Service beállítása  
- ✅ Hálózat- és biztonsági konfigurálás  
- ✅ Alkalmazáskód telepítése  
- ✅ Monitorozás és naplózás beállítása

2. **Kövess a telepítés előrehaladását** és jegyezd fel a létrejövő erőforrásokat.

### 2.3 lépés: Telepítés Ellenőrzése

1. **Ellenőrizd a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyisd meg a telepített alkalmazást:**
```bash
azd show
```

Nyisd meg a `azd show` kimenetben megjelenő webes végpontot.

3. **Teszteld az AI funkciót:**
   - Navigálj a webalkalmazásba  
   - Próbálj ki mintakérdéseket  
   - Ellenőrizd, hogy az AI válaszok megfelelően működnek  

### **Laborgyakorlat 2.1: Hibakeresési Gyakorlat**

**Forgatókönyv:** A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori hibák ellenőrzése:**
1. **OpenAI API kulcsok:** Ellenőrizd, hogy helyesen vannak beállítva  
2. **Modell elérhetőség:** Nézd meg, hogy a régió támogatja-e a modellt  
3. **Hálózati kapcsolat:** Győződj meg arról, hogy a szolgáltatások tudnak kommunikálni  
4. **RBAC jogosultságok:** Ellenőrizd, hogy az alkalmazás hozzáfér-e az OpenAI-hoz

**Hibakereső parancsok:**
```bash
# Környezeti változók ellenőrzése
azd env get-values

# Telepítési naplók megtekintése
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI telepítés állapotának ellenőrzése
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. modul: AI Alkalmazások Testreszabása

### 3.1 lépés: AI Konfiguráció Módosítása

1. **Frissítsd az OpenAI modellt:**
```bash
# Váltás egy másik modellre (ha elérhető a régiódban)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Telepítés újra az új konfigurációval
azd deploy
```

2. **Adj hozzá további AI szolgáltatásokat:**

Módosítsd az `infra/main.bicep` fájlt a Document Intelligence hozzáadásához:

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

### 3.2 lépés: Környezet Szerinti Konfigurációk

**Legjobb gyakorlat:** Különböző konfigurációk fejlesztéshez és termeléshez.

1. **Hozz létre egy production környezetet:**
```bash
azd env new myai-production
```

2. **Állítsd be a termelési paramétereket:**
```bash
# A gyártás általában magasabb SKU-kat használ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# További biztonsági funkciók engedélyezése
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laborgyakorlat 3.1: Költséghatékonyság**

**Feladat:** Állítsd be a sablont költséghatékony fejlesztésre.

**Feladatok:**
1. Azonosítsd, mely SKU-k állíthatók ingyenes/alapszintre  
2. Állítsd be a környezeti változókat minimális költség érdekében  
3. Telepítsd és hasonlítsd össze a költségeket a termelési konfigurációval

**Megoldási tippek:**
- Használj F0 (ingyenes) szintet az Azure AI szolgáltatásokhoz, ha lehetséges  
- Fejlesztésben a Search Service esetén Basic szint használata ajánlott  
- A Functions szolgáltatásnál fontold meg a Consumption terv használatát

## 4. modul: Biztonság és Termelési Legjobb Gyakorlatok

### 4.1 lépés: Biztonságos Hitelesítő Adat Kezelés

**Jelenlegi kihívás:** Sok AI alkalmazás hardkodolt API kulcsokat használ vagy biztonságtalan tárolási megoldásokat.

**AZD megoldás:** Kezelt identitás + Key Vault integráció.

1. **Nézd át a sablon biztonsági konfigurációját:**
```bash
# Keresse meg a Key Vault és a kezelt identitás konfigurációját
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizd a Managed Identity működését:**
```bash
# Ellenőrizze, hogy a webalkalmazás rendelkezik-e a megfelelő azonosító konfigurációval
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 lépés: Hálózati Biztonság

1. **Engedélyezd a privát végpontokat** (ha még nincs beállítva):

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

1. **Állítsd be az Application Insightst:**
```bash
# Az Application Insights-ot automatikusan kell konfigurálni
# Ellenőrizze a konfigurációt:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Állíts be AI-specifikus monitorozást:**

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

### **Laborgyakorlat 4.1: Biztonsági Ellenőrzés**

**Feladat:** Vizsgáld át a telepítésed biztonsági legjobb gyakorlatait.

**Ellenőrzőlista:**
- [ ] Nincs hardkodolt titok a kódban vagy konfigurációban  
- [ ] Managed Identity használata szolgáltatás-közötti hitelesítéshez  
- [ ] Key Vault érzékeny konfiguráció tárolására  
- [ ] Hálózati hozzáférés megfelelő korlátozása  
- [ ] Monitorozás és naplózás engedélyezve

## 5. modul: Saját AI Alkalmazás Átalakítása

### 5.1 lépés: Értékelő Munkaív

**Az alkalmazás átalakítása előtt válaszolj az alábbi kérdésekre:**

1. **Alkalmazás architektúra:**
   - Milyen AI szolgáltatásokat használ az alkalmazásod?  
   - Milyen számítási erőforrásokra van szüksége?  
   - Szükséges-e adatbázis?  
   - Milyen függőségek vannak a szolgáltatások között?  

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokat kezel az alkalmazásod?  
   - Milyen megfelelőségi követelmények vonatkoznak rá?  
   - Szükséged van privát hálózatra?  

3. **Skálázási követelmények:**
   - Mi a várható terhelés?  
   - Szükséges automatikus skálázás?  
   - Vannak régiós követelmények?  

### 5.2 lépés: AZD Sablon Készítése

**Kövesd ezt a mintát, hogy átalakítsd az alkalmazásod:**

1. **Hozd létre az alap struktúrát:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD sablon inicializálása
azd init --template minimal
```

2. **Készítsd el az azure.yaml fájlt:**
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

### **Laborgyakorlat 5.1: Sablonkészítő kihívás**

**Feladat:** Készíts AZD sablont egy dokumentumfeldolgozó AI alkalmazáshoz.

**Követelmények:**
- Microsoft Foundry Models tartalomelemzéshez  
- Document Intelligence OCR-hez  
- Storage Account dokumentumfeltöltésekhez  
- Function App feldolgozó logikához  
- Webalkalmazás felhasználói felülethez  

**Bónusz pontok:**
- Hibakezelés megfelelő kezelése  
- Költségbecslés beillesztése  
- Monitorozó műszerfalak beállítása

## 6. modul: Gyakori Hibák Elhárítása

### Gyakori Telepítési Problémák

#### 1. hiba: OpenAI Szolgáltatási Kvóta Túllépése  
**Tünetek:** Telepítés kvótahiba miatt meghiúsul  
**Megoldások:**  
```bash
# Ellenőrizze a jelenlegi kvótákat
az cognitiveservices usage list --location eastus

# Kvótaemelés kérése vagy másik régió kipróbálása
azd env set AZURE_LOCATION westus2
azd up
```

#### 2. hiba: Modell Nem Elérhető Régióban  
**Tünetek:** AI válaszok hibásak vagy modell telepítési hibák  
**Megoldások:**  
```bash
# Ellenőrizze a modell elérhetőségét régió szerint
az cognitiveservices model list --location eastus

# Frissítés az elérhető modellre
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### 3. hiba: Jogosultsági Problémák  
**Tünetek:** 403 Tiltott hibák AI szolgáltatás hívások során  
**Megoldások:**  
```bash
# Szerepkör-hozzárendelések ellenőrzése
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Hiányzó szerepkörök hozzáadása
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Teljesítménybeli Problémák

#### 4. hiba: Lassú AI Válaszok  
**Értékelési lépések:**
1. Ellenőrizd az Application Insights teljesítménymutatóit  
2. Vizsgáld át az OpenAI szolgáltatás mérőszámait az Azure portálon  
3. Ellenőrizd a hálózati kapcsolatot és késleltetést

**Megoldások:**
- Gyakori lekérdezésekhez bevezetni cache-elést  
- Használj az esetre megfelelő OpenAI modellt  
- Gondolkodj replikák alkalmazásában nagy terhelés esetén

### **Laborgyakorlat 6.1: Hibakeresési kihívás**

**Forgatókönyv:** A telepítés sikeres, de az alkalmazás 500-as hibákat ad vissza.

**Hibakeresési feladatok:**
1. Ellenőrizd az alkalmazás naplóit  
2. Vizsgáld a szolgáltatások közti kapcsolatot  
3. Teszteld az autentikációt  
4. Vizsgáld át a konfigurációt

**Használható eszközök:**
- `azd show` a telepítési áttekintéshez  
- Azure portál részletes szolgáltatásnaplókért  
- Application Insights az alkalmazás telemetriához

## 7. modul: Monitorozás és Optimalizálás

### 7.1 lépés: Teljes körű monitorozás beállítása

1. **Hozz létre egyedi műszerfalakat:**

Navigálj az Azure portálra és készíts műszerfalat az alábbiakkal:
- OpenAI kérések száma és késleltetése  
- Alkalmazási hibaarányok  
- Erőforrás kihasználtság  
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

1. **Elemezd az aktuális költségeket:**
```bash
# Az Azure CLI használata a költségadatok lekéréséhez
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Vezess be költségkontrollokat:**
- Állíts be költségkeret riasztásokat  
- Használj autoscaling szabályokat  
- Alkalmazz kérés cache-elést  
- Kövesd nyomon az OpenAI tokenhasználatot  

### **Laborgyakorlat 7.1: Teljesítményoptimalizálás**

**Feladat:** Optimalizáld AI alkalmazásod teljesítményt és költségeket.

**Javítandó mutatók:**
- Csökkentsd az átlagos válaszidőt 20%-kal  
- Csökkentsd a havi költségeket 15%-kal  
- Tartsd fenn a 99,9%-os rendelkezésre állást  

**Használandó stratégiák:**
- Válasz cache-elés bevezetése  
- Promptok optimalizálása token hatékonyságért  
- Megfelelő számítási SKU-k alkalmazása  
- Megfelelő autoscaling beállítása  

## Végső kihívás: Végponttól végpontig megvalósítás

### Kihívás Forgatókönyv

Arra kaptál feladatot, hogy hozz létre egy termelésre kész AI-alapú ügyfélszolgálati chatbotot az alábbi követelményekkel:

**Funkcionális követelmények:**
- Webes felület az ügyfél-interakciókhoz  
- Microsoft Foundry Models integráció válaszokhoz  
- Dokumentumkeresés Azure AI Search használatával  
- Integráció meglévő ügyféladatbázissal  
- Többnyelvű támogatás  

**Nem funkcionális követelmények:**
- 1000 egyidejű felhasználó kezelése  
- 99,9% SLA rendelkezésre állás  
- SOC 2 megfelelőség  
- Havi költség 500 dollár alatt  
- Több környezetbe telepítés (dev, staging, prod)  

### Megvalósítási lépések

1. Tervezd meg az architektúrát  
2. Készítsd el az AZD sablont  
3. Valósítsd meg a biztonsági intézkedéseket  
4. Állítsd be a monitorozást és riasztásokat  
5. Készíts telepítési folyamatokat  
6. Dokumentáld a megoldást  

### Értékelési szempontok

- ✅ **Funkcionalitás:** Minden követelmény teljesül?  
- ✅ **Biztonság:** Alkalmaztad a legjobb gyakorlatokat?  
- ✅ **Skálázhatóság:** Kezeli a terhelést?  
- ✅ **Fenntarthatóság:** Rendezett a kód és infrastruktúra?  
- ✅ **Költség:** Marad a kereten belül?  

## További források

### Microsoft Dokumentáció
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Szolgáltatás Dokumentáció](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

### Mintasablonok
- [Microsoft Foundry Models Chat Alkalmazás](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Gyorsindítás](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Közösségi források
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Tanúsítvány a kurzus elvégzéséről

Gratulálunk! Teljesítetted az AI Workshop laboratóriumot. Mostantól képes vagy:

- ✅ Meglévő AI alkalmazásokat konvertálni AZD sablonokká
- ✅ Telepíteni éles üzemre kész AI alkalmazásokat
- ✅ Biztonsági legjobb gyakorlatokat alkalmazni AI feladatokhoz
- ✅ Figyelni és optimalizálni az AI alkalmazások teljesítményét
- ✅ Hibaelhárítani a gyakori telepítési problémákat

### Következő lépések
1. Alkalmazd ezeket a mintákat a saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösség számára
3. Csatlakozz a Microsoft Foundry Discord szerverhez a folyamatos támogatásért
4. Fedezd fel a haladó témákat, mint például a több régiós telepítések

---

**Workshop visszajelzés**: Segíts nekünk a workshop fejlesztésében, és oszd meg tapasztalataidat a [Microsoft Foundry Discord #Azure csatornáján](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet – AI-First Fejlesztés
- **⬅️ Előző**: [AI modell telepítés](ai-model-deployment.md)
- **➡️ Következő**: [Éles AI legjobb gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz a közösségünkhöz támogatásért és AZD, AI telepítések témájú beszélgetésekhez.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->