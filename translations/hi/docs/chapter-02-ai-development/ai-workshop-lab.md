# एआई वर्कशॉप लैब: आपकी एआई समाधान को AZD-डिप्लॉयबल बनाना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - एआई-फर्स्ट डेवलपमेंट
- **⬅️ पिछला**: [AI मॉडल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ अगला**: [प्रोडक्शन AI बेस्ट प्रैक्टिसेज़](../chapter-08-production/production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

## वर्कशॉप अवलोकन

यह हैंड्स-ऑन लैब डेवलपर्स को एक मौजूदा AI टेम्पलेट लेने और उसे Azure Developer CLI (AZD) का उपयोग करके डिप्लॉय करने की प्रक्रिया के माध्यम से मार्गदर्शन करता है। आप Microsoft Foundry सेवाओं का उपयोग करके प्रोडक्शन AI डिप्लॉयमेंट के आवश्यक पैटर्न सीखेंगे।

> **रिलीज़ समीक्षा (2026-11-04):** AZD कमांड गाइडेंस और सैंपल कॉन्फ़िगरेशन नामों की जांच `azd` `1.37.2` रिलीज़ और लिंक्ड सैंपल की वर्तमान कॉन्फ़िगरेशन के खिलाफ की गई थी। यह एक दस्तावेज़ समीक्षा है, लाइव डिप्लॉयमेंट वैलिडेशन नहीं। RAG लैब के लिए एजेंट एक्सटेंशन की आवश्यकता नहीं है; एजेंट मूल्यांकनों के लिए अलग `azure.ai.evaluations` एक्सटेंशन और [वर्तमान मूल्यांकन वर्कफ़्लो](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) का उपयोग करें, पुराने एजेंट मूल्यांकन कमांड का नहीं।

**समय अवधि:** 2-3 घंटे  
**स्तर:** मध्यवर्ती  
**पूर्व आवश्यकताएँ:** बुनियादी Azure ज्ञान, AI/ML अवधारणाओं से परिचित

## 🎓 सीखने के उद्देश्य

इस वर्कशॉप के अंत तक, आप सक्षम होंगे:
- ✅ एक मौजूदा AI AZD टेम्पलेट का अन्वेषण करें और अपनी खुद की एप्लिकेशन के रूपांतरण की योजना बनाएं
- ✅ AZD के साथ Microsoft Foundry सेवाओं को कॉन्फ़िगर करें
- ✅ AI सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करें
- ✅ निगरानी के साथ एक AI संदर्भ एप्लिकेशन को डिप्लॉय करें
- ✅ सामान्य AI डिप्लॉयमेंट समस्याओं का समाधान करें

## पूर्व आवश्यकताएँ

### आवश्यक उपकरण
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इंस्टॉल किया हुआ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इंस्टॉल किया हुआ
- [Git](https://git-scm.com/) इंस्टॉल किया हुआ
- कोड संपादक (VS कोड अनुशंसित)

ये कमांड ब्लॉक्स Bash सिंटैक्स का उपयोग करते हैं (लाइन कंटिन्यूएशन्स सहित और `grep`)। Windows पर, Git Bash/WSL का उपयोग करें या इन्हें PowerShell में अनुवादित करें। साथ ही [सैंपल के लोकल एनवायरनमेंट सेटअप](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) में सूचीबद्ध भाषा, पैकेज-मैनेजर, और कंटेनर टूल्स स्थापित करें।

### Azure संसाधन
- Azure सदस्यता जिसमें रिसोर्स प्रोविजनिंग और रोल-असाइनमेंट परमिशन हो (केवल Contributor RBAC असाइनमेंट नहीं बना सकता; अधिकृत रोल एडमिनिस्ट्रेटर या सैंपल के दस्तावेजीकृत समकक्ष का उपयोग करें)
- Microsoft Foundry Models सेवाओं तक पहुंच (या पहुंच अनुरोध करने की क्षमता)
- रिसोर्स ग्रुप बनाने की अनुमति

### ज्ञान की आवश्यकताएँ
- Azure सेवाओं की मूल समझ
- कमांड-लाइन इंटरफेस की परिचितता
- मूल AI/ML अवधारणाएँ (API, मॉडल, प्रॉम्प्ट)

## लैब सेटअप

### चरण 1: पर्यावरण तैयारी

1. **उपकरण स्थापना सत्यापित करें:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

यदि आप कई टेनेंट्स पर काम करते हैं या आपकी सदस्यता स्वतः पता नहीं चलती, तो `azd auth login --tenant-id <tenant-id>` के साथ पुनः प्रयास करें।

2. **वर्कशॉप रिपॉजिटरी क्लोन करें:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI अनुप्रयोगों के लिए AZD संरचना को समझना

### एक AI AZD टेम्पलेट की संरचना

एक AI-तैयार AZD टेम्पलेट में प्रमुख फाइलें देखें:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

जांच की गई नमूना बदल सकती है; `.azure/` पर्यावरण स्थापना के बाद प्रकट होता है, जरूरी नहीं कि एक ताजा क्लोन में। नक्शे से मेल खाने के लिए गायब निर्देशिकाएं बनाने के बजाय वास्तविक चेकआउट का निरीक्षण करें।

### **प्रयोगशाला अभ्यास 1.1: विन्यास का अन्वेषण करें**

1. **azure.yaml फ़ाइल की जांच करें:**
```bash
cat azure.yaml
```

**क्या देखना है:**
- AI घटकों के लिए सेवा परिभाषाएँ
- पर्यावरण चर मैपिंग
- होस्ट कॉन्फ़िगरेशन

2. **मुख्य.bicep इंफ्रास्ट्रक्चर की समीक्षा करें:**
```bash
cat infra/main.bicep
```

**पहचानने के लिए प्रमुख AI पैटर्न:**
- Microsoft Foundry Models सेवा प्रावधान
- Azure AI Search एकीकरण
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा कॉन्फ़िगरेशन

### **चर्चा बिंदु:** AI के लिए ये पैटर्न क्यों महत्वपूर्ण हैं

- **सेवा निर्भरताएँ**: AI ऐप्स अक्सर कई समन्वित सेवाओं की आवश्यकता होती है
- **सुरक्षा**: API कुंजियाँ और एंडपॉइंट्स को सुरक्षित प्रबंधन की आवश्यकता होती है
- **स्केलेबिलिटी**: AI वर्कलोड्स के अनोखे स्केलिंग आवश्यकताएँ होती हैं
- **लागत प्रबंधन**: AI सेवाएँ यदि सही तरह से कॉन्फ़िगर न हों तो महंगी हो सकती हैं

## मॉड्यूल 2: अपनी पहली AI एप्लिकेशन डिप्लॉय करें

### चरण 2.1: पर्यावरण आरंभ करें

1. **एक नया AZD पर्यावरण बनाएं:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पैरामीटर सेट करें:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### चरण 2.2: इंफ्रास्ट्रक्चर और एप्लिकेशन डिप्लॉय करें

1. **AZD के साथ डिप्लॉय करें:**
```bash
azd up
```

**`azd up` के दौरान क्या होता है:**
- ✅ Microsoft Foundry Models सेवा प्रदान करता है
- ✅ Azure AI Search सेवा बनाता है
- ✅ बैकएंड और बंडल्ड फ्रंटेंड के लिए Azure Container Apps सेटअप करता है (वर्तमान नमूना डिफ़ॉल्ट)
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- ✅ एप्लिकेशन कोड डिप्लॉय करता है
- ✅ मॉनिटरिंग और लॉगिंग सेटअप करता है

2. **डिप्लॉयमेंट प्रगति की निगरानी करें** और बनाए जा रहे संसाधनों को नोट करें।

### चरण 2.3: अपने डिप्लॉयमेंट की पुष्टि करें

1. **डिप्लॉय किए गए संसाधनों की जांच करें:**
```bash
azd show
```

2. **डिप्लॉय की गई एप्लिकेशन खोलें:**
```bash
azd show
```

`azd show` आउटपुट में दिखाए गए वेब एंडपॉइंट को खोलें।

3. **एआई कार्यक्षमता का परीक्षण करें:**
   - वेब एप्लिकेशन पर जाएं
   - नमूना प्रश्न आज़माएं
   - सत्यापित करें कि एआई प्रतिक्रियाएं काम कर रही हैं

### **प्रयोगशाला अभ्यास 2.1: समस्या निवारण अभ्यास**

**परिदृश्य**: आपका डिप्लॉयमेंट सफल रहा लेकिन AI प्रतिक्रिया नहीं दे रहा है।

**सामान्य समस्याएं जांचने के लिए:**
1. **प्रमाणीकरण**: प्रबंधित पहचान और भूमिका नियुक्तियों की पुष्टि करें; केवल तब API कुंजियाँ जांचें जब आपने जानबूझकर कुंजी-आधारित प्रमाणीकरण सक्षम किया हो
2. **मॉडल उपलब्धता**: जाँच करें कि आपका क्षेत्र मॉडल का समर्थन करता है या नहीं
3. **नेटवर्क कनेक्टिविटी**: सुनिश्चित करें कि सेवाएं संवाद कर सकें
4. **RBAC अनुमतियां**: सत्यापित करें कि ऐप OpenAI तक पहुँच सकता है

**डिबगिंग कमांड्स:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: आपकी आवश्यकताओं के लिए AI एप्लिकेशन अनुकूलित करना

### चरण 3.1: AI कॉन्फ़िगरेशन संशोधित करें

1. **OpenAI मॉडल अपडेट करें:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **अतिरिक्त AI सेवाएँ जोड़ें:**

डॉक्युमेंट इंटेलिजेंस जोड़ने के लिए `infra/main.bicep` संपादित करें:

निम्नलिखित एक चित्रात्मक खंड है, पूर्ण टेम्पलेट नहीं। नमूना पहले से दस्तावेज़-प्रसंस्करण सेवाएँ प्रदान कर सकता है: डुप्लिकेट संसाधन जोड़ने से पहले इसकी वर्तमान अवसंरचना का निरीक्षण करें। कस्टम जोड़ आवश्यक आउटपुट, पहचान और एप्लिकेशन कॉन्फ़िगरेशन को जोड़ने की आवश्यकता होती है।

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

### चरण 3.2: पर्यावरण-विशिष्ट कॉन्फ़िगरेशन

**सर्वोत्तम अभ्यास**: विकास और उत्पादन के लिए अलग-अलग कॉन्फ़िगरेशन।

1. **उत्पादन पर्यावरण बनाएं:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पैरामीटर सेट करें:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

ये नाम नमूने के [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) से आते हैं। `azd env set` एक मान संग्रहीत करता है लेकिन इसे कोई 임चार्च वाली चरगत प्रभावी नहीं बनाता: टेम्पलेट को इसे उपभोग करना चाहिए। सार्वजनिक पहुँच अक्षम करने से पहले नमूने के [नेटवर्क आइसोलेशन गाइड](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) की समीक्षा करें, और इन्फ्रास्ट्रक्चर परिवर्तनों को लागू करने के लिए `azd up` का उपयोग करें। OpenAI SKU `S0` अकेले मॉडल थ्रूपुट निर्धारित नहीं करता; मॉडल डिप्लॉयमेंट का प्रकार और क्षमता भी मायने रखती है।

### **प्रयोगशाला अभ्यास 3.1: लागत अनुकूलन**

**चुनौती**: लागत-प्रभावी विकास के लिए टेम्पलेट को कॉन्फ़िगर करें।

**कार्य:**
1. डिस्पोजेबल वर्कशॉप पर्यावरण का चयन करें: `azd env select myai-workshop`।
2. वर्तमान Search SKU और मॉडल क्षमता को `infra/main.parameters.json` और चुने गए पर्यावरण से रिकॉर्ड करें।
3. नीचे समर्थित इनपुट का उपयोग करें, मॉडल/क्षेत्र कोटा की पुष्टि के बाद:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. पोर्टल में Search SKU और डिप्लॉयमेंट क्षमता की जांच करें और मूल्य निर्धारण कैलकुलेटर के साथ अंतर का अनुमान लगाएं। बिलिंग डेटा के तुरंत अपडेट होने की उम्मीद न करें।

**सफलता मानदंड:** Search बेसिक का उपयोग करता है, चैट डिप्लॉयमेंट में अनुरोधित समर्थित क्षमता है, और ऐप अभी भी एक नमूना प्रश्न का उत्तर देता है। क्षमता `10` एक दर-सीमा आवंटन है, टोकन मूल्य छूट नहीं। Search tier बदलाव प्रतिबंधित या पुननिर्माण आवश्यक हो सकते हैं; उत्पादन संसाधनों पर प्रयोग न करें। F0 सेवा-विशिष्ट है और Azure OpenAI मॉडल SKU नहीं है।

## मॉड्यूल 4: सुरक्षा और उत्पादन सर्वोत्तम अभ्यास

### चरण 4.1: सुरक्षित क्रेडेंशियल प्रबंधन

**वर्तमान चुनौती**: कई AI ऐप्स API कुंजियों को हार्डकोड करते हैं या असुरक्षित भंडारण का उपयोग करते हैं।

**AZD समाधान**: प्रबंधित पहचान + कुंजी वॉल्ट एकीकरण।

1. **अपने टेम्पलेट में सुरक्षा कॉन्फ़िगरेशन की समीक्षा करें:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **पुष्टि करें कि प्रबंधित पहचान काम कर रही है:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **सैम्पल के समर्थित नेटवर्क कॉन्फ़िगरेशन का उपयोग करके निजी एंडपॉइंट सक्षम करें** (यदि पहले से कॉन्फ़िगर नहीं है)।

आपके अपने टेम्प्लेट के लिए, यह उदाहरणात्मक अंश OpenAI एंडपॉइंट कनेक्शन दिखाता है। इसे एक VNet, निजी DNS कॉन्फ़िगरेशन, और एप्लिकेशन कनेक्टिविटी की भी ज़रूरत होती है; इसे बिना बदले सैम्पल में चिपकाएं नहीं, जिसमें पहले से ही निजी-एंडपॉइंट मॉड्यूल होते हैं:
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

### चरण 4.3: निगरानी और अवलोकनीयता

1. **एप्लिकेशन इनसाइट्स कॉन्फ़िगर करें:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **सैम्पल के एप्लिकेशन इनसाइट्स एकीकरण को सक्षम करें:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

सैम्पल का इंस्ट्रूमेंटेशन दूरसंचार डेटा भेजता है; एक मनमाना `OPENAI_MONITOR_ENABLED` सेटिंग AI मीट्रिक्स को सक्षम नहीं करती। मॉडल कॉल, विलंबता, विफलताओं और टोकन उपयोग के लिए ट्रेस की समीक्षा करें, और संवेदनशील प्रॉम्प्ट्स या प्रतिक्रियाएँ रिकॉर्ड करने से बचें।

### **प्रयोगशाला अभ्यास 4.1: सुरक्षा ऑडिट**

**कार्य:** अपने डिप्लॉयमेंट की सुरक्षा सर्वोत्तम प्रथाओं की समीक्षा करें।

**चेकलिस्ट:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोडेड रहस्य नहीं
- [ ] सेवा-से-सेवा प्रमाणीकरण के लिए प्रबंधित पहचान का उपयोग
- [ ] संवेदनशील कॉन्फ़िगरेशन के लिए Key Vault का उपयोग
- [ ] नेटवर्क पहुंच ठीक से प्रतिबंधित है
- [ ] निगरानी और लॉगिंग सक्षम हैं

## मॉड्यूल 5: अपने खुद के AI एप्लिकेशन को कनवर्ट करना

### चरण 5.1: मूल्यांकन कार्यपत्रक

**अपने ऐप को कनवर्ट करने से पहले**, इन प्रश्नों के उत्तर दें:

1. **एप्लिकेशन आर्किटेक्चर:**
   - आपका ऐप कौन-कौन सी AI सेवाओं का उपयोग करता है?
   - इसे कौन-कौन से कंप्यूट संसाधनों की आवश्यकता है?
   - क्या इसे डेटाबेस की आवश्यकता है?
   - सेवाओं के बीच निर्भरताएँ क्या हैं?

2. **सुरक्षा आवश्यकताएँ:**
   - आपका ऐप कौन-कौन से संवेदनशील डेटा को संभालता है?
   - आपके पास कौन-कौन से अनुपालन आवश्यकताएं हैं?
   - क्या आपको निजी नेटवर्किंग की आवश्यकता है?

3. **स्केलिंग आवश्यकताएँ:**
   - आपकी अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग की ज़रूरत है?
   - क्या क्षेत्रीय आवश्यकताएं हैं?

### चरण 5.2: अपना AZD टेम्प्लेट बनाएं

**अपने ऐप को इस पैटर्न का पालन करके कनवर्ट करें:**

**सिर्फ़ स्कैफ़ोल्ड:** यह सेक्शन API/वेब एप्लिकेशन स्रोत, होस्ट इंफ्रास्ट्रक्चर, मॉडल डिप्लॉयमेंट, पहचान/RBAC, या एक पूर्ण `main.parameters.json` प्रदान नहीं करता। संसाधन-समूह-स्कोप्ड Bicep मॉड्यूल संरचना को दर्शाता है; एक सामान्य AZD सब्सक्रिप्शन-स्कोप्ड एंट्री पॉइंट को एक संसाधन समूह बनाना और उसे उस स्कोप पर कॉल करना आवश्यक है। केवल इन अंशों की नकल करने से `azd up` पूर्ण ऐप डिप्लॉय नहीं करेगा। चलाने योग्य बेसलाइन के लिए, मॉड्यूल 1 के RAG टेम्प्लेट का उपयोग करते रहें।

1. **मूल संरचना बनाएं:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **azure.yaml बनाएं:**
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

3. **इन्फ्रास्ट्रक्चर टेम्प्लेट बनाएं:**

**infra/main.bicep** - मुख्य टेम्प्लेट:
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

**infra/modules/openai.bicep** - OpenAI मॉड्यूल:
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **प्रयोगशाला अभ्यास 5.1: टेम्प्लेट निर्माण चुनौती**

**चुनौती:** एक दस्तावेज़ प्रक्रमण AI ऐप के लिए AZD टेम्प्लेट बनाएं।

**आवश्यकताएँ:**
- सामग्री विश्लेषण के लिए Microsoft Foundry Models
- OCR के लिए Document Intelligence
- दस्तावेज़ अपलोड के लिए भंडारण खाता
- प्रक्रिया तर्क के लिए फ़ंक्शन ऐप
- उपयोगकर्ता इंटरफ़ेस के लिए वेब ऐप

**बोनस अंक:**
- उचित त्रुटि हैंडलिंग जोड़ें
- लागत अनुमान शामिल करें
- निगरानी डैशबोर्ड सेट करें

## मॉड्यूल 6: सामान्य समस्याओं का निवारण

### सामान्य परिनियोजन मुद्दे

#### समस्या 1: OpenAI सेवा का कोटा समाप्त हो गया
**लक्षण:** परिनियोजन कोटा त्रुटि के साथ विफल रहता है
**समाधान:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडल क्षेत्र में उपलब्ध नहीं है
**लक्षण:** AI प्रतिक्रियाएँ विफल होती हैं या मॉडल परिनियोजन त्रुटियाँ
**समाधान:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### समस्या 3: अनुमतियाँ समस्याएं
**लक्षण:** AI सेवाओं को कॉल करते समय 403 निषिद्ध त्रुटियाँ
**समाधान:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन समस्याएं

#### समस्या 4: धीमे AI प्रतिक्रियाएं
**जांच के चरण:**
1. प्रदर्शन मेट्रिक्स के लिए एप्लिकेशन इनसाइट्स जांचें
2. Azure पोर्टल में OpenAI सेवा मेट्रिक्स की समीक्षा करें
3. नेटवर्क कनेक्टिविटी और आवेगता सत्यापित करें

**समाधान:**
- सामान्य प्रश्नों के लिए कैशिंग लागू करें
- अपने उपयोग प्रकरण के लिए उपयुक्त OpenAI मॉडल का उपयोग करें
- मॉडल RPM/TPM सीमाओं की जाँच करने के बाद ही एप्लिकेशन प्रतिकृतियों का स्केल करें; Azure OpenAI परिनियोजन कोई सामान्य डेटाबेस-शैली "रीड रेप्लिका" सेटिंग प्रदान नहीं करते हैं

### **प्रयोगशाला अभ्यास 6.1: डिबगिंग चुनौती**

**परिदृश्य**: आपका परिनियोजन सफल हुआ, लेकिन एप्लिकेशन 500 त्रुटियाँ लौटाता है।

**डिबगिंग कार्य:**
1. एप्लिकेशन लॉग जांचें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण का परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**उपयोग करने के उपकरण:**
- परिनियोजन अवलोकन के लिए `azd show`
- विस्तृत सेवा लॉग के लिए Azure पोर्टल
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## मॉड्यूल 7: निगरानी और अनुकूलन

### चरण 7.1: व्यापक निगरानी सेट करें

1. **कस्टम डैशबोर्ड बनाएँ:**

Azure पोर्टल पर जाएं और एक डैशबोर्ड बनाएं, जिसमें शामिल हों:
- OpenAI अनुरोध गणना और विलंबता
- एप्लिकेशन त्रुटि दरें
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **अलर्ट सेट करें:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

सत्यापित करें कि घटक अनुरोध टेलीमेट्री उत्पन्न करता है और यदि सूचनाएँ आवश्यक हैं तो एक क्रिया समूह जोड़ें। मीट्रिक गणना है, विफलता प्रतिशत नहीं; दर अलर्ट के लिए उपयुक्त क्वेरी और हर एक की आवश्यकता होती है।

### चरण 7.2: लागत अनुकूलन

1. **वर्तमान लागतों का विश्लेषण करें:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

तिथि प्लेसहोल्डर्स को बदलें। कॉन्सम्प्शन API समर्थन बिलिंग समझौते के अनुसार भिन्न होता है; यदि उपयोग विवरण उपलब्ध नहीं हैं तो पोर्टल में Cost Management का उपयोग करें। लागतें देरी से मिलती हैं, वास्तविक समय का परीक्षण आधार नहीं हैं।

2. **लागत नियंत्रण लागू करें:**
- बजट अलर्ट सेट करें
- ऑटोस्केलिंग नीतियों का उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI के लिए टोकन उपयोग की निगरानी करें

### **प्रयोगशाला अभ्यास 7.1: प्रदर्शन अनुकूलन**

**कार्य**: अपने AI एप्लिकेशन का प्रदर्शन और लागत दोनों के लिए अनुकूलन करें।

**सुधार के लिए मीट्रिक्स:**
- औसत प्रतिक्रिया समय में 20% कमी
- मासिक लागत में 15% कमी
- 99.9% उपलब्धता SLO और मापन विंडो को परिभाषित करें (एक छोटा प्रयोगशाला मासिक अपटाइम प्रदर्शित नहीं कर सकती)

**कोशिश करने के लिए रणनीतियाँ:**
- प्रतिक्रिया कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट को अनुकूलित करें
- उपयुक्त कंप्यूट SKU का उपयोग करें
- उचित ऑटोस्केलिंग सेट करें

## अंतिम चुनौती: एंड-टू-एंड कार्यान्वयन

### चुनौती परिदृश्य

यह एक **वैकल्पिक वास्तुकला/डिज़ाइन चुनौती** है, कोई प्रदान किया गया निष्पादन अभ्यास या उत्पादन प्रमाणन नहीं है। एक AI-संचालित ग्राहक सेवा चैटबॉट प्रस्तावित करें और बताएं कौन सी आवश्यकताओं को आगे कार्यान्वयन और सबूत की आवश्यकता है:

**कार्यात्मक आवश्यकताएं:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफ़ेस
- प्रतिक्रियाओं के लिए Microsoft Foundry मॉडल्स के साथ एकीकरण
- Azure AI Search का उपयोग करते हुए दस्तावेज़ खोज क्षमता
- मौजूदा ग्राहक डेटाबेस के साथ एकीकरण
- बहुभाषी समर्थन

**गैर-कार्यात्मक आवश्यकताएं:**
- 1000 समवर्ती उपयोगकर्ताओं को संभालना
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/माह से कम लागत
- कई पर्यावरणों (डेव, स्टेजिंग, प्रोड) में परिनियोजन

ये काल्पनिक हितधारक प्रतिबंध हैं, एक साथ गारंटीकृत परिणाम नहीं। लागत अनुमान से पहले अनुरोध दर, प्रॉम्प्ट/आउटपुट आकार और सत्र अवधि परिभाषित करें; 1,000 समवर्ती उपयोगकर्ता भार स्थापित नहीं करता या $500 बजट की व्यवहार्यता सिद्ध नहीं करता। SOC 2 एक संगठनात्मक ऑडिट परिणाम है, AZD टेम्पलेट द्वारा सक्षम स्विच नहीं। समझौते निर्धारित करें और अप्रत्याशित प्रतिबंधों को प्रमाण के साथ अस्वीकार करें।

### कार्यान्वयन चरण

1. **वास्तुकला डिजाइन करें**
2. **AZD टेम्पलेट बनाएं**
3. **सुरक्षा उपाय लागू करें**
4. **निगरानी और अलर्ट सेट करें**
5. **डिप्लॉयमेंट पाइपलाइन्स बनाएं**
6. **समाधान का प्रलेखन करें**

### मूल्यांकन मानदंड

- ✅ **कार्यात्मकता**: क्या लागू की गई क्षमताओं को प्रदर्शित किया गया है और शेष अंतर स्पष्ट हैं?
- ✅ **सुरक्षा**: क्या सर्वोत्तम प्रथाएँ लागू की गई हैं?
- ✅ **स्केलेबिलिटी**: क्या यह लोड संभाल सकता है?
- ✅ **रखरखाव योग्यता**: क्या कोड और अवसंरचना अच्छी तरह से व्यवस्थित हैं?
- ✅ **लागत**: क्या यह बजट के भीतर रहता है?

## अतिरिक्त संसाधन

### Microsoft प्रलेखन
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमूना टेम्पलेट
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### सामुदायिक संसाधन
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 पूर्णता चेकपॉइंट

बधाई हो! आपने AI वर्कशॉप लेब पूरा कर लिया है। अब आप सक्षम होंगे:

- ✅ एक मौजूदा AI एप्लिकेशन को AZD टेम्पलेट में अनुकूलित करना समझाएं
- ✅ एक AI संदर्भ एप्लिकेशन को परिनियोजित और परीक्षण करें
- ✅ AI वर्कलोड के लिए सुरक्षा सर्वोत्तम प्रथाएं लागू करें
- ✅ AI एप्लिकेशन प्रदर्शन की निगरानी और अनुकूलन करें
- ✅ सामान्य परिनियोजन समस्याओं का निवारण करें

**सफाई करें:** `azd env list` चलाएं, इस लेब में बनाए गए प्रत्येक डिस्पोजेबल पर्यावरण का चयन करें (`myai-workshop`, और यदि परिनियोजित हैं तो `myai-production`/`myai-quota-test`), और प्रत्येक में `azd down` चलाएं। विलोपन योजना की समीक्षा करें; किसी पर्यावरण की स्थानीय कॉन्फ़िगरेशन को हटाना Azure संसाधनों को हटाता नहीं है। `--purge` से बचें जब तक आप अपरिवर्तनीय सॉफ्ट-डिलीटेड संसाधन हटाने को समझते नहीं हैं।

### अगले चरण
1. इन पैटर्न को अपने AI प्रोजेक्ट्स पर लागू करें
2. समुदाय को टेम्पलेट वापस योगदान करें
3. Microsoft Foundry Discord में ongoing सहायता के लिए शामिल हों
4. मल्टी-रीजन डिप्लॉयमेंट जैसे उन्नत विषयों का पता लगाएं

---

**वर्कशॉप प्रतिक्रिया**: कृपया अपनी प्रतिक्रिया [Microsoft Foundry Discord #Azure चैनल](https://discord.gg/microsoft-azure) में साझा करके इस वर्कशॉप को बेहतर बनाने में मदद करें।

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-फ़र्स्ट विकास
- **⬅️ पिछला**: [AI मॉडल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ अगला**: [प्रोडक्शन AI सर्वोत्तम प्रथाएं](../chapter-08-production/production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** AZD और AI परिनियोजन के बारे में समर्थन और चर्चा के लिए हमारे समुदाय में शामिल हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->