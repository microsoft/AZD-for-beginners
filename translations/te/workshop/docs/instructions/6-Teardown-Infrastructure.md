# 6. ఇన్‌ఫ్రాస్ట్రక్చర్ తొలగింపు

!!! tip "ఈ మాడ్యూల్ ముగిసేప్పుడు మీరు ఇది చేయగలుగుతారు"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## బోనస్ వ్యాయామాలు

ప్రాజెక్ట్‌ను తొలగించే ముందు, కొంతసేపు ఓపెన్-ఎండెడ్ అన్వేషణ చేసుకోండి.

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

## ఇన్‌ఫ్రా తొలగింపు

!!! warning "మీరు GA హోస్టెడ్-ఏజెంట్ వ్యాయామాన్ని కూడా పూర్తి చేసుకున్నట్లయితే"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. ఇన్‌ఫ్రాస్ట్రక్చర్ తొలగించడం చాలా సులభం:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ఎంపికచేసిన వాతావరణాన్ని నిర్ధారించండి మరియు తొలగించాల్సిన వనరుల సమీక్ష చేయండి. ఇది Azure వనరులను తొలగిస్తుంది మరియు డేటాను ధ్వంసం చేయవచ్చు. ఈ లెర్నింగ్ వర్క్‌ఫ్లో కోసం నిర్ధారణ ప్రాంప్ట్‌ను ఉంచండి. పూర్తి అయిన తర్వాత మీరు ఈ రకమైన అవుట్‌పుట్‌ను చూడగలరు:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. పోర్టల్‌లో తొలగింపును ధృవీకరించండి మరియు డిప్లాయ్‌మెంట్ పరిధి బయట ఉన్న వనరులను తనిఖీ చేయండి. ఖర్చు నివేదిక మరియు క్వోటా నవీకరణలు ఆలస్యం కావచ్చు. స్థానిక `.azure` కాన్ఫిగరేషన్ మీరు స్పష్టంగా తొలగించకుండా ఉంటే ఉంటుంది.

1. `azd down --purge` అదనంగా మద్దతు పొందిన సాఫ్ట్-డిలీట్ చేసిన వనరుల శాశ్వత తొలగింపును కోరుతుంది. ఇది పునరుద్ధరణ అవసరం లేకపోతే మరియు మీరు రిటెన్షన్/పర్జ్-ప్రొటెక్షన్ విధానాలను అర్థం చేసుకున్నప్పుడు మాత్రమే ఉపయోగించండి. ఇది తక్షణ క్వోటా విడుదలను హామీ ఇవ్వదు.

1. శుభ్రపరిచే పనిని నిర్ధారించడానికి మళ్లీ డిప్లాయ్ చేయవద్దు. తర్వాత ఉద్దేశపూర్వకంగా `azd up` మిగిలిన స్థానిక ఇన్‌పుట్‌లను ఉపయోగించి వనరులను మళ్ళీ సృష్టించవచ్చు, మరియు ఛార్జీలు మళ్ళీ వస్తాయి. మోడల్ అప్‌డేట్ల‌కు సాధారణంగా మద్దతు లభించిన ప్రొవిజనింగ్ మార్పులను ఉపయోగిస్తారు, తొలగింపును కాదు.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->