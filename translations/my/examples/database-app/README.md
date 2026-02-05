# Microsoft SQL Database နှင့် Web App ကို AZD ဖြင့် Deploy လုပ်ခြင်း

⏱️ **ခန့်မှန်းချိန်**: 20-30 မိနစ် | 💰 **ခန့်မှန်းကုန်ကျစရိတ်**: ~$15-25/လ | ⭐ **အဆင့်အတန်း**: အလယ်အလတ်

ဒီ **အပြည့်အစုံ၊ အလုပ်လုပ်တဲ့ နမူနာ** က [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ကို အသုံးပြုပြီး Microsoft SQL Database နဲ့ Python Flask web application ကို Azure ပေါ်မှာ deploy လုပ်ပုံကို ပြသထားပါတယ်။ အကုန်လုံးကို စမ်းသပ်ပြီးသား code တွေပါဝင်ပြီး အပြင်ပန်းအခြေခံမှုမလိုအပ်ပါဘူး။

## သင်လေ့လာနိုင်မည့်အရာများ

ဒီနမူနာကို ပြီးမြောက်စွာ လုပ်ဆောင်ပြီးပါက၊ သင်သည်:
- Infrastructure-as-code ကို အသုံးပြု၍ multi-tier application (web app + database) တစ်ခုကို deploy လုပ်နိုင်မည်
- Secrets များကို hardcode မလုပ်ဘဲ secure database connections များကို configure လုပ်နိုင်မည်
- Application Insights ဖြင့် application health ကို စောင့်ကြည့်နိုင်မည်
- AZD CLI ဖြင့် Azure resources များကို ထိရောက်စွာ စီမံနိုင်မည်
- Azure security, cost optimization, observability အတွက် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို လိုက်နာနိုင်မည်

## အခြေအနေအကျဉ်းချုပ်
- **Web App**: Database connectivity ပါဝင်တဲ့ Python Flask REST API
- **Database**: Sample data ပါဝင်တဲ့ Azure SQL Database
- **Infrastructure**: Bicep (modular, reusable templates) ဖြင့် provision လုပ်ထားသည်
- **Deployment**: `azd` commands ဖြင့် အပြည့်အဝ automated ဖြစ်သည်
- **Monitoring**: Logs နှင့် telemetry အတွက် Application Insights

## လိုအပ်ချက်များ

### လိုအပ်သော Tools

စတင်မတိုင်မီ၊ အောက်ပါ tools များကို install လုပ်ထားကြောင်း စစ်ဆေးပါ:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 သို့မဟုတ် အထက်)
   ```sh
   az --version
   # မျှော်မှန်းထားသော output: azure-cli 2.50.0 သို့မဟုတ် အထက်ရှိ version
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 သို့မဟုတ် အထက်)
   ```sh
   azd version
   # မျှော်မှန်းထားသော output: azd version 1.0.0 သို့မဟုတ် အထက်ရှိ version
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (local development အတွက်)
   ```sh
   python --version
   # မျှော်မှန်းထားသော output: Python 3.8 သို့မဟုတ် အထက်
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, local containerized development အတွက်)
   ```sh
   docker --version
   # မျှော်မှန်းထားသော output: Docker version 20.10 သို့မဟုတ် အထက်ရှိ version
   ```

### Azure Requirements

- **Azure subscription** ([အခမဲ့အကောင့်ဖွင့်ရန်](https://azure.microsoft.com/free/))
- သင့် subscription တွင် resources များဖန်တီးရန် ခွင့်ပြုချက်
- Subscription သို့မဟုတ် resource group တွင် **Owner** သို့မဟုတ် **Contributor** role

### အသိပညာလိုအပ်ချက်များ

ဒီနမူနာသည် **အလယ်အလတ်အဆင့်** ဖြစ်သည်။ သင်သည် အောက်ပါအရာများကို နားလည်ထားသင့်သည်:
- Command-line operations အခြေခံ
- Cloud concepts (resources, resource groups) အခြေခံ
- Web applications နှင့် databases အခြေခံ

**AZD အသစ်စတင်သူများအတွက်**: [Getting Started guide](../../docs/getting-started/azd-basics.md) ကို စတင်ပါ။

## Architecture

ဒီနမူနာသည် web application နှင့် SQL database ပါဝင်တဲ့ two-tier architecture ကို deploy လုပ်သည်:

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
- **Resource Group**: Resource အားလုံးအတွက် container
- **App Service Plan**: Linux-based hosting (B1 tier, cost efficiency အတွက်)
- **Web App**: Python 3.11 runtime နှင့် Flask application
- **SQL Server**: TLS 1.2 minimum ပါဝင်တဲ့ managed database server
- **SQL Database**: Basic tier (2GB, development/testing အတွက် သင့်တော်သည်)
- **Application Insights**: Monitoring နှင့် logging
- **Log Analytics Workspace**: Centralized log storage

**ဥပမာ**: ဒါကို စားသောက်ဆိုင် (web app) နဲ့ walk-in freezer (database) တစ်ခုလို ထင်ပါ။ Customer တွေက menu (API endpoints) ကနေ order တင်ပြီး၊ မီးဖိုချောင် (Flask app) က freezer (data) ကနေ အစိတ်အပိုင်းတွေကို ရှာဖွေတင်ဆက်ပေးပါတယ်။ စားသောက်ဆိုင်မန်နေဂျာ (Application Insights) က ဖြစ်ပျက်တာအားလုံးကို စောင့်ကြည့်ပါတယ်။

## Folder Structure

ဒီနမူနာမှာ file အားလုံးပါဝင်ပြီး အပြင်ပန်းအခြေခံမှုမလိုအပ်ပါဘူး:

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

**File တစ်ခုချင်းစီ၏ အလုပ်လုပ်ပုံ:**
- **azure.yaml**: AZD ကို deploy လုပ်ရမည့်အရာနှင့် location ကို ပြောပြသည်
- **infra/main.bicep**: Azure resources အားလုံးကို orchestration လုပ်သည်
- **infra/resources/*.bicep**: Individual resource definitions (reusability အတွက် modular)
- **src/web/app.py**: Database logic ပါဝင်တဲ့ Flask application
- **requirements.txt**: Python package dependencies
- **Dockerfile**: Deployment အတွက် containerization instructions

## Quickstart (အဆင့်ဆင့်လမ်းညွှန်)

### အဆင့် 1: Clone နှင့် Navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: `azure.yaml` နှင့် `infra/` folder ကို တွေ့ရမည်:
```sh
ls
# မျှော်မှန်းထားသည်: README.md, azure.yaml, infra/, src/
```

### အဆင့် 2: Azure နှင့် Authenticate လုပ်ပါ

```sh
azd auth login
```

ဒါက သင့် browser ကို ဖွင့်ပြီး Azure authentication အတွက် Sign in လုပ်ရန် တောင်းဆိုပါမည်။

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအတိုင်း တွေ့ရမည်:
```
Logged in to Azure.
```

### အဆင့် 3: Environment ကို Initialize လုပ်ပါ

```sh
azd init
```

**ဘာဖြစ်မည်**: AZD က သင့် deployment အတွက် local configuration တစ်ခု ဖန်တီးပါမည်။

**သင်တွေ့ရမည့် Prompts**:
- **Environment name**: အတိုချုံးနာမည်တစ်ခု ထည့်ပါ (ဥပမာ - `dev`, `myapp`)
- **Azure subscription**: Subscription ကို ရွေးချယ်ပါ
- **Azure location**: Region တစ်ခု ရွေးပါ (ဥပမာ - `eastus`, `westeurope`)

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအတိုင်း တွေ့ရမည်:
```
SUCCESS: New project initialized!
```

### အဆင့် 4: Azure Resources များကို Provision လုပ်ပါ

```sh
azd provision
```

**ဘာဖြစ်မည်**: AZD က infrastructure အားလုံးကို deploy လုပ်ပါမည် (5-8 မိနစ်ကြာ):
1. Resource group ဖန်တီးသည်
2. SQL Server နှင့် Database ဖန်တီးသည်
3. App Service Plan ဖန်တီးသည်
4. Web App ဖန်တီးသည်
5. Application Insights ဖန်တီးသည်
6. Networking နှင့် security ကို configure လုပ်သည်

**သင့်အား တောင်းဆိုမည့်အရာများ**:
- **SQL admin username**: Username တစ်ခု ထည့်ပါ (ဥပမာ - `sqladmin`)
- **SQL admin password**: Password တစ်ခု ထည့်ပါ (သိမ်းထားပါ!)

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအတိုင်း တွေ့ရမည်:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ အချိန်**: 5-8 မိနစ်

### အဆင့် 5: Application ကို Deploy လုပ်ပါ

```sh
azd deploy
```

**ဘာဖြစ်မည်**: AZD က Flask application ကို build နှင့် deploy လုပ်ပါမည်:
1. Python application ကို package လုပ်သည်
2. Docker container ကို build လုပ်သည်
3. Azure Web App သို့ push လုပ်သည်
4. Database ကို sample data ဖြင့် initialize လုပ်သည်
5. Application ကို စတင်သည်

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအတိုင်း တွေ့ရမည်:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ အချိန်**: 3-5 မိနစ်

### အဆင့် 6: Application ကို Browse လုပ်ပါ

```sh
azd browse
```

ဒါက သင့် deployed web app ကို browser မှာ `https://app-<unique-id>.azurewebsites.net` မှာ ဖွင့်ပါမည်။

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: JSON output ကို တွေ့ရမည်:
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

