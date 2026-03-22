# AZD For Beginners: A Structured Learning Journey

![AZD за почетнике](../../translated_images/sr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub пратиоци](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub звезде](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Дискорд](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Дискорд](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Аутоматизовани преводи (увек ажурни)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арапски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Бугарски](../bg/README.md) | [Бирмански (Мјанмар)](../my/README.md) | [Кинески (поједностављени)](../zh-CN/README.md) | [Кинески (традиционални, Хонг Конг)](../zh-HK/README.md) | [Кинески (традиционални, Макао)](../zh-MO/README.md) | [Кинески (традиционални, Тајван)](../zh-TW/README.md) | [Хрватски](../hr/README.md) | [Чешки](../cs/README.md) | [Дански](../da/README.md) | [Холандски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Француски](../fr/README.md) | [Немачки](../de/README.md) | [Грчки](../el/README.md) | [Хебрејски](../he/README.md) | [Хинди](../hi/README.md) | [Мађарски](../hu/README.md) | [Индонежански](../id/README.md) | [Италијански](../it/README.md) | [Јапански](../ja/README.md) | [Каннада](../kn/README.md) | [Корејски](../ko/README.md) | [Литвански](../lt/README.md) | [Малајски](../ms/README.md) | [Малајалам](../ml/README.md) | [Маратхи](../mr/README.md) | [Непалски](../ne/README.md) | [Нигеријски Пидгин](../pcm/README.md) | [Норвешки](../no/README.md) | [Персијски (фарси)](../fa/README.md) | [Пољски](../pl/README.md) | [Португалски (Бразил)](../pt-BR/README.md) | [Португалски (Португал)](../pt-PT/README.md) | [Пунџапски (Гурмукхи)](../pa/README.md) | [Румунски](../ro/README.md) | [Руски](../ru/README.md) | [Српски (ћирилица)](./README.md) | [Словачки](../sk/README.md) | [Словеначки](../sl/README.md) | [Шпански](../es/README.md) | [Свахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (Филипински)](../tl/README.md) | [Тамил](../ta/README.md) | [Телугу](../te/README.md) | [Тајландски](../th/README.md) | [Турски](../tr/README.md) | [Украјински](../uk/README.md) | [Урду](../ur/README.md) | [Вијетнамски](../vi/README.md)

> **Да ли више волите да клонирате локално?**
>
> Овај репозиторијум садржи преко 50 превода што знатно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
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
> Ово вам даје све што је потребно да завршите курс уз знатно брже преузимање.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Шта је ново у azd-у данас

Azure Developer CLI је израстао изван традиционалних веб апликација и API-ја. Данас је azd једини алат за размештање било које апликације у Azure—укључујући апликације са могућностима вештачке интелигенције и интелигентне агенте.

Ево шта то значи за вас:

- **AI агенти су сада приоритетни azd радни задаци.** Можете иницијализовати, распоредити и управљати AI agent пројектима користећи исти `azd init` → `azd up` радни ток који већ познајете.
- **Интеграција са Microsoft Foundry** доноси размештање модела, хостинг агената и конфигурацију AI сервиса директно у azd екосистем шаблона.
- **Основни радни ток се није променио.** Без обзира да ли распоређујете todo апликацију, микросервис или мулти-агент AI решење, команде су исте.

Ако сте раније користили azd, подршка за AI је природно проширења—а не засебан алат или напредни правац. Ако почињете од нуле, научићете један радни ток који ради за све.

---

## 🚀 Шта је Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** је кориснички пријатељски алат командне линије који олакшава размењивање апликација у Azure. Уместо ручног креирања и повезивања десетина Azure ресурса, можете распоредити целе апликације једном командом.

### Магија `azd up`

```bash
# Ова појединачна команда ради све:
# ✅ Креира све Azure ресурсе
# ✅ Конфигурише мрежу и безбедност
# ✅ Прави ваш апликациони код
# ✅ Деплојује на Azure
# ✅ Даје вам радни URL
azd up
```

**То је то!** Нема кликања по Azure порталу, нема сложених ARM шаблона које треба прво научити, нема ручне конфигурације - само функционишуће апликације на Azure-у.

---

## ❓ Azure Developer CLI vs Azure CLI: Која је разлика?

Ово је најчешће питање које почетници постављају. Ево једноставног одговора:

| Функција | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Намена** | Manage individual Azure resources | Deploy complete applications |
| **Начин размишљања** | Infrastructure-focused | Application-focused |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крива учења** | Must know Azure services | Just know your app |
| **Најпогодније за** | DevOps, Infrastructure | Developers, Prototyping |

### Једноставна аналогија

- **Azure CLI** је као да имате све алате за градњу куће - чекиће, тестере, ексере. Можете изградити било шта, али морате знати грађевинарство.
- **Azure Developer CLI** је као да ангажујете извођача радова - опишете шта желите, а они се баве изградњом.

