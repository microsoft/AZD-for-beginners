# 4. एक साचा कॉन्फिगर करा

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही पुढील गोष्टी करू शकाल"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. प्रत्यक्ष साच्यापासून सुरू करा

तुम्ही आरंभी केलेल्या रिपॉझिटरीतील [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) उघडा. अपस्ट्रीम साचा स्वतंत्रपणे बदलू शकतो या कार्यशाळेपासून. खालील **उद्धरण** 4 नोव्हेंबर, 2026 रोजी तपासले गेले आहे; हे पूर्ण फाइलचे पर्याय नाही:

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

- `name` AZD प्रकल्प ओळखतो; `metadata.template` साचा आवृत्ती नोंदवितो.
- `requiredVersions.azd` हा साच्याचा किमान आवृत्ती आहे, जुना CLI वापरण्याचा सल्ला नाही. चालू समर्थित AZD प्रकाशन वापरा.
- `services` अनुप्रयोग तैनाती लक्ष्ये परिभाषित करतो. हा साचा त्याचा Python API आणि फ्रंटएंड एक कंटेनर अॅप सेवा म्हणून तैनात करतो.
- `project` हा `azure.yaml` च्या सापेक्ष आहे.
- `remoteBuild` एक रिमोट कंटेनर बिल्ड मागणी करतो. तुमची ओळख अजूनही आवश्यक Azure परवानग्या मागते.

साच्याच्या बाइसिप फाइल्स `infra/` अंतर्गत आहेत, एकट्या `services` यादीनुसार नाहीत, जसे माइक्रोसॉफ्ट फाउंड्री, मॉडेल तैनाती, संचयन, आणि ऐच्छिक AI शोध घोषणा करतात.

## 2. जीवनचक्र होक्स समजून घ्या

साचा चालवण्याआधी `hooks` विभाग आणि त्याच्या संदर्भित स्क्रिप्ट तपासा. पुनरावलोकन केलेल्या आवृत्तीत समाविष्ट आहे:

| हुक | उद्दिष्ट | महत्त्वाचे वर्तन |
|------|---------|--------------------|
| `preup` | `up` वर्कफ्लोपूर्वी साचा पर्यावरण इनपुट्सचे वैधता तपासा | प्लॅटफॉर्म-विशिष्ट शेल स्क्रिप्ट्स अयशस्वी झाल्यास वर्कफ्लो थांबवू शकतात |
| `postdeploy` | अनुप्रयोग तैनाती नंतर साचा-विशिष्ट सेटअप चालवा | `continueOnError` आणि स्क्रिप्ट आउटपुट तपासा; यशस्वी तैनाती म्हणजे सर्व सेटअप कार्य यशस्वी झाले याची खात्री नाही |

या आवृत्तीमध्ये **नाही** जुन्या `postprovision` / `write_env` हुकचा समावेश जो आधीच्या कार्यशाळेच्या साहित्यामध्ये होता. जे स्क्रिप्ट्स आता अस्तित्वात नाहीत त्यांना हुक संदर्भ कॉपी करू नका.

हुक कीज लाइफसायकल इव्हेंट्स निवडतात; `posix` आणि `windows` प्लॅटफॉर्म अंमलबजावणी निवडतात. `shell`, `run`, `interactive`, आणि `continueOnError` अंमलबजावणी नियंत्रित करतात. हे तुमच्या परवानग्यांसह चालवता येणारे स्क्रिप्ट आहेत, त्यामुळे त्यांची पुनरावलोकन अ‍ॅप्लिकेशन कोडप्रमाणेच करा.

संपूर्ण लाइफसायकसाठी [AZD hooks documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) पहा.

## 3. इन्फ्रास्ट्रक्चरमध्ये पर्यावरण इनपुटचे मागोवा घ्या

प्रारंभिक नमुना रेपॉझिटरीमधून ही कमांड्स चालवा:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

टेम्पलेट खरोखर कोणते पर्यावरण व्हेरिएबल वापरते ते पाहण्यासाठी `infra/main.parameters.json` तपासा. `azd env set` ने एक मनमानी नाव सेट करणे स्वयंचलितपणे Azure संसाधन बदलत नाही.

पुनरावलोकन केलेल्या डीफॉल्ट्समध्ये समाविष्ट आहेत:

