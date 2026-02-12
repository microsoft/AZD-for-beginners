# AZD для початківців: структурована навчальна подорож

![AZD-for-beginners](../../translated_images/uk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматичні переклади (завжди актуальні)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабська](../ar/README.md) | [Бенгальська](../bn/README.md) | [Болгарська](../bg/README.md) | [Бирманська (М’янма)](../my/README.md) | [Китайська (спрощена)](../zh-CN/README.md) | [Китайська (традиційна, Гонконг)](../zh-HK/README.md) | [Китайська (традиційна, Макао)](../zh-MO/README.md) | [Китайська (традиційна, Тайвань)](../zh-TW/README.md) | [Хорватська](../hr/README.md) | [Чеська](../cs/README.md) | [Данська](../da/README.md) | [Голландська](../nl/README.md) | [Естонська](../et/README.md) | [Фінська](../fi/README.md) | [Французька](../fr/README.md) | [Німецька](../de/README.md) | [Грецька](../el/README.md) | [Іврит](../he/README.md) | [Хінді](../hi/README.md) | [Угорська](../hu/README.md) | [Індонезійська](../id/README.md) | [Італійська](../it/README.md) | [Японська](../ja/README.md) | [Каннада](../kn/README.md) | [Корейська](../ko/README.md) | [Литовська](../lt/README.md) | [Малайська](../ms/README.md) | [Малаялам](../ml/README.md) | [Мараті](../mr/README.md) | [Непальська](../ne/README.md) | [Нігерійський пиджин](../pcm/README.md) | [Норвезька](../no/README.md) | [Перська (фарсі)](../fa/README.md) | [Польська](../pl/README.md) | [Португальська (Бразилія)](../pt-BR/README.md) | [Португальська (Португалія)](../pt-PT/README.md) | [Панджабі (гурмукхі)](../pa/README.md) | [Румунська](../ro/README.md) | [Російська](../ru/README.md) | [Сербська (кирилиця)](../sr/README.md) | [Словацька](../sk/README.md) | [Словенська](../sl/README.md) | [Іспанська](../es/README.md) | [Суахілі](../sw/README.md) | [Шведська](../sv/README.md) | [Тагалог (філіппінська)](../tl/README.md) | [Тамільська](../ta/README.md) | [Телугу](../te/README.md) | [Тайська](../th/README.md) | [Турецька](../tr/README.md) | [Українська](./README.md) | [Урду](../ur/README.md) | [В’єтнамська](../vi/README.md)

> **Віддаєте перевагу працювати локально?**
>
> У цьому репозиторії понад 50 мовних перекладів, що суттєво збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Це дає все необхідне для проходження курсу з набагато швидшим завантаженням.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Що таке Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — це зручний для розробників інструмент командного рядка, який спрощує розгортання додатків в Azure. Замість ручного створення і підключення десятків ресурсів Azure можна розгорнути цілі додатки однією командою.

### Магія `azd up`

```bash
# Ця єдина команда робить усе:
# ✅ Створює всі ресурси Azure
# ✅ Налаштовує мережу та безпеку
# ✅ Збирає код вашого застосунку
# ✅ Розгортає в Azure
# ✅ Надає робочу URL-адресу
azd up
```

**Ось і все!** Без натискань у портал Azure, без складних ARM-шаблонів, без ручної налаштування — лише робочі додатки в Azure.

---

## ❓ Azure Developer CLI та Azure CLI: у чому різниця?

Це найпоширеніше питання серед початківців. Ось проста відповідь:

| Функція | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Призначення** | Керування окремими ресурсами Azure | Розгортання повних додатків |
| **Підхід** | Орієнтований на інфраструктуру | Орієнтований на додатки |
| **Приклад** | `az webapp create --name myapp...` | `azd up` |
| **Крива навчання** | Потрібно знати служби Azure | Достатньо знати свій додаток |
| **Кому підходить** | DevOps, інфраструктура | Розробникам, для прототипування |

### Простий аналог

- **Azure CLI** — це ніби мати весь інструментарій для будівництва дому — молотки, пилки, цвяхи. Можна будувати будь-що, але треба знати будівництво.
- **Azure Developer CLI** — це ніби найняти підрядника — ви описуєте, що хочете, а він будує.

### Коли яку використовувати

| Сценарій | Використовуйте |
|----------|----------------|
| "Хочу швидко розгорнути вебдодаток" | `azd up` |
| "Потрібно створити лише обліковий запис сховища" | `az storage account create` |
| "Будую повний AI-додаток" | `azd init --template azure-search-openai-demo` |
| "Потрібно налагодити конкретний ресурс Azure" | `az resource show` |
| "Хочу розгортання, готове до продакшну за хвилини" | `azd up --environment production` |

### Вони працюють разом!

