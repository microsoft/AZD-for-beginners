# Журнал змін - AZD для початківців

## Вступ

Цей журнал змін документує всі помітні зміни, оновлення та покращення в репозиторії AZD для початківців. Ми дотримуємося принципів семантичного версіонування та підтримуємо цей журнал, щоб допомогти користувачам зрозуміти, що змінилося між версіями.

## Навчальні цілі

Ознайомившись із цим журналом змін, ви:
- Залишитесь поінформованими про нові функції та додавання контенту
- Зрозумієте покращення в існуючій документації
- Відстежуватимете виправлення помилок і корекції для забезпечення точності
- Слідкуватимете за розвитком навчальних матеріалів з часом

## Результати навчання

Після ознайомлення з записами журналу змін ви зможете:
- Визначати новий контент і ресурси, доступні для навчання
- Розуміти, які розділи були оновлені або покращені
- Планувати свій навчальний шлях на основі найактуальніших матеріалів
- Вносити відгуки та пропозиції для майбутніх покращень

## Історія версій

### [v3.25.0] - 2026-11-09

#### Розширення Microsoft Foundry 1.0 тепер загальнодоступне

Пакет `microsoft.foundry` 1.0 є **діючим і загальнодоступним**, як було оголошено [5 листопада 2026 року](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Курс тепер навчає випущеному GA робочому процесу, а не майбутньому релізу. Розпочинайте з AZD **версії 1.37.0 або новішої** та `azd ext install microsoft.foundry`.

#### Доступне в цьому оновленні курсу
- Англійський посібник використовує пакет GA як шлях за замовчуванням для встановлення та пояснює сім незалежно версіонованих основних розширень.
- [Керівництво з використання хостового агента](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) охоплює зразок API відповідей Python Agent Framework, поточну версію uv, Python 3.13+, вибір нових/існуючих проєктів, повторне використання моделей та огляд `azure.yaml`.
- Локально-хмарний робочий процес охоплює тестування Agent Inspector, витрати на модель із підтримкою Azure, віддалене створення коду, розгорнуті виклики, відстеження в хмарі, попередній перегляд розгортання, журнали та діагностику.
- Окремі рекомендації для оцінювання включають генерацію та перевірку наборів даних/критеріїв, налаштування іменованої оцінки, реєстрацію активів і перевірку результатів. Старі інструкції з оцінювання/оптимізації залишаються історією міграції, а не базою поточного релізу.
- Рекомендації з Foundry CI/CD включають встановлення розширень для виконавця, автентифіковане розгортання, активи/доступ для оцінки та явний контроль якості.
- Рекомендації з очищення розрізняють новостворені та повторно використані проєкти Foundry. Воркшоп містить посилання на окрему вправу GA, не замінюючи тестів для конкретних зразків.
- Навігація курсу, навчальні цілі, передумови налаштування, шпаргалка, FAQ та навчальний посібник відображають робочий процес GA. Згенеровані переклади не редагуються вручну.

#### Обсяг огляду
- Базується на оголошенні GA, пов’язаних матеріалах Microsoft Learn і конфігурації прикладів з вихідного коду. Не виконувалося реальної Azure-провізії, розгортання, викликів моделей або оцінки.
- Пакет GA не означає GA для кожної опціональної функції, незалежного розширення або SDK, а також не сертифікує приклади для виробничого використання.

### [v3.24.0]- 2026-11-04

#### Виправлено
- Відновлено навігацію англійського курсу, шляхів переміщених сторінок, відсутніх якорів і застарілих зовнішніх посилань, включно з посиланням з розділу 2 на довідник Production AI.
- Перевірено поточні рекомендації відповідно до опублікованих AZD 1.37.2, агентів 1.0.0-beta.23 та оцінок 1.0.0-beta.2. Задокументовано окремий робочий процес `azd ai eval` та міграцію конфігурації оптимізації.
- Виправлено непідтримувані CLI-прапорці, межі автентифікації, інструкції з відкритими змінними/секретами середовища, оновлення інфраструктури, конфігурацію моделей і приклади руйнівного відновлення.
- Оновлено воркшоп відповідно до поточного прикладу AI Agents, включаючи реальні хуки, вхідні конфігурації, тести оцінки, точки входу для red-teaming та спостережуваність.
- Виправлено заяви щодо реалізації прикладів та усунено пов’язані проблеми з додатком/інфраструктурою/конфігурацією. Матеріали по архітектурі роздрібної торгівлі чітко відокремлені від повноцінного робочого додатка.
- Відновлено матрицю мов CodeQL, обрано підтримувану Node.js 24 для контейнера розробника та налаштовано валідатори для звіту про невдалі версійні команди.

#### Додано
- Англомовний офлайн перевірник посилань/якорів, регресійні тести та робочий процес документації, що також будує воркшоп у суворому режимі. Згенеровані переклади та перекладені зображення виключені.

#### Обсяг перевірки
- Перевірка джерела, синтаксису, конфігурації, локальної поведінки та мережевих посилань не встановлює можливість живого розгортання в Azure, квоти, RBAC, регіональну доступність моделей, білінг, відповідність безпеці або готовність до продакшн.
- Старіші записи нижче є історичними записами, а не поточними командами чи інструкціями релізу.

### [v3.23.0] - 2026-07-13

#### Оновлення AZD 1.27.1: Актуалізація версії
**Ця версія перевіряє курс на відповідність `azd` `1.27.1` (липень 2026, останній стабільний реліз) та поточному прев’ю розширення AI агента `azure.ai.agents` `1.0.0-beta.5`, оновлюючи всі банери "перевірено проти" після релізів 1.26.0, 1.27.0 і 1.27.1.**

#### Зміни
- **✅ Оновлено базову лінію перевірки** з `azd 1.25.6` (червень 2026) на `azd 1.27.1` (липень 2026) у кореневому README, усіх README розділів, у лекції з контейнерів розробника розділу 1 (включно з прикладами з фіксованими версіями), лекції з шаблонів розділу 4, лекції з мульти-агентів розділу 5 та документації воркшопу
- **🤖 Оновлено базову лінію розділу 2** з `azd 1.23.12` (березень 2026) на `azd 1.27.1` у `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` та `microsoft-foundry-integration.md`; дати в нотатках перевірки оновлено на 2026-07-13
- **🧩 Оновлено розширення AI агента** з `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до поточного релізу `1.0.0-beta.5` у README розділу 2 і `agents.md`
- **🧪 Оновлено приклад перевірки воркшопу** (вивід `azd version`) до `1.27.1`

#### Примітки щодо релевантних релізів azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Підтримка Go для Azure Functions на Flex Consumption, фільтри підписок `azd config sub-filter` за орендарем, самодостатні пакети розширень (`azd x pack --bundle`) та `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделювання проєктів/агентів Azure AI Foundry безпосередньо в `azure.yaml` (ініціалізація без Bicep/Terraform), підтримка розгортання контейнерів для App Service (`host: appservice` + `language: docker`), прямий `-s/--source` для команд `azd extension` та `azd tool uninstall`
- **1.27.1 (2026-07-09):** Прапорець `--no-dependencies` для `azd extension install`, за замовчуванням виключені застарілі моделі з каталогів/підказок квоти, а також кілька виправлень багів

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

#### Додаткові навички для початківців #2: створення шаблонів, контейнери розробника, Pulumi, Azure DevOps, сервісні принципали та більше
**Ця версія закриває залишкові проміжні прогалини за результатами аналізу покриття azd: як створювати та публікувати власний шаблон, відтворювані середовища Dev Container/Codespaces, провайдер інфраструктури Pulumi, покроковий огляд CI/CD в Azure DevOps, автентифікація сервісних принципалів, керівництво з вибору хостів (AKS/Spring Apps), пояснення `azd restore`/`azd package`, обробка помилок хук, та практики командного/спільного використання середовищ.**

#### Додано
- **🧱 Нова лекція розділу 4** `docs/chapter-04-infrastructure/custom-templates.md` — створення власного шаблону azd: необхідна структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризація інфраструктури за допомогою `uniqueString()` токена ресурсу та `azd-env-name` тегу, локальне тестування з `azd init --template <local-path>`, публікація на GitHub і подання до галереї Awesome AZD
- **📦 Нова лекція розділу 1** `docs/chapter-01-foundation/dev-containers.md` — відтворювані середовища azd за допомогою Dev Containers і GitHub Codespaces: мінімальний `.devcontainer/devcontainer.json` з офіційною функцією `ghcr.io/azure/azure-dev/azd`, специфічні для мови функції, `docker-in-docker` для контейнерних хостів і `azd auth login --use-device-code` для віддаленого входу
- **🧩 Розділ Pulumi з azd** у `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура папок Pulumi, стеки, пов’язані з середовищами azd, необхідні виходи/теги та ідентичний робочий процес `azd up` / `azd down`
- **🎯 Керівництво з вибору хоста** у `docs/chapter-04-infrastructure/provisioning.md` — дружнє для початківців порівняння `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` та `springapp` з порадами щодо вибору між AKS або Azure Spring Apps
- **🛠️ Огляд CI/CD в Azure DevOps** у `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, підключення сервісу з федерацією робочих навантажень (OIDC), згенерований `azure-dev.yml` і налаштування змінних груп
- **🔑 Сервісні принципали (шаблон 4)** додано у `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неінтерактивний `azd auth login` із секретом клієнта проти федеративних/OIDC облікових даних, коли використовувати та безпечне зберігання облікових даних
- **🪝 Підсекція обробки помилок хуків** у `docs/chapter-04-infrastructure/deployment-guide.md` — коди виходу і `set -e`, `continueOnError`, тестування хуків ізольовано з `azd hooks run`, ОС-специфічні оболонки та `--debug`
- **👥 Розділ командних/спільних середовищ** у `docs/chapter-03-configuration/configuration.md` — що зберігається у `.azure/`, що ігнорувати в git, середовища для кожного розробника, `azd env list`/`select` і надання значень середовища у CI/CD
- **🧰 Пояснення `azd restore` та розширені `azd package`** у `resources/cheat-sheet.md` — відновлення залежностей і створення артефакту для розгортання без його безпосереднього розгортання

#### Зміни
- **🧭 Оновлено таблицю лекцій розділу 4** для включення нової лекції "Створення власного шаблону" (Урок 3)
- **🧭 Оновлено таблицю лекцій розділу 1** для включення нової лекції "Dev Containers & Codespaces" (Урок 5); навігаційні колонтитули пов’язані між `bring-your-own-app.md` і `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заповнення прогалин для початківців: практичний урок з мульти-агентами, "Додай свій додаток", Terraform і огляд CI/CD
**Ця версія закриває найбільші прогалини для повного гіда для початківців, додавши два нових практичних уроки (покрокове розгортування мульти-агента і додавання azd до існуючого додатка), дружнє для початківців введення в хуки, розділ про Terraform з azd, покроковий огляд конвеєра GitHub Actions, пояснювач нових прев'ю-розширень та явний чеклист перевірки розгортання.**

#### Додано
- **🤝 Нова лекція розділу 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — повністю практичний, розгортуваний покроковий огляд двоагентної системи (оркестратор + спеціалісти) з використанням реального шаблону (`contoso-creative-writer`), що охоплює коли використовувати мульти-агент, робочий процес `azd up`, розуміння розгорнутих ресурсів, скрізьагентське трасування, налаштування і очищення
- **📦 Нова лекція розділу 1** `docs/chapter-01-foundation/bring-your-own-app.md` — як додати azd до наявного проєкту з `azd init` ("використовувати код в поточній директорії"), розуміння `azure.yaml` і `infra/`, `azd infra generate`, виявлення хоста та розгортання з `azd up`
- **🌐 Додано розділ Terraform з azd** у `docs/chapter-04-infrastructure/provisioning.md` — конфігурація `infra.provider: terraform`, структура папок `.tf`, обов’язкові виходи `AZURE_*` і тегування `azd-env-name` та ідентичний робочий процес `azd up` / `azd down` (закриває прогалину, де підтримка Terraform була заявлена, але показаний лише Bicep)
- **⚙️ Покрокова інструкція GitHub Actions** у `docs/chapter-08-production/production-ai-practices.md` — від репозиторію GitHub до автоматичних розгортань: `azd pipeline config`, федеровані облікові дані OIDC (без збережених секретів), згенерований `azure-dev.yml`, та рекомендації щодо секретів і змінних
- **🪝 Введення для початківців "Новачок у хукках?"** у `docs/chapter-04-infrastructure/deployment-guide.md` — що таке хук, таблиця етапів хуків, мінімальний перший хук і ручне запускаання хуків через `azd hooks run`
- **✅ Контрольний список "Перевірте Ваше Розгортання"** доданий до Кроку 5 у `docs/chapter-01-foundation/first-project.md` — smoke test, перевірка health-endpoint, та явні критерії успіху
- **🧩 Пояснення для нових розширень превʼю** `azure.ai.skills` та `azure.ai.connections` (що це таке і коли їх використовувати) у `docs/chapter-08-production/production-ai-practices.md`

#### Змінено
- **🧭 Таблиця уроків Глава 5** виправлена: `multi-agent-basics.md` тепер урок 1 (єдиний повністю практичний урок) з чесною позначкою, що урок 2 знаходиться у Главі 6, а сценарій Retail — це архітектурний шаблон, а не команда для одного запуску
- **🧭 Таблиця уроків Глава 1** тепер включає новий урок "Принеси свій додаток" (урок 4)
- **🔗 Навігаційні підвали** оновлено: `first-project.md` тепер посилається вперед на `bring-your-own-app.md`

#### Виправлено
- **🧱 Закрито "заявлений але відсутній" пробіл Terraform** — курс раніше посилався на підтримку Terraform, не показуючи її
- **🔀 Виправлено оманливі перехресні посилання у Главі 5**, які натякали на існування повної багатофункціональної реалізації, коли була лише архітектурна схема

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

#### Оновлення AZD 1.25.6, Повний життєвий цикл агента та ребрендинг Aspire
**Ця версія повторно валідує курс з огляду на `azd` `1.25.6` (червень 2026) та розширення `azure.ai.agents` `0.1.40-preview`, розширює керівництво штучним інтелектом від "створити агента" до повного життєвого циклу агента (тест → оцінка → оптимізація → аналіз → видалення), висвітлює нові розширення превʼю `azure.ai.skills` і `azure.ai.connections` та відзначає ребрендинг продукту ".NET Aspire" → "Aspire".**

#### Додано
- **🔁 Повне покриття життєвого циклу агентів** для початківців та інженерів ШІ у документації:
  - `docs/chapter-01-foundation/azd-basics.md` — Таблиця життєвого циклу (створення → тестування → вимірювання → покращення → аналіз → очищення) додана в розділ Розширень та Команд для ШІ
  - `docs/chapter-08-production/production-ai-practices.md` — Новий розділ "Управління життєвим циклом агента" охоплює `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, та `delete --force`
  - `resources/cheat-sheet.md` — Розширені команди AI Agent з `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, та `delete --force`
- **🧩 Нові розширення превʼю** задокументовані: `azure.ai.skills` (повторно використовувані навички агента) та `azure.ai.connections` (підключення Foundry) додані до таблиці розширень та шпаргалки
- **⏱️ Рекомендації щодо часу відповіді** — у прикладах `azd ai agent invoke` тепер виводиться загальна затримка та час до першого байта
- **📌 Банер версії** у головному README, який спрямовує учнів до `azd version` та `azd upgrade`

#### Змінено
- **✅ Оновлено базову лінію валідації** з `azd 1.23.12` (березень 2026) до `azd 1.25.6` (червень 2026) у всіх README глав та документації майстер-класів
- **🤖 Оновлено примітку розширення у Главі 2** з `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Оновлено приклад валідації майстер-класу** (вивід `azd version`) до `1.25.6`
- **🧭 Оновлено README "Що нового сьогодні в azd"** щоб висвітлити повний життєвий цикл агентів, нові AI-розширення та нещодавні покращення якості життя (`azd init` ідемпотентність, очищення застарілих токенів `azd auth login`, початковий запит `azd tool`)
- **📖 Файл agents.md у Главі 2 (Варіант 4)** тепер направляє учнів до команд життєвого циклу після розгортання, замість зупинки на `azd up`

#### Виправлено
- **🏷️ Іменування продукту** — додано примітку про ребрендинг Aspire (".NET Aspire" тепер просто "Aspire"); підтримка Aspire у azd без змін
- **🔎 Перевірка випуску в реальному часі** підтверджена за допомогою каналу випусків Azure Developer CLI: стабільний CLI `1.25.6` (2026-06-12) та `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Уточнення для новачків, перевірка налаштувань і фінальне очищення команд AZD
**Ця версія слідує за перевіркою AZD 1.23 з документацією, орієнтованою на початківців: уточнює керівництво автентифікації AZD, додає локальні скрипти перевірки налаштувань, перевіряє ключові команди проти живого інтерфейсу AZD CLI та видаляє останні застарілі посилання на команди англійської версії поза журналом змін.**

#### Додано
- **🧪 Скрипти перевірки налаштувань для початківців** з `validate-setup.ps1` та `validate-setup.sh`, щоб учні могли впевнитися у наявності необхідних інструментів перед початком Глави 1
- **✅ Кроки перевірки налаштувань на старті** у головному README та README Глави 1, щоб виявляти відсутні передумови до `azd up`

#### Змінено
- **🔐 Керівництво по автентифікації для початківців** тепер послідовно розглядає `azd auth login` як основний шлях для робочих процесів AZD, а `az login` відзначено як опціональний, якщо не використовуються безпосередньо команди Azure CLI
- **📚 Потік ознайомлення у Главі 1** тепер направляє учнів перевірити локальне налаштування перед інсталяцією, автентифікацією та першими кроками розгортання
- **🛠️ Повідомлення валідатора** чітко розділяють обовʼязкові вимоги від необовʼязкових попереджень Azure CLI для шляху початківця виключно через AZD
- **📖 Конфігурація, вирішення проблем та приклади** тепер відокремлюють обовʼязкову автентифікацію AZD від необовʼязкової авторизації Azure CLI там, де раніше обидва подавалися без контексту

#### Виправлено
- **📋 Оновлення залишкових посилань на команди англійської версії** до актуальних форм AZD, включно з `azd config show` у шпаргалці та `azd monitor --overview` у випадках, де передбачалося керівництво для Azure Portal
- **🧭 Помʼякшено твердження для початківців у Главі 1**, щоб уникнути надмірних обіцянок гарантовано безпомилкової або безвідкочувальної поведінки в усіх шаблонах та ресурсах Azure
- **🔎 Валідація CLI у реальному часі** підтверджує поточну підтримку `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` та `azd down --force --purge`

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

#### Валідація AZD 1.23.12, розширення середовища майстер-класів та оновлення AI-моделі
**Ця версія виконує перевірку документації проти `azd` `1.23.12`, оновлює застарілі приклади команд AZD, оновлює рекомендації AI-моделі до поточних значень за замовчуванням і розширює інструкції майстер-класу з GitHub Codespaces до підтримки контейнерів розробника та локальних копій.**

#### Додано
- **✅ Примітки валідації по основних главах та документації майстер-класів** щоб зробити явною протестовану базову лінію AZD для користувачів нових або старих збірок CLI
- **⏱️ Рекомендації щодо часу очікування розгортання** для довготривалих розгортань AI-додатків з використанням `azd deploy --timeout 1800`
- **🔎 Кроки інспекції розширень** з використанням `azd extension show azure.ai.agents` в документації робочих процесів AI
- **🌐 Розширені рекомендації середовищ майстер-класів** що охоплюють GitHub Codespaces, контейнери розробника, та локальні копії з MkDocs

#### Змінено
- **📚 Вступні README по главах** тепер послідовно вказують на валідацію за `azd 1.23.12` у розділах основ, конфігурації, інфраструктури, мультиагента, попереднього розгортання, усунення неполадок та продакшену
- **🛠️ Посилання на команди AZD** оновлено до актуальних форм по всій документації:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` або `azd env get-value(s)` залежно від контексту
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, де мається на увазі огляд Application Insights
- **🧪 Спрощені приклади попереднього перегляду розгортання** до підтримуваних варіантів, таких як `azd provision --preview` і `azd provision --preview -e production`
- **🧭 Оновлений потік майстер-класу** — учням дозволено виконувати лабораторії у Codespaces, контейнері розробника або локальній копії, замість припущення лише виконання в Codespaces
- **🔐 Керівництво автентифікації** тепер надає перевагу `azd auth login` для робочих процесів AZD, а `az login` подано як опціональний, якщо безпосередньо використовуються команди Azure CLI

#### Виправлено
- **🪟 Команди встановлення для Windows** нормалізовані до поточного написання пакету `winget` у посібнику з інсталяції
- **🐧 Інструкції з встановлення Linux** виправлено, щоб уникнути інструкцій щодо пакетного менеджера, що не підтримуються для конкретних дистрибутивів `azd`, та замість цього вказано на релізні активи, де це доречно
- **📦 Приклади моделей штучного інтелекту** оновлено з застарілих за замовчуванням, таких як `gpt-35-turbo` та `text-embedding-ada-002`, до актуальних прикладів, таких як `gpt-4.1-mini`, `gpt-4.1` та `text-embedding-3-large`
- **📋 Фрагменти для розгортання та діагностики** виправлено для використання поточних команд середовища та статусу у журналах, скриптах і кроках усунення несправностей
- **⚙️ Інструкції з GitHub Actions** оновлено з `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Інструкції з погодження MCP/Copilot** оновлено з `azd mcp consent` на `azd copilot consent list`

#### Покращено
- **🧠 Керівництво по AI** тепер краще пояснює поведінку, чутливу до попереднього перегляду `azd ai`, специфічний для орендаря вхід, поточне використання розширення та оновлені рекомендації щодо розгортання моделей
- **🧪 Інструкції для майстерень** тепер використовують більш реалістичні приклади версій і чіткішу мову налаштування середовища для практичних лабораторій
- **📈 Документація з виробництва та усунення несправностей** тепер краще узгоджується з поточним моніторингом, моделями запасних варіантів і прикладами рівнів вартості

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

#### Команди AZD AI CLI, перевірка вмісту та розширення шаблонів
**Ця версія додає покриття команд `azd ai`, `azd extension` та `azd mcp` у всіх главах, пов’язаних з ШІ, виправляє непрацюючі посилання та застарілий код у agents.md, оновлює шпаргалку та повністю переробляє розділ з прикладами шаблонів з підтвердженими описами та новими шаблонами Azure AI AZD.**

#### Додано
- **🤖 Покриття AZD AI CLI** у 7 файлах (раніше лише у розділі 8):
  - `docs/chapter-01-foundation/azd-basics.md` — новий розділ "Розширення та команди ШІ", у якому представлені `azd extension`, `azd ai agent init` та `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Варіант 4: `azd ai agent init` з таблицею порівняння (підхід шаблону проти маніфесту)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — підрозділи "Розширення AZD для Foundry" та "Деплоймент агента першого рівня"
  - `docs/chapter-05-multi-agent/README.md` — Швидкий старт тепер показує шляхи розгортання за шаблоном і за маніфестом
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Розділ Deploy тепер включає опцію `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — підрозділ "Команди розширення AZD AI для діагностики"
  - `resources/cheat-sheet.md` — новий розділ "Команди ШІ та розширень" з `azd extension`, `azd ai agent init`, `azd mcp` та `azd infra generate`
- **📦 Нові приклади шаблонів AZD AI** у `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — чат RAG на .NET з Blazor WebAssembly, Semantic Kernel та підтримкою голосового чату
  - **azure-search-openai-demo-java** — чат RAG на Java з Langchain4J з опціями розгортання ACA/AKS
  - **contoso-creative-writer** — мультиагентський додаток для творчого письма з Azure AI Agent Service, Bing Grounding та Prompty
  - **serverless-chat-langchainjs** — serverless RAG із Azure Functions + LangChain.js + Cosmos DB з локальною підтримкою Ollama для розробки
  - **chat-with-your-data-solution-accelerator** — корпоративний акселератор RAG з адміністраторським порталом, інтеграцією з Teams і опціями PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — оркестраційний референс-додаток мультиагентської MCP з серверами на .NET, Python, Java та TypeScript
  - **azd-ai-starter** — мінімальний початковий шаблон інфраструктури Azure AI Bicep
  - **🔗 Посилання на чудову AZD AI галерею** — посилання на [відмінну галерею AI AZD](https://azure.github.io/awesome-azd/?tags=ai) (понад 80 шаблонів)

#### Виправлено
- **🔗 Навігація в agents.md**: посилання "Попередній/Наступний" тепер відповідають порядку уроків у README розділу 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Непрацюючі посилання в agents.md**: `production-ai-practices.md` виправлено на `../chapter-08-production/production-ai-practices.md` (3 випадки)
- **📦 Застарілий код в agents.md**: замінено `opencensus` на `azure-monitor-opentelemetry` та OpenTelemetry SDK
- **🐛 Неправильний API в agents.md**: переміщено `max_tokens` з `create_agent()` до `create_run()` як `max_completion_tokens`
- **🔢 Підрахунок токенів в agents.md**: грубу оцінку `len//4` замінено на `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: виправлено сервіси з "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (за замовчуванням хост змінено на жовтень 2024)
- **contoso-chat**: оновлено опис відповідно до Azure AI Foundry + Prompty, що відповідає фактичній назві репозиторію та технологічному стеку

#### Видалено
- **ai-document-processing**: видалено посилання на нефункціональний шаблон (репозиторій не є публічно доступним як AZD шаблон)

#### Покращено
- **📝 вправи в agents.md**: Вправа 1 тепер показує очікуваний результат і крок `azd monitor`; Вправа 2 містить повний код реєстрації `FunctionTool`; Вправа 3 замінює нечіткі інструкції на конкретні команди `prepdocs.py`
- **📚 ресурси agents.md**: оновлено посилання на документацію Azure AI Agent Service та швидкий старт
- **📋 таблиця "Наступні кроки" в agents.md**: додано посилання на лабораторію AI Workshop для повного охоплення розділу

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

#### Покращення навігації по курсу
**Ця версія покращує навігацію README.md між розділами з покращеним форматом таблиці.**

#### Змінено
- **Таблиця карти курсу**: покращено з прямими лінками на уроки, оцінками тривалості та рівня складності
- **Очищення папок**: видалено застарілі старі папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Перевірка посилань**: підтверджено більше 21 внутрішнє посилання в таблиці карти курсу

### [v3.16.0] - 2026-02-05

#### Оновлення назв продуктів
**Ця версія оновлює згадки про продукти відповідно до актуального брендингу Microsoft.**

#### Змінено
- **Microsoft Foundry → Microsoft Foundry**: оновлено всі згадки у нефайлових для перекладу файлах
- **Azure AI Agent Service → Foundry Agents**: поновлено назву сервісу відповідно до актуального брендингу

#### Оновлені файли
- `README.md` - Головна сторінка курсу
- `changelog.md` - Історія версій
- `course-outline.md` - Структура курсу
- `docs/chapter-02-ai-development/agents.md` - Посібник із агентів ШІ
- `examples/README.md` - Документація прикладів
- `workshop/README.md` - Головна сторінка майстерні
- `workshop/docs/index.md` - Індекс майстерні
- `workshop/docs/instructions/*.md` - Всі файли інструкцій майстерні

---

### [v3.15.0] - 2026-02-05

#### Велика реструктуризація репозиторію: Папки за номерами розділів
**Ця версія реструктурує документацію у виділені папки розділів для кращої навігації.**

#### Перейменування папок
Старі папки замінені на папки з номерами розділів:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Додано нову папку: `docs/chapter-05-multi-agent/`

#### Міграції файлів
| Файл | З | В |
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
- **📚 README файли розділів**: створено README.md у кожній папці розділу з:
  - навчальними цілями та тривалістю
  - таблицею уроків з описами
  - командами швидкого старту
  - навігацією до інших розділів

#### Змінено
- **🔗 Оновлено всі внутрішні посилання**: 78+ шляхів оновлено у всіх документах
- **🗺️ Головний README.md**: оновлено карту курсу з новою структурою розділів
- **📝 examples/README.md**: оновлені посилання на папки розділів

#### Видалено
- Стара структура папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризація репозиторію: навігація по розділах
**Ця версія додала README файли для навігації по розділах (спростовані версією v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новий посібник з агентів ШІ
**Ця версія додає всебічний посібник із розгортання агентів ШІ за допомогою Azure Developer CLI.**

#### Додано
- **🤖 docs/microsoft-foundry/agents.md**: повний посібник, що охоплює:
  - Що таке агенти ШІ та як вони відрізняються від чатботів
  - Три шаблони швидкого старту агентів (Foundry Agents, Prompty, RAG)
  - Патерни архітектури агентів (окремий агент, RAG, мультиагент)
  - Налаштування інструментів і кастомізація
  - Моніторинг та відстеження метрик
  - Розгляд вартості та оптимізація
  - Поширені сценарії усунення несправностей
  - Три практичні вправи з критеріями успіху

#### Структура змісту
- **Вступ**: концепції агентів для початківців
- **Швидкий старт**: розгортання агентів із `azd init --template get-started-with-ai-agents`
- **Патерни архітектури**: візуальні діаграми патернів агентів
- **Налаштування**: налаштування інструментів та змінні оточення
- **Моніторинг**: інтеграція з Application Insights
- **Вправи**: поступове практичне навчання (по 20-45 хвилин кожна)

---

### [v3.12.0] - 2026-02-05

#### Оновлення середовища DevContainer
**Ця версія оновлює конфігурацію контейнера розробника з сучасними інструментами і кращими налаштуваннями за замовчуванням для досвіду AZD.**

#### Змінено
- **🐳 Базовий образ**: оновлено з `python:3.12-bullseye` до `python:3.12-bookworm` (остання стабільна версія Debian)
- **📛 Назва контейнера**: перейменовано з "Python 3" на "AZD для початківців" для кращої зрозумілості

#### Додано
- **🔧 Нові функції Dev Container**:
  - `azure-cli` з увімкненою підтримкою Bicep
  - `node:20` (LTS-версія для шаблонів AZD)
  - `github-cli` для управління шаблонами
  - `docker-in-docker` для розгортання container app

- **🔌 Проброс портів**: попередньо налаштовані порти для поширених випадків розробки:
  - 8000 (перегляд MkDocs)
  - 3000 (веб-застосунки)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Нові розширення VS Code**:
  - `ms-python.vscode-pylance` - покращений Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - підтримка Azure Functions
  - `ms-azuretools.vscode-docker` - підтримка Docker
  - `ms-azuretools.vscode-bicep` - підтримка мови Bicep
  - `ms-azure-devtools.azure-resource-groups` - управління ресурсами Azure
  - `yzhang.markdown-all-in-one` - редагування Markdown
  - `DavidAnson.vscode-markdownlint` - перевірка стилю Markdown
  - `bierner.markdown-mermaid` - підтримка діаграм Mermaid
  - `redhat.vscode-yaml` - підтримка YAML (для azure.yaml)
  - `eamodio.gitlens` - візуалізація Git
  - `mhutchie.git-graph` - історія Git

- **⚙️ Налаштування VS Code**: додано налаштування за замовчуванням для інтерпретатора Python, автоформату при збереженні і обрізання пробілів

- **📦 Оновлено requirements-dev.txt**:
  - додано плагін для мініфікації MkDocs
  - додано pre-commit для контролю якості коду
  - додано пакети Azure SDK (azure-identity, azure-mgmt-resource)

#### Виправлено
- **Команда Post-Create**: тепер перевіряє встановлення AZD та Azure CLI при запуску контейнера

---

### [v3.11.0] - 2026-02-05

#### Переосмислення README для початківців
**Ця версія значно покращує README.md, роблячи його доступнішим для початківців, та додає необхідні ресурси для розробників ШІ.**

#### Додано
- **🆚 Порівняння Azure CLI і AZD**: чітке пояснення, коли використовувати кожен із інструментів із практичними прикладами
- **🌟 Чарівні посилання AZD**: прямі посилання на галерею шаблонів спільноти та ресурси для внеску:
  - [Чудова галерея AZD](https://azure.github.io/awesome-azd/) - понад 200 готових до розгортання шаблонів
  - [Подати шаблон](https://github.com/Azure/awesome-azd/issues) - внесок від спільноти
- **🎯 Посібник швидкого старту**: спрощений розділ з 3 кроків (Встановити → Увійти → Розгорнути)
- **📊 Таблиця навігації на основі досвіду**: чіткі вказівки, з чого починати залежно від досвіду розробника

#### Змінено
- **Структура README**: реорганізовано для поступового розкриття — ключова інформація на початку
- **Розділ Вступ**: переписано для пояснення "Чарівності `azd up`" для абсолютних початківців
- **Видалено дублікати контенту**: вилучено дублікований розділ усунення несправностей
- **Команди для усунення несправностей**: Виправлено посилання `azd logs` для використання дійсного `azd monitor --logs`

#### Виправлено
- **🔐 Команди автентифікації**: Додано `azd auth login` та `azd auth logout` до cheat-sheet.md
- **Недійсні посилання на команди**: Видалено залишкові `azd logs` з розділу усунення несправностей README

#### Примітки
- **Обсяг**: Зміни застосовано до основного README.md та resources/cheat-sheet.md
- **Цільова аудиторія**: Поліпшення орієнтовані спеціально на новачків у AZD

---

### [v3.10.0] - 2026-02-05

#### Оновлення точності команд Azure Developer CLI
**Ця версія виправляє неіснуючі команди AZD у всій документації, забезпечуючи, щоб усі кодові приклади використовували дійсний синтаксис Azure Developer CLI.**

#### Виправлено
- **🔧 Видалено неіснуючі команди AZD**: Комплексний аудит та виправлення недійсних команд:
  - `azd logs` (не існує) → замінено на `azd monitor --logs` або альтернативи Azure CLI
  - субкоманди `azd service` (не існують) → замінено на `azd show` та Azure CLI
  - `azd infra import/export/validate` (не існують) → видалено або замінено на дійсні альтернативи
  - прапорці `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не існують) → видалено
  - прапорці `azd provision --what-if/--rollback` (не існують) → оновлено на використання `--preview`
  - `azd config validate` (не існує) → замінено на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не існують) → видалено

- **📚 Оновлені файли з виправленнями команд**:
  - `resources/cheat-sheet.md`: Значна ревізія посилань на команди
  - `docs/deployment/deployment-guide.md`: Виправлено стратегії rollback та розгортання
  - `docs/troubleshooting/debugging.md`: Виправлено розділи аналізу журналів
  - `docs/troubleshooting/common-issues.md`: Оновлено команди усунення несправностей
  - `docs/troubleshooting/ai-troubleshooting.md`: Виправлено розділ налагодження AZD
  - `docs/getting-started/azd-basics.md`: Виправлено команди моніторингу
  - `docs/getting-started/first-project.md`: Оновлено приклади моніторингу та налагодження
  - `docs/getting-started/installation.md`: Виправлено приклади допомоги та версії
  - `docs/pre-deployment/application-insights.md`: Виправлено команди перегляду журналів
  - `docs/pre-deployment/coordination-patterns.md`: Виправлено команди налагодження агента

- **📝 Оновлено посилання версії**: 
  - `docs/getting-started/installation.md`: Змінено жорстко закодовану версію `1.5.0` на загальний `1.x.x` з посиланням на релізи

#### Змінено
- **Стратегії відкату**: Оновлено документацію з використанням відкату на основі Git (AZD не має вбудованого відкату)
- **Перегляд журналів**: Замінено посилання `azd logs` на `azd monitor --logs`, `azd monitor --live` та команди Azure CLI
- **Розділ продуктивності**: Видалено неіснуючі прапорці паралельного/інкрементального розгортання, запропоновано дійсні альтернативи

#### Технічні деталі
- **Дійсні команди AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Дійсні прапорці azd monitor**: `--live`, `--logs`, `--overview`
- **Видалені функції**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Примітки
- **Перевірка**: Команди перевірено на відповідність Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершення воркшопу та оновлення якості документації
**Ця версія завершує інтерактивні модулі воркшопу, виправляє всі зламані посилання в документації та покращує загальну якість контенту для AI-розробників, що використовують Microsoft AZD.**

#### Додано
- **📝 CONTRIBUTING.md**: Новий документ з керівними принципами внеску з:
  - Чіткими інструкціями для звітування про проблеми та пропозиції змін
  - Стандартами документації для нового контенту
  - Керівництвом з прикладів коду та конвенціями повідомлень комітів
  - Інформацією про залучення спільноти

#### Завершено
- **🎯 Модуль воркшопу 7 (Підсумок)**: Повністю завершено модуль підсумку з:
  - Всебічним оглядом досягнень воркшопу
  - Розділом освоєних ключових понять для AZD, шаблонів і Microsoft Foundry
  - Рекомендаціями щодо продовження навчальної подорожі
  - Вправами-челенджами з рейтингом складності
  - Посиланнями на зворотній зв’язок та підтримку спільноти

- **📚 Модуль воркшопу 3 (Деконструкція)**: Оновлено навчальні цілі з:
  - Активування GitHub Copilot з MCP серверами
  - Розуміння структури папки шаблонів AZD
  - Організаційні патерни інфраструктури як коду (Bicep)
  - Інструкції для практичних лабораторних робіт

- **🔧 Модуль воркшопу 6 (Завершення)**: Завершено з:
  - Цілями очищення ресурсів та управління витратами
  - Використанням `azd down` для безпечного вилучення інфраструктури
  - Керівництвом щодо відновлення послуг зі м’яким видаленням
  - Додатковими підказками для дослідження GitHub Copilot та Azure Portal

#### Виправлено
- **🔗 Виправлення зламаних посилань**: Вирішено 15+ зламаних внутрішніх посилань в документації:
  - `docs/ai-foundry/ai-model-deployment.md`: Виправлено шляхи до microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Виправлено шляхи ai-model-deployment.md та production-ai-practices.md
  - `docs/getting-started/first-project.md`: Замінено неіснуючий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Виправлено шляхи FAQ та посібника з усунення несправностей
  - `examples/container-app/microservices/README.md`: Виправлено шляхи головної сторінки курсу та посібника з розгортання
  - `resources/faq.md` та `resources/glossary.md`: Оновлено посилання на розділи про AI
  - `course-outline.md`: Виправлено посилання на посібник інструктора і лабораторні роботи AI воркшопу

- **📅 Банер статусу воркшопу**: Оновлено з "Триває будівництво" на активний статус воркшопу із датою лютий 2026

- **🔗 Навігація воркшопу**: Виправлено зламані навігаційні посилання в README.md воркшопу, що вели на неіснуючу папку lab-1-azd-basics

#### Змінено
- **Презентація воркшопу**: Видалено попередження "триває будівництво", воркшоп тепер завершено та готовий до використання
- **Послідовність навігації**: Забезпечено коректну міжмодульну навігацію у всіх модулях воркшопу
- **Посилання на навчальний шлях**: Оновлено перехресні посилання на розділи з правильними шляхами microsoft-foundry

#### Перевірено
- ✅ Усі англійські markdown-файли мають дійсні внутрішні посилання
- ✅ Модулі воркшопу 0-7 завершені з навчальними цілями
- ✅ Навігація між розділами та модулями функціонує правильно
- ✅ Контент підходить для AI-розробників, що використовують Microsoft AZD
- ✅ Збережено дружню для початківців мову та структуру
- ✅ CONTRIBUTING.md надає чіткі вказівки для контрибуторів спільноти

#### Технічна реалізація
- **Перевірка посилань**: Автоматизований скрипт PowerShell перевірив усі внутрішні посилання .md файлів
- **Аудит контенту**: Ручний огляд повноти воркшопу та відповідності для початківців
- **Система навігації**: Впроваджено послідовні шаблони навігації розділів і модулів

#### Примітки
- **Обсяг**: Зміни застосовані лише до англійської документації
- **Переклади**: Папки з перекладами не оновлювались у цій версії (автоматичний переклад буде синхронізовано пізніше)
- **Тривалість воркшопу**: Повний воркшоп тепер надає 3-4 години практичного навчання

---

### [v3.8.0] - 2025-11-19

#### Розширена документація: Моніторинг, безпека та патерни мультиагентства
**Ця версія додає комплексні уроки рівня A щодо інтеграції Application Insights, патернів автентифікації та координації мультиагентів для продуктивних розгортань.**

#### Додано
- **📊 Урок інтеграції Application Insights**: у `docs/pre-deployment/application-insights.md`:
  - Розгортання з фокусом на AZD з автоматичним наданням
  - Повні шаблони Bicep для Application Insights + Log Analytics
  - Робочі Python-додатки з кастомним телеметрією (понад 1,200 рядків)
  - Патерни моніторингу AI/LLM (відстеження токенів/витрат Microsoft Foundry Models)
  - 6 діаграм Mermaid (архітектура, розподілене трасування, потік телеметрії)
  - 3 практичні вправи (оповіщення, панелі моніторингу, AI-моніторинг)
  - Приклади запитів Kusto і стратегії оптимізації витрат
  - Потокове передавання метрик наживо та налагодження у реальному часі
  - 40-50 хвилин часу навчання з патернами, готовими для продуктиву

- **🔐 Урок патернів автентифікації та безпеки**: у `docs/getting-started/authsecurity.md`:
  - 3 патерни автентифікації (рядки підключення, Key Vault, керована ідентичність)
  - Повні шаблони інфраструктури Bicep для безпечних розгортань
  - Код додатка Node.js з інтеграцією Azure SDK
  - 3 повних вправи (активація керованої ідентичності, призначеної користувачем ідентичності, ротація Key Vault)
  - Рекомендації з безпеки та конфігурації RBAC
  - Посібник з усунення несправностей та аналіз витрат
  - Готові до продуктиву патерни автентифікації без паролів

- **🤖 Урок патернів координації мультиагентів**: у `docs/pre-deployment/coordination-patterns.md`:
  - 5 патернів координації (послідовний, паралельний, ієрархічний, орієнтований на події, консенсус)
  - Повна реалізація сервісу оркестратора (Python/Flask, понад 1,500 рядків)
  - 3 спеціалізовані реалізації агентів (дослідник, письменник, редактор)
  - Інтеграція з Service Bus для черг повідомлень
  - Управління станом у Cosmos DB для розподілених систем
  - 6 діаграм Mermaid, що демонструють взаємодію агентів
  - 3 вдосконалені вправи (обробка таймаутів, логіка повторних спроб, автомат вимкнення)
  - Розбивка витрат ($240-565/місяць) із стратегіями оптимізації
  - Інтеграція Application Insights для моніторингу

#### Покращено
- **Розділ перед розгортанням**: Тепер включає комплексні патерни моніторингу та координації
- **Розділ початку роботи**: Покращено професійними патернами автентифікації
- **Готовність до продуктиву**: Повне охоплення від безпеки до обсервабельності
- **Опис курсу**: Оновлено з посиланням на нові уроки в розділах 3 і 6

#### Змінено
- **Прогрес навчання**: Покращена інтеграція безпеки та моніторингу впродовж курсу
- **Якість документації**: Послідовні стандарти рівня A (95-97%) у нових уроках
- **Патерни для продуктивних розгортань**: Повне покриття сценаріїв для корпоративних розгортань

#### Поліпшено
- **Досвід розробника**: Чіткий шлях від розробки до моніторингу продуктиву
- **Стандарти безпеки**: Професійні патерни для автентифікації і керування секретами
- **Обсервабельність**: Повна інтеграція Application Insights з AZD
- **Навантаги AI**: Спеціалізоване моніторинг для Microsoft Foundry Models та мультиагентських систем

#### Перевірено
- ✅ Всі уроки включають повний робочий код (не фрагменти)
- ✅ Діаграми Mermaid для візуального навчання (всього 19 у 3 уроках)
- ✅ Практичні вправи з кроками перевірки (всього 9)
- ✅ Готові до продуктиву Bicep шаблони, що можна розгорнути через `azd up`
- ✅ Аналіз витрат та стратегії оптимізації
- ✅ Посібники з усунення несправностей та найкращі практики
- ✅ Контрольні точки знань з перевірочними командами

#### Результати оцінки документації
- **docs/pre-deployment/application-insights.md**: - Комплексний посібник з моніторингу
- **docs/getting-started/authsecurity.md**: - Професійні патерни безпеки
- **docs/pre-deployment/coordination-patterns.md**: - Розвинені архітектури мультиагентства
- **Загальний новий контент**: - Послідовні високоякісні стандарти

#### Технічна реалізація
- **Application Insights**: Log Analytics + кастомна телеметрія + розподілене трасування
- **Автентифікація**: Керована ідентичність + Key Vault + патерни RBAC
- **Мультиагентство**: Service Bus + Cosmos DB + Container Apps + оркестрація
- **Моніторинг**: Метрики наживо + запити Kusto + оповіщення + панелі 
- **Управління витратами**: Стратегії вибірки, політики збереження, бюджетні контролі

### [v3.7.0] - 2025-11-19

#### Покращення якості документації та новий приклад Microsoft Foundry Models
**Ця версія покращує якість документації по всьому репозиторію та додає повний приклад розгортання Microsoft Foundry Models з інтерфейсом чату gpt-4.1.**

#### Додано
- **🤖 Приклад чату Microsoft Foundry Models**: Повне розгортання gpt-4.1 з робочою реалізацією у `examples/azure-openai-chat/`:
  - Повна інфраструктура Microsoft Foundry Models (розгортання моделі gpt-4.1)
  - Інтерфейс командного рядка Python для чату з історією розмов
  - Інтеграція з Key Vault для безпечного зберігання API ключів
  - Відстеження використання токенів і оцінка вартості
  - Обмеження швидкості та обробка помилок
  - Комплексний README з інструкцією розгортання на 35-45 хвилин
  - 11 файлів, готових до продуктиву (шаблони Bicep, Python-додаток, конфігурація)
- **📚 Вправи з документації**: Додано практичні вправи до посібника з конфігурації:
  - Вправа 1: Налаштування багатьох середовищ (15 хвилин)
  - Вправа 2: Практика керування секретами (10 хвилин)
  - Чіткі критерії успіху та кроки перевірки
- **✅ Перевірка розгортання**: Додано розділ перевірки до посібника з розгортання:
  - Процедури перевірки стану
  - Контрольний список критеріїв успішності
  - Очікувані результати для усіх команд розгортання
  - Швидкі посилання для усунення несправностей

#### Покращено
- **examples/README.md**: Оновлено до якості рівня А (93%):
  - Додано azure-openai-chat до всіх відповідних розділів
  - Оновлено кількість локальних прикладів з 3 до 4
  - Додано до таблиці прикладів AI-додатків
  - Інтегровано у розділ Quick Start для користувачів середнього рівня
  - Додано до розділу шаблонів Microsoft Foundry
  - Оновлено порівняльну матрицю і розділи пошуку технологій
- **Якість документації**: Покращено з B+ (87%) до A- (92%) у папці docs:
  - Додані очікувані результати до критичних прикладів команд
  - Включені кроки перевірки змін конфігурації
  - Покращено практичне навчання за допомогою практичних вправ

#### Змінено
- **Прогрес навчання**: Краща інтеграція прикладів ШІ для проміжних користувачів
- **Структура документації**: Більше дієвих вправ із чіткими результатами
- **Процес перевірки**: Додані явні критерії успіху до ключових робочих процесів

#### Покращено
- **Досвід розробника**: Розгортання моделей Microsoft Foundry тепер займає 35-45 хвилин (проти 60-90 для складніших альтернатив)
- **Прозорість витрат**: Чіткі оцінки вартості ($50-200/місяць) для прикладу Microsoft Foundry Models
- **Шлях навчання**: Розробники ШІ мають чітку точку входу з azure-openai-chat
- **Стандарти документації**: Послідовні очікувані результати та кроки перевірки

#### Верифіковано
- ✅ Приклад Microsoft Foundry Models повністю функціональний з `azd up`
- ✅ Усі 11 файлів реалізації синтаксично коректні
- ✅ Інструкції README відповідають фактичному досвіду розгортання
- ✅ Посилання в документації оновлені у більш ніж 8 місцях
- ✅ Індекс прикладів точно відображає 4 локальні приклади
- ✅ В таблицях немає дублікатів зовнішніх посилань
- ✅ Усі посилання навігації правильні

#### Технічна реалізація
- **Архітектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps патерн
- **Безпека**: готова Managed Identity, секрети в Key Vault
- **Моніторинг**: інтеграція з Application Insights
- **Управління витратами**: відстеження токенів та оптимізація використання
- **Розгортання**: Одна команда `azd up` для повного налаштування

### [v3.6.0] - 2025-11-19

#### Велике оновлення: Приклади розгортання Container App
**Ця версія представляє комплексні приклади розгортання контейнерних додатків, готових до виробництва, з використанням Azure Developer CLI (AZD), із повною документацією та інтеграцією в навчальний шлях.**

#### Додано
- **🚀 Приклади Container App**: Нові локальні приклади у `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Повний огляд контейнерних розгортань, швидкий старт, виробництво та розширені патерни
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Дружній до початківців REST API з масштабуванням до нуля, перевірками стану, моніторингом і усуненням несправностей
  - [Microservices Architecture](../../examples/container-app/microservices): Готове до виробництва мультисервісне розгортання (API Gateway, Product, Order, User, Notification), асинхронні повідомлення, Service Bus, Cosmos DB, Azure SQL, розподілене трасування, blue-green/canary розгортання
- **Найкращі практики**: Безпека, моніторинг, оптимізація витрат та рекомендації CI/CD для контейнерних робочих навантажень
- **Приклади коду**: Повна `azure.yaml`, Bicep шаблони та багато мови сервісні реалізації (Python, Node.js, C#, Go)
- **Тестування та усунення несправностей**: Сценарії енд-ту-енд тестування, команди моніторингу, рекомендації з усунення несправностей

#### Змінено
- **README.md**: Оновлено для включення нових прикладів контейнерних додатків у розділ "Local Examples - Container Applications"
- **examples/README.md**: Оновлено для висвітлення прикладів контейнерних додатків, додавання записів у матрицю порівнянь та оновлення технологічних/архітектурних посилань
- **Опис курсу та навчальний посібник**: Оновлено для посилання на нові приклади контейнерних додатків та патерни розгортання у відповідних розділах

#### Перевірено
- ✅ Усі нові приклади розгортаються за допомогою `azd up` та відповідають найкращим практикам
- ✅ Оновлені крос-посилання документації та навігація
- ✅ Приклади охоплюють від початкових до просунутих сценаріїв, включаючи виробничі мікросервіси

#### Зауваження
- **Обсяг**: Документація та приклади лише англійською
- **Наступні кроки**: Розширення з додатковими продвинутими контейнерними патернами та автоматизацією CI/CD у майбутніх релізах

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукту: Microsoft Foundry
**Ця версія впроваджує всебічну зміну назви продукту з "Microsoft Foundry" на "Microsoft Foundry" у всій англомовній документації, відображаючи офіційний ребрендинг Microsoft.**

#### Змінено
- **🔄 Оновлення назви продукту**: Повний ребрендинг з "Microsoft Foundry" на "Microsoft Foundry"
  - Оновлені всі посилання в англомовній документації в папці `docs/`
  - Перейменована папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Перейменований файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всього: 23 оновлення вмісту в 7 файлах документації

- **📁 Зміни в структурі папок**:
  - `docs/ai-foundry/` перейменовано на `docs/microsoft-foundry/`
  - Всі крос-посилання оновлені для відображення нової структури папок
  - Посилання навігації перевірені у всій документації

- **📄 Перейменування файлів**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всі внутрішні посилання оновлені для нового імені файлу

#### Оновлені файли
- **Документація розділів** (7 файлів):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 оновлення посилань навігації
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 посилання на назву продукту оновлено
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Вже використовується Microsoft Foundry (з попередніх оновлень)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 оновлення посилань (огляд, відгуки спільноти, документація)
  - `docs/getting-started/azd-basics.md` - 4 оновлення крос-посилань
  - `docs/getting-started/first-project.md` - 2 оновлення посилань навігації розділів
  - `docs/getting-started/installation.md` - 2 оновлення посилань наступного розділу
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 оновлення посилань (навігація, спільнота Discord)
  - `docs/troubleshooting/common-issues.md` - 1 оновлення посилання навігації
  - `docs/troubleshooting/debugging.md` - 1 оновлення посилання навігації

- **Файли структури курсу** (2 файли):
  - `README.md` - 17 оновлень посилань (огляд курсу, назви розділів, розділ шаблонів, інсайти спільноти)
  - `course-outline.md` - 14 оновлень посилань (огляд, навчальні цілі, ресурси розділу)

#### Верифіковано
- ✅ В англомовних документах не залишилось посилань на папку "ai-foundry"
- ✅ В англомовних документах не залишилось згадок назви продукту "Microsoft Foundry"
- ✅ Усі посилання навігації працюють з новою структурою папок
- ✅ Перейменування файлів і папок успішно виконано
- ✅ Крос-посилання між розділами перевірені

#### Зауваження
- **Обсяг**: Зміни застосовані лише до англомовної документації в папці `docs/`
- **Переклади**: Папки перекладів (`translations/`) не оновлювалися у цій версії
- **Майстер-клас**: Матеріали майстер-класів (`workshop/`) не оновлювалися у цій версії
- **Приклади**: Прикладні файли можуть і далі містити старі назви (вирішується у майбутньому оновленні)
- **Зовнішні посилання**: Зовнішні URL та посилання на репозиторій GitHub залишаються без змін

#### Посібник з міграції для контрибуторів
Якщо у вас є локальні гілки або документація, яка посилається на стару структуру:
1. Оновіть посилання папок: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Оновіть посилання файлів: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замініть назву продукту: "Microsoft Foundry" → "Microsoft Foundry"
4. Перевірте, що всі внутрішні посилання документації працюють

---

### [v3.4.0] - 2025-10-24

#### Покращення попереднього перегляду та валідації інфраструктури
**Ця версія вводить всебічну підтримку нової функції попереднього перегляду Azure Developer CLI і покращує досвід користувачів майстер-класу.**

#### Додано
- **🧪 Документація функції azd provision --preview**: Всебічне охоплення нової спроможності попереднього перегляду інфраструктури
  - Посилання на команди та приклади використання у шпаргалці
  - Детальна інтеграція у керівництві з організації з використанням кейсів та переваг
  - Інтеграція перевірки перед польотом для безпечнішої валідації розгортання
  - Оновлення гіда з початку роботи з практиками безпечного розгортання
- **🚧 Банер статусу майстер-класу**: Професійний HTML-банер, який показує статус розробки майстер-класу
  - Градієнтний дизайн із індикаторами будівництва для чіткої комунікації з користувачем
  - Остання позначка часу оновлення для прозорості
  - Мобільно адаптивний дизайн для всіх типів пристроїв

#### Покращено
- **Безпека інфраструктури**: Функціональність попереднього перегляду інтегрована через усю документацію з розгортання
- **Валідація перед розгортанням**: Автоматизовані скрипти тепер включають тестування попереднього перегляду інфраструктури
- **Робочий процес розробника**: Оновлені послідовності команд з включенням попереднього перегляду як найкращої практики
- **Досвід майстер-класу**: Чітке встановлення очікувань для користувачів щодо статусу розробки контенту

#### Змінено
- **Найкращі практики розгортання**: Рекомендований підхід – спочатку попередній перегляд
- **Потік документації**: Валідація інфраструктури переміщена на ранні етапи навчання
- **Презентація майстер-класу**: Професійне повідомлення про статус із чітким графіком розробки

#### Покращено
- **Підхід безпеки перш за все**: Зміни в інфраструктурі тепер можна перевірити перед розгортанням
- **Співпраця команди**: Результати попереднього перегляду можна обмінювати для огляду та затвердження
- **Обізнаність про витрати**: Краще розуміння вартості ресурсів перед організацією
- **Зменшення ризиків**: Зменшення невдач у розгортанні завдяки попередній валідації

#### Технічна реалізація
- **Інтеграція багатьох документів**: Функція попереднього перегляду задокументована у 4 ключових файлах
- **Патерни команд**: Послідовний синтаксис та приклади по всій документації
- **Інтеграція кращих практик**: Попередній перегляд включено у робочі процеси валідації та скрипти
- **Візуальні індикатори**: Чіткі маркування НОВИХ функцій для кращої помітності

#### Інфраструктура майстер-класу
- **Повідомлення про статус**: Професійний HTML-банер із градієнтним стилем
- **Досвід користувача**: Чіткий статус розробки запобігає непорозумінням
- **Професійна презентація**: Зберігає довіру до репозиторію та встановлює очікування
- **Прозорість графіку**: Позначка останнього оновлення – жовтень 2025 для відповідальності

### [v3.3.0] - 2025-09-24

#### Покращені матеріали майстер-класу та інтерактивний навчальний досвід
**Ця версія вводить комплексні матеріали майстер-класу з браузерними інтерактивними посібниками та структурованими навчальними шляхами.**

#### Додано
- **🎥 Інтерактивний посібник майстер-класу**: Браузерний досвід роботи з функцією перегляду MkDocs
- **📝 Структуровані інструкції майстер-класу**: 7-кроковий спрямований шлях навчання від відкриття до налаштування
  - 0-Вступ: Огляд майстер-класу та налаштування
  - 1-Вибір шаблону ШІ: Процес пошуку та вибору шаблону
  - 2-Валідація шаблону ШІ: Процедури розгортання та перевірки
  - 3-Аналіз шаблону ШІ: Розуміння архітектури шаблону
  - 4-Конфігурація шаблону ШІ: Налаштування та адаптація
  - 5-Індивідуалізація шаблону ШІ: Розширені модифікації та ітерації
  - 6-Зняття інфраструктури: Очищення та управління ресурсами
  - 7-Завершення: Підсумок та подальші кроки
- **🛠️ Інструменти майстер-класу**: Конфігурація MkDocs з темою Material для покращеного досвіду навчання
- **🎯 Практичний шлях навчання**: 3-крокова методологія (Відкриття → Розгортання → Налаштування)
- **📱 Інтеграція GitHub Codespaces**: Безшовне налаштування середовища розробки

#### Покращено
- **Лабораторія майстер-класу ШІ**: Розширена з комплексним 2-3 годинним структурованим навчальним досвідом
- **Документація майстер-класу**: Професійна презентація з навігацією та візуальними допоміжними засобами
- **Прогрес навчання**: Чітке покрокове керівництво від вибору шаблону до розгортання у виробництві
- **Досвід розробника**: Інтегровані інструменти для оптимізації робочих процесів розробки

#### Покращено
- **Доступність**: Інтерфейс у браузері з пошуком, функцією копіювання та перемиканням теми
- **Самостійне навчання**: Гнучка структура майстер-класу для різних швидкостей навчання
- **Практичне застосування**: Реальні сценарії розгортання шаблонів ШІ
- **Інтеграція спільноти**: Інтеграція Discord для підтримки та співпраці на майстер-класі

#### Особливості майстер-класу
- **Вбудований пошук**: Швидкий пошук за ключовими словами та уроками
- **Копіювання блоків коду**: Функція копіювання по наведенню для всіх прикладів коду
- **Перемикання теми**: Підтримка темного/світлого режимів для різних уподобань
- **Візуальні матеріали**: Знімки екрана та діаграми для кращого розуміння
- **Інтеграція допомоги**: Прямий доступ до Discord для підтримки спільноти

### [v3.2.0] - 2025-09-17

#### Значна перебудова навігації та система навчання на основі розділів
**Ця версія вводить всебічну структуру навчання за розділами з покращеною навігацією по всьому репозиторію.**

#### Додано
- **📚 Система навчання за розділами**: Повна перебудова курсу на 8 поступових навчальних розділів
  - Розділ 1: Основи та Швидкий старт (⭐ - 30-45 хв)
  - Розділ 2: Розробка з акцентом на ШІ (⭐⭐ - 1-2 години)
  - Розділ 3: Конфігурація та автентифікація (⭐⭐ - 45-60 хв)
  - Розділ 4: Інфраструктура як код та розгортання (⭐⭐⭐ - 1-1.5 год)
  - Розділ 5: Багатоагентні рішення ШІ (⭐⭐⭐⭐ - 2-3 години)
  - Розділ 6: Валідація та планування перед розгортанням (⭐⭐ - 1 година)
  - Розділ 7: Усунення несправностей та відладка (⭐⭐ - 1-1.5 години)
  - Розділ 8: Виробничі та корпоративні патерни (⭐⭐⭐⭐ - 2-3 години)
- **📚 Комплексна система навігації**: Послідовні заголовки та футери навігації у всій документації
- **🎯 Відстеження прогресу**: Контрольний список завершення курсу та система підтвердження навчання
- **🗺️ Керівництво навчальним шляхом**: Чіткі точки входу для різного досвіду та цілей
- **🔗 Крос-посилання навігації**: Пов'язані розділи та передумови чітко пов’язані

#### Покращено
- **Структура README**: Трансформовано у структуровану навчальну платформу з організацією за розділами
- **Навігація документації**: Тепер кожна сторінка містить контекст розділу та інформацію про прогрес навчання
- **Організація шаблонів**: Приклади та шаблони розподілені за відповідними розділами навчання
- **Інтеграція ресурсів**: Шпаргалки, FAQ та навчальні посібники прив’язані до відповідних розділів
- **Інтеграція майстер-класів**: Лабораторні роботи інтегровані з кількома навчальними цілями розділів

#### Змінено
- **Прогрес навчання**: переход від лінійної документації до гнучкого навчання по розділах
- **Розміщення конфігурації**: переміщення посібника з конфігурації до Розділу 3 для кращого освітнього потоку
- **Інтеграція AI-контенту**: покращена інтеграція контенту, специфічного для ШІ, протягом навчальної подорожі
- **Контент для продуктивного середовища**: передові патерни консолідовані в Розділі 8 для корпоративних учнів

#### Поліпшено
- **Користувацький досвід**: чітка навігація та індикатори прогресу по розділах
- **Доступність**: послідовні патерни навігації для легшого проходження курсу
- **Професійна презентація**: університетська структура курсу, придатна для академічного та корпоративного навчання
- **Ефективність навчання**: скорочений час пошуку релевантного контенту завдяки покращеній організації

#### Технічна реалізація
- **Заголовки навігації**: стандартизована навігація по розділах у більш ніж 40 файлах документації
- **Нижня навігація**: послідовні інструкції щодо прогресу та індикатори завершення розділів
- **Перехресні посилання**: комплексна система внутрішніх посилань для пов’язаних концепцій
- **Відображення розділів**: шаблони та приклади чітко зв'язані з навчальними цілями

#### Поліпшення довідника для навчання
- **📚 Всеосяжні навчальні цілі**: переструктурований довідник для відповідності 8-роздільній системі
- **🎯 Оцінювання за розділами**: кожен розділ містить конкретні навчальні цілі та практичні вправи
- **📋 Відстеження прогресу**: щотижневий графік навчання з вимірюваними результатами та списками перевірок
- **❓ Контрольні питання**: питання для перевірки знань по кожному розділу з професійними результатами
- **🛠️ Практичні вправи**: практичні завдання з реальними сценаріями розгортання та усунення несправностей
- **📊 Прогрес навичок**: чіткий прогрес від базових концепцій до корпоративних патернів із акцентом на розвиток кар’єри
- **🎓 Сертифікаційна система**: професійні результати розвитку та система визнання в спільноті
- **⏱️ Керування часом**: структурований 10-тижневий план навчання з підтвердженням ключових етапів

### [v3.1.0] - 2025-09-17

#### Покращені мультиагентні рішення AI
**Ця версія вдосконалює мультиагентне ритейл-рішення з кращим найменуванням агентів та покращеною документацією.**

#### Зміни
- **Термінологія мультиагентів**: замінено "агент Cora" на "агент Клієнта" у всьому мультиагентному ритейл-рішенні для кращого розуміння
- **Архітектура агента**: оновлено всю документацію, ARM-шаблони та приклади коду з уніфікованим найменуванням "агент Клієнта"
- **Приклади конфігурації**: модернізовані патерни конфігурації агентів із оновленими найменуваннями
- **Послідовність документації**: забезпечено використання професійних, описових імен агентів у всіх посиланнях

#### Покращено
- **Пакет ARM шаблонів**: оновлення retail-multiagent-arm-template з посиланнями на агента Клієнта
- **Архітектурні діаграми**: оновлені Mermaid-діаграми з новими іменами агентів
- **Приклади коду**: Python-класи та приклади реалізації тепер використовують найменування CustomerAgent
- **Змінні оточення**: оновлення усіх скриптів розгортання з використанням CUSTOMER_AGENT_NAME конвенцій

#### Покращено
- **Досвід розробника**: чіткіші ролі та відповідальності агента в документації
- **Готовність до продуктивності**: краще узгодження з корпоративними конвенціями іменування
- **Навчальні матеріали**: інтуїтивніше найменування агентів для освітніх цілей
- **Зручність шаблонів**: спрощене розуміння функцій агентів та паттернів розгортання

#### Технічні деталі
- Оновлено архітектурні Mermaid-діаграми з використанням посилань на CustomerAgent
- Замінено імена класів CoraAgent на CustomerAgent у прикладах Python
- Змінено конфігурації ARM шаблонів JSON для використання типу агента "customer"
- Оновлено змінні оточення з CORA_AGENT_* на CUSTOMER_AGENT_*
- Оновлено всі команди розгортання і конфігурації контейнерів

### [v3.0.0] - 2025-09-12

#### Головні зміни - Фокус на розробників ШІ та інтеграція Microsoft Foundry
**Ця версія трансформує репозиторій у комплексний ресурс для навчання ШІ з інтеграцією Microsoft Foundry.**

#### Додано
- **🤖 Навчальний шлях із пріоритетом ШІ**: повна реструктуризація з орієнтацією на розробників і інженерів ШІ
- **Посібник із інтеграції Microsoft Foundry**: комплексна документація для з’єднання AZD із сервісами Microsoft Foundry
- **Патерни розгортання AI-моделей**: детальний посібник з вибору моделі, конфігурації та стратегії продуктивного впровадження
- **Лабораторія AI-воркшопу**: 2-3 години практичних занять із трансформації AI-додатків у рішення для AZD
- **Найкращі практики продуктивного AI**: корпоративні патерни масштабування, моніторингу та безпеки AI-навантажень
- **Покрокове усунення несправностей AI**: повний посібник для моделей Microsoft Foundry, когнітивних сервісів і проблем впровадження AI
- **Галерея AI-шаблонів**: підбірка шаблонів Microsoft Foundry з рейтингами складності
- **Матеріали воркшопу**: повна структура воркшопу з лабораторіями та довідковими матеріалами

#### Покращено
- **Структура README**: орієнтована на розробників ШІ, з 45% даних про інтереси спільноти з Discord Microsoft Foundry
- **Навчальні шляхи**: виділена подорож розробника ШІ поряд із традиційними шляхами для студентів та інженерів DevOps
- **Рекомендації шаблонів**: виділені AI-шаблони, серед яких azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart
- **Інтеграція спільноти**: покращена підтримка Discord із AI-специфічними каналами та обговореннями

#### Безпека і спрямованість на продуктивність
- **Патерни керування ідентифікацією**: автентифікація та безпека, специфічні для AI
- **Оптимізація вартості**: відстеження використання токенів і контроль бюджету для AI-навантажень
- **Багаторегіональне розгортання**: стратегії глобального розгортання AI-додатків
- **Моніторинг продуктивності**: AI-специфічні метрики та інтеграція з Application Insights

#### Якість документації
- **Лінійна структура курсу**: логічна послідовність від початкових до передових патернів розгортання AI
- **Перевірені URL**: усі зовнішні посилання на репозиторії перевірені та доступні
- **Повне посилання**: усі внутрішні посилання в документації перевірені і працюють
- **Готовість до продуктивності**: корпоративні патерни розгортання з реальними прикладами

### [v2.0.0] - 2025-09-09

#### Головні зміни - реструктуризація репозиторію та професійне покращення
**Ця версія представляє значний перегляд структури репозиторію та презентації контенту.**

#### Додано
- **Структурована навчальна рамка**: усі сторінки документації тепер включають вступ, цілі навчання та очікувані результати
- **Система навігації**: додані посилання на попередній/наступний урок по всій документації для спрямованої прогресії
- **Довідник з навчання**: комплексний study-guide.md з цілями навчання, практичними вправами та матеріалами оцінювання
- **Професійна презентація**: видалені всі іконки-емодзі для покращення доступності та професійного вигляду
- **Покращена структура контенту**: покращена організація та потік навчальних матеріалів

#### Зміни
- **Формат документації**: стандартизовано всю документацію зі структурою, орієнтованою на навчання
- **Навігаційний потік**: імплементовано логічну послідовність через усі навчальні матеріали
- **Презентація контенту**: видалено декоративні елементи на користь чіткого, професійного форматування
- **Структура посилань**: оновлено всі внутрішні посилання для підтримки нової системи навігації

#### Поліпшено
- **Доступність**: видалено залежності від емодзі для покращеної сумісності з екранами зчитування
- **Професійний вигляд**: чиста академічна презентація, придатна для корпоративного навчання
- **Досвід навчання**: структурований підхід з чіткими цілями та результатами для кожного уроку
- **Організація контенту**: кращий логічний потік і зв’язок між суміжними темами

### [v1.0.0] - 2025-09-09

#### Початковий реліз - комплексний репозиторій для навчання AZD

#### Додано
- **Основна структура документації**
  - Повна серія посібників з початку роботи
  - Комплексна документація з розгортання та провізування
  - Детальні ресурси усунення несправностей та посібники з відлагодження
  - Інструменти та процедури для валідації перед розгортанням

- **Модуль початку роботи**
  - AZD основи: ключові концепції та термінологія
  - Посібник з встановлення: інструкції для різних платформ
  - Посібник з конфігурації: налаштування середовища та автентифікація
  - Перший проект: покрокове практичне навчання

- **Модуль розгортання та провізування**
  - Посібник з розгортання: повна документація робочого процесу
  - Посібник з провізування: Інфраструктура як код із Bicep
  - Найкращі практики для продуктивних розгортань
  - Патерни архітектури мультисервісів

- **Модуль валідації перед розгортанням**
  - Планування потужностей: перевірка доступності ресурсів Azure
  - Вибір SKU: детальні керівництва по рівнях сервісу
  - Превентивні перевірки: автоматизовані скрипти перевірки (PowerShell і Bash)
  - Інструменти оцінки вартості та планування бюджету

- **Модуль усунення несправностей**
  - Поширені проблеми: часті помилки та рішення
  - Посібник з відлагодження: системні методи усунення несправностей
  - Передові діагностичні техніки та інструменти
  - Моніторинг продуктивності та оптимізація

- **Ресурси та довідки**
  - Шпаргалка команд: швидкий довідник основних команд
  - Глосарій: повний словник термінів та акронімів
  - FAQ: детальні відповіді на поширені питання
  - Підключення до зовнішніх ресурсів і спільнот

- **Приклади та шаблони**
  - Приклад простої веб-аплікації
  - Шаблон розгортання статичного сайту
  - Конфігурація контейнерної аплікації
  - Патерни інтеграції баз даних
  - Приклади архітектури мікросервісів
  - Реалізації безсерверних функцій

#### Особливості
- **Підтримка мультиплатформ**: посібники з встановлення та налаштування для Windows, macOS та Linux
- **Різні рівні навичок**: контент для студентів і професійних розробників
- **Практична спрямованість**: практичні приклади та сценарії з реального життя
- **Всеохопне охоплення**: від базових концепцій до передових корпоративних патернів
- **Орієнтація на безпеку**: інтеграція найкращих практик безпеки
- **Оптимізація вартості**: рекомендації щодо економного розгортання та управління ресурсами

#### Якість документації
- **Детальні приклади коду**: практичні, протестовані зразки коду
- **Покрокові інструкції**: чіткі, зрозумілі керівництва
- **Всеосяжне оброблення помилок**: усунення несправностей для поширених проблем
- **Інтеграція найкращих практик**: галузеві стандарти та рекомендації
- **Сумісність версій**: актуалізовано згідно з останніми сервісами Azure та функціями azd

## Планові майбутні вдосконалення

### Версія 3.1.0 (планується)
#### Розширення платформи ШІ
- **Підтримка мульти-моделей**: патерни інтеграції для Hugging Face, Azure Machine Learning та кастомних моделей
- **Фреймворки AI-агентів**: шаблони для LangChain, Semantic Kernel та AutoGen
- **Покращені RAG патерни**: варіанти векторних баз даних поза Azure AI Search (Pinecone, Weaviate тощо)
- **Спостережливість ШІ**: розширений моніторинг продуктивності моделей, використання токенів та якості відповідей

#### Досвід розробника
- **Розширення для VS Code**: інтегрований досвід розробки AZD + Microsoft Foundry
- **Інтеграція GitHub Copilot**: AI-підтримуване генерація шаблонів AZD
- **Інтерактивні підручники**: практичні вправи з автоматичною перевіркою для AI-сценаріїв
- **Відеоконтент**: додаткові відеоуроки для візуальних учнів, з фокусом на розгортання AI

### Версія 4.0.0 (планується)
#### Корпоративні AI-патерни
- **Рамкова структура управління**: керування, відповідність та аудиторські сліди моделей AI
- **Багатокористувацький AI**: патерни обслуговування кількох клієнтів через ізольовані AI-сервіси
- **Розгортання AI на периферії**: інтеграція з Azure IoT Edge та контейнерними екземплярами
- **Гібридний хмарний AI**: багатохмарні та гібридні патерни розгортання AI-навантажень

#### Просунуті функції
- **Автоматизація AI-пайплайнів**: інтеграція MLOps з пайплайнами Azure Machine Learning
- **Покращена безпека**: патерни з нульовою довірою, приватні кінцеві точки та розширений захист від загроз
- **Оптимізація продуктивності**: передові стратегії налаштування та масштабування для AI-додатків з високою пропускною здатністю
- **Глобальний розподіл**: патерни доставки контенту та кешування на периферії для AI-додатків

### Версія 3.0.0 (планується) - замінена поточним релізом
#### Запропоновані доповнення - тепер реалізовані у v3.0.0
- ✅ **Контент, орієнтований на AI**: комплексна інтеграція Microsoft Foundry (виконано)
- ✅ **Інтерактивні підручники**: практична лабораторія AI-воркшопу (виконано)
- ✅ **Модуль покращеної безпеки**: специфічні AI-патерни безпеки (виконано)
- ✅ **Оптимізація продуктивності**: стратегії налаштування AI-навантажень (виконано)

### Версія 2.1.0 (планується) - частково реалізована у v3.0.0
#### Менші вдосконалення - деякі завершені у поточному релізі
- ✅ **Додаткові приклади**: сценарії розгортання, орієнтовані на AI (виконано)
- ✅ **Розширене FAQ**: AI-специфічні питання та усунення несправностей (виконано)
- **Інтеграція інструментів**: покращені посібники інтеграції IDE та редакторів
- ✅ **Розширення моніторингу**: AI-специфічні патерни моніторингу та сповіщення (виконано)

#### Ще планується для майбутнього релізу
- **Мобільна документація**: адаптивний дизайн для навчання на мобільних пристроях
- **Офлайн доступ**: документаційні пакети для завантаження
- **Покращена інтеграція IDE**: розширення VS Code для AZD + AI робочих процесів
- **Панель спільноти**: метрики спільноти в реальному часі та відстеження внесків

## Як внести зміни до журналу змін

### Повідомлення про зміни
Під час внесення змін у цей репозиторій, будь ласка, переконайтеся, що записи у журналі змін містять:

1. **Номер версії**: згідно з семантичним версіюванням (major.minor.patch)
2. **Дата**: дата релізу або оновлення у форматі YYYY-MM-DD
3. **Категорія**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Чіткий опис**: стислий опис змін
5. **Оцінка впливу**: як зміни впливають на існуючих користувачів

### Категорії змін

#### Додано
- Нові функції, розділи документації або можливості
- Нові приклади, шаблони або навчальні ресурси
- Додаткові інструменти, скрипти або утиліти

#### Змінено
- Модифікації існуючої функціональності або документації
- Оновлення для покращення ясності або точності
- Реструктуризація контенту або організації

#### Застаріло
- Функції або підходи, які поступово вилучаються
- Розділи документації, заплановані до видалення
- Методи, які мають кращі альтернативи

#### Видалено
- Функції, документація або приклади, що більше не актуальні
- Забуті або застарілі відомості чи підходи
- Зайвий або консолідований контент

#### Виправлено
- Виправлення помилок у документації або коді
- Вирішення виявлених проблем або дефектів
- Покращення точності або функціональності

#### Безпека
- Поліпшення або виправлення, пов’язані з безпекою
- Оновлення найкращих практик безпеки
- Усунення вразливостей безпеки

### Правила семантичного версіювання

#### Головна версія (X.0.0)
- Серйозні зміни, що потребують дій від користувача
- Значне перепланування вмісту або організації
- Зміни, що змінюють фундаментальний підхід або методологію

#### Мінорна версія (X.Y.0)
- Нові функції або додавання контенту
- Покращення, що зберігають зворотну сумісність
- Додаткові приклади, інструменти або ресурси

#### Патч-версія (X.Y.Z)
- Виправлення помилок
- Незначні поліпшення існуючого контенту
- Уточнення та невеликі покращення

## Відгуки і пропозиції спільноти

Ми активно заохочуємо відгуки спільноти для покращення цього навчального ресурсу:

### Як надати відгук
- **GitHub Issues**: Повідомляйте про проблеми або пропонуйте покращення (особливо питання, пов’язані з AI)
- **Обговорення в Discord**: Діліться ідеями та спілкуйтеся з спільнотою Microsoft Foundry
- **Pull Requests**: Вносьте безпосередні покращення в контент, особливо AI шаблони та керівництва
- **Microsoft Foundry Discord**: Беріть участь у каналі #Azure для обговорень AZD + AI
- **Форуми спільноти**: Беріть участь у ширших дискусіях серед розробників Azure

### Категорії відгуків
- **Точність AI контенту**: Виправлення інформації про інтеграцію і розгортання AI сервісів
- **Навчальний процес**: Пропозиції щодо покращення послідовності навчання AI розробникам
- **Відсутній AI контент**: Запити на додаткові AI шаблони, патерни або приклади
- **Доступність**: Покращення для різноманітних потреб у навчанні
- **Інтеграція інструментів AI**: Пропозиції щодо кращої інтеграції робочих процесів AI розробки
- **Патерни AI для продакшену**: Запити на патерни розгортання AI в підприємствах

### Зобов’язання щодо відповіді
- **Відповідь на проблеми**: Протягом 48 годин на повідомлені проблеми
- **Запити функцій**: Розгляд протягом одного тижня
- **Внески спільноти**: Перегляд протягом одного тижня
- **Питання безпеки**: Найвищий пріоритет з прискореною відповіддю

## Графік обслуговування

### Регулярні оновлення
- **Щомісячні огляди**: Перевірка точності контенту та посилань
- **Щоквартальні оновлення**: Значні доповнення та покращення контенту
- **Піврічні огляди**: Комплексне реструктурування та вдосконалення
- **Щорічні релізи**: Оновлення основних версій з суттєвими покращеннями

### Моніторинг і забезпечення якості
- **Автоматизоване тестування**: Регулярна перевірка прикладів коду та посилань
- **Інтеграція відгуків спільноти**: Регулярне врахування пропозицій користувачів
- **Оновлення технологій**: Узгодження з останніми сервісами Azure та релізами azd
- **Аудити доступності**: Регулярний перегляд принципів інклюзивного дизайну

## Політика підтримки версій

### Підтримка поточної версії
- **Остання основна версія**: Повна підтримка з регулярними оновленнями
- **Попередня основна версія**: Оновлення безпеки і критичні виправлення протягом 12 місяців
- **Старі версії**: Лише підтримка спільноти, офіційних оновлень немає

### Рекомендації щодо міграції
Коли виходять основні версії, ми надаємо:
- **Посібники з міграції**: Покрокові інструкції переходу
- **Примітки з сумісності**: Деталі про критичні зміни
- **Підтримка інструментів**: Скрипти або утиліти для допомоги з міграцією
- **Підтримка спільноти**: Спеціалізовані форуми для питань міграції

---

**Навігація**
- **Попередній урок**: [Посібник для навчання](resources/study-guide.md)
- **Наступний урок**: Повернутися до [Головного README](README.md)

**Будьте в курсі**: Слідкуйте за цим репозиторієм, щоб отримувати сповіщення про нові релізи та важливі оновлення навчальних матеріалів.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->