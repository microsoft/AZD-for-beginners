# AZD For Beginners: A Structured Learning Journey

![АЗД за почетнике](../../translated_images/sr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub пратиоци](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub звезде](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Дискорд](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Дискорд](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Аутоматизовани преводи (увек ажурно)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арапски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Бугарски](../bg/README.md) | [Бурмански (Мјанмар)](../my/README.md) | [Кинески (упрошћени)](../zh-CN/README.md) | [Кинески (традиционални, Хонг Конг)](../zh-HK/README.md) | [Кинески (традиционални, Макао)](../zh-MO/README.md) | [Кинески (традиционални, Тајван)](../zh-TW/README.md) | [Хрватски](../hr/README.md) | [Чешки](../cs/README.md) | [Дански](../da/README.md) | [Холандски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Француски](../fr/README.md) | [Немачки](../de/README.md) | [Грчки](../el/README.md) | [Хебрејски](../he/README.md) | [Хинди](../hi/README.md) | [Мађарски](../hu/README.md) | [Индонежански](../id/README.md) | [Италијански](../it/README.md) | [Јапански](./translations/ja/READ ME.md) | [Каннада](../kn/README.md) | [Кмерски](../km/README.md) | [Корeјски](../ko/README.md) | [Литвански](../lt/README.md) | [Малајски](../ms/README.md) | [Малајалам](../ml/README.md) | [Марати](../mr/README.md) | [Неаполитански](../ne/README.md) | [Нигеријски Пидгин](../pcm/README.md) | [Норвешки](../no/README.md) | [Персијски (Фарси)](../fa/README.md) | [Пољски](../pl/README.md) | [Португалски (Бразил)](../pt-BR/README.md) | [Португалски (Португал)](../pt-PT/README.md) | [Пунџаби (Гурмухи)](../pa/README.md) | [Румунски](../ro/README.md) | [Руски](../ru/README.md) | [Српски (ћирилица)](./README.md) | [Словачки](../sk/README.md) | [Словеначки](../sl/README.md) | [Шпански](../es/README.md) | [Свахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (Филипински)](../tl/README.md) | [Тамил](../ta/README.md) | [Телугу](../te/README.md) | [Тајландски](../th/README.md) | [Турски](../tr/README.md) | [Украјински](../uk/README.md) | [Урду](../ur/README.md) | [Вијетнамски](../vi/README.md)

> **Више волите да клонирате локално?**
>
> Овај репозиторијум садржи 50+ језичких превода који значајно повећавају величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
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
> Ово вам даје све што вам треба да завршите курс са знатно бржим преузимањем.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Шта је ново у azd данас

> 📌 Овај курс је верификован за **`azd 1.25.6`** (јун 2026). Покрените `azd version` да проверите своју верзију, и `azd upgrade` да добијете најновију.

Azure Developer CLI је израстао изван традиционалних веб апликација и API-ја. Данас је azd једини алат за деплој било које апликације у Azure — укључујући апликације са AI-погоњем и интелигентне агенте.

Ево шта то значи за вас:

- **AI агенти су сада првокласни azd радни задаци.** Можете иницијализовати, депловати и управљати AI агент пројектима користећи исти `azd init` → `azd up` радни ток који већ познајете.
- **Комплетан циклус живота агента из CLI-а.** `azure.ai.agents` екстензија сада покрива цео пут — `azd ai agent init` за скелет, `azd ai agent invoke` за тестирање (са излазом времена одговора), `azd ai agent eval generate` и `azd ai agent optimize` за мерење и побољшање квалитета, и `azd ai agent delete` за чишћење.
- **Више AI грађевних блокова.** Нове preview екстензије — `azure.ai.skills` и `azure.ai.connections` — омогућавају вам управљање поново употребљивим вештинама агената и Foundry конекцијама директно са azd.
- **Интеграција са Microsoft Foundry** доноси деплој модела, хостовање агената и конфигурацију AI сервиса директно у азд шаблоне.
- **Глаткија свакодневна основа.** Новија издања су учинила `azd init` идемпотентним (безбедно за поновно покретање), омогућила да `azd auth login` аутоматски очисти застареле токене и додала пријатељски `azd tool` prompt за прво покретање.
- **Основни радни ток се није променио.** Било да деплојујете todo апликацију, микросервис или мулти-агент AI решење, команде су исте.

> **Напомена за Aspire кориснике:** Microsoft сада производ назива једноставно **Aspire** (раније ".NET Aspire"). Подршка azd за Aspire је непромењена — само је име ажурирано.

Ако сте раније користили azd, подршка за AI је природно проширење — не посебан алат или напредни правац. Ако почињете од нуле, научићете један радни ток који ради за све.

---

## 🚀 Шта је Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** је кориснички пријатељски командно-линијски алат који поједностављује деплој апликација у Azure. Уместо ручног креирања и повезивања десетина Azure ресурса, можете депловати целе апликације са само једном командом.

### Магија `azd up`

