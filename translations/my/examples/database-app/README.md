# AZD ဖြင့် Microsoft SQL ဒေတာဘေ့စ်နှင့် Web App ကို Deploy လုပ်ခြင်း

⏱️ **ခန့်မှန်းချိန်**: 20-30 မိနစ် | 💰 **ခန့်မှန်းကျသင့်ငွေ**: ~$15-25/လ | ⭐ **ဒွိယ အဆင့်**: အလယ်အလတ်

ဤ **ပြည့်စုံပြီး လုပ်ဆောင်နိုင်သော နမူနာ** သည် [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ကို အသုံးပြုကာ Python Flask web application ကို Microsoft SQL Database နှင့်အတူ Azure ပေါ်သို့ deploy လုပ်ပုံကို ပြသည်။ ကုဒ်အားလုံး ပါဝင်ပြီး စမ်းသပ်ပြီးသားဖြစ်သည်—ပြင်ပ အလားအလာမလိုအပ်ပါ။

## သင်ဘာများ သင်ယူမလဲ

ဤနမူနာကို ပြီးမြောက်အောင်လုပ်လျှင် သင်သည်:
- multi-tier application (web app + database) ကို infrastructure-as-code ဖြင့် deploy လုပ်နိုင်ခြင်း
- secret များကို source code တွင် မထည့်ဘဲ database ချိတ်ဆက်မှုများကို လုံခြုံစွာ ဆက်သွယ်ရမည်ဖြစ်စေရန် ပြုလုပ်နိုင်ခြင်း
- Application Insights ဖြင့် application အခြေအနေကို ထိန်းကြည့်နိုင်ခြင်း
- AZD CLI ဖြင့် Azure resource များကို ထိရောက်စွာ စီမံခန့်ခွဲနိုင်ခြင်း
- လုံခြုံရေး၊ ကုန်ကျစရိတ် ထိရောက်မှုနှင့် observability အတွက် Azure ၏ အကောင်းဆုံး လမ်းစဉ်များကို လိုက်နာနိုင်ခြင်း

## နမူနာ အကျဉ်းချုံး
- **Web App**: database ချိတ်ဆက်နိုင်သော Python Flask REST API
- **Database**: sample data ပါရှိသည့် Azure SQL Database
- **Infrastructure**: Bicep အသုံးပြု၍ provision (modular, reusable templates)
- **Deployment**: `azd` commands ဖြင့် အလိုအလျောက် စီစဉ်ပြီး deploy
- **Monitoring**: logs နှင့် telemetry အတွက် Application Insights

## မလိုအပ်မဖြစ် စက်ပစ္စည်းများ

### လိုအပ်သော ကိရိယာများ

စတင်မည်မီ အောက်ပါ ကိရိယာများ ထည့်ထားကြောင်း အတည်ပြုပါ။

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 သို့မဟုတ် အထက်)
   ```sh
   az --version
   # မျှော်မှန်းထားသော ထွက်ရလဒ်: azure-cli 2.50.0 သို့မဟုတ် ထက်မြင့်သော
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 သို့မဟုတ် အထက်)
   ```sh
   azd version
   # မျှော်လင့်ထားသော ထွက်ရှိမှု: azd version 1.0.0 သို့မဟုတ် ထိုထက်မြင့်သော ဗားရှင်း
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (local development အတွက်)
   ```sh
   python --version
   # မျှော်မှန်းထားသော ထွက်ရလဒ်: Python 3.8 သို့မဟုတ် အထက်
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, local containerized development အတွက်)
   ```sh
   docker --version
   # မျှော်မှန်းထားသော အထွက်: Docker ဗားရှင်း 20.10 သို့မဟုတ် အထက်
   ```

### Azure လိုအပ်ချက်များ

- အကျုံးဝင်သော **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- သင်၏ subscription တွင် resource များ ဖန်တီးခွင့်
- subscription သို့မဟုတ် resource group အပေါ် **Owner** သို့မဟုတ် **Contributor** အခွင့်အရေး

### မူလ သိရှိထားရမည့် အချက်များ

ဤနမူနာသည် **အလယ်အလတ်အဆင့်** ဖြစ်သည်။ အောက်ပါများကို နားလည်ထားသင့်သည်။
- အခြေခံ command-line လုပ်ဆောင်ချက်များ
- cloud အခြေခံ အယူအဆများ (resources, resource groups)
- web applications နှင့် databases အကြောင်း အခြေခံ နားလည်မှု

**AZD အသစ်လား?** အရင်ဆုံး [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) ကို ဖတ်ရှုပါ။

## မော်ဒယ် ပုံသဏ္ဍာန်

ဤနမူနာသည် web application နှင့် SQL database ပါရှိသည့် two-tier architecture ကို deploy လုပ်သည်။

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
- **Resource Group**: အရာအားလုံးကို ထည့်သွင်းထားသော ထုပ်ပိုးတစ်ခု
- **App Service Plan**: Linux-based hosting (ကုန်ကျစရိတ် အစီအမံအတွက် B1 tier)
- **Web App**: Python 3.11 runtime နှင့် Flask application
- **SQL Server**: TLS 1.2 အနည်းဆုံးဖြင့် စီမံထားသော database server
- **SQL Database**: Basic tier (2GB, development/testing အတွက် အသင့်)
- **Application Insights**: မော်နစ်ရင်းနှင့် logging
- **Log Analytics Workspace**: log များကို စုပြုံသိမ်းဆည်းရန်

**နမူနာမြင်ကွင်း**: ၎င်းကို စားသောက်ဆိုင် (web app) နှင့် ဂိုဒေါင် အအေးခန်း (database) တို့နှင့် နှိုင်းယှဉ်နိုင်သည်။ ဖောက်သည်များသည် မီနူး (API endpoints) မှ ရုပ်ပိုင်းဆိုင်ရာ မှာယူပြီး မီးဖိုချောင် (Flask app) က ဂိုဒေါင်ထဲမှ ပစ္စည်းများ (data) များကို ယူသောက်သည်။ စားသောက်ဆိုင် မန်နေဂျာ (Application Insights) က ဖြစ်ပျက်သမျှကို စည်းကြပ်စောင့်ကြည့်သည်။

## ဖိုင် ဖွဲ့စည်းပုံ

ဤနမူနာတွင် ဖိုင်အားလုံး ပါဝင်သည်—ပြင်ပ အလားအလာ မလိုအပ်ပါ။

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

**ဖိုင်တိုင်း ဘာလုပ်သလဲ:**
- **azure.yaml**: AZD သို့ ဘာ deploy မည်နှင့် ဘယ်နေရာသို့ ဆိုတာ အကြောင်းပြသည်
- **infra/main.bicep**: Azure resource များအားလုံးကို စုပေါင်းညှိနှိုင်းသည်
- **infra/resources/*.bicep**: တစ်ခုချင်း resource သတ်မှတ်ချက်များ (ပြန်လည်အသုံးပြုနိုင်ရန် modular)
- **src/web/app.py**: database logic ပါဝင်သည့် Flask application
- **requirements.txt**: Python package များ အလိုအလျောက် ထည့်ရန်စာရင်း
- **Dockerfile**: deployment အတွက် containerization အညွှန်း

## Quickstart (အဆင့်‌بလိုက်)

### အဆင့် 1: Clone လုပ်၍ သွားပါ

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: `azure.yaml` နှင့် `infra/` ဖိုလ်ဒါကို တွေ့ရသည်ကို အတည်ပြုပါ။
```sh
ls
# မျှော်လင့်ထားသည်: README.md, azure.yaml, infra/, src/
```

### အဆင့် 2: Azure သို့ authenticate ပြုလုပ်ပါ

```sh
azd auth login
```

ဤကိရိယာသည် သင့် browser ကို ဖွင့်ပေးပြီး Azure authentication ကို ပြုလုပ်စေနိုင်သည်။ သင့် Azure အကောင့်ဖြင့် စာရင်းသွင်းပါ။

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါစာမျက်နှာကို မြင်ရပါမည်။
```
Logged in to Azure.
```

### အဆင့် 3: ပတ်ဝန်းကျင်ကို initialize ပြုလုပ်ပါ

```sh
azd init
```

**ဖြစ်ပေါ်သည့်အရာ**: AZD သည် သင့် deployment အတွက် local configuration ကို ဖန်တီးပေးသည်။

**သင်မြင်ရမည့် prompt များ**:
- **Environment name**: အတိုချုံးအမည် တစ်ခု ထည့်ပါ (ဥပမာ `dev`, `myapp`)
- **Azure subscription**: စာရင်းမှ သင့် subscription ကို ရွေးချယ်ပါ
- **Azure location**: ဒေသတစ်ခုရွေးချယ်ပါ (ဥပမာ `eastus`, `westeurope`)

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအရာများကို မြင်ရပါမည်။
```
SUCCESS: New project initialized!
```

### အဆင့် 4: Azure Resources များကို Provision လုပ်ပါ

```sh
azd provision
```

**ဖြစ်ပေါ်သည့်အရာ**: AZD သည် အကာအကွယ်အားလုံးကို deploy လုပ်သည် (5-8 မိနစ် ကြာနိုင်သည်)။
1. Resource group ဖန်တီးသည်
2. SQL Server နှင့် Database ဖန်တီးသည်
3. App Service Plan ဖန်တီးသည်
4. Web App ဖန်တီးသည်
5. Application Insights ဖန်တီးသည်
6. networking နှင့် security ကို စီစဉ်သည်

**သင့်အား မေးမြန်းမည့်အချက်များ**:
- **SQL admin username**: username တစ်ခု ထည့်ပါ (ဥပမာ `sqladmin`)
- **SQL admin password**: ခိုင်မာသည့် password တစ်ခု ထည့်ပါ (သိမ်းဆည်းပါ!)

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအရာများကို မြင်ရပါမည်။
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

**ဖြစ်ပေါ်သည့်အရာ**: AZD သည် သင့် Flask application ကို build ပြီး deploy လုပ်ပေးသည်။
1. Python application ကို package ပြုလုပ်သည်
2. Docker container ကို build လုပ်သည်
3. Azure Web App သို့ push လုပ်သည်
4. Database ကို sample data ဖြင့် initial ပြုလုပ်သည်
5. Application ကို စတင်သွားစေသည်

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အောက်ပါအရာများကို မြင်ရပါမည်။
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ အချိန်**: 3-5 မိနစ်

### အဆင့် 6: Application ကို Browser ဖြင့် ကြည့်ရှုပါ

```sh
azd browse
```

ဤကိရိယာသည် သင့် deploy ပြီးသော web app ကို browser တွင် `https://app-<unique-id>.azurewebsites.net` မှာ ဖွင့်ပေးမည်။

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: JSON output တစ်ခုကို မြင်ရပါမည်။
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

