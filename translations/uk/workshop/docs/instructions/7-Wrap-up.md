# 7. Підсумки та наступні кроки

!!! tip "ОСНОВНІ ВИСНОВКИ Є"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Що ви досягли

Вітаємо! У цьому воркшопі ви успішно:

| Модуль | Досягнення |
|:---|:---|
| **Модуль 1** | Ознайомились із Azure Developer CLI та обрали AI шаблон |
| **Модуль 2** | Розгорнули та перевірили повне рішення AI агентів |
| **Модуль 3** | Розібрали шаблон, щоб зрозуміти його архітектуру |
| **Модуль 4** | Вивчили конфігурацію `azure.yaml` та цикли життєвого циклу |
| **Модуль 5** | Налаштували шаблон для вашого власного сценарію |
| **Модуль 6** | Безпечно демонтували інфраструктуру та керували ресурсами |

---

## 2. Основні освоєні концепції

### Azure Developer CLI (azd)
- `azd init` - Ініціалізація проектів із шаблонів
- `azd up` - Постачання та розгортання однією командою
- `azd env` - Керування змінними середовища
- `azd down` - Безпечне очищення ресурсів

### Структура шаблону AZD
- `azure.yaml` - Конфігурація та гачки розгортання
- `infra/` - Інфраструктура як код на Bicep
- `src/` - Початковий код додатка
- `scripts/` - Сценарії автоматизації та налаштування

### Можливості Microsoft Foundry
- Сервіс AI Agent для інтелектуальних помічників
- Пошук файлів та Azure AI Search для отримання знань
- Вбудоване трасування, моніторинг та оцінювання
- Red teaming для перевірки безпеки AI

---

## 3. Продовжуйте своє навчання

### Рекомендовані наступні кроки

| Шлях | Ресурс | Час |
|:---|:---|:---|
| **Завершити курс** | [Навчальна програма AZD для початківців](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Самостійно |
| **Спробувати інший шаблон** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 години |
| **Поглиблене вивчення** | [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Постійно |
| **Спільнота** | [Azure Discord](https://aka.ms/foundry/discord) | Приєднуйтесь сьогодні! |

### Запропоновані шаблони для наступних спроб

1. **[Почніть з AI чату](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Базовий чат з вашими даними
2. **[Демонстрація Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Розширені шаблони RAG
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Корпоративні сценарії роздрібної торгівлі

---

## 4. Виклик воркшопу

Готові перевірити свої навички? Спробуйте ці виклики:

| Виклик | Опис | Рівень складності |
|:---|:---|:---|
| **1. Сценарій багатьох агентів** | Розгорніть і налаштуйте для іншої галузі (наприклад, охорона здоров’я, фінанси) | ⭐⭐ |
| **2. Власна база знань** | Додайте свої файли даних та створіть індекс пошуку | ⭐⭐⭐ |
| **3. Продуктивне розгортання** | Налаштуйте CI/CD за допомогою GitHub Actions з `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Поділіться своїм відгуком

Ваш відгук допомагає нам покращувати цей воркшоп!

- **GitHub Issues**: [Залиште відгук](https://github.com/microsoft/azd-for-beginners/issues) - тегуйте з `Workshop`
- **Discord**: Приєднуйтесь до [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - публікуйте у `#get-help`
- **Внески**: Допоможіть покращити воркшоп, подаючи pull requests!

---

## Дякуємо! 🎉

Дякуємо за проходження воркшопу AZD для AI розробників. Сподіваємося, цей досвід дав вам навички та впевненість для створення та розгортання AI додатків на Azure.

**Продовжуйте будувати, продовжуйте вчитися і ласкаво просимо до спільноти розробників Azure AI!**

---

| | |
|:---|:---|
| **📚 Домашня сторінка курсу** | [AZD для початківців](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Документація** | [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI шаблони** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Спільнота** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->