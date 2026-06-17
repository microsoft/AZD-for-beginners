# Deploying a Microsoft SQL Database and Web App with AZD

⏱️ **Tinatayang Oras**: 20-30 minuto | 💰 **Tinatayang Gastos**: ~$15-25/buwan | ⭐ **Kumplikado**: Intermediate

Ang **kumpleto, gumaganang halimbawa** na ito ay nagpapakita kung paano gamitin ang [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) upang i-deploy ang isang Python Flask web application na may Microsoft SQL Database sa Azure. Kasama at nasubukan ang lahat ng code—walang kinakailangang external na dependencies.

## Ano ang Matututuhan Mo

Sa pagkumpleto ng halimbawang ito, ikaw ay:
- Magde-deploy ng multi-tier na aplikasyon (web app + database) gamit ang infrastructure-as-code
- Magko-configure ng secure na koneksyon sa database nang hindi nagha-hardcode ng mga secret
- Mamomonitor ng kalusugan ng aplikasyon gamit ang Application Insights
- Pamamahalaan ang Azure resources nang mahusay gamit ang AZD CLI
- Susundin ang Azure best practices para sa seguridad, pag-optimize ng gastos, at observability

## Scenario Overview
- **Web App**: Python Flask REST API na may koneksyon sa database
- **Database**: Azure SQL Database na may sample data
- **Infrastructure**: Pinroprovide gamit ang Bicep (modular, reusable templates)
- **Deployment**: Ganap na automated gamit ang `azd` commands
- **Monitoring**: Application Insights para sa logs at telemetry

## Prerequisites

### Required Tools

Bago magsimula, tiyaking naka-install ang mga sumusunod na tools:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 o mas mataas)
   ```sh
   az --version
   # Inaasahang output: azure-cli 2.50.0 o mas mataas
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 o mas mataas)
   ```sh
   azd version
   # Inaasahang output: azd bersyon 1.0.0 o mas mataas
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (para sa lokal na development)
   ```sh
   python --version
   # Inaasahang output: Python 3.8 o mas mataas
   ```

