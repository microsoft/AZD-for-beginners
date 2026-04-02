# ಆಜ್ ಡಿ ಕಮಾಂಡ್ ಚೀಟ್ ಶೀಟ್ - ಅಗತ್ಯ AZD ಕಮಾಂಡ್‌ಗಳು

**ಎಲ್ಲಾ ಅಧ್ಯಾಯಗಳಿಗಾಗಿ ದ್ರುತ ಉಲ್ಲೇಖ**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆಜ್ ಡಿ ಆರಂಭಿಕರಿಗಾಗಿ](../README.md)
- **📖 ದ್ರুত ಪ್ರಾರಂಭ**: [ಅಧ್ಯಾಯ 1: ಆಧಾರ ಮತ್ತು ದ್ರುತ ಪ್ರಾರಂಭ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ಕಮಾಂಡ್‌ಗಳು**: [ಅಧ್ಯಾಯ 2: AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ಉದ್ಧತ**: [ಅಧ್ಯಾಯ 4: ಕೋಡ್ ರೂಪದಲ್ಲಿ ಮೂಲಸೌಕರ್ಯ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಚೀಟ್ ಶೀಟ್ ಅತ್ಯಂತ ಸಾಮಾನ್ಯವಾಗಿ ಬಳಕೆಯಾಗುವ ಅಜ್ಯುರ್ ಡೆವಲಪರ್ CLI ಕಮಾಂಡ್‌ಗಳಿಗೆ ದ್ರುತ ಉಲ್ಲೇಖವನ್ನು ಒದಗಿಸುತ್ತದೆ, ವರ್ಗಗಳ ಪ್ರಕಾರ ವ್ಯವಸ್ಥಿತವಾಗಿದ್ದು ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳೊಂದಿಗೆ ಇರುತ್ತದೆ.ಆಜ್ ಡಿ ಪ್ರಾಜೆಕ್ಟ್‌ಗಳೊಂದಿಗೆ ಅಭಿವೃದ್ಧಿ, ಸಮಸ್ಯಾ ಪರಿಹಾರ ಮತ್ತು ದೈನಂದಿನ ಕಾರ್ಯಾಚರಣೆಗಳಲ್ಲಿ ದ್ರುತ ಕಂಡುಹಿಡಿಯಲು ಅತ್ಯುತ್ತಮವಾಗಿದೆ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಚೀಟ್ ಶೀಟ್ ಬಳಸಿ, ನೀವು:
- ಅಗತ್ಯ ಅಜ್ಯುರ್ ಡೆವಲಪರ್ CLI ಕಮಾಂಡ್‌ಗಳು ಮತ್ತು ವ್ಯಾಕರಣವನ್ನು ತಕ್ಷಣ ಪ್ರವೇಶಿಸಬಲ್ಲಿರಿ
- ಕಾರ್ಯಾತ್ಮಕ ವರ್ಗೀಕರಣ ಮತ್ತು ಬಳಕೆ ಪ್ರಕರಣಗಳ ಮೂಲಕ ಕಮಾಂಡ್‌ಗಳ ಸಂಘಟನೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಲ್ಲಿರಿ
- ಸಾಮಾನ್ಯ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ದೃಶ್ಯಗಳಿಗಾಗಿ ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳನ್ನು ಉಲ್ಲೇಖಿಸಬಲ್ಲಿರಿ
- ದ್ರುತ ಸಮಸ್ಯೆ ಪರಿಹಾರಕ್ಕೆ ತಿದ್ದುಪಡಿ ನಿಯೋಗ ಕಮಾಂಡ್‌ಗಳನ್ನು ಪ್ರವೇಶಿಸಬಲ್ಲಿರಿ
- ಉದ್ಧತ ಕಾನ್ಫಿಗರೇಷನ್ ಮತ್ತು ಕಸ್ಟಮೈಜೆಷನ್ ಆಯ್ಕೆಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಕಂಡುಹಿಡಿಯಬಲ್ಲಿರಿ
- ಪರಿಸರ ನಿರ್ವಾಹಕರು ಮತ್ತು ಬಹು-ಪರಿಸರ ಕಾರ್ಯಪ್ರವಾಹ ಕಮಾಂಡ್‌ಗಳನ್ನು ಕಂಡುಹಿಡಿಯಬಲ್ಲಿರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ನಿರಂತರವಾಗಿ ಈ ಚೀಟ್ ಶೀಟ್ ಉಲ್ಲೇಖಿಸಿದರೆ, ನೀವು ಈಂತ ಆಗಬಹುದು:
- ಸಂಪೂರ್ಣ ದಾಖಲೆಗಳನ್ನು ಉಲ್ಲೇಖಿಸದೆ ಆತ್ಮವಿಶ್ವಾಸದಿಂದ azd ಕಮಾಂಡ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಲು
- ಸೂಕ್ತ ಡಯಾಗ್ನೋಸ್ಟಿಕ್ ಕಮಾಂಡ್‌ಗಳನ್ನು ಬಳಸಿ ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ವೇಗವಾಗಿ ಪರಿಹರಿಸಲು
- ಬಹುಆಯಾಮದ ಪರಿಸರ ಮತ್ತು ನಿಯೋಜನೆ ದೃಶ್ಯಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ನಿರ್ವಹಿಸಲು
- ಅಗತ್ಯವಿದ್ದರೆ ಅಜ್ ಡಿ ಮಾಡಿದಂತ ಕಲ್ಪನೆಗಳನ್ನು ಮತ್ತು ಸಂರಚನಾ ಆಯ್ಕೆಗಳನ್ನು ಅನ್ವಯಿಸಲು
- ಕ್ರಮಬದ್ಧ ಕಮಾಂಡ್ ಸರಣಿಗಳನ್ನು ಬಳಸಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ತಿದ್ದಲು
- ಅಜ್ ಡಿಯ ದ್ರುತ ಮಾರ್ಗ ಹಾಗೂ ಆಯ್ಕೆಗಳ ಪರಿಣಾಮಕಾರಿತ್ವದ ಮೂಲಕ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಅಧಿಕೃತಗೊಳಿಸಲು

## ಪ್ರಾರಂಭಿಸುವ ಕಮಾಂಡ್‌ಗಳು

### ದೃಢೀಕರಣ
```bash
# AZD ಮೂಲಕ Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# Azure CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ (AZD ಇದನ್ನು ಒಳಗೊಳಿಸುತ್ತದೆ)
az login

# ಪ್ರಸ್ತುತ ಖಾತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show

# ಡೀಫಾಲ್ಟ್ ಸದಸ್ಯತೆಯನ್ನು ಹೊಂದಿಸಿ
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD ಕ್ಕೆ ಲಾಗೌಟ್ ಮಾಡಿ
azd auth logout

# Azure CLI ಗೆ ಲಾಗೌಟ್ ಮಾಡಿ
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

## ಮೇಲ್ಪಟ್ಟ ನಿಯೋಜನೆ ಕಮಾಂಡ್‌ಗಳು

### ಪರಿಪೂರ್ಣ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಎಲ್ಲಾ ವಹಿಸಲು (ಪ್ರೊವಿಷನ್ + ವಹಿಸಿ)
azd up

# ದೃಢೀಕರಣ ಸೂಚನೆಗಳನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ ವಹಿಸಿ
azd up --confirm-with-no-prompt

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರಕ್ಕೆ ವಹಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ವಹಿಸಿ
azd up --parameter location=westus2
```

### ಮೂಲಸೌಕರ್ಯ ಮಾತ್ರ
```bash
# ಅಜ್ಯೂರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ವಿಧಿಸು
azd provision

# 🧪 ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವಾವಲೋಕನ ಮಾಡಿ
azd provision --preview
# ಯಾವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಲಾಗುವುದು/ಸಂಶೋಧಿಸಲಾಗುವುದು/ಅಳಿಸಲಾಗುವುದು ಎಂಬುದರ ಡ್ರೈ-ರನ್ ನೋಟವನ್ನು ತೋರಿಸುತ್ತದೆ
# 'terraform plan' ಅಥವಾ 'bicep what-if' ಗೆ ಸಮಾನ - ಚಾಲನೆ ಮಾಡಲು ಸುರಕ್ಷಿತ, ಯಾವುದೇ ಬದಲಾವಣೆ ಮಾಡಲಾಗುವುದಿಲ್ಲ
```

### ಅಪ್ಲಿಕೇಶನ್ ಮಾತ್ರ
```bash
# ಅನ್ವಯಿಕೆ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --all
```

### ನಿರ್ಮಾಣ ಮತ್ತು ಪ್ಯಾಕೇಜಿಂಗ್
```bash
# ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ರಚಿಸಿ
azd package

# ನಿಶ್ಚಿತ ಸೇವೆಯನ್ನು ನಿರ್ಮಿಸಿ
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

# ಪರಿಸರವನ್ನು ಆರಿಸಿ
azd env select production

# ಲಭ್ಯವಿರುವ ಪರಿಸರಗಳನ್ನು ತೋರಿಸಿ
azd env list

# ಪರಿಸರದ ಸ್ಥಿತಿಯನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ
azd env refresh
```

### ಪರಿಸರ ವೆರಿಯಬಲ್ಸ್
```bash
# ಪರಿಸರ ಚರವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ಪರಿಸರ ಚರವನ್ನು ಪಡೆಯಿರಿ
azd env get API_KEY

# ಎಲ್ಲಾ ಪರಿಸರ ಚರಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd env get-values

# ಪರಿಸರ ಚರವನ್ನು அகற்று
azd env unset DEBUG
```

## ⚙️ ಸಂರಚನಾ ಕಮಾಂಡ್‌ಗಳು

### ಜಾಗತಿಕ ಸಂರಚನೆ
```bash
# ಎಲ್ಲಾ ಸಂರಚನೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd config show

# ಜಾಗತಿಕ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ಸಂರಚನೆಯನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location

# ಎಲ್ಲಾ ಸಂರಚನೆಯನ್ನು ಮರುಹೊಂದಿಸಿ
azd config reset
```

### ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ
```bash
# azure.yaml ಅನ್ನು ಪರಿಶೀಲಿಸಿ
azd config validate

# ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ
azd show

# ಸೇವಾ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆದುಕೊಳ್ಳಿ
azd show --output json
```

## 📊 ನಿಗಾ ಮತ್ತು ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್

### ನಿಗಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್
```bash
# ಅಜೂರ್ ಪೋರ್ಟಲ್ ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor

# ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್ ತೆರೆಯಿರಿ
azd monitor --live

# ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಲಾಗ್ ಬ್ಲೇಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಅವಲೋಕನ ತೆರೆಯಿರಿ
azd monitor --overview
```

### ಕಂಟೈನರ್ ಲಾಗ್ ನೋಡಿ
```bash
# ಆಜೂರ್ CLI ಮೂಲಕ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ (ಕಂಟೇನರ್ ಆ್ಯಪ್ಗಳಿಗಾಗಿ)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ಲಾಗ್‌ಗಳನ್ನು ನೈಜ ಕಾಲದಲ್ಲಿ ಅನುಸರಿಸಿ
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ಆಜೂರ್ ಪೋರ್ಟಲ್‌ನಿಂದ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs
```

### ಲಾಗ್ ಆನಾಲಿಟಿಕ್ಸ್ ಪ್ರಶ್ನೆಗಳು
```bash
# ಆಕ್ಸೆಸ್ ಲಾಗ್ ವಿಶ್ಲೇಷಣೆಗಳನ್ನು ಅಜೂರ್ ಪೋರ್ಟಲ್ ಮೂಲಕ
azd monitor --logs

# ಅಜೂರ್ CLI ಬಳಸಿ ಲಾಗ್‌ಗಳನ್ನು ಪ್ರಶ್ನೆ ಮಾಡಿ
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ನಿರ್ವಹಣಾ ಕಮಾಂಡ್‌ಗಳು

### ಶುಚಿಗೊಳಿಸುವಿಕೆ
```bash
# ಎಲ್ಲಾ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ತೆಗೆದುಹಾಕಿ
azd down

# ದೃಢೀಕರಣವಿಲ್ಲದೆ ಬಲವಂತದ ಅಳಿವು
azd down --force

# ಸಾಫ್ಟ್-ಡಿಲಿಟ್ ಮಾಡಿದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಶುದ್ಧೀಕರಿಸಿ
azd down --purge

# ಸಂಪೂರ್ಣ ಸ್ವಚ್ಚತೆ
azd down --force --purge
```

### ನವೀಕರಣಗಳು
```bash
# azd ನವೀಕರಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
azd version

# ಪ್ರಸ್ತುತ ಸಂಶೋಧನೆ ಪಡೆಯಿರಿ
azd version

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ವೀಕ್ಷಿಸಿ
azd config show
```

## 🔧 ಉದ್ಧತ ಕಮಾಂಡ್‌ಗಳು

### ಪೈಪ್ಲೈನ್ ಮತ್ತು CI/CD
```bash
# GitHub ಕ್ರಿಯೆಗಳ ಸಂರಚನೆ ಮಾಡಿ
azd pipeline config

# ಅಜೂರ್ ಡೆವ್ಓಪ್ಸ್ ಸಂರಚಿಸಿ
azd pipeline config --provider azdo

# ಪೈಪ್‌ಲೈನ್ ಸಂರಚನೆಯನ್ನು ತೋರಿಸಿ
azd pipeline show
```

### ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆ
```bash
# ಮೂಲಸೌಕರ್ಯ ತಳಬಳಕುಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# 🧪 ಮೂಲಸೌಕರ್ಯ ಪೂರ್ವಾವಲೋಕನ ಮತ್ತು ಯೋಜನೆ
azd provision --preview
# ನಿಯೋಜಿಸದೇ ಮೂಲಸೌಕರ್ಯ ಸಂಯೋಜನೆಯನ್ನು ಅನುಕರಿಸುತ್ತದೆ
# Bicep/Terraform ತಳಬಳಕುಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಮತ್ತು ತೋರಿಸಿ:
# - ಸೇರ್ಪಡೆಮಾಡಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಹಸಿರು +)
# - ಬದಲಾವಣೆಮಾಡಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಹಳದಿ ~)
# - ಅಳಿಸಬೇಕಾದ ಸಂಪನ್ಮೂಲಗಳು (ಕೆಂಪು -)
# ಸುರಕ್ಷಿತವಾಗಿ ಚಾಲನೆ ಮಾಡಲು - ಏನೂ ವಾಸ್ತವಿಕ ಬದಲಾವಣೆಗಳು Azure ವಾತಾವರಣದಲ್ಲಿ ಆಗಿಲ್ಲ

# azure.yaml ನಿಂದ ಮೂಲಸೌಕರ್ಯವನ್ನು ಸಂಯೋಜಿಸಿ
azd infra synth
```

### ಪ್ರಾಜೆಕ್ಟ್ ಮಾಹಿತಿ
```bash
# ಯೋಜನೆ ಸ್ಥಿತಿ ಮತ್ತು ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ತೋರಿಸಿ
azd show

# ಅರ್ಜಿ ಮಾಹಿತಿಯನ್ನು JSON ಆಗಿ ವಿವರವಾಗಿ ತೋರಿಸಿ
azd show --output json

# ಸೇವಾ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ
azd show --output json | jq '.services'
```

## 🤖 AI ಮತ್ತು ವಿಸ್ತರಣೆ ಕಮಾಂಡ್‌ಗಳು

### AZD ವಿಸ್ತರಣೆಗಳು
```bash
# ಎಲ್ಲಾ ಲಭ್ಯವಿರುವ ವಿಸ್ತರಣೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ (AI ಸೇರಿ)
azd extension list

# ಫೌಂಡ್ರೀ ಏಜೆಂಟ್‌ಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.agents

# ಫೈನ್-ಟ್ಯೂನಿಂಗ್ ವಿಸ್ತರಣೆ ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.models

# ಎಲ್ಲಾ ಸ್ಥಾಪಿತ ವಿಸ್ತರಣೆಗಳನ್ನು ಅಪ್ಗ್ರೆಡ್ ಮಾಡಿ
azd extension upgrade --all
```

### AI ಏಜೆಂಟ್ ಕಮಾಂಡ್‌ಗಳು
```bash
# ಮ್ಯಾನಿಫೆಸ್ಟ್ ನಿಂದ ಏಜಂಟ್ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಆರಂಭಿಸಿ
azd ai agent init -m <manifest-path-or-uri>

# ನಿಜವಾದ ಫೌಂಡ್ರಿ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಗುರಿಯಾಗಿಡಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ಏಜಂಟ್ ಮೂಲ ಡೈರೆಕ್ಟರಿಯನ್ನು ನಿರ್ದಿಷ್ಟಪಡಿಸಿ
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# ಹೋಸ್ಟಿಂಗ್ ಗುರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP ಸರ್ವರ್ (ಆಲ್ಫಾ)
```bash
# ನಿಮ್ಮ ಯೋಜನೆಗಾಗಿ MCP ಸರ್ವರ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd mcp start

# MCP ಕಾರ್ಯಾಚರಣೆಗಳಿಗೆ ಉಪಕರಣ ಸಮ್ಮತಿ ನಿರ್ವಹಿಸಿ
azd copilot consent list
```

### ಮೂಲಸೌಕರ್ಯ ಸೃಷ್ಟಿ
```bash
# ನಿಮ್ಮ ಪ್ರಾಜೆಕ್ಟ್ ವ್ಯಾಖ್ಯಾನದಿಂದ IaC ಫೈಲ್‌ಗಳನ್ನು ರಚಿಸಿ
azd infra generate

# azure.yamlದಿಂದ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಸಂಶ್ಲೇಷಿಸಿ
azd infra synth
```

---

## 🎯 ದ್ರುತ ಕಾರ್ಯಪ್ರವಾಹಗಳು

### ಅಭಿವೃದ್ಧಿ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಹೊಸ ಪ್ರಾಜೆಕ್ಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template todo-nodejs-mongo
cd my-project

# ಅಭಿವೃದ್ಧಿಗೆ ನಿಯೋಜಿಸಿ
azd env new dev
azd up

# ಬದಲಾವಣೆಗಳನ್ನು ಮಾಡಿ ಮತ್ತು ಮರುನಿಯೋಜಿಸಿ
azd deploy

# ನಿಗಾದರ್ಶನ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --live
```

### ಬಹು-ಪರಿಸರ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಪರಿಸರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env new dev
azd env new staging  
azd env new production

# ಡೆವ್ ಗೆ ನಿಯೋಜಿಸಿ
azd env select dev
azd up

# ಪರೀಕ್ಷಿಸಿ ಮತ್ತು ಸ್ಟೇಜಿಂಗ್ ಗೆ ಪ್ರೋತ್ಸಾಹಿಸಿ
azd env select staging
azd up

# ಉತ್ಪಾದನೆಗೆ ನಿಯೋಜಿಸಿ
azd env select production
azd up
```

### ಸಮಸ್ಯೆ ಪರಿಹಾರ ಕಾರ್ಯಪ್ರವಾಹ
```bash
# ಡಿಬಗ್ ಮೋಡ್ ಸಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DEBUG=true

# ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಸಂರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
azd config show

# ಲಾಗ್ಗಳಿಗಾಗಿ ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --logs

# ಸಂಪನ್ಮೂಲ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

## 🔍 ಡಿಬಗ್ಗಿಂಗ್ ಕಮಾಂಡ್‌ಗಳು

### ಡಿಬಗ್ ಮಾಹಿತಿ
```bash
# ಡಿಬಗ್ ಔಟ್‌ಪುಟ್ ಸಕ್ರಿಯ ಮಾಡಿ
export AZD_DEBUG=true
azd <command> --debug

# ಸ್ವಚ್ಛ ಔಟ್‌ಪುಟ್‌ನಿಗಾಗಿ ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
export AZD_DISABLE_TELEMETRY=true

# ಪ್ರಸ್ತುತ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd config show

# ಪ್ರಾಮಾಣಿಕತೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az account show
```

### ಟೆಂಪ್ಲೇಟ್ ಡಿಬಗ್ಗಿಂಗ್
```bash
# ವಿವರಗಳೊಂದಿಗೆ ಲಭ್ಯವಿರುವ ಟೆಂಪ್ಲೇಟು ಗಳು ಪಟ್ಟಿ ಮಾಡು
azd template list --output json

# ಟೆಂಪ್ಲೇಟು ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಿ
azd template show <template-name>

# ಪ್ರಾರಂಭಿಸುವ ಮುನ್ನ ಟೆಂಪ್ಲೇಟು ಪರಿಶೀಲಿಸಿ
azd template validate <template-name>
```

## 📁 ಫೈಲ್ ಮತ್ತು ಸ್ನೇಹಚಿಹ್ನೆ ಕಮಾಂಡ್‌ಗಳು

### ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ
```bash
# ಹಾಲಿನ ಡೈರೆಕ್ಟರಿ ರಚನೆಯನ್ನು ತೋರಿಸಿ
tree /f  # ವಿಂಡೋಸ್
find . -type f  # ಲಿನಕ್ಸ್/ಮ್ಯಾಕ್‌ಓಎಸ್

# azd ಯೋಜನೆಯ ಮೂಲಕ್ಕೆ ನಾವಿಗೇಟ್ ಮಾಡಿ
cd $(azd root)

# azd ಸಂರಚನಾ ಡೈರೆಕ್ಟರಿಯನ್ನು ತೋರಿಸಿ
echo $AZD_CONFIG_DIR  # ಸಾಮಾನ್ಯವಾಗಿ ~/.azd
```

## 🎨 ಔಟ್‌ಪುಟ್ ಫಾರ್ಮ್ಯಾಟಿಂಗ್

### JSON ಔಟ್‌ಪುಟ್
```bash
# ಸ್ಕ್ರಿಪ್ಟಿಂಗ್‌ಗೆ JSON ಔಟ್ಪುಟ್ ಪಡೆಯಿರಿ
azd show --output json
azd env list --output json
azd config show --output json

# jq ನೊಂದಿಗೆ ವಿಶ್ಲೇಷಿಸಿ
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ತಾಳಿ ಔಟ್‌ಪುಟ್
```bash
# ಟೇಬಲ್ ಆಗಿ ಮಾರುಕಟ್ಟೆ ಮಾಡಿ
azd env list --output table

# ನಿಯೋಜಿಸಿದ ಸೇವೆಗಳನ್ನು ನೋಡಿರಿ
azd show --output json | jq '.services | keys'
```

## 🔧 ಸಾಮಾನ್ಯ ಕಮಾಂಡ್ ಸಂಯೋಜನೆಗಳು

### ಆರೋಗ್ಯ ಪರಿಶೀಲನೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# ತ್ವರಿತ ಆರೈಕೆ ಪರಿಶೀಲನೆ
azd show
azd env get-values
azd monitor --logs
```

### ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ
```bash
#!/bin/bash
# ನಿಯೋಜನೆಗೆ ಮೊದಲು ಮಾನ್ಯತೆ
azd show
azd provision --preview  # ನಿಯೋಜಿಸುವ ಮುಂಚೆ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವವೀಕ್ಷಣೆ ಮಾಡಿ
az account show
```

### ಪರಿಸರ ಹೋಲಿಕೆ
```bash
#!/bin/bash
# ವಾತಾವರಣಗಳನ್ನು ಹೋಲಿಸಿ
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ಸಂಪನ್ಮೂಲ ಶುಚಿಗೊಳಿಸುವಿಕೆ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# ಹಳೆಯ ಪರಿಸರಗಳನ್ನು ಸ್ವಚ್ಛಮಾಡಿ
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ಪರಿಸರ ವೆರಿಯಬಲ್ಸ್

### ಸಾಮಾನ್ಯ ಪರಿಸರ ವೆರಿಯಬಲ್ಸ್
```bash
# აზიური კონფიგურაცია
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD კონფიგურაცია
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# აპლიკაციის კონფიგურაცია
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 ತುರ್ತು ಕಮಾಂಡ್‌ಗಳು

### ತ್ವರಿತ ಬದಲಾವಣೆಗಳು
```bash
# ಪ್ರಮಾಣೀಕರಣವನ್ನು ಮರುಹೊಂದಿಸು
az account clear
az login

# ಪರಿಸರವನ್ನು ಬಲವಂತರಾಗಿ ಮರುತಾಜಾ ಮಾಡು
azd env refresh

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ಪುನಃ ಪ್ರಸಾರ ಮಾಡು
azd deploy

# ಒದಗಿಸುವ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json
```

### ಮರುಪ್ರಾಪ್ತಿ ಕಮಾಂಡ್‌ಗಳು
```bash
# ವಿಫಲವಾದ ನಿಯೋಜನೆಯಲ್ಲಿ ಪುನಃಪಡೆಯಿರಿ - ಸ್ವಚ್ಛಗೊಳಿಸಿ ಮತ್ತು ಮರುನಿಯೋಜಿಸಿ
azd down --force --purge
azd up

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಮಾತ್ರ ಪುನಃನಿಯೋಜಿಸಿ
azd provision

# ಅನ್ವಯಿಕೆಯನ್ನು ಮಾತ್ರ ಮರುನಿಯೋಜಿಸಿ
azd deploy
```

## 💡 ಪ್ರೊ ಸಲಹೆಗಳು

### ವೇಗದ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಾಗಿ ರೂಪಾಂತರ ಹೆಸರುಗಳು
```bash
# ನಿಮ್ಮ .bashrc ಅಥವಾ .zshrc ಗೆ ಸೇರಿಸಿ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ಕಾರ್ಯ ಸಂಕ್ಷಿಪ್ತಗಳು
```bash
# ವೇಗದ ಪರಿಸರ ಬದಲಾವಣೆ
azd-env() {
    azd env select $1 && azd show
}

# ನಿಗಾ ಮೂಲಕ ವೇಗದ ನೈಮಕ
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

## 📖 ಸಹಾಯ ಮತ್ತು ಡಾಕ್ಯುಮೆಂಟೇಷನ್

### ಸಹಾಯ ಪಡೆಯುವುದು
```bash
# ಸಾಮಾನ್ಯ ಸಹಾಯ
azd --help
azd help

# ಕಮಾಂಡ್-ನಿರ್ದಿಷ್ಟ ಸಹಾಯ
azd up --help
azd env --help
azd config --help

# ಸಂಚಿಕೆ ಮತ್ತು ನಿರ್ಮಾಣ ಮಾಹಿತಿ ತೋರಿಸಿ
azd version
azd version --output json
```

### ಡಾಕ್ಯುಮೆಂಟೇಷನ್ ಲಿಂಕ್‌ಗಳು
```bash
# ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ತೆರೆಯಿರಿ
azd docs

# ಟೆಂಪ್ಲೇಟ್ ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ತೋರಿಸಿ
azd template show <template-name> --docs
```

---

**ಚಟುವಟಿಕೆ**: ಈ ಚೀಟ್ ಶೀಟ್ ಅನ್ನು ಬುಕ್‌ಮಾರ್ಕ್ ಮಾಡಿ ಮತ್ತು ಅಗತ್ಯವಿರುವ ಕಮಾಂಡ್‌ಗಳನ್ನು ತೇಜಸ್ವಿಯಾಗಿ ಹುಡುಕಲು `Ctrl+F` ಬಳಸಿ!

---

**ನವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಪೂರ್ವಪರೀಕ್ಷೆ ತಪಾಸಣೆಗಳು](../docs/pre-deployment/preflight-checks.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಪದಕೋಶ](glossary.md)

---

> **💡 ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ ಅಜ್ಯುರ್ ಕಮಾಂಡ್ ಸಹಾಯ ಬೇಕೇ?** `npx skills add microsoft/github-copilot-for-azure` ಮೂಲಕ [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ಅನ್ನು ಸ್ಥಾಪಿಸಿ — AI, Foundry, ನಿಯೋಜನೆ, ಡಯಾಗ್ನೋಸ್ಟಿಕ್ಸ್ ಮತ್ತು ಇನ್ನಷ್ಟು ಯೋಗಕ್ಷೇಮಗಳಿಗೆ 37 ಕೌಶಲ್ಯಗಳು.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ತೆರೆದೂಟ**:  
ಈ ದಾಖಲೆಯನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿರಿ. ಮೂಲ ಭಾಷೆಯ ದಾಖಲೆಯನ್ನು ಅಧಿಕೃತ ಮೂಲ ಎಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವಪೂರ್ಣ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿಕೆ ಅಥವಾ ತಪ್ಪು ವಿವರಣೆಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಾಗಿರುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->