# ४. टेम्पलेट कन्फिगर गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्म तपाईं सक्नुहुनेछ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## १. वास्तविक टेम्पलेटबाट सुरु गर्नुहोस्

तपाईंले सुरु गर्नुभएको रिपोजिटरीमा रहेको [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) खोल्नुहोस्। अपस्ट्रीम टेम्पलेट यस कार्यशालाबाट स्वतन्त्र रूपमा परिवर्तन हुन सक्छ। निम्नलिखित **अंश** नोभेम्बर ४, २०२६ मा जाँचिएको थियो; यो पूर्ण फाइलको विकल्प होइन:

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

- `name` ले AZD प्रोजेक्टलाई पहिचान गर्छ; `metadata.template` ले टेम्पलेट संस्करणलाई रेकर्ड गर्छ।
- `requiredVersions.azd` टेम्पलेटको न्यूनतम हो, पुरानो CLI मा रहन सिफारिस होइन। हालको समर्थित AZD रिलिज प्रयोग गर्नुहोस्।
- `services` ले एप्लिकेशन तैनाथ लक्ष्यहरू परिभाषित गर्छ। यो टेम्पलेटले यसको Python API र फ्रन्टएन्डलाई एक Container Apps सेवा रूपमा तैनाथ गर्छ।
- `project` ले `azure.yaml` सापेक्ष हुन्छ।
- `remoteBuild` ले रिमोट कन्टेनर बिल्डको अनुरोध गर्छ। तपाईंको पहिचानलाई अझै पनि आवश्यक Azure अनुमतिहरू चाहिन्छ।

टेम्पलेटका Bicep फाइलहरू `infra/` अन्तर्गत छन्, केवल `services` सूची मात्र होइन, जसले Microsoft Foundry, मोडल तैनाथीकरण, भण्डारण, र वैकल्पिक AI Search जस्ता स्रोतहरू घोषणा गर्छ।

## २. जीवनचक्र हुकहरू बुझ्नुहोस्

टेम्पलेट चलाउनु अघि `hooks` सेक्सन र यसको सन्दर्भित स्क्रिप्टहरू निरीक्षण गर्नुहोस्। समीक्षा गरिएको संस्करणमा समावेश छ:

| हुक | उद्देश्य | महत्वपूर्ण व्यवहार |
|------|---------|--------------------|
| `preup` | `up` वर्कफ्लो अघि टेम्पलेट वातावरण इनपुटहरू मान्य पार्ने | प्लेटफर्म-विशिष्ट शेल स्क्रिप्टहरूले असफलताको अवस्थामा वर्कफ्लो रोक्न सक्छ |
| `postdeploy` | एप्लिकेशन तैनाथीकरण पछि टेम्पलेट-विशिष्ट सेटअप चलाउने | `continueOnError` र स्क्रिप्ट आउटपुट निरीक्षण गर्ने; सफल तैनाथीकरणले सबै सेटअप कार्य सफल भएको प्रमाणित गर्दैन |

यो संस्करणले **पुरानो** `postprovision` / `write_env` हुक समावेश गर्दैन जुन पहिलेको कार्यशाला सामग्रीमा देखाइएको थियो। अब अवस्थित नभएका स्क्रिप्टहरूमा हुक सन्दर्भहरू नक्कल नगर्नुहोस्।

हुक कुञ्जीहरूले लाइफसाइकल घटनाहरू चयन गर्छन्; `posix` र `windows` प्लेटफर्म कार्यान्वयनहरू चयन गर्छन्। `shell`, `run`, `interactive`, र `continueOnError` कार्यान्वयन नियन्त्रण गर्छन्। यी तपाईंको अनुमतिहरू सहित executable स्क्रिप्टहरू हुन्, त्यसैले यिनीहरूलाई एप्लिकेशन कोड जस्तै समीक्षा गर्नुहोस्।

सम्पूर्ण लाइफसाइकलका लागि [AZD हुक्स दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) हेर्नुहोस्।

## ३. पूर्वाधारमा वातावरण इनपुटहरू ट्रेस गर्नुहोस्

यी आदेशहरू initialized नमूना रिपोजिटोरीबाट चलाउनुहोस्:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

कुन वातावरण चरहरू साँच्चै टेम्प्लेटले प्रयोग गर्छ हेर्न `infra/main.parameters.json` निरीक्षण गर्नुहोस्। `azd env set` सँग मनमाफिक नाम सेट गर्नुले स्वतः Azure स्रोत परिवर्तन गर्दैन।

समीक्षा गरिएका पूर्वनिर्धारितहरू समावेश छन्:

