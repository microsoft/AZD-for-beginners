<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T12:49:49+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ru"
}
-->
# Ваш первый проект - Практическое руководство

## Введение

Добро пожаловать в ваш первый проект с Azure Developer CLI! Это подробное практическое руководство проведет вас через весь процесс создания, развертывания и управления полнофункциональным приложением на Azure с использованием azd. Вы будете работать с реальным приложением для управления задачами, включающим React-фронтенд, Node.js API-бэкенд и базу данных MongoDB.

## Цели обучения

Пройдя это руководство, вы:
- Освоите процесс инициализации проекта azd с использованием шаблонов
- Поймете структуру проекта Azure Developer CLI и конфигурационные файлы
- Научитесь полностью развертывать приложение на Azure с созданием инфраструктуры
- Реализуете стратегии обновления приложения и повторного развертывания
- Сможете управлять несколькими средами для разработки и тестирования
- Примените практики очистки ресурсов и управления затратами

## Результаты обучения

После завершения вы сможете:
- Самостоятельно инициализировать и настраивать проекты azd на основе шаблонов
- Эффективно ориентироваться в структуре проектов azd и вносить изменения
- Развертывать полнофункциональные приложения на Azure с помощью одной команды
- Решать распространенные проблемы с развертыванием и аутентификацией
- Управлять несколькими средами Azure для различных этапов развертывания
- Реализовывать процессы непрерывного развертывания для обновлений приложений

## Начало работы

### Список предварительных требований
- ✅ Установлен Azure Developer CLI ([Руководство по установке](installation.md))
- ✅ Установлен и настроен Azure CLI
- ✅ Установлен Git на вашем компьютере
- ✅ Node.js версии 16+ (для этого руководства)
- ✅ Visual Studio Code (рекомендуется)

### Проверьте вашу настройку
```bash
# Check azd installation
azd version
```
### Проверьте аутентификацию Azure

```bash
az account show
```

### Проверьте версию Node.js
```bash
node --version
```

## Шаг 1: Выберите и инициализируйте шаблон

Начнем с популярного шаблона приложения для управления задачами, включающего React-фронтенд и Node.js API-бэкенд.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Что произошло?
- Шаблонный код был загружен в вашу локальную директорию
- Создан файл `azure.yaml` с определениями сервисов
- Настроен код инфраструктуры в директории `infra/`
- Создана конфигурация среды

## Шаг 2: Изучите структуру проекта

Давайте рассмотрим, что создал для нас azd:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Вы должны увидеть:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Основные файлы для понимания

**azure.yaml** - Основной файл вашего проекта azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Определение инфраструктуры:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Шаг 3: Настройте ваш проект (опционально)

Перед развертыванием вы можете настроить приложение:

### Измените фронтенд
```bash
# Open the React app component
code src/web/src/App.tsx
```

Внесите простое изменение:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Настройте переменные окружения
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Шаг 4: Разверните на Azure

Теперь самое интересное - развернем все на Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Что происходит во время развертывания?

Команда `azd up` выполняет следующие шаги:
1. **Provision** (`azd provision`) - Создает ресурсы Azure
2. **Package** - Собирает код вашего приложения
3. **Deploy** (`azd deploy`) - Разворачивает код на ресурсах Azure

### Ожидаемый результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Шаг 5: Протестируйте ваше приложение

### Доступ к вашему приложению
Перейдите по URL, указанному в выводе развертывания, или получите его в любое время:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирование приложения для задач
1. **Добавьте задачу** - Нажмите "Add Todo" и введите задачу
2. **Отметьте как выполненную** - Отметьте завершенные задачи
3. **Удалите задачи** - Удалите ненужные задачи

### Мониторинг вашего приложения
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Шаг 6: Внесите изменения и повторно разверните

Давайте внесем изменения и посмотрим, как легко обновить приложение:

### Измените API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Добавьте пользовательский заголовок ответа:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разверните только изменения в коде
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Шаг 7: Управляйте несколькими средами

Создайте тестовую среду для проверки изменений перед развертыванием в продакшн:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Сравнение сред
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Шаг 8: Очистите ресурсы

Когда вы закончите эксперименты, очистите ресурсы, чтобы избежать дополнительных затрат:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Чему вы научились

Поздравляем! Вы успешно:
- Инициализировали проект azd из шаблона
- Изучили структуру проекта и ключевые файлы
- Развернули полнофункциональное приложение на Azure
- Внесли изменения в код и повторно развернули приложение
- Управляли несколькими средами
- Очистили ресурсы

## Решение распространенных проблем

### Ошибки аутентификации
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Сбои развертывания
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Конфликты имен ресурсов
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблемы с портами/сетью
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следующие шаги

Теперь, когда вы завершили свой первый проект, изучите эти продвинутые темы:

### 1. Настройка инфраструктуры
- [Инфраструктура как код](../deployment/provisioning.md)
- [Добавление баз данных, хранилищ и других сервисов](../deployment/provisioning.md#adding-services)

### 2. Настройка CI/CD
- [Интеграция с GitHub Actions](../deployment/cicd-integration.md)
- [Конвейеры Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Лучшие практики для продакшн
- [Настройки безопасности](../deployment/best-practices.md#security)
- [Оптимизация производительности](../deployment/best-practices.md#performance)
- [Мониторинг и логирование](../deployment/best-practices.md#monitoring)

### 4. Изучите больше шаблонов
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Дополнительные ресурсы

### Учебные материалы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Сообщество и поддержка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Сообщество разработчиков Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблоны и примеры
- [Официальная галерея шаблонов](https://azure.github.io/awesome-azd/)
- [Шаблоны сообщества](https://github.com/Azure-Samples/azd-templates)
- [Корпоративные шаблоны](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравляем с завершением вашего первого проекта azd!** Теперь вы готовы с уверенностью создавать и развертывать потрясающие приложения на Azure.

---

**Навигация**
- **Предыдущий урок**: [Конфигурация](configuration.md)
- **Следующий урок**: [Руководство по развертыванию](../deployment/deployment-guide.md)

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Хотя мы стремимся к точности, пожалуйста, учитывайте, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.