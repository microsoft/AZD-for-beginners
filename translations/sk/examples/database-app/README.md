# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Estimated Time**: 20-30 minutes | 💰 **Estimated Cost**: ~$15-25/month | ⭐ **Complexity**: Intermediate

This **complete, working example** demonstrates how to use the [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) to deploy a Python Flask web application with a Microsoft SQL Database to Azure. All code is included and tested—no external dependencies required.

## What You'll Learn

By completing this example, you will:
- Deploy a multi-tier application (web app + database) using infrastructure-as-code
- Configure secure database connections without hardcoding secrets
- Monitor application health with Application Insights
- Manage Azure resources efficiently with AZD CLI
- Follow Azure best practices for security, cost optimization, and observability

## Scenario Overview
- **Web App**: Python Flask REST API with database connectivity
- **Database**: Azure SQL Database with sample data
- **Infrastructure**: Provisioned using Bicep (modular, reusable templates)
- **Deployment**: Fully automated with `azd` commands
- **Monitoring**: Application Insights for logs and telemetry

## Prerequisites

### Required Tools

Before starting, verify you have these tools installed:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```sh
   az --version
   # Očakávaný výstup: azure-cli 2.50.0 alebo vyššia
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```sh
   azd version
   # Očakávaný výstup: azd verzia 1.0.0 alebo novšia
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (for local development)
   ```sh
   python --version
   # Očakávaný výstup: Python 3.8 alebo vyšší
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, for local containerized development)
   ```sh
   docker --version
   # Očakávaný výstup: Docker verzia 20.10 alebo novšia
   ```

### Azure Requirements

- An active **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Permissions to create resources in your subscription
- **Owner** or **Contributor** role on the subscription or resource group

### Knowledge Prerequisites

This is an **intermediate-level** example. You should be familiar with:
- Basic command-line operations
- Fundamental cloud concepts (resources, resource groups)
- Basic understanding of web applications and databases

**New to AZD?** Start with the [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) first.

## Architecture

This example deploys a two-tier architecture with a web application and SQL database:

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

**Resource Deployment:**
- **Resource Group**: Container for all resources
- **App Service Plan**: Linux-based hosting (B1 tier for cost efficiency)
- **Web App**: Python 3.11 runtime with Flask application
- **SQL Server**: Managed database server with TLS 1.2 minimum
- **SQL Database**: Basic tier (2GB, suitable for development/testing)
- **Application Insights**: Monitoring and logging
- **Log Analytics Workspace**: Centralized log storage

**Analogy**: Think of this like a restaurant (web app) with a walk-in freezer (database). Customers order from the menu (API endpoints), and the kitchen (Flask app) retrieves ingredients (data) from the freezer. The restaurant manager (Application Insights) tracks everything that happens.

## Folder Structure

All files are included in this example—no external dependencies required:

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

**What Each File Does:**
- **azure.yaml**: Tells AZD what to deploy and where
- **infra/main.bicep**: Orchestrates all Azure resources
- **infra/resources/*.bicep**: Individual resource definitions (modular for reuse)
- **src/web/app.py**: Flask application with database logic
- **requirements.txt**: Python package dependencies
- **Dockerfile**: Containerization instructions for deployment

## Quickstart (Step-by-Step)

### Step 1: Clone and Navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Success Check**: Verify you see `azure.yaml` and `infra/` folder:
```sh
ls
# Očakávané: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate with Azure

```sh
azd auth login
```

This opens your browser for Azure authentication. Sign in with your Azure credentials.

**✓ Success Check**: You should see:
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```sh
azd init
```

**What happens**: AZD creates a local configuration for your deployment.

**Prompts you'll see**:
- **Environment name**: Enter a short name (e.g., `dev`, `myapp`)
- **Azure subscription**: Select your subscription from the list
- **Azure location**: Choose a region (e.g., `eastus`, `westeurope`)

**✓ Success Check**: You should see:
```
SUCCESS: New project initialized!
```

### Step 4: Provision Azure Resources

```sh
azd provision
```

**What happens**: AZD deploys all infrastructure (takes 5-8 minutes):
1. Creates resource group
2. Creates SQL Server and Database
3. Creates App Service Plan
4. Creates Web App
5. Creates Application Insights
6. Configures networking and security

