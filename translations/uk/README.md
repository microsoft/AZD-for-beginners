# AZD для початківців: Структурована навчальна подорож

![AZD-for-beginners](../../translated_images/uk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматизовані переклади (завжди актуальні)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабська](../ar/README.md) | [Бенгальська](../bn/README.md) | [Болгарська](../bg/README.md) | [Бірманська (М’янма)](../my/README.md) | [Китайська (спрощена)](../zh-CN/README.md) | [Китайська (традиційна, Гонконг)](../zh-HK/README.md) | [Китайська (традиційна, Макао)](../zh-MO/README.md) | [Китайська (традиційна, Тайвань)](../zh-TW/README.md) | [Хорватська](../hr/README.md) | [Чеська](../cs/README.md) | [Данська](../da/README.md) | [Голландська](../nl/README.md) | [Естонська](../et/README.md) | [Фінська](../fi/README.md) | [Французька](../fr/README.md) | [Німецька](../de/README.md) | [Грецька](../el/README.md) | [Іврит](../he/README.md) | [Хінді](../hi/README.md) | [Угорська](../hu/README.md) | [Індонезійська](../id/README.md) | [Італійська](../it/README.md) | [Японська](../ja/README.md) | [Каннада](../kn/README.md) | [Корейська](../ko/README.md) | [Литовська](../lt/README.md) | [Малайська](../ms/README.md) | [Малаялам](../ml/README.md) | [Маратхі](../mr/README.md) | [Непальська](../ne/README.md) | [Нігерійський Піджин](../pcm/README.md) | [Норвезька](../no/README.md) | [Перська (фарсі)](../fa/README.md) | [Польська](../pl/README.md) | [Португальська (Бразилія)](../pt-BR/README.md) | [Португальська (Португалія)](../pt-PT/README.md) | [Пенджабі (Гурмукхі)](../pa/README.md) | [Румунська](../ro/README.md) | [Російська](../ru/README.md) | [Сербська (кирилиця)](../sr/README.md) | [Словацька](../sk/README.md) | [Словенська](../sl/README.md) | [Іспанська](../es/README.md) | [Суахілі](../sw/README.md) | [Шведська](../sv/README.md) | [Тагальська (філіппінська)](../tl/README.md) | [Тамільська](../ta/README.md) | [Телугу](../te/README.md) | [Тайська](../th/README.md) | [Турецька](../tr/README.md) | [Українська](./README.md) | [Урду](../ur/README.md) | [В’єтнамська](../vi/README.md)

> **Віддаєте перевагу клонувати локально?**
>
> Цей репозиторій включає понад 50 перекладів мов, що значно збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте sparse checkout:
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
> Це надасть все необхідне для проходження курсу з набагато швидшим завантаженням.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Що нового в azd сьогодні

Azure Developer CLI вийшов за рамки традиційних веб-застосунків і API. Сьогодні azd — це єдиний інструмент для розгортання **будь-яких** застосунків в Azure — включно з AI-застосунками та інтелектуальними агентами.

Ось що це означає для вас:

- **AI-агенти тепер є першокласними робочими навантаженнями azd.** Ви можете ініціалізувати, розгортати та керувати проектами AI-агентів за тим самим робочим процесом `azd init` → `azd up`, який ви вже знаєте.
- **Інтеграція Microsoft Foundry** забезпечує розгортання моделей, хостинг агентів і конфігурацію AI-сервісів безпосередньо в екосистему шаблонів azd.
- **Основний робочий процес залишився незмінним.** Незалежно від того, чи ви розгортаєте todo-застосунок, мікросервіс або мультиагентський AI-рішення — команди однакові.

Якщо ви вже користувалися azd, підтримка AI — це природне розширення, а не окремий інструмент чи складний курс. Якщо ви починаєте з нуля, ви вивчите один робочий процес, що працює для всього.

---

## 🚀 Що таке Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — це зручний для розробника інструмент командного рядка, який спрощує розгортання застосунків в Azure. Замість ручного створення і підключення десятків ресурсів Azure, ви можете розгорнути повний застосунок однією командою.

### Магія `azd up`

```bash
# Ця єдина команда робить усе:
# ✅ Створює всі ресурси Azure
# ✅ Налаштовує мережу та безпеку
# ✅ Збирає код вашого застосунку
# ✅ Розгортає в Azure
# ✅ Надає вам робочу URL-адресу
azd up
```

**Ось і все!** Без кліків в Azure Portal, без складних ARM-шаблонів, без ручних налаштувань — лише працюючі застосунки в Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: У чому різниця?

Це найпоширеніше питання серед початківців. Ось проста відповідь:

| Функція | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Призначення** | Керувати окремими ресурсами Azure | Розгортати повні застосунки |
| **Підхід** | Орієнтований на інфраструктуру | Орієнтований на застосунок |
| **Приклад** | `az webapp create --name myapp...` | `azd up` |
| **Крива навчання** | Потрібні знання Azure-сервісів | Досить знати свій застосунок |
| **Кому підходить** | DevOps, інфраструктура | Розробники, прототипування |

### Проста аналогія

- **Azure CLI** — це як мати всі інструменти для будівництва будинку: молотки, пили, цвяхи. Ви можете побудувати будь-що, але потрібно знати будівництво.
- **Azure Developer CLI** — це як найняти підрядника: ви описуєте, що хочете, а він займається будівництвом.