```bash
# Ова једна команда ради све:
# ✅ Креира све Azure ресурсе
# ✅ Конфигурише мрежу и безбедност
# ✅ Креира ваш апликациони код
# ✅ Деплојује на Azure
# ✅ Даје вам функцијонишући URL
azd up
```

**То је то!** Није потребно кликање по Azure порталу, нема сложених ARM шаблона које прво морате научити, нема ручне конфигурације — само радне апликације на Azure.

---

## ❓ Azure Developer CLI против Azure CLI: Која је разлика?

Ово је најчешће питање које почетници постављају. Ево једноставног одговора:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Једноставна аналогија

- **Azure CLI** је као да имате све алате за изградњу куће — чекиће, тестере, ексере. Можете изградити било шта, али морате знати грађевину.
- **Azure Developer CLI** је као да ангажујете извођача — опишете шта желите, а они се брину о изградњи.

### Када користити који

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Раде заједно!

AZD користи Azure CLI испод хаубе. Можете користити оба:
```bash
# Деплојујте вашу апликацију помоћу AZD
azd up

# Затим детаљно подесите специфичне ресурсе помоћу Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Пронађите шаблоне у Awesome AZD

Не почињите од нуле! **Awesome AZD** је заједничка колекција шаблона спремних за деплој:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Прегледајте 200+ шаблона са једним кликом за деплој |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Допринесите својим шаблоном заједници |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Добавите звезду и истражите извор |

### Популарни AI шаблони из Awesome AZD

```bash
# РАГ ћаскање са Microsoft Foundry моделима + AI претрага
azd init --template azure-search-openai-demo

# Брза AI апликација за ћаскање
azd init --template openai-chat-app-quickstart

# AI агенти са Foundry агентима
azd init --template get-started-with-ai-agents
```

---

## 🎯 Почните у 3 корака

Пре него што почнете, уверите се да је ваша машина спремна за шаблон који желите да деплујете:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ако неки од захтеваних провера не прође, поправите то прво, па наставите са брзим стартом.

### Корак 1: Инсталирајте AZD (2 минута)

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

### Корак 2: Аутентификујте се за AZD

```bash
# Опционо ако планирате да користите Azure CLI команде директно у овом курсу
az login

# Потребно за AZD радне токове
azd auth login
```

Ако нисте сигурни који вам треба, пратите цео течај подешавања у [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Корак 3: Распоредите вашу прву апликацију

```bash
# Иницијализуј из шаблона
azd init --template todo-nodejs-mongo

