# 6. Демонтаж інфраструктури

!!! tip "НА КІНЕЦЬ ЦЬОГО МОДУЛЮ ВИ ЗМОЖЕТЕ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Додаткові вправи

Перш ніж демонтувати проєкт, виділіть кілька хвилин на відкрите дослідження.

!!! info "Спробуйте ці запитання для дослідження"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Деінфраструктурування

!!! warning "Якщо ви також виконали вправу з GA хостованим агентом"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Демонтаж інфраструктури настільки ж простий, як:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Підтвердьте вибране середовище та перегляньте ресурси, які підлягають видаленню. Це видаляє ресурси Azure і може знищити дані. Залиште запит на підтвердження для цього навчального сценарію. Після завершення ви побачите приблизно такий вивід:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Перевірте видалення в порталі та перевірте ресурси за межами області розгортання. Звітність за витратами та оновлення лімітів можуть затримуватися. Локальна конфігурація `.azure` залишається, якщо ви явно не видалите її.

1. `azd down --purge` додатково запитує постійне видалення підтримуваних ресурсів у стані soft-delete. Використовуйте його лише, коли відновлення не потрібне і ви розумієте політики збереження/захисту від очищення. Це не гарантує негайного звільнення лімітів.

1. Не виконуйте повторний розгортання лише для перевірки очищення. Пізніший цілеспрямований `azd up` може відтворити ресурси, використовуючи залишкові локальні вхідні дані, і знову спричинить нарахування витрат. Оновлення моделі зазвичай використовують підтримувані зміни провізії, а не демонтаж.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->