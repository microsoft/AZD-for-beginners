# AI ಕಾರ್ಯಾಗಾರ ಪ್ರಯೋಗಶಾಲೆ: ನಿಮ್ಮ AI ಪರಿಹಾರಗಳನ್ನು AZD-Deploy ಮಾಡುವುದು

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಆರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **➡️ ಮುಂದಿನದು**: [ಉತ್ಪಾದನಾ AI ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಕಾರ್ಯಾಗಾರ ಅವಲೋಕನ

ಈ ಕೈಗೊಳ್ಳುವ ಪ್ರಯೋಗಶಾಲೆ ಡೆವಲಪರ್‌ಗಳಿಗೆ ಇರುತ್ತದೆ, ಅದು ಇರುವ AI ಟೆಂಪ್ಲೇಟನ್ನಿಂದ ಪ್ರಾರಂಭಿಸಿ ಅದನ್ನು Azure Developer CLI (AZD) ಬಳಸಿ ನಿಯೋಜಿಸುವ ಪ್ರಕ್ರಿಯೆಯನ್ನು ತಿಳಿಸುತ್ತದೆ. ನೀವು Microsoft Foundry ಸೇವೆಗಳು ಬಳಸಿ ಉತ್ಪಾದನಾ AI ನಿಯೋಜನೆಗಳ ಪ್ರಮುಖ ಮಾದರಿಗಳನ್ನು ಕಲಿಯುತ್ತೀರಿ.

> **ಮಾನ್ಯತೆ ಟಿಪ್ಪಣಿ (2026-03-25):** ಈ ಕಾರ್ಯಾಗಾರವನ್ನು `azd` `1.23.12` ಆವೃತ್ತಿಯ ಮೇಲೆ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. ನಿಮ್ಮ ಸ್ಥಳೀಯ ಸ್ಥಾಪನೆ ಹಳೆಯದಾಗಿದ್ದರೆ, ಕೆಳಗಿನ ಹಂತಗಳು ಹೊಂದಿಕೊಳ್ಳುವಂತೆ ಶೇರು ಮಾಡದ ಮೊದಲು AZD ಅನ್ನು ನವೀಕರಿಸಿ.

**ವೇಳಾವಧಿ:** 2-3 ಗಂಟೆಗಳು  
**ಪರಿಸರ:** ಮಧ್ಯಮ  
**ಅಗತ್ಯ предусಫಟಿಕೊಳ್ಳಲು:** ಮೂಲ Azure ಜ್ಞಾನ, AI/ML ಕಾನ್ಸೆಪ್ಟ್‌ಗಳ ಪರಿಚಯ

## 🎓 ಕಲಿಕೆ ಲಕ್ಶ್ಯಗಳು

ಈ ಕಾರ್ಯಾಗಾರ ಮುಗಿದುಕೊಳ್ಳುವಂತೆ ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ✅ ಇರುವ AI ಅನ್ವಯಿಕೆಯನ್ನು AZD ಟೆಂಪ್ಲೇಟ್ಗಳಿಗೆ ಪರಿವರ್ತಿಸುವುದು
- ✅ Microsoft Foundry ಸೇವೆಗಳನ್ನು AZD ಮೂಲಕ ಸಂರಚಿಸುವುದು
- ✅ AI ಸೇವೆಗಳಿಗಾಗಿ ಸುರಕ್ಷಿತ ದೃಢೀಕರಣ ನಿರ್ವಹಣೆ ಅನುಷ್ಠಾನವಿಸುವುದು
- ✅ ಮಾನಿಟರಿಂಗ್‌ ಸಹಿತ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಅನ್ವಯಿಕೆಗಳನ್ನು ನಿಯೋಜಿಸುವುದು
- ✅ ಸಾಮಾನ್ಯ AI ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ತಿದ್ದುವುದು

## ಅಗತ್ಯ ಸಾಧನಗಳು

### ಅಗತ್ಯ ಟೂಲ್ಸ್
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ಸ್ಥಾಪಿತವಾಗಿದೆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ಸ್ಥಾಪಿತವಾಗಿದೆ
- [Git](https://git-scm.com/) ಸ್ಥಾಪಿತವಾಗಿದೆ
- ಕೋಡ್ ಸಂಪಾದಕ (VS Code ಶಿಫಾರಸು)

### Azure ಸಂಪನ್ಮೂಲಗಳು
- ಕೊಡುಗೆಯ ಪ್ರವೇಶದೊಂದಿಗೆ Azure ಚಂದಾದಾರಿಕೆ
- Microsoft Foundry Models ಸೇವೆಗಳು ಪ್ರವೇಶ ಅಥವಾ ಪ್ರವೇಶಕ್ಕಾಗಿ ವಿನಂತಿ ಮಾಡುವ ಸಾಮರ್ಥ್ಯ
- ಸಂಪನ್ಮೂಲ ಗುಂಪು ರಚನೆ ಅನುಮತಿಗಳು

### ಜ್ಞಾನ ಅವಶ್ಯಕತೆಗಳು
- Azure ಸೇವೆಗಳ ಮೂಲ ಅರ್ಥ
- ಕಮಾಂಡ್-ಲೈನ್ ಇಂಟರ್ಫೇಸ್ಗಳ ಪರಿಚಯ
- AI/ML ಮೂಲಭೂತ ಕಲಿಕೆಗಳು (APIs, ಮಾದರಿಗಳು, ಪ್ರಾಂಪ್ಟ್‌ಗಳು)

## ಪ್ರಯೋಗಶಾಲೆ ಸೆಟ್‌ಅಪ್

### ಹಂತ 1: ಪರಿಸರ ಪೂರ್ವತಯಾರಿ

1. **ಟೂಲ್ಸ್ ಸ್ಥಾಪನೆಯ ಪರಿಶೀಲನೆ:**
```bash
# AZD ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# ಝೂರ್ CLI ಪರಿಶೀಲಿಸಿ
az --version

# AZD ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ಝೂರ್‌ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# ನಿಷ್ಠುಲಿಸುವಿಕೆಯಲ್ಲಿ az ಆಜ್ಞೆಗಳು ಚಲಾಯಿಸುವ ಯೋಜನೆ ಇದ್ದರೆ ಮಾತ್ರ ಝೂರ್ CLI ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login
```

ನೀವು ಅನೇಕ ಟೆನಂಟ್ಗಳಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತಿದ್ದರೆ ಅಥವಾ ನಿಮ್ಮ ಚಂದಾದಾರಿಕೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಪತ್ತೆ ಮಾಡಲಾಗದಿದ್ದರೆ, `azd auth login --tenant-id <tenant-id>` ಬಳಸಿ ಮರುಪ್ರಯತ್ನಿಸಿ.

2. **ಕಾರ್ಯಾಗಾರದ ರೆಪೊಜಿಟರಿಯನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ಮೋಡುಲ್ 1: AI ಅನ್ವಯಿಕೆಗಳಿಗಾಗಿ AZD ರಚನೆ ತಳುಕು

### AI AZD ಟೆಂಪ್ಲೇಟಿನ ರಚನೆ

AI ಸಿದ್ಧ AZD ಟೆಂಪ್ಲೇಟಿನ ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 1.1: ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ**

1. **azure.yaml ಫೈಲ್ ಪರಿಶೀಲನೆ:**
```bash
cat azure.yaml
```

**ಪರೀಕ್ಷಿಸಬೇಕಾದವು:**
- AI ಘಟಕಗಳ ಸೇವಾ ವ್ಯಾಖ್ಯಾನಗಳು
- ಪರಿಸರ ಚರ ಪ್ರಮಾಣಗಳ ನಕ್ಷೆ
- ಹೋಸ್ಟ್ ಸಂರಚನೆಗಳು

2. **ಮುಖ್ಯ.bicep ಮೂಲಸೌಕರ್ಯ ಪರಿಶೀಲನೆ:**
```bash
cat infra/main.bicep
```

**ಪ್ರಮುಖ AI ಮಾದರಿಗಳನ್ನು ಗುರುತಿಸುವುದು:**
- Microsoft Foundry Models ಸೇವೆಯ ಸಿದ್ಧತೆ
- ಕೋಗ್ನಿಟಿವ್ سرچ್ ಒಟ್ಟು ಸೇರಿಸು
- ಸುರಕ್ಷಿತ ಕೀಪ್ ನಿರ್ವಹಣೆ
- ನೆಟ್ವರ್ಕ್ ಸೆಕ್ಯೂರಿಟಿ ಸಂರಚನೆಗಳು

### **ಚರ್ಚೆ ಬಿಂದುವು:** AI ಗಾಗಿ ಈ ಮಾದರಿಗಳ ಮಹತ್ವ ಏನು

- **ಸೇವಾ ಅವಲಂಬನೆಗಳು**: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಹಲವಾರು ಸೇವೆಗಳ ಸಹಕಾರದ ಅಗತ್ಯವಿದೆ
- **ಭದ್ರತೆ**: API ಕೀಸ್ ಮತ್ತು ಎಂಡ್ಪಾಯಿಂಟ್ಗಳು ಸುರಕ್ಷಿತ ನಿರ್ವಹಣೆ ಅಗತ್ಯ
- **ವಿಸ್ತರಣೆ ಸಾಮರ್ಥ್ಯ**: AI ಕೆಲಸಕ್ಕೆ ವಿಶಿಷ್ಟ ವಿಸ್ತರಣೆ ಅಗತ್ಯ
- **ಖರ್ಚು ನಿರ್ವಹಣೆ**: ಸರಿಯಾದ ಸಂರಚನೆಯಿಲ್ಲದಿದ್ದರೆ AI ಸೇವೆಗಳು ದುಬಾರಿ ಆಗಬಹುದು

## ಮೋಡುಲ್ 2: ನಿಮ್ಮ ಮೊದಲ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ

### ಹಂತ 2.1: ಪರಿಸರ ಪ್ರಾರಂಭ

1. **ಹೊಸ AZD ಪರಿಸರ ರಚನೆ:**
```bash
azd env new myai-workshop
```

2. **ಅಗತ್ಯವರ ಪ್ಯಾರಾಮೀಟರ್ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ನಿಮ್ಮ ಇಷ್ಟದ ಅಜ್ಯೂರ್ ಪ್ರದೇಶವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set AZURE_LOCATION eastus

# ಐಚ್ಛಿಕ: ನಿರ್ದಿಷ್ಟ OpenAI ಮಾದರಿಯನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ಹಂತ 2.2: ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ

1. **AZD ಬಳಸಿ ನಿಯೋಜಿಸಿ:**
```bash
azd up
```

**`azd up` ಸಮಯದಲ್ಲಿ ಆಗುವವು:**
- ✅ Microsoft Foundry Models ಸೇವೆಯನ್ನು ಸಿದ್ಧಗೊಳಿಸುತ್ತದೆ
- ✅ ಕೋಗ್ನಿಟಿವ್ سرچ್ ಸೇವೆಯನ್ನು ರಚಿಸುತ್ತದೆ
- ✅ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ ಅಪ್‌ಸರ್ವಿಸ್ ಇನ್ಸ್ಟಾನ್ಸ್ ರಚಿಸುತ್ತದೆ
- ✅ ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭద್ರತೆ ಸಂರಚಿಸುವುದು
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ನಿಯೋಜಿಸುವುದು
- ✅ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಸಜ್ಜುಗೊಳಿಸುವುದು

2. **ನಿಯೋಜನೆ ಪ್ರಗತಿ ವೀಕ್ಷಿಸಿ** ಮತ್ತು ರಚನೆಯಾಗುತ್ತಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಗಮನಿಸಿ.

### ಹಂತ 2.3: ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ

1. **ನಿಯೋಜಿತ ಸಂಪನ್ಮೂಲಗಳ ಪರಿಶೀಲನೆ:**
```bash
azd show
```

2. **ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನ್ ತೆರೆಯಿರಿ:**
```bash
azd show
```

`azd show` ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ತೋರಿಸುವ ವೆಬ್ ಎಂಡ್ಪಾಯಿಂಟ್ ತೆರೆಯಿರಿ.

3. **AI ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ:**
   - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್ ನವೀಗಿಸಿ
   - ಮಾದರಿ ಪ್ರಶ್ನೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
   - AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿರುವುದನ್ನು ದೃಢೀಕರಿಸಿ

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 2.1: ಸಮಸ್ಯೆ ಪರಿಹಾರ ಅಭ್ಯಾಸ**

**ಸ್ಥಿತಿ**: ನಿಮ್ಮ ನಿಯೋಜನೆ ಯಶಸ್ವಿಯಾದರೂ AI ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತಿಲ್ಲ.

**ಸಾಮಾನ್ಯ ತಪಾಸಣಿಗಳು:**
1. **OpenAI API ಕೀಸ್**: ಸರಿಯಾಗಿ ಸೆಟ್ ಆಗಿಯಿದೆಯೆಂದು ಪರಿಶೀಲಿಸಿ
2. **ಮಾಡೆಲ್ ಲಭ್ಯತೆ**: ನಿಮ್ಮ ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಮಾದರಿ ಸೇರಿದೆನೆಂದು ಪರಿಶೀಲಿಸಿ
3. **ನೆಟ್ವರ್ಕ್ ಸಂಪರ್ಕ**: ಸೇವೆಗಳು ಸಂವಹನ ಮಾಡಬಹುದಾದುದೆಂದು ಖಚಿತಪಡಿಸಿ
4. **RBAC ಅನುಮತಿಗಳು**: ಅಪ್‌ಲೆಿಕೇಶನ್ OpenAI ಪ್ರವೇಶ ಹೊಂದಬಹುದೇಂದು ಪರಿಶೀಲಿಸಿ

**ಡಿಬಗ್ಗಿಂಗ್ ಕಮಾಂಡ್‌ಗಳು:**
```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values

# ನಿಯುಕ್ತಿ ಲಾಗ್‌ಗಳನ್ನು ನೋಡಿ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ನಿಯುಕ್ತಿ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ಮೋಡುಲ್ 3: ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು

### ಹಂತ 3.1: AI ಸಂರಚನೆಯನ್ನು ಬದಲಾಯಿಸುವುದು

1. **OpenAI ಮಾದರಿಯನ್ನು ನವೀಕರಿಸಿ:**
```bash
# ನಿಮ್ಮ ಪ್ರದೆಶದಲ್ಲಿ ಲಭ್ಯವಿದ್ದರೆ ವಿಭಿನ್ನ ಮಾದರಿಗೆ ಬದಲಾಯಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ಹೊಸ ಸಂರಚನೆಯೊಂದಿಗೆ ಮರುಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd deploy
```

2. **ಹೆಚ್ಚಿನ AI ಸೇವೆಗಳನ್ನು ಸೇರಿಸಿ:**

`infra/main.bicep` ಅನ್ನು ಸಂಪಾದಿಸಿ Document Intelligence ಸೇರ್ಪಡೆ:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### ಹಂತ 3.2: ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು

**ಉತ್ತಮ ಅಭ್ಯಾಸ**: ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಉತ್ಪಾದನೆಗೆ ಭಿನ್ನ ಸಂರಚನೆಗಳು.

1. **ಉತ್ಪಾದನಾ ಪರಿಸರ ರಚನೆ:**
```bash
azd env new myai-production
```

2. **ಉತ್ಪಾದನಾ-ನಿರ್ದಿಷ್ಟ ಪ್ಯಾರಾಮೀಟರ್ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಉತ್ಪಾದನೆ ಸಾಮಾನ್ಯವಾಗಿ ಹೆಚ್ಚಿನ SKU ಗಳನ್ನು ಬಳಸುತ್ತದೆ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ಹೆಚ್ಚುವರಿ ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 3.1: ಖರ್ಚಿನ ಅನ್ವಯಿಕೆ**

**ಸವಾಲು**: ಟೆಂಪ್ಲೇಟ್ನ್ನು ಕಡಿಮೆ ವೆಚ್ಚದ ಅಭಿವೃದ್ಧಿಗೆ ಸಂರಚಿಸಿ.

**ಕಾರ್ಯಗಳು:**
1. ಯಾವ SKUs ಅನ್ನು ಮುಕ್ತ/ಮೂಲಭೂತ ಪಟ್ಟಿಗೆ ಸೆಟ್ ಮಾಡಬಹುದು ಎಂದು ಗುರುತಿಸಿ
2. ಕಡಿಮೆ ವೆಚ್ಚದ ಪರಿಕಲ್ಪನೆಗೆ ಪರಿಸರ ಚರಗಳನ್ನು ಸಂರಚಿಸಿ
3. ನಿಯೋಜಿಸಿ ಮತ್ತು ಉತ್ಪಾದನಾ ಸಂರಚನೆ ಜೊತೆಗೆ ವೆಚ್ಚದ ಹೋಲಿಕೆ ಮಾಡಿ

**ಉತ್ತರ ಸೂಚನೆಗಳು:**
- ಸಾಧ್ಯವಾದರೆ Cognitive Services ಗೆ F0 (ಮುಕ್ತ) ಪಟ್ಟಿ ಬಳಸಿ
- ಅಭಿವೃದ್ಧಿಗಾಗಿ Search Service ಗೆ ಮೂಲಭೂತ ಪಟ್ಟಿ ಬಳಸಿ
- ಫಂಕ್ಷನ್ಗಾಗಿ ಖರ್ಚು ಯೋಜನೆ ಯೋಚಿಸಿ

## ಮೋಡುಲ್ 4: ಭದ್ರತೆ ಮತ್ತು ಉತ್ಪಾದನಾ ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳು

### ಹಂತ 4.1: ಸುರಕ್ಷಿತ ದೃಢೀಕರಣ ನಿರ್ವಹಣೆ

**ಪ್ರಸ್ತುತ ಸವಾಲು**: ಹಲವಾರು AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು API ಕೀಗಳನ್ನು ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡುತ್ತವೆ ಅಥವಾ ಅಸುರಕ್ಷಿತ ಸಂಗ್ರಹಣೆಯನ್ನು ಬಳಕೆ ಮಾಡುತ್ತವೆ.

**AZD ಪರಿಹಾರ**: Managed Identity + ಕೀ ವಾಲ್ಟ್ ಇंटीಗ್ರೇಶನ್.

1. **ನಿಮ್ಮ ಟೆಂಪ್ಲೇಟಿನಲ್ಲಿ ಭದ್ರತೆ ಸಂರಚನೆ ಪರಿಶೀಲನೆ:**
```bash
# ಕೀ ವಾಲ್ಟ್ ಮತ್ತು ನಿರ್ವಹಿತ ಗುರುತು ಸಂರಚನೆಯನ್ನು ಹುಡುಕಿ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲನೆ:**
```bash
# ವೆಬ್ ಆಪ್‌에는 ಸರಿಯಾದ ಗುರುತು ಸಂರಚನೆಯಿರುವುದಾದರೂ ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ಹಂತ 4.2: ನೆಟ್ವರ್ಕ್ ಭದ್ರತೆ

1. **ನಿಜವಾದ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ** (ಇದಾಗೂ ಸಂರಚಿಸಲಾಗದಿದ್ದರೆ):

ನಿಮ್ಮ bicep ಟೆಂಪ್ಲೇಟಿಗೆ ಸೇರಿಸಿ:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### ಹಂತ 4.3: ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಗೋಚರತೆ

1. **ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಸ್ವಯಂಕ್ರಮವಾಗಿ ಸಂರಚಿತವಾಗಬೇಕು
# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ನೇರ ಮಾನಿಟರಿಂಗ್ ಸಜ್ಜುಗೊಳಿಸಿ:**

AI ಕಾರ್ಯಾಚರಣೆಗಳಿಗಾಗಿಯೂ ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ಸ್ ಸೇರಿಸಿ:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 4.1: ಭದ್ರತಾ ತಪಾಸಣೆ**

**ಕಾರ್ಯ:** ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಭದ್ರತೆ ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳಿಗೆ ವಿಮರ್ಶಿಸಿ.

**ಪರಿಶೀಲನಾ ಪಟ್ಟಿ:**
- [ ] ಕೋಡ್ ಅಥವಾ ಸಂರಚನೆಯಲ್ಲಿ ಯಾವುದೇ ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡಿದ ರಹಸ್ಯಗಳು ಇಲ್ಲ
- [ ] ಸೇವೆ-ತೋ-ಸೇವೆಗೆ ದೃಢೀಕರಣಕ್ಕೆ Managed Identity ಬಳಸಲಾಗಿದೆ
- [ ] ಕೀ ವಾಲ್ಟ್ ಸಂವೇದನಶೀಲ ಸಂರಚನೆಯನ್ನು ಸಂಗ್ರಹಿಸುತ್ತದೆ
- [ ] ನೆಟ್ವರ್ಕ್ ಪ್ರವೇಶ ಸರಿಯಾಗಿ ನಿಯಂತ್ರಿಸಲಾಗಿದೆ
- [ ] ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ

## ಮೋಡುಲ್ 5: ನಿಮ್ಮದೇ AI ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತನೆ

### ಹಂತ 5.1: ಮೌಲ್ಯಮಾಪನ ವರ್ಕ್‌ಶೀಟ್

**ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತಿಸುವ ಮೊದಲು, ಈ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿರಿ:**

1. **ಅನ್ವಯಿಕೆ ವಾಸ್ತುಶಿಲ್ಪ:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ AI ಸೇವೆಗಳನ್ನು ಬಳಸುತ್ತದೆ?
   - ಅದಕ್ಕೆ ಎಷ್ಟು ಗಣನಯೋಗ್ಯ ಸಂಪನ್ಮೂಲ ಅಗತ್ಯವಿದೆ?
   - ದತ್ತಾಂಶ ಆಧಾರವಿದೆವೆಯೇ?
   - ಸೇವೆಗಳ ನಡುವೆ ಯಾವ ಅವಲಂಬನೆಗಳಿವೆ?

2. **ಭದ್ರತೆ ಅವಶ್ಯಕತೆಗಳು:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ ಸಂವೇದನಶೀಲ ಡೇಟಾವನ್ನು ಹಸ್ತಾಂತರಿಸುತ್ತದೆ?
   - ನಿಮ್ಮ ಕೈಬಿಡುವ ತಾಲ್ಲೂಕುಗಳು ಏನು?
   - ಖಾಸಗಿ ನೆಟ್ವರ್ಕಿಂಗ್ ಅಗತ್ಯವಿದೆಯೇ?

3. **ವಿಸ್ತರಣೆ ಅವಶ್ಯಕತೆಗಳು:**
   - ನಿಮ್ಮ ನಿರೀಕ್ಷಿತ ಭಾರವೇನು?
   - ಸ್ವಯಂಚಾಲಿತ ವಿಸ್ತರಣೆ ಬೇಕೇ?
   - ಪ್ರಾಂತ್ಯೀಯ ಅವಶ್ಯಕತೆಗಳಿವೆಯೇ?

### ಹಂತ 5.2: ನಿಮ್ಮ AZD ಟೆಂಪ್ಲೇಟನ್ನು ರಚಿಸಿ

**ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತಿಸಲು ಈ ಮಾದರಿಯನ್ನು ಅನುಸರಿಸಿ:**

1. **ಮೂಲಭೂತ ರಚನೆಯನ್ನು ರಚಿಸಿ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template minimal
```

2. **azure.yaml ರಚಿಸಿ:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ರಚಿಸಿ:**

**infra/main.bicep** - ಮುಖ್ಯ ಟೆಂಪ್ಲೇಟು:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI ಮಾಯಾಜಾಲ:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 5.1: ಟೆಂಪ್ಲೇಟು ಸೃಷ್ಟಿ ಸವಾಲು**

**ಸವಾಲು:** ದಸ್ತಾವೇಜು ಸಂಸ್ಕರಣೆ AI ಅಪ್ಲಿಕೇಶನಿಗಾಗಿ AZD ಟೆಂಪ್ಲೇಟು ರಚಿಸಿ.

**ಅಗತ್ಯತೆಗಳು:**
- ವಿಷಯ ವಿಶ್ಲೇಷಣೆಗೆ Microsoft Foundry Models
- OCR ಗೆ Document Intelligence
- ದಸ್ತಾವೇಜು ಅಪ್ಲೋಡ್‌ಗಳಿಗಾಗಿ ಸ್ಟೋರೇಜ್ ಅಕೌಂಟ್
- ಪ್ರಕ್ರಿಯಾಪ್ರವಾಹಕ್ಕಾಗಿ ಫಂಕ್ಷನ್ ಅಪ್ಲಿಕೇಶನ್
- ಬಳಕೆದಾರ ಇಂಟರ್ಫೇಸ್ಗಾಗಿ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್

**ಇತರೆ ಅಂಕಗಳು:**
- ಸರಿಯಾದ ದೋಷ ನಿರ್ವಹಣೆ ಸೇರಿಸಿ
- ವೆಚ್ಚ ಅಂದಾಜು ಸೇರಿಸಿ
- ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ

## ಮೋಡುಲ್ 6: ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಡೀಬಗಿಂಗ್

### ಸಾಮಾನ್ಯ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

#### ಸಮಸ್ಯೆ 1: OpenAI ಸೇವಾ ಕೊಟಾ ಮೀರಿತಿದೆ
**ಲಕ್ಷಣಗಳು:** ನಿಯೋಜನೆ ಕೊಟಾ ದೋಷದಿಂದ ವಿಫಲ
**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕೊಟದ ಪ್ರಮಾಣವನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಕೊಟದ ಪ್ರಮಾಣವನ್ನು ಹೆಚ್ಚಿಸಲು ವಿನಂತಿಸು ಅಥವಾ ಬೇರೆ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up
```

#### ಸಮಸ್ಯೆ 2: ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಮಾದರಿ ಲಭ್ಯವಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:** AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ವಿಫಲ ಅಥವಾ ಮಾದರಿ ನಿಯೋಜನೆ ದೋಷಗಳು
**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಾಂತ್ಯದ ಐಚ್ಛಿಕವನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices model list --location eastus

# ಲಭ್ಯವಿರುವ ಮಾದರಿಯೊಂದಿಗೆ ನವೀಕರಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### ಸಮಸ್ಯೆ 3: ಅನುಮತಿ ಸಮಸ್ಯೆಗಳು
**ಲಕ್ಷಣಗಳು:** AI ಸೇವೆಗಳಿಗೆ ಕರೆ ಮಾಡಿದಾಗ 403 ನಿಷೇಧ ದೋಷಗಳು
**ಪರಿಹಾರಗಳು:**
```bash
# ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ಇಲ್ಲದ ಪಾತ್ರಗಳನ್ನು ಸೇರಿಸಿ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳು

#### ಸಮಸ್ಯೆ 4: AI ಪ್ರತ್ಯುತ್ತರಗಳು ನಿಧಾನ
**ಆಯ್ದ ಹಂತಗಳು:**
1. ಕಾರ್ಯಕ್ಷಮತೆ ಮೆಟ್ರಿಕ್ಸ್ಗಾಗಿ ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಪರಿಶೀಲಿಸಿ
2. Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ OpenAI ಸೇವಾ ಮೆಟ್ರಿಕ್ಸ್ ಪರಿಶೀಲಿಸಿ
3. ನೆಟ್ವರ್ಕ್ ಸಂಪರ್ಕ ಮತ್ತು ವಿಳಂಬ ಪರಿಶೀಲಿಸಿ

**ಪರಿಹಾರಗಳು:**
- ಸಾಮಾನ್ಯ ಪ್ರಶ್ನೆಗಳಿಗೆ ಕ್ಯಾಶಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ನಿಮ್ಮ ಬಳಕೆಗೆ ಸೂಕ್ತ OpenAI ಮಾದರಿಯನ್ನು ಬಳಸಿ
- ಹೆಚ್ಚಿನ ಭಾರ ಕಾರಣಕ್ಕಾಗಿ ಓದುವ ಪ್ರತಿಗಳ ಬಳಕೆ ಪರಿಗಣಿಸಿ

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 6.1: ಡೀಬಗಿಂಗ್ ಸವಾಲು**

**ಸ್ಥಿತಿ:** ನಿಮ್ಮ ನಿಯೋಜನೆ ಯಶಸ್ವಿಯಾದರೂ ಅಪ್ಲಿಕೇಶನ್ 500 ದೋಷಗಳನ್ನು ನೀಡುತ್ತಿದೆ.

**ಡೀಬಗ್ಗಿಂಗ್ ಕೆಲಸಗಳು:**
1. ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
2. ಸೇವೆ ಸಂಪರ್ಕ ದೃಢೀಕರಿಸಿ
3. ದೃಢೀಕರಣ ಪರೀಕ್ಷಿಸಿ
4. ಸಂರಚನೆ ಪರಿಶೀಲಿಸಿ

**ಬಳಸಬೇಕಾದ ಉಪಕರಣಗಳು:**
- `azd show` ನಿಯೋಜನೆ ಅವಲೋಕನಕ್ಕೆ
- ಸೇವೆಗಳ ಡೀಟೈಲ್ಡ್ ಲಾಗ್ಗಳಿಗಾಗಿ Azure ಪೋರ್ಟಲ್
- ಅಪ್ಲಿಕೇಶನ್ ಟೆಲಿಮೆಟ್ರಿಗಾಗಿ ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್

## ಮೋಡುಲ್ 7: ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್

### ಹಂತ 7.1: ಸಮಗ್ರ ಮಾನಿಟರಿಂಗ್ ಸ್ಥಾಪನೆ

1. **ಕಸ್ಟಮ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ ರಚಿಸಿ:**

Azure ಪೋರ್ಟಲ್‌ಗೆ ಹೋಗಿ ಈ ಮೂಲಕ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ರಚಿಸಿ:
- OpenAI ವಿನಂತಿ ಸಂಖ್ಯೆಗಳು ಮತ್ತು ವಿಳಂಬ
- ಅಪ್ಲಿಕೇಶನ್ ದೋಷದ ಪಟ್ಟಿ
- ಸಂಪನ್ಮೂಲ ಬಳಕೆ
- ವೆಚ್ಚ ಅನುಸರಣೆ

2. **ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಹೆಚ್ಚು ದೋಷ ಪ್ರಮಾಣದ ಎಚ್ಚರಿಕೆ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ಹಂತ 7.2: ವೆಚ್ಚ ಅನುಕೂಲತೆ

1. **ಪ್ರಸ್ತುತ ವೆಚ್ಚ ವಿಶ್ಲೇಷಣೆ:**
```bash
# Azure CLI ಬಳಸಿ ವೆಚ್ಚದ ಡೇಟಾವನ್ನು ಪಡೆಯಲು
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ವೆಚ್ಚ ನಿಯಂತ್ರಣಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:**
- ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಸೆಟ್ ಮಾಡಿ
- ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಧೋರಣೆಗಳನ್ನು ಬಳಸಿ
- ವಿನಂತಿ ಕ್ಯಾಶಿಂಗ್ ಮಾಡಿ
- OpenAI ಟೋಕನ್ ಬಳಕೆಯನ್ನು ನಿರೀಕ್ಷಿಸಿ

### **ಪ್ರಯೋಗಶಾಲೆ ವ್ಯಾಯಾಮ 7.1: ಕಾರ್ಯಕ್ಷಮತೆ ಸುಧಾರಣೆ**

**ಕಾರ್ಯ:** ಕಾರ್ಯಕ್ಷಮತೆಯೂ ಹಾಗೂ ವೆಲಸೆ ಮತ್ತೂ ಕಡಿತಗೊಳಿಸುವಲ್ಲಿ ನಿಮ್ಮ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಸುಧಾರಿಸಿ.

**ಮುಖ್ಯ ಮೇಲ್ವಿಚಾರಣಾ ಅಂಶಗಳು:**
- ಸರಾಸರಿ ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯ 20% ಕಡಿತ
- ಮಾಸಿಕ ವೆಚ್ಚ 15% ಕಡಿತ
- 99.9% ಅಪ್‌ಟೈಮ್ ಬ್ಯಾಂಧ

**ಪ್ರಯತ್ನಿಸುವ ತಂತ್ರಗಳು:**
- ಪ್ರತಿಕ್ರಿಯೆ ಕ್ಯಾಶಿಂಗ್ ಅನುಷ್ಠಾನ
- ಟೋಕನ್ ಕಾರ್ಯಕ್ಷಮತೆಯಿಗಾಗಿ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಸುಧಾರಣೆ
- ಸೂಕ್ತ ಗಣನಯೋಗ್ಯ SKUs ಬಳಕೆ
- ಸೂಕ್ತ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ವ್ಯವಸ್ಥೆ

## ಕೊನೆ ಸವಾಲು: ಪೂರ್ಣ ಅನುಷ್ಠಾನ

### ಸವಾಲಿನ ಸ್ಥಿತಿ

ನೀವು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI-ಚಾಲಿತ ಗ್ರಾಹಕ ಸೇವಾ ಚಾಟ್‌ಬಾಟ್ ಸೃಷ್ಠಿಸಲು ಜವಾಬ್ದಾರಿಯಲ್ಲಿದ್ದೀರಿ, ಈ ಅವಶ್ಯಕತೆಗಳೊಂದಿಗೆ:

**ಕಾರ್ಯಾಚರಣೆ ಅವಶ್ಯಕತೆಗಳು:**
- ಗ್ರಾಹಕ ಸಂವಹನಗಳಿಗೆ ವೆಬ್ ಇಂಟರ್ಫೇಸ್
- ಪ್ರತಿಕ್ರಿಯೆಗಾಗಿ Microsoft Foundry Models ಅಳವಡಿಕೆ
- ಕೋಗ್ನಿಟಿವ್ سرچ್ ಮೂಲಕ ದಸ್ತಾವೇಜು ಹುಡುಕಾಟ
- ಇಡೀ ಗ್ರಾಹಕ ಡೇಟಾಬೇಸ್ ಸಂಯೋಜನೆ
- ಬಹುಭಾಷಾ ಬೆಂಬಲ

**ಕಾರ್ಯನಿರ್ವಹಣೆಯಲ್ಲದ ಅವಶ್ಯಕತೆಗಳು:**
- 1000 ಸಮಕಾಲೀನ ಬಳಕೆದಾರರ ನಿರ್ವಹಣೆ
- 99.9% ಅಪ್‌ಟೈಮ್ SLA
- SOC 2 ಅನುಕೂಲತೆ
- ತಿಂಗಳಿಗೆ $500 ಒಳಗಿನ ವೆಚ್ಚ
- ಅನೇಕ ಪರಿಸರಗಳಿಗೆ ನಿಯೋಜನೆ (ಡೇವ್, ಸ್ಟೇಜಿಂಗ್, ಉತ್ಪಾದನೆ)

### ಅನುಷ್ಠಾನ ಹಂತಗಳು

1. ವಾಸ್ತುಶಿಲ್ಪ ವಿನ್ಯಾಸ ಮಾಡಿ  
2. AZD ಟೆಂಪ್ಲೇಟು ರಚಿಸಿ  
3. ಭದ್ರತಾ ಕ್ರಮಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ  
4. ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಎಚ್ಚರಿಕೆಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ  
5. ನಿಯೋಜನೆ ಪೈಪ್ಲೈನ್ಗಳನ್ನು ರಚಿಸಿ  
6. ಪರಿಹಾರವನ್ನು ದಾಖಲಿಸಿ  

### ಮೌಲ್ಯಮಾಪನ ಮಾನದಂಡಗಳು

- ✅ **ಕಾರ್ಯಾಚರಣೆ:** ಎಲ್ಲ ಅವಶ್ಯಕತೆಗಳಿಗೆ ಉತ್ತರವಿದೆಯೇ?
- ✅ **ಭದ್ರತೆ:** ಅತ್ಯುತ್ತಮ ಅಭ್ಯಾಸಗಳು ಅನುಷ್ಠಾನಗೊಂಡಿದೆಯೇ?
- ✅ **ವಿಸ್ತರಣೆ ಸಾಮರ್ಥ್ಯ:** ಭಾರವನ್ನು ನಿರ್ವಹಿಸಬಹುದೇ?
- ✅ **ನಿರ್ವಹಣೆ:** ಕೋಡ್ ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಸರಿಯಾಗಿ ಸಂಘಟಿತವಾದೆಯೇ?
- ✅ **ವೆಚ್ಚ:** ಬಜೆಟ್ ಒಳಗಿದ್ದೆಯೇ?

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### Microsoft ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- [Azure Developer CLI ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models ಸೇವೆ ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/ai-studio/)

### ಮಾದರಿ ಟೆಂಪ್ಲೇಟುಗಳು
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ಪೂರ್ಣಗೊಳಿಸುವ ಪ್ರಮಾಣಪತ್ರ

 ಅಭಿನಂದನೆಗಳು! ನೀವು AI ವರ್ಕ್ಶಾಪ್ ಲ್ಯಾಬ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ. ನೀವು ಈಗ ಈ ಕೆಳಗಿನವನ್ನು ಮಾಡಲು ಸಾದ್ಯವಾಗಿದೆ:

- ✅ ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ AI ಅನ್ವಯಿಕೆಗಳನ್ನು AZD ಟೆಂಪ್ಲೇಟ್ಗಳಿಗೆ ಪರಿವರ್ತಿಸು
- ✅ ಉತ್ಪಾದನೆ-ಸಿದ್ಧ AI ಅನ್ವಯಿಕೆಗಳನ್ನು ನಿಯೋಜಿಸು
- ✅ AI ವರ್ಕ್‌ಲೋಡ್‌ಗಳಿಗೆ ಭದ್ರತಾ ಅತ್ಯುತ್ತಮ ವಿಧಾನಗಳನ್ನು ಜಾರಿಗೆ
- ✅ AI ಅನ್ವಯಿಕೆಯ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು παρακολουθήσει ಮತ್ತು ಪೋಷಿಸು
- ✅ ಸಾಮಾನ್ಯ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸು

### ಮುಂದಿನ ಹಂತಗಳು
1. ಈ ಮಾದರಿಗಳನ್ನು ನಿಮ್ಮ ಸ್ವಂತ AI ಯೋಜನೆಗಳಿಗೆ ಅನ್ವಯಿಸಿ
2. ಸಮುದಾಯಕ್ಕೆ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಹಿಂತಿರುಗಿಸಿ ಕೊಡುಗೆ ನೀಡಿ
3. Microsoft Foundry Discord ನಲ್ಲಿ 지속적인 ಬೆಂಬಲಕ್ಕಾಗಿ ಸೇರಿಕೊಳ್ಳಿ
4. ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆಗಳಂತಹ ಬೆನ್ನುಮೂಲ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ

---

**ವರ್ಕ್ಶಾಪ್ ಪ್ರತಿಕ್ರಿಯೆ**: [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) ನಲ್ಲಿ ನಿಮ್ಮ ಅನುಭವವನ್ನು ಹಂಚಿಕೊಳ್ಳುವುದರಿಂದ ಈ ವರ್ಕ್ಶಾಪ್ ಅನ್ನು ಉತ್ತಮಗೊಳಿಸಲು ಸಹಾಯ ಮಾಡಿ.

---

**ಅಧ್ಯಾಯ ಸಂಚಲನ:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲು ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ಮುಂದಿನ**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ವಿನ್ಯಾಸ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೆ?** AZD ಮತ್ತು AI ನಿಯೋಜನೆಗಳ ಬಗ್ಗೆ ಬೆಂಬಲ ಮತ್ತು ಚರ್ಚೆಗಳಿಗೆ ನಮ್ಮ ಸಮುದಾಯಕ್ಕೆ ಸೇರಿಕೊಳ್ಳಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ನಿರಾಕರಣೆ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಯನ್ನು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದೇವೆ ಆದರೆ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅನುಮಾನಾಸ್ಪದತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿರಿಸಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಭಾಶೆಯಲ್ಲಿ ಅಧಿಕಾರೀಕ ಮೂಲ ಎಂದು ಪರಿಗಣಿಸುವುದು ಸೂಕ್ತ. ಮಹತ್ತರ ಮಾಹಿತಿ ಗಳಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವಿಕೆಗಳಿಗೆ ನಾವು ಎನ್ನಿಸಿಕೊಳ್ಳುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->