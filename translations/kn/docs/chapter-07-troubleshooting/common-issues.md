# ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

**ಅಧ್ಯಾಯ ಸಂಚಿಕೆ:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮತ್ತು ಡಿಬಗಿಂಗ್
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 6: ಪೂರ್ವ-ಪರಿಶೀಲನೆಗಳು](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ಮುಂದಿನ**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ਅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)

## ಪರಿಚಯ

ಈ ವ್ಯಾಪಕ ತೊಂದರೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಬಳಸುವಾಗ ಎದುರಿಸುವ ಅತ್ಯಂತ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ಪ್ರಾಮಾಣೀಕರಣ, ನಿಯೋಜನೆ, ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವಿಷನಿಂಗ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕಾನ್ಫಿಗರೇಶನ್ ಸಂಬಂಧಿತ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಗುರುತಿಸುವುದು, ತ್ರುಟಿಯನ್ನು ವಿಶ್ಲೇಷಿಸುವುದು ಮತ್ತು ಪರಿಹರಿಸುವುದನ್ನು ಇಲ್ಲಿ ಕಲಿಯಿರಿ. ಪ್ರತಿ ಸಮಸ್ಯೆಗೆ ವಿವರವಾದ ಲಕ್ಷಣಗಳು, ಮೂಲ ಕಾರಣಗಳು ಮತ್ತು ಹಂತ-ದೊಡ್ಡುವ ಪರಿಹಾರ ಕ್ರಮಗಳನ್ನು ಹೊಂದಿವೆ.

## ಅಧ್ಯಯನ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- Azure Developer CLI ಸಮಸ್ಯೆಗಳಿಗೆ ನಿರ್ಣಯಾತ್ಮಕ ತಂತ್ರಗಳನ್ನು ಪರಿಣತವಾಗಿಸಿಕೊಳ್ಳುತ್ತೀರಿ
- ಸಾಮಾನ್ಯ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ಸಮಸ್ಯೆಗಳನ್ನು ಮತ್ತು ಅವುಗಳ ಪರಿಹಾರಗಳನ್ನು ಅರ್ಥಮಾಡುತ್ತೀರಿ
- ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು, ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವಿಷನಿಂಗ್ ದೋಷಗಳು ಮತ್ತು ಕಾನ್ಫಿಗರೇಶನ್ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಬಹುದು
- ಪ್ರಾಯೋಗಿಕ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು
- ಸಂಕೀರ್ಣ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಕ್ರಮಕೃತ ತ್ರುಟಿತಜ್ಞಾನದ ವಿಧಾನಗಳನ್ನು ಅನ್ವಯಿಸಬಹುದು
- ಭವಿಷ್ಯದ ಸಮಸ್ಯೆಗಳನ್ನು ತಡೆಯಲು ಸರಿಯಾದ ಲಾಗಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಬಹುದು

## ಅಧ್ಯಯನ ಫಲಿತಾಂಶಗಳು

ಸಂಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- ನಿಷ್ಪಾದಿತ ಹೆಚ್ಚುವರಿ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಉಪಕರಣಗಳನ್ನು ಬಳಸಿ Azure Developer CLI ಸಮಸ್ಯೆಗಳನ್ನು ನಿರ್ಧರಿಸುವುದು
- ಪ್ರಾಮಾಣೀಕರಣ, ಚಂದಾ ಮತ್ತು ಅನುಮತಿ ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಪರಿಹರಿಸುವುದು
- ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವಿಷನಿಂಗ್ ದೋಷಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ತೊಡಗಿಸಿಕೊಳ್ಳುವುದು
- ಅಪ್ಲಿಕೇಶನ್ ಕಾನ್ಫಿಗರೇಶನ್ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ತೊಂದರೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡುವುದು
- ಸಂಭವನೀಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪೂರ್ವಾನಾನುಮೇಯಿಸಲು ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಎಚ್ಚರಿಕೆ ವ್ಯವಸ್ಥೆಯನ್ನು ಅನ್ವಯಿಸುವುದು
- ಲಾಗಿಂಗ್, ಡಿಬಗಿಂಗ್ ಮತ್ತು ಸಮಸ್ಯೆ ಪರಿಹಾರ ಕಾರ್ಯಪ್ರವಾಹಗಳ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನುಸರಿಸುವುದು

