# AZD для начинающих: структурированное обучение

![AZD-for-beginners](../../translated_images/ru/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматические переводы (постоянно обновляются)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабский](../ar/README.md) | [Бенгальский](../bn/README.md) | [Болгарский](../bg/README.md) | [Бирманский (Мьянма)](../my/README.md) | [Китайский (упрощённый)](../zh-CN/README.md) | [Китайский (традиционный, Гонконг)](../zh-HK/README.md) | [Китайский (традиционный, Макао)](../zh-MO/README.md) | [Китайский (традиционный, Тайвань)](../zh-TW/README.md) | [Хорватский](../hr/README.md) | [Чешский](../cs/README.md) | [Датский](../da/README.md) | [Нидерландский](../nl/README.md) | [Эстонский](../et/README.md) | [Финский](../fi/README.md) | [Французский](../fr/README.md) | [Немецкий](../de/README.md) | [Греческий](../el/README.md) | [Иврит](../he/README.md) | [Хинди](../hi/README.md) | [Венгерский](../hu/README.md) | [Индонезийский](../id/README.md) | [Итальянский](../it/README.md) | [Японский](../ja/README.md) | [Каннада](../kn/README.md) | [Кхмерский](../km/README.md) | [Корейский](../ko/README.md) | [Литовский](../lt/README.md) | [Малайский](../ms/README.md) | [Малаялам](../ml/README.md) | [Манипури (Мейтеи Майек)](../mni/README.md) | [Маратхи](../mr/README.md) | [Непальский](../ne/README.md) | [Нигерийский пиджин](../pcm/README.md) | [Норвежский](../no/README.md) | [Персидский (фарси)](../fa/README.md) | [Польский](../pl/README.md) | [Португальский (Бразилия)](../pt-BR/README.md) | [Португальский (Португалия)](../pt-PT/README.md) | [Панджаби (гурмукхи)](../pa/README.md) | [Румынский](../ro/README.md) | [Русский](./README.md) | [Сербский (кириллица)](../sr/README.md) | [Словацкий](../sk/README.md) | [Словенский](../sl/README.md) | [Испанский](../es/README.md) | [Суахили](../sw/README.md) | [Шведский](../sv/README.md) | [Тагальский (филиппинский)](../tl/README.md) | [Тамильский](../ta/README.md) | [Телугу](../te/README.md) | [Тайский](../th/README.md) | [Турецкий](../tr/README.md) | [Украинский](../uk/README.md) | [Урду](../ur/README.md) | [Вьетнамский](../vi/README.md)

> **Предпочитаете клонировать локально?**
>
> Этот репозиторий включает более 50 переводов, что значительно увеличивает размер загрузки. Чтобы клонировать без переводов, используйте выборочную загрузку:
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
> Это даст вам всё, что нужно для прохождения курса, при значительно более быстрой загрузке.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Что нового в azd сегодня

> 📌 Этот курс проверен на версии **`azd 1.27.1`** (июль 2026). Запустите `azd version` для проверки сборки и `azd upgrade` для получения последней версии.

Azure Developer CLI вырос за рамки традиционных веб-приложений и API. Сегодня azd — это универсальный инструмент для развертывания **любых** приложений в Azure — включая приложения с искусственным интеллектом и интеллектуальных агентов.

Что это значит для вас:

- **Агенты ИИ теперь полноценная нагрузка azd.** Вы можете инициализировать, развертывать и управлять проектами ИИ-агентов с помощью того же рабочего процесса `azd init` → `azd up`, который вы уже знаете.
- **Полный жизненный цикл агента из CLI.** Расширение `azure.ai.agents` теперь охватывает весь путь — `azd ai agent init` для создания заготовок, `azd ai agent invoke` для тестирования (с выводом времени ответа), `azd ai agent eval generate` и `azd ai agent optimize` для измерения и улучшения качества, и `azd ai agent delete` для очистки.
- **Больше строительных блоков ИИ.** Новые превью-расширения — `azure.ai.skills` и `azure.ai.connections` — позволяют управлять повторно используемыми навыками агентов и подключениями Foundry напрямую с помощью azd.
- **Интеграция с Microsoft Foundry** приносит развертывание моделей, хостинг агентов и конфигурацию AI-сервисов прямо в экосистему шаблонов azd.
- **Упрощённые базовые операции.** Недавние обновления сделали `azd init` идемпотентным (безопасным для повторного запуска), автоматически очищают устаревшие токены в `azd auth login` и добавляют дружественное приглашение настройки при первом запуске `azd tool`.
- **Основной рабочий процесс не изменился.** Независимо от того, развертываете ли вы приложение todo, микросервис или многоагентное AI-решение, команды остаются теми же.

> **Примечание для пользователей Aspire:** Microsoft теперь называет продукт просто **Aspire** (ранее ".NET Aspire"). Поддержка azd для Aspire не изменилась — только обновилось название.

Если вы уже использовали azd, поддержка ИИ — это естественное расширение, а не отдельный инструмент или сложный курс. Если начинаете с нуля, вы освоите один рабочий процесс, подходящий для всего.

---

## 🚀 Что такое Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — дружественный к разработчику инструмент командной строки, который упрощает развертывание приложений в Azure. Вместо того, чтобы вручную создавать и подключать десятки ресурсов Azure, вы можете развернуть целые приложения одной командой.

