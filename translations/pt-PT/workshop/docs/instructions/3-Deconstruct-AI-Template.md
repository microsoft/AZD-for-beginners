# 3. Desconstruir um Template

!!! tip "NO FINAL DESTE MÓDULO, IRÁS CONSEGUIR"

    - [ ] Ativar o GitHub Copilot com servidores MCP para assistência Azure
    - [ ] Compreender a estrutura e os componentes da pasta do template AZD
    - [ ] Explorar padrões de organização de infraestrutura como código (Bicep)
    - [ ] **Lab 3:** Usar o GitHub Copilot para explorar e entender a arquitetura do repositório 

---


Com os templates AZD e a Azure Developer CLI (`azd`) podemos começar rapidamente a nossa jornada de desenvolvimento de IA com repositórios padronizados que fornecem código de exemplo, infraestruturas e ficheiros de configuração - na forma de um projeto _starter_ pronto a implementar.

**Mas agora, precisamos de compreender a estrutura do projeto e a base de código - e ser capazes de personalizar o template AZD - sem qualquer experiência ou compreensão prévia do AZD!**

---

## 1. Ativar o GitHub Copilot

### 1.1 Instalar o GitHub Copilot Chat

É tempo de explorar o [GitHub Copilot com Modo Agente](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Agora, podemos usar linguagem natural para descrever a nossa tarefa a um nível elevado, e obter assistência na execução. Para este laboratório, iremos usar o [plano gratuito do Copilot](https://github.com/github-copilot/signup) que tem um limite mensal para conclusões e interações no chat.

A extensão pode ser instalada a partir do marketplace, mas deverá já estar disponível no teu ambiente Codespaces. _Clique em `Open Chat` no menu suspenso do ícone do Copilot - e escreve um prompt como `What can you do?`_ - poderá ser pedido que inicies sessão. **O GitHub Copilot Chat está pronto**.

### 1.2. Instalar os Servidores MCP

Para que o modo Agente seja eficaz, precisa de acesso às ferramentas corretas para o ajudar a recuperar conhecimento ou executar ações. É aqui que os servidores MCP ajudam. Iremos configurar os seguintes servidores:

1. [Servidor Azure MCP](../../../../../workshop/docs/instructions)
1. [Servidor Microsoft Docs MCP](../../../../../workshop/docs/instructions)

Para os ativar:

1. Cria um ficheiro chamado `.vscode/mcp.json` se este não existir
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

??? warning "Poderás receber um erro a indicar que o `npx` não está instalado (clicar para expandir para a correção)"

      Para corrigir, abre o ficheiro `.devcontainer/devcontainer.json` e adiciona esta linha à secção features. Depois reconstrói o contentor. Agora deverás ter o `npx` instalado.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Testar o GitHub Copilot Chat

**Primeiro usa `az login` para autenticar na Azure a partir da linha de comandos do VS Code.**

Agora deverás conseguir consultar o estado da tua subscrição Azure e fazer perguntas sobre os recursos implementados ou configuração. Experimenta estes prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Podes também colocar questões sobre a documentação Azure e obter respostas assentes no servidor Microsoft Docs MCP. Experimenta estes prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ou podes pedir snippets de código para completar uma tarefa. Experimenta este prompt.

1. `Give me a Python code example that uses AAD for an interactive chat client`

No modo `Ask`, isto irá fornecer código que podes copiar-colar e experimentar. No modo `Agent`, poderá avançar um passo e criar os recursos relevantes para ti - incluindo scripts de configuração e documentação - para ajudar a executar essa tarefa.

**Agora estás equipado para começar a explorar o repositório do template**

---

## 2. Desconstruir a Arquitectura

??? prompt "PERGUNTA: Explica a arquitectura da aplicação em docs/images/architecture.png em 1 parágrafo"

      Esta aplicação é uma aplicação de chat com IA construída no Azure que demonstra uma arquitetura moderna baseada em agentes. A solução centra-se numa Azure Container App que hospeda o código principal da aplicação, que processa a entrada do utilizador e gera respostas inteligentes através de um agente de IA.
      
      A arquitetura aproveita o Microsoft Foundry Project como base para capacidades de IA, ligando-se aos Serviços Azure AI que fornecem os modelos de linguagem subjacentes (como o gpt-4.1-mini) e funcionalidades de agente.
      
      As interações do utilizador fluem por um frontend baseado em React para um backend FastAPI que comunica com o serviço do agente IA para gerar respostas contextuais.
      
      O sistema incorpora capacidades de recuperação de conhecimento através de pesquisa de ficheiros ou do serviço Azure AI Search, permitindo que o agente aceda e cite informações de documentos carregados.
      
      Para excelência operacional, a arquitetura inclui monitorização abrangente através do Application Insights e Log Analytics Workspace para rastreamento, registo e otimização de desempenho.
      
      O Azure Storage fornece armazenamento de blobs para dados da aplicação e carregamentos de ficheiros, enquanto a Identidade Gerida garante acesso seguro entre os recursos Azure sem armazenar credenciais.
      
      Toda a solução é concebida para escalabilidade e manutenção, com a aplicação conteinerizada a escalar automaticamente conforme a procura, proporcionando segurança incorporada, monitorização e capacidades CI/CD através do ecossistema de serviços geridos da Azure.

![Architecture](../../../../../translated_images/pt-PT/architecture.48d94861e6e6cdc0.webp)

---

## 3. Estrutura do Repositório

!!! prompt "PERGUNTA: Explica a estrutura da pasta do template. Começa com um diagrama hierárquico visual."

??? info "RESPOSTA: Diagrama Hierárquico Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuração e Setup
      │   ├── azure.yaml                    # Configuração da Azure Developer CLI
      │   ├── docker-compose.yaml           # Contentores para desenvolvimento local
      │   ├── pyproject.toml                # Configuração do projeto Python
      │   ├── requirements-dev.txt          # Dependências de desenvolvimento
      │   └── .devcontainer/                # Setup do contentor dev no VS Code
      │
      ├── 🏗️ Infraestrutura (infra/)
      │   ├── main.bicep                    # Template principal da infraestrutura
      │   ├── api.bicep                     # Recursos específicos da API
      │   ├── main.parameters.json          # Parâmetros da infraestrutura
      │   └── core/                         # Componentes modulares da infraestrutura
      │       ├── ai/                       # Configurações dos serviços de IA
      │       ├── host/                     # Infraestrutura de hosting
      │       ├── monitor/                  # Monitorização e registo
      │       ├── search/                   # Configuração do Azure AI Search
      │       ├── security/                 # Segurança e identidade
      │       └── storage/                  # Configurações da conta de armazenamento
      │
      ├── 💻 Código da Aplicação (src/)
      │   ├── api/                          # API backend
      │   │   ├── main.py                   # Entrada da aplicação FastAPI
      │   │   ├── routes.py                 # Definições das rotas da API
      │   │   ├── search_index_manager.py   # Funcionalidade de pesquisa
      │   │   ├── data/                     # Manipulação de dados da API
      │   │   ├── static/                   # Assets estáticos web
      │   │   └── templates/                # Templates HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependências Node.js
      │   │   ├── vite.config.ts            # Configuração build Vite
      │   │   └── src/                      # Código fonte do frontend
      │   ├── data/                         # Ficheiros de dados de exemplo
      │   │   └── embeddings.csv            # Embeddings pré-computados
      │   ├── files/                        # Ficheiros da base de conhecimento
      │   │   ├── customer_info_*.json      # Exemplos de dados de clientes
      │   │   └── product_info_*.md         # Documentação de produtos
      │   ├── Dockerfile                    # Configuração do contentor
      │   └── requirements.txt              # Dependências Python
      │
      ├── 🔧 Automação e Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Setup pós-implementação
      │   ├── setup_credential.sh/.ps1     # Configuração de credenciais
      │   ├── validate_env_vars.sh/.ps1    # Validação de ambiente
      │   └── resolve_model_quota.sh/.ps1  # Gestão da quota dos modelos
      │
      ├── 🧪 Testes e Avaliação
      │   ├── tests/                        # Testes unitários e integração
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework de avaliação de agentes
      │   │   ├── evaluate.py               # Executor da avaliação
      │   │   ├── eval-queries.json         # Consultas de teste
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Espaço para desenvolvimento
      │   │   ├── 1-quickstart.py           # Exemplos de início rápido
      │   │   └── aad-interactive-chat.py   # Exemplos de autenticação
      │   └── airedteaming/                 # Avaliação da segurança AI
      │       └── ai_redteaming.py          # Testes de equipa vermelha
      │
      ├── 📚 Documentação (docs/)
      │   ├── deployment.md                 # Guia de implementação
      │   ├── local_development.md          # Instruções para setup local
      │   ├── troubleshooting.md            # Problemas comuns e soluções
      │   ├── azure_account_setup.md        # Pré-requisitos Azure
      │   └── images/                       # Assets de documentação
      │
      └── 📄 Metadados do Projeto
         ├── README.md                     # Visão geral do projeto
         ├── CODE_OF_CONDUCT.md           # Normas da comunidade
         ├── CONTRIBUTING.md              # Guia para contribuições
         ├── LICENSE                      # Termos da licença
         └── next-steps.md                # Orientações pós-implementação
      ```

### 3.1. Arquitectura da App Core

Este template segue o padrão de uma **aplicação web full-stack** com:

- **Backend**: Python FastAPI com integração Azure AI
- **Frontend**: TypeScript/React com sistema de build Vite
- **Infraestrutura**: Templates Bicep da Azure para recursos cloud
- **Contentorização**: Docker para deploys consistentes

### 3.2 Infraestrutura como Código (bicep)

A camada de infraestrutura usa templates **Azure Bicep** organizados modularmente:

   - **`main.bicep`**: Orquestra todos os recursos Azure
   - **Módulos `core/`**: Componentes reutilizáveis para diferentes serviços
      - Serviços AI (Modelos Microsoft Foundry, AI Search)
      - Hosting conteinerizado (Azure Container Apps)
      - Monitorização (Application Insights, Log Analytics)
      - Segurança (Key Vault, Managed Identity)

### 3.3 Código da Aplicação (`src/`)

**API Backend (`src/api/`)**:

- API REST baseada em FastAPI
- Integração com agentes Foundry
- Gestão do índice de pesquisa para recuperação de conhecimento
- Funcionalidades de upload e processamento de ficheiros

**Frontend (`src/frontend/`)**:

- SPA moderna React/TypeScript
- Vite para desenvolvimento rápido e builds otimizados
- Interface de chat para interações com agente

**Base de Conhecimento (`src/files/`)**:

- Dados de clientes e produtos de exemplo
- Demonstra recuperação de conhecimento baseada em ficheiros
- Exemplos em JSON e Markdown


### 3.4 DevOps & Automação

**Scripts (`scripts/`)**:

- Scripts cross-platform PowerShell e Bash
- Validação e setup do ambiente
- Configuração pós-implementação
- Gestão de quota de modelos

**Integração Azure Developer CLI**:

- Configuração `azure.yaml` para fluxos `azd`
- Provisionamento e deployment automatizados
- Gestão de variáveis de ambiente

### 3.5 Testes e Garantia de Qualidade

**Framework de Avaliação (`evals/`)**:

- Avaliação de performance dos agentes
- Testes de qualidade resposta-consulta
- Pipeline de avaliação automatizada

**Segurança AI (`airedteaming/`)**:

- Testes de equipa vermelha para segurança AI
- Scan de vulnerabilidades
- Práticas responsáveis de IA

---

## 4. Parabéns 🏆

Conseguiste usar o GitHub Copilot Chat com servidores MCP para explorar o repositório.

- [X] Ativaste o GitHub Copilot para Azure
- [X] Compreendeste a Arquitectura da Aplicação
- [X] Exploraste a estrutura do template AZD

Isto dá-te uma noção dos ativos de _infraestrutura como código_ deste template. Seguidamente, vamos analisar o ficheiro de configuração para o AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->