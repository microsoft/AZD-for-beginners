# Architektúra Mikroservisov - Príklad s Kontajnerovými Aplikáciami

⏱️ **Odhadovaný čas**: 25-35 minút | 💰 **Odhadované náklady**: ~50-100 USD/mesiac | ⭐ **Zložitosť**: Pokročilá

**Zjednodušená, ale funkčná** architektúra mikroservisov nasadená do Azure Container Apps pomocou AZD CLI. Tento príklad demonštruje komunikáciu medzi službami, orchestráciu kontajnerov a monitorovanie s praktickým nastavením dvoch služieb.

> **📚 Vzdelávací prístup**: Tento príklad začína s minimálnou architektúrou dvoch služieb (API Gateway + Backend Service), ktorú môžete reálne nasadiť a učiť sa z nej. Po zvládnutí základov poskytujeme návod na rozšírenie na plnohodnotný ekosystém mikroservisov.

## Čo sa naučíte

Po dokončení tohto príkladu:
- Nasadíte viacero kontajnerov do Azure Container Apps
- Implementujete komunikáciu medzi službami pomocou interných sietí
- Nakonfigurujete škálovanie a zdravotné kontroly na základe prostredia
- Budete monitorovať distribuované aplikácie pomocou Application Insights
- Pochopíte vzory a osvedčené postupy nasadzovania mikroservisov
- Naučíte sa postupné rozširovanie od jednoduchých po zložité architektúry

## Architektúra

### Fáza 1: Čo budujeme (zahrnuté v tomto príklade)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Prečo začať jednoducho?**
- ✅ Rýchle nasadenie a pochopenie (25-35 minút)
- ✅ Naučte sa základné vzory mikroservisov bez zložitosti
- ✅ Funkčný kód, ktorý môžete upravovať a experimentovať s ním
- ✅ Nižšie náklady na učenie (~50-100 USD/mesiac oproti 300-1400 USD/mesiac)
- ✅ Získajte sebadôveru pred pridaním databáz a frontov správ

**Analógia**: Predstavte si to ako učenie sa šoférovať. Začínate na prázdnom parkovisku (2 služby), zvládnete základy a potom prejdete na mestskú premávku (5+ služieb s databázami).

### Fáza 2: Budúce rozšírenie (referenčná architektúra)

Keď zvládnete architektúru s dvoma službami, môžete ju rozšíriť na:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Pozrite si sekciu "Príručka na rozšírenie" na konci pre podrobné pokyny.

## Zahrnuté funkcie

✅ **Objavovanie služieb**: Automatické objavovanie DNS medzi kontajnermi  
✅ **Vyvažovanie záťaže**: Zabudované vyvažovanie záťaže medzi replikami  
✅ **Automatické škálovanie**: Nezávislé škálovanie pre každú službu na základe HTTP požiadaviek  
✅ **Monitorovanie zdravia**: Kontroly živosti a pripravenosti pre obe služby  
✅ **Distribuované logovanie**: Centralizované logovanie pomocou Application Insights  
✅ **Interné siete**: Bezpečná komunikácia medzi službami  
✅ **Orchestrácia kontajnerov**: Automatické nasadzovanie a škálovanie  
✅ **Aktualizácie bez výpadkov**: Postupné aktualizácie s riadením revízií  

## Predpoklady

### Požadované nástroje

Pred začiatkom overte, že máte nainštalované tieto nástroje:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzia 1.0.0 alebo vyššia)
   ```bash
   azd version
   # Očakávaný výstup: azd verzia 1.0.0 alebo vyššia
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzia 2.50.0 alebo vyššia)
   ```bash
   az --version
   # Očakávaný výstup: azure-cli 2.50.0 alebo vyšší
   ```

3. **[Docker](https://www.docker.com/get-started)** (na lokálny vývoj/testovanie - voliteľné)
   ```bash
   docker --version
   # Očakávaný výstup: Docker verzia 20.10 alebo vyššia
   ```

### Požiadavky na Azure

- Aktívne **Azure predplatné** ([vytvorte si bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnenia na vytváranie zdrojov vo vašom predplatnom
- **Rola prispievateľa** na predplatnom alebo skupine zdrojov

### Požiadavky na znalosti

Toto je príklad na **pokročilej úrovni**. Mali by ste mať:
- Dokončený [jednoduchý príklad Flask API](../../../../../examples/container-app/simple-flask-api) 
- Základné pochopenie architektúry mikroservisov
- Znalosť REST API a HTTP
- Pochopenie konceptov kontajnerov

**Nováčik v Container Apps?** Začnite s [jednoduchým príkladom Flask API](../../../../../examples/container-app/simple-flask-api) na osvojenie základov.

## Rýchly štart (krok za krokom)

### Krok 1: Klonovanie a navigácia

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Kontrola úspechu**: Overte, že vidíte `azure.yaml`:
```bash
ls
# Očakávané: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentifikácia s Azure

