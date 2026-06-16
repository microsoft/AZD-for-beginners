# Журнал изменений - AZD для начинающих

## Введение

Этот журнал изменений документирует все заметные изменения, обновления и улучшения в репозитории AZD для начинающих. Мы следуем принципам семантического версионирования и ведём этот журнал, чтобы помочь пользователям понять, что изменилось между версиями.

## Цели обучения

Просматривая этот журнал изменений, вы:
- Будете в курсе новых функций и добавлений контента
- Поймёте улучшения, внесённые в существующую документацию
- Отслеживаете исправления ошибок и корректировки для обеспечения точности
- Следите за развитием учебных материалов со временем

## Результаты обучения

После ознакомления с записями в журнале изменений вы сможете:
- Определять новый контент и ресурсы, доступные для обучения
- Понимать, какие разделы были обновлены или улучшены
- Планировать свой путь обучения на основе самых актуальных материалов
- Вносить отзывы и предложения для будущих улучшений

## История версий

### [v3.22.0] - 2026-06-16

#### Заполнение пробелов для новичков #2: Авторство шаблонов, Dev контейнеры, Pulumi, Azure DevOps, сервисные принципы и другое
**Эта версия закрывает оставшиеся промежуточные пробелы, выявленные анализом azd-coverage: как создавать и публиковать собственный шаблон, воспроизводимые среды dev-container/Codespaces, провайдер инфраструктуры Pulumi, обзор CI/CD в Azure DevOps, аутентификация через service principal, руководство по выбору хоста (AKS/Spring Apps), объяснения `azd restore`/`azd package`, обработка ошибок хуков и практики использования командных/shared-сред.**

#### Добавлено
- **🧱 Новый урок главе 4** `docs/chapter-04-infrastructure/custom-templates.md` — создание собственного шаблона azd: обязательная структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризация инфраструктуры с помощью токена ресурса `uniqueString()` и тега `azd-env-name`, локальное тестирование через `azd init --template <local-path>`, публикация на GitHub и отправка в галерею Awesome AZD
- **📦 Новый урок главе 1** `docs/chapter-01-foundation/dev-containers.md` — воспроизводимые среды azd с Dev Containers и GitHub Codespaces: минимальный `.devcontainer/devcontainer.json` с использованием официального функционала `ghcr.io/azure/azure-dev/azd`, языковые функции, `docker-in-docker` для контейнерных хостов и `azd auth login --use-device-code` для удалённого входа
- **🧩 Раздел Pulumi с azd** в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура папок Pulumi, стеки, сопоставленные с средами azd, обязательные output-и/теги, и одинаковый рабочий процесс `azd up`/`azd down`
- **🎯 Руководство по выбору хоста** в `docs/chapter-04-infrastructure/provisioning.md` — дружелюбное к новичкам сравнение `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp` с рекомендациями, когда выбирать AKS или Azure Spring Apps
- **🛠️ Обзор Azure DevOps CI/CD** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, подключение сервисов с федерацией идентификационной нагрузки (OIDC), сгенерированный файл `azure-dev.yml` и настройка групп переменных
- **🔑 Добавлено раздел про сервисные принципы (Паттерн 4)** в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, безинтерактивный `azd auth login` с использованием секрета клиента или федеративных/OIDC учетных данных, когда применять и безопасное хранение учетных данных
- **🪝 Подраздел по обработке ошибок хуков** в `docs/chapter-04-infrastructure/deployment-guide.md` — коды выхода и `set -e`, `continueOnError`, тестирование хуков в изоляции с помощью `azd hooks run`, оболочки ОС и режим `--debug`
- **👥 Раздел «Командные / shared-среды»** в `docs/chapter-03-configuration/configuration.md` — что хранится в `.azure/`, что игнорировать в git, среды на каждого разработчика, команды `azd env list`/`select` и предоставление значений среды в CI/CD
- **🧰 Объяснения `azd restore` и расширенный `azd package`** в `resources/cheat-sheet.md` — восстановление зависимостей и сборка артефакта для деплоя без фактического развертывания

#### Изменено
- **🧭 Обновлена таблица уроков главы 4** с добавлением нового урока "Создание собственного шаблона" (Урок 3)
- **🧭 Обновлена таблица уроков главы 1** с добавлением нового урока "Dev контейнеры и Codespaces" (Урок 5); навигационные футеры связали `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заполнение пробелов для новичков: Практический урок по многом агентам, "Bring Your Own App", Terraform и обзор CI/CD
**Эта версия закрывает самые большие пробелы для полного руководства начинающих, добавляя два новых практических урока (развёртываемый walkthrough с двумя агентами и добавление azd в существующее приложение), вводный урок по хукам для новичков, раздел Terraform с azd, пошаговый обзор GitHub Actions pipeline, объяснение новых preview расширений и явный чеклист для проверки деплоя.**

#### Добавлено
- **🤝 Новый урок главы 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — полностью практический развёртываемый walkthrough с двумя агентами (оркестратор + специалисты) на реальном шаблоне (`contoso-creative-writer`), охватывающий когда использовать multi-agent, рабочий процесс `azd up`, понимание развёрнутых ресурсов, межагентское трассирование, настройку и очистку
- **📦 Новый урок главы 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как добавить azd в существующий проект с помощью `azd init` ("использовать код в текущей директории"), понимание `azure.yaml` и `infra/`, `azd infra generate`, обнаружение хоста и развёртывание через `azd up`
- **🌐 Раздел Terraform с azd** в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, структура папки `.tf`, обязательные output-и с префиксом `AZURE_*` и тегирование `azd-env-name`, и идентичный рабочий процесс `azd up` / `azd down` (закрывает пробел, где заявлялась поддержка Terraform, но отображался только Bicep)
- **⚙️ Пошаговый обзор GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от репозитория GitHub к автоматизированным развертываниям: `azd pipeline config`, федеративные учетные данные OIDC (без хранения секретов), сгенерированный файл `azure-dev.yml` и рекомендации по секретам и переменным
- **🪝 Вводный урок "Новичок в хуках?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — что такое хук, таблица стадий хуков, минимальный первый хук и ручной запуск хуков с `azd hooks run`
- **✅ Добавлен чеклист "Проверьте ваш деплой"** к шагу 5 в `docs/chapter-01-foundation/first-project.md` — smoke тест, проверка health-endpoint и явные критерии успеха
- **🧩 Объяснение новых preview расширений** `azure.ai.skills` и `azure.ai.connections` (что это и когда использовать) в `docs/chapter-08-production/production-ai-practices.md`

#### Изменено
- **🧭 Таблица уроков главы 5** исправлена: `multi-agent-basics.md` теперь Урок 1 (единственный полностью практический урок), с честным указанием, что Урок 2 находится в главе 6, а Retail сценарий — это архитектурный план, а не команда шаблона
- **🧭 Таблица уроков главы 1** теперь включает новый урок "Bring Your Own App" (Урок 4)
- **🔗 Обновлены навигационные футеры**: `first-project.md` теперь ссылается вперёд на `bring-your-own-app.md`

#### Исправлено
- **🧱 Закрыт пробел с Terraform** — курс ранее ссылался на поддержку Terraform без её демонстрации
- **🔀 Исправлены вводящие в заблуждение перекрёстные ссылки главы 5**, которые предполагали наличие полной реализации multi-agent, когда был лишь архитектурный план

#### Обновлённые файлы
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(новый)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(новый)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Обновление AZD до 1.25.6, Полное покрытие жизненного цикла агента и ребрендинг Aspire
**Эта версия пересматривает курс с учётом `azd` `1.25.6` (июнь 2026) и расширения `azure.ai.agents` `0.1.40-preview`, расширяет руководство по ИИ от "создания агента" до полного жизненного цикла агента (тест → оценка → оптимизация → инспекция → удаление), добавляет новые preview расширения `azure.ai.skills` и `azure.ai.connections`, а также отмечает ребрендинг продукта ".NET Aspire" в "Aspire".**

#### Добавлено
- **🔁 Полное покрытие жизненного цикла агента** для новичков и AI инженеров по всей документации:
  - `docs/chapter-01-foundation/azd-basics.md` — добавлена таблица жизненного цикла (создать → тестировать → измерять → улучшать → инспектировать → очищать) в раздел Расширений и AI команд
  - `docs/chapter-08-production/production-ai-practices.md` — новый раздел "Управление жизненным циклом агента" с командами `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — расширенный список команд AI агента с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Документированы новые preview расширения**: `azure.ai.skills` (переиспользуемые навыки агента) и `azure.ai.connections` (соединения Foundry) добавлены в таблицу расширений и шпаргалку
- **⏱️ Руководство по времени отклика** — примеры `azd ai agent invoke` теперь отмечают вывод общей задержки и времени до первого байта
- **📌 Баннер версии** в корневом README, указывающий обучающимся команды `azd version` и `azd upgrade`

