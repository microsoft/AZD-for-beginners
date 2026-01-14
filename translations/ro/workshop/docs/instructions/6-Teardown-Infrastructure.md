<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-25T02:17:29+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "ro"
}
-->
# 6. Dezactivarea Infrastructurii

!!! tip "PÂNĂ LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Element
    - [ ] Element
    - [ ] Element

---

## Exerciții Bonus

Înainte de a dezactiva proiectul, ia câteva minute pentru a face o explorare deschisă.

!!! danger "NITYA-TODO: Conturează câteva sugestii de încercat"

---

## Dezactivarea Infrastructurii

1. Dezactivarea infrastructurii este la fel de simplă ca:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flag-ul `--purge` asigură că sunt eliminate și resursele Cognitive Service șterse temporar, eliberând astfel cota ocupată de aceste resurse. După finalizare, vei vedea ceva asemănător cu:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opțional) Dacă rulezi din nou `azd up`, vei observa că modelul gpt-4.1 este implementat, deoarece variabila de mediu a fost modificată (și salvată) în folderul local `.azure`.

      Iată implementările modelului **înainte**:

      ![Inițial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc.ro.png)

      Și iată-le **după**:
      ![Nou](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299.ro.png)

---

