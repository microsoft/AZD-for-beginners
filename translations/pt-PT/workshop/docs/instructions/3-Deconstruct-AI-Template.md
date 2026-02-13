# 3. Desconstruir um Template

!!! tip "NO FINAL DESTE MÓDULO SERÁS CAPAZ DE"

    - [ ] Ativar o GitHub Copilot com servidores MCP para assistência Azure
    - [ ] Compreender a estrutura de pastas e componentes do template AZD
    - [ ] Explorar padrões de organização de infraestrutura como código (Bicep)
    - [ ] **Lab 3:** Utilizar o GitHub Copilot para explorar e compreender a arquitetura do repositório

---

Com os templates AZD e a Azure Developer CLI (`azd`) podemos rapidamente iniciar a nossa jornada de desenvolvimento de IA com repositórios padronizados que fornecem código de exemplo, infraestrutura e ficheiros de configuração - na forma de um projeto _starter_ pronto a implantar.

**Mas agora, precisamos de compreender a estrutura do projeto e a base de código - e ser capazes de personalizar o template AZD - sem qualquer experiência ou conhecimento prévio de AZD!**

---

## 1. Ativar o GitHub Copilot

### 1.1 Instalar o GitHub Copilot Chat

É tempo de explorar o [GitHub Copilot com Modo Agente](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Agora, podemos usar linguagem natural para descrever a nossa tarefa a um nível elevado e receber assistência na execução. Para este laboratório, usaremos o [plano gratuito do Copilot](https://github.com/github-copilot/signup) que tem um limite mensal para conclusões e interações de chat.

A extensão pode ser instalada a partir do marketplace, mas deverá já estar disponível no teu ambiente Codespaces. _Clica em `Open Chat` no menu suspenso do ícone do Copilot - e escreve um prompt como `What can you do?`_ - podes ser solicitado a iniciar sessão. **O GitHub Copilot Chat está pronto**.

### 1.2. Instalar Servidores MCP

Para que o modo Agente seja eficaz, é necessário ter acesso às ferramentas certas para ajudar a recuperar conhecimentos ou executar ações. É aqui que os servidores MCP são úteis. Vamos configurar os seguintes servidores:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Para ativá-los:

1. Cria um ficheiro chamado `.vscode/mcp.json` se não existir
1. Copia o seguinte para esse ficheiro - e inicia os servidores!
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

??? warning "Poderás receber um erro indicando que `npx` não está instalado (clica para expandir solução)"

      Para corrigir, abre o ficheiro `.devcontainer/devcontainer.json` e adiciona esta linha à secção de features. Depois reconstrói o container. Deverás agora ter o `npx` instalado.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testar o GitHub Copilot Chat

**Usa primeiro o `az login` para autenticar com Azure através da linha de comando do VS Code.**

Agora deverás conseguir consultar o estado da tua subscrição Azure e colocar questões sobre recursos implementados ou configuração. Tenta estes prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Também podes perguntar sobre documentação Azure e obter respostas baseadas no servidor Microsoft Docs MCP. Tenta estes prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ou podes pedir snippets de código para completar uma tarefa. Tenta este prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

No modo `Ask`, isto irá fornecer código que podes copiar e colar para experimentar. No modo `Agent`, pode ir mais longe e criar os recursos relevantes para ti - incluindo scripts de configuração e documentação - para ajudar a executar essa tarefa.

**Estás agora equipado para começar a explorar o repositório de templates**

---

## 2. Desconstruir a Arquitetura

??? prompt "PERGUNTA: Explica a arquitetura da aplicação em docs/images/architecture.png em 1 parágrafo"

      Esta aplicação é uma aplicação de chat alimentada por IA construída na Azure que demonstra uma arquitetura moderna baseada em agentes. A solução centra-se numa Azure Container App que hospeda o código principal da aplicação, que processa a entrada do utilizador e gera respostas inteligentes através de um agente de IA.
      
      A arquitetura aproveita o Microsoft Foundry Project como base para as capacidades de IA, conectando-se aos Azure AI Services que fornecem os modelos de linguagem subjacentes (como o GPT-4o-mini) e a funcionalidade de agente.
      
      As interações do utilizador fluem através de um frontend baseado em React para um backend FastAPI que comunica com o serviço do agente de IA para gerar respostas contextuais.
      
      O sistema incorpora capacidades de recuperação de conhecimento através de pesquisa de ficheiros ou do serviço Azure AI Search, permitindo que o agente aceda e cite informação a partir de documentos carregados.
      
      Para excelência operacional, a arquitetura inclui monitorização abrangente através do Application Insights e do Log Analytics Workspace para tracing, logging e otimização de performance.
      
      O Azure Storage fornece armazenamento blob para dados da aplicação e carregamentos de ficheiros, enquanto a Managed Identity assegura acesso seguro entre recursos Azure sem armazenar credenciais.
      
      Toda a solução foi desenhada para escalabilidade e manutenção, com a aplicação conteinerizada a escalar automaticamente consoante a procura, enquanto fornece capacidades integradas de segurança, monitorização e CI/CD através do ecossistema de serviços geridos da Azure.

![Architecture](../../../../../translated_images/pt-PT/architecture.48d94861e6e6cdc0.webp)

---

## 3. Estrutura do Repositório

!!! prompt "PERGUNTA: Explica a estrutura das pastas do template. Começa com um diagrama hierárquico visual."

??? info "RESPOSTA: Diagrama Hierárquico Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuração & Setup
      │   ├── azure.yaml                    # Configuração da Azure Developer CLI
      │   ├── docker-compose.yaml           # Containers para desenvolvimento local
      │   ├── pyproject.toml                # Configuração do projeto Python
      │   ├── requirements-dev.txt          # Dependências de desenvolvimento
      │   └── .devcontainer/                # Configuração do container de desenvolvimento VS Code
      │
      ├── 🏗️ Infraestrutura (infra/)
      │   ├── main.bicep                    # Template principal de infraestrutura
      │   ├── api.bicep                     # Recursos específicos da API
      │   ├── main.parameters.json          # Parâmetros de infraestrutura
      │   └── core/                         # Componentes modulares de infraestrutura
      │       ├── ai/                       # Configurações dos serviços de IA
      │       ├── host/                     # Infraestrutura de hosting
      │       ├── monitor/                  # Monitorização e logging
      │       ├── search/                   # Configuração do Azure AI Search
      │       ├── security/                 # Segurança e identidade
      │       └── storage/                  # Configurações da conta de armazenamento
      │
      ├── 💻 Código da Aplicação (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entrada da aplicação FastAPI
      │   │   ├── routes.py                 # Definições das rotas API
      │   │   ├── search_index_manager.py   # Funcionalidades de pesquisa
      │   │   ├── data/                     # Gestão de dados da API
      │   │   ├── static/                   # Recursos web estáticos
      │   │   └── templates/                # Templates HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependências Node.js
      │   │   ├── vite.config.ts            # Configuração do build Vite
      │   │   └── src/                      # Código fonte do frontend
      │   ├── data/                         # Ficheiros de dados de exemplo
      │   │   └── embeddings.csv            # Embeddings pré-computados
      │   ├── files/                        # Ficheiros da base de conhecimento
      │   │   ├── customer_info_*.json      # Exemplos de dados de clientes
      │   │   └── product_info_*.md         # Documentação de produto
      │   ├── Dockerfile                    # Configuração do container
      │   └── requirements.txt              # Dependências Python
      │
      ├── 🔧 Automação & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Setup pós-implantação
      │   ├── setup_credential.sh/.ps1     # Configuração de credenciais
      │   ├── validate_env_vars.sh/.ps1    # Validação de variáveis de ambiente
      │   └── resolve_model_quota.sh/.ps1  # Gestão de quota dos modelos
      │
      ├── 🧪 Testes & Avaliação
      │   ├── tests/                        # Testes unitários e de integração
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework de avaliação do agente
      │   │   ├── evaluate.py               # Executor de avaliações
      │   │   ├── eval-queries.json         # Queries de teste
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Ambiente de desenvolvimento
      │   │   ├── 1-quickstart.py           # Exemplos para início rápido
      │   │   └── aad-interactive-chat.py   # Exemplos de autenticação
      │   └── airedteaming/                 # Avaliação de segurança de IA
      │       └── ai_redteaming.py          # Testes de equipa vermelha
      │
      ├── 📚 Documentação (docs/)
      │   ├── deployment.md                 # Guia de implantação
      │   ├── local_development.md          # Instruções para configuração local
      │   ├── troubleshooting.md            # Problemas comuns & soluções
      │   ├── azure_account_setup.md        # Pré-requisitos Azure
      │   └── images/                       # Recursos para documentação
      │
      └── 📄 Metadados do Projeto
         ├── README.md                     # Visão geral do projeto
         ├── CODE_OF_CONDUCT.md           # Regras da comunidade
         ├── CONTRIBUTING.md              # Guia de contribuições
         ├── LICENSE                      # Termos da licença
         └── next-steps.md                # Orientações pós-implantação
      ```

### 3.1. Arquitetura Principal da App

Este template segue um padrão de **aplicação web full-stack** com:

- **Backend**: Python FastAPI com integração Azure IA
- **Frontend**: TypeScript/React com Vite como sistema de build
- **Infraestrutura**: Templates Azure Bicep para recursos cloud
- **Conteinerização**: Docker para implantação consistente

### 3.2 Infra como Código (bicep)

A camada de infraestrutura usa templates **Azure Bicep** organizados modularmente:

   - **`main.bicep`**: Orquestra todos os recursos Azure
   - **Módulos `core/`**: Componentes reutilizáveis para diferentes serviços
      - Serviços IA (Azure OpenAI, AI Search)
      - Hosting de containers (Azure Container Apps)
      - Monitorização (Application Insights, Log Analytics)
      - Segurança (Key Vault, Identidade Gerida)

### 3.3 Código da Aplicação (`src/`)

**API Backend (`src/api/`)**:

- API REST baseada em FastAPI
- Integração com Foundry Agents
- Gestão do índice de pesquisa para recuperação de conhecimento
- Capacidades de upload e processamento de ficheiros

**Frontend (`src/frontend/`)**:

- SPA moderna React/TypeScript
- Vite para desenvolvimento rápido e builds otimizados
- Interface de chat para interações com o agente

**Base de Conhecimento (`src/files/`)**:

- Dados de exemplo de clientes e produtos
- Demonstra recuperação de conhecimento baseada em ficheiros
- Exemplos em JSON e Markdown

### 3.4 DevOps & Automação

**Scripts (`scripts/`)**:

- Scripts multiplataforma PowerShell e Bash
- Validação e preparação do ambiente
- Configuração pós-implantação
- Gestão da quota dos modelos

**Integração Azure Developer CLI**:

- Configuração `azure.yaml` para workflows `azd`
- Provisionamento e implantação automatizados
- Gestão de variáveis de ambiente

### 3.5 Testes & Garantia de Qualidade

**Framework de Avaliação (`evals/`)**:

- Avaliação de desempenho do agente
- Testes de qualidade perguntas-respostas
- Pipeline de avaliação automatizada

**Segurança em IA (`airedteaming/`)**:

- Testes de equipa vermelha para segurança de IA
- Análise de vulnerabilidades de segurança
- Práticas responsáveis de IA

---

## 4. Parabéns 🏆

Conseguiste usar com sucesso o GitHub Copilot Chat com servidores MCP para explorar o repositório.

- [X] Ativaste o GitHub Copilot para Azure
- [X] Compreendeste a Arquitetura da Aplicação
- [X] Exploraste a estrutura do template AZD

Isto dá-te uma visão dos ativos de _infraestrutura como código_ neste template. A seguir, vamos analisar o ficheiro de configuração para o AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->