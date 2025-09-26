<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T13:50:56+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "ne"
}
-->
# 4. टेम्प्लेट कन्फिगर गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्ममा तपाईं सक्षम हुनुहुनेछ"

    - [ ] `azure.yaml` को उद्देश्य बुझ्नुहोस्
    - [ ] `azure.yaml` को संरचना बुझ्नुहोस्
    - [ ] azd लाइफसाइकल `hooks` को मूल्य बुझ्नुहोस्
    - [ ] **प्रयोगशाला ३:** 

---

!!! prompt "`azure.yaml` फाइल के गर्छ? कोडफेन्स प्रयोग गरेर लाइन-बाइ-लाइन व्याख्या गर्नुहोस्"

      `azure.yaml` फाइल **Azure Developer CLI (azd)** को कन्फिगरेसन फाइल हो। यसले तपाईंको एप्लिकेसनलाई Azure मा कसरी डिप्लोय गर्नुपर्छ भन्ने परिभाषित गर्छ, जसमा इन्फ्रास्ट्रक्चर, सेवाहरू, डिप्लोयमेन्ट हुकहरू, र वातावरण चरहरू समावेश छन्।

---

## १. उद्देश्य र कार्यक्षमता

यो `azure.yaml` फाइल AI एजेन्ट एप्लिकेसनको लागि **डिप्लोयमेन्ट ब्लूप्रिन्ट** को रूपमा काम गर्छ, जसले:

1. **डिप्लोयमेन्ट अघि वातावरणको मान्यता** सुनिश्चित गर्छ
2. **Azure AI सेवाहरूको प्रावधान** (AI Hub, AI Project, Search, आदि) गर्छ
3. **Python एप्लिकेसनलाई Azure Container Apps मा डिप्लोय गर्छ**
4. **च्याट र एम्बेडिङ कार्यक्षमताका लागि AI मोडेलहरू कन्फिगर गर्छ**
5. **AI एप्लिकेसनको लागि निगरानी र ट्रेसिङ सेटअप गर्छ**
6. **नयाँ र विद्यमान** Azure AI प्रोजेक्ट परिदृश्यहरूलाई सम्हाल्छ

यो फाइलले **एक-कमाण्ड डिप्लोयमेन्ट** (`azd up`) को माध्यमबाट AI एजेन्ट समाधानको पूर्ण डिप्लोयमेन्टलाई मान्यता, प्रावधान, र पोस्ट-डिप्लोयमेन्ट कन्फिगरेसनको साथ सक्षम बनाउँछ।

??? info "हेर्न विस्तार गर्नुहोस्: `azure.yaml`"

      `azure.yaml` फाइलले Azure Developer CLI लाई यो AI एजेन्ट एप्लिकेसनलाई Azure मा कसरी डिप्लोय र व्यवस्थापन गर्ने भनेर परिभाषित गर्छ। यसलाई लाइन-बाइ-लाइन ब्रेकडाउन गरौं।

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: के हामीलाई हुकहरू चाहिन्छ?
      # TODO: के हामीलाई सबै चरहरू चाहिन्छ?

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

## २. फाइलको विश्लेषण

फाइललाई खण्ड-खण्डमा जाऔं, यसले के गर्छ र किन गर्छ भन्ने बुझ्न।

### २.१ **हेडर र स्किमा (१-३)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **लाइन १**: YAML भाषा सर्भर स्किमा मान्यता प्रदान गर्दछ, जसले IDE समर्थन र IntelliSense सक्षम बनाउँछ

### २.२ प्रोजेक्ट मेटाडाटा (५-१०)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **लाइन ५**: Azure Developer CLI द्वारा प्रयोग गरिएको प्रोजेक्ट नाम परिभाषित गर्छ
- **लाइन ६-७**: यो टेम्प्लेट संस्करण १.०.२ मा आधारित छ भनी निर्दिष्ट गर्छ
- **लाइन ८-९**: Azure Developer CLI संस्करण १.१४.० वा उच्च आवश्यक छ

### २.३ डिप्लोय हुकहरू (११-४०)

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

