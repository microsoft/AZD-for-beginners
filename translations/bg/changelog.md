# Списък с промени - AZD за начинаещи

## Въведение

Този списък с промени документира всички забележими промени, актуализации и подобрения в хранилището AZD For Beginners. Ние следваме принципите на семантичното версиониране и поддържаме този журнал, за да помогнем на потребителите да разберат какво се е променило между версиите.

## Учебни цели

Като прегледате този списък с промени, вие ще:
- Бъдете информирани за нови функции и добавено съдържание
- Разберете направените подобрения в съществуващата документация
- Проследявате поправки на грешки и корекции за гарантиране на точността
- Следите еволюцията на учебните материали във времето

## Учебни резултати

След преглед на записите в списъка с промени, вие ще можете да:
- Идентифицирате ново съдържание и налични ресурси за обучение
- Разберете кои раздели са били актуализирани или подобрени
- Планирате своя учебен път въз основа на най-актуалните материали
- Давате обратна връзка и предложения за бъдещи подобрения

## История на версиите

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Тази версия запълва оставащите междинни пропуски, открити от azd-coverage analysis: как да създадете и публикувате собствен шаблон, възпроизводими dev-container/Codespaces среди, Pulumi инфраструктурния провайдър, ръководство за CI/CD в Azure DevOps, удостоверяване с service principal, указания за избор на хост (AKS/Spring Apps), обяснения за `azd restore`/`azd package`, обработка на грешки в hook-овете и практики за екипни/споделени среди.**

#### Добавено
- **🧱 Нов урок Глава 4** `docs/chapter-04-infrastructure/custom-templates.md` — създаване на собствен azd шаблон: необходимата структура (`azure.yaml`, `infra/`, `src/`), полето `metadata.template`, параметризиране на инфраструктурата с токена на ресурса `uniqueString()` и таг `azd-env-name`, локално тестване с `azd init --template <local-path>`, публикуване в GitHub и подаване към галерията Awesome AZD
- **📦 Нов урок Глава 1** `docs/chapter-01-foundation/dev-containers.md` — възпроизводими azd среди с Dev Containers и GitHub Codespaces: минимален `.devcontainer/devcontainer.json`, използващ официалната функция `ghcr.io/azure/azure-dev/azd`, езиково-специфични функции, `docker-in-docker` за хостове на контейнери и `azd auth login --use-device-code` за отдалечено влизане
- **🧩 Pulumi с azd** раздел в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, подредба на папките за Pulumi, стекове, картографирани към azd среди, необходими outputs/тагване и идентичен workflow `azd up` / `azd down`
- **🎯 Указания за избор на хост** в `docs/chapter-04-infrastructure/provisioning.md` — за начинаещи приятелско сравнение на `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp`, с указания кога да се избере AKS или Azure Spring Apps
- **🛠️ Ръководство за Azure DevOps CI/CD** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection с workload identity federation (OIDC), генерирания `azure-dev.yml` и настройка на variable-group
- **🔑 Service Principals (Pattern 4)** добавено в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивно `azd auth login` с клиентски секрет срещу федеративни/OIDC креденшъли, кога да се използва и безопасно съхранение на креденшъли
- **🪝 Обработка на грешки при hook-ове** подсекция в `docs/chapter-04-infrastructure/deployment-guide.md` — кодове на изход, `set -e`, `continueOnError`, тестване на hook-ове изолирано с `azd hooks run`, OS-специфични шелове и `--debug`
- **👥 Екипни / споделени среди** раздел в `docs/chapter-03-configuration/configuration.md` — какво се съхранява в `.azure/`, какво да се игнорира в git, среди на отделни разработчици, `azd env list`/`select` и подаване на стойности за среди в CI/CD
- **🧰 Обяснения за `azd restore` и разширен `azd package`** в `resources/cheat-sheet.md` — възстановяване на зависимости и създаване на разгръщаем артефакт без реално разгръщане

#### Променено
- **🧭 Таблица с уроци в Глава 4** обновена, за да включи новия урок "Authoring Your Own Template" (Урок 3)
- **🧭 Таблица с уроци в Глава 1** обновена, за да включи новия урок "Dev Containers & Codespaces" (Урок 5); навигационни футъри свързани между `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Тази версия запълва най-големите пропуски за пълно ръководство за начинаещи чрез добавяне на два нови практически урока (диспечеризиран multi-agent walkthrough и добавяне на azd към съществуващо приложение), въведение за hook-овете, раздел за Terraform с azd, стъпка-по-стъпка GitHub Actions pipeline ръководство, обяснение за новите preview разширения и явен чеклист за верификация на разгръщането.**

#### Добавено
- **🤝 Нов урок Глава 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — напълно практически, разгръщаем walkthrough за два агента (оркестратор + специалисти), използвайки реален шаблон (`contoso-creative-writer`), обхващащ кога да се използва multi-agent, workflow-а `azd up`, разбиране на разположените ресурси, cross-agent трасиране, персонализиране и почистване
- **📦 Нов урок Глава 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как да добавите azd към съществуващ проект с `azd init` ("use code in the current directory"), разбиране на `azure.yaml` и `infra/`, `azd infra generate`, откриване на хост и разгръщане с `azd up`
- **🌐 Terraform с azd** раздел добавен в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` конфигурация, `.tf` подредба на папките, необходими `AZURE_*` outputs и тагване с `azd-env-name`, и идентичен workflow `azd up` / `azd down` (закрива пропуска, където се твърдеше за поддръжка на Terraform, но беше показан само Bicep)
- **⚙️ Стъпка-по-стъпка GitHub Actions ръководство** в `docs/chapter-08-production/production-ai-practices.md` — от GitHub репото до автоматизирани деплой-ове: `azd pipeline config`, OIDC федеративни креденшъли (без съхранени тайни), генерирания `azure-dev.yml` и указания за тайни срещу променливи
- **🪝 За начинаещи "Нови в hooks?" въведение** в `docs/chapter-04-infrastructure/deployment-guide.md` — какво е hook, таблица на hook-стадии, минимален първи hook и изпълнение на hook-ове ръчно с `azd hooks run`
- **✅ Чеклист "Проверете вашето разгръщане"** добавен към Стъпка 5 на `docs/chapter-01-foundation/first-project.md` — smoke test, проверка на health endpoint и явни критерии за успех
- **🧩 Обяснение за новите preview разширения** `azure.ai.skills` и `azure.ai.connections` (какво представляват и кога да се използват) в `docs/chapter-08-production/production-ai-practices.md`

#### Променено
- **🧭 Таблица с уроци в Глава 5** коригирана: `multi-agent-basics.md` вече е Урок 1 (единственият напълно практически урок), с честно означаване, че Урок 2 се намира в Глава 6 и сценарият Retail е архитектурен план, а не шаблон с една команда
- **🧭 Таблица с уроци в Глава 1** вече включва новия урок "Bring Your Own App" (Урок 4)
- **🔗 Навигационни футъри** обновени: `first-project.md` вече се свързва напред към `bring-your-own-app.md`

#### Поправено
- **🧱 Затворен пропускът с Terraform, който беше "посочен, но липсваше"** — курсът преди това споменаваше поддръжка за Terraform без да я демонстрира
- **🔀 Коригирани объркващи междупосочни връзки в Глава 5**, които предполагаха наличие на пълна multi-agent имплементация, когато всъщност е имало само архитектурен план

#### Актуализирани файлове
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

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Тази версия преразпотвърждава курса спрямо `azd` `1.25.6` (юни 2026) и разширението `azure.ai.agents` `0.1.40-preview`, разширява AI указанията от "създаване на агент" до пълния жизнен цикъл на агента (test → evaluate → optimize → inspect → delete), откроява новите preview разширения `azure.ai.skills` и `azure.ai.connections` и отбелязва ребрандирането от ".NET Aspire" на "Aspire".**

#### Добавено
- **🔁 Пълно покриване на жизнения цикъл на агента** за начинаещи и AI инженери в документацията:
  - `docs/chapter-01-foundation/azd-basics.md` — добавена таблица на жизнения цикъл (scaffold → test → measure → improve → inspect → clean up) в секцията Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — нов раздел "Managing the Agent Lifecycle", обхващащ `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — разширени AI Agent команди с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Нови preview разширения** документирани: `azure.ai.skills` (преизползваеми умения за агенти) и `azure.ai.connections` (Foundry connections) добавени в таблицата с разширения и cheat sheet
- **⏱️ Указания за време на отговор** — примерите за `azd ai agent invoke` вече отбелязват, че отпечатва обща латентност и time-to-first-byte
- **📌 Банер за версия** в root README, насочващ учащите към `azd version` и `azd upgrade`

#### Променено
- **✅ Базата за валидация обновена** от `azd 1.23.12` (март 2026) на `azd 1.25.6` (юни 2026) във всички README-та на главите и workshop документацията
- **🤖 Забележка в Глава 2 за разширението** обновена от `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Пример за валидация на workshop** (`azd version` изход) обновен на `1.25.6`
- **🧭 README "Какво ново в azd днес"** обновено, за да подчертaе целия жизнен цикъл на агента, новите AI разширения и последните подобрения за удобство (`azd init` идемпотентност, `azd auth login` почистване на остарели токени, `azd tool` prompt при първо стартиране)
- **📖 Chapter 2 agents.md (Опция 4)** вече насочва учащите към пост-deploy командите от жизнения цикъл, вместо да спира на `azd up`

