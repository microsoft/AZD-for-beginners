# ಆಜ್ಞೆಗಳ ಚೀಟ್ ಶೀಟ್ - ಅಗತ್ಯ AZD ಆಜ್ಞೆಗಳು

**ಎಲ್ಲಾ ಅಧ್ಯಾಯಗಳ ತ್ವರಿತ ಸಂಕ್ಷಿಪ್ತ ಮಾಹಿತಿ**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../README.md)
- **📖 ತ್ವರಿತ ಪ್ರಾರಂಭ**: [ಅಧ್ಯಾಯ 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ಆಜ್ಞೆಗಳು**: [ಅಧ್ಯಾಯ 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ಉನ್ನತ**: [ಅಧ್ಯಾಯ 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಚೀಟ್ ಶೀಟ್ ಪ್ರಾಮಾಣಿಕವಾಗಿ ಹೆಚ್ಚು ಬಳಸಲ್ಪಡುವ Azure Developer CLI ಆಜ್ಞೆಗಳ ತ್ವರಿತ ಉಲ್ಲೇಖವನ್ನು ನೀಡುತ್ತದೆ,ವರ್ಗೀಕರಣದ ಮೂಲಕ ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳೊಂದಿಗೆ ವಿಂಗಡಿಸಲಾಗಿದೆ. azd ಪ್ರೊಜೆಕ್ಟ್‌ಗಳ ಅಭಿವೃದ್ಧಿ, ಡಿಬಗಿಂಗ್ ಮತ್ತು ದೈನಂದಿನ ಕಾರ್ಯಾಚರಣೆಗಳ ಸಂದರ್ಭದಲ್ಲಿ ತ್ವರಿತ ಉಲ್ಲೇಖಗಳಿಗಾಗಿ ಇದು ಸೂಕ್ತವಾಗಿದೆ.

## ಕಲಿಕೆಯ ಉದ್ದೇಶಗಳು

ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ಬಳಸಿ, ನೀವು:
- ಅಗತ್ಯ Azure Developer CLI ಆಜ್ಞೆಗಳು ಮತ್ತು ಸಿಂಟ್ಯಾಕ್ಸ್‌ಗೆ ತಕ್ಷಣ ಪ್ರವೇಶವನ್ನು ಹೊಂದಲಿದ್ದೀರಿ
- ಆಜ್ಞೆಗಳ ಸಂಘಟನೆ ಅನ್ನು ಕಾರ್ಯಾತ್ಮಕ ವರ್ಗಗಳು ಮತ್ತು ಬಳಕೆ ಪ್ರಕರಣಗಳ ಮೂಲಕ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿರಿ
- ಸಾಮಾನ್ಯ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ಸಂದರ್ಭಗಳಿಗಾಗಿ ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳನ್ನು ಉಲ್ಲೇಖಿಸಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ
- ತ್ವರಿತ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕಾಗಿ ಡಿಬಗ್ ಆಜ್ಞೆಗಳಿಗೆ ಪ್ರವೇಶ ಹೊಂದಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ
- ಉನ್ನತ ಸಂರಚನೆ ಮತ್ತು ಕಸ್ಟಮೈಜೆಷನ್ ಆಯ್ಕೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಕಂಡುಹಿಡಿಯಲು ಸಹಾಯವಾಗುತ್ತದೆ
- ಪರಿಸರ ನಿರ್ವಹಣೆ ಮತ್ತು ಬಹು-ಪರಿಸರ ವರ್ಕ್‌ಫ್ಲೋ ಆಜ್ಞೆಗಳನ್ನು ಸುಲಭವಾಗಿ ಕಂಡುಹಿಡಿಯಬಹುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಜಾಸ್ತಿ ಉಲ್ಲೇಖದೊಂದಿಗೆ ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ನಿಯಮಿತವಾಗಿ ಬಳಸಿದರೆ, ನೀವು:
- ಸಂಪೂರ್ಣ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ನೋಡದೇ ಯಾವುದೇ azd ಆಜ್ಞೆಗಳನ್ನು ಆತ್ಮವಿಶ್ವಾಸದಿಂದ ರನ್ ಮಾಡಬಲ್ಲಿರಿ
- ಸೂಕ್ತ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಆಜ್ಞೆಗಳನ್ನು ಬಳಸಿ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ತ್ವರಿತವಾಗಿ ಪರಿಹರಿಸಬಲ್ಲಿರಿ
- ಬಹು-ಪರಿಸರಗಳು ಮತ್ತು ನಿಯೋಜನೆ ದೃಶ್ಯಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನಿರ್ವಹಿಸಬಹುದೆ
- ಅಗತ್ಯವಿರುವಂತೆ ಉನ್ನತ azd ವೈಶಿಷ್ಟ್ಯಗಳು ಮತ್ತು ಸಂರಚನೆ ಆಯ್ಕೆಗಳನ್ನು ಅನ್ವಯಿಸಬಹುದೆ
- ಕ್ರಮಬದ್ದ ಆಜ್ಞೆ ಸರಣಿಗಳನ್ನು ಬಳಸಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡಬಹುದೆ
- azd ಶಾರ್ಟ್‌ಕಟ್‌ಗಳು ಮತ್ತು ಆಯ್ಕೆಗಳ ಪರಿಣಾಮಕಾರಿ ಬಳಕೆಯಿಂದ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಅופטಿಮೈಸ್ ಮಾಡಬಹುದೆ

## ಪ್ರಾರಂಭಿಕ ಆಜ್ಞೆಗಳು

### ಪ್ರಮಾಣೀಕರಣ
```bash
# AZD ಮೂಲಕ Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# Azure CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ (AZD ಇದನ್ನು ಒಳಗಾಗಿಯೇ ಬಳಸುತ್ತದೆ)
az login

# ಪ್ರಸ್ತುತ ಖಾತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show

# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ನಿಂದ ಲಾಗೌಟ್ ಮಾಡಿ
azd auth logout

# Azure CLI ನಿಂದ ಲಾಗೌಟ್ ಮಾಡಿ
az logout
```

### ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭ
```bash
# ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ
azd template list

# ಟೆಂಪ್ಲೇಟಿನಿಂದ ಆರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# ಪ್ರಸ್ತುತ ಡೈರೆಕ್ಟರಿಯಲ್ಲಿ ಆರಂಭಿಸಿ
azd init .

# ಕಸ್ಟಮ್ ಹೆಸರಿನಿಂದ ಆರಂಭಿಸಿ
azd init --template todo-nodejs-mongo my-awesome-app
```

## ಮೂಲ ನಿಯೋಜನೆ ಆಜ್ಞೆಗಳು

### ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ (ಸಿದ್ಧಗೊಳಿಸುವಿಕೆ + ನಿಯೋಜನೆ)
azd up

# ದೃಢೀಕರಣ ಪ್ರಾಂಪ್ಟ್‌ಗಳು ನಿಷ್ಕ್ರಿಯವಾಗಿರುವಂತೆಯೇ ನಿಯೋಜಿಸಿ
azd up --confirm-with-no-prompt

# ನಿಗದಿತ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --parameter location=westus2
```

### ಕೇವಲ ಮೂಲಸೌಕರ್ಯ
```bash
# Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸಿ
azd provision

# 🧪 ಮೂಲಸೌಕರ್ಯದ ಬದಲಾವಣೆಗಳ ಪೂರ್ವಾವಲೋಕನ
azd provision --preview
# ಯಾವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಲಾಗುವುದು, ತಿದ್ದುಪಡಿಸಲಾಗುವುದು ಅಥವಾ ಅಳಿಸಲಾಗುವುದು ಎಂಬುದರ ಡ್ರೈ-ರನ್ ವೀಕ್ಷಣೆಯನ್ನು ತೋರಿಸುತ್ತದೆ
# 'terraform plan' ಅಥವಾ 'bicep what-if' ನಂತೆ — ರನ್ ಮಾಡುವುದು ಸುರಕ್ಷಿತ, ಯಾವುದೇ ಬದಲಾವಣೆಗಳು ಅನ್ವಯಿಸಲಾಗುವುದಿಲ್ಲ
```

### ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --all
```

### ನಿರ್ಮಾಣ ಮತ್ತು ಪ್ಯಾಕೇಜ್
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಅವಲಂಬನೆಗಳನ್ನು ಮರುಸ್ಥಾಪಿಸಿ (ಡೌನ್ಲೋಡ್ ಮಾಡಿ)
azd restore

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ಮರುಸ್ಥಾಪಿಸಿ
azd restore --service api

# ನಿಯೋಜಿಸದೆ ನಿಯೋಜಿಸಲು ಯೋಗ್ಯವಾದ ಆರ್ಟಿಫ್ಯಾಕ್ಟ್ ರಚಿಸಿ
azd package

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿರ್ಮಿಸಿ
azd package --service api
```

> **`azd restore`** ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್‌ನ ಅವಲಂಬನೆಗಳನ್ನು ಡೌನ್ಲೋಡ್ ಮಾಡುತ್ತದೆ (npm, pip, NuGet, Maven, ಇತ್ಯಾದಿ). ಇದು `azd package` ಮತ್ತು `azd deploy` دوران ಸ್ವಯಂಚಾಲಿತವಾಗಿ ನಡೆಯುತ್ತದೆ, ಆದ್ದರಿಂದ ನೀವು ಇದನ್ನು ಬಹಳವೊಮ್ಮೆ ನೇರವಾಗಿ ಕರೆದುಕೊಳ್ಳಬೇಕಾಗಿಲ್ಲ — CI ಕ್ಯಾಶೆನ್ನು ತಾಪಮಾನಗೊಳಿಸಲು ಅಥವಾ ನಂತರ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಕೆಲಸ ಮಾಡಲು ಮುಂಚಿತವಾಗಿ ಅವಲಂಬನೆಗಳನ್ನು ಪಡೆಯಲು ಅದನ್ನು ಕೈಯಿಂದ ರನ್ ಮಾಡಿ.

> **`azd package`** ನಿಯೋಜನಕಾರ್ಯಾರ್ಥಿ ಆರ್ಟಿಫ್ಯಾಕ್ಟ್ (ಕಂಟೈನರ್ ಇಮೇಜ್ ಅಥವಾ zip) ಅನ್ನು Azure ಗೆ ಪುಷ್ ಮಾಡದೆ ಕಟ್ಟುತ್ತದೆ. ಬೆಳವಣಿಗೆ ಯಶಸ್ವಿಯಾಗಿದೆ ಎಂದು ಮಾನ್ಯಪಡಿಸಲು, ಔಟ್‌ಪುಟ್ ಅನ್ನು ಪರಿಶೀಲಿಸಲು ಅಥವಾ ಬೇರೆ ಪ್ರಕ್ರಿಯೆ ನಂತರ ನಿಯೋಜಿಸುವ ಮಾಡುವಾ ಆರ್ಥಿಕಾರ್ಟ್ ಉತ್ಪಾದಿಸಲು ಇದನ್ನು ಒಬ್ಬಅರ್‍ಥವಾಗಿ ಬಳಸಿ. `azd deploy` ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪ್ಯಾಕೇಜ್ ಮಾಡುತ್ತದೆ, ಆದ್ದರಿಂದ ನೀವು ನಿಯೋಜಿಸುವದೆ ಇಲ್ಲದೆ ಮಾತ್ರ ಆರ್ಟಿಫ್ಯಾಕ್ಟ್ ಬೇಕಾದರೆ ಮಾತ್ರ `azd package` ಬೇಕು.

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

# ಲಭ್ಯವಿರುವ ಪರಿಸರಗಳನ್ನು ತೋರಿಸಿ
azd env list

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

## ⚙️ ಸಂರಚನಾ ಆಜ್ಞೆಗಳು

### ಜಾಗತಿಕ ಸಂರಚನೆ
```bash
# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd config show

# ಜಾಗತಿಕ ಪೂರ್ವನಿಯೋಜಿತ ಮೌಲ್ಯಗಳನ್ನು ಹೊಂದಿಸಿ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ಸಂರಚನೆಯನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location

# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಮರುಸ್ಥಾಪಿಸಿ
azd config reset
```

### ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ
```bash
# azure.yaml ಅನ್ನು ಪರಿಶೀಲಿಸಿ
azd config validate

# ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ
azd show

# ಸೇವೆ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show --output json
```

## 📊 ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್

### ಮೇಲ್ವಿಚಾರಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
```bash
# Azure ಪೋರ್ಟಲ್ ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor

# Application Insights ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್ ತೆರೆಯಿರಿ
azd monitor --live

# Application Insights ಲಾಗ್ಸ್ ಬ್ಲೇಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# Application Insights ಅವಲೋಕನ ತೆರೆಯಿರಿ
azd monitor --overview
```

### ಕಂಟೈನರ್ ಲಾಗ್ ಗಳ ವೀಕ್ಷಣೆ
```bash
# Azure CLI ಮೂಲಕ ಲಾಗ್ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (Container Apps ಗಾಗಿ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ಲಾಗ್ಗಳನ್ನು ನೇರ ಸಮಯದಲ್ಲಿ ಅನುಸರಿಸಿ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure ಪೋರ್ಟಲ್‌ನಿಂದ ಲಾಗ್ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs
```

### ಲಾಗ್ ಅನಲಿಟಿಕ್ಸ್ ಕ್ವೆರಿಗಳು
```bash
# Azure ಪೋರ್ಟಲ್ ಮೂಲಕ ಲಾಗ್ ಅನಾಲಿಟಿಕ್ಸ್‌ಗೆ ಪ್ರವೇಶಿಸಿ
azd monitor --logs

# Azure CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಕ್ವೇರಿ ಮಾಡಿ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ನಿರ್ವಹಣಾ ಆಜ್ಞೆಗಳು

### ಸ್ವಚ್ಛತಾ ಕಾರ್ಯಗಳು
```bash
# ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆಗೆದುಹಾಕಿ
azd down

# ದೃಢೀಕರಣವಿಲ್ಲದೆ ಬಲವಂತವಾಗಿ ಅಳಿಸಿ
azd down --force

# ಸಾಫ್ಟ್-ಅಳಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸಿ
azd down --purge

# ಪೂರ್ಣ ಸ್ವಚ್ಛತೆ
azd down --force --purge
```

### ಅಪ್‌ಡೇಟ್ಗಳು
```bash
# azd ನ ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
azd version

# ಪ್ರಸ್ತುತ ಆವೃತ್ತಿಯನ್ನು ಪಡೆಯಿರಿ
azd version

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config show
```

## 🔧 ಉನ್ನತ ಆಜ್ಞೆಗಳು

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
# ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# 🧪 ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪೂರ್ವದೃಷ್ಟಿ ಮತ್ತು ಯೋಜನೆ
azd provision --preview
# ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದಿಲ್ಲದೆ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಒದಗಿಕೆಯನ್ನು ಅನುಕರಿಸುತ್ತದೆ
# Bicep/Terraform ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಮತ್ತು ತೋರಿಸುತ್ತದೆ:
# - ಸೇರಿಸಲಾಗಲಿರುವ ಸಂಪನ್ಮೂಲಗಳು (ಹಸಿರು +)
# - ಬದಲಾಯಿಸಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಹಳದಿ ~)
# - ಅಳಿಸಲಾಗಲಿರುವ ಸಂಪನ್ಮೂಲಗಳು (ಕೆಂಪು -)
# ಚಾಲಿಸಲು ಸುರಕ್ಷಿತ - Azure ಪರಿಸರಕ್ಕೆ ಯಾವುದೇ ನಿಜವಾದ ಬದಲಾವಣೆಗಳು ಮಾಡಲಾಗುವುದಿಲ್ಲ

# azure.yaml ನಿಂದ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಸಂಶ್ಲೇಷಿಸಿ
azd infra synth
```

### ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿ
```bash
# ಪ್ರಾಜೆಕ್ಟಿನ ಸ್ಥಿತಿ ಮತ್ತು ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ತೋರಿಸಿ
azd show

# ವಿಸ್ತೃತ ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿ JSON ಆಗಿ ತೋರಿಸಿ
azd show --output json

# ಸೇವಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show --output json | jq '.services'
```

## 🤖 AI ಮತ್ತು ವಿಸ್ತರಣಾ ಆಜ್ಞೆಗಳು

### AZD ವಿಸ್ತರಣೆಗಳು
```bash
# ಎಲ್ಲಾ ಲಭ್ಯವಿರುವ ವಿಸ್ತರಣೆಗಳನ್ನು (AI ಸೇರಿ) ಪಟ್ಟಿ ಮಾಡಿ
azd extension list

# Foundry ಏಜೆಂಟ್‌ಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.agents

# ಏಜೆಂಟ್ ಕೌಶಲ್ಯಗಳ ವಿಸ್ತರಣೆಯನ್ನು (ಪ್ರಿವ್ಯೂ) ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.skills

# Foundry ಸಂಪರ್ಕಗಳ ವಿಸ್ತರಣೆಯನ್ನು (ಪ್ರಿವ್ಯೂ) ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.connections

# ಫೈನ್-ಟ್ಯೂನಿಂಗ್ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.models

# ಸ್ಥಾಪಿಸಿದ ಎಲ್ಲಾ ವಿಸ್ತರಣೆಗಳನ್ನು ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ
azd extension upgrade --all
```

### AI ಏಜೆಂಟ್ ಆಜ್ಞೆಗಳು
```bash
# ಮ್ಯಾನುಫೆಸ್ಟ್‌ನಿಂದ ಏಜೆಂಟ್ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd ai agent init -m <manifest-path-or-uri>

# ನಿರ್ದಿಷ್ಟ Foundry ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಗುರಿಮಾಡಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ಏಜೆಂಟ್ ಮೂಲ ಡೈರೆಕ್ಟರಿಯನ್ನು ನಿರ್ದಿಷ್ಟಿಸಿ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ಹೋಸ್ಟಿಂಗ್ ಗುರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ
azd ai agent init -m agent-manifest.yaml --host containerapp

# ಸ್ಥಾಪಿತ ಏಜೆಂಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ (ವಿಲಂಬ ಮತ್ತು ಮೊದಲ ಬೈಟ್‌ವರೆಗೆ ಸಮಯವನ್ನು ಮುದ್ರಿಸುತ್ತದೆ)
azd ai agent invoke

# ಲೈವ್ ಎಂಡ್‌ಪಾಯಿಂಟ್ ಸಂರಚನೆಯನ್ನು ತೋರಿಸಿ
azd ai agent endpoint show

# ಮೌಲ್ಯಮಾಪನ ಡೇಟಾಸೆಟ್ ಅನ್ನು ರಚಿಸಿ, ನಂತರ ಏಜೆಂಟ್ ಅನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ
azd ai agent eval generate
azd ai agent optimize

# ಕೋಡ್ ಆಧಾರಿತ ಹೋಸ್ಟಡ್ ಏಜೆಂಟ್‌ನ ನಿಯೋಜಿಸಲಾದ ಮೂಲವನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ
azd ai agent code download

# ಒಂದು ಹೋಸ್ಟಡ್ ಏಜೆಂಟ್ ಮತ್ತು ಅದರ ಎಲ್ಲಾ ಆವೃತ್ತಿಗಳನ್ನು ಅಳಿಸಿ (--force ಸಕ್ರಿಯ ಸೆಷನ್‌ಗಳನ್ನು ಅಂತ್ಯಗೊಳಿಸುತ್ತದೆ)
azd ai agent delete --force
```

### MCP ಸರ್ವರ್ (ಆಲ್ಫಾ)
```bash
# ನಿಮ್ಮ ಯೋಜನೆಗಾಗಿ MCP ಸರ್ವರ್ ಪ್ರಾರಂಭಿಸಿ
azd mcp start

# MCP ಕಾರ್ಯಾಚರಣೆಗಳಿಗಾಗಿ ಉಪಕರಣಗಳ ಒಪ್ಪಿಗೆಯನ್ನು ನಿರ್ವಹಿಸಿ
azd copilot consent list
```

### ಮೂಲಸೌಕರ್ಯ ರಚನೆ
```bash
# ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ವ್ಯಾಖ್ಯಾನದಿಂದ IaC ಫೈಲ್‌ಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# azure.yaml ನಿಂದ ಮೂಲಸೌಕರ್ಯವನ್ನು ಸಂಶ್ಲೇಷಿಸಿ
azd infra synth
```

---

## 🎯 ತ್ವರಿತ ವರ್ಕ್‌ಫ್ಲೋಗಳು

### ಅಭಿವೃದ್ಧಿ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಹೊಸ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
cd my-project

# ವಿಕಾಸ ಪರಿಸರಕ್ಕೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd env new dev
azd up

# ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮತ್ತು ಮರುಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd deploy

# ನಿರೀಕ್ಷಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --live
```

### ಬಹು-ಪರಿಸರ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಪರಿಸರಗಳನ್ನು ಸಿದ್ಧಪಡಿಸಿ
azd env new dev
azd env new staging  
azd env new production

# ಅಭಿವೃದ್ಧಿ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd env select dev
azd up

# ಪರೀಕ್ಷಿಸಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್‌ಗೆ ವರ್ಗಾಯಿಸಿ
azd env select staging
azd up

# ಉತ್ಪಾದನಾ ಪರಿಸರಕ್ಕೆ ನಿಯೋಜಿಸಿ
azd env select production
azd up
```

### ಸಮಸ್ಯೆ ಪರಿಹಾರ ವರ್ಕ್‌ಫ್ಲೋ
```bash
# ಡಿಬಗ್ ಮೋಡ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಸಂರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd config show

# ಲಾಗ್‌ಗಳಿಗಾಗಿ ನಿರೀಕ್ಷಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# ಸಂಪನ್ಮೂಲ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

## 🔍 ಡಿಬಗಿಂಗ್ ಆಜ್ಞೆಗಳು

### ಡಿಬಗ್ ಮಾಹಿತಿ
```bash
# ಡಿಬಗ್ ಔಟ್‌ಪುಟ್ ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true
azd <command> --debug

# ಶುದ್ಧವಾದ ಔಟ್‌ಪುಟ್‌ಗಾಗಿ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DISABLE_TELEMETRY=true

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd config show

# ಪ್ರಾಮಾಣೀಕರಣ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಟೆಂಪ್ಲೇಟ್ ಡಿಬಗ್ಗಿಂಗ್
```bash
# ವಿವರಗಳೊಂದಿಗೆ ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd template list --output json

# ಟೆಂಪ್ಲೇಟಿನ ಮಾಹಿತಿ ತೋರಿಸಿ
azd template show <template-name>

# ಟೆಂಪ್ಲೇಟನ್ನು ಆರಂಭಿಸುವ ಮೊದಲು ಮಾನ್ಯಗೊಳಿಸಿ
azd template validate <template-name>
```

## 📁 ಫೈಲ್ ಮತ್ತು ಡೈರೆಕ್ಟರಿ ಆಜ್ಞೆಗಳು

### ಪ್ರಾಜೆಕ್ಟ್-Struktur
```bash
# ಪ್ರಸ್ತುತ ಡೈರೆಕ್ಟರಿಯ ರಚನೆಯನ್ನು ತೋರಿಸಿ
tree /f  # ವಿಂಡೋಸ್
find . -type f  # ಲಿನಕ್ಸ/ಮ್ಯಾಕ್‌ಒಎಸ್

# azd ಯೋಜನೆಯ ಮೂಲಕ್ಕೆ ಹೋಗಿ
cd $(azd root)

# azd ಸಂರಚನಾ ಡೈರೆಕ್ಟರಿಯನ್ನು ತೋರಿಸಿ
echo $AZD_CONFIG_DIR  # ಸಾಮಾನ್ಯವಾಗಿ ~/.azd
```

## 🎨 ಔಟ್‌ಪುಟ್ ಫಾರ್ಮ್ಯಾಟಿಂಗ್

### JSON ಔಟ್‌ಪುಟ್
```bash
# ಸ್ಕ್ರಿಪ್ಟಿಂಗ್‌ಗಾಗಿ JSON ಫಲಿತಾಂಶವನ್ನು ಪಡೆಯಿರಿ
azd show --output json
azd env list --output json
azd config show --output json

# jq ಬಳಸಿ ವಿಶ್ಲೇಷಿಸಿ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ಟೇಬಲ್ ಔಟ್‌ಪುಟ್
```bash
# ಕೋಷ್ಟಕ ರೂಪದಲ್ಲಿ ಸ್ವರೂಪಗೊಳಿಸಿ
azd env list --output table

# ಸ್ಥಾಪಿತ ಸೇವೆಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd show --output json | jq '.services | keys'
```

## 🔧 ಸಾಮಾನ್ಯ ಆಜ್ಞೆಗಳ ಸಂಯೋಜನೆಗಳು

### ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# ತ್ವರಿತ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ
azd show
azd env get-values
azd monitor --logs
```

### ನಿಯೋಜನೆ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು ಪರಿಶೀಲನೆ
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

### ಸಂಪನ್ಮೂಲ ಸ್ವಚ್ಛತಾ ಸ್ಕ್ರಿಪ್ಟ್
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
# ಏಜೂರ್ ಸಂರಚನೆ
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

# ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

### ಪುನರುದ್ದಾರ ಆಜ್ಞೆಗಳು
```bash
# ವಿಫಲವಾದ ನಿಯೋಜನೆಯಿಂದ ಚೇತರಿಸಿಕೊಳ್ಳಿ - ಸ್ವಚ್ಛಗೊಳಿಸಿ ಮತ್ತು ಮರು-ನಿಯೋಜನೆ ಮಾಡಿ
azd down --force --purge
azd up

# ಮಾತ್ರ ಮೂಲಸೌಕರ್ಯವನ್ನು ಮರುವ್ಯವಸ್ಥೆ ಮಾಡಿ
azd provision

# ಮಾತ್ರ ಅಪ್ಲಿಕೇಶನನ್ನು ಮರು-ನಿಯೋಜನೆ ಮಾಡಿ
azd deploy
```

## 💡 ಪ್ರೋ ಸಲಹೆಗಳು

### ವೇಗದ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಾಗಿ ಉಪನಾಮಗಳು
```bash
# ನಿಮ್ಮ .bashrc ಅಥವಾ .zshrc ಗೆ ಸೇರಿಸಿ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ಕಾರ್ಯ ಶಾರ್ಟ್‌ಕಟ್‌ಗಳು
```bash
# ತ್ವರಿತ ಪರಿಸರ ಬದಲಾವಣೆ
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
    azd env get-values
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

### ದಾಖಲೆ ಲಿಂಕ್‌ಗಳು
```bash
# ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ತೆರೆಯಿ
azd docs

# ಟೆಂಪ್ಲೇಟ್ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ತೋರಿಸಿ
azd template show <template-name> --docs
```

---

**ಟಿಪ್**: ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಿ ಮತ್ತು ಅಗತ್ಯವಿರುವ ಆಜ್ಞೆಗಳನ್ನು ತ್ವರಿತವಾಗಿ ಕಂಡುಹಿಡಿಯಲು `Ctrl+F` ಬಳಸಿ!

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಪ್ರಿ‌ಫ್ಲೈಟ್ ಪರಿಶೀಲನೆಗಳು](../docs/pre-deployment/preflight-checks.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಪದಕೋಶ](glossary.md)

---

> **💡 ಸಂಪಾದಕದಲ್ಲಿ Azure ಆಜ್ಞೆಗಳ ಸಹಾಯ ಬೇಕೆ?** ಸ್ಥಾಪಿಸಿ [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ಅನ್ನು `npx skills add microsoft/github-copilot-for-azure` ಮೂಲಕ — AI, Foundry, ನಿಯೋಜನೆ, ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಮತ್ತು ಇನ್ನಷ್ಟುಗಾಗಿ 37 ಸ್ಕಿಲ್ಸ್.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->