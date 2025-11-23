<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-23T12:25:14+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "sk"
}
-->
# Nasadenie Microsoft SQL databázy a webovej aplikácie pomocou AZD

⏱️ **Odhadovaný čas**: 20-30 minút | 💰 **Odhadované náklady**: ~15-25 $/mesiac | ⭐ **Zložitosť**: Stredne pokročilá

Tento **kompletný, funkčný príklad** ukazuje, ako použiť [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) na nasadenie webovej aplikácie Python Flask s Microsoft SQL databázou do Azure. Všetok kód je zahrnutý a otestovaný—nie sú potrebné žiadne externé závislosti.

## Čo sa naučíte

Po dokončení tohto príkladu sa naučíte:
- Nasadiť viacvrstvovú aplikáciu (webová aplikácia + databáza) pomocou infraštruktúry ako kódu
- Konfigurovať bezpečné pripojenia k databáze bez pevného zakódovania tajomstiev
- Monitorovať zdravie aplikácie pomocou Application Insights
- Efektívne spravovať Azure zdroje pomocou AZD CLI
- Dodržiavať najlepšie praktiky Azure pre bezpečnosť, optimalizáciu nákladov a pozorovateľnosť

## Prehľad scenára
- **Webová aplikácia**: Python Flask REST API s pripojením k databáze
- **Databáza**: Azure SQL Database so vzorovými dátami
- **Infraštruktúra**: Nasadená pomocou Bicep (modulárne, opakovane použiteľné šablóny)
- **Nasadenie**: Plne automatizované pomocou príkazov `azd`
- **Monitorovanie**: Application Insights pre logy a telemetriu

## Predpoklady

### Požadované nástroje

Pred začiatkom si overte, že máte nainštalované tieto nástroje:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verzia 2.50.0 alebo vyššia)
   ```sh
   az --version
   # Očakávaný výstup: azure-cli 2.50.0 alebo vyšší
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verzia 1.0.0 alebo vyššia)
   ```sh
   azd version
   # Očakávaný výstup: azd verzia 1.0.0 alebo vyššia
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (pre lokálny vývoj)
   ```sh
   python --version
   # Očakávaný výstup: Python 3.8 alebo vyšší
   ```

