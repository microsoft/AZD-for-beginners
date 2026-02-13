# अक्सर पूछे जाने वाले प्रश्न (FAQ)

**अध्याय के अनुसार सहायता प्राप्त करें**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../README.md)
- **🚆 स्थापना समस्याएँ**: [अध्याय 1: स्थापना और सेटअप](../docs/getting-started/installation.md)
- **🤖 AI प्रश्न**: [अध्याय 2: AI-प्रथम विकास](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 समस्या निवारण**: [अध्याय 7: समस्या निवारण और डीबगिंग](../docs/troubleshooting/common-issues.md)

## परिचय

यह विस्तृत FAQ Azure Developer CLI (azd) और Azure पर तैनाती के बारे में सबसे आम प्रश्नों के उत्तर प्रदान करता है। सामान्य समस्याओं के त्वरित समाधान खोजें, सर्वोत्तम अभ्यास समझें, और azd अवधारणाओं व वर्कफ़्लो पर स्पष्टीकरण प्राप्त करें।

## सीखने के लक्ष्य

इस FAQ की समीक्षा करके, आप:
- सामान्य Azure Developer CLI प्रश्नों और समस्याओं के त्वरित उत्तर पाएंगे
- व्यावहारिक Q&A प्रारूप के माध्यम से प्रमुख अवधारणाएँ और शब्दावली समझेंगे
- बार-बार होने वाली समस्याओं और त्रुटि परिदृश्यों के लिए समस्या निवारण समाधान तक पहुँचेंगे
- अनुकूलन के बारे में सामान्य पूछे जाने वाले प्रश्नों के माध्यम से सर्वोत्तम अभ्यास सीखेंगे
- विशेषज्ञ-स्तरीय प्रश्नों के माध्यम से उन्नत विशेषताएँ और क्षमताएँ खोजेंगे
- लागत, सुरक्षा और तैनाती रणनीति के मार्गदर्शन का कुशलता से संदर्भ पाएंगे

## सीखने के परिणाम

इस FAQ को नियमित रूप से संदर्भित करने पर, आप सक्षम होंगे:
- प्रदत्त समाधान का उपयोग करके सामान्य Azure Developer CLI समस्याओं को स्वतंत्र रूप से हल करना
- तैनाती रणनीतियों और कॉन्फ़िगरेशन के बारे में सूचित निर्णय लेना
- azd और अन्य Azure उपकरणों व सेवाओं के बीच संबंध समझना
- समुदाय के अनुभव और विशेषज्ञ सिफारिशों के आधार पर सर्वोत्तम अभ्यास लागू करना
- प्रमाणीकरण, तैनाती, और कॉन्फ़िगरेशन समस्याओं का प्रभावी ढंग से निवारण करना
- FAQ अंतर्दृष्टि और सिफारिशों का उपयोग करके लागत और प्रदर्शन का अनुकूलन करना

## विषय-सूची

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) एक डेवलपर-केंद्रित कमांड-लाइन टूल है जो आपके एप्लिकेशन को स्थानीय विकास वातावरण से Azure तक पहुँचाने का समय तेज़ करता है। यह टेम्पलेट्स के माध्यम से सर्वोत्तम अभ्यास प्रदान करता है और संपूर्ण तैनाती जीवनचक्र में मदद करता है।

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Azure संसाधनों का प्रबंधन करने के लिए सामान्य-उद्देश्य का टूल
- **azd**: एप्लिकेशन तैनाती वर्कफ़्लो के लिए डेवलपर-केंद्रित टूल
- azd आंतरिक रूप से Azure CLI का उपयोग करता है लेकिन सामान्य विकास परिदृश्यों के लिए उच्च-स्तरीय अमूर्तन प्रदान करता है
- azd टेम्पलेट्स, पर्यावरण प्रबंधन, और तैनाती स्वचालन शामिल करता है

### Q: Do I need Azure CLI installed to use azd?
**A**: हाँ, azd के लिए प्रमाणीकरण और कुछ संचालन हेतु Azure CLI की आवश्यकता होती है। पहले Azure CLI स्थापित करें, फिर azd स्थापित करें।

### Q: What programming languages does azd support?
**A**: azd भाषा-निरपेक्ष है। यह काम करता है:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- स्थिर वेबसाइटें
- कंटेनरीकृत एप्लिकेशन

### Q: Can I use azd with existing projects?
**A**: हाँ! आप या तो:
1. `azd init` का उपयोग करके मौजूदा प्रोजेक्ट में azd कॉन्फ़िगरेशन जोड़ें
2. अपने मौजूदा प्रोजेक्ट को azd टेम्पलेट संरचना के अनुरूप अनुकूलित करें
3. अपनी मौजूदा आर्किटेक्चर के आधार पर कस्टम टेम्पलेट बनाएं

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: `azd auth login` का उपयोग करें जो Azure प्रमाणीकरण के लिए ब्राउज़र विंडो खोलेगा। CI/CD परिदृश्यों के लिए, service principals या managed identities का उपयोग करें।

