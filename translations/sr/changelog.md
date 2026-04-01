# Дневник промена - AZD за почетнике

## Увод

Овај дневник промена документише све значајне измене, ажурирања и побољшања у репозиторијуму AZD For Beginners. Пратимо принципе семантичког верзионисања и одржавамо овај дневник како бисмо корисницима помогли да разумеју шта се променило између верзија.

## Циљеви учења

Прегледајући овај дневник промена, ви ћете:
- Бити обавештени о новим функцијама и додацима садржаја
- Разумети побољшања у постојећој документацији
- Пратити исправке грешака и корекције ради обезбеђивања тачности
- Пратити развој материјала за учење током времена

## Резултати учења

Након прегледа уноса у дневник промена, бићете у стању да:
- Идентификујете нови садржај и ресурсе доступне за учење
- Разумете које су секције ажуриране или побољшане
- Планирате ваш пут учења заснован на најсавременијим материјалима
- Дајете повратне информације и предлоге за будућа побољшања

## Историја верзија

### [v3.19.1] - 2026-03-27

#### Појашњење процеса за почетнике, валидација подешавања и коначна корекција AZD команди
**Ова верзија следи верификацију AZD 1.23 са пролазом документације фокусираним на почетнике: појашњава смернице за аутентификацију усмерене према AZD, додаје скрипте за локалну валидацију подешавања, верификује кључне команде против активног AZD CLI и уклања последње застареле референце команди на енглеском ван дневника промена.**

#### Додато
- **🧪 Скрипте за валидацију подешавања за почетнике** са `validate-setup.ps1` и `validate-setup.sh` тако да учесници могу да потврде потребне алате пре почетка Поглавља 1
- **✅ Рани кораци за валидацију подешавања** у главном README и README-у Поглавља 1 тако да недостајући предуслови буду откривени пре `azd up`

#### Измењено
- **🔐 Смернице за аутентификацију за почетнике** сада доследно третирају `azd auth login` као примарни пут за AZD токове рада, док је `az login` наглашен као опционалан осим ако се директно не користе Azure CLI команде
- **📚 Ток упознавања у Поглављу 1** сада усмерава учеснике да верификују своје локално подешавање пре инсталације, аутентификације и првих корака за размештање
- **🛠️ Поруке валидатора** сада јасно одвајају обавезне захтеве од опционих упозорења Azure CLI-а за пут који је намењен само AZD почетницима
- **📖 Конфигурација, решавање проблема и пример документације** сада разликују између обавезне AZD аутентификације и опционалног пријављивања у Azure CLI када су оба претходно представљена без контекста

#### Исправљено
- **📋 Преостале референце команди из енглеског извора** ажуриране на тренутне AZD облике, укључујући `azd config show` у cheat sheet-у и `azd monitor --overview` тамо где је намеравана смерница за преглед у Azure порталу
- **🧭 Тврдње за почетнике у Поглављу 1** ублажене су да би се избегло претерано обећавање загарантованог понашања без грешака или понашања поништавања (rollback) за све шаблоне и Azure ресурсе
- **🔎 Верификација у реалном CLI-ју** потврдила тренутну подршку за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, и `azd down --force --purge`

#### Ажуриране датотеке
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Валидација AZD 1.23.12, проширење окружења радионице и освежавање AI модела
**Ова верзија изводи верификацију документације против `azd` `1.23.12`, ажурира застареле примерке AZD команди, освежава смернице за AI моделе на актуелне подразумеване вредности и проширује упутства за радионицу изван GitHub Codespaces тако да подржава и dev контейнере и локалне клоне.**

#### Додато
- **✅ Напомене о валидацији у основном поглављу и документацији радионице** да би се учесницима јасно назначила тестирана AZD базна верзија када користе новије или старије CLI верзије
- **⏱️ Смернице за timeout при размењивању** за дуготрајне развоје AI апликација користећи `azd deploy --timeout 1800`
- **🔎 Кораци за инспекцију екстензија** са `azd extension show azure.ai.agents` у документацији AI токова рада
- **🌐 Проширено упутство о окружењима радионице** које обухвата GitHub Codespaces, dev контейнере и локалне клоне уз MkDocs

#### Измењено
- **📚 Уводни README-и поглавља** сада доследно бележе валидацију против `azd 1.23.12` у поглављима за основу, конфигурацију, инфраструктуру, мулти-агенте, пред-размештање, решавање проблема и продукцију
- **🛠️ Референце AZD команди** ажуриране на тренутне облике широм документације:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` у зависности од контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` тамо где је намераван преглед Application Insights-а
- **🧪 Примери preview provisioning-а** поједностављени на тренутно подржану употребу као што су `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Ток радионице** ажуриран тако да учесници могу да заврше лабораторије у Codespaces, dev контејнеру или локалном клону уместо да се подразумева извршавање само у Codespaces
- **🔐 Смернице за аутентификацију** сада преферирају `azd auth login` за AZD токове рада, док се `az login` позиционира као опционалан када се директно користе Azure CLI команде

#### Исправљено
- **🪟 Команде за инсталацију на Windows-у** нормализоване су на актуелну велико-мало слово комбинацију пакета у `winget` упутству за инсталацију
- **🐧 Упутства за инсталацију на Linux-у** исправљена да би се избегле неподуржавајуће инструкције специфичне за дистрибуцију `azd` пакет менаџера и уместо тога упућују на релизне артифакте где је то прикладно
- **📦 Примери AI модела** освежени са старијих подразумевања као што су `gpt-35-turbo` и `text-embedding-ada-002` на тренутне примере као што су `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Снипети за распоређивање и дијагностику** исправљени да користе тренутне команде за окружење и статус у логовима, скриптама и корацима за решавање проблема
- **⚙️ Упутства за GitHub Actions** ажурирана са `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Смернице за MCP/Copilot сагласност** ажуриране са `azd mcp consent` на `azd copilot consent list`

#### Побољшано
- **🧠 Поглавље о AI-у** сада боље објашњава preview-осетљиво понашање `azd ai`, пријављивање специфично за tenant, тренутну употребу екстензија и ажурирана препоруке за распоређивање модела
- **🧪 Упутства радионице** сада користе реалније примере верзија и јаснији језик за подешавање окружења за практичне лабораторије
- **📈 Документација за продукцију и решавање проблема** сада боље усклађује тренутни мониторинг, fallback модел и примере нивоа трошкова

#### Ажуриране датотеке
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI команде, валидација садржаја и проширење шаблона
**Ова верзија додаје покривање команди `azd ai`, `azd extension` и `azd mcp` у свим поглављима повезаним са AI-ом, исправља сломљене линкове и застарели код у agents.md, ажурира cheat sheet и ревидира одељак Example Templates са валидацијом описа и новим Azure AI AZD шаблонима.**

#### Додато
- **🤖 Покривање AZD AI CLI-а** у 7 фајлова (раније само у Поглављу 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нови одељак "Extensions and AI Commands" који уводи `azd extension`, `azd ai agent init`, и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опција 4: `azd ai agent init` са упоредном табелом (приступ шаблоном у односу на манифест)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Пододељци "AZD Extensions for Foundry" и "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start сад показује и пут распореда заснован на шаблону и заснован на манифесту
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секција Deploy сада укључује опцију `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Пододељак "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Нови одељак "AI & Extensions Commands" са `azd extension`, `azd ai agent init`, `azd mcp`, и `azd infra generate`
- **📦 Нови AZD AI пример шаблони** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG ћаскање са Blazor WebAssembly, Semantic Kernel и подршком за говорно ћаскање
  - **azure-search-openai-demo-java** — Java RAG ћаскање користећи Langchain4J са опцијама за ACA/AKS размештање
  - **contoso-creative-writer** — Мулти-агент апликација за креативно писање користећи Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Serverless RAG користећи Azure Functions + LangChain.js + Cosmos DB са Ollama локалном подршком за развој
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG акцелератор са админ порталом, Teams интеграцијом и опцијама PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Референтна апликација за мулти-агентну MCP оркестрацију са серверима у .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимални Bicep старт шаблон за Azure AI инфраструктуру
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Исправљено
- **🔗 Навигација у agents.md**: Previous/Next линкови сада одговарају редоследу лекција у README-у Поглавља 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Сломљени линкови у agents.md**: `production-ai-practices.md` исправљено у `../chapter-08-production/production-ai-practices.md` (3 појаве)
- **📦 Застарели код у agents.md**: Заменљен `opencensus` са `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Неважећи API у agents.md**: Померен `max_tokens` из `create_agent()` у `create_run()` као `max_completion_tokens`
- **🔢 Бројање токена у agents.md**: Заменjena груба процена `len//4` са `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправљене услуге са "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (подразумевани хост промењен у октобру 2024)
- **contoso-chat**: Ажурирањем описа додата референца на Azure AI Foundry + Prompty, усклађујући се са стварним насловом и технолошким стеком репозиторијума

