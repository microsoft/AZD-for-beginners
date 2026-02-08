# 4. टेम्पलेट कॉन्फ़िगर करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] `azure.yaml` का उद्देश्य समझें
    - [ ] `azure.yaml` की संरचना समझें
    - [ ] azd लाइफसाइकल `hooks` के महत्व को समझें
    - [ ] **लैब 4:** पर्यावरण चर (environment variables) का अन्वेषण और संशोधन करें

---

!!! prompt "`azure.yaml` फ़ाइल क्या करती है? एक कोडफ़ेंस का उपयोग करें और इसे पंक्ति-दर-पंक्ति समझाएँ"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. उद्देश्य और कार्यक्षमता

यह `azure.yaml` फ़ाइल एक AI एजेंट अनुप्रयोग के लिए **डिप्लॉयमेंट ब्लूप्रिंट** के रूप में कार्य करती है जो:

1. **डिप्लॉयमेंट से पहले परिवेश को सत्यापित करती है**
2. **Azure AI सेवाओं की प्रोविजनिंग करती है** (AI Hub, AI Project, Search, आदि)
3. **एक Python एप्लिकेशन को Azure Container Apps पर तैनात करती है**
4. **चैट और एम्बेडिंग दोनों कार्यक्षमताओं के लिए AI मॉडल कॉन्फ़िगर करती है**
5. **AI एप्लिकेशन के लिए मॉनिटरिंग और ट्रेसिंग सेटअप करती है**
6. **नए और मौजूदा दोनों Azure AI प्रोजेक्ट परिदृश्यों को संभालती है**

यह फ़ाइल उचित सत्यापन, प्रोविजनिंग, और पोस्ट-डिप्लॉयमेंट कॉन्फ़िगरेशन के साथ एक पूर्ण AI एजेंट सॉल्यूशन की **एक-कमांड तैनाती** (`azd up`) सक्षम बनाती है।

??? info "विस्तार के लिए देखें: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: क्या हमें hooks की आवश्यकता है? 
      # TODO: क्या हमें सभी variables की आवश्यकता है?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. फ़ाइल का विश्लेषण

आइए फ़ाइल को अनुभाग-दर-अनुभाग देखें, यह क्या करती है - और क्यों।

### 2.1 **हैडर और स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **लाइन 1**: IDE समर्थन और IntelliSense के लिए YAML भाषा सर्वर स्कीमा सत्यापन प्रदान करता है

### 2.2 परियोजना मेटाडेटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **लाइन 5**: Azure Developer CLI द्वारा उपयोग किए जाने वाले प्रोजेक्ट का नाम परिभाषित करता है
- **लाइनों 6-7**: निर्दिष्ट करता है कि यह टेम्पलेट संस्करण 1.0.2 पर आधारित है
- **लाइनों 8-9**: Azure Developer CLI संस्करण 1.14.0 या उससे ऊपर की आवश्यकता बताता है

