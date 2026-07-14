# Историја промена - AZD За Почетнике

## Увод

Ова историја промена документаује све значајне промене, ажурирања и побољшања у складишту AZD За Почетнике. Пратимо принципе семантичког верзионисања и водимо овај запис како бисмо помогли корисницима да разумеју шта се променило између верзија.

## Циљеви учења

Прегледом ове историје промена, ви ћете:
- Оставати информисани о новим функцијама и додацима садржаја
- Разумети побољшања урађена у постојећој документацији
- Пратити исправке грешака и корекције како би се обезбедила тачност
- Пратити развој наставних материјала током времена

## Резултати учења

Након прегледа уноса у историји промена, моћи ћете:
- Препознати нови садржај и ресурсе доступне за учење
- Разумети које су секције ажуриране или побољшане
- Планирати свој пут учења на основу најсавременијих материјала
- Давати повратне информације и предлоге за будућа побољшања

## Историја верзија

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Освежавање: Ажурирање Временске Вредности Верзије
**Ова верзија поново потврђује курс против `azd` `1.27.1` (јул 2026, најновије стабилно издање) и тренутног прегледног AI agent проширења `azure.ai.agents` `1.0.0-beta.5`, доводећи све банере „потврђено против“ у најновије стање након издања 1.26.0, 1.27.0 и 1.27.1.**

#### Измене
- **✅ Ажурирана основа за валидацију** са `azd 1.25.6` (јун 2026) на `azd 1.27.1` (јул 2026) кроз главни README, све README фајлове поглавља, лекцију о дев-контејнерима у Поглављу 1 (укључујући примере са фиксним верзијама), лекцију о прилагођеним шаблонима Поглавља 4, лекцију о више агената Поглавља 5 и документе радионице
- **🤖 Освежена основа Поглавља 2** са `azd 1.23.12` (март 2026) на `azd 1.27.1` кроз `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; датуми у напоменама за валидацију ажурирани на 2026-07-13
- **🧩 Проширење AI агента подигнуто** са `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` на тренутно издање `1.0.0-beta.5` у README Поглавља 2 и `agents.md`
- **🧪 Пример за валидацију радионице** (излаз `azd version`) ажуриран на `1.27.1`

#### Напомене о релевантним azd издањима (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Подршка за Go на Azure Functions у Flex Consumption, `azd config sub-filter` филтри претплата по закупцу, самостални пакети проширења (`azd x pack --bundle`) и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделовање Azure AI Foundry пројеката/агената директно у `azure.yaml` (иницијализација без Bicep/Terraform), подршка за деплојмент контејнера на App Service (`host: appservice` + `language: docker`), директан `-s/--source` за `azd extension` команде и `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` флаг за `azd extension install`, подразумевано искључивање застарелих модела из каталога/питања квоте, и неколико исправки грешака

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

#### Попуњавање празнина за почетнике #2: Креирање шаблона, Дев контејнери, Pulumi, Azure DevOps, Сервисни Принципали и још много тога
**Ова верзија затвара преостале средњепролазне празнине уочене анализом azd покривености: како направити и објавити свој шаблон, репродуктивна дев-контејнер/Кодспаце окружења, Pulumi пружалац инфраструктуре, Azure DevOps CI/CD водич, аутентификација сервисног принципала, смернице за избор хоста (AKS/Spring Apps), објашњења `azd restore`/`azd package`, руковање грешкама у hooked процесима, и тимске/заједничке праксе окружења.**

#### Додато
- **🧱 Нова лекција у Поглављу 4** `docs/chapter-04-infrastructure/custom-templates.md` — креирање свог azd шаблона: захтевана структура (`azure.yaml`, `infra/`, `src/`), поље `metadata.template`, параметризација инфраструктуре са `uniqueString()` ресурсним тагом и `azd-env-name` ознаком, локално тестирање са `azd init --template <local-path>`, објављивање на GitHub и слање у Awesome AZD галерију
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/dev-containers.md` — репродуктивна azd окружења са Дев контејнерима и GitHub Codespaces: минимални `.devcontainer/devcontainer.json` који користи званични `ghcr.io/azure/azure-dev/azd` фичер, језичке специфичне функције, `docker-in-docker` за хостове контејнера, и `azd auth login --use-device-code` за удаљено пријављивање
- **🧩 Pulumi са azd** секција у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, распоред Pulumi фасцикле, стекови мапирани на azd окружења, обавезни излазни подаци/ознаке, и идентичан `azd up` / `azd down` радни ток
- **🎯 Смернице за избор хоста** у `docs/chapter-04-infrastructure/provisioning.md` — упутства прилагођена почетницима за `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp`, са смерницама када одабрати AKS или Azure Spring Apps
- **🛠️ Azure DevOps CI/CD водич** у `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, сервисно повезивање са workload identity federation (OIDC), генерисани `azure-dev.yml` и подешавање групе променљивих
- **🔑 Додати сервисни принципали (Шаблон 4)** у `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивно `azd auth login` са клијентским тајним у односу на федеративне/OIDC акредитиве, када користити, и безбедно чување акредитива
- **🪝 Руковање грешкама hooks-a** подсекција у `docs/chapter-04-infrastructure/deployment-guide.md` — кодови за излаз и `set -e`, `continueOnError`, тестирање hooks-а изоловано са `azd hooks run`, ОС специјални шелл-ови и `--debug`
- **👥 Тимска/заједничка окружења** секција у `docs/chapter-03-configuration/configuration.md` — шта се налази у `.azure/`, шта игнорисати у git-у, окружења по програмеру, `azd env list`/`select` и достављање вредности окруженја у CI/CD
- **🧰 Објашњења `azd restore` и проширеног `azd package`** у `resources/cheat-sheet.md` — враћање зависности и прављење деплојабилних артефаката без обављања деплоја

#### Промењено
- **🧭 Табела лекција Поглавља 4** ажурирана да укључи нову лекцију „Креирање свог шаблона“ (Лекција 3)
- **🧭 Табела лекција Поглавља 1** ажурирана да укључи нову лекцију „Дев контејнери и Кодспејс“ (Лекција 5); навигациони футери повезани између `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Попуњавање празнина за почетнике: Практична лекција о више агената, „Донеси своју апликацију“, Terraform и CI/CD водич
**Ова верзија затвара највеће празнине за комплетан почетнички водич додавањем две нове практичне лекције (водич за имплементацију више агената и додавање azd у постојећу апликацију), увод у hooks прилагођен почетницима, Terraform са azd одељак, детаљан GitHub Actions CI/CD водич, објашњење за нова прегледна проширења и изричити чек-лист за верификацију деплоја.**

#### Додато
- **🤝 Нова лекција у Поглављу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — потпуно практична и имплементабилна двоагентска лекција (оркестратор + специјалисти) користећи стварни шаблон (`contoso-creative-writer`), обухватајући када користити вишегодишње агенте, `azd up` радни ток, разумевање расподељених ресурса, праћење између агената, прилагођавање и чишћење
- **📦 Нова лекција у Поглављу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — како додати azd постојећем пројекту помоћу `azd init` („користи код у тренутном директоријуму“), разумевање `azure.yaml` и `infra/`, `azd infra generate`, откривање хоста и деплој са `azd up`
- **🌐 Terraform са azd** додата секција у `docs/chapter-04-infrastructure/provisioning.md` — конфигурација `infra.provider: terraform`, распореда `.tf` фасцикле, обавезни `AZURE_*` излазни подаци и `azd-env-name` ознаке, и идентичан `azd up` / `azd down` радни ток (затвара празнину где је подршка Terraform-a споменута али је приказан само Bicep)
- **⚙️ Детаљан GitHub Actions водич** у `docs/chapter-08-production/production-ai-practices.md` — од GitHub репозиторијума до аутоматских деплои: `azd pipeline config`, OIDC федеративне акредитиве (без чувања тајни), генерисани `azure-dev.yml` и смернице за разлику између тајни и променљивих
- **🪝 Увод „Нови сте у hooks?“** у `docs/chapter-04-infrastructure/deployment-guide.md` — шта је hook, табела корака hook-а, минимални први hook и ручно покретање hook-ова са `azd hooks run`
- **✅ Додат „Проверите свој деплој“** чек-лист у 5. кораку `docs/chapter-01-foundation/first-project.md` — smoke тест, провера здравствене тачке и јасни критеријуми успеха
- **🧩 Објашњење за нова прегледна проширења** `azure.ai.skills` и `azure.ai.connections` (шта су и кад их користити) у `docs/chapter-08-production/production-ai-practices.md`

#### Промењено
- **🧭 Табела лекција Поглавља 5** исправљена: `multi-agent-basics.md` је сада Лекција 1 (јединствена потпуно практична лекција), са искреном ознаком да је Лекција 2 у Поглављу 6 и да је сценарио трговине архитектонски план, не шаблон из једне команде
- **🧭 Табела лекција Поглавља 1** сада укључује нову лекцију „Донеси своју апликацију“ (Лекција 4)
- **🔗 Навигациони футери** ажурирани: `first-project.md` сада линкује напред ка `bring-your-own-app.md`

#### Исправљено
- **🧱 Затворена празнина „јављена али недостаје“ Terraform** — курс је раније помињао подршку Terraform-а без приказивања
- **🔀 Исправљени обмањујући међупоглављски линкови у Поглављу 5** који су имплицирали постојање потпуне имплементације више агената, док је заправо био архитектонски план

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

#### Освежавање AZD 1.25.6, Команде за цео животни циклус агената и Aspire ребрендирање

**Ова верзија поново валидира курс у односу на `azd` `1.25.6` (јун 2026) и екстензију `azure.ai.agents` `0.1.40-preview`, проширује AI упутства са "изградње агента" на цео животни циклус агента (тестирање → процена → оптимизација → инспекција → брисање), приказује нове preview екстензије `azure.ai.skills` и `azure.ai.connections`, и бележи ребрендирање производа ".NET Aspire" → "Aspire".**

#### Додато
- **🔁 Потпуна покривеност животног циклуса агента** за почетнике и AI инжењере широм документације:
  - `docs/chapter-01-foundation/azd-basics.md` — Табела животног циклуса (изградња → тестирање → мерење → побољшање → инспекција → чишћење) додата у одељак Екстензије и AI команде
  - `docs/chapter-08-production/production-ai-practices.md` — Нова секција "Управљање животним циклусом агента" која обухвата команде `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Проширене AI Agent команде са `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Нове preview екстензије** документоване: `azure.ai.skills` (поново искоришћене вештине агената) и `azure.ai.connections` (Foundry конекције) додате у табелу екстензија и льмтзу помоћи
- **⏱️ Упутства о времену одговора** — примери за `azd ai agent invoke` сада означавају да приказује укупан латенцијски и време до првог бајта
- **📌 Банер са верзијом** у коренском README који усмерава ученике на `azd version` и `azd upgrade`

#### Промене
- **✅ Основна валидизација ажурирана** са `azd 1.23.12` (март 2026) на `azd 1.25.6` (јун 2026) у свим README-има поглавља и радним упутствима
- **🤖 Напомена о екстензији у поглављу 2** ажурирана са `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Пример валидизације у радионици** (`izlaz azd version`) ажуриран на `1.25.6`
- **🧭 README "Шта је ново у azd данас"** освежен за наглашавање целокупног животног циклуса агента, нових AI екстензија и недавних побољшања квалитета животних услова (`azd init` идемпотентност, `azd auth login` чишћење застарелих токена, `azd tool` прво покретање са упитом)
- **📖 Поглавље 2 agents.md (Опција 4)** сада усмерава ученике на наредбе за животни циклус након распоређивања уместо да се зауставља на `azd up`

