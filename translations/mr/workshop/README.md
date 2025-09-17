<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T19:47:42+00:00",
  "source_file": "workshop/README.md",
  "language_code": "mr"
}
-->
# AZD फॉर AI डेव्हलपर्स वर्कशॉप

**वर्कशॉप नेव्हिगेशन**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../README.md)
- **📖 संबंधित अध्याय**: [अध्याय 1](../README.md#-chapter-1-foundation--quick-start), [अध्याय 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), आणि [अध्याय 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced) समाविष्ट
- **🛠️ हँड्स-ऑन लॅब**: [AI वर्कशॉप लॅब](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 पुढील पायऱ्या**: [वर्कशॉप लॅब मॉड्यूल्स](../../../workshop)

Azure Developer CLI (AZD) शिकण्यासाठी आणि AI अॅप्लिकेशन डिप्लॉयमेंटवर लक्ष केंद्रित करण्यासाठी हँड्स-ऑन वर्कशॉपमध्ये आपले स्वागत आहे. या वर्कशॉपमध्ये AZD च्या मूलभूत गोष्टींपासून उत्पादन-तयार AI सोल्यूशन्स डिप्लॉय करण्यापर्यंत मार्गदर्शन केले जाते.

## वर्कशॉपचा आढावा

**कालावधी:** 2-3 तास  
**स्तर:** नवशिक्या ते मध्यम  
**पूर्वतयारी:** Azure, कमांड लाइन टूल्स, आणि AI संकल्पनांचे मूलभूत ज्ञान

### तुम्ही काय शिकाल

- **AZD मूलभूत गोष्टी**: AZD सह Infrastructure as Code समजून घेणे
- 🤖 **AI सेवा एकत्रीकरण**: Azure OpenAI, AI Search, आणि इतर AI सेवा डिप्लॉय करणे
- **कंटेनर डिप्लॉयमेंट**: AI अॅप्लिकेशन्ससाठी Azure Container Apps वापरणे
- **सुरक्षेचे सर्वोत्तम पद्धती**: Managed Identity आणि सुरक्षित कॉन्फिगरेशन्स लागू करणे
- **मॉनिटरिंग आणि निरीक्षण**: AI वर्कलोडसाठी Application Insights सेट करणे
- **उत्पादन पॅटर्न्स**: एंटरप्राइझ-तयार डिप्लॉयमेंट स्ट्रॅटेजीज

## वर्कशॉपची रचना

### मॉड्यूल 1: AZD फाउंडेशन्स (30 मिनिटे)
- AZD इंस्टॉल आणि कॉन्फिगर करणे
- AZD प्रोजेक्ट स्ट्रक्चर समजून घेणे
- तुमचा पहिला AZD डिप्लॉयमेंट
- **लॅब**: एक साधे वेब अॅप्लिकेशन डिप्लॉय करा

### मॉड्यूल 2: Azure OpenAI एकत्रीकरण (45 मिनिटे)
- Azure OpenAI संसाधने सेट करणे
- मॉडेल डिप्लॉयमेंट स्ट्रॅटेजीज
- API ऍक्सेस आणि ऑथेंटिकेशन कॉन्फिगर करणे
- **लॅब**: GPT-4 सह एक चॅट अॅप्लिकेशन डिप्लॉय करा

### मॉड्यूल 3: RAG अॅप्लिकेशन्स (45 मिनिटे)
- Azure AI Search एकत्रीकरण
- Azure Document Intelligence सह दस्तऐवज प्रक्रिया
- व्हेक्टर एम्बेडिंग्स आणि सिमॅंटिक सर्च
- **लॅब**: एक दस्तऐवज Q&A प्रणाली तयार करा

### मॉड्यूल 4: उत्पादन डिप्लॉयमेंट (30 मिनिटे)
- कंटेनर अॅप्स कॉन्फिगरेशन
- स्केलिंग आणि कार्यक्षमता ऑप्टिमायझेशन
- मॉनिटरिंग आणि लॉगिंग
- **लॅब**: निरीक्षणासह उत्पादनात डिप्लॉय करा

### मॉड्यूल 5: प्रगत पॅटर्न्स (15 मिनिटे)
- मल्टी-एन्व्हायर्नमेंट डिप्लॉयमेंट्स
- CI/CD एकत्रीकरण
- खर्च ऑप्टिमायझेशन स्ट्रॅटेजीज
- **समारोप**: उत्पादन तयारी चेकलिस्ट

## पूर्वतयारी

### आवश्यक टूल्स

कृपया वर्कशॉपपूर्वी ही टूल्स इंस्टॉल करा:

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

### Azure खाते सेटअप

1. **Azure सबस्क्रिप्शन**: [फ्री साठी साइन अप करा](https://azure.microsoft.com/free/)
2. **Azure OpenAI ऍक्सेस**: [ऍक्सेससाठी विनंती करा](https://aka.ms/oai/access)
3. **आवश्यक परवानग्या**:
   - सबस्क्रिप्शन किंवा रिसोर्स ग्रुपवर Contributor भूमिका
   - User Access Administrator (RBAC असाइनमेंटसाठी)

### पूर्वतयारी सत्यापित करा

तुमची सेटअप सत्यापित करण्यासाठी हा स्क्रिप्ट चालवा:

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

## वर्कशॉप साहित्य

### लॅब एक्सरसाइजेस

प्रत्येक मॉड्यूलमध्ये स्टार्टर कोड आणि स्टेप-बाय-स्टेप सूचना असलेल्या हँड्स-ऑन लॅब्स समाविष्ट आहेत:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - तुमचा पहिला AZD डिप्लॉयमेंट
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI सह चॅट अॅप्लिकेशन
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search सह RAG अॅप्लिकेशन
- **[lab-4-production/](../../../workshop/lab-4-production)** - उत्पादन डिप्लॉयमेंट पॅटर्न्स
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - प्रगत डिप्लॉयमेंट परिस्थिती

### संदर्भ साहित्य

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - व्यापक एकत्रीकरण पॅटर्न्स
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - मॉडेल डिप्लॉयमेंट सर्वोत्तम पद्धती
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - एंटरप्राइझ डिप्लॉयमेंट पॅटर्न्स
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - सामान्य समस्या आणि उपाय

### नमुना टेम्पलेट्स

सामान्य AI परिस्थितीसाठी क्विक-स्टार्ट टेम्पलेट्स:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## सुरुवात करा

### पर्याय 1: GitHub Codespaces (शिफारस केलेले)

वर्कशॉप सुरू करण्याचा सर्वात जलद मार्ग:

[![GitHub Codespaces मध्ये उघडा](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### पर्याय 2: स्थानिक विकास

1. **वर्कशॉप रेपॉझिटरी क्लोन करा:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure मध्ये लॉगिन करा:**
```bash
az login
azd auth login
```

3. **लॅब 1 पासून सुरू करा:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### पर्याय 3: प्रशिक्षक-नेतृत्व वर्कशॉप

जर तुम्ही प्रशिक्षक-नेतृत्व सत्रात सहभागी होत असाल:

- 🎥 **वर्कशॉप रेकॉर्डिंग**: [मागणीनुसार उपलब्ध](https://aka.ms/azd-ai-workshop)
- 💬 **Discord समुदाय**: [लाइव्ह सपोर्टसाठी सामील व्हा](https://aka.ms/foundry/discord)
- **वर्कशॉप फीडबॅक**: [तुमचा अनुभव शेअर करा](https://aka.ms/azd-workshop-feedback)

## वर्कशॉप टाइमलाइन

### स्व-गतीने शिकणे (3 तास)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### प्रशिक्षक-नेतृत्व सत्र (2.5 तास)

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

## यशाचे निकष

वर्कशॉपच्या शेवटी, तुम्ही हे करू शकाल:

✅ **AZD टेम्पलेट्स वापरून AI अॅप्लिकेशन्स डिप्लॉय करा**  
✅ **योग्य सुरक्षेसह Azure OpenAI सेवा कॉन्फिगर करा**  
✅ **Azure AI Search एकत्रीकरणासह RAG अॅप्लिकेशन्स तयार करा**  
✅ **एंटरप्राइझ AI वर्कलोडसाठी उत्पादन पॅटर्न्स लागू करा**  
✅ **AI अॅप्लिकेशन डिप्लॉयमेंट्स मॉनिटर आणि ट्रबलशूट करा**  
✅ **AI वर्कलोडसाठी खर्च ऑप्टिमायझेशन स्ट्रॅटेजीज लागू करा**  

## समुदाय आणि समर्थन

### वर्कशॉप दरम्यान

- 🙋 **प्रश्न**: वर्कशॉप चॅट वापरा किंवा तुमचा हात वर करा
- 🐛 **समस्या**: [ट्रबलशूटिंग गाइड](../docs/troubleshooting/ai-troubleshooting.md) तपासा
- **टीप्स**: इतर सहभागींसोबत शोध शेअर करा

### वर्कशॉपनंतर

- 💬 **Discord**: [Azure AI Foundry समुदाय](https://aka.ms/foundry/discord)
- **GitHub Issues**: [टेम्पलेट समस्या रिपोर्ट करा](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **फीडबॅक**: [वर्कशॉप मूल्यांकन फॉर्म](https://aka.ms/azd-workshop-feedback)

## पुढील पायऱ्या

### शिकणे सुरू ठेवा

1. **प्रगत परिस्थिती**: [मल्टी-रीजन डिप्लॉयमेंट्स](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) एक्सप्लोर करा
2. **CI/CD एकत्रीकरण**: [GitHub Actions वर्कफ्लोज](../docs/deployment/github-actions.md) सेट करा
3. **कस्टम टेम्पलेट्स**: तुमचे स्वतःचे [AZD टेम्पलेट्स](../docs/getting-started/custom-templates.md) तयार करा

### तुमच्या प्रोजेक्ट्समध्ये लागू करा

1. **मूल्यांकन**: आमचा [तयारी चेकलिस्ट](./production-readiness-checklist.md) वापरा
2. **टेम्पलेट्स**: आमच्या [AI-विशिष्ट टेम्पलेट्स](../../../workshop/templates) पासून सुरू करा
3. **समर्थन**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) मध्ये सामील व्हा

### तुमचे यश शेअर करा

- ⭐ **रेपॉझिटरीला स्टार द्या** जर या वर्कशॉपने तुम्हाला मदत केली असेल
- 🐦 **सोशल मीडियावर शेअर करा** #AzureDeveloperCLI #AzureAI सह
- 📝 **ब्लॉग पोस्ट लिहा** तुमच्या AI डिप्लॉयमेंट प्रवासाबद्दल

---

## वर्कशॉप फीडबॅक

तुमचा फीडबॅक वर्कशॉप अनुभव सुधारण्यास मदत करतो:

| पैलू | रेटिंग (1-5) | टिप्पण्या |
|------|--------------|-----------|
| सामग्री गुणवत्ता | ⭐⭐⭐⭐⭐ | |
| हँड्स-ऑन लॅब्स | ⭐⭐⭐⭐⭐ | |
| दस्तऐवजीकरण | ⭐⭐⭐⭐⭐ | |
| अडचण पातळी | ⭐⭐⭐⭐⭐ | |
| एकूण अनुभव | ⭐⭐⭐⭐⭐ | |

**फीडबॅक सबमिट करा**: [वर्कशॉप मूल्यांकन फॉर्म](https://aka.ms/azd-workshop-feedback)

---

**मागील:** [AI ट्रबलशूटिंग गाइड](../docs/troubleshooting/ai-troubleshooting.md) | **पुढील:** [लॅब 1: AZD बेसिक्स](../../../workshop/lab-1-azd-basics) सुरू करा

**AZD सह AI अॅप्लिकेशन्स तयार करण्यास सुरुवात करण्यासाठी तयार आहात?**

[लॅब 1: AZD फाउंडेशन्स सुरू करा →](./lab-1-azd-basics/README.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.