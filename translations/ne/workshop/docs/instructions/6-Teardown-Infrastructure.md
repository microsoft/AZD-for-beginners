# 6. पूर्वाधार हटाउने

!!! tip "यस मोड्युलको अन्त्यसम्म तपाईं सक्षम हुनुहुनेछ"

    - [ ] स्रोत सफाइ र लागत व्यवस्थापनको महत्व बुझ्नु
    - [ ] पूर्वाधार सुरक्षित रूपमा हटाउन `azd down` प्रयोग गर्नुहोस्
    - [ ] आवश्यक परे सफ्ट-डिलिट गरिएको Azure AI सेवाहरू पुन:प्राप्त गर्नुहोस्
    - [ ] **Lab 6:** Azure स्रोतहरू सफा गर्नुहोस् र हटाइयो कि भनी सुनिश्चित गर्नुहोस्

---

## बोनस अभ्यासहरू

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "यी अन्वेषण प्रॉम्प्टहरू प्रयास गर्नुहोस्"

    **GitHub Copilot सँग प्रयोग गर्नुहोस्:**
    
    1. पूछ्नुहोस्: `What other AZD templates could I try for multi-agent scenarios?`
    2. पूछ्नुहोस्: `How can I customize the agent instructions for a healthcare use case?`
    3. पूछ्नुहोस्: `What environment variables control cost optimization?`
    
    **Azure पोर्टल अन्वेषण गर्नुहोस्:**
    
    1. तपाईंको परिनियोजनका लागि Application Insights मेट्रिक्सको समीक्षा गर्नुहोस्
    2. प्रदाय गरिएको स्रोतहरूको लागत विश्लेषण जाँच गर्नुहोस्
    3. Microsoft Foundry पोर्टलको एजेन्ट प्लेग्राउन्ड फेरि एक पटक अन्वेषण गर्नुहोस्

---

## पूर्वाधार हटाउने

1. पूर्वाधार हटाउन यति नै सजिलो छ:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (वैकल्पिक) यदि तपाईं अहिले फेरि `azd up` चलाउनुहुन्छ भने, तपाईंले नोट गर्नु हुनेछ कि gpt-4.1 मोडेल डिप्लोय हुन्छ किनकि वातावरण चर परिवर्तन गरिएको थियो (र स्थानीय `.azure` फोल्डरमा सेभ गरिएको)। 

      Here is the model deployments **पहिले**:

      ![प्रारम्भिक](../../../../../translated_images/ne/14-deploy-initial.30e4cf1c29b587bc.webp)

      र यहाँ यो **पछि**:
      ![नयाँ](../../../../../translated_images/ne/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->