### Када користити који

| Сценарио | Користите ово |
|----------|----------|
| "Желим брзо да распоредим моју веб апликацију" | `azd up` |
| "Треба ми само да креирам storage account" | `az storage account create` |
| "Градим потпуну AI апликацију" | `azd init --template azure-search-openai-demo` |
| "Треба ми да дебагујем конкретан Azure ресурс" | `az resource show` |
| "Желим продукционо спремно размењивање за неколико минута" | `azd up --environment production` |

### Раде заједно!

AZD користи Azure CLI под хаубом. Можете користити оба:
```bash
# Деплојујте своју апликацију помоћу AZD
azd up

# Онда фино подесите одређене ресурсе уз помоћ Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Пронађите шаблоне у Awesome AZD

Не почињите од нуле! **Awesome AZD** је заједничка колекција шаблона спремних за размењивање:

| Ресурс | Опис |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Прегледајте преко 200 шаблона са једним кликом за размењивање |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Допринесите својим шаблоном заједници |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Дајте звезду и истражите изворни код |

### Популарни AI шаблони из Awesome AZD

```bash
# RAG ћаскање са Microsoft Foundry моделима + AI претрага
azd init --template azure-search-openai-demo

# Брза AI апликација за ћаскање
azd init --template openai-chat-app-quickstart

# AI агенти са Foundry агентима
azd init --template get-started-with-ai-agents
```

---

## 🎯 Почетак у 3 корака

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

### Корак 2: Пријавите се у Azure

```bash
azd auth login
```

### Корак 3: Распоредите вашу прву апликацију

```bash
# Иницијализуј из шаблона
azd init --template todo-nodejs-mongo