## ತ್ವರಿತ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್

ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆಗಳಿಗೆ ದಾಡಲು ಮೊದಲು, ಈ ಕಮಾಂಡ್‌ಗಳನ್ನು ಚಾಲನೆ ಮಾಡಿ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ವಿವರಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ:

```bash
# azd ಆವೃತ್ತಿ ಮತ್ತು ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version
azd config list

# Azure ಪ್ರಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
az account list

# ಪ್ರಸ್ತುತ ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env show
azd env get-values

# ಡೆಬಗ್ ಲಾಗಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug
```

## ಪ್ರಮಾಣೀಕರಣ ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: "ಪ್ರವೇಶ ಟೋಕನ್ ಪಡೆಯಲು ವಿಫಲವಾಗಿದೆ"
**ಲಕ್ಷಣಗಳು:**
- `azd up` ಪ್ರಾಮಾಣೀಕರಣದ ದೋಷಗಳೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಕಮಾಂಡ್‌ಗಳು "ಅಧಿಕೃತವಿಲ್ಲ" ಅಥವಾ "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ಅನ್ನು ತರುತ್ತವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. Azure CLI ಮೂಲಕ ಪುನಃ ಪ್ರಾಮಾಣೀಕರಿಸಿ
az login
az account show

# 2. ಕ್ಯಾಶೆ ಮಾಡಲಾದ ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
az account clear
az login

# 3. ಡಿವೈಸ್ ಕೋಡ್ ಫ್ಲೋ ಬಳಸಿ (ಹೆಡ್ಲೆಸ್ ವ್ಯವಸ್ಥೆಗಳಿಗಾಗಿ)
az login --use-device-code

# 4. ನಿಖರ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ಸಮಸ್ಯೆ: ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವೇಳೆ "ಅಪರ್ಯಾಪ್ತ ಅನುಮತಿಗಳು"
**ಲಕ್ಷಣಗಳು:**
- ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಅನುಮತಿ ದೋಷಗಳೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಕೆಲವು Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ನಿಮ್ಮ Azure ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ನಿಮಗೆ ಅಗತ್ಯವಿರುವ ಪಾತ್ರಗಳು ಇರುವುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
# - Contributor (ಸಂಪನ್ಮೂಲ ಸೃಷ್ಟಿಗಾಗಿ)
# - User Access Administrator (ಪಾತ್ರ ನಿಯೋಜನೆಗಳಿಗೆ)

# 3. ಸೂಕ್ತ ಅನುಮತಿಗಳಿಗಾಗಿ ನಿಮ್ಮ Azure ನಿರ್ವಹಕರನ್ನು ಸಂಪರ್ಕಿಸಿ
```

### ಸಮಸ್ಯೆ: ಮಲ್ಟಿ-ಟೆನಂಟ್ ಪ್ರಾಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳು
**ಪರಿಹಾರಗಳು:**
```bash
# 1. ನಿರ್ದಿಷ್ಟ ಟೆನಂಟ್‌ನಲ್ಲಿ ಲಾಗಿನ್ ಮಾಡಿ
az login --tenant "your-tenant-id"

# 2. ಕಾನ್ಫಿಗರೇಶನ್‌ನಲ್ಲಿ ಟೆನಂಟ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set auth.tenantId "your-tenant-id"

