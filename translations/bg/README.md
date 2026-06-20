# AZD за начинаещи: Структуриран учебен път

![AZD за начинаещи](../../translated_images/bg/azdbeginners.5527441dd9f74068.webp) 

[![GitHub наблюдатели](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub форкове](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub звезди](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматични преводи (винаги актуални)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Български](./README.md) | [Бирмански (Мианмар)](../my/README.md) | [Китайски (опростен)](../zh-CN/README.md) | [Китайски (традиционен, Хонконг)](../zh-HK/README.md) | [Китайски (традиционен, Макао)](../zh-MO/README.md) | [Китайски (традиционен, Тайван)](../zh-TW/README.md) | [Хърватски](../hr/README.md) | [Чешки](../cs/README.md) | [Датски](../da/README.md) | [Нидерландски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Френски](../fr/README.md) | [Немски](../de/README.md) | [Гръцки](../el/README.md) | [Иврит](../he/README.md) | [Хинди](../hi/README.md) | [Унгарски](../hu/README.md) | [Индонезийски](../id/README.md) | [Италиански](../it/README.md) | [Японски](../ja/README.md) | [Каннада](../kn/README.md) | [Кхмерски](../km/README.md) | [Корейски](../ko/README.md) | [Литовски](../lt/README.md) | [Малайски](../ms/README.md) | [Малаялам](../ml/README.md) | [Марати](../mr/README.md) | [Непалски](../ne/README.md) | [Нигерийски пиджин](../pcm/README.md) | [Норвежки](../no/README.md) | [Персийски (фарси)](../fa/README.md) | [Полски](../pl/README.md) | [Португалски (Бразилия)](../pt-BR/README.md) | [Португалски (Португалия)](../pt-PT/README.md) | [Пенджаби (Гурмукхи)](../pa/README.md) | [Румънски](../ro/README.md) | [Руски](../ru/README.md) | [Сръбски (кирилица)](../sr/README.md) | [Словашки](../sk/README.md) | [Словенски](../sl/README.md) | [Испански](../es/README.md) | [Свахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (Филипински)](../tl/README.md) | [Тамилски](../ta/README.md) | [Телугу](../te/README.md) | [Тайски](../th/README.md) | [Турски](../tr/README.md) | [Украински](../uk/README.md) | [Урду](../ur/README.md) | [Виетнамски](../vi/README.md)

> **Предпочитате да клонирате локално?**
>
> Това хранилище включва преводи на над 50 езика, което значително увеличава размера на изтегляне. За да клонирате без преводи, използвайте sparse checkout:
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
> Това ви дава всичко необходимо, за да завършите курса с много по-бързо изтегляне.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Какво е новото в azd днес

> 📌 Този курс е валидиран спрямо **`azd 1.25.6`** (юни 2026). Стартирайте `azd version`, за да проверите версията си, и `azd upgrade`, за да получите най-новата.

Azure Developer CLI се разраства отвъд традиционните уеб приложения и API. Днес azd е единният инструмент за разполагане на **всяко** приложение в Azure — включително приложения с AI и интелигентни агенти.

Ето какво означава това за вас:

- **AI агентите вече са първокласни натоварвания в azd.** Можете да инициализирате, разполагате и управлявате AI проектите за агенти, използвайки същия работен поток `azd init` → `azd up`, който вече познавате.
- **Пълен жизнен цикъл на агента от CLI.** Разширението `azure.ai.agents` вече покрива цялото пътуване — `azd ai agent init` за scaffold, `azd ai agent invoke` за тестване (с изход за времето за отговор), `azd ai agent eval generate` и `azd ai agent optimize` за измерване и подобряване на качеството, и `azd ai agent delete` за почистване.
- **Още AI блокове за изграждане.** Нови preview разширения — `azure.ai.skills` и `azure.ai.connections` — ви позволяват да управлявате многократно използваеми умения на агенти и Foundry връзки директно чрез azd.
- **Интеграция с Microsoft Foundry**, която внася разгръщане на модели, хостване на агенти и конфигурация на AI услуги директно в екосистемата на azd шаблоните.
- **По-гладки ежедневни операции.** Последните версии направиха `azd init` идемпотентен (безопасно за повторно изпълнение), накараха `azd auth login` да изчиства автоматично остарели токени и добавиха приятелски подсказващ диалог за първо пускане на `azd tool`.
- **Основният работен поток не се е променил.** Независимо дали разполагате todo приложение, микросървис или мултиагентно AI решение, командите остават същите.

> **Бележка за потребителите на Aspire:** Microsoft вече нарича продукта просто **Aspire** (преди ".NET Aspire"). Поддръжката на Aspire в azd е непроменена — променено е само името.

Ако вече сте използвали azd, поддръжката на AI е естествено разширение — не отделен инструмент или напреднал курс. Ако започвате от начало, ще научите един работен поток, който работи за всичко.

---

## 🚀 Какво е Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** е приятелски инструмент за разработчици в командния ред, който улеснява разгръщането на приложения в Azure. Вместо ръчно да създавате и свързвате десетки ресурси в Azure, можете да разположите цели приложения с една команда.

### Магията на `azd up`

```bash
# Тази единствена команда прави всичко:
# ✅ Създава всички Azure ресурси
# ✅ Конфигурира мрежата и сигурността
# ✅ Изгражда кода на вашето приложение
# ✅ Деплойва в Azure
# ✅ Ви дава работещ URL адрес
azd up
```

**Това е всичко!** Никакво щракане в Azure портала, никакви сложни ARM шаблони за учене първо, никаква ръчна конфигурация - само работещи приложения в Azure.

---

## ❓ Azure Developer CLI срещу Azure CLI: Каква е разликата?

Това е най-често задаваният въпрос от начинаещите. Ето простия отговор:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Управление на отделни ресурси в Azure | Разполагане на цели приложения |
| **Mindset** | Фокус върху инфраструктурата | Фокус върху приложенията |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Необходимо е познаване на услугите на Azure | Достатъчно е да познавате приложението си |
| **Best For** | DevOps, инфраструктура | Разработчици, прототипиране |

### Прост пример

- **Azure CLI** е като да имате всички инструменти за строене на къща - чукове, триони, пирони. Можете да построите всичко, но трябва да знаете строителството.
- **Azure Developer CLI** е като да наемете изпълнител - описвате какво искате и той се грижи за строежа.

### Кога да използвате кой

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Работят заедно!

AZD използва Azure CLI под капака. Можете да използвате и двата:
```bash
# Разположете вашето приложение с AZD
azd up

# След това прецизирайте специфични ресурси с Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Намиране на шаблони в Awesome AZD

Не започвайте от нулата! **Awesome AZD** е общностната колекция от готови за разгръщане шаблони:

| Resource | Description |
|----------|-------------|
| 🔗 [**Галерия Awesome AZD**](https://azure.github.io/awesome-azd/) | Разгледайте 200+ шаблона с деплой с едно щракване |
| 🔗 [**Изпратете шаблон**](https://github.com/Azure/awesome-azd/issues) | Допринесете с ваш собствен шаблон за общността |
| 🔗 [**Хранилище в GitHub**](https://github.com/Azure/awesome-azd) | Дайте звезда и разгледайте изходния код |

### Популярни AI шаблони от Awesome AZD

```bash
# RAG чат с Microsoft Foundry модели + AI търсене
azd init --template azure-search-openai-demo

# Бързо AI чат приложение
azd init --template openai-chat-app-quickstart

# AI агенти с Foundry агенти
azd init --template get-started-with-ai-agents
```

---

## 🎯 Започване за 3 стъпки

Преди да започнете, уверете се, че машината ви е готова за шаблона, който искате да разположите:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ако някоя от необходимите проверки не премине, отстранете го първо и след това продължете с бързия старт.

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

### Стъпка 2: Удостоверяване за AZD

```bash
# Незадължително, ако планирате да използвате команди на Azure CLI директно в този курс
az login

# Задължително за AZD работни потоци
azd auth login
```

Ако не сте сигурни кое ви е нужно, следвайте целия поток за настройка в [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Стъпка 3: Разположете първото си приложение

```bash
# Инициализиране от шаблон
azd init --template todo-nodejs-mongo

# Деплой към Azure (създава всичко!)
azd up
```

**🎉 Това е всичко!** Вашето приложение вече е достъпно в Azure.

### Почистване (Не забравяйте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как да използвате този курс

Този курс е проектиран за **постепенно учене** - започнете там, където ви е удобно, и продължете напред:

| Your Experience | Start Here |
|-----------------|------------|
| **Напълно нов в Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Познавам Azure, нов съм в AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Искам да разположа AI приложения** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Искам практически упражнения** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 часa ръководена лаборатория |
| **Нуждая се от производствени шаблони** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Бърза настройка

1. **Форкнете това хранилище**: [![GitHub форкове](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирайте го**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Потърсете помощ**: [Общност в Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитате да клонирате локално?**

> Това хранилище включва преводи на над 50 езика, което значително увеличава размера на изтегляне. За да клонирате без преводи, използвайте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Това ви дава всичко необходимо, за да завършите курса с много по-бързо изтегляне.


## Преглед на курса

Овладейте Azure Developer CLI (azd) чрез структурирани глави, предназначени за постепенно учене. **Специален акцент върху разгръщането на AI приложения с интеграция на Microsoft Foundry.**
### Защо този курс е от съществено значение за съвременните разработчици

Въз основа на информация от общността на Microsoft Foundry в Discord, **45% от разработчиците искат да използват AZD за AI натоварвания** но се сблъскват с предизвикателства при:
- Комплексни мултисервисни AI архитектури
- Най-добри практики за пускане в продукция на AI  
- Интеграция и конфигурация на Azure AI услуги
- Оптимизация на разходите за AI натоварвания
- Откриване и отстраняване на проблеми при AI специфични разгръщания

### Учебни цели

След завършване на този структуриран курс, вие ще:
- **Овладeете основите на AZD**: Основни концепции, инсталация и конфигурация
- **Деплойвате AI приложения**: Използване на AZD с Microsoft Foundry услуги
- **Прилагате инфраструктура като код**: Управление на Azure ресурси с Bicep шаблони
- **Отстранявате проблеми при разгръщанията**: Решаване на чести проблеми и отстраняване на грешки
- **Оптимизирате за продукция**: Сигурност, мащабиране, мониторинг и управление на разходите
- **Създавате мулти-агентни решения**: Деплой на комплексни AI архитектури

## Преди да започнете: Акаунти, достъп и предпоставки

Преди да започнете Глава 1, уверете се, че имате следното. Инсталационните стъпки по-нататък в това ръководство приемат, че тези основи вече са уредени.

- **Абонамент за Azure**: Можете да използвате съществуващ абонамент от работа или собствен акаунт, или да създадете [free trial](https://aka.ms/azurefreetrial) за да започнете.
- **Разрешение за създаване на Azure ресурси**: За повечето упражнения трябва да имате поне **Contributor** достъп върху целевия абонамент или ресурсна група. Някои глави може също да предполагат, че можете да създавате ресурсни групи, управлявани идентичности и RBAC присвоявания.
- [**GitHub акаунт**](https://github.com): Това е полезно за форкване на репозиторията, проследяване на вашите промени и използване на GitHub Codespaces за работилницата.
- **Предварителни изисквания за изпълнението на шаблоните**: Някои шаблони изискват локални инструменти като Node.js, Python, Java или Docker. Стартирайте валидатора за настройка преди да започнете, за да хванете липсващи инструменти рано.
- **Основна запознатост с терминал**: Не е нужно да сте експерт, но трябва да се чувствате удобно да изпълнявате команди като `git clone`, `azd auth login` и `azd up`.

> **Работите в корпоративен абонамент?**
> Ако вашата Azure среда се управлява от администратор, потвърдете предварително, че можете да пускате ресурси в абонамента или ресурсната група, които планирате да използвате. Ако не, поискайте пясъчна среда (sandbox) или Contributor достъп преди да започнете.

> **Нови в Azure?**
> Започнете с вашия собствен Azure trial или pay-as-you-go абонамент на https://aka.ms/azurefreetrial, за да можете да завършите упражненията от край до край без да чакате одобрения на ниво тенант.

## 🗺️ Карта на курса: Бърза навигация по глави

Всяка глава има отделен README с учебни цели, бързи старти и упражнения:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Общо време за курса:** ~10-14 hours | **Напредък в уменията:** Beginner → Production-Ready

---

## 📚 Учебни глави

*Изберете учебен път според нивото на опит и целите си*

### 🚀 Глава 1: Основи и бързо стартиране
**Предварителни изисквания**: Абонамент за Azure, основни познания за команден ред  
**Продължителност**: 30-45 минути  
**Сложност**: ⭐

#### Какво ще научите
- Разбиране на основите на Azure Developer CLI
- Инсталиране на AZD на вашата платформа
- Вашето първо успешно разгръщане

#### Учебни ресурси
- **🎯 Започнете тук**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теория**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Основни концепции и терминология
- **⚙️ Настройка**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Ръководства за различни платформи
- **🛠️ Практика**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Стъпка по стъпка урок
- **📋 Бърза справка**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Практически упражнения
```bash
# Бърза проверка на инсталацията
azd version

# Разположете първото си приложение
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат от главата**: Успешно разгръщане на просто уеб приложение в Azure с помощта на AZD

**✅ Валидация на успеха:**
```bash
# След завършване на Глава 1, трябва да можете да:
azd version              # Показва инсталираната версия
azd init --template todo-nodejs-mongo  # Инициализира проекта
azd up                  # Разгръща в Azure
azd show                # Показва URL на работещото приложение
# Приложението се отваря в браузъра и работи
azd down --force --purge  # Почиства ресурсите
```

**📊 Времева инвестиция:** 30-45 минути  
**📈 Ниво на умения след:** Може да внедрява базови приложения самостоятелно
**📈 Ниво на умения след:** Може да внедрява базови приложения самостоятелно

---

### 🤖 Глава 2: AI-първо разработване (Препоръчва се за AI разработчици)
**Предварителни изисквания**: Глава 1 завършена  
**Продължителност**: 1-2 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Интеграция на Microsoft Foundry с AZD
- Деплой на AI-задвижвани приложения
- Разбиране на конфигурациите на AI услуги

#### Учебни ресурси
- **🎯 Започнете тук**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Деплой на интелигентни агенти с AZD
- **📖 Модели и шаблони**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Деплой и управление на AI модели
- **🛠️ Работилница**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Подгответе вашите AI решения за AZD
- **🎥 Интерактивно ръководство**: [Workshop Materials](workshop/README.md) - Учебно съдържание в браузър с MkDocs * DevContainer Environment
- **📋 Шаблони**: [Microsoft Foundry Templates](#ресурси-за-работилницата)
- **📝 Примери**: [AZD Deployment Examples](examples/README.md)

#### Практически упражнения
```bash
# Разположете първото си AI приложение
azd init --template azure-search-openai-demo
azd up

# Опитайте допълнителни AI шаблони
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат от главата**: Деплой и конфигуриране на AI чат приложение с RAG възможности

**✅ Валидация на успеха:**
```bash
# След глава 2 трябва да можете:
azd init --template azure-search-openai-demo
azd up
# Тествайте интерфейса за чат с изкуствен интелект
# Задавайте въпроси и получавайте отговори, генерирани от AI, с източници
# Проверете дали интеграцията за търсене работи
azd monitor  # Проверете дали Application Insights показва телеметрия
azd down --force --purge
```

**📊 Времева инвестиция:** 1-2 часа  
**📈 Ниво на умения след:** Може да деплойва и конфигурира AI приложения, готови за продукция  
**💰 Информираност за разходите:** Разберете $80-150/month разходи за разработка, $300-3500/month разходи за продукция

#### 💰 Съображения за разходите при AI разгръщания

**Среда за разработка (Оценка $80-150/month):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (въз основа на използване на токени)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Продукционна среда (Оценка $300-3,500+/month):**
- Microsoft Foundry Models (PTU за консистентна производителност): $3,000+/month ИЛИ Pay-as-go при голям обем
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Съвети за оптимизация на разходите:**
- Използвайте **Free Tier** Microsoft Foundry Models за обучение (Azure OpenAI 50,000 tokens/month включени)
- Изпълнявайте `azd down` за да деалокирате ресурси, когато не разработвате активно
- Започнете с плащане на потребление (consumption-based billing), ъпгрейдвайте към PTU само за продукция
- Използвайте `azd provision --preview` за да оцените разходите преди разгръщане
- Активирайте авто-мащабиране: плащате само за реална употреба

**Мониторинг на разходите:**
```bash
# Проверете прогнозните месечни разходи
azd provision --preview

# Наблюдавайте реалните разходи в портала на Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Глава 3: Конфигурация и автентикация
**Предварителни изисквания**: Глава 1 завършена  
**Продължителност**: 45-60 минути  
**Сложност**: ⭐⭐

#### Какво ще научите
- Конфигурация и управление на среди
- Най-добри практики за автентикация и сигурност
- Наименуване и организация на ресурси

#### Учебни ресурси
- **📖 Конфигурация**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Настройка на среди
- **🔐 Сигурност**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Патерни за автентикация
- **📝 Примери**: [Database App Example](examples/database-app/README.md) - AZD Database примери

#### Практически упражнения
- Конфигурирайте множество среди (dev, staging, prod)
- Настройте автентикация с управлявани идентичности
- Прилагайте конфигурации специфични за средата

**💡 Резултат от главата**: Управление на множество среди с подходяща автентикация и сигурност

---

### 🏗️ Глава 4: Инфраструктура като код и разгръщане
**Предварителни изисквания**: Глави 1-3 завършени  
**Продължителност**: 1-1.5 часа  
**Сложност**: ⭐⭐⭐

#### Какво ще научите
- Разширени модели за разгръщане
- Инфраструктура като код с Bicep
- Стратегии за провижънинг на ресурси

#### Учебни ресурси
- **📖 Разгръщане**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Пълни работни потоци
- **🏗️ Провижънинг**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Управление на Azure ресурси
- **📝 Примери**: [Container App Example](../../examples/container-app) - Контейнеризирани разгръщания

#### Практически упражнения
- Създайте персонализирани Bicep шаблони
- Деплойвайте мултисервисни приложения
- Прилагайте blue-green стратегии за разгръщане

**💡 Резултат от главата**: Деплой на комплексни мултисервисни приложения с помощта на персонализирани инфраструктурни шаблони
### 🎯 Глава 5: Многоагентни AI решения (Напреднали)
**Предварителни изисквания**: Глави 1-2 завършени  
**Продължителност**: 2-3 часа  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Шаблони на многоагентна архитектура
- Оркестрация и координация на агентите
- AI внедрения, готови за продукция

#### Ресурси за обучение
- **🤖 Препоръчителен проект**: [Многoагентно търговско решение](examples/retail-scenario.md) - Пълна имплементация
- **🛠️ ARM шаблони**: [Пакет ARM шаблони](../../examples/retail-multiagent-arm-template) - Пускане с един клик
- **📖 Архитектура**: [Шаблони за координация на многоагентни системи](docs/chapter-06-pre-deployment/coordination-patterns.md) - Шаблони

#### Практически упражнения
```bash
# Разположете цялостното мултиагентно решение за търговия на дребно
cd examples/retail-multiagent-arm-template
./deploy.sh

# Разгледайте конфигурациите на агентите
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат от главата**: Деплойвайте и управлявайте многоагентно AI решение, готово за продукция, с агенти за Клиенти и Запаси

---

### 🔍 Глава 6: Валидация и планиране преди внедряване
**Предварителни изисквания**: Глава 4 завършена  
**Продължителност**: 1 час  
**Сложност**: ⭐⭐

#### Какво ще научите
- Планиране на капацитета и валидиране на ресурсите
- Стратегии за избор на SKU
- Проверки преди пуск и автоматизация

#### Ресурси за обучение
- **📊 Планиране**: [Планиране на капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидиране на ресурси
- **💰 Избор**: [Избор на SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Икономични опции
- **✅ Валидиране**: [Проверки преди пуск](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизирани скриптове

#### Практически упражнения
- Изпълнете скриптове за валидиране на капацитета
- Оптимизирайте избора на SKU за намаляване на разходите
- Внедрете автоматизирани проверки преди пуск

**💡 Резултат от главата**: Валидирайте и оптимизирайте внедряванията преди изпълнение

---

### 🚨 Глава 7: Отстраняване на проблеми и дебъгване
**Предварителни изисквания**: Всяка глава за внедряване завършена  
**Продължителност**: 1-1.5 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Систематични подходи за дебъгване
- Чести проблеми и решения
- Отстраняване на проблеми, специфични за AI

#### Ресурси за обучение
- **🔧 Чести проблеми**: [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) - FAQ и решения
- **🕵️ Дебъгване**: [Ръководство за дебъгване](docs/chapter-07-troubleshooting/debugging.md) - Стъпка по стъпка стратегии
- **🤖 AI проблеми**: [Отстраняване на проблеми, специфични за AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми с AI услугите

#### Практически упражнения
- Диагностицирайте провали при внедряване
- Решете проблеми с удостоверяването
- Дебъгвайте свързаността с AI услуги

**💡 Резултат от главата**: Самостоятелно диагностицирайте и разрешавайте чести проблеми при внедряване

---

### 🏢 Глава 8: Патерни за продукция и корпоративни решения
**Предварителни изисквания**: Глави 1-4 завършени  
**Продължителност**: 2-3 часа  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Стратегии за продукционно внедряване
- Корпоративни модели за сигурност
- Мониторинг и оптимизация на разходите

#### Ресурси за обучение
- **🏭 Продукция**: [Най-добри практики за продукционен AI](docs/chapter-08-production/production-ai-practices.md) - Корпоративни модели
- **📝 Примери**: [Пример с микросервизи](../../examples/microservices) - Комплексни архитектури
- **📊 Мониторинг**: [Интеграция с Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практически упражнения
- Внедрете корпоративни модели за сигурност
- Настройте цялостен мониторинг
- Внедрете в продукция с подходящо управление

**💡 Резултат от главата**: Внедрете корпоративни приложения с пълни производствени възможности

---

## 🎓 Преглед на работилницата: Практическо обучение

> **⚠️ СЪСТОЯНИЕ НА РАБОТИЛНИЦАТА: Активна разработка**  
> В момента материалите на работилницата се разработват и усъвършенстват. Основните модули са функционални, но някои напреднали секции са непълни. Активно работим за завършване на цялото съдържание. [Проследи напредъка →](workshop/README.md)

### Интерактивни материали за работилницата
**Всеобхватно практическо обучение с инструменти в браузъра и ръководени упражнения**

Нашите материали за работилницата предоставят структурирано, интерактивно учебно преживяване, което допълва курикулума, базиран на глави по-горе. Работилницата е предназначена както за самообучение, така и за сесиите с инструктор.

#### 🛠️ Характеристики на работилницата
- **Интерфейс в браузъра**: Пълна работилница, базирана на MkDocs, с възможности за търсене, копиране и теми
- **Интеграция с GitHub Codespaces**: Настройка на среда за разработка с един клик
- **Структуриран учебен път**: 8-модулни ръководени упражнения (3-4 часа общо)
- **Прогресивна методология**: Въведение → Избор → Валидация → Деконструкция → Конфигурация → Персонализиране → Демонтаж → Обобщение
- **Интерактивна DevContainer среда**: Предварително конфигурирани инструменти и зависимости

#### 📚 Структура на модулите в работилницата
Работилницата следва една **8-модулна прогресивна методология**, която ви води от откриване до майсторство във внедряването:

| Модул | Тема | Какво ще правите | Продължителност |
|--------|-------|----------------|----------|
| **0. Въведение** | Преглед на работилницата | Разберете учебните цели, предварителните изисквания и структурата на работилницата | 15 мин |
| **1. Избор** | Откриване на шаблони | Разгледайте AZD шаблоните и изберете подходящия AI шаблон за вашия сценарий | 20 мин |
| **2. Валидация** | Внедряване и проверка | Внедрете шаблона с `azd up` и валидирайте, че инфраструктурата функционира | 30 мин |
| **3. Деконструкция** | Разбране на структурата | Използвайте GitHub Copilot за изследване на архитектурата на шаблона, Bicep файловете и организацията на кода | 30 мин |
| **4. Конфигурация** | Задълбочено разглеждане на azure.yaml | Овладейте конфигурацията `azure.yaml`, lifecycle hooks и променливите на средата | 30 мин |
| **5. Персонализиране** | Направете го свое | Активирайте AI Search, проследяване, оценка и персонализирайте за вашия сценарий | 45 мин |
| **6. Демонтаж** | Почистване | Безопасно премахнете ресурсите с `azd down --purge` | 15 мин |
| **7. Обобщение** | Следващи стъпки | Прегледайте постиженията, ключовите концепции и продължете учебното си пътуване | 15 мин |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Как да започнете с работилницата
```bash
# Опция 1: GitHub Codespaces (Препоръчително)
# Кликнете върху "Code" → "Create codespace on main" в хранилището

# Опция 2: Локална разработка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Следвайте инструкциите за настройка в workshop/README.md
```

#### 🎯 Учебни резултати от работилницата
Чрез завършване на работилницата, участниците ще:
- **Деплойвайте продукционни AI приложения**: Използвайте AZD с Microsoft Foundry услуги
- **Овладейте многоагентни архитектури**: Внедрете координирани AI агентни решения
- **Внедрете най-добрите практики за сигурност**: Конфигурирайте удостоверяване и контрол на достъпа
- **Оптимизирайте за мащаб**: Проектирайте икономични и производителни внедрявания
- **Отстранявайте проблеми при внедрявания**: Решавайте чести проблеми самостоятелно

#### 📖 Ресурси за работилницата
- **🎥 Интерактивно ръководство**: [Материали за работилницата](workshop/README.md) - Обучение в браузъра
- **📋 Инструкции за всеки модул**:
  - [0. Въведение](workshop/docs/instructions/0-Introduction.md) - Преглед на работилницата и цели
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Намерете и изберете AI шаблони
  - [2. Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) - Внедрете и валидирайте шаблоните
  - [3. Деконструкция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Проучете архитектурата на шаблона
  - [4. Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) - Овладейте azure.yaml
  - [5. Персонализиране](workshop/docs/instructions/5-Customize-AI-Template.md) - Персонализирайте за вашия сценарий
  - [6. Демонтаж](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Почистете ресурсите
  - [7. Обобщение](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следващи стъпки
- **🛠️ AI Лаборатория**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Упражнения, фокусирани върху AI
- **💡 Бърз старт**: [Ръководство за настройка на работилницата](workshop/README.md#quick-start) - Конфигурация на средата

**Подходящо за**: Корпоративно обучение, университетски курсове, самообучение и интензивни курсове за разработчици.

---

## 📖 Задълбочено разглеждане: Възможности на AZD

Отвъд основите, AZD предоставя мощни функции за продукционни внедрявания:

- **Внедрявания, базирани на шаблони** - Използвайте предварително изградени шаблони за общи модели на приложения
- **Инфраструктура като код** - Управлявайте Azure ресурси с помощта на Bicep или Terraform  
- **Интегрирани работни процеси** - Безпроблемно доставяйте, внедрявайте и наблюдавайте приложения
- **Удобно за разработчици** - Оптимизирано за продуктивност и потребителско преживяване на разработчиците

### **AZD + Microsoft Foundry: Перфектно за AI внедрявания**

**Защо AZD за AI решения?** AZD отговаря на основните предизвикателства, пред които са изправени AI разработчиците:

- **AI-готови шаблони** - Предварително конфигурирани шаблони за Microsoft Foundry модели, Azure AI услуги и ML натоварвания
- **Сигурни AI внедрявания** - Вградени модели за сигурност за AI услуги, API ключове и крайни точки на модели  
- **Патерни за продукционен AI** - Най-добри практики за мащабируеми, икономични AI внедрявания
- **Край до край AI работни процеси** - От разработката на модели до продукционно внедряване с подходящ мониторинг
- **Оптимизация на разходите** - Умно разпределение на ресурси и стратегии за скалиране за AI натоварвания
- **Интеграция с Microsoft Foundry** - Безпроблемна връзка към каталога с модели и крайни точки на Microsoft Foundry

---

## 🎯 Библиотека с шаблони и примери

### Представени: Microsoft Foundry шаблони
**Започнете тук, ако внедрявате AI приложения!**

> **Бележка:** Тези шаблони демонстрират различни AI модели. Някои са външни Azure Samples, други са локални имплементации.

| Шаблон | Глава | Сложност | Услуги | Тип |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Външен |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Външен |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Външен |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Външен |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Външен |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Външен |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локален** |

### Представени: Пълни учебни сценарии
**Шаблони на приложения, готови за продукция, съпоставени с учебните глави**

| Шаблон | Учебна глава | Сложност | Ключово обучение |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Основни модели за AI внедряване |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | RAG имплементация с Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Глава 4 | ⭐⭐ | Интеграция на Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Агентен фреймуърк и повикване на функции |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Корпоративна AI оркестрация |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Многоагентна архитектура с агенти за Клиенти и Запаси |

### Учене чрез примери по тип

> **📌 Локални срещу външни примери:**  
> **Локални примери** (в това хранилище) = Готови за незабавна употреба  
> **Външни примери** (Azure Samples) = Клонирайте от свързаните хранилища

#### Локални примери (Готови за употреба)
- [**Търговско многоагентно решение**](examples/retail-scenario.md) - Пълна имплементация, готова за продукция с ARM шаблони
  - Многоагентна архитектура (агенти за Клиенти и Запаси)
  - Изчерпателен мониторинг и оценка
  - Пускане с един клик чрез ARM шаблон

#### Локални примери - Контейнерни приложения (Глави 2-5)
**Изчерпателни примери за разгръщане на контейнери в това хранилище:**
- [**Примери за Container App**](examples/container-app/README.md) - Пълен наръчник за контейнеризирани разгръщания
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Основно REST API със скалиране до нула
  - [Microservices Architecture](../../examples/container-app/microservices) - Разгръщане с множество услуги, готово за продукция
  - Бърз старт, продукция и напреднали модели на разгръщане
  - Насоки за мониторинг, сигурност и оптимизация на разходите

#### External Examples - Simple Applications (Chapters 1-2)
**Клонирайте тези Azure Samples хранилища, за да започнете:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни модели на разгръщане
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Разгръщане на статично съдържание
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Разгръщане на REST API

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Модели за свързване с бази данни
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless работни потоци с данни

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архитектури с множество услуги
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Фоново обработване  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Производствени ML модели

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Курирана колекция от официални и общностни шаблони
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документация на шаблоните в Microsoft Learn
- [**Examples Directory**](examples/README.md) - Локални учебни примери с подробни обяснения

---

## 📚 Ресурси за обучение и справочни материали

### Бързи справки
- [**Справочник с команди**](resources/cheat-sheet.md) - Основни azd команди, организирани по глави
- [**Речник**](resources/glossary.md) - Терминология на Azure и azd  
- [**ЧЗВ**](resources/faq.md) - Често задавани въпроси, организирани по учебни глави
- [**Наръчник за обучение**](resources/study-guide.md) - Обширни практически упражнения

### Практически работилници
- [**AI лаборатория**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Направете вашите AI решения пригодни за разгръщане с AZD (2-3 часа)
- [**Интерактивна работилница**](workshop/README.md) - 8-модулни ръководени упражнения с MkDocs и GitHub Codespaces
  - Следва: Въведение → Избор → Проверка → Деконструкция → Конфигурация → Персонализация → Демонтаж → Заключение

### Външни учебни ресурси
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### AI умения за вашия редактор
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворени умения за агенти за Azure AI, Foundry, разгръщане, диагностика, оптимизация на разходите и още. Инсталирайте ги в GitHub Copilot, Cursor, Claude Code или във всеки поддържан агент:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Бързо ръководство за отстраняване на проблеми

**Чести проблеми, с които се сблъскват начинаещите, и незабавни решения:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Изброяване на наличните абонаменти
az account list --output table

# Задаване на абонамент по подразбиране
az account set --subscription "<subscription-id-or-name>"

# Задаване за AZD среда
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Проверка
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Опитайте друг регион на Azure
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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

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
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Повторно удостоверяване за AZD
azd auth logout
azd auth login

# По избор: обновете и Azure CLI, ако изпълнявате команди az
az logout
az login

# Проверете удостоверяването
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD генерира уникални имена, но ако възникне конфликт:
azd down --force --purge

# След това опитайте отново с нова среда
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Разгръщането на шаблона отнема твърде много време</strong></summary>

**Нормални времена за изчакване:**
- Просто уеб приложение: 5-10 минути
- Приложение с база данни: 10-15 минути
- AI приложения: 15-25 минути (предоставянето на OpenAI е бавно)

```bash
# Проверете напредъка
azd show

# Ако сте заседнали повече от 30 минути, проверете портала на Azure:
azd monitor --overview
# Потърсете неуспешни внедрявания
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Проверете ролята си в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Трябва ви поне ролята Contributor
# Помолете администратора на Azure да предостави:
# - Contributor (за ресурси)
# - User Access Administrator (за присвояване на роли)
```
</details>

<details>
<summary><strong>❌ Не може да се намери URL на разположеното приложение</strong></summary>

```bash
# Покажете всички крайни точки на услугите
azd show

# Или отворете портала на Azure
azd monitor

# Проверете конкретна услуга
azd env get-values
# Потърсете променливи *_URL
```
</details>

### 📚 Пълни ресурси за отстраняване на проблеми

- **Ръководство за чести проблеми:** [Подробни решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, свързани с AI:** [Отстраняване на проблеми с AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ръководство за отстраняване на грешки:** [Проверка стъпка по стъпка](docs/chapter-07-troubleshooting/debugging.md)
- **Получете помощ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завършване на курса и сертификация

### Проследяване на напредъка
Проследявайте напредъка си в обучението за всяка глава:

- [ ] **Глава 1**: Основи и бърз старт ✅
- [ ] **Глава 2**: Разработка, ориентирана към AI ✅  
- [ ] **Глава 3**: Конфигурация и удостоверяване ✅
- [ ] **Глава 4**: Инфраструктура като код и разгръщане ✅
- [ ] **Глава 5**: Многоагентни AI решения ✅
- [ ] **Глава 6**: Валидиране и планиране преди разгръщане ✅
- [ ] **Глава 7**: Отстраняване на проблеми и отстраняване на грешки ✅
- [ ] **Глава 8**: Производствени и корпоративни модели ✅

### Потвърждаване на обучението
След завършване на всяка глава, потвърдете знанията си чрез:
1. **Практическо упражнение**: Завършете практическото разгръщане на главата
2. **Проверка на знанията**: Прегледайте секцията с ЧЗВ за вашата глава
3. **Обсъждане в общността**: Споделете опита си в Azure Discord
4. **Следваща глава**: Преминете към следващото ниво на сложност

### Предимства след завършване на курса
След завършване на всички глави ще получите:
- **Производствен опит**: Разположени реални AI приложения в Azure
- **Професионални умения**: Умения за разгръщане, готови за предприятия  
- **Признание в общността**: Активен член на общността на Azure разработчиците
- **Кариерно развитие**: Търсени умения за AZD и разгръщане на AI решения

---

## 🤝 Общност и поддръжка

### Получете помощ и поддръжка
- **Технически проблеми**: [Докладване на грешки и искане на функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Въпроси, свързани с обучението**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощ, свързана с AI**: Присъединете се към [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официална документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Информация от общността в Microsoft Foundry Discord

**Последни резултати от анкета в канала #Azure:**
- **45%** от разработчиците искат да използват AZD за AI работни натоварвания
- **Основни предизвикателства**: Разгръщания с множество услуги, управление на удостоверения, готовност за продукция  
- **Най-често искани**: Шаблони, специфични за AI, ръководства за отстраняване на проблеми, добри практики

**Присъединете се към нашата общност, за да:**
- Споделяте опита си с AZD + AI и да получите помощ
- Достъпвате ранни предварителни версии на нови AI шаблони
- Допринасяте за добрите практики при разгръщане на AI
- Влияете върху бъдещото развитие на AI + AZD функциите

### Допринасяне за курса
Очакваме ваши приноси! Моля, прочетете нашето [Contributing Guide](CONTRIBUTING.md) за подробности относно:
- **Подобрения на съдържанието**: Подобряване на съществуващите глави и примери
- **Нови примери**: Добавяне на реални сценарии и шаблони  
- **Превод**: Помощ за поддържане на поддръжка на много езици
- **Докладване на грешки**: Подобряване на точността и яснота
- **Стандарти на общността**: Следвайте нашите приобщаващи насоки за общността

---

## 📄 Информация за курса

### Лиценз
Този проект е лицензиран под лиценза MIT - вижте файла [LICENSE](../../LICENSE) за подробности.

### Свързани учебни ресурси на Microsoft

Нашият екип създава и други изчерпателни учебни курсове:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j за начинаещи](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js за начинаещи](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain за начинаещи](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD за начинаещи](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI за начинаещи](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP за начинаещи](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents за начинаещи](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Генеративен AI за начинаещи](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно обучение
[![ML за начинаещи](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science за начинаещи](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI за начинаещи](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Киберсигурност за начинаещи](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Уеб разработка за начинаещи](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT за начинаещи](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR разработка за начинаещи](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Copilot
[![Copilot за съвместно програмиране с AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Приключение с Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигация на курса

**🚀 Готови да започнете да учите?**

**За начинаещи**: Започнете с [Глава 1: Основи и бърз старт](#-chapter-1-foundation--quick-start)  
**Разработчици на AI**: Преминете към [Глава 2: Разработка, фокусирана върху AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Опитни разработчици**: Започнете с [Глава 3: Конфигурация и удостоверяване](#️-chapter-3-configuration--authentication)

**Следващи стъпки**: [Започнете Глава 1 - Основи на AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->