# Integração do Microsoft Foundry com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento orientado a IA
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão geral

Este guia demonstra como integrar os serviços do Microsoft Foundry com o Azure Developer CLI (AZD) para implantações de aplicações de IA mais ágeis. O Microsoft Foundry fornece uma plataforma abrangente para construir, implantar e gerenciar aplicações de IA, enquanto o AZD simplifica o processo de infraestrutura e implantação.

## O que é o Microsoft Foundry?

O Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Catálogo de Modelos**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **Microsoft Foundry Portal**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Opções de Implantação**: Múltiplas opções de hospedagem e escalonamento
- **Segurança e Conformidade**: Recursos integrados de IA responsável

## AZD + Microsoft Foundry: Melhor juntos

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Implantação manual pelo portal | Implantações automatizadas e repetíveis |
| **Infrastructure** | Provisionamento por clique | Infraestrutura como Código (Bicep) |
| **Environment Management** | Foco em ambiente único | Multi-ambiente (dev/staging/prod) |
| **CI/CD Integration** | Limitado | Suporte nativo ao GitHub Actions |
| **Cost Management** | Monitoramento básico | Otimização de custos específica por ambiente |

## Pré-requisitos

- Assinatura do Azure com permissões apropriadas
- Azure Developer CLI instalado
- Acesso aos serviços Microsoft Foundry Models
- Familiaridade básica com Microsoft Foundry

## Padrões principais de integração

### Padrão 1: Integração com Microsoft Foundry Models

**Caso de uso**: Implantar aplicações de chat com modelos Microsoft Foundry Models

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
// Microsoft Foundry Models Account
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

**Caso de uso**: Implantar aplicações de geração aumentada por recuperação (RAG)

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

**Caso de uso**: Fluxos de trabalho de processamento e análise de documentos

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

## 🔧 Padrões de configuração

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
# Configurações para desenvolvimento otimizadas para custo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Plano gratuito
```

### Configuração segura com Key Vault

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

## Fluxos de implantação

### Extensões AZD para o Foundry

O AZD fornece extensões que adicionam capacidades específicas de IA para trabalhar com os serviços do Microsoft Foundry:

```bash
# Instalar a extensão Foundry agents
azd extension install azure.ai.agents

# Instalar a extensão de ajuste fino
azd extension install azure.ai.finetune

# Instalar a extensão de modelos personalizados
azd extension install azure.ai.models

# Listar extensões instaladas
azd extension list
```

### Implantação orientada a agente com `azd ai`

Se você tiver um manifesto de agente, use `azd ai agent init` para scaffoldar um projeto integrado ao Foundry Agent Service:

```bash
# Inicializar a partir de um manifesto de agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Implantar no Azure
azd up
```

Consulte [Comandos da CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para a referência completa de comandos e flags.

### Implantação com um único comando

```bash
# Implante tudo com um comando
azd up

# Ou implante incrementalmente
azd provision  # Apenas infraestrutura
azd deploy     # Apenas aplicação
```

### Implantações específicas por ambiente

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

### Monitoramento de custos

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

## 🔐 Melhores práticas de segurança

### Configuração de Identidade Gerenciada

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

### Segurança de rede

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

## Otimização de desempenho

### Estratégias de cache

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

### Configuração de autoescalonamento

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

## Solução de problemas comuns

### Problema 1: Cota do OpenAI excedida

**Sintomas:**
- Implantação falha com erros de cota
- Erros 429 nos logs da aplicação

**Soluções:**
```bash
# Verificar uso atual da cota
az cognitiveservices usage list --location eastus

# Tentar outra região
azd env set AZURE_LOCATION westus2
azd up

# Reduzir capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Falhas de autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços de IA
- Mensagens "Acesso negado"

**Soluções:**
```bash
# Verificar atribuições de função
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificar a configuração da identidade gerenciada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acesso ao Cofre de Chaves
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas de implantação de modelo

**Sintomas:**
- Modelos não disponíveis na implantação
- Versões específicas de modelos falhando

**Soluções:**
```bash
# Listar modelos disponíveis por região
az cognitiveservices model list --location eastus

