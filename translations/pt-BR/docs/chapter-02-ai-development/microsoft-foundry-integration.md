# Integração Microsoft Foundry com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Implantação de Modelo AI](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral

Este guia demonstra como integrar serviços do Microsoft Foundry com a Azure Developer CLI (AZD) para implantações simplificadas de aplicações AI. O Microsoft Foundry oferece uma plataforma abrangente para construir, implantar e gerenciar aplicações AI, enquanto o AZD simplifica o processo de infraestrutura e implantação.

## O que é o Microsoft Foundry?

Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de AI que inclui:

- **Catálogo de Modelos**: Acesso a modelos AI de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho AI
- **Portal Microsoft Foundry**: Ambiente de desenvolvimento integrado para aplicações AI
- **Opções de Implantação**: Múltiplas opções de hospedagem e escalonamento
- **Segurança e Confiabilidade**: Recursos de AI responsável integrados

## AZD + Microsoft Foundry: Melhor Juntos

| Recurso | Microsoft Foundry | Benefício da Integração AZD |
|---------|-----------------|------------------------|
| **Implantação de Modelos** | Implantação manual pelo portal | Implantações automatizadas e repetíveis |
| **Infraestrutura** | Provisionamento via cliques | Infraestrutura como Código (Bicep) |
| **Gerenciamento de Ambiente** | Foco em ambiente único | Multi-ambiente (dev/homologação/prod) |
| **Integração CI/CD** | Limitada | Suporte nativo a GitHub Actions |
| **Gerenciamento de Custos** | Monitoramento básico | Otimização de custo por ambiente |

## Pré-requisitos

- Assinatura Azure com permissões adequadas
- Azure Developer CLI instalado
- Acesso aos serviços Microsoft Foundry Models
- Familiaridade básica com Microsoft Foundry

> **Base atual do AZD:** Esses exemplos foram testados com `azd` `1.27.1`. Para o fluxo de agente AI, use a versão atual da extensão em preview e verifique sua versão instalada antes de começar.

## Padrões Essenciais de Integração

### Padrão 1: Integração Microsoft Foundry Models

**Caso de Uso**: Implantar aplicativos de chat com modelos Microsoft Foundry Models

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
```

### Padrão 2: Integração AI Search + RAG

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

### Padrão 3: Integração de Inteligência Documental

**Caso de Uso**: Processamento e análise de documentos

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

**Configuração para Produção:**
```bash
# Serviços principais de IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configurações do modelo
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Configurações de desempenho
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuração para Desenvolvimento:**
```bash
# Configurações otimizadas para custo para desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Plano gratuito
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

## Fluxos de Trabalho de Implantação

### Extensões AZD para Foundry

O AZD oferece extensões que adicionam capacidades específicas para AI ao trabalhar com serviços Microsoft Foundry:

```bash
# Instalar a extensão dos agentes Foundry
azd extension install azure.ai.agents

# Instalar a extensão de ajuste fino
azd extension install azure.ai.finetune

# Instalar a extensão de modelos personalizados
azd extension install azure.ai.models

# Listar extensões instaladas
azd extension list --installed

# Inspecionar a versão da extensão do agente atualmente instalada
azd extension show azure.ai.agents
```

As extensões AI ainda estão evoluindo rapidamente em preview. Se um comando se comportar diferente do mostrado aqui, atualize a extensão relevante antes de solucionar problemas no projeto.

### Implantação Agent-First com `azd ai`

Se você tem um manifesto de agente, use `azd ai agent init` para criar um projeto conectado ao Foundry Agent Service:

```bash
# Inicializar a partir de um manifesto de agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Implantar no Azure
azd up
```

Lançamentos de preview recentes do `azure.ai.agents` também adicionaram suporte a inicialização baseada em templates para `azd ai agent init`. Se estiver seguindo amostras mais recentes, verifique a ajuda da extensão para as flags disponíveis na sua versão instalada.

Veja [Comandos AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para referência completa de comandos e flags.

### Implantação com Comando Único

```bash
# Implante tudo com um comando
azd up

# Ou implante incrementalmente
azd provision  # Apenas infraestrutura
azd deploy     # Apenas aplicação

# Para implantações de aplicativos de IA de longa duração no azd 1.23.11+
azd deploy --timeout 1800
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

### Configuração de Autoescalonamento

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