# Рутирај на Azure (прави све!)
azd up
```

**🎉 То је то!** Ваша апликација је сада доступна на Azure-у.

### Чишћење (не заборавите!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Како користити овај курс

Овај курс је дизајниран за **постепено учење** - почните где вам је комотно и напредујте:

| Ваше искуство | Почните овде |
|-----------------|------------|
| **Сасвим нови у Azure-у** | [Поглавље 1: Основе](#-chapter-1-foundation--quick-start) |
| **Познате Azure, нови у AZD** | [Поглавље 1: Основе](#-chapter-1-foundation--quick-start) |
| **Желите да деплојујете AI апликације** | [Поглавље 2: AI-приоритетни развој](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Желите практичну вежбу** | [🎓 Интерактивна радионица](workshop/README.md) - вођена лабораторија 3-4 сата |
| **Потребни производни обрасци** | [Поглавље 8: Производња & Предузеће](#-chapter-8-production--enterprise-patterns) |

### Брзо подешавање

1. **Направите форк овог репозиторијума**: [![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте га**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Потражите помоћ**: [Azure Discord заједница](https://discord.com/invite/ByRwuEEgH4)

> **Да ли више волите да клонирате локално?**
>
> Овај репозиторијум садржи преко 50 превода што знатно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ово вам даје све што је потребно да завршите курс уз знатно брже преузимање.


## Преглед курса

Свладајте Azure Developer CLI (azd) кроз структурисана поглавља дизајнирана за поступно учење. **Посебан фокус на размењивање AI апликација са интеграцијом Microsoft Foundry.**

### Зашто је овај курс важан за модерне програмере

На основу увида из Microsoft Foundry Discord заједнице, **45% програмера жели да користи AZD за AI радне задатке** али се сусреће са изазовима као што су:
- Комплексне мулти-сервисне AI архитектуре
- Најбоље праксе за продукционо размењивање AI-а  
- Интеграција и конфигурација Azure AI сервиса
- Оптимизација трошкова за AI радне задатке
- Решавање проблема специфичних за размењивање AI-а

### Циљеви учења

Завршавањем овог структурисаног курса, ви ћете:
- **Свладати AZD основе**: Основни концепти, инсталација и конфигурација
- **Распоредити AI апликације**: Користите AZD са Microsoft Foundry сервисима
- **Имплементирати Infrastructure as Code**: Управљајте Azure ресурсима помоћу Bicep шаблона
- **Решавати проблеме размењивања**: Решавање уобичајених проблема и дебаговање
- **Оптимизовати за продукцију**: Безбедност, скалабилност, мониторинг и управљање трошковима
- **Изградити мулти-агентска решења**: Распоредите комплексне AI архитектуре

## 🗺️ Мапа курса: Брза навигација по поглављима

Свако поглавље има посебан README са циљевима учења, брзим почецима и вежбама:

| Поглавље | Тема | Лекције | Трајање | Комплексност |
|---------|-------|---------|----------|------------|
| **[Погл. 1: Основе](docs/chapter-01-foundation/README.md)** | Почетак | [Основе AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталација](docs/chapter-01-foundation/installation.md) &#124; [Први пројекат](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Поглавље 2: AI развој](docs/chapter-02-ai-development/README.md)** | AI-оријентисане апликације | [Интеграција Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Распоређивање модела](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Радионица](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 сата | ⭐⭐ |
| **[Поглавље 3: Конфигурација](docs/chapter-03-configuration/README.md)** | Аутентикација и безбедност | [Водич за конфигурацију](docs/chapter-03-configuration/configuration.md) &#124; [Аутентикација и безбедност](docs/chapter-03-configuration/authsecurity.md) | 45-60 минута | ⭐⭐ |
| **[Поглавље 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и распоређивање | [Водич за распоређивање](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провизионисање](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 сата | ⭐⭐⭐ |
| **[Поглавље 5: Мулти-агент](docs/chapter-05-multi-agent/README.md)** | AI решења са више агената | [Сценариј за малопродају](examples/retail-scenario.md) &#124; [Обрасци координације](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[Поглавље 6: Пред-распоређивање](docs/chapter-06-pre-deployment/README.md)** | Планирање и валидација | [Провере пре распоређивања](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор SKU-а](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 сат | ⭐⭐ |
| **[Поглавље 7: Решавање проблема](docs/chapter-07-troubleshooting/README.md)** | Дебаг и исправка | [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Дебаговање](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 сата | ⭐⭐ |
| **[Поглавље 8: Продукција](docs/chapter-08-production/README.md)** | Ентерпрајз обрасци | [Практике за продукцију](docs/chapter-08-production/production-ai-practices.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[🎓 Радионица](workshop/README.md)** | Практична лабораторија | [Увод](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкција](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Рушење инфраструктуре](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Завршетак](workshop/docs/instructions/7-Wrap-up.md) | 3-4 сата | ⭐⭐ |

**Укупно трајање курса:** ~10-14 сати | **Напредак вештине:** Почетник → Спремно за продукцију

---

## 📚 Поглавља за учење

*Одаберите свој пут учења на основу нивоа искуства и циљева*

### 🚀 Поглавље 1: Основе и брзи почетак
**Преуслови**: Azure претплата, основно познавање командне линије  
**Трајање**: 30-45 минута  
**Комплексност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталирање AZD на вашој платформи
- Ваше прво успешно распоређивање

#### Ресурси за учење
- **🎯 Почните овде**: [Шта је Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теорија**: [Основе AZD](docs/chapter-01-foundation/azd-basics.md) - Основни концепти и терминологија
- **⚙️ Постављање**: [Инсталација & Подешавање](docs/chapter-01-foundation/installation.md) - Упутства специфична за платформу
- **🛠️ Практично**: [Ваш први пројекат](docs/chapter-01-foundation/first-project.md) - Туторијал корак по корак
- **📋 Брза референца**: [Сажетак команди](resources/cheat-sheet.md)

#### Практичне вежбе
```bash
# Брза провера инсталације
azd version

# Поставите вашу прву апликацију
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат поглавља**: Успешно распоредити једноставну веб апликацију на Azure користећи AZD

**✅ Валидација успеха:**
```bash
# Након завршетка Поглавља 1, требало би да будете у стању да:
azd version              # Приказује инсталирану верзију
azd init --template todo-nodejs-mongo  # Иницијализује пројекат
azd up                  # Распоређује на Azure
azd show                # Приказује URL покренуте апликације
# Апликација се отвара у прегледачу и функционише
azd down --force --purge  # Чисти ресурсе
```

**📊 Улагање времена:** 30-45 минута  
**📈 Ниво вештина након:** Може независно распоредити основне апликације
**📈 Ниво вештина након:** Може независно распоредити основне апликације

---

### 🤖 Поглавље 2: Развој усмерен на AI (Препоручено за AI програмере)
**Преуслови**: Поглавље 1 завршено  
**Трајање**: 1-2 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Интеграција Microsoft Foundry са AZD
- Распоређивање апликација покретаних вештачком интелигенцијом
- Разумевање конфигурација AI сервиса

