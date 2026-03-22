# 4. टेम्पलेट कन्फिगर गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यमा तपाईं सक्षम हुनुहुनेछ"

    - [ ] `azure.yaml` को उद्देश्य बुझ्नुहोस्
    - [ ] `azure.yaml` को संरचना बुझ्नुहोस्
    - [ ] azd lifecycle `hooks` को महत्व बुझ्नुहोस्
    - [ ] **Lab 4:** वातावरण चरहरू अन्वेषण र परिवर्तन गर्नुहोस्

---

!!! prompt "`azure.yaml` फाइलले के गर्छ? एक कोडफेन्स प्रयोग गरेर लाइन-बाइ-लाइन व्याख्या गर्नुहोस्"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. उद्देश्य र कार्यक्षमता

यो `azure.yaml` फाइल AI एजेन्ट अनुप्रयोगका लागि **डिप्लोयमेन्ट ब्लूप्रिन्ट**को रूपमा सेवा गर्दछ जसले:

1. **परिनियोजन अघि वातावरणलाई मान्य गर्छ**
2. **Azure AI सेवाहरू प्रावधान गर्छ** (AI Hub, AI Project, Search, आदि)
3. **Python अनुप्रयोगलाई Azure Container Apps मा परिनियोजन गर्छ**
4. **च्याट र इनबेडिङ दुवैका लागि AI मोडेलहरू कन्फिगर गर्छ**
5. **AI अनुप्रयोगका लागि अनुगमन र ट्रेसिङ सेटअप गर्छ**
6. **नयाँ र अवस्थित दुबै Azure AI परियोजना परिदृश्यहरूलाई व्यवस्थापन गर्छ**

यो फाइलले उपयुक्त मान्यकरण, प्रावधान, र पोस्ट-डिप्लोयमेन्ट कन्फिगरेसनसहित सम्पूर्ण AI एजेन्ट समाधानलाई **एक-आदेश परिनियोजन** (`azd up`) सक्षम बनाउँछ।

??? info "विस्तार गरेर हेर्नुहोस्: `azure.yaml`"

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

## 2. फाइलको विखण्डन

आउनुहोस् फाइललाई खण्ड-खण्ड गरेर हेरौं, यसले के गर्दछ - र किन भनेर बुझ्न।

### 2.1 **हेडर र स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE समर्थन र IntelliSense का लागि YAML भाषा सर्भर स्कीमा मान्यकरण प्रदान गर्दछ

### 2.2 प्रोजेक्ट मेटाडाटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI द्वारा प्रयोग हुने प्रोजेक्ट नाम परिभाषित गर्छ
- **Lines 6-7**: यसले टेम्पलेट संस्करण 1.0.2 मा आधारित भएको निर्दिष्ट गर्छ
- **Lines 8-9**: Azure Developer CLI को संस्करण 1.14.0 वा सो भन्दा माथि आवश्यक छ

### 2.3 डिप्लोय हुक्स (11-40)

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

- **Lines 11-20**: **पूर्व-परिनियोजन हुक** - `azd up` अघि चल्छ

      - Unix/Linux मा: मान्यकरण स्क्रिप्टलाई executable बनाउँछ र चलाउँछ
      - Windows मा: PowerShell मान्यकरण स्क्रिप्ट चलाउँछ
      - दुवै इन्टरएक्टिभ छन् र असफल भएमा परिनियोजन रोकिन्छ

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
- **Lines 21-30**: **पोस्ट-प्रोभिजन हुक** - Azure स्रोतहरू सिर्जना भएपछि चल्छ

  - वातावरण चर लेख्ने स्क्रिप्टहरू चलाउँछ
  - यी स्क्रिप्टहरू असफल भएपनि परिनियोजन जारी राख्छ (`continueOnError: true`)

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
- **Lines 31-40**: **पोस्ट-डिप्लोय हुक** - अनुप्रयोग परिनियोजन पछि चल्छ

  - अन्तिम सेटअप स्क्रिप्टहरू चलाउँछ
  - स्क्रिप्टहरू असफल भएपनि जारी राख्छ

