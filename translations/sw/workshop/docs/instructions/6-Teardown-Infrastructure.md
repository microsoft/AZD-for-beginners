<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-25T02:17:11+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "sw"
}
-->
# 6. Kuvunja Miundombinu

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Kipengele
    - [ ] Kipengele
    - [ ] Kipengele

---

## Mazoezi ya Ziada

Kabla ya kuvunja mradi, tumia dakika chache kufanya uchunguzi wa wazi.

!!! danger "NITYA-TODO: Eleza baadhi ya maoni ya kujaribu"

---

## Kuondoa Miundombinu

1. Kuvunja miundombinu ni rahisi kama:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Bendera ya `--purge` inahakikisha kuwa pia inafuta rasilimali za Huduma ya Akili zilizofutwa kwa muda, hivyo kuachilia mgao uliozuiliwa na rasilimali hizi. Ukimaliza utaona kitu kama hiki:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Hiari) Ikiwa sasa utaendesha `azd up` tena, utagundua kuwa modeli ya gpt-4.1 inatolewa kwa kuwa mabadiliko ya mazingira yamebadilishwa (na kuhifadhiwa) katika folda ya ndani ya `.azure`.

      Hapa kuna utoaji wa modeli **kabla**:

      ![Awali](../../../../../translated_images/sw/14-deploy-initial.30e4cf1c29b587bc.png)

      Na hapa iko **baada**:
      ![Mpya](../../../../../translated_images/sw/14-deploy-new.f7f3c355a3cf7299.png)

---

