# Padrões de Autenticação e Identidade Gerida

⏱️ **Tempo Estimado**: 45-60 minutos de leitura; reserve tempo extra para integrar os exercícios | 💰 **Impacto de Custos**: Identidade/RBAC são gratuitos; computação implantada, armazenamento e Key Vault são faturáveis | ⭐ **Complexidade**: Intermédio

> Revisto com base em `azd 1.37.2` (Novembro 2026). Esta lição contém **fragmentos ilustrativos de integração, não um template completo para descarregar `secure-app`**. Crie os ficheiros referenciados, forneça a infraestrutura correspondente e substitua os espaços reservados antes da implantação. Nenhum recurso Azure foi provisionado durante a revisão.

**📚 Roteiro de Aprendizagem:**
- ← Anterior: [Gestão de Configuração](configuration.md) - Gestão de variáveis de ambiente e segredos
- 🎯 **Você está aqui**: Autenticação & Segurança (Identidade Gerida, Key Vault, padrões seguros)
- → Seguinte: [Infraestrutura como Código](../chapter-04-infrastructure/README.md) - Provisionar e implantar recursos
- 🏠 [Início do Curso](../../README.md)

---

## O que Vai Aprender

Ao completar esta lição, irá:
- Compreender os padrões de autenticação Azure (chaves, cadeias de conexão, identidade gerida)
- Implementar **Identidade Gerida** para autenticação sem palavra-passe
- Proteger segredos com integração **Azure Key Vault**
- Configurar **controle de acesso baseado em função (RBAC)** para implantações AZD
- Aplicar as melhores práticas de segurança em Container Apps e serviços Azure
- Migrar da autenticação baseada em chaves para baseada em identidade

## Por Que a Identidade Gerida é Importante

### O Problema: Autenticação Tradicional

**Antes da Identidade Gerida:**
```javascript
// ❌ SECURITY RISK: Hardcoded secrets in code
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Problemas:**
- 🔴 **Segredos expostos** em código, ficheiros de configuração, variáveis de ambiente
- 🔴 **Rotação de credenciais** requer alterações no código e nova implantação
- 🔴 **Pesadelos de auditoria** - quem acessou o quê, quando?
- 🔴 **Dispersão** - segredos espalhados por múltiplos sistemas
- 🔴 **Riscos de conformidade** - falha em auditorias de segurança

### A Solução: Identidade Gerida

**Após a Identidade Gerida:**
```javascript
// ✅ SECURE: No secrets in code
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure automatically handles authentication
);
```

**Benefícios:**
- ✅ **Zero segredos** no código ou configuração
- ✅ **Rotação automática** - Azure trata disso
- ✅ **Rasto de auditoria completo** nos logs do Microsoft Entra ID
- ✅ **Segurança centralizada** - gerir no Portal Azure
- ✅ **Conformidade assegurada** - cumpre padrões de segurança

**Analogia**: A autenticação tradicional é como carregar múltiplas chaves físicas para diferentes portas. A Identidade Gerida é como ter um crachá de segurança que concede automaticamente acesso baseado em quem é — sem chaves para perder, copiar ou rodar.

---

## Visão Geral da Arquitetura

### Fluxo de Autenticação com Identidade Gerida

```mermaid
sequenceDiagram
    participant App as Your Application<br/>(Container App)
    participant MI as Managed Identity<br/>(Microsoft Entra ID)
    participant KV as Key Vault
    participant Storage as Azure Storage
    participant DB as Azure SQL
    
    App->>MI: Request access token<br/>(automatic)
    MI->>MI: Verify identity<br/>(no password needed)
    MI-->>App: Return token for requested audience<br/>(lifetime varies)
    
    App->>KV: Get secret<br/>(using token)
    KV->>KV: Check RBAC permissions
    KV-->>App: Return secret value
    
    App->>Storage: Upload blob<br/>(using token)
    Storage->>Storage: Check RBAC permissions
    Storage-->>App: Success
    
    App->>DB: Query data<br/>(using token)
    DB->>DB: Check SQL permissions
    DB-->>App: Return results
    
    Note over App,DB: Request a separate token for each service audience;<br/>SDK credentials handle caching and renewal
