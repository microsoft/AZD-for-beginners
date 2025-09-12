<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T18:54:12+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "mr"
}
-->
# AZD मूलभूत गोष्टी - Azure Developer CLI समजून घेणे

**मागील:** [स्थापना आणि सेटअप](installation.md) | **पुढील:** [कॉन्फिगरेशन](configuration.md)

## परिचय

या धड्यात तुम्हाला Azure Developer CLI (azd) ची ओळख करून दिली जाईल, जो एक शक्तिशाली कमांड-लाइन टूल आहे जो स्थानिक विकासापासून Azure वर तैनातीपर्यंतचा प्रवास वेगवान करतो. तुम्ही मूलभूत संकल्पना, मुख्य वैशिष्ट्ये शिकाल आणि azd कसे क्लाउड-नेटिव्ह अनुप्रयोग तैनाती सुलभ करते हे समजून घ्याल.

## शिकण्याची उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- Azure Developer CLI म्हणजे काय आणि त्याचा मुख्य उद्देश समजून घ्याल
- टेम्पलेट्स, वातावरण आणि सेवांच्या मूलभूत संकल्पना शिकाल
- टेम्पलेट-आधारित विकास आणि Infrastructure as Code यासह प्रमुख वैशिष्ट्ये एक्सप्लोर कराल
- azd प्रकल्प संरचना आणि कार्यप्रवाह समजून घ्याल
- तुमच्या विकासाच्या वातावरणासाठी azd स्थापित आणि कॉन्फिगर करण्यासाठी तयार असाल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, तुम्ही:
- आधुनिक क्लाउड विकास कार्यप्रवाहांमध्ये azd ची भूमिका स्पष्ट करू शकाल
- azd प्रकल्प संरचनेचे घटक ओळखू शकाल
- टेम्पलेट्स, वातावरण आणि सेवा एकत्र कसे कार्य करतात हे वर्णन करू शकाल
- azd सह Infrastructure as Code चे फायदे समजून घ्याल
- विविध azd कमांड्स आणि त्यांचे उद्देश ओळखू शकाल

## Azure Developer CLI (azd) म्हणजे काय?

Azure Developer CLI (azd) हे एक कमांड-लाइन टूल आहे जे स्थानिक विकासापासून Azure वर तैनातीपर्यंतचा प्रवास वेगवान करण्यासाठी डिझाइन केले आहे. हे Azure वर क्लाउड-नेटिव्ह अनुप्रयोग तयार करणे, तैनात करणे आणि व्यवस्थापित करणे सुलभ करते.

## मूलभूत संकल्पना

### टेम्पलेट्स
टेम्पलेट्स हे azd चे आधार आहेत. त्यामध्ये समाविष्ट आहे:
- **अनुप्रयोग कोड** - तुमचा स्रोत कोड आणि अवलंबित्वे
- **इन्फ्रास्ट्रक्चर परिभाषा** - Bicep किंवा Terraform मध्ये परिभाषित Azure संसाधने
- **कॉन्फिगरेशन फाइल्स** - सेटिंग्ज आणि पर्यावरणीय व्हेरिएबल्स
- **तैनाती स्क्रिप्ट्स** - स्वयंचलित तैनाती कार्यप्रवाह

### वातावरण
वातावरणे वेगवेगळ्या तैनाती लक्ष्यांचे प्रतिनिधित्व करतात:
- **विकास** - चाचणी आणि विकासासाठी
- **स्टेजिंग** - प्री-प्रॉडक्शन वातावरण
- **प्रॉडक्शन** - लाइव्ह प्रॉडक्शन वातावरण

प्रत्येक वातावरण स्वतःचे राखते:
- Azure संसाधन गट
- कॉन्फिगरेशन सेटिंग्ज
- तैनाती स्थिती

### सेवा
सेवा तुमच्या अनुप्रयोगाचे बांधकाम घटक आहेत:
- **फ्रंटएंड** - वेब अनुप्रयोग, SPAs
- **बॅकएंड** - APIs, मायक्रोसर्व्हिसेस
- **डेटाबेस** - डेटा स्टोरेज सोल्यूशन्स
- **स्टोरेज** - फाइल आणि ब्लॉब स्टोरेज

## मुख्य वैशिष्ट्ये

### 1. टेम्पलेट-आधारित विकास
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure चे डोमेन-विशिष्ट भाषा
- **Terraform** - मल्टी-क्लाउड इन्फ्रास्ट्रक्चर टूल
- **ARM टेम्पलेट्स** - Azure Resource Manager टेम्पलेट्स

### 3. एकत्रित कार्यप्रवाह
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

## 📁 प्रकल्प संरचना

एक सामान्य azd प्रकल्प संरचना:
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

## 🔧 कॉन्फिगरेशन फाइल्स

### azure.yaml
मुख्य प्रकल्प कॉन्फिगरेशन फाइल:
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
वातावरण-विशिष्ट कॉन्फिगरेशन:
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

## 🎪 सामान्य कार्यप्रवाह

