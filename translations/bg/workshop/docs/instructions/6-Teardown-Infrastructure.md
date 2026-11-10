# 6. Демонтаж на инфраструктурата

!!! tip "КЪМ КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ ДА"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Допълнителни упражнения

Преди да демонтираме проекта, отделете няколко минути за свободно изследване.

!!! info "Изпробвайте тези въпроси за изследване"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Демонтаж на инфраструктурата

1. Демонтажът на инфраструктурата е толкова лесен, колкото:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Потвърдете избраната среда и прегледайте ресурсите за изтриване. Това премахва Azure ресурси и може да унищожи данни. Запазете подкана за потвърждение за този учебен процес. След завършване ще видите изход, подобен на:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Уверете се в изтриването в портала и проверете за ресурси извън обхвата на разгръщането. Отчетите за разходи и актуализациите на квотата могат да изостават. Локалната конфигурация `.azure` остава, освен ако не я премахнете изрично.

1. `azd down --purge` допълнително иска постоянно изтриване на поддържани ресурси с мека изтривка. Използвайте го само когато не е необходима възстановяване и разбирате политиките за задържане/защита от изтриване. Не гарантира незабавно освобождаване на квотата.

1. Не се препоставяйте само за да проверите почистването. По-късно целенасочен `azd up` може да пресъздаде ресурси с помощта на останалите локални входни данни и отново начислява такси. Актуализациите на модела обикновено използват поддържани промени в осигуряването, а не демонтаж.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->