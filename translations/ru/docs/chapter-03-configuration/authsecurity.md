# Шаблоны аутентификации и управляемая личность

⏱️ **Оценочное время**: 45-60 минут | 💰 **Влияние на стоимость**: Бесплатно (без дополнительных затрат) | ⭐ **Сложность**: Средний уровень

**📚 Обучающий путь:**
- ← Предыдущий: [Управление конфигурациями](configuration.md) - Управление переменными окружения и секретами
- 🎯 **Вы здесь**: Аутентификация и безопасность (управляемая личность, Key Vault, безопасные шаблоны)
- → Следующий: [Первый проект](first-project.md) - Создание вашего первого приложения AZD
- 🏠 [Главная страница курса](../../README.md)

---

## Чему вы научитесь

Пройдя этот урок, вы:
- Поймете шаблоны аутентификации Azure (ключи, строки подключения, управляемая личность)
- Реализуете **управляемую личность** для аутентификации без паролей
- Защитите секреты с помощью интеграции **Azure Key Vault**
- Настроите **ролевой контроль доступа (RBAC)** для развёртываний AZD
- Примените лучшие практики безопасности в Container Apps и сервисах Azure
- Выполните миграцию с аутентификации на основе ключей к аутентификации на основе идентификации

## Почему управляемая личность важна

### Проблема: традиционная аутентификация

**До управляемой личности:**
```javascript
// ❌ РИСК БЕЗОПАСНОСТИ: Захардкоженные секреты в коде
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Проблемы:**
- 🔴 **Секреты открыты** в коде, файлах конфигурации, переменных окружения
- 🔴 **Обновление учетных данных** требует изменений кода и повторного развертывания
- 🔴 **Кошмар аудита** — кто, что и когда получил доступ?
- 🔴 **Разброс** — секреты разбросаны по множеству систем
- 🔴 **Риски соответствия требованиям** — провал безопасности аудита

### Решение: управляемая личность

**После управляемой личности:**
```javascript
// ✅ БЕЗОПАСНО: Нет секретов в коде
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure автоматически обрабатывает аутентификацию
);
```

**Преимущества:**
- ✅ **Ноль секретов** в коде и конфигурации
- ✅ **Автоматическая ротация** — управляется Azure
- ✅ **Полный аудит** в журналах Microsoft Entra ID
- ✅ **Централизованная безопасность** — управление в портале Azure
- ✅ **Готовность к соответствию требованиям** — соответствует стандартам безопасности

**Аналогия**: Традиционная аутентификация — это как носить несколько разных физических ключей для разных дверей. Управляемая личность — это как иметь бейдж безопасности, который автоматически даёт доступ в зависимости от вашей личности — никаких ключей терять, копировать или менять.

---

## Обзор архитектуры

### Поток аутентификации с управляемой личностью

```mermaid
sequenceDiagram
    participant App as Ваше приложение<br/>(Контейнерное приложение)
    participant MI as Управляемая учетная запись<br/>(Microsoft Entra ID)
    participant KV as Хранилище ключей
    participant Storage as Хранилище Azure
    participant DB as Azure SQL
    
    App->>MI: Запросить токен доступа<br/>(автоматически)
    MI->>MI: Проверить личность<br/>(пароль не требуется)
    MI-->>App: Вернуть токен<br/>(действителен 1 час)
    
    App->>KV: Получить секрет<br/>(с использованием токена)
    KV->>KV: Проверить разрешения RBAC
    KV-->>App: Вернуть значение секрета
    
    App->>Storage: Загрузить блоб<br/>(с использованием токена)
    Storage->>Storage: Проверить разрешения RBAC
    Storage-->>App: Успешно
    
    App->>DB: Выполнить запрос данных<br/>(с использованием токена)
    DB->>DB: Проверить SQL-разрешения
    DB-->>App: Вернуть результаты
    
    Note over App,DB: Вся аутентификация без пароля!
