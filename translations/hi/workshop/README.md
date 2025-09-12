<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T17:51:44+00:00",
  "source_file": "workshop/README.md",
  "language_code": "hi"
}
-->
# AZD फॉर AI डेवलपर्स वर्कशॉप

**पिछला:** [AI समस्या निवारण गाइड](../docs/troubleshooting/ai-troubleshooting.md) | **अगला:** [वर्कशॉप लैब मॉड्यूल्स](../../../workshop)

Azure Developer CLI (AZD) के साथ AI एप्लिकेशन डिप्लॉयमेंट सीखने के लिए इस हैंड्स-ऑन वर्कशॉप में आपका स्वागत है। यह वर्कशॉप आपको AZD की मूल बातें से लेकर प्रोडक्शन-रेडी AI सॉल्यूशंस डिप्लॉय करने तक ले जाएगी।

## वर्कशॉप का अवलोकन

**अवधि:** 2-3 घंटे  
**स्तर:** शुरुआती से मध्यवर्ती  
**पूर्व आवश्यकताएँ:** Azure, कमांड लाइन टूल्स, और AI अवधारणाओं का बुनियादी ज्ञान

### आप क्या सीखेंगे

- **AZD की मूल बातें**: AZD के साथ Infrastructure as Code को समझना  
- 🤖 **AI सेवा एकीकरण**: Azure OpenAI, AI Search, और अन्य AI सेवाओं को डिप्लॉय करना  
- **कंटेनर डिप्लॉयमेंट**: AI एप्लिकेशन के लिए Azure Container Apps का उपयोग  
- **सुरक्षा सर्वोत्तम प्रथाएँ**: Managed Identity और सुरक्षित कॉन्फ़िगरेशन लागू करना  
- **मॉनिटरिंग और ऑब्ज़र्वेबिलिटी**: AI वर्कलोड्स के लिए Application Insights सेट करना  
- **प्रोडक्शन पैटर्न्स**: एंटरप्राइज़-रेडी डिप्लॉयमेंट रणनीतियाँ  

## वर्कशॉप संरचना

### मॉड्यूल 1: AZD की नींव (30 मिनट)
- AZD को इंस्टॉल और कॉन्फ़िगर करना  
- AZD प्रोजेक्ट संरचना को समझना  
- आपका पहला AZD डिप्लॉयमेंट  
- **लैब**: एक साधारण वेब एप्लिकेशन डिप्लॉय करें  

### मॉड्यूल 2: Azure OpenAI एकीकरण (45 मिनट)
- Azure OpenAI संसाधन सेट करना  
- मॉडल डिप्लॉयमेंट रणनीतियाँ  
- API एक्सेस और ऑथेंटिकेशन कॉन्फ़िगर करना  
- **लैब**: GPT-4 के साथ एक चैट एप्लिकेशन डिप्लॉय करें  

### मॉड्यूल 3: RAG एप्लिकेशन (45 मिनट)
- Azure AI Search एकीकरण  
- Azure Document Intelligence के साथ दस्तावेज़ प्रोसेसिंग  
- वेक्टर एम्बेडिंग और सेमांटिक सर्च  
- **लैब**: एक दस्तावेज़ Q&A सिस्टम बनाएं  

### मॉड्यूल 4: प्रोडक्शन डिप्लॉयमेंट (30 मिनट)
- कंटेनर ऐप्स कॉन्फ़िगरेशन  
- स्केलिंग और प्रदर्शन अनुकूलन  
- मॉनिटरिंग और लॉगिंग  
- **लैब**: ऑब्ज़र्वेबिलिटी के साथ प्रोडक्शन में डिप्लॉय करें  

### मॉड्यूल 5: उन्नत पैटर्न्स (15 मिनट)
- मल्टी-एनवायरनमेंट डिप्लॉयमेंट  
- CI/CD एकीकरण  
- लागत अनुकूलन रणनीतियाँ  
- **समाप्ति**: प्रोडक्शन रेडीनेस चेकलिस्ट  

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
   - RBAC असाइनमेंट के लिए User Access Administrator  

### पूर्व आवश्यकताओं की पुष्टि करें

अपनी सेटअप की पुष्टि करने के लिए यह स्क्रिप्ट चलाएँ:

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

प्रत्येक मॉड्यूल में स्टेप-बाय-स्टेप निर्देशों के साथ हैंड्स-ऑन लैब्स शामिल हैं:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - आपका पहला AZD डिप्लॉयमेंट  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI के साथ चैट एप्लिकेशन  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search के साथ RAG एप्लिकेशन  
- **[lab-4-production/](../../../workshop/lab-4-production)** - प्रोडक्शन डिप्लॉयमेंट पैटर्न्स  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - उन्नत डिप्लॉयमेंट परिदृश्य  

### संदर्भ सामग्री

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - व्यापक एकीकरण पैटर्न  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - मॉडल डिप्लॉयमेंट सर्वोत्तम प्रथाएँ  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - एंटरप्राइज़ डिप्लॉयमेंट पैटर्न  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - सामान्य समस्याएँ और समाधान  

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

