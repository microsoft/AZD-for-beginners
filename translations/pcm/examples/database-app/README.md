# How to deploy Microsoft SQL Database and Web App wit AZD

⏱️ **Estimated Time**: 20-30 minutes | 💰 **Estimated Cost**: ~$15-25/month | ⭐ **Complexity**: Medium

Dis **complete, working example** dey show how to use the [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) to deploy a Python Flask web application wit a Microsoft SQL Database go Azure. All code dey inside and dem don test am—no external dependencies needed.

## Wetin You Go Learn

By completing this example, you go:
- Deploy multi-tier application (web app + database) using infrastructure-as-code
- Configure secure database connections without hardcoding secrets
- Monitor application health wit Application Insights
- Manage Azure resources sharp-sharp with AZD CLI
- Follow Azure best practices for security, cost optimization, and observability

## Scenario Overview
- **Web App**: Python Flask REST API wit database connectivity
- **Database**: Azure SQL Database wit sample data
- **Infrastructure**: Provisioned using Bicep (modular, reusable templates)
- **Deployment**: Fully automated wit `azd` commands
- **Monitoring**: Application Insights for logs and telemetry

## Prerequisites

### Required Tools

Before you start, make sure say you get these tools installed:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 or higher)
   ```sh
   az --version
   # Wetin e suppose show: azure-cli 2.50.0 wey pass dat
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 or higher)
   ```sh
   azd version
   # Wetin we dey expect as output: azd version 1.0.0 wey pass dat
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (for local development)
   ```sh
   python --version
   # Wetin suppose comot: Python 3.8 or pass
   ```

