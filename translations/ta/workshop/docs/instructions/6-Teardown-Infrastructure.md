# 6. கட்டமைப்பை உடைத்து அகற்றுதல்

!!! tip "இந்த ஒருங்கிணைப்பின் முடிவில் நீங்கள் செய்வதற்கு முடியும்"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## கூடுதல் பயிற்சிகள்

திட்டத்தை உடைத்து அகற்றுவதற்கு முன், சில நிமிடங்கள் திறந்தவெளி ஆராய்ச்சிக்காக ஒதுக்கவும்.

!!! info "இந்த ஆராய்ச்சிப் பெறுமதிகளை முயற்சிக்கவும்"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## இன்ஃப்ரா அகற்றுதல்

1. கட்டமைப்பை உடைத்து அகற்றுவது எளிதாக:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. தேர்வு செய்யப்பட்ட சூழலை உறுதி செய்து, அழிக்கப்பட உள்ள வளங்களை ஆய்வு செய்யவும். இது அசுரர் வளங்களை அகற்றுகிறது மற்றும் தரவை அழித்துவிடக்கூடும். இந்த கற்றல் வேலைப்பாடுக்கு உறுதிப்படுத்தும் வினாவை வைத்திருங்கள். முடிந்தவுடன் இப்படிப் போன்ற வெளியீட்டை பார்வையிடுவீர்கள்:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. போர்டலில் அழைப்பை உறுதி செய்யவும் மற்றும் கொண்டு வரல் பயல்தளத்தின் வெளிப்புற வளங்களை ஆய்வு செய்யவும். செலவு அறிக்கை மற்றும் பகுதி புதுப்பிப்புகள் தாமதமாக இருக்கலாம். உள்ளூர் `.azure` கட்டமைப்பு நிறுவனத்தை குறிப்படாமல் நீக்காதவரை மாறாது.

1. `azd down --purge` கூடுதலாக ஆதரிக்கப்படும் மென்மையான அழிக்கப்பட்ட வளங்களின் நிலையான அழிப்பையும் கோருகிறது. மீட்பு தேவையில்லை என்றால் மற்றும் தக்கவைப்பு/பிரதி-பரிசோதனை கொள்கைகளை நீங்கள் புரிந்திருந்தால் மட்டுமே இதைப் பயன்படுத்தவும். இது உடனடி பகுதி விடுதலை உறுதிப்படுத்தாது.

1. சுத்திகரிப்பு சரிபார்ப்பதற்காக மீண்டும் நிறுவ வேண்டாம். பின்னர் குறிப்பு செய்யப்பட்ட `azd up` உள்ளூர் உள்ளீடுகளைக் கொண்டு வளங்களை மீண்டும் உருவாக்கும், மேலும் மீண்டும் கட்டணம் விதிக்கும். மாதிரிப் புதுப்பிப்புகள் சாதாரணமாக ஆதரவைக்கப்பட்ட வழங்கல் மாற்றங்களைப் பயன்படுத்தும், உடைத்தல் அல்ல.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->