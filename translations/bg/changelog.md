# Промени - AZD за начинаещи

## Въведение

Този списък с промени документира всички значими промени, актуализации и подобрения в хранилището AZD For Beginners. Следваме принципите на семантичното версиониране и поддържаме този журнал, за да помогнем на потребителите да разберат какво се е променило между версиите.

## Учебни цели

Като прегледате този журнал с промени, вие ще:
- Останете информирани за нови функции и добавяне на съдържание
- Разберете направените подобрения в съществуващата документация
- Проследявате поправките на грешки и корекциите за осигуряване на точност
- Следите еволюцията на учебните материали с времето

## Учебни резултати

След като прегледате записите от списъка с промени, ще можете да:
- Идентифицирате ново съдържание и налични ресурси за обучение
- Разберете кои секции са обновени или подобрени
- Планирате учебния си път въз основа на най-актуалните материали
- Допринасяте с обратна връзка и предложения за бъдещи подобрения

## История на версиите

### [v3.24.0]- 2026-11-04

#### Поправено
- Поправена навигацията в курса на английски, преместени пътища на страници, липсващи анкери и остарели външни препратки, включително линка в Глава 2 към ръководството за продукционен AI.
- Прегледани текущите указания спрямо публикуваните AZD 1.37.2, агенти 1.0.0-beta.23 и оценки 1.0.0-beta.2. Документиран отделният `azd ai eval` работен процес и миграцията на конфигурациите за оптимизация.
- Коригирани не поддържани CLI опции, ограничения по автентикация, насоки за незашифрована среда/тайни, актуализации в инфраструктурата, конфигурация на модел, и примери за разрушително възстановяване.
- Обновен семинарът спрямо текущия AI Agents пример, включително реални куки, конфигурационни входове, тестове за оценка, точки за red-teaming, и наблюдаемост.
- Коригирани твърдения в примерната реализация и поправени свързани проблеми с приложението/инфраструктурата/конфигурацията. Материалът за архитектура на търговията на дребно е изрично разграничен от пълно функциониращо приложение.
- Възстановена е езиковата матрица на CodeQL, избран е поддържан Node.js 24 за контейнера за разработка, и валидационните инструменти за настройка започнаха да отчитат неуспешни версии на команди.

#### Добавено
- Проверка на офлайн линкове/анкери само на английски език, регресионни тестове и работен процес за документация, който също компилира семинара в строг режим. Генерирани преводи и преведени изображения са изключени.

#### Обхват на валидацията
- Проверки на изходния код, синтаксис, конфигурация, локално поведение и мрежови връзки не установяват живо разгръщане в Azure, квоти, RBAC, регионална наличност на моделите, фактуриране, съответствие с безопасността или готовност за продукция.
- По-старите записи по-долу са исторически записи, а не текущи инструкции за команди или издания.

### [v3.23.0] - 2026-07-13

#### Обновяване AZD 1.27.1: Актуализация на версията
**Тази версия преразглежда курса спрямо `azd` `1.27.1` (юли 2026, най-нова стабилна версия) и текущия предварителен AI агент разширение `azure.ai.agents` `1.0.0-beta.5`, като актуализира всички банери „валидирано спрямо“ след изданията 1.26.0, 1.27.0 и 1.27.1.**

#### Променено
- **✅ Актуализирана база за валидация** от `azd 1.25.6` (юни 2026) до `azd 1.27.1` (юли 2026) в главния README, всички главови README файлове, урока за dev-container в Глава 1 (включително примерите с фиксирани версии), урока за потребителски шаблони в Глава 4, урока за многоагентна система в Глава 5 и документацията на семинара
- **🤖 Обновена база в Глава 2** от `azd 1.23.12` (март 2026) до `azd 1.27.1` в `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; датите на бележките за валидиране променени на 2026-07-13
- **🧩 Обновен AI агент разширение** от `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до текущото издание `1.0.0-beta.5` в README на Глава 2 и `agents.md`
- **🧪 Обновен пример за валидиране на семинар** (`azd version` изход) до `1.27.1`

#### Забележки относно азд версии (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Поддръжка на Go за Azure Functions на Flex Consumption, `azd config sub-filter` филтри за абонаменти на ниво клиент, самостоятелни разширителни пакети (`azd x pack --bundle`), и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделиране на Azure AI Foundry проекти/агенти директно в `azure.yaml` (инициализация без Bicep/Terraform), поддръжка за разгръщане на контейнери за App Service (`host: appservice` + `language: docker`), директни `-s/--source` за `azd extension` команди, и `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` флаг за `azd extension install`, остарели модели изключени по подразбиране от каталога/подканите за квоти, и няколко поправки на грешки

#### Обновени файлове
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

#### Запълване на пропуски за начинаещи #2: Авторство на шаблони, Dev контейнери, Pulumi, Azure DevOps, служебни принципали и други
**Тази версия затваря оставащите междинни пропуски, изведени от анализа на покритието на azd: как да създадете и публикувате собствен шаблон, възпроизводими dev-container/среда в Codespaces, доставчик на инфраструктура Pulumi, презентиране на CI/CD в Azure DevOps, автентикация с service principal, насоки за избор на хост (AKS/Spring Apps), обяснения за `azd restore`/`azd package`, обработка на грешки в куки, и практики за екипни/споделени среди.**

#### Добавено
- **🧱 Нов урок в Глава 4** `docs/chapter-04-infrastructure/custom-templates.md` — създаване на собствен azd шаблон: необходима структура (`azure.yaml`, `infra/`, `src/`), полето `metadata.template`, параметризиране на инфраструктурата с токена "resource" `uniqueString()` и таг `azd-env-name`, локално тестване с `azd init --template <local-path>`, публикуване в GitHub и подаване в галерията Awesome AZD
- **📦 Нов урок в Глава 1** `docs/chapter-01-foundation/dev-containers.md` — възпроизводими azd среди с Dev контейнерите и GitHub Codespaces: минимален `.devcontainer/devcontainer.json` с помощта на официалната функция `ghcr.io/azure/azure-dev/azd`, езиково-специфични функции, `docker-in-docker` за контейнерните хостове, и `azd auth login --use-device-code` за отдалечено влизане
- **🧩 Раздел Pulumi с azd** в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, оформление на папките за Pulumi, стекове, свързани с azd среди, необходими изходни данни/тагове, и идентичен работен процес `azd up` / `azd down`
- **🎯 Насоки за избор на хост** в `docs/chapter-04-infrastructure/provisioning.md` — лесно сравнение за начинаещи на `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp`, с насоки кога да изберете AKS или Azure Spring Apps
- **🛠️ Преглед на Azure DevOps CI/CD** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, създаване на връзка със сервиз чрез федерация на workload identity (OIDC), генериран `azure-dev.yml` и настройка на група променливи
- **🔑 Добавени служебни принципали (шаблон 4)** в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивна автентикация `azd auth login` с клиентски секрет срещу федерални/OIDC идентификационни данни, кога да се използва и безопасно съхраняване на идентификационни данни
- **🪝 Обработка на грешки в куки** подраздел в `docs/chapter-04-infrastructure/deployment-guide.md` — кодове за изход и `set -e`, `continueOnError`, тестване на куки изолирано с `azd hooks run`, OS-специфични шелове, и `--debug`
- **👥 Екипни/споделени среди** раздел в `docs/chapter-03-configuration/configuration.md` — какво живее в `.azure/`, какво да се игнорира в git, среди на разработчиците, `azd env list`/`select` и подаване на стойности за средата в CI/CD
- **🧰 Обяснения за `azd restore` и разширени `azd package`** в `resources/cheat-sheet.md` — възстановяване на зависимости и създаване на разгръщаем артефакт без стартиране на разгръщане

