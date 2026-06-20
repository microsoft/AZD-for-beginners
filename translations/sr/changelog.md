# Дневник промена - AZD за почетнике

## Увод

Овај дневник промена документује све значајне измене, ажурирања и побољшања у репозиторијуму AZD за почетнике. Пратимо принципе семантичког верзионисања и одржавамо овај запис да бисмо помогли корисницима да разумеју шта се променило између верзија.

## Циљеви учења

Прегледом овог дневника промена, ви ћете:
- Бити информисани о новим функцијама и додацима садржаја
- Разумети побољшања постојеће документације
- Пратити исправке грешака и корекције ради обезбеђивања тачности
- Прати еволуцију материјала за учење током времена

## Резултати учења

Након прегледа уноса у дневник промена, бићете у стању да:
- Идентификујете нови садржај и ресурсе доступне за учење
- Разумете које су секције ажуриране или побољшане
- Планирате свој пут учења на основу најсавременијих материјала
- Дајете повратне информације и предлоге за будућа побољшања

## Историја верзија

### [v3.22.0] - 2026-06-16

#### Попуњавање празнина за почетнике #2: Ауторство шаблона, Dev контејнери, Pulumi, Azure DevOps, сервисни принципи и још много тога
**Ова верзија затвара преостале међупросторне празнине идентификоване анализом azd-coverage: како написати и објавити свој шаблон, репродуцибилна окружења за дев-контејнере/Codespaces, провајдер инфраструктуре Pulumi, шетња кроз Azure DevOps CI/CD, аутентификација сервисних принципа, смернице за избор хоста (AKS/Spring Apps), објашњења `azd restore`/`azd package`, руковање грешкама у hook-овима и праксе за тимска/заједничка окружења.**

#### Додато
- **🧱 Нова лекција у Поглављу 4** `docs/chapter-04-infrastructure/custom-templates.md` — писање сопственог azd шаблона: захтевана структура (`azure.yaml`, `infra/`, `src/`), поље `metadata.template`, параметризација инфраструктуре помоћу ресурса-токена `uniqueString()` и таг-а `azd-env-name`, тестирање локално са `azd init --template <local-path>`, објављивање на GitHub и слање у Awesome AZD галерију
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/dev-containers.md` — репродуцибилна azd окружења са Dev Containers и GitHub Codespaces: минималан `.devcontainer/devcontainer.json` који користи званичну `ghcr.io/azure/azure-dev/azd` feature, језичке специфичне фиче, `docker-in-docker` за host-ове контејнера и `azd auth login --use-device-code` за удаљено пријављивање
- **🧩 Pulumi са azd** секција у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, расположива структура фасцикли за Pulumi, stacks мапирани на azd окружења, обавезни outputs/tagging, и идентичан `azd up` / `azd down` радни ток
- **🎯 Смернице за избор хоста** у `docs/chapter-04-infrastructure/provisioning.md` — поређење прилагођено почетницима између `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, и `springapp`, са саветима када изабрати AKS или Azure Spring Apps
- **🛠️ Пролазак кроз Azure DevOps CI/CD** у `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, сервисна веза са workload identity federation (OIDC), генерисани `azure-dev.yml`, и подешавање variable-group
- **🔑 Сервисни принципи (Патерн 4)** додато у `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивни `azd auth login` са client secret у односу на федериране/OIDC креденцијале, када користити и безбедно складиштење креденцијала
- **🪝 Руковање грешкама у hook-овима** подсекција у `docs/chapter-04-infrastructure/deployment-guide.md` — exit кодови и `set -e`, `continueOnError`, тестирање hook-ова изоловано са `azd hooks run`, shell-ови специфични за ОС и `--debug`
- **👥 Тимска / заједничка окружења** секција у `docs/chapter-03-configuration/configuration.md` — шта живи у `.azure/`, шта ставити у gitignore, per-developer окружења, `azd env list`/`select`, и обезбеђивање вредности окружења у CI/CD
- **🧰 Објашњења `azd restore` и проширено `azd package`** у `resources/cheat-sheet.md` — враћање зависности и прављење deploy-abilnog артефакта без деплоја

#### Измењено
- **🧭 Табела лекција у Поглављу 4** ажурирана да укључи нову лекцију "Authoring Your Own Template" (Лекција 3)
- **🧭 Табела лекција у Поглављу 1** ажурирана да укључи нову лекцију "Dev Containers & Codespaces" (Лекција 5); навигациони футажи повезани између `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Попуњавање празнина за почетнике: Практична лекција о мулти-агентима, "Додавање своје апликације", Terraform и CI/CD водич
**Ова верзија затвара највеће празнине за комплетан водич за почетнике додавањем две нове практичне лекције (deployable walkthrough мулти-агент и додавање azd у постојећу апликацију), увод прилагођен почетницима у hook-ове, Terraform са azd секцију, корак-по-корак GitHub Actions pipeline водич, објашњење за нове preview екстензије и јасну листу за верификацију деплоя.**

#### Додато
- **🤝 Нова лекција у Поглављу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — потпуно практична, deployable дво-агент шетња (orkestrator + специјалисти) користећи реалан шаблон (`contoso-creative-writer`), обухвата када користити мулти-агент, `azd up` радни ток, разумевање деплојованих ресурса, cross-agent трасирање, прилагођавање и чишћење
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — како додати azd у постојећи пројекат са `azd init` ("use code in the current directory"), разумевање `azure.yaml` и `infra/`, `azd infra generate`, детекција хоста и деплој са `azd up`
- **🌐 Terraform са azd** секција додата у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` конфигурација, `.tf` организација фасцикли, обавезни `AZURE_*` outputs и `azd-env-name` таговање, и идентичан `azd up` / `azd down` радни ток (затвара празнину где је помињана подршка за Terraform али је приказан само Bicep)
- **⚙️ Корак-по-корак GitHub Actions водич** у `docs/chapter-08-production/production-ai-practices.md` — од GitHub репоа до аутоматизованих деплоја: `azd pipeline config`, OIDC федерирани креденцијали (без складиштених тајни), генерисани `azure-dev.yml`, и смернице о тајнама у односу на варијабле
- **🪝 Увод за почетнике "Ново у hook-овима?"** у `docs/chapter-04-infrastructure/deployment-guide.md` — шта је hook, табела стадијума hook-а, минимални први hook и покретање hook-ова ручно са `azd hooks run`
- **✅ Листа за проверу "Проверите ваш деплој"** додата у Корак 5 од `docs/chapter-01-foundation/first-project.md` — smoke тест, провера health endpoint-а и јасни критеријуми успеха
- **🧩 Објашњење за нове preview екстензије** `azure.ai.skills` и `azure.ai.connections` (шта су и када их користити) у `docs/chapter-08-production/production-ai-practices.md`

#### Измењено
- **🧭 Табела лекција у Поглављу 5** исправљена: `multi-agent-basics.md` је сада Лекција 1 (једина потпуно практична лекција), са искреним означавањем да Лекција 2 живи у Поглављу 6 и да је Retail сценарио архитектонски блуепринт, а не једнокомандни шаблон
- **🧭 Табела лекција у Поглављу 1** сада укључује нову лекцију "Bring Your Own App" (Лекција 4)
- **🔗 Навигациони футажи** ажурирани: `first-project.md` сада има линк ка `bring-your-own-app.md`

#### Поправљено
- **🧱 Затворена "тврђена али недостајућа" Terraform празнина** — курс је раније помињао подршку за Terraform без приказивања примера
- **🔀 Исправљени обмањујући крос-линкови у Поглављу 5** који су имплицирали постојање пуног мулти-агент имплементације када је постојао само архитектонски блуепринт

#### Ажуриране датотеке
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Освежавање, Потпуне команде животног циклуса агента и Aspire ребренд
**Ова верзија поново валида курс против `azd` `1.25.6` (јун 2026) и `azure.ai.agents` `0.1.40-preview` екстензије, проширује AI смернице од "скелетирај агента" до комплетног животног циклуса агента (тестирај → евалуирај → оптимизуј → инспектуј → обриши), износи нове preview екстензије `azure.ai.skills` и `azure.ai.connections`, и бележи ребренд ".NET Aspire" → "Aspire".**

#### Додато
- **🔁 Потпуни покривајући животни циклус агента** за почетнике и AI инжењере кроз документацију:
  - `docs/chapter-01-foundation/azd-basics.md` — табела животног циклуса (scaffold → test → measure → improve → inspect → clean up) додата у секцију Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — нова секција "Managing the Agent Lifecycle" која покрива `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, и `delete --force`
  - `resources/cheat-sheet.md` — проширене AI Agent команде са `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, и `delete --force`
- **🧩 Нове preview екстензије** документоване: `azure.ai.skills` (поновно употребљиве вештине агената) и `azure.ai.connections` (Foundry конекције) додате у табелу екстензија и cheat sheet
- **⏱️ Савети за време одговора** — примери `azd ai agent invoke` сада означавају да исписује укупну латенцију и time-to-first-byte
- **📌 Банер верзије** у коренском README који усмерава ученике на `azd version` и `azd upgrade`

