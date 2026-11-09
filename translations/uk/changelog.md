# Журнал змін - AZD For Beginners

## Вступ

Цей журнал змін документує всі значні зміни, оновлення та покращення в репозиторії AZD For Beginners. Ми дотримуємось принципів семантичного версіонування та підтримуємо цей журнал, щоб допомогти користувачам зрозуміти, що змінилося між версіями.

## Цілі навчання

Ознайомившись із цим журналом змін, ви:
- будете поінформовані про нові функції та додавання контенту
- зрозумієте покращення, внесені до існуючої документації
- відстежуватимете усунення помилок та виправлення для забезпечення точності
- стежитимете за еволюцією навчальних матеріалів з часом

## Результати навчання

Після ознайомлення із записами журналу змін, ви зможете:
- виявляти новий контент та ресурси, доступні для навчання
- розуміти, які розділи були оновлені або покращені
- планувати свій навчальний шлях на основі найактуальніших матеріалів
- надавати відгуки та пропозиції для майбутніх покращень

## Історія версій

### [v3.24.0]- 2026-11-04

#### Виправлено
- Відновлено навігацію курсу англійською, шляхи переміщених сторінок, відсутні анкори та застарілі зовнішні посилання, включно з посиланням на Розділ 2 щодо виробничого посібника з AI.
- Перевірено поточні настанови порівняно з опублікованими AZD 1.37.2, агентами 1.0.0-beta.23 та оцінками 1.0.0-beta.2. Задокументовано окремий `azd ai eval` робочий процес і міграцію конфігурації оптимізації.
- Виправлено непідтримувані ключі CLI, межі аутентифікації, настанови щодо відкритого тексту середовища/секретів, оновлення інфраструктури, конфігурації моделей і приклади руйнівного відновлення.
- Оновлено воркшоп відповідно до поточного зразка AI Agents, включно з реальними хуками, вхідними даними конфігурації, тестами оцінювання, точками входу для red-teaming і спостережністю.
- Виправлено приклади реалізації заяв і усунено пов’язані проблеми з додатками/інфраструктурою/конфігурацією. Матеріали з архітектури роздрібної торгівлі чітко відокремлені від повністю робочого застосунку.
- Відновлено матрицю мов CodeQL, вибрано підтримуваний Node.js 24 для контейнера розробника, і налаштували валідатори системи, щоб повідомляти про невдалі командні версії.

#### Додано
- Перевіряльник офлайн-посилань/анкорів лише англійською, регресійні тести та робочий процес документації, який також збирає воркшоп у строгому режимі. Згенеровані переклади й перекладені зображення виключені.

#### Обсяг валідації
- Перевірки вихідного коду, синтаксису, конфігурації, локальної поведінки та мережевих посилань не встановлюють живу розгортальність Azure, квоти, RBAC, регіональну наявність моделей, білінг, дотримання безпеки чи готовність до виробництва.
- Старіші записи нижче є історичними записами, не інструкціями для поточних команд або релізів.

### [v3.23.0] - 2026-07-13

#### Оновлення AZD 1.27.1: Оновлення актуальності версії
**Ця версія переоцінює курс відповідно до `azd` `1.27.1` (липень 2026, останній стабільний реліз) і поточного розширення AI agent у режимі прев’ю `azure.ai.agents` `1.0.0-beta.5`, оновлюючи кожний банер "validated against" після релізів 1.26.0, 1.27.0 та 1.27.1.**

#### Змінено
- **✅ Оновлено базовий рівень валідації** з `azd 1.25.6` (червень 2026) до `azd 1.27.1` (липень 2026) у кореневому README, у всіх README розділів, у уроці Розділу 1 про контейнер розробника (включно з прикладами з зафіксованими версіями), у уроці Розділу 4 про користувацькі шаблони, у уроці Розділу 5 про мультиагентів та у документації воркшопу
- **🤖 Оновлено базовий рівень Розділу 2** з `azd 1.23.12` (березень 2026) до `azd 1.27.1` для `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` і `microsoft-foundry-integration.md`; дати нотаток про валідацію оновлені до 2026-07-13
- **🧩 Оновлено розширення AI agent** з `azure.ai.agents` `0.1.40-preview` / `0.1.18-preview` до поточного релізу `1.0.0-beta.5` у README Розділу 2 та `agents.md`
- **🧪 Оновлено приклад валідації воркшопу** (вивід `azd version`) до `1.27.1`

#### Примітки щодо відповідних релізів azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** підтримка Go для Azure Functions на Flex Consumption, `azd config sub-filter` фільтри підписок за орендарями, автономні набори розширень (`azd x pack --bundle`) і `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** моделювання проектів/агентів Azure AI Foundry напряму в `azure.yaml` (ініціалізація без Bicep/Terraform), підтримка розгортання контейнера для App Service (`host: appservice` + `language: docker`), пряма `-s/--source` для команд `azd extension` і `azd tool uninstall`
- **1.27.1 (2026-07-09):** ключ `--no-dependencies` для `azd extension install`, за замовчуванням виключено застарілі моделі із запитів каталогу/квоти та кілька виправлень помилок

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

#### Заповнення початкових пробілів №2: авторство шаблонів, контейнери розробника, Pulumi, Azure DevOps, сервісні облікові записи і більше
**Ця версія закриває залишкові проміжні прогалини, виявлені аналізом покриття azd: як створювати та публікувати власний шаблон, відтворювані середовища dev-container/Codespaces, провайдер інфраструктури Pulumi, огляд CI/CD Azure DevOps, аутентифікація сервісних облікових записів, рекомендації з вибору хоста (AKS/Spring Apps), пояснення `azd restore`/`azd package`, обробка помилок хуків та практики командних / спільних середовищ.**

#### Додано
- **🧱 Новий урок Розділу 4** `docs/chapter-04-infrastructure/custom-templates.md` — створення власного azd шаблону: обов’язкова структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризація інфраструктури за допомогою маркера ресурсу `uniqueString()` і тега `azd-env-name`, локальне тестування з `azd init --template <local-path>`, публікація на GitHub і подання до галереї Awesome AZD
- **📦 Новий урок Розділу 1** `docs/chapter-01-foundation/dev-containers.md` — відтворювані середовища azd з Dev Containers і GitHub Codespaces: мінімальний `.devcontainer/devcontainer.json` із використанням офіційної функції `ghcr.io/azure/azure-dev/azd`, можливості для конкретних мов, `docker-in-docker` для хостів контейнерів і `azd auth login --use-device-code` для віддаленого входу
- **🧩 Розділ Pulumi з azd** у `docs/chapter-04-infrastructure/provisioning.md` — конфігурація `infra.provider: pulumi`, структура папок Pulumi, стеки зіставлені зі середовищами azd, обов’язкові виходи / теги та ідентичні робочі процеси `azd up` / `azd down`
- **🎯 Рекомендації з вибору хоста** у `docs/chapter-04-infrastructure/provisioning.md` — дружнє до початківців порівняння `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` і `springapp` із рекомендаціями, коли вибирати AKS або Azure Spring Apps
- **🛠️ Огляд CI/CD Azure DevOps** у `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, сервісне з'єднання з федерацією ідентичності робочого навантаження (OIDC), згенерований `azure-dev.yml` і налаштування груп змінних
- **🔑 Сервісні облікові записи (патерн 4)** додані в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неінтерактивна `azd auth login` із секретом клієнта проти федеративних/OIDC облікових даних, коли використовувати і безпечне зберігання облікових даних
- **🪝 Обробка помилок хуків** у підрозділі `docs/chapter-04-infrastructure/deployment-guide.md` — коди виходу й `set -e`, `continueOnError`, тестування хуків в ізоляції з `azd hooks run`, ОС-специфічні оболонки і `--debug`
- **👥 Командні / спільні середовища** у розділі `docs/chapter-03-configuration/configuration.md` — що зберігається в `.azure/`, що ігнорується Git, середовища на розробника, `azd env list`/`select` і надання значень середовища у CI/CD
- **🧰 Пояснення `azd restore` та розширених `azd package`** у `resources/cheat-sheet.md` — відновлення залежностей і створення розгортного артефакту без розгортання

#### Змінено
- **🧭 Оновлена таблиця уроків Розділу 4** із додаванням нового уроку "Створення власного шаблону" (Урок 3)
- **🧭 Оновлена таблиця уроків Розділу 1** із додаванням нового уроку "Dev Containers & Codespaces" (Урок 5); навігаційні футери проставлені між `bring-your-own-app.md` і `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заповнення початкових пробілів: практичний урок про мультиагентів, "принеси свій додаток", Terraform і огляд CI/CD
**Ця версія закриває найбільші прогалини для повного керівництва для початківців, додавши два нові практичні уроки (детальний посібник з розгортання мультиагента і додавання azd до існуючого додатку), дружнє введення у хуки, розділ Terraform з azd, поетапний огляд конвеєра GitHub Actions, пояснювальну інформацію про нові розширення у режимі прев’ю і явний чеклист перевірки розгортання.**

