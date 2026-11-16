# 7. Обобщение и следващи стъпки

!!! tip "ГЛАВНИТЕ ИЗВОДИ СА"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Какво Постигнахте

Поздравления! В този уъркшоп успешно:

| Модул | Постигнато |
|:---|:---|
| **Модул 1** | Открихте Azure Developer CLI и избрахте AI шаблон |
| **Модул 2** | Разположихте и валидирахте цялостно AI агенти решение |
| **Модул 3** | Разглобихте шаблона, за да разберете архитектурата му |
| **Модул 4** | Изследвахте `azure.yaml` конфигурация и hooks за жизнения цикъл |
| **Модул 5** | Персонализирахте шаблона за собствен сценарий |
| **Модул 6** | Безопасно демонтирахте инфраструктурата и управлявахте ресурсите |

---

## 2. Основни усвоени концепции

### Azure Developer CLI (azd)
- `azd init` - Инициализиране на проекти от шаблони
- `azd up` - Осигуряване и разполагане с една команда
- `azd env` - Управление на променливи на средата
- `azd down` - Безопасно почистване на ресурси

### Структура на AZD шаблон
- `azure.yaml` - Конфигурация и hooks за разполагане
- `infra/` - Bicep инфраструктура като код
- `src/` - Изходен код на приложението
- `scripts/` - Скриптове за автоматизация и настройка

### Възможности на Microsoft Foundry
- AI агенти услуга за интелигентни асистенти
- Търсене в файлове и Azure AI Search за извличане на знания
- Вградена трасировка, мониторинг и оценка
- Red teaming за валидиране на безопасността на AI

---

## 3. Продължете обучението си

### Препоръчани следващи стъпки

| Път | Ресурс | Време |
|:---|:---|:---|
| **Завършете курса** | [AZD за начинаещи учебна програма](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Самостоятелно |
| **Опитайте друг шаблон** | [Microsoft Foundry шаблони](https://ai.azure.com/templates) | 1-2 часа |
| **Вникване в детайли** | [Документация за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Постоянно |
| **Общество** | [Azure Discord](https://aka.ms/foundry/discord) | Присъединете се днес! |

### Препоръчани шаблони за следващ опит

1. **[Започнете с AI чат](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Основен чат с вашите данни
2. **[Azure Search OpenAI демонстрация](https://github.com/Azure-Samples/azure-search-openai-demo)** - Разширени RAG модели
3. **[Contoso чат](https://github.com/Azure-Samples/contoso-chat)** - Корпоративни търговски сценарии

---

## 4. Предизвикателство от уъркшопа

Готови ли сте да изпробвате уменията си? Опитайте тези предизвикателства:

| Предизвикателство | Описание | Трудност |
|:---|:---|:---|
| **1. Мултиагентен сценарий** | Разположете и персонализирайте за различна индустрия (напр. здравеопазване, финанси) | ⭐⭐ |
| **2. Персонализирана база знания** | Добавете собствени файлове и създайте персонализиран индекс за търсене | ⭐⭐⭐ |
| **3. Производствено разполагане** | Настройте CI/CD с GitHub Actions, използвайки `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Споделете обратна връзка

Вашата обратна връзка ни помага да подобрим този уъркшоп!

- **GitHub Issues**: [Публикувайте обратна връзка](https://github.com/microsoft/azd-for-beginners/issues) - маркирайте с `Workshop`
- **Discord**: Присъединете се към [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - публикувайте в `#get-help`
- **Приноси**: Помогнете да подобрим уъркшопа чрез подаване на pull requests!

---

## Благодарим Ви! 🎉

Благодарим Ви, че завършихте уъркшопа AZD за AI разработчици. Надяваме се този опит да Ви е дал умения и увереност да изграждате и разполагате AI приложения в Azure.

**Продължавайте да изграждате, продължавайте да учите и добре дошли в общността на Azure AI разработчиците!**

---

| | |
|:---|:---|
| **📚 Начална страница на курса** | [AZD за начинаещи](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Документация** | [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Шаблони** | [Microsoft Foundry шаблони](https://ai.azure.com/templates) |
| **💬 Общество** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->