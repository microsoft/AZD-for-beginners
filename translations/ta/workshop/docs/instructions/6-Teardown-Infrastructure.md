# 6. கட்டமைப்பை ஒழிக்கவும்

!!! tip "இந்த செயல்முறை முடிவில் நீங்கள் இதைச் செய்யக் கூடியிருக்கும்"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## கூடுதல் பயிற்சிகள்

நாம் திட்டத்தை ஒழிக்கும்முன், சில நிமிடங்கள் கழித்து திறந்தவெளி ஆராய்ச்சிகளை செய்யவும்.

!!! info "இந்த ஆராய்ச்சி தூண்டுதல்களை முயற்சிக்கவும்"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## கட்டமைப்பை அகற்று

!!! warning "நீங்கள் GA ஹோஸ்ட்-ஏஜென்ட் பயிற்சியையும் முடித்திருந்தால்"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. கட்டமைப்பை அகற்றுவது எளிது:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. தேர்ந்தெடுக்கப்பட்ட சூழலை உறுதி செய்து, அகற்றப பட வேண்டிய வளங்களை மதிப்பாய்வு செய்யவும். இது Azure வளங்களை அகற்றும் மற்றும் தரவு அழிக்கலாம். இந்த பயிற்சிக்கான உறுதிப்படுத்தல் தூண்டுதலை வைத்திருக்கவும். முடிந்தவுடன் தொடர்ந்து இதுபோன்ற வெளியீட்டை காண்பீர்கள்:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. போர்டலில் நீக்கத்தை சரிபார்க்கவும் மற்றும் வெளியீட்டு பரப்புக்கு வெளியில் உள்ள வளங்களை பார்​க்கவும். செலவுக் கணக்கீடு மற்றும் கொள்ளளவு புதுப்பிப்புகள் தாமதமாக இருக்கலாம். உள்ளூர் `.azure` கட்டமைப்பு நீக்கப்படாது, நீங்கள் தெளிவாக அதை நீக்காத வரை.

1. `azd down --purge` கூடுதலாக ஆதரிக்கப்பட்ட மென்மையான அழிக்கப்பட்ட வளங்களை நிரந்தரமாக நீக்குமாறு கோருகிறது. மீட்பு தேவையில்லாதபோது மட்டுமே இதைப் பயன்படுத்தவும் மற்றும் காப்பாற்றல்/அழிப்பு பாதுகாப்பு கொள்கைகளை புரிந்துகொள்ளவும். உடனடி கொள்ளளவு விடுதலை கிடைக்க நம்பிக்கை இல்லை.

1. சுத்தம் செய்யப்பட்டுள்ளது என்பதை உறுதி செய்ய மீண்டும் பராமரிக்க வேண்டாம். பின்னர் நோக்கம் கொண்ட `azd up` மீதமுள்ள உள்ளூர் உள்ளீடுகளை பயன்படுத்தி வளங்களை மீண்டும் உருவாக்கலாம் மற்றும் மீண்டும் செலவுகள் ஆகும். மாடல் புதுப்பிப்புகள் பொதுவாக ஆதரிக்கப்பட்ட பராமரிப்பு மாற்றங்களைப் பயன்படுத்தி செய்யப்படுகின்றன, கட்டமைப்பை ஒழிக்க அல்ல.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->