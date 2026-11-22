# Integração Microsoft Foundry com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral

Este guia demonstra como integrar os serviços Microsoft Foundry com o Azure Developer CLI (AZD) para implantações de aplicações de IA simplificadas. O Microsoft Foundry oferece uma plataforma abrangente para construir, implantar e gerenciar aplicações de IA, enquanto o AZD simplifica o processo de infraestrutura e implantação.

## O que é o Microsoft Foundry?

O Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Catálogo de Modelos**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **Portal Microsoft Foundry**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Opções de Implantação**: Múltiplas opções de hospedagem e escalonamento
- **Segurança e Confiabilidade**: Recursos de IA responsável incorporados

## AZD + Microsoft Foundry: Juntos são melhores

| Recurso | Microsoft Foundry | Benefício da Integração com AZD |
|---------|-----------------|------------------------|
| **Implantação de Modelos** | Implantação manual pelo portal | Implantações automatizadas e repetíveis |
| **Infraestrutura** | Configuração de projeto e recursos | Comece com `azure.yaml`; exporte Bicep ou Terraform quando necessário |
| **Gerenciamento de Ambiente** | Foco em um único ambiente | Múltiplos ambientes (dev/staging/prod) |
| **Integração CI/CD** | Serviços de implantação e avaliação | Reutilize configurações no GitHub Actions ou Azure DevOps |
| **Gerenciamento de Custos** | Monitoramento básico | Otimização de custos específica para ambiente |

## Pré-requisitos

- Assinatura do Azure com permissões apropriadas
- Azure Developer CLI 1.37.0 ou superior para o workflow GA do Foundry
- Acesso aos serviços de Modelos do Microsoft Foundry
- Familiaridade básica com o Microsoft Foundry

> **Atualização GA do Foundry (09-11-2026):** O pacote de extensão `microsoft.foundry` alcançou a versão 1.0 e disponibilidade geral em [5 de novembro de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). O passo a passo abaixo segue esse anúncio e o quickstart vinculado no Microsoft Learn. Esta é uma revisão da documentação, não uma validação de implantação ao vivo. Recursos adicionais opcionais e extensões lançadas independentemente mantêm seus próprios status de lançamento.