```

### Типы управляемых личностей

```mermaid
graph TB
    MI[Управляемая Идентичность]
    SystemAssigned[Системно назначенная идентичность]
    UserAssigned[Пользовательски назначенная идентичность]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Жизненный цикл связан с ресурсом]
    SystemAssigned --> SA2[Автоматическое создание/удаление]
    SystemAssigned --> SA3[Лучший для одного ресурса]
    
    UserAssigned --> UA1[Независимый жизненный цикл]
    UserAssigned --> UA2[Ручное создание/удаление]
    UserAssigned --> UA3[Общий для нескольких ресурсов]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```

| Характеристика | Система-присвоенная | Пользовательская |
|----------------|---------------------|------------------|
| **Жизненный цикл** | Привязана к ресурсу | Независимая |
| **Создание** | Автоматически с ресурсом | Создание вручную |
| **Удаление** | Удаляется вместе с ресурсом | Сохраняется после удаления ресурса |
| **Использование** | Только для одного ресурса | Для нескольких ресурсов |
| **Сценарий использования** | Простые сценарии | Сложные много-ресурсные сценарии |
| **Рекомендация AZD** | ✅ Рекомендуется | Необязательно |

---

## Требования

### Необходимые инструменты

Вы должны уже иметь их, установленные из предыдущих уроков:

```bash
# Проверить Azure Developer CLI
azd version
# ✅ Ожидается: azd версии 1.0.0 или выше

# Проверить Azure CLI
az --version
# ✅ Ожидается: azure-cli версии 2.50.0 или выше
```

### Требования Azure

- Активная подписка Azure
- Разрешения:
  - Создавать управляемые личности
  - Назначать роли RBAC
  - Создавать ресурсы Key Vault
  - Развёртывать Container Apps

### Предварительные знания

Вы должны были пройти:
- [Руководство по установке](installation.md) - Настройка AZD
- [Основы AZD](azd-basics.md) - Основные концепции
- [Управление конфигурациями](configuration.md) - Переменные окружения

---

## Урок 1: Понимание шаблонов аутентификации

### Шаблон 1: Строки подключения (Устаревший - избегать)

**Как работает:**
```bash
# Строка подключения содержит учетные данные
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Проблемы:**
- ❌ Секреты видны в переменных окружения
- ❌ Логируются в системах развертывания
- ❌ Трудно обновлять
- ❌ Нет аудиторской трассировки доступа

**Когда использовать:** Только для локальной разработки, никогда в продакшене.

---

### Шаблон 2: Ссылки на Key Vault (Лучше)

**Как работает:**
```bicep
// Store secret in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'mykv'
  properties: {
    enableRbacAuthorization: true
  }
}

// Reference in Container App
env: [
  {
    name: 'STORAGE_KEY'
    secretRef: 'storage-key'  // References Key Vault
  }
]
```

**Преимущества:**
- ✅ Секреты безопасно хранятся в Key Vault
- ✅ Централизованное управление секретами
- ✅ Ротация без изменений в коде

**Ограничения:**
- ⚠️ Всё ещё используются ключи/пароли
- ⚠️ Нужно управлять доступом к Key Vault

**Когда использовать:** Переходный этап от строк подключения к управляемой личности.

---

### Шаблон 3: Управляемая личность (Лучший подход)

**Как работает:**
```bicep
// Enable managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Automatically creates identity
  }
}

// Grant permissions
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: storageAccount
  properties: {
    roleDefinitionId: storageBlobDataContributorRole
    principalId: containerApp.identity.principalId
  }
}
```

**Код приложения:**
```javascript
// Секреты не нужны!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Преимущества:**
- ✅ Нет секретов в коде/конфигурации
- ✅ Автоматическая ротация учетных данных
- ✅ Полный аудит
- ✅ Разрешения на основе RBAC
- ✅ Готовность к соответствию требованиям

**Когда использовать:** Всегда, для продакшен-приложений.

---

### Шаблон 4: Сервисные учётные записи (CI/CD и автоматизация)

Управляемая личность — это золотой стандарт *для ресурсов, работающих внутри Azure*. Но что если что-то работает **вне** Azure — например, CI/CD pipeline на агенте сборки или скрипт на вашем ноутбуке, не использующий интерактивный вход? Здесь используется **сервисный принципал**: не-человеческая учётная запись с собственными учетными данными, с помощью которых автоматизированный процесс может войти в систему.

**Как работает:**

Создайте сервисный принципал с областью действия в группе ресурсов (минимально необходимые права):

```bash
az ad sp create-for-rbac \
  --name "myapp-cicd" \
  --role contributor \
  --scopes /subscriptions/<sub-id>/resourceGroups/<rg-name>