#### Измењено
- **✅ База за валидацију ажурирана** са `azd 1.23.12` (март 2026) на `azd 1.25.6` (јун 2026) у свим README-има поглавља и радним материјалима
- **🤖 Напомена за екстензије у Поглављу 2** ажурирана са `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Пример валидације радионице** (`azd version` output) ажуриран на `1.25.6`
- **🧭 README "What's New in azd Today"** освежен да истакне end-to-end животни циклус агента, нове AI екстензије и недавно побољшања корисничког искуства (`azd init` идемпотентност, `azd auth login` чишћење застарелих токена, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Опција 4)** сада упућује ученике на post-deploy команде животног циклуса уместо да се заустави на `azd up`

#### Поправљено
- **🏷️ Назив производа** — додата напомена о ребренду Aspire (".NET Aspire" је сада једноставно "Aspire"); подршка у azd за Aspire остаје непромењена
- **🔎 Валидација живог издања** потврђена против Azure Developer CLI release feed-а: стабилан CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ажуриране датотеке
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Појашњење за почетничко упознавање, валидацију подешавања и коначни чишћење AZD команди
**Ова верзија прати AZD 1.23 валидациони преглед са пасом за документацију усмереном на почетнике: појашњава смернице аутентикације оријентисане на AZD, додаје локалне скрипте за валидацију подешавања, проверава кључне команде против активног AZD CLI и уклања последње застареле референце на команде из енглеског извора ван changelog-а.**

#### Додато
- **🧪 Скрипте за валидацију почетничког подешавања** са `validate-setup.ps1` и `validate-setup.sh` тако да учесници могу да потврде неопходне алате пре почетка Поглавља 1
- **✅ Уводни кораци валидације подешавања** у коренском README и README Поглавља 1 тако да се недостајући предуслови уоче пре `azd up`

#### Измењено
- **🔐 Смернице за аутентикацију за почетнике** сада доследно третирају `azd auth login` као примарни пут за AZD токове рада, а `az login` се наводи као опционалан осим ако се Azure CLI команде не користе директно
- **📚 Ток упознавања у Поглављу 1** сада усмерава учеснике да верификују своје локално подешавање пре инсталације, аутентикације и првих корака разграничења
- **🛠️ Поруке валидатора** сада јасно раздвајају блокирајуће захтеве од опционалних упозорења Azure CLI за AZD-пут за почетнике
- **📖 Достављање конфигурације, решавање проблема и пример документације** сада разликују између обавезне AZD аутентификације и опционалног пријављивања у Azure CLI где су раније оба била приказана без контекста

#### Поправљено
- **📋 Преостале референце на команде из енглеског извора** ажуриране на актуелне AZD облике, укључујући `azd config show` у cheat sheet-у и `azd monitor --overview` тамо где је намеравано упутство за преглед у Azure порталу
- **🧭 Тверђења за почетнике у Поглављу 1** ублажена да не преопсежу гаранције о нултој грешци или понашању повлачења за све шаблоне и Azure ресурсе
- **🔎 Верификација уживо CLI-ја** потврдила тренутну подршку за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, и `azd down --force --purge`

#### Ажурирани фајлови
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

#### AZD 1.23.12 валидација, проширење окружења радионице и освежавање AI модела
**Ова верзија врши валидациони преглед документације у односу на `azd` `1.23.12`, ажурира застареле примере AZD команди, освежава смернице за AI моделе према тренутним подразумеваним вредностима и проширује упутства за радионицу поред GitHub Codespaces да подржи и dev контејнере и локалне клонове.**

#### Додато
- **✅ Напомене о валидацији кроз основна поглавља и документацију радионице** да би тестирани AZD базлин био јасан за учеснике који користе новије или старије CLI верзије
- **⏱️ Смернице за тајмаут постављања** за дуготрајне деплоје AI апликација користећи `azd deploy --timeout 1800`
- **🔎 Кораци за инспекцију екстензија** са `azd extension show azure.ai.agents` у документима о AI току рада
- **🌐 Проширена упутства за окружење радионице** која покривају GitHub Codespaces, dev контејнере и локалне клонове уз MkDocs

#### Измењено
- **📚 Уводни README-ови поглавља** сада доследно бележе валидацију против `azd 1.23.12` у поглављима фондације, конфигурације, инфраструктуре, мулти-агента, пред-деплоја, решавања проблема и продукције
- **🛠️ Референце AZD команди** ажуриране на тренутне облике кроз документацију:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` у зависности од контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` где је намераван преглед Application Insights
- **🧪 Примери preview провизије** поједностављени на тренутно подржану употребу као што је `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Ток радионице** ажуриран тако да учесници могу да заврше лабораторије у Codespaces, dev контејнеру или локалном клон-репозиторијуму уместо да претпостављају извршавање само у Codespaces
- **🔐 Смернице за аутентикацију** сада преферирају `azd auth login` за AZD токове рада, с тим да је `az login` позициониран као опционалан када се Azure CLI команде користе директно

#### Поправљено
- **🪟 Windows инсталационе команде** нормализоване према тренутном поравнању великог/малог слова за `winget` у водичу за инсталацију
- **🐧 Linux упутства за инсталацију** исправљена да избегну неподржана дистрибутивно-специфична упутства за менаџер пакета `azd` и уместо тога упуте ка release asset-има где је прикладно
- **📦 Примери AI модела** освежени са старијих подразумеваних као `gpt-35-turbo` и `text-embedding-ada-002` на тренутне примере попут `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Снипети за деплој и дијагностику** исправљени да користе тренутне команде за окружење и статус у логовима, скриптама и корацима за решавање проблема
- **⚙️ Упутства за GitHub Actions** ажурирана са `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 MCP/Copilot смернице за сагласност** ажуриране са `azd mcp consent` на `azd copilot consent list`

#### Побољшано
- **🧠 Упутства у AI поглављу** сада боље објашњавају preview-осетљиво понашање `azd ai`, пријављивање специфично за tenant, тренутну употребу екстензија и ажуриране препоруке за деплој модела
- **🧪 Упутства за радионицу** сада користе реалније примере верзија и јаснији језик о подешавању окружења за hands-on лабораторије
- **📈 Документација за продукцију и решавање проблема** сада боље усклађује праксе надгледања, fallback моделе и примере нивоа трошкова

#### Ажурирани фајлови
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
**Ова верзија додаје покривеност команди `azd ai`, `azd extension` и `azd mcp` у свим AI-повезаним поглављима, исправља поломљене везе и застарели код у agents.md, ажурира cheat sheet и ревидира одељак Example Templates са верификованим описима и новим Azure AI AZD шаблонима.**

#### Додато
- **🤖 Покривеност AZD AI CLI** у 7 фајлова (раније само у Поглављу 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нова секција "Extensions and AI Commands" која уводи `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опција 4: `azd ai agent init` са табелом поређења (template vs manifest приступ)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подсекције "AZD Extensions for Foundry" и "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start сада показује и template и manifest засноване путеве деплоја
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Део Deploy сада укључује опцију `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подсекција "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Нова секција "AI & Extensions Commands" са `azd extension`, `azd ai agent init`, `azd mcp`, и `azd infra generate`
- **📦 Нови AZD AI пример шаблони** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG ћаскање са Blazor WebAssembly, Semantic Kernel и подршком за гласовно ћаскање
  - **azure-search-openai-demo-java** — Java RAG ћаскање користећи Langchain4J са опцијама за деплој на ACA/AKS
  - **contoso-creative-writer** — Мулти-агент апликација за креативно писање користећи Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Serverless RAG користећи Azure Functions + LangChain.js + Cosmos DB са Ollama локалном подршком за развој
  - **chat-with-your-data-solution-accelerator** — Ентерпрајз RAG акселератор са админ порталом, Teams интеграцијом и опцијама PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Референцна апликација за мулти-агент MCP оркестрацију са серверима у .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимални Bicep старт шаблон за Azure AI инфраструктуру
  - **🔗 Линк до Awesome AZD AI галерије** — Референца на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблона)

#### Поправљено
- **🔗 Навигација у agents.md**: Previous/Next линкови сада одговарају редоследу лекција у README-у Поглавља 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Поломљене везе у agents.md**: `production-ai-practices.md` исправљен у `../chapter-08-production/production-ai-practices.md` (3 појаве)
- **📦 Застарели код у agents.md**: Замена `opencensus` са `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Неправилан API у agents.md**: Премештено `max_tokens` из `create_agent()` у `create_run()` као `max_completion_tokens`
- **🔢 Бројање токена у agents.md**: Замена грубе процене `len//4` са `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправљени сервиси са "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (подразумевани хост промењен окт 2024)
- **contoso-chat**: Ажурирана дескрипција да упућује на Azure AI Foundry + Prompty, у складу са стварним именом и технолошким скупом репозиторијума

#### Уклоњено
- **ai-document-processing**: Уклоњена референца на нефункционалан шаблон (репозиторијум није јавно доступан као AZD шаблон)