# Деплојуј на Azure (поставља све!)
azd up
```

**🎉 То је то!** Ваша апликација је сада доступна на Azure.

### Чишћење (Не заборавите!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Како користити овај курс

Овај курс је дизајниран за **поступно учење** — почните тамо где се осећате комфорно и радите напред:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Поглавље 2: AI-прво развијање](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [Поглавље 8: Продукција & Предузећа](#-chapter-8-production--enterprise-patterns) |

### Брзо подешавање

1. **Направите форк овог репозиторијума**: [![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте га**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Затражите помоћ**: [Заједница Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Више волите да клонирате локално?**

> Овај репозиторијум садржи 50+ језичких превода који значајно повећавају величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ово вам даје све што вам треба да завршите курс са знатно бржим преузимањем.


## Преглед курса

Свладајте Azure Developer CLI (azd) кроз структуирана поглавља дизајнирана за поступно учење. **Посебан фокус на деплој AI апликација са интеграцијом Microsoft Foundry.**
### Зашто је овај курс важан за модерне програмере

На основу увида из Microsoft Foundry Discord заједнице, **45% програмера жели да користи AZD за AI радне оптерећења** али наилази на изазове са:
- Комплексним мулти-сервисним AI архитектурама
- Најбољим праксама за продукцијско распоређивање AI
- Интеграцијом и конфигурацијом Azure AI сервиса
- Оптимизацијом трошкова за AI радне оптерећења
- Решавањем проблема специфичних за AI распоређивање

### Циљеви учења

Завршетком овог структурираног курса, ви ћете:
- **Усвојите основе AZD**: Основни концепти, инсталација и конфигурација
- **Деплојујте AI апликације**: Користите AZD са Microsoft Foundry сервисима
- **Спроведите инфраструктуру као код**: Управљајте Azure ресурсима помоћу Bicep шаблона
- **Решавање проблема са деплојем**: Решавајте уобичајене проблеме и дебагујте
- **Оптимизујте за продукцију**: Безбедност, скалирање, мониторинг и управљање трошковима
- **Изградите мулти-агентска решења**: Деплојујте комплексне AI архитектуре

## Пре него што почнете: налози, приступ и претпоставке

Пре него што започнете Поглавље 1, уверите се да имате следеће. Кораци инсталације који следе у овом водичу претпостављају да су ове основе већ покривене.

- **Azure претплата**: Можете користити постојећу претплату са посла или свој лични налог, или креирати [free trial](https://aka.ms/azurefreetrial) да бисте почели.
- **Дозвола за креирање Azure ресурса**: За већину вежби требало би да имате најмање **Contributor** приступ на циљној претплати или групи ресурса. Нека поглавља могу такође претпоставити да можете креирати групе ресурса, управљане идентитете и RBAC доделе.
- [**GitHub налог**](https://github.com): Корисно је за форкање репозиторијума, праћење ваших промена и коришћење GitHub Codespaces за радионицу.
- **Преувети захтеви за покретање шаблона**: Неки шаблони захтевају локалне алате као што су Node.js, Python, Java или Docker. Покрените валидатор подешавања пре почетка да бисте рано уочили недостајуће алате.
- **Основно познавање терминала**: Не морате бити експерт, али требало би да се удобно осећате при покретању команди као што су `git clone`, `azd auth login`, и `azd up`.

> **Радите у ентерпрајз претплати?**
> Ако ваш Azure оквир управља администратор, потврдите унапред да можете деплојовати ресурсе у претплату или групу ресурса коју планирате да користите. Ако не, затражите sandbox претплату или Contributor приступ пре него што почнете.

> **Нов у Azure-у?**
> Почните са својом Azure trial или pay-as-you-go претплатом на https://aka.ms/azurefreetrial тако да можете завршити вежбе од почетка до краја без чекања на одобрења на нивоу тенанта.

## 🗺️ Мапа курса: Брза навигација по поглављима

Свако поглавље има посебан README са циљевима учења, брзим почецима и вежбама:

| Поглавље | Тема | Лекције | Трајање | Сложеност |
|---------|-------|---------|----------|------------|
| **[Гл 1: Основа](docs/chapter-01-foundation/README.md)** | Започињање | [AZD Основе](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталација и подешавање](docs/chapter-01-foundation/installation.md) &#124; [Први пројекат](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл 2: AI развој](docs/chapter-02-ai-development/README.md)** | AI-приоритене апликације | [Интеграција с Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Деплој модела](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Радни веžба](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 сати | ⭐⭐ |
| **[Гл 3: Конфигурација](docs/chapter-03-configuration/README.md)** | Аутентификација и безбедност | [Конфигурација](docs/chapter-03-configuration/configuration.md) &#124; [Аутх & Безбедност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и деплој | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 сати | ⭐⭐⭐ |
| **[Гл 5: Мулти-Агент](docs/chapter-05-multi-agent/README.md)** | AI агенска решења | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[Гл 6: Пре-деплоја](docs/chapter-06-pre-deployment/README.md)** | Планирање и валидација | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 сат | ⭐⭐ |
| **[Гл 7: Решавање проблема](docs/chapter-07-troubleshooting/README.md)** | Дебаговање и исправка | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 сати | ⭐⭐ |
| **[Гл 8: Продукција](docs/chapter-08-production/README.md)** | Ентерпрајз шаблони | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Практична радионица | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 сата | ⭐⭐ |

**Укупно трајање курса:** ~10-14 сати | **Напредак вештина:** Почетник → Спремно за продукцију

---

## 📚 Поглавља за учење

*Одаберите свој пут учења на основу нивоа искуства и циљева*

### 🚀 Поглавље 1: Основа и брзи почетак
**Претпоставке**: Azure претплата, основно познавање командне линије  
**Трајање**: 30-45 мин  
**Сложеност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталирање AZD на вашој платформи
- Ваш први успешан деплој

#### Ресурси за учење
- **🎯 Почните овде**: [Шта је Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теорија**: [AZD Основе](docs/chapter-01-foundation/azd-basics.md) - Основни концепти и терминологија
- **⚙️ Подешавање**: [Инсталација и подешавање](docs/chapter-01-foundation/installation.md) - Водичи специфични за платформу
- **🛠️ Практично**: [Први пројекат](docs/chapter-01-foundation/first-project.md) - Туторијал корак по корак
- **📋 Брзи референс**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Практичне вежбе
```bash
# Брза провера инсталације
azd version

# Разместите вашу прву апликацију
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат поглавља**: Успешно деплојујте једноставну веб апликацију на Azure користећи AZD

**✅ Валидација успеха:**
```bash
# Након завршетка Поглавља 1, требало би да будете у стању да:
azd version              # Приказује инсталирану верзију
azd init --template todo-nodejs-mongo  # Иницијализује пројекат
azd up                  # Распоређује на Azure
azd show                # Приказује URL покренуте апликације
# Апликација се отвара у прегледачу и ради
azd down --force --purge  # Ослобађа ресурсе
```

**📊 Уложено време:** 30-45 мин  
**📈 Ниво вештине након:** Може самостално деплојовати основне апликације
**📈 Ниво вештине након:** Може самостално деплојовати основне апликације

---

### 🤖 Поглавље 2: AI-први развој (Препоручено за AI програмере)
**Претпоставке**: Поглавље 1 завршено  
**Трајање**: 1-2 сата  
**Сложеност**: ⭐⭐

