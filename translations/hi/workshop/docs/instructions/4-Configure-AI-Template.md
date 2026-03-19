# 4. एक टेम्पलेट कॉन्फ़िगर करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] `azure.yaml` का उद्देश्य समझें
    - [ ] `azure.yaml` की संरचना समझें
    - [ ] azd lifecycle `hooks` का महत्व समझें
    - [ ] **Lab 4:** पर्यावरण वेरिएबल्स का अन्वेषण और संशोधन करें

---

!!! prompt "`azure.yaml` फ़ाइल क्या करती है? एक कोडफ़ेंस का उपयोग करें और इसे पंक्ति-दर-पंक्ति समझाएँ"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. उद्देश्य और कार्यक्षमता

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **डिप्लॉयमेंट से पहले पर्यावरण को मान्य करता है**
2. **Azure AI सेवाओं का प्रावधान करता है** (AI Hub, AI Project, Search, आदि)
3. **Python एप्लिकेशन को Azure Container Apps पर तैनात करता है**
4. चैट और एम्बेडिंग कार्यक्षमता दोनों के लिए **AI मॉडलों को कॉन्फ़िगर करता है**
5. AI एप्लिकेशन के लिए **मॉनिटरिंग और ट्रेसिंग सेट करता है**
6. नए और मौजूदा दोनों Azure AI प्रोजेक्ट परिदृश्यों को संभालता है

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "विस्तार के लिए देखें: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **हैडर और स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **लाइन 1**: IDE समर्थन और IntelliSense के लिए YAML लैंग्वेज सर्वर स्कीमा सत्यापन प्रदान करता है

### 2.2 प्रोजेक्ट मेटाडेटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **लाइन 5**: Azure Developer CLI द्वारा उपयोग किए जाने वाले प्रोजेक्ट का नाम परिभाषित करता है
- **लाइनें 6-7**: निर्दिष्ट करता है कि यह टेम्पलेट संस्करण 1.0.2 पर आधारित है
- **लाइनें 8-9**: Azure Developer CLI संस्करण 1.14.0 या उससे ऊपर की आवश्यकता है

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

- **लाइनें 11-20**: **प्री-डिप्लॉयमेंट हुक** - `azd up` से पहले चलता है

      - Unix/Linux पर: सत्यापन स्क्रिप्ट को executable बनाता है और उसे चलाता है
      - Windows पर: PowerShell सत्यापन स्क्रिप्ट चलाता है
      - दोनों इंटरैक्टिव हैं और यदि वे विफल होते हैं तो डिप्लॉयमेंट को रोक देंगे

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
- **लाइनें 21-30**: **पोस्ट-प्रोविजन हुक** - Azure संसाधनों के निर्माण के बाद चलता है

  - वातावरण वेरिएबल लिखने वाली स्क्रिप्ट्स को निष्पादित करता है
  - यदि ये स्क्रिप्ट्स विफल हो जाती हैं तब भी डिप्लॉयमेंट जारी रहता है (`continueOnError: true`)

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
- **लाइनें 31-40**: **पोस्ट-डिप्लॉय हुक** - एप्लिकेशन डिप्लॉयमेंट के बाद चलता है

  - अंतिम सेटअप स्क्रिप्ट्स निष्पादित करता है
  - स्क्रिप्ट्स विफल होने पर भी जारी रहता है

### 2.4 सेवा कॉन्फ़िग (41-48)

This configures the application service you are deploying.

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

- **लाइन 42**: "api_and_frontend" नाम की सेवा को परिभाषित करता है
- **लाइन 43**: स्रोत कोड के लिए `./src` निर्देशिका की ओर इशारा करता है
- **लाइन 44**: प्रोग्रामिंग भाषा के रूप में Python निर्दिष्ट करता है
- **लाइन 45**: होस्टिंग प्लेटफ़ॉर्म के रूप में Azure Container Apps का उपयोग करता है
- **लाइनें 46-48**: Docker कॉन्फ़िगरेशन

      - इमेज नाम के रूप में "api_and_frontend" का उपयोग करता है
      - Docker इमेज को Azure में दूरस्थ रूप से बनाता है (स्थानीय नहीं)

### 2.5 पाइपलाइन वेरिएबल्स (49-76)

These are variables to help you run `azd` in CI/CD pipelines for automation

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

This section defines environment variables used **during deployment**, organized by category:

- **Azure रिसोर्स नाम (लाइनें 51-60)**:
      - प्रमुख Azure सेवा रिसोर्स नाम जैसे Resource Group, AI Hub, AI Project, आदि.-
- **फ़ीचर फ्लैग्स (लाइनें 61-63)**:
      - विशिष्ट Azure सेवाओं को सक्षम/अक्षम करने के लिए बूलियन वेरिएबल्स
- **AI एजेंट कॉन्फ़िगरेशन (लाइनें 64-71)**:
      - मुख्य AI एजेंट के लिए कॉन्फ़िगरेशन जिसमें नाम, ID, डिप्लॉयमेंट सेटिंग्स, मॉडल विवरण शामिल हैं-