```bash
azd auth login
```

Týmto sa otvorí váš prehliadač na autentifikáciu v Azure. Prihláste sa pomocou svojich Azure prihlasovacích údajov.

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
Logged in to Azure.
```

### Krok 3: Inicializácia prostredia

```bash
azd init
```

**Výzvy, ktoré uvidíte**:
- **Názov prostredia**: Zadajte krátky názov (napr. `microservices-dev`)
- **Azure predplatné**: Vyberte svoje predplatné
- **Azure lokalita**: Vyberte región (napr. `eastus`, `westeurope`)

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: New project initialized!
```

### Krok 4: Nasadenie infraštruktúry a služieb

```bash
azd up
```

**Čo sa deje** (trvá 8-12 minút):
1. Vytvorí prostredie Container Apps
2. Vytvorí Application Insights na monitorovanie
3. Vytvorí kontajner API Gateway (Node.js)
4. Vytvorí kontajner Product Service (Python)
5. Nasadí oba kontajnery do Azure
6. Nakonfiguruje siete a zdravotné kontroly
7. Nastaví monitorovanie a logovanie

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Čas**: 8-12 minút

### Krok 5: Testovanie nasadenia

```bash
# Získajte koncový bod brány
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Otestujte zdravie API Gateway
curl $GATEWAY_URL/health

# Očakávaný výstup:
# {"status":"zdravý","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testovanie služby produktov cez bránu**:
```bash
# Zoznam produktov
curl $GATEWAY_URL/api/products