#### Уклонио
- **ai-document-processing**: Уклоњена нефункционална референца шаблона (репозиторијум није јавно доступан као AZD шаблон)

#### Побољшано
- **📝 agents.md exercises**: Вежба 1 сада приказује очекивани излаз и корак `azd monitor`; Вежба 2 укључује пун код регистрације `FunctionTool`; Вежба 3 замењује нејасна упутства конкретним `prepdocs.py` командама
- **📚 agents.md resources**: Ажуриране везе ка документацији на актуелне Azure AI Agent Service документе и брзи почетак
- **📋 agents.md Next Steps table**: Додат линк AI Workshop Lab за потпуно покривање поглавља

#### Ажуриране датотеке
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Побрaшјање навигације курса
**Ова верзија побољшава навигацију по поглављима у README.md користећи унапређени формат табеле.**

#### Измене
- **Табела мапе курса**: Унапређена са директним линковима ка лекцијама, проценама трајања и оценама сложености
- **Чишћење фолдера**: Уклоњени су сувишни стари фолдери (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Валидација линкова**: Сви 21+ интерни линкови у табели мапе курса су верификовани

### [v3.16.0] - 2026-02-05

#### Ажурирања назива производа
**Ова верзија ажурира референце на производе према актуелном Microsoft брендирању.**

#### Измене
- **Microsoft Foundry → Microsoft Foundry**: Све референце ажуриране у не-преводним фајловима
- **Azure AI Agent Service → Foundry Agents**: Име сервиса ажурирано да одражава актуелно брендирање

#### Ажуриране датотеке
- `README.md` - Главна почетна страница курса
- `changelog.md` - Историја верзија
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Водич за AI агенте
- `examples/README.md` - Документација примера
- `workshop/README.md` - Почетна страница радионице
- `workshop/docs/index.md` - Индекс радионице
- `workshop/docs/instructions/*.md` - Сви фајлови упутстава за радионицу

---

### [v3.15.0] - 2026-02-05

#### Велика реструктурa репозиторијума: Називи фасцикли по поглављима
**Ова верзија реорганизује документацију у посебне фасцикле по поглављима ради јасније навигације.**

#### Преименовања фолдера
Стари фолдери су замењени фолдерима именованим по поглављима:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додато ново: `docs/chapter-05-multi-agent/`

#### Миграције фајлова
| Fajl | Iz | U |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Додато
- **📚 README фајлови за поглавља**: Креирани README.md у сваком поглављу са:
  - Циљевима учења и трајањем
  - Табелом лекција са описима
  - Командама за брзи почетак
  - Навигацијом ка осталим поглављима

#### Измене
- **🔗 Ажурирани сви интерни линкови**: 78+ пута ажуриране путање у свим документационим фајловима
- **🗺️ Главни README.md**: Ажуриран Course Map са новом структуром поглавља
- **📝 examples/README.md**: Ажуриране међуреференце ка фасциклама по поглављима

#### Уклоњено
- Стари фолдери (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктурирање репозиторијума: Навигација по поглављима
**Ова верзија додала је README фајлове за навигацију по поглављима (преузето од v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Нов водич за AI агенте
**Ова верзија додаје свеобухватан водич за деплој AI агената помоћу Azure Developer CLI.**

#### Додато
- **🤖 docs/microsoft-foundry/agents.md**: Потпун водич који обухвата:
  - Шта су AI агенти и како се разликују од ћаскања (chatbot)
  - Три шаблона за брзи старт агената (Foundry Agents, Prompty, RAG)
  - Обрасци архитектуре агената (један агент, RAG, мулти-агент)
  - Конфигурација и прилагођавање алата
  - Праћење и метрике
  - Разматрања трошкова и оптимизација
  - Уобичајени сценарији решавања проблема
  - Три практичне вежбе са критеријумима успеха

#### Структура садржаја
- **Увод**: Концепти агената за почетнике
- **Брзи старт**: Деплој агената са `azd init --template get-started-with-ai-agents`
- **Обрасци архитектуре**: Визуелни дијаграми образаца агената
- **Конфигурација**: Постављање алата и environment променљивих
- **Праћење**: Интеграција са Application Insights
- **Вежбе**: Прогресивно практично учење (20-45 минута свака)

---

### [v3.12.0] - 2026-02-05

#### Ажурирање DevContainer окружења
**Ова верзија ажурира конфигурацију развојног контејнера са модерним алатима и бољим подразумеваним подешавањима за AZD искуство учења.**

#### Измене
- **🐳 Основна слика**: Ажурирано са `python:3.12-bullseye` на `python:3.12-bookworm` (најновији Debian стабилан)
- **📛 Име контејнера**: Преименовано са "Python 3" у "AZD for Beginners" ради јасноће

#### Додато
- **🔧 Нове функције у Dev Container-u**:
  - `azure-cli` са омогућеним Bicep подршком
  - `node:20` (LTS верзија за AZD шаблоне)
  - `github-cli` за управљање шаблонима
  - `docker-in-docker` за деплој контејнер апликација

- **🔌 Прослеђивање портова**: Пред-конфигурисани портови за уобичајени развој:
  - 8000 (MkDocs преглед)
  - 3000 (Web апликације)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Нови VS Code екстензији**:
  - `ms-python.vscode-pylance` - Побољшани Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Подршка за Azure Functions
  - `ms-azuretools.vscode-docker` - Подршка за Docker
  - `ms-azuretools.vscode-bicep` - Подршка за Bicep језик
  - `ms-azure-devtools.azure-resource-groups` - Управљање Azure ресурсима
  - `yzhang.markdown-all-in-one` - Уређивање Markdown-а
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Подршка за Mermaid дијаграме
  - `redhat.vscode-yaml` - Подршка за YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуализација Git-а
  - `mhutchie.git-graph` - Историја Git-а

- **⚙️ VS Code подешавања**: Додата подразумевана подешавања за Python интерпретер, форматирање при чувању и уклањање белина

- **📦 Aжуриран requirements-dev.txt**:
  - Додат MkDocs minify плагин
  - Додат pre-commit за квалитет кода
  - Додати Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Исправљено
- **Post-Create команда**: Сада верификује инсталацију AZD и Azure CLI при покретању контејнера

---

### [v3.11.0] - 2026-02-05

#### Реструктурирање README-а прилагођено почетницима
**Ова верзија значајно побољшава README.md како би била приступачнија почетницима и додаје есенцијалне ресурсе за AI програмере.**

#### Додато
- **🆚 Azure CLI vs AZD поређење**: Јасан приказ када користити који алат са практичним примерима
- **🌟 Sjajna AZD galerija**: Директни линкови ка галерији шаблона и ресурсима за допринос заједници:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ готових за деплој шаблона
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Допринос заједници
- **🎯 Водич за брзи почетак**: Поједностављени 3-степени одељак за почетак (Инсталирај → Пријави се → Деплој)
- **📊 Табела навигације на основу искуства**: Јасна упутства где започети у зависности од нивоа развојног искуства

#### Измене
- **Структура README-а**: Реорганизована за прогресивно откривање - кључне информације прво
- **Секција Увод**: Преписана да објасни "Магију `azd up`" за потпуне почетнике
- **Уклоњен дупликатни садржај**: Уклоњен дупликатни одељак за решавање проблема
- **Команде за решавање проблема**: Поправљене референце `azd logs` за коришћење важеће команде `azd monitor --logs`

#### Исправљено
- **🔐 Аутентификационе команде**: Додати `azd auth login` и `azd auth logout` у cheat-sheet.md
- **Неважеће референце команди**: Уклоњене преостале `azd logs` из README одељка за решавање проблема

#### Напомене
- **Опсег**: Промене примењене на главни README.md и resources/cheat-sheet.md
- **Циљна публика**: Побољшања посебно намењена развојним програмерима новим у AZD

---

### [v3.10.0] - 2026-02-05

#### Ажурирање тачности Azure Developer CLI команди
**Ова верзија коригује не-постојеће AZD команде кроз документацију, осигуравајући да сваки пример користи важећу Azure Developer CLI синтаксу.**

#### Исправљено
- **🔧 Уклоњене не-постојеће AZD команде**: Комплетан ревизор и корекција неважећих команда:
  - `azd logs` (не постоји) → замењено са `azd monitor --logs` или алтернативама Azure CLI
  - `azd service` субкоманде (не постоје) → замењено са `azd show` и Azure CLI
  - `azd infra import/export/validate` (не постоје) → уклоњено или замењено важећим алтернативама
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` флагови (не постоје) → уклоњени
  - `azd provision --what-if/--rollback` флагови (не постоје) → ажурирано да користи `--preview`
  - `azd config validate` (не постоји) → замењено са `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не постоје) → уклоњени

- **📚 Фајлови ажурирани са корекцијама команди**:
  - `resources/cheat-sheet.md`: Велика ревизија референци команди
  - `docs/deployment/deployment-guide.md`: Поправљене стратегије за повлачење (rollback) и деплој
  - `docs/troubleshooting/debugging.md`: Исправљени одељци за анализу логова
  - `docs/troubleshooting/common-issues.md`: Ажуриране команде за решавање проблема
  - `docs/troubleshooting/ai-troubleshooting.md`: Поправљена AZD debug секција
  - `docs/getting-started/azd-basics.md`: Исправљене команде за праћење
  - `docs/getting-started/first-project.md`: Ажурирани примери за праћење и дебаговање
  - `docs/getting-started/installation.md`: Поправљени примери за помоћ и верзије
  - `docs/pre-deployment/application-insights.md`: Исправљено прегледање логова
  - `docs/pre-deployment/coordination-patterns.md`: Поправљене команде за дебаговање агената

- **📝 Ажурирана референца верзије**:
  - `docs/getting-started/installation.md`: Промeњен фиксни број верзије `1.5.0` у генерички `1.x.x` са линком ка издањима

#### Измене
- **Стратегије повлачења**: Документација ажурирана да користи Git-базирано повлачење (AZD нема унутрашње повлачење)
- **Преглед логова**: Замењене референце `azd logs` са `azd monitor --logs`, `azd monitor --live`, и Azure CLI командама
- **Секција о перформансама**: Уклоњени не-постојећи флагови за паралелни/инкрементални деплој, понуђене важеће алтернативе

#### Технички детаљи
- **Važeće AZD komande**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Važeće zastavke za azd monitor**: `--live`, `--logs`, `--overview`
- **Uklonjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Napomene
- **Verifikacija**: Komande proverene u odnosu na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Završetak radionice i ažuriranje kvaliteta dokumentacije
**Ova verzija kompletira interaktivne module radionice, popravlja sve neispravne veze u dokumentaciji i poboljšava ukupni kvalitet sadržaja za AI developere koji koriste Microsoft AZD.**

#### Додато
- **📝 CONTRIBUTING.md**: Novi dokument sa smernicama za doprinos koji sadrži:
  - Jasna uputstva za prijavljivanje problema i predlaganje izmena
  - Standarde za dokumentaciju za novi sadržaj
  - Smernice za primere koda i konvencije poruka komita
  - Informacije o angažovanju zajednice

#### Завршено
- **🎯 Workshop Module 7 (Wrap-up)**: Potpuno dovršen završni modul sa:
  - Sveobuhvatnim rezimeom postignuća radionice
  - Sekcijom ključnih savladanih koncepata koja pokriva AZD, šablone i Microsoft Foundry
  - Preporukama za nastavak puta učenja
  - Izazovima radionice sa ocenama težine
  - Linkovima za povratne informacije i podršku zajednice

- **📚 Workshop Module 3 (Deconstruct)**: Ažurirani ciljevi učenja sa:
  - Uputstvima za aktivaciju GitHub Copilot sa MCP serverima
  - Razumevanjem strukture AZD šablon fascikle
  - Obrasci organizacije Infrastructure-as-code (Bicep)
  - Uputstvima za praktične laboratorijske zadatke

- **🔧 Workshop Module 6 (Teardown)**: Dovršen sa:
  - Ciljevima za čišćenje resursa i upravljanje troškovima
  - Korišćenjem `azd down` za bezbedno deprovisionovanje infrastrukture
  - Uputstvima za oporavak soft-obrisanih kognitivnih servisa
  - Bonus predlozima za istraživanje GitHub Copilot i Azure Portal

#### Ispravljeno
- **🔗 Popravljeni neispravni linkovi**: Rešeno 15+ pokvarenih internih linkova u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljeni putevi ka microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putevi ka ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamenjen nepostojeći cicd-integration.md sa deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljeni putevi ka FAQ i vodiču za rešavanje problema
  - `examples/container-app/microservices/README.md`: Ispravljeni putevi ka course home i deployment guide
  - `resources/faq.md` i `resources/glossary.md`: Ažurirana referenca u poglavlju o AI
  - `course-outline.md`: Ispravljeni instructor guide i AI workshop lab reference

- **📅 Baner statusa radionice**: Ažuriran iz "Under Construction" u aktivan status radionice sa datumom februar 2026

- **🔗 Navigacija radionice**: Ispravljene neispravne navigacione veze u workshop README.md koje su ukazivale na nepostojeću fasciklu lab-1-azd-basics

#### Изменjeno
- **Prezentacija radionice**: Uklonjena upozorenja "under construction", radionica je sada kompletna i spremna za upotrebu
- **Konzistentnost navigacije**: Obezbeđeno da svi moduli radionice imaju pravilnu međumodularnu navigaciju
- **Reference puta učenja**: Ažurirane međuknjižne reference poglavlja da koriste ispravne microsoft-foundry puteve

#### Validirano
- ✅ Svi engleski markdown fajlovi imaju validne interne linkove
- ✅ Moduli radionice 0-7 su kompletni sa ciljevima učenja
- ✅ Navigacija između poglavlja i modula funkcioniše ispravno
- ✅ Sadržaj je pogodan za AI developere koji koriste Microsoft AZD
- ✅ Očuvan je jezik prilagođen početnicima i struktura kroz ceo sadržaj
- ✅ CONTRIBUTING.md daje jasna uputstva za članove zajednice

#### Tehnička implementacija
- **Provera linkova**: Automatizovani PowerShell skript verifikovao sve .md interne linkove
- **Revizija sadržaja**: Ručna provera potpunosti radionice i pogodnosti za početnike
- **Sistem navigacije**: Primenjeni dosledni obrasci navigacije poglavlja i modula

#### Napomene
- **Opseg**: Izmene primenjene samo na englesku dokumentaciju
- **Prevodi**: Fascikle sa prevodima nisu ažurirane u ovoj verziji (automatizovani prevod će se sinhronizovati kasnije)
- **Trajanje radionice**: Kompletna radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Monitoring, sigurnost i obrasci za više agenata
**Ova verzija dodaje sveobuhvatne A-grade lekcije o integraciji Application Insights, obrascima autentikacije i koordinaciji više agenata za produkcione deployment-e.**

#### Додато
- **📊 Lekcija o integraciji Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - Deploy fokusiran na AZD sa automatskim provisioningom
  - Potpuni Bicep šabloni za Application Insights + Log Analytics
  - Funkcionalne Python aplikacije sa prilagođenom telemetrijom (1.200+ linija)
  - Obrasci monitoringa za AI/LLM (praćenje tokena/troškova Microsoft Foundry Models)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, tok telemetrije)
  - 3 praktična zadatka (alarme, dashboard-i, AI monitoring)
  - Primeri Kusto upita i strategije optimizacije troškova
  - Strimovanje metrika uživo i debagovanje u realnom vremenu
  - 40–50 minuta vremena za učenje sa produkcionim obrascima

- **🔐 Lekcija o obrascima autentikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentikacije (connection strings, Key Vault, managed identity)
  - Potpuni Bicep infrastrukturni šabloni za sigurne deployment-e
  - Node.js kod aplikacije sa integracijom Azure SDK
  - 3 kompletna zadatka (omogućavanje managed identity, user-assigned identity, rotacija Key Vault-a)
  - Najbolje prakse za sigurnost i RBAC konfiguracije
  - Vodič za rešavanje problema i analiza troškova
  - Produkcioni obrasci autentikacije bez lozinki

- **🤖 Lekcija o obrascima koordinacije više agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, vođen događajima, konsenzus)
  - Kompletna implementacija orkestratorske usluge (Python/Flask, 1.500+ linija)
  - 3 specijalizovane implementacije agenata (Research, Writer, Editor)
  - Integracija Service Bus-a za poruke u redu
  - Upravljanje stanjem u Cosmos DB za distribuirane sisteme
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredna zadatka (rukovanje timeout-om, logika ponovnog pokušaja, circuit breaker)
  - Raspad troškova ($240–565/month) sa strategijama optimizacije
  - Integracija Application Insights za monitoring