**Health Check** (database ချိတ်ဆက်မှုကို စစ်ဆေးရန်):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**မျှော်လင့်ထားသည့် ပြန်လည်ဖြေပေးမှု**:
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

**မျှော်လင့်ထားသည့် ပြန်လည်ဖြေပေးမှု**:
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

**✓ အောင်မြင်မှု စစ်ဆေးမှု**: အားလုံး endpoints များသည် error မရှိပဲ JSON data ပြန်လည်ပေးပါသည်။

---

**🎉 ဂုဏ်ပြုပါတယ်!** သင်သည် AZD အသုံးပြုကာ Azure သို့ web application နှင့် database ကို အောင်မြင်စွာ deploy ပြီးပါပြီ။

## ဖော်ပြချက် အနက်ရှုခြင်း (Configuration Deep-Dive)

### ပတ်ဝန်းကျင် အပြံဳး( Environment Variables )

Secrets များကို Azure App Service configuration ဖြင့် လုံခြုံစွာ စီမံထားသည်—**source code တွင် ခိုင်မာစွာ မထည့်ရပါ**။

**AZD မှ အလိုအလျောက် ပြုလုပ်ပေးသည်**:
- `SQL_CONNECTION_STRING`: encrypted credentials ပါရှိသည့် database connection
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: dependency အလိုအလျောက် 설치 လုပ်စေရန် စနစ် ဖွင့်သည်

