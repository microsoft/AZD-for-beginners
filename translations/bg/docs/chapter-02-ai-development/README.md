# Глава 2: Разработка, ориентирана към AI

**📚 Course**: [AZD за начинаещи](../../README.md) | **⏱️ Duration**: 1-2 часа | **⭐ Complexity**: Средно

---

## Преглед

Тази глава се фокусира върху внедряването на приложения с AI, използвайки Azure Developer CLI и услугите на Microsoft Foundry. От прости AI чат приложения до интелигентни агенти с инструменти.

## Учебни цели

След като завършите тази глава, ще:
- Разгърнете AI приложения, използвайки предварително изградени шаблони AZD
- Разберете интеграцията на Microsoft Foundry с AZD
- Конфигурирате и персонализирате AI агенти с инструменти
- Внедрите RAG (Retrieval-Augmented Generation) приложения

---

## 📚 Уроци

| # | Урок | Описание | Време |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Свържете AZD с услугите на Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Разгръщане на интелигентни агенти с инструменти | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Разгръщане и конфигуриране на AI модели | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Практическо: Направете вашето AI решение готово за AZD | 60 min |

---

## 🚀 Quick Start

```bash
# Опция 1: RAG чат приложение
azd init --template azure-search-openai-demo
azd up

# Опция 2: Агенти с ИИ
azd init --template get-started-with-ai-agents
azd up

# Опция 3: Бързо приложение за чат
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Featured AI Templates

| Template | Описание | Услуги |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG чат с цитирания | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI агент с инструменти | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Основен AI чат | OpenAI + Container Apps |

---

## 💰 Информация за разходите

| Среда | Оценени месечни разходи |
|-------------|----------------------|
| Разработка | $80-150 |
| Подготовка | $150-300 |
| Производство | $300-3,500+ |

**Съвет:** Run `azd down` after testing to avoid charges.

---

## 🔗 Навигация

| Посока | Глава |
|-----------|---------|
| **Предишна** | [Глава 1: Основи](../chapter-01-foundation/README.md) |
| **Следваща** | [Глава 3: Конфигурация](../chapter-03-configuration/README.md) |
| **Прескочи към** | [Глава 8: Патерни за продукция](../chapter-08-production/README.md) |

---

## 📖 Свързани ресурси

- [Отстраняване на проблеми с AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Практики за AI в продукция](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Не носим отговорност за никакви недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->