# Očakávaný výstup:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Myš","price":29.99,"stock":200},
#   {"id":3,"name":"Klávesnica","price":79.99,"stock":150}
# ]
```

**✓ Kontrola úspechu**: Obe koncové body vracajú JSON dáta bez chýb.

---

**🎉 Gratulujeme!** Nasadili ste architektúru mikroservisov do Azure!

## Štruktúra projektu

Všetky implementačné súbory sú zahrnuté—ide o kompletný, funkčný príklad:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Čo robí každý komponent:**

**Infraštruktúra (infra/)**:
- `main.bicep`: Orchestruje všetky Azure zdroje a ich závislosti
- `core/container-apps-environment.bicep`: Vytvára prostredie Container Apps a Azure Container Registry
- `core/monitor.bicep`: Nastavuje Application Insights na distribuované logovanie
- `app/*.bicep`: Definície jednotlivých kontajnerových aplikácií so škálovaním a zdravotnými kontrolami

**API Gateway (src/api-gateway/)**:
- Verejne prístupná služba, ktorá smeruje požiadavky na backendové služby
- Implementuje logovanie, spracovanie chýb a presmerovanie požiadaviek
- Demonštruje HTTP komunikáciu medzi službami

**Product Service (src/product-service/)**:
- Interná služba s katalógom produktov (pre jednoduchosť v pamäti)
- REST API so zdravotnými kontrolami
- Príklad vzoru backendového mikroservisu

## Prehľad služieb

### API Gateway (Node.js/Express)

**Port**: 8080  
**Prístup**: Verejný (externý vstup)  
**Účel**: Smeruje prichádzajúce požiadavky na príslušné backendové služby  

**Koncové body**:
- `GET /` - Informácie o službe
- `GET /health` - Koncový bod zdravotnej kontroly
- `GET /api/products` - Presmerovanie na službu produktov (zoznam všetkých)
- `GET /api/products/:id` - Presmerovanie na službu produktov (získanie podľa ID)

**Kľúčové funkcie**:
- Smerovanie požiadaviek pomocou axios
- Centralizované logovanie
- Spracovanie chýb a správa časových limitov
- Objavovanie služieb cez premenné prostredia
- Integrácia s Application Insights

**Zvýraznenie kódu** (`src/api-gateway/app.js`):
```javascript
// Interná komunikácia služieb
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Prístup**: Len interný (žiadny externý vstup)  
**Účel**: Spravuje katalóg produktov s dátami v pamäti  

**Koncové body**:
- `GET /` - Informácie o službe
- `GET /health` - Koncový bod zdravotnej kontroly
- `GET /products` - Zoznam všetkých produktov
- `GET /products/<id>` - Získanie produktu podľa ID

**Kľúčové funkcie**:
- RESTful API s Flask
- Úložisko produktov v pamäti (jednoduché, bez potreby databázy)
- Monitorovanie zdravia pomocou sond
- Štruktúrované logovanie
- Integrácia s Application Insights

**Dátový model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Prečo len interný prístup?**
Služba produktov nie je verejne dostupná. Všetky požiadavky musia prejsť cez API Gateway, ktorá poskytuje:
- Bezpečnosť: Kontrolovaný prístupový bod
- Flexibilitu: Možnosť zmeniť backend bez ovplyvnenia klientov
- Monitorovanie: Centralizované logovanie požiadaviek

## Pochopenie komunikácie medzi službami

### Ako spolu služby komunikujú

V tomto príklade API Gateway komunikuje so službou produktov pomocou **interných HTTP volaní**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Vykonajte internú HTTP požiadavku
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Kľúčové body**:

1. **Objavovanie na základe DNS**: Container Apps automaticky poskytuje DNS pre interné služby
   - FQDN služby produktov: `product-service.internal.<environment>.azurecontainerapps.io`
   - Zjednodušené ako: `http://product-service` (Container Apps to vyrieši)

2. **Žiadna verejná expozícia**: Služba produktov má `external: false` v Bicep
   - Prístupná len v prostredí Container Apps
   - Nedá sa dosiahnuť z internetu

3. **Premenné prostredia**: URL služieb sú injektované počas nasadzovania
   - Bicep odovzdáva interný FQDN bráne
   - Žiadne hardcodované URL v aplikačnom kóde

**Analógia**: Predstavte si to ako kancelárske miestnosti. API Gateway je recepcia (verejne prístupná) a služba produktov je kancelárska miestnosť (len interná). Návštevníci musia prejsť cez recepciu, aby sa dostali do akejkoľvek miestnosti.
Pre učenie/testovanie zvážte:
- Použitie bezplatných kreditov Azure (prvých 30 dní)
- Udržiavanie minimálneho počtu replík
- Odstránenie po testovaní (žiadne priebežné poplatky)

---

## Vyčistenie

Aby ste sa vyhli priebežným poplatkom, odstráňte všetky zdroje:

```bash
azd down --force --purge
```

**Potvrdenie výzvy**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Napíšte `y` na potvrdenie.

**Čo sa odstráni**:
- Prostredie Container Apps
- Obe Container Apps (gateway a product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Overenie vyčistenia**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Malo by vrátiť prázdny výsledok.

---

## Sprievodca rozšírením: Od 2 k 5+ službám

Keď zvládnete túto architektúru s 2 službami, tu je návod, ako ju rozšíriť:

### Fáza 1: Pridanie databázovej perzistencie (ďalší krok)

**Pridajte Cosmos DB pre Product Service**:

1. Vytvorte `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Aktualizujte product service, aby používal Cosmos DB namiesto in-memory dát

3. Odhadované dodatočné náklady: ~25 USD/mesiac (serverless)

### Fáza 2: Pridanie tretej služby (Order Management)

**Vytvorte Order Service**:

1. Nový priečinok: `src/order-service/` (Python/Node.js/C#)
2. Nový Bicep: `infra/app/order-service.bicep`
3. Aktualizujte API Gateway na smerovanie `/api/orders`
4. Pridajte Azure SQL Database pre perzistenciu objednávok

**Architektúra sa stáva**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fáza 3: Pridanie asynchrónnej komunikácie (Service Bus)

**Implementujte Event-Driven architektúru**:

1. Pridajte Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service publikuje udalosti "ProductCreated"
3. Order Service odoberá udalosti produktov
4. Pridajte Notification Service na spracovanie udalostí

**Vzor**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Fáza 4: Pridanie autentifikácie používateľov

**Implementujte User Service**:

1. Vytvorte `src/user-service/` (Go/Node.js)
2. Pridajte Azure AD B2C alebo vlastnú JWT autentifikáciu
3. API Gateway overuje tokeny
4. Služby kontrolujú oprávnenia používateľov

### Fáza 5: Pripravenosť na produkciu

**Pridajte tieto komponenty**:
- Azure Front Door (globálne vyvažovanie záťaže)
- Azure Key Vault (správa tajomstiev)
- Azure Monitor Workbooks (vlastné dashboardy)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green nasadenia
- Managed Identity pre všetky služby

**Náklady na plnú produkčnú architektúru**: ~300-1 400 USD/mesiac

---

## Zistite viac

### Súvisiaca dokumentácia
- [Dokumentácia Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Sprievodca architektúrou mikroservisov](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights pre distribuované sledovanie](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Ďalšie kroky v tomto kurze
- ← Predchádzajúce: [Jednoduché Flask API](../../../../../examples/container-app/simple-flask-api) - Začiatočnícky príklad s jedným kontajnerom
- → Ďalej: [Sprievodca integráciou AI](../../../../../examples/docs/ai-foundry) - Pridanie AI schopností
- 🏠 [Domov kurzu](../../README.md)

### Porovnanie: Kedy použiť čo

**Jednoduchá Container App** (príklad jednoduchého Flask API):
- ✅ Jednoduché aplikácie
- ✅ Monolitická architektúra
- ✅ Rýchle nasadenie
- ❌ Obmedzená škálovateľnosť
- **Náklady**: ~15-50 USD/mesiac

**Mikroservisy** (tento príklad):
- ✅ Komplexné aplikácie
- ✅ Nezávislé škálovanie pre každú službu
- ✅ Autonómia tímov (rôzne služby, rôzne tímy)
- ❌ Zložitejšie na správu
- **Náklady**: ~60-250 USD/mesiac

**Kubernetes (AKS)**:
- ✅ Maximálna kontrola a flexibilita
- ✅ Prenositeľnosť medzi cloudmi
- ✅ Pokročilé sieťové možnosti
- ❌ Vyžaduje odborné znalosti Kubernetes
- **Náklady**: ~150-500 USD/mesiac minimálne

**Odporúčanie**: Začnite s Container Apps (tento príklad), prejdite na AKS iba v prípade potreby špecifických funkcií Kubernetes.

---

## Často kladené otázky

**Otázka: Prečo iba 2 služby namiesto 5+?**  
Odpoveď: Vzdelávací postup. Ovládnite základy (komunikácia medzi službami, monitorovanie, škálovanie) na jednoduchom príklade pred pridaním zložitosti. Vzory, ktoré sa tu naučíte, platia aj pre architektúry so 100 službami.

**Otázka: Môžem pridať viac služieb sám?**  
Odpoveď: Absolútne! Postupujte podľa sprievodcu rozšírením vyššie. Každá nová služba nasleduje rovnaký vzor: vytvorte priečinok src, vytvorte Bicep súbor, aktualizujte azure.yaml, nasadte.

**Otázka: Je toto pripravené na produkciu?**  
Odpoveď: Je to pevný základ. Pre produkciu pridajte: managed identity, Key Vault, perzistentné databázy, CI/CD pipeline, monitorovacie upozornenia a stratégiu zálohovania.

**Otázka: Prečo nepoužiť Dapr alebo iný service mesh?**  
Odpoveď: Udržujte to jednoduché na učenie. Keď pochopíte natívne sieťovanie Container Apps, môžete pridať Dapr pre pokročilé scenáre.

**Otázka: Ako môžem ladiť lokálne?**  
Odpoveď: Spustite služby lokálne s Dockerom:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Otázka: Môžem použiť rôzne programovacie jazyky?**  
Odpoveď: Áno! Tento príklad ukazuje Node.js (gateway) + Python (product service). Môžete kombinovať akékoľvek jazyky, ktoré bežia v kontajneroch.

**Otázka: Čo ak nemám Azure kredity?**  
Odpoveď: Použite bezplatnú vrstvu Azure (prvých 30 dní s novými účtami) alebo nasadzujte na krátke testovacie obdobia a okamžite odstráňte.

---

> **🎓 Zhrnutie vzdelávacej cesty**: Naučili ste sa nasadiť architektúru s viacerými službami s automatickým škálovaním, interným sieťovaním, centralizovaným monitorovaním a vzormi pripravenými na produkciu. Tento základ vás pripraví na komplexné distribuované systémy a podnikové mikroservisné architektúry.

**📚 Navigácia v kurze:**
- ← Predchádzajúce: [Jednoduché Flask API](../../../../../examples/container-app/simple-flask-api)
- → Ďalej: [Príklad integrácie databázy](../../../../../examples/database-app)
- 🏠 [Domov kurzu](../../README.md)
- 📖 [Najlepšie postupy pre Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->