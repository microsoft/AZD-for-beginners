# Общие проблемы и решения

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Глава 7 - Поиск и устранение неполадок
- **⬅️ Предыдущая глава**: [Глава 6: Предварительные проверки](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Следующая**: [Руководство по отладке](debugging.md)
- **🚀 Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../chapter-08-production/production-ai-practices.md)

## Введение

Это всестороннее руководство по устранению неполадок охватывает наиболее часто встречающиеся проблемы при использовании Azure Developer CLI. Научитесь диагностировать, устранять и решать распространённые проблемы с аутентификацией, развертыванием, созданием инфраструктуры и конфигурацией приложений. Для каждой проблемы приведены подробные симптомы, причины и пошаговые процедуры решения.

## Цели обучения

Пройдя это руководство, вы сможете:
- Освоить методы диагностики проблем Azure Developer CLI
- Понять распространённые проблемы с аутентификацией и правами доступа и способы их решения
- Решать ошибки развертывания, сбои при создании инфраструктуры и проблемы конфигурации
- Реализовывать проактивный мониторинг и стратегии отладки
- Применять систематические методы устранения неполадок для сложных проблем
- Настроить правильное ведение журналов и мониторинг для предотвращения будущих проблем

## Результаты обучения

По завершении курса вы сможете:
- Диагностировать проблемы Azure Developer CLI с помощью встроенных инструментов диагностики
- Самостоятельно решать вопросы, связанные с аутентификацией, подписками и правами доступа
- Эффективно устранять сбои развертывания и ошибки создания инфраструктуры
- Отлаживать проблемы конфигурации приложений и проблемы, специфичные для среды
- Внедрять мониторинг и оповещения для проактивного выявления потенциальных проблем
- Применять лучшие практики ведения журналов, отладки и процессов решения проблем

## Быстрая диагностика

Перед переходом к конкретным проблемам запустите эти команды для сбора диагностической информации:

```bash
# Проверить версию и состояние azd
azd version
azd config show

# Проверить аутентификацию Azure
az account show
az account list

# Проверить текущую среду
azd env list
azd env get-values

# Включить отладочное логирование
export AZD_DEBUG=true
azd <command> --debug
```

## Проблемы с аутентификацией

### Проблема: "Не удалось получить токен доступа"
**Симптомы:**
- `azd up` завершается с ошибками аутентификации
- Команды возвращают "неавторизован" или "доступ запрещён"

**Решения:**
```bash
# 1. Повторная аутентификация с помощью Azure CLI
az login
az account show

# 2. Очистить кэшированные учетные данные
az account clear
az login

# 3. Использовать поток кода устройства (для безголовых систем)
az login --use-device-code

# 4. Установить явную подписку
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Проблема: "Недостаточно прав" при развертывании
**Симптомы:**
- Развертывание заканчивается ошибками прав
- Невозможно создать определённые ресурсы Azure

**Решения:**
```bash
# 1. Проверьте свои назначения ролей Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Убедитесь, что у вас есть необходимые роли
# - Contributor (для создания ресурсов)
# - User Access Administrator (для назначений ролей)

# 3. Свяжитесь с администратором Azure для получения соответствующих разрешений
```

### Проблема: Проблемы с многоарендной аутентификацией
**Решения:**
```bash
# 1. Вход с определённым арендатором
az login --tenant "your-tenant-id"

# 2. Установить арендатора в конфигурации
azd config set auth.tenantId "your-tenant-id"

# 3. Очистить кэш арендатора при переключении арендаторов
az account clear
```

## 🏗️ Ошибки создания инфраструктуры

### Проблема: Конфликты имён ресурсов
**Симптомы:**
- Ошибки "Имя ресурса уже существует"
- Развертывание ломается при создании ресурса

**Решения:**
```bash
# 1. Используйте уникальные имена ресурсов с токенами
# В вашем шаблоне Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Измените имя окружения
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Очистите существующие ресурсы
azd down --force --purge
```

### Проблема: Локация/регион недоступны
**Симптомы:**
- "Локация 'xyz' недоступна для типа ресурса"
- Некоторые SKU отсутствуют в выбранном регионе

**Решения:**
```bash
# 1. Проверьте доступные местоположения для типов ресурсов
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Используйте обычно доступные регионы
azd config set defaults.location eastus2
# или
azd env set AZURE_LOCATION eastus2

# 3. Проверьте доступность сервиса по региону
# Посетите: https://azure.microsoft.com/global-infrastructure/services/
```

### Проблема: Ошибки превышения квоты
**Симптомы:**
- "Превышена квота для типа ресурса"
- "Достигнуто максимальное количество ресурсов"

**Решения:**
```bash
# 1. Проверьте текущее использование квоты
az vm list-usage --location eastus2 -o table

