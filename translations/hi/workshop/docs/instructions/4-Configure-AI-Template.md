<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T11:03:39+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "hi"
}
-->
# 4. टेम्पलेट कॉन्फ़िगर करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] `azure.yaml` का उद्देश्य समझना
    - [ ] `azure.yaml` की संरचना समझना
    - [ ] azd लाइफसाइकिल `hooks` का महत्व समझना
    - [ ] **प्रयोगशाला 3:** 

---

!!! prompt "`azure.yaml` फ़ाइल क्या करती है? एक कोडफेंस का उपयोग करें और इसे लाइन दर लाइन समझाएं"

      `azure.yaml` फ़ाइल **Azure Developer CLI (azd)** के लिए कॉन्फ़िगरेशन फ़ाइल है। यह परिभाषित करती है कि आपका एप्लिकेशन Azure पर कैसे तैनात किया जाना चाहिए, जिसमें इंफ्रास्ट्रक्चर, सेवाएं, डिप्लॉयमेंट हुक्स और पर्यावरण चर शामिल हैं।

---

## 1. उद्देश्य और कार्यक्षमता

यह `azure.yaml` फ़ाइल एक AI एजेंट एप्लिकेशन के लिए **डिप्लॉयमेंट ब्लूप्रिंट** के रूप में कार्य करती है जो:

1. **पर्यावरण को मान्य करता है** तैनाती से पहले
2. **Azure AI सेवाओं को प्रोविजन करता है** (AI Hub, AI Project, Search, आदि)
3. **Python एप्लिकेशन को Azure Container Apps पर तैनात करता है**
4. **AI मॉडल्स को कॉन्फ़िगर करता है** चैट और एम्बेडिंग कार्यक्षमता के लिए
5. **AI एप्लिकेशन के लिए मॉनिटरिंग और ट्रेसिंग सेट करता है**
6. **नए और मौजूदा** Azure AI प्रोजेक्ट परिदृश्यों को संभालता है

यह फ़ाइल **एक-कमांड तैनाती** (`azd up`) को सक्षम करती है, जिसमें उचित मान्यता, प्रोविजनिंग और पोस्ट-डिप्लॉयमेंट कॉन्फ़िगरेशन शामिल है।

??? info "देखें विस्तार से: `azure.yaml`"

      `azure.yaml` फ़ाइल परिभाषित करती है कि Azure Developer CLI को इस AI एजेंट एप्लिकेशन को Azure में कैसे तैनात और प्रबंधित करना चाहिए। आइए इसे लाइन दर लाइन समझें।

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: क्या हमें हुक्स की आवश्यकता है? 
      # TODO: क्या हमें सभी वेरिएबल्स की आवश्यकता है?

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

## 2. फ़ाइल को समझना

आइए फ़ाइल को सेक्शन दर सेक्शन समझें, ताकि यह पता चले कि यह क्या करती है - और क्यों।

### 2.1 **हेडर और स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **लाइन 1**: YAML भाषा सर्वर स्कीमा वैलिडेशन प्रदान करता है IDE समर्थन और IntelliSense के लिए

### 2.2 प्रोजेक्ट मेटाडेटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **लाइन 5**: प्रोजेक्ट का नाम परिभाषित करता है जिसे Azure Developer CLI द्वारा उपयोग किया जाएगा
- **लाइन 6-7**: यह निर्दिष्ट करता है कि यह टेम्पलेट संस्करण 1.0.2 पर आधारित है
- **लाइन 8-9**: Azure Developer CLI संस्करण 1.14.0 या उच्चतर की आवश्यकता है

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

