# AZD за почетнике: Структурисано путовање учења

![AZD-за-почетнике](../../translated_images/sr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub пратиоци](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub звезде](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Аутоматски преводи (увек ажурно)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арапски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Бугарски](../bg/README.md) | [Бирмански (Мјанмар)](../my/README.md) | [Кинески (поједностављени)](../zh-CN/README.md) | [Кинески (традиционални, Хонг Конг)](../zh-HK/README.md) | [Кинески (традиционални, Макао)](../zh-MO/README.md) | [Кинески (традиционални, Тајван)](../zh-TW/README.md) | [Хрватски](../hr/README.md) | [Чешки](../cs/README.md) | [Дански](../da/README.md) | [Холандски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Француски](../fr/README.md) | [Немачки](../de/README.md) | [Грчки](../el/README.md) | [Хебрејски](../he/README.md) | [Хинди](../hi/README.md) | [Мађарски](../hu/README.md) | [Индонежански](../id/README.md) | [Италијански](../it/README.md) | [Јапански](../ja/README.md) | [Каннада](../kn/README.md) | [Корејски](../ko/README.md) | [Литвански](../lt/README.md) | [Малајски](../ms/README.md) | [Малајаламски](../ml/README.md) | [Марати](../mr/README.md) | [Непалски](../ne/README.md) | [Нигеријски пидгин](../pcm/README.md) | [Норвешки](../no/README.md) | [Персијски (Фарси)](../fa/README.md) | [Пољски](../pl/README.md) | [Португалски (Бразил)](../pt-BR/README.md) | [Португалски (Португал)](../pt-PT/README.md) | [Пуњаби (Гурмукхи)](../pa/README.md) | [Румунски](../ro/README.md) | [Руски](../ru/README.md) | [Српски (ћирилица)](./README.md) | [Словачки](../sk/README.md) | [Словеначки](../sl/README.md) | [Шпански](../es/README.md) | [Свахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (Филипински)](../tl/README.md) | [Тамил](../ta/README.md) | [Телугу](../te/README.md) | [Тајландски](../th/README.md) | [Турски](../tr/README.md) | [Украјински](../uk/README.md) | [Урду](../ur/README.md) | [Вијетнамски](../vi/README.md)

> **Преферирате да клонирате локално?**
>
> Овај репозиторијум укључује преко 50 превода што значајно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
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
> Ово вам даје све што вам треба да завршите курс са много бржим преузимањем.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Шта је ново у azd данас

Azure Developer CLI је прешао границе традиционалних веб апликација и API-ја. Данас, azd је појединачни алат за деплој било које апликације на Azure — укључујући апликације са AI могућностима и интелигентне агенте.

Ево шта то значи за вас:

- **AI агенти су сада подржани као пуноправне azd радне јединице.** Можете иницијализовати, разместити и управљати пројектима AI агената користећи исти `azd init` → `azd up` ток посла који већ познајете.
- **Интеграција Microsoft Foundry** доводи распоређивање модела, хостинг агената и конфигурацију AI сервиса директно у azd екосистем шаблона.
- **Основни ток рада се није променио.** Без обзира да ли распоређујете todo апликацију, микросервис или мулти-агентно AI решење, команде су исте.

Ако сте раније користили azd, подршка за AI је природно проширење — не посебан алат или напредни правац. Ако почињете испочетка, научићете један ток рада који одговара за све.

---

## 🚀 Шта је Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** је пријатељски командно-линијски алат за програмере који олакшава распоређивање апликација на Azure. Уместо ручног креирања и повезивања десетина Azure ресурса, можете разместити целе апликације једном командом.

### Магија `azd up`

```bash
# Ова једна команда ради све:
# ✅ Креира све Azure ресурсе
# ✅ Конфигурише мрежу и безбедност
# ✅ Саставља ваш апликациони код
# ✅ Деплојује на Azure
# ✅ Даје вам радни URL
azd up
```

**То је то!** Није потребно кликање у Azure порталу, нема сложених ARM шаблона које прво морате да научите, нема ручне конфигурације — само функционишуће апликације на Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Вишe информација

Ово је најчешће питање које почетници постављају. Ево једноставног одговора:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Управљање појединачним Azure ресурсима | Распоређивање комплетних апликација |
| **Mindset** | Фокус на инфраструктури | Фокус на апликацији |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Потребно познавање Azure сервиса | Довољно је познавање ваше апликације |
| **Best For** | DevOps, Инфраструктура | Програмери, Прототиповање |

### Једноставна аналогија

