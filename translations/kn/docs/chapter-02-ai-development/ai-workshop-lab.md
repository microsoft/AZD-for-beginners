# AI ಕಾರ್ಯಾಗಾರ ಲ್ಯಾಬ್: ನಿಮ್ಮ AI ಪರಿಹಾರಗಳನ್ನು AZD-ಡಿಪ್ಲಾಯ್ ಮಾಡಲು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದೆ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ಮುಂದಕ್ಕೆ**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ಕಾರ್ಯಾಗಾರ ಅವಲೋಕನ

ಈ ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ಲ್ಯಾಬ್ ಅಭಿವೃದ್ಧಿಪಡಕರು ಈಗಾಗಲೇ ಇರುವ AI ಟೆಂಪ್ಲೇಟ್ ತೆಗೆದು ಅದನ್ನು Azure Developer CLI (AZD) ಬಳಸಿ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಪ್ರಕ್ರಿಯೆಯ ಮೂಲಕ ಮಾರ್ಗದರ್ಶನ ಮಾಡುತ್ತದೆ. ನೀವು Microsoft Foundry ಸೇವೆಗಳನ್ನು ಬಳಸಿಕೊಂಡು ಪ್ರೊಡಕ್ಷನ್ AI ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಳಿಗಾಗಿ ಅಗತ್ಯವಾದ ಪ್ಯಾಟರ್ನ್ಗಳನ್ನು ಕಲಿಯುತ್ತೀರಿ.

**ಅವಧಿ:** 2-3 ಘಂಟೆ  
**ಮಟ್ಟ:** ಮಧ್ಯಮ  
**ಪೂರ್ವಶರತ್ತುಗಳು:** ಮೂಲ Azure ಜ್ಞಾನ, AI/ML ತತ್ವಗಳ ಪರಿಚಯ

## 🎓 ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಕಾರ್ಯಾಗಾರದ ಕೊನೆಗೆ, ನೀವು ಕೆಳಕಂಡವುಗಳನ್ನು ಮಾಡಲು ಸಾಮರ್ಥ್ಯವಿರುತ್ತದೆ:
- ✅ ಇರುವ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು AZD ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬಳಸುವಂತೆ ಪರಿವರ್ತಿಸಲು
- ✅ AZD ಬಳಸಿ Microsoft Foundry ಸೇವೆಗಳನ್ನು कॉನ್ಫಿಗರ್ ಮಾಡಲು
- ✅ AI ಸೇವೆಗಳಿಗೆ ಸುರಕ್ಷಿತ ಕ್ರೆಡೆನ್ಶಿಯಲ್ ನಿರ್ವಹಣೆ ಜಾರಿಗೆ ಹಾಕಲು
- ✅ ಮೇಲ್ವಿಚಾರಣೆ ಸಹಿತ ಪ್ರೊಡಕ್ಷನ್-ಸಿದ್ಧ AI ಅಪ್ಲಿಕೇಶನ್ಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಲು
- ✅ ಸಾಮಾನ್ಯ AI ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಸ್ಯಾಂಗಳನ್ನು ಪರಿಹರಿಸಲು

## ಪೂರ್ವಶರತ್ತುಗಳು