### အဆင့် 7: API Endpoints များကို စမ်းသပ်ပါ

**Health Check** (database connection ကို စစ်ဆေးပါ):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**မျှော်မှန်းရလဒ်**:
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

**မျှော်မှန်းရလဒ်**:
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

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: Endpoints အားလုံး JSON data ကို error မရှိဘဲ ပြန်ပေးပါမည်။

---

**🎉 ဂုဏ်ယူပါတယ်!** AZD ကို အသုံးပြု၍ database ပါဝင်တဲ့ web application တစ်ခုကို Azure ပေါ်မှာ deploy လုပ်ပြီးစီးပါပြီ။

## Configuration အနက်ရှိုင်းစွာလေ့လာခြင်း

### Environment Variables

Secrets များကို Azure App Service configuration မှာ securely စီမံထားပြီး—**source code မှာ hardcode မလုပ်ပါ**။

**AZD မှ အလိုအလျောက် Configure လုပ်ထားသည်**:
- `SQL_CONNECTION_STRING`: Encrypted credentials ပါဝင်တဲ့ database connection
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Dependency installation ကို အလိုအလျောက် enable လုပ်သည်

**Secrets များကို သိမ်းဆည်းထားသောနေရာများ**:
1. `azd provision` အတွင်း SQL credentials ကို secure prompts မှတစ်ဆင့် ထည့်သွင်းပါ
2. AZD က `.azure/<env-name>/.env` file (git-ignored) မှာ သိမ်းဆည်းထားသည်
3. AZD က Azure App Service configuration (encrypted at rest) မှာ inject လုပ်သည်
4. Application က runtime မှာ `os.getenv()` ဖြင့် ဖတ်သည်

