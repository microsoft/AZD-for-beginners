# Глава 2: Разработка с приоритетом ИИ

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## Обзор

This chapter focuses on deploying AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps to intelligent agents with tools.

## Цели обучения

By completing this chapter, you will:
- Deploy AI applications using pre-built AZD templates
- Understand Microsoft Foundry integration with AZD
- Configure and customize AI agents with tools
- Deploy RAG (Retrieval-Augmented Generation) applications

---

## 📚 Уроки

| # | Урок | Описание | Время |
|---|--------|-------------|------|
| 1 | [Интеграция Microsoft Foundry](microsoft-foundry-integration.md) | Подключение AZD к сервисам Foundry | 30 мин |
| 2 | [Руководство по агентам ИИ](agents.md) | Развертывание интеллектуальных агентов с инструментами | 45 мин |
| 3 | [Развертывание моделей ИИ](ai-model-deployment.md) | Развертывание и настройка моделей ИИ | 30 мин |
| 4 | [Практическая лаборатория по ИИ](ai-workshop-lab.md) | Практическая часть: подготовьте решение на базе ИИ для AZD | 60 мин |

---

## 🚀 Быстрый старт

```bash
# Вариант 1: RAG чат-приложение
azd init --template azure-search-openai-demo
azd up

# Вариант 2: агенты ИИ
azd init --template get-started-with-ai-agents
azd up

# Вариант 3: Быстрое чат-приложение
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Избранные шаблоны ИИ

| Шаблон | Описание | Сервисы |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-чат с цитированием | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Агент ИИ с инструментами | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Базовый чат на базе ИИ | OpenAI + Container Apps |

---

## 💰 Оценка стоимости

| Окружение | Оценочная месячная стоимость |
|-------------|----------------------|
| Development | $80-150 |
| Подготовление | $150-300 |
| Производство | $300-3,500+ |

**Совет:** Run `azd down` after testing to avoid charges.

---

## 🔗 Навигация

| Направление | Глава |
|-----------|---------|
| **Предыдущая** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Следующая** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Перейти к** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Связанные ресурсы

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от ответственности:
Этот документ был переведён с помощью сервиса машинного перевода на базе ИИ Co‑op Translator (https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на языке оригинала следует считать авторитетным источником. Для критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неверные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->