# Authentication Patterns and Managed Identity

⏱️ **Szacowany czas**: 45–60 minut | 💰 **Wpływ na koszty**: Darmowe (brak dodatkowych opłat) | ⭐ **Złożoność**: Średniozaawansowany

**📚 Ścieżka nauki:**
- ← Poprzednia: [Zarządzanie konfiguracją](configuration.md) - Zarządzanie zmiennymi środowiskowymi i sekretami
- 🎯 **Jesteś tutaj**: Uwierzytelnianie i bezpieczeństwo (Managed Identity, Key Vault, bezpieczne wzorce)
- → Następna: [Pierwszy projekt](first-project.md) - Zbuduj swoją pierwszą aplikację AZD
- 🏠 [Strona kursu](../../README.md)

---

## Czego się nauczysz

Po ukończeniu tej lekcji będziesz:
- Rozumieć wzorce uwierzytelniania w Azure (klucze, connection stringi, managed identity)
- Implementować **Managed Identity** dla uwierzytelniania bez haseł
- Chronić sekrety dzięki integracji z **Azure Key Vault**
- Konfigurować **kontrolę dostępu opartą na rolach (RBAC)** dla wdrożeń AZD
- Stosować najlepsze praktyki bezpieczeństwa w Container Apps i usługach Azure
- Migrować z uwierzytelniania opartego na kluczach do uwierzytelniania opartego na tożsamości

## Dlaczego Managed Identity ma znaczenie

### Problem: Tradycyjne uwierzytelnianie

**Przed Managed Identity:**
```javascript
// ❌ RYZYKO BEZPIECZEŃSTWA: Sekrety zakodowane na stałe w kodzie
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Problemy:**
- 🔴 **Wyeksponowane sekrety** w kodzie, plikach konfiguracyjnych, zmiennych środowiskowych
- 🔴 **Rotacja poświadczeń** wymaga zmian w kodzie i ponownego wdrożenia
- 🔴 **Koszmar audytowy** - kto uzyskał dostęp do czego i kiedy?
- 🔴 **Rozsypywanie** - sekrety rozproszone w wielu systemach
- 🔴 **Ryzyka zgodności** - nieprzejście audytów bezpieczeństwa

### Rozwiązanie: Managed Identity

**Po wprowadzeniu Managed Identity:**
```javascript
// ✅ BEZPIECZNE: Brak sekretów w kodzie
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure automatycznie obsługuje uwierzytelnianie
);
```

**Korzyści:**
- ✅ **Brak sekretów** w kodzie lub konfiguracji
- ✅ **Automatyczna rotacja** - Azure się tym zajmuje
- ✅ **Pełny rejestr audytu** w logach Azure AD
- ✅ **Centralne zarządzanie bezpieczeństwem** - zarządzaj w Azure Portal
- ✅ **Gotowe do zgodności** - spełnia standardy bezpieczeństwa

**Analogia**: Tradycyjne uwierzytelnianie jest jak noszenie wielu fizycznych kluczy do różnych drzwi. Managed Identity to jak identyfikator bezpieczeństwa, który automatycznie przyznaje dostęp na podstawie tego, kim jesteś — bez kluczy do zgubienia, skopiowania czy rotacji.

---

## Przegląd architektury

### Przepływ uwierzytelniania z Managed Identity

```mermaid
sequenceDiagram
    participant App as Twoja aplikacja<br/>(Aplikacja kontenerowa)
    participant MI as Zarządzana tożsamość<br/>(Azure AD)
    participant KV as Magazyn kluczy
    participant Storage as Usługa Azure Storage
    participant DB as Usługa Azure SQL
    
    App->>MI: Żądaj tokenu dostępu<br/>(automatycznie)
    MI->>MI: Weryfikuj tożsamość<br/>(nie jest wymagane hasło)
    MI-->>App: Zwróć token<br/>(ważny 1 godzinę)
    
    App->>KV: Pobierz sekret<br/>(używając tokenu)
    KV->>KV: Sprawdź uprawnienia RBAC
    KV-->>App: Zwróć wartość sekretu
    
    App->>Storage: Prześlij blob<br/>(używając tokenu)
    Storage->>Storage: Sprawdź uprawnienia RBAC
    Storage-->>App: Sukces
    
    App->>DB: Zapytaj o dane<br/>(używając tokenu)
    DB->>DB: Sprawdź uprawnienia SQL
    DB-->>App: Zwróć wyniki
    
    Note over App,DB: Wszystkie uwierzytelnienia są bez użycia haseł!