# 2. Запросите увеличение квоты через портал Azure
# Перейдите в: Подписки > Использование + квоты

# 3. Используйте меньшие SKU для разработки
# В main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Очистите неиспользуемые ресурсы
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Проблема: Ошибки шаблона Bicep
**Симптомы:**
- Сбой валидации шаблона
- Синтаксические ошибки в файлах Bicep

**Решения:**
```bash
# 1. Проверить синтаксис Bicep
az bicep build --file infra/main.bicep

# 2. Использовать линтер Bicep
az bicep lint --file infra/main.bicep

# 3. Проверить синтаксис файла параметров
cat infra/main.parameters.json | jq '.'

# 4. Просмотреть изменения развертывания
azd provision --preview
```

## 🚀 Сбои развертывания

### Проблема: Ошибки сборки
**Симптомы:**
- Приложение не удаётся собрать при развертывании
- Ошибки установки пакетов

**Решения:**
```bash
# 1. Проверьте вывод сборки с флагом отладки
azd deploy --service web --debug

# 2. Просмотрите статус развернутой службы
azd show

# 3. Протестируйте сборку локально
cd src/web
npm install
npm run build

# 3. Проверьте совместимость версий Node.js/Python
node --version  # Должно соответствовать настройкам azure.yaml
python --version

# 4. Очистите кэш сборки
rm -rf node_modules package-lock.json
npm install

# 5. Проверьте Dockerfile при использовании контейнеров
docker build -t test-image .
docker run --rm test-image
```

### Проблема: Сбои при развертывании контейнеров
**Симптомы:**
- Контейнерные приложения не запускаются
- Ошибки загрузки образа

**Решения:**
```bash
# 1. Локальное тестирование сборки Docker
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Проверка журналов контейнера с помощью Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Мониторинг приложения через azd
azd monitor --logs

# 3. Проверка доступа к реестру контейнеров
az acr login --name myregistry

# 4. Проверка конфигурации контейнерного приложения
az containerapp show --name my-app --resource-group my-rg
```

### Проблема: Ошибки подключения к базе данных
**Симптомы:**
- Приложение не может подключиться к базе данных
- Ошибки тайм-аута подключения

**Решения:**
```bash
# 1. Проверьте правила брандмауэра базы данных
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Проверьте подключение из приложения
# Временно добавьте в ваше приложение:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Проверьте формат строки подключения
azd env get-values | grep DATABASE

# 4. Проверьте состояние сервера базы данных
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Проблемы конфигурации

### Проблема: Переменные окружения не работают
**Симптомы:**
- Приложение не видит значения конфигурации
- Переменные окружения кажутся пустыми

**Решения:**
```bash
# 1. Убедитесь, что переменные окружения установлены
azd env get-values
azd env get DATABASE_URL

# 2. Проверьте имена переменных в azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Перезапустите приложение
azd deploy --service web

# 4. Проверьте конфигурацию службы приложения
az webapp config appsettings list --name myapp --resource-group myrg
```

### Проблема: Проблемы с SSL/TLS сертификатами
**Симптомы:**
- HTTPS не работает
- Ошибки проверки сертификатов

**Решения:**
```bash
# 1. Проверить статус SSL-сертификата
az webapp config ssl list --resource-group myrg

# 2. Включить только HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Добавить пользовательский домен (если необходимо)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Проблема: Ошибки конфигурации CORS
**Симптомы:**
- Фронтенд не может вызвать API
- Блокировка междоменного запроса

**Решения:**
```bash
# 1. Настроить CORS для App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Обновить API для обработки CORS
# В Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Проверить, запущено ли на корректных URL
azd show
```

## 🌍 Проблемы управления окружением

### Проблема: Сложности с переключением окружений
**Симптомы:**
- Используется неверное окружение
- Конфигурация не переключается правильно

**Решения:**
```bash
# 1. Перечислить все окружения
azd env list

# 2. Явно выбрать окружение
azd env select production

# 3. Проверить текущее окружение
azd env list

# 4. Создать новое окружение, если текущее повреждено
azd env new production-new
azd env select production-new
```

### Проблема: Коррупция окружения
**Симптомы:**
- Окружение в неверном состоянии
- Ресурсы не соответствуют конфигурации

**Решения:**
```bash
# 1. Обновить состояние окружения
azd env refresh

# 2. Сбросить конфигурацию окружения
azd env new production-reset
# Скопировать необходимые переменные окружения
azd env set DATABASE_URL "your-value"

# 3. Импортировать существующие ресурсы (если возможно)
# Вручную обновите .azure/production/config.json с идентификаторами ресурсов
```