```

### Tipos de Identidades Geridas

```mermaid
graph TB
    MI[Managed Identity]
    SystemAssigned[System-Assigned Identity]
    UserAssigned[User-Assigned Identity]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Lifecycle tied to resource]
    SystemAssigned --> SA2[Automatic creation/deletion]
    SystemAssigned --> SA3[Best for single resource]
    
    UserAssigned --> UA1[Independent lifecycle]
    UserAssigned --> UA2[Manual creation/deletion]
    UserAssigned --> UA3[Shared across resources]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```

| Recurso | System-Assigned | User-Assigned |
|---------|----------------|---------------|
| **Ciclo de Vida** | Ligado ao recurso | Independente |
| **Criação** | Automática com o recurso | Criação manual |
| **Eliminação** | Apagada com o recurso | Persiste após eliminação do recurso |
| **Partilha** | Um recurso apenas | Vários recursos |
| **Casos de Uso** | Cenários simples | Cenários complexos multi-recurso |
| **Escolha do Template** | Definida na infraestrutura | Definida na infraestrutura |

---

## Requisitos Prévios

### Ferramentas Necessárias

Deve já ter estas instaladas das lições anteriores:

```bash
# Verify Azure Developer CLI
azd version
# ✅ Expected: azd version 1.0.0 or higher

# Verify Azure CLI
az --version
# ✅ Expected: azure-cli 2.50.0 or higher
```

### Requisitos Azure

- Subscrição Azure ativa
- Permissões para:
  - Criar identidades geridas
  - Atribuir funções RBAC
  - Criar recursos Key Vault
  - Implantar Container Apps

### Conhecimentos Prévios

Deve ter completado:
- [Guia de Instalação](../chapter-01-foundation/installation.md) - Configuração AZD
- [Noções Básicas AZD](../chapter-01-foundation/azd-basics.md) - Conceitos essenciais
- [Gestão de Configuração](configuration.md) - Variáveis de ambiente

---

## Lição 1: Compreender Padrões de Autenticação

### Padrão 1: Cadeias de Conexão (Legado - Evitar)

**Como funciona:**
```bash
# Connection string contains credentials
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Problemas:**
- ❌ Segredos visíveis nas variáveis de ambiente
- ❌ Registados em sistemas de implantação
- ❌ Difíceis de rotacionar
- ❌ Sem rasto de auditoria de acesso

**Quando usar:** Quando o serviço alvo requer autenticação baseada em chave. Prefira identidade quando suportado; caso contrário, guarde as chaves em segurança e rode-as, inclusive em produção.

---

### Padrão 2: Referências Key Vault (Melhor)

**Como funciona:**
**Fragmentos parciais de Bicep:** campos obrigatórios do cofre, identidade do Container App e a sua entrada `configuration.secrets` são omitidos. `secretRef` nomeia um segredo do Container App; não é **em si** um URI do Key Vault. Para usar Key Vault, defina esse segredo nomeado com `keyVaultUrl` e um `identity` autorizado.

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
- ✅ Segredos guardados em segurança no Key Vault
- ✅ Gestão centralizada de segredos
- ✅ Rotação sem alterações de código

**Limitações:**
- ⚠️ Continua a usar chaves/palavras-passe
- ⚠️ Necessita gerir o acesso ao Key Vault

**Quando usar:** Etapa de transição de cadeias de conexão para identidade gerida.

---

### Padrão 3: Identidade Gerida (Melhor Prática)

