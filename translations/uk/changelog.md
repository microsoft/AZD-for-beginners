# Журнал змін - AZD для початківців

## Вступ

Цей журнал змін документує всі помітні зміни, оновлення та покращення репозиторію AZD для початківців. Ми дотримуємося принципів семантичного версіонування і підтримуємо цей журнал, щоб допомогти користувачам розуміти, що змінилося між версіями.

## Цілі навчання

Переглянувши цей журнал змін, ви зможете:
- Бути в курсі нових функцій та додавання контенту
- Розуміти покращення в існуючій документації
- Відстежувати виправлення помилок та корекції для забезпечення точності
- Слідувати за розвитком навчальних матеріалів з часом

## Результати навчання

Після перегляду записів журналу змін ви зможете:
- Визначати новий контент і ресурси, доступні для навчання
- Розуміти, які розділи були оновлені або покращені
- Планувати свій навчальний шлях на основі найактуальніших матеріалів
- Надсилати відгуки та пропозиції щодо майбутніх покращень

## Історія версій

### [v3.23.0] - 2026-07-13

#### Оновлення AZD 1.27.1: Оновлення версії
**Ця версія знову підтверджує курс проти `azd` `1.27.1` (липень 2026, останній стабільний реліз) та поточного прев’ю розширення AI агентів `azure.ai.agents` `1.0.0-beta.5`, оновлюючи всі банери "validated against" після релізів 1.26.0, 1.27.0 та 1.27.1.**

#### Зміни
- **✅ Оновлено базову лінію валідації** з `azd 1.25.6` (червень 2026) до `azd 1.27.1` (липень 2026) по кореневому README, усім README розділів, уроці dev-container Розділу 1 (включаючи приклади із фіксованою версією), уроці кастомних шаблонів Розділу 4, уроці багатофункціонального агента Розділу 5 та документації майстерні
- **🤖 Оновлено базову лінію Розділу 2** з `azd 1.23.12` (березень 2026) до `azd 1.27.1` у `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` та `microsoft-foundry-integration.md`; оновлено дати валідації до 2026-07-13
- **🧩 Оновлено розширення AI агентів** з `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до поточного випуску `1.0.0-beta.5` у README Розділу 2 та `agents.md`
- **🧪 Оновлено приклад валідації майстерні** (вивід `azd version`) до `1.27.1`

#### Нотатки щодо відповідних релізів azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Підтримка Go для Azure Functions на Flex Consumption, фільтри підписки за орендарем `azd config sub-filter`, самодостатні пакети розширень (`azd x pack --bundle`), та `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделювання проєктів/агентів Azure AI Foundry напряму у `azure.yaml` (ініціалізація без Bicep/Terraform), підтримка деплою контейнера для App Service (`host: appservice` + `language: docker`), прямий `-s/--source` для команд `azd extension`, та `azd tool uninstall`
- **1.27.1 (2026-07-09):** прапорець `--no-dependencies` для `azd extension install`, за замовчуванням вилучені застарілі моделі з каталогів/запитів квот, та кілька виправлень помилок

#### Оновлені файли
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

#### Заповнення прогалин для початківців #2: створення шаблонів, dev-контейнери, Pulumi, Azure DevOps, Service Principals та інше
**Ця версія закриває залишкові проміжні прогалини, які виявив аналіз azd-coverage: як створювати та публікувати власний шаблон, відтворювані середовища dev-контейнерів/Codespaces, провайдер інфраструктури Pulumi, огляд CI/CD в Azure DevOps, аутентифікація за допомогою service-principal, рекомендації щодо вибору хоста (AKS/Spring Apps), пояснення `azd restore`/`azd package`, обробка помилок у хукках та практики командних/спільних середовищ.**

#### Додано
- **🧱 Новий урок Розділу 4** `docs/chapter-04-infrastructure/custom-templates.md` — створення власного шаблону azd: необхідна структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризація інфраструктури з допомогою токена ресурсу `uniqueString()` та тегу `azd-env-name`, локальне тестування з `azd init --template <local-path>`, публікація на GitHub та подання до галереї Awesome AZD
- **📦 Новий урок Розділу 1** `docs/chapter-01-foundation/dev-containers.md` — відтворювані azd-середовища з Dev Containers та GitHub Codespaces: мінімальний `.devcontainer/devcontainer.json` з офіційною можливістю `ghcr.io/azure/azure-dev/azd`, функції для мов програмування, `docker-in-docker` для хостів контейнерів, та віддалений вхід через `azd auth login --use-device-code`
- **🧩 Pulumi з azd** розділ у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура папки Pulumi, стек зіставлені з середовищами azd, необхідні виводи/теги, ідентичний робочий процес `azd up` / `azd down`
- **🎯 Рекомендації щодо вибору хоста** у `docs/chapter-04-infrastructure/provisioning.md` — дружнє для початківців порівняння `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` і `springapp`, а також поради, коли обрати AKS чи Azure Spring Apps
- **🛠️ Огляд CI/CD Azure DevOps** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, служба підключення із федерацією workload identity (OIDC), створений файл `azure-dev.yml` та налаштування групи змінних
- **🔑 Service Principals (Патерн 4)** додано у `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неінтерактивний `azd auth login` з клієнтським секретом або федеративними/OIDC даними, коли використовувати та безпечне зберігання облікових даних
- **🪝 Обробка помилок у хуках** підрозділ в `docs/chapter-04-infrastructure/deployment-guide.md` — коди виходу і `set -e`, `continueOnError`, тестування хуків окремо через `azd hooks run`, ОС-специфічні шелли та `--debug`
- **👥 Командні / спільні середовища** розділ у `docs/chapter-03-configuration/configuration.md` — що лежить у `.azure/`, що ігнорувати у git, середовища на рівні розробника, `azd env list`/`select`, передача значень середовища у CI/CD
- **🧰 `azd restore` та розширені пояснення `azd package`** у `resources/cheat-sheet.md` — відновлення залежностей та створення артефакту для деплоя без деплойменту

#### Зміни
- **🧭 Оновлено таблицю уроків Розділу 4** для включення нового уроку "Створення власного шаблону" (Урок 3)
- **🧭 Оновлено таблицю уроків Розділу 1** для включення нового уроку "Dev Containers & Codespaces" (Урок 5); підключення навігаційних футерів між `bring-your-own-app.md` та `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заповнення прогалин для початківців: практичний урок з багатофункціональними агентами, "Bring Your Own App", Terraform та огляд CI/CD
**Ця версія закриває найбільші прогалини для повного посібника для початківців, додаючи два нові практичні уроки (розгортання багатофункціонального агента та додавання azd до існуючого застосунку), поняття хуків для початківців, розділ про Terraform з azd, крок за кроком огляд GitHub Actions pipeline, пояснення для нових прев’ю розширень і явний чеклист для перевірки розгортання.**

#### Додано
- **🤝 Новий урок Розділу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — повністю практичний, розгортальний прохід із двома агентами (оркестратор + спеціалісти) на основі реального шаблону (`contoso-creative-writer`), охоплює коли використовувати багатофункціонального агента, робочий процес `azd up`, розуміння розгорнутих ресурсів, трасування між агентами, налаштування та очищення
- **📦 Новий урок Розділу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — як додати azd до існуючого проєкту за допомогою `azd init` ("use code in the current directory"), розуміння `azure.yaml` та `infra/`, `azd infra generate`, виявлення хоста та розгортання через `azd up`
- **🌐 Розділ Terraform з azd** доданий до `docs/chapter-04-infrastructure/provisioning.md` — конфігурація `infra.provider: terraform`, структура папки `.tf`, обов’язкові `AZURE_*` виводи та тегування `azd-env-name`, ідентичний робочий процес `azd up` / `azd down` (закриває прогалину, де Terraform підтримка заявлялася, але показаний був тільки Bicep)
- **⚙️ Крок за кроком огляд GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — від GitHub репозиторію до автоматичних деплоїв: `azd pipeline config`, федеративні облікові дані OIDC (без збережених секретів), створений файл `azure-dev.yml` та рекомендації щодо секретів проти змінних
- **🪝 Вступ для початківців "Новачок у хуках?"** у `docs/chapter-04-infrastructure/deployment-guide.md` — що таке хук, таблиця стадій хуку, мінімальний перший хук та ручне запускання хуків за допомогою `azd hooks run`
- **✅ Додано чеклист "Перевірте своє розгортання"** до Кроку 5 у `docs/chapter-01-foundation/first-project.md` — базовий тест, перевірка endpoint здоров’я та явні критерії успіху
- **🧩 Пояснення нових прев’ю розширень** `azure.ai.skills` та `azure.ai.connections` (що це та коли їх використовувати) у `docs/chapter-08-production/production-ai-practices.md`

#### Зміни
- **🧭 Виправлено таблицю уроків Розділу 5**: `multi-agent-basics.md` тепер Урок 1 (єдиний повністю практичний урок), з чесним позначенням, що Урок 2 знаходиться у Розділі 6, а сценарій ритейлу — це архітектурний план, а не шаблон з однією командою
- **🧭 Таблиця уроків Розділу 1** тепер включає новий урок "Bring Your Own App" (Урок 4)
- **🔗 Оновлено навігаційні футери**: `first-project.md` тепер посилається вперед на `bring-your-own-app.md`

#### Виправлено
- **🧱 Закрито прогалину Terraform, що заявлялася, але не представлена** — у курсі раніше згадувалася підтримка Terraform без показу
- **🔀 Виправлено оманливі перехресні посилання Розділу 5** які створювали враження повного багатофункціонального агенту, коли це був лише архітектурний план

#### Оновлені файли
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(новий)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(новий)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Оновлення AZD 1.25.6, повні команди життєвого циклу агентів та ребрендинг Aspire

