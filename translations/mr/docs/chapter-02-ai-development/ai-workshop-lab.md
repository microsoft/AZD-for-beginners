# एआय कार्यशाळा लॅब: आपली एआय सोल्यूशन्स AZD-Deployable बनविणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - एआय-फर्स्ट विकास
- **⬅️ मागील**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ पुढील**: [प्रॉडक्शन AI सर्वोत्तम पद्धती](../chapter-08-production/production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## कार्यशाळेचे आढावा

ही हँड्स-ऑन लॅब विकसित करणाऱ्यांना एका विद्यमान AI टेम्पलेट कसे घ्यावे आणि Azure Developer CLI (AZD) वापरून डिप्लॉय करावे याची प्रक्रिया मार्गदर्शन करते. तुम्हाला Microsoft Foundry सेवा वापरून प्रॉडक्शन AI डिप्लॉयमेंटसाठी आवश्यक नमुने शिकता येतील.

> **रिलीज पुनरावलोकन (2026-11-04):** AZD कमांड मार्गदर्शन आणि नमुना कॉन्फिगरेशन नावे `azd` `1.37.2` रिलीज आणि लिंक केलेल्या नमुन्याच्या सद्य कॉन्फिगरेशनशी तपासण्यात आली. हे दस्तऐवज पुनरावलोकन आहे, लाईव्ह डिप्लॉयमेंट प्रमाणीकरण नाही. RAG लॅबसाठी एजंट विस्तार आवश्यक नाही; एजंट मूल्यमापनासाठी, वेगळा `azure.ai.evaluations` विस्तार आणि [सद्य मूल्यमापन कार्यप्रवाह](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) वापरा, जुने एजंट मूल्यमापन आदेश वापरू नका.

**कालावधी:** 2-3 तास  
**पातळी:** मध्यम  
**प्री-रिक्विझिट्स:** मूलभूत Azure ज्ञान, AI/ML संज्ञांची परिचिती

## 🎓 शिकण्याचे उद्दिष्टे

या कार्यशाळेच्या शेवटी, तुम्ही सक्षम असाल:
- ✅ विद्यमान AI AZD टेम्पलेट एक्सप्लोर करा आणि तुमच्या स्वतःच्या अनुप्रयोगाचे रूपांतर योजनेची आखणी करा
- ✅ AZD वापरून Microsoft Foundry सेवा कॉन्फिगर करा
- ✅ AI सेवा सुरक्षित क्रेडेन्शियल व्यवस्थापन अंमलात आणा
- ✅ लक्ष ठेवणीसह AI संदर्भ अनुप्रयोग डिप्लॉय करा
- ✅ सामान्य AI डिप्लॉयमेंट समस्या सोडवा

## प्री-रिक्विझिट्स

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इन्स्टॉल केलेले असावे
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इन्स्टॉल केलेले असावे
- [Git](https://git-scm.com/) इन्स्टॉल केलेले असावे
- कोड एडिटर (VS Code शिफारस)

हे कमांड ब्लॉक्स Bash सिंटॅक्स वापरतात (लाइन कंटिन्युएशन्ससह आणि `grep`). Windows वर, Git Bash/WSL वापरा किंवा त्यांना PowerShell मध्ये अनुवादित करा. तसेच [नमुन्याच्या स्थानिक पर्यावरण सेटअप](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) मध्ये दिलेल्या भाषा, पॅकेज-व्यवस्थापक, आणि कंटेनर साधने स्थापित करा.

### Azure स्रोत
- संसाधन पुरवठा आणि भूमिका-निर्धारण परवानग्यांसह Azure सदस्यता (फक्त योगदानकर्ता RBAC असाइनमेंट तयार करू शकत नाही; अधिकृत भूमिका प्रशासक किंवा नमुन्याच्या दस्तऐवजीकृत समतुल्याचा वापर करा)
- Microsoft Foundry Models सेवांमध्ये प्रवेश (किंवा प्रवेश मागणी करण्याची क्षमता)
- संसाधन समूह तयार करण्याच्या परवानग्या

### ज्ञान पूर्वापेक्षा
- Azure सेवांची प्राथमिक समज
- कमांड-लाइन इंटरफेसची परिचिती
- प्राथमिक AI/ML संकल्पना (APIs, मॉडेल्स, प्रॉम्प्ट्स)

## लॅब सेटअप

### टप्पा 1: पर्यावरण तयारी

1. **साधनेच्या स्थापनेची पडताळणी करा:**
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

जर आपण एकापेक्षा जास्त टेनंटवर काम करत असाल किंवा आपली सदस्यता आपोआप आढळून येत नसेल, तर `azd auth login --tenant-id <tenant-id>` सह पुन्हा प्रयत्न करा.

2. **वर्कशॉप रिपॉझिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI अनुप्रयोगांसाठी AZD संरचनेची समज

### AI AZD टेम्पलेटचे रचनेचे अवयव

AI-तयार AZD टेम्पलेटमधील मुख्य फाइल्सचा शोध घ्या:

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

तपासलेले नमुना बदलू शकतो; `.azure/` हे वातावरण सुरू झाल्यानंतर दिसते, गरजेचे नाही की ते नवीन क्लोनमध्ये लगेच दिसेल. या योजनाला जुळवण्यासाठी गहाळ असलेल्या निर्देशिका तयार करण्याऐवजी प्रत्यक्ष क्लोन तपासा.

### **प्रयोगशाळा व्यायाम 1.1: संरचनेचा शोध**

1. **azure.yaml फाइल तपासा:**
```bash
cat azure.yaml
```

**काय पाहायचे:**
- AI घटकांसाठी सेवा व्याख्या
- पर्यावरण चल मॅपिंग्ज
- होस्ट कॉन्फिगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चरचे पुनरावलोकन करा:**
```bash
cat infra/main.bicep
```

**ओळखण्यासाठी महत्त्वाच्या AI पॅटर्न्स:**
- Microsoft Foundry Models सेवा प्राव्हिजनिंग
- Azure AI Search समाकलन
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन

### **चर्चा मुद्दा:** AI साठी हे पॅटर्न्स का महत्त्वाचे आहेत

- **सेवा अवलंबित्व:** AI अनुप्रयोगांसाठी अनेक समन्वयित सेवांची आवश्यकता असते
- **सुरक्षा:** API की आणि एंडपॉइंट्सचे सुरक्षित व्यवस्थापन गरजेचे असते
- **स्केलेबिलिटी:** AI वर्कलोडसाठी खास स्केलिंग आवश्यकता असतात
- **खर्च व्यवस्थापन:** AI सेवा योग्यरित्या कॉन्फिगर नसतील तर महाग पडू शकतात

## मॉड्यूल 2: तुमचे पहिले AI अनुप्रयोग तैनात करा

### टप्पा 2.1: पर्यावरण प्रारंभ करा

1. **नवीन AZD पर्यावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### टप्पा 2.2: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग तैनात करा

1. **AZD सह तैनात करा:**
```bash
azd up
```

**`azd up` दरम्यान काय होते:**
- ✅ Microsoft Foundry Models सेवा प्राव्हिजन करते
- ✅ Azure AI Search सेवा तयार करते
- ✅ बॅकएंडसाठी आणि संयुक्त फ्रंटएंडसाठी Azure Container Apps सेटअप करते (सध्याच्या उदाहरणासाठी डीफॉल्ट)
- ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर करते
- ✅ अनुप्रयोग कोड तैनात करते
- ✅ देखरेख आणि लॉगिंग सेट करते

2. **तैनातीची प्रगती निरीक्षण करा** आणि तयार होणाऱ्या संसाधनांकडे लक्ष द्या.

### टप्पा 2.3: तुमची तैनात तपासा

1. **तैनात केलेले संसाधने तपासा:**
```bash
azd show
```

2. **तैनात केलेले अनुप्रयोग उघडा:**
```bash
azd show
```

`azd show` आउटपुटमध्ये दर्शविलेला वेब एंडपॉइंट उघडा.

3. **एआय कार्यक्षमता तपासा:**
   - वेब अनुप्रयोगावर भेट द्या
   - नमुना चौकशी करून पहा
   - एआय प्रतिसाद कार्यरत आहेत याची पुष्टी करा

### **प्रयोगशाळा व्यायाम 2.1: समस्या सोडवण्याचा सराव**

**परिस्थिती**: तुमचे डिप्लॉयमेंट यशस्वी झाले, पण एआय प्रतिसाद देत नाही.

**सामान्य समस्या तपासण्याचे :**
1. **प्रमाणीकरण**: व्यवस्थीत आयडेंटिटी आणि भूमिका नेमणुका तपासा; केवळ API की आधारित प्रमाणीकरण तुम्ही जाणूनबुजून सक्षम केले असल्यास API की तपासा
2. **मॉडेल उपलब्धता**: तुमच्या प्रदेशात मॉडेल समर्थित आहे का ते तपासा
3. **नेटवर्क कनेक्टिव्हिटी**: सेवा संवाद साधू शकतात याची खात्री करा
4. **RBAC परवानग्या**: अनुप्रयोग OpenAI मध्ये प्रवेश करू शकतो का ते तपासा

**डिबगिंग आदेश:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## विभाग 3: तुमच्या गरजांसाठी एआय अनुप्रयोग सानुकूलित करणे

### पाऊल 3.1: एआय संरचना बदला

1. **OpenAI मॉडेल अद्यतनित करा:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **अतिरिक्त एआय सेवा जोडा:**

Document Intelligence जोडण्यासाठी `infra/main.bicep` संपादित करा:

पुढील उदाहरणात्मक तुकडा आहे, संपूर्ण साचा नाही. नमुना कदाचित दस्तऐवज-प्रक्रिया सेवा आधीच प्रदान करत असू शकतो: पूरक संसाधने जोडण्यापूर्वी त्याच्या विद्यमान पायाभूत सुविधा तपासा. सानुकूल जोडण्या आउटपुट, आयडेंटिटी आणि अनुप्रयोग संरचनेशी जुळवणीची आवश्यकता असते.

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

### पाऊल 3.2: वातावरण-विशिष्ट संरचना

**सर्वोत्तम सराव**: विकास आणि उत्पादनासाठी वेगवेगळ्या संरचना.

1. **उत्पादन वातावरण तयार करा:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

ही नावे नमुन्याच्या [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) कडून घेतलेली आहेत. `azd env set` एक मूल्य साठवतो पण एखाद्या मनमानी चलाला प्रभावी करत नाही: साचा ते वापरले पाहिजे. सार्वजनिक प्रवेश अक्षम करण्यापूर्वी नमुन्याच्या [नेटवर्क आइसोलेशन मार्गदर्शिका](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) पुनरावलोकन करा, आणि पायाभूत सुविधा बदल करण्यासाठी `azd up` वापरा. OpenAI SKU `S0` केवळ मॉडेल थ्रूपुट ठरवत नाही; मॉडेल डिप्लॉयमेंट प्रकार आणि क्षमतेचा देखील विचार केला जातो.

### **प्रयोगशाळा व्यायाम 3.1: खर्च कमी करणे**

**आव्हान**: कमी खर्चिक विकासासाठी साचा संरचीत करा.

**कार्ये:**
1. डिस्पोजेबल वर्कशॉप वातावरण निवडा: `azd env select myai-workshop`.
2. सद्याचा Search SKU आणि मॉडेल क्षमता `infra/main.parameters.json` आणि निवडलेल्या वातावरणातून नोंद करा.
3. दिलेल्या समर्थित इनपुटचा वापर करा, मॉडेल/प्रदेश कोटा पुष्टी केल्यानंतर:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. पोर्टलमध्ये Search SKU आणि डिप्लॉयमेंट क्षमता तपासा आणि किंमती कॅल्क्युलेटरसह फरकाचा अंदाज करा. बिलिंग डेटा ताबडतोब अद्यतनित होईल असे अपेक्षित करू नका.

**यशस्वी निकष:** Search Basic वापरते, चॅट डिप्लॉयमेंटमध्ये मागणी केलेली समर्थित क्षमता आहे, आणि अनुप्रयोग अजूनही नमुना प्रश्नाला उत्तर देतो. क्षमता `10` ही दर-मर्यादा वाटप आहे, टोकन किंमतीवर सवलत नाही. Search स्तर बदल मर्यादित असू शकतात किंवा पुनर्स्थापनेची गरज असू शकते; उत्पादन संसाधनांवर प्रयोग करू नका. F0 सेवा-विशिष्ट असून Azure OpenAI मॉडेल SKU नाही.

## विभाग 4: सुरक्षा आणि उत्पादनातील सर्वोत्तम सराव

### पाऊल 4.1: सुरक्षित क्रेडेन्शियल व्यवस्थापन

**सद्याचा आव्हान**: अनेक एआय अनुप्रयोगात API की हार्डकोड केल्या जातात किंवा असुरक्षित संग्रहण वापरले जाते.

**AZD उपाय**: व्यवस्थीत आयडेंटिटी + की वॉल्ट एकत्रीकरण.

1. **तुमच्या साच्यातील सुरक्षा संरचना पुनरावलोकन करा:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **मॅनेज्ड आयडेंटिटी कार्यरत आहे का याची पडताळणी करा:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### टप्पा 4.2: नेटवर्क सुरक्षा

1. **नमुन्याच्या समर्थित नेटवर्क कॉन्फिगरेशनचा वापर करून प्रायव्हेट एंडपॉइंट्स सक्रिय करा** (जर आधी कॉन्फिगर न केले असल्यास).

तुमच्या स्वतःच्या टेम्पलेटसाठी, हा उद्दीष्टात्मक तुकडा OpenAI एंडपॉइंट कनेक्शन दाखवतो. याला VNet, प्रायव्हेट DNS कॉन्फिगरेशन, आणि अॅप्लिकेशन कनेक्टिव्हिटी देखील लागते; याला नमुन्यात बदल न करता कॉपी करू नका, ज्यात आधीच प्रायव्हेट-एंडपॉइंट मॉड्यूल्स आहेत:
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

### टप्पा 4.3: मॉनिटरिंग आणि ऑब्झरव्हेबिलिटी

1. **अॅप्लिकेशन इन्साइट्स कॉन्फिगर करा:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **नमुन्याच्या अॅप्लिकेशन इन्साइट्स इंटिग्रेशनला सक्षम करा:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

नमुन्याची इन्स्ट्रुमेण्टेशन टेलिमेट्री उत्सर्जित करते; एखादी मनमानी `OPENAI_MONITOR_ENABLED` सेटिंग AI मीट्रिक्स सक्षम करत नाही. मॉडेल कॉल्स, लेटेंसी, अपयश, आणि टोकन वापर यासाठी ट्रेस पुनरावलोकन करा, आणि संवेदनशील प्रॉम्प्ट्स किंवा प्रतिसाद ननोंदवण्याचा टाळा.

### **प्रयोगशाळा अभ्यास 4.1: सुरक्षा ऑडिट**

**कार्य**: तुमच्या डिप्लॉयमेंटला सुरक्षेच्या सर्वोत्तम पद्धतींसाठी पुनरावलोकन करा.

**चेकलिस्ट:**
- [ ] कोड किंवा कॉन्फिगरेशनमध्ये कोणतेही हार्डकोडेड सीक्रेट्स नाहीत
- [ ] सेवा-ते-सेवा प्रमाणीकरणासाठी मॅनेज्ड आयडेंटिटी वापरली आहे
- [ ] की व्हॉल्ट संवेदनशील कॉन्फिगरेशन साठवते
- [ ] नेटवर्क प्रवेश व्यवस्थित प्रतिबंधित आहे
- [ ] मॉनिटरिंग आणि लॉगिंग सक्षम आहेत

## मॉड्यूल 5: तुमचे स्वतःचे AI अॅप्लिकेशन रूपांतरित करणे

### टप्पा 5.1: मूल्यमापन कार्यपत्रिका

**तुमचे अॅप रूपांतरित करण्यापूर्वी** या प्रश्नांची उत्तरे द्या:

1. **अॅप्लिकेशन आर्किटेक्चर:**
   - तुमचा अॅप कोणत्या AI सेवा वापरतो?
   - त्याला कोणत्या संगणकीय संसाधनांची गरज आहे?
   - काय त्याला डेटाबेसची गरज आहे?
   - सेवा यामध्ये कोणती अवलंबन आहेत?

2. **सुरक्षा आवश्यकता:**
   - तुमचा अॅप कोणती संवेदनशील माहिती हाताळतो?
   - तुमच्याकडे कोणती अनुपालन आवश्यकता आहे?
   - तुम्हाला प्रायव्हेट नेटवर्किंगची गरज आहे का?

3. **स्केलिंग आवश्यकता:**
   - तुमचा अपेक्षित लोड काय आहे?
   - तुम्हाला ऑटो-स्केलिंगची गरज आहे का?
   - प्रदेशीय आवश्यकता आहेत का?

### टप्पा 5.2: तुमचा AZD टेम्पलेट तयार करा

**तुमचा अॅप रूपांतरित करण्यासाठी हा नमुना वापरा:**

**फक्त स्कॅफोल्ड:** हा विभाग API/वेब अॅप्लिकेशन स्रोत, होस्ट इन्फ्रास्ट्रक्चर, मॉडेल तैनाती, आयडेंटिटी/RBAC, किंवा फिनिश्ड `main.parameters.json` प्रदान करत नाही. रीसोर्स-ग्रुप-स्कोप्ड बायसेप मॉड्यूल रचनेचे उदाहरण दर्शवतो; एक सामान्य AZD सदस्यता-स्कोप्ड प्रवेश बिंदूने रीसोर्स ग्रुप तयार करणे आणि त्या स्कोपवर त्याचा उपयोग करणे आवश्यक आहे. फक्त या तुकड्यांची कॉपी केल्यावर `azd up` पूर्ण अॅप तैनात करेल अशी अपेक्षा करू नका. चालवता येणारा बेसलाईन हवा असल्यास, मॉड्यूल 1 मधील RAG टेम्पलेटचा वापर चालू ठेवा.

1. **मूलभूत रचना तयार करा:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **azure.yaml तयार करा:**
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

3. **इन्फ्रास्ट्रक्चर टेम्पलेट तयार करा:**

**infra/main.bicep** - मुख्य टेम्पलेट:
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

### **प्रयोगशाळा अभ्यास 5.1: टेम्पलेट निर्मिती आव्हान**

**आव्हान**: एक दस्तऐवज प्रक्रिया करणारा AI अॅपसाठी AZD टेम्पलेट तयार करा.

**आवश्यकता:**
- सामग्री विश्लेषणासाठी Microsoft Foundry मॉडेल्स
- OCR साठी दस्तऐवज बुद्धिमत्ता
- दस्तऐवज अपलोडसाठी स्टोरेज अकाउंट
- प्रक्रिया लॉजिकसाठी फंक्शन अॅप
- वापरकर्ता इंटरफेससाठी वेब अॅप

**बोनस पॉईंट्स:**
- योग्य त्रुटी हाताळणी जोडा
- खर्चाचे अंदाज समाविष्ट करा
- मॉनिटरिंग डॅशबोर्ड सेट करा

## मॉड्यूल 6: सामान्य समस्या सोडवणे

### सर्वसाधारण तैनाती समस्या

#### समस्या 1: OpenAI सेवा कोटा ओलांडली
**लक्षणे:** कोटा त्रुटीमुळे तैनाती अयशस्वी होते
**उपाय:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: प्रदेशात मॉडेल उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अयशस्वी होतात किंवा मॉडेल तैनाती त्रुटी
**उपाय:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### समस्या 3: परवाना समस्या
**लक्षणे:** AI सेवा कॉल करताना 403 निषिद्ध त्रुटी
**उपाय:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### कार्यक्षमता समस्या

#### समस्या 4: AI प्रतिसाद विलंबित आहेत
**तपासणीचे पाउल:**
1. कार्यक्षमता मेट्रिक्ससाठी Application Insights तपासा
2. Azure पोर्टलमधील OpenAI सेवा मेट्रिक्स पाहा
3. नेटवर्क कनेक्टिव्हिटी आणि विलंब तपासा

**उपाय:**
- सामान्य प्रश्नांसाठी कॅशिंग अमलात आणा
- तुमच्या वापर प्रकरणासाठी योग्य OpenAI मॉडेल वापरा
- मॉडेल RPM/TPM मर्यादा तपासल्यानंतरच अनुप्रयोग रेप्लिका प्रमाण वाढवा; Azure OpenAI तैनात्या सामान्य डेटाबेस-शैली "वाचन रेप्लिका" सेटिंग प्रदर्शित करत नाहीत

### **प्रयोगशाळा व्यायाम 6.1: डीबगिंग आव्हान**

**परिस्थिती**: तुमची तैनाती यशस्वी झाली, पण अनुप्रयोग 500 त्रुटी दर्शवतो.

**डीबगिंग कार्य:**
1. अनुप्रयोग लॉग्स तपासा
2. सेवा कनेक्टिव्हिटी पडताळा
3. प्रमाणीकरण चाचणी करा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरायची साधने:**
- तैनातीचा आढावा घेण्यासाठी `azd show`
- तपशीलवार सेवा लॉगसाठी Azure पोर्टल
- अनुप्रयोग टेलिमेट्रीसाठी Application Insights

## मॉड्यूल 7: देखरेख आणि सुधारणा

### टप्पा 7.1: सर्वसमावेशक देखरेखीची व्यवस्था करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलवर जा आणि खालील बाबींसह डॅशबोर्ड तयार करा:
- OpenAI विनंती मोजणी आणि विलंब
- अनुप्रयोग त्रुटी दर
- संसाधन वापर
- खर्च ट्रॅकिंग

2. **अलर्ट्स सेट करा:**
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

घटक विनंती टेलिमेट्री उत्सर्जित करतो याची पडताळणी करा आणि जर सूचना आवश्यक असतील तर अॅक्शन ग्रुप जोडा. मीट्रिक म्हणजे मोजणी आहे, अयशस्वी टक्केवारी नाही; दर अलर्टसाठी योग्य प्रश्न आणि हरकतीची आवश्यकता असते.

### टप्पा 7.2: खर्च सुधारणा

1. **सध्याच्या खर्चांचे विश्लेषण करा:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

तारखेच्या जागा बदला. बिलिंग करारानुसार कन्जम्प्शन API समर्थन वेगळे असते; वापर तपशील उपलब्ध नसल्यास पोर्टलमधील कॉस्ट मॅनेजमेंट वापरा. खर्चांमध्ये विलंब असतो, हे वास्तव वेळेतील चाचणी oracle नाही.

2. **खर्च नियंत्रणे अंमलात आणा:**
- बजेट अलर्ट सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंती कॅशिंग अंमलात आणा
- OpenAI साठी टोकन वापर मॉनिटर करा

### **प्रयोगशाळा व्यायाम 7.1: कार्यक्षमता सुधारणा**

**कार्य:** तुमच्या AI अनुप्रयोगाची कार्यक्षमता आणि खर्च दोन्ही सुधारित करा.

**सुधारायच्या मीट्रिक्स:**
- सरासरी प्रतिसाद वेळ 20% कमी करा
- मासिक खर्च 15% कमी करा
- 99.9% उपलब्धता SLO आणि मोजमाप विंडो परिभाषित करा (लहान प्रयोगशाळा मासिक अपटाइम दाखवू शकत नाही)

**कोशिश करावयाच्या रणनीती:**
- प्रतिसाद कॅशिंग अंमलात आणा
- टोकन कार्यक्षमतेसाठी प्रॉम्प्ट्स ऑप्टिमाइझ करा
- योग्य संगणकीय SKUs वापरा
- योग्य ऑटोस्केलिंग सेट करा

## अंतिम आव्हान: संपूर्ण अंमलबजावणी

### आव्हान परिस्थिती

हा एक **ऐच्छिक आर्किटेक्चर/डिझाइन आव्हान** आहे, दिलेली चालवणारी व्यायामशाळा किंवा उत्पादन प्रमाणपत्र नाही. AI-सक्षम ग्राहक सेवा चॅटबॉट प्रस्तावित करा आणि कुठल्या गरजा आणखी अंमलात आणण्याची आणि पुराव्यांची आवश्यकता आहे ते दस्तऐवजीकृत करा:

**कार्यात्मक गरजा:**
- ग्राहक संवादासाठी वेब इंटरफेस
- प्रतिसादांसाठी Microsoft Foundry मॉडेल्ससह एकत्रीकरण
- Azure AI Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेससह एकत्रीकरण
- बहुभाषिक समर्थन

**गैर-कार्यात्मक गरजा:**
- 1000 समकालीन वापरकर्त्यांना हाताळणे
- 99.9% अपटाइम SLA
- SOC 2 प्रमाणन
- महिन्याला $500 पेक्षा कमी खर्चात
- अनेक वातावरणांमध्ये (डेव्ह, स्टेजिंग, प्रॉडक्शन) तैनात करा

हे काल्पनिक हितधारकांचे निर्बंध आहेत, एकाच वेळी गॅरंटी केलेली परिणाम नाहीत. खर्च अंदाजित करण्यापूर्वी विनंती दर, प्रॉम्प्ट/आउटपुट आकार आणि सत्र कालावधी परिभाषित करा; 1000 समकालीन वापरकर्ते कामाचा भार निश्चित करत नाहीत किंवा $500 बजेट व्यवहार्य आहे हे सिद्ध करत नाहीत. SOC 2 ही संघटनात्मक ऑडिट परिणती आहे, AZD टेम्प्लेटद्वारे सक्षम केलेली स्विच नाही. व्यापार-ऑफ ओळखा आणि अशक्य निर्बंध पुराव्यासह नाकार करा.

### अंमलबजावणी टप्पे

1. **आर्किटेक्चर डिझाइन करा**
2. **AZD टेम्प्लेट तयार करा**
3. **सुरक्षा उपाय अंमलात आणा**
4. **देखरेख आणि अलर्टिंग सेट करा**
5. **तैनाती पाइपलाईन्स तयार करा**
6. **सोल्यूशनचे दस्तऐवजीकरण करा**

### मूल्यांकन निकष

- ✅ **कार्यक्षमता**: अंमलात आणलेल्या क्षमतांची प्रदर्शने आहेत का आणि उर्वरित तूट स्पष्ट आहेत का?
- ✅ **सुरक्षा**: सर्वोत्तम पद्धती अंमलात आहेत का?
- ✅ **स्केलेबिलिटी**: तो भार हाताळू शकतो का?
- ✅ **देखभालयोग्यता**: कोड आणि पायाभूत सुविधा व्यवस्थित आहेत का?
- ✅ **खर्च**: हा बजेटमध्ये राहतो का?

## अतिरिक्त साधने

### Microsoft दस्तऐवजीकरण
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमुना टेम्प्लेट्स
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### समुदाय संसाधने
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 पूर्णता तपासणी

अभिनंदन! आपण AI कार्यशाळा प्रयोगशाळा पूर्ण केली आहे. आता आपण सक्षम असणे आवश्यक आहे:

- ✅ विद्यमान AI अनुप्रयोग AZD टेम्प्लेटमध्ये कसा अनुकूलित करायचा हे समजावून सांगा
- ✅ AI संदर्भ अनुप्रयोग तैनात करा आणि चाचणी करा
- ✅ AI कार्यभारांसाठी सुरक्षा सर्वोत्तम पद्धती लागू करा
- ✅ AI अनुप्रयोग कार्यक्षमता देखरेख आणि सुधारणे करा
- ✅ सामान्य तैनाती समस्या निराकरण करा

**स्वछता:** `azd env list` चालवा, या प्रयोगशाळेत तयार केलेल्या प्रत्येक डिस्पोजेबल पर्यावरण ( `myai-workshop`, आणि जर तैनात केले असेल तर `myai-production`/`myai-quota-test`) निवडा, आणि प्रत्येकामध्ये `azd down` चालवा. विलोपन योजना पुनरावलोकन करा; केवळ पर्यावरणाची स्थानिक संरचना हटवल्याने Azure संसाधने हटत नाहीत. `--purge` टाळा जोपर्यंत तुम्हाला अपरिवर्तनीय सॉफ्ट-डिलिटेड संसाधन काढण्याची समज नाही.

### पुढील टप्पे
1. या नमुन्यांना तुमच्या स्वतःच्या AI प्रकल्पांमध्ये लागू करा
2. समुदायाला टेम्प्लेट परत दान करा
3. सतत सहाय्यासाठी Microsoft Foundry Discord मध्ये सामील व्हा
4. बहु-प्रदेशीय तैनातीसारख्या उच्च विषयांवर अन्वेषण करा

---

**कार्यशाळा अभिप्राय**: कृपया तुमचा अनुभव [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) मध्ये सामायिक करून कार्यशाळा सुधारण्यात मदत करा.

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील**: [AI मॉडेल तैनाती](ai-model-deployment.md)
- **➡️ पुढील**: [उत्पादन AI सर्वोत्तम पद्धती](../chapter-08-production/production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** AZD आणि AI तैनातीसंबंधी समर्थन आणि चर्चा करण्यासाठी आमच्या समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->