#### Исправљено
- **🏷️ Име производа** — додата напомена о ребрендирању Aspire (".NET Aspire" је сада једноставно "Aspire"); azd подршка за Aspire је непромењена
- **🔎 Проверена валидација уживо издања** усклађена са Azure Developer CLI фидом издања: стабилни CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Разјашњење за нове кориснике, валидација подешавања и чишћење коначних AZD команда
**Ова верзија прати AZD 1.23 валидациони преглед фокусирајући се на документацију за почетнике: разјашњава упутства за AUZD прву аутентификацију, додаје локалне скрипте за валидацију подешавања, проверава кључне команде против живог AZD CLI, и уклања последње застареле референце на команде на енглеском језику изван changelog-а.**

#### Додато
- **🧪 Скрипте за валидацију почетног подешавања** са `validate-setup.ps1` и `validate-setup.sh` да би ученици могли да потврде потребне алате пре почетка Поглавља 1
- **✅ Кораци за валидацију подешавања на почетку** у коренском README-у и README-у Поглавља 1 како би недостајући предуслови били препознати пре `azd up`

#### Промене
- **🔐 Упутства за аутентификацију за почетнике** сада доследно третирају `azd auth login` као главни пут за AZD радне токове, са `az login` означеним као опционо осим ако се директно не користе Azure CLI команде
- **📚 Ток увођења у Поглављу 1** сада води ученике да провере локално подешавање пре инсталације, аутентификације и првих корака распоређивања
- **🛠️ Поруке валидатора** сада јасно раздвајају блокирајуће захтеве од опционих упозорења Azure CLI-а за AZD-пут почетнике
- **📖 Конфигурација, решавање проблема и примероци** сада разликују између потребне AZD аутентификације и опционог Azure CLI пријављивања тамо где је раније све било приказано без контекста

#### Исправљено
- **📋 Преостале референце на команде на енглеском** ажуриране у тренутне AZD облике, укључујући `azd config show` у cheat sheet-у и `azd monitor --overview` где је намераван преглед у Azure порталу
- **🧭 Захтеви почетника у Поглављу 1** ублажени како би се избегло преуређено обећање нулте грешке или понашања враћања за све шаблоне и Azure ресурсе
- **🔎 Лива CLI валидација** потврдила тренутну подршку за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

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

#### AZD 1.23.12 Валидација, ширење окружења радионице и освежавање AI модела
**Ова верзија изводи преглед валидности документације у односу на `azd` `1.23.12`, ажурира примере застарелих AZD команди, осавремењује упутства за AI моделе према тренутним подразумеваним вредностима и шири упутства за радионице ван GitHub Codespaces-a тако да укључују dev контейнере и локалне клонове.**

#### Додато
- **✅ Напомене о валидацији широм кључних поглавља и радионичких докумената** како би се ученицима направила јасна тестирана AZD основа за коришћење новијих или старијих CLI верзија
- **⏱️ Упутства о времену рестрикције за распоређивање** дуготрајних AI апликација користећи `azd deploy --timeout 1800`
- **🔎 Кораци за инспекцију екстензија** са `azd extension show azure.ai.agents` у документима AI радног тока
- **🌐 Проширена упутства за окружење радионице** којом обухвата GitHub Codespaces, dev контейнере и локалне клонове са MkDocs-ом

#### Промене
- **📚 README увода у поглавља** сада доследно наводе валидност у односу на `azd 1.23.12` кроз оснивачке, конфигурационе, инфраструктурне, мулти-агентске, претходне распоређивање, решавање проблема и производне секције
- **🛠️ Референце AZD команди** ажуриране у тренутне облике по документацији:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` зависно од контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` тамо где се намерава преглед Application Insights-a
- **🧪 Примери preview набавке поједностављени за тренутну подршку са `azd provision --preview` и `azd provision --preview -e production`**
- **🧭 Ток радионице** ажуриран тако да ученици могу да заврше лабораторије у Codespaces, dev контејнеру или локалном клону уместо да претпоставе извршавање само у Codespaces
- **🔐 Упутства за аутентификацију** сада преферирају `azd auth login` за AZD радне токове, са `az login` позиционираним као опционално када се директно користе Azure CLI команде

#### Исправљено
- **🪟 Windows команде за инсталацију** нормализоване у складу са тренутним великим и малим словима у `winget` пакету у упутству за инсталацију
- **🐧 Руковање инсталацијом на Linux-у** исправљено да избегне неподржане дистро-специфичне `azd` упуте пакет менаџера и уместо тога усмерава на релизне асете када је прикладно
- **📦 Примери AI модела** освежени са старијих подразумеваних као што су `gpt-35-turbo` и `text-embedding-ada-002` на тренутне као што су `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Снипети за распоређивање и дијагностику** исправљени за коришћење тренутних команди за окружење и статус у логовима, скриптама и корацима решавања проблема
- **⚙️ Упутства за GitHub Actions** ажурирана са `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Упутства за MCP/Copilot сагласност** ажурирана са `azd mcp consent` на `azd copilot consent list`

#### Побољшано
- **🧠 Упутства за AI поглавље** сада боље објашњавају понашање preview осетљивости `azd ai`, пријаву по закупцу, тренутну употребу екстензија и ажуриране препоруке за распоређивање модела
- **🧪 Упутства за радионице** сада користе реалистичније примере верзија и јаснији језик подешавања окружења за практичне лабораторије
- **📈 Документација за производњу и решавање проблема** сада боље одговара тренутним мониторинг, моделима за пад функције и примерима трошкова

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

#### AZD AI CLI команде, валидација садржаја и ширење шаблона
**Ова верзија додаје покривеност команде `azd ai`, `azd extension` и `azd mcp` кроз сва AI повезана поглавља, исправља покварене линкове и застарели код у agents.md, ажурира cheat sheet и у потпуности преуређује одељак Пример шаблона са потврђеним описима и новим Azure AI AZD шаблонима.**