### 2.4 सेवा कन्फिग (41-48)

यसले तपाइँले परिनियोजन गर्न लागेको अनुप्रयोग सेवालाई कन्फिगर गर्छ।

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

- **Line 42**: सेवा "api_and_frontend" लाई परिभाषित गर्छ
- **Line 43**: स्रोत कोडका लागि `./src` निर्देशिकामा संकेत गर्छ
- **Line 44**: प्रोग्रामिङ भाषा रूपमा Python निर्दिष्ट गर्छ
- **Line 45**: होस्टिङ प्लेटफर्मको रूपमा Azure Container Apps प्रयोग गर्छ
- **Lines 46-48**: Docker कन्फिगरेसन

      - इमेज नामको रूपमा "api_and_frontend" प्रयोग गर्छ
      - Docker इमेज Azure मा रिमोट रूपमा बनाउँछ (स्थानीय होइन)

### 2.5 पाइपलाइन भेरिएबलहरू (49-76)

यी भेरिएबलहरू CI/CD पाइपलाइन्समा स्वत:करणका लागि `azd` चलाउँदा मद्दत गर्छन्

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

यो खण्डले परिनियोजनको क्रममा प्रयोग गरिने वातावरण भेरिएबलहरू परिभाषित गर्दछ, श्रेणीअनुसार व्यवस्थित गरिएको:

- **Azure Resource Names (Lines 51-60)**:
      - मुख्य Azure सेवा स्रोत नामहरू जस्तै Resource Group, AI Hub, AI Project, आदि
- **Feature Flags (Lines 61-63)**:
      - विशेष Azure सेवाहरू सक्षम/अक्षम गर्नका लागि boolean भेरिएबलहरू
- **AI Agent Configuration (Lines 64-71)**:
      - मुख्य AI एजेन्टको कन्फिगरेसन जस्तै नाम, ID, परिनियोजन सेटिङहरू, मोडेल विवरणहरू
- **AI Embedding Configuration (Lines 72-79)**:
      - भेक्टर खोजका लागि प्रयोग हुने इनबेडिङ मोडेलको कन्फिगरेसन
- **Search and Monitoring (Lines 80-84)**:
      - सर्च इन्डेक्स नाम, अवस्थित स्रोत ID हरू, र अनुगमन/ट्रेसिङ सेटिङहरू

---

## 3. वातावरण भेरिएबलहरू जान्नुहोस्
तलका वातावरण भेरिएबलहरूले तपाईंको परिनियोजनको कन्फिगरेसन र व्यवहार नियन्त्रण गर्छन्, मुख्य उद्देश्य अनुसार व्यवस्थित। धेरै भेरिएबलहरूका उपयुक्त डिफल्ट मानहरू हुन्छन्, तर तपाईंले तिनीहरूलाई आफ्ना विशेष आवश्यकताहरू वा अवस्थित Azure स्रोतहरूसँग मेल खान मिलाएर अनुकूलन गर्न सक्नुहुन्छ।

### 3.1 आवश्यक भेरिएबलहरू 

```bash title="" linenums="0"
# मूल Azure कन्फिगरेसन
AZURE_ENV_NAME                    # वातावरण नाम (रिसोर्स नामकरणमा प्रयोग हुन्छ)
AZURE_LOCATION                    # परिनियोजन क्षेत्र
AZURE_SUBSCRIPTION_ID             # लक्षित सब्सक्रिप्शन
AZURE_RESOURCE_GROUP              # रिसोर्स समूह नाम
AZURE_PRINCIPAL_ID                # RBAC को लागि प्रयोगकर्ता प्रिन्सिपल

# रिसोर्स नामहरू (यदि निर्दिष्ट नगरिएमा स्वचालित रूपमा उत्पन्न गरिन्छ)
AZURE_AIHUB_NAME                  # Microsoft Foundry हब नाम
AZURE_AIPROJECT_NAME              # AI परियोजना नाम
AZURE_AISERVICES_NAME             # AI सेवा खाता नाम
AZURE_STORAGE_ACCOUNT_NAME        # स्टोरेज खाता नाम
AZURE_CONTAINER_REGISTRY_NAME     # कन्टेनर रजिस्ट्री नाम
AZURE_KEYVAULT_NAME               # Key Vault नाम (यदि प्रयोग गरिन्छ भने)
```

