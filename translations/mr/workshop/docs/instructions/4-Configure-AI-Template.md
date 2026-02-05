# 4. टेम्पलेट कॉन्फिगर करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही हे करू शकाल"

    - [ ] `azure.yaml` चा उद्देश समजून घ्या
    - [ ] `azure.yaml` ची रचना समजून घ्या
    - [ ] azd लाइफसायकल `hooks` चे महत्त्व समजून घ्या
    - [ ] **प्रयोगशाळा 3:** 

---

!!! prompt "`azure.yaml` फाइल काय करते? कोडफेन्स वापरा आणि प्रत्येक ओळ स्पष्ट करा"

      `azure.yaml` फाइल ही **Azure Developer CLI (azd)** साठीची कॉन्फिगरेशन फाइल आहे. ती तुमचा अनुप्रयोग Azure वर कसा तैनात करायचा हे परिभाषित करते, ज्यामध्ये इन्फ्रास्ट्रक्चर, सेवा, डिप्लॉयमेंट हुक्स आणि पर्यावरणीय व्हेरिएबल्स समाविष्ट आहेत.

---

## 1. उद्देश आणि कार्यक्षमता

`azure.yaml` फाइल AI एजंट अनुप्रयोगासाठी **तैनाती ब्लूप्रिंट** म्हणून काम करते, ज्यामध्ये:

1. तैनातीपूर्वी **पर्यावरणाची पडताळणी** करते
2. **Azure AI सेवा प्रदान करते** (AI Hub, AI Project, Search, इ.)
3. **Python अनुप्रयोग तैनात करते** Azure Container Apps वर
4. **AI मॉडेल्स कॉन्फिगर करते** चॅट आणि एम्बेडिंग कार्यक्षमतेसाठी
5. **AI अनुप्रयोगासाठी मॉनिटरिंग आणि ट्रेसिंग सेट करते**
6. **नवीन आणि विद्यमान** Azure AI प्रकल्प परिस्थिती हाताळते

ही फाइल **एक-कमांड तैनाती** (`azd up`) सक्षम करते, ज्यामध्ये योग्य पडताळणी, सेवा प्रदान करणे आणि तैनातीनंतरची कॉन्फिगरेशन समाविष्ट आहे.

??? info "पाहण्यासाठी विस्तार करा: `azure.yaml`"

      `azure.yaml` फाइल परिभाषित करते की Azure Developer CLI ने या AI Agent अनुप्रयोगाला Azure मध्ये कसे तैनात आणि व्यवस्थापित करावे. चला प्रत्येक ओळ तपशीलवार पाहूया.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: हुक्स आवश्यक आहेत का?
      # TODO: सर्व व्हेरिएबल्स आवश्यक आहेत का?

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

## 2. फाइलचे विघटन

चला फाइल विभागानुसार पाहूया, ती काय करते आणि का करते.

### 2.1 **हेडर आणि स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **ओळ 1**: YAML भाषा सर्व्हर स्कीमा मान्यता प्रदान करते, जे IDE समर्थन आणि IntelliSense साठी उपयुक्त आहे

### 2.2 प्रकल्प मेटाडेटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **ओळ 5**: प्रकल्पाचे नाव परिभाषित करते, जे Azure Developer CLI वापरते
- **ओळ 6-7**: हे टेम्पलेट आवृत्ती 1.0.2 वर आधारित असल्याचे निर्दिष्ट करते
- **ओळ 8-9**: Azure Developer CLI ची आवृत्ती 1.14.0 किंवा त्याहून अधिक आवश्यक आहे

### 2.3 तैनाती हुक्स (11-40)

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

