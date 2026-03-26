# 4. Configurar um Modelo

!!! tip "AO FINAL DESTE MÓDULO SERÁ CAPAZ DE"

    - [ ] Compreender o propósito do `azure.yaml`
    - [ ] Compreender a estrutura do `azure.yaml`
    - [ ] Compreender o valor dos `hooks` no ciclo de vida do azd
    - [ ] **Laboratório 4:** Explorar e modificar variáveis de ambiente

---

!!! prompt "Para que serve o ficheiro `azure.yaml`? Use um bloco de código para o explicar linha a linha"

      O ficheiro `azure.yaml` é o **ficheiro de configuração para o Azure Developer CLI (azd)**. Define como a sua aplicação deve ser implantada no Azure, incluindo infraestrutura, serviços, hooks de implantação e variáveis de ambiente.

---

## 1. Propósito e Funcionalidade

Este ficheiro `azure.yaml` serve como o **plano de implantação** para uma aplicação agente de IA que:

1. **Valida o ambiente** antes da implantação
2. **Provisiona serviços Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Implanta uma aplicação Python** no Azure Container Apps
4. **Configura modelos de IA** para funcionalidade de chat e embedding
5. **Configura monitorização e tracing** para a aplicação de IA
6. **Trata cenários de projetos Azure AI novos e existentes**

O ficheiro permite a **implantação com um único comando** (`azd up`) de uma solução completa de agente IA com validação adequada, provisionamento e configuração após implantação.

??? info "Expandir Para Visualizar: `azure.yaml`"

      O ficheiro `azure.yaml` define como o Azure Developer CLI deve implantar e gerir esta aplicação Agente IA no Azure. Vamos analisá-lo linha a linha.

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

## 2. Análise do Ficheiro

Vamos analisar o ficheiro seção por seção, para perceber o que faz – e porquê.

### 2.1 **Cabeçalho e Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linha 1**: Fornece validação do esquema para o serviço de linguagem YAML, suportando IDE e IntelliSense

### 2.2 Metadados do Projeto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linha 5**: Define o nome do projeto usado pelo Azure Developer CLI
- **Linhas 6-7**: Especifica que se baseia num modelo versão 1.0.2
- **Linhas 8-9**: Requer versão 1.14.0 ou superior do Azure Developer CLI

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

- **Linhas 11-20**: **Hook pré-implantação** - corre antes do `azd up`

      - No Unix/Linux: torna o script de validação executável e executa-o
      - No Windows: executa script PowerShell de validação
      - Ambos são interativos e bloqueiam a implantação se falharem

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
- **Linhas 21-30**: **Hook pós-provisionamento** - corre após a criação dos recursos Azure

  - Executa scripts que escrevem variáveis de ambiente
  - Continua a implantação mesmo que os scripts falhem (`continueOnError: true`)

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
- **Linhas 31-40**: **Hook pós-implantação** - corre após a implantação da aplicação

  - Executa scripts finais de configuração
  - Continua mesmo que os scripts falhem

### 2.4 Configuração do Serviço (41-48)

Configura o serviço de aplicação que está a implantar.

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
- **Linha 44**: Especifica Python como linguagem de programação
- **Linha 45**: Usa Azure Container Apps como plataforma de alojamento
- **Linhas 46-48**: Configuração Docker

      - Usa "api_and_frontend" como nome da imagem
      - Constrói a imagem Docker remotamente no Azure (não localmente)

### 2.5 Variáveis do Pipeline (49-76)

Estas variáveis ajudam a correr o `azd` em pipelines CI/CD para automação

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

- **Nomes dos Recursos Azure (Linhas 51-60)**:
      - Nomes dos recursos principais do Azure, ex: Grupo de Recursos, AI Hub, AI Project, etc.
- **Flags de Funcionalidade (Linhas 61-63)**:
      - Variáveis booleanas para ativar/desativar serviços Azure específicos
