# 4. Configurar um Modelo

!!! tip "AO FINAL DESTE MÓDULO SERÁS CAPAZ DE"

    - [ ] Compreender o propósito do `azure.yaml`
    - [ ] Compreender a estrutura do `azure.yaml`
    - [ ] Compreender o valor dos `hooks` do ciclo de vida do azd
    - [ ] **Laboratório 4:** Explorar e modificar variáveis de ambiente

---

!!! prompt "Para que serve o ficheiro `azure.yaml`? Usa uma cerca de código e explica-o linha a linha"

      O ficheiro `azure.yaml` é o **ficheiro de configuração para o Azure Developer CLI (azd)**. Define como a tua aplicação deve ser implantada no Azure, incluindo infraestruturas, serviços, hooks de implantação e variáveis de ambiente.

---

## 1. Propósito e Funcionalidade

Este ficheiro `azure.yaml` serve como o **plano de implantação** para uma aplicação agente de IA que:

1. **Valida o ambiente** antes da implantação
2. **Disponibiliza serviços Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Implanta uma aplicação Python** em Azure Container Apps
4. **Configura modelos AI** para funcionalidades de chat e embedding
5. **Configura monitorização e rastreio** para a aplicação AI
6. **Trata cenários de projetos AI Azure novos e existentes**

O ficheiro permite a **implantação através de um único comando** (`azd up`) de uma solução completa de agente AI com validação, disponibilização e configuração pós-implantação adequadas.

??? info "Expandir para Ver: `azure.yaml`"

      O ficheiro `azure.yaml` define como o Azure Developer CLI deve implantar e gerir esta aplicação Agente AI no Azure. Vamos explicar linha a linha.

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

## 2. Desconstrução do Ficheiro

Vamos analisar o ficheiro seção a seção, para entender o que faz — e porquê.

### 2.1 **Cabeçalho e Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linha 1**: Fornece validação do esquema para o servidor de linguagem YAML, para suporte IDE e IntelliSense

### 2.2 Metadados do Projeto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linha 5**: Define o nome do projeto usado pelo Azure Developer CLI
- **Linhas 6-7**: Especifica que está baseado numa versão de modelo 1.0.2
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

- **Linhas 11-20**: **Hook pré-implantação** — executa antes do `azd up`

      - No Unix/Linux: Torna o script de validação executável e o executa
      - No Windows: Executa o script PowerShell de validação
      - Ambos são interativos e irão parar a implantação se falharem

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
- **Linhas 21-30**: **Hook pós-provisionamento** — executa após a criação dos recursos Azure

  - Executa scripts para escrita de variáveis de ambiente
  - Continua a implantação mesmo se estes scripts falharem (`continueOnError: true`)

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

Isto configura o serviço da aplicação que estás a implantar.

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
- **Linha 45**: Usa Azure Container Apps como plataforma de alojamento
- **Linhas 46-48**: Configuração Docker

      - Usa "api_and_frontend" como nome da imagem
      - Constrói a imagem Docker remotamente no Azure (não localmente)

### 2.5 Variáveis do Pipeline (49-76)

Estas são variáveis para te ajudar a correr o `azd` em pipelines CI/CD para automação

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

- **Nomes de Recursos Azure (Linhas 51-60)**:
      - Nomes dos principais recursos Azure, por exemplo, Grupo de Recursos, AI Hub, AI Project, etc.
- **Flags de Funcionalidade (Linhas 61-63)**:
      - Variáveis booleanas para ativar/desativar serviços Azure específicos
- **Configuração do Agente AI (Linhas 64-71)**:
      - Configuração do agente AI principal incluindo nome, ID, definições de implantação, detalhes do modelo
- **Configuração do Embedding AI (Linhas 72-79)**:
      - Configuração do modelo embedding usado na pesquisa vetorial
- **Pesquisa e Monitorização (Linhas 80-84)**:
      - Nome do índice de pesquisa, IDs de recursos existentes, configurações de monitorização/rastreio

---

## 3. Conhecer as Variáveis de Ambiente
As seguintes variáveis de ambiente controlam a configuração e o comportamento da tua implantação, organizadas pelo seu propósito principal. A maioria das variáveis tem valores predefinidos sensatos, mas podes personalizá-las para corresponder aos teus requisitos ou recursos Azure existentes.

### 3.1 Variáveis Obrigatórias

```bash title="" linenums="0"
# Configuração principal do Azure
AZURE_ENV_NAME                    # Nome do ambiente (usado na nomeação dos recursos)
AZURE_LOCATION                    # Região de implantação
AZURE_SUBSCRIPTION_ID             # Subscrição alvo
AZURE_RESOURCE_GROUP              # Nome do grupo de recursos
AZURE_PRINCIPAL_ID                # Principal do utilizador para RBAC

# Nomes dos recursos (gerados automaticamente se não especificados)
AZURE_AIHUB_NAME                  # Nome do hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nome do projeto AI
AZURE_AISERVICES_NAME             # Nome da conta de serviços AI
AZURE_STORAGE_ACCOUNT_NAME        # Nome da conta de armazenamento
AZURE_CONTAINER_REGISTRY_NAME     # Nome do registo de contentores
AZURE_KEYVAULT_NAME               # Nome do Key Vault (se usado)
```

### 3.2 Configuração do Modelo  
```bash title="" linenums="0"
# Configuração do Modelo de Chat
AZURE_AI_AGENT_MODEL_NAME         # Predefinição: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Predefinição: OpenAI (ou Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Predefinição: mais recente disponível
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nome de implementação para o modelo de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Predefinição: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Predefinição: 80 (milhares de TPM)

# Configuração do Modelo de Embedding
AZURE_AI_EMBED_MODEL_NAME         # Predefinição: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Predefinição: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Predefinição: mais recente disponível
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nome de implementação para embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Predefinição: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Predefinição: 50 (milhares de TPM)

# Configuração do Agente
AZURE_AI_AGENT_NAME               # Nome de exibição do agente
AZURE_EXISTING_AGENT_ID           # Usar agente existente (opcional)
```

### 3.3 Ativação de Funcionalidades  
```bash title="" linenums="0"
# Serviços Opcionais
USE_APPLICATION_INSIGHTS         # Padrão: verdadeiro
USE_AZURE_AI_SEARCH_SERVICE      # Padrão: falso
USE_CONTAINER_REGISTRY           # Padrão: verdadeiro

# Monitorização e Rastreio
ENABLE_AZURE_MONITOR_TRACING     # Padrão: falso
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Padrão: falso

# Configuração de Pesquisa
AZURE_AI_SEARCH_INDEX_NAME       # Nome do índice de pesquisa
AZURE_SEARCH_SERVICE_NAME        # Nome do serviço de pesquisa
```

### 3.4 Configuração do Projeto AI  
```bash title="" linenums="0"
# Utilizar Recursos Existentes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo do recurso de projeto de IA existente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL do endpoint do projeto existente
```

### 3.5 Verifica as Tuas Variáveis

Usa o Azure Developer CLI para visualizar e gerir as tuas variáveis de ambiente:

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
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->