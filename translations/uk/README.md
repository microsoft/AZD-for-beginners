# AZD для початківців: структурований шлях навчання

![AZD-for-beginners](../../translated_images/uk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматизовані переклади (завжди актуальні)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабська](../ar/README.md) | [Бенгальська](../bn/README.md) | [Болгарська](../bg/README.md) | [Бирманська (М’янма)](../my/README.md) | [Китайська (спрощена)](../zh-CN/README.md) | [Китайська (традиційна, Гонконг)](../zh-HK/README.md) | [Китайська (традиційна, Макао)](../zh-MO/README.md) | [Китайська (традиційна, Тайвань)](../zh-TW/README.md) | [Хорватська](../hr/README.md) | [Чеська](../cs/README.md) | [Данська](../da/README.md) | [Голландська](../nl/README.md) | [Естонська](../et/README.md) | [Фінська](../fi/README.md) | [Французька](../fr/README.md) | [Німецька](../de/README.md) | [Грецька](../el/README.md) | [Іврит](../he/README.md) | [Гінді](../hi/README.md) | [Угорська](../hu/README.md) | [Індонезійська](../id/README.md) | [Італійська](../it/README.md) | [Японська](../ja/README.md) | [Каннада](../kn/README.md) | [Кхмерська](../km/README.md) | [Корейська](../ko/README.md) | [Литовська](../lt/README.md) | [Малайська](../ms/README.md) | [Малаялам](../ml/README.md) | [Маніпурі (Мейтей Майек)](../mni/README.md) | [Маратхі](../mr/README.md) | [Непальська](../ne/README.md) | [Нігерійський піджин](../pcm/README.md) | [Норвезька](../no/README.md) | [Перська (фарсі)](../fa/README.md) | [Польська](../pl/README.md) | [Португальська (Бразилія)](../pt-BR/README.md) | [Португальська (Португалія)](../pt-PT/README.md) | [Пенджабі (гурмухі)](../pa/README.md) | [Румунська](../ro/README.md) | [Російська](../ru/README.md) | [Сербська (кирилиця)](../sr/README.md) | [Словацька](../sk/README.md) | [Словенська](../sl/README.md) | [Іспанська](../es/README.md) | [Свахілі](../sw/README.md) | [Шведська](../sv/README.md) | [Тагальська (філіппінська)](../tl/README.md) | [Тамільська](../ta/README.md) | [Телугу](../te/README.md) | [Тайська](../th/README.md) | [Турецька](../tr/README.md) | [Українська](./README.md) | [Урду](../ur/README.md) | [В’єтнамська](../vi/README.md)

> **Віддаєте перевагу клонуванню локально?**
>
> Цей репозиторій містить понад 50 мовних перекладів, що значно збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте розріджене вилучення:
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

## 🆕 Що нового у azd сьогодні