### नवीन प्रकल्प सुरू करणे
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

## `azd down --force --purge` समजून घेणे
`azd down --force --purge` कमांड तुमचे azd वातावरण आणि संबंधित सर्व संसाधने पूर्णपणे हटवण्यासाठी एक शक्तिशाली मार्ग आहे. प्रत्येक फ्लॅग काय करतो याचे विश्लेषण येथे आहे:
```
--force
```
- पुष्टीकरण प्रॉम्प्ट्स वगळतो.
- स्वयंचलितता किंवा स्क्रिप्टिंगसाठी उपयुक्त जिथे मॅन्युअल इनपुट शक्य नाही.
- CLI विसंगती आढळल्यासही, हटवणे अडथळ्याशिवाय सुरू राहते.

```
--purge
```
**सर्व संबंधित मेटाडेटा** हटवते, ज्यामध्ये समाविष्ट आहे:
वातावरण स्थिती
स्थानिक `.azure` फोल्डर
कॅश्ड तैनाती माहिती
azd ला "पूर्वीच्या तैनाती" लक्षात ठेवण्यापासून प्रतिबंधित करते, ज्यामुळे संसाधन गट जुळत नाहीत किंवा जुने रजिस्ट्रेशन संदर्भ यासारख्या समस्या उद्भवू शकतात.

### दोन्ही एकत्र का वापरावे?
जर तुम्हाला `azd up` मुळे उर्वरित स्थिती किंवा अपूर्ण तैनातींमुळे अडचण आली असेल, तर ही जोडणी **स्वच्छ सुरुवात** सुनिश्चित करते.

हे विशेषतः Azure पोर्टलमध्ये मॅन्युअल संसाधन हटविल्यानंतर किंवा टेम्पलेट्स, वातावरण किंवा संसाधन गट नामकरण पद्धती बदलताना उपयुक्त आहे.

### एकाधिक वातावरण व्यवस्थापन
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

## 🧭 नेव्हिगेशन कमांड्स

### शोध
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### प्रकल्प व्यवस्थापन
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### निरीक्षण
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## सर्वोत्तम पद्धती

### 1. अर्थपूर्ण नावे वापरा
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. टेम्पलेट्सचा लाभ घ्या
- विद्यमान टेम्पलेट्ससह प्रारंभ करा
- तुमच्या गरजेनुसार सानुकूलित करा
- तुमच्या संस्थेसाठी पुनर्वापरयोग्य टेम्पलेट्स तयार करा

### 3. वातावरण वेगळे करा
- विकास/स्टेजिंग/प्रॉडक्शनसाठी स्वतंत्र वातावरण वापरा
- स्थानिक मशीनवरून थेट प्रॉडक्शनमध्ये कधीही तैनात करू नका
- प्रॉडक्शन तैनातीसाठी CI/CD पाइपलाइन्स वापरा

### 4. कॉन्फिगरेशन व्यवस्थापन
- संवेदनशील डेटासाठी पर्यावरणीय व्हेरिएबल्स वापरा
- कॉन्फिगरेशन आवृत्ती नियंत्रणात ठेवा
- वातावरण-विशिष्ट सेटिंग्ज दस्तऐवजीकरण करा

## शिकण्याची प्रगती

### नवशिक्या (आठवडा 1-2)
1. azd स्थापित करा आणि प्रमाणीकरण करा
2. एक साधा टेम्पलेट तैनात करा
3. प्रकल्प संरचना समजून घ्या
4. मूलभूत कमांड्स (up, down, deploy) शिकणे

### मध्यम स्तर (आठवडा 3-4)
1. टेम्पलेट्स सानुकूलित करा
2. एकाधिक वातावरण व्यवस्थापित करा
3. इन्फ्रास्ट्रक्चर कोड समजून घ्या
4. CI/CD पाइपलाइन्स सेट करा

### प्रगत (आठवडा 5+)
1. सानुकूल टेम्पलेट्स तयार करा
2. प्रगत इन्फ्रास्ट्रक्चर पॅटर्न्स
3. मल्टी-रीजन तैनाती
4. एंटरप्राइझ-ग्रेड कॉन्फिगरेशन्स

## पुढील पायऱ्या

- [स्थापना आणि सेटअप](installation.md) - azd स्थापित आणि कॉन्फिगर करा
- [तुमचा पहिला प्रकल्प](first-project.md) - हाताळण्याचा ट्यूटोरियल
- [कॉन्फिगरेशन मार्गदर्शक](configuration.md) - प्रगत कॉन्फिगरेशन पर्याय

## अतिरिक्त संसाधने

- [Azure Developer CLI विहंगावलोकन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [टेम्पलेट गॅलरी](https://azure.github.io/awesome-azd/)
- [कम्युनिटी नमुने](https://github.com/Azure-Samples)

---

**मागील:** [स्थापना आणि सेटअप](installation.md) | **पुढील:** [कॉन्फिगरेशन](configuration.md)
- **पुढील धडा**: [स्थापना आणि सेटअप](installation.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.