4. **[Docker](https://www.docker.com/get-started)** (voliteľné, pre lokálny kontajnerový vývoj)
   ```sh
   docker --version
   # Očakávaný výstup: Docker verzia 20.10 alebo vyššia
   ```

### Požiadavky na Azure

- Aktívne **Azure predplatné** ([vytvorte si bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnenia na vytváranie zdrojov vo vašom predplatnom
- **Vlastník** alebo **Prispievateľ** rola na predplatnom alebo skupine zdrojov

### Požadované znalosti

Toto je príklad na **stredne pokročilej úrovni**. Mali by ste mať základné znalosti o:
- Základných operáciách príkazového riadku
- Základných cloudových konceptoch (zdroje, skupiny zdrojov)
- Základnom pochopení webových aplikácií a databáz

**Nový v AZD?** Začnite s [príručkou Začíname](../../docs/getting-started/azd-basics.md).

## Architektúra

Tento príklad nasadzuje dvojvrstvovú architektúru s webovou aplikáciou a SQL databázou:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Nasadenie zdrojov:**
- **Skupina zdrojov**: Kontajner pre všetky zdroje
- **App Service Plan**: Linuxové hostovanie (úroveň B1 pre úsporu nákladov)
- **Webová aplikácia**: Python 3.11 runtime s Flask aplikáciou
- **SQL Server**: Spravovaný databázový server s minimom TLS 1.2
- **SQL Databáza**: Základná úroveň (2GB, vhodné pre vývoj/testovanie)
- **Application Insights**: Monitorovanie a logovanie
- **Log Analytics Workspace**: Centralizované úložisko logov

**Analógia**: Predstavte si to ako reštauráciu (webová aplikácia) s mraziarenským skladom (databáza). Zákazníci si objednávajú z menu (API endpointy) a kuchyňa (Flask aplikácia) získava ingrediencie (dáta) zo skladu. Manažér reštaurácie (Application Insights) sleduje všetko, čo sa deje.

## Štruktúra priečinkov

Všetky súbory sú zahrnuté v tomto príklade—nie sú potrebné žiadne externé závislosti:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Čo robí každý súbor:**
- **azure.yaml**: Určuje, čo má AZD nasadiť a kam
- **infra/main.bicep**: Orchestruje všetky Azure zdroje
- **infra/resources/*.bicep**: Definície jednotlivých zdrojov (modulárne pre opätovné použitie)
- **src/web/app.py**: Flask aplikácia s databázovou logikou
- **requirements.txt**: Závislosti Python balíčkov
- **Dockerfile**: Inštrukcie na kontajnerizáciu pre nasadenie

## Rýchly štart (krok za krokom)

### Krok 1: Klonovanie a navigácia

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kontrola úspechu**: Overte, že vidíte `azure.yaml` a priečinok `infra/`:
```sh
ls
# Očakávané: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentifikácia s Azure

```sh
azd auth login
```

Týmto sa otvorí váš prehliadač na autentifikáciu Azure. Prihláste sa pomocou svojich Azure prihlasovacích údajov.

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
Logged in to Azure.
```

### Krok 3: Inicializácia prostredia

```sh
azd init
```

**Čo sa deje**: AZD vytvorí lokálnu konfiguráciu pre vaše nasadenie.

**Výzvy, ktoré uvidíte**:
- **Názov prostredia**: Zadajte krátky názov (napr. `dev`, `myapp`)
- **Azure predplatné**: Vyberte svoje predplatné zo zoznamu
- **Azure lokalita**: Vyberte región (napr. `eastus`, `westeurope`)

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: New project initialized!
```

### Krok 4: Poskytnutie Azure zdrojov

```sh
azd provision
```

**Čo sa deje**: AZD nasadí všetku infraštruktúru (trvá 5-8 minút):
1. Vytvorí skupinu zdrojov
2. Vytvorí SQL Server a databázu
3. Vytvorí App Service Plan
4. Vytvorí Web App
5. Vytvorí Application Insights
6. Konfiguruje sieť a bezpečnosť

**Budete vyzvaní na**:
- **SQL admin užívateľské meno**: Zadajte užívateľské meno (napr. `sqladmin`)
- **SQL admin heslo**: Zadajte silné heslo (uložte si ho!)

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 5-8 minút

### Krok 5: Nasadenie aplikácie

```sh
azd deploy
```

**Čo sa deje**: AZD zostaví a nasadí vašu Flask aplikáciu:
1. Zabalí Python aplikáciu
2. Zostaví Docker kontajner
3. Nahraje do Azure Web App
4. Inicializuje databázu so vzorovými dátami
5. Spustí aplikáciu

**✓ Kontrola úspechu**: Mali by ste vidieť:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 3-5 minút

### Krok 6: Prehliadanie aplikácie

```sh
azd browse
```

Týmto otvoríte nasadenú webovú aplikáciu v prehliadači na `https://app-<unique-id>.azurewebsites.net`

**✓ Kontrola úspechu**: Mali by ste vidieť JSON výstup:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Krok 7: Testovanie API endpointov

**Kontrola zdravia** (overenie pripojenia k databáze):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Očakávaná odpoveď**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Zoznam produktov** (vzorové dáta):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Očakávaná odpoveď**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Získanie jedného produktu**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kontrola úspechu**: Všetky endpointy vracajú JSON dáta bez chýb.

---

**🎉 Gratulujeme!** Úspešne ste nasadili webovú aplikáciu s databázou do Azure pomocou AZD.
- Vysoké časy odozvy (>2 sekundy)

**Príklad vytvorenia upozornenia**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Riešenie problémov

### Bežné problémy a riešenia

#### 1. `azd provision` zlyhá s chybou "Lokalita nie je dostupná"

**Príznak**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Riešenie**:
Vyberte inú oblasť Azure alebo zaregistrujte poskytovateľa zdrojov:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Zlyhanie pripojenia k SQL počas nasadzovania

**Príznak**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Riešenie**:
- Overte, či firewall SQL Servera povoľuje služby Azure (nastavené automaticky)
- Skontrolujte, či bolo správne zadané heslo správcu SQL počas `azd provision`
- Uistite sa, že SQL Server je plne nasadený (môže to trvať 2-3 minúty)

**Overenie pripojenia**:
```sh
# Z Azure Portálu prejdite na SQL Database → Editor dotazov
# Skúste sa pripojiť pomocou svojich prihlasovacích údajov
```

#### 3. Webová aplikácia zobrazuje "Chyba aplikácie"

**Príznak**:
Prehliadač zobrazuje všeobecnú chybovú stránku.

**Riešenie**:
Skontrolujte logy aplikácie:
```sh
# Zobraziť nedávne záznamy
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Bežné príčiny**:
- Chýbajúce premenné prostredia (skontrolujte App Service → Konfigurácia)
- Zlyhanie inštalácie Python balíčkov (skontrolujte logy nasadzovania)
- Chyba inicializácie databázy (skontrolujte pripojenie k SQL)

#### 4. `azd deploy` zlyhá s "Chyba zostavenia"

**Príznak**:
```
Error: Failed to build project
```

**Riešenie**:
- Uistite sa, že `requirements.txt` neobsahuje syntaktické chyby
- Skontrolujte, či je v `infra/resources/web-app.bicep` uvedený Python 3.11
- Overte, či Dockerfile obsahuje správny základný obraz

**Lokalne ladenie**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Neoprávnené" pri spúšťaní príkazov AZD

**Príznak**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Riešenie**:
Znova sa autentifikujte v Azure:
```sh
azd auth login
az login
```

Overte, či máte správne oprávnenia (úloha Prispievateľ) na predplatnom.

#### 6. Vysoké náklady na databázu

**Príznak**:
Neočakávaný účet za Azure.

**Riešenie**:
- Skontrolujte, či ste nezabudli spustiť `azd down` po testovaní
- Overte, či SQL databáza používa Basic tier (nie Premium)
- Skontrolujte náklady v Azure Cost Management
- Nastavte upozornenia na náklady

### Získanie pomoci

**Zobraziť všetky premenné prostredia AZD**:
```sh
azd env get-values
```

**Skontrolovať stav nasadzovania**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Prístup k logom aplikácie**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potrebujete viac pomoci?**
- [Príručka na riešenie problémov AZD](../../docs/troubleshooting/common-issues.md)
- [Riešenie problémov Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Riešenie problémov Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktické cvičenia

### Cvičenie 1: Overenie vášho nasadenia (Začiatočník)

**Cieľ**: Overiť, že všetky zdroje sú nasadené a aplikácia funguje.

**Kroky**:
1. Zoznam všetkých zdrojov vo vašej skupine zdrojov:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Očakávané**: 6-7 zdrojov (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Otestujte všetky API endpointy:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Očakávané**: Všetky vracajú platný JSON bez chýb

3. Skontrolujte Application Insights:
   - Prejdite na Application Insights v Azure Portáli
   - Prejdite na "Live Metrics"
   - Obnovte prehliadač na webovej aplikácii
   **Očakávané**: Zobrazia sa požiadavky v reálnom čase

**Kritériá úspechu**: Všetkých 6-7 zdrojov existuje, všetky endpointy vracajú dáta, Live Metrics ukazuje aktivitu.

---

### Cvičenie 2: Pridanie nového API endpointu (Stredne pokročilý)

**Cieľ**: Rozšíriť Flask aplikáciu o nový endpoint.

**Východiskový kód**: Aktuálne endpointy v `src/web/app.py`

**Kroky**:
1. Upraviť `src/web/app.py` a pridať nový endpoint za funkciu `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Nasadiť aktualizovanú aplikáciu:
   ```sh
   azd deploy
   ```

3. Otestovať nový endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očakávané**: Vráti produkty zodpovedajúce "laptop"

**Kritériá úspechu**: Nový endpoint funguje, vracia filtrované výsledky, zobrazuje sa v logoch Application Insights.

---

### Cvičenie 3: Pridanie monitorovania a upozornení (Pokročilý)

**Cieľ**: Nastaviť proaktívne monitorovanie s upozorneniami.

**Kroky**:
1. Vytvorte upozornenie na HTTP 500 chyby:
   ```sh
   # Získajte ID zdroja Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Vytvorte upozornenie
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Spustite upozornenie spôsobením chýb:
   ```sh
   # Požiadajte o neexistujúci produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Skontrolujte, či sa upozornenie spustilo:
   - Azure Portal → Alerts → Alert Rules
   - Skontrolujte svoj e-mail (ak je nastavený)

**Kritériá úspechu**: Pravidlo upozornenia je vytvorené, spúšťa sa pri chybách, upozornenia sú prijaté.

---

### Cvičenie 4: Zmeny v schéme databázy (Pokročilý)

**Cieľ**: Pridať novú tabuľku a upraviť aplikáciu, aby ju používala.

**Kroky**:
1. Pripojte sa k SQL databáze cez Azure Portal Query Editor

2. Vytvorte novú tabuľku `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Aktualizujte `src/web/app.py`, aby zahrnula informácie o kategóriách do odpovedí

4. Nasadiť a otestovať

**Kritériá úspechu**: Nová tabuľka existuje, produkty zobrazujú informácie o kategóriách, aplikácia stále funguje.

---

### Cvičenie 5: Implementácia cache (Expert)

**Cieľ**: Pridať Azure Redis Cache na zlepšenie výkonu.

**Kroky**:
1. Pridajte Redis Cache do `infra/main.bicep`
2. Aktualizujte `src/web/app.py`, aby cache-ovala dotazy na produkty
3. Zmerajte zlepšenie výkonu pomocou Application Insights
4. Porovnajte časy odozvy pred/po implementácii cache

**Kritériá úspechu**: Redis je nasadený, cache funguje, časy odozvy sa zlepšia o >50%.

**Tip**: Začnite s [dokumentáciou Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Vyčistenie

Aby ste sa vyhli ďalším poplatkom, odstráňte všetky zdroje po dokončení:

```sh
azd down
```

**Potvrdenie výzvy**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Napíšte `y` na potvrdenie.

**✓ Kontrola úspechu**: 
- Všetky zdroje sú odstránené z Azure Portálu
- Žiadne ďalšie poplatky
- Lokálny priečinok `.azure/<env-name>` môže byť odstránený

**Alternatíva** (ponechať infraštruktúru, odstrániť dáta):
```sh
# Odstrániť iba skupinu zdrojov (ponechať konfiguráciu AZD)
az group delete --name rg-<env-name> --yes
```
## Viac informácií

### Súvisiaca dokumentácia
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentácia Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentácia Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referenčná príručka jazyka Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Ďalšie kroky v tomto kurze
- **[Príklad aplikácií v kontajneroch](../../../../examples/container-app)**: Nasadenie mikroslužieb s Azure Container Apps
- **[Príručka integrácie AI](../../../../docs/ai-foundry)**: Pridanie AI funkcií do vašej aplikácie
- **[Najlepšie postupy nasadzovania](../../docs/deployment/deployment-guide.md)**: Vzory nasadzovania do produkcie

### Pokročilé témy
- **Spravovaná identita**: Odstránenie hesiel a použitie autentifikácie Azure AD
- **Súkromné koncové body**: Zabezpečenie pripojení k databáze v rámci virtuálnej siete
- **Integrácia CI/CD**: Automatizácia nasadzovania pomocou GitHub Actions alebo Azure DevOps
- **Viac prostredí**: Nastavenie vývojových, testovacích a produkčných prostredí
- **Migrácie databázy**: Použitie Alembic alebo Entity Framework na verziovanie schémy

### Porovnanie s inými prístupmi

**AZD vs. ARM Templates**:
- ✅ AZD: Vyššia úroveň abstrakcie, jednoduchšie príkazy
- ⚠️ ARM: Viac podrobností, jemnejšia kontrola

**AZD vs. Terraform**:
- ✅ AZD: Nativne pre Azure, integrované so službami Azure
- ⚠️ Terraform: Podpora viacerých cloudov, väčší ekosystém

**AZD vs. Azure Portal**:
- ✅ AZD: Opakovateľné, verzovateľné, automatizovateľné
- ⚠️ Portal: Manuálne kliky, ťažšie reprodukovateľné

**Predstavte si AZD ako**: Docker Compose pre Azure—zjednodušená konfigurácia pre zložité nasadenia.

---

## Často kladené otázky

**Otázka: Môžem použiť iný programovací jazyk?**  
Odpoveď: Áno! Nahraďte `src/web/` za Node.js, C#, Go alebo akýkoľvek iný jazyk. Aktualizujte `azure.yaml` a Bicep podľa potreby.

**Otázka: Ako môžem pridať viac databáz?**  
Odpoveď: Pridajte ďalší SQL Database modul do `infra/main.bicep` alebo použite PostgreSQL/MySQL z Azure Database služieb.

**Otázka: Môžem to použiť na produkciu?**  
Odpoveď: Toto je východiskový bod. Pre produkciu pridajte: spravovanú identitu, súkromné koncové body, redundanciu, zálohovaciu stratégiu, WAF a rozšírené monitorovanie.

**Otázka: Čo ak chcem použiť kontajnery namiesto nasadzovania kódu?**  
Odpoveď: Pozrite si [Príklad aplikácií v kontajneroch](../../../../examples/container-app), ktorý používa Docker kontajnery.

**Otázka: Ako sa pripojím k databáze z môjho lokálneho počítača?**  
Odpoveď: Pridajte svoju IP adresu do firewallu SQL Servera:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Otázka: Môžem použiť existujúcu databázu namiesto vytvárania novej?**  
Odpoveď: Áno, upravte `infra/main.bicep`, aby odkazoval na existujúci SQL Server, a aktualizujte parametre pripojenia.

---

> **Poznámka:** Tento príklad demonštruje najlepšie postupy pre nasadzovanie webovej aplikácie s databázou pomocou AZD. Obsahuje funkčný kód, komplexnú dokumentáciu a praktické cvičenia na posilnenie učenia. Pre produkčné nasadenia si preštudujte bezpečnostné, škálovacie, súladové a nákladové požiadavky špecifické pre vašu organizáciu.

**📚 Navigácia kurzom:**
- ← Predchádzajúce: [Príklad aplikácií v kontajneroch](../../../../examples/container-app)
- → Ďalej: [Príručka integrácie AI](../../../../docs/ai-foundry)
- 🏠 [Domov kurzu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->