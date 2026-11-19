# 6. अवसंरचना समाप्त करना

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## बोनस अभ्यास

परियोजना को समाप्त करने से पहले, कुछ मिनट निकालकर कुछ खुला अन्वेषण करें।

!!! info "इन अन्वेषण प्रांप्ट्स को आज़माएं"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## अवसंरचना को हटाएं

!!! warning "यदि आपने GA होस्टेड-एजेंट अभ्यास भी पूरा किया है"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. अवसंरचना समाप्त करना उतना ही आसान है:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. चयनित वातावरण की पुष्टि करें और हटाए जाने वाले संसाधनों की समीक्षा करें। इससे Azure संसाधन हट जाते हैं और डेटा नष्ट हो सकता है। इस सीखने की कार्यप्रणाली के लिए पुष्टि प्रांप्ट रखें। पूरा होने पर आप इस तरह आउटपुट देखेंगे:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. पोर्टल में हटाए जाने की पुष्टि करें और तैनाती के दायरे से बाहर के संसाधनों की जांच करें। लागत रिपोर्टिंग और कोटा अपडेट में देरी हो सकती है। स्थानीय `.azure` कॉन्फ़िगरेशन तब तक रहता है जब तक आप इसे स्पष्ट रूप से नहीं हटाते।

1. `azd down --purge` अतिरिक्त रूप से समर्थित सॉफ्ट-डिलीटेड संसाधनों के स्थायी हटाने का अनुरोध करता है। इसे तभी उपयोग करें जब पुनर्प्राप्ति आवश्यक न हो और आप प्रतिधारण/पर्ज-संरक्षण नीतियों को समझते हों। यह त्वरित कोटा रिलीज़ की गारंटी नहीं देता।

1. केवल सफाई की पुष्टि के लिए पुनः तैनाती न करें। बाद में किए गए जानबूझकर `azd up` शेष स्थानीय इनपुट का उपयोग करके संसाधनों को पुनः बना सकते हैं, और इससे फिर से शुल्क लगेगा। मॉडल अपडेट सामान्य रूप से समर्थित प्रावधान परिवर्तनों का उपयोग करते हैं, न कि समाप्ति का।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->