| इनपुट | डीफॉल्ट / उद्देश |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; कोटा युनिट्स मॉडेल आणि वितरण प्रकारावर अवलंबून असतात |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; डेटा हाताळणीचे पुनरावलोकन न केल्यास अमान्य ठेवा |

हे नमुना-विशिष्ट इनपुट आहेत, जागतिक AZD सेटिंग्ज नाहीत. मॉडल, SKU, क्षमता किंवा स्थान निवडण्यापूर्वी [मॉडेल आणि प्रदेश समर्थन दस्तऐवज](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) आणि आपल्या सदस्यत्वाची कोटा तपासा. प्रत्येक क्षमतेची युनिट दर मिनिटाला 1,000 टोकन म्हणून समजून घेऊ नका.

वेगळा चॅट मॉडेल निवडण्यासाठी, त्याच्या सुसंगत **नाव, आवृत्ती, फॉरमॅट, SKU, आणि क्षमता एकत्रितपणे** अद्ययावत करा, [नमुनेच्या सानुकूलन मार्गदर्शक](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md) चे पालन करा. फक्त नाव बदलल्यास सुसंगत नसलेली आवृत्ती किंवा तैनाती प्रकार राहू शकतो.

## ४. प्रयोगशाळा: ऐच्छिक शोध आणि ट्रेसिंग सक्षम करा

!!! warning "हे सेटिंग्ज बिल करण्यायोग्य स्त्रोत जोडू शकतात"

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

संरचना बदलांसाठी व्यवस्था आवश्यक आहे; फक्त `azd deploy` अनुप्रयोग सेवा तैनात करते. शोध अनुक्रमणिका आणि समर्थीत पुनर्प्राप्ती पर्यायांसाठी, [AI शोध मार्गदर्शक](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) चे पालन करा. निरीक्षणासाठी, [अवलोकनक्षम मार्गदर्शक](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) चे पालन करा.

आवश्यक संमती, प्रवेश नियंत्रण, संग्रह धोरण आणि छूपणीशिवाय प्रत्यक्ष ग्राहक डेटा वर प्रॉम्प्ट/प्रतिसाद सामग्री कॅप्चर सक्षम करू नका.

## ५. विद्यमान स्त्रोत आणि CI/CD

Foundry प्रकल्प पुनःवापर करण्यासाठी, नमुन्याच्या [existing-resource सूचना](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) चे अनुसरण करा. `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` सेट केल्याने तैनातीचा मार्ग बदलतो; अशा परिस्थितीत, टेम्पलेट आपल्यासाठी Application Insights किंवा AI Search तयार करत नाही. अवलंबित्वे, भूमिका नियुक्त्या, आणि मॉडेल तैनाती स्पष्टपणे तपासा.

`pipeline.variables` विभाग तयार केलेल्या पाइपलाइनमध्ये पाठविलेल्या मूल्यांना नियंत्रित करतो; हे गुप्त संचयस्थळ नाही आणि Azure संसाधने तयार करत नाही. अॅपमध्ये व्यवस्थापित ओळख आणि CI/CD साठी OIDC ला प्राधान्य द्या. AZD पर्यावरण फाइल्स प्लेनटेक्स्ट आहेत आणि कमिट करू नयेत.

AZD स्थानिक तयार केलेल्या विश्वासार्ह dotenv फाइलचा आयात करण्यास समर्थन देते:

```bash
azd env set --file .env
```

आयात करण्यापूर्वी ती फाइल तपासा, आणि गुप्त माहिती असलेले पर्यावरण फाइल्स सामायिक टर्मिनल्स किंवा CI लॉगमध्ये प्रिंट करू नका.

## 6. आपली समज तपासा

- कोणता `azure.yaml` सेवा अॅप्लिकेशन तैनात करते?
- आपण बदललेले प्रत्येक मूल्य कोणत्या पायाभूत सेवा घटकाने वापरले गेले?
- कोणते बदल केवळ तैनात करण्याऐवजी प्राव्हिजनिंगची गरज आहे?
- निवडलेला प्रदेश आणि सदस्यत्व मॉडेल व कोटा समर्थन करतात का?
- सर्व सेटअप हुक यशस्वीरित्या चालले का, आणि आपण तैनात केलेल्या अॅप्लिकेशनच्या वर्तनाची पुष्टी करू शकता का?

पुढे जा [टेम्पलेट सानुकूल करा](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->