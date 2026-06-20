# 6. Премахване на инфраструктурата

!!! tip "КЪМ КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ"

    - [ ] Разберете значението на почистването на ресурси и управление на разходите
    - [ ] Използвайте `azd down`, за да премахнете инфраструктурата безопасно
    - [ ] Възстановете меко изтрити Azure AI услуги при необходимост
    - [ ] **Лаб 6:** Почистете Azure ресурсите и потвърдете премахването

---

## Допълнителни упражнения

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "Опитайте тези предложения за изследване"

    **Експериментирайте с GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Разгледайте Azure портала:**
    
    1. Прегледайте метриките на Application Insights за вашето внедряване
    2. Проверете анализа на разходите за предоставените ресурси
    3. Разгледайте отново тестовата среда за агенти в портала Microsoft Foundry

---

## Премахване на инфраструктурата

1. Премахването на инфраструктурата е толкова лесно, колкото:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (По избор) Ако сега отново изпълните `azd up`, ще забележите, че моделът gpt-4.1 се внедрява, тъй като променливата на средата беше променена (и запазена) в локалната папка `.azure`. 

      Ето внедряванията на модела **преди**:

      ![Преди](../../../../../translated_images/bg/14-deploy-initial.30e4cf1c29b587bc.webp)

      А ето го **след**:
      ![След](../../../../../translated_images/bg/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->