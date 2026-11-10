# Integração Microsoft Foundry com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral

Este guia demonstra como integrar os serviços Microsoft Foundry com o Azure Developer CLI (AZD) para implantações simplificadas de aplicações de IA. Microsoft Foundry oferece uma plataforma abrangente para construir, implantar e gerenciar aplicações de IA, enquanto o AZD simplifica o processo de infraestrutura e implantação.

## O que é Microsoft Foundry?

Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Catálogo de Modelos**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **Portal Microsoft Foundry**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Opções de Implantação**: Diversas opções de hospedagem e escalonamento
- **Segurança e Responsabilidade**: Funcionalidades embutidas de IA responsável

## AZD + Microsoft Foundry: Melhores Juntos

| Recurso | Microsoft Foundry | Benefício da Integração AZD |
|---------|-----------------|------------------------|
| **Implantação de Modelos** | Implantação manual via portal | Implantações automatizadas e repetíveis |
| **Infraestrutura** | Provisionamento via cliques | Infraestrutura como Código (Bicep) |
| **Gerenciamento de Ambiente** | Foco em ambiente único | Multi-ambiente (dev/staging/prod) |
| **Integração CI/CD** | Limitada | Suporte nativo a GitHub Actions |
| **Gerenciamento de Custos** | Monitoramento básico | Otimização de custos específica por ambiente |

## Pré-requisitos

- Assinatura Azure com permissões apropriadas
- Azure Developer CLI instalado
- Acesso aos serviços Microsoft Foundry Models
- Conhecimento básico em Microsoft Foundry

> **Revisão da versão (2026-11-04):** A orientação para AI CLI foi verificada com a documentação/fonte de `azd` `1.37.2`, agentes `1.0.0-beta.23`, e avaliações `1.0.0-beta.2`. Use `azd >= 1.37.0` para o fluxo combinado. Veja [alterações e correções da versão](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); esta revisão não certifica todos os modelos ou exemplos de SDK contra uma implantação ao vivo.

## Padrões Principais de Integração

**Escopo dos exemplos:** O Bicep abaixo contém fragmentos ilustrativos de recursos, não um template completo implantável. O template contêiner deve definir nomes, `location`, recursos referenciados, identidades, saídas e hospedagem da aplicação. Use um exemplo vinculado como ponto de partida executável. Exemplos Bash requerem autenticação Azure CLI separada do `azd auth login`.

### Padrão 1: Integração Microsoft Foundry Models

**Caso de Uso**: Implantar aplicações de chat com modelos Azure OpenAI no Microsoft Foundry

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

O chamador precisa de uma identidade gerenciada anexada e `Cognitive Services OpenAI User` no escopo da conta; desabilitar chaves não concede acesso. Verifique disponibilidade de região/modelo/SKU e cota antes da implantação.

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

