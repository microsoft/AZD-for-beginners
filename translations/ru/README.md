# AZD для начинающих: структурированное обучение

![AZD-for-beginners](../../translated_images/ru/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Автоматические переводы (всегда актуально)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Арабский](../ar/README.md) | [Бенгальский](../bn/README.md) | [Болгарский](../bg/README.md) | [Бирманский (Мьянма)](../my/README.md) | [Китайский (упрощённый)](../zh-CN/README.md) | [Китайский (традиционный, Гонконг)](../zh-HK/README.md) | [Китайский (традиционный, Макао)](../zh-MO/README.md) | [Китайский (традиционный, Тайвань)](../zh-TW/README.md) | [Хорватский](../hr/README.md) | [Чешский](../cs/README.md) | [Датский](../da/README.md) | [Нидерландский](../nl/README.md) | [Эстонский](../et/README.md) | [Финский](../fi/README.md) | [Французский](../fr/README.md) | [Немецкий](../de/README.md) | [Греческий](../el/README.md) | [Иврит](../he/README.md) | [Хинди](../hi/README.md) | [Венгерский](../hu/README.md) | [Индонезийский](../id/README.md) | [Итальянский](../it/README.md) | [Японский](../ja/README.md) | [Каннада](../kn/README.md) | [Корейский](../ko/README.md) | [Литовский](../lt/README.md) | [Малазийский](../ms/README.md) | [Малаялам](../ml/README.md) | [Маратхи](../mr/README.md) | [Непальский](../ne/README.md) | [Нигерийский пиджин](../pcm/README.md) | [Норвежский](../no/README.md) | [Персидский (фарси)](../fa/README.md) | [Польский](../pl/README.md) | [Португальский (Бразилия)](../pt-BR/README.md) | [Португальский (Португалия)](../pt-PT/README.md) | [Пенджаби (гурмукхи)](../pa/README.md) | [Румынский](../ro/README.md) | [Русский](./README.md) | [Сербский (кириллица)](../sr/README.md) | [Словацкий](../sk/README.md) | [Словенский](../sl/README.md) | [Испанский](../es/README.md) | [Свахили](../sw/README.md) | [Шведский](../sv/README.md) | [Тагальский (филиппинский)](../tl/README.md) | [Тамильский](../ta/README.md) | [Телугу](../te/README.md) | [Тайский](../th/README.md) | [Турецкий](../tr/README.md) | [Украинский](../uk/README.md) | [Урду](../ur/README.md) | [Вьетнамский](../vi/README.md)

> **Предпочитаете клонировать локально?**
>
> В этом репозитории есть более 50 переводов, что значительно увеличивает размер загрузки. Чтобы клонировать без переводов, используйте sparse checkout:
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
> Это позволит загрузить всё необходимое для прохождения курса значительно быстрее.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Что такое Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** — это удобный командный инструмент для разработчиков, который упрощает развертывание приложений в Azure. Вместо ручного создания и настройки множества ресурсов Azure, вы можете развернуть целые приложения одной командой.

### Магия команды `azd up`

```bash
# Эта одна команда делает всё:
# ✅ Создаёт все ресурсы Azure
# ✅ Настраивает сеть и безопасность
# ✅ Собирает код вашего приложения
# ✅ Развертывает в Azure
# ✅ Предоставляет рабочий URL
azd up
```

**Вот и всё!** Никаких кликов в Azure Portal, никаких сложных ARM-шаблонов для изучения, никакой ручной настройки — просто рабочие приложения в Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: в чём разница?

Это самый частый вопрос у новичков. Вот простой ответ:

| Особенность | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|-------------|---------------------|--------------------------------|
| **Назначение** | Управление отдельными ресурсами Azure | Развертывание полного приложения |
| **Подход** | Ориентирован на инфраструктуру | Ориентирован на приложение |
| **Пример** | `az webapp create --name myapp...` | `azd up` |
| **Крутая кривая обучения** | Нужно знать сервисы Azure | Нужно знать только свое приложение |
| **Для кого лучше** | Девопсы, инфраструктура | Разработчики, прототипирование |

### Простая аналогия

- **Azure CLI** — это как иметь весь инструмент для строительства дома: молотки, пилы, гвозди. Можно построить всё, но нужно знать строительное дело.
- **Azure Developer CLI** — это как нанять подрядчика: вы описываете, что хотите, а он строит.

### Когда использовать что

| Сценарий | Используйте |
|----------|------------|
| "Хочу быстро развернуть веб-приложение" | `azd up` |
| "Мне нужно создать только учетную запись хранения" | `az storage account create` |
| "Я строю полноценное AI-приложение" | `azd init --template azure-search-openai-demo` |
| "Мне нужно отладить определенный ресурс Azure" | `az resource show` |
| "Хочу развертывание уровня производства за минуты" | `azd up --environment production` |

### Они работают вместе!

AZD использует Azure CLI под капотом. Вы можете использовать оба:
```bash
# Разверните приложение с помощью AZD
azd up

# Затем тонко настройте конкретные ресурсы с помощью Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Найдите шаблоны в Awesome AZD

Не начинайте с нуля! **Awesome AZD** — сообщественное собрание готовых для развертывания шаблонов:

| Ресурс | Описание |
|--------|----------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Более 200 шаблонов с развертыванием в один клик |
| 🔗 [**Отправить шаблон**](https://github.com/Azure/awesome-azd/issues) | Внесите свой шаблон в сообщество |
| 🔗 [**Репозиторий на GitHub**](https://github.com/Azure/awesome-azd) | Оцените звёздочкой и изучите исходники |

### Популярные AI шаблоны из Awesome AZD

```bash
# RAG-чат с Azure OpenAI и AI Search
azd init --template azure-search-openai-demo

