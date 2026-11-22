# 6. नीटसंवाद पायाभूत सुविधा  

!!! tip "या विभागाच्या शेवटी तुम्ही हे करू शकता"  

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal
  
---  

## बोनस व्यायाम  

प्रकल्प तुटविण्यापूर्वी, काही मिनिटे खर्च करून खुल्या प्रकारची शोध युक्ती करा.  

!!! info "हे शोध प्रॉम्प्ट वापरून पहा"  

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time
  
---  

## पायाभूत सुविधा अनप्रावधान करा  

!!! warning "जर तुम्ही GA होस्टेड-एजंट व्यायाम पूर्ण केला असल्यास"  

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).
  
1. पायाभूत सुविधा तुटविणे इतकेच सोपे आहे:  
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. निवडलेल्या पर्यावरणाची पुष्टी करा आणि हटविण्यात येणाऱ्या संसाधनांची समीक्षा करा. हे Azure संसाधने काढून टाकते आणि डेटाचा नाश करू शकतात. या शिक्षण कार्यप्रवाहासाठी पुष्टीकरण प्रॉम्प्ट ठेवा. पूर्ण झाल्यावर तुम्हाला खालीलप्रमाणे आउटपुट दिसेल:  
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```
  
1. पोर्टलमध्ये हटविण्याची पडताळणी करा आणि परिनियोजनाच्या क्षेत्राबाहेरच्या संसाधनांची तपासणी करा. खर्च अहवाल आणि कोटा अद्यतने उशीराने होऊ शकतात. स्थानिक `.azure` संरचना तुम्ही स्पष्टपणे काढल्याशिवाय टिकून राहते.  

1. `azd down --purge` अतिरिक्तपणे समर्थित सॉफ्ट-डिलीटेड संसाधनांच्या कायमस्वरूपी हटविण्याची विनंती करते. पुनर्प्राप्ती आवश्यक नसल्यास आणि तुम्हाला राखण/शोध-संकट धोरणे समजत असल्यासच याचा वापर करा. हे तत्काळ कोटा मुक्तीची हमी देत नाही.  

1. फक्त स्वच्छता पडताळण्यासाठी पुन्हा तैनात करू नका. नंतर इराद्यानं केलेली `azd up` उर्वरित स्थानिक इनपुट वापरून संसाधने पुन्हा तयार करू शकते आणि पुन्हा शुल्क आकारते. मॉडेल अद्यतने सामान्यतः समर्थित प्राविजनिंग बदल वापरतात, न कि नीटसंवाद.  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->