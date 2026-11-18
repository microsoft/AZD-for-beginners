# 6. Разглобяване на инфраструктурата

!!! tip "КЪМ КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ ДА"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Бонус упражнения

Преди да разглобим проекта, отделете няколко минути за отворено изследване.

!!! info "Опитайте тези изследователски въпроси"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Премахване на инфраструктурата

!!! warning "Ако също изпълнихте упражнението с GA хостван агент"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Разглобяването на инфраструктурата е толкова лесно, колкото:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Потвърдете избраната среда и прегледайте ресурсите за изтриване. Това премахва ресурси в Azure и може да унищожи данни. Запазете подкана за потвърждение за този учебен работен процес. След приключване ще видите изход, подобен на:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Проверете изтриването в портала и проверете за ресурси извън обхвата на внедряването. Отчитането на разходите и актуализациите на квоти може да изостават. Местната конфигурация `.azure` остава, освен ако изрично не я премахнете.

1. `azd down --purge` допълнително иска трайно изтриване на поддържани софт изтрити ресурси. Използвайте го само когато възстановяването не е необходимо и разбирате политиките за задържане/защита от изтриване. Това не гарантира незабавно освобождаване на квота.

1. Не препускайте с ново внедряване само за да проверите почистването. По-късно целенасочено `azd up` може да възстанови ресурси, използвайки останалите локални входни данни, и отново начислява такси. Актуализациите на модела обикновено използват поддържани промени в провизиране, а не разглобяване.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->