```

Это выведет client ID, client secret и tenant ID. azd может использовать их для неинтерактивного входа:

```bash
azd auth login \
  --client-id "<appId>" \
  --client-secret "<password>" \
  --tenant-id "<tenant>"
```

**Предпочитайте федеративные учетные данные (OIDC) вместо секретов.** Вместо долгоживущего client secret настройте федеративный сертификат, чтобы pipeline обменивал короткоживущий токен — секрет не хранится и не нужно его обновлять:

```bash
azd auth login \
  --client-id "<appId>" \
  --federated-credential-provider "github" \
  --tenant-id "<tenant>"
```

> Команда `azd pipeline config` автоматически это настроит. Смотрите инструкции по CI/CD в [Глава 8](../chapter-08-production/production-ai-practices.md).

**Преимущества:**
- ✅ Работает вне Azure (агенты сборки, локально, другие облака)
- ✅ Можно ограничить одной группой ресурсов с одной ролью
- ✅ Федеративный (OIDC) вариант не использует хранимых секретов

**Недостатки:**
- ⚠️ Вариант с секретом требует аккуратного хранения и ротации
- ⚠️ Если секрет скомпрометирован — злоумышленник получает все права сервисного принципала, поэтому сузьте доступ

**Когда использовать:** Для CI/CD пайплайнов и автоматизации, не использующих управляемую личность. Всегда предпочитайте **федеративный/OIDC** вариант вместо client secret и отдавайте предпочтение управляемой личности, когда нагрузка работает внутри Azure.

**Безопасное хранение данных для входа:**
- Никогда не коммитьте секреты — используйте секретные хранилища pipeline (секреты GitHub Actions, группы переменных Azure DevOps, Key Vault).
- Ограничьте область действия сервисного принципала минимально необходимой ролью и группой ресурсов.
- Установите срок действия и ротуйте секреты, либо полностью исключите секреты, используя OIDC.

---

## Урок 2: Реализация управляемой личности с AZD

### Пошаговая реализация

Создадим защищённое Container App, использующее управляемую личность для доступа к Azure Storage и Key Vault.

### Структура проекта

```
secure-app/
├── azure.yaml                 # AZD configuration
├── infra/
│   ├── main.bicep            # Main infrastructure
│   ├── core/
│   │   ├── identity.bicep    # Managed identity setup
│   │   ├── keyvault.bicep    # Key Vault configuration
│   │   └── storage.bicep     # Storage with RBAC
│   └── app/
│       └── container-app.bicep
└── src/
    ├── app.js                # Application code
    ├── package.json
    └── Dockerfile
```

### 1. Настройка AZD (azure.yaml)

```yaml
name: secure-app
metadata:
  template: secure-app@1.0.0

services:
  api:
    project: ./src
    language: js
    host: containerapp

# Enable managed identity (AZD handles this automatically)
```

### 2. Инфраструктура: включение управляемой личности

**Файл: `infra/main.bicep`**

```bicep
targetScope = 'subscription'

param environmentName string
param location string = 'eastus'

var tags = { 'azd-env-name': environmentName }

// Resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

// Storage Account
module storage './core/storage.bicep' = {
  name: 'storage'
  scope: rg
  params: {
    name: 'st${uniqueString(rg.id)}'
    location: location
    tags: tags
  }
}

// Key Vault
module keyVault './core/keyvault.bicep' = {
  name: 'keyvault'
  scope: rg
  params: {
    name: 'kv-${uniqueString(rg.id)}'
    location: location
    tags: tags
  }
}

// Container App with Managed Identity
module containerApp './app/container-app.bicep' = {
  name: 'container-app'
  scope: rg
  params: {
    name: 'ca-${environmentName}'
    location: location
    tags: tags
    storageAccountName: storage.outputs.name
    keyVaultName: keyVault.outputs.name
  }
}