### ಅಗತ್ಯ ಸಾಧನಗಳು
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- [Git](https://git-scm.com/) ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- ಕೋಡ್ ಎಡಿಟರ್ (VS Code ಶಿಫಾರಸು ಮಾಡಿಸಲಾಗಿದೆ)

### Azure ಸಂಪನ್ಮೂಲಗಳು
- Contributor ಪ್ರವೇಶವಿರುವ Azure سب್ಸ್ಕ್ರಿಪ್ಶನ್
- Microsoft Foundry Models ಸೇವೆಗಳಿಗೆ ಪ್ರವೇಶ (ಅಥವಾ ಪ್ರವೇಶಕ್ಕಾಗಿ ವಿನಂತಿ ಮಾಡುವ ಸಾಮರ್ಥ್ಯ)
- ರಿಸೋರ್ಸ್ ಗ್ರೂಪ್ ಸೃಷ್ಟಿಸುವ ಅನುಮತಿಗಳು

### ಜ್ಞಾನ ಪೂರ್ವಶರತ್ತುಗಳು
- Azure ಸೇವೆಗಳ ಮೂಲ ಭಾವನೆ
- ಕಮಾಂಡ್-ಲೈನ್ ಇಂಟರ್ಫೇಸ್ಗಳ ಪರಿಚಯ
- AI/ML ಮೂಲ ತತ್ವಗಳು (APIಗಳು, ಮಾದರಿಗಳು, ಪ್ರಾಂಪ್ಟ್‌ಗಳು)

## ಲ್ಯಾಬ್ ಸೆಟಪ್

### ಹಂತ 1: ಪರಿಸರ ಸಿದ್ಧತೆ

1. **ಉಪಕರಣಗಳ ಸ್ಥಾಪನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
# AZD ಸ್ಥಾಪನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd version

# Azure CLI ಅನ್ನು ಪರಿಶೀಲಿಸಿ
az --version

# Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login
azd auth login
```

2. **ಕಾರ್ಯಾಗಾರ ರೆಪೊ ರೆಪೊನ್ನು ಕ್ಲೋನ್ ಮಾಡಿ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## ಮೋಡ್ಯೂಲ್ 1: AI ಅಪ್ಲಿಕೇಶನ್ಗಳಿಗಾಗಿ AZD ರಚನೆ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### AI AZD ಟೆಂಪ್ಲೇಟಿನ ರಚನೆ ಭಾಗಗಳು

AI-ತೆಗೆ ಸಿದ್ಧ AZD 템್ಪ್ಲೇಟ್‌ನ ಪ್ರಮುಖ ಫೈಲ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:

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

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 1.1: ಕಾನ್ಫಿಗರೇಶನ್ ಅನ್ವೇಷಣೆ**

1. **azure.yaml ಫೈಲ್ ಅನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
cat azure.yaml
```

**ಎನ್ನನ್ನು ಕಡೆಗಣಿಸಬೇಕೆಂದು ನೋಡಿ:**
- AI ಘಟಕಗಳ ಸೇವೆ ವ್ಯಾಖ್ಯಾನಗಳು
- ವಾತಾವರಣ ಚರ ಮ್ಯಾಪಿಂಗ್‌ಗಳು
- ہوس್ಟ್ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು

2. **main.bicep ಮೂಲಸೌಕರ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
cat infra/main.bicep
```

**ಗುರುತ್ವದ AI ಪ್ಯಾಟರ್ನ್ಗಳು ಪಡೆಯಬೇಕಾದವು:**
- Microsoft Foundry Models ಸೇವೆಯ ಪ್ರಾವಿಡಿಂಗ್
- Cognitive Search ಏಕೀಕರಣ
- ಸುರಕ್ಷಿತ ಕೀ ನಿರ್ವಹಣೆ
- ನೆಟ್‌ವರ್ಕ್ ಸುರಕ್ಷತಾ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು

### **ಚರ್ಚಾ ವಿಷಯ:** AIಗಾಗಿ ಈ ಪ್ಯಾಟರ್ನ್ಗಳು ಯಾಕೆ అవసರ?

- **ಸೇವಾ ಅವಲಂಬನೆಗಳು**: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ ಹೆಚ್ಚಿನ ಬಾರಿ ವಿವಿಧ ಸಂಯೋಜಿತ ಸೇವೆಗಳ ಅಗತ್ಯವಿರುತ್ತದೆ
- **ಸುರಕ್ಷತೆ**: API ಕೀಸ್ ಮತ್ತು ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ನಿರ್ವಹಿಸಬೇಕು
- **ಸ್ಕೇಲಬಿಲಿಟಿ**: AI ವರ್ಕ್‌ಲೋಡ್‌ಗಳಿಗೆ ವಿಶಿಷ್ಟ ಸ್ಕೇಲಿಂಗ್ ಅವಶ್ಯಕತೆಗಳಿವೆ
- **ಖರ್ಚು ನಿರ್ವಹಣೆ**: ಸಮರ್ಪಕವಾಗಿ ಕಾನ್ಫಿಗರ್ ಮಾಡದಿದ್ದರೆ AI ಸೇವೆಗಳು ದುಬಾರಿ ಆಗಬಹುದು

## ಮೋಡ್ಯೂಲ್ 2: ನಿಮ್ಮ ಮೊದಲ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ

### ಹಂತ 2.1: ಪರಿಸರ ಪ್ರಾರಂಭಿಸು

1. **ಹೊಸ AZD ಪರಿಸರವನ್ನು ಸೃಜಿಸಿ:**
```bash
azd env new myai-workshop
```

2. **ಬೇಕಾದ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ನಿಮ್ಮ ಇಚ್ಛಿತ Azure ಪ್ರದೇಶವನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus

# ಐಚ್ಛಿಕ: ನಿರ್ದಿಷ್ಟ OpenAI ಮಾದರಿಯನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ಹಂತ 2.2: ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ

1. **AZD ಬಳಸಿ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ:**
```bash
azd up
```

**`azd up` ನಡೆಯುವಾಗ ಏನಾಗುತ್ತದೆ:**
- ✅ Microsoft Foundry Models ಸೇವೆಯನ್ನು ಪ್ರಾವિઝನ್ ಮಾಡುತ್ತದೆ
- ✅ Cognitive Search ಸೇವೆಯನ್ನು ರಚಿಸುತ್ತದೆ
- ✅ ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ App Service ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುತ್ತದೆ
- ✅ ನೆಟ್‌ವರ್ಕಿಂಗ್ ಮತ್ತು ಸುರಕ್ಷತೆಯನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತದೆ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ
- ✅ ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಮಾಡುತ್ತದೆ

2. **ಡಿಪ್ಲಾಯ್ ಪ್ರಗತಿಯನ್ನು ನಿಗಾದಿಸಿ** ಮತ್ತು ಸೃಷ್ಟಿಯಾಗುತ್ತಿರುವ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಗಮನಿಸಿ.

### ಹಂತ 2.3: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ ಪರಿಶೀಲಿಸಿ

1. **ಡಿಪ್ಲಾಯ್ ಮಾಡಿದ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪರಿಶೀಲಿಸಿ:**
```bash
azd show
```

2. **ಡಿಪ್ಲಾಯ್ಡ್ ಅಪ್ಲಿಕೇಶನ್ ತೆರೆಯಿರಿ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI ಕಾರ್ಯಶೀಲತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ:**
   - ವೆಬ್ ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ತೆರಳಿ
   - ಮಾದರಿ ಕ್ವೆರಿಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ
   - AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ಸರಿ ಕೆಲಸ ಮಾಡುತ್ತವೆಯೆಂದು ಪರಿಶೀಲಿಸಿ

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 2.1: ಡಿಬಗಿಂಗ್ ಅಭ್ಯಾಸ**

**ದೃಷ್ಯಾವಳಿ**: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಯಶಸ್ವಿಯಾಗಿದೆ ಆದರೆ AI ಪ್ರತಿಕ್ರಿಯೆ ನೀಡುತ್ತಿಲ್ಲ.

**ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಶೀಲನೆ:**
1. **OpenAI API ಕೀಸ್**: ಅವು ಸರಿಯಾಗಿ ಸೆಟ್ ಆಗಿದ್ದಾರೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
2. **ಮಾದರಿಯ ಲಭ್ಯತೆ**: ನಿಮ್ಮ ರೀಜನ್ನಲ್ಲಿ ಮಾದರಿ ಬೆಂಬಲಿತವಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
3. **ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ**: ಸೇವೆಗಳು ಸಂವಹನ ಮಾಡಬಹುದು ಎಂದು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಿ
4. **RBAC ಅನುಮತಿಗಳು**: ಅಪ್‌ಲಿಕೇಶನ್ OpenAI ಗೆ ಪ್ರವೇಶಿಸಬಹುದೇ ಎಂದು ಪರಿಶೀಲಿಸಿ

**ಡಿಬಗರಿಂಗ್ ಕಮಾಂಡ್‌ಗಳು:**
```bash
# ಪರಿಸರ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get-values

# ಅಳವಡಿಕೆಯ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ಅಳವಡಿಕೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## ಮೋಡ್ಯೂಲ್ 3: ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗನುಗುಣವಾಗಿ AI ಅಪ್ಲಿಕೇಶನ್ಗಳನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಿ

### ಹಂತ 3.1: AI ಕಾನ್ಫಿಗರೇಶನ್ ಬದಲಿಸಿ

1. **OpenAI ಮಾದರಿಯನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡಿ:**
```bash
# ಬೇರೆ ಮಾದರಿಗೆ ಬದಲಿಸಿ (ನಿಮ್ಮ ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿದ್ದರೆ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ಹೊಸ ಸಂರಚನೆಯೊಂದಿಗೆ ಮರು ನಿಯೋಜಿಸಿ
azd deploy
```

2. **ಹೆಚ್ಚು AI ಸೇವೆಗಳನ್ನು ಸೇರಿಸಿ:**

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

### ಹಂತ 3.2: ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು

**ಉತ್ತಮ ಅಭ್ಯಾಸ**: ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಪ್ರೊಡಕ್ಷನ್‌ಗಾಗಿ ವಿಭಿನ್ನ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು.

1. **ಪ್ರೊಡಕ್ಷನ್ ಪರಿಸರವನ್ನು ಸೃಜಿಸಿ:**
```bash
azd env new myai-production
```

2. **ಪ್ರೊಡಕ್ಷನ್-ನಿರ್ದಿಷ್ಟ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಉತ್ಪಾದನೆಯಲ್ಲಿ ಸಾಮಾನ್ಯವಾಗಿ ಹೆಚ್ಚಿನ SKUಗಳನ್ನು ಬಳಸಲಾಗುತ್ತದೆ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# ಅತಿರಿಕ್ತ ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 3.1: ವೆಚ್ಚ tốiಮೀಕರಣ**

**ಚಾಲೆಂಜ್**: ಡೆವಲಪ್‌ಮೆಂಟ್ ಉದ್ದೇಶಗಳಿಗೆ ವೆಚ್ಚ-ಫ್ರೆಂಡ್‌ಲಿ ಆಗುವಂತೆ ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ.

**ಕಾರ್ಯಗಳು:**
1. ಉಚಿತ/ಬೇಸಿಕ್ ಟಿಯರ್‌ಗೆ ಸೆಟ್ ಮಾಡಬಹುದಾದ SKUs ಗುರುತಿಸಿ
2. ಕನಿಷ್ಠ ವೆಚ್ಚಕ್ಕೆ ವಾತಾವರಣ ಚರಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
3. ಡಿಪ್ಲಾಯ್ ಮಾಡಿ ಮತ್ತು ಪ್ರೊಡಕ್ಷನ್ ಕಾನ್ಫಿಗರೇಶನ್ಗಿಂತ ವೆಚ್ಚವನ್ನು ಹೋಲಿಸಿ

**ಉಪಾಯ ಸೂಚನೆಗಳು:**
- ಸಾಧ್ಯವಾದರೆ Cognitive Services ಗೆ F0 (ಉಚಿತ) ಟಿಯರ್ ಬಳಸಿ
- ಅಭಿವೃದ್ಧಿಗಾಗಿ Search Service ಗೆ Basic ಟಿಯರ್ ಬಳಸಿ
- Functions ಗಾಗಿ Consumption ಪ್ಲಾನ್ ಪರಿಗಣಿಸಿ

## ಮೋಡ್ಯೂಲ್ 4: ಸುರಕ್ಷತೆ ಮತ್ತು ಪ್ರೊಡಕ್ಷನ್ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### ಹಂತ 4.1: ಸುರಕ್ಷಿತ ಕ್ರೆಡೆನ್ಶಿಯಲ್ ನಿರ್ವಹಣೆ

**ಪ್ರಸ್ತುತ ಸಮಸ್ಯೆ**: ಹಲವಾರು AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳು API ಕೀಸ್ ಅನ್ನು ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡುತ್ತವೆ ಅಥವಾ ಅಸುರಕ್ಷಿತ ಸ್ಟೋರೇಜ್ ಬಳಸುತ್ತವೆ.

**AZD ಪರಿಹಾರ**: Managed Identity + Key Vault ಏಕೀಕರಣ.

1. **ಟೆಂಪ್ಲೇಟಿನಲ್ಲಿನ ಸುರಕ್ಷತಾ ಕಾನ್ಫಿಗರೇಶನ್ ಪರಿಶೀಲಿಸಿ:**
```bash
# Key Vault ಮತ್ತು Managed Identity ಸಂರಚನೆಯನ್ನು ಹುಡುಕಿ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದೆಯೆಂದು ಪರಿಶೀಲಿಸಿ:**
```bash
# ವೆಬ್ ಆಪ್‌ಗೆ ಸರಿಯಾದ ಗುರುತಿನ ಸಂರಚನೆ ಇದೆ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ಹಂತ 4.2: ನೆಟ್‌ವರ್ಕ್ ಸುರಕ್ಷತೆ

1. **ಪ್ರೈವೇಟ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ** (ಇದನ್ನು ಈಗಾಗಲೇ ಕಾನ್ಫಿಗರ್ ಮಾಡಿಲ್ಲದಿದ್ದರೆ):

ನಿಮ್ಮ bicep 템್ಪ್ಲೇಟ್‌ಗೆ ಸೇರಿಸಿ:
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

### ಹಂತ 4.3: ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಅಬ್ಜರ್ವೆಬಿಲಿಟಿ

1. **Application Insights ಅನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ:**
```bash
# Application Insights ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಸಂರಚಿಸಬೇಕು
# ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-ನಿರ್ದಿಷ್ಟ ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ:**

AI ಕಾರ್ಯಾಚರಣೆಗಳಿಗಾಗಿ ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಸೇರಿಸಿ:
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

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 4.1: ಸುರಕ್ಷತಾ ಆಡಿಟ್**

**ಕಾರ್ಯ**: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅನ್ನು ಸುರಕ್ಷತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳಿಗೆ ಪರಿಶೀಲಿಸಿ.

**ಚೆಕ್‌ಲಿಸ್ಟ್:**
- [ ] ಕೋಡ್ ಅಥವಾ ಕಾನ್ಫಿಗರೇಶನ್‌ನಲ್ಲಿ ಯಾವುದೇ ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡಿದ ಸೀಕ್ರೆಟ್ ಇಲ್ಲ
- [ ] ಸರ್ವಿಸ್-ಟು-ಸರ್ವಿಸ್ ಪ್ರಮಾಣೀಕರಣಕ್ಕಾಗಿ Managed Identity ಬಳಸಲಾಗಿದೆ
- [ ] ಸಂವೇದನಶೀಲ ಕಾನ್ಫಿಗರೇಶನ್ Key Vault ನಲ್ಲಿ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- [ ] ನೆಟ್‌ವರ್ಕ್ ಪ್ರವೇಶವನ್ನು ಸರಿಯಾಗಿ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ
- [ ] ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಲಾಗಿಂಗ್ ಸಕ್ರಿಯಗೊಂಡಿವೆ

## ಮೋಡ್ಯೂಲ್ 5: ನಿಮ್ಮದೇ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರಿವರ್ತನೆ ಮಾಡುವುದು

### ಹಂತ 5.1: ಅಸೆಸ್ಮೆಂಟ್ ವರ್ಕ್‌ಶೀಟ್

**ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರಿವರ್ತಿಸುವ ಮೊದಲು**, ಈ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ:

1. **ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪ:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ AI ಸೇವೆಗಳನ್ನು ಬಳಸುತ್ತದೆ?
   - ಅದು ಯಾವ کمپ್ಯೂಟ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಗತ್ಯವಿದೆ?
   - ಅದು ಡೇಟಾಬೇಸ್ ಅಗತ್ಯವಿದೆಯೇ?
   - ಸೇವೆಗಳ ಮಧ್ಯೆ ಅವಲಂಬನೆಗಳು ಯಾವುವು?

2. **ಸುರಕ್ಷತಾ ಅವಶ್ಯಕತೆಗಳು:**
   - ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಯಾವ ಸಂವೇದನಶೀಲ ಡೇಟಾವನ್ನು ಹ್ಯಾಂಡಲ್ ಮಾಡುತ್ತದೆ?
   - ನೀವು ಯಾವ ಅನುಪಾಲನಾ ಅಗತ್ಯಗಳನ್ನು ಹೊಂದಿದ್ದೀರಿ?
   - ನಿಮಗೆ ಪ್ರೈವೇಟ್ ನೆಟ್ವರ್ಕಿಂಗ್ ಬೇಕೇ?

3. **ಸ್ಕೇಲಿಂಗ್ ಅವಶ್ಯಕತೆಗಳು:**
   - ನಿಮ್ಮ ನಿರೀಕ್ಷಿತ ಲೋಡ್ ಎಷ್ಟು?
   - ನಿಮಗೆ ಆಟೋ-ಸ್ಕೇಲಿಂಗ್ ಬೇಕೇ?
   - ಪ್ರಾದೇಶಿಕ ಅಗತ್ಯಗಳಿದೆಯೆ?

### ಹಂತ 5.2: ನಿಮ್ಮ AZD 템್ಪ್ಲೇಟ್ ರಚಿಸಿ

**ನಿಮ್ಮ ಅಪ್ಲಿಕೇಶನ್ ಪರಿವರ್ತಿಸಲು ಈ ಪ್ಯಾಟರ್ನ್ ಅನುಸರಿಸಿ:**

1. **ಮೂಲಭೂತ ರಚನೆಯನ್ನು ಸೃජಿಸಿ:**
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

3. **ಮೂಲಸೌಕರ್ಯ 템್ಪ್ಲೇಟ್ಗಳನ್ನು ರಚಿಸಿ:**

**infra/main.bicep** - ಮುಖ್ಯ 템್ಪ್ಲೇಟ್:
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

**infra/modules/openai.bicep** - OpenAI ಮೊ듯್ಯೂಲ್:
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

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 5.1: 템್ಪ್ಲೇಟ್ ರಚನೆ ಚಾಲೆಂಜ್**

**ಚಾಲೆಂಜ್**: ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರೊಸೆಸ್ ಮಾಡುವ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ AZD 템್ಪ್ಲೇಟ್ ರಚಿಸಿ.

**ಅವಶ್ಯಕತೆಗಳು:**
- ವಿಷಯ ವಿಶ್ಲೇಷಣೆಯಿಗಾಗಿ Microsoft Foundry Models
- OCRಗಾಗಿ Document Intelligence
- ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್ಲೋಡ್‌ಗಳುಗಾಗಿ Storage Account
- ಪ್ರೊಸೆಸಿಂಗ್ ಲಾಜಿಕ್ಗಾಗಿ Function App
- ಬಳಕೆದಾರ ಇಂಟರ್‌ಫೇಸಿಗಾಗಿ ವೆಬ್ ಆಪ್

**ಬೋನಸ್ ಪಾಯಿಂಟ್ಸ್:**
- ಸರಿಯಾದ ಎರರ್ ಹ್ಯಾಂಡ್ಲಿಂಗ್ ಸೇರಿಸಿ
- ವೆಚ್ಚ ಅಂದಾಜನ್ನು ಸೇರಿಸಿ
- ಮೇಲ್ವಿಚಾರಣಾ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ

## ಮೋಡ್ಯೂಲ್ 6: ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ತಿರಸ್ಕರಣೆ

### ಸಾಮಾನ್ಯ ಡಿಪ್ಲಾಯ್ ಸಮಸ್ಯೆಗಳು

#### ಸಮಸ್ಯೆ 1: OpenAI ಸೇವೆ ಕ್ವೂಟಾ ಮೀರಿದೆ
**ಲಕ್ಷಣಗಳು:** ಡಿಪ್ಲಾಯ್ ವೈಫಲ್ಯವು ಕ್ವೋಟಾ ದೋಷವನ್ನು ತೋರಿಸುತ್ತದೆ
**ಉಪಾಯಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಕ್ವೋಟಾ ಹೆಚ್ಚಳಕ್ಕಾಗಿ ವಿನಂತಿ ಮಾಡಿ ಅಥವಾ ಬೇರೆ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up
```

#### ಸಮಸ್ಯೆ 2: ಮಾದರಿ ರೀಜನ್‌ನಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ
**ಲಕ್ಷಣಗಳು:** AI ಪ್ರತಿಕ್ರಿಯೆಗಳು ವಿಫಲವಾಗುತ್ತವೆ ಅಥವಾ ಮಾದರಿ ಡಿಪ್ಲಾಯ್ ದೋಷಗಳು ಸಂಭವಿಸುತ್ತವೆ
**ಉಪಾಯಗಳು:**
```bash
# ಪ್ರದೇಶಗಳ ಪ್ರಕಾರ ಮಾದರಿಯ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices model list --location eastus

# ಲಭ್ಯವಿರುವ ಮಾದರಿಗೆ ನವೀಕರಿಸಿ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### ಸಮಸ್ಯೆ 3: ಅನುಮತಿ ಸಮಸ್ಯೆಗಳು
**ಲક્ષણಗಳು:** AI ಸೇವೆಗಳನ್ನು ಕರೆದಾಗ 403 Forbidden ದೋಷಗಳು
**ಉಪಾಯಗಳು:**
```bash
# ಭೂಮಿಕಾ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ಕಾಣದ ಭೂಮಿಕೆಗಳನ್ನು ಸೇರಿಸಿ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ಕಾರ್ಯಕ್ಷಮತೆ ಸಮಸ್ಯೆಗಳು

#### ಸಮಸ್ಯೆ 4: ನಿಧಾನವಾದ AI ಪ್ರತಿಕ್ರಿಯೆಗಳು
**ಜದೃಪಣಾ ಕ್ರಮಗಳು:**
1. ಕಾರ್ಯಕ್ಷಮತೆ ಮೆಟ್ರಿಕ್‌ಗಳಿಗಾಗಿ Application Insights ಪರಿಶೀಲಿಸಿ
2. Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ OpenAI ಸೇವಾ ಮೆಟ್ರಿಕ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
3. ನೆಟ್‌ವರ್ಕ್ ಸಂಪರ್ಕ ಮತ್ತು ಲೇಟನ್ಸಿ ಪರಿಶೀಲಿಸಿ

**ಉಪಾಯಗಳು:**
- ಸಾಮಾನ್ಯ ಕ್ವೆರಿಗಳಿಗಾಗಿ ಕ್ಯಾಶಿಂಗನ್ನು ಜಾರಿ ಮಾಡಿ
- ನಿಮ್ಮ ಬಳಕೆಗೆ ಸೂಕ್ತ OpenAI ಮಾದರಿಯನ್ನು ಬಳಸಿ
- ಹೆಚ್ಚಿದ ಲೋಡ್ ಸನ್ನಿವೇಶಗಳಿಗೆ ರೀಡ್ ರೆಪ್ಲಿಕಾಗಳನ್ನು ಪರಿಗಣಿಸಿ

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 6.1: ಡಿಬಗ್ಗಿಂಗ್ ಚಾಲೆಂಜ್**

**ದೃಷ್ಯಾವಳಿ**: ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಯಶಸ್ವಿಯಾಗಿದೆ, ಆದರೆ ಅಪ್ಲಿಕೇಶನ್ 500 ದೋಷಗಳನ್ನು ತರುತ್ತಿದೆ.

**ಡಿಬಗ್ಗಿಂಗ್ ಕಾರ್ಯಗಳು:**
1. ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
2. ಸೇವಾ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ
3. ಪ್ರಮಾಣೀಕರಣವನ್ನು ಪರೀಕ್ಷಿಸಿ
4. ಕಾನ್ಫಿಗರೇಶನ್ ಪರಿಶೀಲಿಸಿ

**ಬಳಸಬೇಕಾದ ಸಾಧನಗಳು:**
- ಡಿಪ್ಲಾಯ್ ಅವಲೋಕನಕ್ಕೆ `azd show`
- ವಿವರವಾದ ಸೇವಾ ಲಾಗ್‌ಗಳಿಗೆ Azure ಪೋರ್ಟಲ್
- ಅಪ್ಲಿಕೇಶನ್ ಟೆಲಿಮೆಟ್ರಿಗಾಗಿ Application Insights

## ಮೋಡ್ಯೂಲ್ 7: ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ತಕ್ಕಮಟ್ಟಿನಲ್ಲಿ ಅופטಿಮೈಸೇಶನ್

### ಹಂತ 7.1: ವಿಸ್ತೃತ ಮೇಲ್ವಿಚಾರಣೆ ಸ್ಥಾನಗೊಳ್ಳಿಸಿ

1. **ಕಸ್ಟಮ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗಳನ್ನು ರಚಿಸಿ:**

Azure ಪೋರ್ಟಲ್‌ಗೆ ಹೋಗಿ ಮತ್ತು ಕೆಳಗಿನವುವುದನ್ನು ಒಳಗೊಂಡ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ರಚಿಸಿ:
- OpenAI ವಿನಂತಿಗಳ ಸಂಖ್ಯೆ ಮತ್ತು ಲೇಟನ್ಸಿ
- ಅಪ್ಲಿಕೇಶನ್ ದೋಷ ದರಗಳು
- ಸಂಪನ್ಮೂಲ ಬಳಕೆ
- ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್

2. **ಅಲರ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ:**
```bash
# ಹೆಚ್ಚಿದ ದೋಷ ದರದ ಬಗ್ಗೆ ಎಚ್ಚರಿಕೆ
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ಹಂತ 7.2: ವೆಚ್ಚ tốiಮೀಕರಣ

1. **ಪ್ರಸ್ತುತ ವೆಚ್ಚಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ:**
```bash
# ಖರ್ಚು ಡೇಟಾವನ್ನು ಪಡೆಯಲು Azure CLI ಅನ್ನು ಬಳಸಿ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ವೆಚ್ಚ ನಿಯಂತ್ರಣೆಗಳನ್ನು ಜಾರಿ ಮಾಡಿ:**
- ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
- ಆಟೋಸ್ಕೇಲಿಂಗ್ ನೀತಿಯ ಬಳಕೆ
- ವಿನಂತಿ ಕ್ಯಾಶಿಂಗ್ ಜಾರಿ ಮಾಡುವುದು
- OpenAI ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಗಮನಿಸಿ

### **ಲ್ಯಾಬ್ ವ್ಯಾಯಾಮ 7.1: ಕಾರ್ಯಕ್ಷಮತೆ tốiಮೀಕರಣ**

**ಕಾರ್ಯ**: ನಿಮ್ಮ AI ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ವೆಚ್ಚ ಎರಡರಿಗೂ ತಕ್ಕಮಟ್ಟಿನಲ್ಲಿ tốiಮೈಸ್ ಮಾಡಿ.

**ಸುಧಾರಿಸಲು ಉದ್ದೇಶಿತ ಮೆಟ್ರಿಕ್‌ಗಳು:**
- ಸರಾಸರಿ ಪ್ರತಿಕ್ರಿಯೆ ಸಮಯವನ್ನು 20% ಕಡಿಮೆಯಾಗಿಸಿ
- ಮಾಸಿಕ ವೆಚ್ಚವನ್ನು 15% ಕಡಿಮೆ ಮಾಡಿ
- 99.9% ಅಪ್ಲೈನ್‍ಟೈಮ್ ನಿರ್ವಹಿಸಿ

**ಪ್ರಯತ್ನಿಸಲು ತಂತ್ರಗಳು:**
- ಪ್ರತಿಕ್ರಿಯೆ ಕ್ಯಾಶಿಂಗ್ ಜಾರಿ ಮಾಡಿ
- ಟೋಕನ್ ಕಾರ್ಯಕ್ಷಮತೆಗೆ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು tốiಮೈಸ್ ಮಾಡಿ
- ಸೂಕ್ತ ಕನಸೂಟ್ SKUs ಬಳಸಿ
- ಸರಿಯಾದ ಆಟೋಸ್ಕೇಲಿಂಗ್ ಸೆಟ್ ಮಾಡಿ

## ಅಂತಿಮ ಚಾಲೆಂಜ್: ಎಂಡ್-ಟು-ಎಂಡ್ ಜಾರಿಗೆ

### ಚಾಲೆಂಜ್ ದೃಶ್ಯಾವಳಿ

ನೀವು ಉತ್ಪನ್ನ-ಸಿದ್ಧ AI-ಚಾಲಿತ ಗ್ರಾಹಕ ಸೇವೆ ಚಾಟ್‌ಬಾಟ್ ಸೃಷ್ಟಿಸುವ ಜವಾಬ್ದಾರಿಯಾಗಿದ್ದೀರಿ, ಕೆಳಗಿನ ಅಗತ್ಯಗಳೊಂದಿಗೆ:

**ಕಾರ್ಯಾತ್ಮಕ ಅವಶ್ಯಕತೆಗಳು:**
- ಗ್ರಾಹಕ ಸಂವಹನಕ್ಕಾಗಿ ವೆಬ್ ಇಂಟರ್‌ಫೇಸು
- ಪ್ರತಿಕ್ರಿಯೆಗಳಿಗೆ Microsoft Foundry Models ಜೊತೆಗೆ ಏಕೀಕರಣ
- Cognitive Search ಬಳಸಿ ಡಾಕ್ಯುಮೆಂಟ್ ಹುಡುಕಾಟ ಸಾಮರ್ಥ್ಯ
- ಸದ್ಯದ ಗ್ರಾಹಕ ಡೇಟಾಬೇಸ್ನೊಂದಿಗೆ ಏಕೀಕರಣ
- ಬಹು-ಭಾಷಾ ಬೆಂಬಲ

**ಗैर-ಕಾರ್ಯಾತ್ಮಕ ಅವಶ್ಯಕತೆಗಳು:**
- 1000 ಸಮಕಾಲೀನ ಬಳಕೆದಾರರನ್ನು ಹ್ಯಾಂಡಲ್ ಮಾಡುವುದು
- 99.9% ಅಪ್ಲೈನ್‍ಟೈಮ್ SLA
- SOC 2 ಅನುಪಾಲನೆ
- ಮಾಸಿಕ ವೆಚ್ಚ $500 ಕ್ಕೆ ಒಳಗೆ
- ಬಹು ಪರಿಸರಗಳಿಗೆ ಡಿಪ್ಲಾಯ್ (dev, staging, prod)

### ಜಾರಿಗೆ ಹಂತಗಳು

1. ವಾಸ್ತುಶಿಲ್ಪವನ್ನು ವಿನ್ಯಾಸ ಮಾಡಿ
2. AZD 템್ಪ್ಲೇಟ್ ರಚಿಸಿ
3. ಸುರಕ್ಷತಾ ಕ್ರಮಗಳನ್ನು ಜಾರಿಗೆ ತರಲು
4. ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಅಲರ್ಟಿಂಗ್ ಸೆಟ್ ಅಪ್ ಮಾಡಿ
5. ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪೈಪ್‌ಲೈನ್ ಗಳನ್ನು ರಚಿಸಿ
6. ಪರಿಹಾರವನ್ನು ಡಾಕ್ಯುಮೆಂಟ್ ಮಾಡಿ

### ಮೌಲ್ಯಮಾಪನ ಮಾನದಂಡಗಳು

- ✅ **ಕಾರ್ಯಕ್ಷಮತೆ**: ಇದು ಎಲ್ಲಾ ಅಗತ್ಯಗಳನ್ನು ಪೂರೈಸುತ್ತದೆಯೇ?
- ✅ **ಸುರಕ್ಷತೆ**: ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು ಜಾರಿ ಮಾಡಲಾದವೆಯೇ?
- ✅ **ಸ್ಕೇಲಬಿಲಿಟಿ**: ಇದು ಲೋಡ್ ಅನ್ನು ಹ್ಯಾಂಡಲ್ ಮಾಡಬಹುದೇ?
- ✅ **ನಿರ್ವಹಣೀಯತೆ**: ಕೋಡ್ ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಒழுங்கಾಗಿ ಸಂಘಟಿತವಾಗಿದೆಯೇ?
- ✅ **ವೆಚ್ಚ**: ಅದು ಬಜೆಟ್ ಒಳಗೆ ಉಳಿದಿದೆಯೇ?

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### Microsoft ಡಾಕ್ಯುಮೆಂಟೇಷನ್
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### ಉದಾಹರಣೆ 템್ಪ್ಲೇಟ್‌ಗಳು
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ಸಂಪೂರ್ಣಗೊಳಿಸಿರುವ ಪ್ರಮಾಣಪತ್ರ

ಅಭಿನಂದನೆಗಳು! ನೀವು AI ಕಾರ್ಯಾಗಾರ ಲ್ಯಾಬ್ ಅನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ. agora ನೀವು ಇದನ್ನು ಮಾಡಬಹುದಾಗಿದೆ:
- ✅ ಅಸ್ತಿತ್ವದಲ್ಲಿರುವ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು AZD ಟೆಂಪ್ಲೇಟ್ಗಳಿಗೆ ಪರಿವರ್ತಿಸಿ
- ✅ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ
- ✅ AI ಕಾರ್ಯಭಾರಗಳಿಗಾಗಿ ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಜಾರಿಗೆ ತರು
- ✅ AI ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ ಮತ್ತು ಸುಧಾರಿಸಿ
- ✅ ಸಾಮಾನ್ಯ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸು

### ಮುಂದಿನ ಹಂತಗಳು
1. ಈ ಮಾದರಿಗಳನ್ನು ನಿಮ್ಮದೇ AI ಯೋಜನೆಗಳಿಗೆ ಅನ್ವಯಿಸಿ
2. ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಸಮುದಾಯಕ್ಕೆ ಕೊಡುಗೆ ನೀಡಿ
3. ನಿರಂತರ ಬೆಂಬಲಕ್ಕಾಗಿ Microsoft Foundry Discord ಸೇರಿಕೊಳ್ಳಿ
4. ಬಹು-ಪ್ರದೇಶ ನಿಯೋಜನೆಗಳಂತಹ ಉನ್ನತ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ

---

**ಕಾರ್ಯಾಗಾರ ಪ್ರತಿಕ್ರಿಯೆ**: ಈ ಕಾರ್ಯಾಗಾರವನ್ನು ಸುಧಾರಿಸಲು ನಿಮ್ಮ ಅನುಭವವನ್ನು [Microsoft Foundry Discord #Azure ಚಾನೆಲ್](https://discord.gg/microsoft-azure) ನಲ್ಲಿ ಹಂಚಿಕೊಂಡು ನಮಗೆ ಸಹಾಯ ಮಾಡಿ.

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರಂಭಿಕರಿಗಾಗಿ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **➡️ ಮುಂದಿನ**: [ಉತ್ಪಾದನಾ AI ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](production-ai-practices.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೇ?** AZD ಮತ್ತು AI ನಿಯೋಜನೆಗಳ ಬಗ್ಗೆ ಬೆಂಬಲ ಹಾಗೂ ಚರ್ಚೆಗಳಿಗಾಗಿ ನಮ್ಮ ಸಮುದಾಯದಲ್ಲಿ ಸೇರಿ.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕರಣ**:
ಈ ದಸ್ತಾವೇಜನ್ನು ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ (AI) ಆಧಾರಿತ ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಸ್ವದೇಶಿ ಭಾಷೆಯಲ್ಲಿ ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗುರುತ್ವಪೂರ್ಣ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗೊಳ್ಳಿಕೆಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->