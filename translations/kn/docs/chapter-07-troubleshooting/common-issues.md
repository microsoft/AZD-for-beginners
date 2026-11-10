# ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

**ಅಧ್ಯಾಯ ಸಂಚಾರ:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 6: ಪೂರ್ವ ವಿಮಾನ ಪರಿಶೀಲನೆಗಳು](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ಮುಂದಿನದು**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್‌ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)

## ಪರಿಚಯ

ಆಜೂರ್ ಡೆವಲಪರ್ CLI ಬಳಕೆ ವೇಳೆ ಸಾಮಾನ್ಯವಾಗಿ ಎದುರಿಸಿಕೊಂಡು ಬರುವ ಸಮಸ್ಯೆಗಳನ್ನು ಈ ಸಮಗ್ರ ಸಮಸ್ಯಾಸಮಾಧಾನ ಮಾರ್ಗದರ್ಶಿ ಒಳಗೊಂಡಿದೆ. ಪ್ರామಾಣೀಕರಣ, ನಿಯೋಜನೆ, ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸ, ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನೆ ಸಂಬಂಧಿಸಿದ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಗುರುತಿಸಲು, ಪರಿಹರಿಸಲು ಮತ್ತು ಸಮಸ್ಯೆ ನಿವಾರಣೆ ಮಾಡಲು ಕಲಿಯಿರಿ. ಪ್ರತಿಯೊಂದು ಸಮಸ್ಯೆಯು ವಿಶದ ಲಕ್ಷಣಗಳು, ಮೂಲ ಕಾರಣಗಳು ಮತ್ತು ಹಂತದ ಹಂತದಲ್ಲಿ ಪರಿಹಾರ ನೀಡುವ ಕ್ರಮಗಳನ್ನು ಒಳಗೊಂಡಿದೆ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶನವನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಆಜೂರ್ ಡೆವಲಪರ್ CLI ಸಮಸ್ಯೆಗಳ ಮುಖಾಮುಖಿಗಾಗಲು ವೈದ್ಯಕೀಯ ತಂತ್ರಗಳನ್ನು ಪರಿಣತಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ಸಾಮಾನ್ಯ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುದಾನ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು, ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸ ದೋಷಗಳು ಮತ್ತು ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸುತ್ತೀರಿ
- ಮುಂಚಿತದ ನಿಗಾ ಮತ್ತು ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಅನುಸರಿಸುತ್ತೀರಿ
- ಸಂಕೀರ್ಣ ಸಮಸ್ಯೆಗಳಿಗೆ ಸಮಗ್ರ ಸಮಸ್ಯಾನಿರ್ವಹಣಾ ವಿಧಾನಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೀರಿ
- ಭವಿಷ್ಯದ ಸಮಸ್ಯೆಗಳನ್ನು ತಡೆಯಲು ಸರಿಯಾದ ಲಾಗಿಂಗ್ ಮತ್ತು ನಿಗಾವಳಿಗಳನ್ನು ಸಂರಚಿಸುತ್ತೀರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ಮೇಲೆ, ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ಆಜೂರ್ ಡೆವಲಪರ್ CLI ಸಮಸ್ಯೆಗಳನ್ನು ಒಳಗೊಂಡ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಸಾಧನಗಳನ್ನು ಬಳಸಿ ಗುರುತಿಸಲು
- ಪ್ರಾಮಾಣೀಕರಣ, ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಮತ್ತು ಅನುಮತಿ ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಪರಿಹರಿಸಲು
- ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸ ದೋಷಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಪರಿಹರಿಸಲು
- ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳನ್ನು ಮತ್ತು ಸುತ್ತಲೂ ವಿಶೇಷ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಲು
- ಮುಂಚಿತವಾಗಿ ಸಾಧ್ಯವಿರುವ ಸಮಸ್ಯೆಗಳನ್ನು ಗುರುತಿಸಲು ನಿಗಾವಳಿ ಮತ್ತು ಎಚ್ಚರಿಕೆ ಕಾರ್ಯವಿಧಾನಗಳನ್ನು ಅನುಷ್ಟಾನಗೊಳಿಸಲು
- ಲಾಗಿಂಗ್, ಡಿಬಗಿಂಗ್ ಮತ್ತು ಸಮಸ್ಯೆ ಪರಿಹಾರ ಕಾರ್ಯಪ್ರವಾಹಗಳಿಗೆ ಚರವ್ಯ ಕ್ರಮಗಳನ್ನು ಅನ್ವಯಿಸಲು

## ತ್ವರಿತ ಡಯಾಗ್ನೋಸ್ಟಿಕ್‍ಗಳು

