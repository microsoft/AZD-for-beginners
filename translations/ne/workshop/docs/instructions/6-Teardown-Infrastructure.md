# 6. पूर्वाधार समाप्त गर्नुहोस्

!!! tip "यस मोड्युलको अन्त्यसम्म तपाई सक्षम हुनुहुनेछ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## बोनस अभ्यासहरू

परियोजना समाप्त गर्नु अघि, केही समय निकालेर केही खुला-अन्त अन्वेषण गर्नुहोस्।

!!! info "यी अन्वेषण संकेतहरू प्रयास गर्नुहोस्"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## पूर्वाधार हटाउनुहोस्

!!! warning "यदि तपाईंले GA होस्टेड-एजेन्ट अभ्यास पनि पूरा गर्नुभएको छ भने"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. पूर्वाधार हटाउनु यति सजिलो छ:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. चयन गरिएको वातावरण पुष्टि गर्नुहोस् र मेटाइने स्रोतहरू समीक्षा गर्नुहोस्। यसले Azure स्रोतहरू हटाउँछ र डेटा नष्ट गर्न सक्छ। यो सिकाइ कार्यप्रवाहका लागि पुष्टि संकेतलाई राख्नुहोस्। पूरा भएपछि तपाईंलाई यस प्रकारको आउटपुट देखिनेछ:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. पोर्टलमा मेटिएको कुरा पुष्टि गर्नुहोस् र डिप्लोयमेन्टको दायराबाहिर स्रोतहरूको लागि जाँच गर्नुहोस्। लागत रिपोर्टिङ र कोटा अपडेटहरू ढिलो हुन सक्छन्। स्थानीय `.azure` कन्फिगरेसन तबसम्म रहन्छ जबसम्म तपाईं यसलाई स्पष्ट रूपमा हटाउनु हुँदैन।

1. `azd down --purge` ले थप रूपमा समर्थित सफ्ट-डिलिटेड स्रोतहरूको स्थायी मेटाइको अनुरोध गर्दछ। यो केवल तब प्रयोग गर्नुहोस् जब पुनर्प्राप्ति आवश्यक नहोस र तपाईंले अवधारण/परिष्कृत संरक्षण नीतिहरू बुझ्नुहुन्छ। यसले तुरुन्तै कोटा रिलीज सुनिश्चित गर्दैन।

1. केवल सफाई पुष्टि गर्न पुन:डिप्लोय नगर्नुहोस्। पछि जानाजानी गरिएको `azd up` ले बाँकी स्थानीय इनपुटहरू प्रयोग गरी स्रोतहरू पुन: सिर्जना गर्न सक्छ र पुन: शुल्क लाग्छ। मोडेल अपडेटहरू सामान्यतया समर्थित प्रोभिजनिङ परिवर्तनहरू प्रयोग गर्छन्, पूर्वाधार समाप्त गर्ने होइन।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->