#### Шта ћете научити
- Интеграција Microsoft Foundry са AZD
- Деплој AI-погонских апликација
- Разумевање конфигурација AI сервиса

#### Ресурси за учење
- **🎯 Почните овде**: [Интеграција с Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Водич за AI агенте](docs/chapter-02-ai-development/agents.md) - Деплојујте интелигентне агенте са AZD
- **📖 Обрасци**: [Деплој модела](docs/chapter-02-ai-development/ai-model-deployment.md) - Деплојујте и управљајте AI моделима
- **🛠️ Радионица**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Припремите своја AI решења за AZD
- **🎥 Интерактивни водич**: [Workshop Materials](workshop/README.md) - Учење у прегледачу са MkDocs * DevContainer окружењем
- **📋 Шаблони**: [Microsoft Foundry Templates](#ресурси-радионице)
- **📝 Примери**: [AZD примери деплоја](examples/README.md)

#### Практичне вежбе
```bash
# Поставите вашу прву АИ апликацију
azd init --template azure-search-openai-demo
azd up

# Испробајте додатне АИ шаблоне
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат поглавља**: Деплојујте и конфигуришите AI-погонску chat апликацију са RAG могућностима

**✅ Валидација успеха:**
```bash
# Након другог поглавља, требало би да будете у стању да:
azd init --template azure-search-openai-demo
azd up
# Тестирати интерфејс за ћаскање са вештачком интелигенцијом
# Постављати питања и добијати одговоре које покреће вештачка интелигенција са изворима
# Проверити да интеграција претраге ради
azd monitor  # Проверити да Application Insights приказује телеметрију
azd down --force --purge
```

**📊 Уложено време:** 1-2 сата  
**📈 Ниво вештине након:** Може деплојовати и конфигурисати продукцијске AI апликације  
**💰 Свест о трошковима:** Разумети трошкове за развој $80-150/месец, продукцијске трошкове $300-3500/месец

#### 💰 Разматрања трошкова за AI деплојеве

**Развојно окружење (процењено $80-150/месечно):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/месец (на основу коришћења токена)
- AI Search (Basic tier): $75/месец
- Container Apps (Consumption): $0-20/месец
- Storage (Standard): $1-5/месец

**Продукцијско окружење (процењено $300-3,500+/месечно):**
- Microsoft Foundry Models (PTU за конзистентне перформансе): $3,000+/месец ИЛИ Pay-as-go при великом обиму
- AI Search (Standard tier): $250/месец
- Container Apps (Dedicated): $50-100/месец
- Application Insights: $5-50/месец
- Storage (Premium): $10-50/месец

**💡 Савети за оптимизацију трошкова:**
- Користите **Free Tier** Microsoft Foundry Models за учење (Azure OpenAI 50,000 токена/месечно укључено)
- Покрените `azd down` да деалокирате ресурсе када не развијате активно
- Почните са наплатом по потрошњи, унапредите на PTU само за продукцију
- Користите `azd provision --preview` да процените трошкове пре деплоја
- Омогућите ауто-скалирање: плаћајте само за стварну употребу

**Праћење трошкова:**
```bash
# Проверите процењене месечне трошкове
azd provision --preview

# Пратите стварне трошкове у Azure порталу
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Поглавље 3: Конфигурација и аутентификација
**Претпоставке**: Поглавље 1 завршено  
**Трајање**: 45-60 мин  
**Сложеност**: ⭐⭐

#### Шта ћете научити
- Конфигурација окружења и управљање
- Најбоље праксе за аутентификацију и безбедност
- Номенклатура и организација ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Конфигурациони водич](docs/chapter-03-configuration/configuration.md) - Подешавање окружења
- **🔐 Безбедност**: [Аутентификациони обрасци и управљани идентитети](docs/chapter-03-configuration/authsecurity.md) - Обрасци аутентификације
- **📝 Примери**: [Пример апликације са базом података](examples/database-app/README.md) - AZD примери за базу података

#### Практичне вежбе
- Конфигуришите више окружења (dev, staging, prod)
- Подесите аутентификацију помоћу управљаног идентитета
- Имплементирајте конфигурације специфичне за окружење

**💡 Резултат поглавља**: Управљајте вишеструким окружењима са правилном аутентификацијом и безбедношћу

---

### 🏗️ Поглавље 4: Инфраструктура као код и деплој
**Претпоставке**: Поглавља 1-3 завршена  
**Трајање**: 1-1.5 сати  
**Сложеност**: ⭐⭐⭐

#### Шта ћете научити
- Напредни обрасци деплоја
- Инфраструктура као код са Bicep-ом
- Стратегије провизионисања ресурса

#### Ресурси за учење
- **📖 Деплој**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Комплетни радни токови
- **🏗️ Провизионисање**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Container App Example](../../examples/container-app) - Деплојиранe апликације у контејнеру

#### Практичне вежбе
- Креирајте прилагођене Bicep шаблоне
- Деплојујте мулти-сервисне апликације
- Имплементирајте blue-green стратегије деплоја

