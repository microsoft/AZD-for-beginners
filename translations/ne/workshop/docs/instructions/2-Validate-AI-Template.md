# 2. Validate a Template

!!! tip "यस मोड्युलको अन्त्यसम्म तपाईं सक्षम हुनुहुनेछ"

    - [ ] AI समाधान वास्तुकला विश्लेषण गर्ने
    - [ ] AZD डिप्लोयमेन्ट वर्कफ्लो बुझ्ने
    - [ ] AZD प्रयोगमा GitHub Copilot बाट सहयोग लिने
    - [ ] **Lab 2:** AI Agents टेम्पलेट डिप्लोय र मान्यकरण गर्ने

---


## 1. Introduction

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) वा `azd` एक open-source कमाण्डलाइन उपकरण हो जसले Azure मा अनुप्रयोग निर्माण र डिप्लोयर गर्दा डेभलपर वर्कफ्लोलाई सरल बनाउँछ। 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) मानकीकृत रिपोजिटरीहरू हुन् जसमा नमूना अनुप्रयोग कोड, _infrastructure-as-code_ सम्पत्ति, र `azd` कन्फिगरेसन फाइलहरू समावेश छन् ताकि समेकित समाधान वास्तुकलाको लागि सहजता होस्। पूर्वाधार प्रोविजन गर्न `azd provision` जति सजिलो हुन्छ - र `azd up` प्रयोग गर्दा तपाईं एकै पटक पूर्वाधार प्रोभिजन **र** अनुप्रयोग डिप्लोय गर्न सक्नुहुन्छ!

नतिजा स्वरुप, तपाईंको अनुप्रयोग विकास प्रक्रियालाई सुरु गर्न उपयुक्त _AZD Starter template_ पत्ता लगाउनु पर्याप्त हुन सक्छ जुन तपाईंको अनुप्रयोग र पूर्वाधार आवश्यकतासँग नजिक हुन्छ - त्यसपछि रिपोजिटरीलाई तपाईंको परिदृश्य अनुरूप अनुकूलन गर्नुहोस्।

सुरु गर्नु अघि, आउनुहोस् सुनिश्चित गरौं कि तपाईंले Azure Developer CLI स्थापना गर्नुभएको छ।

1. VS Code टर्मिनल खोल्नुस् र यो कमाण्ड टाइप गर्नुस्:

      ```bash title="" linenums="0"
      azd version
      ```

1. तपाईंले यस्तै केही देख्नुहुनेछ!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**अब तपाईं azd सँग टेम्पलेट छनोट र डिप्लोय गर्न तयार हुनुहुन्छ**

---

## 2. Template Selection

Microsoft Foundry प्लेटफर्मले [प्रति-सिफारिस AZD टेम्पलेटहरूको सेट](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) प्रदान गर्छ जुन लोकप्रिय समाधान परिदृश्यहरू जस्तै _multi-agent workflow automation_ र _multi-modal content processing_ कभर गर्छन्। तपाईं यी टेम्पलेटहरू Microsoft Foundry पोर्टलमा गएर पनि पत्ता लगाउन सक्नुहुन्छ।

1. भ्रमण गर्नुस् [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. जब आबश्यक हुन्छ Microsoft Foundry पोर्टलमा लगइन गर्नुस् - तपाईंलाई यस्तै केही देखिनेछ।

![टेम्पलेट छनोट](../../../../../translated_images/ne/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** विकल्पहरू तपाईंका स्टार्टेर टेम्पलेटहरू हुन्:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) जसले एक आधारभूत च्याट अनुप्रयोग _तपाईंको डाटासहित_ Azure Container Apps मा डिप्लोय गर्छ। यसलाई आधारभूत AI च्याटबट परिदृश्य अन्वेषण गर्न प्रयोग गर्नुहोस्।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) जसले पनि Foundry Agents सहित मानक AI Agent डिप्लोय गर्छ। उपकरण र मोडेलहरूसँग सम्बन्धित agentic AI समाधानहरू बुझ्न यसलाई प्रयोग गर्नुहोस्।

दोस्रो लिङ्क नयाँ ब्राउजर ट्याबमा खोल्नुहोस् (वा सम्बन्धित कार्डको लागि `Open in GitHub` क्लिक गर्नुहोस्)। तपाईंले यस AZD टेम्पलेटको रिपोजिटरी देख्नुहुनेछ। README अन्वेषण गर्न एक मिनेट लिनुस्। अनुप्रयोग वास्तुकला यसप्रकार देखिन्छ:

