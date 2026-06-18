# 2. टेम्पलेट सत्यापित करें

> `azd 1.25.6` के साथ जून 2026 में सत्यापित।

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] AI सॉल्यूशन आर्किटेक्चर का विश्लेषण करना
    - [ ] AZD डिप्लॉयमेंट वर्कफ़्लो को समझना
    - [ ] AZD उपयोग पर सहायता के लिए GitHub Copilot का उपयोग करना
    - [ ] **Lab 2:** AI Agents टेम्पलेट को परिनियोजित और सत्यापित करना

---


## 1. परिचय

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) या `azd` एक ओपन-सोर्स कमांडलाइन टूल है जो Azure पर एप्लिकेशन बनाते और परिनियोजित करते समय डेवलपर वर्कफ़्लो को सरल बनाता है। 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) मानकीकृत रिपॉज़िटरी हैं जिनमें सैंपल एप्लिकेशन कोड, _infrastructure-as-code_ एसेट्स, और `azd` कॉन्फ़िगरेशन फ़ाइलें शामिल होती हैं ताकि एक संगठित समाधान आर्किटेक्चर मिल सके। इन्फ्रास्ट्रक्चर प्रोविज़न करना केवल `azd provision` कमांड जितना सरल हो जाता है - और `azd up` का उपयोग करके आप एक ही बार में इन्फ्रास्ट्रक्चर प्रोविज़न और अपना एप्लिकेशन तैनात कर सकते हैं!

नतीजतन, अपने एप्लिकेशन विकास प्रक्रिया की शुरुआत सही _AZD Starter template_ खोजकर करना जितना सरल हो सकता है जो आपके एप्लिकेशन और इन्फ्रास्ट्रक्चर आवश्यकताओं के सबसे करीब हो - और फिर रिपॉज़िटरी को आपके परिदृश्य आवश्यकताओं के अनुसार अनुकूलित करना।

शुरू करने से पहले, सुनिश्चित कर लें कि आपके पास Azure Developer CLI इंस्टॉल है।

1. VS Code टर्मिनल खोलें और यह कमांड टाइप करें:

      ```bash title="" linenums="0"
      azd version
      ```

1. आपको कुछ ऐसा दिखाई देगा!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**अब आप azd के साथ एक टेम्पलेट चुनने और परिनियोजित करने के लिए तैयार हैं**

---

## 2. टेम्पलेट चयन

Microsoft Foundry प्लेटफ़ॉर्म के साथ [सुझाए गए AZD टेम्पलेट्स का एक सेट](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) आता है जो लोकप्रिय समाधान परिदृश्यों को कवर करता जैसे _multi-agent workflow automation_ और _multi-modal content processing_. आप Microsoft Foundry पोर्टल पर जाकर भी इन टेम्पलेट्स को खोज सकते हैं।

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. जब संकेत मिले तो Microsoft Foundry पोर्टल में लॉग इन करें - आप कुछ ऐसा देखेंगे।

![चुनें](../../../../../translated_images/hi/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) जो Azure Container Apps पर एक बेसिक चैट एप्लिकेशन _आपके डेटा के साथ_ डिप्लॉय करता है। इसका उपयोग एक बेसिक AI चैटबॉट परिदृश्य का अन्वेषण करने के लिए करें।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) जो एक मानक AI Agent (Foundry Agents के साथ) भी डिप्लॉय करता है। इसका उपयोग टूल्स और मॉडलों वाले एजेंटिक AI समाधानों से परिचित होने के लिए करें।

दूसरे लिंक को एक नए ब्राउज़र टैब में खोलें (या संबंधित कार्ड के लिए `Open in GitHub` पर क्लिक करें)। आपको इस AZD टेम्पलेट का रिपॉज़िटरी दिखाई देगा। README का एक मिनट के लिए अन्वेषण करें। एप्लिकेशन आर्किटेक्चर इस तरह दिखता है:

![आर्किटेक्चर](../../../../../translated_images/hi/architecture.8cec470ec15c65c7.webp)

---

## 3. टेम्पलेट सक्रियकरण

आइए इस टेम्पलेट को परिनियोजित करने की कोशिश करें और सुनिश्चित करें कि यह वैध है। हम [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) अनुभाग में दिए दिशानिर्देशों का पालन करेंगे।

1. टेम्पलेट रिपॉज़िटरी के लिए एक कार्यशील वातावरण चुनें:

      - **GitHub Codespaces**: इस लिंक पर क्लिक करें [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) और `Create codespace` की पुष्टि करें
      - **Local clone or dev container**: `Azure-Samples/get-started-with-ai-agents` को क्लोन करें और इसे VS Code में खोलें