**Como funciona:**
**Bicep parcial:** mescle o bloco de identidade numa Container App completa e forneça `storageAccount` e a definição da função. Uma atribuição de função também requer um `name` determinístico.

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
  name: guid(storageAccount.id, containerApp.id, storageBlobDataContributorRole)
  scope: storageAccount
  properties: {
    roleDefinitionId: storageBlobDataContributorRole
    principalId: containerApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}
```

**Código da aplicação:**
```javascript
// No secrets needed!
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
- ✅ Rasto de auditoria completo
- ✅ Permissões baseadas em RBAC
- ✅ Pronto para conformidade

**Quando usar:** Prefira para aplicações hospedadas no Azure que acedem a serviços que suportam autenticação Microsoft Entra.

---

### Padrão 4: Princípios de Serviço (CI/CD & Automação)

A identidade gerida é o padrão ouro *para recursos que correm dentro do Azure*. Mas e o que corre **fora** do Azure — como uma pipeline CI/CD num agente de build, ou um script no seu portátil que não pode usar o login interativo? É aí que entra um **princípio de serviço**: uma identidade não humana com as suas próprias credenciais, em que um processo automatizado pode autenticar-se.

**Como funciona:**

Crie um princípio de serviço limitado a um grupo de recursos (privilégio mínimo):

```bash
az ad sp create-for-rbac \
  --name "myapp-cicd" \
  --role contributor \
  --scopes "/subscriptions/<sub-id>/resourceGroups/<rg-name>"
```

Isso imprime um client ID, client secret e tenant ID. O azd pode autenticar-se com eles de forma não interativa:

```bash
azd auth login \
  --client-id "<appId>" \
  --client-secret "<password>" \
  --tenant-id "<tenant>"
```

**Prefira credenciais federadas (OIDC) em vez de segredos.** Em vez de um segredo cliente de longa duração, configure uma credencial federada para que a pipeline troque um token de curta duração — nenhum segredo para vazar ou rodar:

```bash
azd auth login \
  --client-id "<appId>" \
  --federated-credential-provider "github" \
  --tenant-id "<tenant>"
```

> `azd pipeline config` configura isto automaticamente para si. Veja os tutoriais CI/CD no [Capítulo 8](../chapter-08-production/production-ai-practices.md).

**Benefícios:**
- ✅ Funciona fora do Azure (agentes de build, on-premises, outras clouds)
- ✅ Pode ser limitado a um único grupo de recursos com uma função
- ✅ A variante federada (OIDC) não usa segredo armazenado

**Compromissos:**
- ⚠️ Variante com segredos requer armazenamento e rotação cuidadosa
- ⚠️ Um segredo vazado concede tudo que o PS pode fazer — mantenha escopos reduzidos

**Quando usar:** Pipelines CI/CD e automação que não podem usar identidade gerida. Prefira sempre a variante **federada/OIDC** em vez de segredo cliente, e prefira identidade gerida sempre que a carga correr dentro do Azure.

**Guardar credenciais com segurança:**
- Nunca submeta segredos — use o cofre de segredos da sua pipeline (segredos GitHub Actions, grupos de variáveis Azure DevOps / Key Vault).
- Limite o PS ao menor papel e grupo de recursos necessário.
- Defina uma expiração e rode, ou elimine o segredo completamente com OIDC.

---

## Lição 2: Implementar Identidade Gerida com AZD

### Implementação Passo a Passo

Os fragmentos seguintes mostram como integrar identidade gerida num projeto Container App. Eles **não são um ponto de partida copiar-e-executar**: o módulo Storage, infraestrutura completa do ambiente gerido/registry, Dockerfile e ficheiro de parâmetros não estão todos fornecidos aqui. Comece de um template Container Apps funcional e una estes padrões, mantendo a configuração do registry e etiquetas de serviço.

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

# Managed identity must be enabled in the infrastructure, not by this YAML.
```

### 2. Infraestrutura: Ativar Identidade Gerida

**Ficheiro: `infra/main.bicep`**

```bicep
targetScope = 'subscription'