#### Ресурси за учење
- **🎯 Почните овде**: [Интеграција Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Водич за AI агенте](docs/chapter-02-ai-development/agents.md) - Распоредите интелигентне агенте помоћу AZD
- **📖 Обрасци**: [Распоређивање AI модела](docs/chapter-02-ai-development/ai-model-deployment.md) - Распоредите и управљајте AI моделима
- **🛠️ Радионица**: [AI радионица](docs/chapter-02-ai-development/ai-workshop-lab.md) - Припремите своја AI решења за AZD
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Учeње у прегледачу са MkDocs * DevContainer окружењем
- **📋 Шаблони**: [Microsoft Foundry шаблони](#ресурси-радионице)
- **📝 Примери**: [Примери AZD распоређивања](examples/README.md)

#### Практичне вежбе
```bash
# Поставите своју прву AI апликацију
azd init --template azure-search-openai-demo
azd up

# Испробајте додатне AI шаблоне
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат поглавља**: Распоредите и конфигуришите ћаскање апликације покретане AI-јем са RAG могућностима

**✅ Валидација успеха:**
```bash
# Након Поглавља 2, требало би да будете у стању да:
azd init --template azure-search-openai-demo
azd up
# Тестирати интерфејс за ћаскање са вештачком интелигенцијом
# Постављати питања и добијати одговоре подржане вештачком интелигенцијом са изворима
# Проверити да интеграција претраге функционише
azd monitor  # Проверити да Application Insights приказује телеметрију
azd down --force --purge
```

**📊 Улагање времена:** 1-2 сата  
**📈 Ниво вештина након:** Може распоредити и конфигурисати AI апликације спремне за продукцију  
**💰 Свест о трошковима:** Разумети развојне трошкове $80-150/месечно, производне трошкове $300-3500/месечно

#### 💰 Разматрања трошкова за AI распоређивања

**Развојно окружење (Процењено $80-150/месечно):**
- Microsoft Foundry модели (плаћање по потрошњи): $0-50/месечно (на основу коришћења токена)
- AI Search (основни ниво): $75/месечно
- Container Apps (потрошња): $0-20/месечно
- Складиште (стандард): $1-5/месечно

**Производно окружење (Процењено $300-3,500+/месечно):**
- Microsoft Foundry модели (PTU за конзистентне перформансе): $3,000+/месечно ИЛИ плаћање по потрошњи при великом обиму
- AI Search (стандардни ниво): $250/месечно
- Container Apps (посвећено): $50-100/месечно
- Application Insights: $5-50/месечно
- Складиште (премиум): $10-50/месечно

**💡 Савети за оптимизацију трошкова:**
- Користите **Free Tier** Microsoft Foundry моделе за учење (Azure OpenAI укључује 50,000 токена/месечно)
- Покрените `azd down` да ослободите ресурсе када не развијате активно
- Почните са факурисањем по потрошњи, надоградите на PTU само за продукцију
- Користите `azd provision --preview` да процените трошкове пре распоређивања
- Омогућите аутоматско скалирање: плаћајте само за стварну употребу

**Праћење трошкова:**
```bash
# Проверите процењене месечне трошкове
azd provision --preview

# Пратите стварне трошкове у Azure порталу
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Поглавље 3: Конфигурација и аутентификација
**Преуслови**: Поглавље 1 завршено  
**Трајање**: 45-60 минута  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Конфигурација и управљање окружењем
- Најбоље праксе за аутентификацију и безбедност
- Именовање и организација ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Водич за конфигурацију](docs/chapter-03-configuration/configuration.md) - Постављање окружења
- **🔐 Безбедност**: [Обрасци аутентификације и управљани идентитет](docs/chapter-03-configuration/authsecurity.md) - Обрасци аутентификације
- **📝 Примери**: [Пример базе података](examples/database-app/README.md) - AZD примери база података

#### Практичне вежбе
- Конфигуришите више окружења (dev, staging, prod)
- Подесите аутентификацију управљаног идентитета
- Имплементирајте конфигурације специфичне за окружење

**💡 Резултат поглавља**: Управљајте више окружења са правилном аутентикацијом и безбедношћу

---

### 🏗️ Поглавље 4: Инфраструктура као код и распоређивање
**Преуслови**: Поглавља 1-3 завршена  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐⭐

#### Шта ћете научити
- Напредни обрасци распоређивања
- Инфраструктура као код уз Bicep
- Стратегије провизионисања ресурса

#### Ресурси за учење
- **📖 Распоређивање**: [Водич за распоређивање](docs/chapter-04-infrastructure/deployment-guide.md) - Комплетни токови рада
- **🏗️ Провизионисање**: [Провизионисање ресурса](docs/chapter-04-infrastructure/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Пример Container апликације](../../examples/container-app) - Распоређивања у контејнерима

#### Практичне вежбе
- Направите прилагођене Bicep шаблоне
- Распоредите апликације са више сервиса
- Имплементирајте стратегије blue-green распоређивања

**💡 Резултат поглавља**: Распоредите сложене апликације са више сервиса користећи прилагођене инфраструктурне шаблоне

---

### 🎯 Поглавље 5: AI решења са више агената (Напредно)
**Преуслови**: Поглавља 1-2 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Обрасци архитектуре више агената
- Оркестрација и координација агената
- Распоређивања AI спремна за продукцију