// Grant Container App access to Storage
module storageRoleAssignment './core/role-assignment.bicep' = {
  name: 'storage-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'  // Storage Blob Data Contributor
    targetResourceId: storage.outputs.id
  }
}

// Grant Container App access to Key Vault
module kvRoleAssignment './core/role-assignment.bicep' = {
  name: 'kv-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: '4633458b-17de-408a-b874-0445c86b69e6'  // Key Vault Secrets User
    targetResourceId: keyVault.outputs.id
  }
}

// Outputs
output AZURE_STORAGE_ACCOUNT_NAME string = storage.outputs.name
output AZURE_KEY_VAULT_NAME string = keyVault.outputs.name
output APP_URL string = containerApp.outputs.url
```

### 3. Container App с системой-присвоенной личностью

**Файл: `infra/app/container-app.bicep`**

```bicep
param name string
param location string
param tags object = {}
param storageAccountName string
param keyVaultName string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'  // 🔑 Enable managed identity
  }
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [
        {
          name: 'api'
          image: 'myregistry.azurecr.io/api:latest'
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          env: [
            {
              name: 'AZURE_STORAGE_ACCOUNT_NAME'
              value: storageAccountName
            }
            {
              name: 'AZURE_KEY_VAULT_NAME'
              value: keyVaultName
            }
            // 🔑 No secrets - managed identity handles authentication!
          ]
        }
      ]
    }
  }
}

// Output the identity for RBAC assignments
output identityPrincipalId string = containerApp.identity.principalId
output id string = containerApp.id
output url string = 'https://${containerApp.properties.configuration.ingress.fqdn}'
```

### 4. Модуль назначения ролей RBAC

**Файл: `infra/core/role-assignment.bicep`**

```bicep
param principalId string
param roleDefinitionId string  // Azure built-in role ID
param targetResourceId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(principalId, roleDefinitionId, targetResourceId)
  scope: resourceId('Microsoft.Resources/resourceGroups', resourceGroup().name)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
    principalType: 'ServicePrincipal'
  }
}

output id string = roleAssignment.id
```

### 5. Код приложения с управляемой личностью

**Файл: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Инициализация учетных данных (работает автоматически с управляемой идентичностью)
const credential = new DefaultAzureCredential();

// Настройка Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Ключи не требуются!
);

// Настройка Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Ключи не требуются!
);

// Проверка состояния
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Загрузка файла в Blob Storage
app.post('/upload', async (req, res) => {
  try {
    const containerClient = blobServiceClient.getContainerClient('uploads');
    await containerClient.createIfNotExists();
    
    const blobName = `file-${Date.now()}.txt`;
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);
    
    await blockBlobClient.upload('Hello from managed identity!', 30);
    
    res.json({
      success: true,
      blobName: blobName,
      message: 'File uploaded using managed identity!'
    });
  } catch (error) {
    console.error('Upload error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Получить секрет из Key Vault
app.get('/secret/:name', async (req, res) => {
  try {
    const secretName = req.params.name;
    const secret = await secretClient.getSecret(secretName);
    
    res.json({
      name: secretName,
      value: secret.value,
      message: 'Secret retrieved using managed identity!'
    });
  } catch (error) {
    console.error('Secret error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Список контейнеров Blob (демонстрирует доступ на чтение)
app.get('/containers', async (req, res) => {
  try {
    const containers = [];
    for await (const container of blobServiceClient.listContainers()) {
      containers.push(container.name);
    }
    
    res.json({
      containers: containers,
      count: containers.length,
      message: 'Containers listed using managed identity!'
    });
  } catch (error) {
    console.error('List error:', error);
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Secure API listening on port ${PORT}`);
  console.log('Authentication: Managed Identity (passwordless)');
});
```

**Файл: `src/package.json`**

```json
{
  "name": "secure-app",
  "version": "1.0.0",
  "dependencies": {
    "express": "^4.18.2",
    "@azure/identity": "^4.0.0",
    "@azure/storage-blob": "^12.17.0",
    "@azure/keyvault-secrets": "^4.7.0"
  },
  "scripts": {
    "start": "node app.js"
  }
}
```

### 6. Развёртывание и тестирование

```bash
# Инициализировать окружение AZD
azd init

# Развернуть инфраструктуру и приложение
azd up