### Problema 1: Cota OpenAI Excedida

**Sintomas:**
- A implantação falha com erros de cota
- Erros 429 nos logs da aplicação

**Soluções:**
```bash
# Verificar uso atual da cota
az cognitiveservices usage list --location eastus

# Tentar região diferente
azd env set AZURE_LOCATION westus2
azd up

# Reduzir capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Falhas de Autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços AI
- Mensagens de "Acesso negado"

**Soluções:**
```bash
# Verificar atribuições de função
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificar configuração de identidade gerenciada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acesso ao Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas na Implantação de Modelos

**Sintomas:**
- Modelos não disponíveis na implantação
- Falha em versões específicas de modelos

**Soluções:**
```bash
# Listar modelos disponíveis por região
az cognitiveservices model list --location eastus

# Atualizar versão do modelo no template bicep
# Verificar requisitos de capacidade do modelo
```

## Templates de Exemplo

### Aplicação de Chat RAG (Python)

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrição**: O exemplo Azure AI mais popular — um app de chat RAG pronto para produção que permite fazer perguntas sobre seus próprios documentos. Usa GPT-4.1-mini para chat, text-embedding-3-large para embeddings, e Azure AI Search para recuperação. Suporta documentos multimodais, entrada/saída de voz, autenticação Microsoft Entra e rastreamento com Application Insights.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicação de Chat RAG (.NET)

**Repositório**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrição**: Equivalente .NET/C# do exemplo de chat RAG em Python. Construído com ASP.NET Core Minimal API e frontend Blazor WebAssembly. Inclui chat por voz, suporte à visão GPT-4o-mini e cliente desktop/móvel híbrido .NET MAUI Blazor.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicação de Chat RAG (Java)

**Repositório**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrição**: Versão Java do exemplo de chat RAG usando Langchain4J para orquestração AI. Suporta arquitetura de microsserviços orientada a eventos, múltiplas estratégias de busca (texto, vetor, híbrida), upload de documentos com Azure Document Intelligence e implantação em Azure Container Apps ou Azure Kubernetes Service.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copiloto Varejista Empresarial com Microsoft Foundry

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrição**: Copiloto RAG completo para varejo usando Microsoft Foundry e Prompty. Chatbot varejista Contoso Outdoor que fundamenta respostas no catálogo de produtos e dados de pedidos de clientes. Demonstra o fluxo completo GenAIOps — protótipo com Prompty, avaliação com avaliadores assistidos por AI e implantação via AZD para Container Apps.

**Início Rápido**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicação Multi-Agente para Escrita Criativa

**Repositório**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Serviços**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrição**: Exemplo multi-agente demonstrando orquestração de agente AI com Prompty. Usa agente de pesquisa (Bing Grounding no Azure AI Agent Service), agente de produto (Azure AI Search), agente escritor e agente editor para produzir artigos bem pesquisados colaborativamente. Inclui CI/CD com avaliação no GitHub Actions.

**Início Rápido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositório**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Serviços**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descrição**: Chatbot RAG totalmente serverless usando LangChain.js com Azure Functions para API e Azure Static Web Apps para hospedagem. Usa Azure Cosmos DB como armazenamento vetorial e banco de histórico de chat. Suporta desenvolvimento local com Ollama para testes gratuitos.

**Início Rápido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Acelerador de Solução Chat com Seus Dados

**Repositório**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Serviços**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descrição**: Acelerador de solução RAG empresarial com portal admin para upload/gerenciamento de documentos, múltiplas opções de orquestração (Semantic Kernel, LangChain, Prompt Flow), conversão fala-texto, integração com Microsoft Teams e escolha entre backend PostgreSQL ou Cosmos DB. Projetado como ponto de partida customizável para cenários RAG em produção.

**Início Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agentes de Viagem AI — Orquestração Multi-Agente MCP

