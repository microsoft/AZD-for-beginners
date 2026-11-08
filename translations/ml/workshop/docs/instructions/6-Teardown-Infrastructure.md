# 6. പിന്‍വലിക്കല്‍ അടിസ്ഥാനസൗകര്യം

!!! tip "ഈ മോഡ്യൂള്‍ കഴിഞ്ഞപ്പോള്‍ നിങ്ങള്‍ക്ക് കഴിയും"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ബോണസ് അഭ്യാസങ്ങള്‍

പ്രോജക്ട് പിന്‍വലിക്കുന്നതിന് മുമ്പ്, ചില ഓപ്പണ്‍ എന്റഡ് പര്യവേക്ഷണം ചെയ്യാന്‍ കുറച്ച് മിനിറ്റ് എടുത്ത് നോക്കൂ.

!!! info "ഈ പര്യവേക്ഷണ പ്രോംപ്റ്റുകള്‍ പരീക്ഷിക്കുക"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## അവകാശപരിഹാരം അടിസ്ഥാനസൗകര്യങ്ങള്‍

1. അടിസ്ഥാനസൗകര്യം പിന്‍വലിക്കല്‍ വളരെ എളുപ്പമാണ്:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. തിരഞ്ഞെടുക്കപ്പെട്ട പരിസരവും നീക്കം ചെയ്യാനുള്ള സ്രോതസുക്കളും സ്ഥിരീകരിക്കുക. ഇത് Azure സ്രോതസുകള്‍ നീക്കം ചെയ്യുകയും ഡാറ്റ നശിപ്പിക്കാനും ഇടയാക്കുന്നു. ഈ പഠന പ്രവാഹത്തിനായി ദൃഢീകരണ പ്രോംപ്റ്റ് സൂക്ഷിക്കുക. പൂര്‍ത്തിയായതിനുശേഷം നിങ്ങൾക്ക് ഇതുപോലെ ഔട്ട്‌പുട്ട് കാണാം:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. പോര്‍ട്ടലില്‍ നീക്കം സ്ഥിരീകരിക്കുകയും, വിന്യസനത്തിലെ പരിധിക്ക് പുറത്തുള്ള സ്രോതസുകള്‍ പരിശോധിക്കുകയും ചെയ്യുക. ചെലവ് റിപ്പോര്‍ട്ടിങ്ങും ക്വോട്ട അപ്ഡേറ്റുകളും വൈകിപ്പോകാം. പ്രാദേശിക `.azure` ക്രമീകരണം വ്യക്തമാക്കിയില്ലെങ്കിൽ നിലനിർത്തപ്പെടും.

1. `azd down --purge` പിന്തുണയുള്ള സോഫ്റ്റ്-ഡിലീറ്റ് ചെയ്ത സ്രോതസുകളുടെ സ്ഥിരമായ നീക്കം ആവശ്യപ്പെടുന്നു. വീണ്ടെടുക്കൽ ആവശ്യമില്ലാത്തപ്പോൾ മാത്രമേ ഇത് ഉപയോഗിക്കൂ, കൂടാതെ സൂക്ഷിക്കൽ/പഴുപ്പ്പോക്ക രചനാനീതി മനസിലാക്കണം. ഇത് ഉടൻ ക്വോട്ട റിലീസ് ഉറപ്പാക്കുന്നില്ല.

1. ശുചീകരണം പരിശോധിക്കാൻ പിന്‍വലിക്കല്‍ വീണ്ടും വിന്യസിക്കരുത്. പിന്നീട് സൂയോജിതമായി ഉള്ള `azd up` അവശിഷ്ട പ്രാദേശിക ഇൻപുട്ടുകൾ ഉപയോഗിച്ച് സ്രോതസുകൾ പുനഃസൃഷ്ടിക്കും, കൂടെ വീണ്ടും പണം ഈടാക്കും. മോഡല്‍ അപ്ഡേറ്റുകള്‍ സാധാരണയായി പിന്തുണയുള്ള പ്രൊവിഷനിംഗ് മാറ്റങ്ങൾ ഉപയോഗിക്കുന്നു, പിന്‍വലിക്കല്‍ അല്ല.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->