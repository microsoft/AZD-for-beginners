# 6. अवसंरचना समाप्त करें

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## बोनस अभ्यास

परियोजना को समाप्त करने से पहले, कुछ खुले अंत के अन्वेषण के लिए कुछ मिनट लें।

!!! info "इन अन्वेषण परामर्शों को आज़माएं"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## अवसंरचना की समाप्ति

1. अवसंरचना समाप्त करना जितना आसान है:

      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. चयनित पर्यावरण की पुष्टि करें और हटाए जाने वाले संसाधनों की समीक्षा करें। यह Azure संसाधनों को हटा देता है और डेटा नष्ट कर सकता है। इस सीखने के वर्कफ़्लो के लिए पुष्टि संकेत बनाए रखें। पूरा होने पर आपको निम्नलिखित जैसा आउटपुट दिखाई देगा:

      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. पोर्टल में हटाने की पुष्टि करें और डिप्लॉयमेंट के दायरे के बाहर के संसाधनों की जांच करें। लागत रिपोर्टिंग और कोटा अपडेट में देरी हो सकती है। स्थानीय `.azure` कॉन्फ़िगरेशन तब तक बनी रहती है जब तक आप इसे स्पष्ट रूप से नहीं हटा देते।

1. `azd down --purge` अतिरिक्त रूप से समर्थित सॉफ्ट-डिलीटेड संसाधनों के स्थायी हटाने का अनुरोध करता है। इसका उपयोग केवल तब करें जब पुनर्प्राप्ति आवश्यक न हो और आप प्रतिधारण/पर्ज-प्रोटेक्शन नीतियों को समझते हों। यह तत्काल कोटा रिलीज़ की गारंटी नहीं देता।

1. केवल सफाई की जांच करने के लिए पुनः तैनाती न करें। बाद में जानबूझकर `azd up` बची हुई स्थानीय इनपुट्स का उपयोग करके संसाधनों को फिर से बना सकता है, और फिर से शुल्क लेता है। मॉडल अपडेट सामान्यतः समर्थित प्रावधान परिवर्तनों का उपयोग करते हैं, न कि समाप्ति का।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->