```
### Typy Managed Identities

```mermaid
graph TB
    MI[Zarządzana tożsamość]
    SystemAssigned[Tożsamość przydzielana przez system]
    UserAssigned[Tożsamość przypisywana przez użytkownika]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Cykl życia powiązany z zasobem]
    SystemAssigned --> SA2[Automatyczne tworzenie/usuwanie]
    SystemAssigned --> SA3[Najlepsze dla pojedynczego zasobu]
    
    UserAssigned --> UA1[Niezależny cykl życia]
    UserAssigned --> UA2[Ręczne tworzenie/usuwanie]
    UserAssigned --> UA3[Współdzielone między zasobami]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Feature | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Lifecycle** | Tied to resource | Independent |
| **Creation** | Automatic with resource | Manual creation |
| **Deletion** | Deleted with resource | Persists after resource deletion |
| **Sharing** | One resource only | Multiple resources |
| **Use Case** | Simple scenarios | Complex multi-resource scenarios |
| **AZD Default** | ✅ Recommended | Optional |

---

## Wymagania wstępne

### Wymagane narzędzia

Powinieneś mieć już zainstalowane te narzędzia z poprzednich lekcji:

```bash
# Zweryfikuj Azure Developer CLI
azd version
# ✅ Oczekiwane: azd wersja 1.0.0 lub nowsza

# Zweryfikuj Azure CLI
az --version
# ✅ Oczekiwane: azure-cli 2.50.0 lub nowsza
```

### Wymagania dotyczące Azure

- Aktywna subskrypcja Azure
- Uprawnienia do:
  - Tworzenia managed identities
  - Przypisywania ról RBAC
  - Tworzenia zasobów Key Vault
  - Wdrażania Container Apps

### Wymagania wiedzy

Powinieneś ukończyć:
- [Przewodnik instalacji](installation.md) - Konfiguracja AZD
- [Podstawy AZD](azd-basics.md) - Podstawowe koncepcje
- [Zarządzanie konfiguracją](configuration.md) - Zmienne środowiskowe

---

## Lekcja 1: Zrozumienie wzorców uwierzytelniania

### Wzorzec 1: Connection Strings (Przestarzałe - Unikać)

**Jak to działa:**
```bash
# Ciąg połączenia zawiera dane uwierzytelniające
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Problemy:**
- ❌ Sekrety widoczne w zmiennych środowiskowych
- ❌ Logowane w systemach wdrożeniowych
- ❌ Trudne do rotacji
- ❌ Brak śladu audytu dostępu

**Kiedy używać:** Tylko do lokalnego developmentu, nigdy w produkcji.

---

### Wzorzec 2: Odwołania do Key Vault (Lepsze)

**Jak to działa:**
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

**Korzyści:**
- ✅ Sekrety przechowywane bezpiecznie w Key Vault
- ✅ Centralne zarządzanie sekretami
- ✅ Rotacja bez zmian w kodzie

**Ograniczenia:**
- ⚠️ Nadal używa kluczy/hasła
- ⚠️ Trzeba zarządzać dostępem do Key Vault

**Kiedy używać:** Krok pośredni w migracji z connection stringów do managed identity.

---

### Wzorzec 3: Managed Identity (Najlepsza praktyka)

**Jak to działa:**
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

**Kod aplikacji:**
```javascript
// Nie są potrzebne żadne sekrety!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Korzyści:**
- ✅ Brak sekretów w kodzie/konfiguracji
- ✅ Automatyczna rotacja poświadczeń
- ✅ Pełny rejestr audytu
- ✅ Uprawnienia oparte na RBAC
- ✅ Gotowe do zgodności

**Kiedy używać:** Zawsze, dla aplikacji produkcyjnych.

---

## Lekcja 2: Implementacja Managed Identity z AZD

### Krok po kroku

Zbudujmy bezpieczną aplikację Container App, która używa managed identity do dostępu do Azure Storage i Key Vault.

### Struktura projektu

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

### 1. Konfiguracja AZD (azure.yaml)

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

