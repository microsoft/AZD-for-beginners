# 6. இன்ஃப்ராஸ்ட்ரக்சரை அகற்றுதல்

!!! tip "இந்த மொடியூல்லின் முடிவில் நீங்கள் செய்யக்கூடியவை"

    - [ ] வளங்களை சுத்தம் செய்வது மற்றும் செலவுக் கட்டுப்பாட்டின் முக்கியத்துவத்தைப் புரிந்துகொள்ளுதல்
    - [ ] `azd down` பயன்படுத்தி இன்ஃப்ராஸ்ட்ரக்சரை பாதுகாப்பாக நீக்குதல்
    - [ ] தேவையானால் மென்மையாக நீக்கப்பட்ட Azure AI சேவைகளை மீட்டெடுத்தல்
    - [ ] **Lab 6:** Azure வளங்களை சுத்தம் செய்து அகற்றப்பட்டதைக் உறுதிப்படுத்துதல்

---

## கூடுதல் பயிற்சிகள்

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "இந்த ஆராய்ச்சி முன்னுரைகளை முயற்சி செய்யுங்கள்"

    **GitHub Copilot உடன் பரிசோதனை செய்யுங்கள்:**
    
    1. கேளுங்கள்: `What other AZD templates could I try for multi-agent scenarios?`
    2. கேளுங்கள்: `How can I customize the agent instructions for a healthcare use case?`
    3. கேளுங்கள்: `What environment variables control cost optimization?`
    
    **Azure போர்டலை ஆராயுங்கள்:**
    
    1. உங்கள் டெப்ளாய்மெண்டுக்கான Application Insights அளவுகோல்களை பரிசீலனை செய்யுங்கள்
    2. ஒதுக்கிய வளங்களுக்கான செலவு பகுப்பாய்வை பார்க்கவும்
    3. Microsoft Foundry போர்டல் ஏஜென்ட் பிளேக்ரவுண்டை மீண்டும் ஒருமுறை ஆராயுங்கள்

---

## இன்ஃப்ரா அகற்றுதல்

1. இன்ஃப்ராஸ்ட்ரக்சரை அகற்றுவது இவ்வாறு எளிது:
      
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

1. (Optional) If you now run `azd up` again, you will notice the gpt-4.1 model gets deployed since the environment variable was changed (and saved) in the local `.azure` folder. 

      Here is the model deployments **before**:

      ![தொடக்கம்](../../../../../translated_images/ta/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![புதியது](../../../../../translated_images/ta/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->