> ಉದಾಹರಣಾ ಹೆಸರುಗಳು/ಐಡಿಯಾಗಿ ನಿಮ್ಮ ಪರಿಸರವಿನ ಮೌಲ್ಯಗಳಿಂದ ಬದಲಿ ಮಾಡಿ. ಬ್ಯಾಶ್, ಬೈಸಿಪ್, ಜಾವಾಸ್ಕ್ರಿಪ್ಟ್, ಮತ್ತು ಪ್ಯಾರಾಮೀಟರ್ ಫೈಲ್ ತುಣುಕುಗಳನ್ನು ಕೆಳಗೆ ಪ್ರತ್ಯೇಕವಾಗಿ ಗುರುತಿಸಲಾಗಿದೆ; ಅವು ಒಳಗೊಂಡ ಒಂದು ನಿರ್ವಹಣಾ ಸ್ಕ್ರಿಪ್ಟ್ ಅಲ್ಲ. ನಾಶಕಾರಿ ಕಾರ್ಯಾಚರಣೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ರಹಸ್ಯಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳುವ ಮೊದಲು ಇಲ್ಲಿಸಿರಿ. `azd monitor --logs` ಬ್ರೌಸರನ್ನು ತೆರೆಯುತ್ತದೆ; ಇದು ಟರ್ಮಿನಲ್ ಲಾಗ್‌ಗಳನ್ನು ಹರಡುವುದಿಲ್ಲ.

ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆಗಳಿಗೆ ಮುಂಚೆ, ಈ ಆಜ್ಞೆಗಳನ್ನು ತಕರಾರು ಮಾಹಿತಿ ಸಂಗ್ರಹಿಸಲು ಚಲಾಯಿಸಿ:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## ಪ್ರಾಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: "ಪ್ರವೇಶ ಟೋಕನ್ ಪಡೆಯಲು ವಿಫಲವಾಗಿದೆ"
**ಲಕ್ಷಣಗಳು:**
- `azd up` ಪ್ರಾಮಾಣೀಕರಣ ದೋಷಗಳಿಂದ ವಿಫಲವಾಗುತ್ತದೆ
- ಆಜ್ಞೆಗಳು "ಅನಧಿಕೃತ" ಅಥವಾ "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ಎಂದು ತಿರುಗಿಸುತ್ತದೆ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### ಸಮಸ್ಯೆ: ನಿಯೋಜನೆಯ ಸಮಯದಲ್ಲಿ "ಅಪರ್ಯಾಯ ಸೌಲಭ್ಯಗಳು" ಇಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆ ಅನುಮತಿ ದೋಷಗಳಿಂದ ವಿಫಲವಾಗುತ್ತದೆ
- ಕೆಲವು ಆಜೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುವದು ಸಾಧ್ಯವಿಲ್ಲ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ಸಮಸ್ಯೆ: ಬಹು-ಟೆನಂಟ್ ಪ್ರಾಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳು
**ಪರೀಹಾರಗಳು:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ಮೂಲಸೌಕರ್ಯ ವಿನ್ಯಾಸ ದೋಷಗಳು

### ಸಮಸ್ಯೆ: ಸಂಪನ್ಮೂಲ ಹೆಸರು ಸಂಘರ್ಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- "ಸಂಪನ್ಮೂಲ ಹೆಸರು ಈಗಾಗಲೇ ಇದೆ" ಎಂಬ ದೋಷಗಳು
- ಸಂಪನ್ಮೂಲ ರಚನೆಯ ಸಮಯದಲ್ಲಿ ನಿಯೋಜನೆ ವಿಫಲವಾಗುತ್ತದೆ

**ಪರೀಹಾರಗಳು:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### ಸಮಸ್ಯೆ: ಸ್ಥಳ / ಪ್ರಾಂತ್ಯ ಲಭ್ಯವಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- "ಸ್ಥಳ 'xyz' ಆ ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಕ್ಕೆ ಲಭ್ಯವಿಲ್ಲ"
- ಆರಿಸಿಕೊಂಡ ಪ್ರದೇಶದಲ್ಲಿ ಕೆಲವು SKUಗಳು ಲಭ್ಯವಿಲ್ಲ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

ಸ್ಥಳದ ಬದಲಾವಣೆ ಪಡೆಯುವುದರಿಂದ ಇತ್ತೀಚಿನ ಸಂಪನ್ಮೂಲಗಳು ಸ್ಥಳಾಂತರವಾಗುವುದಿಲ್ಲ. ಇತ್ತೀಚಿನ ಸಂಪನ್ಮೂಲ ಗುಂಪು ಅಥವಾ ಸಂಪನ್ಮೂಲ ಸ್ಥಳ ಬದಲಾವಣೆಯನ್ನು ನಿರಾಕರಿಸಬಹುದು; ಪ್ರಾಂತ್ಯೀಯ ಮರುನಿಯೋಜನೆಗೆ ಹಿಜರಾತ್ ಪರಿಸರವನ್ನು ಉಪಯೋಗಿಸಿ.

