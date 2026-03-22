# AZD для початківців: структурована навчальна подорож

![AZD-for-beginners](../../translated_images/uk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматизовані переклади (завжди актуальні)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](./README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Віддаєте перевагу клонувати локально?**
>
> Цей репозиторій містить понад 50 мовних перекладів, що значно збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте sparse checkout:
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
> Це дасть вам усе необхідне для проходження курсу з набагато швидшим завантаженням.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Що нового в azd сьогодні

Azure Developer CLI вийшов за межі традиційних веб-додатків і API. Сьогодні azd — це єдиний інструмент для розгортання **будь-яких** застосунків в Azure — включно з AI-додатками та інтелектуальними агентами.

Ось що це означає для вас:

- **AI-агенти тепер є першокласними завданнями azd.** Ви можете ініціалізувати, розгортати та керувати AI-агентами, використовуючи той самий робочий процес `azd init` → `azd up`, який ви вже знаєте.
- **Інтеграція Microsoft Foundry** додає розгортання моделей, хостинг агентів та конфігурацію AI-сервісів безпосередньо у екосистему шаблонів azd.
- **Основний робочий процес не змінився.** Незалежно від того, розгортаєте ви todo-додаток, мікросервіс чи мультиагентське AI-рішення — команди залишаються однаковими.

Якщо ви вже користувались azd, підтримка AI — це логічне розширення, а не окремий інструмент чи просунутий трек. Якщо ви починаєте з нуля, ви вивчите один робочий процес, який підходить для всього.

---

## 🚀 Що таке Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — це зручний для розробників інструмент командного рядка, який спрощує розгортання застосунків в Azure. Замість того, щоб вручну створювати та підключати десятки ресурсів Azure, ви можете розгорнути цілий застосунок однією командою.

### Магія `azd up`

```bash
# Ця одна команда робить усе:
# ✅ Створює всі ресурси Azure
# ✅ Налаштовує мережу та безпеку
# ✅ Збирає код вашого додатка
# ✅ Розгортає в Azure
# ✅ Надає вам робочу URL-адресу
azd up
```

**Ось і все!** Ніяких кліків в Azure Portal, ніяких складних ARM-шаблонів, які треба вивчати, ніяких ручних налаштувань — лише працюючі застосунки в Azure.

---

## ❓ Azure Developer CLI проти Azure CLI: у чому різниця?

Це найпоширеніше питання серед початківців. Ось проста відповідь:

| Особливість | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|-------------|---------------------|--------------------------------|
| **Призначення** | Керування окремими ресурсами Azure | Розгортання повних застосунків |
| **Підхід** | Орієнтований на інфраструктуру | Орієнтований на застосунок |
| **Приклад** | `az webapp create --name myapp...` | `azd up` |
| **Крива навчання** | Потрібно знати сервіси Azure | Потрібно знати свій застосунок |
| **Для кого краще** | DevOps, Інфраструктура | Розробники, Прототипування |

### Проста аналогія

- **Azure CLI** — це як мати всі інструменти для будівництва будинку — молотки, пили, цвяхи. Можна побудувати що завгодно, але потрібно знати будівництво.
- **Azure Developer CLI** — це як найняти підрядника — ви описуєте, що хочете, а він займається будівництвом.

### Коли що використовувати

| Сценарій | Використовуйте це |
|----------|------------------|
| "Хочу швидко розгорнути свій веб-застосунок" | `azd up` |
| "Потрібно створити лише обліковий запис зберігання" | `az storage account create` |
| "Я будую повний AI-застосунок" | `azd init --template azure-search-openai-demo` |
| "Потрібно налагодити конкретний ресурс Azure" | `az resource show` |
| "Потрібно розгортання, готове до продакшену за хвилини" | `azd up --environment production` |

### Вони працюють разом!

AZD використовує Azure CLI під капотом. Ви можете користуватися обома:
```bash
# Розгорніть свій додаток за допомогою AZD
azd up

# Потім налаштуйте конкретні ресурси за допомогою Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Знайдіть шаблони на Awesome AZD

Не починайте з нуля! **Awesome AZD** — це спільнотна колекція готових до розгортання шаблонів:

| Ресурс | Опис |
|--------|------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Переглядайте понад 200 шаблонів із розгортанням у один клік |
| 🔗 [**Надіслати шаблон**](https://github.com/Azure/awesome-azd/issues) | Приймайте участь, додавайте власні шаблони для спільноти |
| 🔗 [**Репозиторій GitHub**](https://github.com/Azure/awesome-azd) | Поставте зірку та досліджуйте вихідний код |

### Популярні AI-шаблони з Awesome AZD

```bash
# RAG-чат із моделями Microsoft Foundry і пошуком на основі ШІ
azd init --template azure-search-openai-demo

# Швидкий чат-додаток зі ШІ
azd init --template openai-chat-app-quickstart

# Агенти ШІ з агентами Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Початок роботи у 3 кроки

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

### Крок 2: Увійдіть до Azure

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

**🎉 Ось і все!** Ваш застосунок тепер працює в Azure.

### Прибрати (не забудьте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Як користуватися цим курсом

Цей курс розроблено для **послідовного навчання** — починайте там, де вам комфортно, і рухайтесь вперед:

| Ваш досвід | Починайте тут |
|------------|---------------|
| **Повний новачок в Azure** | [Розділ 1: Основи](#-chapter-1-foundation--quick-start) |
| **Знаєте Azure, але новачок в AZD** | [Розділ 1: Основи](#-chapter-1-foundation--quick-start) |
| **Хочете розгортати AI-застосунки** | [Розділ 2: AI-перший розвиток](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Хочете практичних занять** | [🎓 Інтерактивний воркшоп](workshop/README.md) — лабораторія тривалістю 3-4 години |
| **Потрібні продакшенові патерни** | [Розділ 8: Продакшен & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Швидке налаштування

1. **Форкніть цей репозиторій**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонуйте його**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Отримайте допомогу**: [Спільнота Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Віддаєте перевагу клонувати локально?**

> Цей репозиторій містить понад 50 мовних перекладів, що значно збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Це дасть вам усе необхідне для проходження курсу з набагато швидшим завантаженням.


## Огляд курсу

Опануйте Azure Developer CLI (azd) через структуровані розділи, створені для послідовного навчання. **Особлива увага приділена розгортанню AI-застосунків з інтеграцією Microsoft Foundry.**

### Чому цей курс важливий для сучасних розробників

Відповідно до даних спільноти Microsoft Foundry Discord, **45% розробників хочуть використовувати AZD для AI-навантажень**, але стикаються з такими викликами:
- Складні мультисервісні AI-архітектури
- Найкращі практики розгортання AI у продакшені  
- Інтеграція та конфігурація AI-сервісів Azure
- Оптимізація вартості AI-навантажень
- Вирішення специфічних проблем розгортання AI

### Навчальні цілі

Завершивши цей структурований курс, ви:
- **Опануєте основи AZD**: ключові концепції, встановлення та конфігурація
- **Розгортатимете AI-застосунки** з використанням сервісів Microsoft Foundry
- **Реалізуєте інфраструктуру як код**: керування ресурсами Azure за допомогою шаблонів Bicep
- **Вирішуватимете проблеми розгортання**: усунення поширених помилок і налагодження
- **Оптимізуєте для продакшену**: безпека, масштабування, моніторинг і управління витратами
- **Створюватимете мультиагентські рішення**: розгортання складних AI-архітектур

## 🗺️ Карта курсу: швидка навігація за розділами

Кожен розділ має власний README з навчальними цілями, швидким стартом та вправами:

| Розділ | Тема | Уроки | Тривалість | Складність |
|--------|------|-------|------------|------------|
| **[Розд. 1: Основи](docs/chapter-01-foundation/README.md)** | Початок роботи | [Основи AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Встановлення](docs/chapter-01-foundation/installation.md) &#124; [Перший проєкт](docs/chapter-01-foundation/first-project.md) | 30-45 хв | ⭐ |
| **[Розділ 2: Розробка ШІ](docs/chapter-02-ai-development/README.md)** | AI-перші додатки | [Інтеграція Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Агенти ШІ](docs/chapter-02-ai-development/agents.md) &#124; [Розгортання моделей](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Лабораторія](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 год | ⭐⭐ |
| **[Розділ 3: Конфігурація](docs/chapter-03-configuration/README.md)** | Аутентифікація & Безпека | [Конфігурація](docs/chapter-03-configuration/configuration.md) &#124; [Аутентифікація & Безпека](docs/chapter-03-configuration/authsecurity.md) | 45-60 хв | ⭐⭐ |
| **[Розділ 4: Інфраструктура](docs/chapter-04-infrastructure/README.md)** | Інфраструктура як Код & Розгортання | [Інструкція з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провізіонування](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 год | ⭐⭐⭐ |
| **[Розділ 5: Багатоагентні рішення](docs/chapter-05-multi-agent/README.md)** | Рішення з AI агентами | [Сценарій для рітейлу](examples/retail-scenario.md) &#124; [Патерни координації](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[Розділ 6: Передрозгортання](docs/chapter-06-pre-deployment/README.md)** | Планування & Валідaція | [Передпольотні перевірки](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 год | ⭐⭐ |
| **[Розділ 7: Виправлення помилок](docs/chapter-07-troubleshooting/README.md)** | Налагодження & Виправлення | [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Налагодження](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблеми ШІ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 год | ⭐⭐ |
| **[Розділ 8: Продуктивність](docs/chapter-08-production/README.md)** | Корпоративні патерни | [Практики продуктивності](docs/chapter-08-production/production-ai-practices.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[🎓 Лабораторія](workshop/README.md)** | Практична лабораторія | [Вступ](workshop/docs/instructions/0-Introduction.md) &#124; [Вибір](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валідaція](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Аналіз](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Налаштування](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Демонтaж](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Підсумок](workshop/docs/instructions/7-Wrap-up.md) | 3-4 год | ⭐⭐ |

**Загальна тривалість курсу:** ~10-14 год | **Рівень навичок:** Початковий → Готовий до продуктивності

---

## 📚 Розділи для навчання

*Обирайте шлях навчання відповідно до рівня досвіду та цілей*

### 🚀 Розділ 1: Основи та швидкий старт
**Вимоги:** підписка Azure, базові знання командного рядка  
**Тривалість:** 30-45 хвилин  
**Складність:** ⭐

#### Чого ви навчитеся
- Основи Azure Developer CLI
- Встановлення AZD на вашу платформу
- Перше успішне розгортання

#### Навчальні ресурси
- **🎯 Початок тут**: [Що таке Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теорія**: [Основи AZD](docs/chapter-01-foundation/azd-basics.md) – ключові поняття і термінологія
- **⚙️ Налаштування**: [Встановлення і налаштування](docs/chapter-01-foundation/installation.md) – інструкції для платформи
- **🛠️ Практика**: [Ваш перший проєкт](docs/chapter-01-foundation/first-project.md) – покроковий посібник
- **📋 Шпаргалка**: [Чіт-лист команд](resources/cheat-sheet.md)

#### Практичні завдання
```bash
# Швидка перевірка встановлення
azd version

# Розгорніть вашу першу програму
azd init --template todo-nodejs-mongo
azd up
```

**💡 Результат розділу**: Успішно розгорнути простий веб-додаток у Azure за допомогою AZD

**✅ Критерії успішності:**
```bash
# Після завершення Розділу 1 ви повинні вміти:
azd version              # Показує встановлену версію
azd init --template todo-nodejs-mongo  # Ініціалізує проєкт
azd up                  # Розгортає в Azure
azd show                # Відображає URL запущеного додатку
# Додаток відкривається в браузері і працює
azd down --force --purge  # Очищає ресурси
```

**📊 Час на навчання:** 30-45 хвилин  
**📈 Рівень навичок після:** Вміє самостійно розгортати базові додатки

---

### 🤖 Розділ 2: AI-перший розвиток (Рекомендовано для розробників ШІ)
**Вимоги:** Розділ 1 пройдений  
**Тривалість:** 1-2 год  
**Складність:** ⭐⭐

#### Чого ви навчитеся
- Інтеграція Microsoft Foundry з AZD
- Розгортання додатків з ШІ
- Розуміння конфігурації AI сервісів

#### Навчальні ресурси
- **🎯 Початок тут**: [Інтеграція Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Агенти ШІ**: [Посібник по агентах ШІ](docs/chapter-02-ai-development/agents.md) – розгортання інтелектуальних агентів із AZD
- **📖 Патерни**: [Розгортання моделей ШІ](docs/chapter-02-ai-development/ai-model-deployment.md) – розгортання і керування моделями ШІ
- **🛠️ Лабораторія**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) – підготовка ШІ рішень для AZD
- **🎥 Інтерактивний посібник**: [Матеріали лабораторії](workshop/README.md) – навчання через браузер з MkDocs та DevContainer
- **📋 Шаблони**: [Шаблони Microsoft Foundry](#ресурси-воркшопу)
- **📝 Приклади**: [Приклади розгортання AZD](examples/README.md)

#### Практичні завдання
```bash
# Розгорніть вашу першу AI-застосунок
azd init --template azure-search-openai-demo
azd up

# Спробуйте додаткові AI шаблони
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Результат розділу**: Розгорнути та налаштувати чат-додаток на базі ШІ з можливістю RAG

**✅ Критерії успішності:**
```bash
# Після розділу 2 ви повинні вміти:
azd init --template azure-search-openai-demo
azd up
# Тестувати інтерфейс чат-бота AI
# Задавати питання та отримувати відповіді на основі AI з джерелами
# Перевірити, що інтеграція пошуку працює
azd monitor  # Перевірити, що Application Insights відображає телеметрію
azd down --force --purge
```

**📊 Час на навчання:** 1-2 години  
**📈 Рівень навичок після:** Вміє розгортати та налаштовувати готові AI-додатки для продуктивного використання  
**💰 Усвідомлення витрат:** Розуміє вартість dev $80-150/місяць та продуктивність $300-3500/місяць

#### 💰 Витрати на розгортання AI

**Навколишнє середовище розробки (Орієнтовно $80-150/місяць):**
- Моделі Microsoft Foundry (оплата за використання): $0-50/місяць (залежно від токенів)
- AI Search (базовий рівень): $75/місяць
- Container Apps (споживання): $0-20/місяць
- Зберігання (стандартне): $1-5/місяць

**Навколишнє середовище продуктивності (Орієнтовно $300-3,500+/місяць):**
- Моделі Microsoft Foundry (PTU для стабільної продуктивності): $3,000+/місяць АБО оплата за використання при великому обсязі
- AI Search (стандартний рівень): $250/місяць
- Container Apps (виділені): $50-100/місяць
- Application Insights: $5-50/місяць
- Зберігання (преміум): $10-50/місяць

**💡 Поради зі зниження витрат:**
- Використовуйте **безкоштовний рівень** Microsoft Foundry Models для навчання (включено 50,000 токенів Azure OpenAI)
- Виконуйте `azd down` для звільнення ресурсів, коли розробка неактивна
- Починайте з оплати за споживання, використовуйте PTU лише для продуктивного використання
- Використовуйте `azd provision --preview` для оцінки витрат перед розгортанням
- Увімкніть авто-масштабування: платіть тільки за фактичне використання

**Моніторинг витрат:**
```bash
# Перевірте оцінені місячні витрати
azd provision --preview

# Моніторинг фактичних витрат у порталі Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Розділ 3: Конфігурація та аутентифікація
**Вимоги:** Розділ 1 пройдений  
**Тривалість:** 45-60 хвилин  
**Складність:** ⭐⭐

#### Чого ви навчитеся
- Конфігурація і керування середовищами
- Найкращі практики аутентифікації та безпеки
- Іменування та організація ресурсів

#### Навчальні ресурси
- **📖 Конфігурація**: [Посібник з конфігурації](docs/chapter-03-configuration/configuration.md) – налаштування середовища
- **🔐 Безпека**: [Патерни аутентифікації та керовані ідентичності](docs/chapter-03-configuration/authsecurity.md)
- **📝 Приклади**: [Приклад додатку бази даних](examples/database-app/README.md) – приклади AZD

#### Практичні завдання
- Налаштувати кілька середовищ (dev, staging, prod)
- Встановити аутентифікацію за допомогою керованої ідентичності
- Реалізувати конфігурації за середовищем

**💡 Результат розділу**: Керувати кількома середовищами з правильною аутентифікацією та безпекою

---

### 🏗️ Розділ 4: Інфраструктура як код та розгортання
**Вимоги:** Розділи 1-3 пройдені  
**Тривалість:** 1-1.5 год  
**Складність:** ⭐⭐⭐

#### Чого ви навчитеся
- Просунуті патерни розгортання
- Інфраструктура як код за допомогою Bicep
- Стратегії провізіонування ресурсів

#### Навчальні ресурси
- **📖 Розгортання**: [Інструкція з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) – повні робочі процеси
- **🏗️ Провізіонування**: [Управління ресурсами Azure](docs/chapter-04-infrastructure/provisioning.md)
- **📝 Приклади**: [Приклад Container App](../../examples/container-app) – контейнери для розгортання

#### Практичні завдання
- Створити власні шаблони Bicep
- Розгорнути багатосервісні додатки
- Реалізувати стратегії blue-green розгортання

**💡 Результат розділу**: Розгортати складні багатосервісні додатки за допомогою кастомних шаблонів інфраструктури

---

### 🎯 Розділ 5: Багатоагентні AI рішення (Просунутий рівень)
**Вимоги:** Розділи 1-2 пройдені  
**Тривалість:** 2-3 год  
**Складність:** ⭐⭐⭐⭐

#### Чого ви навчитеся
- Патерни багатоагентної архітектури
- Оркестрація та координація агентів
- Розгортання AI готових до продуктивності

#### Навчальні ресурси
- **🤖 Рекомендований проєкт**: [Рітейл багатоагентне рішення](examples/retail-scenario.md) – повна імплементація
- **🛠️ ARM шаблони**: [Пакет ARM шаблонів](../../examples/retail-multiagent-arm-template) – розгортання у 1 клік
- **📖 Архітектура**: [Патерни координації багатьох агентів](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### Практичні завдання
```bash
# Розгорніть повне роздрібне багатозадачне рішення
cd examples/retail-multiagent-arm-template
./deploy.sh

# Дослідіть конфігурації агентів
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Результат розділу**: Розгорнути та керувати продуктивним багатоагентним AI рішенням із агентами Клієнта та Запасів

---

### 🔍 Розділ 6: Передрозгортання: перевірка та планування
**Вимоги:** Розділ 4 пройдений  
**Тривалість:** 1 год  
**Складність:** ⭐⭐

#### Чого ви навчитеся
- Планування потужностей і перевірка ресурсів
- Стратегії вибору SKU
- Передпольотні перевірки та автоматизація

#### Навчальні ресурси
- **📊 Планування**: [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md)
- **💰 Вибір**: [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md)
- **✅ Перевірка**: [Передпольотні перевірки](docs/chapter-06-pre-deployment/preflight-checks.md)

#### Практичні завдання
- Запустити сценарії перевірки потужностей
- Оптимізувати вибір SKU для вартості
- Реалізувати автоматизовані передрозгортання перевірки

**💡 Результат розділу**: Перевірити і оптимізувати розгортання перед їх виконанням

---

### 🚨 Розділ 7: Виправлення помилок і налагодження
**Вимоги:** Будь-який розділ з розгортання пройдений  
**Тривалість:** 1-1.5 год  
**Складність:** ⭐⭐

#### Чого ви навчитеся
- Системний підхід до налагодження
- Поширені проблеми і рішення
- Виправлення помилок, специфічних для AI

#### Навчальні ресурси
- **🔧 Поширені проблеми**: [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md)
- **🕵️ Налагодження**: [Посібник з налагодження](docs/chapter-07-troubleshooting/debugging.md)
- **🤖 Помилки AI**: [Виправлення проблем AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)

#### Практичні завдання
- Діагностувати збої розгортання
- Усунути проблеми аутентифікації
- Налагодити підключення AI сервісів

**💡 Результат розділу**: Самостійно діагностувати та вирішувати поширені проблеми розгортання

---

### 🏢 Розділ 8: Продуктивність та корпоративні патерни
**Вимоги:** Розділи 1-4 пройдені  
**Тривалість:** 2-3 год  
**Складність:** ⭐⭐⭐⭐

#### Чого ви навчитеся
- Стратегії продуктивного розгортання
- Корпоративні патерни безпеки
- Моніторинг та оптимізація витрат

#### Навчальні ресурси
- **🏭 Виробництво**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Корпоративні шаблони  
- **📝 Приклади**: [Microservices Example](../../examples/microservices) - Складні архітектури  
- **📊 Моніторинг**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Моніторинг  

#### Практичні вправи  
- Реалізуйте корпоративні шаблони безпеки  
- Налаштуйте комплексний моніторинг  
- Розгорніть у виробництві з правильною керованістю  

**💡 Результат розділу**: Розгорніть готові до виробництва корпоративні додатки з повними виробничими можливостями  

---

## 🎓 Огляд воркшопу: практичний навчальний досвід  

> **⚠️ СТАТУС ВОРКШОПУ: Активна розробка**  
> Матеріали воркшопу перебувають у процесі розробки та вдосконалення. Основні модулі працюють, але деякі просунуті розділи неповні. Ми активно працюємо над завершенням усіх матеріалів. [Відстежити прогрес →](workshop/README.md)  

### Інтерактивні матеріали воркшопу  
**Комплексне практичне навчання з браузерними інструментами та керованими вправами**  

Наші матеріали воркшопу забезпечують структурований інтерактивний досвід навчання, що доповнює розділову навчальну програму вище. Воркшоп розроблено як для самостійного навчання, так і для занять під керівництвом викладача.  

#### 🛠️ Особливості воркшопу  
- **Інтерфейс у браузері**: повний воркшоп на базі MkDocs з пошуком, копіюванням і темами  
- **Інтеграція з GitHub Codespaces**: налаштування середовища розробки одним кліком  
- **Структурований шлях навчання**: 8 модулів керованих вправ (загалом 3-4 години)  
- **Прогресивна методологія**: Вступ → Вибір → Верифікація → Деконструкція → Конфігурація → Кастомізація → Завершення → Підсумок  
- **Інтерактивне середовище DevContainer**: попередньо налаштовані інструменти і залежності  

#### 📚 Структура модулів воркшопу  
Воркшоп слідує **8-модульній прогресивній методології**, що веде від ознайомлення до майстерності розгортання:  

| Модуль | Тема | Що ви зробите | Тривалість |  
|--------|------|---------------|------------|  
| **0. Вступ** | Огляд воркшопу | Зрозуміти цілі навчання, передумови та структуру воркшопу | 15 хв |  
| **1. Вибір** | Пошук шаблонів | Вивчити AZD шаблони та обрати правильний AI-шаблон для вашого сценарію | 20 хв |  
| **2. Верифікація** | Розгортання та перевірка | Розгорнути шаблон за допомогою `azd up` та перевірити роботу інфраструктури | 30 хв |  
| **3. Деконструкція** | Розуміння структури | Використати GitHub Copilot для огляду архітектури шаблону, Bicep-файлів і організації коду | 30 хв |  
| **4. Конфігурація** | Глибоке дослідження azure.yaml | Опановувати конфігурацію `azure.yaml`, lifecycle hooks і змінні середовища | 30 хв |  
| **5. Кастомізація** | Зробіть на свій лад | Увімкнути AI-пошук, трасування, оцінку та налаштувати під ваш сценарій | 45 хв |  
| **6. Завершення** | Очищення | Безпечно видалити ресурси за допомогою `azd down --purge` | 15 хв |  
| **7. Підсумок** | Наступні кроки | Огляд досягнень, ключових концепцій та продовження навчання | 15 хв |  

**Потік воркшопу:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Початок роботи з воркшопом  
```bash
# Варіант 1: GitHub Codespaces (Рекомендується)
# Клацніть "Code" → "Create codespace on main" у репозиторії

# Варіант 2: Локальна розробка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Дотримуйтесь інструкцій з налаштування в workshop/README.md
```
  
#### 🎯 Результати навчання воркшопу  
Після завершення воркшопу учасники зможуть:  
- **Розгортати виробничі AI-додатки**: використовуйте AZD з сервісами Microsoft Foundry  
- **Опанувати мультиагентські архітектури**: впроваджувати скоординовані AI-агентські рішення  
- **Реалізувати найкращі практики безпеки**: налаштовувати автентифікацію та контроль доступу  
- **Оптимізувати під масштабування**: проектувати ефективні за вартістю й продуктивністю розгортання  
- **Усунення неполадок розгортання**: самостійно вирішувати типові проблеми  

#### 📖 Ресурси воркшопу  
- **🎥 Інтерактивний гід**: [Workshop Materials](workshop/README.md) - навчальне середовище у браузері  
- **📋 Покрокові інструкції по модулях**:  
  - [0. Вступ](workshop/docs/instructions/0-Introduction.md) - огляд та цілі воркшопу  
  - [1. Вибір](workshop/docs/instructions/1-Select-AI-Template.md) - пошук та вибір AI-шаблонів  
  - [2. Верифікація](workshop/docs/instructions/2-Validate-AI-Template.md) - розгортання та перевірка шаблонів  
  - [3. Деконструкція](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - вивчення архітектури шаблонів  
  - [4. Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) - вивчення azure.yaml  
  - [5. Кастомізація](workshop/docs/instructions/5-Customize-AI-Template.md) - кастомізація під ваш сценарій  
  - [6. Завершення](workshop/docs/instructions/6-Teardown-Infrastructure.md) - очищення ресурсів  
  - [7. Підсумок](workshop/docs/instructions/7-Wrap-up.md) - підсумки та наступні кроки  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - вправи по AI  
- **💡 Швидкий старт**: [Workshop Setup Guide](workshop/README.md#quick-start) - налаштування середовища  

**Ідеально підходить для**: корпоративного навчання, університетських курсів, самостійного навчання та буткемпів для розробників.  

---

## 📖 Глибокий аналіз: можливості AZD  

Окрім базового функціоналу, AZD надає потужні інструменти для виробничого розгортання:  

- **Розгортання на основі шаблонів** – використання готових шаблонів для типової архітектури додатків  
- **Інфраструктура як код** – управління ресурсами Azure через Bicep або Terraform  
- **Інтегровані робочі процеси** – безшовне надання, розгортання та моніторинг додатків  
- **Зручність для розробників** – оптимізовано для продуктивності та досвіду розробки  

### **AZD + Microsoft Foundry: ідеально для розгортання AI**  

**Чому AZD для AI-рішень?** AZD вирішує головні виклики AI-розробників:  

- **Готові AI-шаблони** – попередньо налаштовані шаблони для моделей Microsoft Foundry, Cognitive Services та ML-навантажень  
- **Безпечні AI-розгортання** – вбудовані шаблони безпеки для AI-сервісів, ключів API та кінцевих точок моделей  
- **Шаблони виробничого AI** – кращі практики для масштабованих та економічних розгортань AI-додатків  
- **Повний AI-робочий процес** – від розробки моделей до виробничого розгортання з моніторингом  
- **Оптимізація вартості** – розумне розподілення ресурсів і стратегії масштабування для AI-навантажень  
- **Інтеграція з Microsoft Foundry** – безперервне підключення до каталогу моделей Microsoft Foundry і кінцевих точок  

---

## 🎯 Бібліотека шаблонів і прикладів  

### Рекомендоване: Шаблони Microsoft Foundry  
**Починайте звідси, якщо розгортаєте AI-додатки!**  

> **Примітка:** Ці шаблони демонструють різні AI-шаблони. Деякі – зовнішні Azure Samples, інші – локальні реалізації.  

| Шаблон | Розділ | Складність | Сервіси | Тип |  
|--------|--------|------------|---------|-----|  
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Зовнішній |  
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Розділ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Зовнішній |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Зовнішній |  
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Зовнішній |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Зовнішній |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Зовнішній |  
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локальний** |  

### Особливо рекомендуємо: Повні навчальні сценарії  
**Теми розгортання для готових до виробництва додатків, поєднані з розділами курсу**  

| Шаблон | Навчальний розділ | Складність | Основні навички |  
|--------|-------------------|------------|-----------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | Базові шаблони розгортання AI |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | Реалізація RAG з Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Розділ 4 | ⭐⭐ | Інтеграція Document Intelligence |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | Агентські фреймворки та виклики функцій |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐ | Корпоративна AI-орchestration |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | Мультиагентна архітектура з агентами з обслуговування клієнтів та інвентарю |  

### Навчання через тип прикладу  

> **📌 Локальні та зовнішні приклади:**  
> **Локальні приклади** (в цьому репозиторії) = готові до негайного використання  
> **Зовнішні приклади** (Azure Samples) = клонування з пов’язаних репозиторіїв  

#### Локальні приклади (готові до використання)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - повна готова до виробництва реалізація з ARM-шаблонами  
  - Архітектура мультиагентів (агенти обслуговування клієнтів і інвентарю)  
  - Комплексний моніторинг та оцінка  
  - Розгортання одним кліком через ARM-шаблон  

#### Локальні приклади – Контейнерні додатки (розділи 2-5)  
**Повні приклади розгортання контейнерів у цьому репозиторії:**  
- [**Container App Examples**](examples/container-app/README.md) - повний посібник по розгортанню контейнерів  
  - [Простий Flask API](../../examples/container-app/simple-flask-api) - базовий REST API з масштабуванням до нуля  
  - [Архітектура мікросервісів](../../examples/container-app/microservices) - готове до виробництва багатосервісне розгортання  
  - Шаблони швидкого запуску, виробничі та просунуті шаблони розгортання  
  - Керування моніторингом, безпекою та оптимізацією вартості  

#### Зовнішні приклади – Прості додатки (розділи 1-2)  
**Клонуйте ці Azure Samples репозиторії для початку:**  
- [Простий веб-додаток - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - базові шаблони розгортання  
- [Статичний вебсайт – React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - розгортання статичного контенту  
- [Контейнерний додаток – Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - розгортання REST API  

#### Зовнішні приклади – Інтеграція баз даних (розділи 3-4)  
- [Додаток з базою даних - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - шаблони підключення до баз даних  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - серверлесс-обробка даних  

#### Зовнішні приклади – Просунуті шаблони (розділи 4-8)  
- [Java мікросервіси](https://github.com/Azure-Samples/java-microservices-aca-lab) - багатосервісні архітектури  
- [Контейнерні додатки з фоновими задачами](https://github.com/Azure-Samples/container-apps-jobs) - фонове опрацювання  
- [Корпоративний ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - готові до виробництва ML-шаблони  

### Колекції зовнішніх шаблонів  
- [**Офіційна галерея AZD шаблонів**](https://azure.github.io/awesome-azd/) - кураторична колекція офіційних та спільнотних шаблонів  
- [**Шаблони Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - документація Microsoft Learn по шаблонах  
- [**Каталог прикладів**](examples/README.md) - локальні навчальні приклади з детальними поясненнями  

---

## 📚 Ресурси для навчання та посилання  

### Швидкі посилання  
- [**Шпаргалка з команд**](resources/cheat-sheet.md) - основні команди azd за розділами  
- [**Глосарій**](resources/glossary.md) - терміни Azure та azd  
- [**Часті питання (FAQ)**](resources/faq.md) - поширені питання за навчальними розділами  
- [**Посібник для практики**](resources/study-guide.md) - комплексні практичні вправи  

### Практичні воркшопи  
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - зробіть свої AI-рішення готовими для розгортання з AZD (2-3 години)  
- [**Інтерактивний воркшоп**](workshop/README.md) - 8 модулів керованих вправ з MkDocs та GitHub Codespaces  
  - Методологія: Вступ → Вибір → Верифікація → Деконструкція → Конфігурація → Кастомізація → Завершення → Підсумок  

### Зовнішні ресурси для навчання
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор цін Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Навички AI-агента для вашого редактора
- [**Навички Microsoft Azure на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 відкритих навичок агента для Azure AI, Foundry, розгортання, діагностики, оптимізації витрат та іншого. Встановіть їх у GitHub Copilot, Cursor, Claude Code або будь-якому підтримуваному агенті:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Короткий посібник з усунення несправностей

**Поширені проблеми, з якими стикаються початківці, та миттєві рішення:**

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
<summary><strong>❌ "Підписку не знайдено" або "Передплата не встановлена"</strong></summary>

```bash
# Перелік доступних підписок
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
<summary><strong>❌ "InsufficientQuota" або "Перевищено квоту"</strong></summary>

```bash
# Спробуйте інший регіон Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Або використовуйте менші SKU у розробці
# Відредагуйте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" завершується помилкою посередині</strong></summary>

```bash
# Варіант 1: Очистити та спробувати знову
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
<summary><strong>❌ "Помилка автентифікації" або "Термін дії токена минув"</strong></summary>

```bash
# Повторна автентифікація
az logout
az login

azd auth logout
azd auth login

# Перевірте автентифікацію
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс вже існує" або конфлікти імен</strong></summary>

```bash
# AZD генерує унікальні імена, але якщо виникає конфлікт:
azd down --force --purge

# Тоді повторіть спробу з новим середовищем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Розгортання шаблону займе забагато часу</strong></summary>

**Нормальний час очікування:**
- Проста вебпрограма: 5-10 хвилин
- Програма з базою даних: 10-15 хвилин
- AI-додатки: 15-25 хвилин (надання OpenAI відбувається повільно)

```bash
# Перевірте прогрес
azd show

# Якщо застрягли більше 30 хвилин, перевірте портал Azure:
azd monitor
# Шукайте невдалі розгортання
```
</details>

<details>
<summary><strong>❌ "Дозвіл заборонено" або "Заборонено"</strong></summary>

```bash
# Перевірте свою роль в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Вам потрібна принаймні роль "Учасник"
# Попросіть адміністратора Azure надати:
# - Учасник (для ресурсів)
# - Адміністратор доступу користувача (для призначення ролей)
```
</details>

<details>
<summary><strong>❌ Не вдалося знайти URL розгорнутої програми</strong></summary>

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

### 📚 Повні ресурси для усунення несправностей

- **Посібник із поширених проблем:** [Детальні рішення](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, специфічні для AI:** [Усунення несправностей AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Посібник з налагодження:** [Покрокове налагодження](docs/chapter-07-troubleshooting/debugging.md)
- **Отримати допомогу:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершення курсу та сертифікація

### Відстеження прогресу
Відстежуйте свій навчальний прогрес за кожною главою:

- [ ] **Глава 1**: Основи та швидкий старт ✅
- [ ] **Глава 2**: Розробка з орієнтацією на AI ✅  
- [ ] **Глава 3**: Конфігурація та автентифікація ✅
- [ ] **Глава 4**: Інфраструктура як код та розгортання ✅
- [ ] **Глава 5**: AI-рішення з багатьма агентами ✅
- [ ] **Глава 6**: Валідація та планування перед розгортанням ✅
- [ ] **Глава 7**: Усунення несправностей та налагодження ✅
- [ ] **Глава 8**: Операційні та корпоративні шаблони ✅

### Перевірка знань
Після завершення кожної глави перевірте свої знання, виконавши:
1. **Практичне завдання**: Завершіть практичне розгортання з глави
2. **Перевірка знань**: Ознайомтеся з розділом FAQ для вашої глави
3. **Обговорення в спільноті**: Поділіться досвідом у Azure Discord
4. **Наступна глава**: Перейдіть до наступного рівня складності

### Переваги завершення курсу
Після завершення всіх глав ви отримаєте:
- **Досвід у виробництві**: Розгорнуті реальні AI-застосунки в Azure
- **Професійні навички**: Готовність до розгортання в корпоративних середовищах  
- **Визнання в спільноті**: Активний учасник спільноти розробників Azure
- **Кар’єрне зростання**: Популярні навички AZD та AI-розгортання

---

## 🤝 Спільнота та підтримка

### Отримати допомогу та підтримку
- **Технічні проблеми**: [Повідомити про помилки та запросити функції](https://github.com/microsoft/azd-for-beginners/issues)
- **Питання з навчання**: [Спільнота Microsoft Azure Discord](https://discord.gg/microsoft-azure) та [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Допомога із AI**: Приєднуйтеся до [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документація**: [Офіційна документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Інсайти спільноти з Microsoft Foundry Discord

**Останні результати опитування в каналі #Azure:**
- **45%** розробників хочуть використовувати AZD для AI-навантажень
- **Основні виклики**: Розгортання з кількома сервісами, керування обліковими даними, готовність до виробництва  
- **Найбільш запитувані**: Шаблони, специфічні для AI, посібники з усунення несправностей, найкращі практики

**Приєднуйтесь до нашої спільноти, щоб:**
- Ділитися досвідом AZD + AI та отримувати допомогу
- Отримувати ранній доступ до нових AI-шаблонів
- Вносити внесок у найкращі практики розгортання AI
- Впливати на майбутній розвиток функцій AI + AZD

### Участь у розробці курсу
Ми вітаємо внески! Будь ласка, ознайомтеся з нашим [Посібником із внесків](CONTRIBUTING.md) для подробиць щодо:
- **Покращення контенту**: Поліпшення існуючих глав і прикладів
- **Нові приклади**: Додавання реальних сценаріїв і шаблонів  
- **Переклад**: Допомога у підтримці багатомовності
- **Повідомлення про помилки**: Підвищення точності та ясності
- **Стандарти спільноти**: Дотримання наших інклюзивних правил спільноти

---

## 📄 Інформація про курс

### Ліцензія
Цей проєкт ліцензовано за ліцензією MIT - див. файл [LICENSE](../../LICENSE) для деталей.

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
[![AI агенти для початківців](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

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
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навігація курсом

**🚀 Готові почати навчання?**

**Початківці**: Почніть з [Розділ 1: Основи та швидкий старт](#-chapter-1-foundation--quick-start)  
**Розробники ШІ**: Перейдіть до [Розділ 2: Розробка з пріоритетом на ШІ](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Досвідчені розробники**: Починайте з [Розділ 3: Конфігурація та автентифікація](#️-chapter-3-configuration--authentication)

**Наступні кроки**: [Почати Розділ 1 - Основи AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений із використанням сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або помилкові тлумачення, що виникли через використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->