| इनपुट | पूर्वनिर्धारित / उद्देश्य |
|-------|-----------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; मात्रा युनिट मोडेल र डिप्लोयमेन्ट प्रकारमा भर पर्छ |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; डाटा ह्यान्डलिंग समीक्षा नगरिएको अवस्थामा अक्षम राख्नुहोस् |

यी नमूना-विशिष्ट इनपुटहरू हुन्, ग्लोबल AZD सेटिङहरू होइनन्। मोडेल, SKU, क्षमता, वा स्थान चयन गर्नु अघि [मोडेल र क्षेत्र समर्थन दस्तावेज](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) र तपाईंको सदस्यताको कोटा जाँच गर्नुहोस्। प्रत्येक क्षमता युनिटलाई प्रति मिनेट १,००० टोकनको रूपमा व्याख्या नगर्नुहोस्।

फरक च्याट मोडेल चयन गर्न, यसको उपयुक्त **नाम, संस्करण, ढाँचा, SKU, र क्षमता सँगै** अपडेट गर्नुहोस्, [नमूना अनुकूलन मार्गदर्शिका](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md) अनुसार। केवल नाम मात्र परिवर्तन गर्दा असंगत संस्करण वा डिप्लोयमेन्ट प्रकार रहन सक्छ।

## ४. प्रयोगशाला: वैकल्पिक खोज र ट्रेसिङ सक्षम गर्नुहोस्

!!! warning "यी सेटिङहरूले बिलयोग्य स्रोतहरू थप्न सक्छन्"

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

पूर्वाधार परिवर्तनहरू प्रावधान आवश्यक हुन्छन्; केवल `azd deploy` एप्लिकेशन सेवाहरू मात्र डिप्लोय गर्छ। खोज अनुक्रमणिका र समर्थित पुनःप्राप्ति विकल्पहरूका लागि [AI खोज मार्गदर्शिका](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) पछ्याउनुहोस्। मोनिटरिङका लागि [अवलोकनीयता मार्गदर्शिका](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) अनुसरण गर्नुहोस्।

आवश्यक सहमति, पहुँच नियन्त्रण, राख्ने नीति, र संक्षेपणविना वास्तविक ग्राहक डाटा मा prompt/response सामग्री कब्जा सक्षम नहोस्।

## ५. अवस्थित स्रोतहरू र CI/CD

Foundry परियोजना पुन: प्रयोग गर्न नमूना [अवस्थित-स्रोत निर्देशनहरू](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) अनुसरण गर्नुहोस्। `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` सेट गर्दा डिप्लोयमेन्ट पथ परिवर्तन हुन्छ; त्यस अवस्थामा, टेम्प्लेटले तपाईंका लागि Application Insights वा AI खोज सिर्जना गर्दैन। निर्भरताहरू, भूमिका असाइनमेन्टहरू, र मोडेल डिप्लोयमेन्टहरू स्पष्ट रूपमा पुष्टि गर्नुहोस्।

`pipeline.variables` अनुभागले उत्पन्न गरिएको पाइपलाइनमा मूल्यहरू पठाउने नियन्त्रण गर्छ; यो गोप्य भण्डार होइन र Azure स्रोतहरू सिर्जना गर्दैन। अनुप्रयोगमा प्रबन्धित पहिचान र CI/CD का लागि OIDC प्राथमिकता दिनुहोस्। AZD वातावरण फाइलहरू plaintext हुन्छन् र प्रतिबद्ध गर्नु हुँदैन।

AZD ले विश्वसनीय, स्थानीय रूपमा तयार गरिएको dotenv फाइल आयात समर्थन गर्छ:

```bash
azd env set --file .env
```

आयात गर्नु अघि सो फाइल समीक्षा गर्नुहोस् र गोप्य समावेश गर्ने वातावरण फाइलहरू साझा टर्मिनल वा CI लगहरूमा प्रिन्ट नगर्नुहोस्।

## ६. तपाईंको बुझाइ जाँच गर्नुहोस्

- कुन `azure.yaml` सेवा एप्लिकेशन डिप्लोय गर्छ?
- तपाईंले परिवर्तन गर्नुभएको प्रत्येक मानलाई कुन पूर्वाधार प्यारामिटर प्रयोग गर्दछ?
- कुन परिवर्तनहरूले केवल डिप्लोयमेन्ट होइन, प्रावधान आवश्यक पर्छ?
- छनौट गरिएको क्षेत्र र सदस्यताले मोडेल र कोटा समर्थन गर्यो?
- सबै सेटअप हुक् सफल भए? र तपाईंले डिप्लोय गरिएको एपको व्यवहार पुष्टि गर्न सक्नुहुन्छ?

जारी राख्नुहोस् [टेम्प्लेट अनुकूलन गर्नुहोस्](5-Customize-AI-Template.md)।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->