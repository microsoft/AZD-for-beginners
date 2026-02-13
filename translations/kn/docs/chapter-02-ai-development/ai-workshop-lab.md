# AI ವರ್ಕ್‌ಶಾಪ್ ಪ್ರಯೋಗಾಲಯ: ನಿಮ್ಮ AI ಪರಿಹಾರಗಳನ್ನು AZD-ಡಿಪ್ಲಾಯಬೆಲ್ ಆಗಿಸುವುದು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **➡️ ಮುಂದಿನದು**: [ಉತ್ಪಾದನಾ AI ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಪ್ರಯೋಗಶಾಲೆಯ ಅವಲೋಕನ

ಈ ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಪ್ರಯೋಗಶಾಲೆ ಅಭಿವೃದ್ಧಕರಿಗೆ ಇದ್ದ ಮೇಲು ಜಾರಿರುವ AI ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ತೆಗೆದುಕೊಳ್ಳಿ ಮತ್ತು Azure Developer CLI (AZD) ಬಳಸಿ ಅದನ್ನು ನಿಯೋಜಿಸುವ ಪ್ರಕ್ರಿಯೆಯ ಮೂಲಕ ಮಾರ್ಗದರ್ಶನ ನೀಡುತ್ತದೆ. ನೀವು Microsoft Foundry ಸೇವೆಗಳೊಂದಿಗೆ ಉತ್ಪಾದನಾ AI ನಿಯೋಜನೆಗಳಿಗೆ ಅಗತ್ಯವಿರುವ ರೂಡ್ಡಿಗಳನ್ನು ಕಲಿಯುತ್ತೀರಿ.

**ಅವಧಿ:** 2-3 ಗಂಟೆಗಳು  
**ಮಟ್ಟ:** ಮಧ್ಯಮ  
**ಭವಿಷ್ಯಾಪೇಕ್ಷಿತತೆಯ ಅಗತ್ಯಗಳು:** ಬೇಸಿಕ್ Azure ಜ್ಞಾನ, AI/ML ಸಂಪ್ರತ್ಯೆಗಳ ಪರಿಚಯ

## 🎓 ಕಲಿಕೆಯ ಉದ್ದೇಶಗಳು

ಈ ಪ್ರಯೋಗಶಾಲೆಯ ಅಂತ್ಯಕ್ಕೆ, ನೀವು ಸಾಮರ್ಥ್ಯ ಹೊಂದಿರುತ್ತೀರಿ:
- ✅ ಇರುವ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು AZD ಟೆಂಪ್ಲೇಟ್‌ಗಳಿಗೆ ಪರಿವರ್ತಿಸುವುದು
- ✅ AZD ಬಳಸಿ Microsoft Foundry ಸೇವೆಗಳನ್ನು ಸಂರಚಿಸುವುದು
- ✅ AI ಸೇವೆಗಳಿಗೆ ಸುರಕ್ಷಿತ ಕ್ರೆಡೆನ್ಷಿಯಲ್ ನಿರ್ವಹಣೆಯನ್ನು ಜಾರಿಗೆ ತಳ್ಳುವುದು
- ✅ ಮಾನಿಟರಿಂಗ್ ಜೊತೆಗೆ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದು
- ✅ ಸಾಮಾನ್ಯ AI ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಡಿಬಗ್ ಮಾಡುವುದು

## ಅಗತ್ಯಶಾಸನಗಳು