#### Poboljšano
- **Poglavlje Pre-deployment**: Sada uključuje sveobuhvatne obrasce monitoringa i koordinacije
- **Poglavlje Getting Started**: Unapređeno sa profesionalnim obrazcima autentikacije
- **Spremnost za produkciju**: Potpuno pokrivanje od sigurnosti do observability
- **Sadržaj kursa**: Ažuriran da referencira nove lekcije u poglavljima 3 i 6

#### Изменjeno
- **Progresija učenja**: Bolja integracija sigurnosti i monitoringa kroz ceo kurs
- **Kvalitet dokumentacije**: Dosledni A-grade standardi (95–97%) kroz nove lekcije
- **Produkcioni obrasci**: Potpuno end-to-end pokrivanje za enterprise deployment-e

#### Unapređeno
- **Iskustvo developera**: Jasna staza od razvoja do produkcionog monitoringa
- **Standardi sigurnosti**: Profesionalni obrasci za autentikaciju i upravljanje tajnama
- **Observability**: Potpuna integracija Application Insights sa AZD
- **AI radni opterećenja**: Specijalizovani monitoring za Microsoft Foundry Models i sisteme sa više agenata

#### Validirano
- ✅ Sve lekcije uključuju kompletan radni kod (ne samo isječke)
- ✅ Mermaid dijagrami za vizuelno učenje (ukupno 19 kroz 3 lekcije)
- ✅ Praktični zadaci sa koracima verifikacije (ukupno 9)
- ✅ Produkcioni Bicep šabloni koji se mogu deploy-ovati preko `azd up`
- ✅ Analize troškova i strategije optimizacije
- ✅ Vodiči za rešavanje problema i najbolje prakse
- ✅ Kontrolne tačke znanja sa komandama za verifikaciju