### 2. Infrastruktura: Włączenie Managed Identity

**Plik: `infra/main.bicep`**

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

### 3. Container App z tożsamością przydzieloną przez system

**Plik: `infra/app/container-app.bicep`**

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

### 4. Moduł przypisania ról RBAC

**Plik: `infra/core/role-assignment.bicep`**

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

### 5. Kod aplikacji z Managed Identity

**Plik: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Zainicjalizuj poświadczenie (działa automatycznie z tożsamością zarządzaną)
const credential = new DefaultAzureCredential();

// Konfiguracja Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Nie są potrzebne żadne klucze!
);

// Konfiguracja Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Nie są potrzebne żadne klucze!
);

// Sprawdzenie stanu
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Prześlij plik do magazynu blobów
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

// Pobierz sekret z Key Vault
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

// Wypisz listę kontenerów blobów (demonstruje dostęp do odczytu)
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

**Plik: `src/package.json`**

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

### 6. Wdrożenie i testy

```bash
# Zainicjalizuj środowisko AZD
azd init

# Wdróż infrastrukturę i aplikację
azd up

# Pobierz adres URL aplikacji
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Przetestuj kontrolę stanu aplikacji
curl $APP_URL/health
```

**✅ Oczekiwany wynik:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Test przesyłania bloba:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Oczekiwany wynik:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Test listowania kontenerów:**
```bash
curl $APP_URL/containers
```

**✅ Oczekiwany wynik:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Częste role RBAC w Azure

### Wbudowane identyfikatory ról dla Managed Identity

| Service | Role Name | Role ID | Permissions |
|---------|-----------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Odczyt blobów i kontenerów |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Odczyt, zapis, usuwanie blobów |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Odczyt, zapis, usuwanie wiadomości w kolejce |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Odczyt sekretów |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Odczyt, zapis, usuwanie sekretów |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Odczyt danych Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Odczyt, zapis danych Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Zarządzanie bazami danych SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Wysyłanie, odbieranie, zarządzanie wiadomościami |

### Jak znaleźć identyfikatory ról

```bash
# Wyświetl wszystkie wbudowane role
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Wyszukaj konkretną rolę
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Pobierz szczegóły roli
az role definition list --name "Storage Blob Data Contributor"
```

---

## Ćwiczenia praktyczne

### Ćwiczenie 1: Włącz Managed Identity dla istniejącej aplikacji ⭐⭐ (Średnie)

**Cel**: Dodaj managed identity do istniejącego wdrożenia Container App

**Scenariusz**: Masz Container App używającą connection stringów. Przekonwertuj ją na managed identity.

**Punkt wyjścia**: Container App z tą konfiguracją:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Kroki**:

1. **Włącz managed identity w Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Przyznaj dostęp do Storage:**

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

3. **Zaktualizuj kod aplikacji:**

**Przed (connection string):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Po (managed identity):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Zaktualizuj zmienne środowiskowe:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Wdróż i przetestuj:**

```bash
# Wdróż ponownie
azd up

# Sprawdź, czy nadal działa
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Kryteria sukcesu:**
- ✅ Aplikacja wdraża się bez błędów
- ✅ Operacje na Storage działają (upload, listowanie, pobieranie)
- ✅ Brak connection stringów w zmiennych środowiskowych
- ✅ Tożsamość widoczna w Azure Portal pod zakładką "Identity"

**Weryfikacja:**

```bash
# Sprawdź, czy zarządzana tożsamość jest włączona
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Oczekiwane: "SystemAssigned"

# Sprawdź przypisanie roli
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Oczekiwane: Pokazuje rolę "Storage Blob Data Contributor"
```

**Czas**: 20–30 minut

---

### Ćwiczenie 2: Dostęp wielousługowy z User-Assigned Identity ⭐⭐⭐ (Zaawansowane)

**Cel**: Utwórz user-assigned identity współdzieloną przez wiele Container Apps

**Scenariusz**: Masz 3 mikroserwisy, które wszystkie potrzebują dostępu do tego samego konta Storage i Key Vault.

**Kroki**:

1. **Utwórz user-assigned identity:**

**Plik: `infra/core/identity.bicep`**

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

2. **Przypisz role do user-assigned identity:**

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

3. **Przypisz tożsamość do wielu Container Apps:**

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

4. **Kod aplikacji (wszystkie serwisy używają tego samego wzorca):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Dla tożsamości przypisanej przez użytkownika określ ID klienta
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID klienta tożsamości przypisanej przez użytkownika
);

// Lub użyj DefaultAzureCredential (wykrywa automatycznie)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Wdróż i zweryfikuj:**

```bash
azd up

