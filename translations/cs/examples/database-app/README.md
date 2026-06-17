# Nasazení databáze Microsoft SQL a webové aplikace pomocí AZD

⏱️ **Odhadovaný čas**: 20-30 minut | 💰 **Odhadované náklady**: ~$15-25/měsíc | ⭐ **Složitost**: Střední

Tento **úplný, funkční příklad** ukazuje, jak použít [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) k nasazení webové aplikace Python Flask s databází Microsoft SQL do Azure. Veškerý kód je zahrnut a otestován — nejsou potřeba žádné externí závislosti.

## Co se naučíte

Po dokončení tohoto příkladu budete umět:
- Nasadit vícevrstvou aplikaci (webová aplikace + databáze) pomocí infrastruktury jako kódu
- Konfigurovat zabezpečená připojení k databázi bez vkládání tajemství do zdrojového kódu
- Monitorovat stav aplikace pomocí Application Insights
- Efektivně spravovat zdroje Azure pomocí nástroje AZD CLI
- Řídit se nejlepšími postupy Azure pro zabezpečení, optimalizaci nákladů a pozorovatelnost

## Přehled scénáře
- **Web App**: Python Flask REST API s připojením k databázi
- **Database**: Azure SQL Database s ukázkovými daty
- **Infrastructure**: Zajištěno pomocí Bicep (modulární, znovupoužitelné šablony)
- **Deployment**: Plně automatizované pomocí příkazů `azd`
- **Monitoring**: Application Insights pro logy a telemetrii

## Požadavky

### Požadované nástroje

Před zahájením ověřte, že máte nainstalované tyto nástroje:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (verze 2.50.0 nebo novější)
   ```sh
   az --version
   # Očekávaný výstup: azure-cli 2.50.0 nebo vyšší
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (verze 1.0.0 nebo novější)
   ```sh
   azd version
   # Očekávaný výstup: azd verze 1.0.0 nebo novější
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (pro lokální vývoj)
   ```sh
   python --version
   # Očekávaný výstup: Python 3.8 nebo vyšší
   ```

