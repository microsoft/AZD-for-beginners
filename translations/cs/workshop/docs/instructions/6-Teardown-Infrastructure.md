<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-25T02:17:20+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "cs"
}
-->
# 6. Zrušení infrastruktury

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Položka
    - [ ] Položka
    - [ ] Položka

---

## Bonusové cvičení

Než projekt zrušíme, věnujte pár minut otevřenému průzkumu.

!!! danger "NITYA-TODO: Navrhnout několik podnětů k vyzkoušení"

---

## Zrušení infrastruktury

1. Zrušení infrastruktury je tak jednoduché jako:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Příznak `--purge` zajistí, že budou také odstraněny měkce smazané zdroje Cognitive Service, čímž se uvolní kvóty držené těmito zdroji. Po dokončení uvidíte něco takového:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Volitelné) Pokud nyní znovu spustíte `azd up`, všimnete si, že model gpt-4.1 bude nasazen, protože proměnná prostředí byla změněna (a uložena) v místní složce `.azure`.

      Zde jsou nasazení modelu **před**:

      ![Počáteční](../../../../../translated_images/cs/14-deploy-initial.30e4cf1c29b587bc.png)

      A zde jsou **po**:
      ![Nové](../../../../../translated_images/cs/14-deploy-new.f7f3c355a3cf7299.png)

---

