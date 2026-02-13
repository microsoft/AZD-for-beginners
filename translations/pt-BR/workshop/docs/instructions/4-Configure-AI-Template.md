# 4. Configurar um Modelo

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Entender o propósito do `azure.yaml`
    - [ ] Entender a estrutura do `azure.yaml`
    - [ ] Entender o valor dos `hooks` de ciclo de vida do azd
    - [ ] **Laboratório 4:** Explorar e modificar variáveis de ambiente

---

!!! prompt "O que o arquivo `azure.yaml` faz? Use um bloco de código e explique linha por linha"

      O arquivo `azure.yaml` é o **arquivo de configuração para o Azure Developer CLI (azd)**. Ele define como sua aplicação deve ser implantada no Azure, incluindo infraestrutura, serviços, hooks de implantação e variáveis de ambiente.

---

## 1. Propósito e Funcionalidade

Este arquivo `azure.yaml` serve como o **plano de implantação** para uma aplicação de agente de IA que:

1. **Valida o ambiente** antes da implantação
2. **Provisiona serviços de IA do Azure** (AI Hub, AI Project, Search, etc.)
3. **Implanta uma aplicação Python** em Azure Container Apps
4. **Configura modelos de IA** para funcionalidades de chat e embeddings
5. **Configura monitoramento e rastreamento** para a aplicação de IA
6. **Lida tanto com cenários de projeto de IA do Azure novos quanto existentes**

O arquivo permite **implantação com um único comando** (`azd up`) de uma solução completa de agente de IA com validação adequada, provisionamento e configuração pós-implantação.

??? info "Expandir para ver: `azure.yaml`"

      O arquivo `azure.yaml` define como o Azure Developer CLI deve implantar e gerenciar esta aplicação de Agente de IA no Azure. Vamos analisar linha por linha.

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

## 2. Analisando o Arquivo

Vamos percorrer o arquivo seção por seção, para entender o que ele faz - e por quê.

### 2.1 **Cabeçalho e Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linha 1**: Fornece validação de esquema do YAML language server para suporte de IDE e IntelliSense

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
- **Linhas 8-9**: Requer Azure Developer CLI versão 1.14.0 ou superior

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

- **Linhas 11-20**: **Hook pré-implantação** — executa antes de `azd up`

      - No Unix/Linux: Torna o script de validação executável e o executa
      - No Windows: Executa o script de validação em PowerShell
      - Ambos são interativos e irão interromper a implantação se falharem

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
- **Linhas 21-30**: **Hook pós-provisionamento** — executa depois que os recursos do Azure são criados

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
- **Linhas 31-40**: **Hook pós-implantação** — executa após a implantação da aplicação

  - Executa scripts de configuração final
  - Continua mesmo se os scripts falharem

### 2.4 Configuração do Serviço (41-48)

Isso configura o serviço de aplicação que você está implantando.

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
- **Linha 43**: Aponta para o diretório `./src` do código-fonte
- **Linha 44**: Especifica Python como a linguagem de programação
- **Linha 45**: Usa Azure Container Apps como plataforma de hospedagem
- **Linhas 46-48**: Configuração do Docker

      - Usa "api_and_frontend" como nome da imagem
      - Constrói a imagem Docker remotamente no Azure (não localmente)

### 2.5 Variáveis de Pipeline (49-76)

Estas são variáveis para ajudar você a executar o `azd` em pipelines de CI/CD para automação

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
      - Nomes de recursos dos serviços principais do Azure, por exemplo, Resource Group, AI Hub, AI Project, etc.
- **Flags de recurso (Linhas 61-63)**:
      - Variáveis booleanas para habilitar/desabilitar serviços específicos do Azure
- **Configuração do Agente de IA (Linhas 64-71)**:
      - Configuração para o agente de IA principal incluindo nome, ID, configurações de implantação, detalhes do modelo
- **Configuração de Embedding de IA (Linhas 72-79)**:
      - Configuração para o modelo de embedding usado para busca vetorial
- **Busca e Monitoramento (Linhas 80-84)**:
      - Nome do índice de busca, IDs de recursos existentes e configurações de monitoramento/rastreamento

---

## 3. Conheça as Variáveis de Ambiente
As seguintes variáveis de ambiente controlam a configuração e o comportamento da sua implantação, organizadas por seu propósito principal. A maioria das variáveis tem valores padrão razoáveis, mas você pode customizá-las para atender aos seus requisitos específicos ou aos recursos existentes do Azure.

### 3.1 Variáveis Obrigatórias 

```bash title="" linenums="0"
# Configuração principal do Azure
AZURE_ENV_NAME                    # Nome do ambiente (usado na nomeação de recursos)
AZURE_LOCATION                    # Região de implantação
AZURE_SUBSCRIPTION_ID             # Assinatura de destino
AZURE_RESOURCE_GROUP              # Nome do grupo de recursos
AZURE_PRINCIPAL_ID                # Principal de usuário para RBAC

# Nomes de recursos (gerados automaticamente se não especificados)
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
AZURE_AI_AGENT_MODEL_NAME         # Padrão: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Padrão: OpenAI (ou Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Padrão: mais recente disponível
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nome de implantação para o modelo de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Padrão: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Padrão: 80 (milhares de TPM)

# Configuração do modelo de embedding
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

### 3.3 Alternância de Recursos
```bash title="" linenums="0"
# Serviços Opcionais
USE_APPLICATION_INSIGHTS         # Padrão: true
USE_AZURE_AI_SEARCH_SERVICE      # Padrão: false
USE_CONTAINER_REGISTRY           # Padrão: true

# Monitoramento e Rastreamento
ENABLE_AZURE_MONITOR_TRACING     # Padrão: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Padrão: false

# Configuração de Pesquisa
AZURE_AI_SEARCH_INDEX_NAME       # Nome do índice de pesquisa
AZURE_SEARCH_SERVICE_NAME        # Nome do serviço de pesquisa
```

### 3.4 Configuração do Projeto de IA 
```bash title="" linenums="0"
# Usar recursos existentes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo do recurso do projeto de IA existente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL do endpoint do projeto existente
```

### 3.5 Verifique suas Variáveis

Use o Azure Developer CLI para visualizar e gerenciar suas variáveis de ambiente:

```bash title="" linenums="0"
# Ver todas as variáveis de ambiente do ambiente atual
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
Isenção de responsabilidade:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->