### 2.3 डिप्लॉय हुक्स (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **लाइनों 11-20**: **पूर्व-डिप्लॉयमेंट हुक** - `azd up` से पहले चलेगा

      - Unix/Linux पर: सत्यापन स्क्रिप्ट को एक्सिक्यूटेबल बनाता है और उसे चलाता है
      - Windows पर: PowerShell सत्यापन स्क्रिप्ट चलाता है
      - दोनों इंटरैक्टिव हैं और यदि ये विफल होते हैं तो तैनाती रुक जाएगी

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **लाइनों 21-30**: **पोस्ट-प्रोविजन हुक** - Azure संसाधन बनाए जाने के बाद चलता है

  - पर्यावरण चर लेखन स्क्रिप्ट्स को निष्पादित करता है
  - यदि ये स्क्रिप्ट्स विफल हों तो भी तैनाती जारी रहती है (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **लाइनों 31-40**: **पोस्ट-डिप्लॉय हुक** - एप्लिकेशन तैनाती के बाद चलता है

  - अंतिम सेटअप स्क्रिप्ट्स को निष्पादित करता है
  - यदि स्क्रिप्ट्स विफल हों तब भी जारी रहता है

### 2.4 सेवा कॉन्फ़िग (41-48)

यह उस एप्लिकेशन सेवा को कॉन्फ़िगर करता है जिसे आप तैनात कर रहे हैं।

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **लाइन 42**: "api_and_frontend" नामक सेवा परिभाषित करता है
- **लाइन 43**: स्रोत कोड के लिए `./src` निर्देशिका की ओर संकेत करता है
- **लाइन 44**: प्रोग्रामिंग भाषा के रूप में Python निर्दिष्ट करता है
- **लाइन 45**: होस्टिंग प्लेटफ़ॉर्म के रूप में Azure Container Apps का उपयोग करता है
- **लाइनों 46-48**: Docker कॉन्फ़िगरेशन

      - "api_and_frontend" को इमेज नाम के रूप में उपयोग करता है
      - Docker इमेज को स्थानीय रूप से नहीं, बल्कि Azure में रिमोट रूप से बनाता है

### 2.5 पाइपलाइन वेरिएबल्स (49-76)

ये उन वेरिएबल्स को परिभाषित करते हैं जो CI/CD पाइपलाइनों में स्वचालन के लिए `azd` चलाने में मदद करते हैं

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

यह अनुभाग तैनाती के दौरान प्रयुक्त पर्यावरण वेरिएबल्स को परिभाषित करता है, जिन्हें श्रेणीबद्ध किया गया है:

- **Azure Resource Names (Lines 51-60)**:
      - कोर Azure सेवा संसाधन नाम जैसे Resource Group, AI Hub, AI Project, आदि
- **Feature Flags (Lines 61-63)**:
      - विशिष्ट Azure सेवाओं को सक्षम/अक्षम करने वाले बूलियन वेरिएबल्स
- **AI Agent Configuration (Lines 64-71)**:
      - मुख्य AI एजेंट के लिए कॉन्फ़िगरेशन जिसमें नाम, ID, तैनाती सेटिंग्स, मॉडल विवरण शामिल हैं
- **AI Embedding Configuration (Lines 72-79)**:
      - वेक्टर सर्च के लिए उपयोग किए जाने वाले एम्बेडिंग मॉडल की कॉन्फ़िगरेशन
- **Search and Monitoring (Lines 80-84)**:
      - सर्च इंडेक्स का नाम, मौजूदा संसाधन IDs, और मॉनिटरिंग/ट्रेसिंग सेटिंग्स

---

## 3. पर्यावरण चर जानें
निम्नलिखित पर्यावरण वेरिएबल्स आपकी तैनाती की कॉन्फ़िगरेशन और व्यवहार को नियंत्रित करते हैं, जिन्हें उनके प्राथमिक उद्देश्य के अनुसार व्यवस्थित किया गया है। अधिकांश वेरिएबल्स के संवेदनशील डिफ़ॉल्ट मान होते हैं, लेकिन आप इन्हें अपनी विशिष्ट आवश्यकताओं या मौजूदा Azure संसाधनों के अनुसार कस्टमाइज़ कर सकते हैं।

### 3.1 आवश्यक वेरिएबल्स 

```bash title="" linenums="0"
# मुख्य Azure कॉन्फ़िगरेशन
AZURE_ENV_NAME                    # पर्यावरण का नाम (संसाधन नामकरण में उपयोग होता है)
AZURE_LOCATION                    # तैनाती क्षेत्र
AZURE_SUBSCRIPTION_ID             # लक्षित सदस्यता
AZURE_RESOURCE_GROUP              # संसाधन समूह का नाम
AZURE_PRINCIPAL_ID                # RBAC के लिए उपयोगकर्ता प्रिंसिपल

# संसाधन नाम (यदि निर्दिष्ट नहीं हैं तो स्वचालित रूप से उत्पन्न किए जाते हैं)
AZURE_AIHUB_NAME                  # Microsoft Foundry हब का नाम
AZURE_AIPROJECT_NAME              # एआई परियोजना का नाम
AZURE_AISERVICES_NAME             # एआई सेवाओं के खाते का नाम
AZURE_STORAGE_ACCOUNT_NAME        # स्टोरेज खाते का नाम
AZURE_CONTAINER_REGISTRY_NAME     # कंटेनर रजिस्ट्री का नाम
AZURE_KEYVAULT_NAME               # Key Vault का नाम (यदि उपयोग किया गया हो)
```

### 3.2 मॉडल कॉन्फ़िगरेशन 
```bash title="" linenums="0"
# चैट मॉडल विन्यास
AZURE_AI_AGENT_MODEL_NAME         # डिफ़ॉल्ट: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # डिफ़ॉल्ट: OpenAI (या Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # डिफ़ॉल्ट: नवीनतम उपलब्ध
AZURE_AI_AGENT_DEPLOYMENT_NAME    # चैट मॉडल के लिए परिनियोजन नाम
AZURE_AI_AGENT_DEPLOYMENT_SKU     # डिफ़ॉल्ट: मानक
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # डिफ़ॉल्ट: 80 (हज़ारों TPM)

# एम्बेडिंग मॉडल विन्यास
AZURE_AI_EMBED_MODEL_NAME         # डिफ़ॉल्ट: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # डिफ़ॉल्ट: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # डिफ़ॉल्ट: नवीनतम उपलब्ध
AZURE_AI_EMBED_DEPLOYMENT_NAME    # एम्बेडिंग्स के लिए परिनियोजन नाम
AZURE_AI_EMBED_DEPLOYMENT_SKU     # डिफ़ॉल्ट: मानक
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # डिफ़ॉल्ट: 50 (हज़ारों TPM)

# एजेंट विन्यास
AZURE_AI_AGENT_NAME               # एजेंट प्रदर्शन नाम
AZURE_EXISTING_AGENT_ID           # मौजूदा एजेंट का उपयोग करें (वैकल्पिक)
```

### 3.3 फीचर टॉगल
```bash title="" linenums="0"
# वैकल्पिक सेवाएँ
USE_APPLICATION_INSIGHTS         # डिफ़ॉल्ट: true
USE_AZURE_AI_SEARCH_SERVICE      # डिफ़ॉल्ट: false
USE_CONTAINER_REGISTRY           # डिफ़ॉल्ट: true

# निगरानी और ट्रेसिंग
ENABLE_AZURE_MONITOR_TRACING     # डिफ़ॉल्ट: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # डिफ़ॉल्ट: false

# खोज विन्यास
AZURE_AI_SEARCH_INDEX_NAME       # खोज सूचकांक का नाम
AZURE_SEARCH_SERVICE_NAME        # खोज सेवा का नाम
```

### 3.4 AI प्रोजेक्ट कॉन्फ़िगरेशन 
```bash title="" linenums="0"
# मौजूदा संसाधनों का उपयोग करें
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # मौजूदा एआई परियोजना का पूर्ण संसाधन ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # मौजूदा परियोजना का एंडपॉइंट URL
```

### 3.5 अपनी वेरिएबल्स जांचें

Azure Developer CLI का उपयोग करके अपने पर्यावरण वेरिएबल्स को देखें और प्रबंधित करें:

```bash title="" linenums="0"
# वर्तमान वातावरण के सभी पर्यावरण चर देखें
azd env get-values

# एक विशिष्ट पर्यावरण चर प्राप्त करें
azd env get-value AZURE_ENV_NAME

# एक पर्यावरण चर सेट करें
azd env set AZURE_LOCATION eastus

# एक .env फ़ाइल से कई पर्यावरण चर सेट करें
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ एआई अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। हम सटीकता के लिए प्रयास करते हैं, पर कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असत्यताएँ हो सकती हैं। मूल दस्तावेज़ उसकी मूल भाषा में ही प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->