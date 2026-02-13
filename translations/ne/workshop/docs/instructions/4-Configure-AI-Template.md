# 4. Configure a Template

!!! tip "यस मोड्युलको अन्त्यसम्म तपाइँ सक्षम हुनुहुनेछ"

    - [ ] `azure.yaml` को उद्देश्य बुझ्ने
    - [ ] `azure.yaml` को संरचना बुझ्ने
    - [ ] azd lifecycle `hooks` को महत्व बुझ्ने
    - [ ] **Lab 4:** वातावरण भेरिएबलहरू अन्वेषण र संशोधन गर्ने

---

!!! prompt "azure.yaml फाइल के गर्छ? कोडफेन्स प्रयोग गरी लाइन-दर-लाइन व्याख्या गर्नुहोस्"

      `azure.yaml` फाइल Azure Developer CLI (azd) को **कन्फिगरेसन फाइल** हो। यसले तपाइँको अनुप्रयोग Azure मा कसरी डिप्लोय हुनुपर्छ भनेर परिभाषित गर्छ, जसमा पूर्वाधार, सेवाहरू, डिप्लोयमेन्ट हुकहरू, र वातावरण भेरिएबलहरू समावेश छन्।

---

## 1. Purpose and Functionality

यस `azure.yaml` फाइलले AI एजेन्ट अनुप्रयोगको लागि **डिप्लोयमेन्ट ब्लूप्रिन्ट** को रूपमा काम गर्छ जुन:

1. **डिप्लोयमेन्ट भन्दा पहिले वातावरणको प्रमाणीकरण गर्छ**
2. **Azure AI सेवाहरू प्रोभिजन गर्छ** (AI Hub, AI Project, Search, आदि)
3. **Python अनुप्रयोगलाई Azure Container Apps मा डिप्लोय गर्छ**
4. **च्याट र इम्बेडिङ कार्यक्षमताका लागि AI मोडेलहरू कन्फिगर गर्छ**
5. **AI अनुप्रयोगको लागि निगरानी र ट्रेसिङ सेटअप गर्छ**
6. **नयाँ र विद्यमान दुवै Azure AI प्रोजेक्ट परिदृश्यहरू ह्यान्डल गर्छ**

फाइलले उचित प्रमाणीकरण, प्रोभिजनिङ, र पोस्ट-डिप्लोयमेन्ट कन्फिगरेसनसहित एक पूरा AI एजेन्ट समाधानको लागि **एक-कमाण्ड डिप्लोयमेन्ट** (`azd up`) सक्षम बनाउँछ।

??? info "विस्तार गर्न हेर्नुहोस्: `azure.yaml`"

      `azure.yaml` फाइलले Azure Developer CLI ले यस AI Agent अनुप्रयोगलाई Azure मा कसरी डिप्लोय र व्यवस्थापन गर्ने भनेर परिभाषित गर्छ। अब यसलाई लाइन-दर-लाइन भांचेर बुझौं।

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

## 2. Deconstructing The File

अब फाइलको प्रत्येक सेक्सनबाट के गर्छ र किन गर्छन् भन्ने बुझौं।

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE समर्थन र IntelliSense का लागि YAML भाषा सर्भर स्कीमा मान्यकरण प्रदान गर्छ

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI द्वारा प्रयोग गरिने प्रोजेक्ट नाम परिभाषित गर्छ
- **Lines 6-7**: यो टेम्पलेट संस्करण 1.0.2 मा आधारित भएको निर्दिष्ट गर्छ
- **Lines 8-9**: Azure Developer CLI संस्करण 1.14.0 वा माथि आवश्यक छ भनेर निर्दिष्ट गर्छ

### 2.3 Deploy Hooks (11-40)

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

