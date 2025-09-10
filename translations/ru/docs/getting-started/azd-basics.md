<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T12:50:41+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ru"
}
-->
# Основы AZD - Понимание Azure Developer CLI

## Введение

Этот урок познакомит вас с Azure Developer CLI (azd) — мощным инструментом командной строки, который ускоряет переход от локальной разработки к развертыванию в Azure. Вы узнаете основные концепции, ключевые функции и поймете, как azd упрощает развертывание облачных приложений.

## Цели обучения

К концу этого урока вы:
- Поймете, что такое Azure Developer CLI и его основное назначение
- Изучите основные концепции шаблонов, сред и сервисов
- Ознакомитесь с ключевыми функциями, включая разработку на основе шаблонов и инфраструктуру как код
- Разберетесь в структуре проекта azd и рабочем процессе
- Будете готовы установить и настроить azd для своей среды разработки

## Результаты обучения

После завершения урока вы сможете:
- Объяснить роль azd в современных рабочих процессах облачной разработки
- Определить компоненты структуры проекта azd
- Описать, как шаблоны, среды и сервисы взаимодействуют друг с другом
- Понять преимущества использования инфраструктуры как кода с azd
- Распознавать различные команды azd и их назначение

## Что такое Azure Developer CLI (azd)?

Azure Developer CLI (azd) — это инструмент командной строки, разработанный для ускорения перехода от локальной разработки к развертыванию в Azure. Он упрощает процесс создания, развертывания и управления облачными приложениями на платформе Azure.

## Основные концепции

### Шаблоны
Шаблоны — это основа azd. Они включают:
- **Код приложения** — ваш исходный код и зависимости
- **Определения инфраструктуры** — ресурсы Azure, описанные с помощью Bicep или Terraform
- **Файлы конфигурации** — настройки и переменные окружения
- **Скрипты развертывания** — автоматизированные рабочие процессы развертывания

### Среды
Среды представляют собой различные цели развертывания:
- **Разработка** — для тестирования и разработки
- **Промежуточная среда** — предрелизная среда
- **Продакшн** — рабочая среда

Каждая среда имеет свои:
- Группы ресурсов Azure
- Настройки конфигурации
- Состояние развертывания

### Сервисы
Сервисы — это строительные блоки вашего приложения:
- **Фронтенд** — веб-приложения, SPA
- **Бэкенд** — API, микросервисы
- **База данных** — решения для хранения данных
- **Хранилище** — файловое и блоб-хранилище

## Ключевые функции

### 1. Разработка на основе шаблонов
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Инфраструктура как код
- **Bicep** — специализированный язык для Azure
- **Terraform** — инструмент для мультиоблачной инфраструктуры
- **ARM Templates** — шаблоны Azure Resource Manager

### 3. Интегрированные рабочие процессы
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Управление средами
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Структура проекта

Типичная структура проекта azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Файлы конфигурации

### azure.yaml
Основной файл конфигурации проекта:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Конфигурация, специфичная для среды:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Общие рабочие процессы

### Начало нового проекта
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Цикл разработки
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Понимание команды `azd down --force --purge`
Команда `azd down --force --purge` — это мощный способ полностью удалить вашу среду azd и все связанные ресурсы. Вот что делают флаги:
```
--force
```
- Пропускает запросы на подтверждение.
- Полезно для автоматизации или скриптов, где ручной ввод невозможен.
- Обеспечивает завершение процесса удаления без прерываний, даже если CLI обнаруживает несоответствия.

```
--purge
```
Удаляет **всю связанную метаинформацию**, включая:
- Состояние среды
- Локальную папку `.azure`
- Кэшированную информацию о развертывании
- Предотвращает "запоминание" предыдущих развертываний, что может вызывать проблемы, такие как несоответствие групп ресурсов или устаревшие ссылки на реестры.

### Зачем использовать оба флага?
Когда вы сталкиваетесь с проблемами при использовании `azd up` из-за оставшегося состояния или частичных развертываний, эта комбинация обеспечивает **чистый лист**.

Особенно полезно после ручного удаления ресурсов в портале Azure или при смене шаблонов, сред или соглашений об именовании групп ресурсов.

### Управление несколькими средами
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Команды навигации

### Обнаружение
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Управление проектами
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Мониторинг
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Лучшие практики

### 1. Используйте осмысленные имена
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Используйте шаблоны
- Начинайте с существующих шаблонов
- Настраивайте их под свои нужды
- Создавайте повторно используемые шаблоны для своей организации

### 3. Изоляция сред
- Используйте отдельные среды для разработки, промежуточной среды и продакшна
- Никогда не развертывайте напрямую в продакшн с локальной машины
- Используйте CI/CD пайплайны для развертывания в продакшн

### 4. Управление конфигурацией
- Используйте переменные окружения для конфиденциальных данных
- Храните конфигурацию в системе контроля версий
- Документируйте настройки, специфичные для среды

## Прогресс обучения

### Начальный уровень (1-2 недели)
1. Установите azd и выполните аутентификацию
2. Разверните простой шаблон
3. Разберитесь в структуре проекта
4. Изучите базовые команды (up, down, deploy)

### Средний уровень (3-4 недели)
1. Настройте шаблоны
2. Управляйте несколькими средами
3. Поймите инфраструктурный код
4. Настройте CI/CD пайплайны

### Продвинутый уровень (5+ недель)
1. Создавайте собственные шаблоны
2. Освойте сложные инфраструктурные паттерны
3. Развертывания в нескольких регионах
4. Конфигурации корпоративного уровня

## Следующие шаги

- [Установка и настройка](installation.md) — Установите и настройте azd
- [Ваш первый проект](first-project.md) — Практическое руководство
- [Руководство по конфигурации](configuration.md) — Расширенные параметры конфигурации

## Дополнительные ресурсы

- [Обзор Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Галерея шаблонов](https://azure.github.io/awesome-azd/)
- [Примеры от сообщества](https://github.com/Azure-Samples)

---

**Навигация**
- **Предыдущий урок**: [README](../../README.md)
- **Следующий урок**: [Установка и настройка](installation.md)

---

**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.