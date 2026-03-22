# 4. टेम्पलेट कॉन्फिगर करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही हे करू शकाल"

    - [ ] `azure.yaml` चे उद्दिष्ट समजून घ्या
    - [ ] `azure.yaml` चा रचना समजून घ्या
    - [ ] azd lifecycle `hooks` चे मूल्य समजून घ्या
    - [ ] **Lab 4:** पर्यावरण बदलण्याचे बदल तपासा आणि सुधारित करा

---

!!! prompt "`azure.yaml` फाइल काय करते? कोडफेन्समध्ये वापरा आणि ओळीनुसार स्पष्ट करा"

      `azure.yaml` फाइल ही **Azure Developer CLI (azd) साठी कॉन्फिगरेशन फाइल आहे**. हे तुमच्या अनुप्रयोगाला Azure वर कसे डिप्लॉय करायचे ते परिभाषित करते, ज्यात इन्फ्रास्ट्रक्चर, सेवा, डिप्लॉयमेंट हुक्स आणि पर्यावरणीय चल समाविष्ट आहेत.

---

## 1. उद्दिष्ट आणि कार्यक्षमता

ही `azure.yaml` फाइल AI एजंट अनुप्रयोगासाठीचे **डिप्लॉयमेंट ब्लूप्रिंट** म्हणून काम करते जे:

1. **डिप्लॉयमेंटपूर्वी पर्यावरणाची पडताळणी करते**
2. **Azure AI सेवा पुरवते** (AI Hub, AI प्रोजेक्ट, शोध इ.)
3. **Python अनुप्रयोग** Azure कंटेनर अॅप्सवर डिप्लॉय करते
4. **चॅट आणि एम्बेडिंग कार्यक्षमता**ाठी AI मॉडेल कॉन्फिगर करते
5. AI अनुप्रयोगासाठी **मॉनिटरिंग आणि ट्रेसिंग सेटअप** करते
6. नवीन आणि विद्यमान Azure AI प्रोजेक्ट दोन्ही परिस्थिती हाताळते

ही फाइल योग्य पडताळणी, पुरवठा आणि डिप्लॉयमेंट नंतर कॉन्फिगरेशनसह पूर्ण AI एजंट सोल्यूशनसाठी **एक-कमांड डिप्लॉयमेंट** (`azd up`) सक्षम करते.

??? info "पहा: `azure.yaml` विस्ताराने"

      `azure.yaml` फाइल कशी Azure Developer CLI वापरुन या AI एजंट अनुप्रयोगाला Azure मध्ये डिप्लॉय आणि व्यवस्थापित करायची आहे ते परिभाषित करते. चला ओळी ओळीने ते समजून घेऊया.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: आपल्याला हुक्सची गरज आहे का?
      # TODO: आपल्याला सर्व व्हेरीबल्सची गरज आहे का?

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

चला फाइलच्या प्रत्येक विभागातून जाऊ, ते काय करतात आणि का हे समजून घेऊया.

### 2.1 **हेडर आणि स्कीमा (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **लाइन 1**: YAML भाषा सर्व्हरच्या स्कीमा व्हॅलिडेशनसाठी IDE समर्थन आणि IntelliSense साठी

### 2.2 प्रोजेक्ट मेटाडेटा (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **लाइन 5**: Azure Developer CLI वापरून प्रोजेक्ट नाव परिभाषित करते
- **लाइन 6-7**: हे टेम्प्लेट आवृत्ती 1.0.2 वर आधारित आहे असे निर्दिष्ट करते
- **लाइन 8-9**: Azure Developer CLI आवृत्ती 1.14.0 किंवा त्यापुढील आवृत्तीची आवश्यकता आहे

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