#### Изменено
- **✅ Обновлена базовая версия валидации** с `azd 1.23.12` (март 2026) до `azd 1.25.6` (июнь 2026) во всех README глав и воркшопных доках
- **🤖 Обновлено примечание к расширению главы 2** с `azure.ai.agents` `0.1.18-preview` до `0.1.40-preview`
- **🧪 Обновлён пример валидации воркшопа** (`azd version` вывод) до `1.25.6`
- **🧭 Обновлено README "Что нового в azd на сегодня"** с выделением полного жизненного цикла агента, новых AI расширений и последних улучшений удобства использования (`azd init` идемпотентность, очистка устаревших токенов в `azd auth login`, приглашение при первом запуске `azd tool`)
- **📖 В разделе агентов главы 2 (Вариант 4)** теперь направляет обучающихся к командам жизненного цикла после развертывания, а не останавливается на `azd up`

#### Исправлено
- **🏷️ Название продукта** — добавлена заметка о ребрендинге Aspire (".NET Aspire" теперь просто "Aspire"); поддержка azd для Aspire неизменна
- **🔎 Верификация живого релиза** подтверждена по ленте выпусков Azure Developer CLI: стабильная версия CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Обновлённые файлы
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
#### Уточнение для начинающих, проверка настройки и финальная очистка команд AZD
**Эта версия дополняет проверку AZD 1.23 фокусом на документацию для начинающих: уточняет рекомендации по первичной аутентификации через AZD, добавляет скрипты для проверки локальной настройки, проверяет ключевые команды с реальным CLI AZD и удаляет последние устаревшие ссылки на команды на английском языке вне журнала изменений.**

#### Добавлено
- **🧪 Скрипты проверки настройки для начинающих** с `validate-setup.ps1` и `validate-setup.sh`, чтобы учащиеся могли подтвердить наличие необходимых инструментов до начала Главы 1
- **✅ Начальные шаги проверки настройки** в основном README и README Главы 1, чтобы отсутствия необходимых предварительных условий выявлялись до команды `azd up`

#### Изменено
- **🔐 Руководство по аутентификации для начинающих** теперь последовательно рассматривает `azd auth login` как основной путь для рабочих процессов AZD, а `az login` отмечается как опциональный, если напрямую используются команды Azure CLI
- **📚 Поток введения в Главе 1** теперь предлагает учащимся проверить локальную настройку до этапов установки, аутентификации и первого развертывания
- **🛠️ Сообщения валидатора** теперь чётко разделяют блокирующие требования и необязательные предупреждения Azure CLI для пути начинающих, использующих только AZD
- **📖 Документация по конфигурации, устранению неполадок и примерам** теперь разделяет обязательную аутентификацию AZD и опциональный вход в Azure CLI, тогда как раньше они представлялись без контекста

#### Исправлено
- **📋 Оставшиеся ссылки на команды из английского источника** обновлены до актуальных форм AZD, включая `azd config show` в шпаргалке и `azd monitor --overview` там, где предназначено руководство по обзору в портале Azure
- **🧭 Утверждения для начинающих в Главе 1** смягчены, чтобы избежать чрезмерных обещаний по гарантированному отсутствию ошибок или отмене изменений во всех шаблонах и ресурсах Azure
- **🔎 Проверка в реальном CLI** подтверждает текущую поддержку команд `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

#### Обновлённые файлы
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

#### Валидация AZD 1.23.12, расширение среды мастер-класса и обновление AI-модели
**В этой версии выполнена проверка документации для `azd` версии `1.23.12`, обновлены устаревшие примеры команд AZD, обновлены рекомендации по AI-моделям к текущим значениям по умолчанию и расширены инструкции мастер-класса за пределы GitHub Codespaces для поддержки dev-контейнеров и локальных клонов.**

#### Добавлено
- **✅ Примечания валидации по основным главам и документам мастер-класса**, чтобы явно указать тестируемую базовую версию AZD для пользователей с более новыми или старыми версиями CLI
- **⏱️ Рекомендации по таймауту развертывания** для длительных развертываний AI-приложений с использованием `azd deploy --timeout 1800`
- **🔎 Шаги проверки расширений** с помощью `azd extension show azure.ai.agents` в документации по AI-воркфлоу
- **🌐 Расширенные рекомендации по среде мастер-класса**, включающие GitHub Codespaces, dev-контейнеры и локальные клоны с использованием MkDocs

#### Изменено
- **📚 Вводные README глав** теперь последовательно отмечают проверку на `azd 1.23.12` в разделах основы, конфигурации, инфраструктуры, мультиагентов, предподготовки, устранения неполадок и продакшена
- **🛠️ Ссылки на команды AZD** обновлены до актуальных форм во всей документации:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимости от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, где предполагается обзор Application Insights
- **🧪 Упрощены примеры предварительного развертывания** с актуальными командами, например, `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Поток мастер-класса** обновлён так, чтобы учащиеся могли выполнять лабораторные работы в Codespaces, dev-контейнере или локальном клоне, а не только в Codespaces
- **🔐 Руководство по аутентификации** теперь предпочтительно рекомендует `azd auth login` для рабочих процессов AZD, `az login` обозначен как опциональный при прямом использовании команд Azure CLI

#### Исправлено
- **🪟 Команды установки на Windows** нормализованы с актуальным регистром пакетов `winget` в руководстве по установке
- **🐧 Руководство по установке на Linux** исправлено для избежания неподдерживаемых инструкций с пакетным менеджером `azd` в дистрибутивах, с указанием использования релизных артефактов там, где это применимо
- **📦 Примеры AI-моделей** обновлены с устаревших значений `gpt-35-turbo` и `text-embedding-ada-002` на современные, такие как `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Отрывки кода для развертывания и диагностики** исправлены с использованием актуальных команд для окружения и статуса в логах, скриптах и шагах устранения неполадок
- **⚙️ Руководство по GitHub Actions** обновлено с `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Руководство по согласию MCP/Copilot** обновлено с `azd mcp consent` на `azd copilot consent list`

#### Улучшено
- **🧠 Руководство по главе AI** теперь лучше объясняет предрелизное поведение `azd ai`, вход с разными тенантами, текущее использование расширений и обновлённые рекомендации по развертыванию моделей
- **🧪 Инструкции мастер-класса** теперь используют более реалистичные версии примеров и более чёткие формулировки настройки среды для практических занятий
- **📈 Документация по продакшену и устранению неполадок** теперь лучше согласована с современными примерами мониторинга, моделей резервного копирования и уровня затрат

#### Обновлённые файлы
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

#### Команды AZD AI CLI, проверка содержимого и расширение шаблонов
**В этой версии добавлено покрытие команд `azd ai`, `azd extension` и `azd mcp` во всех главах, относящихся к AI, исправлены битые ссылки и устаревший код в agents.md, обновлена шпаргалка и переработан раздел с шаблонами примеров с валидацией описаний и новыми Azure AI AZD шаблонами.**

