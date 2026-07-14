# AI Műhely Lab: AI Megoldásaid AZD-Deployálhatóvá Tétele

**Fejezet Navigáció:**
- **📚 Kurzus Főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 2. Fejezet - AI-első Fejlesztés
- **⬅️ Előző**: [AI Modell Kiadás](ai-model-deployment.md)
- **➡️ Következő**: [Production AI Legjobb Gyakorlatok](production-ai-practices.md)
- **🚀 Következő Fejezet**: [3. Fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Műhely Áttekintés

Ez a gyakorlati labor fejlesztőket vezet végig azon a folyamaton, hogy egy meglévő AI sablont vegyenek és telepítsenek az Azure Developer CLI (AZD) használatával. Megismered a Microsoft Foundry szolgáltatásokkal történő termelési AI telepítések alapvető mintáit.

> **Ellenőrzési megjegyzés (2026-07-13):** Ezt a műhelyt az `azd` `1.27.1` verziója alapján ellenőriztük. Ha a helyi telepítésed régebbi, frissítsd az AZD-t a kezdés előtt, hogy az auth, sablon és telepítési munkafolyamat megegyezzen az alábbi lépésekkel.

**Időtartam:** 2-3 óra  
**Szint:** Középhaladó  
**Előfeltételek:** Alap Azure ismeretek, alap AI/ML fogalmak

## 🎓 Tanulási Célok

A műhely végére képes leszel:
- ✅ Egy meglévő AI alkalmazást AZD sablonokra konvertálni
- ✅ Microsoft Foundry szolgáltatásokat AZD-vel konfigurálni
- ✅ Biztonságos hitelesítő adatok kezelését megvalósítani AI szolgáltatásokhoz
- ✅ Termelésre kész AI alkalmazásokat monitorozással telepíteni
- ✅ Gyakori AI telepítési hibákat hibakeresni

## Előfeltételek

### Szükséges Eszközök
- Telepített [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Telepített [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Telepített [Git](https://git-scm.com/)
- Kódszerkesztő (VS Code ajánlott)

### Azure Erőforrások
- Azure előfizetés contributor jogosultsággal
- Hozzáférés a Microsoft Foundry Models szolgáltatásokhoz (vagy kérelmezési lehetőség)
- Erőforrás csoport létrehozási jogosultságok

### Tudás Előfeltételek
- Alapvető Azure szolgáltatások ismerete
- Parancssoros felületek ismerete
- Alap AI/ML fogalmak (API-k, modellek, kérdések)

## Labor Beállítás

### 1. lépés: Környezet Előkészítése

1. **Ellenőrizd az eszközök telepítését:**
```bash
# AZD telepítés ellenőrzése
azd version

# Azure CLI ellenőrzése
az --version

# Bejelentkezés az Azure-ba az AZD munkafolyamatokhoz
azd auth login

# Csak akkor jelentkezzen be az Azure CLI-be, ha tervez az az parancsokat futtatni a diagnosztika során
az login
```

Ha több bérlőn dolgozol, vagy az előfizetés nem érzékelhető automatikusan, próbáld meg újra az `azd auth login --tenant-id <tenant-id>` parancsot.

2. **Klónozd a műhely tárolót:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1. modul: AZD szerkezetének megértése AI alkalmazásokhoz

### AI AZD Sablon anatómiája

Fedezd fel egy AI-kész AZD sablon kulcsfájljait:

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

### **Labor Gyakorlat 1.1: A Konfiguráció felfedezése**

1. **Vizsgáld meg az azure.yaml fájlt:**
```bash
cat azure.yaml
```

**Amire figyelj:**
- Az AI komponensek szolgáltatás-definíciói
- Környezeti változók hozzárendelései
- Host konfigurációk

2. **Nézd át a main.bicep infrastruktúrát:**
```bash
cat infra/main.bicep
```

**Kulcs AI minták, amiket azonosítani kell:**
- Microsoft Foundry Models szolgáltatás létrehozása
- Azure AI Search integráció
- Biztonságos kulcskezelés
- Hálózati biztonsági beállítások

### **Beszélgetési pont:** Miért fontosak ezek a minták az AI-nál

- **Szolgáltatás-függőségek**: AI appok gyakran több koordinált szolgáltatást igényelnek
- **Biztonság**: API kulcsokat és végpontokat biztonságosan kell kezelni
- **Skálázhatóság**: AI terhelések egyedi skálázási igényekkel rendelkeznek
- **Költségkezelés**: AI szolgáltatások drágák lehetnek, ha nem megfelelően konfiguráltak

## 2. modul: Az első AI alkalmazás telepítése

### 2.1 lépés: Környezet inicializálása

1. **Hozz létre egy új AZD környezetet:**
```bash
azd env new myai-workshop
```

2. **Állítsd be a szükséges paramétereket:**
```bash
# Állítsa be a kívánt Azure régiót
azd env set AZURE_LOCATION eastus

# Opcionális: Állítson be konkrét OpenAI modellt
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 2.2 lépés: Az infrastruktúra és alkalmazás telepítése

1. **Telepítsd AZD-vel:**
```bash
azd up
```

**Mi történik az `azd up` alatt:**
- ✅ Microsoft Foundry Models szolgáltatás létrehozása
- ✅ Azure AI Search szolgáltatás létrehozása
- ✅ App Service beállítása a webalkalmazáshoz
- ✅ Hálózat és biztonság konfigurálása
- ✅ Alkalmazáskód telepítése
- ✅ Monitorozás és naplózás beállítása

2. **Figyeld a telepítés előrehaladását** és vedd észre az erőforrások létrehozását.

### 2.3 lépés: Telepítés ellenőrzése

1. **Ellenőrizd a telepített erőforrásokat:**
```bash
azd show
```

2. **Nyisd meg a telepített alkalmazást:**
```bash
azd show
```

Nyisd meg a webes végpontot, amit az `azd show` kimenet mutat.

3. **Teszteld az AI funkciókat:**
   - Navigálj a webalkalmazáshoz
   - Próbálj ki mintakérdéseket
   - Ellenőrizd, hogy az AI válaszok működnek

### **Labor Gyakorlat 2.1: Hibakeresési gyakorlat**

**Forgatókönyv**: A telepítés sikeres volt, de az AI nem válaszol.

**Gyakori hibák ellenőrzése:**
1. **OpenAI API kulcsok**: Ellenőrizd, hogy helyesen vannak beállítva
2. **Modell elérhetőség**: Ellenőrizd, hogy a régiód támogatja-e a modellt
3. **Hálózati kapcsolódás**: Biztosítsd, hogy a szolgáltatások kommunikálni tudnak
4. **RBAC jogosultságok**: Ellenőrizd, hogy az app hozzáfér az OpenAI-hoz

**Hibakeresési parancsok:**
```bash
# Környezeti változók ellenőrzése
azd env get-values

# Telepítési naplók megtekintése
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI telepítési állapot ellenőrzése
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3. modul: AI alkalmazások testreszabása az igényeidhez

### 3.1 lépés: AI konfiguráció módosítása

1. **Frissítsd az OpenAI modellt:**
```bash
# Válts másik modellre (ha elérhető az Ön régiójában)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Telepítse újra az új konfigurációval
azd deploy
```

2. **Adj hozzá további AI szolgáltatásokat:**

Szerkeszd az `infra/main.bicep` fájlt Document Intelligence hozzáadásához:

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

**Legjobb gyakorlat:** Különböző konfigurációk fejlesztéshez és termeléshez.

1. **Hozd létre a termelési környezetet:**
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

### **Labor Gyakorlat 3.1: Költségoptimalizálás**

**Feladat:** Konfiguráld a sablont költséghatékony fejlesztésre.

**Feladatok:**
1. Azonosítsd, mely SKU-k állíthatók ingyenes/alapszintre
2. Állítsd be a környezeti változókat minimális költséghez
3. Telepítsd és hasonlítsd össze a költségeket a termelési konfigurációval

**Megoldási tippek:**
- Használj F0 (ingyenes) szintet az Azure AI Szolgáltatásoknál, ahol lehet
- Használj alapszintet a Search Szolgáltatás fejlesztési környezetben
- Vegyél igénybe Consumption tervet a Functions esetén

## 4. modul: Biztonság és Termelési Legjobb Gyakorlatok

### 4.1 lépés: Biztonságos hitelesítő adat kezelés

**Jelenlegi kihívás:** Sok AI app keménykódolja az API kulcsokat vagy nem biztonságos tárolást használ.

**AZD megoldás:** Kezelt azonosító + Key Vault integráció.

1. **Nézd át a biztonsági konfigurációt a sablonban:**
```bash
# Keresd a Key Vault és a kezelt identitás konfigurációját
grep -r "keyVault\|managedIdentity" infra/
```

2. **Ellenőrizd, hogy a Kezelt Azonosító működik:**
```bash
# Ellenőrizze, hogy a webalkalmazás rendelkezik-e a helyes azonosító konfigurációval
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 lépés: Hálózati Biztonság

1. **Engedélyezd a privát végpontokat** (ha még nincs konfigurálva):

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

1. **Konfiguráld az Application Insights-ot:**
```bash
# Az Application Insights-ot automatikusan kell konfigurálni
# Ellenőrizze a konfigurációt:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Állíts be AI-specifikus monitorozást:**

Adj hozzá egyéni metrikákat az AI műveletekhez:
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

**Feladat:** Vizsgáld át a telepítésed biztonsági legjobb gyakorlatait.

**Ellenőrző lista:**
- [ ] Nincsenek keménykódolt titkok kódban vagy konfigurációban
- [ ] Kezelt Azonosító használata szolgáltatás-szolgáltatás autentikációhoz
- [ ] Key Vault érzékeny konfigurációt tárol
- [ ] Hálózati hozzáférés megfelelően korlátozott
- [ ] Monitorozás és naplózás engedélyezve

## 5. modul: Saját AI alkalmazás konvertálása

### 5.1 lépés: Értékelő munkalap

**Mielőtt átállítod az appot**, válaszold meg ezeket a kérdéseket:

1. **Alkalmazás architektúra:**
   - Milyen AI szolgáltatásokat használ az appod?
   - Milyen számítási erőforrásokra van szüksége?
   - Szükséges-e adatbázis?
   - Mik az egymásra utaltságok a szolgáltatások között?

2. **Biztonsági követelmények:**
   - Milyen érzékeny adatokkal dolgozik az app?
   - Milyen megfelelőségi követelmények vannak?
   - Szükséges privát hálózat?

3. **Skálázási követelmények:**
   - Mi a várható terhelés?
   - Szükséges automatikus skálázás?
   - Vannak régiós követelmények?

### 5.2 lépés: Készítsd el az AZD sablonodat

**Kövesd ezt a mintát az app konvertáláshoz:**

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

3. **Készítsd el az infrastruktúra sablonokat:**

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

### **Labor Gyakorlat 5.1: Sablon Készítő kihívás**

**Kihívás:** Készíts AZD sablont egy dokumentumfeldolgozó AI apphoz.

**Követelmények:**
- Microsoft Foundry Models tartalomelemzéshez
- Document Intelligence OCR-hez
- Storage Fiók dokumentum feltöltésekhez
- Function App feldolgozó logikához
- Web app felhasználói felülethez

**Bónusz pontok:**
- Adj jó hibakezelést
- Tüntesd fel a költségbecslést
- Állíts be monitorozó dashboardokat

## 6. modul: Gyakori hibák elhárítása

### Gyakori telepítési problémák

#### Probléma 1: OpenAI Szolgáltatás Kvóta túllépve
**Tünetek:** A telepítés kvóta hiba miatt sikertelen
**Megoldások:**
```bash
# Ellenőrizze a jelenlegi kvótákat
az cognitiveservices usage list --location eastus

# Kérjen kvótaemelést vagy próbáljon meg másik régiót
azd env set AZURE_LOCATION westus2
azd up
```

#### Probléma 2: Modell nem elérhető a régióban
**Tünetek:** AI válaszok sikertelenek vagy modell telepítési hibák
**Megoldások:**
```bash
# Ellenőrizze a modell elérhetőségét régiónként
az cognitiveservices model list --location eastus

# Frissítés az elérhető modellre
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Probléma 3: Jogosultsági problémák
**Tünetek:** 403 Hozzáférés tiltva hibák AI szolgáltatások hívásakor
**Megoldások:**
```bash
# Ellenőrizze a szerepkör hozzárendeléseket
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adja hozzá a hiányzó szerepköröket
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Teljesítmény problémák

#### Probléma 4: Lassú AI válaszok
**Vizsgálati lépések:**
1. Nézd meg az Application Insights teljesítmény metrikáit
2. Nézd át az OpenAI szolgáltatás metrikáit az Azure portálon
3. Ellenőrizd a hálózati kapcsolódást és késleltetést

**Megoldások:**
- Közös lekérdezésekhez implementálj gyorsítótárazást
- Használj megfelelő OpenAI modellt az esetedhez
- Fontold meg read replica használatát nagy terhelésnél

### **Labor Gyakorlat 6.1: Hibakeresési kihívás**

**Forgatókönyv:** A telepítés sikerült, de az alkalmazás 500-as hibákat ad vissza.

**Hibakeresési feladatok:**
1. Ellenőrizd az alkalmazás naplóit
2. Ellenőrizd a szolgáltatás kapcsolódását
3. Teszteld az autentikációt
4. Nézd át a konfigurációt

**Használandó eszközök:**
- `azd show` a telepítés áttekintéséhez
- Azure portál a részletes szolgáltatás naplókhoz
- Application Insights az alkalmazás telemetriájához

## 7. modul: Monitorozás és optimalizálás

### 7.1 lépés: Átfogó monitorozás beállítása

1. **Hozz létre egyéni dashboardokat:**

Navigálj az Azure portálra, és hozz létre egy dashboardot az alábbiakkal:
- OpenAI kérés számláló és késleltetés
- Alkalmazás hibaarányok
- Erőforrás kihasználás
- Költségkövetés

2. **Állíts be riasztásokat:**
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

1. **Elemezd a jelenlegi költségeket:**
```bash
# Használja az Azure CLI-t a költségadatok lekéréséhez
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Alkalmazz költségkontrollokat:**
- Állíts be költségkeret riasztásokat
- Használj automatikus skálázási szabályokat
- Implementálj kérés-gyorsítótárazást
- Kövesd nyomon az OpenAI token használatot

### **Labor Gyakorlat 7.1: Teljesítmény optimalizálás**

**Feladat:** Optimalizáld AI alkalmazásod mind teljesítmény, mind költség szempontból.

**Javítandó metrikák:**
- Csökkentsd az átlagos válaszidőt 20%-kal
- Csökkentsd a havi költségeket 15%-kal
- Tarts fenn 99,9%-os elérhetőséget

**Kipróbálandó stratégiák:**
- Valósíts meg válasz gyorsítótárazást
- Optimalizáld a kérdéseket token hatékonyságra
- Használj megfelelő számítási SKU-kat
- Állíts be megfelelő automatikus skálázást

## Záró Kihívás: Teljes körű megvalósítás

### Kihívás forgatókönyv

Feladatod egy termelésre kész AI-vezérelt ügyfélszolgálati chatbot létrehozása ezekkel a követelményekkel:

**Funkcionális követelmények:**
- Webes felület ügyfél interakciókhoz
- Integráció Microsoft Foundry Models válaszokhoz
- Dokumentumkeresési képesség Azure AI Search segítségével
- Integráció meglévő ügyfél-adatbázissal
- Többnyelvű támogatás

**Nem funkcionális követelmények:**
- 1000 egyidejű felhasználó kezelése
- 99,9%-os elérhetőségi SLA
- SOC 2 megfelelőség
- Költség havonta 500 dollár alatt
- Több környezetbe telepítés (fejlesztés, staging, termelés)

### Megvalósítás lépései

1. **Tervezd meg az architektúrát**
2. **Hozd létre az AZD sablont**
3. **Valósíts meg biztonsági intézkedéseket**
4. **Állítsd be a monitorozást és riasztásokat**
5. **Hozz létre telepítési folyamatokat**
6. **Dokumentáld a megoldást**

### Értékelési szempontok

- ✅ **Funkcionalitás**: Megfelel-e minden követelménynek?
- ✅ **Biztonság**: Megvalósultak-e a legjobb gyakorlatok?
- ✅ **Skálázhatóság**: Kezeli-e a terhelést?
- ✅ **Karbantarthatóság**: Rendezett-e a kód és infrastruktúra?
- ✅ **Költség**: Marad a költségvetésen belül?

## További Források

### Microsoft Dokumentációk
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Szolgáltatás Dokumentáció](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

### Minta Sablonok
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Gyorsindítás](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Közösségi források
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Teljesítési bizonyítvány

Gratulálunk! Teljesítetted az AI Workshop Labot. Most már képesnek kell lenned arra, hogy:

- ✅ Átalakítsd meglévő AI alkalmazásaidat AZD sablonokká
- ✅ Éles használatra kész AI alkalmazásokat telepíts
- ✅ Biztonsági bevált gyakorlatokat valósíts meg AI munkaterhelésekhez
- ✅ Figyeld és optimalizáld az AI alkalmazások teljesítményét
- ✅ Hibakeresd a gyakori telepítési problémákat

### Következő lépések
1. Alkalmazd ezeket a mintákat a saját AI projektjeidben
2. Járulj hozzá sablonokkal a közösség számára
3. Csatlakozz a Microsoft Foundry Discordhoz folyamatos támogatásért
4. Fedezz fel haladó témákat, mint például a több régiós telepítések

---

**Workshop visszajelzés**: Segíts minket a workshop fejlesztésében, oszd meg tapasztalataidat a [Microsoft Foundry Discord #Azure csatornán](https://discord.gg/microsoft-azure).

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-First fejlesztés
- **⬅️ Előző**: [AI modell telepítése](ai-model-deployment.md)
- **➡️ Következő**: [AI éles bevetési bevált gyakorlatok](production-ai-practices.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz közösségünkhöz támogatásért és beszélgetésekért az AZD és AI telepítésekről.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->