### 3.2 मोडेल कन्फिगरेसन 
```bash title="" linenums="0"
# च्याट मोडेल कन्फिगरेसन
AZURE_AI_AGENT_MODEL_NAME         # पूर्वनिर्धारित: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # पूर्वनिर्धारित: OpenAI (वा Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # पूर्वनिर्धारित: उपलब्ध नवीनतम
AZURE_AI_AGENT_DEPLOYMENT_NAME    # च्याट मोडेलको तैनाती नाम
AZURE_AI_AGENT_DEPLOYMENT_SKU     # पूर्वनिर्धारित: मानक
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # पूर्वनिर्धारित: 80 (हजार TPM)

# एम्बेडिङ मोडेल कन्फिगरेसन
AZURE_AI_EMBED_MODEL_NAME         # पूर्वनिर्धारित: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # पूर्वनिर्धारित: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # पूर्वनिर्धारित: उपलब्ध नवीनतम
AZURE_AI_EMBED_DEPLOYMENT_NAME    # एम्बेडिङ्सको तैनाती नाम
AZURE_AI_EMBED_DEPLOYMENT_SKU     # पूर्वनिर्धारित: मानक
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # पूर्वनिर्धारित: 50 (हजार TPM)

# एजेन्ट कन्फिगरेसन
AZURE_AI_AGENT_NAME               # एजेन्ट प्रदर्शन नाम
AZURE_EXISTING_AGENT_ID           # अस्तित्वमा रहेको एजेन्ट प्रयोग गर्नुहोस् (वैकल्पिक)
```

### 3.3 सुविधा टगल
```bash title="" linenums="0"
# वैकल्पिक सेवाहरू
USE_APPLICATION_INSIGHTS         # पूर्वनिर्धारित: साँचो
USE_AZURE_AI_SEARCH_SERVICE      # पूर्वनिर्धारित: झुटो
USE_CONTAINER_REGISTRY           # पूर्वनिर्धारित: साँचो

# अनुगमन र ट्रेसिङ
ENABLE_AZURE_MONITOR_TRACING     # पूर्वनिर्धारित: झुटो
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # पूर्वनिर्धारित: झुटो

# खोज कन्फिगरेसन
AZURE_AI_SEARCH_INDEX_NAME       # खोज सूचकांक नाम
AZURE_SEARCH_SERVICE_NAME        # खोज सेवा नाम
```

### 3.4 AI परियोजना कन्फिगरेसन 
```bash title="" linenums="0"
# अवस्थित स्रोतहरू प्रयोग गर्नुहोस्
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # अवस्थित AI परियोजनाको पूर्ण स्रोत ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # अवस्थित परियोजनाको एन्डपोइन्ट URL
```

### 3.5 आफ्नो भेरिएबलहरू जाँच गर्नुहोस्

आफ्ना वातावरण भेरिएबलहरू हेर्न र व्यवस्थापन गर्न Azure Developer CLI प्रयोग गर्नुहोस्:

```bash title="" linenums="0"
# वर्तमान वातावरणका लागि सबै पर्यावरण चरहरू हेर्नुहोस्
azd env get-values

# विशिष्ट पर्यावरण चर प्राप्त गर्नुहोस्
azd env get-value AZURE_ENV_NAME

# एक पर्यावरण चर सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus

# एक .env फाइलबाट धेरै पर्यावरण चरहरू सेट गर्नुहोस्
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यस दस्तावेजलाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी यथासम्भव सही अनुवाद गर्ने प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा गलतियाँ हुन सक्छन्। मूल दस्तावेजलाई यसको मूल भाषामा अधिकारिक स्रोत मान्नुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->