**Ця версія повторно перевіряє курс на основі `azd` `1.25.6` (червень 2026) та розширення `azure.ai.agents` `0.1.40-preview`, розширює керівництво з ШІ від "створення агента" до повного життєвого циклу агента (тестування → оцінювання → оптимізація → інспекція → видалення), відображає нові прев’ю-розширення `azure.ai.skills` і `azure.ai.connections`, а також зауважує ребрендинг продукту ".NET Aspire" → "Aspire".**

#### Додано
- **🔁 Повне охоплення життєвого циклу агента** для початківців і інженерів ШІ по всій документації:
  - `docs/chapter-01-foundation/azd-basics.md` — додано таблицю життєвого циклу (створення → тестування → вимірювання → покращення → інспекція → прибирання) у розділ Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — новий розділ "Управління життєвим циклом агента", що охоплює `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` і `delete --force`
  - `resources/cheat-sheet.md` — розширено команди AI Agent командами `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` і `delete --force`
- **🧩 Документовано нові прев’ю-розширення**: `azure.ai.skills` (багаторазові навички агента) і `azure.ai.connections` (підключення Foundry) додані до таблиці розширень і шпаргалки
- **⏱️ Керівництво з часу реагування** — приклади `azd ai agent invoke` тепер зазначають загальну затримку й час до першого байта
- **📌 Банер версії** у кореневому README, що направляє користувачів до `azd version` та `azd upgrade`

#### Змінено
- **✅ Оновлено базову валідацію** з `azd 1.23.12` (березень 2026) до `azd 1.25.6` (червень 2026) у всіх README розділах і документації воркшопу
- **🤖 Оновлено примітку про розширення в главі 2** з `azure.ai.agents` `0.1.18-preview` до `0.1.40-preview`
- **🧪 Приклад валідації воркшопу** (`azd version` вивід) оновлено до `1.25.6`
- **🧭 Оновлено README "Що нового в azd сьогодні"** для виділення повного життєвого циклу агента, нових AI-розширень і нещодавніх покращень якості (ідемпотентність `azd init`, очищення простроченого токена у `azd auth login`, підказка при першому запуску `azd tool`)
- **📖 Chapter 2 agents.md (Варіант 4)** тепер направляє користувачів до команд життєвого циклу після розгортання, а не зупиняється на `azd up`

#### Виправлено
- **🏷️ Назва продукту** — додано примітку про ребрендинг Aspire (".NET Aspire" тепер просто "Aspire"); підтримка Aspire в azd залишилася без змін
- **🔎 Підтверджено валідацію живого релізу** за даними релізної стрічки Azure Developer CLI: стабільна версія CLI `1.25.6` (2026-06-12) і `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Оновлені файли
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

#### Уточнення для початківців, валідація налаштувань і очищення кінцевих команд AZD
**Ця версія продовжує валідацію AZD 1.23 серією документів, орієнтованих на початківців: уточнює керівництво з аутентифікації для AZD, додає локальні сценарії перевірки налаштувань, перевіряє основні команди з живим AZD CLI і видаляє останні застарілі посилання на англомовні команди поза змінами.**

#### Додано
- **🧪 Сценарії перевірки налаштувань для початківців** з `validate-setup.ps1` та `validate-setup.sh`, щоб учні могли підтвердити наявність потрібних інструментів перед початком Глави 1
- **✅ Кроки перевірки налаштувань на початку** в кореневому README і README Глави 1 для виявлення відсутніх передумов до `azd up`

#### Змінено
- **🔐 Керівництво з аутентифікації для початківців** тепер послідовно трактує `azd auth login` як основний шлях у робочих процесах AZD, тоді як `az login` вказується як опціональний, якщо напряму використовуються команди Azure CLI
- **📚 Потік початку роботи в Главі 1** тепер направляє користувачів перевірити локальні налаштування перед встановленням, аутентифікацією та першими кроками розгортання
- **🛠️ Повідомлення валідатора** тепер чітко розділяє обов’язкові вимоги та необов’язкові попередження Azure CLI для виключно AZD-орієнтованого шляху початківців
- **📖 Документація з конфігурації, усунення несправностей і прикладів** тепер розрізняє обов’язкову аутентифікацію AZD і необов’язковий вхід через Azure CLI, тоді як раніше все подавалось без контексту

#### Виправлено
- **📋 Оновлено залишкові посилання на команди з англомовного джерела** до актуальних форм AZD, зокрема `azd config show` у шпаргалці та `azd monitor --overview` у випадках де потрібно було огляд Application Insights
- **🧭 Пом’якшено твердження для початківців у Главі 1** щоб уникнути надмірного обіцяного гарантованого безпомилкового виконання або відкату у всіх шаблонах і ресурсах Azure
- **🔎 Підтверджено живу валідацію CLI** для команд `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` і `azd down --force --purge`

#### Оновлені файли
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

#### Валідація AZD 1.23.12, розширення середовища воркшопу та оновлення моделей ШІ
**Ця версія виконує перевірку документації за `azd` `1.23.12`, оновлює застарілі приклади команд AZD, оновлює рекомендації моделей ШІ до поточних значень за замовчуванням та розширює інструкції воркшопу, додаючи підтримку dev-контейнерів і локальних клонів на додаток до GitHub Codespaces.**

#### Додано
- **✅ Примітки до валідації по основних главах і документації воркшопу** для явного позначення тестованої базової версії AZD для користувачів із новішими або старішими версіями CLI
- **⏱️ Рекомендації по таймауту розгортання** для тривалих розгортань AI-додатків із `azd deploy --timeout 1800`
- **🔎 Кроки перевірки розширень** з `azd extension show azure.ai.agents` у документації AI-робочих процесів
- **🌐 Ширше керівництво по середовищу воркшопу** з підтримкою GitHub Codespaces, dev-контейнерів і локальних клонів через MkDocs

#### Змінено
- **📚 README вступів по главах** тепер послідовно вказують валідацію за `azd 1.23.12` для розділів foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting та production
- **🛠️ Посилання на команди AZD** оновлено до поточних форм по всій документації:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` або `azd env get-value(s)` залежно від контексту
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, де планується огляд Application Insights
- **🧪 Приклади попереднього перегляду provisioning** спрощено до поточної підтримуваної форми, як-от `azd provision --preview` і `azd provision --preview -e production`
- **🧭 Потік воркшопу** оновлено, щоб учні могли виконувати лабораторії в Codespaces, dev-контейнері чи локальному клоні замість припущення виключно Codespaces
- **🔐 Керівництво з аутентифікації** тепер віддає перевагу `azd auth login` у робочих процесах AZD, а `az login` позиціонується як опціональний при прямому використанні команд Azure CLI

