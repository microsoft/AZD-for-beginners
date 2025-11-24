<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-24T14:37:22+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "pcm"
}
-->
# How to Deploy Microsoft SQL Database and Web App wit AZD

⏱️ **Time wey e go take**: 20-30 minutes | 💰 **Cost wey e go cost**: ~$15-25/month | ⭐ **Level**: Intermediate

Dis **complete, working example** go show you how you fit use [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) take deploy Python Flask web app wey get Microsoft SQL Database for Azure. All di code dey inside and e don test—no need any external dependency.

## Wetin You Go Learn

If you finish dis example, you go sabi:
- Deploy app wey get two parts (web app + database) using infrastructure-as-code
- Set secure database connection without putting secret for code
- Monitor app health wit Application Insights
- Manage Azure resources well wit AZD CLI
- Follow Azure best practices for security, cost management, and observability

## Overview of Wetin We Wan Do
- **Web App**: Python Flask REST API wey connect to database
- **Database**: Azure SQL Database wey get sample data
- **Infrastructure**: E dey provision wit Bicep (modular, reusable templates)
- **Deployment**: E dey fully automated wit `azd` commands
- **Monitoring**: Application Insights go dey collect logs and telemetry

## Wetin You Go Need

### Tools We You Go Need

Before you start, make sure say you don install dis tools:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```sh
   az --version
   # Expected output: azure-cli 2.50.0 or higher
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```sh
   azd version
   # Expected output: azd version 1.0.0 or higher
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (for local development)
   ```sh
   python --version
   # Di output wey we dey expect na Python 3.8 or higher
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, if you wan do local containerized development)
   ```sh
   docker --version
   # Expected output: Docker version 20.10 or higher
   ```

### Azure Requirements

- You go need active **Azure subscription** ([create free account](https://azure.microsoft.com/free/))
- Permission to create resources for your subscription
- **Owner** or **Contributor** role for di subscription or resource group

### Wetin You Suppose Sabi

Dis one na **intermediate-level** example. You suppose sabi:
- Basic command-line operations
- Basic cloud concepts (resources, resource groups)
- Small knowledge about web apps and databases

**New to AZD?** Start wit di [Getting Started guide](../../docs/getting-started/azd-basics.md) first.

## Architecture

Dis example go deploy two-tier architecture wey get web app and SQL database:

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
- **Resource Group**: E go hold all di resources
- **App Service Plan**: Linux-based hosting (B1 tier wey cheap)
- **Web App**: Python 3.11 runtime wey get Flask app
- **SQL Server**: Managed database server wey get TLS 1.2 minimum
- **SQL Database**: Basic tier (2GB, good for development/testing)
- **Application Insights**: For monitoring and logging
- **Log Analytics Workspace**: For centralized log storage

**Analogy**: Imagine say dis na restaurant (web app) wey get freezer (database). Customers go order food (API endpoints), di kitchen (Flask app) go collect ingredients (data) from di freezer. Di restaurant manager (Application Insights) go dey track everything wey happen.

## Folder Structure

All di files wey you need dey dis example—no need external dependency:

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

**Wetin Each File Dey Do:**
- **azure.yaml**: E dey tell AZD wetin to deploy and where
- **infra/main.bicep**: E dey arrange all Azure resources
- **infra/resources/*.bicep**: E dey define each resource (modular for reuse)
- **src/web/app.py**: Flask app wey get database logic
- **requirements.txt**: Python package dependencies
- **Dockerfile**: Instructions for container deployment

## Quickstart (Step-by-Step)

### Step 1: Clone and Navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Success Check**: Make sure say you see `azure.yaml` and `infra/` folder:
```sh
ls
# Expected: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate wit Azure

```sh
azd auth login
```

Dis one go open your browser make you sign in wit your Azure credentials.

**✓ Success Check**: You suppose see:
```
Logged in to Azure.
```

### Step 3: Initialize di Environment

```sh
azd init
```

**Wetin go happen**: AZD go create local configuration for your deployment.

**Questions wey dem go ask you**:
- **Environment name**: Enter short name (e.g., `dev`, `myapp`)
- **Azure subscription**: Choose your subscription from di list
- **Azure location**: Pick region (e.g., `eastus`, `westeurope`)

**✓ Success Check**: You suppose see:
```
SUCCESS: New project initialized!
```

### Step 4: Provision Azure Resources

```sh
azd provision
```

**Wetin go happen**: AZD go deploy all di infrastructure (e go take 5-8 minutes):
1. Create resource group
2. Create SQL Server and Database
3. Create App Service Plan
4. Create Web App
5. Create Application Insights
6. Configure networking and security