**💡 Резултат поглавља**: Деплојујте комплексне мулти-сервисне апликације користећи прилагођене инфраструктурне шаблоне
### 🎯 Поглавље 5: Решења за више агената вештачке интелигенције (напредно)
**Предуслови**: Поглавља 1-2 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Шаблони мулти-агентске архитектуре
- Оркестрација и координација агената
- Продукциона размештања за вештачку интелигенцију

#### Ресурси за учење
- **🤖 Истакнути пројекат**: [Решење за малопродају са више агената](examples/retail-scenario.md) - Комплетна имплементација
- **🛠️ ARM шаблони**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Размештање једним кликом
- **📖 Архитектура**: [Шаблони координације више агената](docs/chapter-06-pre-deployment/coordination-patterns.md) - Шаблони

#### Практичне вежбе
```bash
# Распоредити потпуно решење за малопродају са више агената
cd examples/retail-multiagent-arm-template
./deploy.sh

# Истражите конфигурације агената
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Исход поглавља**: Распоредите и управљајте продукционим мулти-агентским решењем за вештачку интелигенцију са агентима за купце и залихе

---

### 🔍 Поглавље 6: Валидација и планирање пред размештање
**Предуслови**: Поглавље 4 завршено  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије избора SKU
- Провере пре покретања и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Избор**: [Избор SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Цена-ефикасне опције
- **✅ Валидација**: [Провере пре покретања](docs/chapter-06-pre-deployment/preflight-checks.md) - Аутоматизовани скрипти

#### Практичне вежбе
- Покрените скрипте за валидацију капацитета
- Оптимизујте изборе SKU ради смањења трошкова
- Имплементирајте аутоматизоване провере пре размештања

**💡 Исход поглавља**: Валидација и оптимизација размештања пре извршавања

---

### 🚨 Поглавље 7: Решавање проблема и отклањање грешака
**Предуслови**: Завршено било које поглавље о размештању  
**Трајање**: 1-1.5 сати  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематски приступи отклањању грешака
- Уобичајени проблеми и решења
- Решавање проблема специфичних за вештачку интелигенцију

#### Ресурси за учење
- **🔧 Уобичајени проблеми**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Често постављана питања и решења
- **🕵️ Отклањање грешака**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 Проблеми са AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI сервисни проблеми

#### Практичне вежбе
- Дијагностикујте пропусте у размештању
- Решите проблеме са аутентикацијом
- Отстраните проблеме са повезивошћу AI сервиса

**💡 Исход поглавља**: Самостално дијагностикујте и решавајте уобичајене проблеме при размештању

---

### 🏢 Поглавље 8: Производни и корпоративни шаблони
**Предуслови**: Поглавља 1-4 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије производног размештања
- Корпоративни шаблони безбедности
- Надзор и оптимизација трошкова

#### Ресурси за учење
- **🏭 Производња**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Корпоративни шаблони
- **📝 Примери**: [Microservices Example](../../examples/microservices) - Комплексне архитектуре
- **📊 Надзор**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Надзор

#### Практичне вежбе
- Имплементирајте корпоративне безбедносне шаблоне
- Подесите обухватан надзор
- Разместите у производно окружење уз одговарајуће управљање

**💡 Исход поглавља**: Разместите апликације спремне за предузећа са пуном производном функционалношћу

---

## 🎓 Преглед радионице: Практично искуство учења

> **⚠️ СТАЊЕ РАДИОНИЦЕ: Активни развој**  
> Материјали радионице се тренутно развијају и дорађују. Основни модули су функционални, али неки напредни делови нису завршени. Активно радимо на завршетку целог садржаја. [Пратите напредак →](workshop/README.md)

### Интерактивни материјали радионице
**Свеобухватно практично учење уз алате у претраживачу и вођене вежбе**

Наши материјали радионице пружају структуриран, интерактиван програм учења који допуњује горе наведени курикулум по поглављима. Радионица је дизајнирана за самостално учење и вођене сесије са инструктором.

#### 🛠️ Карактеристике радионице
- Интерфејс у претраживачу: Комплетна радионица заснована на MkDocs са претрагом, копирањем и темама
- Интеграција са GitHub Codespaces: Подешавање развојног окружења једним кликом
- Структурирани пут учења: вођене вежбе у 8 модула (укупно 3-4 сата)
- Прогресивна методологија: Увод → Избор → Валидација → Деконструкција → Конфигурација → Прилагођавање → Растављање → Закључак
- Интерактивно DevContainer окружење: Пред-конфигурисани алати и зависности

#### 📚 Структура модула радионице
Радионица прати прогресивну методологију у 8 модула која вас води од открића до савладавања размештања:

| Модул | Тема | Шта ћете радити | Трајање |
|--------|-------|----------------|----------|
| **0. Увод** | Преглед радионице | Разумети циљеве учења, предуслове, и структуру радионице | 15 мин |
| **1. Избор** | Откривање шаблона | Истражите AZD шаблоне и одаберите прави AI шаблон за ваш сценарио | 20 мин |
| **2. Валидација** | Размештање и провера | Разместите шаблон помоћу `azd up` и проверите да инфраструктура ради | 30 мин |
| **3. Деконструкција** | Разумевање структуре | Користите GitHub Copilot да истражите архитектуру шаблона, Bicep фајлове и организацију кода | 30 мин |
| **4. Конфигурација** | Детаљно о azure.yaml | Савладајте конфигурацију `azure.yaml`, lifecycle hooks и променљиве окружења | 30 мин |
| **5. Прилагођавање** | Прилагодите га себи | Омогућите AI Search, трасирање, евалуацију и прилагодите за ваш сценарио | 45 мин |
| **6. Растављање** | Чишћење | Безбедно уклоните ресурсе са `azd down --purge` | 15 мин |
| **7. Закључак** | Следећи кораци | Преглед достигнућа, кључних концепата и наставак вашег пута учења | 15 мин |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Како почети са радионицом
```bash
# Опција 1: GitHub Codespaces (Препоручено)
# Кликните на "Code" → "Create codespace on main" у репозиторијуму

