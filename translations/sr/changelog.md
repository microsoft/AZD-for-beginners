# Дневник промена - AZD За почетнике

## Увод

Овај дневник промена документира све значајне промене, ажурирања и побољшања у AZD За почетнике репозиторијуму. Пратимо принципе семантичког верзионисања и одржавамо овај запис како бисмо помогли корисницима да разумеју шта се променило између верзија.

## Циљеви учења

Прегледом овог дневника промена, ви ћете:
- Остварити увид у нове функције и додатке садржаја
- Разумети побољшања направљена у постојећој документацији
- Пратити исправке грешака и корекције ради обезбеђивања тачности
- Пратити еволуцију материјала за учење током времена

## Резултати учења

Након прегледа уноса у дневнику промена, моћи ћете:
- Да идентификујете нови садржај и ресурсе који су доступни за учење
- Да разумете које су секције ажуриране или побољшане
- Да планирате свој пут учења на основу најактуелнијих материјала
- Да допринесете повратним информацијама и предлозима за будућа побољшања

## Историја верзија

### [v3.24.0]- 2026-11-04

#### Исправљено
- Поправљена навигација енглеског курса, путеви померених страница, недостајући сидра и застарели спољашњи референци, укључујући линк на Поглавље 2 за водич за продукцијски AI.
- Прегледана актуелна упутства у односу на објављени AZD 1.37.2, агенте 1.0.0-beta.23 и евалуације 1.0.0-beta.2. Документована одвојена `azd ai eval` радна процедура и миграција конфигурације оптимизације.
- Исправљени неподржани CLI параметри, границе аутентификације, упутства за нешифровану околину/тајне, инфраструктурне измене, конфигурација модела и примери деструктивног опоравка.
- Освежен радионичарки садржај према актуелном AI Agents примеру, укључујући стварне хукове, улазе у конфигурацију, тестове евалуације, улазне тачке за црвени тим и посматрање.
- Исправљене тврдње о примерима имплементације и отклоњени повезани проблеми са апликацијом/инфраструктуром/конфигурацијом. Материјал о архитектури за трговину је јасно разликовање од потпуне радне апликације.
- Вратљена CodeQL језичка матрица, одабран подржани Node.js 24 за дев контејнер, и направљени валидатори подешавања који пријављују неуспеле верзијске команде.

#### Додато
- Проверавач везе/сидра само на енглеском ван мреже, регресионе тестове и радну процедуру за документацију која такође гради радионицу у строгом режиму. Генерисани преводи и преведене слике су искључени.

#### Опсег валидације
- Провере извора, синтаксе, конфигурације, локалног понашања и мрежних веза не утврђују живу могућност распоређивања на Аzure, квоту, RBAC, регионалну доступност модела, наплату, безбедносну усаглашеност или спремност за продукцију.
- Старији уноси доле су историјски записи, а не тренутна упутства за команде или издања.

### [v3.23.0] - 2026-07-13

#### АЖУРИРАЊЕ AZD 1.27.1: Ажурирање валидности верзије
**Ова верзија поново валида курс према `azd` `1.27.1` (јул 2026, најновије стабилно издање) и актуелној прегледној AI agent екстензији `azure.ai.agents` `1.0.0-beta.5`, доводећи сваки банер "валидирано према" до датума након издања 1.26.0, 1.27.0 и 1.27.1.**

#### Промењено
- **✅ Ажурирана референтна база валидности** са `azd 1.25.6` (јун 2026) на `azd 1.27.1` (јул 2026) у коренском README-у, свим поглављима README, лекцији о дев контејнеру у Поглављу 1 (укључујући примере фиксне верзије), лекцији о прилагођеним шаблонима у Поглављу 4, лекцији о више агената у Поглављу 5 и документацији радионице
- **🤖 Освежена референтна база Поглавља 2** са `azd 1.23.12` (март 2026) на `azd 1.27.1` у `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, и `microsoft-foundry-integration.md`; ажурирани датуми напомена о валидацији на 2026-07-13
- **🧩 Повећана AI agent екстензија** са `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` на актуелно `1.0.0-beta.5` издање у README-у Поглавља 2 и `agents.md`
- **🧪 Ажурирани пример валидности радионице** (`azd version` излаз) на `1.27.1`

#### Напомена о релевантним azd издањима (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Подршка за Go за Azure Functions на Flex Consumption, `azd config sub-filter` филтери по претплатнику, самостални екстензиони пакети (`azd x pack --bundle`) и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделирање Azure AI Foundry пројеката/агената директно у `azure.yaml` (иницијализација без Bicep/Terraform), подршка за распоређивање контејнера у App Service (`host: appservice` + `language: docker`), директни `-s/--source` за `azd extension` команде, и `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` параметар за `azd extension install`, подразумевано искључени застарели модели из каталога/квота упита, и неколико исправки грешака

#### Ажурирани фајлови
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Попуњавање празнина за почетнике #2: Писање шаблона, Дев контејнери, Pulumi, Azure DevOps, сервисни налози и још много тога
**Ова верзија затвара преостале средњо-ниво празнине из анализе покривености azd: како писати и публиковати свој шаблон, репродуктивна дев-контејнер/Codespaces окружења, Pulumi провајдер инфраструктуре, шетња кроз Azure DevOps CI/CD, аутентификација сервисних налога, упутства за избор хоста (AKS/Spring Apps), објашњења `azd restore`/`azd package`, руковање грешкама хукова и праксе тимских/заједничких окружења.**

#### Додато
- **🧱 Нова лекција у Поглављу 4** `docs/chapter-04-infrastructure/custom-templates.md` — писање вашег азд шаблона: потребна структура (`azure.yaml`, `infra/`, `src/`), `metadata.template` поље, параметризација инфраструктуре са `uniqueString()` ресурсним токеном и `azd-env-name` ознаком, локално тестирање са `azd init --template <local-path>`, публиковање на GitHub и слање у Awesome AZD галерију
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/dev-containers.md` — репродуктивна azd окружења са Дев контејнерима и GitHub Codespaces: минималан `.devcontainer/devcontainer.json` користећи званичну `ghcr.io/azure/azure-dev/azd` функцију, језичке специфичне могућности, `docker-in-docker` за хостове контејнера и `azd auth login --use-device-code` за удаљено пријављивање
- **🧩 Pulumi са azd** одељак у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, распореда Pulumi фасцикле, стогови мапирани на azd окружења, потребни изласци/означавање и идентичан `azd up` / `azd down` радни ток
- **🎯 Упутства за избор хоста** у `docs/chapter-04-infrastructure/provisioning.md` — пријатељско поређење `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp` уз смернице када одабрати AKS или Azure Spring Apps
- **🛠️ Azure DevOps CI/CD шетња** у `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, сервисна конекција са федерацијом идентитета оптерећења (OIDC), генерисани `azure-dev.yml` и подешавање варијабилних група
- **🔑 Додати сервисни налози (Образац 4)** у `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивна `azd auth login` са клијентском тајном у односу на федеративне/OIDC акредитиве, када користити и безбедно чување акредитива
- **🪝 Руководство руковања грешкама хукова** пододељак у `docs/chapter-04-infrastructure/deployment-guide.md` — кодови изласка и `set -e`, `continueOnError`, тестирање хукова у изолацији са `azd hooks run`, ОС специјалне љуске и `--debug`
- **👥 Тимска / заједничка окружења** одељак у `docs/chapter-03-configuration/configuration.md` — шта се налази у `.azure/`, шта треба игнорисати у Git-у, појединачна окружења програмера, `azd env list`/`select` и обезбеђивање вредности окружења у CI/CD
- **🧰 Објашњења `azd restore` и проширено `azd package`** у `resources/cheat-sheet.md` — враћање зависности и изградња распоређивог артефакта без распоређивања

#### Промењено
- **🧭 Табела лекција у Поглављу 4** ажурирана да укључи нову лекцију "Писање вашег шаблона" (Лекција 3)
- **🧭 Табела лекција у Поглављу 1** ажурирана да укључи нову лекцију "Дев контејнери и Codespaces" (Лекција 5); навигациони подножја повезана између `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Попуњавање празнина за почетнике: Практична лекција о вишеструким агентима, "Донеси своју апликацију," Terraform и CI/CD шетња
**Ова верзија затвара највеће празнине за комплетног почетника додавањем две нове практичне лекције (пуна рука вишеструких агената и додавање azd у постојећу апликацију), почетничког упознавања са хуковима, дела о Terraform-у са azd, корак-по-корак GitHub Actions шетње, објашњења за нове прегледне екстензије и експлицитне чек-листе верификације распореда.**

#### Додато
- **🤝 Нова лекција у Поглављу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — потпуно практична, распоредива шетња са два агента (оркестратор + стручњаци) користећи стварни шаблон (`contoso-creative-writer`), обухватајући када користити више агената, `azd up` радни ток, разумевање распоређених ресурса, праћење између агената, прилагођавање и чишћење
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — како додати azd у постојећи пројекат са `azd init` ("користи код у тренутном директоријуму"), разумевање `azure.yaml` и `infra/`, `azd infra generate`, откривање хоста и распоређивање са `azd up`
- **🌐 Terraform са azd** додат у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` конфигурацију, `.tf` распореда фасцикле, потребне `AZURE_*` излазе и `azd-env-name` означавање, и идентичан `azd up` / `azd down` радни ток (затвара празнину где је тврђена Terraform подршка али је приказан само Bicep)
- **⚙️ Корак-по-корак GitHub Actions шетња** у `docs/chapter-08-production/production-ai-practices.md` — од GitHub репозиторијума до аутоматизованог распореда: `azd pipeline config`, OIDC федеративни акредитиви (без сачуваних тајни), генерисани `azure-dev.yml` и смернице о тајнама и варијаблама
- **🪝 Почетнички увод "Нов у хуковима?"** у `docs/chapter-04-infrastructure/deployment-guide.md` — шта је хук, табела стадијума хукова, минимални први хук и ручно покретање хукова са `azd hooks run`
- **✅ Додата чек-листа "Проверите ваш распоред"** у Кораку 5 `docs/chapter-01-foundation/first-project.md` — smoke тест, провера здравствене тачке и експлицитни критеријуми успеха
- **🧩 Објашњење за нове прегледне екстензије** `azure.ai.skills` и `azure.ai.connections` (шта јесу и када их користити) у `docs/chapter-08-production/production-ai-practices.md`