### ಅಗತ್ಯ כליಗಳು
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ಇನ್ಸ್ಟಾಲ್ ಆಗಿರಬೇಕು
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ಇನ್ಸ್ಟಾಲ್ ಆಗಿರಬೇಕು
- [Git](https://git-scm.com/) ಇನ್ಸ್ಟಾಲ್ ಆಗಿರಬೇಕು
- ಕೋಡ್ ಎಡಿಟರ್ (VS Code ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)

### Azure ಸಂಪನ್ಮೂಲಗಳು
- ಕಂಟ್ರಿಬ್ಯೂಟರ್ ಪ್ರವೇಶದೊಂದಿಗೆ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್
- Azure OpenAI ಸೇವೆಗಳಿಗೆ ಪ್ರವೇಶ (ಅಥವಾ ಪ್ರವೇಶಕೋರಿಕೆ ಸಲ್ಲಿಸುವ ಸಾಮರ್ಥ್ಯ)
- ರಿಸೋರ್ಸ್ ಗುಂಪು ರಚನೆ ಅನುಮತಿಗಳು

### ಜ್ಞಾನ ಅಗತ್ಯಗಳು
- Azure ಸೇವೆಗಳ ಮೂಲಭೂತ ಅರ್ಥ
- ಕಮಾಂಡ್-ಲೈನ್ ಇಂಟರ್ಫೇಸ್ಗಳ ಪರಿಚಯ
- AI/ML ತತ್ವಗಳ ಮೂಲಭೂತ ಜ್ಞಾನ (APIಗಳು, ಮಾದರಿ, ಪ್ರಾಂಪ್ಟ್‌ಗಳು)

## ಪ್ರಯೋಗಶಾಲೆ ಸೆಟ್‌ಅಪ್

### ಹಂತ 1: ಪರಿಸರ ತಯಾರಿ

1. **ಟೂಲ್ ಇನ್ಸ್ಟಾಲೇಶನ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# AZD ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# Azure CLI ಅನ್ನು ಪರಿಶೀಲಿಸಿ
az --version

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login
azd auth login
```

2. **ಪ್ರಯೋಗಶಾಲೆ ರೆಪೊವನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ಮಾಡ್ಯೂಲ್ 1: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ AZD ರಚನೆ ತಿಳಕೊಳ್ಳುವುದು

### AI AZD ಟೆಂಪ್ಲೇಟ್‌ನ anatomy

AI-ರೆಡಿ AZD ಟೆಂಪ್ಲೇಟ್‌ನ ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 1.1: ಸಂರಚನೆಯನ್ನು ಅನ್ವೇಷಿಸಿ**

1. **azure.yaml ಫೈಲ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
cat azure.yaml
```

**ಏನನ್ನು ನೋಡಿ:**
- AI ಘಟಕಗಳಿಗಾಗಿ ಸೇವಾ ವ್ಯಾಖ್ಯಾನಗಳು
- ಪರಿಸರ ಚರಾಂತರಗಳ ಮ್ಯಾಪಿಂಗ್‌ಗಳು
- ಹೋಸ್ಟ್ ಸಂರಚನೆಗಳು

2. **main.bicep ಮೂಲಭೂತ ಮೂಲಸೌಕರ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
cat infra/main.bicep
```

**ಹೆಚ್ಚು ಮಹತ್ವದ AI نمೂನೆಗಳನ್ನು ಗುರುತಿಸಲು:**
- Azure OpenAI ಸೇವೆ ಪ್ರೊವಿಷನಿಂಗ್
- Cognitive Search ಏಕರೂಪೀಕರಣ
- ಸುರಕ್ಷಿತ ಕೀ ನಿರ್ವಹಣೆ
- ನೆಟ್ವರ್ಕ್ ಭದ್ರತಾ ಸಂರಚನೆಗಳು

### **ಚರ್ಚಾ ಬಿಂದು:** ಈ ಪ್ಯಾಟರ್ನ್‌ಗಳು AI ಗೆ ಏಕೆ ಮಹತ್ವವಾಗಿವೆ

- **ಸೇವಾ ಅವಲಂಬನೆಗಳು**: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು ಬಹುಮಾನಂತರ ಸೇವೆಗಳನ್ನು ಸಹಕಾರು ಮಾಡಬೇಕು
- **ಭದ್ರತೆ**: API ಕీలు ಮತ್ತು ಎಂಡ್‌ ಪಾಯಿಂಟ್‌ಗಳು ಸುರಕ್ಷಿತ ನಿರ್ವಹಣೆಯನ್ನು ಅಗತ್ಯವಿದೆ
- **ಸ್ಕೇಲಿಬಿಲಿಟಿ**: AI ವರ್ಕ್‌ಲೋಡ್‌ಗಳಿಗೆ ವಿಶೇಷ ಸ್ಕೇಲಿಂಗ್ ಅಗತ್ಯಗಳು ಇರುತ್ತವೆ
- **ಖರ್ಚು ನಿರ್ವಹಣೆ**: ಸರಿಯಾಗಿ ಸಂರಚಿಸದಿದ್ದರೆ AI ಸೇವೆಗಳು ದುಬಾರಿಯಾಗಬಹುದು

## ಮಾಡ್ಯೂಲ್ 2: ನಿಮ್ಮ ಮೊದಲ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಿ

### ಹಂತ 2.1: ಪರಿಸರ ಪ್ರಾರಂಭಿಸು

1. **ಹೊಸ AZD ಪರಿಸರ ರಚಿಸಿ:**
```bash
azd env new myai-workshop
```

2. **ಅವಶ್ಯಕ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ನಿಮ್ಮ ಇಚ್ಛಿತ Azure ಪ್ರದೇಶವನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus

# ಐಚ್ಛಿಕ: ನಿರ್ದಿಷ್ಟ OpenAI ಮಾದರಿಯನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ಹಂತ 2.2: ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ

1. **AZD ಬಳಸಿ ನಿಯೋಜಿಸಿ:**
```bash
azd up
```

**`azd up` ಸಮಯದಲ್ಲಿ ಏನು ನಡೆಯುತ್ತದೆ:**
- ✅ Azure OpenAI ಸೇವೆಯನ್ನು ಪ್ರೊವಿಷನ್ ಮಾಡುತ್ತದೆ
- ✅ Cognitive Search ಸೇವೆಯನ್ನು ರಚಿಸುತ್ತದೆ
- ✅ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ App Service ಅನ್ನು ಸೆಟ್ ಮಾಡುತ್ತದೆ
- ✅ ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆಯನ್ನು ಸಂರಚಿಸುತ್ತದೆ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ
- ✅ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಮಾಡುತ್ತದೆ

2. **ನಿಯೋಜನೆ ಪ್ರಗತಿಯನ್ನು ತೋರಿಸಿಕೊಳ್ಳುವಂತೆ ಗಮನಿಸಿ** ಮತ್ತು ರಚಿಸಲ್ಪಟ್ಟಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನೋන්දಿರಿ.

### ಹಂತ 2.3: ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ

1. **ನಿಯೋಜಿಸಲಾದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
azd show
```

2. **ನಿಯೋಜಿಸಲಾದ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ತೆರೆಯಿರಿ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ:**
   - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ನಾವಿಗೇಟ್ ಮಾಡಿ
   - ಉದಾಹರಣಾ ಪ್ರಶ್ನೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
   - AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ಕೆಲಸ ಮಾಡುತ್ತಿವೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 2.1: ಟ್ರಬಲ್ಶೂಟಿಂಗ್ ಅಭ್ಯಾಸ**

** сценарಿಯೊ**: ನಿಮ್ಮ ನಿಯೋಜನೆ ಯಶಸ್ವಿಯಾಗಿದೆ ಆದರೆ AI ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತಿಲ್ಲ.

**ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಶೀಲಿಸಲು:**
1. **OpenAI API ಕీలు**: ಅವು ಸರಿಯಾಗಿ ಸೆಟ್ ಆಗಿದೆಯೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
2. **ಮಾದರಿ ಲಭ್ಯತೆ**: ನಿಮ್ಮ ರೀಜನ್ನಲ್ಲಿ ಮಾದರಿ ಬೆಂಬಲಿತವಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
3. **ನೆಟ್ವರ್ಕ್ ಸಂಪರ್ಕ**: ಸೇವೆಗಳು ಪರಸ್ಪರ ಸಂವಹನ ಮಾಡಬಹುದೇ ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
4. **RBAC ಅನುಮತಿಗಳು**: ಅಪ್ಲಿಕೇಶನ್ OpenAI ಗೆ ಪ್ರವೇಶಿಸಬಹುದೇ ಎಂದು ಪರಿಶೀಲಿಸಿ

**ಡೆಬಗ್ ಆಜ್ಞೆಗಳು:**
```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ಮಾಡ್ಯೂಲ್ 3: ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡುವುದು

### ಹಂತ 3.1: AI ಸಂರಚನೆಯ ತಿದ್ದುಪಡಿ

1. **OpenAI ಮಾದರಿಯನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡಿ:**
```bash
# ನಿಮ್ಮ ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿದ್ದರೆ ಬೇರೆ ಮಾದರಿಗೆ ಬದಲಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-4

# ಹೊಸ ಸಂರಚನೆಯೊಂದಿಗೆ ಮರುನಿಯೋಜಿಸಿ
azd deploy
```

2. **ಹೆಚ್ಚುವರಿ AI ಸೇವೆಗಳನ್ನು ಸೇರಿಸಿ:**

Document Intelligence ಸೇರಿಸಲು `infra/main.bicep` ಅನ್ನು ಸಂಪಾದಿಸಿ:

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

**ಉತ್ತಮ ಅಭ್ಯಾಸ**: ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಉತ್ಪಾದನೆಗೆ ವಿಭಿನ್ನ ಸಂರಚನೆಗಳು ಬಳಸುವುದು.

1. **ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ರಚಿಸಿ:**
```bash
azd env new myai-production
```

2. **ಉತ್ಪಾದನಾ-ನಿರ್ದಿಷ್ಟ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಉತ್ಪಾದನಾ ಪರಿಸರದಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಹೆಚ್ಚಿನ SKUಗಳನ್ನು ಬಳಸಲಾಗುತ್ತದೆ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ಹೆಚ್ಚುವರಿ ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 3.1: ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್**

**ಚಾಲೆಂಜ್**: ವೆಚ್ಚ-ಕಾರ್ಯಕ್ಷಮ ವಿಕಸನಕ್ಕಾಗಿ ಟೆಂಪ್ಲೇಟನ್ನು ಸಂರಚಿಸಿ.

**ಕಾರ್ಯಗಳು:**
1. ಯಾವ SKUs ಅನ್ನು ಫ್ರೀ/ಬೇಸಿಕ್ ಟಾಯರ್‌ಗೆ ಸೆಟ್ ಮಾಡಬಹುದು ಎಂದು ಗುರುತಿಸಿ
2. ಕನಿಷ್ಠ ವೆಚ್ಚಕ್ಕಾಗಿ ಪರಿಸರ ಚರಾಂತರಗಳನ್ನು ಸಂರಚಿಸಿ
3. ನಿಯೋಜಿಸಿ ಮತ್ತು ಉತ್ಪಾದನಾ ಸಂರಚನೆಯೊಂದಿಗೆ ವೆಚ್ಚಗಳನ್ನು ಹೋಲಿಸಿ

**ಉಪಾಯ ಸೂಚನೆಗಳು:**
- ಸಾಧ್ಯವಾದರೆ Cognitive Services ಗೆ F0 (ಫ್ರೀ) ಟೈರ್ ಬಳಸಿ
- ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ Search Service ಗೆ Basic ಟೈರ್ ಬಳಸಿ
- Functions ಗೆ Consumption ಯೋಜನೆಯನ್ನು ಪರಿಗಣಿಸಿ

## ಮಾಡ್ಯೂಲ್ 4: ಭದ್ರತೆ ಮತ್ತು ಉತ್ಪಾದನಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### ಹಂತ 4.1: ಸುರಕ್ಷಿತ ಕ್ರೆಡೆನ್ಷಿಯಲ್ ನಿರ್ವಹಣೆ

**ಪ್ರಸ್ತುತ ತೊಂದರೆ**: ಹಲವಾರು AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು API ಕೀಗಳನ್ನು ಹಾರ್ಡ್ಕೋಡ್ ಮಾಡುತ್ತವೆ ಅಥವಾ ಅಸುರಕ್ಷಿತ ಸಂಗ್ರಹಣೆ ಬಳಸು ತವೆ.

**AZD ಪರಿಹಾರ**: Managed Identity + Key Vault ಏಕರೂಪೀಕರಣ.

1. **ನಿಮ್ಮ ಟೆಂಪ್ಲೇಟ್‌ನ ಭದ್ರತಾ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# Key Vault ಮತ್ತು Managed Identity ಸಂರಚನೆಯನ್ನು ಹುಡುಕಿ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ಸರಿಯಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ:**
```bash
# ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಸರಿಯಾದ ಗುರುತಿನ ಸಂರಚನೆ ಇದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ಹಂತ 4.2: ನೆಟ್ವರ್ಕ್ ಭದ್ರತೆ

1. **ಸ್ಟ್ರೈಟ್ ಪ್ರೈವೇಟ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ** (ಇನ್ನೂ ಸಂರಚನೆಗೊಳಿಸದಿದ್ದಲ್ಲಿ):

ನಿಮ್ಮ bicep ಟೆಂಪ್ಲೇಟ್‌ಗೆ ಸೇರಿಸಿ:
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

### ಹಂತ 4.3: ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಗೋಚರತಾ

1. **Application Insights ಅನ್ನು ಸಂರಚಿಸಿ:**
```bash
# Application Insights ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಂರಚಿಸಬೇಕು
# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ನಿರ್ದಿಷ್ಟ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ:**

AI ಕಾರ್ಯಾಚರಣೆಗಳಿಗೆ ಕಸ್ಟಮ್ ಮೀಟ್ರಿಕ್‌ಗಳನ್ನು ಸೇರಿಸಿ:
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

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 4.1: ಭದ್ರತಾ ಆಡಿಟ್**

**ಕಾರ್ಯ**: ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ.

**ಚೆಕ್‌ಲಿಸ್ಟ್:**
- [ ] ಕೋಡ್ ಅಥವಾ ಸಂರಚನೆಯಲ್ಲಿ ನೇರವಾಗಿ ಹಾಕಿದ ರಹಸ್ಯಗಳಿಲ್ಲ
- [ ] ಸರ್ವೀಸ್-ಟು-ಸರ್ವೀಸ್ ಪ್ರವೇಶಕ್ಕಾಗಿ Managed Identity ಬಳಸಲಾಗಿದೆ
- [ ] Key Vault ಸಂವೇದನಾತ್ಮಕ ಸಂರಚನೆಯನ್ನು ಸಂಗ್ರಹಿಸುತ್ತದೆ
- [ ] ನೆಟ್ವರ್ಕ್ ಪ್ರವೇಶ ಸರಿಯಾಗಿ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ
- [ ] ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ

## ಮಾಡ್ಯೂಲ್ 5: ನಿಮ್ಮ ಸ್ವಂತ AI ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತನೆ

### ಹಂತ 5.1: ಮೌಲ್ಯಮಾಪನ ಕಾರ್ಯಪತ್ರ

**ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತಿಸುವ ಮೊದಲು**, ಈ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ:

1. **ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪ:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ AI ಸೇವೆಗಳನ್ನು ಬಳಸುತ್ತದೆ?
   - ಅದಕ್ಕೆ ಯಾವ compute ಸಂಪನ್ಮೂಲಗಳು ಬೇಕಾಗಿವೆ?
   - ಅದಕ್ಕೆ ಡೇಟಾಬೇಸ್ ಬೇಕಾಗಿದೆಯೆ?
   - ಸೇವೆಗಳ ಮಧ್ಯೆ ಯಾವ ಅವಲಂಬನೆಗಳಿವೆ?

2. **ಭದ್ರತಾ ಅಗತ್ಯಗಳು:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ ಸಂವೇದನಶೀಲ ಡೇಟಾ ಅನ್ನು ಹೊಂದಿದೆ?
   - ಯಾವ अनुपಾಲನಾ ಅಗತ್ಯಗಳಿವೆ?
   - ನಿಮಗೆ ಪ್ರೈವೇಟ್ ನೆಟ್ವರ್ಕಿಂಗ್ ಬೇಕೇ?

3. **ಸ್ಕೇಲಿಂಗ್ ಅಗತ್ಯಗಳು:**
   - ನಿಮ್ಮ ನಿರೀಕ್ಷಿತ ಲೋಡ್ ಏನು?
   - ನಿಮಗೆ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಬೇಕೇ?
   - ಪ್ರಾದೇಶಿಕ ಅಗತ್ಯಗಳಿವೆಯೇ?

### ಹಂತ 5.2: ನಿಮ್ಮ AZD ಟೆಂಪ್ಲೇಟ್ ರಚಿಸಿ

**ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತಿಸಲು ಈ ಮಾದರಿಯನ್ನು ಅನುಸರಿಸಿ:**

1. **ಮೂಲಭೂತ ರಚನೆ ರಚಿಸಿ:**
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

3. **ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ರಚಿಸಿ:**

**infra/main.bicep** - ಮುಖ್ಯ ಟೆಂಪ್ಲೇಟ್:
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

**infra/modules/openai.bicep** - OpenAI ಮೊ듳್ಯೂಲ್:
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

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 5.1: ಟೆಂಪ್ಲೇಟ್ ರಚನೆ ಚಾಲೆಂಜ್**

**ಚಾಲೆಂಜ್**: ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರೊಸೆಸಿಂಗ್ AI ಅಪ್ಲಿಕೇಶನ್‌ಗೆ AZD ಟೆಂಪ್ಲೇಟ್ ಸೃಷ್ಟಿಸಿ.

**ಆವಶ್ಯಕತೆಗಳು:**
- ವಿಷಯ ವಿಶ್ಲೇಷಣೆಗೆ Azure OpenAI
- OCR ಗೆ Document Intelligence
- ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್‌ಲೋಡ್‌ಗಾಗಿ Storage Account
- ಪ್ರೊಸೆಸಿಂಗ್ ಲಾಜಿಕ್‌ಗೆ Function App
- ಬಳಕೆದಾರ ಇಂಟರ್ಫೇಸ್‌ಗಾಗಿ ವೆಬ್ ಅಪ್

**ಬೋನಸ್ ಪಾಯಿಂಟ್ಸ್:**
- ಸರಿಯಾದ ದೋಷ ನಿರ್ವಹಣೆ ಸೇರಿಸಿ
- ವೆಚ್ಚ ಅಂದಾಜು ಸೇರಿಸಿ
- ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ

## ಮಾಡ್ಯೂಲ್ 6: ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಟ್ರಬಲ್ಶೂಟಿಂಗ್

### ಸಾಮಾನ್ಯ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

#### Issue 1: OpenAI Service Quota Exceeded
**ಲಕ್ಷಣಗಳು:** ನಿಯೋಜನೆ ಕ್ವೋಟಾ ದೋಷದೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ
**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕೊಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಕೊಡಾ ಹೆಚ್ಚಳಕ್ಕಾಗಿ ವಿನಂತಿ ಮಾಡಿ ಅಥವಾ ಬೇರೆ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**ಲಕ್ಷಣಗಳು:** AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ವಿಫಲವಾಗುತ್ತವೆ ಅಥವಾ ಮಾದರಿ ನಿಯೋಜನೆ ದೋಷಗಳು ಸಂಭವಿಸುತ್ತವೆ
**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರದೇಶದ ಪ್ರಕಾರ ಮಾದರಿಯ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices model list --location eastus

# ಲಭ್ಯವಿರುವ ಮಾದರಿಗೆ ನವೀಕರಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**ಲಕ್ಷಣಗಳು:** AI ಸೇವೆಗಳನ್ನು ಕರೆಸುವಾಗ 403 Forbidden ದೋಷಗಳು
**ಪರಿಹಾರಗಳು:**
```bash
# ಭೂಮಿಕೆ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ಕಾಣದ ಭೂಮಿಕೆಗಳನ್ನು ಸೇರಿಸಿ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳು

#### Issue 4: Slow AI Responses
**ಗವילום ಹೆಜ್ಜೆಗಳು:**
1. ಕಾರ್ಯಕ್ಷಮತೆ ಮೆಟ್ರಿಕ್‌ಗಾಗಿ Application Insights ಪರಿಶೀಲಿಸಿ
2. Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ OpenAI ಸೇವೆಯ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
3. ನೆಟ್ವರ್ಕ್ ಸಂಪರ್ಕ ಮತ್ತು ವಿಳಂಬವನ್ನು ಪರಿಶೀಲಿಸಿ

**ಪರಿಹಾರಗಳು:**
- ಸಾಮಾನ್ಯ ಪ್ರಶ್ನೆಗಳಿಗಾಗಿ ಕ್ಯಾಶಿಂಗ್ ಅನ್ನು ಜಾರಿಗೊಳಿಸಿ
- ನಿಮ್ಮ ಬಳಕೆದಾರಿಗೆ ಸೂಕ್ತವಾದ OpenAI ಮಾದರಿಯನ್ನು ಬಳಸಿರಿ
- ಹೆಚ್ಚಿನ ಲೋಡ್ ಪರಿಸ್ಥಿತಿಗಾಗಿ ರೀಡ್ ರೆಪ್ಲಿಕಾಗಳನ್ನು ಪರಿಗಣಿಸಿ

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 6.1: ಡಿಬಗಿಂಗ್ ಚಾಲೆಂಜ್**

**ಘಟನೆ**: ನಿಮ್ಮ ನಿಯೋಜನೆ ಯಶಸ್ವಿಯಾಗಿದೆ, ಆದರೆ ಅಪ್ಲಿಕೇಶನ್ 500 ದೋಷಗಳನ್ನು 반환ಿಸುತ್ತಿದೆ.

**ಡೆಬಗ್ ಕಾರ್ಯಗಳು:**
1. ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
2. ಸೇವಾ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ
3. प्रमಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
4. ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ

**ಬಳಸಬೇಕಾದ ಸಾಧನಗಳು:**
- ನಿಯೋಜನೆ ಪರಿಚಯಕ್ಕಾಗಿ `azd show`
- ವಿವರವಾದ ಸೇವಾ ಲಾಗ್‌ಗಳಿಗಾಗಿ Azure ಪೋರ್ಟಲ್
- ಅಪ್ಲಿಕೇಶನ್ ಟೆಲೆಮೆಟ್ರಿಗಾಗಿ Application Insights

## ಮಾಡ್ಯೂಲ್ 7: ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಆಪ್ಟಿಮೈಸೇಶನ್

### ಹಂತ 7.1: ವ್ಯಾಪಕ ಮಾನಿಟರಿಂಗ್ ಸೆಟ್ ಅಪ್ ಮಾಡಿ

1. **ಕಸ್ಟಮ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳನ್ನು ರಚಿಸಿ:**

Azure ಪೋರ್ಟಲ್‌ಗೆ ನಾವಿಗೇಟ್ ಮಾಡಿ ಮತ್ತು ಕೆಳಗಿನದೊಂದಿಗೆ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ರಚಿಸಿ:
- OpenAI ವಿನಂತಿ ಎಣಿಕೆ ಮತ್ತು ವಿಳಂಬ
- ಅಪ್ಲಿಕೇಶನ್ ದೋಷ ದರಗಳು
- ಸಂಪನ್ಮ<src>use of resource utilization</src> (Note: leave as originally intended)
- ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್

2. **ಅಲೆರ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಹೆಚ್ಚಿನ ದೋಷ ದರಿಗೆ ಎಚ್ಚರಿಕೆ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ಹಂತ 7.2: ವೆಚ್ಚ ಆಪ್ಟಿಮೈಸೇಶನ್

1. **ಪ್ರಸ್ತುತ ವೆಚ್ಚಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ:**
```bash
# ಖರ್ಚು ಡೇಟಾವನ್ನು ಪಡೆಯಲು Azure CLI ಬಳಸಿ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ವೆಚ್ಚ ನಿಯಂತ್ರಣಗಳನ್ನು ಜಾರಿಗೊಳಿಸಿ:**
- ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
- autoscaling ನೀತಿಗಳನ್ನು ಬಳಸಿ
- ವಿನಂತಿ ಕ್ಯಾಶಿಂಗ್ ಜಾರಿಗೊಳಿಸಿ
- OpenAI ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಮಾನಿಟರ್ ಮಾಡಿ

### **ಲ್ಯಾಬ್ ಅಭ್ಯಾಸ 7.1: ಕಾರ್ಯಕ್ಷಮತೆ ಆಪ್ಟಿಮೈಸೇಶನ್**

**ಕಾರ್ಯ**: ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ವೆಚ್ಚ ಎರಡಕ್ಕೂ ನಿಮ್ಮ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ.

**ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಸುಧಾರಿಸಲು:**
- ಸರಾಸರಿ ಪ್ರತಿಕ್ರಿಯಾ ಸಮಯವನ್ನು 20% ಕಡಿಮೆಮಾಡಿ
- ಮಾಸಿಕ ವೆಚ್ಚವನ್ನು 15% ಕಡಿಮೆಮಾಡಿ
- 99.9% ಅಪ್‌ಟೈಮ್ ಕಾಪಾಡಿ

**ಪ್ರಯತ್ನಿಸಬಹುದಾದ ತಂತ್ರಗಳು:**
- ಪ್ರತಿಕ್ರಿಯಾ ಕ್ಯಾಶಿಂಗ್ ಜಾರಿಗೊಳಿಸಿ
- ಟೋಕನ್ ದಕ್ಷತೆಯಿಗಾಗಿ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ
- ಸೂಕ್ತ compute SKUಗಳನ್ನು ಬಳಸಿ
- ಸರಿಯಾದ autoscaling ಅನ್ನು ಸೆಟ್ ಮಾಡಿ

## ಅಂತಿಮ ಚಾಲೆಂಜ್: ಎಂಡ್-ಟು-ಎಂಡ್ ಅನುಷ್ಠಾನ

### ಚಾಲೆಂಜ್ ದೃಶ್ಯಾವলী

ನೀವು ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI-ಚಾಲಿತ ಗ್ರಾಹಕ ಸೇವೆ ಚಾಟ್‌ಬಾಟ್ ರಚಿಸುವುದಕ್ಕೆ ನಿಯೋಜಿತರಾಗಿದೆ ಈ ಅಗತ್ಯಗಳೊಂದಿಗೆ:

**ಕಾರ್ಯಾತ್ಮಕ ಅಗತ್ಯಗಳು:**
- ಗ್ರಾಹಕ ಸಂವಹನಗಳಿಗೆ ವೆಬ್ ಇಂಟರ್ಫೇಸ್
- ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ Azure OpenAI ಏಕರೀತಿ
- Cognitive Search ಬಳಸಿ ಡಾಕ್ಯುಮೆಂಟ್ ಶೋಧ ಸಾಮರ್ಥ್ಯ
- ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ ಗ್ರಾಹಕ ಡೇಟಾಬೇಸ್‌ಗೆ ಏಕರೀತಿ
- ಬಹು-ಭಾಷಾ ಬೆಂಬಲ

**ಅಕಾರ್ಯಾತ್ಮಕ ಅಗತ್ಯಗಳು:**
- 1000 ಸಮಕಾಲೀನ ಬಳಕೆದಾರರನ್ನು ಕೈಗೊಳ್ಳಲು
- 99.9% ಅಪ್‌ಟೈಮ್ SLA
- SOC 2 ಪಾಲನೆ
- ಮಾಸಿಕ ವೆಚ್ಚ $500 ಕ್ಕಿಂತ ಕಡಿಮೆ
- ಹಲವು ಪರಿಸರಗಳಿಗೆ ನಿಯೋಜನೆ (dev, staging, prod)

### ಅನುಷ್ಠಾನ ಹಂತಗಳು

1. ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ
2. AZD 템್ಪ್ಲೇಟ್ ರಚಿಸಿ
3. ಭದ್ರತಾ ಕ್ರಮಗಳನ್ನು ಜಾರಿಗೊಳಿಸಿ
4. ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟಿಂಗ್ ಸೆಟ್ ಮಾಡಿ
5. ನಿಯೋಜನೆ ಪೈಪ್‌ಲೈನ್‌ಗಳನ್ನು ಸೃಷ್ಟಿಸಿ
6. ಪರಿಹಾರವನ್ನು ದಾಖಲೆ ಗೊಳಿಸಿ

### ಮೌಲ್ಯಮಾಪನ ಮಾನದಂಡಗಳು

- ✅ **ಕಾರ್ಯಕ್ಷಮತೆ**: ಇದು ಎಲ್ಲಾ ಅಗತ್ಯಗಳನ್ನು ಪೂರೈಸುತ್ತದೆಯೇ?
- ✅ **ಭದ್ರತೆ**: ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಜಾರಿಗೊಳಿಸಲಾಗಿದೆದೆ?
- ✅ **ಸ್ಕೇಲಿಬಿಲಿಟಿ**: ಲೋಡ್ ಅನ್ನು ಕೈಗೊಳ್ಳಬಹುದೇ?
- ✅ **ನಿರ್ವಹಣೆ ಯೋಗ్యత**: ಕೋಡ್ ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಉತ್ತಮವಾಗಿ ಸಂಘಟಿತವೇ?
- ✅ **ವೆಚ್ಚ**: ಇದು ಬಜೆಟಿನೊಳಗೆಯೇ ಉಳಿಯುತ್ತದೆಯೇ?

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### Microsoft ಡಾಕ್ಯುಮೆಂಟೇಶನ್
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### ಉದಾಹರಣಾ ಟೆಂಪ್ಲೇಟ್‌ಗಳು
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ಪೂರ್ಣಗೊಳಿಕೆಯ ಪ್ರಮಾಣಪತ್ರ
Congratulations! You've completed the AI Workshop Lab. You should now be able to:

- ✅ ಪ್ರಸ್ತುತ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು AZD ಟೆಂಪ್ಲೇಟುಗಳಿಗೆ ಪರಿವರ್ತಿಸಿ
- ✅ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ
- ✅ AI ಕಾರ್ಯಭಾರಗಳಿಗೆ ಸುರಕ್ಷತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ✅ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ ಮತ್ತು ಸುಧಾರಿಸಿ
- ✅ ಸಾಮಾನ್ಯ ನಿಯೋಜನೆಯ ಸಮಸ್ಯೆಗಳನ್ನು ಪತ್ತೆಹಚ್ಚಿ ಮತ್ತು ಪರಿಹರಿಸಿ

### ಮುಂದಿನ ಹಂತಗಳು
1. ಈ ಮಾದರಿಗಳನ್ನು ನಿಮ್ಮದೇ AI ಯೋಜನೆಗಳಲ್ಲಿ ಅನ್ವಯಿಸಿ
2. ಸಮುದಾಯಕ್ಕೆ ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ಕೊಡುಗೆ ನೀಡಿ
3. ನಿರಂತರ ಬೆಂಬಲಕ್ಕಾಗಿ Microsoft Foundry Discord‌ಗೆ ಸೇರಿ
4. ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆಗಳಂತಹ ಉನ್ನತ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ

---

**ವರ್ಕ್‌ಶಾಪ್ ಪ್ರತಿಕ್ರಿಯೆ**: ನಮ್ಮನ್ನು ಈ ವರ್ಕ್‌ಶಾಪ್ ಅನ್ನು ಸುಧಾರಿಸಲು ನಿಮ್ಮ ಅನುಭವವನ್ನು [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) ನಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳಿ.

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **➡️ ಮುಂದಿನ**: [ಉತ್ಪಾದನಾ AI ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೆ?** AZD ಮತ್ತು AI ನಿಯೋಜನೆಗಳ ಬಗ್ಗೆ ಬೆಂಬಲ ಮತ್ತು ಚರ್ಚೆಗಾಗಿ ನಮ್ಮ ಸಮುದಾಯದಲ್ಲಿ ಸೇರಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಮಂಜಸ್ಯತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿಡಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ನಿರ್ಣಾಯಕ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಗ್ರಹಿಕೆಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥೈಸಿಕೆಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->