# Опција 2: Локални развој
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Пратите упутства за подешавање у workshop/README.md
```

#### 🎯 Резултати учења радионице
Завршетком радионице, учесници ће:
- **Разместити продукционе AI апликације**: Користите AZD са Microsoft Foundry сервисима
- **Савладати мулти-агентске архитектуре**: Имплементирати координована решења AI агената
- **Имплементирати најбоље праксе за безбедност**: Конфигуришите аутентификацију и контролу приступа
- **Оптимизовати за скалабилност**: Дизајнирати економична и перформантна размештања
- **Решавати проблеме при размештању**: Самостално решавати уобичајене проблеме

#### 📖 Ресурси радионице
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Учење у претраживачу
- **📋 Инструкције по модулима**:
  - [0. Увод](workshop/docs/instructions/0-Introduction.md) - Преглед радионице и циљеви
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Пронађите и одаберите AI шаблоне
  - [2. Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) - Разместите и проверите шаблоне
  - [3. Деконструкција](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Истражите архитектуру шаблона
  - [4. Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) - Савладајте azure.yaml
  - [5. Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) - Прилагодите за ваш сценарио
  - [6. Растављање](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очишћавање и чишћење ресурса
  - [7. Закључак](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следећи кораци
- **🛠️ AI лабораторија радионице**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вежбе фокусиране на AI
- **💡 Брзи почетак**: [Упутство за подешавање радионице](workshop/README.md#quick-start) - Конфигурација окружења

**Идеално за**: Корпоративну обуку, универзитетске курсеве, самостално учење и програмерске bootcamp-ове.

---

## 📖 Дубински преглед: Могућности AZD

Иза основа, AZD нуди моћне функције за производна размештања:

- Размештања заснована на шаблонима - Користите унапред направљене шаблоне за уобичајене образце апликација
- Инфраструктура као код - Управљајте Azure ресурсима користећи Bicep или Terraform  
- Интегрисани токови рада - Непрекидна провизионисања, размештање и надзор апликација
- Прилагођено програмерима - Оптимизовано за продуктивност и искуство програмера

### **AZD + Microsoft Foundry: Идеално за AI размештања**

**Зашто AZD за AI решења?** AZD решава највеће изазове са којима се суочавају AI програмери:

- AI-спремни шаблони - Пред-конфигурисани шаблони за Microsoft Foundry моделе, Azure AI сервисе, и ML радна оптерећења
- Безбедна AI размештања - Уграђени безбедносни шаблони за AI сервисе, API кључеве и крајње тачке модела  
- Производни AI шаблони - Најбоље праксе за скалабилна, економична размештања AI апликација
- Крај-до-краја AI токови рада - Од развоја модела до производног размештања уз одговарајући надзор
- Оптимизација трошкова - Паметна додела ресурса и стратегије скалирања за AI радна оптерећења
- Интеграција са Microsoft Foundry - Непрекидна веза са каталогом модела и крајњим тачкама Microsoft Foundry-а

---

## 🎯 Библиотека шаблона и примера

### Истакнуто: Microsoft Foundry шаблони
**Почните овде ако размештате AI апликације!**

> **Напомена:** Ови шаблони демонстрирају различите AI шаблоне. Неки су спољашњи Azure Samples, други су локалне имплементације.

| Шаблон | Поглавље | Комплексност | Сервиси | Тип |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Спољашње |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Спољашње |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Спољашње |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Спољашње |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Спољашње |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Спољашње |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локално** |

### Истакнуто: Комплетни сценарији учења
**Шаблони апликација спремни за продукцију мапирани на поглавља за учење**

| Шаблон | Поглавље учења | Комплексност | Кључно учење |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни обрасци AI размештања |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | RAG имплементација са Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Поглавље 4 | ⭐⭐ | Интеграција Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Agent framework и function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Enterprise AI оркестрација |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Мулти-агентска архитектура са агентима за купце и залихе |

### Учење преко примера по типу

> **📌 Локални vs. Спољашњи примери:**  
> **Локални примери** (у овом репозиторијуму) = Спремни за одмах употребу  
> **Спољашњи примери** (Azure Samples) = Клонирајте из повезаних репозиторијума

#### Локални примери (спремни за употребу)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Комплетна продукциона имплементација спремна за употребу са ARM шаблонима
  - Мулти-агентска архитектура (агенти за купце + агенти за залихе)
  - Свеобухватан надзор и евалуација
  - Размештање једним кликом преко ARM шаблона

#### Локални примери - Контејнерске апликације (Поглавља 2-5)
**Свеобухватни примери размештања контејнера у овом репозиторијуму:**
- [**Примери Container App**](examples/container-app/README.md) - Комплетан водич за распореде у контејнерима
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Основни REST API са скалирањем до нуле
  - [Microservices Architecture](../../examples/container-app/microservices) - Производно-спреман мулти-сервисни распоред
  - Обрасци за брзи почетак, продукцију и напредно размештање
  - Упутства за надгледање, безбедност и оптимизацију трошкова

#### Спољни примери - Једноставне апликације (поглавља 1-2)
**Клонирајте ове Azure Samples репозиторијуме да започнете:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни обрасци распореда
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Размештање статичког садржаја
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Размештање REST API-ја

#### Спољни примери - Интеграција базе података (поглавља 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Обрасци за повезивање са базом података
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсерверски проток података

#### Спољни примери - Напредни обрасци (поглавља 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архитектуре са више сервиса
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Обраду у позадини  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Производно-спремни ML обрасци

### Спољне колекције шаблона
- [**Званична AZD галерија шаблона**](https://azure.github.io/awesome-azd/) - Курирана колекција званичних и заједничких шаблона
- [**Шаблони Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документација Microsoft Learn о шаблонима
- [**Examples Directory**](examples/README.md) - Локални примери за учење са детаљним објашњењима

---

## 📚 Ресурси за учење и референце

### Брзе референце
- [**Командна пречица**](resources/cheat-sheet.md) - Основне azd команде организоване по поглављима
- [**Глосар**](resources/glossary.md) - Терминологија Azure и azd  
- [**Често постављана питања (FAQ)**](resources/faq.md) - Уобичајена питања организована по поглављима
- [**Водич за учење**](resources/study-guide.md) - Свеобухватне вежбе за праксу

### Практичне радионице
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Учините да ваша AI решења могу да се размештају помоћу AZD-а (2-3 сата)
- [**Интерактивна радионица**](workshop/README.md) - 8-модулни вођени задаци са MkDocs и GitHub Codespaces
  - Прате: Увод → Избор → Валидација → Декомпозиција → Конфигурација → Прилагођавање → Уклањање → Завршетак

### Спољни ресурси за учење
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### AI вештине агента за ваш уређивач
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворених вештина агената за Azure AI, Foundry, распореде, дијагностику, оптимизацију трошкова и још. Инсталирајте их у GitHub Copilot, Cursor, Claude Code, или било који подржани агент:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Брзи водич за решавање проблема

**Уобичајени проблеми са којима се почетници сусрећу и тренутна решења:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Прво инсталирајте AZD
# Виндоус (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Линукс:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Проверите инсталацију
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Прикажи доступне претплате
az account list --output table

# Постави подразумевану претплату
az account set --subscription "<subscription-id-or-name>"

# Постави за AZD окружење
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Провери
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Пробајте другу Azure регију
azd env set AZURE_LOCATION "westus2"
azd up

# Или користите мање SKU-ове у развоју
# Уредите infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Опција 1: Очисти и покушај поново
azd down --force --purge
azd up

# Опција 2: Само исправи инфраструктуру
azd provision

# Опција 3: Провери детаљан статус
azd show

# Опција 4: Провери логове у Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Поново се аутентификујте за AZD
azd auth logout
azd auth login

# Опционално: освежите и Azure CLI ако покрећете az команде
az logout
az login

# Проверите аутентификацију
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD генерише јединствена имена, али у случају конфликта:
azd down --force --purge

# Затим поново покушај са свежим окружењем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Размештање шаблона траје предуго</strong></summary>

**Нормално време чекања:**
- Једноставна веб апликација: 5-10 минута
- Апликација са базом података: 10-15 минута
- AI апликације: 15-25 минута (обезбеђивање OpenAI-а је споро)

```bash
# Проверите напредак
azd show

