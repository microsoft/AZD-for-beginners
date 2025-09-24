<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T15:04:59+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "br"
}
-->
# 4. Configure um Template

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Compreender o propósito do `azure.yaml`
    - [ ] Compreender a estrutura do `azure.yaml`
    - [ ] Compreender o valor dos `hooks` no ciclo de vida do azd
    - [ ] **Lab 3:** 

---

!!! prompt "O que o arquivo `azure.yaml` faz? Use um bloco de código e explique linha por linha"

      O arquivo `azure.yaml` é o **arquivo de configuração para o Azure Developer CLI (azd)**. Ele define como sua aplicação deve ser implantada no Azure, incluindo infraestrutura, serviços, hooks de implantação e variáveis de ambiente.

---

## 1. Propósito e Funcionalidade

Este arquivo `azure.yaml` serve como o **plano de implantação** para uma aplicação de agente de IA que:

1. **Valida o ambiente** antes da implantação
2. **Provisiona serviços de IA do Azure** (AI Hub, AI Project, Search, etc.)
3. **Implanta uma aplicação Python** no Azure Container Apps
4. **Configura modelos de IA** para funcionalidade de chat e embedding
5. **Configura monitoramento e rastreamento** para a aplicação de IA
6. **Lida com cenários de projetos de IA do Azure novos e existentes**

O arquivo permite a **implantação com um único comando** (`azd up`) de uma solução completa de agente de IA com validação adequada, provisionamento e configuração pós-implantação.

??? info "Expandir para ver: `azure.yaml`"

      O arquivo `azure.yaml` define como o Azure Developer CLI deve implantar e gerenciar esta aplicação de agente de IA no Azure. Vamos analisá-lo linha por linha.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: precisamos de hooks? 
      # TODO: precisamos de todas as variáveis?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Decompondo o Arquivo

Vamos analisar o arquivo seção por seção, para entender o que ele faz - e por quê.

### 2.1 **Cabeçalho e Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linha 1**: Fornece validação de esquema do servidor de linguagem YAML para suporte em IDEs e IntelliSense

### 2.2 Metadados do Projeto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linha 5**: Define o nome do projeto usado pelo Azure Developer CLI
- **Linhas 6-7**: Especifica que este projeto é baseado na versão 1.0.2 de um template
- **Linhas 8-9**: Requer a versão 1.14.0 ou superior do Azure Developer CLI

### 2.3 Hooks de Implantação (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Linhas 11-20**: **Hook pré-implantação** - executado antes do comando `azd up`

      - Em Unix/Linux: Torna o script de validação executável e o executa
      - Em Windows: Executa o script de validação em PowerShell
      - Ambos são interativos e interrompem a implantação se falharem

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Linhas 21-30**: **Hook pós-provisionamento** - executado após a criação dos recursos do Azure

  - Executa scripts para escrever variáveis de ambiente
  - Continua a implantação mesmo que esses scripts falhem (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Linhas 31-40**: **Hook pós-implantação** - executado após a implantação da aplicação

  - Executa scripts de configuração final
  - Continua mesmo que os scripts falhem

### 2.4 Configuração de Serviço (41-48)

Esta seção configura o serviço da aplicação que você está implantando.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Linha 42**: Define um serviço chamado "api_and_frontend"
- **Linha 43**: Aponta para o diretório `./src` para o código-fonte
- **Linha 44**: Especifica Python como a linguagem de programação
- **Linha 45**: Usa Azure Container Apps como plataforma de hospedagem
- **Linhas 46-48**: Configuração do Docker

      - Usa "api_and_frontend" como o nome da imagem
      - Constrói a imagem Docker remotamente no Azure (não localmente)

### 2.5 Variáveis de Pipeline (49-76)

Estas são variáveis para ajudar a executar o `azd` em pipelines CI/CD para automação

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Esta seção define variáveis de ambiente usadas **durante a implantação**, organizadas por categoria:

- **Nomes de Recursos do Azure (Linhas 51-60)**:
      - Nomes de recursos principais do serviço Azure, como Resource Group, AI Hub, AI Project, etc.
- **Flags de Funcionalidade (Linhas 61-63)**:
      - Variáveis booleanas para habilitar/desabilitar serviços específicos do Azure
- **Configuração do Agente de IA (Linhas 64-71)**:
      - Configuração para o agente de IA principal, incluindo nome, ID, configurações de implantação e detalhes do modelo
- **Configuração de Embedding de IA (Linhas 72-79)**:
      - Configuração para o modelo de embedding usado para busca vetorial
- **Busca e Monitoramento (Linhas 80-84)**:
      - Nome do índice de busca, IDs de recursos existentes e configurações de monitoramento/rastreamento

---

## 3. Conheça as Variáveis de Ambiente

As variáveis de ambiente a seguir controlam a configuração e o comportamento da sua implantação, organizadas por seu propósito principal. A maioria das variáveis tem valores padrão sensatos, mas você pode personalizá-las para atender aos seus requisitos específicos ou recursos existentes no Azure.

### 3.1 Variáveis Necessárias 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Configuração de Modelos 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Alternância de Funcionalidades
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Configuração do Projeto de IA 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Verifique suas Variáveis

Use o Azure Developer CLI para visualizar e gerenciar suas variáveis de ambiente:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