# Sprawdź, czy wszystkie usługi mają dostęp do pamięci masowej
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Kryteria sukcesu:**
- ✅ Jedna tożsamość współdzielona przez 3 usługi
- ✅ Wszystkie usługi mają dostęp do Storage i Key Vault
- ✅ Tożsamość przetrwa usunięcie pojedynczej usługi
- ✅ Centralne zarządzanie uprawnieniami

**Korzyści z User-Assigned Identity:**
- Jedna tożsamość do zarządzania
- Spójne uprawnienia między usługami
- Przetrwa usunięcie usługi
- Lepsze dla złożonych architektur

**Czas**: 30–40 minut

---

### Ćwiczenie 3: Wdrożenie rotacji sekretów w Key Vault ⭐⭐⭐ (Zaawansowane)

**Cel**: Przechowuj klucze API stron trzecich w Key Vault i uzyskaj do nich dostęp za pomocą managed identity

**Scenariusz**: Twoja aplikacja musi wywoływać zewnętrzne API (OpenAI, Stripe, SendGrid), które wymagają kluczy API.

**Kroki**:

1. **Utwórz Key Vault z RBAC:**

**Plik: `infra/core/keyvault.bicep`**

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

2. **Przechowaj sekrety w Key Vault:**

```bash
# Pobierz nazwę Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Przechowaj klucze API stron trzecich
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

3. **Kod aplikacji, aby pobierać sekrety:**

**Plik: `src/config.js`**

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
    // Najpierw sprawdź pamięć podręczną
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

4. **Użyj sekretów w aplikacji:**

**Plik: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Zainicjalizuj OpenAI używając klucza z magazynu kluczy
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Wywołaj przy uruchomieniu
initializeServices().catch(console.error);

app.post('/chat', async (req, res) => {
  try {
    const completion = await openaiClient.chat.completions.create({
      model: 'gpt-4',
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

5. **Wdróż i przetestuj:**

```bash
azd up

# Sprawdź, czy klucze API działają
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Kryteria sukcesu:**
- ✅ Brak kluczy API w kodzie lub zmiennych środowiskowych
- ✅ Aplikacja pobiera klucze z Key Vault
- ✅ Zewnętrzne API działają poprawnie
- ✅ Można rotować klucze bez zmian w kodzie

**Obróć sekret:**

```bash
# Zaktualizuj sekret w Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Uruchom ponownie aplikację, aby pobrała nowy klucz
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Czas**: 25–35 minut

---

## Punkt kontrolny wiedzy

### 1. Wzorce uwierzytelniania ✓

Sprawdź swoją wiedzę:

- [ ] **P1**: Jakie są trzy główne wzorce uwierzytelniania? 
  - **Odp**: Connection strings (przestarzały), odwołania do Key Vault (przejściowy), Managed Identity (najlepsza praktyka)

- [ ] **P2**: Dlaczego managed identity jest lepsze niż connection strings?
  - **Odp**: Brak sekretów w kodzie, automatyczna rotacja, pełny rejestr audytu, uprawnienia RBAC

- [ ] **P3**: Kiedy użyć user-assigned identity zamiast system-assigned?
  - **Odp**: Gdy tożsamość ma być współdzielona między wieloma zasobami lub gdy cykl życia tożsamości jest niezależny od cyklu życia zasobu

**Weryfikacja praktyczna:**
```bash
# Sprawdź, jakiego typu tożsamość używa twoja aplikacja
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Wypisz wszystkie przypisania ról dla tej tożsamości
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC i uprawnienia ✓

Sprawdź swoją wiedzę:

- [ ] **P1**: Jaki jest identyfikator roli dla "Storage Blob Data Contributor"?
  - **Odp**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **P2**: Jakie uprawnienia daje "Key Vault Secrets User"?
  - **Odp**: Dostęp tylko do odczytu sekretów (nie można tworzyć, aktualizować ani usuwać)