# Ако сте заглављени више од 30 минута, проверите Azure портал:
azd monitor --overview
# Потражите неуспела распоређивања
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Проверите своју Azure улогу
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Потребна вам је најмање улога "Contributor"
# Замолите свог Azure админа да додели:
# - Contributor (за ресурсе)
# - User Access Administrator (за доделу улога)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Прикажи све крајње тачке сервиса
azd show

# Или отвори Azure портал
azd monitor

# Провери одређени сервис
azd env get-values
# Потражи *_URL променљиве
```
</details>

### 📚 Потпуни ресурси за решавање проблема

- **Водич за уобичајене проблеме:** [Детаљна решења](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми специфични за AI:** [Решавање AI проблема](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Водич за отклањање грешака:** [Корак по корак отклањање грешака](docs/chapter-07-troubleshooting/debugging.md)
- **Добијте помоћ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завршетак курса и сертификат

### Праћење напретка
Пратите свој напредак у учењу кроз свако поглавље:

- [ ] **Поглавље 1**: Основе и брзи почетак ✅
- [ ] **Поглавље 2**: Развој оријентисан на AI ✅  
- [ ] **Поглавље 3**: Конфигурација и аутентификација ✅
- [ ] **Поглавље 4**: Инфраструктура као код и размештање ✅
- [ ] **Поглавље 5**: Решења са више AI агената ✅
- [ ] **Поглавље 6**: Валидација и планирање пре размештања ✅
- [ ] **Поглавље 7**: Решавање проблема и отклањање грешака ✅
- [ ] **Поглавље 8**: Производне и корпоративне праксе ✅

### Верификација знања
Након завршетка сваког поглавља, верификујте своје знање тако што ћете:
1. **Практична вежба**: Завршите практично размештање из поглавља
2. **Провера знања**: Прегледајте одељак Често постављаних питања за ваше поглавље
3. **Заједничка дискусија**: Поделите своје искуство на Azure Discord
4. **Следеће поглавље**: Пређите на следећи ниво сложености

### Погодности по завршетку курса
Након што завршите сва поглавља, имаћете:
- **Искуство из производње**: Размештали сте стварне AI апликације на Azure
- **Професионалне вештине**: Способности за размештање у предузећима  
- **Препознавање у заједници**: Активан члан Azure развојне заједнице
- **Напредак у каријери**: Тражена експертиза у AZD и размештању AI

---

## 🤝 Заједница и подршка

### Добијте помоћ и подршку
- **Технички проблеми**: [Пријавите багове и захтевајте функције](https://github.com/microsoft/azd-for-beginners/issues)
- **Питања у вези учења**: [Microsoft Azure Discord заједница](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Пomoћ специфична за AI**: Придружите се [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документација**: [Званична документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Увид из Microsoft Foundry Discord заједнице

**Резултати недавне анкете са канала #Azure:**
- **45%** програмера жели да користи AZD за AI радна оптерећења
- **Највећи изазови**: Размештање више сервиса, управљање акредитивима, спремност за продукцију  
- **Највише захтевано**: Шаблони специфични за AI, водичи за решавање проблема, најбоље праксе

**Придружите се нашој заједници да:**
- Поделите своја AZD + AI искуства и добијете помоћ
- Приступите раним прегледима нових AI шаблона
- Допринесете најбољим праксама за распоређивање AI
- Утицате на будући развој функција за AI + AZD

### Допрнос курсу
Пожелимо доприносе! Молимо прочитајте наш [Contributing Guide](CONTRIBUTING.md) за детаље о:
- **Унапређења садржаја**: Побољшајте постојећа поглавља и примере
- **Нови примери**: Додајте сценарије и шаблоне из стварног света  
- **Превод**: Помозите у одржавању подршке за више језика
- **Извештаји о баговима**: Побољшајте тачност и јасноћу
- **Стандарди за заједницу**: Пратите наше смернице за инклузивну заједницу

---

## 📄 Информације о курсу

### Лиценца
Овој пројекат је лиценциран под MIT лиценцом - погледајте фајл [LICENSE](../../LICENSE) за детаље.

### Повезани Microsoft ресурси за учење

Наш тим производи и друге свеобухватне курсеве за учење:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j за почетнике](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js за почетнике](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain за почетнике](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD за почетнике](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI за почетнике](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP за почетнике](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents за почетнике](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Генеративни AI серијал
[![Генеративни AI за почетнике](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративна вештачка интелигенција (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно учење
[![Машинско учење за почетнике](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Наука о подацима за почетнике](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Вештачка интелигенција за почетнике](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кибербезбедност за почетнике](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб развој за почетнике](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Интернет ствари за почетнике](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR развој за почетнике](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot серија
[![Copilot за парно програмирање са ИИ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot авантура](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигација курса

**🚀 Спремни да почнете са учењем?**

**Почетници**: Почните са [Поглавље 1: Основе & Брзи почетак](#-chapter-1-foundation--quick-start)  
**Развијачи вештачке интелигенције**: Идите на [Поглавље 2: Развој вођен ИИ](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Искуствени програмери**: Почните са [Поглавље 3: Конфигурација & Аутентификација](#️-chapter-3-configuration--authentication)

**Следећи кораци**: [Почните Поглавље 1 - Основе AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->