> 📌 **Огляд випуску AI CLI (2026-11-04):** Керівництво перевірено за опублікованою документацією/джерелами **`azd 1.37.2`**, **агентів `1.0.0-beta.23`** і **оцінок `1.0.0-beta.2`**. Використовуйте `azd >= 1.37.0` для комбінованого робочого процесу. Запустіть `azd version` та [оновіть основний CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) перед розширеннями. Див. [зміни та виправлення у релізі](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Це не перевірка живого розгортання всього курсу.

Azure Developer CLI підтримує багато типів додатків, включно з вебдодатками, API та AI агентами, через підтримувані хости, шаблони та розширення.

Ось що це означає для вас:

- **AI агенти тепер є першокласними робочими навантаженнями azd.** Ви можете ініціалізувати, розгортати та керувати проектами AI агентів за допомогою того самого робочого процесу `azd init` → `azd up`, який ви вже знаєте.
- **Життєвий цикл агента в двох розширеннях.** Використовуйте `azure.ai.agents` для ініціалізації, виклику, оптимізації та виведення з експлуатації агентів. Встановіть окремо **`azure.ai.evaluations`** для `azd ai eval init`, `generate` і `run start`. Beta-версія агентів 22 замінила застарілий процес оцінювання та змінила конфігурацію оптимізації; дотримуйтесь [керівництва з міграції](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Більше будівельних блоків AI.** Нові прев’ю-розширення—`azure.ai.skills` і `azure.ai.connections`—дають змогу керувати багаторазовими навичками агентів та підключеннями Foundry безпосередньо за допомогою azd.
- **Інтеграція Microsoft Foundry** надає розгортання моделей, хостинг агентів та налаштування AI сервісів безпосередньо в екосистему шаблонів azd.
- **Плавніша щоденна робота.** Останні випуски зробили `azd init` ідемпотентним (безпечним для повторного запуску), автоматично видаляють застарілі токени `azd auth login` і додали дружній запит на початкове налаштування `azd tool`.
- **Основний робочий процес не змінився.** Незалежно від того, чи розгортаєте ви додаток todo, мікросервіс чи багатокористувацьке AI-рішення, команди однакові.

> **Примітка для користувачів Aspire:** Microsoft тепер називає продукт просто **Aspire** (раніше ".NET Aspire"). Підтримка Aspire в azd не змінилася — тільки оновлена назва.

Якщо ви вже використовували azd, підтримка AI — це природне розширення, не окремий інструмент чи складна гілка. Якщо починаєте з нуля, ви вивчите один робочий процес, який підходить для всього.

---

## 🚀 Що таке Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — це дружній до розробників інструмент командного рядка, який полегшує розгортання програм в Azure. Замість того, щоб вручну створювати і зв’язувати десятки ресурсів Azure, ви можете розгорнути цілі додатки однією командою.

### Магія `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Шаблон постачає конфігурацію додатка та інфраструктури. Успішне розгортання все одно вимагає підтримуваних сервісів/моделей, достатньої квоти і прав, правильних вхідних даних та перевірки розгорнутого додатка. `azd up` не робить шаблон автоматично безпечним, відповідним або придатним до виробництва.

---

## ❓ Azure Developer CLI проти Azure CLI: у чому різниця?

Це найпоширеніше питання початківців. Ось проста відповідь:

| Особливість | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Призначення** | Керувати окремими ресурсами Azure | Розгортати цілі додатки |
| **Підхід** | Сфокусований на інфраструктурі | Сфокусований на додатках |
| **Приклад** | `az webapp create --name myapp...` | `azd up` |
| **Крива навчання** | Треба знати сервіси Azure | Треба знати свій додаток |
| **Найкраще для** | DevOps, Інфраструктура | Розробники, прототипування |

### Проста аналогія

- **Azure CLI** схожий на наявність усіх інструментів для будівництва будинку — молотків, пилок, цвяхів. Ви можете збудувати будь-що, але маєте знати будівництво.
- **Azure Developer CLI** схожий на найм підрядника — ви описуєте, що хочете, а він займається будівництвом.

### Коли використовувати кожен

| Сценарій | Використовуйте це |
|----------|----------|
| "Хочу швидко розгорнути веб-додаток" | `azd up` |
| "Потрібно створити лише обліковий запис сховища" | `az storage account create` |
| "Будую повний AI-додаток" | `azd init --template azure-search-openai-demo` |
| "Потрібно налагодити конкретний ресурс Azure" | `az resource show` |
| "Хочу розгорнути на налаштоване виробниче середовище" | Перегляньте конфігурацію, доступ, вартість і операційні вимоги перед `azd up --environment production` |

### Вони працюють разом!

AZD і Azure CLI мають окрему аутентифікацію та конфігурацію. Використовуйте `azd auth login` для AZD і `az login`, коли хуки чи діагностичні команди явно потребують Azure CLI. Обидва можна використовувати:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Знайдіть шаблони в Awesome AZD

Не починайте з нуля! **Awesome AZD** — це спільнотна колекція шаблонів, готових до розгортання:

| Ресурс | Опис |
|----------|-------------|
| 🔗 [**Галерея Awesome AZD**](https://azure.github.io/awesome-azd/) | Огляньте 200+ шаблонів з розгортанням в один клік |
| 🔗 [**Подати шаблон**](https://github.com/Azure/awesome-azd/issues) | Додайте свій шаблон до спільноти |
| 🔗 [**Репозиторій GitHub**](https://github.com/Azure/awesome-azd) | Зірка та дослідження вихідного коду |

### Популярні AI шаблони з Awesome AZD

Оберіть один шаблон у власній порожній директорії; нижченаведені команди — альтернативи. Закінчення `.` ініціалізує цю директорію.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Початок роботи у 3 кроки

Перед початком переконайтеся, що ваша машина готова до розгортання обраного шаблону:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Якщо будь-яка з необхідних перевірок не пройдена, спочатку усуньте цю проблему, а потім продовжуйте швидкий старт.

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

### Крок 2: Аутентифікація для AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Якщо не впевнені, що саме потрібно, пройдіть повний процес встановлення в [Встановлення та Налаштування](docs/chapter-01-foundation/installation.md#authentication-setup).

### Крок 3: Розгорніть свій перший додаток

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Ось і все!** Ваш додаток тепер працює в Azure.

### Очистка (не забудьте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Як користуватися цим курсом

Цей курс розроблено для **послідовного навчання** — починайте там, де вам комфортно, і рухайтеся вгору:

| Ваш досвід | Почніть тут |
|-----------------|------------|
| **Повний новачок в Azure** | [Розділ 1: Основи](#-chapter-1-foundation--quick-start) |
| **Знайомі з Azure, новачок у AZD** | [Розділ 1: Основи](#-chapter-1-foundation--quick-start) |
| **Хочу розгортати AI-додатки** | [Розділ 2: Розробка з акцентом на AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Хочу практичну роботу** | [🎓 Інтерактивний семінар](workshop/README.md) — 3-4 години практичного лабораторного курсу |
| **Потрібні виробничі шаблони** | [Розділ 8: Виробництво та підприємства](#-chapter-8-production--enterprise-patterns) |

### Швидке налаштування

1. **Зробіть форк цього репозиторію**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонуйте**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Отримайте допомогу**: [Спільнота Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Віддаєте перевагу клонуванню локально?**

> Цей репозиторій містить понад 50 мовних перекладів, що значно збільшує розмір завантаження. Щоб клонувати без перекладів, використовуйте розріджене вилучення:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Це дає вам усе необхідне для завершення курсу з набагато швидшим завантаженням.


## Огляд курсу

Опануйте Azure Developer CLI (azd) через структуровані розділи, розроблені для поступового навчання. **Особлива увага приділяється розгортанню AI-додатків з інтеграцією Microsoft Foundry.**

### Чому цей курс є необхідним для сучасних розробників

Розробникам, які розгортають AI-навантаження, часто потрібна допомога щодо:
- Складних AI-архітектур із кількома сервісами
- Найкращих практик розгортання AI у виробництво  
- Інтеграції та налаштування сервісів Azure AI
- Оптимізації витрат на AI-навантаження
- Усунення неполадок специфічних проблем розгортання AI

### Навчальні цілі

Завершивши цей структурований курс, ви:
- **Опануєте основи AZD**: Ключові концепції, встановлення та налаштування
- **Розгортатимете AI-додатки**: Використання AZD із сервісами Microsoft Foundry
- **Реалізуєте інфраструктуру як код**: Керуйте ресурсами Azure за допомогою шаблонів Bicep
- **Усуните неполадки під час розгортань**: Вирішуйте поширені проблеми та налагоджуйте помилки
- **Оптимізуєте для виробництва**: Безпека, масштабування, моніторинг та управління витратами
- **Створите рішення з кількома агентами**: Розгортання складних AI-архітектур

## Перед початком: облікові записи, доступ та припущення

Перед початком Розділу 1 переконайтеся, що все необхідне на місці. Кроки встановлення у цьому посібнику передбачають, що ці основи вже виконані.

- **Підписка Azure**: Ви можете використовувати існуючу підписку на роботі або зі свого акаунту, або створити [безкоштовну пробну](https://aka.ms/azurefreetrial) для початку.
- **Дозвіл на створення ресурсів Azure**: Для більшості вправ ви повинні мати щонайменше доступ **Співавтора** до цільової підписки чи групи ресурсів. Деякі розділи можуть припускати, що ви можете створювати групи ресурсів, керовані ідентичності та призначення RBAC.
- [**Обліковий запис GitHub**](https://github.com): Корисний для форку репозиторію, відстеження власних змін і використання GitHub Codespaces для майстер-класу.
- **Необхідні інструменти для запуску шаблонів**: Деякі шаблони потребують локальних інструментів, таких як Node.js, Python, Java або Docker. Запустіть валідатор установки перед початком, щоб вчасно виявити відсутні інструменти.
- **Базове знайомство з терміналом**: Не потрібно бути експертом, але варто вміти працювати з командами, як-от `git clone`, `azd auth login` та `azd up`.

> **Працюєте в корпоративній підписці?**
> Якщо ваше середовище Azure управляється адміністратором, заздалегідь переконайтеся, що ви можете розгортати ресурси у підписці чи групі ресурсів, яку плануєте використовувати. Якщо ні — попросіть підписку-пісочницю або доступ Співавтора перед початком.

> **Новачок у Azure?**
> Почніть зі своєї власної пробної або оплати за фактом підписки Azure на https://aka.ms/azurefreetrial, щоб ви могли пройти вправи повністю без очікування підтверджень на рівні орендаря.

## 🗺️ Мапа курсу: швидка навігація за розділами

Кожен розділ має присвячений README з навчальними цілями, швидкими стартами та вправами:

| Розділ | Тема | Уроки | Тривалість | Складність |
|---------|-------|---------|----------|------------|
| **[Розділ 1: Основи](docs/chapter-01-foundation/README.md)** | Початок роботи | [Основи AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Встановлення](docs/chapter-01-foundation/installation.md) &#124; [Перший проєкт](docs/chapter-01-foundation/first-project.md) | 30-45 хв | ⭐ |
| **[Розділ 2: Розробка AI](docs/chapter-02-ai-development/README.md)** | AI-перші додатки | [Інтеграція Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-агенти](docs/chapter-02-ai-development/agents.md) &#124; [Розгортання моделей](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Майстер-клас](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 год | ⭐⭐ |
| **[Розділ 3: Конфігурація](docs/chapter-03-configuration/README.md)** | Аутентифікація та безпека | [Конфігурація](docs/chapter-03-configuration/configuration.md) &#124; [Аутентифікація та безпека](docs/chapter-03-configuration/authsecurity.md) | 45-60 хв | ⭐⭐ |
| **[Розділ 4: Інфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC та розгортання | [Посібник із розгортання](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провізіювання](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 год | ⭐⭐⭐ |
| **[Розділ 5: Багатоагентні рішення](docs/chapter-05-multi-agent/README.md)** | Рішення AI-агентів | [Роздрібний сценарій](examples/retail-scenario.md) &#124; [Патріархи координації](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[Розділ 6: Перед розгортанням](docs/chapter-06-pre-deployment/README.md)** | Планування та перевірка | [Перевірки перед польотом](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планування потужностей](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 год | ⭐⭐ |
| **[Розділ 7: Усунення неполадок](docs/chapter-07-troubleshooting/README.md)** | Налагодження та виправлення | [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Налагодження](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблеми AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 год | ⭐⭐ |
| **[Розділ 8: Виробництво](docs/chapter-08-production/README.md)** | Патріархи підприємства | [Практики виробництва](docs/chapter-08-production/production-ai-practices.md) | 2-3 год | ⭐⭐⭐⭐ |
| **[🎓 Майстер-клас](workshop/README.md)** | Практична лабораторія | [Вступ](workshop/docs/instructions/0-Introduction.md) &#124; [Вибір](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Перевірка](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Розбір](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Налаштування](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Прибирання](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Підсумок](workshop/docs/instructions/7-Wrap-up.md) | 3-4 год | ⭐⭐ |

**Загальна тривалість курсу:** ~10-14 годин | **Рівень навичок:** Від початківця до готового для виробництва

---

## 📚 Навчальні розділи

*Обирайте шлях навчання залежно від досвіду та цілей*

### 🚀 Розділ 1: Основи та швидкий старт
**Вимоги**: підписка Azure, базові знання командного рядка  
**Тривалість**: 30-45 хвилин  
**Складність**: ⭐

#### Чому навчатиметесь
- Розуміння основ Azure Developer CLI
- Встановлення AZD на вашу платформу
- Ваше перше успішне розгортання

#### Навчальні ресурси
- **🎯 Почніть тут**: [Що таке Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Теорія**: [Основи AZD](docs/chapter-01-foundation/azd-basics.md) - Основні концепції та термінологія
- **⚙️ Налаштування**: [Встановлення та налаштування](docs/chapter-01-foundation/installation.md) - Посібники для конкретних платформ
- **🛠️ Практика**: [Ваш перший проєкт](docs/chapter-01-foundation/first-project.md) - Покрокове керівництво
- **📋 Швидка довідка**: [Шпаргалка команд](resources/cheat-sheet.md)

#### Практичні вправи
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Результат розділу**: Успішно розгорнути простий веб-додаток в Azure за допомогою AZD

**✅ Критерії успішності:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Час виконання:** 30-45 хвилин  
**📈 Рівень після:** Може самостійно розгортати базові додатки

---

### 🤖 Розділ 2: Розробка AI-перш за все (рекомендовано для AI-розробників)
**Вимоги**: Розділ 1 пройдено  
**Тривалість**: 1-2 години  
**Складність**: ⭐⭐

#### Чому навчатиметесь
- Інтеграція Microsoft Foundry з AZD
- Розгортання AI-додатків
- Розуміння конфігурації сервісів AI

#### Навчальні ресурси
- **🎯 Почніть тут**: [Інтеграція Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-агенти**: [Посібник AI-агентів](docs/chapter-02-ai-development/agents.md) - Розгортання інтелектуальних агентів з AZD
- **📖 Патерни**: [Розгортання моделей AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Розгортання та управління AI-моделями
- **🛠️ Майстер-клас**: [Лабораторія AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Підготуйте свої AI-рішення для AZD
- **🎥 Інтерактивний посібник**: [Матеріали майстер-класу](workshop/README.md) - Навчання в браузері з MkDocs * середовище DevContainer
- **📋 Шаблони**: [Шаблони Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Приклади**: [Приклади розгортання AZD](examples/README.md)

#### Практичні вправи
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Результат розділу**: Розгорнути та налаштувати AI-чат-додаток із функціями RAG

**✅ Критерії успішності:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Час виконання:** 1-2 години  
**📈 Рівень після:** Може розгортати AI-додатки для навчання та визначати додаткові вимоги до готовності для виробництва
**💰 Розуміння витрат:** Усвідомлення вартості розробки $80-150/місяць, виробничих витрат $300-3500/місяць

#### 💰 Роздуми про вартість для AI-розгортань

**Середовище розробки (орієнтовно $80-150/місяць):**
- Моделі Microsoft Foundry (оплата за використання): $0-50/місяць (залежно від використання токенів)
- AI Search (Базовий рівень): $75/місяць
- Контейнерні додатки (споживання): $0-20/місяць
- Сховище (стандартне): $1-5/місяць

**Виробниче середовище (орієнтовно $300-3,500+/місяць):**
- Моделі Microsoft Foundry (PTU для стабільної продуктивності): $3,000+/місяць або Оплата за використання при великому обсязі
- AI Search (Стандартний рівень): $250/місяць
- Контейнерні додатки (присвячені): $50-100/місяць
- Application Insights: $5-50/місяць
- Сховище (преміум): $10-50/місяць

**💡 Поради з оптимізації витрат:**
- Перевіряйте ціни на висновок моделей та кредитні ліміти акаунту; Azure OpenAI не має універсального щомісячного безкоштовного ліміту в 50,000 токенів
- Виконайте `azd down` для видалення ресурсів коли вони більше не потрібні, після перегляду вибраного середовища
- Починайте з оплати за споживання, переходьте на PTU лише для виробництва
- Використовуйте `azd provision --preview` для перегляду запланованої інфраструктури, потім оцініть ресурси за допомогою калькулятора цін Azure
- Увімкніть автоскейлінг: платіть лише за фактичне використання

**Моніторинг витрат:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Розділ 3: Конфігурація та аутентифікація
**Вимоги**: Розділ 1 пройдено  
**Тривалість**: 45-60 хвилин  
**Складність**: ⭐⭐

#### Чому навчатиметесь
- Конфігурація та управління середовищем
- Найкращі практики аутентифікації та безпеки
- Іменування та організація ресурсів

#### Навчальні ресурси
- **📖 Конфігурація**: [Посібник з конфігурації](docs/chapter-03-configuration/configuration.md) - Налаштування середовища
- **🔐 Безпека**: [Патерни аутентифікації та керовані ідентичності](docs/chapter-03-configuration/authsecurity.md) - Патерни аутентифікації
- **📝 Приклади**: [Приклад додатку з базою даних](examples/database-app/README.md) - Приклади AZD з базами даних

#### Практичні вправи
- Налаштуйте кілька середовищ (dev, staging, prod)
- Налаштуйте аутентифікацію через керовані ідентичності
- Реалізуйте конфігурації, специфічні для середовищ

**💡 Результат розділу**: Керуйте кількома середовищами з належною аутентифікацією та безпекою

---

### 🏗️ Розділ 4: Інфраструктура як код та розгортання
**Вимоги**: Розділи 1-3 пройдено  
**Тривалість**: 1-1.5 години  
**Складність**: ⭐⭐⭐

#### Чому навчатиметесь
- Розширені патерни розгортання
- Інфраструктура як код за допомогою Bicep
- Стратегії провізії ресурсів

#### Навчальні ресурси
- **📖 Розгортання**: [Посібник з розгортання](docs/chapter-04-infrastructure/deployment-guide.md) - Повні робочі процеси
- **🏗️ Провізіювання**: [Провізіювання ресурсів](docs/chapter-04-infrastructure/provisioning.md) - Управління ресурсами Azure
- **📝 Приклади**: [Приклад контейнерного додатку](../../examples/container-app) - Розгортання в контейнерах

#### Практичні вправи
- Створіть власні шаблони Bicep
- Розгорніть багатосервісні додатки
- Реалізуйте стратегії "синьо-зеленого" розгортання

**💡 Результат розділу**: Розгорніть складні багатосервісні додатки за допомогою власних інфраструктурних шаблонів

---

### 🎯 Розділ 5: Багатоагентні AI-рішення (просунутий)
**Вимоги**: Розділи 1-2 пройдено  
**Тривалість**: 2-3 години  
**Складність**: ⭐⭐⭐⭐

#### Чому навчатиметесь
- Патерни архітектури з кількома агентами
- Оркестрація та координація агентів
- Готові для виробництва AI-розгортання

#### Навчальні ресурси
- **🤖 Особливий дизайн**: [Рішення для роздрібної торгівлі з багатьма агентами](examples/retail-scenario.md) - Архітектурний план, а не повний додаток
- **🛠️ ARM шаблони**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Інфраструктурний каркас; ознайомлення з передумовами та відсутніми компонентами додатку
- **📖 Архітектура**: [Патерни координації мультиагентів](docs/chapter-06-pre-deployment/coordination-patterns.md) - Патерни

#### Практичні вправи
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Результат розділу**: Зрозуміти дизайн мультиагентів та визначити потрібні реалізацію, перевірку та операційну роботу, що виходить за межі інфраструктурного каркасу

---

### 🔍 Розділ 6: Перевірка та планування перед розгортанням
**Передумови**: Завершено розділ 4  
**Тривалість**: 1 година  
**Складність**: ⭐⭐

#### Чому ви навчитеся
- Планування потужності та перевірка ресурсів
- Стратегії вибору SKU
- Перевірки перед стартом і автоматизація

#### Навчальні ресурси
- **📊 Планування**: [Планування потужності](docs/chapter-06-pre-deployment/capacity-planning.md) - Перевірка ресурсів
- **💰 Вибір**: [Вибір SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Економічні рішення
- **✅ Перевірка**: [Перевірки перед стартом](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизовані скрипти

#### Практичні вправи
- Запустити скрипти перевірки потужності
- Оптимізувати вибір SKU з огляду на вартість
- Реалізувати автоматизовані перевірки перед розгортанням

**💡 Результат розділу**: Перевірити та оптимізувати розгортання перед виконанням

---

### 🚨 Розділ 7: Виявлення несправностей та налагодження
**Передумови**: Завершено будь-який розділ з розгортання  
**Тривалість**: 1-1.5 години  
**Складність**: ⭐⭐

#### Чому ви навчитеся
- Системний підхід до налагодження
- Поширені проблеми та рішення
- Виявлення несправностей, специфічних для ШІ

#### Навчальні ресурси
- **🔧 Поширені проблеми**: [Поширені проблеми](docs/chapter-07-troubleshooting/common-issues.md) - Часті питання та рішення
- **🕵️ Налагодження**: [Посібник з налагодження](docs/chapter-07-troubleshooting/debugging.md) - Покрокові стратегії
- **🤖 Проблеми ШІ**: [Виявлення несправностей у ШІ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми зі службами ШІ

#### Практичні вправи
- Діагностувати неполадки розгортання
- Вирішити проблеми автентифікації
- Налагодити підключення служби ШІ

**💡 Результат розділу**: Самостійно діагностувати та вирішувати поширені проблеми розгортання

---

### 🏢 Розділ 8: Патерни для продакшн та підприємств
**Передумови**: Завершено розділи 1-4  
**Тривалість**: 2-3 години  
**Складність**: ⭐⭐⭐⭐

#### Чому ви навчитеся
- Стратегії продакшн-розгортання
- Безпекові патерни для підприємств
- Моніторинг і оптимізація вартості

#### Навчальні ресурси
- **🏭 Продакшн**: [Кращі практики AI для продакшн](docs/chapter-08-production/production-ai-practices.md) - Патерни підприємств
- **📝 Приклади**: [Приклад мікросервісів](../../examples/microservices) - Складні архітектури
- **📊 Моніторинг**: [Інтеграція Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Моніторинг

#### Практичні вправи
- Реалізувати безпекові патерни для підприємств
- Налаштувати комплексний моніторинг
- Розгорнути в продакшн з відповідним управлінням

**💡 Результат розділу**: Розгорнути додатки, готові до підприємств та продакшн зі всіма можливостями

---

## 🎓 Огляд воркшопу: Практичний досвід навчання

> **⚠️ СТАН ВОРКШОПУ: Активна розробка**  
> Матеріали воркшопу наразі розробляються та удосконалюються. Основні модулі працюють, проте деякі розділи просунутого рівня неповні. Ми активно працюємо над завершенням контенту. [Слідкуйте за прогресом →](workshop/README.md)

### Інтерактивні матеріали воркшопу
**Комплексне практичне навчання з використанням браузерних інструментів та керованих вправ**

Наші матеріали воркшопу забезпечують структурований інтерактивний досвід навчання, що доповнює викладену вище навчальну програму за розділами. Воркшоп розрахований як на самостійну роботу, так і на заняття під керівництвом інструктора.

#### 🛠️ Особливості воркшопу
- **Інтерфейс у браузері**: Повний воркшоп на базі MkDocs з пошуком, копіюванням і налаштуваннями теми
- **Інтеграція GitHub Codespaces**: Налаштування середовища розробки одним кліком
- **Структурований навчальний шлях**: 8 керованих модулів (загалом 3-4 години)
- **Прогресивна методологія**: Вступ → Вибір → Перевірка → Декомпозиція → Конфігурація → Налаштування → Зняття → Підсумок
- **Інтерактивне середовище DevContainer**: Попередньо налаштовані інструменти та залежності

#### 📚 Структура модулів воркшопу
Воркшоп базується на **8 модульній прогресивній методології**, яка веде від відкриття до майстерності розгортання:

| Модуль | Тема | Що ви робитимете | Тривалість |
|--------|-------|----------------|----------|
| **0. Вступ** | Огляд воркшопу | Розуміння цілей навчання, передумов та структури воркшопу | 15 хв |
| **1. Вибір** | Відкриття шаблонів | Ознайомлення з шаблонами AZD та вибір підходящого AI шаблону для вашого сценарію | 20 хв |
| **2. Перевірка** | Розгортання та верифікація | Розгорнути шаблон з `azd up` і перевірити роботу інфраструктури | 30 хв |
| **3. Декомпозиція** | Розуміння структури | Використання GitHub Copilot для дослідження архітектури шаблонів, файлів Bicep та організації коду | 30 хв |
| **4. Конфігурація** | Детальний аналіз azure.yaml | Освоїти конфігурацію `azure.yaml`, хуки життєвого циклу та змінні середовища | 30 хв |
| **5. Налаштування** | Зробити це своїм | Активувати AI Пошук, трасування, оцінку і налаштувати під ваш сценарій | 45 хв |
| **6. Завершення** | Очищення | Безпечно деактивувати ресурси за допомогою `azd down --purge` | 15 хв |
| **7. Підсумок** | Подальші кроки | Огляд досягнень, ключових концепцій та продовження навчання | 15 хв |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Результати навчання воркшопу
Завершивши воркшоп, учасники зможуть:
- **Розгортати продакшн AI-додатки**: Використовувати AZD із службами Microsoft Foundry
- **Опанувати архітектуру мультиагентів**: Реалізовувати координовані рішення AI-агентів
- **Реалізувати найкращі практики безпеки**: Налаштовувати автентифікацію і контроль доступу
- **Оптимізувати для масштабування**: Проєктувати ефективні з точки зору вартості та продуктивності розгортання
- **Вирішувати проблеми розгортання**: Самостійно усувати поширені проблеми

#### 📖 Ресурси воркшопу
- **🎥 Інтерактивний посібник**: [Матеріали воркшопу](workshop/README.md) - Навчальне середовище у браузері
- **📋 Інструкції по модулях**:
  - [0. Вступ](workshop/docs/instructions/0-Introduction.md) - Огляд воркшопу та цілі
  - [1. Вибір](workshop/docs/instructions/1-Select-AI-Template.md) - Пошук та вибір AI-шаблонів
  - [2. Перевірка](workshop/docs/instructions/2-Validate-AI-Template.md) - Розгортання та перевірка шаблонів
  - [3. Декомпозиція](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Дослідження архітектури шаблонів
  - [4. Конфігурація](workshop/docs/instructions/4-Configure-AI-Template.md) - Освоєння azure.yaml
  - [5. Налаштування](workshop/docs/instructions/5-Customize-AI-Template.md) - Налаштування під свій сценарій
  - [6. Завершення](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очищення ресурсів
  - [7. Підсумок](workshop/docs/instructions/7-Wrap-up.md) - Огляд та подальші кроки
- **🛠️ Лабораторія AI воркшопу**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вправи, орієнтовані на AI
- **💡 Швидкий старт**: [Посібник з налаштування воркшопу](workshop/README.md#browser-based-guide) - Налаштування середовища

**Ідеально підходить для**: Корпоративного навчання, університетських курсів, самостійного вивчення та тренінгів для розробників.

---

## 📖 Глибоке занурення: можливості AZD

Окрім базового функціоналу, AZD надає потужні можливості для продакшн-розгортань:

- **Розгортання на основі шаблонів** - Використовуйте готові шаблони для поширених патернів додатків
- **Інфраструктура як код** - Управляйте ресурсами Azure за допомогою Bicep або Terraform  
- **Інтегровані робочі процеси** - Безперервне провізування, розгортання та моніторинг додатків
- **Дружній до розробника** - Оптимізовано для продуктивності та зручності роботи розробників

### **AZD + Microsoft Foundry: ідеально для розгортань AI**

**Чому AZD для AI-рішень?** AZD вирішує основні проблеми, з якими стикаються розробники AI:

- **Готові AI-шаблони** - Попередньо налаштовані шаблони для Microsoft Foundry Models, Azure AI Services і ML навантажень
- **Безпечні AI-розгортання** - Вбудовані патерни безпеки для служб AI, ключів API та кінцевих точок моделей  
- **Патерни продакшн AI** - Кращі практики для масштабованих, ефективних за вартістю AI-додатків
- **Повний робочий процес AI** - Від розробки моделей до продакшн розгортання із відповідним моніторингом
- **Оптимізація вартості** - Розумні стратегії розподілу ресурсів і масштабування AI-навантажень
- **Інтеграція Microsoft Foundry** - Безшовне підключення до каталогу моделей і кінцевих точок Microsoft Foundry

---

## 🎯 Бібліотека шаблонів і прикладів

### Рекомендовано: Шаблони Microsoft Foundry
**Почніть тут, якщо розгортаєте AI-додатки!**

> **Примітка:** Ці шаблони ілюструють різні AI-патерни. Деякі з них — це зовнішні зразки Azure, інші — локальні реалізації.

| Шаблон | Розділ | Складність | Послуги | Тип |
|----------|---------|------------|----------|------|
| [**Почати чат з AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Розділ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Зовнішній |
| [**Почати з AI-агентами**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Розділ 2 | ⭐⭐ | Агенті Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Зовнішній |
| [**Демонстрація Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (за замовчуванням) + Storage | Зовнішній |
| [**Швидкий старт OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Зовнішній |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Зовнішній |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Зовнішній |
| [**Роздрібне мультиагентське рішення**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | Запропонована архітектура та інфраструктурний каркас; потрібна реалізація додатку | **Локальний план** |

### Рекомендовано: Повні навчальні сценарії
**Шаблони додатків, готові для продакшн, прив'язані до навчальних розділів**

| Шаблон | Навчальний розділ | Складність | Ключові навички |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Розділ 2 | ⭐ | Базові патерни розгортання AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Розділ 2 | ⭐⭐ | Реалізація RAG із Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Розділ 2 | ⭐⭐ | Чат з підтримкою агентів та специфічні тести оцінювання |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Розділ 5 | ⭐⭐⭐ | Фреймворк агентів і виклик функцій |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Розділ 8 | ⭐⭐⭐ | Організація AI для підприємств |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Розділ 5 | ⭐⭐⭐⭐ | Мультиагентська архітектура з агентами для клієнтів і інвентарю |

### Навчання за типом прикладу

> **📌 Локальні проти зовнішніх прикладів:**  
> **Локальні приклади** (у цьому репозиторії) = Перевірте README прикладу для статусу реалізації та передумов
> **Зовнішні приклади** (Azure Samples) = Клонуйте з пов'язаних репозиторіїв

#### Локальні приклади (готові до використання)
- [**Роздрібне мультиагентське рішення**](examples/retail-scenario.md) - Архітектурний план з ARM інфраструктурним каркасом
  - Запропоновані ролі агентів для клієнтів і інвентарю
  - Потрібно реалізувати та перевірити моніторинг, оцінювання і код додатка
  - Лише провізування ресурсів не дає робочий роздрібний додаток

#### Локальні приклади - Контейнерні додатки (Розділи 2-5)
**Повні приклади розгортання контейнерів у цьому репозиторії:**
- [**Приклади контейнерних додатків**](examples/container-app/README.md) - Повний посібник із розгортання контейнерів
  - [Простий Flask API](../../examples/container-app/simple-flask-api) - Базовий REST API з масштабуванням до нуля
  - [Архітектура мікросервісів](../../examples/container-app/microservices) - Навчальний зразок з двома сервісами; додаткова робота для продакшн готовності
  - Патерни швидкого старту, продакшн та розширеного розгортання
  - Рекомендації з моніторингу, безпеки та оптимізації вартості

#### Зовнішні приклади - Прості додатки (Розділи 1-2)
**Клонуйте ці репозиторії Azure Samples для початку роботи:**
- [Простий веб-додаток - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Базові патерни розгортання
- [Статичний вебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Розгортання статичного контенту
- [Контейнерний додаток - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Розгортання REST API

#### Зовнішні приклади - Інтеграція баз даних (Розділи 3-4)  
- [База даних - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Шаблони підключення до бази даних
- [Функції + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Серверлес обробка даних

#### Зовнішні приклади - Розширені шаблони (глави 4-8)
- [Java мікросервіси](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архітектури з кількома сервісами
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Фонове опрацювання  
- [Потік ML для підприємств](https://github.com/Azure/mlops-v2) - Шаблони MLOps; не готовий шаблон AZD

### Зовнішні колекції шаблонів
- [**Офіційна галерея шаблонів AZD**](https://azure.github.io/awesome-azd/) - Відбірка офіційних та спільнотних шаблонів
- [**Шаблони Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документація шаблонів Microsoft Learn
- [**Каталог прикладів**](examples/README.md) - Локальні навчальні приклади з детальним поясненням

---

## 📚 Навчальні ресурси та посилання

### Швидкі посилання
- [**Шпаргалка команд**](resources/cheat-sheet.md) - Основні команди azd, відсортовані за главами
- [**Глосарій**](resources/glossary.md) - Терміни Azure та azd  
- [**FAQ**](resources/faq.md) - Часті питання, організовані за розділами навчання
- [**Посібник з навчання**](resources/study-guide.md) - Всеохопні практичні вправи

### Практичні семінари
- [**Лабораторія AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Перетворіть ваші AI-рішення у AZD-деплойовані (2-3 години)
- [**Інтерактивний семінар**](workshop/README.md) - 8 модулів з керованими вправами з MkDocs та GitHub Codespaces
  - Охоплює: Вступ → Вибір → Перевірка → Розбір → Конфігурація → Налаштування → Завершення → Підсумок

### Зовнішні навчальні ресурси
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор цін Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Навички AI агента для вашого редактора
- [**Навички Microsoft Azure на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 відкритих навичок агента для Azure AI, Foundry, розгортання, діагностики, оптимізації витрат тощо. Встановіть їх в GitHub Copilot, Cursor, Claude Code або будь-якому підтримуваному агенті:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Швидкий посібник з усунення несправностей

**Поширені проблеми для початківців і негайні рішення:**

<details>
<summary><strong>❌ "azd: команда не знайдена"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Підписка не знайдена" або "Підписка не встановлена"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" або "Квота перевищена"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" зазнає невдачі на півдорозі</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Не вдалося автентифікуватися" або "Токен протермінований"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс уже існує" або конфлікти імен</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Розгортання шаблону займає занадто багато часу</strong></summary>

**Звичайний час очікування:**
- Простий вебзастосунок: 5-10 хвилин
- Додаток з базою даних: 10-15 хвилин
- AI-додатки: 15-25 хвилин (забезпечення OpenAI йде повільно)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Доступ заборонено" або "Відмова в доступі"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Немає URL-адреси розгорнутого додатку</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Повні ресурси з усунення несправностей

- **Посібник із поширених проблем:** [Детальні рішення](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, специфічні для AI:** [Усунення несправностей AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Посібник з налагодження:** [Покрокове налагодження](docs/chapter-07-troubleshooting/debugging.md)
- **Отримати допомогу:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершення курсу та сертифікація

### Відстеження прогресу
Відстежуйте свій прогрес навчання через кожну главу:

- [ ] **Глава 1**: Основи та швидкий старт ✅
- [ ] **Глава 2**: Розробка з пріоритетом AI ✅  
- [ ] **Глава 3**: Конфігурація та автентифікація ✅
- [ ] **Глава 4**: Інфраструктура як код і розгортання ✅
- [ ] **Глава 5**: Рішення з багатьма AI-агентами ✅
- [ ] **Глава 6**: Валідація та планування перед розгортанням ✅
- [ ] **Глава 7**: Усунення несправностей і налагодження ✅
- [ ] **Глава 8**: Виробничі та корпоративні шаблони ✅

### Перевірка навчання
Після завершення кожної глави перевірте свої знання за допомогою:
1. **Практичне завдання**: завершіть практичне розгортання глави
2. **Перевірка знань**: перегляньте розділ FAQ для вашої глави
3. **Обговорення в спільноті**: поділіться досвідом у Azure Discord
4. **Наступна глава**: переходьте до наступного рівня складності

### Переваги завершення курсу
По завершенню всіх глав ви отримаєте:
- **Досвід у виробництві**: Розгорнуті реальні AI-додатки в Azure
- **Професійні навички**: Здатність розгортання корпоративного рівня  
- **Визнання в спільноті**: Активний член спільноти розробників Azure
- **Кар'єрний розвиток**: Запитувані знання з AZD та розгортання AI

---

## 🤝 Спільнота та підтримка

### Отримати допомогу та підтримку
- **Технічні проблеми**: [Повідомити про помилки та запросити функції](https://github.com/microsoft/azd-for-beginners/issues)
- **Питання з навчання**: [Спільнота Microsoft Azure Discord](https://discord.gg/microsoft-azure) та [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Допомога по AI**: Приєднуйтесь до [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документація**: [Офіційна документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Відгуки спільноти Microsoft Foundry Discord

**Тематики, що обговорюються спільнотою:**
- Розгортання з кількома сервісами, управління обліковими даними, готовність до виробництва
- Специфічні для AI шаблони, посібники з усунення несправностей, найкращі практики

**Приєднуйтесь до нашої спільноти, щоб:**
- Ділитися досвідом AZD + AI та отримувати допомогу
- Отримувати ранні перегляди нових AI шаблонів
- Вносити внесок у найкращі практики розгортання AI
- Впливати на майбутній розвиток функцій AI + AZD

### Внесок у курс
Ми раді вашим внескам! Будь ласка, ознайомтеся з нашим [Посібником з внесків](CONTRIBUTING.md) для деталей про:
- **Покращення контенту**: Покращуйте існуючі глави та приклади
- **Нові приклади**: Додавайте реальні сценарії та шаблони  
- **Переклад**: Допомагайте підтримувати багатомовність
- **Звіти про помилки**: Підвищуйте точність та зрозумілість
- **Стандарти спільноти**: Дотримуйтесь наших інклюзивних правил спільноти

---

## 📄 Інформація про курс

### Ліцензія
Цей проект ліцензовано за MIT License - див. файл [LICENSE](../../LICENSE) для деталей.

### Пов’язані навчальні ресурси Microsoft

Наша команда створює інші всеохопні навчальні курси:

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
[![Cybersecurity для початківців](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev для початківців](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT для початківців](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development для початківців](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серія Copilot
[![Copilot для AI парного програмування](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot для C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Пригода](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навігація по курсу

**🚀 Готові почати навчання?**

**Початківці**: Почніть з [Глави 1: Основи та швидкий старт](#-chapter-1-foundation--quick-start)  
**AI розробники**: Переходьте до [Глави 2: Розробка AI-першої](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Досвідчені розробники**: Почніть з [Глави 3: Конфігурація та автентифікація](#️-chapter-3-configuration--authentication)

**Наступні кроки**: [Розпочати главу 1 - Основи AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->