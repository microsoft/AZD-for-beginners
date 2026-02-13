# ಕಮಾಂಡ್ ಚೀಟ್‌ಶೀಟ್ - ಅಗತ್ಯ AZD ಆಜ್ಞೆಗಳು

**ಎಲ್ಲಾ ಅಧ್ಯಾಯಗಳ ತ್ವರಿತ ಉಲ್ಲೇಖ**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರಂಭಿಕರಿಗೆ AZD](../README.md)
- **📖 ತ್ವರಿತ ಪ್ರಾರಂಭ**: [ಅಧ್ಯಾಯ 1: ಆಧಾರಭೂತ ಮತ್ತು ತ್ವರಿತ ಪ್ರಾರಂಭ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ಆಜ್ಞೆಗಳು**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಾಥಮಿಕ ಅಭಿವೃದ್ಧಿ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ಉನ್ನತ**: [ಅಧ್ಯಾಯ 4: ಕೋಡ್ ಆಗಿ ಮೂಲಸೌಕರ್ಯ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ಪರಿಚಯ

ಈ ವಿಸ್ತೃತ ಚೀಟ್‌ಶೀಟ್ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸಲಾಗುವ Azure Developer CLI ಆಜ್ಞೆಗಳ ತ್ವರಿತ ಉಲ್ಲೇಖವನ್ನು ನೀಡುತ್ತದೆ, ವರ್ಗೀಕರಿಸಿಕೊಂಡು ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳೊಂದಿಗೆ ಸಂಯೋಜಿಸಲಾಗಿದೆ. azd ಪ್ರಾಜೆಕ್ಟ್‌ಗಳ ಅಭಿವೃದ್ಧಿ, ಸಮಸ್ಯೆ ಪರಿಹಾರ ಮತ್ತು ದೈನಂದಿನ ಕಾರ್ಯಾಚರಣೆಯ ಸಮಯದಲ್ಲಿ ತ್ವರಿತವಾಗಿ ಕಂಡುಹಿಡಿಯಲು ಇದು ಅಮೂಲ್ಯವಾಗಿದೆ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಚೀಟ್‌ಶೀಟ್ ಬಳಸಿಕೊಂಡು, ನೀವು:
- ಅಗತ್ಯ Azure Developer CLI ಆಜ್ಞೆಗಳ ಮತ್ತು ಸಿಂಟ್ಯಾಕ್ಸ್‌ಗಳಿಗೆ ತಕ್ಷಣ ಪ್ರವೇಶ ಹೊಂದಿರುತ್ತೀರಿ
- ಕಾರ್ಯಾತ್ಮಕ ವರ್ಗೀಕರಣಗಳ ಮತ್ತು ಬಳಕೆಯ ಪ್ರಕರಣಗಳ ಮೂಲಕ ಆಜ್ಞೆಗಳ ವ್ಯವಸ್ಥೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡಿರುತ್ತೀರಿ
- ಸಾಮಾನ್ಯ ανάπτυ ಮತ್ತು ನಿಯೋಜನೆ ಸಂದರ್ಭಗಳಿಗಾಗಿ ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳನ್ನು ಉಲ್ಲೇಖಿಸಬಹುದು
- ತ್ವರಿತ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕಾಗಿ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಆಜ್ಞೆಗಳನ್ನು ಪ್ರವೇಶಿಸಬಹುದು
- ಉನ್ನತ ಸಂರಚನೆ ಮತ್ತು ಕಸ್ಟಮೈಜೆಶನ್ ಆಯ್ಕೆಗಳು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಕಾಣಬಹುದು
- ಪರಿಸರ ನಿರ್ವಹಣೆ ಮತ್ತು ಬಹು-ಪರಿಸರ ಕಾರ್ಯಪ್ರವಾಹ ಆಜ್ಞೆಗಳನ್ನು ಕಂಡುಹಿಡಿಯಬಹುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಈ ಚೀಟ್‌ಶೀಟ್ ಅನ್ನು ನಿಯಮಿತವಾಗಿ ಉಲ್ಲೇಖಿಸಿದರೆ, ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ಸಂಪೂರ್ಣ ದಾಖಲೆಗಳನ್ನು ನೋಡಿ ಅವಲಂಬಿಸದೆ azd ಆಜ್ಞೆಗಳನ್ನು ವಿಶ್ವಾಸದಿಂದ ನಿರ್ವಹಿಸಲು
- ಸೂಕ್ತ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಆಜ್ಞೆಗಳ ಬಳಕೆಯಿಂದ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ವೇಗವಾಗಿ ಪರಿಹರಿಸಲು
- ಬಹು-ಪರಿಸರ ಮತ್ತು ನಿಯೋಜನೆ ಸಂದರ್ಭಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನಿರ್ವಹಿಸಲು
- ಅಗತ್ಯವಿದ್ದಾಗ azd ನ ಉನ್ನತ ವೈಶಿಷ್ಟ್ಯಗಳು ಮತ್ತು ಸಂರಚನಾ ಆಯ್ಕೆಗಳನ್ನು ಅನ್ವಯಿಸಲು
- ಕ್ರಮಬದ್ಧ ಆಜ್ಞೆ ಶ್ರೇಣಿಗಳನ್ನು ಬಳಸಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಲು
- azd ಶಾಟ್‌ಕಟ್‌ಗಳು ಮತ್ತು ಆಯ್ಕೆಗಳ ಪರಿಣಾಮಕಾರಿ ಬಳಕೆಯಿಂದ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಅನುಕೂಲಗೊಳಿಸಲು

## ಪ್ರಾರಂಭದ ಆಜ್ಞೆಗಳು

### ದೃಢೀಕರಣ
```bash
# AZD ಮೂಲಕ Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# Azure CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ (AZD ಇದನ್ನು ಹಿನ್ನಲೆಯಲ್ಲಿ ಬಳಸುತ್ತದೆ)
az login

# ಪ್ರಸ್ತುತ ಖಾತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show

# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ನಿಂದ ಲಾಗ್ಔಟ್ ಮಾಡಿ
azd auth logout

# Azure CLI ನಿಂದ ಲಾಗ್ಔಟ್ ಮಾಡಿ
az logout
```

### ಪ್ರಾಜೆಕ್ಟ್ ಆರಂಭಿಕೆ
```bash
# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd template list

# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ಪ್ರಸ್ತುತ ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಪ್ರಾರಂಭಿಸಿ
azd init .

# ಕಸ್ಟಮ್ ಹೆಸರಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ಕೋರ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆಜ್ಞೆಗಳು

### ಸಂಪೂರ್ಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ (ಪ್ರೊವಿಷನಿಂಗ್ + ಡಿಪ್ಲಾಯ್)
azd up

# ದೃಢೀಕರಣ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ ಮತ್ತು ನಿಯೋಜಿಸಿ
azd up --confirm-with-no-prompt

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --parameter location=westus2
```

### ಕೇವಲ ಮೂಲಸೌಕರ್ಯ
```bash
# Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸಿ
azd provision

# 🧪 ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬದಲಾವಣೆಗಳ ಪೂರ್ವ ವೀಕ್ಷಣೆ
azd provision --preview
# ಯಾವ ಸಂಪನ್ಮೂಲಗಳು ರಚಿಸಲ್ಪಡುತ್ತವೆ/ತಿದ್ದುಪಡಿಯಾಗುತ್ತವೆ/ಅಳಿಸಲ್ಪಡುತ್ತವೆ ಎಂಬದಿನ ಡ್ರೈ-ರನ್ ವೀಕ್ಷಣೆಯನ್ನು ತೋರಿಸುತ್ತದೆ
# ಇದು 'terraform plan' ಅಥವಾ 'bicep what-if' ಗೆ ಸಮಾನ — ಚಾಲನೆ ಮಾಡಲು ಸುರಕ್ಷಿತ, ಯಾವುದೇ ಬದಲಾವಣೆಗಳನ್ನು ಅನ್ವಯಿಸಲಾಗುವುದಿಲ್ಲ
```

### ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --all
```

### ನಿರ್ಮಾಣ ಮತ್ತು ಪ್ಯಾಕೇಜ್
```bash
# ಅನ್ವಯಿಕೆಗಳನ್ನು ನಿರ್ಮಿಸಿ
azd package

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿರ್ಮಿಸಿ
azd package --service api
```

## 🌍 ಪರಿಸರ ನಿರ್ವಹಣೆ

### ಪರಿಸರ ಕಾರ್ಯಾಚರಣೆಗಳು
```bash
# ಎಲ್ಲಾ ಪರಿಸರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env list

# ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new development
azd env new staging --location westus2

# ಪರಿಸರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ
azd env select production

# ಪ್ರಸ್ತುತ ಪರಿಸರವನ್ನು ತೋರಿಸಿ
azd env show

# ಪರಿಸರ ಸ್ಥಿತಿಯನ್ನು ನವೀಕರಿಸಿ
azd env refresh
```

### ಪರಿಸರ ಚರಗಳು
```bash
# ಪರಿಸರ ಚರವನ್ನು ನಿಗದಿಪಡಿಸಿ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ಪರಿಸರ ಚರವನ್ನು ಪಡೆಯಿರಿ
azd env get API_KEY

# ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env get-values

# ಪರಿಸರ ಚರವನ್ನು ತೆಗೆದುಹಾಕಿ
azd env unset DEBUG
```

## ⚙️ ಸಂರಚನಾ ಆಜ್ಞೆಗಳು

### ಜಾಗತಿಕ ಸಂರಚನೆ
```bash
# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd config list

# ಜಾಗತಿಕ ಪೂರ್ವನಿರ್ಧಾರಗಳನ್ನು ನಿಗದಿ ಮಾಡಿ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ಸಂರಚನೆಯನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location

# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಮರುಹೊಂದಿಸಿ
azd config reset
```

### ಯೋಜನೆ ಸಂರಚನೆ
```bash
# azure.yaml ಅನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd config validate

# ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ
azd show

# ಸೇವೆಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show --output json
```

## 📊 ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ತಪಾಸಣಿ

### ಮೇಲ್ವಿಚಾರಣೆ ಡ್ಯಾಷ್‌ಬೋರ್ಡ್
```bash
# Azure ಪೋರ್ಟಲ್‌ನ ಮానಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor

# Application Insights ನ ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್ ತೆರೆಯಿರಿ
azd monitor --live

# Application Insights ನ ಲಾಗ್‌ಗಳು ಬ್ಲೇಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# Application Insights ನ ಅವಲೋಕನ ತೆರೆಯಿರಿ
azd monitor --overview
```

### ಕಂಟೇನರ್ ಲಾಗ್‍ಗಳನ್ನು ವೀಕ್ಷಣೆ
```bash
# Azure CLI ಮೂಲಕ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (Container Apps ಗಾಗಿ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ನೇರ-ಸಮಯದಲ್ಲಿ ಲಾಗ್‌ಗಳನ್ನು ಅನುಸರಿಸಿ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal ನಿಂದ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs
```

### ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ಕ್ವೇರಿಗಳು
```bash
# Azure ಪೋರ್ಟಲ್ ಮೂಲಕ ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ಅನ್ನು ಪ್ರವೇಶಿಸಿ
azd monitor --logs

# Azure CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಕ್ವೇರಿ ಮಾಡಿ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ನಿರ್ವಹಣಾ ಆಜ್ಞೆಗಳು

### ಸ್ವಚ್ಛತೆ
```bash
# ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆಗೆದುಹಾಕಿ
azd down

# ದೃಢೀಕರಣವಿಲ್ಲದೆ ಬಲವಂತದಿಂದ ಅಳಿಸಿ
azd down --force

# ಸಾಫ್ಟ್-ಡಿಲೀಟ್ ಆಗಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ
azd down --purge

# ಸಂಪೂರ್ಣ ಶುದ್ಧೀಕರಣ
azd down --force --purge
```

### ನವೀಕರಣಗಳು
```bash
# azd ಅಪ್ಡೇಟ್ಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
azd version

# ಪ್ರಸ್ತುತ ಆವೃತ್ತಿಯನ್ನು ಪಡೆಯಿ
azd version

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config list
```

## 🔧 ಉನ್ನತ ಆಜ್ಞೆಗಳು

### ಪೈಪ್‌ಲೈನ್ ಮತ್ತು CI/CD
```bash
# GitHub Actions ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
azd pipeline config

# Azure DevOps ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
azd pipeline config --provider azdo

# ಪೈಪ್‌ಲೈನ್ ಸಂರಚನೆಯನ್ನು ತೋರಿಸಿ
azd pipeline show
```

### ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆ
```bash
# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# 🧪 ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪೂರ್ವಾವಲೋಕನ ಮತ್ತು ಯೋಜನೆ
azd provision --preview
# ಡಿಪ್ಲಾಯ್ ಮಾಡದೆ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒದಗಿಕೆಯನ್ನು ಅನುಕರಿಸುತ್ತದೆ
# Bicep/Terraform ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಕೆಳಕಂಡವುಗಳನ್ನು ತೋರಿಸುತ್ತದೆ:
# - ಸೇರಿಸಲಾಗುವ ಸಂಪನ್ಮೂಲಗಳು (ಹಸಿರು +)
# - ತಿದ್ದುಪಡಿಸಲಾಗುವ ಸಂಪನ್ಮೂಲಗಳು (ಹಳದಿ ~)
# - ತೆಗೆದುಹಾಕಲಾಗುವ ಸಂಪನ್ಮೂಲಗಳು (ಕೆಂಪು -)
# ಚಲಾಯಿಸಲು ಸುರಕ್ಷಿತ - Azure ಪರಿಸರದಲ್ಲಿ ಯಾವುದೇ ನೈಜ ಬದಲಾವಣೆಗಳು ನಡೆಸುವುದಿಲ್ಲ

# azure.yaml ನಿಂದ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಸಂಶ್ಲೇಷಿಸಿ
azd infra synth
```

### ಯೋಜನೆ ಮಾಹಿತಿ
```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಸ್ಥಿತಿ ಮತ್ತು ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ತೋರಿಸಿ
azd show

# ವಿಸ್ತೃತ ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿಯನ್ನು JSON ಆಗಿ ತೋರಿಸಿ
azd show --output json

# ಸೇವೆಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show --output json | jq '.services'
```

## 🎯 ತ್ವರಿತ ಕಾರ್ಯಪ್ರವಾಹಗಳು

### ಅಭಿವೃದ್ಧಿ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಹೊಸ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
cd my-project

# ಡೆವಲಪ್‌ಮೆಂಟ್‌ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd env new dev
azd up

# ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮತ್ತು ಮತ್ತೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd deploy

# ನಿಗಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --live
```

### ಬಹು-ಪರಿಸರ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಪರಿಸರಗಳನ್ನು ಸಜ್ಜುಗೊಳಿಸಿ
azd env new dev
azd env new staging  
azd env new production

# ವಿಕಾಸ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd env select dev
azd up

# ಪರೀಕ್ಷಿಸಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್‌ ಪರಿಸರಕ್ಕೆ ಜಾರಿಗೊಳಿಸಿ
azd env select staging
azd up

# ಉತ್ಪಾದನಾ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd env select production
azd up
```

### ಸಮಸ್ಯೆ ಪರಿಹಾರ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಡಿಬಗ್ ಮೋಡ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd config list

# ಲಾಗ್‌ಗಳಿಗಾಗಿ ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿ
azd monitor --logs

# ಸಂಪನ್ಮೂಲ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

## 🔍 ಡೀಬಗ್ಗಿಂಗ್ ಆಜ್ಞೆಗಳು

### ಡೀಬಗ್ಗಿಂಗ್ ಮಾಹಿತಿ
```bash
# ಡಿಬಗ್ ಔಟ್‌ಪುಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug

# ಸ್ವಚ್ಛ ಔಟ್‌ಪುಟ್‌ಗಾಗಿ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರೀಯಗೊಳಿಸಿ
export AZD_DISABLE_TELEMETRY=true

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd config list

# ಪ್ರಮಾಣೀಕರಣ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಟೆಂಪ್ಲೇಟ್ ಡೀಬಗ್ಗಿಂಗ್
```bash
# ವಿವರಗಳೊಂದಿಗೆ ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd template list --output json

# ಟೆಂಪ್ಲೇಟಿನ ಮಾಹಿತಿ ತೋರಿಸಿ
azd template show <template-name>

# init ಮಾಡುವ ಮೊದಲು ಟೆಂಪ್ಲೇಟನ್ನು ಪರಿಶೀಲಿಸಿ
azd template validate <template-name>
```

## 📁 ಫೈಲ್ ಮತ್ತು ಡೈರಕ್ಟರಿ ಆಜ್ಞೆಗಳು

### ಯೋಜನೆ ರಚನೆ
```bash
# ಪ್ರಸ್ತುತ ಡೈರೆಕ್ಟರಿಯ ರಚನೆಯನ್ನು ತೋರಿಸಿ
tree /f  # ವಿಂಡೋಸ್
find . -type f  # ಲಿನಕ್ಸ/ಮ್ಯಾಕ್‌ಒಎಸ್

# azd ಪ್ರಾಜೆಕ್ಟ್ ರೂಟ್‌ಗೆ ಹೋಗಿ
cd $(azd root)

# azd ಸಂರಚನಾ ಡೈರೆಕ್ಟರಿಯನ್ನು ತೋರಿಸಿ
echo $AZD_CONFIG_DIR  # ಸಾಮಾನ್ಯವಾಗಿ ~/.azd
```

## 🎨 ಔಟ್‌ಪುಟ್ ರೂಪುಗೊಳಿಸುವಿಕೆ

### JSON ಔಟ್‌ಪುಟ್
```bash
# ಸ್ಕ್ರಿಪ್ಟಿಂಗ್‌ಗಾಗಿ JSON ಔಟ್‌ಪುಟ್ ಪಡೆಯಿರಿ
azd show --output json
azd env list --output json
azd config list --output json

# jq ಬಳಸಿ ವಿಶ್ಲೇಷಿಸಿ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ಟೇಬಲ್ ಔಟ್‌ಪುಟ್
```bash
# ಟೇಬಲ್ ಆಗಿ ಸ್ವರೂಪಿಸಿ
azd env list --output table

# ಅಳವಡಿಸಿದ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show --output json | jq '.services | keys'
```

## 🔧 ಸಾಮಾನ್ಯ ಕಮಾಂಡ್ ಸಂಯೋಜನೆಗಳು

### ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# ತ್ವರಿತ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ
azd show
azd env show
azd monitor --logs
```

### ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗೆ ಮುನ್ನ ಪರಿಶೀಲನೆ
azd show
azd provision --preview  # ಡಿಪ್ಲಾಯ್ ಮಾಡಲು ಮೊದಲು ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವನೋಟ ಮಾಡಿ
az account show
```

### ಪರಿಸರ ಹೋಲಿಕೆ
```bash
#!/bin/bash
# ಪರಿಸರಗಳನ್ನು ಹೋಲಿಸಿ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ಸಂಪನ್ಮೂಲ ಸ್ವಚ್ಛತೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# ಹಳೆಯ ಪರಿಸರಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ಪರಿಸರ ಚರಗಳು

### ಸಾಮಾನ್ಯ ಪರಿಸರ ಚರಗಳು
```bash
# ಏಜರ್ ಸಂರಚನೆ
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD ಸಂರಚನೆ
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# ಅನ್ವಯಿಕೆಯ ಸಂರಚನೆ
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ತುರ್ತು ಆಜ್ಞೆಗಳು

### ತ್ವರಿತ ಪರಿಹಾರಗಳು
```bash
# ಪ್ರಮಾಣೀಕರಣವನ್ನು ಮರುಹೊಂದಿಸಿ
az account clear
az login

# ಪರಿಸರವನ್ನು ಬಲವಂತವಾಗಿ ನವೀಕರಿಸಿ
azd env refresh

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ಮರು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿಯೋಜನೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

### ಪುನರುದ್ದಾರ ಆಜ್ಞೆಗಳು
```bash
# ಅಸಫಲವಾದ ನಿಯೋಜನೆಯನ್ನು ಪುನಃಸ್ಥಾಪಿಸಿ - ಸ್ವಚ್ಛಗೊಳಿಸಿ ಮತ್ತು ಮರುನಿಯೋಜಿಸಿ
azd down --force --purge
azd up

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಮಾತ್ರ ಮರುನಿಯೋಜಿಸಿ
azd provision

# ಅಪ್ಲಿಕೇಶನನ್ನು ಮಾತ್ರ ಮರುನಿಯೋಜಿಸಿ
azd deploy
```

## 💡 ಪ್ರೊ ಸಲಹೆಗಳು

### ವೇಗದ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಾಗಿ ಅಲಿಯಾಸ್‌ಗಳು
```bash
# ನಿಮ್ಮ .bashrc ಅಥವಾ .zshrc ಗೆ ಸೇರಿಸಿ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ಫಂಕ್ಷನ್ ಶಾರ್ಟ್ಕಟ್‌ಗಳು
```bash
# ತ್ವರಿತವಾಗಿ ಪರಿಸರ ಬದಲಾಯಿಸುವುದು
azd-env() {
    azd env select $1 && azd show
}

# ನಿರೀಕ್ಷಣೆಯೊಂದಿಗೆ ತ್ವರಿತ ನಿಯೋಜನೆ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# ಪರಿಸರ ಸ್ಥಿತಿ
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ಸಹಾಯ ಮತ್ತು ದಾಖಲೆಗಳು

### ಸಹಾಯ ಪಡೆಯುವುದು
```bash
# ಸಾಮಾನ್ಯ ಸಹಾಯ
azd --help
azd help

# ಆಜ್ಞೆ-ನಿರ್ದಿಷ್ಟ ಸಹಾಯ
azd up --help
azd env --help
azd config --help

# ಆವೃತ್ತಿ ಮತ್ತು ನಿರ್ಮಾಣ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ
azd version
azd version --output json
```

### ಡಾಕ್ಯುಮೆಂಟ್ ಲಿಂಕ್‌ಗಳು
```bash
# ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಅನ್ನು ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಿರಿ
azd docs

# ಟೆಂಪ್ಲೇಟಿನ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ತೋರಿಸಿ
azd template show <template-name> --docs
```

---

**ಟಿಪ್**: ಈ ಚೀಟ್‌ಶೀಟ್ ಅನ್ನು ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಿ ಮತ್ತು ನೀವು ಅಗತ್ಯವಿರುವ ಕಮಾಂಡ್‌ಗಳನ್ನು ಬೇಗವಾಗಿ ಕಂಡುಹಿಡಿಯಲು `Ctrl+F` ಬಳಸಿ!

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಪ್ರಿಫ್ಲೈಟ್ ಪರಿಶೀಲನೆಗಳು](../docs/pre-deployment/preflight-checks.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಶಬ್ದಕೋಶ](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸಮರ್ಥತೆಗಳು ಇರಬಹುದೆಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿಡಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವನ್ನಾಗಿ ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಸುವಿಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಜ್ಞತೆಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥಗೊಳ್ಳುವಿಕೆಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->