- [ ] **P3**: Jak przyznać Container App dostęp do Azure SQL?
  - **Odp**: Przypisać rolę "SQL DB Contributor" lub skonfigurować uwierzytelnianie Azure AD dla SQL

**Weryfikacja praktyczna:**
```bash
# Znajdź konkretną rolę
az role definition list --name "Storage Blob Data Contributor"

# Sprawdź, jakie role są przypisane twojej tożsamości
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integracja z Key Vault ✓

Test your understanding:
- [ ] **Q1**: Jak włączyć RBAC dla Key Vault zamiast polityk dostępu?
  - **A**: Ustaw `enableRbacAuthorization: true` w Bicep

- [ ] **Q2**: Która biblioteka Azure SDK obsługuje uwierzytelnianie tożsamości zarządzanej?
  - **A**: `@azure/identity` z klasą `DefaultAzureCredential`

- [ ] **Q3**: Jak długo tajemnice Key Vault pozostają w pamięci podręcznej?
  - **A**: Zależy od aplikacji; zaimplementuj własną strategię buforowania

**Weryfikacja praktyczna:**
```bash
# Test dostępu do Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Sprawdź, czy RBAC jest włączony
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Oczekiwane: true
```

---

## Najlepsze praktyki bezpieczeństwa

### ✅ ZRÓB:

1. **Zawsze używaj tożsamości zarządzanej w środowisku produkcyjnym**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Używaj ról RBAC z najmniejszymi uprawnieniami**
   - Używaj "Reader" roles gdy to możliwe
   - Unikaj "Owner" lub "Contributor" chyba że to konieczne

3. **Przechowuj klucze stron trzecich w Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Włącz rejestrowanie audytu**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Używaj różnych tożsamości dla dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Regularnie rotuj sekrety**
   - Ustaw daty wygaśnięcia dla sekretów w Key Vault
   - Automatyzuj rotację przy pomocy Azure Functions

### ❌ NIE RÓB:

1. **Nigdy nie umieszczaj sekretów na stałe w kodzie**
   ```javascript
   // ❌ ZŁE
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Nie używaj connection strings w środowisku produkcyjnym**
   ```javascript
   // ❌ ZŁE
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Nie przyznawaj nadmiernych uprawnień**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Nie loguj sekretów**
   ```javascript
   // ❌ ZŁE
   console.log('API Key:', apiKey);
   
   // ✅ DOBRE
   console.log('API Key retrieved successfully');
   ```

5. **Nie udostępniaj tożsamości produkcyjnych między środowiskami**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Poradnik rozwiązywania problemów

### Problem: "Unauthorized" przy dostępie do Azure Storage

**Objawy:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnoza:**

```bash
# Sprawdź, czy tożsamość zarządzana jest włączona
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Oczekiwane: "SystemAssigned" lub "UserAssigned"

# Sprawdź przypisania ról
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Oczekiwane: Powinno być widoczne "Storage Blob Data Contributor" lub podobna rola
```

**Rozwiązania:**

1. **Przyznaj właściwą rolę RBAC:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Poczekaj na propagację (może trwać 5-10 minut):**
```bash
# Sprawdź status przypisania roli
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Sprawdź, czy kod aplikacji używa poprawnych poświadczeń:**
```javascript
// Upewnij się, że używasz DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problem: Odmowa dostępu do Key Vault

**Objawy:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnoza:**

```bash
# Sprawdź, czy RBAC w Key Vault jest włączony
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Oczekiwane: true

# Sprawdź przypisania ról
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Rozwiązania:**

1. **Włącz RBAC na Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Przyznaj rolę Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problem: DefaultAzureCredential nie działa lokalnie

**Objawy:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnoza:**

```bash
# Sprawdź, czy jesteś zalogowany
az account show

# Sprawdź uwierzytelnianie Azure CLI
az ad signed-in-user show
```

**Rozwiązania:**

1. **Zaloguj się do Azure CLI:**
```bash
az login
```

2. **Ustaw subskrypcję Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Dla lokalnego rozwoju użyj zmiennych środowiskowych:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Lub użyj innego poświadczenia lokalnie:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Użyj AzureCliCredential w środowisku lokalnym
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problem: Przypisanie roli zajmuje zbyt dużo czasu na propagację

