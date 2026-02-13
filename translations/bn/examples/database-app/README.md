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
   # প্রত্যাশিত আউটপুট: azure-cli 2.50.0 বা তার চেয়ে বেশি
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```sh
   azd version
   # প্রত্যাশিত আউটপুট: azd সংস্করণ 1.0.0 বা তার উপরে
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (for local development)
   ```sh
   python --version
   # প্রত্যাশিত আউটপুট: Python 3.8 বা তার উপরে
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, for local containerized development)
   ```sh
   docker --version
   # প্রত্যাশিত আউটপুট: Docker সংস্করণ 20.10 বা তার উপরে
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
# প্রত্যাশিত: README.md, azure.yaml, infra/, src/
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
# আপনার স্থানীয় ডাটাবেস সংযোগ দিয়ে .env ফাইলটি সম্পাদনা করুন
```

**Local Development Workflow**:
```sh
# নির্ভরশীলতা ইনস্টল করুন
cd src/web
pip install -r requirements.txt

# পরিবেশ ভেরিয়েবল সেট করুন
export SQL_CONNECTION_STRING="your-local-connection-string"

# অ্যাপ্লিকেশন চালান
python app.py
```

**Test locally**:
```sh
curl http://localhost:8000/health
# প্রত্যাশিত: {"status": "healthy", "database": "connected"}
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
   # ওয়েব অ্যাপ বন্ধ করুন (ডাটাবেসের জন্য খরচ এখনও থাকবে)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # প্রয়োজনে পুনরায় চালু করুন
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
- উচ্চ প্রতিক্রিয়া সময় (>2 seconds)

**উদাহরণ সতর্কতা তৈরি**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## সমস্যার সমাধান

### সাধারণ সমস্যাসমূহ এবং সমাধান

#### 1. `azd provision` ব্যর্থ হয় "অবস্থান উপলব্ধ নয়"

**লক্ষণ**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**সমাধান**:
বিকল্প Azure রিজিয়ন নির্বাচন করুন অথবা রিসোর্স প্রোভাইডার রেজিস্টার করুন:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL সংযোগ ডেপলয়মেন্টের সময় ব্যর্থ হয়

**লক্ষণ**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**সমাধান**:
- নিশ্চিত করুন SQL Server ফায়ারওয়াল Azure সার্ভিসগুলোকে অনুমতি দেয় (স্বয়ংক্রিয়ভাবে কনফিগার করা হয়)
- যাচাই করুন যে SQL অ্যাডমিন পাসওয়ার্ডটি `azd provision` চলার সময় সঠিকভাবে প্রবেশ করানো হয়েছিল
- নিশ্চিত করুন SQL Server সম্পূর্ণভাবে provision করা হয়েছে (2-3 মিনিট সময় লাগতে পারে)

**সংযোগ নিশ্চিত করুন**:
```sh
# Azure পোর্টাল থেকে SQL Database → Query editor-এ যান
# আপনার প্রমাণপত্র ব্যবহার করে সংযোগ করার চেষ্টা করুন
```

#### 3. ওয়েব অ্যাপ "Application Error" দেখায়

**লক্ষণ**:
ব্রাউজার একটি সাধারণ ত্রুটি পৃষ্ঠা দেখায়।

**সমাধান**:
অ্যাপ্লিকেশন লগগুলো পরীক্ষা করুন:
```sh
# সাম্প্রতিক লগ দেখুন
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**সাধারণ কারণসমূহ**:
- পরিবেশ ভেরিয়েবল অনুপস্থিত (App Service → Configuration পরীক্ষা করুন)
- Python প্যাকেজ ইনস্টলেশন ব্যর্থ হয়েছে (ডেপ্লয়মেন্ট লগ পরীক্ষা করুন)
- ডাটাবেস ইনিশিয়ালাইজেশন ত্রুটি (SQL সংযোগ পরীক্ষা করুন)

#### 4. `azd deploy` ব্যর্থ হয় "Build Error"

**লক্ষণ**:
```
Error: Failed to build project
```

**সমাধান**:
- নিশ্চিত করুন `requirements.txt` এ কোনো সিনট্যাক্স ত্রুটি নেই
- যাচাই করুন Python 3.11 `infra/resources/web-app.bicep` এ নির্দিষ্ট করা আছে
- নিশ্চিত করুন Dockerfile-এ সঠিক base image আছে

**লোকালভাবে ডিবাগ করুন**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD কমান্ড চালানোর সময় "Unauthorized"

**লক্ষণ**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**সমাধান**:
Azure-এ পুনরায় প্রমাণীকরণ করুন:
```sh
azd auth login
az login
```

