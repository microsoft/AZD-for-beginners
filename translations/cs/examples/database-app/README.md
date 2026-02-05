# Nasazení Microsoft SQL databáze a webové aplikace pomocí AZD

⏱️ **Odhadovaný čas**: 20-30 minut | 💰 **Odhadované náklady**: ~15-25 USD/měsíc | ⭐ **Složitost**: Střední

Tento **kompletní, funkční příklad** ukazuje, jak pomocí [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) nasadit webovou aplikaci Python Flask s Microsoft SQL databází do Azure. Veškerý kód je zahrnut a otestován – nejsou potřeba žádné externí závislosti.

## Co se naučíte

Po dokončení tohoto příkladu:
- Nasadíte vícevrstvou aplikaci (webová aplikace + databáze) pomocí infrastruktury jako kódu
- Nakonfigurujete bezpečné připojení k databázi bez pevného zakódování tajných údajů
- Budete monitorovat stav aplikace pomocí Application Insights
- Efektivně spravujete Azure zdroje pomocí AZD CLI
- Budete dodržovat osvědčené postupy Azure pro bezpečnost, optimalizaci nákladů a sledovatelnost

## Přehled scénáře
- **Webová aplikace**: Python Flask REST API s připojením k databázi
- **Databáze**: Azure SQL Database s ukázkovými daty
- **Infrastruktura**: Nasazena pomocí Bicep (modulární, znovupoužitelné šablony)
- **Nasazení**: Plně automatizované pomocí příkazů `azd`
- **Monitorování**: Application Insights pro logy a telemetrii

## Požadavky

### Potřebné nástroje

Před začátkem ověřte, že máte nainstalované tyto nástroje:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verze 2.50.0 nebo vyšší)
   ```sh
   az --version
   # Očekávaný výstup: azure-cli 2.50.0 nebo vyšší
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verze 1.0.0 nebo vyšší)
   ```sh
   azd version
   # Očekávaný výstup: verze azd 1.0.0 nebo vyšší
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (pro lokální vývoj)
   ```sh
   python --version
   # Očekávaný výstup: Python 3.8 nebo vyšší
   ```

