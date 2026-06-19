# Журнал змін - AZD для початківців

## Вступ

Цей журнал змін документує всі помітні зміни, оновлення та покращення у репозиторії AZD для початківців. Ми дотримуємося принципів семантичного версіонування і підтримуємо цей лог, щоб допомогти користувачам зрозуміти, що змінилося між версіями.

## Навчальні цілі

Переглядаючи цей журнал змін, ви зможете:
- Бути в курсі нових функцій та додавання контенту
- Розуміти покращення, внесені до існуючої документації
- Відслідковувати виправлення помилок та корекції для забезпечення точності
- Слідувати за розвитком навчальних матеріалів у часі

## Результати навчання

Після перегляду записів у журналі змін ви зможете:
- Ідентифікувати новий контент і ресурси для навчання
- Розуміти, які розділи оновлено або покращено
- Планувати свій навчальний шлях на основі найактуальніших матеріалів
- Вносити відгуки та пропозиції для майбутніх покращень

## Історія версій

### [v3.22.0] - 2026-06-16

#### Доповнення для початківців #2: Авторинг шаблонів, Dev Containers, Pulumi, Azure DevOps, сервісні принципали та інше
**Ця версія закриває залишкові проміжні прогалини, виявлені аналізом azd-coverage: як створювати й публікувати власний шаблон, відтворювані dev-container/Codespaces середовища, провайдер інфраструктури Pulumi, огляд CI/CD в Azure DevOps, автентифікація сервісних принципалів, керівництво з вибору хостів (AKS/Spring Apps), пояснення `azd restore`/`azd package`, обробка помилок хуків та практики командної/спільної роботи зі середовищами.**

#### Додано
- **🧱 Новий урок Розділу 4** `docs/chapter-04-infrastructure/custom-templates.md` — створення власного шаблону azd: необхідна структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризація інфраструктури з використанням токена ресурсу `uniqueString()` та тегу `azd-env-name`, локальне тестування з `azd init --template <local-path>`, публікація на GitHub та подача до галереї Awesome AZD
- **📦 Новий урок Розділу 1** `docs/chapter-01-foundation/dev-containers.md` — відтворювані середовища azd з Dev Containers та GitHub Codespaces: мінімальний `.devcontainer/devcontainer.json` з офіційною функцією `ghcr.io/azure/azure-dev/azd`, мови програмування, `docker-in-docker` для контейнерних хостів, та `azd auth login --use-device-code` для віддаленого входу
- **🧩 Розділ Pulumi з azd** в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура папок Pulumi, стеки, зв’язані з середовищами azd, необхідні вихідні дані/теги та ідентичний робочий процес `azd up` / `azd down`
- **🎯 Керівництво з вибору хостів** в `docs/chapter-04-infrastructure/provisioning.md` — дружнє для початківців порівняння `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` та `springapp` з рекомендаціями, коли обрати AKS або Azure Spring Apps
- **🛠️ Огляд CI/CD Azure DevOps** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, підключення сервісів з федерацією ідентифікаторів (OIDC), згенерований `azure-dev.yml` та налаштування змінних груп
- **🔑 Сервісні принципали (Патерн 4)** додані в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неінтерактивний `azd auth login` з клієнтським секретом проти федеративних/OIDC облікових даних, коли використовувати, та безпечне зберігання облікових даних
- **🪝 Обробка помилок хуків** у розділі `docs/chapter-04-infrastructure/deployment-guide.md` — коди виходу та `set -e`, `continueOnError`, тестування хуків окремо з `azd hooks run`, оболонки ОС і `--debug`
- **👥 Командні/спільні середовища** в `docs/chapter-03-configuration/configuration.md` — що зберігається в `.azure/`, що ігнорувати в git, середовища для кожного розробника, `azd env list`/`select` та надання значень середовища у CI/CD
- **🧰 Пояснення `azd restore` та розширеного `azd package`** у `resources/cheat-sheet.md` — відновлення залежностей і створення артефакту для розгортання без розгортання

#### Змінено
- **🧭 Таблиця уроків Розділу 4** оновлена з додаванням нового уроку "Авторинг Власного Шаблону" (Урок 3)
- **🧭 Таблиця уроків Розділу 1** оновлена з додаванням нового уроку "Dev Containers & Codespaces" (Урок 5); навігаційні футери пов’язані між `bring-your-own-app.md` та `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заповнення прогалин для початківців: Практичний урок з мультиагентами, "Принеси свою аплікацію", Terraform та огляд CI/CD
**Ця версія закриває найбільші прогалини для повного керівництва для початківців, додаючи два нові практичні уроки (повноцінний мультиагентний огляд та додавання azd у існуючий додаток), дружнє для початківців знайомство з хуками, розділ Terraform з azd, поетапний огляд pipeline GitHub Actions, пояснювач нових попередніх розширень та явний чекліст перевірки розгортання.**

#### Додано
- **🤝 Новий урок Розділу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — повністю практичний, розгортальний двоагентний огляд (оркестратор + спеціалісти) на основі реального шаблону (`contoso-creative-writer`), охоплює коли використовувати мультиагент, робочий процес `azd up`, розуміння розгорнутих ресурсів, трасування між агентами, кастомізацію та очищення
- **📦 Новий урок Розділу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — як додати azd до існуючого проєкту за допомогою `azd init` ("використовуйте код у поточній директорії"), розуміння `azure.yaml` і `infra/`, `azd infra generate`, виявлення хоста та розгортання з `azd up`
- **🌐 Розділ Terraform з azd** додано в `docs/chapter-04-infrastructure/provisioning.md` — конфігурація `infra.provider: terraform`, структура папки `.tf`, потрібні вихідні дані `AZURE_*` та тегування `azd-env-name`, ідентичний робочий процес `azd up` / `azd down` (закриває прогалину, де Terraform був заявлений, але показаний був лише Bicep)
- **⚙️ Поетапний огляд GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — від репозиторію GitHub до автоматичних деплоїв: `azd pipeline config`, федеративні креденшали OIDC (без збережених секретів), згенерований `azure-dev.yml` та керівництво по секретах та змінних
- **🪝 Вступ для початківців "Новачок у хуках?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — що таке хук, таблиця стадій хуків, мінімальний перший хук та запуск хуків вручну з `azd hooks run`
- **✅ Чекліст "Перевірте своє розгортання"** додано до кроку 5 у `docs/chapter-01-foundation/first-project.md` — smoke test, перевірка health-endpoint і явні критерії успішності
- **🧩 Пояснювач нових попередніх розширень** `azure.ai.skills` та `azure.ai.connections` (що вони і коли їх використовувати) в `docs/chapter-08-production/production-ai-practices.md`

#### Змінено
- **🧭 Таблиця уроків Розділу 5** виправлена: `multi-agent-basics.md` тепер Урок 1 (єдиний повністю практичний урок), з чесною позначкою, що Урок 2 знаходиться у Розділі 6, а сценарій Retail — це архітектурний шаблон, а не шаблон в один клік
- **🧭 Таблиця уроків Розділу 1** тепер включає новий урок "Принеси свою аплікацію" (Урок 4)
- **🔗 Навігаційні футери** оновлені: `first-project.md` тепер посилається вперед на `bring-your-own-app.md`

#### Виправлено
- **🧱 Закрито "заявлену, але відсутню" Terraform прогалину** — курс раніше посилався на підтримку Terraform, не показуючи її
- **🔀 Виправлено оманливі міжглавні посилання Розділу 5**, які натякали на наявність повної мультиагентної реалізації, коли існував лише архітектурний шаблон

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

#### Оновлення AZD до 1.25.6, Повний життєвий цикл агента & ребрендинг Aspire
**Ця версія повторно валідує курс щодо `azd` `1.25.6` (червень 2026) та розширення `azure.ai.agents` `0.1.40-preview`, розширює керівництво по ИІ від "створення агента" до повного життєвого циклу агента (тест → оцінка → оптимізація → інспекція → видалення), представляє нові попередні розширення `azure.ai.skills` та `azure.ai.connections` і повідомляє про ребрендинг продукту з ".NET Aspire" на "Aspire".**

#### Додано
- **🔁 Повне охоплення життєвого циклу агента** для початківців і AI-інженерів по документації:
  - `docs/chapter-01-foundation/azd-basics.md` — додана таблиця життєвого циклу (створення → тестування → вимірювання → покращення → інспекція → очищення) в розділ Розширень та AI команд
  - `docs/chapter-08-production/production-ai-practices.md` — новий розділ "Управління життєвим циклом агента", що охоплює `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` та `delete --force`
  - `resources/cheat-sheet.md` — розширені команди AI агента з `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` та `delete --force`
- **🧩 Документовані нові попередні розширення**: `azure.ai.skills` (повторно використовувані навички агента) та `azure.ai.connections` (підключення Foundry) додані до таблиці розширень та шорт-листа команд
- **⏱️ Керівництво по часу відповіді** — приклади `azd ai agent invoke` тепер інформують про загальну затримку та час до першого байта
- **📌 Банер версії** у кореневому README, який орієнтує користувачів на `azd version` та `azd upgrade`

#### Змінено
- **✅ Оновлено базову лінію валідації** з `azd 1.23.12` (березень 2026) на `azd 1.25.6` (червень 2026) у всіх README розділів та документації воркшопу
- **🤖 Оновлено примітку розширення в Розділі 2** з `azure.ai.agents` `0.1.18-preview` до `0.1.40-preview`
- **🧪 Оновлено приклад валідації воркшопу** (вивід `azd version`) до `1.25.6`
- **🧭 Оновлено README "Що нового в azd сьогодні"** для підкреслення повного життєвого циклу агента, нових AI-розширень і останніх поліпшень якості життя (`azd init` ідемпотентність, очищення застарілих токенів у `azd auth login`, підказка першого запуску `azd tool`)
- **📖 Розділ 2 agents.md (Опція 4)** тепер направляє користувачів до команд життєвого циклу після розгортання, а не зупиняється на `azd up`

#### Виправлено
- **🏷️ Назва продукту** — додано примітку про ребрендинг Aspire (".NET Aspire" тепер просто "Aspire"); підтримка Aspire в azd не змінилася
- **🔎 Підтверджена валідація живого релізу** згідно з Azure Developer CLI релізним фідом: стабільний CLI `1.25.6` (2026-06-12) та `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
**Ця версія доповнює перевірку AZD 1.23 документацією, орієнтованою на початківців: роз’яснює рекомендації щодо автентифікації через AZD як перший крок, додає скрипти для локальної перевірки налаштувань, перевіряє ключові команди на відповідність актуальному CLI AZD та видаляє останні застарілі англомовні посилання на команди поза журналом змін.**

