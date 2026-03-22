# Padrões de Autenticação e Identidade Gerida

⏱️ **Tempo Estimado**: 45-60 minutos | 💰 **Impacto no Custo**: Grátis (sem custos adicionais) | ⭐ **Complexidade**: Intermédio

**📚 Roteiro de Aprendizagem:**
- ← Anterior: [Gestão de Configuração](configuration.md) - Gestão de variáveis de ambiente e segredos
- 🎯 **Está Aqui**: Autenticação & Segurança (Identidade Gerida, Key Vault, padrões seguros)
- → Seguinte: [Primeiro Projeto](first-project.md) - Construa a sua primeira aplicação AZD
- 🏠 [Página Inicial do Curso](../../README.md)

---

## O Que Vai Aprender

Ao concluir esta lição, irá:
- Compreender os padrões de autenticação do Azure (chaves, cadeias de ligação, identidade gerida)
- Implementar **Identidade Gerida** para autenticação sem palavra-passe
- Proteger segredos com integração **Azure Key Vault**
- Configurar **controlo de acesso baseado em funções (RBAC)** para implementações AZD
- Aplicar boas práticas de segurança em Container Apps e serviços Azure
- Migrar de autenticação baseada em chaves para baseada em identidade

## Porquê a Identidade Gerida é Importante

### O Problema: Autenticação Tradicional

**Antes da Identidade Gerida:**
```javascript
// ❌ RISCO DE SEGURANÇA: Segredos codificados diretamente no código
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Problemas:**
- 🔴 **Segredos expostos** no código, ficheiros de configuração, variáveis de ambiente
- 🔴 **Rotação de credenciais** requer alterações no código e nova implantação
- 🔴 **Pesadelos de auditoria** - quem acedeu a quê, quando?
- 🔴 **Dispersão** - segredos espalhados por vários sistemas
- 🔴 **Riscos de conformidade** - falha em auditorias de segurança

### A Solução: Identidade Gerida

**Depois da Identidade Gerida:**
```javascript
// ✅ SEGURO: Sem segredos no código
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // A Azure gere automaticamente a autenticação
);
```

**Benefícios:**
- ✅ **Zero segredos** no código ou configuração
- ✅ **Rotação automática** - gerida pelo Azure
- ✅ **Rastreamento completo** em logs do Azure AD
- ✅ **Segurança centralizada** - gestão no Portal Azure
- ✅ **Pronto para conformidade** - cumpre as normas de segurança

**Analogia**: A autenticação tradicional é como transportar várias chaves físicas para diferentes portas. A Identidade Gerida é como ter um crachá de segurança que concede automaticamente acesso com base em quem é — sem chaves para perder, copiar ou rodar.

---

## Visão Geral da Arquitetura

### Fluxo de Autenticação com Identidade Gerida

```mermaid
sequenceDiagram
    participant App as A Sua Aplicação<br/>(Aplicação Contentor)
    participant MI as Identidade Gerida<br/>(Azure AD)
    participant KV as Cofre de Chaves
    participant Storage as Armazenamento Azure
    participant DB as Azure SQL
    
    App->>MI: Solicitar token de acesso<br/>(automático)
    MI->>MI: Verificar identidade<br/>(sem necessidade de palavra-passe)
    MI-->>App: Devolver token<br/>(válido 1 hora)
    
    App->>KV: Obter segredo<br/>(usando token)
    KV->>KV: Verificar permissões RBAC
    KV-->>App: Devolver valor do segredo
    
    App->>Storage: Carregar blob<br/>(usando token)
    Storage->>Storage: Verificar permissões RBAC
    Storage-->>App: Sucesso
    
    App->>DB: Consultar dados<br/>(usando token)
    DB->>DB: Verificar permissões SQL
    DB-->>App: Devolver resultados
    
    Note over App,DB: Toda a autenticação sem palavra-passe!
```
### Tipos de Identidades Geridas

```mermaid
graph TB
    MI[Managed Identity]
    SystemAssigned[Identidade Atribuída pelo Sistema]
    UserAssigned[Identidade Atribuída pelo Utilizador]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Ciclo de vida ligado ao recurso]
    SystemAssigned --> SA2[Criação/elinação automática]
    SystemAssigned --> SA3[Melhor para recurso único]
    
    UserAssigned --> UA1[Ciclo de vida independente]
    UserAssigned --> UA2[Criação/elinação manual]
    UserAssigned --> UA3[Partilhado entre recursos]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Funcionalidade | Atribuída ao Sistema | Atribuída ao Utilizador |