#### Rezultati ocenjivanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za monitoring
- **docs/getting-started/authsecurity.md**: - Profesionalni obrasci sigurnosti
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture sa više agenata
- **Ukupan novi sadržaj**: - Dosledni standardi visoke kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentikacija**: Managed Identity + Key Vault + RBAC obrasci
- **Više agenata**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Monitoring**: Metrike uživo + Kusto upiti + alarmi + dashboard-i
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrola budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvaliteta dokumentacije i novi primer Microsoft Foundry Models
**Ova verzija unapređuje kvalitet dokumentacije kroz repozitorijum i dodaje kompletan primer deployment-a Microsoft Foundry Models sa gpt-4.1 chat interfejsom.**

#### Додато
- **🤖 Primer chata za Microsoft Foundry Models**: Kompletan deployment gpt-4.1 sa radnom implementacijom u `examples/azure-openai-chat/`:
  - Kompletna infrastruktura za Microsoft Foundry Models (deploy gpt-4.1 modela)
  - Python komandno-linijski chat interfejs sa istorijom konverzacije
  - Integracija sa Key Vault-om za sigurno čuvanje API ključeva
  - Praćenje upotrebe tokena i procena troškova
  - Ograničavanje brzine zahteva i rukovanje greškama
  - Sveobuhvatan README sa vodičem za deploy od 35–45 minuta
  - 11 produkciono spremnih fajlova (Bicep šabloni, Python aplikacija, konfiguracija)
- **📚 Vežbe iz dokumentacije**: Dodate praktične vežbe u vodič za konfiguraciju:
  - Vežba 1: Konfiguracija za više okruženja (15 minuta)
  - Vežba 2: Vežba upravljanja tajnama (10 minuta)
  - Jasni kriterijumi uspeha i koraci verifikacije
- **✅ Verifikacija deployment-a**: Dodata sekcija verifikacije u vodič za deployment:
  - Procedure provere zdravlja
  - Lista kriterijuma uspeha
  - Očekivani izlazi za sve komande za deployment
  - Brzi referentni vodič za rešavanje problema

#### Unapređeno
- **examples/README.md**: Ažuriran na A-grade kvalitet (93%):
  - Dodato azure-openai-chat u sve relevantne sekcije
  - Ažuriran broj lokalnih primera sa 3 na 4
  - Dodato u tabelu AI Application Examples
  - Integrisano u Quick Start za srednje napredne korisnike
  - Dodato u Microsoft Foundry Templates sekciju
  - Ažurirane Comparison Matrix i odeljci za tehnologije
- **Kvalitet dokumentacije**: Poboljšan sa B+ (87%) → A- (92%) kroz docs folder:
  - Dodati očekivani izlazi kritičnim primerima komandi
  - Uključeni koraci verifikacije za promene konfiguracije
  - Poboljšano praktično učenje sa praktičnim vežbama

#### Изменjeno
- **Progresija učenja**: Bolja integracija AI primera za srednje napredne korisnike
- **Struktura dokumentacije**: Više akcijskih vežbi sa jasnim ishodima
- **Proces verifikacije**: Eksplicitni kriterijumi uspeha dodati ključnim tokovima rada

#### Unapređeno
- **Iskustvo developera**: Deploy Microsoft Foundry Models sada traje 35–45 minuta (naspram 60–90 za kompleksnije alternative)
- **Transparentnost troškova**: Jasne procene troškova ($50–200/month) za primer Microsoft Foundry Models
- **Put učenja**: AI developeri imaju jasan ulazni tačku sa azure-openai-chat
- **Standardi dokumentacije**: Dosledni očekivani izlazi i koraci verifikacije

