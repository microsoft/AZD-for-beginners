<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T17:03:14+00:00",
  "source_file": "workshop/README.md",
  "language_code": "hi"
}
-->
# AZD फॉर AI डेवलपर्स वर्कशॉप

**वर्कशॉप नेविगेशन**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../README.md)
- **📖 संबंधित अध्याय**: [अध्याय 1](../README.md#-chapter-1-foundation--quick-start), [अध्याय 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), और [अध्याय 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced) को कवर करता है
- **🛠️ हैंड्स-ऑन लैब**: [AI वर्कशॉप लैब](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 अगले कदम**: [वर्कशॉप लैब मॉड्यूल्स](../../../workshop)

Azure Developer CLI (AZD) को सीखने के लिए इस हैंड्स-ऑन वर्कशॉप में आपका स्वागत है, जिसमें AI एप्लिकेशन डिप्लॉयमेंट पर ध्यान केंद्रित किया गया है। यह वर्कशॉप आपको AZD की मूल बातें से लेकर प्रोडक्शन-रेडी AI सॉल्यूशंस को डिप्लॉय करने तक ले जाएगी।

## वर्कशॉप का अवलोकन

**अवधि:** 2-3 घंटे  
**स्तर:** शुरुआती से मध्यवर्ती  
**पूर्व आवश्यकताएँ:** Azure, कमांड लाइन टूल्स, और AI कॉन्सेप्ट्स का बुनियादी ज्ञान

### आप क्या सीखेंगे

- **AZD की मूल बातें**: AZD के साथ Infrastructure as Code को समझना
- 🤖 **AI सेवा इंटीग्रेशन**: Azure OpenAI, AI Search, और अन्य AI सेवाओं को डिप्लॉय करना
- **कंटेनर डिप्लॉयमेंट**: AI एप्लिकेशन के लिए Azure Container Apps का उपयोग करना
- **सुरक्षा सर्वोत्तम प्रथाएँ**: Managed Identity और सुरक्षित कॉन्फ़िगरेशन लागू करना
- **मॉनिटरिंग और ऑब्ज़र्वेबिलिटी**: AI वर्कलोड्स के लिए Application Insights सेट करना
- **प्रोडक्शन पैटर्न्स**: एंटरप्राइज़-रेडी डिप्लॉयमेंट रणनीतियाँ

## वर्कशॉप संरचना

### मॉड्यूल 1: AZD की नींव (30 मिनट)
- AZD को इंस्टॉल और कॉन्फ़िगर करना
- AZD प्रोजेक्ट संरचना को समझना
- आपका पहला AZD डिप्लॉयमेंट
- **लैब**: एक साधारण वेब एप्लिकेशन को डिप्लॉय करें

### मॉड्यूल 2: Azure OpenAI इंटीग्रेशन (45 मिनट)
- Azure OpenAI संसाधनों को सेट करना
- मॉडल डिप्लॉयमेंट रणनीतियाँ
- API एक्सेस और ऑथेंटिकेशन को कॉन्फ़िगर करना
- **लैब**: GPT-4 के साथ एक चैट एप्लिकेशन को डिप्लॉय करें

### मॉड्यूल 3: RAG एप्लिकेशन (45 मिनट)
- Azure AI Search इंटीग्रेशन
- Azure Document Intelligence के साथ डॉक्यूमेंट प्रोसेसिंग
- वेक्टर एम्बेडिंग और सेमांटिक सर्च
- **लैब**: एक डॉक्यूमेंट Q&A सिस्टम बनाएं

### मॉड्यूल 4: प्रोडक्शन डिप्लॉयमेंट (30 मिनट)
- कंटेनर ऐप्स कॉन्फ़िगरेशन
- स्केलिंग और प्रदर्शन अनुकूलन
- मॉनिटरिंग और लॉगिंग
- **लैब**: ऑब्ज़र्वेबिलिटी के साथ प्रोडक्शन में डिप्लॉय करें

### मॉड्यूल 5: उन्नत पैटर्न्स (15 मिनट)
- मल्टी-एनवायरनमेंट डिप्लॉयमेंट्स
- CI/CD इंटीग्रेशन
- लागत अनुकूलन रणनीतियाँ
- **समापन**: प्रोडक्शन रेडीनेस चेकलिस्ट

## पूर्व आवश्यकताएँ

### आवश्यक टूल्स

कृपया वर्कशॉप से पहले इन टूल्स को इंस्टॉल करें:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure अकाउंट सेटअप

1. **Azure सब्सक्रिप्शन**: [फ्री में साइन अप करें](https://azure.microsoft.com/free/)
2. **Azure OpenAI एक्सेस**: [एक्सेस का अनुरोध करें](https://aka.ms/oai/access)
3. **आवश्यक अनुमतियाँ**:
   - सब्सक्रिप्शन या रिसोर्स ग्रुप पर Contributor रोल
   - User Access Administrator (RBAC असाइनमेंट्स के लिए)

### पूर्व आवश्यकताओं को सत्यापित करें

अपनी सेटअप को सत्यापित करने के लिए यह स्क्रिप्ट चलाएँ:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## वर्कशॉप सामग्री

### लैब अभ्यास

प्रत्येक मॉड्यूल में स्टार्ट कोड और चरण-दर-चरण निर्देशों के साथ हैंड्स-ऑन लैब्स शामिल हैं:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - आपका पहला AZD डिप्लॉयमेंट
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI के साथ चैट एप्लिकेशन
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search के साथ RAG एप्लिकेशन
- **[lab-4-production/](../../../workshop/lab-4-production)** - प्रोडक्शन डिप्लॉयमेंट पैटर्न्स
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - उन्नत डिप्लॉयमेंट परिदृश्य

### संदर्भ सामग्री

- **[AI Foundry इंटीग्रेशन गाइड](../docs/ai-foundry/azure-ai-foundry-integration.md)** - व्यापक इंटीग्रेशन पैटर्न्स
- **[AI मॉडल डिप्लॉयमेंट गाइड](../docs/ai-foundry/ai-model-deployment.md)** - मॉडल डिप्लॉयमेंट सर्वोत्तम प्रथाएँ
- **[प्रोडक्शन AI प्रथाएँ](../docs/ai-foundry/production-ai-practices.md)** - एंटरप्राइज़ डिप्लॉयमेंट पैटर्न्स
- **[AI ट्रबलशूटिंग गाइड](../docs/troubleshooting/ai-troubleshooting.md)** - सामान्य समस्याएँ और समाधान

### सैंपल टेम्पलेट्स

सामान्य AI परिदृश्यों के लिए क्विक-स्टार्ट टेम्पलेट्स:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## शुरुआत करें

### विकल्प 1: GitHub Codespaces (अनुशंसित)

वर्कशॉप शुरू करने का सबसे तेज़ तरीका:

[![GitHub Codespaces में खोलें](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### विकल्प 2: लोकल डेवलपमेंट

1. **वर्कशॉप रिपॉजिटरी को क्लोन करें:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure में लॉगिन करें:**
```bash
az login
azd auth login
```

3. **लैब 1 से शुरू करें:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### विकल्प 3: इंस्ट्रक्टर-लेड वर्कशॉप

यदि आप इंस्ट्रक्टर-लेड सेशन में भाग ले रहे हैं:

- 🎥 **वर्कशॉप रिकॉर्डिंग**: [ऑन डिमांड उपलब्ध](https://aka.ms/azd-ai-workshop)
- 💬 **Discord कम्युनिटी**: [लाइव सपोर्ट के लिए जुड़ें](https://aka.ms/foundry/discord)
- **वर्कशॉप फीडबैक**: [अपना अनुभव साझा करें](https://aka.ms/azd-workshop-feedback)

## वर्कशॉप टाइमलाइन

### सेल्फ-पेस्ड लर्निंग (3 घंटे)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### इंस्ट्रक्टर-लेड सेशन (2.5 घंटे)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## सफलता के मानदंड

वर्कशॉप के अंत तक, आप सक्षम होंगे:

✅ **AI एप्लिकेशन डिप्लॉय करें** AZD टेम्पलेट्स का उपयोग करके  
✅ **Azure OpenAI सेवाओं को कॉन्फ़िगर करें** उचित सुरक्षा के साथ  
✅ **RAG एप्लिकेशन बनाएं** Azure AI Search इंटीग्रेशन के साथ  
✅ **प्रोडक्शन पैटर्न्स लागू करें** एंटरप्राइज़ AI वर्कलोड्स के लिए  
✅ **AI एप्लिकेशन डिप्लॉयमेंट्स की मॉनिटरिंग और ट्रबलशूटिंग करें**  
✅ **AI वर्कलोड्स के लिए लागत अनुकूलन रणनीतियाँ लागू करें**  

## कम्युनिटी और सपोर्ट

### वर्कशॉप के दौरान

- 🙋 **प्रश्न**: वर्कशॉप चैट का उपयोग करें या हाथ उठाएँ
- 🐛 **समस्याएँ**: [ट्रबलशूटिंग गाइड](../docs/troubleshooting/ai-troubleshooting.md) देखें
- **टिप्स**: अन्य प्रतिभागियों के साथ खोजें साझा करें

### वर्कशॉप के बाद

- 💬 **Discord**: [Azure AI Foundry कम्युनिटी](https://aka.ms/foundry/discord)
- **GitHub Issues**: [टेम्पलेट समस्याएँ रिपोर्ट करें](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **फीडबैक**: [वर्कशॉप मूल्यांकन फॉर्म](https://aka.ms/azd-workshop-feedback)

## अगले कदम

### सीखना जारी रखें

1. **उन्नत परिदृश्य**: [मल्टी-रीजन डिप्लॉयमेंट्स](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) का अन्वेषण करें
2. **CI/CD इंटीग्रेशन**: [GitHub Actions वर्कफ़्लो](../docs/deployment/github-actions.md) सेट करें
3. **कस्टम टेम्पलेट्स**: अपने [AZD टेम्पलेट्स](../docs/getting-started/custom-templates.md) बनाएं

### अपने प्रोजेक्ट्स में लागू करें

1. **मूल्यांकन**: हमारा [रेडिनेस चेकलिस्ट](./production-readiness-checklist.md) उपयोग करें
2. **टेम्पलेट्स**: हमारे [AI-विशिष्ट टेम्पलेट्स](../../../workshop/templates) से शुरू करें
3. **सपोर्ट**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) से जुड़ें

### अपनी सफलता साझा करें

- ⭐ **रिपॉजिटरी को स्टार करें** यदि इस वर्कशॉप ने आपकी मदद की
- 🐦 **सोशल मीडिया पर साझा करें** #AzureDeveloperCLI #AzureAI के साथ
- 📝 **ब्लॉग पोस्ट लिखें** अपनी AI डिप्लॉयमेंट यात्रा के बारे में

---

## वर्कशॉप फीडबैक

आपका फीडबैक वर्कशॉप अनुभव को बेहतर बनाने में मदद करता है:

| पहलू | रेटिंग (1-5) | टिप्पणियाँ |
|------|--------------|------------|
| सामग्री की गुणवत्ता | ⭐⭐⭐⭐⭐ | |
| हैंड्स-ऑन लैब्स | ⭐⭐⭐⭐⭐ | |
| दस्तावेज़ीकरण | ⭐⭐⭐⭐⭐ | |
| कठिनाई स्तर | ⭐⭐⭐⭐⭐ | |
| समग्र अनुभव | ⭐⭐⭐⭐⭐ | |

**फीडबैक सबमिट करें**: [वर्कशॉप मूल्यांकन फॉर्म](https://aka.ms/azd-workshop-feedback)

---

**पिछला:** [AI ट्रबलशूटिंग गाइड](../docs/troubleshooting/ai-troubleshooting.md) | **अगला:** [लैब 1: AZD बेसिक्स](../../../workshop/lab-1-azd-basics) से शुरू करें

**AZD के साथ AI एप्लिकेशन बनाना शुरू करने के लिए तैयार हैं?**

[लैब 1: AZD फाउंडेशन्स शुरू करें →](./lab-1-azd-basics/README.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।