#### Промењено
- **🧭 Табела лекција у Поглављу 5** исправљена: `multi-agent-basics.md` је сада Лекција 1 (једина потпуно практична лекција), са искреним означавањем да Лекција 2 припада Поглављу 6 и сценарио трговине је архитектонска шема, не једнокомандни шаблон
- **🧭 Табела лекција у Поглављу 1** сада укључује нову лекцију "Донеси своју апликацију" (Лекција 4)
- **🔗 Навигациона подножја** ажурирана: `first-project.md` сада води напред ка `bring-your-own-app.md`

#### Исправљено
- **🧱 Затворена "тврђена али недостајућа" Terraform празнина** — курс је раније помињао Terraform подршку без показивања
- **🔀 Исправљени обмањујући међупоглављни линкови у Поглављу 5** који су имплицирали постојање пуне имплементације вишеструких агената када је постојала само архитектонска шема

#### Ажурирани фајлови
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(ново)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(ново)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 освежавање, комплетне команде животног циклуса агента и Aspire ребрендирање
**Ова верзија поново валида курс у односу на `azd` `1.25.6` (јун 2026) и `azure.ai.agents` `0.1.40-preview` екстензију, проширује AI смернице са "постављања агента" на комплетан животни циклус агента (тестирање → евалуација → оптимизација → инспекција → брисање), приказује нове `azure.ai.skills` и `azure.ai.connections` preview екстензије, и бележи референцу ребренда производа са ".NET Aspire" на "Aspire".**

#### Додато
- **🔁 Потпуна покривеност животног циклуса агента** за почетнике и AI инжењере кроз целу документацију:
  - `docs/chapter-01-foundation/azd-basics.md` — Табела животног циклуса (постављање → тестирање → мерење → унапређење → инспекција → чишћење) додата у одељак о екстензијама и AI командама
  - `docs/chapter-08-production/production-ai-practices.md` — Нови одељак "Управљање животним циклусом агента" покрива `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, и `delete --force`
  - `resources/cheat-sheet.md` — Проширене AI командe за агентe са `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, и `delete --force`
- **🧩 Нове preview екстензије** документоване: `azure.ai.skills` (поново употребљиве вештине агената) и `azure.ai.connections` (Foundry конекције) додате у табелу екстензија и cheat sheet
- **⏱️ Смернице о времену одговора** — примери `azd ai agent invoke` сада бележе укупну латенцију и време до првог бајта
- **📌 Банер са верзијом** у главном README усмеравa учеснике ка `azd version` и `azd upgrade`

#### Промењено
- **✅ Основни ниво валидације ажуриран** са `azd 1.23.12` (март 2026) на `azd 1.25.6` (јун 2026) у свим README фајловима поглавља и документацији радионице
- **🤖 Напомена о екстензији главе 2** ажурирана са `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Пример валидације радионице** (излаз `azd version`) ажуриран на `1.25.6`
- **🧭 README "Шта је ново у azd Today"** освежен да нагласи комплетан животни циклус агента, нове AI екстензије, и недавне поправке за боље корисничко искуство (`azd init` идемпотентност, `azd auth login` чишћење истеклог токена, `azd tool` почетни упит)
- **📖 agents.md поглавље 2 (Опција 4)** сада усмерава учеснике на команде животног циклуса након deploy-а уместо да се зауставља на `azd up`

#### Исправљено
- **🏷️ Именовање производа** — додата напомена о ребрендирању Aspire (".NET Aspire" је сада једноставно "Aspire"); азд Aspire подршка није промењена
- **🔎 Верификација уживо** потврђена на Azure Developer CLI release feed: стабилни CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Фајлови ажурирани
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

#### Појашњење увођења почетника, валидација подешавања и финално чишћење AZD команди
**Ова верзија прати валидацију AZD 1.23 са прегледом документације фокусираним на почетнике: појашњава смернице о аутентификацији првенствено AZD, додаје скрипте за локалну валидацију подешавања, проверава кључне команде према уживо AZD CLI и уклања последње застареле референце команди на енглеском изван changelog-а.**

#### Додато
- **🧪 Скрипте за валидацију почетничког подешавања** са `validate-setup.ps1` и `validate-setup.sh` како би учесници могли да провере потребне алате пре почетка 1. поглавља
- **✅ Почетни кораци валидације подешавања** у главном README и README-у 1. поглавља да би се откриле недостајуће претпоставке пре `azd up`

#### Промењено
- **🔐 Смернице аутентификације за почетнике** сада доследно третирају `azd auth login` као примарни пут за AZD радне токове, са `az login` назначеним као опционалним осим у случају коришћења Azure CLI команди директно
- **📚 Ток увођења у 1. поглављу** сада усмерава почетнике да верификују локално окружење пре корака инсталације, аутентификације и првог deploy-а
- **🛠️ Поруке валидатора** сада јасно разликују блокирајуће захтеве од опционалних упозорења Azure CLI-а за ексклузивни AZD пут почетника
- **📖 Конфигурација, решавање проблема и примерна документација** сада разликују обавезну AZD аутентификацију од опционалног Azure CLI пријављивања где је раније све приказивано без контекста

#### Исправљено
- **📋 Преостале референце команда на енглеском** ажуриране у тренутне AZD форме, укључујући `azd config show` у cheat sheet-у и `azd monitor --overview` тамо где је намењена Azure Portal прегледна смерница
- **🧭 Изјаве почетника у 1. поглављу** ублажене да се избегне прекомерно обећавање гаранција безгрешног или rollback понашања на свим шаблонима и Azure ресурсима
- **🔎 Верификација уживо CLI** потврдила тренутну подршку за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, и `azd down --force --purge`

#### Фајлови ажурирани
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

#### AZD 1.23.12 валидација, проширење радионице и освежавање AI модела
**Ова верзија врши преглед документације у односу на `azd` `1.23.12`, ажурира примере застарелих AZD команди, освежава смернице AI модела на тренутне подразумеване вредности, и проширује инструкције радионице преко GitHub Codespaces да укључи и подршку за dev контејнере и локална клонирања.**

#### Додато
- **✅ Напомене о валидацији у свим главним поглављима и документацији радионице** како би се учесницима јасно назначио тестирани AZD основни ниво за новије и старије CLI издања
- **⏱️ Смернице о времену истека deploy-а** за дуготрајне deploy-e AI апликација помоћу `azd deploy --timeout 1800`
- **🔎 Кораци инспекције екстензија** са `azd extension show azure.ai.agents` у AI workflow документацији
- **🌐 Проширене смернице среды радионице** које покривају GitHub Codespaces, dev контејнере, и локална клонирања уз помоћ MkDocs

#### Промењено
- **📚 Интро README-ови поглавља** сада доследно бележе валидацију са `azd 1.23.12` кроз теме као што су основа, конфигурација, инфраструктура, мулти-агент системи, пре-деплој, решавање проблема и продукција
- **🛠️ Референце AZD команди** ажуриране на тренутне форме у целој документацији:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` зависно од контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` тамо где је намењен преглед Application Insights
- **🧪 Поједностављени примери preview снабдевања** на тренутно подржану употребу као што су `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Ток радионице** ажуриран тако да учесници могу завршити лабораторије у Codespaces, dev контејнеру или локалном клону уместо да се претпоставља извршење само у Codespaces
- **🔐 Смернице аутентификације** сада претпочитају `azd auth login` за AZD токове рада, док је `az login` позициониран као опционалан када се команде Azure CLI користе директно

#### Исправљено
- **🪟 Виндовс инсталационе команде** нормализоване на тренутни регистар пакета `winget` у водичу за инсталацију
- **🐧 Линукс смернице за инсталацију** исправљене да избегну непостојеће distro-специфичне инструкције за пакет менаџер `azd` и уместо тога упућују на релевантне release ассете
- **📦 AI модели примери** освежени са старијих подразумеваних као што су `gpt-35-turbo` и `text-embedding-ada-002` на тренутне примере као што су `gpt-4.1-mini`, `gpt-4.1`, и `text-embedding-3-large`
- **📋 Сниппети за deploy и дијагностику** исправљени да користе тренутне команде окружења и статуса у логовима, скриптама и корацима за решавање проблема
- **⚙️ Смернице за GitHub Actions** ажуриране са `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Смернице за MCP/Copilot пристанак** ажуриране са `azd mcp consent` на `azd copilot consent list`

#### Унапређено
- **🧠 AI смернице у поглављу** сада боље објашњавају preview-осетљиво понашање `azd ai`, улаз у tenant, тренутну употребу екстензија и ажуриране препоруке за развој модела
- **🧪 Упутства за радионицу** сада користе реалније примере верзија и јаснији језик за подешавање окружења у практичним лабораторијама
- **📈 Документација за продукцију и решавање проблема** сада боље усаглашена са тренутним примерима монитора, fallback модела и нивоа трошкова

#### Фајлови ажурирани
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
**Ова верзија додаје покривеност команди `azd ai`, `azd extension`, и `azd mcp` у свим AI релевантним поглављима, исправља поломљене линкове и застарели код у agents.md, ажурира cheat sheet, и потпуно преуређује одељак Пример шаблона са верификованим описима и новим Azure AI AZD шаблонима.**

#### Додато
- **🤖 Покривеност AZD AI CLI-а** у 7 фајлова (раније само у 8. поглављу):
  - `docs/chapter-01-foundation/azd-basics.md` — Нови одељак "Екстензије и AI Команде" који уводи `azd extension`, `azd ai agent init`, и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опција 4: `azd ai agent init` са табелом поређења (шаблон у односу на манифест приступ)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Пододељци "AZD екстензије за Foundry" и "Деплој првенствено агената"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start сада показује оба пута deploy-а: по шаблону и преко манифеста
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секција Deploy сада укључује опцију `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Пододељак "AZD AI команде за дијагностику"
  - `resources/cheat-sheet.md` — Нови одељак "AI & Екстензије Команде" са `azd extension`, `azd ai agent init`, `azd mcp`, и `azd infra generate`
