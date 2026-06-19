# Chapter 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

Цей розділ знайомить з основами Azure Developer CLI (azd). Ви дізнаєтесь основні поняття, встановите інструменти та розгорнете свій перший додаток в Azure.

> Підтверджено для `azd 1.25.6` у червні 2026 року.

## Learning Objectives

Завершивши цей розділ, ви зможете:
- Розуміти, що таке Azure Developer CLI і чим він відрізняється від Azure CLI
- Встановити та налаштувати AZD на вашій платформі
- Розгорнути свій перший додаток в Azure за допомогою `azd up`
- Видалити ресурси за допомогою `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Основні концепції, термінологія та структура проєкту | 15 min |
| 2 | [Installation & Setup](installation.md) | Інструкції з установки для кожної платформи | 10 min |
| 3 | [Your First Project](first-project.md) | Практика: розгортання веб-додатку в Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | Додавання azd до наявного проєкту | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Відтворювані середовища azd з dev контейнерами | 15 min |

---

## ✅ Start Here: Validate Your Setup

Перш ніж почати, переконайтесь, що ваш локальний комп’ютер готовий для шаблону Розділу 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Якщо скрипт повідомляє про відсутні інструменти, спочатку виправте це, а потім продовжуйте розділ.

---

## 🚀 Quick Start

```bash
# Перевірте встановлення
azd version

# Аутентифікація для AZD
# За бажанням: az login, якщо ви плануєте запускати команди Azure CLI безпосередньо
azd auth login

# Розгорніть свій перший застосунок
azd init --template todo-nodejs-mongo
azd up

# Очистіть після завершення роботи
azd down --force --purge
```

---

## ✅ Success Criteria

Після завершення цього розділу ви повинні вміти:

```bash
azd version              # Показує встановлену версію
azd init --template todo-nodejs-mongo  # Ініціалізує проект
azd up                   # Розгортає в Azure
azd show                 # Відображає URL запущеного додатку
azd down --force --purge # Очищає ресурси
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Related Resources

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->