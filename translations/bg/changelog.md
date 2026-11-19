# Списък с Промени - AZD за начинаещи

## Въведение

Този списък с промени документира всички важни промени, актуализации и подобрения в репозиторията AZD за начинаещи. Следваме принципите на семантичното версиониране и поддържаме този списък, за да помогнем на потребителите да разберат какво се е променило между версиите.

## Цели за учене

Като прегледате този списък с промени, вие ще:
- Останете информирани за нови функции и допълнения към съдържанието
- Разберете подобренията, направени в съществуващата документация
- Проследите корекции на грешки и поправки за осигуряване на точност
- Следите развитието на учебните материали с времето

## Резултати от учене

След преглед на записите в списъка с промени, ще можете:
- Да идентифицирате ново съдържание и ресурси за учене
- Да разберете кои раздели са били актуализирани или подобрени
- Да планирате своя учебен път въз основа на най-актуалните материали
- Да дадете обратна връзка и предложения за бъдещи подобрения

## История на версиите

### [v3.25.0] - 2026-11-09

#### Разширение Microsoft Foundry 1.0 вече е общодостъпно

Пакетът `microsoft.foundry` 1.0 е **активен и общодостъпен**, както беше обявено на [5 ноември 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Курсът вече преподава издадения GA работен процес, а не предстоящия релийз. Започнете с AZD **1.37.0 или по-късна версия** и `azd ext install microsoft.foundry`.

#### Включено в тази актуализация на курса
- Английското ръководство използва GA пакета като подразбиращ се път за инсталация и обяснява седемте му независимо версионирани ядра на разширенията.
- [Ръководство за хостван агент](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) покрива пробата за API за отговор на upstream Python Agent Framework, текущия uv, Python 3.13+, избор на нов/съществуващ проект, повторното използване на модел и преглед на `azure.yaml`.
- Работният процес локално към облака обхваща тестване на Agent Inspector, разходи за извикване на модел, поддържан от Azure, отдалечени сборки на код, разгръщане, проследяване в облака, предварителен преглед на разгръщане, журнали и диагностика.
- Отделно ръководство за оценяване обхваща генериране и преглед на набори от данни/рубрики, конфигуриране на именувано оценяване, регистрация на активи и инспекция на резултатите. По-стари инструкции за оценяване/оптимизация остават като история на миграцията, а не като текуща основа на версията.
- Ръководството за Foundry CI/CD включва инсталиране на разширението за изпълнители, удостоверено разгръщане, активи/достъп за оценяване и изрично качество на вратата.
- Ръководството за почистване разграничавa новосъздадени и повторно използвани Foundry проекти. Работилницата включва връзка към отделно упражнение за GA без да замества тестовете, специфични за пробата.
- Навигацията в курса, учебните цели, изискванията за настройка, шпаргалката, ЧЗВ и учебният наръчник отразяват GA работния процес. Генерираните преводи не се редактират ръчно.

#### Обхват на прегледа
- Основава се на обявлението за GA, свързаното ръководство на Microsoft Learn и горната конфигурация на пробата. Не е извършено действително Azure предоставяне, разгръщане, извикване на модел или оценка.
- Пакетът GA не означава GA за всяка допълнителна опционална функция, независимо разширение или SDK, нито сертифицира примерите за продукционна употреба.

### [v3.24.0]- 2026-11-04

#### Поправено
- Поправена навигацията на английски в курса, преместени пътища на страници, липсващи котви и остарели външни препратки, включително връзката към глава 2 за ръководството за продукционен AI.
- Прегледано текущото ръководство спрямо издадената AZD 1.37.2, агенти 1.0.0-beta.23 и оценки 1.0.0-beta.2. Документиран отделният `azd ai eval` работен процес и миграция на конфигурацията за оптимизация.
- Коригирани неподдържани CLI флагове, граници на удостоверяване, ръководство за обикновена текстова среда/секрети, инфраструктурни актуализации, конфигурация на модел и примери за разрушително възстановяване.
- Обновена работилницата спрямо текущата проба AI Agents, включително реални куки, конфигурационни входове, тестове за оценяване, точки на влизане на red-teaming и наблюдаемост.
- Коригирани твърдения за примери на имплементации и поправени свързани приложения/инфраструктура/конфигурационни проблеми. Материалът за архитектурaта на дребно е изрично разграничен от пълно работещо приложение.
- Възстановена е матрицата за езика CodeQL, избран е поддържан Node.js 24 за разработващата среда и валидаторите за настройка докладват при неуспешни команди за версия.

#### Добавено
- Инструмент за офлайн проверка на връзки/котви само на английски, тестове за регресия и работен процес на документация, който изгражда и работилницата в строг режим. Генерираните преводи и преведените изображения са изключени.

#### Обхват на валидиране
- Проверките на изходния код, синтаксиса, конфигурацията, локалното поведение и мрежовите връзки не гарантират реално Azure разгръщане, квоти, RBAC, регионална наличност на модели, таксуване, съответствие със сигурността или готовност за продукция.
- По-старите записи по-долу са исторически записи, а не инструкции за текущи команди или версии.

### [v3.23.0] - 2026-07-13

#### Освежаване на AZD 1.27.1: Актуализация на версията
**Тази версия преровява курса спрямо `azd` `1.27.1` (юли 2026, последното стабилно издание) и текущото предварително разширение за AI агент `azure.ai.agents` `1.0.0-beta.5`, като обновява всеки банер с „валидиран спрямо“ след изданията 1.26.0, 1.27.0 и 1.27.1.**

#### Променено
- **✅ Обновена базова линия за валидиране** от `azd 1.25.6` (юни 2026) до `azd 1.27.1` (юли 2026) в README на корена, всички README на главите, урока за dev-околната среда в Глава 1 (включително примерите с фиксирана версия), урока за персонализирани шаблони в Глава 4, урока с няколко агента в Глава 5 и документацията на работилницата
- **🤖 Обновена базова линия на Глава 2** от `azd 1.23.12` (март 2026) до `azd 1.27.1` в `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; датите за бележка за валидиране са обновени на 2026-07-13
- **🧩 Актуализирано разширение за AI агент** от `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до текущото издание `1.0.0-beta.5` в README на Глава 2 и `agents.md`
- **🧪 Обновен пример за валидиране на работилницата** (`azd version` изход) до `1.27.1`

#### Бележки за съответните издания на azd (от 1.26.0 до 1.27.1)
- **1.26.0 (2026-06-24):** Поддръжка на Go за Azure Functions на Flex Consumption, `azd config sub-filter` филтри за абонамент на потребител, самостоятелни пакети на разширения (`azd x pack --bundle`) и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделиране на проекти/агенти Azure AI Foundry директно в `azure.yaml` (инициализация без Bicep/Terraform), поддръжка на контейнерно разгръщане за App Service (`host: appservice` + `language: docker`), директно `-s/--source` за команди `azd extension` и `azd tool uninstall`
- **1.27.1 (2026-07-09):** Флаг `--no-dependencies` за `azd extension install`, остарели модели вън от каталог/подканване за квоти по подразбиране и няколко корекции на грешки

#### Актуализирани файлове
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

#### Запълване на пропуск #2 за начинаещи: Създаване на шаблони, Dev Containers, Pulumi, Azure DevOps, служебни акаунти и др.
**Тази версия запълва останалите междинни пропуски, открити от анализа на azd-coverage: как да създавате и публикувате свои собствени шаблони, възпроизводими среди за разработка с Dev Containers/Codespaces, инфраструктурен доставчик Pulumi, ръководство за Azure DevOps CI/CD, удостоверяване с помощта на служебен акаунт, насоки за избор на хост (AKS/Spring Apps), обяснения за `azd restore`/`azd package`, обработка на грешки при куките и практики за екипни/споделени среди.**

#### Добавено
- **🧱 Нов урок в Глава 4** `docs/chapter-04-infrastructure/custom-templates.md` — създаване на собствени azd шаблони: изисквана структура (`azure.yaml`, `infra/`, `src/`), полето `metadata.template`, параметризиране на инфраструктура с токена `uniqueString()` ресурс и етикета `azd-env-name`, локално тестване с `azd init --template <local-path>`, публикуване в GitHub и подаване в галерията Awesome AZD
- **📦 Нов урок в Глава 1** `docs/chapter-01-foundation/dev-containers.md` — възпроизводими azd среди с Dev Containers и GitHub Codespaces: минимален `.devcontainer/devcontainer.json` с използване на официалната функция `ghcr.io/azure/azure-dev/azd`, езиково-специфични функции, `docker-in-docker` за хостове на контейнери и `azd auth login --use-device-code` за отдалечено влизане
- **🧩 Pulumi с azd** секция в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, оформление на папки за Pulumi, стековете съпоставени на azd среди, изисквани изходни данни/етикетиране и идентичен работен процес `azd up` / `azd down`
- **🎯 Насоки за избор на хост** в `docs/chapter-04-infrastructure/provisioning.md` — приятелско за начинаещи сравнение на `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp`, с упътвания кога да се избере AKS или Azure Spring Apps
- **🛠️ Ръководство на Azure DevOps CI/CD** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, връзка със служебен акаунт с федерация на идентичности за натоварване (OIDC), генерирания `azure-dev.yml` и настройка на групи с променливи
- **🔑 Служебни акаунти (Патърн 4)** добавени към `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивен `azd auth login` с клиентски секрет срещу федеративни/OIDC идентификации, кога се използва и безопасно съхранение на идентификационни данни
- **🪝 Обработка на грешки при куки** подраздел в `docs/chapter-04-infrastructure/deployment-guide.md` — изходни кодове и `set -e`, `continueOnError`, тестване на куки поотделно с `azd hooks run`, OS-специфични шел скриптове и `--debug`
- **👥 Екипни / споделени среди** секция в `docs/chapter-03-configuration/configuration.md` — какво живее в `.azure/`, какво да се игнорира от git, среди за отделни разработчици, `azd env list`/`select` и подаване на стойности на среди в CI/CD
- **🧰 Обяснения за `azd restore` и разширения `azd package`** в `resources/cheat-sheet.md` — възстановяване на зависимости и изграждане на артефакт за разгръщане без разгръщане

#### Променено
- **🧭 Таблица с уроци в Глава 4** актуализирана с новия урок "Създаване на собствен шаблон" (Урок 3)
- **🧭 Таблица с уроци в Глава 1** актуализирана с новия урок "Dev Containers & Codespaces" (Урок 5); навигационните футъри свързани между `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Запълване на пропуски за начинаещи: Практически урок с многоагентен модел, "Донеси свое приложение", Terraform и ръководство за CI/CD
**Тази версия запълва големите пропуски за пълен гид за начинаещи, като добавя два нови практически урока (разгръщаем многоагентен ръководство и добавяне на azd към съществуващо приложение), въведение в куки за начинаещи, секция за Terraform с azd, стъпка по стъпка ръководство за GitHub Actions pipeline, обяснение на новите предварителни разширения и изричен контролен списък за верификация на разгръщането.**

#### Добавено
- **🤝 Нов урок в Глава 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — изцяло практически двуагентен ръководство за разгръщане (оркестратор + специалисти) с реален шаблон (`contoso-creative-writer`), обхващащ кога да използвате многоагент, работния процес `azd up`, разбиране на разположените ресурси, междууагентно проследяване, персонализация и почистване
- **📦 Нов урок в Глава 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как да добавите azd към съществуващ проект с `azd init` („ползвай кода в текущата директория“), разбиране на `azure.yaml` и `infra/`, `azd infra generate`, откриване на хоста и разгръщане с `azd up`
- **🌐 Terraform с azd** секция добавена в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, оформление на папки `.tf`, изисквани `AZURE_*` изходи и означаване `azd-env-name`, и идентичен работен процес `azd up` / `azd down` (запълва пропуска, където бе заявена поддръжка на Terraform, но бе показан само Bicep)
- **⚙️ Стъпка по стъпка ръководство за GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от GitHub хранилище до автоматизирано внедряване: `azd pipeline config`, OIDC федеративни удостоверения (без запазени тайни), генерирания `azure-dev.yml` и насоки относно тайни спрямо променливи
- **🪝 Въведение за начинаещи "Нов си с хуковете?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — какво е hook, таблица за етапи на hook, минимален първи hook и ръчно изпълнение на hooks с `azd hooks run`
- **✅ Контролен списък "Потвърдете вашето внедряване"** добавен към Стъпка 5 на `docs/chapter-01-foundation/first-project.md` — тест за задимяване, проверка на здравен крайна точка и изрични критерии за успех
- **🧩 Обяснение за новите preview разширения** `azure.ai.skills` и `azure.ai.connections` (какво са и кога да ги използвате) в `docs/chapter-08-production/production-ai-practices.md`

#### Променено
- **🧭 Таблица с уроци в Глава 5** коригирана: `multi-agent-basics.md` вече е Урок 1 (единственият напълно практически урок), с честно означаване, че Урок 2 е в Глава 6, а търговският сценарий е архитектурен план, а не шаблон с една команда
- **🧭 Таблица с уроци в Глава 1** вече включва новия урок "Донеси своето собствено приложение" (Урок 4)
- **🔗 Навигационни футъри** актуализирани: `first-project.md` вече препраща напред към `bring-your-own-app.md`

#### Поправено
- **🧱 Закрита "пропусната" празнина в Terraform** — курсът преди това споменаваше поддръжка на Terraform без да я демонстрира
- **🔀 Коригирани подвеждащи междуглава връзки в Глава 5** които предполагаха съществуването на цялостна мултиагентна реализация, докато имаше само архитектурен план

#### Обновени файлове
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(нов)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(нов)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Обновление на AZD 1.25.6, пълни команди за жизнения цикъл на агент и ребрандинг Aspire
**Тази версия препотвърждава курса спрямо `azd` `1.25.6` (юни 2026) и разширението `azure.ai.agents` `0.1.40-preview`, разширява AI насоките от "конструиране на агент" до пълния жизнен цикъл на агента (тест → оценка → оптимизация → инспекция → изтриване), представя новите `azure.ai.skills` и `azure.ai.connections` preview разширения и отбелязва ребрандирането на продукта от ".NET Aspire" на "Aspire".**

#### Добавено
- **🔁 Пълно покритие на жизнения цикъл на агент** за начинаещи и AI инженери в документацията:
  - `docs/chapter-01-foundation/azd-basics.md` — Таблица за жизнения цикъл (конструиране → тест → измерване → подобрение → инспекция → почистване) добавена в секцията за разширения и AI команди
  - `docs/chapter-08-production/production-ai-practices.md` — Нова секция "Управление на жизнения цикъл на агента" покриваща `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Разширени AI агенски команди с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Нови preview разширения** документирани: `azure.ai.skills` (преносими умения на агенти) и `azure.ai.connections` (Foundry връзки) добавени в таблицата с разширения и джобна помощна таблица
- **⏱️ Насоки за време за отговор** — примерите с `azd ai agent invoke` вече показват обща латентност и време до първи байт
- **📌 Бейдж версия в коренния README** насочва учащите към `azd version` и `azd upgrade`

#### Променено
- **✅ Актуализирана базова линия за валидиране** от `azd 1.23.12` (март 2026) до `azd 1.25.6` (юни 2026) във всички README файлове на глави и работилнични документи
- **🤖 Актуализация на бележките за разширение в Глава 2** от `azure.ai.agents` `0.1.18-preview` до `0.1.40-preview`
- **🧪 Обновен пример за валидиране на работилница** (`azd version` изход) актуализиран до `1.25.6`
- **🧭 Обновено README "Какво е ново в azd днес"** за подчертаване на пълния жизнен цикъл на агента, новите AI разширения и последните подобрения за качество на живот (`azd init` идемпотентност, `azd auth login` почистване на остарели токени, `azd tool` подсказка за първо стартиране)
- **📖 Документ Глава 2 agents.md (Опция 4)** сега насочва учащите към командите за жизнения цикъл след внедряването, вместо да спира на `azd up`

#### Поправено
- **🏷️ Именуване на продукт** — добавена бележка за ребрандиране Aspire (".NET Aspire" вече е просто "Aspire"); поддръжката за Aspire в azd остава непроменена
- **🔎 Валидация на живо на релийзa** потвърдена спрямо Azure Developer CLI release feed: стабилни CLI версии `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Обновени файлове
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

#### Уточнение за начинаещи, проверка на настройката и почистване на крайни AZD команди
**Тази версия следва проверката на AZD 1.23 с документален преглед, насочен към начинаещи: уточнява първоначалните указания за удостоверяване с AZD, добавя скриптове за локална проверка на настройката, валидира ключови команди с жив AZD CLI и премахва последните остарели препратки към команди на английски извън changelog.**

#### Добавено
- **🧪 Скриптове за проверка на настройката за начинаещи** с `validate-setup.ps1` и `validate-setup.sh` за да могат учащите да потвърдят необходимите инструменти преди да започнат Глава 1
- **✅ Още в началото стъпки за проверка на настройката** в коренния README и README на Глава 1, така че липсващите предпоставки да се откриват преди `azd up`

#### Променено
- **🔐 Насоки за удостоверяване за начинаещи** вече последователно разглеждат `azd auth login` като основен път в AZD работни потоци, като `az login` е посочен като опционален освен ако не се ползват директно Azure CLI команди
- **📚 Поток за начална настройка в Глава 1** сега насочва учащите да валидират локалната си настройка преди стъпките за инсталация, удостоверяване и първо внедряване
- **🛠️ Съобщения на валидатора** сега ясно разграничават блокиращи изисквания от опционални предупреждения на Azure CLI за начинаещи използващи само AZD
- **📖 Документиране на конфигурация, отстраняване на неизправности и примери** сега правят разлика между задължително удостоверяване в AZD и опционално влизане в Azure CLI, където преди бяха предоставени без контекст

#### Поправено
- **📋 Останали препратки към английски източник на команди** актуализирани към текущите форми в AZD, включително `azd config show` в таблицата с бързи справки и `azd monitor --overview` където е предвидено указание за преглед на Azure Portal
- **🧭 Твърдения на начинаещи в Глава 1** омекотени, за да се избегне прекомерно обещание за гарантирана работа без грешки или откат при всички шаблони и ресурси на Azure
- **🔎 Валидация в живо на CLI** потвърди текуща поддръжка за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

#### Обновени файлове
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

#### Валидация на AZD 1.23.12, разширяване на работилничната среда и обновление на AI модел
**Тази версия извършва проверка на документацията спрямо `azd` `1.23.12`, обновява стари примери на AZD команди, обновява AI модели спрямо текущи параметри и разширява инструкциите за работилницата отвъд GitHub Codespaces, за да поддържа също dev контейнери и локални клонинги.**

#### Добавено
- **✅ Бележки за валидация в основните глави и документи на работилницата** за да се уточни тестваната базова линия на AZD за учащите с по-нови или по-стари CLI версии
- **⏱️ Насоки за изтичане на времето при внедряване** за дълготрайни внедрения на AI приложения с помощта на `azd deploy --timeout 1800`
- **🔎 Стъпки за проверка на разширения** с `azd extension show azure.ai.agents` в документи за AI работни потоци
- **🌐 По-широки насоки за работилнична среда** обхващащи GitHub Codespaces, dev контейнери и локални клонинги с MkDocs

#### Променено
- **📚 Въведения в главите README** сега последователно отбелязват валидация спрямо `azd 1.23.12` в секциите за основи, конфигурация, инфраструктура, мултиагент, преди внедряване, отстраняване на грешки и продукция
- **🛠️ Препратки към AZD команди** обновени до текущи форми в цялата документация:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимост от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, където е предназначен преглед за Application Insights
- **🧪 Опростени примери за preview provision** с текущо поддържано използване като `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Поток на работилницата** обновен, така че учащите могат да завършат лабораториите в Codespaces, dev контейнер или локален клон вместо да се предполага изпълнение само в Codespaces
- **🔐 Насоки за удостоверяване** сега предпочитат `azd auth login` за AZD работни потоци, като `az login` е поставен като опция при ползване на Azure CLI команди директно

#### Поправено
- **🪟 Инсталационни команди за Windows** нормализирани към текущия случай на пакет `winget` в наръчника за инсталация
- **🐧 Насоки за инсталация в Linux** коригирани за избягване на неподдържани специфични за дистрибуции команди с пакетния мениджър `azd` и вместо това сочещи към релийз активи, където е приложимо
- **📦 Примери с AI модели** обновени от по-стари по подразбиране като `gpt-35-turbo` и `text-embedding-ada-002` към настоящи примери като `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Фрагменти за внедряване и диагностика** коригирани да използват текущи команди за среда и статус в логове, скриптове и стъпки за отстраняване на проблеми
- **⚙️ Насоки за GitHub Actions** обновени от `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Насоки за съгласие MCP/Copilot** обновени от `azd mcp consent` до `azd copilot consent list`

#### Подобрено
- **🧠 Насоки за AI глава** сега по-добре обясняват чувствителното към preview поведение на `azd ai`, влизане специфично за наемател, текуща употреба на разширения и обновени препоръки за внедряване на модели
- **🧪 Инструкции за работилници** сега използват по-реалистични примери за версии и по-ясен език за настройка на средата за практическите лаборатории
- **📈 Документация за продукция и отстраняване на проблеми** вече се съобразява по-добре с текущите примери за наблюдение, резервен модел и нива на разходи

#### Обновени файлове
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

#### AI CLI команди за AZD, валидиране на съдържание и разширяване на шаблони
**Тази версия добавя обхват на командите `azd ai`, `azd extension` и `azd mcp` във всички глави, свързани с изкуствения интелект, поправя счупени връзки и остарял код в agents.md, обновява шпаргалката и преработва секцията Примерни шаблони с валидирани описания и нови шаблони Azure AI AZD.**

#### Добавено
- **🤖 Обхват на AZD AI CLI** в 7 файла (преди само в глава 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нова секция "Разширения и AI команди", представяща `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опция 4: `azd ai agent init` с таблица за сравнение (шаблон срещу манифест подход)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подсекции "AZD разширения за Foundry" и "Деплоймънт с агент-първо"
  - `docs/chapter-05-multi-agent/README.md` — Бърз старт вече показва както шаблон, така и манифест-базирани пътища за внедряване
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секцията за внедряване вече включва опция `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подсекция "AZD AI разширения за диагностика"
  - `resources/cheat-sheet.md` — Нова секция "AI & Разширения Команди" с `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Нови примерни шаблони AZD AI** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат с Blazor WebAssembly, Semantic Kernel и поддръжка за гласов чат
  - **azure-search-openai-demo-java** — Java RAG чат с Langchain4J с опции за внедряване ACA/AKS
  - **contoso-creative-writer** — Мулти-агент приложение за креативно писане с Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Безсървърна RAG с Azure Functions + LangChain.js + Cosmos DB и локална разработка с Ollama
  - **chat-with-your-data-solution-accelerator** — Предприятен RAG акселератор с административен портал, интеграция с Teams и опции PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Мулти-агент MCP оркестрационно справочно приложение със сървъри в .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимален Azure AI инфраструктурен Bicep стартов шаблон
  - **🔗 Връзка към страхотната галерия AZD AI** — Справка към [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблона)

#### Поправено
- **🔗 Навигация в agents.md**: Връзките Предишна/Следваща вече съответстват на реда в README урок на Глава 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Счупени връзки в agents.md**: `production-ai-practices.md` коригирана на `../chapter-08-production/production-ai-practices.md` (3 пъти)
- **📦 Остарял код в agents.md**: Заменен `opencensus` с `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Невалиден API в agents.md**: Преместен `max_tokens` от `create_agent()` в `create_run()` като `max_completion_tokens`
- **🔢 Броене на токени в agents.md**: Заменена груба оценка `len//4` с `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Коригирани услуги от "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (по подразбиране хост сменен октомври 2024)
- **contoso-chat**: Актуализирано описание за референция към Azure AI Foundry + Prompty, съответстващо на заглавието и технологичния стек на репото

#### Премахнато
- **ai-document-processing**: Премахната нефункционална справка към шаблон (репото не е публично достъпно като AZD шаблон)

#### Подобрено
- **📝 Упражнения в agents.md**: Упражнение 1 вече показва очакван изход и стъпка `azd monitor`; Упражнение 2 съдържа пълен регистрационен код `FunctionTool`; Упражнение 3 замества неясни указания с конкретни команди `prepdocs.py`
- **📚 Ресурси в agents.md**: Обновени линкове към текущата документация на Azure AI Agent Service и бърз старт
- **📋 Таблица с Следващи стъпки в agents.md**: Добавен линк към AI Workshop Lab за пълно покритие на главата

#### Файлове обновени
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Подобрена навигация в курса
**Тази версия подобрява навигацията в README.md с подобрена таблица с формат.**

#### Променено
- **Таблица с карта на курса**: Подобрена с директни линкове към уроци, оценки на продължителност и рейтинг на сложност
- **Почистване на папки**: Премахнати излишни стари папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Проверка на връзки**: Потвърдени 21+ вътрешни линка в таблицата с карта на курса

### [v3.16.0] - 2026-02-05

#### Обновяване на имена на продукти
**Тази версия актуализира продуктови препратки към текущото брандиране на Microsoft.**

#### Променено
- **Microsoft Foundry → Microsoft Foundry**: Всички препратки актуализирани в нетранслирани файлове
- **Azure AI Agent Service → Foundry Agents**: Актуализирано име на услугата за отразяване на текущото брандиране

#### Обновени файлове
- `README.md` - Основна начална страница на курса
- `changelog.md` - История на версиите
- `course-outline.md` - Структура на курса
- `docs/chapter-02-ai-development/agents.md` - Ръководство за AI агенти
- `examples/README.md` - Документация на примери
- `workshop/README.md` - Начална страница на работилницата
- `workshop/docs/index.md` - Индекс на работилницата
- `workshop/docs/instructions/*.md` - Всички файлове с инструкции на работилницата

---

### [v3.15.0] - 2026-02-05

#### Основна преструктуриране на репото: Папки с имена по глави
**Тази версия преструктурира документацията в отделни папки по глави за по-ясна навигация.**

#### Преименувания на папки
Старите папки са заменени с папки с номера на глави:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Добавена нова: `docs/chapter-05-multi-agent/`

#### Миграция на файлове
| Файл | От | До |
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
| Всички файлове преди внедряване | pre-deployment/ | chapter-06-pre-deployment/ |
| Всички файлове за отстраняване на проблеми | troubleshooting/ | chapter-07-troubleshooting/ |

#### Добавено
- **📚 README файлове за глава**: Създаден README.md във всяка папка с глава с:
  - Цели за учене и продължителност
  - Таблица с уроци и описания
  - Команди за бърз старт
  - Навигация към други глави

#### Променено
- **🔗 Обновени всички вътрешни връзки**: 78+ пътища обновени във всички документационни файлове
- **🗺️ Основен README.md**: Обновена карта на курса с новата структура на главите
- **📝 examples/README.md**: Обновени препратки към папките с глави

#### Премахнато
- Стара структура на папките (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Преструктуриране на репото: Навигация по глави
**Тази версия добавя README файлове с навигация по глави (заменени с v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ново ръководство за AI агенти
**Тази версия добавя цялостно ръководство за внедряване на AI агенти с Azure Developer CLI.**

#### Добавено
- **🤖 docs/microsoft-foundry/agents.md**: Пълно ръководство, покриващо:
  - Какво са AI агентите и как се различават от чатботове
  - Три шаблона за бърз старт агенти (Foundry Agents, Prompty, RAG)
  - Архитектурни модели на агенти (един агент, RAG, мулти-агент)
  - Конфигурация и персонализация на инструменти
  - Мониторинг и проследяване на метрики
  - Съображения за разходи и оптимизация
  - Чести сценарии за отстраняване на проблеми
  - Три практически упражнения с критерии за успех

#### Структура на съдържанието
- **Въведение**: Концепции за агенти за начинаещи
- **Бърз старт**: Внедряване на агенти с `azd init --template get-started-with-ai-agents`
- **Архитектурни модели**: Визуални диаграми на модели на агенти
- **Конфигурация**: Настройка на инструменти и променливи на средата
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Последователно практическо обучение (20-45 минути всяко)

---

### [v3.12.0] - 2026-02-05

#### Актуализация на средата DevContainer
**Тази версия обновява конфигурацията на контейнера за разработка с модерни инструменти и по-добри настройки по подразбиране за опита с AZD.**

#### Променено
- **🐳 Базов образ**: Обновен от `python:3.12-bullseye` до `python:3.12-bookworm` (най-новият стабилен Debian)
- **📛 Име на контейнера**: Преименувано от "Python 3" на "AZD за начинаещи" за яснота

#### Добавено
- **🔧 Нови функции в Dev Container**:
  - `azure-cli` с включена поддръжка за Bicep
  - `node:20` (LTS версия за AZD шаблони)
  - `github-cli` за управление на шаблони
  - `docker-in-docker` за деплоймънти на контейнер приложения

- **🔌 Препращане на портове**: Предварително конфигурирани портове за често използвани разработки:
  - 8000 (преглед MkDocs)
  - 3000 (Web приложения)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Нови VS Code разширения**:
  - `ms-python.vscode-pylance` - Подобрена IntelliSense за Python
  - `ms-azuretools.vscode-azurefunctions` - Поддръжка на Azure Functions
  - `ms-azuretools.vscode-docker` - Поддръжка на Docker
  - `ms-azuretools.vscode-bicep` - Поддръжка на език Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управление на Azure ресурси
  - `yzhang.markdown-all-in-one` - Редактиране на Markdown
  - `DavidAnson.vscode-markdownlint` - Проверка на Markdown
  - `bierner.markdown-mermaid` - Поддръжка на диаграми Mermaid
  - `redhat.vscode-yaml` - Поддръжка на YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуализация на Git
  - `mhutchie.git-graph` - История на Git

- **⚙️ Настройки на VS Code**: Добавени настройки по подразбиране за Python интерпретатор, форматиране при запис и премахване на излишни празни места

- **📦 Обновени requirements-dev.txt**:
  - Добавен MkDocs плъгин за минифициране
  - Добавен pre-commit за качество на кода
  - Добавени Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Поправено
- **Post-Create команда**: Сега проверява инсталациите на AZD и Azure CLI при стартиране на контейнера

---

### [v3.11.0] - 2026-02-05

#### Преработен README за начинаещи
**Тази версия значително подобрява README.md, за да е по-достъпен за начинаещи, и добавя основни ресурси за AI разработчици.**

#### Добавено
- **🆚 Сравнение Azure CLI и AZD**: Ясно обяснение кога да се използва кой инструмент с практични примери
- **🌟 Страхотни връзки за AZD**: Преки връзки към галерия на общността с шаблони и ресурси за принос:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ готови за внедряване шаблони
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Принос от общността
- **🎯 Ръководство за бърз старт**: Опростена 3-стъпкова секция за започване (Инсталиране → Вход → Внедряване)
- **📊 Таблица с навигация базирана на опит**: Ясни насоки за къде да започне според опита на разработчика

#### Променено
- **Структура на README**: Пренаредена за прогресивно разкриване - първо ключова информация
- **Въведение**: Пренаписано да обяснява "Магията на `azd up`" за напълно начинаещи
- **Премахнато дублирано съдържание**: Премахнат дублиран раздел за отстраняване на проблеми
- **Команди за отстраняване на проблеми**: Поправена препратка към `azd logs` за използване на валиден `azd monitor --logs`

#### Поправени
- **🔐 Команди за удостоверяване**: Добавени `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Невалидни препратки към команди**: Премахнати останалите `azd logs` от секцията за отстраняване на проблеми в README

#### Бележки
- **Обхват**: Промените са приложени в основния README.md и resources/cheat-sheet.md
- **Целева аудитория**: Подобрения, насочени специално към разработчици, нови в AZD

---

### [v3.10.0] - 2026-02-05

#### Актуализация на точността на командите на Azure Developer CLI
**Тази версия коригира несъществуващи AZD команди из цялата документация, осигурявайки всички кодови примери да използват валидна синтаксис на Azure Developer CLI.**

#### Поправени
- **🔧 Премахнати несъществуващи AZD команди**: Комплексен одит и корекция на невалидни команди:
  - `azd logs` (несъществуваща) → заменена с `azd monitor --logs` или алтернативи от Azure CLI
  - Подкоманди `azd service` (несъществуват) → заменени с `azd show` и Azure CLI
  - `azd infra import/export/validate` (несъществуват) → премахнати или заменени с валидни алтернативи
  - Флагове `azd deploy --rollback/--incremental/--parallel/--detect-changes` (несъществуват) → премахнати
  - Флагове `azd provision --what-if/--rollback` (несъществуват) → обновени за използване на `--preview`
  - `azd config validate` (несъществуваща) → заменена с `azd config list`
  - `azd info`, `azd history`, `azd metrics` (несъществуват) → премахнати

- **📚 Файлове актуализирани с корекции на команди**:
  - `resources/cheat-sheet.md`: Голям ремонт на справочника за команди
  - `docs/deployment/deployment-guide.md`: Поправени стратегии за връщане и разполагане
  - `docs/troubleshooting/debugging.md`: Коригирани секции за анализ на логове
  - `docs/troubleshooting/common-issues.md`: Актуализирани команди за отстраняване на проблеми
  - `docs/troubleshooting/ai-troubleshooting.md`: Поправен раздел за отстраняване на грешки в AZD
  - `docs/getting-started/azd-basics.md`: Коригирани команди за мониторинг
  - `docs/getting-started/first-project.md`: Актуализирани примери за мониторинг и отстраняване на грешки
  - `docs/getting-started/installation.md`: Поправени примери за помощ и версии
  - `docs/pre-deployment/application-insights.md`: Коригирани команди за преглед на логове
  - `docs/pre-deployment/coordination-patterns.md`: Поправени команди за отстраняване на грешки на агент

- **📝 Актуализирана версия на препратка**: 
  - `docs/getting-started/installation.md`: Променена твърдо кодирана версия `1.5.0` към обща `1.x.x` с линк към изданията

#### Променени
- **Стратегии за връщане назад**: Актуализирана документация за използване на връщане с Git (AZD няма вградено връщане)
- **Преглед на логове**: Заменени препратки към `azd logs` с `azd monitor --logs`, `azd monitor --live` и команди на Azure CLI
- **Секция за производителност**: Премахнати несъществуващи флагове за паралелно/инкрементално разполагане, предоставени валидни алтернативи

#### Технически детайли
- **Валидни AZD команди**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Валидни флагове azd monitor**: `--live`, `--logs`, `--overview`
- **Премахнати функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Бележки
- **Проверка**: Командите са валидирани с Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завършване на работилница и подобрение на качеството на документацията
**Тази версия завършва интерактивните модули на работилницата, поправя всички неработещи линкове в документацията и подобрява общото качество на съдържанието за AI разработчици, използващи Microsoft AZD.**

#### Добавени
- **📝 CONTRIBUTING.md**: Нов документ с насоки за принос с:
  - Ясни инструкции за докладване на проблеми и предлагане на промени
  - Стандарти за документация за ново съдържание
  - Насоки за кодови примери и конвенции за съобщения на комити
  - Информация за ангажираност на общността

#### Завършени
- **🎯 Модул 7 от работилницата (Обобщение)**: Изцяло завършен модул с:
  - Изчерпателно резюме на постиженията от работилницата
  - Секция по ключови усвоени понятия, покриващи AZD, шаблони и Microsoft Foundry
  - Препоръки за продължаване на обучението
  - Упражнения с трудност в предизвикателствата на работилницата
  - Обратна връзка от общността и линкове за поддръжка

- **📚 Модул 3 от работилницата (Разграждане)**: Актуализирани учебни цели с:
  - Активиране на GitHub Copilot с MCP сървъри
  - Разбиране на структурата на папките в AZD шаблони
  - Моделиране на инфраструктура като код (Bicep)
  - Инструкции за практически лаборатории

- **🔧 Модул 6 от работилницата (Демонтаж)**: Завършен с:
  - Цели за почистване на ресурси и управление на разходите
  - Използване на `azd down` за безопасно деактивиране на инфраструктура
  - Насоки за възстановяване на soft-deleted cognitive услуги
  - Бонус въпроси за изследване на GitHub Copilot и Azure Portal

#### Поправени
- **🔗 Поправки на счупени линкове**: Решени 15+ счупени вътрешни линка в документацията:
  - `docs/ai-foundry/ai-model-deployment.md`: Поправени пътища към microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Коригирани пътища за ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменен несъществуващ cicd-integration.md с deployment-guide.md
  - `examples/retail-scenario.md`: Поправени пътища за FAQ и ръководство за отстраняване на проблеми
  - `examples/container-app/microservices/README.md`: Коригирани пътища за начало на курса и ръководство за разполагане
  - `resources/faq.md` и `resources/glossary.md`: Актуализирани препратки към глави за AI
  - `course-outline.md`: Поправени препратки в инструктора и AI лаборатории

- **📅 Банне за статус на работилницата**: Актуализиран от "В процес на изграждане" към активен статус с дата февруари 2026

- **🔗 Навигация в работилницата**: Поправени счупени навигационни линкове в README.md за работилницата, сочещи към несъществуваща папка lab-1-azd-basics

#### Променени
- **Презентация на работилницата**: Премахнато предупреждение за "в процес на изграждане", работилницата вече е завършена и готова за ползване
- **Консистентност на навигацията**: Осигурена правилна междумодулна навигация във всички модули
- **Препратки към учебния път**: Обновени крос-препратки към правилни microsoft-foundry пътища

#### Валидация
- ✅ Всички английски markdown файлове имат валидни вътрешни линкове
- ✅ Модулите на работилницата 0-7 са завършени с учебни цели
- ✅ Навигацията между глави и модули работи коректно
- ✅ Съдържанието е подходящо за AI разработчици, използващи Microsoft AZD
- ✅ Поддържа се разбираем език и структура, подходящи за начинаещи
- ✅ CONTRIBUTING.md предоставя ясни насоки за приноси от общността

#### Техническа реализация
- **Валидация на линкове**: Автоматизиран PowerShell скрипт провери всички .md вътрешни линкове
- **Одит на съдържанието**: Ръчен преглед на пълнотата на работилницата и подходящост за начинаещи
- **Навигационна система**: Консистентни навигационни модели за глави и модули

#### Бележки
- **Обхват**: Промените са приложени само в английската документация
- **Преводи**: Папките с преводи не са актуализирани в тази версия (автоматизираният превод ще се синхронизира по-късно)
- **Продължителност на работилницата**: Пълната работилница вече осигурява 3-4 часа практическо обучение

---

### [v3.8.0] - 2025-11-19

#### Разширена документация: Мониторинг, сигурност и многоагентни модели
**Тази версия добавя пълни уроци с оценка A за интеграция на Application Insights, модели на удостоверяване и координация между много агенти за продукционни разгръщания.**

#### Добавени
- **📊 Урок за интеграция на Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Разполагане, фокусирано върху AZD с автоматично осигуряване
  - Пълни Bicep шаблони за Application Insights + Log Analytics
  - Работещи Python приложения с персонализирана телеметрия (над 1,200 реда)
  - Модели за мониторинг на AI/LLM (проследяване на токени/разходи за Microsoft Foundry модели)
  - 6 Mermaid диаграми (архитектура, разпределено проследяване, поток на телеметрия)
  - 3 практични упражнения (аларми, табла, AI мониторинг)
  - Примери за Kusto заявки и стратегии за оптимизация на разходите
  - Поток на метрики в реално време и отстраняване на грешки
  - 40-50 мин обучително време с продукционни модели

- **🔐 Урок за модели на удостоверяване и сигурност**: в `docs/getting-started/authsecurity.md`:
  - 3 модела за удостоверяване (връзки за свързване, Key Vault, управлявана идентичност)
  - Пълни Bicep шаблони за сигурни разполагания
  - Node.js код за приложение с интеграция на Azure SDK
  - 3 цялостни упражнения (активиране на управлявана идентичност, идентичност, назначена от потребителя, ротация на Key Vault)
  - Най-добри практики за сигурност и конфигурации RBAC
  - Ръководство за отстраняване на проблеми и анализ на разходите
  - Продукционно готови модели за удостоверяване без пароли

- **🤖 Урок за модели на сътрудничество между много агенти**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 модела за координация (последователен, паралелен, йерархичен, базиран на събития, консенсус)
  - Пълна имплементация на оркестраторска услуга (Python/Flask, над 1,500 реда)
  - 3 специализирани агенти (Изследовател, Писател, Редактор)
  - Интеграция със Service Bus за опашки на съобщения
  - Управление на състоянието с Cosmos DB за разпределени системи
  - 6 Mermaid диаграми, показващи взаимодействия на агенти
  - 3 напреднали упражнения (управление на таймаути, логика за повторения, прекъсвач на вериги)
  - Разбивка на разходите ($240-565/месец) с оптимизационни стратегии
  - Интеграция с Application Insights за мониторинг

#### Подобрени
- **Глава за предразполагане**: Вече включва комплексни модели за мониторинг и координация
- **Започване**: Подобрен с професионални модели за удостоверяване
- **Готовност за продукция**: Пълно покритие от сигурност до наблюдаемост
- **Учебен план**: Актуализиран с препратки към нови уроци в Глави 3 и 6

#### Променени
- **Процес на учене**: По-добра интеграция на сигурност и мониторинг в целия курс
- **Качество на документация**: Консистентни стандарти оценка A (95-97%) в новите уроци
- **Продукционни модели**: Пълно покритие от край до край за корпоративни разгръщания

#### Подобрени
- **Опит на разработчиците**: Ясен път от разработка до продукционен мониторинг
- **Стандарти за сигурност**: Професионални модели за удостоверяване и управление на тайни
- **Наблюдаемост**: Пълна интеграция на Application Insights с AZD
- **AI натоварвания**: Специализиран мониторинг за Microsoft Foundry Models и многоагентни системи

#### Валидация
- ✅ Всички уроци включват пълно работещо кодиране (не само фрагменти)
- ✅ Mermaid диаграми за визуално учене (общо 19 в 3 урока)
- ✅ Практически упражнения с верфикационни стъпки (общо 9)
- ✅ Продукционно готови Bicep шаблони, внедрими чрез `azd up`
- ✅ Анализи на разходите и оптимизационни стратегии
- ✅ Ръководства за отстраняване на проблеми и най-добри практики
- ✅ Контролни точки с проверка чрез команди

#### Резултати от оценката на документацията
- **docs/pre-deployment/application-insights.md**: - Изчерпателно ръководство за мониторинг
- **docs/getting-started/authsecurity.md**: - Професионални модели за сигурност
- **docs/pre-deployment/coordination-patterns.md**: - Разширени многоагентски архитектури
- **Общо ново съдържание**: - Консистентни високи стандарти за качество

#### Техническа реализация
- **Application Insights**: Log Analytics + персонализирана телеметрия + разпределено проследяване
- **Удостоверяване**: Управлявана идентичност + Key Vault + модели RBAC
- **Много агенти**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Мониторинг**: Поток на живи метрики + Kusto заявки + аларми + табла
- **Управление на разходите**: Стратегии за извадка, правила за съхранение, контрол на бюджета

### [v3.7.0] - 2025-11-19

#### Подобрения в качеството на документацията и нов пример Microsoft Foundry Models
**Тази версия повишава качеството на документацията в хранилището и добавя пълен пример за разгръщане на Microsoft Foundry Models с чат интерфейс gpt-4.1.**

#### Добавени
- **🤖 Пример за чат с Microsoft Foundry Models**: Пълно разгръщане на gpt-4.1 с работеща имплементация в `examples/azure-openai-chat/`:
  - Пълна инфраструктура за Microsoft Foundry Models (разгръщане на модел gpt-4.1)
  - Python чат интерфейс с история на разговорите от командния ред
  - Интеграция с Key Vault за сигурно съхранение на API ключове
  - Проследяване на употребата на токени и оценка на разходите
  - Ограничаване на скоростта и обработка на грешки
  - Изчерпателен README с ръководство за разгръщане 35-45 минути
  - 11 файла, готови за продукция (Bicep шаблони, Python приложение, конфигурация)
- **📚 Упражнения за документация**: Добавени практически упражнения в ръководството за конфигурация:
  - Упражнение 1: Конфигурация за многосредна среда (15 минути)
  - Упражнение 2: Практика по управление на тайни (10 минути)
  - Ясни критерии за успех и стъпки за проверка
- **✅ Проверка на разгръщането**: Добавена секция за проверка в ръководството:
  - Процедури за проверка на състоянието
  - Контролен списък за критерии за успех
  - Очаквани изходи за всички команди за разгръщане
  - Бърза справка за отстраняване на проблеми

#### Подобрени
- **examples/README.md**: Подобрено до качество A (93%):
  - Добавен azure-openai-chat във всички релевантни секции
  - Актуализиран брой локални примери от 3 на 4
  - Добавен в таблицата с примери за AI приложения
  - Интегриран в Quick Start за средно напреднали потребители
  - Добавен в секцията за Microsoft Foundry Templates
  - Актуализирани таблиците за сравнение и секции за технологични открития
- **Качество на документацията**: Подобрено от B+ (87%) до A- (92%) в цялата папка с документи:
  - Добавени очаквани резултати към критични примери за команди
  - Включени стъпки за верификация на промените в конфигурацията
  - Подобрено практически обучение с практически упражнения

#### Променено
- **Прогрес на обучението**: По-добра интеграция на AI примери за средно напреднали учащи се
- **Структура на документацията**: По-практични упражнения с ясни резултати
- **Процес на верификация**: Ясни критерии за успех добавени към ключови работни потоци

#### Подобрено
- **Опит на разработчика**: Разгръщането на Microsoft Foundry Models сега отнема 35-45 минути (спрямо 60-90 за сложни алтернативи)
- **Прозрачност на разходите**: Ясни оценени разходи (50-200 $/месец) за примера с Microsoft Foundry Models
- **Път на обучение**: AI разработчиците имат ясен вход с azure-openai-chat
- **Стандарти за документация**: Последователни очаквани резултати и стъпки за верификация

#### Верифицирано
- ✅ Примерът Microsoft Foundry Models напълно функционален с `azd up`
- ✅ Всички 11 файла за имплементация синтактично коректни
- ✅ Инструкциите в README съответстват на реалния опит с разгръщането
- ✅ Връзките в документацията обновени на повече от 8 места
- ✅ Индексът на примерите точно отразява 4 локални примера
- ✅ Няма дублирани външни връзки в таблиците
- ✅ Всички навигационни препратки правилни

#### Техническа имплементация
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps модел
- **Сигурност**: Готова управлявана самоличност, тайни в Key Vault
- **Мониторинг**: Интеграция с Application Insights
- **Управление на разходи**: Проследяване на токени и оптимизация на използването
- **Разгръщане**: Една команда `azd up` за пълна настройка

### [v3.6.0] - 2025-11-19

#### Голямо обновление: Примери за разгръщане на Container App
**Тази версия въвежда изчерпателни примери за разгръщане на продукционни контейнери с помощта на Azure Developer CLI (AZD), с пълна документация и интеграция в пътя за обучение.**

#### Добавено
- **🚀 Примери за Container App**: Нови локални примери в `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Пълен преглед на контейнеризирани разгръщания, бърз старт, продукционни и напреднали модели
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Лесен за начинаещи REST API с мащабиране до нула, здравни проверки, мониторинг и отстраняване на неполадки
  - [Microservices Architecture](../../examples/container-app/microservices): Продукционно готово многослойно разгръщане (API Gateway, Product, Order, User, Notification), асинхронни съобщения, Service Bus, Cosmos DB, Azure SQL, разпределено проследяване, blue-green/canary разгръщане
- **Най-добри практики**: Сигурност, мониторинг, оптимизация на разходи и CI/CD насоки за контейнеризирани натоварвания
- **Примери с код**: Пълни `azure.yaml`, Bicep шаблони и имплементации на услуги на няколко езика (Python, Node.js, C#, Go)
- **Тестване и отстраняване на неполадки**: Крайни до край сценарии за тест, команди за мониторинг, насоки за отстраняване на проблеми

#### Променено
- **README.md**: Обновен с новите примери за Container App под "Local Examples - Container Applications"
- **examples/README.md**: Обновен с акцент върху примери за Container App, добавени записи за матрица на сравнение и обновени препратки към технологии/архитектура
- **Структура на курса и учебно ръководство**: Обновени препратки към новите примери и модели на разгръщане в съответните глави

#### Верифицирано
- ✅ Всички нови примери могат да се разгърнат с `azd up` и следват най-добрите практики
- ✅ Обновени кръстосани връзки и навигация в документацията
- ✅ Примерите обхващат от начинаещи до напреднали сценарии, включително продукционни микросървиси

#### Забележки
- **Обхват**: Само английска документация и примери
- **Следващи стъпки**: Разширяване с допълнителни напреднали контейнерни модели и CI/CD автоматизация в бъдещи издания

### [v3.5.0] - 2025-11-19

#### Преименуване на продукта: Microsoft Foundry
**Тази версия изпълнява цялостна промяна на името на продукта от "Microsoft Foundry" на "Microsoft Foundry" във всички английски документи, отразявайки официалното ребрандиране на Microsoft.**

#### Променено
- **🔄 Актуализация на името на продукта**: Цялостно ребрандиране от "Microsoft Foundry" на "Microsoft Foundry"
  - Обновени всички препратки в английската документация в папката `docs/`
  - Преименувана папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименуван файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Общо: 23 препратки към съдържание обновени в 7 документационни файла

- **📁 Промени в структурата на папките**:
  - `docs/ai-foundry/` преименувана на `docs/microsoft-foundry/`
  - Всички кръстосани препратки обновени за новата структура на папките
  - Навигационните връзки валидирани в цялата документация

- **📄 Преименуване на файлове**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всички вътрешни връзки обновени за новите имена на файлове

#### Обновени файлове
- **Документация на глави** (7 файла):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 обновени навигационни връзки
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 обновени препратки към името на продукта
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вече използва Microsoft Foundry (от предишни актуализации)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 обновени препратки (преглед, обратна връзка от общност, документация)
  - `docs/getting-started/azd-basics.md` - 4 обновени връзки за кръстосани препратки
  - `docs/getting-started/first-project.md` - 2 обновени навигационни връзки на глави
  - `docs/getting-started/installation.md` - 2 обновени връзки към следващи глави
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 обновени препратки (навигация, Discord общност)
  - `docs/troubleshooting/common-issues.md` - 1 обновена навигационна връзка
  - `docs/troubleshooting/debugging.md` - 1 обновена навигационна връзка

- **Файлове за структурата на курса** (2 файла):
  - `README.md` - 17 обновени препратки (преглед на курса, заглавия на глави, секция с шаблони, общностни прозрения)
  - `course-outline.md` - 14 обновени препратки (преглед, учебни цели, ресурси за глава)

#### Верифицирано
- ✅ Нулеви останали препратки към пътя "ai-foundry" в английската документация
- ✅ Нулеви останали препратки към името на продукта "Microsoft Foundry" в английската документация
- ✅ Всички навигационни връзки функционират с новата структура на папките
- ✅ Преименуването на файлове и папки завършено успешно
- ✅ Кръстосани препратки между глави валидирани

#### Забележки
- **Обхват**: Промените прилагани само в английската документация в папка `docs/`
- **Преводи**: Папките за преводи (`translations/`) не са обновени в тази версия
- **Работилницa**: Материали за работилницата (`workshop/`) не са обновени в тази версия
- **Примери**: Файловете с примери може все още да съдържат стари имена (ще се коригират в бъдеща актуализация)
- **Външни връзки**: Външните URL адреси и препратки към GitHub хранилища остават непроменени

#### Ръководство за миграция на сътрудници
Ако имате локални клонове или документация, визираща старата структура:
1. Обновете препратките към папката: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Обновете препратките към файловете: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Заменете името на продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Валидирайте, че всички вътрешни връзки в документацията са все още работещи

---

### [v3.4.0] - 2025-10-24

#### Подобрения в инфраструктурния преглед и валидация
**Тази версия въвежда изчерпателна поддръжка за новата функция preview на Azure Developer CLI и подобрява потребителското изживяване на работилницата.**

#### Добавено
- **🧪 Документация на функцията azd provision --preview**: Изчерпателно покриване на новата възможност за инфраструктурен преглед
  - Справка с команда и примери за употреба в cheat sheet
  - Подробна интеграция в ръководството за предоставяне със сценарии и ползи
  - Интеграция на предварителна проверка за по-безопасна валидация при разгръщане
  - Обновления на ръководството за старт с практики за първоначално безопасно разгръщане
- **🚧 Банер за статус на работилницата**: Професионален HTML банер, указващ състоянието на разработка на работилницата
  - Дизайн с градиент и индикации за строителство за ясна комуникация към потребителите
  - Последна отбелязана дата за актуализация за прозрачност
  - Мобилно-отзивчив дизайн за всички видове устройства

#### Подобрено
- **Сигурност на инфраструктурата**: Функционалност за преглед интегрирана във всички документи за разгръщане
- **Валидация преди разгръщане**: Автоматизирани скриптове вече включват тестове за инфраструктурен преглед
- **Работен процес на разработчика**: Обновени последователности на команди с включване на преглед като най-добра практика
- **Изживяване в работилницата**: Ясни очаквания за потребителите относно състоянието на разработка на съдържанието

#### Променено
- **Най-добри практики при разгръщане**: Препоръчва се вече използване на workflow с preview на първо място
- **Поток на документацията**: Валидацията на инфраструктурата преместена по-рано в учебния процес
- **Презентация на работилницата**: Професионална комуникация на статуса с ясен график на разработка

#### Подобрено
- **Подход "Безопасност на първо място"**: Промените в инфраструктурата вече могат да се валидират преди разгръщането
- **Сътрудничество в екип**: Резултатите от preview могат да се споделят за преглед и одобрение
- **Осъзнаване на разходите**: По-добро разбиране на разходите за ресурси преди предоставяне
- **Намаляване на риска**: По-малко провали при разгръщане чрез предварителна валидация

#### Техническа имплементация
- **Интеграция в няколко документа**: Функцията preview описана в 4 ключови файла
- **Шаблони за команди**: Последователен синтаксис и примери в цялата документация
- **Интеграция на най-добри практики**: Preview включен във валидационни работни потоци и скриптове
- **Визуални индикации**: Ясни маркери за НОВА функция за по-лесно откриване

#### Инфраструктура на работилницата
- **Комуникация на статуса**: Професионален HTML банер с градиентен стил
- **Потребителско изживяване**: Ясен статус на развитие, който предотвратява объркване
- **Професионално представяне**: Поддържа достоверността на репозиторията, докато поставя очаквания
- **Прозрачност на графика**: Отбелязана последна дата на актуализация октомври 2025 за отчетност

### [v3.3.0] - 2025-09-24

#### Подобрени материали за работилница и интерактивно обучение
**Тази версия въвежда изчерпателни материали за работилница с браузър-базирани интерактивни ръководства и структурирани учебни пътеки.**

#### Добавено
- **🎥 Интерактивно ръководство за работилница**: Браузър-базирано изживяване с възможност за преглед с MkDocs
- **📝 Структурирани указания за работилницата**: 7-степенен структуриращ учебен път от откриване до персонализация
  - 0-Въведение: Общ преглед на работилницата и настройка
  - 1-Избор- на AI шаблон: Процес на откриване и избор на шаблон
  - 2-Валидация на AI шаблон: Процедури за разгръщане и валидация
  - 3-Деконструкция на AI шаблона: Разбиране на архитектурата на шаблона
  - 4-Конфигуриране на AI шаблона: Конфигурация и персонализация
  - 5-Персонализиране на AI шаблона: Напреднали модификации и итерации
  - 6-Разглобяване на инфраструктурата: Почистване и управление на ресурси
  - 7-Завършване: Резюме и следващи стъпки
- **🛠️ Инструменти за работилницата**: Конфигурация на MkDocs с тема Material за подобрено обучение
- **🎯 Път на практическо обучение**: 3-степенна методология (Откриване → Разгръщане → Персонализация)
- **📱 Интеграция с GitHub Codespaces**: Безпроблемна настройка на среда за развитие

#### Подобрено
- **AI лаборатория за работилницата**: Разширена с изчерпателно 2-3 часово структурирано обучение
- **Документация за работилницата**: Професионално представяне с навигация и визуални помощни средства
- **Напредък в обучението**: Ясни стъпка по стъпка ръководства от избор на шаблон до продукционно разгръщане
- **Опит на разработчика**: Интегрирани инструменти за рационализирани работни потоци

#### Подобрено
- **Достъпност**: Браузър-базиран интерфейс с търсене, функция за копиране и превключване на тема
- **Самостоятелно обучение**: Гъвкава структура на работилницата, адаптираща се към различни темпове на учене
- **Практическо приложение**: Реални сценарии за разгръщане на AI шаблони
- **Интеграция на общността**: Интеграция в Discord за поддръжка и сътрудничество по работилницата

#### Функции на работилницата
- **Вградено търсене**: Бързо откриване на ключови думи и уроци
- **Копиране на блокове с код**: Функция за копиране при задържане на курсора над примерите с код
- **Превключване на тема**: Поддръжка на тъмен/светъл режим за различни предпочитания
- **Визуални активи**: Скриншотове и диаграми за подобрено разбиране
- **Интеграция на помощ**: Директен достъп до Discord за подкрепа от общността

### [v3.2.0] - 2025-09-17

#### Основно преструктуриране на навигацията и система за учене базирана на глави
**Тази версия въвежда цялостна учебна структура, базирана на глави, с подобрена навигация из цялото хранилище.**

#### Добавено
- **📚 Учебна система базирана на глави**: Преструктуриране на целия курс в 8 прогресивни учебни глави
  - Глава 1: Основи и бърз старт (⭐ - 30-45 минути)
  - Глава 2: AI-първо разработване (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и удостоверяване (⭐⭐ - 45-60 минути)
  - Глава 4: Инфраструктура като код и разгръщане (⭐⭐⭐ - 1-1.5 часа)
  - Глава 5: Мултиагентни AI решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Валидация и планиране преди разгръщане (⭐⭐ - 1 час)
  - Глава 7: Отстраняване на проблеми и дебъгинг (⭐⭐ - 1-1.5 часа)
  - Глава 8: Продукционни и корпоративни модели (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Изчерпателна навигационна система**: Последователни навигационни заглавия и футъри във всички документи
- **🎯 Проследяване на напредъка**: Списък за проверка на завършването на курса и система за верификация на знания
- **🗺️ Насоки за учебния път**: Ясни входни точки за различни нива на опит и цели
- **🔗 Кръстосана навигация**: Свързани глави и предварителни изисквания ясно свързани

#### Подобрено
- **Структура на README**: Преобразуван в структурирана учебна платформа с организация по глави
- **Навигация в документацията**: Всяка страница вече включва контекст на глава и насоки за прогреса
- **Организация на шаблони**: Примерите и шаблоните разпределени към съответните учебни глави
- **Интеграция на ресурси**: Чийтшити, ЧЗВ и учебни помощници свързани към релевантните глави
- **Интеграция на работилницата**: Практически лаборатории, съвпадащи с учебните цели на множество глави

#### Променено
- **Напредък в обучението**: Преместване от линейна документация към гъвкаво обучение на базата на глави
- **Поставяне на конфигурацията**: Преасоцииране на ръководството за конфигурация като Глава 3 за по-добър учебен поток
- **Интеграция на съдържание с ИИ**: По-добра интеграция на специфично съдържание за ИИ през цялото учебно пътуване
- **Производствено съдържание**: Консолидирани усъвършенствани модели в Глава 8 за корпоративни учащи

#### Подобрено
- **Потребителско изживяване**: Ясни навигационни пътища и индикатори за напредък в главите
- **Достъпност**: Последователни навигационни модели за по-лесно преминаване през курса
- **Професионално представяне**: Структура на курса в университетски стил, подходяща за академично и корпоративно обучение
- **Ефективност на обучението**: Намалено време за намиране на релевантно съдържание чрез подобрена организация

#### Техническа реализация
- **Навигационни заглавия**: Стандартизирана навигация на главите в над 40 документационни файла
- **Долна навигация**: Последователни указания за напредък и индикатори за завършване на глави
- **Вътрешно свързване**: Всеобхватна система за вътрешни връзки, свързваща свързани концепции
- **Картографиране на глави**: Шаблони и примери, ясно асоциирани с учебните цели

#### Подобряване на учебното ръководство
- **📚 Всеобхватни учебни цели**: Преструктурирано учебно ръководство, съответстващо на система с 8 глави
- **🎯 Оценка по глави**: Всяка глава включва конкретни учебни цели и практически упражнения
- **📋 Проследяване на напредъка**: Седмичен учебен график с измерими резултати и контролни списъци за завършване
- **❓ Въпроси за оценка**: Въпроси за проверка на знанията за всяка глава с професионални резултати
- **🛠️ Практически упражнения**: Практически дейности с реални сценарии за внедряване и отстраняване на проблеми
- **📊 Напредък в уменията**: Ясно развитие от основни концепции до корпоративни модели с акцент върху кариерното развитие
- **🎓 Сертификационна рамка**: Професионални резултати и система за обществено признание
- **⏱️ Управление на времето**: Структуриран 10-седмичен учебен план с потвърждаване на етапи

### [v3.1.0] - 2025-09-17

#### Подобрени многоагентни решения с ИИ
**Тази версия подобрява многоагентното решение за търговия с по-добро именуване на агентите и подобрена документация.**

#### Промени
- **Терминология на многоагентните системи**: Заменен "Cora агент" с "клиентски агент" в цялото многоагентно търговско решение за по-ясно разбиране
- **Архитектура на агента**: Обновена цялата документация, ARM шаблони и примери за код с консистентното именуване "клиентски агент"
- **Примери за конфигурация**: Модернизирани модели за конфигурация на агенти с актуализирани конвенции за именуване
- **Съгласуваност на документацията**: Осигурени всички препратки да използват професионални, описателни имена на агентите

#### Подобрено
- **Пакет ARM шаблони**: Обновен retail-multiagent-arm-template с препратки към клиентски агент
- **Архитектурни диаграми**: Освежени Mermaid диаграми с обновени имена на агенти
- **Примери за код**: Python класове и примери за реализация вече използват именуването CustomerAgent
- **Променливи на средата**: Обновени всички скриптове за внедряване да използват конвенции CUSTOMER_AGENT_NAME

#### Подобрено
- **Изживяване на разработчика**: По-ясни роли и отговорности на агентите в документацията
- **Готовност за продукция**: По-добро съответствие с корпоративните конвенции за именуване
- **Учебни материали**: По-интуитивно именуване на агенти за образователни цели
- **Удобство на шаблона**: Опрощенo разбиране на функциите и моделите за внедряване на агенти

#### Технически детайли
- Обновени Mermaid архитектурни диаграми с препратки към CustomerAgent
- Заменени имена на класове CoraAgent с CustomerAgent в Python примери
- Модифицирани JSON конфигурации на ARM шаблони с използване на тип агент "customer"
- Обновени променливи на средата от CORA_AGENT_* на CUSTOMER_AGENT_*
- Освежени всички команди за внедряване и конфигурации на контейнери

### [v3.0.0] - 2025-09-12

#### Основни промени - Фокус върху разработчика на ИИ и интеграция с Microsoft Foundry
**Тази версия трансформира репозиторията в пълно учебно средство, фокусирано върху ИИ, с интеграция на Microsoft Foundry.**

#### Добавено
- **🤖 Път на обучение, ориентирaн към ИИ**: Пълна преструктуриране с приоритет към разработчици и инженери на ИИ
- **Ръководство за интеграция с Microsoft Foundry**: Всеобхватна документация за свързване на AZD с услуги на Microsoft Foundry
- **Модели за внедряване на ИИ**: Подробно ръководство за избор на модел, конфигурация и стратегии за продуктивно внедряване
- **Лаборатория за работилница по ИИ**: 2-3-часов практически семинар за преобразуване на ИИ приложения в решения, внедрими с AZD
- **Добри практики за продукция на ИИ**: Корпоративни модели за мащабиране, наблюдение и обезопасяване на ИИ натоварвания
- **Ръководство за отстраняване на проблеми с ИИ**: Всеобхватно насочване за модели Microsoft Foundry, когнитивни услуги и проблеми с внедряване на ИИ
- **Галерия с шаблони за ИИ**: Представена колекция от шаблони на Microsoft Foundry с оценки на сложността
- **Материали за работилницата**: Пълна структура на работилницата с практическа лаборатория и референтни материали

#### Подобрено
- **Структура на README**: Фокусирана върху разработчици на ИИ с 45% интерес от общността в Discord на Microsoft Foundry
- **Пътеки за обучение**: Отделено учебно пътуване за разработчици на ИИ заедно с традиционни пътеки за студенти и DevOps инженери
- **Препоръки за шаблони**: Включени AI шаблони като azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграция с общността**: Подобрена общностна поддръжка в Discord с канали и обсъждания, специализирани за ИИ

#### Фокус върху сигурността и продукцията
- **Шаблони за управлявана идентичност**: Аутентикация и конфигурации за сигурност, специфични за ИИ
- **Оптимизация на разходите**: Проследяване на използването на токени и контрол на бюджета за ИИ натоварвания
- **Внедряване в много региони**: Стратегии за глобално внедряване на ИИ приложения
- **Мониторинг на производителността**: Метрики, специфични за ИИ, и интеграция на Application Insights

#### Качество на документацията
- **Линейна структура на курса**: Логичен напредък от начинаещи до усъвършенствани модели за внедряване на ИИ
- **Проверени URL адреси**: Всички външни връзки към хранилища проверени и достъпни
- **Пълна референция**: Всички вътрешни връзки в документацията валидни и работещи
- **Готов за продукция**: Корпоративни модели за внедряване с реални примери

### [v2.0.0] - 2025-09-09

#### Основни промени - Реструктуриране на хранилището и професионално подобрение
**Тази версия представлява съществена ревизия на структурата на хранилището и представянето на съдържанието.**

#### Добавено
- **Структурирана учебна рамка**: Всички страници с документация сега включват Въведение, Учебни цели и Резултати от обучението
- **Навигационна система**: Добавени връзки към Предишен/Следващ урок във всички документи за насочван учебен прогрес
- **Учебно ръководство**: Изчерпателен study-guide.md с учебни цели, практическа подготовка и оценъчни материали
- **Професионално представяне**: Премахнати всички емоджита за подобрена достъпност и професионален външен вид
- **Подобренa структура на съдържанието**: По-добра организация и поток на учебните материали

#### Променено
- **Формат на документацията**: Стандартизирана цялата документация с последователна учебно-ориентирана структура
- **Навигационен поток**: Изграден логичен напредък през всички учебни материали
- **Презентация на съдържанието**: Премахнати декоративни елементи в полза на ясна, професионална форматиране
- **Структура на връзките**: Обновени всички вътрешни връзки в подкрепа на новата навигационна система

#### Подобрено
- **Достъпност**: Премахнати зависимости от емоджита за по-добра съвместимост с екранни четци
- **Професионален вид**: Чист, академичен стил на представяне, подходящ за корпоративно обучение
- **Учебно изживяване**: Структуриран подход с ясни цели и резултати за всеки урок
- **Организация на съдържанието**: По-добър логичен поток и връзка между свързани теми

### [v1.0.0] - 2025-09-09

#### Първо издание - Изчерпателно хранилище за обучение с AZD

#### Добавено
- **Основна структура на документацията**
  - Пълен наръчник за започване
  - Подробна документация за внедряване и разполагане
  - Подробни ресурси за отстраняване на проблеми и указания за дебъгинг
  - Инструменти и процедури за валидация преди внедряване

- **Модул за започване**
  - Основи на AZD: основни концепции и терминология
  - Ръководство за инсталиране: инструкции за специфична платформа
  - Ръководство за конфигурация: настройка на среда и автентикация
  - Урок за първи проект: стъпка по стъпка с практически занятия

- **Модул за внедряване и осигуряване на ресурси**
  - Ръководство за внедряване: пълна документация на процеса
  - Ръководство за инфраструктура като код с Bicep
  - Най-добри практики за продукционни внедрявания
  - Модели на архитектура с множество услуги

- **Модул за валидация преди внедряване**
  - Планиране на капацитета: проверка на наличност на ресурси в Azure
  - Избор на SKU: изчерпателни насоки за нива на услуги
  - Предварителни проверки: автоматизирани скриптове за валидация (PowerShell и Bash)
  - Оценка на разходи и инструменти за бюджетиране

- **Модул за отстраняване на проблеми**
  - Често срещани проблеми и решения
  - Ръководство за дебъгинг: систематични методи за отстраняване на проблеми
  - Усъвършенствани диагностични техники и инструменти
  - Мониторинг на производителността и оптимизация

- **Ресурси и препратки**
  - Помощна бърза таблица с команди
  - Глосар: изчерпателни дефиниции на терминология и акроними
  - Често задавани въпроси (FAQ): подробни отговори на общи въпроси
  - Външни връзки към ресурси и контакт с общност

- **Примери и шаблони**
  - Пример за проста уеб приложение
  - Шаблон за статичен уеб сайт
  - Конфигурация на контейнерно приложение
  - Модели за интеграция с бази данни
  - Примери за микросървисна архитектура
  - Реализации на безсървърни функции

#### Функции
- **Поддръжка на множество платформи**: Ръководства за инсталиране и конфигурация за Windows, macOS и Linux
- **Нива на умения**: Съдържание, подходящо за студенти до професионални разработчици
- **Практическа насоченост**: Практически примери и ситуации от реалния свят
- **Всеобхватно покритие**: От основни концепции до усъвършенствани корпоративни модели
- **Подход, ориентиран към сигурността**: Най-добри практики за сигурност интегрирани през цялото съдържание
- **Оптимизация на разходите**: Насоки за икономични внедрявания и управление на ресурси

#### Качество на документацията
- **Подробни примери с код**: Практически, тествани образци на код
- **Стъпка по стъпка инструкции**: Ясни, приложими указания
- **Всеобхватно управление на грешки**: Отстраняване на често срещани проблеми
- **Интеграция на най-добри практики**: Промишлени стандарти и препоръки
- **Съвместимост на версиите**: Актуална с последните услуги на Azure и функции на azd

## Планирани бъдещи подобрения

### Версия 3.1.0 (Планирана)
#### Разширяване на AI платформата
- **Поддръжка на множество модели**: Интеграционни модели за Hugging Face, Azure Machine Learning и собствени модели
- **AI рамки за агенти**: Шаблони за реализации с LangChain, Semantic Kernel и AutoGen
- **Усъвършенствани RAG модели**: Векторни бази данни извън Azure AI Search (Pinecone, Weaviate и др.)
- **Наблюдение на ИИ**: Подобрен мониторинг на производителност на модели, използване на токени и качество на отговорите

#### Изживяване на разработчика
- **Разширение за VS Code**: Интегрирано разработване с AZD + Microsoft Foundry
- **Интеграция с GitHub Copilot**: Генериране на шаблони с помощта на ИИ в AZD
- **Интерактивни уроци**: Практически упражнения с автоматична проверка за AI сценарии
- **Видео съдържание**: Допълнителни видео уроци за визуални учащи, фокусирани върху внедряване на ИИ

### Версия 4.0.0 (Планирана)
#### Корпоративни AI модели
- **Рамка за управление**: Управление, съответствие и одит на AI модели
- **Многонаемна ИИ**: Модели за обслужване на множество клиенти с изолирани AI услуги
- **Крайно внедряване на AI**: Интеграция с Azure IoT Edge и инстанции на контейнери
- **Хибриден облачен AI**: Многооблачни и хибридни модела за внедряване на ИИ натоварвания

#### Разширени функции
- **Автоматизация на AI конвейери**: Интеграция на MLOps с Azure Machine Learning конвейери
- **Усъвършенствана сигурност**: Модели с нулево доверие, частни крайни точки и усъвършенствана защита от заплахи
- **Оптимизация на производителността**: Усъвършенствани стратегии за настройка и мащабиране на високопропускливи AI приложения
- **Глобално разпределение**: Модели за доставка на съдържание и кеширане на ръба за AI приложения

### Версия 3.0.0 (Планирана) - Замествана от настоящото издание
#### Предложени добавки - Вече реализирани в v3.0.0
- ✅ **Съдържание, ориентирано към ИИ**: Всеобхватна интеграция на Microsoft Foundry (Завършено)
- ✅ **Интерактивни уроци**: Практическа AI лаборатория (Завършено)
- ✅ **Модул за усъвършенствана сигурност**: AI-специфични модели за сигурност (Завършено)
- ✅ **Оптимизация на производителността**: Стратегии за настройка на AI натоварвания (Завършено)

### Версия 2.1.0 (Планирана) - Частично реализирана във v3.0.0
#### Малки подобрения - Някои завършени в настоящото издание
- ✅ **Допълнителни примери**: Сценарии за внедряване, насочени към ИИ (Завършено)
- ✅ **Разширено FAQ**: Въпроси и отстраняване на проблеми, специфични за ИИ (Завършено)
- **Интеграция на инструменти**: Ръководства за подобрена IDE и редактор интеграция
- ✅ **Разширен мониторинг**: AI-специфични модели за наблюдение и предупреждения (Завършено)

#### Все още планирано за бъдещи издания
- **Мобилно-дружествена документация**: Отзивчив дизайн за мобилно обучение
- **Достъп офлайн**: Пакети за изтегляне на документация
- **Подобрена IDE интеграция**: Разширение за VS Code за AZD + AI работни потоци
- **Табло за общността**: Метрики в реално време и проследяване на приноси в общността

## Принос към дневника на промените

### Съобщаване на промени
Когато допринасяте към това хранилище, моля, уверете се, че записите в дневника на промените съдържат:

1. **Номер на версията**: Спазване на семантичното версиониране (major.minor.patch)
2. **Дата**: Дата на издаване или обновяване в формат ГГГГ-ММ-ДД
3. **Категория**: Добавено, Променено, Отхвърлено, Премахнато, Поправено, Сигурност
4. **Ясно описание**: Кратко описание на промените
5. **Оценка на въздействието**: Как промените засягат съществуващите потребители

### Категории промени

#### Добавено
- Нови функции, секции в документацията или възможности
- Нови примери, шаблони или учебни ресурси
- Допълнителни инструменти, скриптове или помощни програми

#### Променено
- Модификации по съществуващата функционалност или документация
- Актуализации за подобряване на яснотата или точността
- Преструктуриране на съдържание или организация

#### Отхвърлено
- Функции или подходи, които се премахват постепенно
- Части от документацията, планирани за премахване
- Методи, за които има по-добри алтернативи

#### Премахнато
- Функции, документация или примери, които вече не са релевантни
- Остаряла информация или отхвърлени подходи
- Излишно или консолидирано съдържание

#### Поправено
- Корекции на грешки в документацията или кода
- Решение на докладвани проблеми или грешки
- Подобрения в точността или функционалността

#### Сигурност
- Подобрения или поправки, свързани със сигурността
- Актуализации на най-добрите практики за сигурност
- Решение на уязвимости в сигурността

### Насоки за семантично версиониране

#### Основна версия (X.0.0)
- Промени, които изискват действие от потребителя
- Значителна реструктуриране на съдържанието или организацията
- Промени, които променят основния подход или методология

#### Минорна версия (X.Y.0)
- Нови функции или добавки към съдържанието
- Подобрения, които поддържат съвместимост назад
- Допълнителни примери, инструменти или ресурси

#### Патч версия (X.Y.Z)
- Поправки на грешки и корекции
- Малки подобрения в съществуващото съдържание
- Изяснения и малки подобрения

## Обратна връзка от общността и предложения

Насърчаваме активно обратната връзка от общността за подобряване на този учебен ресурс:

### Как да дадете обратна връзка
- **GitHub Issues**: Докладвайте проблеми или предлагайте подобрения (специфични за AI въпроси са добре дошли)
- **Discord Discussions**: Споделяйте идеи и се ангажирайте с общността на Microsoft Foundry
- **Pull Requests**: Приносете директни подобрения към съдържанието, особено AI шаблони и ръководства
- **Microsoft Foundry Discord**: Участвайте в #Azure канал за дискусии относно AZD + AI
- **Community Forums**: Участвайте в по-широки дискусии за разработчици на Azure

### Категории обратна връзка
- **Точност на AI съдържанието**: Поправки на информацията за интеграция и внедряване на AI услуги
- **Обучителен опит**: Предложения за подобрен учебен процес за AI разработчици
- **Липсващо AI съдържание**: Искания за допълнителни AI шаблони, шаблони или примери
- **Достъпност**: Подобрения за разнообразни обучителни нужди
- **Интеграция на AI инструменти**: Предложения за по-добра интеграция в работния поток за AI разработка
- **Производствени AI модели**: Искания за шаблони за внедряване на AI в предприятия

### Обещание за отговор
- **Отговор на проблеми**: В рамките на 48 часа за докладвани проблеми
- **Заявки за функции**: Оценка в рамките на една седмица
- **Приноси от общността**: Преглед в рамките на една седмица
- **Проблеми със сигурността**: Незабавен приоритет с ускорена реакция

## График за поддръжка

### Редовни актуализации
- **Месечни прегледи**: Точност на съдържанието и проверка на връзките
- **Тримесечни актуализации**: Основни добавки и подобрения на съдържанието
- **Полугодишни прегледи**: Комплексна реструктуриране и подобрения
- **Годишни версии**: Основни актуализации с значителни подобрения

### Мониторинг и осигуряване на качеството
- **Автоматизирано тестване**: Редовна проверка на примерния код и връзките
- **Интеграция на обратна връзка от общността**: Редовно внедряване на предложения от потребители
- **Актуализации на технологиите**: Съобразяване с най-новите услуги на Azure и версии на azd
- **Одити за достъпност**: Редовен преглед за приобщаващи принципи на проектиране

## Политика за поддръжка на версии

### Поддръжка на текущи версии
- **Най-новата основна версия**: Пълна поддръжка с редовни актуализации
- **Предишна основна версия**: Актуализации за сигурност и критични поправки за 12 месеца
- **Старите версии**: Само поддръжка от общността, без официални актуализации

### Насоки за миграция
Когато се издават основни версии, предоставяме:
- **Ръководства за миграция**: Инструкции стъпка по стъпка за преход
- **Бележки за съвместимост**: Подробности за промени, които нарушават съвместимостта
- **Поддръжка на инструменти**: Скриптове или помощни средства за подпомагане на миграцията
- **Обществена поддръжка**: Специализирани форуми за въпроси относно миграцията

---

**Навигация**
- **Предишен урок**: [Учебно ръководство](resources/study-guide.md)
- **Следващ урок**: Върнете се към [Основния README](README.md)

**Бъдете в течение**: Следете това хранилище за уведомления за нови версии и важни актуализации на учебните материали.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->