# Integração do Microsoft Foundry com o AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para Iniciantes](../../README.md)
- **📖 Current Chapter**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Previous Chapter**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Overview

Este guia demonstra como integrar os serviços do Microsoft Foundry com o Azure Developer CLI (AZD) para implantações de aplicações de IA mais eficientes. O Microsoft Foundry fornece uma plataforma abrangente para construir, implantar e gerenciar aplicações de IA, enquanto o AZD simplifica o processo de infraestrutura e implantação.

## O que é o Microsoft Foundry?

O Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Catálogo de Modelos**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **Portal AI Foundry**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Opções de Implantação**: Múltiplas opções de hospedagem e escalonamento
- **Segurança e Proteção**: Recursos integrados de IA responsável

## AZD + Microsoft Foundry: Melhor Juntos

| Recurso | Microsoft Foundry | Benefício da Integração com o AZD |
|---------|-----------------|------------------------|
| **Implantação de Modelos** | Implantação manual via portal | Implantações automatizadas e repetíveis |
| **Infraestrutura** | Provisionamento por clique | Infraestrutura como Código (Bicep) |
| **Gerenciamento de Ambiente** | Foco em um único ambiente | Multi-ambiente (dev/staging/prod) |
| **Integração CI/CD** | Limitada | Suporte nativo ao GitHub Actions |
| **Gerenciamento de Custos** | Monitoramento básico | Otimização de custos por ambiente |

## Pré-requisitos

- Assinatura do Azure com permissões apropriadas
- Azure Developer CLI instalado
- Acesso aos serviços Azure OpenAI
- Familiaridade básica com o Microsoft Foundry

## Padrões de Integração Principais

### Padrão 1: Integração com Azure OpenAI