- **लाइन 11-20**: **पूर्व-डिप्लॉयमेंट हुक** - `azd up` च्या आधी चालवते

      - Unix/Linux वर: पडताळणी स्क्रिप्टसाठी executable परवानगी देते आणि चालवते
      - Windows वर: PowerShell पडताळणी स्क्रिप्ट चालवते
      - दोन्ही interactive आहेत आणि अपयशी झाल्यास डिप्लॉयमेंट थांबवतील

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
- **लाइन 21-30**: **पोस्ट-प्रोव्हिजन हुक** - Azure संसाधने तयार झाल्यानंतर चालवते

  - पर्यावरण चल लिहिण्याच्या स्क्रिप्ट्स चालवते
  - या स्क्रिप्ट्स अपयशी झाल्यास देखील डिप्लॉयमेंट सुरू ठेवते (`continueOnError: true`)

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
- **लाइन 31-40**: **पोस्ट-डिप्लॉय हुक** - अनुप्रयोग डिप्लॉय झाल्यानंतर चालवते

  - अंतिम सेटअप स्क्रिप्ट्स चालवते
  - स्क्रिप्ट्स अपयशी झाल्यास देखील चालू ठेवते

### 2.4 सेवा कॉन्फिगरेशन (41-48)

हे त्या अनुप्रयोग सेवेची कॉन्फिगर करते जी तुम्ही डिप्लॉय करत आहात.

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

- **लाइन 42**: "api_and_frontend" नावाची सेवा परिभाषित करते
- **लाइन 43**: स्त्रोत कोडसाठी `./src` निर्देशिका दर्शवते
- **लाइन 44**: प्रोग्रामिंग भाषा म्हणून Python निर्दिष्ट करते
- **लाइन 45**: होस्टिंगसाठी Azure कंटेनर अॅप्स वापरते
- **लाइन 46-48**: Docker कॉन्फिगरेशन

      - "api_and_frontend" इमेज नाव वापरते
      - Azure मध्ये Docker इमेज दूरस्थपणे बनवते (लोकल नाही)

### 2.5 पाइपलाइन चल (49-76)

हे चल `azd` ला CI/CD पाइपलाइनमध्ये ऑटोमेशनसाठी मदत करतात

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

हा विभाग डिप्लॉयमेंट दरम्यान वापरल्या जाणाऱ्या पर्यावरण्यूया चलांची व्याख्या करतो, वर्गवारीनुसार:

- **Azure रिसोर्स नावे (लाइन 51-60)**:
      - मुख्य Azure सेवा रिसोर्स नावे जसे की, रिसोर्स ग्रुप, AI Hub, AI प्रोजेक्ट इ.
- **फीचर फ्लॅग्ज (लाइन 61-63)**:
      - विशिष्ट Azure सेवा सक्षम/अक्षम करण्यासाठी Boolean चल
- **AI एजंट कॉन्फिगरेशन (लाइन 64-71)**:
      - मुख्य AI एजंटसाठी कॉन्फिगरेशन ज्यात नाव, ID, डिप्लॉयमेंट सेटिंग्ज, मॉडेल तपशील
- **AI एम्बेडिंग कॉन्फिगरेशन (लाइन 72-79)**:
      - व्हेक्टर शोधासाठी वापरल्या जाणाऱ्या एम्बेडिंग मॉडेलचे कॉन्फिगरेशन
- **शोध आणि मॉनिटरिंग (लाइन 80-84)**:
      - शोध निर्देशांक नाव, विद्यमान रिसोर्स ID आणि मॉनिटरिंग/ट्रेसिंग सेटिंग्ज

---

## 3. पर्यावरणीय चल जाणून घ्या
खालील पर्यावरणीय चल तुमच्या डिप्लॉयमेंटची कॉन्फिगरेशन आणि वर्तन नियंत्रित करतात, त्यांच्या प्राथमिक उद्दिष्टानुसार आयोजित आहेत. बहुतेक चलांकरिता संवेदनशील डीफॉल्ट्स आहेत, परंतु तुम्ही त्यांना तुमच्या गरजेनुसार किंवा विद्यमान Azure संसाधनांशी जुळवून कस्टमाइझ करू शकता.

### 3.1 आवश्यक चल 

