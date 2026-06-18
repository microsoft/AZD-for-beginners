# 6. इन्फ्रास्ट्रक्चर हटाना

!!! tip "इस मॉड्यूल के अंत तक आप सक्षम होंगे"

    - [ ] संसाधन क्लीनअप और लागत प्रबंधन के महत्व को समझें
    - [ ] इन्फ्रास्ट्रक्चर को सुरक्षित रूप से अनप्रोविजन करने के लिए `azd down` का उपयोग करें
    - [ ] आवश्यक होने पर सॉफ़्ट-डिलीटेड Azure AI Services को पुनर्प्राप्त करें
    - [ ] **Lab 6:** Azure संसाधनों को साफ़ करें और हटाने की पुष्टि करें

---

## बोनस अभ्यास

प्रोजेक्ट हटाने से पहले, कुछ समय लें और खुले तौर पर अन्वेषण करें।

!!! info "इन अन्वेषण प्रॉम्प्ट्स को आज़माएँ"

    **GitHub Copilot के साथ प्रयोग करें:**
    
    1. पूछें: `What other AZD templates could I try for multi-agent scenarios?`
    2. पूछें: `How can I customize the agent instructions for a healthcare use case?`
    3. पूछें: `What environment variables control cost optimization?`
    
    **Azure पोर्टल का अन्वेषण करें:**
    
    1. अपने डिप्लॉयमेंट के लिए Application Insights मैट्रिक्स की समीक्षा करें
    2. प्रोविज़न किए गए संसाधनों के लिए लागत विश्लेषण जांचें
    3. Microsoft Foundry पोर्टल के एजेंट प्लेग्राउंड को एक बार फिर एक्सप्लोर करें

---

## इन्फ्रास्ट्रक्चर अनप्रोविजन

1. इन्फ्रास्ट्रक्चर हटाना इतना आसान है:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge` फ़्लैग सुनिश्चित करता है कि यह सॉफ़्ट-डिलीट किए गए Cognitive Service संसाधनों को भी क्लीन कर देता है, इस प्रकार इन संसाधनों द्वारा होल्ड की गई कोटा को मुक्त करता है। पूर्ण होने पर आप कुछ ऐसा देखेंगे:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (वैकल्पिक) यदि आप अब फिर से `azd up` चलाते हैं, तो आप देखेंगे कि gpt-4.1 मॉडल तैनात हो जाता है क्योंकि environment variable स्थानीय `.azure` फ़ोल्डर में बदल दिया गया था (और सहेजा गया)। 

      Here is the model deployments **before**:

      ![प्रारम्भिक](../../../../../translated_images/hi/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![नया](../../../../../translated_images/hi/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->