#### Ресурси за учење
- **🤖 Истакнути пројекат**: [Решење за малопродају са више агената](examples/retail-scenario.md) - Комплетна имплементација
- **🛠️ ARM шаблони**: [Пакет ARM шаблона](../../examples/retail-multiagent-arm-template) - Једнокликово распоређивање
- **📖 Архитектура**: [Обрасци координације више агената](docs/chapter-06-pre-deployment/coordination-patterns.md) - Обрасци

#### Практичне вежбе
```bash
# Разместите потпуно мултиагентско решење за малопродају
cd examples/retail-multiagent-arm-template
./deploy.sh

# Истражите конфигурације агената
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат поглавља**: Распоредите и управљајте AI решењем спремним за продукцију са агентима за купце и инвентар

---

### 🔍 Поглавље 6: Валидација и планирање пре распоређивања
**Преуслови**: Поглавље 4 завршено  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије избора SKU-а
- Провере пре распоређивања и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Избор**: [Избор SKU-а](docs/chapter-06-pre-deployment/sku-selection.md) - Опције пријатељске за трошкове
- **✅ Валидација**: [Провере пре распоређивања](docs/chapter-06-pre-deployment/preflight-checks.md) - Аутоматизовани скрипти

#### Практичне вежбе
- Покрените скрипте за валидацију капацитета
- Оптимизујте избор SKU за трошкове
- Имплементирајте аутоматизоване провере пре распоређивања

**💡 Резултат поглавља**: Потврдите и оптимизујте распоређивања пре извршења

---

### 🚨 Поглавље 7: Решавање проблема и дебаговање
**Преуслови**: Било које поглавље о распоређивању завршено  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематски приступи дебаговању
- Уобичајени проблеми и решења
- Решавање проблема специфичних за AI

#### Ресурси за учење
- **🔧 Уобичајени проблеми**: [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) - Често постављана питања и решења
- **🕵️ Дебаговање**: [Водич за дебаговање](docs/chapter-07-troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 AI проблеми**: [Решавање проблема специфичних за AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми AI сервиса

#### Практичне вежбе
- Дијагностикујте неуспехе распоређивања
- Решите проблеме са аутентификацијом
- Дебагујте повезивање AI сервиса

**💡 Резултат поглавља**: Независно дијагностиковати и решити уобичајене проблеме при распоређивању

---

### 🏢 Поглавље 8: Продукција и ентерпрајз обрасци
**Преуслови**: Поглавља 1-4 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије продукционог распоређивања
- Ентерпрајз обрасци безбедности
- Мониторинг и оптимизација трошкова

#### Ресурси за учење
- **🏭 Производња**: [Најбоље праксе за производни AI](docs/chapter-08-production/production-ai-practices.md) - Предузећни обрасци
- **📝 Примери**: [Пример микросервиса](../../examples/microservices) - Комплексне архитектуре
- **📊 Мониторинг**: [Интеграција Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Надзор

#### Практичне вежбе
- Имплементирајте предузећне безбедносне обрасце
- Поставите свеобухватни мониторинг
- Распоредите у производно окружење уз правилну управу

**💡 Резултат поглавља**: Деплојирајте апликације спремне за предузећа са пуном производном функционалношћу

---

## 🎓 Преглед радионице: Практично искуство учења

> **⚠️ СТАТУС РАДИОНИЦЕ: У активном развоју**  
> Материјали радионице тренутно се развијају и унапређују. Основни модули су функционални, али неки напредни делови нису завршени. Активно радимо на довршавању целог садржаја. [Пратите напредак →](workshop/README.md)

### Интерактивни материјали радионице
**Свеобухватно практично учење уз алате у прегледачу и вођене вежбе**

Наши материјали радионице пружају структуриран, интерактиван процес учења који допуњује програм заснован на поглављима изнад. Радионица је дизајнирана и за самостално учење и за сесије под вођством инструкторa.

#### 🛠️ Карактеристике радионице
- **Интерфејс у прегледачу**: Комплетна радионица покренута на MkDocs са претрагом, копирањем и опцијама тема
- **Интеграција са GitHub Codespaces**: Подешавање развојног окружења једним кликом
- **Структурисан пут учења**: Вођене вежбе у 8 модула (укупно 3-4 сата)
- **Прогресивна методологија**: Увод → Избор → Валидација → Разлагање → Конфигурација → Прилагођавање → Чишћење → Завршетак
- **Интерактивно DevContainer окружење**: Предконфигурисани алати и зависности

#### 📚 Структура модула радионице
Радионица прати прогресивну методологију од 8 модула која вас води од откривања до мајсторства у деплоју:

| Модул | Тема | Шта ћете радити | Трајање |
|--------|-------|----------------|----------|
| **0. Увод** | Преглед радионице | Разумети циљеве учења, предуслове и структуру радионице | 15 мин |
| **1. Избор** | Откривање шаблона | Истражите AZD шаблоне и одаберите прави AI шаблон за ваш сценарио | 20 мин |
| **2. Валидација** | Деплој и провера | Деплојујте шаблон са `azd up` и потврдите да инфраструктура ради | 30 мин |
| **3. Разлагање** | Разумевање структуре | Користите GitHub Copilot да истражите архитектуру шаблона, Bicep фајлове и организацију кода | 30 мин |
| **4. Конфигурација** | Дубинска анализа azure.yaml | Усавршите конфигурацију `azure.yaml`, hook-ове животног циклуса и променљиве окружења | 30 мин |
| **5. Прилагођавање** | Прилагодите га | Омогућите AI Search, трасирање, евалуацију и прилагодите за ваш сценарио | 45 мин |
| **6. Чишћење** | Чишћење | Безбедно уклоните ресурсе помоћу `azd down --purge` | 15 мин |
| **7. Завршетак** | Следећи кораци | Прегледајте постигнућа, кључне концепте, и наставите своје путовање учења | 15 мин |

**Ток радионице:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Започињање радионице
```bash
# Опција 1: GitHub Codespaces (Препоручено)
# Кликните "Code" → "Create codespace on main" у репозиторијуму