- **Configuração do Agente IA (Linhas 64-71)**:
      - Configuração para o agente IA principal incluindo nome, ID, definições de implantação, detalhes do modelo
- **Configuração do Embedding IA (Linhas 72-79)**:
      - Configuração para o modelo de embedding usado para pesquisa vetorial
- **Pesquisa e Monitorização (Linhas 80-84)**:
      - Nome do índice de pesquisa, IDs de recursos existentes, e definições de monitorização/tracing

---

## 3. Conhecer as Variáveis de Ambiente
As seguintes variáveis de ambiente controlam a configuração e comportamento da sua implantação, organizadas pelo seu propósito principal. A maioria das variáveis tem valores predefinidos sensatos, mas pode personalizá-las para corresponder às suas necessidades específicas ou recursos Azure existentes.

### 3.1 Variáveis Obrigatórias 

```bash title="" linenums="0"
# Configuração Central do Azure
AZURE_ENV_NAME                    # Nome do ambiente (utilizado na nomeação de recursos)
AZURE_LOCATION                    # Região de implantação
AZURE_SUBSCRIPTION_ID             # Subscrição alvo
AZURE_RESOURCE_GROUP              # Nome do grupo de recursos
AZURE_PRINCIPAL_ID                # Principal do utilizador para RBAC

# Nomes dos recursos (Gerados automaticamente se não especificados)
AZURE_AIHUB_NAME                  # Nome do hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nome do projeto de IA
AZURE_AISERVICES_NAME             # Nome da conta de serviços de IA
AZURE_STORAGE_ACCOUNT_NAME        # Nome da conta de armazenamento
AZURE_CONTAINER_REGISTRY_NAME     # Nome do registo do contentor
AZURE_KEYVAULT_NAME               # Nome do Key Vault (se utilizado)
```

### 3.2 Configuração do Modelo 
```bash title="" linenums="0"
# Configuração do Modelo de Chat
AZURE_AI_AGENT_MODEL_NAME         # Padrão: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Padrão: OpenAI (ou Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Padrão: mais recente disponível
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nome de implantação para o modelo de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Padrão: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Padrão: 80 (milhares de TPM)

# Configuração do Modelo de Embedding
AZURE_AI_EMBED_MODEL_NAME         # Padrão: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Padrão: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Padrão: mais recente disponível
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nome de implantação para embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Padrão: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Padrão: 50 (milhares de TPM)

# Configuração do Agente
AZURE_AI_AGENT_NAME               # Nome de exibição do agente
AZURE_EXISTING_AGENT_ID           # Usar agente existente (opcional)
```

### 3.3 Alternador de Funcionalidade
```bash title="" linenums="0"
# Serviços Opcionais
USE_APPLICATION_INSIGHTS         # Predefinição: true
USE_AZURE_AI_SEARCH_SERVICE      # Predefinição: false
USE_CONTAINER_REGISTRY           # Predefinição: true

# Monitorização e Rastreamento
ENABLE_AZURE_MONITOR_TRACING     # Predefinição: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Predefinição: false

# Configuração de Pesquisa
AZURE_AI_SEARCH_INDEX_NAME       # Nome do índice de pesquisa
AZURE_SEARCH_SERVICE_NAME        # Nome do serviço de pesquisa
```

### 3.4 Configuração do Projeto IA 
```bash title="" linenums="0"
# Usar Recursos Existentes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo do recurso do projeto de IA existente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL do endpoint do projeto existente
```

### 3.5 Verificar as Suas Variáveis

Use o Azure Developer CLI para ver e gerir as suas variáveis de ambiente:

```bash title="" linenums="0"
# Ver todas as variáveis de ambiente para o ambiente atual
azd env get-values

# Obter uma variável de ambiente específica
azd env get-value AZURE_ENV_NAME

# Definir uma variável de ambiente
azd env set AZURE_LOCATION eastus

# Definir múltiplas variáveis a partir de um ficheiro .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional por um humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->