# Atualizar versão do modelo no template bicep
# Verificar requisitos de capacidade do modelo
```

## Modelos de exemplo

### Aplicação RAG Chat (Python)

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrição**: O sample de IA do Azure mais popular — um aplicativo RAG de chat pronto para produção que permite fazer perguntas sobre seus próprios documentos. Usa GPT-4.1-mini para chat, text-embedding-ada-002 para embeddings e Azure AI Search para recuperação. Suporta documentos multimodais, entrada/saída de voz, autenticação Microsoft Entra e rastreamento com Application Insights.

**Início rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicação RAG Chat (.NET)

**Repositório**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrição**: O equivalente .NET/C# do sample RAG chat em Python. Construído com ASP.NET Core Minimal API e frontend Blazor WebAssembly. Inclui chat por voz, suporte GPT-4o-mini vision e um cliente desktop/mobile .NET MAUI Blazor Hybrid acompanhante.

**Início rápido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicação RAG Chat (Java)

**Repositório**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrição**: Versão Java do sample RAG chat usando Langchain4J para orquestração de IA. Suporta arquitetura de microsserviços orientada a eventos, múltiplas estratégias de busca (texto, vetor, híbrida), upload de documentos com Azure Document Intelligence e implantação em Azure Container Apps ou Azure Kubernetes Service.

**Início rápido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copiloto de Varejo Empresarial com Azure AI Foundry

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrição**: Copiloto RAG de varejo de ponta a ponta usando Azure AI Foundry e Prompty. Um chatbot para a Contoso Outdoor que fundamenta respostas no catálogo de produtos e nos dados de pedidos dos clientes. Demonstra o fluxo completo de GenAIOps — prototipar com Prompty, avaliar com avaliadores assistidos por IA e implantar via AZD para Container Apps.

**Início rápido**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicação Multi-Agente para Escrita Criativa

**Repositório**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Serviços**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrição**: Sample multi-agente demonstrando orquestração de agentes de IA com Prompty. Usa um agente de pesquisa (Bing Grounding no Azure AI Agent Service), um agente de produto (Azure AI Search), um agente escritor e um agente editor para produzir colaborativamente artigos bem pesquisados. Inclui CI/CD com avaliação no GitHub Actions.

**Início rápido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG Chat Serverless (JavaScript/TypeScript)

**Repositório**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Serviços**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descrição**: Chatbot RAG totalmente serverless usando LangChain.js com Azure Functions para a API e Azure Static Web Apps para hospedagem. Usa Azure Cosmos DB como armazenamento vetorial e banco de histórico de chat. Suporta desenvolvimento local com Ollama para testes sem custo.

**Início rápido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat com Seu Conjunto de Dados - Solution Accelerator

**Repositório**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Serviços**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descrição**: Acelerador de solução RAG de nível empresarial com portal administrativo para upload/gestão de documentos, múltiplas opções de orquestração (Semantic Kernel, LangChain, Prompt Flow), conversão de fala para texto, integração com Microsoft Teams e escolha de backend PostgreSQL ou Cosmos DB. Projetado como ponto de partida customizável para cenários RAG de produção.

**Início rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agentes de Viagem com Orquestração Multi-Agente MCP

**Repositório**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Serviços**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descrição**: Aplicação de referência para orquestração de IA multi-agente usando três frameworks (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Conta com servidores MCP (Model Context Protocol) em quatro linguagens implantados como Azure Container Apps serverless com monitoramento OpenTelemetry.

**Início rápido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositório**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Serviços**: Azure AI Services + Azure OpenAI

**Descrição**: Template Bicep minimalista que provisiona serviços Azure AI com modelos de machine learning configurados. Um ponto de partida leve quando você precisa apenas da infraestrutura Azure AI provisionada sem uma stack de aplicação completa.

**Início rápido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## Próximos passos

1. **Experimente os exemplos**: Comece com um template pré-construído que corresponda ao seu caso de uso
2. **Customize conforme suas necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione monitoramento**: Implemente observabilidade abrangente
4. **Otimize custos**: Ajuste as configurações para seu orçamento
5. **Proteja sua implantação**: Implemente padrões de segurança corporativa
6. **Escale para produção**: Adicione recursos multi-região e de alta disponibilidade

## 🎯 Exercícios práticos

### Exercício 1: Implantar o App de Chat com Microsoft Foundry Models (30 minutos)
**Objetivo**: Implantar e testar uma aplicação de chat de IA pronta para produção

```bash
# Inicializar modelo
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

**Critérios de sucesso:**
- [ ] Implantação concluída sem erros de cota
- [ ] É possível acessar a interface de chat no navegador
- [ ] É possível fazer perguntas e obter respostas com IA
- [ ] Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso

**Custo estimado**: $5-10 para 30 minutos de teste

### Exercício 2: Configurar Implantação Multi-Modelo (45 minutos)
**Objetivo**: Implantar múltiplos modelos de IA com configurações diferentes

```bash
# Criar configuração Bicep personalizada
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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

**Critérios de sucesso:**
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

**Critérios de sucesso:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por e-mail configuradas
- [ ] É possível visualizar dados de custo no Portal do Azure
- [ ] Limiares de orçamento configurados adequadamente

## 💡 Perguntas frequentes

<details>
<summary><strong>Como reduzo os custos do Microsoft Foundry Models durante o desenvolvimento?</strong></summary>

1. **Use a camada gratuita**: O Microsoft Foundry Models oferece 50.000 tokens/mês gratuitos
2. **Reduza a capacidade**: Defina a capacidade para 10 TPM em vez de 30+ para dev
3. **Use azd down**: Desalocar recursos quando não estiver desenvolvendo ativamente
4. **Cache de respostas**: Implemente cache Redis para consultas repetidas
5. **Use engenharia de prompt**: Reduza o uso de tokens com prompts eficientes

```bash
# Configuração de desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual é a diferença entre Microsoft Foundry Models e a API do OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Segurança empresarial e conformidade
- Integração com rede privada
- Garantias de SLA
- Autenticação por identidade gerenciada
- Cotias mais altas disponíveis

**OpenAI API**:
- Acesso mais rápido a novos modelos
- Configuração mais simples
- Menor barreira de entrada
- Apenas internet pública

Para aplicações em produção, **Microsoft Foundry Models é recomendado**.
</details>

<details>
<summary><strong>Como devo lidar com erros de cota excedida do Microsoft Foundry Models?</strong></summary>

```bash
# Verifique a cota atual
az cognitiveservices usage list --location eastus2

# Tente outra região
azd env set AZURE_LOCATION westus2
azd up

# Reduza a capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicite aumento de cota
# Vá para o Portal do Azure > Cotas > Solicitar aumento
```
</details>

<details>
<summary><strong>Posso usar meus próprios dados com o Microsoft Foundry Models?</strong></summary>

Sim! Use o **Azure AI Search** para RAG (Geração Aumentada por Recuperação):

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
<summary><strong>Como protejo endpoints de modelos de IA?</strong></summary>

**Melhores Práticas**:
1. Use Managed Identity (sem chaves de API)
2. Habilite Private Endpoints
3. Configure network security groups
4. Implemente rate limiting
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

- **Discord do Microsoft Foundry**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD no GitHub**: [Issues e discussões](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instale as Agent Skills do Azure + Foundry no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Chapter 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Precisa de ajuda?** Participe das discussões da comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para ajudar você a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->