#### Добавлено
- **🤖 Покрытие AZD AI CLI** в 7 файлах (ранее только в Главе 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Новый раздел "Расширения и AI-команды", вводящий `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Вариант 4: `azd ai agent init` с таблицей сравнения (шаблон против подхода с манифестом)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подразделы "Расширения AZD для Foundry" и "Деплоймент с приоритетом агента"
  - `docs/chapter-05-multi-agent/README.md` — Быстрый старт теперь показывает пути развертывания как через шаблон, так и через манифест
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Раздел развертывания теперь включает вариант с `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подраздел "Команды расширения AZD AI для диагностики"
  - `resources/cheat-sheet.md` — Новый раздел "Команды AI и расширений" с `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Новые примеры Azure AI AZD шаблонов** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат с Blazor WebAssembly, Semantic Kernel и поддержкой голосового общения
  - **azure-search-openai-demo-java** — Java RAG чат с использованием Langchain4J с опциями развертывания ACA/AKS
  - **contoso-creative-writer** — Мультиагентское приложение для творческого письма с Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Безсерверный RAG с Azure Functions + LangChain.js + Cosmos DB и локальной поддержкой Ollama для разработки
  - **chat-with-your-data-solution-accelerator** — Корпоративный акселератор RAG с панелью администратора, интеграцией Teams и опциями PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Мультиагентское ориентированное на MCP средство с серверами на .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимальный стартовый шаблон инфраструктуры Azure AI Bicep
  - **🔗 Ссылка на классную галерею AZD AI** — Ссылка на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (более 80 шаблонов)

#### Исправлено
- **🔗 Навигация в agents.md**: ссылки на предыдущую/следующую главы теперь соответствуют порядку уроков в README Главы 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Битые ссылки в agents.md**: исправлены на `../chapter-08-production/production-ai-practices.md` (3 вхождения)
- **📦 Устаревший код в agents.md**: заменён `opencensus` на `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Неверный API в agents.md**: параметр `max_tokens` перенесён из `create_agent()` в `create_run()` как `max_completion_tokens`
- **🔢 Подсчёт токенов в agents.md**: заменена приближённая оценка `len//4` на использование `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: исправлены сервисы с "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (дефолтный хост изменён в октябре 2024)
- **contoso-chat**: описание обновлено с ссылкой на Azure AI Foundry + Prompty, соответствуя фактическому названию и стэку репозитория

#### Удалено
- **ai-document-processing**: удалена нерабочая ссылка на шаблон (репозиторий недоступен публично как AZD шаблон)

#### Улучшено
- **📝 Упражнения в agents.md**: Упражнение 1 теперь показывает ожидаемый вывод и шаг с `azd monitor`; Упражнение 2 содержит полный код регистрации `FunctionTool`; Упражнение 3 заменяет расплывчатые инструкции конкретными командами `prepdocs.py`
- **📚 Ресурсы в agents.md**: обновлены ссылки на документацию Azure AI Agent Service и quickstart
- **📋 Таблица "Дальнейшие шаги" в agents.md**: добавлена ссылка на AI Workshop Lab для полного охвата главы

#### Обновлённые файлы
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Улучшение навигации по курсу
**В этой версии улучшена навигация по главам README.md с использованием расширенного формата таблицы.**

#### Изменения
- **Таблица карты курса**: Улучшена с добавлением прямых ссылок на уроки, ориентировочным времени и рейтингом сложности
- **Очистка папок**: Удалены лишние старые папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Проверка ссылок**: Проверены все 21+ внутренних ссылок в таблице карты курса

### [v3.16.0] - 2026-02-05

#### Обновления названий продуктов
**В этой версии обновлены упоминания продуктов с учётом текущего брендинга Microsoft.**

#### Изменения
- **Microsoft Foundry → Microsoft Foundry**: Обновлены все упоминания в файлах, не предназначенных для перевода
- **Azure AI Agent Service → Foundry Agents**: Имя сервиса обновлено в соответствии с текущим брендингом

#### Обновленные файлы
- `README.md` - Главная страница курса
- `changelog.md` - История версий
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Руководство по AI-агентам
- `examples/README.md` - Документация примеров
- `workshop/README.md` - Главная страница воркшопа
- `workshop/docs/index.md` - Индекс воркшопа
- `workshop/docs/instructions/*.md` - Все файлы с инструкциями воркшопа

---

### [v3.15.0] - 2026-02-05

#### Крупная реструктуризация репозитория: папки по главам
**В этой версии документация переорганизована в специализированные папки глав для удобной навигации.**

#### Переименование папок
Старые папки заменены на папки с номерами глав:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Добавлена новая: `docs/chapter-05-multi-agent/`

#### Миграция файлов
| Файл | Откуда | Куда |
|------|--------|-------|
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
| Все файлы pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Все файлы troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Добавлено
- **📚 README-файлы глав**: Созданы README.md в каждой папке главы с:
  - Целями обучения и длительностью
  - Таблицей уроков с описаниями
  - Командами для быстрого старта
  - Навигацией по другим главам

#### Изменено
- **🔗 Обновлены все внутренние ссылки**: более 78 путей обновлено во всех документационных файлах
- **🗺️ Главный README.md**: Обновлена карта курса с новой структурой глав
- **📝 examples/README.md**: Обновлены перекрестные ссылки на папки глав

#### Удалено
- Старая структура папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризация репозитория: навигация по главам
**В этой версии добавлены README-файлы с навигацией по главам (заменены на v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новое руководство по AI-агентам
**В этой версии добавлено подробное руководство по развертыванию AI-агентов с помощью Azure Developer CLI.**

#### Добавлено
- **🤖 docs/microsoft-foundry/agents.md**: Полное руководство, включающее:
  - Что такое AI-агенты и чем они отличаются от чатботов
  - Три шаблона быстрого старта (Foundry Agents, Prompty, RAG)
  - Архитектурные паттерны агентов (одиночный агент, RAG, мультиагент)
  - Настройка и кастомизация инструментов
  - Мониторинг и отслеживание метрик
  - Вопросы стоимости и оптимизации
  - Распространённые сценарии устранения неполадок
  - Три практических упражнения с критериями успеха

#### Структура содержания
- **Введение**: Концепции агентов для начинающих
- **Быстрый старт**: Разворачивание агентов с помощью `azd init --template get-started-with-ai-agents`
- **Паттерны архитектуры**: Визуальные схемы паттернов агентов
- **Конфигурация**: Настройка инструментов и переменные окружения
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Прогрессивное обучение практическим навыкам (20-45 минут каждое)

---

### [v3.12.0] - 2026-02-05

#### Обновление окружения DevContainer
**В этой версии обновлена конфигурация контейнера разработки с современными инструментами и лучшими настройками для обучения AZD.**

#### Изменения
- **🐳 Базовое изображение**: Обновлено с `python:3.12-bullseye` на `python:3.12-bookworm` (последняя стабильная Debian)
- **📛 Имя контейнера**: Переименован с "Python 3" в "AZD for Beginners" для ясности

#### Добавлено
- **🔧 Новые возможности Dev Container**:
  - `azure-cli` с поддержкой Bicep
  - `node:20` (LTS версия для шаблонов AZD)
  - `github-cli` для управления шаблонами
  - `docker-in-docker` для развертывания контейнерных приложений

- **🔌 Проброс портов**: Предварительно настроены порты для типичной разработки:
  - 8000 (предпросмотр MkDocs)
  - 3000 (веб-приложения)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Новые расширения VS Code**:
  - `ms-python.vscode-pylance` - расширенный IntelliSense для Python
  - `ms-azuretools.vscode-azurefunctions` - поддержка Azure Functions
  - `ms-azuretools.vscode-docker` - поддержка Docker
  - `ms-azuretools.vscode-bicep` - поддержка языка Bicep
  - `ms-azure-devtools.azure-resource-groups` - управление ресурсами Azure
  - `yzhang.markdown-all-in-one` - редактирование Markdown
  - `DavidAnson.vscode-markdownlint` - проверка Markdown
  - `bierner.markdown-mermaid` - поддержка диаграмм Mermaid
  - `redhat.vscode-yaml` - поддержка YAML (для azure.yaml)
  - `eamodio.gitlens` - визуализация Git
  - `mhutchie.git-graph` - история Git

- **⚙️ Настройки VS Code**: Добавлены настройки по умолчанию для интерпретатора Python, форматирования при сохранении и удаления лишних пробелов

- **📦 Обновлён requirements-dev.txt**:
  - Добавлен плагин минификации MkDocs
  - Добавлен pre-commit для качества кода
  - Добавлены пакеты SDK Azure (azure-identity, azure-mgmt-resource)

#### Исправлено
- **Post-Create команда**: Теперь проверяет установку AZD и Azure CLI при запуске контейнера

---

### [v3.11.0] - 2026-02-05

#### Переработка README для начинающих
**В этой версии значительно улучшен README.md для упрощения восприятия новичками и добавлены ключевые ресурсы для AI-разработчиков.**

#### Добавлено
- **🆚 Сравнение Azure CLI и AZD**: Понятное объяснение, когда использовать каждый инструмент с практическими примерами
- **🌟 Крутые ссылки AZD**: Прямые ссылки на галерею шаблонов сообщества и ресурсы для вклада:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ готовых к развёртыванию шаблонов
  - [Отправить шаблон](https://github.com/Azure/awesome-azd/issues) - вклад сообщества
- **🎯 Руководство быстрого старта**: Упрощённый раздел «3 шага» (Установка → Вход → Развёртывание)
- **📊 Таблица навигации по опыту**: Чёткие рекомендации, с чего начинать в зависимости от опыта разработчика

#### Изменения
- **Структура README**: Переорганизована для поэтапного раскрытия — ключевая информация в начале
- **Раздел Введение**: Переписан для объяснения «Магии `azd up`» для абсолютных новичков
- **Удалён дублирующийся контент**: Убран повтор раздела устранения неполадок
- **Команды для устранения неполадок**: Исправлена ссылка с `azd logs` на корректную `azd monitor --logs`

#### Исправлено
- **🔐 Команды аутентификации**: Добавлены `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Удалены неверные команды**: Из раздела устранения неполадок README удалены оставшиеся упоминания `azd logs`

#### Заметки
- **Объём изменений**: Внесены в основной README.md и resources/cheat-sheet.md
- **Целевая аудитория**: Улучшения направлены на разработчиков, начинающих работу с AZD

---

### [v3.10.0] - 2026-02-05

#### Обновление точности команд Azure Developer CLI
**В этой версии исправлены несуществующие команды AZD во всей документации, гарантируя использование корректного синтаксиса Azure Developer CLI.**

#### Исправлено
- **🔧 Удалены несуществующие команды AZD**: Проведен комплексный аудит и исправление недопустимых команд:
  - `azd logs` (не существует) → заменено на `azd monitor --logs` или альтернативы Azure CLI
  - Подкоманды `azd service` (не существуют) → заменены на `azd show` и команды Azure CLI
  - `azd infra import/export/validate` (не существуют) → удалены или заменены на корректные альтернативы
  - Флаги `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не существуют) → удалены
  - Флаги `azd provision --what-if/--rollback` (не существуют) → обновлены с использованием `--preview`
  - `azd config validate` (не существует) → заменена на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не существуют) → удалены

- **📚 Обновленные файлы с исправлениями команд**:
  - `resources/cheat-sheet.md`: Крупная переработка справочника команд
  - `docs/deployment/deployment-guide.md`: Исправлены стратегии отката и развертывания
  - `docs/troubleshooting/debugging.md`: Исправлены разделы анализа логов
  - `docs/troubleshooting/common-issues.md`: Обновлены команды для устранения неполадок
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправлен раздел отладки AZD
  - `docs/getting-started/azd-basics.md`: Исправлены команды мониторинга
  - `docs/getting-started/first-project.md`: Обновлены примеры мониторинга и отладки
  - `docs/getting-started/installation.md`: Исправлены команды помощи и версии
  - `docs/pre-deployment/application-insights.md`: Исправлены команды просмотра логов
  - `docs/pre-deployment/coordination-patterns.md`: Исправлены команды отладки агентов

- **📝 Обновлена ссылка версии**: 
  - `docs/getting-started/installation.md`: Значение версии `1.5.0` заменено на универсальное `1.x.x` с ссылкой на релизы

#### Изменено
- **Стратегии отката**: Документация обновлена для использования отката на базе Git (AZD не имеет встроенного отката)
- **Просмотр логов**: Ссылки `azd logs` заменены на `azd monitor --logs`, `azd monitor --live` и команды Azure CLI
- **Раздел производительности**: Убраны несуществующие флаги параллельного/инкрементного развертывания, добавлены корректные альтернативы

#### Технические детали
- **Действительные команды AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Поддерживаемые флаги azd monitor**: `--live`, `--logs`, `--overview`
- **Удалённые функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Заметки
- **Проверка**: Команды проверены на совместимость с Azure Developer CLI версии v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершение воркшопа и улучшение качества документации
**В этой версии завершены интерактивные модули воркшопа, исправлены все битые ссылки в документации и повышено качество контента для AI-разработчиков, использующих Microsoft AZD.**

#### Добавлено
- **📝 CONTRIBUTING.md**: Новый документ с рекомендациями по участию в проекте:
  - Чёткие инструкции по сообщению об ошибках и предложению изменений
  - Стандарты документации для нового контента

  - Руководства по примерам кода и соглашения по сообщениям коммитов
  - Информация об участии сообщества

#### Выполнено
- **🎯 Модуль 7 семинара (Заключение)**: Полностью завершён модуль заключения с:
  - Комплексным обзором достижений семинара
  - Разделом освоенных ключевых концепций по AZD, шаблонам и Microsoft Foundry
  - Рекомендациями по продолжению учебного пути
  - Упражнениями для закрепления с оценкой сложности
  - Ссылками на отзывы сообщества и поддержку

- **📚 Модуль 3 семинара (Разбор)**: Обновлены цели обучения с:
  - Инструкциями по активации GitHub Copilot с серверами MCP
  - Пониманием структуры папок шаблонов AZD
  - Организационными паттернами инфраструктуры как кода (Bicep)
  - Руководством по практической лаборатории

- **🔧 Модуль 6 семинара (Снятие)**: Завершён с:
  - Целями по очистке ресурсов и управлению затратами
  - Использованием `azd down` для безопасного удаления инфраструктуры
  - Руководством по восстановлению мягко удалённых когнитивных сервисов
  - Дополнительными заданиями по GitHub Copilot и Azure Portal

#### Исправлено
- **🔗 Исправление битых ссылок**: Решено более 15 битых внутренних ссылок документации:
  - `docs/ai-foundry/ai-model-deployment.md`: исправлены пути до microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: исправлены пути до ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: заменён несуществующий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: исправлены пути к FAQ и руководству по устранению неполадок
  - `examples/container-app/microservices/README.md`: исправлены пути к домашней странице курса и руководству по развертыванию
  - `resources/faq.md` и `resources/glossary.md`: обновлены ссылки на раздел ИИ
  - `course-outline.md`: исправлены ссылки на руководство инструктора и лаборатории семинара по ИИ

- **📅 Баннер статуса семинара**: Обновлен с «В разработке» на активный статус семинара с датой февраль 2026

- **🔗 Навигация семинара**: Исправлены битые навигационные ссылки в README.md семинара, указывающие на несуществующую папку lab-1-azd-basics

#### Изменено
- **Презентация семинара**: Убран предупреждающий баннер «в разработке», семинар является завершённым и готовым к использованию
- **Последовательность навигации**: Обеспечена правильная навигация между всеми модулями семинара
- **Ссылки на учебные пути**: Обновлены перекрёстные ссылки глав с корректными путями microsoft-foundry

#### Проверено
- ✅ Все английские markdown файлы содержат корректные внутренние ссылки
- ✅ Модули семинара 0-7 завершены с определёнными целями обучения
- ✅ Навигация между главами и модулями работает корректно
- ✅ Контент подходит для разработчиков ИИ, использующих Microsoft AZD
- ✅ Использован дружелюбный к новичкам язык и структура
- ✅ CONTRIBUTING.md предоставляет ясные инструкции для участников сообщества

#### Техническая реализация
- **Валидация ссылок**: Автоматический скрипт PowerShell проверил все внутренние ссылки в .md
- **Аудит контента**: Ручная проверка полноты семинара и пригодности для новичков
- **Навигационная система**: Применены единообразные шаблоны навигации по главам и модулям

#### Примечания
- **Область изменения**: Изменения применены только к английской документации
- **Переводы**: Папки с переводами не обновлялись в этой версии (автоматический перевод синхронизируется позже)
- **Продолжительность семинара**: Полный семинар теперь предоставляет 3-4 часа практического обучения

---

### [v3.8.0] - 2025-11-19

#### Расширенная документация: мониторинг, безопасность и паттерны многоагентного взаимодействия
**В этой версии добавлены всеобъемлющие уроки высшего уровня (А) по интеграции Application Insights, паттернам аутентификации и координации многоагентных систем для продакшен-развёртываний.**

#### Добавлено
- **📊 Урок по интеграции Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Развёртывание с AZD с автоматическим предоставлением ресурсов
  - Полные Bicep шаблоны для Application Insights + Log Analytics
  - Рабочие приложения на Python с пользовательской телеметрией (более 1200 строк)
  - Паттерны мониторинга искусственного интеллекта/LLM (отслеживание токенов и затрат моделей Microsoft Foundry)
  - 6 диаграмм Mermaid (архитектура, распределённое трассирование, поток телеметрии)
  - 3 практических упражнения (оповещения, панели, мониторинг ИИ)
  - Примеры запросов Kusto и стратегии оптимизации затрат
  - Потоковое наблюдение метрик в реальном времени и отладка
  - Время обучения 40-50 минут с продакшен-паттернами

- **🔐 Урок по аутентификации и безопасности**: в `docs/getting-started/authsecurity.md`:
  - 3 паттерна аутентификации (строки подключения, Key Vault, управляемая идентификация)
  - Полные Bicep шаблоны инфраструктуры для безопасных развертываний
  - Код приложения Node.js с интеграцией Azure SDK
  - 3 полноценных упражнения (включение управляемой идентификации, назначение пользователя, ротация Key Vault)
  - Лучшие практики безопасности и конфигурация RBAC
  - Руководство по устранению неполадок и анализ затрат
  - Продакшен-паттерны аутентификации без пароля

- **🤖 Урок по паттернам многоагентного взаимодействия**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 паттернов координации (последовательный, параллельный, иерархический, событийный, консенсус)
  - Полная реализация оркестратора (Python/Flask, более 1500 строк)
  - 3 специализированных агента (исследователь, писатель, редактор)
  - Интеграция Service Bus для очередей сообщений
  - Управление состоянием с Cosmos DB для распределённых систем
  - 6 диаграмм Mermaid, показывающих взаимодействие агентов
  - 3 продвинутых упражнения (обработка тайм-аутов, логика повторов, circuit breaker)
  - Разбивка стоимости ($240-565/месяц) с оптимизациями
  - Интеграция Application Insights для мониторинга

#### Улучшено
- **Глава предразвёртывания**: теперь включает комплексный мониторинг и паттерны координации
- **Глава «Начало работы»**: расширена профессиональными паттернами аутентификации
- **Готовность к продакшену**: полное покрытие от безопасности до наблюдаемости
- **Содержание курса**: обновлено с указанием новых уроков в главах 3 и 6

#### Изменено
- **Ход обучения**: улучшена интеграция безопасности и мониторинга по всему курсу
- **Качество документации**: стандарты высшего класса (95-97%) во всех новых уроках
- **Паттерны продакшена**: полное сквозное покрытие для корпоративных развёртываний

#### Улучшено
- **Опыт разработчика**: чёткий путь от разработки к продакшен-мониторингу
- **Стандарты безопасности**: профессиональные паттерны аутентификации и управления секретами
- **Наблюдаемость**: полная интеграция Application Insights с AZD
- **Нагрузки ИИ**: специализированный мониторинг моделей Microsoft Foundry и многоагентных систем

#### Проверено
- ✅ Все уроки включают полный рабочий код (не фрагменты)
- ✅ Диаграммы Mermaid для визуального обучения (19 всего в 3 уроках)
- ✅ Практические упражнения с шагами для проверки (9 всего)
- ✅ Продакшен-ready Bicep шаблоны, разворачиваемые через `azd up`
- ✅ Анализ затрат и стратегии оптимизации
- ✅ Руководства по устранению неполадок и лучшие практики
- ✅ Контрольные точки знаний с командами для проверки

#### Результаты оценки документации
- **docs/pre-deployment/application-insights.md**: - комплексное руководство по мониторингу
- **docs/getting-started/authsecurity.md**: - профессиональные паттерны безопасности
- **docs/pre-deployment/coordination-patterns.md**: - продвинутые архитектуры многоагентных систем
- **Общий новый контент**: - последовательные высококачественные стандарты

#### Техническая реализация
- **Application Insights**: Log Analytics + пользовательская телеметрия + распределённое трассирование
- **Аутентификация**: управляемая идентичность + Key Vault + паттерны RBAC
- **Многоагентность**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Мониторинг**: живые метрики + Kusto запросы + оповещения + дашборды
- **Управление затратами**: стратегии выборочного мониторинга, политики хранения, контроль бюджета

### [v3.7.0] - 2025-11-19

#### Улучшение качества документации и новый пример моделей Microsoft Foundry
**В этой версии повышена качество документации в репозитории и добавлен полный пример развёртывания Microsoft Foundry Models с чат-интерфейсом gpt-4.1.**

#### Добавлено
- **🤖 Пример чата Microsoft Foundry Models**: Полное развёртывание gpt-4.1 с рабочей реализацией в `examples/azure-openai-chat/`:
  - Полная инфраструктура Microsoft Foundry Models (развёртывание модели gpt-4.1)
  - Python CLI чат с историей диалогов
  - Интеграция Key Vault для безопасного хранения API ключей
  - Отслеживание использования токенов и оценка затрат
  - Ограничение скорости и обработка ошибок
  - Подробное README с руководством по развертыванию на 35-45 минут
  - 11 готовых к продакшену файлов (Bicep шаблоны, Python приложение, конфигурация)
- **📚 Практические упражнения по документации**: Добавлены упражнения в руководство по конфигурации:
  - Упражнение 1: Конфигурация для нескольких сред (15 минут)
  - Упражнение 2: Практика управления секретами (10 минут)
  - Чёткие критерии успеха и шаги проверки
- **✅ Проверка развертывания**: Добавлен раздел с проверкой в руководство по развёртыванию:
  - Процедуры здравоcостояния
  - Контрольный список критериев успеха
  - Ожидаемые результаты всех команд развертывания
  - Быстрая справка по устранению неполадок

#### Улучшено
- **examples/README.md**: Обновлён до качества А (93%):
  - Добавлен azure-openai-chat во все релевантные разделы
  - Обновлено количество локальных примеров с 3 до 4
  - Добавлен в таблицу примеров AI приложений
  - Интегрирован в Quick Start для пользователей среднего уровня
  - Добавлен в раздел Microsoft Foundry Templates
  - Обновлены матрица сравнения и разделы поиска технологий
- **Качество документации**: Повышено с B+ (87%) до A- (92%) в папке docs:
  - Добавлены ожидаемые результаты к критическим примерам команд
  - Включены шаги проверки для изменений конфигурации
  - Улучшено практическое обучение с упражнениями

#### Изменено
- **Ход обучения**: Улучшена интеграция AI-примеров для пользователей среднего уровня
- **Структура документации**: Более действенные упражнения с ясными результатами
- **Процесс верификации**: Добавлены явные критерии успеха ключевых рабочих процессов

#### Улучшено
- **Опыт разработчика**: Развёртывание Microsoft Foundry Models теперь занимает 35-45 минут (вместо 60-90 для сложных альтернатив)
- **Прозрачность затрат**: Чёткие оценки затрат ($50-200/месяц) для примера Microsoft Foundry Models
- **Учебный путь**: Разработчики ИИ имеют понятную точку входа с azure-openai-chat
- **Стандарты документации**: Последовательные ожидаемые результаты и шаги проверки

#### Проверено
- ✅ Пример Microsoft Foundry Models полностью работоспособен с `azd up`
- ✅ Все 11 файлов реализации синтаксически корректны
- ✅ Инструкции в README соответствуют реальному опыту развертывания
- ✅ Обновлены ссылки в документации более чем в 8 местах
- ✅ Индекс примеров точно отражает 4 локальных примера
- ✅ Отсутствие дублирующих внешних ссылок в таблицах
- ✅ Все навигационные ссылки корректны

#### Техническая реализация
- **Архитектура Microsoft Foundry Models**: паттерн gpt-4.1 + Key Vault + Container Apps
- **Безопасность**: готовность управляемой идентичности, секреты в Key Vault
- **Мониторинг**: интеграция Application Insights
- **Управление затратами**: отслеживание токенов и оптимизация использования
- **Развёртывание**: единая команда `azd up` для полной настройки

### [v3.6.0] - 2025-11-19

#### Крупное обновление: примеры развёртывания Container App
**В этой версии представлены комплексные, готовые к продакшену примеры развёртывания контейнерных приложений с использованием Azure Developer CLI (AZD), с полной документацией и интеграцией в учебный путь.**

#### Добавлено
- **🚀 Примеры Container App**: Новые локальные примеры в `examples/container-app/`:
  - [Основное руководство](examples/container-app/README.md): полный обзор развёртываний контейнеров, быстрый старт, продакшен и продвинутые паттерны
  - [Простой Flask API](../../examples/container-app/simple-flask-api): REST API для новичков с функциями масштабирования до нуля, проверкой здоровья, мониторингом и устранением неполадок
  - [Архитектура микросервисов](../../examples/container-app/microservices): готовое к продакшену многосервисное развёртывание (API Gateway, Product, Order, User, Notification), асинхронные сообщения, Service Bus, Cosmos DB, Azure SQL, распределённое трассирование, blue-green/canary релизы
- **Лучшая практика**: безопасность, мониторинг, оптимизация затрат и рекомендации по CI/CD для контейнерных нагрузок
- **Примеры кода**: Полные `azure.yaml`, Bicep шаблоны и реализации сервисов на нескольких языках (Python, Node.js, C#, Go)
- **Тестирование и устранение неполадок**: сценарии сквозного тестирования, команды мониторинга, рекомендации по устранению

#### Изменено
- **README.md**: Обновлён для демонстрации и ссылки на новые примеры контейнерных приложений в раздел «Локальные примеры — контейнерные приложения»
- **examples/README.md**: Обновлён для выделения примеров container app, добавления записей в матрицу сравнения и обновления технологий/архитектуры
- **План курса и руководство по обучению**: Обновлены для упоминания новых примеров контейнерных приложений и паттернов развертывания в релевантных главах

#### Проверено
- ✅ Все новые примеры разворачиваются с `azd up` и соответствуют лучшим практикам
- ✅ Обновлены перекрёстные ссылки документации и навигация
- ✅ Примеры охватывают сценарии от начинающих до продвинутых, включая продакшен микросервисы

#### Примечания
- **Область изменения**: Только английская документация и примеры
- **Дальнейшие шаги**: Расширение дополнительными продвинутыми паттернами контейнеров и автоматизацией CI/CD в будущих версиях

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукта: Microsoft Foundry
**В этой версии реализовано комплексное изменение названия продукта с «Microsoft Foundry» на «Microsoft Foundry» во всей английской документации, отражая официальный ребрендинг Microsoft.**

#### Изменено
- **🔄 Обновление названия продукта**: Полный ребрендинг с «Microsoft Foundry» на «Microsoft Foundry»
  - Обновлены все упоминания во всей английской документации в папке `docs/`
  - Переименование папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Переименование файла: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всего: обновлено 23 ссылки на контент в 7 файлах документации

- **📁 Изменения структуры папок**:
  - `docs/ai-foundry/` переименована в `docs/microsoft-foundry/`
  - Обновлены все перекрестные ссылки с учетом новой структуры папок
  - Проверены навигационные ссылки во всей документации

- **📄 Переименования файлов**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Все внутренние ссылки обновлены для ссылки на новое имя файла

#### Обновленные файлы
- **Документация главы** (7 файлов):
  - `docs/microsoft-foundry/ai-model-deployment.md` - обновлено 3 навигационные ссылки
  - `docs/microsoft-foundry/ai-workshop-lab.md` - обновлено 4 упоминания названия продукта
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - уже использует Microsoft Foundry (с предыдущих обновлений)
  - `docs/microsoft-foundry/production-ai-practices.md` - обновлено 3 ссылки (обзор, отзывы сообщества, документация)
  - `docs/getting-started/azd-basics.md` - обновлено 4 перекрестные ссылки
  - `docs/getting-started/first-project.md` - обновлено 2 навигационные ссылки главы
  - `docs/getting-started/installation.md` - обновлено 2 ссылки на следующую главу
  - `docs/troubleshooting/ai-troubleshooting.md` - обновлено 3 ссылки (навигация, сообщество Discord)
  - `docs/troubleshooting/common-issues.md` - обновлена 1 навигационная ссылка
  - `docs/troubleshooting/debugging.md` - обновлена 1 навигационная ссылка

- **Файлы структуры курса** (2 файла):
  - `README.md` - обновлено 17 ссылок (обзор курса, названия глав, раздел шаблонов, обзор сообщества)
  - `course-outline.md` - обновлено 14 ссылок (обзор, учебные цели, ресурсы глав)

#### Проверено
- ✅ Нет оставшихся ссылок на путь папки "ai-foundry" в англоязычной документации
- ✅ Нет оставшихся упоминаний названия продукта "Microsoft Foundry" в англоязычной документации
- ✅ Все навигационные ссылки работают с новой структурой папок
- ✅ Переименование файлов и папок выполнено успешно
- ✅ Перекрестные ссылки между главами проверены

#### Примечания
- **Область применения**: изменения применены только к англоязычной документации в папке `docs/`
- **Переводы**: папки переводов (`translations/`) не обновлялись в этой версии
- **Воркшоп**: материалы воркшопа (`workshop/`) не обновлялись в этой версии
- **Примеры**: примерные файлы могут сохранять устаревшие имена (будет исправлено в будущем обновлении)
- **Внешние ссылки**: внешние URL и ссылки на репозиторий GitHub остались без изменений

#### Руководство по миграции для участников
Если у вас есть локальные ветки или документация, ссылающаяся на старую структуру:
1. Обновите ссылки на папку: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Обновите ссылки на файлы: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените название продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверьте, чтобы все внутренние ссылки в документации работали корректно

---

### [v3.4.0] - 2025-10-24

#### Улучшения предпросмотра инфраструктуры и валидации
**Эта версия вводит комплексную поддержку новой функции предпросмотра Azure Developer CLI и улучшает пользовательский опыт воркшопа.**

#### Добавлено
- **🧪 Документация функции azd provision --preview**: полное описание новой возможности предпросмотра инфраструктуры
  - Справочник по командам и примеры использования в шпаргалке
  - Детальная интеграция в руководстве по развертыванию с кейсами использования и преимуществами
  - Интеграция проверки перед запуском для безопасной валидации развертывания
  - Обновления руководств по началу работы с акцентом на безопасное развертывание
- **🚧 Баннер статуса воркшопа**: профессиональный HTML-баннер, информирующий о статусе разработки воркшопа
  - Градиентный дизайн с индикаторами строительства для четкой коммуникации с пользователем
  - Отметка времени последнего обновления для прозрачности
  - Адаптивный дизайн для всех типов устройств

#### Улучшено
- **Безопасность инфраструктуры**: функция предпросмотра интегрирована во всю документацию по развертыванию
- **Валидация перед развертыванием**: автоматические скрипты теперь включают тестирование предпросмотра инфраструктуры
- **Рабочий процесс разработчика**: обновленные последовательности команд включают предпросмотр как рекомендуемую практику
- **Опыт воркшопа**: пользователям четко установлены ожидания относительно статуса разработки контента

#### Изменено
- **Лучшие практики развертывания**: рекомендован подход с превалирующим использованием предпросмотра
- **Последовательность документации**: валидация инфраструктуры теперь расположена раньше в обучающем процессе
- **Презентация воркшопа**: профессиональная коммуникация статуса с четким графиком разработки

#### Улучшено
- **Подход «Безопасность прежде всего»**: возможность проверки изменений инфраструктуры до развертывания
- **Командное сотрудничество**: результаты предпросмотра можно делиться для совместного обзора и утверждения
- **Осведомленность о расходах**: лучшее понимание стоимости ресурсов до протвведения
- **Снижение рисков**: уменьшение сбоев развертывания за счет предварительной валидации

#### Техническая реализация
- **Мультидокументная интеграция**: функция предпросмотра описана в 4 ключевых файлах
- **Шаблоны команд**: единый синтаксис и примеры во всей документации
- **Интеграция лучших практик**: предпросмотр включен в процессы валидации и скрипты
- **Визуальные индикаторы**: четкие пометки НОВЫХ функций для лучшей видимости

#### Инфраструктура воркшопа
- **Коммуникация статуса**: профессиональный HTML-баннер с градиентным стилем
- **Удобство для пользователя**: четкий статус разработки предотвращает путаницу
- **Профессиональная презентация**: поддерживает доверие к репозиторию и устанавливает ожидания
- **Прозрачность сроков**: отметка времени последнего обновления — октябрь 2025 года для ответственности

### [v3.3.0] - 2025-09-24

#### Улучшенные материалы воркшопа и интерактивный учебный опыт
**Эта версия вводит полный набор материалов воркшопа с браузерным интерактивным руководством и структурированной учебной траекторией.**

#### Добавлено
- **🎥 Интерактивное руководство воркшопа**: браузерный опыт воркшопа с возможностями предпросмотра MkDocs
- **📝 Структурированные инструкции воркшопа**: 7-шаговый путь обучения от знакомства до настройки
  - 0-Введение: обзор и установка воркшопа
  - 1-Выбор-АИ-Шаблона: поиск и выбор шаблона
  - 2-Валидация-АИ-Шаблона: процедуры развертывания и проверки
  - 3-Анализ-АИ-Шаблона: понимание архитектуры шаблона
  - 4-Настройка-АИ-Шаблона: конфигурация и кастомизация
  - 5-Пользовательская-модификация-АИ-Шаблона: продвинутые изменения и итерации
  - 6-Очистка-инфраструктуры: удаление и управление ресурсами
  - 7-Итоги: резюме и дальнейшие шаги
- **🛠️ Инструменты воркшопа**: конфигурация MkDocs с темой Material для улучшенного обучения
- **🎯 Пошаговый путь обучения**: 3-ступенчатая методология (Открытие → Развертывание → Кастомизация)
- **📱 Интеграция с GitHub Codespaces**: бесшовная настройка среды разработки

#### Улучшено
- **Лаборатория AI воркшопа**: расширена до комплексного 2-3 часового структурированного обучения
- **Документация воркшопа**: профессиональная подача с навигацией и визуальными подсказками
- **Прогресс обучения**: четкая поэтапная инструкция от выбора шаблона до создания решения в продакшене
- **Опыт разработчика**: интегрированные инструменты для упрощения рабочих процессов разработки

#### Улучшено
- **Доступность**: браузерный интерфейс с поиском, функцией копирования и переключателем темы
- **Обучение в собственном темпе**: гибкая структура воркшопа для разных скоростей освоения
- **Практическое применение**: реальные сценарии развертывания AI шаблонов
- **Интеграция сообщества**: Discord для поддержки и совместной работы по воркшопу

#### Особенности воркшопа
- **Встроенный поиск**: быстрый поиск по ключевым словам и урокам
- **Копирование блоков кода**: возможность копирования по наведению на все примеры кода
- **Переключение темы**: поддержка светлого и темного режимов для разных предпочтений
- **Визуальные материалы**: скриншоты и диаграммы для лучшего восприятия
- **Интеграция помощи**: прямая связь с Discord сообществом

### [v3.2.0] - 2025-09-17

#### Крупная реструктуризация навигации и система обучения по главам
**Этот релиз вводит полную структуру обучения по главам с улучшенной навигацией по всему репозиторию.**

#### Добавлено
- **📚 Система обучения по главам**: курс полностью переработан в 8 прогрессивных учебных глав
  - Глава 1: Основы и быстрый старт (⭐ - 30-45 мин)
  - Глава 2: Разработка с приоритетом AI (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и аутентификация (⭐⭐ - 45-60 мин)
  - Глава 4: Инфраструктура как код и развертывание (⭐⭐⭐ - 1-1.5 часа)
  - Глава 5: Многоагентные AI решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Валидация и планирование перед развертыванием (⭐⭐ - 1 час)
  - Глава 7: Устранение неполадок и отладка (⭐⭐ - 1-1.5 часа)
  - Глава 8: Производственные и корпоративные паттерны (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Комплексная навигационная система**: единые заголовки и футеры во всей документации
- **🎯 Отслеживание прогресса**: чеклист выполнения курса и система проверки знаний
- **🗺️ Руководство по учебному пути**: четкие точки входа для разных уровней опыта и целей
- **🔗 Перекрестная навигация**: связанные главы и требования четко связаны ссылками

#### Улучшено
- **Структура README**: преобразована в структурированную платформу обучения с организацией по главам
- **Навигация документации**: каждая страница теперь содержит контекст главы и руководство по прогрессу
- **Организация шаблонов**: примеры и шаблоны сопоставлены с учебными главами
- **Интеграция ресурсов**: шпаргалки, FAQ и учебные пособия связаны с соответствующими главами
- **Интеграция воркшопа**: практические лаборатории связаны с несколькими учебными целями глав

#### Изменено
- **Прогресс обучения**: переход от линейной документации к гибкому обучению по главам
- **Размещение конфигурации**: руководство по конфигурации переведено в Главу 3 для лучшего учебного потока
- **Интеграция AI-контента**: лучший охват AI-тематики по всему учебному курсу
- **Производственный контент**: продвинутые паттерны собраны в Главе 8 для корпоративных пользователей

#### Улучшено
- **Пользовательский опыт**: четкие навигационные хлебные крошки и индикаторы прогресса
- **Доступность**: единообразные навигационные схемы для упрощения прохождения курса
- **Профессиональная подача**: университетская структура курса, подходящая для академического и корпоративного обучения
- **Эффективность обучения**: сокращение времени на поиск нужного материала за счет улучшенной организации

#### Техническая реализация
- **Заголовки навигации**: стандартизированы для более 40 файлов документации
- **Футер навигации**: единый гид по прогрессу и индикаторы завершения глав
- **Взаимосвязи**: разветвленная система внутренних ссылок, соединяющая связанные понятия
- **Отображение глав**: шаблоны и примеры связаны с учебными целями

#### Улучшение учебного пособия
- **📚 Полные учебные цели**: учебное пособие перестроено по 8-главной системе
- **🎯 Оценка по главам**: каждая глава содержит конкретные цели и практические упражнения
- **📋 Отслеживание прогресса**: еженедельный учебный план с измеримыми результатами и чеклистами
- **❓ Проверочные вопросы**: проверки знаний для каждой главы с профессиональными результатами
- **🛠️ Практические упражнения**: занятия с реальными сценариями развертывания и устранения ошибок
- **📊 Прогресс навыков**: ясное развитие от базовых концепций до корпоративных паттернов с акцентом на карьерный рост
- **🎓 Рамки сертификации**: профессиональное развитие и система признания в сообществе
- **⏱️ Управление сроками**: структурированный 10-недельный учебный план с проверкой ключевых этапов

### [v3.1.0] - 2025-09-17

#### Улучшенные многоагентные AI решения
**Эта версия улучшает многоагентное ритейл решение с более понятными именами агентов и расширенной документацией.**

#### Изменено
- **Терминология многоагентной системы**: заменено "агент Cora" на "агент клиента" в решении ритейл для лучшего понимания
- **Архитектура агентов**: обновлена вся документация, ARM шаблоны и примеры кода для использования единообразного названия "агент клиента"
- **Примеры конфигурации**: современные шаблоны конфигурации с обновленной терминологией
- **Последовательность в документации**: все упоминания используют профессиональные и описательные имена агентов

#### Улучшено
- **Пакет ARM шаблонов**: обновлен retail-multiagent-arm-template с ссылками на агента клиента
- **Диаграммы архитектуры**: обновлены диаграммы Mermaid с новыми именами агентов
- **Примеры кода**: Python классы и реализации теперь используют CustomerAgent
- **Переменные окружения**: скрипты развертывания изменены с CORA_AGENT_* на CUSTOMER_AGENT_*

#### Улучшено
- **Опыт разработчика**: более ясные роли и обязанности агентов в документации
- **Готовность к производству**: лучшее соответствие корпоративным соглашениям по именованию
- **Учебные материалы**: более интуитивные имена агентов для обучения
- **Удобство шаблонов**: упрощенное понимание функций агентов и шаблонов развертывания

#### Технические детали
- Обновлены диаграммы Mermaid для CustomerAgent
- Заменены имена классов CoraAgent на CustomerAgent в Python-примерах
- Изменены ARM шаблоны на использование типа агента "customer"
- Обновлены переменные окружения с CORA_AGENT_* на CUSTOMER_AGENT_*
- Актуализированы все команды и конфигурации контейнеров для развертывания

### [v3.0.0] - 2025-09-12

#### Крупные изменения - акцент на разработчиков AI и интеграция Microsoft Foundry
**Данная версия трансформирует репозиторий в полный учебный ресурс с фокусом на AI-разработчиков и интеграцией Microsoft Foundry.**

#### Добавлено
- **🤖 AI-первый учебный путь**: полная реструктуризация с приоритетом для AI разработчиков и инженеров
- **Руководство по интеграции Microsoft Foundry**: подробная документация по соединению AZD с сервисами Microsoft Foundry
- **Паттерны развертывания AI моделей**: подробное руководство по выбору моделей, конфигурации и стратегиям продакшен-развертывания
- **Лаборатория AI Workshop**: Практический семинар длительностью 2-3 часа по преобразованию AI-приложений в решения, готовые к развертыванию с помощью AZD  
- **Лучшие практики Production AI**: Готовые к использованию корпоративные паттерны масштабирования, мониторинга и обеспечения безопасности AI-нагрузок  
- **Руководство по устранению неполадок AI**: Полное руководство по устранению неполадок для Microsoft Foundry Models, Cognitive Services и проблем с развертыванием AI  
- **Галерея шаблонов AI**: Избранная коллекция шаблонов Microsoft Foundry с рейтингами сложности  
- **Материалы семинара**: Полная структура семинара с практическими лабораторными работами и справочными материалами  

#### Улучшено  
- **Структура README**: Ориентирована на разработчиков AI с данными о 45% заинтересованности сообщества из Microsoft Foundry Discord  
- **Учебные пути**: Специальный путь развития для разработчиков AI наряду с традиционными маршрутами для студентов и инженеров DevOps  
- **Рекомендации по шаблонам**: Избранные шаблоны AI, включая azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart  
- **Интеграция сообщества**: Расширенная поддержка сообщества в Discord с AI-специфичными каналами и обсуждениями  

#### Безопасность и фокус на производство  
- **Паттерны управления идентификацией**: Аутентификация и настройки безопасности, специфичные для AI  
- **Оптимизация затрат**: Отслеживание использования токенов и контроль бюджета для AI-нагрузок  
- **Мульти-региональное развертывание**: Стратегии глобального развертывания AI-приложений  
- **Мониторинг производительности**: Метрики, специфичные для AI, и интеграция с Application Insights  

#### Качество документации  
- **Линейная структура курса**: Логическое развитие от начального до продвинутого уровня паттернов развертывания AI  
- **Проверенные URL**: Все внешние ссылки на репозитории проверены и доступны  
- **Полная справочность**: Все внутренние ссылки на документацию проверены и работают  
- **Готовность к производству**: Корпоративные паттерны развертывания с примерами из реальной жизни  

### [v2.0.0] - 2025-09-09

#### Основные изменения — реорганизация репозитория и профессиональное улучшение  
**Эта версия представляет собой значительную переработку структуры репозитория и презентации контента.**

#### Добавлено  
- **Структурированная учебная база**: На всех страницах документации добавлены разделы Введение, Цели обучения и Результаты обучения  
- **Система навигации**: Добавлены ссылки на предыдущие/следующие уроки на всех страницах документации для поэтапного изучения  
- **Учебное руководство**: Полный study-guide.md с учебными задачами, практическими упражнениями и материалами для оценки  
- **Профессиональная презентация**: Удалены все эмодзи для улучшения доступности и профессионального вида  
- **Улучшенная структура контента**: Оптимизация организации и логики подачи учебных материалов  

#### Изменено  
- **Формат документации**: Стандартизирована вся документация с единым учебно-ориентированным форматом  
- **Поток навигации**: Внедрена логическая последовательность изучения материалов  
- **Презентация контента**: Удалены декоративные элементы ради чистого и профессионального оформления  
- **Структура ссылок**: Обновлены все внутренние ссылки для поддержки новой навигационной системы  

#### Улучшено  
- **Доступность**: Удалена зависимость от эмодзи для лучшей совместимости с экранными читалками  
- **Профессиональный внешний вид**: Чистое академическое оформление, подходящее для корпоративного обучения  
- **Учебный опыт**: Структурированный подход с четкими целями и результатами для каждого урока  
- **Организация контента**: Улучшенный логический поток и взаимосвязь между темами  

### [v1.0.0] - 2025-09-09

#### Первый релиз — комплексный учебный репозиторий AZD  

#### Добавлено  
- **Базовая структура документации**  
  - Полная серия руководств для начального знакомства  
  - Всеобъемлющая документация по развертыванию и провиженингу  
  - Подробные ресурсы по устранению неполадок и отладочным процессам  
  - Инструменты и процедуры проверки перед развертыванием  

- **Модуль для начала работы**  
  - Основы AZD: ключевые понятия и терминология  
  - Руководство по установке: инструкции для разных платформ  
  - Настройка: подготовка окружения и аутентификация  
  - Первый проект: пошаговое практическое обучение  

- **Модуль развертывания и провиженинга**  
  - Руководство по развертыванию: полный рабочий процесс  
  - Провиженинг: инфраструктура как код с Bicep  
  - Лучшие практики для развертываний в продакшене  
  - Паттерны многосервисной архитектуры  

- **Модуль проверки перед развертыванием**  
  - Планирование емкости: проверка доступности ресурсов Azure  
  - Выбор SKU: подробные рекомендации по уровням сервиса  
  - Проверки перед запуском: автоматизированные скрипты (PowerShell и Bash)  
  - Инструменты оценки затрат и планирования бюджета  

- **Модуль устранения неполадок**  
  - Типичные проблемы: часто встречающиеся ошибки и их решения  
  - Руководство по отладке: систематические методы устранения неполадок  
  - Продвинутые диагностические техники и инструменты  
  - Мониторинг производительности и оптимизация  

- **Ресурсы и справочные материалы**  
  - Шпаргалка по командам: быстрый доступ к основным командам  
  - Глоссарий: терминология и сокращения  
  - FAQ: ответы на часто задаваемые вопросы  
  - Внешние ссылки и связи с сообществом  

- **Примеры и шаблоны**  
  - Пример простого веб-приложения  
  - Шаблон развертывания статического сайта  
  - Конфигурация контейнерного приложения  
  - Паттерны интеграции баз данных  
  - Примеры микросервисной архитектуры  
  - Реализации безсерверных функций  

#### Особенности  
- **Мульти-платформенная поддержка**: инструкции по установке и настройке для Windows, macOS и Linux  
- **Различные уровни сложности**: материалы для студентов и профессиональных разработчиков  
- **Практическая направленность**: практические примеры и сценарии из реальной жизни  
- **Всестороннее покрытие**: от базовых концепций до продвинутых корпоративных паттернов  
- **Безопасность на первом месте**: интеграция лучших практик безопасности  
- **Оптимизация затрат**: рекомендации по экономичному развертыванию и управлению ресурсами  

#### Качество документации  
- **Подробные примеры кода**: практические, протестированные образцы  
- **Пошаговые инструкции**: понятные и реализуемые руководства  
- **Полное покрытие ошибок**: устранение типичных проблем  
- **Внедрение лучших практик**: отраслевые стандарты и рекомендации  
- **Совместимость версий**: актуально для последних сервисов Azure и функций azd  

## Планируемые будущие улучшения

### Версия 3.1.0 (в планах)  
#### Расширение AI-платформы  
- **Поддержка нескольких моделей**: паттерны интеграции для Hugging Face, Azure Machine Learning и собственных моделей  
- **Фреймворки агентов AI**: шаблоны для развертывания LangChain, Semantic Kernel и AutoGen  
- **Продвинутые RAG-паттерны**: векторные базы данных кроме Azure AI Search (Pinecone, Weaviate и др.)  
- **Наблюдаемость AI**: расширенный мониторинг производительности моделей, использования токенов и качества ответов  

#### Опыт разработчика  
- **Расширение VS Code**: интегрированный опыт разработки AZD + Microsoft Foundry  
- **Интеграция GitHub Copilot**: генерация шаблонов AZD с помощью AI  
- **Интерактивные учебники**: практические упражнения с автоматической проверкой для AI-сценариев  
- **Видеоконтент**: дополнительные видеоуроки для визуальных обучающихся с фокусом на развертывание AI  

### Версия 4.0.0 (в планах)  
#### Корпоративные паттерны AI  
- **Фреймворк управления**: управление моделями AI, соответствие требованиям и аудит  
- **Мультиарендный AI**: паттерны обслуживания нескольких клиентов с изолированными AI-сервисами  
- **Развертывание AI на периферии**: интеграция с Azure IoT Edge и контейнерными инстансами  
- **Гибридный облачный AI**: мультиоблачные и гибридные паттерны развертывания AI-нагрузок  

#### Продвинутые возможности  
- **Автоматизация конвейера AI**: интеграция MLOps с конвейерами Azure Machine Learning  
- **Продвинутая безопасность**: модели нулевого доверия, приватные эндпоинты и продвинутая защита от угроз  
- **Оптимизация производительности**: тонкая настройка и стратегии масштабирования для высокопроизводительных AI-приложений  
- **Глобальное распределение**: паттерны доставки контента и кэширования на периферии для AI-приложений  

### Версия 3.0.0 (планировалась) — заменена текущим выпуском  
#### Предложенные дополнения — реализованы в v3.0.0  
- ✅ **AI-ориентированный контент**: полная интеграция Microsoft Foundry (завершено)  
- ✅ **Интерактивные учебники**: практическая лаборатория AI (завершено)  
- ✅ **Продвинутый модуль безопасности**: паттерны безопасности для AI (завершено)  
- ✅ **Оптимизация производительности**: стратегии настройки AI-нагрузок (завершено)  

### Версия 2.1.0 (планировалась) — частично реализована в v3.0.0  
#### Небольшие улучшения — некоторые выполнены в текущем релизе  
- ✅ **Дополнительные примеры**: сценарии развертывания AI (завершено)  
- ✅ **Расширенный FAQ**: вопросы и решения по AI (завершено)  
- **Интеграция инструментов**: улучшенные руководства по интеграции с IDE и редакторами  
- ✅ **Расширение мониторинга**: паттерны AI-специфичного мониторинга и оповещений (завершено)  

#### Всё ещё в планах на будущее  
- **Мобильная документация**: адаптивный дизайн для мобильного обучения  
- **Оффлайн-доступ**: пакеты документации для скачивания  
- **Улучшенная интеграция IDE**: расширение VS Code для AZD + AI-процессов  
- **Панель сообщества**: метрики сообщества и отслеживание вкладов в реальном времени  

## Вклад в журнал изменений

### Сообщение об изменениях  
При внесении изменений в этот репозиторий, пожалуйста, убедитесь, что записи в журнале изменений включают:

1. **Номер версии**: согласно семантическому версионированию (major.minor.patch)  
2. **Дата**: дата релиза или обновления в формате ГГГГ-ММ-ДД  
3. **Категория**: Добавлено, Изменено, Устарело, Удалено, Исправлено, Безопасность  
4. **Ясное описание**: лаконичное описание изменений  
5. **Оценка воздействия**: как изменения влияют на существующих пользователей  

### Категории изменений

#### Добавлено  
- Новые функции, разделы документации или возможности  
- Новые примеры, шаблоны или обучающие ресурсы  
- Дополнительные инструменты, скрипты или утилиты  

#### Изменено  
- Изменения в существующем функционале или документации  
- Обновления для улучшения ясности или точности  
- Реорганизация контента или структуры  

#### Устарело  
- Функции или подходы, которые постепенно выводятся из использования  
- Разделы документации, планируемые к удалению  
- Методы с более эффективными альтернативами  

#### Удалено  
- Функции, документация или примеры, которые больше не актуальны  
- Устаревшая информация или устаревшие подходы  
- Дублирующийся или консолидированный контент  

#### Исправлено  
- Исправления ошибок в документации или коде  
- Решение заявленных проблем или багов  
- Улучшения точности или функциональности  

#### Безопасность  
- Обновления или исправления, связанные с безопасностью  
- Улучшения практик безопасности  
- Лечение уязвимостей  

### Руководство по семантическому версионированию

#### Главная версия (X.0.0)  
- Ломающее совместимость изменение, требующее действий пользователя  
- Значительная реорганизация контента или структуры  
- Изменения, меняющие основную методологию  

#### Минорная версия (X.Y.0)  
- Новые функции или дополнения контента  
- Улучшения, сохраняющие обратную совместимость  
- Дополнительные примеры, инструменты или ресурсы  

#### Патч версия (X.Y.Z)  
- Исправление багов и ошибок  
- Незначительные улучшения существующего контента  
- Уточнения и небольшие дополнения  

## Обратная связь и предложения сообщества

Мы активно приветствуем обратную связь сообщества для улучшения этого учебного ресурса:

### Как оставить отзыв  
- **GitHub Issues**: Сообщайте о проблемах или предлагайте улучшения (особенно по AI)  
- **Обсуждения в Discord**: Делитесь идеями и участвуйте в сообществе Microsoft Foundry  
- **Pull Requests**: Вносите прямые улучшения контента, особенно AI-шаблонов и руководств  
- **Microsoft Foundry Discord**: Участвуйте в канале #Azure для обсуждений AZD + AI  
- **Форумы сообщества**: Участвуйте в более широких обсуждениях разработчиков Azure  

### Категории отзывов  
- **Точность AI-контента**: Исправления по интеграции AI-сервисов и развертыванию  
- **Учебный опыт**: Предложения по улучшению пути обучения разработчиков AI  
- **Отсутствующий AI-контент**: Запросы дополнительных шаблонов, паттернов или примеров AI  
- **Доступность**: Улучшения для различных потребностей обучающихся  
- **Интеграция AI-инструментов**: Предложения по улучшению рабочих процессов AI-разработки  
- **Паттерны Production AI**: Запросы на корпоративные паттерны развертывания AI  

### Обязательства по ответам  
- **Ответ на вопросы**: В течение 48 часов для заявленных проблем  
- **Запросы функций**: Рассмотрение в течение недели  
- **Вклады сообщества**: Проверка в течение недели  
- **Вопросы безопасности**: Немедленный приоритет и ускоренный ответ  

## Расписание обслуживания

### Регулярные обновления  
- **Ежемесячные проверки**: Точность контента и валидация ссылок  
- **Квартальные обновления**: Крупные дополнения и улучшения  
- **Полугодовые обзоры**: Комплексная реорганизация и повышение качества  
- **Годовые релизы**: Выпуски основных версий с важными улучшениями  

### Мониторинг и контроль качества  
- **Автоматическое тестирование**: Регулярная проверка примеров кода и ссылок  
- **Интеграция отзывов**: Регулярное включение пользовательских предложений  
- **Обновление технологий**: Соответствие последним сервисам Azure и версиям azd  
- **Аудит доступности**: Проверки на соответствие принципам инклюзивного дизайна  

## Политика поддержки версий

### Поддержка текущей версии  
- **Последняя главная версия**: Полная поддержка с регулярными обновлениями  
- **Предыдущая главная версия**: Обновления безопасности и критические исправления в течение 12 месяцев  
- **Устаревшие версии**: Поддержка сообществом, официальных обновлений нет  

### Руководства по миграции  
При выпуске новых главных версий предоставляются:  
- **Гайды по миграции**: Пошаговые инструкции перехода  
- **Примечания к совместимости**: Информация о нарушениях совместимости  
- **Инструменты поддержки**: Скрипты и утилиты для миграции  
- **Поддержка сообщества**: Специализированные форумы для вопросов по миграции  

---

**Навигация**  
- **Предыдущий урок**: [Учебное руководство](resources/study-guide.md)  
- **Следующий урок**: Вернуться к [Главному README](README.md)  

**Будьте в курсе**: Следите за этим репозиторием, чтобы получать уведомления о новых релизах и важных обновлениях учебных материалов.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->