4. **[Docker](https://www.docker.com/get-started)** (optional, for local containerized development)
   ```sh
   docker --version
   # Wetin suppose show: Docker version 20.10 or pass
   ```

### Azure Requirements

- An active **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Permissions to create resources for your subscription
- **Owner** or **Contributor** role on the subscription or resource group

### Knowledge Prerequisites

Dis one na **intermediate-level** example. You suppose sabi:
- Basic command-line operations
- Fundamental cloud concepts (resources, resource groups)
- Basic understanding of web applications and databases

**New to AZD?** Start with the [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) first.

## Architecture

Dis example go deploy two-tier architecture wey get web application and SQL database:

```mermaid
graph TD
    Browser[Browser wey user dey use] <--> WebApp[Azure Web App<br/>Flask API<br/>/health<br/>/products]
    WebApp -- Connection wey secure<br/>E don encrypt --> SQL[Azure SQL Database<br/>Table wey get products<br/>Sample data]
```
**Resource Deployment:**
- **Resource Group**: Container for all resources
- **App Service Plan**: Linux-based hosting (B1 tier for cost efficiency)
- **Web App**: Python 3.11 runtime wit Flask application
- **SQL Server**: Managed database server wit TLS 1.2 minimum
- **SQL Database**: Basic tier (2GB, good for development/testing)
- **Application Insights**: Monitoring and logging
- **Log Analytics Workspace**: Centralized log storage

**Analogy**: Think say dis be like restaurant (web app) wey get walk-in freezer (database). Customers order from the menu (API endpoints), and the kitchen (Flask app) go carry ingredients (data) comot for the freezer. The restaurant manager (Application Insights) dey track everything wey happen.

## Folder Structure

All files dey inside dis example—no external dependencies required:

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
- **azure.yaml**: Tells AZD wetin to deploy and where
- **infra/main.bicep**: Orchestrates all Azure resources
- **infra/resources/*.bicep**: Individual resource definitions (modular for reuse)
- **src/web/app.py**: Flask application wit database logic
- **requirements.txt**: Python package dependencies
- **Dockerfile**: Containerization instructions for deployment

## Quickstart (Step-by-Step)

### Step 1: Clone and Navigate

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Success Check**: Make sure you see `azure.yaml` and `infra/` folder:
```sh
ls
# E suppose get: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate with Azure

```sh
azd auth login
```

Dis one go open your browser for Azure authentication. Sign in wit your Azure credentials.

**✓ Success Check**: You suppose see:
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```sh
azd init
```

**Wetn go happen**: AZD go create local configuration for your deployment.

**Prompts wey you go see**:
- **Environment name**: Enter short name (e.g., `dev`, `myapp`)
- **Azure subscription**: Choose your subscription from the list
- **Azure location**: Choose region (e.g., `eastus`, `westeurope`)

**✓ Success Check**: You suppose see:
```
SUCCESS: New project initialized!
```

### Step 4: Provision Azure Resources

```sh
azd provision
```

**Wetn go happen**: AZD go deploy all infrastructure (e fit take 5-8 minutes):
1. Creates resource group
2. Creates SQL Server and Database
3. Creates App Service Plan
4. Creates Web App
5. Creates Application Insights
6. Configures networking and security

**You go dey prompted for**:
- **SQL admin username**: Enter username (e.g., `sqladmin`)
- **SQL admin password**: Enter strong password (save am!)

**✓ Success Check**: You suppose see:
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

**Wetn go happen**: AZD go build and deploy your Flask application:
1. Packages the Python application
2. Builds the Docker container
3. Pushes to Azure Web App
4. Initializes the database wit sample data
5. Starts the application

**✓ Success Check**: You suppose see:
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

### Step 7: Test the API Endpoints

**Health Check** (make sure database connection dey):
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

**✓ Success Check**: All endpoints go return JSON data without errors.

---

**🎉 Congratulations!** You don successfully deploy web application wit database go Azure using AZD.

## Configuration Deep-Dive

### Environment Variables

Secrets dey managed securely via Azure App Service configuration—**no ever hardcode am for source code**.

**Configured Automatically by AZD**:
- `SQL_CONNECTION_STRING`: Database connection wit encrypted credentials
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetry endpoint
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Enables automatic dependency installation

**Where Secrets Dem Dey Stored**:
1. During `azd provision`, you go give SQL credentials via secure prompts
2. AZD go store dem for your local `.azure/<env-name>/.env` file (git-ignored)
3. AZD go inject dem into Azure App Service configuration (encrypted at rest)
4. Application go read dem via `os.getenv()` at runtime

### Local Development

For local testing, create `.env` file from the sample:

```sh
cp .env.sample .env
# Edit .env make e get your local database connection
```

**Local Development Workflow**:
```sh
# Install di dependencies
cd src/web
pip install -r requirements.txt

# Set di environment variables
export SQL_CONNECTION_STRING="your-local-connection-string"

# Run di application
python app.py
```

**Test locally**:
```sh
curl http://localhost:8000/health
# Wetin we expect: {"status": "fine", "database": "don connect"}
```

### Infrastructure as Code

All Azure resources dem dey define for **Bicep templates** (`infra/` folder):

- **Modular Design**: Each resource type get im own file for reusability
- **Parameterized**: You fit customize SKUs, regions, naming conventions
- **Best Practices**: E follow Azure naming standards and security defaults
- **Version Controlled**: Infrastructure changes dey tracked for Git

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

Dis example dey follow Azure security best practices:

### 1. **No Secrets in Source Code**
- ✅ Credentials dey stored in Azure App Service configuration (encrypted)
- ✅ `.env` files dey excluded from Git via `.gitignore`
- ✅ Secrets dey pass via secure parameters during provisioning

### 2. **Encrypted Connections**
- ✅ TLS 1.2 minimum for SQL Server
- ✅ HTTPS-only enforced for Web App
- ✅ Database connections dey use encrypted channels

### 3. **Network Security**
- ✅ SQL Server firewall configured to allow Azure services only
- ✅ Public network access restricted (you fit lock am more with Private Endpoints)
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
- ✅ Application Insights dey log all requests and errors
- ✅ SQL Database auditing enabled (you fit configure am for compliance)
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
   # Stop di web app (database still dey charge)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Start am again wen you need am
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Delete Everything After Testing**:
   ```sh
   azd down
   ```
   Dis one go remove ALL resources and stop charges.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (wey dem use for dis example)
   - **Production**: Standard/Premium tier wit redundancy

**Cost Monitoring**:
- View costs for [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Set up cost alerts make e no shock you
- Tag all resources wit `azd-env-name` for tracking

**Free Tier Alternative**:
For learning, you fit modify `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Note**: Free tier get limitations (60 min/day CPU, no always-on).

## Monitoring & Observability

### Application Insights Integration

Dis example include **Application Insights** for full monitoring:

**Wetin Dem Monitor**:
- ✅ HTTP requests (latency, status codes, endpoints)
- ✅ Application errors and exceptions
- ✅ Custom logging from Flask app
- ✅ Database connection health
- ✅ Performance metrics (CPU, memory)

**How to Access Application Insights**:
1. Open [Azure Portal](https://portal.azure.com)
2. Go your resource group (`rg-<env-name>`)
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
2. See requests, failures, and performance in real-time

**Set Up Alerts**:
Create alerts for critical events:
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
### Common Wahala and How to Solve Dem

#### 1. `azd provision` no go, e dey show "Location not available"

**Wetin dey happen**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**How to fix am**:
Pick another Azure region or register the resource provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL Connection No Connect During Deployment

**Wetin dey happen**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**How to fix am**:
- Make sure SQL Server firewall allow Azure services (e fit don configure automatically)
- Check say the SQL admin password na correct one wey you enter during `azd provision`
- Make sure SQL Server don fully provision (fit take 2-3 minutes)

**Check Connection**:
```sh
# For Azure Portal, waka go SQL Database → Query editor
# Try connect with your login details
```

#### 3. Web App dey show "Application Error"

**Wetin dey happen**:
Browser dey show generic error page.

**How to fix am**:
Check di application logs:
```sh
# See di latest logs
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Tin wey dey usually cause am**:
- Environment variables no dey (check App Service → Configuration)
- Python package installation fail (check deployment logs)
- Database initialization error (check SQL connectivity)

#### 4. `azd deploy` no work, e dey show "Build Error"

**Wetin dey happen**:
```
Error: Failed to build project
```

**How to fix am**:
- Make sure `requirements.txt` no get syntax errors
- Check say Python 3.11 dey specified inside `infra/resources/web-app.bicep`
- Make sure Dockerfile get correct base image

**Debug for local machine**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" When you dey run AZD commands

**Wetin dey happen**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**How to fix am**:
Login again with Azure:
```sh
azd auth login
az login
```

Make sure say you get the correct permissions (Contributor role) on the subscription.

#### 6. Database Costs Too High

**Wetin dey happen**:
Azure bill wey you no expect.

**How to fix am**:
- Check if you forget to run `azd down` after testing
- Make sure SQL Database dey use Basic tier (no be Premium)
- Review costs for Azure Cost Management
- Set up cost alerts

### How to Get Help

**See All AZD Environment Variables**:
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

**Need more help?**
- [AZD Troubleshooting Guide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Practical Exercises

### Exercise 1: Make sure your deployment dey work (Beginner)

**Goal**: Confirm say all resources don deploy and the application dey work.

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
   **Expected**: All return valid JSON without errors

3. Check Application Insights:
   - Go Application Insights for Azure Portal
   - Go to "Live Metrics"
   - Refresh your browser for the web app
   **Expected**: You go see requests wey dey appear for real-time

**Success Criteria**: All 6-7 resources dey, all endpoints dey return data, Live Metrics dey show activity.

---

### Exercise 2: Add New API Endpoint (Intermediate)

**Goal**: Extend the Flask app with one new endpoint.

**Starter Code**: Current endpoints for `src/web/app.py`

**Steps**:
1. Edit `src/web/app.py` and add new endpoint after the `get_product()` function:
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

2. Deploy the updated application:
   ```sh
   azd deploy
   ```

3. Test the new endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Expected**: Returns products wey match "laptop"

**Success Criteria**: New endpoint dey work, e return filtered results, e go show for Application Insights logs.

---

### Exercise 3: Add Monitoring and Alerts (Advanced)

**Goal**: Set up proactive monitoring with alerts.

**Steps**:
1. Create alert for HTTP 500 errors:
   ```sh
   # Make we get Application Insights resource ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Make alert
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Trigger the alert by causing errors:
   ```sh
   # Ask for product wey no dey
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Check if the alert fire:
   - Azure Portal → Alerts → Alert Rules
   - Check your email (if you don configure am)

**Success Criteria**: Alert rule don create, e trigger on errors, notifications dey reach you.

---

### Exercise 4: Database Schema Changes (Advanced)

**Goal**: Add one new table and modify the application make e use am.

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

3. Update `src/web/app.py` make e include category info for responses

4. Deploy and test

**Success Criteria**: New table dey, products dey show category info, application still dey work.

---

### Exercise 5: Implement Caching (Expert)

**Goal**: Add Azure Redis Cache to make performance better.

**Steps**:
1. Add Redis Cache to `infra/main.bicep`
2. Update `src/web/app.py` to cache product queries
3. Measure performance improvement with Application Insights
4. Compare response times before/after caching

**Success Criteria**: Redis don deploy, caching dey work, response times improve by >50%.

**Hint**: Start with [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Cleanup

To avoid ongoing charges, delete all resources when you finish:

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
# Comot only di resource group (leave AZD config)
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
- **[Container Apps Example](../../../../examples/container-app)**: Deploy microservices with Azure Container Apps
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Add AI capabilities to your app
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Production deployment patterns

### Advanced Topics
- **Managed Identity**: Remove passwords and use Azure AD authentication
- **Private Endpoints**: Secure database connections inside virtual network
- **CI/CD Integration**: Automate deployments with GitHub Actions or Azure DevOps
- **Multi-Environment**: Set up dev, staging, and production environments
- **Database Migrations**: Use Alembic or Entity Framework for schema versioning

### Comparison to Other Approaches

**AZD vs. ARM Templates**:
- ✅ AZD: Higher-level abstraction, simpler commands
- ⚠️ ARM: More verbose, granular control

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrated with Azure services
- ⚠️ Terraform: Multi-cloud support, larger ecosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Repeatable, version-controlled, automatable
- ⚠️ Portal: Manual clicks, hard to reproduce

**Think of AZD as**: Docker Compose for Azure—simplified configuration for complex deployments.

---

## Frequently Asked Questions

**Q: I fit use different programming language?**  
A: Yes! Replace `src/web/` with Node.js, C#, Go, or any language. Update `azure.yaml` and Bicep as needed.

**Q: How I go add more databases?**  
A: Add another SQL Database module inside `infra/main.bicep` or use PostgreSQL/MySQL from Azure Database services.

**Q: I fit use this for production?**  
A: This one na starting point. For production, add: managed identity, private endpoints, redundancy, backup strategy, WAF, and better monitoring.

**Q: Wetin if I wan use containers instead of code deployment?**  
A: Check the [Container Apps Example](../../../../examples/container-app) wey dey use Docker containers everywhere.

**Q: How I go connect to the database from my local machine?**  
A: Add your IP to the SQL Server firewall:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: I fit use existing database instead of creating new one?**  
A: Yes, change `infra/main.bicep` to reference the existing SQL Server and update the connection string parameters.

---

> **Note:** This example dey show best practices for deploying web app with database using AZD. E include working code, good documentation, and practical exercises to help you learn. For production deployments, review security, scaling, compliance, and cost requirements wey concern your organization.

**📚 Course Navigation:**
- ← Previous: [Container Apps Example](../../../../examples/container-app)
- → Next: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Course Home](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Abeg read:

Dis document don translate by AI translation service [Co-op Translator] (https://github.com/Azure/co-op-translator). Even though we try make am correct, abeg sabi say machine translation fit get mistakes or wrong parts. Di original document for im original language na di correct source. If na important information, make you use professional human translation. We no go responsible for any misunderstanding or wrong interpretation wey fit come from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->