1. जब तक VS Code टर्मिनल तैयार न हो जाए प्रतीक्षा करें, फिर निम्नलिखित कमांड टाइप करें:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. जब संकेत आएगा तो आपको Azure में लॉग इन करने के लिए कहा जाएगा - प्रमाणीकृत करने के निर्देशों का पालन करें
1. अपने लिए एक अद्वितीय environment नाम दर्ज करें - उदाहरण: मैंने `nitya-mshack-azd` उपयोग किया
1. यह `.azure/` फ़ोल्डर बनाएगा - आप env नाम के साथ एक सबफ़ोल्डर देखेंगे
1. आपसे एक subscription नाम चुनने के लिए कहा जाएगा - डिफ़ॉल्ट चुनें
1. आपसे लोकेशन के लिए पूछा जाएगा - `East US 2` का उपयोग करें

अब, आप प्रोविजनिंग के पूरा होने का इंतजार करें। **यह 10-15 मिनट लेता है**

1. पूरा होने पर, आपका कंसोल इस तरह का SUCCESS संदेश दिखाएगा:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. आपके Azure पोर्टल में अब उस env नाम के साथ एक प्रोविज़न किया गया रिसोर्स ग्रुप होगा:

      ![इन्फ्रा](../../../../../translated_images/hi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **अब आप परिनियोजित इन्फ्रास्ट्रक्चर और एप्लिकेशन का सत्यापन करने के लिए तैयार हैं**।

---

## 4. टेम्पलेट सत्यापन

1. Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) पृष्ठ पर जाएँ - जब संकेत मिले तो लॉग इन करें
1. अपने environment नाम के RG पर क्लिक करें - आप ऊपर का पृष्ठ देखेंगे

      - Azure Container Apps रिसोर्स पर क्लिक करें
      - _Essentials_ सेक्शन (ऊपर दाहिने) में Application Url पर क्लिक करें

1. आपको इस तरह एक होस्टेड एप्लिकेशन फ्रंट-एंड UI दिखाई देना चाहिए:

   ![ऐप](../../../../../translated_images/hi/03-test-application.471910da12c3038e.webp)