- **Azure CLI** је као да имате све алате за градњу куће - чекиће, тестере, ексере. Можете изградити било шта, али морате знати градњу.
- **Azure Developer CLI** је као да ангажујете извођача - опишете шта желите, и он се бави изградњом.

### Када користити који

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Прате се једни друге!

AZD користи Azure CLI "под хаубом". Можете користити оба:
```bash
# Поставите вашу апликацију помоћу AZD
azd up

# Затим прецизно подесите специфичне ресурсе помоћу Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Пронађите шаблоне у Awesome AZD

Не почињите испочетка! **Awesome AZD** је заједничка колекција шаблона спремних за деплој:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Прегледајте 200+ шаблона са једним кликом за деплој |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Допринесите својим шаблоном заједници |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Означите звездицом и истражите извор |

### Популарни AI шаблони из Awesome AZD

```bash
# РАГ ћаскање са Microsoft Foundry моделима + AI претрага
azd init --template azure-search-openai-demo

# Брза AI ћаскања апликација
azd init --template openai-chat-app-quickstart

# AI агенти са Foundry агентима
azd init --template get-started-with-ai-agents
```

---

## 🎯 Почните у 3 корака

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
# Иницијализујте из шаблона
azd init --template todo-nodejs-mongo

# Деплојујте на Азуре (креира све!)
azd up
```

**🎉 То је то!** Ваша апликација је сада уживо на Azure.

### Чишћење (не заборавите!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Како користити овај курс

Овај курс је дизајниран за **прогресивно учење** - почните тамо где вам одговара и напредујте:

| Ваше искуство | Почните овде |
|-----------------|------------|
| **Потпуно нов у Azure** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Знате Azure, нови у AZD** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Желите да покренете AI апликације** | [Поглавље 2: AI-прво развијање](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Желите практичну вежбу** | [🎓 Интерактивна радионица](workshop/README.md) - вођена лаб вежба 3-4 сата |
| **Потребни су вам обрасци за продукцију** | [Поглавље 8: Продукција и предузеће](#-chapter-8-production--enterprise-patterns) |

### Брзо подешавање

1. **Fork-ујте овај репозиторијум**: [![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте га**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Добите помоћ**: [Azure Discord заједница](https://discord.com/invite/ByRwuEEgH4)

> **Преферирате да клонирате локално?**
>
> Овај репозиторијум укључује преко 50 превода што значајно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ово вам даје све што вам треба да завршите курс са много бржим преузимањем.


## Преглед курса

Свладајте Azure Developer CLI (azd) кроз структурисана поглавља дизајнирана за прогресивно учење. **Посебан акценат на деплоју AI апликација са интеграцијом Microsoft Foundry.**

### Зашто је овај курс битан за модерне програмере

На основу увида из Microsoft Foundry Discord заједнице, **45% програмера жели да користи AZD за AI радна оптерећења** али наилази на изазове са:
- Сложеним AI архитектурама које укључују више сервиса
- Најбољим праксама за продукциони деплој AI решења  
- Интеграцијом и конфигурацијом Azure AI сервиса
- Оптимизацијом трошкова за AI радна оптерећења
- Решавањем проблема специфичних за деплој AI апликација

### Циљеви учења

По завршетку овог структурисаног курса, ви ћете:
- **Свладати основe AZD:** Основни концепти, инсталација и конфигурација
- **Распонести AI апликације:** Користите AZD са Microsoft Foundry сервисима
- **Имплементирати Infrastructure as Code:** Управљајте Azure ресурсима користећи Bicep шаблоне
- **Решавати проблеме при распоређивању:** Решавање уобичајених проблема и дебаговање
- **Оптимизовати за продукцију:** Безбедност, скалирање, мониторинг и управљање трошковима
- **Изградити мулти-агентна решења:** Распоређивање сложених AI архитектура

## 🗺️ Мапа курса: Брза навигација по поглављима

Свако поглавље има посебан README са циљевима учења, брзим почецима и вежбама:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Почетак | [Основе AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталација](docs/chapter-01-foundation/installation.md) &#124; [Први пројекат](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл. 2: Развој вештачке интелигенције](docs/chapter-02-ai-development/README.md)** | AI-прве апликације | [Интеграција Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Распоређивање модела](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Радионница](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 сата | ⭐⭐ |
| **[Гл. 3: Конфигурација](docs/chapter-03-configuration/README.md)** | Аутентификација и безбедност | [Конфигурација](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификација и безбедност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и распоређивање | [Водич за распоређивање](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провизионисање](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 сата | ⭐⭐⭐ |
| **[Гл. 5: Мулти-агент](docs/chapter-05-multi-agent/README.md)** | AI решења са агентима | [Сценарио малопродаје](examples/retail-scenario.md) &#124; [Обрасци координације](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[Гл. 6: Пре-распоређивање](docs/chapter-06-pre-deployment/README.md)** | Планирање и валидација | [Провере пре лансирања](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 сат | ⭐⭐ |
| **[Гл. 7: Решавање проблема](docs/chapter-07-troubleshooting/README.md)** | Дебаговање и исправка | [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Отстрањивање грешака](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 сата | ⭐⭐ |
| **[Гл. 8: Производња](docs/chapter-08-production/README.md)** | Предузетнички обрасци | [Практике за производњу](docs/chapter-08-production/production-ai-practices.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[🎓 Радионница](workshop/README.md)** | Практична лабораторија | [Увод](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкција](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Уклоњавање инфраструктуре](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Закључак](workshop/docs/instructions/7-Wrap-up.md) | 3-4 сата | ⭐⭐ |

**Укупно трајање курса:** ~10-14 сати | **Напредак вештина:** Почетник → Спреман за производњу

---

## 📚 Поглавља за учење

*Изаберите свој пут учења на основу нивоа искуства и циљева*

### 🚀 Поглавље 1: Основа и брзи почетак
**Потребно**: Azure претплата, основно знање командне линије  
**Трајање**: 30-45 минута  
**Комплексност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталација AZD на вашој платформи
- Ваше прво успешно распоређивање

#### Ресурси за учење
- **🎯 Почни овде**: [Шта је Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теорија**: [AZD основи](docs/chapter-01-foundation/azd-basics.md) - Основни концепти и терминологија
- **⚙️ Подешавање**: [Инсталација и подешавање](docs/chapter-01-foundation/installation.md) - Водичи специфични за платформу
- **🛠️ Практично**: [Ваш први пројекат](docs/chapter-01-foundation/first-project.md) - Упутство корак по корак
- **📋 Брзи преглед**: [Листа наредби](resources/cheat-sheet.md)

#### Практичне вежбе
```bash
# Брза провера инсталације
azd version

# Разместите своју прву апликацију
azd init --template todo-nodejs-mongo
azd up
```

**💡 Исход поглавља**: Успешно распоређивање једноставне веб апликације на Azure користећи AZD

**✅ Верификација успеха:**
```bash
# Након завршетка Поглавља 1, требало би да будете у стању да:
azd version              # Приказује инсталирану верзију
azd init --template todo-nodejs-mongo  # Иницијализује пројекат
azd up                  # Распоређује на Azure
azd show                # Приказује URL покренуте апликације
# Апликација се отвара у претраживачу и ради
azd down --force --purge  # Чисти ресурсе
```

**📊 Уложено време:** 30-45 минута  
**📈 Ниво вештина након:** Може самостално распоређивати основне апликације
**📈 Ниво вештина након:** Може самостално распоређивати основне апликације

---

### 🤖 Поглавље 2: AI-први развој (Препоручено за AI програмере)
**Потребно**: Поглавље 1 завршено  
**Трајање**: 1-2 часа  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Интеграција Microsoft Foundry са AZD
- Распоређивање апликација са AI могућностима
- Разумевање конфигурација AI сервиса

#### Ресурси за учење
- **🎯 Почни овде**: [Интеграција Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Водич за AI агенте](docs/chapter-02-ai-development/agents.md) - Распоредите интелигентне агенте помоћу AZD
- **📖 Обрасци**: [Распоређивање AI модела](docs/chapter-02-ai-development/ai-model-deployment.md) - Распоредите и управљајте AI моделима
- **🛠️ Радионница**: [AI лабораторија](docs/chapter-02-ai-development/ai-workshop-lab.md) - Припремите своја AI решења за AZD
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Учeње у прегледачу са MkDocs * DevContainer окружењем
- **📋 Шаблони**: [Microsoft Foundry шаблони](#ресурси-радионице)
- **📝 Примери**: [Примери AZD распоређивања](examples/README.md)

#### Практичне вежбе
```bash
# Размештите своју прву АИ апликацију
azd init --template azure-search-openai-demo
azd up

# Пробајте додатне АИ шаблоне
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Исход поглавља**: Распоредите и конфигуришите AI-покретану чат апликацију са RAG могућностима

**✅ Верификација успеха:**
```bash
# Након Поглавља 2, требало би да будете у стању да:
azd init --template azure-search-openai-demo
azd up
# Тестирати интерфејс за ћаскање са вештачком интелигенцијом
# Постављати питања и добијати одговоре које покреће вештачка интелигенција уз навођење извора
# Проверити да интеграција претраге функционише
azd monitor  # Проверити да Application Insights приказује телеметрију
azd down --force --purge
```

**📊 Уложено време:** 1-2 часа  
**📈 Ниво вештина након:** Може распоређивати и конфигурисати AI апликације спремне за производњу  
**💰 Свесност о трошковима:** Упознати се са трошковима за развој $80-150/месец, трошковима за производњу $300-3500/месец

#### 💰 Разматрања трошкова за AI распореде

**Развојно окружење (процењено $80-150/месец):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/месец (у зависности од коришћења токена)
- AI Search (основни ниво): $75/месец
- Container Apps (Consumption): $0-20/месец
- Складиште (Standard): $1-5/месец

**Окружење за производњу (процењено $300-3,500+/месец):**
- Microsoft Foundry Models (PTU за конзистентне перформансе): $3,000+/месец ИЛИ Pay-as-you-go са великим обимом
- AI Search (Standard tier): $250/месец
- Container Apps (Dedicated): $50-100/месец
- Application Insights: $5-50/месец
- Складиште (Premium): $10-50/месец

**💡 Савети за оптимизацију трошкова:**
- Користите **Free Tier** Microsoft Foundry Models за учење (Azure OpenAI укључује 50,000 токена/месец)
- Покрените `azd down` да деактивирате ресурсе када не развијате активно
- Почните са моделом наплате по потрошњи, надоградите на PTU само за производњу
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
**Потребно**: Поглавље 1 завршено  
**Трајање**: 45-60 минута  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Конфигурација и управљање окружењем
- Најбоље праксе за аутентификацију и безбедност
- Именовање и организација ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Водич за конфигурацију](docs/chapter-03-configuration/configuration.md) - Подешавање окружења
- **🔐 Безбедност**: [Обрасци аутентификације и управљани идентитет](docs/chapter-03-configuration/authsecurity.md) - Обрасци аутентификације
- **📝 Примери**: [Пример апликације са базом података](examples/database-app/README.md) - AZD примери са базом података

#### Практичне вежбе
- Конфигуришите више окружјења (dev, staging, prod)
- Подесите аутентификацију помоћу управљаног идентитета
- Имплементирајте конфигурације специфичне за окружење

**💡 Исход поглавља**: Управљање више окружења са правилном аутентификацијом и безбедношћу

---

### 🏗️ Поглавље 4: Инфраструктура као код и распоређивање
**Потребно**: Поглавља 1-3 завршена  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐⭐

#### Шта ћете научити
- Напредни шаблони распоређивања
- Инфраструктура као код са Bicep
- Стратегије провизионисања ресурса

#### Ресурси за учење
- **📖 Распоређивање**: [Водич за распоређивање](docs/chapter-04-infrastructure/deployment-guide.md) - Комплетни процеси
- **🏗️ Провизионисање**: [Провизионисање ресурса](docs/chapter-04-infrastructure/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Пример Container App-а](../../examples/container-app) - Деплојирања у контејнерима

#### Практичне вежбе
- Креирајте прилагођене Bicep шаблоне
- Распоредите мулти-сервисне апликације
- Имплементирајте blue-green стратегије распоређивања

**💡 Исход поглавља**: Распоредите сложене мулти-сервисне апликације користећи прилагођене инфраструктурне шаблоне

---

### 🎯 Поглавље 5: Мулти-агентна AI решења (Напредно)
**Потребно**: Поглавља 1-2 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Обрасци мулти-агентне архитектуре
- Оркестрација и координација агената
- Распоређивања AI спремна за производњу

#### Ресурси за учење
- **🤖 Истакнути пројекат**: [Мулти-агентно решење за малопродају](examples/retail-scenario.md) - Комплетна имплементација
- **🛠️ ARM шаблони**: [ARM пакет шаблона](../../examples/retail-multiagent-arm-template) - Распоређивање једним кликом
- **📖 Архитектура**: [Обрасци координације мулти-агентних система](docs/chapter-06-pre-deployment/coordination-patterns.md) - Обрасци

#### Практичне вежбе
```bash
# Размешти целокупно мултиагентско решење за малопродају
cd examples/retail-multiagent-arm-template
./deploy.sh

# Истражите конфигурације агената
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Исход поглавља**: Распоредите и управљајте мулти-агентним AI решењем спремним за производњу са Customer и Inventory агентима

---

### 🔍 Поглавље 6: Валидација и планирање пре распоређивања
**Потребно**: Поглавље 4 завршено  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије избора SKU
- Провере пре лансирања и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Избор**: [Избор SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Исплативи избори
- **✅ Валидација**: [Провере пре лансирања](docs/chapter-06-pre-deployment/preflight-checks.md) - Аутоматизовани скрипти

#### Практичне вежбе
- Покрените скрипте за валидацију капацитета
- Оптимизујте изборе SKU ради смањења трошкова
- Имплементирајте аутоматизоване провере пре распоређивања

**💡 Исход поглавља**: Валидација и оптимизација распореда пре извршења

---

### 🚨 Поглавље 7: Решавање проблема и дебаговање
**Потребно**: Било које поглавље о распоређивању завршено  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематски приступи отстрањивању грешака
- Чести проблеми и решења
- Решавање проблема специфичних за AI

#### Ресурси за учење
- **🔧 Чести проблеми**: [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) - FAQ и решења
- **🕵️ Отстрањивање грешака**: [Водич за дебаговање](docs/chapter-07-troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 AI проблеми**: [Решавање проблема специфичних за AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми AI сервиса

#### Практичне вежбе
- Дијагностикујте неуспехе распоређивања
- Решите проблеме са аутентификацијом
- Отстрањивање грешака у повезаности AI сервиса

**💡 Исход поглавља**: Самостално дијагностиковање и решавање честих проблема при распоређивању

---

### 🏢 Поглавље 8: Производња и предузетнички обрасци
**Потребно**: Поглавља 1-4 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије распоређивања у производњу
- Предузетнички обрасци безбедности
- Надгледање и оптимизација трошкова

#### Ресурси за учење
- **🏭 Производња**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Предузећни обрасци
- **📝 Примери**: [Microservices Example](../../examples/microservices) - Комплексне архитектуре
- **📊 Мониторинг**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Надгледање

#### Практичне вежбе
- Имплементирајте предузећне безбедносне обрасце
- Поставите свеобухватни мониторинг
- Разместите у продукцију уз одговарајуће управљање

**💡 Резултат поглавља**: Разместите апликације спремне за предузеће са пуним производним могућностима

---

## 🎓 Преглед радионице: Практично искуство учења

> **⚠️ СТАТУС РАДИОНИЦЕ: Активни развој**  
> Материјали радионице се тренутно развијају и усавршавају. Основни модули су функционални, али неки напредни делови су незавршени. Активно радимо на довршавању целог садржаја. [Пратите напредак →](workshop/README.md)

### Интерактивни материјали радионице
**Свеобухватно практично учење са алатима у прегледачу и вођеним вежбама**

Наши материјали за радионицу пружају структуриран, интерактиван доживљај учења који допуњује горе наведени програм по поглављима. Радионица је дизајнирана за самостално учење и вођене сесије са предавачем.

#### 🛠️ Карактеристике радионице
- **Интерфејс заснован на прегледачу**: Комплетна радионица покретана MkDocs-ом са функцијама претраге, копирања и тема
- **Интеграција GitHub Codespaces**: Подешавање развојног окружења једним кликом
- **Структуриран пут учења**: 8-модулне вођене вежбе (укупно 3-4 сата)
- **Прогресивна методологија**: Увод → Избор → Валидација → Деконструкција → Конфигурација → Прилагођавање → Демонтажа → Закључак
- **Интерактивно DevContainer окружење**: Предконфигурисани алати и зависности

#### 📚 Структура модула радионице
Радионица следи **8-модулну прогресивну методологију** која вас води од открића до савладавања распоређивања:

| Модул | Тема | Шта ћете урадити | Трајање |
|--------|-------|----------------|----------|
| **0. Увод** | Преглед радионице | Разумети циљеве учења, предуслове и структуру радионице | 15 мин |
| **1. Избор** | Проналажење шаблона | Истражите AZD шаблоне и одаберите прави AI шаблон за ваш сценарио | 20 мин |
| **2. Валидација** | Deploy & Verify | Deploy-ујте шаблон са `azd up` и валидирајте да инфраструктура функционише | 30 мин |
| **3. Деконструкција** | Разумевање структуре | Користите GitHub Copilot за истраживање архитектуре шаблона, Bicep фајлова и организације кода | 30 мин |
| **4. Конфигурација** | azure.yaml дубински преглед | Овладајте `azure.yaml` конфигурацијом, lifecycle hook-овима и променљивим окружења | 30 мин |
| **5. Прилагођавање** | Прилагодите по потреби | Омогућите AI Search, праћење, евалуацију и прилагодите за ваш сценарио | 45 мин |
| **6. Демонтажа** | Чишћење | Безбедно де-проvision ресурсе са `azd down --purge` | 15 мин |
| **7. Закључак** | Следећи кораци | Ревизија постигнућа, кључних концепата и наставак учења | 15 мин |

**Ток радионице:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Почетак рада са радионицом
```bash
# Опција 1: GitHub Codespaces (Препоручено)
# Кликните "Code" → "Create codespace on main" у репозиторијуму

# Опција 2: Локални развој
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Пратите упутства за подешавање у workshop/README.md
```

#### 🎯 Циљеви учења радионице
Завршетком радионице, учесници ће:
- **Разместити AI апликације у продукцији**: Користите AZD са Microsoft Foundry услугама
- **Овладати вишеагентним архитектурама**: Имплементирати координирана решења са AI агентима
- **Применити најбоље праксе безбедности**: Конфигурисати аутентификацију и контролу приступа
- **Оптимизовати за скалабилност**: Дизајнирати економична, перформантна решења за распоређивање
- **Решавати проблеме приликом распоређивања**: Решавати уобичајене проблеме самостално

#### 📖 Ресурси радионице
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Окружење за учење у прегледачу
- **📋 Инструкције по модулу**:
  - [0. Увод](workshop/docs/instructions/0-Introduction.md) - Преглед радионице и циљеви
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Проналажење и одабир AI шаблона
  - [2. Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) - Деплоy и проверавањe шаблона
  - [3. Деконструкција](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Истражите архитектуру шаблона
  - [4. Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) - Овладајте azure.yaml
  - [5. Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) - Прилагодите за ваш сценарио
  - [6. Демонтажа](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очистите ресурсе
  - [7. Закључак](workshop/docs/instructions/7-Wrap-up.md) - Ревизија и следећи кораци
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вежбе фокусиране на AI
- **💡 Брзи почетак**: [Workshop Setup Guide](workshop/README.md#quick-start) - Конфигурација окружења

**Идеално за**: Корпоративну обуку, универзитетске курсеве, самостално учење и интензивне програме обуке програмера.

---

## 📖 Дубински преглед: Могућности AZD

Изван основа, AZD пружа моћне функције за производна распоређивања:

- **Deploy-овања заснована на шаблонима** - Користите предизграђене шаблоне за уобичајене обрасце апликација
- **Инфраструктура као код** - Управљање Azure ресурсима помоћу Bicep или Terraform
- **Интегрисани токови рада** - Беспријекорно провизионисање, деплоy и надзор апликација
- **Пријатељско за девелопере** - Оптимизовано за продуктивност и искуство развојних инжењера

### **AZD + Microsoft Foundry: Савршено за AI распоређивања**

**Зашто AZD за AI решења?** AZD одговара на главне изазове са којима се суочавају AI развојни тимови:

- **Припремљени AI шаблони** - Предконфигурисани шаблони за Microsoft Foundry моделе, Cognitive Services и ML радне оптерећења
- **Сигурна AI распоређивања** - Уграђени безбедносни обрасци за AI услуге, API кључеве и крајње тачке модела
- **Производни AI обрасци** - Најбоље праксе за скалабилна, економична AI распоређивања
- **End-to-End AI токови рада** - Од развоја модела до продукционог распоређивања са одговарајућим надзором
- **Оптимизација трошкова** - Паметно распорежавање ресурса и стратегије скалирања за AI радне оптерећења
- **Интеграција са Microsoft Foundry** - Беспријекорна веза са каталогом модела и крајњим тачкама Microsoft Foundry

---

## 🎯 Библиотека шаблона и примера

### Истакнуто: Microsoft Foundry шаблони
**Почните овде ако распоређујете AI апликације!**

> **Напомена:** Ови шаблони демонстрирају различите AI обрасце. Неки су спољни Azure Samples, други су локалне имплементације.

| Шаблон | Поглавље | Сложеност | Услуге | Тип |
|----------|---------|------------|----------|------|
| [**Почните са AI четом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Спољни |
| [**Почните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Спољни |
| [**Azure Search + OpenAI демо**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Спољни |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Спољни |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Спољни |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Спољни |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локално** |

### Истакнуто: Комплетни сценарији учења
**Шаблони спремни за продукцију мапирани на поглавља учења**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни обрасци AI распоређивања |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | RAG имплементација са Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Поглавље 4 | ⭐⭐ | Интеграција Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Agent framework и function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Оркестрација предузећног AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Вишеагентна архитектура са Customer и Inventory агентима |

### Учење по типу примера

> **📌 Локални vs. Спољни примери:**  
> **Локални примери** (у овом репозиторијуму) = Спремни за употребу одмах  
> **Спољни примерi** (Azure Samples) = Клонирајте из повезаних репозиторијума

#### Локални примери (спремни за употребу)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Комплетна имплементација спремна за продукцију са ARM шаблонима
  - Вишеагентна архитектура (Customer + Inventory агенти)
  - Свеобухватно праћење и евалуација
  - Распоређивање једним кликом преко ARM шаблона

#### Локални примери - Container Applications (Поглавља 2-5)
**Свеобухватни примери за распоређивање контејнера у овом репозиторијуму:**
- [**Container App Examples**](examples/container-app/README.md) - Комплетан водич за распоређивања у контејнерима
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Једноставан REST API са scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Производно спремно више-сервисно распоређивање
  - Quick Start, Production, и Advanced обрасци распоређивања
  - Надгледање, безбедност и смернице за оптимизацију трошкова

#### Спољни примери - Једноставне апликације (Поглавља 1-2)
**Клонирајте ове Azure Samples репозиторијуме да бисте започели:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни обрасци распоређивања
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Распоређивање статичког садржаја
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Распоређивање REST API

#### Спољни примери - Интеграција са базом података (Поглавља 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Обрасци повезивања са базом података
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless радни ток за податке

#### Спољни примери - Напредни обрасци (Поглавља 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Мулти-сервисне архитектуре
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Обрада у позадини  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Производни ML обрасци

### Спољне колекције шаблона
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Курирана колекција званичних и community шаблона
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn документација о шаблонима
- [**Examples Directory**](examples/README.md) - Локални примери за учење са детаљним објашњењима

---

## 📚 Ресурси за учење и референце

### Кратке референце
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Есенцијалне azd команде организоване по поглављима
- [**Речник**](resources/glossary.md) - Терминологија Azure и azd  
- [**ЧПП**](resources/faq.md) - Често постављана питања организована по поглављима учења
- [**Водич за учење**](resources/study-guide.md) - Свеобухватне практичне вежбе

### Практичне радионице
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Учините своја AI решења погодним за распоређивање помоћу AZD (2-3 сата)
- [**Interactive Workshop**](workshop/README.md) - 8-модулне вођене вежбе са MkDocs и GitHub Codespaces
  - Следи: Увод → Избор → Валидација → Деконструкција → Конфигурација → Прилагођавање → Демонтажа → Закључак

### Спољни ресурси за учење
- [Документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Центар за архитектуру](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калкулатор цена Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Вештине AI агента за ваш уређивач
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворених вештина агената за Azure AI, Foundry, развој, дијагностику, оптимизацију трошкова и још много тога. Инсталирајте их у GitHub Copilot, Cursor, Claude Code или било којег подржаног агента:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Брз водич за решавање проблема

**Чести проблеми са којима се почетници сусрећу и тренутна решења:**

<details>
<summary><strong>❌ "azd: команда није пронађена"</strong></summary>

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
<summary><strong>❌ "Није пронађена претплата" или "Претплата није подешена"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" или "Превишена квота"</strong></summary>

```bash
# Пробајте другу Azure регију
azd env set AZURE_LOCATION "westus2"
azd up

# Или користите мање SKU-ове у развоју
# Измените infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" не завршава у потпуности</strong></summary>

```bash
# Опција 1: Очисти и покушај поново
azd down --force --purge
azd up

# Опција 2: Само поправи инфраструктуру
azd provision

# Опција 3: Провери детаљан статус
azd show

# Опција 4: Провери дневнике у Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Аутентификација није успела" или "Токен је истекао"</strong></summary>

```bash
# Поновно аутентификовање
az logout
az login

azd auth logout
azd auth login

# Проверити аутентификацију
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс већ постоји" или сукоби у именима</strong></summary>

```bash
# AZD генерише јединствена имена, али ако дође до конфликта:
azd down --force --purge

# Онда поново покушајте са свежим окружењем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Размештање шаблона траје предуго</strong></summary>

**Уобичајено време чекања:**
- Једноставна веб апликација: 5-10 минута
- Апликација са базом података: 10-15 минута
- AI апликације: 15-25 минута (постављање OpenAI-а је споро)

```bash
# Проверите напретак
azd show

# Ако сте заглављени >30 минута, проверите Azure портал:
azd monitor
# Потражите неуспела распоређивања
```
</details>

<details>
<summary><strong>❌ "Приступ одбијен" или "Забрањено"</strong></summary>

```bash
# Проверите своју улогу у Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Потребна вам је најмање улога "Contributor"
# Замолите свог Azure администратора да додели:
# - Contributor (за ресурсе)
# - User Access Administrator (за додељивање улога)
```
</details>

<details>
<summary><strong>❌ Не могу да пронађем URL размештене апликације</strong></summary>

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

### 📚 Пуни ресурси за решавање проблема

- **Водич за честе проблеме:** [Детаљна решења](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми специфични за AI:** [Решавање проблема везаних за AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Водич за дебаговање:** [Дебаговање корак по корак](docs/chapter-07-troubleshooting/debugging.md)
- **Добити помоћ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завршетак курса и сертификација

### Праћење напретка
Пратите свој напредак у сваком поглављу:

- [ ] **Поглавље 1**: Основе и брзи почетак ✅
- [ ] **Поглавље 2**: Развој фокусиран на AI ✅  
- [ ] **Поглавље 3**: Конфигурација и аутентификација ✅
- [ ] **Поглавље 4**: Инфраструктура као код и деплој ✅
- [ ] **Поглавље 5**: Мулти-агентска AI решења ✅
- [ ] **Поглавље 6**: Валидација и планирање пре деплоја ✅
- [ ] **Поглавље 7**: Решавање проблема и дебаговање ✅
- [ ] **Поглавље 8**: Продукцијa и ентерпрајс обрасци ✅

### Верификација учења
Након завршетка сваког поглавља, проверите своје знање помоћу:
1. **Практична вежба**: Завршите практичну имплементацију из поглавља
2. **Провера знања**: Прегледајте одељак Често постављана питања за ваше поглавље
3. **Дискусија у заједници**: Поделите своје искуство у Azure Discord
4. **Следеће поглавље**: Прелазите на следећи ниво сложености

### Бенефити завршетка курса
Након завршетка свих поглавља, добићете:
- **Искуство у продукцији**: Размешћене стварне AI апликације на Azure
- **Професионалне вештине**: Способности за деплојмент спремне за предузећа  
- **Препознавање у заједници**: Активан члан Azure заједнице програмера
- **Напредак у каријери**: Тражено знање из AZD и деплојмента AI апликација

---

## 🤝 Заједница и подршка

### Добите помоћ и подршку
- **Технички проблеми**: [Пријавите грешке и затражите функционалности](https://github.com/microsoft/azd-for-beginners/issues)
- **Питања о учењу**: [Microsoft Azure Discord заједница](https://discord.gg/microsoft-azure) и [![Мајкрософт Фаундри Дискорд](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помоћ специфична за AI**: Придружите се [![Мајкрософт Фаундри Дискорд](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документација**: [Званична документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Увид из заједнице са Мајкрософт Фаундри Дискорд

**Недавни резултати анкете са канала #Azure:**
- **45%** програмера жели да користи AZD за AI радна оптерећења
- **Највећи изазови**: Размештање више сервиса, управљање акредитивима, спремност за продукцијско окружење  
- **Најчешће захтевани**: AI-специфични шаблони, водичи за решавање проблема, најбоље праксе

**Придружите се нашој заједници да бисте:**
- Поделили своја AZD + AI искуства и добили помоћ
- Приступили раним прегледима нових AI шаблона
- Допринели најбољим праксама за деплојмент AI
- Утицали на развој будућих AI + AZD функција

### Допринос курсу
Позивамо доприносе! Молимо прочитајте наш [Водич за допринос](CONTRIBUTING.md) за детаље о:
- **Побољшања садржаја**: Унапредите постојећа поглавља и примере
- **Нови примери**: Додајте реалне сценарије и шаблоне  
- **Превођење**: Помозите у одржавању подршке за више језика
- **Пријаве грешака**: Побољшајте тачност и јасноћу
- **Стандарди за заједницу**: Пратите наше смернице за инклузивност у заједници

---

## 📄 Информације о курсу

### Лиценца
Овај пројекат је лиценциран под MIT лиценцом - погледајте датотеку [LICENSE](../../LICENSE) за детаље.

### Повезани Microsoft ресурси за учење

Наш тим производи и друге свеобухватне курсеве за учење:

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
 
### Серија Генеративног AI
[![Генеративни AI за почетнике](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративни AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно учење
[![Машинско учење за почетнике](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Наука о подацима за почетнике](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI за почетнике](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кибербезбедност за почетнике](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб развој за почетнике](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT за почетнике](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR развој за почетнике](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot серија
[![Copilot за парно AI програмирање](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot авантура](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигација курса

**🚀 Спремни да почнете са учењем?**

**Почетници**: Почните са [Поглавље 1: Основе и брзи почетак](#-chapter-1-foundation--quick-start)  
**AI програмери**: Идите на [Поглавље 2: Развој усмерен на AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Искусни програмери**: Почните са [Поглавље 3: Конфигурација и аутентификација](#️-chapter-3-configuration--authentication)

**Следећи кораци**: [Почните Поглавље 1 - Основе AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Овај документ је преведен помоћу услуге за превођење која користи вештачку интелигенцију [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод урађен од стране људског преводиоца. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која проистичу из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->