# 3. ಟೆನಂಟ್‌ಗಳನ್ನು ಬದಲಾಯಿಸುವಾಗ ಟೆನಂಟ್ ಕ್ಯಾಶೆಯನ್ನು ತೆರವುಗೊಳಿಸಿ
az account clear
```

## 🏗️ ಮೂಲಸೌಕರ್ಯ ಪ್ರಾವಿಷನಿಂಗ್ ದೋಷಗಳು

### ಸಮಸ್ಯೆ: ಸಂಪನ್ಮೂಲ ಹೆಸರಿನ ಸಂಘರ್ಷ
**ಲಕ್ಷಣಗಳು:**
- "ಸಂಪನ್ಮೂಲ ಹೆಸರನ್ನು ಈಗಾಗಲೇ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ" ದೋಷಗಳು
- ಸಂಪನ್ಮೂಲ ರಚನೆ ವೇಳೆ ನಿಯೋಜನೆ ವಿಫಲವಾಗುತ್ತದೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಟೋಕನ್ಗಳೊಂದಿಗೆ ಅನನ್ಯ ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳನ್ನು ಬಳಸಿ
# ನಿಮ್ಮ Bicep ಟೆಂಪ್ಲೇಟ್‌ನಲ್ಲಿ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ಪರಿಸರದ ಹೆಸರನ್ನು ಬದಲಿಸಿ
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ಇರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
azd down --force --purge
```

### ಸಮಸ್ಯೆ: ಸ್ಥಳ/ಪ್ರಾಂತ್ಯ ಲಭ್ಯವಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- "The location 'xyz' is not available for resource type"
- ಆಯ್ಕೆಮಾಡಿದ ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಕೆಲವು SKU ಗಳು ಲಭ್ಯವಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಗಳಿಗೆ ಲಭ್ಯವಿರುವ ಸ್ಥಳಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ಸಾಮಾನ್ಯವಾಗಿ ಲಭ್ಯವಿರುವ ವಲಯಗಳನ್ನು ಬಳಸಿ
azd config set defaults.location eastus2
# ಅಥವಾ
azd env set AZURE_LOCATION eastus2

# 3. ವಲಯದ ಆಧಾರದ ಮೇಲೆ ಸೇವೆಗಳ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
# ಭೇಟಿ ನೀಡಿ: https://azure.microsoft.com/global-infrastructure/services/
```

### ಸಮಸ್ಯೆ: ಕ್ವೋಟಾ ಮೀರಿ ದೋಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az vm list-usage --location eastus2 -o table

# 2. Azure ಪೋರ್ಟಲ್ ಮೂಲಕ ಕ್ವೋಟಾ ಹೆಚ್ಚಳಕ್ಕಾಗಿ ವಿನಂತಿ ಮಾಡಿ
# ಗೆ ಹೋಗಿ: ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್‌ಗಳು > ಬಳಕೆ + ಕ್ವೋಟಾ

# 3. ಅಭಿವೃದ್ಧಿಗಾಗಿ ಸಣ್ಣ SKUಗಳನ್ನು ಬಳಸಿ
# main.parameters.json ನಲ್ಲಿ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ಅನುಪಯುಕ್ತ ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
az resource list --query "[?contains(name, 'unused')]" -o table
```

###בעיה: Bicep ಟೆಂಪ್ಲೇಟ್ ದೋಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಟೆಂಪ್ಲೇಟ್ ಮಾನ್ಯತೆ ವಿಫಲತೆಗಳು
- Bicep ಫೈಲ್ಗಳಲ್ಲಿ نحو ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. Bicep ವಾಕ್ಯರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
az bicep build --file infra/main.bicep

# 2. Bicep ಲಿಂಟರ್ ಅನ್ನು ಬಳಸಿ
az bicep lint --file infra/main.bicep

# 3. ಪ್ಯಾರಾಮೀಟರ್ ಫೈಲ್‌ನ ವಾಕ್ಯರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
cat infra/main.parameters.json | jq '.'

# 4. ನಿಯೋಜನೆಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವವೀಕ್ಷಿಸಿ
azd provision --preview
```

## 🚀 ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು

### ಸಮಸ್ಯೆ: build ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆ ವೇಳೆ ಅಪ್ಲಿಕೇಶನ್ ಬಿಲ್ಡ್ ಆಗುವುದಿಲ್ಲ
- ಪ್ಯಾಕೇಜ್ ಇನ್‌ಸ್ಟಾಲೇಶನ್ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಡೀಬಗ್ ಫ್ಲ್ಯಾಗ್‌ನೊಂದಿಗೆ ಬಿಲ್ಡ್ ಔಟ್‌ಪುಟ್ ಪರಿಶೀಲಿಸಿ
azd deploy --service web --debug

# 2. ನಿಯೋಜಿತ ಸೇವೆಯ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# 3. ಬಿಲ್ಡ್ ಅನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
cd src/web
npm install
npm run build

# 3. Node.js/Python ಆವೃತ್ತಿ ಹೊಂದಾಣಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
node --version  # azure.yaml ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಹೊಂದಿರಬೇಕು
python --version

# 4. ಬಿಲ್ಡ್ ಕ್ಯಾಶೆ ತೆರವುಗೊಳಿಸಿ
rm -rf node_modules package-lock.json
npm install

# 5. ಕಂಟೇನರ್‌ಗಳನ್ನು ಬಳಸುತ್ತಿದ್ದರೆ Dockerfile ಅನ್ನು ಪರಿಶೀಲಿಸಿ
docker build -t test-image .
docker run --rm test-image
```

### ಸಮಸ್ಯೆ: ಕನ್ಟೇನರ್ ನಿಯೋಜನೆ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಕನ್ಟೇನರ್ ಆಪ್‌ಗಳು ಪ್ರಾರಂಭವಾಗುವುದಿಲ್ಲ
- ಇಮೇಜ್ ಪುಲಿಂಗ್ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. Docker ನಿರ್ಮಾಣವನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI ಬಳಸಿ ಕಂಟೈನರ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --logs

# 3. ಕಂಟೈನರ್ ರೆಜಿಸ್ಟ್ರಿ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az acr login --name myregistry

# 4. ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp show --name my-app --resource-group my-rg
```

### ಸಮಸ್ಯೆ: ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ಡೇಟಾಬೇಸ್ಗೆ ಸಂಪರ್ಕಿಸುವಲ್ಲಿ ವಿಫಲವಾಗುತ್ತದೆ
- ಸಂಪರ್ಕ ಟೈಮ್‌ಔಟ್ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಡೇಟಾಬೇಸ್ ಫೈರ್ವಾಲ್ ನಿಯಮಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಸಂಪರ್ಕವನ್ನು ಪರೀಕ್ಷಿಸಿ
# ತಾತ್ಕಾಲಿಕವಾಗಿ ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಸೇರಿಸಿ:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ಕನೆಕ್ಷನ್ ಸ್ಟ್ರಿಂಗ್‌ನ ಸ್ವರೂಪವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep DATABASE

# 4. ಡೇಟಾಬೇಸ್ ಸರ್ವರ್‌ನ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ಕಾನ್ಫಿಗರೇಶನ್ ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಪರಿಸರ ವ್ಯತ್ಯಾಸಿಗಳು ಕೆಲಸ ಮಾಡುತ್ತಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ಕಾನ್ಫಿಗರೇಶನ್ ಮೌಲ್ಯಗಳನ್ನು ಓದಲು ಸಾಧ್ಯವಿಲ್ಲ
- ಪರಿಸರ ವ್ಯತ್ಯಾಸಿಗಳು ಖಾಲಿಯೇ ತೋರಿಸುತ್ತವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪರಿಸರ ಚರಗಳು ಸೆಟ್ ಆಗಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ಫೈಲಿನಲ್ಲಿ ಇರುವ ಚರಗಳ ಹೆಸರುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
cat azure.yaml | grep -A 5 env:

# 3. ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರುಪ್ರಾರಂಭಿಸಿ
azd deploy --service web

# 4. ಆಪ್ ಸರ್ವಿಸ್ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ಸಮಸ್ಯೆ: SSL/TLS ಪ್ರಮಾಣಪತ್ರ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- HTTPS ಕಾರ್ಯನಿರ್ವಹಿಸುವುದಿಲ್ಲ
- ಪ್ರಮಾಣಪತ್ರ ಮಾನ್ಯತೆ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. SSL ಪ್ರಮಾಣಪತ್ರದ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp config ssl list --resource-group myrg

# 2. ಕೇವಲ HTTPS ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. ಕಸ್ಟಮ್ ಡೊಮೇನ್ ಸೇರಿಸಿ (ಆವಶ್ಯಕವಾದರೆ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ಸಮಸ್ಯೆ: CORS ಕಾನ್ಫಿಗರೇಶನ್ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಫ್ರಂಟೆಂಡ್ API ಕರೆಗೆ ಸಂಪರ್ಕಿಸಲು ಸಾಧ್ಯವಾಗುವುದಿಲ್ಲ
- ಕ್ರಾಸ್-ಓರಿಜಿನ್ ವಿನಂತಿ ನಿರೋಧಿಸಲಾಯಿತು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. App Service ಗಾಗಿ CORS ಅನ್ನು ಸಂರಚಿಸಿ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS ಅನ್ನು ನಿರ್ವಹಿಸಲು API ಅನ್ನು ನವೀಕರಿಸಿ
# Express.js ನಲ್ಲಿ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ಸರಿಯಾದ URL ಗಳಲ್ಲಿ ಓಡುತ್ತಿರುವುದೇ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd show
```

