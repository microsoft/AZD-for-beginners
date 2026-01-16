<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-25T02:17:58+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "uk"
}
-->
# 6. Знищення інфраструктури

!!! tip "ПІСЛЯ ЗАВЕРШЕННЯ ЦЬОГО МОДУЛЯ ВИ ЗМОЖЕТЕ"

    - [ ] Пункт
    - [ ] Пункт
    - [ ] Пункт

---

## Додаткові вправи

Перед тим як знищити проєкт, приділіть кілька хвилин для відкритого дослідження.

!!! danger "NITYA-TODO: Сформулювати кілька запитань для спроб"

---

## Депровізування інфраструктури

1. Знищення інфраструктури таке ж просте, як:

      ```bash title="" linenums="0"
      azd down --purge
      ```

1. Прапорець `--purge` гарантує, що також будуть видалені м'яко видалені ресурси Cognitive Service, тим самим звільняючи квоту, яку займали ці ресурси. Після завершення ви побачите щось подібне:

      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Необов’язково) Якщо ви зараз запустите `azd up` знову, ви помітите, що модель gpt-4.1 буде розгорнута, оскільки змінна середовища була змінена (і збережена) у локальній папці `.azure`.

      Ось розгортання моделі **до**:

      ![Initial](../../../../../translated_images/uk/14-deploy-initial.30e4cf1c29b587bc.png)

      А ось **після**:
      ![New](../../../../../translated_images/uk/14-deploy-new.f7f3c355a3cf7299.png)

---

