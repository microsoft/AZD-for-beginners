# Integração Microsoft Foundry com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: O Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Agentes AI](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral

Este guia demonstra como integrar os serviços Microsoft Foundry com o Azure Developer CLI (AZD) para implementações simplificadas de aplicações de IA. A Microsoft Foundry fornece uma plataforma abrangente para construir, implementar e gerir aplicações de IA, enquanto o AZD simplifica o processo de infraestrutura e implementação.

## O que é a Microsoft Foundry?

A Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Catálogo de Modelos**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **Portal Microsoft Foundry**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Opções de Implementação**: Múltiplas opções de alojamento e escalabilidade
- **Segurança e Proteção**: Funcionalidades integradas de IA responsável

## AZD + Microsoft Foundry: Melhor Juntos

| Funcionalidade | Microsoft Foundry | Benefício da Integração AZD |
|---------|-----------------|------------------------|
| **Implementação de Modelos** | Implementação manual via portal | Implementações automatizadas e repetíveis |
| **Infraestrutura** | Provisionamento com clique | Infraestrutura como Código (Bicep) |
| **Gestão de Ambiente** | Foco em ambiente único | Multi-ambientes (dev/staging/prod) |
| **Integração CI/CD** | Limitada | Suporte nativo para GitHub Actions |
| **Gestão de Custos** | Monitorização básica | Otimização de custos específica por ambiente |

## Pré-requisitos

- Subscrição Azure com permissões adequadas
- Azure Developer CLI instalado
- Acesso aos serviços Microsoft Foundry Models
- Familiaridade básica com a Microsoft Foundry

> **Revisão da versão (2026-11-04):** A orientação AI CLI foi verificada contra a documentação/fonte `azd` `1.37.2`, agentes `1.0.0-beta.23` e avaliações `1.0.0-beta.2`. Utilize `azd >= 1.37.0` para o fluxo combinado. Veja [alterações e correções da versão](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); esta revisão não certifica cada modelo ou exemplo SDK contra uma implementação ao vivo.

## Padrões Centrais de Integração

**Âmbito dos exemplos:** O Bicep abaixo contém fragmentos ilustrativos de recursos, não um modelo completo para implementação. O modelo que o contém deve definir nomes, `location`, recursos referenciados, identidades, outputs e alojamento da aplicação. Use um exemplo ligado para um ponto de partida executável. Exemplos Bash requerem autenticação Azure CLI separada de `azd auth login`.

### Padrão 1: Integração Microsoft Foundry Models

**Caso de Uso**: Implementar aplicações de chat com modelos Azure OpenAI na Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

O chamador precisa de uma identidade gerida associada e `Cognitive Services OpenAI User` ao âmbito da conta; desativar chaves não concede acesso. Verifique a disponibilidade de região/modelo/SKU e quota antes da implementação.

### Padrão 2: Integração AI Search + RAG

**Caso de Uso**: Implementar aplicações de geração aumentada por recuperação (RAG)

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