# Быстрое чат-приложение с ИИ
azd init --template openai-chat-app-quickstart

# Агенты ИИ с использованием Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Начало работы за 3 шага

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

### Шаг 2: Войдите в Azure

```bash
azd auth login
```

### Шаг 3: Разверните ваше первое приложение

```bash
# Инициализировать из шаблона
azd init --template todo-nodejs-mongo

# Развернуть в Azure (создаёт всё!)
azd up
```

**🎉 Вот и всё!** Ваше приложение теперь работает в Azure.

### Очистка (не забудьте!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Как использовать этот курс

Этот курс разработан для **постепенного обучения** — начинайте там, где вам удобно, и двигайтесь дальше:

| Ваш опыт | Начинайте здесь |
|----------|-----------------|
| **Полностью новичок в Azure** | [Глава 1: Основа](../..) |
| **Знаете Azure, новичок в AZD** | [Глава 1: Основа](../..) |
| **Хотите развертывать AI-приложения** | [Глава 2: AI-первый подход](../..) |
| **Хотите практическую работу** | [🎓 Интерактивный воркшоп](workshop/README.md) — 3-4 часовой лабораторный курс |
| **Нужны производственные паттерны** | [Глава 8: Производство и предпродакшн](../..) |

### Быстрая настройка

1. **Создайте форк этого репозитория**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонируйте**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Получите помощь**: [Сообщество Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Предпочитаете клонировать локально?**

> В этом репозитории есть более 50 переводов, что значительно увеличивает размер загрузки. Чтобы клонировать без переводов, используйте sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Это позволит загрузить всё необходимое для прохождения курса значительно быстрее.

## Обзор курса

Освойте Azure Developer CLI (azd) через структурированные главы, разработанные для постепенного обучения. **Особое внимание – развертывание AI-приложений с интеграцией Microsoft Foundry.**

### Почему этот курс важен для современных разработчиков

На основе инсайтов сообщества Microsoft Foundry Discord, **45% разработчиков хотят использовать AZD для AI-нагрузок**, но сталкиваются с проблемами:
- Сложными мультисервисными AI архитектурами
- Лучшей практикой развертывания AI в продакшн  
- Интеграцией и настройкой Azure AI сервисов
- Оптимизацией затрат на AI-нагрузки
- Устранением проблем развертывания, специфичных для AI

### Цели обучения

Завершив этот структурированный курс, вы:
- **Освоите основы AZD**: ключевые концепции, установка и настройка
- **Развернёте AI приложения**: использование AZD с сервисами Microsoft Foundry
- **Внедрите инфраструктуру как код**: управление ресурсами Azure через шаблоны Bicep
- **Устраните проблемы развертывания**: диагностика типичных и сложных ошибок
- **Оптимизируете для продакшн**: безопасность, масштабирование, мониторинг и управление затратами
- **Создадите мультиагентные решения**: развертывание сложных AI архитектур

## 🗺️ Карта курса: быстрая навигация по главам

У каждой главы есть собственный README с целями, быстрым стартом и упражнениями:

| Глава | Тема | Уроки | Время | Сложность |
|-------|-------|-------|-------|-----------|
| **[Глава 1: Основа](docs/chapter-01-foundation/README.md)** | Начало работы | [Основы AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Установка](docs/chapter-01-foundation/installation.md) &#124; [Первый проект](docs/chapter-01-foundation/first-project.md) | 30-45 мин | ⭐ |
| **[Глава 2: Разработка AI](docs/chapter-02-ai-development/README.md)** | AI-первый подход | [Интеграция Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI агенты](docs/chapter-02-ai-development/agents.md) &#124; [Развёртывание модели](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Воркшоп](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 часа | ⭐⭐ |
| **[Глава 3: Конфигурация](docs/chapter-03-configuration/README.md)** | Аутентификация и безопасность | [Конфигурация](docs/chapter-03-configuration/configuration.md) &#124; [Аутентификация и безопасность](docs/chapter-03-configuration/authsecurity.md) | 45-60 мин | ⭐⭐ |
| **[Гл. 4: Инфраструктура](docs/chapter-04-infrastructure/README.md)** | IaC и Развертывание | [Руководство по развертыванию](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 часа | ⭐⭐⭐ |
| **[Гл. 5: Мультиагентные системы](docs/chapter-05-multi-agent/README.md)** | Решения на основе AI Агентов | [Розничный сценарий](examples/retail-scenario.md) &#124; [Паттерны координации](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 часа | ⭐⭐⭐⭐ |
| **[Гл. 6: Предварительное развертывание](docs/chapter-06-pre-deployment/README.md)** | Планирование и проверка | [Предварительные проверки](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Планирование емкости](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Выбор SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 час | ⭐⭐ |
| **[Гл. 7: Устранение неполадок](docs/chapter-07-troubleshooting/README.md)** | Отладка и исправление | [Типичные проблемы](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Отладка](docs/chapter-07-troubleshooting/debugging.md) &#124; [Проблемы AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 часа | ⭐⭐ |
| **[Гл. 8: Производство](docs/chapter-08-production/README.md)** | Корпоративные паттерны | [Практики производства](docs/chapter-08-production/production-ai-practices.md) | 2-3 часа | ⭐⭐⭐⭐ |
| **[🎓 Мастерская](workshop/README.md)** | Практическая лаборатория | [Введение](workshop/docs/instructions/0-Introduction.md) &#124; [Выбор](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Проверка](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Деконструкция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Настройка](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Завершение](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Итоговые шаги](workshop/docs/instructions/7-Wrap-up.md) | 3-4 часа | ⭐⭐ |

**Общая продолжительность курса:** ~10-14 часов | **Прогресс навыков:** Начинающий → Готов к производству

---

## 📚 Обучающие главы

*Выберите путь обучения в зависимости от уровня опыта и целей*

### 🚀 Глава 1: Основы и быстрый старт
**Требования**: подписка Azure, базовые знания командной строки  
**Продолжительность**: 30-45 минут  
**Сложность**: ⭐

#### Что вы узнаете
- Основы Azure Developer CLI
- Установку AZD на вашу платформу
- Ваше первое успешное развертывание

#### Ресурсы для обучения
- **🎯 Начать здесь**: [Что такое Azure Developer CLI?](../..)
- **📖 Теория**: [Основы AZD](docs/chapter-01-foundation/azd-basics.md) - Ключевые концепции и терминология
- **⚙️ Настройка**: [Установка и настройка](docs/chapter-01-foundation/installation.md) - Руководства по платформам
- **🛠️ Практика**: [Ваш первый проект](docs/chapter-01-foundation/first-project.md) - Пошаговое руководство
- **📋 Быстрая справка**: [Шпаргалка по командам](resources/cheat-sheet.md)

#### Практические упражнения
```bash
# Быстрая проверка установки
azd version

# Разверните ваше первое приложение
azd init --template todo-nodejs-mongo
azd up
```

**💡 Итог главы**: Успешно развернуть простое веб-приложение в Azure с помощью AZD

**✅ Проверка успеха:**
```bash
# После завершения первой главы вы должны уметь:
azd version              # Показать установленную версию
azd init --template todo-nodejs-mongo  # Инициализировать проект
azd up                  # Развернуть в Azure
azd show                # Отобразить URL работающего приложения
# Приложение открывается в браузере и работает
azd down --force --purge  # Очистить ресурсы
```

**📊 Временные затраты:** 30-45 минут  
**📈 Уровень навыков после:** Способен самостоятельно развернуть базовые приложения

**✅ Проверка успеха:**
```bash
# После завершения первой главы вы должны уметь:
azd version              # Показывает установленную версию
azd init --template todo-nodejs-mongo  # Инициализирует проект
azd up                  # Развертывает в Azure
azd show                # Отображает URL запущенного приложения
# Приложение открывается в браузере и работает
azd down --force --purge  # Очищает ресурсы
```

**📊 Временные затраты:** 30-45 минут  
**📈 Уровень навыков после:** Способен самостоятельно развернуть базовые приложения

---

### 🤖 Глава 2: Разработка с приоритетом на AI (Рекомендуется для AI-разработчиков)
**Требования**: Глава 1 завершена  
**Продолжительность**: 1-2 часа  
**Сложность**: ⭐⭐

#### Что вы узнаете
- Интеграция Microsoft Foundry с AZD
- Развертывание приложений с ИИ
- Понимание конфигураций AI-служб

#### Ресурсы для обучения
- **🎯 Начать здесь**: [Интеграция Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-агенты**: [Руководство по AI агентам](docs/chapter-02-ai-development/agents.md) - Развертывание интеллектуальных агентов с помощью AZD
- **📖 Паттерны**: [Развертывание AI-моделей](docs/chapter-02-ai-development/ai-model-deployment.md) - Управление AI-моделями
- **🛠️ Мастерская**: [Лабораторная работа AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Делайте ваши AI-решения готовыми к AZD
- **🎥 Интерактивное руководство**: [Материалы мастерской](workshop/README.md) - Обучение в браузере с MkDocs * Среда DevContainer
- **📋 Шаблоны**: [Шаблоны Microsoft Foundry](../..)
- **📝 Примеры**: [Примеры развертывания AZD](examples/README.md)

#### Практические упражнения
```bash
# Разверните ваше первое AI-приложение
azd init --template azure-search-openai-demo
azd up

# Попробуйте дополнительные шаблоны AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Итог главы**: Развернуть и настроить AI-чат-приложение с возможностями RAG

**✅ Проверка успеха:**
```bash
# После главы 2 вы должны уметь:
azd init --template azure-search-openai-demo
azd up
# Тестировать интерфейс AI-чата
# Задавать вопросы и получать ответы с поддержкой ИИ с источниками
# Проверить, что интеграция поиска работает
azd monitor  # Проверить, что Application Insights отображает телеметрию
azd down --force --purge
```

**📊 Временные затраты:** 1-2 часа  
**📈 Уровень навыков после:** Способен развернуть и настроить производственные AI-приложения  
**💰 Оценка затрат:** Понимание затрат $80-150/месяц на разработку, $300-3500/месяц в продакшене

#### 💰 Оценка затрат на AI-развертывания

**Среда разработки (Оценочно $80-150/месяц):**
- Azure OpenAI (Оплата по факту): $0-50/месяц (в зависимости от использования токенов)
- AI Search (базовый уровень): $75/месяц
- Container Apps (Consumption): $0-20/месяц
- Хранение (Стандарт): $1-5/месяц

**Производственная среда (Оценочно $300-3500+/месяц):**
- Azure OpenAI (PTU для стабильной производительности): $3,000+/месяц ИЛИ Оплата по факту при большом объеме
- AI Search (стандартный уровень): $250/месяц
- Container Apps (Dedicated): $50-100/месяц
- Application Insights: $5-50/месяц
- Хранение (Премиум): $10-50/месяц

**💡 Советы по оптимизации затрат:**
- Используйте **Free Tier** Azure OpenAI для обучения (включено 50 000 токенов в месяц)
- Запускайте `azd down` для освобождения ресурсов при отсутствии активной разработки
- Начинайте с оплаты по факту, переходите на PTU только для продакшена
- Используйте `azd provision --preview` для предварительной оценки затрат перед развертыванием
- Включайте автоскейлинг: платите только за фактическое использование

**Мониторинг затрат:**
```bash
# Проверить предполагаемые ежемесячные расходы
azd provision --preview

# Отслеживать фактические расходы в портале Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Глава 3: Конфигурация и аутентификация
**Требования**: Глава 1 завершена  
**Продолжительность**: 45-60 минут  
**Сложность**: ⭐⭐

#### Что вы узнаете
- Настройка и управление окружениями
- Лучшие практики аутентификации и безопасности
- Именование ресурсов и организация

#### Ресурсы для обучения
- **📖 Конфигурация**: [Руководство по конфигурации](docs/chapter-03-configuration/configuration.md) - Настройка окружения
- **🔐 Безопасность**: [Паттерны аутентификации и управляемые идентичности](docs/chapter-03-configuration/authsecurity.md) - Паттерны аутентификации
- **📝 Примеры**: [Пример приложения с базой данных](examples/database-app/README.md) - Примеры баз данных в AZD

#### Практические упражнения
- Настройте несколько окружений (dev, staging, prod)
- Настройте аутентификацию с управляемой идентичностью
- Реализуйте специфичные для окружения конфигурации

**💡 Итог главы**: Управление несколькими окружениями с правильной аутентификацией и безопасностью

---

### 🏗️ Глава 4: Инфраструктура как Код и Развертывание
**Требования**: Главы 1-3 завершены  
**Продолжительность**: 1-1.5 часа  
**Сложность**: ⭐⭐⭐

#### Что вы узнаете
- Продвинутые паттерны развертывания
- Инфраструктура как код с Bicep
- Стратегии провиженинга ресурсов

#### Ресурсы для обучения
- **📖 Развертывание**: [Руководство по развертыванию](docs/chapter-04-infrastructure/deployment-guide.md) - Полные рабочие процессы
- **🏗️ Провиженинг**: [Provisioning ресурсов](docs/chapter-04-infrastructure/provisioning.md) - Управление ресурсами Azure
- **📝 Примеры**: [Пример Container App](../../examples/container-app) - Контейнерные развертывания

#### Практические упражнения
- Создайте свои шаблоны Bicep
- Разверните многосервисные приложения
- Реализуйте стратегии блю-грин развертывания

**💡 Итог главы**: Развернуть сложные многосервисные приложения с использованием кастомных инфраструктурных шаблонов

---

### 🎯 Глава 5: Мультиагентные AI-решения (Продвинутый уровень)
**Требования**: Главы 1-2 завершены  
**Продолжительность**: 2-3 часа  
**Сложность**: ⭐⭐⭐⭐

#### Что вы узнаете
- Паттерны архитектуры мультиагентов
- Оркестровка и координация агентов
- Производственные AI-развертывания

#### Ресурсы для обучения
- **🤖 Рекомендуемый проект**: [Мультиагентное решение в ритейле](examples/retail-scenario.md) - Полная реализация
- **🛠️ ARM шаблоны**: [Пакет ARM шаблонов](../../examples/retail-multiagent-arm-template) - Однокликовое развертывание
- **📖 Архитектура**: [Паттерны координации мультиагентов](docs/chapter-06-pre-deployment/coordination-patterns.md) - Паттерны

#### Практические упражнения
```bash
# Развернуть полное многопользовательское решение для розничной торговли
cd examples/retail-multiagent-arm-template
./deploy.sh

# Изучить конфигурации агентов
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Итог главы**: Развернуть и управлять производственным мультиагентным AI-решением с агентами Customer и Inventory

---

### 🔍 Глава 6: Предварительная проверка и планирование развертывания
**Требования**: Глава 4 завершена  
**Продолжительность**: 1 час  
**Сложность**: ⭐⭐

#### Что вы узнаете
- Планирование емкости и проверка ресурсов
- Стратегии выбора SKU
- Предварительные проверки и автоматизация

#### Ресурсы для обучения
- **📊 Планирование**: [Планирование емкости](docs/chapter-06-pre-deployment/capacity-planning.md) - Проверка ресурсов
- **💰 Выбор**: [Выбор SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Выбор с учетом затрат
- **✅ Проверка**: [Предварительные проверки](docs/chapter-06-pre-deployment/preflight-checks.md) - Автоматизированные скрипты

#### Практические упражнения
- Запустите скрипты проверки емкости
- Оптимизируйте выбор SKU для снижения затрат
- Реализуйте автоматизированные проверки перед развертыванием

**💡 Итог главы**: Проверка и оптимизация развертываний перед выполнением

---

### 🚨 Глава 7: Устранение неполадок и отладка
**Требования**: Любая глава с развертыванием завершена  
**Продолжительность**: 1-1.5 часа  
**Сложность**: ⭐⭐

#### Что вы узнаете
- Систематические методы отладки
- Типичные проблемы и решения
- Специфические для AI методы устранения неполадок

#### Ресурсы для обучения
- **🔧 Типичные проблемы**: [Типичные проблемы](docs/chapter-07-troubleshooting/common-issues.md) - FAQ и решения
- **🕵️ Отладка**: [Руководство по отладке](docs/chapter-07-troubleshooting/debugging.md) - Пошаговые стратегии
- **🤖 Проблемы AI**: [Отладка AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Проблемы AI-служб

#### Практические упражнения
- Диагностируйте ошибки развертывания
- Решайте проблемы аутентификации
- Отлаживайте подключение AI-служб

**💡 Итог главы**: Самостоятельно диагностировать и решать типичные проблемы развертывания

---

### 🏢 Глава 8: Производство и корпоративные паттерны
**Требования**: Главы 1-4 завершены  
**Продолжительность**: 2-3 часа  
**Сложность**: ⭐⭐⭐⭐

#### Что вы узнаете
- Стратегии производственного развертывания
- Корпоративные паттерны безопасности
- Мониторинг и оптимизация затрат

#### Ресурсы для обучения
- **🏭 Производство**: [Лучшие практики AI для производства](docs/chapter-08-production/production-ai-practices.md) - Корпоративные паттерны
- **📝 Примеры**: [Пример микросервисов](../../examples/microservices) - Сложные архитектуры
- **📊 Мониторинг**: [Интеграция Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Мониторинг

#### Практические упражнения
- Реализуйте корпоративные паттерны безопасности
- Настройте комплексный мониторинг
- Разверните в продакшене с корректным управлением

**💡 Итог главы**: Развернуть корпоративные приложения с полным набором производственных функций

---

## 🎓 Обзор мастерской: Практический опыт обучения

> **⚠️ СТАТУС МАСТЕРСКОЙ: Активная разработка**  

> Материалы мастерской в настоящее время разрабатываются и дорабатываются. Основные модули функционируют, но некоторые продвинутые разделы еще не завершены. Мы активно работаем над завершением всего контента. [Отслеживать прогресс →](workshop/README.md)

### Интерактивные материалы мастерской
**Комплексное практическое обучение с использованием инструментов в браузере и пошаговых упражнений**

Наши материалы мастерской предоставляют структурированный, интерактивный учебный опыт, который дополняет вышеуказанную учебную программу по главам. Мастерская рассчитана как на самостоятельное обучение, так и на занятия с инструктором.

#### 🛠️ Особенности мастерской
- **Интерфейс в браузере**: Полноценная мастерская на базе MkDocs с поиском, копированием и темами оформления
- **Интеграция с GitHub Codespaces**: Одним кликом создайте среду разработки
- **Структурированный путь обучения**: 8 модулей с пошаговыми упражнениями (всего 3-4 часа)
- **Прогрессивная методология**: Введение → Выбор → Проверка → Декомпозиция → Конфигурация → Кастомизация → Снятие с поддержки → Итоги
- **Интерактивная среда DevContainer**: Преднастроенные инструменты и зависимости

#### 📚 Структура модулей мастерской
Мастерская следует **8-модульной прогрессивной методологии**, которая проведет вас от изучения до освоения развертывания:

| Модуль | Тема | Что Вы Будете Делать | Продолжительность |
|--------|-------|---------------------|-------------------|
| **0. Введение** | Обзор мастерской | Ознакомитесь с целями обучения, требованиями и структурой мастерской | 15 мин |
| **1. Выбор** | Поиск шаблона | Изучите шаблоны AZD и выберите подходящий AI-шаблон для вашего сценария | 20 мин |
| **2. Проверка** | Развертывание и проверка | Разверните шаблон с помощью `azd up` и проверьте работу инфраструктуры | 30 мин |
| **3. Декомпозиция** | Понимание структуры | Используйте GitHub Copilot для изучения архитектуры шаблона, Bicep-файлов и организации кода | 30 мин |
| **4. Конфигурация** | Глубокое изучение azure.yaml | Освойте конфигурацию `azure.yaml`, хуки жизненного цикла и переменные окружения | 30 мин |
| **5. Кастомизация** | Сделайте по-своему | Включите AI Search, трассировку, оценку и адаптируйте под свой сценарий | 45 мин |
| **6. Снятие с поддержки** | Очистка | Безопасно удалите ресурсы с помощью `azd down --purge` | 15 мин |
| **7. Итоги** | Следующие шаги | Подведите итоги, повторите ключевые концепции и продолжите обучение | 15 мин |

**Последовательность мастерской:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Начало работы с мастерской
```bash
# Вариант 1: GitHub Codespaces (рекомендуется)
# Нажмите "Code" → "Create codespace on main" в репозитории

# Вариант 2: Локальная разработка
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Следуйте инструкциям по настройке в workshop/README.md
```

#### 🎯 Результаты обучения в мастерской
Выполнив мастерскую, участники смогут:
- **Развертывать производственные AI-приложения**: Использовать AZD с сервисами Microsoft Foundry
- **Освоить многоагентные архитектуры**: Реализовать скоординированные решения с AI-агентами
- **Внедрять лучшие практики безопасности**: Настраивать аутентификацию и контроль доступа
- **Оптимизировать масштабирование**: Проектировать экономичные и производительные развертывания
- **Устранять неполадки в развертываниях**: Самостоятельно решать типичные проблемы

#### 📖 Ресурсы мастерской
- **🎥 Интерактивное руководство**: [Материалы мастерской](workshop/README.md) — среда обучения в браузере
- **📋 Инструкции по модулям**:
  - [0. Введение](workshop/docs/instructions/0-Introduction.md) — обзор и цели мастерской
  - [1. Выбор](workshop/docs/instructions/1-Select-AI-Template.md) — поиск и выбор AI-шаблонов
  - [2. Проверка](workshop/docs/instructions/2-Validate-AI-Template.md) — развертывание и проверка шаблонов
  - [3. Декомпозиция](workshop/docs/instructions/3-Deconstruct-AI-Template.md) — изучение архитектуры шаблонов
  - [4. Конфигурация](workshop/docs/instructions/4-Configure-AI-Template.md) — освоение azure.yaml
  - [5. Кастомизация](workshop/docs/instructions/5-Customize-AI-Template.md) — адаптация под свой сценарий
  - [6. Снятие с поддержки](workshop/docs/instructions/6-Teardown-Infrastructure.md) — очистка ресурсов
  - [7. Итоги](workshop/docs/instructions/7-Wrap-up.md) — обзор и дальнейшие шаги
- **🛠️ Лаборатория AI Мастерской**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) — упражнения по AI
- **💡 Быстрый старт**: [Руководство по настройке мастерской](workshop/README.md#quick-start) — конфигурация окружения

**Идеально подходит для**: корпоративного обучения, университетских курсов, самостоятельного изучения и буткемпов для разработчиков.

---

## 📖 Глубокое погружение: возможности AZD

Помимо базовых функций, AZD предоставляет мощные возможности для производственных развертываний:

- **Развертывания на основе шаблонов** — используйте готовые шаблоны для типовых приложений
- **Инфраструктура как код** — управляйте ресурсами Azure с помощью Bicep или Terraform  
- **Интегрированные рабочие процессы** — бесшовное обеспечение, развертывание и мониторинг приложений
- **Дружественный разработчикам** — оптимизировано для продуктивности и удобства работы

### **AZD + Microsoft Foundry: идеальное решение для AI-развертываний**

**Почему AZD для AI-решений?** AZD решает ключевые задачи, с которыми сталкиваются разработчики AI:

- **Готовые AI-шаблоны** — преднастроенные шаблоны для Azure OpenAI, Cognitive Services и ML-нагрузок
- **Безопасные AI-развертывания** — встроенные паттерны безопасности для AI-сервисов, ключей API и конечных точек моделей  
- **Производственные AI-паттерны** — лучшие практики масштабируемых и экономичных AI-приложений
- **Полный цикл AI-рабочих процессов** — от разработки модели до производственного развертывания с мониторингом
- **Оптимизация затрат** — интеллектуальное распределение ресурсов и стратегии масштабирования AI-нагрузок
- **Интеграция с Microsoft Foundry** — бесшовное подключение к каталогу моделей и конечным точкам Foundry

---

## 🎯 Библиотека шаблонов и примеров

### Важное: Шаблоны Microsoft Foundry
**Начните здесь, если развертываете AI-приложения!**

> **Примечание:** Эти шаблоны демонстрируют различные AI-паттерны. Некоторые из них — внешние Azure Samples, другие — локальные реализации.

| Шаблон | Глава | Сложность | Сервисы | Тип |
|----------|---------|------------|----------|------|
| [**Начало работы с AI-чатом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Внешний |
| [**Начало работы с AI-агентами**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Глава 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Внешний |
| [**Демонстрация Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Внешний |
| [**Быстрый старт OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Внешний |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Внешний |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Внешний |
| [**Ритейл многоагентное решение**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Локальный** |

### Важное: Полные учебные сценарии
**Производственные шаблоны приложений соответствуют главам обучения**

| Шаблон | Учебная глава | Сложность | Основные знания |
|----------|------------------|------------|------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Глава 2 | ⭐ | Базовые паттерны развертывания AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Глава 2 | ⭐⭐ | Реализация RAG с Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Глава 4 | ⭐⭐ | Интеграция Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Глава 5 | ⭐⭐⭐ | Фреймворк агентов и вызов функций |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Глава 8 | ⭐⭐⭐ | Корпоративная оркестрация AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Глава 5 | ⭐⭐⭐⭐ | Многоагентная архитектура с агентами Клиентов и Запасов |

### Обучение по типам примеров

> **📌 Локальные vs Внешние примеры:**  
> **Локальные примеры** (в этом репозитории) = Готовы к немедленному использованию  
> **Внешние примеры** (Azure Samples) = Клонируйте из указанных репозиториев

#### Локальные примеры (Готовы к использованию)
- [**Ритейл многоагентное решение**](examples/retail-scenario.md) — Полноценная производственная реализация с ARM-шаблонами
  - Многоагентная архитектура (агенты Клиентов и Запасов)
  - Комплексный мониторинг и оценка
  - Развертывание в один клик через ARM-шаблон

#### Локальные примеры — Контейнерные приложения (Главы 2–5)
**Полные примеры развертывания контейнеров в этом репозитории:**
- [**Примеры контейнерных приложений**](examples/container-app/README.md) — Полное руководство по развертыванию контейнеров
  - [Простой Flask API](../../examples/container-app/simple-flask-api) — Базовый REST API с масштабированием до нуля
  - [Микросервисная архитектура](../../examples/container-app/microservices) — Производственное мультисервисное развертывание
  - Быстрый старт, производственные и продвинутые паттерны развертывания
  - Руководство по мониторингу, безопасности и оптимизации затрат

#### Внешние примеры — Простые приложения (Главы 1–2)
**Клонируйте эти репозитории Azure Samples, чтобы начать:**
- [Приложение todo - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) — Базовые паттерны развертывания
- [Статический сайт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) — Развертывание статического контента
- [Контейнерное приложение - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) — Развертывание REST API

#### Внешние примеры — Интеграция с базой данных (Главы 3–4)  
- [Приложение с базой данных - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) — Паттерны подключения к базе данных
- [Функции + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) — Безсерверные сценарии работы с данными

#### Внешние примеры — Продвинутые паттерны (Главы 4–8)
- [Java микросервисы](https://github.com/Azure-Samples/java-microservices-aca-lab) — Архитектуры с множеством сервисов
- [Задачи для контейнерных приложений](https://github.com/Azure-Samples/container-apps-jobs) — Фоновая обработка  
- [Корпоративный ML-пайплайн](https://github.com/Azure-Samples/mlops-v2) — Производственные ML-паттерны

### Внешние коллекции шаблонов
- [**Официальная галерея шаблонов AZD**](https://azure.github.io/awesome-azd/) — Курируемая коллекция официальных и сообщества шаблонов
- [**Шаблоны Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) — Документация по шаблонам на Microsoft Learn
- [**Каталог примеров**](examples/README.md) — Локальные учебные примеры с подробными пояснениями

---

## 📚 Ресурсы и ссылки для обучения

### Быстрые ссылки
- [**Шпаргалка по командам**](resources/cheat-sheet.md) — Основные команды azd, организованные по главам
- [**Глоссарий**](resources/glossary.md) — Терминология Azure и azd  
- [**Часто задаваемые вопросы**](resources/faq.md) — Распространённые вопросы по главам обучения
- [**Учебное руководство**](resources/study-guide.md) — Комплексные практические упражнения

### Практические мастерские
- [**Лаборатория AI мастерской**](docs/chapter-02-ai-development/ai-workshop-lab.md) — Сделайте свои AI-решения доступными для развертывания через AZD (2–3 часа)
- [**Интерактивная мастерская**](workshop/README.md) — 8 модулей с пошаговыми упражнениями MkDocs и GitHub Codespaces  
  - Последовательность: Введение → Выбор → Проверка → Декомпозиция → Конфигурация → Кастомизация → Снятие с поддержки → Итоги

### Внешние обучающие ресурсы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор стоимости Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

---

## 🔧 Быстрое руководство по устранению неполадок

**Распространённые проблемы у начинающих и немедленные решения:**

<details>
<summary><strong>❌ «azd: команда не найдена»</strong></summary>

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
<summary><strong>❌ «Подписка не найдена» или «Подписка не установлена»</strong></summary>

```bash
# Список доступных подписок
az account list --output table

# Установить подписку по умолчанию
az account set --subscription "<subscription-id-or-name>"

# Установить для среды AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Проверить
az account show
```
</details>
<details>
<summary><strong>❌ "Недостаточно квоты" или "Квота превышена"</strong></summary>

```bash
# Попробуйте другой регион Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Или используйте более мелкие SKU в разработке
# Отредактируйте infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" падает на полпути</strong></summary>

```bash
# Вариант 1: Очистить и попробовать снова
azd down --force --purge
azd up

# Вариант 2: Просто исправить инфраструктуру
azd provision

# Вариант 3: Проверить подробный статус
azd show

# Вариант 4: Проверить логи в Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Ошибка аутентификации" или "Срок действия токена истек"</strong></summary>

```bash
# Повторная аутентификация
az logout
az login

azd auth logout
azd auth login

# Проверить аутентификацию
az account show
```
</details>

<details>
<summary><strong>❌ "Ресурс уже существует" или конфликты имен</strong></summary>

```bash
# AZD генерирует уникальные имена, но в случае конфликта:
azd down --force --purge

# Затем повторите попытку с новой средой
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Развёртывание шаблона занимает слишком много времени</strong></summary>

**Обычное время ожидания:**
- Простой веб-приложение: 5-10 минут
- Приложение с базой данных: 10-15 минут
- AI-приложения: 15-25 минут (Provisioning OpenAI идет медленно)

```bash
# Проверить прогресс
azd show

# Если зависло более 30 минут, проверить портал Azure:
azd monitor
# Ищите неудачные развертывания
```
</details>

<details>
<summary><strong>❌ "Доступ запрещён" или "Запрещено"</strong></summary>

```bash
# Проверьте вашу роль в Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Вам нужна как минимум роль "Участник"
# Попросите администратора Azure предоставить:
# - Участник (для ресурсов)
# - Администратор доступа пользователей (для назначений ролей)
```
</details>

<details>
<summary><strong>❌ Не удаётся найти URL развернутого приложения</strong></summary>

```bash
# Показать все конечные точки сервиса
azd show

# Или открыть портал Azure
azd monitor

# Проверить конкретный сервис
azd env get-values
# Искать переменные *_URL
```
</details>

### 📚 Полные Ресурсы по Устранению Проблем

- **Руководство по общим проблемам:** [Подробные решения](docs/chapter-07-troubleshooting/common-issues.md)
- **Проблемы, связанные с ИИ:** [Устранение проблем с ИИ](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Руководство по отладке:** [Пошаговая отладка](docs/chapter-07-troubleshooting/debugging.md)
- **Получить помощь:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Завершение курса и получение сертификата

### Отслеживание прогресса
Отслеживайте ваш прогресс по каждой главе:

- [ ] **Глава 1**: Основы и быстрый старт ✅
- [ ] **Глава 2**: Разработка с приоритетом на ИИ ✅  
- [ ] **Глава 3**: Конфигурация и аутентификация ✅
- [ ] **Глава 4**: Инфраструктура как код и развертывание ✅
- [ ] **Глава 5**: Многоагентные ИИ решения ✅
- [ ] **Глава 6**: Предварительная проверка и планирование ✅
- [ ] **Глава 7**: Устранение проблем и отладка ✅
- [ ] **Глава 8**: Рабочие процессы и корпоративные шаблоны ✅

### Проверка знаний
После окончания каждой главы подтвердите свои знания:
1. **Практическое упражнение**: Выполните практическое развертывание главы
2. **Проверка знаний**: Просмотрите раздел FAQ по вашей главе
3. **Обсуждение в сообществе**: Поделитесь опытом в Azure Discord
4. **Следующая глава**: Переходите к следующему уровню сложности

### Преимущества завершения курса
По окончании всех глав вы получите:
- **Опыт работы в продакшене**: Реализованные реальные ИИ-приложения в Azure
- **Профессиональные навыки**: Возможности развертывания, готовые к корпоративному использованию  
- **Признание в сообществе**: Активное членство в сообществе разработчиков Azure
- **Карьера и развитие**: Востребованные навыки AZD и развертывания ИИ

---

## 🤝 Сообщество и поддержка

### Получить помощь и поддержку
- **Технические проблемы**: [Сообщить об ошибках и запросить функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Вопросы по обучению**: [Сообщество Microsoft Azure Discord](https://discord.gg/microsoft-azure) и [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Помощь по ИИ**: Присоединяйтесь к [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Документация**: [Официальная документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Информация от сообщества Microsoft Foundry Discord

**Результаты недавнего опроса канала #Azure:**
- **45%** разработчиков хотят использовать AZD для ИИ-задач
- **Основные вызовы**: Много-сервисное развертывание, управление учётными данными, готовность к продакшену  
- **Самое востребованное**: Шаблоны для ИИ, руководства по устранению неполадок, лучшие практики

**Присоединяйтесь к сообществу, чтобы:**
- Делитесь опытом по AZD + AI и получайте помощь
- Получайте ранний доступ к новым шаблонам для ИИ
- Вносите вклад в лучшие практики развертывания ИИ
- Влияйте на развитие будущих функций AI + AZD

### Внесение вклада в курс
Мы приветствуем ваши предложения! Пожалуйста, ознакомьтесь с нашим [Руководством по внесению вклада](CONTRIBUTING.md) для подробностей о:
- **Улучшении контента**: Улучшайте существующие главы и примеры
- **Новых примерах**: Добавляйте реальные сценарии и шаблоны  
- **Переводе**: Помогайте поддерживать многоязычную поддержку
- **Сообщениях об ошибках**: Улучшайте точность и ясность
- **Стандартах сообщества**: Следуйте нашим инклюзивным правилам сообщества

---

## 📄 Информация о курсе

### Лицензия
Этот проект лицензирован на условиях MIT License - см. файл [LICENSE](../../LICENSE) для подробностей.

### Связанные обучающие ресурсы Microsoft

Наша команда выпускает другие комплексные обучающие курсы:

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
[![AI Agents для начинающих](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия по генеративному ИИ
[![Generative AI для начинающих](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Основное обучение
[![ML для начинающих](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science для начинающих](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI для начинающих](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Кибербезопасность для начинающих](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Веб-разработка для начинающих](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT для начинающих](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-разработка для начинающих](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Серия Copilot
[![Copilot для AI парного программирования](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot для C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Навигация по курсу

**🚀 Готовы начать обучение?**

**Начинающие**: Начните с [Глава 1: Основы и быстрый старт](../..)  
**Разработчики AI**: Перейдите к [Глава 2: Разработка с приоритетом AI](../..)  
**Опытные разработчики**: Начните с [Глава 3: Конфигурация и аутентификация](../..)

**Следующие шаги**: [Начать Глава 1 - Основы AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведён с помощью автоматического переводческого сервиса [Co-op Translator](https://github.com/Azure/co-op-translator). Мы стремимся к точности, однако следует учитывать, что машинный перевод может содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, вызванные использованием данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->