AZD використовує Azure CLI “під капотом”. Можна користуватися обома:
```bash
# Розгорніть свій додаток за допомогою AZD
azd up

# Потім налаштуйте конкретні ресурси за допомогою Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Знайдіть шаблони в Awesome AZD

Не починайте з нуля! **Awesome AZD** — це спільнотна колекція готових до розгортання шаблонів:

| Ресурс | Опис |
|--------|-------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Переглядайте 200+ шаблонів з розгортанням в один клік |
| 🔗 [**Надіслати шаблон**](https://github.com/Azure/awesome-azd/issues) | Долучіть свій шаблон до спільноти |
| 🔗 [**GitHub-репозиторій**](https://github.com/Azure/awesome-azd) | Зіркайте і досліджуйте вихідний код |

### Популярні AI-шаблони з Awesome AZD

```bash
# RAG-чат з Azure OpenAI + Пошук ШІ
azd init --template azure-search-openai-demo

# Швидкий чат-застосунок зі ШІ
azd init --template openai-chat-app-quickstart

# Агенти ШІ з Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Початок роботи в 3 кроки

### Крок 1: Встановлення AZD (2 хвилини)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Крок 2: Увійдіть у Azure

```bash
azd auth login
```

### Крок 3: Розгорніть свій перший додаток

```bash
# Ініціалізувати з шаблону
azd init --template todo-nodejs-mongo

# Розгорнути в Azure (створює все!)
azd up
```

**🎉 Ось і все!** Ваш додаток тепер працює в Azure.

### Прибирання (не забудьте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Як користуватися цим курсом

Цей курс спроєктований для **поступового навчання** — почніть там, де вам комфортно, і рухайтесь вгору:

| Ваш досвід | Почніть тут |
|------------|--------------|
| **Новачок в Azure** | [Розділ 1: Основи](../..) |
| **Знаю Azure, новачок в AZD** | [Розділ 1: Основи](../..) |
| **Хочу розгорнути AI-додатки** | [Розділ 2: AI-перший розвиток](../..) |
| **Бажаю практичної роботи** | [🎓 Інтерактивний воркшоп](workshop/README.md) — 3-4 години лабораторних робіт |
| **Потрібні виробничі патерни** | [Розділ 8: Продакшн та корпоративні](../..) |

### Швидке налаштування

