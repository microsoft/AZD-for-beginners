# AZD за начинаещи: Структуриран учебен път

![AZD за начинаещи](../../translated_images/bg/azdbeginners.5527441dd9f74068.webp) 

[![Наблюдатели в GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Форкове в GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Звезди в GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord на Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord на Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматични преводи (винаги актуални)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Български](./README.md) | [Бирмански (Мианмар)](../my/README.md) | [Китайски (опростен)](../zh-CN/README.md) | [Китайски (традиционен, Хонконг)](../zh-HK/README.md) | [Китайски (традиционен, Макао)](../zh-MO/README.md) | [Китайски (традиционен, Тайван)](../zh-TW/README.md) | [Хърватски](../hr/README.md) | [Чешки](../cs/README.md) | [Датски](../da/README.md) | [Холандски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Френски](../fr/README.md) | [Немски](../de/README.md) | [Гръцки](../el/README.md) | [Иврит](../he/README.md) | [Хинди](../hi/README.md) | [Унгарски](../hu/README.md) | [Индонезийски](../id/README.md) | [Италиански](../it/README.md) | [Японски](../ja/README.md) | [Каннада](../kn/README.md) | [Корейски](../ko/README.md) | [Литовски](../lt/README.md) | [Малайски](../ms/README.md) | [Малаялам](../ml/README.md) | [Марати](../mr/README.md) | [Непалски](../ne/README.md) | [Нигерийски пиджин](../pcm/README.md) | [Норвежки](../no/README.md) | [Персийски (фарси)](../fa/README.md) | [Полски](../pl/README.md) | [Португалски (Бразилия)](../pt-BR/README.md) | [Португалски (Португалия)](../pt-PT/README.md) | [Пенджабски (Gurmukhi)](../pa/README.md) | [Румънски](../ro/README.md) | [Руски](../ru/README.md) | [Сръбски (кирилица)](../sr/README.md) | [Словашки](../sk/README.md) | [Словенски](../sl/README.md) | [Испански](../es/README.md) | [Суахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (Филипински)](../tl/README.md) | [Тамилски](../ta/README.md) | [Телугу](../te/README.md) | [Тайски](../th/README.md) | [Турски](../tr/README.md) | [Украински](../uk/README.md) | [Урду](../ur/README.md) | [Виетнамски](../vi/README.md)

> **Предпочитате да клонирате локално?**
>
> Това хранилище включва над 50 езикови превода, което значително увеличава размера на изтеглянето. За да клонирате без преводи, използвайте sparse checkout:
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
> Това ви осигурява всичко необходимо за завършване на курса с много по-бързо изтегляне.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Какво е Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** е команден инструмент, удобен за разработчици, който улеснява разгръщането на приложения в Azure. Вместо да създавате и свързвате ръчно десетки Azure ресурси, можете да разположите цялото приложение с една команда.

### Магията на `azd up`

```bash
# Тази една команда прави всичко:
# ✅ Създава всички Azure ресурси
# ✅ Конфигурира мрежата и сигурността
# ✅ Компилира вашия код на приложението
# ✅ Разгръща в Azure
# ✅ Предоставя работещ URL
azd up
```

**Това е всичко!** Никакво кликване в Azure Portal, никакви сложни ARM шаблони, които да учите първо, никаква ръчна конфигурация - само работещи приложения в Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Каква е разликата?

Това е най-често задаваният въпрос от начинаещите. Ето простия отговор:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Проста аналогия

- **Azure CLI** е като да имате всички инструменти, за да построите къща - чукове, триони, пирони. Можете да построите всичко, но трябва да знаете строителство.
- **Azure Developer CLI** е като да наемете изпълнител - описвате какво искате и те се грижат за построяването.

### Кога да използвате кой

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Работят заедно!

AZD използва Azure CLI под капака. Можете да използвате и двете:
```bash
# Разположете приложението си с AZD
azd up

# След това настройте конкретни ресурси с Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Намерете шаблони в Awesome AZD

Не започвайте от нулата! **Awesome AZD** е общностна колекция от готови за разгръщане шаблони:

| Resource | Description |
|----------|-------------|
| 🔗 [**Галерията на Awesome AZD**](https://azure.github.io/awesome-azd/) | Прегледайте 200+ шаблона с едно кликване за разгръщане |
| 🔗 [**Подайте шаблон**](https://github.com/Azure/awesome-azd/issues) | Допринесете със собствен шаблон за общността |
| 🔗 [**GitHub хранилище**](https://github.com/Azure/awesome-azd) | Дайте звезда и разгледайте източника |

### Популярни AI шаблони от Awesome AZD

```bash
# RAG чат с Azure OpenAI + AI търсене
azd init --template azure-search-openai-demo

# Бързо AI чат приложение
azd init --template openai-chat-app-quickstart

# AI агенти с Foundry агенти
azd init --template get-started-with-ai-agents
```

---

## 🎯 Стартиране в 3 стъпки

### Стъпка 1: Инсталиране на AZD (2 минути)

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

### Стъпка 2: Влизане в Azure

```bash
azd auth login
```

### Стъпка 3: Разгръщане на първото ви приложение

```bash
# Инициализиране от шаблон
azd init --template todo-nodejs-mongo

# Деплой в Azure (създава всичко!)
azd up
```

**🎉 Това е всичко!** Вашето приложение вече работи в Azure.

### Почистване (Не забравяйте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как да използвате този курс

Този курс е предназначен за **постепенно обучение** - започнете там, където се чувствате удобно, и напредвайте постепенно:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Гл. 1: Основи](../..) |
| **Know Azure, new to AZD** | [Гл. 1: Основи](../..) |
| **Want to deploy AI apps** | [Гл. 2: AI-първи разработки](../..) |
| **Want hands-on practice** | [🎓 Интерактивен семинар](workshop/README.md) - 3-4 часа ръководена лаборатория |
| **Need production patterns** | [Гл. 8: Продукция & корпоративни модели](../..) |

### Бързо настройване

1. **Форкнете това хранилище**: [![Форкове в GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирайте го**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Потърсете помощ**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитате да клонирате локално?**
>
> Това хранилище включва над 50 езикови превода, което значително увеличава размера на изтеглянето. За да клонирате без преводи, използвайте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Това ви осигурява всичко необходимо за завършване на курса с много по-бързо изтегляне.


## Преглед на курса

Овладейте Azure Developer CLI (azd) чрез структурирани глави, създадени за постепенно обучение. **Специален фокус върху разгръщането на AI приложения с интеграция на Microsoft Foundry.**

### Защо този курс е важен за съвременните разработчици

Въз основа на информация от общността в Microsoft Foundry Discord, **45% от разработчиците искат да използват AZD за AI натоварвания**, но срещат предизвикателства с:
- Сложни AI архитектури с много услуги
- Най-добри практики за разгръщане на AI в продукция  
- Интеграция и конфигурация на Azure AI услуги
- Оптимизация на разходите за AI натоварвания
- Отстраняване на проблеми при специфични за AI разгръщания

### Учебни цели

След завършване на този структуриран курс ще:
- **Овладeете основите на AZD**: Основни концепции, инсталация и конфигурация
- **Разгръщате AI приложения**: Използвайте AZD с услуги на Microsoft Foundry
- **Прилагате инфраструктура като код**: Управление на Azure ресурси с Bicep шаблони
- **Отстранявате проблеми при разгръщания**: Решаване на често срещани проблеми и дебъгване
- **Оптимизирате за продукция**: Сигурност, мащабиране, мониторинг и управление на разходите
- **Създавате мулти-агентни решения**: Разгръщане на сложни AI архитектури

## 🗺️ Карта на курса: Бърза навигация по глави

Всяка глава има отделно README с учебни цели, бързи стартирания и упражнения:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Гл. 1: Основи](docs/chapter-01-foundation/README.md)** | Първи стъпки | [Основи на AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталиране](docs/chapter-01-foundation/installation.md) &#124; [Първи проект](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл. 2: AI разработки](docs/chapter-02-ai-development/README.md)** | AI-първи приложения | [Интеграция с Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Разгръщане на модели](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Работилница](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ч | ⭐⭐ |
| **[Гл. 3: Конфигурация](docs/chapter-03-configuration/README.md)** | Удостоверяване & сигурност | [Конфигурация](docs/chapter-03-configuration/configuration.md) &#124; [Удостоверяване & сигурност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и Разгръщане | [Ръководство за разгръщане](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провизиране](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ч | ⭐⭐⭐ |
| **[Гл. 5: Мулти-агент](docs/chapter-05-multi-agent/README.md)** | Решения с AI агенти | [Сценарий за търговия на дребно](examples/retail-scenario.md) &#124; [Шаблони за координация](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[Гл. 6: Предварително разгръщане](docs/chapter-06-pre-deployment/README.md)** | Планиране и валидация | [Предполетни проверки](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планиране на капацитет](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор на SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ч | ⭐⭐ |
| **[Гл. 7: Отстраняване на неизправности](docs/chapter-07-troubleshooting/README.md)** | Отстраняване и поправяне | [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Дебъгване](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ч | ⭐⭐ |
| **[Гл. 8: Продукция](docs/chapter-08-production/README.md)** | Корпоративни практики | [Практики за продукция](docs/chapter-08-production/production-ai-practices.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[🎓 Работилница](workshop/README.md)** | Практическа лаборатория | [Въведение](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Декомпозиция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Персонализиране](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Премахване на инфраструктурата](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Заключение](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ч | ⭐⭐ |

**Общо време на курса:** ~10-14 часа | **Ниво на умения:** Начинаещ → Готов за продукция

---

## 📚 Учебни глави

*Изберете своя учебен път въз основа на нивото на опит и целите си*

### 🚀 Глава 1: Основи и бърз старт
**Предварителни изисквания**: Абонамент за Azure, базови знания за командния ред  
**Продължителност**: 30-45 минути  
**Сложност**: ⭐

#### Какво ще научите
- Разбиране на основите на Azure Developer CLI
- Инсталиране на AZD на вашата платформа
- Вашето първо успешно разгръщане

#### Учебни ресурси
- **🎯 Започнете тук**: [Какво е Azure Developer CLI?](../..)
- **📖 Теория**: [Основи на AZD](docs/chapter-01-foundation/azd-basics.md) - Основни концепции и терминология
- **⚙️ Настройка**: [Инсталиране и настройка](docs/chapter-01-foundation/installation.md) - Ръководства за специфични платформи
- **🛠️ Практика**: [Вашият първи проект](docs/chapter-01-foundation/first-project.md) - Урок стъпка по стъпка
- **📋 Бърза справка**: [Справочник с команди](resources/cheat-sheet.md)

#### Практически упражнения
```bash
# Бърза проверка на инсталацията
azd version

# Разгърнете първото си приложение
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат от главата**: Успешно разгръщане на просто уеб приложение в Azure с помощта на AZD

**✅ Успешна проверка:**
```bash
# След като завършите Глава 1, трябва да можете:
azd version              # Показва инсталираната версия
azd init --template todo-nodejs-mongo  # Инициализира проект
azd up                  # Разгръща в Azure
azd show                # Показва URL адреса на работещото приложение
# Приложението се отваря в браузъра и работи
azd down --force --purge  # Почиства ресурсите
```

**📊 Необходимо време:** 30-45 минути  
**📈 Ниво на умения след това:** Може да разгръща базови приложения самостоятелно

**✅ Успешна проверка:**
```bash
# След като завършите Глава 1, трябва да можете да:
azd version              # Показва инсталираната версия
azd init --template todo-nodejs-mongo  # Инициализира проекта
azd up                  # Разгръща в Azure
azd show                # Показва URL адреса на работещото приложение
# Приложението се отваря в браузъра и работи
azd down --force --purge  # Премахва ресурсите
```

**📊 Необходимо време:** 30-45 минути  
**📈 Ниво на умения след това:** Може да разгръща базови приложения самостоятелно

---

### 🤖 Глава 2: AI-първо разработване (Препоръчително за AI разработчици)
**Предварителни изисквания**: Глава 1 завършена  
**Продължителност**: 1-2 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Интеграция на Microsoft Foundry с AZD
- Разгръщане на приложения с AI функционалност
- Разбиране на конфигурациите на AI услугите

#### Учебни ресурси
- **🎯 Започнете тук**: [Интеграция с Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Ръководство за AI агенти](docs/chapter-02-ai-development/agents.md) - Разгръщане на интелигентни агенти с AZD
- **📖 Шаблони**: [Разгръщане на AI модели](docs/chapter-02-ai-development/ai-model-deployment.md) - Разгръщане и управление на AI модели
- **🛠️ Работилница**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Направете вашите AI решения съвместими с AZD
- **🎥 Интерактивно ръководство**: [Материали от работилницата](workshop/README.md) - Обучение в браузър с MkDocs * DevContainer среда
- **📋 Шаблони**: [Microsoft Foundry Templates](../..)
- **📝 Примери**: [Примери за разгръщане с AZD](examples/README.md)

#### Практически упражнения
```bash
# Разположете вашето първо ИИ приложение
azd init --template azure-search-openai-demo
azd up

# Опитайте допълнителни ИИ шаблони
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат от главата**: Разгръщане и конфигуриране на чат приложение с AI и RAG възможности

**✅ Успешна проверка:**
```bash
# След глава 2 трябва да можете:
azd init --template azure-search-openai-demo
azd up
# Тествайте интерфейса за чат с ИИ
# Задавайте въпроси и получавайте ИИ-генерирани отговори с източници
# Проверете дали интеграцията за търсене работи
azd monitor  # Проверете дали Application Insights показва телеметрия
azd down --force --purge
```

**📊 Необходимо време:** 1-2 часа  
**📈 Ниво на умения след това:** Може да разгръща и конфигурира продукционно готови AI приложения  
**💰 Информация за разходите:** Разберете развойни разходи $80-150/месец, продукционни разходи $300-3500/месец

#### 💰 Съображения за разходите при AI разгръщания

**Развойна среда (Оценка $80-150/месец):**
- Azure OpenAI (Pay-as-you-go): $0-50/месец (въз основа на използване на токени)
- AI Search (Basic ниво): $75/месец
- Container Apps (Consumption): $0-20/месец
- Storage (Standard): $1-5/месец

**Продукционна среда (Оценка $300-3,500+/месец):**
- Azure OpenAI (PTU за последователна производителност): $3,000+/месец ИЛИ Pay-as-you-go при голям обем
- AI Search (Standard ниво): $250/месец
- Container Apps (Dedicated): $50-100/месец
- Application Insights: $5-50/месец
- Storage (Premium): $10-50/месец

**💡 Съвети за оптимизиране на разходите:**
- Използвайте **Free Tier** на Azure OpenAI за обучение (включени 50,000 токена/месец)
- Стартирайте `azd down`, за да освободите ресурси, когато не разработвате активно
- Започнете с таксуване на база потребление, надстройте до PTU само за продукция
- Използвайте `azd provision --preview` за оценка на разходите преди разгръщане
- Активирайте авто-мащабиране: плащайте само за реалното използване

**Проследяване на разходите:**
```bash
# Проверете оценените месечни разходи
azd provision --preview

# Наблюдавайте реалните разходи в портала на Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Глава 3: Конфигурация и удостоверяване
**Предварителни изисквания**: Глава 1 завършена  
**Продължителност**: 45-60 минути  
**Сложност**: ⭐⭐

#### Какво ще научите
- Конфигурация и управление на среди
- Най-добри практики за удостоверяване и сигурност
- Именуване и организация на ресурси

#### Учебни ресурси
- **📖 Конфигурация**: [Ръководство за конфигурация](docs/chapter-03-configuration/configuration.md) - Настройка на среда
- **🔐 Сигурност**: [Шаблони за удостоверяване и управлявана идентичност](docs/chapter-03-configuration/authsecurity.md) - Шаблони за удостоверяване
- **📝 Примери**: [Пример за база данни](examples/database-app/README.md) - AZD примери за бази данни

#### Практически упражнения
- Конфигурирайте множество среди (dev, staging, prod)
- Настройте удостоверяване с управлявана идентичност
- Имплементирайте конфигурации, специфични за средата

**💡 Резултат от главата**: Управление на множество среди с правилно удостоверяване и сигурност

---

### 🏗️ Глава 4: Инфраструктура като код и разгръщане
**Предварителни изисквания**: Глави 1-3 завършени  
**Продължителност**: 1-1.5 ч  
**Сложност**: ⭐⭐⭐

#### Какво ще научите
- Разширени модели за разгръщане
- Инфраструктура като код с Bicep
- Стратегии за провизиране на ресурси

#### Учебни ресурси
- **📖 Разгръщане**: [Ръководство за разгръщане](docs/chapter-04-infrastructure/deployment-guide.md) - Пълни работни потоци
- **🏗️ Провизиране**: [Провизиране на ресурси](docs/chapter-04-infrastructure/provisioning.md) - Управление на Azure ресурси
- **📝 Примери**: [Пример с Container App](../../examples/container-app) - Разгръщане на контейнеризирани приложения

#### Практически упражнения
- Създайте персонализирани Bicep шаблони
- Разположете многосервисни приложения
- Имплементирайте стратегии за blue-green разгръщане

**💡 Резултат от главата**: Разгръщане на сложни многосервисни приложения с помощта на персонализирани инфраструктурни шаблони

---

### 🎯 Глава 5: Мулти-агентни AI решения (Напреднали)
**Предварителни изисквания**: Глави 1-2 завършени  
**Продължителност**: 2-3 ч  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Архитектурни шаблони за мулти-агентни системи
- Оркестрация и координация на агенти
- Продукционно готови AI внедрявания

#### Учебни ресурси
- **🤖 Препоръчан проект**: [Мултиагентно решение за търговия на дребно](examples/retail-scenario.md) - Пълна реализация
- **🛠️ ARM шаблони**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Разгръщане с един клик
- **📖 Архитектура**: [Шаблони за координация на мулти-агенти](docs/chapter-06-pre-deployment/coordination-patterns.md) - Шаблони

#### Практически упражнения
```bash
# Разположете пълното многоагентно решение за търговия на дребно
cd examples/retail-multiagent-arm-template
./deploy.sh

# Проучете конфигурациите на агентите
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат от главата**: Разгръщане и управление на продукционно готово мулти-агентно AI решение с агенти за Клиенти и Инвентар

---

### 🔍 Глава 6: Валидация и планиране преди разгръщане
**Предварителни изисквания**: Глава 4 завършена  
**Продължителност**: 1 ч  
**Сложност**: ⭐⭐

#### Какво ще научите
- Планиране на капацитет и валидация на ресурси
- Стратегии за избор на SKU
- Предполетни проверки и автоматизация

#### Учебни ресурси
- **📊 Планиране**: [Планиране на капацитет](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидация на ресурси
- **💰 Избор**: [Избор на SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Икономически ефективни избори
- **✅ Валидация**: [Предполетни проверки](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизирани скриптове

#### Практически упражнения
- Стартирайте скриптове за валидация на капацитет
- Оптимизирайте изборите на SKU за разходи
- Имплементирайте автоматизирани предполетни проверки

**💡 Резултат от главата**: Валидация и оптимизация на разгръщанията преди изпълнение

---

### 🚨 Глава 7: Отстраняване на неизправности и дебъгване
**Предварителни изисквания**: Всяка глава за разгръщане е завършена  
**Продължителност**: 1-1.5 ч  
**Сложност**: ⭐⭐

#### Какво ще научите
- Систематични подходи за дебъгване
- Чести проблеми и решения
- AI-специфично отстраняване на неизправности

#### Учебни ресурси
- **🔧 Чести проблеми**: [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) - Често задавани въпроси и решения
- **🕵️ Дебъгване**: [Ръководство за дебъгване](docs/chapter-07-troubleshooting/debugging.md) - Стъпка по стъпка стратегии
- **🤖 AI проблеми**: [AI-специфично отстраняване на неизправности](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми с AI услугите

#### Практически упражнения
- Диагностицирайте неуспехи при разгръщане
- Решете проблеми с удостоверяването
- Дебъгвайте свързаността на AI услуги

**💡 Резултат от главата**: Самостоятелно диагностициране и решаване на чести проблеми при разгръщане

---

### 🏢 Глава 8: Продукция и корпоративни практики
**Предварителни изисквания**: Глави 1-4 завършени  
**Продължителност**: 2-3 ч  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Стратегии за продукционно разгръщане
- Корпоративни шаблони за сигурност
- Мониторинг и оптимизация на разходите

#### Учебни ресурси
- **🏭 Продукция**: [Най-добри практики за AI в продукция](docs/chapter-08-production/production-ai-practices.md) - Корпоративни практики
- **📝 Примери**: [Пример с микросървиси](../../examples/microservices) - Сложни архитектури
- **📊 Мониторинг**: [Интеграция на Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практически упражнения
- Имплементирайте корпоративни шаблони за сигурност
- Настройте всеобхватен мониторинг
- Разположете в продукция с правилно управление

**💡 Резултат от главата**: Разгръщане на приложения, готови за предприятие, с пълни продукционни възможности

---

## 🎓 Преглед на работилницата: Практическо учебно преживяване

> **⚠️ СТАТУС НА РАБОТИЛНИЦАТА: В процес на разработка**
> Материалите за работилницата в момента се разработват и усъвършенстват. Основните модули са функционални, но някои напреднали секции са незавършени. Активно работим за завършване на цялото съдържание. [Проследете напредъка →](workshop/README.md)

### Интерактивни материали за работилницата
**Всеобхватно практически обучение с инструменти в браузъра и ръководени упражнения**

Нашите материали за работилницата предоставят структурирано, интерактивно учебно преживяване, което допълва горната учебна програма, базирана на глави. Работилницата е предназначена както за самостоятелно обучение, така и за сесии, водени от инструктор.

#### 🛠️ Характеристики на работилницата
- **Browser-Based Interface**: Пълна работилница с MkDocs, с функции за търсене, копиране и теми
- **GitHub Codespaces Integration**: Настройка на среда за разработка с един клик
- **Structured Learning Path**: Ръководени упражнения в 8 модула (общо 3-4 часа)
- **Progressive Methodology**: Въведение → Избор → Валидация → Разглобяване → Конфигурация → Персонализиране → Почистване → Обобщение
- **Interactive DevContainer Environment**: Предварително конфигурирани инструменти и зависимости

#### 📚 Структура на модулите на работилницата
Работилницата следва **8-модулна прогресивна методология**, която ви отвежда от откриването до майсторството на разгръщането:

| Модул | Тема | Какво ще правите | Продължителност |
|--------|-------|----------------|----------|
| **0. Въведение** | Преглед на работилницата | Разберете учебните цели, предпоставките и структурата на работилницата | 15 мин |
| **1. Избор** | Откриване на шаблони | Разгледайте AZD шаблоните и изберете подходящия AI шаблон за вашия сценарий | 20 мин |
| **2. Валидация** | Разгръщане и проверка | Разгърнете шаблона с `azd up` и проверете, че инфраструктурата работи | 30 мин |
| **3. Разглобяване** | Разберете структурата | Използвайте GitHub Copilot, за да разгледате архитектурата на шаблона, файловете Bicep и организацията на кода | 30 мин |
| **4. Конфигурация** | Задълбочен преглед на azure.yaml | Овладейте конфигурацията на `azure.yaml`, hooks за жизнения цикъл и променливите на средата | 30 мин |
| **5. Персонализиране** | Направете го свое | Активирайте AI Search, проследяване, оценка и персонализирайте за вашия сценарий | 45 мин |
| **6. Почистване** | Изчистване | Безопасно премахнете ресурсите с `azd down --purge` | 15 мин |
| **7. Обобщение** | Следващи стъпки | Прегледайте постигнатото, ключовите концепции и продължете учебното си пътуване | 15 мин |

**Поток на работилницата:**
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
# Щракнете върху "Code" → "Create codespace on main" в хранилището

# Опция 2: Локална разработка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Следвайте инструкциите за настройка в workshop/README.md
```

#### 🎯 Учебни резултати от работилницата
Като завършат работилницата, участниците ще:
- **Разгръщайте производствени AI приложения**: Използвайте AZD с услугите на Microsoft Foundry
- **Овладейте мултиагентни архитектури**: Имплементирайте координирани AI агентни решения
- **Прилагайте най-добри практики за сигурност**: Конфигурирайте автентикация и контрол на достъпа
- **Оптимизирайте за мащаб**: Проектирайте икономични, високопроизводителни разгръщания
- **Отстранявайте проблеми при разгръщания**: Решавайте често срещани проблеми самостоятелно

#### 📖 Ресурси за работилницата
- **🎥 Интерактивно ръководство**: [Материали за работилницата](workshop/README.md) - Браузър-базирана учебна среда
- **📋 Инструкции за всеки модул**:
  - [0. Въведение](workshop/docs/instructions/0-Introduction.md) - Преглед на работилницата и цели
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Намерете и изберете AI шаблон
  - [2. Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) - Разгръщане и проверка на шаблони
  - [3. Разглобяване](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Разгледайте архитектурата на шаблона
  - [4. Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) - Овладейте azure.yaml
  - [5. Персонализиране](workshop/docs/instructions/5-Customize-AI-Template.md) - Персонализирайте за вашия сценарий
  - [6. Почистване](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Изчистване на ресурсите
  - [7. Обобщение](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следващи стъпки
- **🛠️ Лаб за AI работилница**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Упражнения, фокусирани върху AI
- **💡 Бърз старт**: [Ръководство за настройка на работилницата](workshop/README.md#quick-start) - Конфигурация на средата

**Подходящо за**: Корпоративно обучение, университетски курсове, самостоятелно обучение и интензивни курсове за разработчици.

---

## 📖 Задълбочено: Възможности на AZD

Отвъд основите, AZD предлага мощни функции за производствени разгръщания:

- **Разгръщания, базирани на шаблони** - Използвайте предварително изработени шаблони за често срещани модели на приложения
- **Инфраструктура като код** - Управлявайте Azure ресурси с Bicep или Terraform  
- **Интегрирани работни потоци** - Безпроблемно осигурявайте, разгръщайте и наблюдавайте приложения
- **Удобно за разработчици** - Оптимизирано за продуктивността и опита на разработчиците

### **AZD + Microsoft Foundry: Идеално за AI разгръщания**

**Защо AZD за AI решения?** AZD адресира основните предизвикателства, пред които са изправени AI разработчиците:

- **AI-готови шаблони** - Предконфигурирани шаблони за Azure OpenAI, Cognitive Services и ML натоварвания
- **Сигурни AI разгръщания** - Вградени модели за сигурност за AI услуги, API ключове и крайни точки на модели  
- **Производствени AI модели** - Най-добри практики за мащабируеми и икономични разгръщания на AI приложения
- **Краен-до-краен AI работни потоци** - От разработка на модел до производствено разгръщане с подходящ мониторинг
- **Оптимизация на разходите** - Интелигентно разпределение на ресурси и стратегии за мащабиране за AI натоварвания
- **Интеграция с Microsoft Foundry** - Плавна връзка към каталога на модели на Microsoft Foundry и крайни точки

---

## 🎯 Библиотека с шаблони и примери

### Представени: Шаблони на Microsoft Foundry
**Започнете тук, ако разгръщате AI приложения!**

> **Бележка:** Тези шаблони демонстрират различни AI модели. Някои са външни Azure Samples, други са локални реализации.

| Шаблон | Глава | Сложност | Услуги | Тип |
|----------|---------|------------|----------|------|
| [**Започнете с AI чат**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Външен |
| [**Започнете с AI агенти**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Външен |
| [**Демо: Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Външен |
| [**Бърз старт: OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Външен |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Външен |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Външен |
| [**Решение за многоагентна търговия**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локален** |

### Представени: Пълни учебни сценарии
**Шаблони за приложения, готови за продукция, съпоставени с учебните глави**

| Шаблон | Учебна глава | Сложност | Ключови уроци |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Основни модели за разгръщане на AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | Имплементация на RAG с Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Глава 4 | ⭐⭐ | Интеграция с Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Агентна рамка и извикване на функции |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Оркестрация на корпоративни AI решения |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Мултиагентна архитектура с агенти за клиенти и за инвентара |

### Учене чрез примери по тип

> **📌 Локални срещу външни примери:**  
> **Локални примери** (в това репо) = Готови за незабавна употреба  
> **Външни примери** (Azure Samples) = Клонирайте от свързаните репозитории

#### Локални примери (Готови за използване)
- [**Решение за многоагентна търговия**](examples/retail-scenario.md) - Пълна имплементация, готова за продукция, с ARM шаблони
  - Мултиагентна архитектура (агенти за клиенти + агенти за инвентара)
  - Всеобхватно наблюдение и оценка
  - Разгръщане с един клик чрез ARM шаблон

#### Локални примери - Контейнерни приложения (Глави 2-5)
**Всеобхватни примери за разгръщане на контейнери в това хранилище:**
- [**Примери за контейнерни приложения**](examples/container-app/README.md) - Пълно ръководство за разгръщане на контейнеризирани приложения
  - [Прост Flask API](../../examples/container-app/simple-flask-api) - Основно REST API със скалиране до нула
  - [Архитектура на микросървиси](../../examples/container-app/microservices) - Разгръщане за продукция с множество услуги
  - Бърз старт, производствени и напреднали модели на разгръщане
  - Насоки за наблюдение, сигурност и оптимизация на разходите

#### Външни примери - Прости приложения (Глави 1-2)
**Клонирайте тези Azure Samples репозитории, за да започнете:**
- [Просто уеб приложение - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни модели за разгръщане
- [Статичен уебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Разгръщане на статично съдържание
- [Контейнерно приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Разгръщане на REST API

#### Външни примери - Интеграция с база данни (Глави 3-4)  
- [Приложение с база данни - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Модели за свързване с база данни
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсървърен работен поток за данни

#### Външни примери - Разширени модели (Глави 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архитектури с множество услуги
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Фоново обработване  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Производствени ML модели

### Външни колекции от шаблони
- [**Официална галерия на AZD шаблони**](https://azure.github.io/awesome-azd/) - Курирана колекция от официални и общностни шаблони
- [**Шаблони за Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документация на шаблоните в Microsoft Learn
- [**Директория с примери**](examples/README.md) - Локални учебни примери с подробни обяснения

---

## 📚 Учебни ресурси и справочници

### Бързи справки
- [**Списък с команди**](resources/cheat-sheet.md) - Основни azd команди, организирани по глава
- [**Речник**](resources/glossary.md) - Терминология на Azure и azd  
- [**ЧЗВ**](resources/faq.md) - Чести въпроси, организирани по учебни глави
- [**Учебно ръководство**](resources/study-guide.md) - Обширни упражнения за практика

### Практически работилници
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Направете вашите AI решения разгръщаеми чрез AZD (2-3 часа)
- [**Интерактивна работилница**](workshop/README.md) - 8-модулни ръководени упражнения с MkDocs и GitHub Codespaces
  - Следва: Въведение → Избор → Валидация → Разглобяване → Конфигурация → Персонализиране → Почистване → Обобщение

### Външни учебни ресурси
- [Документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Бързо ръководство за отстраняване на проблеми

**Често срещани проблеми за начинаещи и незабавни решения:**

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

# Проверете инсталацията
azd version
```
</details>

<details>
<summary><strong>❌ "Не е намерен абонамент" или "Абонаментът не е зададен"</strong></summary>

```bash
# Изброи наличните абонаменти
az account list --output table

# Задай абонамент по подразбиране
az account set --subscription "<subscription-id-or-name>"

# Задай за AZD среда
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Провери
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" или "Quota exceeded"</strong></summary>

```bash
# Опитайте различен регион на Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Или използвайте по-малки SKU-та при разработка
# Редактирайте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" спира на половината</strong></summary>

```bash
# Опция 1: Изчисти и опитай отново
azd down --force --purge
azd up

# Опция 2: Просто поправи инфраструктурата
azd provision

# Опция 3: Провери подробния статус
azd show

# Опция 4: Провери логовете в Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" или "Token expired"</strong></summary>

```bash
# Повторно удостоверяване
az logout
az login

azd auth logout
azd auth login

# Проверете удостоверяването
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" или конфликти в имената</strong></summary>

```bash
# AZD генерира уникални имена, но ако възникне конфликт:
azd down --force --purge

# Тогава опитайте отново с нова среда
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Разгръщането на шаблона отнема твърде много време</strong></summary>

**Типични времена на изчакване:**
- Просто уеб приложение: 5-10 минути
- Приложение с база данни: 10-15 минути
- AI приложения: 15-25 минути (предоставянето на OpenAI е бавно)

```bash
# Проверете напредъка
azd show

# Ако сте заседнали повече от 30 минути, проверете портала на Azure:
azd monitor
# Проверете за неуспешни разгръщания
```
</details>

<details>
<summary><strong>❌ "Permission denied" или "Forbidden"</strong></summary>

```bash
# Проверете ролята си в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Трябва ви поне роля "Contributor"
# Помолете администратора на Azure да предостави:
# - Contributor (за ресурси)
# - User Access Administrator (за назначаване на роли)
```
</details>

<details>
<summary><strong>❌ Не може да се намери URL на разгърнатото приложение</strong></summary>

```bash
# Покажи всички крайни точки на услугите
azd show

# Или отвори Azure портала
azd monitor

# Провери конкретна услуга
azd env get-values
# Потърси променливите *_URL
```
</details>

### 📚 Пълни ресурси за отстраняване на проблеми

- **Ръководство за чести проблеми:** [Подробни решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, специфични за AI:** [Отстраняване на проблеми с AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ръководство за отстраняване на грешки:** [Отстраняване на грешки стъпка по стъпка](docs/chapter-07-troubleshooting/debugging.md)
- **Получете помощ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завършване на курса и сертифициране

### Проследяване на напредъка

Проследявайте напредъка си в обучението през всяка глава:

- [ ] **Глава 1**: Основи & Бърз старт ✅
- [ ] **Глава 2**: AI-ориентирана разработка ✅  
- [ ] **Глава 3**: Конфигурация & Удостоверяване ✅
- [ ] **Глава 4**: Инфраструктура като код & Разгръщане ✅
- [ ] **Глава 5**: Многоагентни AI решения ✅
- [ ] **Глава 6**: Валидация и планиране преди разгръщане ✅
- [ ] **Глава 7**: Отстраняване на проблеми & Отстраняване на грешки ✅
- [ ] **Глава 8**: Производство & Корпоративни модели ✅

### Проверка на знанията
След като завършите всяка глава, проверете знанията си чрез:
1. **Практическо упражнение**: Завършете практическото разгръщане от главата
2. **Проверка на знанията**: Прегледайте секцията ЧЗВ за вашата глава
3. **Дискусия в общността**: Споделете опита си в Azure Discord
4. **Следваща глава**: Преминете към следващото ниво на трудност

### Ползи от завършване на курса
След като завършите всички глави, ще имате:
- **Опит в продукция**: Разположили реални AI приложения в Azure
- **Професионални умения**: Възможности за разгръщане, подходящи за предприятия  
- **Признание в общността**: Активен член на общността на разработчици за Azure
- **Кариерно развитие**: Търсени умения за AZD и разгръщане на AI

---

## 🤝 Общност и поддръжка

### Потърсете помощ и поддръжка
- **Технически проблеми**: [Докладвайте грешки и поискайте функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Въпроси за обучение**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощ, специфична за AI**: Присъединете се към [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официална документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Прозрения от общността от Microsoft Foundry Discord

**Последни резултати от анкета от канала #Azure:**
- **45%** от разработчиците искат да използват AZD за AI натоварвания
- **Основни предизвикателства**: Разгръщания с множество услуги, управление на идентификационни данни, готовност за продукция  
- **Най-често заявявани**: Шаблони, специфични за AI, ръководства за отстраняване на проблеми, добри практики

**Присъединете се към нашата общност, за да:**
- Споделяйте своя опит с AZD + AI и получавайте помощ
- Достъп до ранни предварителни версии на нови AI шаблони
- Допринасяйте за добри практики при разгръщане на AI
- Влияйте върху бъдещото развитие на функции за AI + AZD

### Допринасяне към курса
Очакваме приноси! Моля, прочетете нашето [Ръководство за приноси](CONTRIBUTING.md) за подробности относно:
- **Подобрения на съдържанието**: Подобрете съществуващите глави и примери
- **Нови примери**: Добавете реални сценарии и шаблони  
- **Преводи**: Помогнете за поддържането на многоезичната поддръжка
- **Докладване на грешки**: Подобрете точността и яснотата
- **Стандарти на общността**: Спазвайте нашите насоки за приобщаваща общност

---

## 📄 Информация за курса

### Лиценз
Този проект е лицензиран под MIT лиценз - вижте файла [LICENSE](../../LICENSE) за подробности.

### Свързани обучителни ресурси на Microsoft

Our team produces other comprehensive learning courses:

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
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигация в курса

**🚀 Готови ли сте да започнете обучението?**

**За начинаещи**: Започнете с [Глава 1: Основи и бърз старт](../..)  
**AI разработчици**: Преминете към [Глава 2: Разработка, ориентирана към AI](../..)  
**Опитни разработчици**: Започнете с [Глава 3: Конфигурация и удостоверяване](../..)

**Следващи стъпки**: [Започнете Глава 1 - Основи на AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на услуга за машинен превод с изкуствен интелект [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на езика, на който е написан, трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->