1. **वर्कशॉप रिपॉजिटरी क्लोन करें:**
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

### विकल्प 3: प्रशिक्षक-नेतृत्व वाली वर्कशॉप

यदि आप प्रशिक्षक-नेतृत्व वाले सत्र में भाग ले रहे हैं:

- 🎥 **वर्कशॉप रिकॉर्डिंग**: [ऑन डिमांड उपलब्ध](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord समुदाय**: [लाइव समर्थन के लिए शामिल हों](https://aka.ms/foundry/discord)  
- **वर्कशॉप फीडबैक**: [अपना अनुभव साझा करें](https://aka.ms/azd-workshop-feedback)  

## वर्कशॉप टाइमलाइन

### स्व-गति से सीखना (3 घंटे)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### प्रशिक्षक-नेतृत्व सत्र (2.5 घंटे)

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
✅ **Azure OpenAI कॉन्फ़िगर करें** उचित सुरक्षा के साथ  
✅ **RAG एप्लिकेशन बनाएं** Azure AI Search एकीकरण के साथ  
✅ **प्रोडक्शन पैटर्न लागू करें** एंटरप्राइज़ AI वर्कलोड्स के लिए  
✅ **AI एप्लिकेशन डिप्लॉयमेंट मॉनिटर और समस्या निवारण करें**  
✅ **AI वर्कलोड्स के लिए लागत अनुकूलन रणनीतियाँ लागू करें**  

## समुदाय और समर्थन

### वर्कशॉप के दौरान

- 🙋 **प्रश्न**: वर्कशॉप चैट का उपयोग करें या हाथ उठाएँ  
- 🐛 **समस्याएँ**: [समस्या निवारण गाइड](../docs/troubleshooting/ai-troubleshooting.md) देखें  
- **टिप्स**: अन्य प्रतिभागियों के साथ खोजें साझा करें  

### वर्कशॉप के बाद

- 💬 **Discord**: [Azure AI Foundry समुदाय](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [टेम्पलेट समस्याएँ रिपोर्ट करें](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **फीडबैक**: [वर्कशॉप मूल्यांकन फॉर्म](https://aka.ms/azd-workshop-feedback)  

## अगले कदम

### सीखना जारी रखें

1. **उन्नत परिदृश्य**: [मल्टी-रीजन डिप्लॉयमेंट्स](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) का अन्वेषण करें  
2. **CI/CD एकीकरण**: [GitHub Actions वर्कफ़्लो](../docs/deployment/github-actions.md) सेट करें  
3. **कस्टम टेम्पलेट्स**: अपने [AZD टेम्पलेट्स](../docs/getting-started/custom-templates.md) बनाएं  

### अपने प्रोजेक्ट्स में लागू करें

1. **मूल्यांकन**: हमारा [रेडीनेस चेकलिस्ट](./production-readiness-checklist.md) उपयोग करें  
2. **टेम्पलेट्स**: हमारे [AI-विशिष्ट टेम्पलेट्स](../../../workshop/templates) से शुरू करें  
3. **समर्थन**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) में शामिल हों  

### अपनी सफलता साझा करें

- ⭐ **रिपॉजिटरी को स्टार करें** यदि इस वर्कशॉप ने आपकी मदद की  
- 🐦 **सोशल मीडिया पर साझा करें** #AzureDeveloperCLI #AzureAI के साथ  
- 📝 **ब्लॉग पोस्ट लिखें** अपनी AI डिप्लॉयमेंट यात्रा के बारे में  

---

## वर्कशॉप फीडबैक

आपकी प्रतिक्रिया हमें वर्कशॉप अनुभव को बेहतर बनाने में मदद करती है:

| पहलू | रेटिंग (1-5) | टिप्पणियाँ |
|------|--------------|------------|
| सामग्री की गुणवत्ता | ⭐⭐⭐⭐⭐ | |
| हैंड्स-ऑन लैब्स | ⭐⭐⭐⭐⭐ | |
| दस्तावेज़ीकरण | ⭐⭐⭐⭐⭐ | |
| कठिनाई स्तर | ⭐⭐⭐⭐⭐ | |
| समग्र अनुभव | ⭐⭐⭐⭐⭐ | |

**फीडबैक सबमिट करें**: [वर्कशॉप मूल्यांकन फॉर्म](https://aka.ms/azd-workshop-feedback)

---

**पिछला:** [AI समस्या निवारण गाइड](../docs/troubleshooting/ai-troubleshooting.md) | **अगला:** [लैब 1: AZD की नींव](../../../workshop/lab-1-azd-basics) शुरू करें  

**AZD के साथ AI एप्लिकेशन बनाना शुरू करने के लिए तैयार हैं?**

[लैब 1: AZD की नींव शुरू करें →](./lab-1-azd-basics/README.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।