```

Não existe recurso ARM `Microsoft.Search/searchServices/dataConnections` para esta integração. Configure um índice Search, fonte de dados, indexador/conjunto de competências ou vetorizador através das APIs suportadas do plano de dados Search. Se o Search usa um modelo de embedding, ative a sua identidade gerida, conceda o papel relevante do modelo e configure a sua competência de embedding/vetorizador. Veja [vetorização integrada](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Padrão 3: Integração com Document Intelligence

**Caso de Uso**: Processamento e análise de documentos em fluxos de trabalho

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

Exceto para configurações documentadas do AZD como `AZURE_LOCATION`, estes são **nomes de entrada personalizados do modelo**. Não têm efeito a menos que o modelo/aplicação os consuma através de parâmetros e mapeamentos do ambiente hospedeiro. Para `azure-search-openai-demo`, utilize os seus nomes reais como `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` e `AZURE_SEARCH_SERVICE_SKU` em vez disso. A capacidade do modelo não é SKU da conta.

**Configuração para Produção:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuração para Desenvolvimento:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configuração Segura com Key Vault

Prefira Entra ID com autenticação local de chave desativada. O seguinte é apenas uma **alternativa legada de autenticação por chave** para aplicações que requerem chaves: requer uma conta com autenticação por chave ativada, identidade da aplicação associada ao seu hospedeiro e acesso/rede Key Vault funcional. Não combine a recuperação de chaves com `disableLocalAuth: true` esperando que chamadas baseadas em chave funcionem.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

## Fluxos de Trabalho de Implementação

### Extensões AZD para Foundry

O AZD fornece extensões que adicionam capacidades específicas de IA para trabalhar com os serviços Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

As extensões AI ainda evoluem rapidamente em pré-visualização. Se um comando comportar-se de forma diferente do aqui descrito, atualize a extensão relevante antes de diagnosticar o projeto em si.

### Implementação Agent-First com `azd ai`

Use `azd ai agent init` de forma interativa, ou adote um modelo atual de projeto agente `azure.yaml` ligado ao Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` substitui a grafia obsoleta `--manifest`/`-m`; o manifesto legado e a configuração aninhada do agente ainda necessitam migração. Avalie agentes com `azd ai eval` proveniente de `azure.ai.evaluations`, não o fluxo legado removido. Veja [migração de avaliação](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para configuração, execução e resultados.

Veja [Comandos AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para referência completa de comandos e flags.

### Implementação com Comando Único

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implementações Específicas por Ambiente

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorização e Observabilidade

### Integração Application Insights

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
```

Isto provisiona um recurso Insights, não instrumentação de telemetria. Assim que a sua aplicação emitir spans de chamadas a modelos, execute esta query ilustrativa nos Logs do Application Insights (adapte o filtro aos nomes reais dos seus spans):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorização de Custos

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Use um destinatário real e verifique permissões do âmbito da faturação. Um orçamento envia alertas; não é um limite de despesas.

## 🔐 Melhores Práticas de Segurança

### Configuração de Identidade Gerida

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

Este fragmento de endpoint também necessita de uma zona/grupo DNS privado, ligações VNet, conectividade da aplicação à VNet e uma política explícita de acesso público. Criar apenas um endpoint privado não desativa o acesso público.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache para Redis Basic/Standard/Premium está numa [fase de aposentação](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); utilize Azure Managed Redis para novas implementações e siga seu guia atual de modelo/autenticação. Faça cache das respostas AI com base na autorização, modelo/instruções e versão dos dados, com expiração; nunca partilhe respostas privadas usando apenas texto da query.

### Configuração de Autoescalonamento

**Recurso parcial:** integre estas definições de escala/entrada numa aplicação Container App completa com ambiente gerido, imagem de container e limites de recursos. Mais réplicas não aumentam quota de modelos.

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

## Resolução de Problemas Comuns

### Problema 1: Quota OpenAI Excedida

**Sintomas:**
- A implementação falha com erros de quota
- Erros 429 nos logs da aplicação

**Soluções:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

A variável capacidade acima aplica-se apenas a um modelo personalizado ligado para a consumir. Para o exemplo RAG, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Não altere `AZURE_LOCATION` para mover recursos existentes; crie um ambiente separado para uma nova região e planeie migração/limpeza.

### Problema 2: Falhas na Autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços de IA
- Mensagens "Acesso negado"

**Soluções:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Problemas de Implementação de Modelo

**Sintomas:**
- Modelos não disponíveis na implementação
- Versões específicas de modelo a falhar

**Soluções:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Exemplos de Modelos

Estas são alternativas, não comandos sequenciais. Comece cada uma numa diretoria vazia separada. O destino explícito `.` mantém a inicialização na sua diretoria atual; caso contrário, o AZD atual pode criar uma diretoria filha com nome do modelo sem alterar o diretório corrente do shell.

### Aplicação de Chat RAG (Python)

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrição**: Aplicação de chat de referência RAG para perguntas sobre os seus documentos, com recuperação Azure AI Search. Reveja os modelos suportados atuais, funcionalidades opcionais, orientação de custos e endurecimento para produção antes do uso; implementar um exemplo não torna a aplicação pronta para produção.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicação de Chat RAG (.NET)

**Repositório**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrição**: Equivalente em .NET/C# do exemplo Python de chat RAG. Construído com ASP.NET Core Minimal API e frontend Blazor WebAssembly. Inclui chat por voz, suporte GPT-4o-mini vision e um cliente desktop/móvel .NET MAUI Blazor Hybrid acompanhante.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicação de Chat RAG (Java)

**Repositório**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrição**: Versão Java do exemplo chat RAG usando Langchain4J para orquestração AI. Suporta arquitetura orientada a eventos de microserviços, múltiplas estratégias de pesquisa (texto, vector, híbrido), upload de documentos com Azure Document Intelligence e implementação em Azure Container Apps ou Azure Kubernetes Service.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copiloto Varejo Empresarial com Microsoft Foundry

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrição**: Copiloto RAG completo para varejo usando Microsoft Foundry e Prompty. Chatbot da Contoso Outdoor Retailer que baseia respostas no catálogo de produtos e dados de encomendas de clientes. Demonstra o fluxo completo GenAIOps — protótipo com Prompty, avalie com avaliadores assistidos por IA, e implemente via AZD para Container Apps.

**Início Rápido**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicação Multi-Agente de Escrita Criativa

**Repositório**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Serviços**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrição**: Exemplo multi-agente demonstrando orquestração de agentes AI com Prompty. Usa um agente de pesquisa (Bing Grounding no Azure AI Agent Service), um agente de produto (Azure AI Search), um agente escritor e um agente editor para produzir artigos bem pesquisados colaborativamente. Inclui CI/CD com avaliação em GitHub Actions.

**Início Rápido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositório**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Serviços**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descrição**: Chatbot RAG totalmente serverless usando LangChain.js com Azure Functions para a API e Azure Static Web Apps para alojamento. Usa Azure Cosmos DB como armazenamento vector e base de dados de histórico de chat. Suporta desenvolvimento local com Ollama para testes sem custos.

**Início Rápido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acelerador de Solução Chat com os Seus Dados

**Repositório**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Serviços**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search com Cosmos DB, ou PostgreSQL com pgvector

**Descrição**: Um acelerador de chat fundamentado em documentos com citações. O exemplo atual aloja frontend React, backend FastAPI e worker de ingestão Functions em Container Apps; as opções de orquestração são Agent Framework e LangGraph. Opções de base de dados/recuperação são escolhidas na implementação. É um ponto de partida, não um sistema pronto para produção; não assuma que versões antigas de App Service, Semantic Kernel ou Prompt Flow descrevem o padrão atual.

**Início Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agentes de Viagem AI — Orquestração Multi-Agente MCP

**Repositório**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Serviços**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descrição**: Aplicação de referência para orquestração de IA multi-agente usando três frameworks (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Dispõe de servidores MCP (Model Context Protocol) em quatro linguagens, implementados como Azure Container Apps sem servidor com monitorização OpenTelemetry.

**Início Rápido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Explore mais modelos**: Visite a [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para modelos atualmente disponíveis em várias linguagens e cenários. Cada exemplo ligado é um repositório externo, não um exemplo local fornecido por este curso; examine os seus pré-requisitos atuais e orientações para produção antes da implementação.

## Próximos Passos

1. **Experimente os Exemplos**: Comece com um modelo pré-construído que corresponda ao seu caso de uso
2. **Personalize para as suas Necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione Monitorização**: Implemente observabilidade abrangente
4. **Otimize os Custos**: Ajuste as configurações para o seu orçamento
5. **Proteja a sua Implementação**: Implemente padrões de segurança empresarial
6. **Escale para Produção**: Adicione funcionalidades multi-região e de alta disponibilidade

## 🎯 Exercícios Práticos

### Exercício 1: Implemente a Aplicação de Chat dos Modelos Microsoft Foundry (30 minutos)
**Objetivo**: Implementar e testar uma aplicação de chat de IA de referência

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] A implementação conclui sem erros de quota
- [ ] É possível aceder à interface de chat no navegador
- [ ] É possível fazer perguntas e obter respostas com IA
- [ ] Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso

**Custo:** Reveja o guia de custos atual do exemplo e os SKUs selecionados antes de implementar. A faturação continua até os recursos serem eliminados; não há uma estimativa fixa de 30 minutos que se aplique a todas as configurações.

### Exercício 2: Configure uma Implementação Multi-Modelo (45 minutos)
**Objetivo**: Implementar múltiplos modelos de IA com configurações diferentes

**Ponto de partida:** Uma conta Azure OpenAI existente e um módulo de grupo de recursos AZD que possa chamar este ficheiro. Crie `infra/ai-models.bicep` com o seguinte conteúdo usando o seu editor. Isto não é automaticamente implementado só porque está sob `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

A partir do módulo com âmbito ao grupo de recursos que possui a conta, adicione uma invocação de módulo (adapte o nome do símbolo à sua conta real):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Não declare as mesmas implementações em ambos os módulos. Se o ponto de entrada AZD tiver âmbito de subscrição, invoque isto a partir do seu módulo filho com âmbito de grupo de recursos e ajuste o caminho relativo. Construa esse módulo contenedor com `az bicep build --file <path-to-containing-module>` e depois:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Critérios de Sucesso:**
- [ ] Múltiplos modelos implementados com sucesso
- [ ] Definições de capacidade diferentes aplicadas
- [ ] Modelos acessíveis via API
- [ ] É possível chamar ambos os modelos desde a aplicação

### Exercício 3: Implemente Monitorização de Custos (20 minutos)
**Objetivo**: Configurar alertas de orçamento e acompanhamento de custos

**Ponto de partida:** O padrão de orçamento acima e um módulo de infraestrutura com âmbito de grupo de recursos. Adicione este recurso usando o seu editor; passe `budgetStartDate` da sua mapeação de parâmetros (não duplique o parâmetro se já estiver declarado). Substitua o destinatário e confirme que tem acesso de escrita ao orçamento.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Esperado: a resposta contém `amount: 200`, ambos os limiares e o seu destinatário. Inspecione o Cost Management no portal para as cobranças reais; os dados de custo têm atraso e um alerta pode não disparar durante um exercício curto.

**Critérios de Sucesso:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por email configuradas
- [ ] É possível visualizar dados de custo no Azure Portal
- [ ] Limiar do orçamento definido adequadamente

## 💡 Perguntas Frequentes

<details>
<summary><strong>Como reduzir os custos dos Modelos Microsoft Foundry durante o desenvolvimento?</strong></summary>

1. **Verifique preços**: Não existe uma franquia universal gratuita de 50.000 tokens mensais para modelos Azure OpenAI
2. **Ajuste a capacidade**: A capacidade `10` tipicamente representa 10.000 TPM para estes modelos de texto Standard, não 10 TPM. Reduzir este limite de taxa não diminui o preço por token
3. **Use azd down**: Apague recursos descartáveis quando não estiver a desenvolver ativamente (isto não é desalocação)
4. **Cache de Respostas**: Implemente cache Redis para consultas repetidas
5. **Use Engenharia de Prompt**: Diminua o uso de tokens com prompts eficientes

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Qual a diferença entre Microsoft Foundry Models e API OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Segurança e conformidade empresarial
- Integração em rede privada
- Garantias de SLA
- Autenticação por identidade gerida
- Cotas superiores disponíveis

**API OpenAI**: Um fornecedor/API separado com disponibilidade própria de modelos, preços, autenticação e opções de conectividade empresarial. Compare as ofertas atuais em vez de assumir que é só pública na internet ou que sempre disponibiliza os modelos primeiro.

Escolha consoante as necessidades da sua organização; exemplos específicos do Azure de identidade gerida e private-link neste curso aplicam-se a serviços alojados no Azure, não a todos os modelos/fornecedores do catálogo Foundry.
</details>

<details>
<summary><strong>Como lidar com erros de quota excedida nos Modelos Microsoft Foundry?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Posso usar os meus próprios dados com os Modelos Microsoft Foundry?</strong></summary>

Sim! Utilize **Azure AI Search** para RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Veja o modelo [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Como proteger endpoints de modelos de IA?</strong></summary>

**Boas Práticas**:
1. Use Identidade Gerida (sem chaves API)
2. Ative Endpoints Privados
3. Configure grupos de segurança da rede
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
- **AZD GitHub**: [Problemas e discussões](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Skill Microsoft Foundry em skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instale skills de agentes Azure + Foundry no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: O Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Agentes AI](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Junte-se às discussões da nossa comunidade ou abra um problema no repositório. A comunidade Azure AI + AZD está aqui para ajudar a sua vitória!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->