## 🌍 ಪರಿಸರ ನಿರ್ವಹಣಾ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಪರಿಸರ ಮರುಬದಲಾವಣೆಯ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ತಪ್ಪಾದ ಪರಿಸರ ಬಳಸಲಾಗುತ್ತಿದೆ
- ಕಾನ್ಫಿಗರೇಶನ್ ಸರಿಯಾಗಿ ಬದಲಾಯಿಸಲಾಗುತ್ತಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಎಲ್ಲಾ ಪರಿಸರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env list

# 2. ಸ್ಪಷ್ಟವಾಗಿ ಪರಿಸರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ
azd env select production

# 3. ಪ್ರಸ್ತುತ ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env show

# 4. ದೋಷಗೊಂಡಿದ್ದರೆ ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production-new
azd env select production-new
```

### समस्या: ಪರಿಸರ ದೋಷಭದ್ರತೆ
**ಲಕ್ಷಣಗಳು:**
- ಪರಿಸರ ಅಮಾನ್ಯ ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತದೆ
- ಸಂಪನ್ಮೂಲಗಳು ಕಾನ್ಫಿಗರೇಶನ್ ನಿಮಿತ್ತ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪರಿಸರದ ಸ್ಥಿತಿಯನ್ನು ನವೀಕರಿಸಿ
azd env refresh

# 2. ಪರಿಸರದ ಸಂರಚನೆಯನ್ನು ಮರುಹೊಂದಿಸಿ
azd env new production-reset
# ಆವಶ್ಯಕ ಪರಿಸರ ಚರಗಳನ್ನು ನಕಲಿಸಿ
azd env set DATABASE_URL "your-value"

# 3. ಇರುವ ಸಂಪನ್ಮೂಲ들을 ಆಮದುಮಾಡಿ (ಸಾಧ್ಯವಾದರೆ)
# ಸಂಪನ್ಮೂಲ ID ಗಳೊಂದಿಗೆ .azure/production/config.json ಅನ್ನು ಕೈಯಿಂದ ನವೀಕರಿಸಿ
```

## 🔍 ಕಾರ್ಯಕ್ಷಮತಾ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ನಿಧಾನ ನಿಯೋಜನೆ ಸಮಯಗಳು
**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಗಳು ಹೆಚ್ಚಿನ ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುತ್ತವೆ
- ನಿಯೋಜನೆ ವೇಳೆ ಟೈಮ್‌ಔಟ್‌ಗಳು ಸಂಭವಿಸುತ್ತವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ವೇಗದ ಪುನರಾವೃತ್ತಿಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# 2. ಮೂಲಸೌಕರ್ಯ ಬದಲಾಗದಿದ್ದರೆ ಕೇವಲ ಕೋಡ್‌ನ ನಿಯೋಜನೆಯನ್ನು ಬಳಸಿ
azd deploy  # azd up ಗಿಂತ ವೇಗವಾಗಿದೆ

