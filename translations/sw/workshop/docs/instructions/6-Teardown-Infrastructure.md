# 6. Kuondoa Miundombinu

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Kuelewa umuhimu wa kusafisha rasilimali na usimamizi wa gharama
    - [ ] Tumia `azd down` kuondoa miundombinu kwa usalama
    - [ ] Rejesha Azure AI Services zilizofutwa kwa 'soft delete' ikiwa inahitajika
    - [ ] **Lab 6:** Safisha rasilimali za Azure na thibitisha uondoaji

---

## Mazoezi ya Ziada

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "Try These Exploration Prompts"

    **Jaribu GitHub Copilot:**
    
    1. Uliza: `What other AZD templates could I try for multi-agent scenarios?`
    2. Uliza: `How can I customize the agent instructions for a healthcare use case?`
    3. Uliza: `What environment variables control cost optimization?`
    
    **Chunguza Azure Portal:**
    
    1. Kagua metriki za Application Insights za uanzisho wako
    2. Angalia uchambuzi wa gharama kwa rasilimali zilizotolewa
    3. Chunguza tena eneo la majaribio la wakala kwenye Microsoft Foundry portal one more time

---

## Ondoa Miundombinu

1. Kuondoa miundombinu ni rahisi kama:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Bendera `--purge` inahakikisha kuwa pia inafuta rasilimali za Cognitive Service zilizofutwa kwa 'soft delete', na hivyo kuachilia quota inayoshikiliwa na rasilimali hizi. Mara itakapokamilika utaona kitu kama hiki:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Hiari) Ikiwa sasa utaendesha tena `azd up` tena, utaona modeli gpt-4.1 imewekwa kwa sababu variable ya mazingira ilibadilishwa (na kuhifadhiwa) kwenye saraka ya ndani `.azure`. 

      Hapa ni usambazaji wa modeli **kabla**:

      ![Awali](../../../../../translated_images/sw/14-deploy-initial.30e4cf1c29b587bc.webp)

      Na hapa ni **baada**:
      ![Mpya](../../../../../translated_images/sw/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->