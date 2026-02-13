# 3. Деконструишите шаблон

!!! tip "НА КРАЈУ ОВОГ МОДУЛА БИЋЕТЕ У СТАЊУ ДА"

    - [ ] Активирате GitHub Copilot са MCP серверима за помоћ у Azure
    - [ ] Разумете AZD структуру фолдера шаблона и компоненте
    - [ ] Истражите обрасце организације инфраструктуре као кода (Bicep)
    - [ ] **Лаб 3:** Користите GitHub Copilot за истраживање и разумевање архитектуре репозиторијума 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _почетни_ project.

**Али сада, морамо да разумемо структуру пројекта и кодну базу - и да будемо у стању да прилагодимо AZD шаблон - без икаквог претходног искуства или разумевања AZD!**

---

## 1. Активирајте GitHub Copilot

### 1.1 Инсталирајте GitHub Copilot Chat

It's time to explore [GitHub Copilot са режимом агента](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Now, we can use natural language to describe our task at a high level, and get assistance in execution. For this lab, we'll use the [Copilot Free plan](https://github.com/github-copilot/signup) which has a monthly limit for completions and chat interactions.

The extension can be installed from the marketplace, but should already be available in your Codespaces environment. _Кликните на `Open Chat` из падајућег менија иконе Copilot - и унесите упит као `What can you do?`_ - можда ће бити потребно да се пријавите. **GitHub Copilot Chat је спреман**.

### 1.2. Инсталирајте MCP сервере

For Agent mode to be effective, it needs access to the right tools to help it retrieve knowledge or take actions. This is where MCP servers can help. We'll configure the following servers:

1. [Azure MCP сервер](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP сервер](../../../../../workshop/docs/instructions)

To activate these:

1. Create a file called `.vscode/mcp.json` if it does not exist
1. Copy the following into that file - and start the servers!
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

??? warning "Може да добијете грешку да `npx` није инсталиран (кликните да проширите за решење)"

      Да бисте решили ово, отворите датотеку `.devcontainer/devcontainer.json` и додате овај ред у одељак features. Потом реконструишите контејнер. Сада би требало да имате инсталиран `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Тестирајте GitHub Copilot Chat

**Прво користите `az login` да аутентификујете са Azure из VS Code командне линије.**

Сада бисте требали бити у стању да упитате статус ваше Azure претплате и постављате питања о распоређеним ресурсима или конфигурацији. Испробајте ове упите:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Такође можете постављати питања о Azure документацији и добијати одговоре базиране на Microsoft Docs MCP серверу. Испробајте ове упите:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Или можете тражити исечке кода који помажу у обављању задатка. Испробајте овај упит.

1. `Give me a Python code example that uses AAD for an interactive chat client`

У режиму `Ask`, ово ће обезбедити код који можете копирати и испробати. У режиму `Agent`, ово може ићи корак даље и направити релевантне ресурсе за вас - укључујући скрипте за подешавање и документацију - да вам помогне да извршите тај задатак.

**Сада сте опремљени да почнете да истражујете репозиторијум шаблона**

---

## 2. Деконструишите архитектуру

??? prompt "ASK: Објасните архитектуру апликације у docs/images/architecture.png у 1 пасусу"

      Ова апликација је AI-покренута чат апликација изграђена на Azure-у која демонстрира модерну архитектуру засновану на агентима. Решење се фокусира на Azure Container App који хостује главни код апликације, који обрађује уносе корисника и генерише интелигентне одговоре кроз AI агента. 
      
      Архитектура користи Microsoft Foundry Project као основу за AI могућности, повезујући се са Azure AI Services које обезбеђују основне језичке моделе (попут GPT-4o-mini) и агент функционалност. Корисничке интеракције пролазе кроз React-базирани фронтенд до FastAPI бекенда који комуницира са AI агент сервисом за генерисање контекстуалних одговора. 
      
      Систем укључује могућности претраживања знања кроз претрагу фајлова или Azure AI Search сервис, омогућавајући агенту да приступи и цитира информације из отпремљених докумената. За оперативну изврсност, архитектура укључује свеобухватно праћење преко Application Insights и Log Analytics Workspace за праћење, логовање и оптимизацију перформанси. 
      
      Azure Storage обезбеђује blob складиште за податке апликације и отпреме фајлова, док Managed Identity обезбеђује сигуран приступ између Azure ресурса без чувања акредитива. Цело решење је дизајнирано за скалабилност и одрживост, са контејнеризованом апликацијом која се аутоматски скалира у зависности од потражње док пружа уграђену безбедност, надгледање и CI/CD могућности кроз Azure управљане услуге.

![Архитектура](../../../../../translated_images/sr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Структура репозиторијума

!!! prompt "ASK: Објасните структуру фолдера шаблона. Почните визуелним хијерархијским дијаграмом."

??? info "ANSWER: Визуелни хијерархијски дијаграм"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. Основна архитектура апликације

This template follows a **full-stack web application** pattern with:

- **Бекенд**: Python FastAPI са интеграцијом Azure AI
- **Фронтенд**: TypeScript/React са Vite build системом
- **Инфраструктура**: Azure Bicep шаблони за cloud ресурсе
- **Контейнеризација**: Docker за доследно распоређивање

### 3.2 Инфраструктура као код (Bicep)

The infrastructure layer uses **Azure Bicep** templates organized modularly:

   - **`main.bicep`**: Orchestrates all Azure resources
   - **`core/` modules**: Reusable components for different services
      - AI services (Azure OpenAI, AI Search)
      - Container hosting (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Security (Key Vault, Managed Identity)

### 3.3 Извор апликације (`src/`)

**Backend API (`src/api/`)**:

- FastAPI-based REST API
- Foundry Agents интеграција
- Управљање претраживачким индексима за приступ знању
- Могућности отпремања и обраде фајлова

**Frontend (`src/frontend/`)**:

- Модеран React/TypeScript SPA
- Vite за брз развој и оптимизоване билде
- Чат интерфејс за интеракцију са агентом

**Knowledge Base (`src/files/`)**:

- Примери података о купцима и производима
- Демонстрира приступ знању бази фајлова
- Примери у JSON и Markdown формату


### 3.4 DevOps & Аутоматизација

**Scripts (`scripts/`)**:

- Крос-платформски PowerShell и Bash скрипти
- Валидација и подешавање окружења
- Пост-деплоyмент конфигурација
- Управљање квотом модела

**Azure Developer CLI интеграција**:

- `azure.yaml` конфигурација за `azd` tokove rada
- Аутоматизовано провајдовање и распоређивање
- Управљање environment променљивима

### 3.5 Тестирање и осигурање квалитета

**Evaluation Framework (`evals/`)**:

- Евалуација перформанси агената
- Тестирање квалитета упит-одговор парова
- Аутоматизована процена

**AI Safety (`airedteaming/`)**:

- Red team тестирање за AI безбедност
- Скенирање рањивости безбедности
- Праксе одговорног AI

---

## 4. Честитамо 🏆

Успешно сте користили GitHub Copilot Chat са MCP серверима да бисте истражили репозиторијум.

- [X] Активирали GitHub Copilot за Azure
- [X] Разумели архитектуру апликације
- [X] Истражили структуру AZD шаблона

Ово вам даје увид у _infrastructure as code_ ресурсе за овај шаблон. Следеће ћемо погледати конфигурациони фајл за AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен уз помоћ сервиса за превод заснованог на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални превод који обавља човек. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->