**Secrets များ သိမ်းဆည်းရာနေရာများ**:
1. `azd provision` လုပ်သည့်အခါ SQL credential များကို secure prompts မှတဆင့် ပေးရမည်
2. AZD သည် ၎င်းတို့ကို သင့် local `.azure/<env-name>/.env` ဖိုင်အတွင်းသို့ သိမ်းဆည်းသည် (git-ignored)
3. AZD သည် ၎င်းတို့ကို Azure App Service configuration ထဲသို့ inject လုပ်သည် (at rest တွင် encrypted)
4. Application သည် runtime တုန့်ပြန်ချိန်တွင် `os.getenv()` ဖြင့် ဖတ်ယူသည်

### local Development

local စမ်းသပ်မှုအတွက် `.env` ဖိုင်ကို နမူနာမှ ဖန်တီးပါ။

```sh
cp .env.sample .env
# .env ကို သင့်ဒေတာဘေ့စ်ချိတ်ဆက်မှုဖြင့် တည်းဖြတ်ပါ
```

**Local Development Workflow**:
```sh
# လိုအပ်သော ပက်ကေ့ဂျ်များကို တပ်ဆင်ပါ
cd src/web
pip install -r requirements.txt

# ပတ်ဝန်းကျင် အပြောင်းအလဲအချက်များကို သတ်မှတ်ပါ
export SQL_CONNECTION_STRING="your-local-connection-string"

# အပလီကေးရှင်းကို လည်ပတ်အောင် လုပ်ပါ
python app.py
```