### Магия `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Вот и всё!** Без кликов в портале Azure, без изучения сложных ARM-шаблонов, без ручной настройки — просто работающие приложения в Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: в чём разница?

Это самый частый вопрос у новичков. Вот простой ответ:

| Функция | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Назначение** | Управление отдельными ресурсами Azure | Развертывание полных приложений |
| **Подход** | Ориентирован на инфраструктуру | Ориентирован на приложение |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Сложность изучения** | Нужно знать сервисы Azure | Нужно знать только своё приложение |
| **Лучше всего подходит** | DevOps, инфраструктура | Разработчикам, прототипированию |

### Простая аналогия

- **Azure CLI** — это как иметь все инструменты для строительства дома — молотки, пилы, гвозди. Можно построить всё, но нужно знать строительство.
- **Azure Developer CLI** — это как нанять подрядчика — вы описываете, что хотите, а он занимается строительством.

### Когда использовать каждый

| Сценарий | Используйте это |
|----------|----------|
| "Хочу быстро развернуть веб-приложение" | `azd up` |
| "Нужно создать только учетную запись хранилища" | `az storage account create` |
| "Создаю полноценное AI-приложение" | `azd init --template azure-search-openai-demo` |
| "Нужно отладить конкретный ресурс Azure" | `az resource show` |
| "Хочу готовое к производству развертывание за минуты" | `azd up --environment production` |

### Они работают вместе!

AZD использует Azure CLI под капотом. Можно использовать оба:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Шаблоны в Awesome AZD

Не начинайте с нуля! **Awesome AZD** — это собрание шаблонов, готовых к развертыванию:

| Ресурс | Описание |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Просмотр 200+ шаблонов с развертыванием одним кликом |
| 🔗 [**Отправить шаблон**](https://github.com/Azure/awesome-azd/issues) | Добавьте свой шаблон в сообщество |
| 🔗 [**GitHub репозиторий**](https://github.com/Azure/awesome-azd) | Оцените и изучите исходный код |

### Популярные AI-шаблоны из Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Начало работы в 3 шага

Перед началом убедитесь, что ваша машина готова для выбранного шаблона:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Если какая-либо проверка не пройдена, исправьте это прежде, чем продолжать.

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

### Шаг 2: Аутентификация в AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Если вы не уверены, что нужно, следуйте полному процессу настройки в [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Шаг 3: Разверните своё первое приложение

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Готово!** Ваше приложение теперь работает в Azure.

### Очистка (не забудьте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как использовать этот курс

Курс создан для **пошагового обучения** — начните с удобного для вас уровня и продвигайтесь дальше:

| Ваш опыт | Начинайте здесь |
|-----------------|------------|
| **Новичок в Azure** | [Глава 1: Основы](#-chapter-1-foundation--quick-start) |
| **Знаю Azure, но новичок в AZD** | [Глава 1: Основы](#-chapter-1-foundation--quick-start) |
| **Хочу развертывать AI-приложения** | [Глава 2: Разработка с приоритетом ИИ](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Нужна практика с реальными примерами** | [🎓 Интерактивный мастер-класс](workshop/README.md) - 3-4 часа с руководством |
| **Нужны производственные шаблоны** | [Глава 8: Производство и корпоративные решения](#-chapter-8-production--enterprise-patterns) |

### Быстрая настройка

1. **Форкните этот репозиторий**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонируйте его**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Получите помощь**: [Сообщество Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитаете клонировать локально?**

> Этот репозиторий включает более 50 языковых переводов, что значительно увеличивает размер загрузки. Чтобы клонировать без переводов, используйте выборочную загрузку:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Это даст вам всё необходимое для прохождения курса с гораздо более быстрой загрузкой.


## Обзор курса

Освойте Azure Developer CLI (azd) через структурированные главы, предназначенные для пошагового обучения. **Особое внимание развертыванию AI-приложений с интеграцией Microsoft Foundry.**

### Почему этот курс необходим современным разработчикам

По данным сообщества Microsoft Foundry Discord, **45% разработчиков хотят использовать AZD для AI-нагрузок**, но сталкиваются с трудностями:
- Сложные архитектуры AI с множеством сервисов
- Лучшие практики продуктивного развертывания AI  
- Интеграция и настройка AI-сервисов Azure
- Оптимизация затрат для AI-нагрузок
- Устранение неполадок специфичных для AI-развертывания

### Цели обучения

Пройдя этот структурированный курс, вы:
- **Овладеете основами AZD**: основные концепции, установка и настройка
- **Научитесь развертывать AI-приложения**: использование AZD с сервисами Microsoft Foundry
- **Реализация инфраструктуры как кода**: Управление ресурсами Azure с помощью шаблонов Bicep
- **Поиск и устранение неполадок развертывания**: Решение распространённых проблем и отладка
- **Оптимизация для промышленной эксплуатации**: Безопасность, масштабирование, мониторинг и управление затратами
- **Создание решений с несколькими агентами**: Развертывание сложной архитектуры ИИ

## Перед началом: аккаунты, доступ и предположения

Перед началом Главы 1 убедитесь, что у вас есть всё необходимое. Шаги установки в этой инструкции предполагают, что эти основы уже выполнены.

- **Подписка Azure**: Вы можете использовать существующую рабочую или личную подписку либо создать [бесплатный пробный период](https://aka.ms/azurefreetrial) для начала.
- **Разрешения на создание ресурсов Azure**: Для большинства упражнений вам потребуется доступ как минимум с ролю **Contributor** к целевой подписке или группе ресурсов. В некоторых главах может также предполагаться возможность создавать группы ресурсов, управляемые идентичности и назначения RBAC.
- [**Аккаунт GitHub**](https://github.com): Полезен для форка репозитория, отслеживания своих изменений и использования GitHub Codespaces для воркшопа.
- **Необходимые локальные компоненты для шаблонов**: Некоторые шаблоны требуют наличия локальных инструментов, таких как Node.js, Python, Java или Docker. Запустите валидатор установки перед началом, чтобы своевременно выявить отсутствующие компоненты.
- **Базовые навыки работы с терминалом**: Не нужно быть экспертом, но должно быть комфортно выполнять команды типа `git clone`, `azd auth login` и `azd up`.

> **Работаете в корпоративной подписке?**
> Если вашей средой Azure управляет администратор, заранее уточните, можете ли вы развертывать ресурсы в выбранной подписке или группе ресурсов. Если нет, запросите песочницу или доступ Contributor перед началом.

> **Новичок в Azure?**
> Начните со своей пробной или платежной подписки Azure по адресу https://aka.ms/azurefreetrial, чтобы пройти упражнения полностью без ожидания согласований на уровне арендатора.

## 🗺️ Карта курса: Быстрая навигация по главам

Каждая глава имеет отдельный README с целями обучения, быстрыми стартами и упражнениями:

| Глава | Темы | Уроки | Длительность | Сложность |
|---------|-------|---------|----------|------------|
| **[Гл. 1: Основа](docs/chapter-01-foundation/README.md)** | Начало работы | [Основы AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Установка](docs/chapter-01-foundation/installation.md) &#124; [Первый проект](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Гл. 2: Разработка ИИ](docs/chapter-02-ai-development/README.md)** | Приложения с приоритетом ИИ | [Интеграция Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [ИИ агенты](docs/chapter-02-ai-development/agents.md) &#124; [Развёртывание моделей](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Воркшоп](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 часа | ⭐⭐ |
| **[Гл. 3: Конфигурация](docs/chapter-03-configuration/README.md)** | Аутентификация и безопасность | [Конфигурация](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификация и безопасность](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и развертывание | [Руководство по развертыванию](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Провижининг](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 часа | ⭐⭐⭐ |
| **[Гл. 5: Множество агентов](docs/chapter-05-multi-agent/README.md)** | Решения с ИИ агентами | [Розничный сценарий](examples/retail-scenario.md) &#124; [Шаблоны координации](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 часа | ⭐⭐⭐⭐ |
| **[Гл. 6: Предразвёртывание](docs/chapter-06-pre-deployment/README.md)** | Планирование и проверка | [Проверка перед запуском](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирование ёмкости](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Выбор SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Insights приложений](docs/chapter-06-pre-deployment/application-insights.md) | 1 час | ⭐⭐ |
| **[Гл. 7: Устранение неполадок](docs/chapter-07-troubleshooting/README.md)** | Отладка и исправление | [Распространённые проблемы](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Отладка](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблемы ИИ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 часа | ⭐⭐ |
| **[Гл. 8: Промышленная эксплуатация](docs/chapter-08-production/README.md)** | Предприятийные паттерны | [Практики промышленной эксплуатации](docs/chapter-08-production/production-ai-practices.md) | 2-3 часа | ⭐⭐⭐⭐ |
| **[🎓 Воркшоп](workshop/README.md)** | Практические занятия | [Введение](workshop/docs/instructions/0-Introduction.md) &#124; [Выбор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Проверка](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Декомпозиция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Кастомизация](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Завершение](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Итоги](workshop/docs/instructions/7-Wrap-up.md) | 3-4 часа | ⭐⭐ |

**Общая длительность курса:** ~10-14 часов | **Навыки:** Начинающий → Готовый к промышленной эксплуатации

---

## 📚 Учебные главы

*Выберите путь обучения в зависимости от уровня опыта и целей*

### 🚀 Глава 1: Основы и быстрый старт
**Требования**: Подписка Azure, базовые знания командной строки  
**Длительность**: 30-45 минут  
**Сложность**: ⭐

#### Чему вы научитесь
- Основы Azure Developer CLI
- Установка AZD на вашу платформу
- Ваше первое успешное развертывание

#### Учебные ресурсы
- **🎯 Начните здесь**: [Что такое Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Теория**: [Основы AZD](docs/chapter-01-foundation/azd-basics.md) - Ключевые концепции и терминология
- **⚙️ Установка**: [Инструкция по установке и настройке](docs/chapter-01-foundation/installation.md) - Руководства для платформ
- **🛠️ Практика**: [Ваш первый проект](docs/chapter-01-foundation/first-project.md) - Пошаговое руководство
- **📋 Быстрая справка**: [Шпаргалка по командам](resources/cheat-sheet.md)

#### Практические упражнения
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Результат главы**: Успешное развертывание простого веб-приложения в Azure с помощью AZD

**✅ Критерии успеха:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Время на выполнение:** 30-45 минут  
**📈 Уровень навыков после:** Способен самостоятельно развертывать базовые приложения
**📈 Уровень навыков после:** Способен самостоятельно развертывать базовые приложения

---

### 🤖 Глава 2: Разработка с приоритетом ИИ (Рекомендуется для разработчиков ИИ)
**Требования**: Глава 1 завершена  
**Длительность**: 1-2 часа  
**Сложность**: ⭐⭐

#### Чему вы научитесь
- Интеграция Microsoft Foundry с AZD
- Развёртывание приложений с ИИ
- Настройка сервисов ИИ

#### Учебные ресурсы
- **🎯 Начните здесь**: [Интеграция Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 ИИ агенты**: [Руководство по ИИ агентам](docs/chapter-02-ai-development/agents.md) - Развёртывание интеллектуальных агентов с AZD
- **📖 Шаблоны**: [Развёртывание моделей ИИ](docs/chapter-02-ai-development/ai-model-deployment.md) - Развёртывание и управление моделями ИИ
- **🛠️ Воркшоп**: [Лабораторная работа по ИИ](docs/chapter-02-ai-development/ai-workshop-lab.md) - Подготовьте ваши ИИ решения к AZD
- **🎥 Интерактивное руководство**: [Материалы воркшопа](workshop/README.md) - Обучение в браузере с MkDocs * среда DevContainer
- **📋 Шаблоны**: [Шаблоны Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Примеры**: [Примеры развёртывания AZD](examples/README.md)

#### Практические упражнения
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Результат главы**: Развернуть и настроить чат-приложение с ИИ и возможностями RAG

**✅ Критерии успеха:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Время на выполнение:** 1-2 часа  
**📈 Уровень навыков после:** Готов к развёртыванию и настройке производственных ИИ приложений  
**💰 Знание затрат:** Понимание расходов $80-150/мес на разработку, $300-3500/мес на производство

#### 💰 Затраты на развертывание ИИ

**Среда разработки (примерно $80-150/мес):**
- Модели Microsoft Foundry (по оплате использования): $0-50/мес (в зависимости от использования токенов)
- AI Search (базовый уровень): $75/мес
- Container Apps (потребление): $0-20/мес
- Хранилище (стандартное): $1-5/мес

**Производственная среда (примерно $300-3,500+/мес):**
- Модели Microsoft Foundry (PTU для стабильной производительности): $3,000+/мес ИЛИ по оплате при высоком объёме
- AI Search (стандартный уровень): $250/мес
- Container Apps (выделенные): $50-100/мес
- Application Insights: $5-50/мес
- Хранилище (премиум): $10-50/мес

**💡 Советы по оптимизации затрат:**
- Используйте **бесплатный уровень** моделей Microsoft Foundry для обучения (включено 50,000 токенов Azure OpenAI)
- Выполняйте `azd down` для освобождения ресурсов, когда не занимаетесь разработкой
- Начинайте с оплаты по потреблению, переходя на PTU только для производства
- Используйте `azd provision --preview` для оценки затрат перед развёртыванием
- Включите авто-масштабирование: платите только за фактическое использование

**Мониторинг затрат:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Глава 3: Конфигурация и аутентификация
**Требования**: Глава 1 завершена  
**Длительность**: 45-60 минут  
**Сложность**: ⭐⭐

#### Чему вы научитесь
- Конфигурация и управление средой
- Лучшие практики аутентификации и безопасности
- Именование и организация ресурсов

#### Учебные ресурсы
- **📖 Конфигурация**: [Руководство по конфигурации](docs/chapter-03-configuration/configuration.md) - Настройка среды
- **🔐 Безопасность**: [Шаблоны аутентификации и управляемой идентичности](docs/chapter-03-configuration/authsecurity.md) - Шаблоны аутентификации
- **📝 Примеры**: [Пример приложения с базой данных](examples/database-app/README.md) - Примеры баз данных AZD

#### Практические упражнения
- Конфигурация нескольких сред (разработка, тест, прод)
- Настройка аутентификации управляемой идентичности
- Реализация конфигураций, специфичных для среды

**💡 Результат главы**: Управление несколькими средами с правильной аутентификацией и безопасностью

---

### 🏗️ Глава 4: Инфраструктура как код и развертывание
**Требования**: Главы 1-3 завершены  
**Длительность**: 1-1.5 часа  
**Сложность**: ⭐⭐⭐

#### Чему вы научитесь
- Расширенные шаблоны развертывания
- Инфраструктура как код с Bicep
- Стратегии провижининга ресурсов

#### Учебные ресурсы
- **📖 Развертывание**: [Руководство по развертыванию](docs/chapter-04-infrastructure/deployment-guide.md) - Полные рабочие процессы
- **🏗️ Провижининг**: [Управление ресурсами](docs/chapter-04-infrastructure/provisioning.md) - Управление ресурсами Azure
- **📝 Примеры**: [Пример Container App](../../examples/container-app) - Развёртывание контейнеров

#### Практические упражнения
- Создание пользовательских шаблонов Bicep
- Развёртывание многосервисных приложений
- Реализация стратегий «синее-зеленое» развертывание

**💡 Результат главы**: Развёртывание сложных многосервисных приложений с использованием пользовательских шаблонов инфраструктуры

---

### 🎯 Глава 5: Решения с ИИ агентами (Продвинутый уровень)
**Требования**: Главы 1-2 завершены  
**Длительность**: 2-3 часа  
**Сложность**: ⭐⭐⭐⭐

#### Чему вы научитесь
- Шаблоны архитектуры многозадачных агентов
- Оркестрация и координация агентов
- Развёртывание ИИ решений промышленного уровня

#### Учебные ресурсы
- **🤖 Основной проект**: [Розничное решение с множеством агентов](examples/retail-scenario.md) - Полная реализация
- **🛠️ ARM шаблоны**: [Пакет ARM шаблонов](../../examples/retail-multiagent-arm-template) - Одноразовое развертывание
- **📖 Архитектура**: [Шаблоны координации многоагентных систем](docs/chapter-06-pre-deployment/coordination-patterns.md) - Шаблоны

#### Практические упражнения
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Результат главы**: Развёртывание и управление промышленным многоагентным ИИ решением с агентами клиентов и инвентаря

---

### 🔍 Глава 6: Предварительная проверка и планирование развертывания
**Требования**: Глава 4 завершена  
**Длительность**: 1 час  
**Сложность**: ⭐⭐

#### Чему вы научитесь
- Планирование ёмкости и проверка ресурсов
- Стратегии выбора SKU
- Предварительные проверки и автоматизация

#### Учебные ресурсы
- **📊 Планирование**: [Планирование мощностей](docs/chapter-06-pre-deployment/capacity-planning.md) - Проверка ресурсов
- **💰 Выбор**: [Выбор SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Экономически эффективные варианты
- **✅ Валидация**: [Проверки перед запуском](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизированные скрипты

#### Практические упражнения
- Запуск скриптов проверки мощностей
- Оптимизация выбора SKU для снижения затрат
- Внедрение автоматизированных проверок перед развертыванием

**💡 Результат главы**: Проверка и оптимизация развертываний перед выполнением

---

### 🚨 Глава 7: Поиск и устранение неисправностей и отладка
**Требования**: Завершена любая глава по развертыванию  
**Продолжительность**: 1-1.5 часа  
**Сложность**: ⭐⭐

#### Чему вы научитесь
- Систематическим подходам к отладке
- Распространённым проблемам и способам их решения
- Особенностям устранения неполадок в ИИ

#### Ресурсы для изучения
- **🔧 Распространённые проблемы**: [Распространённые проблемы](docs/chapter-07-troubleshooting/common-issues.md) - Часто задаваемые вопросы и решения
- **🕵️ Отладка**: [Руководство по отладке](docs/chapter-07-troubleshooting/debugging.md) - Пошаговые стратегии
- **🤖 Проблемы с ИИ**: [Устранение неполадок в ИИ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблемы с сервисами ИИ

#### Практические упражнения
- Диагностика сбоев развертывания
- Решение проблем с аутентификацией
- Отладка соединения с сервисом ИИ

**💡 Результат главы**: Самостоятельная диагностика и устранение распространённых проблем развертывания

---

### 🏢 Глава 8: Паттерны для производства и корпоративных решений
**Требования**: Главы 1-4 завершены  
**Продолжительность**: 2-3 часа  
**Сложность**: ⭐⭐⭐⭐

#### Чему вы научитесь
- Стратегиям развертывания в производственной среде
- Корпоративным паттернам безопасности
- Мониторингу и оптимизации затрат

#### Ресурсы для изучения
- **🏭 Производство**: [Лучшие практики AI для продакшена](docs/chapter-08-production/production-ai-practices.md) - Корпоративные паттерны
- **📝 Примеры**: [Пример микросервисов](../../examples/microservices) - Сложные архитектуры
- **📊 Мониторинг**: [Интеграция Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практические упражнения
- Внедрение корпоративных паттернов безопасности
- Настройка комплексного мониторинга
- Развертывание в продакшен с соблюдением корпоративного управления

**💡 Результат главы**: Развёртывание корпоративных приложений с полным набором производственных возможностей

---

## 🎓 Обзор мастерской: Практический обучающий опыт

> **⚠️ СТАТУС МАСТЕРСКОЙ: Активная разработка**  
> Материалы мастерской сейчас разрабатываются и совершенствуются. Основные модули функциональны, но некоторые разделы продвинутого уровня ещё не завершены. Мы активно работаем, чтобы закончить весь контент. [Отслеживать прогресс →](workshop/README.md)

### Интерактивные материалы мастерской
**Комплексное практическое обучение с использованием браузерных инструментов и пошаговых упражнений**

Наши материалы мастерской предлагают структурированный интерактивный опыт обучения, дополняющий главную учебную программу выше. Мастерская рассчитана как на самостоятельное изучение, так и на занятия под руководством преподавателя.

#### 🛠️ Особенности мастерской
- **Интерфейс в браузере**: Полная мастерская на базе MkDocs с поиском, копированием и темами
- **Интеграция GitHub Codespaces**: Настройка среды разработки в один клик
- **Структурированный учебный путь**: 8 модулей с пошаговыми упражнениями (всего 3-4 часа)
- **Прогрессивная методология**: Введение → Выбор → Валидация → Декомпозиция → Конфигурация → Кастомизация → Завершение → Итоги
- **Интерактивная среда DevContainer**: Преднастроенные инструменты и зависимости

#### 📚 Структура модулей мастерской
Мастерская следует **прогрессивной методологии из 8 модулей**, которая ведёт вас от знакомства до мастерства в развертывании:

| Модуль | Тема | Чем вы займётесь | Продолжительность |
|--------|-------|----------------|----------|
| **0. Введение** | Обзор мастерской | Понимание целей обучения, требований и структуры мастерской | 15 мин |
| **1. Выбор** | Обзор шаблонов | Изучение шаблонов AZD и выбор подходящего AI шаблона для вашего сценария | 20 мин |
| **2. Валидация** | Развертывание и проверка | Развертывание шаблона с `azd up` и проверка работоспособности инфраструктуры | 30 мин |
| **3. Декомпозиция** | Понимание структуры | Использование GitHub Copilot для изучения архитектуры шаблона, файлов Bicep и организации кода | 30 мин |
| **4. Конфигурация** | Подробный разбор azure.yaml | Освоение `azure.yaml` конфигурации, lifecycle hooks и переменных окружения | 30 мин |
| **5. Кастомизация** | Сделайте для себя | Включение AI Search, трассировки, оценки и настройка под ваш сценарий | 45 мин |
| **6. Завершение** | Очистка | Безопасное удаление ресурсов с `azd down --purge` | 15 мин |
| **7. Итоги** | Следующие шаги | Обзор достижений, ключевых концепций и продолжение обучения | 15 мин |

**Поток мастерской:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Начало работы с мастерской
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Результаты обучения на мастерской
Пройдя мастерскую, участники смогут:
- **Развертывать AI-приложения для продакшена**: Использовать AZD с сервисами Microsoft Foundry
- **Освоить мультиагентные архитектуры**: Реализовывать скоординированные решения с AI агентами
- **Внедрять лучшие практики безопасности**: Настраивать аутентификацию и контроль доступа
- **Оптимизировать масштабирование**: Проектировать экономичные и производительные развертывания
- **Устранять проблемы развертывания**: Решать распространённые ошибки самостоятельно

#### 📖 Ресурсы мастерской
- **🎥 Интерактивное руководство**: [Материалы мастерской](workshop/README.md) - Обучающая среда в браузере
- **📋 Инструкции по модулям**:
  - [0. Введение](workshop/docs/instructions/0-Introduction.md) - Обзор и цели мастерской
  - [1. Выбор](workshop/docs/instructions/1-Select-AI-Template.md) - Поиск и выбор AI шаблонов
  - [2. Валидация](workshop/docs/instructions/2-Validate-AI-Template.md) - Развертывание и проверка шаблонов
  - [3. Декомпозиция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Изучение архитектуры шаблонов
  - [4. Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) - Освоение azure.yaml
  - [5. Кастомизация](workshop/docs/instructions/5-Customize-AI-Template.md) - Настройка под ваш сценарий
  - [6. Завершение](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Очистка ресурсов
  - [7. Итоги](workshop/docs/instructions/7-Wrap-up.md) - Итоги и дальнейшие шаги
- **🛠️ Лаборатория AI Мастерской**: [Лаборатория AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Упражнения с уклоном на ИИ
- **💡 Быстрый старт**: [Руководство по настройке мастерской](workshop/README.md#quick-start) - Настройка окружения

**Идеально подходит для**: Корпоративных тренингов, университетских курсов, самостоятельного изучения и программ для разработчиков.

---

## 📖 Глубокое погружение: Возможности AZD

Помимо базового функционала, AZD предоставляет мощные возможности для производственных развертываний:

- **Развертывания на базе шаблонов** – Используйте готовые шаблоны для часто встречающихся сценариев приложений
- **Инфраструктура как код** – Управляйте ресурсами Azure с помощью Bicep или Terraform  
- **Интегрированные рабочие процессы** – Беспрепятственное управление, развертывание и мониторинг приложений
- **Ориентированность на разработчика** – Оптимизирован для продуктивности и удобства разработчиков

### **AZD + Microsoft Foundry: Идеально для развертываний ИИ**

**Почему AZD для AI-решений?** AZD решает главные проблемы, с которыми сталкиваются разработчики ИИ:

- **Готовые шаблоны для ИИ** – Преднастроенные шаблоны для моделей Microsoft Foundry, Azure AI сервисов и ML нагрузок
- **Безопасные развертывания ИИ** – Встроенные паттерны безопасности для сервисов ИИ, API ключей и конечных точек моделей  
- **Паттерны для продакшен ИИ** – Лучшие практики для масштабируемых и экономичных AI-приложений
- **Конечные рабочие процессы для ИИ** – От разработки модели до развертывания в продакшен с мониторингом
- **Оптимизация затрат** – Интеллектуальное распределение ресурсов и стратегии масштабирования для AI нагрузок
- **Интеграция с Microsoft Foundry** – Бесшовное подключение к каталогу моделей и конечным точкам Microsoft Foundry

---

## 🎯 Библиотека шаблонов и примеров

### Рекомендуемые: Шаблоны Microsoft Foundry
**Начните здесь, если вы развёртываете AI-приложения!**

> **Примечание:** Эти шаблоны демонстрируют различные AI паттерны. Некоторые из них – внешние примеры Azure Samples, другие – локальные реализации.

| Шаблон | Глава | Сложность | Сервисы | Тип |
|----------|---------|------------|----------|------|
| [**Начало работы с AI чатами**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Внешний |
| [**Начало работы с AI агентами**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Внешний |
| [**Демонстрация Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Внешний |
| [**Быстрый старт OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Внешний |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Внешний |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Внешний |
| [**Розничное мультиагентное решение**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локальный** |

### Рекомендуемые: Полные учебные сценарии
**Шаблоны приложений для продакшена, соответствующие учебным главам**

| Шаблон | Учебная глава | Сложность | Ключевые навыки |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Основные паттерны развертывания AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | Реализация RAG с Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Глава 4 | ⭐⭐ | Интеграция Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Фреймворк агентов и вызов функций |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Корпоративная оркестрация AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Мультиагентная архитектура с агентами по клиентам и запасам |

### Обучение по типу примера

> **📌 Локальные vs. Внешние примеры:**  
> **Локальные примеры** (в этом репозитории) = Готовы к использованию сразу  
> **Внешние примеры** (Azure Samples) = Клонировать из связанных репозиториев

#### Локальные примеры (Готовы к использованию)
- [**Розничное мультиагентное решение**](examples/retail-scenario.md) - Полная реализация для продакшена с ARM шаблонами
  - Мультиагентная архитектура (агенты клиентов и запасов)
  - Комплексный мониторинг и оценка
  - Развертывание в один клик с помощью ARM шаблона

#### Локальные примеры - Контейнерные приложения (главы 2-5)
**Полные примеры развертывания контейнеров в этом репозитории:**
- [**Примеры контейнерных приложений**](examples/container-app/README.md) - Полное руководство по контейнерному развертыванию
  - [Простой Flask API](../../examples/container-app/simple-flask-api) - Базовый REST API с масштабированием до нуля
  - [Архитектура микросервисов](../../examples/container-app/microservices) - Продакшен-развертывание с несколькими сервисами
  - Быстрый старт, производственные и продвинутые паттерны развертывания
  - Руководство по мониторингу, безопасности и оптимизации затрат

#### Внешние примеры - Простые приложения (главы 1-2)
**Клонируйте эти репозитории Azure Samples для начала:**
- [Простое веб-приложение - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Базовые паттерны развертывания
- [Статический сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Развертывание статического контента
- [Контейнерное приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Развертывание REST API

#### Внешние примеры - Интеграция баз данных (главы 3-4)  
- [Приложение с базой данных - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Паттерны подключения к базе данных
- [Функции + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Безсерверные данные и рабочие процессы

#### Внешние примеры - Продвинутые паттерны (главы 4-8)
- [Java микросервисы](https://github.com/Azure-Samples/java-microservices-aca-lab) - Архитектуры с несколькими сервисами
- [Контейнерные приложения и задачи](https://github.com/Azure-Samples/container-apps-jobs) - Фоновая обработка  
- [Корпоративный ML пайплайн](https://github.com/Azure-Samples/mlops-v2) - Продакшен-ориентированные ML паттерны

### Коллекции внешних шаблонов
- [**Официальная галерея шаблонов AZD**](https://azure.github.io/awesome-azd/) - Подборка официальных и сообществных шаблонов
- [**Шаблоны Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Документация по шаблонам Microsoft Learn
- [**Каталог примеров**](examples/README.md) - Локальные учебные примеры с подробными объяснениями

---

## 📚 Ресурсы для обучения и ссылки

### Быстрые ссылки
- [**Шпаргалка команд**](resources/cheat-sheet.md) - Важнейшие команды azd, организованные по главам
- [**Глоссарий**](resources/glossary.md) - Термины Azure и azd  
- [**Часто задаваемые вопросы**](resources/faq.md) - Частые вопросы, организованные по главам обучения
- [**Учебное руководство**](resources/study-guide.md) - Всеобъемлющие практические упражнения

### Практические мастер-классы
- [**Лаборатория мастер-класса по ИИ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Сделайте ваши ИИ-решения готовыми к развертыванию с помощью AZD (2-3 часа)
- [**Интерактивный мастер-класс**](workshop/README.md) - 8 модулей с пошаговыми упражнениями с MkDocs и GitHub Codespaces
  - Последовательность: Введение → Выбор → Проверка → Деконструкция → Конфигурация → Настройка → Завершение → Итоги

### Внешние обучающие ресурсы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор стоимости Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

### Навыки ИИ-агентов для вашего редактора
- [**Навыки Microsoft Azure на skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 открытых навыков агентов для Azure AI, Foundry, развертывания, диагностики, оптимизации стоимости и др. Устанавливайте их в GitHub Copilot, Cursor, Claude Code или любом поддерживаемом агенте:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Быстрое руководство по устранению неполадок

**Распространённые проблемы начинающих и их мгновенные решения:**

<details>
<summary><strong>❌ "azd: команда не найдена"</strong></summary>

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
<summary><strong>❌ "Подписка не найдена" или "Подписка не установлена"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" или "Превышена квота"</strong></summary>

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
<summary><strong>❌ "azd up" завершается с ошибкой на середине</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Аутентификация не удалась" или "Токен истёк"</strong></summary>

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
<summary><strong>❌ "Ресурс уже существует" или конфликты имён</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Развёртывание шаблона занимает слишком много времени</strong></summary>

**Нормальное время ожидания:**
- Простое веб-приложение: 5-10 минут
- Приложение с базой данных: 10-15 минут
- ИИ-приложения: 15-25 минут (Provisioning OpenAI идет медленно)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Доступ запрещён" или "Запрещено"</strong></summary>

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
<summary><strong>❌ Не удаётся найти URL развернутого приложения</strong></summary>

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

### 📚 Полные ресурсы по устранению неполадок

- **Руководство по общим проблемам:** [Подробные решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблемы, связанные с ИИ:** [Устранение неполадок ИИ](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Руководство по отладке:** [Пошаговая отладка](docs/chapter-07-troubleshooting/debugging.md)
- **Получить помощь:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершение курса и сертификация

### Отслеживание прогресса
Отслеживайте ваш прогресс обучения в каждой главе:

- [ ] **Глава 1**: Основы и быстрый старт ✅
- [ ] **Глава 2**: Разработка с приоритетом ИИ ✅  
- [ ] **Глава 3**: Конфигурация и аутентификация ✅
- [ ] **Глава 4**: Инфраструктура как код и развертывание ✅
- [ ] **Глава 5**: Многоагентные ИИ-решения ✅
- [ ] **Глава 6**: Валидация и планирование перед развертыванием ✅
- [ ] **Глава 7**: Устранение неполадок и отладка ✅
- [ ] **Глава 8**: Продакшн и корпоративные шаблоны ✅

### Проверка усвоения материала
После завершения каждой главы подтвердите свои знания, выполнив:
1. **Практическое упражнение**: Выполните развертывание из главы
2. **Проверку знаний**: Ознакомьтесь с разделом FAQ по главе
3. **Обсуждение с сообществом**: Поделитесь опытом в Azure Discord
4. **Следующая глава**: Перейдите к следующему уровню сложности

### Преимущества завершения курса
После прохождения всех глав вы получите:
- **Опыт работы в продакшне**: Развернутые реальные ИИ-приложения в Azure
- **Профессиональные навыки**: Возможность разворачивать решения для корпоративного уровня  
- **Признание в сообществе**: Активный участник сообщества Azue-разработчиков
- **Карьерный рост**: Востребованная экспертиза по AZD и развертыванию ИИ

---

## 🤝 Сообщество и поддержка

### Получение помощи и поддержки
- **Технические проблемы**: [Сообщить об ошибках и запрашивать функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Вопросы по обучению**: [Сообщество Microsoft Azure Discord](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощь по ИИ**: Присоединяйтесь к [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официальная документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Мнения сообщества из Microsoft Foundry Discord

**Недавние результаты опроса в канале #Azure:**
- **45%** разработчиков хотят использовать AZD для ИИ-нагрузок
- **Основные вызовы**: Много-сервисные развертывания, управление учётными данными, готовность к продакшну  
- **Наиболее востребованные**: Шаблоны для ИИ, руководства по устранению неполадок, лучшие практики

**Присоединяйтесь к нашему сообществу, чтобы:**
- Делиться опытом использования AZD + ИИ и получать помощь
- Получать ранний доступ к новым шаблонам ИИ
- Вносить вклад в лучшие практики развертывания ИИ
- Влиять на разработку будущих функций ИИ + AZD

### Внесение вклада в курс
Мы приветствуем вклад! Пожалуйста, прочитайте наше [Руководство по внесению вкладов](CONTRIBUTING.md) для деталей о:
- **Улучшении контента**: Улучшение существующих глав и примеров
- **Новых примерах**: Добавление реальных сценариев и шаблонов  
- **Переводе**: Помощь в поддержании многоязычной поддержки
- **Сообщениях об ошибках**: Повышение точности и ясности
- **Стандартах сообщества**: Соблюдение наших инклюзивных правил сообщества

---

## 📄 Информация о курсе

### Лицензия
Этот проект лицензирован под MIT License - см. файл [LICENSE](../../LICENSE) для подробностей.

### Связанные обучающие ресурсы Microsoft

Наша команда выпускает и другие всесторонние обучающие курсы:

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
[![ИИ агенты для начинающих](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия по генеративному ИИ
[![Генеративный ИИ для начинающих](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Генеративный ИИ (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Генеративный ИИ (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Генеративный ИИ (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основное обучение
[![Машинное обучение для начинающих](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Наука о данных для начинающих](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![ИИ для начинающих](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кибербезопасность для начинающих](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб-разработка для начинающих](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT для начинающих](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-разработка для начинающих](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Copilot
[![Copilot для парного программирования ИИ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot для C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Приключения Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Навигация по курсу

**🚀 Готовы начать обучение?**

**Новички**: Начните с [Глава 1: Основы и быстрый старт](#-chapter-1-foundation--quick-start)  
**Разработчики ИИ**: Перейдите к [Главе 2: Разработка с приоритетом ИИ](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Опытные разработчики**: Начинайте с [Глава 3: Конфигурация и аутентификация](#️-chapter-3-configuration--authentication)

**Следующие шаги**: [Начать главу 1 - Основы AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->