|----------------|---------------------|------------------------|
| **Ciclo de Vida** | Ligada ao recurso | Independente |
| **Criação** | Automática com o recurso | Criação manual |
| **Eliminação** | Eliminada com o recurso | Persiste após eliminação do recurso |
| **Partilha** | Apenas um recurso | Vários recursos |
| **Caso de Uso** | Cenários simples | Cenários complexos multi-recurso |
| **Padrão AZD** | ✅ Recomendado | Opcional |

---

## Pré-requisitos

### Ferramentas Necessárias

Deve ter já estas instaladas a partir das lições anteriores:

```bash
# Verificar Azure Developer CLI
azd version
# ✅ Esperado: azd versão 1.0.0 ou superior

# Verificar Azure CLI
az --version
# ✅ Esperado: azure-cli 2.50.0 ou superior
```

### Requisitos Azure

- Subscrição Azure ativa
- Permissões para:
  - Criar identidades geridas
  - Atribuir funções RBAC
  - Criar recursos Key Vault
  - Implementar Container Apps

### Conhecimentos Pré-requisitos

Deve ter concluído:
- [Guia de Instalação](installation.md) - Configuração AZD
- [Conceitos Básicos AZD](azd-basics.md) - Conceitos principais
- [Gestão de Configuração](configuration.md) - Variáveis de ambiente

---

## Lição 1: Compreender Padrões de Autenticação

### Padrão 1: Cadeias de Ligação (Legado - Evitar)

**Como funciona:**
```bash
# A string de ligação contém credenciais
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Problemas:**
- ❌ Segredos visíveis nas variáveis de ambiente
- ❌ Registados nos sistemas de implantação
- ❌ Difíceis de rodar
- ❌ Sem rasto de auditoria de acesso

**Quando usar:** Apenas para desenvolvimento local, nunca em produção.

---

### Padrão 2: Referências do Key Vault (Melhor)

**Como funciona:**
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

**Benefícios:**
- ✅ Segredos armazenados de forma segura no Key Vault
- ✅ Gestão centralizada de segredos
- ✅ Rotação sem alterações de código

**Limitações:**
- ⚠️ Ainda usa chaves/palavras-passe
- ⚠️ Necessário gerir acesso ao Key Vault

**Quando usar:** Etapa de transição entre cadeias de ligação e identidade gerida.

---

### Padrão 3: Identidade Gerida (Melhor Prática)

**Como funciona:**
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

**Código da aplicação:**
```javascript
// Não são necessários segredos!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Benefícios:**
- ✅ Zero segredos no código/configuração
- ✅ Rotação automática de credenciais
- ✅ Rastreamento completo
- ✅ Permissões baseadas em RBAC
- ✅ Pronto para conformidade

**Quando usar:** Sempre, para aplicações em produção.

---

## Lição 2: Implementar Identidade Gerida com AZD

### Implementação Passo a Passo

Vamos construir um Container App seguro que usa identidade gerida para aceder ao Azure Storage e Key Vault.

### Estrutura do Projeto

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

### 1. Configurar AZD (azure.yaml)

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

### 2. Infraestrutura: Ativar Identidade Gerida

**Ficheiro: `infra/main.bicep`**

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

### 3. Container App com Identidade Atribuída ao Sistema

**Ficheiro: `infra/app/container-app.bicep`**

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

### 4. Módulo de Atribuição de Função RBAC

**Ficheiro: `infra/core/role-assignment.bicep`**

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

### 5. Código da Aplicação com Identidade Gerida

**Ficheiro: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Inicializar credencial (funciona automaticamente com identidade gerida)
const credential = new DefaultAzureCredential();

// Configuração do Azure Storage
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Não são necessárias chaves!
);

// Configuração do Key Vault
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Não são necessárias chaves!
);

// Verificação de estado
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Carregar ficheiro para armazenamento blob
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

// Obter segredo do Key Vault
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

// Listar contentores blob (demonstra acesso de leitura)
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

**Ficheiro: `src/package.json`**

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

### 6. Implementar e Testar

```bash
# Inicializar ambiente AZD
azd init

# Implementar infraestrutura e aplicação
azd up

# Obter a URL da aplicação
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Testar verificação de estado
curl $APP_URL/health
```

**✅ Resultado esperado:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Teste de upload de blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Resultado esperado:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Teste de listagem de container:**
```bash
curl $APP_URL/containers
```

**✅ Resultado esperado:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Funções RBAC Comuns no Azure

### IDs de Função Incorporados para Identidade Gerida