# Опција 2: Локални развој
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Пратите упутства за подешавање у workshop/README.md
```

#### 🎯 Резултати учења радионице
Завршетком радионице, учесници ће:
- **Деплојирати производне AI апликације**: Користите AZD са Microsoft Foundry сервисима
- **Овладати архитектурама са више агената**: Имплементирати координирана AI агенска решења
- **Имплементирати најбоље праксе за безбедност**: Конфигуришите аутентификацију и контролу приступа
- **Оптимизовати за скалабилност**: Дизајнирати економична и перформантна распоређивања
- **Решавање проблема при деплоју**: Решавајте уобичајене проблеме самостално

#### 📖 Ресурси радионице
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Учебно окружење у прегледачу
- **📋 Инструкције по модулу**:
  - [0. Увод](workshop/docs/instructions/0-Introduction.md) - Преглед радионице и циљеви
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Пронађите и одаберите AI шаблоне
  - [2. Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) - Деплојујте и проверите шаблоне
  - [3. Разлагање](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Истражите архитектуру шаблона
  - [4. Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) - Усавршите `azure.yaml`
  - [5. Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) - Прилагодите за ваш сценарио
  - [6. Чишћење](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Уклоните ресурсе
  - [7. Завршетак](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следећи кораци
- **🛠️ AI лабораторија радионице**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вежбе фокусиране на AI
- **💡 Брзи почетак**: [Водич за подешавање радионице](workshop/README.md#quick-start) - Подешавање окружења

**Погодно за**: Корпоративну обуку, универзитетске курсеве, самостално учење и програме обуке за програмере.

---

## 📖 Дубински преглед: Могућности AZD

Поред основног, AZD пружа моћне могућности за распоређивање у производњу:

- **Распоређивања на основу шаблона** - Користите унапред припремљене шаблоне за уобичајене обрасце апликација
- **Инфраструктура као код** - Управљајте Azure ресурсима користећи Bicep или Terraform  
- **Интегрисани токови рада** - Глатко провизионирате, распоређујете и надгледате апликације
- **Прилагођено програмерима** - Оптимизовано за продуктивност програмера и корисничко искуство

### **AZD + Microsoft Foundry: Идеално за AI распоређивања**

**Зашто AZD за AI решења?** AZD решава главне изазове са којима се суочавају AI програмери:

- **AI-спремни шаблони** - Предконфигурисани шаблони за Microsoft Foundry моделе, Cognitive Services и ML радна оптерећења
- **Сигурна AI распоређивања** - Уграђени безбедносни обрасци за AI сервисе, API кључеве и ендпоинте  
- **Производни AI обрасци** - Најбоље праксе за скалабилна, економична распоређивања AI апликација
- **Комплетни AI токови рада** - Од развоја модела до распоређивања у производњу са одговарајућим надзором
- **Оптимизација трошкова** - Паметна алокација ресурса и стратегије скалирања за AI радна оптерећења
- **Интеграција са Microsoft Foundry** - Глатка веза са каталогом модела Microsoft Foundry и ендпоинтима

---

## 🎯 Библиотека шаблона и примера

### Истакнути: Microsoft Foundry шаблони
**Почните овде ако распоређујете AI апликације!**

> **Напомена:** Ови шаблони демонстрирају различите AI обрасце. Неки су спољни Azure Samples, други су локалне имплементације.

| Шаблон | Поглавље | Сложеност | Сервиси | Тип |
|----------|---------|------------|----------|------|
| [**Започните са AI четом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Спољни |
| [**Започните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Спољни |
| [**Azure Search + OpenAI демо**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Спољни |
| [**OpenAI Chat App - Брзи почетак**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Спољни |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Спољни |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Спољни |
| [**Решење за малопродају са више агената**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локално** |

### Истакнути: Потпуни сценарији учења
**Шаблони апликација спремних за производњу мапирани на поглавља учења**

| Шаблон | Поглавље учења | Сложеност | Кључно учење |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни обрасци за распоређивање AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | Имплементација RAG помоћу Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Поглавље 4 | ⭐⭐ | Интеграција Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Agent framework и function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Оркестрација Enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Архитектура са више агената уз агенте за клијенте и залихе |

### Учити по типу примера

> **📌 Локални против спољних примера:**  
> **Локални примери** (у овом репозиторијуму) = Спремни за употребу одмах  
> **Спољни примери** (Azure Samples) = Клонирајте из повезаних репозиторијума

#### Локални примери (спремни за коришћење)
- [**Решење за малопродају са више агената**](examples/retail-scenario.md) - Комплетна имплементација спремна за производњу са ARM шаблонима
  - Архитектура са више агената (Агенти за клијенте + залихе)
  - Свеобухватно праћење и евалуација
  - Једнокликовско распоређивање преко ARM шаблона

#### Локални примери - Контејнерске апликације (Поглавља 2-5)
**Свеобухватни примери распоређивања контејнера у овом репозиторијуму:**
- [**Примери Container App**](examples/container-app/README.md) - Целокупан водич за распоређивање у контејнерима
  - [Једноставан Flask API](../../examples/container-app/simple-flask-api) - Основни REST API са скалирањем на нулу
  - [Архитектура микросервиса](../../examples/container-app/microservices) - Производно спремно мулти-сервис распоређивање
  - Брзи почетак, производња и напредни обрасци распоређивања
  - Упутства за мониторинг, безбедност и оптимизацију трошкова

#### Спољни примери - Једноставне апликације (Поглавља 1-2)
**Клонирајте ове Azure Samples репозиторијуме да започнете:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни обрасци распоређивања
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Распоређивање статичког садржаја
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Распоређивање REST API

#### Спољни примери - Интеграција базе података (Поглавља 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Обрасци повезивања базе података
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless радни ток података

#### Спољни примери - Напредни обрасци (Поглавља 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Мулти-сервисне архитектуре
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Обрада у позадини  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Производно спремни ML обрасци

### Колекције спољних шаблона
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Курирана колекција званичних и заједничких шаблона
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn документација о шаблонима
- [**Examples Directory**](examples/README.md) - Локални примери учења са детаљним објашњењима

---

## 📚 Ресурси за учење и референце

### Кратке референце
- [**Листа команди**](resources/cheat-sheet.md) - Основне azd команде организоване по поглављима
- [**Речник**](resources/glossary.md) - Термини Azure и azd  
- [**Често постављана питања**](resources/faq.md) - Честа питања организована по поглављима учења
- [**Водич за студирање**](resources/study-guide.md) - Свеобухватне вежбе

### Практичне радионице
- [**AI лабораторија радионице**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Учините да ваша AI решења буду распоредива помоћу AZD (2-3 сата)
- [**Интерактивна радионица**](workshop/README.md) - Вођене вежбе у 8 модула са MkDocs и GitHub Codespaces
  - Прати: Увод → Избор → Валидација → Разлагање → Конфигурација → Прилагођавање → Чишћење → Завршетак

### Спољни ресурси за учење
- [Документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центар за Azure архитектуру](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калкулатор цена Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Вештине AI агената за ваш уређивач
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворених вештина агената за Azure AI, Foundry, деплојмент, дијагностику, оптимизацију трошкова и још више. Инсталирајте их у GitHub Copilot, Cursor, Claude Code, или било који подржани агент:
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
# Виндоус (ПоверШел):
winget install microsoft.azd

# макОС:
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

# Или користите мање SKU-ове у развојном окружењу
# Измените infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Опција 1: Очисти и поново покушај
azd down --force --purge
azd up

# Опција 2: Само поправи инфраструктуру
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
# Аутентификујте се поново
az logout
az login

azd auth logout
azd auth login

# Проверите аутентификацију
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD генерише јединствена имена, али ако дође до конфликта:
azd down --force --purge

# Онда покушајте поново са новим окружењем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Распоређивање шаблона траје предуго</strong></summary>

**Нормално време чекања:**
- Једноставна веб апликација: 5-10 минута
- Апликација са базом података: 10-15 минута
- AI апликације: 15-25 минута (OpenAI provisioning is slow)

```bash
# Проверите напредак
azd show

