# Розділ 2: Розробка з пріоритетом ШІ

**📚 Курс**: [AZD для початківців](../../README.md) | **⏱️ Тривалість**: 1-2 години | **⭐ Рівень складності**: Середній

---

## Огляд

Цей розділ присвячено розгортанню додатків із підтримкою ШІ за допомогою Azure Developer CLI та сервісів Microsoft Foundry. Від простих чат-додатків зі ШІ до інтелектуальних агентів з інструментами.

## Цілі навчання

Після завершення цього розділу ви:
- Розгорнете додатки зі ШІ за допомогою готових шаблонів AZD
- Зрозумієте інтеграцію Microsoft Foundry з AZD
- Налаштуєте та персоналізуєте агентів ШІ з інструментами
- Розгорнете RAG (Retrieval-Augmented Generation) додатки

---

## 📚 Уроки

| # | Урок | Опис | Час |
|---|--------|-------------|------|
| 1 | [Інтеграція Microsoft Foundry](microsoft-foundry-integration.md) | Підключіть AZD до сервісів Foundry | 30 min |
| 2 | [Посібник з агентів ШІ](agents.md) | Розгорнути інтелектуальні агенти з інструментами | 45 min |
| 3 | [Розгортання моделей ШІ](ai-model-deployment.md) | Розгорнути та налаштувати моделі ШІ | 30 min |
| 4 | [Лабораторія: Майстерня ШІ](ai-workshop-lab.md) | Практично: підготуйте своє рішення зі ШІ для AZD | 60 min |

---

## 🚀 Швидкий старт

```bash
# Варіант 1: RAG чат-додаток
azd init --template azure-search-openai-demo
azd up

# Варіант 2: Агенти ШІ
azd init --template get-started-with-ai-agents
azd up

# Варіант 3: Швидкий чат-додаток
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Рекомендовані шаблони для ШІ

| Шаблон | Опис | Сервіси |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-чат з цитуваннями | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Агент ШІ з інструментами | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Простий чат зі ШІ | OpenAI + Container Apps |

---

## 💰 Інформація про вартість

| Середовище | Орієнтовна місячна вартість |
|-------------|----------------------|
| Розробка | $80-150 |
| Проміжне середовище | $150-300 |
| Продуктивне | $300-3,500+ |

**Порада:** Запустіть `azd down` після тестування, щоб уникнути нарахувань.

---

## 🔗 Навігація

| Напрямок | Розділ |
|-----------|---------|
| **Попередній** | [Розділ 1: Основи](../chapter-01-foundation/README.md) |
| **Наступний** | [Розділ 3: Конфігурація](../chapter-03-configuration/README.md) |
| **Перейти до** | [Розділ 8: Патерни для продуктивного середовища](../chapter-08-production/README.md) |

---

## 📖 Пов'язані ресурси

- [Усунення неполадок ШІ](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Практики ШІ для продуктивного середовища](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Відмова від відповідальності:
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зауважте, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендовано звертатися до професійного перекладача. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->