4. **[Docker](https://www.docker.com/get-started)** (opsyonal, para sa lokal na containerized development)
   ```sh
   docker --version
   # Inaasahang resulta: Bersyon ng Docker 20.10 o mas mataas
   ```

### Azure Requirements

- Isang aktibong **Azure subscription** ([gumawa ng libreng account](https://azure.microsoft.com/free/))
- Mga permiso para lumikha ng resources sa iyong subscription
- **Owner** o **Contributor** role sa subscription o resource group

### Knowledge Prerequisites

Ito ay isang **intermediate-level** na halimbawa. Dapat kang pamilyar sa:
- Pangunahing operasyon sa command-line
- Pangunahing konsepto sa cloud (resources, resource groups)
- Pang-unawa sa web applications at databases

**Bago sa AZD?** Magsimula muna sa [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md).

## Architecture

Ang halimbawang ito ay nagde-deploy ng two-tier architecture na may web application at SQL database:

```mermaid
graph TD
    Browser[Browser ng Gumagamit] <--> WebApp[Azure Web App<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Ligtas na Koneksyon<br/>Naka-encrypt --> SQL[Azure SQL Database<br/>Talaan ng Mga Produkto<br/>Halimbawang data]
```

**Resource Deployment:**
- **Resource Group**: Lalagyan para sa lahat ng resources
- **App Service Plan**: Linux-based hosting (B1 tier para sa cost efficiency)
- **Web App**: Python 3.11 runtime na may Flask application
- **SQL Server**: Managed database server na may minimum na TLS 1.2
- **SQL Database**: Basic tier (2GB, angkop para sa development/testing)
- **Application Insights**: Monitoring at logging
- **Log Analytics Workspace**: Sentralisadong imbakan ng logs

**Analogy**: Isipin ito na parang isang restoran (web app) na may walk-in freezer (database). Ang mga customer ay umo-order mula sa menu (API endpoints), at ang kusina (Flask app) ay kumukuha ng sangkap (data) mula sa freezer. Ang manager ng restoran (Application Insights) ay minomonitor ang lahat ng nangyayari.

## Folder Structure

Kasama ang lahat ng files sa halimbawang ito—walang kinakailangang external dependencies:

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

**Ano ang Ginagawa ng Bawat File:**
- **azure.yaml**: Sinasabi ng AZD kung ano ang ide-deploy at saan
- **infra/main.bicep**: Nag-o-orchestrate ng lahat ng Azure resources
- **infra/resources/*.bicep**: Indibidwal na mga definition ng resource (modular para magamit muli)
- **src/web/app.py**: Flask application na may database logic
- **requirements.txt**: Mga Python package dependencies
- **Dockerfile**: Mga instruction para sa containerization ng deployment

## Quickstart (Step-by-Step)

### Step 1: Clone and Navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Success Check**: Tiyaking nakikita mo ang `azure.yaml` at `infra/` folder:
```sh
ls
# Inaasahan: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate with Azure

```sh
azd auth login
```

Magbubukas ito ng iyong browser para sa Azure authentication. Mag-sign in gamit ang iyong Azure credentials.

**✓ Success Check**: Dapat mong makita:
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```sh
azd init
```

**Ano ang nangyayari**: Gumagawa ang AZD ng lokal na configuration para sa iyong deployment.

**Mga prompt na makikita mo**:
- **Environment name**: Mag-enter ng maikling pangalan (e.g., `dev`, `myapp`)
- **Azure subscription**: Piliin ang iyong subscription mula sa listahan
- **Azure location**: Pumili ng rehiyon (e.g., `eastus`, `westeurope`)

**✓ Success Check**: Dapat mong makita:
```
SUCCESS: New project initialized!
```

### Step 4: Provision Azure Resources

```sh
azd provision
```

**Ano ang nangyayari**: Ina-deploy ng AZD ang lahat ng infrastructure (tumitagal ng 5-8 minuto):
1. Lumilikha ng resource group
2. Lumilikha ng SQL Server at Database
3. Lumilikha ng App Service Plan
4. Lumilikha ng Web App
5. Lumilikha ng Application Insights
6. Kinokonfigure ang networking at seguridad

**Tatanungin ka para sa**:
- **SQL admin username**: Mag-enter ng username (e.g., `sqladmin`)
- **SQL admin password**: Mag-enter ng malakas na password (i-save ito!)

**✓ Success Check**: Dapat mong makita:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Oras**: 5-8 minuto

### Step 5: Deploy the Application

```sh
azd deploy
```

**Ano ang nangyayari**: Binubuild at dine-deploy ng AZD ang iyong Flask application:
1. Pinapackage ang Python application
2. Binubuild ang Docker container
3. Pinapush sa Azure Web App
4. Ini-initialize ang database na may sample data
5. Sinisimulan ang application

**✓ Success Check**: Dapat mong makita:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Oras**: 3-5 minuto

### Step 6: Browse the Application

```sh
azd browse
```

Magbubukas ito ng iyong na-deploy na web app sa browser sa `https://app-<unique-id>.azurewebsites.net`

**✓ Success Check**: Dapat mong makita ang JSON output:
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

**Health Check** (suriin ang koneksyon sa database):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Inaasahang Tugon**:
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

**Inaasahang Tugon**:
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

**✓ Success Check**: Lahat ng endpoints ay nagbabalik ng JSON data nang walang errors.

---

**🎉 Congratulations!** Matagumpay mong na-deploy ang isang web application na may database sa Azure gamit ang AZD.

## Configuration Deep-Dive

### Environment Variables

Ang mga secret ay pinamamahalaan nang ligtas via Azure App Service configuration—**huwag kailanman i-hardcode sa source code**.

**Awtomatikong Kinokonfigure ng AZD**:
- `SQL_CONNECTION_STRING`: Database connection na may mga encrypted na kredensyal
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Nag-e-enable ng awtomatikong pag-install ng dependencies

**Saan Iniimbak ang mga Secret**:
1. Sa `azd provision`, ibibigay mo ang SQL credentials sa pamamagitan ng secure prompts
2. Iniimbak ng AZD ang mga ito sa iyong lokal na `.azure/<env-name>/.env` file (git-ignored)
3. Ini-inject ng AZD ang mga ito sa Azure App Service configuration (encrypted at rest)
4. Binabasa ng application ang mga ito via `os.getenv()` sa runtime

### Local Development

Para sa lokal na testing, gumawa ng `.env` file mula sa sample:

```sh
cp .env.sample .env
# I-edit ang .env gamit ang iyong lokal na koneksyon sa database
```

**Local Development Workflow**:
```sh
# I-install ang mga dependencies
cd src/web
pip install -r requirements.txt

# Itakda ang mga environment variable
export SQL_CONNECTION_STRING="your-local-connection-string"

# Patakbuhin ang aplikasyon
python app.py
```

**Test locally**:
```sh
curl http://localhost:8000/health
# Inaasahan: {"status": "malusog", "database": "konektado"}
```

### Infrastructure as Code

Lahat ng Azure resources ay dine-define sa **Bicep templates** (`infra/` folder):

- **Modular Design**: Bawat uri ng resource ay may sariling file para sa reusability
- **Parameterized**: i-customize ang SKUs, rehiyon, naming conventions
- **Best Practices**: Sumusunod sa Azure naming standards at security defaults
- **Version Controlled**: Ang mga pagbabago sa infrastructure ay nasusubaybayan sa Git

**Halimbawa ng Customization**:
Upang baguhin ang database tier, i-edit ang `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Security Best Practices

Sinasunod ng halimbawang ito ang Azure security best practices:

### 1. **Walang Secrets sa Source Code**
- ✅ Mga kredensyal na nakaimbak sa Azure App Service configuration (encrypted)
- ✅ `.env` files ay excluded mula sa Git via `.gitignore`
- ✅ Mga secret ay ipinapasa via secure parameters sa provisioning

### 2. **Encrypted Connections**
- ✅ TLS 1.2 minimum para sa SQL Server
- ✅ HTTPS-only na pinipilit para sa Web App
- ✅ Mga koneksyon sa database ay gumagamit ng encrypted channels

### 3. **Network Security**
- ✅ SQL Server firewall na naka-configure upang payagan lamang ang Azure services
- ✅ Public network access ay limitado (maaari pang higpitan gamit ang Private Endpoints)
- ✅ FTPS ay disabled sa Web App

### 4. **Authentication & Authorization**
- ⚠️ **Kasalukuyan**: SQL authentication (username/password)
- ✅ **Rekomendasyon para sa Production**: Gumamit ng Azure Managed Identity para sa passwordless authentication

**Para Mag-upgrade sa Managed Identity** (para sa production):
1. I-enable ang managed identity sa Web App
2. I-grant ang identity ng SQL permissions
3. I-update ang connection string para gumamit ng managed identity
4. Alisin ang password-based authentication

### 5. **Auditing & Compliance**
- ✅ Application Insights nagla-log ng lahat ng requests at errors
- ✅ SQL Database auditing enabled (maaari i-configure para sa compliance)
- ✅ Lahat ng resources ay may tags para sa governance

**Security Checklist Bago ang Production**:
- [ ] I-enable ang Azure Defender for SQL
- [ ] I-configure ang Private Endpoints para sa SQL Database
- [ ] I-enable ang Web Application Firewall (WAF)
- [ ] Ipatupad ang Azure Key Vault para sa secret rotation
- [ ] I-configure ang Microsoft Entra ID authentication
- [ ] I-enable ang diagnostic logging para sa lahat ng resources

## Cost Optimization

**Tinatayang Buwanang Gastos** (hanggang Nobyembre 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Mga Tip para Makabawas sa Gastos**:

1. **Gamitin ang Free Tier para mag-aral**:
   - App Service: F1 tier (libre, may limitadong oras)
   - SQL Database: Gumamit ng Azure SQL Database serverless
   - Application Insights: 5GB/buwan libreng ingestion

2. **Itigil ang Resources Kapag Hindi Ginagamit**:
   ```sh
   # Itigil ang web app (patuloy pa ring sinisingil ang database)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # I-restart kapag kailangan
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **I-delete Lahat Pagkatapos ng Testing**:
   ```sh
   azd down
   ```
   Tinatanggal nito ang LAHAT ng resources at pinapatigil ang mga singil.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (ginamit sa halimbawang ito)
   - **Production**: Standard/Premium tier na may redundancy

**Pagmo-monitor ng Gastos**:
- Tingnan ang mga gastos sa [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Mag-set up ng cost alerts para maiwasan ang mga sorpresa
- I-tag ang lahat ng resources gamit ang `azd-env-name` para sa tracking

**Free Tier Alternative**:
Para sa layunin ng pagkatuto, maaari mong i-modify ang `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Note**: Ang free tier ay may mga limitasyon (60 min/day CPU, walang always-on).

## Monitoring & Observability

### Application Insights Integration

Kasama sa halimbawang ito ang **Application Insights** para sa komprehensibong monitoring:

**Ano ang Minomonitor**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ Application errors at exceptions
- ✅ Custom logging mula sa Flask app
- ✅ Kalusugan ng koneksyon sa database
- ✅ Performance metrics (CPU, memory)

**Paano Buksan ang Application Insights**:
1. Buksan ang [Azure Portal](https://portal.azure.com)
2. Pumunta sa iyong resource group (`rg-<env-name>`)
3. I-click ang Application Insights resource (`appi-<unique-id>`)

**Kapaki-pakinabang na Queries** (Application Insights → Logs):

**Tingnan Lahat ng Requests**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Hanapin ang Errors**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Suriin ang Health Endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database Auditing

**Ang SQL Database auditing ay naka-enable** upang subaybayan ang:
- Mga pattern ng pag-access sa database
- Mga nabigong login attempts
- Mga pagbabago sa schema
- Pag-access ng data (para sa compliance)

**Paano Tingnan ang Audit Logs**:
1. Azure Portal → SQL Database → Auditing
2. Tingnan ang logs sa Log Analytics workspace

### Real-Time Monitoring

**Tingnan ang Live Metrics**:
1. Application Insights → Live Metrics
2. Makita ang requests, failures, at performance nang real-time

**Mag-set Up ng Alerts**:
Gumawa ng alerts para sa kritikal na mga pangyayari:
- HTTP 500 errors > 5 sa loob ng 5 minuto
- Mga pagkabigong koneksyon sa database
- Mataas na response times (>2 segundo)

**Halimbawa ng Paglikha ng Alert**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Troubleshooting
### Mga Karaniwang Isyu at Solusyon

#### 1. `azd provision` nabibigo na may "Location not available"

**Sintomas**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solusyon**:
Pumili ng ibang Azure region o irehistro ang resource provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Nabibigo ang Koneksyon sa SQL Habang Nagde-deploy

**Sintomas**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solusyon**:
- Suriin kung pinapayagan ng firewall ng SQL Server ang Azure services (na-configure nang awtomatiko)
- Suriin na naipasok nang tama ang SQL admin password habang nagpapatakbo ng `azd provision`
- Tiyaking ganap na na-provision ang SQL Server (maaaring tumagal ng 2-3 minuto)

**Beripikahin ang Koneksyon**:
```sh
# Mula sa Azure Portal, pumunta sa SQL Database → Editor ng Query
# Subukang kumonekta gamit ang iyong mga kredensyal
```

#### 3. Nagpapakita ang Web App ng "Application Error"

**Sintomas**:
Nagpapakita ang browser ng karaniwang pahina ng error.

**Solusyon**:
Suriin ang mga log ng aplikasyon:
```sh
# Tingnan ang mga kamakailang log
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Mga karaniwang sanhi**:
- Nawawalang environment variables (suriin ang App Service → Configuration)
- Nabigo ang pag-install ng Python package (suriin ang deployment logs)
- Error sa pag-initialize ng database (suriin ang SQL connectivity)

#### 4. `azd deploy` Nabibigo na may "Build Error"

**Sintomas**:
```
Error: Failed to build project
```

**Solusyon**:
- Tiyaking walang syntax error ang `requirements.txt`
- Suriin na tinukoy ang Python 3.11 sa `infra/resources/web-app.bicep`
- Tiyaking tama ang base image sa Dockerfile

**I-debug nang lokal**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" Kapag Nagpapatakbo ng mga AZD Command

**Sintomas**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solusyon**:
Muling mag-authenticate sa Azure:
```sh
# Kinakailangan para sa mga workflow ng AZD
azd auth login

# Opsyonal kung ginagamit mo rin nang direkta ang mga utos ng Azure CLI
az login
```

Tiyaking mayroon kang tamang permiso (Contributor role) sa subscription.

#### 6. Mataas na Gastos sa Database

**Sintomas**:
Hindi inaasahang singil mula sa Azure.

**Solusyon**:
- Suriin kung nakalimutan mong patakbuhin ang `azd down` pagkatapos ng testing
- Tiyaking ang SQL Database ay nasa Basic tier (hindi Premium)
- Suriin ang gastos sa Azure Cost Management
- Mag-set up ng mga alerto sa gastos

### Humingi ng Tulong

**Tingnan ang Lahat ng AZD Environment Variables**:
```sh
azd env get-values
```

**Suriin ang Katayuan ng Deployment**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**I-access ang mga Log ng Aplikasyon**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Kailangan ng Karagdagang Tulong?**
- [Gabay sa Pag-troubleshoot ng AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Pag-troubleshoot ng Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Pag-troubleshoot ng Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Mga Praktikal na Ehersisyo

### Ehersisyo 1: Beripikahin ang Iyong Deployment (Nagsisimula)

**Layunin**: Kumpirmahin na lahat ng resources ay na-deploy at gumagana ang aplikasyon.

**Mga Hakbang**:
1. I-lista ang lahat ng resources sa iyong resource group:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Inaasahan**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Subukan ang lahat ng API endpoints:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Inaasahan**: Lahat ay magbabalik ng valid JSON nang walang error

3. Suriin ang Application Insights:
   - Pumunta sa Application Insights sa Azure Portal
   - Pumunta sa "Live Metrics"
   - I-refresh ang browser sa web app
   **Inaasahan**: Makikita ang mga request na lumalabas nang real-time

**Pamantayan ng Tagumpay**: Lahat ng 6-7 resources ay umiiral, lahat ng endpoints ay nagbabalik ng data, nagpapakita ng aktibidad ang Live Metrics.

---

### Ehersisyo 2: Magdagdag ng Bagong API Endpoint (Gitnang Antas)

**Layunin**: Palawakin ang Flask application gamit ang bagong endpoint.

**Panimulang Kodigo**: Kasalukuyang endpoints sa `src/web/app.py`

**Mga Hakbang**:
1. I-edit ang `src/web/app.py` at magdagdag ng bagong endpoint pagkatapos ng function na `get_product()`:
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

2. I-deploy ang na-update na aplikasyon:
   ```sh
   azd deploy
   ```

3. Subukan ang bagong endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Inaasahan**: Nagbabalik ng mga produkto na tumutugma sa "laptop"

**Pamantayan ng Tagumpay**: Gumagana ang bagong endpoint, nagbabalik ng na-filter na mga resulta, lumalabas sa mga log ng Application Insights.

---

### Ehersisyo 3: Magdagdag ng Monitoring at Mga Alerto (Mataas na Antas)

**Layunin**: Magtakda ng proaktibong monitoring na may mga alerto.

**Mga Hakbang**:
1. Gumawa ng alerto para sa HTTP 500 errors:
   ```sh
   # Kunin ang resource ID ng Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Lumikha ng alerto
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. I-trigger ang alerto sa pamamagitan ng pagdulot ng mga error:
   ```sh
   # Humiling ng hindi umiiral na produkto
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Suriin kung na-trigger ang alerto:
   - Azure Portal → Alerts → Alert Rules
   - Suriin ang iyong email (kung naka-configure)

**Pamantayan ng Tagumpay**: Nalikha ang patakaran ng alerto, nagti-trigger sa mga error, natatanggap ang mga notification.

---

### Ehersisyo 4: Mga Pagbabago sa Schema ng Database (Mataas na Antas)

**Layunin**: Magdagdag ng bagong talahanayan at i-modify ang aplikasyon upang gamitin ito.

**Mga Hakbang**:
1. Kumonekta sa SQL Database sa pamamagitan ng Azure Portal Query Editor

2. Gumawa ng bagong `categories` table:
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

3. I-update ang `src/web/app.py` upang isama ang impormasyon ng kategorya sa mga tugon

4. I-deploy at subukan

**Pamantayan ng Tagumpay**: Umiiral ang bagong table, nagpapakita ang mga produkto ng impormasyon ng kategorya, gumagana pa rin ang aplikasyon.

---

### Ehersisyo 5: Ipatupad ang Caching (Eksperto)

**Layunin**: Magdagdag ng Azure Redis Cache para mapabuti ang pagganap.

**Mga Hakbang**:
1. Idagdag ang Redis Cache sa `infra/main.bicep`
2. I-update ang `src/web/app.py` upang i-cache ang mga query ng produkto
3. Sukatin ang pagbuti ng performance gamit ang Application Insights
4. Ihambing ang oras ng tugon bago/pagkatapos ng caching

**Pamantayan ng Tagumpay**: Na-deploy ang Redis, gumagana ang caching, bumuti ang oras ng tugon ng >50%.

**Pahiwatig**: Magsimula sa [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Paglilinis

Upang maiwasan ang patuloy na singil, i-delete ang lahat ng resources kapag tapos na:

```sh
azd down
```

**Prompt ng Kumpirmasyon**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

I-type ang `y` upang kumpirmahin.

**✓ Pag-check ng Tagumpay**: 
- Lahat ng resources ay natanggal mula sa Azure Portal
- Walang patuloy na singil
- Maaaring i-delete ang lokal na folder na `.azure/<env-name>`

**Alternatibo** (panatilihin ang infrastructure, burahin ang data):
```sh
# Tanggalin lamang ang resource group (panatilihin ang konfigurasyon ng AZD)
az group delete --name rg-<env-name> --yes
```
## Alamin Pa

### Kaugnay na Dokumentasyon
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasyon ng Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentasyon ng Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentasyon ng Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Sanggunian sa Wika ng Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Mga Susunod na Hakbang sa Kursong Ito
- **[Halimbawa ng Container Apps](../../../../examples/container-app)**: I-deploy ang mga microservice gamit ang Azure Container Apps
- **[Gabay sa Integrasyon ng AI](../../../../docs/ai-foundry)**: Magdagdag ng mga kakayahan ng AI sa iyong app
- **[Pinakamahusay na Kasanayan sa Deployment](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Mga pattern para sa production deployment

### Mga Advanced na Paksa
- **Managed Identity**: Alisin ang mga password at gumamit ng Microsoft Entra ID para sa pagpapatunay
- **Private Endpoints**: Siguraduhin ang mga koneksyon sa database sa loob ng virtual network
- **CI/CD Integration**: I-automate ang mga deployment gamit ang GitHub Actions o Azure DevOps
- **Multi-Environment**: Mag-set up ng dev, staging, at production environments
- **Database Migrations**: Gumamit ng Alembic o Entity Framework para sa schema versioning

### Paghahambing sa Ibang Pamamaraan

**AZD vs. ARM Templates**:
- ✅ AZD: Mas mataas na antas ng abstraksyon, mas simpleng mga command
- ⚠️ ARM: Mas mahaba at mas detalyado, nagbibigay ng granular na kontrol

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, naka-integrate sa mga serbisyo ng Azure
- ⚠️ Terraform: Suporta para sa multi-cloud, mas malawak na ecosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Nauulit, nasa version control, maaaring i-automate
- ⚠️ Portal: Manwal na pag-click, mahirap ulitin

**Isipin ang AZD bilang**: Docker Compose para sa Azure—pinasimpleng configuration para sa komplikadong mga deployment.

---

## Mga Madalas Itanong

**Q: Maaari ba akong gumamit ng ibang programming language?**  
A: Oo! Palitan ang `src/web/` ng Node.js, C#, Go, o anumang wika. I-update ang `azure.yaml` at Bicep nang naaayon.

**Q: Paano ako magdadagdag ng higit pang mga database?**  
A: Magdagdag ng isa pang SQL Database module sa `infra/main.bicep` o gumamit ng PostgreSQL/MySQL mula sa Azure Database services.

**Q: Magagamit ko ba ito para sa production?**  
A: Ito ay panimulang punto. Para sa production, idagdag: managed identity, private endpoints, redundancy, backup strategy, WAF, at pinahusay na monitoring.

**Q: Paano kung gusto kong gumamit ng containers sa halip na code deployment?**  
A: Tingnan ang [Halimbawa ng Container Apps](../../../../examples/container-app) na gumagamit ng Docker containers sa kabuuan.

**Q: Paano ako kumokonekta sa database mula sa aking lokal na makina?**  
A: Idagdag ang iyong IP sa firewall ng SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Maaari ko bang gamitin ang umiiral na database imbes gumawa ng bago?**  
A: Oo, i-modify ang `infra/main.bicep` upang i-reference ang umiiral na SQL Server at i-update ang mga parameter ng connection string.

---

> **Tandaan:** Ang halimbawang ito ay nagpapakita ng mga pinakamahuhusay na kasanayan para sa pag-deploy ng web app na may database gamit ang AZD. Naglalaman ito ng gumaganang code, komprehensibong dokumentasyon, at praktikal na mga ehersisyo upang patibayin ang pagkatuto. Para sa production deployments, suriin ang seguridad, scaling, compliance, at mga kinakailangan sa gastos na partikular sa iyong organisasyon.

**📚 Pag-navigate ng Kurso:**
- ← Nakaraan: [Halimbawa ng Container Apps](../../../../examples/container-app)
- → Susunod: [Gabay sa Integrasyon ng AI](../../../../docs/ai-foundry)
- 🏠 [Tahanan ng Kurso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->