- **ओळ 11-20**: **तैनातीपूर्वी हुक** - `azd up` चालवण्यापूर्वी चालते

      - Unix/Linux वर: पडताळणी स्क्रिप्ट कार्यान्वित करते
      - Windows वर: PowerShell पडताळणी स्क्रिप्ट चालवते
      - दोन्ही परस्परसंवादी आहेत आणि अपयश झाल्यास तैनाती थांबवतात

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
- **ओळ 21-30**: **पोस्ट-प्रोव्हिजन हुक** - Azure संसाधने तयार झाल्यानंतर चालते

  - पर्यावरणीय व्हेरिएबल लिहिण्याचे स्क्रिप्ट कार्यान्वित करते
  - स्क्रिप्ट अपयशी झाल्यासही तैनाती सुरू ठेवते (`continueOnError: true`)

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
- **ओळ 31-40**: **पोस्ट-डिप्लॉय हुक** - अनुप्रयोग तैनात झाल्यानंतर चालते

  - अंतिम सेटअप स्क्रिप्ट कार्यान्वित करते
  - स्क्रिप्ट अपयशी झाल्यासही तैनाती सुरू ठेवते

### 2.4 सेवा कॉन्फिगरेशन (41-48)

तुम्ही तैनात करत असलेल्या अनुप्रयोग सेवेसाठी ही कॉन्फिगरेशन आहे.

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

- **ओळ 42**: "api_and_frontend" नावाची सेवा परिभाषित करते
- **ओळ 43**: `./src` निर्देशिकेकडे स्रोत कोडसाठी निर्देश करते
- **ओळ 44**: Python प्रोग्रामिंग भाषा निर्दिष्ट करते
- **ओळ 45**: Azure Container Apps होस्टिंग प्लॅटफॉर्म म्हणून वापरते
- **ओळ 46-48**: Docker कॉन्फिगरेशन

      - "api_and_frontend" नावाचा इमेज वापरते
      - Azure मध्ये रिमोटली Docker इमेज तयार करते (स्थानिक नाही)

### 2.5 पाईपलाइन व्हेरिएबल्स (49-76)

हे व्हेरिएबल्स CI/CD पाईपलाइनमध्ये `azd` चालवण्यासाठी मदत करतात.

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

या विभागात **तैनाती दरम्यान** वापरले जाणारे पर्यावरणीय व्हेरिएबल्स परिभाषित केले आहेत, जे श्रेणींनुसार आयोजित केले आहेत:

- **Azure संसाधनांची नावे (ओळ 51-60)**:
      - मुख्य Azure सेवा संसाधनांची नावे जसे की Resource Group, AI Hub, AI Project, इ.
- **फीचर फ्लॅग्स (ओळ 61-63)**:
      - विशिष्ट Azure सेवा सक्षम/अक्षम करण्यासाठी बूलियन व्हेरिएबल्स
- **AI एजंट कॉन्फिगरेशन (ओळ 64-71)**:
      - मुख्य AI एजंटसाठी कॉन्फिगरेशन, ज्यामध्ये नाव, ID, तैनाती सेटिंग्ज, मॉडेल तपशील समाविष्ट आहेत
- **AI एम्बेडिंग कॉन्फिगरेशन (ओळ 72-79)**:
      - व्हेक्टर शोधासाठी वापरल्या जाणाऱ्या एम्बेडिंग मॉडेलसाठी कॉन्फिगरेशन
- **शोध आणि मॉनिटरिंग (ओळ 80-84)**:
      - शोध निर्देशांक नाव, विद्यमान संसाधन IDs, आणि मॉनिटरिंग/ट्रेसिंग सेटिंग्ज

---

## 3. पर्यावरणीय व्हेरिएबल्स जाणून घ्या
तुमच्या तैनातीच्या कॉन्फिगरेशन आणि वर्तनावर नियंत्रण ठेवण्यासाठी खालील पर्यावरणीय व्हेरिएबल्स आहेत, जे त्यांच्या प्राथमिक उद्देशानुसार आयोजित केले आहेत. बहुतेक व्हेरिएबल्ससाठी योग्य डीफॉल्ट्स आहेत, परंतु तुम्ही तुमच्या विशिष्ट आवश्यकता किंवा विद्यमान Azure संसाधनांशी जुळवून त्यांना सानुकूलित करू शकता.

### 3.1 आवश्यक व्हेरिएबल्स 

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

### 3.2 मॉडेल कॉन्फिगरेशन 
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

### 3.4 AI प्रकल्प कॉन्फिगरेशन 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 तुमचे व्हेरिएबल्स तपासा

Azure Developer CLI वापरून तुमचे पर्यावरणीय व्हेरिएबल्स पहा आणि व्यवस्थापित करा:

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