- **AI एम्बेडिंग कॉन्फ़िगरेशन (लाइनें 72-79)**:
      - वेक्टर सर्च के लिए उपयोग किए जाने वाले एम्बेडिंग मॉडल के लिए कॉन्फ़िगरेशन
- **सर्च और मॉनिटरिंग (लाइनें 80-84)**:
      - सर्च इंडेक्स नाम, मौजूदा रिसोर्स IDs, और मॉनिटरिंग/ट्रेसिंग सेटिंग्स

---

## 3. पर्यावरण वेरिएबल्स के बारे में जानें
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 आवश्यक वेरिएबल्स 

```bash title="" linenums="0"
# मुख्य Azure कॉन्फ़िगरेशन
AZURE_ENV_NAME                    # पर्यावरण नाम (रिसोर्स नामकरण में उपयोग होता है)
AZURE_LOCATION                    # तैनाती क्षेत्र
AZURE_SUBSCRIPTION_ID             # लक्षित सब्सक्रिप्शन
AZURE_RESOURCE_GROUP              # रिसोर्स समूह का नाम
AZURE_PRINCIPAL_ID                # RBAC के लिए उपयोगकर्ता प्रिंसिपल

# रिसोर्स नाम (यदि निर्दिष्ट नहीं, तो स्वचालित रूप से बनाए जाएँगे)
AZURE_AIHUB_NAME                  # Microsoft Foundry हब का नाम
AZURE_AIPROJECT_NAME              # AI परियोजना का नाम
AZURE_AISERVICES_NAME             # AI सेवाओं का खाता नाम
AZURE_STORAGE_ACCOUNT_NAME        # स्टोरेज अकाउंट का नाम
AZURE_CONTAINER_REGISTRY_NAME     # कंटेनर रजिस्ट्री का नाम
AZURE_KEYVAULT_NAME               # Key Vault का नाम (यदि उपयोग किया गया हो)
```

### 3.2 मॉडल कॉन्फ़िगरेशन 
```bash title="" linenums="0"
# चैट मॉडल कॉन्फ़िगरेशन
AZURE_AI_AGENT_MODEL_NAME         # डिफ़ॉल्ट: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # डिफ़ॉल्ट: OpenAI (या Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # डिफ़ॉल्ट: नवीनतम उपलब्ध
AZURE_AI_AGENT_DEPLOYMENT_NAME    # चैट मॉडल के लिए तैनाती का नाम
AZURE_AI_AGENT_DEPLOYMENT_SKU     # डिफ़ॉल्ट: मानक
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # डिफ़ॉल्ट: 80 (हजारों TPM)

# एम्बेडिंग मॉडल कॉन्फ़िगरेशन
AZURE_AI_EMBED_MODEL_NAME         # डिफ़ॉल्ट: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # डिफ़ॉल्ट: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # डिफ़ॉल्ट: नवीनतम उपलब्ध
AZURE_AI_EMBED_DEPLOYMENT_NAME    # एम्बेडिंग्स के लिए तैनाती का नाम
AZURE_AI_EMBED_DEPLOYMENT_SKU     # डिफ़ॉल्ट: मानक
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # डिफ़ॉल्ट: 50 (हजारों TPM)

# एजेंट कॉन्फ़िगरेशन
AZURE_AI_AGENT_NAME               # एजेंट का प्रदर्शन नाम
AZURE_EXISTING_AGENT_ID           # मौजूदा एजेंट का उपयोग करें (वैकल्पिक)
```

### 3.3 फ़ीचर टॉगल
```bash title="" linenums="0"
# वैकल्पिक सेवाएँ
USE_APPLICATION_INSIGHTS         # डिफ़ॉल्ट: true
USE_AZURE_AI_SEARCH_SERVICE      # डिफ़ॉल्ट: false
USE_CONTAINER_REGISTRY           # डिफ़ॉल्ट: true

# निगरानी और ट्रेसिंग
ENABLE_AZURE_MONITOR_TRACING     # डिफ़ॉल्ट: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # डिफ़ॉल्ट: false

# खोज विन्यास
AZURE_AI_SEARCH_INDEX_NAME       # खोज इंडेक्स का नाम
AZURE_SEARCH_SERVICE_NAME        # खोज सेवा का नाम
```

### 3.4 AI प्रोजेक्ट कॉन्फ़िगरेशन 
```bash title="" linenums="0"
# मौजूदा संसाधनों का उपयोग करें
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # मौजूदा एआई परियोजना की पूर्ण संसाधन आईडी
AZURE_EXISTING_AIPROJECT_ENDPOINT       # मौजूदा परियोजना का एंडपॉइंट URL
```

### 3.5 अपने वेरिएबल्स की जांच करें

Use the Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# वर्तमान वातावरण के सभी एनवायरनमेंट वेरिएबल देखें
azd env get-values

# किसी विशिष्ट एनवायरनमेंट वेरिएबल को प्राप्त करें
azd env get-value AZURE_ENV_NAME

# एक एनवायरनमेंट वेरिएबल सेट करें
azd env set AZURE_LOCATION eastus

# .env फ़ाइल से कई वेरिएबल सेट करें
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यह दस्तावेज़ एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->