# Получить URL приложения
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Протестировать проверку состояния
curl $APP_URL/health
```

**✅ Ожидаемый вывод:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Тест загрузки blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Ожидаемый вывод:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Тест списка контейнеров:**
```bash
curl $APP_URL/containers
```

**✅ Ожидаемый вывод:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Распространённые роли Azure RBAC

### Встроенные идентификаторы ролей для управляемой личности

| Сервис | Название роли | Идентификатор роли | Права доступа |
|--------|---------------|--------------------|--------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Чтение блобов и контейнеров |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Чтение, запись, удаление блобов |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Чтение, запись, удаление сообщений очереди |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Чтение секретов |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Чтение, запись, удаление секретов |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Чтение данных Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Чтение и запись данных Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Управление базами данных SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Отправка, получение и управление сообщениями |

### Как найти идентификаторы ролей

```bash
# Список всех встроенных ролей
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Поиск конкретной роли
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Получить детали роли
az role definition list --name "Storage Blob Data Contributor"
```

---

## Практические задания

### Задание 1: Включение управляемой личности для существующего приложения ⭐⭐ (Средний уровень)

**Цель**: Добавить управляемую личность к существующему развертыванию Container App

**Сценарий**: У вас Container App, использующее строки подключения. Преобразуйте его к управляемой личности.

**Исходные данные**: Container App с такой конфигурацией:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Шаги**:

1. **Включить управляемую личность в Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Предоставить доступ к Storage:**

```bicep
// Get storage account reference
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

// Assign role
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(containerApp.id, 'ba92f5b4-2d11-453d-a403-e96b0029c9fe', storageAccount.id)
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: containerApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **Обновить код приложения:**

**До (строка подключения):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**После (управляемая личность):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Обновить переменные окружения:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Развернуть и протестировать:**

```bash
# Переустановить
azd up

# Проверить, что всё ещё работает
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Критерии успеха:**
- ✅ Приложение развертывается без ошибок
- ✅ Операции со Storage работают (загрузка, список, скачивание)
- ✅ В переменных окружения нет строк подключения
- ✅ Личность видна в портале Azure в разделе "Identity"

**Проверка:**

```bash
# Проверьте, включена ли управляемая идентичность
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Ожидается: "SystemAssigned"

# Проверьте назначение роли
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Ожидается: отображается роль "Storage Blob Data Contributor"
```

**Время:** 20-30 минут

---

### Задание 2: Много-сервисный доступ с пользовательской личностью ⭐⭐⭐ (Продвинутый)

**Цель**: Создать пользовательскую идентичность, используемую несколькими Container Apps

**Сценарий**: У вас 3 микросервиса, которым нужен доступ к одному аккаунту Storage и Key Vault.

**Шаги**:

1. **Создать пользовательскую личность:**

**Файл: `infra/core/identity.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource userAssignedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: name
  location: location
  tags: tags
}

output id string = userAssignedIdentity.id
output principalId string = userAssignedIdentity.properties.principalId
output clientId string = userAssignedIdentity.properties.clientId
```

2. **Назначить роли пользовательской личности:**

```bicep
// In main.bicep
module userIdentity './core/identity.bicep' = {
  name: 'user-identity'
  scope: rg
  params: {
    name: 'id-${environmentName}'
    location: location
    tags: tags
  }
}

// Grant Storage access
resource storageRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(userIdentity.outputs.principalId, 'storage-contributor')
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}

// Grant Key Vault access
resource kvRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(userIdentity.outputs.principalId, 'kv-secrets-user')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **Назначить личность нескольким Container Apps:**

```bicep
resource apiGateway 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-gateway'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}

resource productService 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'product-service'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}

resource orderService 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'order-service'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}
```

4. **Код приложения (во всех сервисах применяется одинаковый подход):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Для идентификатора, назначенного пользователем, укажите идентификатор клиента
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // Идентификатор клиента для идентификатора, назначенного пользователем
);

// Или используйте DefaultAzureCredential (автоматическое обнаружение)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Развернуть и проверить:**