- **लाइन ११-२०**: **प्रि-डिप्लोयमेन्ट हुक** - `azd up` अघि चल्छ

      - Unix/Linux मा: मान्यता स्क्रिप्टलाई कार्यान्वयन योग्य बनाउँछ र चलाउँछ
      - Windows मा: PowerShell मान्यता स्क्रिप्ट चलाउँछ
      - दुवै अन्तरक्रियात्मक छन् र असफल भएमा डिप्लोयमेन्ट रोक्छ

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
- **लाइन २१-३०**: **पोस्ट-प्रोभिजन हुक** - Azure स्रोतहरू सिर्जना भएपछि चल्छ

  - वातावरण चर लेख्ने स्क्रिप्टहरू कार्यान्वयन गर्छ
  - स्क्रिप्ट असफल भए पनि डिप्लोयमेन्ट जारी राख्छ (`continueOnError: true`)

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
- **लाइन ३१-४०**: **पोस्ट-डिप्लोय हुक** - एप्लिकेसन डिप्लोयमेन्ट पछि चल्छ

  - अन्तिम सेटअप स्क्रिप्टहरू कार्यान्वयन गर्छ
  - स्क्रिप्ट असफल भए पनि जारी राख्छ

### २.४ सेवा कन्फिग (४१-४८)

यो तपाईंले डिप्लोय गर्न लागेको एप्लिकेसन सेवाको कन्फिगरेसन हो।

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

- **लाइन ४२**: "api_and_frontend" नामको सेवा परिभाषित गर्छ
- **लाइन ४३**: स्रोत कोडको लागि `./src` डाइरेक्टरीमा संकेत गर्छ
- **लाइन ४४**: Python लाई प्रोग्रामिङ भाषा रूपमा निर्दिष्ट गर्छ
- **लाइन ४५**: Azure Container Apps लाई होस्टिङ प्लेटफर्मको रूपमा प्रयोग गर्छ
- **लाइन ४६-४८**: Docker कन्फिगरेसन

      - "api_and_frontend" लाई इमेज नामको रूपमा प्रयोग गर्छ
      - Docker इमेजलाई Azure मा टाढाबाट बनाउँछ (स्थानीय रूपमा होइन)

### २.५ पाइपलाइन चरहरू (४९-७६)

यी चरहरूले CI/CD पाइपलाइनमा `azd` चलाउन मद्दत गर्छन्।

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

यो खण्डले **डिप्लोयमेन्टको क्रममा** प्रयोग गरिने वातावरण चरहरू परिभाषित गर्छ, वर्गीकृत गरेर:

- **Azure स्रोत नामहरू (लाइन ५१-६०)**:
      - मुख्य Azure सेवा स्रोत नामहरू जस्तै, Resource Group, AI Hub, AI Project, आदि
- **फिचर फ्ल्यागहरू (लाइन ६१-६३)**:
      - विशिष्ट Azure सेवाहरू सक्षम/अक्षम गर्न Boolean चरहरू
- **AI एजेन्ट कन्फिगरेसन (लाइन ६४-७१)**:
      - मुख्य AI एजेन्टको लागि कन्फिगरेसन जसमा नाम, ID, डिप्लोयमेन्ट सेटिङहरू, मोडेल विवरणहरू समावेश छन्
- **AI एम्बेडिङ कन्फिगरेसन (लाइन ७२-७९)**:
      - भेक्टर सर्चको लागि प्रयोग गरिने एम्बेडिङ मोडेलको कन्फिगरेसन
- **सर्च र निगरानी (लाइन ८०-८४)**:
      - सर्च इन्डेक्स नाम, विद्यमान स्रोत ID हरू, र निगरानी/ट्रेसिङ सेटिङहरू

---

## ३. वातावरण चरहरू जान्नुहोस्
तपाईंको डिप्लोयमेन्टको कन्फिगरेसन र व्यवहारलाई नियन्त्रण गर्ने निम्न वातावरण चरहरू, तिनीहरूको प्राथमिक उद्देश्य अनुसार वर्गीकृत छन्। अधिकांश चरहरूमा उपयुक्त डिफल्टहरू छन्, तर तपाईं तिनीहरूलाई आफ्नो विशिष्ट आवश्यकताहरू वा विद्यमान Azure स्रोतहरूसँग मिलाउन अनुकूलित गर्न सक्नुहुन्छ।

### ३.१ आवश्यक चरहरू 

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

### ३.२ मोडेल कन्फिगरेसन 
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

### ३.३ फिचर टगल
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

### ३.४ AI प्रोजेक्ट कन्फिगरेसन 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### ३.५ तपाईंका चरहरू जाँच गर्नुहोस्

Azure Developer CLI प्रयोग गरेर आफ्नो वातावरण चरहरू हेर्न र व्यवस्थापन गर्न सक्नुहुन्छ:

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

