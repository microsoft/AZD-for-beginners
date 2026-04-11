# AZD для начинающих: структурированное учебное путешествие

![AZD-for-beginners](../../translated_images/ru/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматические переводы (всегда актуально)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](./README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Предпочитаете клонировать локально?**
>
> В этом репозитории включено более 50 языковых переводов, что значительно увеличивает размер загрузки. Чтобы клонировать без переводов, используйте sparse checkout:
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
> Это даст вам все необходимое для прохождения курса с гораздо более быстрой загрузкой.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Что нового в azd сегодня

Azure Developer CLI вышел за рамки традиционных веб-приложений и API. Сегодня azd — это универсальный инструмент для развертывания **любого** приложения в Azure — включая приложения с ИИ и интеллектуальных агентов.

Вот что это значит для вас:

- **ИИ-агенты теперь полноценные workloads azd.** Вы можете инициализировать, развертывать и управлять проектами ИИ агентов, используя привычный рабочий процесс `azd init` → `azd up`.
- **Интеграция Microsoft Foundry** добавляет развертывание моделей, хостинг агентов и конфигурацию ИИ-сервисов прямо в экосистему шаблонов azd.
- **Основной рабочий процесс не изменился.** Будь то TODO-приложение, микросервис или многоагентное ИИ-решение — команды остаются одинаковыми.

Если вы уже использовали azd, поддержка ИИ — это естественное расширение, а не отдельный инструмент или сложная ветка. Если вы начинаете с нуля, вы выучите единую рабочую схему, которая подходит для всего.

---

## 🚀 Что такое Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — это удобный для разработчиков CLI-инструмент, который упрощает развертывание приложений в Azure. Вместо ручного создания и связывания множества ресурсов Azure вы можете развернуть целое приложение одной командой.

### Волшебство команды `azd up`

```bash
# Эта команда делает всё:
# ✅ Создаёт все ресурсы в Azure
# ✅ Настраивает сеть и безопасность
# ✅ Собирает код вашего приложения
# ✅ Разворачивает в Azure
# ✅ Предоставляет вам рабочий URL
azd up
```

**Вот и всё!** Никаких кликов в Azure Portal, никаких сложных ARM-шаблонов, никаких ручных настроек — только работающие приложения в Azure.

---

## ❓ Azure Developer CLI или Azure CLI: в чем разница?

Это самый популярный вопрос у начинающих. Вот простой ответ:

| Особенность | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|-------------|----------------------|--------------------------------|
| **Назначение** | Управление отдельными ресурсами Azure | Развертывание полноценных приложений |
| **Подход** | Ориентирован на инфраструктуру | Ориентирован на приложение |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Сложность обучения** | Нужно знать сервисы Azure | Нужно знать только ваше приложение |
| **Для кого** | DevOps, инфраструктура | Разработчики, прототипирование |

### Простая аналогия

- **Azure CLI** — это как набор инструментов для строительства дома — молотки, пилы, гвозди. Можно построить что угодно, но нужно знать строительство.
- **Azure Developer CLI** — это как нанять подрядчика — вы описываете, что хотите, а он занимается строительством.

### Когда что использовать

| Сценарий | Что использовать |
|----------|-----------------|
| "Хочу быстро развернуть веб-приложение" | `azd up` |
| "Мне нужно создать только учетную запись хранилища" | `az storage account create` |
| "Я строю полноценное ИИ-приложение" | `azd init --template azure-search-openai-demo` |
| "Мне нужно отладить конкретный ресурс Azure" | `az resource show` |
| "Хочу продакшен-развертывание за считанные минуты" | `azd up --environment production` |

### Они работают вместе!

AZD использует Azure CLI под капотом. Можно использовать оба:
```bash
# Разверните приложение с помощью AZD
azd up

# Затем тонко настройте конкретные ресурсы с помощью Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Найдите шаблоны в Awesome AZD

Не начинайте с нуля! **Awesome AZD** — это сообщество с коллекцией готовых к развертыванию шаблонов:

| Ресурс | Описание |
|--------|----------|
| 🔗 [**Галерея Awesome AZD**](https://azure.github.io/awesome-azd/) | Просмотрите более 200 шаблонов с возможностью развернуть одним кликом |
| 🔗 [**Отправить шаблон**](https://github.com/Azure/awesome-azd/issues) | Внесите свой шаблон в сообщество |
| 🔗 [**Репозиторий GitHub**](https://github.com/Azure/awesome-azd) | Поставьте звезду и изучите исходники |

### Популярные шаблоны AI из Awesome AZD

```bash
# RAG-чат с моделями Microsoft Foundry + AI Search
azd init --template azure-search-openai-demo

# Быстрое приложение для чата с ИИ
azd init --template openai-chat-app-quickstart

# ИИ-агенты с агентами Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Начните в 3 шага

Перед началом убедитесь, что ваша машина готова для шаблона, который вы хотите развернуть:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Если какой-то из тестов не проходит, исправьте это в первую очередь, а затем продолжайте быстрое начало.

### Шаг 1: Установите AZD (2 минуты)

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

### Шаг 2: Аутентификация для AZD

```bash
# Необязательно, если вы планируете использовать команды Azure CLI напрямую в этом курсе
az login

# Требуется для рабочих процессов AZD
azd auth login
```

Если вы не уверены, что именно вам нужно, пройдите полный процесс настройки в [Установка и настройка](docs/chapter-01-foundation/installation.md#authentication-setup).

### Шаг 3: Разверните первое приложение

```bash
# Инициализировать из шаблона
azd init --template todo-nodejs-mongo

# Развернуть в Azure (создаёт всё!)
azd up
```

**🎉 Готово!** Ваше приложение теперь запущено в Azure.

### Очистка ресурсов (не забудьте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как использовать этот курс

Этот курс разработан для **пошагового обучения** — начните там, где вам удобно, и двигайтесь дальше:

| Ваш опыт | Начните здесь |
|----------|--------------|
| **Новичок в Azure** | [Глава 1: Основы](#-chapter-1-foundation--quick-start) |
| **Знаете Azure, новый в AZD** | [Глава 1: Основы](#-chapter-1-foundation--quick-start) |
| **Хотите развернуть AI-приложения** | [Глава 2: Разработка с приоритетом ИИ](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Желаете практики** | [🎓 Интерактивный воркшоп](workshop/README.md) — 3–4 часа с наставником |
| **Нужны продакшен-паттерны** | [Глава 8: Производство и корпоративные паттерны](#-chapter-8-production--enterprise-patterns) |

### Быстрая настройка

1. **Форкните репозиторий**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонируйте**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Получите помощь**: [Сообщество Azure в Discord](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитаете клонировать локально?**

> В этом репозитории включено более 50 языковых переводов, что значительно увеличивает размер загрузки. Чтобы клонировать без переводов, используйте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Это даст вам все необходимое для прохождения курса с гораздо более быстрой загрузкой.


## Обзор курса

Овладейте Azure Developer CLI (azd) через структурированные главы, разработанные для пошагового обучения. **Особое внимание развертыванию AI-приложений с интеграцией Microsoft Foundry.**

### Почему этот курс важен для современных разработчиков

Основываясь на инсайтах сообщества Microsoft Foundry Discord, **45% разработчиков хотят использовать AZD для AI-задач**, но сталкиваются с трудностями:
- Сложными много-сервисными ИИ-архитектурами
- Лучшей практикой развертывания ИИ в продакшене  
- Интеграцией и настройкой сервисов ИИ в Azure
- Оптимизацией стоимости ИИ-задач
- Отладкой специфичных проблем при развертывании ИИ

### Цели обучения

После прохождения этого структурированного курса вы:
- **Овладеете основами AZD**: основные концепции, установка и настройка
- **Развернете AI-приложения**: используя AZD с сервисами Microsoft Foundry
- **Реализуете инфраструктуру как код**: управление ресурсами Azure с помощью шаблонов Bicep
- **Будете устранять неполадки развертываний**: решать общие проблемы и отлаживать ошибки
- **Оптимизируете для продакшена**: безопасность, масштабирование, мониторинг и управление затратами
- **Создадите многоагентные решения**: развертывание комплексных ИИ-архитектур

## Перед началом: аккаунты, доступ и предпосылки

Перед началом главы 1 убедитесь, что у вас настроено следующее. Шаги установки далее в этом руководстве предполагают, что эти базовые моменты уже решены.
- **Подписка Azure**: Вы можете использовать существующую подписку с работы или своей учетной записи, либо создать [бесплатную пробную версию](https://aka.ms/azurefreetrial) для начала.
- **Разрешение на создание ресурсов Azure**: Для большинства упражнений вам потребуется как минимум доступ **Contributor** к целевой подписке или группе ресурсов. В некоторых главах также предполагается возможность создавать группы ресурсов, управляемые идентичности и назначения RBAC.
- [**Учетная запись GitHub**](https://github.com): Полезна для форка репозитория, отслеживания собственных изменений и использования GitHub Codespaces для мастер-класса.
- **Необходимые инструменты для шаблонов**: Некоторые шаблоны требуют локальных инструментов, таких как Node.js, Python, Java или Docker. Перед началом запустите проверку установки, чтобы вовремя выявить отсутствующие инструменты.
- **Базовое знакомство с терминалом**: Не нужно быть экспертом, но важно уметь запускать команды, такие как `git clone`, `azd auth login` и `azd up`.

> **Работаете в подписке предприятия?**  
> Если ваша среда Azure управляется администратором, заранее уточните, можете ли вы развертывать ресурсы в подписке или группе ресурсов, которые планируете использовать. Если нет, запросите песочницу или доступ Contributor до начала работы.

> **Новичок в Azure?**  
> Начните с собственной пробной подписки Azure или подписки с оплатой по мере использования на https://aka.ms/azurefreetrial, чтобы завершить упражнения полностью без ожидания одобрения на уровне арендатора.

## 🗺️ План курса: Быстрая навигация по главам

В каждой главе есть отдельный README с целями обучения, быстрыми стартами и упражнениями:

| Глава | Тема | Уроки | Длительность | Сложность |
|---------|-------|---------|----------|------------|
| **[Гл 1: Основа](docs/chapter-01-foundation/README.md)** | Начало работы | [Основы AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Установка](docs/chapter-01-foundation/installation.md) &#124; [Первый проект](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл 2: Разработка AI](docs/chapter-02-ai-development/README.md)** | Приложения AI-первого уровня | [Интеграция Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенты](docs/chapter-02-ai-development/agents.md) &#124; [Развертывание моделей](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Мастер-класс](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 часа | ⭐⭐ |
| **[Гл 3: Конфигурация](docs/chapter-03-configuration/README.md)** | Аутентификация и безопасность | [Конфигурация](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификация и безопасность](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и развертывание | [Руководство по развертыванию](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провижнинг](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 часа | ⭐⭐⭐ |
| **[Гл 5: Многоагентные решения](docs/chapter-05-multi-agent/README.md)** | AI-агентские решения | [Сценарий ритейл](examples/retail-scenario.md) &#124; [Шаблоны координации](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 часа | ⭐⭐⭐⭐ |
| **[Гл 6: Предварительное развертывание](docs/chapter-06-pre-deployment/README.md)** | Планирование и проверка | [Проверки перед запуском](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирование мощности](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Выбор SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 час | ⭐⭐ |
| **[Гл 7: Устранение неполадок](docs/chapter-07-troubleshooting/README.md)** | Отладка и исправление | [Распространенные проблемы](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Отладка](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблемы AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 часа | ⭐⭐ |
| **[Гл 8: Производство](docs/chapter-08-production/README.md)** | Корпоративные шаблоны | [Практики в производстве](docs/chapter-08-production/production-ai-practices.md) | 2-3 часа | ⭐⭐⭐⭐ |
| **[🎓 Мастер-класс](workshop/README.md)** | Практическая лаборатория | [Введение](workshop/docs/instructions/0-Introduction.md) &#124; [Выбор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Проверка](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Разбор](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Кастомизация](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Демонтаж](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Итог](workshop/docs/instructions/7-Wrap-up.md) | 3-4 часа | ⭐⭐ |

**Общая длительность курса:** ~10-14 часов | **Прогресс навыков:** Начинающий → Готов к производству

---

## 📚 Учебные главы

*Выберите путь обучения в зависимости от уровня опыта и целей*

### 🚀 Глава 1: Основа и быстрый старт  
**Требования**: Подписка Azure, базовые знания командной строки  
**Длительность**: 30-45 минут  
**Сложность**: ⭐

#### Чему вы научитесь
- Основы Azure Developer CLI
- Установка AZD на вашу платформу
- Первое успешное развертывание

#### Учебные материалы
- **🎯 Начать здесь**: [Что такое Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теория**: [Основы AZD](docs/chapter-01-foundation/azd-basics.md) – основные концепции и терминология
- **⚙️ Установка**: [Установка и настройка](docs/chapter-01-foundation/installation.md) – инструкции для платформ
- **🛠️ Практика**: [Ваш первый проект](docs/chapter-01-foundation/first-project.md) – пошаговое руководство
- **📋 Быстрый справочник**: [Шпаргалка по командам](resources/cheat-sheet.md)

#### Практические упражнения  
```bash
# Быстрая проверка установки
azd version

# Разверните ваше первое приложение
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Результат главы**: Успешно развернуть простое веб-приложение в Azure с помощью AZD

**✅ Критерии успеха:**  
```bash
# После завершения главы 1 вы должны уметь:
azd version              # Показывает установленную версию
azd init --template todo-nodejs-mongo  # Инициализирует проект
azd up                  # Разворачивает на Azure
azd show                # Отображает URL запущенного приложения
# Приложение открывается в браузере и работает
azd down --force --purge  # Очищает ресурсы
```
  
**📊 Время:** 30-45 минут  
**📈 Уровень навыков после:** Умеет самостоятельно развертывать базовые приложения

---

### 🤖 Глава 2: Разработка AI-первого уровня (рекомендуется для разработчиков AI)  
**Требования**: Завершена глава 1  
**Длительность**: 1-2 часа  
**Сложность**: ⭐⭐

#### Чему вы научитесь
- Интеграция Microsoft Foundry с AZD
- Развертывание AI-приложений
- Конфигурация AI-сервисов

#### Учебные материалы
- **🎯 Начать здесь**: [Интеграция Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI агенты**: [Руководство по AI агентам](docs/chapter-02-ai-development/agents.md) – развертывание интеллектуальных агентов с AZD
- **📖 Шаблоны**: [Развертывание AI моделей](docs/chapter-02-ai-development/ai-model-deployment.md) – развертывание и управление AI моделями
- **🛠️ Мастер-класс**: [Лабораторная работа с AI](docs/chapter-02-ai-development/ai-workshop-lab.md) – подготовка AI решений к AZD
- **🎥 Интерактивное руководство**: [Материалы мастер-класса](workshop/README.md) – обучение в браузере с MkDocs * DevContainer
- **📋 Шаблоны**: [Шаблоны Microsoft Foundry](#ресурсы-мастер-класса)
- **📝 Примеры**: [Примеры развертывания AZD](examples/README.md)

#### Практические упражнения  
```bash
# Разверните ваше первое приложение ИИ
azd init --template azure-search-openai-demo
azd up

# Попробуйте дополнительные шаблоны ИИ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Результат главы**: Развернуть и настроить AI-чат-приложение с функциями RAG

**✅ Критерии успеха:**  
```bash
# После главы 2 вы должны уметь:
azd init --template azure-search-openai-demo
azd up
# Тестировать интерфейс чата ИИ
# Задавать вопросы и получать ответы с поддержкой ИИ с указанием источников
# Проверять, что интеграция поиска работает
azd monitor  # Проверять, что Application Insights показывает телеметрию
azd down --force --purge
```
  
**📊 Время:** 1-2 часа  
**📈 Уровень навыков после:** Умеет развертывать и настраивать производственные AI приложения  
**💰 Осведомленность о стоимости:** Понимание затрат $80-150/мес на разработку, $300-3500/мес на производство

#### 💰 Учет затрат при AI-развертывании

**Среда разработки (примерно $80-150 в месяц):**  
- Модели Microsoft Foundry (по подписке): $0-50/мес (зависит от использования токенов)  
- AI Search (базовый тариф): $75/мес  
- Container Apps (оплата за использование): $0-20/мес  
- Хранение (стандартное): $1-5/мес

**Производственная среда (примерно $300-3500+ в месяц):**  
- Модели Microsoft Foundry (PTU для стабильной производительности): $3000+/мес ИЛИ оплата по использованию с высоким трафиком  
- AI Search (стандартный тариф): $250/мес  
- Container Apps (выделенные): $50-100/мес  
- Application Insights: $5-50/мес  
- Хранение (премиум): $10-50/мес

**💡 Советы по оптимизации затрат:**  
- Используйте Microsoft Foundry Models **Free Tier** для обучения (включено 50 000 токенов Azure OpenAI)  
- Запускайте `azd down` для освобождения ресурсов, когда не разрабатываете  
- Начинайте с тарифа по потреблению, PTU подключайте только для производства  
- Используйте `azd provision --preview` для оценки затрат перед развертыванием  
- Включайте автоскейлинг: оплачивайте только фактическое использование

**Мониторинг затрат:**  
```bash
# Проверьте оценочные ежемесячные расходы
azd provision --preview

# Отслеживайте фактические расходы в портале Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Глава 3: Конфигурация и аутентификация  
**Требования**: Завершена глава 1  
**Длительность**: 45-60 минут  
**Сложность**: ⭐⭐

#### Чему вы научитесь
- Конфигурация и управление средами
- Лучшие практики аутентификации и безопасности
- Именование ресурсов и организация

#### Учебные материалы
- **📖 Конфигурация**: [Руководство по конфигурации](docs/chapter-03-configuration/configuration.md) – настройка среды
- **🔐 Безопасность**: [Шаблоны аутентификации и управляемые идентичности](docs/chapter-03-configuration/authsecurity.md)
- **📝 Примеры**: [Пример базы данных](examples/database-app/README.md) – примеры AZD для работы с базами данных

#### Практические упражнения
- Настроить несколько сред (dev, staging, prod)  
- Настроить аутентификацию через управляемые идентичности  
- Реализовать настройки, специфичные для среды

**💡 Результат главы**: Управлять несколькими средами с правильной аутентификацией и безопасностью

---

### 🏗️ Глава 4: Инфраструктура как код и развертывание  
**Требования**: Завершены главы 1-3  
**Длительность**: 1-1.5 часа  
**Сложность**: ⭐⭐⭐

#### Чему вы научитесь
- Продвинутые шаблоны развертывания  
- Инфраструктура как код с Bicep  
- Стратегии провижнинга ресурсов

#### Учебные материалы
- **📖 Развертывание**: [Руководство по развертыванию](docs/chapter-04-infrastructure/deployment-guide.md) – полные рабочие процессы  
- **🏗️ Провижнинг**: [Провижнинг ресурсов](docs/chapter-04-infrastructure/provisioning.md) – управление ресурсами Azure  
- **📝 Примеры**: [Пример контейнерного приложения](../../examples/container-app) – развертывания с контейнерами

#### Практические упражнения
- Создать собственные Bicep шаблоны  
- Развернуть мультисервисные приложения  
- Реализовать стратегии развертывания blue-green

**💡 Результат главы**: Развертывать сложные мультисервисные приложения с использованием пользовательских инфраструктурных шаблонов

---

### 🎯 Глава 5: Многоагентные AI решения (продвинутый уровень)  
**Требования**: Завершены главы 1-2  
**Длительность**: 2-3 часа  
**Сложность**: ⭐⭐⭐⭐

#### Чему вы научитесь
- Шаблоны архитектуры многоагентных систем  
- Оркестрация и координация агентов  
- Развертывания AI готовые к производству

#### Учебные материалы
- **🤖 Основной проект**: [Многоагентное ритейл решение](examples/retail-scenario.md) – полная реализация  
- **🛠️ ARM шаблоны**: [Пакет ARM шаблонов](../../examples/retail-multiagent-arm-template) – развертывание в один клик  
- **📖 Архитектура**: [Шаблоны координации многоагентных систем](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### Практические упражнения  
```bash
# Развернуть полное многоагентное решение для розничной торговли
cd examples/retail-multiagent-arm-template
./deploy.sh

# Исследовать конфигурации агентов
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Результат главы**: Развернуть и управлять производственным многоагентным AI решением с агентами для клиентов и инвентаря

---

### 🔍 Глава 6: Предварительная проверка и планирование развертывания  
**Требования**: Завершена глава 4  
**Длительность**: 1 час  
**Сложность**: ⭐⭐
#### Что вы изучите
- Планирование емкости и проверка ресурсов
- Стратегии выбора SKU
- Предварительные проверки и автоматизация

#### Ресурсы для обучения
- **📊 Планирование**: [Планирование емкости](docs/chapter-06-pre-deployment/capacity-planning.md) - Проверка ресурсов
- **💰 Выбор**: [Выбор SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Экономичные решения
- **✅ Проверка**: [Предварительные проверки](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизированные скрипты

#### Практические упражнения
- Запуск скриптов проверки емкости
- Оптимизация выбора SKU для снижения затрат
- Реализация автоматизированных проверок перед развертыванием

**💡 Результат главы**: Проверять и оптимизировать развертывания до их выполнения

---

### 🚨 Глава 7: Поиск и устранение неисправностей
**Требования**: Завершение любой главы по развертыванию  
**Длительность**: 1-1.5 часа  
**Сложность**: ⭐⭐

#### Что вы изучите
- Систематические подходы к отладке
- Распространенные проблемы и их решения
- Особенности устранения неполадок для AI

#### Ресурсы для обучения
- **🔧 Распространенные проблемы**: [Часто встречающиеся проблемы](docs/chapter-07-troubleshooting/common-issues.md) - FAQ и решения
- **🕵️ Отладка**: [Руководство по отладке](docs/chapter-07-troubleshooting/debugging.md) - Пошаговые стратегии
- **🤖 Проблемы AI**: [Особенности устранения неполадок AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблемы AI-сервисов

#### Практические упражнения
- Диагностика сбоев развертывания
- Решение проблем с аутентификацией
- Отладка подключения AI-служб

**💡 Результат главы**: Самостоятельно диагностировать и устранять распространенные проблемы при развертывании

---

### 🏢 Глава 8: Производственные и корпоративные шаблоны
**Требования**: Завершение глав 1-4  
**Длительность**: 2-3 часа  
**Сложность**: ⭐⭐⭐⭐

#### Что вы изучите
- Стратегии производственного развертывания
- Корпоративные шаблоны безопасности
- Мониторинг и оптимизация затрат

#### Ресурсы для обучения
- **🏭 Производство**: [Лучшие практики AI для производства](docs/chapter-08-production/production-ai-practices.md) - Корпоративные шаблоны
- **📝 Примеры**: [Пример микросервисов](../../examples/microservices) - Сложные архитектуры
- **📊 Мониторинг**: [Интеграция Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практические упражнения
- Внедрение корпоративных шаблонов безопасности
- Настройка комплексного мониторинга
- Развертывание в производственной среде с корректным управлением

**💡 Результат главы**: Развертывать корпоративные приложения с полной производственной инфраструктурой

---

## 🎓 Обзор мастер-класса: Практический опыт обучения

> **⚠️ СТАТУС МАСТЕР-КЛАССА: Активная разработка**  
> Материалы мастер-класса находятся в стадии разработки и доработки. Основные модули функциональны, но некоторые продвинутые разделы еще не завершены. Мы активно работаем над завершением всего контента. [Отслеживать прогресс →](workshop/README.md)

### Интерактивные материалы мастер-класса
**Полноценное практическое обучение с браузерными инструментами и пошаговыми упражнениями**

Наши материалы мастер-класса предлагают структурированный интерактивный опыт, дополняющий учебный план по главам выше. Мастер-класс предназначен как для самостоятельного изучения, так и для занятий под руководством преподавателя.

#### 🛠️ Особенности мастер-класса
- **Интерфейс в браузере**: Полностью функционирующий мастер-класс на базе MkDocs с поиском, копированием и темами оформления
- **Интеграция GitHub Codespaces**: Одним кликом настройка среды разработки
- **Структурированный учебный путь**: 8 модулей с пошаговыми упражнениями (всего 3-4 часа)
- **Пошаговая методология**: Введение → Выбор → Проверка → Разбор → Настройка → Кастомизация → Закрытие → Итоги
- **Интерактивная среда DevContainer**: Преднастроенные инструменты и зависимости

#### 📚 Структура модулей мастер-класса
Мастер-класс следует методологии из **8 прогрессивных модулей**, которая ведет от изучения до мастерства в развертывании:

| Модуль | Тема | Что вы сделаете | Длительность |
|--------|-------|----------------|----------|
| **0. Введение** | Обзор мастер-класса | Ознакомитесь с учебными целями, требованиями и структурой мастер-класса | 15 мин |
| **1. Выбор** | Поиск шаблона | Изучите шаблоны AZD и выберите подходящий AI шаблон для вашего сценария | 20 мин |
| **2. Проверка** | Развертывание и проверка | Развернете шаблон с помощью `azd up` и проверите работу инфраструктуры | 30 мин |
| **3. Разбор** | Понимание структуры | Используете GitHub Copilot для изучения архитектуры, файлов Bicep и организации кода | 30 мин |
| **4. Настройка** | Глубокое изучение azure.yaml | Освоите конфигурацию `azure.yaml`, хуки жизненного цикла и переменные окружения | 30 мин |
| **5. Кастомизация** | Станьте автором | Включите AI Search, трассировку, оценку и настройте под ваш сценарий | 45 мин |
| **6. Закрытие** | Очистка | Безопасно удалите ресурсы с помощью `azd down --purge` | 15 мин |
| **7. Итоги** | Следующие шаги | Подведете итоги, повторите ключевые концепции и продолжите обучение | 15 мин |

**Ход мастер-класса:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Начало работы с мастер-классом
```bash
# Вариант 1: GitHub Codespaces (Рекомендуется)
# Нажмите "Code" → "Create codespace on main" в репозитории

# Вариант 2: Локальная разработка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Следуйте инструкциям по настройке в workshop/README.md
```

#### 🎯 Результаты обучения мастер-класса
Пройдя мастер-класс, участники смогут:
- **Развертывать производственные AI-приложения**: Использовать AZD с сервисами Microsoft Foundry
- **Освоить архитектуры с несколькими агентами**: Реализовать скоординированные решения с AI-агентами
- **Внедрить лучшие практики безопасности**: Настроить аутентификацию и контроль доступа
- **Оптимизировать масштабируемость**: Проектировать экономичные и производительные развертывания
- **Устранять проблемы при развертывании**: Самостоятельно решать распространенные баги

#### 📖 Ресурсы мастер-класса
- **🎥 Интерактивное руководство**: [Материалы мастер-класса](workshop/README.md) - Обучение в браузере
- **📋 Пошаговые инструкции по модулю**:
  - [0. Введение](workshop/docs/instructions/0-Introduction.md) - Обзор мастер-класса и цели
  - [1. Выбор](workshop/docs/instructions/1-Select-AI-Template.md) - Поиск и выбор AI-шаблонов
  - [2. Проверка](workshop/docs/instructions/2-Validate-AI-Template.md) - Развертывание и проверка шаблонов
  - [3. Разбор](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Изучение архитектуры шаблона
  - [4. Настройка](workshop/docs/instructions/4-Configure-AI-Template.md) - Освоение azure.yaml
  - [5. Кастомизация](workshop/docs/instructions/5-Customize-AI-Template.md) - Настройка под ваш сценарий
  - [6. Закрытие](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очистка ресурсов
  - [7. Итоги](workshop/docs/instructions/7-Wrap-up.md) - Подведение итогов и следующий шаг
- **🛠️ Лаборатория AI мастер-класса**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Упражнения по AI
- **💡 Быстрый старт**: [Руководство по настройке мастер-класса](workshop/README.md#quick-start) - Конфигурация окружения

**Идеально подходит для**: Корпоративного обучения, вузовских курсов, самостоятельного изучения и специализированных курсов для разработчиков.

---

## 📖 Глубокое изучение возможностей AZD

Помимо основ, AZD предлагает мощные функции для производственных развертываний:

- **Развертывания по шаблонам** - Используйте готовые шаблоны для популярных приложений
- **Инфраструктура как Код** - Управляйте ресурсами Azure с помощью Bicep или Terraform  
- **Интегрированные рабочие процессы** - Плавное предоставление, развертывание и мониторинг приложений
- **Дружественный к разработчикам** - Оптимизирован для продуктивности и удобства разработчиков

### **AZD + Microsoft Foundry: Идеальное решение для AI-развертываний**

**Почему AZD для AI-решений?** AZD решает основные задачи, с которыми сталкиваются AI-разработчики:

- **Готовые AI-шаблоны** - Преднастроенные шаблоны для Microsoft Foundry Models, Cognitive Services и ML-нагрузок
- **Безопасное развертывание AI** - Встроенные паттерны безопасности для AI-сервисов, ключей API и точек доступа моделей  
- **Производственные AI-шаблоны** - Лучшие практики для масштабируемых и экономичных AI-приложений
- **Полный цикл AI** - От разработки модели до производственного развертывания с мониторингом
- **Оптимизация затрат** - Умное распределение ресурсов и масштабирование для AI-нагрузок
- **Интеграция с Microsoft Foundry** - Легкое подключение к каталогу моделей и точкам доступа Foundry

---

## 🎯 Библиотека шаблонов и примеров

### Рекомендуем: Шаблоны Microsoft Foundry
**Начинайте здесь, если развертываете AI-приложения!**

> **Примечание:** Эти шаблоны демонстрируют различные AI-паттерны. Некоторые — это внешние Azure Samples, другие — локальные реализации.

| Шаблон | Глава | Сложность | Сервисы | Тип |
|----------|---------|------------|----------|------|
| [**Начало работы с AI-чатом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Внешний |
| [**Начало работы с AI-агентами**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Внешний |
| [**Демо Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Внешний |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Внешний |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Внешний |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Внешний |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локальный** |

### Рекомендуем: Полные учебные сценарии
**Готовые к производству шаблоны приложений, связанные с учебными главами**

| Шаблон | Учебная глава | Сложность | Основное обучение |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Основные паттерны AI-развертывания |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | Реализация RAG с Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Глава 4 | ⭐⭐ | Интеграция Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Фреймворк агентов и вызов функций |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Корпоративная оркестровка AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Мультиагентная архитектура с агентами Customer и Inventory |

### Обучение по типу примеров

> **📌 Локальные vs. Внешние примеры:**  
> **Локальные примеры** (в этом репозитории) = готовы к немедленному использованию  
> **Внешние примеры** (Azure Samples) = клонировать из связанных репозиториев

#### Локальные примеры (Готовы к использованию)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Полная производственная реализация с ARM-шаблонами
  - Мультиагентная архитектура (агенты Customer + Inventory)
  - Комплексный мониторинг и оценка
  - Однокликовое развертывание через ARM-шаблон

#### Локальные примеры - Приложения в контейнерах (главы 2-5)
**Полные примеры развертывания контейнеров в этом репозитории:**
- [**Примеры Container App**](examples/container-app/README.md) - Полное руководство по развертыванию контейнеров
  - [Простой Flask API](../../examples/container-app/simple-flask-api) - Базовый REST API с масштабированием до нуля
  - [Архитектура микросервисов](../../examples/container-app/microservices) - Производственное много-сервисное развертывание
  - Быстрый старт, производственные и продвинутые паттерны развертывания
  - Руководства по мониторингу, безопасности и оптимизации затрат

#### Внешние примеры - Простые приложения (главы 1-2)
**Клонируйте эти репозитории Azure Samples для начала работы:**
- [Простое веб-приложение - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Основные паттерны развертывания
- [Статический сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Развертывание статического контента
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Развертывание REST API

#### Внешние примеры - Интеграция базы данных (главы 3-4)  

- [Приложение базы данных - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Шаблоны подключения к базе данных
- [Функции + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсерверный поток данных

#### Внешние примеры - Расширенные шаблоны (главы 4-8)
- [Java микросервисы](https://github.com/Azure-Samples/java-microservices-aca-lab) - Многосервисные архитектуры
- [Задания контейнерных приложений](https://github.com/Azure-Samples/container-apps-jobs) - Фоновая обработка  
- [Корпоративный ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Готовые к производству шаблоны машинного обучения

### Внешние коллекции шаблонов
- [**Официальная галерея шаблонов AZD**](https://azure.github.io/awesome-azd/) - Курированная коллекция официальных и сообществных шаблонов
- [**Шаблоны Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документация по шаблонам Microsoft Learn
- [**Каталог примеров**](examples/README.md) - Локальные обучающие примеры с подробными объяснениями

---

## 📚 Ресурсы для обучения и справочные материалы

### Быстрые ссылки
- [**Справочник команд**](resources/cheat-sheet.md) - Основные команды azd, организованные по главам
- [**Глоссарий**](resources/glossary.md) - Терминология Azure и azd  
- [**Часто задаваемые вопросы (FAQ)**](resources/faq.md) - Часто задаваемые вопросы по главам обучения
- [**Руководство по обучению**](resources/study-guide.md) - Комплексные практические упражнения

### Практические мастер-классы
- [**Мастерская по ИИ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Сделайте свои ИИ-решения пригодными для развертывания через AZD (2-3 часа)
- [**Интерактивный мастер-класс**](workshop/README.md) - 8 модулей с пошаговыми упражнениями с MkDocs и GitHub Codespaces
  - Следует: Введение → Выбор → Валидация → Декомпозиция → Конфигурация → Настройка → Завершение → Итог

### Внешние ресурсы для обучения
- Документация Azure Developer CLI: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Центр архитектуры Azure: https://learn.microsoft.com/en-us/azure/architecture/
- Калькулятор стоимости Azure: https://azure.microsoft.com/pricing/calculator/
- Статус Azure: https://status.azure.com/

### Навыки AI-агентов для вашего редактора
- [**Навыки Microsoft Azure на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 открытых навыков агента для Azure AI, Foundry, деплоймента, диагностики, оптимизации затрат и многое другое. Установите их в GitHub Copilot, Cursor, Claude Code или любой поддерживаемый агент:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Быстрый гид по устранению неполадок

**Распространённые проблемы, с которыми сталкиваются новички, и быстрые решения:**

<details>
<summary><strong>❌ "azd: команда не найдена"</strong></summary>

```bash
# Сначала установите AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Проверьте установку
azd version
```
</details>

<details>
<summary><strong>❌ "Подписка не найдена" или "Подписка не установлена"</strong></summary>

```bash
# Список доступных подписок
az account list --output table

# Установить подписку по умолчанию
az account set --subscription "<subscription-id-or-name>"

# Установить для окружения AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Проверить
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" или "Квота превышена"</strong></summary>

```bash
# Попробуйте другой регион Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Или используйте меньшие SKU в разработке
# Отредактируйте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ Ошибка выполнения "azd up" на середине процесса</strong></summary>

```bash
# Вариант 1: Очистить и повторить попытку
azd down --force --purge
azd up

# Вариант 2: Просто исправить инфраструктуру
azd provision

# Вариант 3: Проверить подробный статус
azd show

# Вариант 4: Проверить журналы в Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Ошибка аутентификации" или "Истёк срок действия токена"</strong></summary>

```bash
# Повторная аутентификация для AZD
azd auth logout
azd auth login

# Необязательно: обновите Azure CLI, если вы используете команды az
az logout
az login

# Проверка аутентификации
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс уже существует" или конфликты имён</strong></summary>

```bash
# AZD генерирует уникальные имена, но при конфликте:
azd down --force --purge

# Затем повторите попытку с новым окружением
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Развертывание шаблона занимает слишком много времени</strong></summary>

**Нормальное время ожидания:**
- Простое веб-приложение: 5-10 минут
- Приложение с базой данных: 10-15 минут
- ИИ-приложения: 15-25 минут (провижининг OpenAI происходит медленно)

```bash
# Проверить прогресс
azd show

# Если застряли более 30 минут, проверьте Azure Portal:
azd monitor --overview
# Ищите неудачные развертывания
```
</details>

<details>
<summary><strong>❌ "Доступ запрещён" или "Forbidden"</strong></summary>

```bash
# Проверьте вашу роль в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Вам нужна как минимум роль "Contributor"
# Попросите администратора Azure предоставить:
# - Contributor (для ресурсов)
# - User Access Administrator (для назначения ролей)
```
</details>

<details>
<summary><strong>❌ Не удаётся найти URL развернутого приложения</strong></summary>

```bash
# Показать все конечные точки сервиса
azd show

# Или открыть Azure Portal
azd monitor

# Проверить конкретный сервис
azd env get-values
# Искать переменные *_URL
```
</details>

### 📚 Полные ресурсы по устранению неполадок

- **Руководство по распространённым проблемам:** [Подробные решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблемы, связанные с ИИ:** [Устранение неполадок ИИ](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Руководство по отладке:** [Пошаговая отладка](docs/chapter-07-troubleshooting/debugging.md)
- **Получить помощь:** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершение курса и сертификация

### Отслеживание прогресса
Отслеживайте свой прогресс по каждой главе:

- [ ] **Глава 1**: Основы и быстрый старт ✅
- [ ] **Глава 2**: Разработка с приоритетом ИИ ✅  
- [ ] **Глава 3**: Конфигурация и аутентификация ✅
- [ ] **Глава 4**: Инфраструктура как код и развертывание ✅
- [ ] **Глава 5**: Мультиагентные ИИ решения ✅
- [ ] **Глава 6**: Предварительная валидация и планирование ✅
- [ ] **Глава 7**: Устранение неполадок и отладка ✅
- [ ] **Глава 8**: Производственные и корпоративные шаблоны ✅

### Проверка знаний
После каждой главы подтвердите свои знания, выполнив:
1. **Практическое задание**: Выполните практическое развертывание главы
2. **Проверка знаний**: Ознакомьтесь с разделом FAQ для вашей главы
3. **Обсуждение в сообществе**: Поделитесь опытом в Azure Discord
4. **Следующая глава**: Продвигайтесь к следующему уровню сложности

### Преимущества завершения курса
По окончании всех глав у вас будет:
- **Опыт производства**: Развернутые реальные ИИ-приложения в Azure
- **Профессиональные навыки**: Способности к развертыванию корпоративного уровня  
- **Признание в сообществе**: Активное участие в сообществе разработчиков Azure
- **Карьера и развитие**: Востребованные знания по AZD и ИИ-развёртыванию

---

## 🤝 Сообщество и поддержка

### Получить помощь и поддержку
- **Технические проблемы**: [Сообщить об ошибках и запросить функциональность](https://github.com/microsoft/azd-for-beginners/issues)
- **Вопросы по обучению**: [Сообщество Microsoft Azure Discord](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощь по ИИ**: Присоединяйтесь к [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официальная документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Информация от сообщества Microsoft Foundry Discord

**Результаты недавнего опроса на канале #Azure:**
- **45%** разработчиков хотят использовать AZD для ИИ-задач
- **Основные сложности**: Развертывания многосервисных приложений, управление учетными данными, готовность к производству  
- **Самые востребованные**: ИИ-специфические шаблоны, руководства по устранению неполадок, лучшие практики

**Присоединяйтесь к нашему сообществу, чтобы:**
- Делиться опытом с AZD + ИИ и получать помощь
- Получать предварительный доступ к новым ИИ-шаблонам
- Вносить вклад в лучшие практики развертывания ИИ
- Влиять на будущее развитие функций ИИ + AZD

### Вклад в курс
Мы рады вашим предложениям! Пожалуйста, ознакомьтесь с нашим [Руководством по участию](CONTRIBUTING.md) для деталей:
- **Улучшение контента**: Дополняйте существующие главы и примеры
- **Новые примеры**: Добавляйте реальные сценарии и шаблоны  
- **Переводы**: Помогайте поддерживать многоязычную поддержку
- **Сообщения об ошибках**: Повышайте точность и ясность
- **Стандарты сообщества**: Соблюдайте инклюзивные правила сообщества

---

## 📄 Информация о курсе

### Лицензия
Этот проект лицензирован под лицензией MIT - смотрите файл [LICENSE](../../LICENSE) для подробностей.

### Связанные ресурсы Microsoft Learn

Наша команда выпускает и другие комплексные обучающие курсы:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j для начинающих](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js для начинающих](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain для начинающих](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Агенты
[![AZD для начинающих](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI для начинающих](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP для начинающих](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI агенты для начинающих](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Generative AI
[![Generative AI для начинающих](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основное обучение
[![Машинное обучение для начинающих](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигация по курсу

**🚀 Готовы начать обучение?**

**Новички**: Начните с [Глава 1: Основы и Быстрый старт](#-chapter-1-foundation--quick-start)  
**Разработчики ИИ**: Перейдите к [Глава 2: Разработка с приоритетом ИИ](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Опытные разработчики**: Начинайте с [Глава 3: Конфигурация и Аутентификация](#️-chapter-3-configuration--authentication)

**Следующие шаги**: [Начать Глава 1 - Основы AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Хотя мы стараемся обеспечить точность, пожалуйста, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на исходном языке следует считать официальным источником. Для важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->