- **लाइन 11-20**: **प्री-डिप्लॉयमेंट हुक** - `azd up` से पहले चलता है

      - Unix/Linux पर: वैलिडेशन स्क्रिप्ट को निष्पादन योग्य बनाता है और इसे चलाता है
      - Windows पर: PowerShell वैलिडेशन स्क्रिप्ट चलाता है
      - दोनों इंटरैक्टिव हैं और यदि वे विफल होते हैं तो तैनाती रोक देंगे

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
- **लाइन 21-30**: **पोस्ट-प्रोविजन हुक** - Azure संसाधन बनाए जाने के बाद चलता है

  - पर्यावरण चर लिखने वाली स्क्रिप्ट्स को निष्पादित करता है
  - यदि ये स्क्रिप्ट विफल होती हैं तो भी तैनाती जारी रहती है (`continueOnError: true`)

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
- **लाइन 31-40**: **पोस्ट-डिप्लॉय हुक** - एप्लिकेशन तैनाती के बाद चलता है

  - अंतिम सेटअप स्क्रिप्ट्स को निष्पादित करता है
  - स्क्रिप्ट्स विफल होने पर भी जारी रहता है

### 2.4 सेवा कॉन्फ़िगरेशन (41-48)

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

- **लाइन 42**: "api_and_frontend" नामक सेवा को परिभाषित करता है
- **लाइन 43**: स्रोत कोड के लिए `./src` निर्देशिका की ओर इशारा करता है
- **लाइन 44**: Python को प्रोग्रामिंग भाषा के रूप में निर्दिष्ट करता है
- **लाइन 45**: Azure Container Apps को होस्टिंग प्लेटफ़ॉर्म के रूप में उपयोग करता है
- **लाइन 46-48**: Docker कॉन्फ़िगरेशन

      - "api_and_frontend" को इमेज नाम के रूप में उपयोग करता है
      - Azure में Docker इमेज को रिमोटली बनाता है (स्थानीय रूप से नहीं)

### 2.5 पाइपलाइन वेरिएबल्स (49-76)

ये वेरिएबल्स CI/CD पाइपलाइनों में `azd` को स्वचालन के लिए चलाने में मदद करते हैं

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

यह सेक्शन तैनाती के दौरान उपयोग किए जाने वाले पर्यावरण वेरिएबल्स को परिभाषित करता है, श्रेणी के अनुसार व्यवस्थित:

- **Azure संसाधन नाम (लाइन 51-60)**:
      - मुख्य Azure सेवा संसाधन नाम जैसे, Resource Group, AI Hub, AI Project, आदि
- **फीचर फ्लैग्स (लाइन 61-63)**:
      - विशिष्ट Azure सेवाओं को सक्षम/अक्षम करने के लिए बूलियन वेरिएबल्स
- **AI एजेंट कॉन्फ़िगरेशन (लाइन 64-71)**:
      - मुख्य AI एजेंट के लिए कॉन्फ़िगरेशन जिसमें नाम, ID, तैनाती सेटिंग्स, मॉडल विवरण शामिल हैं
- **AI एम्बेडिंग कॉन्फ़िगरेशन (लाइन 72-79)**:
      - वेक्टर सर्च के लिए उपयोग किए जाने वाले एम्बेडिंग मॉडल का कॉन्फ़िगरेशन
- **सर्च और मॉनिटरिंग (लाइन 80-84)**:
      - सर्च इंडेक्स नाम, मौजूदा संसाधन IDs, और मॉनिटरिंग/ट्रेसिंग सेटिंग्स

---

## 3. पर्यावरण वेरिएबल्स को जानें
निम्नलिखित पर्यावरण वेरिएबल्स आपके तैनाती की कॉन्फ़िगरेशन और व्यवहार को नियंत्रित करते हैं, उनके प्राथमिक उद्देश्य के अनुसार व्यवस्थित। अधिकांश वेरिएबल्स के पास समझदारी भरे डिफ़ॉल्ट होते हैं, लेकिन आप उन्हें अपनी विशिष्ट आवश्यकताओं या मौजूदा Azure संसाधनों के अनुसार अनुकूलित कर सकते हैं।

### 3.1 आवश्यक वेरिएबल्स 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 मॉडल कॉन्फ़िगरेशन 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 फीचर टॉगल
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 AI प्रोजेक्ट कॉन्फ़िगरेशन 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 अपने वेरिएबल्स की जांच करें

Azure Developer CLI का उपयोग करके अपने पर्यावरण वेरिएबल्स को देखें और प्रबंधित करें:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

