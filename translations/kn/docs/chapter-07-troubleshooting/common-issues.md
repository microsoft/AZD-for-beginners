# ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜ್ಡ್ ಫಾರ್ ಬಿಗಿನ್ನರ್ಸ್](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 7 - ತೊಂದರೆ ಪರಿಹರಿಸುವುದು ಮತ್ತು ಡಿಬಗ್ ಮಾಡುವುದು
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 6: ಪೂರ್ವ-ಗಮನಿಕೆ ಪರಿಶೀಲನೆಗಳು](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ಮುಂದಿನದು**: [ಡಿಬಗ್ ಗೈಡ್](debugging.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 8: ಉತ್ಪಾದನೆ ಮತ್ತು ಎಂಟರ್ಪ್ರೈಸ್ ಮಾದರಿಗಳು](../chapter-08-production/production-ai-practices.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ತೊಂದರೆ ಪರಿಹಾರ ಮಾರ್ಗದರ್ಶಿ ಆಜರ್ ಡೆವಲಪರ್ CLI ಬಳಸುವಾಗ ಹೆಚ್ಚು ಸಾಮಾನ್ಯವಾಗಿ ಎದುರಾಗುವ ಸಮಸ್ಯೆಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ಸರಿಯಾದ ದೃಷ್ಟಿಕೋಣದಿಂದ ಮಾನ್ಯತೆ, ತैनಾತಿ, ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೊವಿಷನಿಂಗ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನೆಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪತ್ತೆಹಚ್ಚುವುದು, ತಿದ್ದುವುದು ಮತ್ತು ಪರಿಹರಿಸುವುದು ಹೇಗೆ ಎಂಬುದನ್ನು ಕಲಿಯಿರಿ. ಪ್ರತಿ ಸಮಸ್ಯೆಯು ವಿವರವಾದ ಲಕ್ಷಣಗಳು, ಮೂಲ ಕಾರಣಗಳು ಮತ್ತು ಹಂತದ ಪ್ರಕ್ರಿಯೆಗಳೊಂದಿಗೆ ಸೇರಿಕೊಂಡಿದೆ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಆಜರ್ ಡೆವಲಪರ್ CLI ಸಮಸ್ಯೆಗಳ ಡಯಾಗ್ನಾಸ್ಟಿಕ್ ತಂತ್ರಗಳನ್ನು ನಿಪುಣ ಮಾಡುತ್ತಿರಿ
- ಸಾಮಾನ್ಯ ಮಾನ್ಯತೆ ಮತ್ತು ಅನುಮತಿ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತಿರಿ
- ತೈನಾತಿ ವೈಫಲ್ಯಗಳು, ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೊವಿಷನಿಂಗ್ ದೋಷಗಳು ಮತ್ತು ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸುತ್ತಿರಿ
- ಪ್ರೋಆಕ್ಟಿವ್ಅ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಡೀಬಗಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತಿರಿ
- ಜಟಿಲ ಸಮಸ್ಯೆಗಳಿಗೆ ವ್ಯವಸ್ಥಿತ ತೊಂದರೆ ಪರಿಹಾರ ವಿಧಾನಗಳನ್ನು ಅನ್ವಯಿಸುತ್ತಿರಿ
- ಭವಿಷ್ಯದಲ್ಲಿ ಸಮಸ್ಯೆಗಳನ್ನು ತಡೆಯಲು ಸರಿಯಾದ ಲಾಗಿಂಗ್ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿಸುತ್ತಿರಿ

## ಕಲಿಕೆ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ಮೇಲೆ, ನೀವು ಸಾಮರ್ಥ್ಯ ಪಡೆಯುತ್ತಿರಿ:
- ಒಳಗೊಂಡಿರುವ ಡಯಾಗ್ನಾಸ್ಟಿಕ್ ಉಪಕರಣಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಆಜರ್ ಡೆವಲಪರ್ CLI ಸಮಸ್ಯೆಗಳನ್ನು ಡಯಾಗ್ನೋಸ್ ಮಾಡಲು
- ಸ್ವತಂತ್ರವಾಗಿ ಮಾನ್ಯತೆ, ಚಂದಾದಾರಿಕೆ ಮತ್ತು ಅನುಮತಿ ಸಂಬಂಧಿಸಿದ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಲು
- ತೈನಾತಿ ವೈಫಲ್ಯಗಳು ಮತ್ತು ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೊವಿಷನಿಂಗ್ ದೋಷಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ತೊಂದರೆ ಪರಿಹರಿಸಲು
- ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಸರ-ವಿಶಿಷ್ಟ ಸಮಸ್ಯೆಗಳನ್ನು ಡೀಬಗ್ ಮಾಡಲು
- ಸಾಧ್ಯವಾಗುವ ಸಮಸ್ಯೆಗಳನ್ನು ಪ್ರೋಆಕ್ಟಿವಾಗಿ ಗುರುತಿಸಲು ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಎಚ್ಚರಿಕಾ ವ್ಯವಸ್ಥೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಲು
- ಲಾಗಿಂಗ್, ಡೀಬಗಿಂಗ್ ಮತ್ತು ಸಮಸ್ಯೆ ಪರಿಹಾರ ಕಾರ್ಯವಿಧಾನಗಳಿಗೆ ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನ್ವಯಿಸಲು

## ವೇಗದ ಡಯಾಗ್ನಾಸ್ಟಿಕ್ಸ್

ನಿರ್ದಿಷ್ಟ ಸಮಸ್ಯೆಗಳನ್ನು ನೋಡದ ಮುಂಚೆ, ಡಯಾಗ್ನಾಸ್ಟಿಕ್ ಮಾಹಿತಿಯನ್ನು ಸಂಗ್ರಹಿಸಲು ಈ ಕಮಾಂಡ್‌ಗಳನ್ನು ರನ್ ಮಾಡಿ:

```bash
# azd ಆವೃತ್ತಿ ಮತ್ತು ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
azd version
azd config show

# ಅజ್ಯೂರ್ ಪ್ರಾಮಾಣಿಕರಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
az account list

# ಸಧ್ಯದ ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env list
azd env get-values

# ಡೀಬಗ್ ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug
```

## ಮಾನ್ಯತೆ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: "ಪ್ರವೇಶ ಟೋಕನ್ ಪಡೆಯಲು ವಿಫಲವಾಗಿದೆ"
**ಲಕ್ಷಣಗಳು:**
- `azd up` ಮಾನ್ಯತೆ ದೋಷಗಳೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಕಮಾಂಡ್‌ಗಳು "ಅನುಮತಿಸಿರಲಿಲ್ಲ" ಅಥವಾ "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. Azure CLI ಮೂಲಕ ಮರು ಪ್ರಮಾಣೀಕರಿಸಿ
az login
az account show

# 2. ಕ್ಯಾಷ್ ಮಾಡಲಾದ ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
az account clear
az login

# 3. ಡಿವೈಸ್ ಕೋಡ್ ਫ್ಲೋ ಅನ್ನು ಬಳಸಿ (ಹೆಡ್‌ಲೆಸ್ ವ್ಯವಸ್ಥೆಗಳಿಗಾಗಿ)
az login --use-device-code

# 4. ಸ್ಪಷ್ಟ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ಸಮಸ್ಯೆ: ತೈನಾತಿ ಸಮಯದ "ಅಲ್ಪ ಪ್ರಮಾಣದ ಅನುವಾದಗಳು"
**ಲಕ್ಷಣಗಳು:**
- ಅನುಮತಿ ದೋಷಗಳೊಂದಿಗೆ ತೈನಾತಿ ವಿಫಲವಾಗುತ್ತದೆ
- ಕೆಲವು ಆಜರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸೃಷ್ಟಿಸಲಾಗುವುದಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ನಿಮ್ಮ ಅಜ್ಯೂರ್ ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ನೀವು ಅಗತ್ಯವಿರುವ ಪಾತ್ರಗಳನ್ನು ಹೊಂದಿದ್ದೀರಾ ಎಂಬುದನ್ನು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
# - ಕೊಡುಗನು (ಸಂಪನ್ಮೂಲ ಸೃಷ್ಟಿಗಾಗಿ)
# - ಬಳಕೆದಾರ ಪ್ರವೇಶ ನಿರ್ವಹಣಾಧಿಕಾರಿಯ (ಪಾತ್ರ ನಿಯೋಜನೆಗಳಿಗೆ)

# 3. ಸರಿಯಾದ ಅನುಮತಿಗಳಿಗಾಗಿ ನಿಮ್ಮ ಅಜ್ಯೂರ್ ನಿರ್ವಹಣಾಧಿಕಾರಿಯನ್ನು ಸಂಪರ್ಕಿಸಿ
```

### ಸಮಸ್ಯೆ: ಮಲ್ಟಿ-ಟೆನಂಟ್ ಮಾನ್ಯತೆ ಸಮಸ್ಯೆಗಳು
**ಪರಿಹಾರಗಳು:**
```bash
# 1. ನಿರ್ದಿಷ್ಟ ಟನಂಟ್‌ನೊಂದಿಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login --tenant "your-tenant-id"

# 2. ಕಾನ್ಫಿಗರೇಶನಿನಲ್ಲಿ ಟنಂಟ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set auth.tenantId "your-tenant-id"

# 3. ಟನಂಟ್‌ಗಳನ್ನು ಬದಲಾಯಿಸಲಾಗಿದ್ರೆ ಟನಂಟ್ ಕ್ಯಾಶೆ ಅನ್ನು ಕ್ಲೀನ್ ಮಾಡಿ
az account clear
```

## 🏗️ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೊವಿಷನಿಂಗ್ ದೋಷಗಳು

### ಸಮಸ್ಯೆ: ಸಂಪನ್ಮೂಲ ಹೆಸರು ಸ್ಥಗಿತಗಳು
**ಲಕ್ಷಣಗಳು:**
- "ಸಂಪನ್ಮೂಲ ಹೆಸರು ಈಗಾಗಲೇ ಇದೆ" ದೋಷಗಳು
- ಸಂಪನ್ಮೂಲ ಸೃಷ್ಟಿ ವೇಳೆ ತೈನಾತಿ ವಿಫಲವಾಗುತ್ತದೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಟೋಕನ್‌ಗಳೊಂದಿಗೆ ವೈಶಿಷ್ಟ್ಯಪೂರ್ಣ ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳನ್ನು ಬಳಸಿ
# ನಿಮ್ಮ ಬೈಸಪ್ ಟೆಂಪ್ಲೇಟಿನಲ್ಲಿ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ಪರಿಸರ ಹೆಸರನ್ನು ಬದಲಾಯಿಸಿ
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ಇರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೆ ಮಾಡಿ
azd down --force --purge
```

### ಸಮಸ್ಯೆ: ಸ್ಥಳ/ಪ್ರದೇಶ ಲಭ್ಯವಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- "‘xyz’ ಸ್ಥಳ ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಕ್ಕಿಗಾಗಿ ಲಭ್ಯವಿಲ್ಲ"
- ಆಯ್ದ ಪ್ರದೇಶದಲ್ಲಿ ಕೆಲವು SKU ಗಳು ಲಭ್ಯವಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಗಳಿಗೆ ಲಭ್ಯವಿರುವ ಸ್ಥಳಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ಸಾಮಾನ್ಯವಾಗಿ ಲಭ್ಯವಿರುವ ಪ್ರದೇಶಗಳನ್ನು ಬಳಸಿ
azd config set defaults.location eastus2
# ಅಥವಾ
azd env set AZURE_LOCATION eastus2

# 3. ಪ್ರದೇಶದ ಪ್ರಕಾರ ಸೇವೆ ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ
# ಭೇಟಿ ನೀಡಿ: https://azure.microsoft.com/global-infrastructure/services/
```

### ಸಮಸ್ಯೆ: ಕೊಟ್ಟಾ ಮೀರಿದ ದೋಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- "ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಕ್ಕೆ ಕೊಟ್ಟಾ ಮೀರಿದೆ"
- "ಗರಿಷ್ಠ ಸಂಪನ್ಮೂಲ ಸಂಖ್ಯೆ ತಲುಪಿದೆ"

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az vm list-usage --location eastus2 -o table

# 2. ಆಜರ್ ಪೋರ್ಟ್‌ಲ್ನ ಮೂಲಕ ಕ್ವೋಟಾ ವೃದ್ಧಿಯನ್ನು ವಿನಂತಿಸಿ
# ಗೋ: ಸದಸ್ಯತ್ವಗಳು > ಬಳಕೆ + ಕ್ವೋಟಾಗಳು

# 3. ಅಭಿವೃದ್ಧಿಗಾಗಿ ಚಿಕ್ಕ SKUs ಅನ್ನು ಬಳಸಿ
# main.parameters.json ನಲ್ಲಿ:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ಉಪಯೋಗಿಸದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ಸಮಸ್ಯೆ: ಬೈಸ್ಪ್ ಟೆಂಪ್ಲೇಟು ದೋಷಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಟೆಂಪ್ಲೇಟು ಮಾನ್ಯತೆ ವಿಫಲತೆಗಳು
- ಬೈಸ್ಪ್ ಫೈಲುಗಳಲ್ಲಿನ ಸಂಗ್ರಹ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಬಿಸೆಪ್ ವಾಕ್ಯರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
az bicep build --file infra/main.bicep

# 2. ಬಿಸೆಪ್ ಲಿಂಟರ್ ಬಳಸಿ
az bicep lint --file infra/main.bicep

# 3. ಪ್ಯಾರಾಮಿಟರ್ ಫೈಲ್ ವಾಕ್ಯರಚನೆ ಪರಿಶೀಲಿಸಿ
cat infra/main.parameters.json | jq '.'

# 4. ನಿಯೋಜನೆ ಬದಲಾವಣೆಯ ಪೂರ್ವದೃಶ್ಯ
azd provision --preview
```

## 🚀 ತೈನಾತಿ ವಿಫಲತೆಗಳು

### ಸಮಸ್ಯೆ: ನಿರ್ಮಾಣ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ತೈನಾತಿ ವೇಳೆ ನಿರ್ಮಾಣಕ್ಕೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಪ್ಯಾಕೇಜ್ ಇನ್‌ಸ್ಟಾಲೇಶನ್ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಡೀಬಗ್ ಧ್ವಜದ ಜೊತೆ ನಿರ್ಮಾಣ ಬಹಿರ್ಗತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd deploy --service web --debug

# 2. ದರ್ಜೆಯ ಸೇವೆಯ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# 3. ಸ್ಥಳೀಯವಾಗಿ ನಿರ್ಮಾಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
cd src/web
npm install
npm run build

# 3. Node.js/Python ಆವೃತ್ತಿ ಹೊಂದಾಣಿಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
node --version  # azure.yaml ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಹೊಂದಿಕೊಳ್ಳಬೇಕು
python --version

# 4. ನಿರ್ಮಾಣ ಕ್ಯಾಶೆ ಅನ್ನು ತೆರವುಗೊಳಿಸಿ
rm -rf node_modules package-lock.json
npm install

# 5. ಕಂಟೈನರ್‌ಗಳನ್ನು ಬಳಸು ಮಾಡಿದಲ್ಲಿ Dockerfile ಪರಿಶೀಲಿಸಿ
docker build -t test-image .
docker run --rm test-image
```

### ಸಮಸ್ಯೆ: ಕಂಟೈನರ್ ತೈನಾತಿ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಪ್ರಾರಂಭಿಸಲು ವಿಫಲವಾಗುತ್ತವೆ
- ಇಮೇಜ್ ಪುಲ್ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಡೋಕರ್ ಕಟ್ಟಡವನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷೆ ಮಾಡಿ
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. ಅಜೂರ್ CLI ಬಳಸಿಕೊಂಡು ಕಂಟೈನರ್ ದೈನಂದಿನ ದಾಖಲೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ closely ಗಮನಿಸಿ
azd monitor --logs

# 3. ಕಂಟೈನರ್ ರಿಜಿಸ್ಟ್ರಿ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az acr login --name myregistry

# 4. ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az containerapp show --name my-app --resource-group my-rg
```

### ಸಮಸ್ಯೆ: ಡೇಟಾಬೇಸ್ ಸಂಪರ್ಕ ವಿಫಲತೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ಡೇಟಾಬೇಸ್‌ಗೆ ಸಂಪರ್ಕ ಮಾಡಲಾಗುತ್ತಿಲ್ಲ
- ಸಂಪರ್ಕ ಸಮಯಾವಧಿ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಡೇಟಾಬೇಸ್ ಫೈರ್ವಾಲ್ ನಿಯಮಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಸಂಪರ್ಕವನ್ನು ಪರೀಕ್ಷಿಸಿ
# ತಾತ್ಕಾಲಿಕವಾಗಿ ನಿಮ್ಮ ಆ್ಯಪ್‌ಗೆ ಸೇರಿಸಿ:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ಸಂಪರ್ಕ ಸ್ಟ್ರಿಂಗ್ ಫಾರ್ಮ್ಯಾಟ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep DATABASE

# 4. ಡೇಟಾಬೇಸ್ ಸರ್ವರ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು ಕಾರ್ಯನಿರ್ವಹಿಸುವುದಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:**
- ಅಪ್ಲಿಕೇಶನ್ ಸಂರಚನಾ ಮೌಲ್ಯಗಳನ್ನು ಓದಲು ಸಾಧ್ಯವಿಲ್ಲ
- ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳು ಖಾಲಿ ತೋರಿಸುತ್ತಿವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml ನಲ್ಲಿ ಚರಗಳ ಹೆಸರನ್ನು ಪರಿಶೀಲಿಸಿ
cat azure.yaml | grep -A 5 env:

# 3. ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪುನರಾರಂಭಿಸಿ
azd deploy --service web

# 4. ಆಪ್ ಸರ್ವೀಸ್ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp config appsettings list --name myapp --resource-group myrg
```

### ಸಮಸ್ಯೆ: SSL/TLS ಪ್ರಮಾಣಪತ್ರ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- HTTPS ಕೆಲಸ ಮಾಡುತ್ತಿಲ್ಲ
- ಪ್ರಮಾಣಪತ್ರ ಮಾನ್ಯತೆ ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# 1. SSL ಪ್ರಮಾಣಪತ್ರ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp config ssl list --resource-group myrg

# 2. ಕೇವಲ HTTPS ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. ಕಸ್ಟಮ್ ಡೊಮೇನ್ ಅನ್ನು ಸೇರಿಸಿ (ಅಗತ್ಯವಿದ್ದರೆ)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ಸಮಸ್ಯೆ: CORS ಸಂರಚನಾ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ಫ್ರಂಟೆಂಡಿನಿಂದ API ಕರೆಗೆ ಸಾಧ್ಯವಿಲ್ಲ
- ಕ್ರಾಸ್-ಆರಿಜಿನ್ ವಿನಂತಿ ತಡೆಯಲ್ಪಟ್ಟಿದೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಆಪ್ ಸರ್ವಿಸ್‌ಗೆ CORS ಅನ್ನು ಸಂರಚಿಸಿ
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS ಅನ್ನು ನಿರ್ವಹಿಸಲು API ಅನ್ನು ನವೀಕರಿಸಿ
# ಎಕ್ಸ್‌ಪ್ರೆಸ್.ಜೆಎಸ್‌ನಲ್ಲಿ:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ಸರಿಯಾದ URL ಗಳ ಮೇಲೆ ಚಲಿಸುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
azd show
```

## 🌍 ಪರಿಸರ ನಿರ್ವಹಣಾ ಸಮಸ್ಯೆಗಳು

### პრობლემა: ಪರಿಸರ ಬದಲಾವಣೆಯ ಸಮಸ್ಯೆಗಳು
**ಲક્ષણಗಳು:**
- ತಪ್ಪಾದ ಪರಿಸರ ಬಳಸಲಾಗುತ್ತಿದೆ
- ಸಂರಚನೆ ಸರಿಯಾಗಿ ಬದಲಾಗುತ್ತಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಎಲ್ಲಾ ಪರಿಸರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env list

# 2. ವಿಶೇಷವಾಗಿ ಪರಿಸರವನ್ನು ಆಯ್ಕೆಮಾಡಿ
azd env select production

# 3. ಪ್ರಸ್ತುತ ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env list

# 4. ಹಾಳಾದರೆ ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production-new
azd env select production-new
```

### ಸಮಸ್ಯೆ: ಪರಿಸರ ಭ್ರಷ್ಟತೆ
**ಲಕ್ಷಣಗಳು:**
- ಪರಿಸರ ಅಮಾನ್ಯ ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತದೆ
- ಸಂಪನ್ಮೂಲಗಳು ಸಂರಚನೆಯೊಂದಿಗೆ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಪರಿಸರ ಸ್ಥಿತಿಯನ್ನುಬೆರಗು ಮಾಡಿ
azd env refresh

# 2. ಪರಿಸರ ವಿನ್ಯಾಸವನ್ನು ಮರುಹೊಂದಿಸಿ
azd env new production-reset
# ಅಗತ್ಯವಾದ ಪರಿಸರ ಚರಗಳನ್ನು ನಕಲಿಸಿ
azd env set DATABASE_URL "your-value"

# 3. ಇತ್ತೀಚಿನ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಆಮದು ಮಾಡಿ (ಸಾಧ್ಯವಾದರೆ)
# ಸಂಪನ್ಮೂಲ ID ಗಳೊಂದಿಗೆ .azure/production/config.json ಅನ್ನು ಕೈಯಿಂದ ನವೀಕರಿಸಿ
```

## 🔍 ಕಾರ್ಯಕ್ಷಮತಾ ಸಮಸ್ಯೆಗಳು

### ಸಮಸ್ಯೆ: ತೈನಾತಿ ಸಮಯ ನಿಧಾನವಾಗಿದೆ
**ಲಕ್ಷಣಗಳು:**
- ತೈನಾತಿಗಳು ಬಹಳ ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ
- ತೈನಾತಿ ಸಮಯ ಮೀರಿದೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ವೇಗವಾಗಿ ಪುನರಾವರ್ತನೆಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# 2. ಮೂಲಸೌಕರ್ಯ ಬದಲಾಗದಿದ್ದಾಗ ಕೇವಲ ಕೋಡ್ ನಿಯೋಜನೆಯನ್ನು ಬಳಸಿ
azd deploy  # azd ಅಪ್ ಗೆ ಒಳಗಾದ ವೇಗವಾಗಿ

# 3. ನಿರ್ಮಾಣ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಆಪ್ಟಿಮೈಜ್ ಮಾಡಿ
# package.json ನಲ್ಲಿ:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. ಸಂಪನ್ಮೂಲ ಸ್ಥಳಗಳನ್ನು ಪರಿಶೀಲಿಸಿ (ಒಂದೇ ಪ್ರಾಂತ್ಯವನ್ನು ಬಳಸಿ)
azd config set defaults.location eastus2
```

### ಸಮಸ್ಯೆ: ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆಯ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:**
- ನಿಧಾನವಾದ ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯಗಳು
- ಹೆಚ್ಚಿನ ಸಂಪನ್ಮೂಲ ಬಳಕೆ

**ಪರಿಹಾರಗಳು:**
```bash
# 1. ಸಂಪನ್ಮೂಲಗಳನ್ನು ವಿಸ್ತರಿಸಿ
# main.parameters.json ನಲ್ಲಿ SKU ಅನ್ನು ನವೀಕರಿಸಿ:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd monitor --overview

# 3. ಏಜುರ್‌ನಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp log tail --name myapp --resource-group myrg
# ಅಥವಾ ಕಾಂಟೈನರ್ ಅಪ್ಸ್ ಗಾಗಿ:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. ಕ್ಯಾಸಿಂಗ್ ಅನುಷ್ಠಾನಗೊಳಿಸಿ
# ನಿಮ್ಮ ಮೂಲಸೌಕರ್ಯದಲ್ಲಿ ರೆಡಿಸ್ ಕ್ಯಾಸ್ ಸೇರಿಸಿ
```

## 🛠️ ತೊಂದರೆ ಪರಿಹಾರ ಉಪಕರಣಗಳು ಮತ್ತು ಕಮಾಂಡ್‌ಗಳು

### ಡೀಬಗ್ ಕಮಾಂಡ್‌ಗಳು
```bash
# ಸಮಗ್ರ ದೋಷಪತ್ತೆ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### ಲಾಗ್ ವಿಶ್ಲೇಷಣೆ
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್ಗಳು Azure CLI ಮೂಲಕ
az webapp log tail --name myapp --resource-group myrg

# azd ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಪರಿಶೀಲಿಸಿ
azd monitor --logs
azd monitor --live

# ಅಜೂರ್ ಸಂಪನ್ಮೂಲ ಲಾಗ್ಗಳು
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# ಕಾಂಟೇನರ್ ಲಾಗ್ಗಳು (ಕಾಂಟೇನರ್ ಆ್ಯಪ್ಗಳಿಗಾಗಿ)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ಸಂಪನ್ಮೂಲ ಪರಿಶೋಧನೆ
```bash
# ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az resource list --resource-group myrg -o table

# ಸಂಪನ್ಮೂಲ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp show --name myapp --resource-group myrg --query state

# ನೆಟ್‌ವರ್ಕ್ ರೋಗಪರಿಶೀಲನೆ
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ಹೆಚ್ಚುವರಿ ಸಹಾಯ ಪಡೆಯುವುದು

### ಏಕೆ ಮತ್ತು ಏಾಗಾಗಬೇಕು ಎಸ್ಕಲೆಟ್ ಮಾಡುವುದು
- ಎಲ್ಲಾ ಪರಿಹಾರಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿದ ನಂತರ ಮಾನ್ಯತೆ ಸಮಸ್ಯೆಗಳು ಮುಂದುವರಿದರೆ
- ಆಜರ್ ಸೇವೆಗಳ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಸಮಸ್ಯೆಗಳು
- ಬಿಲ್ಲಿಂಗ್ ಅಥವಾ ಚಂದಾದಾರಿಕೆ ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳು
- ಭದ್ರತಾ ಸಮಸ್ಯೆಗಳು ಅಥವಾ ಘಟನೆಗಳು

### ಬೆಂಬಲ ಚಾನಲ್ಗಳು
```bash
# 1. ಅಜೂರ್ ಸೇವೆ ಆರೋಗ್ಯ ಪರಿಶೀಲಿಸಿ
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. ಅಜೂರ್ ಬೆಂಬಲ ಟಿಕೆಟ್ ರಚಿಸಿ
# ಗೋ: https://portal.azure.com -> ಸಹಾಯ + ಬೆಂಬಲ

# 3. ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
# - ಸ್ಟಾಕ್ ಓವರ್‌ಫ್ಲೋ: azure-developer-cli ಟ್ಯಾಗ್
# - ಗಿಥಬ್ ಸಮಸ್ಯೆಗಳು: https://github.com/Azure/azure-dev/issues
# - ಮೈಕ್ರೋಸಾಫ್ಟ್ Q&A: https://learn.microsoft.com/en-us/answers/
```

### ಸಂಗ್ರಹಿಸಬೇಕಾದ ಮಾಹಿತಿ
ಬೆಂಬಲಕ್ಕೆ ಸಂಪರ್ಕಿಸುವ ಮುಂಚೆ ಸಂಗ್ರಹಿಸಿ:
- `azd version` ಔಟ್‌ಪುಟ್
- `azd config show` ಔಟ್‌ಪುಟ್
- `azd show` ಔಟ್‌ಪುಟ್ (ಪ್ರಸ್ತುತ ತೈನಾತಿ ಸ್ಥಿತಿ)
- ದೋಷ ಸಂದೇಶಗಳು (ಪೂರ್ಣ ಪಠ್ಯ)
- ಸಮಸ್ಯೆಯನ್ನು ಪುನರಾವರ್ತಿಸುವ ಹಂತಗಳು
- ಪರಿಸರ ವಿವರಗಳು (`azd env get-values`)
- ಸಮಸ್ಯೆ ಪ್ರಾರಂಭವಾದ ಸಮಯರೇಖೆ

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 ಸಮಸ್ಯೆ ತಡೆಯುವಿಕೆ

### ಪೂರ್ವ-ತೈನಾತಿ ಪರಿಶೀಲನಾ ಪಟ್ಟಿ
```bash
# 1. ಅಾಥೆಂಟಿಕೇಶನ್ ಪರಿಶೀಲಿಸಿ
az account show

# 2. ಕೋಟಾ ಮತ್ತು ಪರಿಮಿತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az vm list-usage --location eastus2

# 3. ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az bicep build --file infra/main.bicep

# 4. ಮೊದಲು ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ
npm run build
npm run test

# 5. ಡ್ರೈ-ರನ್ ನಿಯೋಜನೆಗಳನ್ನು ಬಳಸಿ
azd provision --preview
```

### ಮಾನಿಟರಿಂಗ್ ಸೆಟ್ಟಪ್
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಸಕ್ರಿಯಮಾಡಿ
# main.bicep ಗೆ ಸೇರಿಸಿ:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ನಿಯಮಿತ ನಿರ್ವಹಣೆ
```bash
# ವಾರವಾರದ ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳು
./scripts/health-check.sh

# ಮಾಸಿಕ ವೆಚ್ಚ ಪರಿಶೀಲನೆ
az consumption usage list --billing-period-name 202401

# ತ್ರೈಮಾಸಿಕ ಸುರಕ್ಷತಾ ಪರಿಶೀಲನೆ
az security assessment list --resource-group myrg
```

## ಸಂಬಂಧಿತ ಸಂಪನ್ಮೂಲಗಳು

- [ಡಿಬಗ್ ಗೈಡ್](debugging.md) - ಉನ್ನತ ಮಟ್ಟದ ಡಿಬಗಿಂಗ್ ತಂತ್ರಗಳು
- [ಸಂಪನ್ಮೂಲ ಪ್ರೊವಿಷನಿಂಗ್](../chapter-04-infrastructure/provisioning.md) - ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ತೊಂದರೆ ಪರಿಹಾರ
- [ಕ್ಷಮತಾ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ಸಂಪನ್ಮೂಲ ಯೋಜನಾ ಮಾರ್ಗದರ್ಶನ
- [SKU ಆಯ್ಕೆ](../chapter-06-pre-deployment/sku-selection.md) - ಸೇವಾ ಮಟ್ಟದ ಶಿಫಾರಸುಗಳು

---

**ಸೂಚನೆ**: ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಿ ಮತ್ತು ಸಮಸ್ಯೆ ಎದುರಾದಾಗ ಇದರಲ್ಲಿ ನಿರಂತರವಾಗಿ ಸಾಧ್ಯವಾದಾಗ ವಿಮರ್ಶಿಸಿ. ಹೆಚ್ಚಿನ ಸಮಸ್ಯೆಗಳು ಮೊದಲು ನೋಡಲ್ಪಟ್ಟಿದ್ದು, ಅವುಗಳಿಗೆ ಸ್ಥಿರ ಪರಿಹಾರಗಳಿವೆ!

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಸಂಪನ್ಮೂಲ ಪ್ರೊವಿಷನಿಂಗ್](../chapter-04-infrastructure/provisioning.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಡಿಬಗ್ ಗೈಡ್](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ಪಷ್ಟತೆ**:
ಈ ದಸ್ತಾವೇಜನ್ನು ಎಐ ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಉಪಯೋಗಿಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯಿಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಂಗತತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ತಿಳಿದುಕೊಳ್ಳಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕಾರತ್ಮಕ ಮೂಲವನ್ನಾಗಿ ಪರಿಗಣಿಸುವುದು ಉತ್ತಮ. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸ್ಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವ ತಪ್ಪುಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->