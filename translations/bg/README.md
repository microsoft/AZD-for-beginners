# AZD за начинаещи: Структуриран обучителен път

![AZD-for-beginners](../../translated_images/bg/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматични преводи (Винаги актуални)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](./README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Предпочитате да клонирате локално?**
>
> Това хранилище включва над 50 езикови превода, което значително увеличава размера на изтегляне. За да клонирате без преводи, използвайте sparse checkout:
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
> Това ви дава всичко необходимо за завършване на курса с много по-бързо изтегляне.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Какво има ново в azd днес

Azure Developer CLI се разви отвъд традиционните уеб приложения и API-та. Днес azd е единственият инструмент за разгръщане на **всяко** приложение в Azure — включително AI-базирани приложения и интелигентни агенти.

Ето какво означава това за вас:

- **AI агентите вече са първокласни товари в azd.** Можете да инициализирате, разгръщате и управлявате AI проекти на агенти със същия работен поток `azd init` → `azd up`, който вече познавате.
- **Интеграция с Microsoft Foundry** добавя разполагане на модели, хостване на агенти и конфигурация на AI услуги директно в екосистемата на azd шаблоните.
- **Основният работен поток не се е променил.** Независимо дали разгръщате todo приложение, микросървис или мултиагентно AI решение, командите са същите.

Ако сте използвали azd преди, поддръжката на AI е естествено разширение — не отделен инструмент или напреднал път. Ако започвате отначало, ще научите един работен поток, който работи за всичко.

---

## 🚀 Какво е Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** е удобен за разработчици команден инструмент, който прави лесно разгръщането на приложения в Azure. Вместо ръчно да създавате и свързвате десетки ресурси в Azure, можете да разположите цялото приложение с една команда.

### Магията на `azd up`

```bash
# Една единствена команда прави всичко:
# ✅ Създава всички ресурси в Azure
# ✅ Конфигурира мрежата и сигурността
# ✅ Изгражда кода на вашето приложение
# ✅ Разгръща в Azure
# ✅ Предоставя ви работещ URL
azd up
```

**Това е!** Никакви кликове в Azure портала, никакви сложни ARM шаблони за учене първо, никаква ръчна конфигурация — само работещи приложения в Azure.

---

## ❓ Azure Developer CLI срещу Azure CLI: Каква е разликата?

Това е най-често задаваният въпрос от начинаещите. Ето простият отговор:

| Функция | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Цел** | Управление на отделни ресурси в Azure | Разгръщане на цели приложения |
| **Мислене** | Фокус върху инфраструктурата | Фокус върху приложението |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крива на учене** | Необходимо познаване на Azure услуги | Просто познаване на приложението ви |
| **Подходящо за** | DevOps, инфраструктура | Разработчици, прототипиране |

### Проста аналогия

- **Azure CLI** е като да имате всички инструменти за строеж на къща – чукове, триони, пирони. Можете да построите всичко, но трябва да знаете строителство.
- **Azure Developer CLI** е като да наемете предприемач – вие описвате какво искате и той се грижи за строежа.

### Кога да използвате кой

| Сценарий | Използвайте Това |
|----------|------------------|
| „Искам да разположа уеб приложението си бързо“ | `azd up` |
| „Трябва да създам само акаунт за съхранение“ | `az storage account create` |
| „Строя пълно AI приложение“ | `azd init --template azure-search-openai-demo` |
| „Трябва да отстраня проблема с конкретен ресурс в Azure“ | `az resource show` |
| „Искам разгръщане готово за продукция за минути“ | `azd up --environment production` |

### Те работят заедно!

AZD използва Azure CLI „под капака“. Можете да използвате и двете:
```bash
# Разположете приложението си с AZD
azd up

# След това фино настройте конкретни ресурси с Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Намиране на шаблони в Awesome AZD

Не започвайте от нулата! **Awesome AZD** е общностна колекция от готови за разгръщане шаблони:

| Ресурс | Описание |
|----------|-----------|
| 🔗 [**Awesome AZD Галерия**](https://azure.github.io/awesome-azd/) | Разглеждайте над 200 шаблона с разгръщане с един клик |
| 🔗 [**Изпратете шаблон**](https://github.com/Azure/awesome-azd/issues) | Допринесете със свой собствен шаблон към общността |
| 🔗 [**GitHub хранилище**](https://github.com/Azure/awesome-azd) | Последвайте и разгледайте изходния код |

### Популярни AI шаблони от Awesome AZD

```bash
# RAG чат с моделите на Microsoft Foundry + AI Search
azd init --template azure-search-openai-demo

# Бързо приложение за чат с ИИ
azd init --template openai-chat-app-quickstart

# ИИ агенти с Foundry агенти
azd init --template get-started-with-ai-agents
```

---

## 🎯 Как да започнете в 3 стъпки

Преди да започнете, уверете се, че машината ви е готова за шаблона, който искате да разположите:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ако някоя от необходимите проверки се провали, оправете това първо и след това продължете с бързия старт.

### Стъпка 1: Инсталирайте AZD (2 минути)

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

### Стъпка 2: Аутентикация за AZD

```bash
# Незадължително, ако възнамерявате да използвате команди на Azure CLI директно в този курс
az login

# Изисква се за работните потоци на AZD
azd auth login
```

Ако не сте сигурни кой ви е необходим, следвайте пълния процес на настройка в [Инсталация и настройка](docs/chapter-01-foundation/installation.md#authentication-setup).

### Стъпка 3: Разположете първото си приложение

```bash
# Инициализирай от шаблон
azd init --template todo-nodejs-mongo

# Разгръни в Azure (създава всичко!)
azd up
```

**🎉 Готово!** Вашето приложение вече работи в Azure.

### Почистване (Не забравяйте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как да използвате този курс

Този курс е предназначен за **постепенно учене** – започнете откъдето ви е удобно и напредвайте:

| Вашият опит | Начало тук |
|-------------|------------|
| **Напълно нов в Azure** | [Глава 1: Основи](#-chapter-1-foundation--quick-start) |
| **Познавате Azure, но нов в AZD** | [Глава 1: Основи](#-chapter-1-foundation--quick-start) |
| **Искате да разгръщате AI приложения** | [Глава 2: AI-Първо Развитие](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Искате практически опит** | [🎓 Интерактивен Workshop](workshop/README.md) – 3-4 часа водено упражнение |
| **Трябва ви продукционни модели** | [Глава 8: Продукция и Предприятие](#-chapter-8-production--enterprise-patterns) |

### Бърза настройка

1. **Fork-нете това хранилище**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирайте го**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Потърсете помощ**: [Azure Discord Общност](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитате да клонирате локално?**

> Това хранилище включва над 50 езикови превода, което значително увеличава размера на изтегляне. За да клонирате без преводи, използвайте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Това ви дава всичко необходимо за завършване на курса с много по-бързо изтегляне.


## Преглед на курса

Овладейте Azure Developer CLI (azd) чрез структурирани глави, предназначени за постепенно учене. **Особено внимание на разгръщането на AI приложения с интеграция Microsoft Foundry.**

### Защо този курс е от съществено значение за модерните разработчици

Основавайки се на наблюдения от Microsoft Foundry Discord общността, **45% от разработчиците искат да използват AZD за AI товари**, но срещат затруднения с:
- Сложни мултисървис AI архитектури
- Най-добри практики за продукционно разгръщане на AI  
- Интеграция и конфигурация на Azure AI услуги
- Оптимизиране на разходите за AI товари
- Отстраняване на специфични проблеми при AI разгръщане

### Учебни цели

Ще научите следното с завършване на този структуриран курс:
- **Овладяване на основите на AZD**: основни концепции, инсталация и конфигурация
- **Разгръщане на AI приложения**: използване на AZD с Microsoft Foundry услуги
- **Прилагане на инфраструктура като код**: управление на Azure ресурси с Bicep шаблони
- **Отстраняване на проблеми при разгръщане**: решаване на често срещани проблеми и дебъгване
- **Оптимизация за продукция**: сигурност, скалиране, мониторинг и управление на разходи
- **Създаване на мултиагентни решения**: разгръщане на сложни AI архитектури

## Преди да започнете: Акаунти, достъп и предпоставки

Преди да започнете Глава 1, уверете се, че имате следното на разположение. Стъпките за инсталация по-късно в това ръководство приемат, че тези основи вече са покрити.
- **Абонамент за Azure**: Можете да използвате съществуващ абонамент от работата си или лична сметка, или да създадете [безплатен пробен период](https://aka.ms/azurefreetrial), за да започнете.
- **Разрешение за създаване на ресурси в Azure**: За повечето упражнения трябва да имате поне **Contributor** достъп до целевия абонамент или група от ресурси. Някои глави може също да предполагат, че можете да създавате групи ресурси, управлявани идентичности и RBAC присвоявания.
- [**GitHub акаунт**](https://github.com): Полезен е за форкване на хранилището, проследяване на собствените ви промени и използване на GitHub Codespaces за работилницата.
- **Предварителни изисквания за работа с шаблони**: Някои шаблони изискват локални инструменти като Node.js, Python, Java или Docker. Стартирайте валидатора на настройката преди започване, за да откриете липсващи инструменти навреме.
- **Основни умения за работа с терминала**: Не е нужно да сте експерт, но трябва да се чувствате удобно да изпълнявате команди като `git clone`, `azd auth login` и `azd up`.

> **Работите в корпоративен абонамент?**  
> Ако вашата Azure среда се управлява от администратор, потвърдете предварително дали можете да разгръщате ресурси в абонамента или групата ресурси, която планирате да използвате. Ако не, помолете за sandbox абонамент или Contributor достъп преди да започнете.

> **Нови в Azure?**  
> Започнете с безплатния пробен период или абонамент pay-as-you-go на https://aka.ms/azurefreetrial, за да можете да завършите упражненията от начало до край без да чакате одобрения на ниво клиент.

## 🗺️ Карта на курса: Бърза навигация по глави

Всяка глава има отделен README с учебни цели, бърз старт и упражнения:

| Глава | Тема | Уроци | Продължителност | Сложност |
|---------|-------|---------|----------|------------|
| **[Гл. 1: Основи](docs/chapter-01-foundation/README.md)** | Започване | [AZD Основи](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталация](docs/chapter-01-foundation/installation.md) &#124; [Първи проект](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл. 2: AI разработка](docs/chapter-02-ai-development/README.md)** | AI-ориентирани приложения | [Интеграция с Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Разгръщане на модели](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Работилница](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ч | ⭐⭐ |
| **[Гл. 3: Конфигурация](docs/chapter-03-configuration/README.md)** | Удостоверяване и сигурност | [Конфигурация](docs/chapter-03-configuration/configuration.md) &#124; [Удостоверяване и сигурност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и разгръщане | [Ръководство за разгръщане](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провизиране](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ч | ⭐⭐⭐ |
| **[Гл. 5: Мулти-Агент](docs/chapter-05-multi-agent/README.md)** | AI решения с множество агенти | [Търговски сценарий](examples/retail-scenario.md) &#124; [Координационни модели](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[Гл. 6: Предварително разгръщане](docs/chapter-06-pre-deployment/README.md)** | Планиране и валидация | [Предварителни проверки](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планиране на капацитет](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор на SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ч | ⭐⭐ |
| **[Гл. 7: Отстраняване на проблеми](docs/chapter-07-troubleshooting/README.md)** | Отстраняване на грешки и корекция | [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Отстраняване на грешки](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ч | ⭐⭐ |
| **[Гл. 8: Производство](docs/chapter-08-production/README.md)** | Корпоративни модели | [Практики за производство](docs/chapter-08-production/production-ai-practices.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[🎓 Работилница](workshop/README.md)** | Практическа лаборатория | [Въведение](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Персонализация](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Премахване](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Обобщение](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ч | ⭐⭐ |

**Обща продължителност на курса:** ~10-14 часа | **Ниво на умения:** Начинаещ → Готов за производство

---

## 📚 Учебни глави

*Изберете път за учене според опита и целите си*

### 🚀 Глава 1: Основи и бърз старт  
**Изисквания**: Абонамент за Azure, базови познания с команден ред  
**Продължителност**: 30-45 минути  
**Сложност**: ⭐

#### Какво ще научите
- Основи на Azure Developer CLI
- Инсталиране на AZD на вашата платформа
- Вашето първо успешно разгръщане

#### Учебни ресурси
- **🎯 Започнете тук**: [Какво е Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теория**: [AZD Основи](docs/chapter-01-foundation/azd-basics.md) - Основни концепции и терминология
- **⚙️ Настройка**: [Инсталация и настройка](docs/chapter-01-foundation/installation.md) - Насоки за конкретни платформи
- **🛠️ Практика**: [Първият ви проект](docs/chapter-01-foundation/first-project.md) - Стъпка по стъпка урок
- **📋 Бърз справочник**: [Команден лист](resources/cheat-sheet.md)

#### Практически упражнения
```bash
# Бърза проверка на инсталацията
azd version

# Разположете първото си приложение
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат от главата**: Успешно разгръщане на проста уеб апликация в Azure чрез AZD

**✅ Потвърждение на успех:**
```bash
# След завършване на Глава 1, трябва да можете:
azd version              # Показва инсталираната версия
azd init --template todo-nodejs-mongo  # Инициализира проект
azd up                  # Разгръща в Azure
azd show                # Показва URL на работещото приложение
# Приложението се отваря в браузъра и работи
azd down --force --purge  # Почиства ресурсите
```

**📊 Време за инвестиция:** 30-45 минути  
**📈 Ниво на умения след:** Може самостоятелно да разгръща базови приложения  
**📈 Ниво на умения след:** Може самостоятелно да разгръща базови приложения

---

### 🤖 Глава 2: Разработка с приоритет AI (Препоръчано за AI разработчици)  
**Изисквания**: Приключена глава 1  
**Продължителност**: 1-2 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Интеграция на Microsoft Foundry с AZD
- Разгръщане на AI-задвижвани приложения
- Разбиране на AI конфигурации на услуги

#### Учебни ресурси
- **🎯 Започнете тук**: [Интеграция с Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Ръководство за AI агенти](docs/chapter-02-ai-development/agents.md) - Разгръщане на интелигентни агенти с AZD
- **📖 Модели**: [Разгръщане на AI модели](docs/chapter-02-ai-development/ai-model-deployment.md) - Разгръщайте и управлявайте AI модели
- **🛠️ Работилница**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Направете AI решенията си готови за AZD
- **🎥 Интерактивно ръководство**: [Материали за работилница](workshop/README.md) - Обучение в браузър с MkDocs * DevContainer среда
- **📋 Шаблони**: [Шаблони на Microsoft Foundry](#ресурси-за-работилницата)
- **📝 Примери**: [Примери за разгръщане с AZD](examples/README.md)

#### Практически упражнения
```bash
# Разгръщане на вашето първо приложение с изкуствен интелект
azd init --template azure-search-openai-demo
azd up

# Опитайте допълнителни шаблони за изкуствен интелект
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат от главата**: Разгръщане и конфигуриране на AI чат приложение с RAG възможности

**✅ Потвърждение на успех:**
```bash
# След Глава 2 трябва да можете да:
azd init --template azure-search-openai-demo
azd up
# Тествайте AI чат интерфейса
# Задавайте въпроси и получавайте AI-генерирани отговори с източници
# Проверете дали интеграцията за търсене работи
azd monitor  # Уверете се, че Application Insights показва телеметрията
azd down --force --purge
```

**📊 Време за инвестиция:** 1-2 часа  
**📈 Ниво на умения след:** Може да разгръща и конфигурира AI приложения готови за производство  
**💰 Информираност за разходи:** Разбира $80-150/месец за разработка, $300-3500/месец за производство

#### 💰 Разходи за AI разгръщане

**Среда за разработка (Оценка $80-150/месец):**  
- Microsoft Foundry модели (плащане според използване): $0-50/месец (базирано на токени)  
- AI Търсене (Базово ниво): $75/месец  
- Container Apps (Консумация): $0-20/месец  
- Съхранение (Стандартно): $1-5/месец

**Производствена среда (Оценка $300-3,500+/месец):**  
- Microsoft Foundry модели (PTU за постоянна производителност): $3,000+/месец ИЛИ плащане според използване при голям обем  
- AI Търсене (Стандартно ниво): $250/месец  
- Container Apps (Посветено): $50-100/месец  
- Application Insights: $5-50/месец  
- Съхранение (Премиум): $10-50/месец

**💡 Съвети за оптимизация на разходите:**  
- Използвайте **Безплатни нива** на Microsoft Foundry модели за обучение (Azure OpenAI включва 50,000 токена/месец)  
- Стартирайте `azd down`, за да разпуснете ресурси когато не разработвате активно  
- Започнете с плащане според консумацията, преминете на PTU само за продукция  
- Използвайте `azd provision --preview` за оценка на разходите преди разгръщане  
- Активирайте авторазмеряване: плащате само за реална употреба

**Мониторинг на разходите:**  
```bash
# Проверете предварително изчислените месечни разходи
azd provision --preview

# Проследявайте актуалните разходи в Azure портала
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Глава 3: Конфигурация и удостоверяване  
**Изисквания**: Приключена глава 1  
**Продължителност**: 45-60 минути  
**Сложност**: ⭐⭐

#### Какво ще научите
- Конфигурация и управление на средата
- Най-добри практики за удостоверяване и сигурност
- Именуване и организиране на ресурси

#### Учебни ресурси
- **📖 Конфигурация**: [Ръководство за конфигурация](docs/chapter-03-configuration/configuration.md) - Настройка на средата  
- **🔐 Сигурност**: [Удостоверяване и управлявани идентичности](docs/chapter-03-configuration/authsecurity.md) - Модели на удостоверяване  
- **📝 Примери**: [Пример с база данни](examples/database-app/README.md) - Примери с бази данни в AZD

#### Практически упражнения
- Конфигуриране на няколко среди (dev, staging, prod)  
- Настройка на удостоверяване с управлявана идентичност  
- Имплементиране на специфични за средата конфигурации

**💡 Резултат от главата**: Управление на множество среди с правилно удостоверяване и сигурност

---

### 🏗️ Глава 4: Инфраструктура като код и разгръщане  
**Изисквания**: Приключени глави 1-3  
**Продължителност**: 1-1.5 часа  
**Сложност**: ⭐⭐⭐

#### Какво ще научите
- Разширени модели за разгръщане
- Инфраструктура като код с Bicep
- Стратегии за провизиране на ресурси

#### Учебни ресурси
- **📖 Разгръщане**: [Ръководство за разгръщане](docs/chapter-04-infrastructure/deployment-guide.md) - Цялостни работни потоци  
- **🏗️ Провизиране**: [Управление на ресурси](docs/chapter-04-infrastructure/provisioning.md) - Управление на ресурси в Azure  
- **📝 Примери**: [Пример с Container App](../../examples/container-app) - Разгръщане на контейнеризирани приложения

#### Практически упражнения
- Създаване на персонализирани Bicep шаблони  
- Разгръщане на приложения с множество услуги  
- Имплементиране на blue-green стратегии за разгръщане

**💡 Резултат от главата**: Разгръщане на сложни многоуслугни приложения чрез персонализирани инфраструктурни шаблони

---

### 🎯 Глава 5: AI решения с множество агенти (Разширено)  
**Изисквания**: Приключени глави 1-2  
**Продължителност**: 2-3 часа  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Архитектурни модели за множество агенти  
- Организация и координация на агенти  
- Готови за производство AI разгръщания

#### Учебни ресурси
- **🤖 Представен проект**: [Търговско мултиагентско решение](examples/retail-scenario.md) - Цялостна реализация  
- **🛠️ ARM шаблони**: [ARM пакет шаблони](../../examples/retail-multiagent-arm-template) - Разгръщане с един клик  
- **📖 Архитектура**: [Координационни модели за множество агенти](docs/chapter-06-pre-deployment/coordination-patterns.md) - Модели

#### Практически упражнения
```bash
# Разгръщане на пълното търговско многоагентно решение
cd examples/retail-multiagent-arm-template
./deploy.sh

# Изследване на конфигурациите на агентите
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат от главата**: Разгръщане и управление на производство готово мултиагентско AI решение с агенти за клиенти и инвентар

---

### 🔍 Глава 6: Предварителна валидация и планиране  
**Изисквания**: Приключена глава 4  
**Продължителност**: 1 час  
**Сложност**: ⭐⭐
#### Какво ще научите
- Планиране на капацитета и валидиране на ресурсите
- Стратегии за избор на SKU
- Предварителни проверки и автоматизация

#### Ресурси за обучение
- **📊 Планиране**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидация на ресурси
- **💰 Избор**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Икономически ефективни избори
- **✅ Валидиране**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизирани скриптове

#### Практически упражнения
- Стартирайте скриптове за валидация на капацитета
- Оптимизирайте избора на SKU спрямо цена
- Реализирайте автоматизирани предварителни проверки преди разгръщане

**💡 Резултат от глава**: Валидирайте и оптимизирайте разгръщанията преди изпълнение

---

### 🚨 Глава 7: Отстраняване на проблеми и дебъгване
**Предварителни изисквания**: Завършена която и да е глава за разгръщане  
**Продължителност**: 1-1.5 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Систематични подходи за дебъгване
- Чести проблеми и решения
- Специфично отстраняване на проблеми с AI

#### Ресурси за обучение
- **🔧 Чести проблеми**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Често задавани въпроси и решения
- **🕵️ Ръководство за дебъгване**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Подробни стратегии
- **🤖 AI проблеми**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми с AI услуги

#### Практически упражнения
- Диагностициране на неуспешни разгръщания
- Решаване на проблеми с удостоверяване
- Дебъгване на свързаността с AI услугите

**💡 Резултат от глава**: Независимо диагностициране и решаване на често срещани проблеми при разгръщания

---

### 🏢 Глава 8: Производствени и корпоративни модели
**Предварителни изисквания**: Завършени глави 1-4  
**Продължителност**: 2-3 часа  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Стратегии за производство
- Корпоративни модели за сигурност
- Наблюдение и оптимизация на разходите

#### Ресурси за обучение
- **🏭 Производство**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Корпоративни модели
- **📝 Примери**: [Microservices Example](../../examples/microservices) - Комплексни архитектури
- **📊 Наблюдение**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практически упражнения
- Внедряване на корпоративни модели за сигурност
- Настройване на комплексен мониторинг
- Разгръщане в продукция с адекватно управление

**💡 Резултат от глава**: Разгръщане на корпоративни приложения с пълни производствени възможности

---

## 🎓 Преглед на работилницата: Практически учебен опит

> **⚠️ СЪСТОЯНИЕ НА РАБОТИЛНИЦАТА: Активна разработка**  
> Материалите за работилницата в момента се разработват и усъвършенстват. Основните модули работят, но някои напреднали секции не са завършени. Активно работим за завършване на цялото съдържание. [Проследете напредъка →](workshop/README.md)

### Интерактивни материали за работилницата
**Всеобхватно практическо обучение с браузър-базирани инструменти и ръководени упражнения**

Нашите материали за работилницата осигуряват структурирано, интерактивно преживяване, което допълва горната глава-базирана учебна програма. Работилницата е предназначена както за самостоятелно, така и за водено обучение.

#### 🛠️ Функции на работилницата
- **Браузър-базиран интерфейс**: Пълна MkDocs-базирана работилница с търсене, копиране и функции за тема
- **Интеграция с GitHub Codespaces**: Настройка на среда за разработка с един клик
- **Структуриран учебен път**: 8 модула с ръководени упражнения (общо 3-4 часа)
- **Прогресивна методология**: Въведение → Избор → Валидиране → Разграждане → Конфигуриране → Персонализиране → Разглобяване → Финал
- **Интерактивна DevContainer среда**: Предварително конфигурирани инструменти и зависимости

#### 📚 Структура на модулите на работилницата
Работилницата следва **8-модулна прогресивна методология**, която ви води от откриване до майсторство в разгръщането:

| Модул | Тема | Какво ще правите | Продължителност |
|--------|-------|-----------------|-----------------|
| **0. Въведение** | Преглед на работилницата | Запознаване с учебните цели, изисквания и структура на работилницата | 15 мин |
| **1. Избор** | Откриване на шаблони | Проучване на шаблоните AZD и избор на подходящ AI шаблон за вашия случай | 20 мин |
| **2. Валидиране** | Разгръщане и проверка | Разгръщане на шаблона с `azd up` и валидация на инфраструктурата | 30 мин |
| **3. Разграждане** | Разбиране на структурата | Използване на GitHub Copilot за разглеждане на архитектурата, Bicep файловете и организацията на кода | 30 мин |
| **4. Конфигуриране** | Задълбочаване в azure.yaml | Усвояване на конфигурацията в `azure.yaml`, lifecycle hooks и променливи на средата | 30 мин |
| **5. Персонализация** | Направете го свое | Активиране на AI търсене, проследяване, оценка и персонализиране за вашия сценарий | 45 мин |
| **6. Разглобяване** | Почистване | Безопасно де-провизиране на ресурси с `azd down --purge` | 15 мин |
| **7. Финал** | Следващи стъпки | Преглед на постижения, ключови концепции и продължаване на обучението | 15 мин |

**Работен поток:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Започване с работилницата
```bash
# Опция 1: GitHub Codespaces (Препоръчително)
# Кликнете върху "Code" → "Create codespace on main" в хранилището

# Опция 2: Локална разработка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Следвайте инструкциите за настройка в workshop/README.md
```

#### 🎯 Резултати от обучението в работилницата
Завършилите работилницата ще:
- **Разгърнат производствени AI приложения**: Използват AZD с услуги на Microsoft Foundry
- **Освоят мулти-агентни архитектури**: Реализират координирани AI агентни решения
- **Прилагат най-добри практики за сигурност**: Конфигурират удостоверяване и контрол на достъпа
- **Оптимизират за мащаб**: Проектират икономични и ефективни разгръщания
- **Отстраняват проблеми в разгръщанията**: Решават често срещани проблеми самостоятелно

#### 📖 Ресурси за работилницата
- **🎥 Интерактивно ръководство**: [Workshop Materials](workshop/README.md) - Браузър-базирана учебна среда
- **📋 Инструкции по модули**:
  - [0. Въведение](workshop/docs/instructions/0-Introduction.md) - Преглед и цели
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Откриване и избор на AI шаблони
  - [2. Валидиране](workshop/docs/instructions/2-Validate-AI-Template.md) - Разгръщане и проверка
  - [3. Разграждане](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Преглед на архитектурата
  - [4. Конфигуриране](workshop/docs/instructions/4-Configure-AI-Template.md) - Освояване на azure.yaml
  - [5. Персонализация](workshop/docs/instructions/5-Customize-AI-Template.md) - Персонализиране за вашия сценарий
  - [6. Разглобяване](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Почистване на ресурсите
  - [7. Финал](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следващи стъпки
- **🛠️ AI лаборатория за работилницата**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-фокусирани упражнения
- **💡 Бърз старт**: [Workshop Setup Guide](workshop/README.md#quick-start) - Настройка на средата

**Подходящо за**: Корпоративно обучение, университетски курсове, самостоятелно обучение и обучителни лагери за разработчици.

---

## 📖 Задълбочено разглеждане: Възможности на AZD

Отвъд основите, AZD предоставя мощни функции за производствени разгръщания:

- **Разгръщания, базирани на шаблони** - Използвайте предварително изградени шаблони за общи приложни модели
- **Инфраструктура като код** - Управление на Azure ресурси с помощта на Bicep или Terraform  
- **Интегрирани работни потоци** - Безпроблемно провизиране, разгръщане и мониторинг на приложения
- **Ориентиран към разработчика** - Оптимизиран за производителност и потребителско изживяване

### **AZD + Microsoft Foundry: Перфектно за AI разгръщания**

**Защо AZD за AI решения?** AZD адресира основните предизвикателства, пред които са изправени AI разработчиците:

- **AI-готови шаблони** - Предварително конфигурирани шаблони за Microsoft Foundry модели, когнитивни услуги и ML натоварвания
- **Сигурни AI разгръщания** - Вградени модели за сигурност за AI услуги, API ключове и крайни точки на модели  
- **Производствени AI модели** - Най-добри практики за мащабируеми и икономични AI приложения
- **Цялостни AI работни потоци** - От разработка на модели до производство с подходящ мониторинг
- **Оптимизация на разходите** - Умни стратегии за разпределение и скалиране на AI натоварвания
- **Интеграция с Microsoft Foundry** - Безпроблемна връзка с каталога на Microsoft Foundry модели и крайни точки

---

## 🎯 Библиотека с шаблони и примери

### Препоръчано: Шаблони Microsoft Foundry
**Започнете тук, ако разгръщате AI приложения!**

> **Забележка:** Тези шаблони демонстрират различни AI модели. Някои са външни Azure Samples, други са локални реализации.

| Шаблон | Глава | Сложност | Услуги | Тип |
|----------|---------|------------|----------|------|
| [**Начало с AI чат**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Външен |
| [**Начало с AI агенти**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Външен |
| [**Демо с Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Външен |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Външен |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Външен |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Външен |
| [**Решение с мулти-агенти за търговия**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локален** |

### Препоръчано: Завършени учебни сценарии
**Приложни шаблони, готови за производство, съпоставени с учебните глави**

| Шаблон | Учебна глава | Сложност | Ключово обучение |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Основни AI модели за разгръщане |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | РЕГ имплементация с Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Глава 4 | ⭐⭐ | Интеграция на документен интелект |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Агентна рамка и функция за повикване |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Корпоративна AI оркестрация |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Мулти-агентна архитектура с клиенти и инвентарни агенти |

### Обучение чрез примери

> **📌 Локални срещу външни примери:**  
> **Локални примери** (в това хранилище) = Готови за използване веднага  
> **Външни примери** (Azure Samples) = Клониране от свързани хранилища

#### Локални примери (готови за използване)
- [**Решение с мулти-агенти за търговия**](examples/retail-scenario.md) - Пълна производствена реализация с ARM шаблони
  - Мулти-агентна архитектура (Клиент + Инвентар)
  - Изчерпателен мониторинг и оценка
  - Разгръщане с един клик чрез ARM шаблон

#### Локални примери - Контейнерни приложения (глави 2-5)
**Всеобхватни примери за контейнерно разгръщане в това хранилище:**
- [**Примери с контейнерни приложения**](examples/container-app/README.md) - Пълно ръководство за контейнеризирани разгръщания
  - [Прост Flask API](../../examples/container-app/simple-flask-api) - Основен REST API с автоматично скалиране към нула
  - [Архитектура с микросервизи](../../examples/container-app/microservices) - Производствено готово много-сервизно разгръщане
  - Бърз старт, продукция и напреднали модели за разгръщане
  - Насоки за наблюдение, сигурност и оптимизация на разходите

#### Външни примери - Прости приложения (глави 1-2)
**Клонирайте тези хранилища с Azure Samples за започване:**
- [Прост уеб сайт - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни модели за разгръщане
- [Статичен сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Разгръщане на статично съдържание
- [Контейнерно приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Разгръщане на REST API

#### Външни примери - Интеграция на база данни (глава 3-4)  
- [Приложение с база данни - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Шаблони за свързване с база данни
- [Функции + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсървърни процеси за данни

#### Външни примери - Разширени шаблони (Глави 4-8)
- [Java Микросървиси](https://github.com/Azure-Samples/java-microservices-aca-lab) - Многосервизни архитектури
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Фонови обработки  
- [Предприятна ML верига](https://github.com/Azure-Samples/mlops-v2) - Производствени ML шаблони

### Външни колекции от шаблони
- [**Официална галерия на шаблони AZD**](https://azure.github.io/awesome-azd/) - Подбрана колекция от официални и общностни шаблони
- [**Шаблони за Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документация за шаблони на Microsoft Learn
- [**Директория с примери**](examples/README.md) - Местни учебни примери с подробни обяснения

---

## 📚 Учебни ресурси и препратки

### Бързи справки
- [**Таблица с команди**](resources/cheat-sheet.md) - Основни azd команди, организирани по глави
- [**Речник**](resources/glossary.md) - Терминология за Azure и azd  
- [**Често задавани въпроси**](resources/faq.md) - Често срещани въпроси, организирани по учебни глави
- [**Учебно ръководство**](resources/study-guide.md) - Обширни практически упражнения

### Практически работилници
- [**Лаборатория AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Направете вашите AI решения готови за разгръщане с AZD (2-3 часа)
- [**Интерактивна работилница**](workshop/README.md) - 8-модулни насочени упражнения с MkDocs и GitHub Codespaces
  - Следва: Въведение → Избор → Проверка → Декомпозиране → Конфигурация → Персонализация → Демонтаж → Обобщение

### Външни учебни ресурси
- [Документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калкулатор за ценообразуване на Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус на Azure](https://status.azure.com/)

### AI агент умения за вашия редактор
- [**Microsoft Azure умения в skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворени умения за AI агент за Azure, Foundry, разгръщане, диагностика, оптимизация на разходите и др. Инсталирайте ги в GitHub Copilot, Cursor, Claude Code или друг поддържан агент:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Бързо ръководство за отстраняване на проблеми

**Чести проблеми, с които се сблъскват начинаещите, и незабавни решения:**

<details>
<summary><strong>❌ "azd: команда не е намерена"</strong></summary>

```bash
# Инсталирайте първо AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Потвърдете инсталацията
azd version
```
</details>

<details>
<summary><strong>❌ "Не е намерен абонамент" или "Абонаментът не е зададен"</strong></summary>

```bash
# Изброяване на наличните абонаменти
az account list --output table

# Задаване на подразбиращ се абонамент
az account set --subscription "<subscription-id-or-name>"

# Задаване за AZD среда
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Проверка
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" или "Превишена квота"</strong></summary>

```bash
# Опитайте различен регион на Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Или използвайте по-малки SKUs в разработка
# Редактирайте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" спира наполовина</strong></summary>

```bash
# Опция 1: Почисти и опитай отново
azd down --force --purge
azd up

# Опция 2: Просто оправи инфраструктурата
azd provision

# Опция 3: Провери подробния статус
azd show

# Опция 4: Провери логовете в Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Неуспешна автентикация" или "Токенът е изтекъл"</strong></summary>

```bash
# Повторна автентикация за AZD
azd auth logout
azd auth login

# По избор: обновете и Azure CLI, ако изпълнявате az команди
az logout
az login

# Потвърдете автентикацията
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурсът вече съществува" или конфликти с имена</strong></summary>

```bash
# AZD генерира уникални имена, но при конфликт:
azd down --force --purge

# След това опитайте отново с нова среда
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Разгръщането на шаблон се бави твърде дълго</strong></summary>

**Нормални времена за изчакване:**
- Просто уеб приложение: 5-10 минути
- Приложение с база данни: 10-15 минути
- AI приложения: 15-25 минути (Provisioning за OpenAI е бавен)

```bash
# Проверете напредъка
azd show

# Ако сте заседнали >30 минути, проверете Azure портала:
azd monitor --overview
# Потърсете неуспешни внедрявания
```
</details>

<details>
<summary><strong>❌ "Достъпът е отказан" или "Забранено"</strong></summary>

```bash
# Проверете вашата Azure роля
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Необходима ви е поне роля "Contributor"
# Помолете вашия Azure администратор да предостави:
# - Contributor (за ресурси)
# - Администратор на достъп на потребител (за разпределение на роли)
```
</details>

<details>
<summary><strong>❌ Не може да се намери URL адресът на разположеното приложение</strong></summary>

```bash
# Покажи всички крайни точки на услугата
azd show

# Или отвори Azure портала
azd monitor

# Провери конкретна услуга
azd env get-values
# Потърси променливи *_URL
```
</details>

### 📚 Пълни ресурси за отстраняване на проблеми

- **Ръководство за чести проблеми:** [Подробни решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, свързани с AI:** [Отстраняване на проблеми с AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ръководство за отстраняване на грешки:** [Отстраняване на грешки стъпка по стъпка](docs/chapter-07-troubleshooting/debugging.md)
- **Получете помощ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завършване на курса и сертификат

### Проследяване на напредъка
Проследявайте напредъка си в обучението през всяка глава:

- [ ] **Глава 1**: Основи и Бързо стартиране ✅
- [ ] **Глава 2**: AI-първо разработване ✅  
- [ ] **Глава 3**: Конфигурация и Аутентикация ✅
- [ ] **Глава 4**: Инфраструктура като код и Разгръщане ✅
- [ ] **Глава 5**: Многоагентски AI решения ✅
- [ ] **Глава 6**: Предварителна проверка и планиране ✅
- [ ] **Глава 7**: Отстраняване на проблеми и отладка ✅
- [ ] **Глава 8**: Производствени и предприятия шаблони ✅

### Проверка на наученото
След завършване на всяка глава, проверете знанията си чрез:
1. **Практическо упражнение**: Завършете приложението за разгръщане на глава
2. **Проверка на знанията**: Прегледайте секцията с често задавани въпроси за вашата глава
3. **Обсъждане в общността**: Споделете опита си в Azure Discord
4. **Следваща глава**: Преминете към следващото ниво на сложност

### Предимства при завършване на курса
След като завършите всички глави, ще имате:
- **Производствен опит**: Разгърнали реални AI приложения в Azure
- **Професионални умения**: Възможности за разгръщане, готови за предприятие  
- **Признание в общността**: Активен член на Azure разработчиците
- **Кариерно развитие**: Търсени умения за AZD и AI разгръщане

---

## 🤝 Общество и поддръжка

### Вземете помощ и поддръжка
- **Технически проблеми**: [Докладвайте грешки и поискайте функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Въпроси за обучение**: [Microsoft Azure Discord общност](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощ за AI**: Присъединете се към [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официална документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Информация от Microsoft Foundry Discord общността

**Скорошни резултати от анкета в #Azure канал:**
- **45%** от разработчиците искат да използват AZD за AI натоварвания
- **Основни предизвикателства**: Многосервизни разгръщания, управление на идентификационни данни, готовност за производство  
- **Най-запитвани**: AI-специфични шаблони, ръководства за отстраняване на проблеми, добри практики

**Присъединете се към нашата общност, за да:**
- Споделяте вашите AZD + AI опит и да получавате помощ
- Достъп до предварителни версии на нови AI шаблони
- Допринасяте за най-добрите практики при AI разгръщания
- Влияете върху бъдещата разработка на AI + AZD функции

### Принос към курса
Добре дошли са приноси! Моля, прочетете нашето [Ръководство за принос](CONTRIBUTING.md) за подробности относно:
- **Подобрения на съдържанието**: Подобряване на съществуващи глави и примери
- **Нови примери**: Добавяне на реални сценарии и шаблони  
- **Превод**: Помощ за поддържане на многоезична поддръжка
- **Докладване на грешки**: Подобряване на точността и яснота
- **Обществени стандарти**: Спазване на нашите приобщаващи насоки в общността

---

## 📄 Информация за курса

### Лиценз
Този проект е лицензиран под MIT лиценз - вижте файла [LICENSE](../../LICENSE) за подробности.

### Свързани учебни ресурси на Microsoft

Нашият екип създава и други обширни учебни курсове:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j за начинаещи](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js за начинаещи](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain за начинаещи](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Агенти
[![AZD за начинаещи](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI за начинаещи](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP за начинаещи](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI агенти за начинаещи](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Генеративен AI Серии
[![Генеративен AI за начинаещи](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно обучение
[![ML за начинаещи](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Наука за данни за начинаещи](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Изкуствен интелект за начинаещи](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Киберсигурност за начинаещи](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Уеб разработка за начинаещи](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Интернет на нещата за начинаещи](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Разработка на разширена реалност за начинаещи](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Copilot
[![Copilot за AI и съвместно програмиране](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Приключение с Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигация в курса

**🚀 Готови ли сте да започнете да учите?**

**Начинаещи**: Започнете с [Глава 1: Основи и бърз старт](#-chapter-1-foundation--quick-start)  
**AI разработчици**: Преминете към [Глава 2: Разработка с приоритет AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Опитни разработчици**: Започнете с [Глава 3: Конфигуриране и удостоверяване](#️-chapter-3-configuration--authentication)

**Следващи стъпки**: [Започнете Глава 1 - Основи на AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен чрез AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия език трябва да се счита за официален източник. За критична информация се препоръчва професионален превод от човек. Не носим отговорност за каквито и да е неправилни тълкувания или грешки, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->