## 🔍 Проблемы с производительностью

### Проблема: Медленное время развертывания
**Симптомы:**
- Развертывание занимает слишком много времени
- Тайм-ауты во время развертывания

**Решения:**
```bash
# 1. Развертывайте конкретные сервисы для более быстрой итерации
azd deploy --service web
azd deploy --service api

# 2. Используйте развертывание только кода при неизменной инфраструктуре
azd deploy  # Быстрее, чем azd up

# 3. Оптимизируйте процесс сборки
# В package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Проверьте местоположение ресурсов (используйте один и тот же регион)
azd config set defaults.location eastus2
```

### Проблема: Проблемы с производительностью приложения
**Симптомы:**
- Медленное время отклика
- Высокое использование ресурсов

**Решения:**
```bash
# 1. Масштабировать ресурсы
# Обновите SKU в main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Включить мониторинг Application Insights
azd monitor --overview

# 3. Проверьте логи приложения в Azure
az webapp log tail --name myapp --resource-group myrg
# или для контейнерных приложений:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Реализовать кэширование
# Добавьте кэш Redis в вашу инфраструктуру
```

## 🛠️ Инструменты и команды для устранения неполадок

### Команды отладки
```bash
# Комплексная отладка
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Проверить версию azd
azd version

# Просмотреть текущую конфигурацию
azd config show

# Проверить соединение
curl -v https://myapp.azurewebsites.net/health
```

### Анализ логов
```bash
# Журналы приложений через Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Мониторинг приложения с помощью azd
azd monitor --logs
azd monitor --live

# Журналы ресурсов Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Журналы контейнеров (для Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Исследование ресурсов
```bash
# Список всех ресурсов
az resource list --resource-group myrg -o table

# Проверить состояние ресурса
az webapp show --name myapp --resource-group myrg --query state

# Диагностика сети
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Получение дополнительной помощи

### Когда эскалировать
- Проблемы с аутентификацией сохраняются после всех попыток решения
- Проблемы с инфраструктурой Azure
- Вопросы, связанные с биллингом или подписками
- Вопросы безопасности или инциденты

### Каналы поддержки
```bash
# 1. Проверьте состояние службы Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Создайте заявку в службу поддержки Azure
# Перейдите на: https://portal.azure.com -> Помощь + поддержка

# 3. Ресурсы сообщества
# - Stack Overflow: тег azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Необходимая информация для сбора
Перед обращением в поддержку соберите:
- вывод `azd version`
- вывод `azd config show`
- вывод `azd show` (текущий статус развертывания)
- сообщения об ошибках (полный текст)
- шаги для воспроизведения проблемы
- данные окружения (`azd env get-values`)
- временные рамки возникновения проблемы

### Скрипт сбора логов
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Предотвращение проблем

### Контрольный список перед развертыванием
```bash
# 1. Проверить аутентификацию
az account show

# 2. Проверить квоты и лимиты
az vm list-usage --location eastus2

# 3. Проверить шаблоны
az bicep build --file infra/main.bicep

# 4. Сначала протестировать локально
npm run build
npm run test

# 5. Использовать имитацию развертывания
azd provision --preview
```

### Настройка мониторинга
```bash
# Включить Application Insights
# Добавить в main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Настроить оповещения
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Регулярное обслуживание
```bash
# Еженедельные проверки здоровья
./scripts/health-check.sh

# Ежемесячный обзор расходов
az consumption usage list --billing-period-name 202401

# Ежеквартальный обзор безопасности
az security assessment list --resource-group myrg
```

## Связанные ресурсы

- [Руководство по отладке](debugging.md) - Расширенные методы отладки
- [Создание ресурсов](../chapter-04-infrastructure/provisioning.md) - Устранение проблем с инфраструктурой
- [Планирование мощностей](../chapter-06-pre-deployment/capacity-planning.md) - Руководство по планированию ресурсов
- [Выбор SKU](../chapter-06-pre-deployment/sku-selection.md) - Рекомендации по уровням обслуживания

---

**Совет**: Добавьте это руководство в закладки и обращайтесь к нему при возникновении проблем. Большинство проблем уже встречались и имеют проверенные решения!

---

**Навигация**
- **Предыдущее занятие**: [Создание ресурсов](../chapter-04-infrastructure/provisioning.md)
- **Следующее занятие**: [Руководство по отладке](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, следует учитывать, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на языке оригинала следует считать авторитетным источником. Для получения критически важной информации рекомендуется использовать профессиональный перевод выполненный человеком. Мы не несем ответственности за любые недоразумения или неверные толкования, возникающие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->