param environmentName string
param location string = 'eastus'
param containerAppsEnvironmentId string
param containerImage string

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
    containerAppsEnvironmentId: containerAppsEnvironmentId
    containerImage: containerImage
  }
}

// Grant Container App access to Storage
module storageRoleAssignment './core/role-assignment.bicep' = {
  name: 'storage-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'  // Storage Blob Data Contributor
    targetResourceType: 'storage'
    targetResourceName: storage.outputs.name
  }
}

// Grant Container App access to Key Vault
module kvRoleAssignment './core/role-assignment.bicep' = {
  name: 'kv-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: '4633458b-17de-408a-b874-0445c86b69e6'  // Key Vault Secrets User
    targetResourceType: 'keyvault'
    targetResourceName: keyVault.outputs.name
  }
}

// Outputs
output AZURE_STORAGE_ACCOUNT_NAME string = storage.outputs.name
output AZURE_KEY_VAULT_NAME string = keyVault.outputs.name
output APP_URL string = containerApp.outputs.url
```

### 3. Container App com Identidade System-Assigned

**Ficheiro: `infra/app/container-app.bicep`**

```bicep
param name string
param location string
param tags object = {}
param storageAccountName string
param keyVaultName string
param containerAppsEnvironmentId string
param containerImage string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: union(tags, { 'azd-service-name': 'api' })
  identity: {
    type: 'SystemAssigned'  // 🔑 Enable managed identity
  }
  properties: {
    managedEnvironmentId: containerAppsEnvironmentId
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
          image: containerImage // Must exist; configure registry credentials for private images
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
@allowed(['storage', 'keyvault'])
param targetResourceType string
param targetResourceName string

// Typed existing resources give Bicep a valid resource scope, not a string ID.
resource storageTarget 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: targetResourceName
}
resource vaultTarget 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: targetResourceName
}

resource storageAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (targetResourceType == 'storage') {
  name: guid(storageTarget.id, principalId, roleDefinitionId)
  scope: storageTarget
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
    principalType: 'ServicePrincipal'
  }
}

resource vaultAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = if (targetResourceType == 'keyvault') {
  name: guid(vaultTarget.id, principalId, roleDefinitionId)
  scope: vaultTarget
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
    principalType: 'ServicePrincipal'
  }
}

// This module assigns at the target resource scope, not the whole resource group.
```

### 5. Código de Aplicação com Identidade Gerida

**Ficheiro: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Initialize credential (works automatically with managed identity)
const credential = new DefaultAzureCredential();

// Azure Storage setup
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // No keys needed!
);

// Key Vault setup
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // No keys needed!
);

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Upload file to blob storage
app.post('/upload', async (req, res) => {
  try {
    const containerClient = blobServiceClient.getContainerClient('uploads');
    await containerClient.createIfNotExists();
    
    const blobName = `file-${Date.now()}.txt`;
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);
    
    const content = 'Hello from managed identity!';
    await blockBlobClient.upload(content, Buffer.byteLength(content));
    
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

// Get secret from Key Vault
app.get('/secret/:name', async (req, res) => {
  try {
    const secretName = req.params.name;
    const secret = await secretClient.getSecret(secretName);
    
    res.json({
      name: secretName,
      retrieved: secret.value !== undefined, // Never return the secret value to callers
      message: 'Secret retrieved using managed identity!'
    });
  } catch (error) {
    console.error('Secret error:', error);
    res.status(500).json({ error: error.message });
  }
});

// List blob containers (demonstrates read access)
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

### 6. Implantar e Testar

Só execute estes comandos **depois** de completar a infraestrutura em falta, Dockerfile e correspondentes `main.parameters.json` no seu próprio projeto. Autentique azd com `azd auth login`; autentique separadamente com `az login` para as verificações CLI Azure depois. Os endpoints mostrados são demonstrações e requerem controlos de acesso apropriados antes do uso público.

```bash
# Initialize AZD environment
azd init