# 3. ನಿರ್ಮಾಣ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಸುಧಾರಿಸಿ
# package.json ನಲ್ಲಿ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. ಸಂಪನ್ಮೂಲಗಳ ಸ್ಥಳಗಳನ್ನು ಪರಿಶೀಲಿಸಿ (ಒಂದೇ ಪ್ರದೇಶವನ್ನು ಬಳಸಿ)
azd config set defaults.location eastus2
```

### ಸಮಸ್ಯೆ: ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತಾ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ ನಿಧಾನವಾಗಿದೆ
- ಹೆಚ್ಚಿನ ಸಂಪನ್ಮೂಲ ಬಳಕೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಸಂಪನ್ಮೂಲಗಳನ್ನು ಹೆಚ್ಚಿಸಿ
# main.parameters.json ಫೈಲಿನಲ್ಲಿ SKU ಅನ್ನು ನವೀಕರಿಸಿ:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd monitor --overview

# 3. Azure ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‍ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp log tail --name myapp --resource-group myrg
# ಅಥವಾ Container Appsಕ್ಕಾಗಿ:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ಕ್ಯಾಶಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
# Redis ಕ್ಯಾಶೆಯನ್ನು ನಿಮ್ಮ ಮೂಲಸೌಕರ್ಯಕ್ಕೆ ಸೇರಿಸಿ
```

## 🛠️ ತೊಂದರೆ ಪರಿಹಾರ ಸಲಕರಣೆಗಳು ಮತ್ತು ಕಮಾಂಡ್‌ಗಳು

### ಡಿಬಗ್ ಕಮಾಂಡ್‌ಗಳು
```bash
# ವಿಸ್ತೃತ ದೋಷನಿರ್ಣಯ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# ಪ್ರಸ್ತುತ ಸಂರಚನையை ವೀಕ್ಷಿಸಿ
azd config list

# ಸಂಪರ್ಕತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
curl -v https://myapp.azurewebsites.net/health
```

### ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ
```bash
# Azure CLI ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳು
az webapp log tail --name myapp --resource-group myrg

# azd ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿರೀಕ್ಷಿಸಿ
azd monitor --logs
azd monitor --live

# Azure ಸಂಪನ್ಮೂಲ ಲಾಗ್‌ಗಳು
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# ಕಂಟೈನರ್ ಲಾಗ್‌ಗಳು (Container Apps ಗಾಗಿ)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ಸಂಪನ್ಮೂಲ ತನಿಖೆ
```bash
# ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az resource list --resource-group myrg -o table

# ಸಂಪನ್ಮೂಲದ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp show --name myapp --resource-group myrg --query state

# ನೆಟ್‌ವರ್ಕ್ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ಹೆಚ್ಚುವರಿ ಸಹಾಯ ಪಡೆಯುವುದು

### ಯಾವಾಗ ಎಸ್ಕಲೇಟ್ ಮಾಡಬೇಕೆಂದು
- ಎಲ್ಲಾ ಪರಿಹಾರಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿದರೂ ಪ್ರಾಮಾಣೀಕರಣ ಸಮಸ್ಯೆಗಳು ನಿರಂತರವಾಗಿದೆ
- Azure ಸೇವೆಗಳ ಮೂಲಸೌಕರ್ಯ ಸಮಸ್ಯೆಗಳು
- ಬಿಲ್ಲಿಂಗ್ ಅಥವಾ ಚಂದಾ ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳು
- ಭದ್ರತಾ ಆದಿಚ್ಛೆಗಳು ಅಥವಾ ಘಟನೆಗಳು

### ಬೆಂಬಲ ಚಾನೆಲ್‌ಗಳು
```bash
# 1. Azure ಸೇವಾ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure ಬೆಂಬಲ ಟಿಕೆಟ್ ರಚಿಸಿ
# ಹೋಗಿ: https://portal.azure.com -> ಸಹಾಯ ಮತ್ತು ಬೆಂಬಲ

# 3. ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
# - Stack Overflow: azure-developer-cli ಟ್ಯಾಗ್
# - GitHub ಇಶ್ಯೂಗಳು: https://github.com/Azure/azure-dev/issues
# - Microsoft ಪ್ರಶ್ನೆ ಮತ್ತು ಉತ್ತರ: https://learn.microsoft.com/en-us/answers/
```