#### Додано  
- **🧪 Скрипти для перевірки налаштувань початківців** `validate-setup.ps1` та `validate-setup.sh`, щоб користувачі могли підтвердити наявність потрібних інструментів перед початком глави 1  
- **✅ Попередні кроки перевірки налаштувань** у кореневому README та README глави 1, щоб відсутні попередні умови були виявлені до команди `azd up`  

#### Змінено  
- **🔐 Рекомендації з автентифікації для початківців** тепер послідовно розглядають `azd auth login` як основний шлях для робочих процесів AZD, при цьому `az login` згадується як опціональний, якщо безпосередньо використовуються команди Azure CLI  
- **📚 Потік вступного навчання в главі 1** тепер направляє користувачів до перевірки локальних налаштувань ще до встановлення, автентифікації та перших кроків розгортання  
- **🛠️ Повідомлення валідатора** чітко розділяють вимоги, які блокують виконання, від необов’язкових попереджень Azure CLI для шляху початківця, що використовує тільки AZD  
- **📖 Документація з конфігурації, усунення несправностей та прикладів** тепер розрізняє обов’язкову автентифікацію AZD та опціональний вхід через Azure CLI, де раніше вони подавалися без контексту  

#### Виправлено  
- **📋 Застарілі англомовні посилання на команди** оновлено до сучасних форм AZD, включно з `azd config show` в шпаргалці та `azd monitor --overview` там, де мала бути вказівка щодо огляду в Azure Portal  
- **🧭 Заявлення для початківців у главі 1** пом’якшено, щоб уникнути надмірних обіцянок гарантованої відсутності помилок або поведінки відкотів для всіх шаблонів і ресурсів Azure  
- **🔎 Жива перевірка CLI** підтвердила актуальну підтримку `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` та `azd down --force --purge`  

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
**Ця версія проводить перевірку документації щодо `azd` `1.23.12`, оновлює застарілі приклади команд AZD, оновлює керівництво по моделях ШІ до актуальних налаштувань за замовчуванням та розширює інструкції воркшопу за межі GitHub Codespaces, щоб також підтримувати dev-контейнери та локальні копії.**

#### Додано  
- **✅ Примітки з валідації у основних главах та документації воркшопу**, щоб зробити явною тестовану базову версію AZD для користувачів старіших або новіших збірок CLI  
- **⏱️ Керівництво з таймаутів розгортання** для довготривалих розгортань AI-додатків за допомогою `azd deploy --timeout 1800`  
- **🔎 Кроки для перевірки розширень** за допомогою `azd extension show azure.ai.agents` у документації по AI робочому процесу  
- **🌐 Розширене керівництво з середовищ воркшопу**, що охоплює GitHub Codespaces, dev-контейнери та локальні копії з MkDocs  

#### Змінено  
- **📚 README інтро в главах** тепер послідовно зазначають валідацію проти `azd 1.23.12` у секціях foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting і production  
- **🛠️ Посилання на команди AZD** оновлено до сучасних форм у документації:  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` або `azd env get-value(s)` залежно від контексту  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview`, де потрібен огляд Application Insights  
- **🧪 Приклади провізії для попереднього перегляду** спрощено до підтримуваного на даний момент використання, такого як `azd provision --preview` і `azd provision --preview -e production`  
- **🧭 Потік воркшопу** оновлено, щоб учні могли виконувати лабораторні роботи у Codespaces, dev контейнері або локальній копії замість припущення роботи лише в Codespaces  
- **🔐 Рекомендації з автентифікації** тепер віддають перевагу `azd auth login` для робочих процесів AZD, а `az login` позиціонується як опціональний, коли команди Azure CLI використовуються безпосередньо  

#### Виправлено  
- **🪟 Команди інсталяції для Windows** нормалізовано з урахуванням поточних стандартів регістру пакета `winget` у посібнику зі встановлення  
- **🐧 Керівництво для Linux** виправлено, щоб уникнути некоректних інструкцій по встановленню дистрибутив-специфічного пакета `azd` і замість цього вказувати на релізні артефакти там, де це доречно  
- **📦 Приклади моделей AI** оновлено зі старих значень на кшталт `gpt-35-turbo` і `text-embedding-ada-002` до сучасних, таких як `gpt-4.1-mini`, `gpt-4.1` і `text-embedding-3-large`  
- **📋 Фрагменти коду з розгортання та діагностики** виправлено для використання актуальних команд оточення і статусу у логах, скриптах і кроках усунення несправностей  
- **⚙️ Керівництво GitHub Actions** оновлено з `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`  
- **🤖 Керівництво з MCP/Copilot consent** оновлено з `azd mcp consent` на `azd copilot consent list`  

#### Покращено  
- **🧠 Керівництво по AI у главі** тепер краще роз'яснює чутливу до попереднього перегляду поведінку `azd ai`, входи для конкретних орендарів, актуальне використання розширень і оновлені рекомендації щодо розгортання моделей  
- **🧪 Інструкції воркшопу** тепер використовують реалістичніші приклади версій та чіткішу мову для налаштування середовища у практичних лабораторіях  
- **📈 Документація для продакшну і усунення несправностей** тепер краще узгоджена з поточними прикладами моніторингу, моделей резервного копіювання та рівнів вартості  

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
**Ця версія додає покриття команд `azd ai`, `azd extension` та `azd mcp` у всіх главах, пов’язаних із AI, виправляє непрацюючі посилання та застарілий код у agents.md, оновлює шпаргалку та повністю оновлює розділ прикладів шаблонів з перевіреними описами й новими шаблонами Azure AI AZD.**

#### Додано  
- **🤖 Покриття команд AZD AI CLI** у 7 файлах (раніше лише у главі 8):  
  - `docs/chapter-01-foundation/azd-basics.md` — новий розділ "Розширення та команди AI", що вводить `azd extension`, `azd ai agent init` та `azd mcp`  
  - `docs/chapter-02-ai-development/agents.md` — Варіант 4: `azd ai agent init` з таблицею порівняння (підхід шаблону проти маніфесту)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — підрозділи "Розширення AZD для Foundry" та "Деплоймент із пріоритетом агента"  
  - `docs/chapter-05-multi-agent/README.md` — Швидкий старт тепер показує обидва шляхи деплойменту: на основі шаблону та маніфесту  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — розділ “Deploy” тепер включає варіант `azd ai agent init`  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — підрозділ "Команди розширення AZD AI для діагностики"  
  - `resources/cheat-sheet.md` — новий розділ "Команди AI і розширень" із командами `azd extension`, `azd ai agent init`, `azd mcp` та `azd infra generate`  
- **📦 Нові приклади шаблонів AZD AI** у `microsoft-foundry-integration.md`:  
  - **azure-search-openai-demo-csharp** — RAG чат на .NET з Blazor WebAssembly, Semantic Kernel та підтримкою голосового чату  
  - **azure-search-openai-demo-java** — RAG чат на Java за допомогою Langchain4J з варіантами розгортання на ACA/AKS  
  - **contoso-creative-writer** — мультиагентський додаток творчого письма з Azure AI Agent Service, Bing Grounding та Prompty  
  - **serverless-chat-langchainjs** — безсерверний RAG із Azure Functions + LangChain.js + Cosmos DB із підтримкою локальної розробки Ollama  
  - **chat-with-your-data-solution-accelerator** — підприємницький прискорювач RAG з адмініструванням, інтеграцією Teams і опціями PostgreSQL/Cosmos DB  
  - **azure-ai-travel-agents** — мультиагентська референсна MCP-оркестрація з серверами на .NET, Python, Java та TypeScript  
  - **azd-ai-starter** — мінімальний стартовий шаблон інфраструктури Azure AI на Bicep  
  - **🔗 Посилання на галерею Awesome AZD AI** — Референс до [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ шаблонів)  

#### Виправлено  
- **🔗 Навігація agents.md:** посилання «Попередня»/«Наступна» тепер відповідають порядку уроків README глави 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)  
- **🔗 Поламані посилання в agents.md:** `production-ai-practices.md` виправлено на `../chapter-08-production/production-ai-practices.md` (3 влучення)  
- **📦 Застарілий код в agents.md:** `opencensus` замінено на `azure-monitor-opentelemetry` + SDK OpenTelemetry  
- **🐛 Невалідний API в agents.md:** параметр `max_tokens` переміщено з `create_agent()` в `create_run()` як `max_completion_tokens`  
- **🔢 Підрахунок токенів в agents.md:** замінено наближену оцінку `len//4` на `tiktoken.encoding_for_model()`  
- **azure-search-openai-demo:** виправлено опис сервісів з "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (за замовчуванням зміна господаря у жовтні 2024)  
- **contoso-chat:** оновлено опис на відповідність Azure AI Foundry + Prompty, що відповідає фактичній назві репозиторію та стеку технологій  

