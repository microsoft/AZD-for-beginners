# 7. Итоги и дальнейшие шаги

!!! tip "ГЛАВНЫЕ ВЫВОДЫ"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Что вы достигли

Поздравляем! В этом воркшопе вы успешно:

| Модуль | Достижение |
|:---|:---|
| **Модуль 1** | Ознакомились с Azure Developer CLI и выбрали шаблон AI |
| **Модуль 2** | Развернули и проверили полное решение AI агентов |
| **Модуль 3** | Разобрали шаблон, чтобы понять его архитектуру |
| **Модуль 4** | Изучили `azure.yaml` конфигурацию и хуки жизненного цикла |
| **Модуль 5** | Настроили шаблон под свой сценарий |
| **Модуль 6** | Безопасно удалили инфраструктуру и управляли ресурсами |

---

## 2. Ключевые освоенные концепции

### Azure Developer CLI (azd)
- `azd init` - Инициализация проектов из шаблонов
- `azd up` - Предоставление и развертывание одной командой
- `azd env` - Управление переменными окружения
- `azd down` - Безопасное уничтожение ресурсов

### Структура шаблона AZD
- `azure.yaml` - Конфигурация и хуки развертывания
- `infra/` - Bicep инфраструктура как код
- `src/` - Исходный код приложения
- `scripts/` - Скрипты автоматизации и настройки

### Возможности Microsoft Foundry
- Сервис AI агентов для интеллектуальных помощников
- Поиск по файлам и Azure AI Search для поиска знаний
- Встроенное трассирование, мониторинг и оценка
- Red teaming для проверки безопасности ИИ

---

## 3. Продолжайте обучение

### Рекомендуемые следующие шаги

| Путь | Ресурс | Время |
|:---|:---|:---|
| **Завершить курс** | [Учебная программа AZD для начинающих](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Самостоятельно |
| **Попробовать другой шаблон** | [Шаблоны Microsoft Foundry](https://ai.azure.com/templates) | 1-2 часа |
| **Углубленное изучение** | [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | По мере необходимости |
| **Сообщество** | [Azure Discord](https://aka.ms/foundry/discord) | Присоединяйтесь сегодня! |

### Рекомендуемые шаблоны для следующего ознакомления

1. **[Начало работы с AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Основной чат с вашими данными
2. **[Демонстрация Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Продвинутые RAG шаблоны
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Корпоративные розничные сценарии

---

## 4. Вызов воркшопа

Готовы проверить свои навыки? Попробуйте эти задания:

| Вызов | Описание | Сложность |
|:---|:---|:---|
| **1. Мультиагентный сценарий** | Развернуть и настроить для другой отрасли (например, здравоохранение, финансы) | ⭐⭐ |
| **2. Пользовательская база знаний** | Добавить собственные данные и создать кастомный поисковый индекс | ⭐⭐⭐ |
| **3. Продакшен развертывание** | Настроить CI/CD с GitHub Actions используя `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Поделитесь отзывом

Ваши отзывы помогают нам улучшать этот воркшоп!

- **GitHub Issues**: [Оставить отзыв](https://github.com/microsoft/azd-for-beginners/issues) - отметить тегом `Workshop`
- **Discord**: Присоединяйтесь к [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - писать в `#get-help`
- **Вклад**: Помогите улучшить воркшоп, отправляя пулл-реквесты!

---

## Спасибо! 🎉

Спасибо за прохождение воркшопа AZD для AI разработчиков. Мы надеемся, что этот опыт дал вам навыки и уверенность для создания и развертывания AI-приложений на Azure.

**Продолжайте создавать, продолжайте учиться и добро пожаловать в сообщество разработчиков Azure AI!**

---

| | |
|:---|:---|
| **📚 Главная курса** | [AZD для начинающих](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Документация** | [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Шаблоны** | [Шаблоны Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Сообщество** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->