# Deploy infrastructure and application
azd up

# Get the app URL
APP_URL=$(azd env get-value APP_URL)

# Test health check
curl $APP_URL/health
```

**✅ Saída esperada:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Teste de carga do blob:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Saída esperada:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Teste de listagem de containers:**
```bash
curl $APP_URL/containers
```

**✅ Saída esperada:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Funções Comuns RBAC Azure

### IDs de Função Incorporados para Identidade Gerida

| Serviço | Nome da Função | ID da Função | Permissões |
|---------|--------|---------|-------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6ea1-4ae2-8e65-a410df84e7d1` | Ler blobs e containers |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Ler, escrever, apagar blobs |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Ler, escrever, apagar filas/mensagens |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Ler segredos |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Ler, escrever, apagar segredos |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Ler dados Cosmos DB |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Ler, escrever dados Cosmos DB |
| **SQL Database** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | Gerir recursos de base de dados; não concede acesso a dados SQL |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Enviar, receber, gerir mensagens |

### Como Obter IDs de Função

Os dois IDs acima do Cosmos DB para NoSQL são **definições nativas de função do plano de dados Cosmos**, não IDs de função RBAC da subscrição Azure. Atribua-os com `az cosmosdb sql role assignment create` (ou `Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments`), não com `az role assignment create`. O acesso a dados SQL requer um utilizador de base dados Entra e permissões SQL.

```bash
# List all built-in roles
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Search for specific role
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Get role details
az role definition list --name "Storage Blob Data Contributor"
```

---

## Exercícios Práticos

**Pré-requisitos de integração para os três exercícios:** um template Container App funcional no seu próprio projeto, recursos Bicep correspondentes, autenticação Azure CLI/azd, e autoridade para atribuir as funções necessárias. Estas são adaptações guiadas, não pontos de partida locais independentes; substitua os nomes dos recursos de exemplo pelos seus nomes implantados.

### Exercício 1: Ativar Identidade Gerida para App Existente ⭐⭐ (Médio)

**Objetivo**: Adicionar identidade gerida a uma implantação Container App existente

**Cenário**: Tem um Container App usando cadeias de conexão. Converta para identidade gerida.

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

1. **Ativar identidade gerida no Bicep:**

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

**Antes (cadeia de conexão):**
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

5. **Implantar e testar:**

```bash
# Redeploy
azd up

# Test that it still works
APP_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail -X POST "$APP_URL/upload"
```

**✅ Critérios de Sucesso:**
- ✅ Aplicação implanta sem erros
- ✅ Operações de storage funcionam (carregar, listar, descarregar)
- ✅ Sem cadeias de conexão nas variáveis de ambiente
- ✅ Identidade visível no Portal Azure na página "Identidade"

**Verificação:**

```bash
# Check managed identity is enabled
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Expected: "SystemAssigned"

# Check role assignment
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Expected: Shows "Storage Blob Data Contributor" role
```

**Tempo**: 20-30 minutos

---

### Exercício 2: Acesso Multi-Serviço com Identidade User-Assigned ⭐⭐⭐ (Avançado)

**Objetivo**: Criar uma identidade user-assigned partilhada por múltiplos Container Apps

**Cenário**: Tem 3 microsserviços que precisam todos de acesso à mesma conta Storage e Key Vault.

**Passos**:

1. **Criar identidade user-assigned:**

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

2. **Atribuir funções à identidade user-assigned:**

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
  name: guid(storageAccount.id, environmentName, 'storage-contributor')
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}

// Grant Key Vault access
resource kvRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, environmentName, 'kv-secrets-user')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **Atribuir identidade a múltiplas Container Apps:**

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
const { ManagedIdentityCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

// For user-assigned identity, specify the client ID
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // User-assigned identity client ID
);