**Caso de Uso**: Implantar aplicações de chat com modelos Azure OpenAI

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infraestrutura (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Padrão 2: AI Search + Integração RAG

**Caso de Uso**: Implantar aplicações de geração aumentada por recuperação (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Padrão 3: Integração com Document Intelligence

**Caso de Uso**: Fluxos de trabalho de processamento e análise de documentos

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Padrões de Configuração

### Configuração de Variáveis de Ambiente

**Configuração de Produção:**
```bash
# Serviços principais de IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurações do modelo
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Configurações de desempenho
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuração de Desenvolvimento:**
```bash
# Configurações otimizadas para reduzir custos durante o desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Camada gratuita
```

### Configuração Segura com Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Fluxos de Implantação

### Implantação com Comando Único

```bash
# Implante tudo com um comando
azd up

# Ou implante incrementalmente
azd provision  # Somente infraestrutura
azd deploy     # Somente aplicação
```

### Implantações Específicas por Ambiente

```bash
# Ambiente de desenvolvimento
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Ambiente de produção
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoramento e Observabilidade

### Integração com Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Monitoramento de Custos

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Melhores Práticas de Segurança

### Configuração de Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Segurança de Rede

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Otimização de Desempenho

### Estratégias de Cache

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Configuração de Auto-scaling

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Solução de Problemas Comuns

### Problema 1: Cota do OpenAI Excedida

**Sintomas:**
- Implantação falha com erros de cota
- Erros 429 nos logs da aplicação

**Soluções:**
```bash
# Verificar o uso atual da cota
az cognitiveservices usage list --location eastus

# Tentar outra região
azd env set AZURE_LOCATION westus2
azd up

# Reduzir a capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Falhas de Autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços de IA
- Mensagens "Acesso negado"

**Soluções:**
```bash
# Verificar atribuições de função
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificar configuração da identidade gerenciada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acesso ao Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas na Implantação de Modelos

**Sintomas:**
- Modelos não disponíveis na implantação
- Versões específicas dos modelos falhando

**Soluções:**
```bash
# Listar modelos disponíveis por região
az cognitiveservices model list --location eastus

# Atualizar a versão do modelo no template Bicep
# Verificar requisitos de capacidade do modelo
```

## Modelos de Exemplo

### Aplicação Básica de Chat

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Cognitive Search + App Service

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline de Processamento de Documentos

**Repositório**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Serviços**: Document Intelligence + Storage + Functions

**Início Rápido**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Corporativo com RAG

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Início Rápido**:
```bash
azd init --template contoso-chat
azd up
```

## Próximos Passos

1. **Experimente os Exemplos**: Comece com um template pré-construído que corresponda ao seu caso de uso
2. **Customize para Suas Necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione Monitoramento**: Implemente observabilidade abrangente
4. **Otimize Custos**: Ajuste configurações para seu orçamento
5. **Proteja Sua Implantação**: Implemente padrões de segurança empresarial
6. **Escale para Produção**: Adicione recursos multi-região e alta disponibilidade

## 🎯 Exercícios Práticos

### Exercício 1: Implantar Aplicação de Chat Azure OpenAI (30 minutos)
**Objetivo**: Implantar e testar uma aplicação de chat de IA pronta para produção

```bash
# Inicializar o template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Definir variáveis de ambiente
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implantar
azd up

# Testar a aplicação
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorar operações de IA
azd monitor

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Implantação concluída sem erros de cota
- [ ] Acesso à interface de chat pelo navegador
- [ ] É possível fazer perguntas e obter respostas com suporte de IA
- [ ] Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso

**Custo Estimado**: $5-10 para 30 minutos de testes

### Exercício 2: Configurar Implantação Multi-Modelo (45 minutos)
**Objetivo**: Implantar múltiplos modelos de IA com diferentes configurações

```bash
# Criar configuração Bicep personalizada
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Implantar e verificar
azd provision
azd show
```

**Critérios de Sucesso:**
- [ ] Múltiplos modelos implantados com sucesso
- [ ] Diferentes configurações de capacidade aplicadas
- [ ] Modelos acessíveis via API
- [ ] É possível chamar ambos os modelos a partir da aplicação

### Exercício 3: Implementar Monitoramento de Custos (20 minutos)
**Objetivo**: Configurar alertas de orçamento e rastreamento de custos

```bash
# Adicionar alerta de orçamento ao Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Implantar alerta de orçamento
azd provision

# Verificar custos atuais
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Critérios de Sucesso:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por e-mail configuradas
- [ ] É possível visualizar dados de custo no Azure Portal
- [ ] Limiares de orçamento definidos adequadamente

## 💡 Perguntas Frequentes

<details>
<summary><strong>Como reduzir custos do Azure OpenAI durante o desenvolvimento?</strong></summary>

1. **Use a Camada Gratuita**: Azure OpenAI oferece 50.000 tokens/mês gratuitamente
2. **Reduza a Capacidade**: Defina capacidade para 10 TPM em vez de 30+ para desenvolvimento
3. **Use azd down**: Desaloque recursos quando não estiver desenvolvendo ativamente
4. **Cacheie Respostas**: Implemente Redis para cache de consultas repetidas
5. **Use Engenharia de Prompts**: Reduza o uso de tokens com prompts eficientes

```bash
# Configuração de desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual é a diferença entre o Azure OpenAI e a API OpenAI?</strong></summary>

**Azure OpenAI**:
- Segurança e conformidade empresarial
- Integração com rede privada
- Garantias de SLA
- Autenticação com Managed Identity
- Cotas mais altas disponíveis

**OpenAI API**:
- Acesso mais rápido a novos modelos
- Configuração mais simples
- Menor barreira de entrada
- Apenas via internet pública

Para aplicações em produção, **recomenda-se o Azure OpenAI**.
</details>

<details>
<summary><strong>Como lidar com erros de cota excedida do Azure OpenAI?</strong></summary>

```bash
# Verificar cota atual
az cognitiveservices usage list --location eastus2

# Tentar outra região
azd env set AZURE_LOCATION westus2
azd up

# Reduzir capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitar aumento de cota
# Vá para o Portal do Azure > Cotas > Solicitar aumento
```
</details>

<details>
<summary><strong>Posso usar meus próprios dados com o Azure OpenAI?</strong></summary>

Sim! Use o **Azure AI Search** para RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Veja o template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Como garantir a segurança dos endpoints de modelos de IA?</strong></summary>

**Melhores Práticas**:
1. Use Managed Identity (sem chaves de API)
2. Habilite Private Endpoints
3. Configure grupos de segurança de rede
4. Implemente limitação de taxa
5. Use o Azure Key Vault para segredos

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Comunidade e Suporte

- **Microsoft Foundry Discord**: [canal #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues e discussões](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para Iniciantes](../../README.md)
- **📖 Current Chapter**: Capítulo 2 - Desenvolvimento com Foco em IA
- **⬅️ Previous Chapter**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de ajuda?** Participe das discussões da comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para ajudar você a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->