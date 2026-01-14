<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T10:02:23+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "pt"
}
-->
# 3. Desconstruir um Template

!!! tip "NO FINAL DESTE MÓDULO, SERÁ CAPAZ DE"

    - [ ] Item
    - [ ] Item
    - [ ] Item
    - [ ] **Laboratório 3:** 

---

Com os templates AZD e a Azure Developer CLI (`azd`), podemos iniciar rapidamente a nossa jornada de desenvolvimento de IA com repositórios padronizados que fornecem código de exemplo, infraestrutura e ficheiros de configuração - na forma de um projeto _starter_ pronto para ser implementado.

**Mas agora, precisamos entender a estrutura do projeto e a base de código - e ser capazes de personalizar o template AZD - sem qualquer experiência ou conhecimento prévio de AZD!**

---

## 1. Ativar o GitHub Copilot

### 1.1 Instalar o GitHub Copilot Chat

É hora de explorar o [GitHub Copilot com o Modo Agente](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Agora, podemos usar linguagem natural para descrever a nossa tarefa de forma geral e obter assistência na execução. Para este laboratório, utilizaremos o [plano gratuito do Copilot](https://github.com/github-copilot/signup), que tem um limite mensal para interações de conclusão e chat.

A extensão pode ser instalada a partir do marketplace, mas já deve estar disponível no seu ambiente Codespaces. _Clique em `Open Chat` no menu suspenso do ícone do Copilot - e escreva um prompt como `What can you do?`_ - poderá ser solicitado a iniciar sessão. **O GitHub Copilot Chat está pronto**.

### 1.2. Instalar Servidores MCP

Para que o Modo Agente seja eficaz, ele precisa de acesso às ferramentas certas para ajudar a recuperar conhecimento ou executar ações. É aqui que os servidores MCP podem ajudar. Vamos configurar os seguintes servidores:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Para ativá-los:

1. Crie um ficheiro chamado `.vscode/mcp.json` se ainda não existir
1. Copie o seguinte para esse ficheiro - e inicie os servidores!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Pode receber um erro indicando que `npx` não está instalado (clique para expandir e corrigir)"

      Para corrigir, abra o ficheiro `.devcontainer/devcontainer.json` e adicione esta linha à secção de funcionalidades. Depois, reconstrua o container. Agora deverá ter o `npx` instalado.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testar o GitHub Copilot Chat

**Primeiro, use `az login` para autenticar com o Azure a partir da linha de comando do VS Code.**

Agora deverá ser capaz de consultar o estado da sua subscrição Azure e fazer perguntas sobre recursos ou configurações implementadas. Experimente estes prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Também pode fazer perguntas sobre a documentação do Azure e obter respostas baseadas no servidor MCP do Microsoft Docs. Experimente estes prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ou pode pedir exemplos de código para completar uma tarefa. Experimente este prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

No modo `Ask`, isto fornecerá código que pode copiar e testar. No modo `Agent`, isto pode ir um passo além e criar os recursos relevantes para si - incluindo scripts de configuração e documentação - para ajudar na execução da tarefa.

**Agora está preparado para começar a explorar o repositório do template**

---

## 2. Desconstruir Arquitetura

??? prompt "PERGUNTAR: Explique a arquitetura da aplicação em docs/images/architecture.png em 1 parágrafo"

      Esta aplicação é uma aplicação de chat alimentada por IA construída no Azure que demonstra uma arquitetura moderna baseada em agentes. A solução centra-se numa Azure Container App que hospeda o código principal da aplicação, que processa a entrada do utilizador e gera respostas inteligentes através de um agente de IA. 
      
      A arquitetura utiliza o Projeto Azure AI Foundry como base para as capacidades de IA, conectando-se aos Serviços de IA do Azure que fornecem os modelos de linguagem subjacentes (como GPT-4o-mini) e funcionalidade de agente. As interações dos utilizadores fluem através de um frontend baseado em React para um backend FastAPI que comunica com o serviço de agente de IA para gerar respostas contextuais. 
      
      O sistema incorpora capacidades de recuperação de conhecimento através de pesquisa de ficheiros ou do serviço Azure AI Search, permitindo que o agente aceda e cite informações de documentos carregados. Para excelência operacional, a arquitetura inclui monitorização abrangente através do Application Insights e do Log Analytics Workspace para rastreamento, registo e otimização de desempenho. 
      
      O Azure Storage fornece armazenamento de blobs para dados da aplicação e carregamento de ficheiros, enquanto a Identidade Gerida garante acesso seguro entre recursos do Azure sem armazenar credenciais. Toda a solução é projetada para escalabilidade e manutenção, com a aplicação conteinerizada a escalar automaticamente com base na procura, enquanto fornece segurança, monitorização e capacidades de CI/CD integradas através do ecossistema de serviços geridos do Azure.

![Architecture](../../../../../translated_images/architecture.48d94861e6e6cdc0.pt.png)

---

## 3. Estrutura do Repositório

!!! prompt "PERGUNTAR: Explique a estrutura da pasta do template. Comece com um diagrama hierárquico visual."

??? info "RESPOSTA: Diagrama Hierárquico Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuração e Setup
      │   ├── azure.yaml                    # Configuração da Azure Developer CLI
      │   ├── docker-compose.yaml           # Containers de desenvolvimento local
      │   ├── pyproject.toml                # Configuração do projeto Python
      │   ├── requirements-dev.txt          # Dependências de desenvolvimento
      │   └── .devcontainer/                # Configuração do dev container do VS Code
      │
      ├── 🏗️ Infraestrutura (infra/)
      │   ├── main.bicep                    # Template principal de infraestrutura
      │   ├── api.bicep                     # Recursos específicos da API
      │   ├── main.parameters.json          # Parâmetros de infraestrutura
      │   └── core/                         # Componentes modulares de infraestrutura
      │       ├── ai/                       # Configurações de serviços de IA
      │       ├── host/                     # Infraestrutura de hospedagem
      │       ├── monitor/                  # Monitorização e registo
      │       ├── search/                   # Configuração do Azure AI Search
      │       ├── security/                 # Segurança e identidade
      │       └── storage/                  # Configurações de conta de armazenamento
      │
      ├── 💻 Código Fonte da Aplicação (src/)
      │   ├── api/                          # API Backend
      │   │   ├── main.py                   # Entrada da aplicação FastAPI
      │   │   ├── routes.py                 # Definições de rotas da API
      │   │   ├── search_index_manager.py   # Funcionalidade de pesquisa
      │   │   ├── data/                     # Manipulação de dados da API
      │   │   ├── static/                   # Recursos web estáticos
      │   │   └── templates/                # Templates HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependências Node.js
      │   │   ├── vite.config.ts            # Configuração de build Vite
      │   │   └── src/                      # Código fonte do frontend
      │   ├── data/                         # Ficheiros de dados de exemplo
      │   │   └── embeddings.csv            # Embeddings pré-computados
      │   ├── files/                        # Ficheiros da base de conhecimento
      │   │   ├── customer_info_*.json      # Exemplos de dados de clientes
      │   │   └── product_info_*.md         # Documentação de produtos
      │   ├── Dockerfile                    # Configuração de container
      │   └── requirements.txt              # Dependências Python
      │
      ├── 🔧 Automação e Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Configuração pós-implementação
      │   ├── setup_credential.sh/.ps1     # Configuração de credenciais
      │   ├── validate_env_vars.sh/.ps1    # Validação de variáveis de ambiente
      │   └── resolve_model_quota.sh/.ps1  # Gestão de quotas de modelo
      │
      ├── 🧪 Testes e Avaliação
      │   ├── tests/                        # Testes unitários e de integração
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework de avaliação de agentes
      │   │   ├── evaluate.py               # Executor de avaliação
      │   │   ├── eval-queries.json         # Consultas de teste
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Playground de desenvolvimento
      │   │   ├── 1-quickstart.py           # Exemplos de introdução
      │   │   └── aad-interactive-chat.py   # Exemplos de autenticação
      │   └── airedteaming/                 # Avaliação de segurança de IA
      │       └── ai_redteaming.py          # Testes de red team
      │
      ├── 📚 Documentação (docs/)
      │   ├── deployment.md                 # Guia de implementação
      │   ├── local_development.md          # Instruções de configuração local
      │   ├── troubleshooting.md            # Problemas comuns e soluções
      │   ├── azure_account_setup.md        # Pré-requisitos do Azure
      │   └── images/                       # Recursos da documentação
      │
      └── 📄 Metadados do Projeto
         ├── README.md                     # Visão geral do projeto
         ├── CODE_OF_CONDUCT.md           # Diretrizes da comunidade
         ├── CONTRIBUTING.md              # Guia de contribuição
         ├── LICENSE                      # Termos de licença
         └── next-steps.md                # Orientação pós-implementação
      ```

### 3.1. Arquitetura Principal da Aplicação

Este template segue um padrão de **aplicação web full-stack** com:

- **Backend**: Python FastAPI com integração Azure AI
- **Frontend**: TypeScript/React com sistema de build Vite
- **Infraestrutura**: Templates Azure Bicep para recursos na cloud
- **Containerização**: Docker para implementação consistente

### 3.2 Infraestrutura como Código (bicep)

A camada de infraestrutura utiliza templates **Azure Bicep** organizados de forma modular:

   - **`main.bicep`**: Orquestra todos os recursos do Azure
   - **Módulos `core/`**: Componentes reutilizáveis para diferentes serviços
      - Serviços de IA (Azure OpenAI, AI Search)
      - Hospedagem de containers (Azure Container Apps)
      - Monitorização (Application Insights, Log Analytics)
      - Segurança (Key Vault, Identidade Gerida)

### 3.3 Código Fonte da Aplicação (`src/`)

**API Backend (`src/api/`)**:

- API REST baseada em FastAPI
- Integração com o serviço de agente Azure AI
- Gestão de índice de pesquisa para recuperação de conhecimento
- Capacidades de carregamento e processamento de ficheiros

**Frontend (`src/frontend/`)**:

- SPA moderna em React/TypeScript
- Vite para desenvolvimento rápido e builds otimizados
- Interface de chat para interações com o agente

**Base de Conhecimento (`src/files/`)**:

- Exemplos de dados de clientes e produtos
- Demonstra recuperação de conhecimento baseada em ficheiros
- Exemplos em formato JSON e Markdown

### 3.4 DevOps e Automação

**Scripts (`scripts/`)**:

- Scripts cross-platform em PowerShell e Bash
- Validação e configuração de ambiente
- Configuração pós-implementação
- Gestão de quotas de modelo

**Integração com Azure Developer CLI**:

- Configuração `azure.yaml` para fluxos de trabalho `azd`
- Provisionamento e implementação automatizados
- Gestão de variáveis de ambiente

### 3.5 Testes e Garantia de Qualidade

**Framework de Avaliação (`evals/`)**:

- Avaliação de desempenho do agente
- Testes de qualidade de consulta-resposta
- Pipeline de avaliação automatizado

**Segurança de IA (`airedteaming/`)**:

- Testes de red team para segurança de IA
- Scanning de vulnerabilidades de segurança
- Práticas de IA responsável

---

## 4. Parabéns 🏆

Utilizou com sucesso o GitHub Copilot Chat com servidores MCP para explorar o repositório.

- [X] Ativou o GitHub Copilot para Azure
- [X] Compreendeu a Arquitetura da Aplicação
- [X] Explorou a estrutura do template AZD

Isto dá-lhe uma ideia dos ativos de _infraestrutura como código_ deste template. A seguir, vamos analisar o ficheiro de configuração do AZD.

---

