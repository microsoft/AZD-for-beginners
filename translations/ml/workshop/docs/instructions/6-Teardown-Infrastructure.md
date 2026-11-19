# 6. ഇൻഫ്രാസ്ട്രക്ചർ തകര്‍ത്തൊഴിയല്‍

!!! tip "ഈ മോഡ്യൂള്‍ പൂര്‍ത്തിയാക്കുമ്പോള്‍ നിങ്ങള്‍ക്ക് ഇതു ചെയ്യാന്‍ സാധിക്കും"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ബോണസ് വ്യായാമങ്ങള്‍

പ്രോജക്ട് തകര്‍ത്തൊഴിയുന്നതിന് മുമ്പ്, കുറച്ച് മിനിറ്റുകള്‍ എടുത്ത് ചില എങ്ങനെ-ചെയ്യാമെന്നു നോക്കല്‍ പരീക്ഷണങ്ങള്‍ നടത്തുക.

!!! info "ഈ പരീക്ഷണ പ്രേരണകള്‍ പരീക്ഷിക്കൂ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## ഇൻഫ്രാ ഡപ്രൊവൈഷൻ ചെയ്യുക

!!! warning "നിങ്ങള്‍ GA ഹോസ്റ്റഡ്-ഏജന്റ് വ്യായാമവും പൂര്‍ത്തിയാക്കിയെങ്കില്‍"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. ഇൻഫ്രാസ്ട്രക്ചർ തകര്‍ത്തൊഴിയുന്നത് എളുപ്പമാണ്:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. തിരഞ്ഞെടുക്കപ്പെട്ട പരിസ്ഥിതിയെ സ്ഥിരീകരിക്കുകയും മായ്ക്കേണ്ട റിസോഴ്സുകള്‍ അവലോകനം ചെയ്യുകയും ചെയ്യുക. ഇത് Azure റിസോഴ്സുകള്‍ നീക്കംചെയ്യുന്നു, ഡാറ്റയും നശിക്കാവുന്നതാണ്. ഈ പഠന പ്രവൃത്തി പക്ഷത്തിനായി സ്ഥിരീകരണ പ്രേരണ നിലനിർത്തുക. പൂർത്തീകരിച്ച ശേഷം ഇതുപോലൊരു ഔട്ട്പുട്ട് കാണാം:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. പോര്‍ട്ടലില്‍ നീക്കം ചെയ്യലാണ് സ്ഥിരീകരിക്കുക, ഡെപ്ലോയ്‌മെന്റിന്റെ പരിധിക്കടന്ന റിസോഴ്‌സുകള്‍ പരിശോധിക്കുക. ചെലവ് റിപ്പോര്‍ട്ടിംഗും ക്വോട്ട പുതുക്കലും വൈകാന്‍ സാധ്യതയുണ്ട്. ലോഗല്‍ `.azure` ക്രമീകരണം ഭേദപ്പെട്ടില്ലാതെ തുടരും, നിങ്ങള്‍ വ്യക്തമാക്കിയില്ലെങ്കില്‍.

1. `azd down --purge` പിന്തുണയുള്ള സോഫ്റ്റ്-ഡിലീറ്റ് ചെയ്ത റിസോഴ്സുകളുടെ സ്ഥിരമായ മായ്ച്ചുപോവല്‍ അഭ്യര്‍ത്ഥിക്കുന്നു. പുനരുദ്ധാരണം ആവശ്യമില്ലെന്നും റിട്ടന്‍ഷന്‍/പര്‍ജ്-പ്രൊട്ടക്ഷന്‍ നയങ്ങള്‍ മനസ്സിലാക്കിയിട്ടുണ്ട് മാത്രമേ ഇത് ഉപയോഗിക്കാവൂ. ഇത് തല്‍ക്കാലികം ക്വോട്ട റിലീസ് ഉറപ്പാക്കുന്നില്ല.

1. ക്ലീന്‍അപ്പ് സ്ഥിരീകരിക്കാന്‍ മാത്രമേ വീണ്ടും ഡെപ്ലോയ് ചെയ്യണ്ടവതല്ല. പിന്നീട് ഉദ്ദേശപൂര്‍വ്വം `azd up` ഉപയോഗിച്ച് ശേഷിച്ച ലോഗല്‍ ഇന്‍പുട്ട് ഉപയോഗിച്ച് റിസോഴ്സുകള്‍ പുനഃസൃഷ്ടിക്കാം, ഇത് വീണ്ടും ചെലവുകള്‍ ഉണ്ടാക്കും. മോഡല്‍ അപ്ഡേറ്റുകള്‍ സാധാരണയായി പിന്തുണയുള്ള പ്രൊവിഷനിംഗ് മാറ്റങ്ങള്‍ ഉപയോഗിക്കുന്നു, തകര്‍ത്തൊഴിയല്‍ അല്ല.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->