**စာတွေကို local တွင် စမ်းသပ်ရန်**:
```sh
curl http://localhost:8000/health
# မျှော်မှန်းချက်: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

Azure resources အားလုံးကို **Bicep templates** (`infra/` ဖိုလ်ဒါ) တွင် သတ်မှတ်ထားသည်။

- **Modular Design**: resource မျိုးစုံကို ပြန်လည်အသုံးပြုနိုင်ရန် တစ်ဖိုင်စီထားသည်
- **Parameterized**: SKUs, regions, နှင့် နာမည်ပုံစံများကို မိမိလိုအပ်သလို ပြောင်းနိုင်သည်
- **Best Practices**: Azure naming standards နှင့် security defaults ကို လိုက်နာထားသည်
- **Version Controlled**: Infrastructure ပြင်ဆင်မှုများကို Git တွင် ထိန်းသိမ်းထားသည်

**ပြင်ဆင်မှု ဥပမာ**:
database tier ကို ပြောင်းလိုပါက `infra/resources/sql-database.bicep` ကို ပြင်ပါ။
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## လုံခြုံရေး အကောင်းဆုံး လုပ်ဆောင်ချက်များ

ဤနမူနာသည် Azure ၏ လုံခြုံရေး အကောင်းဆုံး လမ်းစဉ်များကို လိုက်နာထားသည်။

### 1. **Source Code ထဲတွင် Secret မထည့်ရန်**
- ✅ Credentials များကို Azure App Service configuration မှာ သိမ်းဆည်းထားသည် (encrypted)
- ✅ `.env` ဖိုင်များကို `.gitignore` မှတဆင့် Git မှ ပယ်ထားသည်
- ✅ Secrets များကို provision အကာအကွယ် အချိန်တွင် secure parameters ဖြင့် ပေးပို့သည်

### 2. **Encrypted Connections**
- ✅ SQL Server အတွက် TLS 1.2 အနည်းဆုံး
- ✅ Web App အတွက် HTTPS-only အား တင်းကျပ်စိတ်ထား
- ✅ Database ချိတ်ဆက်မှုများသည် encrypted channel များ အသုံးပြုသည်

### 3. **Network Security**
- ✅ SQL Server firewall ကို Azure services များသာ ခွင့်ပြုရန် စီစဉ်ထားသည်
- ✅ Public network access ကို ကန့်သတ်ထားသည် (Private Endpoints ဖြင့် ပိုမိုတင်းကျပ်နိုင်သည်)
- ✅ Web App တွင် FTPS ကို ပိတ်ထားသည်

### 4. **Authentication & Authorization**
- ⚠️ **လက်ရှိ**: SQL authentication (username/password)
- ✅ **Production အတွက် အကြံပြုချက်**: password မလိုသော authentication အတွက် Azure Managed Identity ကို အသုံးပြုရန်

**Managed Identity သို့ အဆင့်မြှင့်ရန်**:
1. Web App တွင် managed identity ကို ဖွင့်ပါ
2. identity ကို SQL ပေါ်၌ ခွင့်ပြုချက်ပေးပါ
3. connection string ကို managed identity အသုံးပြုရန် ပြင်ဆင်ပါ
4. password-based authentication ကို ဖျက်ပစ်ပါ

### 5. **Auditing & Compliance**
- ✅ Application Insights သည် request နှင့် error အားလုံးကို မှတ်တမ်းတင်သည်
- ✅ SQL Database auditing ကို ဖွင့်ထားသည် (compliance အတွက် ပြင်ဆင်နိုင်သည်)
- ✅ အရင်းအမြစ်အားလုံးကို tagging ဖြင့် governance အတွက် ထားရှိသည်

**Production သို့ သွားမည်မတိုင်မှီ လုံခြုံရေး စစ်ဆေးရန် စာရင်း**:
- [ ] Azure Defender for SQL ကို ဖွင့်ပါ
- [ ] SQL Database အတွက် Private Endpoints ကို ချိန်ညှိပါ
- [ ] Web Application Firewall (WAF) ကို ဖွင့်ပါ
- [ ] secret rotation အတွက် Azure Key Vault ကို အသုံးပြုပါ
- [ ] Azure AD authentication ကို ဖွင့်ပါ
- [ ] အရင်းအမြစ်အားလုံးအတွက် diagnostic logging ကို ဖွင့်ပါ

## ကုန်ကျစရိတ် ထိရောက်စွာ အသုံးချခြင်း

**ခန့်မှန်း လစဉ် ကုန်ကျစရိတ်** (November 2025 အခြေချ):
| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 ကုန်ကျစရိတ် လျော့ချနိုင်စရာ အကြံပြုချက်များ**:

1. **သင်ယူရန် Free Tier ကို အသုံးပြုပါ**:
   - App Service: F1 tier (free, အချိန်ကန့်သတ်)
   - SQL Database: Azure SQL Database serverless ကို အသုံးပြုပါ
   - Application Insights: 5GB/month အထိ free ingestion

2. **မလိုအပ်ချိန်တွင် resources များကို ပိတ်ထားပါ**:
   ```sh
   # ဝက်ဘ်အက်ပ်ကို ပိတ်ပါ (ဒေတာဘေ့စ်အတွက် ကုန်ကျမှုများ ဆက်လက်ဖြစ်နေပါသည်)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # လိုအပ်သည့်အချိန်တွင် ပြန်စတင်ပါ
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **စမ်းသပ်ပြီးနောက် အားလုံးဖျက်ပစ်ပါ**:
   ```sh
   azd down
   ```
   ဤနည်းလမ်းသည် အရင်းအမြစ်အားလုံးကို ဖျက်ပစ်ပြီး စွဲချက်များ ရပ်တန့်စေပါသည်။

4. **Development နှင့် Production SKUs ခွဲခြားအသုံးပြုခြင်း**:
   - **Development**: ဤနမူနာတွင် အသုံးပြုထားသည့် Basic tier
   - **Production**: redundancy ပါရှိသည့် Standard/Premium tier

**ကုန်ကျစရိတ် ကြည့်ရှုခြင်း**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) တွင် ကုန်ကျစရိတ်ကို ကြည့်ရှုပါ
- မမျှော်လင့်မှုပြဿနာများ ရှောင်ရန် cost alerts များ တပ်ဆင်ပါ
- resource များအားလုံးကို `azd-env-name` အဖြစ် tag တပ်၍ tracking လုပ်ပါ

**Free Tier အစားထိုးရွေးချယ်စရာ**:
သင်ယူရင်းတွင် `infra/resources/app-service-plan.bicep` ကို ပြင်ဆင်နိုင်သည်။
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**မှတ်ချက်**: Free tier သည် ကန့်သတ်ချက်များရှိသည် (နေ့စဉ် CPU 60 မိနစ်၊ always-on မရှိ)

## မော်နစ်ရင်းနှင့် ကြည့်ရှုနိုင်မှု (Monitoring & Observability)

### Application Insights ပေါင်းစည်းခြင်း

ဤနမူနာတွင် စုံလင်စွာ မော်နစ်ရင်းလုပ်ဆောင်နိုင်ရန် **Application Insights** ပါဝင်သည်။

**မော်နစ်ရင်း အရာများ**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ Application errors နှင့် exceptions
- ✅ Flask app မှ custom logging
- ✅ Database ချိတ်ဆက်မှု ကျန်းမာရေး
- ✅ performance metrics (CPU, memory)

