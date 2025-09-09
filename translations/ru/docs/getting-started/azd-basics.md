<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T19:14:20+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ru"
}
-->
# Основы AZD - Понимание Azure Developer CLI

## Введение

Этот урок знакомит вас с Azure Developer CLI (azd) — мощным инструментом командной строки, который ускоряет переход от локальной разработки к развертыванию в Azure. Вы узнаете основные концепции, ключевые функции и поймете, как azd упрощает развертывание облачных приложений.

## Цели обучения

К концу этого урока вы:
- Поймете, что такое Azure Developer CLI и его основное назначение
- Изучите основные концепции, такие как шаблоны, окружения и сервисы
- Ознакомитесь с ключевыми функциями, включая разработку на основе шаблонов и инфраструктуру как код
- Разберетесь в структуре проекта azd и рабочем процессе
- Будете готовы установить и настроить azd для своей среды разработки

## Результаты обучения

После завершения урока вы сможете:
- Объяснить роль azd в современных рабочих процессах облачной разработки
- Определить компоненты структуры проекта azd
- Описать, как шаблоны, окружения и сервисы взаимодействуют друг с другом
- Понять преимущества использования инфраструктуры как кода с azd
- Распознавать различные команды azd и их назначение

## Что такое Azure Developer CLI (azd)?

Azure Developer CLI (azd) — это инструмент командной строки, разработанный для ускорения перехода от локальной разработки к развертыванию в Azure. Он упрощает процесс создания, развертывания и управления облачными приложениями на платформе Azure.

## Основные концепции

### Шаблоны
Шаблоны — это основа azd. Они включают:
- **Код приложения** — исходный код и зависимости
- **Определения инфраструктуры** — ресурсы Azure, описанные с помощью Bicep или Terraform
- **Файлы конфигурации** — настройки и переменные окружения
- **Скрипты развертывания** — автоматизированные рабочие процессы развертывания

### Окружения
Окружения представляют собой различные цели развертывания:
- **Разработка** — для тестирования и разработки
- **Стадия** — промежуточное окружение перед производственным
- **Производство** — рабочее окружение

Каждое окружение имеет свои:
- Группы ресурсов Azure
- Настройки конфигурации
- Состояние развертывания

### Сервисы
Сервисы — это строительные блоки вашего приложения:
- **Frontend** — веб-приложения, SPA
- **Backend** — API, микросервисы
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
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Управление окружениями
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
Конфигурация, специфичная для окружения:
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
azd down --force --purge
```

### Управление несколькими окружениями
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

### Управление проектом
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

### 3. Изоляция окружений
- Используйте отдельные окружения для разработки, стадии и производства
- Никогда не развертывайте напрямую в производство с локальной машины
- Используйте CI/CD пайплайны для развертывания в производственной среде

### 4. Управление конфигурацией
- Используйте переменные окружения для конфиденциальных данных
- Храните конфигурацию в системе контроля версий
- Документируйте настройки, специфичные для окружений

## Прогресс обучения

### Начальный уровень (1-2 недели)
1. Установите azd и выполните аутентификацию
2. Разверните простой шаблон
3. Разберитесь в структуре проекта
4. Изучите основные команды (up, down, deploy)

### Средний уровень (3-4 недели)
1. Настройте шаблоны
2. Управляйте несколькими окружениями
3. Поймите инфраструктуру как код
4. Настройте CI/CD пайплайны

### Продвинутый уровень (5+ недель)
1. Создавайте собственные шаблоны
2. Изучите сложные инфраструктурные паттерны
3. Развертывание в нескольких регионах
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
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.