# Ако сте заглављени више од 30 минута, проверите Azure портал:
azd monitor
# Потражите неуспеле деплојменте
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Проверите вашу Azure улогу
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Потребна вам је најмање улога „Contributor”
# Замолите Azure администратора да додели:
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
- **Проблеми специфични за AI:** [Решавање проблема са AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Водич за дебаговање:** [Дебаговање корак по корак](docs/chapter-07-troubleshooting/debugging.md)
- **Добијте помоћ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завршетак курса и сертификација

### Праћење напретка
Пратите свој напредак у учењу кроз свако поглавље:

- [ ] **Поглавље 1**: Основе и брзи почетак ✅
- [ ] **Поглавље 2**: Развој са приоритетом на AI ✅  
- [ ] **Поглавље 3**: Конфигурација и аутентификација ✅
- [ ] **Поглавље 4**: Инфраструктура као код и распоређивање ✅
- [ ] **Поглавље 5**: Решења са више AI агената ✅
- [ ] **Поглавље 6**: Валидација и планирање пре распоређивања ✅
- [ ] **Поглавље 7**: Решавање проблема и дебаговање ✅
- [ ] **Поглавље 8**: Производни и ентерпрајз обрасци ✅

### Потврда учења
Након завршетка сваког поглавља, потврдите своје знање тако што:
1. **Практични задатак**: Завршите практично распоређивање из поглавља
2. **Провера знања**: Прегледајте FAQ секцију за ваше поглавље
3. **Дискусија у заједници**: Поделите своје искуство на Azure Discord
4. **Следеће поглавље**: Прелазак на следећи ниво сложености

### Предности завршетка курса
Након завршетка свих поглавља, имаћете:
- **Искуство у продукцији**: Објавили сте стварне AI апликације на Azure
- **Професионалне вештине**: Способности за распоређивање спремно за предузећа  
- **Признатост у заједници**: Активан члан Azure developer заједнице
- **Напредак у каријери**: Тражена експертиза за AZD и распоређивање AI

---

## 🤝 Заједница и подршка

### Набавите помоћ и подршку
- **Технички проблеми**: [Пријавите грешке и затражите функционалности](https://github.com/microsoft/azd-for-beginners/issues)
- **Питања о учењу**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помоћ специфична за AI**: Придружите се [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документација**: [Званична документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Увидi заједнице са Microsoft Foundry Discord

**Недавни резултати анкетe са #Azure канала:**
- **45%** програмера жели да користи AZD за AI радна оптерећења
- **Највећи изазови**: Распоређивања са више сервиса, управљање акредитивима, спремност за продукцију  
- **Најчешће тражено**: AI-специфични шаблони, водичи за решавање проблема, најбоље праксе

**Придружите се нашој заједници да:**
- Поделите своја AZD + AI искуства и добијте помоћ
- Приступите раним прегледима нових AI шаблона
- Допринесете најбољим праксама за распоређивање AI
- Утицајте на будући развој функција за AI + AZD

### Учешће у курсу
Добро дошли су доприноси! Молимо прочитајте наш [Водич за доприносе](CONTRIBUTING.md) за детаље о:
- **Побољшања садржаја**: Побољшајте постојећа поглавља и примере
- **Нови примери**: Додајте сценарије и шаблоне из стварног света  
- **Превод**: Помозите у одржавању подршке за више језика
- **Извештаји о грешкама**: Побољшајте тачност и јасноћу
- **Стандарди заједнице**: Пратите наша инклузивна правила заједнице

---

## 📄 Информације о курсу

### Лиценца
Овај пројекат је лиценциран под MIT лиценцом - погледајте датотеку [LICENSE](../../LICENSE) за детаље.

### Повезани Microsoft ресурси за учење

Наш тим прави и друге свеобухватне курсеве за учење:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j за почетнике](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js за почетнике](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain за почетнике](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Агенти
[![AZD за почетнике](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI за почетнике](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP за почетнике](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI агенти за почетнике](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серија генеративног AI
[![Генеративни AI за почетнике](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно учење
[![ML за почетнике](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science за почетнике](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI за почетнике](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кибербезбедност за почетнике](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб развој за почетнике](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT за почетнике](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR развој за почетнике](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot серија
[![Копилот за парно програмирање са AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Копилот за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Копилот авантура](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигација курса

**🚀 Спремни да почнете да учите?**

**Почетници**: Почните са [Поглавље 1: Основе и брзи почетак](#-chapter-1-foundation--quick-start)  
**AI програмери**: Идите на [Поглавље 2: Развој са фокусом на AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Искусни програмери**: Почните са [Поглавље 3: Конфигурација и аутентификација](#️-chapter-3-configuration--authentication)

**Следећи кораци**: [Почните Поглавље 1 - Основе AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен уз помоћ услуге за превод засноване на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да преводи буду тачни, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било каква неспоразумевања или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->