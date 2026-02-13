# AZD за почетнике: Структурисано учење

![AZD за почетнике](../../translated_images/sr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub пратиоци](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub звезде](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Аутоматски преводи (увек ажурно)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арапски](../ar/README.md) | [Бенгалски](../bn/README.md) | [Бугарски](../bg/README.md) | [Бирмански (Мјанмар)](../my/README.md) | [Кинески (поједностављени)](../zh-CN/README.md) | [Кинески (традиционални, Хонг Конг)](../zh-HK/README.md) | [Кинески (традиционални, Макао)](../zh-MO/README.md) | [Кинески (традиционални, Тајван)](../zh-TW/README.md) | [Хрватски](../hr/README.md) | [Чешки](../cs/README.md) | [Дански](../da/README.md) | [Холандски](../nl/README.md) | [Естонски](../et/README.md) | [Фински](../fi/README.md) | [Француски](../fr/README.md) | [Немачки](../de/README.md) | [Грчки](../el/README.md) | [Хебрејски](../he/README.md) | [Хинди](../hi/README.md) | [Мађарски](../hu/README.md) | [Индонежански](../id/README.md) | [Италијански](../it/README.md) | [Јапански](../ja/README.md) | [Каннада](../kn/README.md) | [Корејски](../ko/README.md) | [Литвански](../lt/README.md) | [Малајски](../ms/README.md) | [Малајалам](../ml/README.md) | [Марати](../mr/README.md) | [Непалски](../ne/README.md) | [Нигеријски Пидгин](../pcm/README.md) | [Норвешки](../no/README.md) | [Персијски (Фарси)](../fa/README.md) | [Пољски](../pl/README.md) | [Португалски (Бразил)](../pt-BR/README.md) | [Португалски (Португалија)](../pt-PT/README.md) | [Панџаби (Гурмухи)](../pa/README.md) | [Румунски](../ro/README.md) | [Руски](../ru/README.md) | [Српски (ћирилица)](./README.md) | [Словачки](../sk/README.md) | [Словеначки](../sl/README.md) | [Шпански](../es/README.md) | [Свахили](../sw/README.md) | [Шведски](../sv/README.md) | [Тагалог (Филипини)](../tl/README.md) | [Тамил](../ta/README.md) | [Телугу](../te/README.md) | [Тајландски](../th/README.md) | [Турски](../tr/README.md) | [Украјински](../uk/README.md) | [Урду](../ur/README.md) | [Вијетнамски](../vi/README.md)

> **Преферирате да клоните локално?**
>
> Овај репозиторијум садржи преко 50 превода који значајно повећавају величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
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
> Ово вам даје све што је потребно да завршите курс уз много брже преузимање.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Шта је Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** је командни алат прилагођен програмерима који поједностављује деплој апликација на Azure. Уместо да ручно креирате и повезујете десетине Azure ресурса, можете разместити целе апликације једном командом.

### Магија `azd up`

```bash
# Ова једна команда ради све:
# ✅ Креира све Azure ресурсе
# ✅ Конфигурише мрежу и безбедност
# ✅ Гради код ваше апликације
# ✅ Деплојује на Azure
# ✅ Даје вам радни URL
azd up
```

**То је то!** Нема кликања у Azure портаљу, нема сложених ARM шаблона које прво треба научити, нема ручне конфигурације - само радне апликације на Azure-у.

---

## ❓ Azure Developer CLI vs Azure CLI: Која је разлика?

Ово је најчешће питање које почетници постављају. Ево кратког одговора:

| Особина | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Намена** | Управљање појединачним Azure ресурсима | Размештање комплетних апликација |
| **Приступ** | Фокус на инфраструктуру | Фокус на апликацију |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крива учења** | Потребно познавање Azure сервиса | Потребно је само познавање ваше апликације |
| **Најбоље за** | DevOps, инфраструктура | Програмери, прототиповање |

### Једноставна аналогија

- **Azure CLI** је као да имате све алате за изградњу куће - чекиће, тестере, ексере. Можете направити било шта, али морате знати грађевинарство.
- **Azure Developer CLI** је као да ангажујете извођача радова - опишете шта желите, и он се брине о изградњи.

### Када користити који

| Сценарио | Користите ово |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Раде заједно!

