# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Odhadovaný čas**: 20–30 minut | 💰 **Odhadované náklady**: ~$15-25/měsíc | ⭐ **Složitost**: Středně pokročilé

Tento **úplný, funkční příklad** ukazuje, jak použít [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) k nasazení webové aplikace Python Flask s Microsoft SQL databází do Azure. Všechen kód je zahrnut a otestován—žádné externí závislosti nejsou potřeba.

## Co se naučíte

Dokončením tohoto příkladu:
- Nasadíte vícevrstvou aplikaci (webová aplikace + databáze) pomocí infrastruktury jako kódu
- Nakonfigurujete zabezpečené připojení k databázi bez tvrdého kódování tajemství
- Monitorujete stav aplikace pomocí Application Insights
- Efektivně spravujete Azure zdroje pomocí AZD CLI
- Dodržíte osvědčené postupy Azure pro bezpečnost, optimalizaci nákladů a observabilitu

## Přehled scénáře
- **Web App**: Python Flask REST API s připojením k databázi
- **Database**: Azure SQL Database s ukázkovými daty
- **Infrastructure**: Provisionováno pomocí Bicep (modulární, opakovaně použitelné šablony)
- **Deployment**: Plně automatizované pomocí příkazů `azd`
- **Monitoring**: Application Insights pro logy a telemetrii

## Předpoklady

### Požadované nástroje

Před začátkem si ověřte, že máte nainstalované tyto nástroje:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verze 2.50.0 nebo vyšší)
   ```sh
   az --version
   # Očekávaný výstup: azure-cli 2.50.0 nebo vyšší
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verze 1.0.0 nebo vyšší)
   ```sh
   azd version
   # Očekávaný výstup: azd verze 1.0.0 nebo vyšší
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (pro lokální vývoj)
   ```sh
   python --version
   # Očekávaný výstup: Python 3.8 nebo vyšší
   ```

