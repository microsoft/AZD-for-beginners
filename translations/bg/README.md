# AZD за начинаещи: Структуриран учебен път

![AZD-for-beginners](../../translated_images/bg/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматизирани преводи (Винаги актуални)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Български](./README.md) | [Бирмански (Мианмар)](../my/README.md) | [Китайски (опростен)](../zh-CN/README.md) | [Китайски (традиционен, Хонг Конг)](../zh-HK/README.md) | [Китайски (традиционен, Макао)](../zh-MO/README.md) | [Китайски (традиционен, Тайван)](../zh-TW/README.md) | [Хърватски](../hr/README.md) | [Чешки](../cs/README.md) | [Датски](../da/README.md) | [Холандски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Френски](../fr/README.md) | [Немски](../de/README.md) | [Гръцки](../el/README.md) | [Еврейски](../he/README.md) | [Хинди](../hi/README.md) | [Унгарски](../hu/README.md) | [Индонезийски](../id/README.md) | [Италиански](../it/README.md) | [Японски](../ja/README.md) | [Канада](../kn/README.md) | [Кхмер](../km/README.md) | [Корейски](../ko/README.md) | [Литовски](../lt/README.md) | [Малайски](../ms/README.md) | [Малаялам](../ml/README.md) | [Маратхи](../mr/README.md) | [Непалски](../ne/README.md) | [Нигерийски Пиджин](../pcm/README.md) | [Норвежки](../no/README.md) | [Персийски (фарси)](../fa/README.md) | [Полски](../pl/README.md) | [Португалски (Бразилия)](../pt-BR/README.md) | [Португалски (Португалия)](../pt-PT/README.md) | [Пенджабски (Гурмукхи)](../pa/README.md) | [Румънски](../ro/README.md) | [Руски](../ru/README.md) | [Сръбски (кирилица)](../sr/README.md) | [Словашки](../sk/README.md) | [Словенски](../sl/README.md) | [Испански](../es/README.md) | [Суахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (филипински)](../tl/README.md) | [Тамилски](../ta/README.md) | [Телугу](../te/README.md) | [Тайски](../th/README.md) | [Турски](../tr/README.md) | [Украински](../uk/README.md) | [Урду](../ur/README.md) | [Виетнамски](../vi/README.md)

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

## 🆕 Какво ново в azd днес