**Application Insights ကို မည်သို့ဝင်ရောက်ကြည့်မည်**:
1. [Azure Portal](https://portal.azure.com) ကို ဖွင့်ပါ
2. သင့် resource group (`rg-<env-name>`) သို့ သွားပါ
3. Application Insights resource (`appi-<unique-id>`) ကို နှိပ်ပါ

**အသုံးဝင်သော Queries** (Application Insights → Logs):

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

**SQL Database auditing ကို ဖွင့်ထားသည်** အောက်ပါအချက်များကို ထိန်းသိမ်းရန်:
- Database access ပုံစံများ
- မအောင်မြင်သော login ကြိုးပမ်းမှုများ
- Schema ပြောင်းလဲမှုများ
- Data access (compliance အတွက်)

**Audit Logs များကို ကြည့်ရှုရန်**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics workspace တွင် logs များ ကြည့်ပါ

### အချိန်နှင့်တပြေးညီ မော်နစ်ရင်း

**Live Metrics ကြည့်ရန်**:
1. Application Insights → Live Metrics
2. requests, failures, နှင့် performance များကို အချိန်နှင့်တပြေးညီ ကြည့်ရှုနိုင်သည်

**Alerts တပ်ဆင်ရန်**:
critical ဖြစ်စေသော အချက်များအတွက် alerts များ ပြုလုပ်ပါ။
- HTTP 500 errors > 5 within 5 minutes
- Database connection failures
- တုံ့ပြန်ချိန်မြင့် (>2 စက္ကန့်)

**Alert ဖန်တီးခြင်း ဥပမာ**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## ပြဿနာဖြေရှင်းခြင်း

### အထွေထွေ ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

#### 1. `azd provision` သည် "Location not available" ဖြင့် မအောင်မြင်ခြင်း

**လက္ခဏာ**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**ဖြေရှင်းနည်း**:
အခြား Azure ဒေသတစ်ခုကို ရွေးချယ်ပါ သို့မဟုတ် resource provider ကို register လုပ်ပါ။
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL ချိတ်ဆက်မှု တပ်ဆင်ချိန် မအောင်မြင်ခြင်း

**လက္ခဏာ**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**ဖြေရှင်းနည်း**:
- SQL Server firewall သည် Azure services များအား ခွင့်ပြုထားကြောင်း စစ်ဆေးပါ (အလိုအလျောက် ဖွဲ့စည်းပေးထားသည်)
- `azd provision` အတွင်း SQL admin password ကို မှန်ကန်စွာ ထည့်သွင်းထားကြောင်း စစ်ဆေးပါ
- SQL Server သည် အပြည့်အဝ provision လုပ်ပြီးကြောင်း သေချာစေရန် (2-3 မိနစ်ခန့် ကြာနိုင်သည်)

**ချိတ်ဆက်မှု အတည်ပြုရန်**:
```sh
# Azure Portal မှာ SQL Database → Query တည်းဖြတ်ကိရိယာကို သွားပါ။
# သင့်အသုံးပြုသူ အချက်အလက်များဖြင့် ချိတ်ဆက်ကြည့်ပါ။
```

#### 3. Web App တွင် "Application Error" ပြပေါ်ခြင်း

**လက္ခဏာ**:
Browser သည် အထွေထွေအမှား စာမျက်နှာကို ပြသသည်။

**ဖြေရှင်းနည်း**:
application logs များကို စစ်ဆေးပါ:
```sh
# လတ်တလော မှတ်တမ်းများကို ကြည့်ရန်
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**ပုံမှန် ဖြစ်စေသောအကြောင်းရင်းများ**:
- Environment variables မရှိခြင်း (App Service → Configuration တွင် စစ်ဆေးပါ)
- Python package တပ်ဆင်ခြင်း မအောင်မြင်ခြင်း (deployment logs ကို စစ်ဆေးပါ)
- Database initialization အမှား (SQL ချိတ်ဆက်မှုကို စစ်ဆေးပါ)

#### 4. `azd deploy` သည် "Build Error" ဖြင့် မအောင်မြင်ခြင်း

**လက္ခဏာ**:
```
Error: Failed to build project
```

**ဖြေရှင်းနည်း**:
- `requirements.txt` တွင် syntax အမှား မရှိကြောင်း သေချာစေပါ
- `infra/resources/web-app.bicep` တွင် Python 3.11 ကို စာရေးပြထားကြောင်း စစ်ဆေးပါ
- Dockerfile တွင် မှန်ကန်သော base image သတ်မှတ်ထားကြောင်း အတည်ပြုပါ

**local တွင် Debug ပြုလုပ်ရန်**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD commands လုပ်ရာ "Unauthorized" ဖြစ်ခြင်း

**လက္ခဏာ**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**ဖြေရှင်းနည်း**:
Azure သို့ ပြန်လည် authentication လုပ်ပါ:
```sh
azd auth login
az login
```

subscription တွင် မှန်ကန်သော ခွင့်ပြုချက်များ (Contributor role) ရှိကြောင်း စစ်ဆေးပါ။

#### 6. Database ကုန်ကျစရိတ် မြင့်မားခြင်း

**လက္ခဏာ**:
မျှော်လင့်မထားသော Azure ဘီလ်။

**ဖြေရှင်းနည်း**:
- စမ်းသပ်ပြီးနောက် `azd down` မကျင့်သွားပါက စစ်ဆေးပါ
- SQL Database သည် Basic tier ကို အသုံးပြုနေကြောင်း (Premium မဟုတ်) အတည်ပြုပါ
- Azure Cost Management တွင် ကုန်ကျစရိတ်များကို ပြန်လည်ဆန်းစစ်ပါ
- ကုန်ကျစရိတ် အချက်ပေးချက်များ (cost alerts) ကို တပ်ဆင်ပါ

### ကူညီမှု ရယူခြင်း

**AZD Environment Variables အားလုံး ကြည့်ရန်**:
```sh
azd env get-values
```

**Deployment အခြေအနေ စစ်ဆေးရန်**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Application logs ကို ဝင်ကြည့်ရန်**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**ထပ်မံအကူအညီ လိုပါသလား?**
- [AZD ပြဿနာဖြေရှင်းခြင်း လမ်းညွှန်](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service ပြဿနာဖြေရှင်းခြင်း](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL ပြဿနာဖြေရှင်းခြင်း](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## လက်တွေ့ လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: သင်၏ Deployment ကို အတည်ပြုပါ (အခြေခံ)

**ရည်ရွယ်ချက်**: အရင်းအမြစ်များ အားလုံး တပ်ဆင်ပြီး application က အလုပ်လုပ်နေကြောင်း အတည်ပြုပါ။

**အဆင့်များ**:
1. သင်၏ resource group ထဲရှိ resource အားလုံးကို စာရင်းထုတ်ပါ:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **မျှော်မှန်းချက်**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. API endpoints အားလုံးကို စမ်းသပ်ပါ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **မျှော်မှန်းချက်**: အားလုံးသည် အမှားမရှိဘဲ မှန်ကန်သော JSON ကို ပြန်ပေးသင့်သည်

3. Application Insights ကို စစ်ဆေးပါ:
   - Azure Portal တွင် Application Insights သို့ သွားပါ
   - "Live Metrics" သို့ သွားပါ
   - web app ပေါ်တွင် သင့် browser ကို refresh ပြုလုပ်ပါ
   **မျှော်မှန်းချက်**: request များကို တိုက်ရိုက် အချိန်တွင် မြင်ရပါမည်

**အောင်မြင်မှု စံသတ်မှတ်ချက်**: resource 6-7 ခု ရှိရမည်၊ အားလုံး endpoint များ ဒေတာ ပြန်ပေးရမည်၊ Live Metrics တွင် လှုပ်ရှားမှု တွေ့ရမည်။

---

### လေ့ကျင့်ခန်း 2: API Endpoint အသစ် တစ်ခု ထည့်ရန် (အလယ်အလတ်)

**ရည်ရွယ်ချက်**: Flask application ကို endpoint အသစ်ဖြင့် တိုးချဲ့ပါ။

**စတင်ရန်ကုဒ်**: လက်ရှိ endpoints များသည် `src/web/app.py` တွင်ရှိသည်

**အဆင့်များ**:
1. `src/web/app.py` ကို ပြင်ဆင်ပြီး `get_product()` function ထံနောက်ပိုင်းတွင် endpoint အသစ် တစ်ခု ထည့်ပါ:
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

2. အပ်ဒိတ်လုပ်ထားသော application ကို deploy ပါ:
   ```sh
   azd deploy
   ```

3. endpoint အသစ်ကို စမ်းသပ်ပါ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **မျှော်မှန်းချက်**: "laptop" နှင့် ကိုက်ညီသော products များကို ပြန်ပေးရမည်

**အောင်မြင်မှု စံသတ်မှတ်ချက်**: endpoint အသစ် အလုပ်လုပ်မည်၊ စစ်ထုတ်ထားသော ရလဒ်များ ပြန်ပေးမည်၊ Application Insights logs တွင် ဖော်ပြမည်။

---

### လေ့ကျင့်ခန်း 3: မော်နီတာနှင့် အချက်ပေးချက်များ ထည့်ရန် (အဆင့်မြင့်)

**ရည်ရွယ်ချက်**: အချက်ပေးချက်များနှင့် အချိန်မီ မော်နီတာစနစ် တပ်ဆင်ပါ။

**အဆင့်များ**:
1. HTTP 500 အမှားများအတွက် အချက်ပေးမှုတစ်ခု ဖန်တီးပါ:
   ```sh
   # Application Insights အရင်းအမြစ် ID ကို ရယူပါ
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # သတိပေးချက် တစ်ခု ဖန်တီးပါ
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. အမှားများဖြစ်စေပြီး အချက်ပေးမှုကို စမ်းသပ်ပေးပါ:
   ```sh
   # မရှိသော ထုတ်ကုန်တစ်ခုကို တောင်းဆိုပါ
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. အချက်ပေးမှု ပေါက်ခဲ့သည်/မဟုတ်သည်ကို စစ်ဆေးပါ:
   - Azure Portal → Alerts → Alert Rules
   - သင့် အီးမေးကို စစ်ဆေးပါ (တပ်ဆင်ထားပါက)

**အောင်မြင်မှု စံသတ်မှတ်ချက်**: Alert rule တစ်ခု ဖန်တီးထားပြီး အမှားများဖြစ်သောအခါ လှုပ်ရှားမှုကို ဖမ်းယူကာ အသိပေးချက်များ လက်ခံရရှိသည်။

---

### လေ့ကျင့်ခန်း 4: Database Schema ပြင်ဆင်ခြင်း (အဆင့်မြင့်)

**ရည်ရွယ်ချက်**: ဇယား အသစ် တစ်ခု ထည့်၍ application ကို အသုံးပြုနိုင်အောင် ပြင်ဆင်ပါ။

**အဆင့်များ**:
1. Azure Portal Query Editor မှတဆင့် SQL Database ကို ချိတ်ဆက်ပါ

2. `categories` ဇယား အသစ် တစ်ခု ဖန်တီးပါ:
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

3. ပြန်လည်ပေးပို့မှုများတွင် category အချက်အလက်များ ထည့်သွင်းရန် `src/web/app.py` ကို အပ်ဒိတ်လုပ်ပါ

4. Deploy ပြီး စမ်းသပ်ပါ

**အောင်မြင်မှု စံသတ်မှတ်ချက်**: ဇယား အသစ် ရှိပြီး products များတွင် category အချက်အလက် ပြသပြီး application အလုပ်လုပ်နေဆဲဖြစ်ရမည်။

---

### လေ့ကျင့်ခန်း 5: Caching ကို အကောင်အထည်ဖော်ခြင်း (အထူးကျွမ်းကျင်)

**ရည်ရွယ်ချက်**: လုပ်ဆောင်ချက်မြင့်တင်ရေးအတွက် Azure Redis Cache ထည့်ပါ။

**အဆင့်များ**:
1. `infra/main.bicep` တွင် Redis Cache ကို ထည့်ပါ
2. product queries များကို cache မည်အောင် `src/web/app.py` ကို အပ်ဒိတ်လုပ်ပါ
3. Application Insights ဖြင့် အလုပ်လုပ်မှု တိုးတက်မှုကို တိုင်းတာပါ
4. Caching မတိုင်ခင်/ပြီးနောက် response time များကို နှိုင်းယှဉ်ပါ

**အောင်မြင်မှု စံသတ်မှတ်ချက်**: Redis သည် တပ်ဆင်ပြီး caching အလုပ်လုပ်သည်၊ response time များသည် 50% ထက်ပို တိုးတက်ရမည်။

**အကြံပြုချက်**: [Azure Cache for Redis စာတမ်း](https://learn.microsoft.com/azure/azure-cache-for-redis/) နှင့် စတင်ပါ။

---

## ရှင်းလင်းရေး

ဆက်လက်စရိတ် ခံရမှု မဖြစ်စေရန် အလုပ်ပြီးနောက် resource အားလုံးကို ဖျက်ပစ်ပါ:

```sh
azd down
```

**အတည်ပြုမေးခွန်း**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` ကို အတည်ပြုရန် ရိုက်ထည့်ပါ။

**✓ အောင်မြင်မှု စစ်ဆေးချက်**: 
- Azure Portal မှ resource အားလုံး ဖျက်သိမ်းထားပြီဖြစ်ရမည်
- ဆက်လက်တောင်းခံခံရမှု မရှိရပါ
- ဒေသိယ `.azure/<env-name>` ဖိုလ်ဒါကို ဖျက်နိုင်သည်

**အခြားရွေးချယ်စရာ** (အင်ဖရာစထ်ချာကို ထားပြီး ဒေတာကို ဖျက်ရန်):
```sh
# အရင်းအမြစ်အုပ်စုကိုပဲ ဖျက်ပါ (AZD ဆက်တင်ကို ထားပါ)
az group delete --name rg-<env-name> --yes
```
## နောက်ထပ် သိရှိရန်

### ဆက်စပ် စာတမ်းများ
- [Azure Developer CLI စာတမ်း](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database စာတမ်း](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service စာတမ်း](https://learn.microsoft.com/azure/app-service/)
- [Application Insights စာတမ်း](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep ဘာသာစကား ကိုးကားချက်](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### ဒီ သင်တန်းတွင် နောက်တိုးအဆင့်များ
- **[Container Apps ဥပမာ](../../../../examples/container-app)**: Azure Container Apps ဖြင့် microservices များ deploy လုပ်ပါ
- **[AI Integration လမ်းညွှန်](../../../../docs/ai-foundry)**: သင့် app တွင် AI လုပ်ဆောင်ချက်များ ထည့်ပါ
- **[Deployment အကောင်းဆုံး လမ်းညွှန်](../../docs/chapter-04-infrastructure/deployment-guide.md)**: ထုတ်လုပ်မှု deployment မျိုးစံများ

### အဆင့်မြင့် ခေါင်းစဉ်များ
- **Managed Identity**: စကားဝှက်များ ဖယ်ရှားပြီး Azure AD authentication ကို အသုံးပြုပါ
- **Private Endpoints**: Virtual network အတွင်း database ချိတ်ဆက်မှုများကို လုံခြုံစေပါ
- **CI/CD Integration**: GitHub Actions သို့မဟုတ် Azure DevOps ဖြင့် deployments ကို အလိုအလျောက်လုပ်ဆောင်ပါ
- **Multi-Environment**: dev, staging, production စသည့် ပတ်ဝန်းကျင်များ ဖန်တီးပါ
- **Database Migrations**: schema versioning အတွက် Alembic သို့မဟုတ် Entity Framework ကို အသုံးပြုပါ

### အခြားနည်းလမ်းများနှင့် နှိုင်းယှဉ်ချက်

**AZD နှင့် ARM Templates နှိုင်းယှဉ်**:
- ✅ AZD: အဆင့်မြင့် abstraction၊ command များ ပိုလွယ်ကူသည်
- ⚠️ ARM: ပိုမိုရှုပ်ထွေး၍ အသေးစိတ် ထိန်းချုပ်နိုင်မှုရှိသည်

**AZD နှင့် Terraform နှိုင်းယှဉ်**:
- ✅ AZD: Azure native၊ Azure ဝန်ဆောင်မှုများနှင့် ပေါင်းစည်းထားသည်
- ⚠️ Terraform: Multi-cloud ကိုထောက်ပံ့နိုင်ပြီး ecosystem ကြီးသည်

**AZD နှင့် Azure Portal နှိုင်းယှဉ်**:
- ✅ AZD: ထပ်တလဲလဲ ပြုလုပ်နိုင်၊ version control ရှိ၊ အလိုအလျောက်လုပ်နိုင်သည်
- ⚠️ Portal: လက်ဖြင့် နှိပ်၍ ကျင်းပရမည်၊ ပြန်လည်ဖန်တီးရန် အခက်အခဲရှိသည်

**AZD ကို တွေးပါ**: Azure အတွက် Docker Compose — ရှုပ်ထွေးသည့် deployment များအတွက် ဖွဲ့စည်းမှုပိုလွယ်ကူစေသည်။

---

## မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ

**မေးခွန်း**: မတူသော programming language အသုံးပြုနိုင်ပါသလား?  
A: ဟုတ်ပါတယ်! `src/web/` ကို Node.js, C#, Go, သို့မဟုတ် မည်သည့် ဘာသာစကားမဆို အစားထိုးနိုင်သည်။ `azure.yaml` နှင့် Bicep ကို ကိုက်ညီအောင် အပ်ဒိတ်လုပ်ပါ။

**မေးခွန်း**: database များ ပိုမို ထည့်လိုပါက မည်သို့လုပ်မလဲ?  
A: `infra/main.bicep` တွင် SQL Database module တစ်ခုထပ်ထည့်ပါ သို့မဟုတ် Azure Database ဝန်ဆောင်မှုမှ PostgreSQL/MySQL ကို အသုံးပြုနိုင်သည်။

**မေးခွန်း**: ဤအချက်ကို ထုတ်လုပ်မှုတွင် အသုံးပြုနိုင်မလား?  
A: ၎င်းသည် စတင်ရန် အချက်အလမ်းတစ်ခုသာ ဖြစ်သည်။ ထုတ်လုပ်မှုအတွက် managed identity, private endpoints, redundancy, backup strategy, WAF, နှင့် မြင့်မားသော မော်နီတာခြင်းများကို ထည့်သွင်းပါ။

**မေးခွန်း**: code deployment အစား containers ကို အသုံးပြုလိုပါက?  
A: Docker containers ကို အပြည့်အသုံးပြုထားသော [Container Apps ဥပမာ](../../../../examples/container-app) ကို ကြည့်ပါ။

**မေးခွန်း**: ဒေသိယ (local) ကွန်ပျူတာမှ database အတွက် မည်သို့ ချိတ်ဆက်မလဲ?  
A: သင့် IP ကို SQL Server firewall ထဲ ထည့်ပါ:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**မေးခွန်း**: အသစ် ဖန်တီးရန် အစား ရှိပြီးသား database ကို အသုံးပြုနိုင်မလား?  
A: ဟုတ်ပါတယ်၊ ရှိပြီးသား SQL Server ကို ကိုးကားရန် `infra/main.bicep` ကို ပြင်ဆင်ပြီး connection string parameters များကို အပ်ဒိတ်လုပ်ပါ။

---

> **မှတ်ချက်:** ဤဥပမာသည် AZD အသုံးပြု၍ database ပါဝင်သည့် web app တင်သွင်းမှုအတွက် သင့်တော်သော လုပ်ထုံးလုပ်နည်းများကို ပြသသည်။ ၎င်းတွင် အလုပ်လုပ်သော ကုဒ်၊ ကျယ်ပြန့်သော စာတမ်းများနှင့် သင်ကြားမှုကို အတင်းအကျပ်လုပ်ပေးရန် လက်တွေ့ လေ့ကျင့်ခန်းများ ပါဝင်သည်။ ထုတ်လုပ်မှုကို တင်သွင်းရာတွင် သင့် အဖွဲ့အစည်းအတွက် လုံခြုံရေး၊ တိုးချဲ့နိုင်မှု၊ လိုက်နာမှုနှင့် ကုန်ကျစရိတ် လိုအပ်ချက်များကို ပြန်လည်သုံးသပ်ပါ။

**📚 သင်တန်း လမ်းညွှန်ခြင်း:**
- ← Previous: [Container Apps ဥပမာ](../../../../examples/container-app)
- → Next: [AI Integration လမ်းညွှန်](../../../../docs/ai-foundry)
- 🏠 [သင်တန်း ပင်မစာမျက်နှာ](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
သတိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ တိကျမှန်ကန်မှုကို ကြိုးစားရေပမယ့် အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါနိုင်ကြောင်း သတိပြုပါ။ မူရင်းစာတမ်းကို မူရင်းဘာသာစကားဖြင့်သာ အာဏာပိုင် အရင်းအမြစ်အဖြစ် ယူဆရမည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်၏ စစ်ဆေးချက်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာသည့် နားလည်မှုမှားခြင်းများ သို့မဟုတ် မမှန်ကန်သော ဖေါ်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->