<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T18:42:49+00:00",
  "source_file": "README.md",
  "language_code": "ru"
}
-->
# AZD для начинающих

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ru.png) 

Следуйте этим шагам, чтобы начать использовать эти ресурсы:
1. **Сделайте форк репозитория**: Нажмите [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонируйте репозиторий**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Присоединяйтесь к сообществам Azure Discord и познакомьтесь с экспертами и разработчиками**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Поддержка нескольких языков

#### Поддерживается через GitHub Action (автоматически и всегда актуально)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](./README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Если вы хотите добавить поддержку дополнительных языков, список доступных языков находится [здесь](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Введение

Добро пожаловать в подробное руководство по Azure Developer CLI (azd). Этот репозиторий создан для того, чтобы помочь разработчикам любого уровня — от студентов до профессионалов — изучить и освоить Azure Developer CLI для эффективного развертывания в облаке. Структурированный учебный ресурс предоставляет практический опыт работы с облачными развертываниями Azure, устранением распространенных проблем и внедрением лучших практик для успешного использования шаблонов AZD.

## Цели обучения

Работая с этим репозиторием, вы:
- Освоите основы и ключевые концепции Azure Developer CLI
- Научитесь развертывать и предоставлять ресурсы Azure с использованием Infrastructure as Code
- Разовьете навыки устранения распространенных проблем при развертывании AZD
- Поймете, как проводить проверку перед развертыванием и планирование емкости
- Внедрите лучшие практики безопасности и стратегии оптимизации затрат
- Уверенно будете развертывать готовые к производству приложения в Azure

## Результаты обучения

После завершения курса вы сможете:
- Успешно установить, настроить и использовать Azure Developer CLI
- Создавать и развертывать приложения с использованием шаблонов AZD
- Устранять проблемы с аутентификацией, инфраструктурой и развертыванием
- Выполнять проверки перед развертыванием, включая планирование емкости и выбор SKU
- Внедрять лучшие практики мониторинга, безопасности и управления затратами
- Интегрировать рабочие процессы AZD в CI/CD пайплайны

## Содержание

- [Что такое Azure Developer CLI?](../..)
- [Быстрый старт](../..)
- [Документация](../..)
- [Примеры и шаблоны](../..)
- [Ресурсы](../..)
- [Участие](../..)

## Что такое Azure Developer CLI?

Azure Developer CLI (azd) — это ориентированный на разработчиков интерфейс командной строки, который ускоряет процесс создания и развертывания приложений в Azure. Он предоставляет:

- **Развертывания на основе шаблонов** — Используйте готовые шаблоны для распространенных архитектур приложений
- **Infrastructure as Code** — Управляйте ресурсами Azure с помощью Bicep или Terraform
- **Интегрированные рабочие процессы** — Легко предоставляйте, развертывайте и мониторьте приложения
- **Удобство для разработчиков** — Оптимизировано для продуктивности и удобства разработчиков

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

## Документация

### Начало работы
- [**Основы AZD**](docs/getting-started/azd-basics.md) — Основные концепции и терминология
- [**Установка и настройка**](docs/getting-started/installation.md) — Руководства по установке для разных платформ
- [**Конфигурация**](docs/getting-started/configuration.md) — Настройка окружения и аутентификация
- [**Ваш первый проект**](docs/getting-started/first-project.md) — Пошаговый учебник

### Развертывание и предоставление ресурсов
- [**Руководство по развертыванию**](docs/deployment/deployment-guide.md) — Полные рабочие процессы развертывания
- [**Предоставление ресурсов**](docs/deployment/provisioning.md) — Управление ресурсами Azure

### Проверки перед развертыванием
- [**Планирование емкости**](docs/pre-deployment/capacity-planning.md) — Проверка емкости ресурсов Azure
- [**Выбор SKU**](docs/pre-deployment/sku-selection.md) — Выбор подходящих SKU Azure
- [**Проверки перед развертыванием**](docs/pre-deployment/preflight-checks.md) — Автоматизированные скрипты проверки

### Устранение неполадок
- [**Распространенные проблемы**](docs/troubleshooting/common-issues.md) — Часто встречающиеся проблемы и их решения
- [**Руководство по отладке**](docs/troubleshooting/debugging.md) — Пошаговые стратегии отладки

## Примеры и шаблоны

### Шаблоны для начинающих
- [**Простое веб-приложение**](../../examples/simple-web-app) — Развертывание базового веб-приложения на Node.js
- [**Статический сайт**](../../examples/static-website) — Хостинг статического сайта на Azure Storage
- [**Приложение в контейнере**](../../examples/container-app) — Развертывание контейнеризированного приложения
- [**Приложение с базой данных**](../../examples/database-app) — Веб-приложение с интеграцией базы данных

### Сложные сценарии
- [**Микросервисы**](../../examples/microservices) — Архитектура многосервисного приложения
- [**Функции без сервера**](../../examples/serverless-function) — Развертывание Azure Functions
- [**Примеры конфигураций**](../../examples/configurations) — Повторно используемые шаблоны конфигураций

## Ресурсы

### Быстрые ссылки
- [**Список команд**](resources/cheat-sheet.md) — Основные команды azd
- [**Глоссарий**](resources/glossary.md) — Терминология Azure и azd
- [**FAQ**](resources/faq.md) — Часто задаваемые вопросы
- [**Учебное пособие**](resources/study-guide.md) — Полные цели обучения и практические упражнения

### Внешние ресурсы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Калькулятор цен Azure](https://azure.microsoft.com/pricing/calculator/)
- [Статус Azure](https://status.azure.com/)

## Учебный путь

### Для студентов и начинающих
1. Начните с [Основ AZD](docs/getting-started/azd-basics.md)
2. Следуйте [Руководству по установке](docs/getting-started/installation.md)
3. Завершите [Ваш первый проект](docs/getting-started/first-project.md)
4. Практикуйтесь с [Примером простого веб-приложения](../../examples/simple-web-app)

### Для разработчиков
1. Ознакомьтесь с [Руководством по конфигурации](docs/getting-started/configuration.md)
2. Изучите [Руководство по развертыванию](docs/deployment/deployment-guide.md)
3. Работайте с [Примером приложения с базой данных](../../examples/database-app)
4. Исследуйте [Пример приложения в контейнере](../../examples/container-app)

### Для инженеров DevOps
1. Освойте [Предоставление ресурсов](docs/deployment/provisioning.md)
2. Реализуйте [Проверки перед развертыванием](docs/pre-deployment/preflight-checks.md)
3. Практикуйтесь с [Планированием емкости](docs/pre-deployment/capacity-planning.md)
4. Изучите [Пример микросервисов](../../examples/microservices)

## Участие

Мы приветствуем участие! Пожалуйста, ознакомьтесь с нашим [Руководством по участию](CONTRIBUTING.md) для получения информации о:
- Как отправлять проблемы и запросы на добавление функций
- Руководства по внесению изменений в код
- Улучшение документации
- Стандарты сообщества

## Поддержка

- **Проблемы**: [Сообщите о багах и запросите функции](https://github.com/microsoft/azd-for-beginners/issues)
- **Обсуждения**: [Вопросы и обсуждения в сообществе Microsoft Azure Discord](https://discord.gg/microsoft-azure)
- **Электронная почта**: Для частных запросов
- **Microsoft Learn**: [Официальная документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Лицензия

Этот проект лицензирован на условиях лицензии MIT — подробности смотрите в файле [LICENSE](../../LICENSE).

## 🎒 Другие курсы

Наша команда создает другие курсы! Ознакомьтесь:

- [**НОВЫЙ** Model Context Protocol (MCP) для начинающих](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents для начинающих](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI для начинающих с использованием .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI для начинающих](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI для начинающих с использованием Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML для начинающих](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science для начинающих](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI для начинающих](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Кибербезопасность для начинающих](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Веб-разработка для начинающих](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT для начинающих](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Разработка XR для начинающих](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Освоение GitHub Copilot для парного программирования с ИИ](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Освоение GitHub Copilot для разработчиков C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Выбери свое приключение с Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Навигация**  
- **Следующий урок**: [Основы AZD](docs/getting-started/azd-basics.md)  

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Хотя мы стремимся к точности, пожалуйста, учитывайте, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникающие в результате использования данного перевода.