4. **[Docker](https://www.docker.com/get-started)** (volitelně, pro lokální vývoj v kontejnerech)
   ```sh
   docker --version
   # Očekávaný výstup: Docker verze 20.10 nebo novější
   ```

### Požadavky na Azure

- Aktivní **předplatné Azure** ([vytvořte si bezplatný účet](https://azure.microsoft.com/free/))
- Oprávnění k vytváření zdrojů ve vašem předplatném
- Role **Owner** nebo **Contributor** na předplatném nebo ve skupině prostředků

### Požadované znalosti

Toto je příklad na **střední úrovni**. Měli byste být obeznámeni s:
- Základními operacemi v příkazovém řádku
- Základními cloudovými koncepty (zdroje, skupiny prostředků)
- Základním pochopením webových aplikací a databází

**Nový v AZD?** Nejprve začněte s [průvodcem Začínáme](../../docs/chapter-01-foundation/azd-basics.md).

## Architektura

Tento příklad nasazuje dvouvrstvou architekturu s webovou aplikací a SQL databází:

```mermaid
graph TD
    Browser[Uživatelský prohlížeč] <--> WebApp[Azure Web App<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Bezpečné připojení<br/>Šifrované --> SQL[Azure SQL Database<br/>Tabulka produktů<br/>Ukázková data]
```

**Nasazení zdrojů:**
- **Resource Group**: Kontejner pro všechny zdroje
- **App Service Plan**: Hosting založený na Linuxu (B1 úroveň pro úsporu nákladů)
- **Web App**: Runtime Python 3.11 s aplikací Flask
- **SQL Server**: Řízený databázový server s minimem TLS 1.2
- **SQL Database**: Základní úroveň (2GB, vhodné pro vývoj/testování)
- **Application Insights**: Monitoring a protokolování
- **Log Analytics Workspace**: Centralizované úložiště logů

**Analogie**: Představte si to jako restauraci (web app) s mrazákem (database). Zákazníci objednávají z menu (API endpoints) a kuchyně (Flask aplikace) vytahuje ingredience (data) z mrazáku. Manažer restaurace (Application Insights) sleduje vše, co se děje.

## Struktura složek

Všechny soubory jsou součástí tohoto příkladu — žádné externí závislosti nejsou potřeba:

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
- **azure.yaml**: Říká AZD, co a kam nasadit
- **infra/main.bicep**: Orchestrace všech zdrojů Azure
- **infra/resources/*.bicep**: Definice jednotlivých zdrojů (modulární pro opětovné použití)
- **src/web/app.py**: Flask aplikace s logikou databáze
- **requirements.txt**: Závislosti Python balíčků
- **Dockerfile**: Instrukce pro kontejnerizaci při nasazení

## Rychlý start (krok za krokem)

### Krok 1: Klonovat a přejít do adresáře

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kontrola úspěchu**: Ověřte, že vidíte `azure.yaml` a složku `infra/`:
```sh
ls
# Očekává se: README.md, azure.yaml, infra/, src/
```

### Krok 2: Autentizace v Azure

```sh
azd auth login
```

Tím se otevře váš prohlížeč pro autentizaci do Azure. Přihlaste se svými přihlašovacími údaji Azure.

**✓ Kontrola úspěchu**: Měli byste vidět:
```
Logged in to Azure.
```

### Krok 3: Inicializace prostředí

```sh
azd init
```

**Co se stane**: AZD vytvoří místní konfiguraci pro vaše nasazení.

**Výzvy, které uvidíte**:
- **Název prostředí**: Zadejte krátký název (např. `dev`, `myapp`)
- **Azure subscription**: Vyberte své předplatné ze seznamu
- **Azure location**: Zvolte region (např. `eastus`, `westeurope`)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: New project initialized!
```

### Krok 4: Zprovoznění zdrojů v Azure

```sh
azd provision
```

**Co se stane**: AZD nasadí veškerou infrastrukturu (trvá 5–8 minut):
1. Vytvoří resource group
2. Vytvoří SQL Server a databázi
3. Vytvoří App Service Plan
4. Vytvoří Web App
5. Vytvoří Application Insights
6. Nakonfiguruje síťování a zabezpečení

**Budete požádáni o**:
- **Uživatelské jméno administrátora SQL**: Zadejte uživatelské jméno (např. `sqladmin`)
- **Heslo administrátora SQL**: Zadejte silné heslo (uložte si ho!)

**✓ Kontrola úspěchu**: Měli byste vidět:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Čas**: 5–8 minut

### Krok 5: Nasazení aplikace

```sh
azd deploy
```

**Co se stane**: AZD sestaví a nasadí vaši Flask aplikaci:
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

**⏱️ Čas**: 3–5 minut

### Krok 6: Prohlédnout aplikaci v prohlížeči

```sh
azd browse
```

Tím se otevře vaše nasazená webová aplikace v prohlížeči na adrese `https://app-<unique-id>.azurewebsites.net`

**✓ Kontrola úspěchu**: Měli byste vidět výstup ve formátu JSON:
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

### Krok 7: Otestovat API koncové body

**Kontrola stavu** (ověřte připojení k databázi):
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

**✓ Kontrola úspěchu**: Všechny koncové body vrací data ve formátu JSON bez chyb.

---

**🎉 Gratulujeme!** Úspěšně jste nasadili webovou aplikaci s databází do Azure pomocí AZD.

## Podrobný rozbor konfigurace

### Proměnné prostředí

Tajné údaje jsou spravovány bezpečně prostřednictvím konfigurace Azure App Service — **nikdy je nezapisujte přímo do zdrojového kódu**.

**Automaticky nakonfigurováno AZD**:
- `SQL_CONNECTION_STRING`: Připojení k databázi s zašifrovanými přihlašovacími údaji
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrický koncový bod monitorování
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Umožňuje automatickou instalaci závislostí

**Kde jsou tajné údaje uloženy**:
1. Během `azd provision` zadáte SQL přihlašovací údaje prostřednictvím zabezpečených výzev
2. AZD je uloží do místního souboru `.azure/<env-name>/.env` (ignorován Gitem)
3. AZD je vloží do konfigurace Azure App Service (zašifrováno v klidu)
4. Aplikace je načítá přes `os.getenv()` za běhu

### Lokální vývoj

Pro lokální testování vytvořte soubor `.env` ze vzoru:

```sh
cp .env.sample .env
# Upravte soubor .env s připojením k lokální databázi
```

**Pracovní postup pro lokální vývoj**:
```sh
# Nainstalujte závislosti
cd src/web
pip install -r requirements.txt

# Nastavte proměnné prostředí
export SQL_CONNECTION_STRING="your-local-connection-string"

# Spusťte aplikaci
python app.py
```

**Otestovat lokálně**:
```sh
curl http://localhost:8000/health
# Očekává se: {"status": "healthy", "database": "connected"}
```

### Infrastruktura jako kód

Všechny zdroje Azure jsou definovány v **Bicep šablonách** (adresář `infra/`):

- **Modulární design**: Každý typ zdroje má svůj vlastní soubor pro opětovné použití
- **Parametrizované**: Upravte SKUs, regiony, konvence pojmenování
- **Doporučené postupy**: Dodržuje standardy pojmenování Azure a výchozí bezpečnostní nastavení
- **Verzované**: Změny infrastruktury jsou sledovány v Gitu

**Příklad přizpůsobení**:
Pro změnu úrovně databáze upravte `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Bezpečnostní doporučené postupy

Tento příklad sleduje bezpečnostní doporučené postupy Azure:

### 1. **Žádná tajemství ve zdrojovém kódu**
- ✅ Přihlašovací údaje uloženy v konfiguraci Azure App Service (zašifrovány)
- ✅ Soubory `.env` vyloučeny z Gitu pomocí `.gitignore`
- ✅ Tajné údaje předávány přes zabezpečené parametry během provisioning

### 2. **Šifrovaná připojení**
- ✅ TLS 1.2 jako minimum pro SQL Server
- ✅ Pro Web App vynuceno pouze HTTPS
- ✅ Připojení k databázi používají šifrované kanály

### 3. **Síťová bezpečnost**
- ✅ Firewall SQL Serveru nakonfigurován tak, aby povoloval pouze služby Azure
- ✅ Veřejný přístup k síti omezen (lze dále zúžit pomocí privátních koncových bodů)
- ✅ FTPS zakázán na Web App

### 4. **Autentizace a autorizace**
- ⚠️ **Aktuálně**: SQL autentizace (uživatel/heslo)
- ✅ **Doporučení pro produkci**: Použijte Azure Managed Identity pro autentizaci bez hesla

**Pro přechod na Managed Identity** (pro produkci):
1. Povolit managed identity na Web App
2. Udělit identitě oprávnění k SQL
3. Aktualizovat connection string pro použití managed identity
4. Odebrat autentizaci založenou na hesle

### 5. **Auditování a shoda**
- ✅ Application Insights zaznamenává všechny požadavky a chyby
- ✅ Auditování SQL databáze povoleno (lze konfigurovat pro dodržování předpisů)
- ✅ Všechny zdroje označeny štítky pro správu

**Kontrolní seznam bezpečnosti před uvedením do produkce**:
- [ ] Povolte Azure Defender pro SQL
- [ ] Nakonfigurujte privátní koncové body pro SQL Database
- [ ] Povolte Web Application Firewall (WAF)
- [ ] Implementujte Azure Key Vault pro rotaci tajemství
- [ ] Nakonfigurujte autentizaci Microsoft Entra ID
- [ ] Povolte diagnostické protokolování pro všechny zdroje

## Optimalizace nákladů

**Odhadované měsíční náklady** (k listopadu 2025):

| Zdroj | SKU/Úroveň | Odhadované náklady |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/měsíc |
| SQL Database | Basic (2GB) | ~$5/měsíc |
| Application Insights | Pay-as-you-go | ~$2/měsíc (nízká zátěž) |
| **Celkem** | | **~$20/měsíc** |

**💡 Tipy pro úsporu nákladů**:

1. **Použijte bezplatnou úroveň pro vzdělávání**:
   - App Service: úroveň F1 (zdarma, omezené hodiny)
   - SQL Database: Použijte Azure SQL Database serverless
   - Application Insights: 5 GB/měsíc bezplatného příjmu dat

2. **Zastavujte zdroje, když nejsou používány**:
   ```sh
   # Zastavte webovou aplikaci (za databázi se stále účtuje poplatek)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Restartujte podle potřeby
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Odstraňte vše po testování**:
   ```sh
   azd down
   ```
   Tím odstraníte VŠECHNY zdroje a zastavíte účtování poplatků.

4. **Vývojové vs. produkční SKUs**:
   - **Vývoj**: Základní úroveň (použito v tomto příkladu)
   - **Produkce**: Standard/Premium úroveň s redundancí

**Sledování nákladů**:
- Zobrazte náklady v [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Nastavte upozornění na náklady, abyste se vyhnuli nepříjemným překvapením
- Označte všechny zdroje štítkem `azd-env-name` pro sledování

**Alternativa s bezplatnou úrovní**:
Pro účely výuky můžete upravit `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Poznámka**: Volná úroveň má omezení (60 min/den CPU, bez always-on).

## Monitoring a pozorovatelnost

### Integrace Application Insights

Tento příklad zahrnuje **Application Insights** pro komplexní monitoring:

**Co se monitoruje**:
- ✅ HTTP požadavky (latence, stavové kódy, koncové body)
- ✅ Chyby a výjimky aplikace
- ✅ Vlastní logování z Flask aplikace
- ✅ Stav připojení k databázi
- ✅ Výkonové metriky (CPU, paměť)

**Přístup k Application Insights**:
1. Otevřete [Azure Portal](https://portal.azure.com)
2. Přejděte do vaší skupiny prostředků (`rg-<env-name>`)
3. Klikněte na prostředek Application Insights (`appi-<unique-id>`)

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

### Auditování SQL databáze

**Auditování SQL databáze je povoleno** pro sledování:
- Vzorů přístupu k databázi
- Neúspěšných pokusů o přihlášení
- Změn schématu
- Přístupu k datům (pro shodu)

**Přístup k auditním logům**:
1. Azure Portal → SQL Database → Auditing
2. Prohlédněte si logy v Log Analytics workspace

### Monitorování v reálném čase

**Zobrazit živé metriky**:
1. Application Insights → Live Metrics
2. Zobrazte požadavky, selhání a výkon v reálném čase

**Nastavení upozornění**:
Vytvořte upozornění pro kritické události:
- HTTP 500 chyby > 5 za 5 minut
- Selhání připojení k databázi
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
### Běžné problémy a řešení

#### 1. `azd provision` selže s "Location not available"

**Příznak**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Řešení**:
Vyberte jinou oblast Azure nebo zaregistrujte poskytovatele prostředků:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Selhání připojení k SQL během nasazení

**Příznak**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Řešení**:
- Ověřte, že firewall SQL Serveru povoluje služby Azure (automaticky nakonfigurováno)
- Zkontrolujte, že byl během `azd provision` správně zadán administrační SQL heslo
- Ujistěte se, že SQL Server je plně vytvořen (může to trvat 2-3 minuty)

**Ověření připojení**:
```sh
# V Azure portálu přejděte do Databáze SQL → Editor dotazů
# Zkuste se připojit pomocí svých přihlašovacích údajů
```

#### 3. Webová aplikace zobrazuje "Application Error"

**Příznak**:
Prohlížeč zobrazuje obecnou chybovou stránku.

**Řešení**:
Zkontrolujte záznamy aplikace:
```sh
# Zobrazit nedávné záznamy
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Běžné příčiny**:
- Chybějící proměnné prostředí (zkontrolujte App Service → Konfigurace)
- Instalace Python balíčků selhala (zkontrolujte nasazovací protokoly)
- Chyba inicializace databáze (zkontrolujte připojení k SQL)

#### 4. `azd deploy` selže s "Build Error"

**Příznak**:
```
Error: Failed to build project
```

**Řešení**:
- Ujistěte se, že `requirements.txt` nemá syntaktické chyby
- Zkontrolujte, že je v `infra/resources/web-app.bicep` specifikován Python 3.11
- Ověřte, že Dockerfile používá správný základní image

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
# Požadováno pro pracovní postupy AZD
azd auth login

# Volitelné, pokud také používáte příkazy Azure CLI přímo
az login
```

Ověřte, že máte správná oprávnění (role Přispěvatel) v předplatném.

#### 6. Vysoké náklady na databázi

**Příznak**:
Neočekávaný účet za Azure.

**Řešení**:
- Zkontrolujte, zda jste po testování nezapomněli spustit `azd down`
- Ověřte, že SQL Database používá Basic úroveň (ne Premium)
- Prohlédněte náklady v Azure Cost Management
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

**Přístup k protokolům aplikace**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potřebujete více pomoci?**
- [AZD Troubleshooting Guide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktická cvičení

### Cvičení 1: Ověřte své nasazení (Začátečník)

**Cíl**: Potvrďte, že jsou nasazeny všechny prostředky a aplikace funguje.

**Kroky**:
1. Vypište všechny prostředky ve vaší resource group:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Očekává se**: 6-7 prostředků (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Otestujte všechny API koncové body:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Očekává se**: Vše vrací platný JSON bez chyb

3. Zkontrolujte Application Insights:
   - Přejděte do Application Insights v Azure Portalu
   - Přejděte do "Live Metrics"
   - Aktualizujte prohlížeč na webové aplikaci
   **Očekává se**: V reálném čase se zobrazují příchozí požadavky

**Kritéria úspěchu**: Všechny 6-7 prostředky existují, všechny koncové body vrací data, Live Metrics ukazuje aktivitu.

---

### Cvičení 2: Přidání nového API koncového bodu (Středně pokročilé)

**Cíl**: Rozšířit Flask aplikaci o nový koncový bod.

**Výchozí kód**: Aktuální koncové body v `src/web/app.py`

**Kroky**:
1. Upravte `src/web/app.py` a přidejte nový koncový bod za funkcí `get_product()`:
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

2. Nasadte aktualizovanou aplikaci:
   ```sh
   azd deploy
   ```

3. Otestujte nový koncový bod:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očekává se**: Vrací produkty odpovídající "laptop"

**Kritéria úspěchu**: Nový koncový bod funguje, vrací filtrované výsledky, zobrazuje se v záznamech Application Insights.

---

### Cvičení 3: Přidat monitorování a upozornění (Pokročilé)

**Cíl**: Nastavit proaktivní monitorování s upozorněními.

**Kroky**:
1. Vytvořte upozornění pro chyby HTTP 500:
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

2. Vyvolejte upozornění způsobením chyb:
   ```sh
   # Požádejte o neexistující produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Zkontrolujte, zda se upozornění spustilo:
   - Azure Portal → Upozornění → Pravidla upozornění
   - Zkontrolujte svůj e-mail (pokud je nakonfigurován)

**Kritéria úspěchu**: Pravidlo upozornění je vytvořeno, spouští se při chybách, přijímáte oznámení.

---

### Cvičení 4: Změny schématu databáze (Pokročilé)

**Cíl**: Přidat novou tabulku a upravit aplikaci, aby ji používala.

**Kroky**:
1. Připojte se k SQL Database přes Query Editor v Azure Portalu

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

3. Aktualizujte `src/web/app.py`, aby odpovědi obsahovaly informace o kategorii

4. Nasadte a otestujte

**Kritéria úspěchu**: Nová tabulka existuje, produkty zobrazují informace o kategorii, aplikace stále funguje.

---

### Cvičení 5: Implementace cache (Expert)

**Cíl**: Přidat Azure Redis Cache pro zlepšení výkonu.

**Kroky**:
1. Přidejte Redis Cache do `infra/main.bicep`
2. Aktualizujte `src/web/app.py` pro ukládání dotazů produktů do cache
3. Změřte zlepšení výkonu pomocí Application Insights
4. Porovnejte doby odezvy před a po cacheování

**Kritéria úspěchu**: Redis je nasazen, cache funguje, doba odezvy se zlepší o více než 50%.

**Tip**: Začněte s [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Úklid

Aby se předešlo průběžným poplatkům, po dokončení smažte všechny prostředky:

```sh
azd down
```

**Potvrzovací výzva**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Zadejte `y` pro potvrzení.

**✓ Kontrola úspěchu**: 
- Všechny prostředky jsou smazány v Azure Portalu
- Žádné průběžné poplatky
- Lokální složka `.azure/<env-name>` může být smazána

**Alternativa** (ponechat infrastrukturu, smazat data):
```sh
# Odstraňte pouze skupinu prostředků (ponechte konfiguraci AZD)
az group delete --name rg-<env-name> --yes
```
## Další informace

### Související dokumentace
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Další kroky v tomto kurzu
- **[Container Apps Example](../../../../examples/container-app)**: Nasazení mikroservis s Azure Container Apps
- **[Průvodce integrací AI](../../../../docs/ai-foundry)**: Přidání schopností AI do vaší aplikace
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Vzory nasazení do produkce

### Pokročilá témata
- **Managed Identity**: Odstraňte hesla a použijte autentizaci Microsoft Entra ID
- **Private Endpoints**: Zabezpečte připojení k databázi v rámci virtuální sítě
- **CI/CD Integration**: Automatizujte nasazení pomocí GitHub Actions nebo Azure DevOps
- **Multi-Environment**: Nastavte vývojové, staging a produkční prostředí
- **Database Migrations**: Použijte Alembic nebo Entity Framework pro verzování schématu

### Srovnání s jinými přístupy

**AZD vs. ARM Templates**:
- ✅ AZD: Vyšší úroveň abstrakce, jednodušší příkazy
- ⚠️ ARM: Více podrobný, větší granularity kontroly

**AZD vs. Terraform**:
- ✅ AZD: Nativní pro Azure, integrováno se službami Azure
- ⚠️ Terraform: Podpora multi-cloud, rozsáhlejší ekosystém

**AZD vs. Azure Portal**:
- ✅ AZD: Opakovatelné, verzované, automatizovatelné
- ⚠️ Portal: Manuální klikání, obtížné reprodukovat

Považujte AZD za: Docker Compose pro Azure — zjednodušená konfigurace pro složitá nasazení.

---

## Často kladené dotazy

**Q: Můžu použít jiný programovací jazyk?**  
A: Ano! Nahraďte `src/web/` Node.js, C#, Go nebo jakýmkoli jiným jazykem. Podle toho aktualizujte `azure.yaml` a Bicep.

**Q: Jak přidám více databází?**  
A: Přidejte další modul SQL Database v `infra/main.bicep` nebo použijte PostgreSQL/MySQL ze služeb Azure Database.

**Q: Můžu to použít do produkce?**  
A: Toto je výchozí bod. Pro produkci přidejte: managed identity, private endpoints, redundanci, strategii zálohování, WAF a rozšířené monitorování.

**Q: Co když chci místo nasazení kódu používat kontejnery?**  
A: Podívejte se na [Container Apps Example](../../../../examples/container-app), který používá Docker kontejnery.

**Q: Jak se připojím k databázi z mého lokálního počítače?**  
A: Přidejte svou IP do firewallu SQL Serveru:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Můžu použít existující databázi místo vytvoření nové?**  
A: Ano, upravte `infra/main.bicep` tak, aby odkazoval na existující SQL Server, a aktualizujte parametry connection stringu.

---

> **Poznámka:** Tento příklad demonstruje osvědčené postupy pro nasazení webové aplikace s databází pomocí AZD. Obsahuje funkční kód, rozsáhlou dokumentaci a praktická cvičení pro upevnění znalostí. Pro nasazení do produkce zkontrolujte požadavky na bezpečnost, škálování, shodu a náklady specifické pro vaši organizaci.

**📚 Navigace kurzu:**
- ← Předchozí: [Příklad Container Apps](../../../../examples/container-app)
- → Další: [Průvodce integrací AI](../../../../docs/ai-foundry)
- 🏠 [Domov kurzu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->