### Local Development

Local testing အတွက် `.env` file တစ်ခုကို sample မှ ဖန်တီးပါ:

```sh
cp .env.sample .env
# သင့်ဒေသခံဒေတာဘေ့စ်ချိတ်ဆက်မှုနှင့် .env ကိုတည်းဖြတ်ပါ
```

**Local Development Workflow**:
```sh
# အခြေခံလိုအပ်ချက်များကို ထည့်သွင်းပါ
cd src/web
pip install -r requirements.txt

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ပါ
export SQL_CONNECTION_STRING="your-local-connection-string"

# အက်ပလီကေးရှင်းကို အလုပ်လုပ်ပါ
python app.py
```

**Local မှ စမ်းသပ်ပါ**:
```sh
curl http://localhost:8000/health
# မျှော်မှန်းထားသည်: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

Azure resources အားလုံးကို **Bicep templates** (`infra/` folder) မှာ သတ်မှတ်ထားသည်:

- **Modular Design**: Resource type တစ်ခုချင်းစီကို reusability အတွက် file သီးသန့်ထားသည်
- **Parameterized**: SKUs, regions, naming conventions များကို customize လုပ်နိုင်သည်
- **Best Practices**: Azure naming standards နှင့် security defaults ကို လိုက်နာထားသည်
- **Version Controlled**: Infrastructure ပြောင်းလဲမှုများကို Git မှာ track လုပ်ထားသည်

**Customization ဥပမာ**:
Database tier ကို ပြောင်းလဲရန် `infra/resources/sql-database.bicep` ကို ပြင်ဆင်ပါ:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

- အမြင့်ဆုံး တုံ့ပြန်ချိန် (>2 စက္ကန့်)

**Alert ဖန်တီးမှု ဥပမာ**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## ပြဿနာရှာဖွေခြင်း

### အများဆုံးဖြစ်နိုင်သော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

#### 1. `azd provision` "Location not available" ဖြင့် မအောင်မြင်ခြင်း

**လက္ခဏာ**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**ဖြေရှင်းနည်း**:
Azure region တစ်ခုကို အခြားရွေးချယ်ပါ သို့မဟုတ် resource provider ကို register လုပ်ပါ:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Deployment အတွင်း SQL Connection မအောင်မြင်ခြင်း

**လက္ခဏာ**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**ဖြေရှင်းနည်း**:
- SQL Server firewall သည် Azure services ကို ခွင့်ပြုထားသည် (automatic configuration)
- `azd provision` အတွင်း SQL admin password ကို မှန်ကန်စွာ ထည့်သွင်းထားသည်ကို စစ်ဆေးပါ
- SQL Server သည် အပြည့်အဝ provision လုပ်ထားသည်ကို သေချာပါ (2-3 မိနစ်ကြာနိုင်သည်)

**Connection စစ်ဆေးခြင်း**:
```sh
# Azure Portal မှ SQL Database → Query editor သို့ သွားပါ။
# သင့်အချက်အလက်များဖြင့် ချိတ်ဆက်ရန် ကြိုးစားပါ။
```

#### 3. Web App "Application Error" ပြသခြင်း

**လက္ခဏာ**:
Browser တွင် generic error page ပြသသည်။

**ဖြေရှင်းနည်း**:
Application logs ကို စစ်ဆေးပါ:
```sh
# မကြာသေးမီမှတ်တမ်းများကိုကြည့်ရှုပါ
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**အများဆုံးဖြစ်နိုင်သော အကြောင်းရင်းများ**:
- Environment variables မရှိခြင်း (App Service → Configuration ကို စစ်ဆေးပါ)
- Python package installation မအောင်မြင်ခြင်း (deployment logs ကို စစ်ဆေးပါ)
- Database initialization error (SQL connectivity ကို စစ်ဆေးပါ)

