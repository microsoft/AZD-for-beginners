# 4. एक टेम्पलेट कॉन्फ़िगर करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. वास्तविक टेम्पलेट से शुरू करें

उस रिपॉजिटरी में [`azure.yaml` इन Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) खोलें जिसे आपने इनिशियलाइज़ किया था। अपस्ट्रीम टेम्पलेट इस वर्कशॉप से स्वतंत्र रूप से बदल सकता है। निम्नलिखित **उद्धरण** 4 नवंबर, 2026 को जांचा गया था; यह पूरी फ़ाइल का प्रतिस्थापन नहीं है:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` AZD प्रोजेक्ट को पहचानता है; `metadata.template` टेम्पलेट संस्करण रिकॉर्ड करता है।
- `requiredVersions.azd` टेम्पलेट का न्यूनतम संस्करण है, पुरानी CLI पर बने रहने की सलाह नहीं। एक वर्तमान समर्थित AZD रिलीज़ का उपयोग करें।
- `services` एप्लिकेशन डिप्लॉयमेंट लक्ष्यों को परिभाषित करता है। यह टेम्पलेट पायथन API और फ्रंटेंड को एक कंटेनर एप्स सेवा के रूप में डिप्लॉय करता है।
- `project` `azure.yaml` के सापेक्ष है।
- `remoteBuild` एक रिमोट कंटेनर बिल्ड का अनुरोध करता है। आपकी पहचान को अभी भी आवश्यक Azure अनुमतियों की ज़रूरत होगी।

टेम्पलेट के Bicep फ़ाइलें `infra/` के तहत हैं, केवल `services` सूची नहीं, माइक्रोसॉफ्ट फाउंड्री, मॉडल डिप्लॉयमेंट्स, स्टोरेज, और वैकल्पिक AI Search जैसे संसाधनों की घोषणा करती हैं।

## 2. जीवनचक्र हुक को समझें

टेम्पलेट चलाने से पहले `hooks` सेक्शन और इसके संदर्भित स्क्रिप्ट्स का निरीक्षण करें। समीक्षा किया गया संस्करण शामिल है:

| हुक | उद्देश्य | महत्वपूर्ण व्यवहार |
|------|---------|--------------------|
| `preup` | `up` वर्कफ़्लो से पहले टेम्पलेट पर्यावरण इनपुट्स को सत्यापित करें | प्लेटफ़ॉर्म-विशिष्ट शेल स्क्रिप्ट विफलता पर वर्कफ़्लो रोक सकते हैं |
| `postdeploy` | एप्लिकेशन डिप्लॉयमेंट के बाद टेम्पलेट-विशिष्ट सेटअप चलाएं | `continueOnError` और स्क्रिप्ट आउटपुट का निरीक्षण करें; एक सफल डिप्लॉयमेंट यह साबित नहीं करता कि हर सेटअप कार्य सफल हुआ |

इस संस्करण में **पुराना** `postprovision` / `write_env` हुक शामिल नहीं है जैसा कि पहले कार्यशाला सामग्री में दिखाया गया था। उन स्क्रिप्ट्स के लिए हुक संदर्भ कॉपी न करें जो अब मौजूद नहीं हैं।

हुक कुंजियाँ जीवनचक्र घटनाओं का चयन करती हैं; `posix` और `windows` प्लेटफ़ॉर्म कार्यान्वयन का चयन करते हैं। `shell`, `run`, `interactive`, और `continueOnError` निष्पादन को नियंत्रित करते हैं। ये आपके अनुमतियों के साथ निष्पादन योग्य स्क्रिप्ट्स हैं, इसलिए इन्हें ठीक उसी तरह से समीक्षा करें जैसे आप एप्लिकेशन कोड की करते हैं।

पूर्ण जीवनचक्र के लिए [AZD hooks डाक्यूमेंटेशन](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) देखें।

## 3. पर्यावरण इनपुट को इन्फ्रास्ट्रक्चर में ट्रेस करें

प्रारंभिक नमूना रिपॉजिटरी से ये कमांड चलाएं:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

देखें `infra/main.parameters.json` कि टेम्पलेट वास्तव में कौन से पर्यावरण चर उपयोग करता है। `azd env set` के साथ एक मनमाना नाम सेट करना स्वचालित रूप से Azure संसाधन को नहीं बदलता।

समीक्षा किए गए डिफ़ॉल्ट मान शामिल हैं:

| इनपुट | डिफ़ॉल्ट / उद्देश्य |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; कोटा इकाइयाँ मॉडल और परिनियोजन प्रकार पर निर्भर करती हैं |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; डेटा हैंडलिंग की समीक्षा न होने तक अक्षम रखें |

ये नमूना-विशेष इनपुट हैं, वैश्विक AZD सेटिंग्स नहीं। मॉडल, SKU, क्षमता, या स्थान चुनने से पहले [मॉडल और क्षेत्र समर्थन दस्तावेज़](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) और आपकी सदस्यता की कोटा की जांच करें। प्रत्येक क्षमता इकाई को प्रति मिनट 1,000 टोकन के रूप में न समझें।

एक अलग चैट मॉडल चुनने के लिए, उसके संगत **नाम, संस्करण, प्रारूप, SKU, और क्षमता को साथ में अपडेट करें**, [नमूने के अनुकूलन मार्गदर्शिका](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md) का पालन करें। केवल नाम बदलने से असंगत संस्करण या तैनाती प्रकार रह सकता है।

## 4. प्रयोगशाला: वैकल्पिक खोज और ट्रेसिंग सक्षम करें

!!! चेतावनी "ये सेटिंग्स बिल योग्य संसाधन जोड़ सकती हैं"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

इंफ्रास्ट्रक्चर परिवर्तन प्रोविजनिंग की आवश्यकता होती है; केवल `azd deploy` एप्लिकेशन सेवाएं ही तैनात करता है। खोज अनुक्रमण और समर्थित पुनः प्राप्ति विकल्पों के लिए, [एआई खोज गाइड](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) का पालन करें। निगरानी के लिए, [प्रेक्षणशीलता गाइड](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) का पालन करें।

आवश्यक सहमति, पहुँच नियंत्रण, संरक्षण नीति, और संशोधन के बिना वास्तविक ग्राहक डेटा पर प्रॉम्प्ट/प्रतिक्रिया सामग्री कैप्चर सक्षम न करें।

## 5. मौजूदा संसाधन और CI/CD

एक Foundry प्रोजेक्ट का पुनः उपयोग करने के लिए, सैम्पल के [मौजूदा-संसाधन निर्देशों](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) का पालन करें। `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` सेट करने से परिनियोजन पथ बदल जाता है; उस स्थिति में, टेम्पलेट आपके लिए Application Insights या AI Search नहीं बनाता है। निर्भरताओं, भूमिका असाइनमेंट, और मॉडल परिनियोजन की स्पष्ट रूप से जांच करें।

`pipeline.variables` अनुभाग एक जनरेटेड पाइपलाइन में पास किए गए मानों को नियंत्रित करता है; यह एक गुप्त स्टोर नहीं है और Azure संसाधन नहीं बनाता है। ऐप में प्रबंधित पहचान और CI/CD के लिए OIDC को प्राथमिकता दें। AZD पर्यावरण फाइलें प्लेनटेक्स्ट होती हैं और इन्हें कमिट नहीं किया जाना चाहिए।

AZD एक भरोसेमंद, स्थानीय रूप से तैयार dotenv फ़ाइल को आयात करने का समर्थन करता है:

```bash
azd env set --file .env
```

आयात करने से पहले उस फ़ाइल की समीक्षा करें, और गुप्त जानकारी वाली पर्यावरण फ़ाइलों को साझा किए गए टर्मिनलों या CI लॉग में प्रिंट न करें।

## 6. अपनी समझ की जाँच करें

- कौन सा `azure.yaml` सेवा आवेदन को तैनात करता है?
- किस इन्फ्रास्ट्रक्चर पैरामीटर द्वारा आपने बदला गया प्रत्येक मान उपयोग किया जाता है?
- कौन से परिवर्तन केवल तैनाती की बजाय प्रोविज़निंग की आवश्यकता रखते हैं?
- क्या चयनित क्षेत्र और सदस्यता मॉडल और कोटा का समर्थन करते हैं?
- क्या सभी सेटअप हुक सफल हुए, और क्या आप तैनात किए गए आवेदन के व्यवहार को सत्यापित कर सकते हैं?

जारी रखें [टेम्प्लेट को अनुकूलित करें](5-Customize-AI-Template.md)।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->