### ಸಮಸ್ಯೆ: ಹೊರಗೆ ಬಿದ್ದ ಕೋಟಾ ದೋಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- "ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರದ ಕೋಟಾ ಮೀರಿದೆ"
- "ಗರಿಷ್ಠ ಸಂಖ್ಯೆಯ ಸಂಪನ್ಮೂಲಗಳು ತಲುಪಿವೆ"

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

ಅಭಿವೃದ್ಧಿಗಾಗಿ, `infra/main.parameters.json` ನಲ್ಲಿ ಬೆಂಬಲಿತ ಸಣ್ಣ SKU ಅನ್ನು ಆಯ್ಕೆಮಾಡಿ:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ಸಮಸ್ಯೆ: ಬೈಸಿಪ್ ಟೆಂಪ್ಲೇಟಿನ ದೋಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಟೆಂಪ್ಲೇಟಿನ ಮಾನ್ಯತೆ ವಿಫಲತೆಗಳು
- ಬೈಸಿಪ್ ಫೈಲ್‌ಗಳಲ್ಲಿ ಸಿಂಟ್ಯಾಕ್ಸ್ ದೋಷಗಳು

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು

### ಸಮಸ್ಯೆ: ನಿರ್ಮಾಣ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಯ ಸಮಯದಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ನಿರ್ಮಾಣ ವಿಫಲವಾಗುತ್ತದೆ
- ಪ್ಯಾಕೇಜ್ ಸ್ಥಾಪನೆ ದೋಷಗಳು

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### ಸಮಸ್ಯೆ: ಕಂಟೇನರ್ ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ಗಳು ಪ್ರಾರಂಭವಾಗುವುದಿಲ್ಲ
- ಇಮೇಜ್ ಪುರಿ ದೋಷಗಳು

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### ಸಮಸ್ಯೆ: ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ಡೇಟಾಬೇಸ್‌ಗೆ ಸಂಪರ್ಕ ಆಗುವುದಿಲ್ಲ
- ಸಂಪರ್ಕ ಸಮಯ ಮುಗಿಯುವ ದೋಷಗಳು

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಪರಿಸರ ಚರಗಳು ಕೆಲಸ ಮಾಡುತ್ತಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನಾ ಮೌಲ್ಯಗಳನ್ನು ಓದಲು ಸಾಧ್ಯವಿಲ್ಲ
- ಪರಿಸರ ಚರಗಳು ಖಾಲಿಯಾಗಿವೆ ಎಂದು ತೋರುತ್ತದೆ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### ಸಮಸ್ಯೆ: SSL/TLS ಪ್ರಮಾಣಪತ್ರದ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- HTTPS ಕೆಲಸ ಮಾಡುವುದಿಲ್ಲ
- ಪ್ರಮಾಣಪತ್ರ ಪರಿಶೀಲನಾ ದೋಷಗಳು

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ಸಮಸ್ಯೆ: CORS ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಫ್ರಂಟ್ೆಂಡ್ API ಗೆ ಕರೆ ಮಾಡಲು ಸಾಧ್ಯವಿಲ್ಲ
- ಕ್ರಾಸ್-ಆರಿಗಿನ್ ವಿನಂತಿ ತಡೆಸಲಾಗಿದೆ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. ನಿಮ್ಮ ಇತ್ತೀಚಿನ ಎಕ್ಸ್‌ಪ್ರೆಸ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ( `cors` ಅನ್ನು ಆಮದುಮಾಡಿ) ನವೀಕರಿಸಿ:

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 ಪರಿಸರ ನಿರ್ವಹಣೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಪರಿಸರ ಬದಲಾಗಿಸುವ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ತಪ್ಪಾದ ಪರಿಸರ ಬಳಕೆ ಆಗುತ್ತಿದೆ
- ಸರಿಯಾಗಿ ಸಂರಚನೆ ಬದಲಾಗುತ್ತಿಲ್ಲ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### ಸಮಸ್ಯೆ: ಪರಿಸರ ಹಾನಿ
**ಲಕ್ಷಣಗಳು:**
- ಪರಿಸರ ಅಮಾನ್ಯ ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತದೆ
- ಸಂಪನ್ಮೂಲಗಳು ಸಂರಚನೆಗೆ ಹೊಂದಿಕೆ ಆಗುವುದಿಲ್ಲ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ನಿಧಾನ ನಿಯೋಜನೆ ಸಮಯ
**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಗಳಿಗೆ ಹೆಚ್ಚಾಗಿದೆ ಸಮಯ
- ನಿಯೋಜನೆ ಸಮಯ ಸೀಮಿತವಾಗಿದೆ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### ಸಮಸ್ಯೆ: ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ನಿಧಾನ ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ
- ಹೆಚ್ಚಿನ ಸಂಪನ್ಮೂಲ ಬಳಕೆ

