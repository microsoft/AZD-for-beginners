# Integração Microsoft Foundry com AZD

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: O Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Seguinte**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

## Visão Geral

Este guia demonstra como integrar os serviços Microsoft Foundry com a Azure Developer CLI (AZD) para implantações simplificadas de aplicações de IA. A Microsoft Foundry oferece uma plataforma completa para construir, implantar e gerir aplicações de IA, enquanto a AZD simplifica o processo de infraestrutura e implantação.

## O que é a Microsoft Foundry?

A Microsoft Foundry é a plataforma unificada da Microsoft para desenvolvimento de IA que inclui:

- **Catálogo de Modelos**: Acesso a modelos de IA de ponta
- **Prompt Flow**: Designer visual para fluxos de trabalho de IA
- **Portal Microsoft Foundry**: Ambiente de desenvolvimento integrado para aplicações de IA
- **Opções de Implantação**: Múltiplas opções de alojamento e escalabilidade
- **Segurança e Responsabilidade**: Funcionalidades de IA responsável incorporadas

## AZD + Microsoft Foundry: Melhor Juntos

| Funcionalidade | Microsoft Foundry | Benefício da Integração AZD |
|---------|-----------------|------------------------|
| **Implantação de Modelo** | Implantação manual pelo portal | Implantações automatizadas e repetíveis |
| **Infraestrutura** | Configuração de projeto e recursos | Comece com `azure.yaml`; exporte Bicep ou Terraform quando necessário |
| **Gestão de Ambiente** | Foco em ambiente único | Ambientes múltiplos (dev/staging/prod) |
| **Integração CI/CD** | Serviços de implantação e avaliação | Reutilize a configuração no GitHub Actions ou Azure DevOps |
| **Gestão de Custos** | Monitorização básica | Otimização de custos específica por ambiente |

## Pré-requisitos

- Subscrição Azure com permissões apropriadas
- Azure Developer CLI 1.37.0 ou superior para o fluxo GA Foundry
- Acesso aos serviços Microsoft Foundry Models
- Familiaridade básica com Microsoft Foundry

> **Atualização Foundry GA (2026-11-09):** O bundle de extensão `microsoft.foundry` atingiu a versão 1.0 e disponibilidade geral em [5 de novembro de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). O passo a passo abaixo segue esse anúncio e o quickstart do Microsoft Learn vinculado. Esta é uma revisão de documentação, não uma validação ao vivo de implantação. Funcionalidades opcionais em preview e extensões lançadas independentemente mantêm o seu próprio estado de lançamento.

