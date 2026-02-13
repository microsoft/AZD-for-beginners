# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capítulo 2 - Desenvolvimento com foco em IA
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

Este guia demonstra como integrar os serviços Microsoft Foundry com a Azure Developer CLI (AZD) para implantações de aplicações de IA simplificadas. O Microsoft Foundry fornece uma plataforma abrangente para construir, implantar e gerir aplicações de IA, enquanto o AZD simplifica o processo de infraestrutura e implantação.

## What is Microsoft Foundry?

O Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Model Catalog**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **AI Foundry Portal**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Deployment Options**: Múltiplas opções de alojamento e escalabilidade
- **Safety and Security**: Funcionalidades de IA responsável integradas

## AZD + Microsoft Foundry: Better Together

| Funcionalidade | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prerequisites

- Subscription Azure com permissões apropriadas
- Azure Developer CLI instalada
- Acesso aos serviços Azure OpenAI
- Familiaridade básica com o Microsoft Foundry

## Core Integration Patterns

### Pattern 1: Azure OpenAI Integration

**Use Case**: Implantar aplicações de chat com modelos Azure OpenAI

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

**Infrastructure (main.bicep):**
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

### Pattern 2: AI Search + RAG Integration

**Use Case**: Implementar aplicações de geração aumentada por recuperação (RAG)

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

### Pattern 3: Document Intelligence Integration

**Use Case**: Fluxos de trabalho de processamento e análise de documentos

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
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

**Development Configuration:**
```bash
# Definições otimizadas em termos de custo para desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nível gratuito
```

### Secure Configuration with Key Vault

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

## Deployment Workflows

### Single Command Deployment

```bash
# Implantar tudo com um único comando
azd up

# Ou implantar incrementalmente
azd provision  # Apenas infraestrutura
azd deploy     # Apenas a aplicação
```

### Environment-Specific Deployments

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

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- A implantação falha com erros de quota
- Erros 429 nos registos da aplicação

**Solutions:**
```bash
# Verificar a utilização atual da quota
az cognitiveservices usage list --location eastus

# Experimentar uma região diferente
azd env set AZURE_LOCATION westus2
azd up

# Reduzir a capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- Erros 401/403 ao chamar serviços de IA
- Mensagens de "Access denied"

**Solutions:**
```bash
# Verificar atribuições de funções
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificar configuração da identidade gerida
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acesso ao Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- Modelos não disponíveis na implantação
- Versões específicas de modelos a falhar

**Solutions:**
```bash
# Listar modelos disponíveis por região
az cognitiveservices model list --location eastus

# Atualizar a versão do modelo no template Bicep
# Verificar requisitos de capacidade do modelo
```

## Example Templates

### Basic Chat Application

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Cognitive Search + App Service

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Document Processing Pipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Services**: Document Intelligence + Storage + Functions

**Quick Start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat with RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

## Next Steps

1. **Try the Examples**: Comece com um template pré-construído que corresponda ao seu caso de uso
2. **Customize for Your Needs**: Modifique a infraestrutura e o código da aplicação
3. **Add Monitoring**: Implemente observabilidade abrangente
4. **Optimize Costs**: Ajuste as configurações conforme o seu orçamento
5. **Secure Your Deployment**: Implemente padrões de segurança empresariais
6. **Scale to Production**: Adicione funcionalidades multi-região e alta disponibilidade

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Azure OpenAI Chat App (30 minutes)
**Goal**: Implantar e testar uma aplicação de chat de IA pronta para produção

```bash
# Inicializar modelo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Definir variáveis de ambiente
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implementar
azd up

# Testar a aplicação
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorizar operações de IA
azd monitor

# Limpar
azd down --force --purge
```

**Success Criteria:**
- [ ] A implantação conclui-se sem erros de quota
- [ ] É possível aceder à interface de chat no navegador
- [ ] É possível colocar perguntas e obter respostas com IA
- [ ] O Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso

**Estimated Cost**: $5-10 por 30 minutos de teste

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: Implantar múltiplos modelos de IA com diferentes configurações

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

**Success Criteria:**
- [ ] Vários modelos implantados com sucesso
- [ ] Diferentes definições de capacidade aplicadas
- [ ] Modelos acessíveis via API
- [ ] É possível chamar ambos os modelos a partir da aplicação

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: Configurar alertas de orçamento e acompanhamento de custos

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

**Success Criteria:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por email configuradas
- [ ] É possível ver dados de custos no Azure Portal
- [ ] Limiares de orçamento definidos adequadamente

## 💡 Frequently Asked Questions

<details>
<summary><strong>Como reduzo os custos do Azure OpenAI durante o desenvolvimento?</strong></summary>

1. **Use Free Tier**: O Azure OpenAI oferece 50 000 tokens/mês gratuitos
2. **Reduce Capacity**: Defina a capacidade para 10 TPM em vez de 30+ para dev
3. **Use azd down**: Desaloque recursos quando não estiver a desenvolver ativamente
4. **Cache Responses**: Implemente cache Redis para queries repetidas
5. **Use Prompt Engineering**: Reduza o uso de tokens com prompts eficientes

```bash
# Configuração de desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual é a diferença entre Azure OpenAI e OpenAI API?</strong></summary>

**Azure OpenAI**:
- Segurança empresarial e conformidade
- Integração com rede privada
- Garantias de SLA
- Autenticação por identidade gerida
- Quotas mais elevadas disponíveis

**OpenAI API**:
- Acesso mais rápido a novos modelos
- Configuração mais simples
- Barreiras de entrada mais baixas
- Apenas internet pública

Para aplicações de produção, **recomenda-se o Azure OpenAI**.
</details>

<details>
<summary><strong>Como lido com erros de quota excedida do Azure OpenAI?</strong></summary>

```bash
# Verificar quota atual
az cognitiveservices usage list --location eastus2

# Tentar outra região
azd env set AZURE_LOCATION westus2
azd up

# Reduzir a capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitar aumento de quota
# Ir para o Portal do Azure > Cotas > Solicitar aumento
```
</details>

<details>
<summary><strong>Posso usar os meus próprios dados com o Azure OpenAI?</strong></summary>

Sim! Use **Azure AI Search** para RAG (Geração Aumentada por Recuperação):

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
<summary><strong>Como seguro endpoints de modelos de IA?</strong></summary>

**Best Practices**:
1. Use Managed Identity (sem chaves de API)
2. Ative Private Endpoints
3. Configure grupos de segurança de rede
4. Implemente limitação de taxa
5. Utilize o Azure Key Vault para segredos

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

## Community and Support

- **Microsoft Foundry Discord**: [Canal #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capítulo 2 - Desenvolvimento com foco em IA
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Need Help?** Junte-se às discussões da comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para o ajudar a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original, na sua língua nativa, deverá ser considerado a fonte autorizada. Para informação crítica, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->