যাচাই করুন আপনার সাবস্ক্রিপশনে সঠিক অনুমতিসমূহ (Contributor রোল) আছে কিনা।

#### 6. উচ্চ ডাটাবেস খরচ

**লক্ষণ**:
অপ্রত্যাশিত Azure বিল।

**সমাধান**:
- পরীক্ষার পরে `azd down` চালাতে ভুলোেছেন কি না যাচাই করুন
- যাচাই করুন SQL Database Basic টিয়ার ব্যবহার করছে (Premium নয়)
- Azure Cost Management-এ খরচসমূহ পর্যালোচনা করুন
- খরচ সংক্রান্ত সতর্কতা সেট করুন

### সহায়তা

**সমস্ত AZD পরিবেশ ভেরিয়েবল দেখুন**:
```sh
azd env get-values
```

**ডেপ্লয়মেন্ট স্ট্যাটাস পরীক্ষা করুন**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**অ্যাপ্লিকেশন লগগুলো অ্যাক্সেস করুন**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**আরও সাহায্য দরকার?**
- [AZD ট্রাবলশুটিং গাইড](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service সমস্যার সমাধান](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL সমস্যার সমাধান](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## ব্যবহারিক অনুশীলন

### অনুশীলন 1: আপনার ডেপ্লয়মেন্ট যাচাই করুন (প্রাথমিক)

**লক্ষ্য**: নিশ্চিত করুন সব রিসোর্স ডেপ্লয় হয়েছে এবং অ্যাপ্লিকেশন কাজ করছে।

**ধাপসমূহ**:
1. আপনার রিসোর্স গ্রুপে সব রিসোর্স তালিকাভুক্ত করুন:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **প্রত্যাশিত**: 6-7টি রিসোর্স (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. সমস্ত API এন্ডপয়েন্ট পরীক্ষা করুন:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **প্রত্যাশিত**: সবগুলো ত্রুটিমুক্ত বৈধ JSON রিটার্ন করে

3. Application Insights পরীক্ষা করুন:
   - Azure পোর্টালে Application Insights-এ যান
   - "Live Metrics"-এ যান
   - ওয়েব অ্যাপে আপনার ব্রাউজার রিফ্রেশ করুন
   **প্রত্যাশিত**: রিয়েল-টাইমে অনুরোধগুলো দেখা যায়

**সফলতার মানদণ্ড**: সব 6-7টি রিসোর্স বিদ্যমান, সব এন্ডপয়েন্ট ডেটা রিটার্ন করে, Live Metrics ক্রিয়াকলাপ দেখায়।

---

### অনুশীলন 2: একটি নতুন API এন্ডপয়েন্ট যোগ করুন (মধ্যবর্তী)

**লক্ষ্য**: Flask অ্যাপ্লিকেশনকে একটি নতুন এন্ডপয়েন্ট দিয়ে সম্প্রসারিত করুন।

**স্টার্টার কোড**: `src/web/app.py`-এ বর্তমান এন্ডপয়েন্টগুলো

**ধাপসমূহ**:
1. `src/web/app.py` সম্পাদনা করুন এবং `get_product()` ফাংশনের পরে একটি নতুন এন্ডপয়েন্ট যোগ করুন:
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

2. আপডেট করা অ্যাপ্লিকেশন ডেপ্লয় করুন:
   ```sh
   azd deploy
   ```

3. নতুন এন্ডপয়েন্ট পরীক্ষা করুন:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **প্রত্যাশিত**: "laptop"-এর সাথে মেলে এমন পণ্যগুলো রিটার্ন করে

**সফলতার মানদণ্ড**: নতুন এন্ডপয়েন্ট কাজ করে, ফিল্টার করা ফলাফল রিটার্ন করে, Application Insights লগে দেখা যায়।

---

### অনুশীলন 3: মনিটরিং এবং সতর্কতা যোগ করুন (উন্নত)

**লক্ষ্য**: সতর্কতার সাথে সক্রিয় মনিটরিং সেট আপ করুন।

**ধাপসমূহ**:
1. HTTP 500 এররগুলোর জন্য একটি অ্যালার্ট তৈরি করুন:
   ```sh
   # অ্যাপ্লিকেশন ইনসাইটস রিসোর্স আইডি পান
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # অ্যালার্ট তৈরি করুন
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. ত্রুটি সৃষ্ট করে অ্যালার্ট ট্রিগার করুন:
   ```sh
   # অস্তিত্বহীন পণ্য অনুরোধ করুন
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. যাচাই করুন অ্যালার্টটি ফায়ার হয়েছে কি না:
   - Azure Portal → Alerts → Alert Rules
   - আপনার ইমেইল চেক করুন (যদি কনফিগার করা থাকে)

**সফলতার মানদণ্ড**: অ্যালার্ট রুল তৈরি হয়েছে, ত্রুটিতে ট্রিগার হয়, নোটিফিকেশন গ্রহণ করা হয়।

---

### অনুশীলন 4: ডাটাবেস স্কিমা পরিবর্তন (উন্নত)

**লক্ষ্য**: একটি নতুন টেবিল যোগ করুন এবং অ্যাপ্লিকেশনকে এটি ব্যবহার করার জন্য পরিবর্তন করুন।

**ধাপসমূহ**:
1. Azure Portal Query Editor ব্যবহার করে SQL Database-এ সংযোগ করুন

2. একটি নতুন `categories` টেবিল তৈরি করুন:
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

3. রেসপন্সে ক্যাটাগরি তথ্য অন্তর্ভুক্ত করতে `src/web/app.py` আপডেট করুন

4. ডেপ্লয় এবং পরীক্ষা করুন

**সফলতার মানদণ্ড**: নতুন টেবিল বিদ্যমান, পণ্যগুলিতে ক্যাটাগরি তথ্য দেখা যায়, অ্যাপ্লিকেশন এখনও কাজ করছে।

---

### অনুশীলন 5: ক্যাশিং বাস্তবায়ন করুন (বিশেষজ্ঞ)

**লক্ষ্য**: পারফরম্যান্স উন্নত করতে Azure Redis Cache যোগ করুন।

**ধাপসমূহ**:
1. `infra/main.bicep`-এ Redis Cache যোগ করুন
2. পণ্য ক্যোয়ারিগুলি ক্যাশ করতে `src/web/app.py` আপডেট করুন
3. Application Insights দিয়ে পারফরম্যান্স উন্নতি পরিমাপ করুন
4. ক্যাশিং-এর আগে/পরে রেসপন্স সময় তুলনা করুন

**সফলতার মানদণ্ড**: Redis ডিপ্লয় করা হয়েছে, ক্যাশিং কাজ করে, রেসপন্স সময় >50% উন্নতি পেয়েছে।

**ইঙ্গিত**: শুরু করুন [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/)।

---

## ক্লিনআপ

চলমান চার্জ এড়াতে, কাজ শেষ হলে সব রিসোর্স মুছে ফেলুন:

```sh
azd down
```

**নিশ্চিতকরণ প্রম্পট**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` টাইপ করে নিশ্চিত করুন।

**✓ সফলতা যাচাই**: 
- Azure Portal থেকে সব রিসোর্স মুছে ফেলা হয়েছে
- কোনো চলমান চার্জ নেই
- স্থানীয় `.azure/<env-name>` ফোল্ডার মুছে ফেলা যেতে পারে

**বিকল্প** (ইনফ্রাসট্রাকচার রাখুন, ডেটা মুছে ফেলুন):
```sh
# শুধুমাত্র রিসোর্স গ্রুপ মুছে ফেলুন (AZD কনফিগ রাখুন)
az group delete --name rg-<env-name> --yes
```
## আরও জানুন

### সম্পর্কিত ডকুমেন্টেশন
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database ডকুমেন্টেশন](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service ডকুমেন্টেশন](https://learn.microsoft.com/azure/app-service/)
- [Application Insights ডকুমেন্টেশন](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep ভাষা রেফারেন্স](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### এই কোর্সে পরবর্তী ধাপসমূহ
- **[Container Apps উদাহরণ](../../../../examples/container-app)**: Azure Container Apps ব্যবহার করে মাইক্রোসার্ভিস ডেপ্লয় করুন
- **[AI ইন্টিগ্রেশন গাইড](../../../../docs/ai-foundry)**: আপনার অ্যাপে AI ক্ষমতা যোগ করুন
- **[ডেপ্লয়মেন্ট সেরা অনুশীলন](../../docs/chapter-04-infrastructure/deployment-guide.md)**: প্রোডাকশন ডেপ্লয়মেন্ট প্যাটার্নসমূহ

### উন্নত বিষয়সমূহ
- **Managed Identity**: পাসওয়ার্ড অপসারণ করুন এবং Azure AD প্রমাণীকরণ ব্যবহার করুন
- **Private Endpoints**: একটি ভার্চুয়াল নেটওয়ার্কের ভেতরে ডাটাবেস সংযোগগুলো সিকিউর করুন
- **CI/CD Integration**: GitHub Actions বা Azure DevOps দিয়ে ডেপ্লয়মেন্ট অটোমেট করুন
- **Multi-Environment**: dev, staging, এবং production পরিবেশ সেট আপ করুন
- **Database Migrations**: স্কিমা ভার্সনিং-এর জন্য Alembic বা Entity Framework ব্যবহার করুন

### অন্যান্য পদ্ধতির সাথে তুলনা

**AZD vs. ARM Templates**:
- ✅ AZD: উচ্চ-স্তরের বিমূর্ততা, সহজ কমান্ড
- ⚠️ ARM: বেশি বিস্তারিত, সূক্ষ্ম নিয়ন্ত্রণ

**AZD vs. Terraform**:
- ✅ AZD: Azure-নেটিভ, Azure সার্ভিসগুলোর সাথে ইন্টিগ্রেটেড
- ⚠️ Terraform: মাল্টি-ক্লাউড সমর্থন, বৃহত্তর ইকোসিস্টেম

**AZD vs. Azure Portal**:
- ✅ AZD: পুনরাবৃত্তযোগ্য, ভার্সন-কন্ট্রোলড, অটোমেটেবল
- ⚠️ Portal: ম্যানুয়াল ক্লিক, পুনরুত্পাদন কঠিন

AZD-কে ভাবুন: Azure-এর জন্য Docker Compose—জটিল ডেপ্লয়মেন্টের জন্য সরলীকৃত কনফিগারেশন।

---

## প্রায়শই জিজ্ঞাসিত প্রশ্নাবলি

**Q: কি আমি অন্য একটি প্রোগ্রামিং ভাষা ব্যবহার করতে পারি?**  
A: হ্যাঁ! `src/web/`-কে Node.js, C#, Go, বা কোনো ভাষায় প্রতিস্থাপন করুন। `azure.yaml` এবং Bicep অনুযায়ী আপডেট করুন।

**Q: আমি আরও ডাটাবেস কীভাবে যোগ করব?**  
A: `infra/main.bicep`-এ আরেকটি SQL Database মডিউল যোগ করুন অথবা Azure Database সার্ভিস থেকে PostgreSQL/MySQL ব্যবহার করুন।

**Q: আমি কি এটি প্রোডাকশনে ব্যবহার করতে পারি?**  
A: এটি একটি শুরু পয়েন্ট। প্রোডাকশনের জন্য যোগ করুন: managed identity, private endpoints, redundancy, ব্যাকআপ কৌশল, WAF, এবং উন্নত মনিটরিং।

**Q: যদি আমি কোড ডেপ্লয়মেন্টের পরিবর্তে কন্টেইনার ব্যবহার করতে চাই তাহলে?**  
A: দেখুন [Container Apps উদাহরণ](../../../../examples/container-app) যা জুড়ে Docker কন্টেইনার ব্যবহার করে।

**Q: কীভাবে আমার লোকাল মেশিন থেকে ডাটাবেসে সংযোগ করব?**  
A: আপনার IP-টি SQL Server ফায়ারওয়ালে যোগ করুন:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: নতুন ডাটাবেস তৈরি করার বদলে কি আমি একটি বিদ্যমান ডাটাবেস ব্যবহার করতে পারি?**  
A: হ্যাঁ, বিদ্যমান SQL Server রেফারেন্স করার জন্য `infra/main.bicep` পরিবর্তন করুন এবং connection string প্যারামিটারগুলো আপডেট করুন।

---

> **নোট:** এই উদাহরণটি AZD ব্যবহার করে ডাটাবেস সহ একটি ওয়েব অ্যাপ ডেপ্লয় করার সেরা অনুশীলনগুলো প্রদর্শন করে। এতে কাজ করা কোড, বিস্তৃত ডকুমেন্টেশন, এবং শেখার জন্য বাস্তব অনুশীলনগুলো অন্তর্ভুক্ত। প্রোডাকশন ডেপ্লয়মেন্টের জন্য, আপনার সংস্থার নির্দিষ্ট নিরাপত্তা, স্কেলিং, কমপ্লায়েন্স, এবং খরচের প্রয়োজনীয়তাগুলো পর্যালোচনা করুন।

**📚 কোর্স ন্যাভিগেশন:**
- ← পূর্ববর্তী: [Container Apps উদাহরণ](../../../../examples/container-app)
- → পরবর্তী: [AI ইন্টিগ্রেশন গাইড](../../../../docs/ai-foundry)
- 🏠 [কোর্স হোম](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা সঠিকতার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার নিজ ভাষায়ই প্রামাণ্য সূত্র হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝা বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->