4. **[Docker](https://www.docker.com/get-started)** (volitelné, pro lokální vývoj v kontejnerech)
   ```sh
   docker --version
   # Očekávaný výstup: Docker verze 20.10 nebo vyšší
   ```

### Požadavky na Azure

- Aktivní **Azure předplatné** ([vytvořte si bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnění k vytváření zdrojů ve vašem předplatném
- Role **Owner** nebo **Contributor** v předplatném nebo skupině zdrojů

### Požadované znalosti

Toto je příklad na **střední úrovni**. Měli byste mít základní znalosti o:
- Základních operacích na příkazové řádce
- Základních cloudových konceptech (zdroje, skupiny zdrojů)
- Základním porozumění webovým aplikacím a databázím

**Nováček v AZD?** Nejprve začněte s [průvodcem Začínáme](../../docs/getting-started/azd-basics.md).

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
- **Skupina zdrojů**: Kontejner pro všechny zdroje
- **App Service Plan**: Linuxové hostování (úroveň B1 pro úsporu nákladů)
- **Webová aplikace**: Python 3.11 runtime s Flask aplikací
- **SQL Server**: Spravovaný databázový server s minimem TLS 1.2
- **SQL Database**: Základní úroveň (2GB, vhodné pro vývoj/testování)
- **Application Insights**: Monitorování a logování
- **Log Analytics Workspace**: Centralizované úložiště logů

**Přirovnání**: Představte si to jako restauraci (webová aplikace) s mrazákem (databáze). Zákazníci si objednávají z menu (API endpointy) a kuchyně (Flask aplikace) získává ingredience (data) z mrazáku. Manažer restaurace (Application Insights) sleduje vše, co se děje.

## Struktura složek

Všechny soubory jsou zahrnuty v tomto příkladu – nejsou potřeba žádné externí závislosti:

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

**Co dělá každý soubor:**
- **azure.yaml**: Určuje, co má AZD nasadit a kam
- **infra/main.bicep**: Orchestrace všech Azure zdrojů
- **infra/resources/*.bicep**: Definice jednotlivých zdrojů (modulární pro opětovné použití)
- **src/web/app.py**: Flask aplikace s logikou databáze
- **requirements.txt**: Závislosti Python balíčků
- **Dockerfile**: Instrukce pro kontejnerizaci pro nasazení

## Rychlý start (krok za krokem)

### Krok 1: Klonování a navigace

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kontrola úspěchu**: Ověřte, že vidíte `azure.yaml` a složku `infra/`:
```sh
ls
# Očekáváno: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentizace s Azure

```sh
azd auth login
```

Tím se otevře váš prohlížeč pro autentizaci Azure. Přihlaste se pomocí svých Azure přihlašovacích údajů.

**✓ Kontrola úspěchu**: Měli byste vidět:
```
Logged in to Azure.
```

### Krok 3: Inicializace prostředí

```sh
azd init
```

**Co se stane**: AZD vytvoří lokální konfiguraci pro vaše nasazení.

**Výzvy, které uvidíte**:
- **Název prostředí**: Zadejte krátký název (např. `dev`, `myapp`)
- **Azure předplatné**: Vyberte své předplatné ze seznamu
- **Azure lokalita**: Vyberte region (např. `eastus`, `westeurope`)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: New project initialized!
```

### Krok 4: Zajištění Azure zdrojů

```sh
azd provision
```

**Co se stane**: AZD nasadí veškerou infrastrukturu (trvá 5-8 minut):
1. Vytvoří skupinu zdrojů
2. Vytvoří SQL Server a databázi
3. Vytvoří App Service Plan
4. Vytvoří Web App
5. Vytvoří Application Insights
6. Nakonfiguruje síť a zabezpečení

**Budete vyzváni k zadání**:
- **Uživatelské jméno správce SQL**: Zadejte uživatelské jméno (např. `sqladmin`)
- **Heslo správce SQL**: Zadejte silné heslo (uložte si ho!)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 5-8 minut

### Krok 5: Nasazení aplikace

```sh
azd deploy
```

**Co se stane**: AZD sestaví a nasadí vaši Flask aplikaci:
1. Zabalí Python aplikaci
2. Sestaví Docker kontejner
3. Nahraje do Azure Web App
4. Inicializuje databázi s ukázkovými daty
5. Spustí aplikaci

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 3-5 minut

### Krok 6: Prohlížení aplikace

```sh
azd browse
```

Tím se otevře vaše nasazená webová aplikace v prohlížeči na adrese `https://app-<unique-id>.azurewebsites.net`

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

### Krok 7: Testování API endpointů

**Kontrola zdraví** (ověření připojení k databázi):
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

**Získání jednoho produktu**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kontrola úspěchu**: Všechny endpointy vrací JSON data bez chyb.

---

**🎉 Gratulujeme!** Úspěšně jste nasadili webovou aplikaci s databází do Azure pomocí AZD.

## Podrobná konfigurace

### Proměnné prostředí

Tajné údaje jsou bezpečně spravovány prostřednictvím konfigurace Azure App Service – **nikdy nejsou pevně zakódovány ve zdrojovém kódu**.

**Automaticky nakonfigurováno pomocí AZD**:
- `SQL_CONNECTION_STRING`: Připojení k databázi s šifrovanými přihlašovacími údaji
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrický endpoint pro monitorování
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Povolení automatické instalace závislostí

**Kde jsou tajné údaje uloženy**:
1. Během `azd provision` zadáte SQL přihlašovací údaje prostřednictvím bezpečných výzev
2. AZD je uloží do vašeho lokálního `.azure/<env-name>/.env` souboru (ignorováno v gitu)
3. AZD je vloží do konfigurace Azure App Service (šifrováno v klidu)
4. Aplikace je čte pomocí `os.getenv()` za běhu

### Lokální vývoj

Pro lokální testování vytvořte `.env` soubor ze vzoru:

```sh
cp .env.sample .env
# Upravte .env s připojením k vaší lokální databázi
```

**Workflow lokálního vývoje**:
```sh
# Nainstalujte závislosti
cd src/web
pip install -r requirements.txt

# Nastavte proměnné prostředí
export SQL_CONNECTION_STRING="your-local-connection-string"

# Spusťte aplikaci
python app.py
```

**Testování lokálně**:
```sh
curl http://localhost:8000/health
# Očekáváno: {"status": "zdravý", "database": "připojeno"}
```

### Infrastruktura jako kód

Všechny Azure zdroje jsou definovány v **Bicep šablonách** (složka `infra/`):

- **Modulární design**: Každý typ zdroje má svůj vlastní soubor pro opětovné použití
- **Parametrizováno**: Přizpůsobte SKU, regiony, konvence pojmenování
- **Osvědčené postupy**: Dodržuje standardy pojmenování a výchozí zabezpečení Azure
- **Verzováno**: Změny infrastruktury jsou sledovány v Gitu

**Příklad přizpůsobení**:
Pro změnu úrovně databáze upravte `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Osvědčené postupy zabezpečení

Tento příklad dodržuje osvědčené postupy zabezpečení Azure:

### 1. **Žádné tajné údaje ve zdrojovém kódu**
- ✅ Přihlašovací údaje jsou uloženy v konfiguraci Azure App Service (šifrováno)
- ✅ `.env` soubory jsou vyloučeny z Gitu pomocí `.gitignore`
- ✅ Tajné údaje jsou předávány prostřednictvím bezpečných parametrů během zajištění

### 2. **Šifrovaná připojení**
- ✅ Minimum TLS 1.2 pro SQL Server
- ✅ Vynuceno pouze HTTPS pro Web App
- ✅ Připojení k databázi používají šifrované kanály

### 3. **Síťová bezpečnost**
- ✅ Firewall SQL Serveru je nakonfigurován tak, aby povoloval pouze služby Azure
- ✅ Omezený přístup k veřejné síti (lze dále uzamknout pomocí Private Endpoints)
- ✅ FTPS na Web App je zakázáno

### 4. **Autentizace a autorizace**
- ⚠️ **Aktuální**: SQL autentizace (uživatelské jméno/heslo)
- ✅ **Doporučení pro produkci**: Použijte Azure Managed Identity pro autentizaci bez hesla

**Pro přechod na Managed Identity** (pro produkci):
1. Povolit Managed Identity na Web App
2. Udělit identitě oprávnění SQL
3. Aktualizovat připojovací řetězec pro použití Managed Identity
4. Odstranit autentizaci založenou na hesle

### 5. **Auditování a shoda**
- ✅ Application Insights loguje všechny požadavky a chyby
- ✅ Auditování SQL databáze je povoleno (lze nakonfigurovat pro shodu)
- ✅ Všechny zdroje jsou označeny pro správu

**Kontrolní seznam zabezpečení před produkcí**:
- [ ] Povolit Azure Defender pro SQL
- [ ] Nakonfigurovat Private Endpoints pro SQL databázi
- [ ] Povolit Web Application Firewall (WAF)
- [ ] Implementovat Azure Key Vault pro rotaci tajných údajů
- [ ] Nakonfigurovat autentizaci Azure AD
- [ ] Povolit diagnostické logování pro všechny zdroje

## Optimalizace nákladů

**Odhadované měsíční náklady** (k listopadu 2025):

| Zdroj | SKU/Úroveň | Odhadované náklady |
|-------|------------|--------------------|
| App Service Plan | B1 (Basic) | ~13 USD/měsíc |
| SQL Database | Basic (2GB) | ~5 USD/měsíc |
| Application Insights | Pay-as-you-go | ~2 USD/měsíc (nízký provoz) |
| **Celkem** | | **~20 USD/měsíc** |

**💡 Tipy na úsporu nákladů**:

1. **Použijte bezplatnou úroveň pro učení**:
   - App Service: Úroveň F1 (zdarma, omezené hodiny)
   - SQL Database: Použijte serverless Azure SQL Database
   - Application Insights: 5GB/měsíc zdarma pro ingestování

2. **Zastavte zdroje, když je nepoužíváte**:
   ```sh
   # Zastavte webovou aplikaci (databáze stále účtuje)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Restartujte, když je to potřeba
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Odstraňte vše po testování**:
   ```sh
   azd down
   ```
   Tím odstraníte VŠECHNY zdroje a zastavíte poplatky.

4. **Vývojové vs. produkční SKU**:
   - **Vývoj**: Základní úroveň (použito v tomto příkladu)
   - **Produkce**: Standardní/Premium úroveň s redundancí

**Sledování nákladů**:
- Sledujte náklady v [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nastavte upozornění na náklady, abyste předešli překvapením
- Označte všechny zdroje pomocí `azd-env-name` pro sledování

**Alternativa bezplatné úrovně**:
Pro účely učení můžete upravit `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Poznámka**: Bezplatná úroveň má omezení (60 min/den CPU, žádné always-on).

## Monitorování a sledovatelnost

### Integrace Application Insights

Tento příklad zahrnuje **Application Insights** pro komplexní monitorování:

**Co se monitoruje**:
- ✅ HTTP požadavky (latence, stavové kódy, endpointy)
- ✅ Chyby aplikace a výjimky
- ✅ Vlastní logování z Flask aplikace
- ✅ Stav připojení k databázi
- ✅ Výkonnostní metriky (CPU, paměť)

**Přístup k Application Insights**:
1. Otevřete [Azure Portal](https://portal.azure.com)
2. Přejděte do své skupiny zdrojů (`rg-<env-name>`)
3. Klikněte na zdroj Application Insights (`appi-<unique-id>`)

**Užitečné dotazy** (Application Insights → Logy):

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

**Zkontrolovat endpoint zdraví**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditování SQL databáze

**Auditování SQL databáze je povoleno** pro sledování:
- Vzorů přístupu k databázi
- Neúspěšných pokusů o přihlášení
- Změn schématu
- Přístupu k datům (pro shodu)

**Přístup k auditním logům**:
1. Azure Portal → SQL Database → Auditování
2. Zobrazte logy v Log Analytics workspace

### Monitorování v reálném čase

**Zobrazit živé metriky**:
1. Application Insights → Live Metrics
2. Sledujte požadavky, chyby a výkon v reálném čase

**Nastavení upozornění**:
Vytvořte upozornění na kritické události:
- HTTP 500 chyb >
- Vysoké doby odezvy (>2 sekundy)

**Příklad vytvoření upozornění**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Řešení problémů

### Běžné problémy a jejich řešení

#### 1. `azd provision` selže s chybou "Lokace není dostupná"

**Příznak**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Řešení**:
Vyberte jiný region Azure nebo zaregistrujte poskytovatele zdrojů:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Selhání připojení k SQL během nasazení

**Příznak**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Řešení**:
- Ověřte, že firewall SQL Serveru povoluje služby Azure (automaticky konfigurováno)
- Zkontrolujte, zda bylo správně zadáno heslo administrátora SQL během `azd provision`
- Ujistěte se, že SQL Server je plně zprovozněn (může to trvat 2-3 minuty)

**Ověření připojení**:
```sh
# Z Azure Portálu přejděte na SQL Database → Editor dotazů
# Zkuste se připojit pomocí svých přihlašovacích údajů
```

#### 3. Webová aplikace zobrazuje "Chyba aplikace"

**Příznak**:
Prohlížeč zobrazuje obecnou chybovou stránku.

**Řešení**:
Zkontrolujte logy aplikace:
```sh
# Zobrazit nedávné záznamy
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Běžné příčiny**:
- Chybějící proměnné prostředí (zkontrolujte App Service → Konfigurace)
- Selhání instalace Python balíčků (zkontrolujte logy nasazení)
- Chyba inicializace databáze (zkontrolujte připojení k SQL)

#### 4. `azd deploy` selže s chybou "Chyba sestavení"

**Příznak**:
```
Error: Failed to build project
```

**Řešení**:
- Ujistěte se, že `requirements.txt` neobsahuje chyby syntaxe
- Zkontrolujte, zda je v `infra/resources/web-app.bicep` uveden Python 3.11
- Ověřte, že Dockerfile má správný základní obraz

**Lokalní ladění**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Neautorizováno" při spuštění příkazů AZD

**Příznak**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Řešení**:
Znovu se autentizujte s Azure:
```sh
azd auth login
az login
```

Ověřte, že máte správná oprávnění (role Contributor) na předplatném.

#### 6. Vysoké náklady na databázi

**Příznak**:
Neočekávaný účet za Azure.

**Řešení**:
- Zkontrolujte, zda jste po testování nezapomněli spustit `azd down`
- Ověřte, že SQL Database používá Basic tier (ne Premium)
- Projděte náklady v Azure Cost Management
- Nastavte upozornění na náklady

### Získání pomoci

**Zobrazit všechny proměnné prostředí AZD**:
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

**Potřebujete více pomoci?**
- [AZD Troubleshooting Guide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktická cvičení

### Cvičení 1: Ověření vašeho nasazení (Začátečník)

**Cíl**: Ověřte, že všechny zdroje jsou nasazeny a aplikace funguje.

**Kroky**:
1. Vylistujte všechny zdroje ve vaší skupině zdrojů:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Očekáváno**: 6-7 zdrojů (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Otestujte všechny API endpointy:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Očekáváno**: Všechny vrací platný JSON bez chyb

3. Zkontrolujte Application Insights:
   - Přejděte do Application Insights v Azure Portálu
   - Jděte na "Live Metrics"
   - Obnovte prohlížeč na webové aplikaci
   **Očekáváno**: Vidíte požadavky v reálném čase

**Kritéria úspěchu**: Všechny 6-7 zdroje existují, všechny endpointy vrací data, Live Metrics ukazuje aktivitu.

---

### Cvičení 2: Přidání nového API endpointu (Středně pokročilý)

**Cíl**: Rozšířit Flask aplikaci o nový endpoint.

**Výchozí kód**: Aktuální endpointy v `src/web/app.py`

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

2. Nasazení aktualizované aplikace:
   ```sh
   azd deploy
   ```

3. Otestujte nový endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očekáváno**: Vrací produkty odpovídající "laptop"

**Kritéria úspěchu**: Nový endpoint funguje, vrací filtrované výsledky, zobrazuje se v logech Application Insights.

---

### Cvičení 3: Přidání monitoringu a upozornění (Pokročilý)

**Cíl**: Nastavit proaktivní monitoring s upozorněními.

**Kroky**:
1. Vytvořte upozornění na HTTP 500 chyby:
   ```sh
   # Získejte ID prostředku Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Vytvořte upozornění
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Vyvolejte upozornění způsobením chyb:
   ```sh
   # Požádat o neexistující produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Zkontrolujte, zda upozornění bylo spuštěno:
   - Azure Portal → Alerts → Alert Rules
   - Zkontrolujte svůj e-mail (pokud je nastaven)

**Kritéria úspěchu**: Pravidlo upozornění je vytvořeno, spouští se při chybách, oznámení jsou přijata.

---

### Cvičení 4: Změny schématu databáze (Pokročilý)

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

3. Aktualizujte `src/web/app.py`, aby zahrnovala informace o kategoriích v odpovědích

4. Nasazení a testování

**Kritéria úspěchu**: Nová tabulka existuje, produkty zobrazují informace o kategoriích, aplikace stále funguje.

---

### Cvičení 5: Implementace cachování (Expertní)

**Cíl**: Přidat Azure Redis Cache pro zlepšení výkonu.

**Kroky**:
1. Přidejte Redis Cache do `infra/main.bicep`
2. Aktualizujte `src/web/app.py`, aby cachovala dotazy na produkty
3. Změřte zlepšení výkonu pomocí Application Insights
4. Porovnejte doby odezvy před/po cachování

**Kritéria úspěchu**: Redis je nasazen, cachování funguje, doby odezvy se zlepšily o >50%.

**Tip**: Začněte s [dokumentací Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Úklid

Aby se předešlo dalším poplatkům, smažte všechny zdroje po dokončení:

```sh
azd down
```

**Potvrzovací výzva**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Zadejte `y` pro potvrzení.

**✓ Kontrola úspěchu**: 
- Všechny zdroje jsou smazány z Azure Portálu
- Žádné další poplatky
- Lokální složku `.azure/<env-name>` lze smazat

**Alternativa** (ponechat infrastrukturu, smazat data):
```sh
# Smazat pouze skupinu prostředků (ponechat konfiguraci AZD)
az group delete --name rg-<env-name> --yes
```
## Další informace

### Související dokumentace
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentace Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentace Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentace Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Referenční příručka jazyka Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Další kroky v tomto kurzu
- **[Příklad Container Apps](../../../../examples/container-app)**: Nasazení mikroslužeb s Azure Container Apps
- **[Průvodce integrací AI](../../../../docs/ai-foundry)**: Přidání AI funkcí do vaší aplikace
- **[Nejlepší postupy nasazení](../../docs/deployment/deployment-guide.md)**: Vzory nasazení pro produkci

### Pokročilá témata
- **Spravovaná identita**: Odstranění hesel a použití autentizace Azure AD
- **Privátní endpointy**: Zabezpečení připojení k databázi v rámci virtuální sítě
- **Integrace CI/CD**: Automatizace nasazení pomocí GitHub Actions nebo Azure DevOps
- **Více prostředí**: Nastavení dev, staging a produkčních prostředí
- **Migrace databáze**: Použití Alembic nebo Entity Framework pro verzování schématu

### Porovnání s jinými přístupy

**AZD vs. ARM Templates**:
- ✅ AZD: Vyšší úroveň abstrakce, jednodušší příkazy
- ⚠️ ARM: Více podrobností, jemnější kontrola

**AZD vs. Terraform**:
- ✅ AZD: Nativní pro Azure, integrované s Azure službami
- ⚠️ Terraform: Podpora více cloudů, větší ekosystém

**AZD vs. Azure Portal**:
- ✅ AZD: Opakovatelné, verzovatelné, automatizovatelné
- ⚠️ Portal: Manuální klikání, obtížné reprodukovat

**Představte si AZD jako**: Docker Compose pro Azure—zjednodušená konfigurace pro komplexní nasazení.

---

## Často kladené otázky

**Otázka: Mohu použít jiný programovací jazyk?**  
Odpověď: Ano! Nahraďte `src/web/` Node.js, C#, Go nebo jiným jazykem. Aktualizujte `azure.yaml` a Bicep podle potřeby.

**Otázka: Jak přidám více databází?**  
Odpověď: Přidejte další modul SQL Database do `infra/main.bicep` nebo použijte PostgreSQL/MySQL z Azure Database služeb.

**Otázka: Mohu to použít pro produkci?**  
Odpověď: Toto je výchozí bod. Pro produkci přidejte: spravovanou identitu, privátní endpointy, redundanci, strategii zálohování, WAF a rozšířený monitoring.

**Otázka: Co když chci použít kontejnery místo nasazení kódu?**  
Odpověď: Podívejte se na [Příklad Container Apps](../../../../examples/container-app), který používá Docker kontejnery.

**Otázka: Jak se připojím k databázi z mého lokálního počítače?**  
Odpověď: Přidejte svou IP do firewallu SQL Serveru:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Otázka: Mohu použít existující databázi místo vytvoření nové?**  
Odpověď: Ano, upravte `infra/main.bicep`, aby odkazovala na existující SQL Server, a aktualizujte parametry připojovacího řetězce.

---

> **Poznámka:** Tento příklad demonstruje nejlepší postupy pro nasazení webové aplikace s databází pomocí AZD. Obsahuje funkční kód, komplexní dokumentaci a praktická cvičení pro posílení znalostí. Pro produkční nasazení zkontrolujte požadavky na zabezpečení, škálování, shodu a náklady specifické pro vaši organizaci.

**📚 Navigace kurzu:**
- ← Předchozí: [Příklad Container Apps](../../../../examples/container-app)
- → Další: [Průvodce integrací AI](../../../../docs/ai-foundry)
- 🏠 [Domov kurzu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->