# 6. Демонтаж инфраструктуры

!!! tip "К КОНЦУ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Дополнительные задания

Перед тем, как демонтировать проект, уделите несколько минут для свободного исследования.

!!! info "Попробуйте эти задания для исследования"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Удаление инфраструктуры

1. Демонтаж инфраструктуры так же прост, как:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Подтвердите выбранную среду и проверьте ресурсы, которые будут удалены. Это удаляет ресурсы Azure и может уничтожить данные. Сохраните запрос подтверждения для этого учебного процесса. После завершения вы увидите вывод, похожий на:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Проверьте удаление в портале и проверьте наличие ресурсов вне области развертывания. Отчеты о расходах и обновления квот могут задерживаться. Локальная конфигурация `.azure` сохраняется, если вы явно не удалите ее.

1. `azd down --purge` дополнительно запрашивает постоянное удаление поддерживаемых ресурсов с мягким удалением. Используйте его только когда восстановление не требуется и вы понимаете политики хранения/защиты от очистки. Это не гарантирует немедленное освобождение квоты.

1. Не делайте повторное развертывание только для проверки очистки. Позднее преднамеренное `azd up` может воссоздать ресурсы, используя оставшиеся локальные данные ввода, что снова вызовет начисление платы. Обновления моделей обычно используют поддерживаемые изменения провижининга, а не демонтаж.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->