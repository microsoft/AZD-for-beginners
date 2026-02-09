# 2. टेम्पलेट मान्य गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्म तपाईं सक्षम हुनुहुनेछ"

    - [ ] AI समाधान वास्तुकला विश्लेषण गर्न
    - [ ] AZD परिनियोजन कार्यप्रवाह बुझ्न
    - [ ] AZD को प्रयोगमा मद्दतका लागि GitHub Copilot प्रयोग गर्न
    - [ ] **Lab 2:** AI Agents टेम्पलेट परिनियोजन र मान्य गर्नुहोस्

---


## 1. परिचय

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) वा `azd` खुला-श्रोत कमाण्डलाइन उपकरण हो जसले Azure मा अनुप्रयोग निर्माण र परिनियोजन गर्दा विकसकको कार्यप्रवाहलाई सरल बनाउँछ। 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) मानकीकृत रिपोजिटरीहरू हुन् जसले नमूना अनुप्रयोग कोड, _infrastructure-as-code_ सम्पत्ति, र `azd` कन्फिगरेसन फाइलहरू एक समेकित समाधान वास्तुकलाका लागि समावेश गर्दछन्। इन्फ्रास्ट्रक्चर प्रोभिजन गर्नु `azd provision` आदेशजस्तै सरल हुन्छ - जबकि `azd up` प्रयोग गर्दा तपाईंले एकैपटक इन्फ्रास्ट्रक्चर प्रोभिजन **र** आफ्नो अनुप्रयोग परिनियोजन गर्न सक्नुहुन्छ!

नतिजा स्वरूप, अनुप्रयोग विकास प्रक्रिया छिटो सुरु गर्न उपयुक्त _AZD Starter template_ फेला पार्नु र त्यसपछि रिपोजिटरीलाई तपाईंको परिदृश्य अनुरूप अनुकूल गर्नु पर्याप्त हुन सक्छ।

शुरु गर्नु अघि, आउनुहोस् सुनिश्चित गरौं कि तपाईंसँग Azure Developer CLI इन्स्टल छ।

1. VS Code टर्मिनल खोल्नुहोस् र यो आदेश टाइप गर्नुहोस्:

      ```bash title="" linenums="0"
      azd version
      ```

1. तपाईंले यस्तो केही देख्नुहुनेछ!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**अब तपाईं azd प्रयोग गरी टेम्पलेट चयन र परिनियोजन गर्न तयार हुनुहुन्छ**

---

## 2. टेम्पलेट छनोट

Microsoft Foundry प्लेटफर्मसँग [सिफारिस गरिएका AZD टेम्पलेटहरूको सेट](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) उपलब्ध छ जुन लोकप्रिय समाधान परिदृश्यहरू जस्तै _multi-agent workflow atomation_ र _multi-modal content processing_ समेट्छ। तपाईं यी टेम्पलेटहरू Microsoft Foundry पोर्टलमा भ्रमण गरेर पनि पत्ता लगाउन सक्नुहुन्छ।

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![छान्नुहोस्](../../../../../translated_images/ne/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) जसले तपाईंको डाटासहित Azure Container Apps मा एउटा आधारभूत च्याट अनुप्रयोग परिनियोजन गर्छ। यसलाई आधारभूत AI च्याटबोट परिदृश्य अन्वेषण गर्न प्रयोग गर्नुहोस्।
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) जसले पनि एउटा मानक AI Agent (with the Foundry Agents) परिनियोजन गर्छ। उपकरण र मोडेलहरू समावेश गर्ने एजेन्टिक AI समाधानसँग परिचित हुन यसको प्रयोग गर्नुहोस्।

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![वास्तुकला](../../../../../translated_images/ne/architecture.8cec470ec15c65c7.webp)

---

## 3. टेम्पलेट सक्रियकरण

आउनुहोस् यो टेम्पलेट परिनियोजन गर्ने प्रयास गरौं र यो मान्य छ कि छैन सुनिश्चित गरौं। हामी [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) खण्डमा रहेका दिशानिर्देशहरू पालना गर्नेछौं।

1. Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirm the default action to `Create codespace`
1. This opens a new browser tab - wait for the GitHub Codespaces session to complete loading
1. Open the VS Code terminal in Codespaces - type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. तपाईंलाई Azure मा लगइन गर्न भनिनेछ - प्रमाणीकरणका लागि निर्देशनहरू अनुसरण गर्नुहोस्
1. आफ्नो लागि अनौठो वातावरण नाम प्रविष्ट गर्नुहोस् - जस्तै, मैले `nitya-mshack-azd` प्रयोग गरेँ
1. यसले `.azure/` फोल्डर बनाउँछ - तपाईंले env नाम सहित उप-फोल्डर देख्नुहुनेछ
1. तपाईंलाई सदस्यता नाम चयन गर्न भनिनेछ - डिफल्ट चयन गर्नुहोस्
1. स्थान (location) का लागि सोधिनेछ - `East US 2` प्रयोग गर्नुहोस्

अहिले, तपाईं प्रोभिजन पूरा हुन कुर्नुहुनेछ। **यसले 10-15 मिनेट लिन्छ**

1. सम्पन्न भएपछि, तपाईंको कन्सोलले यस प्रकारको SUCCESS सन्देश देखाउनेछ:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![प्रोभिजन गरिएको इन्फ्रास्ट्रक्चर](../../../../../translated_images/ne/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **अब तपाईं परिनियोजित इन्फ्रास्ट्रक्चर र अनुप्रयोग मान्य गर्न तयार हुनुहुन्छ**।

---

## 4. टेम्पलेट मान्यता

1. Azure Portal को [Resource Groups](https://portal.azure.com/#browse/resourcegroups) पृष्ठ भ्रमण गर्नुहोस् - संकेत आएमा लगइन गर्नुहोस्
1. आफ्नो वातावरण नामको RG मा क्लिक गर्नुहोस् - माथिको पृष्ठ देख्नुहुनेछ

      - Azure Container Apps स्रोतमा क्लिक गर्नुहोस्
      - _Essentials_ सेक्सन (टप दायाँ) मा रहेको Application Url मा क्लिक गर्नुहोस्

1. तपाईंले यस प्रकारको होस्ट गरिएको अनुप्रयोग फ्रन्ट-एन्ड UI देख्नुहुनेछ:

   ![अनुप्रयोग](../../../../../translated_images/ne/03-test-application.471910da12c3038e.webp)

1. केही [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) सोधेर प्रयास गर्नुहोस्

      1. प्रश्न सोध्नुहोस्: ```What is the capital of France?``` 
      1. प्रश्न सोध्नुहोस्: ```What's the best tent under $200 for two people, and what features does it include?```

1. तपाईंले तल देखाइएको जस्तै उत्तरहरू प्राप्त गर्नुहुनेछ। _तर यो कसरी काम गर्छ?_ 

      ![प्रश्न](../../../../../translated_images/ne/03-test-question.521c1e863cbaddb6.webp)

---

## 5. एजेन्ट मान्यता

Azure Container App ले एउटा एन्डपोइन्ट परिनियोजन गर्छ जुन यस टेम्पलेटका लागि Microsoft Foundry प्रोजेक्टमा प्रोभिजन गरिएको AI Agent सँग जडान गर्छ। यसको अर्थ के हो हेर्नुहोस्।

1. आफ्नो resource group को Azure Portal _Overview_ पृष्ठमा फर्कनुहोस्

1. ती सूचीमा रहेको `Microsoft Foundry` स्रोतमा क्लिक गर्नुहोस्

1. तपाईंले यो देख्नुहुनेछ। `Go to Microsoft Foundry Portal` बटनमा क्लिक गर्नुहोस्। 
   ![Foundry](../../../../../translated_images/ne/04-view-foundry-project.fb94ca41803f28f3.webp)

1. तपाईंले आफ्नो AI अनुप्रयोगको Foundry Project पृष्ठ देख्नुहुनेछ
   ![प्रोजेक्ट](../../../../../translated_images/ne/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` मा क्लिक गर्नुहोस् - तपाईंले आफ्नो प्रोजेक्टमा प्रोभिजन गरिएको डिफल्ट एजेन्ट देख्नुहुनेछ
   ![एजेन्टहरू](../../../../../translated_images/ne/06-visit-agents.bccb263f77b00a09.webp)

1. यसलाई चयन गर्नुहोस् - र तपाईंले एजेन्ट विवरणहरू देख्नुहुनेछ। तलका कुराहरूको नोट गर्नुहोस्:

      - एजेन्टले डिफल्ट रूपमा File Search प्रयोग गर्छ (सधैं)
      - एजेन्टको `Knowledge` ले देखाउँछ कि यसमा 32 फाइलहरू अपलोड भएका छन् (file search को लागि)
      ![Agents](../../../../../translated_images/ne/07-view-agent-details.0e049f37f61eae62.webp)

1. बाँयातिरको मेनुमा `Data+indexes` विकल्प खोज्नुहोस् र विवरणका लागि क्लिक गर्नुहोस्। 

      - तपाईंले ज्ञानका लागि अपलोड गरिएका 32 डेटा फाइलहरू देख्नुहुनेछ।
      - यी `src/files` भित्रका 12 ग्राहक फाइल र 20 उत्पादन फाइलहरूसँग मेल खान्छन् 
      ![डेटा](../../../../../translated_images/ne/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**तपाईंले एजेन्ट सञ्चालन मान्य गर्नुभयो!** 

1. एजेन्टका प्रतिक्रिया ती फाइलहरूमा भएका ज्ञानमा आधारित/grounded हुन्छन्। 
1. अब तपाईं ती डेटा सम्बन्धी प्रश्नहरू सोध्न सक्नुहुन्छ र ग्राउन्डेड प्रतिक्रिया प्राप्त गर्न सक्नुहुन्छ।
1. उदाहरण: `customer_info_10.json` मा "Amanda Perez" द्वारा गरिएको 3 खरीदहरू वर्णन छन्

ब्राउजर ट्याब जसमा Container App एन्डपोइन्ट खुला छ त्यसमा फर्केर सोध्नुहोस्: `What products does Amanda Perez own?`. तपाईंले यस्तो केही देख्नुहुनेछ:

![डेटा](../../../../../translated_images/ne/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. एजेन्ट प्लेग्राउन्ड

Microsoft Foundry का क्षमताहरूलाई अलिकति बढी बुझ्नको लागि, एजेन्टलाई Agents Playground मा घुमाउँदै हेरौँ। 

1. Microsoft Foundry मा `Agents` पृष्ठमा फर्कनुहोस् - डिफल्ट एजेन्ट चयन गर्नुहोस्
1. `Try in Playground` विकल्पमा क्लिक गर्नुहोस् - तपाईंले यस प्रकारको Playground UI पाउनुहुनेछ
1. उही प्रश्न सोध्नुहोस्: `What products does Amanda Perez own?`

    ![डेटा](../../../../../translated_images/ne/09-ask-in-playground.a1b93794f78fa676.webp)

तपाईंले उस्तै (वा समान) प्रतिक्रिया प्राप्त गर्नुहुनेछ - तर यसले थप जानकारी पनि देखाउँछ जुन तपाईंको एजेन्टिक अनुप्रयोगको गुणस्तर, लागत, र प्रदर्शन बुझ्न उपयोगी हुन्छ। उदाहरणका लागि:

1. प्रतिक्रिया "ground" गर्न प्रयोग गरिएका डेटा फाइलहरू उद्धृत गरिन्छ भन्ने कुरामा ध्यान दिनुहोस्
1. यी फाइल लेबलहरू माथि Hover गर्नुहोस् - के डेटा तपाईंको प्रश्न र प्रदर्शन गरिएको प्रतिक्रियासँग मेल खान्छ?

तपाईंले प्रतिक्रियाको तल एक _stats_ पंक्ति पनि देख्नुहुनेछ। 

1. कुनै पनि मेट्रिकमा Hover गर्नुहोस् - जस्तै Safety। तपाईंले यस प्रकार केही देख्नुहुनेछ
1. मूल्याङ्कन गरिएको रेटिङ तपाईंको प्रतिक्रियाको सुरक्षा स्तर सम्बन्धी अनुभूतिको मेल खान्छ?

      ![डेटा](../../../../../translated_images/ne/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. बिल्ट-इन अवलोकनीयता

अवलोकनीयता भनेको तपाईंको अनुप्रयोगमा यस्ता उपकरणहरू राख्ने बारे हो जसले डेटा उत्पन्न गर्छ जुन सञ्चालन, डिबग, र अनुकूलन गर्न प्रयोग गर्न सकिन्छ। यसको एक अनुभूति पाउनका लागि:

1. `View Run Info` बटनमा क्लिक गर्नुहोस् - तपाईंले यो दृश्य देख्नुहुनेछ। यो [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) को कार्यान्वयन उदाहरण हो। _तपाईंले यो दृश्य शीर्ष-स्तर मेनुमा Thread Logs क्लिक गरेर पनि पाउन सक्नुहुन्छ_।

   - रन स्टेपहरू र एजेन्टले संलग्न गरेका उपकरणहरूको महसुस लिनुहोस्
   - प्रतिक्रियाको लागि कुल Token गणना (र आउटपुट टोकनको प्रयोग) बुझ्नुहोस्
   - लेटेन्सी र कार्यान्वयनमा समय कहाँ खर्च भइरहेको छ बुझ्नुहोस्

      ![एजेन्ट](../../../../../translated_images/ne/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` ट्याबमा क्लिक गरेर रनका लागि थप गुणहरू हेर्नुहोस्, जसले पछि समस्या निवारणका लागि उपयोगी सन्दर्भ दिन सक्छ।   

      ![एजेन्ट](../../../../../translated_images/ne/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` ट्याबमा क्लिक गर्दा एजेन्ट प्रतिक्रियामा गरिएको स्वचालित मूल्याङ्कनहरू देख्न सकिन्छ। यीमा सुरक्षा मूल्याङ्कनहरू (उदाहरण: Self-harm) र एजेन्ट-विशेष मूल्याङ्कनहरू (उदाहरण: Intent resolution, Task adherence) समावेश छन्।

      ![एजेन्ट](../../../../../translated_images/ne/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. अन्त्यमा, साइडबार मेनुमा रहेको `Monitoring` ट्याबमा क्लिक गर्नुहोस्।

      - प्रदर्शन गरिएको पृष्ठमा `Resource usage` ट्याब चयन गर्नुहोस् - र मेट्रिक्स हेर्नुहोस्।
      - लागत (tokens) र लोड (requests) को हिसाबमा अनुप्रयोग प्रयोग ट्र्याक गर्नुहोस्।
      - पहिलो बाइट (इनपुट प्रोसेसिङ) र अन्तिम बाइट (आउटपुट) सम्मको अनुप्रयोग लेटेन्सी ट्र्याक गर्नुहोस्।

      ![एजेन्ट](../../../../../translated_images/ne/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. वातावरण चरहरू

अबसम्म, हामीले ब्राउजरमा परिनियोजन हिँडेर हेरेका छौँ - र हाम्रो इन्फ्रास्ट्रक्चर प्रोभिजन गरिएको र अनुप्रयोग सञ्चालनमा रहेको मान्य गरिसकेका छौँ। तर अनुप्रयोगलाई _कोड-प्रथम_ तरिकाले काम गर्नको लागि, हामीले यी स्रोतहरूसँग काम गर्न आवश्यक सम्बन्धित भेरिएबलहरूसँग हाम्रो लोकल विकास वातावरण कन्फिगर गर्नुपर्छ। `azd` प्रयोग गर्दा यो सजिलो हुन्छ।

1. Azure Developer CLI ले [environment variables प्रयोग गर्दछ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) जसले अनुप्रयोग परिनियोजनहरूको लागि कन्फिगरेसन सेटिङहरू भण्डार र व्यवस्थापन गर्छ।

1. वातावरण चरहरू `.azure/<env-name>/.env` मा भण्डार गरिन्छ - यसले तिनीहरूलाई डिप्लोइमेन्टको क्रममा प्रयोग गरिएको `env-name` वातावरणमा सीमित गर्दछ र एउटै रिपोमा फरक परिनियोजन लक्षहरूको बीच वातावरणहरू अलग गर्न मद्दत गर्छ।

1. वातावरण चरहरू `azd` आदेशले स्वत: लोड गर्छ जब यसले कुनै विशिष्ट आदेश निष्पादित गर्छ (उदाहरणका लागि, `azd up`)। ध्यान दिनुहोस् कि `azd` ले स्वतः _OS-level_ वातावरण चरहरू (जस्तै shell मा सेट गरिएको) पढ्दैन - बरु `azd set env` र `azd get env` प्रयोग गरेर स्क्रिप्टहरू भित्र जानकारी सार्नुपर्छ।


आउनुहोस् केहि आदेशहरू प्रयास गरौं:

1. यस वातावरणमा `azd` का लागि सेट गरिएका सबै वातावरण चरहरू प्राप्त गर्नुहोस्:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      तपाईंले यस्तो केही देख्नुहुनेछ:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. एउटा विशेष मान प्राप्त गर्नुहोस् - जस्तै, मैले `AZURE_AI_AGENT_MODEL_NAME` मान सेट गरिएको छ कि छैन जान्न चाहन्छु

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      तपाईंले यस्तो देख्नुहुनेछ - यो डिफल्टले सेट गरिएको थिएन!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` का लागि नयाँ वातावरण चर सेट गर्नुहोस्। यहाँ हामी एजेन्ट मोडेल नाम अपडेट गर्दैछौं। _नोट: गरिएका कुनै पनि परिवर्तनहरू तुरुन्तै `.azure/<env-name>/.env` फाइलमा परावर्तित हुनेछ।_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      अब, हामीले पाउनु पर्छ कि मान सेट गरिएको छ:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. ध्यान दिनुहोस् कि केही स्रोतहरू स्थायी हुन्छन् (उदाहरण: मोडेल परिनियोजन) र पुनःपरिनियोजन थिच्न केवल `azd up` भन्दा बढी चाहिन्छ। आउनुहोस् मूल परिनियोजन तहसनहस गरेर परिवर्तन गरिएका env vars सहित पुनःपरिनियोजन गर्ने प्रयास गरौं।

1. **Refresh** यदि तपाईंले पहिले कुनै azd टेम्पलेट प्रयोग गरी इन्फ्रास्ट्रक्चर परिनियोजन गर्नुभएको थियो भने - तपाईंले आफ्नो स्थानीय वातावरण चरहरूको अवस्थामा Azure परिनियोजनको वर्तमान अवस्थाका आधारमा _refresh_ गर्न यो आदेश प्रयोग गर्न सक्नुहुन्छ:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      यो दुई वा बढी स्थानीय विकास वातावरणहरू (जस्तै, धेरै विकासकर्ताहरू भएको टोली) बीच पर्यावरण भेरिएबलहरू _सिंक_ गर्ने एक शक्तिशाली तरिका हो - जसले परिनियोजित पूर्वाधारलाई पर्‍यावरण भेरिएबलहरूको अवस्थाका लागि वास्तविक स्रोतको रूपमा सेवा गर्न अनुमति दिन्छ। टोलीका सदस्यहरूले केवल भेरिएबलहरू _रिफ्रेश_ गरेर फेरि समक्रमित हुन्छन्।

---

## 9. बधाई 🏆

तपाईंले भर्खरै एउटा अन्त्यदेखि अन्त्यसम्मको कार्यप्रवाह पूरा गर्नुभयो जहाँ तपाईंले:

- [X] तपाईंले प्रयोग गर्न चाहानु भएको AZD Template चयन गर्नुभयो
- [X] GitHub Codespaces प्रयोग गरेर Template सुरु गर्नुभयो 
- [X] Template परिनियोजित गर्नुभयो र यसले काम गर्छ भनेर मान्य गर्नुभयो

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं; तथापि कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा नै अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->