| Serviço | Nome da Função | ID da Função | Permissões |
|---------|----------------|--------------|------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Leitura de blobs e containers |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Leitura, escrita, remoção de blobs |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Leitura, escrita, remoção de mensagens da fila |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Leitura de segredos |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Leitura, escrita, remoção de segredos |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Leitura de dados Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Leitura e escrita de dados Cosmos DB |
| **Base de Dados SQL** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Gestão de bases de dados SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Enviar, receber, gerir mensagens |

### Como Encontrar IDs de Função

```bash
# Listar todos os papéis incorporados
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Pesquisar papel específico
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Obter detalhes do papel
az role definition list --name "Storage Blob Data Contributor"
```

---

## Exercícios Práticos

### Exercício 1: Ativar Identidade Gerida para App Existente ⭐⭐ (Médio)

**Objetivo**: Adicionar identidade gerida a uma implementação de Container App existente

**Cenário**: Tem um Container App a usar cadeias de ligação. Converta-o para identidade gerida.

**Ponto de Partida**: Container App com esta configuração:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Passos**:

1. **Ativar identidade gerida em Bicep:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Conceder acesso ao Storage:**

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

3. **Atualizar código da aplicação:**

**Antes (cadeia de ligação):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Depois (identidade gerida):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Atualizar variáveis de ambiente:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Implementar e testar:**

```bash
# Reimplantar
azd up

# Testar se ainda funciona
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Critérios de Sucesso:**
- ✅ Aplicação implementa sem erros
- ✅ Operações no Storage funcionam (upload, listagem, download)
- ✅ Sem cadeias de ligação nas variáveis de ambiente
- ✅ Identidade visível no Portal Azure em "Identity"

**Verificação:**

```bash
# Verificar se a identidade gerida está ativada
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Esperado: "SystemAssigned"

# Verificar atribuição de função
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Esperado: Mostra a função "Storage Blob Data Contributor"
```

**Tempo**: 20-30 minutos

---

### Exercício 2: Acesso Multi-Serviço com Identidade Atribuída ao Utilizador ⭐⭐⭐ (Avançado)

**Objetivo**: Criar uma identidade atribuída ao utilizador partilhada por múltiplos Container Apps

**Cenário**: Tem 3 microserviços que precisam todos de acesso à mesma conta Storage e Key Vault.

**Passos**:

1. **Criar identidade atribuída ao utilizador:**

**Ficheiro: `infra/core/identity.bicep`**

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

2. **Atribuir funções à identidade atribuída ao utilizador:**

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

3. **Atribuir identidade a vários Container Apps:**

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

4. **Código da aplicação (todos os serviços usam o mesmo padrão):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Para identidade atribuída pelo utilizador, especifique o ID do cliente
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // ID do cliente da identidade atribuída pelo utilizador
);

// Ou use DefaultAzureCredential (deteta automaticamente)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Implementar e verificar:**

```bash
azd up

# Testar se todos os serviços conseguem aceder ao armazenamento
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Critérios de Sucesso:**
- ✅ Uma identidade partilhada por 3 serviços
- ✅ Todos os serviços acedem a Storage e Key Vault
- ✅ Identidade persiste se eliminar um serviço
- ✅ Gestão centralizada de permissões

**Benefícios da Identidade Atribuída ao Utilizador:**
- Identidade única para gerir
- Permissões coerentes entre serviços
- Sobrevive à eliminação de serviços
- Melhor para arquiteturas complexas

**Tempo**: 30-40 minutos

---

### Exercício 3: Implementar Rotação de Segredos no Key Vault ⭐⭐⭐ (Avançado)

**Objetivo**: Armazenar chaves de API de terceiros no Key Vault e aceder com identidade gerida

**Cenário**: A sua app precisa de chamar APIs externas (OpenAI, Stripe, SendGrid) que requerem chaves API.

**Passos**:

1. **Criar Key Vault com RBAC:**

**Ficheiro: `infra/core/keyvault.bicep`**

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

2. **Armazenar segredos no Key Vault:**

```bash
# Obter o nome do Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Armazenar chaves de API de terceiros
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

3. **Código da aplicação para recuperar segredos:**

**Ficheiro: `src/config.js`**

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
    // Verificar a cache primeiro
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

4. **Usar segredos na aplicação:**

**Ficheiro: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Inicializar OpenAI com a chave do Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Chamar na inicialização
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

5. **Implementar e testar:**

```bash
azd up