### Коли використовувати кожен

| Сценарій | Використовуйте |
|----------|----------------|
| "Хочу швидко розгорнути веб-застосунок" | `azd up` |
| "Потрібно створити лише обліковий запис сховища" | `az storage account create` |
| "Я будую повноцінну AI-застосунок" | `azd init --template azure-search-openai-demo` |
| "Потрібно відлагодити конкретний ресурс Azure" | `az resource show` |
| "Хочу розгортання готове до продакшену за хвилини" | `azd up --environment production` |

### Вони працюють разом!

AZD використовує Azure CLI "під капотом". Можна користуватись обома:
```bash
# Розгорніть свій додаток за допомогою AZD
azd up

# Потім налаштуйте конкретні ресурси за допомогою Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Знаходьте шаблони в Awesome AZD

Не починайте з нуля! **Awesome AZD** — це колекція спільноти із шаблонів, готових для розгортання:

| Ресурс | Опис |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Переглядайте 200+ шаблонів з розгортанням в один клік |
| 🔗 [**Подати шаблон**](https://github.com/Azure/awesome-azd/issues) | Додайте свій шаблон до спільноти |
| 🔗 [**GitHub-репозиторій**](https://github.com/Azure/awesome-azd) | Відметьте зіркою та досліджуйте вихідний код |

### Популярні AI-шаблони з Awesome AZD

```bash
# RAG-чат із моделями Microsoft Foundry + пошук зі ШІ
azd init --template azure-search-openai-demo

# Швидкий чат-додаток зі ШІ
azd init --template openai-chat-app-quickstart

# Агенти ШІ з агентами Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Початок роботи в 3 кроки

### Крок 1: Встановіть AZD (2 хвилини)

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

### Крок 2: Увійдіть в Azure

```bash
azd auth login
```

### Крок 3: Розгорніть свій перший застосунок

```bash
# Ініціалізувати з шаблону
azd init --template todo-nodejs-mongo

# Розгорнути в Azure (створює все!)
azd up
```

**🎉 Готово!** Ваш застосунок тепер працює в Azure.

### Прибираємо після себе (не забувайте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Як користуватися цим курсом

Цей курс розроблено для **поетапного навчання** — починайте там, де вам зручно, та рухайтесь вперед:

| Ваш досвід | Почніть тут |
|-----------------|------------|
| **Новачок в Azure** | [Розділ 1: Основи](#-chapter-1-foundation--quick-start) |
| **Знаєте Azure, новачок у AZD** | [Розділ 1: Основи](#-chapter-1-foundation--quick-start) |
| **Хочете розгортати AI-застосунки** | [Розділ 2: AI-орієнтована розробка](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Хочете практичних вправ** | [🎓 Інтерактивний воркшоп](workshop/README.md) – керований лабораторний практикум на 3-4 години |
| **Потрібні виробничі патерни** | [Розділ 8: Продакшен та корпоративні патерни](#-chapter-8-production--enterprise-patterns) |

### Швидке налаштування

1. **Форкніть цей репозиторій**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонуйте його**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Отримайте допомогу**: [Спільнота Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Віддаєте перевагу клонувати локально?**

> Цей репозиторій включає понад 50 перекладів мов, що значно збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Це надасть усе необхідне для проходження курсу з набагато швидшим завантаженням.


## Огляд курсу

Опановуйте Azure Developer CLI (azd) через структуровані розділи, розроблені для поетапного навчання. **Особливий акцент на розгортанні AI-застосунків з інтеграцією Microsoft Foundry.**

### Чому цей курс важливий для сучасних розробників

Базуючись на даних спільноти Microsoft Foundry Discord, **45% розробників хочуть використовувати AZD для AI-робочих навантажень**, але зіштовхуються з такими викликами:
- Складні мультисервісні AI-архітектури
- Найкращі практики розгортання AI у продакшені  
- Інтеграція та конфігурація AI-сервісів Azure
- Оптимізація вартості AI-варіантів
- Вирішення проблем специфічних для AI розгортань

### Цілі навчання

Завершивши цей структурований курс, ви:
- **Опануєте основи AZD**: базові поняття, встановлення та налаштування
- **Розгортатимете AI-застосунки**: використовуйте AZD із сервісами Microsoft Foundry
- **Впровадите Infrastructure as Code**: керуйте ресурсами Azure з шаблонами Bicep
- **Вирішуватимете проблеми розгортання**: усувайте поширені помилки та відлагоджуйте
- **Оптимізуєте для продакшену**: безпека, масштабування, моніторинг та управління витратами
- **Створюватиме мультиагентські рішення**: розгортання складних AI-архітектур

## 🗺️ Карта курсу: швидка навігація за розділами

Кожен розділ містить власний README з цілями навчання, швидким стартом та вправами:

| Розділ | Тема | Уроки | Тривалість | Складність |
|---------|-------|---------|----------|------------|
| **[Розділ 1: Основи](docs/chapter-01-foundation/README.md)** | Початок роботи | [Основи AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Встановлення](docs/chapter-01-foundation/installation.md) &#124; [Перший проєкт](docs/chapter-01-foundation/first-project.md) | 30-45 хв | ⭐ |
| **[Розділ 2: Розробка AI](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Інтеграція Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Агенти](docs/chapter-02-ai-development/agents.md) &#124; [Розгортання моделей](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Майстерня](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 год | ⭐⭐ |
| **[Розділ 3: Конфігурація](docs/chapter-03-configuration/README.md)** | Аутентифікація & Безпека | [Конфігурація](docs/chapter-03-configuration/configuration.md) &#124; [Аутентифікація & Безпека](docs/chapter-03-configuration/authsecurity.md) | 45-60 хв | ⭐⭐ |
| **[Розділ 4: Інфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC & Розгортання | [Посібник з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провізія](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 год | ⭐⭐⭐ |
| **[Розділ 5: Багатоагентність](docs/chapter-05-multi-agent/README.md)** | AI Агентські рішення | [Роздрібний сценарій](examples/retail-scenario.md) &#124; [Патерни координації](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[Розділ 6: Перед розгортанням](docs/chapter-06-pre-deployment/README.md)** | Планування & Валідація | [Перевірки перед польотом](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 год | ⭐⭐ |
| **[Розділ 7: Вирішення проблем](docs/chapter-07-troubleshooting/README.md)** | Налагодження & Виправлення | [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Налагодження](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблеми AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 год | ⭐⭐ |
| **[Розділ 8: Продакшн](docs/chapter-08-production/README.md)** | Патерни підприємств | [Практики продакшну](docs/chapter-08-production/production-ai-practices.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[🎓 Майстерня](workshop/README.md)** | Практична лабораторія | [Вступ](workshop/docs/instructions/0-Introduction.md) &#124; [Вибір](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валідація](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкція](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Налаштування](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Зняття інфраструктури](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Підсумок](workshop/docs/instructions/7-Wrap-up.md) | 3-4 год | ⭐⭐ |

**Загальна тривалість курсу:** ~10-14 год | **Прогрес навичок:** Початківець → Готовий до продакшну

---

## 📚 Навчальні Розділи

*Виберіть свій навчальний маршрут залежно від рівня досвіду та цілей*

### 🚀 Розділ 1: Основи та швидкий старт
**Вимоги**: Підписка Azure, базові знання командного рядка  
**Тривалість**: 30-45 хвилин  
**Складність**: ⭐

#### Чого Ви навчитеся
- Основи Azure Developer CLI
- Встановлення AZD на вашу платформу
- Перше успішне розгортання

#### Навчальні ресурси
- **🎯 Почніть тут**: [Що таке Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теорія**: [Основи AZD](docs/chapter-01-foundation/azd-basics.md) - Основні концепції і термінологія
- **⚙️ Налаштування**: [Встановлення та налаштування](docs/chapter-01-foundation/installation.md) - Посібники для платформ
- **🛠️ Практика**: [Ваш перший проект](docs/chapter-01-foundation/first-project.md) - Покрокове навчання
- **📋 Швидке посилання**: [Шпаргалка команд](resources/cheat-sheet.md)

#### Практичні завдання
```bash
# Швидка перевірка встановлення
azd version

# Розгорніть ваш перший додаток
azd init --template todo-nodejs-mongo
azd up
```

**💡 Результат розділу**: Успішно розгорнути простий веб-додаток в Azure за допомогою AZD

**✅ Критерії успіху:**
```bash
# Після завершення Розділу 1 ви повинні вміти:
azd version              # Показує встановлену версію
azd init --template todo-nodejs-mongo  # Ініціалізує проект
azd up                  # Розгортає в Azure
azd show                # Відображає URL запущеного додатку
# Додаток відкривається у браузері і працює
azd down --force --purge  # Очищує ресурси
```

**📊 Витрачений час:** 30-45 хвилин  
**📈 Рівень навичок після:** Можна самостійно розгортати базові додатки

---

### 🤖 Розділ 2: Розробка AI-Першочергових додатків (Рекомендовано для AI розробників)
**Вимоги**: Завершення розділу 1  
**Тривалість**: 1-2 години  
**Складність**: ⭐⭐

#### Чого Ви навчитеся
- Інтеграція Microsoft Foundry з AZD
- Розгортання додатків з AI
- Розуміння конфігурацій AI сервісів

#### Навчальні ресурси
- **🎯 Почніть тут**: [Інтеграція Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Агенти**: [Посібник AI Агентів](docs/chapter-02-ai-development/agents.md) - Розгортання інтелектуальних агентів з AZD
- **📖 Патерни**: [Розгортання AI моделей](docs/chapter-02-ai-development/ai-model-deployment.md) - Розгортання і управління AI моделями
- **🛠️ Майстерня**: [AI Майстерня](docs/chapter-02-ai-development/ai-workshop-lab.md) - Підготуйте AI рішення до AZD
- **🎥 Інтерактивний посібник**: [Матеріали майстерні](workshop/README.md) - Навчання в браузері з MkDocs * DevContainer
- **📋 Шаблони**: [Шаблони Microsoft Foundry](#ресурси-майстер-класу)
- **📝 Приклади**: [Приклади розгортання AZD](examples/README.md)

#### Практичні завдання
```bash
# Розгорніть ваш перший AI-додаток
azd init --template azure-search-openai-demo
azd up

# Спробуйте додаткові AI-шаблони
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Результат розділу**: Розгорнути та налаштувати AI-чат з можливостями RAG

**✅ Критерії успіху:**
```bash
# Після розділу 2 ви повинні вміти:
azd init --template azure-search-openai-demo
azd up
# Тестувати інтерфейс чат-бота зі штучним інтелектом
# Задавати питання та отримувати відповіді від ШІ з джерелами
# Перевірити роботу інтеграції пошуку
azd monitor  # Переконатися, що Application Insights показує телеметрію
azd down --force --purge
```

**📊 Витрачений час:** 1-2 години  
**📈 Рівень навичок після:** Можна розгортати і налаштовувати AI-додатки готові для продакшну  
**💰 Усвідомлення вартості:** Знати про витрати на розробку 80-150$/місяць, продакшн 300-3500$/місяць

#### 💰 Вартість розгортання AI

**Середовище розробки (Оцінка 80-150$/місяць):**
- Моделі Microsoft Foundry (оплата за використання): 0-50$/місяць (залежно від споживання токенів)
- AI Пошук (базовий рівень): 75$/місяць
- Container Apps (споживання): 0-20$/місяць
- Сховище (стандартне): 1-5$/місяць

**Середовище продакшн (Оцінка 300-3500+$/місяць):**
- Моделі Microsoft Foundry (PTU для стабільної продуктивності): від 3000$/місяць АБО оплата за використання з великим обсягом
- AI Пошук (стандартний рівень): 250$/місяць
- Container Apps (виділені): 50-100$/місяць
- Application Insights: 5-50$/місяць
- Сховище (преміум): 10-50$/місяць

**💡 Поради для оптимізації витрат:**
- Використовуйте **безкоштовний рівень** Microsoft Foundry для навчання (включено 50 000 токенів Azure OpenAI)
- Запускайте `azd down` щоб звільнити ресурси, коли не розробляєте
- Починайте з білінгу за споживанням, переходьте на PTU лише для продакшн
- Використовуйте `azd provision --preview`, щоб оцінити витрати перед розгортанням
- Увімкніть автмасштабування: платіть лише за фактичне використання

**Моніторинг витрат:**
```bash
# Перевірте оцінені щомісячні витрати
azd provision --preview

# Контролюйте фактичні витрати в Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Розділ 3: Конфігурація & Аутентифікація
**Вимоги**: Завершення розділу 1  
**Тривалість**: 45-60 хвилин  
**Складність**: ⭐⭐

#### Чого Ви навчитеся
- Конфігурація і управління середовищем
- Кращі практики аутентифікації та безпеки
- Іменування і організація ресурсів

#### Навчальні ресурси
- **📖 Конфігурація**: [Посібник по конфігурації](docs/chapter-03-configuration/configuration.md) - Налаштування середовища
- **🔐 Безпека**: [Патерни аутентифікації та керовані ідентичності](docs/chapter-03-configuration/authsecurity.md) - Патерни аутентифікації
- **📝 Приклади**: [Приклад додатку з базою даних](examples/database-app/README.md) - Приклади баз даних AZD

#### Практичні завдання
- Налаштуйте кілька середовищ (dev, staging, prod)
- Встановіть аутентифікацію через керовану ідентичність
- Реалізуйте конфігурації для різних середовищ

**💡 Результат розділу**: Керуйте різними середовищами з коректною аутентифікацією і безпекою

---

### 🏗️ Розділ 4: Інфраструктура як код & Розгортання
**Вимоги**: Завершення розділів 1-3  
**Тривалість**: 1-1.5 год  
**Складність**: ⭐⭐⭐

#### Чого Ви навчитеся
- Просунуті патерни розгортання
- Інфраструктура як код з Bicep
- Стратегії провізії ресурсів

#### Навчальні ресурси
- **📖 Розгортання**: [Посібник з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) - Повні робочі процеси
- **🏗️ Провізія**: [Провізія ресурсів](docs/chapter-04-infrastructure/provisioning.md) - Управління ресурсами Azure
- **📝 Приклади**: [Приклад контейнерного додатку](../../examples/container-app) - Розгортання контейнерів

#### Практичні завдання
- Створіть кастомні шаблони Bicep
- Розгорніть мультисервісні додатки
- Реалізуйте стратегії блакитно-зеленого розгортання

**💡 Результат розділу**: Розгорнути складні мультисервісні додатки з користувацькими інфраструктурними шаблонами

---

### 🎯 Розділ 5: AI рішення з багатьма агентами (Просунутий рівень)
**Вимоги**: Завершення розділів 1-2  
**Тривалість**: 2-3 години  
**Складність**: ⭐⭐⭐⭐

#### Чого Ви навчитеся
- Патерни архітектури багатьох агентів
- Оркестрація та координація агентів
- Продакшн-готові AI розгортання

#### Навчальні ресурси
- **🤖 Основний проєкт**: [Рішення для роздрібної торгівлі з багатьма агентами](examples/retail-scenario.md) - Повна реалізація
- **🛠️ ARM шаблони**: [Пакет ARM шаблонів](../../examples/retail-multiagent-arm-template) - Розгортання в один клік
- **📖 Архітектура**: [Патерни координації багатьох агентів](docs/chapter-06-pre-deployment/coordination-patterns.md) - Патерни

#### Практичні завдання
```bash
# Розгорнути повне роздрібне рішення з кількома агентами
cd examples/retail-multiagent-arm-template
./deploy.sh

# Дослідити конфігурації агентів
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Результат розділу**: Розгорнути й керувати багатофункціональним AI рішенням з агентами клієнтів і інвентарю

---

### 🔍 Розділ 6: Валідація та планування перед розгортанням
**Вимоги**: Завершення розділу 4  
**Тривалість**: 1 год  
**Складність**: ⭐⭐

#### Чого Ви навчитеся
- Планування потужностей та валідація ресурсів
- Стратегії вибору SKU
- Перевірки перед розгортанням та автоматизація

#### Навчальні ресурси
- **📊 Планування**: [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md) - Валідація ресурсів
- **💰 Вибір**: [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Вартісно-ефективні рішення
- **✅ Валідація**: [Перевірки перед розгортанням](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматичні скрипти

#### Практичні завдання
- Запустіть скрипти для валідації потужностей
- Оптимізуйте вибір SKU для зниження витрат
- Реалізуйте автоматизовані перевірки перед розгортанням

**💡 Результат розділу**: Перевірити й оптимізувати розгортання перед виконанням

---

### 🚨 Розділ 7: Вирішення проблем & Налагодження
**Вимоги**: Закінчений будь-який розділ з розгортання  
**Тривалість**: 1-1.5 год  
**Складність**: ⭐⭐

#### Чого Ви навчитеся
- Системний підхід до налагодження
- Поширені проблеми та рішення
- Спеціалізоване налагодження AI

#### Навчальні ресурси
- **🔧 Поширені проблеми**: [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) - FAQ та рішення
- **🕵️ Налагодження**: [Посібник з налагодження](docs/chapter-07-troubleshooting/debugging.md) - Покрокові стратегії
- **🤖 Проблеми AI**: [Налагодження AI-сервісів](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми AI сервісів

#### Практичні завдання
- Діагностуйте помилки розгортання
- Вирішіть проблеми з аутентифікацією
- Налагоджуйте підключення AI сервісів

**💡 Результат розділу**: Самостійно діагностувати і вирішувати поширені проблеми розгортання

---

### 🏢 Розділ 8: Продакшн & Патерни підприємств
**Вимоги**: Завершення розділів 1-4  
**Тривалість**: 2-3 години  
**Складність**: ⭐⭐⭐⭐

#### Чого Ви навчитеся
- Стратегії розгортання в продакшн
- Патерни безпеки підприємства
- Моніторинг та оптимізація витрат

#### Навчальні ресурси
- **🏭 Виробництво**: [Найкращі практики виробництва ШІ](docs/chapter-08-production/production-ai-practices.md) - Патерни корпоративного рівня
- **📝 Приклади**: [Приклад мікросервісів](../../examples/microservices) - Складні архітектури
- **📊 Моніторинг**: [Інтеграція Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Моніторинг

#### Практичні вправи
- Реалізуйте корпоративні патерни безпеки
- Налаштуйте комплексний моніторинг
- Розгорніть у виробництві з належним управлінням

**💡 Результат розділу**: Розгорніть корпоративні додатки з повним виробничим функціоналом

---

## 🎓 Огляд майстер-класу: Практичний досвід навчання

> **⚠️ СТАН МАЙСТЕР-КЛАСУ: Активна розробка**  
> Матеріали майстер-класу наразі розробляються та удосконалюються. Основні модулі функціональні, але деякі розділи на просунутому рівні ще не завершені. Ми активно працюємо над повним завершенням контенту. [Відстежити прогрес →](workshop/README.md)

### Інтерактивні матеріали майстер-класу
**Повноцінне практичне навчання з інструментами в браузері та покроковими вправами**

Наші матеріали забезпечують структурований, інтерактивний досвід, що доповнює навчальну програму за розділами вище. Майстер-клас розрахований як на самостійне навчання, так і на заняття під керівництвом викладача.

#### 🛠️ Особливості майстер-класу
- **Інтерфейс у браузері**: Повний майстер-клас на базі MkDocs з пошуком, копіюванням і темами
- **Інтеграція з GitHub Codespaces**: Одним кліком настройки середовища розробки
- **Структурований навчальний шлях**: 8 модулів із покроковими вправами (загалом 3-4 години)
- **Прогресивна методологія**: Вступ → Вибір → Перевірка → Аналіз → Конфігурація → Налаштування → Завершення → Підсумок
- **Інтерактивне середовище DevContainer**: Передналаштовані інструменти та залежності

#### 📚 Структура модулів майстер-класу
Майстер-клас базується на **8-модульній прогресивній методології**, що веде вас від ознайомлення до майстерності розгортання:

| Модуль | Тема | Що ви зробите | Тривалість |
|--------|-------|----------------|------------|
| **0. Вступ** | Огляд майстер-класу | Ознайомлення з цілями навчання, вимогами та структурою | 15 хв |
| **1. Вибір** | Пошук шаблонів | Дослідження AZD-шаблонів і вибір відповідного ШІ шаблону для вашого сценарію | 20 хв |
| **2. Перевірка** | Розгортання та підтвердження | Розгортання шаблону командою `azd up` та перевірка працездатності інфраструктури | 30 хв |
| **3. Аналіз** | Розуміння структури | Використання GitHub Copilot для дослідження архітектури шаблону, файлів Bicep і організації коду | 30 хв |
| **4. Конфігурація** | Детальний огляд azure.yaml | Опановуйте конфігурацію `azure.yaml`, lifecycle hooks і змінні середовища | 30 хв |
| **5. Налаштування** | Персоналізація | Увімкнення AI Search, трасування, оцінки та налаштування під ваш сценарій | 45 хв |
| **6. Завершення** | Очищення | Безпечне видалення ресурсів командою `azd down --purge` | 15 хв |
| **7. Підсумок** | Наступні кроки | Підбиття підсумків, повторення ключових концепцій та подальше навчання | 15 хв |

**Послідовність майстер-класу:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Початок роботи з майстер-класом
```bash
# Варіант 1: GitHub Codespaces (Рекомендовано)
# Натисніть "Code" → "Створити codespace на main" в репозиторії

# Варіант 2: Локальна розробка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Виконайте інструкції з налаштування у workshop/README.md
```

#### 🎯 Результати навчання майстер-класу
Виконавши майстер-клас, учасники зможуть:
- **Розгорнути ШІ-додатки виробничого рівня**: Використовувати AZD з сервісами Microsoft Foundry
- **Опановувати багатодовірні архітектури**: Реалізувати скоординовані рішення з агентами ШІ
- **Впроваджувати найкращі практики безпеки**: Налаштовувати автентифікацію та контроль доступу
- **Оптимізувати масштабування**: Проєктувати ефективні за вартістю та продуктивні розгортання
- **Вирішувати проблеми розгортання**: Самостійно усувати поширені проблеми

#### 📖 Ресурси майстер-класу
- **🎥 Інтерактивний посібник**: [Матеріали майстер-класу](workshop/README.md) - Навчальне середовище у браузері
- **📋 Покрокові інструкції за модулями**:
  - [0. Вступ](workshop/docs/instructions/0-Introduction.md) - Огляд і цілі
  - [1. Вибір](workshop/docs/instructions/1-Select-AI-Template.md) - Пошук і вибір ШІ шаблонів
  - [2. Перевірка](workshop/docs/instructions/2-Validate-AI-Template.md) - Розгортання і перевірка шаблонів
  - [3. Аналіз](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Дослідження архітектури шаблонів
  - [4. Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) - Майстерність роботи з azure.yaml
  - [5. Налаштування](workshop/docs/instructions/5-Customize-AI-Template.md) - Персоналізація під ваш сценарій
  - [6. Завершення](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очищення ресурсів
  - [7. Підсумок](workshop/docs/instructions/7-Wrap-up.md) - Підбиття підсумків і подальші кроки
- **🛠️ AI Workshop Lab**: [Лабораторія AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вправи зі ШІ
- **💡 Швидкий старт**: [Керівництво з налаштування майстер-класу](workshop/README.md#quick-start) - Налаштування середовища

**Ідеально підходить для**: Корпоративного навчання, університетських курсів, самостійного навчання та розробницьких буткемпів.

---

## 📖 Детальний огляд: Можливості AZD

Поза базовими функціями AZD надає потужні можливості для виробничих розгортань:

- **Розгортання на основі шаблонів** - Використання готових шаблонів для поширених патернів додатків
- **Інфраструктура як код** - Управління ресурсами Azure за допомогою Bicep або Terraform  
- **Інтегровані робочі процеси** - Безшовне створення, розгортання та моніторинг додатків
- **Дружній до розробників** - Оптимізовано для продуктивності та досвіду розробника

### **AZD + Microsoft Foundry: ідеально для розгортань ШІ**

**Чому обирають AZD для рішень ШІ?** AZD вирішує найголовніші виклики розробників ШІ:

- **Готові шаблони ШІ** - Попередньо налаштовані шаблони для Microsoft Foundry Models, Cognitive Services і ML-навантажень
- **Безпечні розгортання ШІ** - Вбудовані патерни безпеки для сервісів ШІ, ключів API та кінцевих точок моделей  
- **Патерни виробничого ШІ** - Найкращі практики масштабованих, економічних розгортань ШІ-додатків
- **Повний робочий процес ШІ** - Від розробки моделей до виробничого розгортання з належним моніторингом
- **Оптимізація витрат** - Розумне розподілення ресурсів та масштабування для ШІ-навантажень
- **Інтеграція з Microsoft Foundry** - Безшовне підключення до каталогу моделей і кінцевих точок Microsoft Foundry

---

## 🎯 Бібліотека шаблонів і прикладів

### Рекомендовано: Шаблони Microsoft Foundry
**Починайте тут, якщо розгортаєте ШІ-додатки!**

> **Примітка:** Ці шаблони демонструють різні патерни ШІ. Деякі з них - зовнішні приклади Azure Samples, інші - локальні реалізації.

| Шаблон | Розділ | Складність | Сервіси | Тип |
|--------|---------|------------|----------|------|
| [**Розпочати чат ШІ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Зовнішній |
| [**Розпочати з агентів ШІ**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Розділ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Зовнішній |
| [**Демо Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Зовнішній |
| [**Швидкий старт OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Зовнішній |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Зовнішній |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Зовнішній |
| [**Роздрібне багато-агентне рішення**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локальний** |

### Рекомендовано: Повні навчальні сценарії
**Корпоративні шаблони додатків, зіставлені з навчальними розділами**

| Шаблон | Навчальний розділ | Складність | Основне навчання |
|--------|------------------|------------|------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | Базові патерни розгортання ШІ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | Реалізація RAG з Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Розділ 4 | ⭐⭐ | Інтеграція Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | Фреймворк агента і виклики функцій |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐ | Корпоративна оркестрація ШІ |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | Багатоагентна архітектура з агетами клієнта і запасів |

### Навчання за типом прикладів

> **📌 Локальні проти зовнішніх прикладів:**  
> **Локальні приклади** (у цьому репозиторії) = готові до використання негайно  
> **Зовнішні приклади** (Azure Samples) = клонування з пов’язаних репозиторіїв

#### Локальні приклади (готові до використання)
- [**Роздрібне багато-агентне рішення**](examples/retail-scenario.md) - Повна реалізація, готова до виробництва, з ARM шаблонами
  - Багатоагентна архітектура (агенти Клієнта і Запасів)
  - Комплексний моніторинг і оцінка
  - Розгортання одним кліком через ARM шаблон

#### Локальні приклади - контейнерні додатки (розділи 2-5)
**Повні приклади контейнерного розгортання у цьому репозиторії:**
- [**Приклади контейнерних додатків**](examples/container-app/README.md) - Повний посібник з контейнеризованих розгортань
  - [Простий Flask API](../../examples/container-app/simple-flask-api) - Базове REST API із масштабуванням до нуля
  - [Архітектура мікросервісів](../../examples/container-app/microservices) - Готове до виробництва розгортання з багатьма сервісами
  - Швидкий старт, виробництво та просунуті патерни розгортання
  - Моніторинг, безпека та рекомендації з оптимізації витрат

#### Зовнішні приклади - прості застосунки (розділи 1-2)
**Клонуйте ці Azure Samples репозиторії, щоб почати:**
- [Простий веб-додаток - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Базові патерни розгортання
- [Статичний вебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Розгортання статичного контенту
- [Контейнерний додаток - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Розгортання REST API

#### Зовнішні приклади - інтеграція баз даних (розділи 3-4)  
- [Додаток БД - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Патерни підключення до баз даних
- [Функції + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсерверні робочі процеси даних

#### Зовнішні приклади - просунуті патерни (розділи 4-8)
- [Java мікросервіси](https://github.com/Azure-Samples/java-microservices-aca-lab) - Багатосервісні архітектури
- [Контейнерні завдання](https://github.com/Azure-Samples/container-apps-jobs) - Фонові процеси  
- [Корпоративний ML трубопровід](https://github.com/Azure-Samples/mlops-v2) - Готові до виробництва ML патерни

### Зовнішні колекції шаблонів
- [**Офіційна галерея шаблонів AZD**](https://azure.github.io/awesome-azd/) - Кураторська колекція офіційних та спільнотних шаблонів
- [**Шаблони Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документація Microsoft Learn по шаблонам
- [**Каталог прикладів**](examples/README.md) - Локальні навчальні приклади з докладним описом

---

## 📚 Ресурси та посилання до навчання

### Швидкі посилання
- [**Шпаргалка команд**](resources/cheat-sheet.md) - Основні команди azd, згруповані за розділами
- [**Глосарій**](resources/glossary.md) - Терміни Azure та azd  
- [**Часті питання**](resources/faq.md) - Поширені запитання за навчальними розділами
- [**Посібник для практики**](resources/study-guide.md) - Комплексні вправи для практики

### Практичні майстер-класи
- [**Лабораторія ШІ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Зробіть ваші рішення ШІ готовими до розгортання через AZD (2-3 години)
- [**Інтерактивний майстер-клас**](workshop/README.md) - Покрокові вправи у 8 модулях з MkDocs та GitHub Codespaces
  - Послідовність: Вступ → Вибір → Перевірка → Аналіз → Конфігурація → Налаштування → Завершення → Підсумок

### Зовнішні навчальні ресурси
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор цін Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Навички AI-агента для вашого редактора
- [**Навички Microsoft Azure на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) — 37 відкритих навичок агента для Azure AI, Foundry, розгортання, діагностики, оптимізації витрат та іншого. Встановіть їх у GitHub Copilot, Cursor, Claude Code або будь-якому підтримуваному агенті:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Швидкий посібник з усунення неполадок

**Поширені проблеми новачків та швидкі рішення:**

<details>
<summary><strong>❌ "azd: команда не знайдена"</strong></summary>

```bash
# Спочатку встановіть AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Перевірте встановлення
azd version
```
</details>

<details>
<summary><strong>❌ "Підписка не знайдена" або "Підписка не встановлена"</strong></summary>

```bash
# Перелічити доступні підписки
az account list --output table

# Встановити підписку за замовчуванням
az account set --subscription "<subscription-id-or-name>"

# Встановити для середовища AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Перевірити
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" або "Квота перевищена"</strong></summary>

```bash
# Спробуйте інший регіон Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Або використовуйте менші SKU під час розробки
# Редагуйте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" не вдається виконати до кінця</strong></summary>

```bash
# Варіант 1: Очистити та повторити спробу
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
<summary><strong>❌ "Аутентифікація не виконана" або "Токен застарів"</strong></summary>

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
# AZD генерує унікальні імена, але у разі конфлікту:
azd down --force --purge

# Тоді повторіть спробу з новим середовищем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Розгортання шаблону займає надто багато часу</strong></summary>

**Нормальний час очікування:**
- Простий веб-додаток: 5-10 хвилин
- Додаток із базою даних: 10-15 хвилин
- AI-додатки: 15-25 хвилин (постачання OpenAI повільне)

```bash
# Перевірте прогрес
azd show

# Якщо застрягли більше ніж на 30 хвилин, перевірте Azure Portal:
azd monitor
# Шукайте невдалі розгортання
```
</details>

<details>
<summary><strong>❌ "Дозвіл відмовлено" або "Заборонено"</strong></summary>

```bash
# Перевірте свою роль в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Вам потрібна принаймні роль "Співавтор"
# Попросіть вашого адміністратора Azure надати:
# - Співавтор (для ресурсів)
# - Адміністратор доступу користувача (для призначень ролей)
```
</details>

<details>
<summary><strong>❌ Неможливо знайти URL розгорнутого додатку</strong></summary>

```bash
# Показати всі кінцеві точки сервісу
azd show

# Або відкрити портал Azure
azd monitor

# Перевірити конкретний сервіс
azd env get-values
# Шукати змінні *_URL
```
</details>

### 📚 Повні ресурси з усунення неполадок

- **Посібник з поширених проблем:** [Докладні рішення](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, пов'язані з AI:** [Усунення неполадок AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Посібник з налагодження:** [Покрокове налагодження](docs/chapter-07-troubleshooting/debugging.md)
- **Отримати допомогу:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершення курсу та сертифікація

### Відстеження прогресу
Відстежуйте свій прогрес навчання в кожному розділі:

- [ ] **Розділ 1**: Основи та швидкий старт ✅
- [ ] **Розділ 2**: Розробка AI-першої ✅  
- [ ] **Розділ 3**: Конфігурація та аутентифікація ✅
- [ ] **Розділ 4**: Інфраструктура як код та розгортання ✅
- [ ] **Розділ 5**: Багатоагентні AI рішення ✅
- [ ] **Розділ 6**: Верифікація та планування перед розгортанням ✅
- [ ] **Розділ 7**: Усунення неполадок та налагодження ✅
- [ ] **Розділ 8**: Продакшн та корпоративні шаблони ✅

### Підтвердження знань
Після завершення кожного розділу перевірте свої знання шляхом:
1. **Практичного завдання**: Завершення практичного розгортання розділу
2. **Перевірки знань**: Огляду секції FAQ вашого розділу
3. **Обговорення в спільноті**: Поділіться досвідом в Azure Discord
4. **Наступний розділ**: Перехід до наступного рівня складності

### Переваги завершення курсу
Після проходження всіх розділів ви отримаєте:
- **Досвід у продакшні**: Розгорнуті реальні AI-додатки в Azure
- **Професійні навички**: Можливості розгортання корпоративного рівня  
- **Визнання в спільноті**: Активний учасник спільноти розробників Azure
- **Кар'єрне зростання**: Популярні навички AZD і розгортання AI

---

## 🤝 Спільнота та підтримка

### Отримання допомоги та підтримки
- **Технічні питання**: [Повідомити про баги та запити функцій](https://github.com/microsoft/azd-for-beginners/issues)
- **Питання з навчання**: [Спільнота Microsoft Azure Discord](https://discord.gg/microsoft-azure) та [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Допомога по AI**: Приєднуйтесь до [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документація**: [Офіційна документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Інформація зі спільноти Microsoft Foundry Discord

**Останні результати опитування каналу #Azure:**
- **45%** розробників хочуть використовувати AZD для AI-навантажень
- **Основні виклики**: Розгортання з багатьма сервісами, управління обліковими даними, готовність до продакшн  
- **Найчастіші запити**: AI-специфічні шаблони, посібники з усунення проблем, найкращі практики

**Приєднуйтесь до нашої спільноти, щоб:**
- Ділитися досвідом AZD + AI і отримувати підтримку
- Отримувати ранні прев'ю нових AI-шаблонів
- Вносити свій вклад в найкращі практики розгортання AI
- Впливати на майбутній розвиток функцій AI + AZD

### Внесок у курс
Ми радо приймаємо внески! Будь ласка, прочитайте наш [Посібник для учасників](CONTRIBUTING.md) для деталей щодо:
- **Поліпшення контенту**: Покращення існуючих розділів та прикладів
- **Нові приклади**: Додавання реальних сценаріїв та шаблонів  
- **Переклад**: Допомога в підтримці багатомовності
- **Звіти про помилки**: Підвищення точності та зрозумілості
- **Стандарти спільноти**: Дотримання наших інклюзивних правил спільноти

---

## 📄 Інформація про курс

### Ліцензія
Цей проєкт ліцензовано за ліцензією MIT — див. файл [LICENSE](../../LICENSE) для детальної інформації.

### Пов’язані ресурси Microsoft Learning

Наша команда створює інші комплексні навчальні курси:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серія Generative AI
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основне навчання
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серія Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навігація курсом

**🚀 Готові почати навчання?**

**Початківці**: Почніть з [Розділ 1: Основи та швидкий старт](#-chapter-1-foundation--quick-start)  
**Розробники AI**: Перейдіть до [Розділ 2: Розробка з фокусом на AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Досвідчені розробники**: Починайте з [Розділ 3: Конфігурація та автентифікація](#️-chapter-3-configuration--authentication)

**Наступні кроки**: [Почати Розділ 1 - Основи AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу машинного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний переклад людиною. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->