### Q: Can I use azd with multiple Azure subscriptions?
**A**: हाँ। प्रत्येक पर्यावरण के लिए किस subscription का उपयोग करना है, इसे निर्दिष्ट करने हेतु `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` का उपयोग करें।

### Q: What permissions do I need to deploy with azd?
**A**: सामान्यतः आपको चाहिए:
- संसाधन समूह या सदस्यता पर **Contributor** भूमिका
- यदि ऐसे संसाधन तैनात कर रहे हैं जिन्हें भूमिका असाइनमेंट की आवश्यकता है तो **User Access Administrator**
- विशिष्ट अनुमतियाँ टेम्पलेट और तैनात किए जा रहे संसाधनों के अनुसार अलग-अलग होती हैं

### Q: Can I use azd in CI/CD pipelines?
**A**: बिल्कुल! azd CI/CD एकीकरण के लिए डिज़ाइन किया गया है। प्रमाणीकरण के लिए service principals का उपयोग करें और कॉन्फ़िगरेशन के लिए पर्यावरण चर सेट करें।

### Q: How do I handle authentication in GitHub Actions?
**A**: service principal प्रमाणपत्रों के साथ Azure Login action का उपयोग करें:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- आधिकारिक टेम्पलेट्स: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- समुदाय के टेम्पलेट्स: GitHub पर "azd-template" खोजें
- उपलब्ध टेम्पलेट्स ब्राउज़ करने के लिए `azd template list` का उपयोग करें

### Q: How do I create a custom template?
**A**: 
1. किसी मौजूदा टेम्पलेट संरचना से शुरू करें
2. `azure.yaml`, इन्फ़्रास्ट्रक्चर फ़ाइलों, और एप्लिकेशन कोड को संशोधित करें
3. `azd up` के साथ पूरी तरह से टेस्ट करें
4. उपयुक्त टैग के साथ GitHub पर प्रकाशित करें

### Q: Can I use azd without a template?
**A**: हाँ, आवश्यक कॉन्फ़िगरेशन फ़ाइलें बनाने के लिए मौजूदा प्रोजेक्ट में `azd init` का उपयोग करें। आपको मैन्युअल रूप से `azure.yaml` और इन्फ्रास्ट्रक्चर फ़ाइलों को कॉन्फ़िगर करना होगा।

### Q: What's the difference between official and community templates?
**A**: 
- **आधिकारिक टेम्पलेट्स**: Microsoft द्वारा रखरखाव किए जाते हैं, नियमित रूप से अपडेट होते हैं, व्यापक दस्तावेज़ीकरण
- **समुदाय टेम्पलेट्स**: डेवलपर्स द्वारा बनाए जाते हैं, विशिष्ट उपयोग मामलों के लिए हो सकते हैं, गुणवत्ता और रखरखाव में भिन्नता हो सकती है

