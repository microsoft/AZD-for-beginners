# Промени - AZD за начинаещи

## Въведение

Този списък с промени документира всички забележителни промени, актуализации и подобрения в хранилището AZD за начинаещи. Следваме принципите на семантичното версиониране и поддържаме този журнал, за да помогнем на потребителите да разберат какво се е променило между версиите.

## Учебни цели

Чрез преглед на този журнал ще:
- Останете информирани за нови функции и добавено съдържание
- Разберете подобренията, направени в съществуващата документация
- Следите корекции на грешки и поправки за осигуряване на точност
- Проследявате развитието на учебните материали с течение на времето

## Учебни резултати

След преглед на записите в списъка с промени ще можете да:
- Идентифицирате ново съдържание и налични ресурси за обучение
- Разберете кои секции са обновени или подобрени
- Планирате учебния си път въз основа на най-актуалните материали
- Допринасяте с обратна връзка и предложения за бъдещи подобрения

## История на версиите

### [v3.23.0] - 2026-07-13

#### Обновяване на AZD 1.27.1: Актуализация на версията
**Тази версия преудостоверява курса с `azd` `1.27.1` (юли 2026, последна стабилна версия) и текущото предварително разглеждано AI агент разширение `azure.ai.agents` `1.0.0-beta.5`, обновявайки всички банери "валидирано с" след изданията 1.26.0, 1.27.0 и 1.27.1.**

#### Променено
- **✅ Актуализирана основа за валидиране** от `azd 1.25.6` (юни 2026) до `azd 1.27.1` (юли 2026) в основното README, всички глава README файлове, урока за dev-контейнер в Глава 1 (включително примери с фиксирани версии), урока за персонализирани шаблони в Глава 4, урока за мулти-агента в Глава 5 и документите за работилницата
- **🤖 Оновяване на основата за Глава 2** от `azd 1.23.12` (март 2026) до `azd 1.27.1` в `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; актуализирани дати на бележките за валидиране на 2026-07-13
- **🧩 Актуализиране на AI агент разширението** от `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до текущото издание `1.0.0-beta.5` в README на Глава 2 и `agents.md`
- **🧪 Пример за валидиране на работилницата** (`azd version` изход) обновен на `1.27.1`

#### Бележки относно релевантни azd издания (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Поддръжка на Go за Azure Functions на Flex Consumption, филтри за абонаменти на подематели с `azd config sub-filter`, самостоятелни разширителни пакети (`azd x pack --bundle`), и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделиране на Azure AI Foundry проекти/агенти директно в `azure.yaml` (инициализация без Bicep/Terraform), поддръжка на разгръщане на контейнери за App Service (`host: appservice` + `language: docker`), директен `-s/--source` за команди `azd extension`, и `azd tool uninstall`
- **1.27.1 (2026-07-09):** Флаг `--no-dependencies` за `azd extension install`, изключване по подразбиране на остарели модели от каталог/подсещания за квоти, и няколко поправки на грешки

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

#### Запълване на пропуски за начинаещи #2: Създаване на шаблони, Dev контейнери, Pulumi, Azure DevOps, служебни акаунти и още
**Тази версия затваря останалите междинни пропуски, идентифицирани при анализа на обхвата на azd: как да създавате и публикувате собствен шаблон, възпроизводими dev-контейнери / Codespaces среди, Pulumi доставчик за инфраструктура, преглед на CI/CD в Azure DevOps, удостоверяване с service principal, насоки за избор на хост (AKS/Spring Apps), обяснения за `azd restore`/`azd package`, обработка на грешки в hook-ове и практики за екипни/споделени среди.**

#### Добавени
- **🧱 Нов урок в Глава 4** `docs/chapter-04-infrastructure/custom-templates.md` — създаване на собствен шаблон за azd: изисквана структура (`azure.yaml`, `infra/`, `src/`), полето `metadata.template`, параметризация на инфраструктура с ресурсен токен `uniqueString()` и таг `azd-env-name`, локално тестване с `azd init --template <local-path>`, публикуване в GitHub и подаване в галерията Awesome AZD
- **📦 Нов урок в Глава 1** `docs/chapter-01-foundation/dev-containers.md` — възпроизводими azd среди с Dev Containers и GitHub Codespaces: минимален `.devcontainer/devcontainer.json`, използващ официалната функционалност `ghcr.io/azure/azure-dev/azd`, езиково-специфични функции, `docker-in-docker` за хостване на контейнери, и `azd auth login --use-device-code` за отдалечено влизане
- **🧩 Pulumi с azd** секция в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура на папките за Pulumi, стекове, съответстващи на azd среди, изисквани изходи/тагване и идентичен работен поток `azd up` / `azd down`
- **🎯 Насоки за избор на хост** в `docs/chapter-04-infrastructure/provisioning.md` — лесно за начинаещи сравнение между `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp`, с указания кога да се избере AKS или Azure Spring Apps
- **🛠️ Azure DevOps CI/CD преглед** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, служебна връзка с федерация на работни натоварвания (OIDC), генериран файл `azure-dev.yml` и настройка на групи с променливи
- **🔑 Служебни акаунти (шаблон 4)** добавени към `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивно `azd auth login` с клиентски секрет срещу федеративни/OIDC креденшъли, кога да се използват, и безопасно съхранение на креденшъли
- **🪝 Обработка на грешки в hook-ове** подсекция в `docs/chapter-04-infrastructure/deployment-guide.md` — кодове за изход и `set -e`, `continueOnError`, тестване на hook-ове по отделно с `azd hooks run`, OS-специфични shell-ове и `--debug`
- **👥 Екипни / споделени среди** секция в `docs/chapter-03-configuration/configuration.md` — какво се намира в `.azure/`, какво да се игнорира от git, среди на отделни разработчици, `azd env list`/`select` и предаване на стойности на среди в CI/CD
- **🧰 Обяснения за `azd restore` и разширен `azd package`** в `resources/cheat-sheet.md` — възстановяване на зависимости и изграждане на артефакт за разгръщане без реално разгръщане

#### Променено
- **🧭 Таблица с уроци в Глава 4** обновена, за да включва новия урок "Създаване на собствен шаблон" (Урок 3)
- **🧭 Таблица с уроци в Глава 1** обновена, за да включва новия урок "Dev контейнери & Codespaces" (Урок 5); навигационни футъри свързващи `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Запълване на пропуски за начинаещи: Практически мулти-агент урок, "Добави свое приложение", Terraform и CI/CD преглед
**Тази версия затваря най-големите пропуски за пълен наръчник за начинаещи, като добавя два нови практически урока (инсталиране на мулти-агент и добавяне на azd към съществуващо приложение), въведение за hook-ове за начинаещи, секция за Terraform с azd, стъпка по стъпка преглед на GitHub Actions pipeline, обяснителна информация за новите предварителни разширения и проверъчен списък за потвърждение на разгръщането.**

#### Добавени
- **🤝 Нов урок в Глава 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — напълно практически, разгръщаем двуагентски преглед (оркестратор + специалисти) с реален шаблон (`contoso-creative-writer`), покриващ кога да се използва мулти-агент, работния поток `azd up`, разбиране на разположените ресурси, проследяване между агенти, персонализация и почистване
- **📦 Нов урок в Глава 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как да добавите azd към съществуващ проект с `azd init` ("използвай код от текущата директория"), разбиране на `azure.yaml` и `infra/`, `azd infra generate`, засичане на хост и разгръщане с `azd up`
- **🌐 Terraform с azd** секция добавена в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, структура на папките `.tf`, изисквани изходи `AZURE_*` и тагване с `azd-env-name`, и идентичен работен поток `azd up` / `azd down` (затваря пропуска, където поддръжката на Terraform беше заявена, но покрита само с Bicep)
- **⚙️ Стъпка по стъпка преглед на GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от GitHub репо до автоматизирани разгръщания: `azd pipeline config`, федеративни OIDC креденшъли (без съхранени тайни), генериран `azure-dev.yml` и упътване за тайни срещу променливи
- **🪝 Въведение за начинаещи "Нов в hook-ове?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — какво е hook, таблица на етапите на hook-ове, минимален първи hook и ръчно изпълнение на hook-ове с `azd hooks run`
- **✅ Проверъчен списък "Потвърдете разгръщането си"** добавен към Стъпка 5 на `docs/chapter-01-foundation/first-project.md` — базов тест, проверка на здравния крайна точка и изрични критерии за успех
- **🧩 Обяснителна информация за нови предварителни разширения** `azure.ai.skills` и `azure.ai.connections` (какво са и кога да се използват) в `docs/chapter-08-production/production-ai-practices.md`

#### Променено
- **🧭 Таблица с уроци в Глава 5** коригирана: `multi-agent-basics.md` вече е Урок 1 (единственият напълно практически урок), с ясно обозначение, че Урок 2 е в Глава 6 а сценариото Retail е архитектурен план, а не шаблон с една команда
- **🧭 Таблица с уроци в Глава 1** вече включва новия урок "Добави свое приложение" (Урок 4)
- **🔗 Навигационни футъри** обновени: `first-project.md` вече води към `bring-your-own-app.md`

#### Поправено
- **🧱 Затворен пропускът "заявена, но липсваща" поддръжка на Terraform** — курсът преди това споменаваше поддръжка за Terraform без да я показва
- **🔀 Коригирани подвеждащи кръстосани връзки в Глава 5**, които намекваха, че има пълна мулти-агент имплементация, а тя беше само архитектурен план

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

#### Освежаване на AZD 1.25.6, пълни команди за жизнения цикъл на агент и ребрандиране на Aspire