- **📦 Нови AZD AI пример шаблони** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat са подршком за Blazor WebAssembly, Semantic Kernel и гласовни чат
  - **azure-search-openai-demo-java** — Java RAG chat коришћењем Langchain4J са ACA/AKS опцијама deploy-а
  - **contoso-creative-writer** — Апликација за креативно писање са више агената користећи Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Serverless RAG користећи Azure Functions + LangChain.js + Cosmos DB са локалном Ollama подршком
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG акцелератор са административним порталом, интеграцијом у Teams и опцијама PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Мулти-агент MCP оркестрациони референтни апликација са серверима у .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимални Azure AI инфраструктурни Bicep стартни шаблон
  - **🔗 Линк Awesome AZD AI Gallery** — Референца на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблона)

#### Исправљено
- **🔗 agents.md навигација**: Линкови Претходно/Следеће сада одговарају редоследу лекција у Члану 2 README-ја (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md покварени линкови**: `production-ai-practices.md` исправљено у `../chapter-08-production/production-ai-practices.md` (3 појаве)
- **📦 agents.md застарели код**: Заменjен `opencensus` са `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md неважећи API**: Помeрено `max_tokens` из `create_agent()` у `create_run()` као `max_completion_tokens`
- **🔢 agents.md бројање токена**: Замењена груба процена `len//4` са `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправљене услуге са "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (подразумевани хост промењен у октобру 2024)
- **contoso-chat**: Ажуриран опис да реферише Azure AI Foundry + Prompty, у складу са стварним насловом и технолошким стеком репозиторијума

#### Уклоњено
- **ai-document-processing**: Уклоњена нефункционална референца на шаблон (репо није јавно доступан као AZD шаблон)

#### Побољшано
- **📝 agents.md вежбе**: Вежба 1 сада приказује очекивани излаз и `azd monitor` корак; Вежба 2 садржи комплетан `FunctionTool` регистрациони код; Вежба 3 замењује нејасна упутства конкретним `prepdocs.py` командама
- **📚 agents.md ресурси**: Ажуриране везе ка актуелној документацији Azure AI Agent Service и кратком водичу
- **📋 agents.md табела Следећих корака**: Додата веза за AI Workshop Lab за потпуну обраду поглавља

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

#### Побољшање навигације кроз курс
**Ова верзија побољшава навигацију кроз README.md поглавља са унапређеним форматом табеле.**

#### Промењено
- **Табела мапе курса**: Побољшана са директним линковима ка лекцијама, проценама трајања и оценама сложености
- **Чишћење фолдера**: Уклоњени сувишни стари фолдери (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Валидација линкова**: Проверено свих 21+ интерних линкова у Табели мапе курса

### [v3.16.0] - 2026-02-05

#### Ажурирања имена производа
**Ова верзија ажурира референце производа на актуелни Microsoft брејндинг.**

#### Промењено
- **Microsoft Foundry → Microsoft Foundry**: Све референце ажуриране у свим фајловима који нису преводи
- **Azure AI Agent Service → Foundry Agents**: Назив сервиса ажуриран да одражава тренутни брејндинг

#### Ажурирани фајлови
- `README.md` - Главна почетна страница курса
- `changelog.md` - Историја верзија
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Водич за AI агенте
- `examples/README.md` - Документација примера
- `workshop/README.md` - Почетна страница радионице
- `workshop/docs/index.md` - Индекс радионице
- `workshop/docs/instructions/*.md` - Сви упутни фајлови радионице

---

### [v3.15.0] - 2026-02-05

#### Значајна реструктурирања репозиторијума: Фолдери по поглављима
**Ова верзија реструктурира документацију у посебне фолдере за сва поглавља ради јасније навигације.**

#### Преименовање фолдера
Стари фолдери су замењени фолдерима означеним бројем поглавља:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додат нови: `docs/chapter-05-multi-agent/`

#### Миграције фајлова
| Фајл | Из | У |
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
| Сви фајлови пре-деплојења | pre-deployment/ | chapter-06-pre-deployment/ |
| Сви фајлови за решавање проблема | troubleshooting/ | chapter-07-troubleshooting/ |

#### Додато
- **📚 README фајлови по поглављима**: Креиран README.md у сваком фолдеру поглавља са:
  - Циљевима учења и трајањем
  - Табелом лекција са описима
  - Командама за брзи почетак
  - Навигацијом ка другим поглављима

#### Промењено
- **🔗 Ажурирани сви интерни линкови**: 78+ пута ажурирана путања у свим документима
- **🗺️ Главни README.md**: Ажурирана мапа курса са новом структуром поглавља
- **📝 examples/README.md**: Ажуриране референце на фолдере по поглављима

#### Уклоњено
- Стари фолдери (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктурирање репозиторијума: Навигација по поглављима
**Ова верзија додаје README фајлове за навигацију по поглављима (замењено верзијом v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Нови водич за AI агенте
**Ова верзија додаје обухватан водич за деплој AI агената помоћу Azure Developer CLI.**

#### Додато
- **🤖 docs/microsoft-foundry/agents.md**: Комплетан водич који покрива:
  - Шта су AI агенти и како се разликују од ћаскања (чатботова)
  - Три шаблона за брз почетак агената (Foundry Agents, Prompty, RAG)
  - Обрасци архитектуре агената (један агент, RAG, мулти-агент)
  - Конфигурација и прилагођавање алата
  - Праћење и метрике
  - Разматрања трошкова и оптимизација
  - Чести сценарији решавања проблема
  - Три практичне вежбе са критеријумима успеха

#### Структура садржаја
- **Увод**: Концепти агената за почетнике
- **Quick Start**: Деплој агената помоћу `azd init --template get-started-with-ai-agents`
- **Обрасци архитектуре**: Визуелни дијаграми образаца агената
- **Конфигурација**: Подешавање алата и променљиве окружења
- **Праћење**: Интеграција Application Insights-а
- **Вежбе**: Прогресивно практично учење (20-45 минута по вежби)

---

### [v3.12.0] - 2026-02-05

#### Ажурирање развојног контејнера
**Ова верзија ажурира конфигурацију развојног контејнера са модерним алатима и бољим подразумеваним подешавањима за AZD учење.**

#### Промењено
- **🐳 Основна слика**: Ажурирана са `python:3.12-bullseye` на `python:3.12-bookworm` (најновији стабилни Debian)
- **📛 Назив контејнера**: Преименован са "Python 3" у "AZD for Beginners" ради јасноће

#### Додато
- **🔧 Нове функције развојног контејнера**:
  - `azure-cli` са омогућеном Bicep подршком
  - `node:20` (LTS верзија за AZD шаблоне)
  - `github-cli` за управљање шаблонима
  - `docker-in-docker` за деплојмент контејнер апликација

- **🔌 Прослеђивање портова**: Пред-конфигурисани портови за уобичајени развој:
  - 8000 (преглед MkDocs)
  - 3000 (веб апликације)
  - 5000 (Python Flask)
  - 8080 (API-ји)

- **🧩 Нови VS Code додаци**:
  - `ms-python.vscode-pylance` - Побољшан Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Подршка за Azure Functions
  - `ms-azuretools.vscode-docker` - Подршка за Docker
  - `ms-azuretools.vscode-bicep` - Подршка за Bicep језик
  - `ms-azure-devtools.azure-resource-groups` - Управљање Azure ресурсима
  - `yzhang.markdown-all-in-one` - Уређивање Markdown-а
  - `DavidAnson.vscode-markdownlint` - Линтинг Markdown-а
  - `bierner.markdown-mermaid` - Подршка за Mermaid дијаграме
  - `redhat.vscode-yaml` - YAML подршка (за azure.yaml)
  - `eamodio.gitlens` - Визуализација Git-а
  - `mhutchie.git-graph` - Историја Git-а

- **⚙️ Подешавања VS Code**: Додата подразумевана подешавања за Python интерпретер, форматирање при чувању и чишћење празнина

- **📦 Aжурирани requirements-dev.txt**:
  - Додат MkDocs minify плугин
  - Додат pre-commit за квалитет кода
  - Додати Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Исправљено
- **Post-Create команда**: Сада проверава инсталацију AZD и Azure CLI при покретању контејнера

---

### [v3.11.0] - 2026-02-05

#### Потпуна преправка README за почетнике
**Ова верзија знатно побољшава README.md ради веће приступачности почетницима и додаје кључне ресурсе за AI програмере.**

#### Додато
- **🆚 Поређење Azure CLI и AZD**: Јасно објашњење када користити који алат са практичним примерима
- **🌟 Одлични AZD линкови**: Директни линкови ка заједничкој галерији шаблона и ресурсима за допринос:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ спремних за употребу шаблона
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Заједнички доприноси
- **🎯 Водич за брзи почетак**: Поједностављен одељак са 3 корака (Инсталација → Пријава → Деплој)
- **📊 Табела навигације према искуству**: Јасне смернице одакле почети у зависности од искуства програмера

#### Промењено
- **Структура README-а**: Реорганизована за постепено откривање - најважније информације прво
- **Уводни одељак**: Прерађен за објашњење "Магије `azd up`" за потпуне почетнике
- **Уклоњен дупликат садржаја**: Уклоњен дуплирани одељак о решавању проблема
- **Команде за решавање проблема**: Исправљена референца `azd logs` да користи важећи `azd monitor --logs`

#### Исправљено
- **🔐 Команде за аутентикацију**: Додати `azd auth login` и `azd auth logout` у cheat-sheet.md
- **Неважеће команде уклоњене**: Уклонити преостале `azd logs` из одељка за решавање проблема у README-у

#### Напомене
- **Обим**: Промене примењене у главном README.md и resources/cheat-sheet.md
- **Циљна публика**: Побољшања посебно намењена програмерима новим у AZD

---

### [v3.10.0] - 2026-02-05

#### Исправка тачности Azure Developer CLI команди
**Ова верзија исправља не-постојеће AZD команде у документацији, обезбеђујући да сви пример кода користе важећу Azure Developer CLI синтаксу.**

#### Исправљено
- **🔧 Уклоњене не-постојеће AZD команде**: Основни аудит и исправка неважећих команди:
  - `azd logs` (не постоји) → замењено са `azd monitor --logs` или Azure CLI алтернативама
  - `azd service` подкоманде (не постоје) → замењене са `azd show` и Azure CLI
  - `azd infra import/export/validate` (не постоје) → уклоњене или замењене важећим алтернативама
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` флагови (не постоје) → уклоњени
  - `azd provision --what-if/--rollback` флагови (не постоје) → ажурирани да користе `--preview`
  - `azd config validate` (не постоји) → замењен са `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не постоје) → уклоњени

- **📚 Ажурирани фајлови са исправкама команди**:
  - `resources/cheat-sheet.md`: Веома прерађен референтни део команди
  - `docs/deployment/deployment-guide.md`: Исправљене стратегије повлачења и деплоја
  - `docs/troubleshooting/debugging.md`: Исправљени одељци за анализу логова
  - `docs/troubleshooting/common-issues.md`: Ажуриране команде за решавање проблема
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљен део за дебаговање AZD-а
  - `docs/getting-started/azd-basics.md`: Исправљене команде за мониториње
  - `docs/getting-started/first-project.md`: Ажурирани примери за праћење и отклањање грешака
  - `docs/getting-started/installation.md`: Поправљени примери за помоћ и верзију
  - `docs/pre-deployment/application-insights.md`: Исправљене команде за преглед логова
  - `docs/pre-deployment/coordination-patterns.md`: Поправљене команде за отклањање грешака агента

- **📝 Ажурирана Референца Верзије**: 
  - `docs/getting-started/installation.md`: Промењена хардкодирана верзија `1.5.0` у општију `1.x.x` са линком ка издањима

#### Промењено
- **Стратегије Враћања**: Ажурирана документација за коришћење Git-базираних стратегија враћања (AZD нема уграђено враћање)
- **Преглед Логова**: Замене `azd logs` референци са `azd monitor --logs`, `azd monitor --live` и Azure CLI командама
- **Секција Перформанси**: Уклоњене не постојеће заставице за паралелно/инкрементално деплојовање, обезбеђене важеће алтернативе

#### Технички Детаљи
- **Важеће AZD Команде**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Важеће azd monitor Заставице**: `--live`, `--logs`, `--overview`
- **Уклоњене Функције**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Напомене
- **Верификација**: Команде су верификоване помоћу Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завршетак Радионице и Ажурирање Квалитета Документације
**Ова верзија завршава интерактивне модуле радионице, исправља све покварене линкове у документацији и унапређује укупни квалитет садржаја за AI програмере који користе Microsoft AZD.**

#### Додато
- **📝 CONTRIBUTING.md**: Нови документ са смерницама за допринос који садржи:
  - Јасна упутства за пријаву проблема и предлоге промена
  - Стандарде за документацију новог садржаја
  - Упутства за примере кода и конвенције порука комита
  - Информације о ангажовању заједнице

#### Завршено
- **🎯 Модул Радионице 7 (Завршетак)**: Потпуно завршен модул завршне обраде са:
  - Свеобухватним резимеом о достигнућима радионице
  - Секцијом кључних савладаних појмова о AZD, шаблонима и Microsoft Foundry
  - Препорукама за наставак учења
  - Вежбама за изазове радионице са оценама тежине
  - Повратним информацијама и линковима за подршку заједници

- **📚 Модул Радионице 3 (Деконструкција)**: Ажурирани циљеви учења са:
  - Упутства за активирање GitHub Copilot са MCP серверима
  - Разумевање структуре фолдера AZD шаблона
  - Обрасци инфраструктуре као кода (Bicep)
  - Упутства за практичан рад у лабораторији

- **🔧 Модул Радионице 6 (Затварање)**: Завршен са:
  - Циљевима чишћења ресурса и управљања трошковима
  - Коришћењем `azd down` за безбедно деактивирање инфраструктуре
  - Упутства за опоравак меко обрисаних когнитивних сервиса
  - Додатним подстицајима за истраживање GitHub Copilot-а и Azure портала

#### Исправљено
- **🔗 Исправке Покварених Линкова**: Решено 15+ покварених интерних линкова у документацији:
  - `docs/ai-foundry/ai-model-deployment.md`: Исправљени путеви до microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљени путеви ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замењен не постојећи cicd-integration.md са deployment-guide.md
  - `examples/retail-scenario.md`: Исправљени путеви FAQ и водича за решавање проблема
  - `examples/container-app/microservices/README.md`: Исправљени путеви курса и водича за деблој
  - `resources/faq.md` и `resources/glossary.md`: Ажуриране референце поглавља AI
  - `course-outline.md`: Исправљене референце инструктора и лабораторијских AI радионица

- **📅 Банер Статуса Радионице**: Ажуриран са "у изградњи" на активан статус радионице са датумом фебруар 2026

- **🔗 Навигација Радионице**: Исправљени покварени навигациони линкови у README.md радионице који су упућивали на не постојећу фасциклу lab-1-azd-basics

#### Промењено
- **Презентација Радионице**: Уклонивши упозорење о "у изградњи", радионица је сада завршена и спремна за употребу
- **Конзистентност Навигације**: Осигурана исправна међумодулска навигација у свим модулима радионице
- **Референце Путања Учења**: Ажуриране крос-референце поглавља на исправне microsoft-foundry путеве

#### Верификовано
- ✅ Све енглеске markdown датотеке имају важеће интерне линкове
- ✅ Модули радионице 0-7 су завршени са циљевима учења
- ✅ Навигација између поглавља и модула функционише исправно
- ✅ Садржај је прикладан за AI програмере који користе Microsoft AZD
- ✅ Језик и структура прилагођени почетницима су задржани кроз цео материјал
- ✅ CONTRIBUTING.md пружа јасна упутства за допринос заједнице

#### Техничка Имплементација
- **Валидација Линкова**: Аутоматизован скрипт у PowerShell-у је проверио све .md интерне линкове
- **Аудит Садржаја**: Ручни преглед комплетности радионице и прикладности за почетнике
- **Навигациони Систем**: Примењени доследни обрасци навигације по поглављима и модулима

#### Напомене
- **Обим**: Промене применљиве само на англиску документацију
- **Преводи**: Преводилачке фасцикле нису ажуриране у овој верзији (аутоматски превод ће бити синхронизован касније)
- **Трајање Радионице**: Комплетна радионица сада пружа 3-4 сата практичног учења

---

### [v3.8.0] - 2025-11-19

#### Напредна Документација: Мониторинг, Безбедност и Обрасци Мулти-Агената
**Ова верзија додаје свеобухватне лекције А-квалитета о интеграцији Application Insights, обрасцима аутентикације и координацији мулти-агената за продукцијске деплоје.**

#### Додато
- **📊 Лекција о Интеграцији Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - Деплој усмерен на AZD са аутоматским провизионисањем
  - Комплетни Bicep шаблони за Application Insights + Log Analytics
  - Ради Python апликација са прилагођеном телеметријом (преко 1.200 линија)
  - Обрасци мониторинга AI/LLM (праћење токена/трошкова Microsoft Foundry Модела)
  - 6 Mermaid дијаграма (архитектура, дистрибуирано праћење, проток телеметрије)
  - 3 практичне вежбе (аларми, контролне табле, AI мониторинг)
  - Примери Kusto упита и стратегије оптимизације трошкова
  - Стреаминг живих метрика и отклањање грешака у реалном времену
  - Време учења 40-50 минута са продукцијским обрасцима

- **🔐 Лекција о Обрасцима Аутентикације и Безбедности**: у `docs/getting-started/authsecurity.md`:
  - 3 обрасца аутентикације (конекцијски низови, Key Vault, управљани идентитет)
  - Комплетни Bicep шаблони инфраструктуре за безбедне деплоје
  - Node.js код апликације са Azure SDK интеграцијом
  - 3 комплетне вежбе (омогућавање управљаног идентитета, корисничког идентитета, ротација Key Vault-а)
  - Безбедносне најбоље праксе и RBAC конфигурације
  - Водич за решавање проблема и анализа трошкова
  - Продукцијски спремни обрасци безшалтерске аутентикације

- **🤖 Лекција о Обрасцима Координације Мулти-Агената**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 обрасца координације (секвенцијални, паралелни, хијерархијски, вођен догађајима, консензус)
  - Комплетна имплементација оркестратор сервиса (Python/Flask, преко 1.500 линија)
  - 3 специјализована агента (Истраживач, Писац, Уредник)
  - Интеграција са Service Bus за редове порука
  - Управљање стањем у Cosmos DB за дистрибуиране системе
  - 6 Mermaid дијаграма који приказују интеракције агената
  - 3 напредне вежбе (руковање временским ограничењем, логика поновног покушаја, прекидач кола)
  - Распоред трошкова (240-565 долара месечно) са стратегијама оптимизације
  - Интеграција Application Insights за мониторинг

#### Побољшано
- **Поглавље Пре Деплоја**: Садржи свеобухватне обрасце мониторинга и координације
- **Поглавље Почетак**: Побољшано професионалним обрасцима аутентикације
- **Спремност за Продукцију**: Потпуна покривеност од безбедности до посматрања
- **Оквир Курса**: Ажуриран са новим лекцијама у Поглављима 3 и 6

#### Промењено
- **Напредовање Учења**: Боља интеграција безбедности и мониторинга кроз цео курс
- **Квалитет Документације**: Доследни стандарди А-квалитета (95-97%) кроз нове лекције
- **Обрасци за Продукцију**: Потпуна енд-то-енд покривеност за предузећа

#### Унапређено
- **Радно Искусство Развојног Инжењера**: Јасан пут од развоја до продуктива мониторинга
- **Стандарди Безбедности**: Професионални обрасци за аутентикацију и управљање тајнама
- **Посматрање**: Потпуна интеграција Application Insights са AZD
- **AI Радна Оптерећења**: Специјализован мониторинг за Microsoft Foundry Моделе и мулти-агентне системе

#### Верификовано
- ✅ Све лекције укључују потпуне радне кодове (не само исечке)
- ✅ Mermaid дијаграми за визуелно учење (укупно 19 кроз 3 лекције)
- ✅ Практичне вежбе са корацима верификације (укупно 9)
- ✅ Продукцијски спремни Bicep шаблони за деплој преко `azd up`
- ✅ Анализа трошкова и стратегије оптимизације
- ✅ Водичи за решавање проблема и најбоље праксе
- ✅ Контролне тачке знања са командама за верификацију

#### Резултати Оцена Документације
- **docs/pre-deployment/application-insights.md**: - Обухватан водич за мониторинг
- **docs/getting-started/authsecurity.md**: - Професионални безбедносни обрасци
- **docs/pre-deployment/coordination-patterns.md**: - Напредне мулти-агент архитектуре
- **Укупни Нови Садржај**: - Доследни високи стандарди квалитета

#### Техничка Имплементација
- **Application Insights**: Log Analytics + прилагођена телеметрија + дистрибуирано праћење
- **Аутентикација**: Управљани идентитет + Key Vault + RBAC обрасци
- **Мулти-Агент**: Service Bus + Cosmos DB + Container Apps + оркестрација
- **Мониторинг**: Стреаминг метрика у реалном времену + Kusto упити + аларми + контролне табле
- **Управљање Трошковима**: Стратегије узорковања, политике задржавања, контроле буџета

### [v3.7.0] - 2025-11-19

#### Побољшања Квалитета Документације и Нови Пример Microsoft Foundry Модела
**Ова верзија побољшава квалитет документације у целом репозиторијуму и додаје потпуно реализован пример деплоја Microsoft Foundry Модела са gpt-4.1 chat интерфејсом.**

#### Додато
- **🤖 Microsoft Foundry Models Чат Пример**: Потпуно распоређивање gpt-4.1 са радном имплементацијом у `examples/azure-openai-chat/`:
  - Потпуна Microsoft Foundry Models инфраструктура (деплој модела gpt-4.1)
  - Python командна линија чат интерфејс са архивом разговора
  - Интеграција Key Vault-а за безбедно чување API кључева
  - Праћење употребе токена и процена трошкова
  - Ограничење брзине и руковање грешкама
  - Свеобухватан README са упутствима за деплој од 35-45 минута
  - 11 продукцијски спремних датотека (Bicep шаблони, Python апликација, конфигурација)
- **📚 Вежбе за Документацију**: Додате практичне вежбе у водич за конфигурацију:
  - Вежба 1: Мулти-окружна конфигурација (15 минута)
  - Вежба 2: Практична употреба управљања тајнама (10 минута)
  - Јасна критеријуми успеха и кораци верификације
- **✅ Верификација Деплоја**: Додат одељак за верификацију у водич за деплој:
  - Процедуре провере здравља
  - Контролна листа критеријума успеха
  - Очекивани резултати за све команде деплоја
  - Брзи референтни водич за решавање проблема

#### Побољшано
- **examples/README.md**: Ажурirano на A-квалитет (93%):
  - Додат azure-openai-chat у све релевантне секције
  - Ажуриран број локалних примера са 3 на 4
  - Укључено у табелу AI апликационих примера
  - Интегрисано у Quick Start за средњи ниво корисника
  - Додато у одељак Microsoft Foundry Templates
  - Ажурирана матрица поређења и секције за проналажење технологије
- **Квалитет Документације**: Побољшано са B+ (87%) на A- (92%) кроз фасциклу docs:
  - Додати очекивани резултати критичних примера команда
  - Укључени кораци верификације за промене конфигурације
  - Побољшано практично учење са вежбама

#### Промењено
- **Напредовање Учења**: Боља интеграција AI примера за средњи ниво корисника
- **Структура Документације**: Више примењивих вежби са јасним резултатима
- **Процес Верификације**: Јасно дефинисани критеријуми успеха за кључне токове рада

#### Унапређено
- **Искуство Развојних Инжењера**: Деплој Microsoft Foundry Модела сада траје 35-45 минута (уместо 60-90 за сложеније алтернативе)
- **Транспарентност Трошкова**: Јасне процене трошкова (50-200 долара месечно) за пример Microsoft Foundry Модела
- **Пут Учења**: AI програмери имају јасан улаз са azure-openai-chat
- **Стандарди Документације**: Доследни очекивани резултати и кораци верификације

#### Верификовано
- ✅ Пример Microsoft Foundry Модела потпуно функционалан са `azd up`
- ✅ Све 11 датотеке имплементације синтаксно исправне
- ✅ Упутства у README-у одговарају стварном искуству деплоја
- ✅ Линкови у документацији ажурирани на 8+ локација
- ✅ Индекс примера тачно одражава 4 локална примера
- ✅ Ниједан дуплирани спољашњи линк у табелама
- ✅ Све навигацијске референце су исправне

#### Техничка Имплементација
- **Архитектура Microsoft Foundry Модела**: gpt-4.1 + Key Vault + Container Apps образац
- **Безбедност**: Спремно за Managed Identity, тајне у Key Vault
- **Мониторинг**: Интеграција Application Insights
- **Управљање Трошковима**: Праћење и оптимизација употребе токена
- **Деплој**: Једна команда `azd up` за потпуно подешавање

### [v3.6.0] - 2025-11-19

#### Велика Надоградња: Примери Деплоја Container App-а
**Ова верзија уводи свеобухватне, продукцијски спремне примере деплоја контејнерских апликација користећи Azure Developer CLI (AZD), са пуном документацијом и интеграцијом у пут учења.**

#### Додато
- **🚀 Примери Container App-а**: Нови локални примери у `examples/container-app/`:
  - [Мастер водич](examples/container-app/README.md): Потпуни преглед контејнерских деплојмана, брзи почетак, продукција и напредни обрасци
  - [Једноставан Flask API](../../examples/container-app/simple-flask-api): Пријатељски REST API за почетнике са scale-to-zero, health probes, мониторингом и решавањем проблема
  - [Архитектура микросервиса](../../examples/container-app/microservices): Производно спреман мултисервисни деплој (API Gateway, производ, поруџбина, корисник, нотификације), асинхрони поруци, Service Bus, Cosmos DB, Azure SQL, дистрибуирано праћење, blue-green/canary деплој
- **Најбоље праксе**: Безбедност, мониторинг, оптимизација трошкова и смернице за CI/CD за контејнерске радне оптерећења
- **Примери кода**: Потпуни `azure.yaml`, Bicep шаблони и мултијезичне имплементације сервиса (Python, Node.js, C#, Go)
- **Тестирање и решавање проблема**: Енд-то-енд тест сценарији, команде за мониторинг, смернице за решавање проблема

#### Измењено
- **README.md**: Ажурирано да садржи и повезује нове примере контејнер апликација под „Локални примери - контејнер апликације“
- **examples/README.md**: Ажурирано да истакне примере контејнер апликација, додаје уносе у поређењу матрицом и ажурира референце технологије/архитектуре
- **Оквир курса и студијски водич**: Ажурирано да реферише нове примере контејнер апликација и обрасце деплоја у релевантним поглављима

#### Потврђено
- ✅ Сви нови примери могу се деплојовати користећи `azd up` и прате најбоље праксе
- ✅ Крос-линкови и навигација у документацији ажурирани
- ✅ Примери покривају сценарије од почетничких до напредних, укључујући продукционе микросервисе

#### Напомене
- **Обим**: Само енглеска документација и примери
- **Следећи кораци**: Проширење додатним напредним контејнер обрасцима и CI/CD аутоматизацијом у будућим издањима

### [v3.5.0] - 2025-11-19

#### Пребрендирање производа: Microsoft Foundry
**Ова верзија спроводи свеобухватну промену имена производа са „Microsoft Foundry“ у „Microsoft Foundry“ у целокупној енглеској документацији, одражавајући званично пребрендирање Microsoft-а.**

#### Измењено
- **🔄 Ажурирање имена производа**: Потпуно пребрендирање са „Microsoft Foundry“ у „Microsoft Foundry“
  - Ажуриране све референце у енглеској документацији у фасцикли `docs/`
  - Преименована фасцикла: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименован фајл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Укупно: 23 ажуриране референце садржаја у 7 документацијских фајлова

- **📁 Промене у структури фасцикле**:
  - `docs/ai-foundry/` преименована у `docs/microsoft-foundry/`
  - Ажуриране све крос-референце да одражавају нову структуру фасцикле
  - Навигациони линкови проверавани у целокупној документацији

- **📄 Преименовање фајлова**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Сви интерни линкови ажурирани да реферишу на нова имена фајлова

#### Ажурирани фајлови
- **Поглавља документације** (7 фајлова):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ажурирања навигационих линкова
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ажурирања референци имена производа
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Већ користи Microsoft Foundry (са претходних ажурирања)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 референце ажуриране (преглед, повратне информације заједнице, документација)
  - `docs/getting-started/azd-basics.md` - 4 ажурирања крос-линкова
  - `docs/getting-started/first-project.md` - 2 ажурирања навигационих линкова поглавља
  - `docs/getting-started/installation.md` - 2 ажурирања линкова следећег поглавља
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ажуриране референце (навигација, Discord заједница)
  - `docs/troubleshooting/common-issues.md` - 1 ажурирани навигациони линк
  - `docs/troubleshooting/debugging.md` - 1 ажурирани навигациони линк

- **Фајлови структуре курса** (2 фајла):
  - `README.md` - 17 ажурираних референци (преглед курса, наслови поглавља, одељак шаблона, увиди заједнице)
  - `course-outline.md` - 14 ажурираних референци (преглед, циљеви учења, ресурси поглавља)

#### Потврђено
- ✅ Нема преосталих референци "ai-foundry" путања у енглеској документацији
- ✅ Нема преосталих референци имена производа "Microsoft Foundry" у енглеској документацији
- ✅ Сви навигациони линкови функционишу са новом структуром фасцикле
- ✅ Преименовања фајлова и фасцикли успешно завршена
- ✅ Крос-линкови између поглавља потврђени

#### Напомене
- **Обим**: Промене примене само на енглеску документацију у фасцикли `docs/`
- **Преводи**: Фасцикле са преводима (`translations/`) нису ажуриране у овој верзији
- **Радионница**: Материјали радонице (`workshop/`) нису ажурирани у овој верзији
- **Примери**: Пример фајлови могу још да садрже старе називе (биће решено у будућем ажурирању)
- **Спољни линкови**: Спољашњи URL-ови и референце GitHub репозиторијума остају непромењени

#### Водич за миграцију за сараднике
Ако имате локалне гране или документацију која реферише стару структуру:
1. Ажурирајте референце фасцикле: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ажурирајте референце фајлова: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените име производа: "Microsoft Foundry" → "Microsoft Foundry"
4. Потврдите да сви интерни линкови у документацији још увек раде

---

### [v3.4.0] - 2025-10-24

#### Побољшања прегледа и валидације инфраструктуре
**Ова верзија уводи свеобухватну подршку за нову preview функцију Azure Developer CLI и побољшава корисничко искуство радионице.**

#### Додато
- **🧪 azd provision --preview документација функције**: Свеобухватно покривање нове могућности прегледа инфраструктуре
  - Референца команди и примери употребе у cheat sheet-у
  - Детаљна интеграција у водичу за провизију са употребним случајевима и бенефитима
  - Интеграција претходне провере ради безбедније валидације деплоја
  - Ажурирања водича за почетак са праксама деплоја са приоритетом безбедности
- **🚧 Банер статуса радионице**: Професионални HTML банер који указује на статус развоја радионице
  - Градијент дизајн са индикаторима изградње за јасну комуникацију корисника
  - Време последњег ажурирања ради транспарентности
  - Мобилно-одговарајући дизајн за све уређаје

#### Побољшано
- **Безбедност инфраструктуре**: Preview функционалност интегрисана кроз целу документацију деплоја
- **Валидација пре деплоја**: Аутоматизовани скрипти сада укључују тестирање preview инфраструктуре
- **Развојни ток**: Ажуриране секвенце команди да укључују preview као најбољу праксу
- **Корисничко искуство радионице**: Јасна очекивања корисника о статусу развоја садржаја

#### Измењено
- **Најбоље праксе деплоја**: Препоручен приступ са приоритетом preview рада
- **Ток у документацији**: Валидација инфраструктуре померена раније у процес учења
- **Презентација радионице**: Професионална комуникација статуса са јасним временским оквиром развоја

#### Побољшано
- **Приступ са приоритетом безбедности**: Промене инфраструктуре сада могу бити верификоване пре деплоја
- **Тимска сарадња**: Резултати preview могу се делити ради прегледа и одобрења
- **Свесност о трошковима**: Боље разумевање трошкова ресурса пре провизије
- **Митигaција ризика**: Смањење неуспеха деплоја кроз унапред валидацију

#### Техничка имплементација
- **Интеграција више докумената**: Функција прегледа документаована у 4 кључна фајла
- **Обрасци команди**: Конзистентна синтакса и примери кроз целу документацију
- **Интеграција најбољих пракси**: Preview укључен у валидиционе токове и скрипте
- **Визуелни индикатори**: Јасне OZNAKE НОВЕ функције ради лакшег откривања

#### Инфраструктура радионице
- **Комуникација статуса**: Професионални HTML банер са градијентним стилингом
- **Корисничко искуство**: Јасан статус развоја спречава конфузију
- **Професионална презентација**: Одржава кредибилитет репозиторијума док поставља очекивања
- **Транспарентност временске линије**: Октобар 2025 као време последњег ажурирања ради одговорности

### [v3.3.0] - 2025-09-24

#### Побољшани материјали радионице и интерактивно искуство учења
**Ова верзија уводи свеобухватне материјале радионице са интерактивним водичима у прегледачу и структуираним путевима учења.**

#### Додато
- **🎥 Интерактивни водич радионице**: Искусво радионице у прегледачу са подршком MkDocs preview
- **📝 Структуриране инструкције радионице**: 7-степени вођени пут учења од откривања до прилагођавања
  - 0-Увод: Преглед радионице и подешавање
  - 1-Избор-AI-шаблона: Процес открића и одабира шаблона
  - 2-Валидација-AI-шаблона: Процедуре деплоја и верификације
  - 3-Декомпозиција-AI-шаблона: Разумевање архитектуре шаблона
  - 4-Конфигурација-AI-шаблона: Конфигурација и прилагођавање
  - 5-Прилагођавање-AI-шаблона: Напредне измене и итерације
  - 6-Демонтажа-инфраструктуре: Чишћење и управљање ресурсима
  - 7-Завршетак: Резиме и следећи кораци
- **🛠️ Алати радионице**: MkDocs конфигурација са Material темом за побољшано искуство учења
- **🎯 Практични пут учења**: 3-степена методологија (Откривање → Деплој → Прилагођавање)
- **📱 GitHub Codespaces интеграција**: Беспрекоран развојни енвиронмент

#### Побољшано
- **AI лабораторија радионице**: Проширена са свеобухватним структуираним искуством у трајању од 2-3 сата
- **Документација радионице**: Професионална презентација са навигацијом и визуелним помагалима
- **Прогрес учења**: Јасно вођење корак по корак од одабира шаблона до продукционог деплоја
- **Искуство програмера**: Интегрисани алати за поједностављене радне токове развоја

#### Побољшано
- **Приступачност**: Интерфејс у прегледачу са претрагом, функцијом копирања и променом теме
- **Самостално учење**: Флексибилна структура радионице која одговара различитим темпом учења
- **Практична примена**: Са стварним сценаријима деплоја AI шаблона
- **Интеграција заједнице**: Discord интеграција за подршку и сарадњу у радионици

#### Карактеристике радионице
- **Уградња претраге**: Брзо проналажење по кључној речи и лекцији
- **Копирање блокова кода**: Функционалност копирања по навођењу миша над примерима кода
- **Промена теме**: Подршка за тамни/sветли режим према преференцама
- **Визуелни материјали**: Снимци екрана и дијаграми за боље разумевање
- **Интеграција помоћи**: Директан приступ Discord заједници за подршку

### [v3.2.0] - 2025-09-17

#### Главна реструктурирања навигације и систем учења базиран на поглављима
**Ова верзија уводи свеобухватну структуру учења базирану на поглављима са побољшаном навигацијом у целом репозиторијуму.**

#### Додато
- **📚 Систем учења базиран на поглављима**: Потпуна реструктурирање курса у 8 прогресивних поглавља учења
  - Поглавље 1: Основе и брзи почетак (⭐ - 30-45 мин)
  - Поглавље 2: AI-прво развијање (⭐⭐ - 1-2 сата)
  - Поглавље 3: Конфигурација и аутентикација (⭐⭐ - 45-60 мин)
  - Поглавље 4: Инфраструктура као код и деплој (⭐⭐⭐ - 1-1.5 сати)
  - Поглавље 5: Мулти-агент AI решења (⭐⭐⭐⭐ - 2-3 сата)
  - Поглавље 6: Валидација и планирање пре деплоја (⭐⭐ - 1 сат)
  - Поглавље 7: Рјешавање проблема и дебаговање (⭐⭐ - 1-1.5 сати)
  - Поглавље 8: Произвођачки и корпоративни обрасци (⭐⭐⭐⭐ - 2-3 сата)
- **📚 Свеобухватан навигациони систем**: Конзистентни заглавља и подножја навигације у целокупној документацији
- **🎯 Праћење напретка**: Контролна листа завршетка курса и систем валидације учења
- **🗺️ Вођење пута учења**: Јасни улази за различите нивое искуства и циљеве
- **🔗 Крос-линкови навигације**: Повезана поглавља и предуслови јасно повезани

#### Побољшано
- **Структура README**: Трансформисана у структурирану платформу за учење базирану на поглављима
- **Навигација у документацији**: Свака страница сада укључује контекст поглавља и смернице напретка
- **Организација шаблона**: Примери и шаблони мапирани у одговарајућа поглавља учења
- **Интеграција ресурса**: Cheat sheet-ови, FAQ и студијски водичи повезани са релевантним поглављима
- **Интеграција радионице**: Практичне лабораторије мапиране на више циљева учења из поглавља

#### Измењено
- **Прогрес учења**: Померање са линеарне документације ка флексибилном учењу базираном на поглављима
- **Постављање конфигурације**: Премештено водич за конфигурацију као Поглавље 3 за бољи ток учења
- **Интеграција AI садржаја**: Боља интеграција AI-специфичног садржаја кроз цео пут учења
- **Произвођачки садржај**: Напредни обрасци консолидовани у Поглављу 8 за корпоративне ученике

#### Побољшано
- **Корисничко искуство**: Јасне навигационе турачице и индикатори напретка кроз поглавља
- **Приступачност**: Конзистентни навигациони обрасци за лакше пролазак кроз курс
- **Професионална презентација**: Универзитетска структура курса погодна за академску и корпоративну обуку
- **Ефикасност учења**: Смањено време за проналажење релевантног садржаја кроз побољшану организацију

#### Техничка имплементација
- **Заглавља навигације**: Стандардизована навигација поглавља у преко 40 докумената
- **Подножја навигације**: Конзистентно вођење напретка и индикатори завршетка поглавља
- **Крос-линкови**: Свеобухватан систем интерних линкова који повезује релевантне појмове
- **Мапирање поглавља**: Шаблони и примери јасно повезани са циљевима учења

#### Побољшање студијског водича
- **📚 Свеобухватни циљеви учења**: Реструктурирани студијски водич који одговара систему од 8 поглавља
- **🎯 Оцењивање базирано на поглављима**: Свака глава садржи специфичне циљеве учења и практичне вежбе
- **📋 Праћење напретка**: Недељни распоред учења са мерљивим резултатима и контролним листама
- **❓ Питања за оцењивање**: Питања за проверу знања за свако поглавље са професионалним исходима
- **🛠️ Практичне вежбе**: Практичне активности са стварним сценаријима деплоја и решавањем проблема
- **📊 Напредак вештина**: Јасан напредак од основних концепата до корпоративних обрасца са фокусом на развој каријере
- **🎓 Сертификатски оквир**: Систем професионалног развоја и препознавања заједнице
- **⏱️ Управљање временом**: Структуриран десетонедељни план учења са валидацијом кључних милестона

### [v3.1.0] - 2025-09-17

#### Побољшана мулти-агент AI решења
**Ова верзија побољшава мулти-агент решење за малопродају са бољим именима агената и проширеном документацијом.**

#### Измењено
- **Терминологија вишеструких агената**: Замена "Cora агента" са "Корисничким агентом" у читавом решењу за вишеструке агенте у малопродаји ради јаснијег разумевања
- **Архитектура агента**: Ажурирана сва документација, ARM шаблони и примери кода за коришћење доследног назива "Кориснички агент"
- **Примери конфигурације**: Модернизовани обрасци конфигурације агента са ажурираним конвенцијама именовања
- **Доследност документације**: Осигурано да све референце користе професионалне, описне називе агената

#### Побољшано
- **ARM шаблон пакет**: Ажурирање retail-multiagent-arm-template са референцама на Корисничког агента
- **Дијаграми архитектуре**: Освежени Mermaid дијаграми са ажурираним именовањем агената
- **Примери кода**: Python класе и примери имплементације сада користе именовање CustomerAgent
- **Променљиве окружења**: Ажурирани сви скрипти за деплојмент да користе конвенције CUSTOMER_AGENT_NAME

#### Побољшано
- **Искуство програмера**: Јасније улоге и одговорности агената у документацији
- **Спремност за продукцију**: Боље усклађивање са корпоративним конвенцијама именовања
- **Материјали за учење**: Интуитивније именовање агената за образовне сврхе
- **Употребљивост шаблона**: Поједностављено разумевање функција агената и образаца деплојмента

#### Технички детаљи
- Ажурирани Mermaid дијаграми архитектуре са CustomerAgent референцама
- Замена имена класе CoraAgent са CustomerAgent у Python примерима
- Измењене ARM шаблоне JSON конфигурације да користе тип агента "customer"
- Ажуриране променљиве окружења са CORA_AGENT_* на CUSTOMER_AGENT_* образац
- Освежени сви команди за деплојмент и конфигурације контејнера

### [v3.0.0] - 2025-09-12

#### Велике промене - Фокус на AI програмере и интеграција са Microsoft Foundry
**Ова верзија претвара репозиторијум у свеобухватан ресурс за учење фокусиран на AI са интеграцијом Microsoft Foundry.**

#### Додато
- **🤖 AI-први пут учења**: Потпуна реструктурираност са приоритетом на AI програмере и инжењере
- **Водич за интеграцију Microsoft Foundry**: Опсежна документација за повезивање AZD са Microsoft Foundry услугама
- **Обрасци за деплоирање AI модела**: Детаљан водич о избору модела, конфигурацији и стратегијама продукционог деплоирања
- **AI радионица лабораторија**: 2-3 сата практичне радионице за конвертовање AI апликација у AZD-расположива решења
- **Препоруке за продукционе AI праксе**: Обрасци спремни за предузећа за скалирање, надгледање и обезбеђење AI радних оптерећења
- **Водич за решавање AI проблема**: Опсежно решавање проблема за Microsoft Foundry моделе, Cognitive Services и AI деплои питања
- **Галерија AI шаблона**: Изабрани скуп Microsoft Foundry шаблона са оценом сложености
- **Материјали за радионицу**: Потпуна структура радионице са практичним лабораторијама и референтним материјалима

#### Побољшано
- **Структура README-а**: Фокусирана на AI програмере са 45% података о интересовању заједнице са Microsoft Foundry Discord
- **Путеви учења**: Посвећено AI програмерском путовању поред традиционалних за студенте и DevOps инжењере
- **Препоруке шаблона**: Представљени AI шаблони укључују azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграција заједнице**: Побољшана подршка за Discord заједницу са AI-специфичним каналима и дискусијама

#### Безбедност и фокус на продукцију
- **Обрасци Managed Identity**: AI-специфичне конфигурације аутентификације и безбедности
- **Оптимизација трошкова**: Праћење коришћења токена и контроле буџета за AI радне оптерећења
- **Деплои више региона**: Стратегије за глобално деплојовање AI апликација
- **Надгледање перформанси**: AI-специфични метрици и интеграција са Application Insights

#### Квалитет документације
- **Линеарна структура курса**: Логички напредак од почетника до напредних AI образаца деплоирања
- **Валидација URL-ова**: Сви спољашњи линкови према репозиторијуму потврђени и доступни
- **Комплетне референце**: Сви интерни линкови у документацији потврђени и функционални
- **Спремно за продукцију**: Обрасци деплоирања предузећа са примерима из стварног света

### [v2.0.0] - 2025-09-09

#### Велике промене - Реструктурирање репозиторијума и професионално унапређење
**Ова верзија представља значајан преображај структуре репозиторијума и презентације садржаја.**

#### Додато
- **Структурирани оквир учења**: Све странице документације сада укључују увод, циљеве учења и исходе учења
- **Систем навигације**: Додати линкови Претходна/Следећа лекција кроз целу документацију за вођено напредовање у учењу
- **Водич за учење**: Опсежан study-guide.md са циљевима учења, вежбама и материјалима за процену
- **Професионална презентација**: Уклоњене све емотикон иконе ради побољшане приступачности и професионалног изгледа
- **Побољшана структура садржаја**: Унапређена организација и проток материјала за учење

#### Промене
- **Формат документације**: Стандардизован сва документа са доследном структуром фокусираном на учење
- **Проток навигације**: Примена логичног напредовања кроз све материјале за учење
- **Презентација садржаја**: Уклоњени декоративни елементи у корист јасног, професионалног форматирања
- **Структура линкова**: Ажурирани сви интерни линкови за подршку новом систему навигације

#### Побољшано
- **Приступачност**: Уклоњене зависности од емотикона за бољу компатибилност са читачима екрана
- **Професионални изглед**: Чиста, академски стил презентације погодан за корпоративно учење
- **Искуство учења**: Структурисан приступ са јасним циљевима и резултатима за сваку лекцију
- **Организација садржаја**: Бољи логички проток и веза између повезаних тема

### [v1.0.0] - 2025-09-09

#### Почетно издање - Комплетан AZD репозиторијум за учење

#### Додато
- **Основна структура документације**
  - Потпуна серија водича за почетак рада
  - Опсежна документација о деплоирању и провизији
  - Детаљни ресурси за решавање проблема и водичи за дебаговање
  - Алати и процедуре за валидацију пре деплоирања

- **Модул за почетак рада**
  - Основи AZD: Основни концепти и терминологија
  - Водич за инсталацију: Упутства специфична за платформу
  - Водич за конфигурацију: Подешавање окружења и аутентификација
  - Туторијал првог пројекта: Практично учење корак по корак

- **Модул за деплојмент и провизију**
  - Водич за деплоирање: Потпуна документација радног тока
  - Водич за провизију: Infrastructure as Code са Bicep-ом
  - Најбоље праксе за продукционе деплоје
  - Обрасци архитектуре за више услуга

- **Модул за валидацију пре деплоирања**
  - Планирање капацитета: Валидација доступности Azure ресурса
  - Избор SKU-ова: Опсежне смернице за нивое услуга
  - Пре-флајт провере: Аутоматизовани скрипти за валидацију (PowerShell и Bash)
  - Процењивање трошкова и алати за буџетирање

- **Модул за решавање проблема**
  - Чести проблеми: Често срећани проблеми и решења
  - Водич за дебаговање: Систематске методологије за решавање проблема
  - Напредне дијагностичке технике и алати
  - Надгледање перформанси и оптимизација

- **Ресурси и референце**
  - Листа основних команди: Брз референтни приручник за суштинске команде
  - Глосар: Опсежне дефиниције терминологије и скраћеница
  - Често постављана питања: Детаљни одговори на уобичајена питања
  - Линкови ка спољним ресурсима и везе са заједницом

- **Примери и шаблони**
  - Пример једноставне веб апликације
  - Шаблон за деплои статичког вебсајта
  - Конфигурација апликације у контејнеру
  - Обрасци интеграције базе података
  - Примери микросервисне архитектуре
  - Имплементације безсерверских функција

#### Карактеристике
- **Подршка више платформи**: Водичи за инсталацију и конфигурацију за Windows, macOS и Linux
- **Вишеструки нивои вештина**: Садржај намењен студентима до професионалних програмера
- **Практичан фокус**: Практични примери и сценарији из стварног света
- **Обухватна покривеност**: Од основних концепата до напредних корпоративних образаца
- **Приступачност са фокусом на безбедност**: Најбоље безбедносне праксе интегрисане целокупно
- **Оптимизација трошкова**: Упутства за економично деплоирање и управљање ресурсима

#### Квалитет документације
- **Детаљни примери кода**: Практични, испробани узорци кода
- **Упутства корак по корак**: Јасна, извршна упутства
- **Опсежно руковање грешкама**: Решавање проблема за уобичајене проблеме
- **Интеграција најбољих пракси**: Индустријски стандарди и препоруке
- **Компатибилност верзија**: Усађено са најновијим Azure услугама и azd карактеристикама

## Планирана будућа унапређења

### Верзија 3.1.0 (Планирано)
#### Проширење AI платформе
- **Подршка вишеструким моделима**: Обрасци интеграције за Hugging Face, Azure Machine Learning и прилагођене моделе
- **AI оквири за агенте**: Шаблони за LangChain, Semantic Kernel и AutoGen деплоје
- **Напредни RAG обрасци**: Векторске базе података осим Azure AI Search (Pinecone, Weaviate, и др.)
- **AI посматрање**: Побољшано праћење перформанси модела, коришћења токена и квалитета одговора

#### Искуство програмера
- **VS Code проширење**: Интегрисано AZD + Microsoft Foundry искуство развоја
- **GitHub Copilot интеграција**: AI-подржано генерисање AZD шаблона
- **Интерактивни туторијали**: Практичне вежбе кодирања са аутоматизованом провером за AI сценарије
- **Видео садржај**: Допунски видео туторијали за визуелне ученике фокусиране на AI деплоирања

### Верзија 4.0.0 (Планирано)
#### Корпоративни AI обрасци
- **Оквир управљања**: Управљање AI моделима, усаглашеност и ревизорски трагови
- **Вишекориснички AI**: Обрасци за услуживање више корисника са изолованим AI услугама
- **Деплоји AI на ивици**: Интеграција са Azure IoT Edge и инстанцама контејнера
- **Хибридни облак AI**: Обрасци мултиоблака и хибридног деплоја за AI радна оптерећења

#### Напредне функције
- **Аутоматизација AI цевовода**: MLOps интеграција са Azure Machine Learning цевоводима
- **Напредна безбедност**: Обрасци нултог поверења, приватне тачке и напредна заштита од претњи
- **Оптимизација перформанси**: Напредне стратегије подешавања и скалирања за AI апликације високог пропусног опсега
- **Глобална дистрибуција**: Обрасци испоруке садржаја и кеширања на ивици за AI апликације

### Верзија 3.0.0 (Планирано) - Замена тренутног издања
#### Предложена додавања - Сада имплементирана у v3.0.0
- ✅ **AI-фокусирани садржај**: Свеобухватна интеграција Microsoft Foundry (Завршено)
- ✅ **Интерактивни туторијали**: Практична AI радионица (Завршено)
- ✅ **Модул напредне безбедности**: AI-специфични безбедносни обрасци (Завршено)
- ✅ **Оптимизација перформанси**: Стратегије подешавања AI радног оптерећења (Завршено)

### Верзија 2.1.0 (Планирано) - Делимично имплементирана у v3.0.0
#### Мања унапређења - Нека завршена у тренутном издању
- ✅ **Додатни примери**: AI-фокусирани сценарији деплоја (Завршено)
- ✅ **Проширено ЧПП**: AI-специфична питања и решавање проблема (Завршено)
- **Интеграција алата**: Побољшани водичи за IDE и уређиваче
- ✅ **Проширење надгледања**: AI-специфични обрасци надгледања и алармирања (Завршено)

#### Још увек планирано за будуће издање
- **Документација прилагођена мобилним уређајима**: Респонсивни дизајн за мобилно учење
- **Оффлине приступ**: Пакети документације за преузимање
- **Побољшана интеграција IDE**: VS Code проширење за AZD + AI радне токове
- **Контролна табла заједнице**: Метрике заједнице у реалном времену и праћење доприноса

## Допринос дневнику промена

### Пријављивање промена
При доприносу овом репозиторијуму, молимо обезбедите да уноси у дневник промена укључују:

1. **Број верзије**: Према семантичком верзионисању (главна.мала.поправка)
2. **Датум**: Датум издања или ажурирања у формату ГГГГ-ММ-ДД
3. **Категорија**: Додато, Промењено, Повучено, Уклоњено, Поправљено, Безбедност
4. **Јасан опис**: Концизан опис шта је промењено
5. **Процена утицаја**: Како промене утичу на постојеће кориснике

### Категорије промена

#### Додато
- Неве карактеристике, одељци документације или могућности
- Нови примери, шаблони или ресурси за учење
- Додатни алати, скрипте или помоћни програми

#### Промењено
- Измене у постојећој функционалности или документацији
- Ажурирања ради побољшања јасноће или тачности
- Реструктурирање садржаја или организације

#### Повучено
- Карактеристике или приступи који се избацују
- Одељци документације планирани за уклањање
- Методи који имају боље алтернативе

#### Уклоњено
- Карактеристике, документација или примери који више нису релевантни
- Застареле информације или повучени приступи
- Вишкова садржаја или консолидован садржај

#### Поправљено
- Исправке грешака у документацији или коду
- Решавање пријављених проблема или грешака
- Побољшања у тачности или функционалности

#### Безбедност
- Побољшања или исправке везане за безбедност
- Ажурирања најбољих безбедносних пракси
- Решавање безбедносних рањивости

### Водич за семантичко верзионисање

#### Главна верзија (X.0.0)
- Прекомпоновања која захтевају акцију корисника
- Значајна реструктурирања садржаја или организације
- Промене које мењају основни приступ или методологију

#### Мања верзија (X.Y.0)
- Додавање нових функција или садржаја
- Унапређења која одржавају уназадну компатибилност
- Додатни примери, алати или ресурси

#### Поправка (X.Y.Z)
- Поправке грешака и исправке
- Мања унапредјења постојећег садржаја
- Разјашњења и мале корекције

## Повратне информације и предлози заједнице

Активно подстичемо повратне информације заједнице ради унапређења овог ресурса за учење:

### Како дати повратне информације
- **GitHub Issues**: Пријављивање проблема или предлози за унапређења (AI-специфични проблеми су добродошли)
- **Discord дискусије**: Делите идеје и укључите се у Microsoft Foundry заједницу
- **Pull захтеви**: Директан допринос унапређењима садржаја, посебно AI шаблонима и водичима
- **Microsoft Foundry Discord**: Учествујте у #Azure каналу за AZD + AI дискусије
- **Форуми за заједницу**: Учествујте у ширим Azure developer дискусијама

### Категорије повратних информација
- **Тачност AI садржаја**: Исправке о интеграцији AI услуга и информацијама о деплоју
- **Искуство учења**: Предлози за унапређење AI програма учења
- **Немајући AI садржај**: Захтеви за додатним AI шаблонима, образцима или примерима
- **Приступачност**: Побољшања за различите потребе учења
- **Интеграција AI алата**: Предлози за бољу интеграцију AI развојних радних токова
- **Продукциони AI обрасци**: Захтеви за обрасцима корпоративног AI деплоирања

### Обавеза одговора
- **Одговор на проблеме**: У року од 48 сати за пријављене проблеме
- **Захтеви за функције**: Процена у року од једне недеље
- **Доприноди заједнице**: Преглед у року од једне недеље
- **Безбедносни проблеми**: Одмах са приоритетом и убрзаним одговором

## Распоред одржавања

### Редовна ажурирања
- **Месечни прегледи**: Тачност садржаја и валидација линкова
- **Квартална ажурирања**: Велика проширења и побољшања садржаја
- **Полугодишњи прегледи**: Опсежно реструктурирање и унапређења
- **Годишња издања**: Главна ажурирања верзија са значајним унапређењима

### Надгледање и контрола квалитета
- **Аутоматизовано тестирање**: Редовна провера примера кода и линкова
- **Интеграција повратних информација заједнице**: Редовно укључивање предлога корисника
- **Ажурирања технологије**: Усклађивање са најновијим Azure услугама и izdanjima azd алата
- **Аудити приступачности**: Редовни прегледи за принципе инклузивног дизајна

## Политика подршке верзија

### Подршка за тренутну верзију
- **најновија главна верзија**: Потпуна подршка са редовним ажурирањима
- **претходна главна верзија**: Безбедносна ажурирања и критичне исправке у трајању од 12 месеци
- **наследне верзије**: Само подршка заједнице, без званичних ажурирања

### Упутства за миграцију
Када се објаве главне верзије, пружамо:
- **Водиче за миграцију**: Упутства корак по корак за прелазак
- **Напомене о компатибилности**: Детаљи о кључним променама
- **Подршка алатима**: Скрипте или алати који помажу миграцију
- **Подршка заједнице**: Посебни форуми за питања у вези миграције

---

**Навигација**
- **Претходна лекција**: [Студијски водич](resources/study-guide.md)
- **Следећа лекција**: Повратак на [Главни README](README.md)

**Будите у току**: Пратите овај репозиторијум за обавештења о новим издањима и важним ажурирањима материјала за учење.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->