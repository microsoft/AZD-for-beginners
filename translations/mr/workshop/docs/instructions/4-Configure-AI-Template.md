# 4. एक टेम्पलेट कॉन्फिगर करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही करू शकाल"

    - [ ] `azure.yaml` चा उद्देश समजून घेणे
    - [ ] `azure.yaml` च्या संरचनेचे आकलन करणे
    - [ ] azd lifecycle `hooks` चे महत्त्व समजून घेणे
    - [ ] **Lab 4:** पर्यावरणीय चल बदल तपासणे आणि बदल करणे

---

!!! prompt "`azure.yaml` फाईल काय करते? कोडफेन्स वापरा आणि रेषा-रेषा समजावून सांगा"

      `azure.yaml` फाईल ही **Azure Developer CLI (azd) साठी कॉन्फिगरेशन फाइल** आहे. यात तुमच्या अनुप्रयोगाचा Azure मध्ये कसा डिप्लॉयमेंट व्हावा, याबाबत इन्फ्रास्ट्रक्चर, सेवा, डिप्लॉयमेंट हुक्स, आणि पर्यावरणीय चल यांचा समावेश असतो.

---

## 1. उद्देश आणि कार्यक्षमता

ही `azure.yaml` फाईल एक **डिप्लॉयमेंट ब्लूप्रिंट** म्हणून कार्य करते जी AI एजंट अनुप्रयोगासाठी आहे:

1. डिप्लॉयमेंटपूर्वी **पर्यावरणाची पडताळणी करते**
2. **Azure AI सेवा** (AI Hub, AI Project, शोध, इ.) पुरवते
3. **Python अनुप्रयोग** Azure Container Apps मध्ये डिप्लॉय करते
4. दोन्ही चैट आणि एम्बेडिंग कार्यासाठी AI मॉडेल कॉन्फिगर करते
5. AI अनुप्रयोगासाठी **मॉनिटरिंग आणि ट्रेसिंग** सेटअप करते
6. नवीन आणि विद्यमान दोन्ही Azure AI प्रकल्प परिस्थिती हाताळते

ही फाईल **एकाच आज्ञेत डिप्लॉयमेंट** (`azd up`) सक्षम करते, योग्य पडताळणी, पुरवणी आणि पोस्ट-डिप्लॉयमेंट कॉन्फिगरेशनसह.

??? info "विस्ताराने पहा: `azure.yaml`"

      `azure.yaml` फाईल Azure Developer CLI कसे AI एजंट अनुप्रयोग Azure मध्ये डिप्लॉय आणि व्यवस्थापित करेल ते परिभाषित करते. चला ती रेषा-रेषा समजून घेऊया.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: आपल्याला hooks ची गरज आहे का?
      # TODO: आपल्याला सर्व व्हेरिएबल्सची गरज आहे का?

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

## 2. फाईलचे विघटन

फाईलच्या प्रत्येक विभागातून जाणून घेऊया की ती काय करते आणि का.

### 2.1 **हेडर आणि स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **रेषा 1**: IDE समर्थन आणि IntelliSense साठी YAML भाषा सर्व्हर स्कीमा पडताळणी प्रदान करते

### 2.2 प्रकल्प मेटाडेटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **रेषा 5**: Azure Developer CLI द्वारे वापरले जाणारे प्रकल्प नाव परिभाषित करते
- **रेषा 6-7**: हे टेम्पलेट संस्करण 1.0.2 वर आधारित आहे हे दर्शविते
- **रेषा 8-9**: Azure Developer CLI चा आवृत्ती 1.14.0 किंवा अधिक आवश्यक असल्याचा निर्देश करतो

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