#### Додато
- **🤖 Покривеност AZD AI CLI** кроз 7 датотека (раније само у Поглављу 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нова секција "Екстензије и AI команде" која уводи `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опција 4: `azd ai agent init` са упоредном табелом (шаблон против приступа манифестом)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Одељци "AZD екстензије за Foundry" и "Деплој агента прво"

  - `docs/chapter-05-multi-agent/README.md` — Брз почетак сада приказује и шаблон и путеве засноване на манифесту за распореда
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секција Распоређивање сада укључује опцију `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Пододељак „AZD AI команде за дијагностику“
  - `resources/cheat-sheet.md` — Нова секција „AI & екстензије команде“ са `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Нови AZD AI примери шаблона** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат са Blazor WebAssembly, Semantic Kernel и подршка за гласовни чат
  - **azure-search-openai-demo-java** — Java RAG чат користећи Langchain4J са ACA/AKS опцијама распореда
  - **contoso-creative-writer** — Мулти-агент апликација за креативно писање користећи Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Безсерверски RAG користећи Azure Functions + LangChain.js + Cosmos DB са Ollama подршком за локални развој
  - **chat-with-your-data-solution-accelerator** — Ентерпрајз RAG акцелератор са админ портал, Teams интеграцијом и PostgreSQL/Cosmos DB опциjама
  - **azure-ai-travel-agents** — Мулти-агент MCP оркестрацијa референтна апликација са серверима у .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимални Azure AI инфраструктурни Bicep старт шаблон
  - **🔗 Одличан AZD AI Галеријски линк** — Референца на [awesome-azd AI галерију](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблона)

#### Исправљено
- **🔗 навигација у agents.md**: Линкови Претходно/Следеће сада одговарају редоследу лекција у README поглавља 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 покварени линкови у agents.md**: `production-ai-practices.md` исправљено у `../chapter-08-production/production-ai-practices.md` (3 појаве)
- **📦 застарели код у agents.md**: Замењен `opencensus` са `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 неважећи API у agents.md**: Померање `max_tokens` из `create_agent()` у `create_run()` као `max_completion_tokens`
- **🔢 бројaње токена у agents.md**: Замењена приближна процена `len//4` са `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправљене услуге са „Когнитивно претраживање + App Service“ у „Azure AI Search + Azure Container Apps“ (подразумевани хост промењен у октобру 2024)
- **contoso-chat**: Ажуриран опис да реферише Azure AI Foundry + Prompty, у складу са стварним називом и технолошким стеком репозиторијума

#### Укључено
- **ai-document-processing**: Уклонио референцу на нефункционални шаблон (репо није јавно доступан као AZD шаблон)

#### Побољшано
- **📝 вежбе у agents.md**: Вежба 1 сада показује очекивани излаз и корак `azd monitor`; Вежба 2 укључује комплетан код регистрације `FunctionTool`; Вежба 3 замењује нејасна упутства конкретним командама `prepdocs.py`
- **📚 ресурси у agents.md**: Ажурирани документи линкови ка тренутним Azure AI Agent Service документацијама и брзом почетку
- **📋 табела Следећи кораци у agents.md**: Додат линк за AI Workshop Lab за потпуну покривеност поглавља

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

#### Побољшана навигација кроз курс
**Ова верзија побољшава навигацију по README.md поглављима са унапређеним форматом табеле.**

#### Измењено
- **Табела курса**: Унапређена са директним линковима ка лекцијама, проценама трајања и оценама сложености
- **Чишћење фолдера**: Уклоњени вишкови стари фолдери (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Валидација линкова**: Верификовано свих 21+ интерних линкова у табели курса

### [v3.16.0] - 2026-02-05

#### Ажурирања имена производа
**Ова верзија ажурира референце производа према тренутном Microsoft брендирању.**

#### Измењено
- **Microsoft Foundry → Microsoft Foundry**: Свe референце ажуриране у не-преводним фајловима
- **Azure AI Agent Service → Foundry Agents**: Име услуге ажурирано да одражава тренутни бренд

#### Ажурирани фајлови
- `README.md` - Главна почетна страна курса
- `changelog.md` - Историја верзија
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Водич за AI агенте
- `examples/README.md` - Документација за примере
- `workshop/README.md` - Почетна страница радионице
- `workshop/docs/index.md` - Индекс радионице
- `workshop/docs/instructions/*.md` - Сви инструкцијски фајлови радионице

---

### [v3.15.0] - 2026-02-05

#### Велика реструктурирација репозиторијума: Поглавља као имена фасцикли
**Ова верзија реструктурира документацију у посебне фасцикле по поглављима ради лакше навигације.**

#### Промене имена фасцикли
Стари фолдери замењени су новим фолдерима са бројевима поглавља:
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
| Сви фајлови из pre-deployment/ | pre-deployment/ | chapter-06-pre-deployment/ |
| Сви фајлови из troubleshooting/ | troubleshooting/ | chapter-07-troubleshooting/ |

#### Додато
- **📚 README фајлови по поглављима**: Креирани README.md у сваком поглављу са:
  - Циљевима учења и трајањем
  - Табелом лекција са описима
  - Командама за брзи почетак
  - Навигацијом ка другим поглављима

#### Измењено
- **🔗 Ажурирани сви интерни линкови**: 78+ пута ажурирани путеви кроз све документационе фајлове
- **🗺️ Главни README.md**: Ажурирана мапа курса са новом структуром поглавља
- **📝 examples/README.md**: Ажуриране интерне референце према фолдерима поглавља

#### Уклоњено
- Стари фолдери (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктурирање репозиторијума: Навигација по поглављима
**Ова верзија је додала README фајлове за навигацију по поглављима (претеча верзије v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Нови водич за AI агенте
**Ова верзија додаје свеобухватан водич за распореда AI агената помоћу Azure Developer CLI.**

#### Додато
- **🤖 docs/microsoft-foundry/agents.md**: Комплетан водич који покрива:
  - Шта су AI агенти и како се разликују од четботова
  - Три шаблона за брзи почетак агената (Foundry Agents, Prompty, RAG)
  - Обрасци архитектуре агената (један агент, RAG, мулти-агент)
  - Конфигурација и прилагођавање алата
  - Праћење и метрике
  - Разматрања трошкова и оптимизација
  - Чести сценарији решавања проблема
  - Три практичне вежбе са критеријумима успеха

#### Структура садржаја
- **Увод**: Пojмови агената за почетнике
- **Брзи почетак**: Распоређивање агената са `azd init --template get-started-with-ai-agents`
- **Обрасци архитектуре**: Визуелни дијаграми образаца агената
- **Конфигурација**: Подешавање алата и променљиве окружења
- **Праћење**: Интеграција са Application Insights
- **Вежбе**: Прогресивно практично учење (20-45 минута по вежби)

---

### [v3.12.0] - 2026-02-05

#### Ажурирање DevContainer окружења
**Ова верзија ажурира конфигурацију развојног контејнера савременим алатима и бољим подразумеваним подешавањима за AZD искуство учења.**

#### Измењено
- **🐳 Основна слика**: Ажурирана са `python:3.12-bullseye` на `python:3.12-bookworm` (најновији стабилни Debian)
- **📛 Име контејнера**: Преименовано са „Python 3“ у „AZD for Beginners“ ради јасноће

#### Додато
- **🔧 Нове функције Dev Container-а**:
  - `azure-cli` са омогућеном подршком за Bicep
  - `node:20` (LTS верзија за AZD шаблоне)
  - `github-cli` за управљање шаблонима
  - `docker-in-docker` за распореде контејнер апликација

- **🔌 Прослеђивање портова**: Унапред подешени портови за уобичајени развој:
  - 8000 (преглед MkDocs)
  - 3000 (веб апликације)
  - 5000 (Python Flask)
  - 8080 (API-ји)

- **🧩 Нови VS Code екстензије**:
  - `ms-python.vscode-pylance` - Побољшана Python интелисенција
  - `ms-azuretools.vscode-azurefunctions` - Подршка за Azure Functions
  - `ms-azuretools.vscode-docker` - Подршка за Docker
  - `ms-azuretools.vscode-bicep` - Подршка за Bicep језик
  - `ms-azure-devtools.azure-resource-groups` - Управљање Azure ресурсима
  - `yzhang.markdown-all-in-one` - Уређивање Markdown-а
  - `DavidAnson.vscode-markdownlint` - Markdown линтинг
  - `bierner.markdown-mermaid` - Подршка за Mermaid дијаграме
  - `redhat.vscode-yaml` - Подршка за YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуализација Git-а
  - `mhutchie.git-graph` - Git историја

- **⚙️ Подешавања VS Code**: Додати подразумевани параметри за Python интерпретер, форматирање при чувању и уклањање вишка размaka

- **📦 Ажуриран requirements-dev.txt**:
  - Додат MkDocs minify плугин
  - Додат pre-commit за квалитет кода
  - Додати Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Исправљено
- **Команда после креирања**: Сада проверава инсталацију AZD и Azure CLI-а при покретању контејнера

---

### [v3.11.0] - 2026-02-05

#### Ревизија README за почетнике
**Ова верзија значајно побољшава README.md да буде приступачнија почетницима и додаје битне ресурсе за AI програмере.**

#### Додато
- **🆚 Поређење Azure CLI и AZD**: Јасно објашњење када користити који алат са практичним примерима
- **🌟 Одлични AZD линкови**: Директни линкови ка галерији шаблона заједнице и ресурсима за допринос:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ спремних за распореда шаблона
  - [Пошаљи шаблон](https://github.com/Azure/awesome-azd/issues) - Заједнички допринос
- **🎯 Водич за брзи почетак**: Једноставна секција са 3 корака (Инсталирај → Пријави се → Распореди)
- **📊 Табела навигације базиране на искуству**: Јасна упутства о томе где почети према искуству програмера

#### Измењено
- **Структура README**: Репродукована за прогресивно откривање - најважније информације прво
- **Уводни део**: Прерађен да објасни „Магију `azd up`“ за потпуне почетнике
- **Уклоњени дупликат садржаја**: Укинута дупликатна секција за решавање проблема
- **Команде за решавање проблема**: Исправљена референца `azd logs` да користи валидну `azd monitor --logs`

#### Исправљено

- **🔐 Команде за аутентификацију**: Додато `azd auth login` и `azd auth logout` у cheat-sheet.md
- **Неважеће референце команди**: Уклонили преостале `azd logs` из одељка за решавање проблема у README

#### Напомене
- **Обим**: Промене примене на главни README.md и resources/cheat-sheet.md
- **Циљна публика**: Побољшања посебно намењена програмерима новим у AZD

---

### [v3.10.0] - 2026-02-05

#### Ажурирање тачности команди у Azure Developer CLI
**Ова верзија исправља не постојеће AZD команде кроз целу документацију, осигуравајући да сви примери кода користе важећу Azure Developer CLI синтаксу.**

#### Исправљено
- **🔧 Уклоњене не постојеће AZD команде**: Комплетан преглед и исправка неважећих команди:
  - `azd logs` (не постоји) → замењено са `azd monitor --logs` или Azure CLI алтернативама
  - подкоманде `azd service` (не постоје) → замењене са `azd show` и Azure CLI
  - `azd infra import/export/validate` (не постоје) → уклоњене или замењене важећим алтернативама
  - означавања `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не постоје) → уклоњена
  - означавања `azd provision --what-if/--rollback` (не постоје) → ажурирана на `--preview`
  - `azd config validate` (не постоји) → замењено са `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не постоје) → уклоњене

- **📚 Датотеке ажуриране са исправкама команди**:
  - `resources/cheat-sheet.md`: Главна ревизија референци команди
  - `docs/deployment/deployment-guide.md`: Поправљене стратегије враћања и распоређивања
  - `docs/troubleshooting/debugging.md`: Исправљени делови за анализу логова
  - `docs/troubleshooting/common-issues.md`: Ажуриране команде за решавање проблема
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљен део за отклањање грешака AZD
  - `docs/getting-started/azd-basics.md`: Исправљене команде за праћење
  - `docs/getting-started/first-project.md`: Ажурирани примери праћења и отклањања грешака
  - `docs/getting-started/installation.md`: Исправљени примери помоћи и верзије
  - `docs/pre-deployment/application-insights.md`: Исправљене команде за преглед логова
  - `docs/pre-deployment/coordination-patterns.md`: Исправљене команде за отклањање грешака агента

- **📝 Ажурирана референца верзије**: 
  - `docs/getting-started/installation.md`: Промена тврдокодиране верзије `1.5.0` у општу `1.x.x` са линком ка издањима

#### Промењено
- **Стратегије враћања**: Ажурирана документација за коришћење враћања базираног на Gitu (AZD нема уграђено враћање)
- **Преглед логова**: Замењени референце `azd logs` са `azd monitor --logs`, `azd monitor --live` и Azure CLI командама
- **Одељак о перформансама**: Уклоњена означавања паралелног/инкременталног распоређивања која не постоје, обезбеђене важеће алтернативе

#### Технички детаљи
- **Важеће AZD команде**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Важећа означавања azd monitor**: `--live`, `--logs`, `--overview`
- **Уклоњене функције**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Напомене
- **Потврда**: Команде верификоване према Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завршетак радионице и ажурирање квалитета документације
**Ова верзија комплетира интерактивне модуле радионице, поправља све покварене везе у документацији и побољшава укупни квалитет садржаја за AI програмере који користе Microsoft AZD.**

#### Додато
- **📝 CONTRIBUTING.md**: Нови документ са смерницама за допринос:
  - Јасна упутства за пријаву проблема и предложене измене
  - Стандарди документације за нови садржај
  - Смернице за примере кода и конвенције порука комита
  - Информације о укључивању заједнице

#### Завршено
- **🎯 Модул радионице 7 (Завршетак)**: Потпуно завршен завршни модул са:
  - Комплетан резиме достигнућа радионице
  - Секција кључних овладавања о AZD, шаблонима и Microsoft Foundry
  - Препоруке за наставак пута учења
  - Вежбе изазова радионице са оценама тежине
  - Повратне информације заједнице и линкови за подршку

- **📚 Модул радионице 3 (Деконструкција)**: Ажурирани циљеви учења са:
  - Упутства за активацију GitHub Copilot са MCP серверима
  - Разумевање структуре фолдера AZD шаблона
  - Обрасци организације инфраструктуре-код-а (Bicep)
  - Упутства за практичне лабораторијске вежбе

- **🔧 Модул радионице 6 (Распакивање)**: Завршен са:
  - Циљевима чишћења ресурса и управљања трошковима
  - Коришћење `azd down` за безбедно де-провизионално уклањање инфраструктуре
  - Упутства за опоравак меко избрисаних когнитивних услуга
  - Додатни задаци за истраживање GitHub Copilot и Azure Portal

#### Исправљено
- **🔗 Поправке покварених веза**: Решено више од 15 покварених интерних веза у документацији:
  - `docs/ai-foundry/ai-model-deployment.md`: Поправљени путеви ка microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправљени путеви ka ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замењен не постојећи cicd-integration.md са deployment-guide.md
  - `examples/retail-scenario.md`: Исправљени путеви у FAQ и водичу за решавање проблема
  - `examples/container-app/microservices/README.md`: Исправљени путеви курса и водича за распоређивање
  - `resources/faq.md` и `resources/glossary.md`: Ажуриране референце поглавља везаних за AI
  - `course-outline.md`: Исправљене референце за водич инструктора и лабораторијске радове AI радионице

- **📅 Банер статуса радионице**: Ажурирано из "У изградњи" у активан статус радионице са датумом фебруар 2026

- **🔗 Навигација радионице**: Поправљене покварене навигационе везе у workshop README.md које су водиле ка не постојећем фолдеру lab-1-azd-basics

#### Промењено
- **Презентација радионице**: Уклоњено упозорење "у изградњи", радионица је сада комплетна и спремна за коришћење
- **Конзистентност навигације**: Осигурана правилна навигација између свих модула радионице
- **Референце пута учења**: Ажуриране међупоглављенске референце користе исправне microsoft-foundry путеве

#### Верификовано
- ✅ Све енглеске markdown датотеке имају важеће интерне везе
- ✅ Модули радионице 0-7 су комплетни са циљевима учења
- ✅ Навигација између поглавља и модула функционише исправно
- ✅ Садржај је прикладан за AI програмере који користе Microsoft AZD
- ✅ Одржан је пријатељски језик за почетнике и структура кроз цео садржај
- ✅ CONTRIBUTING.md пружа јасна упутства за доприносиоце заједнице

#### Техничка имплементација
- **Валидација веза**: Аутоматизовани PowerShell скрипт проверио све .md интерне везе
- **Аудит садржаја**: Руководни преглед потпуности радионице и прикладности за почетнике
- **Навигациони систем**: Примењени конзистентни обрасци навигације поглавља и модула

#### Напомене
- **Обим**: Промене примене само на енглеску документацију
- **Преводи**: Фолдери за преводе нису ажурирани у овој верзији (аутоматизовани превод ће се ускоро синхронизовати)
- **Трајање радионице**: Комплетна радионица сада пружа 3-4 сата практичног учења

---

### [v3.8.0] - 2025-11-19

#### Напредна документација: Мониторинг, Безбедност и Обрасци за вишеструке агенте
**Ова верзија додаје свеобухватне лекције А-квалитета о интеграцији Application Insights, обрасцима аутентификације и координацији више агената за продукцијска распоређивања.**

#### Додато
- **📊 Лекција о интеграцији Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - Распоређивање усредсређено на AZD са аутоматским провизионисањем
  - Комплетни Bicep шаблони за Application Insights + Log Analytics
  - Радне Python апликације са прилагођеном телеметријом (више од 1,200 линија)
  - Обрасци за мониторинг AI/LLM-а (пративање токена/трошкова Microsoft Foundry модела)
  - 6 Mermaid дијаграма (архитектура, дистрибуирано праћење, ток телеметрије)
  - 3 практичне вежбе (аларми, контролне табле, AI мониторинг)
  - Примери Kusto упита и стратегије оптимизације трошкова
  - Стриминг уживо метрика и дебаговање у реалном времену
  - Време учења 40-50 минута са шаблонима спремним за продукцију

- **🔐 Лекција о аутентификацији и безбедносним обрасцима**: у `docs/getting-started/authsecurity.md`:
  - 3 обрасца аутентификације (конекцијски стрингови, Key Vault, управљани идентитет)
  - Комплетни Bicep шаблони инфраструктуре за безбедна распоређивања
  - Node.js апликациони код са интеграцијом Azure SDK
  - 3 комплетне вежбе (омогућавање управљаног идентитета, кориснички додељен идентитет, ротирање Key Vault)
  - Најбоље праксе безбедности и RBAC конфигурације
  - Водич за решавање проблема и анализа трошкова
  - Обрасци аутентификације без лозинке спремни за продукцију

- **🤖 Лекција о обрасцима координације вишеструких агената**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 образаца координације (секвенцијално, паралелно, хијерархијско, догађајно покренуто, консензус)
  - Целокупна имплементација оркестратора сервиса (Python/Flask, више од 1,500 линија)
  - 3 специјализоване имплементације агената (Истраживач, Писац, Уредник)
  - Интеграција Service Bus-а за редовање порука
  - Управљање стањем у Cosmos DB за дистрибуиране системе
  - 6 Mermaid дијаграма приказују интеракције агената
  - 3 напредне вежбе (руковање временским роком, логика поновног покушаја, прекидач кола)
  - Израчунавање трошкова ($240-565/месечно) са стратегијама оптимизације
  - Интеграција Application Insights за мониторинг

#### Побољшано
- **Поглавље пре распоређивања**: Сада укључује свеобухватне обрасце мониторинга и координације
- **Поглавље за почетнике**: Побољшано професионалним обрасцима аутентификације
- **Спремност за продукцију**: Потпуна покривеност од безбедности до опсервабилности
- **Оквир курса**: Ажуриран за нове лекције у Поглављима 3 и 6

#### Промењено
- **Напредак учења**: Побољшана интеграција безбедности и мониторинга кроз цео курс
- **Квалитет документације**: Конзистентни стандарди А-квалитета (95-97%) кроз нове лекције
- **Обрасци за продукцију**: Потпуна крајња покривеност за ентерпрајз распоређивања

#### Унапређено
- **Искуство програмера**: Јасан пут од развоја до продукцијског мониторинга
- **Безбедносни стандарди**: Професионални обрасци за управљање аутентификацијом и тајнама
- **Опсервабилност**: Потпуна интеграција Application Insights са AZD
- **AI радни оптерећења**: Специјализовани мониторинг за Microsoft Foundry моделе и вишеструке системе агената

#### Верификовано
- ✅ Све лекције укључују комплетан радни код (не само исечке)
- ✅ Mermaid дијаграми за визуелно учење (укупно 19 у три лекције)
- ✅ Практичне вежбе са корацима верификације (укупно 9)
- ✅ Шаблони Bicep спремни за продукцију који се могу распоредити помоћу `azd up`
- ✅ Анализа трошкова и стратегије оптимизације
- ✅ Водичи за решавање проблема и најбоље праксе
- ✅ Контролне тачке знања са командама за верификацију

#### Резултати оцењивања документације
- **docs/pre-deployment/application-insights.md**: - Свеобухватан водич за мониторинг
- **docs/getting-started/authsecurity.md**: - Професионални безбедносни обрасци
- **docs/pre-deployment/coordination-patterns.md**: - Напредне архитектуре вишеструких агената
- **Укупни нови садржај**: - Конзистентни високи стандарди квалитета

#### Техничка имплементација
- **Application Insights**: Log Analytics + прилагођена телеметрија + дистрибуирано праћење
- **Аутентификација**: Управљани идентитет + Key Vault + RBAC обрасци
- **Вишеструки агенти**: Service Bus + Cosmos DB + Container Apps + оркестрација
- **Мониторинг**: Метрике уживо + Kusto упити + аларми + контролне табле
- **Управљање трошковима**: Стратегије узорковања, политике задржавања, контроле буџета

### [v3.7.0] - 2025-11-19

#### Побољшања квалитета документације и нови пример Microsoft Foundry модела
**Ова верзија побољшава квалитет документације у целом репозиторијуму и додаје комплетан пример распоређивања Microsoft Foundry модела са интерфејсом за разговор gpt-4.1.**

#### Додато
- **🤖 Пример разговора Microsoft Foundry модела**: Потпуно распоређивање gpt-4.1 са радном имплементацијом у `examples/azure-openai-chat/`:
  - Потпуна инфраструктура Microsoft Foundry модела (распоређивање gpt-4.1 модела)
  - Python интерфејс за разговор командне линије са историјом разговора
  - Интеграција Key Vault-а за безбедно чување API кључа
  - Праћење коришћења токена и процена трошкова
  - Ограничење брзине и руковање грешкама
  - Свеобухватан README са водичем за распоређивање од 35-45 минута
  - 11 датотека спремних за продукцију (Bicep шаблони, Python апликација, конфигурација)
- **📚 Вежбе документације**: Додате практичне вежбе упутства за конфигурацију:
  - Вежба 1: Мулти-окружење конфигурација (15 минута)
  - Вежба 2: Практична вежба управљања тајнама (10 минута)
  - Јасна критерија успеха и кораци провере
- **✅ Верификација распоређивања**: Додат одељак за верификацију у водич за распоређивање:
  - Процедуре провере здравља
  - Контролна листа критеријума успеха
  - Очекивани резултати за све команде распоређивања
  - Брзи референтни водич за решавање проблема

#### Побољшано
- **examples/README.md**: Ажуриран на А-квалитет (93%):
  - Додат azure-openai-chat у све релевантне секције
  - Ажуриран број локалних примера са 3 на 4
  - Додат у табелу примера AI апликација
  - Интегрисан у Quick Start за средње кориснике
  - Додат у одељак Microsoft Foundry шаблона
  - Ажурирана Матрица поређења и одељци за проналажење технологије
- **Квалитет документације**: Побољшано са B+ (87%) → A- (92%) у фолдеру docs:

  - Додати очекивани излаз у примерима кључних команда
  - Укључени кораци верификације за промене конфигурације
  - Побољшано практично учење уз практичне вежбе

#### Промењено
- **Прогрес учења**: Боља интеграција AI примера за средњи ниво
- **Структура документације**: Више корисних вежби са јасним исходима
- **Процес верификације**: Додати јасни критеријуми успеха за кључне токове рада

#### Побољшано
- **Искуство програмера**: Распоређивање модели Microsoft Foundry сада траје 35-45 минута (уместо 60-90 за комплексније алтернативе)
- **Прозирност трошкова**: Јасне процене трошкова (50-200 долара месечно) за пример Microsoft Foundry модела
- **Путања учења**: AI програмери имају јасну улазну тачку са azure-openai-chat
- **Стандарди документације**: Конзистентан очекивани излаз и кораци верификације

#### Потврђено
- ✅ Пример Microsoft Foundry модела потпуно функционалан са `azd up`
- ✅ Сва 11 датотека имплементације синтаксички исправна
- ✅ Упутства у README-у се поклапају са стварним искуством распореда
- ✅ Линкови у документацији ажурирани на више од 8 локација
- ✅ Индекс примера тачно одражава 4 локална примера
- ✅ Нема дуплих спољних линкова у табелама
- ✅ Све навигационе референце тачне

#### Техничка имплементација
- **Архитектура Microsoft Foundry модела**: gpt-4.1 + Key Vault + Container Apps шема
- **Безбедност**: Спремна Managed Identity, тајне у Key Vault-у
- **Надгледање**: Интеграција Application Insights-а
- **Управљање трошковима**: Пратиње токена и оптимизација употребе
- **Распоређивање**: Једна команда `azd up` за комплетно подешавање

### [v3.6.0] - 2025-11-19

#### Велика новина: Примери распореда Container апликација
**Ова верзија доноси свеобухватне, спремне за производњу примере распореда контејнерских апликација користећи Azure Developer CLI (AZD), са потпуним упутствима и интеграцијом у путању учења.**

#### Додато
- **🚀 Примери Container апликација**: Нови локални примери у `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Комплетан преглед контејнерских распореда, брзи почетак, прoизводња и напредне шеме
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Пријатељски REST API за почетнике са scale-to-zero, health probes, мониторингом и решавањем проблема
  - [Архитектура микросервиса](../../examples/container-app/microservices): Спреман за производњу мультисервисни распоред (API Gateway, Product, Order, User, Notification), асинхрона размена порука, Service Bus, Cosmos DB, Azure SQL, дистрибуирано праћење, blue-green/canary деплојмент
- **Најбоље праксе**: Безбедност, мониторинг, оптимизација трошкова и смернице за CI/CD за контејнерске радне оптерећења
- **Примери кода**: Комплетан `azure.yaml`, Bicep шаблони и имплементације сервиса на више језика (Python, Node.js, C#, Go)
- **Тестирање и решавање проблема**: Сценарији енд-то-енд тестирања, команде за мониторинг, смернице за решавање проблема

#### Промењено
- **README.md**: Ажуриран да приказује и повезује нове примере container апликација под "Локални примери - Container апликације"
- **examples/README.md**: Ажуриран да истакне примере container апликација, дода унос у поређењу матрице и ажурира технологије/архитектуре
- **Садржај курса & Водич за учење**: Ажурирани да садрже референце на нове примере container апликација и шеме распореда у релевантним поглављима

#### Потврђено
- ✅ Сви нови примери се могу распоредити са `azd up` и прате најбоље праксе
- ✅ Крос-линкови у документацији и навигација ажурирани
- ✅ Примери покривају сценарије од почетничких до напредних, укључујући производне микросервисе

#### Напомене
- **Опсег**: Само документација и примери на енглеском језику
- **Следећи кораци**: Проширити додатним напредним шемама за container и CI/CD аутоматизацијом у будућим верзијама

### [v3.5.0] - 2025-11-19

#### Променa имена производа: Microsoft Foundry
**Ова верзија имплементира свеобухватну промену имена производа са "Microsoft Foundry" у "Microsoft Foundry" у целој енглеској документацији, одражавајући званични ребренд Microsoft-а.**

#### Промењено
- **🔄 Ажурирање имена производа**: Потпуна промена имена са "Microsoft Foundry" у "Microsoft Foundry"
  - Ажуриране све референце у енглеској документацији у фолдеру `docs/`
  - Преименован фолдер: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименована датотека: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Укупно: 23 референце садржаја ажуриране у 7 документациjских датотека

- **📁 Промене у структури фолдера**:
  - `docs/ai-foundry/` преименован у `docs/microsoft-foundry/`
  - Све крос-референце ажуриране да одражавају нову структуру фолдера
  - Навигациони линкови верификовани у целој документацији

- **📄 Преименовања датотека**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Сви интерни линкови ажурирани да реферирају ново име датотеке

#### Ажуриране датотеке
- **Поглавља у документацији** (7 фајлова):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ажурирања навигационих линкова
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ажурирања референци имена производа
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Већ користи Microsoft Foundry (од претходних ажурирања)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ажурирања референци (преглед, повратне информације заједнице, документација)
  - `docs/getting-started/azd-basics.md` - 4 ажурирања крос-референци
  - `docs/getting-started/first-project.md` - 2 ажурирања навигационих линкова поглавља
  - `docs/getting-started/installation.md` - 2 ажурирања линкова за следеће поглавље
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ажурирања референци (навигација, Discord заједница)
  - `docs/troubleshooting/common-issues.md` - 1 ажурирани навигациони линк
  - `docs/troubleshooting/debugging.md` - 1 ажурирани навигациони линк

- **Фајлови структуре курса** (2 фајла):
  - `README.md` - 17 ажурираних референци (преглед курса, наслови поглавља, одељак шаблона, увид у заједницу)
  - `course-outline.md` - 14 ажурираних референци (преглед, циљеви учења, ресурси поглавља)

#### Потврђено
- ✅ Ниједна преостала "ai-foundry" путања у енглеској документациjи
- ✅ Ниједна преостала референца на производ "Microsoft Foundry" у енглеској документациjи
- ✅ Сви навигациони линкови функционални са новом структуром фолдера
- ✅ Преименовања фајлова и фолдера успешно извршена
- ✅ Крос-референце између поглавља проверене

#### Напомене
- **Опсег**: Промене су примењене само у енглеској документациjи у фолдеру `docs/`
- **Преводи**: Фолдери за преводе (`translations/`) нису ажурирани у овој верзиjи
- **Радионца**: Материјали за радионице (`workshop/`) нису ажурирани у овој верзиjи
- **Примери**: Пример фајлови могу још увек имати старе називе (биће решено у будућем ажурирању)
- **Спољни линкови**: Спољни URL-ови и референце GitHub репозиторијума остају непромењени

#### Водич за миграцију за сараднике
Ако имате локалне гране или документацију која реферира стару структуру:
1. Ажурирајте референце фолдера: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ажурирајте референце датотека: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените име производа: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверите да сви интерни линкови у документацији и даље функционишу

---

### [v3.4.0] - 2025-10-24

#### Побољшања у инфраструктурној прегледу и валидацији
**Ова верзија уводи свеобухватну подршку за нову preview функцију Azure Developer CLI-а и побољшава корисничко искуство радионице.**

#### Додато
- **🧪 Документација за функцију azd provision --preview**: Свеобухватно покривање нове могућности инфраструктурног прегледа
  - Референце команда и примери употребе у брзом прегледу
  - Детаљна интеграција у водич за провизију са случајевима употребе и предностима
  - Интеграција прелиминарне провере за безбеднију валидацију распореда
  - Ажурирања у водичу за почетак рада са праксом безбедног распореда
- **🚧 Банер статуса радионице**: Професионални HTML банер који показује статус развоја радионице
  - Градијентни дизајн са индикаторима изградње за јасну комуникацију корисницима
  - Време последњег ажурирања ради транспарентности
  - Дизајн прилагођен мобилним уређајима

#### Побољшано
- **Безбедност инфраструктуре**: Функција preview интегрисана кроз документацију распореда
- **Валидација пре распореда**: Аутоматизовани скрипти сада укључују тестирање preview инфраструктуре
- **Радни ток за програмере**: Азуриране низа команда да укључе preview као најбољу праксу
- **Искуство на радионици**: Јасно постављена очекивања за кориснике о статусу развоја садржаја

#### Промењено
- **Најбоље праксе распореда**: Препоручен приступ са preview на првом месту
- **Ток документације**: Потврда инфраструктуре померена раније у процесу учења
- **Презентација радионице**: Професионална комуникација статуса са јасним временским оквиром развоја

#### Побољшано
- **Приступ првенства безбедности**: Промене инфраструктуре сада могу да се верификују пре распореда
- **Тимска сарадња**: Резултати preview могу се делити ради прегледа и одобрења
- **Свесност о трошковима**: Боље разумевање трошкова ресурса пре провизије
- **Умањење ризика**: Смањење пада распореда кроз унапред верификацију

#### Техничка имплементација
- **Интеграција у више докумената**: Функција preview документована у 4 кључна фајла
- **Обрасци команда**: Конзистентна синтакса и примери кроз документацију
- **Интеграција најбољих пракси**: Preview укључен у токове валидације и скрипте
- **Визуелни индикатори**: Јасне ознаке НОВЕ функције ради лакшег откривања

#### Инфраструктура радионице
- **Комуникација статуса**: Професионални HTML банер са градијентним стилом
- **Корисничко искуство**: Јасан статус развоја спречава конфузију
- **Професионална презентација**: Одржава кредибилитет репозиторијума уз постављање очекивања
- **Транспарентност временског оквира**: Датум последњег ажурирања октобар 2025 за одговорност

### [v3.3.0] - 2025-09-24

#### Побољшани материјали радионице и интерактивно искуство учења
**Ова верзија доноси свеобухватне материјале радионице са прегледом у прегледачу заснованим на MkDocs и структурираном путањом учења.**

#### Додато
- **🎥 Интерактивни водич за радионицу**: Искуство радионице у прегледачу са могућношћу прегледа MkDocs-а
- **📝 Структурисана упутства за радионицу**: 7-степени водич кроз учење од открића до прилагођавања
  - 0-Увод: Преглед радионице и подешавање
  - 1-Избор AI шаблона: Процес открића и избора шаблона
  - 2-Валидација AI шаблона: Процедуре распореда и провере
  - 3-Деконструкција AI шаблона: Разумевање архитектуре шаблона
  - 4-Конфигурисање AI шаблона: Конфигурација и прилагођавање
  - 5-Прилагођавање AI шаблона: Напредне измене и итерације
  - 6-Рачунање инфраструктуре: Чишћење и управљање ресурсима
  - 7-Закључак: Резиме и следећи кораци
- **🛠️ Алати за радионицу**: MkDocs конфигурација са Material темом за побољшано искуство учења
- **🎯 Путања за практично учење**: 3-степена методологија (Откривање → Распоређивање → Прилагођавање)
- **📱 Интеграција GitHub Codespaces**: Беспрекорно подешавање развојног окружења

#### Побољшано
- **AI радионица у лабораторији**: Продужено са свеобухватним 2-3 сата структурисаног искуства учења
- **Документација радионице**: Професионална презентација са навигацијом и визуелним средствима
- **Прогрес учења**: Јасна упутства корак по корак од избора шаблона до распореда у производњу
- **Искуство програмера**: Интегрисани алати за поједностављене токове развоја

#### Побољшано
- **Приступачност**: Интерфејс у прегледачу са претрагом, функцијом копирања и променом теме
- **Само вођено учење**: Флексибилна структура радионице која одговара различитим темпом учења
- **Практична примена**: Сценарији распореда AI шаблона у стварном свету
- **Интеграција заједнице**: Интеграција Discord-а за подршку и сарадњу на радионици

#### Карактеристике радионице
- **Уграђена претрага**: Брзо проналажење по кључним речима и лекцијама
- **Копирање блокова кода**: Функција копирања покретом миша за све примере кода
- **Промена теме**: Подршка за тамни/светли режим по жељи
- **Визуелни материјали**: Снимци екрана и дијаграми за побољшано разумевање
- **Интеграција помоћи**: Директан приступ Discord заједници ради подршке

### [v3.2.0] - 2025-09-17

#### Велика реструктурирања навигације и систем учења заснован на поглављима
**Ова верзија уводи свеобухватну структуру учења по поглављима са побољшаном навигацијом у целом репозиторијуму.**

#### Додато
- **📚 Систем учења заснован на поглављима**: Цели курс реорганизован у 8 прогресивних поглавља учења
  - Поглавље 1: Оснoве и брзи почетак (⭐ - 30-45 минута)
  - Поглавље 2: AI-први развој (⭐⭐ - 1-2 сата)
  - Поглавље 3: Конфигурација и аутентификација (⭐⭐ - 45-60 минута)
  - Поглавље 4: Инфраструктура као код и распоред (⭐⭐⭐ - 1-1.5 сати)
  - Поглавље 5: Решeња са вишеструким агентима AI (⭐⭐⭐⭐ - 2-3 сата)
  - Поглавље 6: Валидација и планирање пре распореда (⭐⭐ - 1 сат)
  - Поглавље 7: Решавање проблема и дебаговање (⭐⭐ - 1-1.5 сати)
  - Поглавље 8: Производни и корпоративни шаблони (⭐⭐⭐⭐ - 2-3 сата)
- **📚 Свеобухватан навигациони систем**: Конзистентни заглавља и подножја навигације у целој документацији
- **🎯 Праћење напретка**: Контролна листа завршетка курса и систем верификације учења
- **🗺️ Водич путање учења**: Јасне улазне тачке за различите нивое искуства и циљеве
- **🔗 Навигација са крос-референцама**: Повезана поглавља и предуслови јасно повезани

#### Побољшано
- **Структура README-а**: Преображена у структурисану платформу за учење са организацијом по поглављима
- **Навигација у документацији**: Свака страна сада укључује контекст поглавља и смернице напретка
- **Организација шаблона**: Примери и шаблони мапирани на одговарајућа поглавља учења

- **Интеграција ресурса**: Листе пречица, Честа питања и водичи за учење повезани са релевантним поглављима
- **Интеграција радионице**: Практични лабораторијски задаци мапирани на више сврха учења по поглављима

#### Измењено
- **Прогрес учења**: Померање са линеарне документације на флексибилно учење базирано на поглављима
- **Постављање конфигурације**: Пребачен водич за конфигурацију као Поглавље 3 за бољи ток учења
- **Интеграција AI садржаја**: Боља интеграција садржаја специфичног за AI кроз цео процес учења
- **Производни садржај**: Напредни обрасци консолидовани у Поглављу 8 за кориснике из предузећа

#### Побољшано
- **Корисничко искуство**: Јасна навигациона трага и индикатори напретка поглавља
- **Приступачност**: Конзистентни обрасци навигације за лакше кретање курсом
- **Професионална презентација**: Универзитетска структура курса погодна за академску и корпоративну обуку
- **Ефикасност учења**: Скраћено време тражења релевантног садржаја кроз побољшану организацију

#### Техничка имплементација
- **Навигациони заглавља**: Стандаризована навигација поглавља преко 40+ датотека документације
- **Подножје за навигацију**: Конзистентна упутства за напредак и индикатори завршетка поглавља
- **Унутрашње повезивање**: Свеобухватан систем унутрашњих линкова који повезује сродне концепте
- **Мапирање поглавља**: Шаблони и примери јасно повезани са сврхама учења

#### Побољшање водича за учење
- **📚 Свеобухватни циљеви учења**: Реструктурирани водич за учење у складу са системом од 8 поглавља
- **🎯 Оцена по поглављима**: Свако поглавље укључује специфичне циљеве учења и практичне вежбе
- **📋 Праћење напретка**: Недељни распоред учења са мерљивим резултатима и листама за проверу завршетка
- **❓ Питања за оцену**: Питања за проверу знања за свако поглавље са професионалним резултатима
- **🛠️ Практичне вежбе**: Активности са реалним сценаријима имплементације и решавања проблема
- **📊 Напредак вештина**: Јасан напредак од основних концепата до образаца за предузећа са фокусом на каријерни развој
- **🎓 Оквир за сертификацију**: Резултати професионалног развоја и систем признања заједнице
- **⏱️ Управљање временом**: Структуриран план учења од 10 недеља са валидацијом битних датума

### [v3.1.0] - 2025-09-17

#### Побољшани вишеагентски AI решења
**Ова верзија побољшава вишеагентско решење за малопродају са бољим именовањем агената и унапређеном документацијом.**

#### Измењено
- **Терминологија вишегодентског система**: Уместо "Cora agent" користи се "Customer agent" широм вишегодентског решења за малопродају ради јаснијег разумевања
- **Архитектура агената**: Ажурирана сва документација, ARM шаблони и примери кода са доследним именом "Customer agent"
- **Примери конфигурација**: Модернизовани обрасци конфигурације агента са ажурираном конвенцијом именовања
- **Коњистентност документације**: Обезбеђено да све референце користе професионална, описна имена агената

#### Побољшано
- **ARM пакет шаблона**: Ажурирани retail-multiagent-arm-template са Customer agent референцама
- **Дијаграми архитектуре**: Освежени Mermaid дијаграми са ажурираним именима агената
- **Примери кода**: Python класе и примери имплементације сада користе CustomerAgent име
- **Променљиве окружења**: Ажурирани сви скрипти за имплементацију са конвенцијом CUSTOMER_AGENT_NAME

#### Побољшано
- **Искуство развојача**: Јасније улоге и одговорности агената у документацији
- **Спремност за производњу**: Боља усаглашеност са конвенцијама именовања у предузећима
- **Материјали за учење**: Интуитивније именовање агената за образовне сврхе
- **Корисност шаблона**: Поједностављено разумевање функција агената и образаца распореда

#### Технички детаљи
- Ажурирани Mermaid дијаграми архитектуре са CustomerAgent референцама
- Замењена имена класе CoraAgent са CustomerAgent у Python примерима
- Измењене ARM JSON конфигурације за агента типа "customer"
- Ажуриране променљиве окружења са CORA_AGENT_* на CUSTOMER_AGENT_* обрасце
- Освежени сви команди за имплементацију и конфигурације контејнера

### [v3.0.0] - 2025-09-12

#### Велике промене - Фокус на AI програмере и интеграција Microsoft Foundry
**Ова верзија претвара репозиторијум у свеобухватан ресурс за учење усмерен на AI уз интеграцију Microsoft Foundry.**

#### Додато
- **🤖 AI-први пут учења**: Потпуна реструктуризација са приоритетом AI програмера и инжењера
- **Водич за интеграцију Microsoft Foundry**: Свеобухватна документација за повезивање AZD-а са Microsoft Foundry услугама
- **Обрасци за имплементацију AI модела**: Детаљан водич за избор модела, конфигурацију и стратегије производног распореда
- **AI радионица**: 2-3 сата практичног рада за конверзију AI апликација у AZD-деплојабилна решења
- **Најбоље праксе производње AI**: Обрасци спремни за предузећа за скалирање, праћење и обезбеђење AI радних оптерећења
- **AI-специфичан водич за решавање проблема**: Свеобухватно решавање проблема Microsoft Foundry модела, Cognitive Services и AI имплементација
- **Галерија AI шаблона**: Изабрани шаблони Microsoft Foundry са оценом сложености
- **Материјали за радионице**: Потпуна структура радионице са практичним лабораторијама и референтним материјалима

#### Побољшано
- **Структура README-а**: Усмерена ка AI програмерима са 45% података за интересовање заједнице са Microsoft Foundry Discord-а
- **Путање учења**: Посебно AI програмерско путовање уз традиционалне путеве за студенте и DevOps инжењере
- **Препоруке шаблона**: Истакнути AI шаблони укључују azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграција заједнице**: Побољшана Discord подршка за заједницу са AI-специфичним каналима и дискусијама

#### Безбедност и фокус на производњу
- **Обрасци за Managed Identity**: AI-специфична аутентификација и конфигурација безбедности
- **Оптимизација трошкова**: Праћење употребе токена и контроле буџета за AI радна оптерећења
- **Дистрибуција у више региона**: Стратегије глобалне имплементације AI апликација
- **Праћење перформанси**: AI-специфичне метрике и интеграција Application Insights

#### Квалитет документације
- **Линеарна структура курса**: Логички напредак од почетничких до напредних обрасца AI распореда
- **Верификовани URL-ови**: Сви спољни линкови репозиторијума проверени и доступни
- **Комплетна референца**: Сви унутрашњи линкови документације верификовани и функционални
- **Спремност за производњу**: Обрасци имплементације предузећа са примерима из стварног света

### [v2.0.0] - 2025-09-09

#### Велике промене - Ресруктурирање репозиторијума и професионално унапређење
**Ова верзија представља значајан преуређење структуре репозиторијума и представљања садржаја.**

#### Додато
- **Структурирани оквир учења**: Све документације сада укључују Увод, Циљеве учења и Резултате учења
- **Навигациони систем**: Додате везе Претходна/Следећа лекција кроз целу документацију за вођени напредак учења
- **Водич за учење**: Свеобухватан study-guide.md са циљевима учења, вежбама и материјалима за оцену
- **Професионална презентација**: Уклоњене све емотиконке ради боље приступачности и професионалног изгледа
- **Побољшана структура садржаја**: Унапређена организација и ток материјала за учење

#### Измењено
- **Формат документације**: Стандаризована сва документација са конзистентном структуром усмереном на учење
- **Ток навигације**: Имплементиран логички напредак кроз све материјале за учење
- **Презентација садржаја**: Уклоњени декоративни елементи у корист јасног, професионалног форматирања
- **Структура линкова**: Ажурирани сви унутрашњи линкови да подрже нови навигациони систем

#### Побољшано
- **Приступачност**: Уклоњена зависност од емотикона ради боље компатибилности са екранским читаоцима
- **Професионални изглед**: Чиста, академска презентација погодна за учење у предузећима
- **Искуство учења**: Структурисан приступ са јасним циљевима и резултатима за сваку лекцију
- **Организација садржаја**: Бољи логички ток и повезаност између сродних тема

### [v1.0.0] - 2025-09-09

#### Почетно издање - Комплексна AZD мултимедијална база знања

#### Додато
- **Основна структура документације**
  - Комплетан водич за почетак рада
  - Свеобухватна документација за имплементацију и провизију
  - Детаљни ресурси за решавање проблема и алате за дебаговање
  - Алати и процедуре за валидацију пре распореда

- **Модул за почетак рада**
  - AZD основе: Основни концепти и терминологија
  - Водич за инсталацију: Упутства специфична за платформу
  - Водич за конфигурацију: Постављање окружења и аутентификација
  - Први пројекат: Практичан корак-по-корак туторијал

- **Модул за распоређивање и провизију**
  - Водич за распоређивање: Комплетна документација радног тока
  - Водич за провизију: Инфраструктура као код уз Bicep
  - Најбоље праксе за производне распореде
  - Обрасци за архитектуру више сервиса

- **Модул за валидацију пре распореда**
  - Планирање капацитета: Валидација доступности Azure ресурса
  - Избор SKU: Свеобухватна упутства за нивое услуга
  - Прелетачке провере: Аутоматизовани скрипти за провере (PowerShell и Bash)
  - Алати за процену трошкова и планирање буџета

- **Модул за решавање проблема**
  - Уобичајени проблеми: Често срећани проблеми и решења
  - Водич за дебаговање: Систематске методологије решавања проблема
  - Напредне дијагностичке технике и алати
  - Праћење перформанси и оптимизација

- **Ресурси и референце**
  - Лист пречица команди: Брзи преглед основних команди
  - Глосар: Свеобухватна терминологија и дефиниције акронима
  - FAQ: Детаљни одговори на честе упитнике
  - Линкови спољних ресурса и заједничке конекције

- **Примери и шаблони**
  - Пример једноставне веб апликације
  - Шаблон за распоред статичног сајта
  - Конфигурација контејнерске апликације
  - Обрасци интеграције базе података
  - Примери архитектуре микросервиса
  - Имплементације serverless функција

#### Карактеристике
- **Подршка за више платформи**: Водичи за инсталацију и конфигурацију за Windows, macOS и Linux
- **Виши нивои вештина**: Садржај намењен студентима до професионалних програмера
- **Практичан фокус**: Примери из праксе и сценарија из стварног живота
- **Свеобухватно покривање**: Од основних концепата до напредних образаца за предузећа
- **Приступ „Безбедност на првом месту“**: Најбоље праксе безбедности интегрисане кроз цео садржај
- **Оптимизација трошкова**: Упутства за трошковно ефективне распореде и управљање ресурсима

#### Квалитет документације
- **Детаљни примери кода**: Практични, тестирани примери кода
- **Корак-по-корак упутства**: Јасна и применљива упутства
- **Свеобухватно руковођење грешкама**: Решавање често срећаних проблема
- **Интеграција најбољих пракси**: Индустријски стандарди и препоруке
- **Компатибилност верзија**: Усклађено са најновијим Azure услугама и AZD функцијама

## Планирана будућа унапређења

### Верзија 3.1.0 (Планирано)
#### Проширење AI платформе
- **Подршка за више модела**: Обрасци интеграције за Hugging Face, Azure Machine Learning и прилагођене моделе
- **АI агенцијски оквири**: Шаблони за LangChain, Semantic Kernel и AutoGen распореде
- **Напредни RAG обрасци**: Опције векторских база података ван Azure AI Search (Pinecone, Weaviate итд.)
- **AI посматрање**: Побољшано праћење перформанси модела, коришћења токена и квалитета одговора

#### Искусво програмера
- **VS Code проширење**: Интегрисано AZD + Microsoft Foundry искуство развоја
- **Интеграција GitHub Copilot**: AI-помоћ при генерисању AZD шаблона
- **Интерактивни туторијали**: Практичне кодне вежбе са аутоматизованом валидацијом за AI сценарије
- **Видео садржај**: Допунски видео туторијали за визуелне ученике са фокусом на AI распореде

### Верзија 4.0.0 (Планирано)
#### Предузећни AI образци
- **Оквир управљања**: Управа AI модела, усаглашеност и ревизијски трагови
- **Више-кориснички AI**: Обрасци за служење више купаца са изолованим AI услугама
- **Edge AI имплементација**: Интеграција са Azure IoT Edge и контејнерским инстанцама
- **Хибридни облачни AI**: Обрасци за мулти-облак и хибридне распореде AI радних оптерећења

#### Напредне функције
- **Аутоматизација AI пипелина**: MLOps интеграција са Azure Machine Learning пипелинима
- **Напредна безбедност**: Обрасци zero-trust, приватне тачке приступа и напредна заштита од претњи
- **Оптимизација перформанси**: Напредне технике подешавања и масштабирања за AI апликације са великим протоком
- **Глобална дистрибуција**: Обрасци за доставу садржаја и edge кеширање за AI апликације

### Верзија 3.0.0 (Планирано) - Замјењена текућим издањем
#### Предложени додаци - Сад имплементирани у v3.0.0
- ✅ **Садржај усмерен на AI**: Свеобухватна интеграција Microsoft Foundry (Завршено)
- ✅ **Интерактивни туторијали**: Практична радионица за AI (Завршено)
- ✅ **Модул напредне безбедности**: AI-специфични безбедносни обрасци (Завршено)
- ✅ **Оптимизација перформанси**: Стратегије подешавања AI оптерећења (Завршено)

### Верзија 2.1.0 (Планирано) - Делимично имплементирано у v3.0.0
#### Мања унапређења - Неки завршени у текућем издању
- ✅ **Додатни примери**: AI-специфични сценарији распореда (Завршено)
- ✅ **Проширено FAQ**: Питања и решавање проблема специфичних за AI (Завршено)
- **Интеграција алата**: Побољшани водичи за интеграцију IDE и едитора
- ✅ **Проширено праћење**: AI-специфични обрасци праћења и алармирања (Завршено)

#### Још планирано за будуће издање
- **Документација прилагођена мобилним уређајима**: Респонзивни дизајн за учење преко мобилних уређаја
- **Приступ ван мреже**: Зиповани пакети документације за преузимање
- **Унапређена интеграција IDE**: VS Code проширење за AZD + AI токове рада
- **Контролна табла заједнице**: Резултати и праћење доприноса заједнице у реалном времену

## Учествовање у вођењу променa

### Пријављивање промена
Када доприносите овом репозиторијуму, молимо осигурајте да уноси у changelog укључују:

1. **Број верзије**: Пратећи семантичко верзионисање (мајор.минор.патцх)
2. **Датум**: Датум издања или ажурирања у формату ГГГГ-ММ-ДД
3. **Категорија**: Додато, Измењено, Застарело, Уклоњено, Исправљено, Безбедност
4. **Јасан опис**: Концизан опис онога што је промењено
5. **Процена утицаја**: Како промене утичу на постојеће кориснике

### Категорије промена

#### Додато
- Нове функције, секције документације или могућности
- Нови примери, шаблони или ресурси за учење
- Додатни алати, скрипте или помоћне програме

#### Измењено
- Модификације постојећих функционалности или документације
- Ажурирања ради побољшања јасноће или тачности
- Ресруктурирање садржаја или организације

#### Застарело
- Функције или приступи који се укидају
- Секције документације планиране за уклањање
- Методе које имају боље алтернативе

#### Уклоњено
- Функције, документација или примери који више нису релевантни
- Застареле информације или застарели приступи
- Садржај који је редундантан или консолидован

#### Исправљено
- Исправке грешака у документацији или коду
- Решавање пријављених проблема или кварова
- Побољшања тачности или функционалности


#### Безбедност
- Побољшања или исправке везане за безбедност
- Ажурирања најбољих безбедносних пракси
- Решавање безбедносних рањивости

### Упутства за Семантичку Верзију

#### Главна Верзија (X.0.0)
- Значајне промене које захтевају акцију корисника
- Значајна реструктурирања садржаја или организације
- Промене које мењају основни приступ или методологију

#### Мања Верзија (X.Y.0)
- Нове функције или додаци садржаја
- Побољшања која одржавају уназадну компатибилност
- Додатни примери, алати или ресурси

#### Верзија Исправака (X.Y.Z)
- Исправке и корекције грешака
- Мала побољшања постојећег садржаја
- Разјашњења и мања побољшања

## Повратне информације и Предлози за Заједницу

Активно охрабрујемо повратне информације за заједницу како бисмо унапредили овај ресурс за учење:

### Како дати повратне информације
- **GitHub Issues**: Пријавите проблеме или предложите побољшања (добродошли су и AI-специфични проблеми)
- **Discord Discussions**: Делите идеје и ангажујте се са Microsoft Foundry заједницом
- **Pull Requests**: Директно допринесите побољшањима садржаја, посебно AI шаблонима и водичима
- **Microsoft Foundry Discord**: Учестујте у #Azure каналу за дискусије о AZD + AI
- **Community Forums**: Учестујте у ширим дискусијама Azure програмера

### Категорије повратних информација
- **Тачност AI садржаја**: Исправке информација о интеграцији и развоју AI сервиса
- **Искуство учења**: Предлози за побољшану AI развојачку наставу
- **Недостајући AI садржај**: Захтеви за додатне AI шаблоне, обрасце или примере
- **Приступачност**: Побољшања за различите потребе учења
- **Интеграција AI алата**: Предлози за бољу интеграцију AI развојног процеса
- **Обрасци производног AI**: Захтеви за пословне AI шаблоне за примену

### Обавеза одговора
- **Одговор на проблеме**: У року од 48 сати за пријављене проблеме
- **Захтеви за функције**: Процена у року од једне недеље
- **Заједнички доприноси**: Преглед у року од једне недеље
- **Безбедносни проблеми**: Одмах као приоритет са убрзаним одговором

## Распоред одржавања

### Редовна ажурирања
- **Месечни прегледи**: Тачност садржаја и провера линкова
- **Квартална ажурирања**: Главни додаци и побољшања садржаја
- **Пола годишњи прегледи**: Комплексна реструктурирања и унапређења
- **Годишња издања**: Главна ажурирања верзија са значајним побољшањима

### Надзор и контролa квалитета
- **Аутоматизовано тестирање**: Редовна валидација код примера и линкова
- **Интеграција повратних информација заједнице**: Редовно укључивање корисничких предлога
- **Ажурирања технологије**: Усклађеност са најновијим Azure сервисима и azd издањима
- **Аудити приступачности**: Редовни прегледи према инклузивним дизајн принципима

## Политика подршке за верзије

### Тренутна подршка за верзије
- **Најновија главна верзија**: Потпуна подршка са редовним ажурирањима
- **Претходна главна верзија**: Безбедносна ажурирања и критичне исправке 12 месеци
- **Старије верзије**: Само заједничка подршка, без званичних ажурирања

### Упутства за миграцију
Када се објаве главне верзије, обезбеђујемо:
- **Водиче за миграцију**: Упутства корак по корак
- **Напомене о компатибилности**: Детаљи о променама које прекидају компатибилност
- **Подршка алатима**: Скрипте или алати који помажу при миграцији
- **Задужене заједничке подршке**: Посвећени форуми за питања о миграцији

---

**Навигација**
- **Претходна лекција**: [Study Guide](resources/study-guide.md)
- **Следећа лекција**: Вратите се на [Main README](README.md)

**Будите ажурни**: Пратите овај репозиторијум за обавештења о новим издањима и важним ажурирањима материјала за учење.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->