- **Lines 11-20**: **Pre-deployment hook** - `azd up` अघि चल्दछ

      - Unix/Linux मा: भ्यालिडेसन स्क्रिप्टलाई executable बनाइ runs गर्छ
      - Windows मा: PowerShell भ्यालिडेसन स्क्रिप्ट चलाउँछ
      - दुवै interactive छन् र असफल भए deployment रोक्छन्

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
- **Lines 21-30**: **Post-provision hook** - Azure स्रोतहरू सिर्जना भएपछि चल्दछ

  - वातावरण भेरिएबल लेख्ने स्क्रिप्टहरू कार्यान्वयन गर्छ
  - यी स्क्रिप्टहरू असफल भए पनि deployment जारी रहन्छ (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - अनुप्रयोग डिप्लोय भएपछि चल्दछ

  - अन्तिम सेटअप स्क्रिप्टहरू कार्यान्वयन गर्छ
  - स्क्रिप्टहरू असफल भए तापनि जारी रहन्छ

### 2.4 Service Config (41-48)

यसले तपाइँले डिप्लोय गरिरहेको अनुप्रयोग सेवालाई कन्फिगर गर्छ।

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

- **Line 42**: "api_and_frontend" नामक सेवा परिभाषित गर्छ
- **Line 43**: स्रोत कोडको लागि `./src` निर्देशिकातर्फ संकेत गर्छ
- **Line 44**: प्रोग्रामिङ भाषा Python भनेर निर्दिष्ट गर्छ
- **Line 45**: होस्टिङ प्लेटफर्मको रूपमा Azure Container Apps प्रयोग गर्छ
- **Lines 46-48**: Docker कन्फिगरेसन

      - "api_and_frontend" लाई image नामको रूपमा प्रयोग गर्छ
      - Docker image Azure मा रिमोटमा बिल्ड गर्छ (लोकलमा होइन)

### 2.5 Pipeline Variables (49-76)

यी भेरिएबलहरूले तपाइँलाई CI/CD पाइपलाइनहरूमा `azd` चलाउँदा अटोमेसन सरल बनाउन मद्दत गर्छन्

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

यो सेक्सनले डिप्लोयमेन्टको क्रममा प्रयोग हुने वातावरण भेरिएबलहरू परिभाषित गर्छ, वर्गीकरण अनुसार:

- **Azure Resource Names (Lines 51-60)**:
      - मुख्य Azure सेवा स्रोत नामहरू जस्तै Resource Group, AI Hub, AI Project, आदि
- **Feature Flags (Lines 61-63)**:
      - विशिष्ट Azure सेवाहरू सक्षम/असक्षम गर्न Boolean भेरिएबलहरू
- **AI Agent Configuration (Lines 64-71)**:
      - मुख्य AI एजेन्टको लागि नाम, ID, डिप्लोयमेन्ट सेटिङहरू, मोडेल विवरणजस्ता कन्फिगरेसन
- **AI Embedding Configuration (Lines 72-79)**:
      - भेक्टर सर्चका लागि प्रयोग हुने इम्बेडिङ मोडेलको कन्फिगरेसन
- **Search and Monitoring (Lines 80-84)**:
      - Search index नाम, विद्यमान स्रोत ID हरु, र निगरानी/ट्रेसिङ सेटिङहरू

---

## 3. Know Env Variables
तलका वातावरण भेरिएबलहरूले तपाइँको डिप्लोयमेन्टको कन्फिगरेसन र व्यवहारलाई नियन्त्रण गर्छन्, प्राथमिक प्रयोजन अनुसार व्यवस्थित। अधिकांश भेरिएबलहरूको विवेकपूर्ण पूर्वनिर्धारित मानहरू हुन्छन्, तर तपाइँले तिनीहरूलाई आफ्ना विशिष्ट आवश्यकताहरू वा विद्यमान Azure स्रोतहरूमा मिलाउन अनुकूलित गर्न सक्नुहुन्छ।

### 3.1 Required Variables 

```bash title="" linenums="0"
# प्रमुख Azure कन्फिगरेशन
AZURE_ENV_NAME                    # वातावरण नाम (संसाधन नामकरणमा प्रयोग गरिन्छ)
AZURE_LOCATION                    # परिनियोजन क्षेत्र
AZURE_SUBSCRIPTION_ID             # लक्षित सदस्यता
AZURE_RESOURCE_GROUP              # संसाधन समूहको नाम
AZURE_PRINCIPAL_ID                # RBAC का लागि प्रयोगकर्ता प्रिन्सिपल

# संसाधन नामहरू (निर्दिष्ट नगरिएमा स्वचालित रूपमा सिर्जना गरिने)
AZURE_AIHUB_NAME                  # Microsoft Foundry हब नाम
AZURE_AIPROJECT_NAME              # AI परियोजना नाम
AZURE_AISERVICES_NAME             # AI सेवाहरूको खाता नाम
AZURE_STORAGE_ACCOUNT_NAME        # स्टोरेज खाता नाम
AZURE_CONTAINER_REGISTRY_NAME     # कन्टेनर रजिस्ट्री नाम
AZURE_KEYVAULT_NAME               # Key Vault नाम (यदि प्रयोग गरिएको छ भने)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# च्याट मोडेल कन्फिगरेसन
AZURE_AI_AGENT_MODEL_NAME         # पूर्वनिर्धारित: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # पूर्वनिर्धारित: OpenAI (वा Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # पूर्वनिर्धारित: उपलब्ध नवीनतम
AZURE_AI_AGENT_DEPLOYMENT_NAME    # च्याट मोडेलको लागि परिनियोजन नाम
AZURE_AI_AGENT_DEPLOYMENT_SKU     # पूर्वनिर्धारित: मानक
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # पूर्वनिर्धारित: 80 (हजारमा TPM)

# एम्बेडिङ मोडेल कन्फिगरेसन
AZURE_AI_EMBED_MODEL_NAME         # पूर्वनिर्धारित: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # पूर्वनिर्धारित: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # पूर्वनिर्धारित: उपलब्ध नवीनतम
AZURE_AI_EMBED_DEPLOYMENT_NAME    # एम्बेडिङको परिनियोजन नाम
AZURE_AI_EMBED_DEPLOYMENT_SKU     # पूर्वनिर्धारित: मानक
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # पूर्वनिर्धारित: 50 (हजारमा TPM)

# एजेन्ट कन्फिगरेसन
AZURE_AI_AGENT_NAME               # एजेन्टको प्रदर्शन नाम
AZURE_EXISTING_AGENT_ID           # पहिले नै रहेको एजेन्ट प्रयोग गर्नुहोस् (वैकल्पिक)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# वैकल्पिक सेवाहरू
USE_APPLICATION_INSIGHTS         # पूर्वनिर्धारित: साँचो
USE_AZURE_AI_SEARCH_SERVICE      # पूर्वनिर्धारित: झुटो
USE_CONTAINER_REGISTRY           # पूर्वनिर्धारित: साँचो

# निगरानी र ट्रेसिङ
ENABLE_AZURE_MONITOR_TRACING     # पूर्वनिर्धारित: झुटो
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # पूर्वनिर्धारित: झुटो

# खोज विन्यास
AZURE_AI_SEARCH_INDEX_NAME       # खोज अनुक्रमणिका नाम
AZURE_SEARCH_SERVICE_NAME        # खोज सेवा नाम
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# अवस्थित स्रोतहरू प्रयोग गर्नुहोस्
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # अवस्थित AI परियोजनाको पूर्ण स्रोत आईडी
AZURE_EXISTING_AIPROJECT_ENDPOINT       # अवस्थित परियोजनाको एन्डपोइन्ट URL
```

### 3.5 Check Your Variables

Azure Developer CLI प्रयोग गरी आफ्नो वातावरण भेरिएबलहरू हेर्न र व्यवस्थापन गर्नुस्:

```bash title="" linenums="0"
# हालको वातावरणका सबै वातावरण चरहरू हेर्नुहोस्
azd env get-values

# कुनै विशेष वातावरण चर प्राप्त गर्नुहोस्
azd env get-value AZURE_ENV_NAME

# वातावरण चर सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus

# .env फाइलबाट धेरै चरहरू सेट गर्नुहोस्
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सटिकता कायम राख्न प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्ने सम्भावना हुन्छ। मूल दस्तावेज यसको मूल भाषामा नै अधिकृत स्रोत मानिनेछ। महत्त्वपूर्ण जानकारीको लागि व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा व्याख्यात्मक त्रुटिका लागि हामी उत्तरदायी छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->