#### Побољшано
- **📝 Вежбе у agents.md**: Вежба 1 сада показује очекивани излаз и корак `azd monitor`; Вежба 2 укључује потпуни регистар `FunctionTool`; Вежба 3 замењује нејасне смернице конкретним командама `prepdocs.py`
- **📚 Ресурси у agents.md**: Ажуриране документацијске везе ка актуелним Azure AI Agent Service докумената и quickstart-у
- **📋 Табела Next Steps у agents.md**: Додат линк на AI Workshop Lab за потпуну покривеност поглавља

#### Ажурирани фајлови
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Побољшање навигације курса
**Ова верзија побољшава навигацију по поглављима у README.md користећи унапређени табеларни формат.**

#### Промењено
- **Course Map Table**: Побољшано са директним везама ка лекцијама, проценама трајања и оцењивањем сложености
- **Folder Cleanup**: Уклоњене су сувишне старе фасцикле (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Све 21+ унутрашње везе у Course Map таблици проверене

### [v3.16.0] - 2026-02-05

#### Ажурирање назива производа
**Ова верзија ажурира референце производа да одражавају тренутни Microsoft брендинг.**

#### Промењено
- **Microsoft Foundry → Microsoft Foundry**: Све референце ажуриране у датотекама које нису за превод
- **Azure AI Agent Service → Foundry Agents**: Име сервиса ажурирано да одражава тренутни брендинг

#### Ажуриране датотеке
- `README.md` - Главна почетна страница курса
- `changelog.md` - Историја верзија
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Водич за AI агенте
- `examples/README.md` - Документација примера
- `workshop/README.md` - Почетна страница радионице
- `workshop/docs/index.md` - Индекс радионице
- `workshop/docs/instructions/*.md` - Све датотеке упутстава за радионицу

---

### [v3.15.0] - 2026-02-05

#### Главна реструктурирања репозиторијума: Имена фасцикли по поглављима
**Ова верзија реструктурише документацију у посебне фасцикле по поглављима ради јасније навигације.**

#### Преименовања фасцикли
Старе фасцикле су замењене фасциклама по броју поглавља:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Миграције датотека
| Датотека | Из | У |
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
- **📚 Chapter README files**: Направљен README.md у свакој фасцикли поглавља са:
  - Циљеви учења и трајање
  - Табела лекција са описима
  - Команде за брзо покретање
  - Навигација ка другим поглављима

#### Промењено
- **🔗 Ажуриране све унутрашње везе**: 78+ пута ажурене путање у свим документационим датотекама
- **🗺️ Main README.md**: Ажурирана Course Map са новом структуром поглавља
- **📝 examples/README.md**: Ажуриране референце на фасцикле поглавља

#### Уклоњено
- Стара структура фасцикли (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктурирање репозиторијума: Навигација по поглављима
**Ова верзија је додала README датотеке за навигацију по поглављима (које је касније замењено верзијом v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Нови водич за AI агенте
**Ова верзија додаје свеобухватан водич за распоређивање AI агената помоћу Azure Developer CLI.**

#### Додато
- **🤖 docs/microsoft-foundry/agents.md**: Комплетан водич који обухвата:
  - Шта су AI агенти и како се разликују од чатботова
  - Три шаблона за брзи почетак агената (Foundry Agents, Prompty, RAG)
  - Архитектонски образци агената (појединачни агент, RAG, мулти-агент)
  - Конфигурација алата и прилагођавање
  - Надгледање и праћење метрика
  - Разматрања трошкова и оптимизација
  - Уобичајени сценарији решавања проблема
  - Три практична вежба са критеријумима успеха

#### Структура садржаја
- **Увод**: Концепти агената за почетнике
- **Брзи почетак**: Распоређивање агената помоћу `azd init --template get-started-with-ai-agents`
- **Обрасци архитектуре**: Визуелни дијаграми образаца агената
- **Конфигурација**: Подешавања алата и променљиве окружења
- **Надгледање**: Интеграција са Application Insights
- **Вежбе**: Прогресивно практично учење (20-45 минута свака)

---

### [v3.12.0] - 2026-02-05

#### Ажурирање DevContainer окружења
**Ова верзија ажурира конфигурацију развојног контејнера са модерним алатима и бољим подразумеваним подешавањима за AZD искуство учења.**

#### Промењено
- **🐳 Основна слика**: Ажурирано са `python:3.12-bullseye` на `python:3.12-bookworm` (најновији Debian стабилан)
- **📛 Име контејнера**: Преименовано са "Python 3" у "AZD for Beginners" ради прегледности

#### Додато
- **🔧 Нове функције DevContainer-а**:
  - `azure-cli` са омогућеном подршком за Bicep
  - `node:20` (LTS верзија за AZD шаблоне)
  - `github-cli` за управљање шаблонима
  - `docker-in-docker` за распоређивање апликација у контејнерима

- **🔌 Прослеђивање портова**: Предконфигурисани портови за уобичајени развој:
  - 8000 (преглед MkDocs)
  - 3000 (веб апликације)
  - 5000 (Python Flask)
  - 8080 (API-ји)

- **🧩 Нова проширења за VS Code**:
  - `ms-python.vscode-pylance` - Побољшани Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Подршка за Azure Functions
  - `ms-azuretools.vscode-docker` - Подршка за Docker
  - `ms-azuretools.vscode-bicep` - Подршка за Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управљање Azure ресурсима
  - `yzhang.markdown-all-in-one` - Уређивање Markdown-а
  - `DavidAnson.vscode-markdownlint` - Провера Markdown-а
  - `bierner.markdown-mermaid` - Подршка за Mermaid дијаграме
  - `redhat.vscode-yaml` - Подршка за YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуализација Git-а
  - `mhutchie.git-graph` - Историја Git-а

- **⚙️ Подешавања VS Code-а**: Додата подразумевана подешавања за Python интерпретер, форматирање при чувању и уклањање непотребних празних простора

- **📦 Ажурирано requirements-dev.txt**:
  - Додат MkDocs minify plugin
  - Додат pre-commit за квалитет кода
  - Додати Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Исправљено
- **Post-Create команда**: Сада верификује инсталацију AZD и Azure CLI при покретању контејнера

---

### [v3.11.0] - 2026-02-05

#### Ревизија README-а прилагођеног почетницима
**Ова верзија значајно побољшава README.md да буде приступачнији за почетнике и додаје битне ресурсе за AI програмере.**

#### Додато
- **🆚 Поређење Azure CLI и AZD**: Јасан опис када користити који алат са практичним примерима
- **🌟 Одлични AZD линкови**: Директне везе ка галерији заједнице шаблона и ресурсима за допринос:
  - [Awesome AZD галерија](https://azure.github.io/awesome-azd/) - 200+ шаблона спремних за распоређивање
  - [Пошаљите шаблон](https://github.com/Azure/awesome-azd/issues) - Допринос заједници
- **🎯 Водич за брзи почетак**: Поједностављен одељак за почетак у 3 корака (Инсталирај → Пријави се → Распореди)
- **📊 Табела навигације по искуству**: Јасно упутство где почети на основу искуства програмера

#### Промењено
- **Структура README-а**: Реиорганизовано за прогресивно откривање - најважније информације прво
- **Одељак Увода**: Преписано да објасни "The Magic of `azd up`" за потпуне почетнике
- **Уклањање дупликата садржаја**: Уклоњен дуплирани одељак за решавање проблема
- **Команде за решавање проблема**: Исправљена референца `azd logs` да користи важећи `azd monitor --logs`

#### Исправљено
- **🔐 Команде за аутентификацију**: Додати `azd auth login` и `azd auth logout` у cheat-sheet.md
- **Неважеће референце команди**: Уклоњен преостали `azd logs` из одељка за решавање проблема у README-у

#### Напомене
- **Обим**: Промене примењене на главни README.md и resources/cheat-sheet.md
- **Циљна публика**: Побољшања посебно намењена програмерима новим у AZD

---

### [v3.10.0] - 2026-02-05

#### Ажурирање тачности команди Azure Developer CLI
**Ова верзија исправља не-постојеће AZD команде кроз целу документацију, обезбеђујући да сви примери кода користе важећу Azure Developer CLI синтаксу.**

#### Исправљено
- **🔧 Уклањање не-постојећих AZD команда**: Свеобухватна ревизија и исправка неважећих команди:
  - `azd logs` (не постоји) → замењен са `azd monitor --logs` или Azure CLI алтернативама
  - `azd service` подкоманде (не постоје) → замењено са `azd show` и Azure CLI
  - `azd infra import/export/validate` (не постоје) → уклоњено или замењено важећим алтернативама
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` флагови (не постоје) → уклоњени
  - `azd provision --what-if/--rollback` флагови (не постоје) → ажурирано да користи `--preview`
  - `azd config validate` (не постоји) → замењено са `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не постоје) → уклоњено

- **📚 Датотеке ажуриране са исправкама команди**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

#### Промењено
- **Стратегије повратка**: Ажурирана документација да користи Git-базиран повратак (AZD нема уграђени rollback)
- **Преглед логова**: Замена референци `azd logs` са `azd monitor --logs`, `azd monitor --live` и Azure CLI командама
- **Одељак о перформансама**: Уклоњени не-постојећи флагови за паралелно/инкрементално распоређивање, обезбеђене важеће алтернативе

#### Технички детаљи
- **Важеће AZD команде**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Важећи azd monitor флагови**: `--live`, `--logs`, `--overview`
- **Уклоњене функције**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Напомене
- **Верификација**: Команде верификоване у односу на Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завршетак радионице и побољшање квалитета документације
**Ова верзија завршава интерактивне модуле радионице, исправља све покварене везе у документацији и побољшава укупни квалитет садржаја за AI програмере који користе Microsoft AZD.**

#### Додато
- **📝 CONTRIBUTING.md**: Нови документ са смерницама за допринос који садржи:
  - Јасна упутства за пријављивање проблема и предложање измена
  - Стандарди документације за нови садржај
  - Упутства за примере кода и конвенције за поруке комита
  - Информације о укључивању заједнице

#### Completed
- **🎯 Модул радионице 7 (Завршни део)**: Потпуно завршен завршни модул са:
  - Свеобухватним резимеом постигнутих циљева радионице
  - Одељком о кључним појмовима који обухвата AZD, шаблоне и Microsoft Foundry
  - Препорукама за наставак пута учења
  - Изазовима радионице са оцењивањем тежине
  - Линковима за повратне информације и подршку заједнице

- **📚 Модул радионице 3 (Разградња)**: Ажурирани циљеви учења са:
  - Упутством за активирање GitHub Copilot са MCP серверима
  - Разумевањем структуре фасцикле AZD шаблона
  - Обрасцима организације Infrastructure-as-code (Bicep)
  - Инструкцијама за практичне лабораторије

- **🔧 Модул радионице 6 (Теардоун)**: Завршен са:
  - Циљевима чишћења ресурса и управљања трошковима
  - Употребом `azd down` за безбедно де-привизионисање инфраструктуре
  - Упутствима за опоравак меко избрисаних когнитивних услуга
  - Бонус упутствима за истраживање GitHub Copilot-а и Azure портала

#### Fixed
- **🔗 Поправке покидбаних линкова**: Решено 15+ покидбаних унутрашњих документационих линкова:
  - `docs/ai-foundry/ai-model-deployment.md`: Поправљене путање ка microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљене путање за ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменљен не-екзистирајући cicd-integration.md са deployment-guide.md
  - `examples/retail-scenario.md`: Исправљене путање за FAQ и водич за решавање проблема
  - `examples/container-app/microservices/README.md`: Исправљене путање ка course home и deployment guide
  - `resources/faq.md` и `resources/glossary.md`: Ажуриране референце у AI поглављу
  - `course-outline.md`: Исправљене референце за instructor guide и AI workshop lab

- **📅 Статус банер радионице**: Ажуриран са "Under Construction" на активан статус радионице са датумом фебруар 2026

- **🔗 Навигација радионице**: Поправљени покидбани навигациони линкови у workshop README.md који су указивали на не-екзистирајућу фасциклу lab-1-azd-basics

#### Changed
- **Презентација радионице**: Уклоњено упозорење "under construction", радионица је сада комплетна и спремна за коришћење
- **Конзистентност навигације**: Осигуран је исправан међу-модуски навигациони ток за све модуле радионице
- **Референце пута учења**: Ажуриране међучланичне референце да користе исправне microsoft-foundry путање

#### Validated
- ✅ Све енглеске Markdown датотеке имају важеће унутрашње линкове
- ✅ Модули радионице 0-7 су комплетни са циљевима учења
- ✅ Навигација између поглавља и модула функционише исправно
- ✅ Садржај је прикладан за AI девелопере који користе Microsoft AZD
- ✅ Језик прилагођен почетницима и структура су задржани кроз цео садржај
- ✅ CONTRIBUTING.md пружа јасна упутства за доприносиоце заједнице

#### Technical Implementation
- **Валидација линкова**: Аутоматизовани PowerShell скрипт проверио све .md унутрашње линкове
- **Аудит садржаја**: Ручни преглед комплетности радионице и погодности за почетнике
- **Навигациони систем**: Примењени конзистентни обрасци навигације између поглавља и модула

#### Notes
- **Опсег**: Промене примењене само у енглеској документацији
- **Преводи**: Фасцикле за превод нису ажуриране у овој верзији (аутоматизован превод ће се синхронизовати касније)
- **Трајање радионице**: Комплетна радионица сада пружа 3-4 сата практичног учења

---

### [v3.8.0] - 2025-11-19

#### Напредна документација: Надгледање, Безбедност и Обрасци мулти-агентске координације
**Ова верзија додаје свеобухватне A-ранг поучне јединице о интеграцији Application Insights, моделима аутентификације и мулти-агентској координацији за продукцијска деплојмента.**

#### Added
- **📊 Порука о интеграцији Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - AZD-фокусирано деплојовање са аутоматским провизионисањем
  - Комплетни Bicep шаблони за Application Insights + Log Analytics
  - Радне Python апликације са прилагођеном телеметријом (1,200+ линија)
  - AI/LLM обрасци надгледања (Microsoft Foundry Models праћење токена/трошкова)
  - 6 Mermaid дијаграма (архитектура, дистрибуирано праћење, ток телеметрије)
  - 3 практична задатка (алути, контролне табле, AI надгледање)
  - Примери Kusto упита и стратегије оптимизације трошкова
  - Стриминг живих метрика и дебаг у реалном времену
  - Време учења 40-50 минута са продукцијским обрасцима

- **🔐 Лекција о аутентификацији и безбедносним обрасцима**: у `docs/getting-started/authsecurity.md`:
  - 3 обрасца аутентификације (connection strings, Key Vault, managed identity)
  - Комплетни Bicep инфраструктурни шаблони за сигурна деплојовања
  - Node.js код апликације са интеграцијом Azure SDK
  - 3 комплетна задатка (омогући managed identity, user-assigned identity, ротирање Key Vault-а)
  - Најбоље праксе безбедности и RBAC конфигурације
  - Водич за решавање проблема и анализа трошкова
  - Производни обрасци аутентификације без лозинке

- **🤖 Лекција о обрасцима координације мулти-агента**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 образаца координације (секвенцијални, паралелни, хијерархијски, покретан догађајима, консензус)
  - Комплетна имплементација оркестратор сервиса (Python/Flask, 1,500+ линија)
  - 3 специјализована агентска имплементација (Research, Writer, Editor)
  - Интеграција Service Bus-а за редизање порука
  - Управљање стањем у Cosmos DB за дистрибуиране системе
  - 6 Mermaid дијаграма који показују интеракције агената
  - 3 напредне вежбе (хандловање таймаута, логика поновног покушаја, circuit breaker)
  - Анализа трошкова ($240-565/month) са стратегијама оптимизације
  - Интеграција Application Insights-а за надгледање

#### Enhanced
- **Пре-деплоyмент поглавље**: Сада укључује свеобухватне обрасце за надгледање и координацију
- **Поглавље Getting Started**: Побољшано професионалним безбедносним моделима
- **Спремност за продукцију**: Потпуна покривеност од безбедности до обсервабилности
- **Оквир курса**: Ажуриран да реферише нове лекције у Поглављима 3 и 6

#### Changed
- **Прогрес учења**: Боља интеграција безбедности и надгледања кроз цео курс
- **Квалитет документације**: Конзистентни A-ранг стандарди (95-97%) широм нових лекција
- **Продукцијски обрасци**: Потпуна end-to-end покривеност за ентерпрајз деплојменте

#### Improved
- **Искуство програмера**: Јасан пут од развоја до продукционог надгледања
- **Стандарди безбедности**: Професионални обрасци за аутентификацију и управљање тајнама
- **Обсервабилност**: Потпуна интеграција Application Insights са AZD
- **AI радне оптерећења**: Специјализовано надгледање за Microsoft Foundry Models и мулти-агентске системе

#### Validated
- ✅ Све лекције укључују комплетан радни код (нису исечци)
- ✅ Mermaid дијаграми за визуелно учење (укупно 19 широм 3 лекције)
- ✅ Практичне вежбе са корацима верификације (укупно 9)
- ✅ Производни Bicep шаблони који се могу деплојовати преко `azd up`
- ✅ Анализа трошкова и стратегије оптимизације
- ✅ Водичи за решавање проблема и најбоље праксе
- ✅ Провере знања са командама за верификацију

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Свеобухватан водич за надгледање
- **docs/getting-started/authsecurity.md**: - Професионални безбедносни обрасци
- **docs/pre-deployment/coordination-patterns.md**: - Напредне мулти-агентске архитектуре
- **Overall New Content**: - Конзистентни високи стандарди квалитета

#### Technical Implementation
- **Application Insights**: Log Analytics + прилагођена телеметрија + дистрибуирано праћење
- **Аутентификација**: Managed Identity + Key Vault + RBAC обрасци
- **Мулти-агент**: Service Bus + Cosmos DB + Container Apps + оркестрација
- **Надгледање**: Живе метрике + Kusto упити + аларми + контролне табле
- **Управљање трошковима**: Стратегије узорковања, политике задржавања, контроле буџета

### [v3.7.0] - 2025-11-19

#### Унапређење квалитета документације и нови пример Microsoft Foundry Models
**Ова верзија побољшава квалитет документације кроз репозиторјум и додаје комплетан пример деплоја Microsoft Foundry Models са gpt-4.1 chat интерфејсом.**

#### Added
- **🤖 Пример Microsoft Foundry Models Chat-а**: Комплетан gpt-4.1 деплој са радном имплементацијом у `examples/azure-openai-chat/`:
  - Комплетна инфраструктура Microsoft Foundry Models (gpt-4.1 model deployment)
  - Python command-line chat интерфејс са историјом разговора
  - Интеграција Key Vault-а за сигурно чување API кључева
  - Праћење коришћења токена и процена трошкова
  - Ограничење брзине и руковање грешкама
  - Свеобухватан README са водичем за деплој од 35-45 минута
  - 11 production-ready фајлова (Bicep шаблони, Python апликација, конфигурација)
- **📚 Вежбе у документацији**: Додате практичне вежбе у водич за конфигурацију:
  - Вежба 1: Конфигурација за више окружења (15 минута)
  - Вежба 2: Практична вежба управљања тајнама (10 минута)
  - Јасни критеријуми успеха и кораци верификације
- **✅ Верификација деплоја**: Додат одељак за верификацију у водич за деплој:
  - Процедуре health check-а
  - Чек-листа критеријума успеха
  - Очекивани излази за све команде деплоја
  - Брзи референс за решавање проблема

#### Enhanced
- **examples/README.md**: Ажуриран на A-ранг квалитет (93%):
  - Додат azure-openai-chat у све релевантне секције
  - Ажуриран број локалних примера са 3 на 4
  - Додат у табелу AI Application Examples
  - Интегрисан у Quick Start за средње кориснике
  - Додат у Microsoft Foundry Templates секцију
  - Ажуриран Comparison Matrix и секције о технологијама
- **Квалитет документације**: Побољшан са B+ (87%) → A- (92%) кроз docs фолдер:
  - Додати очекивани излази за критичне команде
  - Укључени кораци верификације за промене конфигурације
  - Побољшано практично учење са реалним вежбама

#### Changed
- **Прогрес учења**: Боља интеграција AI примера за средње ниво учесника
- **Структура документације**: Више акционог садржаја са јасним исходима
- **Процес верификације**: Јасно дефинисани критеријуми успеха додати кључним токовима рада

#### Improved
- **Искуство програмера**: Деплој Microsoft Foundry Models сада траје 35-45 минута (упркос 60-90 за комплексније алтернативе)
- **Транспарентност трошкова**: Јасне процене трошкова ($50-200/month) за пример Microsoft Foundry Models
- **Пут учења**: AI девелопери имају јасан улазни поинт са azure-openai-chat
- **Стандарди документације**: Конзистентни очекивани излази и кораци верификације

#### Validated
- ✅ Microsoft Foundry Models пример потпуно функционалан са `azd up`
- ✅ Сва 11 имплементационих фајлова синтаксички тачна
- ✅ Упутства у README-у одговарају стварном искуству деплоја
- ✅ Документациони линкови ажурирани на преко 8 локација
- ✅ Индекс примера тачно одражава 4 локална примера
- ✅ Нема дуплираних екстерних линкова у табелама
- ✅ Све навигационе референце тачне

#### Technical Implementation
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps образац
- **Безбедност**: Спремно за Managed Identity, тајне у Key Vault
- **Надгледање**: Интеграција Application Insights
- **Управљање трошковима**: Праћење токена и оптимизација коришћења
- **Деплој**: Једна команда `azd up` за комплетну поставку

### [v3.6.0] - 2025-11-19

#### Велика надоградња: Примери деплоирања Container App-ова
**Ова верзија уводи свеобухватне, продукцијски спремне примере деплоирања контејнер апликација користећи Azure Developer CLI (AZD), са комплетном документацијом и интеграцијом у пут учења.**

#### Added
- **🚀 Примери Container App-ова**: Нови локални примери у `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Комплетан преглед контејнеризованих деплоја, брзи старт, продукција и напредни обрасци
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Пријазан REST API за почетнике са scale-to-zero, health probe-овима, надгледањем и решавањем проблема
  - [Microservices Architecture](../../examples/container-app/microservices): Продукцијски спреман мулти-сервис деплој (API Gateway, Product, Order, User, Notification), асинхроно обрађивање порука, Service Bus, Cosmos DB, Azure SQL, дистрибуирано праћење, blue-green/canary деплој
- **Најбоље праксе**: Безбедност, надгледање, оптимизација трошкова и CI/CD смернице за контејнеризоване радне оптерећења
- **Примери кода**: Комплетни `azure.yaml`, Bicep шаблони и имплементације сервиса у више језика (Python, Node.js, C#, Go)
- **Тестирање и решавање проблема**: Сценарији е2е тестирања, команде за надгледање, упутства за решавање проблема

#### Changed
- **README.md**: Ажуриран да истакне и линкује нове примере Container App-ова у одељку "Local Examples - Container Applications"
- **examples/README.md**: Ажуриран да нагласи примере Container App-ова, дода упоредну матрицу и ажурира референце технологија/архитектуре
- **Оквир курса & водич за учење**: Ажурирани да реферишу нове примере Container App-а и обрасце деплоирања у релевантним поглављима

#### Validated
- ✅ Сви нови примери deploy-ују се са `azd up` и прате најбоље праксе
- ✅ Унутрашњи линкови документације и навигација ажурирани
- ✅ Примери покривају сценарије од почетника до напредних, укључујући продукцијске микросервисе

#### Notes
- **Опсег**: Енглеска документација и примери само
- **Следећи кораци**: Проширити додатним напредним контејнер обрасцима и CI/CD аутоматизацијом у будућим издањима

### [v3.5.0] - 2025-11-19

#### Пребрендирање производа: Microsoft Foundry
**Ова верзија имплементира свеобухватну промену имена производа са "Microsoft Foundry" на "Microsoft Foundry" кроз сву енглеску документацију, у складу са званичним ребрендирањем Microsoft-а.**

#### Changed
- **🔄 Ажурирање имена производа**: Потпуна промена имена са "Microsoft Foundry" на "Microsoft Foundry"
  - Ажуриране све референце кроз енглеску документацију у `docs/` фасцикли
  - Преименована фасцикла: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименована датотека: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Укупно: 23 референце у садржају ажуриране у 7 документационих датотека

- **📁 Промене у структури фолдера**:
  - `docs/ai-foundry/` преименован у `docs/microsoft-foundry/`
  - Све крстосне референце ажуриране да одражавају нову структуру фолдера
  - Везе у навигацији проверене у целокупној документацији

- **📄 Преименовање датотека**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Све интерне везе ажуриране да упућују на ново име датотеке

#### Ажуриране датотеке
- **Документација поглаваља** (7 датотека):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ажурирања навигационих веза
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 референце имена производа ажуриране
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Већ користи Microsoft Foundry (из претходних ажурирања)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 референце ажуриране (преглед, повратне информације за заједницу, документација)
  - `docs/getting-started/azd-basics.md` - 4 ажурирања крстосних веза
  - `docs/getting-started/first-project.md` - 2 везе за навигацију поглавља ажуриране
  - `docs/getting-started/installation.md` - 2 везе "следећег поглавља" ажуриране
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 референце ажуриране (навигација, Discord заједница)
  - `docs/troubleshooting/common-issues.md` - 1 ажурирање навигационе везе
  - `docs/troubleshooting/debugging.md` - 1 ажурирање навигационе везе

- **Фајлови структуре курса** (2 датотеке):
  - `README.md` - 17 референци ажурирано (преглед курса, наслови поглавља, одељак шаблона, увиди заједнице)
  - `course-outline.md` - 14 референци ажурирано (преглед, циљеви учења, ресурси по поглављима)

#### Потврђено
- ✅ Нема преосталих референци путање фолдера "ai-foundry" у енглеској документацији
- ✅ Нема преосталих референци назива производа "Microsoft Foundry" у енглеским документацијама
- ✅ Све навигационе везе функционалне са новом структуром фолдера
- ✅ Преименовања датотека и фолдера успешно завршена
- ✅ Крстосне референце између поглавља потврђене

#### Напомене
- **Обим**: Промене примењене само на енглеску документацију у фолдеру `docs/`
- **Преводи**: Фолдери превода (`translations/`) нису ажурирани у овој верзији
- **Радионица**: Материјали радионице (`workshop/`) нису ажурирани у овој верзији
- **Примери**: Пример датотека можда још увек референцирају наследна имена (биће решено у будућем ажурирању)
- **Спољашње везе**: Спољашњи URL-ови и GitHub референце репозиторијума остају непромењени

#### Водич за миграцију за сараднике
Ако имате локалне гране или документацију која упућује на стару структуру:
1. Ажурирајте референце фолдера: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ажурирајте референце датотека: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замени име производа: "Microsoft Foundry" → "Microsoft Foundry"
4. Верификујте да све интерне документационе везе и даље функционишу

---

### [v3.4.0] - 2025-10-24

#### Побољшања у прегледу и валидацији инфраструктуре
**Ова верзија уводи свеобухватну подршку за нову preview функцију Azure Developer CLI и побољшава корисничко искуство радионице.**

#### Додато
- **🧪 azd provision --preview Feature Documentation**: Комплетно покривање нове preview могућности инфраструктуре
  - Референца команди и примери употребе у cheat sheet-у
  - Детаљна интеграција у водич за провизионисање са примерима употребе и предностима
  - Интеграција пре-покретне провере за сигурнију валидацију распоређивања
  - Ажурирања водича за почетак рада са праксама распоређивања које стављају безбедност на прво место
- **🚧 Workshop Status Banner**: Професионални HTML банер који указује на статус развоја радионице
  - Градијентни дизајн са индикаторима у изградњи за јасну комуникацију са корисницима
  - Ознака последњег ажурирања ради транспарентности
  - Дизајн прилагодљив мобилним уређајима за све типове уређаја

#### Побољшано
- **Безбедност инфраструктуре**: Preview функционалност интегрисана кроз целу документацију распоређивања
- **Валидација пре распоређивања**: Аутоматизовани скрипти сада укључују тестирање preview-а инфраструктуре
- **Радни ток програмера**: Ажурирани низови команди да укључују preview као најбољу праксу
- **Искуство радионице**: Корисницима су постављена јасна очекивања о статусу развоја садржаја

#### Измењено
- **Најбоље праксе распоређивања**: Радни ток са preview у првом плану сада препоручени приступ
- **Ток документације**: Валидација инфраструктуре померена раније у процесу учења
- **Презентација радионице**: Професионална комуникација статуса са јасним временским оквиром развоја

#### Побољшано
- **Приступ који ставља безбедност на прво место**: Промене инфраструктуре сада се могу верификовати пре распоређивања
- **Тимска сарадња**: Резултате preview-а могуће је делити за преглед и одобрење
- **Свест о трошковима**: Боље разумевање трошкова ресурса пре провизионисања
- **Смањење ризика**: Смањење неуспеха распоређивања кроз унапредну валидацију

#### Техничка имплементација
- **Интеграција више докумената**: Preview функција документована у 4 кључна фајла
- **Обрасци команди**: Конзистентна синтакса и примери кроз целу документацију
- **Интеграција најбољих пракси**: Preview укључен у токове валидације и скрипте
- **Визуелни индикатори**: Јасне ознаке НОВЕ функционалности за лакше откривање

#### Инфраструктура радионице
- **Комуникација статуса**: Професионални HTML банер са градијентним стилом
- **Корисничко искуство**: Јасан статус развоја спречава забуну
- **Професионална презентација**: Очува кредибилитет репозиторијума истовремено постављајући очекивања
- **Транспарентност временског оквира**: Ознака последњег ажурирања октобар 2025 за одговорност

### [v3.3.0] - 2025-09-24

#### Побољшани материјали радионице и интерактивно искуство учења
**Ова верзија уводи свеобухватне материјале радионице са интерактивним водичима заснованим на прегледачу и структурираним путањама учења.**

#### Додато
- **🎥 Interactive Workshop Guide**: Искуство радионице засновано на прегледачу са MkDocs preview могућношћу
- **📝 Structured Workshop Instructions**: 7-степени вођени пут учења од откривања до прилагођавања
  - 0-Introduction: Преглед радионице и подешавање
  - 1-Select-AI-Template: Процес откривања и избора шаблона
  - 2-Validate-AI-Template: Процедуре распоређивања и валидације
  - 3-Deconstruct-AI-Template: Разумевање архитектуре шаблона
  - 4-Configure-AI-Template: Конфигурација и прилагођавање
  - 5-Customize-AI-Template: Напредне измене и итерације
  - 6-Teardown-Infrastructure: Чишћење и управљање ресурсима
  - 7-Wrap-up: Сажетак и следећи кораци
- **🛠️ Workshop Tooling**: MkDocs конфигурација са Material темом за побољшано искуство учења
- **🎯 Hands-On Learning Path**: 3-степена методологија (Откривање → Распоређивање → Прилагођавање)
- **📱 GitHub Codespaces Integration**: Беспрекорно подешавање окружења за развој

#### Побољшано
- **AI Workshop Lab**: Проширен са свеобухватним структурираним искуством учења од 2-3 сата
- **Документација радионице**: Професионална презентација са навигацијом и визуелним средствима
- **Напредовање учења**: Јасна упутства корак-по-корак од избора шаблона до продукцијског распоређивања
- **Искуство програмера**: Интегрисане алатке за поједностављене токове рада у развоју

#### Побољшано
- **Приступачност**: Интерфејс заснован на прегледачу са претрагом, функцијом копирања и пребацивањем теме
- **Самостално темпо учења**: Флексибилна структура радионице која прилагођава различите брзине учења
- **Практична примена**: Сценарији распоређивања AI шаблона у стварном свету
- **Интеграција заједнице**: Интеграција Discord-а за подршку радионици и сарадњу

#### Карактеристике радионице
- **Уграђена претрага**: Брзо откривање кључних речи и лекција
- **Копирање блока кода**: Функција hover-to-copy за све примере кода
- **Промена теме**: Подршка за мрачни/светли режим према различитим преференцама
- **Визуелни ресурси**: Снимци екрана и дијаграми за боље разумевање
- **Интеграција помоћи**: Директан приступ Discord-у за подршку заједници

### [v3.2.0] - 2025-09-17

#### Главна реструктурирања навигације и систем учења заснован на поглављима
**Ова верзија уводи свеобухватну структуру учења засновану на поглављима са побољшаном навигацијом кроз цео репозиторијум.**

#### Додато
- **📚 Систем учења заснован на поглављима**: Целокупан курс реструктуриран у 8 прогресивних поглавља учења
  - Chapter 1: Основе и брзи почетак (⭐ - 30-45 мин)
  - Chapter 2: Развој са фокусом на AI (⭐⭐ - 1-2 сата)
  - Chapter 3: Конфигурација и аутентификација (⭐⭐ - 45-60 мин)
  - Chapter 4: Инфраструктура као код и распоређивање (⭐⭐⭐ - 1-1.5 сата)
  - Chapter 5: Решења са више агената за AI (⭐⭐⭐⭐ - 2-3 сата)
  - Chapter 6: Валидација и планирање пре распоређивања (⭐⭐ - 1 сат)
  - Chapter 7: Решавање проблема и отклањање грешака (⭐⭐ - 1-1.5 сата)
  - Chapter 8: Производни и предузетнички шаблони (⭐⭐⭐⭐ - 2-3 сата)
- **📚 Свеобухватан навигациони систем**: Конзистентни наслови и подножја за навигацију кроз целу документацију
- **🎯 Праћење напретка**: Контролна листа за завршетак курса и систем верификације учења
- **🗺️ Водич кроз пут учења**: Јасне тачке уласка за различите нивое искуства и циљеве
- **🔗 Навигација кроз крстосне референце**: Повезана поглавља и предуслови јасно повезани

#### Побољшано
- **Структура README**: Претворена у структурирану платформу за учење са организацијом по поглављима
- **Навигација документације**: Свака страница сад садржи контекст поглавља и водич за напредовање
- **Организација шаблона**: Примери и шаблони мапирани на одговарајућа поглавља учења
- **Интеграција ресурса**: cheat sheets, често постављана питања и студијски водичи повезани са релевантним поглављима
- **Интеграција радионице**: Практичне лабораторије мапиране на више циљева учења поглавља

#### Измењено
- **Напредовање у учењу**: Померање са линеарне документације на флексибилно учење по поглављима
- **Положај конфигурације**: Водич за конфигурацију премештен у Поглавље 3 ради бољег тока учења
- **Интеграција AI садржаја**: Боља интеграција AI-специфичног садржаја кроз цело путовање учења
- **Производни садржај**: Напредни обрасци консолидовани у Поглављу 8 за предузећне полазнике

#### Побољшано
- **Корисничко искуство**: Јасне "breadcrumbs" навигације и индикатори напредовања по поглављима
- **Приступачност**: Конзистентни обрасци навигације за лакше преласке кроз курс
- **Професионална презентација**: Структура курса у стилу универзитета погодна за академску и корпоративну обуку
- **Ефикасност учења**: Скраћено време за проналажење релевантног садржаја кроз побољшану организацију

#### Техничка имплементација
- **Заглавља навигације**: Стандаризована навигација поглавља кроз 40+ документационих фајлова
- **Навигација у подножју**: Конзистентно вођење напретка и индикатори завршетка поглавља
- **Крстосно повезивање**: Свеобухватан систем интерних веза који повезује релевантне концепте
- **Мапирање поглавља**: Шаблони и примери јасно повезани са циљевима учења

#### Побољшање студијског водича
- **📚 Свеобухватни циљеви учења**: Реструктурисани студијски водич у складу са системом од 8 поглавља
- **🎯 Оцењивање по поглављима**: Са сваког поглавља укључује специфичне циљеве учења и практичне вежбе
- **📋 Праћење напретка**: Недељни распоред учења са мерљивим резултатима и контролним листама за завршетак
- **❓ Питања за оцењивање**: Питања за валидацију знања за свако поглавље са професионалним исходима
- **🛠️ Практичне вежбе**: Практичне активности са стварним сценаријима распоређивања и решавања проблема
- **📊 Напредовање вештина**: Јасан напредак од основних концепата до предузетничких образаца са фокусом на развој каријере
- **🎓 Оквир за сертификацију**: Испити професионалног развоја и систем признања у заједници
- **⏱️ Управљање временским оквиром**: Структурирани 10-недељни план учења са валидацијом прекретница

### [v3.1.0] - 2025-09-17

#### Побољшана решења мулти-агентног AI
**Ова верзија побољшава мулти-агентско решење за малопродају бољим именовањем агената и побољшаном документацијом.**

#### Измењено
- **Терминологија мулти-агента**: Замењено "Cora agent" са "Customer agent" кроз цело мулти-агентско решење за малопродају ради јаснијег разумевања
- **Архитектура агента**: Ажурирана целокупна документација, ARM шаблони и примери кода да користе конзистентно именовање "Customer agent"
- **Примери конфигурације**: Модернизовани обрасци конфигурације агената са ажурираним конвенцијама именовања
- **Конзистентност документације**: Осигуранo да све референце користе професионална, описна имена агената

#### Побољшано
- **ARM пакет шаблона**: Ажурирани retail-multiagent-arm-template са референцама "Customer agent"
- **Дијаграми архитектуре**: Освежени Mermaid дијаграми са ажурираним именовањем агената
- **Примери кода**: Python класе и примери имплементације сада користе именовање CustomerAgent
- **Променљиве окружења**: Ажурирани сви скрипти за распоређивање да користе конвенције CUSTOMER_AGENT_NAME

#### Побољшано
- **Искуство програмера**: Јасније улоге и одговорности агената у документацији
- **Спремност за продукцију**: Боље прилагођавање конвенцијама именовања предузећа
- **Материјали за учење**: Интуитивније именовање агената у сврху едукације
- **Употребљивост шаблона**: Поједностављено разумевање функција агената и образаца распоређивања

#### Технички детаљи
- Ажурирани Mermaid дијаграми архитектуре са референцама CustomerAgent
- Замењена имена класе CoraAgent са CustomerAgent у Python примерима
- Модификовани ARM JSON конфигурације шаблона да користе тип агента "customer"
- Ажуриране променљиве окружења са CORA_AGENT_* на CUSTOMER_AGENT_* обрасце
- Освежене све команде за распоређивање и конфигурације контејнера

### [v3.0.0] - 2025-09-12

#### Важне промене - Фокус на AI програмере и интеграција Microsoft Foundry
**Ова верзија трансформише репозиторијум у свеобухватан ресурс за учење усмерен на AI са интеграцијом Microsoft Foundry.**

#### Додато
- **🤖 Пут учења усмерен на AI**: Потпуна реструктуризација која ставља приоритет на AI програмере и инжењере
- **Водич за интеграцију Microsoft Foundry**: Свеобухватна документација за повезивање AZD са сервисима Microsoft Foundry
- **Обрасци распоређивања AI модела**: Детаљан водич који покрива избор модела, конфигурацију и стратегије продукцијског распоређивања
- **AI Workshop Lab**: Практична радионица од 2–3 сата за претварање AI апликација у решења која се могу депловати помоћу AZD
- **Production AI Best Practices**: Шаблони спремни за предузећа за скалирање, надгледање и обезбеђивање AI радних оптерећења
- **AI-Specific Troubleshooting Guide**: Свеобухватно решавање проблема за Microsoft Foundry моделе, Cognitive Services и проблеме са деплојем AI
- **AI Template Gallery**: Изабрана колекција Microsoft Foundry шаблона са оценама сложености
- **Workshop Materials**: Потпуна структура радионице са практичним лабовима и референтним материјалом

#### Побољшано
- **README Structure**: Фокусирано на AI програмере уз 45% података о интересовању заједнице са Microsoft Foundry Discord-а
- **Learning Paths**: Посвећени путеви учења за AI програмере поред традиционалних путева за студенте и DevOps инжењере
- **Template Recommendations**: Истакнути AI шаблони укључују azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Community Integration**: Побољшана Discord подршка за заједницу са AI-специфичним каналима и дискусијама

#### Безбедност & Фокус на производњу
- **Managed Identity Patterns**: AI-специфичне конфигурације аутентификације и безбедности
- **Cost Optimization**: Праћење употребе токена и контроле буџета за AI радна оптерећења
- **Multi-Region Deployment**: Стратегије за глобално деплојовање AI апликација
- **Performance Monitoring**: AI-специфични метрици и интеграција са Application Insights

#### Квалитет документације
- **Linear Course Structure**: Логички напредак од почетника до напредних AI образаца деплоја
- **Validated URLs**: Сви спољни линкови репозиторијума проверени и доступни
- **Complete Reference**: Сви интерни линкови документације проверени и функционални
- **Production Ready**: Шаблони за деплој спремни за предузећа са примерима из стварног света

### [v2.0.0] - 2025-09-09

#### Главне промене - реструктурирање репозиторијума и професионално унапређење
**Ова верзија представља значајну ревизију структуре репозиторијума и презентације садржаја.**

#### Додато
- **Structured Learning Framework**: Све странице документације сада укључују секције Увод, Циљеви учења и Резултати учења
- **Navigation System**: Додати линкови Претходна/Следећа лекција кроз целу документацију за вођено напредовање у учењу
- **Study Guide**: Свеобухватан study-guide.md са циљевима учења, вежбама и материјалима за процену
- **Professional Presentation**: Уклоњене све емотиконе ради побољшане приступачности и професионалнијег изгледа
- **Enhanced Content Structure**: Побољшана организација и ток материјала за учење

#### Измењено
- **Documentation Format**: Стандаризована цела документација са доследном структуром усмереном на учење
- **Navigation Flow**: Имплементиран логички напредак кроз сав материјал за учење
- **Content Presentation**: Уклоњени декоративни елементи у корист јасног, професионалног форматирања
- **Link Structure**: Аžурирани сви интерни линкови да подрже нови навигациони систем

#### Побољшано
- **Accessibility**: Уклоњене зависности од емотикона ради боље компатибилности са читачима екрана
- **Professional Appearance**: Чиста, академска презентација погодна за корпоративно учење
- **Learning Experience**: Структурирани приступ са јасним циљевима и резултатима за сваку лекцију
- **Content Organization**: Бољи логички ток и веза између повезаних тема

### [v1.0.0] - 2025-09-09

#### Прво издање - Свеобухватни AZD репозиторијум за учење

#### Додато
- **Core Documentation Structure**
  - Потпуна серија водича за почетак
  - Свеобухватна документација за деплој и провизионисање
  - Детаљни ресурси за решавање проблема и водичи за дебаговање
  - Алатке и процедуре за валидацију пре деплоја

- **Getting Started Module**
  - AZD основе: Основни концепти и терминологија
  - Водич за инсталацију: Упутства за подешавање специфична за платформу
  - Водич за конфигурацију: Подешавање окружења и аутентификација
  - Први туторијал пројекта: Корак по корак практично учење

- **Deployment and Provisioning Module**
  - Водич за деплој: Потпуна документација радног тока
  - Водич за провизионисање: Инфраструктура као код са Bicep
  - Најбоље праксе за продукционе деплоје
  - Обрасци архитектуре са више сервиса

- **Pre-deployment Validation Module**
  - Планирање капацитета: Валидација доступности Azure ресурса
  - Избор SKU: Свеобухватна упутства за нивое услуга
  - Провере пре покретања: Аутоматизовани скрипти за валидацију (PowerShell и Bash)
  - Алатке за процену трошкова и планирање буџета

- **Troubleshooting Module**
  - Уобичајени проблеми: Често сусретани проблеми и решења
  - Водич за дебаговање: Систематске методологије за решавање проблема
  - Напредне дијагностичке технике и алати
  - Надгледање перформанси и оптимизација

- **Resources and References**
  - Листа кратких команди: Брзи референс за основне команде
  - Глосар: Свеобухватне дефиниције терминологије и акронима
  - ЧПП (FAQ): Детаљни одговори на честе питања
  - Линкови ка спољним ресурсима и везе са заједницом

- **Examples and Templates**
  - Пример једноставне веб апликације
  - Шаблон за деплој статичног вебсајта
  - Конфигурација за апликацију у контејнеру
  - Обрасци интеграције базе података
  - Примери микросервисне архитектуре
  - Имплементације serverless функција

#### Карактеристике
- **Multi-Platform Support**: Водичи за инсталацију и конфигурацију за Windows, macOS и Linux
- **Multiple Skill Levels**: Садржај намењен од студената до професионалних програмера
- **Practical Focus**: Практични примери и сценарији из стварног света
- **Comprehensive Coverage**: Од основних концепата до напредних корпоративних образаца
- **Security-First Approach**: Најбоље праксе безбедности интегрисане кроз целу документацију
- **Cost Optimization**: Упутства за економичне деплое и управљање ресурсима

#### Квалитет документације
- **Detailed Code Examples**: Практични, тестирани примери кода
- **Step-by-Step Instructions**: Јасна, применљива упутства
- **Comprehensive Error Handling**: Решавање уобичајених проблема
- **Best Practices Integration**: Индустријски стандарди и препоруке
- **Version Compatibility**: Ажурирано са најновијим Azure сервисима и azd функцијама

## Планирана будућа унапређења

### Version 3.1.0 (Planned)
#### Проширење AI платформе
- **Multi-Model Support**: Обрасци интеграције за Hugging Face, Azure Machine Learning и прилагођене моделе
- **AI Agent Frameworks**: Шаблони за LangChain, Semantic Kernel и AutoGen деплоје
- **Advanced RAG Patterns**: Опције векторских база података ван Azure AI Search (Pinecone, Weaviate, итд.)
- **AI Observability**: Побољшано надгледање перформанси модела, употребе токена и квалитета одговора

#### Искуство програмера
- **VS Code Extension**: Интегрисано развојно искуство AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Генерација AZD шаблона уз помоћ AI
- **Interactive Tutorials**: Практичне вежбе кодирања са аутоматизованом валидацијом за AI сценарије
- **Video Content**: Допунски видео туторијали за визуелне ученике усмерени на AI деплоје

### Version 4.0.0 (Planned)
#### Корпоративни AI обрасци
- **Governance Framework**: Управљање AI моделима, усклађеност и аудиторски записи
- **Multi-Tenant AI**: Обрасци за сервисирање више купаца са изолованим AI сервисима
- **Edge AI Deployment**: Интеграција са Azure IoT Edge и контейнер инстанцама
- **Hybrid Cloud AI**: Обрасци за мулти-клауд и хибридни деплој AI радних оптерећења

#### Напредне функције
- **AI Pipeline Automation**: MLOps интеграција са Azure Machine Learning pipelines
- **Advanced Security**: Zero-trust обрасци, приватни ендпоинти и напредна заштита од претњи
- **Performance Optimization**: Напредно подешавање и стратегије скалирања за AI апликације високог пропусног опсега
- **Global Distribution**: Обрасци достављања садржаја и кеширања на ивици за AI апликације

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Предложени додаци - Сада имплементирани у v3.0.0
- ✅ **AI-Focused Content**: Свеобухватна интеграција Microsoft Foundry (Завршено)
- ✅ **Interactive Tutorials**: Практична AI радионица (Завршено)
- ✅ **Advanced Security Module**: AI-специфични безбедносни обрасци (Завршено)
- ✅ **Performance Optimization**: Стратегије подешавања AI радних оптерећења (Завршено)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Мала унапређења - Нека су завршена у тренутном издању
- ✅ **Additional Examples**: AI-усмерени сценарији деплоја (Завршено)
- ✅ **Extended FAQ**: AI-специфична питања и решавање проблема (Завршено)
- **Tool Integration**: Побољшани водичи за интеграцију IDE и уређивача
- ✅ **Monitoring Expansion**: AI-специфични обрасци праћења и алармирања (Завршено)

#### Још у плану за будуће издање
- **Mobile-Friendly Documentation**: Респонзивни дизајн за мобилно учење
- **Offline Access**: Пакети документације за преузимање
- **Enhanced IDE Integration**: VS Code екстензија за AZD + AI радне токове
- **Community Dashboard**: Метрике заједнице у реалном времену и праћење доприноса

## Како допринети запису промена

### Пријављивање промена
Када доприносите овом репозиторијуму, молимо осигурајте да уноси у changelog укључују:

1. **Version Number**: Пратећи семантичко верзионисање (major.minor.patch)
2. **Date**: Датум издања или ажурирања у формату YYYY-MM-DD
3. **Category**: Додато, Измењено, Застарело, Уклоњено, Исправљено, Безбедност
4. **Clear Description**: Концизан опис шта се променило
5. **Impact Assessment**: Како промене утичу на постојеће кориснике

### Категорије промена

#### Додато
- Нове функције, одељци документације или могућности
- Нови примери, шаблони или ресурси за учење
- Додатни алати, скрипте или услужни програми

#### Измењено
- Измене постојеће функционалности или документације
- Ажурирања ради побољшања јасноће или тачности
- Реструктурирање садржаја или организације

#### Застарело
- Функције или приступи који се постепено укидају
- Одељци документације који су планирани за уклањање
- Методе које имају боље алтернативе

#### Уклоњено
- Функције, документација или примери који више нису релевантни
- Застареле информације или застарели приступи
- Редундантан или консолидован садржај

#### Исправљено
- Корекције грешака у документацији или коду
- Решавање пријављених проблема или недостатака
- Побољшања тачности или функционалности

#### Безбедност
- Побољшања или исправке везане за безбедност
- Ажурирања најбољих пракси безбедности
- Решавање безбедносних рањивости

### Смернице за семантичко верзионисање

#### Главна верзија (X.0.0)
- Прекидајуће промене које захтевају акцију корисника
- Значајно реструктурирање садржаја или организације
- Промене које мењају основни приступ или методологију

#### Мала верзија (X.Y.0)
- Нове функције или додаци садржаја
- Унапређења која одржавају уназадну компатибилност
- Додатни примери, алати или ресурси

#### Патч верзија (X.Y.Z)
- Поправке грешака и корекције
- Мала унапређења постојећег садржаја
- Разјашњења и мала побољшања

## Повратне информације заједнице и предлози

Активно подстичемо повратне информације заједнице ради побољшања овог ресурса за учење:

### Како пружити повратну информацију
- **GitHub Issues**: Пријавите проблеме или предложите побољшања (AI-специфични проблеми добродошли)
- **Discord Discussions**: Делите идеје и ангажујте се са Microsoft Foundry заједницом
- **Pull Requests**: Допринесите директним побољшањима садржаја, посебно AI шаблона и водича
- **Microsoft Foundry Discord**: Учествујте у #Azure каналу за AZD + AI дискусије
- **Community Forums**: Укључите се у шире Azure дискусије за програмере

### Категорије повратних информација
- **AI Content Accuracy**: Корекције информација о интеграцији AI сервиса и деплоју
- **Learning Experience**: Предлози за побољшање тока учења AI програмера
- **Missing AI Content**: Захтеви за додатним AI шаблонима, образцима или примерима
- **Accessibility**: Побољшања за различите потребе учења
- **AI Tool Integration**: Предлози за бољу интеграцију AI радних токова
- **Production AI Patterns**: Захтеви за корпоративне шаблоне деплоја AI

### Посвећеност одговору
- **Issue Response**: У року од 48 сати за пријављене проблеме
- **Feature Requests**: Евалуација у року од недељу дана
- **Community Contributions**: Преглед у року од недељу дана
- **Security Issues**: Одмах приоритет уз убрзани одговор

## Распоред одржавања

### Редовна ажурирања
- **Monthly Reviews**: Тачност садржаја и валидација линкова
- **Quarterly Updates**: Важни додаци садржаја и побољшања
- **Semi-Annual Reviews**: Свеобухватно реструктурирање и унапређења
- **Annual Releases**: Велика ажурирања верзија са значајним побољшањима

### Мониторинг и осигурање квалитета
- **Automated Testing**: Редовна валидација примера кода и линкова
- **Community Feedback Integration**: Редовно укључивање сугестија корисника
- **Technology Updates**: Усклађивање са најновијим Azure сервисима и azd издањима
- **Accessibility Audits**: Редован преглед по принципима инклузивног дизајна

## Политика подршке верзија

### Тренутна подршка верзије
- **Latest Major Version**: Потпуна подршка са редовним ажурирањима
- **Previous Major Version**: Безбедносна ажурирања и критичне исправке у року од 12 месеци
- **Legacy Versions**: Само подршка заједнице, без званичних ажурирања

### Упутства за миграцију
Када се објаве главне верзије, обезбеђујемо:
- **Migration Guides**: Упутства за прелазак корак по корак
- **Compatibility Notes**: Детаљи о прекидајућим променама
- **Tool Support**: Скрипте или алати који помажу у миграцији
- **Community Support**: Посвећени форуми за питања везана за миграцију

---

**Навигација**
- **Претходна лекција**: [Водич за учење](resources/study-guide.md)
- **Следећа лекција**: Повратак на [Главни README](README.md)

**Останите у току**: Праћење овог репозиторијума за обавештења о новим издањима и важним ажурирањима материјала за учење.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->