```bash
azd up

# Проверьте, что все службы имеют доступ к хранилищу
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Критерии успеха:**
- ✅ Одна личность используется всеми 3 сервисами
- ✅ Все сервисы имеют доступ к Storage и Key Vault
- ✅ Личность сохраняется при удалении одного сервиса
- ✅ Централизованное управление разрешениями

**Преимущества пользовательской личности:**
- Одна личность для управления
- Единые разрешения для всех сервисов
- Сохраняется при удалении сервисов
- Лучше подходит для сложной архитектуры

**Время:** 30-40 минут

---

### Задание 3: Реализация ротации секретов Key Vault ⭐⭐⭐ (Продвинутый)

**Цель**: Хранить ключи API сторонних сервисов в Key Vault и получать их с помощью управляемой личности

**Сценарий**: Ваше приложение должно вызывать внешний API (OpenAI, Stripe, SendGrid), который требует ключи API.

**Шаги**:

1. **Создать Key Vault с RBAC:**

**Файл: `infra/core/keyvault.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Allow Container App to read secrets
output id string = keyVault.id
output name string = keyVault.name
output uri string = keyVault.properties.vaultUri
```

2. **Сохранить секреты в Key Vault:**

```bash
# Получить имя хранилища ключей
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Сохранить ключи стороннего API
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-xxxxxxxxxxxxx"

az keyvault secret set \
  --vault-name $KV_NAME \
  --name "Stripe-ApiKey" \
  --value "sk_live_xxxxxxxxxxxxx"

az keyvault secret set \
  --vault-name $KV_NAME \
  --name "SendGrid-ApiKey" \
  --value "SG.xxxxxxxxxxxxx"
```

3. **Код приложения для получения секретов:**

**Файл: `src/config.js`**

```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { SecretClient } = require('@azure/keyvault-secrets');

class Config {
  constructor() {
    this.credential = new DefaultAzureCredential();
    this.secretClient = new SecretClient(
      `https://${process.env.AZURE_KEY_VAULT_NAME}.vault.azure.net`,
      this.credential
    );
    this.cache = {};
  }

  async getSecret(secretName) {
    // Сначала проверьте кэш
    if (this.cache[secretName]) {
      return this.cache[secretName];
    }

    try {
      const secret = await this.secretClient.getSecret(secretName);
      this.cache[secretName] = secret.value;
      console.log(`✅ Retrieved secret: ${secretName}`);
      return secret.value;
    } catch (error) {
      console.error(`❌ Failed to get secret ${secretName}:`, error.message);
      throw error;
    }
  }

  async getOpenAIKey() {
    return this.getSecret('OpenAI-ApiKey');
  }

  async getStripeKey() {
    return this.getSecret('Stripe-ApiKey');
  }

  async getSendGridKey() {
    return this.getSecret('SendGrid-ApiKey');
  }
}

module.exports = new Config();
```

4. **Использовать секреты в приложении:**

**Файл: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Инициализировать OpenAI с ключом из Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Вызвать при запуске
initializeServices().catch(console.error);

app.post('/chat', async (req, res) => {
  try {
    const completion = await openaiClient.chat.completions.create({
      model: 'gpt-4.1',
      messages: [{ role: 'user', content: 'Hello!' }]
    });
    
    res.json({
      response: completion.choices[0].message.content,
      authentication: 'Key from Key Vault via Managed Identity'
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(3000, () => {
  console.log('Secure API with Key Vault integration running');
});
```

5. **Развернуть и протестировать:**

```bash
azd up

# Проверьте, что API ключи работают
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Критерии успеха:**
- ✅ Нет API ключей в коде или переменных окружения
- ✅ Приложение получает ключи из Key Vault
- ✅ Сторонние API работают корректно
- ✅ Можно менять ключи без изменений в коде

**Поменять секрет:**

```bash
# Обновить секрет в Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Перезапустить приложение, чтобы применить новый ключ
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Время**: 25-35 минут

---

## Контроль знаний

### 1. Шаблоны аутентификации ✓

Проверьте свои знания:

- [ ] **В1**: Какие три основных шаблона аутентификации?  
  - **О**: Строки подключения (устаревшие), ссылки на Key Vault (переход), Управляемая идентичность (лучший вариант)

