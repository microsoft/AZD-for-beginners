<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T18:32:03+00:00",
  "source_file": "README.md",
  "language_code": "ru"
}
-->
# AZD для начинающих

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ru.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)

Следуйте этим шагам, чтобы начать использовать данные ресурсы:
1. **Сделайте форк репозитория**: Нажмите [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонируйте репозиторий**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Присоединяйтесь к сообществам Azure Discord, чтобы встретить экспертов и других разработчиков**](https://discord.com/invite/ByRwuEEgH4)

### Поддержка нескольких языков

#### Поддерживается через GitHub Action (автоматически и всегда актуально)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](./README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Если вы хотите добавить поддержку дополнительных языков, список доступных языков можно найти [здесь](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Введение

Добро пожаловать в подробное руководство по Azure Developer CLI (azd). Этот репозиторий создан для того, чтобы помочь разработчикам любого уровня — от студентов до профессионалов — изучить и освоить Azure Developer CLI для эффективного развертывания в облаке, **с особым акцентом на развертывание AI-приложений с использованием Azure AI Foundry**. Структурированный учебный ресурс предоставляет практический опыт работы с облачными развертываниями Azure, устранением распространенных проблем и внедрением лучших практик для успешного использования шаблонов AZD.

### **Почему это руководство важно для разработчиков AI**
Согласно недавнему опросу сообщества Azure AI Foundry Discord, **45% разработчиков заинтересованы в использовании AZD для AI-нагрузок**, но сталкиваются с трудностями:
- Сложные архитектуры AI с несколькими сервисами
- Лучшие практики для развертывания AI в продакшене
- Интеграция и настройка сервисов Azure AI
- Оптимизация затрат для AI-нагрузок
- Устранение проблем, специфичных для развертывания AI

## Цели обучения

Работая с этим репозиторием, вы:
- Освоите основы и ключевые концепции Azure Developer CLI
- Научитесь развертывать и предоставлять ресурсы Azure с использованием Infrastructure as Code
- Разовьете навыки устранения распространенных проблем с развертыванием AZD
- Поймете, как проводить проверку перед развертыванием и планирование емкости
- Внедрите лучшие практики безопасности и стратегии оптимизации затрат
- Уверенно будете развертывать готовые к продакшену приложения в Azure

## Результаты обучения

После завершения курса вы сможете:
- Успешно установить, настроить и использовать Azure Developer CLI
- Создавать и развертывать приложения с использованием шаблонов AZD
- Устранять проблемы с аутентификацией, инфраструктурой и развертыванием
- Проводить проверки перед развертыванием, включая планирование емкости и выбор SKU
- Внедрять лучшие практики мониторинга, безопасности и управления затратами
- Интегрировать рабочие процессы AZD в CI/CD пайплайны

## Содержание

- [Что такое Azure Developer CLI?](../..)
- [Быстрый старт](../..)
- [Путь обучения](../..)
  - [Для разработчиков AI (рекомендуем начать здесь!)](../..)
  - [Для студентов и начинающих](../..)
  - [Для разработчиков](../..)
  - [Для инженеров DevOps](../..)
- [Документация](../..)
  - [Начало работы](../..)
  - [Развертывание и предоставление ресурсов](../..)
  - [Проверки перед развертыванием](../..)
  - [AI и Azure AI Foundry](../..)
  - [Устранение проблем](../..)
- [Примеры и шаблоны](../..)
  - [Рекомендуемые: шаблоны Azure AI Foundry](../..)
  - [Рекомендуемые: сценарии Azure AI Foundry E2E](../..)
  - [Дополнительные шаблоны AZD](../..)
  - [Практические лаборатории и воркшопы](../..)
- [Ресурсы](../..)
- [Вклад в проект](../..)
- [Поддержка](../..)
- [Сообщество](../..)

## Что такое Azure Developer CLI?

Azure Developer CLI (azd) — это ориентированный на разработчиков интерфейс командной строки, который ускоряет процесс создания и развертывания приложений в Azure. Он предоставляет:

- **Развертывание на основе шаблонов** — использование готовых шаблонов для распространенных паттернов приложений
- **Infrastructure as Code** — управление ресурсами Azure с помощью Bicep или Terraform
- **Интегрированные рабочие процессы** — бесшовное предоставление, развертывание и мониторинг приложений
- **Удобство для разработчиков** — оптимизировано для продуктивности и удобства разработчиков

### **AZD + Azure AI Foundry: идеально для развертывания AI**

**Почему AZD для AI-решений?** AZD решает основные проблемы, с которыми сталкиваются разработчики AI:

- **Шаблоны, готовые к AI** — предварительно настроенные шаблоны для Azure OpenAI, Cognitive Services и ML-нагрузок
- **Безопасное развертывание AI** — встроенные шаблоны безопасности для AI-сервисов, API-ключей и конечных точек моделей
- **Паттерны для AI в продакшене** — лучшие практики для масштабируемого и экономичного развертывания AI-приложений
- **Полные рабочие процессы AI** — от разработки модели до развертывания в продакшене с мониторингом
- **Оптимизация затрат** — умное распределение ресурсов и стратегии масштабирования для AI-нагрузок
- **Интеграция с Azure AI Foundry** — бесшовное подключение к каталогу моделей и конечным точкам AI Foundry

## Быстрый старт

### Предварительные требования
- Подписка Azure
- Установленный Azure CLI
- Git (для клонирования шаблонов)

### Установка
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Ваше первое развертывание
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Ваше первое развертывание AI
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## Путь обучения

### Для разработчиков AI (рекомендуем начать здесь!)
1. **Быстрый старт**: попробуйте [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) шаблон
2. **Изучите основы**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Практика**: завершите [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **Готовность к продакшену**: изучите [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)
5. **Продвинутый уровень**: разверните [contoso-chat](https://github.com/Azure-Samples/contoso-chat) шаблон для предприятий

### Для студентов и начинающих
1. Начните с [AZD Basics](docs/getting-started/azd-basics.md)
2. Следуйте [Руководству по установке](docs/getting-started/installation.md)
3. Завершите [Ваш первый проект](docs/getting-started/first-project.md)
4. Практикуйтесь с [Примером простого веб-приложения](../../examples/simple-web-app)

### Для разработчиков
1. Ознакомьтесь с [Руководством по настройке](docs/getting-started/configuration.md)
2. Изучите [Руководство по развертыванию](docs/deployment/deployment-guide.md)
3. Работайте с [Примером приложения с базой данных](../../examples/database-app)
4. Исследуйте [Пример контейнерного приложения](../../examples/container-app)

### Для инженеров DevOps
1. Освойте [Предоставление ресурсов](docs/deployment/provisioning.md)
2. Реализуйте [Проверки перед развертыванием](docs/pre-deployment/preflight-checks.md)
3. Практикуйтесь с [Планированием емкости](docs/pre-deployment/capacity-planning.md)
4. Продвинутый [Пример микросервисов](../../examples/microservices)

## Документация

### Начало работы
- [**AZD Basics**](docs/getting-started/azd-basics.md) — основные концепции и терминология
- [**Установка и настройка**](docs/getting-started/installation.md) — руководства по установке для разных платформ
- [**Настройка**](docs/getting-started/configuration.md) — настройка окружения и аутентификация
- [**Ваш первый проект**](docs/getting-started/first-project.md) — пошаговый учебник

### Развертывание и предоставление ресурсов
- [**Руководство по развертыванию**](docs/deployment/deployment-guide.md) — полные рабочие процессы развертывания
- [**Предоставление ресурсов**](docs/deployment/provisioning.md) — управление ресурсами Azure

### Проверки перед развертыванием
- [**Планирование емкости**](docs/pre-deployment/capacity-planning.md) — проверка емкости ресурсов Azure
- [**Выбор SKU**](docs/pre-deployment/sku-selection.md) — выбор подходящих SKU Azure
- [**Проверки перед развертыванием**](docs/pre-deployment/preflight-checks.md) — автоматизированные скрипты проверки

### AI и Azure AI Foundry
- [**Интеграция с Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) — подключение AZD к сервисам Azure AI Foundry
- [**Паттерны развертывания моделей AI**](docs/ai-foundry/ai-model-deployment.md) — развертывание и управление моделями AI с помощью AZD
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) — практическая лаборатория: подготовка AI-решений к AZD
- [**Лучшие практики для AI в продакшене**](docs/ai-foundry/production-ai-practices.md) — безопасность, масштабирование и мониторинг AI-нагрузок

### Устранение проблем
- [**Распространенные проблемы**](docs/troubleshooting/common-issues.md) — часто встречающиеся проблемы и их решения
- [**Руководство по отладке**](docs/troubleshooting/debugging.md) - Пошаговые стратегии отладки  
- [**Устранение проблем, связанных с ИИ**](docs/troubleshooting/ai-troubleshooting.md) - Проблемы с сервисами ИИ и развертыванием моделей  

## Примеры и шаблоны  

### [Рекомендуемые: Шаблоны Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**Начните здесь, если вы развертываете приложения на основе ИИ!**  

| Шаблон | Описание | Сложность | Сервисы |  
|----------|-------------|------------|----------|  
| [**Начало работы с AI чатами**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Создайте и разверните базовое приложение для чата, интегрированное с вашими данными и телеметрией, используя Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Начало работы с AI агентами**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Создайте и разверните базовое приложение-агент с действиями и телеметрией, используя Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Автоматизация рабочих процессов с несколькими агентами**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Улучшите планирование задач и автоматизацию, организуя и управляя группой AI агентов.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Создание документов из ваших данных**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Ускорьте создание документов, таких как контракты, счета и инвестиционные предложения, находя и суммируя релевантную информацию из ваших данных. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Улучшение клиентских встреч с агентами**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Перенос устаревшего кода на современные языки с помощью команды агентов. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Модернизация вашего кода с агентами**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Создайте и разверните базовое приложение для чата, интегрированное с вашими данными и телеметрией, используя Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Создание вашего разговорного агента**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Используйте расширенное понимание разговоров для создания и улучшения чат-ботов и агентов с детерминированными и управляемыми человеком рабочими процессами. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Получение инсайтов из данных разговоров**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Повышение эффективности контакт-центров путем извлечения инсайтов из больших аудио- и текстовых наборов данных с использованием расширенных возможностей анализа контента. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Мультимодальная обработка контента**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Быстрая и точная обработка заявлений, счетов, контрактов и других документов путем извлечения информации из неструктурированного контента и преобразования ее в структурированный формат. Этот шаблон поддерживает текст, изображения, таблицы и графики. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Рекомендуемые: Сценарии Azure AI Foundry E2E  
**Начните здесь, если вы развертываете приложения на основе ИИ!**  

| Шаблон | Описание | Сложность | Сервисы |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Простой интерфейс чата с Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Чат-приложение с поддержкой RAG и Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Анализ документов с помощью AI сервисов | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Фреймворк AI агентов с вызовом функций | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Корпоративный чат с оркестрацией ИИ | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Дополнительные шаблоны AZD  
- [**Каталог примеров**](examples/README.md) - Практические примеры, шаблоны и реальные сценарии  
- [**Шаблоны AZD от Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Официальные шаблоны от Microsoft  
- [**Галерея Awesome AZD**](https://azure.github.io/awesome-azd/) - Шаблоны, созданные сообществом  

### Практические лаборатории и мастер-классы  
- [**Лаборатория AI Workshop**](docs/ai-foundry/ai-workshop-lab.md) - **НОВОЕ**: Сделайте свои AI решения готовыми к развертыванию через AZD  
- [**Мастер-класс AZD для начинающих**](workshop/README.md) - Фокус на развертывании шаблонов AI Agents через AZD  

## Ресурсы  

### Быстрые ссылки  
- [**Список команд**](resources/cheat-sheet.md) - Основные команды azd  
- [**Глоссарий**](resources/glossary.md) - Терминология Azure и azd  
- [**FAQ**](resources/faq.md) - Часто задаваемые вопросы  
- [**Руководство по обучению**](resources/study-guide.md) - Полные учебные цели и практические упражнения  

### Внешние ресурсы  
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Калькулятор цен Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Статус Azure](https://status.azure.com/)  

## Вклад  

Мы приветствуем ваш вклад! Пожалуйста, ознакомьтесь с нашим [Руководством по внесению изменений](CONTRIBUTING.md) для получения информации о:  
- Как отправлять запросы на исправления и новые функции  
- Руководства по внесению изменений в код  
- Улучшения документации  
- Стандарты сообщества  

## Поддержка  

- **Проблемы**: [Сообщить о багах и запросить функции](https://github.com/microsoft/azd-for-beginners/issues)  
- **Обсуждения**: [Сообщество Microsoft Azure в Discord: вопросы и обсуждения](https://discord.gg/microsoft-azure)  
- **Поддержка, связанная с ИИ**: Присоединяйтесь к [каналу #Azure](https://discord.gg/microsoft-azure) для обсуждений AZD + AI Foundry  
- **Электронная почта**: Для частных запросов  
- **Microsoft Learn**: [Официальная документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Инсайты сообщества из Discord Azure AI Foundry  

**Результаты опроса из канала #Azure:**  
- **45%** разработчиков хотят использовать AZD для рабочих нагрузок ИИ  
- **Основные проблемы**: Развертывание нескольких сервисов, управление учетными данными, готовность к производству  
- **Наиболее запрашиваемое**: Шаблоны, связанные с ИИ, руководства по устранению проблем, лучшие практики  

**Присоединяйтесь к нашему сообществу, чтобы:**  
- Делиться своим опытом использования AZD + AI и получать помощь  
- Получать ранний доступ к новым шаблонам ИИ  
- Вносить вклад в лучшие практики развертывания ИИ  
- Влиять на разработку будущих функций AZD + AI  

## Лицензия  

Этот проект лицензирован на условиях лицензии MIT - см. файл [LICENSE](../../LICENSE) для подробностей.  

## Другие курсы  

Наша команда создает другие курсы! Ознакомьтесь:  

- [**НОВОЕ** Протокол контекста модели (MCP) для начинающих](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI агенты для начинающих](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративный ИИ для начинающих с использованием .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Генеративный ИИ для начинающих](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративный ИИ для начинающих с использованием Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [Машинное обучение для начинающих](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Наука о данных для начинающих](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [ИИ для начинающих](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Кибербезопасность для начинающих](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Веб-разработка для начинающих](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT для начинающих](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Разработка XR для начинающих](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Мастерство GitHub Copilot для парного программирования с ИИ](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Мастерство GitHub Copilot для разработчиков C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Выберите свое приключение с Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Навигация**  
- **Следующий урок**: [Основы AZD](docs/getting-started/azd-basics.md)  

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникающие в результате использования данного перевода.