#### Додано
- **🤝 Новий урок Розділу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — повністю практичний посібник розгортання з двома агентами (оркестратор + спеціалісти) на основі реального шаблону (`contoso-creative-writer`), охоплює, коли використовувати мультиагентів, робочий процес `azd up`, розуміння розгорнутих ресурсів, трасування між агентами, налаштування і очищення
- **📦 Новий урок Розділу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — як додати azd до існуючого проекту з `azd init` ("використовувати код у поточному каталозі"), розуміння `azure.yaml` і `infra/`, `azd infra generate`, виявлення хоста і розгортання з `azd up`
- **🌐 Розділ Terraform з azd** доданий у `docs/chapter-04-infrastructure/provisioning.md` — конфігурація `infra.provider: terraform`, структура папок `.tf`, необхідні виходи `AZURE_*` і теги `azd-env-name` та ідентичні робочі процеси `azd up` / `azd down` (закриває прогалину, де заявлялась підтримка Terraform, але демонструвався лише Bicep)
- **⚙️ Покроковий огляд GitHub Actions** у `docs/chapter-08-production/production-ai-practices.md` — від репозиторію GitHub до автоматичних розгортань: `azd pipeline config`, Федеративні облікові дані OIDC (без збережених секретів), згенерований `azure-dev.yml` і керівництво з секретів проти змінних
- **🪝 Початківців "Новачок у хуках?" вхід** у `docs/chapter-04-infrastructure/deployment-guide.md` — що таке хук, таблиця стадій хуків, мінімальний перший хук і запуск хуків вручну з `azd hooks run`
- **✅ Додавання чеклиста "Перевірте своє розгортання"** у Крок 5 `docs/chapter-01-foundation/first-project.md` — базове тестування, перевірка кінцевої точки стану здоров’я та явні критерії успіху
- **🧩 Пояснення нових розширень у режимі прев’ю** `azure.ai.skills` і `azure.ai.connections` (що це і коли їх використовувати) у `docs/chapter-08-production/production-ai-practices.md`

#### Змінено
- **🧭 Виправлена таблиця уроків Розділу 5**: `multi-agent-basics.md` тепер урок 1 (єдиний повністю практичний урок), з чесною позначкою, що урок 2 знаходиться в Розділі 6, а сценарій роздрібної торгівлі є скоріше архітектурним макетом, а не шаблоном з однією командою
- **🧭 Таблиця уроків Розділу 1** тепер включає новий урок "Bring Your Own App" (Урок 4)
- **🔗 Оновлені футери навігації**: `first-project.md` тепер посилається вперед на `bring-your-own-app.md`

#### Виправлено
- **🧱 Закрито прогалину з Terraform "заявлено, але відсутнє"** — раніше курс посилався на підтримку Terraform, але не показував її
- **🔀 Виправлені оманливі перехресні посилання Розділу 5**, які створювали враження повної реалізації мультиагента, тоді як насправді була лише архітектурна схема

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

#### Оновлення AZD 1.25.6, повні команди життєвого циклу агента та ребрендинг Aspire
**Ця версія повторно перевіряє курс щодо `azd` `1.25.6` (червень 2026) та розширення `azure.ai.agents` `0.1.40-preview`, розширює керівництво ШІ від "створення агента" до повного життєвого циклу агента (тестування → оцінка → оптимізація → інспекція → видалення), демонструє нові розширення попереднього перегляду `azure.ai.skills` та `azure.ai.connections`, а також зазначає ребрендинг продукту ".NET Aspire" на "Aspire".**

#### Додано
- **🔁 Повне охоплення життєвого циклу агента** для початківців і інженерів ШІ по всій документації:
  - `docs/chapter-01-foundation/azd-basics.md` — Додано таблицю життєвого циклу (створення → тестування → вимірювання → покращення → інспекція → очищення) до розділу Розширень та Команд ШІ
  - `docs/chapter-08-production/production-ai-practices.md` — Новий розділ "Управління життєвим циклом агента", що охоплює `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, та `delete --force`
  - `resources/cheat-sheet.md` — Розширені команди AI Agent з `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, та `delete --force`
- **🧩 Документовані нові розширення попереднього перегляду**: `azure.ai.skills` (повторно використовувані навички агента) та `azure.ai.connections` (підключення Foundry), додані до таблиці розширень і шпаргалки
- **⏱️ Керівництво з часу відповіді** — приклади `azd ai agent invoke` тепер вказують, що виводиться загальна затримка та час до першого байта
- **📌 Банер версії** в кореневому README, який спрямовує учнів до `azd version` та `azd upgrade`

#### Змінено
- **✅ Оновлено базову лінію валідації** з `azd 1.23.12` (березень 2026) до `azd 1.25.6` (червень 2026) у всіх README розділах та документації майстерні
- **🤖 Оновлено примітку до розділу 2** з `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Оновлено приклад валідації майстерні** (вивід `azd version`) до `1.25.6`
- **🧭 Оновлено README "Що нового в azd сьогодні"** для висвітлення повного життєвого циклу агента, нових AI розширень та нещодавніх покращень якості життя (`azd init` ідемпотентність, `azd auth login` очищення застарілих токенів, `azd tool` первинний промпт)
- **📖 Файл agents.md розділу 2 (Варіант 4)** тепер спрямовує учнів до команд життєвого циклу після розгортання замість зупинки на `azd up`

#### Виправлено
- **🏷️ Найменування продукту** — додано примітку про ребрендинг Aspire ("NET Aspire" тепер просто "Aspire"); підтримка Aspire в azd незмінна
- **🔎 Підтвердження валідації релізу** проведено за допомогою стрічки випусків Azure Developer CLI: стабільна CLI `1.25.6` (2026-06-12) та `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Уточнення для початківців, перевірка налаштувань і фінальне очищення команд AZD
**Ця версія продовжує перевірку AZD 1.23 з акцентом на документацію для початківців: уточнює керівництво першої автентифікації AZD, додає скрипти для локальної перевірки налаштувань, перевіряє ключові команди на живій AZD CLI та видаляє останні застарілі посилання на команди в англомовному джерелі поза журналом змін.**

#### Додано
- **🧪 Скрипти перевірки для початківців** з `validate-setup.ps1` та `validate-setup.sh`, щоб учні могли підтвердити необхідні інструменти перед початком Розділу 1
- **✅ Кроки попередньої перевірки налаштувань** у кореневому README та README Розділу 1, щоб відсутні передумови були виявлені до `azd up`

#### Змінено
- **🔐 Керівництво з автентифікації для початківців** тепер послідовно розглядає `azd auth login` як основний шлях для робочих процесів AZD, а `az login` подано як опційний, якщо не використовуються безпосередньо команди Azure CLI
- **📚 Потік ознайомлення з Розділом 1** тепер спрямовує учнів перевірити локальні налаштування перед інсталяцією, автентифікацією та першими кроками розгортання
- **🛠️ Повідомлення валідатора** тепер чітко розділяють блокуючі вимоги від опційних попереджень Azure CLI для шляху початківця виключно з AZD
- **📖 Конфігурація, усунення несправностей та приклади** тепер розрізняють необхідну автентифікацію AZD і опційний вхід в Azure CLI там, де раніше обидва подавалися без контексту

#### Виправлено
- **📋 Оновлені залишкові посилання на команди з англомовного джерела** до актуальних форм AZD, включно з `azd config show` у шпаргалці та `azd monitor --overview`, де була передбачена демонстрація Azure Portal
- **🧭 М'якші твердження для початківців у Розділі 1** для уникнення надмірних обіцянок нульових помилок або відкату для всіх шаблонів та ресурсів Azure
- **🔎 Підтвердження підтримки живої CLI** для `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, та `azd down --force --purge`

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

#### Валідація AZD 1.23.12, розширення середовища майстерні та оновлення моделі ШІ
**Ця версія проводить перевірку документації щодо `azd` `1.23.12`, оновлює застарілі приклади команд AZD, оновлює керівництво з моделей ШІ до поточних значень за замовчуванням та розширює інструкції майстерні за межі GitHub Codespaces, підтримуючи також dev-контейнери та локальні копії.**

#### Додано
- **✅ Нотатки валідації в основних розділах і документації майстерні** для явного показу перевіреної базової лінії AZD для користувачів новіших або старіших збірок CLI
- **⏱️ Керівництво таймауту розгортання** для довготривалих розгортань AI-застосунків із використанням `azd deploy --timeout 1800`
- **🔎 Кроки інспекції розширень** з `azd extension show azure.ai.agents` в документації робочого процесу AI
- **🌐 Розширене керівництво майстерні**, яке охоплює GitHub Codespaces, dev-контейнери та локальні копії з MkDocs

#### Змінено
- **📚 README вступних розділів** тепер послідовно зазначають перевірку за `azd 1.23.12` в основних розділах, конфігурації, інфраструктурі, мультиагентних, передрозгортанні, усуненні несправностей та продакшн-лініях
- **🛠️ Посилання на команди AZD** оновлено до актуальних форм у документації:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` або `azd env get-value(s)` в залежності від контексту
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, де очікується огляд Application Insights
- **🧪 Приклади попереднього перегляду Provision** спрощено до поточного підтримуваного використання, такого як `azd provision --preview` та `azd provision --preview -e production`
- **🧭 Потік майстерні** оновлено, щоб учні могли виконувати лабораторії в Codespaces, dev-контейнері або локальній копії замість того, щоб припускати виконання лише в Codespaces
- **🔐 Керівництво з автентифікації** тепер надає перевагу `azd auth login` для робочих процесів AZD, з `az login` як опційним, якщо команди Azure CLI використовуються безпосередньо