![वास्तुकला](../../../../../translated_images/ne/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

यस टेम्पलेटलाई डिप्लोय गरी मान्य छ कि छैन जाँच गरौं। हामी [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) सेक्सनमा दिइएका निर्देशनहरू पालना गर्नेछौं।

1. [यो लिङ्क](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) क्लिक गर्नुहोस् - `Create codespace` को लागि डिफल्ट क्रिया पुष्टि गर्नुहोस्
1. यसले नयाँ ब्राउजर ट्याब खोल्छ - GitHub Codespaces सत्र लोड हुन पर्खनुहोस्
1. Codespaces मा VS Code टर्मिनल खोल्नुहोस् - निम्न कमाण्ड टाइप गर्नुहोस्:

   ```bash title="" linenums="0"
   azd up
   ```

यसले ट्रिगर गर्ने workflow कदमहरू पूरा गर्नुहोस्:

1. तपाईंलाई Azure मा लगइन गर्न अनुरोध गरिनेछ - प्रमाणिकरणका निर्देशनहरू पालना गर्नुहोस्
1. तपाईंको लागि एक अनौठो environment नाम प्रविष्ट गर्नुहोस् - उदाहरणका लागि मैले `nitya-mshack-azd` प्रयोग गरें
1. यसले `.azure/` फोल्डर सिर्जना गर्नेछ - तपाईंले env नामसहित एक सबफोल्डर देख्नुहुनेछ
1. तपाईंलाई सदस्यता नाम चयन गर्न अनुरोध गरिनेछ - डिफल्ट चयन गर्नुहोस्
1. तपाईंलाई स्थानको लागि सोधिनेछ - `East US 2` प्रयोग गर्नुहोस्

अब, प्रोविजनिङ पूरा हुन पर्खनुहोस्। **यसले 10-15 मिनेट लिन्छ**

1. हुँदा हुँदा, तपाईंको कन्सोलले यस प्रकारको SUCCESS सन्देश देखाउनेछ:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. तपाईंको Azure Portal मा अब उक्त env नामसहित प्रोविजन गरिएको रिसोर्स ग्रुप हुनेछ:

      ![पूर्वाधार](../../../../../translated_images/ne/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **अब तपाईं डिप्लोय गरिएको पूर्वाधार र अनुप्रयोग मान्य गर्न तयार हुनुहुन्छ**।

---

## 4. Template Validation

1. Azure Portal मा [Resource Groups](https://portal.azure.com/#browse/resourcegroups) पृष्ठ भ्रमण गर्नुहोस् - जब غوښتियो लगइन गर्नुहोस्
1. आफ्नो environment नामको RG मा क्लिक गर्नुहोस् - माथि देखिएको पृष्ठ देख्नुहुनेछ

      - Azure Container Apps रिसोर्समा क्लिक गर्नुहोस्
      - _Essentials_ सेक्सन (उपरी दायाँ) मा रहेको Application Url मा क्लिक गर्नुहोस्

1. तपाईंले यस प्रकारको होस्ट गरिएको अनुप्रयोग फ्रन्ट-एण्ड UI देख्नुहुनेछ:

   ![एप](../../../../../translated_images/ne/03-test-application.471910da12c3038e.webp)

1. केही [नमूना प्रश्नहरू](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) सोधेर हेर्नुस्

      1. सोध्नुहोस्: ```What is the capital of France?``` 
      1. सोध्नुहोस्: ```What's the best tent under $200 for two people, and what features does it include?```

1. तपाईंले तल देखिएझैं उत्तरहरू पाउनुहुनेछ। _तर यो कसरी काम गर्छ?_

      ![प्रश्न परीक्षण](../../../../../translated_images/ne/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

Azure Container App ले एउटा एन्डप्वाइन्ट डिप्लोय गर्छ जुन यस टेम्पलेटका लागि Microsoft Foundry प्रोजेक्टमा प्रोभिजन गरिएको AI Agent सँग जडान हुन्छ। यसको के अर्थ हुन्छ हेरौं।

1. आफ्नो रिसोर्स ग्रुपको Azure Portal _Overview_ पृष्ठमा फर्किनुहोस्

1. सूचीमा रहेको `Microsoft Foundry` रिसोर्समा क्लिक गर्नुहोस्

1. तपाईंले यसलाई देख्नुहुनेछ। `Go to Microsoft Foundry Portal` बटन क्लिक गर्नुहोस्। 
   ![Foundry](../../../../../translated_images/ne/04-view-foundry-project.fb94ca41803f28f3.webp)

1. तपाईंले आफ्नो AI अनुप्रयोगको Foundry Project पृष्ठ देख्नुहुनेछ
   ![Project](../../../../../translated_images/ne/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` मा क्लिक गर्नुहोस् - तपाईंले प्रोजेक्टमा प्रोभिजन गरिएको डिफल्ट Agent देख्नुहुनेछ
   ![Agents](../../../../../translated_images/ne/06-visit-agents.bccb263f77b00a09.webp)

1. यसलाई चयन गर्नुहोस् - र तपाईंले Agent विवरणहरू देख्नुहुनेछ। निम्न कुरामा ध्यान दिनुहोस्:

      - Agent ले डिफल्ट रूपमा File Search प्रयोग गर्छ (सधैं)
      - Agent को `Knowledge` सूचकको अर्थ यो हो कि यसमा 32 फाइलहरू अपलोड गरिएको छ (फाइल सर्चका लागि)
      ![Agents](../../../../../translated_images/ne/07-view-agent-details.0e049f37f61eae62.webp)

1. बाँयातिरको मेनुमा `Data+indexes` विकल्प खोज्नुहोस् र विवरण हेर्न क्लिक गर्नुहोस्। 

      - तपाईंले ज्ञानका लागि अपलोड गरिएको 32 डेटा फाइलहरू देख्नुहुनेछ।
      - यी `src/files` अन्तर्गतका 12 customer फाइल र 20 product फाइलहरू अनुरूप हुनेछन्
      ![Data](../../../../../translated_images/ne/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**तपाईंले Agent संचालन मान्य गर्नुभयो!**

1. Agent को प्रतिक्रिया ती फाइलहरूमा भएका ज्ञानमा आधारित हुन्छ। 
1. अब तपाईं त्यस डेटासँग सम्बन्धित प्रश्नहरू सोध्न सक्नुहुन्छ र आधारभूत उत्तरहरू प्राप्त गर्न सक्नुहुन्छ।
1. उदाहरण: `customer_info_10.json` ले "Amanda Perez" द्वारा गरिएको 3 खरीदहरूको विवरण दिन्छ

Container App एन्डप्वाइन्ट भएको ब्राउजर ट्याबमा फिर्ता जानुहोस् र सोध्नुहोस्: `What products does Amanda Perez own?`. तपाईंले यस प्रकारको केही देख्नुहुनेछ:

![डेटा प्रश्न](../../../../../translated_images/ne/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry का क्षमताहरूको बारेमा थोरै बढी बुझ्नको लागि, Agents Playground मा Agent लाई प्रयोग गरौं।

1. Microsoft Foundry मा `Agents` पृष्ठमा फर्कनुहोस् - डिफल्ट agent चयन गर्नुहोस्
1. `Try in Playground` विकल्प क्लिक गर्नुहोस् - तपाईंले यस प्रकारको Playground UI पाउनु हुनेछ
1. उस्तै प्रश्न सोध्नुहोस्: `What products does Amanda Perez own?`

    ![प्लेलगाउँडमा सोध्नुहोस्](../../../../../translated_images/ne/09-ask-in-playground.a1b93794f78fa676.webp)

तपाईंले उस्तै (वा समान) उत्तर प्राप्त गर्नुहुनेछ - तर तपाईंले थप जानकारी पनि पाउनुहुनेछ जसले तपाईंलाई तपाइँको agentic अनुप्रयोगको गुणस्तर, लागत, र प्रदर्शन बुझ्न मद्दत गर्छ। उदाहरणका लागि:

1. प्रतिक्रिया कुन डेटा फाइलहरूले "ground" गरेको भन्ने उद्धरण जनाइएको छ
1. यी फाइल लेबलहरूमाथि होभर गर्नुहोस् - के डेटा तपाइँको क्वेरी र प्रदर्शित प्रतिक्रियासँग मेल खान्छ?

तपाईंले प्रतिक्रिया मुनि एउटा _stats_ पङक्ति पनि देख्नुहुनेछ।

1. कुनै मेट्रिकमा होभर गर्नुहोस् - जस्तै Safety। तपाईंले यस्तै केहि देख्नुहुनेछ
1. मूल्याङ्कन गरिएको स्तरले तपाइँको प्रतिक्रिया सुरक्षा स्तरसँग मेल खान्छ कि छैन जाँच गर्नुहोस्

      ![Agent](../../../../../translated_images/ne/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability भनेको तपाईंको अनुप्रयोगलाई यस्तो तरिकाले इन्स्ट्रुमेन्ट गर्नु हो कि त्यो अपरेसनहरू बुझ्न, डिबग गर्न र अनुकूलन गर्न प्रयुक्त डेटा उत्पन्न गरोस्। यसको अनुभव लिन:

1. `View Run Info` बटन क्लिक गर्नुहोस् - तपाईंले यो दृश्य देख्नुहुनेछ। यो [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) को एउटा उदाहरण हो। _तपाईंले यो दृश्य थ्रेड लगहरू शीर्ष-स्तर मेनुमा क्लिक गरेर पनि प्राप्त गर्न सक्नुहुन्छ_।

   - रन चरणहरू र एजेन्टले प्रयोग गरेका उपकरणहरूको अनुभव पाउनुहोस्
   - प्रतिक्रिया को लागि कुल Token गणना (वा output tokens उपयोग) समझ्नुहोस्
   - ढिलाइ र कार्यान्वयनमा समय कहाँ खर्च भइरहेको छ बुझ्नुहोस्

      ![Agent](../../../../../translated_images/ne/10-view-run-info.b20ebd75fef6a1cc.webp)

1. रनका लागि थप सान्दर्भिक गुणहरू हेर्न `Metadata` ट्याबमा क्लिक गर्नुहोस्, जुन पछि समस्याहरू डिबग गर्दा उपयोगी प्रसंग प्रदान गर्न सक्छ।   

      ![Agent](../../../../../translated_images/ne/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` ट्याबमा क्लिक गरेर एजेन्ट प्रतिक्रियामा गरिएका स्वचालित मूल्याङ्कनहरू हेर्नुहोस्। यसमा सुरक्षा मूल्याङ्कनहरू (जस्तै, Self-harm) र एजेन्ट-विशिष्ट मूल्याङ्कनहरू (जस्तै, Intent resolution, Task adherence) समावेश छन्।

      ![Agent](../../../../../translated_images/ne/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. अन्त्यमा, साइडबार मेनुमा `Monitoring` ट्याब क्लिक गर्नुहोस्।

      - प्रदर्शित पृष्ठमा `Resource usage` ट्याब चयन गर्नुहोस् - र मेट्रिक्सहरू हेर्नुहोस्।
      - लागत (tokens) र लोड (requests) का अर्थमा अनुप्रयोग प्रयोग ट्र्याक गर्नुहोस्।
      - पहिलो बाइटसम्मको अनुप्रयोग ढिलाइ (इनपुट प्रशोधन) र अन्तिम बाइटसम्मको ढिलाइ (आउटपुट) ट्र्याक गर्नुहोस्।

      ![Agent](../../../../../translated_images/ne/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

अहिलेसम्म, हामी ब्राउजरमा डिप्लोयमेन्ट हुँदै गरेका चरणहरू हेर्यौं - र पुष्टि गर्यौं कि हाम्रो पूर्वाधार प्रोभिजन गरिएको छ र अनुप्रयोग सञ्चालनमा छ। तर कोड-प्रथम रूपमा अनुप्रयोगसँग काम गर्नका लागि, हामीले यी स्रोतहरूसँग काम गर्न आवश्यक सम्बन्धित भेरिएबलहरू लोकल विकास वातावरणमा कन्फिगर गर्नुपर्छ। `azd` प्रयोग गर्दा यो सजिलो हुन्छ।

1. Azure Developer CLI [environment variables प्रयोग गर्छ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) र तिनीहरू अनुप्रयोग डिप्लोयमेन्टहरूको कन्फिगरेसन सेटिङहरू भण्डारण तथा व्यवस्थापन गर्न प्रयोग हुन्छन्।

1. Environment variables `.azure/<env-name>/.env` मा भण्डारण गरिन्छ - यसले तिनीहरूलाई डिप्लोयमेन्टको दौरान प्रयोग गरिएको `env-name` वातावरणसम्म सीमित गर्छ र एउटै रिपोमा विभिन्न डिप्लोयमेन्ट लक्षहरूको लागि वातावरणहरू अलग राख्न मद्दत गर्छ।

1. `azd` ले कुनै विशेष कमाण्ड चलाउँदा तिनीहरूलाई स्वतः लोड गर्छ (जस्तै, `azd up`)। ध्यान दिनुहोस् कि `azd` ले OS-स्तरका environment variables (जस्तै, shell मा सेट गरिएका) स्वतः पढ्दैन - बरु स्क्रिप्टहरूको भित्र जानकारी सार्न `azd set env` र `azd get env` प्रयोग गर्नुहोस्।


केही कमाण्डहरू प्रयास गरौं:

1. यस वातावरणमा `azd` का लागि सेट गरिएका सबै environment variables प्राप्त गर्नुहोस्:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      तपाईं यस प्रकारको देख्नुहुनेछ:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. कुनै विशेष मान प्राप्त गर्नुहोस् - उदाहरणका लागि, म जान्न चाहन्छु कि `AZURE_AI_AGENT_MODEL_NAME` मान सेट गरिएको छ कि छैन

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      तपाईंलाई यस्तो देखिनेछ - यो डिफल्ट रूपमा सेट गरिएको थिएन!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` का लागि नयाँ environment variable सेट गर्नुहोस्। यहाँ, हामी agent मोडेल नाम अपडेट गर्दैछौं। _सूचना: गरिएका कुनै पनि परिवर्तनहरू तुरुन्तै `.azure/<env-name>/.env` फाइलमा प्रतिबिम्बित हुनेछन्।_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      अब, हामीले यो मान सेट गरिएको देख्नु पर्छ:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. ध्यान दिनुहोस् कि केही स्रोतहरू स्थायी हुन्छन् (जस्तै, मोडेल डिप्लोयमेन्टहरू) र ती पुनःडिप्लोय गर्न केवल `azd up` भन्दा बढी आवश्यक हुन सक्छ। मूल डिप्लोयमेन्ट तोडेर परिवर्तित env vars सँग पुनःडिप्लोय गर्ने प्रयास गरौं।

1. **Refresh** यदि तपाईंले पहिले azd टेम्पलेट प्रयोग गरेर पूर्वाधार डिप्लोय गर्नुभएको थियो - तपाईंले स्थानीय environment variables को अवस्था Azure डिप्लोयमेन्टको वर्तमान अवस्थाबाट रिफ्रेश गर्न सक्नुहुन्छ यस कमाण्ड प्रयोग गरेर:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      यो दुई वा दुई भन्दा बढी स्थानीय विकास वातावरणहरू (उदाहरणका लागि, धेरै विकासकर्ताहरू भएको टिम) बीचमा पर्यावरण भेरिएबलहरूलाई _समकालिक_ गर्ने शक्तिशाली तरिका हो - जसले तैनाथ गरिएको पूर्वाधारलाई पर्यावरण भेरिएबलको अवस्थाको आधारभूत सत्यको रूपमा काम गर्न अनुमति दिन्छ। टिमका सदस्यहरूले केवल भेरिएबलहरूलाई _रिफ्रेश_ गरेर फेरि समकालिक हुन सक्छन्।

---

## 9. बधाइयाँ 🏆

तपाईंले भर्खरै एउटा अन्त्यदेखि-अन्तसम्मको कार्यप्रवाह पूरा गर्नुभयो जहाँ तपाईंले:

- [X] प्रयोग गर्न चाहनुभएको AZD टेम्पलेट चयन गर्नुभयो
- [X] GitHub Codespaces सँग टेम्पलेट सुरु गर्नुभयो
- [X] टेम्पलेट डिप्लोय गर्नुभयो र यो काम गर्छ भनेर प्रमाणित गर्नुभयो

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्ने सम्भावना हुन्छ। मूल दस्तावेजलाई यसको मूल भाषामा अधिकारप्राप्त स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार रहेको छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->