<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-22T10:56:57+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "tl"
}
-->
# Pag-deploy ng Microsoft SQL Database at Web App gamit ang AZD

⏱️ **Tinatayang Oras**: 20-30 minuto | 💰 **Tinatayang Gastos**: ~$15-25/buwan | ⭐ **Kumplikado**: Intermediate

Ang **kumpleto at gumaganang halimbawa** na ito ay nagpapakita kung paano gamitin ang [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) upang mag-deploy ng Python Flask web application na may Microsoft SQL Database sa Azure. Lahat ng code ay kasama at nasubukan—walang kinakailangang external na dependencies.

## Ano ang Matututuhan Mo

Sa pagtatapos ng halimbawang ito, matututuhan mo:
- Mag-deploy ng multi-tier application (web app + database) gamit ang infrastructure-as-code
- Mag-configure ng secure na koneksyon sa database nang hindi nagha-hardcode ng mga sikreto
- Subaybayan ang kalusugan ng application gamit ang Application Insights
- Pamahalaan ang mga Azure resources nang epektibo gamit ang AZD CLI
- Sundin ang mga pinakamahusay na kasanayan ng Azure para sa seguridad, cost optimization, at observability

## Pangkalahatang-ideya ng Scenario
- **Web App**: Python Flask REST API na may koneksyon sa database
- **Database**: Azure SQL Database na may sample data
- **Infrastructure**: Na-provision gamit ang Bicep (modular, reusable templates)
- **Deployment**: Ganap na awtomatiko gamit ang `azd` commands
- **Monitoring**: Application Insights para sa logs at telemetry

## Mga Kinakailangan

### Mga Kinakailangang Tool

Bago magsimula, tiyaking naka-install ang mga sumusunod na tool:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (bersyon 2.50.0 o mas mataas)
   ```sh
   az --version
   # Inaasahang output: azure-cli 2.50.0 o mas mataas
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (bersyon 1.0.0 o mas mataas)
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
   # Inaasahang output: Docker bersyon 20.10 o mas mataas
   ```

### Mga Kinakailangan sa Azure