**Repositório**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Serviços**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descrição**: Aplicação de referência para orquestração multi-agente AI usando três frameworks (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Inclui servidores MCP (Model Context Protocol) em quatro linguagens implantados como Azure Container Apps serverless com monitoramento OpenTelemetry.

**Início Rápido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositório**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Serviços**: Serviços Azure AI + Azure OpenAI

**Descrição**: Template Bicep minimalista que implanta serviços Azure AI com modelos configurados de machine learning. Um ponto de partida leve quando você só precisa provisão da infraestrutura Azure AI sem uma stack completa de aplicação.

**Início Rápido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Explore mais templates**: Visite a [Galeria Awesome AZD AI Template](https://azure.github.io/awesome-azd/?tags=ai) para mais de 80 templates AZD específicos para AI em diversas linguagens e cenários.

## Próximos Passos

1. **Experimente os Exemplos**: Comece com um template pré-construído que corresponda ao seu caso de uso
2. **Customize para Suas Necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione Monitoramento**: Implemente observabilidade abrangente
4. **Otimize Custos**: Ajuste configurações para seu orçamento
5. **Garanta a Segurança da Implantação**: Implemente padrões de segurança corporativa
6. **Escale para Produção**: Adicione features multi-região e alta disponibilidade

## 🎯 Exercícios Práticos

### Exercício 1: Implantar Aplicação de Chat Microsoft Foundry Models (30 minutos)
**Objetivo**: Implantar e testar aplicação AI de chat pronta para produção

```bash
# Inicializar template
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
- [ ] Implantação completa sem erros de cota
- [ ] Acesso à interface de chat via navegador
- [ ] Capacidade de fazer perguntas e receber respostas com suporte AI
- [ ] Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso após testes

**Custo Estimado**: $5-10 para 30 minutos de teste

### Exercício 2: Configurar Implantação Multi-Modelos (45 minutos)
**Objetivo**: Implantar múltiplos modelos AI com configurações diferentes

```bash
# Criar configuração personalizada do Bicep
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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
- [ ] Vários modelos implantados com sucesso
- [ ] Configurações de capacidade diferentes aplicadas
- [ ] Modelos acessíveis via API
- [ ] Capaz de chamar ambos os modelos da aplicação

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
- [ ] Notificações por email configuradas
- [ ] Capaz de visualizar dados de custo no Portal Azure
- [ ] Limiares de orçamento ajustados adequadamente

## 💡 Perguntas Frequentes

<details>
<summary><strong>Como posso reduzir os custos dos Microsoft Foundry Models durante o desenvolvimento?</strong></summary>

1. **Use o Nível Gratuito**: Microsoft Foundry Models oferece 50.000 tokens/mês grátis
2. **Reduza a Capacidade**: Defina capacidade para 10 TPM em vez de 30+ para dev
3. **Use azd down**: Desaloque recursos quando não estiver desenvolvendo ativamente
4. **Cache de Respostas**: Implemente cache Redis para consultas repetidas
5. **Use Engenharia de Prompt**: Reduza uso de tokens com prompts eficientes


```bash
# Configuração de desenvolvimento
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Qual é a diferença entre os Modelos Microsoft Foundry e a API OpenAI?</strong></summary>

**Modelos Microsoft Foundry**:
- Segurança e conformidade empresarial
- Integração de rede privada
- Garantias de SLA
- Autenticação com identidade gerenciada
- Cotas mais altas disponíveis

**API OpenAI**:
- Acesso mais rápido a novos modelos
- Configuração mais simples
- Barreira de entrada menor
- Apenas internet pública

Para aplicações em produção, **recomenda-se o Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Como devo lidar com erros de cota excedida no Microsoft Foundry Models?</strong></summary>

```bash
# Verificar cota atual
az cognitiveservices usage list --location eastus2

# Tentar região diferente
azd env set AZURE_LOCATION westus2
azd up

# Reduzir capacidade temporariamente
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitar aumento de cota
# Vá para o Azure Portal > Quotas > Solicitar aumento
```
</details>

<details>
<summary><strong>Posso usar meus próprios dados com Microsoft Foundry Models?</strong></summary>

Sim! Use **Azure AI Search** para RAG (Geração Ampliada por Recuperação):

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
<summary><strong>Como posso proteger os endpoints de modelos de IA?</strong></summary>

**Melhores Práticas**:
1. Use Identidade Gerenciada (sem chaves de API)
2. Habilite Endpoints Privados
3. Configure grupos de segurança de rede
4. Implemente limitação de taxa
5. Use Azure Key Vault para segredos

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
- **Habilidades do Agente**: [Habilidade Microsoft Foundry no skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instale habilidades do agente Azure + Foundry no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Implantação de Modelo AI](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Participe das discussões da comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para ajudar você a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->