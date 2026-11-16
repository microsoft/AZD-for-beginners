# 6. ముట్టడిని చేర్చడం

!!! tip "ఈ మాడ్యూల్ చివరికి మీరు చేయగలగడం"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## బోనస్ వ్యాయామాలు

ప్రాజెక్టును మూసివేయడానికి ముందు, కొద్ది నిమిషాలు తీసుకుని స్వేచ్ఛగా అన్వేషణ చేయండి.

!!! info "ఈ అన్వేషణ సూచనలను ప్రయత్నించండి"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ఇన్‌ఫ్రా ఉపసంహరణ

1. ముట్టడిని చేర్చడం ఈ క్రింది విధంగా సులభం:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ఎంచుకున్న వాతావరణాన్ని ధృవీకరించి తొలగించబోయే వనరులను సమీక్షించండి. ఇది ఆజ్యూర్ వనరులను తొలగిస్తుంది మరియు డేటాను నాశనం చేయవచ్చు. ఈ నేర్చుకునే పనిముట్టు కోసం ధృవీకరణ ప్రాంప్ట్ ఉంచండి. పూర్తయ్యాక మీరు క్రింది వంటి అవుట్పుట్ చూడవచ్చు:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. పోర్టల్ లో తొలగింపు ని ధృవీకరించి, డిప్లాయ్‌మెంట్ విస్తృతిని మించిపోయే వనరులు ఉన్నాయా అని చూడండి. ఖర్చు నివేదిక మరియు కోటా నవీకరణలు ఆలస్యం కావచ్చు. స్థానిక `.azure` ఏర్పాటు ఇంకా ఉంటుంది మీరు స్పష్టంగా తొలగించకపోతే.

1. `azd down --purge` మద్దతు పొందిన సాఫ్ట్-తొలగింపు వనరుల శాశ్వత తొలగింపును కూడా অনుసరోతుంది. రికవరీ అవసరం లేని సందర్భంలో మరియు నిల్వ/పరిశుభ్రత రక్షణ విధానాలను మీరు అర్థమయ్యే సమయములో దీనిని ఉపయోగించండి. దీని వల్ల తక్షణ కోటా విడుదలకు హామీ లేదు.

1. పరిశుభ్రత నిర్ధారించుకోవడానికి మరలా డిప్లాయ్ చేయకండి. తరువాత ఉద్దేశించిన `azd up` మిగిలిన స్థానిక ఇన్‌పుట్లను ఉపయోగించి వనరులను పునః సృష్టించవచ్చు, ఇది మళ్ళీ ఖర్చులు వస్తాయి. మోడల్ నవీకరణలు సాధారణంగా మద్దతు పొందిన ప్రొవిజనింగ్ మార్పులను ఉపయోగిస్తాయి, ముట్టడిని కాదు.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->