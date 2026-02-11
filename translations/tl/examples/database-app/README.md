# Pag-deploy ng Microsoft SQL Database at Web App gamit ang AZD

⏱️ **Tinatayang Oras**: 20-30 minuto | 💰 **Tinatayang Gastos**: ~$15-25/buwan | ⭐ **Kumplikado**: Katamtaman

Ang **kumpleto, gumaganang halimbawa** na ito ay nagpapakita kung paano gamitin ang [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para i-deploy ang isang Python Flask web application na may Microsoft SQL Database sa Azure. Kasama ang lahat ng code at nasubok—walang kinakailangang panlabas na dependency.

## Ano ang Matututuhan Mo

Sa pagtapos ng halimbawang ito, magagawa mong:
- I-deploy ang multi-tier na aplikasyon (web app + database) gamit ang infrastructure-as-code
- I-configure ang ligtas na koneksyon sa database nang hindi ini-hardcode ang mga secret
- I-monitor ang kalusugan ng aplikasyon gamit ang Application Insights
- Pamahalaan ang mga Azure resource nang epektibo gamit ang AZD CLI
- Sundin ang mga best practice ng Azure para sa seguridad, pag-optimize ng gastos, at observability

## Pangkalahatang Scenario
- **Web App**: Python Flask REST API na may konektividad sa database
- **Database**: Azure SQL Database na may sample na data
- **Infrastructure**: Pinoprovide gamit ang Bicep (modular, reusable templates)
- **Deployment**: Ganap na awtomatiko gamit ang `azd` commands
- **Monitoring**: Application Insights para sa logs at telemetry

## Mga Kinakailangan

### Mga Kailangan na Tool

Bago magsimula, tiyakin na naka-install ang mga sumusunod na tool:

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

### Mga Pangangailangan sa Azure

- Isang aktibong **Azure subscription** ([gumawa ng libreng account](https://azure.microsoft.com/free/))
- Mga permiso para lumikha ng mga resource sa iyong subscription
- **Owner** o **Contributor** na role sa subscription o resource group

### Mga Kaalamang Dapat Meron

Ito ay isang **intermediate-level** na halimbawa. Dapat pamilyar ka sa:
- Mga pangunahing operasyon sa command-line
- Mga pangunahing konsepto sa cloud (resources, resource groups)
- Batayang pag-unawa sa web applications at databases

**Bago sa AZD?** Magsimula sa [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) muna.

## Arkitektura

Ang halimbawang ito ay nagde-deploy ng two-tier na arkitektura na may web application at SQL database:

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

**Deployment ng Mga Resource:**
- **Resource Group**: Lalagyan para sa lahat ng resources
- **App Service Plan**: Linux-based hosting (B1 tier para sa cost efficiency)
- **Web App**: Python 3.11 runtime na may Flask application
- **SQL Server**: Managed database server na may TLS 1.2 minimum
- **SQL Database**: Basic tier (2GB, angkop para sa development/testing)
- **Application Insights**: Monitoring at logging
- **Log Analytics Workspace**: Sentralisadong imbakan ng logs

**Analogy**: Isipin ito na parang isang restawran (web app) na may walk-in freezer (database). Umuorder ang mga customer mula sa menu (API endpoints), at kukuha ang kusina (Flask app) ng mga sangkap (data) mula sa freezer. Binabantayan ng manager ng restawran (Application Insights) ang lahat ng nangyayari.

## Istruktura ng Folder

Kasama ang lahat ng files sa halimbawang ito—walang kinakailangang panlabas na dependency:

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

**Ano ang Gawain ng Bawat File:**
- **azure.yaml**: Sinusabi sa AZD kung ano ang ide-deploy at saan
- **infra/main.bicep**: Nag-o-orchestrate ng lahat ng Azure resources
- **infra/resources/*.bicep**: Indibidwal na mga depinisyon ng resource (modular para sa reuse)
- **src/web/app.py**: Flask application na may database logic
- **requirements.txt**: Mga dependency ng Python package
- **Dockerfile**: Mga instruksyon sa containerization para sa deployment

## Mabilisang Simula (Hakbang-hakbang)

### Hakbang 1: I-clone at Mag-navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Success Check**: Siguraduhing nakikita mo ang `azure.yaml` at folder na `infra/`:
```sh
ls
# Inaasahan: README.md, azure.yaml, infra/, src/
```

### Hakbang 2: Mag-authenticate sa Azure

```sh
azd auth login
```

Magbubukas ito ng iyong browser para sa Azure authentication. Mag-sign in gamit ang iyong Azure credentials.

**✓ Success Check**: Dapat mong makita:
```
Logged in to Azure.
```

### Hakbang 3: I-initialize ang Environment

```sh
azd init
```

**Ano ang nangyayari**: Gumagawa ang AZD ng lokal na configuration para sa iyong deployment.

**Mga prompt na makikita mo**:
- **Environment name**: Maglagay ng maikling pangalan (hal., `dev`, `myapp`)
- **Azure subscription**: Piliin ang iyong subscription mula sa listahan
- **Azure location**: Pumili ng rehiyon (hal., `eastus`, `westeurope`)

**✓ Success Check**: Dapat mong makita:
```
SUCCESS: New project initialized!
```

### Hakbang 4: I-provision ang Azure Resources

```sh
azd provision
```

**Ano ang nangyayari**: Ini-deploy ng AZD ang lahat ng infrastructure (tumagal ng 5-8 minuto):
1. Lumilikha ng resource group
2. Lumilikha ng SQL Server at Database
3. Lumilikha ng App Service Plan
4. Lumilikha ng Web App
5. Lumilikha ng Application Insights
6. Kinukonfigura ang networking at seguridad

**Ipapaprompt ka para sa**:
- **SQL admin username**: Maglagay ng username (hal., `sqladmin`)
- **SQL admin password**: Maglagay ng malakas na password (i-save ito!)

**✓ Success Check**: Dapat mong makita:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Oras**: 5-8 minuto

### Hakbang 5: I-deploy ang Aplikasyon

```sh
azd deploy
```

**Ano ang nangyayari**: Binubuo at dine-deploy ng AZD ang iyong Flask application:
1. Pinapackage ang Python application
2. Binubuo ang Docker container
3. Pinupush sa Azure Web App
4. Ini-initialize ang database gamit ang sample data
5. Sinisimulan ang aplikasyon

**✓ Success Check**: Dapat mong makita:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Oras**: 3-5 minuto

### Hakbang 6: I-browse ang Aplikasyon

```sh
azd browse
```

Bubuksan nito ang iyong na-deploy na web app sa browser sa `https://app-<unique-id>.azurewebsites.net`

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

### Hakbang 7: Subukan ang mga API Endpoint

**Health Check** (siguraduhin ang koneksyon sa database):
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

**Kunin ang Isang Product**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Success Check**: Lahat ng endpoints ay nagbabalik ng JSON data nang walang error.

---

**🎉 Binabati kita!** Matagumpay mong na-deploy ang isang web application na may database sa Azure gamit ang AZD.

## Malalimang Pag-configure

### Environment Variables

Ang mga secret ay pinamamahalaan nang ligtas sa pamamagitan ng Azure App Service configuration—**huwag kailanman i-hardcode sa source code**.

**Awtomatikong Kino-configure ng AZD**:
- `SQL_CONNECTION_STRING`: Database connection na may naka-encrypt na kredensyal
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Nag-enable ng automatic dependency installation

**Saan Ini-store ang Mga Secret**:
1. Sa `azd provision`, ibibigay mo ang SQL credentials sa pamamagitan ng secure prompts
2. Ini-store ito ng AZD sa iyong lokal na `.azure/<env-name>/.env` file (git-ignored)
3. Ini-inject ng AZD ang mga ito sa Azure App Service configuration (encrypted at rest)
4. Binabasa ng aplikasyon ang mga ito gamit ang `os.getenv()` sa runtime

### Lokal na Development

Para sa lokal na testing, gumawa ng `.env` file mula sa sample:

```sh
cp .env.sample .env
# I-edit ang .env para sa lokal na koneksyon sa database.
```

**Lokal na Development Workflow**:
```sh
# I-install ang mga dependencies
cd src/web
pip install -r requirements.txt

# Itakda ang mga environment variable
export SQL_CONNECTION_STRING="your-local-connection-string"

# Patakbuhin ang aplikasyon
python app.py
```

**Subukan nang lokal**:
```sh
curl http://localhost:8000/health
# Inaasahan: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

Ang lahat ng Azure resources ay nade-define sa **Bicep templates** (`infra/` folder):

- **Modular na Disenyo**: Bawat uri ng resource ay may sariling file para sa reusability
- **Parameterized**: I-customize ang SKUs, rehiyon, naming conventions
- **Best Practices**: Sumusunod sa Azure naming standards at security defaults
- **Version Controlled**: Ang mga pagbabago sa infrastructure ay tinatrack sa Git

**Halimbawa ng Pag-customize**:
Para baguhin ang database tier, i-edit ang `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Mga Best Practice sa Seguridad

Sinusunod ng halimbawang ito ang mga best practice sa seguridad ng Azure:

### 1. **Walang Secrets sa Source Code**
- ✅ Mga kredensyal ay naka-store sa Azure App Service configuration (encrypted)
- ✅ Mga `.env` file ay excluded mula sa Git via `.gitignore`
- ✅ Mga secret ay ipinapasa sa pamamagitan ng secure parameters habang provisioning

### 2. **Encrypted na Koneksyon**
- ✅ TLS 1.2 minimum para sa SQL Server
- ✅ HTTPS-only na ipinapatupad para sa Web App
- ✅ Mga koneksyon sa database ay gumagamit ng encrypted channels

### 3. **Network Security**
- ✅ SQL Server firewall naka-configure para payagan lamang ang Azure services
- ✅ Public network access ay nililimitahan (maaaring i-lockdown pa gamit ang Private Endpoints)
- ✅ FTPS naka-disable sa Web App

### 4. **Authentication & Authorization**
- ⚠️ **Kasalukuyan**: SQL authentication (username/password)
- ✅ **Rekomendasyon para sa Production**: Gumamit ng Azure Managed Identity para sa passwordless authentication

**Para Mag-upgrade sa Managed Identity** (para sa production):
1. I-enable ang managed identity sa Web App
2. Bigyan ng SQL permissions ang identity
3. I-update ang connection string para gumamit ng managed identity
4. Alisin ang password-based authentication

### 5. **Auditing & Compliance**
- ✅ Naglo-log ng lahat ng request at error ang Application Insights
- ✅ SQL Database auditing ay enabled (maaaring i-configure para sa compliance)
- ✅ Lahat ng resources ay may tags para sa governance

**Checklist sa Seguridad Bago ang Production**:
- [ ] I-enable ang Azure Defender para sa SQL
- [ ] I-configure ang Private Endpoints para sa SQL Database
- [ ] I-enable ang Web Application Firewall (WAF)
- [ ] I-implement ang Azure Key Vault para sa rotation ng secrets
- [ ] I-configure ang Azure AD authentication
- [ ] I-enable ang diagnostic logging para sa lahat ng resources

## Pag-optimize ng Gastos

**Tinatayang Buwanang Gastos** (hanggang Nobyembre 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (mababang traffic) |
| **Total** | | **~$20/month** |

**💡 Mga Tip para Makatipid**:

1. **Gumamit ng Free Tier para sa Pag-aaral**:
   - App Service: F1 tier (libreng, may limitadong oras)
   - SQL Database: Gamitin ang Azure SQL Database serverless
   - Application Insights: 5GB/buwan libreng ingestion

2. **Patayin ang Mga Resource Kapag Hindi Ginagamit**:
   ```sh
   # Ihinto ang web app (sisingilin pa rin ang database)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # I-restart kapag kailangan
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **I-delete Lahat Pagkatapos ng Testing**:
   ```sh
   azd down
   ```
   Ito ay aalisin ANG LAHAT ng resources at ititigil ang pagkakacharge.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (ginamit sa halimbawang ito)
   - **Production**: Standard/Premium tier na may redundancy

**Pagsubaybay ng Gastos**:
- Tingnan ang gastos sa [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Mag-set up ng cost alerts para maiwasan ang sorpresa
- I-tag lahat ng resources ng `azd-env-name` para sa pagsubaybay

**Libreng Tier na Alternatibo**:
Para sa layunin ng pag-aaral, maaari mong baguhin ang `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Tandaan**: Ang free tier ay may mga limitasyon (60 min/day CPU, walang always-on).

## Monitoring at Observability

### Integrasyon ng Application Insights

Kasama sa halimbawang ito ang **Application Insights** para sa komprehensibong monitoring:

**Ano ang Mino-monitor**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ Application errors at exceptions
- ✅ Custom logging mula sa Flask app
- ✅ Kalusugan ng koneksyon sa database
- ✅ Performance metrics (CPU, memory)

**Paano Buksan ang Application Insights**:
1. Buksan ang [Azure Portal](https://portal.azure.com)
2. Pumunta sa iyong resource group (`rg-<env-name>`)
3. I-click ang Application Insights resource (`appi-<unique-id>`)

**Mga Kapaki-pakinabang na Query** (Application Insights → Logs):

**Tingnan Lahat ng Requests**:
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

**Ang SQL Database auditing ay naka-enable** para subaybayan ang:
- Mga pattern ng pag-access sa database
- Mga nabigong login attempts
- Mga pagbabago sa schema
- Pag-access sa data (para sa compliance)

**Paano Tingnan ang Audit Logs**:
1. Azure Portal → SQL Database → Auditing
2. Tingnan ang logs sa Log Analytics workspace

### Real-Time na Monitoring

**Tingnan ang Live Metrics**:
1. Application Insights → Live Metrics
2. Makikita ang requests, failures, at performance nang real-time

**Mag-set Up ng Alerts**:
Gumawa ng alerts para sa mga kritikal na pangyayari:
- HTTP 500 errors > 5 sa loob ng 5 minuto
- Mga pagkabigong koneksyon sa database
- Mataas na oras ng tugon (>2 segundo)

**Halimbawa ng Paglikha ng Alert**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Pagsasaayos ng Problema

### Mga Karaniwang Isyu at Solusyon

#### 1. `azd provision` nabibigo na may "Location not available"

**Sintomas**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solusyon**:
Pumili ng ibang rehiyon ng Azure o irehistro ang resource provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Nabibigo ang Koneksyon sa SQL habang nag-de-deploy

**Sintomas**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solusyon**:
- Suriin na pinapayagan ng firewall ng SQL Server ang mga serbisyo ng Azure (na awtomatikong naka-configure)
- Suriin na naipasok nang tama ang SQL admin password habang nagpapatakbo ng `azd provision`
- Tiyakin na ganap na na-provision ang SQL Server (maaari tumagal ng 2-3 minuto)

**Suriin ang Koneksyon**:
```sh
# Mula sa Azure Portal, pumunta sa SQL Database → Editor ng Query
# Subukang kumonekta gamit ang iyong mga kredensyal
```

#### 3. Nagpapakita ang Web App ng "Application Error"

**Sintomas**:
Nagpapakita ang browser ng pangkaraniwang pahina ng error.

**Solusyon**:
Suriin ang mga log ng application:
```sh
# Tingnan ang mga kamakailang log
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Mga Karaniwang Sanhi**:
- Nawawalang environment variable (suriin ang App Service → Configuration)
- Nabigo ang pag-install ng Python package (suriin ang deployment logs)
- Error sa pag-initialize ng database (suriin ang konektividad ng SQL)

#### 4. `azd deploy` nabibigo na may "Build Error"

**Sintomas**:
```
Error: Failed to build project
```

**Solusyon**:
- Tiyakin na walang syntax errors ang `requirements.txt`
- Suriin na ang Python 3.11 ay tinukoy sa `infra/resources/web-app.bicep`
- Tiyakin na ang Dockerfile ay may tamang base image

**I-debug nang lokal**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" Kapag nagpapatakbo ng mga AZD Command

**Sintomas**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solusyon**:
Muling mag-authenticate sa Azure:
```sh
azd auth login
az login
```

Suriin na mayroon kang tamang mga permiso (Contributor role) sa subscription.

#### 6. Mataas na Gastos ng Database

**Sintomas**:
Hindi inaasahang singil sa Azure.

**Solusyon**:
- Suriin kung nakalimutan mong patakbuhin ang `azd down` pagkatapos ng pagsubok
- Tiyakin na ang SQL Database ay nasa Basic tier (hindi Premium)
- Suriin ang mga gastos sa Azure Cost Management
- Mag-set up ng mga alerto sa gastos

### Pagkuha ng Tulong

**Tingnan ang Lahat ng AZD Environment Variables**:
```sh
azd env get-values
```

**Suriin ang Katayuan ng Deployment**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**I-access ang Mga Log ng Application**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Kailangan ng Karagdagang Tulong?**
- [Gabay sa Pag-troubleshoot ng AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Pag-troubleshoot ng Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Pag-troubleshoot ng Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Mga Praktikal na Ehersisyo

### Ehersisyo 1: Suriin ang Iyong Deployment (Nagsisimula)

**Layunin**: Kumpirmahin na lahat ng mga resource ay na-deploy at gumagana ang aplikasyon.

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
   **Inaasahan**: Lahat ay nagbabalik ng wastong JSON nang walang error

3. Suriin ang Application Insights:
   - Pumunta sa Application Insights sa Azure Portal
   - Pumunta sa "Live Metrics"
   - I-refresh ang iyong browser sa web app
   **Inaasahan**: Makikita ang mga request na lumilitaw nang real-time

**Pamantayan ng Tagumpay**: Lahat ng 6-7 resources ay umiiral, lahat ng endpoints ay nagbabalik ng data, nagpapakita ng aktibidad ang Live Metrics.

---

### Ehersisyo 2: Magdagdag ng Bagong API Endpoint (Intermedyaryo)

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

2. I-deploy ang na-update na aplikasyon:
   ```sh
   azd deploy
   ```

3. Subukan ang bagong endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Inaasahan**: Nagbabalik ng mga produkto na tumutugma sa "laptop"

**Pamantayan ng Tagumpay**: Gumagana ang bagong endpoint, nagbabalik ng na-filter na mga resulta, lumilitaw sa mga log ng Application Insights.

---

### Ehersisyo 3: Magdagdag ng Monitoring at Mga Alerto (Avansado)

**Layunin**: Mag-set up ng proaktibong monitoring na may mga alerto.

**Mga Hakbang**:
1. Gumawa ng alerto para sa HTTP 500 na mga error:
   ```sh
   # Kunin ang resource ID ng Application Insights
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

2. I-trigger ang alerto sa pamamagitan ng paglikha ng mga error:
   ```sh
   # Humiling ng isang hindi umiiral na produkto
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Suriin kung na-trigger ang alerto:
   - Azure Portal → Alerts → Alert Rules
   - Suriin ang iyong email (kung naka-configure)

**Pamantayan ng Tagumpay**: Nabuo ang alert rule, nagta-trigger sa mga error, natatanggap ang mga notipikasyon.

---

### Ehersisyo 4: Mga Pagbabago sa Schema ng Database (Avansado)

**Layunin**: Magdagdag ng bagong talahanayan at baguhin ang aplikasyon upang gamitin ito.

**Mga Hakbang**:
1. Kumonekta sa SQL Database sa pamamagitan ng Azure Portal Query Editor

2. Gumawa ng bagong talahanayan na `categories`:
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

**Pamantayan ng Tagumpay**: Umiiral ang bagong talahanayan, ipinapakita ng mga produkto ang impormasyon ng kategorya, gumagana pa rin ang aplikasyon.

---

### Ehersisyo 5: Magpatupad ng Caching (Eksperto)

**Layunin**: Magdagdag ng Azure Redis Cache upang pagbutihin ang pagganap.

**Mga Hakbang**:
1. Idagdag ang Redis Cache sa `infra/main.bicep`
2. I-update ang `src/web/app.py` upang i-cache ang mga query ng produkto
3. Sukatin ang pagpapabuti ng pagganap gamit ang Application Insights
4. Ihambing ang mga oras ng tugon bago/pagkatapos ng caching

**Pamantayan ng Tagumpay**: Na-deploy ang Redis, gumagana ang caching, ang mga oras ng tugon ay bumuti ng >50%.

**Tip**: Magsimula sa [Dokumentasyon ng Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Paglilinis

Upang maiwasan ang patuloy na singil, tanggalin lahat ng mga resource kapag tapos na:

```sh
azd down
```

**Prompt ng Kumpirmasyon**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

I-type ang `y` upang kumpirmahin.

**✓ Pag-check ng Tagumpay**: 
- Lahat ng resource ay natanggal mula sa Azure Portal
- Walang patuloy na singil
- Maaaring tanggalin ang lokal na `.azure/<env-name>` folder

**Alternatibo** (panatilihin ang infrastructure, tanggalin ang data):
```sh
# Tanggalin lamang ang resource group (panatilihin ang AZD config)
az group delete --name rg-<env-name> --yes
```
## Alamin Pa

### Kaugnay na Dokumentasyon
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasyon ng Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentasyon ng Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentasyon ng Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Sanggunian ng Wika ng Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Mga Susunod na Hakbang sa Kurso na Ito
- **[Halimbawa ng Container Apps](../../../../examples/container-app)**: I-deploy ang mga microservices gamit ang Azure Container Apps
- **[Gabay sa Integrasyon ng AI](../../../../docs/ai-foundry)**: Magdagdag ng kakayahan ng AI sa iyong app
- **[Pinakamahuhusay na Kasanayan sa Deployment](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Mga pattern para sa production deployment

### Mga Advanced na Paksa
- **Managed Identity**: Alisin ang mga password at gumamit ng Azure AD para sa pagpapatunay
- **Private Endpoints**: Siguraduhin ang mga koneksyon sa database sa loob ng virtual network
- **CI/CD Integration**: I-automate ang mga deployment gamit ang GitHub Actions o Azure DevOps
- **Multi-Environment**: Mag-set up ng dev, staging, at production environments
- **Database Migrations**: Gamitin ang Alembic o Entity Framework para sa versioning ng schema

### Paghahambing sa Iba Pang Paraan

**AZD vs. ARM Templates**:
- ✅ AZD: Mas mataas na antas ng abstraksyon, mas simple ang mga command
- ⚠️ ARM: Mas mahaba at mas detalyado, nagbibigay ng mas pinong kontrol

**AZD vs. Terraform**:
- ✅ AZD: Native sa Azure, naka-integrate sa mga serbisyo ng Azure
- ⚠️ Terraform: Suporta para sa multi-cloud, mas malawak na ecosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Maasahang ulitin, may version control, ma-aautomatize
- ⚠️ Portal: Manwal na pag-click, mahirap ulitin

**Isipin ang AZD bilang**: Docker Compose para sa Azure—pinasimpleng konfigurasyon para sa kumplikadong deployments.

---

## Madalas na Itanong

**Q: Maaari ba akong gumamit ng ibang programming language?**  
A: Oo! Palitan ang `src/web/` ng Node.js, C#, Go, o anumang wika. I-update ang `azure.yaml` at Bicep nang naaayon.

**Q: Paano ako makakapagdagdag ng higit pang mga database?**  
A: Magdagdag ng isa pang SQL Database module sa `infra/main.bicep` o gumamit ng PostgreSQL/MySQL mula sa mga serbisyo ng Azure Database.

**Q: Maaari ko ba itong gamitin para sa production?**  
A: Ito ay panimulang punto. Para sa production, idagdag: managed identity, private endpoints, redundancy, backup strategy, WAF, at pinalawak na monitoring.

**Q: Paano kung gusto kong gumamit ng containers imbes na code deployment?**  
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

**Q: Maaari ko bang gamitin ang umiiral na database imbes na gumawa ng bago?**  
A: Oo, i-modify ang `infra/main.bicep` upang i-reference ang umiiral na SQL Server at i-update ang mga parameter ng connection string.

---

> **Tandaan:** Ipinapakita ng halimbawa na ito ang mga pinakamahusay na kasanayan para sa pag-deploy ng web app na may database gamit ang AZD. Kasama nito ang gumaganang kodigo, komprehensibong dokumentasyon, at mga praktikal na ehersisyo upang patatagin ang pagkatuto. Para sa production deployments, suriin ang seguridad, scaling, pagsunod, at mga kinakailangan sa gastos na partikular sa iyong organisasyon.

**📚 Pag-navigate sa Kurso:**
- ← Nakaraang: [Halimbawa ng Container Apps](../../../../examples/container-app)
- → Susunod: [Gabay sa Integrasyon ng AI](../../../../docs/ai-foundry)
- 🏠 [Tahanan ng Kurso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->