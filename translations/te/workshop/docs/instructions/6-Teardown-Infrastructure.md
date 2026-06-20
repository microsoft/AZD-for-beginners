# 6. ఇన్ఫ్రాస్ట్రక్చర్ తొలగింపు

!!! tip "ఈ మాడ్యూల్ ముగిసినప్పుడు మీరు వీటిని చేయగలుగుతారు"

    - [ ] వనరుల శుభ్రపరచడం మరియు ఖర్చుల నిర్వహణ యొక్క ప్రాధాన్యతను అర్థం చేసుకోండి
    - [ ] `azd down` ను ఉపయోగించి ఇన్ఫ్రాస్ట్రక్చర్ ను సురక్షితంగా తొలగించండి
    - [ ] అవసరమైతే సాఫ్ట్-డిలీట్ అయిన Azure AI Services ను పునరుద్ధరించండి
    - [ ] **ల్యాబ్ 6:** Azure వనరులను శుభ్రపరచి తొలగింపు నిర్ధారించండి

---

## బోనస్ వ్యాయామాలు

ప్రాజెక్ట్‌ను తొలగించే ముందు, కొన్ని నిమిషాలు స్వేచ్ఛాయుత అన్వేషణ కోసం వెచ్చించండి.

!!! info "ఈ అన్వేషణ ప్రాంప్ట్స్ ని ప్రయత్నించండి"

    **GitHub Copilot తో ప్రయోగించండి:**
    
    1. అడగండి: `What other AZD templates could I try for multi-agent scenarios?`
    2. అడగండి: `How can I customize the agent instructions for a healthcare use case?`
    3. అడగండి: `What environment variables control cost optimization?`
    
    **Azure Portal ను అన్వేషించండి:**
    
    1. మీ డిప్లాయ్‌మెంట్‌కు సంబంధించిన Application Insights మెట్రిక్స్‌ను పరిశీలించండి
    2. ప్రొవైజన్ చేసిన వనరుల ఖర్చుల విశ్లేషణను తనిఖీ చేయండి
    3. Microsoft Foundry పోర్టల్‌లోని ఏజెంట్ ప్లేగ్రౌండ్‌ను మరోసారి అన్వేషించండి

---

## ఇన్ఫ్రాస్ట్రక్చర్ తొలగింపు

1. ఇన్ఫ్రాస్ట్రక్చర్‌ను తీసివేయడం ఇలా సులభం:
      
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

1. (ఐచ్చిక) ఇప్పుడు మీరు మరోసారి `azd up` ను అమలు చేస్తే, స్థానిక `.azure` ఫోల్డర్‌లో వాతావరణ చరి(ఎన్విరాన్‌మెంట్ వేరియబుల్) మారినందున (మరియు సేవ్ అయినందున) gpt-4.1 మోడల్ డిప్లాయ్ అవుతున్నట్లు మీరు గమనిస్తారు. 

      ఇది మోడల్ డిప్లాయ్‌మెంట్లు **ముందు**:

      ![ఆరంభం](../../../../../translated_images/te/14-deploy-initial.30e4cf1c29b587bc.webp)

      మరియు ఇది **తర్వాత**:
      ![కొత్త](../../../../../translated_images/te/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->