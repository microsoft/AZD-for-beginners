# 6. Демонтаж інфраструктури

!!! tip "НА КІНЕЦЬ ЦЬОГО МОДУЛЮ ВИ ЗМОЖЕТЕ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Додаткові вправи

Перш ніж демонтувати проєкт, приділіть кілька хвилин вільному дослідженню.

!!! info "Спробуйте ці запити для дослідження"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Зняття інфраструктури

1. Демонтаж інфраструктури так само простий, як:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Підтвердіть вибране середовище і перегляньте ресурси для видалення. Це видаляє ресурси Azure і може знищити дані. Залиште запит на підтвердження для цього навчального процесу. Після завершення ви побачите вихідні дані, подібні до:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Перевірте видалення в порталі і перевірте ресурси поза межами області впровадження. Звіти про вартість і оновлення квот можуть затримуватися. Локальна конфігурація `.azure` зберігається, якщо ви явно її не видалите.

1. `azd down --purge` додатково запитує постійне видалення підтримуваних ресурсів з м'яким видаленням. Використовуйте його лише коли відновлення не потрібне і ви розумієте політики збереження/захисту від очищення. Воно не гарантує негайного звільнення квоти.

1. Не переналаштовуйте лише для перевірки очищення. Пізніший цілеспрямований `azd up` може відновити ресурси, використовуючи залишкові локальні вхідні дані, і це знову призведе до нарахування коштів. Оновлення моделей зазвичай використовують підтримувані зміни у провізуванні, а не демонтаж.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->