#### Validirano
- ✅ Primer Microsoft Foundry Models potpuno funkcionalan sa `azd up`
- ✅ Svih 11 fajlova implementacije sintaksno ispravni
- ✅ Uputstva u README se poklapaju sa realnim iskustvom deployment-a
- ✅ Linkovi u dokumentaciji ažurirani na 8+ lokacija
- ✅ Indeks primera tačno odražava 4 lokalna primera
- ✅ Nema duplih eksternih linkova u tabelama
- ✅ Sve reference za navigaciju su ispravne

#### Tehnička implementacija
- **Arhitektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps obrazac
- **Sigurnost**: Spremno za Managed Identity, tajne u Key Vault-u
- **Monitoring**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija upotrebe
- **Deployment**: Jedna komanda `azd up` za kompletno postavljanje

### [v3.6.0] - 2025-11-19

#### Veliko ažuriranje: Primeri deployment-a Container App
**Ova verzija uvodi sveobuhvatne, produkciono spremne primere deployment-a kontejnerizovanih aplikacija koristeći Azure Developer CLI (AZD), sa kompletnom dokumentacijom i integracijom u put učenja.**

#### Додато
- **🚀 Primeri Container App**: Novi lokalni primeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Kompletan pregled containerizovanih deployment-a, quick start, produkcija i napredni obrasci
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api): REST API pogodan za početnike sa scale-to-zero, health probes, monitoringom i rešavanjem problema
  - [Arhitektura mikroservisa](../../examples/container-app/microservices): Produkcioni multi-service deployment (API Gateway, Product, Order, User, Notification), asinhrono slanje poruka, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary deployment
