# AZD За Почетнике: Структурисано Путовање Учeња

![AZD-for-beginners](../../translated_images/sr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Аутоматизовани Преводи (Увек Ажурни)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](./README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Више волите да клонирате локално?**
>
> Овај репозиторijум укључује преводе на више од 50 језика што значајно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
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
> Ово вам даје све што вам је потребно да завршите курс много брже са преузимањем.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Шта је ново у azd данас

> 📌 **AI CLI преглед издања (2026-11-04):** Упутства су проверена у односу на објављену документацију/извор **`azd 1.37.2`**, **agents `1.0.0-beta.23`**, и **evaluations `1.0.0-beta.2`**. Користите `azd >= 1.37.0` за комбиновани ток рада. Покрените `azd version` и [ажурирајте основни CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) пре проширења. Погледајте [промене и исправке издања](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ово није валидација уживо целог курса.

Azure Developer CLI подржава многе типове апликација, укључујући веб апликације, API-је и AI агенте, кроз подржане хостове, шаблоне и екстензије.

Ево шта то значи за вас:

- **AI агенти су сада примарни azd задаци.** Можете иницијализовати, распоредити и управљати AI агент пројектима користећи исти `azd init` → `azd up` ток рада који већ познајете.
- **Животни циклус агента широм два проширења.** Користите `azure.ai.agents` за иницијализацију, позивање, оптимизацију и пензионисање агената. Инсталирајте **`azure.ai.evaluations`** одвојено за `azd ai eval init`, `generate` и `run start`. Агенти beta.22 су заменили стари ток рада оцењивања и променили конфигурацију оптимизације; пратите [водич за миграцију](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Више AI грађевинских блокова.** Нова preview проширења—`azure.ai.skills` и `azure.ai.connections`—омогућавају управљање поново употребљивим вештинама агената и Foundry везама директно са azd.
- **Интеграција Microsoft Foundry** доноси распоређивање модела, хостинг агената и конфигурацију AI сервиса директно у azd екосистем шаблона.
- **Гладније свакодневне основе.** Недавна издања су учинила `azd init` идемпотентним (безбедним за поновно покретање), аутоматски уклањају застареле токене при `azd auth login` и додала пријатељски `azd tool` упит за прву поставку.
- **Основни ток рада није се променио.** Било да распоређујете todo апликацију, микросервис или мулти-аgент AI решење, команде су исте.

> **Напомена за Aspire кориснике:** Microsoft сада производ назива једноставно **Aspire** (раније ".NET Aspire"). Подршка za azd Aspire није промењена—само је име ажурирано.

Ако сте раније користили azd, AI подршка је природно проширење—не посебан алат или напредна стаза. Ако почињете од почетка, научићете један ток рада који важи за све.

---

## 🚀 Шта је Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** је пријатељски алат у командној линији који поједностављује распоређивање апликација на Azure. Уместо ручног креирања и повезивања десетина Azure ресурса, можете распоредити целе апликације једном командом.

### Магија `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Шаблон пружа конфигурацију апликације и инфраструктуре. Успешно распоређивање још увек захтева подржане услуге/моделе, довољне квоте и дозволе, тачне уносе и верификацију распоређене апликације. `azd up` аутоматски не чини шаблон сигурним, усклађеним или спремним за продукцију.

---

## ❓ Azure Developer CLI у односу на Azure CLI: Која је разлика?

Ово је најчешће питање које почетници постављају. Ево једноставног одговора:

| Особина | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Сврха** | Управљање појединачним Azure ресурсима | Распоређивање комплетних апликација |
| **Начин размишљања** | Фокусиран на инфраструктуру | Фокусиран на апликацију |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крива учења** | Морате познавати Azure услуге | Само познајете вашу апликацију |
| **Најпогодније за** | DevOps, инфраструктуру | Програмере, прототиповање |

### Једноставна Аналогија

- **Azure CLI** је као да имате све алате за изградњу куће – чекиће, тестере, ексере. Можете изградити шта год желите, али морате знати грађевинарство.
- **Azure Developer CLI** је као да ангажујете извођача радова – описујете шта желите, а они се брину о изградњи.

### Када Користити Који

| Сценарио | Користите Ово |
|----------|----------|
| "Желим брзо да распоредим моју веб апликацију" | `azd up` |
| "Треба ми само да креирам налог за складиштење" | `az storage account create` |
| "Градим целу AI апликацију" | `azd init --template azure-search-openai-demo` |
| "Треба ми да отклоним грешку на одређеном Azure ресурсу" | `az resource show` |
| "Желим да распоредим у моје конфигурисано продукцијско окружење" | Прегледајте конфигурацију, приступ, трошкове и оперативне капије пре `azd up --environment production` |

### Они Раде Заједно!

AZD и Azure CLI имају посебну аутентификацију и конфигурацију. Користите `azd auth login` за AZD, а `az login` када је хук или дијагностичка команда посебно потребна Azure CLI. Можете користити оба:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Пронађите Шаблоне у Awesome AZD

Немојте почети од празно! **Awesome AZD** је заједница колекција спремних за распоређивање шаблона:

| Ресурс | Опис |
|----------|-------------|
| 🔗 [**Awesome AZD Галерија**](https://azure.github.io/awesome-azd/) | Прегледајте 200+ шаблона са распоређивањем једним кликом |
| 🔗 [**Пошаљите Шаблон**](https://github.com/Azure/awesome-azd/issues) | Допринесите свој шаблон заједници |
| 🔗 [**GitHub Репозиторијум**](https://github.com/Azure/awesome-azd) | Оцени и истражи извор |

### Популарни AI Шаблони из Awesome AZD

Изаберите један шаблон у сопственом празном директоријуму; наредбе испод су алтернативе. Задњи `.` иницијализује тај директоријум.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Почните у 3 корака

Пре него што почнете, уверите се да је ваш рачунар спреман за шаблон који желите да распоредите:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ако било која обавезна провера не успе, прво исправите то, а затим наставите са брзим почетком.

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
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Ако нисте сигурни који вам је потребан, пратите цео ток поставке у [Инсталација и Постављање](docs/chapter-01-foundation/installation.md#authentication-setup).

### Корак 3: Распоредите Прву Апликацију

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 То је то!** Ваша апликација је сада уживо на Azure.

### Очистите (Не Заборавите!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Како Користити Овај Курс

Овај курс је дизајниран за **прогресивно учење** - почните тамо где сте пријатни и радите напред:

| Ваше Искуство | Почните Овде |
|-----------------|------------|
| **Апсолутни почетник у Azure** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Познајем Azure, нов сам у AZD** | [Поглавље 1: Основа](#-chapter-1-foundation--quick-start) |
| **Желим да распоређујем AI апликације** | [Поглавље 2: AI-прво развој](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Желим практичне вежбе** | [🎓 Интерективна радионица](workshop/README.md) - вођена лабораторија 3-4 сата |
| **Требају ми продукцијски шаблони** | [Поглавље 8: Продукција и предузеће](#-chapter-8-production--enterprise-patterns) |

### Брза Поставка

1. **Форк овог репозиторијума**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте га**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Затражите помоћ**: [Azure Discord Заједница](https://discord.com/invite/ByRwuEEgH4)

> **Више волите да клонирате локално?**

> Овај репозиторijум укључује преводе на више од 50 језика што значајно повећава величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ово вам даје све што вам је потребно да завршите курс много брже са преузимањем.


## Преглед Курса

Савладајте Azure Developer CLI (azd) кроз структурирана поглавља дизајнирана за прогресивно учење. **Посебан фокус на развој AI апликација са интеграцијом Microsoft Foundry.**

### Зашто је овај курс битан за модерне програмере

Програмери који имплементирају AI радне задатке често требају смернице о:
- Комплексним мулти-службеним AI архитектурама
- Најбољим праксама у производном развоју AI
- Интеграцији и конфигурацији Azure AI услуга
- Оптимизацији трошкова AI радних задатака
- Решавању проблема специфичних за AI имплементације

### Циљеви учења

Завршетком овог структурираног курса ћете:
- **Мастер основа AZD**: Основни појмови, инсталација и конфигурација
- **Имплементирати AI апликације**: Користите AZD са Microsoft Foundry услугама
- **Применити Infrastructure as Code**: Управљајте Azure ресурсима помоћу Bicep шаблона
- **Дијагностиковати проблеме са имплементацијом**: Решавање уобичајених проблема и дебаговање
- **Оптимизовати за производњу**: Безбедност, скалирање, мониторинг и управљање трошковима
- **Изградити мулти-агентска решења**: Имплементација комплексних AI архитектура

## Пре него што почнете: Налози, приступ и претпоставке

Пре него што започнете Прво поглавље, уверите се да имате следеће. Кораци инсталације касније у овом водичу претпостављају да су ове основе већ решене.

- **Azure претплата**: Можете користити постојећу претплату са посла или свој лични налог, или креирати [бесплатну пробну претплату](https://aka.ms/azurefreetrial) за почетак.
- **Дозвола за креирање Azure ресурса**: За већину вежби треба да имате барем приступ **Contributor** на целној претплати или ресурсној групи. Нека поглавља такође могу подразумевати да можете креирати ресурсне групе, управљане идентитете и RBAC доделе.
- [**GitHub налог**](https://github.com): Ово је корисно за форковање репозиторијума, праћење сопствених измена и коришћење GitHub Codespaces за радионицу.
- **Претпоставке за извршавање шаблона**: Неки шаблони захтевају локалне алате као што су Node.js, Python, Java или Docker. Покрените валидатор пре почетка како бисте рано открили недостајуће алате.
- **Основно познавање терминала**: Не морате бити експерт, али треба да се осећате удобно при покретању команди као што су `git clone`, `azd auth login` и `azd up`.

> **Радите у корпоративној претплати?**
> Ако ваш Azure окружење управља администратор, потврдите унапред да можете имплементирати ресурсе у претплату или ресурсну групу коју планирате да користите. У супротном, затражите sandbox претплату или приступ Contributor пре него што почнете.

> **Нови сте у Azure?**
> Почните са својом Azure пробном или плаћај-по-коришћењу претплатом на https://aka.ms/azurefreetrial да бисте могли да завршите вежбе од почетка до краја без чекања на одобрења на нивоу tenant-а.

## 🗺️ Мапа курса: Брза навигација по поглављима

Свако поглавље има посебан README са циљевима учења, брзим почецима и вежбама:

| Поглавље | Тема | Лекције | Трајање | Комплексност |
|---------|-------|---------|----------|------------|
| **[Погл. 1: Основа](docs/chapter-01-foundation/README.md)** | Почетак рада | [Основе AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталација](docs/chapter-01-foundation/installation.md) &#124; [Први пројекат](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Погл. 2: AI развој](docs/chapter-02-ai-development/README.md)** | AI-прве апликације | [Foundry интеграција](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Деплоy модела](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Радионица](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 сата | ⭐⭐ |
| **[Погл. 3: Конфигурација](docs/chapter-03-configuration/README.md)** | Аутентификација и сигурност | [Конфигурација](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификација и сигурност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Погл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и имплементација | [Водич за имплементацију](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провизионисање](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 сати | ⭐⭐⭐ |
| **[Погл. 5: Мулти-Агент](docs/chapter-05-multi-agent/README.md)** | AI агентска решења | [Ритейл сценарио](examples/retail-scenario.md) &#124; [Обрасци координације](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[Погл. 6: Пред-имплементација](docs/chapter-06-pre-deployment/README.md)** | Планирање и валидација | [Провере пре лета](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор SKU-а](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 сат | ⭐⭐ |
| **[Погл. 7: Решавање проблема](docs/chapter-07-troubleshooting/README.md)** | Дебаг и поправка | [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Дебаговање](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI проблеми](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 сати | ⭐⭐ |
| **[Погл. 8: Производња](docs/chapter-08-production/README.md)** | Ентерпрајс обрасци | [Производне праксе](docs/chapter-08-production/production-ai-practices.md) | 2-3 сата | ⭐⭐⭐⭐ |
| **[🎓 Радионица](workshop/README.md)** | Практична лабораторија | [Увод](workshop/docs/instructions/0-Introduction.md) &#124; [Избор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Расчланjивање](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Демонтажа](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Завршетак](workshop/docs/instructions/7-Wrap-up.md) | 3-4 сата | ⭐⭐ |

**Укупно трајање курса:** ~10-14 сати | **Надоградња вештина:** Почетник → Спреман за производњу

---

## 📚 Поглавља за учење

*Изаберите свој пут учења у зависности од нивоа искуства и циљева*

### 🚀 Поглавље 1: Основа и брзи почетак
**Претпоставке**: Azure претплата, основно познавање командне линије  
**Трајање**: 30-45 минута  
**Комплексност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталацију AZD на вашој платформи
- Прву успешну имплементацију

#### Ресурси за учење
- **🎯 Почните овде**: [Шта је Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Теорија**: [Основе AZD](docs/chapter-01-foundation/azd-basics.md) - Основни појмови и терминологија
- **⚙️ Подешавање**: [Инсталација и подешавање](docs/chapter-01-foundation/installation.md) - Водичи по платформама
- **🛠️ Практично**: [Први пројекат](docs/chapter-01-foundation/first-project.md) - Туторијал корак по корак
- **📋 Брзи преглед**: [Листу команди](resources/cheat-sheet.md)

#### Практичне вежбе
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Резултат поглавља**: Успешно имплементирајте једноставну веб апликацију на Azure користећи AZD

**✅ Верификација успеха:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Време потребно:** 30-45 минута  
**📈 Ниво вештина након:** Може самостално имплементирати основне апликације

---

### 🤖 Поглавље 2: AI-први развој (Препоручено за AI програмере)
**Претпоставке**: Завршено Поглавље 1  
**Трајање**: 1-2 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Интеграција Microsoft Foundry са AZD
- Имплементација AI-погонских апликација
- Разумевање AI конфигурација услуга

#### Ресурси за учење
- **🎯 Почните овде**: [Microsoft Foundry интеграција](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [Водич за AI агенте](docs/chapter-02-ai-development/agents.md) - Имплементирајте интелигентне агенте са AZD
- **📖 Обрасци**: [Имплементација AI модела](docs/chapter-02-ai-development/ai-model-deployment.md) - Деплоy и управљање AI моделима
- **🛠️ Радионица**: [AI радионички лабораториј](docs/chapter-02-ai-development/ai-workshop-lab.md) - Припремите своја AI решења за AZD
- **🎥 Интеркативни водич**: [Материјали радионице](workshop/README.md) - Учите у прегледачу са MkDocs * DevContainer окружењем
- **📋 Шаблони**: [Microsoft Foundry шаблони](#featured-microsoft-foundry-templates)
- **📝 Примери**: [AZD примери имплементације](examples/README.md)

#### Практичне вежбе
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Резултат поглавља**: Имплементирајте и конфигуришите AI-усмерену чет апликацију са RAG функционалностима

**✅ Верификација успеха:**
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

**📊 Време потребно:** 1-2 сата  
**📈 Ниво вештина након:** Може имплементирати AI учељне апликације и идентификовати додатне захтеве за спремност за производњу
**💰 Свесност о трошковима:** Разумевање развојних трошкова од $80-150 месечно и производних трошкова од $300-3500 месечно

#### 💰 Разматрања трошкова за AI имплементације

**Развојно окружење (процењено $80-150/месец):**
- Microsoft Foundry модели (плаћај-по-коришћењу): $0-50/месец (зависно од коришћења токена)
- AI Search (основни ниво): $75/месец
- Container Apps (конзумација): $0-20/месец
- Складиштење (стандардно): $1-5/месец

**Производно окружење (процењено $300-3.500+/месец):**
- Microsoft Foundry модели (PTU за константан учинак): $3.000+/месец ИЛИ плаћај-по-коришћењу са великим обимом
- AI Search (стандардни ниво): $250/месец
- Container Apps (посвећено): $50-100/месец
- Application Insights: $5-50/месец
- Складиштење (премијум): $10-50/месец

**💡 Савети за оптимизацију трошкова:**
- Проверите цене за inference модела и кредите специфичне за налог; Azure OpenAI не укључује универзалну месечну бесплатну квоту од 50.000 токена
- Покрените `azd down` да избришете ресурсе када више нису потребни, након прегледа изабраног окружења
- Започните са плаћањем по конзумацији, надоградите на PTU само за производњу
- Користите `azd provision --preview` да прегледате планирану инфраструктуру, затим процените цену ресурса уз помоћ Azure Pricing Calculator
- Омогућите аутоматско скалирање: плаћајте само за стварну употребу

**Мониторинг трошкова:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Поглавље 3: Конфигурација и аутентификација
**Претпоставке**: Завршено Поглавље 1  
**Трајање**: 45-60 минута  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Конфигурацију и управљање окружењем
- Најбоље праксе аутентификације и безбедности
- Именовање и организацију ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Водич за конфигурацију](docs/chapter-03-configuration/configuration.md) - Подешавање окружења
- **🔐 Сигурност**: [Обрасци аутентификације и управљани идентитет](docs/chapter-03-configuration/authsecurity.md) - Обрасци аутентификације
- **📝 Примери**: [Пример базе података](examples/database-app/README.md) - AZD бази података примери

#### Практичне вежбе
- Конфигуришите више окружења (dev, staging, prod)
- Подесите аутентификацију управљаног идентитета
- Имплементирајте конфигурације специфичне за окружење

**💡 Резултат поглавља**: Управљајте више окружења са исправном аутентификацијом и безбедношћу

---

### 🏗️ Поглавље 4: Инфраструктура као код и имплементација
**Претпоставке**: Завршена Поглавља 1-3  
**Трајање**: 1-1.5 сати  
**Комплексност**: ⭐⭐⭐

#### Шта ћете научити
- Напредни обрасци имплементације
- Инфраструктура као код са Bicep-ом
- Стратегије припреме ресурса

#### Ресурси за учење
- **📖 Имплементација**: [Водич за имплементацију](docs/chapter-04-infrastructure/deployment-guide.md) - Комплетни радни токови
- **🏗️ Провизионисање**: [Управљање ресурсима](docs/chapter-04-infrastructure/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Пример Container App-а](../../examples/container-app) - Контенеризоване имплементације

#### Практичне вежбе
- Направите прилагођене Bicep шаблоне
- Имплементирајте мултисервисне апликације
- Примените blue-green стратегије имплементације

**💡 Резултат поглавља**: Имплементирајте комплексне мултисервисне апликације коришћењем прилагођених инфраструктурних шаблона

---

### 🎯 Поглавље 5: Мулти-Агент AI решења (Напредно)
**Претпоставке**: Завршена Поглавља 1-2  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Обрасци мулти-агентске архитектуре
- Организација и координација агената
- Спремна за производњу AI имплементација

#### Ресурси за учење
- **🤖 Представљени дизајн**: [Мулти-Агент решење за трговину](examples/retail-scenario.md) - План архитектуре, није потпуна апликација
- **🛠️ ARM шаблони**: [Пакет ARM шаблона](../../examples/retail-multiagent-arm-template) - Инфраструктурна основа; преглед предуслова и недостајућих компоненти апликације
- **📖 Архитектура**: [Обрасци сарадње више агената](docs/chapter-06-pre-deployment/coordination-patterns.md) - Обрасци

#### Практичне вежбе
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат поглавља**: Разумети дизајн више агената и идентификовати радове имплементације, валидације и операције који су потребни изван инфраструктурне основе

---

### 🔍 Поглавље 6: Предпремна валидација и планирање
**Предуслови**: Поглавље 4 завршено  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије одабира SKU
- Пре-летећи прегледи и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Одабир**: [Одабир SKU-а](docs/chapter-06-pre-deployment/sku-selection.md) - Исплативи избори
- **✅ Валидација**: [Пре-летећи прегледи](docs/chapter-06-pre-deployment/preflight-checks.md) - Аутоматизовани скрипти

#### Практичне вежбе
- Покрените скрипте за валидацију капацитета
- Оптимизујте одабир SKU-а у складу са трошковима
- Имплементирајте аутоматизоване претходне провере пре припреме

**💡 Резултат поглавља**: Валидација и оптимизација распореда пре извршења

---

### 🚨 Поглавље 7: Решавање проблема и дебаговање
**Предуслови**: Завршено било које поглавље о припреми  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематичне методе дебаговања
- Уобичајени проблеми и решења
- Решавање проблема специфичних за вештачку интелигенцију

#### Ресурси за учење
- **🔧 Уобичајени проблеми**: [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) - Често постављана питања и решења
- **🕵️ Дебаговање**: [Водич за дебаговање](docs/chapter-07-troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 AI проблеми**: [Решавање проблема везаних за AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми везани за AI сервисе

#### Практичне вежбе
- Дијагностикујте неуспехе распореда
- Решите проблеме са аутентификацијом
- Дебагујте повезаност AI сервиса

**💡 Резултат поглавља**: Самостално дијагностиковање и решавање уобичајених проблема распореда

---

### 🏢 Поглавље 8: Обрасци за производњу и предузећа
**Предуслови**: Поглавља 1-4 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије распореда за производњу
- Обрасци безбедности у предузећима
- Мониторинг и оптимизација трошкова

#### Ресурси за учење
- **🏭 Производња**: [Најбоље праксе за AI у производњи](docs/chapter-08-production/production-ai-practices.md) - Обрасци за предузећа
- **📝 Примери**: [Пример микросервиса](../../examples/microservices) - Комплексне архитектуре
- **📊 Мониторинг**: [Интеграција са Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практичне вежбе
- Имплементирајте обрасце безбедности за предузећа
- Поставите свеобухватни мониторинг
- Распоредите у производном окружењу са адекватном контролом

**💡 Резултат поглавља**: Распоредите апликације спремне за предузећа са потпуним производним капацитетима

---

## 🎓 Преглед радионице: Практично искуство учења

> **⚠️ СТАЊЕ РАДИОНИЦЕ: Активни развој**  
> Материјали радионице су тренутно у развоју и усавршавању. Основни модули су функционални, али неки напредни делови су непотпуни. Активно радимо на завршетку свега. [Пратите напредак →](workshop/README.md)

### Интерактивни материјали радионице
**Свеобухватно практично учење са алатима у претраживачу и вођеним вежбама**

Наши материјали радионице обезбеђују структуиран, интерактиван процес учења који допуњује горе наведени наставни план по поглављима. Радионица је дизајнирана за самостално учење и вођене сесије.

#### 🛠️ Карактеристике радионице
- **Интерфејс у претраживачу**: Комплетна радионица покретана кроз MkDocs са претрагом, копирањем и темама
- **Интеграција са GitHub Codespaces**: Једнокликовна конфигурација развојног окружења
- **Структурирани пут учења**: 8 модулa вођених вежби (укупно 3-4 сата)
- **Прогресивна методологија**: Увод → Одабир → Валидација → Разлагање → Конфигурација → Прилагођавање → Распрема → Завршетак
- **Интерактивно ДевКонтејнер окружење**: Предконфигурисани алати и зависности

#### 📚 Структура модула радионице
Радионица прати **8-модулску прогресивну методологију** која вас води од упознавања до мајсторства у распоредењу:

| Модул | Тема | Шта ћете радити | Трајање |
|--------|-------|----------------|----------|
| **0. Увод** | Преглед радионице | Разумети циљеве учења, предуслове и структуру радионице | 15 мин |
| **1. Одабир** | Проналажење шаблона | Истражите AZD шаблоне и изаберите прави AI шаблон за ваш сценарио | 20 мин |
| **2. Валидација** | Распоред и проверa | Распоредите шаблон са `azd up` и проверите инфраструктуру | 30 мин |
| **3. Разлагање** | Разумевање структуре | Користите GitHub Copilot за истраживање архитектуре шаблона, Bicep датотека и организације кода | 30 мин |
| **4. Конфигурација** | дубинска анализа azure.yaml | Мастерирање конфигурације `azure.yaml`, hooks за животни циклус и променљиве окружења | 30 мин |
| **5. Прилагођавање** | Прилагодите га себи | Омогућите AI претрагу, праћење, евалуацију и прилагодите за ваш сценарио | 45 мин |
| **6. Распрема** | Чишћење | Безбедно уклањање ресурса помоћу `azd down --purge` | 15 мин |
| **7. Завршетак** | Следећи кораци | Преглед достигнућа, кључних концепата и наставак учења | 15 мин |

**Проток радионице:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Почетак радионице
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Резултати учења радионице
Завршетком радионице, учесници ће:
- **Распоређивати AI апликације за производњу**: Користити AZD са Microsoft Foundry сервисима
- **Мастерирати архитектуре више агената**: Имплементирати координисане AI агентске решења
- **Имплементирати најбоље праксе безбедности**: Конфигурисати аутентификацију и контролу приступа
- **Оптимизовати за скалабилност**: Дизајнирати исплативе, перформантне распореде
- **Решавати проблеме у распореду**: Самостално решавати уобичајене проблеме

#### 📖 Ресурси радионице
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Учени окружење у претраживачу
- **📋 Упутства модула по модул**:
  - [0. Увод](workshop/docs/instructions/0-Introduction.md) - Преглед радионице и циљеви
  - [1. Одабир](workshop/docs/instructions/1-Select-AI-Template.md) - Пронађите и изаберите AI шаблоне
  - [2. Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) - Распоредите и проверите шаблоне
  - [3. Разлагање](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Истражите архитектуру шаблона
  - [4. Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) - Усавршите azure.yaml
  - [5. Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) - Прилагодите за ваш сценарио
  - [6. Распрема](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очистите ресурсе
  - [7. Завршетак](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следећи кораци
- **🛠️ AI лабораторија радионице**: [AI лабораторија радионице](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вежбе фокусиране на AI
- **💡 Брзи почетак**: [Водич за постављање радионице](workshop/README.md#browser-based-guide) - Конфигурација окружења

**Идеално за**: Корпоративну обуку, универзитетске курсеве, самостално истраживање и програме за развој програмера.

---

## 📖 Дубински преглед: могућности AZD

Поред основа, AZD нуди моћне могућности за производне распореде:

- **Шаблонски распореди** - Коришћење унапред направљених шаблона за уобичајене образце апликација
- **Инфраструктура као код** - Управљање Azure ресурсима помоћу Bicep или Terraforma  
- **Интегрисани токови рада** - Беспрекорно провизионисање, распореде и мониторинг апликација
- **Пријатељски према програмерима** - Оптимизовано за продуктивност и искуство програмера

### **AZD + Microsoft Foundry: Идеално за AI распореде**

**Зашто AZD за AI решења?** AZD решава главне изазове са којима се сусрећу AI програмери:

- **AI-спремни шаблони** - Предконфигурисани шаблони за Microsoft Foundry моделе, Azure AI сервисе и ML радне захтеве
- **Безбедни AI распореди** - Уграђени обрасци безбедности за AI сервисе, API кључеве и крајње тачке модела  
- **Обрасци производње AI** - Најбоље праксе за скалабилне и исплативе распореде AI апликација
- **Крај-до-крај AI токови рада** - Од развоја модела до распореда у производњи са одговарајућим мониторингом
- **Оптимизација трошкова** - Интелигентна алокација ресурса и стратегије скалирања за AI радне захтеве
- **Интеграција са Microsoft Foundry** - Беспрекорна веза са каталогом Microsoft Foundry модела и крајњим тачкама

---

## 🎯 Библиотека шаблона и примера

### Истакнути: Microsoft Foundry шаблони
**Почните овде ако распоређујете AI апликације!**

> **Напомена:** Ови шаблони показују разне AI обрасце. Неке су спољни Azure узорци, а неки локалне имплементације.

| Шаблон | Поглавље | Комплексност | Сервиси | Тип |
|----------|---------|------------|----------|------|
| [**Започните AI ћаскање**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Спољни |
| [**Започните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Foundry агенти + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Спољни |
| [**Azure Search + OpenAI демо**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (подразумевано) + Storage | Спољни |
| [**OpenAI Chat App брзи почетак**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Спољни |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Спољни |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Спољни |
| [**Retail мулти-агентско решење**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Предложена архитектура и инфраструктурна основа; потребна имплементација апликације | **Локални план** |

### Истакнути: Комплетни сценарији учења
**Шаблони апликација спремних за производњу мапирани на поглавља учења**

| Шаблон | Поглавље за учење | Комплексност | Кључно учење |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни обрасци распореда AI-а |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | Имплементација RAG са Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Ћаскање подржано агентима и тестови евалуације специфични за пример |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Рамка агената и позивање функција |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Оркестрација AI за предузећа |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Архитектура више агената са агентима за купце и залихе |

### Учење по типу примера

> **📌 Локални vs. Спољни примери:**  
> **Локални примери** (у овом репозиторијуму) = Погледајте README примера за статус имплементације и предуслове
> **Спољни примери** (Azure узорци) = Клонирајте из повезаних репозиторијума

#### Локални примери (Спремни за употребу)
- [**Retail мулти-агентско решење**](examples/retail-scenario.md) - Архитектонски план са ARM инфраструктурном основом
  - Предложене улоге агената за купце и залихе
  - Мониторинг, евалуација и код апликације морају бити имплементирани и проверени
  - Само провизионисање ресурса не производи радну апликацију за малопродају

#### Локални примери - апликације у контејнерима (поглавља 2-5)
**Свеобухватни примери распореда контејнера у овом репозиторијуму:**
- [**Примери контејнер апликација**](examples/container-app/README.md) - Комплетан водич за распореде у контејнерима
  - [Једноставан Flask API](../../examples/container-app/simple-flask-api) - Основни REST API са scale-to-zero функционалношћу
  - [Архитектура микросервиса](../../examples/container-app/microservices) - Узорка са два сервиса; јачање за производњу је додатни рад
  - Обрасци брзог почетка, производње и напредни распореди
  - Упутства за мониторинг, безбедност и оптимизацију трошкова

#### Спољни примери - једноставне апликације (поглавља 1-2)
**Клонирајте овај Azure узорци репозиторијуме за почетак:**
- [Једноставна веб апликација - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни обрасци распореда
- [Статички сајт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Распоред статичког садржаја
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Распоред REST API

#### Спољни примери - интеграција базе података (поглавља 3-4)  
- [Апликација базе података - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Обрасци повезивања са базом података
- [Функције + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Серверлес радни ток података

#### Спољни примери - Напредни обрасци (Поглавља 4-8)
- [Java микроуслуге](https://github.com/Azure-Samples/java-microservices-aca-lab) - Мултисервисне архитектуре
- [Jobs у контејнерским апликацијама](https://github.com/Azure-Samples/container-apps-jobs) - Позадинска обрада  
- [Предузетнички ML систем](https://github.com/Azure/mlops-v2) - MLOps референтни обрасци; није директан AZD шаблон

### Спољне колекције шаблона
- [**Званична галерија AZD шаблона**](https://azure.github.io/awesome-azd/) - Курирана колекција званичних и заједничких шаблона
- [**Azure Developer CLI шаблони**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документација шаблона Microsoft Learn
- [**Директоријум примера**](examples/README.md) - Локални примери за учење са детаљним објашњењима

---

## 📚 Ресурси за учење и референце

### Брзе референце
- [**Листа наредби**](resources/cheat-sheet.md) - Основне azd наредбе организоване по поглављима
- [**Глосар**](resources/glossary.md) - Терминологија Azure и azd  
- [**Често постављана питања**](resources/faq.md) - Уобичајена питања организована по поглављима за учење
- [**Водич за учење**](resources/study-guide.md) - Свеобухватне вежбе и задаци

### Практични радионички радови
- [**AI радионица у лабораторији**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Учините своја AI решења спремним за AZD (2-3 сата)
- [**Интерактивна радионица**](workshop/README.md) - 8 модула вођених вежби са MkDocs и GitHub Codespaces
  - Праћење: Увод → Избор → Валидација → Деконструкција → Конфигурација → Прилагођавање → Демонтажа → Закључак

### Спољни ресурси за учење
- [Документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Veštine AI агента за ваш уредник
- [**Microsoft Azure вештине на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 отворених вештина агената за Azure AI, Foundry, развој, дијагностику, оптимизацију трошкова и друге. Инсталирајте их у GitHub Copilot, Cursor, Claude Code или било који подржани агент:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Брзи водич за решавање проблема

**Чести проблеми са којима се почетници сусрећу и тренутна решења:**

<details>
<summary><strong>❌ "azd: команда није пронађена"</strong></summary>

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
<summary><strong>❌ "Нема претплате" или "Претплата није подешена"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" или "Квота је пређена"</strong></summary>

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
<summary><strong>❌ "azd up" не успева на пола пута</strong></summary>

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
<summary><strong>❌ "Аутентификација није успела" или "Токен је истекао"</strong></summary>

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
<summary><strong>❌ "Ресурс већ постоји" или конфликт имена</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Деплој шаблона траје предуго</strong></summary>

**Нормална времена чекања:**
- Једноставна веб апликација: 5-10 минута
- Апликација са базом података: 10-15 минута
- AI апликације: 15-25 минута (Отварање OpenAI сервис је споро)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Дозвола одбијена" или "Забрањено"</strong></summary>

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
<summary><strong>❌ Не могу пронаћи URL распоређене апликације</strong></summary>

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

### 📚 Потпуни ресурси за решавање проблема

- **Водич за уобичајене проблеме:** [Детаљна решења](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-специфични проблеми:** [AI решавање проблема](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Водич за дебаговање:** [Корак по корак дебаговање](docs/chapter-07-troubleshooting/debugging.md)
- **Затражите помоћ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завршетак курса и сертификација

### Праћење напретка
Пратите свој напредак кроз сва поглавља:

- [ ] **Поглавље 1**: Оснoве и брзи почетак ✅
- [ ] **Поглавље 2**: Развој са ИИ у првом плану ✅  
- [ ] **Поглавље 3**: Конфигурација и аутентификација ✅
- [ ] **Поглавље 4**: Инфраструктура као код и деплојмент ✅
- [ ] **Поглавље 5**: Вишeагентна ИИ решења ✅
- [ ] **Поглавље 6**: Валидација и планирање пре деплојмента ✅
- [ ] **Поглавље 7**: Решавање проблема и дебаговање ✅
- [ ] **Поглавље 8**: Обрасци за продукцију и предузећа ✅

### Верификација учења
Након завршетка сваког поглавља, потврдите своје знање тако што ћете:
1. **Практична вежба**: Завршити практични деплојмент из поглавља
2. **Провера знања**: Прегледати FAQ одељак за ваше поглавље
3. **Заједничка дискусија**: Поделити искуство на Azure Discord-у
4. **Следеће поглавље**: Наставити на следећи ниво комплексности

### Предности завршетка курса
Након завршетка свих поглавља, имаћете:
- **Искуство у продукцији**: Распоређене стварне ИИ апликације на Azure
- **Професионалне вештине**: Способности за деплојмент спреман за предузећа  
- **Признaње у заједници**: Активан члан Azure девелопер заједнице
- **Напредовање у каријери**: Тражено знање у AZD и ИИ деплојменту

---

## 🤝 Заједница и подршка

### Упутства за помоћ и подршку
- **Технички проблеми**: [Пријавите грешке и захтеве за функције](https://github.com/microsoft/azd-for-beginners/issues)
- **Питања о учењу**: [Microsoft Azure Discord заједница](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помоћ о ИИ-у**: Придружите се [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документација**: [Званична Azure Developer CLI документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Утицај заједнице са Microsoft Foundry Discord

**Теме о којима заједница дискутује:**
- Мултисервисни деплојменти, управљање креденцијалима и спремност за продукцију
- ИИ-специфични шаблони, водичи за решавање проблема и најбоље праксе

**Придружите нам се да бисте:**
- Делили ваша искуства са AZD + ИИ и добијали помоћ
- Имали приступ раним прегледима нових ИИ шаблона
- Допринели најбољим праксама за ИИ деплојмент
- Утицали на будући развој ИИ + AZD функција

### Допринос курсу
Добродошли су доприноси! Молимо прочитајте наш [Водич за допринос](CONTRIBUTING.md) за детаље о:
- **Побољшања садржаја**: Унапредите постојећа поглавља и примере
- **Нови примери**: Додајте сценарије и шаблоне из стварног света  
- **Превод**: Помозите у одржавању подршке за више језика
- **Пријаве грешака**: Побољшајте тачност и јасноћу
- **Стандарди заједнице**: Пратите наше инклузивне смернице заједнице

---

## 📄 Информације о курсу

### Лиценца
Овај пројекат је лиценциран под MIT лиценцом - видети [LICENSE](../../LICENSE) датотеку за детаље.

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
[![ИИ агенти за почетнике](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Генеративни ИИ серијал
[![Генеративни ИИ за почетнике](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративни ИИ (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративни ИИ (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративни ИИ (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основно учење
[![ML за почетнике](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Наука о подацима за почетнике](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![ИИ за почетнике](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кибер-безбедност за почетнике](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб развој за почетнике](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT за почетнике](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR развој за почетнике](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot серијал
[![Copilot за парно програмирање са ИИ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot за C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot авантура](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигација кроз курс

**🚀 Спремни за почетак учења?**

**Почетници**: Почните са [Поглавље 1: Оснoве и брзи почетак](#-chapter-1-foundation--quick-start)  
**ИИ програмери**: Прескочите на [Поглавље 2: Развој са ИИ у првом плану](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Искуствени програмери**: Почните са [Поглавље 3: Конфигурација и аутентификација](#️-chapter-3-configuration--authentication)

**Следећи кораци**: [Почните Поглавље 1 - Основе AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->