**ಪರೀಹಾರಗಳು:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ ಸಮಸ್ಯೆ ಪರಿಹಾರ ಸಾಧನಗಳು ಮತ್ತು ಆಜ್ಞೆಗಳು

### ಡಿಬಗ್ ಆಜ್ಞೆಗಳು
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ಸಂಪನ್ಮೂಲ ಶೋಧನೆ
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ಕಾರ್ಯಕ್ರಮ ಹೆಚ್ಚುವರಿ ಸಹಾಯ ಪಡೆಯುವುದು

### ಯಾವಾಗ ಹೆಸರಿಸುವುದು
- ಎಲ್ಲಾ ಪರಿಹಾರಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿದ ನಂತರವೂ ಪ್ರಾಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳು ಮುಂದುವರಿದರೆ
- ಆಜೂರ್ ಸೇವೆಗಳ ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳಿದ್ದಾಗ
- ಬಿಲ್ಲಿಂಗ್ ಅಥವಾ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳಿಗೆ
- ಭದ್ರತಾ ಚಿಂತನೆಗಳು ಅಥವಾ ಘಟನೆಗಳು

### ಬೆಂಬಲ ಚಾನೆಲ್‌ಗಳು
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ಸಂಗ್ರಹಿಸಬೇಕಾದ ಮಾಹಿತಿಗಳು
ಬೆಂಬಲವನ್ನು ಸಂಪರ್ಕಿಸುವ ಮೊದಲು, ಸಂಗ್ರಹಿಸಿ:
- `azd version` ಔಟ್‌ಪುಟ್
- `azd config show` ಔಟ್‌ಪುಟ್
- `azd show` ಔಟ್‌ಪುಟ್ (ಪ್ರಸ್ತುತ ನಿಯೋಜನೆ ಸ್ಥಿತಿ)
- ದೋಷ ಸಂದೇಶಗಳು (ಪೂರ್ಣ ಪಠ್ಯ)
- ಸಮಸ್ಯೆಯನ್ನು ಪುನರಾವರ್ತಿಸಲು ಇರುವ ಹಂತಗಳು
- ರೆಡಾಕ್ಟ್ ಮಾಡಲಾದ ಪರಿಸರ ವಿವರಗಳು (ಮೂಲ `azd env get-values` ರಹಸ್ಯಗಳನ್ನು ಎಂದಿಗೂ ಹಂಚಿಕೊಳ್ಳಬೇಡಿ)
- ಸಮಸ್ಯೆ ಪ್ರಾರಂಭವಾದ ಸಮಯದ ಟೈಮ್‌ಲೈನ್

### ಲಾಗ್ ಸಂಗ್ರಹಣೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ಸಮಸ್ಯೆ ತಡೆಯುವುದು

### ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ ಪಟ್ಟಿ
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### ನಿಗಾವಳಿ ಸಂರಚನೆ
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### ನಿಯಮಿತ ನಿರ್ವಹಣೆ
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## ಸಂಬಂಧಿತ ಸಂಪನ್ಮೂಲಗಳು

- [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md) - ಉನ್ನತ ಮಟ್ಟದ ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳು
- [ಮೂಲಸೌಕರ್ಯ ನಿಯೋಜನೆ](../chapter-04-infrastructure/provisioning.md) - ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ
- [ ಕ್ಷಮತೆ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಯೋಜನೆ ಮಾರ್ಗದರ್ಶನ
- [SKU ಆಯ್ಕೆ](../chapter-06-pre-deployment/sku-selection.md) - ಸೇವಾ ಮಟ್ಟ ಶಿಫಾರಸುಗಳು

---

**ಸೂಚನೆ**: ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪುಸ್ತಕಚಿಹ್ನೆ ಮಾಡಿ ಸಮಸ್ಯೆ ಎದುರಾದಾಗ ಇದರ ಕಡೆಗೆ ತಿರುಗಿ. ಬಹುಮಂದಿಗೆ ಸಮಸ್ಯೆಗಳು ಆಗಲೇ ಕಂಡುಬಂದಿದ್ದು, ಸ್ಥಾಪಿತ ಪರಿಹಾರಗಳಿವೆ!

---

**ಸಂಚಲನ**
- **ಹಿಂದಿನ ಪಾಠ**: [ಮೂಲಸೌಕರ್ಯ ನಿಯೋಜನೆ](../chapter-04-infrastructure/provisioning.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->