### ಸಂಗ್ರಹಿಸಬೇಕಾದ ಮಾಹಿತಿ
ಬೆಂಬಲವನ್ನು ಸಂಪರ್ಕಿಸುವ ಮೊದಲು, ಈ ವಿವರಗಳನ್ನು ಸಂಗ್ರಹಿಸಿ:
- `azd version` ಔಟ್‌ಪುಟ್
- `azd config list` ಔಟ್‌ಪುಟ್
- `azd show` ಔಟ್‌ಪುಟ್ (ಪ್ರಸ್ತುತ ನಿಯೋಜನಾ ಸ್ಥಿತಿ)
- ದೋಷ ಸಂದೇಶಗಳು (მೂಲ ಪಠ್ಯ)
- ಸಮಸ್ಯೆಯನ್ನು ಪುನರಾವರ್ತಿಸಲು ತೆಗೆದುಕೊಂಡ ಕ್ರಮಗಳು
- ಪರಿಸರ ವಿವರಗಳು (`azd env show`)
- ಸಮಸ್ಯೆ ಆರಂಭವಾದ ಸಮಯರೇಖೆ

### ಲಾಗ್ ಸಂಗ್ರಹಣಾ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ಸಮಸ್ಯೆ ತಡೆಗಟ್ಟುವುದು

### ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನಾ ಪಟ್ಟಿ
```bash
# 1. ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show

# 2. ಕೋಟಾಗಳು ಮತ್ತು ಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az vm list-usage --location eastus2

# 3. ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az bicep build --file infra/main.bicep

# 4. ಮೊದಲು ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
npm run build
npm run test

# 5. ಡ್ರೈ-ರನ್ ನಿಯೋಜನೆಗಳನ್ನು ಬಳಸಿ
azd provision --preview
```

### ಮಾನಿಟರಿಂಗ್ ಸೆಟ್‌ಅಪ್
```bash
# Application Insights ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
# main.bicep ಗೆ ಸೇರಿಸಿ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸಜ್ಜುಗೊಳಿಸಿ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ನಿಯಮಿತ ನಿರ್ವಹಣೆ
```bash
# ಸಾಪ್ತಾಹಿಕ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು
./scripts/health-check.sh

# ಮಾಸಿಕ ವೆಚ್ಚ ವಿಮರ್ಶೆ
az consumption usage list --billing-period-name 202401

# ತ್ರೈಮಾಸಿಕ ಭದ್ರತಾ ವಿಮರ್ಶೆ
az security assessment list --resource-group myrg
```

## ಸಂಬಂಧಿಸಿದ ಸಂಪನ್ಮೂಲಗಳು

- [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md) - ಉನ್ನತ ಮಟ್ಟದ ಡಿಬಗ್ಗಿಂಗ್ ತಂತ್ರಗಳು
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ಮೂಲಸೌಕರ್ಯ ತೊಂದರೆ ಪರಿಹಾರ
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಯೋಜನೆಗಾಗಿ ಮಾರ್ಗದರ್ಶನ
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - ಸೇವಾ ಶ್ರೇಣಿ ಶಿಫಾರಸುಗಳು

---

**ಸಲಹೆ**: ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಬುಕ್‌మಾರ್ಕ್ ಮಾಡಿ ಮತ್ತು ಸಮಸ್ಯೆಗಳು ಎದುರಾದಾಗ ಇದನ್ನು ಪರಾಮರ್ಶಿಸಿ. ಹೆಚ್ಚಿನ ಸಮಸ್ಯೆಗಳು ಮುಂಚಿತವಾಗಿಯೇ ಎದುರಾಗಿರುತ್ತವೆ ಮತ್ತು ಸ್ಥಿರ ಪರಿಹಾರಗಳು ಇರುವುವು!

---

**ನೇವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಡಿಬಗಿಂಗ್ ಮಾರ್ಗದರ್ಶಿ](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:
ಈ ದಸ್ತಾವೇಜು ಅನ್ನು AI ಭಾಷಾಂತರ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಭಾಷಾಂತರಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಭಾಷಾಂತರಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮರ್ಪಕತೆಗಳಿರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿರಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಭಾಷಾಂತರದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->