#### Виправлено
- **🪟 Команди встановлення для Windows** нормалізовано до поточного регістру пакету `winget` в посібнику з інсталяції
- **🐧 Інструкції з установки для Linux** виправлено, щоб уникнути недопустимих вказівок на специфічний для дистрибутивів пакетний менеджер `azd` і натомість вказати на релізні пакети там, де це доречно
- **📦 Приклади моделей ШІ** оновлено з старих за замовчуванням, таких як `gpt-35-turbo` і `text-embedding-ada-002`, до актуальних прикладів типу `gpt-4.1-mini`, `gpt-4.1` і `text-embedding-3-large`
- **📋 Фрагменти для розгортання та діагностики** виправлено для використання поточних команд середовища й статусу у логах, скриптах і кроках усунення несправностей
- **⚙️ Інструкції для GitHub Actions** оновлено з `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Інструкції щодо згоди MCP/Copilot** оновлено з `azd mcp consent` до `azd copilot consent list`

#### Покращено
- **🧠 Інструкції з розділу ШІ** тепер краще пояснюють поведінку `azd ai`, чутливу до перегляду, специфічний для орендаря вхід, поточне використання розширення та оновлені рекомендації щодо розгортання моделей
- **🧪 Інструкції до майстерень** тепер використовують більш реалістичні приклади версій і зрозумілішу мову налаштування середовища для практичних лабораторних робіт
- **📈 Документи щодо виробництва та усунення несправностей** тепер краще узгоджуються з поточними прикладами моніторингу, резервних моделей та рівнів вартості

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

#### Команди CLI AZD AI, перевірка контенту та розширення шаблонів
**Ця версія додає покриття команд `azd ai`, `azd extension` і `azd mcp` у всіх розділах, пов’язаних із ШІ, виправляє зламані посилання та застарілий код у agents.md, оновлює шпаргалку та суттєво оновлює розділ Прикладних Шаблонів із перевіреними описами та новими шаблонами Azure AI AZD.**

#### Додано
- **🤖 Покриття CLI AZD AI** у 7 файлах (раніше лише в Розділі 8):
  - `docs/chapter-01-foundation/azd-basics.md` — новий розділ "Розширення та команди AI", що вводить `azd extension`, `azd ai agent init` і `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Варіант 4: `azd ai agent init` з таблицею порівняння (підхід шаблону проти маніфесту)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — підрозділи "Розширення AZD для Foundry" і "Розгортання на основі агентів"
  - `docs/chapter-05-multi-agent/README.md` — Швидкий старт тепер показує обидва шляхи розгортання: за шаблоном та на основі маніфесту
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Розділ розгортання тепер включає опцію `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Підрозділ "Команди розширення AZD AI для діагностики"
  - `resources/cheat-sheet.md` — Новий розділ "Команди AI & Extensions" з `azd extension`, `azd ai agent init`, `azd mcp` та `azd infra generate`
- **📦 Нові приклади шаблонів AZD AI** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат з Blazor WebAssembly, Semantic Kernel та підтримкою голосового чату
  - **azure-search-openai-demo-java** — Java RAG чат з використанням Langchain4J з опціями розгортання ACA/AKS
  - **contoso-creative-writer** — Багатоагентський додаток для творчого письма з використанням Azure AI Agent Service, Bing Grounding та Prompty
  - **serverless-chat-langchainjs** — Безсерверний RAG з Azure Functions + LangChain.js + Cosmos DB з підтримкою локальної розробки Ollama
  - **chat-with-your-data-solution-accelerator** — Прискорювач Enterprise RAG з адміністраторською порталом, інтеграцією Teams та опціями PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Орієнтовний додаток для мультиагентської оркестрації MCP з серверами на .NET, Python, Java та TypeScript
  - **azd-ai-starter** — Мінімальний стартер шаблону Bicep для інфраструктури Azure AI
  - **🔗 Посилання на Awesome AZD AI Gallery** — Посилання на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (понад 80 шаблонів)

#### Виправлено
- **🔗 навігація agents.md**: Посилання «Попередній/Наступний» тепер відповідають порядку уроків з Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 зламані посилання в agents.md**: `production-ai-practices.md` виправлено на `../chapter-08-production/production-ai-practices.md` (3 випадки)
- **📦 застарілий код agents.md**: Замінили `opencensus` на `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 недійсний API в agents.md**: Перемістили `max_tokens` із `create_agent()` до `create_run()` як `max_completion_tokens`
- **🔢 підрахунок токенів в agents.md**: Замінили грубий `len//4` оцінку на `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Виправлено сервіси з "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (хост за замовчуванням змінено в жовтні 2024)
- **contoso-chat**: Оновлено опис з посиланням на Azure AI Foundry + Prompty, що відповідає фактичній назві і технічному стеку репозиторію

#### Видалено
- **ai-document-processing**: Видалено нефункціональне посилання на шаблон (репозиторій недоступний публічно як AZD шаблон)

#### Покращено
- **📝 вправи в agents.md**: Вправа 1 тепер показує очікуваний вивід та крок `azd monitor`; Вправа 2 містить повний код реєстрації `FunctionTool`; Вправа 3 замінює нечіткі вказівки конкретними командами `prepdocs.py`
- **📚 ресурси в agents.md**: Оновлено посилання на документацію Azure AI Agent Service та швидкий старт
- **📋 таблиця наступних кроків в agents.md**: Додано посилання на AI Workshop Lab для повного покриття розділу

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

#### Покращення навігації курсом
**Ця версія покращує навігацію розділами README.md за допомогою розширеного формату таблиці.**

#### Змінено
- **Таблиця карти курсу**: Розширена прямими посиланнями на уроки, оцінками тривалості та складності
- **Прибирання папок**: Видалено застарілі старі папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Перевірка посилань**: Перевірено всі понад 21 внутрішніх посилань у таблиці карти курсу

### [v3.16.0] - 2026-02-05

#### Оновлення назв продуктів
**Ця версія оновлює посилання на продукти відповідно до поточного брендингу Microsoft.**

#### Змінено
- **Microsoft Foundry → Microsoft Foundry**: Усі посилання оновлені у файлах, що не є перекладами
- **Azure AI Agent Service → Foundry Agents**: Назва сервісу оновлена для відповідності новому бренду

#### Оновлені файли
- `README.md` - Головна сторінка курсу
- `changelog.md` - Історія версій
- `course-outline.md` - Структура курсу
- `docs/chapter-02-ai-development/agents.md` - Посібник AI агентів
- `examples/README.md` - Документація прикладів
- `workshop/README.md` - Сторінка воркшопу
- `workshop/docs/index.md` - Індекс воркшопу
- `workshop/docs/instructions/*.md` - Всі файли інструкцій воркшопу

---

### [v3.15.0] - 2026-02-05

#### Значна перебудова репозиторію: папки за главами
**Ця версія реорганізовує документацію у спеціалізовані папки за номерами глав для зручнішої навігації.**

#### Перейменування папок
Старі папки замінені на папки з номерами глав:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додано нову: `docs/chapter-05-multi-agent/`

#### Міграція файлів
| Файл | З | До |
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
| Всі файли pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Всі файли troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Додано
- **📚 README файли для кожної глави**: Створено README.md у кожній папці глави з:
  - Цілями навчання та тривалістю
  - Таблицею уроків з описами
  - Командами швидкого старту
  - Навігацією до інших глав

#### Змінено
- **🔗 Оновлено всі внутрішні посилання**: Оновлено понад 78 шляхів у всіх файлах документації
- **🗺️ Основний README.md**: Оновлено карту курсу з новою структурою глав
- **📝 examples/README.md**: Оновлено перехресні посилання на папки глав

#### Видалено
- Стара структура папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Перебудова репозиторію: навігація за главами
**Ця версія додала файли README з навігацією за главами (перевищено версією v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новий посібник з AI агентів
**Ця версія додає повний посібник з розгортання AI агентів за допомогою Azure Developer CLI.**

#### Додано
- **🤖 docs/microsoft-foundry/agents.md**: Повний посібник, що охоплює:
  - Що таке AI агенти та чим вони відрізняються від чат-ботів
  - Три шаблони швидкого старту агентів (Foundry Agents, Prompty, RAG)
  - Архітектурні патерни агентів (один агент, RAG, мультиагент)
  - Налаштування та кастомізація інструментів
  - Моніторинг і відстеження метрик
  - Розгляд витрат і оптимізація
  - Розповсюджені сценарії усунення неполадок
  - Три практичні вправи з критеріями успіху

#### Структура контенту
- **Вступ**: Концепції агентів для початківців
- **Швидкий старт**: Розгортання агентів за допомогою `azd init --template get-started-with-ai-agents`
- **Патерни архітектури**: Візуальні діаграми патернів агентів
- **Налаштування**: Конфігурація інструментів та змінних оточення
- **Моніторинг**: Інтеграція з Application Insights
- **Вправи**: Послідовне практичне навчання (20-45 хвилин кожна)

---

### [v3.12.0] - 2026-02-05

#### Оновлення середовища DevContainer
**Ця версія оновлює конфігурацію контейнера розробки з сучасними інструментами та кращими налаштуваннями за замовчуванням для досвіду навчання AZD.**

#### Змінено
- **🐳 Базове зображення**: Оновлено з `python:3.12-bullseye` на `python:3.12-bookworm` (остання стабільна версія Debian)
- **📛 Назва контейнера**: Перейменовано з "Python 3" на "AZD for Beginners" для ясності

#### Додано
- **🔧 Нові можливості Dev Container**:
  - `azure-cli` із увімкненою підтримкою Bicep
  - `node:20` (LTS версія для AZD шаблонів)
  - `github-cli` для управління шаблонами
  - `docker-in-docker` для розгортання контейнерних додатків

- **🔌 Проксі-переправлення портів**: Попередньо налаштовані порти для поширеної розробки:
  - 8000 (перегляд MkDocs)
  - 3000 (веб-додатки)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Нові розширення VS Code**:
  - `ms-python.vscode-pylance` - Покращений Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Підтримка Azure Functions
  - `ms-azuretools.vscode-docker` - Підтримка Docker
  - `ms-azuretools.vscode-bicep` - Підтримка мови Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управління ресурсами Azure
  - `yzhang.markdown-all-in-one` - Редагування Markdown
  - `DavidAnson.vscode-markdownlint` - Лінтування Markdown
  - `bierner.markdown-mermaid` - Підтримка діаграм Mermaid
  - `redhat.vscode-yaml` - Підтримка YAML (для azure.yaml)
  - `eamodio.gitlens` - Візуалізація Git
  - `mhutchie.git-graph` - Історія Git

- **⚙️ Налаштування VS Code**: Додано налаштування за замовчуванням для інтерпретатора Python, форматування при збереженні, та обрізання пробілів

- **📦 Оновлено requirements-dev.txt**:
  - Додано плагін minify для MkDocs
  - Додано pre-commit для якості коду
  - Додано пакунки Azure SDK (azure-identity, azure-mgmt-resource)

#### Виправлено
- **Команда після створення**: Тепер перевіряє встановлення AZD та Azure CLI при запуску контейнера

---

### [v3.11.0] - 2026-02-05

#### Переробка README для початківців
**Ця версія суттєво покращує README.md для кращої доступності початківцям і додає важливі ресурси для розробників AI.**

#### Додано
- **🆚 Порівняння Azure CLI та AZD**: Чітке пояснення, коли використовувати кожен інструмент із практичними прикладами
- **🌟 Відмінні посилання AZD**: Прямі посилання на галерею шаблонів спільноти та ресурси для внеску:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - понад 200 готових до розгортання шаблонів
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - внесок спільноти
- **🎯 Посібник швидкого старту**: Спрощений розділ старту з 3 кроків (Встановлення → Вхід → Розгортання)
- **📊 Таблиця навігації за досвідом**: Чіткі рекомендації, з чого починати залежно від досвіду розробника

#### Змінено
- **Структура README**: Перероблено для поступового розкриття інформації - ключова інформація на початку
- **Розділ Вступу**: Переписано для пояснення «Магії `azd up`» для повних початківців
- **Видалено дубліковані матеріали**: Усунуто повторювану секцію з усунення неполадок
- **Команди усунення неполадок**: Виправлено посилання `azd logs` на дійсний `azd monitor --logs`

#### Виправлено
- **🔐 Команди автентифікації**: Додано `azd auth login` та `azd auth logout` до cheat-sheet.md
- **Недійсні посилання на команди**: Видалено залишки `azd logs` з розділу усунення неполадок у README

#### Примітки
- **Обсяг**: Зміни застосовані до основного README.md та resources/cheat-sheet.md
- **Цільова аудиторія**: Покращення, орієнтовані на розробників, нових у AZD

---

### [v3.10.0] - 2026-02-05

#### Оновлення точності команд Azure Developer CLI
**Ця версія виправляє неіснуючі команди AZD у всій документації, забезпечуючи, що всі приклади коду використовують дійсний синтаксис Azure Developer CLI.**

#### Виправлено
- **🔧 Видалено неіснуючі команди AZD**: Комплексний аудит і виправлення недійсних команд:
  - `azd logs` (не існує) → замінено на `azd monitor --logs` або альтернативи Azure CLI
  - `azd service` субкоманди (не існують) → замінено на `azd show` та Azure CLI
  - `azd infra import/export/validate` (не існують) → видалено або замінено на дійсні альтернативи
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` прапори (не існують) → видалено
  - `azd provision --what-if/--rollback` прапори (не існують) → оновлено з використанням `--preview`
  - `azd config validate` (не існує) → замінено на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не існують) → видалено

- **📚 Оновлені файли з виправленнями команд**:
  - `resources/cheat-sheet.md`: Значне переписування посилання на команди
  - `docs/deployment/deployment-guide.md`: Виправлення стратегій rollback і deployment
  - `docs/troubleshooting/debugging.md`: Виправлення секцій аналізу журналів
  - `docs/troubleshooting/common-issues.md`: Оновлення команд усунення неполадок
  - `docs/troubleshooting/ai-troubleshooting.md`: Виправлення розділу відлагодження AZD
  - `docs/getting-started/azd-basics.md`: Виправлені команди моніторингу
  - `docs/getting-started/first-project.md`: Оновлені приклади моніторингу та налагодження
  - `docs/getting-started/installation.md`: Виправлені приклади допомоги та версії
  - `docs/pre-deployment/application-insights.md`: Виправлені команди перегляду журналів
  - `docs/pre-deployment/coordination-patterns.md`: Виправлені команди налагодження агента

- **📝 Оновлено посилання на версію**: 
  - `docs/getting-started/installation.md`: Змінена жорстко закодована версія `1.5.0` на загальну `1.x.x` з посиланням на релізи

#### Змінено
- **Стратегії відкату**: Оновлена документація для використання відкату на основі Git (AZD не має власного відкату)
- **Перегляд журналів**: Замінено посилання `azd logs` на `azd monitor --logs`, `azd monitor --live` і команди Azure CLI
- **Розділ продуктивності**: Видалено неіснуючі прапорці паралельного/інкрементального розгортання, надано валідні альтернативи

#### Технічні деталі
- **Дійсні команди AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Дійсні прапорці azd monitor**: `--live`, `--logs`, `--overview`
- **Вилучені функції**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Примітки
- **Перевірка**: Команди перевірені на Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершення воркшопу і оновлення якості документації
**Ця версія завершує модулі інтерактивного воркшопу, виправляє всі некоректні посилання у документації та покращує загальну якість контенту для AI-розробників, які використовують Microsoft AZD.**

#### Додано
- **📝 CONTRIBUTING.md**: Новий документ з правилами внеску з:
  - Чіткими інструкціями щодо повідомлення про проблеми та пропозиції змін
  - Стандарти документації для нового контенту
  - Керівництво щодо прикладів коду та форматування комітів
  - Інформація про залучення спільноти

#### Завершено
- **🎯 Воркшоп Модуль 7 (Заключний)**: Повністю завершений модуль підсумків з:
  - Вичерпним резюме досягнень воркшопу
  - Розділом ключових опанованих концепцій AZD, шаблонів та Microsoft Foundry
  - Рекомендаціями для продовження навчального шляху
  - Вправами воркшопу з оцінкою складності
  - Посиланнями на відгуки спільноти та підтримку

- **📚 Воркшоп Модуль 3 (Деконструкція)**: Оновлені навчальні цілі з:
  - Активізацією GitHub Copilot з MCP серверами
  - Розумінням структури папок шаблону AZD
  - Патернами організації інфраструктури як коду (Bicep)
  - Інструкціями для практичної лабораторії

- **🔧 Воркшоп Модуль 6 (Розбір)**: Завершено з:
  - Цілями очищення ресурсів та управління витратами
  - Використанням `azd down` для безпечного демонтажу інфраструктури
  - Інструкціями для відновлення видалених когнітивних сервісів
  - Додатковими завданнями для дослідження GitHub Copilot і Azure Portal

#### Виправлено
- **🔗 Виправлення битих посилань**: Виправлено понад 15 внутрішніх битих посилань в документації:
  - `docs/ai-foundry/ai-model-deployment.md`: Виправлені шляхи до microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Виправлені шляхи до ai-model-deployment.md і production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замінено неіснуючий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Виправлені шляхи FAQ та посібника з усунення несправностей
  - `examples/container-app/microservices/README.md`: Виправлені шляхи до головної сторінки курсу та посібника з розгортання
  - `resources/faq.md` і `resources/glossary.md`: Оновлені посилання на розділи AI
  - `course-outline.md`: Виправлені посилання на посібник інструктора та лабораторію AI воркшопу

- **📅 Банер стану воркшопу**: Оновлено статус з «В розробці» на активний стан воркшопу з датою лютий 2026 року

- **🔗 Навігація воркшопу**: Виправлені биті навігаційні посилання в README.md воркшопу, що вказували на неіснуючу папку lab-1-azd-basics

#### Змінено
- **Презентація воркшопу**: Видалено попередження "в розробці", воркшоп тепер повністю завершений і готовий до використання
- **Консистентність навігації**: Забезпечено належну міжмодульну навігацію у всіх модулях воркшопу
- **Посилання на навчальний шлях**: Оновлені перехресні посилання на розділи з правильними шляхами microsoft-foundry

#### Перевірено
- ✅ Всі англомовні markdown-файли мають дійсні внутрішні посилання
- ✅ Модулі воркшопу 0-7 повністю завершені з навчальними цілями
- ✅ Навігація між розділами і модулями працює коректно
- ✅ Контент підходить для AI-розробників, які використовують Microsoft AZD
- ✅ Підтримується дружня до початківців мова і структура
- ✅ CONTRIBUTING.md надає чіткі вказівки для учасників спільноти

#### Технічна реалізація
- **Перевірка посилань**: Автоматизований скрипт PowerShell перевірив всі внутрішні посилання .md
- **Аудит контенту**: Ручний огляд повноти воркшопу та придатності для початківців
- **Система навігації**: Застосовані послідовні патерни навігації по розділах і модулях

#### Примітки
- **Обсяг**: Зміни застосовані лише до англомовної документації
- **Переклади**: Папки з перекладами не оновлені в цій версії (автоматичний переклад синхронізується пізніше)
- **Тривалість воркшопу**: Повний воркшоп тепер забезпечує 3-4 години практичного навчання

---

### [v3.8.0] - 2025-11-19

#### Поглиблена документація: моніторинг, безпека та шаблони мультиагентської взаємодії
**Ця версія додає комплексні уроки рівня A з інтеграції Application Insights, шаблонів аутентифікації та координації мультиагентів для виробничих розгортань.**

#### Додано
- **📊 Урок інтеграції Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - Розгортання з фокусом на AZD з автоматичним забезпеченням
  - Повні шаблони Bicep для Application Insights + Log Analytics
  - Робочі Python-додатки з кастомною телеметрією (понад 1200 рядків)
  - Шаблони моніторингу AI/LLM (відстеження токенів/витрат моделей Microsoft Foundry)
  - 6 діаграм Mermaid (архітектура, розподілене трасування, потік телеметрії)
  - 3 практичні вправи (сповіщення, дашборди, моніторинг AI)
  - Приклади запитів Kusto та стратегії оптимізації витрат
  - Потокове передавання метрик у реальному часі та налагодження
  - Час навчання 40-50 хвилин з готовими для виробництва шаблонами

- **🔐 Урок шаблонів аутентифікації та безпеки**: у `docs/getting-started/authsecurity.md`:
  - 3 шаблони аутентифікації (рядки підключення, Key Vault, керована ідентичність)
  - Повні Bicep-шаблони інфраструктури для безпечних розгортань
  - Код Node.js додатка з інтеграцією Azure SDK
  - 3 повних вправи (активація керованої ідентичності, призначена користувачу ідентичність, ротація Key Vault)
  - Найкращі практики безпеки та налаштування RBAC
  - Посібник з усунення несправностей та аналіз витрат
  - Готові до виробництва шаблони безпарольної аутентифікації

- **🤖 Урок шаблонів координації мультиагентів**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 шаблонів координації (послідовний, паралельний, ієрархічний, подієвий, консенсус)
  - Повна реалізація оркеструючого сервісу (Python/Flask, понад 1500 рядків)
  - 3 спеціалізовані агенти (дослідник, автор, редактор)
  - Інтеграція Service Bus для чергування повідомлень
  - Управління станом у Cosmos DB для розподілених систем
  - 6 діаграм Mermaid, що демонструють взаємодії агентів
  - 3 просунуті вправи (обробка таймаутів, логіка повторних спроб, автоматичне відключення)
  - Розбивка витрат ($240-565/місяць) з оптимізаційними стратегіями
  - Інтеграція Application Insights для моніторингу

#### Покращено
- **Розділ перед розгортанням**: Тепер включає комплексні шаблони моніторингу та координації
- **Розділ початку роботи**: Покращений професійними шаблонами аутентифікації
- **Готовність до виробництва**: Повне покриття від безпеки до спостережуваності
- **Структура курсу**: Оновлено для посилання на нові уроки в Розділах 3 і 6

#### Змінено
- **Прогрес навчання**: Краща інтеграція безпеки і моніторингу протягом курсу
- **Якість документації**: Послідовні стандарти рівня A (95-97%) у нових уроках
- **Виробничі шаблони**: Повне комплексне покриття для корпоративних розгортань

#### Покращено
- **Досвід розробника**: Чіткий шлях від розробки до моніторингу у виробництві
- **Стандарти безпеки**: Професійні шаблони для аутентифікації та управління секретами
- **Спостережуваність**: Повна інтеграція Application Insights з AZD
- **Вантажі AI**: Спеціалізований моніторинг моделей Microsoft Foundry та мультиагентських систем

#### Перевірено
- ✅ Всі уроки містять повний робочий код (не уривки)
- ✅ Діаграми Mermaid для візуального навчання (всього 19 по 3 уроках)
- ✅ Практичні вправи з кроками перевірки (всього 9)
- ✅ Готові до виробництва Bicep шаблони для розгортання через `azd up`
- ✅ Аналіз витрат та стратегії оптимізації
- ✅ Посібники з усунення несправностей та кращих практик
- ✅ Контрольні точки знань із командами перевірки

#### Результати оцінки документації
- **docs/pre-deployment/application-insights.md**: - Комплексний посібник з моніторингу
- **docs/getting-started/authsecurity.md**: - Професійні шаблони безпеки
- **docs/pre-deployment/coordination-patterns.md**: - Просунуті архітектури мультиагентів
- **Загальний новий контент**: - Послідовні високоякісні стандарти

#### Технічна реалізація
- **Application Insights**: Log Analytics + кастомна телеметрія + розподілене трасування
- **Аутентифікація**: Керована ідентичність + Key Vault + шаблони RBAC
- **Мультиагент**: Service Bus + Cosmos DB + Container Apps + оркестрація
- **Моніторинг**: Потокові метрики + запити Kusto + сповіщення + дашборди
- **Управління витратами**: Стратегії вибірки, політики зберігання, контроль бюджету

### [v3.7.0] - 2025-11-19

#### Покращення якості документації та новий приклад Microsoft Foundry Models
**Ця версія покращує якість документації у сховищі і додає повний приклад розгортання Microsoft Foundry Models із чат-інтерфейсом gpt-4.1.**

#### Додано
- **🤖 Приклад чату Microsoft Foundry Models**: Повне розгортання gpt-4.1 з робочою реалізацією у `examples/azure-openai-chat/`:
  - Повна інфраструктура Microsoft Foundry Models (розгортання моделі gpt-4.1)
  - Python чат-інтерфейс командного рядка з історією розмов
  - Інтеграція Key Vault для безпечного зберігання API ключів
  - Відстеження використання токенів і оцінка вартості
  - Лімітування швидкості та обробка помилок
  - Комплексний README з посібником розгортання на 35-45 хвилин
  - 11 файлів, готових до виробництва (Bicep шаблони, Python додаток, конфігурація)
- **📚 Вправи з документації**: Додано практичні вправи до посібника з конфігурації:
  - Вправа 1: Конфігурація для багатьох середовищ (15 хвилин)
  - Вправа 2: Практика управління секретами (10 хвилин)
  - Чіткі критерії успіху та кроки перевірки
- **✅ Перевірка розгортання**: Додано розділ перевірки до посібника розгортання:
  - Процедури перевірки стану
  - Контрольний список критеріїв успіху
  - Очікувані вихідні дані для всіх команд розгортання
  - Швидкий довідник з усунення несправностей

#### Покращено
- **examples/README.md**: Оновлено до якості рівня A (93%):
  - Додано azure-openai-chat у всі відповідні розділи
  - Оновлено кількість локальних прикладів з 3 до 4
  - Додано до таблиці прикладів застосування AI
  - Інтегровано у Quick Start для користувачів середнього рівня
  - Додано до розділу Microsoft Foundry Templates
  - Оновлено матрицю порівнянь і розділи пошуку технологій
- **Якість документації**: Покращено з B+ (87%) до A- (92%) у папці docs:
  - Додано очікувані вихідні дані до ключових прикладів команд
  - Включено кроки перевірки для змін конфігурації
  - Покращене практичне навчання з практичними вправами

#### Змінено
- **Прогрес навчання**: Краща інтеграція AI-прикладів для користувачів середнього рівня
- **Структура документації**: Більше практичних вправ з чіткими результатами
- **Процес перевірки**: Додані явні критерії успіху до ключових робочих процесів

#### Покращено
- **Досвід розробника**: Розгортання Microsoft Foundry Models тепер займає 35-45 хвилин (замість 60-90 хв для складних альтернатив)
- **Прозорість вартості**: Чіткі оцінки вартості ($50-200/місяць) для прикладу Microsoft Foundry Models
- **Навчальний шлях**: AI-розробники мають чітку точку входу з azure-openai-chat
- **Стандарти документації**: Послідовні очікувані вихідні дані та кроки перевірки

#### Перевірено
- ✅ Приклад Microsoft Foundry Models повністю функціональний з `azd up`
- ✅ Всі 11 файлів реалізації синтаксично коректні
- ✅ Інструкції README відповідають фактичному досвіду розгортання
- ✅ Посилання в документації оновлені в понад 8 місцях
- ✅ Індекс прикладів точно відображає 4 локальні приклади
- ✅ Відсутні дублікати зовнішніх посилань у таблицях
- ✅ Всі навігаційні посилання правильні

#### Технічна реалізація
- **Архітектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + шаблон Container Apps
- **Безпека**: Керована ідентичність, секрети у Key Vault
- **Моніторинг**: Інтеграція Application Insights
- **Управління витратами**: Відстеження токенів та оптимізація використання
- **Розгортання**: Одна команда `azd up` для повного налаштування

### [v3.6.0] - 2025-11-19

#### Велике оновлення: Приклади розгортання Container App
**Ця версія представляє комплексні, готові до виробництва приклади розгортання контейнерних додатків за допомогою Azure Developer CLI (AZD), з повною документацією та інтеграцією в навчальний шлях.**

#### Додано
- **🚀 Приклади Container App**: Нові локальні приклади у `examples/container-app/`:
  - [Головний посібник](examples/container-app/README.md): Повний огляд розгортання контейнеризованих застосунків, швидкий старт, виробничі та розширені шаблони
  - [Простий Flask API](../../examples/container-app/simple-flask-api): Дружній для початківців REST API з підтримкою масштабування до нуля, перевірками стану, моніторингом і усуненням проблем
  - [Архітектура мікросервісів](../../examples/container-app/microservices): Готове до виробництва мультисервісне розгортання (API Gateway, Product, Order, User, Notification), асинхронний обмін повідомленнями, Service Bus, Cosmos DB, Azure SQL, розподілене трасування, blue-green/canary розгортання
- **Кращі практики**: Безпека, моніторинг, оптимізація вартості та рекомендації з CI/CD для контейнеризованих навантажень
- **Приклади коду**: Повні `azure.yaml`, шаблони Bicep та реалізації сервісів на кількох мовах (Python, Node.js, C#, Go)
- **Тестування та усунення неполадок**: Сценарії повного тестування, команди моніторингу, рекомендації з усунення проблем

#### Змінено
- **README.md**: Оновлено для демонстрації та посилання на нові приклади контейнерних застосунків у розділі "Local Examples - Container Applications"
- **examples/README.md**: Оновлено для висвітлення прикладів контейнерних застосунків, додано записи до матриці порівнянь і оновлено посилання на технології та архітектуру
- **Огляд курсу та навчальний посібник**: Оновлено для посилань на нові приклади контейнерних застосунків і шаблони розгортання в відповідних розділах

#### Перевірено
- ✅ Усі нові приклади можна розгорнути за допомогою `azd up`, вони відповідають кращим практикам
- ✅ Оновлено перехресні посилання та навігацію в документації
- ✅ Приклади охоплюють сценарії від початкового до просунутого рівня, включно з мікросервісами для виробництва

#### Примітки
- **Обсяг**: Лише англомовна документація та приклади
- **Наступні кроки**: Розширення додатковими просунутими контейнерними шаблонами та автоматизацією CI/CD у майбутніх релізах

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукту: Microsoft Foundry
**Ця версія впроваджує повну зміну назви продукту з "Microsoft Foundry" на "Microsoft Foundry" у всій англомовній документації, відображаючи офіційний ребрендинг Microsoft.**

#### Змінено
- **🔄 Оновлення назви продукту**: Повний ребрендинг з "Microsoft Foundry" на "Microsoft Foundry"
  - Оновлено всі посилання в англомовній документації в папці `docs/`
  - Перейменовано папку: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Перейменовано файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всього: оновлено 23 посилання в 7 документах

- **📁 Зміни структури папок**:
  - `docs/ai-foundry/` перейменовано у `docs/microsoft-foundry/`
  - Усі перехресні посилання оновлено для відображення нової структури папок
  - Перевірено посилання навігації по всій документації

- **📄 Перейменування файлів**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Усі внутрішні посилання оновлено для нового імені файлу

#### Оновлені файли
- **Документація розділів** (7 файлів):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 оновлення посилань навігації
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 оновлення посилань на назву продукту
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вже використовується Microsoft Foundry (з попередніх оновлень)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 оновлення посилань (огляд, відгуки спільноти, документація)
  - `docs/getting-started/azd-basics.md` - 4 оновлення перехресних посилань
  - `docs/getting-started/first-project.md` - 2 оновлення посилань навігації по розділах
  - `docs/getting-started/installation.md` - 2 оновлення посилань наступного розділу
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 оновлення посилань (навігація, спільнота Discord)
  - `docs/troubleshooting/common-issues.md` - 1 оновлення посилання навігації
  - `docs/troubleshooting/debugging.md` - 1 оновлення посилання навігації

- **Файли структури курсу** (2 файли):
  - `README.md` - 17 оновлень посилань (огляд курсу, назви розділів, розділ шаблонів, відгуки спільноти)
  - `course-outline.md` - 14 оновлень посилань (огляд, навчальні цілі, ресурси розділу)

#### Перевірено
- ✅ Відсутні посилання на папку "ai-foundry" в англомовній документації
- ✅ Відсутні посилання на продукт "Microsoft Foundry" в англомовній документації
- ✅ Усі посилання навігації функціонують з новою структурою папок
- ✅ Перейменування файлів та папок успішно виконано
- ✅ Перехресні посилання між розділами перевірені

#### Примітки
- **Обсяг**: Зміни застосовано лише до англомовної документації в папці `docs/`
- **Переклади**: Папки з перекладами (`translations/`) не оновлювалися в цій версії
- **Матеріали воркшопу**: Матеріали воркшопу (`workshop/`) не оновлювалися в цій версії
- **Приклади**: Файли прикладів можуть містити застарілі назви (буде виправлено в наступному оновленні)
- **Зовнішні посилання**: Зовнішні URL та посилання на репозиторій GitHub залишаються незмінними

#### Посібник з міграції для учасників
Якщо у вас є локальні гілки або документація, що посилається на стару структуру:
1. Оновіть посилання на папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Оновіть посилання на файли: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замініть назву продукту: "Microsoft Foundry" → "Microsoft Foundry"
4. Перевірте всі внутрішні посилання в документації

---

### [v3.4.0] - 2025-10-24

#### Покращення огляду інфраструктури та перевірки
**Ця версія вводить комплексну підтримку нової функції попереднього перегляду Azure Developer CLI і покращує досвід користувачів воркшопу.**

#### Додано
- **🧪 Документація функції azd provision --preview**: Повне висвітлення нової можливості попереднього перегляду інфраструктури
  - Посилання на команди та приклади використання у шпаргалці
  - Детальна інтеграція в посібник з розгортання з прикладами та перевагами
  - Інтеграція перевірки перед запуском для безпечнішої валідації розгортання
  - Оновлення посібника з початку роботи з практиками безпечного розгортання
- **🚧 Банер стану воркшопу**: Професійний HTML-банер, що показує стан розробки воркшопу
  - Градієнтний дизайн з індикаторами будівництва для чіткого інформування користувачів
  - Позначка часу останнього оновлення для прозорості
  - Мобільна адаптивність для всіх типів пристроїв

#### Покращено
- **Безпека інфраструктури**: Функціональність попереднього перегляду інтегрована у всю документацію розгортання
- **Перевірка перед розгортанням**: Автоматизовані скрипти тепер включають тестування попереднього перегляду інфраструктури
- **Робочий процес розробника**: Оновлені послідовності команд з включенням попереднього перегляду як кращої практики
- **Досвід воркшопу**: Чітке інформування користувачів про статус розробки контенту

#### Змінено
- **Кращі практики розгортання**: Рекомендовано підхід із пріоритетом роботи з попереднім переглядом
- **Потік документації**: Валідація інфраструктури переміщена на ранній етап навчання
- **Презентація воркшопу**: Професійне інформування про статус з чітким графіком розробки

#### Покращено
- **Підхід із першочерговою безпекою**: Зміни інфраструктури можна перевіряти до розгортання
- **Співпраця в команді**: Результати попереднього перегляду можна ділитися для огляду та затвердження
- **Усвідомлення вартості**: Краще розуміння вартості ресурсів до забезпечення
- **Зменшення ризиків**: Скорочення помилок розгортання через попередню перевірку

#### Технічна реалізація
- **Інтеграція в кілька документів**: Функція попереднього перегляду описана в 4 ключових файлах
- **Шаблони команд**: Послідовний синтаксис і приклади по всій документації
- **Інтеграція кращих практик**: Попередній перегляд включений до робочих процесів валідації і скриптів
- **Візуальні індикатори**: Чіткі позначки НОВОЇ функції для кращої помітності

#### Інфраструктура воркшопу
- **Інформування про статус**: Професійний HTML-банер з градієнтним стилем
- **Досвід користувача**: Чіткий статус розробки запобігає непорозумінням
- **Професійна презентація**: Підтримка довіри до репозиторію з одночасним встановленням очікувань
- **Прозорість термінів**: Позначка останнього оновлення – жовтень 2025 для підзвітності

### [v3.3.0] - 2025-09-24

#### Покращені матеріали воркшопу та інтерактивний навчальний досвід
**Ця версія вводить комплексні матеріали воркшопу з браузерними інтерактивними посібниками та структурованими навчальними шляхами.**

#### Додано
- **🎥 Інтерактивний посібник воркшопу**: Досвід воркшопу в браузері з можливістю перегляду в MkDocs
- **📝 Структуровані інструкції воркшопу**: 7-кроковий керований навчальний шлях від ознайомлення до налаштування
  - 0-Вступ: Огляд воркшопу та налаштування
  - 1-Вибір AI-шаблону: Процес відкриття та вибору шаблону
  - 2-Валідація AI-шаблону: Процедури розгортання та перевірки
  - 3-Аналіз AI-шаблону: Розуміння архітектури шаблону
  - 4-Налаштування AI-шаблону: Конфігурація та кастомізація
  - 5-Модифікація AI-шаблону: Просунуті зміни та ітерації
  - 6-Звільнення інфраструктури: Очистка та управління ресурсами
  - 7-Підсумок: Резюме та наступні кроки
- **🛠️ Інструменти воркшопу**: Конфігурація MkDocs з темою Material для кращого навчального досвіду
- **🎯 Практичний навчальний шлях**: 3-крокова методологія (Відкриття → Розгортання → Налаштування)
- **📱 Інтеграція GitHub Codespaces**: Безшовне налаштування середовища розробки

#### Покращено
- **Лабораторія AI воркшопу**: Розширена комплексним структурованим навчанням тривалістю 2-3 години
- **Документація воркшопу**: Професійна презентація з навігацією та візуальними підказками
- **Прогрес навчання**: Чітке покрокове керівництво від вибору шаблону до виробничого розгортання
- **Досвід розробника**: Інтегровані інструменти для оптимізації робочих процесів розробки

#### Покращено
- **Доступність**: Інтерфейс у браузері з пошуком, функцією копіювання та перемиканням теми
- **Навчання у власному темпі**: Гнучка структура воркшопу для різної швидкості навчання
- **Практичне застосування**: Сценарії розгортання реальних AI шаблонів
- **Інтеграція спільноти**: Інтеграція Discord для підтримки та співпраці у воркшопі

#### Особливості воркшопу
- **Вбудований пошук**: Швидкий пошук ключових слів і уроків
- **Копіювання блоків коду**: Функціонал копіювання при наведенні для всіх прикладів коду
- **Перемикання теми**: Підтримка темної/світлої теми для різних уподобань
- **Візуальні матеріали**: Скриншоти та діаграми для кращого розуміння
- **Інтеграція допомоги**: Прямий доступ до Discord для підтримки спільноти

### [v3.2.0] - 2025-09-17

#### Велика реструктуризація навігації та система навчання на основі розділів
**Ця версія вводить комплексну структуру навчання, поділену на розділи, з покращеною навігацією по всьому репозиторію.**

#### Додано
- **📚 Система навчання на основі розділів**: Повна реструктуризація курсу на 8 поступових навчальних розділів
  - Розділ 1: Основи та швидкий старт (⭐ - 30-45 хв)
  - Розділ 2: Розробка AI-першою (⭐⭐ - 1-2 години)
  - Розділ 3: Конфігурація та автентифікація (⭐⭐ - 45-60 хв)
  - Розділ 4: Інфраструктура як код та розгортання (⭐⭐⭐ - 1-1.5 години)
  - Розділ 5: Багатоагентні AI-рішення (⭐⭐⭐⭐ - 2-3 години)
  - Розділ 6: Валідація та планування перед розгортанням (⭐⭐ - 1 година)
  - Розділ 7: Усунення неполадок та налагодження (⭐⭐ - 1-1.5 години)
  - Розділ 8: Виробничі та корпоративні шаблони (⭐⭐⭐⭐ - 2-3 години)
- **📚 Комплексна навігаційна система**: Послідовні заголовки та футери навігації в усій документації
- **🎯 Відстеження прогресу**: Перелік завершення курсу та система перевірки навчання
- **🗺️ Керівництво навчальним шляхом**: Чіткі вхідні точки для різних рівнів досвіду та цілей
- **🔗 Навігація з перехресними посиланнями**: Чітко пов'язані суміжні розділи та передумови

#### Покращено
- **Структура README**: Перетворена на структуровану навчальну платформу з організацією за розділами
- **Навігація документації**: На кожній сторінці тепер є контекст розділу та поради з проходження
- **Організація шаблонів**: Приклади та шаблони зіставлені з відповідними навчальними розділами
- **Інтеграція ресурсів**: Шпаргалки, FAQ та навчальні посібники пов’язані з відпо­відними розділами
- **Інтеграція воркшопу**: Практичні лабораторії зіставлені з цілями навчання кількох розділів

#### Змінено
- **Прогрес навчання**: Перехід від лінійної документації до гнучкого навчання за розділами
- **Розміщення конфігурації**: Посібник з конфігурації переміщено в розділ 3 для кращого навчального потоку
- **Інтеграція AI-контенту**: Краща інтеграція AI-специфічного контенту протягом усього курсу
- **Виробничий контент**: Розширені шаблони консолідовано в розділі 8 для корпоративних користувачів

#### Покращено
- **Досвід користувача**: Чіткі "хлібні крихти" навігації та індикатори проходження розділів
- **Доступність**: Послідовні навігаційні патерни для легшого проходження курсу
- **Професійна презентація**: Структура курсу в університетському стилі, придатна для академічного та корпоративного навчання
- **Ефективність навчання**: Скорочення часу пошуку релевантного контенту завдяки покращеній організації

#### Технічна реалізація
- **Заголовки навігації**: Стандартізація навігації розділів у понад 40 документах
- **Підвали навігації**: Послідовні вказівки прогресу та індикатори завершення розділів
- **Перехресні посилання**: Комплексна система внутрішніх посилань, що з’єднує пов’язані концепції
- **Відповідність розділам**: Шаблони та приклади чітко співвіднесені з навчальними цілями

#### Покращення навчального посібника
- **📚 Комплексні навчальні цілі**: Переструктуровано навчальний посібник відповідно до 8-розділової системи
- **🎯 Оцінювання за розділами**: Кожен розділ включає конкретні навчальні цілі та практичні вправи
- **📋 Відстеження прогресу**: Щотижневий навчальний графік із вимірюваними результатами та списками завершення
- **❓ Контрольні питання**: Запитання для перевірки знань за кожним розділом із професійними результатами
- **🛠️ Практичні вправи**: Практичні завдання з реальними сценаріями розгортання та усунення неполадок
- **📊 Прогрес у навичках**: Чіткий розвиток від базових концепцій до корпоративних шаблонів із фокусом на кар’єру
- **🎓 Сертифікаційна структура**: Професійні результати розвитку та система визнання спільнотою
- **⏱️ Управління графіком**: Структурований 10-тижневий план навчання з перевіркою ключових етапів

### [v3.1.0] - 2025-09-17

#### Покращені багатоагентні AI-рішення
**Ця версія вдосконалює багатоагентне роздрібне рішення з кращою іменною системою агентів і покращеною документацією.**

#### Змінено
- **Термінологія мультиагентної системи**: Замінено "агент Cora" на "агент клієнта" у всьому мультиагентному роздрібному рішенні для кращого розуміння
- **Архітектура агента**: Оновлено всю документацію, ARM шаблони та приклади коду для узгодженого використання назви "агент клієнта"
- **Приклади конфігурації**: Модернізовано шаблони конфігурації агента з оновленою номенклатурою
- **Консистентність документації**: Забезпечено використання професійних, описових назв агентів у всіх посиланнях

#### Покращено
- **Пакет ARM шаблонів**: Оновлено retail-multiagent-arm-template з посиланнями на агента клієнта
- **Діаграми архітектури**: Оновлено Mermaid діаграми з оновленими назвами агентів
- **Приклади коду**: Python класи та приклади реалізації тепер використовують іменування CustomerAgent
- **Змінні середовища**: Оновлено всі скрипти розгортання під конвенцію CUSTOMER_AGENT_NAME

#### Поліпшено
- **Досвід розробника**: Чіткіші ролі та обов’язки агентів у документації
- **Готовність до продуктивного використання**: Краще узгодження з корпоративними naming conventions
- **Навчальні матеріали**: Інтуїтивно зрозуміле іменування агентів для навчальних цілей
- **Зручність шаблонів**: Спрощене розуміння функцій агента та патернів розгортання

#### Технічні деталі
- Оновлено Mermaid діаграми архітектури з посиланнями на CustomerAgent
- Замінено імена класів CoraAgent на CustomerAgent у прикладах Python
- Змінено JSON конфігурації ARM шаблонів для використання типу агента "customer"
- Оновлено змінні середовища з CORA_AGENT_* на CUSTOMER_AGENT_*
- Оновлено всі команди розгортання та конфігурації контейнерів

### [v3.0.0] - 2025-09-12

#### Основні зміни - Фокус на AI розробників та інтеграція Microsoft Foundry
**Ця версія перетворює репозиторій на комплексний ресурс для навчання з AI з інтеграцією Microsoft Foundry.**

#### Додано
- **🤖 AI-перший навчальний маршрут**: Повна перебудова з пріоритетом на AI розробників та інженерів
- **Посібник з інтеграції Microsoft Foundry**: Всеохопна документація для підключення AZD до сервісів Microsoft Foundry
- **Патерни розгортання AI моделей**: Детальний посібник з вибору моделей, конфігурації та стратегій продакшн-розгортання
- **AI Workshop Lab**: 2-3 годинний практичний воркшоп з перетворення AI додатків у рішення, що розгортаються через AZD
- **Кращі практики AI у продакшн**: Патерни для масштабування, моніторингу та безпеки AI навантажень
- **Довідник з усунення несправностей AI**: Повний посібник з усунення проблем Microsoft Foundry Models, Cognitive Services та AI деплойменту
- **Галерея AI шаблонів**: Вибрана колекція шаблонів Microsoft Foundry з рейтингом складності
- **Матеріали для воркшопів**: Повна структура воркшопів з практичними лабораторіями та довідковими матеріалами

#### Покращено
- **Структура README**: Орієнтована на AI розробників з 45% зацікавленості спільноти за даними Microsoft Foundry Discord
- **Навчальні маршрути**: Спеціальний шлях для AI розробників поряд із традиційними для студентів і DevOps інженерів
- **Рекомендації шаблонів**: Вибрані AI шаблони, включно з azure-search-openai-demo, contoso-chat та openai-chat-app-quickstart
- **Інтеграція спільноти**: Покращена підтримка Discord спільноти з AI-специфічними каналами та обговореннями

#### Безпека та готовність до продакшн
- **Патерни управління ідентичністю**: AI-специфічна автентифікація та конфігурації безпеки
- **Оптимізація вартості**: Відстеження використання токенів та контроль бюджетів для AI навантажень
- **Мульти-регіональне розгортання**: Стратегії глобального розгортання AI додатків
- **Моніторинг продуктивності**: AI-специфічні метрики та інтеграція з Application Insights

#### Якість документації
- **Лінійна структура курсу**: Логічне просування від початкових до просунутих патернів AI розгортання
- **Перевірені URL**: Всі посилання на зовнішні репозиторії підтверджено та доступні
- **Повний довідник**: Валідація всіх внутрішніх посилань і їх функціональність
- **Готовність до продакшн**: Корпоративні патерни розгортання з реальними прикладами

### [v2.0.0] - 2025-09-09

#### Основні зміни - Перебудова репозиторію та професійне покращення
**Ця версія представляє суттєву реконструкцію структури репозиторію та подання контенту.**

#### Додано
- **Структурована навчальна основа**: На всіх сторінках документації додано розділи Вступ, Цілі навчання та Очікувані результати
- **Система навігації**: Додано посилання на попередній/наступний урок по всьому контенту для впорядкованого навчання
- **Навчальний посібник**: Всеохопний study-guide.md з цілями навчання, практичними вправами та матеріалами для оцінювання
- **Професійне подання**: Видалено всі іконки-емодзі для покращення доступності та професійного вигляду
- **Покращена структура контенту**: Краща організація та логіка навчальних матеріалів

#### Змінено
- **Формат документації**: Стандартизовано всю документацію з фокусом на структуру, орієнтовану на навчання
- **Навігаційний потік**: Впроваджено логічний порядок проходження матеріалів
- **Подання контенту**: Видалено декоративні елементи заради чіткішого і професійного форматування
- **Структура посилань**: Оновлено всі внутрішні посилання для підтримки нової системи навігації

#### Покращено
- **Доступність**: Прибрано залежності від емодзі для кращої сумісності з програвачами тексту
- **Професійний вигляд**: Чисте, академічне подання, відповідне для корпоративного навчання
- **Досвід навчання**: Структурований підхід з чіткими цілями та результатами для кожного уроку
- **Організація контенту**: Кращий логічний зв’язок і послідовність пов’язаних тем

### [v1.0.0] - 2025-09-09

#### Початковий реліз - Комплексний репозиторій для навчання AZD

#### Додано
- **Основна структура документації**
  - Повний серіал посібників для початку роботи
  - Всеохопна документація з розгортання та провізування
  - Детальні ресурси для усунення несправностей і налагодження
  - Інструменти та процедури валідації перед розгортанням

- **Модуль початку роботи**
  - Основи AZD: Основні поняття та термінологія
  - Посібник з встановлення: Інструкції для конкретних платформ
  - Посібник з конфігурації: Налаштування середовища та автентифікація
  - Перший проект: Покрокове практичне навчання

- **Модуль розгортання та провізування**
  - Посібник з розгортання: Повний робочий процес
  - Посібник з провізування: Інфраструктура як код за допомогою Bicep
  - Кращі практики для продуктивних розгортань
  - Патерни мультисервісної архітектури

- **Модуль передрозгортної валідації**
  - Планування ємності: Перевірка доступності ресурсів Azure
  - Вибір SKU: Всеохопне керівництво по рівнях сервісів
  - Попередні перевірки: Автоматизовані скрипти валідації (PowerShell і Bash)
  - Інструменти оцінки вартості та бюджетування

- **Модуль усунення несправностей**
  - Поширені проблеми: Часто виникаючі помилки та їх вирішення
  - Посібник з налагодження: Систематичні методики усунення проблем
  - Розширені діагностичні техніки й інструменти
  - Моніторинг продуктивності та оптимізація

- **Ресурси та довідки**
  - Шпаргалка команд: Швидкий довідник по основних командах
  - Глосарій: Всеохопні визначення термінів і абревіатур
  - FAQ: Детальні відповіді на розповсюджені питання
  - Посилання на зовнішні ресурси та спільнотні зв’язки

- **Приклади та шаблони**
  - Простий приклад веб-застосунку
  - Шаблон розгортання статичного сайту
  - Конфігурація контейнерного додатку
  - Патерни інтеграції баз даних
  - Приклади мікросервісної архітектури
  - Реалізації безсерверних функцій

#### Особливості
- **Підтримка мультиплатформеності**: Посібники з встановлення та налаштування для Windows, macOS і Linux
- **Різні рівні складності**: Контент для студентів та професійних розробників
- **Практичний підхід**: Практичні приклади і реальні сценарії
- **Всеохопність**: Від базових понять до корпоративних складних патернів
- **Підхід "безпека на першому місці"**: Вбудовані кращі практики безпеки
- **Оптимізація вартості**: Керівництво з ефективного управління ресурсами та бюджетом

#### Якість документації
- **Детальні приклади коду**: Практичні, протестовані зразки коду
- **Покрокові інструкції**: Чіткі та дієві поради
- **Всеохопне оброблення помилок**: Усунення поширених проблем
- **Інтеграція кращих практик**: Відповідність галузевим стандартам і рекомендаціям
- **Сумісність версій**: Оновлення згідно із останніми сервісами Azure та можливостями azd

## Заплановані майбутні покращення

### Версія 3.1.0 (Запланована)
#### Розширення AI платформи
- **Підтримка мульти-моделей**: Патерни інтеграції для Hugging Face, Azure Machine Learning та власних моделей
- **Фреймворки AI агентів**: Шаблони для розгортання LangChain, Semantic Kernel і AutoGen
- **Розширені RAG патерни**: Векторові бази даних поза Azure AI Search (Pinecone, Weaviate тощо)
- **Обсервабельність AI**: Покращений моніторинг продуктивності моделей, використання токенів і якості відповідей

#### Досвід розробника
- **Розширення VS Code**: Інтегрований досвід розробки AZD + Microsoft Foundry 
- **Інтеграція GitHub Copilot**: Генерація шаблонів AZD за допомогою AI
- **Інтерактивні навчальні посібники**: Практичні вправи з автоматизованою перевіркою для AI сценаріїв
- **Відеоматеріали**: Допоміжні відеоуроки для візуальних учнів із фокусом на AI розгортання

### Версія 4.0.0 (Запланована)
#### Корпоративні AI патерни
- **Фреймворк управління**: Управління моделями AI, відповідність та аудити
- **Мульти-орендний AI**: Патерни обслуговування багатьох клієнтів із ізольованими AI сервісами
- **Edge AI розгортання**: Інтеграція з Azure IoT Edge та контейнерними інстанціями
- **Гібридний хмарний AI**: Патерни мультихмарного та гібридного розгортання AI навантажень

#### Просунуті можливості
- **Автоматизація AI пайплайнів**: Інтеграція MLOps з пайплайнами Azure Machine Learning
- **Просунута безпека**: Патерни zero-trust, приватні кінцеві точки та захист від складних загроз
- **Оптимізація продуктивності**: Поглиблене налаштування та масштабування для високопродуктивних AI додатків
- **Глобальний розподіл**: Патерни доставки контенту та edge кешування для AI застосунків

### Версія 3.0.0 (Запланована) - Застаріла, замінена поточним релізом
#### Запропоновані доповнення - Реалізовані у v3.0.0
- ✅ **AI-орієнтований контент**: Всеохопна інтеграція Microsoft Foundry (завершено)
- ✅ **Інтерактивні навчання**: Практичний AI воркшоп (завершено)
- ✅ **Модуль просунутої безпеки**: AI-специфічні патерни безпеки (завершено)
- ✅ **Оптимізація продуктивності**: Стратегії налаштування AI навантажень (завершено)

### Версія 2.1.0 (Запланована) - Частково реалізована у v3.0.0
#### Невеликі покращення - Частково завершені у поточному релізі
- ✅ **Додаткові приклади**: AI-орієнтовані сценарії розгортання (завершено)
- ✅ **Розширене FAQ**: AI-специфічні питання та усунення несправностей (завершено)
- **Інтеграція інструментів**: Покращені посібники для IDE та редакторів коду
- ✅ **Розширений моніторинг**: AI-специфічні патерни моніторингу та сповіщень (завершено)

#### Ще заплановано для майбутніх релізів
- **Мобільна адаптивність документації**: Адаптивний дизайн для мобільного навчання
- **Оффлайн доступ**: Завантажувані пакети документації
- **Покращена інтеграція IDE**: Розширення VS Code для AZD + AI робочих процесів
- **Панель спільноти**: Метрики спільноти в реальному часі та відстеження внесків

## Внесок до журналу змін

### Звітування про зміни
При внеску у цей репозиторій просимо переконатися, що записи в журналі змін включають:

1. **Номер версії**: З дотриманням семантичного версіювання (major.minor.patch)
2. **Дата**: Дата релізу або оновлення у форматі РРРР-ММ-ДД
3. **Категорія**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Чіткий опис**: Короткий опис змін
5. **Оцінка впливу**: Як зміни впливають на існуючих користувачів

### Категорії змін

#### Додано
- Нові функції, розділи документації або можливості
- Нові приклади, шаблони або навчальні ресурси
- Додаткові інструменти, скрипти або утиліти

#### Змінено
- Зміни у наявній функціональності чи документації
- Оновлення для покращення ясності або точності
- Перебудова контенту або організації

#### Застаріло
- Функції або підходи, що виводяться з використання
- Розділи документації, заплановані для видалення
- Методи, які мають кращі альтернативи

#### Видалено
- Функції, документація або приклади, що більше не актуальні
- Застаріла інформація або застарілі підходи
- Надлишковий або об’єднаний контент

#### Виправлено
- Виправлення помилок у документації або коді
- Розв’язання повідомлених проблем
- Покращення точності або функціональності

#### Безпека
- Покращення або виправлення, пов’язані з безпекою
- Оновлення кращих практик безпеки
- Виправлення вразливостей безпеки

### Керівництво з семантичного версіювання

#### Основна версія (X.0.0)
- Руйнівні зміни, що вимагають дій користувача
- Значна перебудова контенту або організації
- Зміни, що змінюють фундаментальний підхід або методологію

#### Мала версія (X.Y.0)
- Нові функції або доповнення контенту
- Поліпшення з підтримкою зворотної сумісності
- Додаткові приклади, інструменти або ресурси

#### Патч-версія (X.Y.Z)
- Виправлення помилок та корекції
- Невеликі покращення існуючого контенту
- Роз’яснення і маленькі доповнення

## Відгуки та пропозиції спільноти

Ми активно заохочуємо відгуки спільноти для покращення цього навчального ресурсу:

### Як надати відгук
- **GitHub Issues**: Повідомляти про проблеми або пропонувати покращення (AI-специфічні питання вітаються)
- **Discord обговорення**: Обмінюватися ідеями та взаємодіяти зі спільнотою Microsoft Foundry
- **Pull Requests**: Вносити прямі покращення контенту, особливо AI шаблонів та посібників
- **Microsoft Foundry Discord**: Брати участь у каналі #Azure для дискусій AZD + AI
- **Форуми спільноти**: Брати участь у ширших обговореннях розробників Azure

### Категорії відгуків
- **Точність AI контенту**: Корекції інформації про інтеграцію та розгортання AI сервісів
- **Досвід навчання**: Пропозиції для покращення потоків навчання AI розробників
- **Відсутній AI контент**: Запити на додаткові AI шаблони, патерни або приклади
- **Доступність**: Покращення для різноманітних навчальних потреб
- **Інтеграція AI інструментів**: Пропозиції для кращої інтеграції робочих процесів AI розробки
- **Патерни продуктивного AI**: Запити корпоративних патернів розгортання AI

### Зобов’язання щодо відповіді
- **Відповідь на проблеми**: Протягом 48 годин на повідомлені проблеми
- **Запити на функції**: Оцінка протягом тижня
- **Внески спільноти**: Перегляд протягом тижня
- **Питання безпеки**: Пріоритетне оперативне реагування

## Графік обслуговування

### Регулярні оновлення
- **Щомісячні перевірки**: Точність контенту та валідація посилань
- **Щоквартальні оновлення**: Основні доповнення та покращення контенту
- **Піврічні перевірки**: Всеохопна перебудова та розширення
- **Щорічні релізи**: Оновлення основних версій з важливими покращеннями

### Моніторинг та забезпечення якості
- **Автоматизоване тестування**: Регулярна перевірка прикладів коду та посилань
- **Інтеграція відгуків спільноти**: Регулярне врахування пропозицій користувачів
- **Оновлення технологій**: Відповідність останнім сервісам Azure та випускам azd
- **Аудити доступності**: Регулярний перегляд принципів інклюзивного дизайну 

## Політика підтримки версій

### Підтримка поточної версії
- **Остання основна версія**: Повна підтримка з регулярними оновленнями
- **Попередня основна версія**: Оновлення безпеки та критичних виправлень протягом 12 місяців
- **Старі версії**: Підтримка спільноти, офіційних оновлень немає

### Керівництво з міграції
Коли виходять основні версії, ми надаємо:
- **Посібники з міграції**: Покрокові інструкції для переходу
- **Нотатки про сумісність**: Деталі про серйозні зміни
- **Підтримка інструментів**: Скрипти або утиліти для допомоги у міграції
- **Підтримка спільноти**: Спеціалізовані форуми для запитань щодо міграції

---

**Навігація**
- **Попередній урок**: [Посібник для вивчення](resources/study-guide.md)
- **Наступний урок**: Повернутися до [Головного README](README.md)

**Будьте в курсі**: Слідкуйте за цим репозиторієм, щоб отримувати повідомлення про нові випуски та важливі оновлення навчальних матеріалів.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->