- [ ] **В2**: Почему управляемая идентичность лучше строк подключения?  
  - **О**: Нет секретов в коде, автоматическая ротация, полный аудит, права RBAC

- [ ] **В3**: Когда следует использовать назначенную пользователем идентичность вместо системной?  
  - **О**: При совместном использовании идентичности на нескольких ресурсах или когда жизненный цикл идентичности независим от жизненного цикла ресурса

**Практическая проверка:**  
```bash
# Проверьте, какой тип идентификации использует ваше приложение
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Перечислите все назначения ролей для этой идентичности
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC и разрешения ✓

Проверьте свои знания:

- [ ] **В1**: Какой идентификатор роли для "Storage Blob Data Contributor"?  
  - **О**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **В2**: Какие разрешения предоставляет роль "Key Vault Secrets User"?  
  - **О**: Только чтение секретов (нельзя создавать, обновлять или удалять)

- [ ] **В3**: Как предоставить приложению Container App доступ к Azure SQL?  
  - **О**: Назначить роль "SQL DB Contributor" или настроить аутентификацию Microsoft Entra ID для SQL

**Практическая проверка:**  
```bash
# Найти конкретную роль
az role definition list --name "Storage Blob Data Contributor"

# Проверить, какие роли назначены вашему идентификатору
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Интеграция с Key Vault ✓

Проверьте свои знания:

- [ ] **В1**: Как включить RBAC для Key Vault вместо политик доступа?  
  - **О**: Установить `enableRbacAuthorization: true` в Bicep

- [ ] **В2**: Какая библиотека Azure SDK обрабатывает аутентификацию через управляемую идентичность?  
  - **О**: `@azure/identity` с классом `DefaultAzureCredential`

- [ ] **В3**: Как долго секреты Key Vault хранятся в кеше?  
  - **О**: Зависит от приложения; реализуйте собственную стратегию кэширования

**Практическая проверка:**  
```bash
# Тест доступа к Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Проверьте, что RBAC включен
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Ожидается: true
```

---

## Лучшие практики безопасности

### ✅ ДЕЛАТЬ:

1. **Всегда использовать управляемую идентичность в продакшене**  
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Использовать роли RBAC с наименьшими правами**  
   - При возможности использовать роли "Reader"  
   - Избегать ролей "Owner" или "Contributor", если не требуется

3. **Хранить ключи сторонних сервисов в Key Vault**  
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Включить аудит логирования**  
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Использовать разные идентичности для dev/staging/prod**  
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Периодически менять секреты**  
   - Устанавливать сроки истечения у секретов Key Vault  
   - Автоматизировать ротацию через Azure Functions

### ❌ НЕ ДЕЛАТЬ:

1. **Никогда не хардкодить секреты**  
   ```javascript
   // ❌ ПЛОХО
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Не использовать строки подключения в продакшене**  
   ```javascript
   // ❌ ПЛОХО
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Не выдавать избыточные полномочия**  
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Не логировать секреты**  
   ```javascript
   // ❌ ПЛОХО
   console.log('API Key:', apiKey);
   
   // ✅ ХОРОШО
   console.log('API Key retrieved successfully');
   ```

5. **Не использовать идентичности продакшена в разных средах**  
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Руководство по устранению неполадок

### Проблема: "Unauthorized" при доступе к Azure Storage

**Симптомы:**  
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Диагностика:**

```bash
# Проверить, включена ли управляемая идентификация
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Ожидается: "SystemAssigned" или "UserAssigned"

# Проверить назначения ролей
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Ожидается: должно быть видно роль "Storage Blob Data Contributor" или аналогичную роль
```

**Решения:**

1. **Назначить правильную роль RBAC:**  
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Подождать распространения изменений (5-10 минут):**  
```bash
# Проверить статус назначения роли
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Проверить, что приложение использует правильные учетные данные:**  
```javascript
// Убедитесь, что вы используете DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Проблема: Доступ к Key Vault запрещён

**Симптомы:**  
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Диагностика:**

```bash
# Проверьте, что RBAC для Key Vault включён
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Ожидается: true

# Проверьте назначения ролей
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Решения:**

1. **Включить RBAC на Key Vault:**  
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Выдать роль Key Vault Secrets User:**  
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Проблема: DefaultAzureCredential не работает локально

**Симптомы:**  
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Диагностика:**

```bash
# Проверьте, вошли ли вы в систему
az account show