**Тази версия преодобрява курса към `azd` `1.25.6` (юни 2026) и разширението `azure.ai.agents` `0.1.40-preview`, разширява AI насоките от "изграждане на агент" до пълния жизнен цикъл на агента (тест → оценка → оптимизация → проверка → изтриване), показва новите предварителни разширения `azure.ai.skills` и `azure.ai.connections` и отбелязва ребрандирането на продукта от ".NET Aspire" на "Aspire".**

#### Добавени
- **🔁 Пълно покритие на жизнения цикъл на агента** за начинаещи и AI инженери в цялата документация:
  - `docs/chapter-01-foundation/azd-basics.md` — Добавена таблица на жизнения цикъл (създаване → тест → измерване → подобряване → проверка → почистване) в секцията Разширения и AI команди
  - `docs/chapter-08-production/production-ai-practices.md` — Нова секция "Управление на жизнения цикъл на агента", покриваща `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Разширени AI команди за агенти с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Нови предварителни разширения** документирани: `azure.ai.skills` (многократно използваеми умения на агенти) и `azure.ai.connections` (Foundry връзки), добавени в таблицата с разширения и в чийтшита
- **⏱️ Насоки за време на отговор** — в примерите за `azd ai agent invoke` сега се отбелязва, че се отпечатва общата латентност и времето до първия байт
- **📌 Банер за версията** в основния README, насочващ учащите към `azd version` и `azd upgrade`

#### Променени
- **✅ Актуализирана базова линия за валидация** от `azd 1.23.12` (март 2026) на `azd 1.25.6` (юни 2026) във всички README файлове на главите и в документацията на работилницата
- **🤖 Актуализация на бележката за разширение в глава 2** от `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Актуализация на пример за валидация в работилницата** (изход на `azd version`) до `1.25.6`
- **🧭 Обновен README "Какво има ново в azd днес"**, подчертаващ пълния жизнен цикъл на агента, новите AI разширения и наскоро направените подобрения за удобство (`azd init` идемпотентност, `azd auth login` изчистване на изтекъл маркер, първо стартиране на `azd tool`)
- **📖 Глава 2 agents.md (Опция 4)** сега насочва учащите към команди за жизнения цикъл след внедряване, вместо да спира при `azd up`

#### Поправени
- **🏷️ Именуване на продукт** — добавена бележка за ребрандиране на Aspire (".NET Aspire" вече е просто "Aspire"); поддръжката на Aspire в azd остава без промяна
- **🔎 Валидиране на живо издание** потвърдено спрямо изданието за разработчици на Azure CLI: стабилна CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Файлове, Актуализирани
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

#### Изясняване за начинаещи, Валидация на настройка и Крайно почистване на AZD команди
**Тази версия следва валидационния преглед на AZD 1.23 с документационен преглед, насочен към начинаещи: изяснява авторизационните насоки с AZD, добавя скриптове за локална валидация на настройката, проверява ключови команди спрямо живия AZD CLI и отстранява последните остарели команди на английски извън changelog-а.**

#### Добавени
- **🧪 Скриптове за валидация на настройката за начинаещи** с `validate-setup.ps1` и `validate-setup.sh`, за да могат учащите да потвърдят нужните инструменти преди да започнат глава 1
- **✅ Предварителни стъпки за валидация на настройката** в основния README и README за Глава 1, така че липсващите предпоставки да се хванат преди `azd up`

#### Променени
- **🔐 Насоки за аутентикация за начинаещи** сега последователно третират `azd auth login` като основен път за AZD работни потоци, а `az login` се посочва като опционален, освен ако не се използват команди на Azure CLI директно
- **📚 Пасът за начинаещи в Глава 1** сега насочва учащите да валидират локалната си настройка преди инсталация, аутентикация и първи стъпки за внедряване
- **🛠️ Съобщения от валидатора** сега ясно разграничават блокиращи изисквания от опционални предупреждения на Azure CLI за пътя само с AZD за начинаещите
- **📖 Конфигурационна, отстраняваща проблеми и примерна документация** сега правят разлика между задължителна AZD автентикация и опционално Azure CLI влизане там, където преди това и двете са били представени без контекст

#### Поправени
- **📋 Останали препратки към команди на английски** актуализирани с текущите AZD форми, включително `azd config show` в чийтшита и `azd monitor --overview`, където се предполага преглед от портала на Azure
- **🧭 Твърдения на начинаещи в Глава 1** омекотени за да се избегнат прекомерни обещания за гарантирано нулева грешка или автоматичен rollback във всички шаблони и Azure ресурси
- **🔎 Валидиране на живо CLI** потвърждава текущата поддръжка за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

#### Файлове, Актуализирани
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

#### Валидация на AZD 1.23.12, Разширение на работилницата и Обновяване на AI модела
**Тази версия извършва проверка на документацията спрямо `azd` `1.23.12`, обновява остарелите примери с AZD команди, обновява насоките за AI моделите с текущи стойности и разширява инструкциите за работилницата извън GitHub Codespaces, за да поддържа и dev контейнери и локални копия.**

#### Добавени
- **✅ Бележки за валидация из основните глави и документацията на работилницата** за да направят тестваната AZD базова линия ясна за учащите с по-нови или по-стари CLI версии
- **⏱️ Насоки за времева граница при внедряване** за дългосрочни AI приложения с `azd deploy --timeout 1800`
- **🔎 Стъпки за инспекция на разширения** с `azd extension show azure.ai.agents` в документацията за AI работни потоци
- **🌐 По-широки насоки за средата на работилницата** обхващащи GitHub Codespaces, dev контейнери и локални копия с MkDocs

#### Променени
- **📚 Въвеждащи README файлове на главите** сега последователно отбелязват валидация спрямо `azd 1.23.12` за раздели за основи, конфигурация, инфраструктура, мулти-агент, предварително внедряване, отстраняване на проблеми и продукция
- **🛠️ Препратки към AZD команди** актуализирани с текущи форми из цялата документация:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` според контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` където се има предвид преглед от Application Insights
- **🧪 Оптимизиране на примерите с provision preview** до подкрепените в момента варианти като `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Поток на работилницата** променен, така че учащите да могат да изпълняват лабораториите в Codespaces, dev контейнер или локално копие, без да се предполага само изпълнение в Codespaces
- **🔐 Насоки за автентикация** сега предпочитат `azd auth login` за AZD работни потоци, като `az login` е опционално при директна употреба на Azure CLI команди

#### Поправени
- **🪟 Команди за инсталиране на Windows** нормализирани според текущото използване на `winget` с главни и малки букви в ръководството за инсталация
- **🐧 Насоки за инсталация на Linux** коригирани за да се избегнат неподдържани дистрибутивно-специфични инструкции за мениджър на пакети `azd` и вместо това насочват към релийз артефакти, когато е подходящо
- **📦 Примери за AI модели** обновени от по-стари стойности като `gpt-35-turbo` и `text-embedding-ada-002` към актуални като `gpt-4.1-mini`, `gpt-4.1`, и `text-embedding-3-large`
- **📋 Фрагменти за внедряване и диагностика** коригирани да използват текущи команди за среда и статус в логове, скриптове и стъпки за отстраняване на проблеми
- **⚙️ Насоки за GitHub Actions** обновени от `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Насоки за MCP/Copilot съгласие** обновени от `azd mcp consent` до `azd copilot consent list`

#### Подобрени
- **🧠 Насоки в глава за AI** сега по-добре обясняват предварителното поведение на `azd ai`, входа с отделен наемател, текущата употреба на разширения и актуализирани препоръки за внедряване на модели
- **🧪 Инструкции за работилницата** сега използват по-реалистични примерни версии и по-ясен език за настройка на средата за практически лаборатории
- **📈 Документация за продукция и отстраняване на проблеми** сега са по-съобразени с актуални примери за мониторинг, модели за резервиране и ценови нива

#### Файлове, Актуализирани
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

#### AZD AI CLI команди, Валидация на съдържанието и Разширение на шаблоните
**Тази версия добавя покритие на команди `azd ai`, `azd extension` и `azd mcp` в цялата AI-свързана документация, поправя счупени връзки и остарял код в agents.md, обновява чийтшита и преосмисля секцията Примерни шаблони с валидирани описания и нови Azure AI AZD шаблони.**