#### Видалено  
- **ai-document-processing:** видалено посилання на нефункціональний шаблон (репозиторій недоступний публічно як AZD шаблон)  

#### Покращено  
- **📝 Вправи в agents.md:** Вправа 1 тепер показує очікуваний вивід і крок `azd monitor`; Вправа 2 включає повний код реєстрації `FunctionTool`; Вправа 3 замінює нечіткі рекомендації конкретними командами `prepdocs.py`  
- **📚 Ресурси в agents.md:** оновлено посилання на документацію щодо Azure AI Agent Service та швидкий старт  
- **📋 Таблиця наступних кроків у agents.md:** додано посилання на AI Workshop Lab для повного покриття глави  

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
**Ця версія покращує навігацію по розділах README.md за допомогою вдосконаленої таблиці.**

#### Змінено
- **Таблиця карти курсу**: Покращена з прямими посиланнями на уроки, оцінками тривалості та складності
- **Прибирання папок**: Видалено зайві старі папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Перевірка посилань**: Перевірено всі 21+ внутрішніх посилань у таблиці карти курсу

### [v3.16.0] - 2026-02-05

#### Оновлення назв продуктів
**Ця версія оновлює посилання на продукти відповідно до поточного брендингу Microsoft.**

#### Змінено
- **Microsoft Foundry → Microsoft Foundry**: Всі посилання оновлені у файлах, окрім перекладів
- **Azure AI Agent Service → Foundry Agents**: Оновлено назву сервісу для відображення поточного брендингу

#### Оновлені файли
- `README.md` - Головна сторінка курсу
- `changelog.md` - Історія версій
- `course-outline.md` - Структура курсу
- `docs/chapter-02-ai-development/agents.md` - Посібник по агентам AI
- `examples/README.md` - Документація прикладів
- `workshop/README.md` - Головна сторінка воркшопу
- `workshop/docs/index.md` - Індекс воркшопу
- `workshop/docs/instructions/*.md` - Усі файли інструкцій воркшопу

---

### [v3.15.0] - 2026-02-05

#### Велика реструктуризація репозиторію: Папки за главами
**Ця версія реорганізовує документацію у спеціальні папки за главами для полегшення навігації.**

#### Перейменування папок
Старі папки замінені на папки з номерами глав:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додано нову: `docs/chapter-05-multi-agent/`

#### Міграція файлів
| Файл | Звідки | Куди |
|------|-------|------|
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
- **📚 README файли для глав**: Створено README.md у кожній папці глави з:
  - Навчальними цілями та тривалістю
  - Таблицею уроків з описами
  - Командами швидкого старту
  - Навігацією до інших глав

#### Змінено
- **🔗 Оновлено всі внутрішні посилання**: Оновлено понад 78 шляхів у всіх документах
- **🗺️ Основний README.md**: Оновлено карту курсу з новою структурою глав
- **📝 examples/README.md**: Оновлено перехресні посилання на папки глав