**Dem go ask you for**:
- **SQL admin username**: Enter username (e.g., `sqladmin`)
- **SQL admin password**: Enter strong password (make sure you save am!)

**✓ Success Check**: You suppose see:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Time**: 5-8 minutes

### Step 5: Deploy di Application

```sh
azd deploy
```

**Wetin go happen**: AZD go build and deploy your Flask app:
1. Package di Python app
2. Build di Docker container
3. Push am to Azure Web App
4. Initialize di database wit sample data
5. Start di app

**✓ Success Check**: You suppose see:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Time**: 3-5 minutes

### Step 6: Browse di Application

```sh
azd browse
```

Dis one go open your deployed web app for browser for `https://app-<unique-id>.azurewebsites.net`

**✓ Success Check**: You suppose see JSON output:
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

### Step 7: Test di API Endpoints

**Health Check** (make sure database dey connect well):
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

**✓ Success Check**: All endpoints suppose return JSON data without error.

---

**🎉 Congrats!** You don successfully deploy web app wey get database for Azure using AZD.

## Configuration Deep-Dive

### Environment Variables

Secrets dey managed securely via Azure App Service configuration—**no put am for source code**.

**AZD go configure am automatically**:
- `SQL_CONNECTION_STRING`: Database connection wey get encrypted credentials
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: E dey enable automatic dependency installation

**Where Secrets Dey Store**:
1. During `azd provision`, you go provide SQL credentials via secure prompts
2. AZD go store am for your local `.azure/<env-name>/.env` file (git-ignored)
3. AZD go inject am into Azure App Service configuration (encrypted at rest)
4. App go read am via `os.getenv()` when e dey run

### Local Development

If you wan test for local, create `.env` file from di sample:

```sh
cp .env.sample .env
# Change .env make e match your local database connection
```

**Local Development Workflow**:
```sh
# Install di things wey di app need
cd src/web
pip install -r requirements.txt

# Set di environment variables
export SQL_CONNECTION_STRING="your-local-connection-string"

# Run di app
python app.py
```

**Test locally**:
```sh
curl http://localhost:8000/health
# Expected: {"status": "healthy", "database": "connected"}
```

### Infrastructure as Code

All Azure resources dey defined for **Bicep templates** (`infra/` folder):

- **Modular Design**: Each resource type get im own file for reusability
- **Parameterized**: You fit customize SKUs, regions, naming conventions
- **Best Practices**: E dey follow Azure naming standards and security defaults
- **Version Controlled**: Infrastructure changes dey tracked for Git

**Example of Customization**:
If you wan change di database tier, edit `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Security Best Practices

Dis example dey follow Azure security best practices:

### 1. **No Secrets for Source Code**
- ✅ Credentials dey store for Azure App Service configuration (encrypted)
- ✅ `.env` files dey excluded from Git via `.gitignore`
- ✅ Secrets dey pass via secure parameters during provisioning

### 2. **Encrypted Connections**
- ✅ TLS 1.2 minimum for SQL Server
- ✅ HTTPS-only dey enforced for Web App
- ✅ Database connections dey use encrypted channels

### 3. **Network Security**
- ✅ SQL Server firewall dey configured to allow Azure services only
- ✅ Public network access dey restricted (you fit lock am down more wit Private Endpoints)
- ✅ FTPS dey disabled for Web App

### 4. **Authentication & Authorization**
- ⚠️ **Current**: SQL authentication (username/password)
- ✅ **Production Recommendation**: Use Azure Managed Identity for passwordless authentication

**How to Upgrade to Managed Identity** (for production):
1. Enable managed identity for Web App
2. Give di identity SQL permissions
3. Update connection string to use managed identity
4. Remove password-based authentication

### 5. **Auditing & Compliance**
- ✅ Application Insights dey log all requests and errors
- ✅ SQL Database auditing dey enabled (you fit configure am for compliance)
- ✅ All resources dey tagged for governance

**Security Checklist Before Production**:
- [ ] Enable Azure Defender for SQL
- [ ] Configure Private Endpoints for SQL Database
- [ ] Enable Web Application Firewall (WAF)
- [ ] Use Azure Key Vault for secret rotation
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

2. **Stop Resources When You No Dey Use Dem**:
   ```sh
   # Stop di web app (database go still dey charge)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Restart am wen e dey necessary
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Delete Everything After Testing**:
   ```sh
   azd down
   ```
   Dis one go remove ALL resources and stop charges.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (we dey use for dis example)
   - **Production**: Standard/Premium tier wey get redundancy