// Alternative (choose ONE credential declaration):
// const { DefaultAzureCredential } = require('@azure/identity');
// const credential = new DefaultAzureCredential({
//   managedIdentityClientId: process.env.AZURE_CLIENT_ID
// });

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

Defina o runtime `AZURE_CLIENT_ID` de cada Container App para `userIdentity.outputs.clientId` e `STORAGE_ACCOUNT_NAME` para o seu nome de armazenamento no Bicep. Apenas atribuir a identidade ou executar `azd env set` não configura estes valores de runtime.

5. **Desenvolver e verificar:**

```bash
azd up

# Test all services can access storage
# Replace with the actual ingress URLs reported for your three services
curl --fail -X POST "$API_GATEWAY_URL/upload"
curl --fail -X POST "$PRODUCT_SERVICE_URL/upload"
curl --fail -X POST "$ORDER_SERVICE_URL/upload"
```

**✅ Critérios de Sucesso:**
- ✅ Uma identidade partilhada por 3 serviços
- ✅ Todos os serviços conseguem aceder ao Storage e Key Vault
- ✅ A identidade persiste se eliminar um serviço
- ✅ Gestão centralizada de permissões

**Vantagens da Identidade Atribuída pelo Utilizador:**
- Identidade única para gerir
- Permissões consistentes através dos serviços
- Sobrevive à eliminação do serviço
- Melhor para arquiteturas complexas

**Tempo**: 30-40 minutos

---

### Exercício 3: Implementar Rotação de Segredos do Key Vault ⭐⭐⭐ (Avançado)

**Objetivo**: Armazenar chaves de API de terceiros no Key Vault e aceder a elas usando a identidade gerida

**Cenário**: A sua aplicação precisa de chamar uma API externa (OpenAI, Stripe, SendGrid) que requer chaves de API.

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
# Get Key Vault name
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

# Store third-party API keys
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
    // Check cache first
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

Este **fragmento de aplicação substituto** necessita de `npm install openai`, de uma chave real de terceiros, de um modelo acessível e da infraestrututura do seu projeto funcional. Chama diretamente o OpenAI, e não um serviço Azure OpenAI. As chaves fictícias abaixo não autorizam nenhum pedido.

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Initialize OpenAI with key from Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

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

// Start listening only after initialization succeeds.
initializeServices().then(() => {
  app.listen(3000, () => console.log('Key Vault demo running'));
}).catch(error => {
  console.error('Initialization failed:', error.message);
  process.exitCode = 1;
});
```

5. **Desenvolver e testar:**

```bash
azd up

# Test that API keys work
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Critérios de Sucesso:**
- ✅ Nenhuma chave de API no código ou variáveis de ambiente
- ✅ A aplicação recupera chaves do Key Vault
- ✅ APIs de terceiros funcionam corretamente
- ✅ Pode rodar as chaves sem alterar o código

**Rodar um segredo:**

```bash
# Update secret in Key Vault
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# Find the active revision name, then restart it to clear the in-process cache
az containerapp revision list --name myapp --resource-group rg-myapp --output table
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp \
  --revision "<active-revision-name>"
```

**Tempo**: 25-35 minutos

---

## Ponto de Verificação de Conhecimento

### 1. Padrões de Autenticação ✓

Teste o seu conhecimento:

- [ ] **P1**: Quais são os três principais padrões de autenticação? 
  - **R**: Strings de conexão (legado), Referências do Key Vault (transição), Identidade Gerida (melhor)

- [ ] **P2**: Porque é que a identidade gerida é melhor do que strings de conexão?
  - **R**: Sem segredos no código, rotação automática, histórico completo de auditoria, permissões RBAC

- [ ] **P3**: Quando usaria identidade atribuída pelo utilizador em vez de sistema-atribuída?
  - **R**: Quando partilhar identidade entre vários recursos ou quando o ciclo de vida da identidade é independente do ciclo de vida do recurso