> 📌 **Преглед на изданието AI CLI (2026-11-04):** Ръководството беше проверено спрямо публикуваната документация/източник за **`azd 1.37.2`**, **агенти `1.0.0-beta.23`** и **оценки `1.0.0-beta.2`**. Използвайте `azd >= 1.37.0` за комбинираната работна последователност. Изпълнете `azd version` и [актуализирайте основния CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) преди разширенията. Вижте [промени и поправки в изданието](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Това не е валидация на живо на цялото разгръщане на курса.

Azure Developer CLI поддържа много типове приложения, включително уеб приложения, API и AI агенти чрез поддържани хостове, шаблони и разширения.

Ето какво означава това за вас:

- **AI агентите вече са първокласни azd натоварвания.** Можете да инициализирате, разгърнете и управлявате AI агентски проекти, използвайки същата `azd init` → `azd up` работна последователност, която вече знаете.
- **Животен цикъл на агента в две разширения.** Използвайте `azure.ai.agents` за инициализация, извикване, оптимизация и пенсиониране на агенти. Инсталирайте **`azure.ai.evaluations`** отделно за `azd ai eval init`, `generate` и `run start`. Агент beta.22 замени стария работен процес за оценяване и промени конфигурацията на оптимизация; следвайте [ръководството за миграция](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Още AI строителни блокове.** Нови предварителни версии на разширения—`azure.ai.skills` и `azure.ai.connections`—позволяват управление на повторно използваеми умения на агенти и интеграции с Foundry директно с azd.
- **Интеграция с Microsoft Foundry** носи разгръщането на модели, хостинг на агенти и конфигуриране на AI услуги директно в екосистемата на шаблоните azd.
- **По-гладко ежедневие.** Скорошни издания направиха `azd init` идемпотентен (безопасен за повторно изпълнение), `azd auth login` изчиства автоматично остарели маркери и добавиха приятелски `azd tool` подкана при първото стартиране.
- **Основната работна последователност не се е променила.** Независимо дали разгръщате todo приложение, микросървис или AI решение с множество агенти, командите са същите.

> **Забележка за Aspire потребители:** Microsoft вече нарича продукта просто **Aspire** (преди ".NET Aspire"). Поддръжката на azd за Aspire не се е променила—само името.

Ако сте използвали azd преди, AI поддръжката е естествено разширение — не отделен инструмент или напреднал курс. Ако започвате отначало, ще научите една работна последователност, която работи за всичко.

---

## 🚀 Какво е Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** е команден инструмент, удобен за разработчици, който улеснява разгръщането на приложения в Azure. Вместо ръчно създаване и свързване на десетки Azure ресурси, можете да разположите цели приложения с една команда.

### Магията на `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Шаблонът осигурява конфигурацията на приложението и инфраструктурата. Успешното разгръщане все още изисква поддържани услуги/модели, достатъчно квоти и разрешения, коректни входни данни и проверка на разположеното приложение. `azd up` не прави шаблона автоматично сигурен, съответстващ или готов за продукция.

---

## ❓ Azure Developer CLI в сравнение с Azure CLI: Каква е разликата?

Това е най-често задаваният въпрос от начинаещи. Ето простият отговор:

| Функция | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Цел** | Управление на отделни Azure ресурси | Разгръщане на цели приложения |
| **Подход** | Ориентиран към инфраструктура | Ориентиран към приложение |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крива на учене** | Трябва да знаете Azure услуги | Трябва само да знаете вашето приложение |
| **Подходящ за** | DevOps, Инфраструктура | Разработчици, Прототипиране |

### Лесна аналогия

- **Azure CLI** е като да имате всички инструменти за строеж на къща — чукове, триони, пирони. Можете да построите всичко, но трябва да знаете строителство.
- **Azure Developer CLI** е като да наемете изпълнител — описвате какво искате и той се грижи за строежа.

### Кога да използвате кое

| Сценарий | Използвайте това |
|----------|----------|
| "Искам бързо да разположа уеб приложението си" | `azd up` |
| "Трябва ми само да създам акаунт за съхранение" | `az storage account create` |
| "Строя пълно AI приложение" | `azd init --template azure-search-openai-demo` |
| "Трябва да отстраня проблем с конкретен Azure ресурс" | `az resource show` |
| "Искам да разположа в конфигурираната си продукционна среда" | Прегледайте конфигурацията, достъпа, разходите и оперативните врати преди `azd up --environment production` |

### Работят заедно!

AZD и Azure CLI имат отделна автентикация и конфигурация. Използвайте `azd auth login` за AZD и `az login` когато една кука или диагностична команда изрично се нуждае от Azure CLI. Можете да използвате и двата:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Намерете шаблони в Awesome AZD

Не започвайте от нулата! **Awesome AZD** е общността с готови за разгръщане шаблони:

| Ресурс | Описание |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Разгледайте 200+ шаблона с разгръщане с един клик |
| 🔗 [**Изпратете шаблон**](https://github.com/Azure/awesome-azd/issues) | Допринесете със собствен шаблон за общността |
| 🔗 [**GitHub хранилище**](https://github.com/Azure/awesome-azd) | Дайте звездичка и разгледайте изходния код |

### Популярни AI шаблони от Awesome AZD

Изберете един шаблон в собствената му празна директория; долните команди са алтернативи. Следващото `.` инициализира тази директория.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Започване в 3 стъпки

Преди да започнете, уверете се, че машината ви е готова за шаблона, който искате да разположите:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ако някоя от необходимите проверки се провали, поправете я първо, след което продължете с бързия старт.

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
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Ако не сте сигурни кое ви трябва, следвайте целия процес на настройка в [Инсталиране и настройка](docs/chapter-01-foundation/installation.md#authentication-setup).

### Стъпка 3: Разгърнете първото си приложение

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Това е!** Вашето приложение вече работи в Azure.

### Почистване (не забравяйте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как да използвате този курс

Този курс е проектиран за **постепенно обучение** - започнете откъдето сте комфортни и се развивайте:

| Вашият опит | Започнете тук |
|-----------------|------------|
| **Напълно нов в Azure** | [Глава 1: Основи](#-chapter-1-foundation--quick-start) |
| **Знаете Azure, нови за AZD** | [Глава 1: Основи](#-chapter-1-foundation--quick-start) |
| **Искате да разгръщате AI приложения** | [Глава 2: AI-Първо разработване](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Искате практически опит** | [🎓 Интерактивен работен семинар](workshop/README.md) - 3-4 часова водена лаборатория |
| **Нуждаете се от производствени модели** | [Глава 8: Производство и корпоративно използване](#-chapter-8-production--enterprise-patterns) |

### Бърза настройка

1. **Клонирайте това хранилище**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирайте го**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Получете помощ**: [Azure Discord общност](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитате да клонирате локално?**

> Това хранилище включва преводи на над 50 езика, което значително увеличава размера на изтегляне. За да клонирате без преводи, използвайте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Това ви дава всичко необходимо, за да завършите курса с много по-бързо изтегляне.


## Преглед на курса

Овладейте Azure Developer CLI (azd) чрез структурирани глави, предназначени за прогресивно обучение. **Специален акцент върху разгръщането на AI приложения с интеграция на Microsoft Foundry.**

### Защо този курс е от съществено значение за съвременните разработчици

Разработчиците, които разгръщат AI задачи, често имат нужда от наставления по:
- Сложни многосервисни AI архитектури
- Най-добри практики за продукционно разгръщане на AI  
- Интеграция и конфигурация на Azure AI услуги
- Оптимизация на разходите за AI задачи
- Отстраняване на проблеми, специфични за AI разгръщания

### Учебни цели

Чрез завършване на този структуриран курс ще:
- **Овладеете основите на AZD**: Основни концепции, инсталация и конфигурация
- **Разгърнете AI приложения**: Използвайте AZD с Microsoft Foundry услуги
- **Прилагате инфраструктура като код**: Управление на Azure ресурси с Bicep шаблони
- **Отстранявате проблеми с разгръщанията**: Решавайте често срещани проблеми и отстранявайте грешки
- **Оптимизирате за продукция**: Сигурност, мащабиране, мониторинг и управление на разходите
- **Създавате мултиагентни решения**: Разгръщане на сложни AI архитектури

## Преди да започнете: Акаунти, достъп и предпоставки

Преди да започнете Глава 1, уверете се, че имате следното. Стъпките за инсталация по-нататък в този наръчник приемат, че тези основи вече са покрити.

- **Абонамент в Azure**: Можете да използвате съществуващ абонамент от работата или личен акаунт, или да създадете [безплатен пробен период](https://aka.ms/azurefreetrial), за да започнете.
- **Разрешение за създаване на Azure ресурси**: За повечето упражнения трябва да имате поне **Contributor** достъп на целевия абонамент или група ресурси. Някои глави предполагаемо изискват да можете да създавате групи ресурси, управлявани идентичности и RBAC присвоявания.
- [**GitHub акаунт**](https://github.com): Полезен за форкване на репозитория, следене на вашите промени и използване на GitHub Codespaces за работилницата.
- **Изисквания за изпълнение на шаблони**: Някои шаблони изискват локални инструменти като Node.js, Python, Java или Docker. Стартирайте валидатора на настройката преди да започнете, за да откриете липсващи инструменти рано.
- **Базова терминална грамотност**: Не е нужно да сте експерт, но трябва да сте удобни с изпълнението на команди като `git clone`, `azd auth login` и `azd up`.

> **Работите в корпоративен абонамент?**
> Ако вашата Azure среда се управлява от администратор, потвърдете предварително, че можете да разгръщате ресурси в абонамента или групата ресурси, която възнамерявате да използвате. Ако не, поискайте песъчник абонамент или достъп Contributor преди да започнете.

> **Нов във Azure?**
> Започнете с вашия собствен Azure пробен или pay-as-you-go абонамент на https://aka.ms/azurefreetrial, за да можете да завършите упражненията напълно, без да чакате одобрения на ниво на наемател.

## 🗺️ Карта на курса: Бърза навигация по глави

Всяка глава има отделен README с учебни цели, бързи стартове и упражнения:

| Глава | Тема | Уроци | Продължителност | Сложност |
|---------|-------|---------|----------|------------|
| **[Гл. 1: Основи](docs/chapter-01-foundation/README.md)** | Започване | [Основи на AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталация](docs/chapter-01-foundation/installation.md) &#124; [Първи проект](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл. 2: Разработка на AI](docs/chapter-02-ai-development/README.md)** | AI-ориентирани приложения | [Интеграция с Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Разгръщане на модели](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Работилница](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ч | ⭐⭐ |
| **[Гл. 3: Конфигурация](docs/chapter-03-configuration/README.md)** | Автентикация и сигурност | [Конфигурация](docs/chapter-03-configuration/configuration.md) &#124; [Автентикация и сигурност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и Разгръщане | [Наръчник за разгръщане](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Осигуряване](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ч | ⭐⭐⭐ |
| **[Гл. 5: Мулти-Агент](docs/chapter-05-multi-agent/README.md)** | AI агент решения | [Търговски сценарий](examples/retail-scenario.md) &#124; [Координационни модели](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[Гл. 6: Преди разгръщане](docs/chapter-06-pre-deployment/README.md)** | Планиране и проверка | [Проверки преди полет](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планиране на капацитет](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор на SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ч | ⭐⭐ |
| **[Гл. 7: Отстраняване на проблеми](docs/chapter-07-troubleshooting/README.md)** | Отстраняване на грешки и корекции | [Често срещани проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Отстраняване на грешки](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ч | ⭐⭐ |
| **[Гл. 8: Продукция](docs/chapter-08-production/README.md)** | Предприятелски модели | [Практики за продукция](docs/chapter-08-production/production-ai-practices.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[🎓 Работилница](workshop/README.md)** | Практическа лаборатория | [Въведение](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Персонализация](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Разглобяване](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Заключение](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ч | ⭐⭐ |

**Обща продължителност на курса:** ~10-14 часа | **Прогрес на уменията:** Начинаещ → Готов за продукция

---

## 📚 Учебни глави

*Изберете своя учебен път според нивото на опит и целите*

### 🚀 Глава 1: Основи и бърз старт
**Предпоставки**: Azure абонамент, базови знания по командния ред  
**Продължителност**: 30-45 минути  
**Сложност**: ⭐

#### Какво ще научите
- Разбиране на основите на Azure Developer CLI
- Инсталиране на AZD на вашата платформа
- Първото ви успешно разгръщане

#### Учебни ресурси
- **🎯 Започнете тук**: [Какво е Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Теория**: [Основи на AZD](docs/chapter-01-foundation/azd-basics.md) - Основни концепции и терминология
- **⚙️ Настройка**: [Инсталация и настройка](docs/chapter-01-foundation/installation.md) - Ръководства за конкретни платформи
- **🛠️ Практика**: [Вашият първи проект](docs/chapter-01-foundation/first-project.md) - Урок стъпка по стъпка
- **📋 Бърз справочник**: [Шийт с команди](resources/cheat-sheet.md)

#### Практически упражнения
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Резултат от главата**: Успешно разгръщане на просто уеб приложение в Azure чрез AZD

**✅ Потвърждение за успех:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Времева инвестиция:** 30-45 минути  
**📈 Ниво на умения след:** Можете самостоятелно да разгръщате базови приложения

---

### 🤖 Глава 2: AI-ориентирано разработване (Препоръчана за AI разработчици)
**Предпоставки**: Завършена Глава 1  
**Продължителност**: 1-2 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Интеграция на Microsoft Foundry с AZD
- Разгръщане на AI-базирани приложения
- Разбиране на конфигурациите на AI услуги

#### Учебни ресурси
- **🎯 Започнете тук**: [Интеграция с Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Ръководство за AI агенти](docs/chapter-02-ai-development/agents.md) - Разгръщане на интелигентни агенти с AZD
- **📖 Модели**: [Разгръщане на AI модели](docs/chapter-02-ai-development/ai-model-deployment.md) - Разгръщане и управление на AI модели
- **🛠️ Работилница**: [AI работилница](docs/chapter-02-ai-development/ai-workshop-lab.md) - Подгответе AI решения за AZD
- **🎥 Интерактивно ръководство**: [Материали за работилницата](workshop/README.md) - Обучение в браузър с MkDocs * Среда DevContainer
- **📋 Шаблони**: [Шаблони на Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Примери**: [Примери за разгръщане с AZD](examples/README.md)

#### Практически упражнения
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Резултат от главата**: Разгърнете и конфигурирайте AI-задвижван чат приложение с RAG възможности

**✅ Потвърждение за успех:**
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

**📊 Времева инвестиция:** 1-2 часа  
**📈 Ниво на умения след:** Можете да разгръщате AI приложения за обучение и да идентифицирате допълнителни изисквания за продукционна готовност
**💰 Осъзнаване на разходите:** Разберете, че разходите за разработка са $80-150/месец, а за продукция $300-3500/месец

#### 💰 Обмисляне на разходите за AI разгръщания

**Среда за разработка (Оценено на $80-150/месец):**
- Microsoft Foundry модели (плащане според използването): $0-50/месец (на база токени)
- AI Search (основен слой): $75/месец
- Container Apps (консумационен слой): $0-20/месец
- Съхранение (стандартно): $1-5/месец

**Продукционна среда (Оценено на $300-3500+/месец):**
- Microsoft Foundry модели (PTU за консистентна производителност): $3,000+/месец ИЛИ плащане според използването с голям обем
- AI Search (стандартен слой): $250/месец
- Container Apps (отделен слой): $50-100/месец
- Application Insights: $5-50/месец
- Съхранение (премиум): $10-50/месец

**💡 Съвети за оптимизация на разходите:**
- Проверявайте ценообразуване за модели за предсказване и кредити за конкретни акаунти; Azure OpenAI няма универсално месечно безплатно поле от 50 000 токена
- Стартирайте `azd down` за изтриване на ресурси след като вече не са ви нужни, след като прегледате избраната среда
- Започнете с консумационно таксуване, надграждайте до PTU само за продукция
- Използвайте `azd provision --preview` за инспекция на планираната инфраструктура, след което оценете ресурсите с Azure Pricing Calculator
- Активирайте авто-мащабиране: плащате само за реалната консумация

**Мониторинг на разходите:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Глава 3: Конфигурация и автентикация
**Предпоставки**: Завършена Глава 1  
**Продължителност**: 45-60 минути  
**Сложност**: ⭐⭐

#### Какво ще научите
- Конфигурация и управление на среди
- Най-добри практики за автентикация и сигурност
- Именуване и организация на ресурси

#### Учебни ресурси
- **📖 Конфигурация**: [Ръководство за конфигурация](docs/chapter-03-configuration/configuration.md) - Настройване на среди
- **🔐 Сигурност**: [Модели за автентикация и управлявани идентичности](docs/chapter-03-configuration/authsecurity.md) - Модели за автентикация
- **📝 Примери**: [Пример с базата данни](examples/database-app/README.md) - AZD бази данни примери

#### Практически упражнения
- Конфигурирайте няколко среди (dev, staging, prod)
- Настройте автентикация чрез управлявана идентичност
- Прилагайте среди-специфични конфигурации

**💡 Резултат от главата**: Управлявайте множество среди с правилна автентикация и сигурност

---

### 🏗️ Глава 4: Инфраструктура като код и разгръщане
**Предпоставки**: Завършени Глави 1-3  
**Продължителност**: 1-1.5 часа  
**Сложност**: ⭐⭐⭐

#### Какво ще научите
- Разширени модели на разгръщане
- Инфраструктура като код с Bicep
- Стратегии за осигуряване на ресурси

#### Учебни ресурси
- **📖 Разгръщане**: [Наръчник за разгръщане](docs/chapter-04-infrastructure/deployment-guide.md) - Пълни работни потоци
- **🏗️ Осигуряване**: [Осигуряване на ресурси](docs/chapter-04-infrastructure/provisioning.md) - Управление на Azure ресурси
- **📝 Примери**: [Пример с контейнерно приложение](../../examples/container-app) - Разгръщания с контейнери

#### Практически упражнения
- Създайте персонализирани Bicep шаблони
- Разгърнете многосервисни приложения
- Прилагайте стратегии за синьо-зелено разгръщане

**💡 Резултат от главата**: Разгръщайте сложни многосервисни приложения с персонализирани инфраструктурни шаблони

---

### 🎯 Глава 5: Мулти-агентни AI решения (напреднали)
**Предпоставки**: Завършени Глави 1-2  
**Продължителност**: 2-3 часа  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Модели за мулти-агентна архитектура
- Оркестрация и координация на агенти
- Продукционно готови AI разгръщания

#### Учебни ресурси
- **🤖 Представен дизайн**: [Мулти-агентно решение за търговия на дребно](examples/retail-scenario.md) - Архитектурен план, не цялостно приложение
- **🛠️ ARM шаблони**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Скелет на инфраструктура; прегледайте предварителните изисквания и липсващите компоненти на приложението
- **📖 Архитектура**: [Модели за координация на множество агенти](docs/chapter-06-pre-deployment/coordination-patterns.md) - Модели

#### Практически упражнения
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат от главата**: Разберете дизайна на множество агенти и идентифицирайте нужната реализация, валидация и оперативна работа над инфраструктурния скелет

---

### 🔍 Глава 6: Валидация и планиране преди разполагане
**Предварителни изисквания**: Глава 4 завършена  
**Продължителност**: 1 час  
**Сложност**: ⭐⭐

#### Какво ще научите
- Планиране на капацитет и валидация на ресурсите
- Стратегии за избор на SKU
- Предварителни проверки и автоматизация

#### Ресурси за обучение
- **📊 Планиране**: [Планиране на капацитет](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидация на ресурси
- **💰 Избор**: [Избор на SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Разумни решения по цена
- **✅ Валидация**: [Предварителни проверки](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизирани скриптове

#### Практически упражнения
- Стартиране на скриптове за валидация на капацитета
- Оптимизиране на избора на SKU за по-ниска цена
- Прилагане на автоматизирани проверки преди разполагане

**💡 Резултат от главата**: Въвеждане на валидиране и оптимизация на разполагането преди изпълнение

---

### 🚨 Глава 7: Отстраняване на неизправности и дебъгинг
**Предварителни изисквания**: Всяка глава за разполагане завършена  
**Продължителност**: 1-1.5 часа  
**Сложност**: ⭐⭐

#### Какво ще научите
- Систематични подходи за дебъгинг
- Чести проблеми и решения
- Отстраняване на проблеми, свързани с AI

#### Ресурси за обучение
- **🔧 Честите проблеми**: [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) - Често задавани въпроси и решения
- **🕵️ Отстраняване на грешки**: [Ръководство за дебъгинг](docs/chapter-07-troubleshooting/debugging.md) - Стъпка по стъпка стратегии
- **🤖 AI проблеми**: [Отстраняване на проблеми с AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми с AI услуги

#### Практически упражнения
- Диагностика на неуспешни разполагания
- Решаване на проблеми с удостоверяването
- Отстраняване на проблеми с връзката към AI услуги

**💡 Резултат от главата**: Самостоятелна диагностика и решаване на често срещани проблеми при разполагане

---

### 🏢 Глава 8: Модели за производство и предприятия
**Предварителни изисквания**: Глави 1-4 завършени  
**Продължителност**: 2-3 часа  
**Сложност**: ⭐⭐⭐⭐

#### Какво ще научите
- Стратегии за разполагане в продукция
- Модели за сигурност в предприятията
- Мониторинг и оптимизация на разходите

#### Ресурси за обучение
- **🏭 Производство**: [Най-добри практики за AI в продукция](docs/chapter-08-production/production-ai-practices.md) - Модели за предприятия
- **📝 Примери**: [Пример с микросървиси](../../examples/microservices) - Сложни архитектури
- **📊 Мониторинг**: [Интеграция с Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практически упражнения
- Прилагане на модели за сигурност в предприятията
- Настройване на обширен мониторинг
- Разполагане в продукция с правилно управление

**💡 Резултат от главата**: Разполагане на готови за предприятия приложения с пълни възможности за продукция

---

## 🎓 Преглед на работилницата: Практически обучителен опит

> **⚠️ СЪСТОЯНИЕ НА РАБОТИЛНИЦАТА: Активна разработка**  
> Материалите за работилницата в момента се разработват и подобряват. Основните модули са функционални, но някои напреднали раздели са непълни. Активно работим за завършване на цялото съдържание. [Проследи напредъка →](workshop/README.md)

### Интерактивни материали за работилницата
**Изчерпателно практическо обучение с браузър-базирани инструменти и водени упражнения**

Нашите материали за работилницата предоставят структурирано, интерактивно учебно изживяване, което допълва гореспоменатата глава-базирана учебна програма. Работилницата е проектирана както за самостоятелно обучение, така и за обучение с инструктор.

#### 🛠️ Характеристики на работилницата
- **Интерфейс в браузър**: Пълна работилница, управлявана от MkDocs с търсене, копиране и теми
- **Интеграция с GitHub Codespaces**: Настройка на среда за разработка с един клик
- **Структуриран учебен път**: 8 модула с водени упражнения (общо 3-4 часа)
- **Прогресивна методология**: Въведение → Избор → Валидация → Деконструкция → Конфигурация → Персонализиране → Демонтаж → Обобщение
- **Интерактивна среда DevContainer**: Предварително конфигурирани инструменти и зависимости

#### 📚 Структура на модулите на работилницата
Работилницата следва **8-модулна прогресивна методология**, която ви води от откриването до експертно владеене на разполагането:

| Модул | Тема | Какво ще правите | Продължителност |
|--------|-------|----------------|----------|
| **0. Въведение** | Преглед на работилницата | Разберете учебните цели, предварителните изисквания и структурата на работилницата | 15 мин |
| **1. Избор** | Откриване на шаблони | Проучете AZD шаблони и изберете подходящия AI шаблон за вашия сценарий | 20 мин |
| **2. Валидация** | Разполагане и проверка | Разположете шаблона с `azd up` и валидирайте инфраструктурата | 30 мин |
| **3. Деконструкция** | Разбиране на структурата | Използвайте GitHub Copilot за изследване на архитектурата на шаблона, Bicep файлове и организация на кода | 30 мин |
| **4. Конфигурация** | Дълбокото разглеждане на azure.yaml | Умение в конфигурацията на `azure.yaml`, lifecycle hooks и променливи на средата | 30 мин |
| **5. Персонализиране** | Направете го свое | Активиране на AI търсене, проследяване, оценка и персонализиране за вашия сценарий | 45 мин |
| **6. Демонтаж** | Изчистване | Безопасно изключване на ресурсите с `azd down --purge` | 15 мин |
| **7. Обобщение** | Следващи стъпки | Преглед на постигнатото, ключови концепции и продължаване на обучението | 15 мин |

**Поток на работилницата:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Започване на работилницата
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Резултати от обучението в работилницата
След завършване на работилницата участниците ще:
- **Разполагат AI приложения в продукция**: Използват AZD с Microsoft Foundry услуги
- **Владеят архитектури с множество агенти**: Имплементират координирани AI агентски решения
- **Прилагат най-добри практики за сигурност**: Конфигурират удостоверяване и контрол на достъпа
- **Оптимизират за мащабируемост**: Проектират ефективни по цена и производителност разполагания
- **Отстраняват проблеми при разполагане**: Решават самостоятелно често срещани проблеми

#### 📖 Ресурси на работилницата
- **🎥 Интерактивен наръчник**: [Материали за работилницата](workshop/README.md) - Обучителна среда в браузър
- **📋 Инструкции за всеки модул**:
  - [0. Въведение](workshop/docs/instructions/0-Introduction.md) - Преглед и цели на работилницата
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Намерете и изберете AI шаблони
  - [2. Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) - Разполагане и проверка на шаблони
  - [3. Деконструкция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Изследване на архитектурата на шаблона
  - [4. Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) - Майсторство в azure.yaml
  - [5. Персонализация](workshop/docs/instructions/5-Customize-AI-Template.md) - Персонализиране за вашия сценарий
  - [6. Демонтаж](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Изчистване на ресурси
  - [7. Обобщение](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следващи стъпки
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Упражнения фокусирани върху AI
- **💡 Бърз старт**: [Ръководство за настройка на работилницата](workshop/README.md#browser-based-guide) - Конфигуриране на средата

**Подходящо за**: Корпоративно обучение, университетски курсове, самостоятелно обучение и bootcamp курсове за разработчици.

---

## 📖 Задълбочен преглед: Възможности на AZD

Освен основите, AZD предлага мощни функции за разполагане в продукция:

- **Разполагане базирано на шаблони** - Използвайте предварително изработени шаблони за често използвани модели на приложения
- **Инфраструктура като код** - Управление на Azure ресурси чрез Bicep или Terraform  
- **Интегрирани работни процеси** - Безпроблемно осигуряване, разполагане и мониторинг на приложения
- **Ориентирано към разработчици** - Оптимизирано за продуктивност и удобство на разработчиците

### **AZD + Microsoft Foundry: Идеално за AI разполагания**

**Защо AZD за AI решения?** AZD адресира основните предизвикателства пред AI разработчиците:

- **Шаблони готови за AI** - Предварително конфигурирани шаблони за Microsoft Foundry модели, Azure AI услуги и ML натоварвания
- **Сигурни AI разполагания** - Вградени модели за сигурност за AI услуги, API ключове и крайни точки на моделите  
- **Производствени AI модели** - Най-добри практики за мащабируеми и ефективни по цена AI приложения
- **Край до край AI работни процеси** - От разработка на модел до разполагане в продукция с адекватен мониторинг
- **Оптимизация на разходи** - Интелигентно разпределение и мащабиране на ресурси за AI натоварвания
- **Интеграция с Microsoft Foundry** - Безпроблемна връзка с каталога на модели и крайни точки на Microsoft Foundry

---

## 🎯 Библиотека с шаблони и примери

### Отличени: Microsoft Foundry шаблони
**Започнете тук, ако разполагате AI приложения!**

> **Забележка:** Тези шаблони демонстрират различни AI модели. Някои са външни Azure образци, други са локални реализации.

| Шаблон | Глава | Сложност | Услуги | Тип |
|----------|---------|------------|----------|------|
| [**Започнете с AI чат**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Външен |
| [**Започнете с AI агенти**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Външен |
| [**Демонстрация на Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (по подразбиране) + Storage | Външен |
| [**Бърз старт с OpenAI чат приложение**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Външен |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Външен |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Външен |
| [**Решение за търговия с множество агенти**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Предложена архитектура и инфраструктурен скелет; необходима е реализация на приложението | **Локален план** |

### Отличени: Пълни учебни сценарии
**Приложения готови за продукция, съобразени с учебните глави**

| Шаблон | Учебна глава | Сложност | Основно обучение |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Основни модели за AI разполагане |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | RAG реализация с Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Агентска поддръжка на чат и специфични тестове за оценка |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Агентска рамка и извикване на функции |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Предприятелска AI оркестрация |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Архитектура с множество агенти с Customer и Inventory агенти |

### Обучение чрез тип пример

> **📌 Локални срещу външни примери:**  
> **Локални примери** (в това хранилище) = Прегледайте README файла на примера за статус на реализация и предварителни изисквания
> **Външни примери** (Azure Samples) = Клонирайте от свързаните хранилища

#### Локални примери (готови за използване)
- [**Решение с множество агенти за търговия**](examples/retail-scenario.md) - Архитектурен план с ARM инфраструктурен скелет
  - Предложени роли на Customer и Inventory агенти
  - Мониторинг, оценка и код на приложението трябва да бъдат реализирани и проверени
  - Самото осигуряване на ресурси не създава работещо търговско приложение

#### Локални примери - Контейнерни приложения (Глави 2-5)
**Изчерпателни примери за разполагане на контейнери в това хранилище:**
- [**Примери за контейнерни приложения**](examples/container-app/README.md) - Пълен наръчник за контейнеризирани разполагания
  - [Прост Flask API](../../examples/container-app/simple-flask-api) - Основен REST API с мащабиране до нула
  - [Архитектура на микросървиси](../../examples/container-app/microservices) - Пример с два сервиза; доработката за производство е допълнителна работа
  - Модели за бързо стартиране, производство и напреднали разполагания
  - Насоки за мониторинг, сигурност и оптимизация на разходите

#### Външни примери - Прости приложения (Глави 1-2)
**Клонирайте тези Azure Samples хранилища, за да започнете:**
- [Общо уеб приложение - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни модели за разполагане
- [Статичен уебсайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Разполагане на статично съдържание
- [Контейнерно приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Разполагане на REST API

#### Външни примери - Интеграция с база данни (Глави 3-4)  
- [Приложение с база данни - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Модели за свързване с база данни
- [Функции + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсървърен работен процес с данни

#### Външни примери - Разширени модели (Глави 4-8)
- [Java микроуслуги](https://github.com/Azure-Samples/java-microservices-aca-lab) - Многосервисни архитектури
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Фоново обработване  
- [Предприятие ML pipeline](https://github.com/Azure/mlops-v2) - Справочни модели за MLOps; не е директен AZD шаблон

### Външни колекции с шаблони
- [**Официална галерия с AZD шаблони**](https://azure.github.io/awesome-azd/) - Курирана колекция от официални и общностни шаблони
- [**Шаблони за Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документация на шаблони в Microsoft Learn
- [**Директория с примери**](examples/README.md) - Локални учебни примери с подробни обяснения

---

## 📚 Учебни ресурси и препратки

### Бързи справки
- [**Команден лист**](resources/cheat-sheet.md) - Основни команди azd организирани по глави
- [**Речник**](resources/glossary.md) - Терминология за Azure и azd  
- [**ЧЗВ**](resources/faq.md) - Често задавани въпроси, организирани по учебни глави
- [**Учебно ръководство**](resources/study-guide.md) - Изчерпателни практически упражнения

### Практически работилници
- [**AI лабораторна работилница**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Направете AI решенията си готови за разгръщане с AZD (2-3 часа)
- [**Интерактивна работилница**](workshop/README.md) - 8-модулни ръководени упражнения с MkDocs и GitHub Codespaces
  - Следва: Въведение → Избор → Потвърждение → Разглобяване → Конфигурация → Персонализация → Демонтаж → Обобщение

### Външни учебни ресурси
- [Документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Център за архитектура на Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калкулатор за цени на Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус на Azure](https://status.azure.com/)

### AI умения за вашия редактор
- [**Умения на Microsoft Azure в skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворени умения за агент за Azure AI, Foundry, разгръщане, диагностика, оптимизация на разходите и други. Инсталирайте ги в GitHub Copilot, Cursor, Claude Code или друг поддържан агент:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Бързо ръководство за отстраняване на проблеми

**Чести проблеми за начинаещи и незабавни решения:**

<details>
<summary><strong>❌ "azd: команда не е намерена"</strong></summary>

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
<summary><strong>❌ "Не е намерен абонамент" или "Абонаментът не е зададен"</strong></summary>

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
<summary><strong>❌ "Недостатъчна квота" или "Квотата е превишена"</strong></summary>

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
<summary><strong>❌ "azd up" се проваля на половината</strong></summary>

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
<summary><strong>❌ "Неуспешна автентикация" или "Токенът е изтекъл"</strong></summary>

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
<summary><strong>❌ "Ресурсът вече съществува" или конфликти при именуване</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Разгръщането на шаблон отнема твърде дълго</strong></summary>

**Нормални времена за изчакване:**
- Прост уеб апартамент: 5-10 минути
- Приложение с база данни: 10-15 минути
- AI приложения: 15-25 минути (Провизиране на OpenAI е бавно)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Достъпът е отказан" или "Забранено"</strong></summary>

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
<summary><strong>❌ Не може да се намери URL на разгрънатото приложение</strong></summary>

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

### 📚 Пълни ресурси за отстраняване на проблеми

- **Ръководство за често срещани проблеми:** [Подробни решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми, свързани с AI:** [Отстраняване на AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Ръководство за дебъгинг:** [Стъпка по стъпка дебъгинг](docs/chapter-07-troubleshooting/debugging.md)
- **Помощ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завършване на курса и сертификат

### Проследяване на напредъка
Следете напредъка си в обучението през всяка глава:

- [ ] **Глава 1**: Основи и бърз старт ✅
- [ ] **Глава 2**: Разработка с акцент върху AI ✅  
- [ ] **Глава 3**: Конфигурация и автентикация ✅
- [ ] **Глава 4**: Инфраструктура като код и разгръщане ✅
- [ ] **Глава 5**: Многоагентни AI решения ✅
- [ ] **Глава 6**: Предварителна валидация и планиране преди разгръщане ✅
- [ ] **Глава 7**: Отстраняване на проблеми и дебъгинг ✅
- [ ] **Глава 8**: Производствени и корпоративни модели ✅

### Проверка на знанията
След завършване на всяка глава, провери знанията си чрез:
1. **Практическо упражнение**: Завърши практическото разгръщане в главата
2. **Проверка на знанията**: Прегледай секцията с ЧЗВ от твоето учебно съдържание
3. **Обсъждане в общността**: Сподели своя опит в Azure Discord
4. **Следваща глава**: Премини към следващото ниво на сложност

### Ползи от завършването на курса
След завършване на всички глави ще имаш:
- **Производствен опит**: Разгръщане на реални AI приложения в Azure
- **Професионални умения**: Възможности за разгръщане в корпоративна среда  
- **Признание в общността**: Активен член на общността на Azure разработчиците
- **Кариера**: Търсени знания и умения по AZD и AI разгръщане

---

## 🤝 Община и поддръжка

### Помощ и поддръжка
- **Технически проблеми**: [Съобщи за бъгове и поиска функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Въпроси за обучение**: [Общност в Microsoft Azure Discord](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощ за AI**: Присъедини се към [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официална документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Впечатления от общността в Microsoft Foundry Discord

**Обсъждани теми от общността:**
- Многоуслугни разгръщания, управление на идентификационни данни и производствена готовност
- AI-специфични шаблони, ръководства за отстраняване на проблеми и добри практики

**Присъедини се към нашата общност, за да:**
- Споделяш своя опит с AZD + AI и получаваш помощ
- Имаш достъп до ранни версии на нови AI шаблони
- Допринасяш за добрите практики при разгръщане на AI
- Влияеш на бъдещото развитие на AI + AZD функционалности

### Принос към курса
Очакваме приноси! Моля, прочети нашето [Ръководство за приноси](CONTRIBUTING.md) за детайли относно:
- **Подобрения на съдържанието**: Подобрявай съществуващи глави и примери
- **Нови примери**: Добавяй реални сценарии и шаблони  
- **Превод**: Помагай за поддържането на многоезична поддръжка
- **Доклади за бъгове**: Подобрявай точността и яснотата
- **Обществени стандарти**: Спазвай нашите приобщаващи указания за общността

---

## 📄 Информация за курса

### Лиценз
Този проект е лицензиран под лиценза MIT - виж файла [LICENSE](../../LICENSE) за подробности.

### Свързани учебни ресурси на Microsoft

Нашият екип създава и други изчерпателни учебни курсове:

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
[![AI Агенти за начинаещи](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия за генеративен AI
[![Генеративен AI за начинаещи](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративен AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основни обучения
[![ML за начинаещи](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Наука за данни за начинаещи](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI за начинаещи](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Киберсигурност за начинаещи](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Уеб разработка за начинаещи](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT за начинаещи](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR разработка за начинаещи](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Copilot
[![Copilot за AI съвместно програмиране](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Приключение с Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигация в курса

**🚀 Готов ли си да започнеш да учиш?**

**Начинаещи**: Започнете с [Глава 1: Основи и бърз старт](#-chapter-1-foundation--quick-start)  
**AI разработчици**: Продължете към [Глава 2: Разработка с акцент върху AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Опитни разработчици**: Започнете с [Глава 3: Конфигурация и автентикация](#️-chapter-3-configuration--authentication)

**Следващи стъпки**: [Започнете Глава 1 - Основи на AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->