**Resultados de aprendizagem:** Instalar o bundle GA, rever o `azure.yaml` de um agente, comparar respostas locais e implantadas e explicar avaliação, CI/CD e limites de limpeza. Para uma implantação passo a passo do agente, vá para o [passo a passo do agente alojado](#hosted-agent-walkthrough-ga). Os fragmentos de recursos abaixo cobrem outros padrões de integração.

## Padrões Centrais de Integração

**Âmbito dos exemplos:** O Bicep abaixo contém fragmentos de recursos ilustrativos, não um template completo para implantação. O template que o contém deve definir nomes, `location`, recursos referenciados, identidades, outputs e alojamento de aplicação. Use um exemplo ligado para um ponto de partida executável. Exemplos Bash requerem autenticação Azure CLI separada do `azd auth login`.

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

O chamador necessita de uma identidade gerida associada e `Cognitive Services OpenAI User` ao âmbito da conta; desativar chaves não concede acesso. Verifique disponibilidade regional/modelo/SKU e quota antes de implantar.

### Padrão 2: Integração AI Search + RAG

**Caso de Uso**: Implantar aplicações de geração aumentada com recuperação (RAG)

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

Não existe recurso ARM `Microsoft.Search/searchServices/dataConnections` para esta integração. Configure um índice Search, fonte de dados, indexador/skillset ou vetorizador através das APIs suportadas do plano de dados do Search. Se o Search invocar um modelo de embeddings, habilite a sua identidade gerida, conceda o papel relevante do modelo e configure a sua skill de embedding/vetorizador. Veja [vetorização integrada](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Padrão 3: Integração Document Intelligence

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

Exceto pelas definições AZD documentadas como `AZURE_LOCATION`, estes são **nomes de entradas personalizados do template**. Não têm efeito a menos que o template/aplicação os consuma através de mapeamentos de parâmetros e ambiente hospedeiro. Para `azure-search-openai-demo`, use os seus nomes reais como `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` e `AZURE_SEARCH_SERVICE_SKU` em vez disso. A capacidade do modelo não é o SKU da conta.

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

Prefira Entra ID com autenticação local de chave desativada. O seguinte é apenas uma **alternativa legada de autenticação por chave** para aplicações que a necessitem: requer uma conta com autenticação por chave ativada, identidade da aplicação associada ao seu hospedeiro, e acesso/rede Key Vault funcional. Não combine recuperação de chave com `disableLocalAuth: true` e espere que chamadas baseadas em chave funcionem.

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

Para o fluxo GA, instale o bundle `microsoft.foundry` em vez de montar as extensões principais uma a uma:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

O bundle instala agentes, conexões, inspector, projetos, rotinas, skills e toolboxes. Não adiciona um grupo de comandos `microsoft.foundry`. Avaliações, conjuntos de dados, fine-tuning e modelos personalizados são instalados separadamente quando necessário. Veja a [referência de embalagem de extensões](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Passo a Passo do Agente Alojado (GA)

Um **agente alojado** executa o seu código do agente em computação gerida pela Foundry. Este exercício usa o exemplo API básico do Python Agent Framework Responses do upstream, não os fragmentos clássicos do Agent Service SDK noutras lições.

#### 1. Preparar e inicializar

Use um diretório vazio fora deste checkout do curso. Instale Python 3.13 ou superior e uma versão atual do [uv release](https://docs.astral.sh/uv/getting-started/installation/). Instalações uv autónomas podem usar `uv self update`. Verifique as [permissões do agente alojado](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), disponibilidade do modelo e quota na sua subscrição e região antes de provisionar. Recursos Azure e chamadas de modelo locais têm custos.

Complete `azd auth login` e instalação do bundle acima. O código de exemplo local usa `DefaultAzureCredential`; se usar credenciais Azure CLI, inicie sessão com `az login` usando a mesma conta e tenant da AZD. A autenticação AZD sozinha não é uma autenticação Azure CLI.

Execute este comando numa linha no Bash ou PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Escolha um projeto Foundry novo ou existente e a subscrição e região pretendidas. Para reutilizar uma implantação de modelo, adicione `--model-deployment <existing-deployment-name>` ao comando de inicialização **antes de o executar**, e selecione o projeto existente. Mantenha-se no diretório que contém o `azure.yaml` gerado para os comandos restantes.

#### 2. Rever a definição da implantação

Abra `azure.yaml` e localize estas definições no [exemplo upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Definição | O que verificar |
|---------|---------------|
| `host: azure.ai.project` e `deployments` | Projeto Foundry pretendido e nome do modelo, versão, SKU de implantação e capacidade |
| `host: azure.ai.agent` e `project` | Agente alojado e diretório que contém a sua origem |
| `codeConfiguration` | Runtime Python e ponto de entrada; o exemplo revisto usa `python_3_13` e `main.py` |
| `uses` | Dependência no serviço do projeto Foundry |
| `container.resources` | Alocação CPU e memória, mesmo com o código construído remotamente |
| `env` | Mapeamento da implantação do modelo e `PYTHONNOUSERSITE: "1"` para desativar carregamento de pacotes do utilizador |
| `infra.provider` | `microsoft.foundry`, que sintetiza a infraestrutura necessária |

Comite o `azure.yaml` revisto e o código do agente juntos. Não é necessária infraestrutura escrita manualmente para começar; quando precisar de ficheiros de provisão editáveis, siga [ejeção de infraestrutura](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) para Bicep ou Terraform e continue a usar `azd provision`. Não comite credenciais nem estado de ambiente `.azure/`.

#### 3. Provisionar e testar localmente

```bash
azd provision
azd ai agent run
```

O provisionamento pode criar implantações de modelo em falta **mesmo num projeto reutilizado**. Reveja os prompts do modelo e selecione um tipo disponível de implantação online como Global Standard ou Data Zone Standard; quota e suporte regional variam.

A execução local prepara dependências e abre o **Agent Inspector**, onde pode inspecionar pedidos, respostas e atividade de ferramentas/modelos. Mantenha-o a correr e abra um segundo terminal no mesmo diretório do projeto:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Ponto de verificação:** Confirme que recebe uma resposta relevante e pode inspecionar a atividade local associada. A execução local continua a chamar a sua implantação de modelo Azure; não é um teste offline ou gratuito. Use prompts sintéticos e evite expor segredos ou dados sensíveis na saída do inspector.

#### 4. Implantar e comparar

Pare a execução local com Ctrl+C quando terminar. Antes da invocação remota, configure ou verifique a [ligação Application Insights do projeto e acesso à leitura de traces](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Em modo de implantação de código, AZD faz upload do código-fonte para uma compilação remota na Foundry; não precisa de construir localmente um container neste percurso. A saída da implantação fornece links para o playground e endpoint. Verifique uma resposta do agente implantado e o seu trace na cloud; eventos locais do inspector sozinhos não provam que o trace cloud funciona.

Para alterações subsequentes, reveja a configuração suportada do agente alojado com `azd deploy --preview`. Transmita logs com `azd ai agent monitor --follow`, ou diagnostique configurações e problemas de acesso com `azd ai agent doctor`. Uma pré-visualização da implantação não é uma revisão completa de infraestrutura ou segurança.

#### 5. Adicionar um controlo de qualidade repetível

Instale a extensão de avaliações lançada independentemente, depois gere rascunhos de ativos de teste:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Descreva o comportamento pretendido do agente e selecione **Conjunto de dados e avaliador**, depois **Iniciar**. Reveja e edite os casos gerados e o critério de avaliação, incluindo um caso de pergunta não suportada, antes de configurar a avaliação:

```bash
azd ai eval init --name quality
```

Selecione o conjunto de dados revisto e critério e confirme a implantação do modelo juiz. Inspecione `evals/azure.eval.yaml` e a sua referência no serviço de avaliação em `azure.yaml`, depois registe os ativos e execute:

```bash
azd up
azd ai eval run start --eval quality
```

Inspecione as pontuações e casos falhados ou com erro; uma avaliação concluída não é automaticamente uma aprovação de qualidade. A geração e pontuação também implicam custos de modelo. Comite configuração não secreta, conjuntos de dados e critérios para que colegas possam comparar mudanças. `azd ai agent optimize` pode reutilizar uma avaliação compatível como base, mas reveja os candidatos antes de implantar explicitamente um. Veja [portões de qualidade e migração](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para projetos antigos e CI.

#### 6. Reutilizar o fluxo em CI/CD

Após um `azd up` bem-sucedido, execute `azd pipeline config` e reveja o workflow GitHub Actions ou Azure DevOps gerado. Instale `microsoft.foundry` no runner, e `azure.ai.evaluations` se executar avaliações. Retenha as configurações geradas de checkout, autenticação e ambiente; apenas a instalação não autentica a pipeline.

Utilize um ambiente AZD separado por etapa, conceda à identidade da pipeline as permissões necessárias nos recursos e Foundry, e mantenha credenciais em segredos da pipeline ou use identidade federada. Comite os ativos da avaliação e verifique se a identidade pode aceder aos conjuntos de dados/avaliadores referenciados. Veja o [exemplo de pipeline do curso](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) e o [guia Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Limpar deliberadamente

Para um **projeto novo criado por este ambiente**, reveja os recursos listados por `azd down` antes de confirmar: elimina o grupo de recursos e tudo nele contido.

Para um **projeto reutilizado**, `azd down` deixa o projeto, agente alojado e outros recursos no lugar. Remova apenas os recursos indesejados que lhe pertençam usando as [diretrizes de limpeza do quickstart](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); não elimine um grupo de recursos partilhado para limpar um exercício.

**Verificação de conclusão:** Explique que definições controlam comportamento local e na cloud, mostre respostas locais e implantadas, reveja um resultado de avaliação e identifique quais recursos permanecem após limpeza.

### Opcional: Scaffold com a Skill Microsoft Foundry

Instale a [Skill Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) para o seu hospedeiro de agente de código, depois abra uma pasta vazia separada. Peça para scaffoldear o exemplo básico do Python Agent Framework Responses API em modo de implantação de código, explique o `azure.yaml` gerado, e proponha subscrição, região, projeto e implantação do modelo. Requeira aprovação **antes de criar recursos Azure**, peça um teste local e pare antes da implantação. Reveja a saída e continue com os passos de implantação acima somente quando estiver pronto.

Para projetos existentes, `--template`/`-t` substitui a grafia desatualizada `--manifest`/`-m`; alterar a flag não migra manifests legados nem configuração aninhada do agente. Veja a [referência AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

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

### Implantação Específica por Ambiente

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

Isto providencia um recurso do Insights, não a instrumentação de telemetria. Uma vez que a sua aplicação emita spans de chamadas de modelo de saída, execute esta consulta ilustrativa nos Registos do Application Insights (adapte o filtro para os nomes reais de span):

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

Use um destinatário real e verifique permissões de âmbito de faturação. Um orçamento envia alertas; não é um limite de gastos.

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

Este fragmento de endpoint também necessita de uma zona/grupo DNS privado, ligações a VNet, conectividade da aplicação à VNet e uma política explícita de acesso público. Criar apenas um endpoint privado não desativa o acesso público.

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

O Azure Cache para Redis Basic/Standard/Premium está num [caminho de aposentação](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); utilize Azure Managed Redis para novas implantações e siga as orientações atuais de template/autenticação. Defina o âmbito de respostas AI em cache por autorização, modelo/instruções e versão dos dados, com expiração; nunca partilhe respostas privadas usando apenas o texto da consulta.

### Configuração de Auto-escalamento

**Recurso parcial:** consolide estas configurações de escala/entrada num Container App completo com ambiente gerido, imagem de container e limites de recursos. Mais réplicas não aumentam a quota do modelo.

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

### Problema 1: Quota do OpenAI Excedida

**Sintomas:**
- A implantação falha com erros de quota
- Erros 429 nos registos da aplicação

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

A variável capacity acima aplica-se somente a um template personalizado configurado para o consumir. Para o exemplo RAG, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Não altere `AZURE_LOCATION` para mover recursos existentes; crie um ambiente separado para uma nova região e planeie a migração/limpeza.

### Problema 2: Falhas de Autenticação

**Sintomas:**
- Erros 401/403 ao chamar serviços AI
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

### Problema 3: Problemas na Implantação do Modelo

**Sintomas:**
- Modelos não disponíveis na implantação
- Versões específicas do modelo a falhar

**Soluções:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Templates de Exemplo

Estes são alternativos, não comandos sequenciais. Comece cada um numa diretoria vazia separada. O destino explícito `.` mantém a inicialização na sua diretoria atual; caso contrário, o AZD atual pode criar uma diretoria filha com o nome do template sem alterar a diretoria de trabalho do seu shell.

### Aplicação de Chat RAG (Python)

**Repositório**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descrição**: Aplicação de referência de chat RAG para perguntas sobre os seus documentos, com recuperação Azure AI Search. Reveja os modelos suportados pelo exemplo atual, funcionalidades opcionais, orientação de custos e robustez para produção antes de usar; implantar um exemplo não torna uma aplicação pronta para produção.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicação de Chat RAG (.NET)

**Repositório**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descrição**: Equivalente .NET/C# do exemplo de chat RAG em Python. Construído com ASP.NET Core Minimal API e frontend Blazor WebAssembly. Inclui chat por voz, suporte GPT-4o-mini vision e cliente desktop/móvel .NET MAUI Blazor Hybrid.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicação de Chat RAG (Java)

**Repositório**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Serviços**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descrição**: Versão Java do exemplo de chat RAG usando Langchain4J para orquestração AI. Suporta arquitetura de microserviços dirigida por eventos, múltiplas estratégias de pesquisa (texto, vetor, híbrido), upload de documentos com Azure Document Intelligence e implantação em Azure Container Apps ou Azure Kubernetes Service.

**Início Rápido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copiloto Retail Empresarial com Microsoft Foundry

**Repositório**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Serviços**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descrição**: Copiloto de retail RAG de ponta a ponta usando Microsoft Foundry e Prompty. Chatbot Contoso Outdoor que fundamenta respostas em catálogo de produtos e dados de encomendas de clientes. Demonstra o fluxo completo GenAIOps — prototipar com Prompty, avaliar com avaliadores assistidos por AI e implantar via AZD em Container Apps.

**Início Rápido**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicação Multi-Agente de Escrita Criativa

**Repositório**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Serviços**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descrição**: Exemplo multi-agente demonstrando orquestração de agentes AI com Prompty. Utiliza agente de investigação (Bing Grounding no Azure AI Agent Service), agente de produto (Azure AI Search), agente escritor e agente editor para produzir artigos bem pesquisados colaborativamente. Inclui CI/CD com avaliação em GitHub Actions.

**Início Rápido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositório**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Serviços**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descrição**: Chatbot RAG totalmente serverless usando LangChain.js com Azure Functions para a API e Azure Static Web Apps para alojamento. Usa Azure Cosmos DB como armazenador vetorial e base de dados de histórico de chat. Suporta desenvolvimento local com Ollama para testes sem custos.

**Início Rápido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acelerador de Solução Chat com os Seus Dados

**Repositório**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Serviços**: Microsoft Foundry + Azure Container Apps (web/API/ingestão) + Azure AI Search com Cosmos DB, ou PostgreSQL com pgvector

**Descrição**: Acelerador de chat fundamentado em documentos com citações. O exemplo atual aloja frontend React, backend FastAPI e trabalhador de ingestão Functions em Container Apps; opções de orquestração são Agent Framework e LangGraph. Opções de base de dados/recuperação são selecionadas na implantação. É um ponto de partida, não um sistema de produção turnkey; não assuma que variantes mais antigas de App Service, Semantic Kernel ou Prompt Flow descrevem o padrão atual.

**Início Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agentes de Viagem AI — Orquestração Multi-Agente MCP

**Repositório**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Serviços**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descrição**: Aplicação de referência para orquestração multi-agente AI usando três frameworks (LangChain.js, LlamaIndex.TS e Microsoft Agent Framework). Inclui servidores MCP (Model Context Protocol) em quatro linguagens implantados como Azure Container Apps serverless com monitorização OpenTelemetry.

**Início Rápido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Explore mais templates**: Visite a [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para templates atualmente disponíveis nas várias linguagens e cenários. Cada exemplo ligado é um repositório externo, não um exemplo local fornecido por este curso; inspecione os pré-requisitos atuais e orientações para produção antes da implantação.

## Próximos Passos

1. **Experimente os Exemplos**: Comece por um template pré-construído que corresponda ao seu caso de uso
2. **Personalize para as Suas Necessidades**: Modifique a infraestrutura e o código da aplicação
3. **Adicione Monitorização**: Implemente observabilidade abrangente
4. **Otimize Custos**: Ajuste as configurações para o seu orçamento
5. **Assegure a Sua Implantação**: Implemente padrões de segurança empresariais
6. **Escale para Produção**: Adicione funcionalidades multi-região e alta disponibilidade

## 🎯 Exercícios Práticos

### Exercício 1: Implantar Aplicação de Chat com Modelos Microsoft Foundry (30 minutos)
**Objetivo**: Implantar e testar uma aplicação de chat AI de referência

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
- [ ] Implantação concluída sem erros de quota
- [ ] Possibilidade de aceder à interface de chat no navegador
- [ ] Pode colocar perguntas e obter respostas AI
- [ ] Application Insights mostra dados de telemetria
- [ ] Recursos limpos com sucesso

**Custo:** Reveja o guia de custos do exemplo e SKUs selecionados antes de implantar. A faturação continua até eliminação dos recursos; não existe estimativa fixa de 30 minutos que se aplique a todas as configurações.

### Exercício 2: Configurar Implantação Multi-Modelo (45 minutos)
**Objetivo**: Implantar múltiplos modelos AI com configurações diferentes

**Ponto de partida:** Uma conta Azure OpenAI existente e um módulo AZD de grupo de recursos que pode chamar este ficheiro. Crie `infra/ai-models.bicep` com o conteúdo seguinte usando o seu editor. Não é implantado automaticamente só porque está sob `infra/`.

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

A partir do módulo com âmbito de grupo de recursos que possui a conta, adicione uma invocação de módulo (adapte o nome do símbolo à sua conta real):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Não declare as mesmas implantações em ambos os módulos. Se o ponto de entrada AZD tiver âmbito de subscrição, invoque isto a partir do módulo filho com âmbito de grupo de recursos e ajuste o caminho relativo. Construa esse módulo contendo com `az bicep build --file <path-to-containing-module>`, depois:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Critérios de Sucesso:**
- [ ] Vários modelos implantados com sucesso
- [ ] Configurações de capacidade diferentes aplicadas
- [ ] Modelos acessíveis via API
- [ ] Pode chamar ambos os modelos a partir da aplicação

### Exercício 3: Implementar Monitorização de Custos (20 minutos)
**Objetivo**: Configurar alertas de orçamento e acompanhamento de custos

**Ponto de partida:** O padrão de orçamento acima e um módulo de infraestrutura com âmbito de grupo de recursos. Adicione este recurso usando seu editor; passe `budgetStartDate` a partir do seu mapeamento de parâmetros (não duplique o parâmetro se já estiver declarado). Substitua o destinatário e confirme que tem acesso de escrita ao orçamento.

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

Esperado: a resposta contém `amount: 200`, ambos os limiares, e o seu destinatário. Inspecione Cost Management no portal para encargos reais; os dados de custos têm atraso e um alerta pode não disparar durante um exercício curto.

**Critérios de Sucesso:**
- [ ] Alerta de orçamento criado no Azure
- [ ] Notificações por email configuradas
- [ ] Pode visualizar dados de custos no Portal Azure
- [ ] Limiares de orçamento definidos adequadamente

## 💡 Perguntas Frequentes

<details>
<summary><strong>Como reduzir custos dos Modelos Microsoft Foundry durante o desenvolvimento?</strong></summary>

1. **Verifique preços**: Não existe uma franquia mensal universal gratuita de 50,000 tokens para modelos Azure OpenAI
2. **Dimensione corretamente a capacidade**: Capacidade `10` normalmente representa 10,000 TPM para estes modelos Standard de texto, não 10 TPM. Reduzir este limite de taxa não diminui os preços por token
3. **Use azd down**: Elimine recursos descartáveis quando não estiver a desenvolver ativamente (isto não é desalocação)
4. **Cache de Respostas**: Implemente cache Redis para consultas repetidas
5. **Use Engenharia de Prompt**: Reduza o uso de tokens com prompts eficientes

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Qual a diferença entre Modelos Microsoft Foundry e API OpenAI?</strong></summary>

**Modelos Microsoft Foundry**:
- Segurança empresarial e conformidade
- Integração em rede privada
- Garantias SLA
- Autenticação de identidade gerida
- Cotas maiores disponíveis

**API OpenAI**: Um provedor/API separado com disponibilidade de modelo, preços, autenticação e opções de conectividade empresarial próprios. Compare as ofertas atuais em vez de presumir que é apenas pela internet pública ou que oferece sempre os modelos em primeiro lugar.

Escolha com base nos requisitos da sua organização; exemplos específicos de Azure de identidade gerida e ligação privada neste curso aplicam-se a serviços alojados no Azure, não a todo o modelo/provedor no catálogo Foundry.
</details>

<details>
<summary><strong>Como resolver erros de quota excedida dos Modelos Microsoft Foundry?</strong></summary>

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

Sim! Use o **Azure AI Search** para RAG (Retrieval Augmented Generation):

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
<summary><strong>Como posso assegurar os endpoints do modelo de IA?</strong></summary>

**Melhores Práticas**:
1. Use Identidade Gerida (sem chaves API)
2. Ative Endpoints Privados
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
- **AZD GitHub**: [Problemas e discussões](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Capacidades de Agente**: [Competência Microsoft Foundry em skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instale as capacidades de agente Azure + Foundry no seu editor com `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: O Seu Primeiro Projeto](../chapter-01-foundation/first-project.md)
- **➡️ Seguinte**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuração](../chapter-03-configuration/configuration.md)

**Precisa de Ajuda?** Participe nas discussões da nossa comunidade ou abra uma issue no repositório. A comunidade Azure AI + AZD está aqui para o ajudar a ter sucesso!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->