**Verificação Prática:**
```bash
# Check what type of identity your app uses
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# List all role assignments for the identity
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC e Permissões ✓

Teste o seu conhecimento:

- [ ] **P1**: Qual é o ID do papel "Storage Blob Data Contributor"?
  - **R**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **P2**: Que permissões fornece o "Key Vault Secrets User"?
  - **R**: Acesso somente leitura aos segredos (não pode criar, atualizar ou apagar)

- [ ] **P3**: Como concede acesso à Azure SQL a uma Container App?
  - **R**: Configure autenticação Microsoft Entra, crie a identidade como utilizador da base de dados e conceda as permissões SQL necessárias. "SQL DB Contributor" apenas gere recursos Azure; não autoriza consultas.

**Verificação Prática:**
```bash
# Find specific role
az role definition list --name "Storage Blob Data Contributor"

# Check what roles are assigned to your identity
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Integração com Key Vault ✓

Teste o seu conhecimento:

- [ ] **P1**: Como ativa o RBAC para o Key Vault em vez das políticas de acesso?
  - **R**: Defina `enableRbacAuthorization: true` no Bicep

- [ ] **P2**: Que biblioteca do SDK Azure lida com autenticação de identidade gerida?
  - **R**: `@azure/identity` com a classe `DefaultAzureCredential`

- [ ] **P3**: Quanto tempo permanecem os segredos do Key Vault em cache?
  - **R**: Depende da aplicação; implemente a sua própria estratégia de cache

**Verificação Prática:**
```bash
# Test Key Vault access
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "{name:name,enabled:attributes.enabled}"

# Check RBAC is enabled
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Expected: true
```

---

## Melhores Práticas de Segurança

### ✅ FAZER:

1. **Usar sempre identidade gerida em produção**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Usar papéis RBAC com o mínimo de privilégios**
   - Usar papéis "Reader" sempre que possível
   - Evitar "Owner" ou "Contributor" salvo se necessário

3. **Armazenar chaves de terceiros no Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Ativar auditoria de logs** (fragmento parcial de recurso; junte com as suas declarações de vault e espaço de trabalho)
   ```bicep
   resource vaultDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
     name: 'vault-audit'
     scope: keyVault
     properties: {
       workspaceId: logAnalytics.id
       logs: [{ category: 'AuditEvent', enabled: true }]
     }
   }
   ```

5. **Usar identidades diferentes para dev/staging/prod**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rodar segredos regularmente**
   - Definir datas de expiração nos segredos do Key Vault
   - Automatizar rotação com Azure Functions

### ❌ NÃO FAZER:

1. **Nunca codificar segredos diretamente**
   ```javascript
   // ❌ BAD
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Não usar strings de conexão em produção**
   ```javascript
   // ❌ BAD
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Não conceder permissões excessivas**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8e3af657-a8ff-443c-a75c-2fe8c4bcb635')
   
   // ✅ GOOD - least privilege
   roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '2a2b9908-6ea1-4ae2-8e65-a410df84e7d1')
   ```

4. **Não registar segredos em logs**
   ```javascript
   // ❌ BAD
   console.log('API Key:', apiKey);
   
   // ✅ GOOD
   console.log('API Key retrieved successfully');
   ```

5. **Não partilhar identidades de produção entre ambientes**
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
# Check if managed identity is enabled
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Expected: "SystemAssigned" or "UserAssigned"

# Check role assignments
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Expected: Should see "Storage Blob Data Contributor" or similar role
```

**Soluções:**

1. **Conceder papel RBAC correto:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Aguarde a propagação (pode levar 5-10 minutos):**
```bash
# Check role assignment status
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Verifique se o código da aplicação usa a credencial correta:**
```javascript
// Make sure you're using DefaultAzureCredential
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
# Check Key Vault RBAC is enabled
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Expected: true

# Check role assignments
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Soluções:**

1. **Ativar RBAC no Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Conceder papel Key Vault Secrets User:**
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
# Check if you're logged in
az account show