# Testar se as chaves da API funcionam
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Critérios de Sucesso:**
- ✅ Sem chaves API no código ou variáveis de ambiente
- ✅ Aplicação recupera chaves do Key Vault
- ✅ APIs de terceiros funcionam corretamente
- ✅ Pode rodar chaves sem alterar código

**Rodar um segredo:**

```bash
# Atualizar segredo no Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Reiniciar a aplicação para reconhecer a nova chave
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Tempo**: 25-35 minutos

---

## Verificação de Conhecimentos

### 1. Padrões de Autenticação ✓

Teste a sua compreensão:

- [ ] **Q1**: Quais são os três principais padrões de autenticação? 
  - **A**: Cadeias de ligação (legado), referências Key Vault (transição), Identidade Gerida (melhor)

- [ ] **Q2**: Porque é que a identidade gerida é melhor do que cadeias de ligação?
  - **A**: Sem segredos no código, rotação automática, rastreamento completo, permissões RBAC

- [ ] **Q3**: Quando utilizaria identidade atribuída ao utilizador em vez de identidade atribuída ao sistema?
  - **A**: Ao partilhar a identidade entre múltiplos recursos ou quando o ciclo de vida da identidade é independente do recurso

**Verificação Prática:**
```bash
# Verifique que tipo de identidade a sua aplicação utiliza
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Liste todas as atribuições de funções para a identidade
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC e Permissões ✓

Teste a sua compreensão:

- [ ] **Q1**: Qual é o ID da função para "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **Q2**: Que permissões oferece o "Key Vault Secrets User"?
  - **A**: Acesso de leitura apenas aos segredos (não pode criar, atualizar ou eliminar)

- [ ] **Q3**: Como concede a um Container App acesso a Azure SQL?
  - **A**: Atribuindo a função "SQL DB Contributor" ou configurando autenticação Azure AD para SQL

**Verificação Prática:**
```bash
# Encontrar uma função específica
az role definition list --name "Storage Blob Data Contributor"

# Verificar quais funções estão atribuídas à sua identidade
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integração com Key Vault ✓

Teste a sua compreensão:
- [ ] **Q1**: Como é que ativa o RBAC para o Key Vault em vez das políticas de acesso?
  - **A**: Defina `enableRbacAuthorization: true` no Bicep

- [ ] **Q2**: Que biblioteca do Azure SDK lida com a autenticação de identidade gerida?
  - **A**: `@azure/identity` com a classe `DefaultAzureCredential`

- [ ] **Q3**: Quanto tempo é que os segredos do Key Vault permanecem em cache?
  - **A**: Depende da aplicação; implemente a sua própria estratégia de cache

**Verificação Prática:**
```bash
# Testar o acesso ao Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Verificar se o RBAC está ativado
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Esperado: true
```

---

## Melhores Práticas de Segurança

### ✅ FAÇA:

1. **Sempre use identidade gerida em produção**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Use funções RBAC com privilégios mínimos**
   - Use funções "Reader" sempre que possível
   - Evite "Owner" ou "Contributor" a menos que seja necessário

3. **Armazene chaves de terceiros no Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Ative o registo de auditoria**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Use identidades diferentes para dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rode os segredos regularmente**
   - Defina datas de expiração nos segredos do Key Vault
   - Automatize a rotação com Azure Functions

### ❌ NÃO FAÇA:

1. **Nunca codifique segredos diretamente no código**
   ```javascript
   // ❌ MAU
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Não use strings de ligação em produção**
   ```javascript
   // ❌ MAU
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Não conceda permissões excessivas**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Não registe segredos**
   ```javascript
   // ❌ MAU
   console.log('API Key:', apiKey);
   
   // ✅ BOM
   console.log('API Key retrieved successfully');
   ```

5. **Não partilhe identidades de produção entre ambientes**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Guia de Resolução de Problemas

### Problema: "Unauthorized" ao aceder ao Azure Storage

**Sintomas:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnóstico:**

```bash
# Verificar se a identidade gerida está ativada
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Esperado: "SystemAssigned" ou "UserAssigned"

# Verificar atribuições de função
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Esperado: Deve ver "Storage Blob Data Contributor" ou uma função semelhante
```

**Soluções:**

1. **Conceda a função RBAC correta:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Aguarde a propagação (pode levar 5-10 minutos):**
```bash
# Verificar o estado da atribuição de função
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Verifique se o código da aplicação usa as credenciais corretas:**
```javascript
// Certifique-se de que está a usar DefaultAzureCredential
const credential = new DefaultAzureCredential();
```

---

### Problema: Acesso ao Key Vault negado