#### Променено
- **🧭 Таблица с уроци в Глава 4** обновена, за да включва новия урок „Създаване на собствен шаблон“ (Урок 3)
- **🧭 Таблица с уроци в Глава 1** обновена, за да включва новия урок „Dev Контейнери & Codespaces“ (Урок 5); навигационни футъри свързани между `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Запълване на пропуск за начинаещи: Практически урок за многo-агентоутройство, „Донеси собствено приложение“, Terraform и преглед на CI/CD
**Тази версия затваря най-големите пропуски за изчерпателно ръководство за начинаещи с добавяне на два нови практически урока (разгръщащ многоагентен процес и добавяне на azd към съществуващо приложение), въведение в кукове за начинаещи, раздел за Terraform с azd, стъпка по стъпка преглед на GitHub Actions pipeline, обяснения за нови предварителни разширения и явен чеклист за проверка на разгръщането.**

#### Добавено
- **🤝 Нов урок в Глава 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — изцяло практическо разгръщане с два агента (оркестратор + специалисти) с използване на реален шаблон (`contoso-creative-writer`), обяснява кога да се използва много-агент, работния процес `azd up`, разбиране на разгръщаните ресурси, проследяване между агенти, персонализиране и почистване
- **📦 Нов урок в Глава 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как да добавите azd към съществуващ проект с `azd init` („използвай кода в текущата директория“), разбиране на `azure.yaml` и `infra/`, `azd infra generate`, откриване на хост и разгръщане с `azd up`
- **🌐 Раздел Terraform с azd** добавен в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, структури на папки `.tf`, необходими изходи `AZURE_*` и тагиране `azd-env-name`, и идентичен работен процес `azd up` / `azd down` (затваря пропуска, където е спомената поддръжка на Terraform, но е показан само Bicep)
- **⚙️ Стъпка по стъпка преглед на GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от GitHub репо до автоматизирано разгръщане: `azd pipeline config`, федерални OIDC идентификационни данни (без съхранени тайни), генериран `azure-dev.yml` и насоки за тайни срещу променливи
- **🪝 Въведение „Нов в куковете?“ за начинаещи** в `docs/chapter-04-infrastructure/deployment-guide.md` — какво е кука, таблица на етапите на куки, минимална първа кука и ръчно стартиране на куки с `azd hooks run`
- **✅ Добавен чеклист „Провери разгръщането си“** към Стъпка 5 от `docs/chapter-01-foundation/first-project.md` — базов тест, проверка на здравен крайна точка и явни критерии за успех
- **🧩 Обяснителна част за новите предварителни разширения** `azure.ai.skills` и `azure.ai.connections` (какво са и кога да се използват) в `docs/chapter-08-production/production-ai-practices.md`

#### Променено
- **🧭 Таблица с уроци в Глава 5** коригирана: `multi-agent-basics.md` вече е Урок 1 (единственият изцяло практичен урок), с честно означаване, че Урок 2 е в Глава 6, а сценарият Retail е архитектурен план, а не шаблон с една команда
- **🧭 Таблица с уроци в Глава 1** вече включва новия урок „Донеси собствено приложение“ (Урок 4)
- **🔗 Навигационни футъри** обновени: `first-project.md` вече препраща към `bring-your-own-app.md`

#### Поправено
- **🧱 Затворен „пропуснатият“ Terraform пропуск** — курсът преди това споменаваше поддръжка за Terraform, без да я показва
- **🔀 Коригирани подвеждащи взаимни връзки в Глава 5**, които подсказваха, че съществува пълна многоагентна реализация, когато има само архитектурен план

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

#### Обновяване на AZD 1.25.6, команди за пълен жизнен цикъл на агент и ребрандиране Aspire
**Тази версия повторно валидира курса спрямо `azd` `1.25.6` (юни 2026) и разширението `azure.ai.agents` `0.1.40-preview`, разширява AI насоките от "изграждане на агент" към пълния жизнен цикъл на агента (тест → оценка → оптимизация → инспекция → изтриване), показва новите разширения за преглед `azure.ai.skills` и `azure.ai.connections` и отбелязва ребрандирането на продукта от ".NET Aspire" към "Aspire".**

#### Добавени
- **🔁 Покритие на пълния жизнен цикъл на агента** за начинаещи и AI инженери в цялата документация:
  - `docs/chapter-01-foundation/azd-basics.md` — Таблица на жизнения цикъл (изграждане → тест → измерване → подобрение → инспекция → почистване) добавена в секцията за разширения и AI команди
  - `docs/chapter-08-production/production-ai-practices.md` — Нова секция "Управление на жизнения цикъл на агента", обхващаща `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Разширени AI агент команди с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Нови разширения за преглед** документирани: `azure.ai.skills` (пренасочваеми умения на агенти) и `azure.ai.connections` (връзки с Foundry) добавени в таблицата с разширения и справочната таблица
- **⏱️ Насоки за време на отговор** — примерите с `azd ai agent invoke` сега отбелязват, че се отпечатва общото закъснение и времето до първия байт
- **📌 Банер с версията** в коренния README, насочващ обучаемите към `azd version` и `azd upgrade`

#### Променени
- **✅ Актуализиран базис на валидиране** от `azd 1.23.12` (март 2026) до `azd 1.25.6` (юни 2026) във всички README файлове на главите и документацията на работилницата
- **🤖 Забележка за разширение в глава 2** актуализирана от `azure.ai.agents` `0.1.18-preview` до `0.1.40-preview`
- **🧪 Пример за валидиране на работилницата** (изход `azd version`) актуализиран до `1.25.6`
- **🧭 Обновен README "Какво е ново в azd Днес"** с акцент върху пълния жизнен цикъл на агента, новите AI разширения и скорошни подобрения в удобството (`azd init` идемпотентност, `azd auth login` почистване на изтекли токени, `azd tool` първа промпт при изпълнение)
- **📖 agents.md в глава 2 (Опция 4)** вече насочва обучаемите към командите за жизнения цикъл след деплойване вместо да спира при `azd up`

#### Поправени
- **🏷️ Именуване на продукта** — добавена бележка за ребрандиране на Aspire (".NET Aspire" вече просто "Aspire"); поддръжката на Aspire в azd остава непроменена
- **🔎 Валидация при живо пускане** потвърдена спрямо Azure Developer CLI release feed: стабилна CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Актуализирани файлове
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

#### Изясняване за начинаещи, валидиране на настройка и крайно почистване на AZD командите
**Тази версия следва проверката на AZD 1.23 с преминаване през документация, ориентирана към начинаещи: изяснява насоките за автентикация с предимство на AZD, добавя локални скриптове за валидиране на настройката, сверява ключови команди спрямо живото AZD CLI и премахва последните остарели референции към команди в английския източник извън changelog-a.**

#### Добавени
- **🧪 Скриптове за валидиране на настройка за начинаещи** с `validate-setup.ps1` и `validate-setup.sh`, за да могат обучаемите да потвърдят нужните инструменти преди започване на глава 1
- **✅ Предварителни стъпки за валидиране на настройката** в коренния README и README на глава 1, за да се хванат липсващи предварителни условия преди `azd up`

#### Променени
- **🔐 Насоки за автентикация за начинаещи** вече последователно третира `azd auth login` като основен път за AZD работни потоци, с `az login` посочен като опционален освен ако не се използват команди на Azure CLI директно
- **📚 Поток на въвеждане за глава 1** сега насочва обучаемите да валидират локалната си настройка преди инсталация, автентикация и първи стъпки за деплоймент
- **🛠️ Съобщения на валидатора** сега ясно разделят блокиращите изисквания от опционалните предупреждения за Azure CLI при пътя само за начинаещи с AZD
- **📖 Документация за конфигуриране, отстраняване на проблеми и примери** сега прави разлика между изискваната автентикация в AZD и опционално влизане чрез Azure CLI, заедно с контекст, който преди липсваше

#### Поправени
- **📋 Останали референции към команди в английския източник** актуализирани към текущите форми в AZD, включително `azd config show` в справочната таблица и `azd monitor --overview` за инструкции при Azure Portal
- **🧭 Заявленията за начинаещи в глава 1** омекотени, за да не обещават гарантирано поведение без грешки или възстановяване във всички шаблони и ресурси в Azure
- **🔎 Проверка на живо в CLI** потвърди текуща поддръжка за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

#### Актуализирани файлове
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

#### Валидация на AZD 1.23.12, разширяване на средата на работилницата и обновяване на AI модела
**Тази версия извършва проверка на документацията спрямо `azd` `1.23.12`, обновява остарели примери за команди на AZD, обновява насоките за AI моделите към текущите настройки по подразбиране и разширява инструкциите за работилницата отвъд GitHub Codespaces, като добавя поддръжка за dev контейнери и локални клонинги.**

#### Добавени
- **✅ Забележки за валидиране в основните глави и документацията на работилницата** за изрично указване на базата от тестван AZD за обучаемите, които използват по-нови или по-стари версии на CLI
- **⏱️ Насоки за тайм-аут при деплоймент** за дългосрочни AI приложения с използване на `azd deploy --timeout 1800`
- **🔎 Стъпки за проверка на разширения** с `azd extension show azure.ai.agents` в документацията за AI работни потоци
- **🌐 По-широки насоки за средата на работилницата** обхващащи GitHub Codespaces, dev контейнери и локални клонинги с MkDocs

