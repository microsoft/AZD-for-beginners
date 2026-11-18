# Дневник измена - AZD За Почетнике

## Увод

Овај дневник измена докуметује све значајне промене, ажурирања и унапређења у AZD За Почетнике репозиторијуму. Пратиоци смо принципе семантичког верзионисања и одржавамо овај дневник како бисмо помогли корисницима да разумеју шта се променило између верзија.

## Циљеви учења

Прегледом овог дневника измена, ви ћете:
- Останите информисани о новим функцијама и додацима садржаја
- Разумети побољшања направљена у постојећој документацији
- Праћење исправки грешака и корекција ради обезбеђивања прецизности
- Пратити еволуцију материјала за учење током времена

## Резултати учења

Након прегледа уноса у дневнику измена, моћи ћете да:
- Идентификујете нови садржај и ресурсе доступне за учење
- Разумете које су секције ажуриране или побољшане
- Планирате свој пут учења на основу најсавременијих материјала
- Присуствујете са повратним информацијама и предлозима за будућа унапређења

## Историја верзија

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry екстензија 1.0 је сада опште доступна

Пакет `microsoft.foundry` 1.0 је **активан и опште доступан**, како је објављено 5. новембра 2026. године [н ovember 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Курс сада учи објављени GA радни ток, а не предстојеће издање. Почните са AZD **1.37.0 или новијим** и `azd ext install microsoft.foundry`.

#### Доступно у овом ажурирању курса
- Енглески водич користи GA пакет као подразумевани пут инсталације и објашњава његових седам независно верзионисаних основних екстензија.
- [hosted-agent walkthrough](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) покрива основни Python Agent Framework Responses API пример, тренутну uv, Python 3.13+, нови/постојећи избор пројекта, поновну употребу модела и преглед `azure.yaml`.
- Работни ток локално-до-облака покрива тестирање Agent Inspector-а, трошкове позива модела подржаних од стране Azure-а, удаљена компилација кода, објављени позив, праћење у облаку, преглед распоређивања, записе и дијагностику.
- Посебан водич за евалуацију покрива генерисање и преглед скупова података/рубрика, конфигурисање именоване евалуације, регистровање добара и преглед резултата. Старије инструкције за евалуацију/оптимизацију остају као историја миграције, не као текућа основа издања.
- Foundry CI/CD водич укључује инсталацију проширења тркача, аутентификовано објављивање, добара и приступ евалуацији, као и експлицитну контролу квалитета.
- Водич за чишћење разликује новокреиране и поново коришћене Foundry пројекте. Радна радионица повезује се са посебном GA вежбом без замене специфичних тестова из примера.
- Навигација по курсу, циљеви учења, предуслови за подешавање, шпаргалицу, често постављана питања и водич за учење одражавају GA радни ток. Генерисани преводи нису ручно уређивани.

#### Опсег прегледа
- Засновано на GA објави, повезаним Microsoft Learn водичима и основној конфигурацији примера. Није извршено никакво активно Azure провајдерство, распоређивање, позив модела или евалуација.
- GA пакета не имплицира GA за сваки опционални фичер, независно проширење или SDK, нити сертификује примере за производњу.

### [v3.24.0]- 2026-11-04

#### Поправљено
- Исправљена навигација енглеског курса, путеви премештених страница, недостајући сидра и застареле спољашње референце, укључујући линк из Поглавља 2 ка водичу за производни AI.
- Ревидирани текући водич у односу на објављене верзије AZD 1.37.2, агената 1.0.0-beta.23 и евалуација 1.0.0-beta.2. Документован засебни `azd ai eval` радни ток и миграција конфигурације оптимизације.
- Исправљене не подржане CLI заставице, аутентификациони граници, упутства за plain текст окружење/тајне, инфраструктурна ажурирања, конфигурација модела и примери деструктивног опоравка.
- Освежена радионица према тренутном AI Agents примеру, укључујући стварне хукове, конфигурационе улазе, тестове евалуације, црвене тимске улазне тачке и опсервабиљити.
- Исправљене тврдње примера имплементације и поправљене повезане проблеме апликације/инфраструктуре/конфигурације. Материјали о архитектури продаје су експлицитно разликовани од комплетне радне апликације.
- Враћена CodeQL језичка матрица, изабран подржани Node.js 24 за развојни контејнер, а валидатори подешавања пријављују неуспеле верзије наредби.

#### Додато
- Енглески само офлајн проверивач линкова/сидра, регресиони тестови и радни ток документације који такође гради радионицу у строгом режиму. Изузети су генерисани преводи и преведене слике.

#### Опсег валидације
- Провере извора, синтаксе, конфигурације, локалног понашања и мрежних веза не успостављају живу могућност распореда у Azure-у, квоту, RBAC, регионалну доступност модела, наплату, усаглашеност са безбедношћу нити спремност за производњу.
- Старији уноси испод су историјски записи, не актуелна упутства за команду или издање.

### [v3.23.0] - 2026-07-13

#### Оживљавање AZD 1.27.1: Ажурирање верзије
**Ова верзија поново валида курс према `azd` `1.27.1` (јул 2026, најновије стабилно издање) и тренутну preview AI agent екстензију `azure.ai.agents` `1.0.0-beta.5`, доводећи све банере „валидација против“ до датума након издања 1.26.0, 1.27.0 и 1.27.1.**

#### Промењено
- **✅ Ажурирана база валидације** са `azd 1.25.6` (јун 2026) на `azd 1.27.1` (јул 2026) кроз главни README, све README-ове поглавља, лекцију о развојном контејнеру Поглавља 1 (укључујући примере са закључаним верзијама), лекцију о прилагођеним шаблонима Поглавља 4, лекцију о мулти-агентима Поглавља 5 и документацију радионице
- **🤖 Освежена база Поглавља 2** са `azd 1.23.12` (март 2026) на `azd 1.27.1` кроз `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; датуми напомена о валидацији ажурирани на 2026-07-13
- **🧩 Повећана верзија AI agent екстензије** са `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` на тренутно `1.0.0-beta.5` издање у README Поглавља 2 и `agents.md`
- **🧪 Ажурирани пример валидације радионице** (`azd version` излаз) на `1.27.1`

#### Напомене о релевантним азд издањима (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Подршка за Go за Azure Functions на Flex Consumption, `azd config sub-filter` филтери претплата по закупцу, самостални пакети проширења (`azd x pack --bundle`), и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделирање Azure AI Foundry пројеката/агената директно у `azure.yaml` (иницијализација без Bicep-а/Terraform-а), подршка за распоређивање контејнера за App Service (`host: appservice` + `language: docker`), директан `-s/--source` за `azd extension` команде и `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` за `azd extension install`, застареле моделе подразумевано искључене из каталога/упита о квоти, и неколико исправки грешака

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

#### Попуњавање празнина за почетнике #2: Ауторство шаблона, развојни контејнери, Pulumi, Azure DevOps, сервисни принципали и још много тога
**Ова верзија затвара преостале средње празнине идентификоване анализом azd-coverage: како ауторисати и објавити свој шаблон, репродуцибилна развојна/Codespaces окружења, Pulumi провајдер инфраструктуре, водич кроз Azure DevOps CI/CD, аутентификацију сервисног принципала, смернице за избор домаћина (AKS/Spring Apps), објашњења `azd restore`/`azd package`, руковање грешкама хуковa и тимске/заједничке практике окружења.**

#### Додато
- **🧱 Нова лекција у Поглављу 4** `docs/chapter-04-infrastructure/custom-templates.md` — ауторство сопственог azd шаблона: потребна структура (`azure.yaml`, `infra/`, `src/`), `metadata.template` поље, параметризација инфраструктуре са `uniqueString()` ресурсним тагом и `azd-env-name` ознаком, локално тестирање са `azd init --template <local-path>`, објављивање на GitHub и подношење у Awesome AZD галерију
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/dev-containers.md` — репродуцибилна azd окружења са развојним контејнерима и GitHub Codespaces: минимални `.devcontainer/devcontainer.json` коришћењем званичне `ghcr.io/azure/azure-dev/azd` функције, језички специфичне функције, `docker-in-docker` за хостове контејнера и `azd auth login --use-device-code` за удаљено пријављивање
- **🧩 Pulumi са azd** секција у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, распоред фасцикли Pulumi, стaкови мапирани на azd окружења, потребни излази/таговање и идентичан `azd up` / `azd down` радни ток
- **🎯 Смернице за избор домаћина** у `docs/chapter-04-infrastructure/provisioning.md` — упоредни преглед пријатељски према почетницима о `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp`, са смерницама када одабрати AKS или Azure Spring Apps
- **🛠️ Azure DevOps CI/CD водич** у `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, сервисна веза са федерацијом идентитета оптерећења (OIDC), генерисани `azure-dev.yml` и подешавање варијабилних група
- **🔑 Сервисни принципали (Образац 4)** додато у `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивна `azd auth login` са тајном клијента у односу на федеративне/OIDC акредитиве, када користити и безбедно чување акредитива
- **🪝 Руководство за руковање грешкама хуковa** удео у `docs/chapter-04-infrastructure/deployment-guide.md` — излазни кодови и `set -e`, `continueOnError`, тестирање хукова у изолацији са `azd hooks run`, ОС специфични шелл-ови и `--debug`
- **👥 Тимска / заједничка окружења** секција у `docs/chapter-03-configuration/configuration.md` — шта живи у `.azure/`, шта игнорисати у git-у, окружења по програмеру, `azd env list`/`select` и обезбеђивање вредности окружења у CI/CD
- **🧰 `azd restore` и проширена `azd package`** објашњења у `resources/cheat-sheet.md` — враћање зависности и изградња артефакта за распоређивање без распореда

#### Промењено
- **🧭 Табела лекција Поглавља 4** ажурирана да укључи нову лекцију "Ауторство сопственог шаблона" (Лекција 3)
- **🧭 Табела лекција Поглавља 1** ажурирана да укључи нову лекцију "Развојни контејнери и Codespaces" (Лекција 5); навигациони подножја повезана између `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Попуњавање празнина за почетнике: Мулти-агент радионица, "Понеси своју апликацију", Terraform и CI/CD водич
**Ова верзија затвара највеће празнине за комплетан водич за почетнике кроз додавање две нове практичне лекције (припремљена мулти-агент радионица и додавање azd постојећој апликацији), почетнички увод у хукове, Terraform са azd секцију, корак по корак GitHub Actions pipeline водич, објашњење нових preview екстензија и експлицитну листу провера распоређивања.**

#### Додато
- **🤝 Нова лекција Поглавља 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — потпуно практична, распоређива дво-агент радионица (оркестратор + специјалисти) са реалним шаблоном (`contoso-creative-writer`), која покрива када користити мулти-агент, `azd up` радни ток, разумевање распоређених ресурса, пресецање преко агената, прилагођавање и чишћење
- **📦 Нова лекција Поглавља 1** `docs/chapter-01-foundation/bring-your-own-app.md` — како додати azd у постојећи пројекат са `azd init` ("користи код у тренутном директоријуму"), разумевање `azure.yaml` и `infra/`, `azd infra generate`, откривање домаћина и распоређивање са `azd up`
- **🌐 Terraform са azd** додат у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` конфигурација, `.tf` распоред фасцикли, потребни `AZURE_*` излази и `azd-env-name` означавање, и идентичан `azd up` / `azd down` радни ток (затвара празнину где је подршка за Terraform била наведена, али је приказан само Bicep)
- **⚙️ Корак по корак GitHub Actions водич** у `docs/chapter-08-production/production-ai-practices.md` — од GitHub репозиторијума до аутоматизованих деплоија: `azd pipeline config`, OIDC федеративни креденцијали (без чувања тајни), генерисани `azure-dev.yml`, и упутства о тајнама у односу на променљиве
- **🪝 Увод за почетнике "Нисте упознати са hooks?"** у `docs/chapter-04-infrastructure/deployment-guide.md` — шта је hook, табела фаза hook-а, минимални први hook, и ручно извршавање hook-ова са `azd hooks run`
- **✅ Контролни списак "Потврдите ваш деплои"** додат у Корак 5 у `docs/chapter-01-foundation/first-project.md` — smoke тест, проверу health-endpoint, и јасне критеријуме успеха
- **🧩 Објашњење за нове preview екстензије** `azure.ai.skills` и `azure.ai.connections` (шта су и када их користити) у `docs/chapter-08-production/production-ai-practices.md`

#### Измењено
- **🧭 Табела лекција из Поглавља 5** коригована: `multi-agent-basics.md` је сада Лекција 1 (једина потпуно практична лекција), са искреном етикетом да Лекција 2 припада Поглављу 6 и да је Retail сценарио архитектонски план, а не шаблон једне команде
- **🧭 Табела лекција из Поглавља 1** сада укључује нову лекцију "Bring Your Own App" (Лекција 4)
- **🔗 Ноге за навигацију** ажуриране: `first-project.md` сада води напред ка `bring-your-own-app.md`

#### Исправљено
- **🧱 Попуњен "зазидани али недостајући" Terraform јаз** — курс је раније реферисао Terraform подршку а да је није приказао
- **🔀 Исправљене збуњујуће међупоглавне везе из Поглавља 5** које су имплицирале да постоји пуна мулти-агент имплементација када је постојао само архитектонски план

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

#### Освежавање AZD 1.25.6, Комплетне команде за животни циклус агента & Aspire ребрендирање
**Ова верзија поново верификује курс према `azd` `1.25.6` (јун 2026) и `azure.ai.agents` `0.1.40-preview` екстензији, проширује AI упутства од "састави агента" до целог животног циклуса агента (тестирај → процени → оптимизуј → прегледај → избриши), истиче нове `azure.ai.skills` и `azure.ai.connections` preview екстензије, и бележи ".NET Aspire" → "Aspire" ребрендирање производа.**

#### Додато
- **🔁 Комплетно покривање животног циклуса агента** за почетнике и AI инжењере широм документације:
  - `docs/chapter-01-foundation/azd-basics.md` — Табела животног циклуса (састави → тестирај → мериши → побољшај → прегледај → очисти) додато у одељак за екстензије и AI команде
  - `docs/chapter-08-production/production-ai-practices.md` — Нови одељак "Управљање животним циклусом агента" покрива `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, и `delete --force`
  - `resources/cheat-sheet.md` — Проширене AI команде агента са `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, и `delete --force`
- **🧩 Нове preview екстензије** документоване: `azure.ai.skills` (поново употребљиве вештине агента) и `azure.ai.connections` (Фаундри конекције) додате у табелу екстензија и cheat sheet
- **⏱️ Упутства о времену одговора** — примери `azd ai agent invoke` сада бележе укупно кашњење и време до првог бајта
- **📌 Банер верзије** у главном README који усмерава ученике ка `azd version` и `azd upgrade`

#### Промењено
- **✅ Обновљене основе валидације** са `azd 1.23.12` (март 2026) на `azd 1.25.6` (јун 2026) по свим README фајловима поглавља и радионичарској документацији
- **🤖 Обавештење о екстензији у Поглављу 2** обновљено са `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Пример валидације радионице** (излаз `azd version`) ажуриран на `1.25.6`
- **🧭 README "Шта је ново у azd данас"** освежен да истакне комплетан животни циклус агента, нове AI екстензије и недавна побољшања квалитета живота (`azd init` идемпотентност, `azd auth login` чишћење остарелих токена, `azd tool` упит првог покретања)
- **📖 Поглавље 2 agents.md (Опција 4)** сада усмерава ученике на животне команде након деплоија уместо да се зауставља на `azd up`

#### Исправљено
- **🏷️ Именовање производа** — додата напомена о Aspire ребрендирању (".NET Aspire" је сада једноставно "Aspire"); azd подршка за Aspire је непромењена
- **🔎 Валидација уживо издања** потврђена према Azure Developer CLI feed-у: стабилна CLI верзија `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ажурирани фајлови
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

#### Разјашњење за учење почетника, Верификација подешавања и Чишћење финалних AZD команди
**Ова верзија наставља AZD 1.23 валидациони преглед са документационим пролазом усмереним ка почетницима: разјашњава упутства за прву AZD аутентификацију, додаје локалне скрипте за верификацију подешавања, проверава кључне команде са уживо AZD CLI и уклања последње застареле референце команди на енглеском изван changelog-а.**

#### Додато
- **🧪 Скрипте за верификацију подешавања за почетнике** са `validate-setup.ps1` и `validate-setup.sh` да ученици могу да провере потребне алате пре почетка Поглавља 1
- **✅ Почетни кораци верификације подешавања** у главном README и README Поглавља 1 како би се пропусти у претходним корацима открили пре `azd up`

#### Измењено
- **🔐 Упутства за аутентификацију за почетнике** сада конзистентно третирају `azd auth login` као примарни пут у AZD радним токовима, са `az login` означеним као опциони осим ако се Azure CLI команде не користе директно
- **📚 Ток учења у Поглављу 1** сада усмерава ученике да верификују локално подешавање пре инсталације, аутентификације и првих корака деплоија
- **🛠️ Поруке валидатора** сада јасно раздвајају захтеве који блокирају од опционих упозорења Azure CLI-а за AZD-појединачни пут за почетнике
- **📖 Конфигурацијска, решавање проблема и пример документација** сада разликују потребну AZD аутентификацију од опционог Azure CLI пријављивања где је претходно приказивано без контекста

#### Исправљено
- **📋 Преостале референце команди на енглеском извору** ажуриране на тренутне AZD облике, укључујући `azd config show` у cheat sheet-у и `azd monitor --overview` где је намењено Azure Portal прегледно упутство
- **🧭 Тврђења почетника у Поглављу 1** ублажавају се како би се избегло прекомерно обећавање гарантованог понашања без грешке или повлачења за све шаблоне и Azure ресурсе
- **🔎 Валидација уживо CLI** потврђује тренутну подршку за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, и `azd down --force --purge`

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

#### AZD 1.23.12 валидација, проширење радионичарског окружења и освежавање AI модела
**Ова верзија изводи валидациони преглед документације према `azd` `1.23.12`, ажурира застареле AZD примере команди, освежава AI упутства до тренутних подразумеваних вредности, и проширује упутства радионице преко GitHub Codespaces-а да укључују дев кантейнере и локалне клониране копије.**

#### Додато
- **✅ Ноте валидације кроз основна поглавља и радионичарску документацију** да се тестирана AZD база учесницима јасно представи без обзира на новије или старије CLI верзије
- **⏱️ Упутства за временско ограничење деплоија** за дуготрајне AI апликације користећи `azd deploy --timeout 1800`
- **🔎 Степени инспекције екстензије** са `azd extension show azure.ai.agents` у AI радним токовима
- **🌐 Проширена упутства за радионичарско окружење** која покривају GitHub Codespaces, дев кантейнере и локалне клониране копије са MkDocs

#### Промењено
- **📚 Уводне README датотеке поглавља** сада конзистентно наводе валидацију према `azd 1.23.12` у основним, конфигурацијским, инфраструктурним, мулти-агентским, претходним деплоијем, решавању проблема и продуктивним секцијама
- **🛠️ АЖуриране референце AZD команди** на тренутне облике у документацији:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` у зависности од контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` где је намењен преглед Application Insights-a
- **🧪 Поједностављени preview примери провизије** као што су `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Ажуриран ток радионице** тако да учесници могу да заврше лабораторије у Codespaces-у, дев кантейнеру, или локалној клонираној копији уместо да рачунају само на Codespaces
- **🔐 Упутства за аутентификацију** сада првенствено препоручују `azd auth login` за AZD радне токове, са `az login` као опционом када се Azure CLI команде користе директно

#### Исправљено
- **🪟 Windows инсталационе команде** нормализоване према тренутном облику пакета `winget` у упутству за инсталацију
- **🐧 Linux упутства за инсталацију** исправљена да избегну неподржане дистро-специфичне упуте за `azd` package manager и умјесто тога усмеравају на издање доступних ресурса где је одговарајуће
- **📦 AI примери модела** освежени са старијих подразумеваних вредности као што су `gpt-35-turbo` и `text-embedding-ada-002` на тренутне примере као што су `gpt-4.1-mini`, `gpt-4.1`, и `text-embedding-3-large`
- **📋 Снипети за деплои и дијагностику** исправљени да користе тренутне команде за окружење и статус у логовима, скриптама и корацима за решавање проблема
- **⚙️ GitHub Actions упутства** ажурирана са `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Упутства за сагласност MCP/Copilot** ажурирана са `azd mcp consent` на `azd copilot consent list`

#### Побољшано
- **🧠 AI упутства у поглављу** сада боље објашњавају preview-сензитивно `azd ai` понашање, пријављивање специфично за тенант, тренутну употребу екстензија и ажуриране препоруке за распоређивање модела
- **🧪 Упутства за радионицу** сада користе реалније примере верзија и јаснији језик за подешавање окружења за практичне лабораторије
- **📈 Продуктивна и документација за решавање проблема** сада боље усклађује са тренутним примерима мониторинга, fallback модела и трошковних нивоа

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
**Ова верзија додаје покривеност команди `azd ai`, `azd extension` и `azd mcp` у свим одељцима везаним за вештачку интелигенцију, исправља покварене линкове и застарели код у agents.md, ажурира тајни лист и уређује одељак Примери Шаблона са провереним описима и новим образцима Azure AI AZD.**

#### Додато
- **🤖 Покривеност AZD AI CLI** у 7 фајлова (претходно само у Поглављу 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нова секција "Проширења и AI команде" која уводи `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опција 4: `azd ai agent init` са упоредном табелом (шаблон против приступа манифестом)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подсекције "AZD проширења за Foundry" и "Прво распоређивање агента"
  - `docs/chapter-05-multi-agent/README.md` — Брзи почетак сада показује и путеве распоредања засноване на шаблону и манифесту
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секција распоредања сада укључује опцију `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подсекција "AZD AI командe за дијагностику"
  - `resources/cheat-sheet.md` — Нова секција "AI & проширења команди" са `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Нови AZD AI пример шаблони** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG ћаскање са Blazor WebAssembly, Semantic Kernel и подршком за гласовни разговор
  - **azure-search-openai-demo-java** — Java RAG ћаскање користећи Langchain4J са ACA/AKS опцијама распоредања
  - **contoso-creative-writer** — Мулти-агент апликација за креативно писање користећи Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Serverless RAG користећи Azure Functions + LangChain.js + Cosmos DB са Ollama подршком за локални развој
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG акцелератор са админ портал, Teams интеграцијом и опцијама PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Мулти-агент MCP оркестрација референтне апликације са серверима у .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимални Bicep почетни шаблон за Azure AI инфраструктуру
  - **🔗 Линк ка феноменалној AZD AI галерији** — Референца на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблона)

#### Исправљено
- **🔗 навигација у agents.md**: Линкови Пре/Следећи сада одговарају редоследу лекција у Поглављу 2 README-у (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 покварени линкови у agents.md**: `production-ai-practices.md` исправљено у `../chapter-08-production/production-ai-practices.md` (3 појаве)
- **📦 застарели код у agents.md**: Замена `opencensus` са `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 неважећи API у agents.md**: Померање `max_tokens` из `create_agent()` у `create_run()` као `max_completion_tokens`
- **🔢 бројање токена у agents.md**: Замена грубе процене `len//4` са `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправка сервиса са "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (подразумевани хост промењен Октобар 2024)
- **contoso-chat**: Ажуриран опис са референцом на Azure AI Foundry + Prompty, у складу са стварним насловом и технолошким скупом репозиторијума

#### Уклоњено
- **ai-document-processing**: Уклоњена непрактична референца шаблона (репо није јавно доступан као AZD шаблон)

#### Побољшано
- **📝 вежбе у agents.md**: Вежба 1 сада приказује очекивани излаз и корак `azd monitor`; Вежба 2 укључује цео код регистрације `FunctionTool`; Вежба 3 замењује нејасна упутства конкретним `prepdocs.py` командама
- **📚 ресурси у agents.md**: Ажурирани линкови ка актуелној документацији Azure AI Agent Service и брзом почетку
- **📋 табела Следећи кораци у agents.md**: Додат линк ка AI Workshop Lab за потпуну покривеност поглавља

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
**Ова верзија побољшава навигацију кроз поглавља у README.md помоћу побољшане табеле.**

#### Измењено
- **Табела мапе курса**: Побољшана са директним линковима ка лекцијама, проценом трајања и оценама сложености
- **Чишћење фасцикли**: Уклоњене редундантне старе фасцикле (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Валидација линкова**: Проверено свих 21+ интерних линкова у табели мапе курса

### [v3.16.0] - 2026-02-05

#### Ажурирања назива производа
**Ова верзија ажурира референце производа у складу са актуелним Microsoft брендингом.**

#### Измењено
- **Microsoft Foundry → Microsoft Foundry**: Све референце ажуриране у неприлагођеним фајловима
- **Azure AI Agent Service → Foundry Agents**: Назив сервиса ажуриран да одражава актуелни брендинг

#### Ажурирани фајлови
- `README.md` - Главна страница курса
- `changelog.md` - Историја верзија
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Водич за AI агенте
- `examples/README.md` - Документација примера
- `workshop/README.md` - Страница радионице
- `workshop/docs/index.md` - Индекс радионице
- `workshop/docs/instructions/*.md` - Сви фајлови за упутства радионице

---

### [v3.15.0] - 2026-02-05

#### Главна реструктурирања репозиторијума: Имена фасцикли по поглављима
**Ова верзија реструктурира документацију у посебне фасцикле по поглављима ради јасније навигације.**

#### Поништавање имена фасцикли
Старе фасцикле су замењене фасциклама са бројевима поглавља:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додато ново: `docs/chapter-05-multi-agent/`

#### Миграција фајлова
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
| Сви фајлови предраспоређивања | pre-deployment/ | chapter-06-pre-deployment/ |
| Сви фајлови решавања проблема | troubleshooting/ | chapter-07-troubleshooting/ |

#### Додато
- **📚 README фајлови у поглављима**: Креирани README.md у свакој фасцикли поглавља са:
  - Циљевима учења и трајањем
  - Табелом лекција са описима
  - Командама за брзи почетак
  - Навигацијом ка другим поглављима

#### Измењено
- **🔗 Ажурирани сви интерни линкови**: 78+ пута ажуриране путање широм свих документационих фајлова
- **🗺️ Главни README.md**: Ажурирана мапа курса са новом структуром поглавља
- **📝 examples/README.md**: Ажуриране референце ка фасциклама поглавља

#### Уклоњено
- Стари систем фасцикли (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктурирање репозиторијума: Навигација по поглављима
**Ова верзија додала је README фајлове за навигацију по поглављима (замењено верзијом v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Нови Водич за AI агенте
**Ова верзија додаје свеобухватан водич за распоређивање AI агената са Azure Developer CLI.**

#### Додато
- **🤖 docs/microsoft-foundry/agents.md**: Потпуни водич који покрива:
  - Шта су AI агенти и како се разликују од чатботова
  - Три шаблона за брзи почетак агената (Foundry Agents, Prompty, RAG)
  - Обрасци архитектуре агената (један агент, RAG, мулти-агент)
  - Конфигурација и прилагођавање алата
  - Надгледање и праћење метрика
  - Трошковне процене и оптимизација
  - Чести сценарији решавања проблема
  - Три практичне вежбе са критеријумима успеха

#### Структура садржаја
- **Увод**: Концепти агената за почетнике
- **Брзи почетак**: Распоређивање агената са `azd init --template get-started-with-ai-agents`
- **Обрасци архитектуре**: Визуелне дијаграме образаца агената
- **Конфигурација**: Постављање алата и променљиве окружења
- **Надгледање**: Интеграција са Application Insights
- **Вежбе**: Прогресивно практично учење (20-45 минута свака)

---

### [v3.12.0] - 2026-02-05

#### Ажурирање развојног контејнера
**Ова верзија ажурира конфигурацију развојног контејнера са савременим алатима и бољим подразумеваним подешавањима за AZD искуство учења.**

#### Измењено
- **🐳 Основна слика**: Ажурирана са `python:3.12-bullseye` на `python:3.12-bookworm` (најновији Debian стабилни)
- **📛 Име контејнера**: Преименован са "Python 3" у "AZD for Beginners" за јасноћу

#### Додато
- **🔧 Нове функције развојног контејнера**:
  - `azure-cli` са омогућеном подршком за Bicep
  - `node:20` (LTS верзија за AZD шаблоне)
  - `github-cli` за управљање шаблонима
  - `docker-in-docker` за развој деплоја преко контејнерских апликација

- **🔌 Пренос портова**: Претходно конфигурисани портови за уобичајени развој:
  - 8000 (преглед MkDocs)
  - 3000 (Веб апликације)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Нови VS Code екстензије**:
  - `ms-python.vscode-pylance` - Побољшани Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Подршка за Azure Functions
  - `ms-azuretools.vscode-docker` - Подршка за Docker
  - `ms-azuretools.vscode-bicep` - Подршка за Bicep језик
  - `ms-azure-devtools.azure-resource-groups` - Управљање Azure ресурсима
  - `yzhang.markdown-all-in-one` - Уређивање Markdown-а
  - `DavidAnson.vscode-markdownlint` - Markdown линтер
  - `bierner.markdown-mermaid` - Подршка за Mermaid дијаграме
  - `redhat.vscode-yaml` - Подршка за YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуелизација Git-а
  - `mhutchie.git-graph` - Историја Git-а

- **⚙️ Подешавања VS Code-а**: Додани подразумевани параметри за Python тумача, форматирање на чување и брисање празних места

- **📦 Ажурирани requirements-dev.txt**:
  - Додат MkDocs minify плагин
  - Додат pre-commit за квалитет кода
  - Додати Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Исправљено
- **Команда након креирања**: Сада проверава инсталацију AZD и Azure CLI на покретању контејнера

---

### [v3.11.0] - 2026-02-05

#### Реновирање README за почетнике
**Ова верзија значајно побољшава README.md како би била приступачнија почетницима и додаје битне ресурсе за AI програмере.**

#### Додато
- **🆚 Поређење Azure CLI и AZD**: Јасан објашњење када користити који алат са практичним примерима
- **🌟 Феноменални AZD линкови**: Директни линкови ка заједничкој галерији шаблона и ресурсима за допринос:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ шаблона спремних за распоређивање
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Заједнички допринос
- **🎯 Водич за брзи почетак**: Једноставна секција од 3 корака (Инсталација → Пријава → Распоређивање)
- **📊 Табела навигације засноване на искуству**: Јасна упутства о томе где почети у зависности од искуства програмера

#### Измењено
- **Структура README-а**: Реорганизовано ради прогресивног приказа - најважније информације прво
- **Секција увод**: Прерађена да објасни "Магију `azd up`" за потпуне почетнике
- **Уклоњен дупликат садржаја**: Уклоњена дупликатна секција за решавање проблема
- **Команде за решавање проблема**: Исправљена референца `azd logs` да користи важећу `azd monitor --logs`

#### Исправљено
- **🔐 Команде за аутентификацију**: Додати `azd auth login` и `azd auth logout` у cheat-sheet.md
- **Невалидне референце команди**: Уклонили преостале `azd logs` са одељка за решавање проблема у README-у

#### Белешке
- **Обим**: Промене примењене на главни README.md и resources/cheat-sheet.md
- **Циљна публика**: Побољшања усмерена посебно на развојне програмере нове у AZD

---

### [v3.10.0] - 2026-02-05

#### Ажурирање тачности команди Azure Developer CLI
**Ова верзија исправља нестајуће команде AZD у целој документацији, осигуравајући да сви примери кода користе важећу Azure Developer CLI синтаксу.**

#### Исправљено
- **🔧 Уклоњене нестајуће AZD команде**: Комплетна ревизија и исправка неважећих команди:
  - `azd logs` (не постоји) → замењено са `azd monitor --logs` или Azure CLI алтернативама
  - `azd service` подкоманде (не постоје) → замењено са `azd show` и Azure CLI
  - `azd infra import/export/validate` (не постоје) → уклоњено или замењено важећим алтернативама
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ознаке (не постоје) → уклоњене
  - `azd provision --what-if/--rollback` ознаке (не постоје) → ажурирано да користи `--preview`
  - `azd config validate` (не постоји) → замењено са `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не постоје) → уклоњене

- **📚 Фајлови ажурирани са исправкама команди**:
  - `resources/cheat-sheet.md`: Велика ревизија референце команди
  - `docs/deployment/deployment-guide.md`: Исправљене стратегије повлачења и примене
  - `docs/troubleshooting/debugging.md`: Исправљени одељци за анализу логова
  - `docs/troubleshooting/common-issues.md`: Ажуриране команде за решавање проблема
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљена AZD секција за дебаговање
  - `docs/getting-started/azd-basics.md`: Исправљене команде за праћење
  - `docs/getting-started/first-project.md`: Ажурирани примери за праћење и дебаговање
  - `docs/getting-started/installation.md`: Исправљени примери помоћи и верзија
  - `docs/pre-deployment/application-insights.md`: Исправљене команде за преглед логова
  - `docs/pre-deployment/coordination-patterns.md`: Исправљене команде за дебаговање агента

- **📝 Ажурирана референца верзије**: 
  - `docs/getting-started/installation.md`: Променио тврдокодирани `1.5.0` број верзије у генерализовани `1.x.x` са линком ка издањима

#### Промењено
- **Стратегије повлачења**: Ажурирана документација да користи Git-базирано повлачење (AZD нема сопствено повлачење)
- **Преглед логова**: Замена `azd logs` референци са `azd monitor --logs`, `azd monitor --live` и Azure CLI командама
- **Секција перформанси**: Уклоњене нестајуће паралелне/инкременталне ознаке за примену, пружене важеће алтернативе

#### Технички детаљи
- **Важеће AZD команде**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Важеће ознаке azd monitor**: `--live`, `--logs`, `--overview`
- **Уклоњене функције**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Белешке
- **Верификација**: Команде проверене против Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завршетак радионице и унапређење квалитета документације
**Ова верзија завршава интерактивне модуле радионице, исправља све покварене линкове у документацији и унапређује укупни квалитет садржаја за AI програмере који користе Microsoft AZD.**

#### Додато
- **📝 CONTRIBUTING.md**: Нови документ са смерницама за допринос са:
  - Јасним упутствима за пријаву проблема и предлоге измена
  - Стандардима за документацију новог садржаја
  - Правилима о примерима кода и конвенцијама порука комита
  - Информацијама о укључивању заједнице

#### Завршено
- **🎯 Модул радионице 7 (Закључак)**: Потпуно завршен завршни модул са:
  - Свеобухватним резимеирањем постигнућа у радионици
  - Одељаком за кључне савладане појмове укључујући AZD, шаблоне и Microsoft Foundry
  - Препорукама за наставак учења
  - Вежбама са оценама тежине изазова у радионици
  - Линковима за повратне информације заједнице и подршку

- **📚 Модул радионице 3 (Деконструкција)**: Ажурирани циљеви учења са:
  - Упутствима за активирање GitHub Copilot и MCP сервера
  - Разумевање структуре фасцикле AZD шаблона
  - Обрасцима инфраструктуре као кода (Bicep)
  - Упутствима за практичне лабораторијске вежбе

- **🔧 Модул радионице 6 (Чишћење)**: Завршен са:
  - Циљевима чишћења ресурса и управљања трошковима
  - Користећи `azd down` за безбедно деактивирање инфраструктуре
  - Упутства за опоравак софт-обрисаних когнитивних услуга
  - Додатне истраживачке теме за GitHub Copilot и Azure Portal

#### Исправљено
- **🔗 Исправке покварених линкова**: Решено 15+ покварених интерних линкова у документацији:
  - `docs/ai-foundry/ai-model-deployment.md`: Исправљени путеви ка microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљени путеви ка ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замена нестајућег cicd-integration.md са deployment-guide.md
  - `examples/retail-scenario.md`: Исправљени путеви ка FAQ и водичу за решавање проблема
  - `examples/container-app/microservices/README.md`: Исправљени путеви ка почетној страници курса и водичу за примену
  - `resources/faq.md` и `resources/glossary.md`: Ажуриране референце у поглављу о AI
  - `course-outline.md`: Исправљени референце за водич инструктора и AI лабораторију радионице

- **📅 Банер статуса радионице**: Ажуриран са "У изради" на активан статус радионице са датумом фебруар 2026

- **🔗 Навигација у радионици**: Исправљени покварени навигациони линкови у README.md радионице који су показивали на непостојећу фасциклу lab-1-azd-basics

#### Промењено
- **Презентација радионице**: Уклоњена упозорења "у изради", радионица је сада завршена и спремна за употребу
- **Конзистентност навигације**: Осигурана правилна међумодулска навигација у свим модулима радионице
- **Референце пута учења**: Ажуриране међупоглавне референце са важећим microsoft-foundry путевима

#### Верификовано
- ✅ Сви енглески markdown фајлови имају важеће интерне линкове
- ✅ Модули радионице 0-7 су потпуно завршени са циљевима учења
- ✅ Навигација између поглавља и модула функционише исправно
- ✅ Садржај је погодан за AI програмере који користе Microsoft AZD
- ✅ Језик и структура прилагођени почетницима одржавани кроз читав садржај
- ✅ CONTRIBUTING.md пружа јасна упутства за допринос заједнице

#### Техничка имплементација
- **Валидација линкова**: Аутоматизованим PowerShell скриптом проверавани сви .md интерни линкови
- **Ревизија садржаја**: Ручни преглед комплетности радионице и погодности за почетнике
- **Навигациони систем**: Примењени конзистентни обрасци навигације поглавља и модула

#### Белешке
- **Обим**: Промене примењене само на енглеску документацију
- **Преводи**: Фолдери за превод нису ажурирани у овој верзији (аутоматски превод ће се синхронизовати касније)
- **Трајање радионице**: Потпуна радионица сада пружа 3-4 сата практичног учења

---

### [v3.8.0] - 2025-11-19

#### Напредна документација: Надгледање, Безбедност и Обрасци са више агената
**Ова верзија додаје свеобухватне A-клас лекције о интеграцији Application Insights, патернима аутентификације и координацији више агената за продукционе примене.**

#### Додато
- **📊 Лекција интеграције Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - Фокус на AZD примену са аутоматском набавком
  - Комплетни Bicep шаблони за Application Insights + Log Analytics
  - Функционалне Python апликације са прилагођеном телеметријом (преко 1,200 линија)
  - AI/LLM обрасци надгледања (праћење токена/трошкова Microsoft Foundry модела)
  - 6 Mermaid дијаграма (архитектура, распоређено праћење, проток телеметрије)
  - 3 практичне вежбе (аларми, контролне табле, AI надгледање)
  - Примери Kusto упита и стратегије оптимизације трошкова
  - Стриминг метрика уживо и дебаговање у реалном времену
  - Време учења 40-50 минута са продукционим обрасцима

- **🔐 Лекција о аутентификацији и безбедносним патернима**: у `docs/getting-started/authsecurity.md`:
  - 3 патерна аутентификације (конекцијски низови, Key Vault, managed identity)
  - Комплетни Bicep инфраструктурни шаблони за безбедне примене
  - Node.js код са Azure SDK интеграцијом
  - 3 комплетне вежбе (омогућавање managed identity, user-assigned identity, Key Vault rotation)
  - Најбоље безбедносне праксе и конфигурације RBAC
  - Водич за решавање проблема и анализа трошкова
  - Продукцијски обрасци за аутентификацију без лозинке

- **🤖 Лекција образаца координације више агената**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 образаца координације (секвенцијални, паралелни, хијерархијски, на основу догађаја, консензус)
  - Комплетна имплементација оркестрационе услуге (Python/Flask, преко 1,500 линија)
  - 3 специјализоване имплементације агената (Истраживач, Писац, Уредник)
  - Интеграција Service Bus за редове порука
  - Управљање стањем у Cosmos DB за распоређене системе
  - 6 Mermaid дијаграма који приказују интеракције агената
  - 3 напредне вежбе (руковање временским ограничењима, логика поновних покушаја, circuit breaker)
  - Расчлан jЦена ($240-565/месечно) са стратегијама оптимизације
  - Интеграција Application Insights за праћење

#### Побољшано
- **Поглавље о пред-примени**: Садржи свеобухватне обрасце надзора и координације
- **Поглавље о уводима**: Побољшано са професионалним безбедносним патернима
- **Спремност за продукцију**: Потпуна покривеност од безбедности до опсервабилности
- **Садржај курса**: Ажурирани референци на нове лекције у Поглављима 3 и 6

#### Промењено
- **Напредак учења**: Боља интеграција безбедности и надгледања кроз курс
- **Квалитет документације**: Конзистентни A-клас стандарди (95-97%) у новим лекцијама
- **Продукциони обрасци**: Потпуна покривеност од почетка до краја за ентерпрајз примене

#### Унапређено
- **Искуство програмера**: Јасан пут од развоја до продукционог праћења
- **Безбедносни стандарди**: Професионални обрасци за аутентификацију и управљање тајнама
- **Опсервабилност**: Потпуна интеграција Application Insights са AZD
- **AI радни оптерећења**: Специјализовано праћење за Microsoft Foundry моделе и системе са више агената

#### Верификовано
- ✅ Све лекције садрже комплетан радни код (не искључиво исечке)
- ✅ Mermaid дијаграми за визуелно учење (укупно 19 у 3 лекције)
- ✅ Практичне вежбе са корацима верификације (укупно 9)
- ✅ Производни Bicep шаблони спремни за примену преко `azd up`
- ✅ Анализа трошкова и стратегије оптимизације
- ✅ Водичи за решавање проблема и најбоље праксе
- ✅ Контролне тачке знања са командама за верификацију

#### Резултати оцењивања документације
- **docs/pre-deployment/application-insights.md**: - Свеобухватан водич за праћење
- **docs/getting-started/authsecurity.md**: - Професионални безбедносни патерни
- **docs/pre-deployment/coordination-patterns.md**: - Напредне архитектуре више агената
- **Укупно нов садржај**: - Конзистентно висок квалитет

#### Техничка имплементација
- **Application Insights**: Log Analytics + прилагођена телеметрија + распоређено праћење
- **Аутентификација**: Managed Identity + Key Vault + RBAC обрасци
- **Више агената**: Service Bus + Cosmos DB + Container Apps + оркестрација
- **Надгледање**: Стриминг метрика уживо + Kusto упити + аларми + контролне табле
- **Управљање трошковима**: Стратегије узорковања, политика задржавања, контроле буџета

### [v3.7.0] - 2025-11-19

#### Унапређења квалитета документације и нови пример Microsoft Foundry модела
**Ова верзија унапређује квалитет документације у целом репозиторијуму и додаје потпуни пример примене Microsoft Foundry модела са gpt-4.1 chat интерфејсом.**

#### Додато
- **🤖 Microsoft Foundry Models Chat пример**: Потпуна gpt-4.1 примена са радним имплементацијама у `examples/azure-openai-chat/`:
  - Потпуна инфраструктура Microsoft Foundry модела (gpt-4.1 модел примена)
  - Python командна линија за chat интерфејс са историјом разговора
  - Интеграција са Key Vault за безбедно чување API кључева
  - Праћење коришћења токена и процена трошкова
  - Ограничење брзине и руковање грешкама
  - Комплетан README са водичем примене у трајању од 35-45 минута
  - 11 продукцијски спремних фајлова (Bicep шаблони, Python апликација, конфигурација)
- **📚 Вежбе за документацију**: Додате практичне вежбе у водич за конфигурацију:
  - Вежба 1: Конфигурација више окружења (15 минута)
  - Вежба 2: Вежба управљања тајнама (10 минута)
  - Јасни критеријуми успеха и кораци верификације
- **✅ Верификација примене**: Додат одељак за верификацију у водич за примену:
  - Процедуре провере здравља
  - Контролна листа критеријума успеха
  - Очекивано излазење за све команде примене
  - Брзи референтни водич за решавање проблема

#### Побољшано
- **examples/README.md**: Ажурирано на A-клас квалитет (93%):
  - Додат azure-openai-chat у све релевантне секције
  - Повећан број локалних примера са 3 на 4
  - Додат у табелу AI Примера апликација
  - Интегрисан у Quick Start за средњи ниво корисника
  - Додат у део Microsoft Foundry шаблона
  - Ажуриране секције Матричне поређења и технологијских налаза
- **Квалитет документације**: Побољшано са B+ (87%) на A- (92%) у директоријуму документације:
  - Додати очекивани резултати код критичних примера команда
  - Укључени кораци верификације за промене конфигурације
  - Побољшано практично учење кроз практичне вежбе

#### Измењено
- **Прогрес учења**: Боља интеграција примера вештачке интелигенције за средњи ниво
- **Структура документације**: Више практичних вежби са јасним испољеним циљевима
- **Процес верификације**: Јасни критеријуми успеха додати главним токовима рада

#### Побољшано
- **Искуство програмера**: Деплојмент Microsoft Foundry модела сада траје 35-45 минута (уместо 60-90 за сложеније алтернативе)
- **Транспарентност трошкова**: Јасне процене трошкова (50-200$ месечно) за пример Microsoft Foundry модела
- **Пут учења**: AI програмери имају јасну улазну тачку са azure-openai-chat
- **Стандарди документације**: Конзистентни очекивани резултати и кораци верификације

#### Верификовано
- ✅ Microsoft Foundry Models пример потпуно функционалан са `azd up`
- ✅ Сви 11 имплементационих фајлова су синтаксички правилни
- ✅ Упутства у README одговарају стварном искуству деплојмента
- ✅ Линкови у документацији ажурирани на више од 8 локација
- ✅ Индекс примера тачно одражава 4 локална примера
- ✅ Нема дуплих спољних линкова у табелама
- ✅ Све навигацијске референце су исправне

#### Техничка имплементација
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps образац
- **Безбедност**: Подршка за Managed Identity, тајне у Key Vault
- **Надзор**: Интеграција са Application Insights
- **Управљање трошковима**: Праћење токена и оптимизација коришћења
- **Деплојмент**: Једна команда `azd up` за комплетну конфигурацију

### [v3.6.0] - 2025-11-19

#### Велика надоградња: Примери деплојмента Container App апликација
**Ова верзија доноси свеобухватне примере деплојмента продукцијских container апликација помоћу Azure Developer CLI (AZD), са пуном документацијом и интеграцијом у пут учења.**

#### Додато
- **🚀 Примери Container App**: Нови локални примери у `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Потпуни преглед контејнерских деплојмента, брзи почетак, продукција и напредни образци
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Почетнички пријатељски REST API са скалом до нуле, health probes, надзором и решавањем проблема
  - [Microservices Architecture](../../examples/container-app/microservices): Продукционо спреман мулти-сервисни деплојмент (API Gateway, Product, Order, User, Notification), асинхрони систем порука, Service Bus, Cosmos DB, Azure SQL, распределено трасирање, blue-green/canary деплојмент
- **Најбоље праксе**: Безбедност, надзор, оптимизација трошкова и CI/CD смернице за контејнеризоване радне оптерећења
- **Примери кода**: Потпуни `azure.yaml`, Bicep шаблони и мултијезичке имплементације сервиса (Python, Node.js, C#, Go)
- **Тестирање и решавање проблема**: Крај-до-крај сценарији, команде за надзор, смернице за решавање проблема

#### Измењено
- **README.md**: Ажуриран да приказује и линкује нове примере container апликација у секцији "Local Examples - Container Applications"
- **examples/README.md**: Ажуриран да истакне примере container апликација, дода уносe у матрицу поређења и ажурира технологију/архитектонске референце
- **Преглед курса и приручник за учење**: Ажурирани за референцирање нових примера и образаца деплојмента container апликација у релевантним поглављима

#### Верификовано
- ✅ Сви нови примери могу да се деплоју са `azd up` и прате најбоље праксе
- ✅ Ажурирани крос-линкови и навигација у документацији
- ✅ Примери покривају сценарије од почетничких до напредних, укључујући продукцијске микросервисе

#### Напомене
- **Опсег**: Само енглеска документација и примери
- **Следећи кораци**: Проширење са додатним напредним обрасцима контејнера и CI/CD аутоматизацијом у будућим издањима

### [v3.5.0] - 2025-11-19

#### Пребрендирање производа: Microsoft Foundry
**Ова верзија спроводи свеобухватну промену имена производа са "Microsoft Foundry" на "Microsoft Foundry" у целокупној енглеској документацији, одражавајући званично ребрендирање Microsoft-а.**

#### Измењено
- **🔄 Ажурирање имена производа**: Комплетно пребрендирање са "Microsoft Foundry" на "Microsoft Foundry"
  - Ажуриране све референце у енглеској документацији у `docs/` директоријуму
  - Преименован фолдер: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименован фајл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Укупно: 23 садржајне референце ажуриране у 7 документацијских фајлова

- **📁 Промене у структури фолдера**:
  - `docs/ai-foundry/` преименован у `docs/microsoft-foundry/`
  - Све крос-референце ажуриране да одражавају нову структуру фолдера
  - Навигацијски линкови верификовани у целокупној документацији

- **📄 Преименовања фајлова**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Сви интерни линкови ажурирани да реферишу нова имена фајлова

#### Ажурирани фајлови
- **Поглављена документација** (7 фајлова):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ажурирања навигацијских линкова
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ажурирања референци имена производа
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Већ користи Microsoft Foundry (са претходних ажурирања)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ажуриране референце (преглед, повратне информације заједнице, документација)
  - `docs/getting-started/azd-basics.md` - 4 ажурирања крос-линкова
  - `docs/getting-started/first-project.md` - 2 ажурирања навигацијских линкова у поглављу
  - `docs/getting-started/installation.md` - 2 ажурирања линкова за следеће поглавље
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ажуриране референце (навигација, Discord заједница)
  - `docs/troubleshooting/common-issues.md` - 1 ажурирани навигацијски линк
  - `docs/troubleshooting/debugging.md` - 1 ажурирани навигацијски линк

- **Фајлови структуре курса** (2 фајла):
  - `README.md` - 17 ажурираних референци (преглед курса, наслови поглавља, секција шаблона, увиди заједнице)
  - `course-outline.md` - 14 ажурираних референци (преглед, циљеви учења, ресурси поглавља)

#### Верификовано
- ✅ Ниједна преостала референца на путању "ai-foundry" у енглеској документацији
- ✅ Ниједна преостала референца имена производа "Microsoft Foundry" у енглеској документацији
- ✅ Сви навигацијски линкови функционални са новом структуром фолдера
- ✅ Преименовања фајлова и фолдера успешно извршена
- ✅ Крос-референце између поглавља верификоване

#### Напомене
- **Опсег**: Промене примењене само у енглеској документацији у `docs/` директоријуму
- **Преводи**: Преводне фасцикле (`translations/`) нису ажуриране у овој верзији
- **Радионце**: Материјали са радионице (`workshop/`) нису ажурирани у овој верзији
- **Примери**: Пример фајлови могу и даље садржавати референце на лажно име (биће решено у будућим издањима)
- **Спољашњи линкови**: Спољашњи URL-ови и GitHub референце остају непромењени

#### Водич за миграцију за сараднике
Ако имате локалне гране или документацију која реферише стару структуру:
1. Ажурирајте референце директоријума: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ажурирајте референце фајлова: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените име производа: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверите да ли сви интерни линкови у документацији и даље раде

---

### [v3.4.0] - 2025-10-24

#### Побољшања у инфраструктурном прегледу и валидацији
**Ова верзија уводи свеобухватну подршку за нову preview функцију Azure Developer CLI и побољшава корисничко искуство радионице.**

#### Додато
- **🧪 azd provision --preview Документација функције**: Детаљна покривеност нове инфраструктурне preview могућности
  - Референца команди и примери коришћења у cheat sheet-у
  - Детаљна интеграција у водич за провизију са сценаријима и користима
  - Интеграција провере пре лета за безбеднију валидацију деплојмента
  - Ажурирања водича за почетак са безбедносним приступом деплојменту
- **🚧 Банер статуса радионице**: Професионални HTML банер који показује статус развоја радионице
  - Градјентни дизајн са индикаторима изградње за јасну комуникацију према кориснику
  - Временска ознака последње исправке ради транспарентности
  - Дизајн прилагођен мобилним уређајима

#### Побољшано
- **Сигурност инфраструктуре**: Preview функционалност интегрисана кроз целу документацију
- **Превалидација пре деплојмента**: Аутоматски скрипти садрже тестирање инфраструктурног preview-ја
- **Радни ток програмера**: Ажуриране секвенце команда који укључују preview као најбољу праксу
- **Искуство радионице**: Јасна очекивања корисника о статусу развоја садржаја

#### Измењено
- **Најбоље праксе деплојмента**: Препоручен радни ток са preview-јем као првим кораком
- **Ток документације**: Валидација инфраструктуре премештена раније у процес учења
- **Презентација радионице**: Професионална комуникација статуса са јасном временском линијом развоја

#### Побољшано
- **Приступ "прво безбедност"**: Промене инфраструктуре могу се сада проверити пре деплојмента
- **Тимска сарадња**: Резултати preview-ја могу се делити за преглед и одобрење
- **Свест о трошковима**: Боље разумевање трошкова ресурса пре провизије
- **Умањење ризика**: Смањење неуспеха деплојмента кроз унапредну валидацију

#### Техничка имплементација
- **Интеграција кроз више докумената**: Preview функција документована у 4 кључна фајла
- **Обрасци команда**: Конзистентна синтакса и примери кроз целу документацију
- **Интеграција најбољих пракси**: Preview укључен у токове валидације и скрипте
- **Визуални индикатори**: Јасне ознаке НОВЕ функције за лакше откривање

#### Инфраструктура радионице
- **Комуникација статуса**: Професионални HTML банер са градјентним стилом
- **Искуство корисника**: Јасан статус развоја спречава конфузију
- **Професионална презентација**: Одржава кредибилитет репозиторијума уз јасна очекивања
- **Транспарентност временске линије**: Временска ознака последње измене у октобру 2025. ради одговорности

### [v3.3.0] - 2025-09-24

#### Побољшани материјали радионице и интерактивно искуство учења
**Ова верзија доноси свеобухватне материјале радионице са интерактивним водичима у прегледачу и структурисаним стазама учења.**

#### Додато
- **🎥 Интерактивни водич радионице**: Искуство радионице у прегледачу са MkDocs preview могућношћу
- **📝 Структурисана упутства радионице**: 7 корака вођене стазе учења од откривања до прилагођавања
  - 0-Увод: Преглед и припрема радионице
  - 1-Изабери-АИ-Шаблон: Процес откривања и избора шаблона
  - 2-Валидирај-АИ-Шаблон: Процесе деплојмента и валидације
  - 3-Деконструиши-АИ-Шаблон: Разумевање архитектуре шаблона
  - 4-Конфигуриши-АИ-Шаблон: Конфигурација и прилагођавање
  - 5-Прилагоди-АИ-Шаблон: Напредне модификације и итерације
  - 6-Распусти-инфраструктуру: Чишћење и управљање ресурсима
  - 7-Завршетак: Сажетак и следећи кораци
- **🛠️ Алати радионице**: MkDocs конфигурација са Material темом за побољшано искуство учења
- **🎯 Стаза практичног учења**: Методологија у 3 корака (Откривање → Деплојмент → Прилагођавање)
- **📱 Интеграција GitHub Codespaces**: Непрекидно подешавање окружења за развој

#### Побољшано
- **Лабораторија AI радионице**: Проширена са свеобухватним 2-3 сатним структурираним искуством учења
- **Документација радионице**: Професионална презентација са навигацијом и визуелним помагалима
- **Прогрес учења**: Јасна вођена упутства корак по корак од избора шаблона до продукцијског деплојмента
- **Искуство програмера**: Интегрисани алати за поједностављене токове рада развоја

#### Побољшано
- **Приступачност**: Интерфејс у прегледачу са претрагом, копирањем и пребацивањем тема
- **Самостално учење**: Флексибилна структура радионице која одговара различитим темпом учења
- **Практична примена**: Стварни сценарији деплојмента AI шаблона
- **Интеграција заједнице**: Интеграција Discord-а за подршку радионици и сарадњу

#### Карактеристике радионице
- **Уграђена претрага**: Брзо проналажење кључних речи и лекција
- **Копирање блокова кода**: Функционалност копирања преко превлачења за све примере кода
- **Промена теме**: Подршка за тамни/светли режим према преференцама
- **Визуелни материјали**: Снимци екрана и дијаграми за боље разумевање
- **Интеграција помоћи**: Директан приступ Discord заједници за подршку

### [v3.2.0] - 2025-09-17

#### Велика реструктурирања навигације и систем учења базиран на поглављима
**Ова верзија уводи свеобухватну структуру учења базирану на поглављима са побољшаном навигацијом кроз цео репозиторијум.**

#### Додато
- **📚 Систем учења базиран на поглављима**: Реструктурирање целог курса у 8 прогресивних учењских поглавља
  - Поглавље 1: Основа и брзи почетак (⭐ - 30-45 минута)
  - Поглавље 2: AI-први развој (⭐⭐ - 1-2 сата)
  - Поглавље 3: Конфигурација и аутентикација (⭐⭐ - 45-60 минута)
  - Поглавље 4: Инфраструктура као код и деплојмент (⭐⭐⭐ - 1-1.5 сати)
  - Поглавље 5: Мулти-агент AI решења (⭐⭐⭐⭐ - 2-3 сата)
  - Поглавље 6: Превалидација и планирање пре деплојмента (⭐⭐ - 1 сат)
  - Поглавље 7: Решавање проблема и дебаговање (⭐⭐ - 1-1.5 сати)
  - Поглавље 8: Продукцијски и корпоративни образци (⭐⭐⭐⭐ - 2-3 сата)
- **📚 Свеобухватан навигациони систем**: Конзистентни заглавља и подножја навигације у целој документацији
- **🎯 Праћење напретка**: Листа за проверу завршетка курса и систем потврде учења
- **🗺️ Вођство у путу учења**: Јасне улазне тачке за различите нивое искуства и циљеве
- **🔗 Крос-линкови**: Повезана поглавља и предуслови јасно повезани

#### Побољшано
- **Структура README-а**: Претворен у структурисану платформу учења са организацијом базираном на поглављима
- **Навигација у документацији**: Свакa страница сада садржи контекст поглавља и смернице прогресије
- **Организација шаблона**: Примери и шаблони пресликавају релевантна поглавља учења
- **Интеграција ресурса**: Cheat sheet-ови, ЧПП и приручници повезани са релевантним поглављима
- **Интеграција радионице**: Практичне лабораторије везане за више учењских циљева поглавља

#### Измењено
- **Прогрес учења**: Прелазак са линеарне документације на флексибилно учење базирано на поглављима
- **Постављање конфигурације**: Померање водича за конфигурацију у Поглавље 3 ради бољег тока учења
- **Интеграција AI садржаја**: Боља интеграција садржаја специфичног за AI током целог процеса учења
- **Производни садржај**: Напредни шаблони консолидовани у Поглављу 8 за кориснике из предузећа

#### Побољшано
- **Корисничко искуство**: Јасни путокази и показатељи напретка по поглављима
- **Приступачност**: Конзистентни навигациони шаблони за лакше кретање кроз курсеве
- **Професионална презентација**: Структура курса по узору на универзитетску, погодна за академску и корпоративну обуку
- **Ефикасност учења**: Скраћено време проналажења релевантног садржаја захваљујући побољшаној организацији

#### Техничка имплементација
- **Наслови за навигацију**: Стандаризована навигација поглавља у више од 40 датотека документације
- **Натписи у фоотеру**: Конзистентна упутства за напредовање и показатељи завршетка поглавља
- **Унутрашње линковење**: Опсежан систем унутрашњих веза који повезује сродне концепте
- **Мапирање поглавља**: Шаблони и примери јасно повезани са целима учења

#### Побољшања у водичу за учење
- **📚 Опсежни циљеви учења**: Реструктурирани водич за учење у складу са системом од 8 поглавља
- **🎯 Оцењивање по поглављима**: Свако поглавље укључује специфичне циљеве учења и практичне задатке
- **📋 Праћење напретка**: Недељни распоред учења са мерљивим резултатима и листама за проверу завршетка
- **❓ Питања за оцењивање**: Питања за проверу знања за свако поглавље са професионалним испитним резултатима
- **🛠️ Практичне вежбе**: Практичне активности са стварним сценаријима имплементације и решавања проблема
- **📊 Прогрес вештина**: Јасан напредак од основних концепата до предузетничких шаблона уз фокус на развој каријере
- **🎓 Систем сертификације**: Професионални резултати развоја и систем препознавања у заједници
- **⏱️ Управљање временом**: Структурирани план учења од 10 недеља са валидацијом прелазних циљева

### [v3.1.0] - 2025-09-17

#### Побољшана решења за мулти-агентски AI
**Ова верзија унапређује мулти-агентско малопродајно решење бољим именовањем агената и побољшаном документацијом.**

#### Промењено
- **Терминологија мулти-агента**: Применом "Кориснички агент" уместо "Cora агент" кроз цео мулти-агентски малопродајни систем ради бољег разумевања
- **Архитектура агената**: Ажурирана сва документација, ARM шаблони и примери кода са доследним именом "Кориснички агент"
- **Примери конфигурације**: Модернизовани шаблони конфигурације агената са ажурираним конвенцијама именовања
- **Конзистентност документације**: Осигурано да све референце користе стручна, описна имена агената

#### Побољшано
- **ARM пакет шаблона**: Ажурирани retail-multiagent-arm-template са референцама на Кориснички агент
- **Дијаграми архитектуре**: Освежени Mermaid дијаграми са ажурираном терминологијом агената
- **Примери кода**: Python класе и примери имплементације сада користе именовање CustomerAgent
- **Варијабле окружења**: Ажурирани сви скрипти за имплементацију да користе конвенције CUSTOMER_AGENT_NAME

#### Побољшано
- **Искуство програмера**: Јасније улоге и одговорности агената у документацији
- **Спремност за производњу**: Боља усаглашеност са именовањем које користе предузећа
- **Материјали за учење**: Интуитивније именовање агената у образовне сврхе
- **Употребљивост шаблона**: Поједностављено разумевање функција агената и образаца имплементације

#### Технички детаљи
- Ажурирани Mermaid дијаграми архитектуре са референцама на CustomerAgent
- Замењени називи класа CoraAgent са CustomerAgent у Python примерима
- Модификоване JSON конфигурације ARM шаблона да користе тип агента "customer"
- Ажуриране варијабле окружења са CORA_AGENT_* на CUSTOMER_AGENT_* обрасце
- Освежени сви наредбени задаци и конфигурације контејнера за постављање

### [v3.0.0] - 2025-09-12

#### Велије промене - Фокус на AI програмере и интеграција Microsoft Foundry
**Ова верзија претвара репозиторијум у свеобухватан ресурс за учење са фокусом на AI и интеграцијом Microsoft Foundry.**

#### Додато
- **🤖 AI-први пут учења**: Комплетна реструктурирана подршка за AI програмере и инжењере
- **Водич за интеграцију Microsoft Foundry**: Опсежна документација за повезивање AZD са сервисима Microsoft Foundry
- **Образци за имплементацију AI модела**: Детаљан водич који покрива избор модела, конфигурацију и стратегије производне имплементације
- **AI радионица лабораторија**: 2-3 сата интерактивне радионице за претварање AI апликација у решења постављена помоћу AZD-а
- **Најбоље праксе за производно AI**: Шаблони спремни за предузећа за скалабилност, праћење и осигурање AI радних оптерећења
- **Водич за решавање проблема специфичних за AI**: Опсежни водич за проблеме са Microsoft Foundry моделима, Cognitive Services и AI имплементацијом
- **Галерија AI шаблона**: Изабрана колекција Microsoft Foundry шаблона са оценама сложености
- **Материјали за радионице**: Комплетна структура радионице са лабораторијама и референтним материјалима

#### Побољшано
- **Структура README-а**: Фокус на AI програмере са 45% података о интересовању заједнице из Microsoft Foundry Discord-а
- **Путеви учења**: Посебан AI програмерски пут уз традиционалне путеве за студенте и DevOps инжењере
- **Препоруке шаблона**: Изабрани AI шаблони укључују azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграција са заједницом**: Побољшана подршка Discord заједнице са каналима и дискусијама посвећеним AI

#### Безбедност и фокус на производњу
- **Обрасци управљаног идентитета**: Конфигурације за AI аутентификацију и безбедност
- **Оптимизација трошкова**: Праћење коришћења токена и контроле буџета за AI радне оптерећења
- **Мулти-регијска имплементација**: Стратегије глобалног постављања AI апликација
- **Праћење перформанси**: Метрике специфичне за AI и интеграција са Application Insights

#### Квалитет документације
- **Линеарна структура курса**: Логички напредак од почетника до напредних AI шаблона за имплементацију
- **Проверени URL-ови**: Сви спољашњи линкови на репозиторијуме су потврђени и доступни
- **Комплетна референца**: Сви унутрашњи линкови документације су валидни и функционални
- **Спремно за производњу**: Шаблони имплементације за предузећа са примерима из стварног света

### [v2.0.0] - 2025-09-09

#### Велије промене - Реструктурирање репозиторијума и професионално унапређење
**Ова верзија представља значајно преправљање структуре репозиторијума и презентације садржаја.**

#### Додато
- **Структурирани оквир за учење**: Све странице документације садрже одељке Увод, Циљеве учења и Резултате учења
- **Навигациони систем**: Додати линкови Претходна/Следећа лекција кроз целу документацију за вођени напредак учења
- **Водич за учење**: Опсежан study-guide.md са циљевима учења, вежбама и оценама
- **Професионална презентација**: Уклоњене све емоџи иконе ради побољшане приступачности и професионалног изгледа
- **Побољшана структура садржаја**: Побољшана организација и ток материјала за учење

#### Промењено
- **Формат документације**: Стандаризован сав материјал са доследном структуром фокусираном на учење
- **Ток навигације**: Имплементиран логички напредак кроз сав материјал за учење
- **Презентација садржаја**: Уклоњени декоративни елементи у корист јасног и професионалног формата
- **Структура линкова**: Ажурирани сви унутрашњи линкови да подрже нови навигациони систем

#### Побољшано
- **Приступачност**: Уклањање зависности од емоџија ради боље компатибилности са читачима екрана
- **Професионални изглед**: Чиста, академска презентација погодна за корпоративно учење
- **Искуство учења**: Структурирани приступ са јасним циљевима и резултатима за сваку лекцију
- **Организација садржаја**: Бољи логички ток и повезивање између сродних тема

### [v1.0.0] - 2025-09-09

#### Почетно издање - Комплетан AZD репозиторијум за учење

#### Додато
- **Основна структура документације**
  - Комплетан низ водича за почетак рада
  - Опсежна документација за имплементацију и провизионисање
  - Детаљни ресурси за решавање проблема и дебаговање
  - Алати и процедуре за валидацију пре имплементације

- **Модул за почетак рада**
  - Основи AZD-а: Главни концепти и терминологија
  - Водич за инсталацију: Упутства за подешавање специфично за платформу
  - Водич за конфигурацију: Подешавање окружења и аутентификација
  - Први туторијал пројекта: Корак по корак практично учење

- **Модул за имплементацију и провизионисање**
  - Водич за имплементацију: Комплетна документација тока рада
  - Водич за провизионисање: Инфраструктура као код коришћењем Bicep-а
  - Најбоље праксе за производне имплементације
  - Шаблони архитектуре више сервиса

- **Модул за валидацију пре имплементације**
  - Планирање капацитета: Проверa доступности Azure ресурса
  - Избор SKU-а: Подробан водич за нивое услуга
  - Предлетачке провере: Аутоматизовани скрипти за валидацију (PowerShell и Bash)
  - Алати за процену трошкова и планирање буџета

- **Модул за решавање проблема**
  - Уобичајени проблеми: Често сусретани проблеми и решења
  - Водич за дебаговање: Систематске методологије решавања проблема
  - Напредне дијагностичке технике и алати
  - Праћење перформанси и оптимизација

- **Ресурси и референце**
  - Лист команди: Брза референца за основне команде
  - Речник: Опсежне дефиниције терминологије и скраћеница
  - Често постављана питања (FAQ): Детаљни одговори на честе упите
  - Линкови ка спољним ресурсима и везе са заједницом

- **Примери и шаблони**
  - Пример једноставне веб апликације
  - Шаблон за имплементацију статичног веб сајта
  - Конфигурација апликације у контејнеру
  - Шаблони интеграције базе података
  - Примери микросервиса архитектуре
  - Имплементације серверлес функција

#### Карактеристике
- **Подршка за више платформи**: Водичи за инсталацију и конфигурацију за Windows, macOS и Linux
- **Више нивоа вештина**: Садржај дизајниран за студенте до професионалних програмера
- **Практичан фокус**: Практични примери и сценарији из стварног света
- **Опсежно покривање**: Од основних концепата до напредних предузетничких шаблона
- **Приступ „Безбедност на првом месту“**: Интегрисане најбоље праксе за безбедност
- **Оптимизација трошкова**: Упутства за економичне имплементације и управљање ресурсима

#### Квалитет документације
- **Детаљни примери кода**: Практични, тестирани примерци кода
- **Упутства корак по корак**: Јасне и применљиве смернице
- **Опсежно руковање грешкама**: Решења за честе проблеме
- **Интеграција најбољих пракси**: Стандардни индустријски стандарди и препоруке
- **Компатибилност верзија**: Ажурирано према најновијим Azure сервисима и azd функцијама

## Планирана будућа унапређења

### Верзија 3.1.0 (Планирано)
#### Проширење AI платформе
- **Подршка за више модела**: Шаблони интеграције за Hugging Face, Azure Machine Learning и прилагођене моделе
- **AI оквири агената**: Шаблони за LangChain, Semantic Kernel и AutoGen имплементације
- **Напредни RAG шаблони**: Опције векторских база података ван Azure AI Search (Pinecone, Weaviate и др.)
- **AI опсервабилност**: Побољшано праћење перформанси модела, коришћења токена и квалитета одговора

#### Искуство програмера
- **VS Code екстензија**: Интегрисано искуство развоја AZD + Microsoft Foundry
- **GitHub Copilot интеграција**: AI-асистирана генерација AZD шаблона
- **Интерактивни туторијали**: Практичне вежбе кодирања са аутоматском валидацијом за AI сценарије
- **Видео садржај**: Допунске видео туторијале за визуелне ученике фокусиране на AI имплементације

### Верзија 4.0.0 (Планирано)
#### Предузетнички AI шаблони
- **Оквир управљања**: Управљање AI моделима, усклађеност и ревизорски трагови
- **Мулти-танант AI**: Шаблони за услуживање више корисника са изолованим AI сервисима
- **Edge AI имплементација**: Интеграција са Azure IoT Edge и контејнерским инстанцама
- **Хибридни облак AI**: Мулти-облак и хибридни шаблони имплементације AI радних оптерећења

#### Напредне функције
- **Аутоматизација AI процеса**: MLOps интеграција са Azure Machine Learning цевоводима
- **Напредна безбедност**: Zero-trust шаблони, приватне тачке приступа и напредна заштита од претњи
- **Оптимизација перформанси**: Напредно подешавање и стратегије скалирања за AI апликације велике пропусности
- **Глобална дистрибуција**: Шаблони за доставу садржаја и међуспремнике на ивици мреже за AI апликације

### Верзија 3.0.0 (Планирано) - Замeњена тренутним издањем
#### Предложена додавања - Сада имплементирана у v3.0.0
- ✅ **AI-фокусирани садржај**: Комплетна интеграција Microsoft Foundry (Завршено)
- ✅ **Интерактивне радионице**: Практична AI радионица (Завршено)
- ✅ **Напредни безбедносни модул**: AI специфични безбедносни шаблони (Завршено)
- ✅ **Оптимизација перформанси**: Стратегије подешавања AI радних оптерећења (Завршено)

### Верзија 2.1.0 (Планирано) - Делимично имплементирана у v3.0.0
#### Мања унапређења - Нека завршена у тренутном издању
- ✅ **Додатни примери**: AI-фокусирани сценарији имплементације (Завршено)
- ✅ **Проширени FAQ**: AI специфична питања и решавање проблема (Завршено)
- **Интеграција алата**: Побољшани водичи за IDE и едитор интеграцију
- ✅ **Проширено праћење**: AI специфични шаблони за праћење и узбуњивање (Завршено)

#### Још увек планирано за будуће издање
- **Документација прилагођена мобилним уређајима**: Респонзивни дизајн за учење на мобилним уређајима
- **Приступ без везе**: Пакети документације за преузимање
- **Побољшана IDE интеграција**: VS Code екстензија за AZD + AI токове рада
- **Контролна табла за заједницу**: Реал-тайм метрике заједнице и праћење доприноса

## Како допринети изменама у дневнику промена

### Пријављивање измена
Када доприносите овом репозиторијуму, обезбедите да уноси у дневник промена садрже:

1. **Број верзије**: У складу са семантичким верзионисањем (главна.мања.поправка)
2. **Датум**: Датум издавања или ажурирања у формату ГГГГ-ММ-ДД
3. **Категорија**: Додато, Промењено, Застарело, Уклоњено, Поправљено, Безбедност
4. **Јасан опис**: Концизан опис извршених промена
5. **Процењени утицај**: Како промене утичу на постојеће кориснике

### Категорије промена

#### Додато
- Нова својства, одељци документације или могућности
- Нови примери, шаблони или ресурси за учење
- Додатни алати, скрипте или услужни програми

#### Промењено
- Измене постојећих функција или документације
- Ажурирања за побољшање јасноће или прецизности
- Реструктурирања садржаја или организације

#### Застарело
- Карактеристике или приступи који се укидају
- Одељци документације планирани за уклањање
- Методи који имају боље алтернативе

#### Уклоњено
- Карактеристике, документација или примери који више нису релевантни
- Застареле информације или изашли приступи
- Редундантан или консолидован садржај

#### Поправљено
- Исправке грешака у документацији или коду
- Решавање пријављених проблема или грешака
- Побољшања прецизности или функционалности

#### Безбедност
- Безбедносна унапређења или исправке
- Ажурирања најбољих безбедносних пракси
- Решавање безбедносних рањивости

### Упутства за семантичко верзионисање

#### Главна верзија (X.0.0)
- Промене које разбијају уназадну компатибилност и захтевају рад корисника
- Значајна реструктурирања садржаја или организације
- Промене које мењају основни приступ или методологију

#### Мала Верзија (X.Y.0)
- Нове функције или додаци садржаја
- Побољшања која задржавају уназадну компатибилност
- Додатни примери, алати или ресурси

#### Поправна Верзија (X.Y.Z)
- Исправке грешака и корекције
- Мала побољшања постојећег садржаја
- Прецизирања и мала побољшања

## Повратне информације и предлози заједнице

Активно подстичемо повратне информације за побољшање овог ресурса за учење:

### Како пружити повратне информације
- **GitHub Issues**: Пријавите проблеме или предложите побољшања (AI специфични проблеми су добродошли)
- **Discord Diskusije**: Делите идеје и укључите се у Microsoft Foundry заједницу
- **Pull Requests**: Сарађујте са директним побољшањима садржаја, посебно AI шаблона и водича
- **Microsoft Foundry Discord**: Учествујте у #Azure каналу за разговоре о AZD + AI
- **Заједнички форуми**: Учествујте у ширим дискусијама програмера Azure

### Категорије повратних информација
- **Тачност AI садржаја**: Исправке у интеграцији и распоређивању AI сервиса
- **Искуство учења**: Предлози за унапређење учења AI програмера
- **Недостајући AI садржај**: Захтеви за додатне AI шаблоне, узорке или примере
- **Приступачност**: Побољшања за разноврсне потребе учења
- **Интеграција AI алата**: Предлози за боље интеграције AI развојног процеса
- **Обрасци за производни AI**: Захтеви за предузетничке AI шаблоне за распоређивање

### Обавеза одговора
- **Одговор на проблеме**: У року од 48 сати за пријављене проблеме
- **Захтеви за функције**: Процена у року од једне недеље
- **Заједнички прилози**: Преглед у року од једне недеље
- **Безбедносни проблеми**: Одмах приоритетни са убрзаним одговором

## Распоред одржавања

### Редовна ажурирања
- **Месечни прегледи**: Тачност садржаја и валидација линкова
- **Квартална ажурирања**: Главни додаци и побољшања садржаја
- **Пола године прегледа**: Комплетна реструктурирања и побољшања
- **Годишња издања**: Велике верзије са значајним унапређењима

### Надзор и осигурање квалитета
- **Аутоматизовано тестирање**: Редовна валидација примера кода и линкова
- **Интеграција повратних информација заједнице**: Редовно укључивање корисничких предлога
- **Технолошка ажурирања**: Усаглашавање са најновијим Azure услугама и azd издањима
- **Аудити приступачности**: Редовни прегледи за инклузивне принципе дизајна

## Политика подршке за верзије

### Подршка за тренутну верзију
- **Најновија велика верзија**: Пуна подршка са редовним ажурирањима
- **Претходна велика верзија**: Безбедносна ажурирања и критичне исправке током 12 месеци
- **Наслеђене верзије**: Само подршка заједнице, без службених ажурирања

### Упутства за миграцију
Када се издају велике верзије, обезбеђујемо:
- **Водиче за миграцију**: Корак по корак упутства за прелазак
- **Белешке о компатибилности**: Детаљи о променама које разбијају уназадну компатибилност
- **Подршка алата**: Скрипте или уређаји који помажу у миграцији
- **Заједничка подршка**: Посвећени форуми за питања о миграцији

---

**Навигација**
- **Претходна лекција**: [Study Guide](resources/study-guide.md)
- **Следећа лекција**: Вратите се на [Main README](README.md)

**Будите у току**: Пратите овај репозиторијум за обавештења о новим издањима и важним ажурирањима материјала за учење.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->