AZD користи Azure CLI у позадини. Можете користити оба:
```bash
# Деплојујте вашу апликацију помоћу AZD
azd up

# Затим детаљно подесите специфичне ресурсе користећи Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Пронађите шаблоне у Awesome AZD

Не почињите од нуле! **Awesome AZD** је заједничка колекција шаблона спремних за деплој:

| Ресурс | Опис |
|----------|-------------|
| 🔗 [**Галерија Awesome AZD**](https://azure.github.io/awesome-azd/) | Прегледајте преко 200 шаблона са једнокликовим деплојем |
| 🔗 [**Пошаљите шаблон**](https://github.com/Azure/awesome-azd/issues) | Допринесите свој шаблон заједници |
| 🔗 [**GitHub репозиторијум**](https://github.com/Azure/awesome-azd) | Дајте звездицу и истражите извор |

### Популарни AI шаблони из Awesome AZD

```bash
# RAG ћask са Azure OpenAI + AI претрага
azd init --template azure-search-openai-demo

# Брза AI ћаскања апликација
azd init --template openai-chat-app-quickstart

# AI агенти са Foundry агенти
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

### Корак 3: Разместите вашу прву апликацију

```bash
# Иницијализуј из шаблона
azd init --template todo-nodejs-mongo

# Деплојуј на Азуре (створи све!)
azd up
```

**🎉 То је то!** Ваша апликација је сада уживо на Azure-у.

### Чишћење (Не заборавите!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Како користити овај курс

Овај курс је дизајниран за **прогресивно учење** - започните тамо где вам је удобно и напредујте корак по корак:

| Ваше искуство | Почните овде |
|-----------------|------------|
| **Потпуни почетник у Azure** | [Поглавље 1: Основе](../..) |
| **Познајете Azure, нови у AZD** | [Поглавље 1: Основе](../..) |
| **Желите да разместите AI апликације** | [Поглавље 2: AI-оријентисани развој](../..) |
| **Желите практичну вежбу** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 сата вођене лабораторије |
| **Потребни вам производни обрасци** | [Поглавље 8: Производња и предузеће](../..) |

### Брзо подешавање

