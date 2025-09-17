<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T20:06:09+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ne"
}
-->
# AZD का लागि एआई डेभलपर्स कार्यशाला

**कार्यशाला नेभिगेसन**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 सम्बन्धित अध्यायहरू**: समेट्छ [अध्याय 1](../README.md#-chapter-1-foundation--quick-start), [अध्याय 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), र [अध्याय 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ प्रयोगात्मक प्रयोगशाला**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 अर्को चरणहरू**: [Workshop Lab Modules](../../../workshop)

Azure Developer CLI (AZD) सिक्नको लागि एआई एप्लिकेसन डिप्लोयमेन्टमा केन्द्रित यो प्रयोगात्मक कार्यशालामा स्वागत छ। यो कार्यशाला AZD को आधारभूत ज्ञानदेखि उत्पादन-तयार एआई समाधानहरू डिप्लोय गर्नसम्मको यात्रा प्रदान गर्न डिजाइन गरिएको छ।

## कार्यशाला अवलोकन

**अवधि:** २-३ घण्टा  
**स्तर:** प्रारम्भिकदेखि मध्यम  
**पूर्व-आवश्यकताहरू:** Azure, कमाण्ड लाइन उपकरणहरू, र एआई अवधारणाको आधारभूत ज्ञान

### तपाईंले के सिक्नुहुनेछ

- **AZD आधारभूत ज्ञान**: AZD सँग Infrastructure as Code को समझ  
- 🤖 **एआई सेवा एकीकरण**: Azure OpenAI, AI Search, र अन्य एआई सेवाहरू डिप्लोय गर्ने  
- **कन्टेनर डिप्लोयमेन्ट**: एआई एप्लिकेसनहरूको लागि Azure Container Apps प्रयोग गर्ने  
- **सुरक्षा उत्तम अभ्यासहरू**: Managed Identity र सुरक्षित कन्फिगरेसन कार्यान्वयन गर्ने  
- **मोनिटरिङ र अवलोकन**: एआई वर्कलोडहरूको लागि Application Insights सेटअप गर्ने  
- **उत्पादन ढाँचाहरू**: उद्यम-तयार डिप्लोयमेन्ट रणनीतिहरू  

## कार्यशाला संरचना

### मोड्युल 1: AZD आधारभूत (३० मिनेट)
- AZD स्थापना र कन्फिगरेसन  
- AZD प्रोजेक्ट संरचनाको समझ  
- तपाईंको पहिलो AZD डिप्लोयमेन्ट  
- **प्रयोगशाला**: एउटा साधारण वेब एप्लिकेसन डिप्लोय गर्नुहोस्  

### मोड्युल 2: Azure OpenAI एकीकरण (४५ मिनेट)
- Azure OpenAI स्रोतहरू सेटअप गर्ने  
- मोडेल डिप्लोयमेन्ट रणनीतिहरू  
- API पहुँच र प्रमाणीकरण कन्फिगर गर्ने  
- **प्रयोगशाला**: GPT-4 सँग च्याट एप्लिकेसन डिप्लोय गर्नुहोस्  

### मोड्युल 3: RAG एप्लिकेसनहरू (४५ मिनेट)
- Azure AI Search एकीकरण  
- Azure Document Intelligence सँग दस्तावेज प्रशोधन  
- भेक्टर एम्बेडिङ र सेम्यान्टिक सर्च  
- **प्रयोगशाला**: दस्तावेज Q&A प्रणाली निर्माण गर्नुहोस्  

### मोड्युल 4: उत्पादन डिप्लोयमेन्ट (३० मिनेट)
- कन्टेनर एप्स कन्फिगरेसन  
- स्केलिङ र प्रदर्शन अनुकूलन  
- मोनिटरिङ र लगिङ  
- **प्रयोगशाला**: अवलोकनसहित उत्पादनमा डिप्लोय गर्नुहोस्  

### मोड्युल 5: उन्नत ढाँचाहरू (१५ मिनेट)
- बहु-पर्यावरण डिप्लोयमेन्ट  
- CI/CD एकीकरण  
- लागत अनुकूलन रणनीतिहरू  
- **समाप्ति**: उत्पादन तयारी चेकलिस्ट  

## पूर्व-आवश्यकताहरू

### आवश्यक उपकरणहरू

कृपया कार्यशालाको अघि यी उपकरणहरू स्थापना गर्नुहोस्:

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

### Azure खाता सेटअप

1. **Azure सदस्यता**: [निःशुल्क साइन अप गर्नुहोस्](https://azure.microsoft.com/free/)  
2. **Azure OpenAI पहुँच**: [पहुँच अनुरोध गर्नुहोस्](https://aka.ms/oai/access)  
3. **आवश्यक अनुमतिहरू**:
   - सदस्यता वा स्रोत समूहमा Contributor भूमिका  
   - User Access Administrator (RBAC असाइनमेन्टहरूको लागि)  

### पूर्व-आवश्यकताहरू प्रमाणित गर्नुहोस्

तपाईंको सेटअप प्रमाणित गर्न यो स्क्रिप्ट चलाउनुहोस्:

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

## कार्यशाला सामग्रीहरू

### प्रयोगशाला अभ्यासहरू

प्रत्येक मोड्युलमा प्रारम्भिक कोड र चरण-दर-चरण निर्देशनसहित प्रयोगात्मक प्रयोगशालाहरू समावेश छन्:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - तपाईंको पहिलो AZD डिप्लोयमेन्ट  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI सँग च्याट एप्लिकेसन  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search सँग RAG एप्लिकेसन  
- **[lab-4-production/](../../../workshop/lab-4-production)** - उत्पादन डिप्लोयमेन्ट ढाँचाहरू  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - उन्नत डिप्लोयमेन्ट परिदृश्यहरू  

### सन्दर्भ सामग्रीहरू

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - व्यापक एकीकरण ढाँचाहरू  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - मोडेल डिप्लोयमेन्ट उत्तम अभ्यासहरू  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - उद्यम डिप्लोयमेन्ट ढाँचाहरू  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - सामान्य समस्याहरू र समाधानहरू  

### नमूना टेम्प्लेटहरू

सामान्य एआई परिदृश्यहरूको लागि छिटो सुरु टेम्प्लेटहरू:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## सुरु गर्दै

### विकल्प 1: GitHub Codespaces (सिफारिस गरिएको)

कार्यशाला सुरु गर्ने सबैभन्दा छिटो तरिका:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### विकल्प 2: स्थानीय विकास

1. **कार्यशाला रिपोजिटरी क्लोन गर्नुहोस्:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure मा लगइन गर्नुहोस्:**
```bash
az login
azd auth login
```

3. **प्रयोगशाला 1 बाट सुरु गर्नुहोस्:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### विकल्प 3: प्रशिक्षक-नेतृत्व कार्यशाला

यदि तपाईं प्रशिक्षक-नेतृत्व सत्रमा भाग लिँदै हुनुहुन्छ भने:

- 🎥 **कार्यशाला रेकर्डिङ**: [मागमा उपलब्ध](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord समुदाय**: [प्रत्यक्ष समर्थनको लागि सामेल हुनुहोस्](https://aka.ms/foundry/discord)  
- **कार्यशाला प्रतिक्रिया**: [तपाईंको अनुभव साझा गर्नुहोस्](https://aka.ms/azd-workshop-feedback)  

## कार्यशाला समयरेखा

### आत्म-गति सिकाइ (३ घण्टा)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### प्रशिक्षक-नेतृत्व सत्र (२.५ घण्टा)

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

## सफलता मापदण्ड

कार्यशाला समाप्त भएपछि, तपाईं सक्षम हुनुहुनेछ:

✅ **एआई एप्लिकेसनहरू डिप्लोय गर्नुहोस्** AZD टेम्प्लेटहरू प्रयोग गरेर  
✅ **Azure OpenAI कन्फिगर गर्नुहोस्** उचित सुरक्षासहित  
✅ **RAG एप्लिकेसनहरू निर्माण गर्नुहोस्** Azure AI Search एकीकरणको साथ  
✅ **उत्पादन ढाँचाहरू कार्यान्वयन गर्नुहोस्** उद्यम एआई वर्कलोडहरूको लागि  
✅ **एआई एप्लिकेसन डिप्लोयमेन्टहरू मोनिटर र समस्या समाधान गर्नुहोस्**  
✅ **एआई वर्कलोडहरूको लागि लागत अनुकूलन रणनीतिहरू लागू गर्नुहोस्**  

## समुदाय र समर्थन

### कार्यशालाको समयमा

- 🙋 **प्रश्नहरू**: कार्यशाला च्याट प्रयोग गर्नुहोस् वा हात उठाउनुहोस्  
- 🐛 **समस्याहरू**: [समस्या समाधान गाइड](../docs/troubleshooting/ai-troubleshooting.md) जाँच गर्नुहोस्  
- **टिप्स**: अन्य सहभागीहरूसँग खोजहरू साझा गर्नुहोस्  

### कार्यशालापछि

- 💬 **Discord**: [Azure AI Foundry समुदाय](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [टेम्प्लेट समस्याहरू रिपोर्ट गर्नुहोस्](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **प्रतिक्रिया**: [कार्यशाला मूल्यांकन फारम](https://aka.ms/azd-workshop-feedback)  

## अर्को चरणहरू

### सिकाइ जारी राख्नुहोस्

1. **उन्नत परिदृश्यहरू**: [बहु-क्षेत्र डिप्लोयमेन्टहरू](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) अन्वेषण गर्नुहोस्  
2. **CI/CD एकीकरण**: [GitHub Actions वर्कफ्लोहरू सेटअप गर्नुहोस्](../docs/deployment/github-actions.md)  
3. **कस्टम टेम्प्लेटहरू**: [AZD टेम्प्लेटहरू](../docs/getting-started/custom-templates.md) सिर्जना गर्नुहोस्  

### तपाईंको परियोजनाहरूमा लागू गर्नुहोस्

1. **मूल्यांकन**: हाम्रो [तयारी चेकलिस्ट](./production-readiness-checklist.md) प्रयोग गर्नुहोस्  
2. **टेम्प्लेटहरू**: हाम्रो [एआई-विशिष्ट टेम्प्लेटहरू](../../../workshop/templates) बाट सुरु गर्नुहोस्  
3. **समर्थन**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) मा सामेल हुनुहोस्  

### तपाईंको सफलता साझा गर्नुहोस्

- ⭐ **रिपोजिटरी स्टार गर्नुहोस्** यदि यो कार्यशालाले तपाईंलाई मद्दत गर्‍यो भने  
- 🐦 **सोशल मिडियामा साझा गर्नुहोस्** #AzureDeveloperCLI #AzureAI प्रयोग गरेर  
- 📝 **ब्लग पोस्ट लेख्नुहोस्** तपाईंको एआई डिप्लोयमेन्ट यात्राको बारेमा  

---

## कार्यशाला प्रतिक्रिया

तपाईंको प्रतिक्रिया कार्यशाला अनुभव सुधार गर्न मद्दत गर्दछ:

| पक्ष | रेटिङ (१-५) | टिप्पणीहरू |
|------|-------------|-----------|
| सामग्रीको गुणस्तर | ⭐⭐⭐⭐⭐ | |
| प्रयोगात्मक प्रयोगशाला | ⭐⭐⭐⭐⭐ | |
| दस्तावेजीकरण | ⭐⭐⭐⭐⭐ | |
| कठिनाई स्तर | ⭐⭐⭐⭐⭐ | |
| समग्र अनुभव | ⭐⭐⭐⭐⭐ | |

**प्रतिक्रिया दिनुहोस्**: [कार्यशाला मूल्यांकन फारम](https://aka.ms/azd-workshop-feedback)

---

**अघिल्लो:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **अर्को:** [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics) बाट सुरु गर्नुहोस्  

**AZD सँग एआई एप्लिकेसनहरू निर्माण गर्न तयार हुनुहुन्छ?**

[Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md) बाट सुरु गर्नुहोस्

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।