<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T16:57:02+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "hi"
}
-->
# AZD बेसिक्स - Azure Developer CLI को समझना

## परिचय

यह पाठ आपको Azure Developer CLI (azd) से परिचित कराता है, जो एक शक्तिशाली कमांड-लाइन टूल है जो स्थानीय विकास से Azure पर तैनाती तक की यात्रा को तेज करता है। आप मौलिक अवधारणाओं, मुख्य विशेषताओं को सीखेंगे और समझेंगे कि azd क्लाउड-नेटिव एप्लिकेशन तैनाती को कैसे सरल बनाता है।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- समझ पाएंगे कि Azure Developer CLI क्या है और इसका मुख्य उद्देश्य क्या है
- टेम्पलेट्स, एनवायरनमेंट्स, और सेवाओं की मुख्य अवधारणाओं को सीखेंगे
- टेम्पलेट-ड्रिवन विकास और Infrastructure as Code जैसी प्रमुख विशेषताओं का अन्वेषण करेंगे
- azd प्रोजेक्ट संरचना और वर्कफ़्लो को समझेंगे
- अपने विकास वातावरण के लिए azd को इंस्टॉल और कॉन्फ़िगर करने के लिए तैयार होंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप:
- आधुनिक क्लाउड विकास वर्कफ़्लो में azd की भूमिका को समझा पाएंगे
- azd प्रोजेक्ट संरचना के घटकों की पहचान कर पाएंगे
- समझ पाएंगे कि टेम्पलेट्स, एनवायरनमेंट्स, और सेवाएं कैसे एक साथ काम करती हैं
- azd के साथ Infrastructure as Code के लाभों को समझेंगे
- विभिन्न azd कमांड्स और उनके उद्देश्यों को पहचान पाएंगे

## Azure Developer CLI (azd) क्या है?

Azure Developer CLI (azd) एक कमांड-लाइन टूल है जिसे स्थानीय विकास से Azure पर तैनाती तक की यात्रा को तेज करने के लिए डिज़ाइन किया गया है। यह Azure पर क्लाउड-नेटिव एप्लिकेशन बनाने, तैनात करने और प्रबंधित करने की प्रक्रिया को सरल बनाता है।

## मुख्य अवधारणाएं

### टेम्पलेट्स
टेम्पलेट्स azd की नींव हैं। इनमें शामिल हैं:
- **एप्लिकेशन कोड** - आपका सोर्स कोड और डिपेंडेंसीज़
- **इंफ्रास्ट्रक्चर परिभाषाएं** - Azure संसाधन जो Bicep या Terraform में परिभाषित हैं
- **कॉन्फ़िगरेशन फाइलें** - सेटिंग्स और एनवायरनमेंट वेरिएबल्स
- **तैनाती स्क्रिप्ट्स** - स्वचालित तैनाती वर्कफ़्लो

### एनवायरनमेंट्स
एनवायरनमेंट्स विभिन्न तैनाती लक्ष्यों का प्रतिनिधित्व करते हैं:
- **डेवलपमेंट** - परीक्षण और विकास के लिए
- **स्टेजिंग** - प्री-प्रोडक्शन एनवायरनमेंट
- **प्रोडक्शन** - लाइव प्रोडक्शन एनवायरनमेंट

प्रत्येक एनवायरनमेंट का अपना:
- Azure संसाधन समूह
- कॉन्फ़िगरेशन सेटिंग्स
- तैनाती स्थिति होती है

### सेवाएं
सेवाएं आपके एप्लिकेशन के निर्माण खंड हैं:
- **फ्रंटएंड** - वेब एप्लिकेशन, SPAs
- **बैकएंड** - APIs, माइक्रोसर्विसेज
- **डेटाबेस** - डेटा स्टोरेज समाधान
- **स्टोरेज** - फाइल और ब्लॉब स्टोरेज

## मुख्य विशेषताएं