- Isang aktibong **Azure subscription** ([gumawa ng libreng account](https://azure.microsoft.com/free/))
- Mga pahintulot upang lumikha ng mga resources sa iyong subscription
- **Owner** o **Contributor** na role sa subscription o resource group

### Mga Kinakailangang Kaalaman

Ito ay isang halimbawa para sa **intermediate-level**. Dapat kang pamilyar sa:
- Mga pangunahing operasyon sa command-line
- Pangunahing konsepto ng cloud (resources, resource groups)
- Pangunahing kaalaman sa web applications at databases

**Baguhan sa AZD?** Magsimula sa [Getting Started guide](../../docs/getting-started/azd-basics.md) muna.

## Arkitektura

Ang halimbawang ito ay nagde-deploy ng two-tier architecture na may web application at SQL database:

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

**Pag-deploy ng Resource:**
- **Resource Group**: Lalagyan para sa lahat ng resources
- **App Service Plan**: Linux-based hosting (B1 tier para sa cost efficiency)
- **Web App**: Python 3.11 runtime na may Flask application
- **SQL Server**: Managed database server na may TLS 1.2 minimum
- **SQL Database**: Basic tier (2GB, angkop para sa development/testing)
- **Application Insights**: Monitoring at logging
- **Log Analytics Workspace**: Sentralisadong imbakan ng log

**Analohiya**: Isipin ito na parang isang restaurant (web app) na may walk-in freezer (database). Ang mga customer ay umorder mula sa menu (API endpoints), at ang kusina (Flask app) ang kumukuha ng mga sangkap (data) mula sa freezer. Ang manager ng restaurant (Application Insights) ang nagtatala ng lahat ng nangyayari.

## Istruktura ng Folder

Lahat ng file ay kasama sa halimbawang ito—walang kinakailangang external na dependencies:

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
- **azure.yaml**: Nagsasabi sa AZD kung ano ang ide-deploy at saan
- **infra/main.bicep**: Nag-o-orchestrate ng lahat ng Azure resources
- **infra/resources/*.bicep**: Mga indibidwal na resource definitions (modular para sa reuse)
- **src/web/app.py**: Flask application na may database logic
- **requirements.txt**: Mga Python package dependencies
- **Dockerfile**: Mga tagubilin sa containerization para sa deployment

## Mabilisang Simula (Step-by-Step)

### Hakbang 1: I-clone at Mag-navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Tagumpay na Suriin**: Tiyaking makikita mo ang `azure.yaml` at `infra/` folder:
```sh
ls
# Inaasahan: README.md, azure.yaml, infra/, src/
```

### Hakbang 2: Mag-authenticate sa Azure

```sh
azd auth login
```

Bubuksan nito ang iyong browser para sa Azure authentication. Mag-sign in gamit ang iyong Azure credentials.

**✓ Tagumpay na Suriin**: Dapat mong makita:
```
Logged in to Azure.
```

### Hakbang 3: I-initialize ang Environment

```sh
azd init
```

**Ano ang nangyayari**: Gumagawa ang AZD ng lokal na configuration para sa iyong deployment.

**Mga Prompt na Makikita Mo**:
- **Environment name**: Maglagay ng maikling pangalan (hal., `dev`, `myapp`)
- **Azure subscription**: Piliin ang iyong subscription mula sa listahan
- **Azure location**: Pumili ng rehiyon (hal., `eastus`, `westeurope`)

**✓ Tagumpay na Suriin**: Dapat mong makita:
```
SUCCESS: New project initialized!
```

### Hakbang 4: I-provision ang Azure Resources

```sh
azd provision
```

**Ano ang nangyayari**: I-deploy ng AZD ang lahat ng infrastructure (tumatagal ng 5-8 minuto):
1. Gumagawa ng resource group
2. Gumagawa ng SQL Server at Database
3. Gumagawa ng App Service Plan
4. Gumagawa ng Web App
5. Gumagawa ng Application Insights
6. Nagko-configure ng networking at security

**Hihingin sa Iyo**:
- **SQL admin username**: Maglagay ng username (hal., `sqladmin`)
- **SQL admin password**: Maglagay ng malakas na password (itago ito!)

**✓ Tagumpay na Suriin**: Dapat mong makita:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Oras**: 5-8 minuto

### Hakbang 5: I-deploy ang Application

```sh
azd deploy
```

**Ano ang nangyayari**: Ibi-build at ide-deploy ng AZD ang iyong Flask application:
1. Ipa-package ang Python application
2. Ibi-build ang Docker container
3. Ipu-push sa Azure Web App
4. I-initialize ang database gamit ang sample data
5. Ipa-patakbo ang application

**✓ Tagumpay na Suriin**: Dapat mong makita:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Oras**: 3-5 minuto

### Hakbang 6: I-browse ang Application

```sh
azd browse
```

Bubuksan nito ang iyong na-deploy na web app sa browser sa `https://app-<unique-id>.azurewebsites.net`

**✓ Tagumpay na Suriin**: Dapat mong makita ang JSON output:
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

### Hakbang 7: Subukan ang API Endpoints

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

**✓ Tagumpay na Suriin**: Lahat ng endpoints ay nagbabalik ng JSON data nang walang error.

---

**🎉 Binabati kita!** Matagumpay mong na-deploy ang isang web application na may database sa Azure gamit ang AZD.

## Malalimang Pagsusuri sa Configuration

### Environment Variables

Ang mga sikreto ay pinamamahalaan nang ligtas sa pamamagitan ng Azure App Service configuration—**hindi kailanman naka-hardcode sa source code**.

**Awtomatikong Na-configure ng AZD**:
- `SQL_CONNECTION_STRING`: Koneksyon sa database na may encrypted credentials
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Nagpapagana ng awtomatikong pag-install ng dependency

**Saan Naka-store ang Mga Sekreto**:
1. Sa panahon ng `azd provision`, ibinibigay mo ang SQL credentials sa pamamagitan ng secure prompts
2. Iniimbak ng AZD ang mga ito sa iyong lokal na `.azure/<env-name>/.env` file (git-ignored)
3. Ini-inject ng AZD ang mga ito sa Azure App Service configuration (encrypted at rest)
4. Binabasa ng application ang mga ito sa pamamagitan ng `os.getenv()` sa runtime

### Lokal na Development

Para sa lokal na testing, gumawa ng `.env` file mula sa sample:

```sh
cp .env.sample .env
# I-edit ang .env gamit ang iyong lokal na koneksyon sa database
```

**Workflow ng Lokal na Development**:
```sh
# I-install ang mga dependency
cd src/web
pip install -r requirements.txt

# Itakda ang mga variable ng kapaligiran
export SQL_CONNECTION_STRING="your-local-connection-string"

# Patakbuhin ang aplikasyon
python app.py
```

**Subukan nang Lokal**:
```sh
curl http://localhost:8000/health
# Inaasahan: {"status": "malusog", "database": "nakakonekta"}
```

### Infrastructure as Code

Lahat ng Azure resources ay tinukoy sa **Bicep templates** (`infra/` folder):

- **Modular na Disenyo**: Ang bawat uri ng resource ay may sariling file para sa reusability
- **Parameterized**: Maaaring i-customize ang SKUs, rehiyon, at naming conventions
- **Pinakamahusay na Kasanayan**: Sumusunod sa Azure naming standards at security defaults
- **Version Controlled**: Ang mga pagbabago sa infrastructure ay naka-track sa Git

**Halimbawa ng Customization**:
Upang baguhin ang database tier, i-edit ang `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Mga Pinakamahusay na Kasanayan sa Seguridad

Ang halimbawang ito ay sumusunod sa mga pinakamahusay na kasanayan sa seguridad ng Azure:

### 1. **Walang Sekreto sa Source Code**
- ✅ Ang mga kredensyal ay naka-store sa Azure App Service configuration (encrypted)
- ✅ Ang `.env` files ay hindi kasama sa Git sa pamamagitan ng `.gitignore`
- ✅ Ang mga sikreto ay ipinapasa sa pamamagitan ng secure parameters sa panahon ng provisioning

### 2. **Encrypted na Koneksyon**
- ✅ TLS 1.2 minimum para sa SQL Server
- ✅ HTTPS-only na ipinatutupad para sa Web App
- ✅ Ang mga koneksyon sa database ay gumagamit ng encrypted channels

### 3. **Network Security**
- ✅ Ang SQL Server firewall ay naka-configure upang payagan lamang ang Azure services
- ✅ Ang pampublikong network access ay limitado (maaaring higit pang i-lock gamit ang Private Endpoints)
- ✅ Ang FTPS ay naka-disable sa Web App

### 4. **Authentication at Authorization**
- ⚠️ **Kasalukuyan**: SQL authentication (username/password)
- ✅ **Rekomendasyon para sa Produksyon**: Gumamit ng Azure Managed Identity para sa passwordless authentication

**Upang Mag-upgrade sa Managed Identity** (para sa produksyon):
1. I-enable ang managed identity sa Web App
2. Bigyan ng SQL permissions ang identity
3. I-update ang connection string upang gumamit ng managed identity
4. Alisin ang password-based authentication

### 5. **Auditing at Compliance**
- ✅ Ang Application Insights ay naglo-log ng lahat ng requests at errors
- ✅ Ang SQL Database auditing ay naka-enable (maaaring i-configure para sa compliance)
- ✅ Ang lahat ng resources ay may tag para sa governance

**Checklist sa Seguridad Bago ang Produksyon**:
- [ ] I-enable ang Azure Defender para sa SQL
- [ ] I-configure ang Private Endpoints para sa SQL Database
- [ ] I-enable ang Web Application Firewall (WAF)
- [ ] Ipatupad ang Azure Key Vault para sa secret rotation
- [ ] I-configure ang Azure AD authentication
- [ ] I-enable ang diagnostic logging para sa lahat ng resources

## Cost Optimization

**Tinatayang Buwanang Gastos** (simula Nobyembre 2025):

| Resource | SKU/Tier | Tinatayang Gastos |
|----------|----------|-------------------|
| App Service Plan | B1 (Basic) | ~$13/buwan |
| SQL Database | Basic (2GB) | ~$5/buwan |
| Application Insights | Pay-as-you-go | ~$2/buwan (mababang traffic) |
| **Kabuuan** | | **~$20/buwan** |

**💡 Mga Tip sa Pagtitipid**:

1. **Gamitin ang Libreng Tier para sa Pag-aaral**:
   - App Service: F1 tier (libre, limitadong oras)
   - SQL Database: Gumamit ng Azure SQL Database serverless
   - Application Insights: 5GB/buwan libreng ingestion

2. **Ihinto ang Mga Resource Kapag Hindi Ginagamit**:
   ```sh
   # Itigil ang web app (patuloy pa rin ang singil ng database)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # I-restart kapag kinakailangan
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Tanggalin ang Lahat Pagkatapos ng Testing**:
   ```sh
   azd down
   ```
   Tinatanggal nito ang LAHAT ng resources at pinipigilan ang mga singil.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (ginamit sa halimbawang ito)
   - **Production**: Standard/Premium tier na may redundancy

**Pagsubaybay sa Gastos**:
- Tingnan ang mga gastos sa [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Mag-set up ng cost alerts upang maiwasan ang sorpresa
- Lagyan ng tag ang lahat ng resources gamit ang `azd-env-name` para sa tracking

**Libreng Tier na Alternatibo**:
Para sa layunin ng pag-aaral, maaari mong baguhin ang `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Tandaan**: Ang libreng tier ay may mga limitasyon (60 min/day CPU, walang always-on).

## Monitoring at Observability

### Application Insights Integration

Kasama sa halimbawang ito ang **Application Insights** para sa komprehensibong monitoring:

**Ano ang Minomonitor**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ Mga error at exceptions sa application
- ✅ Custom logging mula sa Flask app
- ✅ Kalusugan ng koneksyon sa database
- ✅ Mga performance metrics (CPU, memory)

**Paano Ma-access ang Application Insights**:
1. Buksan ang [Azure Portal](https://portal.azure.com)
2. Mag-navigate sa iyong resource group (`rg-<env-name>`)
3. I-click ang Application Insights resource (`appi-<unique-id>`)

**Mga Kapaki-pakinabang na Query** (Application Insights → Logs):

**Tingnan ang Lahat ng Requests**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Hanapin ang Mga Error**:
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

**Ang SQL Database auditing ay naka-enable** upang subaybayan:
- Mga pattern ng access sa database
- Mga nabigong pagtatangka sa pag-login
- Mga pagbabago sa schema
- Access sa data (para sa compliance)

**Paano Ma-access ang Audit Logs**:
1. Azure Portal → SQL Database → Auditing
2. Tingnan ang mga log sa Log Analytics workspace

### Real-Time Monitoring

**Tingnan ang Live Metrics**:
1. Application Insights → Live Metrics
2. Tingnan ang mga requests, failures, at performance nang real-time

**Mag-set Up ng Alerts**:
Gumawa ng alerts para sa mga kritikal na event:
- HTTP 500 errors > 5 sa loob ng 5 minuto
- Mga nabigong koneksyon sa database
- Mataas na oras ng pagtugon (>2 segundo)

**Halimbawa ng Paglikha ng Alerto**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Pag-aayos ng Problema

### Karaniwang Isyu at Solusyon

#### 1. Nabigo ang `azd provision` na may "Location not available"

**Sintomas**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solusyon**:
Pumili ng ibang Azure region o irehistro ang resource provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Nabigo ang SQL Connection Habang Deployment

**Sintomas**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solusyon**:
- Siguraduhing pinapayagan ng SQL Server firewall ang Azure services (awtomatikong naka-configure)
- Suriin kung tama ang SQL admin password na inilagay sa `azd provision`
- Siguraduhing ganap na na-provision ang SQL Server (maaaring tumagal ng 2-3 minuto)

**Suriin ang Koneksyon**:
```sh
# Mula sa Azure Portal, pumunta sa SQL Database → Query editor
# Subukang kumonekta gamit ang iyong mga kredensyal
```

#### 3. Nagpapakita ang Web App ng "Application Error"

**Sintomas**:
Nagpapakita ang browser ng generic na error page.

**Solusyon**:
Suriin ang application logs:
```sh
# Tingnan ang mga kamakailang log
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Karaniwang sanhi**:
- Nawawalang environment variables (suriin ang App Service → Configuration)
- Nabigo ang pag-install ng Python package (suriin ang deployment logs)
- Error sa database initialization (suriin ang SQL connectivity)

#### 4. Nabigo ang `azd deploy` na may "Build Error"

**Sintomas**:
```
Error: Failed to build project
```

**Solusyon**:
- Siguraduhing walang syntax errors ang `requirements.txt`
- Suriin kung ang Python 3.11 ay tinukoy sa `infra/resources/web-app.bicep`
- Siguraduhing tama ang base image sa Dockerfile

**I-debug nang lokal**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" Kapag Nagpapatakbo ng AZD Commands

**Sintomas**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solusyon**:
Mag-reauthenticate sa Azure:
```sh
azd auth login
az login
```

Siguraduhing mayroon kang tamang permissions (Contributor role) sa subscription.

#### 6. Mataas na Gastos sa Database

**Sintomas**:
Hindi inaasahang Azure bill.

**Solusyon**:
- Suriin kung nakalimutan mong patakbuhin ang `azd down` pagkatapos ng testing
- Siguraduhing ang SQL Database ay gumagamit ng Basic tier (hindi Premium)
- Suriin ang gastos sa Azure Cost Management
- Mag-set up ng cost alerts

### Pagkuha ng Tulong

**Ipakita ang Lahat ng AZD Environment Variables**:
```sh
azd env get-values
```

**Suriin ang Deployment Status**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**I-access ang Application Logs**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Kailangan ng Higit Pang Tulong?**
- [AZD Troubleshooting Guide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktikal na Mga Ehersisyo

### Ehersisyo 1: Suriin ang Iyong Deployment (Baguhan)

**Layunin**: Kumpirmahin na lahat ng resources ay na-deploy at gumagana ang application.

**Mga Hakbang**:
1. Ilista ang lahat ng resources sa iyong resource group:
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
   **Inaasahan**: Lahat ay nagbabalik ng valid JSON nang walang errors

3. Suriin ang Application Insights:
   - Pumunta sa Application Insights sa Azure Portal
   - Pumunta sa "Live Metrics"
   - I-refresh ang iyong browser sa web app
   **Inaasahan**: Makikita ang mga request na lumalabas nang real-time

**Kriteria ng Tagumpay**: Lahat ng 6-7 resources ay naroroon, lahat ng endpoints ay nagbabalik ng data, ang Live Metrics ay nagpapakita ng aktibidad.

---

### Ehersisyo 2: Magdagdag ng Bagong API Endpoint (Intermediate)

**Layunin**: Palawakin ang Flask application gamit ang bagong endpoint.

**Starter Code**: Kasalukuyang endpoints sa `src/web/app.py`

**Mga Hakbang**:
1. I-edit ang `src/web/app.py` at magdagdag ng bagong endpoint pagkatapos ng `get_product()` function:
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

2. I-deploy ang na-update na application:
   ```sh
   azd deploy
   ```

3. Subukan ang bagong endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Inaasahan**: Nagbabalik ng mga produkto na tumutugma sa "laptop"

**Kriteria ng Tagumpay**: Gumagana ang bagong endpoint, nagbabalik ng filtered results, lumalabas sa Application Insights logs.

---

### Ehersisyo 3: Magdagdag ng Monitoring at Alerts (Advanced)

**Layunin**: Mag-set up ng proactive monitoring gamit ang alerts.

**Mga Hakbang**:
1. Gumawa ng alert para sa HTTP 500 errors:
   ```sh
   # Kunin ang Application Insights resource ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Gumawa ng alerto
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. I-trigger ang alert sa pamamagitan ng paglikha ng errors:
   ```sh
   # Humiling ng produktong hindi umiiral
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Suriin kung ang alert ay nag-fire:
   - Azure Portal → Alerts → Alert Rules
   - Suriin ang iyong email (kung naka-configure)

**Kriteria ng Tagumpay**: Nilikha ang alert rule, nag-trigger sa errors, natanggap ang notifications.

---

### Ehersisyo 4: Mga Pagbabago sa Database Schema (Advanced)

**Layunin**: Magdagdag ng bagong table at baguhin ang application upang magamit ito.

**Mga Hakbang**:
1. Kumonekta sa SQL Database gamit ang Azure Portal Query Editor

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

3. I-update ang `src/web/app.py` upang isama ang impormasyon ng category sa responses

4. I-deploy at subukan

**Kriteria ng Tagumpay**: Umiiral ang bagong table, nagpapakita ang mga produkto ng impormasyon ng category, gumagana pa rin ang application.

---

### Ehersisyo 5: Magpatupad ng Caching (Expert)

**Layunin**: Magdagdag ng Azure Redis Cache upang mapabuti ang performance.

**Mga Hakbang**:
1. Magdagdag ng Redis Cache sa `infra/main.bicep`
2. I-update ang `src/web/app.py` upang i-cache ang product queries
3. Sukatin ang pagbuti ng performance gamit ang Application Insights
4. Ihambing ang response times bago/ pagkatapos ng caching

**Kriteria ng Tagumpay**: Na-deploy ang Redis, gumagana ang caching, bumuti ang response times ng >50%.

**Pahiwatig**: Magsimula sa [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Paglilinis

Upang maiwasan ang patuloy na singil, tanggalin ang lahat ng resources kapag tapos na:

```sh
azd down
```

**Kumpirmasyon ng prompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

I-type ang `y` upang kumpirmahin.

**✓ Suriin ang Tagumpay**: 
- Lahat ng resources ay natanggal mula sa Azure Portal
- Walang patuloy na singil
- Ang lokal na `.azure/<env-name>` folder ay maaaring tanggalin

**Alternatibo** (panatilihin ang infrastructure, tanggalin ang data):
```sh
# Tanggalin lamang ang resource group (panatilihin ang AZD config)
az group delete --name rg-<env-name> --yes
```
## Matuto Pa

### Kaugnay na Dokumentasyon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Mga Susunod na Hakbang sa Kursong Ito
- **[Halimbawa ng Container Apps](../../../../examples/container-app)**: Mag-deploy ng microservices gamit ang Azure Container Apps
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Magdagdag ng AI capabilities sa iyong app
- **[Deployment Best Practices](../../docs/deployment/deployment-guide.md)**: Mga pattern ng deployment para sa production

### Mga Advanced na Paksa
- **Managed Identity**: Tanggalin ang mga password at gumamit ng Azure AD authentication
- **Private Endpoints**: Siguraduhin ang koneksyon ng database sa loob ng virtual network
- **CI/CD Integration**: Awtomatikong deployment gamit ang GitHub Actions o Azure DevOps
- **Multi-Environment**: Mag-set up ng dev, staging, at production environments
- **Database Migrations**: Gumamit ng Alembic o Entity Framework para sa schema versioning

### Paghahambing sa Ibang Pamamaraan

**AZD vs. ARM Templates**:
- ✅ AZD: Mas mataas na abstraction, mas simpleng commands
- ⚠️ ARM: Mas detalyado, mas granular na kontrol

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrated sa Azure services
- ⚠️ Terraform: Multi-cloud support, mas malaking ecosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Repeatable, version-controlled, automatable
- ⚠️ Portal: Manual clicks, mahirap ulitin

**Isipin ang AZD bilang**: Docker Compose para sa Azure—pinadaling configuration para sa kumplikadong deployments.

---

## Mga Madalas Itanong

**Q: Maaari ba akong gumamit ng ibang programming language?**  
A: Oo! Palitan ang `src/web/` ng Node.js, C#, Go, o anumang wika. I-update ang `azure.yaml` at Bicep nang naaayon.

**Q: Paano ako magdadagdag ng higit pang databases?**  
A: Magdagdag ng isa pang SQL Database module sa `infra/main.bicep` o gumamit ng PostgreSQL/MySQL mula sa Azure Database services.

**Q: Maaari ko bang gamitin ito para sa production?**  
A: Ito ay panimulang punto. Para sa production, magdagdag ng: managed identity, private endpoints, redundancy, backup strategy, WAF, at pinahusay na monitoring.

**Q: Paano kung gusto kong gumamit ng containers sa halip na code deployment?**  
A: Tingnan ang [Halimbawa ng Container Apps](../../../../examples/container-app) na gumagamit ng Docker containers sa kabuuan.

**Q: Paano ako kokonekta sa database mula sa aking lokal na makina?**  
A: Idagdag ang iyong IP sa SQL Server firewall:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Maaari ba akong gumamit ng umiiral na database sa halip na gumawa ng bago?**  
A: Oo, i-modify ang `infra/main.bicep` upang i-reference ang umiiral na SQL Server at i-update ang connection string parameters.

---

> **Tandaan:** Ang halimbawang ito ay nagpapakita ng pinakamahusay na kasanayan para sa pag-deploy ng web app na may database gamit ang AZD. Kasama dito ang gumaganang code, komprehensibong dokumentasyon, at praktikal na mga ehersisyo upang palakasin ang pag-aaral. Para sa production deployments, suriin ang seguridad, scaling, compliance, at cost requirements na partikular sa iyong organisasyon.

**📚 Navigation ng Kurso:**
- ← Nakaraan: [Halimbawa ng Container Apps](../../../../examples/container-app)
- → Susunod: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Home ng Kurso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->