```

Não existe recurso ARM `Microsoft.Search/searchServices/dataConnections` para esta integração. Configure um índice Search, fonte de dados, indexador/conjunto de habilidades ou vetorizador via APIs suportadas do plano de dados Search. Se Search chamar um modelo de embedding, habilite sua identidade gerenciada, conceda o papel relevante no modelo e configure a habilidade/vetorizador de embedding. Veja [vetorização integrada](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Padrão 3: Integração Document Intelligence

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

Exceto pelas configurações documentadas do AZD como `AZURE_LOCATION`, estes são **nomes de entrada de template personalizado**. Não tem efeito a menos que o template/aplicação os consuma por parâmetros e mapeamentos de ambiente host. Para `azure-search-openai-demo`, use seus nomes reais como `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` e `AZURE_SEARCH_SERVICE_SKU` ao invés disso. Capacidade de modelo não é SKU da conta.

**Configuração de Produção:**
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

**Configuração de Desenvolvimento:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configuração Segura com Key Vault

Prefira Entra ID com autenticação local de chave desativada. O seguinte é apenas uma **alternativa legada de autenticação por chave** para apps que requerem chaves: exige conta com autenticação por chave ativada, identidade da aplicação anexada ao host e acesso/rede funcionando ao Key Vault. Não combine recuperação de chave com `disableLocalAuth: true` esperando chamadas baseadas em chave funcionarem.

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

## Fluxos de Trabalho de Implantação

### Extensões AZD para Foundry

O AZD fornece extensões que adicionam capacidades específicas de IA para trabalhar com serviços Microsoft Foundry:

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

As extensões de IA ainda evoluem rapidamente em pré-visualização. Se um comando se comportar diferente do mostrado aqui, atualize a extensão relevante antes de solucionar o projeto propriamente.

### Implantação Agent-First com `azd ai`

Use `azd ai agent init` de forma interativa, ou adote um template atual de projeto agente `azure.yaml` conectado ao Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` substituem a grafia obsoleta `--manifest`/`-m`; manifesto legado e configuração aninhada do agente ainda precisam migração. Avalie agentes com `azd ai eval` de `azure.ai.evaluations`, não o fluxo legado removido. Veja [migração de avaliação](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para configuração, execução e resultados.

Veja [Comandos AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para referência completa de comandos e flags.

### Implantação com Comando Único

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implantações Específicas por Ambiente

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

## Monitoramento e Observabilidade

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

Isso provisiona um recurso Insights, não instrumentação de telemetria. Uma vez que seu app emita spans de chamadas ao modelo, execute esta consulta ilustrativa nos Logs do Application Insights (adapte o filtro aos nomes reais dos spans):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitoramento de Custos

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

Use um destinatário real e verifique permissões do escopo de cobrança. Um orçamento envia alertas; não é um limite de gasto.

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

Este fragmento de endpoint também precisa de zona DNS privada/grupo, links VNet, conectividade da aplicação à VNet e uma política explícita de acesso público. Criar apenas um endpoint privado não desativa o acesso público.

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

## Otimização de Performance

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

Azure Cache for Redis Basic/Standard/Premium está em [caminho de aposentadoria](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis para novas implantações e siga suas diretrizes atuais de template/autenticação. Escopo de respostas em cache para IA por autorização, modelo/instruções e versão de dados, com expiração; nunca compartilhe respostas privadas apenas com texto de consulta.

### Configuração de Autoescalonamento

**Recurso parcial:** mescle estas configurações de escala/ingress em um Container App completo com ambiente gerenciado, imagem de container e limites de recursos. Mais réplicas não aumentam cota do modelo.

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
- Implantação falha com erros de cota
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

A variável capacity acima se aplica apenas a um template personalizado configurado para consumi-la. Para o exemplo RAG, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Não altere `AZURE_LOCATION` para mover recursos existentes no local; crie um ambiente separado para uma nova região e planeje migração/limpeza.

### Problema 2: Falhas de Autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços de IA
- Mensagens de "Acesso negado"

**Soluções:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Problemas na Implantação de Modelos

**Sintomas:**
- Modelos não disponíveis na implantação
- Versões específicas do modelo falhando

**Soluções:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Exemplos de Templates

Estes são alternativos, não comandos sequenciais. Inicie cada um em um diretório vazio separado. O destino explícito `.` mantém a inicialização no diretório atual; caso contrário, o AZD atual pode criar um diretório filho nomeado pelo template sem alterar o diretório ativo do shell.

### Aplicação RAG Chat (Python)

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrição**: Aplicação de referência RAG chat para perguntas sobre seus documentos, com recuperação via Azure AI Search. Reveja os modelos suportados atuais do exemplo, recursos opcionais, orientação de custos e preparo para produção antes do uso; implantar um exemplo não torna a aplicação pronta para produção.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicação RAG Chat (.NET)

**Repositório**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrição**: Equivalente .NET/C# do exemplo Python RAG chat. Construído com ASP.NET Core Minimal API e frontend Blazor WebAssembly. Inclui chat por voz, suporte GPT-4o-mini vision e cliente companion .NET MAUI Blazor Hybrid para desktop/móvel.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicação RAG Chat (Java)

**Repositório**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrição**: Versão Java do exemplo RAG chat usando Langchain4J para orquestração de IA. Suporta arquitetura de microsserviços orientada a eventos, múltiplas estratégias de busca (texto, vetor, híbrida), upload de documentos com Azure Document Intelligence, e implantação em Azure Container Apps ou Azure Kubernetes Service.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copiloto para Varejo Empresarial com Microsoft Foundry

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrição**: Copiloto completo retail RAG usando Microsoft Foundry e Prompty. Chatbot de varejo Contoso Outdoor que fundamenta respostas em catálogo de produtos e dados de pedidos de clientes. Demonstra todo o fluxo GenAIOps — protótipo com Prompty, avaliação com avaliadores assistidos por IA, e implantação via AZD para Container Apps.

**Início Rápido**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicação Multi-Agente para Escrita Criativa

**Repositório**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Serviços**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrição**: Exemplo multi-agente demonstrando orquestração de agentes IA com Prompty. Usa agente de pesquisa (Bing Grounding no Azure AI Agent Service), agente de produto (Azure AI Search), agente escritor e agente editor para produzir artigos bem pesquisados colaborativamente. Inclui CI/CD com avaliação via GitHub Actions.

**Início Rápido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### RAG Chat Serverless (JavaScript/TypeScript)

**Repositório**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Serviços**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descrição**: Chatbot RAG totalmente serverless usando LangChain.js com Azure Functions para API e Azure Static Web Apps para hospedagem. Usa Azure Cosmos DB como armazenamento vetorial e banco de dados de histórico de chat. Suporta desenvolvimento local com Ollama para testes sem custo.

**Início Rápido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acelerador Chat com Seus Dados

**Repositório**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Serviços**: Microsoft Foundry + Azure Container Apps (web/API/ingestão) + Azure AI Search com Cosmos DB, ou PostgreSQL com pgvector

**Descrição**: Acelerador de chat fundamentado em documentos com citações. O exemplo atual hospeda frontend React, backend FastAPI, e worker de ingestão Functions em Container Apps; opções de orquestração são Agent Framework e LangGraph. Opções de banco de dados/recuperação são selecionadas na implantação. É um ponto de partida, não um sistema de produção turnkey; não presuma que versões antigas de App Service, Semantic Kernel ou Prompt Flow descrevam o padrão atual.

**Início Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agentes de Viagem de IA — Orquestração Multi-Agente MCP

**Repositório**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Serviços**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descrição**: Aplicação de referência para orquestração de IA multi-agentes usando três frameworks (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Inclui servidores MCP (Model Context Protocol) em quatro linguagens implantados como Azure Container Apps serverless com monitoramento OpenTelemetry.

**Início Rápido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Veja mais templates**: Visite a [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para templates disponíveis atualmente em várias linguagens e cenários. Cada exemplo linkado é um repositório externo, não um exemplo local fornecido por este curso; inspecione seus pré-requisitos atuais e orientações para produção antes da implantação.

## Próximos Passos

1. **Experimente os Exemplos**: Comece com um template pré-construído que corresponda ao seu caso de uso
2. **Personalize para Suas Necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione Monitoramento**: Implemente observabilidade abrangente
4. **Otimize Custos**: Ajuste as configurações para seu orçamento
5. **Garanta Sua Implantação**: Implemente padrões de segurança empresarial
6. **Escale para Produção**: Adicione recursos multi-região e alta disponibilidade

## 🎯 Exercícios Práticos

### Exercício 1: Implemente o Microsoft Foundry Models Chat App (30 minutos)
**Objetivo**: Implantar e testar uma aplicação de referência de chat de IA

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
- [ ] Implantação finalizada sem erros de cota
- [ ] Acesso à interface de chat pelo navegador
- [ ] Capaz de fazer perguntas e receber respostas geradas por IA
- [ ] Application Insights exibe dados de telemetria
- [ ] Recursos limpos com sucesso

**Custo:** Revise o guia de custo atual e os SKUs selecionados antes da implantação. A cobrança continua até que os recursos sejam excluídos; não existe uma estimativa fixa de 30 minutos para toda configuração.

### Exercício 2: Configure Implantação Multi-Modelo (45 minutos)
**Objetivo**: Implantar múltiplos modelos de IA com configurações diferentes

**Ponto de partida:** Uma conta Azure OpenAI existente e um módulo de grupo de recursos AZD que pode chamar este arquivo. Crie `infra/ai-models.bicep` com o conteúdo abaixo usando seu editor. Ele não é implantado automaticamente apenas por estar dentro de `infra/`.

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

Do módulo de escopo do grupo de recursos proprietário da conta, adicione uma invocação de módulo (adapte o nome do símbolo para sua conta real):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Não declare as mesmas implantações em ambos os módulos. Se o ponto de entrada AZD for no escopo da assinatura, invoque isso a partir do seu módulo filho no escopo do grupo de recursos e ajuste o caminho relativo. Compile esse módulo contido com `az bicep build --file <path-to-containing-module>`, então:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Critérios de Sucesso:**
- [ ] Múltiplos modelos implantados com sucesso
- [ ] Configurações de capacidade diferentes aplicadas
- [ ] Modelos acessíveis via API
- [ ] Capaz de chamar ambos os modelos da aplicação

### Exercício 3: Implemente Monitoramento de Custos (20 minutos)
**Objetivo**: Configurar alertas de orçamento e rastreamento de custos

**Ponto de partida:** O padrão de orçamento acima e um módulo de infraestrutura no escopo do grupo de recursos. Adicione este recurso usando seu editor; passe `budgetStartDate` do seu mapeamento de parâmetros (não duplique o parâmetro se já declarado). Substitua o destinatário e confirme que você tem permissão de gravação de orçamento.

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

Esperado: a resposta contém `amount: 200`, ambos os limites e seu destinatário. Inspecione o Gerenciamento de Custos no portal para cobranças reais; dados de custo têm atraso e um alerta pode não ser acionado durante um exercício curto.

**Critérios de Sucesso:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por e-mail configuradas
- [ ] Capaz de visualizar dados de custo no Portal do Azure
- [ ] Limites de orçamento configurados adequadamente

## 💡 Perguntas Frequentes

<details>
<summary><strong>Como reduzir custos do Microsoft Foundry Models durante o desenvolvimento?</strong></summary>

1. **Verifique os preços**: Não há uma franquia mensal grátis universal de 50.000 tokens para modelos Azure OpenAI
2. **Dimensione corretamente a capacidade**: Capacidade `10` normalmente representa 10.000 TPM para esses modelos Standard de texto, não 10 TPM. Reduzir esse limite de taxa não diminui os preços por token
3. **Use azd down**: Exclua recursos descartáveis quando não estiver desenvolvendo ativamente (isso não é desalocação)
4. **Cache de Respostas**: Implemente cache Redis para consultas repetidas
5. **Use Prompt Engineering**: Reduza o uso de tokens com prompts eficientes

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Qual a diferença entre Microsoft Foundry Models e OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Segurança e conformidade empresarial
- Integração com rede privada
- Garantias de SLA
- Autenticação por identidade gerenciada
- Cotas mais altas disponíveis

**OpenAI API**: Fornecedor/API separado com sua própria disponibilidade de modelos, preços, autenticação e opções de conectividade empresarial. Compare as ofertas atuais, em vez de assumir que é somente internet pública ou que sempre fornece modelos primeiro.

Escolha baseado nas necessidades da sua organização; exemplos de identidade gerenciada e private-link específicos do Azure neste curso aplicam-se a serviços hospedados no Azure, não a cada modelo/fornecedor no catálogo Foundry.
</details>

<details>
<summary><strong>Como lidar com erros de cota excedida no Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Posso usar meus próprios dados com Microsoft Foundry Models?</strong></summary>

Sim! Use **Azure AI Search** para RAG (Retrieval Augmented Generation):

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

Veja o template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Como proteger endpoints de modelos de IA?</strong></summary>

**Melhores Práticas**:
1. Use Identidade Gerenciada (sem chaves API)
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
- **AZD GitHub**: [Problemas e discussões](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Habilidade Microsoft Foundry em skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instale habilidades de agentes Azure + Foundry no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Agentes AI](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Participe das discussões da comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para ajudar você a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->