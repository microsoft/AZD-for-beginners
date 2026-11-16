# ६. पूर्वाधारको विघटन

!!! tip "यस मोड्युल समाप्त हुँदा तपाईं सक्षम हुनुहुनेछ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## बोनस अभ्यासहरू

परियोजना विघटन गर्नु अघि, केही मिनेट लिएर केहि खुला-अन्त अन्वेषण गर्नुहोस्।

!!! info "यी अन्वेषण सुत्रहरू प्रयास गर्नुहोस्"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## पूर्वाधार हटाउने

1. पूर्वाधार हटाउनु निम्नानुसार सजिलो छ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. चयन गरिएको वातावरण पुष्टि गर्नुहोस् र मेट्नुपर्ने स्रोतहरू समीक्षा गर्नुहोस्। यसले Azure स्रोतहरू हटाउँछ र डेटा नष्ट हुन सक्छ। यस सिकाइ कार्यप्रवाहको लागि पुष्टिकरण संकेत राख्नुहोस्। पूरै भएपछि निम्न जस्ता आउटपुट देखिनेछ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. पोर्टलमा मेटिएको पुष्टि गर्नुहोस् र परिचालनको क्षेत्रभन्दा बाहिरका स्रोतहरू जाँच गर्नुहोस्। लागत रिपोर्टिङ र कोटा अपडेटमा ढिलाइ हुन सक्छ। स्थानीय `.azure` सेटिङ तबसम्म रहन्छ जबसम्म तपाईं यसलाई स्पष्ट रूपमा हटाउनु हुँदैन।

1. `azd down --purge` ले थप रूपमा समर्थित सफ्ट-डिलिट गरिएको स्रोतहरूको स्थायी मेटाइ माग गर्दछ। यो मात्र प्रयोग गर्नुहोस् जब पुन: प्राप्ति आवश्यक नभएको छ र तपाईंले रिटेन्सन/पर्ज-प्रोटेक्शन नीतिहरू बुझ्नुभएको छ। यसले तत्काल कोटा मुक्ते गराउने सुनिश्चितता दिन्छ भन्ने छैन।

1. सफाइ जाँच गर्न पुन: परिनियोजन गर्नुहोस् भने नरहनुहोस्। पछि इच्छित `azd up` ले बाँकी स्थानीय इनपुटहरू प्रयोग गरी स्रोतहरू पुनः सिर्जना गर्न सक्छ र पुनः शुल्क लाग्छ। मोडेल अपडेटहरू सामान्य रूपमा समर्थित प्रावधान परिवर्तनों प्रयोग गर्छन्, विघटन होइन।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->