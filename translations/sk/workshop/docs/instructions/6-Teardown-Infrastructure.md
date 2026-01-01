<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-25T02:17:24+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "sk"
}
-->
# 6. Zrušenie infraštruktúry

!!! tip "NA KONCI TOHTO MODULU BUDETE VEDIEŤ"

    - [ ] Položka
    - [ ] Položka
    - [ ] Položka

---

## Bonusové cvičenia

Predtým, než projekt zrušíme, venujte pár minút voľnému skúmaniu.

!!! danger "NITYA-TODO: Navrhnúť niekoľko podnetov na skúšanie"

---

## Deaktivácia infraštruktúry

1. Zrušenie infraštruktúry je také jednoduché ako:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Príznak `--purge` zabezpečuje, že sa odstránia aj soft-deleted zdroje Cognitive Service, čím sa uvoľní kvóta, ktorú tieto zdroje držali. Po dokončení uvidíte niečo takéto:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Voliteľné) Ak teraz znova spustíte `azd up`, všimnete si, že model gpt-4.1 sa nasadí, pretože premenná prostredia bola zmenená (a uložená) v lokálnom priečinku `.azure`.

      Tu sú nasadenia modelu **predtým**:

      ![Initial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc.sk.png)

      A tu sú **potom**:
      ![New](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299.sk.png)

---