**Sintomas:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnóstico:**

```bash
# Verificar se o RBAC do Key Vault está ativado
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Esperado: verdadeiro

# Verificar atribuições de função
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Soluções:**

1. **Ative o RBAC no Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Conceda a função Key Vault Secrets User:**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problema: DefaultAzureCredential falha localmente

**Sintomas:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnóstico:**

```bash
# Verifique se está autenticado
az account show

# Verifique a autenticação do Azure CLI
az ad signed-in-user show
```

**Soluções:**

1. **Inicie sessão no Azure CLI:**
```bash
az login
```

2. **Defina a subscrição Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Para desenvolvimento local, use variáveis de ambiente:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Ou use credenciais diferentes localmente:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Use AzureCliCredential para desenvolvimento local
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problema: Atribuição de função demora a propagar

**Sintomas:**
- Função atribuída com sucesso
- Continua a receber erros 403
- Acesso intermitente (às vezes funciona, às vezes não)

**Explicação:**
As alterações RBAC no Azure podem levar de 5 a 10 minutos a propagar-se globalmente.

**Solução:**

```bash
# Aguarde e tente novamente
echo "Waiting for RBAC propagation..."
sleep 300  # Aguarde 5 minutos

# Testar acesso
curl https://myapp.azurecontainerapps.io/upload

# Se continuar a falhar, reinicie a aplicação
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Considerações de Custo

### Custos da Identidade Gerida

| Recurso | Custo |
|----------|------|
| **Identidade Gerida** | 🆓 **GRÁTIS** - Sem custos |
| **Atribuições de Função RBAC** | 🆓 **GRÁTIS** - Sem custos |
| **Pedidos de Token Azure AD** | 🆓 **GRÁTIS** - Incluído |
| **Operações Key Vault** | $0,03 por 10,000 operações |
| **Armazenamento Key Vault** | $0,024 por segredo por mês |

**A identidade gerida poupa dinheiro ao:**
- ✅ Eliminar operações no Key Vault para autenticação serviço a serviço
- ✅ Reduzir incidentes de segurança (sem credenciais expostas)
- ✅ Diminuir a sobrecarga operacional (sem rotações manuais)

**Exemplo de Comparação de Custos (mensal):**

| Cenário | Strings de Ligação | Identidade Gerida | Poupança |
|----------|-------------------|-----------------|---------|
| Aplicação pequena (1M pedidos) | ~50$ (Key Vault + operações) | ~0$ | 50$/mês |
| Aplicação média (10M pedidos) | ~200$ | ~0$ | 200$/mês |
| Aplicação grande (100M pedidos) | ~1,500$ | ~0$ | 1,500$/mês |

---

## Saiba Mais

### Documentação Oficial
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### Documentação do SDK
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Próximos Passos Neste Curso
- ← Anterior: [Gestão de Configuração](configuration.md)
- → Seguinte: [Primeiro Projeto](first-project.md)
- 🏠 [Página Principal do Curso](../../README.md)

### Exemplos Relacionados
- [Exemplo Microsoft Foundry Models Chat](../../../../examples/azure-openai-chat) - Usa identidade gerida para Microsoft Foundry Models
- [Exemplo Microservices](../../../../examples/microservices) - Padrões de autenticação multi-serviço

---

## Resumo

**Você aprendeu:**
- ✅ Três padrões de autenticação (strings de ligação, Key Vault, identidade gerida)
- ✅ Como ativar e configurar a identidade gerida no AZD
- ✅ Atribuições de função RBAC para serviços Azure
- ✅ Integração Key Vault para segredos de terceiros
- ✅ Identidades atribuídas pelo utilizador vs pelo sistema
- ✅ Melhores práticas de segurança e resolução de problemas

**Principais Lições:**
1. **Sempre use identidade gerida em produção** - Sem segredos, rotação automática
2. **Use funções RBAC com privilégios mínimos** - Conceda só permissões necessárias
3. **Armazene chaves de terceiros no Key Vault** - Gestão centralizada de segredos
4. **Separe identidades por ambiente** - Isolamento dev, staging, prod
5. **Ative o registo de auditoria** - Monitorize quem acedeu ao quê

**Próximos Passos:**
1. Complete os exercícios práticos acima
2. Migre uma aplicação existente de strings de ligação para identidade gerida
3. Construa o seu primeiro projeto AZD com segurança desde o primeiro dia: [Primeiro Projeto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora esforcemos para garantir a precisão, por favor, tenha em conta que as traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, é recomendada a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->