#### 4. `azd deploy` "Build Error" ဖြင့် မအောင်မြင်ခြင်း

**လက္ခဏာ**:
```
Error: Failed to build project
```

**ဖြေရှင်းနည်း**:
- `requirements.txt` တွင် syntax error မရှိကြောင်း သေချာပါ
- Python 3.11 ကို `infra/resources/web-app.bicep` တွင် သတ်မှတ်ထားသည်ကို စစ်ဆေးပါ
- Dockerfile တွင် မှန်ကန်သော base image ရှိကြောင်း သေချာပါ

**Local တွင် Debug လုပ်ခြင်း**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD Commands ကို run လုပ်သောအခါ "Unauthorized" ဖြစ်ခြင်း

**လက္ခဏာ**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**ဖြေရှင်းနည်း**:
Azure နှင့် ပြန်လည် authenticate လုပ်ပါ:
```sh
azd auth login
az login
```

Subscription တွင် Contributor role အခွင့်အာဏာရှိကြောင်း စစ်ဆေးပါ။

#### 6. Database ကုန်ကျစရိတ်များ မြင့်မားခြင်း

**လက္ခဏာ**:
မမျှော်လင့်ထားသော Azure bill။

**ဖြေရှင်းနည်း**:
- စမ်းသပ်ပြီးနောက် `azd down` ကို run လုပ်ရန် မမေ့ပါနှင့်
- SQL Database သည် Basic tier (Premium မဟုတ်) ကို အသုံးပြုထားကြောင်း စစ်ဆေးပါ
- Azure Cost Management တွင် ကုန်ကျစရိတ်များကို ပြန်လည်သုံးသပ်ပါ
- Cost alerts ကို ဖန်တီးပါ