- **रेषा 11-20**: **पूर्व-डिप्लॉयमेंट हुक** - `azd up` च्या आधी चालतो

      - Unix/Linux वर: पडताळणी स्क्रिप्ट एक्सिक्यूटेबल करतो आणि चालवतो
      - Windows वर: PowerShell पडताळणी स्क्रिप्ट चालवतो
      - दोन्ही इन्टरअॅक्टिव असल्यामुळे अयशस्वी झाल्यास डिप्लॉयमेंट थांबवतात

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
- **रेषा 21-30**: **पोस्ट-प्रोविजन हुक** - Azure संसाधने तयार झाल्यानंतर चालतो

  - पर्यावरणीय चल लिहिण्याच्या स्क्रिप्ट्स चालवतो
  - ही स्क्रिप्ट्स अयशस्वी झाल्यासही डिप्लॉयमेंट चालू राहते (`continueOnError: true`)

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
- **रेषा 31-40**: **पोस्ट-डिप्लॉय हुक** - अनुप्रयोग डिप्लॉयमेंट नंतर चालतो

  - अंतिम सेटअप स्क्रिप्ट्स चालवतो
  - स्क्रिप्ट्स अयशस्वी झाल्यासही चालू राहते

### 2.4 सेवा कॉन्फिग (41-48)

ह्या विभागात तुम्ही जी सेवा डिप्लॉय करत आहात ती कॉन्फिगर केली आहे.

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

- **रेषा 42**: "api_and_frontend" नावाची सेवा परिभाषित करतो
- **रेषा 43**: स्रोत कोडसाठी `./src` डिरेक्टरी निर्देशित करतो
- **रेषा 44**: प्रोग्रामिंग भाषा म्हणून Python निर्दिष्ट करतो
- **रेषा 45**: होस्टिंग प्लॅटफॉर्म म्हणून Azure Container Apps वापरतो
- **रेषा 46-48**: Docker कॉन्फिगरेशन

      - "api_and_frontend" इमेज नाव वापरतो
      - Docker इमेज Azure मध्ये दूरस्थपणे तयार करतो (स्थानिक नाही)

### 2.5 पाइपलाइन चल (49-76)

हे चला तुम्हाला CI/CD पाइपलाइनमध्ये azd चालविण्यास मदत करणारे चल आहेत.

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

हा विभाग डिप्लॉयमेंट दरम्यान वापरले जाणारे पर्यावरणीय चल परिभाषित करतो, श्रेणीवार वर्गीकृत:

- **Azure रिसोर्स नावे (रेषा 51-60)**:
      - कोर Azure सेवा रिसोर्स नावे जसे की Resource Group, AI Hub, AI Project, इत्यादी
- **फीचर फ्लॅग्स (रेषा 61-63)**:
      - विशिष्ट Azure सेवा सक्षम/अक्षम करण्यासाठी बूलियन चल
- **AI एजंट कॉन्फिगरेशन (रेषा 64-71)**:
      - मुख्य AI एजंटसाठी कॉन्फिगरेशन ज्यात नाव, आयडी, डिप्लॉयमेंट सेटिंग्ज, मॉडेल तपशील यांचा समावेश
- **AI एम्बेडिंग कॉन्फिगरेशन (रेषा 72-79)**:
      - व्हेक्टर शोधासाठी वापरलेले एम्बेडिंग मॉडेल कॉन्फिगरेशन
- **शोध आणि मॉनिटरिंग (रेषा 80-84)**:
      - शोध निर्देशांक नाव, विद्यमान रिसोर्स आयडी आणि मॉनिटरिंग/ट्रेसिंग सेटिंग्ज

---

## 3. पर्यावरणीय चल जाणून घ्या
खालील पर्यावरणीय चल तुमच्या डिप्लॉयमेंटचे कॉन्फिगरेशन आणि वर्तन नियंत्रित करतात, त्यांचा प्राथमिक उद्देशानुसार वर्गीकृत. बहुतेक चलांना योग्य पूर्वनिर्धारित मूल्ये आहेत, परंतु तुम्ही तुमच्या विशिष्ट गरजा किंवा विद्यमान Azure संसाधनांशी जुळवून घेण्यासाठी त्यांना सानुकूलित करू शकता.

### 3.1 आवश्यक चल 

