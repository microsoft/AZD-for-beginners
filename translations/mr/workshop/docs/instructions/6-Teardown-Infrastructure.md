# 6. इन्फ्रास्ट्रक्चर हटविणे

!!! tip "या मॉड्यूलच्या शेवटी तुम्ही हे करू शकाल"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## बोनस व्यायाम

प्रोजेक्ट हटवण्यापूर्वी, काही मिनिटे घ्या आणि काही मुक्त अन्वेषण करा.

!!! info "ही अन्वेषणासाठी प्रॉम्प्ट्स वापरून पहा"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## इन्फ्रास्ट्रक्चर हटवा

1. इन्फ्रास्ट्रक्चर हटवणे सोपे आहे:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. निवडलेले वातावरण पुष्टी करा आणि हटविण्यासाठी संसाधने तपासा. हे Azure संसाधने हटवते आणि डेटा नष्ट करू शकते. या शिक्षण प्रक्रियेसाठी पुष्टीकरण प्रॉम्प्ट ठेवा. पूर्ण झाल्यानंतर तुम्हाला या सारखे आउटपुट दिसेल:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. पोर्टलमध्ये हटविण्याची पुष्टी करा आणि तैनात श्रेणीबाहेरील संसाधने तपासा. किंमत अहवाल आणि कोटा अपडेट्स थोडा वेळ घेऊ शकतात. स्थानिक `.azure` कॉन्फिगरेशन तेंव्हाच काढले जाते जेव्हा तुम्ही स्पष्टपणे ते काढता.

1. `azd down --purge` याव्यतिरिक्त समर्थित सॉफ्ट-डिलीटेड संसाधनांचे कायमस्वरूपी हटविण्याचे विनंती करते. हे फक्त तेव्हाच वापरा जेव्हा पुनर्प्राप्ती आवश्यक नाही आणि तुम्हाला राखण/काढून टाकणे संरक्षण धोरणे समजतात. हे त्वरित कोटा सोडण्याची हमी देत नाही.

1. फक्त स्वच्छता तपासण्यासाठी पुन्हा तैनाती करू नका. नंतर मनापासून केलेली `azd up` उर्वरित स्थानिक इनपुट वापरून संसाधने पुन्हा तयार करू शकते आणि शुल्क पुन्हा लागू होतात. मॉडेल अद्यतनामध्ये सामान्यतः समर्थित प्राविजनिंग बदलांचा वापर होतो, हटविण्याचा नाही.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->