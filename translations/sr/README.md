# AZD за почетнике: Структуриран пут учења

![AZD-for-beginners](../../translated_images/sr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Аутоматизовани преводи (увек ажурни)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](./README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Волите да клонирате локално?**
>
> Овај репозиторијум садржи преводе на више од 50 језика, што значајно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
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
> Ово ће вам дати све што вам је потребно за завршетак курса са много бржим преузимањем.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Шта је ново у azd данас

> 📌 Овај курс је верификован за **`azd 1.27.1`** (јул 2026). Покрените `azd version` да проверите вашу верзију, и `azd upgrade` да добијете најновију.

Azure Developer CLI је прерастао из класичних веб апликација и API-ја. Данас je azd једини алат за деплој **било које** апликације на Azure — укључујући апликације покретане вештачком интелигенцијом и интелигентне агенте.

Ево шта то значи за вас:

- **AI агенти су сада првокласни azd задаци.** Можете иницијализовати, депловати и управљати AI агент пројектима користећи исти `azd init` → `azd up` радни ток који већ познајете.
- **Комплетан животни циклус агента преко CLI-а.** `azure.ai.agents` екстензија сада покрива цео пут — `azd ai agent init` за scaffold, `azd ai agent invoke` за тестирање (са извештајем о времену одговора), `azd ai agent eval generate` и `azd ai agent optimize` за мерење и побољшање квалитета, и `azd ai agent delete` за чишћење.
- **Више AI грађевинских блокова.** Нove preview екстензије — `azure.ai.skills` и `azure.ai.connections` — омогућавају управљање поново употребљивим вештинама агената и Foundry конекцијама директно уз azd.
- **Интеграција Microsoft Foundry** доноси деплој модела, хостирање агената и конфигурацију AI сервиса директно у azd екосистем шаблона.
- **Глаткија основна свакодневна употреба.** Недавна издања учинила су `azd init` идемпотентним (безбедно за поновно покретање), аутоматско брисање застарелих token-а при `azd auth login`, и додата је пријатна промпт порука приликом првог покретања `azd tool`.
- **Основни радни ток није промењен.** Без обзира да ли деплујете todo апликацију, микросервис или мулти-агент AI решење, команде су исте.

> **Напомена за Aspire кориснике:** Microsoft сада производ једноставно назива **Aspire** (раније ".NET Aspire"). Подршка за Aspire у azd-у није промењена — само је име обновљено.

Ако сте раније користили azd, подршка за AI је природно проширење — није посебан алат или напредни правац. Ако почињете из почетка, научићете један радни ток који ваља за све.

---

## 🚀 Шта је Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** је прилагођен командни алат за програмере који олакшава деплој апликација на Azure. Уместо ручног креирања и повезивања десетина Azure ресурса, можете депловати целе апликације једном командом.

### Магија `azd up`

```bash
# Овај један команд ради све:
# ✅ Креира све Azure ресурсе
# ✅ Конфигурише мрежу и безбедност
# ✅ Саставља ваш апликациони код
# ✅ Деплојује на Azure
# ✅ Дава вам радни URL
azd up
```

**То је то!** Није потребно кликање у Azure порталу, учење сложених ARM шаблона, нити ручна конфигурација - само функционишуће апликације на Azure.

---

## ❓ Azure Developer CLI против Azure CLI: Која је разлика?

Ово је најчешће питање почетника. Ево једноставан одговор:

| Карактеристика | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Намена** | Управљање појединачним Azure ресурсима | Деплој комплетних апликација |
| **Мисли на** | Фокус на инфраструктуру | Фокус на апликације |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крива учења** | Морате познавати Azure сервисе | Само познајете вашу апликацију |
| **Најбоље за** | DevOps, инфраструктуру | Програмере, прототипирање |

### Једноставна аналогија

- **Azure CLI** је као имати све алате да изградите кућу - чекиће, тестере, ексере. Можете направити било шта, али морате познавати грађевинарство.
- **Azure Developer CLI** је као да ангажујете извођача радова - опишете шта желите, а он се брине о градњи.

### Када користити који

| Сценарио | Користите ово |
|----------|----------|
| "Желим брзо да деплујем моју веб апликацију" | `azd up` |
| "Треба ми само да направим storage account" | `az storage account create` |
| "Градим потпуну AI апликацију" | `azd init --template azure-search-openai-demo` |
| "Треба ми да дебагујем конкретан Azure ресурс" | `az resource show` |
| "Желим production-ready деплој у року од неколико минута" | `azd up --environment production` |

### Они раде заједно!

AZD користи Azure CLI у позадини. Можете користити оба:
```bash
# Деплојујте своју апликацију са AZD
azd up

# Онда фино подесите специфичне ресурсе помоћу Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Пронађите шаблоне у Awesome AZD

Не почињите од нуле! **Awesome AZD** је заједничка колекција шаблона спремних за деплој:

| Ресурс | Опис |
|----------|-------------|
| 🔗 [**Awesome AZD галерија**](https://azure.github.io/awesome-azd/) | Прегледајте 200+ шаблона са једним кликом за деплој |
| 🔗 [**Пошаљите шаблон**](https://github.com/Azure/awesome-azd/issues) | Доприносите свој шаблон заједници |
| 🔗 [**GitHub репозиторијум**](https://github.com/Azure/awesome-azd) | Старате и истражите извор |

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

Пре него што почнете, уверите се да је ваша машина спремна за шаблон који желите да деплујете:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ако било која од неопходних провера падне, прво то исправите, па наставите са брзим стартом.

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

### Корак 2: Аутентификација за AZD

```bash
# Опционо ако планирате да користите Azure CLI команде директно у овом курсу
az login

# Потребно за AZD радне токове
azd auth login
```

Ако нисте сигурни који вам треба, пратите цео процес подешавања у [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Корак 3: Деплујује свој први апликацију

```bash
# Иницијализујте из шаблона
azd init --template todo-nodejs-mongo

# Деплојујте на Azure (креира све!)
azd up
```

**🎉 То је то!** Ваша апликација је сада уживо на Azure.

### Очистите (не заборавите!)

```bash
# Уклони све ресурсе када завршиш са експериментисањем
azd down --force --purge
```

---

## 📚 Како користити овај курс

Овај курс је дизајниран за **прогресивно учење** - почните тамо где сте удобни и напредујте:

| Ваше искуство | Почните овде |
|-----------------|------------|
| **Потпуно нови у Azure** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Познајете Azure, нови сте у AZD** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Желите да деплујете AI апликације** | [Поглавље 2: AI-прво развијање](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Желите практичан рад** | [🎓 Интерктивна радионица](workshop/README.md) - вођена лаб вежба 3-4 сата |
| **Требају вам продукцијски обрасци** | [Поглавље 8: Продукција и предузећа](#-chapter-8-production--enterprise-patterns) |

### Брзо подешавање

1. **Направите форк овог репозиторијума**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте га**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Потражите помоћ**: [Azure Discord заједница](https://discord.com/invite/ByRwuEEgH4)

> **Волите да клонирате локално?**

> Овај репозиторијум садржи преводе на више од 50 језика, што значајно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ово ће вам дати све што вам је потребно за завршетак курса са много бржим преузимањем.


## Преглед курса

Савладајте Azure Developer CLI (azd) кроз структуирана поглавља дизајнирана за прогресивно учење. **Посебан фокус на деплоју AI апликација са интеграцијом Microsoft Foundry.**


### Зашто је овај курс важан за модерне програмере

На основу увида из Microsoft Foundry Discord заједнице, **45% програмера жели да користи AZD за AI радне задатке** али се суочавају са изазовима у вези са:
- Комплексним мултисервисним AI архитектурама
- Најбољим праксама за продукцијско постављање AI
- Интеграцијом и конфигурацијом Azure AI сервиса
- Оптимизацијом трошкова за AI радне задатке
- Решавањем специфичних проблема приликом постављања AI

### Циљеви учења

Завршетком овог структурисаног курса, ви ћете:
- **Мастерирати AZD основе**: Основни концепти, инсталација и конфигурација
- **Постављати AI апликације**: Користите AZD са Microsoft Foundry сервисима
- **Имплементирати Infrastructure as Code**: Управљање Azure ресурсима помоћу Bicep шаблона
- **Решавати проблеме са постављањем**: Отклањати уобичајене проблеме и дебаговати
- **Оптимизовати за продукцију**: Безбедност, скалирање, мониторинг и управљање трошковима
- **Правити мулти-агент решења**: Постављати сложене AI архитектуре

## Пре него што почнете: Налози, приступ и претпоставке

Пре него што започнете Поглавље 1, уверите се да имате следеће. Кораци инсталације у овом упутству претпостављају да су ове основе већ решене.

- **Azure претплата**: Можете користити постојећу претплату са посла или свој налог, или направити [бесплатну пробну претплату](https://aka.ms/azurefreetrial) да започнете.
- **Дозвола за креирање Azure ресурса**: За већину вежби треба да имате најмање **Contributor** приступ на циљној претплати или групи ресурса. Нека поглавља могу захтевати могућност креирања група ресурса, управљаних идентитета и RBAC додела.
- [**GitHub налог**](https://github.com): Корисно је за форковање репозиторијума, праћење својих измена и коришћење GitHub Codespaces за радионицу.
- **Преузете зависности за шаблоне**: Неки шаблони захтевају локалне алате као што су Node.js, Python, Java или Docker. Покрените валидатор за подешавање пре почетка да рано откријете недостајуће алате.
- **Основно познавање терминала**: Не морате бити стручњак, али треба да будете комфорни у коришћењу команди као што су `git clone`, `azd auth login` и `azd up`.

> **Радите у корпоративној претплати?**
> Ако ваш Azure окружење управља администратор, унапред потврдите да можете постављати ресурсе у претплату или групу ресурса коју планирате да користите. У супротном, затражите sandbox претплату или Contributor приступ пре почетка.

> **Нови сте у Azure?**
> Почните са својом Azure пробном претплатом или pay-as-you-go претплатом на https://aka.ms/azurefreetrial како бисте могли да завршите вежбе без чекања на одобрења на нивоу тенанта.

## 🗺️ Мапа курса: Брза навигација по поглављима

Свака глава има посебан README са циљевима учења, брзим почецима и вежбама:

| Глава | Тема | Лекције | Трајање | Комплексност |
|---------|-------|---------|----------|------------|
| **[Глава 1: Основа](docs/chapter-01-foundation/README.md)** | Почетак рада | [AZD основе](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталација](docs/chapter-01-foundation/installation.md) &#124; [Први пројекат](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Глава 2: AI развој](docs/chapter-02-ai-development/README.md)** | AI-прве апликације | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Деплојмент модела](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Радионица](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 сата | ⭐⭐ |
| **[Глава 3: Конфигурација](docs/chapter-03-configuration/README.md)** | Аутентификација и безбедност | [Конфигурација](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификација и безбедност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Глава 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и постављање | [Водич за деплојмент](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 сата | ⭐⭐⭐ |
| **[Глава 5: Мулти-Агент](docs/chapter-05-multi-agent/README.md)** | AI агент решења | [Retail сценарио](examples/retail-scenario.md) &#124; [Шаблони координације](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[Глава 6: Пре постављања](docs/chapter-06-pre-deployment/README.md)** | Планирање и валидација | [Провере](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 сат | ⭐⭐ |
| **[Глава 7: Решавање проблема](docs/chapter-07-troubleshooting/README.md)** | Дебаг и поправка | [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Дебаговање](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 сата | ⭐⭐ |
| **[Глава 8: Продукција](docs/chapter-08-production/README.md)** | Предузетнички шаблони | [Продукцијске праксе](docs/chapter-08-production/production-ai-practices.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[🎓 Радионица](workshop/README.md)** | Практични рад | [Увод](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкција](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Ручно рушење](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Завршетак](workshop/docs/instructions/7-Wrap-up.md) | 3-4 сата | ⭐⭐ |

**Укупно трајање курса:** ~10-14 сати | **Раст вештина:** Почетник → Спреман за продукцију

---

## 📚 Поглавља за учење

*Изаберите свој пут учења на основу нивоа искуства и циљева*

### 🚀 Поглавље 1: Основа и брзи почетак
**Преуслови**: Azure претплата, основно знање командне линије  
**Трајање**: 30-45 минута  
**Комплексност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталација AZD на вашој платформи
- Ваш први успешан деплојмент

#### Ресурси за учење
- **🎯 Почните овде**: [Шта је Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теорија**: [AZD основе](docs/chapter-01-foundation/azd-basics.md) - Основни концепти и терминологија
- **⚙️ Подешавање**: [Инсталација и подешавање](docs/chapter-01-foundation/installation.md) - Водичи специфични за платформу
- **🛠️ Практичан рад**: [Ваш први пројекат](docs/chapter-01-foundation/first-project.md) - Упутство корак по корак
- **📋 Брзи преглед**: [Командни чек-лист](resources/cheat-sheet.md)

#### Практичне вежбе
```bash
# Брза провера инсталације
azd version

# Рasporeдите вашу прву апликацију
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат поглавља**: Успешно поставити једноставну веб апликацију на Azure користећи AZD

**✅ Валидација успеха:**
```bash
# Након завршетка Поглавља 1, требало би да будете у могућности да:
azd version              # Приказује инсталирану верзију
azd init --template todo-nodejs-mongo  # Иницијализује пројекат
azd up                  # Деплојује на Ажуре
azd show                # Приказује УРЛ адреса покренуте апликације
# Апликација се отвори у прегледачу и ради
azd down --force --purge  # Чисти ресурсе
```

**📊 Уложено време:** 30-45 минута  
**📈 Ниво вештине након:** Може самостално постављати основне апликације
**📈 Ниво вештине након:** Може самостално постављати основне апликације

---

### 🤖 Поглавље 2: AI-први развој (Рекомандовано за AI програмере)
**Преуслови**: Пређено Поглавље 1  
**Трајање**: 1-2 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Интеграција Microsoft Foundry са AZD
- Постављање AI-подржаних апликација
- Разумевање конфигурација AI сервиса

#### Ресурси за учење
- **🎯 Почните овде**: [Интеграција Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Водич за AI агенте](docs/chapter-02-ai-development/agents.md) - Постављање интелигентних агената са AZD
- **📖 Шаблони**: [Деплојмент AI модела](docs/chapter-02-ai-development/ai-model-deployment.md) - Постављање и управљање AI моделима
- **🛠️ Радионица**: [AI радионица](docs/chapter-02-ai-development/ai-workshop-lab.md) - Припрема AI решења за AZD
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Ученице кроз претраживач са MkDocs * DevContainer средином
- **📋 Шаблони**: [Microsoft Foundry шаблони](#ресурси-радионице)
- **📝 Примери**: [AZD примери деплојмента](examples/README.md)

#### Практичне вежбе
```bash
# Покрените своју прву вештачку интелигенцију
azd init --template azure-search-openai-demo
azd up

# Испробајте додатне шаблоне вештачке интелигенције
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат поглавља**: Поставити и конфигурисати AI подржану чат апликацију са RAG могућностима

**✅ Валидација успеха:**
```bash
# Након Поглавља 2, треба да будете у могућности да:
azd init --template azure-search-openai-demo
azd up
# Тестирате интерфејс за ћаскање са вештачком интелигенцијом
# Постављате питања и добијате одговоре покретане вештачком интелигенцијом са изворима
# Потврдите да интеграција претраге функционише
azd monitor  # Проверите да Application Insights приказује телеметрију
azd down --force --purge
```

**📊 Уложено време:** 1-2 сата  
**📈 Ниво вештине након:** Може поставити и конфигурисати продукцијске AI апликације  
**💰 Свесност трошкова:** Разумевање трошкова развоја од $80-150/месечно, трошкова продукције од $300-3500/месечно

#### 💰 Разматрања о трошковима за AI постављања

**Развојно окружење (Процењено $80-150/месечно):**
- Microsoft Foundry модели (плаћање по коришћењу): $0-50/месечно (у зависности од коришћења токена)
- AI претрага (базни ниво): $75/месечно
- Container Apps (конзумација): $0-20/месечно
- Чување (стандардно): $1-5/месечно

**Продукцијско окружење (Процењено $300-3,500+/месечно):**
- Microsoft Foundry модели (PTU за конзистентне перформансе): $3,000+/месечно ИЛИ плаћање по коришћењу за високе обиме
- AI претрага (стандардни ниво): $250/месечно
- Container Apps (посвећено): $50-100/месечно
- Application Insights: $5-50/месечно
- Чување (премиум): $10-50/месечно

**💡 Савети за оптимизацију трошкова:**
- Користите **Бесплатни ниво** Microsoft Foundry модела за учење (Azure OpenAI укључује 50,000 токена/месечно)
- Покрените `azd down` да декатализујете ресурсе када не развијате активно
- Почните са плаћањем по коришћењу, напредујте на PTU само за продукцију
- Користите `azd provision --preview` да процените трошкове пре пуштања у рад
- Омогућите ауто-скалирање: плаћајте само за стварно коришћење

**Праћење трошкова:**
```bash
# Проверите процењене месечне трошкове
azd provision --preview

# Пратите стварне трошкове у Azure порталу
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Поглавље 3: Конфигурација и аутентификација
**Преуслови**: Пређено Поглавље 1  
**Трајање**: 45-60 минута  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Конфигурација и управљање окружењем
- Најбоље праксе аутентификације и безбедности
- Именовање и организација ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Водич за конфигурацију](docs/chapter-03-configuration/configuration.md) - Подешавање окружења
- **🔐 Безбедност**: [Обрасци аутентификације и управљани идентитет](docs/chapter-03-configuration/authsecurity.md) - Обрасци аутентификације
- **📝 Примери**: [Пример базе података апликације](examples/database-app/README.md) - AZD примери за базу података

#### Практичне вежбе
- Конфигуришите више окружења (dev, staging, prod)
- Подесите управљану идентитетску аутентификацију
- Имплементирајте конфигурације специфичне за окружење

**💡 Резултат поглавља**: Управљање више окружења са исправном аутентификацијом и безбедношћу

---

### 🏗️ Поглавље 4: Инфраструктура као код и постављање
**Преуслови**: Пређене главе 1-3  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐⭐

#### Шта ћете научити
- Напредне стратегије постављања
- Infrastructure as Code помоћу Bicep-а
- Стратегија за провизионализацију ресурса

#### Ресурси за учење
- **📖 Постављање**: [Водич за постављање](docs/chapter-04-infrastructure/deployment-guide.md) - Комплетни радни токови
- **🏗️ Провизионализација**: [Provisioning ресурса](docs/chapter-04-infrastructure/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Пример Container App](../../examples/container-app) - Контенерска постављања

#### Практичне вежбе
- Креирајте прилагођене Bicep шаблоне
- Поставите мулти-сервисне апликације
- Имплементирајте blue-green стратегије постављања

**💡 Резултат поглавља**: Поставите комплексне мулти-сервисне апликације користећи прилагођене инфраструктурне шаблоне

---


### 🎯 Поглавље 5: Вишеагентна AI решења (Напредно)
**Претходни услови**: Поглавља 1-2 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Обрасци архитектуре више агената
- Оркестрација и координација агената
- Имплементације AI спремне за производњу

#### Ресурси за учење
- **🤖 Истакнути пројекат**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Комплетна имплементација
- **🛠️ ARM шаблони**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Једно-кликовно постављање
- **📖 Архитектура**: [Обрасци координације више агената](docs/chapter-06-pre-deployment/coordination-patterns.md) - Обрасци

#### Практичне вежбе
```bash
# Распоредите комплетно малопродајно решење са више агената
cd examples/retail-multiagent-arm-template
./deploy.sh

# Истражите конфигурације агената
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат поглавља**: Поставите и управљајте производно спремним вишеагентним AI решењем са агентима за кориснике и инвентар

---

### 🔍 Поглавље 6: Валидација и планирање пре постављања
**Претходни услови**: Поглавље 4 завршено  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије избора SKU
- Провере пре лансирања и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Избор**: [Избор SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Економични избори
- **✅ Валидација**: [Провере пре лансирања](docs/chapter-06-pre-deployment/preflight-checks.md) - Аутоматизовани скрипти

#### Практичне вежбе
- Покрените скрипте за валидацију капацитета
- Оптимизујте избор SKU-а ради уштеде
- Имплементирајте аутоматизоване провере пре постављања

**💡 Резултат поглавља**: Потврдите и оптимизујте постављања пре извршења

---

### 🚨 Поглавље 7: Решавање проблема и отклањање грешака
**Претходни услови**: Било које поглавље о постављању завршено  
**Трајање**: 1-1.5 сати  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематски приступи отклањању грешака
- Чести проблеми и решења
- решавање AI специфичних проблема

#### Ресурси за учење
- **🔧 Чести проблеми**: [Чести проблеми](docs/chapter-07-troubleshooting/common-issues.md) - Често постављана питања и решења
- **🕵️ Отклањање грешака**: [Водич за отклањање грешака](docs/chapter-07-troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 AI проблеми**: [Решавање AI проблема](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми AI сервиса

#### Практичне вежбе
- Дијагностика пропуста у постављању
- Решавање проблема са аутентификацијом
- Отклањање повезаности AI сервиса

**💡 Резултат поглавља**: Самостално дијагностиковати и решавати честе проблеме при постављању

---

### 🏢 Поглавље 8: Производни и пословни обрасци
**Претходни услови**: Поглавља 1-4 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије производног постављања
- Пословни безбедносни обрасци
- Надгледање и оптимизација трошкова

#### Ресурси за учење
- **🏭 Производња**: [Најбоље праксе за AI у производњи](docs/chapter-08-production/production-ai-practices.md) - Пословни обрасци
- **📝 Примери**: [Пример микросервиса](../../examples/microservices) - Комплексне архитектуре
- **📊 Надгледање**: [Интеграција Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Надгледање

#### Практичне вежбе
- Имплементирајте пословне безбедносне обрасце
- Подесите свеобухватно надгледање
- Поставите у производњу са правилним управљањем

**💡 Резултат поглавља**: Поставите апликације спремне за предузећа са пуном производном способношћу

---

## 🎓 Преглед радионице: Практично учење

> **⚠️ СТАТУС РАДИОНИЦЕ: Активан развој**  
> Материјали радионице тренутно се развијају и усавршавају. Основни модули су функционални, али неки напредни делови нису довршени. Активно радимо на комплетирању целокупног садржаја. [Пратите напредак →](workshop/README.md)

### Интерактивни материјали радионице
**Свеобухватно практично учење уз алате у претраживачу и вођене вежбе**

Наши материјали за радионицу пружају структуриран, интерактиван процес учења који допуњује горе наведени програм по поглављима. Радионица је дизајнирана за самостално учење и са наставником.

#### 🛠️ Карактеристике радионице
- **Интерфејс у претраживачу**: Потпуна радионица базе на MkDocs са претрагом, копирањем и опцијама тема
- **Интеграција GitHub Codespaces**: Једно-кликовно подешавање развојног окружења
- **Структурисани пут учења**: 8 вођених модула (укупно 3-4 сата)
- **Прогресивна методологија**: Увод → Избор → Валидација → Разлагање → Конфигурација → Прилагођавање → Рачунање → Закључак
- **Интерактивно DevContainer окружење**: Унапред конфигурисани алати и зависности

#### 📚 Структура модула радионице
Радионица следи **8-модулску прогресивну методологију** која вас води од откривања до мајсторства у постављању:

| Модул | Тема | Шта ћете радити | Трајање |
|--------|-------|----------------|----------|
| **0. Увод** | Преглед радионице | Разумејте циљеве учења, претходне услове и структуру радионице | 15 мин |
| **1. Избор** | Проналажење шаблона | Истражите AZD шаблоне и одаберите прави AI шаблон за ваш сценарио | 20 мин |
| **2. Валидација** | Постављање и провера | Поставите шаблон са `azd up` и потврдите да инфраструктура функционише | 30 мин |
| **3. Разлагање** | Разумевање структуре | Користите GitHub Copilot за истраживање архитектуре шаблона, Bicep фајлова и организације кода | 30 мин |
| **4. Конфигурација** | Детаљан увид у azure.yaml | Усавршите конфигурацију `azure.yaml`, животни циклус и променљиве окружења | 30 мин |
| **5. Прилагођавање** | Прилагођавање за вас | Омогућите AI претрагу, праћење, вредновање и прилагодите за ваш сценарио | 45 мин |
| **6. Рачунање** | Чишћење | Безбедно уклоните ресурсе помоћу `azd down --purge` | 15 мин |
| **7. Закључак** | Следећи кораци | Прегледајте постигнућа, кључне концепте и наставите учење | 15 мин |

**Ток радионице:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Почетак радионице
```bash
# Опција 1: GitHub Codespaces (Препоручено)
# Кликните „Code“ → „Create codespace on main“ у репозиторијуму

# Опција 2: Локални развој
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Пратите упутства за подешавање у workshop/README.md
```

#### 🎯 Резултати учења радионице
Завршетком радионице, учесници ће:
- **Постављати производне AI апликације**: Користити AZD са Microsoft Foundry услугама
- **Мастер инжењеринг вишеагентних архитектура**: Имплементирати координирана AI агентска решења
- **Имплементирати најбоље безбедносне праксе**: Подесити аутентификацију и контролу приступа
- **Оптимизовати за скалабилност**: Дизајнирати економична и перформансна решења
- **Решавати проблеме постављања**: Самостално отклонити уобичајене проблеме

#### 📖 Ресурси радионице
- **🎥 Интерактивни водич**: [Workshop Materials](workshop/README.md) - окружење за учење у претраживачу
- **📋 Упутства по модулима**:
  - [0. Увод](workshop/docs/instructions/0-Introduction.md) - Преглед радионице и циљеви
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Пронађите и одаберите AI шаблоне
  - [2. Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) - Поставите и проверите шаблоне
  - [3. Разлагање](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Истражите архитектуру шаблона
  - [4. Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) - Усавршите azure.yaml
  - [5. Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) - Прилагодите за ваш сценарио
  - [6. Рачунање](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очистите ресурсе
  - [7. Закључак](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следећи кораци
- **🛠️ AI лабораторија**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вежбе усмерене на AI
- **💡 Брзи почетак**: [Упутство за подешавање радионице](workshop/README.md#quick-start) - Конфигурација окружења

**Идеално за**: Корпоративну обуку, универзитетске курсеве, самостално учење и курсеве за програмере.

---

## 📖 Детаљан увид: Могућности AZD

Поред основа, AZD нуди моћне функције за производна постављања:

- **Постављања на бази шаблона** - Користите унапред направљене шаблоне за уобичајене апликационе обрасце
- **Инфраструктура као код** - Управљање Azure ресурсима коришћењем Bicep или Terraform  
- **Интегрисани токови рада** - Непрекидно провизионисање, постављање и надгледање апликација
- **Пријатељски према програмерима** - Оптимизовано за продуктивност и искуство програмера

### **AZD + Microsoft Foundry: Идеално за AI постављања**

**Зашто AZD за AI решења?** AZD решава главне изазове са којима се AI програмери сусрећу:

- **AI-шаблони спремни за употребу** - Унапред конфигурисани шаблони за Microsoft Foundry моделе, Azure AI услуге и ML радне оптерећења
- **Безбедна AI постављања** - Уграђени безбедносни обрасци за AI услуге, API кључеве и моделе  
- **Производни AI обрасци** - Најбоље праксе за скалабилна и економична AI решења
- **End-to-End AI токови рада** - Од развоја модела до производног постављања уз одговарајуће праћење
- **Оптимизација трошкова** - Паметне стратегије расподеле ресурса и скалирања за AI радне оптерећења
- **Интеграција Microsoft Foundry** - Непрекидна веза са Microsoft Foundry каталогом модела и ендпоинтима

---

## 🎯 Библиотека шаблона и примера

### Истакнуто: Microsoft Foundry шаблони
**Почните овде ако планирате постављање AI апликација!**

> **Напомена:** Ови шаблони показују различите AI обрасце. Неки су спољни Azure узорци, други су локалне имплементације.

| Шаблон | Поглавље | Комплексност | Услуге | Тип |
|----------|---------|------------|----------|------|
| [**Почните са AI чат-ом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Спољни |
| [**Почните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Спољни |
| [**Azure Search + OpenAI Демо**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Спољни |
| [**OpenAI Chat App Брзи почетак**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Спољни |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Спољни |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Спољни |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локални** |

### Истакнуто: Комплетни сценарији учења
**Шаблони апликација спремних за производњу везани за поглавља учења**

| Шаблон | Поглавље учења | Комплексност | Кључно за учење |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни AI обрасци постављања |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | Имплементација RAG са Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Поглавље 4 | ⭐⭐ | Интеграција интелигенције докумената |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Фрејмворк агената и позивање функција |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Оркестрација пословног AI-ја |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Вишеагентна архитектура са агентима за купце и инвентар |

### Учење по типу примера

> **📌 Локални vs. Спољни примери:**  
> **Локални примери** (у овом репозиторијуму) = Одмах спремни за употребу  
> **Спољни примери** (Azure узорци) = Клонирање са повезаних репозиторијума

#### Локални примери (одмах спремни)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Комплетна производно спремна имплементација са ARM шаблонима
  - Вишеагентна архитектура (агенти за купце и инвентар)
  - Свеобухватно надгледање и вредновање
  - Једно-кликовно постављање путем ARM шаблона

#### Локални примери - Контејнер апликације (Поглавља 2-5)
**Свеобухватни примери постављања контејнера у овом репозиторијуму:**

- [**Примери за Container App**](examples/container-app/README.md) - Комплетан водич за развођење контејнеризованих апликација  
  - [Једноставан Flask API](../../examples/container-app/simple-flask-api) - Основни REST API са скалирањем до нуле  
  - [Архитектура микросервиса](../../examples/container-app/microservices) - Спремно за продукцију мултисервисно развођење  
  - Брзи почетак, продукцијски и напредни модели развођења  
  - Надзор, безбедност и смернице за оптимизацију трошкова  

#### Спољни примери - Једноставне апликације (Поглавља 1-2)  
**Клонирајте ове Azure Samples репозиторијуме да почнете:**  
- [Једноставна веб апликација - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни модели развођења  
- [Статички сајт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Развођење статичког садржаја  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API развођење  

#### Спољни примери - Интеграција базе података (Поглавља 3-4)  
- [Апликација базе података - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Модели повезивања са базом података  
- [Функције + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ток података  

#### Спољни примери - Напредни модели (Поглавља 4-8)  
- [Java микросервиси](https://github.com/Azure-Samples/java-microservices-aca-lab) - Мултисервисне архитектуре  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Обрада у позадини  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Спремни ML модели за продукцију  

### Колекције спољних шаблона  
- [**Званична галерија AZD шаблона**](https://azure.github.io/awesome-azd/) - Изабрана колекција званичних и заједничких шаблона  
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn документација за шаблоне  
- [**Директоријум примера**](examples/README.md) - Локални примери за учење са детаљним објашњењима  

---

## 📚 Ресурси за учење и референце  

### Брзе референце  
- [**Командни лист**](resources/cheat-sheet.md) - Основне azd команде организоване по поглављима  
- [**Глосар**](resources/glossary.md) - Термини из Azure и azd  
- [**Често постављана питања**](resources/faq.md) - Честа питања организована по поглављима за учење  
- [**Водич за учење**](resources/study-guide.md) - Обимне практичне вежбе  

### Практични радионици  
- [**AI радионица**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Учини своја AI решења спремним за AZD развођење (2-3 сата)  
- [**Интерактивна радионица**](workshop/README.md) - Водич кроз 8 модула са MkDocs и GitHub Codespaces  
  - Следи: Увод → Избор → Валидација → Декомпозиција → Конфигурација → Прилагођавање → Демонтажа → Завршетак  

### Спољни ресурси за учење  
- [Документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Калкулатор цена Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Azure статус](https://status.azure.com/)  

### Вештине AI агента за ваш уређивач  
- [**Microsoft Azure вештине на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворених вештина агената за Azure AI, Foundry, развођење, дијагностику, оптимизацију трошкова и више. Инсталишите их у GitHub Copilot, Cursor, Claude Code или било који подржани агент:  
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
# Виндоус (ПајерШел):
winget install microsoft.azd

# маЦОС:
brew tap azure/azd && brew install azd

# Линукс:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Потврдите инсталацију
azd version
```
</details>

<details>
<summary><strong>❌ "Није пронађена претплата" или "Претплата није постављена"</strong></summary>

```bash
# Прикажи расположиве претплате
az account list --output table

# Постави подразумевану претплату
az account set --subscription "<subscription-id-or-name>"

# Постави за AZD окружење
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Верификуј
az account show
```
</details>

<details>
<summary><strong>❌ "Недовољна квота" или "Прекорачење квоте"</strong></summary>

```bash
# Покушајте другу Azure регију
azd env set AZURE_LOCATION "westus2"
azd up

# Или користите мање SKU-ове у развоју
# Уреди infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" не успева на пола пута</strong></summary>

```bash
# Опција 1: Очисти и покушај поново
azd down --force --purge
azd up

# Опција 2: Само исправи инфраструктуру
azd provision

# Опција 3: Проверите детаљан статус
azd show

# Опција 4: Проверите записе у Azure Monitor-у
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Аутентификација није успела" или "Токен је истекао"</strong></summary>

```bash
# Поново се аутентификујте за AZD
azd auth logout
azd auth login

# Опционо: освежите и Azure CLI ако користите az наредбе
az logout
az login

# Потврдите аутентификацију
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс већ постоји" или конфликти у именовању</strong></summary>

```bash
# AZD генерише јединствена имена, али ако дође до конфликта:
azd down --force --purge

# Онда покушај поново са новим окружењем
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Развођење шаблона траје предуго</strong></summary>

**Нормално време чекања:**  
- Једноставна веб апликација: 5-10 минута  
- Апликација са базом података: 10-15 минута  
- AI апликације: 15-25 минута (пружање OpenAI је споро)  

```bash
# Провери напредак
azd show

# Ако сте заглавили више од 30 минута, провери Azure портал:
azd monitor --overview
# Потражи неуспеле распореде
```
</details>

<details>
<summary><strong>❌ "Дозвола одбијена" или "Забрањено"</strong></summary>

```bash
# Проверите вашу Azure улогу
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Потребна вам је најмање улога "Contributor"
# Затражите од вашег Azure администратора да додели:
# - Contributor (за ресурсе)
# - User Access Administrator (за доделе улога)
```
</details>

<details>
<summary><strong>❌ Не могу пронаћи URL развођене апликације</strong></summary>

```bash
# Прикажи све крајње тачке услуга
azd show

# Или отвори Azure портал
azd monitor

# Проверите специфичну услугу
azd env get-values
# Потражите *_URL променљиве
```
</details>

### 📚 Комплетни ресурси за решавање проблема  

- **Водич за честе проблеме:** [Детаљна решења](docs/chapter-07-troubleshooting/common-issues.md)  
- **AI-специфични проблеми:** [AI решавање проблема](docs/chapter-07-troubleshooting/ai-troubleshooting.md)  
- **Водич за дебаговање:** [Дебаговање корак по корак](docs/chapter-07-troubleshooting/debugging.md)  
- **Добијте помоћ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🎓 Завршетак курса и сертификат  

### Праћење напретка  
Пратите свој напредак кроз сва поглавља:  

- [ ] **Поглавље 1**: Основе и брзи почетак ✅  
- [ ] **Поглавље 2**: Развој фокусиран на AI ✅  
- [ ] **Поглавље 3**: Конфигурација и аутентикација ✅  
- [ ] **Поглавље 4**: Infrastructure as Code и развођење ✅  
- [ ] **Поглавље 5**: Мулти-агент AI решења ✅  
- [ ] **Поглавље 6**: Предразвођење, валидација и планирање ✅  
- [ ] **Поглавље 7**: Решавање проблема и дебаговање ✅  
- [ ] **Поглавље 8**: Продукцијски и ентерпрајс модели ✅  

### Потврда учења  
Након сваког поглавља, потврдите своје знање тако што ћете:  
1. **Практична вежба**: Завршити практично развођење из поглавља  
2. **Провера знања**: Прегледати FAQ одељак за то поглавље  
3. **Заједничка дискусија**: Поделити искуство у Azure Discord заједници  
4. **Следеће поглавље**: Наставити на следећи ниво сложености  

### Предности завршетка курса  
Након завршетка свих поглавља добићете:  
- **Искуство у продукцији**: Развожене стварне AI апликације у Azure  
- **Професионалне вештине**: Капацитети за развођење спремни за ентерпрајс  
- **Признање заједнице**: Активни члан Azure развојне заједнице  
- **Напредовање у каријери**: Потраживе AZD и AI експертизе за развођење  

---

## 🤝 Заједница и подршка  

### Добијте помоћ и подршку  
- **Технички проблеми**: [Пријавите грешке и затражите функције](https://github.com/microsoft/azd-for-beginners/issues)  
- **Питања о учењу**: [Microsoft Azure Discord заједница](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **AI-специфична помоћ**: Придружите се [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Документација**: [Званична документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Увид из Microsoft Foundry Discord заједнице  

**Резултати недавне анкете из #Azure канала:**  
- **45%** програмера жели да користи AZD за AI радне задатке  
- **Највећи изазови**: Мултисервисно развођење, управљање акредитивима, спремност за продукцију  
- **Најчешће захтевано**: AI-специфични шаблони, водичи за решавање проблема, најбоље праксе  

**Придружите се нашој заједници да:**  
- Поделите своја искуства са AZD + AI и добијте помоћ  
- Приступите раним прегледима нових AI шаблона  
- Допринесите најбољим праксама за AI развођење  
- Утичу на будући развој AI + AZD функција  

### Допринос курсу  
Добро дошли су доприноси! Молимо прочитајте наш [Водич за допринос](CONTRIBUTING.md) за детаље о:  
- **Унапређење садржаја**: Побољшајте постојећа поглавља и примере  
- **Нови примери**: Додајте стварне сценарије и шаблоне  
- **Превод**: Помозите одржавању вишезначне подршке  
- **Пријаве грешака**: Побољшајте прецизност и јасноћу  
- **Стандарди заједнице**: Пратите наше инклузивне смернице заједнице  

---

## 📄 Информације о курсу  

### Лиценца  
Овај пројекат је лиценциран под MIT лиценцом - види [LICENSE](../../LICENSE) фајл за детаље.  

### Повезани ресурси за учење Microsoft-а  

Наш тим производи и друге обухватне курсеве за учење:  

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
[![AI Агенти за почетнике](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---
 
### Сертификована серија Генеративног AI  
[![Генеративни AI за почетнике](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Генеративни AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![Генеративни AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно учење
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Сериија Копилот
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигација курса

**🚀 Спремни за почетак учења?**

**Почетници**: Почните са [Поглавље 1: Основа и брз почетак](#-chapter-1-foundation--quick-start)  
**AI програмери**: Преходите на [Поглавље 2: AI-прво развијање](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Искуствени програмери**: Почните са [Поглавље 3: Конфигурација и аутентификација](#️-chapter-3-configuration--authentication)

**Следећи кораци**: [Почните Поглавље 1 - AZD Основе](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->