### 1. टेम्पलेट-ड्रिवन विकास
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure की डोमेन-विशिष्ट भाषा
- **Terraform** - मल्टी-क्लाउड इंफ्रास्ट्रक्चर टूल
- **ARM टेम्पलेट्स** - Azure Resource Manager टेम्पलेट्स

### 3. इंटीग्रेटेड वर्कफ़्लो
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. एनवायरनमेंट प्रबंधन
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 प्रोजेक्ट संरचना

एक सामान्य azd प्रोजेक्ट संरचना:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 कॉन्फ़िगरेशन फाइलें

### azure.yaml
मुख्य प्रोजेक्ट कॉन्फ़िगरेशन फाइल:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
एनवायरनमेंट-विशिष्ट कॉन्फ़िगरेशन:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 सामान्य वर्कफ़्लो

### नया प्रोजेक्ट शुरू करना
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### विकास चक्र
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### कई एनवायरनमेंट्स प्रबंधित करना
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 नेविगेशन कमांड्स

### डिस्कवरी
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### प्रोजेक्ट प्रबंधन
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### मॉनिटरिंग
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## सर्वोत्तम प्रथाएं

### 1. अर्थपूर्ण नामों का उपयोग करें
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. टेम्पलेट्स का लाभ उठाएं
- मौजूदा टेम्पलेट्स से शुरुआत करें
- अपनी आवश्यकताओं के अनुसार अनुकूलित करें
- अपने संगठन के लिए पुन: उपयोग योग्य टेम्पलेट्स बनाएं

### 3. एनवायरनमेंट आइसोलेशन
- विकास/स्टेजिंग/प्रोडक्शन के लिए अलग-अलग एनवायरनमेंट्स का उपयोग करें
- स्थानीय मशीन से सीधे प्रोडक्शन में तैनाती कभी न करें
- प्रोडक्शन तैनाती के लिए CI/CD पाइपलाइनों का उपयोग करें

### 4. कॉन्फ़िगरेशन प्रबंधन
- संवेदनशील डेटा के लिए एनवायरनमेंट वेरिएबल्स का उपयोग करें
- कॉन्फ़िगरेशन को संस्करण नियंत्रण में रखें
- एनवायरनमेंट-विशिष्ट सेटिंग्स का दस्तावेज़ीकरण करें

## सीखने की प्रगति

### शुरुआती (सप्ताह 1-2)
1. azd इंस्टॉल करें और प्रमाणित करें
2. एक साधारण टेम्पलेट तैनात करें
3. प्रोजेक्ट संरचना को समझें
4. बुनियादी कमांड्स सीखें (up, down, deploy)

### मध्यवर्ती (सप्ताह 3-4)
1. टेम्पलेट्स को अनुकूलित करें
2. कई एनवायरनमेंट्स प्रबंधित करें
3. इंफ्रास्ट्रक्चर कोड को समझें
4. CI/CD पाइपलाइनों को सेट करें

### उन्नत (सप्ताह 5+)
1. कस्टम टेम्पलेट्स बनाएं
2. उन्नत इंफ्रास्ट्रक्चर पैटर्न
3. मल्टी-रीजन तैनाती
4. एंटरप्राइज़-ग्रेड कॉन्फ़िगरेशन

## अगले कदम

- [इंस्टॉलेशन और सेटअप](installation.md) - azd को इंस्टॉल और कॉन्फ़िगर करें
- [आपका पहला प्रोजेक्ट](first-project.md) - हैंड्स-ऑन ट्यूटोरियल
- [कॉन्फ़िगरेशन गाइड](configuration.md) - उन्नत कॉन्फ़िगरेशन विकल्प

## अतिरिक्त संसाधन

- [Azure Developer CLI अवलोकन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)
- [कम्युनिटी सैंपल्स](https://github.com/Azure-Samples)

---

**नेविगेशन**
- **पिछला पाठ**: [README](../../README.md)
- **अगला पाठ**: [इंस्टॉलेशन और सेटअप](installation.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।