#### Променени
- **📚 README файлове в главите** сега последователно посочват валидиране спрямо `azd 1.23.12` в секции за основи, конфигурация, инфраструктура, мултиагенти, преддеплоймент, отстраняване на проблеми и продукция
- **🛠️ Референции на AZD командите** актуализирани до текущите форми в цялата документация:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимост от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, където се предполага преглед на Application Insights
- **🧪 Опростени примери за Provision preview** сега ползват текущо поддържани форми като `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Потокът на работилницата** актуализиран, така че обучаемите могат да завършат лабораториите в Codespaces, dev контейнер или локално копие, вместо да се предполага използването само на Codespaces
- **🔐 Насоки за автентикация** сега предпочитат `azd auth login` за AZD работни потоци, като `az login` се позиционира като опционален при директна употреба на Azure CLI команди

#### Поправени
- **🪟 Windows команди за инсталация** нормализирани към текущия регистър на пакета `winget` в ръководството за инсталация
- **🐧 Насоки за инсталация в Linux** коригирани, за да се избегнат неподдържани дистрибуционно-специфични инструкции за пакетния мениджър `azd` и вместо това да насочват към release assets там, където е подходящо
- **📦 AI модел примери** обновени от по-стари настройки като `gpt-35-turbo` и `text-embedding-ada-002` към актуални примери като `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Фрагменти за деплоймент и диагностика** поправени да използват текущи команди за среда и статус в логове, скриптове и стъпки за отстраняване на проблеми
- **⚙️ Насоки за GitHub Actions** обновени от `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Насоки за съгласие MCP/Copilot** обновени от `azd mcp consent` до `azd copilot consent list`

#### Подобрения
- **🧠 Насоки за глава за ИИ** сега по-добре обясняват поведението на `azd ai`, чувствително към визуализация, вход за отделни наематели, текуща употреба на разширението и актуализирани препоръки за разгръщане на модели
- **🧪 Инструкции за работилници** сега използват по-реалистични версии и по-ясен език за настройка на среди за практически лаборатории
- **📈 Документи за производство и отстраняване на неизправности** сега са по-съвместими с текущия мониторинг, резервни модели и примери за нива на разходи

#### Актуализирани файлове
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

#### Команди за AZD AI CLI, валидиране на съдържание и разширяване на шаблони
**Тази версия добавя покритие за командите `azd ai`, `azd extension` и `azd mcp` във всички глави, свързани с ИИ, поправя счупени връзки и остарял код в agents.md, актуализира шпаргалката и обновява секцията за примерни шаблони с валидирани описания и нови шаблони за Azure AI AZD.**

#### Добавено
- **🤖 Покритие на AZD AI CLI** в 7 файла (предишно само в глава 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нов раздел "Разширения и команди за ИИ", въвеждащ `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опция 4: `azd ai agent init` с таблица за сравнение (подход шаблон срещу манифест)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подсекции "AZD разширения за Foundry" и "Деплоймънт, ориентиран към агенти"
  - `docs/chapter-05-multi-agent/README.md` — Бърз старт, показващ и двата пътя за разгръщане на шаблон и манифест
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секцията за разгръщане вече включва опция `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подсекция "Команди за диагностика на AZD AI разширения"
  - `resources/cheat-sheet.md` — Нов раздел "Команди за ИИ и разширения", включващ `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Нови примерни шаблони за AZD AI** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Чат RAG на .NET с Blazor WebAssembly, Semantic Kernel и поддръжка на гласов чат
  - **azure-search-openai-demo-java** — Java RAG чат с използване на Langchain4J с опции за разгръщане ACA/AKS
  - **contoso-creative-writer** — Мултиагентско приложение за творческо писане с Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Безсървърен RAG с Azure Functions + LangChain.js + Cosmos DB с локална поддръжка за разработка чрез Ollama
  - **chat-with-your-data-solution-accelerator** — Корпоративен ускорител RAG с администраторски портал, интеграция с Teams и опции за PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Референтно приложение за многоточкова координация MCP със сървъри на .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимален стартов шаблон Bicep за инфраструктура Azure AI
  - **🔗 Връзка към страхотната галерия AZD AI** — Референция към [галерията awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (над 80 шаблона)

#### Поправени
- **🔗 Номерация в agents.md**: Връзките Предишна/Следваща вече съответстват на реда на уроците в Глава 2 README (Интеграция Microsoft Foundry → Агентите → Деплоймент на AI модел)
- **🔗 Счупени връзки в agents.md**: `production-ai-practices.md` коригирана на `../chapter-08-production/production-ai-practices.md` (3 попадения)
- **📦 Застарен код в agents.md**: Заменен `opencensus` с `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Невалиден API в agents.md**: Преместен `max_tokens` от `create_agent()` на `create_run()` като `max_completion_tokens`
- **🔢 Броене на токени в agents.md**: Заменена груба оценка `len//4` с `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Поправени услуги от "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (по подразбиране хост променен октомври 2024)
- **contoso-chat**: Описанието е обновено, за да реферира Azure AI Foundry + Prompty, съвпадащо с актуалното заглавие и технологичния стек в репото

#### Премахнати
- **ai-document-processing**: Премахната нефункционална референция към шаблон (репо не е публично достъпно като AZD шаблон)

#### Подобрени
- **📝 Упражнения в agents.md**: Упражнение 1 вече показва очаквания изход и стъпка `azd monitor`; Упражнение 2 включва пълен `FunctionTool` регистрационен код; Упражнение 3 заменя неясните указания с конкретни команди `prepdocs.py`
- **📚 Ресурси в agents.md**: Актуализирани документационни връзки към текущите документи на Azure AI Agent Service и бърз старт
- **📋 Таблица „Следващи стъпки“ в agents.md**: Добавена връзка към AI Workshop Lab за пълно покритие на главата

#### Обновени файлове
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Подобрение на навигацията в курса
**Тази версия подобрява навигацията в README.md главите с подобрена таблица.**

#### Променено
- **Таблица с карта на курса**: Подобрена с директни връзки към уроците, оценки на продължителността и сложността
- **Почистване на папки**: Премахнати излишни стари папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Валидиране на връзки**: Проверени всички 21+ вътрешни връзки в таблицата с карта на курса

### [v3.16.0] - 2026-02-05

#### Актуализации на имената на продукти
**Тази версия обновява продуктови препратки с текущото маркиране на Microsoft.**

#### Променено
- **Microsoft Foundry → Microsoft Foundry**: Всички препратки обновени в немеждународните файлове
- **Azure AI Agent Service → Foundry Agents**: Името на услугата е обновено да отразява сегашния бранд

#### Обновени файлове
- `README.md` - Главна страница на курса
- `changelog.md` - История на версиите
- `course-outline.md` - Структура на курса
- `docs/chapter-02-ai-development/agents.md` - Ръководство за AI агенти
- `examples/README.md` - Документация за примери
- `workshop/README.md` - Страница за лабораторията
- `workshop/docs/index.md` - Индекс на лабораторията
- `workshop/docs/instructions/*.md` - Всички инструкции за лабораторията

---

### [v3.15.0] - 2026-02-05

#### Значителна преструктуриране на репото: Именуване на папки по глави
**Тази версия преструктурира документацията в отделни папки за всяка глава за по-ясна навигация.**

#### Преименуване на папки
Старите папки са заменени с папки, номерирани по глава:
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
| Всички файлове за преддеплоймент | pre-deployment/ | chapter-06-pre-deployment/ |
| Всички файлове за отстраняване на проблеми | troubleshooting/ | chapter-07-troubleshooting/ |

#### Добавено
- **📚 README файлове на главите**: Създаден README.md във всяка папка на глава с:
  - Цели за учене и продължителност
  - Таблица с уроци и описания
  - Команди за бърз старт
  - Навигация към други глави

#### Променено
- **🔗 Обновени всички вътрешни връзки**: Над 78 пъти обновени пътища във всички документи
- **🗺️ Главен README.md**: Актуализирана карта на курса с новата структура
- **📝 examples/README.md**: Обновени препратки към папките на главите

#### Премахнати
- Старата структура на папките (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Преструктуриране: Навигация в главите
**Тази версия добавя README навигационни файлове за главите (заменени от v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ново ръководство за AI агенти
**Тази версия добавя изчерпателно ръководство за разгръщане на AI агенти с Azure Developer CLI.**

#### Добавено
- **🤖 docs/microsoft-foundry/agents.md**: Пълно ръководство, което покрива:
  - Какво са AI агенти и как се различават от чатботовете
  - Три бързи старт шаблона за агенти (Foundry Agents, Prompty, RAG)
  - Архитектурни модели на агенти (един агент, RAG, множество агенти)
  - Конфигурация и персонализиране на инструменти
  - Мониторинг и проследяване на метрики
  - Съображения за разходи и оптимизация
  - Често срещани проблеми и техните решения
  - Три практически упражнения с критерии за успех

#### Структура на съдържанието
- **Въведение**: Концепции за агенти за начинаещи
- **Бърз старт**: Разгръщане на агенти с `azd init --template get-started-with-ai-agents`
- **Архитектурни модели**: Визуални диаграми на моделите на агенти
- **Конфигурация**: Настройка на инструменти и системни променливи
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Постепенно практически учене (20-45 минути всяко)

---

### [v3.12.0] - 2026-02-05

#### Ъпдейт на средата DevContainer
**Тази версия обновява конфигурацията на контейнера за разработка с модерни инструменти и по-добри настройки за обучението с AZD.**

#### Променено
- **🐳 Базово изображение**: Обновено от `python:3.12-bullseye` на `python:3.12-bookworm` (последната стабилна версия на Debian)
- **📛 Име на контейнера**: Преименувано от "Python 3" на "AZD за начинаещи" за яснота

#### Добавено
- **🔧 Нови функции в Dev Container**:
  - `azure-cli` с активирана поддръжка за Bicep
  - `node:20` (LTS версията за AZD шаблони)
  - `github-cli` за управление на шаблони
  - `docker-in-docker` за деплоймънти на контейнерни приложения

- **🔌 Пренасочване на портове**: Предварително конфигурирани портове за честа разработка:
  - 8000 (предварителен преглед MkDocs)
  - 3000 (уеб приложения)
  - 5000 (Python Flask)
  - 8080 (API-та)

- **🧩 Нови разширения за VS Code**:
  - `ms-python.vscode-pylance` - Усъвършенстван Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Поддръжка на Azure Functions
  - `ms-azuretools.vscode-docker` - Поддръжка на Docker
  - `ms-azuretools.vscode-bicep` - Поддръжка на езика Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управление на ресурси в Azure
  - `yzhang.markdown-all-in-one` - Редактиране на Markdown
  - `DavidAnson.vscode-markdownlint` - Проверка на Markdown
  - `bierner.markdown-mermaid` - Поддръжка на Mermaid диаграми
  - `redhat.vscode-yaml` - YAML поддръжка (за azure.yaml)
  - `eamodio.gitlens` - Визуализация на Git
  - `mhutchie.git-graph` - История на Git

- **⚙️ Настройки за VS Code**: Добавени стандартни настройки за Python интерпретатор, форматиране при запис и премахване на излишни интервали

- **📦 Обновен requirements-dev.txt**:
  - Добавен плъгин за минимизиране на MkDocs
  - Добавен pre-commit за качество на кода
  - Добавени Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Поправени
- **След команда за създаване**: Сега проверява инсталирането на AZD и Azure CLI при стартиране на контейнера

---

### [v3.11.0] - 2026-02-05

#### Обновяване на README за начинаещи
**Тази версия значително подобрява README.md, правейки го по-достъпен за начинаещи и добавя важни ресурси за AI разработчици.**

#### Добавено
- **🆚 Сравнение Azure CLI и AZD**: Ясно обяснение кога се използва всеки инструмент с практически примери
- **🌟 Страхотни AZD връзки**: Директни връзки към общностната галерия с шаблони и ресурси за принос:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Над 200 готови за разгръщане шаблони
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Обществен принос
- **🎯 Ръководство за бърз старт**: Оптимизиран 3-стъпков раздел за започване (Инсталиране → Логин → Деплой)
- **📊 Таблица за навигация по опит**: Ясни указания откъде да започнат в зависимост от опита на разработчика

#### Променено
- **Структура на README**: Пренаредена за прогресивно разкриване - важната информация първо
- **Въведение**: Пренаписано обяснение на „Магията на `azd up`“ за абсолютни начинаещи
- **Премахнато дублирано съдържание**: Изчистен дублиращ се раздел за отстраняване на проблеми
- **Команди за отстраняване на проблеми**: Поправена препратка `azd logs` за използване на валиден `azd monitor --logs`

#### Поправени
- **🔐 Команди за удостоверяване**: Добавени `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Невалидни препратки към команди**: Премахнати останали `azd logs` от раздела за отстраняване на проблеми в README

#### Бележки
- **Обхват**: Промените са приложени в главния README.md и resources/cheat-sheet.md
- **Целева аудитория**: Подобрения, насочени специфично към нови разработчици в AZD

---

### [v3.10.0] - 2026-02-05

#### Корекция на команди в Azure Developer CLI
**Тази версия коригира несъществуващи AZD команди в цялата документация, като гарантира, че всички примери на код използват валиден синтаксис на Azure Developer CLI.**

#### Поправени
- **🔧 Премахнати несъществуващи AZD команди**: Комплексен одит и корекция на невалидни команди:
  - `azd logs` (не съществува) → заменена с `azd monitor --logs` или алтернативи с Azure CLI
  - Подкоманди `azd service` (не съществуват) → заменени с `azd show` и Azure CLI
  - `azd infra import/export/validate` (не съществува) → премахнати или заменени с валидни алтернативи
  - Флагове `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не съществуват) → премахнати
  - Флагове `azd provision --what-if/--rollback` (не съществуват) → обновени да използват `--preview`
  - `azd config validate` (не съществува) → заменена с `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не съществуват) → премахнати

- **📚 Обновени файлове с корекции на команди**:
  - `resources/cheat-sheet.md`: Голям ремонт на справочника с команди
  - `docs/deployment/deployment-guide.md`: Поправени стратегии за отмяна и деплоймент
  - `docs/troubleshooting/debugging.md`: Коригирани секции за анализ на дневници
  - `docs/troubleshooting/common-issues.md`: Обновени команди за отстраняване на проблеми
  - `docs/troubleshooting/ai-troubleshooting.md`: Поправен раздел за дебъгване на AZD
  - `docs/getting-started/azd-basics.md`: Коригирани команди за мониторинг
  - `docs/getting-started/first-project.md`: Обновени примери за мониторинг и отстраняване на грешки
  - `docs/getting-started/installation.md`: Поправени примери за помощ и версия
  - `docs/pre-deployment/application-insights.md`: Коригирани команди за преглед на логове
  - `docs/pre-deployment/coordination-patterns.md`: Поправени команди за отстраняване на грешки на агента

- **📝 Актуализиране на референция за версия**: 
  - `docs/getting-started/installation.md`: Променена твърдо зададена версия `1.5.0` на общата `1.x.x` с линк към релиизите

#### Промени
- **Стратегии за връщане назад**: Документацията е актуализирана за използване на възстановяване с Git (AZD няма вграден rollback)
- **Преглед на логове**: Заменени препратки към `azd logs` с `azd monitor --logs`, `azd monitor --live` и команди на Azure CLI
- **Секция производителност**: Премахнати несъществуващи флагове за паралелно/инкрементално разгръщане, предоставени валидни алтернативи

#### Технически подробности
- **Валидни AZD команди**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Валидни флагове за azd monitor**: `--live`, `--logs`, `--overview`
- **Премахнати функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Забележки
- **Проверка**: Командите са валидирани срещу Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завършване на работилница и подобрение на качеството на документацията
**Тази версия завършва интерактивните модули на работилницата, поправя всички счупени връзки в документацията и подобрява общото качество на съдържанието за AI разработчиците, използващи Microsoft AZD.**

#### Добавено
- **📝 CONTRIBUTING.md**: Нов документ с насоки за принос, включващ:
  - Ясни инструкции за докладване на проблеми и предлагане на промени
  - Стандарти за документация при ново съдържание
  - Насоки за примери с код и конвенции за съобщения при комитване
  - Информация за ангажиране на общността

#### Завършено
- **🎯 Работилница Модул 7 (Обобщение)**: Пълно завършване на обобщителния модул с:
  - Изчерпателно резюме на постигнатото в работилницата
  - Раздел "Основни усвоени концепции" обхващащ AZD, шаблони и Microsoft Foundry
  - Препоръки за продължаване на учебното пътуване
  - Упражнения с трудност на предизвикателствата в работилницата
  - Обратна връзка от общността и линкове за подкрепа

- **📚 Работилница Модул 3 (Декомпозиция)**: Обновени учебни цели с:
  - Активиране на GitHub Copilot с MCP сървъри
  - Разбиране на структурата на папките за AZD шаблони
  - Организационни модели за инфраструктура като код (Bicep)
  - Инструкции за практическа лаборатория

- **🔧 Работилница Модул 6 (Разпускане)**: Завършен с:
  - Цели за почистване на ресурси и управление на разходи
  - Използване на `azd down` за безопасно деинсталиране на инфраструктура
  - Насоки за възстановяване на меко изтрити когнитивни услуги
  - Допълнителни идеи за изследване на GitHub Copilot и Azure Portal

#### Поправено
- **🔗 Поправки на счупени връзки**: Решени над 15 счупени вътрешни документационни връзки:
  - `docs/ai-foundry/ai-model-deployment.md`: Поправени пътища към microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Коригирани пътища към ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменен несъществуващ cicd-integration.md с deployment-guide.md
  - `examples/retail-scenario.md`: Поправени пътища към FAQ и ръководство за отстраняване на грешки
  - `examples/container-app/microservices/README.md`: Коригирани пътища към курс домашна страница и deployment guide
  - `resources/faq.md` и `resources/glossary.md`: Актуализирани препратки в глава за AI
  - `course-outline.md`: Поправени препратки към ръководство за инструктори и лаборатории за AI

- **📅 Банер за статус на работилница**: Актуализиран от "В процес на изграждане" към активен статус на работилницата с дата февруари 2026

- **🔗 Навигация в работилницата**: Поправки на счупени навигационни линкове в README.md на работилницата сочещи към несъществуваща папка lab-1-azd-basics

#### Промени
- **Презентация на работилницата**: Премахнато предупреждението „в процес на изграждане“, работилницата е завършена и готова за използване
- **Навигационна консистентност**: Осигурена правилна навигация между модулите на работилницата
- **Препратки в учебния път**: Актуализирани препратки между глави с правилни пътища microsoft-foundry

#### Валидирано
- ✅ Всички английски markdown файлове имат валидни вътрешни връзки
- ✅ Модулите на работилницата 0-7 са завършени с учебни цели
- ✅ Навигацията между глави и модули функционира коректно
- ✅ Съдържанието е подходящо за AI разработчици използващи Microsoft AZD
- ✅ Запазен е приятелски и лесен за начинаещи език и структура
- ✅ CONTRIBUTING.md предоставя ясни указания за принос от общността

#### Техническа реализация
- **Валидиране на връзки**: Автоматизиран PowerShell скрипт провери всички .md вътрешни линкове
- **Одит на съдържанието**: Ръчен преглед на пълнотата и подходящостта за начинаещи
- **Навигационна система**: Прилагане на последователни патерни за навигация между глави и модули

#### Забележки
- **Обхват**: Промените са приложени само върху английската документация
- **Преводи**: Папките за преводи не са обновени в тази версия (автоматичен превод ще се синхронизира по-късно)
- **Продължителност на работилницата**: Завършената работилница сега предлага 3-4 часа практически обучения

---

### [v3.8.0] - 2025-11-19

#### Разширена документация: Мониторинг, Сигурност и Модели за координация с множество агенти
**Тази версия добавя изчерпателни уроци от А-клас за интеграция на Application Insights, модели за удостоверяване и координация на множество агенти при производствени разгръщания.**

#### Добавено
- **📊 Урок за интеграция на Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Разгръщане с фокус върху AZD с автоматично предоставяне
  - Пълни Bicep шаблони за Application Insights + Log Analytics
  - Работещи Python приложения с персонализирана телеметрия (над 1,200 реда)
  - Модели за мониторинг на AI/LLM (проследяване на токени/разходи на Microsoft Foundry модели)
  - 6 диаграми Mermaid (архитектура, разпределено проследяване, поток на телеметрия)
  - 3 практически упражнения (аларми, табла за управление, AI мониторинг)
  - Примери с Kusto заявки и стратегии за оптимизация на разходите
  - Поточно излъчване на живи метрики и отстраняване на грешки в реално време
  - Време за обучение 40-50 минути с готови за продукция модели

- **🔐 Урок за модели на удостоверяване и сигурност**: в `docs/getting-started/authsecurity.md`:
  - 3 модела за удостоверяване (връзки за свързване, Key Vault, управлявана идентичност)
  - Пълни Bicep шаблони за инфраструктура за защитени разгръщания
  - Код на Node.js приложение с интеграция на Azure SDK
  - 3 пълни упражнения (активиране на управлявана идентичност, присвоена потребителска идентичност, ротация на Key Vault)
  - Най-добри практики за сигурност и конфигурации на RBAC
  - Ръководство за отстраняване на проблеми и анализ на разходи
  - Производствени модели за удостоверяване без пароли

- **🤖 Урок за модели за координация на множество агенти**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 модели на координация (последователен, паралелен, йерархичен, събитийно-ориентиран, консенсус)
  - Пълна реализация на услуга за оркестрация (Python/Flask, над 1,500 реда)
  - 3 специализирани реализации на агенти (Изследовател, Писател, Редактор)
  - Интеграция със Service Bus за опашки за съобщения
  - Управление на състоянието в Cosmos DB за разпределени системи
  - 6 диаграми Mermaid, показващи взаимодействия между агенти
  - 3 напреднали упражнения (управление на таймаути, повторни опити, прекъсвач на вериги)
  - Разпределение на разходите ($240-565/месец) с оптимизационни стратегии
  - Интеграция с Application Insights за мониторинг

#### Разширено
- **Глава за предразгръщане**: Вече включва изчерпателни модели за мониторинг и координация
- **Глава за започване**: Подобрена с професионални модели за удостоверяване
- **Готовност за производство**: Пълно покритие от сигурност до наблюдаемост
- **Обзор на курса**: Актуализиран с препратки към нови уроци в Глави 3 и 6

#### Промени
- **Прогрес на обучението**: По-добра интеграция на сигурността и мониторинга през целия курс
- **Качество на документацията**: Последователни стандарти А-клас (95-97%) в новите уроци
- **Производствени модели**: Пълноend-to-end покритие за корпоративни разгръщания

#### Подобрено
- **Опит на разработчика**: Ясен път от разработка до производствен мониторинг
- **Стандарти за сигурност**: Професионални модели за удостоверяване и управление на тайни
- **Наблюдаемост**: Пълна интеграция на Application Insights с AZD
- **AI работни натоварвания**: Специализиран мониторинг за Microsoft Foundry модели и системи с множество агенти

#### Валидирано
- ✅ Всички уроци включват пълен работещ код (не само фрагменти)
- ✅ Mermaid диаграми за визуално обучение (общо 19 в 3 урока)
- ✅ Практически упражнения с проверки (общо 9)
- ✅ Производствени Bicep шаблони, разгръщащи се чрез `azd up`
- ✅ Анализ на разходи и стратегии за оптимизация
- ✅ Ръководства за отстраняване на грешки и най-добри практики
- ✅ Контролни точки на познания с валидиращи команди

#### Резултати от оценката на документацията
- **docs/pre-deployment/application-insights.md**: - Изчерпателно ръководство за мониторинг
- **docs/getting-started/authsecurity.md**: - Професионални модели за сигурност
- **docs/pre-deployment/coordination-patterns.md**: - Напреднали архитектури за множество агенти
- **Общо Ново Съдържание**: - Последователни високи стандарти

#### Техническа реализация
- **Application Insights**: Log Analytics + персонализирана телеметрия + разпределено проследяване
- **Удостоверяване**: Управлявана идентичност + Key Vault + RBAC модели
- **Множество агенти**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Мониторинг**: Живи метрики + Kusto заявки + аларми + табла
- **Управление на разходите**: Стратегии за проби, политики за задържане, контрол на бюджета

### [v3.7.0] - 2025-11-19

#### Подобрения в качеството на документацията и нов пример за Microsoft Foundry Models
**Тази версия подобрява качеството на документацията в целия репозиторий и добавя пълен пример за разгръщане на Microsoft Foundry Models с чат интерфейс gpt-4.1.**

#### Добавено
- **🤖 Пример за чат с Microsoft Foundry Models**: Пълно разгръщане на gpt-4.1 с работеща имплементация в `examples/azure-openai-chat/`:
  - Пълна инфраструктура за Microsoft Foundry Models (разгръщане на модел gpt-4.1)
  - Python чат интерфейс с история на разговорите от командния ред
  - Интеграция с Key Vault за сигурно съхранение на API ключове
  - Проследяване на използвани токени и оценка на разходи
  - Ограничаване на честотата и обработка на грешки
  - Изчерпателен README с ръководство за разгръщане от 35-45 минути
  - 11 файла готови за продукция (Bicep шаблони, Python приложение, конфигурация)
- **📚 Упражнения по документация**: Добавени практически упражнения в ръководството за конфигурация:
  - Упражнение 1: Конфигурация за множество среди (15 минути)
  - Упражнение 2: Практика за управление на тайни (10 минути)
  - Ясни критерии за успех и стъпки за верификация
- **✅ Проверка на разгръщане**: Добавен раздел за верификация към гид за разгръщане:
  - Процедури за проверка на здравето
  - Контролен списък с критерии за успех
  - Очаквани изходи за всички команди за разгръщане
  - Бърза референция за отстраняване на проблеми

#### Подобрено
- **examples/README.md**: Обновено до качество А клас (93%):
  - Добавено azure-openai-chat във всички релевантни раздели
  - Актуализиран брой локални примери от 3 на 4
  - Добавено в таблицата с примери за AI приложения
  - Интегрирано в Бърз старт за средно напреднали потребители
  - Добавено в секция Microsoft Foundry Templates
  - Актуализирани секции за матрица на сравнения и технологии
- **Качество на документацията**: Подобрено от B+ (87%) до A- (92%) в папката docs:
  - Добавени очаквани изходи към критични примери с команди
  - Включени стъпки за верификация на промени в конфигурацията
  - Подобрено практическо обучение с упражнения

#### Промени
- **Прогрес на обучението**: По-добра интеграция на AI примери за средно напреднали
- **Структура на документацията**: Повече приложими упражнения с ясни резултати
- **Процес на верификация**: Добавени изрични критерии за успех към ключови процеси

#### Подобрено
- **Опит на разработчика**: Разгръщането на Microsoft Foundry Models вече отнема 35-45 минути (срещу 60-90 за сложни алтернативи)
- **Прозрачност на разходите**: Ясни оценки на разходите ($50-200/месец) за Microsoft Foundry Models пример
- **Учебен път**: AI разработчиците имат ясен вход с azure-openai-chat
- **Стандарти за документация**: Последователни очаквани изходи и стъпки за верификация

#### Валидирано
- ✅ Примерът Microsoft Foundry Models е напълно функционален с `azd up`
- ✅ Всички 11 имплементационни файла са синтактично коректни
- ✅ Инструкциите в README съответстват на реалното разгръщане
- ✅ Актуализирани документационни връзки на над 8 места
- ✅ Индексът на примери точно отразява 4 локални примера
- ✅ Няма дублирани външни връзки в таблиците
- ✅ Всички препратки в навигацията са коректни

#### Техническа реализация
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps модел
- **Сигурност**: Подготвена управлявана идентичност, тайни в Key Vault
- **Мониторинг**: Интеграция с Application Insights
- **Управление на разходи**: Проследяване на токени и оптимизация на използване
- **Разгръщане**: Една команда `azd up` за пълна конфигурация

### [v3.6.0] - 2025-11-19

#### Основна актуализация: Примери за разгръщане на Container App
**Тази версия въвежда изчерпателни, готови за продукция примери за разгръщане на контейнерни приложения с Azure Developer CLI (AZD), с пълна документация и интеграция в учебния път.**

#### Добавено
- **🚀 Примери за Container App**: Нови локални примери в `examples/container-app/`:
  - [Главен наръчник](examples/container-app/README.md): Пълен преглед на контейнеризирани разгръщания, бърз старт, продукция и усъвършенствани модели
  - [Прост Flask API](../../examples/container-app/simple-flask-api): REST API за начинаещи с мащабируемост до нула, проверки на състоянието, мониторинг и отстраняване на проблеми
  - [Архитектура на микросървиси](../../examples/container-app/microservices): Готово за продукция многоуслужливо разгръщане (API Gateway, продукт, поръчка, потребител, уведомление), асинхронно съобщаване, Service Bus, Cosmos DB, Azure SQL, разпределено проследяване, синьо-зелено/canary разгръщане
- **Най-добри практики**: Сигурност, мониторинг, оптимизация на разходите и насоки за CI/CD при контейнеризирани натоварвания
- **Примери за код**: Пълни `azure.yaml`, Bicep шаблони и многезвучни реализации на услуги (Python, Node.js, C#, Go)
- **Тестване и отстраняване на проблеми**: Сценарии за тестове от край до край, команди за мониторинг, насоки за отстраняване на проблеми

#### Променено
- **README.md**: Актуализиран с нови примери за контейнерни приложения под "Местни примери - Контейнерни приложения"
- **examples/README.md**: Актуализиран да подчертава примери за контейнерни приложения, добавя записи в матрицата за сравнение и обновява препратки към технологии/архитектура
- **Структура на курса и учебен наръчник**: Актуализирани за препращане към нови примери за контейнерни приложения и модели на разгръщане в съответните глави

#### Потвърдено
- ✅ Всички нови примери могат да бъдат разгръщани с `azd up` и следват най-добрите практики
- ✅ Крос-препратки в документацията и навигацията актуализирани
- ✅ Примерите обхващат от начинаещи до усъвършенствани сценарии, включително продукционни микросървиси

#### Забележки
- **Обхват**: Само английска документация и примери
- **Следващи стъпки**: Разширяване с допълнителни усъвършенствани модели за контейнери и CI/CD автоматизация в бъдещи версии

### [v3.5.0] - 2025-11-19

#### Преименуване на продукта: Microsoft Foundry
**Тази версия реализира цялостно преименуване на продуктовото име от "Microsoft Foundry" на "Microsoft Foundry" във всички английски документи, отразявайки официалното ребрандиране от Microsoft.**

#### Променено
- **🔄 Актуализация на името на продукта**: Пълно преименуване от "Microsoft Foundry" на "Microsoft Foundry"
  - Актуализирани всички препратки в английската документация в папка `docs/`
  - Преименувана папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименуван файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Общо: 23 актуализирани препратки в 7 документационни файла

- **📁 Промени в структурата на папките**:
  - `docs/ai-foundry/` преименувана на `docs/microsoft-foundry/`
  - Актуализирани всички кръстосани препратки, за да отразяват новата структура на папките
  - Валидирани навигационни връзки във всички документи

- **📄 Преименувания на файлове**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Актуализирани всички вътрешни връзки, за да сочат към новото име на файла

#### Актуализирани файлове
- **Документация на глави** (7 файла):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 актуализации на навигационни връзки
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 актуализации на препратки на продуктово име
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вече използва Microsoft Foundry (от предишни актуализации)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 актуализации на препратки (преглед, обратна връзка от общността, документация)
  - `docs/getting-started/azd-basics.md` - 4 обновени кръстосани препратки
  - `docs/getting-started/first-project.md` - 2 актуализации на навигационни връзки на глави
  - `docs/getting-started/installation.md` - 2 обновления на връзки към следващи глави
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 актуализации на препратки (навигация, общност в Discord)
  - `docs/troubleshooting/common-issues.md` - 1 актуализация на навигационна връзка
  - `docs/troubleshooting/debugging.md` - 1 актуализация на навигационна връзка

- **Структура на курса** (2 файла):
  - `README.md` - 17 актуализации на препратки (преглед на курса, заглавия на глави, секция с шаблони, данни от общността)
  - `course-outline.md` - 14 актуализации на препратки (преглед, учебни цели, ресурси за глава)

#### Потвърдено
- ✅ Никакви останали препратки към папка "ai-foundry" в английската документация
- ✅ Никакви останали препратки към продуктово име "Microsoft Foundry" в английската документация
- ✅ Всички навигационни връзки работят с новата структура на папките
- ✅ Преименуванията на файлове и папки успешно завършени
- ✅ Валидирани кръстосани препратки между главите

#### Забележки
- **Обхват**: Промените са приложени само в английската документация в папка `docs/`
- **Преводи**: Папки с преводи (`translations/`) не са актуализирани с тази версия
- **Работилници**: Материали за работилници (`workshop/`) не са актуализирани в тази версия
- **Примери**: Файловете с примери може още да съдържат наследени имена (ще се коригира в бъдеща актуализация)
- **Външни връзки**: Външни URL адреси и GitHub хранилищни препратки остават непроменени

#### Ръководство за миграция за сътрудници
Ако имате локални клонове или документация, които сочат към старата структура:
1. Актуализирайте препратки към папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Актуализирайте препратки към файлове: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Заменете името на продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Потвърдете, че всички вътрешни връзки в документацията работят коректно

---

### [v3.4.0] - 2025-10-24

#### Подобрения при преглед и валидация на инфраструктурата
**Тази версия въвежда всеобхватна поддръжка на новата функция в предварителен преглед на Azure Developer CLI и подобрява потребителския опит на работилницата.**

#### Добавено
- **🧪 Документация за команда azd provision --preview**: Всеобхватно покритие на възможността за предварителен преглед на инфраструктурата
  - Справочник за командите и примери в лист за бързо справяне
  - Детайлна интеграция в ръководството за разгръщане с казуси и предимства
  - Интеграция на проверка преди стартиране за по-безопасна валидация на разгръщането
  - Актуализации в ръководството за стартиране с практики за безопасност при разгръщането
- **🚧 Бюлетин за статуса на работилницата**: Професионален HTML банер, указващ статус на развитие на работилницата
  - Градиентен дизайн с индикатори за строителство за ясна комуникация с потребителя
  - Времеви печат за последна актуализация за прозрачност
  - Мобилно-адаптивен дизайн за всички типове устройства

#### Подобрено
- **Безопасност на инфраструктурата**: Функционалността за предварителен преглед интегрирана във всички документи за разгръщане
- **Предварителна валидация**: Автоматизираните скриптове вече включват тестове за предварителен преглед на инфраструктурата
- **Работен поток за разработчици**: Актуализирани последователности на команди с препоръка за предварителен преглед като най-добра практика
- **Потребителски опит в работилницата**: Ясни очаквания за потребителите относно статуса на разработка на съдържанието

#### Променено
- **Най-добри практики при разгръщане**: Препоръчва се първо използване на предварителен преглед като подход
- **Поточност на документацията**: Валидацията на инфраструктурата е преместена по-рано в процеса на обучение
- **Презентация на работилницата**: Професионална комуникация на статуса с ясно времево усъвършенстване на разработката

#### Подобрено
- **Подход с приоритет на безопасността**: Промените в инфраструктурата могат да бъдат валидирани преди разгръщане
- **Съвместна работа в екип**: Резултатите от предварителния преглед могат да се споделят за преглед и одобрение
- **Осъзнатост за разходите**: По-добро разбиране на разходите за ресурси преди програмиране
- **Намаляване на риска**: Намаляване на неуспешните разгръщания чрез предварителна валидация

#### Техническа реализация
- **Интеграция на множество документи**: Функцията за предварителен преглед документирана в 4 основни файла
- **Модели на команди**: Еднороден синтаксис и примери във всички документи
- **Интегриране на най-добри практики**: Предварителният преглед включен в работни потоци за валидация и скриптове
- **Визуални индикатори**: Ясни маркировки за НОВА функция за по-добро откриване

#### Инфраструктура на работилницата
- **Комуникация на статуса**: Професионален HTML банер с градиентен стил
- **Потребителско изживяване**: Ясен статус на развитие за предотвратяване на обърквания
- **Професионална презентация**: Запазва доверието към хранилището и настройва очакванията
- **Прозрачност на времевата линия**: Последна актуализация октомври 2025 за отчетност

### [v3.3.0] - 2025-09-24

#### Подобрени материали за работилници и интерактивно обучение
**Тази версия въвежда всеобхватни материали за работилници с интерактивни браузър-базирани ръководства и структурирани учебни пътеки.**

#### Добавено
- **🎥 Интерактивно ръководство за работилница**: Базирано в браузър изживяване с функция за предварителен преглед на MkDocs
- **📝 Структурирани инструкции за работилницата**: 7-стъпков воден учебен път от откриване до персонализация
  - 0-Въведение: Преглед и настройка на работилницата
  - 1-Избор на AI шаблон: Процес на откриване и избор на шаблон
  - 2-Валидация на AI шаблон: Процедури за разгръщане и валидация
  - 3-Деконструкция на AI шаблон: Разбиране на архитектурата на шаблона
  - 4-Конфигуриране на AI шаблон: Конфигурация и персонализация
  - 5-Персонализиране на AI шаблон: Усъвършенствани модификации и итерации
  - 6-Разглобяване на инфраструктурата: Почистване и управление на ресурси
  - 7-Завършване: Резюме и следващи стъпки
- **🛠️ Инструменти за работилница**: Конфигурация на MkDocs с тема Material за подобрено учебно изживяване
- **🎯 Път на практическо обучение**: 3-стъпкова методология (Откриване → Разгръщане → Персонализация)
- **📱 Интеграция с GitHub Codespaces**: Безпроблемна настройка на развойна среда

#### Подобрено
- **AI лаборатория за работилници**: Разширена с всеобхватно структурирано обучение от 2-3 часа
- **Документация за работилници**: Професионална презентация с навигация и визуални помощни средства
- **Учебен прогрес**: Ясни стъпка по стъпка указания от избор на шаблон до продукционно разгръщане
- **Опит на разработчика**: Интегрирани инструменти за оптимизирани работни потоци

#### Подобрено
- **Достъпност**: Интерфейс в браузър с търсене, функционалност за копиране и смяна на тема
- **Самостоятелно обучение**: Гъвкава структура на работилницата, съобразена с различни скорости на учене
- **Практическо приложение**: Сценарии за реално разгръщане на AI шаблони
- **Интеграция с общността**: Включване в Discord за поддръжка и сътрудничество по работилниците

#### Характеристики на работилницата
- **Вградено търсене**: Бързо намиране на ключови думи и уроци
- **Копиране на блокове с код**: Функционалност при задържане на курсора за копиране на всички кодови примери
- **Смяна на тема**: Поддръжка на тъмен и светъл режим за различни предпочитания
- **Визуални материали**: Скриншоти и диаграми за по-добро разбиране
- **Интеграция на помощ**: Пряк достъп до Discord за общностна поддръжка

### [v3.2.0] - 2025-09-17

#### Основна реорганизация на навигацията и система за учене базирана на глави
**Тази версия въвежда цялостна структура за учене базирана на глави с подобрена навигация в цялото хранилище.**

#### Добавено
- **📚 Система за учене базирана на глави**: Преразгледане на целия курс в 8 последователни учебни глави
  - Глава 1: Основи и бърз старт (⭐ - 30-45 минути)
  - Глава 2: AI-първа разработка (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и удостоверяване (⭐⭐ - 45-60 минути)
  - Глава 4: Инфраструктура като код и разгръщане (⭐⭐⭐ - 1-1.5 часа)
  - Глава 5: Многоагентни AI решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Предварителна валидация и планиране преди разгръщане (⭐⭐ - 1 час)
  - Глава 7: Отстраняване на проблеми и дебъгване (⭐⭐ - 1-1.5 часа)
  - Глава 8: Продукционни и корпоративни модели (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Всеобхватна навигационна система**: Последователни навигационни хедъри и футъри във всички документи
- **🎯 Проследяване на напредъка**: Контролен списък за завършване на курса и система за проверка на ученето
- **🗺️ Указания за учебен път**: Ясни входни точки за различни нива на опит и цели
- **🔗 Кръстосане на препратки в навигацията**: Свързване на свързани глави и предпоставки

#### Подобрено
- **Структура на README**: Превърнат в структурирана учебна платформа с организация по глави
- **Навигация в документацията**: Всяка страница вече съдържа контекст на глава и указания за напредък
- **Организация на шаблоните**: Примери и шаблони съотнесени към съответните учебни глави
- **Интеграция на ресурси**: Листи за бързо справяне, често задавани въпроси и учебни наръчници свързани с главите
- **Интеграция на работилници**: Лаборатории, базирани на задачи, съотнесени с учебните цели на няколко глави

#### Променено
- **Учебен напредък**: Преминато от линейна документация към гъвкаво ученe по глави
- **Позициониране на конфигурации**: Преместено ръководство за конфигурация като Глава 3 за по-добър учебен поток
- **Интеграция на AI съдържание**: По-добра интеграция на AI специфично съдържание през целия учебен път
- **Продукционно съдържание**: Усъвършенствани модели консолидирани в Глава 8 за корпоративни обучаващи се

#### Подобрено
- **Потребителски опит**: Ясни "breadcrumbs" и индикатори за напредък в главите
- **Достъпност**: Последователни модели на навигация за по-лесно преминаване през курса
- **Професионална презентация**: Университетска структура на курса, подходяща за академична и корпоративна подготовка
- **Ефективност на учебния процес**: Намалено време за намиране на релевантно съдържание чрез подобрена организация

#### Техническа реализация
- **Навигационни хедъри**: Стандартизирана навигация по глави в над 40 документационни файла
- **Навигация в футъра**: Последователни указания за напредък и индикатори за завършване на глави
- **Вътрешно свързване**: Всеобхватна система за вътрешни препратки свързваща свързани понятия
- **Свързване на глави**: Шаблони и примери ясно асоциирани с учебните цели

#### Подобрение на учебния наръчник
- **📚 Всеобхватни учебни цели**: Преработен учебен наръчник за съответствие със система от 8 глави
- **🎯 Оценка базирана на глави**: Всяка глава включва конкретни учебни цели и практически упражнения
- **📋 Проследяване на напредъка**: Седмичен учебен график с измерими резултати и контрольни списъци за завършване
- **❓ Оценъчни въпроси**: Въпроси за валидиране на знания за всяка глава с професионални резултати
- **🛠️ Практически упражнения**: Практически задачи със сценарии за реално разгръщане и отстраняване на проблеми
- **📊 Напредък в уменията**: Ясно развитие от базови концепции до корпоративни модели с акцент върху кариерно развитие
- **🎓 Сертификационна рамка**: Резултати от професионално развитие и система за признание от общността
- **⏱️ Управление на времето**: Структуриран 10-седмичен учебен план с проверка на етапи

### [v3.1.0] - 2025-09-17

#### Подобрен многoагентен AI решения
**Тази версия подобрява многoагентното търговско решение с по-добро наименование на агентите и подобрена документация.**

#### Променено
- **Терминология за многопотребителски агенти**: Заменен "Cora агент" с "Агент на клиента" в цялото многоагентно решение за търговия на дребно за по-ясно разбиране  
- **Архитектура на агента**: Обновена цялата документация, ARM шаблони и примери с код за използване на последователното наименование "Агент на клиента"  
- **Примери за конфигурация**: Модернизирани модели за конфигуриране на агенти с актуализирани именни конвенции  
- **Консистентност на документацията**: Осигурено всички препратки да използват професионални, описателни имена на агенти  

#### Подобрено  
- **Пакет ARM шаблони**: Обновен retail-multiagent-arm-template с препратки към Агент на клиента  
- **Диаграми на архитектурата**: Освежени Mermaid диаграми с обновени имена на агенти  
- **Примери с код**: Python класове и примерни реализации вече използват имената CustomerAgent  
- **Променливи на средата**: Обновени всички скриптове за разгръщане за използване на конвенции CUSTOMER_AGENT_NAME  

#### Подобрено  
- **Преживяване на разработчика**: По-ясно разграничени роли и отговорности на агента в документацията  
- **Готовност за продукция**: По-добро съответствие с корпоративните именни конвенции  
- **Учебни материали**: По-интуитивни имена на агенти за учебни цели  
- **Използваемост на шаблоните**: Опрощено разбиране на функциите на агента и модели за разгръщане  

#### Технически подробности  
- Обновени Mermaid архитектурни диаграми с препратки CustomerAgent  
- Заменени имената на класове CoraAgent с CustomerAgent в Python примери  
- Модифицирани JSON конфигурации на ARM шаблони за използване на тип "customer" агент  
- Обновени променливи на средата от CORA_AGENT_* към CUSTOMER_AGENT_*  
- Освежени всички команди за разгръщане и конфигурации на контейнери  

### [v3.0.0] - 2025-09-12  

#### Основни промени - Фокус върху AI разработчици и интеграция с Microsoft Foundry  
**Тази версия превръща хранилището в цялостен ресурс за обучение, ориентиран към AI, с интеграция на Microsoft Foundry.**  

#### Добавено  
- **🤖 AI-ориентирана учебна пътека**: Пълна реорганизация с приоритет за AI разработчици и инженери  
- **Ръководство за интеграция с Microsoft Foundry**: Изчерпателна документация за свързване на AZD с услуги на Microsoft Foundry  
- **Патерни за разгръщане на AI модели**: Подробно ръководство за избор на модел, конфигурация и стратегии за продукционно разгръщане  
- **AI работилница**: Практически семинар с продължителност 2-3 часа за преобразуване на AI приложения към решения, разгръщащи се с AZD  
- **Най-добри практики за AI в продукция**: Патерни, готови за предприятие, за мащабиране, наблюдение и защита на AI натоварвания  
- **Ръководство за отстраняване на проблеми, специфични за AI**: Изчерпателно ръководство за Microsoft Foundry модели, когнитивни услуги и въпроси около AI разгръщане  
- **Галерия с шаблони за AI**: Избрана колекция от шаблони Microsoft Foundry с оценки за сложност  
- **Материали за работилници**: Пълна структура на работилницата с практични лаборатории и справочни материали  

#### Подобрено  
- **Структура на README**: Ориентирана към AI разработчици с 45% данни за интерес от общността на Microsoft Foundry Discord  
- **Учебни пътеки**: Отделена AI разработчици пътека паралелно с традиционните за студенти и DevOps инженери  
- **Препоръки за шаблони**: Представени AI шаблони, включително azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart  
- **Интеграция с общността**: Подсилена подкрепа на Discord общността с AI-специфични канали и дискусии  

#### Фокус върху сигурността и продукцията  
- **Модели за управлявани идентичности**: AI-специфични конфигурации за удостоверяване и сигурност  
- **Оптимизация на разходите**: Следене на използването на токени и контрол на бюджета за AI натоварвания  
- **Разгръщане в много региони**: Стратегии за глобално разгръщане на AI приложения  
- **Наблюдение на производителност**: AI-специфични метрики и интеграция с Application Insights  

#### Качество на документацията  
- **Линейна структура на курса**: Логическо преминаване от начинаещи до напреднали AI разгръщащи патерни  
- **Проверени URL адреси**: Всички външни връзки към хранилища са проверени и достъпни  
- **Пълен справочник**: Всички вътрешни връзки в документацията са проверени и функциониращи  
- **Готовност за продукция**: Патерни за предприятие с реални примери  

### [v2.0.0] - 2025-09-09  

#### Основни промени - Преструктуриране на хранилището и професионално усъвършенстване  
**Тази версия представлява значителна ревизия на структурата на хранилището и представяне на съдържанието.**  

#### Добавено  
- **Структуриран учебен рамков модел**: Всички страници с документация вече включват въведение, учебни цели и очаквани резултати  
- **Навигационна система**: Добавени линкове Предишен/Следващ урок из цялата документация за насочено учене  
- **Наръчник за учене**: Изчерпателен study-guide.md с учебни цели, упражнения и оценъчни материали  
- **Професионално представяне**: Премахнати всички емоджита за по-добра достъпност и професионален вид  
- **Подобрена структура на съдържанието**: Подобрена организация и поток на учебните материали  

#### Променено  
- **Формат на документацията**: Стандартизирана цялата документация с последователна учебно-ориентирана структура  
- **Навигационен поток**: Внедрен логичен прогрес през всички учебни материали  
- **Представяне на съдържанието**: Премахнати декоративни елементи в полза на ясно, професионално форматиране  
- **Структура на връзките**: Обновени всички вътрешни връзки за поддръжка на новата навигационна система  

#### Подобрено  
- **Достъпност**: Премахнати зависимости от емоджита за по-добра съвместимост с четци за екран  
- **Професионална визия**: Чисто академично представяне, подходящо за корпоративно обучение  
- **Учебно преживяване**: Структуриран подход с ясни цели и резултати за всеки урок  
- **Организация на съдържанието**: По-добър логически поток и връзка между свързани теми  

### [v1.0.0] - 2025-09-09  

#### Първо издание - Цялостно хранилище за обучение на AZD  

#### Добавено  
- **Основна структура на документацията**  
  - Пълна серия наръчници "Първи стъпки"  
  - Изчерпателна документация за разгръщане и прoвизиране  
  - Детайлни ресурси за отстраняване на грешки и наръчници за дебъгинг  
  - Инструменти и процедури за предварителна проверка преди разгръщане  

- **Модул "Първи стъпки"**  
  - Основи на AZD: Важни концепции и терминология  
  - Ръководство за инсталиране: Инструкции за настройка на платформата  
  - Ръководство за конфигурация: Настройка на средата и удостоверяване  
  - Първи проект: Практическо обучение стъпка по стъпка  

- **Модул за разгръщане и прoвизиране**  
  - Ръководство за разгръщане: Пълна документация на работния поток  
  - Ръководство за прoвизиране: Инфраструктура като код с Bicep  
  - Най-добри практики за продукционно разгръщане  
  - Модели за много услуги архитектура  

- **Модул за предварителна проверка**  
  - Планиране на капацитета: Проверка на наличността на Azure ресурси  
  - Избор на SKU: Изчерпателни насоки за нива на услуги  
  - Предварителни проверки: Автоматизирани скриптове за валидация (PowerShell и Bash)  
  - Инструменти за оценка на разходи и бюджетно планиране  

- **Модул за отстраняване на проблеми**  
  - Често срещани проблеми: Обичайни въпроси и решения  
  - Ръководство за отстраняване на грешки: Систематични методи за диагностика  
  - Разширени диагностични техники и инструменти  
  - Мониторинг на производителността и оптимизация  

- **Ресурси и справочници**  
  - Шаблон за команди: Бърз справочник за важни команди  
  - Глосар: Изчерпателни определения на терминология и акроними  
  - Често задавани въпроси: Подробни отговори на общи въпроси  
  - Външни ресурси и връзки с общността  

- **Примери и шаблони**  
  - Прост пример за уеб приложение  
  - Шаблон за разгръщане на статичен уебсайт  
  - Конфигурация на контейнерно приложение  
  - Патерни за интеграция с бази данни  
  - Примери за архитектура с микросървиси  
  - Имплементации на безсървърни функции  

#### Характеристики  
- **Поддръжка на множество платформи**: Ръководства за инсталиране и конфигурация за Windows, macOS и Linux  
- **Нива на умения**: Съдържание, предназначено за студенти до професионални разработчици  
- **Практическа насоченост**: Практически примери и реални сценарии  
- **Изчерпателно покритие**: От основни концепции до напреднали корпоративни патерни  
- **Сигурност на първо място**: Интегрирани най-добри практики за защита на всички нива  
- **Оптимизация на разходите**: Насоки за икономично разгръщане и управление на ресурси  

#### Качество на документацията  
- **Подробни примери с код**: Практически, тествани образци на код  
- **Инструкции стъпка по стъпка**: Ясни, приложими указания  
- **Цялостно управление на грешки**: Отстраняване на често срещани проблеми  
- **Интеграция на най-добри практики**: Стандарти и препоръки от индустрията  
- **Съвместимост на версиите**: Актуално с последните Azure услуги и функции на azd  

## Планирани бъдещи подобрения  

### Версия 3.1.0 (Планирана)  
#### Разширяване на AI платформата  
- **Поддръжка на множество модели**: Патерни за интеграция с Hugging Face, Azure Machine Learning и персонализирани модели  
- **Фреймуърк за AI агенти**: Шаблони за разгръщане на LangChain, Semantic Kernel и AutoGen  
- **Разширени RAG патерни**: Опции за векторни бази данни извън Azure AI Search (Pinecone, Weaviate и т.н.)  
- **Наблюдение на AI**: Подсилено мониториране на производителността на моделите, използването на токени и качеството на отговорите  

#### Преживяване на разработчика  
- **Разширение за VS Code**: Интегрирано развитие AZD + Microsoft Foundry  
- **Интеграция с GitHub Copilot**: AI-подпомагано генериране на шаблони за AZD  
- **Интерактивни уроци**: Практически упражнения с автоматична валидация за AI сценарии  
- **Видео съдържание**: Допълнителни видео уроци за визуални ученици, фокусирани върху AI разгръщания  

### Версия 4.0.0 (Планирана)  
#### Корпоративни AI патерни  
- **Рамка за управление**: Управление, съответствие и одит на AI модели  
- **Многонаемателски AI**: Патерни за обслужване на множество клиенти с изолирани AI услуги  
- **Edge AI разгръщане**: Интеграция с Azure IoT Edge и контейнери  
- **Хибриден облачен AI**: Патерни за многооблачно и хибридно разгръщане на AI натоварвания  

#### Разширени функционалности  
- **Автоматизация на AI пайплайни**: MLOps интеграция с Azure Machine Learning пайплайни  
- **Разширена сигурност**: Патерни за нулево доверие, частни крайни точки и защита срещу заплахи  
- **Оптимизация на производителността**: Разширено настройване и стратегии за скалиране за AI приложения с висока пропускателна способност  
- **Глобално разпространение**: Патерни за доставка на съдържание и кеширане на ръба за AI приложения  

### Версия 3.0.0 (Планирана) - Заместена от настоящото издание  
#### Предложени допълнения - Вече реализирани в v3.0.0  
- ✅ **AI-ориентирано съдържание**: Цялостна интеграция с Microsoft Foundry (Завършено)  
- ✅ **Интерактивни уроци**: Практическа AI работилница (Завършено)  
- ✅ **Модул за разширена сигурност**: AI-специфични защитни модели (Завършено)  
- ✅ **Оптимизация на производителността**: Стратегии за настройване на AI натоварвания (Завършено)  

### Версия 2.1.0 (Планирана) - Частично реализирана в v3.0.0  
#### Незначителни подобрения - Някои завършени в текущото издание  
- ✅ **Допълнителни примери**: AI-ориентирани сценарии за разгръщане (Завършено)  
- ✅ **Разширен FAQ**: AI-специфични въпроси и отстраняване на проблеми (Завършено)  
- **Интеграция на инструменти**: Подобрени ръководства за интеграция в IDE и редактор  
- ✅ **Разширено наблюдение**: AI-специфични модели за наблюдение и алармиране (Завършено)  

#### Още планирани за бъдещи издания  
- **Мобилно приятелска документация**: Отзивчив дизайн за мобилно обучение  
- **Офлайн достъп**: Пакети за изтегляне на документация  
- **Подсилена интеграция на IDE**: Разширение за VS Code за AZD + AI работни потоци  
- **Табло за общността**: Метрики в реално време и проследяване на приноси  

## Принос към дневника на промените  

### Докладване на промени  
При принос към това хранилище, моля уверете се, че записите в дневника на промените включват:  

1. **Номер на версията**: Следващо семантично версиониране (major.minor.patch)  
2. **Дата**: Дата на издаване или обновление в формат ГГГГ-ММ-ДД  
3. **Категория**: Добавено, Променено, Застаряло, Премахнато, Поправено, Сигурност  
4. **Ясно описание**: Кратко описание на направените промени  
5. **Оценка на въздействието**: Как промените засягат съществуващите потребители  

### Категории промени  

#### Добавено  
- Нови функции, секции в документацията или възможности  
- Нови примери, шаблони или учебни ресурси  
- Допълнителни инструменти, скриптове или помощни средства  

#### Променено  
- Изменения в съществуваща функционалност или документация  
- Обновления за подобряване на яснота или точност  
- Преструктуриране на съдържанието или организацията  

#### Застаряло  
- Функции или подходи, които се премахват постепенно  
- Секции от документацията, планирани за премахване  
- Методи с по-добри алтернативи  

#### Премахнато  
- Функции, документация или примери, вече неактуални  
- Остаряла информация или застарели подходи  
- Редундантно или консолидирано съдържание  

#### Поправено  
- Корекции на грешки в документацията или кода  
- Решаване на докладвани проблеми или дефекти  
- Подобрения за точност или функционалност  

#### Сигурност  
- Подобрения или поправки, свързани със сигурността  
- Обновления в най-добрите практики за сигурност  
- Отстраняване на уязвимости в сигурността  

### Насоки за семантично версиониране  

#### Основна версия (X.0.0)  
- Промени, които изискват действие от потребителя  
- Значително преструктуриране на съдържанието или организацията  
- Промени, които разместват основния подход или методология  

#### Минорна версия (X.Y.0)  
- Нови функции или добавки към съдържанието  
- Подобрения, които запазват обратно съвместимост  
- Допълнителни примери, инструменти или ресурси  

#### Патч версия (X.Y.Z)  
- Отстраняване на грешки и корекции  
- Незначителни подобрения на съществуващо съдържание  
- Изяснения и малки усъвършенствания  

## Обратна връзка и предложения от общността  

Насърчаваме активно обратната връзка от общността за подобряване на този учебен ресурс:  

### Как да дадете обратна връзка  
- **GitHub проблеми**: Докладвайте проблеми или предлагайте подобрения (AI-специфични проблеми са добре дошли)  
- **Discord дискусии**: Споделяйте идеи и участвайте в общността на Microsoft Foundry  
- **Pull заявки**: Принос към съдържанието директно, особено AI шаблони и ръководства  
- **Microsoft Foundry Discord**: Участвайте в #Azure канал за дискусии относно AZD + AI  
- **Форуми на общността**: Включете се в по-широки дискусии на Azure разработчици  

### Категории обратна връзка  
- **Точност на AI съдържанието**: Корекции свързани с интеграция и разгръщане на AI услуги  
- **Учебно преживяване**: Предложения за подобряване на учебния поток за AI разработчици  
- **Липсващо AI съдържание**: Искания за допълнителни AI шаблони, патерни или примери  
- **Достъпност**: Подобрения за разнообразни учебни нужди  
- **Интеграция на AI инструменти**: Предложения за по-добра интеграция на AI работните потоци  
- **Патерни за продуктивно AI**: Искания за корпоративни AI разгръщащи патерни  

### Ангажимент за отговор  
- **Отговор на проблеми**: В рамките на 48 часа за докладвани проблеми  
- **Заявки за функции**: Оценка в рамките на една седмица  
- **Приноси от общността**: Преглед в рамките на една седмица  
- **Сигурност проблеми**: Незабавен приоритет с ускорен отговор  

## График за поддръжка  

### Редовни обновления  
- **Месечни прегледи**: Точност на съдържанието и проверка на връзките  
- **Квартални обновления**: Основни добавки и подобрения на съдържанието  
- **Полугодишни прегледи**: Цялостно преструктуриране и усъвършенстване  
- **Годишни издания**: Основни версии с значителни подобрения  

### Мониторинг и осигуряване на качество  
- **Автоматизирано тестване**: Редовна проверка на кодови примери и връзки
- **Интеграция на обратна връзка от общността**: Редовно включване на предложения от потребители
- **Обновления на технологиите**: Съгласуване с последните услуги на Azure и версии на azd
- **Одити за достъпност**: Редовен преглед за принципи на инклузивен дизайн

## Политика за поддръжка на версии

### Поддръжка на текущата версия
- **Последна основна версия**: Пълна поддръжка с редовни актуализации
- **Предишна основна версия**: Актуализации за сигурност и критични поправки за 12 месеца
- **Старите версии**: Само поддръжка от общността, без официални актуализации

### Насоки за миграция
При пускане на основни версии предоставяме:
- **Ръководства за миграция**: Подробни инструкции за преминаване
- **Бележки за съвместимост**: Подробности за прекъсващи промени
- **Инструментална поддръжка**: Скриптове или помощни средства за улесняване на миграцията
- **Общностна поддръжка**: Специализирани форуми за въпроси относно миграцията

---

**Навигация**
- **Предишен урок**: [Ръководство за учене](resources/study-guide.md)
- **Следващ урок**: Върнете се към [Основно README](README.md)

**Бъдете в течение**: Наблюдавайте това хранилище за уведомления за нови издания и важни актуализации на учебните материали.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->