#### Поправено
- **🏷️ Име на продукта** — добавена бележка за ребрандиране на Aspire (".NET Aspire" вече е просто "Aspire"); поддръжката на azd за Aspire остава непроменена
- **🔎 Валидация на живо за релийз** потвърдена спрямо release feed-а на Azure Developer CLI: стабилен CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
#### Изясняване на ориентацията за начинаещи, проверка на настройката и окончателно почистване на командите AZD
**Тази версия é продължение на проверката на валидността за AZD 1.23 и представлява преглед, насочен към начинаещи: изяснява указанията за удостоверяване с приоритет AZD, добавя скриптове за локална проверка на настройката, проверява ключови команди срещу текущия AZD CLI и премахва последните остарели референции към команди на английски извън changelog-а.**

#### Добавено
- **🧪 Скриптове за проверка на настройката за начинаещи** с `validate-setup.ps1` и `validate-setup.sh`, за да могат учащите да потвърдят необходимите инструменти преди стартиране на Глава 1
- **✅ Стъпки за предварителна проверка на настройката** в главния README и в README на Глава 1, така че липсващите предпоставки да бъдат откривани преди `azd up`

#### Променено
- **🔐 Указания за удостоверяване за начинаещи** сега последователно третират `azd auth login` като основния път за AZD работни потоци, като `az login` е отбелязан като опция, освен ако не се използват директно команди на Azure CLI
- **📚 Потокът за ориентация в Глава 1** сега насочва учащите да валидират локалната си настройка преди инсталация, удостоверяване и първи стъпки за разгръщане
- **🛠️ Съобщенията на валидатора** сега ясно разделят изискванията, които блокират, от незадължителните предупреждения за Azure CLI за AZD-пътя, насочен към начинаещите
- **📖 Документи за конфигурация, отстраняване на проблеми и примери** сега разграничават изискваното удостоверяване за AZD и незадължителното влизане в Azure CLI, където и двете преди бяха представени без контекст

#### Поправено
- **📋 Останали референции към команди на английски** обновени към текущите AZD форми, включително `azd config show` в шпаргалката и `azd monitor --overview`, където е била предназначена насоката за обзор в Azure Portal
- **🧭 Претенции за начинаещи в Глава 1** смекчени, за да се избегне прекомерно обещание за гарантирано безгрешно поведение или автоматично връщане на промените при всички шаблони и ресурси в Azure
- **🔎 Потвърждение чрез жив CLI** потвърди текущата поддръжка за `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

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

#### AZD 1.23.12 Валидация, разширяване на работна среда за обучения и обновяване на AI моделите
**Тази версия извършва проверка на документацията спрямо `azd` `1.23.12`, обновява остарели примери с команди AZD, обновява указанията за AI модели до текущите по подразбиране и разширява инструкциите за работилницата отвъд GitHub Codespaces, за да поддържа и dev контейнерите и локални клонинги.**

#### Добавено
- **✅ Бележки за валидация в основните глави и документация за работилницата** за да се посочи явно тестваната базова версия на AZD за учащите, използващи по-нови или по-стари CLI билдове
- **⏱️ Указания за таймаут при разгръщане** за продължителни разгръщания на AI приложения с `azd deploy --timeout 1800`
- **🔎 Стъпки за инспекция на разширения** с `azd extension show azure.ai.agents` в документите за AI работния поток
- **🌐 По-широки указания за среда на работилницата** обхващащи GitHub Codespaces, dev контейнери и локални клонинги с MkDocs

#### Променено
- **📚 Въведения в README-та на главите** сега последователно отбелязват валидиране срещу `azd 1.23.12` в секциите за основи, конфигурация, инфраструктура, мултиагентни решения, предварително разгръщане, отстраняване на проблеми и продукция
- **🛠️ Референции към команди AZD** обновени до текущите форми в документите:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимост от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` когато е предназначен обзор на Application Insights
- **🧪 Примери за предварително преглеждане на провизия** опростени до текущо поддържаните опции като `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Потокът на работилницата** обновен така, че учащите да могат да завършат лабораториите в Codespaces, dev контейнер или локален клон, вместо да се предполага изпълнение само в Codespaces
- **🔐 Указания за удостоверяване** сега предпочитат `azd auth login` за AZD работни потоци, като `az login` е позициониран като опция когато директно се използват Azure CLI команди

#### Поправено
- **🪟 Windows инсталационни команди** нормализирани до текущото главно/малко изписване на `winget` в ръководството за инсталация
- **🐧 Ръководство за Linux инсталация** коригирано, за да се избегнат неподдържани дистрибуционно-специфични инструкции за пакетния мениджър на `azd` и вместо това да се насочи към release assets там, където е подходящо
- **📦 Примери за AI модели** обновени от по-стари по подразбиране като `gpt-35-turbo` и `text-embedding-ada-002` към текущи примери като `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Фрагменти за разгръщане и диагностика** коригирани за използване на текущите команди за среда и статус в логове, скриптове и стъпки за отстраняване на проблеми
- **⚙️ Указания за GitHub Actions** обновени от `Azure/setup-azd@v1.0.0` към `Azure/setup-azd@v2`
- **🤖 Указания за съгласие MCP/Copilot** обновени от `azd mcp consent` към `azd copilot consent list`

#### Подобрено
- **🧠 Насоки в главата за AI** сега по-добре обясняват чувствителното на преглед поведение на `azd ai`, влизането специфично за tenants, текущата употреба на разширения и обновените препоръки за разгръщане на модели
- **🧪 Инструкции за работилницата** сега използват по-реалистични примери за версии и по-ясен език за настройка на средата за практически лаборатории
- **📈 Документи за продукция и отстраняване на проблеми** вече са по-съобразени с текущи примери за мониторинг, резервни модели и ценови нива

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

#### Команди на AZD AI CLI, проверка на съдържанието и разширение на шаблоните
**Тази версия добавя покритие за `azd ai`, `azd extension` и `azd mcp` команди в всички AI-свързани глави, поправя счупени връзки и остарял код в agents.md, обновява шпаргалката и реорганизира секцията с примерни шаблони с валидирани описания и нови Azure AI AZD шаблони.**