**Cost Monitoring**:
- Check costs for [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Set cost alerts make you no get surprise
- Tag all resources wit `azd-env-name` for tracking

**Free Tier Alternative**:
If na learning you dey do, you fit modify `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Note**: Free tier get limitations (60 min/day CPU, no always-on).

## Monitoring & Observability

### Application Insights Integration

Dis example include **Application Insights** for better monitoring:

**Wetin E Dey Monitor**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ App errors and exceptions
- ✅ Custom logging from Flask app
- ✅ Database connection health
- ✅ Performance metrics (CPU, memory)

**How to Access Application Insights**:
1. Open [Azure Portal](https://portal.azure.com)
2. Go to your resource group (`rg-<env-name>`)
3. Click Application Insights resource (`appi-<unique-id>`)

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

**SQL Database auditing dey enabled** to track:
- Database access patterns
- Failed login attempts
- Schema changes
- Data access (for compliance)

**How to Access Audit Logs**:
1. Azure Portal → SQL Database → Auditing
2. View logs for Log Analytics workspace

### Real-Time Monitoring

**View Live Metrics**:
1. Application Insights → Live Metrics
2. See requests, failures, and performance live

**Set Up Alerts**:
Create alerts for important events:
- HTTP 500 errors > 5 in 5 minutes
- Database connection failures
- High response times (>2 seconds)

**Example Alert Creation**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Troubleshooting

### Common Issues and Solutions

#### 1. `azd provision` no work wit "Location no dey available"

**Symptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Solution**:
Pick another Azure region or register di resource provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL Connection no work during Deployment

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Solution**:
- Make sure SQL Server firewall dey allow Azure services (e go configure am automatically)
- Check say di SQL admin password wey you enter during `azd provision` dey correct
- Make sure say SQL Server don fully provision (e fit take 2-3 minutes)

**Verify Connection**:
```sh
# From Azure Portal, go SQL Database → Query editor
# Try connect wit your credentials
```

#### 3. Web App dey show "Application Error"

**Symptom**:
Browser dey show general error page.

**Solution**:
Check application logs:
```sh
# See di logs wey dem do recently
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Common causes**:
- Environment variables no dey (check App Service → Configuration)
- Python package installation fail (check deployment logs)
- Database initialization error (check SQL connectivity)

#### 4. `azd deploy` no work wit "Build Error"

**Symptom**:
```
Error: Failed to build project
```

**Solution**:
- Make sure `requirements.txt` no get syntax error
- Check say Python 3.11 dey specified for `infra/resources/web-app.bicep`
- Confirm say Dockerfile get correct base image

**Debug locally**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" wen you dey run AZD Commands

**Symptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Solution**:
Re-authenticate wit Azure:
```sh
azd auth login
az login
```

Confirm say you get di correct permissions (Contributor role) for di subscription.

#### 6. High Database Costs

**Symptom**:
Unexpected Azure bill.

**Solution**:
- Check if you forget to run `azd down` after testing
- Confirm say SQL Database dey use Basic tier (no be Premium)
- Review costs for Azure Cost Management
- Set up cost alerts

### Getting Help

**View All AZD Environment Variables**:
```sh
azd env get-values
```

**Check Deployment Status**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Access Application Logs**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Need More Help?**
- [AZD Troubleshooting Guide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Practical Exercises

### Exercise 1: Verify Your Deployment (Beginner)

**Goal**: Confirm say all resources don deploy and di application dey work.

**Steps**:
1. List all resources for your resource group:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Expected**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Test all API endpoints:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Expected**: All dey return valid JSON without errors

3. Check Application Insights:
   - Go Application Insights for Azure Portal
   - Go "Live Metrics"
   - Refresh your browser for di web app
   **Expected**: You go see requests dey show for real-time

**Success Criteria**: All 6-7 resources dey, all endpoints dey return data, Live Metrics dey show activity.

---

### Exercise 2: Add a New API Endpoint (Intermediate)

**Goal**: Add new endpoint for di Flask application.

**Starter Code**: Current endpoints dey for `src/web/app.py`

**Steps**:
1. Edit `src/web/app.py` and add new endpoint after di `get_product()` function:
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

2. Deploy di updated application:
   ```sh
   azd deploy
   ```

3. Test di new endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Expected**: E go return products wey match "laptop"

**Success Criteria**: New endpoint dey work, e dey return filtered results, e dey show for Application Insights logs.

---

### Exercise 3: Add Monitoring and Alerts (Advanced)

**Goal**: Set up monitoring wey dey proactive wit alerts.

**Steps**:
1. Create alert for HTTP 500 errors:
   ```sh
   # Get Application Insights resource ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Create alert
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Trigger di alert by causing errors:
   ```sh
   # Ask for product wey no dey
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Check if di alert fire:
   - Azure Portal → Alerts → Alert Rules
   - Check your email (if e dey configured)

**Success Criteria**: Alert rule don create, e dey trigger for errors, notifications dey received.

---

### Exercise 4: Database Schema Changes (Advanced)

**Goal**: Add new table and modify di application to dey use am.

**Steps**:
1. Connect to SQL Database via Azure Portal Query Editor

2. Create new `categories` table:
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

3. Update `src/web/app.py` to include category information for responses

4. Deploy and test

**Success Criteria**: New table dey exist, products dey show category information, application still dey work.

---

### Exercise 5: Implement Caching (Expert)

**Goal**: Add Azure Redis Cache to improve performance.

**Steps**:
1. Add Redis Cache to `infra/main.bicep`
2. Update `src/web/app.py` to dey cache product queries
3. Measure performance improvement wit Application Insights
4. Compare response times before/after caching

**Success Criteria**: Redis don deploy, caching dey work, response times don improve by >50%.

**Hint**: Start wit [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Cleanup

To avoid ongoing charges, delete all resources wen you don finish:

```sh
azd down
```

**Confirmation prompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Type `y` to confirm.

**✓ Success Check**: 
- All resources don delete from Azure Portal
- No ongoing charges
- Local `.azure/<env-name>` folder fit delete

**Alternative** (keep infrastructure, delete data):
```sh
# Delete only di resource group (keep AZD config)
az group delete --name rg-<env-name> --yes
```
## Learn More

### Related Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Next Steps in This Course
- **[Container Apps Example](../../../../examples/container-app)**: Deploy microservices wit Azure Container Apps
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Add AI capabilities to your app
- **[Deployment Best Practices](../../docs/deployment/deployment-guide.md)**: Production deployment patterns

### Advanced Topics
- **Managed Identity**: Remove passwords and use Azure AD authentication
- **Private Endpoints**: Secure database connections inside virtual network
- **CI/CD Integration**: Automate deployments wit GitHub Actions or Azure DevOps
- **Multi-Environment**: Set up dev, staging, and production environments
- **Database Migrations**: Use Alembic or Entity Framework for schema versioning

### Comparison to Other Approaches

**AZD vs. ARM Templates**:
- ✅ AZD: Higher-level abstraction, simpler commands
- ⚠️ ARM: More verbose, granular control

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrated wit Azure services
- ⚠️ Terraform: Multi-cloud support, larger ecosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Repeatable, version-controlled, automatable
- ⚠️ Portal: Manual clicks, hard to reproduce

**Think of AZD as**: Docker Compose for Azure—simplified configuration for complex deployments.

---

## Frequently Asked Questions

**Q: I fit use another programming language?**  
A: Yes! Replace `src/web/` wit Node.js, C#, Go, or any language. Update `azure.yaml` and Bicep as e dey necessary.

**Q: How I go add more databases?**  
A: Add another SQL Database module for `infra/main.bicep` or use PostgreSQL/MySQL from Azure Database services.

**Q: I fit use am for production?**  
A: Dis na starting point. For production, add: managed identity, private endpoints, redundancy, backup strategy, WAF, and enhanced monitoring.

**Q: Wetin I go do if I wan use containers instead of code deployment?**  
A: Check di [Container Apps Example](../../../../examples/container-app) wey dey use Docker containers throughout.

**Q: How I go connect to di database from my local machine?**  
A: Add your IP to di SQL Server firewall:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: I fit use existing database instead of creating new one?**  
A: Yes, modify `infra/main.bicep` to reference existing SQL Server and update di connection string parameters.

---

> **Note:** Dis example dey show best practices for deploying web app wit database using AZD. E include working code, complete documentation, and practical exercises to help you learn. For production deployments, review security, scaling, compliance, and cost requirements wey dey specific to your organization.

**📚 Course Navigation:**
- ← Previous: [Container Apps Example](../../../../examples/container-app)
- → Next: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Course Home](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even as we dey try make am accurate, abeg sabi say AI translation fit get mistake or no dey 100% correct. Di original dokyument for im native language na di main source wey you go trust. For important information, e better make professional human translator check am. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->