### အကူအညီရယူခြင်း

**AZD Environment Variables အားလုံးကို ကြည့်ရှုပါ**:
```sh
azd env get-values
```

**Deployment Status ကို စစ်ဆေးပါ**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Application Logs ကို ဝင်ရောက်ကြည့်ရှုပါ**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**နောက်ထပ် အကူအညီလိုအပ်ပါသလား?**
- [AZD Troubleshooting Guide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## လက်တွေ့လေ့ကျင့်မှုများ

### လေ့ကျင့်မှု 1: Deployment ကို စစ်ဆေးပါ (Beginner)

**ရည်ရွယ်ချက်**: Resource အားလုံး deploy လုပ်ပြီး application သည် အလုပ်လုပ်နေကြောင်း အတည်ပြုပါ။

**အဆင့်များ**:
1. သင့် resource group တွင် resource အားလုံးကို စစ်ဆေးပါ:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **မျှော်လင့်ချက်**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. API endpoints အားလုံးကို စမ်းသပ်ပါ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **မျှော်လင့်ချက်**: Error မရှိဘဲ valid JSON ပြန်လာသည်

3. Application Insights ကို စစ်ဆေးပါ:
   - Azure Portal တွင် Application Insights သို့ သွားပါ
   - "Live Metrics" သို့ သွားပါ
   - Web app တွင် browser ကို refresh လုပ်ပါ
   **မျှော်လင့်ချက်**: Real-time တွင် requests တွေကို မြင်ရပါမည်

**အောင်မြင်မှု စံနှုန်း**: Resource 6-7 ခုရှိသည်၊ endpoint အားလုံး data ပြန်ပေးသည်၊ Live Metrics တွင် activity တွေကို မြင်ရသည်။

---

### လေ့ကျင့်မှု 2: API Endpoint အသစ်ထည့်ပါ (Intermediate)

**ရည်ရွယ်ချက်**: Flask application ကို endpoint အသစ်ဖြင့် တိုးချဲ့ပါ။

**Starter Code**: `src/web/app.py` တွင် လက်ရှိရှိသော endpoints

**အဆင့်များ**:
1. `src/web/app.py` ကို edit လုပ်ပြီး `get_product()` function အပြီးတွင် endpoint အသစ်ထည့်ပါ:
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

2. Updated application ကို deploy လုပ်ပါ:
   ```sh
   azd deploy
   ```

3. Endpoint အသစ်ကို စမ်းသပ်ပါ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **မျှော်လင့်ချက်**: "laptop" နှင့် ကိုက်ညီသော products ပြန်ပေးသည်

**အောင်မြင်မှု စံနှုန်း**: Endpoint အသစ်အလုပ်လုပ်သည်၊ filtered results ပြန်ပေးသည်၊ Application Insights logs တွင် မြင်ရသည်။

---

### လေ့ကျင့်မှု 3: Monitoring နှင့် Alerts ထည့်ပါ (Advanced)

**ရည်ရွယ်ချက်**: Alerts ဖြင့် proactive monitoring ကို စနစ်တကျ ပြုလုပ်ပါ။

**အဆင့်များ**:
1. HTTP 500 errors အတွက် alert ဖန်တီးပါ:
   ```sh
   # အက်ပလီကေးရှင်းအင်ဆိုက်များရင်းမြစ် ID ကိုရယူပါ
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # အချက်ပေးချက်တစ်ခုဖန်တီးပါ
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Errors ဖြစ်စေပြီး alert ကို trigger လုပ်ပါ:
   ```sh
   # မရှိတဲ့ကုန်ပစ္စည်းတစ်ခုကိုတောင်းဆိုပါ
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Alert trigger ဖြစ်ကြောင်း စစ်ဆေးပါ:
   - Azure Portal → Alerts → Alert Rules
   - သင့် email ကို စစ်ဆေးပါ (configure လုပ်ထားပါက)

**အောင်မြင်မှု စံနှုန်း**: Alert rule ဖန်တီးပြီး၊ errors တွင် trigger ဖြစ်သည်၊ notifications ရရှိသည်။

---

### လေ့ကျင့်မှု 4: Database Schema Changes (Advanced)

**ရည်ရွယ်ချက်**: Table အသစ်ထည့်ပြီး application ကို အသုံးပြုရန် ပြောင်းလဲပါ။

**အဆင့်များ**:
1. Azure Portal Query Editor မှ SQL Database သို့ ချိတ်ဆက်ပါ

2. `categories` table အသစ်ဖန်တီးပါ:
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

3. `src/web/app.py` ကို update လုပ်ပြီး category information ကို responses တွင် ထည့်ပါ

4. Deploy လုပ်ပြီး စမ်းသပ်ပါ

**အောင်မြင်မှု စံနှုန်း**: Table အသစ်ရှိသည်၊ products တွင် category information ပြသသည်၊ application အလုပ်လုပ်နေဆဲဖြစ်သည်။

---

### လေ့ကျင့်မှု 5: Caching ကို အကောင်အထည်ဖော်ပါ (Expert)

**ရည်ရွယ်ချက်**: Azure Redis Cache ကို အသုံးပြု၍ performance ကို တိုးတက်စေပါ။

**အဆင့်များ**:
1. Redis Cache ကို `infra/main.bicep` တွင် ထည့်ပါ
2. `src/web/app.py` ကို update လုပ်ပြီး product queries ကို cache လုပ်ပါ
3. Application Insights ဖြင့် performance တိုးတက်မှုကို တိုင်းတာပါ
4. Caching မရှိမီ/ပြီးနောက် response times ကို နှိုင်းယှဉ်ပါ

**အောင်မြင်မှု စံနှုန်း**: Redis deploy လုပ်ပြီး၊ caching အလုပ်လုပ်သည်၊ response times >50% တိုးတက်သည်။

**အကြံပြုချက်**: [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/) ကို စတင်ပါ။

---

## Cleanup

အဆက်မပြတ် charges မရှိစေရန်၊ အားလုံး resource များကို ဖျက်ပါ:

```sh
azd down
```

**Confirmation prompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` ကို confirm လုပ်ပါ။

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: 
- Azure Portal မှ resource အားလုံး ဖျက်ပြီး
- အဆက်မပြတ် charges မရှိ
- `.azure/<env-name>` folder ကို ဖျက်နိုင်သည်

**အခြားရွေးချယ်မှု** (infrastructure ကို ထားပြီး data ကို ဖျက်ရန်):
```sh
# အရင်းအမြစ်အုပ်စုကိုသာ ဖျက်ပါ (AZD configuration ကို ထားရှိပါ)
az group delete --name rg-<env-name> --yes
```
## Learn More

### ဆက်စပ် Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### ဒီ Course တွင် နောက်တစ်ဆင့်
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Apps ဖြင့် microservices deploy လုပ်ပါ
- **[AI Integration Guide](../../../../docs/ai-foundry)**: သင့် app တွင် AI စွမ်းရည်များ ထည့်ပါ
- **[Deployment Best Practices](../../docs/deployment/deployment-guide.md)**: Production deployment patterns

### အဆင့်မြင့် Topics
- **Managed Identity**: Password မလိုဘဲ Azure AD authentication ကို အသုံးပြုပါ
- **Private Endpoints**: Virtual network အတွင်း database connections ကို အကောင်းဆုံးလုံခြုံစေပါ
- **CI/CD Integration**: GitHub Actions သို့မဟုတ် Azure DevOps ဖြင့် deployment ကို automate လုပ်ပါ
- **Multi-Environment**: Dev, staging, production environments များကို စနစ်တကျ ပြုလုပ်ပါ
- **Database Migrations**: Schema versioning အတွက် Alembic သို့မဟုတ် Entity Framework ကို အသုံးပြုပါ

### အခြားနည်းလမ်းများနှင့် နှိုင်းယှဉ်ခြင်း

**AZD vs. ARM Templates**:
- ✅ AZD: အဆင့်မြင့် abstraction, command များရိုးရှင်းမှု
- ⚠️ ARM: ပိုမိုအသေးစိတ်၊ granular control

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, Azure services နှင့် ပေါင်းစည်းမှု
- ⚠️ Terraform: Multi-cloud support, ecosystem ပိုကြီးမား

**AZD vs. Azure Portal**:
- ✅ AZD: Repeatable, version-controlled, automatable
- ⚠️ Portal: Manual clicks, ပြန်လုပ်ရန် ခက်ခဲ

**AZD ကို**: Docker Compose for Azure ဟု စဉ်းစားပါ—complex deployments အတွက် configuration ရိုးရှင်းစေသည်။

---

## မကြာသေးမီက မေးခွန်းများ

**Q: အခြား programming language ကို အသုံးပြုနိုင်ပါသလား?**  
A: ရနိုင်ပါသည်! `src/web/` ကို Node.js, C#, Go, သို့မဟုတ် အခြားဘာသာစကားဖြင့် အစားထိုးပါ။ `azure.yaml` နှင့် Bicep ကို update လုပ်ပါ။

**Q: Database များကို ပိုမိုထည့်နိုင်ပါသလား?**  
A: SQL Database module တစ်ခုကို `infra/main.bicep` တွင် ထည့်ပါ သို့မဟုတ် Azure Database services မှ PostgreSQL/MySQL ကို အသုံးပြုပါ။

**Q: Production အတွက် အသုံးပြုနိုင်ပါသလား?**  
A: စတင်ရန်အတွက်ဖြစ်သည်။ Production အတွက် managed identity, private endpoints, redundancy, backup strategy, WAF, နှင့် monitoring တိုးတက်မှုများ ထည့်ပါ။

**Q: Code deployment အစား containers ကို အသုံးပြုလိုပါက?**  
A: [Container Apps Example](../../../../examples/container-app) ကို ကြည့်ပါ၊ Docker containers ကို အပြည့်အဝ အသုံးပြုထားသည်။

**Q: Local machine မှ database သို့ ချိတ်ဆက်လိုပါက?**  
A: SQL Server firewall တွင် သင့် IP ကို ထည့်ပါ:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Database အသစ်ဖန်တီးမလုပ်ဘဲ ရှိပြီးသား database ကို အသုံးပြုနိုင်ပါသလား?**  
A: ရနိုင်ပါသည်၊ `infra/main.bicep` တွင် ရှိပြီးသား SQL Server ကို reference လုပ်ပြီး connection string parameters ကို update လုပ်ပါ။

---

> **Note:** ဤဥပမာသည် AZD ဖြင့် web app ကို database နှင့်အတူ deploy လုပ်ရန်အတွက် အကောင်းဆုံးနည်းလမ်းများကို ပြသသည်။ အလုပ်လုပ်သော code, comprehensive documentation, နှင့် လက်တွေ့လေ့ကျင့်မှုများ ပါဝင်ပြီး သင်ယူမှုကို အတည်ပြုစေသည်။ Production deployment များအတွက် သင့်အဖွဲ့အစည်း၏ security, scaling, compliance, နှင့် cost လိုအပ်ချက်များကို ပြန်လည်သုံးသပ်ပါ။

**📚 Course Navigation:**
- ← အရင်ဆုံး: [Container Apps Example](../../../../examples/container-app)
- → နောက်တစ်ဆင့်: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Course Home](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->