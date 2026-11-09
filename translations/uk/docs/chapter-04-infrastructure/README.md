# Розділ 4: Інфраструктура як Код та Розгортання

**📚 Курс**: [AZD для Початківців](../../README.md) | **⏱️ Тривалість**: 2-3 години читання; додайте додатковий час на вправи з розгортання | **⭐ Складність**: Середній рівень

---

## Огляд

У цьому розділі розглянуто патерни Infrastructure as Code (IaC) з використанням шаблонів Bicep, розгортання ресурсів та стратегії розгортання за допомогою Azure Developer CLI.

> Перевірка команд і конфігурації станом на: `azd 1.37.2` (листопад 2026). Живе розгортання в Azure під час перевірки не виконувалось.

## Цілі навчання

Завершивши цей розділ, ви:
- Зрозумієте структуру та синтаксис шаблонів Bicep
- Забезпечите ресурси Azure за допомогою `azd provision`
- Розгорнете додатки за допомогою `azd deploy`
- Реалізуєте стратегії розгортання blue-green та rolling

---

## 📚 Уроки

| # | Урок | Опис | Час |
|---|--------|-------------|------|
| 1 | [Управління ресурсами](provisioning.md) | Управління ресурсами Azure за допомогою AZD | 45 хв |
| 2 | [Посібник із розгортання](deployment-guide.md) | Стратегії розгортання додатків | 45 хв |
| 3 | [Створення власного шаблону](custom-templates.md) | Створення та публікація багаторазових шаблонів azd | 30 хв |

---

## 🚀 Швидкий старт

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Структура проекту AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Основні команди

| Команда | Опис |
|---------|-------------|
| `azd init` | Ініціалізація проекту |
| `azd provision` | Створення ресурсів Azure |
| `azd deploy` | Розгортання коду додатка |
| `azd up` | Забезпечення + розгортання |
| `azd down` | Видалити всі ресурси |

---

## 🔗 Навігація

| Напрямок | Розділ |
|-----------|---------|
| **Попередній** | [Розділ 3: Конфігурація](../chapter-03-configuration/README.md) |
| **Наступний** | [Розділ 5: Багатоагентні рішення](../chapter-05-multi-agent/README.md) |

---

## 📖 Пов’язані ресурси

- [Перевірки перед розгортанням](../chapter-06-pre-deployment/README.md)
- [Приклади контейнерних додатків](../../examples/container-app/README.md)
- [Приклад бази даних додатка](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->