<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T20:02:20+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ne"
}
-->
# AZD आधारभूत - Azure Developer CLI बुझ्ने

# AZD आधारभूत - मुख्य अवधारणाहरू र आधारभूत जानकारी

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधारभूत र छिटो सुरुवात
- **⬅️ अघिल्लो**: [पाठ्यक्रम अवलोकन](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ अर्को**: [स्थापना र सेटअप](installation.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-प्रथम विकास](../ai-foundry/azure-ai-foundry-integration.md)

## परिचय

यस पाठले तपाईंलाई Azure Developer CLI (azd) को परिचय दिन्छ, एक शक्तिशाली कमाण्ड-लाइन उपकरण जसले स्थानीय विकासदेखि Azure मा परिनियोजनसम्मको यात्रा छिटो बनाउँछ। तपाईंले आधारभूत अवधारणाहरू, मुख्य विशेषताहरू सिक्नुहुनेछ र कसरी azd ले क्लाउड-नेटिभ एप्लिकेसन परिनियोजनलाई सरल बनाउँछ भन्ने बुझ्नुहुनेछ।

## सिक्ने लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईं:
- Azure Developer CLI के हो र यसको मुख्य उद्देश्य के हो भन्ने बुझ्नुहुनेछ
- टेम्प्लेट, वातावरणहरू, र सेवाहरूको मुख्य अवधारणाहरू सिक्नुहुनेछ
- टेम्प्लेट-आधारित विकास र Infrastructure as Code को मुख्य विशेषताहरू अन्वेषण गर्नुहुनेछ
- azd परियोजना संरचना र कार्यप्रवाह बुझ्नुहुनेछ
- तपाईंको विकास वातावरणको लागि azd स्थापना र कन्फिगर गर्न तयार हुनुहुनेछ

## सिक्ने परिणामहरू

यस पाठ पूरा गरेपछि, तपाईं:
- आधुनिक क्लाउड विकास कार्यप्रवाहमा azd को भूमिका व्याख्या गर्न सक्नुहुनेछ
- azd परियोजना संरचनाका घटकहरू पहिचान गर्न सक्नुहुनेछ
- टेम्प्लेट, वातावरणहरू, र सेवाहरू कसरी सँगै काम गर्छन् भन्ने वर्णन गर्न सक्नुहुनेछ
- azd को साथ Infrastructure as Code को फाइदाहरू बुझ्न सक्नुहुनेछ
- विभिन्न azd कमाण्डहरू र तिनको उद्देश्यहरू चिन्न सक्नुहुनेछ

## Azure Developer CLI (azd) के हो?

Azure Developer CLI (azd) एक कमाण्ड-लाइन उपकरण हो जसले स्थानीय विकासदेखि Azure मा परिनियोजनसम्मको यात्रा छिटो बनाउँछ। यसले Azure मा क्लाउड-नेटिभ एप्लिकेसनहरू निर्माण, परिनियोजन, र व्यवस्थापन गर्ने प्रक्रिया सरल बनाउँछ।

## मुख्य अवधारणाहरू

### टेम्प्लेटहरू
टेम्प्लेटहरू azd को आधार हुन्। तिनीहरूले समावेश गर्छन्:
- **एप्लिकेसन कोड** - तपाईंको स्रोत कोड र निर्भरता
- **Infrastructure परिभाषाहरू** - Azure स्रोतहरू Bicep वा Terraform मा परिभाषित
- **कन्फिगरेसन फाइलहरू** - सेटिङहरू र वातावरण चरहरू
- **परिनियोजन स्क्रिप्टहरू** - स्वचालित परिनियोजन कार्यप्रवाहहरू

### वातावरणहरू
वातावरणहरू विभिन्न परिनियोजन लक्ष्यहरू प्रतिनिधित्व गर्छन्:
- **विकास** - परीक्षण र विकासको लागि
- **स्टेजिङ** - उत्पादनपूर्व वातावरण
- **उत्पादन** - लाइभ उत्पादन वातावरण

प्रत्येक वातावरणले आफ्नै:
- Azure स्रोत समूह
- कन्फिगरेसन सेटिङहरू
- परिनियोजन अवस्था कायम राख्छ।

### सेवाहरू
सेवाहरू तपाईंको एप्लिकेसनका निर्माण ब्लकहरू हुन्:
- **फ्रन्टएन्ड** - वेब एप्लिकेसनहरू, SPAs
- **ब्याकएन्ड** - APIs, माइक्रोसर्भिसहरू
- **डाटाबेस** - डाटा भण्डारण समाधानहरू
- **स्टोरेज** - फाइल र ब्लब स्टोरेज

## मुख्य विशेषताहरू

### 1. टेम्प्लेट-आधारित विकास
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure को डोमेन-विशिष्ट भाषा
- **Terraform** - मल्टी-क्लाउड Infrastructure उपकरण
- **ARM टेम्प्लेटहरू** - Azure Resource Manager टेम्प्लेटहरू

### 3. एकीकृत कार्यप्रवाहहरू
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. वातावरण व्यवस्थापन
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 परियोजना संरचना

एक सामान्य azd परियोजना संरचना:
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

## 🔧 कन्फिगरेसन फाइलहरू

### azure.yaml
मुख्य परियोजना कन्फिगरेसन फाइल:
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
वातावरण-विशिष्ट कन्फिगरेसन:
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

## 🎪 सामान्य कार्यप्रवाहहरू

### नयाँ परियोजना सुरु गर्दै
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
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## `azd down --force --purge` बुझ्दै
`azd down --force --purge` कमाण्डले तपाईंको azd वातावरण र सबै सम्बन्धित स्रोतहरू पूर्ण रूपमा हटाउने शक्तिशाली तरिका हो। यहाँ प्रत्येक फ्ल्यागले के गर्छ भन्ने विवरण छ:
```
--force
```
- पुष्टि संकेतहरू छोड्छ।
- स्वचालन वा स्क्रिप्टिङको लागि उपयोगी जहाँ म्यानुअल इनपुट सम्भव छैन।
- CLI ले असंगतता पत्ता लगाए पनि टियरडाउन बिना अवरोध अघि बढ्छ।

```
--purge
```
**सबै सम्बन्धित मेटाडाटा** मेटाडाटा हटाउँछ, जसमा समावेश छ:
वातावरण अवस्था
स्थानीय `.azure` फोल्डर
क्यास गरिएको परिनियोजन जानकारी
azd लाई "अघिल्लो परिनियोजनहरू सम्झन" रोक्छ, जसले स्रोत समूहहरू मिल्दैन वा पुरानो रजिस्ट्री सन्दर्भहरू जस्ता समस्याहरू निम्त्याउन सक्छ।

### किन दुवै प्रयोग गर्ने?
जब तपाईं `azd up` मा अड्किनुहुन्छ किनभने बाँकी अवस्था वा आंशिक परिनियोजनहरू, यो संयोजनले **सफा स्लेट** सुनिश्चित गर्दछ।

यो विशेष गरी उपयोगी छ जब Azure पोर्टलमा म्यानुअल स्रोत हटाइपछि वा टेम्प्लेटहरू, वातावरणहरू, वा स्रोत समूह नामकरण सम्मेलनहरू परिवर्तन गर्दा।

### धेरै वातावरणहरू व्यवस्थापन गर्दै
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

## 🧭 नेभिगेसन कमाण्डहरू

### खोज
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### परियोजना व्यवस्थापन
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### अनुगमन
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## उत्कृष्ट अभ्यासहरू

### 1. अर्थपूर्ण नामहरू प्रयोग गर्नुहोस्
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. टेम्प्लेटहरूको उपयोग गर्नुहोस्
- अवस्थित टेम्प्लेटहरूबाट सुरु गर्नुहोस्
- तपाईंको आवश्यकताहरूका लागि अनुकूलन गर्नुहोस्
- तपाईंको संगठनका लागि पुन: प्रयोग गर्न मिल्ने टेम्प्लेटहरू सिर्जना गर्नुहोस्

### 3. वातावरण अलगाव
- विकास/स्टेजिङ/उत्पादनको लागि अलग वातावरणहरू प्रयोग गर्नुहोस्
- स्थानीय मेसिनबाट सिधै उत्पादनमा कहिल्यै परिनियोजन नगर्नुहोस्
- उत्पादन परिनियोजनहरूको लागि CI/CD पाइपलाइनहरू प्रयोग गर्नुहोस्

### 4. कन्फिगरेसन व्यवस्थापन
- संवेदनशील डाटाका लागि वातावरण चरहरू प्रयोग गर्नुहोस्
- कन्फिगरेसनलाई संस्करण नियन्त्रणमा राख्नुहोस्
- वातावरण-विशिष्ट सेटिङहरूलाई दस्तावेज गर्नुहोस्

## सिक्ने प्रगति

### प्रारम्भिक (हप्ता 1-2)
1. azd स्थापना गर्नुहोस् र प्रमाणिकरण गर्नुहोस्
2. साधारण टेम्प्लेट परिनियोजन गर्नुहोस्
3. परियोजना संरचना बुझ्नुहोस्
4. आधारभूत कमाण्डहरू सिक्नुहोस् (up, down, deploy)

### मध्यवर्ती (हप्ता 3-4)
1. टेम्प्लेटहरू अनुकूलन गर्नुहोस्
2. धेरै वातावरणहरू व्यवस्थापन गर्नुहोस्
3. Infrastructure कोड बुझ्नुहोस्
4. CI/CD पाइपलाइनहरू सेट गर्नुहोस्

### उन्नत (हप्ता 5+)
1. अनुकूलित टेम्प्लेटहरू सिर्जना गर्नुहोस्
2. उन्नत Infrastructure ढाँचाहरू
3. बहु-क्षेत्र परिनियोजनहरू
4. उद्यम-स्तर कन्फिगरेसनहरू

## अर्को कदमहरू

**📖 अध्याय 1 सिकाइ जारी राख्नुहोस्:**
- [स्थापना र सेटअप](installation.md) - azd स्थापना र कन्फिगर गर्नुहोस्
- [तपाईंको पहिलो परियोजना](first-project.md) - व्यावहारिक ट्यूटोरियल पूरा गर्नुहोस्
- [कन्फिगरेसन गाइड](configuration.md) - उन्नत कन्फिगरेसन विकल्पहरू

**🎯 अर्को अध्यायको लागि तयार?**
- [अध्याय 2: AI-प्रथम विकास](../ai-foundry/azure-ai-foundry-integration.md) - AI एप्लिकेसनहरू निर्माण गर्न सुरु गर्नुहोस्

## अतिरिक्त स्रोतहरू

- [Azure Developer CLI अवलोकन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [समुदाय नमूनाहरू](https://github.com/Azure-Samples)

---

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृहपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधारभूत र छिटो सुरुवात  
- **⬅️ अघिल्लो**: [पाठ्यक्रम अवलोकन](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ अर्को**: [स्थापना र सेटअप](installation.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-प्रथम विकास](../ai-foundry/azure-ai-foundry-integration.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।