# Check Azure CLI authentication
az ad signed-in-user show
```

**Soluções:**

1. **Login no Azure CLI:**
```bash
az login
```

2. **Definir subscrição Azure:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Para desenvolvimento local, use variáveis de ambiente:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Ou use outra credencial localmente:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Use AzureCliCredential for local dev
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problema: Atribuição de papel demora a propagar

**Sintomas:**
- Papel atribuído com sucesso
- Continua a receber erros 403
- Acesso intermitente (às vezes funciona, às vezes não)

**Explicação:**
As alterações do RBAC do Azure podem demorar de 5 a 10 minutos a propagar globalmente.

**Solução:**

```bash
# Wait and retry
echo "Waiting for RBAC propagation..."
sleep 300  # Wait 5 minutes

# Test access
curl --fail -X POST "$APP_URL/upload"

# If still failing, restart the app
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp \
  --revision "<active-revision-name>"
```

---

## Considerações de Custo

### Custos de Identidade Gerida

| Recurso | Custo |
|----------|------|
| **Identidade Gerida** | 🆓 **GRÁTIS** - Sem custo |
| **Atribuições de Papéis RBAC** | 🆓 **GRÁTIS** - Sem custo |
| **Pedidos de Token Microsoft Entra ID** | 🆓 **GRÁTIS** - Incluído |
| **Operações Key Vault** | $0,03 por 10.000 operações |
| **Armazenamento de segredo do Key Vault** | Verifique preços atuais; não presuma uma taxa mensal por segredo |

**A identidade gerida poupa dinheiro ao:**
- ✅ Eliminar operações do Key Vault para autenticação serviço-a-serviço
- ✅ Reduzir incidentes de segurança (sem credenciais expostas)
- ✅ Diminuir sobrecarga operacional (sem rotação manual)

O número de pedidos da aplicação não é igual ao número de operações do Key Vault: padrões de cache e rotação determinam o custo da leitura de segredos. A identidade não elimina custos de computação/armazenamento. Verifique [preços do Key Vault](https://azure.microsoft.com/pricing/details/key-vault/) e a Calculadora de Preços Azure para a sua região em vez de deduzir poupanças mensais só pelos pedidos.

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
- → Seguinte: [Infraestrutura como Código](../chapter-04-infrastructure/README.md)
- 🏠 [Página Principal do Curso](../../README.md)

### Exemplos Relacionados
- [Exemplo Chat Microsoft Foundry Models](../../../../examples/azure-openai-chat) - Usa identidade gerida para Microsoft Foundry Models
- [Exemplo Microserviços](../../../../examples/microservices) - Padrões de autenticação multi-serviço

---

## Resumo

**Aprendeu:**
- ✅ Três padrões de autenticação (strings de conexão, Key Vault, identidade gerida)
- ✅ Como ativar e configurar identidade gerida no AZD
- ✅ Atribuições de papéis RBAC para serviços Azure
- ✅ Integração do Key Vault para segredos de terceiros
- ✅ Identidades atribuídas pelo utilizador vs sistema-atribuídas
- ✅ Melhores práticas de segurança e resolução de problemas

**Conclusões-Chave:**
1. **Usar sempre identidade gerida em produção** - Zero segredos, rotação automática
2. **Usar papéis RBAC com o mínimo de privilégios** - Conceder apenas permissões necessárias
3. **Armazenar chaves de terceiros no Key Vault** - Gestão centralizada de segredos
4. **Separar identidades por ambiente** - Isolamento dev, staging, prod
5. **Ativar auditoria de logs** - Rastrear quem acedeu a quê

**Próximos Passos:**
1. Complete os exercícios práticos acima
2. Migre uma aplicação existente de strings de conexão para identidade gerida
3. Reveja o fluxo de implantação para iniciantes: [Primeiro Projeto](../chapter-01-foundation/first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->