1. **Направите форк овог репозиторијума**: [![GitHub форкови](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте га**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Добијте помоћ**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Преферирате да клоните локално?**
>
> Овај репозиторијум садржи преко 50 превода који значајно повећавају величину преузимања. Да бисте клонирали без превода, користите sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ово вам даје све што је потребно да завршите курс уз много брже преузимање.


## Преглед курса

Свладате Azure Developer CLI (azd) кроз структуирана поглавља дизајнирана за прогресивно учење. **Посебан фокус на размештање AI апликација са интеграцијом Microsoft Foundry.**

### Зашто је овај курс важан за савремене програмере

На основу увида из Microsoft Foundry Discord заједнице, **45% програмера жели да користи AZD за AI радне оптерећења** али се суочавају са изазовима као што су:
- Сложене AI архитектуре са више сервиса
- Најбоље праксе за продукцијско размештање AI
- Интеграција и конфигурација Azure AI сервиса
- Оптимизација трошкова за AI радне оптерећења
- Решавање проблема специфичних за AI размењивање

### Циљеви учења

Завршетком овог структурираног курса научићете:
- **Свладајте основе AZD-а**: Основни концепти, инсталација и конфигурација
- **Разместите AI апликације**: Користите AZD са Microsoft Foundry сервисима
- **Имплементирајте инфраструктуру као код**: Управљајте Azure ресурсима помоћу Bicep шаблона
- **Решавање проблема при размењивању**: Решите уобичајене проблеме и дебагујте грешке
- **Оптимизујте за продукцију**: Безбедност, скалирање, мониторинг и управљање трошковима
- **Направите решења са више агената**: Разместите сложене AI архитектуре

## 🗺️ Мапа курса: Брза навигација по поглављима

Свако поглавље има посвећени README са циљевима учења, брзим почетком и вежбама:

| Поглавље | Тема | Лекције | Трајање | Комплексност |
|---------|-------|---------|----------|------------|
| **[Поглавље 1: Основе](docs/chapter-01-foundation/README.md)** | Почетак | [Основе AZD-а](docs/chapter-01-foundation/azd-basics.md) &#124; [Инсталација](docs/chapter-01-foundation/installation.md) &#124; [Први пројекат](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Поглавље 2: AI развој](docs/chapter-02-ai-development/README.md)** | AI-оријентисане апликације | [Интеграција са Foundry-ом](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенти](docs/chapter-02-ai-development/agents.md) &#124; [Размештање модела](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Радионица](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 сата | ⭐⭐ |
| **[Поглавље 3: Конфигурација](docs/chapter-03-configuration/README.md)** | Аутентификација и сигурност | [Конфигурација](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификација и сигурност](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Поглавље 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Водич за деплојмент](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провизионисање](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ч | ⭐⭐⭐ |
| **[Поглавље 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Трговински сценарио](examples/retail-scenario.md) &#124; [Шаблони координације](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[Поглавље 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Прелетне провере](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Избор SKU-а](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ч | ⭐⭐ |
| **[Поглавље 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Водич за дебаговање](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ч | ⭐⭐ |
| **[Поглавље 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 ч | ⭐⭐⭐⭐ |
| **[🎓 Радионица](workshop/README.md)** | Практична радионица | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ч | ⭐⭐ |

**Укупно трајање курса:** ~10-14 сати | **Напредак вештина:** Почетник → Спремно за продукцију

---

## 📚 Поглавља за учење

*Изаберите пут учења на основу нивоа искуства и циљева*

### 🚀 Поглавље 1: Основа и брзи почетак
**Захтеви**: Azure претплата, основно знање командне линије  
**Трајање**: 30-45 минута  
**Комплексност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталирање AZD на вашој платформи
- Ваш први успешан деплојмент

#### Ресурси за учење
- **🎯 Почните овде**: [What is Azure Developer CLI?](../..)
- **📖 Теорија**: [Основе AZD](docs/chapter-01-foundation/azd-basics.md) - Основни појмови и терминологија
- **⚙️ Подешавање**: [Инсталација и подешавање](docs/chapter-01-foundation/installation.md) - Упутства специфична за платформу
- **🛠️ Практично**: [Ваш први пројекат](docs/chapter-01-foundation/first-project.md) - Туторијал корак по корак
- **📋 Брзи преглед**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Практичне вежбе
```bash
# Брза провера инсталације
azd version

# Поставите своју прву апликацију
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат поглавља**: Успешно размеsтати једноставну веб апликацију на Azure користећи AZD

**✅ Валидација успеха:**
```bash
# Након завршетка Поглавља 1, требало би да будете у стању да:
azd version              # Приказује инсталирану верзију
azd init --template todo-nodejs-mongo  # Иницијализује пројекат
azd up                  # Распоређује на Azure
azd show                # Приказује URL покренуте апликације
# Апликација се отвара у прегледачу и ради
azd down --force --purge  # Чисти ресурсе
```

**📊 Уложено време:** 30-45 минута  
**📈 Ниво вештина након:** Може самостално да размеsти основне апликације

**✅ Валидација успеха:**
```bash
# Након завршетка Поглавља 1, требало би да будете у стању да:
azd version              # Приказује инсталирану верзију
azd init --template todo-nodejs-mongo  # Иницијализује пројекат
azd up                  # Распоређује на Azure
azd show                # Приказује URL покренуте апликације
# Апликација се отвара у прегледачу и ради
azd down --force --purge  # Очишћава ресурсе
```

**📊 Уложено време:** 30-45 минута  
**📈 Ниво вештина након:** Може самостално да размеsти основне апликације

---

### 🤖 Поглавље 2: AI-прво развијање (Препоручено за AI програмере)
**Захтеви**: Поглавље 1 завршено  
**Трајање**: 1-2 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Интеграција Microsoft Foundry са AZD
- Размештање апликација покретаних AI-ом
- Разумевање конфигурација AI сервиса

#### Ресурси за учење
- **🎯 Почните овде**: [Интеграција Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенти**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Размештање интелигентних агената са AZD
- **📖 Обрасци**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Размештање и управљање AI моделима
- **🛠️ Радионица**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Припремите ваша AI решења за AZD
- **🎥 Интерактивни водич**: [Workshop Materials](workshop/README.md) - Учење у прегледачу са MkDocs * DevContainer окружење
- **📋 Шаблони**: [Microsoft Foundry Templates](../..)
- **📝 Примери**: [AZD Deployment Examples](examples/README.md)

#### Практичне вежбе
```bash
# Деплојујте вашу прву АИ апликацију
azd init --template azure-search-openai-demo
azd up

# Испробајте додатне АИ шаблоне
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат поглавља**: Разместите и конфигуришите чат апликацију покретану AI-ом са RAG могућностима

**✅ Валидација успеха:**
```bash
# Након 2. поглавља, требало би да будете у стању да:
azd init --template azure-search-openai-demo
azd up
# Тестирати интерфејс за ћаскање са вештачком интелигенцијом
# Постављати питања и добијати одговоре које покреће вештачка интелигенција са изворима
# Проверити да ли интеграција претраге ради
azd monitor  # Проверити да ли Application Insights приказује телеметрију
azd down --force --purge
```

**📊 Уложено време:** 1-2 сата  
**📈 Ниво вештина након:** Може размеsтити и конфигурисати AI апликације спремне за продукцију  
**💰 Свесност о трошковима:** Разумевање трошкова развоја $80-150/месечно, трошкова продукције $300-3500/месечно

#### 💰 Разматрања трошкова за AI размеsтања

**Окружење за развој (процењено $80-150/месечно):**
- Azure OpenAI (Pay-as-you-go): $0-50/месечно (зависно од употребе токена)
- AI Search (базни ниво): $75/месечно
- Container Apps (Consumption): $0-20/месечно
- Складиште (стандардно): $1-5/месечно

**Окружење за продукцију (процењено $300-3,500+/месечно):**
- Azure OpenAI (PTU за конзистентне перформансе): $3,000+/месечно ИЛИ Pay-as-go са великим обимом
- AI Search (стандардни ниво): $250/месечно
- Container Apps (Dedicated): $50-100/месечно
- Application Insights: $5-50/месечно
- Складиште (премиум): $10-50/месечно

**💡 Савети за оптимизацију трошкова:**
- Користите **Free Tier** Azure OpenAI за учење (укључено 50,000 токена/месечно)
- Покрените `azd down` да деаллоцирате ресурсе када не развијате активно
- Почните са обрачуном заснованим на потрошњи, надоградите на PTU само за продукцију
- Користите `azd provision --preview` за процену трошкова пре размеsтања
- Омогућите аутоматско скалирање: плаћајте само за стварну потрошњу

**Праћење трошкова:**
```bash
# Проверите процењене месечне трошкове
azd provision --preview

# Пратите стварне трошкове у Azure порталу
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Поглавље 3: Конфигурација и аутентификација
**Захтеви**: Поглавље 1 завршено  
**Трајање**: 45-60 минута  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Конфигурација и управљање окружењем
- Аутентификација и најбоље праксе безбедности
- Именовање и организовање ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Водич за конфигурацију](docs/chapter-03-configuration/configuration.md) - Постављање окружења
- **🔐 Безбедност**: [Обрасци аутентификације и управљани идентитет](docs/chapter-03-configuration/authsecurity.md) - Обрасци аутентификације
- **📝 Примери**: [Пример апликације са базом података](examples/database-app/README.md) - AZD примери база података

#### Практичне вежбе
- Конфигуришите више окружења (dev, staging, prod)
- Поставите аутентификацију управљаног идентитета
- Имплементирајте конфигурације специфичне за окружење

**💡 Резултат поглавља**: Управљање више окружења са правилном аутентификацијом и безбедношћу

---

### 🏗️ Поглавље 4: Инфраструктура као код и деплојмент
**Захтеви**: Поглавља 1-3 завршена  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐⭐

#### Шта ћете научити
- Напредни обрасци деплојмента
- Инфраструктура као код са Bicep
- Стратегије провизионисања ресурса

#### Ресурси за учење
- **📖 Деплојмент**: [Водич за деплојмент](docs/chapter-04-infrastructure/deployment-guide.md) - Комплетни токови рада
- **🏗️ Провизионисање**: [Провизионисање ресурса](docs/chapter-04-infrastructure/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Пример апликације у контејнеру](../../examples/container-app) - Деплојменти у контејнерима

#### Практичне вежбе
- Креирајте прилагођене Bicep шаблоне
- Размештајте вишесервисне апликације
- Имплементирајте blue-green стратегије деплојмента

**💡 Резултат поглавља**: Разместите сложене вишесервисне апликације користећи прилагођене инфраструктурне шаблоне

---

### 🎯 Поглавље 5: Мулти-агентна AI решења (Напредно)
**Захтеви**: Поглавља 1-2 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Обрасци архитектуре мулти-агента
- Оркестрација и координација агената
- Размештања AI-а спремна за продукцију

#### Ресурси за учење
- **🤖 Истакнути пројекат**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Потпуна имплементација
- **🛠️ ARM шаблони**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Једним кликом деплојмент
- **📖 Архитектура**: [Обрасци координације мулти-агента](docs/chapter-06-pre-deployment/coordination-patterns.md) - Обрасци

#### Практичне вежбе
```bash
# Разместите комплетно малопродајно решење са више агената
cd examples/retail-multiagent-arm-template
./deploy.sh

# Истражите конфигурације агената
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат поглавља**: Разместите и управљајте мулти-агентним AI решењем спремним за продукцију са Customer и Inventory агентима

---

### 🔍 Поглавље 6: Валидација и планирање пре размештања
**Захтеви**: Поглавље 4 завршено  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије избора SKU-а
- Прелиминарне провере и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање капацитета](docs/chapter-06-pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Избор**: [Избор SKU-а](docs/chapter-06-pre-deployment/sku-selection.md) - Исплативи избори
- **✅ Валидација**: [Прелетне провере](docs/chapter-06-pre-deployment/preflight-checks.md) - Аутоматизоване скрипте

#### Практичне вежбе
- Покрените скрипте за валидацију капацитета
- Оптимизујте избор SKU-а ради уштеде
- Имплементирајте аутоматске провере пре размеsтања

**💡 Резултат поглавља**: Потврдите и оптимизујте размеsтања пре извршења

---

### 🚨 Поглавље 7: Решавање проблема и дебаговање
**Захтеви**: Било које поглавље о размеsтању завршено  
**Трајање**: 1-1.5 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематски приступи дебаговању
- Уобичајени проблеми и решења
- Решење проблема специфичних за AI

#### Ресурси за учење
- **🔧 Уобичајени проблеми**: [Уобичајени проблеми](docs/chapter-07-troubleshooting/common-issues.md) - ЧПП и решења
- **🕵️ Дебаговање**: [Водич за дебаговање](docs/chapter-07-troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 AI проблеми**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблеми AI сервиса

#### Практичне вежбе
- Дијагностикујте неуспехе размеsтања
- Решите проблеме са аутентификацијом
- Дебагујте повезивост AI сервиса

**💡 Резултат поглавља**: Самостално дијагностикујте и решите уобичајене проблеме при размеsтању

---

### 🏢 Поглавље 8: Продукција и корпоративни обрасци
**Захтеви**: Поглавља 1-4 завршена  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије продукционог размеsтања
- Корпоративни обрасци безбедности
- Праћење и оптимизација трошкова

#### Ресурси за учење
- **🏭 Продукција**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Корпоративни обрасци
- **📝 Примери**: [Пример микросервиса](../../examples/microservices) - Сложене архитектуре
- **📊 Праћење**: [Интеграција Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Праћење

#### Практичне вежбе
- Имплементирајте корпоративне обрасце безбедности
- Поставите свеобухватно праћење
- Разместите у продукцију са одговарајућом управом

**💡 Резултат поглавља**: Разместите апликације спремне за предузеће са потпуном продукцијском функционалношћу

---

## 🎓 Преглед радионице: Практично искуство учења

> **⚠️ СТАЊЕ РАДИОНИЦЕ: Активни развој**
> Радиончки материјали су тренутно у развоју и прилагођавању. Основни модули су функционални, али неки напредни делови нису потпуно завршени. Активно радимо на довршењу целокупног садржаја. [Пратите напредак →](workshop/README.md)

### Интерактивни материјали радионице
**Свеобухватно практично учење са алатима у прегледачу и вођеним вежбама**

Наши материјали за радионицу пружају структуриран, интерактиван доживљај учења који допуњује горе наведени наставни програм по поглављима. Радионица је дизајнирана и за самостално учење и за сесије под вођством инструктора.

#### 🛠️ Карактеристике радионице
- **Интерфејс у прегледачу**: Комплетна радионица покретана MkDocs-ом са претрагом, копирањем и темама
- **Интеграција са GitHub Codespaces**: Подешавање развојног окружења једним кликом
- **Структурисан пут учења**: Вођене вежбе у 8 модула (укупно 3–4 сата)
- **Прогресивна методологија**: Увод → Избор → Валидација → Декомпозиција → Конфигурација → Прилагођавање → Уклањање → Закључак
- **Интерактивно DevContainer окружење**: Унапред конфигурисани алати и зависности

#### 📚 Структура модула радионице
Радионица следи једну **методологију у 8 модула** која вас води од откривања до мајсторства у деплоју:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Преглед радионице | Разумети циљеве учења, предуслове и структуру радионице | 15 мин |
| **1. Selection** | Откривање шаблона | Истражити AZD шаблоне и одабрати прави AI шаблон за ваш сценарио | 20 мин |
| **2. Validation** | Размештање и верификација | Разместите шаблон са `azd up` и проверите да инфраструктура функционише | 30 мин |
| **3. Deconstruction** | Разумети структуру | Користите GitHub Copilot да бисте истражили архитектуру шаблона, Bicep фајлове и организацију кода | 30 мин |
| **4. Configuration** | Дубинско проучавање azure.yaml | Усавршите конфигурацију `azure.yaml`, lifecycle hooks, и променљиве окружења | 30 мин |
| **5. Customization** | Прилагодите га | Омогућите AI претрагу, трасирање, евалуацију и прилагодите за ваш сценарио | 45 мин |
| **6. Teardown** | Чишћење | Безбедно уклоните ресурсе са `azd down --purge` | 15 мин |
| **7. Wrap-up** | Следећи кораци | Прегледајте постигнућа, кључне концепте и наставите ваше путовање учења | 15 мин |

**Ток радионице:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Како започети радионицу
```bash
# Опција 1: GitHub Codespaces (Препоручено)
# Кликните на "Code" → "Create codespace on main" у репозиторијуму

# Опција 2: Локални развој
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Пратите упутства за подешавање у workshop/README.md
```

#### 🎯 Циљеви учења радионице
Комплетирањем радионице, учесници ће:
- **Размештање AI апликација у продукцију**: Користите AZD са Microsoft Foundry сервисима
- **Овладати мулти-агентним архитектурама**: Имплементирати координисана решења са AI агентима
- **Примена најбољих безбедносних пракси**: Конфигуришите аутентикацију и контролу приступа
- **Оптимизација за скалабилност**: Дизајнирати економична, перформансно ефикасна решења за размествaње
- **Решавање проблема са деплојем**: Решавати уобичајене проблеме самостално

#### 📖 Ресурси радионице
- **🎥 Интерактивни водич**: [Материјали радионице](workshop/README.md) - Окружење за учење у прегледачу
- **📋 Упутства по модулима**:
  - [0. Увод](workshop/docs/instructions/0-Introduction.md) - Преглед радионице и циљеви
  - [1. Избор](workshop/docs/instructions/1-Select-AI-Template.md) - Пронађите и одаберите AI шаблоне
  - [2. Валидација](workshop/docs/instructions/2-Validate-AI-Template.md) - Разместите и проверите шаблоне
  - [3. Декомпозиција](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Истражите архитектуру шаблона
  - [4. Конфигурација](workshop/docs/instructions/4-Configure-AI-Template.md) - Усавршите azure.yaml
  - [5. Прилагођавање](workshop/docs/instructions/5-Customize-AI-Template.md) - Прилагодите за ваш сценарио
  - [6. Чишћење инфраструктуре](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очистите ресурсе
  - [7. Закључак](workshop/docs/instructions/7-Wrap-up.md) - Преглед и следећи кораци
- **🛠️ Лабораторија AI радионице**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Вежбе фокусиране на AI
- **💡 Брзи почетак**: [Водич за подешавање радионице](workshop/README.md#quick-start) - Конфигурација окружења

**Идеално за**: Корпоративну обуку, универзитетске курсеве, самостално учење и програме за обуку програмера.

---

## 📖 Детаљан преглед: Могућности AZD-а

Поред основа, AZD пружа моћне функције за продукцијско размествaње:

- **Размештања заснована на шаблонима** - Користите унапред направљене шаблоне за уобичајене обрасце апликација
- **Инфраструктура као код** - Управљајте Azure ресурсима користећи Bicep или Terraform  
- **Интегрисани токови рада** - Беспроблемно провизионирање, размествaње и праћење апликација
- **Прилагођено за програмере** - Оптимизовано за продуктивност и искуство програмера

### **AZD + Microsoft Foundry: Савршено за AI деплоје**

**Зашто AZD за AI решења?** AZD решава главне изазове са којима се суочавају AI програмери:

- **Шаблони спремни за AI** - Унапред конфигурисани шаблони за Azure OpenAI, Cognitive Services и ML радна оптерећења
- **Безбедни AI деплоји** - Уграђени безбедносни образци за AI сервисе, API кључеве и крајње тачке модела  
- **Продукцијски AI обрасци** - Најбоље праксе за скалабилна, ефикасна и економична размествaња AI апликација
- **End-to-End AI токови рада** - Од развоја модела до продукцијског размествaња уз одговарајуће праћење
- **Оптимизација трошкова** - Паметна алокација ресурса и стратегије скалирања за AI радна оптерећења
- **Интеграција са Microsoft Foundry** - Беспрекорна веза са каталогом модела и крајним тачкама Microsoft Foundry

---

## 🎯 Библиотека шаблона и примера

### Истакнуто: Microsoft Foundry шаблони
**Почните овде ако размешћујете AI апликације!**

> **Напомена:** Ови шаблони демонстрирају различите AI обрасце. Неки су спољни Azure примери, други су локалне имплементације.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Почните са AI ћаскањем**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Спољни |
| [**Почните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Спољни |
| [**Azure Search + OpenAI демо**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Спољни |
| [**OpenAI Chat App - брзи почетак**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Спољни |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Спољни |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Спољни |
| [**Решење за малопродају са више агената**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локално** |

### Истакнуто: Потпуни сценарији учења
**Шаблони апликација спремни за продукцију, мапирани на наставна поглавља**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни обрасци размествaња AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | Имплементација RAG-а уз Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Поглавље 4 | ⭐⭐ | Интеграција Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Фрејмворк агената и позивање функција |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Оркестрација AI у предузећу |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Архитектура са више агената (Агент за купце и Агент за залихе) |

### Учење по типу примера

> **📌 Локални наспротив спољним примерима:**  
> **Локални примери** (у овом репозиторијуму) = Спремни за коришћење одмах  
> **Спољни примери** (Azure Samples) = Клонирајте из повезаних репозиторијума

#### Локални примери (спремни за коришћење)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Комплетна имплементација спремна за продукцију са ARM шаблонима
  - Архитектура са више агената (Агент за купце + Агент за залихе)
  - Свеобухватно праћење и евалуација
  - Једнокликово размествaње преко ARM шаблона

#### Локални примери - Контейнер апликације (Поглавља 2-5)
**Свеобухватни примери размествaња контејнера у овом репозиторијуму:**
- [**Container App Examples**](examples/container-app/README.md) - Комплетан водич за размествaње у контејнерима
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Базични REST API са скалирањем на нулу
  - [Microservices Architecture](../../examples/container-app/microservices) - Размествaње више услуга спремно за продукцију
  - Брзи почетак, продукцијa и напредни обрасци размествaња
  - Праћење, безбедност и упутства за оптимизацију трошкова

#### Спољни примери - Једноставне апликације (Поглавља 1-2)
**Клонирајте ове Azure Samples репозиторијуме да започнете:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основни обрасци размествaња
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Размествaње статичког садржаја
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Размествaње REST API-ја

#### Спољни примери - Интеграција базе података (Поглавља 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Обрасци повезивања са базом података
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсерверни ток података

#### Спољни примери - Напредни обрасци (Поглавља 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архитектуре са више услуга
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Обрада у позадини  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Производни ML обрасци

### Спољне колекције шаблона
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Курирана колекција званичних и заједничких шаблона
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn документација о шаблонима
- [**Examples Directory**](examples/README.md) - Локални примери за учење са детаљним објашњењима

---

## 📚 Ресурси за учење и референце

### Кратке референце
- [**Кратка листа команди**](resources/cheat-sheet.md) - Основне azd команде организоване по поглављима
- [**Глосаријум**](resources/glossary.md) - Терминологија Azure и azd  
- [**Често постављана питања (FAQ)**](resources/faq.md) - Уобичајена питања организована по поглављима учења
- [**Водич за учење**](resources/study-guide.md) - Свеобухватне вежбе

### Практичне радионице
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Учините ваше AI решења погодним за размествaње помоћу AZD (2-3 сата)
- [**Интерактивна радионица**](workshop/README.md) - Вођене вежбе у 8 модула са MkDocs и GitHub Codespaces
  - Следи: Увод → Избор → Валидација → Декомпозиција → Конфигурација → Прилагођавање → Уклањање → Закључак

### Спољни ресурси за учење
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Брзи водич за решавање проблема

**Уобичајени проблеми са којима се суочавају почетници и тренутна решења:**

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

# Подеси подразумевану претплату
az account set --subscription "<subscription-id-or-name>"

# Подеси за AZD окружење
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Провери
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" или "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" се заустави на пола пута</strong></summary>

```bash
# Опција 1: Очисти и покушај поново
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
<summary><strong>❌ "Authentication failed" или "Token expired"</strong></summary>

```bash
# Поново се аутентификујте
az logout
az login

azd auth logout
azd auth login

# Потврдите аутентификацију
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" или конфликт имена</strong></summary>

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

**Нормално време чекања:**
- Једноставна веб апликација: 5-10 минута
- Апликација са базом података: 10-15 минута
- AI апликације: 15-25 минута (провизионисање OpenAI-а је споро)

```bash
# Провери напредак
azd show

# Ако сте заглављени дуже од 30 минута, проверите Azure портал:
azd monitor
# Потражите неуспела распоређивања
```
</details>

<details>
<summary><strong>❌ "Permission denied" или "Forbidden"</strong></summary>

```bash
# Проверите своју Azure улогу
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Потребна вам је најмање "Contributor" улога
# Затражите од вашег Azure администратора да додели:
# - Contributor (за ресурсе)
# - User Access Administrator (за доделу улога)
```
</details>

<details>
<summary><strong>❌ Не могу да пронађем URL распоређене апликације</strong></summary>

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

### 📚 Комплетни ресурси за решавање проблема

- **Водич за честе проблеме:** [Детаљна решења](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблеми специфични за AI:** [Решавање проблема са AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Водич за отклањање грешака:** [Отклањање грешака корак по корак](docs/chapter-07-troubleshooting/debugging.md)
- **Потражите помоћ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завршетак курса и сертификација

### Праћење напретка
Пратите свој напредак кроз свако поглавље:

- [ ] **Chapter 1**: Основе и брзи почетак ✅
- [ ] **Chapter 2**: AI-усмерени развој ✅  
- [ ] **Chapter 3**: Конфигурација и аутентификација ✅
- [ ] **Chapter 4**: Инфраструктура као код и размествaње ✅
- [ ] **Chapter 5**: Мулти-агентна AI решења ✅
- [ ] **Chapter 6**: Валидација и планирање пре размењивања ✅
- [ ] **Chapter 7**: Решавање проблема и отклањање грешака ✅
- [ ] **Chapter 8**: Производња и корпоративни обрасци ✅

### Потврда учења
Након завршетка сваког поглавља, верификујте своје знање тако што ћете:
1. **Практична вежба**: Завршите практично постављање из поглавља
2. **Провера знања**: Прегледајте одељак са Често постављаним питањима (FAQ) за ваше поглавље
3. **Заједничка дискусија**: Поделите своје искуство на Azure Discord
4. **Следеће поглавље**: Прелазак на следећи ниво сложености

### Предности по завршетку курса
Након завршетка свих поглавља, добићете:
- **Искуство у продукцији**: Размештене праве AI апликације на Azure
- **Професионалне вештине**: Способности за размењивање спремно за предузећа  
- **Препознавање у заједници**: Активан члан Azure програмерске заједнице
- **Напредовање у каријери**: Тражено знање у AZD и размењивању AI апликација

---

## 🤝 Заједница и подршка

### Добијте помоћ и подршку
- **Технички проблеми**: [Пријавите грешке и захтеве за функције](https://github.com/microsoft/azd-for-beginners/issues)
- **Питања везана за учење**: [Microsoft Azure Discord заједница](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помоћ специфична за AI**: Придружите се [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документација**: [Званична документација за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Увид из заједнице Microsoft Foundry Discord

**Недавни резултати анкете са канала #Azure:**
- **45%** програмера жели да користи AZD за AI радна оптерећења
- **Највећи изазови**: Размештање више сервиса, управљање акредитивима, спремност за продукцију  
- **Највише тражено**: AI-специфични шаблони, водичи за решавање проблема, најбоље праксе

**Придружите се нашој заједници да:**
- Поделите своја AZD + AI искуства и добијете помоћ
- Приступите раним прегледима нових AI шаблона
- Допринесете најбољим праксама за размењивање AI
- Утичете на будући развој функција AI + AZD

### Допринос курсу
Добродошли су доприноси! Молимо прочитајте наш [Contributing Guide](CONTRIBUTING.md) за детаље о:
- **Побољшања садржаја**: Унапредите постојећа поглавља и примере
- **Нови примери**: Додајте сценарије из праксе и шаблоне  
- **Превод**: Помозите у одржавању подршке за више језика
- **Пријаве грешака**: Побољшајте тачност и јасноћу
- **Стандардi за заједницу**: Пратите наше инклузивне смернице за заједницу

---

## 📄 Информације о курсу

### Лиценца
Овом пројекту је подељена MIT лиценца - видите фајл [LICENSE](../../LICENSE) за детаље.

### Повезани Microsoft Learning ресурси

Наш тим производи и друге обимне курсеве за учење:

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

## 🗺️ Навигација курса

**🚀 Спремни да почнете да учите?**

**Почетници**: Почните са [Поглавље 1: Основе и Брзи почетак](../..)  
**AI програмери**: Прескочите на [Поглавље 2: Развој који ставља AI на прво место](../..)  
**Искусни програмери**: Почните са [Поглавље 3: Конфигурација и Аутентификација](../..)

**Следећи кораци**: [Започните Поглавље 1 - AZD основе](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Одрицање одговорности:

Овај документ је преведен помоћу AI сервиса за превођење Co-op Translator (https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте на уму да аутоматизовани преводи могу садржати грешке или нетачности. Изворни документ на његовом оригиналном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионалан људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->