#### Добавени
- **🤖 Покритие на AZD AI CLI** в 7 файла (предишно само в Глава 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нова секция "Разширения и AI команди", представяща `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опция 4: `azd ai agent init` с таблица за сравнение (подход с шаблон срещу манифест)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подсекции "AZD разширения за Foundry" и "Първоначално внедряване на агент"

  - `docs/chapter-05-multi-agent/README.md` — Бърз старт вече показва както пътища за разгръщане на базата на шаблон, така и на манифест
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Разделът за разгръщане вече включва опцията `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подраздел "Команди за диагностика на AZD AI разширение"
  - `resources/cheat-sheet.md` — Нов раздел "Команди за AI и разширения" с `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Нови примерни шаблони за AZD AI** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат с Blazor WebAssembly, Semantic Kernel и поддръжка на гласов чат
  - **azure-search-openai-demo-java** — Java RAG чат с използване на Langchain4J с опции за разгръщане ACA/AKS
  - **contoso-creative-writer** — Многоагентско приложение за креативно писане с Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Безсървърен RAG с Azure Functions + LangChain.js + Cosmos DB с локална dev поддръжка за Ollama
  - **chat-with-your-data-solution-accelerator** — Предприятен ускорител за RAG с администраторски портал, интеграция с Teams и опции за PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Многоагентско MCP оркестрационно референтно приложение с сървъри на .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимален стартов шаблон за инфраструктура Azure AI с Bicep
  - **🔗 Линк към страхотна галерия AZD AI** — Референция към [awesome-azd AI галерията](https://azure.github.io/awesome-azd/?tags=ai) (над 80 шаблона)

#### Отстранени проблеми
- **🔗 навигация agents.md**: Връзките Предишна/Следваща съответстват на реда на урока в README на Глава 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 счупени връзки в agents.md**: Поправена `production-ai-practices.md` на `../chapter-08-production/production-ai-practices.md` (3 пъти)
- **📦 остарял код в agents.md**: Заменен `opencensus` с `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 неправилен API в agents.md**: Прехвърлен `max_tokens` от `create_agent()` към `create_run()` като `max_completion_tokens`
- **🔢 отчитане на токени в agents.md**: Заменена приблизителна оценка `len//4` с `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Поправени услуги от "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (промяна на подразбиращ се хост октомври 2024)
- **contoso-chat**: Обновено описание, рефериращо Azure AI Foundry + Prompty, съвпадащо с действителното заглавие и технологичен стек на хранилището

#### Премахнати
- **ai-document-processing**: Премахната неработеща референция към шаблон (хранилището не е публично достъпно като AZD шаблон)

#### Подобрения
- **📝 упражнения в agents.md**: Упражнение 1 вече показва очаквания изход и стъпка с `azd monitor`; Упражнение 2 съдържа пълен код за регистрация на `FunctionTool`; Упражнение 3 замества неясни указания с конкретни команди `prepdocs.py`
- **📚 ресурси в agents.md**: Обновени връзки към документацията на текущия Azure AI Agent Service и бърз старт
- **📋 таблица Следващи стъпки в agents.md**: Добавен линк към AI Workshop Lab за пълно покритие на главата

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
**Тази версия подобрява навигацията в README.md за главите с подобрена таблица.**

#### Промени
- **Таблица на картата на курса**: Подобрена с директни връзки към уроци, оценки за продължителност и рейтинг на сложност
- **Почистване на папки**: Премахнати стари излишни папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Валидиране на връзки**: Проверени над 21 вътрешни връзки в таблицата на картата на курса

### [v3.16.0] - 2026-02-05

#### Обновяване на имената на продукти
**Тази версия актуализира продуктови препратки към текущото брандиране на Microsoft.**

#### Промени
- **Microsoft Foundry → Microsoft Foundry**: Всички препратки обновени в нетранслационни файлове
- **Azure AI Agent Service → Foundry Agents**: Промяна на името на услугата за текущото брандиране

#### Обновени файлове
- `README.md` - Основна входна страница на курса
- `changelog.md` - История на версиите
- `course-outline.md` - Структура на курса
- `docs/chapter-02-ai-development/agents.md` - Ръководство за AI агенти
- `examples/README.md` - Документация на примерите
- `workshop/README.md` - Входна страница на работилницата
- `workshop/docs/index.md` - Индекс на работилницата
- `workshop/docs/instructions/*.md` - Всички файлове с инструкции на работилницата

---

### [v3.15.0] - 2026-02-05

#### Основно преструктуриране на хранилището: Папки с имена на глави
**Тази версия преструктурира документацията в отделни папки за по-ясна навигация.**

#### Преименуване на папки
Старите папки са заменени с папки, номерирани по глави:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Добавена нова: `docs/chapter-05-multi-agent/`

#### Миграции на файлове
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Добавено
- **📚 README файлове за глави**: Създаден README.md във всяка папка на глава с:
  - Учебни цели и продължителност
  - Таблица с уроци с описания
  - Команди за бърз старт
  - Навигация към други глави

#### Променено
- **🔗 Актуализирани всички вътрешни връзки**: Актуализирани са 78+ пътища в цялата документация
- **🗺️ Основен README.md**: Актуализирана карта на курса с нова структура на главите
- **📝 examples/README.md**: Актуализирани кръстосани препратки към папките на главите

#### Премахнато
- Стара структура на папките (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Преструктуриране на хранилището: Навигация в главите
**Тази версия добави README файлове за навигация в главите (заменени от v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ново ръководство за AI агенти
**Тази версия добавя изчерпателно ръководство за внедряване на AI агенти с Azure Developer CLI.**

#### Добавено
- **🤖 docs/microsoft-foundry/agents.md**: Пълно ръководство, покриващо:
  - Какво представляват AI агентите и как се различават от чатботовете
  - Три шаблона за бърз старт на агенти (Foundry Agents, Prompty, RAG)
  - Архитектурни модели на агенти (единен агент, RAG, мултиагент)
  - Конфигурация и персонализация на инструменти
  - Мониторинг и проследяване на метрики
  - Съображения за разходи и оптимизация
  - Често срещани сценарии за отстраняване на проблеми
  - Три практически упражнения с критерии за успех

#### Структура на съдържанието
- **Въведение**: Концепции за агенти за начинаещи
- **Бърз старт**: Внедряване на агенти с `azd init --template get-started-with-ai-agents`
- **Архитектурни модели**: Визуални диаграми на модели агенти
- **Конфигурация**: Настройка на инструменти и променливи на средата
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Прогресивно практическо обучение (20-45 минути всяко)

---

### [v3.12.0] - 2026-02-05

#### Актуализация на среда DevContainer
**Тази версия актуализира конфигурацията на развойната контейнерна среда с модерни инструменти и по-добри настройки по подразбиране за учебния опит с AZD.**

#### Променено
- **🐳 Базово изображение**: Актуализирано от `python:3.12-bullseye` на `python:3.12-bookworm` (последна стабилна версия на Debian)
- **📛 Име на контейнера**: Преименувано от "Python 3" на "AZD за начинаещи" за яснота

#### Добавено
- **🔧 Нови функции на Dev Container**:
  - `azure-cli` с активирана поддръжка за Bicep
  - `node:20` (LTS версия за шаблони на AZD)
  - `github-cli` за управление на шаблони
  - `docker-in-docker` за внедряване на контейнерни приложения

- **🔌 Препращане на портове**: Предварително конфигурирани портове за често използвани разработки:
  - 8000 (преглед на MkDocs)
  - 3000 (уеб приложения)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Нови разширения за VS Code**:
  - `ms-python.vscode-pylance` - Подобрена Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Поддръжка на Azure Functions
  - `ms-azuretools.vscode-docker` - Поддръжка на Docker
  - `ms-azuretools.vscode-bicep` - Поддръжка на Bicep език
  - `ms-azure-devtools.azure-resource-groups` - Управление на Azure ресурси
  - `yzhang.markdown-all-in-one` - Редактиране на Markdown
  - `DavidAnson.vscode-markdownlint` - Линтинг на Markdown
  - `bierner.markdown-mermaid` - Поддръжка на диаграми Mermaid
  - `redhat.vscode-yaml` - Поддръжка на YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуализация на Git
  - `mhutchie.git-graph` - История на Git

- **⚙️ Настройки за VS Code**: Добавени настройки по подразбиране за Python интерпретатор, форматиране при запис и изтриване на излишни интервали

- **📦 Актуализиран requirements-dev.txt**:
  - Добавен MkDocs minify плъгин
  - Добавен pre-commit за качество на кода
  - Добавени Azure SDK пакети (azure-identity, azure-mgmt-resource)

#### Поправено
- **Post-Create команда**: Сега проверява инсталацията на AZD и Azure CLI при стартиране на контейнера

---

### [v3.11.0] - 2026-02-05

#### Преработване на README за начинаещи
**Тази версия значително подобрява README.md, правейки го по-достъпен за начинаещи и добавя важни ресурси за AI разработчици.**

#### Добавено
- **🆚 Сравнение Azure CLI и AZD**: Ясно обяснение кога и кой инструмент да се използва с практически примери
- **🌟 Страхотни връзки за AZD**: Преки връзки към галерията на общността за шаблони и ресурси за принос:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ готови за внедряване шаблони
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Принос от общността
- **🎯 Ръководство за бърз старт**: Оптимизиран раздел за започване с 3 стъпки (Инсталиране → Вход → Внедряване)
- **📊 Таблица за навигация според опита**: Ясни указания откъде да започне според опита на разработчика

#### Променено
- **Структурата на README**: Преработена за постепенно разкриване на ключова информация на първо място
- **Въведение**: Пренаписано за обяснение на „Магията на `azd up`“ за напълно начинаещи
- **Премахнато дублирано съдържание**: Премахнат дублиращ се раздел за отстраняване на проблеми

- **Команди за отстраняване на проблеми**: Поправена препратка към `azd logs`, за да използва валидна команда `azd monitor --logs`

#### Поправено

- **🔐 Команди за удостоверяване**: Добавени `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Невалидни референции към команди**: Премахнати останалите `azd logs` от секцията за отстраняване на неизправности в README

#### Бележки
- **Обхват**: Промените са приложени към основния README.md и resources/cheat-sheet.md
- **Целева аудитория**: Подобрения, насочени специално към разработчици, нови в AZD

---

### [v3.10.0] - 2026-02-05

#### Актуализация на точността на командите за Azure Developer CLI
**Тази версия коригира не-съществуващи AZD команди в цялата документация, като гарантира, че всички кодови примери използват валиден Azure Developer CLI синтаксис.**

#### Коригирани
- **🔧 Премахнати не-съществуващи AZD команди**: Изчерпателен одит и корекция на невалидни команди:
  - `azd logs` (не съществува) → заменена с `azd monitor --logs` или алтернативи в Azure CLI
  - Подкоманди на `azd service` (не съществуват) → заменени с `azd show` и Azure CLI
  - `azd infra import/export/validate` (не съществуват) → премахнати или заменени с валидни алтернативи
  - Флагове `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не съществуват) → премахнати
  - Флагове `azd provision --what-if/--rollback` (не съществуват) → актуализирани за използване на `--preview`
  - `azd config validate` (не съществува) → заменена с `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не съществуват) → премахнати

- **📚 Файлове, обновени с корекции на команди**:
  - `resources/cheat-sheet.md`: Значителна ревизия на командния справочник
  - `docs/deployment/deployment-guide.md`: Коригирани стратегии за връщане (rollback) и разгръщане
  - `docs/troubleshooting/debugging.md`: Коригирани раздели за анализ на логове
  - `docs/troubleshooting/common-issues.md`: Обновени команди за отстраняване на неизправности
  - `docs/troubleshooting/ai-troubleshooting.md`: Коригиран раздел за отстраняване на грешки в AZD
  - `docs/getting-started/azd-basics.md`: Коригирани команди за наблюдение
  - `docs/getting-started/first-project.md`: Обновени примери за наблюдение и отстраняване на грешки
  - `docs/getting-started/installation.md`: Коригирани примери за помощ и версии
  - `docs/pre-deployment/application-insights.md`: Коригирани команди за преглед на логове
  - `docs/pre-deployment/coordination-patterns.md`: Коригирани команди за отстраняване на грешки при агенти

- **📝 Актуализиране на справка за версия**: 
  - `docs/getting-started/installation.md`: Променена твърдо зададена версия `1.5.0` на обща `1.x.x` с връзка към изданията

#### Променени
- **Стратегии за връщане (Rollback)**: Документацията е обновена да използва Git-базиран rollback (AZD няма вграден rollback)
- **Преглед на логове**: Заменени референции към `azd logs` с `azd monitor --logs`, `azd monitor --live` и команди на Azure CLI
- **Раздел Производителност**: Премахнати не-съществуващи флагове за паралелно/инкрементално внедряване, предоставени валидни алтернативи

#### Технически подробности
- **Валидни AZD команди**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Валидни флагове за azd monitor**: `--live`, `--logs`, `--overview`
- **Премахнати функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Бележки
- **Проверка**: Командите са валидирани спрямо Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завършване на работилница и актуализация на качеството на документацията
**Тази версия завършва интерактивните модули на работилницата, поправя всички счупени връзки в документацията и подобрява общото качество на съдържанието за AI разработчиците, използващи Microsoft AZD.**

#### Добавени
- **📝 CONTRIBUTING.md**: Нов документ с указания за принос с:
  - Ясни инструкции за докладване на проблеми и предлагане на промени
  - Стандарти за документация за ново съдържание
  - Насоки за кодови примери и конвенции за съобщения за комити
  - Информация за ангажиране на общността

#### Завършени
- **🎯 Модул 7 на работилницата (Обобщение)**: Напълно завършен модул за обобщение с:
  - Изчерпателно обобщение на постиженията от работилницата
  - Раздел с основни овладени концепции за AZD, шаблони и Microsoft Foundry
  - Препоръки за продължаване на учебното пътуване
  - Упражнения с оценки за трудност на предизвикателствата
  - Обратна връзка от общността и връзки за поддръжка

- **📚 Модул 3 на работилницата (Деконструкция)**: Обновени учебни цели с:
  - Активиране на GitHub Copilot с MCP сървъри
  - Разбиране на структурата на папките с AZD шаблони
  - Организационни модели за инфраструктура като код (Bicep)
  - Инструкции за практически лабораторни упражнения

- **🔧 Модул 6 на работилницата (Разглобяване)**: Завършен с:
  - Цели за почистване на ресурси и управление на разходите
  - Използване на `azd down` за безопасно премахване на инфраструктурата
  - Насоки за възстановяване на меко изтрити когнитивни услуги
  - Бонус теми за GitHub Copilot и Azure портал

#### Коригирани
- **🔗 Поправки на счупени връзки**: Отстранени над 15 счупени вътрешни връзки в документацията:
  - `docs/ai-foundry/ai-model-deployment.md`: Поправени пътища към microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Коригирани пътища към ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменен несъществуващ cicd-integration.md с deployment-guide.md
  - `examples/retail-scenario.md`: Поправени пътища в FAQ и ръководство за отстраняване на неизправности
  - `examples/container-app/microservices/README.md`: Коригирани пътища към началото на курса и ръководството за разгръщане
  - `resources/faq.md` и `resources/glossary.md`: Обновени препратки към AI глави
  - `course-outline.md`: Поправени препратки към ръководство на инструктори и AI лаборатории на работилницата

- **📅 Банер за статус на работилницата**: Обновен от "В процес на изграждане" към активен статус с дата февруари 2026

- **🔗 Навигация в работилницата**: Поправени счупени връзки за навигация в workshop README.md, сочещи към несъществуваща папка lab-1-azd-basics

#### Променени
- **Презентация на работилницата**: Премахнато предупреждение "в процес на изграждане", работилницата е завършена и готова за използване
- **Консистентност на навигацията**: Осигурена правилна междумодулна навигация във всички модули на работилницата
- **Препратки в учебния път**: Обновени междуправилни препратки с правилните microsoft-foundry пътища

#### Валидация
- ✅ Всички английски markdown файлове имат валидни вътрешни връзки
- ✅ Модулите на работилницата 0-7 са завършени с учебни цели
- ✅ Навигацията между глави и модули работи правилно
- ✅ Съдържанието е подходящо за AI разработчици, използващи Microsoft AZD
- ✅ Запазен приятелски за начинаещи език и структура
- ✅ CONTRIBUTING.md дава ясни указания за участници от общността

#### Техническа реализация
- **Проверка на връзки**: Автоматизиран PowerShell скрипт провери всички вътрешни връзки в .md файлове
- **Одит на съдържанието**: Ръчен преглед на завършеност и подходящост за начинаещи
- **Навигационна система**: Приети последователни навигационни модели за глави и модули

#### Бележки
- **Обхват**: Промените са приложени само към английската документация
- **Преводи**: Папките с преводи не са обновени в тази версия (автоматизираният превод ще се синхронизира по-късно)
- **Продължителност на работилницата**: Пълната работилница вече осигурява 3-4 часа практически учебни сесии

---

### [v3.8.0] - 2025-11-19

#### Разширена документация: Наблюдение, сигурност и модели с множество агенти
**Тази версия добавя изчерпателни уроци с първокласно качество за интеграция с Application Insights, модели за удостоверяване и координация на множество агенти за производствени разгръщания.**

#### Добавени
- **📊 Урок за интеграция на Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Разгръщане с фокус върху AZD с автоматично предоставяне
  - Пълни Bicep шаблони за Application Insights + Log Analytics
  - Работещи Python приложения с персонализирана телеметрия (над 1,200 реда)
  - Модели за наблюдение на AI/LLM (проследяване на токени/разходи за Microsoft Foundry модели)
  - 6 Mermaid диаграми (архитектура, разпределено трасирване, поток на телеметрия)
  - 3 практически упражнения (сигнали, табла, наблюдение на AI)
  - Примери за Kusto заявки и стратегии за оптимизация на разходи
  - Поточно предаване на живи метрики и отстраняване на грешки в реално време
  - Време за учене 40-50 минути с производствени модели

- **🔐 Урок за модели на удостоверяване и сигурност**: в `docs/getting-started/authsecurity.md`:
  - 3 модела за удостоверяване (връзки за свързване, Key Vault, управлявана идентичност)
  - Пълни Bicep шаблони за сигурни разгръщания
  - Код на Node.js приложение с интеграция на Azure SDK
  - 3 пълни упражнения (активиране на управлявана идентичност, идентичност, присвоена на потребител, ротация на Key Vault)
  - Най-добри практики за сигурност и конфигурации на RBAC
  - Ръководство за отстраняване на неизправности и анализ на разходи
  - Патерни за производство на удостоверяване без парола

- **🤖 Урок за модели на координация на множество агенти**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 модели на координация (последователен, паралелен, йерархичен, събитийно-управляван, консенсус)
  - Пълна имплементация на оркестрационна услуга (Python/Flask, над 1,500 реда)
  - 3 специализирани реализации на агенти (Изследовател, Писател, Редактор)
  - Интеграция със Service Bus за опашки с съобщения
  - Управление на състоянието в Cosmos DB за разпределени системи
  - 6 Mermaid диаграми, показващи взаимодействията на агентите
  - 3 напреднали упражнения (управление на таймаути, логика за повторни опити, предпазител)
  - Анализ на разходите ($240-565/месец) с оптимизационни стратегии
  - Интеграция с Application Insights за наблюдение

#### Подобрени
- **Глава Преди разгръщане**: Включва изчерпателни модели за наблюдение и координация
- **Глава Започване**: Подобрена с професионални модели за удостоверяване
- **Готовност за производство**: Пълно покритие от сигурност до наблюдаемост
- **Учебна програма**: Обновена с препратки към нови уроци в глави 3 и 6

#### Променени
- **Прогресия на обучението**: По-добра интеграция на сигурността и наблюдението през целия курс
- **Качество на документацията**: Консистентни първокласни стандарти (95-97%) в новите уроци
- **Производствени модели**: Пълно покритие за корпоративни внедрения

#### Подобрени
- **Изживяване на разработчика**: Ясен път от разработка до наблюдение в продукция
- **Стандарти за сигурност**: Професионални модели за удостоверяване и управление на тайни
- **Наблюдаемост**: Пълна интеграция на Application Insights с AZD
- **Натоварвания с AI**: Специализирано наблюдение за Microsoft Foundry Модели и системи с множество агенти

#### Валидация
- ✅ Всички уроци включват пълен работещ код (не само фрагменти)
- ✅ Mermaid диаграми за визуално обучение (19 общо в 3 урока)
- ✅ Практически упражнения с проверъчни стъпки (9 общо)
- ✅ Шаблони Bicep, готови за производство, разгръщащи се чрез `azd up`
- ✅ Анализ на разходи и оптимизационни стратегии
- ✅ Ръководства за отстраняване на неизправности и най-добри практики
- ✅ Контролни точки със знаещи команди за проверка

#### Резултати от оценка на документацията
- **docs/pre-deployment/application-insights.md**: - Изчерпателно ръководство за наблюдение
- **docs/getting-started/authsecurity.md**: - Професионални модели за сигурност
- **docs/pre-deployment/coordination-patterns.md**: - Разширени архитектури с множество агенти
- **Общо ново съдържание**: - Консистентно качество от високо ниво

#### Техническа реализация
- **Application Insights**: Log Analytics + персонализирана телеметрия + разпределено трасирване
- **Удостоверяване**: Managed Identity + Key Vault + модели RBAC
- **Множество агенти**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Наблюдение**: Метрики в живо + Kusto заявки + сигнали + табла
- **Управление на разходите**: Стратегии за семплиране, политики за съхранение, бюджетен контрол

### [v3.7.0] - 2025-11-19

#### Подобрения в качеството на документацията и нов пример за Microsoft Foundry Models
**Тази версия подобрява качеството на документацията в хранилището и добавя пълен пример за разгръщане на Microsoft Foundry Models с чат интерфейс gpt-4.1.**

#### Добавени
- **🤖 Пример за чат на Microsoft Foundry Models**: Пълно разгръщане на gpt-4.1 с работеща имплементация в `examples/azure-openai-chat/`:
  - Пълна инфраструктура за Microsoft Foundry Models (разгръщане на gpt-4.1 модел)
  - Python чат интерфейс с история на разговора
  - Интеграция с Key Vault за сигурно съхранение на API ключове
  - Проследяване на използване на токени и оценка на разходи
  - Ограничаване на честотата и обработка на грешки
  - Изчерпателен README с ръководство за разгръщане (35-45 минути)
  - 11 файла готови за продукция (Bicep шаблони, Python приложение, конфигурация)
- **📚 Упражнения за документация**: Добавени практически упражнения към ръководството за конфигурация:
  - Упражнение 1: Конфигурация в множество среди (15 минути)
  - Упражнение 2: Практика за управление на тайни (10 минути)
  - Ясни критерии за успех и стъпки за проверка
- **✅ Проверка на разгръщане**: Добавен раздел за проверка към ръководството за разгръщане:
  - Процедури за здравна проверка
  - Контролен списък с критерии за успех
  - Очаквани резултати за всички команди за разгръщане
  - Бърза справка за отстраняване на неизправности

#### Подобрени
- **examples/README.md**: Обновен до качество A (93%):
  - Добавен azure-openai-chat във всички релевантни секции
  - Актуализиран брой на локални примери от 3 на 4
  - Добавен в таблицата с AI приложни примери
  - Интегриран в Quick Start за потребители със средно ниво
  - Добавен в секцията за Microsoft Foundry шаблони
  - Обновена матрица за сравнение и секции за технологични открития
- **Качество на документацията**: Подобрено от B+ (87%) на A- (92%) в папката docs:

  - Добавени очаквани резултати към примерите с критични команди
  - Включени стъпки за проверка на промените в конфигурацията
  - Подобрено практическото обучение с практически упражнения

#### Променено
- **Прогрес на обучението**: По-добра интеграция на AI примери за средно напреднали потребители
- **Структура на документацията**: Повече приложими упражнения с ясни резултати
- **Процес на проверка**: Добавени изрични критерии за успех към ключови работни потоци

#### Подобрено
- **Изживяване на разработчика**: Разгръщането на Microsoft Foundry Models вече отнема 35-45 минути (срещу 60-90 за сложни алтернативи)
- **Прозрачност на разходите**: Ясни оценки на разходите ($50-200/месец) за примера Microsoft Foundry Models
- **Път на обучение**: AI разработчиците имат ясен вход с azure-openai-chat
- **Стандарти за документация**: Консистентни очаквани резултати и стъпки за проверка

#### Валидирано
- ✅ Примерът Microsoft Foundry Models е напълно функционален с `azd up`
- ✅ Всички 11 файла на имплементацията са синтактично правилни
- ✅ Инструкциите в README съответстват на реалния опит при разгръщане
- ✅ Линковете в документацията са актуализирани на 8+ места
- ✅ Индексът на примерите точно отразява 4 локални примера
- ✅ Няма дублирани външни линкове в таблиците
- ✅ Всички навигационни препратки са правилни

#### Техническа имплементация
- **Архитектура на Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps модел
- **Сигурност**: Готова управляема идентичност, тайни в Key Vault
- **Мониторинг**: Интеграция с Application Insights
- **Управление на разходите**: Проследяване на токени и оптимизация на използването
- **Разгръщане**: Единна команда `azd up` за пълна настройка

### [v3.6.0] - 2025-11-19

#### Основна актуализация: Примери за разгръщане на Container App
**Тази версия въвежда изчерпателни примери за производствено готово разгръщане на контейнерни приложения с помощта на Azure Developer CLI (AZD), с пълна документация и интеграция в пътя за обучение.**

#### Добавено
- **🚀 Примери за Container App**: Нови локални примери в `examples/container-app/`:
  - [Основно ръководство](examples/container-app/README.md): Пълен преглед на контейнеризираното разгръщане, бърз старт, продукция и напреднали модели
  - [Прост Flask API](../../examples/container-app/simple-flask-api): Лесен за начинаещи REST API с мащабиране до нула, здравни проверки, мониторинг и отстраняване на проблеми
  - [Архитектура на микросервиси](../../examples/container-app/microservices): Производствено готово многообслужващо разгръщане (API Gateway, Product, Order, User, Notification), асинхронни съобщения, Service Bus, Cosmos DB, Azure SQL, разпределено проследяване, blue-green/canary разгръщане
- **Най-добри практики**: Сигурност, мониторинг, оптимизация на разходите и CI/CD указания за контейнеризирани работни натоварвания
- **Примери с код**: Пълен `azure.yaml`, шаблони Bicep и многоезични имплементации на услуги (Python, Node.js, C#, Go)
- **Тестване и отстраняване на проблеми**: Цялостни тестови сценарии, команди за мониторинг, насоки за отстраняване на проблеми

#### Променено
- **README.md**: Актуализиран с новите примери за контейнерни приложения под "Локални примери - Контейнерни приложения"
- **examples/README.md**: Актуализиран за подчертаване на примерите за контейнерни приложения, добавяне на матрица за сравнение и актуализация на технологични и архитектурни препратки
- **Очертание на курса и учебно ръководство**: Актуализирани с препратки към новите примери за контейнерни приложения и модели на разгръщане в съответните глави

#### Валидирано
- ✅ Всички нови примери могат да бъдат разгърнати с `azd up` и следват най-добрите практики
- ✅ Крос-препратки и навигация в документацията актуализирани
- ✅ Примерите покриват сценарии от начинаещи до напреднали, включително продукционни микросервиси

#### Бележки
- **Обхват**: Само английска документация и примери
- **Следващи стъпки**: Разширяване с допълнителни напреднали контейнерни модели и CI/CD автоматизация в бъдещи версии

### [v3.5.0] - 2025-11-19

#### Преребрандиране на продукта: Microsoft Foundry
**Тази версия реализира пълна смяна на името на продукта от "Microsoft Foundry" на "Microsoft Foundry" във всички английски документи, отразявайки официалното ребрандиране на Microsoft.**

#### Променено
- **🔄 Актуализация на името на продукта**: Пълно ребрандване от "Microsoft Foundry" на "Microsoft Foundry"
  - Актуализирани всички препратки в английската документация в папка `docs/`
  - Преименувана папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименуван файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Общо: 23 съдържателни препратки актуализирани в 7 документационни файла

- **📁 Промени в структурата на папките**:
  - `docs/ai-foundry/` преименувана на `docs/microsoft-foundry/`
  - Всички крос-препратки актуализирани, за да отразяват новата структура на папките
  - Навигационните връзки валидирани изцяло в документацията

- **📄 Преименуване на файлове**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всички вътрешни линкове обновени с новото име на файла

#### Актуализирани файлове
- **Документация на глави** (7 файла):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 актуализации на навигационни връзки
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 актуализации на името на продукта
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вече използва Microsoft Foundry (от предишни актуализации)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 актуализации на препратки (преглед, обратна връзка от общността, документация)
  - `docs/getting-started/azd-basics.md` - 4 крос-препратки обновени
  - `docs/getting-started/first-project.md` - 2 навигационни препратки към глави актуализирани
  - `docs/getting-started/installation.md` - 2 следващи линка към глава актуализирани
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 актуализации на препратки (навигация, Discord общност)
  - `docs/troubleshooting/common-issues.md` - 1 навигационна връзка актуализирана
  - `docs/troubleshooting/debugging.md` - 1 навигационна връзка актуализирана

- **Файлове на структурата на курса** (2 файла):
  - `README.md` - 17 актуализации на препратки (преглед на курса, заглавия на глави, секция с шаблони, впечатления от общността)
  - `course-outline.md` - 14 актуализации на препратки (преглед, учебни цели, ресурси за глави)

#### Валидирано
- ✅ Няма останали препратки към папка "ai-foundry" в английската документация
- ✅ Няма останали препратки към името на продукта "Microsoft Foundry" в английската документация
- ✅ Всички навигационни връзки функционират с новата структура на папките
- ✅ Преминаването към нови имена на файлове и папки е успешно завършено
- ✅ Взаимните препратки между главите са валидирани

#### Бележки
- **Обхват**: Промените са приложени само в английската документация в папка `docs/`
- **Преводи**: Папките с преводи (`translations/`) не са актуализирани в тази версия
- **Работилница**: Материалите за работилницата (`workshop/`) не са актуализирани в тази версия
- **Примери**: Файловете с примери все още може да съдържат препратки към наследствените имена (ще бъдат адресирани в бъдеща актуализация)
- **Външни връзки**: Външни URL адреси и препратки към GitHub хранилище остават без промяна

#### Ръководство за миграция за сътрудници
Ако имате локални клонове или документация, отнасяща се до старата структура:
1. Актуализирайте препратките към папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Актуализирайте файловите препратки: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Заменете името на продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Валидирайте дали всички вътрешни връзки в документацията все още работят

---

### [v3.4.0] - 2025-10-24

#### Подобрения в предварителен преглед и валидиране на инфраструктурата
**Тази версия въвежда обширна поддръжка за новата функция за предварителен преглед на Azure Developer CLI и подобрява потребителското изживяване в работилницата.**

#### Добавено
- **🧪 Документация за функцията azd provision --preview**: Изчерпателен обхват на новата възможност за предварителен преглед на инфраструктурата
  - Справочник с команди и примери за употреба в cheat sheet
  - Подробна интеграция в ръководството за осигуряване с примери и ползи
  - Интеграция на проверка преди полет за по-безопасна валидация при разгръщане
  - Актуализации на ръководството за започване с практики за безопасно разгръщане
- **🚧 Банер за състоянието на работилницата**: Професионален HTML банер, показващ статуса на разработка на работилницата
  - Дизайн с градиент и индикации за строителни дейности за ясно общуване с потребителя
  - Отбелязване на последна дата на обновление за прозрачност
  - Мобилно адаптивен дизайн за всички видове устройства

#### Подобрено
- **Безопасност на инфраструктурата**: Функционалност за предварителен преглед интегрирана във всички документи за разгръщане
- **Валидация преди разгръщане**: Автоматизираните скриптове вече включват тестове с предварителен преглед на инфраструктурата
- **Работен процес за разработчици**: Актуализирани командни последователности, включващи предварителен преглед като най-добра практика
- **Изживяване в работилницата**: Поставени ясни очаквания за потребителите относно статуса на съдържанието

#### Променено
- **Най-добри практики за разгръщане**: Сега препоръчителен работен процес с първоначален предварителен преглед
- **Поток на документация**: Валидирането на инфраструктурата преместено по-рано в учебния процес
- **Презентация на работилницата**: Професионална комуникация на статуса с ясно установен график на разработка

#### Подобрено
- **Подход с приоритет на безопасността**: Промените в инфраструктурата вече могат да се валидират преди разгръщане
- **Сътрудничество в екипа**: Резултатите от предварителния преглед могат да се споделят за преглед и одобрение
- **Осъзнаване на разходите**: По-добро разбиране на разходите за ресурси преди осигуряването им
- **Намаляване на риска**: По-малко провали при разгръщане чрез предварителна валидация

#### Техническа имплементация
- **Интеграция в няколко документа**: Функцията за предварителен преглед документирана в 4 ключови файла
- **Командни модели**: Консистентен синтаксис и примери в цялата документация
- **Интеграция на най-добри практики**: Включване на предварителен преглед в процесите и скриптовете за проверка
- **Визуални индикации**: Ясни маркировки за НОВИ функции за по-добра откриваемост

#### Инфраструктура на работилницата
- **Комуникация на статуса**: Професионален HTML банер с градиентен стил
- **Потребителско изживяване**: Ясно обозначен статус на разработка, предотвратяващ объркване
- **Професионална презентация**: Поддържа надеждността на хранилището и задава очаквания
- **Прозрачност на графика**: Отбелязване на последната дата на обновяване октомври 2025 за отчетност

### [v3.3.0] - 2025-09-24

#### Подобрени материали за работилницата и интерактивно обучение
**Тази версия представя изчерпателни материали за работилницата с браузър-базирани интерактивни ръководства и структуриран учебен път.**

#### Добавено
- **🎥 Интерактивно ръководство за работилница**: Базирано на браузър изживяване с възможност за предварителен преглед в MkDocs
- **📝 Структурирани инструкции за работилницата**: 7-степенен ръководен учебен път от откриване до персонализация
  - 0-Въведение: Преглед на работилницата и настройка
  - 1-Избор-на-AI-шаблон: Процес на откриване и избор на шаблон
  - 2-Валидиране-на-AI-шаблон: Процедури за разгъване и проверка
  - 3-Деконструкция-на-AI-шаблон: Разбиране на архитектурата на шаблона
  - 4-Конфигуриране-на-AI-шаблон: Конфигурация и персонализация
  - 5-Персонализиране-на-AI-шаблон: Напреднали модификации и итерации
  - 6-Разглобяване-на-инфраструктура: Почистване и управление на ресурсите
  - 7-Обобщение: Резюме и следващи стъпки
- **🛠️ Инструменти за работилницата**: Конфигурация на MkDocs с тема Material за подобрено учебно изживяване
- **🎯 Практически път на обучение**: 3-степенна методология (Откриване → Разгръщане → Персонализация)
- **📱 Интеграция с GitHub Codespaces**: Безпроблемна настройка на развойна среда

#### Подобрено
- **AI работилница**: Разширена с изчерпателно 2-3 часово структурирано обучение
- **Документация на работилницата**: Професионална презентация с навигация и визуални помощни средства
- **Прогрес на обучението**: Ясни стъпки от избора на шаблон до продукционно разгръщане
- **Изживяване на разработчика**: Интегрирани инструменти за оптимизирани работни процеси

#### Подобрено
- **Достъпност**: Интерфейс, базиран на браузър с търсене, функционалност за копиране и превключване на тема
- **Самостоятелно обучение**: Гъвкава структура на работилницата, подходяща за различни скорости на учене
- **Практическо приложение**: Сценарии за реално разгръщане на AI шаблони
- **Интеграция на общност**: Интеграция с Discord за поддръжка и сътрудничество в работилницата

#### Функции на работилницата
- **Вградено търсене**: Бързо откриване на ключови думи и уроци
- **Копиране на блокове с код**: Функционалност с hover за копиране на всички кодови примери
- **Превключване на тема**: Поддръжка на светъл/тъмен режим за различни предпочитания
- **Визуални активи**: Скрийншотове и диаграми за подобрено разбиране
- **Интегрирана помощ**: Директен достъп до Discord за поддръжка от общността

### [v3.2.0] - 2025-09-17

#### Основно преструктуриране на навигацията и учебна система, базирана на глави
**Тази версия въвежда изчерпателна учебна структура, базирана на глави, с подобрена навигация из цялото хранилище.**

#### Добавено
- **📚 Учебна система, базирана на глави**: Преструктуриране на целия курс в 8 прогресивни учебни глави
  - Глава 1: Основи и бърз старт (⭐ - 30-45 минути)
  - Глава 2: AI-първо разработване (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и удостоверяване (⭐⭐ - 45-60 минути)
  - Глава 4: Инфраструктура като код и разгръщане (⭐⭐⭐ - 1-1.5 часа)
  - Глава 5: Многоагентни AI решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Валидация и планиране преди разгръщане (⭐⭐ - 1 час)
  - Глава 7: Отстраняване на проблеми и дебъгинг (⭐⭐ - 1-1.5 часа)
  - Глава 8: Производствени и корпоративни модели (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Изчерпателна навигационна система**: Последователни заглавия и футъри на навигацията във всички документи
- **🎯 Проследяване на прогреса**: Контролен списък за завършване на курса и система за проверка на учебните постижения
- **🗺️ Ръководство за учебния път**: Ясни входни точки за различни нива на опит и цели
- **🔗 Крос-препратки за навигация**: Свързани глави и предпоставки ясно свързани

#### Подобрено
- **Структура на README**: Превърната в структурирана учебна платформа с организация по глави
- **Навигация в документацията**: Всяка страница вече включва контекст на глава и указания за прогрес
- **Организация на шаблоните**: Примерите и шаблоните разпределени в подходящи учебни глави

- **Интеграция на ресурси**: Таблици за бърз преглед, ЧЗВ и учебни помагала, свързани със съответните глави
- **Интеграция на работилници**: Практически лаборатории, съпоставени с множество учебни цели на главите

#### Променено
- **Напредък в обучението**: Преминаване от линейна документация към гъвкаво обучение на базата на глави
- **Позициониране на конфигурацията**: Преразпределена конфигурационна инструкция като Глава 3 за по-добър учебен поток
- **Интеграция на AI съдържание**: По-добра интеграция на AI-специфично съдържание през целия учебен процес
- **Съдържание за продукция**: Напреднали модели консолидирани в Глава 8 за корпоративни обучаеми

#### Подобрено
- **Потребителски опит**: Ясна навигация с индикатори за прогресия по глави
- **Достъпност**: Последователни навигационни модели за по-лесно преминаване през курса
- **Професионално представяне**: Университетска структура на курса, подходяща за академично и корпоративно обучение
- **Ефективност на обучението**: Намалено време за намиране на релевантно съдържание чрез подобрена организация

#### Техническа реализация
- **Навигационни заглавия**: Стандартизирана навигация през главите в над 40 документационни файла
- **Долен навигатор**: Последователно напътствие за прогресията и индикатори за завършване на глава
- **Вътрешно свързване**: Изчерпателна система за вътрешни връзки, свързващи свързани концепции
- **Картографиране на глави**: Шаблони и примери ясно асоциирани с учебните цели

#### Подобряване на учебното помагало
- **📚 Всеобхватни учебни цели**: Преструктуриране на учебното помагало за съответствие с осемглава система
- **🎯 Оценяване на базата на глави**: Всяка глава включва специфични учебни цели и практически упражнения
- **📋 Проследяване на напредъка**: Седмичен учебен график с измерими резултати и контролни списъци за завършване
- **❓ Въпроси за оценка**: Въпроси за валидиране на знанията за всяка глава с професионални резултати
- **🛠️ Практически упражнения**: Практически дейности с реални сценарии за внедряване и отстраняване на проблеми
- **📊 Напредък в уменията**: Ясно развитие от базови концепции до корпоративни модели с акцент върху кариерното развитие
- **🎓 Система за сертификация**: Професионални резултати от обучението и система за признаване в общността
- **⏱️ Управление на времевата рамка**: Структуриран 10-седмичен учебен план с валидиране на ключови точки

### [v3.1.0] - 2025-09-17

#### Подобрени многоагентни AI решения
**Тази версия подобрява многоагентното решение за търговия с по-добро именуване на агентите и усъвършенствана документация.**

#### Променено
- **Терминология за многоагентни системи**: Заменен „агент Cora“ с „агент Клиент“ във всеки аспект на многоагентното решение за търговия за по-ясно разбиране
- **Архитектура на агентите**: Обновена цялата документация, ARM шаблони и примери с постоянно именуване „агент Клиент“
- **Примери за конфигурация**: Модернизирани модели за конфигурация на агент с обновени именни конвенции
- **Последователност в документацията**: Убедено, че всички препратки използват професионални, описателни имена на агенти

#### Подобрено
- **Пакет ARM шаблони**: Обновен шаблон retail-multiagent-arm-template с препратки към агента Клиент
- **Архитектурни диаграми**: Освежени Mermaid диаграми с обновено именуване на агенти
- **Примери на код**: Python класове и примери за имплементация вече използват именуване CustomerAgent
- **Околна среда**: Обновени всички скриптове за внедряване с конвенции CUSTOMER_AGENT_NAME

#### Подобрено
- **Опит на разработчика**: По-ясни роли и отговорности на агентите в документацията
- **Готовност за продукция**: По-добро съответствие с корпоративните именувателни конвенции
- **Учебни материали**: По-интуитивно именуване на агенти за образователни цели
- **Използваемост на шаблони**: Улеснено разбиране на функциите на агентите и модели за внедряване

#### Технически детайли
- Обновени Mermaid архитектурни диаграми с препратки към CustomerAgent
- Заменени класове CoraAgent с CustomerAgent в Python примери
- Модифицирани JSON конфигурации на ARM шаблони за типовете агенти „customer“
- Обновени променливи на средата от CORA_AGENT_* към CUSTOMER_AGENT_* модели
- Освежени всички команди за внедряване и конфигурации на контейнери

### [v3.0.0] - 2025-09-12

#### Основни промени - Фокус върху AI разработчици и интеграция с Microsoft Foundry
**Тази версия трансформира хранилището в цялостен ресурс за обучение, съсредоточен върху AI, с интеграция на Microsoft Foundry.**

#### Добавено
- **🤖 Път на обучение с приоритет AI**: Пълна реструктуризация с приоритет върху AI разработчици и инженери
- **Ръководство за интеграция с Microsoft Foundry**: Изчерпателна документация за свързване на AZD с Microsoft Foundry услуги
- **Модели за внедряване на AI**: Подробно ръководство за избор на модели, конфигурация и стратегии за продукционно внедряване
- **AI Workshop Lab**: Практическа работилница от 2-3 часа за конвертиране на AI приложения в решения за внедряване с AZD
- **Добри практики за продукционна AI употреба**: Корпоративни модели за мащабиране, мониторинг и сигурност на AI натоварвания
- **Ръководство за отстраняване на проблеми, специфични за AI**: Изчерпателно отстраняване на проблеми за Microsoft Foundry модели, когнитивни услуги и AI внедряване
- **Галерия с AI шаблони**: Представена колекция от шаблони на Microsoft Foundry с оценки за сложност
- **Материали за работилница**: Пълна структура на работилницата с практически лаборатории и справочни материали

#### Подобрено
- **Структура на README**: Фокусирана върху AI разработчици с 45% общностен интерес в Discord на Microsoft Foundry
- **Обучителни пътеки**: Посветено AI обучение за разработчици, заедно с традиционни пътеки за студенти и DevOps инженери
- **Препоръки за шаблони**: Представени AI шаблони, включително azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Общностна интеграция**: Подсилена поддръжка на Discord общността с AI-специфични канали и дискусии

#### Сигурност и фокус върху продукцията
- **Модели за управлявана идентичност**: AI-специфични конфигурации за удостоверяване и сигурност
- **Оптимизация на разходите**: Проследяване на използването на токени и контрол на бюджета за AI натоварвания
- **Разгръщане в множество региони**: Стратегии за глобално внедряване на AI приложения
- **Мониторинг на представяне**: AI-специфични метрики и интеграция с Application Insights

#### Качество на документацията
- **Линейна структура на курса**: Логично прогресиране от начинаещи към напреднали AI модели за внедряване
- **Проверени URL адреси**: Всички външни връзки към хранилища са проверени и достъпни
- **Пълен справочник**: Всички вътрешни връзки в документацията са валидирани и функционални
- **Готови за продукция**: Корпоративни модели на внедряване с практически примери

### [v2.0.0] - 2025-09-09

#### Основни промени - Реструктуриране на хранилището и професионално подобрение
**Тази версия представлява значителна промяна на структурата и представянето на съдържанието в хранилището.**

#### Добавено
- **Структуриран учебен модел**: Всички страници с документация вече включват секции Въведение, Учебни цели и Резултати от обучението
- **Навигационна система**: Добавени връзки за Предишен/Следващ урок във всички документи за насочено обучение
- **Учебно помагало**: Всеобхватно study-guide.md с учебни цели, практически упражнения и материали за оценка
- **Професионално представяне**: Премахнати всички емоджита за подобрена достъпност и професионален вид
- **Подобрена структура на съдържанието**: По-добра организация и поток на учебните материали

#### Променено
- **Формат на документацията**: Стандартизирани всички документи с постоянна структура, фокусирана върху обучението
- **Навигационен поток**: Въведена логична последователност през всички учебни материали
- **Представяне на съдържанието**: Премахнати декоративни елементи в полза на ясното, професионално форматиране
- **Структура на връзките**: Обновени всички вътрешни връзки за поддръжка на новата навигационна система

#### Подобрено
- **Достъпност**: Премахнати емоджита за по-добра съвместимост със скрийн рийдъри
- **Професионален вид**: Чисто, академичен стил на представяне, подходящ за корпоративно обучение
- **Учебен опит**: Структуриран подход с ясни цели и резултати за всеки урок
- **Организация на съдържанието**: По-добър логичен поток и връзка между свързани теми

### [v1.0.0] - 2025-09-09

#### Първо издание - Изчерпателно хранилище за обучение на AZD

#### Добавено
- **Основна структура на документацията**
  - Пълен серия насоки за започване
  - Изчерпателна документация за внедряване и провизия
  - Подробни ресурси за отстраняване на проблеми и ръководства за дебъгване
  - Инструменти и процедури за предварителна валидация преди внедряване

- **Модул за започване**
  - Основи на AZD: Основни концепции и терминология
  - Инсталационно ръководство: Инструкции за специфична спрямо платформата настройка
  - Ръководство за конфигурация: Настройка на средата и удостоверяване
  - Урок за първи проект: Пошагово практическо обучение

- **Модул за внедряване и провизия**
  - Ръководство за внедряване: Пълна документация на работния процес
  - Ръководство за провизия: Инфраструктура като код с Bicep
  - Най-добри практики за продукционни внедрявания
  - Модели за многосервисна архитектура

- **Модул за предварителна валидация**
  - Планиране на капацитета: Проверка на наличността на Azure ресурси
  - Избор на SKU: Всестранно ръководство за нивата на услуги
  - Предполетни проверки: Автоматизирани скриптове за валидация (PowerShell и Bash)
  - Инструменти за оценка на разходи и планиране на бюджета

- **Модул за отстраняване на проблеми**
  - Чести проблеми: Често срещани проблеми и решения
  - Ръководство за дебъгване: Систематични методи за отстраняване на проблеми
  - Напреднали диагностични техники и инструменти
  - Мониторинг и оптимизация на производителността

- **Ресурси и препратки**
  - Таблица с команди: Бърз справочник за основните команди
  - Глосар: Всеобхватни определения на терминология и съкращения
  - ЧЗВ: Подробни отговори на често задавани въпроси
  - Външни връзки към ресурси и общностни връзки

- **Примери и шаблони**
  - Пример за проста уеб приложение
  - Шаблон за внедряване на статичен уебсайт
  - Конфигурация на контейнерно приложение
  - Модели за интеграция на база данни
  - Примери за архитектура на микросервизи
  - Имплементации на безсървърни функции

#### Функции
- **Поддръжка на множество платформи**: Ръководства за инсталация и конфигурация за Windows, macOS и Linux
- **Различни нива на умения**: Съдържание, проектирано за студенти до професионални разработчици
- **Практически фокус**: Практически примери и реални сценарии
- **Всеобхватно покритие**: От основни концепции до напреднали корпоративни модели
- **Подход, ориентиран към сигурността**: Най-добри практики за сигурност интегрирани навсякъде
- **Оптимизация на разходите**: Насоки за икономични внедрявания и управление на ресурси

#### Качество на документацията
- **Подробни кодови примери**: Практически, тествани примерни кодове
- **Инструкции стъпка по стъпка**: Ясни, изпълними напътствия
- **Всеобхватно управление на грешки**: Отстраняване на проблеми за често срещани случаи
- **Интеграция на добри практики**: Отраслови стандарти и препоръки
- **Съвместимост с версии**: Актуално с най-новите Azure услуги и функции на azd

## Планирани бъдещи подобрения

### Версия 3.1.0 (Планирана)
#### Разширение на AI платформата
- **Поддръжка на множество модели**: Моделиране на интеграционни шаблони за Hugging Face, Azure Machine Learning и персонализирани модели
- **AI агентски рамки**: Шаблони за внедряване на LangChain, Semantic Kernel и AutoGen
- **Разширени RAG модели**: Опции за векторни бази данни извън Azure AI Search (Pinecone, Weaviate и др.)
- **Наблюдение на AI**: Подобрено следене на производителността на моделите, използването на токени и качеството на отговорите

#### Опит на разработчика
- **Разширение за VS Code**: Интегрирано преживяване за разработка с AZD + Microsoft Foundry
- **Интеграция с GitHub Copilot**: Генериране на AZD шаблони с AI помощ
- **Интерактивни уроци**: Практически упражнения по кодиране с автоматична валидация за AI сценарии
- **Видео съдържание**: Допълнителни видео уроци за визуални обучаеми, съсредоточени върху AI внедрявания

### Версия 4.0.0 (Планирана)
#### Корпоративни AI модели
- **Рамка за управление**: Управление на AI модели, съответствие и аудит следи
- **Мулти-тенант AI**: Модели за обслужване на множество клиенти с изолирани AI услуги
- **AI внедряване на крайното устройство**: Интеграция с Azure IoT Edge и контейнери
- **Хибриден облак AI**: Модели за мулти-облачни и хибридни внедрявания за AI натоварвания

#### Напреднали функции
- **Автоматизация на AI конвейери**: Интеграция на MLOps с Azure Machine Learning канали
- **Разширена сигурност**: Модели с нулево доверие, частни крайни точки и усъвършенствана защита от заплахи
- **Оптимизация на производителността**: Напреднали стратегии за настройка и мащабиране за високоскоростни AI приложения
- **Глобално разпределение**: Модели за доставка на съдържание и кеширане на крайни точки за AI приложения

### Версия 3.0.0 (Планирана) - Заместена от текущото издание
#### Предложени добавки - Вече реализирани в v3.0.0
- ✅ **AI-ориентирано съдържание**: Изчерпателна интеграция с Microsoft Foundry (Завършено)
- ✅ **Интерактивни уроци**: Практическа AI работилница (Завършено)
- ✅ **Напреднал модул за сигурност**: AI-специфични модели за сигурност (Завършено)
- ✅ **Оптимизация на производителността**: Стратегии за настройка на AI натоварвания (Завършено)

### Версия 2.1.0 (Планирана) - Частично реализирана в v3.0.0
#### Дребни подобрения - Някои завършени в настоящото издание
- ✅ **Допълнителни примери**: AI-фокусирани сценарии за внедряване (Завършено)
- ✅ **Разширено ЧЗВ**: AI-специфични въпроси и отстраняване на проблеми (Завършено)
- **Интеграция на инструменти**: Разширени ръководства за IDE и редактор
- ✅ **Разширение на мониторинга**: AI-специфични модели за наблюдение и аларми (Завършено)

#### Все още планирани за бъдещо издание
- **Мобилно-приятелска документация**: Адаптивен дизайн за мобилно обучение
- **Офлайн достъп**: Изтеглящи се пакети с документация
- **Разширена интеграция в IDE**: Разширение за VS Code за AZD + AI работни потоци
- **Общностен панел**: Метрики в реално време за общността и проследяване на приноси

## Приноси към списъка с промени

### Отчитане на промени
При допринасяне към това хранилище, моля, осигурете следните елементи за записите в списъка с промени:

1. **Версия**: Спазване на семантичното версиониране (major.minor.patch)
2. **Дата**: Дата на издаване или актуализация във формат ГГГГ-ММ-ДД
3. **Категория**: Добавено, Променено, Отпаднало, Премахнато, Поправено, Сигурност
4. **Ясно описание**: Кратко описание на извършената промяна
5. **Оценка на въздействието**: Как промените засягат съществуващите потребители

### Категории промени

#### Добавено
- Нови функции, раздели в документацията или възможности
- Нови примери, шаблони или учебни ресурси
- Допълнителни инструменти, скриптове или утилити

#### Променено
- Модификации на съществуващата функционалност или документация
- Актуализации за подобряване на яснота или точност
- Реструктуриране на съдържанието или организацията

#### Отпаднало
- Функции или подходи, които се премахват постепенно
- Раздели от документацията, планирани за премахване
- Методи с по-добри алтернативи

#### Премахнато
- Функции, документация или примери, които вече не са релевантни
- Остаряла информация или отпаднали подходи
- Редундантно или консолидирано съдържание

#### Поправено
- Корекции на грешки в документацията или кода
- Решение на докладвани проблеми или грешки
- Подобрения в точността или функционалността


#### Сигурност
- Подобрения или поправки, свързани със сигурността
- Актуализации на най-добрите практики за сигурност
- Отстраняване на уязвимости в сигурността

### Насоки за семантично версиониране

#### Основна версия (X.0.0)
- Промени, нарушаващи съвместимостта, изискващи действия от потребителя
- Значителна реструктуриране на съдържанието или организацията
- Промени, които изменят основния подход или методология

#### Минорна версия (X.Y.0)
- Нови функции или допълнения към съдържанието
- Подобрения, които запазват обратната съвместимост
- Допълнителни примери, инструменти или ресурси

#### Релийз за корекции (X.Y.Z)
- Корекции на грешки и поправки
- Леки подобрения към съществуващо съдържание
- Изяснения и малки подобрения

## Обратна връзка от общността и предложения

Активно насърчаваме обратната връзка от общността за подобряване на този учебен ресурс:

### Как да дадете обратна връзка
- **GitHub Issues**: Докладвайте проблеми или предлагайте подобрения (включително въпроси, свързани с ИИ)
- **Discord дискусии**: Споделяйте идеи и се включете в общността Microsoft Foundry
- **Pull Requests**: Пряко допринасяне за съдържанието, особено шаблони и ръководства за ИИ
- **Microsoft Foundry Discord**: Участвайте в канала #Azure за дискусии по AZD + ИИ
- **Обществени форуми**: Включете се в по-широки дискусии за Azure разработчици

### Категории обратна връзка
- **Точност на съдържанието за ИИ**: Поправки в информацията за интеграция и внедряване на ИИ услуги
- **Учебен опит**: Предложения за подобряване на учебния процес за ИИ разработчици
- **Липсващо съдържание за ИИ**: Заявки за допълнителни шаблони, модели или примери за ИИ
- **Достъпност**: Подобрения за разнообразни учебни нужди
- **Интеграция на инструменти за ИИ**: Предложения за по-добра интеграция в работния процес за ИИ разработка
- **Производствени AI модели**: Заявки за модели за внедряване на ИИ в предприятия

### Ангажимент за отговор
- **Отговор на проблеми**: В рамките на 48 часа за докладвани проблеми
- **Заявки за функции**: Оценка в рамките на една седмица
- **Приноси от общността**: Преглед в рамките на една седмица
- **Проблеми със сигурността**: Незабавен приоритет с ускорена реакция

## График за поддръжка

### Редовни актуализации
- **Месечни прегледи**: Точност на съдържанието и валидиране на връзки
- **Тримесечни актуализации**: Основни добавки и подобрения в съдържанието
- **Полугодишни прегледи**: Комплексна реструктуриране и подобрение
- **Годишни издания**: Актуализации на големи версии с значителни подобрения

### Мониторинг и осигуряване на качеството
- **Автоматизирано тестване**: Редовна проверка на кодови примери и връзки
- **Интегриране на обратна връзка от общността**: Редовно включване на предложения от потребителите
- **Технологични актуализации**: Съгласуване с най-новите Azure услуги и версии на azd
- **Одити за достъпност**: Редовен преглед за приобщаващи дизайнерски принципи

## Политика за поддръжка на версии

### Поддръжка на текуща версия
- **Последна основна версия**: Пълна поддръжка с редовни актуализации
- **Предишна основна версия**: Актуализации за сигурност и критични поправки за 12 месеца
- **Старо версии**: Само общностна поддръжка, без официални актуализации

### Ръководство за миграция
При пускане на основни версии предоставяме:
- **Ръководства за миграция**: Инструкции стъпка по стъпка за преход
- **Бележки за съвместимост**: Подробности относно промени, нарушаващи съвместимостта
- **Поддръжка с инструменти**: Скриптове или помощни програми за подпомагане на миграцията
- **Обществена поддръжка**: Специализирани форуми за въпроси относно миграцията

---

**Навигация**
- **Предишен урок**: [Учебно ръководство](resources/study-guide.md)
- **Следващ урок**: Върнете се към [Основно README](README.md)

**Бъдете информирани**: Следете това репозитори за уведомления за нови версии и важни актуализации на учебните материали.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->