#### Добавено
- **🤖 Покритие за AZD AI CLI** в 7 файла (предишно само в Глава 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Нова секция "Extensions and AI Commands" представяща `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опция 4: `azd ai agent init` с таблица за сравнение (шаблон срещу manifest подход)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подсекции "AZD Extensions for Foundry" и "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start сега показва както шаблонни, така и manifest-базирани пътища за разгръщане
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Секция за разгръщане вече включва опция `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подсекция "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Нова секция "AI & Extensions Commands" с `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Нови AZD AI примерни шаблони** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат с Blazor WebAssembly, Semantic Kernel и поддръжка за гласов чат
  - **azure-search-openai-demo-java** — Java RAG чат използващ Langchain4J с опции за разгръщане в ACA/AKS
  - **contoso-creative-writer** — Мултиагентно приложение за творческо писане, използващо Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Serverless RAG използващ Azure Functions + LangChain.js + Cosmos DB с Ollama локална разработка
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG ускорител с администраторски портал, интеграция с Teams и опции PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Мултиагентен референтен ап за MCP оркестрация със сървъри в .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимален Bicep starter шаблон за Azure AI инфраструктура
  - **🔗 Връзка към галерията awesome-azd AI** — Препратка към [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблона)

#### Поправено
- **🔗 Навигация в agents.md**: Предишните/Следващите връзки вече съответстват на реда на уроците в README на Глава 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Счупени връзки в agents.md**: `production-ai-practices.md` коригирано на `../chapter-08-production/production-ai-practices.md` (3 случая)
- **📦 Остарял код в agents.md**: `opencensus` заменен с `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Невалиден API в agents.md**: Преместен `max_tokens` от `create_agent()` в `create_run()` като `max_completion_tokens`
- **🔢 Броене на токени в agents.md**: Заменена грубата оценка `len//4` с `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Услугите коригирани от "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (по подразбиране хост променен октомври 2024)
- **contoso-chat**: Описанието обновено да споменава Azure AI Foundry + Prompty, съвпадайки с действителното заглавие и технологичен стек на репото

#### Премахнато
- **ai-document-processing**: Премахната референция към неработещ шаблон (репото не е публично достъпно като AZD шаблон)

#### Подобрено
- **📝 Упражнения в agents.md**: Упражнение 1 вече показва очаквания изход и стъпка с `azd monitor`; Упражнение 2 включва пълния код за регистрация на `FunctionTool`; Упражнение 3 заменя неясните указания с конкретни `prepdocs.py` команди
- **📚 Ресурси в agents.md**: Обновени връзки към документация за Azure AI Agent Service и quickstart
- **📋 Таблица за следващи стъпки в agents.md**: Добавена връзка към AI Workshop Lab за пълно покритие на главата

#### Актуализирани файлове
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
**Тази версия подобрява навигацията по глави в README.md чрез разширен табличен формат.**

#### Променено
- **Таблица на картата на курса**: Подобрена с директни връзки към уроците, оценки за продължителност и класации за сложност
- **Почистване на папките**: Премахнати излишни стари папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Проверка на връзките**: Всички 21+ вътрешни връзки в таблицата на картата на курса са проверени

### [v3.16.0] - 2026-02-05

#### Актуализации на имена на продукти
**Тази версия актуализира споменаванията на продукти в съответствие с текущото брандиране на Microsoft.**

#### Променено
- **Microsoft Foundry → Microsoft Foundry**: Всички споменавания обновени в нетранслирани файлове
- **Azure AI Agent Service → Foundry Agents**: Името на услугата е актуализирано, за да отрази текущото брандиране

#### Актуализирани файлове
- `README.md` - Основна начална страница на курса
- `changelog.md` - История на версиите
- `course-outline.md` - Структура на курса
- `docs/chapter-02-ai-development/agents.md` - Ръководство за AI агенти
- `examples/README.md` - Документация на примерите
- `workshop/README.md` - Начална страница на работилницата
- `workshop/docs/index.md` - Индекс на работилницата
- `workshop/docs/instructions/*.md` - Всички файлове с инструкции на работилницата

---

### [v3.15.0] - 2026-02-05

#### Значително преструктуриране на хранилището: Именуване на папки по глави
**Тази версия преструктурира документацията в отделни папки за глави за по-ясна навигация.**

#### Преименуване на папки
Старите папки са заменени с папки, номерирани по глави:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Прехвърляне на файлове
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
- **📚 README файлове за главите**: Създадени README.md във всяка папка за глава с:
  - Учебни цели и продължителност
  - Таблица на уроците с описания
  - Команди за бърз старт
  - Навигация към други глави

#### Променено
- **🔗 Всички вътрешни връзки са актуализирани**: Над 78 пътеки актуализирани в цялата документация
- **🗺️ Основен README.md**: Актуализирана картата на курса с новата структура на главите
- **📝 examples/README.md**: Актуализирани препратки към папките с глави

#### Премахнато
- Премахната е старата структура на папките (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуриране на хранилището: Навигация по глави
**Тази версия добави README файлове за навигация по глави (заменени от v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ново ръководство за AI агенти
**Тази версия добавя обширно ръководство за разгръщане на AI агенти с Azure Developer CLI.**

#### Добавено
- **🤖 docs/microsoft-foundry/agents.md**: Пълно ръководство, покриващо:
  - Какво представляват AI агентите и как се различават от чатботовете
  - Три шаблона за бърз старт на агент (Foundry Agents, Prompty, RAG)
  - Архитектурни модели за агенти (single agent, RAG, multi-agent)
  - Конфигурация и персонализиране на инструментите
  - Наблюдение и проследяване на метрики
  - Съображения за разходи и оптимизация
  - Чести сценарии за отстраняване на неизправности
  - Три практически упражнения с критерии за успех

#### Структура на съдържанието
- **Въведение**: Концепции за агенти за начинаещи
- **Бърз старт**: Разгръщане на агенти с `azd init --template get-started-with-ai-agents`
- **Архитектурни модели**: Визуални диаграми на моделите за агенти
- **Конфигурация**: Настройка на инструментите и променливи на средата
- **Наблюдение**: Интеграция с Application Insights
- **Упражнения**: Прогресивно практическо обучение (20–45 минути всяко)

---

### [v3.12.0] - 2026-02-05

#### Актуализация на DevContainer средата
**Тази версия актуализира конфигурацията на контейнера за разработка с модерни инструменти и по-добри настройки по подразбиране за обучението по AZD.**

#### Променено
- **🐳 Базов образ**: Актуализиран от `python:3.12-bullseye` на `python:3.12-bookworm` (последният стабилен Debian)
- **📛 Име на контейнера**: Преименуван от "Python 3" на "AZD for Beginners" за яснота

#### Добавено
- **🔧 Нови функции в Dev Container**:
  - `azure-cli` със включена поддръжка на Bicep
  - `node:20` (LTS версия за AZD шаблони)
  - `github-cli` за управление на шаблони
  - `docker-in-docker` за разгръщане на контейнерни приложения

- **🔌 Пренасочване на портове**: Предварително конфигурирани портове за обичайна разработка:
  - 8000 (преглед на MkDocs)
  - 3000 (уеб приложения)
  - 5000 (Python Flask)
  - 8080 (API-та)

- **🧩 Нови разширения за VS Code**:
  - `ms-python.vscode-pylance` - Подобрен Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Поддръжка за Azure Functions
  - `ms-azuretools.vscode-docker` - Поддръжка за Docker
  - `ms-azuretools.vscode-bicep` - Поддръжка за езика Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управление на Azure ресурсите
  - `yzhang.markdown-all-in-one` - Редактиране на Markdown
  - `DavidAnson.vscode-markdownlint` - lint проверка за Markdown
  - `bierner.markdown-mermaid` - Поддръжка за Mermaid диаграми
  - `redhat.vscode-yaml` - Поддръжка за YAML (за azure.yaml)
  - `eamodio.gitlens` - Визуализация на Git
  - `mhutchie.git-graph` - История на Git

- **⚙️ Настройки на VS Code**: Добавени настройки по подразбиране за Python интерпретатор, форматиране при запис и премахване на празни пространства

- **📦 Актуализиран requirements-dev.txt**:
  - Добавен плъгин за минифициране на MkDocs
  - Добавен pre-commit за качество на кода
  - Добавени пакети от Azure SDK (azure-identity, azure-mgmt-resource)

#### Поправено
- **Команда след създаване**: Сега проверява инсталацията на AZD и Azure CLI при стартиране на контейнера

---

### [v3.11.0] - 2026-02-05

#### Преработване на README за начинаещи
**Тази версия значително подобрява README.md, за да бъде по-достъпен за начинаещи, и добавя основни ресурси за AI разработчици.**

#### Добавено
- **🆚 Сравнение Azure CLI срещу AZD**: Ясно обяснение кога да използвате всеки инструмент с практични примери
- **🌟 Полезни връзки за AZD**: Директни връзки към галерията с общностни шаблони и ресурси за принос:
  - [Галерия Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ готови за разгръщане шаблони
  - [Изпратете шаблон](https://github.com/Azure/awesome-azd/issues) - Принос от общността
- **🎯 Ръководство за бърз старт**: Оптимизиран раздел с 3 стъпки за започване (Инсталиране → Вход → Разгръщане)
- **📊 Навигационна таблица на базата на опит**: Ясни насоки откъде да започнете в зависимост от опита на разработчика

#### Променено
- **Структура на README**: Пренаредено за прогресивно разкриване - ключовата информация първо
- **Раздел Въведение**: Пренаписан за да обясни "Магията на `azd up`" за напълно начинаещи
- **Премахнато дублиращо се съдържание**: Премахнат дублиращият се раздел за отстраняване на проблеми
- **Команди за отстраняване на проблеми**: Поправена референция на `azd logs` да използва валидния `azd monitor --logs`

#### Поправено
- **🔐 Команди за удостоверяване**: Добавени `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Невалидни референции към команди**: Премахнат останалия `azd logs` от раздела за отстраняване на проблеми в README

#### Бележки
- **Обхват**: Промените приложени към основния README.md и resources/cheat-sheet.md
- **Целева аудитория**: Подобрения, насочени специално към разработчици, нови в AZD

---

### [v3.10.0] - 2026-02-05

#### Актуализация за точността на командите на Azure Developer CLI
**Тази версия коригира несъществуващи AZD команди в цялата документация, осигурявайки всички примерни кодове да използват валидния синтаксис на Azure Developer CLI.**

#### Поправено
- **🔧 Премахнати несъществуващи AZD команди**: Комплексен одит и корекция на невалидни команди:
  - `azd logs` (няма такава команда) → заменено с `azd monitor --logs` или алтернативи на Azure CLI
  - подкоманди на `azd service` (няма такива) → заменени с `azd show` и Azure CLI
  - `azd infra import/export/validate` (няма такива) → премахнати или заменени с валидни алтернативи
  - флагове `azd deploy --rollback/--incremental/--parallel/--detect-changes` (няма такива) → премахнати
  - флагове `azd provision --what-if/--rollback` (няма такива) → актуализирани да използват `--preview`
  - `azd config validate` (няма такава) → заменено с `azd config list`
  - `azd info`, `azd history`, `azd metrics` (няма такива) → премахнати

- **📚 Файлове, актуализирани с корекции на командите**:
  - `resources/cheat-sheet.md`: Основна промяна на справочника с команди
  - `docs/deployment/deployment-guide.md`: Поправени стратегии за rollback и разгръщане
  - `docs/troubleshooting/debugging.md`: Поправени секции за анализ на логове
  - `docs/troubleshooting/common-issues.md`: Актуализирани команди за отстраняване на проблеми
  - `docs/troubleshooting/ai-troubleshooting.md`: Поправена секция за отстраняване на грешки в AZD
  - `docs/getting-started/azd-basics.md`: Поправени команди за наблюдение
  - `docs/getting-started/first-project.md`: Актуализирани примери за наблюдение и отстраняване на грешки
  - `docs/getting-started/installation.md`: Поправени примери за помощ и версия
  - `docs/pre-deployment/application-insights.md`: Поправени команди за преглед на логове
  - `docs/pre-deployment/coordination-patterns.md`: Поправени команди за отстраняване на грешки на агентите

#### Променено
- **Стратегии за rollback**: Актуализирана документацията да използва Git-базиран rollback (AZD няма вграден rollback)
- **Преглед на логове**: Заменени референциите към `azd logs` с `azd monitor --logs`, `azd monitor --live` и команды на Azure CLI
- **Раздел за производителност**: Премахнати невалидни флагове за паралелно/инкрементално разгръщане, предоставени валидни алтернативи

#### Технически подробности
- **Валидни AZD команди**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Валидни флагове за azd monitor**: `--live`, `--logs`, `--overview`
- **Премахнати функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Бележки
- **Проверка**: Командите валидирани спрямо Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завършване на работилницата и подобрение на качеството на документацията
**Тази версия завършва интерактивните модули на работилницата, поправя всички счупени връзки в документацията и подобрява общото качество на съдържанието за AI разработчици, използващи Microsoft AZD.**

#### Добавено
- **📝 CONTRIBUTING.md**: Нов документ с указания за принос, съдържащ:
  - Ясни инструкции за докладване на проблеми и предлагане на промени
  - Стандарти за документация за ново съдържание
  - Насоки за примерен код и конвенции за commit съобщения
  - Информация за взаимодействие с общността

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Напълно завършен модул за обобщение с:
  - Изчерпателно резюме на постиженията от работилницата
  - Раздел с ключови усвоени концепции, обхващащ AZD, шаблони и Microsoft Foundry
  - Препоръки за продължаване на обучителния път
  - Предизвикателни упражнения от работилницата с оценки за трудност

- **📚 Workshop Module 3 (Deconstruct)**: Актуализирани учебни цели с:
  - Ръководство за активиране на GitHub Copilot със MCP сървъри
  - Разбиране на структурата на папките за AZD шаблони
  - Модели за организация на инфраструктура като код (Bicep)
  - Инструкции за практическа лаборатория

- **🔧 Workshop Module 6 (Teardown)**: Завършен с:
  - Цели за почистване на ресурси и управление на разходите
  - `azd down` използване за безопасно премахване на инфраструктурата
  - Ръководство за възстановяване на когнитивни услуги, маркирани като soft-deleted
  - Бонус задачи за проучване за GitHub Copilot и Azure Portal

#### Fixed
- **🔗 Broken Link Fixes**: Решени 15+ счупени вътрешни връзки в документацията:
  - `docs/ai-foundry/ai-model-deployment.md`: Поправени пътища към microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Коригирани пътища към ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменен несъществуващ cicd-integration.md с deployment-guide.md
  - `examples/retail-scenario.md`: Поправени пътища към FAQ и ръководство за отстраняване на проблеми
  - `examples/container-app/microservices/README.md`: Коригирани пътища към course home и deployment guide
  - `resources/faq.md` и `resources/glossary.md`: Актуализирани препратки в глава AI
  - `course-outline.md`: Поправени препратки към instructor guide и AI workshop lab

- **📅 Workshop Status Banner**: Актуализиран банер за статус на работилницата: сменен от "Under Construction" на активен статус с дата февруари 2026

- **🔗 Workshop Navigation**: Поправени счупени навигационни връзки в workshop README.md, сочещи към несъществуваща папка lab-1-azd-basics

#### Changed
- **Workshop Presentation**: Премахнато предупреждението "under construction", работилницата вече е завършена и готова за използване
- **Navigation Consistency**: Гарантирана последователност на навигацията: всички модули на работилницата имат правилна междумодулна навигация
- **Learning Path References**: Актуализирани препратки между главите да използват правилните microsoft-foundry пътища

#### Validated
- ✅ Всички английски markdown файлове имат валидни вътрешни връзки
- ✅ Модулите на работилницата 0-7 са завършени с учебни цели
- ✅ Навигацията между главите и модулите работи правилно
- ✅ Съдържанието е подходящо за AI разработчици, използващи Microsoft AZD
- ✅ Езикът и структурата остават подходящи за начинаещи
- ✅ CONTRIBUTING.md предоставя ясни указания за допринасящите в общността

#### Technical Implementation
- **Link Validation**: Автоматизиран PowerShell скрипт провери всички .md вътрешни връзки
- **Content Audit**: Ръчен преглед на пълнотата на работилницата и подходящостта за начинаещи
- **Navigation System**: Приложени са последователни модели за навигация между глави и модули

#### Notes
- **Scope**: Промените са приложени само към английската документация
- **Translations**: Папките с преводи не са обновени в тази версия (автоматичният превод ще се синхронизира по-късно)
- **Workshop Duration**: Пълната работилница вече предоставя 3-4 часа практическо обучение

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Тази версия добавя изчерпателни уроци с оценка A за интеграция с Application Insights, модели за удостоверяване и координация на множество агенти за продукционни разгръщания.**

#### Added
- **📊 Application Insights Integration Lesson**: в `docs/pre-deployment/application-insights.md`:
  - Деплоймънт, фокусиран върху AZD, с автоматично провизиране
  - Пълни Bicep шаблони за Application Insights + Log Analytics
  - Работещи Python приложения с персонализирана телеметрия (над 1,200 реда)
  - Модели за мониторинг на AI/LLM (проследяване на токени/разходи за Microsoft Foundry Models)
  - 6 Mermaid диаграми (архитектура, разпределено трасироване, поток на телеметрията)
  - 3 практически упражнения (аларми, табла, мониторинг на AI)
  - Примери за Kusto заявки и стратегии за оптимизиране на разходите
  - Поток на метрики в реално време и отстраняване на грешки в реално време
  - Време за учене 40-50 минути с продукционно готови модели

- **🔐 Урок за модели на удостоверяване и сигурност**: в `docs/getting-started/authsecurity.md`:
  - 3 модела за удостоверяване (connection strings, Key Vault, managed identity)
  - Пълни Bicep инфраструктурни шаблони за сигурни разгръщания
  - Код на Node.js приложение с интеграция на Azure SDK
  - 3 пълни упражнения (включване на managed identity, user-assigned identity, ротация на Key Vault)
  - Най-добри практики за сигурност и конфигурации на RBAC
  - Ръководство за отстраняване на проблеми и анализ на разходите
  - Продукционно готови модели за безпаролно удостоверяване

- **🤖 Урок за модели за координация на множество агенти**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 модела за координация (последователен, паралелен, йерархичен, базиран на събития, консенсус)
  - Пълна реализация на услуга оркестратор (Python/Flask, над 1,500 реда)
  - 3 специализирани агента (Research, Writer, Editor)
  - Интеграция със Service Bus за опашки от съобщения
  - Управление на състоянието в Cosmos DB за разпределени системи
  - 6 Mermaid диаграми, показващи взаимодействията между агенти
  - 3 напреднали упражнения (обработка на таймаути, логика за повторни опити, circuit breaker)
  - Разбивка на разходите ($240-565/month) със стратегии за оптимизация
  - Интеграция с Application Insights за мониторинг

#### Enhanced
- **Pre-deployment Chapter**: Включва изчерпателни модели за мониторинг и координация
- **Getting Started Chapter**: Подсилена с професионални модели за удостоверяване
- **Production Readiness**: Пълно покритие от сигурност до наблюдаемост
- **Course Outline**: Актуализирана да препраща към новите уроци в глави 3 и 6

#### Changed
- **Learning Progression**: По-добра интеграция на сигурността и мониторинга през целия курс
- **Documentation Quality**: Последователни стандарти за оценка A (95-97%) в новите уроци
- **Production Patterns**: Пълно покритие от край до край за корпоративни разгръщания

#### Improved
- **Developer Experience**: Ясен път от разработка до мониторинг в продукция
- **Security Standards**: Професионални модели за удостоверяване и управление на тайни
- **Observability**: Пълна интеграция на Application Insights с AZD
- **AI Workloads**: Специализиран мониторинг за Microsoft Foundry Models и системи с множество агенти

#### Validated
- ✅ Всички уроци включват пълен работещ код (не само фрагменти)
- ✅ Mermaid диаграми за визуално обучение (19 общо в 3 урока)
- ✅ Практически упражнения с стъпки за верификация (9 общо)
- ✅ Продукционно готови Bicep шаблони, които могат да се деплойват чрез `azd up`
- ✅ Анализ на разходите и стратегии за оптимизация
- ✅ Ръководства за отстраняване на проблеми и добри практики
- ✅ Контролни точки за знания с команди за верификация

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Изчерпателно ръководство за мониторинг
- **docs/getting-started/authsecurity.md**: - Професионални модели за сигурност
- **docs/pre-deployment/coordination-patterns.md**: - Разширени многoагентни архитектури
- **Overall New Content**: - Последователни висококачествени стандарти

#### Technical Implementation
- **Application Insights**: Log Analytics + персонализирана телеметрия + разпределено трасироване
- **Authentication**: Managed Identity + Key Vault + RBAC модели
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Monitoring**: Поток на живи метрики + Kusto заявки + аларми + табла
- **Cost Management**: Стратегии за семплиране, правила за задържане, контрол на бюджета

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**Тази версия подобрява качеството на документацията в целото хранилище и добавя пълен пример за разгръщане на Microsoft Foundry Models с gpt-4.1 чат интерфейс.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Пълно разгръщане на gpt-4.1 с работеща имплементация в `examples/azure-openai-chat/`:
  - Пълна инфраструктура за Microsoft Foundry Models (разгръщане на модел gpt-4.1)
  - Python команден чат интерфейс с история на разговора
  - Интеграция с Key Vault за безопасно съхранение на API ключове
  - Проследяване на използването на токени и оценка на разходите
  - Ограничаване на скоростта и обработка на грешки
  - Изчерпателен README с ръководство за разгръщане 35-45 минути
  - 11 продукционно готови файла (Bicep шаблони, Python приложение, конфигурация)
- **📚 Documentation Exercises**: Добавени практически упражнения в ръководството за конфигурация:
  - Упражнение 1: Конфигурация за няколко среди (15 минути)
  - Упражнение 2: Практика за управление на тайни (10 минути)
  - Ясни критерии за успех и стъпки за верификация
- **✅ Deployment Verification**: Добавен раздел за верификация в ръководството за разгръщане:
  - Процедури за проверка на състоянието (health check)
  - Чеклист с критерии за успех
  - Очаквани изходи за всички команди за разгръщане
  - Бърза справка за отстраняване на проблеми

#### Enhanced
- **examples/README.md**: Актуализиран до качество A (93%):
  - Добавен azure-openai-chat във всички релевантни секции
  - Актуализиран брой локални примери от 3 на 4
  - Добавен в таблицата с примери за AI приложения
  - Интегриран в ръководството Quick Start за междинни потребители
  - Добавен в секцията Microsoft Foundry Templates
  - Актуализирана матрица за сравнение и секции за търсене на технологии
- **Documentation Quality**: Подобрено B+ (87%) → A- (92%) в папката docs:
  - Добавени очаквани изходи към критични примери с команди
  - Включени стъпки за верификация при промени в конфигурацията
  - Подобрено практическо обучение с практически упражнения

#### Changed
- **Learning Progression**: По-добра интеграция на AI примери за междинни учащи
- **Documentation Structure**: По-практични упражнения с ясни резултати
- **Verification Process**: Ясно добавени критерии за успех към ключови работни потоци

#### Improved
- **Developer Experience**: Разгръщането на Microsoft Foundry Models сега отнема 35-45 минути (спрямо 60-90 за сложни алтернативи)
- **Cost Transparency**: Ясни оценки на разходите ($50-200/month) за примера Microsoft Foundry Models
- **Learning Path**: AI разработчиците имат ясен входен пункт с azure-openai-chat
- **Documentation Standards**: Последователни очаквани изходи и стъпки за верификация

#### Validated
- ✅ Примерът Microsoft Foundry Models напълно функционален с `azd up`
- ✅ Всички 11 файлове за имплементация са синтактично коректни
- ✅ Инструкциите в README съвпадат с действителния опит при разгръщане
- ✅ Връзките в документацията са актуализирани на 8+ места
- ✅ Индексът на примерите точно отразява 4 локални примера
- ✅ Няма дублиращи се външни връзки в таблиците
- ✅ Всички навигационни препратки са верни

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps шаблон
- **Security**: Подготовка за Managed Identity, тайни в Key Vault
- **Monitoring**: Интеграция с Application Insights
- **Cost Management**: Проследяване на токени и оптимизация на използването
- **Deployment**: Една команда `azd up` за пълна настройка

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Тази версия въвежда изчерпателни, продукционно готови примери за разгръщане на контейнерни приложения с помощта на Azure Developer CLI (AZD), с пълна документация и интеграция в учебния път.**

#### Added
- **🚀 Container App Examples**: Нови локални примери в `examples/container-app/`:
  - [Главно ръководство](examples/container-app/README.md): Пълен преглед на контейнеризирани разгръщания, бърз старт, продукция и напреднали модели
  - [Прост Flask API](../../examples/container-app/simple-flask-api): REST API, подходящ за начинаещи, с scale-to-zero, health probes, мониторинг и отстраняване на проблеми
  - [Микросървисна архитектура](../../examples/container-app/microservices): Продукционно готово многосървисно разгръщане (API Gateway, Product, Order, User, Notification), асинхронни съобщения, Service Bus, Cosmos DB, Azure SQL, разпределено трасировaне, blue-green/canary разгръщане
- **Best Practices**: Сигурност, мониторинг, оптимизация на разходите и насоки за CI/CD за контейнерни натоварвания
- **Code Samples**: Пълни `azure.yaml`, Bicep шаблони и реализации на услуги на няколко езика (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Сценарии за край до край тестове, команди за мониторинг, насоки за отстраняване на проблеми

#### Changed
- **README.md**: Актуализиран да промотира и да свързва новите примери за контейнерни приложения под "Local Examples - Container Applications"
- **examples/README.md**: Актуализиран за да акцентира върху примерите за контейнерни приложения, да добави записи в матрицата за сравнение и да актуализира технологичните/архитектурни препратки
- **Course Outline & Study Guide**: Актуализирани да препращат към новите примери за контейнерни приложения и модели за разгръщане в съответните глави

#### Validated
- ✅ Всички нови примери могат да се разгръщат с `azd up` и следват най-добрите практики
- ✅ Вътрешните връзки на документацията и навигацията са актуализирани
- ✅ Примерите покриват сценариите от начинаещи до напреднали, включително продукционни микросървисни решения

#### Notes
- **Scope**: Английската документация и примери само
- **Next Steps**: Разширяване с допълнителни напреднали контейнерни модели и автоматизация на CI/CD в бъдещи версии

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Тази версия изпълнява всеобхватна промяна на името на продукта от "Microsoft Foundry" на "Microsoft Foundry" в цялата английска документация, отразявайки официалното ребрандиране на Microsoft.**

#### Changed
- **🔄 Product Name Update**: Пълно ребрандиране от "Microsoft Foundry" на "Microsoft Foundry"
  - Актуализирани всички препратки в английската документация в папката `docs/`
  - Преименувана папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Преименуван файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Общо: 23 препратки към съдържание актуализирани в 7 документационни файла

- **📁 Промени в структурата на папките**:
  - `docs/ai-foundry/` преименувана на `docs/microsoft-foundry/`
  - Всички кръстосани препратки актуализирани, за да отразят новата структура на папките
  - Връзките за навигация валидирани в цялата документация

- **📄 Преименуване на файлове**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всички вътрешни връзки актуализирани да сочат новото име на файла

#### Актуализирани файлове
- **Документация на главите** (7 файла):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 актуализации на навигационни връзки
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 референции на името на продукта актуализирани
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вече използва Microsoft Foundry (от предишни актуализации)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 референции актуализирани (преглед, обратна връзка от общността, документация)
  - `docs/getting-started/azd-basics.md` - 4 кръстосани връзки актуализирани
  - `docs/getting-started/first-project.md` - 2 навигационни връзки към глави актуализирани
  - `docs/getting-started/installation.md` - 2 връзки към следваща глава актуализирани
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 референции актуализирани (навигация, Discord общност)
  - `docs/troubleshooting/common-issues.md` - 1 навигационна връзка актуализирана
  - `docs/troubleshooting/debugging.md` - 1 навигационна връзка актуализирана

- **Файлове за структурата на курса** (2 файла):
  - `README.md` - 17 референции актуализирани (преглед на курса, заглавия на глави, секция с шаблони, прозрения от общността)
  - `course-outline.md` - 14 референции актуализирани (преглед, учебни цели, ресурси за главите)

#### Проверено
- ✅ Няма останали препратки към папка "ai-foundry" в английската документация
- ✅ Няма останали препратки към продуктовото име "Microsoft Foundry" в английската документация
- ✅ Всички навигационни връзки функционират с новата структура на папките
- ✅ Преименуванията на файлове и папки са успешно завършени
- ✅ Взаимните препратки между главите са проверени

#### Бележки
- **Обхват**: Промените приложени само към английската документация в папката `docs/`
- **Преводи**: Папките за преводи (`translations/`) не са актуализирани в тази версия
- **Работилница**: Материалите за работилницата (`workshop/`) не са актуализирани в тази версия
- **Примери**: Примерните файлове все още могат да съдържат препратки към наследени наименования (ще бъдат адресирани в бъдеща актуализация)
- **Външни връзки**: Външните URL адреси и GitHub референции остават непроменени

#### Ръководство за миграция за сътрудници
Ако имате локални клонове или документация, препращаща към старата структура:
1. Актуализирайте препратките към папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Актуализирайте препратките към файлове: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Заменете името на продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверете дали всички вътрешни документационни връзки все още работят

---

### [v3.4.0] - 2025-10-24

#### Подобрения за предварителен преглед и валидация на инфраструктурата
**Тази версия въвежда всеобхватна поддръжка за новата preview функция на Azure Developer CLI и подобрява потребителското изживяване в работилницата.**

#### Добавени
- **🧪 azd provision --preview Функционална документация**: Всеобхватно покритие на новата възможност за предварителен преглед на инфраструктурата
  - Референция на командата и примерни употреби в шпаргалката
  - Подробна интеграция в ръководството за provision с примери за използване и ползи
  - Интеграция на предварителни проверки за по-безопасна валидация на разгръщането
  - Актуализации в ръководството за започване с практики за разгръщане с приоритет на безопасността
- **🚧 Банер за статус на работилницата**: Професионален HTML банер, указващ статуса на разработка на работилницата
  - Дизайн с градиент и индикатори за строителство за ясно информиране на потребителите
  - Отметка с последна актуализация за прозрачност
  - Мобилно-отзивчив дизайн за всички типове устройства

#### Подобрено
- **Безопасност на инфраструктурата**: Функционалността за предварителен преглед интегрирана в цялата документация за разгръщане
- **Валидация преди разгръщане**: Автоматизираните скриптове вече включват тестове за предварителен преглед на инфраструктурата
- **Работен поток на разработчика**: Обновени последователности от команди, включващи preview като добра практика
- **Изживяване в работилницата**: Поставени ясни очаквания за потребителите относно статуса на съдържанието

#### Променено
- **Най-добри практики за разгръщане**: Препоръчва се първоначален работен поток с preview
- **Поточност на документацията**: Валидацията на инфраструктурата е преместена по-рано в учебния процес
- **Презентация на работилницата**: Професионална комуникация на статуса с ясен времеви план за разработка

#### Подобрено
- **Подход "безопасността първо"**: Промените в инфраструктурата вече могат да бъдат валидирани преди разгръщане
- **Сътрудничество в екипа**: Резултатите от preview могат да бъдат споделяни за преглед и одобрение
- **Осъзнаване на разходите**: По-добро разбиране на ресурсните разходи преди provision
- **Намаляване на риска**: По-малко неуспешни разгръщания чрез предварителна валидация

#### Техническа реализация
- **Мултидокументна интеграция**: Функцията preview документирана в 4 ключови файла
- **Шаблони на команди**: Консистентен синтаксис и примери в цялата документация
- **Интегриране на най-добри практики**: Preview включен в работните потоци за валидация и скриптове
- **Визуални индикатори**: Ясни маркировки за НОВА функционалност за по-лесно откриване

#### Инфраструктура на работилницата
- **Комуникация на статуса**: Професионален HTML банер с градиентно стилизиране
- **Потребителско преживяване**: Ясният статус на разработка предотвратява объркване
- **Професионална презентация**: Поддържа достоверността на репозиторията, докато задава очаквания
- **Прозрачност на времевата линия**: Октомври 2025 като последна отметка за актуализация за отчетност

### [v3.3.0] - 2025-09-24

#### Подобрени материали за работилници и интерактивно учене
**Тази версия въвежда всеобхватни материали за работилници с браузър-базирани интерактивни ръководства и структуриран учебен път.**

#### Добавени
- **🎥 Интерактивно ръководство за работилница**: Браузър-базирано изживяване на работилницата с възможност за преглед в MkDocs
- **📝 Структурирани инструкции за работилницата**: 7-степенен воден учебен път от откриването до персонализирането
  - 0-Introduction: Преглед на работилницата и настройка
  - 1-Select-AI-Template: Откриване и избор на шаблон
  - 2-Validate-AI-Template: Процедури за разгръщане и валидация
  - 3-Deconstruct-AI-Template: Разбиране на архитектурата на шаблона
  - 4-Configure-AI-Template: Конфигуриране и персонализиране
  - 5-Customize-AI-Template: Разширени модификации и итерации
  - 6-Teardown-Infrastructure: Почистване и управление на ресурси
  - 7-Wrap-up: Резюме и следващи стъпки
- **🛠️ Инструменти за работилницата**: Конфигурация на MkDocs с Material тема за подобрено учебно изживяване
- **🎯 Практичен учебен път**: 3-степенна методология (Откриване → Разгръщане → Персонализиране)
- **📱 Интеграция с GitHub Codespaces**: Безпроблемно настройване на развойна среда

#### Подобрено
- **AI Workshop Lab**: Разширен с всеобхватно структурирано учебно изживяване от 2-3 часа
- **Документация за работилницата**: Професионална презентация с навигация и визуални помощни материали
- **Прогрес в усвояването**: Ясни стъпки от избор на шаблон до разгръщане в продукция
- **Разработчикско преживяване**: Интегрирани инструменти за оптимизирани работни потоци

#### Подобрено
- **Достъпност**: Браузър-базирана интерфейс с търсене, възможност за копиране и превключване на тема
- **Самостоялно обучение**: Гъвкава структура, пригодна за различни темпове на учене
- **Практическо приложение**: Реални сценарии за разгръщане на AI шаблони
- **Интеграция с общността**: Интеграция с Discord за подкрепа и сътрудничество по работилницата

#### Функции на работилницата
- **Вградено търсене**: Бързо намиране на ключови думи и уроци
- **Копиране на блокове с код**: Функция hover-to-copy за всички примери с код
- **Превключване на тема**: Поддръжка на тъмна/светла тема
- **Визуални материали**: Скрийншотове и диаграми за по-добро разбиране
- **Интеграция за помощ**: Директен достъп до Discord за подкрепа от общността

### [v3.2.0] - 2025-09-17

#### Значително преструктуриране на навигацията и система за обучение, базирана на глави
**Тази версия въвежда всеобхватна структура за обучение, базирана на глави, с подобрена навигация в целия репозиториум.**

#### Добавени
- **📚 Система за обучение, базирана на глави**: Преструктуриране на целия курс в 8 прогресивни учебни глави
  - Chapter 1: Основи и бърз старт (⭐ - 30-45 мин)
  - Chapter 2: AI-първа разработка (⭐⭐ - 1-2 часа)
  - Chapter 3: Конфигурация и автентикация (⭐⭐ - 45-60 мин)
  - Chapter 4: Infrastructure as Code & Разгръщане (⭐⭐⭐ - 1-1.5 часа)
  - Chapter 5: Многоагентни AI решения (⭐⭐⭐⭐ - 2-3 часа)
  - Chapter 6: Предварителна валидация и планиране преди разгръщане (⭐⭐ - 1 час)
  - Chapter 7: Отстраняване на неизправности и дебъг (⭐⭐ - 1-1.5 часа)
  - Chapter 8: Продукция и корпоративни модели (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Всеобхватна навигационна система**: Последователни хедъри и футъри за навигация в цялата документация
- **🎯 Проследяване на напредъка**: Чеклист за завършване на курса и система за верификация на усвояването
- **🗺️ Насоки за учебния път**: Ясни входни точки за различни нива на опит и цели
- **🔗 Навигация с кръстосани препратки**: Свързани глави и предварителни условия ясно свързани

#### Подобрено
- **Структура на README**: Превърнат в структуриран учебен портал с организация по глави
- **Навигация в документацията**: Всяка страница вече включва контекст на глава и насоки за прогрес
- **Организация на шаблоните**: Примерите и шаблоните разпределени към подходящите учебни глави
- **Интеграция на ресурси**: Шпаргалки, ЧЗВ и учебни наръчници свързани с релевантни глави
- **Интеграция с работилница**: Практически лаборатории съответстващи на учебни цели от няколко глави

#### Променено
- **Напредък в обучението**: Преместване от линейна документация към гъвкава структура, базирана на глави
- **Поставяне на конфигурацията**: Ръководството за конфигурация преместено като Chapter 3 за по-добър учебен поток
- **Интеграция на AI съдържание**: По-добро интегриране на AI-специфично съдържание през целия учебен път
- **Съдържание за продукция**: Разширени модели консолидирани в Chapter 8 за корпоративни обучаеми

#### Подобрено
- **Потребителско преживяване**: Ясни breadcrumbs за навигация и индикатори за прогрес на главите
- **Достъпност**: Последователни навигационни шаблони за по-лесно преминаване през курса
- **Професионална презентация**: Университетски стил на структура, подходящ за академично и корпоративно обучение
- **Ефективност в обучението**: Намалено време за намиране на релевантно съдържание чрез подобрена организация

#### Техническа реализация
- **Хедъри за навигация**: Стандартизирана навигация по глави в над 40 документационни файла
- **Футър навигация**: Последователни насоки за прогрес и индикатори за завършване на глава
- **Крос-линкване**: Всеобхватна система за вътрешно свързване на свързани концепции
- **Картографиране на глави**: Шаблони и примери ясно асоциирани с учебни цели

#### Подобрение на учебното ръководство
- **📚 Комплексни учебни цели**: Преструктурирано учебно ръководство в съответствие със системата от 8 глави
- **🎯 Оценяване по глави**: Всяка глава включва конкретни учебни цели и практически упражнения
- **📋 Проследяване на прогреса**: Седмичен учебен график с измерими резултати и чеклистове за завършване
- **❓ Въпроси за оценяване**: Въпроси за валидация на знанията за всяка глава с професионални резултати
- **🛠️ Практически упражнения**: Hands-on активности с реални сценарии за разгръщане и отстраняване на неизправности
- **📊 Прогрес в уменията**: Ясно развитие от основни концепции до корпоративни модели с фокус върху кариерно развитие
- **🎓 Рамка за сертификация**: Изходи за професионално развитие и система за признаване от общността
- **⏱️ Управление на времевата линия**: Структуриран 10-седмичен учебен план с валидиране на етапите

### [v3.1.0] - 2025-09-17

#### Подобрени многоагентни AI решения
**Тази версия подобрява решението за многоагентна търговия на дребно с по-добро именоване на агентите и подобрена документация.**

#### Променено
- **Терминология за многоагентни решения**: Заменено "Cora agent" с "Customer agent" в цялото retail multi-agent решение за по-ясно разбиране
- **Архитектура на агентите**: Актуализирана цялата документация, ARM templates и примери с код да използват последователно именуване "Customer agent"
- **Примери за конфигурация**: Модернизирани модели на конфигурация на агентите с обновени конвенции за именуване
- **Съгласуваност на документацията**: Гарантирано, че всички референции използват професионални, описателни имена на агентите

#### Подобрено
- **ARM Template пакет**: Актуализиран retail-multiagent-arm-template с референции към Customer agent
- **Диаграми на архитектурата**: Обновени Mermaid диаграми с актуализирани имена на агентите
- **Примери с код**: Python класове и примери за имплементация вече използват именуване CustomerAgent
- **Променливи на средата**: Актуализирани всички скриптове за разгръщане да използват конвенции CUSTOMER_AGENT_NAME

#### Подобрено
- **Преживяване на разработчика**: По-ясно разграничаване на ролите и отговорностите на агентите в документацията
- **Готовност за продукция**: По-добро съответствие с корпоративните конвенции за именуване
- **Учебни материали**: По-интуитивно именуване на агентите за образователни цели
- **Употреба на шаблоните**: Улеснено разбиране на функциите и моделите за разгръщане на агентите

#### Технически детайли
- Актуализирани Mermaid диаграми на архитектурата с референции към CustomerAgent
- Заменени CoraAgent class имена с CustomerAgent в Python примери
- Модифицирани ARM template JSON конфигурации да използват тип агент "customer"
- Актуализирани environment променливи от CORA_AGENT_* към CUSTOMER_AGENT_* модели
- Обновени всички команди за разгръщане и конфигурации на контейнери

### [v3.0.0] - 2025-09-12

#### Основни промени - Фокус върху AI разработчиците и интеграция с Microsoft Foundry
**Тази версия трансформира репозиторията в всеобхватен учебен ресурс с фокус върху AI и интеграция с Microsoft Foundry.**

#### Добавени
- **🤖 Учебен път с приоритет AI**: Пълна реструктуризация, приоритизираща AI разработчиците и инженери
- **Ръководство за интеграция с Microsoft Foundry**: Всеобхватна документация за свързване на AZD с услугите на Microsoft Foundry
- **Модели за разгръщане на AI модели**: Подробно ръководство, покриващо избор на модел, конфигурация и стратегии за разгръщане в продукция
- **AI работилница**: 2-3 часова практическа работилница за преобразуване на AI приложения в решения, внедрими с AZD
- **Най-добри практики за продукционно използване на AI**: Подходи, готови за предприятието за мащабиране, наблюдение и защита на AI натоварвания
- **Ръководство за отстраняване на проблеми, специфични за AI**: Всеобхватно отстраняване на проблеми за Microsoft Foundry Models, Cognitive Services и проблеми при разгръщането на AI
- **Галерия с шаблони за AI**: Подбрана колекция от шаблони на Microsoft Foundry с оценки за сложност
- **Материали за работилницата**: Пълна структура на работилницата с практически лаборатории и справочни материали

#### Подобрено
- **Структура на README**: Насочена към AI разработчици с 45% данни за интереса от общността от Microsoft Foundry Discord
- **Обучителни пътеки**: Посветено пътуване за AI разработчици заедно с традиционни пътеки за студенти и DevOps инженери
- **Препоръки за шаблони**: Представени AI шаблони включително azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграция с общността**: Подобрена поддръжка в Discord общността с AI-специфични канали и дискусии

#### Сигурност и фокус върху продукционната среда
- **Шаблони за управлявани идентичности**: AI-специфични конфигурации за удостоверяване и сигурност
- **Оптимизация на разходите**: Проследяване на използването на токени и контрол на бюджета за AI натоварвания
- **Разгръщане в множество региони**: Стратегии за глобално разполагане на AI приложения
- **Наблюдение на производителността**: AI-специфични метрики и Application Insights интеграция

#### Качество на документацията
- **Линейна структура на курса**: Логично преминаване от начинаещи до напреднали AI модели за разгръщане
- **Проверени URL адреси**: Всички външни връзки към хранилища са проверени и достъпни
- **Пълен справочник**: Всички вътрешни връзки в документацията са валидирани и функционални
- **Готово за продукция**: Модели за внедряване в предприятия със примери от реалния свят

### [v2.0.0] - 2025-09-09

#### Основни промени - Преструктуриране на хранилището и професионално подобрение
**Тази версия представлява значително преработване на структурата на хранилището и представянето на съдържанието.**

#### Добавено
- **Структуриран учебен фреймуърк**: Всички документационни страници вече включват секции Въведение, Цели на обучението и Резултати от обучението
- **Навигационна система**: Добавени връзки Предишен/Следващ урок в цялата документация за водено обучение
- **Учебно ръководство**: Всеобхватен study-guide.md с учебни цели, практически упражнения и материали за оценяване
- **Професионално представяне**: Премахнати всички емоджита за подобрена достъпност и професионален външен вид
- **Подобрена структура на съдържанието**: Подобрена организация и поток на учебните материали

#### Променено
- **Формат на документацията**: Стандартизирани всички документи с последователна структура, фокусирана върху обучението
- **Навигационен поток**: Въведено логично последователно преминаване през всички учебни материали
- **Представяне на съдържанието**: Премахнати декоративни елементи в полза на ясно, професионално форматиране
- **Структура на връзките**: Актуализирани всички вътрешни връзки, за да поддържат новата навигационна система

#### Подобрено
- **Достъпност**: Премахната зависимостта от емоджита за по-добра съвместимост с екранни четци
- **Професионален облик**: Чисто, академично представяне, подходящо за корпоративно обучение
- **Учебно изживяване**: Структуриран подход с ясни цели и резултати за всеки урок
- **Организация на съдържанието**: По-добър логически поток и връзка между свързани теми

### [v1.0.0] - 2025-09-09

#### Първо издание - Всеобхватно AZD учебно хранилище

#### Добавено
- **Основна структура на документацията**
  - Пълна серия ръководства за започване
  - Всеобхватна документация за разгръщане и провизиране
  - Подробни ресурси за отстраняване на проблеми и ръководства за отстраняване на грешки
  - Инструменти и процедури за предварителна проверка преди разгръщане

- **Модул 'Започване'**
  - AZD Basics: Основни понятия и терминология
  - Инсталационно ръководство: Инструкции за настройка за конкретни платформи
  - Ръководство за конфигурация: Настройка на средата и удостоверяване
  - Уводен урок за първи проект: Практическо обучение стъпка по стъпка

- **Модул за разгръщане и провизиране**
  - Ръководство за разгръщане: Пълна документация на работния процес
  - Ръководство за провизиране: Инфраструктура като код с Bicep
  - Най-добри практики за продукционни разгръщания
  - Шаблони за мултисервисна архитектура

- **Модул за предварителна валидация**
  - Планиране на капацитета: Валидация на наличност на ресурси в Azure
  - Избор на SKU: Пълно ръководство за нива на услугата
  - Проверки преди полет: Автоматизирани скриптове за валидация (PowerShell и Bash)
  - Инструменти за оценка на разходите и планиране на бюджет

- **Модул за отстраняване на проблеми**
  - Чести проблеми: Често срещани проблеми и решения
  - Ръководство за отстраняване на грешки: Систематични методологии за отстраняване на проблеми
  - Разширени диагностични техники и инструменти
  - Наблюдение и оптимизация на производителността

- **Ресурси и справки**
  - Шпаргалка с команди: Бърза справка за основните команди
  - Речник: Пълен списък с термини и определения на съкращения
  - ЧЗВ: Подробни отговори на често срещани въпроси
  - Външни връзки към ресурси и връзки с общността

- **Примери и шаблони**
  - Пример с просто уеб приложение
  - Шаблон за разгръщане на статичен уебсайт
  - Конфигурация за контейнерно приложение
  - Шаблони за интеграция с база данни
  - Примери за микросервизни архитектури
  - Реализации на безсървърни функции

#### Характеристики
- **Поддръжка за множество платформи**: Ръководства за инсталация и конфигурация за Windows, macOS и Linux
- **Нива на умения**: Съдържание, предназначено за студенти до професионални разработчици
- **Практически фокус**: Практически примери и сценарии от реалния свят
- **Всеобхватно покритие**: От основни концепции до напреднали корпоративни модели
- **Подход, ориентиран към сигурността**: Най-добри практики за сигурност интегрирани през целия материал
- **Оптимизация на разходите**: Насоки за икономични разгръщания и управление на ресурси

#### Качество на документацията
- **Подробни примери с код**: Практически, тествани кодови примери
- **Инструкции стъпка по стъпка**: Ясни, приложими указания
- **Пълно обработване на грешки**: Отстраняване на често срещани проблеми
- **Интегриране на най-добри практики**: Отраслови стандарти и препоръки
- **Съвместимост на версиите**: Актуално спрямо последните услуги на Azure и функционалности на azd

## Планирани бъдещи подобрения

### Версия 3.1.0 (Планирано)
#### Разширяване на AI платформата
- **Поддръжка на множество модели**: Интеграционни модели за Hugging Face, Azure Machine Learning и потребителски модели
- **Фреймуъркове за AI агенти**: Шаблони за LangChain, Semantic Kernel и AutoGen разгръщания
- **Разширени RAG модели**: Опции за векторни бази данни извън Azure AI Search (Pinecone, Weaviate и др.)
- **Наблюдаемост за AI**: Подобрено наблюдение за производителността на моделите, използването на токени и качеството на отговорите

#### Опит на разработчика
- **Разширение за VS Code**: Интегрирано развитие на AZD + Microsoft Foundry
- **Интеграция с GitHub Copilot**: AI-помощ при генериране на AZD шаблони
- **Интерактивни уроци**: Практически кодиращи упражнения с автоматизирана валидация за AI сценарии
- **Видеосъдържание**: Допълнителни видео уроци за визуални обучаващи се, фокусирани върху AI разгръщания

### Версия 4.0.0 (Планирано)
#### Корпоративни модели за AI
- **Рамка за управление**: Управление на AI модели, съответствие и аудиторски следи
- **Мулти-тенант AI**: Модели за обслужване на множество клиенти с изолирани AI услуги
- **Разгръщане на Edge AI**: Интеграция с Azure IoT Edge и контейнерни инстанции
- **Хибриден облак за AI**: Мулти-облачни и хибридни модели за разгръщане на AI натоварвания

#### Разширени функции
- **Автоматизация на AI конвейери**: MLOps интеграция с Azure Machine Learning конвейри
- **Разширена сигурност**: Zero-trust модели, частни крайни точки и разширена защита от заплахи
- **Оптимизация на производителността**: Разширено настройване и стратегии за мащабиране за AI приложения с висок пропуск
- **Глобално разпространение**: Модели за доставка на съдържание и кеширане на ръба за AI приложения

### Версия 3.0.0 (Планирано) - Заменено от текущото издание
#### Предложени допълнения - Вече внедрени във v3.0.0
- ✅ **Съдържание, фокусирано върху AI**: Всеобхватна интеграция на Microsoft Foundry (Завършено)
- ✅ **Интерактивни уроци**: Практическа AI работилница (Завършено)
- ✅ **Модул за разширена сигурност**: AI-специфични шаблони за сигурност (Завършено)
- ✅ **Оптимизация на производителността**: Стратегии за настройване на AI натоварвания (Завършено)

### Версия 2.1.0 (Планирано) - Частично внедрено във v3.0.0
#### Малки подобрения - Някои изпълнени в настоящото издание
- ✅ **Допълнителни примери**: Сценарии за разгръщане, фокусирани върху AI (Завършено)
- ✅ **Разширено ЧЗВ**: Въпроси и отстраняване на проблеми, специфични за AI (Завършено)
- **Интеграция на инструменти**: Подобрени ръководства за интеграция с IDE и редактори
- ✅ **Разширено наблюдение**: AI-специфични модели за наблюдение и алармиране (Завършено)

#### Все още планирано за бъдещо издание
- **Мобилно-приятна документация**: Отзивчив дизайн за мобилно обучение
- **Офлайн достъп**: Изтегляеми пакети с документация
- **Подобрена интеграция с IDE**: Разширение за VS Code за AZD + AI работни потоци
- **Табло за общността**: Метрики в реално време и проследяване на приноси

## Принос към changelog-а

### Докладване на промени
Когато допринасяте за това хранилище, моля, уверете се, че записите в changelog включват:

1. **Номер на версията**: Следване на семантичното версиониране (major.minor.patch)
2. **Дата**: Дата на излизане или актуализация в формат YYYY-MM-DD
3. **Категория**: Добавено, Променено, Депрекирано, Премахнато, Поправено, Сигурност
4. **Ясно описание**: Кратко описание на това, което е променено
5. **Оценка на въздействието**: Как промените влияят на съществуващите потребители

### Категории на промените

#### Добавено
- Нови функции, секции от документацията или възможности
- Нови примери, шаблони или учебни ресурси
- Допълнителни инструменти, скриптове или помощни програми

#### Променено
- Модификации на съществуваща функционалност или документация
- Актуализации за подобряване на яснота или точност
- Преструктуриране на съдържанието или организацията

#### Депрекирано
- Функции или подходи, които се премахват постепенно
- Секции от документацията, планирани за премахване
- Методи, за които има по-добри алтернативи

#### Премахнато
- Функции, документация или примери, които вече не са релевантни
- Остаряла информация или депрекирани подходи
- Дублирано или консолидирано съдържание

#### Поправено
- Корекции на грешки в документацията или кода
- Разрешаване на докладвани проблеми или проблеми
- Подобрения в точността или функционалността

#### Сигурност
- Подобрения или поправки, свързани със сигурността
- Актуализации на най-добрите практики за сигурност
- Разрешаване на уязвимости в сигурността

### Насоки за семантично версиониране

#### Главна версия (X.0.0)
- Промени, нарушаващи съвместимостта, които изискват действие от потребителя
- Значително преструктуриране на съдържанието или организацията
- Промени, които променят основния подход или методологията

#### Минорна версия (X.Y.0)
- Нови функции или добавяне на съдържание
- Подобрения, които запазват обратна съвместимост
- Допълнителни примери, инструменти или ресурси

#### Патч версия (X.Y.Z)
- Поправки на грешки и корекции
- Малки подобрения на съществуващото съдържание
- Уточнения и малки подобрения

## Обратна връзка от общността и предложения

Активно насърчаваме обратната връзка от общността за подобряване на този учебен ресурс:

### Как да предоставите обратна връзка
- **GitHub Issues**: Докладвайте проблеми или предлагайте подобрения (AI-специфични проблеми са добре дошли)
- **Discord дискусии**: Споделяйте идеи и се ангажирайте с общността на Microsoft Foundry
- **Pull Requests**: Допринасяйте директни подобрения в съдържанието, особено AI шаблони и ръководства
- **Microsoft Foundry Discord**: Участвайте в канала #Azure за дискусии за AZD + AI
- **Форуми на общността**: Включете се в по-широки дискусии сред Azure разработчиците

### Категории обратна връзка
- **Точност на AI съдържанието**: Корекции в информацията за интеграция и разгръщане на AI услуги
- **Учебно изживяване**: Предложения за подобряване на учебния поток за AI разработчици
- **Липсващо AI съдържание**: Искания за допълнителни AI шаблони, модели или примери
- **Достъпност**: Подобрения за разнообразни нужди при учене
- **Интеграция на AI инструменти**: Предложения за по-добра интеграция на работния поток при разработка на AI
- **Продукционни AI модели**: Искания за модели за разгръщане на AI в предприятия

### Ангажимент за отговор
- **Отговор на проблеми**: В рамките на 48 часа за докладвани проблеми
- **Заявки за функции**: Оценка в рамките на една седмица
- **Приноси от общността**: Преглед в рамките на една седмица
- **Проблеми със сигурността**: Незабавен приоритет с ускорен отговор

## График за поддръжка

### Редовни актуализации
- **Месечни прегледи**: Проверка на точността на съдържанието и валидиране на връзки
- **Тримесечни актуализации**: Основни допълнения и подобрения на съдържанието
- **Полугодишни прегледи**: Всеобхватно преструктуриране и подобрения
- **Годишни издания**: Основни актуализации на версиите с значителни подобрения

### Наблюдение и осигуряване на качеството
- **Автоматизирано тестване**: Редовна проверка на кодовите примери и връзките
- **Интеграция на обратна връзка от общността**: Редовно включване на предложения от потребителите
- **Актуализации на технологиите**: Съвместяване с най-новите услуги на Azure и изданията на azd
- **Аудити за достъпност**: Редовен преглед за принципи на инклузивен дизайн

## Политика за поддръжка на версиите

### Поддръжка на текущите версии
- **Най-нова главна версия**: Пълна поддръжка с редовни актуализации
- **Предишна главна версия**: Актуализации за сигурност и критични поправки за 12 месеца
- **Остарели версии**: Само поддръжка от общността, без официални актуализации

### Ръководство за миграция
Когато се пускат главни версии, предоставяме:
- **Ръководства за миграция**: Инструкции за преход стъпка по стъпка
- **Бележки за съвместимост**: Подробности за промени, нарушаващи съвместимостта
- **Поддръжка на инструменти**: Скриптове или помощни програми за подпомагане на миграцията
- **Поддръжка от общността**: Посветени форуми за въпроси относно миграцията

---

**Навигация**
- **Предишен урок**: [Учебно ръководство](resources/study-guide.md)
- **Следващ урок**: Върнете се към [Основен README](README.md)

**Бъдете в течение**: Наблюдавайте това хранилище за известия за нови издания и важни актуализации на учебните материали.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->