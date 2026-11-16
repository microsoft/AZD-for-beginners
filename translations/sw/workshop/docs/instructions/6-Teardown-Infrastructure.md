# 6. Kuvunja Miundombinu

!!! tip "MWISHONI MWA MODULI HII UTAWEZA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Mazoezi ya Ziada

Kabla ya kuvunja mradi, chukua dakika chache kufanya uchunguzi wa wazi.

!!! info "Jaribu Hizi Kauli za Uchunguzi"

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

1. Kuvunja miundombinu ni rahisi kama:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Thibitisha mazingira uliyochagua na hakiki rasilimali zinazotakiwa kufutwa. Hii huondoa rasilimali za Azure na inaweza kuharibu data. Hifadhi onyesho la uthibitisho kwa mtiririko huu wa kujifunza. Ukishamaliza utaona matokeo kama haya:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Thibitisha kufutwa kwenye portal na angalia rasilimali nje ya wigo wa usambazaji. Ripoti za gharama na masasisho ya vikwazo zinaweza kuchelewa. Usanidi wa humu nyumbani wa `.azure` hubaki isipokuwa uondoe kwa wazi.

1. `azd down --purge` pia huomba kufutwa kabisa kwa rasilimali zilizo soft-delete zinazounga mkono. Tumia tu wakati hali ya kupona si muhimu na unaelewa sera za kuhifadhi/kulinda kufutwa. Haili ahidi kuachilia vikwazo mara moja.

1. Usisambazie tena kwa ajili ya kuthibitisha usafi. `azd up` iliyokusudiwa baadaye inaweza kuunda tena rasilimali kwa kutumia pembejeo zilizosalia za humu nyumbani, na husababisha gharama tena. Masasisho ya mfano kawaida hutumia mabadiliko yanayoungwa mkono ya usambazaji, si kuvunja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->