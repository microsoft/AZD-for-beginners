# 3. Деконструишите шаблон

!!! tip "НА КРАЈУ ОВОГ МОДУЛА БИЋЕТЕ У СТАЊУ"

    - [ ] Активирати GitHub Copilot са MCP серверима за помоћ у Azure
    - [ ] Разумети структуру фасцикле AZD шаблона и компоненте
    - [ ] Истражити образце организације инфраструктуре као кода (Bicep)
    - [ ] **Lab 3:** Користити GitHub Copilot за истраживање и разумевање архитектуре репозиторијума 

---


With AZD templates and the Azure Developer CLI (`azd`) we can quickly jumpstart our AI development journey with standardized repositories that provide sample code, infrastructure and configuration files - in the form of a ready-to-deploy _starter_ project.

**Али сада, потребно је да разумемо структуру пројекта и кодну базу - и да будемо у стању да прилагодимо AZD шаблон - без икаквог претходног искуства или разумевања AZD!**

---

## 1. Активирајте GitHub Copilot

### 1.1 Инсталирајте GitHub Copilot Chat

Време је да истражимо [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Сада можемо користити природни језик да опишемо наш задатак на високом нивоу и добијемо помоћ у извршењу. За ову лабораторију користићемо [Copilot Free plan](https://github.com/github-copilot/signup) који има месечни лимит за завршетке и интеракције у ћаскању.

Екстензија се може инсталирати са marketplace-а, и често је већ доступна у Codespaces или dev container окружењима. _Кликните на `Open Chat` из падајућег менија иконе Copilot - и укуцајте упит попут `What can you do?`_ - можда ће вам бити затражено да се пријавите. **GitHub Copilot Chat је спреман**.

### 1.2. Инсталирајте MCP сервере

За Agent режим да буде ефикасан, он треба приступ правим алатима који му помажу да преузме знање или предузме радње. Овде могу помоћи MCP сервери. Конфигурисаћемо следеће сервере:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Да бисте их активирали:

1. Креирајте датотеку назвanu `.vscode/mcp.json` ако не постоји
1. Копирајте следеће у ту датотеку - и покрените сервере!
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

??? warning "Можете добити грешку да `npx` није инсталиран (кликните да проширите за решење)"

      Да бисте то решили, отворите датотеку `.devcontainer/devcontainer.json` и додајте овај ред у одељак features. Затим реконструишите контејнер. Сада би требало да имате инсталиран `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Тестирајте GitHub Copilot Chat

**Прво користите `azd auth login` за аутентикацију са Azure из VS Code командне линије. Користите и `az login` само ако планирате да директно покрећете Azure CLI команде.**

Сада би требало да можете да упитате статус ваше Azure претплате и постављате питања о распоређеним ресурсима или конфигурацији. Испробајте ове упите:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Такође можете постављати питања о Azure документацији и добијати одговоре засноване на Microsoft Docs MCP серверу. Испробајте ове упите:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Или можете тражити примере кода за извршавање задатка. Испробајте овај упит.

1. `Give me a Python code example that uses AAD for an interactive chat client`

У режиму „Ask“, ово ће обезбедити код који можете копирати и испробати. У режиму „Agent“, ово може ићи корак даље и креирати релевантне ресурсе за вас - укључујући скрипте за подешавање и документацију - да вам помогне да изведете тај задатак.

**Сада сте опремљени да почнете да истражујете шаблон репозиторијума**

---

## 2. Деконструишите архитектуру

??? prompt "ПИТАЊЕ: Објасните архитектуру апликације у docs/images/architecture.png у 1 параграф"

      Ова апликација је AI-напајано ћаскање изграђено на Azure-у које демонстрира савремену архитектуру засновану на агентима. Решење се фокусира око Azure Container App која хостује главни код апликације, која обрађује унос корисника и генерише интелигентне одговоре путем AI агента. 
      
      Архитектура користи Microsoft Foundry Project као основу за AI могућности, повезујући се са Azure AI Services који обезбеђују основне језичке моделе (као што је gpt-4.1-mini) и агент функционалност. Корисничке интеракције пролазе преко фронтенда базираног на React-у ка FastAPI бекенду који комуницира са AI агент сервисом за генерисање контекстуалних одговора. 
      
      Систем укључује могућности повлачења знања кроз претрагу датотека или Azure AI Search сервис, омогућавајући агенту приступ и цитирање информација из отпремљених докумената. За оперативну изврсност, архитектура обухвата свеобухватни мониторинг кроз Application Insights и Log Analytics Workspace за трасирање, евидентирање и оптимизацију перформанси. 
      
      Azure Storage обезбеђује blob складиште за податке апликације и отпрему датотека, док Managed Identity обезбеђује сигуран приступ између Azure ресурса без чувања акредитива. Цело решење је дизајнирано за скалабилност и одрживост, са контејнеризованом апликацијом која се аутоматски скалира према потражњи, уз уграђену безбедност, мониторинг и CI/CD могућности кроз Azure-ов екосистем управљаних услуга.

![Архитектура](../../../../../translated_images/sr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Структура репозиторијума

!!! prompt "ПИТАЊЕ: Објасните структуру фасцикле шаблона. Почните визуелним хијерархијским дијаграмом."

??? info "ОДГОВОР: Визуелни хијерархијски дијаграм"

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

### 3.1. Језгро архитектуре апликације

Овај шаблон прати образац **full-stack веб апликације** са:

- **Бекенд**: Python FastAPI са Azure AI интеграцијом
- **Фронтенд**: TypeScript/React са Vite системом за билд
- **Инфраструктура**: Azure Bicep шаблони за ресурсе у облаку
- **Контейнеризација**: Docker за поуздано постављање

### 3.2 Инфра као код (Bicep)

Слој инфраструктуре користи **Azure Bicep** шаблоне организоване модуларно:

   - **`main.bicep`**: Оркестрира све Azure ресурсе
   - **`core/` модули**: Поновно употребљиве компоненте за различите услуге
      - AI сервиси (Microsoft Foundry Models, AI Search)
      - Хостинг контејнера (Azure Container Apps)
      - Мониторинг (Application Insights, Log Analytics)
      - Безбедност (Key Vault, Managed Identity)

### 3.3 Извор апликације (`src/`)

**Бекенд API (`src/api/`)**:

- REST API заснован на FastAPI
- Интеграција са Foundry Agents
- Управљање search индексом за повлачење знања
- Могућности отпреме и обраде датотека

**Фронтенд (`src/frontend/`)**:

- Модеран React/TypeScript SPA
- Vite за брз развој и оптимизоване билдове
- Чат интерфејс за интеракције са агентом

**База знања (`src/files/`)**:

- Примерни подаци о клијентима и производима
- Демонстрира повлачење знања из датотека
- Примери у JSON и Markdown формату


### 3.4 DevOps & Аутоматизација

**Скрипте (`scripts/`)**:

- Крос-платформске PowerShell и Bash скрипте
- Валидација и подешавање окружења
- Пост-деплојмент конфигурација
- Управљање квотом модела

**Интеграција са Azure Developer CLI**:

- `azure.yaml` конфигурација за `azd` workflow-e
- Аутоматизовано провизионисање и деплој
- Управљање променљивим окружења

### 3.5 Тестирање & Осигурање квалитета

**Евалуациони оквир (`evals/`)**:

- Евалуација перформанси агената
- Тестирање квалитета упит-одговор
- Аутоматизована линија за процену

**AI безбедност (`airedteaming/`)**:

- Red team тестирање за AI безбедност
- Скенирање за рањивости
- Практике одговорног AI

---

## 4. Честитамо 🏆

Успешно сте користили GitHub Copilot Chat са MCP серверима да бисте истражили репозиторијум.

- [X] Активирали сте GitHub Copilot за Azure
- [X] Разумели архитектуру апликације
- [X] Истражили структуру AZD шаблона

Ово вам пружа увид у _инфраструктуру као код_ ресурсe за овај шаблон. Даље ћемо погледати конфигурациону датотеку за AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Овај документ је преведен помоћу услуге за превођење засноване на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетским извором. За критичне информације препоручује се професионални превод од стручног преводиоца. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->