# Проверьте аутентификацию Azure CLI
az ad signed-in-user show
```

**Решения:**

1. **Войти в Azure CLI:**  
```bash
az login
```

2. **Выбрать подписку Azure:**  
```bash
az account set --subscription "Your Subscription Name"
```

3. **Для локальной разработки использовать переменные окружения:**  
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Или использовать другой способ авторизации локально:**  
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Используйте AzureCliCredential для локальной разработки
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Проблема: Назначение роли слишком долго распространяется

**Симптомы:**  
- Роль назначена успешно  
- Всё ещё получаете ошибки 403  
- Неустойчивый доступ (иногда работает, иногда нет)

**Объяснение:**  
Изменения RBAC Azure могут распространяться глобально 5-10 минут.

**Решение:**

```bash
# Подождите и попробуйте снова
echo "Waiting for RBAC propagation..."
sleep 300  # Подождите 5 минут

# Проверьте доступ
curl https://myapp.azurecontainerapps.io/upload

# Если ошибка сохраняется, перезапустите приложение
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Учёт затрат

### Стоимость управляемой идентичности

| Ресурс | Стоимость |
|--------|-----------|
| **Управляемая идентичность** | 🆓 **БЕСПЛАТНО** - Без оплаты |
| **Назначения ролей RBAC** | 🆓 **БЕСПЛАТНО** - Без оплаты |
| **Запросы токенов Microsoft Entra ID** | 🆓 **БЕСПЛАТНО** - Включены |
| **Операции Key Vault** | $0.03 за 10,000 операций |
| **Хранение секретов в Key Vault** | $0.024 за секрет в месяц |

**Управляемая идентичность экономит средства за счёт:**  
- ✅ Исключения операций Key Vault для аутентификации сервисов  
- ✅ Снижения инцидентов безопасности (нет утечек учетных данных)  
- ✅ Уменьшения операционных затрат (нет ручной ротации)

**Пример сравнения затрат (в месяц):**

| Сценарий | Строки подключения | Управляемая идентичность | Экономия |
|----------|--------------------|-------------------------|----------|
| Небольшое приложение (1М запросов) | ~$50 (Key Vault + операции) | ~$0 | $50/месяц |
| Среднее приложение (10М запросов) | ~$200 | ~$0 | $200/месяц |
| Крупное приложение (100М запросов) | ~$1,500 | ~$0 | $1,500/месяц |

---

## Подробнее

### Официальная документация
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Документация SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Следующие шаги в этом курсе
- ← Предыдущий: [Управление конфигурацией](configuration.md)
- → Следующий: [Первый проект](first-project.md)
- 🏠 [Домашняя страница курса](../../README.md)

### Связанные примеры
- [Пример чата Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Использует управляемую идентичность для Microsoft Foundry Models
- [Пример микросервисов](../../../../examples/microservices) - Шаблоны аутентификации для мультисервисов

---

## Итоги

**Вы изучили:**  
- ✅ Три шаблона аутентификации (строки подключения, Key Vault, управляемая идентичность)  
- ✅ Как включить и настроить управляемую идентичность в AZD  
- ✅ Назначение ролей RBAC для сервисов Azure  
- ✅ Интеграцию Key Vault для сторонних секретов  
- ✅ Различия между назначенной пользователем и системной идентичностю  
- ✅ Лучшие практики безопасности и устранение неполадок

**Ключевые выводы:**  
1. **Всегда использовать управляемую идентичность в продакшене** – никаких секретов, автоматическая ротация  
2. **Использовать роли RBAC с минимально необходимыми правами**  
3. **Хранить ключи сторонних сервисов в Key Vault** – централизованное управление секретами  
4. **Разделять идентичности по средам** – dev, staging, prod изоляция  
5. **Включить аудит логирования** – отслеживание доступа

**Следующие шаги:**  
1. Выполнить указанные практические задания  
2. Перенести существующее приложение с строк подключения на управляемую идентичность  
3. Создать первый проект AZD с обеспечением безопасности с первого дня: [Первый проект](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->