1. **Форкуйте цей репозиторій**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонуйте**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Отримайте допомогу**: [Спільнота Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Віддаєте перевагу працювати локально?**

> У цьому репозиторії понад 50 мовних перекладів, що суттєво збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Це дає все необхідне для проходження курсу з набагато швидшим завантаженням.


## Огляд курсу

Опановуйте Azure Developer CLI (azd) завдяки структурованим розділам, розробленим для поступового навчання. **Особлива увага розгортанню AI-додатків з інтеграцією Microsoft Foundry.**

### Чому цей курс важливий для сучасних розробників

Згідно з даними спільноти Microsoft Foundry Discord, **45% розробників хочуть використовувати AZD для AI-навантажень**, але стикаються з проблемами:
- Складні архітектури AI на кількох службах
- Найкращі практики розгортання AI в продакшні  
- Інтеграція та налаштування служб Azure AI
- Оптимізація вартості AI-навантажень
- Вирішення проблем, специфічних для AI-розгортання

### Мета навчання

Пройшовши цей структурований курс, ви:
- **Опануєте основи AZD**: базові концепції, встановлення і налаштування
- **Розгорнете AI-додатки**: використання AZD з Microsoft Foundry
- **Впровадите інфраструктуру як код**: керування ресурсами Azure за допомогою Bicep-шаблонів
- **Вирішуватимете проблеми розгортання**: усунення поширених помилок і налагодження
- **Оптимізуєте для продакшну**: безпека, масштабування, моніторинг та управління витратами
- **Створите мультиагентні рішення**: розгортання складних AI-архітектур

## 🗺️ Карта курсу: швидка навігація за розділами

Кожен розділ має окремий README з цілями навчання, швидкими стартами і вправами:

| Розділ | Тема | Уроки | Тривалість | Складність |
|---------|-------|---------|----------|------------|
| **[Розд 1: Основи](docs/chapter-01-foundation/README.md)** | Початок роботи | [Основи AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Встановлення](docs/chapter-01-foundation/installation.md) &#124; [Перший проєкт](docs/chapter-01-foundation/first-project.md) | 30-45 хв | ⭐ |
| **[Розд 2: AI-розробка](docs/chapter-02-ai-development/README.md)** | AI-перші додатки | [Інтеграція Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-агенти](docs/chapter-02-ai-development/agents.md) &#124; [Розгортання моделей](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Воркшоп](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 год | ⭐⭐ |
| **[Розд 3: Налаштування](docs/chapter-03-configuration/README.md)** | Аутентифікація і безпека | [Налаштування](docs/chapter-03-configuration/configuration.md) &#124; [Аутентифікація та безпека](docs/chapter-03-configuration/authsecurity.md) | 45-60 хв | ⭐⭐ |
| **[Розд 4: Інфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC & Розгортання | [Посібник з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 год | ⭐⭐⭐ |
| **[Розд 5: Багатоагентна система](docs/chapter-05-multi-agent/README.md)** | AI-агентські рішення | [Роздрібний сценарій](examples/retail-scenario.md) &#124; [Шаблони координації](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[Розд 6: Передрозгортання](docs/chapter-06-pre-deployment/README.md)** | Планування та валідація | [Перевірки перед польотом](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 год | ⭐⭐ |
| **[Розд 7: Усунення неполадок](docs/chapter-07-troubleshooting/README.md)** | Налагодження & Виправлення | [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Налагодження](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблеми зі ШІ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 год | ⭐⭐ |
| **[Розд 8: Продуктивність](docs/chapter-08-production/README.md)** | Корпоративні шаблони | [Практики для продуктивності](docs/chapter-08-production/production-ai-practices.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[🎓 Майстерня](workshop/README.md)** | Практична лабораторія | [Вступ](workshop/docs/instructions/0-Introduction.md) &#124; [Вибір](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валідація](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Розбір](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Налаштування](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Кастомізація](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Знищення](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Підсумок](workshop/docs/instructions/7-Wrap-up.md) | 3-4 год | ⭐⭐ |

**Загальна тривалість курсу:** ~10-14 годин | **Рівень навичок:** Початковий → Готовий до продуктивності

---

## 📚 Навчальні розділи

*Виберіть свій навчальний шлях залежно від досвіду та цілей*

### 🚀 Розділ 1: Основи та швидкий старт
**Передумови**: підписка Azure, базові знання командного рядка  
**Тривалість**: 30-45 хвилин  
**Складність**: ⭐

#### Чого ви навчитеся
- Основи Azure Developer CLI
- Встановлення AZD на вашу платформу
- Ваше перше успішне розгортання

#### Навчальні ресурси
- **🎯 Почати тут**: [Що таке Azure Developer CLI?](../..)
- **📖 Теорія**: [Основи AZD](docs/chapter-01-foundation/azd-basics.md) - Ключові поняття та термінологія
- **⚙️ Налаштування**: [Інсталяція та налаштування](docs/chapter-01-foundation/installation.md) - Керівництво для платформ
- **🛠️ Практика**: [Ваш перший проєкт](docs/chapter-01-foundation/first-project.md) - Покрокове навчання
- **📋 Шпаргалка**: [Командний чек-лист](resources/cheat-sheet.md)

#### Практичні вправи
```bash
# Швидка перевірка встановлення
azd version

# Розгорніть вашу першу програму
azd init --template todo-nodejs-mongo
azd up
```

**💡 Результат розділу**: Успішно розгорнути простий вебдодаток в Azure за допомогою AZD

**✅ Перевірка успіху:**
```bash
# Після завершення Розділу 1 ви повинні вміти:
azd version              # Показує встановлену версію
azd init --template todo-nodejs-mongo  # Ініціалізує проект
azd up                  # Розгортає в Azure
azd show                # Відображає URL працюючого додатку
# Додаток відкривається у браузері та працює
azd down --force --purge  # Очищає ресурси
```

**📊 Час інвестування:** 30-45 хвилин  
**📈 Рівень після:** Самостійно розгортає базові додатки

**✅ Перевірка успіху:**
```bash
# Після завершення розділу 1 ви зможете:
azd version              # Показує встановлену версію
azd init --template todo-nodejs-mongo  # Ініціалізує проект
azd up                  # Розгортає на Azure
azd show                # Показує URL запущеного додатку
# Додаток відкривається у браузері і працює
azd down --force --purge  # Очищає ресурси
```

**📊 Час інвестування:** 30-45 хвилин  
**📈 Рівень після:** Самостійно розгортає базові додатки

---

### 🤖 Розділ 2: ШІ-перший розвиток (Рекомендовано для розробників ШІ)
**Передумови**: Розділ 1 завершено  
**Тривалість**: 1-2 год  
**Складність**: ⭐⭐

#### Чого ви навчитеся
- Інтеграція Microsoft Foundry з AZD
- Розгортання додатків із ШІ
- Налаштування сервісів ШІ

#### Навчальні ресурси
- **🎯 Почати тут**: [Інтеграція Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 ШІ-агенти**: [Посібник із AI-агентів](docs/chapter-02-ai-development/agents.md) - Розгортання інтелектуальних агентів у AZD
- **📖 Шаблони**: [Розгортання AI-моделей](docs/chapter-02-ai-development/ai-model-deployment.md) - Керування AI-моделями
- **🛠️ Майстерня**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Підготовка AI-рішень до AZD
- **🎥 Інтерактивний посібник**: [Матеріали майстерні](workshop/README.md) - Навчання в браузері з MkDocs * DevContainer середовище
- **📋 Шаблони**: [Шаблони Microsoft Foundry](../..)
- **📝 Приклади**: [Приклади розгортання AZD](examples/README.md)

#### Практичні вправи
```bash
# Розгорніть свій перший додаток штучного інтелекту
azd init --template azure-search-openai-demo
azd up

# Спробуйте додаткові шаблони штучного інтелекту
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Результат розділу**: Розгорнути та налаштувати чат-додаток з ШІ з можливостями RAG

**✅ Перевірка успіху:**
```bash
# Після розділу 2 ви повинні вміти:
azd init --template azure-search-openai-demo
azd up
# Тестувати інтерфейс чат-бота на основі ШІ
# Ставити запитання та отримувати відповіді з підтримкою ШІ з джерелами
# Перевіряти, що інтеграція пошуку працює
azd monitor  # Перевіряти, що Application Insights показує телеметрію
azd down --force --purge
```

**📊 Час інвестування:** 1-2 год  
**📈 Рівень після:** Може розгортати та налаштовувати готові до продуктивності AI-додатки  
**💰 Увага на витрати:** Розуміти витрати $80-150/місяць на розробку, $300-3500/місяць у продукції

#### 💰 Витрати на розгортання AI

**Розробницьке середовище (Оцінка $80-150/місяць):**
- Azure OpenAI (оплата за використання): $0-50/місяць (залежить від трафіку токенів)
- AI Search (базовий рівень): $75/місяць
- Container Apps (споживання): $0-20/місяць
- Зберігання (Стандартне): $1-5/місяць

**Продуктивне середовище (Оцінка $300-3,500+/місяць):**
- Azure OpenAI (PTU для стабільності): від $3,000/місяць або оплата за використання при великому обсязі
- AI Search (стандарт): $250/місяць
- Container Apps (виділені): $50-100/місяць
- Application Insights: $5-50/місяць
- Зберігання (Преміум): $10-50/місяць

**💡 Поради з оптимізації витрат:**
- Використовуйте **Безкоштовний рівень** Azure OpenAI для навчання (включно 50 000 токенів/місяць)
- Запускайте `azd down` для звільнення ресурсів, коли не розробляєте активно
- Починайте зі споживчого тарифу, переходьте на PTU лише для продукції
- Використовуйте `azd provision --preview` для оцінки вартості перед розгортанням
- Увімкніть авто масштабування: платіть тільки за реальне використання

**Моніторинг витрат:**
```bash
# Перевірте орієнтовні щомісячні витрати
azd provision --preview

# Стежте за фактичними витратами в порталі Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Розділ 3: Налаштування й автентифікація
**Передумови**: Розділ 1 завершено  
**Тривалість**: 45-60 хв  
**Складність**: ⭐⭐

#### Чого ви навчитеся
- Конфігурація та керування середовищем
- Кращі практики автентифікації та безпеки
- Іменування та організація ресурсів

#### Навчальні ресурси
- **📖 Конфігурація**: [Керівництво з налаштування](docs/chapter-03-configuration/configuration.md) - Налаштування середовища
- **🔐 Безпека**: [Патерни автентифікації та керовані ідентичності](docs/chapter-03-configuration/authsecurity.md)
- **📝 Приклади**: [Приклад бази даних](examples/database-app/README.md) - Приклади AZD для баз даних

#### Практичні вправи
- Налаштування кількох середовищ (dev, staging, prod)
- Налаштування автентифікації з керованою ідентичністю
- Реалізація специфічних для середовища конфігурацій

**💡 Результат розділу**: Керуйте кількома середовищами з належною автентифікацією та безпекою

---

### 🏗️ Розділ 4: Інфраструктура як Код та Розгортання
**Передумови**: Розділи 1-3 завершені  
**Тривалість**: 1-1.5 год  
**Складність**: ⭐⭐⭐

#### Чого ви навчитеся
- Розширені схеми розгортання
- Інфраструктура як Код з Bicep
- Стратегії провізії ресурсів

#### Навчальні ресурси
- **📖 Розгортання**: [Посібник з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) - Повні робочі процеси
- **🏗️ Provisioning**: [Керування ресурсами Azure](docs/chapter-04-infrastructure/provisioning.md)
- **📝 Приклади**: [Приклад Container App](../../examples/container-app) - Розгортання контейнерів

#### Практичні вправи
- Створення власних шаблонів Bicep
- Розгортання мультисервісних додатків
- Впровадження стратегій blue-green розгортання

**💡 Результат розділу**: Розгортайте складні мультисервісні додатки за допомогою власних інфраструктурних шаблонів

---

### 🎯 Розділ 5: Багатоагентні AI-рішення (Просунутий рівень)
**Передумови**: Розділи 1-2 завершені  
**Тривалість**: 2-3 год  
**Складність**: ⭐⭐⭐⭐

#### Чого ви навчитеся
- Шаблони архітектури для багатоагентних систем
- Оркестрація та координація агентів
- Готові до продуктивності розгортання AI

#### Навчальні ресурси
- **🤖 Важливий проєкт**: [Багатоагентне роздрібне рішення](examples/retail-scenario.md) - Повна імплементація
- **🛠️ ARM шаблони**: [Пакет ARM шаблонів](../../examples/retail-multiagent-arm-template) - Розгортання в один клік
- **📖 Архітектура**: [Шаблони координації багатоагентних систем](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### Практичні вправи
```bash
# Розгорнути повне рітейл мультиагентне рішення
cd examples/retail-multiagent-arm-template
./deploy.sh

# Дослідити конфігурації агентів
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Результат розділу**: Розгорнути та керувати багатоагентним AI-рішенням для продуктивності з агентами Клієнта та Запасів

---

### 🔍 Розділ 6: Валідація та планування перед розгортанням
**Передумови**: Розділ 4 завершено  
**Тривалість**: 1 год  
**Складність**: ⭐⭐

#### Чого ви навчитеся
- Планування потужностей та валідація ресурсів
- Стратегії вибору SKU
- Перевірки перед розгортанням і автоматизація

#### Навчальні ресурси
- **📊 Планування**: [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md) - Валідація ресурсів
- **💰 Вибір**: [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Вигідні варіанти
- **✅ Валідація**: [Перевірки перед польотом](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизовані скрипти

#### Практичні вправи
- Запуск скриптів валідації потужностей
- Оптимізація вибору SKU для вартості
- Впровадження автоматизованих перевірок перед розгортанням

**💡 Результат розділу**: Валідуйте й оптимізуйте розгортання перед виконанням

---

### 🚨 Розділ 7: Усунення неполадок та налагодження
**Передумови**: Будь-який розділ з розгортання завершено  
**Тривалість**: 1-1.5 год  
**Складність**: ⭐⭐

#### Чого ви навчитеся
- Систематичні методики налагодження
- Поширені проблеми та їх вирішення
- Усунення неполадок, специфічних для AI

#### Навчальні ресурси
- **🔧 Поширені проблеми**: [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) - FAQ та рішення
- **🕵️ Налагодження**: [Посібник з налагодження](docs/chapter-07-troubleshooting/debugging.md) - Пошагові стратегії
- **🤖 Проблеми AI**: [Усунення неполадок ШІ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми сервісів ШІ

#### Практичні вправи
- Діагностика збоїв розгортання
- Вирішення проблем автентифікації
- Налагодження зв’язку сервісів ШІ

**💡 Результат розділу**: Самостійно діагностувати й вирішувати поширені проблеми розгортання

---

### 🏢 Розділ 8: Продуктивність та корпоративні шаблони
**Передумови**: Розділи 1-4 завершені  
**Тривалість**: 2-3 год  
**Складність**: ⭐⭐⭐⭐

#### Чого ви навчитеся
- Стратегії продуктивного розгортання
- Корпоративні шаблони безпеки
- Моніторинг і оптимізація вартості

#### Навчальні ресурси
- **🏭 Продуктивність**: [Кращі практики AI в продукції](docs/chapter-08-production/production-ai-practices.md) - Корпоративні шаблони
- **📝 Приклади**: [Приклад мікросервісів](../../examples/microservices) - Складні архітектури
- **📊 Моніторинг**: [Інтеграція Application Insights](docs/chapter-06-pre-deployment/application-insights.md)

#### Практичні вправи
- Впровадження корпоративних шаблонів безпеки
- Налаштування комплексного моніторингу
- Розгортання в продуктиві з належним керуванням

**💡 Результат розділу**: Розгорнути корпоративні додатки з повною продуктивністю

---

## 🎓 Огляд майстерні: Практичний навчальний досвід

> **⚠️ СТАН МАЙСТЕРНІ: Активна розробка**  

> Матеріали воркшопу наразі розробляються та удосконалюються. Основні модулі працюють, але деякі розділи просунутого рівня не завершені. Ми активно працюємо над завершенням усього контенту. [Відстежити прогрес →](workshop/README.md)

### Інтерактивні матеріали воркшопу
**Комплексне практичне навчання з інструментами в браузері та покроковими вправами**

Наші матеріали воркшопу забезпечують структурований, інтерактивний досвід навчання, що доповнює навчальну програму з розділів вище. Воркшоп розроблений як для самостійного вивчення, так і для занять під керівництвом інструктора.

#### 🛠️ Особливості воркшопу
- **Інтерфейс у браузері**: Повноцінний воркшоп на базі MkDocs з пошуком, копіюванням і темами оформлення
- **Інтеграція з GitHub Codespaces**: Налаштування середовища розробки в один клік
- **Структурований навчальний шлях**: 8 модулів з покроковими вправами (загалом 3-4 години)
- **Прогресивна методологія**: Вступ → Вибір → Валідація → Розбір → Конфігурація → Налаштування → Закриття → Підсумок
- **Інтерактивне середовище DevContainer**: Попередньо налаштовані інструменти та залежності

#### 📚 Структура модулів воркшопу
Воркшоп базується на **8-модульній прогресивній методології**, яка проведе вас від ознайомлення до освоєння розгортання:

| Модуль | Тема | Що ви робитимете | Тривалість |
|--------|-------|------------------|------------|
| **0. Вступ** | Огляд воркшопу | Зрозуміти цілі навчання, вимоги та структуру воркшопу | 15 хв |
| **1. Вибір** | Пошук шаблону | Ознайомитися з AZD шаблонами та обрати відповідний AI шаблон для вашого сценарію | 20 хв |
| **2. Валідація** | Розгортання та перевірка | Розгорнути шаблон за допомогою `azd up` та переконатися, що інфраструктура працює | 30 хв |
| **3. Розбір** | Розуміння структури | Використати GitHub Copilot для вивчення архітектури шаблону, файлів Bicep та організації коду | 30 хв |
| **4. Конфігурація** | Глибоке занурення в azure.yaml | Опанувати конфігурації `azure.yaml`, хуки життєвого циклу та змінні оточення | 30 хв |
| **5. Налаштування** | Зробіть по-своєму | Увімкнути AI Search, трасування, оцінювання та налаштувати під ваш сценарій | 45 хв |
| **6. Закриття** | Очистка | Безпечно видалити ресурси за допомогою `azd down --purge` | 15 хв |
| **7. Підсумок** | Наступні кроки | Підсумувати досягнення, ключові поняття та продовжити навчання | 15 хв |

**Хід воркшопу:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Початок роботи з воркшопом
```bash
# Варіант 1: GitHub Codespaces (рекомендовано)
# Натисніть "Code" → "Create codespace on main" у репозиторії

# Варіант 2: Локальна розробка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Дотримуйтесь інструкцій з налаштування у workshop/README.md
```

#### 🎯 Результати навчання воркшопу
Після завершення воркшопу учасники зможуть:
- **Розгортати виробничі AI застосунки**: Використовувати AZD з сервісами Microsoft Foundry
- **Опанувати мультиагентні архітектури**: Реалізувати скоординовані рішення з AI агента
- **Впроваджувати найкращі практики безпеки**: Налаштовувати аутентифікацію та контроль доступу
- **Оптимізувати для масштабування**: Проєктувати ефективні за вартістю і продуктивністю розгортання
- **Вирішувати проблеми розгортання**: Самостійно усувати поширені проблеми

#### 📖 Ресурси воркшопу
- **🎥 Інтерактивний посібник**: [Матеріали воркшопу](workshop/README.md) - Навчальне середовище у браузері
- **📋 Інструкції по модулях**:
  - [0. Вступ](workshop/docs/instructions/0-Introduction.md) - Огляд воркшопу та цілі
  - [1. Вибір](workshop/docs/instructions/1-Select-AI-Template.md) - Пошук і вибір AI шаблонів
  - [2. Валідація](workshop/docs/instructions/2-Validate-AI-Template.md) - Розгортання та перевірка шаблонів
  - [3. Розбір](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Вивчення архітектури шаблону
  - [4. Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) - Опанування azure.yaml
  - [5. Налаштування](workshop/docs/instructions/5-Customize-AI-Template.md) - Налаштування під ваш сценарій
  - [6. Закриття](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очищення ресурсів
  - [7. Підсумок](workshop/docs/instructions/7-Wrap-up.md) - Підсумки і наступні кроки
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ориєнтовані на AI вправи
- **💡 Швидкий старт**: [Посібник з налаштування воркшопу](workshop/README.md#quick-start) - Конфігурація середовища

**Ідеально підходить для**: корпоративного навчання, університетських курсів, самостійного вивчення та буткемпів для розробників.

---

## 📖 Глибоке занурення: Можливості AZD

Окрім основ, AZD пропонує потужні функції для виробничих розгортань:

- **Розгортання на основі шаблонів** - Використовуйте готові шаблони для типових застосунків
- **Інфраструктура як код** - Керуйте Azure ресурсами за допомогою Bicep або Terraform  
- **Інтегровані робочі процеси** - Безшовне забезпечення, розгортання та моніторинг застосунків
- **Комфорт для розробника** - Оптимізовано для продуктивності та досвіду розробника

### **AZD + Microsoft Foundry: Ідеально для розгортань AI**

**Чому AZD для AI рішень?** AZD враховує основні виклики розробників AI:

- **Шаблони, готові до AI** - Попередньо налаштовані шаблони для Azure OpenAI, Cognitive Services та ML навантажень
- **Безпечні розгортання AI** - Вбудовані шаблони безпеки для AI сервісів, API ключів та кінцевих точок моделей  
- **Виробничі AI патерни** - Найкращі практики для масштабованих і ефективних розгортань AI застосунків
- **Повний AI робочий процес** - Від розробки моделі до виробничого розгортання з відповідним моніторингом
- **Оптимізація витрат** - Розумне виділення ресурсів та стратегії масштабування для AI навантажень
- **Інтеграція з Microsoft Foundry** - Безшовне підключення до каталогу моделей та кінцевих точок Microsoft Foundry

---

## 🎯 Шаблони та бібліотека прикладів

### Рекомендовано: Шаблони Microsoft Foundry
**Почніть тут, якщо розгортаєте AI застосунки!**

> **Примітка:** Ці шаблони демонструють різні AI патерни. Деякі — зовнішні Azure Samples, інші — локальні реалізації.

| Шаблон | Розділ | Складність | Сервіси | Тип |
|---------|---------|------------|----------|------|
| [**Початок з AI чат**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Зовнішній |
| [**Початок з AI агентами**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Розділ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Зовнішній |
| [**Демо Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Зовнішній |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Зовнішній |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Зовнішній |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Зовнішній |
| [**Роздрібне мультиагентне рішення**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локальний** |

### Рекомендовано: Готові навчальні сценарії
**Шаблони продуктивних застосунків, співставлені з навчальними розділами**

| Шаблон | Навчальний розділ | Складність | Ключове навчання |
|---------|-------------------|------------|------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | Основні патерни розгортання AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | Впровадження RAG з Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Розділ 4 | ⭐⭐ | Інтеграція інтелекту обробки документів |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | Фреймворк агентів та виклики функцій |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐ | Оркестрація корпоративного AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | Мультиагентна архітектура з агентами Клієнтів і Інвентаря |

### Навчання за типом прикладу

> **📌 Локальні vs. Зовнішні приклади:**  
> **Локальні приклади** (у цьому репозиторії) = Готові до негайного використання  
> **Зовнішні приклади** (Azure Samples) = Клонувати з пов’язаних репозиторіїв

#### Локальні приклади (готові до використання)
- [**Роздрібне мультиагентне рішення**](examples/retail-scenario.md) - Повна виробнича реалізація з ARM шаблонами
  - Мультиагентна архітектура (агенти Клієнтів + Інвентаря)
  - Комплексний моніторинг та оцінювання
  - Розгортання в один клік через ARM шаблон

#### Локальні приклади – Контейнерні застосунки (Розділи 2-5)
**Повні приклади розгортання контейнерів у цьому репозиторії:**
- [**Приклади Container Apps**](examples/container-app/README.md) - Повний посібник з контейнеризованих розгортань
  - [Простий Flask API](../../examples/container-app/simple-flask-api) - Базовий REST API зі scale-to-zero
  - [Архітектура мікросервісів](../../examples/container-app/microservices) - Виробниче розгортання мультисервісів
  - Швидкий старт, продакшен і розширені патерни розгортання
  - Моніторинг, безпека та рекомендації щодо оптимізації витрат

#### Зовнішні приклади – Прості застосунки (Розділи 1-2)
**Клонуйте ці Azure Samples, щоб почати:**
- [Простий веб-застосунок - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основні патерни розгортання
- [Статичний сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Розгортання статичного контенту
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Розгортання REST API

#### Зовнішні приклади – Інтеграція з базами даних (Розділи 3-4)  
- [Застосунок з базою даних - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Патерни підключення до бази даних
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Серверлес-обробка даних

#### Зовнішні приклади – Просунуті патерни (Розділи 4-8)
- [Java мікросервіси](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архітектури мультисервісів
- [Jobs в Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Фонові процеси  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Виробничі ML патерни

### Колекції зовнішніх шаблонів
- [**Офіційна галерея шаблонів AZD**](https://azure.github.io/awesome-azd/) - Кураторська колекція офіційних та спільнотних шаблонів
- [**Шаблони Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документація шаблонів Microsoft Learn
- [**Каталог прикладів**](examples/README.md) - Локальні навчальні приклади з детальними поясненнями

---

## 📚 Ресурси для навчання та посилання

### Швидка довідка
- [**Шпаргалка команд**](resources/cheat-sheet.md) - Основні azd команди за розділами
- [**Глосарій**](resources/glossary.md) - Терміни Azure та azd  
- [**FAQ**](resources/faq.md) - Поширені запитання за навчальними розділами
- [**Навчальний посібник**](resources/study-guide.md) - Комплексні вправи на практику

### Практичні воркшопи
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Як зробити AI рішення готовими до розгортання в AZD (2-3 години)
- [**Інтерактивний воркшоп**](workshop/README.md) - 8 модулів з покроковими вправами на MkDocs та GitHub Codespaces
  - Слідує: Вступ → Вибір → Валідація → Розбір → Конфігурація → Налаштування → Закриття → Підсумок

### Зовнішні ресурси для навчання
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор цін Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

---

## 🔧 Швидкий посібник з усунення несправностей

**Поширені проблеми у початківців та швидкі рішення:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Спочатку встановіть AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Перевірте інсталяцію
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" або "Subscription not set"</strong></summary>

```bash
# Перелік доступних підписок
az account list --output table

# Встановити стандартну підписку
az account set --subscription "<subscription-id-or-name>"

# Встановити для середовища AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Перевірити
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" або "Перевищено ліміт"</strong></summary>

```bash
# Спробуйте інший регіон Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Або використовуйте менші SKU під час розробки
# Відредагуйте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" не вдається виконати далі середини</strong></summary>

```bash
# Варіант 1: Очистити і спробувати знову
azd down --force --purge
azd up

# Варіант 2: Просто виправити інфраструктуру
azd provision

# Варіант 3: Перевірити детальний статус
azd show

# Варіант 4: Перевірити журнали в Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Помилка автентифікації" або "Токен протерміновано"</strong></summary>

```bash
# Повторна автентифікація
az logout
az login

azd auth logout
azd auth login

# Перевірити автентифікацію
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс вже існує" або конфлікти імен</strong></summary>

```bash
# AZD генерує унікальні імена, але в разі конфлікту:
azd down --force --purge

# Потім повторити спробу з новим середовищем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Розгортання шаблону займає надто багато часу</strong></summary>

**Нормальний час очікування:**
- Проста вебзастосунок: 5-10 хвилин
- Застосунок з базою даних: 10-15 хвилин
- AI-застосунки: 15-25 хвилин (Provisioning OpenAI повільний)

```bash
# Перевірте прогрес
azd show

# Якщо затримка понад 30 хвилин, перевірте портал Azure:
azd monitor
# Перевірте невдалі розгортання
```
</details>

<details>
<summary><strong>❌ "Доступ заборонено" або "Заборонено"</strong></summary>

```bash
# Перевірте свою роль в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Вам потрібна принаймні роль "Contributor"
# Попросіть вашого адміністратора Azure надати:
# - Contributor (для ресурсів)
# - User Access Administrator (для призначень ролей)
```
</details>

<details>
<summary><strong>❌ Не вдається знайти URL розгорнутого застосунку</strong></summary>

```bash
# Показати всі кінцеві точки сервісів
azd show

# Або відкрити портал Azure
azd monitor

# Перевірити конкретний сервіс
azd env get-values
# Шукати змінні *_URL
```
</details>

### 📚 Повні ресурси з усунення несправностей

- **Керівництво з поширених проблем:** [Детальні рішення](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, пов’язані з ШІ:** [Усунення несправностей ШІ](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Керівництво з налагодження:** [Покрокове налагодження](docs/chapter-07-troubleshooting/debugging.md)
- **Отримати допомогу:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершення курсу та сертифікація

### Відстеження прогресу
Відстежуйте свій прогрес навчання по кожному розділу:

- [ ] **Розділ 1**: Основи та швидкий старт ✅
- [ ] **Розділ 2**: Розробка з фокусом на ШІ ✅  
- [ ] **Розділ 3**: Конфігурація та автентифікація ✅
- [ ] **Розділ 4**: Інфраструктура як код та розгортання ✅
- [ ] **Розділ 5**: Багатоагентні AI-рішення ✅
- [ ] **Розділ 6**: Перевірка перед розгортанням та планування ✅
- [ ] **Розділ 7**: Усунення несправностей та налагодження ✅
- [ ] **Розділ 8**: Патерни для продуктивного та корпоративного використання ✅

### Перевірка навчання
Після завершення кожного розділу перевірте свої знання:
1. **Практичне завдання**: Виконайте практичне розгортання розділу
2. **Перевірка знань**: Ознайомтеся з розділом FAQ вашого розділу
3. **Обговорення в спільноті**: Поділіться досвідом у Azure Discord
4. **Наступний розділ**: Перейдіть до наступного рівня складності

### Переваги завершення курсу
Після завершення всіх розділів ви отримаєте:
- **Досвід у продакшені**: Розгорнуті реальні AI-застосунки на Azure
- **Професійні навички**: Здатність розгортати корпоративні рішення  
- **Визнання в спільноті**: Активний учасник спільноти розробників Azure
- **Кар’єрний розвиток**: Популярні навички AZD та розгортання AI

---

## 🤝 Спільнота та підтримка

### Отримати допомогу та підтримку
- **Технічні проблеми**: [Повідомити про помилки та запропонувати функції](https://github.com/microsoft/azd-for-beginners/issues)
- **Питання навчання**: [Спільнота Microsoft Azure Discord](https://discord.gg/microsoft-azure) та [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Допомога зі ШІ**: Приєднуйтесь до [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документація**: [Офіційна документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Інсайти спільноти з Microsoft Foundry Discord

**Останні результати опитування з каналу #Azure:**
- **45%** розробників хочуть використовувати AZD для AI-навантажень
- **Основні проблеми**: Розгортання багатьох сервісів, керування обліковими даними, готовність до продуктивної роботи  
- **Найпопулярніші запити**: Шаблони для ШІ, керівництва по усуненню несправностей, найкращі практики

**Приєднуйтесь до нашої спільноти, щоб:**
- Ділитися досвідом роботи з AZD + AI та отримувати допомогу
- Отримувати ранній доступ до нових AI-шаблонів
- Вносити свій внесок у найкращі практики розгортання AI
- Впливати на подальший розвиток функцій AI + AZD

### Участь у розробці курсу
Ми раді внескам! Будь ласка, ознайомтесь з нашим [Керівництвом для учасників](CONTRIBUTING.md) для деталей щодо:
- **Покращення контенту**: Розширення існуючих розділів і прикладів
- **Нові приклади**: Додавання реальних сценаріїв та шаблонів  
- **Переклад**: Підтримка багатомовності
- **Звіти про помилки**: Покращення точності і зрозумілості
- **Стандарти спільноти**: Дотримання інклюзивних правил спільноти

---

## 📄 Інформація про курс

### Ліцензія
Цей проект ліцензовано за ліцензією MIT - див. файл [LICENSE](../../LICENSE) для деталей.

### Пов’язані навчальні ресурси Microsoft

Наша команда створює інші комплексні навчальні курси:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j для початківців](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js для початківців](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain для початківців](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Агенти
[![AZD для початківців](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI для початківців](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP для початківців](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents для початківців](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серія Generative AI
[![Generative AI для початківців](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основи навчання
[![ML для початківців](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science для початківців](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI для початківців](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кібербезпека для початківців](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб-розробка для початківців](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT для початківців](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development для початківців](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серія Copilot
[![Copilot для AI парного програмування](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot для C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Навігація курсом

**🚀 Готові почати навчання?**

**Початківці**: Почніть з [Розділ 1: Основи та швидкий старт](../..)  
**Розробники ШІ**: Перейдіть до [Розділ 2: Розробка з упором на ШІ](../..)  
**Досвідчені розробники**: Починайте з [Розділ 3: Конфігурація та автентифікація](../..)

**Наступні кроки**: [Почати Розділ 1 - Основи AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний переклад людиною. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->