#### Видалено
- Стару структуру папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризація репозиторію: Навігація за главами
**У цій версії додано README файли навігації за главами (замінено версією v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новий посібник AI агентів
**У цій версії додано всебічний посібник з розгортання AI агентів за допомогою Azure Developer CLI.**

#### Додано
- **🤖 docs/microsoft-foundry/agents.md**: Повний посібник, що охоплює:
  - Що таке AI агенти і чим вони відрізняються від чатботів
  - Три шаблони швидкого старту агентів (Foundry Agents, Prompty, RAG)
  - Патерни архітектури агентів (одиночний агент, RAG, мультиагент)
  - Конфігурація та налаштування інструментів
  - Моніторинг і відстеження метрик
  - Вартість і оптимізація
  - Часті проблеми і їх усунення
  - Три практичні вправи з критеріями успіху

#### Структура контенту
- **Вступ**: Концепції агентів для початківців
- **Швидкий старт**: Розгортання агентів за допомогою `azd init --template get-started-with-ai-agents`
- **Патерни архітектури**: Візуальні діаграми патернів агентів
- **Конфігурація**: Налаштування інструментів та змінні середовища
- **Моніторинг**: Інтеграція з Application Insights
- **Вправи**: Поступове практичне навчання (20-45 хвилин кожне)

---

### [v3.12.0] - 2026-02-05

#### Оновлення середовища DevContainer
**Ця версія оновлює конфігурацію контейнера розробника з сучасними інструментами та кращими налаштуваннями для AZD навчального досвіду.**

#### Змінено
- **🐳 Базовий образ**: Оновлено з `python:3.12-bullseye` на `python:3.12-bookworm` (остання стабільна версія Debian)
- **📛 Назва контейнера**: Змінено з "Python 3" на "AZD for Beginners" для ясності

#### Додано
- **🔧 Нові можливості Dev Container**:
  - `azure-cli` з увімкненою підтримкою Bicep
  - `node:20` (версія LTS для шаблонів AZD)
  - `github-cli` для управління шаблонами
  - `docker-in-docker` для розгортання контейнерних додатків

- **🔌 Проброс портів**: Попередньо налаштовані порти для загальної розробки:
  - 8000 (перегляд MkDocs)
  - 3000 (веб-додатки)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Розширення VS Code**:
  - `ms-python.vscode-pylance` - Покращений Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Підтримка Azure Functions
  - `ms-azuretools.vscode-docker` - Підтримка Docker
  - `ms-azuretools.vscode-bicep` - Підтримка Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управління ресурсами Azure
  - `yzhang.markdown-all-in-one` - Редагування Markdown
  - `DavidAnson.vscode-markdownlint` - Лінтинг Markdown
  - `bierner.markdown-mermaid` - Підтримка діаграм Mermaid
  - `redhat.vscode-yaml` - Підтримка YAML (для azure.yaml)
  - `eamodio.gitlens` - Візуалізація Git
  - `mhutchie.git-graph` - Історія Git

- **⚙️ Налаштування VS Code**: Додані стандартні налаштування для інтерпретатора Python, форматування при збереженні, обрізання пропусків

- **📦 Оновлено requirements-dev.txt**:
  - Додано плагін для мінімізації MkDocs
  - Додано pre-commit для якості коду
  - Додано пакети Azure SDK (azure-identity, azure-mgmt-resource)

#### Виправлено
- **Post-Create Command**: Тепер перевіряє встановлення AZD та Azure CLI при запуску контейнера

---

### [v3.11.0] - 2026-02-05

#### Переробка README для початківців
**Ця версія значно покращує README.md, роблячи його більш доступним для новачків, та додає важливі ресурси для AI-розробників.**

#### Додано
- **🆚 Порівняння Azure CLI та AZD**: Чітке пояснення коли і який інструмент використовувати з практичними прикладами
- **🌟 Круті посилання AZD**: Прямі посилання на галерею шаблонів спільноти та ресурси для внеску:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ готових шаблонів
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - внесок спільноти
- **🎯 Посібник швидкого старту**: Спрощений розділ з 3 кроками (Встановити → Увійти → Розгорнути)
- **📊 Навігаційна таблиця за досвідом**: Чіткі рекомендації, з чого починати залежно від досвіду розробника

#### Змінено
- **Структура README**: Реформатована для поступового розкриття — ключова інформація спершу
- **Розділ вступу**: Переписаний для пояснення "Магії `azd up`" для новачків
- **Видалено дублікати**: Усунено дублікований розділ усунення неполадок
- **Команди усунення неполадок**: Виправлено посилання `azd logs` на робочий `azd monitor --logs`

#### Виправлено
- **🔐 Команди автентифікації**: Додано `azd auth login` та `azd auth logout` до cheat-sheet.md
- **Неправильні посилання на команди**: Видалено решту `azd logs` з розділу усунення неполадок README

#### Примітки
- **Обсяг**: Зміни застосовані до основного README.md та resources/cheat-sheet.md
- **Цільова аудиторія**: Покращення орієнтовані на розробників, нових для AZD

---

### [v3.10.0] - 2026-02-05

#### Оновлення точності команд Azure Developer CLI
**Ця версія виправляє неіснуючі команди AZD у всій документації, забезпечуючи використання тільки валідного синтаксису Azure Developer CLI.**

#### Виправлено
- **🔧 Видалено неіснуючі команди AZD**: Комплексна перевірка та виправлення недійсних команд:
  - `azd logs` (не існує) → замінено на `azd monitor --logs` або альтернативи Azure CLI
  - Підкоманди `azd service` (не існують) → замінено на `azd show` та Azure CLI
  - `azd infra import/export/validate` (не існують) → видалено або замінено на валідні альтернативи
  - Прапори `azd deploy --rollback/--incremental/--parallel/--detect-changes` (неіснуючі) → видалено
  - Прапори `azd provision --what-if/--rollback` (неіснуючі) → оновлено на `--preview`
  - `azd config validate` (не існує) → замінено на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (неіснуючі) → видалено

- **📚 Оновлені файли з виправленнями команд**:
  - `resources/cheat-sheet.md`: Великий перегляд довідки команд
  - `docs/deployment/deployment-guide.md`: Виправлення стратегій відкату та розгортання
  - `docs/troubleshooting/debugging.md`: Виправлення розділів аналізу логів
  - `docs/troubleshooting/common-issues.md`: Оновлення команд усунення неполадок
  - `docs/troubleshooting/ai-troubleshooting.md`: Виправлення розділу AZD debug
  - `docs/getting-started/azd-basics.md`: Виправлення команд моніторингу
  - `docs/getting-started/first-project.md`: Оновлення прикладів моніторингу та діагностики
  - `docs/getting-started/installation.md`: Виправлення прикладів help та версії
  - `docs/pre-deployment/application-insights.md`: Виправлення команд перегляду логів
  - `docs/pre-deployment/coordination-patterns.md`: Виправлення команд дебагу агентів

- **📝 Оновлення посилання на версію**:
  - `docs/getting-started/installation.md`: Змінено жорстко закодовану версію `1.5.0` на загальну `1.x.x` з посиланням на релізи

#### Змінено
- **Стратегії відкату**: Оновлено документацію для використання відкату на основі Git (AZD не має власного відкату)
- **Перегляд логів**: Заміна посилань `azd logs` на `azd monitor --logs`, `azd monitor --live` та команди Azure CLI
- **Розділ продуктивності**: Видалено неіснуючі прапори паралельного/інкрементного розгортання, надано діючі альтернативи

#### Технічні деталі
- **Дійсні команди AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Дійсні прапори azd monitor**: `--live`, `--logs`, `--overview`
- **Видалені функції**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Примітки
- **Перевірка**: Команди перевірені на Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершення воркшопу і покращення якості документації
**Ця версія завершує інтерактивні модулі воркшопу, виправляє всі пошкоджені посилання в документації та покращує загальну якість контенту для AI-розробників, які використовують Microsoft AZD.**

#### Додано
- **📝 CONTRIBUTING.md**: Новий документ з керівництвом для внеску з:
  - Чіткими інструкціями щодо звітування проблем та пропозицій змін
  - Стандартами документації для нового контенту

  - Керівництво з прикладів коду та конвенції повідомлень комітів
  - Інформація про залучення спільноти

#### Завершено
- **🎯 Модуль 7 воркшопу (Завершення)**: Повністю завершений модуль підсумків з:
  - Всебічним підсумком досягнень воркшопу
  - Розділом основних засвоєних концепцій про AZD, шаблони та Microsoft Foundry
  - Рекомендаціями щодо продовження навчального шляху
  - Завданнями воркшопу з оцінкою складності
  - Зворотнім зв’язком та посиланнями на підтримку спільноти

- **📚 Модуль 3 воркшопу (Декомпозиція)**: Оновлені навчальні цілі з:
  - Інструкціями щодо активації GitHub Copilot з MCP серверами
  - Розумінням структури папок шаблонів AZD
  - Патернами організації інфраструктури як коду (Bicep)
  - Інструкціями для практичних лабораторних

- **🔧 Модуль 6 воркшопу (Демонтаж)**: Завершено з:
  - Цілями очистки ресурсів та управління вартістю
  - Використанням `azd down` для безпечного демонтажу інфраструктури
  - Інструкціями з відновлення когнітивних сервісів після м’якого видалення
  - Бонусними завданнями для GitHub Copilot та Azure Portal

#### Виправлено
- **🔗 Виправлення пошкоджених посилань**: Вирішено більше 15 внутрішніх посилань у документації:
  - `docs/ai-foundry/ai-model-deployment.md`: Виправлені шляхи до microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Скориговані шляхи ai-model-deployment.md та production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замінили неіснуючий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Виправлені шляхи до FAQ та керівництва з усунення несправностей
  - `examples/container-app/microservices/README.md`: Виправлені посилання на домашню сторінку курсу та керівництво з розгортання
  - `resources/faq.md` та `resources/glossary.md`: Оновлені посилання на розділ AI
  - `course-outline.md`: Виправлені посилання на гайд викладача та лабораторії AI воркшопу

- **📅 Банер статусу воркшопу**: Оновлено статус з "В розробці" на активний з датою лютого 2026 року

- **🔗 Навігація воркшопу**: Виправлені пошкоджені навігаційні посилання в README.md, що вели на неіснуючу папку lab-1-azd-basics

#### Змінено
- **Презентація воркшопу**: Видалено застереження "в розробці", воркшоп тепер повністю готовий до використання
- **Консистентність навігації**: Забезпечено коректну навігацію між усіма модулями воркшопу
- **Посилання на навчальний шлях**: Оновлено міжрозділові посилання на правильні шляхи microsoft-foundry

#### Перевірено
- ✅ Всі англомовні markdown-файли мають коректні внутрішні посилання
- ✅ Модулі воркшопу 0-7 повністю завершені з навчальними цілями
- ✅ Навігація між розділами та модулями працює правильно
- ✅ Контент підходить для AI-розробників, які використовують Microsoft AZD
- ✅ Використовується простий та зрозумілий для початківців стиль і структура
- ✅ CONTRIBUTING.md містить чіткі інструкції для учасників спільноти

#### Технічна реалізація
- **Валідація посилань**: Автоматичний PowerShell-скрипт перевірив усі .md внутрішні посилання
- **Аудит контенту**: Ручна перевірка повноти воркшопу та відповідності для початківців
- **Система навігації**: Узгоджені шаблони навігації між розділами і модулями

#### Примітки
- **Обсяг**: Зміни застосовані лише до англомовної документації
- **Переклади**: Папки перекладів не оновлені в цій версії (автоматичний переклад буде синхронізовано пізніше)
- **Тривалість воркшопу**: Тепер повний воркшоп надає 3-4 години практичного навчання

---

### [v3.8.0] - 2025-11-19

#### Розширена документація: Моніторинг, безпека та патерни мультиагентної взаємодії  
**Ця версія додає всебічні уроки рівня А з інтеграції Application Insights, патернів автентифікації та координації мультиагентів для продакшн-розгортань.**

#### Додано
- **📊 Урок з інтеграції Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Розгортання AZD з автоматичним провізіонуванням
  - Повні Bicep-шаблони для Application Insights + Log Analytics
  - Робочі Python-додатки з кастомною телеметрією (понад 1,200 рядків)
  - Патерни моніторингу AI/LLM (токени/витрати моделей Microsoft Foundry)
  - 6 діаграм Mermaid (архітектура, розподілене трасування, потік телеметрії)
  - 3 практичні завдання (сповіщення, панелі приладів, моніторинг AI)
  - Приклади запитів Kusto і стратегії оптимізації вартості
  - Стрімінг метрик у реальному часі та налагодження
  - Час навчання 40-50 хвилин із готовими для продакшн патернами

- **🔐 Урок з патернів автентифікації та безпеки**: в `docs/getting-started/authsecurity.md`:
  - 3 патерни автентифікації (рядки підключення, Key Vault, керована ідентичність)
  - Повні Bicep-шаблони інфраструктури для безпечних розгортань
  - Код Node.js з інтеграцією Azure SDK
  - 3 практичні вправи (активувати керовану ідентичність, користувацьку ідентичність, ротація Key Vault)
  - Найкращі практики безпеки та налаштування RBAC
  - Керівництво з усунення несправностей та аналіз вартості
  - Продакшн-патерни безпарольної автентифікації

- **🤖 Урок з патернів мультиагентної координації**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 патернів координації (послідовний, паралельний, ієрархічний, подієвий, консенсус)
  - Повна реалізація сервісу оркестратора (Python/Flask, понад 1,500 рядків)
  - 3 спеціалізовані агенти (дослідник, автор, редактор)
  - Інтеграція з Service Bus для черг повідомлень
  - Управління станом у Cosmos DB для розподілених систем
  - 6 діаграм Mermaid, що описують взаємодію агентів
  - 3 просунуті вправи (обробка таймаутів, логіка повторів, circuit breaker)
  - Розбивка вартості ($240-565/місяць) з стратегіями оптимізації
  - Інтеграція Application Insights для моніторингу

#### Покращено
- **Розділ "Перед розгортанням"**: Тепер охоплює повний моніторинг і патерни координації
- **Розділ "Початок роботи"**: Розширений професійними патернами автентифікації
- **Готовність до продакшн**: Повне охоплення від безпеки до спостережуваності
- **Опис курсу**: Оновлено посилання на нові уроки у розділах 3 та 6

#### Змінено
- **Послідовність навчання**: Покращена інтеграція безпеки і моніторингу по всьому курсу
- **Якість документації**: Відповідність стандартам рівня А (95-97%) у нових уроках
- **Патерни для продакшн**: Повне покриття від початку до кінця для підприємницьких розгортань

#### Покращено
- **Досвід розробника**: Чіткий шлях від розробки до моніторингу продакшн
- **Стандарти безпеки**: Професійні патерни для автентифікації і управління секретами
- **Спостережуваність**: Комплексна інтеграція Application Insights з AZD
- **AI навантаження**: Спеціалізований моніторинг моделей Microsoft Foundry і мультиагентних систем

#### Перевірено
- ✅ Всі уроки містять повноцінний код (без уривків)
- ✅ Діаграми Mermaid для візуального навчання (всього 19 у 3 уроках)
- ✅ Практичні вправи з кроками перевірки (9 всього)
- ✅ Продакшн Bicep-шаблони, що розгортаються через `azd up`
- ✅ Аналіз вартості та стратегії оптимізації
- ✅ Керівництва з усунення несправностей та найкращі практики
- ✅ Контрольні точки знань з командами для перевірки

#### Оцінка якості документації
- **docs/pre-deployment/application-insights.md**: - Всебічний гайд з моніторингу
- **docs/getting-started/authsecurity.md**: - Професійні патерни безпеки
- **docs/pre-deployment/coordination-patterns.md**: - Просунута архітектура мультиагентних систем
- **Загальний новий контент**: - Послідовність високої якості

#### Технічна реалізація
- **Application Insights**: Log Analytics + кастомна телеметрія + розподілене трасування
- **Автентифікація**: Керована ідентичність + Key Vault + патерни RBAC
- **Мультиагентність**: Service Bus + Cosmos DB + Container Apps + оркестрація
- **Моніторинг**: Живі метрики + Kusto-запити + сповіщення + панелі
- **Управління вартістю**: Стратегії вибірковості, політики ретенції, контроль бюджету

### [v3.7.0] - 2025-11-19

#### Покращення якості документації та новий приклад Microsoft Foundry Models  
**Ця версія покращує якість документації по всьому репозиторію та додає повний приклад розгортання Microsoft Foundry Models з чат-інтерфейсом gpt-4.1.**

#### Додано
- **🤖 Приклад Microsoft Foundry Models у чаті**: Повне розгортання gpt-4.1 з робочою імплементацією в `examples/azure-openai-chat/`:
  - Повна інфраструктура Microsoft Foundry Models (розгортання моделі gpt-4.1)
  - Python CLI-чат з історією розмов
  - Інтеграція Key Vault для безпечного зберігання API-ключів
  - Відстеження використання токенів і оцінка вартості
  - Обмеження швидкості та обробка помилок
  - Детальний README з інструкціями розгортання 35-45 хвилин
  - 11 файлів готових до продакшн (Bicep-шаблони, Python-додаток, конфігурація)
- **📚 Вправи з документації**: Додані практичні вправи до керівництва з конфігурації:
  - Вправа 1: Конфігурація для багатьох середовищ (15 хв)
  - Вправа 2: Управління секретами (10 хв)
  - Чіткі критерії успіху та кроки перевірки
- **✅ Перевірка розгортання**: Доданий розділ перевірки в керівництві:
  - Процедури перевірки стану
  - Контрольний список критеріїв успіху
  - Очікувані виводи усіх команд розгортання
  - Швидке посилання для усунення несправностей

#### Покращено
- **examples/README.md**: Оновлено до якості рівня А (93%):
  - Додано azure-openai-chat у всі відповідні розділи
  - Оновлено кількість локальних прикладів з 3 до 4
  - Додано до таблиці прикладів застосувань AI
  - Інтегровано у швидкий старт для середнього рівня користувачів
  - Додано до розділу шаблонів Microsoft Foundry
  - Оновлено матрицю порівнянь та розділи пошуку технологій
- **Якість документації**: Покращено з B+ (87%) до A- (92%) у папці docs:
  - Додано очікувані виводи для критичних команд
  - Включено кроки перевірки для змін у конфігурації
  - Посилено практичне навчання за допомогою вправ

#### Змінено
- **Прогрес навчання**: Краща інтеграція AI-прикладів для середнього рівня
- **Структура документації**: Більше дієвих вправ з чітким результатом
- **Процес перевірки**: Додано явні критерії успіху до ключових робочих процесів

#### Покращено
- **Досвід розробника**: Розгортання Microsoft Foundry Models тепер займає 35-45 хв (замість 60-90 хв для складних альтернатив)
- **Прозорість вартості**: Чіткі оцінки вартості ($50-200/місяць) для прикладу Microsoft Foundry Models
- **Навчальний шлях**: AI-розробники мають чітку точку входу з azure-openai-chat
- **Стандарти документації**: Узгоджені очікувані виводи та кроки перевірки

#### Перевірено
- ✅ Приклад Microsoft Foundry Models повністю функціональний з `azd up`
- ✅ Всі 11 файлів імплементації синтаксично коректні
- ✅ Інструкції README відповідають фактичному досвіду розгортання
- ✅ Оновлені посилання у документації в понад 8 місцях
- ✅ Індекс прикладів точно відображає 4 локальні приклади
- ✅ Відсутність дублікатів зовнішніх посилань у таблицях
- ✅ Всі посилання навігації коректні

#### Технічна реалізація
- **Архітектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps патерн
- **Безпека**: Підтримка керованої ідентичності, секрети зберігаються у Key Vault
- **Моніторинг**: Інтеграція Application Insights
- **Управління вартістю**: Відстеження токенів та оптимізація використання
- **Розгортання**: Один `azd up` для повного налаштування

### [v3.6.0] - 2025-11-19

#### Велике оновлення: Приклади розгортання Container App  
**Ця версія представляє всебічні, готові для продакшн приклади розгортання контейнерних додатків із використанням Azure Developer CLI (AZD), повною документацією та інтеграцією у навчальний шлях.**

#### Додано
- **🚀 Приклади Container App**: Нові локальні приклади в `examples/container-app/`:
  - [Головний гайд](examples/container-app/README.md): Повний огляд контейнеризованих розгортань, швидкий старт, продакшн та просунуті патерни
  - [Простий Flask API](../../examples/container-app/simple-flask-api): REST API для початківців зі масштабуванням до нуля, health probes, моніторингом і усуненням несправностей
  - [Архітектура мікросервісів](../../examples/container-app/microservices): Готове до продакшн мультисервісне розгортання (API Gateway, Product, Order, User, Notification), асинхронні повідомлення, Service Bus, Cosmos DB, Azure SQL, розподілене трасування, blue-green/canary деплоймент
- **Кращі практики**: Безпека, моніторинг, оптимізація вартості та CI/CD для контейнерних навантажень
- **Приклади коду**: Повні `azure.yaml`, Bicep-шаблони, мульти-мовні реалізації сервісів (Python, Node.js, C#, Go)
- **Тестування і усунення несправностей**: Сценарії сквозного тестування, команди моніторингу, керівництво з усунення несправностей

#### Змінено
- **README.md**: Оновлено з акцентом та посиланнями на нові приклади container app у секції "Локальні приклади – Контейнерні додатки"
- **examples/README.md**: Оновлено для виділення прикладів container app, додано записи у матрицю порівнянь та оновлено посилання на технології/архітектуру
- **Опис курсу та навчальний гайд**: Оновлено посилання на нові приклади container app та патерни розгортання у відповідних розділах

#### Перевірено
- ✅ Всі нові приклади можна розгорнути командою `azd up` з дотриманням кращих практик
- ✅ Оновлені крос-посилання в документації та навігація
- ✅ Приклади охоплюють сценарії від початківців до просунутих, включно з продакшн мікросервісами

#### Примітки
- **Обсяг**: Лише англомовна документація та приклади
- **Наступні кроки**: Розширення додатковими просунутими патернами контейнерів і автоматизацією CI/CD у майбутніх релізах

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукту: Microsoft Foundry  
**Ця версія впроваджує комплексну зміну назви продукту з "Microsoft Foundry" на "Microsoft Foundry" у всій англомовній документації, відображаючи офіційний ребрендинг Microsoft.**

#### Змінено
- **🔄 Оновлення назви продукту**: Повний ребрендинг з "Microsoft Foundry" на "Microsoft Foundry"
  - Оновлені всі згадки у англомовній документації в папці `docs/`
  - Перейменована папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Перейменовано файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всього: оновлено 23 посилання в 7 файлах документації

- **📁 Зміни структури папок**:
  - `docs/ai-foundry/` перейменовано на `docs/microsoft-foundry/`
  - Усі крос-посилання оновлено відповідно до нової структури папок
  - Перевірено навігаційні посилання у всій документації

- **📄 Перейменування файлів**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всі внутрішні посилання оновлено для посилання на нову назву файлу

#### Оновлені файли
- **Документація розділів** (7 файлів):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 оновлення навігаційних посилань
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 оновлення згадок назв продукту
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - вже використовує Microsoft Foundry (з попередніх оновлень)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 оновлення посилань (огляд, відгуки спільноти, документація)
  - `docs/getting-started/azd-basics.md` - 4 оновлення крос-посилань
  - `docs/getting-started/first-project.md` - 2 оновлення навігаційних посилань розділів
  - `docs/getting-started/installation.md` - 2 оновлення посилань на наступні розділи
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 оновлення посилань (навігація, спільнота Discord)
  - `docs/troubleshooting/common-issues.md` - 1 оновлення навігаційного посилання
  - `docs/troubleshooting/debugging.md` - 1 оновлення навігаційного посилання

- **Файли структури курсу** (2 файли):
  - `README.md` - 17 оновлень посилань (огляд курсу, назви розділів, секція шаблонів, інформація спільноти)
  - `course-outline.md` - 14 оновлень посилань (огляд, навчальні цілі, ресурси розділів)

#### Перевірено
- ✅ Відсутні посилання на шлях папки "ai-foundry" у англомовній документації
- ✅ Відсутні посилання на назву продукту "Microsoft Foundry" у англомовній документації
- ✅ Всі навігаційні посилання працюють з новою структурою папок
- ✅ Перейменування файлів та папок успішно завершено
- ✅ Крос-посилання між розділами перевірено

#### Примітки
- **Обсяг**: Зміни застосовано лише до англомовної документації в папці `docs/`
- **Переклади**: Папки перекладів (`translations/`) у цій версії не оновлювалися
- **Воркшоп**: Матеріали воркшопу (`workshop/`) у цій версії не оновлювалися
- **Приклади**: Файли прикладів можуть і надалі містити застарілі назви (буде виправлено у наступних оновленнях)
- **Зовнішні посилання**: Зовнішні URL та посилання на репозиторій GitHub залишилися без змін

#### Посібник з міграції для учасників
Якщо у вас є локальні гілки чи документація, що посилається на стару структуру:
1. Оновіть посилання на папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Оновіть посилання на файли: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замініть назву продукту: "Microsoft Foundry" → "Microsoft Foundry"
4. Перевірте, що всі внутрішні посилання в документації працюють правильно

---

### [v3.4.0] - 2025-10-24

#### Покращення попереднього перегляду інфраструктури та валідації
**Ця версія впроваджує комплексну підтримку нової функції попереднього перегляду Azure Developer CLI та покращує досвід користування воркшопом.**

#### Додано
- **🧪 Документація функції azd provision --preview**: Детальне висвітлення нової можливості попереднього перегляду інфраструктури
  - Справочник команд та приклади використання в шпаргалці
  - Докладна інтеграція в посібник із надання з прикладами випадків використання та переваг
  - Інтеграція попередніх перевірок для безпечнішої валідації розгортання
  - Оновлення посібника для початку роботи з упором на безпечні практики розгортання
- **🚧 Банер статусу воркшопу**: Професійний HTML-банер із вказівкою статусу розробки воркшопу
  - Градієнтний дизайн із індикаторами будівництва для прозорої комунікації користувачам
  - Відмітка часу останнього оновлення для прозорості
  - Адаптивний дизайн для мобільних пристроїв

#### Покращено
- **Безпека інфраструктури**: Функція попереднього перегляду інтегрована у всю документацію про розгортання
- **Валідація перед розгортанням**: Автоматизовані скрипти тепер включають тестування інфраструктури в режимі перегляду
- **Робочі процеси розробників**: Оновлені послідовності команд із рекомендацією використовувати попередній перегляд як найкращу практику
- **Досвід користування воркшопом**: Чітке інформування користувачів про статус розробки контенту

#### Зміни
- **Кращі практики розгортання**: Робочий процес із акцентом на попередній перегляд як рекомендований підхід
- **Потік документації**: Валідацію інфраструктури переміщено на ранні етапи навчання
- **Презентація воркшопу**: Професійне інформування про статус розробки із визначеним графіком

#### Покращено
- **Підхід безпеки в першу чергу**: Зміни в інфраструктурі тепер можна валідувати до розгортання
- **Командна робота**: Результати перегляду можна обмінюватися для огляду і схвалення
- **Інформованість про витрати**: Кращий розуміння вартості ресурсів до їх надання
- **Зниження ризиків**: Менше помилок при розгортанні завдяки попередній валідації

#### Технічна реалізація
- **Інтеграція у кількох документах**: Функція попереднього перегляду описана у 4 ключових файлах
- **Патерни команд**: Узгоджений синтаксис та приклади у всій документації
- **Інтеграція кращих практик**: Включення попереднього перегляду у робочі процеси валідації та скрипти
- **Візуальні індикатори**: Чіткі позначки нової функції для полегшення виявлення

#### Інфраструктура воркшопу
- **Інформування про статус**: Професійний HTML-банер з градієнтним стилем
- **Досвід користувача**: Чітке повідомлення про статус розробки запобігає непорозумінням
- **Професійна презентація**: Підтримка авторитетності репозиторію при встановленні очікувань
- **Прозорість термінів**: Відмітка часу останнього оновлення у жовтні 2025 року для підзвітності

### [v3.3.0] - 2025-09-24

#### Покращені матеріали воркшопу та інтерактивний навчальний досвід
**Ця версія впроваджує комплексні матеріали для воркшопу з браузерними інтерактивними гідами та структурованими навчальними шляхами.**

#### Додано
- **🎥 Інтерактивний гід воркшопу**: Воркшоп у браузері з можливістю попереднього перегляду MkDocs
- **📝 Структуровані інструкції воркшопу**: Покроковий семиступеневий навчальний маршрут від ознайомлення до налаштування
  - 0-Вступ: Огляд воркшопу та налаштування
  - 1-Вибір-АІ-Шаблону: Пошук і вибір шаблону
  - 2-Валідація-АІ-Шаблону: Процедури розгортання та перевірки
  - 3-Розбір-АІ-Шаблону: Розуміння архітектури шаблону
  - 4-Налаштування-АІ-Шаблону: Конфігурація та кастомізація
  - 5-Модифікація-АІ-Шаблону: Просунуті зміни та ітерації
  - 6-Прибирання-Інфраструктури: Очищення та управління ресурсами
  - 7-Завершення: Підсумки та подальші кроки
- **🛠️ Інструменти воркшопу**: Конфігурація MkDocs з темою Material для покращеного навчального досвіду
- **🎯 Практичний навчальний шлях**: Триетапна методологія (Відкриття → Розгортання → Налаштування)
- **📱 Інтеграція GitHub Codespaces**: Безшовне налаштування середовища розробки

#### Покращено
- **Лабораторія AI воркшопу**: Розширена до комплексного 2-3 годинного структурованого навчального досвіду
- **Документація воркшопу**: Професійна презентація з навігацією та візуальними допоміжними засобами
- **Прогрес навчання**: Чітке покрокове керівництво від вибору шаблону до розгортання у виробництві
- **Досвід розробника**: Інтегровані інструменти для оптимізації робочих процесів розробки

#### Покращено
- **Доступність**: Інтерфейс у браузері з пошуком, можливістю копіювання та перемикання теми
- **Навчання у власному темпі**: Гнучка структура воркшопу для різних швидкостей навчання
- **Практичне застосування**: Реальні сценарії розгортання AI-шаблонів
- **Інтеграція спільноти**: Інтеграція Discord для підтримки воркшопу і співпраці

#### Особливості воркшопу
- **Вбудований пошук**: Швидкий пошук за ключовими словами та уроками
- **Копіювання блоків коду**: Функція копіювання при наведенні для всіх кодових прикладів
- **Перемикач теми**: Підтримка темної і світлої теми під різні вподобання
- **Візуальні матеріали**: Знімки екрана та діаграми для кращого розуміння
- **Інтегроване допоміжне меню**: Прямий доступ до Discord для підтримки спільноти

### [v3.2.0] - 2025-09-17

#### Значна реструктуризація навігації та система навчання за розділами
**Ця версія впроваджує комплексну структуру навчання за розділами з покращеною навігацією по всьому репозиторію.**

#### Додано
- **📚 Система навчання за розділами**: Повна реструктуризація курсу у 8 послідовних навчальних розділів
  - Розділ 1: Основи та швидкий старт (⭐ - 30-45 хв)
  - Розділ 2: Розробка з фокусом на AI (⭐⭐ - 1-2 години)
  - Розділ 3: Конфігурація та автентифікація (⭐⭐ - 45-60 хв)
  - Розділ 4: Інфраструктура як код та розгортання (⭐⭐⭐ - 1-1,5 год)
  - Розділ 5: Рішення для мульти-агентної AI (⭐⭐⭐⭐ - 2-3 години)
  - Розділ 6: Валідація та планування перед розгортанням (⭐⭐ - 1 година)
  - Розділ 7: Вирішення проблем та налагодження (⭐⭐ - 1-1,5 години)
  - Розділ 8: Виробничі та корпоративні шаблони (⭐⭐⭐⭐ - 2-3 години)
- **📚 Комплексна система навігації**: Узгоджені заголовки та підвали навігації в усій документації
- **🎯 Відстеження прогресу**: Чек-лист завершення курсу та система перевірки навчання
- **🗺️ Керівництво навчальним шляхом**: Чіткі точки входу для різного досвіду та цілей
- **🔗 Навігація за крос-посиланнями**: Пов’язані розділи та передумови чітко пов’язані

#### Покращено
- **Структура README**: Трансформована у структуровану навчальну платформу з організацією за розділами
- **Навігація документації**: Кожна сторінка містить контекст розділа та вказівки з прогресу
- **Організація шаблонів**: Приклади та шаблони співставлені з відповідними навчальними розділами
- **Інтеграція ресурсів**: Шпаргалки, FAQ та посібники накладені на відповідні розділи
- **Інтеграція воркшопу**: Практичні лабораторії розподілені на декілька навчальних цілей розділів

#### Зміни
- **Прогрес навчанння**: Перехід від лінійної документації до гнучкої системи за розділами
- **Розміщення конфігурації**: Посібник з конфігурації переміщено до розділу 3 для кращого навчального потоку
- **Інтеграція AI-контенту**: Краща інтеграція AI-специфічного контенту в навчальний маршрут
- **Виробничий контент**: Удосконалені шаблони зібрані у розділі 8 для корпоративних користувачів

#### Покращено
- **Досвід користувача**: Чіткі навігаційні елементи та індикатори прогресу розділу
- **Доступність**: Узгоджені навігаційні шаблони для спрощеного проходження курсу
- **Професійна презентація**: Структура курсу в стилі університету, придатна для академічного та корпоративного навчання
- **Ефективність навчання**: Скорочення часу пошуку релевантного контенту через покращену організацію

#### Технічна реалізація
- **Заголовки навігації**: Стандартизована навігація розділів у понад 40 файлах документації
- **Навігація в підвалі**: Узгоджене керування прогресом та індикатори завершення розділу
- **Взаємні посилання**: Комплексна внутрішня система посилань, що пов’язує відповідні концепції
- **Картування розділів**: Шаблони та приклади чітко асоційовані з навчальними цілями

#### Покращення посібника з навчання
- **📚 Комплексні навчальні цілі**: Посібник розроблено у відповідності до системи з 8 розділів
- **🎯 Оцінювання за розділами**: Кожен розділ містить конкретні навчальні цілі та практичні вправи
- **📋 Відстеження прогресу**: Щотижневий навчальний графік з вимірюваними результатами та чек-листами
- **❓ Запитання для перевірки знань**: Питання для оцінки знань у кожному розділі з професійними результатами
- **🛠️ Практичні завдання**: Практичні вправи з реальними сценаріями розгортання та налагодження
- **📊 Прогрес навичок**: Чіткий розвиток від базових понять до корпоративних шаблонів із фокусом на кар’єрний розвиток
- **🎓 Сертифікаційна структура**: Професійні результати розвитку та система визнання у спільноті
- **⏱️ Керування графіком**: Структурований 10-тижневий план навчання з контрольними точками

### [v3.1.0] - 2025-09-17

#### Покращені мульти-агентні AI-рішення
**Ця версія поліпшує мульти-агентне рітейл-рішення з кращим найменуванням агентів та вдосконаленою документацією.**

#### Зміни
- **Термінологія мульти-агента**: Заміна "агент Кора" на "агент Клієнт" у всьому рітейл мульти-агентному рішенні для кращого розуміння
- **Архітектура агентів**: Оновлено всю документацію, шаблони ARM та приклади коду із використанням узгодженого найменування "агент Клієнт"
- **Приклади конфігурації**: Модернізовані патерни конфігурації агентів із новими найменуваннями
- **Консистентність документації**: Забезпечено використання професійних описових назв агентів у всіх згадках

#### Покращено
- **Пакет шаблонів ARM**: Оновлено retail-multiagent-arm-template з посиланнями на агента Клієнта
- **Діаграми архітектури**: Оновлено Mermaid-діаграми з новими найменуваннями агентів
- **Приклади коду**: Класи Python та приклади реалізації тепер використовують найменування CustomerAgent
- **Змінні середовища**: Оновлено всі скрипти розгортання під стандарти CUSTOMER_AGENT_NAME

#### Покращено
- **Досвід розробника**: Чіткі ролі та обов’язки агентів у документації
- **Готовність до виробництва**: Краща відповідність корпоративним конвенціям найменувань
- **Навчальні матеріали**: Інтуїтивніше найменування агентів для навчальних цілей
- **Зручність шаблонів**: Спрощене розуміння функцій агентів та патернів розгортання

#### Технічні деталі
- Оновлено Mermaid-діаграми архітектури з посиланнями на CustomerAgent
- Заміна імен класів CoraAgent на CustomerAgent у прикладах Python
- Зміни у JSON-конфігураціях ARM шаблонів для використання типу агента "customer"
- Оновлення змінних середовища з CORA_AGENT_* на CUSTOMER_AGENT_*
- Оновлення всіх команд розгортання та конфігурацій контейнерів

### [v3.0.0] - 2025-09-12

#### Основні зміни – Орієнтація на розробника AI та інтеграція Microsoft Foundry
**Ця версія трансформує репозиторій у комплексний навчальний ресурс з фокусом на AI розробників з інтеграцією Microsoft Foundry.**

#### Додано
- **🤖 AI-орієнтований навчальний шлях**: Повна реструктуризація з пріоритетом на AI-розробників та інженерів
- **Посібник інтеграції Microsoft Foundry**: Комплексна документація з підключення AZD до сервісів Microsoft Foundry
- **Патерни розгортання AI моделей**: Детальний посібник зі вибору моделей, конфігурації та стратегій розгортання у виробництво
- **Лабораторія AI Workshop**: 2-3 годинний практичний семінар з перетворення AI-застосунків у рішення, що розгортаються за допомогою AZD  
- **Кращі практики Production AI**: Патерни для підприємств, готові до масштабування, моніторингу та безпеки AI-навантажень  
- **Посібник з усунення несправностей, специфічний для AI**: Всебічне усунення несправностей моделей Microsoft Foundry, Cognitive Services та питань розгортання AI  
- **Галерея шаблонів AI**: Вибрана колекція шаблонів Microsoft Foundry з рейтингами складності  
- **Матеріали семінару**: Повна структура семінару з практичними лабораторними роботами та довідковими матеріалами  

#### Розширено
- **Структура README**: Орієнтована на AI-розробників з 45% даних про інтереси спільноти з Microsoft Foundry Discord  
- **Шляхи навчання**: Спеціалізований шлях розробника AI поряд із традиційними шляхами для студентів та DevOps інженерів  
- **Рекомендації шаблонів**: Вибрані AI-шаблони, зокрема azure-search-openai-demo, contoso-chat та openai-chat-app-quickstart  
- **Інтеграція спільноти**: Покращена підтримка спільноти Discord з AI-каналами та обговореннями  

#### Безпека та орієнтація на Production
- **Патерни керованої ідентичності**: AI-специфічні конфігурації автентифікації та безпеки  
- **Оптимізація витрат**: Відстеження використання токенів та контроль бюджету для AI-навантажень  
- **Розгортання у кількох регіонах**: Стратегії глобального розгортання AI-застосунків  
- **Моніторинг продуктивності**: AI-специфічні метрики та інтеграція з Application Insights  

#### Якість документації
- **Лінійна структура курсу**: Логічний перехід від початкових до просунутих патернів розгортання AI  
- **Перевірені URL**: Усі зовнішні посилання на репозиторії перевірені та доступні  
- **Повний довідник**: Усі внутрішні посилання документації перевірені та працюють  
- **Готовність до Production**: Патерни розгортання підприємств з реальними прикладами  

### [v2.0.0] - 2025-09-09

#### Основні зміни - Реструктуризація репозиторію та професійне вдосконалення  
**Ця версія представляє значне оновлення структури репозиторію та презентації контенту.**

#### Додано  
- **Структурована навчальна рамка**: Всі сторінки документації тепер містять розділи Вступ, Цілі навчання та Результати навчання  
- **Навігаційна система**: Додані посилання на попередній/наступний урок по всій документації для покрокового проходження  
- **Посібник для навчання**: Всебічний study-guide.md з навчальними цілями, практичними вправами та матеріалами для оцінювання  
- **Професійна презентація**: Видалено всі емодзі для покращення доступності та професійного вигляду  
- **Покращена структура контенту**: Покращена організація та послідовність навчальних матеріалів  

#### Змінено  
- **Формат документації**: Стандартизовано всю документацію з послідовною структурою, орієнтованою на навчання  
- **Навігаційний потік**: Впроваджено логічний порядок проходження усіх навчальних матеріалів  
- **Презентація контенту**: Видалено декоративні елементи задля чіткого та професійного форматування  
- **Структура посилань**: Оновлено всі внутрішні посилання для підтримки нової системи навігації  

#### Покращено  
- **Доступність**: Видалено емодзі для кращої сумісності з екранними читалками  
- **Професійний вигляд**: Чисте академічне оформлення, що підходить для корпоративного навчання  
- **Навчальний досвід**: Структурований підхід з чіткими цілями та результатами для кожного уроку  
- **Організація контенту**: Кращий логічний потік та зв’язок між пов’язаними темами  

### [v1.0.0] - 2025-09-09

#### Початковий реліз - всебічний навчальний репозиторій AZD  

#### Додано  
- **Основна структура документації**  
  - Повна серія посібників для початку роботи  
  - Всебічна документація з розгортання та провізії  
  - Детальні ресурси для усунення несправностей та налагодження  
  - Інструменти та процедури попередньої перевірки перед розгортанням  

- **Модуль початку роботи**  
  - Основи AZD: ключові концепції та термінологія  
  - Посібник з інсталяції: інструкції для різних платформ  
  - Посібник з налаштування: підготовка середовища та автентифікація  
  - Перший проект: покрокове практичне навчання  

- **Модуль розгортання та провізії**  
  - Посібник з розгортання: повна документація робочого процесу  
  - Посібник з провізії: інфраструктура як код з Bicep  
  - Кращі практики для production-розгортань  
  - Патерни багатосервісної архітектури  

- **Модуль попередньої перевірки**  
  - Планування ємності: перевірка доступності ресурсів Azure  
  - Вибір SKU: повне керівництво по рівнях сервісів  
  - Попередні перевірки: автоматизовані валідуючі скрипти (PowerShell та Bash)  
  - Інструменти оцінки вартості та планування бюджету  

- **Модуль усунення несправностей**  
  - Типові проблеми: часто виникаючі проблеми та рішення  
  - Посібник з налагодження: систематичні методи усунення несправностей  
  - Поглиблені діагностичні техніки та інструменти  
  - Моніторинг продуктивності та оптимізація  

- **Ресурси та довідники**  
  - Шпаргалка команд: швидкий доступ до основних команд  
  - Глосарій: комплексний словник термінів та абревіатур  
  - FAQ: детальні відповіді на поширені запитання  
  - Посилання на зовнішні ресурси та спільноту  

- **Приклади та шаблони**  
  - Простий приклад веб-застосунку  
  - Шаблон розгортання статичного сайту  
  - Конфігурація контейнерного застосунку  
  - Патерни інтеграції баз даних  
  - Приклади архітектури мікросервісів  
  - Реалізації безсерверних функцій  

#### Особливості  
- **Підтримка багатьох платформ**: посібники з інсталяції та налаштування для Windows, macOS і Linux  
- **Рівні складності**: контент для студентів і професійних розробників  
- **Практична орієнтація**: практичні приклади та реальні сценарії  
- **Всебічне охоплення**: від основних концепцій до передових корпоративних патернів  
- **Підхід із пріоритетом безпеки**: інтегровані кращі практики безпеки  
- **Оптимізація витрат**: рекомендації для економних розгортань та управління ресурсами  

#### Якість документації  
- **Детальні приклади коду**: практичний, протестований код  
- **Покрокові інструкції**: чіткі, зрозумілі керівництва  
- **Усунення помилок**: підтримка для поширених проблем  
- **Інтеграція кращих практик**: галузеві стандарти та рекомендації  
- **Сумісність версій**: актуально для останніх сервісів Azure та функцій azd  

## Заплановані майбутні покращення

### Версія 3.1.0 (Заплановано)  
#### Розширення платформи AI  
- **Підтримка мульти-моделей**: інтеграція Hugging Face, Azure Machine Learning та кастомних моделей  
- **Фреймворки AI Agent**: шаблони для LangChain, Semantic Kernel та AutoGen  
- **Розширені патерни RAG**: варіанти векторних баз даних понад Azure AI Search (Pinecone, Weaviate тощо)  
- **Спостережуваність AI**: покращений моніторинг продуктивності моделей, використання токенів та якості відповіді  

#### Досвід розробника  
- **Розширення VS Code**: інтегрований досвід розробки AZD + Microsoft Foundry  
- **Інтеграція GitHub Copilot**: AI-підтримка генерації шаблонів AZD  
- **Інтерактивні уроки**: практичні вправи з автоматизованою перевіркою для AI сценаріїв  
- **Відеоконтент**: додаткові відеоуроки для візуальних студентів, орієнтовані на AI-розгортання  

### Версія 4.0.0 (Заплановано)  
#### Патерни корпоративного AI  
- **Фреймворк управління**: управління AI-моделями, відповідність та аудит  
- **Багатоорендний AI**: патерни для обслуговування множини замовників з ізольованими AI-сервісами  
- **Edge AI розгортання**: інтеграція з Azure IoT Edge та контейнерними інстанціями  
- **Гібридний хмарний AI**: мультихмарні та гібридні патерни для AI-навантажень  

#### Розширені функції  
- **Автоматизація AI-пайплайнів**: інтеграція MLOps з Azure Machine Learning pipelines  
- **Покращена безпека**: патерни zero-trust, приватні кінцеві точки та розширений захист від загроз  
- **Оптимізація продуктивності**: розширене налаштування та стратегії масштабування для високопродуктивних AI-застосунків  
- **Глобальний розподіл**: патерни доставки контенту та кешування на краях для AI-застосунків  

### Версія 3.0.0 (Заплановано) - Замінено поточним релізом  
#### Запропоновані додавання - тепер реалізовані у v3.0.0  
- ✅ **Контент із фокусом на AI**: всебічна інтеграція Microsoft Foundry (завершено)  
- ✅ **Інтерактивні навчальні лабораторії AI**: практичний AI семінар (завершено)  
- ✅ **Модуль розширеної безпеки**: AI-специфічні патерни безпеки (завершено)  
- ✅ **Оптимізація продуктивності**: стратегії налаштування AI-навантажень (завершено)  

### Версія 2.1.0 (Заплановано) - Частково реалізовано у v3.0.0  
#### Невеликі покращення - деякі завершені у поточному релізі  
- ✅ **Додаткові приклади**: AI-орієнтовані сценарії розгортання (завершено)  
- ✅ **Розширене FAQ**: AI-специфічні питання та усунення несправностей (завершено)  
- **Інтеграція інструментів**: покращені керівництва для IDE та редакторів  
- ✅ **Розширення моніторингу**: AI-специфічні патерни моніторингу та сповіщень (завершено)  

#### Ще заплановано на майбутній реліз  
- **Адаптивна документація для мобільних пристроїв**: адаптивний дизайн для мобільного навчання  
- **Оффлайн-доступ**: пакети документації для завантаження  
- **Покращена інтеграція IDE**: розширення VS Code для AZD + AI робочих процесів  
- **Панель спільноти**: метрики спільноти в реальному часі та відстеження внеску  

## Внесок у Changelog

### Повідомлення про зміни  
При внесенні змін до цього репозиторію, будь ласка, переконайтеся, що записи у changelog містять:

1. **Номер версії**: відповідно до семантичного версіонування (major.minor.patch)  
2. **Дата**: дата випуску або оновлення у форматі РРРР-ММ-ДД  
3. **Категорія**: Додано, Змінено, Застаріло, Видалено, Виправлено, Безпека  
4. **Чіткий опис**: лаконічний опис внесених змін  
5. **Оцінка впливу**: як зміни впливають на існуючих користувачів  

### Категорії змін

#### Додано  
- Нові функції, розділи документації або можливості  
- Нові приклади, шаблони або навчальні ресурси  
- Додаткові інструменти, скрипти або утиліти  

#### Змінено  
- Модифікації існуючої функціональності або документації  
- Оновлення для покращення зрозумілості або точності  
- Реструктуризація контенту або організації  

#### Застаріло  
- Функції або підходи, які поступово виводяться з використання  
- Розділи документації, заплановані для видалення  
- Методи з кращими альтернативами  

#### Видалено  
- Функції, документація або приклади, що більше не актуальні  
- Застаріла інформація або відмовлені підходи  
- Зайвий або консолідований контент  

#### Виправлено  
- Виправлення помилок у документації або коді  
- Усунення повідомлених проблем чи багів  
- Покращення точності чи функціональності  

#### Безпека  
- Покращення або виправлення, пов’язані з безпекою  
- Оновлення кращих практик безпеки  
- Усунення уразливостей безпеки  

### Керівництво з семантичного версіонування

#### Мажорна версія (X.0.0)  
- Зміни, що ламають сумісність та потребують дії користувача  
- Значна реструктуризація контенту або організації  
- Зміни, що суттєво змінюють підхід або методологію  

#### Мінорна версія (X.Y.0)  
- Нові функції або додатки контенту  
- Покращення, що зберігають зворотну сумісність  
- Додаткові приклади, інструменти або ресурси  

#### Патч-версія (X.Y.Z)  
- Виправлення багів та корекції  
- Невеликі покращення існуючого контенту  
- Уточнення та незначні вдосконалення  

## Відгуки та пропозиції спільноти

Ми активно заохочуємо відгуки спільноти для покращення цього навчального ресурсу:

### Як залишити відгук  
- **GitHub Issues**: Повідомляти про проблеми або пропонувати покращення (AI-специфічні запити вітаються)  
- **Обговорення в Discord**: Ділитися ідеями та спілкуватися зі спільнотою Microsoft Foundry  
- **Pull Requests**: Безпосередньо вносити покращення контенту, особливо AI-шаблонів та посібників  
- **Microsoft Foundry Discord**: Участь у каналі #Azure для обговорень AZD + AI  
- **Форуми спільноти**: Участь у ширших Azure dev обговореннях  

### Категорії відгуків  
- **Точність AI-контенту**: виправлення інтеграції та інформації по розгортанню AI-сервісів  
- **Навчальний досвід**: пропозиції з покращення навчального процесу AI-розробників  
- **Відсутній AI-контент**: запити на додаткові AI-шаблони, патерни або приклади  
- **Доступність**: покращення для різних навчальних потреб  
- **Інтеграція AI-інструментів**: ідеї для кращого AI-робочого процесу  
- **Патерни Production AI**: запити щодо корпоративних патернів AI-розгортання  

### Зобов’язання щодо реакції  
- **Відповідь на проблеми**: протягом 48 годин  
- **Оцінка запитів на функції**: протягом одного тижня  
- **Розгляд внесків спільноти**: протягом одного тижня  
- **Безпекові питання**: пріоритетна й негайна реакція  

## Графік підтримки

### Регулярні оновлення  
- **Щомісячні перевірки**: точність контенту та перевірка посилань  
- **Щоквартальні оновлення**: основні додавання та вдосконалення  
- **Піврічні огляди**: комплексна реструктуризація та покращення  
- **Річні релізи**: великі оновлення з суттєвими поліпшеннями  

### Моніторинг та забезпечення якості  
- **Автоматизоване тестування**: регулярна перевірка прикладів коду та посилань  
- **Інтеграція відгуків спільноти**: постійне врахування пропозицій користувачів  
- **Оновлення технологій**: відповідність останнім сервісам Azure та випускам azd  
- **Аудити доступності**: регулярний перегляд принципів інклюзивного дизайну  

## Політика підтримки версій

### Підтримка поточної версії  
- **Остання мажорна версія**: повна підтримка з регулярними оновленнями  
- **Попередня мажорна версія**: оновлення безпеки та критичних виправлень протягом 12 місяців  
- **Старі версії**: підтримка спільноти, офіційних оновлень немає  

### Керівництво з міграції  
При виході мажорних версій ми надаємо:  
- **Посібники з міграції**: покрокові інструкції переходу  
- **Примітки сумісності**: інформація про ключові зміни  
- **Підтримка інструментів**: скрипти або утиліти для допомоги у міграції  
- **Підтримка спільноти**: спеціалізовані форуми для питань міграції  

---

**Навігація**  
- **Попередній урок**: [Study Guide](resources/study-guide.md)  
- **Наступний урок**: Повернутися до [Main README](README.md)  

**Будьте в курсі**: Слідкуйте за цим репозиторієм, щоб отримувати сповіщення про нові релізи та важливі оновлення навчальних матеріалів.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->