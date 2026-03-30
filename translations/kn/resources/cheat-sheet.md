# ಕಮಾಂಡ್ ಚೀಟ್ ಶೀಟ್ - ಅವಶ್ಯಕ AZD ಕಮಾಂಡ್‌ಗಳು

**ಎಲ್ಲಾ ಅಧ್ಯಾಯಗಳಿಗಾಗಿ ತ್ವರಿತ ಉಲ್ಲೇಖ**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [ಅಧ್ಯಾಯ 1: ಆಧಾರ ಮತ್ತು ತ್ವರಿತ ಪ್ರಾರಂಭ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [ಅಧ್ಯಾಯ 2: AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [ಅಧ್ಯಾಯ 4: ಕೋಡ್ ರೂಪದಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ಪರಿಚಯ

ಈ ಸಂಪೂರ್ಣ ಚೀಟ್ ಶೀಟ್ ಹೆಚ್ಚು ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸಲಾಗುವ Azure Developer CLI ಕಮಾಂಡ್‌ಗಳ ತ್ವರಿತ ಉಲ್ಲೇಖವನ್ನು ನೀಡುತ್ತದೆ, ವರ್ಗಾನುಸಾರವಾಗಿ ಆಯೋಜಿಸಲಾಗಿದ್ದು ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. azd ಪ್ರಾಜೆಕ್ಟ್‌ಗಳ ಅಭಿವೃದ್ಧಿ, ತೊಂದರೆ ಪರಿಹಾರ ಮತ್ತು ದೈನಂದಿನ ಕಾರ್ಯಾಚರಣೆಗಳ ಸಮಯದಲ್ಲಿ ತ್ವರಿತವಾಗಿ ಹುಡುಕಲು ಇದು ಸೂಕ್ತವಾಗಿದೆ.

## ಅಧ್ಯಯನ ಗುರಿಗಳು

ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ಬಳಸುವ ಮೂಲಕ, ನೀವು:
- ಅವಶ್ಯಕ Azure Developer CLI ಕಮಾಂಡ್‌ಗಳು ಮತ್ತು ವಾಕ್ಯರಚನೆಗೆ ತಕ್ಷಣದ ಪ್ರವೇಶ
- ಕಾರ್ಯಾತ್ಮಕ ವರ್ಗಗಳು ಮತ್ತು ಬಳಕೆ ಪ್ರಕರಣಗಳ ಮೂಲಕ ಕಮಾಂಡ್‌ಗಳ ಸಂಘಟನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಸಾಮಾನ್ಯ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ಸಂದರ್ಭಗಳಿಗೆ ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳನ್ನು ಉಲ್ಲೇಖಿಸುವುದು
- ತ್ವರಿತವಾಗಿ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕಾಗಿ ತೊಂದರೆ ಪರಿಹಾರ ಕಮಾಂಡ್‌ಗಳಿಗೆ ಪ್ರವೇಶ
- ಉನ್ನತ ಸಂರಚನೆ ಮತ್ತು ಕಸ್ಟಮೈಜೇಶನ್ ಆಯ್ಕಿಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಕಂಡುಹಿಡಿಯುವುದು
- ಪರಿಸರ ನಿರ್ವಹಣೆ ಮತ್ತು ಬಹು-ಪರಿಸರ ವರ್ಕ್‌ಫ್ಲೋ ಕಮಾಂಡ್‌ಗಳನ್ನು ಹುಡುಕುವುದು

## ಅಧ್ಯಯನ ಫಲಿತಾಂಶಗಳು

ನಿಯಮಿತವಾಗಿ ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ಉಲ್ಲೇಖಿಸಿದರೆ, ನೀವು:
- ಸಂಪೂರ್ಣ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಅನ್ನು ಉಲ್ಲೇಖಿಸದೆ ಆತ್ಮವಿಶ್ವಾಸದಿಂದ azd ಕಮಾಂಡ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಬಲ್ಲಿರಿ
- ಸೂಕ್ತ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಕಮಾಂಡ್‌ಗಳನ್ನು ಬಳಸಿ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ತ್ವರಿತವಾಗಿ ಪರಿಹರಿಸಬಲ್ಲಿರಿ
- ಬಹು ಪರಿಸರಗಳನ್ನು ಮತ್ತು ನಿಯೋಜನೆ ಸಂದರ್ಭಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನಿರ್ವಹಿಸಬಲ್ಲಿರಿ
- ಅಗತ್ಯವಾದಲ್ಲಿ ಉನ್ನತ azd ವೈಶಿಷ್ಟ್ಯಗಳು ಮತ್ತು ಸಂರಚನಾ ಆಯ್ಕೆಗಳನ್ನು ಅನ್ವಯಿಸಬಲ್ಲಿರಿ
- ವ್ಯವಸ್ಥಿತ ಕಮಾಂಡ್ ಕ್ರಮಗಳನ್ನು ಬಳಸಿ ನಿಯೋಜನೆ ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳನ್ನು ತಿರುವುಗೊಳಿಸಲು ಸಾಧ್ಯವಿದೆ
- azd ಶಾರ್ಟ್‌ಕಟ್‌ಗಳು ಮತ್ತು ಆಯ್ಕೆಗಳ ಪರಿಣಾಮಕಾರಿ ಬಳಕೆ ಮೂಲಕ ವರ್ಕ್‌ಫ್ಲೋಗಳನ್ನು ಸುಧಾರಿಸಬಲ್ಲಿರಿ

## ಪ್ರಾರಂಭಿಸುವ ಕಮಾಂಡ್‌ಗಳು

### ಪ್ರಮಾಣೀಕರಣ
```bash
# AZD ಮೂಲಕ Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# Azure CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ (AZD ಇದನ್ನು ಆಂತರಿಕವಾಗಿ ಬಳಸುತ್ತದೆ)
az login

# ಪ್ರಸ್ತುತ ಖಾತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show

# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ನಿಂದ ನಿರ್ಗಮಿಸಿ
azd auth logout

# Azure CLI ನಿಂದ ನಿರ್ಗಮಿಸಿ
az logout
```

### ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭ
```bash
# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list

# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ಪ್ರಸ್ತುತ ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಪ್ರಾರಂಭಿಸಿ
azd init .

# ಕಸ್ಟಮ್ ಹೆಸರಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ಮೂಲ ನಿಯೋಜನೆ ಕಮಾಂಡ್‌ಗಳು

### ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಎಲ್ಲವನ್ನೂ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ (ಪ್ರೊವಿಷನ್ + ಡಿಪ್ಲಾಯ್)
azd up

# ದೃಢೀಕರಣ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up --confirm-with-no-prompt

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರಕ್ಕೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up --parameter location=westus2
```

### ಕೇವಲ ಮೂಲಸೌಕರ್ಯ
```bash
# Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸಿ
azd provision

# 🧪 ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವಾವಲೋಕನ ಮಾಡಿ
azd provision --preview
# ಯಾವ ಸಂಪನ್ಮೂಲಗಳು ರಚಿಸಲ್ಪಡುವುದು/ತಿದ್ದುಪಡಿಸಲ್ಪಡುವುದು/ಅಳಿಸಲ್ಪಡುವುದು ಎಂಬುದರ ಡ್ರೈ-ರನ್ ವೀಕ್ಷಣೆಯನ್ನು ತೋರಿಸುತ್ತದೆ
# Similar to 'terraform plan' or 'bicep what-if' - ಚಲಾಯಿಸಲು ಸುರಕ್ಷಿತ, ಯಾವುದೇ ಬದಲಾವಣೆ ಅನ್ವಯಿಸಲಾಗುವುದಿಲ್ಲ
```

### ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆ들을 ನಿಯೋಜಿಸಿ
azd deploy --all
```

### ನಿರ್ಮಿಸಿ ಮತ್ತು ಪ್ಯಾಕೇಜ್
```bash
# ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ
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

# ಪರಿಸರದ ಸ್ಥಿತಿಯನ್ನು ನವೀಕರಿಸಿ
azd env refresh
```

### ಪರಿಸರ ಚರಗಳು
```bash
# ಪರಿಸರ ಚರವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ಪರಿಸರ ಚರವನ್ನು ಪಡೆಯಿರಿ
azd env get API_KEY

# ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env get-values

# ಪರಿಸರ ಚರವನ್ನು ತೆಗೆದುಹಾಕಿ
azd env unset DEBUG
```

## ⚙️ ಸಂರಚನೆ ಕಮಾಂಡ್‌ಗಳು

### ಜಾಗತಿಕ ಸಂರಚನೆ
```bash
# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd config list

# ಜಾಗತಿಕ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ಸಂರಚನೆಯನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location

# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಮರುಹೊಂದಿಸಿ
azd config reset
```

### ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ
```bash
# azure.yaml ಅನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd config validate

# ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ
azd show

# ಸೇವಾ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆದುಕೊಳ್ಳಿ
azd show --output json
```

## 📊 ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್

### ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
```bash
# Azure ಪೋರ್ಟಲ್ ನಿಗಾವೀಕ್ಷಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor

# Application Insights ನ ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್ ತೆರೆಯಿರಿ
azd monitor --live

# Application Insights ನ ಲಾಗ್‌ಗಳ ಬ್ಲೇಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# Application Insights ನ ಅವಲೋಕನ ತೆರೆಯಿರಿ
azd monitor --overview
```

### ಕಂಟೈನರ್ ಲಾಗ್‌ಗಳ ವೀಕ್ಷಣೆ
```bash
# Azure CLI ಮೂಲಕ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (Container Apps ಗಾಗಿ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ನೇರ ಸಮಯದಲ್ಲಿ ಲಾಗ್‌ಗಳನ್ನು ಅನುಸರಿಸಿ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ಪೋರ್ಟಲ್‌ನಿಂದ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs
```

### ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್ ಕ್ವೆರಿ‌ಗಳು
```bash
# Azure ಪೋರ್ಟಲ್ ಮೂಲಕ ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್‌ಗೆ ಪ್ರವೇಶಿಸಿ
azd monitor --logs

# Azure CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಶೋಧಿಸಿ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ನಿರ್ವಹಣಾ ಕಮಾಂಡ್‌ಗಳು

### ಶುದ್ಧೀಕರಣ
```bash
# ಎಲ್ಲಾ ಅಝುರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆಗೆದುಹಾಕಿ
azd down

# ಖಚಿತೀಕರಣವಿಲ್ಲದೆ ಬಲವಂತವಾಗಿ ಅಳಿಸಿ
azd down --force

# ಸಾಫ್ಟ್-ಡಿಲೀಟ್ ಆಗಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ
azd down --purge

# ಸಂಪೂರ್ಣ ಶುದ್ಧೀಕರಣ
azd down --force --purge
```

### ನವೀಕರಣಗಳು
```bash
# azd ನ ನವೀಕರಣಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# ಪ್ರಸ್ತುತ ಆವೃತ್ತಿಯನ್ನು ಪಡೆಯಿರಿ
azd version

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config list
```

## 🔧 ಉನ್ನತ ಕಮಾಂಡ್‌ಗಳು

### ಪೈಪ್‌ಲೈನ್ ಮತ್ತು CI/CD
```bash
# GitHub Actions ಅನ್ನು ಸಂರಚಿಸಿ
azd pipeline config

# Azure DevOps ಅನ್ನು ಸಂರಚಿಸಿ
azd pipeline config --provider azdo

# ಪೈಪ್‌ಲೈನ್ ಸಂರಚನೆಯನ್ನು ತೋರಿಸಿ
azd pipeline show
```

### ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆ
```bash
# ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# 🧪 ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪೂರ್ವದೃಶ್ಯ ಮತ್ತು ಯೋಜನೆ
azd provision --preview
# ಡಿಪ್ಲಾಯ್ ಮಾಡದೆ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒದಗಿಸುವಿಕೆಯನ್ನು ಅನುಕರಿಸುತ್ತದೆ
# Bicep/Terraform ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ ತೋರಿಸುತ್ತದೆ:
# - ಸೇರಿಸಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಹಸಿರು +)
# - ತಿದ್ದುಪಡಿ ಮಾಡಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಹಳದಿ ~)
# - ಅಳಿಸಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಕೆಂಪು -)
# ಚಲಾಯಿಸಲು ಸುರಕ್ಷಿತ - Azure ಪರಿಸರದಲ್ಲಿ ಯಾವುದೇ ನೈಜ ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಲಾಗುವುದಿಲ್ಲ

# azure.yaml ನಿಂದ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಸಂಶ್ಲೇಷಿಸಿ
azd infra synth
```

### ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿ
```bash
# ಪ್ರಾಜೆಕ್ಟ್ ಸ್ಥಿತಿ ಮತ್ತು ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ತೋರಿಸಿ
azd show

# ವಿಸ್ತೃತ ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿಯನ್ನು JSON ರೂಪದಲ್ಲಿ ತೋರಿಸಿ
azd show --output json

# ಸೇವೆಯ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show --output json | jq '.services'
```

## 🤖 AI ಮತ್ತು ವಿಸ್ತರಣೆ ಕಮಾಂಡ್‌ಗಳು

### AZD ವಿಸ್ತರಣೆಗಳು
```bash
# ಎಲ್ಲಾ ಲಭ್ಯವಿರುವ ವಿಸ್ತರಣೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ (AI ಸಹಿತ)
azd extension list

# Foundry ಏಜೆಂಟ್‌ಗಳು ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.agents

# ಫೈನ್-ಟ್ಯೂನಿಂಗ್ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.models

# ಸ್ಥಾಪಿಸಿದ ಎಲ್ಲಾ ವಿಸ್ತರಣೆಗಳನ್ನು ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ
azd extension upgrade --all
```

### AI ಏಜೆಂಟ್ ಕಮಾಂಡ್‌ಗಳು
```bash
# ಮ್ಯಾನಿಫೆಸ್ಟ್‌ನಿಂದ ಏಜೆಂಟ್ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd ai agent init -m <manifest-path-or-uri>

# ನಿರ್ದಿಷ್ಟ Foundry ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಗುರಿಯಾಗಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ಏಜೆಂಟ್ ಮೂಲ ಡೈರೆಕ್ಟರಿಯನ್ನು ಸೂಚಿಸಿ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ಹೋಸ್ಟಿಂಗ್ ಗುರಿಯನ್ನು ಆಯ್ಕೆ ಮಾಡಿ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP ಸರ್ವರ್ (ಅಲ್ಫಾ)
```bash
# ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್‌ಗಾಗಿ MCP ಸರ್ವರ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd mcp start

# MCP ಕಾರ್ಯಾಚರಣೆಗಳಿಗಾಗಿ ಉಪಕರಣ ಅನುಮತಿಯನ್ನು ನಿರ್ವಹಿಸಿ
azd mcp consent
```

### ಮೂಲಸೌಕರ್ಯ ತಯಾರಿಕೆ
```bash
# ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ವ್ಯಾಖ್ಯಾನದಿಂದ IaC ಫೈಲ್‌ಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# azure.yamlನಿಂದ ಮೂಲಸೌಕರ್ಯವನ್ನು ಸಂಶ್ಲೇಷಿಸಿ
azd infra synth
```

---

## 🎯 ತ್ವರಿತ ವರ್ಕ್‌ಫ್ಲೋಗಳು

### ಅಭಿವೃದ್ಧಿ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಹೊಸ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
cd my-project

# ಅಭಿವೃದ್ಧಿ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd env new dev
azd up

# ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮತ್ತೆ ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರೀಕ್ಷಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --live
```

### ಬಹು-ಪರಿಸರ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಪರಿಸರಗಳನ್ನು ಸ್ಥಾಪಿಸಿ
azd env new dev
azd env new staging  
azd env new production

# ಡೆವ್‌ಗೆ ನಿಯೋಜಿಸಿ
azd env select dev
azd up

# ಟೆಸ್ಟ್ ಮಾಡಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್‌ಗೆ ವರ್ಗಾಯಿಸಿ
azd env select staging
azd up

# ಉತ್ಪಾದನೆಗೆ ನಿಯೋಜಿಸಿ
azd env select production
azd up
```

### ತೊಂದರೆ ಪರಿಹಾರ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಡಿಬಗ್ ಮೋಡ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true

# ಅಳವಡಿಕೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd config list

# ಲಾಗ್‌ಗಳಿಗಾಗಿ ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# ಸಂಪನ್ಮೂಲ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

## 🔍 ಡಿಬಗ್ಗಿಂಗ್ ಕಮಾಂಡ್‌ಗಳು

### ಡಿಬಗ್ ಮಾಹಿತಿ
```bash
# ಡೆಬಗ್ ಔಟ್‌ಪುಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug

# ಸ್ಪಷ್ಟವಾದ ಔಟ್‌ಪುಟ್‌ಗಾಗಿ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DISABLE_TELEMETRY=true

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd config list

# ಪ್ರಮಾಣೀಕರಣ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಟೆಂಪ್ಲೇಟ್ ಡಿಬಗ್ಗಿಂಗ್
```bash
# ವಿವರಗಳೊಂದಿಗೆ ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd template list --output json

# ಟೆಂಪ್ಲೇಟಿನ ಮಾಹಿತಿ ತೋರಿಸಿ
azd template show <template-name>

# ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು ಮಾನ್ಯಗೊಳಿಸಿ
azd template validate <template-name>
```

## 📁 ಕಡತ ಮತ್ತು ಡೈರೆಕ್ಟರಿ ಕಮಾಂಡ್‌ಗಳು

### ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ
```bash
# ಪ್ರಸ್ತುತ ಡೈರೆಕ್ಟರಿಯ ರಚನೆಯನ್ನು ತೋರಿಸಿ
tree /f  # ವಿಂಡೋಸ್
find . -type f  # ಲಿನಕ್ಸ್/macOS

# azd ಪ್ರಾಜೆಕ್ಟ್‌ನ ಮೂಲ ಡೈರೆಕ್ಟರಿಗೆ ಹೋಗಿ
cd $(azd root)

# azd ಸಂರಚನಾ ಡೈರೆಕ್ಟರಿಯನ್ನು ತೋರಿಸಿ
echo $AZD_CONFIG_DIR  # ಸಾಮಾನ್ಯವಾಗಿ ~/.azd
```

## 🎨 ಔಟ್‌ಪುಟ್ ಫಾರ್ಮ್ಯಾಟಿಂಗ್

### JSON ಔಟ್‌ಪುಟ್
```bash
# ಸ್ಕ್ರಿಪ್ಟಿಂಗ್‌ಗಾಗಿ JSON ಔಟ್ಪುಟ್ ಪಡೆಯಿರಿ
azd show --output json
azd env list --output json
azd config list --output json

# jq ಬಳಸಿ ವಿಶ್ಲೇಷಿಸಿ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ಟೇಬಲ್ ಔಟ್‌ಪುಟ್
```bash
# ಕೋಷ್ಟಕದಂತೆ ಸ್ವರೂಪಗೊಳಿಸಿ
azd env list --output table

# ಹೊಂದಲಾಗಿರುವ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
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

### ನಿಯೋಜನೆ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# ವಿತರಿಸುವ ಮೊದಲು ಪರಿಶೀಲನೆ
azd show
azd provision --preview  # ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವಾವಲೋಕನ ಮಾಡಿ
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

### ಸಂಪನ್ಮೂಲ ಶುದ್ಧೀಕರಣ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# ಹಳೆಯ ಪರಿಸರಗಳನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
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

# ಅನ್ವಯಿಕೆ ಸಂರಚನೆ
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ತುರ್ತು ಕಮಾಂಡ್‌ಗಳು

### ತ್ವರಿತ ಪರಿಹಾರಗಳು
```bash
# ಪ್ರಮಾಣೀಕರಣವನ್ನು ಮರುಹೊಂದಿಸಿ
az account clear
az login

# ಪರಿಸರವನ್ನು ಬಲವಂತವಾಗಿ ನವೀಕರಿಸಿ
azd env refresh

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ಮತ್ತೆ ನಿಯೋಜಿಸಿ
azd deploy

# ನಿಯೋಜನೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

### ಪುನರ್‌ಸ್ಥಾಪನೆ ಕಮಾಂಡ್‌ಗಳು
```bash
# ವಿಫಲವಾದ ನಿಯೋಜನೆಯಿಂದ ಪುನರುದ್ದಾರಿಸು - ಸ್ವಚ್ಛಗೊಳಿಸಿ ಮತ್ತು ಮರು-ನಿಯೋಜಿಸಿ
azd down --force --purge
azd up

# ಮಾತ್ರ ಮೂಲಸೌಕರ್ಯವನ್ನು ಮರು ಒದಗಿಸಿ
azd provision

# ಮಾತ್ರ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮರು-ನಿಯೋಜಿಸಿ
azd deploy
```

## 💡 ವೃತ್ತಿಪರ ಸಲಹೆಗಳು

### ವೇಗವಾದ ವರ್ಕ್‌ಫ್ಲೋಗಾಗಿ ಅಲಿಯಾಸ್ಗಳು
```bash
# ನಿಮ್ಮ .bashrc ಅಥವಾ .zshrc ಗೆ ಸೇರಿಸಿ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ಫಂಕ್ಷನ್ ಶಾರ್ಟ್‌ಕಟ್‌ಗಳು
```bash
# ತ್ವರಿತ ಪರಿಸರ ಬದಲಾವಣೆ
azd-env() {
    azd env select $1 && azd show
}

# ನಿಗಾವಣೆಯೊಂದಿಗೆ ತ್ವರಿತ ಅಳವಡಿಕೆ
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

## 📖 ಸಹಾಯ ಮತ್ತು ಡಾಕ್ಯುಮೆಂಟೇಶನ್

### ಸಹಾಯ ಪಡೆಯುವುದು
```bash
# ಸಾಮಾನ್ಯ ಸಹಾಯ
azd --help
azd help

# ಕಮಾಂಡ್-ನಿರ್ದಿಷ್ಟ ಸಹಾಯ
azd up --help
azd env --help
azd config --help

# ಆವೃತ್ತಿ ಮತ್ತು ನಿರ್ಮಾಣ ಮಾಹಿತಿ ತೋರಿಸಿ
azd version
azd version --output json
```

### ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಲಿಂಕ್‌ಗಳು
```bash
# ದಾಖಲೆಗಳನ್ನು ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಿರಿ
azd docs

# ಟೆಂಪ್ಲೇಟಿನ ದಾಖಲೆಗಳನ್ನು ತೋರಿಸಿ
azd template show <template-name> --docs
```

---

**ಸಲಹೆ**: ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಿ ಮತ್ತು ನಿಮ್ಮ ಅಗತ್ಯವಿರುವ ಕಮಾಂಡ್‌ಗಳನ್ನು ತ್ವರಿತವಾಗಿ ಹುಡುಕಲು `Ctrl+F` ಬಳಸಿ!

---

**ನವಿಗೇಶನ್**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [ಶಬ್ದಕೋಶ](glossary.md)

---

> **💡 ನಿಮ್ಮ ಎಡಿಟರ್‌ನಲ್ಲಿ Azure ಕಮಾಂಡ್ ಸಹಾಯ ಬೇಕಾ?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ಅನ್ನು `npx skills add microsoft/github-copilot-for-azure` ಬಳಸಿ — AI, Foundry, ನಿಯೋಜನೆ, ದೋಷನಿರ್ಣಯ ಮತ್ತು ಇನ್ನಷ್ಟು ಕಾರ್ಯಗಳಿಗಾಗಿ 37 ನೈಪುಣ್ಯಗಳು.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ**:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳಿರಬಹುದು. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜಸ್ಯತೆಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಜವಾಬ್ದಾರಿಯಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->