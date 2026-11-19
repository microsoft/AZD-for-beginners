# 6. Kuvunja Miundombinu

!!! tip "MWISHONI WA MODULI HII UTAWEZA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Mazoezi ya Ziada

Kabla ya kuvunja mradi, chukua dakika chache kufanya uchunguzi wa wazi.

!!! info "Jaribu Maoni Haya ya Uchunguzi"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Ondoa Miundombinu

!!! warning "Ikiwa pia umehitimisha zoezi la wakala wa mwenyeji wa GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Kuvunja miundombinu ni rahisi kama:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Thibitisha mazingira yaliyochaguliwa na kagua rasilimali zitakazofutwa. Hii hufuta rasilimali za Azure na inaweza kuharibu data. Hifadhi ombi la uthibitisho kwa mtiririko huu wa mafunzo. Ukimaliza utaona matokeo yanayofanana na:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Thibitisha ufutaji kwenye portal na angalia rasilimali nje ya wigo wa usambazaji. Ripoti za gharama na masasisho ya makato yaweza kuchelewa. Usanidi wa ndani wa `.azure` unabaki ikiwa haujauyafuta waziwazi.

1. `azd down --purge` pia huomba ufutaji wa kudumu wa rasilimali zilizo waziwa kwa upole zinazounga mkono. Tumia tu wakati ukarabati hauhitajiki na unafahamu sera za uhifadhi/uondoshaji. Hii haisaidii kuachilia makato mara moja.

1. Usitoe tena usambazaji ili kuthibitisha usafi. `azd up` itakayofanywa baadaye kwa makusudi inaweza kuunda tena rasilimali kwa kutumia pembejeo za ndani zilizobaki, na huuza malipo tena. Sasisho za mfano kawaida hutumia mabadiliko ya kuandaa yanayoungwa mkono, si kuvunja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->