### Q: How do I update a template in my project?
**A**: टेम्पलेट्स स्वतः अपडेट नहीं होते। आप कर सकते हैं:
1. स्रोत टेम्पलेट से मैन्युअली परिवर्तन तुलना और मर्ज करें
2. अपडेटेड टेम्पलेट का उपयोग करके `azd init` के साथ नया प्रारंभ करें
3. अपडेट किए गए टेम्पलेट्स से विशिष्ट उन्नतियों को cherry-pick करें

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd Bicep/ARM टेम्पलेट्स के माध्यम से किसी भी Azure सेवा को तैनात कर सकता है, जिनमें शामिल हैं:
- App Services, Container Apps, Functions
- डेटाबेस (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- नेटवर्किंग, सुरक्षा, और निगरानी संसाधन

### Q: Can I deploy to multiple regions?
**A**: हाँ, अपनी Bicep टेम्पलेट्स में कई क्षेत्रों को कॉन्फ़िगर करें और प्रत्येक पर्यावरण के लिए location पैरामीटर को उपयुक्त रूप से सेट करें।

### Q: How do I handle database schema migrations?
**A**: `azure.yaml` में deployment hooks का उपयोग करें:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: हाँ, केवल इन्फ्रास्ट्रक्चर घटकों को तैनात करने के लिए `azd provision` का उपयोग करें जो आपकी टेम्पलेट्स में परिभाषित हैं।

### Q: How do I deploy to existing Azure resources?
**A**: यह जटिल है और सीधे समर्थित नहीं है। आप कर सकते हैं:
1. मौजूदा संसाधनों को अपने Bicep टेम्पलेट्स में इम्पोर्ट करें
2. टेम्पलेट्स में मौजूदा संसाधन संदर्भों का उपयोग करें
3. संसाधनों को सशर्त रूप से बनाने या संदर्भित करने के लिए टेम्पलेट्स में संशोधन करें

### Q: Can I use Terraform instead of Bicep?
**A**: वर्तमान में, azd प्राथमिक रूप से Bicep/ARM टेम्पलेट्स का समर्थन करता है। Terraform का आधिकारिक समर्थन उपलब्ध नहीं है, हालांकि समुदाय समाधान मौजूद हो सकते हैं।

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: `azd env new <environment-name>` के साथ अलग-अलग पर्यावरण बनाएं और प्रत्येक के लिए अलग सेटिंग्स कॉन्फ़िगर करें:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: आपकी प्रोजेक्ट डायरेक्टरी के भीतर `.azure` फ़ोल्डर में। प्रत्येक पर्यावरण की अपनी फ़ोल्डर होती है जिसमें कॉन्फ़िगरेशन फ़ाइलें होती हैं।

### Q: How do I set environment-specific configuration?
**A**: पर्यावरण चर कॉन्फ़िगर करने के लिए `azd env set` का उपयोग करें:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: `.azure` फ़ोल्डर संवेदनशील जानकारी रखता है और इसे वर्शन कंट्रोल में कमिट नहीं करना चाहिए। इसके बजाय:
1. आवश्यक पर्यावरण चर दस्तावेज़ करें
2. पर्यावरण सेट करने के लिए तैनाती स्क्रिप्ट्स का उपयोग करें
3. संवेदनशील कॉन्फ़िगरेशन के लिए Azure Key Vault का उपयोग करें

### Q: How do I override template defaults?
**A**: टेम्पलेट पैरामीटर से संबंधित पर्यावरण चर सेट करें:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: सामान्य कारण:
1. **प्रमाणीकरण समस्याएँ**: `azd auth login` चलाएँ
2. **पर्याप्त अनुमतियाँ नहीं**: अपने Azure भूमिका असाइनमेंट जांचें
3. **संसाधन नामकरण संघर्ष**: AZURE_ENV_NAME बदलें
4. **कोटा/क्षमता समस्याएँ**: क्षेत्रीय उपलब्धता जांचें
5. **टेम्पलेट त्रुटियाँ**: Bicep टेम्पलेट्स मान्य करें

### Q: How do I debug deployment failures?
**A**: 
1. विस्तृत आउटपुट के लिए `azd deploy --debug` का उपयोग करें
2. Azure पोर्टल में तैनाती इतिहास जांचें
3. Azure पोर्टल में Activity Log की समीक्षा करें
4. वर्तमान पर्यावरण स्थिति दिखाने के लिए `azd show` का उपयोग करें

### Q: Why are my environment variables not working?
**A**: जाँच करें:
1. चर के नाम टेम्पलेट पैरामीटर से बिल्कुल मेल खाते हों
2. यदि मान में स्पेस हैं तो मान ठीक से उद्धृत हों
3. पर्यावरण चयनित है: `azd env select <environment>`
4. चर सही पर्यावरण में सेट किए गए हों

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
This removes all resources and environment configuration.

### Q: Why is my application not accessible after deployment?
**A**: जाँच करें:
1. तैनाती सफलतापूर्वक पूरी हुई थी
2. एप्लिकेशन चल रहा है (Azure पोर्टल में लॉग देखें)
3. नेटवर्क सुरक्षा समूह ट्रैफ़िक की अनुमति देते हैं
4. DNS/कस्टम डोमेन सही ढंग से कॉन्फ़िगर किए गए हैं

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: लागत इस पर निर्भर करती है:
- तैनात किए गए Azure सेवाएँ
- चुने गए सेवा टियर/SKU
- क्षेत्रीय मूल्य भिन्नताएँ
- उपयोग के पैटर्न

अनुमानों के लिए [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) का उपयोग करें।

### Q: How do I control costs in azd deployments?
**A**: 
1. विकास पर्यावरणों के लिए lower-tier SKUs का उपयोग करें
2. Azure budgets और अलर्ट सेट करें
3. आवश्यकता न होने पर संसाधनों को हटाने के लिए `azd down` का उपयोग करें
4. उपयुक्त क्षेत्रों का चयन करें (लागत स्थान के अनुसार भिन्न होती है)
5. Azure Cost Management टूल्स का उपयोग करें

### Q: Are there free tier options for azd templates?
**A**: कई Azure सेवाएँ free tiers प्रदान करती हैं:
- App Service: Free tier उपलब्ध
- Azure Functions: 1M मुफ्त executions/महीना
- Cosmos DB: 400 RU/s के साथ Free tier
- Application Insights: पहले 5GB/महीना मुफ्त

जहाँ उपलब्ध हो, टेम्पलेट्स को free tiers का उपयोग करने के लिए कॉन्फ़िगर करें।

### Q: How do I estimate costs before deployment?
**A**: 
1. देखें कि टेम्पलेट का `main.bicep` कौन से संसाधन बनाता है
2. विशिष्ट SKUs के साथ Azure Pricing Calculator का उपयोग करें
3. वास्तविक लागत मॉनिटर करने के लिए पहले विकास पर्यावरण में तैनात करें
4. विस्तृत लागत विश्लेषण के लिए Azure Cost Management का उपयोग करें

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. एप्लिकेशन कोड को इन्फ्रास्ट्रक्चर से अलग रखें
2. `azure.yaml` में सार्थक सेवा नामों का उपयोग करें
3. बिल्ड स्क्रिप्ट्स में उचित त्रुटि हैंडलिंग लागू करें
4. पर्यावरण-विशिष्ट कॉन्फ़िगरेशन का उपयोग करें
5. विस्तृत दस्तावेज़ीकरण शामिल करें

### Q: How should I organize multiple services in azd?
**A**: अनुशंसित संरचना का उपयोग करें:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **नहीं!** `.azure` फ़ोल्डर संवेदनशील जानकारी रखता है। इसे `.gitignore` में जोड़ें:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. गुप्त जानकारी के लिए Azure Key Vault का उपयोग करें
2. एप्लिकेशन कॉन्फ़िगरेशन में Key Vault के secrets का संदर्भ लें
3. कभी भी गुप्त जानकारी वर्शन कंट्रोल में कमिट न करें
4. सेवा-से-सेवा प्रमाणीकरण के लिए managed identities का उपयोग करें

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. प्रत्येक चरण (dev/staging/prod) के लिए अलग-अलग पर्यावरण का उपयोग करें
2. तैनाती से पहले स्वचालित परीक्षण लागू करें
3. प्रमाणीकरण के लिए service principals का उपयोग करें
4. संवेदनशील कॉन्फ़िगरेशन को pipeline secrets/variables में स्टोर करें
5. उत्पादन तैनाती के लिए अनुमोदन गेट लागू करें

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: हाँ, `azure.yaml` में deployment hooks के माध्यम से:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. मौजूदा pipeline स्क्रिप्ट्स में azd कमांड्स का उपयोग करें
2. टीमों में azd टेम्पलेट्स को मानकीकृत करें
3. मौजूदा निगरानी और अलर्टिंग के साथ एकीकृत करें
4. pipeline एकीकरण के लिए azd के JSON आउटपुट का उपयोग करें

### Q: Can I use azd with Azure DevOps?
**A**: हाँ, azd किसी भी CI/CD सिस्टम के साथ काम करता है। azd कमांड्स का उपयोग करने वाले Azure DevOps pipelines बनाएं।

### Q: How do I contribute to azd or create community templates?
**A**:
1. **azd टूल**: [Azure/azure-dev](https://github.com/Azure/azure-dev) में योगदान करें
2. **टेम्पलेट्स**: [टेम्पलेट दिशानिर्देशों](https://github.com/Azure-Samples/awesome-azd) का पालन करते हुए टेम्पलेट बनाएं
3. **प्रलेखन**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) पर योगदान करें

### Q: azd के लिए रोडमैप क्या है?
**A**: नियोजित सुविधाओं और सुधारों के लिए [आधिकारिक रोडमैप](https://github.com/Azure/azure-dev/projects) देखें।

### Q: मैं अन्य तैनाती टूल्स से azd पर कैसे माइग्रेट करूँ?
**A**: 
1. वर्तमान तैनाती संरचना का विश्लेषण करें
2. समान Bicep टेम्पलेट बनाएं
3. वर्तमान सेवाओं से मेल करने के लिए `azure.yaml` कॉन्फ़िगर करें
4. विकास वातावरण में पूरी तरह से परीक्षण करें
5. क्रमशः वातावरणों को माइग्रेट करें

---

## क्या अभी भी प्रश्न हैं?

### **पहले खोजें**
- [आधिकारिक दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) देखें
- समान समस्याओं के लिए [GitHub issues](https://github.com/Azure/azure-dev/issues) में खोजें

### **मदद लें**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - सामुदायिक सहायता
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - तकनीकी प्रश्न
- [Azure Discord](https://discord.gg/azure) - रियल-टाइम समुदाय चैट

### **समस्याएँ रिपोर्ट करें**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - बग रिपोर्ट और फीचर अनुरोध
- प्रासंगिक लॉग, त्रुटि संदेश, और पुनरुत्पादन के चरण शामिल करें

### **और जानें**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*यह FAQ नियमित रूप से अपडेट किया जाता है। अंतिम अपडेट: September 9, 2025*

---

**नेविगेशन**
- **पिछला पाठ**: [Glossary](glossary.md)
- **अगला पाठ**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफ़हमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->