- **Najbolje prakse**: Sigurnost, monitoring, optimizacija troškova i CI/CD smernice za containerizovana radna opterećenja
- **Primeri koda**: Kompletan `azure.yaml`, Bicep šabloni, i implementacije servisa na više jezika (Python, Node.js, C#, Go)
- **Testiranje i rešavanje problema**: Scenariji end-to-end testiranja, komande za monitoring, vodiči za rešavanje problema

#### Изменjeno
- **README.md**: Aжурирано да садржи и линкује нове примере контейнер апликација под "Local Examples - Container Applications"
- **examples/README.md**: Ажурирано да истакне примере контейнер апликација, додаје уносе у матрицу поређења и ажурира технологије/архитектонске референце
- **Course Outline & Study Guide**: Ажурирано да реферише нове примере контейнер апликација и обрасце распоређивања у релевантним поглављима

#### Validated
- ✅ Сви нови примери могу да се распоређују помоћу `azd up` и прате најбоље праксе
- ✅ Крстосана повезивања у документацији и навигација ажурирани
- ✅ Примери обухватају сценарије од почетничких до напредних, укључујући продукционе микросервисе

#### Notes
- **Scope**: Само документација и примери на енглеском
- **Next Steps**: Проширити додатним напредним образцима за контејнере и CI/CD аутоматизацијом у будућим издањима

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Ово издање спроводи свеобухватну промену имена производа са "Microsoft Foundry" на "Microsoft Foundry" у целој англојезичној документацији, у складу са званичним ребрендирањем Microsoft-а.**

#### Changed
- **🔄 Product Name Update**: Потпуно ребрендирање са "Microsoft Foundry" на "Microsoft Foundry"
  - Ажуриране све референце у англојезичној документацији у фолдеру `docs/`
  - Преименован фолдер: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименован фајл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Укупно: 23 садржајне референце ажуриране у 7 документацијских фајлова

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` преименован у `docs/microsoft-foundry/`
  - Све међуреференце ажуриране да одражавају нову структуру фолдера
  - Навигациони линкови верификовани у целој документацији

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Сви интерни линкови ажурирани да реферишу ново име фајла

#### Updated Files
- **Документација поглавља** (7 фајлова):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ажурирања навигационих линкова
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 референце имена производа ажуриране
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Већ користи Microsoft Foundry (из претходних ажурирања)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 референце ажуриране (преглед, повратне информације заједнице, документација)
  - `docs/getting-started/azd-basics.md` - 4 ажурирана међуреференце
  - `docs/getting-started/first-project.md` - 2 ажурана линка за навигацију између поглавља
  - `docs/getting-started/installation.md` - 2 ажурана линка за следеће поглавље
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 референце ажуриране (навигација, Discord заједница)
  - `docs/troubleshooting/common-issues.md` - 1 ажурирани навигациони линк
  - `docs/troubleshooting/debugging.md` - 1 ажурвани навигациони линк

- **Фајлови структуре курса** (2 фајла):
  - `README.md` - 17 референци ажурирано (преглед курса, наслови поглавља, секција шаблона, увиди заједнице)
  - `course-outline.md` - 14 референци ажурирано (преглед, циљеви учења, ресурси поглавља)

#### Validated
- ✅ Нула преосталих референци путање фолдера "ai-foundry" у англојезичној документацији
- ✅ Нула преосталих референци имена производа "Microsoft Foundry" у англојезичној документацији
- ✅ Сви навигациони линкови функционални са новом структуром фолдера
- ✅ Преименовања фајлова и фолдера успешно завршена
- ✅ Крстосане референце између поглавља верификоване

#### Notes
- **Scope**: Промене применјене само на англојезичну документацију у фолдеру `docs/`
- **Translations**: Фолдери за преводе (`translations/`) нису ажурирани у овој верзији
- **Workshop**: Материјали радионице (`workshop/`) нису ажурирани у овој верзији
- **Examples**: Фајлови примера могу још увек да садрже референце на наслеђена именовања (обићи ће се у будућем ажурирању)
- **External Links**: Спољни URL-ови и GitHub референце остају неизмењени

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Ажурирајте референце фолдера: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ажурирајте референце фајлова: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените име производа: "Microsoft Foundry" → "Microsoft Foundry"
4. Верификујте да сви интерни документациони линкови и даље функционишу

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Ово издање уводи свеобухватну подршку за нову preview функцију Azure Developer CLI и побољшава корисничко искуство радионице.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Свеобухватно покривање нове инфраструктурне preview могућности
  - Reference команде и примери употребе у cheat sheet-у
  - Детаљна интеграција у водич за провизију са случајевима коришћења и предностима
  - Интеграција pre-flight провере за безбеднију валидацију распоређивања
  - Ажурирања водича за почетак рада са праксама које фаворизују безбедност током развоја
- **🚧 Workshop Status Banner**: Професионални HTML банер који указује на статус развоја радионице
  - Градијентни дизајн са индикаторима изградње за јасну комуникацију са корисницима
  - Временска ознака последњег ажурирања ради транспарентности
  - Мобилно-одзиван дизајн за све типове уређаја

#### Enhanced
- **Infrastructure Safety**: Превиев функционалност интегрисана кроз целу документацију о распоређивању
- **Pre-deployment Validation**: Аутоматизовани скрипти сада укључују тестирање preview-а инфраструктуре
- **Developer Workflow**: Ажурирани низови команди који укључују preview као најбољу праксу
- **Workshop Experience**: Јасно постављена очекивања за кориснике о статусу развоја садржаја

#### Changed
- **Deployment Best Practices**: Preview-прво радни ток сада препоручени приступ
- **Documentation Flow**: Валидација инфраструктуре премештена раније у процес учења
- **Workshop Presentation**: Професионална комуникација статуса са јасним временским оквиром развоја

#### Improved
- **Safety-First Approach**: Промене у инфраструктури сада могу да се валидају пре распоређивања
- **Team Collaboration**: Резултати preview-а могу се делити ради рецензије и одобрења
- **Cost Awareness**: Боље разумевање трошкова ресурса пре провизије
- **Risk Mitigation**: Смањен број неуспелих распоређивања преко унапредне валидације

#### Technical Implementation
- **Multi-document Integration**: Preview функција документована у 4 кључна фајла
- **Command Patterns**: Конзистентна синтакса и примери кроз целу документацију
- **Best Practice Integration**: Preview укључен у валидационе токове и скрипте
- **Visual Indicators**: Јасне Oznake за НОВУ функцију ради лакшег проналажења

#### Workshop Infrastructure
- **Status Communication**: Професионални HTML банер са градијентним стиловањем
- **User Experience**: Јасан развојни статус ради превенције конфузије
- **Professional Presentation**: Одржава кредибилитет репозиторијума уз постављање очекивања
- **Timeline Transparency**: Октобар 2025 као временска ознака последњег ажурирања за одговорност

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Ово издање уводи свеобухватне материјале радионице са водичима интерактивним у прегледачу и структурираним путањама учења.**

#### Added
- **🎥 Interactive Workshop Guide**: Искуство радионице у прегледачу са MkDocs preview могућношћу
- **📝 Structured Workshop Instructions**: 7-степени вођени пут учења од открића до прилагођавања
  - 0-Introduction: Преглед радионице и подешавање
  - 1-Select-AI-Template: Процес откривања и избора шаблона
  - 2-Validate-AI-Template: Процедуре распоређивања и валидације
  - 3-Deconstruct-AI-Template: Разумевање архитектуре шаблона
  - 4-Configure-AI-Template: Конфигурација и прилагођавање
  - 5-Customize-AI-Template: Напредне измене и итерације
  - 6-Teardown-Infrastructure: Чишћење и управљање ресурсима
  - 7-Wrap-up: Резиме и следећи кораци
- **🛠️ Workshop Tooling**: MkDocs конфигурација са Material темом за побољшано искуство учења
- **🎯 Hands-On Learning Path**: 3-степена методологија (Откривање → Распоређивање → Прилагођавање)
- **📱 GitHub Codespaces Integration**: Беспрекорно подешавање развојног окружења

#### Enhanced
- **AI Workshop Lab**: Проширен са свеобухватним структурисаним искуством учења од 2-3 сата
- **Workshop Documentation**: Професионална презентација са навигацијом и визуелним помагалима
- **Learning Progression**: Јасна вођена упутства корак по корак од избора шаблона до продукционог распоређивања
- **Developer Experience**: Интегрисани алати за поједностављене развојне токове

#### Improved
- **Accessibility**: Интерфејс у прегледачу са претрагом, могућношћу копирања и прекидачем тема
- **Self-Paced Learning**: Флексибилна структура радионице која одговара различитим темпима учења
- **Practical Application**: Реалне сценарије распоређивања AI шаблона
- **Community Integration**: Интеграција Discord-а за подршку радионици и сарадњу

#### Workshop Features
- **Built-in Search**: Брзо откривање кључних речи и лекција
- **Copy Code Blocks**: Функција копирања курсором за све примере кода
- **Theme Toggle**: Подршка за tamnu/svetlu тему по жељи
- **Visual Assets**: Снимаци екрана и дијаграми за боље разумевање
- **Help Integration**: Директан приступ Discord-у за подршку заједници

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Ово издање уводи свеобухватну структуру учења засновану на поглављима са побољшаном навигацијом кроз цео репозиторијум.**

#### Added
- **📚 Chapter-Based Learning System**: Реструктурирана целокупна настава у 8 прогресивних поглавља
  - Chapter 1: Основа & Брзи почетак (⭐ - 30-45 мин)
  - Chapter 2: AI-First развој (⭐⭐ - 1-2 сата)
  - Chapter 3: Конфигурација & Аутентификација (⭐⭐ - 45-60 мин)
  - Chapter 4: Infrastructure as Code & Распоређивање (⭐⭐⭐ - 1-1.5 сата)
  - Chapter 5: Multi-Agent AI решења (⭐⭐⭐⭐ - 2-3 сата)
  - Chapter 6: Pre-Deployment валидација & Планирање (⭐⭐ - 1 сат)
  - Chapter 7: Троублесхоотинг & Дебаговање (⭐⭐ - 1-1.5 сата)
  - Chapter 8: Production & Enterprise обрасци (⭐⭐⭐⭐ - 2-3 сата)
- **📚 Comprehensive Navigation System**: Конзистентни заглавља и футери за навигацију кроз целу документацију
- **🎯 Progress Tracking**: Чек-листа за завршетак курса и систем верификације учења
- **🗺️ Learning Path Guidance**: Јасне улазне тачке за различите нивое искуства и циљеве
- **🔗 Cross-Reference Navigation**: Pелевантна поглавља и предуслови јасно повезани

#### Enhanced
- **README Structure**: Претворен у структурирану платформу за учење са организацијом по поглављима
- **Documentation Navigation**: Svaka страница сада укључује контекст поглавља и водич кроз напредовање
- **Template Organization**: Примери и шаблони мапирани на одговарајућа поглавља
- **Resource Integration**: Cheat sheets, FAQs и студијски водичи повезани са релевантним поглављима
- **Workshop Integration**: Практичне лабораторије повезане са више циљева поглавља

#### Changed
- **Learning Progression**: Прелазак са линеарне документације на флексибилан систем по поглављима
- **Configuration Placement**: Позиционирање водича за конфигурацију као Поглавље 3 ради бољег тока учења
- **AI Content Integration**: Боља интеграција AI специфичног садржаја кроз цело путовање учења
- **Production Content**: Напредни обрасци консолидовани у Поглављу 8 за корпоративне ученике

#### Improved
- **User Experience**: Јасни breadcrumbs за навигацију и индикатори напретка по поглављима
- **Accessibility**: Конзистентни обрасци навигације за лакше кретање кроз курс
- **Professional Presentation**: Универзитетски стил структуре курса погодан за академску и корпоративну обуку
- **Learning Efficiency**: Скратљено време за проналажење релевантног садржаја посредством побољшане организације

#### Technical Implementation
- **Navigation Headers**: Стандаризована навигација поглавља у преко 40 документацијских фајлова
- **Footer Navigation**: Конзистентне смернице за напредовање и индикатори завршетка поглавља
- **Cross-Linking**: Свеобухватан систем унутрашњих линкова који повезују сродне појмове
- **Chapter Mapping**: Шаблони и примери јасно повезани са циљевима учења

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Реструктурисани студијски водич у складу са системом од 8 поглавља
- **🎯 Chapter-Based Assessment**: Свако поглавље садржи специфичне циљеве учења и практичне задатке
- **📋 Progress Tracking**: Недељни распоред учења са мерљивим исходима и чек-листама завршетка
- **❓ Assessment Questions**: Питања за валидацију знања за свако поглавље са професионалним резултатима
- **🛠️ Practical Exercises**: Практичне активности са стварним сценаријима распоређивања и решавања проблема
- **📊 Skill Progression**: Јасан напредак од основних концепата до корпоративних образаца са фокусом на развој каријере
- **🎓 Certification Framework**: Резултати професионалног развоја и систем признања у заједници
- **⏱️ Timeline Management**: Структурисани 10-недељни план учења са валидацијом прекретница

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Ово издање унапређује решење за мулти-агентску трговину са бољим именовањем агената и побољшаном документацијом.**

#### Changed
- **Multi-Agent Terminology**: Замењен термин "Cora agent" са "Customer agent" кроз цело решење за мулти-агентску трговину ради бољег разумевања
- **Agent Architecture**: Ажурирана цела документација, ARM шаблони и примери кода да користе конзистентно именовање "Customer agent"
- **Configuration Examples**: Модернизовани обрасци конфигурације агената са ажурираним конвенцијама именовања
- **Documentation Consistency**: Остварено да све референце користе професионална, описна имена агената

#### Побољшано
- **ARM шаблон пакет**: Ажурирано retail-multiagent-arm-template са референцама на Customer агента
- **Архитектонски дијаграми**: Освежени Mermaid дијаграми са ажурираним именовањем агената
- **Примери кода**: Python класе и примери имплементације сада користе именовање CustomerAgent
- **Променљиве окружења**: Ажурирани сви скрипти за деплојмент да користе CUSTOMER_AGENT_NAME конвенције

#### Побољшано
- **Искуство програмера**: Јасније улоге и одговорности агената у документацији
- **Спремност за продукцију**: Боља усаглашеност са пословним конвенцијама именовања
- **Наставни материјали**: Интуитивније именовање агената за образовне сврхе
- **Употребљивост шаблона**: Поједностављено разумевање функција агената и образаца деплоја

#### Технички детаљи
- Ажурирани Mermaid архитектонски дијаграми са референцама на CustomerAgent
- Замењена имена класе CoraAgent са CustomerAgent у Python примерима
- Измењене ARM шаблон JSON конфигурације да користе тип агента "customer"
- Ажуриране променљиве окружења са CORA_AGENT_* на CUSTOMER_AGENT_* обрасце
- Освежене све команде за деплојмент и конфигурације контејнера

### [v3.0.0] - 2025-09-12

#### Главне промене - Фокус на AI програмере и интеграција са Microsoft Foundry
**Ова верзија претвара репозиторијум у свеобухватан ресурс за учење фокусиран на AI уз интеграцију Microsoft Foundry.**

#### Додато
- **🤖 AI-First Learning Path**: Потпуна реконструкција која приоритет даје AI програмерима и инжењерима
- **Microsoft Foundry Integration Guide**: Свеобухватна документација за повезивање AZD са Microsoft Foundry сервисима
- **AI Model Deployment Patterns**: Детаљан водич који покрива избор модела, конфигурацију и стратегије продукционог деплоја
- **AI Workshop Lab**: 2–3-часовна практична радионица за претварање AI апликација у AZD-деплојабилна решења
- **Production AI Best Practices**: Пословно спремни образци за скалирање, праћење и обезбеђивање AI радних оптерећења
- **AI-Specific Troubleshooting Guide**: Свеобухватно решавање проблема за Microsoft Foundry Models, Cognitive Services и проблеме при деплоју AI
- **AI Template Gallery**: Фокусирана колекција Microsoft Foundry шаблона са оценама сложености
- **Workshop Materials**: Комплетна структура радионице са практичним лабораторијама и референтним материјалима

#### Унапређено
- **README Structure**: Усмерено ка AI програмерима уз 45% података о интересовању заједнице из Microsoft Foundry Discord
- **Learning Paths**: Посебна AI програмерска путања поред традиционалних за студенте и DevOps инжењере
- **Template Recommendations**: Истакнути AI шаблони укључују azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Community Integration**: Побољшана подршка Discord заједнице са AI-специфичним каналима и дискусијама

#### Фокус на безбедност и продукцију
- **Managed Identity Patterns**: AI-специфична аутентификација и безбедносне конфигурације
- **Cost Optimization**: Праћење коришћења токена и контроле буџета за AI радна оптерећења
- **Multi-Region Deployment**: Стратегије за глобални деплој AI апликација
- **Performance Monitoring**: AI-специфичне метрике и интеграција са Application Insights

#### Квалитет документације
- **Linear Course Structure**: Логичан напредак од почетног до напредног нивоа у образовању за AI деплоје
- **Validated URLs**: Сви спољни линкови ка репозиторијумима проверени и доступни
- **Complete Reference**: Сви интерни документи и линкови проверени и функционални
- **Production Ready**: Пословни обрасци деплоја са примерима из реалног света

### [v2.0.0] - 2025-09-09

#### Главне промене - Реструктурирање репозиторијума и професионално унапређење
**Ова верзија представља значајну ревизију структуре репозиторијума и презентације садржаја.**

#### Додато
- **Structured Learning Framework**: Све странице документације сада садрже секције Увод, Циљеве учења и Резултате учења
- **Navigation System**: Додати Previous/Next линкови лекција кроз целу документацију за вођено учење
- **Study Guide**: Свеобухватан study-guide.md са циљевима учења, вежбама и материјалима за оцeњивање
- **Professional Presentation**: Уклоњени сви емотикони ради боље доступности и професионалног изгледа
- **Enhanced Content Structure**: Побољшана организација и ток наставних материјала

#### Промењено
- **Documentation Format**: Стандартизована цела документација са доследном структуром фокусираном на учење
- **Navigation Flow**: Имплементиран логичан напредак кроз све материјале за учење
- **Content Presentation**: Уклоњени декоративни елементи у корист јасног, професионалног формата
- **Link Structure**: Ажурирани сви интерни линкови да подрже нови навигациони систем

#### Побољшано
- **Accessibility**: Уклоњена зависност од емотикона ради боље компатибилности са читачима екрана
- **Professional Appearance**: Чист, академски стил презентације погодан за пословна окружења
- **Learning Experience**: Структурисан приступ са јасним циљевима и исходима за сваку лекцију
- **Content Organization**: Бољи логички ток и повезаност између сродних тема

### [v1.0.0] - 2025-09-09

#### Почетно издање - Свеобухватно AZD учење репозиторијум

#### Додато
- **Core Documentation Structure**
  - Комплетан серијал водича за почетак
  - Свеобухватна документација за деплој и провизију
  - Детаљни ресурси за решавање проблема и водичи за дебаговање
  - Алатке и процедуре за валидацију пре деплоја

- **Getting Started Module**
  - AZD Basics: Основни концепти и терминологија
  - Installation Guide: Упутства за подешавање по платформи
  - Configuration Guide: Подешавање окружења и аутентификација
  - First Project Tutorial: Корак по корак практичан туторијал

- **Deployment and Provisioning Module**
  - Deployment Guide: Потпуна документација радног тока
  - Provisioning Guide: Infrastructure as Code са Bicep
  - Најбоље праксе за продукционе деплоје
  - Обрасци архитектуре са више сервиса

- **Pre-deployment Validation Module**
  - Capacity Planning: Валидација доступности Azure ресурса
  - SKU Selection: Детаљан водич за избор нивоа услуга
  - Pre-flight Checks: Аутоматизовани скриптови за валидацију (PowerShell and Bash)
  - Процена трошкова и алати за планирање буџета

- **Troubleshooting Module**
  - Common Issues: Често сусретани проблеми и решења
  - Debugging Guide: Систематске методологије за решавање проблема
  - Напредне дијагностичке технике и алати
  - Праћење перформанси и оптимизација

- **Resources and References**
  - Command Cheat Sheet: Брзи подсетник за основне команде
  - Glossary: Свеобухватна дефиниција терминологије и акронима
  - FAQ: Детаљни одговори на честе питања
  - Спољни референтни линкови и везе са заједницом

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Карактеристике
- **Multi-Platform Support**: Упутства за инсталацију и конфигурацију за Windows, macOS и Linux
- **Multiple Skill Levels**: Садржај дизајниран за студенте до професионалних програмера
- **Practical Focus**: Практични примери и сценарији из стварног света
- **Comprehensive Coverage**: Од основних концепата до напредних пословних образаца
- **Security-First Approach**: Најбоље праксе безбедности интегрисане кроз целокупан садржај
- **Cost Optimization**: Водичи за економичне деплоје и управљање ресурсима

#### Квалитет документације
- **Detailed Code Examples**: Практични, тестирани примери кода
- **Step-by-Step Instructions**: Јасне, изводљиве инструкције
- **Comprehensive Error Handling**: Решавање уобичајених грешака
- **Best Practices Integration**: Индустријски стандарди и препоруке
- **Version Compatibility**: Усклађено са најновијим Azure сервисима и azd функционалностима

## Планирана будућа унапређења

### Version 3.1.0 (Planned)
#### Проширење AI платформе
- **Multi-Model Support**: Обрасци интеграције за Hugging Face, Azure Machine Learning и прилагођене моделе
- **AI Agent Frameworks**: Шаблони за LangChain, Semantic Kernel и AutoGen деплоје
- **Advanced RAG Patterns**: Опције векторских база података поред Azure AI Search (Pinecone, Weaviate, итд.)
- **AI Observability**: Побољшано праћење перформанси модела, коришћења токена и квалитета одговора

#### Искуство програмера
- **VS Code Extension**: Интегрисано AZD + Microsoft Foundry развојно искуство
- **GitHub Copilot Integration**: AI-помоћ при генерисању AZD шаблона
- **Interactive Tutorials**: Практичне вежбе кодирања са аутоматизованом валидацијом за AI сценарије
- **Video Content**: Допунски видео туторијали за визуелне ученике фокусиране на AI деплоје

### Version 4.0.0 (Planned)
#### Пословни AI обрасци
- **Governance Framework**: Управљање моделима AI, усаглашеност и трагови ревизије
- **Multi-Tenant AI**: Обрасци за сервисирање више клијената са изолованим AI сервисима
- **Edge AI Deployment**: Интеграција са Azure IoT Edge и container instances
- **Hybrid Cloud AI**: Мулти-клауд и хибридни обрасци деплоја за AI радна оптерећења

#### Напредне функције
- **AI Pipeline Automation**: MLOps интеграција са Azure Machine Learning пипелинима
- **Advanced Security**: Zero-trust обрасци, приватни ентрипоинтови и напредна заштита од претњи
- **Performance Optimization**: Напредно подешавање и стратегије скалирања за апликације са великим пропусним опсегом
- **Global Distribution**: Обрасци доставе садржаја и кеширања на ивици за AI апликације

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Предложени додаци - Сада имплементирани у v3.0.0
- ✅ **AI-Focused Content**: Свеобухватна Microsoft Foundry интеграција (Завршено)
- ✅ **Interactive Tutorials**: Практична AI радионица (Завршено)
- ✅ **Advanced Security Module**: AI-специфични безбедносни обрасци (Завршено)
- ✅ **Performance Optimization**: Стратегије подешавања AI радних оптерећења (Завршено)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Мале измене - Неке имплементиране у тренутном издању
- ✅ **Additional Examples**: AI-оријентисани сценарији деплоја (Завршено)
- ✅ **Extended FAQ**: AI-специфична питања и решавања проблема (Завршено)
- **Tool Integration**: Побољшани водичи за интеграцију IDE-а и едитора
- ✅ **Monitoring Expansion**: Проширено праћење и алармирање за AI (Завршено)

#### Још планирано за будуће издање
- **Mobile-Friendly Documentation**: Респонзивни дизајн за мобилно учење
- **Offline Access**: Преузимање пакета документације за офлајн приступ
- **Enhanced IDE Integration**: VS Code екстензија за AZD + AI радне токове
- **Community Dashboard**: Редовни статистички приказ заједнице и праћење доприноса

## Допринос запису промена

### Пријављивање промена
Када доприносите овом репозиторијуму, молимо осигурајте да уноси у changelog садрже:

1. **Број верзије**: Пратећи семантичко верзионисање (major.minor.patch)
2. **Датум**: Датум издања или ажурирања у формату YYYY-MM-DD
3. **Категорија**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Јасан опис**: Концизан опис шта је промењено
5. **Процена утицаја**: Како измене утичу на постојеће кориснике

### Категорије измена

#### Додато
- Нове функције, секције документације или могућности
- Нови примери, шаблони или ресурси за учење
- Додатни алати, скрипте или услужни програми

#### Промењено
- Измене постојеће функционалности или документације
- Ажурирања у циљу побољшања јасноће или тачности
- Реструктурирање садржаја или организације

#### Остављено (Deprecated)
- Карактеристике или приступи који се постепено укидају
- Секције документације планиране за уклањање
- Методе за које постоје боље алтернативе

#### Уклоњено
- Карактеристике, документација или примери који више нису релевантни
- Застареле информације или укинути приступи
- Редундантан или консолидован садржај

#### Поправљено
- Исправке грешака у документацији или коду
- Решавање пријављених проблема или кварова
- Побољшања тачности или функционалности

#### Безбедност
- Побољшања или исправке везане за безбедност
- Ажурирања најбољих безбедносних пракси
- Решавање безбедносних рањивости

### Смјернице за семантичко верзионисање

#### Главна верзија (X.0.0)
- Промене које крше уназадну компатибилност и захтевају рад корисника
- Значајно реструктурирање садржаја или организације
- Промене које мењају фундаментални приступ или методологију

#### Мања верзија (X.Y.0)
- Нове функције или додаци садржаја
- Побољшања која одржавају уназадну компатибилност
- Додатни примери, алати или ресурси

#### Патцх верзија (X.Y.Z)
- Исправке грешака и корекције
- Мала побољшања постојећег садржаја
- Појашњења и ситна унапређења

## Повратне информације за заједницу и предлози

Активно охрабрујемо повратне информације за побољшање овог ресурса за учење:

### Како дати повратне информације
- **GitHub Issues**: Пријавите проблеме или предложите унапређења (AI-специфични проблеми су добродошли)
- **Discord Discussions**: Делите идеје и ангажујте се са Microsoft Foundry заједницом
- **Pull Requests**: Директно допринесите побољшањима садржаја, нарочито AI шаблонима и водичима
- **Microsoft Foundry Discord**: Учествујте у #Azure каналу за дискусије о AZD + AI
- **Community Forums**: Укључите се у шире Azure програмерске дискусије

### Категорије повратних информација
- **AI Content Accuracy**: Исправке интеграције AI сервиса и информација о деплоју
- **Learning Experience**: Предлози за побољшање тока учења за AI програмере
- **Missing AI Content**: Захтеви за додатним AI шаблонима, обрасцима или примерима
- **Accessibility**: Унапређења за различите потребе учења
- **AI Tool Integration**: Предлози за бољу интеграцију AI алата у развојни ток
- **Production AI Patterns**: Захтеви за пословне обрасце деплоја AI

### Обећање о одговору
- **Issue Response**: У року од 48 сати за пријављене проблеме
- **Feature Requests**: Евалуација у року од једне недеље
- **Community Contributions**: Преглед у року од једне недеље
- **Security Issues**: Одмах као приоритет уз убрзан одговор

## Ред одржавања

### Редовна ажурирања
- **Monthly Reviews**: Провера тачности садржаја и валидација линкова
- **Quarterly Updates**: Значајни додаци и побољшања садржаја
- **Semi-Annual Reviews**: Свеобухватно реструктурирање и унапређење
- **Annual Releases**: Главна издања са значајним унапређењима

### Праћење и контролa квалитета
- **Automated Testing**: Редовна валидација примера кода и линкова
- **Community Feedback Integration**: Редовно увођење предлога корисника
- **Technology Updates**: Усклађивање са најновијим Azure сервисима и azd издањима
- **Accessibility Audits**: Редовни прегледи за инклузивни дизајн

## Политика подршке верзија

### Current Version Support
- **Најновија главна верзија**: Потпуна подршка са редовним ажурирањима
- **Претходна главна верзија**: Безбедносна ажурирања и критични исправци у трајању од 12 месеци
- **Заостале верзије**: Само подршка заједнице, без званичних ажурирања

### Упутство за миграцију
Када се објаве главне верзије, пружамо:
- **Водичи за миграцију**: Детаљна упутства корак по корак за миграцију
- **Белешке о компатибилности**: Детаљи о променама које ремете компатибилност
- **Подршка алатима**: Скрипте или услужни програми који помажу при миграцији
- **Подршка заједнице**: Посвећени форуми за питања о миграцији

---

**Навигација**
- **Претходна лекција**: [Водич за учење](resources/study-guide.md)
- **Следећа лекција**: Вратите се на [Главни README](README.md)

**Останите у току**: Пратите овај репозиторијум ради обавештења о новим издањима и важним ажурирањима материјала за учење.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу AI сервиса за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионалан људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произлазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->