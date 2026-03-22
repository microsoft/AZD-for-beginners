# 4. Configurar um Modelo

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Entender o propósito de `azure.yaml`
    - [ ] Entender a estrutura de `azure.yaml`
    - [ ] Entender o valor dos ciclos de vida `hooks` do azd
    - [ ] **Lab 4:** Explorar e modificar variáveis de ambiente

---

!!! prompt "O que o arquivo `azure.yaml` faz? Use um bloco de código e explique linha por linha"

      O arquivo `azure.yaml` é o **arquivo de configuração para o Azure Developer CLI (azd)**. Ele define como sua aplicação deve ser implantada no Azure, incluindo infraestrutura, serviços, ganchos de implantação e variáveis de ambiente.

---

## 1. Propósito e Funcionalidade

Este arquivo `azure.yaml` serve como o **plano de implantação** para uma aplicação de agente de IA que:

1. **Valida o ambiente** antes da implantação
2. **Provisiona serviços de IA do Azure** (AI Hub, AI Project, Search, etc.)
3. **Implanta uma aplicação Python** no Azure Container Apps
4. **Configura modelos de IA** tanto para chat quanto para funcionalidade de embeddings
5. **Configura monitoramento e rastreamento** para a aplicação de IA
6. **Lida com cenários de projeto de IA novos e existentes**

O arquivo permite a **implantação com um comando** (`azd up`) de uma solução completa de agente de IA com validação apropriada, provisionamento e configuração pós-implantação.

??? info "Expandir para visualizar: `azure.yaml`"

      O arquivo `azure.yaml` define como o Azure Developer CLI deve implantar e gerenciar esta aplicação de Agente de IA no Azure. Vamos analisar linha por linha.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

Vamos percorrer o arquivo seção por seção, para entender o que ele faz - e por quê.

### 2.1 **Cabeçalho e Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linha 1**: Fornece validação de esquema para o YAML language server, para suporte ao IDE e IntelliSense

### 2.2 Metadados do Projeto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linha 5**: Define o nome do projeto usado pelo Azure Developer CLI
- **Linhas 6-7**: Especifica que isso é baseado em um template versão 1.0.2
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

- **Linhas 11-20**: **Hook pré-implantação** - executa antes de `azd up`

      - No Unix/Linux: Torna o script de validação executável e o executa
      - No Windows: Executa o script de validação do PowerShell
      - Ambos são interativos e vão interromper a implantação se falharem

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
- **Linhas 21-30**: **Hook pós-provisionamento** - executa após a criação dos recursos do Azure

  - Executa scripts que gravam variáveis de ambiente
  - Continua a implantação mesmo se esses scripts falharem (`continueOnError: true`)

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
- **Linhas 31-40**: **Hook pós-implantação** - executa após a implantação da aplicação

  - Executa scripts de configuração final
  - Continua mesmo se os scripts falharem

### 2.4 Configuração do Serviço (41-48)

Isto configura o serviço da aplicação que você está implantando.

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
- **Linha 45**: Usa o Azure Container Apps como a plataforma de hospedagem
- **Linhas 46-48**: Configuração do Docker

      - Usa "api_and_frontend" como nome da imagem
      - Constrói a imagem Docker remotamente no Azure (não localmente)

### 2.5 Variáveis do Pipeline (49-76)

Estas são variáveis para ajudar a executar `azd` em pipelines de CI/CD para automação

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
      - Nomes dos recursos principais do Azure, por exemplo, Resource Group, AI Hub, AI Project, etc.
- **Flags de recursos (Linhas 61-63)**:
      - Variáveis booleanas para habilitar/desabilitar serviços específicos do Azure
- **Configuração do Agente de IA (Linhas 64-71)**:
      - Configuração para o agente de IA principal incluindo nome, ID, configurações de implantação, detalhes do modelo
- **Configuração de Embeddings de IA (Linhas 72-79)**:
      - Configuração para o modelo de embeddings usado para pesquisa vetorial
- **Pesquisa e Monitoramento (Linhas 80-84)**:
      - Nome do índice de pesquisa, IDs de recursos existentes e configurações de monitoramento/rastreamento

---

## 3. Conheça as Variáveis de Ambiente
As seguintes variáveis de ambiente controlam a configuração e o comportamento da sua implantação, organizadas pelo seu propósito principal. A maioria das variáveis tem valores padrão sensatos, mas você pode personalizá-las para corresponder aos seus requisitos específicos ou recursos existentes do Azure.

### 3.1 Variáveis Obrigatórias 

```bash title="" linenums="0"
# Configuração principal do Azure
AZURE_ENV_NAME                    # Nome do ambiente (usado na nomenclatura de recursos)
AZURE_LOCATION                    # Região de implantação
AZURE_SUBSCRIPTION_ID             # Assinatura de destino
AZURE_RESOURCE_GROUP              # Nome do grupo de recursos
AZURE_PRINCIPAL_ID                # Principal de usuário para RBAC

# Nomes de recursos (Gerados automaticamente se não especificados)
AZURE_AIHUB_NAME                  # Nome do hub do Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nome do projeto de IA
AZURE_AISERVICES_NAME             # Nome da conta de serviços de IA
AZURE_STORAGE_ACCOUNT_NAME        # Nome da conta de armazenamento
AZURE_CONTAINER_REGISTRY_NAME     # Nome do registro de contêineres
AZURE_KEYVAULT_NAME               # Nome do Key Vault (se usado)
```

### 3.2 Configuração do Modelo 
```bash title="" linenums="0"
# Configuração do modelo de chat
AZURE_AI_AGENT_MODEL_NAME         # Padrão: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Padrão: OpenAI (ou Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Padrão: mais recente disponível
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nome de implantação para o modelo de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Padrão: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Padrão: 80 (milhares de TPM)

# Configuração do modelo de embeddings
AZURE_AI_EMBED_MODEL_NAME         # Padrão: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Padrão: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Padrão: mais recente disponível
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nome de implantação para embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Padrão: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Padrão: 50 (milhares de TPM)

# Configuração do agente
AZURE_AI_AGENT_NAME               # Nome de exibição do agente
AZURE_EXISTING_AGENT_ID           # Usar agente existente (opcional)
```

### 3.3 Alternância de recursos
```bash title="" linenums="0"
# Serviços opcionais
USE_APPLICATION_INSIGHTS         # Padrão: true
USE_AZURE_AI_SEARCH_SERVICE      # Padrão: false
USE_CONTAINER_REGISTRY           # Padrão: true

# Monitoramento e rastreamento
ENABLE_AZURE_MONITOR_TRACING     # Padrão: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Padrão: false

# Configuração de pesquisa
AZURE_AI_SEARCH_INDEX_NAME       # Nome do índice de pesquisa
AZURE_SEARCH_SERVICE_NAME        # Nome do serviço de pesquisa
```

### 3.4 Configuração do Projeto de IA 
```bash title="" linenums="0"
# Usar recursos existentes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo do recurso do projeto de IA existente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL do endpoint do projeto existente
```

### 3.5 Verifique Suas Variáveis

Use o Azure Developer CLI para visualizar e gerenciar suas variáveis de ambiente:

```bash title="" linenums="0"
# Exibir todas as variáveis de ambiente do ambiente atual
azd env get-values

# Obter uma variável de ambiente específica
azd env get-value AZURE_ENV_NAME

# Definir uma variável de ambiente
azd env set AZURE_LOCATION eastus

# Definir várias variáveis a partir de um arquivo .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->