**Resultados de aprendizado:** Instalar o pacote GA, revisar o `azure.yaml` de um agente, comparar respostas locais e implantadas, e explicar avaliação, CI/CD e limites de limpeza. Para uma implantação passo a passo do agente, acesse o [passo a passo do agente hospedado](#hosted-agent-walkthrough-ga). Os fragmentos de recursos abaixo cobrem outros padrões de integração.

## Padrões principais de integração

**Escopo dos exemplos:** O Bicep abaixo contém fragmentos ilustrativos de recursos, não um template implantável completo. O template contêiner deve definir nomes, `location`, recursos referenciados, identidades, saídas e hospedagem de aplicações. Use um exemplo vinculado como ponto de partida executável. Exemplos Bash requerem autenticação Azure CLI separada do `azd auth login`.

### Padrão 1: Integração de Modelos Microsoft Foundry

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

O chamador precisa de uma identidade gerenciada anexada e `Cognitive Services OpenAI User` no escopo da conta; desabilitar chaves não concede acesso. Verifique disponibilidade de região/modelo/SKU e quota antes de implantar.

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

Não há recurso ARM `Microsoft.Search/searchServices/dataConnections` para esta integração. Configure um índice de Search, fonte de dados, indexador/conjunto de skills ou vetor através das APIs data-plane suportadas do Search. Se o Search chamar um modelo de embedding, habilite sua identidade gerenciada, conceda a função relevante do modelo e configure sua skill de embedding/vetor. Veja [vetorização integrada](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Padrão 3: Integração de Inteligência de Documentos

**Caso de Uso**: Processamento e análise de documentos em workflows

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

Exceto pelas configurações AZD documentadas como `AZURE_LOCATION`, estes são **nomes de entrada personalizados do template**. Eles não têm efeito a menos que o template/aplicação os consuma por meio de parâmetros e mapeamentos de ambiente de host. Para `azure-search-openai-demo`, use seus nomes reais tais como `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` e `AZURE_SEARCH_SERVICE_SKU` em vez disso. Capacidade do modelo não é SKU da conta.

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

Prefira Entra ID com autenticação local de chave desabilitada. O seguinte é apenas uma **alternativa legada de autenticação por chave** para aplicações que precisam de chaves: requer uma conta com autenticação por chave habilitada, a identidade do aplicativo anexada ao seu host e acesso/redes do Key Vault funcionando. Não combine recuperação de chave com `disableLocalAuth: true` esperando que chamadas baseadas em chave funcionem.

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

## Workflows de Implantação

### Extensões AZD para Foundry

Para o workflow GA, instale o pacote `microsoft.foundry` em vez de montar as extensões principais uma a uma:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

O pacote instala agentes, conexões, inspector, projetos, rotinas, habilidades e caixas de ferramentas. Não adiciona um grupo de comandos `microsoft.foundry`. Avaliações, conjuntos de dados, fine-tuning e modelos personalizados são instalados separadamente quando necessário. Veja a [referência de empacotamento de extensão](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Passo a passo do Agente Hospedado (GA)

Um **agente hospedado** executa seu código de agente em computação gerenciada pelo Foundry. Este exercício usa a amostra da API Responses do Agent Framework Python básica upstream, não os fragmentos clássicos do Agent Service SDK em outras lições.

#### 1. Preparar e inicializar

Use um diretório vazio fora desta cópia do curso. Instale Python 3.13 ou superior e uma versão atual do [uv release](https://docs.astral.sh/uv/getting-started/installation/). Instalações standalone de uv podem usar `uv self update`. Verifique [permissões do agente hospedado](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), disponibilidade do modelo e quota em sua assinatura e região antes do provisionamento. Recursos Azure e chamadas locais ao modelo geram custos.

Complete a instalação `azd auth login` e do pacote acima. O código local usa `DefaultAzureCredential`; se usar credenciais Azure CLI, autentique-se com `az login` usando a mesma conta e tenant do AZD. Login no AZD não é login Azure CLI.

Execute este comando de linha única no Bash ou PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Escolha um projeto Foundry novo ou existente e a assinatura e região pretendidas. Para reutilizar uma implantação de modelo, adicione `--model-deployment <existing-deployment-name>` ao comando de inicialização **antes de executá-lo**, e selecione o projeto existente. Mantenha-se no diretório contendo o `azure.yaml` gerado para os comandos restantes.

#### 2. Rever a definição da implantação

Abra `azure.yaml` e localize estas configurações na [amostra upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Configuração | O que verificar |
|---------|---------------|
| `host: azure.ai.project` e `deployments` | Projeto Foundry pretendido, nome do modelo, versão, SKU e capacidade de implantação |
| `host: azure.ai.agent` e `project` | Agente hospedado e diretório contendo seu código fonte |
| `codeConfiguration` | Runtime Python e ponto de entrada; a amostra revisada usa `python_3_13` e `main.py` |
| `uses` | Dependência do serviço do projeto Foundry |
| `container.resources` | Alocação de CPU e memória, mesmo sendo código remoto |
| `env` | Mapeamento de implantação de modelo e `PYTHONNOUSERSITE: "1"` para desabilitar carregamento de pacotes do usuário |
| `infra.provider` | `microsoft.foundry`, que sintetiza a infraestrutura necessária |

Comite o `azure.yaml` e o código do agente revisado juntos. Não é necessária infraestrutura escrita à mão para começar; quando precisar de arquivos de provisionamento editáveis, siga [infraestrutura ejetação](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) para Bicep ou Terraform e continue usando `azd provision`. Não comite credenciais nem estado de ambiente `.azure/`.

#### 3. Provisionar e testar localmente

```bash
azd provision
azd ai agent run
```

O provisionamento pode criar implantações de modelo faltantes **mesmo em um projeto reutilizado**. Reveja os prompts do modelo e selecione um tipo de implantação disponível online como Global Standard ou Data Zone Standard; quota e suporte regional variam.

A execução local prepara dependências e abre o **Agent Inspector**, onde você pode inspecionar requisições, respostas e atividade das ferramentas/modelos. Mantenha-o aberto e abra um segundo terminal no mesmo diretório do projeto:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Ponto de verificação:** Confirme que recebe uma resposta relevante e pode inspecionar a atividade local associada. A execução local ainda chama sua implantação de modelo Azure; não é um teste offline ou gratuito. Use prompts sintéticos e evite expor segredos ou dados sensíveis na saída do inspector.

#### 4. Implantar e comparar

Pare a execução local com Ctrl+C quando terminar. Antes da invocação remota, configure ou verifique a [conexão do Application Insights e acesso à leitura de rastros](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) do projeto.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

No modo de implantação por código, AZD carrega o código-fonte para uma build remota no Foundry; não é necessária build local em container para este caminho. A saída da implantação fornece links para playground e endpoint. Verifique uma resposta do agente implantado e seu traço na nuvem; eventos do inspector local isoladamente não provam que rastreamento na nuvem funciona.

Para alterações subsequentes, revise a configuração suportada do agente hospedado com `azd deploy --preview`. Transmita logs com `azd ai agent monitor --follow`, ou diagnostique problemas de configuração e acesso com `azd ai agent doctor`. Uma prévia da implantação não é uma revisão completa de infraestrutura ou segurança.

#### 5. Adicionar uma verificação de qualidade repetível

Instale a extensão de avaliações lançada independentemente, então gere rascunhos de ativos de teste:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Descreva o comportamento pretendido do agente e selecione **Dataset and evaluator**, depois **Turn**. Reveja e edite os casos e a rubrica gerada, incluindo um caso de questão não suportada, antes de configurar a avaliação:

```bash
azd ai eval init --name quality
```

Selecione o dataset e rubrica revisados e confirme a implantação do modelo juiz. Inspecione `evals/azure.eval.yaml` e sua referência no serviço de avaliação em `azure.yaml`, então registre os ativos e execute:

```bash
azd up
azd ai eval run start --eval quality
```

Inspecione pontuações e casos falhados ou com erros; uma avaliação concluída não é automaticamente uma aprovação de qualidade. Geração e pontuação também geram custos de modelo. Comite configurações não-secretas, datasets e rubricas para que colegas compararem mudanças. `azd ai agent optimize` pode reutilizar uma avaliação compatível como baseline, mas revise candidatos antes de implantar explicitamente um. Veja [portões de qualidade e migração](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para projetos antigos e CI.

#### 6. Reutilizar o workflow em CI/CD

Após um `azd up` bem-sucedido, execute `azd pipeline config` e revise o workflow gerado do GitHub Actions ou Azure DevOps. Instale `microsoft.foundry` no runner, além de `azure.ai.evaluations` se executar avaliações. Mantenha configurações geradas de checkout, login e ambiente; apenas a instalação não autentica o pipeline.

Use um ambiente AZD separado por estágio, conceda à identidade do pipeline as permissões necessárias de recursos e Foundry, e mantenha credenciais em segredos do pipeline ou use identidade federada. Comite ativos de avaliação e verifique se a identidade pode acessar datasets/avaliadores referenciados. Veja o [exemplo do pipeline do curso](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) e o [guia Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Limpar deliberadamente

Para um **novo projeto criado por este ambiente**, reveja os recursos listados pelo `azd down` antes de confirmar: ele deleta o grupo de recursos e tudo nele.

Para um **projeto reutilizado**, `azd down` deixa o projeto, agente hospedado e outros recursos no lugar. Remova apenas recursos indesejados que você possua usando as [orientações rápidas de limpeza](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); não exclua um grupo de recursos compartilhado para limpar um exercício.

**Verificação de conclusão:** Explique quais configurações controlam comportamento local e na nuvem, mostre respostas locais e implantadas, revise um resultado de avaliação e identifique quais recursos permanecem após a limpeza.

### Opcional: Scaffold com a Habilidade Microsoft Foundry

Instale a [Habilidade Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) para seu host de agente de codificação, então abra outra pasta vazia separada. Peça para scaffoldar a amostra básica da API Responses do Agent Framework Python no modo de implantação por código, explique o `azure.yaml` gerado e proponha a assinatura, região, projeto e implantação do modelo. Exija aprovação **antes de criar recursos Azure**, solicite um teste local e pare antes da implantação. Reveja a saída e continue com os passos de implantação acima somente quando estiver pronto.

Para projetos existentes, `--template`/`-t` substitui a grafia obsoleta `--manifest`/`-m`; alterar a flag não migra manifestos legados ou configuração aninhada de agente. Veja a [referência do AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Implantação de Comando Único

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implantações Específicas de Ambiente

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
```

Isso provisiona um recurso Insights, não instrumentação de telemetria. Uma vez que seu app emite spans de chamadas de modelo outbound, execute esta consulta ilustrativa nos Logs do Application Insights (adicione o filtro para os nomes reais dos seus spans):

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

Use um destinatário real e verifique as permissões do escopo de faturamento. Um orçamento envia alertas; não é um limite de gastos.

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

Esse fragmento de endpoint também precisa de uma zona/grupo DNS privado, links VNet, conectividade VNet para aplicação e uma política explícita de acesso público. Criar apenas um endpoint privado não desativa o acesso público.

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

Azure Cache para Redis Basic/Standard/Premium está em [caminho de aposentadoria](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis para novas implantações e siga as orientações atuais de template/autenticação. Escopo as respostas de AI em cache por autorização, modelo/instruções e versão dos dados, com expiração; nunca compartilhe respostas privadas usando apenas o texto da consulta.

### Configuração de Autoescalonamento

**Recurso parcial:** mescle essas configurações de escala/ingresso em um Container App completo com ambiente gerenciado, imagem de container e limites de recurso. Mais réplicas não aumentam a cota do modelo.

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

### Problema 1: Quota do OpenAI Excedida

**Sintomas:**
- Implantação falha com erros de quota
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

A variável de capacidade acima se aplica apenas a um template personalizado conectado para consumi-la. Para o exemplo RAG, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Não altere `AZURE_LOCATION` para mover recursos existentes; crie um ambiente separado para uma nova região e planeje migração/limpeza.

### Problema 2: Falhas de Autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços de AI
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

### Problema 3: Problemas na Implantação do Modelo

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

Estes são alternativos, não comandos sequenciais. Inicie cada um em um diretório vazio separado. O destino explícito `.` mantém a inicialização no seu diretório atual; caso contrário, o AZD pode criar um diretório filho nomeado pelo template sem alterar o diretório de trabalho do seu shell.

### Aplicação RAG Chat (Python)

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrição**: Aplicação de chat RAG de referência para perguntas sobre seus documentos, com recuperação via Azure AI Search. Revise os modelos suportados do exemplo atual, recursos opcionais, orientações de custo e reforço para produção antes do uso; implantar um exemplo não torna uma aplicação pronta para produção.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicação RAG Chat (.NET)

**Repositório**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrição**: Equivalente em .NET/C# ao exemplo Python RAG chat. Construído com API Minimal do ASP.NET Core e frontend Blazor WebAssembly. Inclui chat por voz, suporte GPT-4o-mini vision e cliente .NET MAUI Blazor Hybrid para desktop/móvel complementar.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicação RAG Chat (Java)

**Repositório**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrição**: Versão Java do exemplo de chat RAG usando Langchain4J para orquestração de AI. Suporta arquitetura baseada em microserviços e eventos, múltiplas estratégias de busca (texto, vetor, híbrido), upload de documentos com Azure Document Intelligence e implantação tanto em Azure Container Apps quanto Azure Kubernetes Service.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copiloto de Varejo Empresarial com Microsoft Foundry

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrição**: Copiloto varejista RAG completo usando Microsoft Foundry e Prompty. Chatbot do varejista Contoso Outdoor que fundamenta respostas nos dados do catálogo de produtos e pedidos dos clientes. Demonstra todo o fluxo de trabalho GenAIOps — prototipagem com Prompty, avaliação com avaliadores assistidos por AI e implantação via AZD em Container Apps.

**Início Rápido**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicação Multi-Agente para Escrita Criativa

**Repositório**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Serviços**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrição**: Exemplo multi-agente demonstrando orquestração de agentes AI com Prompty. Usa um agente de pesquisa (Bing Grounding no Azure AI Agent Service), um agente de produto (Azure AI Search), um agente escritor e um agente editor para produzir colaborativamente artigos bem pesquisados. Inclui CI/CD com avaliação no GitHub Actions.

**Início Rápido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### RAG Chat Serverless (JavaScript/TypeScript)

**Repositório**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Serviços**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descrição**: Chatbot RAG completamente serverless usando LangChain.js com Azure Functions para API e Azure Static Web Apps para hospedagem. Usa Azure Cosmos DB tanto como armazenamento vetorial quanto banco de dados de histórico de chat. Suporta desenvolvimento local com Ollama para testes sem custo.

**Início Rápido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acelerador de Solução Chat com Seus Dados

**Repositório**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Serviços**: Microsoft Foundry + Azure Container Apps (web/API/ingestão) + Azure AI Search com Cosmos DB, ou PostgreSQL com pgvector

**Descrição**: Acelerador de chat com fundamentação em documentos e citações. O exemplo atual hospeda um frontend React, backend FastAPI e worker de ingestão Functions em Container Apps; opções de orquestrador são Agent Framework e LangGraph. As opções de banco de dados/recuperação são selecionadas na implantação. É um ponto de partida, não um sistema de produção turnkey; não presuma que variantes antigas de App Service, Semantic Kernel ou Prompt Flow descrevam o padrão atual.

**Início Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agentes de Viagem AI — Orquestração Multi-Agente MCP

**Repositório**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Serviços**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descrição**: Aplicação de referência para orquestração multi-agente AI usando três frameworks (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Inclui servidores MCP (Model Context Protocol) em quatro linguagens implantados como Azure Container Apps serverless com monitoramento OpenTelemetry.

**Início Rápido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Explore mais templates**: Visite a [Galeria Awesome AZD AI Template](https://azure.github.io/awesome-azd/?tags=ai) para templates disponíveis para diversas linguagens e cenários. Cada exemplo vinculado é um repositório externo, não um exemplo local fornecido por este curso; inspecione seus pré-requisitos e orientações de produção antes da implantação.

## Próximos Passos

1. **Experimente os Exemplos**: Comece com um template pré-construído que corresponda ao seu caso de uso
2. **Customize conforme suas Necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione Monitoramento**: Implemente observabilidade abrangente
4. **Otimize Custos**: Ajuste configurações para seu orçamento
5. **Garanta a Segurança da Implantação**: Implemente padrões de segurança corporativa
6. **Escale para Produção**: Adicione recursos multi-região e alta disponibilidade

## 🎯 Exercícios Práticos

### Exercício 1: Implemente o Microsoft Foundry Models Chat App (30 minutos)
**Objetivo**: Implantar e testar uma aplicação de chat de AI de referência

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

# Review the listed resources and confirm cleanup
azd down
```

**Critérios de Sucesso:**
- [ ] Implantação completa sem erros de quota
- [ ] Acesso à interface de chat no navegador
- [ ] Pode fazer perguntas e receber respostas alimentadas por AI
- [ ] Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso

**Custo:** Revise o guia de custos atual do exemplo e os SKUs selecionados antes da implantação. O faturamento continua até que os recursos sejam excluídos; não há estimativa fixa de 30 minutos aplicável para toda configuração.

### Exercício 2: Configure Implantação Multi-Modelo (45 minutos)
**Objetivo**: Implantar vários modelos AI com diferentes configurações

**Ponto de partida:** Conta Azure OpenAI existente e um módulo de grupo de recursos AZD que pode chamar este arquivo. Crie `infra/ai-models.bicep` com o conteúdo seguinte usando seu editor. Ele não é implantado automaticamente só por estar sob `infra/`.

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

A partir do módulo com escopo de grupo de recursos que possui a conta, adicione uma invocação de módulo (adicione o nome do símbolo real da sua conta):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Não declare as mesmas implantações em ambos os módulos. Se o ponto de entrada AZD for com escopo de assinatura, invoque este a partir do módulo filho com escopo de grupo de recursos e ajuste o caminho relativo. Construa esse módulo contendo com `az bicep build --file <path-to-containing-module>`, então:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Critérios de Sucesso:**
- [ ] Múltiplos modelos implantados com êxito
- [ ] Diferentes configurações de capacidade aplicadas
- [ ] Modelos acessíveis via API
- [ ] Pode chamar ambos os modelos a partir da aplicação

### Exercício 3: Implemente Monitoramento de Custos (20 minutos)
**Objetivo**: Configurar alertas de orçamento e monitoramento de custos

**Ponto de partida:** O padrão de orçamento acima e um módulo de infraestrutura com escopo de grupo de recursos. Adicione este recurso usando seu editor; passe `budgetStartDate` do seu mapeamento de parâmetros (não duplique o parâmetro se já declarado). Substitua o destinatário e confirme que tem acesso de gravação no orçamento.

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

Esperado: a resposta contém `amount: 200`, ambos os limiares e seu destinatário. Inspecione o Gerenciamento de Custos no portal para cobranças reais; dados de custo são retardados e um alerta pode não disparar durante um exercício curto.

**Critérios de Sucesso:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por email configuradas
- [ ] Pode visualizar dados de custo no Portal Azure
- [ ] Limiares de orçamento configurados apropriadamente

## 💡 Perguntas Frequentes

<details>
<summary><strong>Como reduzir os custos dos Microsoft Foundry Models durante o desenvolvimento?</strong></summary>

1. **Verifique os preços**: Não existe uma cota mensal universal grátis de 50.000 tokens para modelos Azure OpenAI
2. **Ajuste a capacidade**: A capacidade `10` tipicamente representa 10.000 TPM para estes modelos Standard de texto, não 10 TPM. Reduzir este limite de taxa não reduz preços por token
3. **Use azd down**: Exclua recursos descartáveis quando não estiver desenvolvendo ativamente (não é desalocação)
4. **Cache de Respostas**: Implemente cache Redis para consultas repetidas
5. **Use Engenharia de Prompts**: Reduza o uso de tokens com prompts eficientes

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
- Segurança corporativa e conformidade
- Integração com rede privada
- Garantias de SLA
- Autenticação via identidade gerenciada
- Cotas maiores disponíveis

**API OpenAI**: Provedor/API separado com disponibilidade de modelos, preços, autenticação e opções de conectividade corporativa próprias. Compare ofertas atuais em vez de presumir que é apenas internet pública ou que lança modelos primeiro.

Escolha conforme os requisitos da sua organização; exemplos Azure específicos de identidade gerenciada e link privado neste curso se aplicam a serviços hospedados no Azure, não a todo modelo/provedor do catálogo Foundry.
</details>

<details>
<summary><strong>Como lidar com erros de quota excedida dos Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Posso usar meus próprios dados com os Microsoft Foundry Models?</strong></summary>

Sim! Use **Azure AI Search** para RAG (Geração Aumentada por Recuperação):

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
<summary><strong>Como posso proteger endpoints de modelos de IA?</strong></summary>

**Melhores Práticas**:
1. Use Identidade Gerenciada (sem chaves de API)
2. Ative Endpoints Privados
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
- **Habilidades do Agente**: [Habilidade Microsoft Foundry no skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instale habilidades de agente Azure + Foundry no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Próximo**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Participe das discussões da comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para ajudar você a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->