#### Виправлено
- **🪟 Команди встановлення Windows** узгоджено з поточним регістром пакету `winget` у керівництві встановлення
- **🐧 Корекція керівництва встановлення на Linux** для уникнення інструкцій з керування пакетами `azd` для специфічних дистрибутивів без підтримки і замість цього вказано на релізні ресурси
- **📦 Оновлено приклади моделей ШІ** від старих за замовчуванням на зразок `gpt-35-turbo` і `text-embedding-ada-002` до поточних прикладів `gpt-4.1-mini`, `gpt-4.1` і `text-embedding-3-large`
- **📋 Виправлення фрагментів розгортання та діагностики** для використання актуальних команд середовища та статусу у логах, сценаріях і кроках усунення несправностей
- **⚙️ Оновлено керівництво GitHub Actions** з `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Оновлення керівництва з дозволів MCP/Copilot** з `azd mcp consent` на `azd copilot consent list`

#### Покращено
- **🧠 Керівництво по розділах ШІ** тепер краще пояснює поведінку `azd ai`, чутливу до прев’ю, входи з урахуванням орендаря, поточне використання розширень і оновлені рекомендації щодо розгортання моделей
- **🧪 Інструкції воркшопу** тепер з більш реалістичними прикладами версій і яснішими формулюваннями налаштувань середовища для практичних лабораторій
- **📈 Документація з продакшн та усунення несправностей** тепер краще узгоджена з поточними прикладами моніторингу, моделей заміни та рівнів вартості

#### Оновлені файли
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

#### Команди AZD AI CLI, перевірка контенту та розширення шаблонів
**Ця версія додає покриття команд `azd ai`, `azd extension` і `azd mcp` у всіх главах, пов’язаних з ШІ, виправляє зламані посилання і застарілий код в agents.md, оновлює шпаргалку і капітально оновлює розділ Example Templates з перевіреними описами і новими шаблонами Azure AI AZD.**

#### Додано
- **🤖 Покриття AZD AI CLI** у 7 файлах (до цього лише в Главі 8):
  - `docs/chapter-01-foundation/azd-basics.md` — новий розділ "Extensions and AI Commands" із командою `azd extension`, `azd ai agent init` і `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Варіант 4: `azd ai agent init` із табличним порівнянням (підхід шаблону проти манифесту)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — підрозділи "AZD Extensions for Foundry" і "Agent-First Deployment"

  - `docs/chapter-05-multi-agent/README.md` — Швидкий старт тепер показує як шаблонні, так і основані на маніфесті шляхи розгортання
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Розділ розгортання тепер включає опцію `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Підсекція "Команди розширення AZD AI для діагностики"
  - `resources/cheat-sheet.md` — Новий розділ "Команди AI та розширень" із `azd extension`, `azd ai agent init`, `azd mcp` та `azd infra generate`
- **📦 Нові шаблони прикладів AZD AI** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат з Blazor WebAssembly, Semantic Kernel і підтримкою голосового чату
  - **azure-search-openai-demo-java** — Java RAG чат із Langchain4J з опціями розгортання ACA/AKS
  - **contoso-creative-writer** — Мультиагентний додаток для творчого письма з використанням Azure AI Agent Service, Bing Grounding і Prompty
  - **serverless-chat-langchainjs** — Serverless RAG на базі Azure Functions + LangChain.js + Cosmos DB з підтримкою локальної розробки Ollama
  - **chat-with-your-data-solution-accelerator** — Прискорювач Enterprise RAG з адміністраторським порталом, інтеграцією Teams та опціями PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Опорний додаток оркестрації мультиагентного MCP із серверами .NET, Python, Java та TypeScript
  - **azd-ai-starter** — Мінімальний стартовий шаблон Azure AI інфраструктури на Bicep
  - **🔗 Посилання на класну галерею AZD AI** — Посилання на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (понад 80 шаблонів)

#### Виправлено
- **🔗 Навігація agents.md**: Посилання "Попередній/Наступний" тепер відповідають порядку уроків у README Розділу 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Поламані посилання в agents.md**: `production-ai-practices.md` виправлено на `../chapter-08-production/production-ai-practices.md` (3 випадки)
- **📦 Застарілий код у agents.md**: Заміна `opencensus` на `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Некоректний API в agents.md**: Параметр `max_tokens` переміщено з `create_agent()` до `create_run()` як `max_completion_tokens`
- **🔢 Підрахунок токенів у agents.md**: Заміна приблизної оцінки `len//4` на `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Виправлено сервіси з "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (стандартний хост змінено в жовтні 2024)
- **contoso-chat**: Оновлено опис для посилання на Azure AI Foundry + Prompty, що відповідає справжній назві й техстеку репозиторію

#### Видалено
- **ai-document-processing**: Видалено нефункціональне посилання на шаблон (репозиторій недоступний публічно як шаблон AZD)

#### Покращено
- **📝 Вправи в agents.md**: Вправа 1 тепер показує очікуваний результат і крок `azd monitor`; Вправа 2 включає повний код реєстрації `FunctionTool`; Вправа 3 замінює узагальнені рекомендації на конкретні команди `prepdocs.py`
- **📚 Ресурси в agents.md**: Оновлені посилання на документацію до поточних docs для Azure AI Agent Service та швидкий старт
- **📋 Таблиця Наступних Кроків у agents.md**: Додано посилання на AI Workshop Lab для повного охоплення розділу

#### Оновлені файли
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Покращення навігації курсу
**Ця версія покращує навігацію за розділами README.md за допомогою розширеного формату таблиці.**

#### Зміни
- **Таблиця карти курсу**: Покращена прямими посиланнями на уроки, оцінками тривалості та рівня складності
- **Очищення папок**: Видалено зайві старі папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Перевірка посилань**: Перевірено всі 21+ внутрішніх посилань у таблиці карти курсу

### [v3.16.0] - 2026-02-05

#### Оновлення назв продуктів
**У цій версії оновлено посилання на продукти відповідно до сучасного бренду Microsoft.**

#### Зміни
- **Microsoft Foundry → Microsoft Foundry**: Усі посилання оновлені у файлах, що не перекладаються
- **Azure AI Agent Service → Foundry Agents**: Оновлено назву сервісу згідно із поточним брендингом

#### Оновлені файли
- `README.md` - Головна сторінка курсу
- `changelog.md` - Історія версій
- `course-outline.md` - Структура курсу
- `docs/chapter-02-ai-development/agents.md` - Посібник із AI агентів
- `examples/README.md` - Документація з прикладів
- `workshop/README.md` - Сторінка воркшопу
- `workshop/docs/index.md` - Індекс воркшопу
- `workshop/docs/instructions/*.md` - Всі файли інструкцій воркшопу

---

### [v3.15.0] - 2026-02-05

#### Глобальна реструктуризація репозиторію: Дзвінкові папки за розділами
**Ця версія реструктурує документацію в окремі папки до кожного розділу для кращої навігації.**

#### Перейменування папок
Старі папки замінено папками з номерами розділів:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додано нову: `docs/chapter-05-multi-agent/`

#### Міграції файлів
| Файл | Звідки | Куди |
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
| Усі файли pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Усі файли troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Додано
- **📚 README файли розділів**: Створено README.md у кожній папці розділу з:
  - Цілями навчання та тривалістю
  - Таблицею уроків з описом
  - Командами швидкого старту
  - Навігацією до інших розділів

#### Змінено
- **🔗 Оновлено всі внутрішні посилання**: 78+ шляхів оновлено у всій документації
- **🗺️ Основний README.md**: Оновлено карту курсу з новою структурою розділів
- **📝 examples/README.md**: Оновлено перехресні посилання на папки розділів

#### Видалено
- Стару структуру папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризація репозиторію: Навігація за розділами
**Ця версія додала README файли навігації за розділами (замінені версією v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новий посібник AI агентів
**Ця версія додає повний посібник із розгортання AI агентів за допомогою Azure Developer CLI.**

#### Додано
- **🤖 docs/microsoft-foundry/agents.md**: Повний посібник, що охоплює:
  - Що таке AI агенти і чим вони відрізняються від чатботів
  - Три шаблони швидкого старту агентів (Foundry Agents, Prompty, RAG)
  - Архітектурні патерни агентів (один агент, RAG, мультиагент)
  - Налаштування та кастомізація інструментів
  - Моніторинг і відстеження метрик
  - Врахування вартості та оптимізація
  - Типові сценарії усунення несправностей
  - Три практичні вправи з критеріями успіху

#### Структура змісту
- **Вступ**: Концепції агентів для початківців
- **Швидкий старт**: Розгортання агентів з `azd init --template get-started-with-ai-agents`
- **Патерни архітектури**: Візуальні діаграми патернів агентів
- **Налаштування**: Конфігурація інструментів та змінних середовища
- **Моніторинг**: Інтеграція з Application Insights
- **Вправи**: Прогресивне навчання на практиці (20-45 хвилин кожна)

---

### [v3.12.0] - 2026-02-05

#### Оновлення середовища DevContainer
**Ця версія оновлює конфігурацію контейнера розробки сучасними інструментами та кращими налаштуваннями для досвіду навчання AZD.**

#### Змінено
- **🐳 Базовий образ**: Оновлено з `python:3.12-bullseye` на `python:3.12-bookworm` (остання стабільна версія Debian)
- **📛 Ім'я контейнера**: Перейменовано з "Python 3" на "AZD for Beginners" для ясності

#### Додано
- **🔧 Нові можливості Dev Container**:
  - `azure-cli` з увімкненою підтримкою Bicep
  - `node:20` (LTS версія для шаблонів AZD)
  - `github-cli` для керування шаблонами
  - `docker-in-docker` для розгортання контейнерних додатків

- **🔌 Проброс портів**: Попередньо налаштовані порти для розробки:
  - 8000 (попередній перегляд MkDocs)
  - 3000 (Веб-додатки)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Нові розширення VS Code**:
  - `ms-python.vscode-pylance` - Розширений Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Підтримка Azure Functions
  - `ms-azuretools.vscode-docker` - Підтримка Docker
  - `ms-azuretools.vscode-bicep` - Підтримка мови Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управління ресурсами Azure
  - `yzhang.markdown-all-in-one` - Редагування Markdown
  - `DavidAnson.vscode-markdownlint` - Лінтинг Markdown
  - `bierner.markdown-mermaid` - Підтримка діаграм Mermaid
  - `redhat.vscode-yaml` - Підтримка YAML (для azure.yaml)
  - `eamodio.gitlens` - Візуалізація Git
  - `mhutchie.git-graph` - Історія Git

- **⚙️ Налаштування VS Code**: Додані стандартні налаштування для інтерпретатора Python, форматування при збереженні, обрізання пробілів

- **📦 Оновлено requirements-dev.txt**:
  - Додано плагін мінімізації MkDocs
  - Додано pre-commit для якості коду
  - Додано пакети Azure SDK (azure-identity, azure-mgmt-resource)

#### Виправлено
- **Post-Create команда**: Тепер перевіряє інсталяцію AZD та Azure CLI при запуску контейнера

---

### [v3.11.0] - 2026-02-05

#### Переробка README для початківців
**Ця версія суттєво покращує README.md для більшої доступності для початківців і додає важливі ресурси для розробників AI.**

#### Додано
- **🆚 Порівняння Azure CLI та AZD**: Чітке пояснення, коли використовувати кожен інструмент із практичними прикладами
- **🌟 Класні посилання AZD**: Прямі посилання на спільнотний галерею шаблонів та ресурси внеску:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Понад 200 готових до розгортання шаблонів
  - [Подати шаблон](https://github.com/Azure/awesome-azd/issues) - Спільнотний внесок
- **🎯 Керівництво швидкого старту**: Спрощений розділ старту з трьох кроків (Інсталювати → Увійти → Розгорнути)
- **📊 Таблиця навігації на основі досвіду**: Чіткі вказівки, з чого почати залежно від рівня розробника

#### Змінено
- **Структура README**: Перегрупована для поступового ознайомлення – спочатку ключова інформація
- **Вступний розділ**: Переписано для пояснення "Магії `azd up`" для абсолютних початківців
- **Видалено дубльований контент**: Видалено дублікати розділу усунення несправностей
- **Команди усунення несправностей**: Виправлено посилання `azd logs` на дійсну `azd monitor --logs`

#### Виправлено

- **🔐 Команди автентифікації**: Додано `azd auth login` та `azd auth logout` до cheat-sheet.md
- **Недійсні посилання на команди**: Видалено залишки `azd logs` з розділу усунення несправностей у README

#### Примітки
- **Область застосування**: Зміни застосовано до основного README.md та resources/cheat-sheet.md
- **Цільова аудиторія**: Покращення спеціально для розробників, які тільки починають працювати з AZD

---

### [v3.10.0] - 2026-02-05

#### Оновлення точності команд Azure Developer CLI
**Ця версія виправляє неіснуючі команди AZD у всій документації, забезпечуючи валідність усіх прикладів коду з правильним синтаксисом Azure Developer CLI.**

#### Виправлено
- **🔧 Видалені неіснуючі команди AZD**: Комплексний аудит і виправлення недійсних команд:
  - `azd logs` (не існує) → замінено на `azd monitor --logs` або альтернативи Azure CLI
  - підкоманди `azd service` (не існують) → замінено на `azd show` та Azure CLI
  - `azd infra import/export/validate` (не існують) → видалено або замінено на валідні альтернативи
  - прапорці `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не існують) → видалено
  - прапорці `azd provision --what-if/--rollback` (не існують) → оновлено на використання `--preview`
  - `azd config validate` (не існує) → замінено на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не існують) → видалено

- **📚 Оновлені файли з виправленнями команд**:
  - `resources/cheat-sheet.md`: Головне оновлення довідки по командах
  - `docs/deployment/deployment-guide.md`: Виправлені стратегії відкату та розгортання
  - `docs/troubleshooting/debugging.md`: Виправлені розділи аналізу логів
  - `docs/troubleshooting/common-issues.md`: Оновлені команди усунення несправностей
  - `docs/troubleshooting/ai-troubleshooting.md`: Відкориговано секцію дебагінгу AZD
  - `docs/getting-started/azd-basics.md`: Виправлені команди моніторингу
  - `docs/getting-started/first-project.md`: Оновлені приклади моніторингу та налагодження
  - `docs/getting-started/installation.md`: Виправлені приклади допомоги та версії
  - `docs/pre-deployment/application-insights.md`: Відкориговані команди перегляду логів
  - `docs/pre-deployment/coordination-patterns.md`: Виправлені команди дебагінгу агентів

- **📝 Оновлення посилання на версію**: 
  - `docs/getting-started/installation.md`: Змінено жорстко закодовану версію `1.5.0` на загальну `1.x.x` з посиланням на релізи

#### Змінено
- **Стратегії відкату**: Оновлено документацію для використання відкату на основі Git (AZD не має вбудованого відкату)
- **Перегляд логів**: Замінено посилання `azd logs` на `azd monitor --logs`, `azd monitor --live` та команди Azure CLI
- **Розділ продуктивності**: Видалено неіснуючі прапорці паралельного/інкрементного розгортання, запропоновано дійсні альтернативи

#### Технічні деталі
- **Дійсні команди AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Дійсні прапорці azd monitor**: `--live`, `--logs`, `--overview`
- **Видалені функції**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Примітки
- **Перевірка**: Команди перевірено на основі Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершення воркшопу та оновлення якості документації
**Ця версія завершує інтерактивні модулі воркшопу, виправляє усі непрацюючі посилання в документації та покращує загальну якість контенту для AI-розробників, які використовують Microsoft AZD.**

#### Додано
- **📝 CONTRIBUTING.md**: Новий документ з керівництвом з внеску, що містить:
  - Чіткі інструкції щодо повідомлення про проблеми та пропозицій змін
  - Стандарти оформлення документації для нового контенту
  - Керівництво з прикладів коду та конвенції повідомлень комітів
  - Інформація про залучення спільноти

#### Завершено
- **🎯 Модуль воркшопу 7 (Підсумок)**: Повністю завершено підсумковий модуль з:
  - Комплексним резюме досягнень воркшопу
  - Розділом ключових засвоєних концепцій AZD, шаблонів і Microsoft Foundry
  - Рекомендаціями щодо продовження навчання
  - Модульними завданнями воркшопу з оцінкою складності
  - Посиланнями на відгуки спільноти та підтримку

- **📚 Модуль воркшопу 3 (Деконструкція)**: Оновлено цілі навчання з:
  - Активації GitHub Copilot з MCP серверами
  - Розуміння структури папок шаблонів AZD
  - Організаційні схеми Infrastructure-as-Code (Bicep)
  - Інструкції для практичної лабораторії

- **🔧 Модуль воркшопу 6 (Демонтаж)**: Завершено з:
  - Цілями очищення ресурсів та управління витратами
  - Використанням `azd down` для безпечного вивільнення інфраструктури
  - Рекомендаціями щодо відновлення видалених когнітивних сервісів
  - Бонусними завданнями для GitHub Copilot та Azure Portal

#### Виправлено
- **🔗 Виправлення непрацюючих посилань**: Усунено понад 15 непрацюючих внутрішніх посилань у документації:
  - `docs/ai-foundry/ai-model-deployment.md`: Виправлені шляхи до microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Відкориговані шляхи ai-model-deployment.md і production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замінено неіснуючий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Виправлені шляхи FAQ і керівництва усунення несправностей
  - `examples/container-app/microservices/README.md`: Відкориговані шляхи до домашньої сторінки курсу і керівництва розгортання
  - `resources/faq.md` та `resources/glossary.md`: Оновлені посилання на розділи AI
  - `course-outline.md`: Виправлені посилання на керівництво викладача та лабораторії воркшопу AI

- **📅 Банер статусу воркшопу**: Оновлено статус з "У розробці" на активний стан воркшопу з датою лютий 2026

- **🔗 Навігація воркшопу**: Виправлено непрацюючі навігаційні посилання у README.md воркшопу, які вказували на неіснуючу папку lab-1-azd-basics

#### Змінено
- **Презентація воркшопу**: Видалено повідомлення "у розробці", воркшоп тепер завершений і готовий до використання
- **Послідовність навігації**: Забезпечено правильну навігацію між усіма модулями воркшопу
- **Посилання на навчальні шляхи**: Оновлено міжрозділові посилання з правильними шляхами microsoft-foundry

#### Підтверджено
- ✅ Всі англомовні markdown-файли мають дійсні внутрішні посилання
- ✅ Модулі воркшопу 0-7 повністю завершені з наявними навчальними цілями
- ✅ Навігація між розділами та модулями працює коректно
- ✅ Контент підходить для AI-розробників, які використовують Microsoft AZD
- ✅ Збережена дружня до початківців мова та структура
- ✅ CONTRIBUTING.md надає чіткі рекомендації для учасників спільноти

#### Технічна реалізація
- **Перевірка посилань**: Автоматизований скрипт PowerShell перевірив усі внутрішні посилання у .md файлах
- **Аудит контенту**: Ручний перегляд повноти воркшопу та відповідності для початківців
- **Система навігації**: Застосовані послідовні шаблони навігації між розділами та модулями

#### Примітки
- **Область застосування**: Зміни застосовані лише до англомовної документації
- **Переклади**: Папки перекладів не оновлювалися у цій версії (автоматичний переклад буде синхронізовано пізніше)
- **Тривалість воркшопу**: Повний воркшоп тепер забезпечує 3-4 години практичного навчання

---

### [v3.8.0] - 2025-11-19

#### Розширена документація: Моніторинг, Безпека та Мультиагентські патерни
**Ця версія додає комплексні уроки рівня А з інтеграції Application Insights, патернів автентифікації та координації мультиагентів для виробничих розгортань.**

#### Додано
- **📊 Урок інтеграції Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - Розгортання з фокусом на AZD з автоматичним провізіонінгом
  - Повні шаблони Bicep для Application Insights + Log Analytics
  - Робочі Python-застосунки з кастомною телеметрією (понад 1200 рядків)
  - Патерни моніторингу AI/LLM (відстеження токенів/вартості Microsoft Foundry Models)
  - 6 діаграм Mermaid (архітектура, розподілене трасування, потік телеметрії)
  - 3 практичні вправи (сповіщення, інформаційні панелі, AI-моніторинг)
  - Приклади Kusto-запитів та стратегії оптимізації витрат
  - Потік живих метрик і налагодження в режимі реального часу
  - Час навчання 40-50 хвилин з виробничими патернами

- **🔐 Урок патернів автентифікації та безпеки**: у `docs/getting-started/authsecurity.md`:
  - 3 патерни автентифікації (рядки з'єднання, Key Vault, керована ідентичність)
  - Повні шаблони інфраструктури Bicep для безпечних розгортань
  - Код Node.js-застосунку з інтеграцією Azure SDK
  - 3 повні вправи (увімкнення керованої ідентичності, користувацької ідентичності, ротація Key Vault)
  - Кращі практики безпеки і налаштування RBAC
  - Керівництво з усунення несправностей та аналіз вартості
  - Готові до виробництва патерни автентифікації без паролів

- **🤖 Урок мультиагентської координації**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 патернів координації (послідовна, паралельна, ієрархічна, подієва, консенсус)
  - Повна реалізація сервісу оркестратора (Python/Flask, понад 1500 рядків)
  - 3 спеціалізовані агентські реалізації (Дослідник, Автор, Редактор)
  - Інтеграція Service Bus для чергування повідомлень
  - Управління станами в Cosmos DB для розподілених систем
  - 6 діаграм Mermaid, що демонструють взаємодії агентів
  - 3 просунуті вправи (обробка таймаутів, логіка повторів, circuit breaker)
  - Аналіз витрат ($240-565 на місяць) із стратегіями оптимізації
  - Інтеграція з Application Insights для моніторингу

#### Поліпшено
- **Розділ перед розгортанням**: Тепер включає комплексні патерни моніторингу і координації
- **Розділ початку роботи**: Покращено професійними патернами автентифікації
- **Готовність до виробництва**: Повне покриття від безпеки до спостережності
- **Структура курсу**: Оновлено з посиланнями на нові уроки у Розділах 3 та 6

#### Змінено
- **Прогрес навчання**: Краща інтеграція безпеки та моніторингу по всьому курсу
- **Якість документації**: Послідовні стандарти рівня А (95-97%) у нових уроках
- **Виробничі патерни**: Повне покриття від початку до кінця для корпоративних розгортань

#### Покращено
- **Досвід розробника**: Чіткий шлях від розробки до виробничого моніторингу
- **Стандарти безпеки**: Професійні патерни автентифікації і керування секретами
- **Спостережність**: Повна інтеграція Application Insights з AZD
- **Навантаження AI**: Спеціалізований моніторинг моделей Microsoft Foundry та мультиагентських систем

#### Підтверджено
- ✅ Всі уроки містять повний робочий код (не уривки)
- ✅ Діаграми Mermaid для візуального навчання (19 загалом у 3 уроках)
- ✅ Практичні вправи з кроками перевірки (9 загалом)
- ✅ Виробничі шаблони Bicep, які можна розгорнути через `azd up`
- ✅ Аналіз витрат та стратегії оптимізації
- ✅ Керівництва з усунення несправностей та кращі практики
- ✅ Контрольні пункти знань із командами перевірки

#### Результати оцінки документації
- **docs/pre-deployment/application-insights.md**: - Комплексне керівництво з моніторингу
- **docs/getting-started/authsecurity.md**: - Професійні патерни безпеки
- **docs/pre-deployment/coordination-patterns.md**: - Просунуті архітектури мультиагентів
- **Загальний новий контент**: - Послідовні високоякісні стандарти

#### Технічна реалізація
- **Application Insights**: Log Analytics + кастомна телеметрія + розподілене трасування
- **Автентифікація**: Керована ідентичність + Key Vault + патерни RBAC
- **Мультиагент**: Service Bus + Cosmos DB + Container Apps + оркестрація
- **Моніторинг**: Живі метрики + Kusto-запити + сповіщення + інформаційні панелі
- **Управління витратами**: Стратегії вибіркового збирання, політики утримання, контролі бюджету

### [v3.7.0] - 2025-11-19

#### Покращення якості документації та новий приклад Microsoft Foundry Models
**Ця версія покращує якість документації в репозиторії та додає повний приклад розгортання Microsoft Foundry Models з чат-інтерфейсом gpt-4.1.**

#### Додано
- **🤖 Приклад чату Microsoft Foundry Models**: Повне розгортання gpt-4.1 з робочою реалізацією у `examples/azure-openai-chat/`:
  - Повна інфраструктура Microsoft Foundry Models (розгортання моделі gpt-4.1)
  - Python-інтерфейс командного рядка для чату з історією розмови
  - Інтеграція з Key Vault для безпечного зберігання API-ключів
  - Відстеження використання токенів та оцінка вартості
  - Обмеження швидкості та обробка помилок
  - Вичерпний README з 35–45-хвилинним керівництвом з розгортання
  - 11 файлів, готових до виробництва (шаблони Bicep, Python-застосунок, конфігурації)
- **📚 Вправи з документації**: Додані практичні вправи до керівництва з конфігурації:
  - Вправа 1: Конфігурація для кількох середовищ (15 хвилин)
  - Вправа 2: Практика керування секретами (10 хвилин)
  - Чіткі критерії успішності та кроки перевірки
- **✅ Перевірка розгортання**: Додано розділ перевірки у керівництво розгортання:
  - Процедури перевірки стану
  - Контрольний список критеріїв успіху
  - Очікувані результати для всіх команд розгортання
  - Короткі посібники з усунення несправностей

#### Поліпшено
- **examples/README.md**: Оновлено до якості рівня А (93%):
  - Додано azure-openai-chat до усіх відповідних розділів
  - Оновлено кількість локальних прикладів з 3 до 4
  - Додано до таблиці прикладів AI-застосунків
  - Інтегровано у Quick Start для користувачів середнього рівня
  - Додано до розділу шаблонів Microsoft Foundry
  - Оновлено матрицю порівняння та розділи пошуку технологій
- **Якість документації**: Покращено з B+ (87%) до A- (92%) у папці docs:

  - Додано очікувані результати до прикладів критичних команд
  - Включено кроки перевірки змін конфігурації
  - Покращено практичне навчання з практичними вправами

#### Зміни
- **Прогрес навчання**: Краще інтегровано приклади ШІ для середнього рівня
- **Структура документації**: Більше практичних вправ з чіткими результатами
- **Процес перевірки**: Додано явні критерії успіху для ключових робочих процесів

#### Покращення
- **Досвід розробника**: Розгортання Microsoft Foundry Models тепер займає 35-45 хвилин (проти 60-90 хвилин для складних альтернатив)
- **Прозорість витрат**: Чіткі оцінки вартості ($50-200/місяць) для прикладу Microsoft Foundry Models
- **Шлях навчання**: Розробники ШІ мають чітку точку входу з azure-openai-chat
- **Стандарти документації**: Послідовні очікувані результати та кроки перевірки

#### Валідація
- ✅ Приклад Microsoft Foundry Models повністю функціональний з `azd up`
- ✅ Всі 11 файлів реалізації синтаксично коректні
- ✅ Інструкції README відповідають фактичному досвіду розгортання
- ✅ Посилання в документації оновлено у понад 8 місцях
- ✅ Індекс прикладів точно відображає 4 локальних приклади
- ✅ Відсутні дублікати зовнішніх посилань у таблицях
- ✅ Всі навігаційні посилання коректні

#### Технічна реалізація
- **Архітектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + шаблон Container Apps
- **Безпека**: Підтримка Managed Identity, секрети в Key Vault
- **Моніторинг**: Інтеграція Application Insights
- **Управління витратами**: Відстеження токенів та оптимізація використання
- **Розгортання**: Одинарна команда `azd up` для повного налаштування

### [v3.6.0] - 2025-11-19

#### Головне оновлення: Приклади розгортання Container App
**Ця версія вводить комплексні, готові до продакшену приклади розгортання контейнерних додатків з використанням Azure Developer CLI (AZD), повну документацію та інтеграцію в навчальний шлях.**

#### Додано
- **🚀 Приклади Container App**: Нові локальні приклади в `examples/container-app/`:
  - [Головний посібник](examples/container-app/README.md): Повний огляд контейнеризованих розгортань, швидкий старт, продакшен та розвинуті шаблони
  - [Простий Flask API](../../examples/container-app/simple-flask-api): REST API для початківців з масштабуванням до нуля, health probes, моніторингом і налагодженням
  - [Архітектура мікросервісів](../../examples/container-app/microservices): Продакшен-готове багатосервісне розгортання (API Gateway, Product, Order, User, Notification), асинхронні повідомлення, Service Bus, Cosmos DB, Azure SQL, розподілене трасування, blue-green/canary deployment
- **Кращі практики**: Безпека, моніторинг, оптимізація витрат і керівництво по CI/CD для контейнеризованих навантажень
- **Приклади коду**: Повний `azure.yaml`, шаблони Bicep та реалізації сервісів на кількох мовах (Python, Node.js, C#, Go)
- **Тестування та налагодження**: Сценарії end-to-end тестування, команди для моніторингу, керівництво з налагодження

#### Зміни
- **README.md**: Оновлено для показу та зв’язку нових прикладів container app у розділі "Локальні приклади - контейнерні додатки"
- **examples/README.md**: Оновлено для висвітлення прикладів container app, додано записи матриці порівнянь та оновлено посилання на технології/архітектуру
- **План курсу та посібник для вивчення**: Оновлено для посилань на нові приклади container app та шаблони розгортання в відповідних розділах

#### Валідація
- ✅ Всі нові приклади розгортаються за допомогою `azd up` і відповідають кращим практикам
- ✅ Оновлені крос-посилання документації та навігація
- ✅ Приклади охоплюють сценарії від початкового до продвинутого рівня, включно з продакшен-мікросервісами

#### Примітки
- **Обсяг**: Лише англомовна документація та приклади
- **Наступні кроки**: Розширення додатковими просунутими шаблонами контейнерів та CI/CD автоматизацією у майбутніх релізах

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукту: Microsoft Foundry
**У цій версії реалізовано комплексну зміну назви продукту з "Microsoft Foundry" на "Microsoft Foundry" по всій англомовній документації, що відображає офіційний ребрендинг Microsoft.**

#### Зміни
- **🔄 Оновлення назви продукту**: Повний ребрендинг з "Microsoft Foundry" на "Microsoft Foundry"
  - Оновлені всі посилання в англомовній документації у папці `docs/`
  - Перейменовано папку: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Перейменовано файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Загалом оновлено 23 посилання в 7 файлах документації

- **📁 Зміни структури папок**:
  - `docs/ai-foundry/` перейменовано на `docs/microsoft-foundry/`
  - Усі крос-посилання оновлено відповідно до нової структури папок
  - Навігаційні посилання перевірені по всій документації

- **📄 Перейменування файлів**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Усі внутрішні посилання оновлені на нову назву файлу

#### Оновлені файли
- **Документація розділів** (7 файлів):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 оновлення навігаційних посилань
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 оновлення посилань на назву продукту
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вже використовує Microsoft Foundry (з попередніх оновлень)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 оновлення посилань (огляд, відгуки спільноти, документація)
  - `docs/getting-started/azd-basics.md` - 4 оновлення крос-посилань
  - `docs/getting-started/first-project.md` - 2 оновлення навігаційних посилань розділів
  - `docs/getting-started/installation.md` - 2 оновлення посилань на наступний розділ
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 оновлення посилань (навігація, спільнота Discord)
  - `docs/troubleshooting/common-issues.md` - 1 оновлення навігаційного посилання
  - `docs/troubleshooting/debugging.md` - 1 оновлення навігаційного посилання

- **Файли структури курсу** (2 файли):
  - `README.md` - 17 оновлень посилань (огляд курсу, заголовки розділів, секція шаблонів, інсайти спільноти)
  - `course-outline.md` - 14 оновлень посилань (огляд, цілі навчання, ресурси розділів)

#### Валідація
- ✅ Із англомовної документації вилучено всі залишкові посилання на папку "ai-foundry"
- ✅ Вилучено всі залишкові посилання на продукт "Microsoft Foundry" в англомовній документації
- ✅ Всі навігаційні посилання працюють із новою структурою папок
- ✅ Успішно виконано перейменування файлів і папок
- ✅ Перевірено крос-посилання між розділами

#### Примітки
- **Обсяг**: Зміни застосовані лише до англомовної документації у папці `docs/`
- **Переклади**: Папки з перекладами (`translations/`) не оновлювалися у цій версії
- **Матеріали воркшопу**: Матеріали `workshop/` не оновлювалися у цій версії
- **Приклади**: Приклади можуть містити посилання на застарілі назви (виправлено у майбутніх оновленнях)
- **Зовнішні посилання**: Зовнішні URL-адреси та посилання на репозиторій GitHub залишилися незмінними

#### Посібник з міграції для контрибуторів
Якщо у вас є локальні гілки або документація з посиланнями на стару структуру:
1. Оновіть посилання папок: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Оновіть посилання файлів: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замініть назву продукту: "Microsoft Foundry" → "Microsoft Foundry"
4. Перевірте, чи всі внутрішні посилання документації працюють

---

### [v3.4.0] - 2025-10-24

#### Поліпшення попереднього перегляду інфраструктури та валідації
**Ця версія вводить повноцінну підтримку нової функції перегляду інфраструктури в Azure Developer CLI, а також покращує досвід користувачів воркшопу.**

#### Додано
- **🧪 Документація функції azd provision --preview**: Повне висвітлення нової можливості попереднього перегляду інфраструктури
  - Справочник команд та приклади використання у шпаргалці
  - Детальна інтеграція у посібнику з розгортання з кейсами використання та вигодами
  - Інтеграція попередньої перевірки для безпечнішої валідації розгортання
  - Оновлення посібника зі старту з практиками безпечного розгортання
- **🚧 Банер статусу воркшопу**: Професійний HTML-банер, що відображає статус розробки воркшопу
  - Градієнтний дизайн із індикаторами будівництва для чіткої комунікації з користувачем
  - Таймстемп останнього оновлення для прозорості
  - Адаптивний дизайн для мобільних пристроїв

#### Покращено
- **Безпека інфраструктури**: Функція попереднього перегляду інтегрована у всі документи про розгортання
- **Перевірка до розгортання**: Автоматизовані скрипти тепер включають тестування попереднього перегляду інфраструктури
- **Робочий процес розробника**: Оновлені послідовності команд із включенням перегляду як найкращої практики
- **Досвід воркшопу**: Користувачам чітко повідомляється про статус розробки контенту

#### Зміни
- **Кращі практики розгортання**: Рекомендовано підхід із пріоритетом перегляду
- **Потік документації**: Валідація інфраструктури переміщена на ранні етапи навчання
- **Презентація воркшопу**: Професійна комунікація статусу з чітким графіком розробки

#### Покращено
- **Підхід із пріоритетом безпеки**: Зміни інфраструктури можна перевіряти до розгортання
- **Спільна робота команди**: Результати попереднього перегляду можна ділити для перегляду та затвердження
- **Обізнаність про витрати**: Кращий розуміння витрат на ресурси до розгортання
- **Зменшення ризиків**: Зниження кількості помилок розгортання завдяки попередній валідації

#### Технічна реалізація
- **Інтеграція у кількох документах**: Опис функції перегляду у 4 ключових файлах
- **Шаблони команд**: Послідовний синтаксис і приклади у документації
- **Інтеграція кращих практик**: Перегляд включено в робочі процеси валідації та скрипти
- **Візуальні індикатори**: Чіткі позначки НОВОЇ функції для кращої виявності

#### Інфраструктура воркшопу
- **Комунікація статусу**: Професійний HTML-банер з градієнтним стилем
- **Досвід користувача**: Чітке інформування про статус розробки запобігає непорозумінням
- **Професійна презентація**: Підтримка довіри до репозиторію та встановлення очікувань
- **Прозорість графіку**: Таймстемп останнього оновлення в жовтні 2025 року для відповідальності

### [v3.3.0] - 2025-09-24

#### Розширені матеріали воркшопу та інтерактивний навчальний досвід
**Ця версія представляє комплексні матеріали воркшопу з браузерною інтерактивною навігацією та структурованими навчальними шляхами.**

#### Додано
- **🎥 Інтерактивний посібник воркшопу**: Браузерний досвід воркшопу з можливістю перегляду в MkDocs
- **📝 Структуровані інструкції воркшопу**: 7-кроковий спрямований навчальний шлях від відкриття до налаштування
  - 0-Вступ: Огляд воркшопу та налаштування
  - 1-Вибір AI-шаблону: Процес відкриття та вибору шаблону
  - 2-Валідація AI-шаблону: Процедури розгортання та перевірки
  - 3-Розбір AI-шаблону: Розуміння архітектури шаблону
  - 4-Конфігурація AI-шаблону: Налаштування та кастомізація
  - 5-Індивідуалізація AI-шаблону: Просунуті модифікації та ітерації
  - 6-Зупинка інфраструктури: Очищення та управління ресурсами
  - 7-Завершення: Резюме та подальші кроки
- **🛠️ Інструменти воркшопу**: Конфігурація MkDocs з темою Material для покращеного досвіду навчання
- **🎯 Практичний навчальний шлях**: 3-крокова методологія (Відкриття → Розгортання → Кастомізація)
- **📱 Інтеграція GitHub Codespaces**: Безшовне налаштування середовища розробки

#### Покращено
- **Лабораторія AI воркшопу**: Розширена комплексним структурованим навчальним досвідом тривалістю 2-3 години
- **Документація воркшопу**: Професійна презентація з навігацією та візуальними допоміжними елементами
- **Прогрес навчання**: Чітке покрокове керівництво від вибору шаблону до розгортання у продакшені
- **Досвід розробника**: Інтегровані інструменти для оптимізації робочих процесів розробки

#### Покращено
- **Доступність**: Браузерний інтерфейс з функцією пошуку, копіювання та перемикання теми
- **Навчання у власному темпі**: Гнучка структура воркшопу для різних темпів навчання
- **Практичне застосування**: Реальні сценарії розгортання AI-шаблонів
- **Інтеграція спільноти**: Інтеграція Discord для підтримки та співпраці воркшопу

#### Особливості воркшопу
- **Вбудований пошук**: Швидке знаходження ключових слів і уроків
- **Копіювання блоків коду**: Функція hover-to-copy для всіх прикладів коду
- **Перемикання теми**: Підтримка темного/світлого режимів для різних вподобань
- **Візуальні матеріали**: Скриншоти і діаграми для покращення розуміння
- **Інтеграція довідки**: Прямий доступ до підтримки у Discord

### [v3.2.0] - 2025-09-17

#### Основна реструктуризація навігації та система навчання за розділами
**Ця версія вводить комплексну структуру навчання за розділами з покращеною навігацією по всьому репозиторію.**

#### Додано
- **📚 Система навчання за розділами**: Повна реструктуризація курсу на 8 прогресивних навчальних розділів
  - Розділ 1: Фундаменти та швидкий старт (⭐ - 30-45 хв)
  - Розділ 2: AI-перший розвиток (⭐⭐ - 1-2 години)
  - Розділ 3: Конфігурація та автентифікація (⭐⭐ - 45-60 хв)
  - Розділ 4: Інфраструктура як код та розгортання (⭐⭐⭐ - 1-1.5 год)
  - Розділ 5: Багатоагентні AI-рішення (⭐⭐⭐⭐ - 2-3 години)
  - Розділ 6: Валідація та планування перед розгортанням (⭐⭐ - 1 година)
  - Розділ 7: Виправлення неполадок та налагодження (⭐⭐ - 1-1.5 год)
  - Розділ 8: Продакшен та корпоративні шаблони (⭐⭐⭐⭐ - 2-3 години)
- **📚 Комплексна навігаційна система**: Послідовні заголовки та підвали навігації у всій документації
- **🎯 Відстеження прогресу**: Чек-лист завершення курсу та система перевірки навчання
- **🗺️ Керівництво навчальним шляхом**: Чіткі точки входу для різних рівнів досвіду та цілей
- **🔗 Навігація з крос-посиланнями**: Пов’язання суміжних розділів та передумов

#### Покращено
- **Структура README**: Перетворено на структуровану навчальну платформу з організацією за розділами
- **Навігація у документації**: Кожна сторінка тепер містить контекст розділу та орієнтир прогресу
- **Організація шаблонів**: Приклади та шаблони відображені відповідно до навчальних розділів

- **Інтеграція ресурсів**: Шпаргалки, FAQ та посібники, пов’язані з відповідними розділами
- **Інтеграція майстерень**: Практичні лабораторні роботи, пов’язані з кількома навчальними цілями розділів

#### Змінено
- **Прогрес навчання**: Перехід від лінійної документації до гнучкого навчання за розділами
- **Розташування конфігурації**: Переміщено посібник із конфігурації на Розділ 3 для кращого навчального потоку
- **Інтеграція AI-контенту**: Покращена інтеграція специфічного для ШІ контенту протягом усього навчального процесу
- **Продуктивний контент**: Розширені шаблони зібрані в Розділі 8 для корпоративних користувачів

#### Покращено
- **Користувацький досвід**: Чіткі навігаційні хлібні крихти та індикатори прогресу розділів
- **Доступність**: Послідовні навігаційні шаблони для легшого проходження курсу
- **Професійна презентація**: Структура курсу в стилі університету, придатна для академічного та корпоративного навчання
- **Ефективність навчання**: Скорочено час на пошук релевантного контенту завдяки покращеній організації

#### Технічна реалізація
- **Навігаційні заголовки**: Стандартизована навігація по розділах у більш ніж 40 файлах документації
- **Навігація у футері**: Послідовне керівництво прогресом та індикатори завершення розділів
- **Внутрішні посилання**: Комплексна система внутрішніх посилань, що з’єднує пов’язані концепції
- **Відповідність розділів**: Шаблони та приклади чітко пов’язані з навчальними цілями

#### Покращення посібника з навчання
- **📚 Комплексні навчальні цілі**: Перебудований посібник для відповідності системі з 8 розділів
- **🎯 Оцінювання за розділами**: Кожен розділ включає конкретні навчальні цілі та практичні вправи
- **📋 Відстеження прогресу**: Щотижневий графік навчання з вимірюваними результатами та чек-листами завершення
- **❓ Питання для оцінювання**: Питання для перевірки знань для кожного розділу з професійними наслідками
- **🛠️ Практичні вправи**: Практичні заняття з реальними сценаріями розгортання та усунення неполадок
- **📊 Прогрес навичок**: Ясний розвиток від базових понять до корпоративних шаблонів із фокусом на кар’єрний ріст
- **🎓 Рамки сертифікації**: Професійні результати розвитку та система визнання у спільноті
- **⏱️ Управління графіком**: Структурований 10-тижневий план навчання з підтвердженням ключових етапів

### [v3.1.0] - 2025-09-17

#### Покращені багатокористувацькі рішення AI
**Ця версія вдосконалює багатокористувацьке роздрібне рішення з кращим найменуванням агентів і розширеною документацією.**

#### Змінено
- **Термінологія багатокористувацьких агентів**: Замінили "Cora agent" на "Customer agent" у всьому багатокористувацькому роздрібному рішенні для кращого розуміння
- **Архітектура агента**: Оновлено всю документацію, ARM шаблони та приклади коду для узгодженого найменування "Customer agent"
- **Приклади конфігурацій**: Модернізовані шаблони налаштувань агентів із оновленими конвенціями іменування
- **Координованість документації**: Забезпечено використання професійних, описових найменувань агентів у всіх посиланнях

#### Покращено
- **Пакет ARM шаблонів**: Оновлено retail-multiagent-arm-template з посиланнями на Customer agent
- **Архітектурні діаграми**: Оновлено Mermaid діаграми з оновленим найменуванням агентів
- **Приклади коду**: Python класи та приклади реалізації використовують найменування CustomerAgent
- **Змінні середовища**: Оновлено всі скрипти розгортання згідно з конвенціям CUSTOMER_AGENT_NAME

#### Покращено
- **Досвід розробника**: Чіткіше визначені ролі та обов’язки агентів у документації
- **Готовність до виробництва**: Краща відповідність корпоративним конвенціям найменування
- **Навчальні матеріали**: Інтуїтивне найменування агентів для освітніх цілей
- **Зрозумілість шаблонів**: Спрощене розуміння функцій агента та шаблонів розгортання

#### Технічні деталі
- Оновлено архітектурні діаграми Mermaid з посиланнями на CustomerAgent
- Замінено імена класів CoraAgent на CustomerAgent у прикладах Python
- Модифіковано JSON конфігурації ARM шаблонів для використання типу агента "customer"
- Оновлено змінні середовища з CORA_AGENT_* на CUSTOMER_AGENT_*
- Оновлено всі команди розгортання та налаштування контейнерів

### [v3.0.0] - 2025-09-12

#### Головні зміни - Орієнтація на розробників AI та інтеграція Microsoft Foundry
**Ця версія перетворює репозиторій на комплексний навчальний ресурс з орієнтацією на AI із інтеграцією Microsoft Foundry.**

#### Додано
- **🤖 Пріоритетний шлях навчання для AI**: Повна перебудова з пріоритетом на розробників та інженерів ШІ
- **Посібник з інтеграції Microsoft Foundry**: Комплексна документація для підключення AZD до сервісів Microsoft Foundry
- **Шаблони розгортання моделей AI**: Детальний посібник із вибору моделі, конфігурації та стратегій розгортання в продакшн
- **Майстерня по AI**: 2-3 годинний практичний воркшоп зі створення AI-застосунків, готових до розгортання AZD
- **Кращі практики для AI у продакшн**: Шаблони корпоративного рівня для масштабування, моніторингу та захисту AI-навантажень
- **Посібник з усунення неполадок AI**: Комплексне усунення неполадок для Microsoft Foundry Models, Cognitive Services і проблем розгортання AI
- **Галерея шаблонів AI**: Вибрані Microsoft Foundry шаблони з рейтингом складності
- **Матеріали для воркшопів**: Повна структура майстерні з практичними лабораторними та референсними матеріалами

#### Покращено
- **Структура README**: Орієнтована на розробників AI з 45% даними про інтереси спільноти з Microsoft Foundry Discord
- **Навчальні шляхи**: Виділена траєкторія AI-розробника поряд з традиційними шляхами для студентів та DevOps інженерів
- **Рекомендації шаблонів**: Вибрані AI-шаблони включно з azure-search-openai-demo, contoso-chat і openai-chat-app-quickstart
- **Інтеграція спільноти**: Покращена підтримка спільноти в Discord з AI-каналами та обговореннями

#### Безпека та орієнтація на продакшн
- **Патерни керованих ідентичностей**: Специфічні для AI налаштування аутентифікації та безпеки
- **Оптимізація вартості**: Відстеження використання токенів та контроль бюджету для AI-навантажень
- **Розгортання в кількох регіонах**: Стратегії глобального розгортання AI-застосунків
- **Моніторинг продуктивності**: Метрики, специфічні для AI, та інтеграція з Application Insights

#### Якість документації
- **Лінійна структура курсу**: Логічний прогрес від новачка до просунутих патернів розгортання AI
- **Перевірені URL**: Всі зовнішні посилання на репозиторії верифіковані та доступні
- **Повний довідник**: Всі внутрішні посилання в документації перевірені та працездатні
- **Готовність до продакшн**: Корпоративні шаблони розгортання з реальними прикладами

### [v2.0.0] - 2025-09-09

#### Головні зміни - Реструктуризація репозиторію та професійне покращення
**Ця версія представляє суттєвий капітальний ремонт структури репозиторію та презентації контенту.**

#### Додано
- **Структурована навчальна основа**: На всіх сторінках документації додано розділи Вступ, Цілі навчання та Результати навчання
- **Навігаційна система**: Додано посилання на Попередній/Наступний урок у всій документації для спрямованого навчання
- **Посібник для навчання**: Комплексний study-guide.md з навчальними цілями, практичними вправами та матеріалами для оцінювання
- **Професійна подача**: Видалено всі емодзі для покращення доступності та професійного вигляду
- **Покращена структура контенту**: Краща організація та послідовність навчальних матеріалів

#### Змінено
- **Формат документації**: Стандартизовано всю документацію з уніфікованою структурою, орієнтованою на навчання
- **Навігаційний потік**: Реалізовано логічний порядок проходження навчальних матеріалів
- **Подача контенту**: Видалено декоративні елементи на користь чіткої, професійної форматування
- **Структура посилань**: Оновлено всі внутрішні посилання для підтримки нової навігаційної системи

#### Покращено
- **Доступність**: Видалено залежності від емодзі для кращої сумісності з екранами зчитування
- **Професійний вигляд**: Чисте, академічне оформлення, придатне для корпоративного навчання
- **Навчальний досвід**: Структурований підхід із чіткими цілями та результатами для кожного уроку
- **Організація контенту**: Кращий логічний потік і зв’язок між пов’язаними темами

### [v1.0.0] - 2025-09-09

#### Початковий реліз - Комплексний репозиторій для навчання AZD

#### Додано
- **Основна структура документації**
  - Повний серіал керівництв для початку роботи
  - Всеосяжна документація з розгортання та підготовки
  - Детальні ресурси з усунення несправностей та налагодження
  - Інструменти та процедури перевірки перед розгортанням

- **Модуль початку роботи**
  - Основи AZD: базові поняття та термінологія
  - Посібник з встановлення: інструкції для різних платформ
  - Посібник з налаштування: підготовка середовища та аутентифікація
  - Перший проект: покрокове практичне навчання

- **Модуль розгортання та підготовки**
  - Посібник розгортання: повний робочий процес
  - Посібник з підготовки: інфраструктура як код із Bicep
  - Кращі практики для продакшн-розгортань
  - Шаблони архітектури з багатьма сервісами

- **Модуль перевірки перед розгортанням**
  - Планування потужностей: перевірка доступності ресурсів Azure
  - Вибір SKU: докладні рекомендації по рівнях обслуговування
  - Перевірки перед польотом: автоматизовані скрипти перевірки (PowerShell і Bash)
  - Інструменти оцінки вартості та планування бюджету

- **Модуль усунення несправностей**
  - Часті проблеми: типові проблеми та їх рішення
  - Посібник з налагодження: систематичні методи усунення несправностей
  - Розширені діагностичні методи та інструменти
  - Моніторинг продуктивності та оптимізація

- **Ресурси та довідники**
  - Шпаргалка з команд: швидкі посилання на основні команди
  - Глосарій: розгорнуті визначення терміносистем і акронімів
  - FAQ: детальні відповіді на поширені запитання
  - Зовнішні посилання та зв’язки зі спільнотою

- **Приклади та шаблони**
  - Приклад простої веб-програми
  - Шаблон розгортання статичного сайту
  - Конфігурація контейнерних додатків
  - Шаблони інтеграції баз даних
  - Приклади архітектури мікросервісів
  - Реалізації безсерверних функцій

#### Особливості
- **Підтримка множинних платформ**: Посібники з встановлення та налаштування для Windows, macOS і Linux
- **Різні рівні навичок**: Контент для студентів і професійних розробників
- **Практичний фокус**: Практичні приклади та реальні сценарії
- **Всеосяжне покриття**: Від базових концепцій до просунутих корпоративних шаблонів
- **Безпека в пріоритеті**: Вбудовані кращі практики безпеки
- **Оптимізація вартості**: Рекомендації для економного розгортання та управління ресурсами

#### Якість документації
- **Детальні приклади коду**: Практичні, протестовані зразки коду
- **Покрокові інструкції**: Чіткі, виконувані рекомендації
- **Всеохопне оброблення помилок**: Усунення несправностей для типових проблем
- **Інтеграція кращих практик**: Галузеві стандарти та рекомендації
- **Сумісність версій**: Актуально з останніми сервісами Azure та можливостями azd

## Плановані майбутні покращення

### Версія 3.1.0 (планується)
#### Розширення платформи AI
- **Підтримка багатьох моделей**: Шаблони інтеграції для Hugging Face, Azure Machine Learning та власних моделей
- **Фреймворки AI-агентів**: Шаблони для LangChain, Semantic Kernel і AutoGen
- **Розширені патерни RAG**: Векторні бази даних поза Azure AI Search (Pinecone, Weaviate тощо)
- **Обсервабельність AI**: Покращений моніторинг продуктивності моделі, використання токенів і якості відповідей

#### Досвід розробника
- **Розширення VS Code**: Інтегрований досвід розробки AZD + Microsoft Foundry
- **Інтеграція GitHub Copilot**: Допомога штучного інтелекту у створенні шаблонів AZD
- **Інтерактивні туторіали**: Практичні вправи з автоматичною перевіркою для AI-сценаріїв
- **Відеоконтент**: Допоміжні відеоуроки для візуальних студентів, орієнтовані на розгортання AI

### Версія 4.0.0 (планується)
#### Корпоративні AI-патерни
- **Рамки управління**: Керування AI-моделями, відповідність вимогам і аудиторські сліди
- **Багатокористувацький AI**: Шаблони для обслуговування кількох клієнтів із ізольованими AI-сервісами
- **Розгортання AI на периферії**: Інтеграція з Azure IoT Edge та контейнерними інстанціями
- **Гібридний хмарний AI**: Шаблони мультихмарного та гібридного розгортання AI-навантажень

#### Розширені функції
- **Автоматизація AI-процесу**: Інтеграція MLOps з пайплайнами Azure Machine Learning
- **Покращена безпека**: Патерни з нульовою довірою, приватні кінцеві точки та розширений захист від загроз
- **Оптимізація продуктивності**: Просунуті стратегії налаштування та масштабування для високопродуктивних AI-застосунків
- **Глобальний розподіл**: Шаблони доставки контенту та кешування на периферії для AI-застосунків

### Версія 3.0.0 (планується) - замінено поточним релізом
#### Пропоновані доповнення - Реалізовано у v3.0.0
- ✅ **Контент, орієнтований на AI**: Комплексна інтеграція Microsoft Foundry (завершено)
- ✅ **Інтерактивні туторіали**: Майстерня практики AI (завершено)
- ✅ **Розширений модуль безпеки**: Специфічні для AI патерни безпеки (завершено)
- ✅ **Оптимізація продуктивності**: Стратегії налаштування AI-навантажень (завершено)

### Версія 2.1.0 (планується) - частково реалізовано у v3.0.0
#### Невеликі покращення - частково завершені у поточному релізі
- ✅ **Додаткові приклади**: сценарії розгортання AI (завершено)
- ✅ **Розширене FAQ**: AI-специфічні питання та усунення несправностей (завершено)
- **Інтеграція інструментів**: покращені інструкції з IDE та редакторів
- ✅ **Розширення моніторингу**: шаблони моніторингу і сповіщень для AI (завершено)

#### Планується для майбутнього релізу
- **Документація для мобільних пристроїв**: адаптивний дизайн для мобільного навчання
- **Офлайн-доступ**: завантажувані пакети документації
- **Розширена інтеграція IDE**: Розширення VS Code для AZD + AI робочих процесів
- **Дашборд спільноти**: метрики спільноти в режимі реального часу та відстеження внесків

## Участь у формуванні журналу змін

### Повідомлення про зміни
При внесенні змін до цього репозиторію, будь ласка, переконайтеся, що записи в журналі змін містять:

1. **Номер версії**: відповідно до семантичного версіонування (major.minor.patch)
2. **Дата**: дата випуску або оновлення у форматі YYYY-MM-DD
3. **Категорія**: додано, змінено, застаріло, вилучено, виправлено, безпека
4. **Чіткий опис**: лаконічний опис внесених змін
5. **Оцінка впливу**: як зміни впливають на існуючих користувачів

### Категорії змін

#### Додано
- Нові функції, розділи документації або можливості
- Нові приклади, шаблони або навчальні ресурси
- Додаткові інструменти, скрипти або утиліти

#### Змінено
- Модифікації існуючої функціональності або документації
- Оновлення для покращення чіткості або точності
- Перебудова контенту або організації

#### Застаріло
- Функції або підходи, що поступово виводяться з експлуатації
- Розділи документації, заплановані до вилучення
- Методи, які мають кращі альтернативи

#### Вилучено
- Функції, документація або приклади, що більше не актуальні
- Застаріла інформація або застарілі підходи
- Надлишковий або консолідований контент

#### Виправлено
- Виправлення помилок у документації або коді
- Усунення зазначених проблем
- Покращення точності або функціональності


#### Безпека
- Покращення або виправлення, пов’язані з безпекою
- Оновлення щодо найкращих практик безпеки
- Вирішення вразливостей безпеки

### Керівництво з семантичного версіонування

#### Основна версія (X.0.0)
- Несумісні зміни, які потребують дій користувача
- Значна реструктуризація змісту або організації
- Зміни, що змінюють основний підхід або методологію

#### Мінорна версія (X.Y.0)
- Нові функції або додавання вмісту
- Покращення, що підтримують сумісність із попередніми версіями
- Додаткові приклади, інструменти чи ресурси

#### Патч-версія (X.Y.Z)
- Виправлення помилок і корекції
- Невеликі покращення існуючого вмісту
- Уточнення та дрібні поліпшення

## Відгуки та пропозиції спільноти

Ми активно заохочуємо відгуки спільноти для покращення цього навчального ресурсу:

### Як надати відгук
- **GitHub Issues**: Повідомляйте про проблеми або пропонуйте покращення (особливо з AI)
- **Discord Discussions**: Діліться ідеями та спілкуйтеся з спільнотою Microsoft Foundry
- **Pull Requests**: Вносіть безпосередні покращення до контенту, особливо AI-шаблонів і посібників
- **Microsoft Foundry Discord**: Беріть участь у каналі #Azure для обговорень AZD + AI
- **Community Forums**: Беріть участь у ширших дискусіях для розробників Azure

### Категорії відгуків
- **Точність контенту AI**: Виправлення інформації щодо інтеграції та розгортання AI-сервісів
- **Навчальний досвід**: Пропозиції для покращення процесу навчання розробників AI
- **Відсутній контент AI**: Запити на додаткові AI-шаблони, патерни або приклади
- **Доступність**: Покращення для різних потреб у навчанні
- **Інтеграція AI-інструментів**: Пропозиції для кращої інтеграції робочих процесів AI-розробки
- **Патерни AI для продакшену**: Запити на патерни розгортання корпоративного AI

### Обіцянка відповіді
- **Відповідь на проблеми**: Протягом 48 годин після повідомлення
- **Запити на функції**: Оцінка протягом одного тижня
- **Вклади спільноти**: Перегляд протягом одного тижня
- **Проблеми безпеки**: Пріоритетне розглядання з прискореною відповіддю

## Графік обслуговування

### Регулярні оновлення
- **Щомісячний огляд**: Перевірка точності контенту та посилань
- **Щоквартальні оновлення**: Основні додавання та покращення контенту
- **Напіврічний огляд**: Комплексна реструктуризація та удосконалення
- **Щорічні релізи**: Оновлення основних версій із суттєвими покращеннями

### Моніторинг і забезпечення якості
- **Автоматизоване тестування**: Регулярна перевірка прикладів коду та посилань
- **Інтеграція відгуків спільноти**: Регулярне врахування пропозицій користувачів
- **Оновлення технологій**: Узгодження з останніми сервісами Azure та релізами azd
- **Аудити доступності**: Регулярний перегляд принципів інклюзивного дизайну

## Політика підтримки версій

### Підтримка поточної версії
- **Остання основна версія**: Повна підтримка з регулярними оновленнями
- **Попередня основна версія**: Оновлення безпеки та критичні виправлення протягом 12 місяців
- **Старі версії**: Лише підтримка спільноти, без офіційних оновлень

### Рекомендації для міграції
Після виходу основних версій ми надаємо:
- **Посібники з міграції**: Покрокові інструкції переходу
- **Примітки щодо сумісності**: Деталі про несумісні зміни
- **Інструментальна підтримка**: Скрипти або утиліти для допомоги в міграції
- **Підтримка спільноти**: Спеціалізовані форуми для питань міграції

---

**Навігація**
- **Попередній урок**: [Study Guide](resources/study-guide.md)
- **Наступний урок**: Повернутися до [Main README](README.md)

**Будьте в курсі**: Слідкуйте за цим репозиторієм, щоб отримувати повідомлення про нові релізи та важливі оновлення навчальних матеріалів.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->