```bash title="" linenums="0"
# कोर Azure कॉन्फिगरेशन
AZURE_ENV_NAME                    # पर्यावरणाचे नाव (रिसोर्स नामनिर्देशनासाठी वापरलेले)
AZURE_LOCATION                    # वितरण प्रदेश
AZURE_SUBSCRIPTION_ID             # लक्ष्य सदस्यता
AZURE_RESOURCE_GROUP              # रिसोर्स गटाचे नाव
AZURE_PRINCIPAL_ID                # RBAC साठी वापरकर्ता प्रधान

# रिसोर्स नावे (जर दिली नसतील तर आपोआप तयार होतात)
AZURE_AIHUB_NAME                  # Microsoft Foundry हबचे नाव
AZURE_AIPROJECT_NAME              # AI प्रकल्पाचे नाव
AZURE_AISERVICES_NAME             # AI सेवा खाते नाव
AZURE_STORAGE_ACCOUNT_NAME        # संग्रहण खाते नाव
AZURE_CONTAINER_REGISTRY_NAME     # कंटेनर नोंदणीचे नाव
AZURE_KEYVAULT_NAME               # की व्हॉल्टचे नाव (जर वापरले असेल तर)
```

### 3.2 मॉडेल कॉन्फिगरेशन 
```bash title="" linenums="0"
# चॅट मॉडेल कॉन्फिगरेशन
AZURE_AI_AGENT_MODEL_NAME         # डीफॉल्ट: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # डीफॉल्ट: OpenAI (किंवा Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # डीफॉल्ट: उपलब्ध नवीनतम
AZURE_AI_AGENT_DEPLOYMENT_NAME    # चॅट मॉडेलसाठी तैनातीचे नाव
AZURE_AI_AGENT_DEPLOYMENT_SKU     # डीफॉल्ट: मानक
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # डीफॉल्ट: ८० (TPM च्या हजारोंमध्ये)

# एम्बेडिंग मॉडेल कॉन्फिगरेशन
AZURE_AI_EMBED_MODEL_NAME         # डीफॉल्ट: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # डीफॉल्ट: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # डीफॉल्ट: उपलब्ध नवीनतम
AZURE_AI_EMBED_DEPLOYMENT_NAME    # एम्बेडिंगसाठी तैनातीचे नाव
AZURE_AI_EMBED_DEPLOYMENT_SKU     # डीफॉल्ट: मानक
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # डीफॉल्ट: ५० (TPM च्या हजारोंमध्ये)

# एजंट कॉन्फिगरेशन
AZURE_AI_AGENT_NAME               # एजंट प्रदर्शन नाव
AZURE_EXISTING_AGENT_ID           # विद्यमान एजंट वापरा (ऐच्छिक)
```

### 3.3 फीचर टॉगल
```bash title="" linenums="0"
# ऐच्छिक सेवा
USE_APPLICATION_INSIGHTS         # डीफॉल्ट: सत्य
USE_AZURE_AI_SEARCH_SERVICE      # डीफॉल्ट: खोटे
USE_CONTAINER_REGISTRY           # डीफॉल्ट: सत्य

# निरीक्षण आणि ट्रेसिंग
ENABLE_AZURE_MONITOR_TRACING     # डीफॉल्ट: खोटे
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # डीफॉल्ट: खोटे

# शोध सेटिंग्ज
AZURE_AI_SEARCH_INDEX_NAME       # शोध निर्देशांकाचे नाव
AZURE_SEARCH_SERVICE_NAME        # शोध सेवेचे नाव
```

### 3.4 AI प्रोजेक्ट कॉन्फिगरेशन 
```bash title="" linenums="0"
# विद्यमान संसाधने वापरा
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # विद्यमान AI प्रकल्पाचा पूर्ण संसाधन आयडी
AZURE_EXISTING_AIPROJECT_ENDPOINT       # विद्यमान प्रकल्पाचा एंडपॉइंट URL
```

### 3.5 तुमची चल तपासा

Azure Developer CLI वापरून तुमची पर्यावरणीय चल पहा आणि व्यवस्थापित करा:

```bash title="" linenums="0"
# वर्तमान वातावरणासाठी सर्व पर्यावरण चल पहा
azd env get-values

# विशिष्ट पर्यावरण चल मिळवा
azd env get-value AZURE_ENV_NAME

# पर्यावरण चल सेट करा
azd env set AZURE_LOCATION eastus

# .env फाइलमधून अनेक चल सेट करा
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतरण सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून भाषांतरित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये चुका किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतर घेणे शिफारसीय आहे. या भाषांतराच्या वापरामुळे झालेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलहरीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->