```bash title="" linenums="0"
# मुख्य Azure संरचना
AZURE_ENV_NAME                    # पर्यावरण नाव (संसाधन नाविकरणात वापरले जाते)
AZURE_LOCATION                    # तैनाती विभाग
AZURE_SUBSCRIPTION_ID             # लक्ष्य सदस्यता
AZURE_RESOURCE_GROUP              # संसाधन गट नाव
AZURE_PRINCIPAL_ID                # RBAC साठी वापरकर्ता प्रमुख

# संसाधन नावे (निर्दिष्ट नसल्यास स्वयंचलित जनरेट केली जातात)
AZURE_AIHUB_NAME                  # Microsoft Foundry हब नाव
AZURE_AIPROJECT_NAME              # AI प्रकल्प नाव
AZURE_AISERVICES_NAME             # AI सेवा खाते नाव
AZURE_STORAGE_ACCOUNT_NAME        # संचयन खाते नाव
AZURE_CONTAINER_REGISTRY_NAME     # कंटेनर नोंदणी नाव
AZURE_KEYVAULT_NAME               # Key Vault नाव (जर वापरले असेल तर)
```

### 3.2 मॉडेल कॉन्फिगरेशन 
```bash title="" linenums="0"
# चॅट मॉडेल कॉन्फिगरेशन
AZURE_AI_AGENT_MODEL_NAME         # डीफॉल्ट: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # डीफॉल्ट: OpenAI (किंवा Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # डीफॉल्ट: उपलब्ध नवीनतम
AZURE_AI_AGENT_DEPLOYMENT_NAME    # चॅट मॉडेलसाठी वितरणाचे नाव
AZURE_AI_AGENT_DEPLOYMENT_SKU     # डीफॉल्ट: स्टँडर्ड
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # डीफॉल्ट: 80 ( TPM मध्ये हजारो)

# एम्बेडिंग मॉडेल कॉन्फिगरेशन
AZURE_AI_EMBED_MODEL_NAME         # डीफॉल्ट: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # डीफॉल्ट: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # डीफॉल्ट: उपलब्ध नवीनतम
AZURE_AI_EMBED_DEPLOYMENT_NAME    # एम्बेडिंगसाठी वितरणाचे नाव
AZURE_AI_EMBED_DEPLOYMENT_SKU     # डीफॉल्ट: स्टँडर्ड
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # डीफॉल्ट: 50 ( TPM मध्ये हजारो)

# एजंट कॉन्फिगरेशन
AZURE_AI_AGENT_NAME               # एजंट डिस्प्ले नाव
AZURE_EXISTING_AGENT_ID           # विद्यमान एजंट वापरा (पर्यायी)
```

### 3.3 फीचर टॉगल
```bash title="" linenums="0"
# ऐच्छिक सेवा
USE_APPLICATION_INSIGHTS         # डीफॉल्ट: खरे
USE_AZURE_AI_SEARCH_SERVICE      # डीफॉल्ट: खोटे
USE_CONTAINER_REGISTRY           # डीफॉल्ट: खरे

# देखरेख आणि ट्रॅसिंग
ENABLE_AZURE_MONITOR_TRACING     # डीफॉल्ट: खोटे
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # डीफॉल्ट: खोटे

# शोध संरचना
AZURE_AI_SEARCH_INDEX_NAME       # शोध निर्देशांक नाव
AZURE_SEARCH_SERVICE_NAME        # शोध सेवा नाव
```

### 3.4 AI प्रकल्प कॉन्फिगरेशन 
```bash title="" linenums="0"
# विद्यमान संसाधने वापरा
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # विद्यमान AI प्रकल्पाचा पूर्ण संसाधन आयडी
AZURE_EXISTING_AIPROJECT_ENDPOINT       # विद्यमान प्रकल्पाचा एंडपॉइंट URL
```

### 3.5 तुमची चल तपासा

Azure Developer CLI वापरून तुमची पर्यावरणीय चल पाहा आणि व्यवस्थापित करा:

```bash title="" linenums="0"
# चालू पर्यावरणासाठी सर्व पर्यावरण बदलशील पाहा
azd env get-values

# ठराविक पर्यावरण बदलशील मिळवा
azd env get-value AZURE_ENV_NAME

# एक पर्यावरण बदलशील सेट करा
azd env set AZURE_LOCATION eastus

# .env फाइलमधून अनेक बदलशील सेट करा
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेव्हिस [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून भाषांतरित केला आहे. आम्ही अचूकता सुनिश्चित करण्याचा प्रयत्न करतो, तरीही कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये चुका किंवा अचूकतेत त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानला जावा. महत्त्वपूर्ण माहितीसाठी व्यावसायिक मानवी भाषांतराचा सल्ला घ्या. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलागी आम्ही जबाबदार राहणार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->