**You'll be prompted for**:
- **SQL admin username**: Enter a username (e.g., `sqladmin`)
- **SQL admin password**: Enter a strong password (save this!)

**✓ Success Check**: You should see:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Time**: 5-8 minutes

### Step 5: Deploy the Application

```sh
azd deploy
```

**What happens**: AZD builds and deploys your Flask application:
1. Packages the Python application
2. Builds the Docker container
3. Pushes to Azure Web App
4. Initializes the database with sample data
5. Starts the application

**✓ Success Check**: You should see:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Time**: 3-5 minutes

### Step 6: Browse the Application

```sh
azd browse
```

This opens your deployed web app in the browser at `https://app-<unique-id>.azurewebsites.net`

**✓ Success Check**: You should see JSON output:
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

### Step 7: Test the API Endpoints

**Health Check** (verify database connection):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Expected Response**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**List Products** (sample data):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Expected Response**:
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

**Get Single Product**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Success Check**: All endpoints return JSON data without errors.

---

**🎉 Congratulations!** You've successfully deployed a web application with a database to Azure using AZD.

## Configuration Deep-Dive

### Environment Variables

Secrets are managed securely via Azure App Service configuration—**never hardcoded in source code**.

**Configured Automatically by AZD**:
- `SQL_CONNECTION_STRING`: Database connection with encrypted credentials
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Enables automatic dependency installation

**Where Secrets Are Stored**:
1. During `azd provision`, you provide SQL credentials via secure prompts
2. AZD stores these in your local `.azure/<env-name>/.env` file (git-ignored)
3. AZD injects them into Azure App Service configuration (encrypted at rest)
4. Application reads them via `os.getenv()` at runtime

### Local Development

For local testing, create a `.env` file from the sample:

```sh
cp .env.sample .env
# Upravte súbor .env s pripojením na lokálnu databázu
```

**Local Development Workflow**:
```sh
# Nainštalovať závislosti
cd src/web
pip install -r requirements.txt

# Nastaviť premenné prostredia
export SQL_CONNECTION_STRING="your-local-connection-string"

# Spustiť aplikáciu
python app.py
```

**Test locally**:
```sh
curl http://localhost:8000/health
# Očakávané: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

All Azure resources are defined in **Bicep templates** (`infra/` folder):

- **Modular Design**: Each resource type has its own file for reusability
- **Parameterized**: Customize SKUs, regions, naming conventions
- **Best Practices**: Follows Azure naming standards and security defaults
- **Version Controlled**: Infrastructure changes are tracked in Git

**Customization Example**:
To change the database tier, edit `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Security Best Practices

This example follows Azure security best practices:

### 1. **No Secrets in Source Code**
- ✅ Credentials stored in Azure App Service configuration (encrypted)
- ✅ `.env` files excluded from Git via `.gitignore`
- ✅ Secrets passed via secure parameters during provisioning

### 2. **Encrypted Connections**
- ✅ TLS 1.2 minimum for SQL Server
- ✅ HTTPS-only enforced for Web App
- ✅ Database connections use encrypted channels

### 3. **Network Security**
- ✅ SQL Server firewall configured to allow Azure services only
- ✅ Public network access restricted (can be further locked down with Private Endpoints)
- ✅ FTPS disabled on Web App

### 4. **Authentication & Authorization**
- ⚠️ **Current**: SQL authentication (username/password)
- ✅ **Production Recommendation**: Use Azure Managed Identity for passwordless authentication

**To Upgrade to Managed Identity** (for production):
1. Enable managed identity on Web App
2. Grant identity SQL permissions
3. Update connection string to use managed identity
4. Remove password-based authentication

### 5. **Auditing & Compliance**
- ✅ Application Insights logs all requests and errors
- ✅ SQL Database auditing enabled (can be configured for compliance)
- ✅ All resources tagged for governance

**Security Checklist Before Production**:
- [ ] Enable Azure Defender for SQL
- [ ] Configure Private Endpoints for SQL Database
- [ ] Enable Web Application Firewall (WAF)
- [ ] Implement Azure Key Vault for secret rotation
- [ ] Configure Azure AD authentication
- [ ] Enable diagnostic logging for all resources