1. कुछ [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) पूछकर प्रयास करें

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. आपको नीचे दिखाए गए जैसी उत्तर मिलनी चाहिए। _पर यह कैसे काम करता है?_ 

      ![ऐप](../../../../../translated_images/hi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. एजेंट सत्यापन

Azure Container App एक endpoint डिप्लॉय करता है जो इस टेम्पलेट के लिए Microsoft Foundry प्रोजेक्ट में प्रोविज़न किए गए AI Agent से कनेक्ट होता है। आइए देखें इसका क्या मतलब है।

1. अपने रिसोर्स ग्रुप के लिए Azure Portal _Overview_ पृष्ठ पर वापस जाएँ

1. उस सूची में `Microsoft Foundry` रिसोर्स पर क्लिक करें

1. आपको यह दिखना चाहिए। `Go to Microsoft Foundry Portal` बटन पर क्लिक करें। 
   ![Foundry](../../../../../translated_images/hi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. आपको अपने AI एप्लिकेशन के लिए Foundry Project पृष्ठ दिखाई देगा
   ![प्रोजेक्ट](../../../../../translated_images/hi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` पर क्लिक करें - आप अपने प्रोजेक्ट में प्रोविज़न किया गया डिफ़ॉल्ट Agent देखेंगे
   ![एजेंट्स](../../../../../translated_images/hi/06-visit-agents.bccb263f77b00a09.webp)

1. इसे चुनें - और आप Agent विवरण देखेंगे। निम्न बातों पर ध्यान दें:

      - एजेंट डिफ़ॉल्ट रूप से File Search का उपयोग करता है (हमेशा)
      - एजेंट की `Knowledge` सूचित करती है कि इसमें 32 फ़ाइलें अपलोड की गई हैं (file search के लिए)
      ![एजेंट्स](../../../../../translated_images/hi/07-view-agent-details.0e049f37f61eae62.webp)

1. बाएँ मेनू में `Data+indexes` विकल्प देखें और विवरण के लिए उस पर क्लिक करें। 

      - आपको knowledge के लिए अपलोड की गई 32 डेटा फ़ाइलें दिखनी चाहिए।
      - ये `src/files` के अंतर्गत 12 customer फ़ाइलों और 20 product फ़ाइलों के अनुरूप होंगी
      ![डेटा](../../../../../translated_images/hi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**आपने एजेंट ऑपरेशन की पुष्टि कर ली है!** 

1. एजेंट के उत्तर उन फ़ाइलों में मौजूद ज्ञान पर आधारित होते हैं। 
1. अब आप उस डेटा से संबंधित प्रश्न पूछ सकते हैं, और ग्राउंडेड उत्तर प्राप्त कर सकते हैं।
1. उदाहरण: `customer_info_10.json` वर्णन करता है "Amanda Perez" द्वारा की गई 3 खरीदारीयों को

ब्राउज़र टैब जहाँ Container App endpoint खुला है, उस पर वापस जाकर पूछें: `What products does Amanda Perez own?`. आपको कुछ ऐसा दिखाई देना चाहिए:

![डेटा](../../../../../translated_images/hi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. एजेंट प्लेग्राउंड

Microsoft Foundry की क्षमताओं के बारे में और समझ विकसित करने के लिए, आइए Agents Playground में एजेंट को आज़माएँ। 

1. Microsoft Foundry में `Agents` पृष्ठ पर लौटें - डिफ़ॉल्ट एजेंट चुनें
1. `Try in Playground` विकल्प पर क्लिक करें - आपको एक Playground UI ऐसा दिखाई देना चाहिए
1. वही प्रश्न पूछें: `What products does Amanda Perez own?`

    ![डेटा](../../../../../translated_images/hi/09-ask-in-playground.a1b93794f78fa676.webp)

आपको वही (या समान) उत्तर मिलेगा - लेकिन आपको अतिरिक्त जानकारी भी मिलती है जिसका उपयोग आप अपने एजेंटिक ऐप की गुणवत्ता, लागत और प्रदर्शन को समझने के लिए कर सकते हैं। उदाहरण के लिए:

1. ध्यान दें कि उत्तर में उन डेटा फ़ाइलों का हवाला दिया गया है जिनका उपयोग उत्तर को "ग्राउंड" करने के लिए हुआ है
1. इनमें से किसी भी फ़ाइल लेबल पर होवर करें - क्या डेटा आपके प्रश्न और प्रदर्शित उत्तर से मेल खाता है?

आप उत्तर के नीचे एक _stats_ पंक्ति भी देखते हैं। 

1. किसी भी मीट्रिक पर होवर करें - उदाहरण के लिए, Safety. आपको कुछ ऐसा दिखाई देगा
1. क्या आंका गया रेटिंग आपके इन्ट्यूशन के अनुसार उत्तर की सुरक्षा स्तर से मेल खाता है?

      ![डेटा](../../../../../translated_images/hi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. इन-बिल्ट ऑब्ज़रवेबिलिटी

Observability का मतलब है अपने एप्लिकेशन को इस तरह इंस्ट्रूमेंट करना कि वह डेटा जनरेट करे जिसका उपयोग संचालन को समझने, डिबग करने और अनुकूलित करने के लिए किया जा सके। इसका एक अनुभव लेने के लिए:

1. `View Run Info` बटन पर क्लिक करें - आपको यह व्यू दिखाई देगा। यह कार्रवाई में [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) का एक उदाहरण है। _आप इस व्यू को टॉप-लेवल मेनू में Thread Logs पर क्लिक करके भी प्राप्त कर सकते हैं_।

   - रन चरणों और एजेंट द्वारा उपयोग किए गए टूल्स की समझ प्राप्त करें
   - उत्तर के लिए कुल Token गिनती (विरुद्ध आउटपुट टोकन उपयोग) को समझें
   - विलंबता और निष्पादन में समय कहाँ खर्च हो रहा है यह समझें

      ![एजेंट](../../../../../translated_images/hi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. रन के लिए अतिरिक्त संदर्भ प्रदान कर सकने वाले गुण देखने के लिए `Metadata` टैब पर क्लिक करें।   

      ![एजेंट](../../../../../translated_images/hi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` टैब पर क्लिक करें ताकि एजेंट उत्तर पर स्वचालित आकलन देखें। इनमें सुरक्षा मूल्यांकन (जैसे, Self-harm) और एजेंट-विशिष्ट मूल्यांकन (जैसे, Intent resolution, Task adherence) शामिल हैं।

      ![एजेंट](../../../../../translated_images/hi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. अंत में, साइडबार मेनू में `Monitoring` टैब पर क्लिक करें।

      - प्रदर्शित पृष्ठ में `Resource usage` टैब चुनें - और मीट्रिक्स देखें।
      - लागत (tokens) और लोड (requests) के संदर्भ में एप्लिकेशन उपयोग को ट्रैक करें।
      - इनपुट प्रोसेसिंग के लिए first byte और आउटपुट के लिए last byte तक एप्लिकेशन विलंबता को ट्रैक करें।

      ![एजेंट](../../../../../translated_images/hi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. एनवायरनमेंट वेरिएबल्स

अब तक, हमने ब्राउज़र में परिनियोजन का रिव्यू किया है - और सत्यापित किया है कि हमारा इन्फ्रास्ट्रक्चर प्रोविज़न हुआ है और एप्लिकेशन ऑपरेशनल है। लेकिन कोड-प्रथम तरीके से एप्लिकेशन के साथ काम करने के लिए, हमें अपने लोकल डेवलपमेंट वातावरण को उन संबंधित वेरिएबल्स के साथ कॉन्फ़िगर करने की आवश्यकता है जो इन संसाधनों के साथ काम करने के लिए आवश्यक हैं। `azd` का उपयोग करना इसे आसान बनाता है।

1. Azure Developer CLI [एनवायरनमेंट वेरिएबल्स का उपयोग करता है](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) एप्लिकेशन परिनियोजन के लिए कॉन्फ़िगरेशन सेटिंग्स को स्टोर और प्रबंधित करने के लिए।

1. एनवायरनमेंट वेरिएबल्स `.azure/<env-name>/.env` में स्टोर किए जाते हैं - यह उन्हें डिप्लॉयमेंट के दौरान उपयोग किए गए `env-name` वातावरण तक सीमित करता है और उसी रिपॉज़िटरी में विभिन्न परिनियोजन लक्ष्यों के बीच वातावरणों को अलग रखने में मदद करता है।

1. एनवायरनमेंट वेरिएबल्स को `azd` कमांड द्वारा स्वचालित रूप से लोड किया जाता है जब भी यह कोई विशिष्ट कमांड निष्पादित करता है (उदाहरण के लिए, `azd up`)। ध्यान दें कि `azd` स्वत: ओएस-स्तरीय एनवायरनमेंट वेरिएबल्स (उदा., शेल में सेट किए गए) को पढ़ता नहीं है - इसके बजाय स्क्रिप्टों के भीतर जानकारी स्थानांतरित करने के लिए `azd set env` और `azd get env` का उपयोग करें।


आइए कुछ कमांड आज़माएँ:

1. उन सभी एनवायरनमेंट वेरिएबल्स को प्राप्त करें जो इस वातावरण में `azd` के लिए सेट हैं:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      आपको कुछ ऐसा दिखाई देगा:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. एक विशिष्ट मान प्राप्त करें - उदाहरण के लिए, मैं जानना चाहता हूँ कि क्या हमने `AZURE_AI_AGENT_MODEL_NAME` मान सेट किया है

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      आपको कुछ ऐसा दिखाई देगा - यह डिफ़ॉल्ट रूप से सेट नहीं था!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` के लिए एक नया एनवायरनमेंट वेरिएबल सेट करें। यहाँ, हम एजेंट मॉडल नाम अपडेट कर रहे हैं। _नोट: किसी भी परिवर्तन को तुरंत `.azure/<env-name>/.env` फ़ाइल में परिलक्षित किया जाएगा।_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      अब, हमें मान मिलना चाहिए:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. ध्यान दें कि कुछ रिसोर्सेज स्थायी होते हैं (उदा., मॉडल डिप्लॉयमेंट) और उनमें केवल `azd up` से पुन:डिप्लॉयमेंट के लिए अधिक आवश्यक हो सकता है। आइए मूल परिनियोजन को हटाकर परिवर्तित env vars के साथ पुनःडिप्लॉय करें।

1. **रीफ़्रेश** यदि आपने पहले किसी azd टेम्पलेट का उपयोग करके इन्फ्रास्ट्रक्चर परिनियोजित किया है - तो आप अपने स्थानीय एनवायरनमेंट वेरिएबल्स की स्थिति को अपने Azure परिनियोजन की वर्तमान स्थिति के आधार पर इस कमांड का उपयोग करके _रिफ्रेश_ कर सकते हैं:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      यह दो या अधिक स्थानीय विकास वातावरणों (उदा., कई डेवलपर्स वाली टीम) में पर्यावरण वेरिएबल्स को _सिंक_ करने का एक शक्तिशाली तरीका है - जिससे डिप्लॉय की गई अवसंरचना पर्यावरण वेरिएबल्स की स्थिति के लिए सत्य स्रोत के रूप में कार्य कर सके। टीम के सदस्य बस वेरिएबल्स को _रिफ्रेश_ करके फिर से सिंक हो जाते हैं।

---

## 9. बधाई हो 🏆

आपने अभी-अभी एक एंड-टू-एंड वर्कफ़्लो पूरा किया जहाँ आपने:

- [X] उपयोग के लिए इच्छित AZD Template का चयन किया
- [X] टेम्पलेट को एक समर्थित विकास वातावरण में खोला
- [X] टेम्पलेट को डिप्लॉय किया और सत्यापित किया कि यह काम करता है

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->