**Objawy:**
- Rola przypisana pomyślnie
- Nadal występują błędy 403
- Przerywany dostęp (czasami działa, czasami nie)

**Wyjaśnienie:**
Zmiany RBAC w Azure mogą wymagać 5-10 minut na propagację globalną.

**Rozwiązanie:**

```bash
# Poczekaj i spróbuj ponownie
echo "Waiting for RBAC propagation..."
sleep 300  # Poczekaj 5 minut

# Przetestuj dostęp
curl https://myapp.azurecontainerapps.io/upload

# Jeśli nadal występuje błąd, uruchom ponownie aplikację
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Rozważania dotyczące kosztów

### Koszty tożsamości zarządzanej

| Zasób | Koszt |
|----------|------|
| **Tożsamość zarządzana** | 🆓 **DARMOWE** - Brak opłat |
| **Przypisania ról RBAC** | 🆓 **DARMOWE** - Brak opłat |
| **Żądania tokenów Azure AD** | 🆓 **DARMOWE** - Wliczone |
| **Operacje Key Vault** | $0.03 za 10 000 operacji |
| **Przechowywanie w Key Vault** | $0.024 za sekret miesięcznie |

**Tożsamość zarządzana oszczędza pieniądze dzięki:**
- ✅ Eliminowaniu operacji Key Vault dla uwierzytelniania usługa-do-usługi
- ✅ Zmniejszeniu incydentów bezpieczeństwa (brak wycieków poświadczeń)
- ✅ Zmniejszeniu obciążenia operacyjnego (brak ręcznej rotacji)

**Przykładowe porównanie kosztów (miesięcznie):**

| Scenariusz | Connection Strings | Tożsamość zarządzana | Oszczędności |
|----------|-------------------|-----------------|---------|
| Mała aplikacja (1M żądań) | ~$50 (Key Vault + ops) | ~$0 | $50/month |
| Średnia aplikacja (10M żądań) | ~$200 | ~$0 | $200/month |
| Duża aplikacja (100M żądań) | ~$1,500 | ~$0 | $1,500/month |

---

## Dowiedz się więcej

### Oficjalna dokumentacja
- [Tożsamość zarządzana w Azure](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [RBAC w Azure](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Dokumentacja SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Kolejne kroki w tym kursie
- ← Poprzedni: [Zarządzanie konfiguracją](configuration.md)
- → Następny: [Pierwszy projekt](first-project.md)
- 🏠 [Strona główna kursu](../../README.md)

### Powiązane przykłady
- [Przykład Azure OpenAI Chat](../../../../examples/azure-openai-chat) - Używa tożsamości zarządzanej dla Azure OpenAI
- [Przykład mikroserwisów](../../../../examples/microservices) - Wzorce uwierzytelniania wieloserwisowego

---

## Podsumowanie

**Nauczyłeś się:**
- ✅ Trzy wzorce uwierzytelniania (connection strings, Key Vault, tożsamość zarządzana)
- ✅ Jak włączyć i skonfigurować tożsamość zarządzaną w AZD
- ✅ Przypisania ról RBAC dla usług Azure
- ✅ Integracja Key Vault dla sekretów stron trzecich
- ✅ Tożsamości przypisane przez użytkownika vs przypisane przez system
- ✅ Najlepsze praktyki bezpieczeństwa i rozwiązywanie problemów

**Główne wnioski:**
1. **Zawsze używaj tożsamości zarządzanej w środowisku produkcyjnym** - Brak sekretów, automatyczna rotacja
2. **Używaj ról RBAC z najmniejszymi uprawnieniami** - Przyznawaj tylko niezbędne uprawnienia
3. **Przechowuj klucze stron trzecich w Key Vault** - Centralne zarządzanie sekretami
4. **Oddziel tożsamości dla każdego środowiska** - Izolacja dev, staging, prod
5. **Włącz rejestrowanie audytu** - Śledź, kto uzyskał dostęp do czego

**Kolejne kroki:**
1. Wykonaj powyższe ćwiczenia praktyczne
2. Migruj istniejącą aplikację z connection strings do tożsamości zarządzanej
3. Zbuduj swój pierwszy projekt AZD z bezpieczeństwem od pierwszego dnia: [Pierwszy projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby zapewnić poprawność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być traktowany jako wersja wiążąca. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->