4. **[Docker](https://www.docker.com/get-started)** (volitelně, pro lokální kontejnerizovaný vývoj)
   ```sh
   docker --version
   # Očekávaný výstup: Docker verze 20.10 nebo novější
   ```

### Požadavky na Azure

- Aktivní **Azure subscription** ([vytvořte bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnění vytvářet zdroje ve vaší subscription
- Role **Owner** nebo **Contributor** na subscription nebo resource group

### Požadované znalosti

Tento příklad je **středně pokročilý**. Měli byste být obeznámeni s:
- Základními operacemi v příkazové řádce
- Základními cloudovými koncepty (zdroje, resource group)
- Základním pochopením webových aplikací a databází

**Nový v AZD?** Nejprve začněte s [průvodcem Začínáme](../../docs/chapter-01-foundation/azd-basics.md).

## Architektura

Tento příklad nasazuje dvouvrstvou architekturu s webovou aplikací a SQL databází:

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

**Nasazení zdrojů:**
- **Resource Group**: Kontejner pro všechny zdroje
- **App Service Plan**: Hostování na Linuxu (úroveň B1 pro úsporu nákladů)
- **Web App**: Runtime Python 3.11 s Flask aplikací
- **SQL Server**: Spravovaný databázový server s minimem TLS 1.2
- **SQL Database**: Základní úroveň (2GB, vhodné pro vývoj/testování)
- **Application Insights**: Monitorování a logování
- **Log Analytics Workspace**: Centralizované ukládání logů

**Analogie**: Představte si to jako restauraci (web app) s mrazákem (databáze). Zákazníci objednávají z menu (API endpointy) a kuchyně (Flask app) bere suroviny (data) z mrazáku. Manažer restaurace (Application Insights) sleduje vše, co se děje.

## Struktura složek

Všechny soubory jsou zahrnuty v tomto příkladu—žádné externí závislosti nejsou potřeba:

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

**Co každý soubor dělá:**
- **azure.yaml**: Říká AZD, co nasadit a kam
- **infra/main.bicep**: Orchestrace všech Azure zdrojů
- **infra/resources/*.bicep**: Jednotlivé definice zdrojů (modulární pro opětovné použití)
- **src/web/app.py**: Flask aplikace s logikou pro databázi
- **requirements.txt**: Závislosti Python balíčků
- **Dockerfile**: Instrukce pro kontejnerizaci a nasazení

## Rychlý start (krok za krokem)

### Krok 1: Klonovat a přejít do složky

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kontrola úspěchu**: Ověřte, že vidíte `azure.yaml` a složku `infra/`:
```sh
ls
# Očekává se: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentizace do Azure

```sh
azd auth login
```

Tím se otevře váš prohlížeč pro autentizaci do Azure. Přihlaste se pomocí Azure přihlašovacích údajů.

**✓ Kontrola úspěchu**: Měli byste vidět:
```
Logged in to Azure.
```

### Krok 3: Inicializace prostředí

```sh
azd init
```

**Co se stane**: AZD vytvoří lokální konfiguraci pro vaše nasazení.

**Výzvy, které se zobrazí**:
- **Environment name**: Zadejte krátký název (např. `dev`, `myapp`)
- **Azure subscription**: Vyberte subscription ze seznamu
- **Azure location**: Zvolte region (např. `eastus`, `westeurope`)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: New project initialized!
```

### Krok 4: Provision Azure zdrojů

```sh
azd provision
```

**Co se stane**: AZD nasadí veškerou infrastrukturu (trvá 5–8 minut):
1. Vytvoří resource group
2. Vytvoří SQL Server a Database
3. Vytvoří App Service Plan
4. Vytvoří Web App
5. Vytvoří Application Insights
6. Nakonfiguruje síťování a zabezpečení

**Budete vyzváni k zadání**:
- **SQL admin username**: Zadejte uživatelské jméno (např. `sqladmin`)
- **SQL admin password**: Zadejte silné heslo (uložte si ho!)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Doba**: 5–8 minut

### Krok 5: Nasazení aplikace

```sh
azd deploy
```

**Co se stane**: AZD postaví a nasadí vaši Flask aplikaci:
1. Zabalí Python aplikaci
2. Sestaví Docker kontejner
3. Pushne do Azure Web App
4. Inicializuje databázi s ukázkovými daty
5. Spustí aplikaci

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Doba**: 3–5 minut

### Krok 6: Prohlédnout aplikaci

```sh
azd browse
```

Tím se otevře nasazená webová aplikace v prohlížeči na `https://app-<unique-id>.azurewebsites.net`

**✓ Kontrola úspěchu**: Měli byste vidět JSON výstup:
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

### Krok 7: Testovat API endpointy

**Health Check** (ověřte připojení k databázi):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Očekávaná odpověď**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Seznam produktů** (ukázková data):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Očekávaná odpověď**:
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

**Získat jeden produkt**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kontrola úspěchu**: Všechny endpointy vrací JSON data bez chyb.

---

**🎉 Gratulujeme!** Úspěšně jste nasadili webovou aplikaci s databází do Azure pomocí AZD.

## Hlubší konfigurace

### Proměnné prostředí

Tajemství jsou spravována bezpečně přes konfiguraci Azure App Service—**nikdy je neukládejte napevno v kódu**.

**Automaticky nakonfigurováno AZD**:
- `SQL_CONNECTION_STRING`: Připojení k databázi s šifrovanými přihlašovacími údaji
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrický endpoint pro monitorování
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Umožňuje automatickou instalaci závislostí během nasazení

**Kde jsou tajemství uložena**:
1. Při `azd provision` zadáte SQL přihlašovací údaje přes zabezpečené výzvy
2. AZD je uloží do lokálního souboru `.azure/<env-name>/.env` (ignorován v Gitu)
3. AZD je injektuje do konfigurace Azure App Service (šifrováno v klidu)
4. Aplikace je čte přes `os.getenv()` při běhu

### Lokální vývoj

Pro lokální testování vytvořte `.env` soubor ze vzoru:

```sh
cp .env.sample .env
# Upravte .env s připojením k místní databázi
```

**Lokální pracovní tok**:
```sh
# Nainstalujte závislosti
cd src/web
pip install -r requirements.txt

# Nastavte proměnné prostředí
export SQL_CONNECTION_STRING="your-local-connection-string"

# Spusťte aplikaci
python app.py
```

**Testujte lokálně**:
```sh
curl http://localhost:8000/health
# Očekává se: {"status": "healthy", "database": "connected"}
```

### Infrastruktura jako kód

Všechny Azure zdroje jsou definovány v **Bicep šablonách** (složka `infra/`):

- **Modulární design**: Každý typ zdroje má vlastní soubor pro znovupoužitelnost
- **Parametrizované**: Přizpůsobte SKU, regiony, názvosloví
- **Osvědčené postupy**: Dodržuje naming standardy Azure a bezpečnostní výchozí hodnoty
- **Verzováno**: Změny infrastruktury jsou sledovány v Gitu

**Příklad přizpůsobení**:
Chcete-li změnit úroveň databáze, upravte `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Bezpečnostní osvědčené postupy

Tento příklad dodržuje bezpečnostní osvědčené postupy Azure:

### 1. **Žádná tajemství v kódu**
- ✅ Přihlašovací údaje ukládány v konfiguraci Azure App Service (šifrovaně)
- ✅ `.env` soubory vyloučeny z Gitu pomocí `.gitignore`
- ✅ Tajemství předána přes zabezpečené parametry při provisioningu

### 2. **Šifrovaná připojení**
- ✅ TLS 1.2 minimálně pro SQL Server
- ✅ HTTPS-only vynuceno pro Web App
- ✅ Připojení k databázi používají šifrované kanály

### 3. **Síťová bezpečnost**
- ✅ Firewall SQL Serveru nakonfigurován tak, aby povoloval pouze Azure služby
- ✅ Veřejný přístup omezen (lze dále uzamknout pomocí Private Endpoints)
- ✅ FTPS zakázáno na Web App

### 4. **Autentizace & Autorizace**
- ⚠️ **Aktuálně**: SQL autentizace (uživatelské jméno/heslo)
- ✅ **Doporučení pro produkci**: Použít Azure Managed Identity pro autentizaci bez hesla

**Pro upgrade na Managed Identity** (pro produkci):
1. Povolit managed identity na Web App
2. Udělit identitě oprávnění v SQL
3. Aktualizovat connection string pro použití managed identity
4. Odstranit autentizaci založenou na hesle

### 5. **Auditování & Shoda**
- ✅ Application Insights loguje všechny požadavky a chyby
- ✅ Auditování SQL Database povoleno (lze nakonfigurovat pro shodu)
- ✅ Všechny zdroje označeny tagy pro správu

**Kontrolní seznam bezpečnosti před produkcí**:
- [ ] Povolte Azure Defender pro SQL
- [ ] Nakonfigurujte Private Endpoints pro SQL Database
- [ ] Povolte Web Application Firewall (WAF)
- [ ] Implementujte Azure Key Vault pro rotaci tajemství
- [ ] Nakonfigurujte Azure AD autentizaci
- [ ] Povolte diagnostické logování pro všechny zdroje

## Optimalizace nákladů

**Odhadované měsíční náklady** (k listopadu 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Tipy pro úsporu nákladů**:

1. **Použijte bezplatnou úroveň pro učení**:
   - App Service: F1 tier (zdarma, omezené hodiny)
   - SQL Database: Použijte Azure SQL Database serverless
   - Application Insights: 5GB/měsíc bezplatný ingest

2. **Zastavte zdroje, když nejsou v použití**:
   ```sh
   # Zastavit webovou aplikaci (za databázi se stále platí)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Restartovat podle potřeby
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Odstraňte vše po testování**:
   ```sh
   azd down
   ```
   Toto odstraní VŠECHNY zdroje a zastaví poplatky.

4. **Vývoj vs. produkční SKU**:
   - **Vývoj**: Základní úroveň (použitá v tomto příkladu)
   - **Produkce**: Standard/Premium úroveň s redundancí

**Monitorování nákladů**:
- Zobrazení nákladů v [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nastavte upozornění nákladů, abyste předešli překvapením
- Označte všechny zdroje tagem `azd-env-name` pro sledování

**Alternativa bezplatné úrovně**:
Pro účely učení můžete upravit `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Poznámka**: Bezplatná úroveň má omezení (60 min/den CPU, žádné always-on).

## Monitoring & Observabilita

### Integrace Application Insights

Tento příklad zahrnuje **Application Insights** pro komplexní monitoring:

**Co se monitoruje**:
- ✅ HTTP požadavky (latence, stavové kódy, endpointy)
- ✅ Chyby a výjimky aplikace
- ✅ Vlastní logování z Flask aplikace
- ✅ Stav připojení k databázi
- ✅ Výkonnostní metriky (CPU, paměť)

**Přístup k Application Insights**:
1. Otevřete [Azure Portal](https://portal.azure.com)
2. Přejděte do vaší resource group (`rg-<env-name>`)
3. Klikněte na Application Insights zdroj (`appi-<unique-id>`)

**Užitečné dotazy** (Application Insights → Logs):

**Zobrazit všechny požadavky**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Najít chyby**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Zkontrolovat health endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditování SQL Database

**Auditování SQL Database je povoleno** pro sledování:
- Vzorců přístupu k databázi
- Neúspěšných přihlášení
- Změn schématu
- Přístupu k datům (pro shodu)

**Přístup k auditním logům**:
1. Azure Portal → SQL Database → Auditing
2. Zobrazit logy v Log Analytics workspace

### Monitorování v reálném čase

**Zobrazit Live Metrics**:
1. Application Insights → Live Metrics
2. Sledujte požadavky, selhání a výkon v reálném čase

**Nastavit upozornění**:
Vytvořte upozornění pro kritické události:
- HTTP 500 chyby > 5 za 5 minut
- Selhání připojení k databázi
- Vysoké doby odezvy (>2 sekundy)

**Example Alert Creation**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Řešení problémů

### Běžné problémy a řešení

#### 1. `azd provision` selže s "Location not available"

**Příznak**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Řešení**:
Zvolte jiný Azure region nebo zaregistrujte poskytovatele prostředků:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Selhání připojení k SQL během nasazení

**Příznak**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Řešení**:
- Ověřte, že firewall SQL Serveru povoluje Azure služby (konfigurováno automaticky)
- Zkontrolujte, zda byl správně zadán SQL admin heslo během `azd provision`
- Ujistěte se, že SQL Server je plně provisionován (může trvat 2–3 minuty)

**Ověřit připojení**:
```sh
# V Azure portálu přejděte na SQL databázi → Editor dotazů
# Zkuste se připojit pomocí svých přihlašovacích údajů
```

#### 3. Webová aplikace zobrazuje "Application Error"

**Příznak**:
Prohlížeč zobrazuje obecnou chybovou stránku.

**Řešení**:
Zkontrolujte logy aplikace:
```sh
# Zobrazit nedávné záznamy
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Běžné příčiny**:
- Chybějící proměnné prostředí (zkontrolujte App Service → Configuration)
- Instalace Python balíčků selhala (zkontrolujte nasazovací logy)
- Chyba při inicializaci databáze (zkontrolujte konektivitu k SQL)

#### 4. `azd deploy` selže s "Build Error"

**Příznak**:
```
Error: Failed to build project
```

**Řešení**:
- Ujistěte se, že `requirements.txt` neobsahuje syntaktické chyby
- Zkontrolujte, že je v `infra/resources/web-app.bicep` uveden Python 3.11
- Ověřte, že Dockerfile má správný základní image

**Ladění lokálně**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" při spouštění AZD příkazů

**Příznak**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Řešení**:
Znovu se autentizujte do Azure:
```sh
azd auth login
az login
```

Ověřte, že máte správná oprávnění (role Contributor) v předplatném.

#### 6. Vysoké náklady na databázi

**Příznak**:
Neočekávaný Azure účet.

**Řešení**:
- Zkontrolujte, zda jste po testování nespustili `azd down`
- Ověřte, že SQL Database používá Basic tier (ne Premium)
- Prohlédněte náklady v Azure Cost Management
- Nastavte upozornění na náklady

### Získání pomoci

**Zobrazit všechny AZD proměnné prostředí**:
```sh
azd env get-values
```

**Zkontrolovat stav nasazení**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Přístup k logům aplikace**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potřebujete další pomoc?**
- [Průvodce řešením problémů AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktická cvičení

### Cvičení 1: Ověřte své nasazení (Začátečník)

**Cíl**: Potvrdit, že všechny zdroje jsou nasazeny a aplikace funguje.

**Kroky**:
1. Vypsat všechny zdroje ve vaší resource group:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Očekává se**: 6–7 zdrojů (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Otestovat všechny API endpointy:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Očekává se**: Vše vrací platný JSON bez chyb

3. Zkontrolovat Application Insights:
   - Přejděte do Application Insights v Azure Portalu
   - Přejděte na "Live Metrics"
   - Obnovte prohlížeč na webové aplikaci
   **Očekává se**: Vidíte požadavky objevující se v reálném čase

**Kritéria úspěchu**: Všechny 6–7 zdrojů existují, všechny endpointy vrací data, Live Metrics ukazuje aktivitu.

---

### Cvičení 2: Přidat nový API endpoint (Středně pokročilý)

**Cíl**: Rozšířit Flask aplikaci o nový endpoint.

**Vzorový kód**: Aktuální endpointy v `src/web/app.py`

**Kroky**:
1. Upravte `src/web/app.py` a přidejte nový endpoint za funkcí `get_product()`:
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

2. Nasadit aktualizovanou aplikaci:
   ```sh
   azd deploy
   ```

3. Otestovat nový endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očekává se**: Vrací produkty odpovídající "laptop"

**Kritéria úspěchu**: Nový endpoint funguje, vrací filtrované výsledky, objevuje se v Application Insights logech.

---

### Cvičení 3: Přidat monitoring a upozornění (Pokročilé)

**Cíl**: Nastavit proaktivní monitoring s upozorněními.

**Kroky**:
1. Vytvořit alert pro HTTP 500 chyby:
   ```sh
   # Získat ID prostředku Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Vytvořit upozornění
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Vyvolat alert způsobením chyb:
   ```sh
   # Požádat o neexistující produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Zkontrolovat, zda alert vyvolal:
   - Azure Portal → Alerts → Alert Rules
   - Zkontrolujte svůj e-mail (pokud nakonfigurováno)

**Kritéria úspěchu**: Pravidlo upozornění je vytvořeno, spouští se při chybách, jsou přijímána oznámení.

---

### Cvičení 4: Změny schématu databáze (Pokročilé)

**Cíl**: Přidat novou tabulku a upravit aplikaci, aby ji používala.

**Kroky**:
1. Připojte se k SQL Database přes Azure Portal Query Editor

2. Vytvořte novou tabulku `categories`:
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

3. Aktualizujte `src/web/app.py`, aby odpovědi obsahovaly informace o kategoriích

4. Nasadit a otestovat

**Kritéria úspěchu**: Nová tabulka existuje, produkty zobrazují informace o kategoriích, aplikace stále funguje.

---

### Cvičení 5: Implementovat cachování (Expertní)

**Cíl**: Přidat Azure Redis Cache pro zlepšení výkonu.

**Kroky**:
1. Přidat Redis Cache do `infra/main.bicep`
2. Aktualizovat `src/web/app.py` pro cachování dotazů na produkty
3. Změřit zlepšení výkonu pomocí Application Insights
4. Porovnat doby odezvy před/po cachování

**Kritéria úspěchu**: Redis je nasazen, cachování funguje, doby odezvy se zlepšily o >50%.

**Tip**: Začněte s [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Úklid

Aby se zabránilo průběžným poplatkům, odstraňte všechny zdroje po dokončení:

```sh
azd down
```

**Potvrzovací výzva**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Zadejte `y` pro potvrzení.

**✓ Kontrola úspěchu**: 
- Všechny zdroje jsou smazány z Azure Portalu
- Žádné průběžné poplatky
- Lokální složka `.azure/<env-name>` může být smazána

**Alternativa** (ponechat infrastrukturu, smazat data):
```sh
# Smazat pouze skupinu prostředků (ponechat konfiguraci AZD)
az group delete --name rg-<env-name> --yes
```
## Learn More

### Související dokumentace
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Další kroky v tomto kurzu
- **[Příklad Container Apps](../../../../examples/container-app)**: Nasazení mikroservis s Azure Container Apps
- **[Průvodce integrací AI](../../../../docs/ai-foundry)**: Přidat AI schopnosti do vaší aplikace
- **[Praktiky nasazení](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Vzory nasazení do produkce

### Pokročilá témata
- **Managed Identity**: Odstranit hesla a používat autentizaci Azure AD
- **Private Endpoints**: Zabezpečit připojení k databázi v rámci virtuální sítě
- **CI/CD Integrace**: Automatizovat nasazení s GitHub Actions nebo Azure DevOps
- **Více prostředí**: Nastavit dev, staging a production prostředí
- **Migrace databází**: Použít Alembic nebo Entity Framework pro verzování schémat

### Srovnání s jinými přístupy

**AZD vs. ARM Templates**:
- ✅ AZD: Vyšší úroveň abstrakce, jednodušší příkazy
- ⚠️ ARM: Verbóznější, detailnější kontrola

**AZD vs. Terraform**:
- ✅ AZD: Nativní pro Azure, integrovaný se službami Azure
- ⚠️ Terraform: Podpora více cloudů, širší ekosystém

**AZD vs. Azure Portal**:
- ✅ AZD: Opakovatelné, verzované, automatizovatelné
- ⚠️ Portal: Manuální klikání, obtížné reprodukovat

**Uvažujte o AZD jako**: Docker Compose pro Azure — zjednodušená konfigurace pro složitá nasazení.

---

## Často kladené otázky

**Q: Mohu použít jiný programovací jazyk?**  
A: Ano! Nahraďte `src/web/` Node.js, C#, Go nebo jiným jazykem. Aktualizujte `azure.yaml` a Bicep podle potřeby.

**Q: Jak přidám více databází?**  
A: Přidejte další SQL Database modul v `infra/main.bicep` nebo použijte PostgreSQL/MySQL ze služeb Azure Database.

**Q: Mohu toto použít do produkce?**  
A: Toto je výchozí bod. Pro produkci přidejte: managed identity, private endpoints, redundanci, zálohovací strategii, WAF a rozšířený monitoring.

**Q: Co když chci použít kontejnery místo nasazování kódu?**  
A: Podívejte se na [Příklad Container Apps](../../../../examples/container-app), který používá Docker kontejnery.

**Q: Jak se připojím k databázi ze svého lokálního počítače?**  
A: Přidejte svou IP do firewallu SQL Serveru:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Mohu použít existující databázi místo vytvoření nové?**  
A: Ano, upravte `infra/main.bicep`, aby odkazoval na existující SQL Server, a aktualizujte parametry connection stringu.

---

> **Poznámka:** Tento příklad demonstruje nejlepší postupy pro nasazení webové aplikace s databází pomocí AZD. Obsahuje funkční kód, podrobnou dokumentaci a praktická cvičení pro posílení učení. Pro produkční nasazení zkontrolujte bezpečnost, škálování, shodu a požadavky na náklady specifické pro vaši organizaci.

**📚 Navigace kurzu:**
- ← Předchozí: [Příklad Container Apps](../../../../examples/container-app)
- → Další: [Průvodce integrací AI](../../../../docs/ai-foundry)
- 🏠 [Domov kurzu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Prohlášení o vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí AI překladatelské služby Co-op Translator (https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za rozhodující zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Nejsme odpovědni za žádná nedorozumění nebo chybné výklady vyplývající z používání tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->