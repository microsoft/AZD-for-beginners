# AZD ਨਾਲ Microsoft SQL ਡੇਟਾਬੇਸ ਅਤੇ ਵੈੱਬ ਐਪ ਨੂੰ ਡਿਪਲੋਏ ਕਰਨਾ

⏱️ **ਅੰਦਾਜ਼ਾ ਸਮਾਂ**: 20-30 ਮਿੰਟ | 💰 **ਅੰਦਾਜ਼ਾ ਲਾਗਤ**: ~$15-25/ਮਹੀਨਾ | ⭐ **ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ

ਇਹ **ਪੂਰਾ, ਕਾਰਜਕਾਰੀ ਉਦਾਹਰਨ** ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕਿਸ ਤਰ੍ਹਾਂ [Azure ਡਿਵੈਲਪਰ CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇੱਕ Python Flask ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Microsoft SQL ਡੇਟਾਬੇਸ ਸਮੇਤ Azure 'ਤੇ ਡਿਪਲੋਏ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ। ਸਾਰਾ ਕੋਡ ਸ਼ਾਮِل ਅਤੇ ਟੈਸਟ ਕੀਤਾ ਹੋਇਆ ਹੈ—ਕੋਈ ਬਾਹਰੀ ਨਿਰਭਰਤਾਵਾਂ ਲੋੜੀਂਦੀਆਂ ਨਹੀਂ।

## ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

ਇਸ ਉਦਾਹਰਨ ਨੂੰ ਪੂਰਾ ਕਰਨ ਨਾਲ, ਤੁਸੀਂ:
- ਇੰਫਰਾਸਟ੍ਰਕਚਰ-ਅਜ਼-ਕੋਡ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਬਹੁ-ਪੜ੍ਹੀ ਐਪਲੀਕੇਸ਼ਨ (ਵੈੱਬ ਐਪ + ਡੇਟਾਬੇਸ) ਨੂੰ ਡਿਪਲੋਏ ਕਰਨਾ
- ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਹਾਰਡਕੋਡ ਕੀਤੇ ਬਿਨਾਂ ਸੁਰੱਖਿਅਤ ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- Application Insights ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਸਿਹਤ ਦੀ ਨਿਗਰਾਨੀ ਕਰਨਾ
- AZD CLI ਨਾਲ Azure ਸਰੋਤਾਂ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ
- ਸੁਰੱਖਿਆ, ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਅਤੇ ਦਰਸ਼ਣਯੋਗਤਾ ਲਈ Azure ਦੀਆਂ ਚੰਗੀਆਂ ਪ੍ਰਥਾਵਾਂ ਦੀ ਪਾਲਣਾ ਕਰਨਾ

## ਦ੍ਰਿਸ਼

- **ਵੈੱਬ ਐਪ**: Python Flask REST API ਜਿਸ ਵਿੱਚ ਡੇਟਾਬੇਸ ਕਨੈਕਟਿਵਿਟੀ
- **ਡੇਟਾਬੇਸ**: ਨਮੂਨਾ ਡੇਟਾ ਵਾਲਾ Azure SQL ਡੇਟਾਬੇਸ
- **ਇੰਫਰਾਸਟ੍ਰਕਚਰ**: Bicep ਦੀ ਵਰਤੋਂ ਨਾਲ ਪ੍ਰੋਵਿਜ਼ਨ (ਮੋਡੀਊਲਰ, ਦੁਬਾਰਾ ਵਰਤੋਂਯੋਗ ਟੈਂਪਲੇਟ)
- **ਡਿਪਲੋਇਮੈਂਟ**: `azd` ਕਮਾਂਡਾਂ ਨਾਲ ਪੂਰੀ ਤਰ੍ਹਾਂ ਆਟੋਮੇਟਿਕ
- **ਨਿਗਰਾਨੀ**: ਲੋਗ ਅਤੇ ਟੈਲੀਮੀਟਰੀ ਲਈ Application Insights

## ਲੋੜੀਂਦੀਆਂ ਸ਼ਰਤਾਂ

### ਲੋੜੀਂਦੇ ਟੂਲ

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ ਇਹਨਾਂ ਟੂਲਾਂ ਨੂੰ ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ ਹੈ:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (ਸੰਸਕਰਨ 2.50.0 ਜਾਂ ਉਪਰ)
   ```sh
   az --version
   # ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ: azure-cli 2.50.0 ਜਾਂ ਇਸ ਤੋਂ ਵੱਧ
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (ਸੰਸਕਰਨ 1.0.0 ਜਾਂ ਉਪਰ)
   ```sh
   azd version
   # ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ: azd ਵਰਜਨ 1.0.0 ਜਾਂ ਉਸ ਤੋਂ ਉੱਪਰ
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (ਲੋਕਲ ਡੇਵਲਪਮੈਂਟ ਲਈ)
   ```sh
   python --version
   # ਉਮੀਦਿਤ ਨਤੀਜਾ: Python 3.8 ਜਾਂ ਉੱਪਰ
   ```

4. **[Docker](https://www.docker.com/get-started)** (ਵਿਕਲਪਿਕ, ਲੋਕਲ ਕੰਟੇਨਰਾਈਜ਼ਡ ਡੇਵਲਪਮੈਂਟ ਲਈ)
   ```sh
   docker --version
   # ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ: Docker ਸੰਸਕਰਨ 20.10 ਜਾਂ ਇਸ ਤੋਂ ਵੱਧ
   ```

### Azure ਲੋੜਾਂ

- ਇੱਕ ਸਰਗਰਮ **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- ਤੁਹਾਡੇ subscription ਵਿੱਚ ਸਰੋਤ ਬਣਾਉਣ ਦੀਆਂ ਪਰਵਾਨਗੀਆਂ
- subscription ਜਾਂ resource group 'ਤੇ **Owner** ਜਾਂ **Contributor** ਰੋਲ

### ਗਿਆਨ ਪ੍ਰੀ-ਜਰੂਰਤਾਂ

ਇਹ ਇੱਕ **ਦਰਮਿਆਨੇ ਪੱਧਰ** ਦੀ ਉਦਾਹਰਨ ਹੈ। ਤੁਹਾਨੂੰ ਇਹਨਾਂ ਦੀ ਜਾਣਕਾਰੀ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ:
- ਬੁਨਿਆਦੀ ਕਮਾਂਡ-ਲਾਈਨ ਓਪਰੇਸ਼ਨ
- ਬੁਨਿਆਦੀ ਕਲਾਉਡ ਧਾਰਣਾਵਾਂ (ਸਰੋਤ, resource groups)
- ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨਾਂ ਅਤੇ ਡੇਟਾਬੇਸਾਂ ਦੀ ਬੁਨਿਆਦੀ ਸਮਝ

**AZD ਨਵਾਂ ਹੈ?** ਪਹਿਲਾਂ [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ।

## ਆਰਕੀਟੈਕਚਰ

ਇਹ ਉਦਾਹਰਨ ਦੋ-ਪੜ੍ਹੀ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਡਿਪਲੋਏ ਕਰਦੀ ਹੈ—ਇੱਕ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਅਤੇ ਇੱਕ SQL ਡੇਟਾਬੇਸ:

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
- **Resource Group**: ਸਾਰੀਆਂ ਰਿਸੋਰਸਾਂ ਲਈ ਕੰਟੇਨਰ
- **App Service Plan**: Linux-ਅਧਾਰਿਤ ਹੋਸਟਿੰਗ (ਲਾਗਤ-ਕੁਸ਼ਲਤਾ ਲਈ B1 ਟੀਅਰ)
- **Web App**: Python 3.11 ਰਨਟਾਈਮ ਨਾਲ Flask ਐਪਲੀਕੇਸ਼ਨ
- **SQL Server**: ਪ੍ਰਬੰਧਤ ਡੇਟਾਬੇਸ ਸਰਵਰ ਜਿਸ ਵਿੱਚ ਘੱਟੋ-ਘੱਟ TLS 1.2
- **SQL Database**: Basic ਟੀਅਰ (2GB, ਡੇਵਲਪਮੈਂਟ/ਟੈਸਟਿੰਗ ਲਈ ਉਪਯੋਗ)
- **Application Insights**: ਨਿਗਰਾਨੀ ਅਤੇ ਲੋਗਿੰਗ
- **Log Analytics Workspace**: ਕੇਂਦਰੀ ਲੋਗ ਸਟੋਰੇਜ

**ਉਪਮਾ**: ਇਸ ਨੂੰ ਇੱਕ ਰੈਸਟੋਰੈਂਟ (ਵੈੱਬ ਐਪ) ਸਮਝੋ ਜਿਸ ਵਿੱਚ ਇੱਕ ਵਾਕ-ਇਨ ਫ੍ਰੀਜ਼ਰ (ਡੇਟਾਬੇਸ) ਹੈ। ਗਾਹਕ ਮੇਨੂ (API endpoints) ਤੋਂ ਆਰਡਰ ਕਰਦੇ ਹਨ, ਅਤੇ ਰਸੋਈ (Flask ਐਪ) ਫ੍ਰੀਜ਼ਰ ਤੋਂ ਸਮੱਗਰੀ (ਡੇਟਾ) ਲਿਆਉਂਦੀ ਹੈ। ਰੈਸਟੋਰੈਂਟ ਮੈਨੇਜਰ (Application Insights) ਹਰ ਘਟਨਾ ਨੂੰ ਟਰੈਕ ਕਰਦਾ ਹੈ।

## ਫੋਲਡਰ ਦੀ ਬਣਾਵਟ

ਸਾਰੇ ਫਾਇਲ ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ ਸ਼ਾਮِل ਹਨ—ਕੋਈ ਬਾਹਰੀ ਨਿਰਭਰਤਾਵਾਂ ਲੋੜੀਂਦੀਆਂ ਨਹੀਂ:

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

**ਹਰ ਫਾਇਲ ਦਾ ਕੰਮ:**
- **azure.yaml**: AZD ਨੂੰ ਦੱਸਦਾ ਹੈ ਕਿ ਕੀ ਡਿਪਲੋਏ ਕਰਨਾ ਹੈ ਅਤੇ ਕਿੱਥੇ
- **infra/main.bicep**: ਸਾਰੀਆਂ Azure ਰਿਸੋਰਸਾਂ ਨੂੰ ਓਰਚੈਸ्ट्रੇਟ ਕਰਦਾ ਹੈ
- **infra/resources/*.bicep**: ਉਦਯੋਗਿਕ ਤੌਰ 'ਤੇ ਵਰਤੋਂ ਲਈ পৃথਕ ਰਿਸੋਰਸ ਪਰਿਭਾਸ਼ਾਵਾਂ (ਮੋਡੀਊਲਰ)
- **src/web/app.py**: ਡੇਟਾਬੇਸ ਲੋਜਿਕ ਵਾਲਾ Flask ਐਪਲੀਕੇਸ਼ਨ
- **requirements.txt**: Python ਪੈਕੇਜ ਨਿਰਭਰਤਾਵਾਂ
- **Dockerfile**: ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਕੰਟੇਨਰਾਈਜੇਸ਼ਨ ਹਦਾਇਤਾਂ

## ਕਿਊਕਸਟਾਰਟ (ਕਦਮ-ਬਦ-ਕਦਮ)

### Step 1: ਕਲੋਨ ਅਤੇ ਨੈਵੀਗੇਟ ਕਰੋ

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਇਹ ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਤੁਸੀਂ `azure.yaml` ਅਤੇ `infra/` ਫੋਲਡਰ ਵੇਖ ਰਹੇ ਹੋ:
```sh
ls
# ਉਮੀਦ ਕੀਤੀ ਗਈ: README.md, azure.yaml, infra/, src/
```

### Step 2: Azure ਨਾਲ ਪ੍ਰਮਾਣੀਕਰਣ

```sh
azd auth login
```

ਇਹ ਤੁਹਾਡੇ ਬ੍ਰਾਉਜ਼ਰ ਨੂੰ Azure ਪ੍ਰਮਾਣੀਕਰਣ ਲਈ ਖੋਲ੍ਹੇਗਾ। Azure ਸਕਾਰਡੈਂਸ਼ੀਅਲ ਨਾਲ ਸਾਈਨ-ਇਨ ਕਰੋ।

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਤੁਹਾਨੂੰ ਇਹ ਵੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
```
Logged in to Azure.
```

### Step 3: ਵਾਤਾਵਰਣ ਦੀ ਸ਼ੁਰੂਆਤ ਕਰੋ

```sh
azd init
```

**ਕੀ ਹੁੰਦਾ ਹੈ**: AZD ਤੁਹਾਡੇ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਇੱਕ ਲੋਕਲ ਸੰਰਚਨਾ ਬਣਾਉਂਦਾ ਹੈ।

**ਤੁਹਾਨੂੰ ਜੋ ਪ੍ਰੰਪਟ ਦਿੱਸਣਗੇ**:
- **Environment name**: ਇੱਕ ਛੋਟਾ ਨਾਮ ਦਿਓ (ਉਦਾਹਰਣ: `dev`, `myapp`)
- **Azure subscription**: ਸੂਚੀ ਵਿੱਚੋਂ ਆਪਣੀ subscription ਚੁਣੋ
- **Azure location**: ਇੱਕ ਖੇਤਰ ਚੁਣੋ (ਉਦਾਹਰਣ: `eastus`, `westeurope`)

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਤੁਹਾਨੂੰ ਇਹ ਵੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
```
SUCCESS: New project initialized!
```

### Step 4: Azure ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ

```sh
azd provision
```

**ਕੀ ਹੁੰਦਾ ਹੈ**: AZD ਸਾਰਾ ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਡਿਪਲੋਏ ਕਰਦਾ ਹੈ (5-8 ਮਿੰਟ ਲੱਗ ਸਕਦੇ ਹਨ):
1. Resource group ਬਣਾਉਂਦਾ ਹੈ
2. SQL Server ਅਤੇ Database ਬਣਾਉਂਦਾ ਹੈ
3. App Service Plan ਬਣਾਉਂਦਾ ਹੈ
4. Web App ਬਣਾਉਂਦਾ ਹੈ
5. Application Insights ਬਣਾਉਂਦਾ ਹੈ
6. ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਨੂੰ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ

**ਤੁਹਾਨੂੰ ਪੁੱਛਿਆ ਜਾਵੇਗਾ**:
- **SQL admin username**: ਇੱਕ ਯੂਜ਼ਰਨੇਮ ਦਿਓ (ਉਦਾਹਰਣ: `sqladmin`)
- **SQL admin password**: ਇੱਕ ਮਜ਼ਬੂਤ ਪਾਸਵਰਡ ਦਿਓ (ਇਸ ਨੂੰ ਸੁਰੱਖਿਅਤ ਰੱਖੋ!)

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਤੁਹਾਨੂੰ ਇਹ ਵੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ ਸਮਾਂ**: 5-8 ਮਿੰਟ

### Step 5: ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਏ ਕਰੋ

```sh
azd deploy
```

**ਕੀ ਹੁੰਦਾ ਹੈ**: AZD ਤੁਹਾਡੀ Flask ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਬਿਲਡ ਅਤੇ ਡਿਪਲੋਏ ਕਰਦਾ ਹੈ:
1. Python ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਪੈਕੇਜ ਕਰਦਾ ਹੈ
2. Docker ਕੰਟੇਨਰ ਬਿਲਡ ਕਰਦਾ ਹੈ
3. Azure Web App 'ਤੇ ਪੁਸ਼ ਕਰਦਾ ਹੈ
4. ਡੇਟਾਬੇਸ ਨੂੰ ਸੈਂਪਲ ਡੇਟਾ ਨਾਲ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ ਕਰਦਾ ਹੈ
5. ਐਪਲੀਕੇਸ਼ਨ ਸ਼ੁਰੂ ਕਰਦਾ ਹੈ

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਤੁਹਾਨੂੰ ਇਹ ਵੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ ਸਮਾਂ**: 3-5 ਮਿੰਟ

### Step 6: ਐਪਲੀਕੇਸ਼ਨ ਵੇਖੋ

```sh
azd browse
```

ਇਹ ਤੁਹਾਡੇ ਡਿਪਲੋਏ ਕੀਤੇ ਵੈੱਬ ਐਪ ਨੂੰ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੋਲ੍ਹੇਗਾ: `https://app-<unique-id>.azurewebsites.net`

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਤੁਹਾਨੂੰ JSON ਆਉਟਪੁੱਟ ਵੇਖਣਾ ਚਾਹੀਦਾ ਹੈ:
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

### Step 7: API Endpoints ਟੈਸਟ ਕਰੋ

**ਹੈਲਥ ਚੈੱਕ** (ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਦੀ ਜਾਂਚ):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**ਉਮੀਦ ਕੀਤੀ ਜਵਾਬ**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**ਸੂਚੀ ਪ੍ਰੋਡਕਟਸ** (ਨਮੂਨਾ ਡੇਟਾ):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**ਉਮੀਦ ਕੀਤੀ ਜਵਾਬ**:
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

**ਇਕਲ ਪ੍ਰੋਡਕਟ ਪ੍ਰਾਪਤ ਕਰੋ**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ ਸਫਲਤਾ ਚੈੱਕ**: ਸਾਰੇ endpoints ਬਿਨਾਂ ਏਰਰ ਦੇ JSON ਡੇਟਾ ਰਿਟਰਨ ਕਰਨਗੇ।

---

**🎉 ਵਧਾਈਆਂ!** ਤੁਸੀਂ AZD ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure 'ਤੇ ਇੱਕ ਡੇਟਾਬੇਸ ਸਮੇਤ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੋਏ ਕੀਤਾ ਹੈ।

## ਕੰਫਿਗਰੇਸ਼ਨ ਡੀਪ-ਡਾਈਵ

### Environment Variables

ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ Azure App Service configuration ਰਾਹੀਂ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ—**ਕਦੇ ਵੀ ਸੋర్స్ ਕੋਡ ਵਿੱਚ ਹਾਰਡਕੋਡ ਨਾ ਕਰੋ**।

**AZD ਦੁਆਰਾ ਆਟੋਮੈਟਿਕ ਤੌਰ ਤੇ ਸੰਰਚਿਤ**:
- `SQL_CONNECTION_STRING`: ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਵਿਵਰਣ encrypted credentials ਨਾਲ
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: ਨਿਗਰਾਨੀ ਟੈਲੀਮੀਟਰੀ ਐਂਡਪੌਇੰਟ
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: ਆਟੋਮੈਟਿਕ dependency installation ਨੂੰ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ

**ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਕਿੱਥੇ ਸਟੋਰ ਹੁੰਦੀਆਂ ਹਨ**:
1. `azd provision` ਦੌਰਾਨ, ਤੁਸੀਂ SQL ਕ੍ਰੈਡੈਂਸ਼ੀਅਲ secure prompts ਰਾਹੀਂ ਦਿੰਦੇ ਹੋ
2. AZD ਇਹਨਾਂ ਨੂੰ ਤੁਹਾਡੇ ਲੋਕਲ `.azure/<env-name>/.env` ਫਾਇਲ ਵਿੱਚ ਸਟੋਰ ਕਰਦਾ ਹੈ (git-ignored)
3. AZD ਉਨ੍ਹਾਂ ਨੂੰ Azure App Service configuration ਵਿੱਚ ਇੰਜੈਕਟ ਕਰਦਾ ਹੈ (at rest encrypted)
4. ਐਪਲੀਕੇਸ਼ਨ runtime 'ਤੇ `os.getenv()` ਰਾਹੀਂ ਉਹਨਾਂ ਨੂੰ ਪੜ੍ਹਦਾ ਹੈ

### ਲੋਕਲ ਡੇਵਲਪਮੈਂਟ

ਲੋਕਲ ਟੈਸਟਿੰਗ ਲਈ, ਨਮੂਨਾ `.env` ਫਾਇਲ ਬਣਾਓ:

```sh
cp .env.sample .env
# .env ਨੂੰ ਆਪਣੇ ਲੋਕਲ ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਨਾਲ ਸੰਪਾਦਿਤ ਕਰੋ
```

**ਲੋਕਲ ਡੇਵਲਪਮੈਂਟ ਵਰਕਫਲੋ**:
```sh
# ਨਿਰਭਰਤਾਵਾਂ ਸਥਾਪਿਤ ਕਰੋ
cd src/web
pip install -r requirements.txt

# ਵਾਤਾਵਰਣ ਚਲਕਾਂ ਸੈੱਟ ਕਰੋ
export SQL_CONNECTION_STRING="your-local-connection-string"

# ਐਪਲੀਕੇਸ਼ਨ ਚਲਾਓ
python app.py
```

**ਲੋਕਲ ਵਿੱਚ ਟੈਸਟ ਕਰੋ**:
```sh
curl http://localhost:8000/health
# ਉਮੀਦ: {"ਸਥਿਤੀ": "ਤੰਦਰੁਸਤ", "ਡੇਟਾਬੇਸ": "ਜੁੜਿਆ"}
```

### Infrastructure as Code

ਸਾਰੇ Azure ਸਰੋਤ **Bicep ਟੈਂਪਲੇਟਸ** (`infra/` ਫੋਲਡਰ) ਵਿੱਚ ਪਰਿਭਾਸ਼ਿਤ ਹਨ:

- **ਮੋਡੀਊਲਰ ਡਿਜ਼ਾਇਨ**: ਹਰ ਰਿਸੋਰਸ ਟਾਈਪ ਲਈ ਆਪਣੀ ਫਾਇਲ ਹੈ ਤਾਂ ਕਿ ਦੁਬਾਰਾ ਵਰਤੋਂਯੋਗ ਹੋਵੇ
- **ਪੈਰਾਮੀਟਰਾਈਜ਼ਡ**: SKUs, ਖੇਤਰ, ਅਤੇ ਨਾਂਕਰਨ ਰੀਤੀ ਕਸਟਮાઇਜ਼ ਕਰੋ
- **ਚੰਗੀਆਂ ਪ੍ਰਥਾਵਾਂ**: Azure ਨਾਂਕਰਨ ਸਟੈਂਡਰਡ ਅਤੇ ਸੁਰੱਖਿਆ Defaults ਦੀ ਪਾਲਣਾ
- **ਵਰਜ਼ਨ ਕੰਟਰੋਲ**: ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਬਦਲਾਅ Git ਵਿੱਚ ਟਰੈਕ ਹੁੰਦੇ ਹਨ

**ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਉਦਾਹਰਨ**:
ਡੇਟਾਬੇਸ ਟੀਅਰ ਬਦਲਣ ਲਈ, `infra/resources/sql-database.bicep` ਸੋਧੋ:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## ਸੁਰੱਖਿਆ ਲਈ ਚੰਗੀਆਂ ਪ੍ਰਥਾਵਾਂ

ਇਹ ਉਦਾਹਰਨ Azure ਸੁਰੱਖਿਆ ਦੀਆਂ ਚੰਗੀਆਂ ਪ੍ਰਥਾਵਾਂ ਦੀ ਪਾਲਣਾ ਕਰਦੀ ਹੈ:

### 1. **ਸੋഴ് ਕੋਡ ਵਿੱਚ ਕੋਈ ਗੁਪਤ ਨਹੀਂ**
- ✅ ਕ੍ਰੈਡੈਂਸ਼ੀਅਲ Azure App Service configuration ਵਿੱਚ ਸਟੋਰ ਕੀਤੇ ਜਾਂਦੇ ਹਨ (encrypted)
- ✅ `.env` ਫਾਇਲਾਂ `.gitignore` ਰਾਹੀਂ Git ਤੋਂ ਬਾਹਰ ਰੱਖੀਆਂ ਜਾਂਦੀਆਂ ਹਨ
- ✅ ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ provisioning ਦੌਰਾਨ secure parameters ਰਾਹੀਂ ਦਿੱਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ

### 2. **ਇਨਕ੍ਰਿਪਟ ਕੀਤੇ ਕਨੈਕਸ਼ਨ**
- ✅ SQL Server ਲਈ ਘੱਟੋ-ਘੱਟ TLS 1.2
- ✅ Web App ਲਈ ਸਿਰਫ HTTPS ਨਿਆਤ
- ✅ ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਇਨਕ੍ਰਿਪਟਿਡ ਚੈਨਲ ਵਰਤਦੇ ਹਨ

### 3. **ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ**
- ✅ SQL Server ఫਾਇਰਵਾਲ Azure ਸਰਵਿਸਿਜ਼ ਨੂੰ ਹੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ
- ✅ ਪਬਲਿਕ ਨੈੱਟਵਰਕ ਐਕਸੈਸ ਸੀਮਿਤ (Private Endpoints ਨਾਲ ਹੋਰ ਤੰਗ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ)
- ✅ Web App 'ਤੇ FTPS ਅਣਯੋਗ

### 4. **ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਅਧਿਕਾਰਤਾ**
- ⚠️ **ਮੌਜੂਦਾ**: SQL authentication (username/password)
- ✅ **ਉਤਪਾਦਨ ਸੁਝਾਅ**: passwordless ਪ੍ਰਮਾਣੀਕਰਨ ਲਈ Azure Managed Identity ਦੀ ਵਰਤੋਂ ਕਰੋ

**Managed Identity ਵੱਲ ਅੱਡਵਾਂਸ ਕਰਨ ਲਈ** (ਉਤਪਾਦਨ ਲਈ):
1. Web App 'ਤੇ managed identity Enable ਕਰੋ
2. identity ਨੂੰ SQL permissions ਦਿਓ
3. connection string ਨੂੰ managed identity ਵਰਤਣ ਲਈ ਅਪਡੇਟ ਕਰੋ
4. ਪਾਸਵਰਡ-ਅਧਾਰਿਤ ਪ੍ਰਮਾਣੀਕਰਨ ਹਟਾਓ

### 5. **ਆਡੀਟਿੰਗ ਅਤੇ ਅਨੁਕੂਲਤਾ**
- ✅ Application Insights ਸਾਰੇ request ਅਤੇ errors ਲੋਗ ਕਰਦਾ ਹੈ
- ✅ SQL Database ਆਡੀਟਿੰਗ ਯੋਗ ਹੈ (compliance ਲਈ ਸੰਰਚਿਤ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ)
- ✅ ਸਾਰੇ ਸਰੋਤ governance ਲਈ ਟੈਗ ਕੀਤੇ ਜਾਂਦੇ ਹਨ

**ਉਤਪਾਦਨ ਤੋਂ ਪਹਿਲਾਂ ਸੁਰੱਖਿਆ ਚੈਕਲਿਸਟ**:
- [ ] SQL ਲਈ Azure Defender Enable ਕਰੋ
- [ ] SQL Database ਲਈ Private Endpoints ਸੰਰਚਿਤ ਕਰੋ
- [ ] Web Application Firewall (WAF) ਯੋਗ ਕਰੋ
- [ ] ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਲਈ Azure Key Vault ਲਾਗੂ ਕਰੋ
- [ ] Azure AD ਪ੍ਰਮਾਣੀਕਰਨ ਸੰਰਚਿਤ ਕਰੋ
- [ ] ਸਾਰੇ ਸਰੋਤਾਂ ਲਈ ਡਾਇਗਨੋਸਟਿਕ ਲੋਗਿੰਗ ਯੋਗ ਕਰੋ

## ਲਾਗਤ ਦੀ ਬਚਤ

**ਅੰਦਾਜ਼ਾ ਮਹੀਨਾਵਾਰ ਖ਼ਰਚਾ** (ਨਵੰਬਰ 2025 ਤੱਕ):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 ਲਾਗਤ-ਬਚਤ ਟਿਪਸ**:

1. **ਸਿੱਖਣ ਲਈ Free Tier ਦੀ ਵਰਤੋਂ ਕਰੋ**:
   - App Service: F1 ਟੀਅਰ (ਫ੍ਰੀ, ਸੀਮਤ ਘੰਟੇ)
   - SQL Database: Azure SQL Database serverless ਵਰਤੋ
   - Application Insights: 5GB/ਮਹੀਨਾ ਫ੍ਰੀ ingestion

2. **ਜਦੋਂ ਵਰਤੋਂ ਵਿੱਚ ਨਾ ਹੋਣ ਤਾਂ ਸਰੋਤ ਬੰਦ ਕਰੋ**:
   ```sh
   # ਵੈੱਬ ਐਪ ਨੂੰ ਰੋਕੋ (ਡੇਟਾਬੇਸ ਲਈ ਚਾਰਜ ਲੱਗਦੇ ਰਹਿਣਗੇ)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # ਜਦੋਂ ਲੋੜ ਹੋਵੇ ਦੁਬਾਰਾ ਸ਼ੁਰੂ ਕਰੋ
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **ਟੈਸਟ ਕਰਨ ਤੋਂ ਬਾਅਦ ਸਭ ਕੁਝ ਮਿਟਾ ਦਿਓ**:
   ```sh
   azd down
   ```
   ਇਸ ਨਾਲ ਸਾਰੇ ਸਰੋਤ ਹਟ ਜਾਂਦੇ ਹਨ ਅਤੇ ਖਰਚ ਬੰਦ ਹੋ ਜਾਂਦੇ ਹਨ।

4. **ਡੇਵਲਪਮੈਂਟ ਵਰਸਸ ਉਤਪਾਦਨ SKUs**:
   - **ਡੇਵਲਪਮੈਂਟ**: ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ ਵਰਤੇ ਗਏ Basic ਟੀਅਰ
   - **ਉਤਪਾਦਨ**: redundancy ਵਾਲੇ Standard/Premium ਟੀਅਰ

**ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) ਵਿੱਚ ਲਾਗਤ ਵੇਖੋ
- ਅਚਾਨਕ ਚਾਰਜ ਤੋਂ ਬਚਣ ਲਈ ਲਾਗਤ ਅਲਰਟ ਸੈੱਟ ਕਰੋ
- ਟ੍ਰੈਕਿੰਗ ਲਈ ਸਾਰੇ ਸਰੋਤਾਂ ਨੂੰ `azd-env-name` ਨਾਲ ਟੈਗ ਕਰੋ

**ਫ੍ਰੀ ਟੀਅਰ ਵਿਕਲਪ**:
ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼ ਲਈ, ਤੁਸੀਂ `infra/resources/app-service-plan.bicep` ਸੋਧ ਸਕਦੇ ਹੋ:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**ਨੋਟ**: ਫ੍ਰੀ ਟੀਅਰ ਦੀਆਂ ਸੀਮਾਵਾਂ ਹਨ (60 ਮਿੰਟ/ਦਿਨ CPU, no always-on)।

## ਨਿਗਰਾਨੀ ਅਤੇ ਦਰਸ਼ਣਯੋਗਤਾ

### Application Insights ਇੰਟੀਗ੍ਰੇਸ਼ਨ

ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ ਸਰਗਰਮ ਨਿਗਰਾਨੀ ਲਈ **Application Insights** ਸ਼ਾਮِل ਹੈ:

**ਕੀ ਨਿਗਰਾਨੀ ਹੁੰਦਾ ਹੈ**:
- ✅ HTTP requests (ਲੈਟੰਸੀ, ਸਟੇਟਸ ਕੋਡ, endpoints)
- ✅ ਐਪਲੀਕੇਸ਼ਨ errors ਅਤੇ exceptions
- ✅ Flask ਐਪ ਤੋਂ ਕਸਟਮ ਲੋਗਿੰਗ
- ✅ ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਸਿਹਤ
- ✅ ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ (CPU, memory)

**Application Insights ਤੱਕ पहुੰਚ**:
1. ਖੋਲ੍ਹੋ [Azure Portal](https://portal.azure.com)
2. ਆਪਣੇ resource group (`rg-<env-name>`) 'ਤੇ ਜਾਓ
3. Application Insights resource (`appi-<unique-id>`) 'ਤੇ ਕਲਿਕ ਕਰੋ

**ਝਰੂਰੀ ਕਵੇਰੀਆਂ** (Application Insights → Logs):

**ਸਭ Requests ਵੇਖੋ**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Errors ਲੱਭੋ**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**ਹੈਲਥ Endpoint ਚੈੱਕ ਕਰੋ**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database ਆਡੀਟਿੰਗ

**SQL Database ਆਡੀਟਿੰਗ ਯੋਗ ਹੈ** ਤਾਂ ਜੋ ਇਹ ਟਰੈਕ ਕੀਤਾ ਜਾ ਸਕੇ:
- ਡੇਟਾਬੇਸ ਐਕਸੈਸ ਪੈਟਰਨ
- ਅਸਫਲ ਲੋਗਿਨ ਕੋਸ਼ਿਸ਼ਾਂ
- ਸਕੀਮਾ ਬਦਲਾਅ
- ਡੇਟਾ ਐਕਸੈਸ (compliance ਲਈ)

**ਆਡੀਟ ਲੋਗਸ ਤੱਕ ਪਹੁੰਚ**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics workspace ਵਿੱਚ ਲੋਗ ਵੇਖੋ

### ਰੀਅਲ-ਟਾਈਮ ਨਿਗਰਾਨੀ

**Live Metrics ਵੇਖੋ**:
1. Application Insights → Live Metrics
2. ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ requests, failures, ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਵੇਖੋ

**ਅਲਰਟ ਸੈੱਟ ਕਰੋ**:
ਨਿਮਨਲਿਖਤ ਸੰਕਟਕਾਰੀ ਘਟਨਾਵਾਂ ਲਈ ਅਲਰਟ ਬਣਾਓ:
- HTTP 500 errors > 5 in 5 minutes
- ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਫੇਲਿਅਰ
- ਉੱਚ ਰਿਸਪਾਂਸ ਸਮੇਂ (>2 ਸੈਕੰਡ)

**Example Alert Creation**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## ਸਮੱਸਿਆ ਨਿਵਾਰਣ

### ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ

#### 1. `azd provision` 'Location not available' ਨਾਲ ਅਸਫਲ

**ਲੱਛਣ**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**ਹੱਲ**:
ਕਿਸੇ ਹੋਰ Azure ਖੇਤਰ ਦੀ ਚੋਣ ਕਰੋ ਜਾਂ ਰਿਸੋਰਸ ਪ੍ਰੋਵਾਈਡਰ ਨੂੰ ਰਜਿਸਟਰ ਕਰੋ:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. ਤੈਨਾਤੀ ਦੇ ਦੌਰਾਨ SQL ਕਨੈਕਸ਼ਨ ਫੇਲ ਹੁੰਦਾ ਹੈ

**ਲੱਛਣ**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**ਹੱਲ**:
- ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ SQL Server ਫਾਇਰਵਾਲ Azure ਸਰਵਿਸز ਨੂੰ ਆਗਿਆ ਦਿੰਦਾ ਹੈ (ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਕਨਫਿਗਰ ਕੀਤਾ ਜਾਂਦਾ ਹੈ)
- ਜਾਂਚੋ ਕਿ `azd provision` ਦੌਰਾਨ SQL ਐਡਮਿਨ ਪਾਸਵਰਡ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਦਰਜ ਕੀਤਾ ਗਿਆ ਸੀ
- ਯਕੀਨੀ ਬਣਾਓ ਕਿ SQL Server ਪੂਰੀ ਤਰ੍ਹਾਂ ਪ੍ਰੋਵਿਜ਼ਨ ਹੋ ਚੁੱਕਾ ਹੈ (2-3 ਮਿੰਟ ਲੱਗ ਸਕਦੇ ਹਨ)

**ਕਨੈਕਸ਼ਨ ਦੀ ਪੜਤਾਲ ਕਰੋ**:
```sh
# Azure ਪੋਰਟਲ ਤੋਂ, SQL ਡੇਟਾਬੇਸ → ਕੁਐਰੀ ਸੰਪਾਦਕ ਤੇ ਜਾਓ
# ਆਪਣੀਆਂ ਲਾਗਿਨ ਜਾਣਕਾਰੀਆਂ ਨਾਲ ਜੁੜਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
```

#### 3. Web App "Application Error" ਦਿਖਾਉਂਦਾ ਹੈ

**ਲੱਛਣ**:
ਬਰਾਊਜ਼ਰ ਇੱਕ ਆਮ ਐਰਰ ਪੇਜ ਦਿਖਾਉਂਦਾ ਹੈ।

**ਹੱਲ**:
ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਸ ਚੈੱਕ ਕਰੋ:
```sh
# ਹਾਲੀਆ ਲੌਗਾਂ ਵੇਖੋ
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**ਆਮ ਕਾਰਨ**:
- ਇੰਵਾਇਰਮੈਂਟ ਵੈਰੀਏਬਲ ਗਾਇਬ ਹਨ (ਚੈੱਕ ਕਰੋ App Service → Configuration)
- Python ਪੈਕੇਜ ਸਥਾਪਨਾ ਫੇਲ ਹੋਈ (deployment logs ਚੈੱਕ ਕਰੋ)
- ਡੇਟਾਬੇਸ ਇਨੀਸ਼ੀਅਲਾਈਜ਼ੇਸ਼ਨ ਐਰਰ (SQL ਕਨੈਕਟਿਵਟੀ ਚੈੱਕ ਕਰੋ)

#### 4. `azd deploy` "Build Error" ਨਾਲ ਫੇਲ ਹੁੰਦਾ ਹੈ

**ਲੱਛਣ**:
```
Error: Failed to build project
```

**ਹੱਲ**:
- ਯਕੀਨੀ ਬਣਾਓ ਕਿ `requirements.txt` ਵਿੱਚ ਕੋਈ ਸਿੰਟੈਕਸ ਤ੍ਰੁੱਟੀ ਨਹੀਂ ਹੈ
- ਜਾਂਚੋ ਕਿ Python 3.11 `infra/resources/web-app.bicep` ਵਿੱਚ ਨਿਰਧਾਰਿਤ ਹੈ
- Verify ਕਰੋ ਕਿ Dockerfile ਵਿੱਚ ਸਹੀ ਬੇਸ ਇਮੇਜ ਹੈ

**ਲੋਕਲ ਤੌਰ 'ਤੇ ਡੀਬੱਗ ਕਰੋ**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD ਕਮਾਂਡਾਂ ਚਲਾਉਂਦੇ ਸਮੇਂ "Unauthorized"

**ਲੱਛਣ**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**ਹੱਲ**:
Azure ਨਾਲ ਦੁਬਾਰਾ ਪ੍ਰਮਾਣਿਕ ਕਰਨ:
```sh
azd auth login
az login
```

ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਸਬਸਕ੍ਰਿਪਸ਼ਨ 'ਤੇ ਸਹੀ ਅਨੁਮਤੀਆਂ (Contributor role) ਹਨ।

#### 6. ਡੇਟਾਬੇਸ ਲਾਗਤਾਂ ਉੱਚੀਆਂ

**ਲੱਛਣ**:
ਅਣਅਨੁਮਾਨਤ Azure ਬਿੱਲ।

**ਹੱਲ**:
- ਜਾਂਚੋ ਕਿ ਤੁਸੀਂ ਟੈਸਟਿੰਗ ਦੇ ਬਾਅਦ `azd down` ਨਹੀਂ ਚਲਾਇਆ
- Verify ਕਰੋ ਕਿ SQL Database Basic ਟੀਅਰ ਵਰਤ ਰਿਹਾ ਹੈ (Premium ਨਹੀਂ)
- Azure Cost Management ਵਿੱਚ ਲਾਗਤਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ
- ਖਰਚੇ ਲਈ ਅਲਰਟ ਸੈੱਟ ਕਰੋ

### ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਕਰੋ

**ਸਭ AZD ਇੰਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਵੇਖੋ**:
```sh
azd env get-values
```

**ਡਿਪਲਾਇਮੈਂਟ ਸਥਿਤੀ ਚੈੱਕ ਕਰੋ**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਸ ਤੱਕ ਪਹੁੰਚ**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**ਹੋਰ ਮਦਦ ਚਾਹੀਦੀ ਹੈ?**
- [AZD Troubleshooting Guide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## ਪ੍ਰਯੋਗਾਤਮਕ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ (ਸ਼ੁਰੂਆਤੀ)

**ਉਦੇਸ਼**: ਇਹ ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਸਾਰੇ ਰਿਸੋਰਸ ਡਿਪਲੌਇਡ ਹੋਏ ਹਨ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੰਮ ਕਰ ਰਹੀ ਹੈ।

**ਕਦਮ**:
1. ਆਪਣੀ ਰਿਸੋਰਸ ਗਰੁੱਪ ਵਿੱਚ ਸਾਰੇ ਰਿਸੋਰਸ ਸੂਚੀਬੱਧ ਕਰੋ:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **ਉਮੀਦ**: 6-7 ਰਿਸੋਰਸ (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. ਸਾਰੇ API ਐਂਡਪੋਇੰਟ ਟੈਸਟ ਕਰੋ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **ਉਮੀਦ**: ਸਭ ਵੈਧ JSON ਬਿਨਾਂ ਐਰਰ ਦੇ ਰਿਟਰਨ ਕਰਦੇ ਹਨ

3. Application Insights ਚੈੱਕ ਕਰੋ:
   - Azure Portal ਵਿੱਚ Application Insights 'ਤੇ ਜਾਓ
   - "Live Metrics" ਤੇ ਜਾਓ
   - ਵੈਬ ਐਪ 'ਤੇ ਆਪਣੇ ਬਰਾਊਜ਼ਰ ਨੂੰ ਰਿਫ੍ਰੈਸ਼ ਕਰੋ
   **ਉਮੀਦ**: ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਰਿਕਵੇਸਟਸ ਦਿਖਾਈ ਦੇਣ

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ**: ਸਾਰੇ 6-7 ਰਿਸੋਰਸ ਮੌਜੂਦ ਹਨ, ਸਾਰੇ ਐਂਡਪੋਇੰਟ ਡੇਟਾ ਰਿਟਰਨ ਕਰਦੇ ਹਨ, Live Metrics ਸਰਗਰਮੀ ਦਿਖਾਉਂਦਾ ਹੈ।

---

### ਅਭਿਆਸ 2: ਨਵਾਂ API ਐਂਡਪੋਇੰਟ ਜੋੜੋ (ਮੱਧਮ)

**ਉਦੇਸ਼**: Flask ਐਪਲੀਕੇਸ਼ਨ ਵਿੱਚ ਨਵਾਂ ਐਂਡਪੋਇੰਟ ਸ਼ਾਮਲ ਕਰੋ।

**ਸ਼ੁਰੂਆਤੀ ਕੋਡ**: ਮੌਜੂਦਾ ਐਂਡਪੋਇੰਟ `src/web/app.py` ਵਿੱਚ ਹਨ

**ਕਦਮ**:
1. `src/web/app.py` ਨੂੰ ਐਡਿਟ ਕਰੋ ਅਤੇ `get_product()` ਫੰਕਸ਼ਨ ਤੋਂ ਬਾਅਦ ਨਵਾਂ ਐਂਡਪੋਇੰਟ ਜੋੜੋ:
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

2. ਅਪਡੇਟ ਕੀਤੀ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ:
   ```sh
   azd deploy
   ```

3. ਨਵੇਂ ਐਂਡਪੋਇੰਟ ਨੂੰ ਟੈਸਟ ਕਰੋ:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **ਉਮੀਦ**: "laptop" ਨਾਲ ਮੇਲ ਖਾਂਦੇ ਪ੍ਰਾਡਕਟਸ ਰਿਟਰਨ ਹੁੰਦੇ ਹਨ

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ**: ਨਵਾਂ ਐਂਡਪੋਇੰਟ ਕੰਮ ਕਰਦਾ ਹੈ, ਫਿਲਟਰ ਕੀਤੇ ਨਤੀਜੇ ਰਿਟਰਨ ਹੁੰਦੇ ਹਨ, Application Insights ਲੌਗਸ ਵਿੱਚ ਦਿਖਾਈ ਦੇਂਦਾ ਹੈ।

---

### ਅਭਿਆਸ 3: ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਸ شامل ਕਰੋ (ਉੱਚ)

**ਉਦੇਸ਼**: ਪ੍ਰੋਐਕਟਿਵ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਲਰਟਸ ਸੈੱਟ ਕਰੋ।

**ਕਦਮ**:
1. HTTP 500 ਐਰਰਸ ਲਈ ਅਲਰਟ ਬਣਾਓ:
   ```sh
   # ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਸੰਸਾਧਨ ID ਪ੍ਰਾਪਤ ਕਰੋ
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # ਅਲਰਟ ਬਣਾਓ
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. ਐਰਰਸ ਪੈਦਾ ਕਰਕੇ ਅਲਰਟ ਨੂੰ ਟ੍ਰਿਗਰ ਕਰੋ:
   ```sh
   # ਇੱਕ ਮੌਜੂਦ ਨਾ ਹੋਣ ਵਾਲਾ ਉਤਪਾਦ ਮੰਗੋ
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. ਦੇਖੋ ਕਿ ਅਲਰਟ ਫਾਇਰ ਹੋਇਆ ਕਿ ਨਹੀਂ:
   - Azure Portal → Alerts → Alert Rules
   - ਆਪਣੀ ਈਮੇਲ ਚੈੱਕ ਕਰੋ (ਜੇ ਕਨਫਿਗਰ ਕੀਤਾ ਹੋਵੇ)

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ**: ਅਲਰਟ ਰੂਲ ਬਣਾਇਆ ਗਿਆ ਹੈ, ਐਰਰਸ 'ਤੇ ਟ੍ਰਿਗਰ ਹੁੰਦਾ ਹੈ, ਨੋਟੀਫਿਕੇਸ਼ਨ ਪ੍ਰਾਪਤ ਹੁੰਦੀਆਂ ਹਨ।

---

### ਅਭਿਆਸ 4: ਡੇਟਾਬੇਸ ਸਕੀਮਾ ਬਦਲੋ (ਉੱਚ)

**ਉਦੇਸ਼**: ਨਵਾਂ ਟੇਬਲ ਜੋੜੋ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਇਸ ਨੂੰ ਵਰਤਣ ਲਈ ਸੋਧੋ।

**ਕਦਮ**:
1. Azure Portal Query Editor ਰਾਹੀਂ SQL Database ਨਾਲ ਕਨੈਕਟ ਕਰੋ

2. ਨਵਾਂ `categories` ਟੇਬਲ ਬਣਾਓ:
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

3. `src/web/app.py` ਨੂੰ ਅੱਪਡੇਟ ਕਰੋ ਤਾਂ ਜੋ ਰਿਸਪੌਨਸ ਵਿੱਚ category ਜਾਣਕਾਰੀ ਸ਼ਾਮਲ ਹੋਵੇ

4. ਡਿਪਲੌਇ ਅਤੇ ਟੈਸਟ ਕਰੋ

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ**: ਨਵਾਂ ਟੇਬਲ ਮੌਜੂਦ ਹੈ, ਪ੍ਰਾਡਕਟਸ ਵਿੱਚ category ਜਾਣਕਾਰੀ ਦਿਖਦੀ ਹੈ, ਐਪਲੀਕੇਸ਼ਨ ਅਜੇ ਵੀ ਕੰਮ ਕਰਦੀ ਹੈ।

---

### ਅਭਿਆਸ 5: ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ (Expert)

**ਉਦੇਸ਼**: ਪ੍ਰਦਰਸ਼ਨ ਸੁਧਾਰ ਕਰਨ ਲਈ Azure Redis Cache ਸ਼ਾਮਲ ਕਰੋ।

**ਕਦਮ**:
1. `infra/main.bicep` ਵਿੱਚ Redis Cache ਜੋੜੋ
2. `src/web/app.py` ਨੂੰ ਅੱਪਡੇਟ ਕਰੋ ਤਾਂ ਜੋ ਪ੍ਰਾਡਕਟ ਕਵੈਰੀਆਂ ਨੂੰ ਕੈਸ਼ ਕੀਤਾ ਜਾ ਸਕੇ
3. Application Insights ਨਾਲ ਪ੍ਰਦਰਸ਼ਨ ਸੁਧਾਰ ਮਾਪੋ
4. ਕੈਸ਼ਿੰਗ ਤੋਂ ਪਹਿਲਾਂ/بعد ਰਿਸਪਾਂਸ ਸਮਿਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ**: Redis ਡਿਪਲੌਇ ਹੋਇਆ ਹੈ, ਕੈਸ਼ਿੰਗ ਕੰਮ ਕਰਦੀ ਹੈ, ਰਿਸਪਾਂਸ ਸਮੇਂ >50% ਸੁਧਰਦੇ ਹਨ।

**ਸੰਕੇਤ**: Start with [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/)।

---

## ਸਫ਼ਾਈ

ਚੱਲ ਰਹੀਆਂ ਫੀਸਾਂ ਤੋਂ ਬਚਣ ਲਈ, ਕੰਮ ਮੁਕੰਮਲ ਹੋਣ ਤੇ ਸਾਰੇ ਰਿਸੋਰਸ ਹਟਾ ਦਿਓ:

```sh
azd down
```

**ਪੁਸ਼ਟੀ ਪ੍ਰੰਪਟ**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

ਪੁਸ਼ਟੀ ਲਈ `y` ਲਿਖੋ।

**✓ ਸਫਲਤਾ ਜਾਂਚ**: 
- ਸਾਰੇ ਰਿਸੋਰਸ Azure Portal ਤੋਂ ਹਟਾਏ ਗਏ ਹਨ
- ਕੋਈ ਚੱਲ ਰਹੀਆਂ ਫੀਸ ਨਹੀਂ ਹਨ
- ਲੋਕਲ `.azure/<env-name>` ਫੋਲਡਰ ਡਿਲੀਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

**ਵਿਕਲਪ** (ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਰੱਖੋ, ਡਾਟਾ ਹਟਾਓ):
```sh
# ਕੇਵਲ ਰਿਸੋਰਸ ਗਰੁੱਪ ਨੂੰ ਹਟਾਓ (AZD ਸੰਰਚਨਾ ਨੂੰ ਰੱਖੋ)
az group delete --name rg-<env-name> --yes
```
## ਹੋਰ ਜਾਣੋ

### ਸਬੰਧਿਤ ਦਸਤਾਵੇਜ਼
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### ਇਸ ਕੋਰਸ ਵਿੱਚ ਅਗਲੇ ਕਦਮ
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Apps ਨਾਲ ਮਾਈਕ੍ਰੋਸਰਵਿਸਿਜ਼ ਡਿਪਲੌਇ ਕਰੋ
- **[AI Integration Guide](../../../../docs/ai-foundry)**: ਆਪਣੀ ਐਪ ਵਿੱਚ AI ਸਮਰੱਥਾ ਜੋੜੋ
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ

### ਉੱਨਤ ਵਿਸ਼ੇ
- **Managed Identity**: ਪਾਸਵਰਡ ਹਟਾਓ ਅਤੇ Azure AD ਅਥੇਂਟੀਕੇਸ਼ਨ ਵਰਤੋ
- **Private Endpoints**: ਵਰਚੁਅਲ ਨੈਟਵਰਕ ਅੰਦਰ ਡੇਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਸੁਰੱਖਿਅਤ ਕਰੋ
- **CI/CD Integration**: GitHub Actions ਜਾਂ Azure DevOps ਨਾਲ ਡਿਪਲੌਇਮੈਂਟਾਂ ਨੂੰ ਆਟੋਮੇਟ ਕਰੋ
- **Multi-Environment**: dev, staging, ਅਤੇ production ਇਨਵਾਇਰਨਮੈਂਟ ਸੈੱਟ ਕਰੋ
- **Database Migrations**: ਸਕੀਮਾ ਵਰਜ਼ਨਿੰਗ ਲਈ Alembic ਜਾਂ Entity Framework ਵਰਤੋ

### ਹੋਰ ਢੰਗਾਂ ਨਾਲ ਤੁਲਨਾ

**AZD vs. ARM Templates**:
- ✅ AZD: ਉੱਚ-ਸਤਹ ਦਾ ਅਬਸਟ੍ਰੈਕਸ਼ਨ, ਸਰਲ ਕਮਾਂਡਸ
- ⚠️ ARM: ਹੋਰ ਵਿਸਤ੍ਰਿਤ, ਬਰੀਕੀ ਕੰਟਰੋਲ

**AZD vs. Terraform**:
- ✅ AZD: Azure-ਮੂਲ, Azure ਸੇਵਾਵਾਂ ਨਾਲ ਇੰਟੈਗ੍ਰੇਟਡ
- ⚠️ Terraform: ਮਲਟੀ-ਕਲਾਉਡ ਸਹਾਇਤਾ, ਵੱਡਾ ਇਕੋਸਿਸਟਮ

**AZD vs. Azure Portal**:
- ✅ AZD: ਦੁਹਰਾਉਣਯੋਗ, ਵਰਜ਼ਨ-ਕੰਟਰੋਲਯੋਗ, ਆਟੋਮੇਟੇਬਲ
- ⚠️ Portal: ਹੱਥੋਂ-ਕਲਿਕ, ਮੁੜ ਬਣਾਉਣਾ ਮੁਸ਼ਕਲ

**AZD ਨੂੰ ਸੋਚੋ**: Docker Compose ਫਾਰ Azure — ਜਟਿਲ ਡਿਪਲੌਇਮੈਂਟਸ ਲਈ ਸਰਲ ਕੀਤੀ ਗਈ ਕਨਫਿਗਰੇਸ਼ਨ।

---

## ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਪ੍ਰਸ਼ਨ

**Q: ਕੀ ਮੈਂ ਵੱਖਰੀ ਪ੍ਰੋਗ੍ਰਾਮਿੰਗ ਭਾਸ਼ਾ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?**  
A: ਹਾਂ! `src/web/` ਨੂੰ Node.js, C#, Go, ਜਾਂ ਕਿਸੇ ਹੋਰ ਭਾਸ਼ਾ ਨਾਲ ਬਦਲੋ। `azure.yaml` ਅਤੇ Bicep ਅਨੁਸਾਰ ਅਪਡੇਟ ਕਰੋ।

**Q: ਮੈਂ ਹੋਰ ਡੇਟਾਬੇਸ ਕਿਵੇਂ ਜੋੜਾਂ?**  
A: `infra/main.bicep` ਵਿੱਚ ਹੋਰ SQL Database ਮੋਡੀਊਲ ਜੋੜੋ ਜਾਂ Azure Database ਸੇਵਾਵਾਂ ਤੋਂ PostgreSQL/MySQL ਵਰਤੋ।

**Q: ਕੀ ਮੈਂ ਇਹ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?**  
A: ਇਹ ਇੱਕ ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ ਹੈ। ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ: managed identity, private endpoints, redundancy, ਬੈਕਅੱਪ ਰਣਨੀਤੀ, WAF, ਅਤੇ ਵਧੇਰੇ ਮਾਨੀਟਰਿੰਗ ਸ਼ਾਮਲ ਕਰੋ।

**Q: ਜੇ ਮੈਂ ਕੋਡ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਥਾਂ ਕਨਟੇਨਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰਨਾ ਚਾਹੁੰਦਾ/ਚਾਹੁੰਦੀ ਹਾਂ?**  
A: [Container Apps Example](../../../../examples/container-app) ਵੇਖੋ ਜੋ Docker ਕਨਟੇਨਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ।

**Q: ਮੈਂ ਲੋਕਲ ਮਸ਼ੀਨ ਤੋਂ ਡੇਟਾਬੇਸ ਨਾਲ ਕਿਵੇਂ ਜੁੜਾਂ?**  
A: SQL Server ਫਾਇਰਵਾਲ ਵਿੱਚ ਆਪਣਾ IP ਜੋੜੋ:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: ਕੀ ਮੈਂ ਨਵਾਂ ਬਣਾਉਣ ਦੀ ਥਾਂ ਮੌਜੂਦਾ ਡੇਟਾਬੇਸ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?**  
A: ਹਾਂ, `infra/main.bicep` ਨੂੰ ਸੰਸੋਧ ਕਰੋ ਤਾਂ ਕਿ ਮੌਜੂਦਾ SQL Server ਨੂੰ ਰੈਫਰੈਂਸ ਕੀਤਾ ਜਾਵੇ ਅਤੇ connection string ਪੈਰਾਮੀਟਰ ਅਪਡੇਟ ਕਰੋ।

---

> **ਨੋਟ:** ਇਹ ਉਦਾਹਰਨ AZD ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡੇਬੇਸ ਨਾਲ ਇੱਕ ਵੈਬ ਐਪ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਸਰੋਤ-ਸ਼੍ਰੇଷਠ ਅਭਿਆਸ ਦਿਖਾਉਂਦੀ ਹੈ। ਇਸ ਵਿੱਚ ਕੰਮ ਕਰਨ ਵਾਲਾ ਕੋਡ, ਵਿਸਥਾਰਪੂਰਵਕ ਦਸਤਾਵੇਜ਼, ਅਤੇ ਸਿੱਖਣ ਨੂੰ ਮਜ਼ਬੂਤ ਕਰਨ ਲਈ ਪ੍ਰਯੋਗਾਤਮਕ ਅਭਿਆਸ ਸ਼ਾਮਲ ਹਨ। ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਲਈ, ਆਪਣੇ ਸੰਗਠਨ ਲਈ ਵਿਸ਼ੇਸ਼ ਸੁਰੱਖਿਆ, ਸਕੇਲਿੰਗ, ਅਨੁਪਾਲਨ ਅਤੇ ਲਾਗਤ ਦੀਆਂ ਲੋੜਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ।

**📚 ਕੋਰਸ ਨੈਵੀਗੇਸ਼ਨ:**
- ← ਪਿਛਲਾ: [Container Apps Example](../../../../examples/container-app)
- → ਅੱਗੇ: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Course Home](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਰਨ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਭੁੱਲਾਂ ਜਾਂ ਅਣਸ਼ੁੱਧਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਹੀ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਉਤਪੰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->