## Cost Optimization

**Estimated Monthly Costs** (as of November 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Cost-Saving Tips**:

1. **Use Free Tier for Learning**:
   - App Service: F1 tier (free, limited hours)
   - SQL Database: Use Azure SQL Database serverless
   - Application Insights: 5GB/month free ingestion

2. **Stop Resources When Not in Use**:
   ```sh
   # Zastaviť webovú aplikáciu (za databázu sa stále platí)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reštartovať podľa potreby
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Delete Everything After Testing**:
   ```sh
   azd down
   ```
   This removes ALL resources and stops charges.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (used in this example)
   - **Production**: Standard/Premium tier with redundancy

**Cost Monitoring**:
- View costs in [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Set up cost alerts to avoid surprises
- Tag all resources with `azd-env-name` for tracking

**Free Tier Alternative**:
For learning purposes, you can modify `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Note**: Free tier has limitations (60 min/day CPU, no always-on).

## Monitoring & Observability

### Application Insights Integration

This example includes **Application Insights** for comprehensive monitoring:

**What's Monitored**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ Application errors and exceptions
- ✅ Custom logging from Flask app
- ✅ Database connection health
- ✅ Performance metrics (CPU, memory)

**Access Application Insights**:
1. Open [Azure Portal](https://portal.azure.com)
2. Navigate to your resource group (`rg-<env-name>`)
3. Click on Application Insights resource (`appi-<unique-id>`)

**Useful Queries** (Application Insights → Logs):

**View All Requests**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Find Errors**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Check Health Endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database Auditing

**SQL Database auditing is enabled** to track:
- Database access patterns
- Failed login attempts
- Schema changes
- Data access (for compliance)

**Access Audit Logs**:
1. Azure Portal → SQL Database → Auditing
2. View logs in Log Analytics workspace

### Real-Time Monitoring

**View Live Metrics**:
1. Application Insights → Live Metrics
2. See requests, failures, and performance in real-time

**Set Up Alerts**:
Create alerts for critical events:
- HTTP 500 errors > 5 in 5 minutes
- Database connection failures
- Vysoké doby odpovede (>2 sekundy)

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

#### 1. `azd provision` zlyhá s "Location not available"

**Príznak**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Riešenie**:
Vyberte iný Azure región alebo zaregistrujte poskytovateľa prostriedkov:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Zlyhanie pripojenia k SQL počas nasadenia

**Príznak**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Riešenie**:
- Overte, či firewall SQL Servera povoľuje služby Azure (automaticky nakonfigurované)
- Skontrolujte, či bol administračný SQL password zadaný správne počas `azd provision`
- Uistite sa, že SQL Server je úplne provisionovaný (môže to trvať 2–3 minúty)

**Overenie pripojenia**:
```sh
# V Azure portáli prejdite na SQL Database → Query editor
# Skúste sa pripojiť pomocou svojich prihlasovacích údajov
```

#### 3. Webová aplikácia zobrazuje "Application Error"

**Príznak**:
Prehliadač zobrazuje všeobecnú chybovú stránku.

**Riešenie**:
Skontrolujte logy aplikácie:
```sh
# Zobraziť nedávne záznamy
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Bežné príčiny**:
- Chýbajúce premenné prostredia (skontrolujte App Service → Configuration)
- Inštalácia Python balíčkov zlyhala (skontrolujte nasadzovacie logy)
- Chyba inicializácie databázy (skontrolujte konektivitu k SQL)

#### 4. `azd deploy` zlyhá s "Build Error"

**Príznak**:
```
Error: Failed to build project
```

**Riešenie**:
- Uistite sa, že `requirements.txt` nemá syntaktické chyby
- Skontrolujte, že je v `infra/resources/web-app.bicep` uvedený Python 3.11
- Overte, že Dockerfile má správny základný image

**Ladenie lokálne**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" pri spúšťaní AZD príkazov

**Príznak**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Riešenie**:
Znovu sa autentifikujte v Azure:
```sh
azd auth login
az login
```

Overte, či máte správne povolenia (rolu Contributor) na subscription.

#### 6. Vysoké náklady na databázu

**Príznak**:
Neočekávaný účet za Azure.

**Riešenie**:
- Skontrolujte, či ste po testovaní nezabudli spustiť `azd down`
- Overte, že SQL Database používa Basic tier (nie Premium)
- Skontrolujte náklady v Azure Cost Management
- Nastavte upozornenia na náklady

### Získanie pomoci

**Zobraziť všetky AZD premenné prostredia**:
```sh
azd env get-values
```

**Skontrolovať stav nasadenia**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Prístup k logom aplikácie**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Potrebujete viac pomoci?**
- [AZD Troubleshooting Guide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktické cvičenia

### Cvičenie 1: Overte svoje nasadenie (Začiatočník)

**Cieľ**: Potvrdiť, že všetky prostriedky sú nasadené a aplikácia funguje.

**Kroky**:
1. Vylistujte všetky prostriedky v resource group:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Očakávané**: 6-7 prostriedkov (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Otestujte všetky API endpointy:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Očakávané**: Všetky vracajú platné JSON bez chýb

3. Skontrolujte Application Insights:
   - Prejdite na Application Insights v Azure Porte
   - Choďte do "Live Metrics"
   - Obnovte stránku vo webovej aplikácii
   **Očakávané**: V reálnom čase vidieť prichádzajúce požiadavky

**Kritériá úspechu**: Všetkých 6-7 prostriedkov existuje, všetky endpointy vracajú dáta, Live Metrics zobrazuje aktivitu.

---

### Cvičenie 2: Pridať nový API endpoint (Stredne pokročilý)

**Cieľ**: Rozšíriť Flask aplikáciu o nový endpoint.

**Štartovací kód**: Aktuálne endpointy v `src/web/app.py`

**Kroky**:
1. Upravte `src/web/app.py` a pridajte nový endpoint za funkciou `get_product()`:
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

2. Nasadte aktualizovanú aplikáciu:
   ```sh
   azd deploy
   ```

3. Otestujte nový endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Očakávané**: Vracia produkty zodpovedajúce "laptop"

**Kritériá úspechu**: Nový endpoint funguje, vracia filtrované výsledky, objaví sa v logoch Application Insights.

---

### Cvičenie 3: Pridať monitorovanie a upozornenia (Pokročilý)

**Cieľ**: Nastaviť proaktívne monitorovanie s upozorneniami.

**Kroky**:
1. Vytvorte upozornenie na HTTP 500 chyby:
   ```sh
   # Získať ID prostriedku Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Vytvoriť upozornenie
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Spustite upozornenie vyvolaním chýb:
   ```sh
   # Požiadať o neexistujúci produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Skontrolujte, či sa upozornenie spustilo:
   - Azure Portal → Alerts → Alert Rules
   - Skontrolujte svoj e-mail (ak nakonfigurované)

**Kritériá úspechu**: Pravidlo upozornenia je vytvorené, spúšťa sa pri chybách, prijímajú sa notifikácie.

---

### Cvičenie 4: Zmeny schémy databázy (Pokročilý)

**Cieľ**: Pridať novú tabuľku a upraviť aplikáciu, aby ju používala.

**Kroky**:
1. Pripojte sa k SQL Database cez Query Editor v Azure Portal

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

3. Aktualizujte `src/web/app.py` tak, aby odpovede obsahovali informácie o kategóriách

4. Nasadte a otestujte

**Kritériá úspechu**: Nová tabuľka existuje, produkty zobrazujú informácie o kategórii, aplikácia stále funguje.

---

### Cvičenie 5: Implementovať cache (Expert)

**Cieľ**: Pridať Azure Redis Cache na zlepšenie výkonu.

**Kroky**:
1. Pridajte Redis Cache do `infra/main.bicep`
2. Aktualizujte `src/web/app.py` pre cachovanie dotazov produktov
3. Zmerajte zlepšenie výkonu pomocou Application Insights
4. Porovnajte doby odozvy pred/po cachovaní

**Kritériá úspechu**: Redis je nasadený, cachovanie funguje, doby odozvy sa zlepšili o >50%.

**Tip**: Začnite s [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Upratovanie

Aby ste predišli pretrvávajúcim poplatkom, vymažte všetky prostriedky po skončení:

```sh
azd down
```

**Výzva na potvrdenie**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Zadajte `y` pre potvrdenie.

**✓ Kontrola úspechu**: 
- Všetky prostriedky sú vymazané z Azure Portalu
- Žiadne pretrvávajúce poplatky
- Lokálny priečinok `.azure/<env-name>` môže byť vymazaný

**Alternatíva** (ponechať infraštruktúru, vymazať dáta):
```sh
# Odstrániť iba skupinu prostriedkov (ponechať konfiguráciu AZD)
az group delete --name rg-<env-name> --yes
```
## Zistiť viac

### Súvisiaca dokumentácia
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Ďalšie kroky v tomto kurze
- **[Container Apps Example](../../../../examples/container-app)**: Nasadiť mikroservisy s Azure Container Apps
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Pridať AI funkcie do vašej aplikácie
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Vzory nasadenia do produkcie

### Pokročilé témy
- **Managed Identity**: Odstránenie hesiel a použitie Azure AD autentifikácie
- **Private Endpoints**: Zabezpečenie databázových pripojení v rámci virtuálnej siete
- **CI/CD Integrácia**: Automatizujte nasadenia pomocou GitHub Actions alebo Azure DevOps
- **Viac prostredí**: Nastavte dev, staging a production prostredia
- **Migrácie databázy**: Použite Alembic alebo Entity Framework pre verziovanie schémy

### Porovnanie s inými prístupmi

**AZD vs. ARM Templates**:
- ✅ AZD: Vyššia úroveň abstrakcie, jednoduchšie príkazy
- ⚠️ ARM: Verbóznejší, detailnejšia kontrola

**AZD vs. Terraform**:
- ✅ AZD: Azure-natívne, integrované so službami Azure
- ⚠️ Terraform: Podpora multi-cloud, väčšia ekosystém

**AZD vs. Azure Portal**:
- ✅ AZD: Opakovateľné, verzovateľné, automatizovateľné
- ⚠️ Portal: Manuálne kliky, ťažko reprodukovateľné

**Premýšľajte o AZD ako**: Docker Compose pre Azure — zjednodušená konfigurácia pre zložité nasadenia.

---

## Často kladené otázky

**Otázka: Môžem použiť iný programovací jazyk?**  
Odpoveď: Áno! Nahraďte `src/web/` Node.js, C#, Go alebo akýmkoľvek iným jazykom. Aktualizujte `azure.yaml` a Bicep podľa potreby.

**Otázka: Ako pridám viac databáz?**  
Odpoveď: Pridajte ďalší modul SQL Database do `infra/main.bicep` alebo použite PostgreSQL/MySQL z Azure Database služieb.

**Otázka: Môžem to použiť v produkcii?**  
Odpoveď: Toto je východiskový bod. Pre produkciu pridajte: managed identity, private endpoints, redundanciu, stratégiu zálohovania, WAF a rozšírené monitorovanie.

**Otázka: Čo ak chcem používať kontajnery namiesto nasadzovania kódu?**  
Odpoveď: Pozrite si [Container Apps Example](../../../../examples/container-app), ktorý používa Docker kontajnery.

**Otázka: Ako sa pripojím k databáze z lokálneho stroja?**  
Odpoveď: Pridajte svoju IP do firewallu SQL Servera:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Otázka: Môžem použiť existujúcu databázu namiesto vytvorenia novej?**  
Odpoveď: Áno, upravte `infra/main.bicep`, aby odkazoval na existujúci SQL Server a aktualizujte parametre connection stringu.

---

> **Poznámka:** Tento príklad demonštruje osvedčené postupy pre nasadenie webovej aplikácie s databázou pomocou AZD. Obsahuje fungujúci kód, komplexnú dokumentáciu a praktické cvičenia na upevnenie vedomostí. Pre produkčné nasadenia skontrolujte bezpečnosť, škálovanie, súlad a požiadavky na náklady špecifické pre vašu organizáciu.

**📚 Navigácia kurzu:**
- ← Predchádzajúce: [Container Apps Example](../../../../examples/container-app)
- → Ďalšie: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Domov kurzu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Upozornenie:
Tento dokument bol preložený pomocou služby strojového prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho originálnom jazyku by mal byť považovaný za rozhodujúci zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->