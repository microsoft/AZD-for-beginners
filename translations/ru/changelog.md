# История изменений - AZD Для начинающих

## Введение

Эта история изменений документирует все значимые изменения, обновления и улучшения в репозитории AZD Для начинающих. Мы придерживаемся принципов семантического версионирования и поддерживаем этот журнал, чтобы помочь пользователям понять, что изменилось между версиями.

## Цели обучения

Просматривая эту историю изменений, вы сможете:
- Оставаться в курсе новых функций и добавлений контента
- Понимать улучшения, внесённые в существующую документацию
- Отслеживать исправления ошибок и корректировки для обеспечения точности
- Следить за развитием учебных материалов со временем

## Результаты обучения

После ознакомления с записями в истории изменений вы сможете:
- Опознавать новый контент и доступные ресурсы для обучения
- Понимать, какие разделы были обновлены или улучшены
- Планировать свой путь обучения на основе самых актуальных материалов
- Вносить отзывы и предложения по будущим улучшениям

## История версий

### [v3.24.0]- 2026-11-04

#### Исправлено
- Исправлена навигация по курсу на английском языке, пути перемещённых страниц, отсутствующие якоря и устаревшие внешние ссылки, включая ссылку на Глава 2 на руководство по продакшену ИИ.
- Проведён обзор текущих рекомендаций на основе опубликованной версии AZD 1.37.2, агентов 1.0.0-beta.23 и оценок 1.0.0-beta.2. Задокументирован отдельный `azd ai eval` рабочий процесс и миграция конфигурации оптимизации.
- Исправлены неподдерживаемые флаги CLI, границы аутентификации, рекомендации по работе с открытыми средами/секретами, обновления инфраструктуры, конфигурация моделей и примеры разрушительного восстановления.
- Обновлен мастер-класс на основе текущего примера AI Agents, включая реальные хуки, параметры конфигурации, тесты оценки, точки входа red-teaming и наблюдаемость.
- Исправлены утверждения в примерах реализации и устранены связанные проблемы с приложением/инфраструктурой/конфигурацией. Материалы по архитектуре ритейла явно отделены от полного рабочего приложения.
- Восстановлена матрица языков CodeQL, выбран поддерживаемый Node.js 24 для dev-контейнера, и валидаторы установки теперь сообщают о неудачных командах версий.

#### Добавлено
- Англоязычный офлайн-проверщик ссылок/якорей, регрессионные тесты и рабочий процесс документации, который также собирает мастер-класс в строгом режиме. Сгенерированные переводы и переведённые изображения исключены.

#### Область проверки
- Проверки исходного кода, синтаксиса, конфигурации, локального поведения и сетевых ссылок не обеспечивают проверку возможности развертывания в режиме live Azure, квот, RBAC, региональной доступности моделей, выставления счетов, соответствия безопасности или готовности к продакшену.
- Старые записи ниже являются историческими записями, а не текущими инструкциями по командам или релизам.

### [v3.23.0] - 2026-07-13

#### Обновление AZD 1.27.1: Актуализация версии
**Эта версия повторно валидирует курс с `azd` `1.27.1` (июль 2026, последняя стабильная версия) и текущим предварительным расширением AI агента `azure.ai.agents` `1.0.0-beta.5`, обновляя все баннеры "проверено на" после выпусков 1.26.0, 1.27.0 и 1.27.1.**

#### Изменено
- **✅ Обновлена базовая линия валидации** с `azd 1.25.6` (июнь 2026) до `azd 1.27.1` (июль 2026) в корневом README, во всех главных README, уроке dev-контейнера Главы 1 (включая примеры с фиксированными версиями), уроке кастомных шаблонов Главы 4, уроке мультиагентов Главы 5 и документации мастер-класса
- **🤖 Обновлена базовая линия Главы 2** с `azd 1.23.12` (март 2026) до `azd 1.27.1` в `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; даты заметок валидации обновлены до 2026-07-13
- **🧩 Обновлено расширение AI агента** с `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до текущего выпуска `1.0.0-beta.5` в README Главы 2 и `agents.md`
- **🧪 Обновлен пример валидации мастер-класса** (вывод `azd version`) до `1.27.1`

#### Примечания к релизам azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Поддержка Go для Azure Functions на Flex Consumption, фильтры подписок по арендаторам `azd config sub-filter`, автономные пакеты расширений (`azd x pack --bundle`) и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделирование проектов/агентов Azure AI Foundry непосредственно в `azure.yaml` (инициализация без Bicep/Terraform), поддержка контейнерного развертывания для App Service (`host: appservice` + `language: docker`), прямое `-s/--source` для команд `azd extension` и `azd tool uninstall`
- **1.27.1 (2026-07-09):** флаг `--no-dependencies` для `azd extension install`, исключение устаревших моделей из каталога/квот по умолчанию и несколько исправлений ошибок

#### Обновленные файлы
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

#### Заполнение пробелов для начинающих #2: Авторинг шаблонов, Дев-контейнеры, Pulumi, Azure DevOps, сервисные принципы и многое другое
**Эта версия закрывает оставшиеся промежуточные пробелы, выявленные анализом покрытия azd: как создавать и публиковать собственные шаблоны, воспроизводимые дев-контейнеры/Codespaces, провайдер инфраструктуры Pulumi, обзор CI/CD Azure DevOps, аутентификация сервисных принципов, рекомендации по выбору хоста (AKS/Spring Apps), объяснения `azd restore`/`azd package`, обработка ошибок хуков и практики командной/совместной работы с окружениями.**

#### Добавлено
- **🧱 Новый урок главы 4** `docs/chapter-04-infrastructure/custom-templates.md` — создание собственного azd шаблона: необходимая структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризация инфраструктуры с помощью `uniqueString()` ресурсного токена и `azd-env-name` тега, локальное тестирование с `azd init --template <local-path>`, публикация на GitHub и отправка в галерею Awesome AZD
- **📦 Новый урок главы 1** `docs/chapter-01-foundation/dev-containers.md` — воспроизводимые azd окружения с Dev Containers и GitHub Codespaces: минимальный `.devcontainer/devcontainer.json` с использованием официальной функции `ghcr.io/azure/azure-dev/azd`, специфичные для языка функции, `docker-in-docker` для контейнерных хостов и `azd auth login --use-device-code` для удалённого входа
- **🧩 Раздел Pulumi с azd** в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура папок Pulumi, стеки, сопоставленные с azd окружениями, необходимые выходы/теги и идентичный рабочий процесс `azd up` / `azd down`
- **🎯 Руководство по выбору хоста** в `docs/chapter-04-infrastructure/provisioning.md` — дружелюбное сравнение `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp` с рекомендациями, когда выбирать AKS или Azure Spring Apps
- **🛠️ Обзор CI/CD в Azure DevOps** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, подключение сервиса с федерацией идентичности нагрузки (OIDC), сгенерированный `azure-dev.yml` и настройка групп переменных
- **🔑 Сервисные принципы (паттерн 4)** добавлены в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивный `azd auth login` с секретом клиента против федеративных/OIDC учётных данных, когда использовать и безопасное хранение учётных данных
- **🪝 Обработка ошибок хуков** в подразделе `docs/chapter-04-infrastructure/deployment-guide.md` — коды выхода и `set -e`, `continueOnError`, тестирование хуков в изоляции с `azd hooks run`, OS-специфичные оболочки и `--debug`
- **👥 Командные / совместные окружения** в разделе `docs/chapter-03-configuration/configuration.md` — что хранится в `.azure/`, что игнорировать в git, окружения для каждого разработчика, `azd env list`/`select` и предоставление значений окружения в CI/CD
- **🧰 `azd restore` и расширенные объяснения `azd package`** в `resources/cheat-sheet.md` — восстановление зависимостей и сборка артефакта для деплоя без самого деплоя

#### Изменено
- **🧭 Таблица уроков главы 4** обновлена для включения нового урока "Создание собственного шаблона" (Урок 3)
- **🧭 Таблица уроков главы 1** обновлена с новым уроком "Dev Containers & Codespaces" (Урок 5); навигационные футеры связаны между `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заполнение пробелов для начинающих: Практический урок по мультиагентам, "принеси своё приложение", Terraform и обзор CI/CD
**Эта версия закрывает крупнейшие пробелы в полном руководстве для начинающих, добавляя два новых практических урока (процесс деплоя мультиагента и добавление azd в существующее приложение), новичковое введение в хуки, раздел Terraform с azd, пошаговый обзор pipelines GitHub Actions, объяснитель новых предварительных расширений и явный чеклист проверки деплоя.**

#### Добавлено
- **🤝 Новый урок главы 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — полностью практический, деплойный сценарий с двумя агентами (оркестратор + специалисты) с использованием реального шаблона (`contoso-creative-writer`), охватывающий когда использовать мультиагентов, рабочий процесс `azd up`, понимание задеплоенных ресурсов, трассировку между агентами, кастомизацию и очистку
- **📦 Новый урок главы 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как добавить azd в существующий проект с помощью `azd init` ("использовать код в текущем каталоге"), понимание `azure.yaml` и `infra/`, `azd infra generate`, определение хоста и развертывание с `azd up`
- **🌐 Раздел Terraform с azd** добавлен в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, структура папок `.tf`, необходимые выходы `AZURE_*` и теги `azd-env-name`, и идентичный рабочий процесс `azd up` / `azd down` (закрывает пробел, где поддержка Terraform заявлялась, но демонстрировался только Bicep)
- **⚙️ Пошаговый обзор GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от репозитория GitHub до автоматических деплоев: `azd pipeline config`, федеративные учетные данные OIDC (без сохраненных секретов), сгенерированный `azure-dev.yml` и руководство по секретам и переменным
- **🪝 Новичковое введение "Новичок в хуках?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — что такое хук, таблица этапов хука, минимальный первый хук и ручной запуск хуков с `azd hooks run`
- **✅ Чеклист "Проверь свой деплой"** добавлен на шаг 5 `docs/chapter-01-foundation/first-project.md` — smoke тест, проверка конечной точки здоровья и явные критерии успеха
- **🧩 Объяснитель для новых предварительных расширений** `azure.ai.skills` и `azure.ai.connections` (что это и когда их использовать) в `docs/chapter-08-production/production-ai-practices.md`

#### Изменено
- **🧭 Таблица уроков главы 5** исправлена: `multi-agent-basics.md` теперь Урок 1 (единственный полностью практический урок), с честной маркировкой, что Урок 2 расположился в Главе 6, а сценарий розничной торговли — это архитектурный план, а не шаблон в одну команду
- **🧭 Таблица уроков главы 1** теперь включает новый урок "Принеси своё приложение" (Урок 4)
- **🔗 Навигационные футеры** обновлены: `first-project.md` теперь ссылается вперёд на `bring-your-own-app.md`

#### Исправлено
- **🧱 Закрыт пробел поддержки Terraform** — ранее курс упоминал Terraform, но не показывал его
- **🔀 Исправлены вводящие в заблуждение перекрёстные ссылки главы 5**, которые подразумевали наличие полного мультиагентного решения, тогда как был только архитектурный план

#### Обновленные файлы
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

#### Обновление AZD 1.25.6, Полный жизненный цикл агента и Ребрендинг Aspire
**Эта версия повторно проверяет курс на соответствие `azd` `1.25.6` (июнь 2026) и расширению `azure.ai.agents` `0.1.40-preview`, расширяет рекомендации по ИИ от "конструирования агента" до полного жизненного цикла агента (тестирование → оценка → оптимизация → инспекция → удаление), демонстрирует новые расширения предварительного просмотра `azure.ai.skills` и `azure.ai.connections`, а также отмечает ребрендинг продукта ".NET Aspire" в "Aspire".**

#### Добавлено
- **🔁 Полное покрытие жизненного цикла агента** для новичков и инженеров ИИ на протяжении всей документации:
  - `docs/chapter-01-foundation/azd-basics.md` — Таблица жизненного цикла (конструирование → тестирование → измерение → улучшение → инспекция → очистка) добавлена в раздел Расширения и команды ИИ
  - `docs/chapter-08-production/production-ai-practices.md` — Новый раздел "Управление жизненным циклом агента", охватывающий `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Расширенные команды ИИ-агента с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Новые расширения предварительного просмотра** задокументированы: `azure.ai.skills` (повторно используемые навыки агента) и `azure.ai.connections` (соединения Foundry) добавлены в таблицу расширений и шпаргалку
- **⏱️ Рекомендации по времени отклика** — примеры `azd ai agent invoke` теперь указывают, что выводится общая задержка и время до первого байта
- **📌 Баннер версии** в главном README указывает обучающимся на `azd version` и `azd upgrade`

#### Изменено
- **✅ Обновлена базовая линия валидации** с `azd 1.23.12` (март 2026) на `azd 1.25.6` (июнь 2026) во всех главных README и документации по воркшопу
- **🤖 Обновлена заметка о расширении главы 2** с `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Обновлен пример валидации воркшопа** (вывод `azd version`) до `1.25.6`
- **🧭 Обновлен README "Что нового в azd сегодня"** для освещения полного жизненного цикла агента, новых расширений ИИ и последних улучшений удобства (`azd init` идемпотентность, `azd auth login` очистка устаревших токенов, `azd tool` приветственное приглашение)
- **📖 Обновлен agents.md главы 2 (Опция 4)** теперь направляет обучающихся к командам жизненного цикла после развертывания, а не останавливается на `azd up`

#### Исправлено
- **🏷️ Название продукта** — добавлена заметка о ребрендинге Aspire (".NET Aspire" теперь просто "Aspire"); поддержка azd Aspire не изменена
- **🔎 Подтверждена степень соответствия живого релиза** через Azure Developer CLI release feed: стабильная версия CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Обновленные файлы
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

#### Уточнение для новичков, Проверка настроек и Финальная очистка команд AZD
**Эта версия следует за проверкой AZD 1.23: проведена первоочередная документация для новичков: уточнены рекомендации по аутентификации AZD, добавлены скрипты локальной проверки настроек, проверены ключевые команды в живом CLI AZD, удалены последние устаревшие ссылки на команды на английском вне журнала изменений.**

#### Добавлено
- **🧪 Скрипты проверки настроек для новичков** с `validate-setup.ps1` и `validate-setup.sh`, чтобы обучающиеся могли подтвердить необходимые инструменты до начала главы 1
- **✅ Шаги ранней проверки настроек** в главном README и README главы 1, чтобы отсутствующие предварительные условия выявлялись до `azd up`

#### Изменено
- **🔐 Руководство по аутентификации для новичков** теперь последовательно рассматривает `azd auth login` как основной путь для рабочих процессов AZD, при этом `az login` отмечается как опциональный, если напрямую используются команды Azure CLI
- **📚 Поток ознакомления в главе 1** теперь направляет обучающихся проверить локальные настройки перед установкой, аутентификацией и первыми шагами развертывания
- **🛠️ Сообщения валидатора** теперь четко отделяют блокирующие требования от необязательных предупреждений Azure CLI для пути новичка с использованием только AZD
- **📖 Документация по конфигурации, устранению неисправностей и примерам** теперь различает обязательную аутентификацию AZD и необязательный вход Azure CLI, где ранее они подавались без контекста

#### Исправлено
- **📋 Оставшиеся английские ссылки на команды** обновлены до текущих форм AZD, включая `azd config show` в шпаргалке и `azd monitor --overview` там, где предполагалась информация по Azure Portal
- **🧭 Заявления новичков в главе 1** смягчены, чтобы не обещать гарантированное отсутствие ошибок или откат по всем шаблонам и ресурсам Azure
- **🔎 Подтверждена поддержка CLI в живом режиме** для `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

#### Обновленные файлы
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

#### Проверка AZD 1.23.12, Расширение среды воркшопа и Обновление модели ИИ
**Эта версия выполняет проход проверки документации против `azd` `1.23.12`, обновляет устаревшие примеры команд AZD, обновляет рекомендации по модели ИИ к текущим настройкам по умолчанию и расширяет инструкции воркшопа, выходя за рамки GitHub Codespaces, теперь поддерживая контейнеры для разработки и локальные клоны.**

#### Добавлено
- **✅ Примечания по валидации в основных главах и документации по воркшопу** чтобы сделать базовый тестируемый уровень AZD явным для обучающихся, использующих новые или старые сборки CLI
- **⏱️ Рекомендации по таймауту развертывания** для длительных развертываний AI-приложений с использованием `azd deploy --timeout 1800`
- **🔎 Шаги инспекции расширений** с `azd extension show azure.ai.agents` в документации по рабочему процессу ИИ
- **🌐 Расширенные рекомендации по воркшопу** охватывающие GitHub Codespaces, dev контейнеры и локальные клонирования c MkDocs

#### Изменено
- **📚 Вводные README глав** теперь последовательно указывают проверку на `azd 1.23.12` во всех разделах по основам, конфигурации, инфраструктуре, мультиагентности, предпродажным и производственным этапам, а также разделам устранения неполадок
- **🛠️ Ссылки на команды AZD** обновлены до текущих форм по всей документации:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимости от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, где предполагается обзор Application Insights
- **🧪 Примеры создания предварительного просмотра** упрощены до текущих поддерживаемых вариантов, таких как `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Поток воркшопа** обновлен, чтобы обучающиеся могли выполнять лаборатории в Codespaces, dev контейнере или локальном клоне, а не только в Codespaces
- **🔐 Рекомендации по аутентификации** теперь отдают предпочтение `azd auth login` для рабочих процессов AZD, при этом `az login` считается опциональным при прямом использовании команд Azure CLI

#### Исправлено
- **🪟 Команды установки Windows** нормализованы с текущим регистром пакета `winget` в руководстве по установке
- **🐧 Руководство по установке на Linux** исправлено — убраны неподдерживаемые специфичные для дистрибутива инструкции к менеджерам пакетов `azd`, вместо этого указаны соответствующие релизные пакеты
- **📦 Примеры моделей ИИ** обновлены с устаревших по умолчанию, таких как `gpt-35-turbo` и `text-embedding-ada-002`, на текущие, включая `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Примеры развертывания и диагностики** исправлены для использования текущих команд среды и статуса в журналах, скриптах и шагах устранения неполадок
- **⚙️ Руководство по GitHub Actions** обновлено с `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Руководство по согласию MCP/Copilot** обновлено с `azd mcp consent` на `azd copilot consent list`

#### Улучшено
- **🧠 Рекомендации по главе ИИ** теперь лучше объясняют поведение чувствительных к предварительному просмотру `azd ai`, вход с конкретной учетной записью арендатора, текущее использование расширений и обновленные рекомендации по развертыванию моделей
- **🧪 Инструкции воркшопа** теперь используют более реалистичные примеры версий и ясный язык настройки среды для практических лабораторий
- **📈 Документация по производству и устранению неисправностей** теперь лучше соответствует текущим примерам мониторинга, резервной модели и уровней затрат

#### Обновленные файлы
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

#### Команды AZD AI CLI, Проверка контента и Расширение шаблонов
**В этой версии добавлено покрытие команд `azd ai`, `azd extension` и `azd mcp` во всех главах, связанных с ИИ, исправлены сломанные ссылки и устаревший код в agents.md, обновлена шпаргалка и полностью переработан раздел Примерных шаблонов с проверенными описаниями и новыми шаблонами Azure AI AZD.**

#### Добавлено
- **🤖 Покрытие AZD AI CLI** в 7 файлах (ранее только в главе 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Новый раздел "Расширения и команды ИИ", включающий `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опция 4: `azd ai agent init` с таблицей сравнения (шаблон против подхода манифеста)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подразделы "Расширения AZD для Foundry" и "Развертывание с приоритетом агента"
  - `docs/chapter-05-multi-agent/README.md` — Быстрый старт теперь показывает оба пути развертывания: шаблон и манифест
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Раздел развертывания теперь включает опцию `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подраздел "Команды расширения AZD AI для диагностики"
  - `resources/cheat-sheet.md` — Новый раздел "Команды ИИ и расширений" с `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Новые примерные шаблоны AZD AI** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-чат с Blazor WebAssembly, Semantic Kernel и поддержкой голосового чата
  - **azure-search-openai-demo-java** — Java RAG-чат с использованием Langchain4J с вариантами развертывания ACA/AKS
  - **contoso-creative-writer** — Мультииагентское приложение творческого письма с использованием Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Серверлесс RAG с использованием Azure Functions + LangChain.js + Cosmos DB с поддержкой локальной разработки Ollama
  - **chat-with-your-data-solution-accelerator** — Корпоративный RAG-ускоритель с порталом администратора, интеграцией Teams и опциями PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Опорное приложение для оркестрации с несколькими агентами MCP на серверах .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимальный стартовый шаблон инфраструктуры Azure AI на Bicep
  - **🔗 Ссылка на потрясающую галерею AZD AI** — Ссылка на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (более 80 шаблонов)

#### Исправлено
- **🔗 навигация agents.md**: Ссылки "Предыдущая/Следующая" теперь соответствуют порядку уроков из README главы 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 битые ссылки в agents.md**: `production-ai-practices.md` исправлена на `../chapter-08-production/production-ai-practices.md` (3 вхождения)
- **📦 устаревший код в agents.md**: Заменено `opencensus` на `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 недействительный API в agents.md**: Перемещено `max_tokens` из `create_agent()` в `create_run()` как `max_completion_tokens`
- **🔢 подсчет токенов в agents.md**: Заменена грубая оценка `len//4` на `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправлены сервисы с "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (по умолчанию хост изменен с октября 2024)
- **contoso-chat**: Обновлено описание с упоминанием Azure AI Foundry + Prompty, соответствующее фактическому названию и стэку репозитория

#### Удалено
- **ai-document-processing**: Удалена неработающая ссылка на шаблон (репозиторий недоступен публично как AZD шаблон)

#### Улучшено
- **📝 упражнения в agents.md**: Упражнение 1 теперь показывает ожидаемый вывод и шаг `azd monitor`; Упражнение 2 включает полный код регистрации `FunctionTool`; Упражнение 3 заменяет расплывчатые инструкции на конкретные команды `prepdocs.py`
- **📚 ресурсы в agents.md**: Обновлены ссылки на текущую документацию Azure AI Agent Service и быстрый старт
- **📋 таблица следующих шагов в agents.md**: Добавлена ссылка на AI Workshop Lab для полного охвата главы

#### Обновленные файлы
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
**Эта версия улучшает навигацию по главам README.md с помощью расширенного формата таблицы.**

#### Изменено
- **Таблица карты курса**: Улучшена с добавлением прямых ссылок на уроки, оценок длительности и сложности
- **Очистка папок**: Удалены избыточные старые папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Проверка ссылок**: Проверены все 21+ внутренних ссылок в таблице карты курса

### [v3.16.0] - 2026-02-05

#### Обновления названий продуктов
**Эта версия обновляет упоминания продуктов согласно текущему брендингу Microsoft.**

#### Изменено
- **Microsoft Foundry → Microsoft Foundry**: Все упоминания обновлены в не переводимых файлах
- **Azure AI Agent Service → Foundry Agents**: Название сервиса обновлено с учетом текущего брендинга

#### Обновленные файлы
- `README.md` - Главная страница курса
- `changelog.md` - История версий
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Руководство по AI агентам
- `examples/README.md` - Документация с примерами
- `workshop/README.md` - Страница запуска мастерской
- `workshop/docs/index.md` - Индекс мастерской
- `workshop/docs/instructions/*.md` - Все файлы инструкций мастерской

---

### [v3.15.0] - 2026-02-05

#### Крупная реструктуризация репозитория: папки с номерами глав
**Эта версия реструктурирует документацию в папки для каждой главы для более удобной навигации.**

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
| Все файлы pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Все файлы troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Добавлено
- **📚 README файлы глав**: Созданы README.md в каждой папке главы с:
  - Целями обучения и длительностью
  - Таблицей уроков с описаниями
  - Командами быстрого старта
  - Навигацией по другим главам

#### Изменено
- **🔗 Обновлены все внутренние ссылки**: Обновлено более 78 путей во всех документах
- **🗺️ Главный README.md**: Обновлена карта курса с новой структурой глав
- **📝 examples/README.md**: Обновлены перекрестные ссылки на папки глав

#### Удалено
- Старая структура папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризация репозитория: навигация по главам
**В этой версии добавлены README файлы навигации по главам (заменены версией v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новое руководство по AI агентам
**Эта версия добавляет полное руководство по развертыванию AI агентов с помощью Azure Developer CLI.**

#### Добавлено
- **🤖 docs/microsoft-foundry/agents.md**: Полное руководство, охватывающее:
  - Что такое AI агенты и чем они отличаются от чатботов
  - Три шаблона для быстрого старта агентов (Foundry Agents, Prompty, RAG)
  - Архитектурные паттерны агентов (одиночный агент, RAG, мультиагент)
  - Конфигурация и настройка инструментов
  - Мониторинг и отслеживание метрик
  - Вопросы стоимости и оптимизации
  - Частые сценарии устранения неполадок
  - Три практических упражнения с критериями успеха

#### Структура содержимого
- **Введение**: Концепции агентов для начинающих
- **Быстрый старт**: Развертывание агентов с помощью `azd init --template get-started-with-ai-agents`
- **Архитектурные паттерны**: Визуальные диаграммы паттернов агентов
- **Конфигурация**: Настройка инструментов и переменных среды
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Пошаговое практическое обучение (20-45 минут каждое)

---

### [v3.12.0] - 2026-02-05

#### Обновление среды DevContainer
**Эта версия обновляет конфигурацию контейнера разработки современными инструментами и улучшенными настройками по умолчанию для опыта обучения AZD.**

#### Изменено
- **🐳 Базовый образ**: Обновлен с `python:3.12-bullseye` на `python:3.12-bookworm` (последний стабильный Debian)
- **📛 Имя контейнера**: Переименован с "Python 3" в "AZD для начинающих" для ясности

#### Добавлено
- **🔧 Новые функции Dev Container**:
  - `azure-cli` с поддержкой Bicep
  - `node:20` (LTS версия для AZD шаблонов)
  - `github-cli` для управления шаблонами
  - `docker-in-docker` для развертывания контейнерных приложений

- **🔌 Проброс портов**: Преднастройка портов для распространенной разработки:
  - 8000 (предпросмотр MkDocs)
  - 3000 (веб-приложения)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Новые расширения VS Code**:
  - `ms-python.vscode-pylance` - Улучшенный Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Поддержка Azure Functions
  - `ms-azuretools.vscode-docker` - Поддержка Docker
  - `ms-azuretools.vscode-bicep` - Поддержка языка Bicep
  - `ms-azure-devtools.azure-resource-groups` - Управление ресурсами Azure
  - `yzhang.markdown-all-in-one` - Редактирование Markdown
  - `DavidAnson.vscode-markdownlint` - Линтинг Markdown
  - `bierner.markdown-mermaid` - Поддержка схем Mermaid
  - `redhat.vscode-yaml` - Поддержка YAML (для azure.yaml)
  - `eamodio.gitlens` - Визуализация Git
  - `mhutchie.git-graph` - История Git

- **⚙️ Настройки VS Code**: Добавлены настройки по умолчанию для интерпретатора Python, форматирования по сохранению и обрезки пробелов

- **📦 Обновлен requirements-dev.txt**:
  - Добавлен плагин минификации MkDocs
  - Добавлен pre-commit для обеспечения качества кода
  - Добавлены пакеты Azure SDK (azure-identity, azure-mgmt-resource)

#### Исправлено
- **Команда после создания**: Теперь проверяет установку AZD и Azure CLI при запуске контейнера

---

### [v3.11.0] - 2026-02-05

#### Полное обновление README для начинающих
**Эта версия значительно улучшает README.md, делая его более доступным для новичков, и добавляет важные ресурсы для разработчиков AI.**

#### Добавлено
- **🆚 Сравнение Azure CLI и AZD**: Четкое объяснение когда использовать каждый инструмент с практическими примерами
- **🌟 Ссылки на потрясающий AZD**: Прямые ссылки на галерею шаблонов сообщества и ресурсы по вкладу:
  - [Amazing AZD Gallery](https://azure.github.io/awesome-azd/) - более 200 готовых для развертывания шаблонов
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Вклад сообщества
- **🎯 Руководство быстрого старта**: Упрощенное руководство из 3 шагов (Установка → Вход → Развертывание)
- **📊 Таблица навигации, основанной на опыте**: Четкая рекомендация с чего начинать в зависимости от уровня разработчика

#### Изменено
- **Структура README**: Реорганизована для постепенного раскрытия — сперва ключевая информация
- **Секция введения**: Переписана для объяснения "Магии `azd up`" для абсолютных новичков
- **Удален дублирующийся контент**: Устранено дублирование раздела устранения неполадок
- **Команды устранения неполадок**: Исправлена ссылка `azd logs` на использование действительного `azd monitor --logs`

#### Исправлено
- **🔐 Команды аутентификации**: Добавлены `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Недействительные ссылки на команды**: Удалены оставшиеся `azd logs` из раздела устранения неполадок README

#### Примечания
- **Область применения**: Изменения применены в основном README.md и resources/cheat-sheet.md
- **Целевая аудитория**: Улучшения ориентированы на разработчиков, новичков в AZD

---

### [v3.10.0] - 2026-02-05

#### Обновление точности команд Azure Developer CLI
**В этой версии исправлены отсутствующие команды AZD во всей документации, чтобы все примеры кода использовали корректный синтаксис Azure Developer CLI.**

#### Исправлено
- **🔧 Удалены несуществующие команды AZD**: Проведен полный аудит и исправление недействительных команд:
  - `azd logs` (не существует) → заменена на `azd monitor --logs` или альтернативы Azure CLI
  - Подкоманды `azd service` (не существуют) → заменены на `azd show` и Azure CLI
  - `azd infra import/export/validate` (не существуют) → удалены или заменены на действительные альтернативы
  - Флаги `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не существуют) → удалены
  - Флаги `azd provision --what-if/--rollback` (не существуют) → обновлены для использования `--preview`
  - `azd config validate` (не существует) → заменена на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не существуют) → удалены

- **📚 Обновленные файлы с исправлениями команд**:
  - `resources/cheat-sheet.md`: Крупное обновление справочника команд
  - `docs/deployment/deployment-guide.md`: Исправлены стратегии отката и развертывания
  - `docs/troubleshooting/debugging.md`: Исправлены разделы анализа журналов
  - `docs/troubleshooting/common-issues.md`: Обновлены команды устранения неполадок
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправлен раздел отладки AZD
  - `docs/getting-started/azd-basics.md`: Исправлены команды мониторинга
  - `docs/getting-started/first-project.md`: Обновлены примеры мониторинга и отладки
  - `docs/getting-started/installation.md`: Исправлены примеры помощи и версий
  - `docs/pre-deployment/application-insights.md`: Исправлены команды просмотра логов
  - `docs/pre-deployment/coordination-patterns.md`: Исправлены команды отладки агента

- **📝 Обновление ссылки на версию**: 
  - `docs/getting-started/installation.md`: Изменена жестко заданная версия `1.5.0` на универсальную `1.x.x` со ссылкой на релизы

#### Изменено
- **Стратегии отката**: Обновлена документация с использованием отката на основе Git (в AZD нет встроенного отката)
- **Просмотр логов**: Заменены ссылки на `azd logs` на `azd monitor --logs`, `azd monitor --live` и команды Azure CLI
- **Раздел производительности**: Удалены несуществующие флаги параллельного/инкрементального развертывания, предложены допустимые альтернативы

#### Технические подробности
- **Допустимые команды AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Допустимые флаги azd monitor**: `--live`, `--logs`, `--overview`
- **Удалённые функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Примечания
- **Проверка**: Команды проверены на соответствие Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершение мастерской и обновление качества документации
**Эта версия завершает интерактивные модули мастерской, исправляет все сломанные ссылки в документации и повышает общее качество контента для AI-разработчиков, использующих Microsoft AZD.**

#### Добавлено
- **📝 CONTRIBUTING.md**: Новый документ с руководством по внесению изменений:
  - Чёткие инструкции по сообщению об ошибках и предложениям изменений
  - Стандарты документации для нового контента
  - Руководства по примерам кода и соглашения по сообщениям коммитов
  - Информация о взаимодействии с сообществом

#### Завершено
- **🎯 Модуль мастерской 7 (Завершение)**: Полностью завершённый модуль с:
  - Всесторонним резюме выполненной работы
  - Разделом освоенных ключевых концепций AZD, шаблонов и Microsoft Foundry
  - Рекомендациями по продолжению обучения
  - Упражнениями с оценкой сложности
  - Ссылками на отзывы сообщества и поддержку

- **📚 Модуль мастерской 3 (Декомпозиция)**: Обновлены учебные цели с:
  - Инструкциями по активации GitHub Copilot с серверами MCP
  - Пониманием структуры папок шаблонов AZD
  - Паттернами организации инфраструктуры как кода (Bicep)
  - Инструкциями для практических занятий

- **🔧 Модуль мастерской 6 (Разборка)**: Завершён с:
  - Целями по очистке ресурсов и управлению затратами
  - Использованием `azd down` для безопасного деактивирования инфраструктуры
  - Руководством по восстановлению удалённых когнитивных сервисов
  - Бонусными заданиями для GitHub Copilot и портала Azure

#### Исправлено
- **🔗 Исправление сломанных ссылок**: Решено более 15 сломанных внутренних ссылок:
  - `docs/ai-foundry/ai-model-deployment.md`: Исправлены пути к microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Скорректированы пути ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменён несуществующий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Исправлены пути к часто задаваемым вопросам и руководству по устранению неполадок
  - `examples/container-app/microservices/README.md`: Исправлены пути к домашней странице курса и руководству по развертыванию
  - `resources/faq.md` и `resources/glossary.md`: Обновлены ссылки на разделы ИИ
  - `course-outline.md`: Исправлены ссылки на руководство инструктора и лабораторные работы по ИИ

- **📅 Баннер статуса мастерской**: Обновлен статус с "В разработке" на активный с датой февраля 2026 года

- **🔗 Навигация по мастерской**: Исправлены сломанные ссылки навигации в README.md, указывающие на несуществующую папку lab-1-azd-basics

#### Изменено
- **Презентация мастерской**: Убрано предупреждение "в разработке", мастерская теперь завершена и готова к использованию
- **Согласованность навигации**: Обеспечена корректная межмодульная навигация для всех модулей мастерской
- **Ссылки на учебный путь**: Обновлены перекрёстные ссылки на корректные пути microsoft-foundry

#### Проверено
- ✅ Все английские markdown-файлы имеют валидные внутренние ссылки
- ✅ Модули мастерской 0-7 завершены с учебными целями
- ✅ Навигация между главами и модулями работает корректно
- ✅ Контент подходит для AI-разработчиков, использующих Microsoft AZD
- ✅ Сохранён дружелюбный для начинающих язык и структура
- ✅ CONTRIBUTING.md содержит чёткие рекомендации для участников сообщества

#### Техническая реализация
- **Проверка ссылок**: Автоматизированный скрипт PowerShell проверил все внутренние ссылки .md
- **Аудит контента**: Ручная проверка полноты мастерской и пригодности для начинающих
- **Система навигации**: Применены единообразные паттерны навигации глав и модулей

#### Примечания
- **Область применения**: Изменения применены только к английской документации
- **Переводы**: Папки переводов в этой версии не обновлены (автоматический перевод синхронизируется позже)
- **Длительность мастерской**: Полная мастерская теперь предлагает 3-4 часа практического обучения

---

### [v3.8.0] - 2025-11-19

#### Продвинутая документация: мониторинг, безопасность и паттерны мультиагентности
**В этой версии добавлены всеобъемлющие уроки высшего уровня по интеграции Application Insights, паттернам аутентификации и координации мультиагентов для продакшн-развёртываний.**

#### Добавлено
- **📊 Урок интеграции Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Развёртывание, ориентированное на AZD, с автоматическим обеспечением ресурсов
  - Полные Bicep-шаблоны для Application Insights и Log Analytics
  - Рабочие Python-приложения с пользовательской телеметрией (более 1200 строк)
  - Паттерны мониторинга AI/LLM (отслеживание токенов/стоимости Microsoft Foundry Models)
  - 6 диаграмм Mermaid (архитектура, распределённый трассинг, поток телеметрии)
  - 3 практических упражнения (оповещения, панели мониторинга, мониторинг AI)
  - Примеры запросов Kusto и стратегии оптимизации затрат
  - Потоковые метрики в реальном времени и отладка
  - Время обучения 40-50 минут с продакшн-готовыми паттернами

- **🔐 Урок по аутентификации и безопасности**: в `docs/getting-started/authsecurity.md`:
  - 3 паттерна аутентификации (строки подключения, Key Vault, управляемая идентичность)
  - Полные шаблоны инфраструктуры Bicep для безопасных развёртываний
  - Код Node.js с интеграцией Azure SDK
  - 3 комплексных упражнения (включение управляемой и пользовательской идентичности, ротация Key Vault)
  - Лучшие практики безопасности и настройки RBAC
  - Руководство по устранению неполадок и анализ затрат
  - Готовые к продакшн паттерны беспарольной аутентификации

- **🤖 Урок по паттернам координации мультиагентов**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 паттернов координации (последовательный, параллельный, иерархический, событийный, консенсус)
  - Полная реализация сервиса оркестратора (Python/Flask, более 1500 строк)
  - 3 специализированных реализации агентов (Исследователь, Писатель, Редактор)
  - Интеграция Service Bus для очередей сообщений
  - Управление состоянием через Cosmos DB для распределённых систем
  - 6 диаграмм Mermaid, показывающих взаимодействия агентов
  - 3 продвинутых упражнения (обработка тайм-аутов, логика повторов, автоматический отключатель)
  - Разбивка затрат ($240-565/мес) с оптимизационными стратегиями
  - Интеграция Application Insights для мониторинга

#### Улучшено
- **Глава перед развертыванием**: Добавлены полные паттерны мониторинга и координации
- **Глава для начинающих**: Улучшена профессиональными паттернами аутентификации
- **Готовность к продакшну**: Полное покрытие от безопасности до наблюдаемости
- **Оглавление курса**: Обновлено с ссылками на новые уроки в главах 3 и 6

#### Изменено
- **Прогресс обучения**: Улучшенная интеграция безопасности и мониторинга по всему курсу
- **Качество документации**: Последовательные стандарты высшего уровня (95-97%) в новых уроках
- **Продакшн-паттерны**: Полное сквозное покрытие для корпоративных развёртываний

#### Улучшено
- **Опыт разработчика**: Чёткий путь от разработки до мониторинга в продакшн
- **Стандарты безопасности**: Профессиональные паттерны аутентификации и управления секретами
- **Наблюдаемость**: Полная интеграция Application Insights с AZD
- **AI-рабочие нагрузки**: Специализированный мониторинг для Microsoft Foundry Models и мультиагентных систем

#### Проверено
- ✅ Все уроки содержат полный рабочий код (не фрагменты)
- ✅ Mermaid-диаграммы для визуального обучения (всего 19 по 3 урокам)
- ✅ Практические упражнения с проверкой (всего 9)
- ✅ Продакшн-шаблоны Bicep, разворачиваемые через `azd up`
- ✅ Анализ затрат и стратегии оптимизации
- ✅ Руководства по устранению проблем и лучшие практики
- ✅ Контрольные точки знаний с командами для верификации

#### Результаты оценки документации
- **docs/pre-deployment/application-insights.md**: - Всеобъемлющее руководство по мониторингу
- **docs/getting-started/authsecurity.md**: - Профессиональные паттерны безопасности
- **docs/pre-deployment/coordination-patterns.md**: - Продвинутые мультиагентные архитектуры
- **Общий новый контент**: - Последовательные стандарты высокого качества

#### Техническая реализация
- **Application Insights**: Log Analytics + пользовательская телеметрия + распределённый трассинг
- **Аутентификация**: Управляемая идентичность + Key Vault + паттерны RBAC
- **Мультиагентность**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Мониторинг**: Потоковые метрики + Kusto-запросы + оповещения + дашборды
- **Управление затратами**: Стратегии выборочного мониторинга, политики хранения, контроль бюджета

### [v3.7.0] - 2025-11-19

#### Улучшение качества документации и новый пример Microsoft Foundry Models
**Эта версия повышает качество документации по всему репозиторию и добавляет полный пример развёртывания Microsoft Foundry Models с интерфейсом чата gpt-4.1.**

#### Добавлено
- **🤖 Пример чата Microsoft Foundry Models**: Полное развёртывание gpt-4.1 с работоспособной реализацией в `examples/azure-openai-chat/`:
  - Полная инфраструктура Microsoft Foundry Models (развёртывание модели gpt-4.1)
  - Python-интерфейс командной строки с историей разговоров
  - Интеграция с Key Vault для безопасного хранения API-ключей
  - Отслеживание использования токенов и оценка стоимости
  - Ограничение скорости и обработка ошибок
  - Полное README с руководством по развёртыванию на 35-45 минут
  - 11 файлов, готовых для продакшн (Bicep-шаблоны, Python-приложение, конфигурация)
- **📚 Упражнения по документации**: Добавлены практические упражнения к руководству по настройке:
  - Упражнение 1: Конфигурация для нескольких окружений (15 минут)
  - Упражнение 2: Практика управления секретами (10 минут)
  - Чёткие критерии успеха и шаги проверки
- **✅ Проверка развертывания**: Добавлен раздел проверки в руководство по развертыванию:
  - Процедуры проверки состояния
  - Контрольный список критериев успеха
  - Ожидаемые выводы для всех команд развертывания
  - Быстрые рекомендации по устранению проблем

#### Улучшено
- **examples/README.md**: Обновлено до качества A (93%):
  - Добавлен azure-openai-chat во все соответствующие разделы
  - Обновлено количество локальных примеров с 3 до 4
  - Добавлено в таблицу примеров AI-приложений
  - Интегрировано в Quick Start для пользователей среднего уровня
  - Добавлено в раздел Microsoft Foundry Templates
  - Обновлены разделы матрицы сравнения и поиска технологий
- **Качество документации**: Улучшено с B+ (87%) до A- (92%) в папке docs:
  - Добавлены ожидаемые выводы для ключевых команд
  - Включены шаги проверки изменений конфигурации
  - Усилено практическое обучение с реальными упражнениями

#### Изменено
- **Прогресс обучения**: Улучшена интеграция AI-примеров для пользователей среднего уровня
- **Структура документации**: Более практические упражнения с чёткими результатами
- **Процесс проверки**: Добавлены явные критерии успеха для ключевых рабочих процессов

#### Улучшено
- **Опыт разработчика**: Развёртывание Microsoft Foundry Models теперь занимает 35-45 минут (вместо 60-90 для сложных альтернатив)
- **Прозрачность затрат**: Чёткая оценка стоимости ($50-200/месяц) примера Microsoft Foundry Models
- **Учебный путь**: AI-разработчики получают чёткую отправную точку с azure-openai-chat
- **Стандарты документации**: Последовательные ожидаемые выводы и шаги проверки

#### Проверено
- ✅ Пример Microsoft Foundry Models полностью функционален с `azd up`
- ✅ Все 11 файлов реализации синтаксически корректны
- ✅ Инструкции README соответствуют фактическому опыту развертывания
- ✅ Обновлены ссылки в документации в более чем 8 местах
- ✅ Индекс примеров точно отражает 4 локальных примера
- ✅ Отсутствуют дублирующиеся внешние ссылки в таблицах
- ✅ Все ссылки навигации корректны

#### Техническая реализация
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + паттерн Container Apps
- **Безопасность**: Готовность управляемой идентичности, секреты в Key Vault
- **Мониторинг**: Интеграция Application Insights
- **Управление затратами**: Отслеживание токенов и оптимизация использования
- **Развёртывание**: Одна команда `azd up` для полного развёртывания

### [v3.6.0] - 2025-11-19

#### Основное обновление: Примеры развертывания Container App
**В этой версии представлены всеобъемлющие, готовые к продакшн примеры развертывания контейнерных приложений с использованием Azure Developer CLI (AZD), с полной документацией и интеграцией в учебный путь.**

#### Добавлено
- **🚀 Примеры Container App**: Новые локальные примеры в `examples/container-app/`:
  - [Основное руководство](examples/container-app/README.md): Полный обзор контейнерных развертываний, быстрое начало, производство и расширенные паттерны
  - [Простой Flask API](../../examples/container-app/simple-flask-api): REST API для начинающих с масштабированием до нуля, проверками состояния, мониторингом и устранением неполадок
  - [Архитектура микросервисов](../../examples/container-app/microservices): Готовое к производству многосервисное развертывание (API Gateway, Продукт, Заказ, Пользователь, Уведомление), асинхронные сообщения, Service Bus, Cosmos DB, Azure SQL, распределённое трассирование, blue-green/canary deployment
- **Лучшие практики**: Безопасность, мониторинг, оптимизация затрат и рекомендации по CI/CD для контейнерных рабочих нагрузок
- **Примеры кода**: Полные `azure.yaml`, шаблоны Bicep и реализации сервисов на нескольких языках (Python, Node.js, C#, Go)
- **Тестирование и устранение неполадок**: Сценарии сквозного тестирования, команды мониторинга, руководства по устранению проблем

#### Изменено
- **README.md**: Обновлено для демонстрации и ссылок на новые примеры контейнерных приложений в разделе "Локальные примеры - Контейнерные приложения"
- **examples/README.md**: Обновлено для выделения примеров контейнерных приложений, добавления записей в матрицу сравнения и обновления ссылок на технологии/архитектуру
- **Утверждённый план курса и учебное руководство**: Обновлено с помощью ссылок на новые примеры контейнерных приложений и шаблоны развертывания в соответствующих главах

#### Проверено
- ✅ Все новые примеры развертываются с помощью `azd up` и соответствуют лучшим практикам
- ✅ Обновлены перекрёстные ссылки и навигация в документации
- ✅ Примеры охватывают сценарии от начального до продвинутого уровня, включая производственные микросервисы

#### Заметки
- **Область охвата**: Только английская документация и примеры
- **Следующие шаги**: Расширить дополнительными продвинутыми контейнерными шаблонами и автоматизацией CI/CD в будущих выпусках

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукта: Microsoft Foundry
**Эта версия реализует комплексное изменение названия продукта с "Microsoft Foundry" на "Microsoft Foundry" во всей английской документации, отражая официальный ребрендинг Microsoft.**

#### Изменено
- **🔄 Обновление названия продукта**: Полный ребрендинг с "Microsoft Foundry" на "Microsoft Foundry"
  - Обновлены все упоминания во всей английской документации в папке `docs/`
  - Переименована папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Переименован файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всего: обновлено 23 упоминания в 7 файлах документации

- **📁 Изменения структуры папок**:
  - `docs/ai-foundry/` переименована в `docs/microsoft-foundry/`
  - Все перекрёстные ссылки обновлены для отражения новой структуры папок
  - Навигационные ссылки проверены во всей документации

- **📄 Переименование файлов**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Все внутренние ссылки обновлены для новой структуры имен файлов

#### Обновлённые файлы
- **Документация глав** (7 файлов):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 обновления навигационных ссылок
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 обновления упоминаний названия продукта
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Уже использует Microsoft Foundry (из предыдущих обновлений)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 обновления ссылок (обзор, отзывы сообщества, документация)
  - `docs/getting-started/azd-basics.md` - 4 обновления перекрёстных ссылок
  - `docs/getting-started/first-project.md` - 2 обновления навигационных ссылок главы
  - `docs/getting-started/installation.md` - 2 обновления ссылок на следующую главу
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 обновления ссылок (навигация, сообщество Discord)
  - `docs/troubleshooting/common-issues.md` - 1 обновление навигационной ссылки
  - `docs/troubleshooting/debugging.md` - 1 обновление навигационной ссылки

- **Файлы структуры курса** (2 файла):
  - `README.md` - 17 обновлений ссылок (обзор курса, названия глав, раздел шаблонов, инсайты сообщества)
  - `course-outline.md` - 14 обновлений ссылок (обзор, цели обучения, ресурсы главы)

#### Проверено
- ✅ Нет оставшихся ссылок на папку "ai-foundry" в английской документации
- ✅ Нет оставшихся ссылок на название продукта "Microsoft Foundry" в английской документации
- ✅ Все навигационные ссылки работают с новой структурой папок
- ✅ Переименование файлов и папок завершено успешно
- ✅ Перекрёстные ссылки между главами проверены

#### Заметки
- **Область охвата**: Изменения применены только к английской документации в папке `docs/`
- **Переводы**: Папки переводов (`translations/`) не обновлялись в этой версии
- **Материалы воркшопа**: Материалы воркшопа (`workshop/`) не обновлялись в этой версии
- **Примеры**: Файлы примеров могут ещё содержать устаревшее именование (будет исправлено в будущих обновлениях)
- **Внешние ссылки**: Внешние URL и ссылки на репозиторий GitHub остались без изменений

#### Руководство по миграции для участников
Если у вас есть локальные ветки или документация, ссылающаяся на старую структуру:
1. Обновите ссылки на папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Обновите ссылки на файлы: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените название продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверьте, что все внутренние ссылки документации работают

---

### [v3.4.0] - 2025-10-24

#### Улучшения предварительного просмотра инфраструктуры и валидации
**В этой версии реализована всесторонняя поддержка новой функции предварительного просмотра Azure Developer CLI и улучшен пользовательский опыт воркшопа.**

#### Добавлено
- **🧪 Документация функции azd provision --preview**: Полное освещение новой возможности предварительного просмотра инфраструктуры
  - Справочник по командам и примеры использования в шпаргалке
  - Подробная интеграция в руководство по развертыванию с примерами и преимуществами
  - Интеграция предварительной проверки для более безопасной валидации развертывания
  - Обновления руководства по началу работы с акцентом на безопасность при развертывании
- **🚧 Баннер статуса воркшопа**: Профессиональный HTML-баннер, указывающий статус разработки воркшопа
  - Градиентный дизайн с индикаторами строительства для ясной коммуникации с пользователем
  - Метка времени последнего обновления для прозрачности
  - Адаптивный дизайн для мобильных устройств всех типов

#### Улучшено
- **Безопасность инфраструктуры**: Функция предварительного просмотра интегрирована во всю документацию по развертыванию
- **Предварительная проверка развертывания**: Автоматические скрипты теперь включают тестирование предварительного просмотра инфраструктуры
- **Рабочий процесс разработчика**: Обновлены последовательности команд для включения предварительного просмотра как лучшей практики
- **Опыт работы в воркшопе**: Ясное информирование пользователей о статусе разработки контента

#### Изменено
- **Лучшие практики развертывания**: Рекомендуется использовать сначала рабочий процесс с предварительным просмотром
- **Поток документации**: Валидация инфраструктуры перенесена на более ранний этап обучения
- **Презентация воркшопа**: Профессиональное информирование о статусе с чётким графиком разработки

#### Улучшено
- **Подход с приоритетом безопасности**: Теперь изменения в инфраструктуре можно проверить до развертывания
- **Сотрудничество команды**: Результаты предварительного просмотра можно делиться для обзора и утверждения
- **Осведомлённость о затратах**: Лучшее понимание стоимости ресурсов до их выделения
- **Снижение рисков**: Меньше сбоев развертывания благодаря предварительной валидации

#### Техническая реализация
- **Интеграция в несколько документов**: Функция предварительного просмотра задокументирована в 4 ключевых файлах
- **Шаблоны команд**: Единая синтаксис и примеры во всей документации
- **Интеграция лучших практик**: Предварительный просмотр включён в рабочие процессы валидации и скрипты
- **Визуальные индикаторы**: Ясная маркировка НОВЫХ функций для удобства обнаружения

#### Инфраструктура воркшопа
- **Коммуникация статуса**: Профессиональный HTML-баннер с градиентной стилизацией
- **Пользовательский опыт**: Чёткий статус разработки предотвращает путаницу
- **Профессиональная презентация**: Поддерживает авторитет репозитория и устанавливает ожидания
- **Прозрачность графика**: Отметка последнего обновления в октябре 2025 для подотчётности

### [v3.3.0] - 2025-09-24

#### Улучшенные материалы воркшопа и интерактивный опыт обучения
**В этой версии представлены комплексные материалы воркшопа с браузерным интерактивным руководством и структурированными путями обучения.**

#### Добавлено
- **🎥 Интерактивное руководство по воркшопу**: Браузерный опыт с возможностью предварительного просмотра MkDocs
- **📝 Структурированные инструкции воркшопа**: 7-шаговый путеводитель от ознакомления до настройки
  - 0-Введение: Обзор воркшопа и установка
  - 1-Выбор AI-шаблона: Поиск и выбор шаблона
  - 2-Валидация AI-шаблона: Процедуры развертывания и проверки
  - 3-Анализ AI-шаблона: Понимание архитектуры шаблона
  - 4-Настройка AI-шаблона: Конфигурация и кастомизация
  - 5-Кастомизация AI-шаблона: Продвинутые модификации и итерации
  - 6-Удаление инфраструктуры: Очистка и управление ресурсами
  - 7-Завершение: Итоги и следующие шаги
- **🛠️ Инструменты воркшопа**: Конфигурация MkDocs с темой Material для улучшенного опыта
- **🎯 Практический путь обучения**: Методология из 3 шагов (Ознакомление → Развертывание → Кастомизация)
- **📱 Интеграция GitHub Codespaces**: Бесшовная настройка среды разработки

#### Улучшено
- **Лаборатория AI воркшопа**: Расширена с 2-3 часами структурированного обучения
- **Документация воркшопа**: Профессиональная презентация с навигацией и визуальными подсказками
- **Прогресс обучения**: Чёткие пошаговые инструкции от выбора шаблона до развертывания в продакшн
- **Опыт разработчика**: Интегрированные инструменты для оптимизации рабочих процессов

#### Улучшено
- **Доступность**: Интерфейс в браузере с поиском, функцией копирования и переключением темы
- **Обучение в собственном темпе**: Гибкая структура воркшопа для разных скоростей обучения
- **Практическое применение**: Рекомендованные сценарии развертывания AI-шаблонов
- **Интеграция с сообществом**: Внедрение Discord для поддержки и взаимодействия

#### Особенности воркшопа
- **Встроенный поиск**: Быстрый поиск по ключевым словам и урокам
- **Копирование блоков кода**: Функция копирования при наведении для всех примеров кода
- **Переключение темы**: Поддержка светлой и тёмной темы для разных предпочтений
- **Визуальные материалы**: Скриншоты и диаграммы для лучшего понимания
- **Интеграция помощи**: Прямой доступ к Discord для поддержки сообщества

### [v3.2.0] - 2025-09-17

#### Крупная реструктуризация навигации и система обучения с разделением на главы
**В этой версии внедрена комплексная структура обучения по главам с улучшенной навигацией по всему репозиторию.**

#### Добавлено
- **📚 Система обучения по главам**: Переструктурирован весь курс в 8 прогрессивных глав
  - Глава 1: Основы и быстрое начало (⭐ - 30-45 минут)
  - Глава 2: Разработка с приоритетом AI (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и аутентификация (⭐⭐ - 45-60 минут)
  - Глава 4: Инфраструктура как код и развертывание (⭐⭐⭐ - 1-1,5 часа)
  - Глава 5: Многоагентные AI решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Предварительная проверка развертывания и планирование (⭐⭐ - 1 час)
  - Глава 7: Устранение неисправностей и отладка (⭐⭐ - 1-1,5 часа)
  - Глава 8: Производственные и корпоративные паттерны (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Всеобъемлющая навигационная система**: Унифицированные заголовки и подножия навигации во всей документации
- **🎯 Отслеживание прогресса**: Чеклист завершения курса и система проверки усвоения знаний
- **🗺️ Навигация по учебным путям**: Чёткие точки входа для различных уровней опыта и целей
- **🔗 Перекрёстная навигация**: Связанные главы и предварительные требования чётко связаны

#### Улучшено
- **Структура README**: Преобразована в структурированную обучающую платформу с организацией по главам
- **Навигация документации**: Каждая страница теперь включает контекст главы и рекомендации по прогрессу
- **Организация шаблонов**: Примеры и шаблоны соответствуют соответствующим главам обучения
- **Интеграция ресурсов**: Шпаргалки, FAQ и учебные руководства связаны с релевантными главами
- **Интеграция воркшопов**: Практические лаборатории соотносятся с несколькими учебными целями глав

#### Изменено
- **Прогресс обучения**: Перемещено с линейной документации на гибкое обучение по главам
- **Размещение конфигурации**: Перемещено руководство по конфигурации в главу 3 для лучшего учебного потока
- **Интеграция AI контента**: Улучшена интеграция AI-специфичного контента по всему курсу
- **Производственный контент**: Расширенные паттерны собраны в главе 8 для корпоративных учеников

#### Улучшено
- **Пользовательский опыт**: Чёткие «хлебные крошки» навигации и индикаторы прогресса по главам
- **Доступность**: Единообразные шаблоны навигации для упрощения прохождения курса
- **Профессиональная презентация**: Структура курса в университеском стиле, подходящая для академического и корпоративного обучения
- **Эффективность обучения**: Сокращено время на поиск релевантного контента за счёт улучшенной организации

#### Техническая реализация
- **Заголовки навигации**: Стандартизирована навигация по главам в более чем 40 файлах документации
- **Подножия навигации**: Единообразные рекомендации по прогрессу и индикаторы завершения глав
- **Перекрёстные ссылки**: Всеобъемлющая система внутренних ссылок, связывающая связанные понятия
- **Картирование глав**: Шаблоны и примеры чётко связаны с учебными целями

#### Улучшение учебного руководства
- **📚 Комплексные учебные цели**: Переструктурировано учебное руководство в соответствии с 8-главной системой
- **🎯 Оценка по главам**: Каждая глава включает конкретные учебные цели и практические упражнения
- **📋 Отслеживание прогресса**: Еженедельный график обучения с измеряемыми результатами и контрольными списками
- **❓ Вопросы для оценки**: Вопросы для проверки знаний по каждой главе с профессиональными результатами
- **🛠️ Практические упражнения**: Практические занятия с реальными сценариями развертывания и устранения неполадок
- **📊 Прогресс навыков**: Чёткое продвижение от базовых концепций к корпоративным паттернам с акцентом на карьерное развитие
- **🎓 Сертификационная система**: Профессиональные результаты развития и система признания в сообществе
- **⏱️ Управление временем**: Структурированный 10-недельный учебный план с проверкой ключевых этапов

### [v3.1.0] - 2025-09-17

#### Улучшенные многоагентные AI решения
**В этой версии улучшено многоагентное ритейл-решение с более понятным именованием агентов и расширенной документацией.**

#### Изменено
- **Терминология многопользовательских агентов**: Заменено "Cora agent" на "Customer agent" во всем решении для розничной торговли с многопользовательскими агентами для более ясного понимания
- **Архитектура агента**: Обновлена вся документация, ARM-шаблоны и примеры кода с использованием единой терминологии "Customer agent"
- **Примеры конфигурации**: Современные шаблоны конфигурации агента с обновленными соглашениями об именах
- **Последовательность в документации**: Обеспечено использование профессиональных, описательных имен агентов во всех ссылках

#### Улучшено
- **Пакет ARM-шаблонов**: Обновлен retail-multiagent-arm-template с упоминаниями Customer agent
- **Диаграммы архитектуры**: Обновлены диаграммы Mermaid с новым именованием агента
- **Примеры кода**: Классы Python и примеры реализации теперь используют имя CustomerAgent
- **Переменные окружения**: Все скрипты развертывания обновлены на конвенцию CUSTOMER_AGENT_NAME

#### Улучшено
- **Опыт разработчика**: Более ясные роли и обязанности агента в документации
- **Готовность к продакшену**: Лучшее соответствие корпоративным соглашениям об именах
- **Учебные материалы**: Более интуитивное именование агентов для образовательных целей
- **Удобство шаблонов**: Упрощено понимание функций агента и шаблонов развертывания

#### Технические детали
- Обновлены диаграммы Mermaid архитектуры с упоминаниями CustomerAgent
- Заменены имена класса CoraAgent на CustomerAgent в примерах Python
- Модифицированы JSON-конфигурации ARM-шаблонов с использованием типа агента "customer"
- Обновлены переменные окружения с CORA_AGENT_* на CUSTOMER_AGENT_*
- Обновлены все команды развертывания и конфигурации контейнеров

### [v3.0.0] - 2025-09-12

#### Крупные изменения - Фокус на AI-разработчиков и интеграция Microsoft Foundry
**Эта версия преобразует репозиторий в комплексный ресурс для изучения AI с интеграцией Microsoft Foundry.**

#### Добавлено
- **🤖 AI-ориентированный учебный путь**: Полная реструктуризация с приоритетом на AI-разработчиков и инженеров
- **Руководство по интеграции Microsoft Foundry**: Полная документация по подключению AZD к сервисам Microsoft Foundry
- **Шаблоны развертывания AI-моделей**: Подробное руководство по выбору моделей, настройке и стратегиям продакшен развертывания
- **Лабораторный AI-мастер-класс**: Практический семинар на 2-3 часа по преобразованию AI-приложений в решения, развертываемые через AZD
- **Лучшие практики продакшен AI**: Корпоративные шаблоны масштабирования, мониторинга и безопасности AI-работ
- **Руководство по устранению неполадок AI**: Комплексные инструкции по устранению проблем Microsoft Foundry Models, Cognitive Services и AI-развертывании
- **Галерея AI-шаблонов**: Избранная коллекция шаблонов Microsoft Foundry с рейтингом сложности
- **Материалы мастер-классов**: Полная структура мастер-классов с практическими лабораториями и справочными материалами

#### Улучшено
- **Структура README**: Ориентирована на AI-разработчиков с данными сообщества — 45% интерес со стороны Microsoft Foundry Discord
- **Учебные пути**: Специализированные маршруты для AI-разработчиков наряду с традиционными для студентов и инженеров DevOps
- **Рекомендации по шаблонам**: Включены AI-шаблоны, включая azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграция с сообществом**: Усилена поддержка сообщества Discord с AI-специализированными каналами и обсуждениями

#### Безопасность и готовность к продакшену
- **Шаблоны управляемых идентичностей**: AI-специфические настройки аутентификации и безопасности
- **Оптимизация затрат**: Отслеживание использования токенов и контроль бюджета на AI-работы
- **Мульти-региональное развертывание**: Стратегии глобального развертывания AI-приложений
- **Мониторинг производительности**: AI-специфические метрики и интеграция с Application Insights

#### Качество документации
- **Линейная структура курса**: Логический прогресс от новичка до продвинутых шаблонов AI-развертывания
- **Проверенные URL**: Все внешние ссылки на репозитории проверены и доступны
- **Полные ссылки**: Все внутренние ссылки в документации подтверждены и работоспособны
- **Готовность к продакшену**: Корпоративные шаблоны развертывания с реальными примерами

### [v2.0.0] - 2025-09-09

#### Крупные изменения - Реструктуризация репозитория и профессиональное улучшение
**Эта версия представляет собой значительную переработку структуры репозитория и презентации контента.**

#### Добавлено
- **Структурированная учебная система**: Все страницы документации теперь включают разделы Введение, Цели обучения и Результаты обучения
- **Система навигации**: Добавлены ссылки Предыдущий/Следующий урок на всей документации для упорядоченного обучения
- **Учебное руководство**: Полный study-guide.md с учебными целями, практическими упражнениями и материалами оценки
- **Профессиональное оформление**: Удалены все эмодзи для улучшения доступности и профессионального вида
- **Улучшенная структура контента**: Оптимизирована организация и последовательность учебных материалов

#### Изменено
- **Формат документации**: Все документы стандартизированы с единообразной учебно-ориентированной структурой
- **Поток навигации**: Внедрена логическая последовательность всех материалов обучения
- **Презентация контента**: Удалены декоративные элементы в пользу четкого и профессионального форматирования
- **Структура ссылок**: Обновлены все внутренние ссылки для поддержки новой навигационной системы

#### Улучшено
- **Доступность**: Удалены зависимости от эмодзи для лучшей совместимости с программами чтения с экрана
- **Профессиональный вид**: Чистая, академическая презентация, подходящая для корпоративного обучения
- **Опыт обучения**: Структурированный подход с четкими целями и результатами для каждого урока
- **Организация контента**: Лучший логический поток и связь между связанными темами

### [v1.0.0] - 2025-09-09

#### Первоначальный релиз - Комплексный репозиторий для изучения AZD

#### Добавлено
- **Основная структура документации**
  - Полный цикл руководств по началу работы
  - Полная документация по развертыванию и предоставлению ресурсов
  - Подробные ресурсы по устранению неполадок и отладке
  - Инструменты и процедуры проверки перед развертыванием

- **Модуль "Начало работы"**
  - Основы AZD: ключевые концепции и терминология
  - Руководство по установке: инструкции по установке для различных платформ
  - Руководство по конфигурации: настройка окружения и аутентификация
  - Учебник первого проекта: пошаговое практическое обучение

- **Модуль развертывания и предоставления ресурсов**
  - Руководство по развертыванию: полное описание рабочих процессов
  - Руководство по предоставлению инфраструктуры как кода с использованием Bicep
  - Лучшие практики для производственных развертываний
  - Шаблоны многосервисной архитектуры

- **Модуль проверки перед развертыванием**
  - Планирование ресурсов: проверка доступности ресурсов Azure
  - Выбор SKU: подробное руководство по уровням сервиса
  - Предварительные проверки: автоматизированные скрипты проверки (PowerShell и Bash)
  - Инструменты оценки затрат и планирования бюджета

- **Модуль устранения неполадок**
  - Распространённые проблемы: часто встречающиеся ошибки и их решения
  - Руководство по отладке: системные методики устранения неполадок
  - Продвинутые техники диагностики и инструменты
  - Мониторинг производительности и оптимизация

- **Ресурсы и ссылки**
  - Справочник команд: быстрый доступ к основным командам
  - Глоссарий: полный список терминов и аббревиатур
  - FAQ: детальные ответы на часто задаваемые вопросы
  - Внешние ссылки и сообщества

- **Примеры и шаблоны**
  - Пример простого веб-приложения
  - Шаблон развертывания статического сайта
  - Конфигурация контейнерных приложений
  - Шаблоны интеграции с базами данных
  - Примеры микросервисной архитектуры
  - Реализация бессерверных функций

#### Особенности
- **Поддержка нескольких платформ**: Руководства по установке и настройке для Windows, macOS и Linux
- **Разные уровни навыков**: Контент для студентов и профессиональных разработчиков
- **Практический подход**: Практические примеры и сценарии из реальной жизни
- **Всестороннее покрытие**: От базовых концепций до передовых корпоративных шаблонов
- **Подход с приоритетом безопасности**: Внедрение лучших практик по безопасности повсеместно
- **Оптимизация затрат**: Руководства по экономичной организации развертываний и управлению ресурсами

#### Качество документации
- **Подробные примеры кода**: Практические, проверенные образцы кода
- **Пошаговые инструкции**: Четкие и практические рекомендации
- **Полное управление ошибками**: Руководство по устранению типовых проблем
- **Внедрение лучших практик**: Отраслевые стандарты и рекомендации
- **Совместимость версий**: Актуальность с последними сервисами Azure и функциями azd

## Планируемые будущие улучшения

### Версия 3.1.0 (Планируется)
#### Расширение AI-платформы
- **Поддержка нескольких моделей**: Шаблоны интеграции для Hugging Face, Azure Machine Learning и пользовательских моделей
- **Фреймворки AI-агентов**: Шаблоны для развертывания LangChain, Semantic Kernel и AutoGen
- **Расширенные RAG-шаблоны**: Варианты векторных баз данных помимо Azure AI Search (Pinecone, Weaviate и др.)
- **AI-мониторинг**: Улучшенный мониторинг производительности моделей, использования токенов и качества ответов

#### Опыт разработчика
- **Расширение VS Code**: Интегрированный опыт разработки AZD + Microsoft Foundry
- **Интеграция GitHub Copilot**: AI-помощь в генерации AZD-шаблонов
- **Интерактивные уроки**: Практические кодинговые упражнения с автоматической проверкой для AI-сценариев
- **Видеоконтент**: Дополнительные видеоуроки для визуального обучения с фокусом на AI-развертывания

### Версия 4.0.0 (Планируется)
#### Корпоративные AI-шаблоны
- **Рамки управления**: Управление AI-моделями, соблюдение норм и аудит
- **Мультиарендность AI**: Шаблоны обслуживания нескольких клиентов с изолированными AI-сервисами
- **Развертывание AI на периферии**: Интеграция с Azure IoT Edge и контейнерными инстанциями
- **Гибридный облачный AI**: Мультиоблачные и гибридные шаблоны развертывания AI-работ

#### Продвинутые функции
- **Автоматизация AI-пайплайна**: Интеграция MLOps с пайплайнами Azure Machine Learning
- **Расширенная безопасность**: Шаблоны с нулевым доверием, приватные конечные точки и продвинутая защита от угроз
- **Оптимизация производительности**: Продвинутые стратегии настройки и масштабирования для AI-приложений с высокой пропускной способностью
- **Глобальное распределение**: Шаблоны доставки контента и edge-caching для AI-приложений

### Версия 3.0.0 (Планируется) - Заменена текущим релизом
#### Предложенные дополнения - Сейчас реализованы в v3.0.0
- ✅ **AI-ориентированный контент**: Полная интеграция Microsoft Foundry (Выполнено)
- ✅ **Интерактивные уроки**: Практический AI-лабораторный семинар (Выполнено)
- ✅ **Модуль продвинутой безопасности**: AI-специфические шаблоны безопасности (Выполнено)
- ✅ **Оптимизация производительности**: Стратегии настройки AI-работ (Выполнено)

### Версия 2.1.0 (Планируется) - Частично реализована в v3.0.0
#### Небольшие улучшения - Некоторые выполнены в текущем релизе
- ✅ **Дополнительные примеры**: AI-ориентированные сценарии развертывания (Выполнено)
- ✅ **Расширенное FAQ**: AI-специфические вопросы и устранение неполадок (Выполнено)
- **Интеграция инструментов**: Руководства по улучшенной интеграции IDE и редакторов
- ✅ **Расширение мониторинга**: AI-специфические шаблоны мониторинга и оповещений (Выполнено)

#### Все еще планируется для будущих релизов
- **Мобильная адаптация документации**: Адаптивный дизайн для мобильного обучения
- **Оффлайн доступ**: Загружаемые пакеты документации
- **Улучшенная интеграция IDE**: Расширение VS Code для потоков AZD + AI
- **Панель сообщества**: Метрики сообщества в реальном времени и отслеживание вклада

## Вклад в журнал изменений

### Отчет об изменениях
При внесении изменений в этот репозиторий, пожалуйста, убедитесь, что записи в журнале изменений включают:

1. **Номер версии**: В соответствии с семантическим версионированием (major.minor.patch)
2. **Дата**: Дата выпуска или обновления в формате ГГГГ-ММ-ДД
3. **Категория**: Добавлено, Изменено, Устарело, Удалено, Исправлено, Безопасность
4. **Четкое описание**: Краткое описание изменений
5. **Оценка влияния**: Как изменения влияют на существующих пользователей

### Категории изменений

#### Добавлено
- Новые функции, разделы документации или возможности
- Новые примеры, шаблоны или учебные ресурсы
- Дополнительные инструменты, скрипты или утилиты

#### Изменено
- Модификации существующего функционала или документации
- Обновления для улучшения ясности или точности
- Реструктуризация контента или организации

#### Устарело
- Функции или подходы, которые постепенно выводятся из использования
- Разделы документации, запланированные к удалению
- Методы с более подходящими альтернативами

#### Удалено
- Функции, документация или примеры, которые больше не актуальны
- Устаревшая информация или устаревшие подходы
- Избыточный или объединённый контент

#### Исправлено
- Исправления ошибок в документации или коде
- Решение зарегистрированных проблем
- Улучшения точности или функциональности

#### Безопасность
- Улучшения или исправления, связанные с безопасностью
- Обновления лучших практик безопасности
- Устранение уязвимостей безопасности

### Руководство по семантическому версионированию

#### Основная версия (X.0.0)
- Несовместимые изменения, требующие действий пользователя
- Значительная реструктуризация контента или организации
- Изменения, которые меняют фундаментальный подход или методологию

#### Минорная версия (X.Y.0)
- Новые функции или добавления контента
- Улучшения с обратной совместимостью
- Дополнительные примеры, инструменты или ресурсы

#### Патч-версия (X.Y.Z)
- Исправления ошибок
- Небольшие улучшения существующего контента
- Уточнения и мелкие дополнения

## Обратная связь и предложения от сообщества

Мы активно поощряем обратную связь от сообщества для улучшения этого учебного ресурса:

### Как оставить отзыв
- **GitHub Issues**: Сообщать о проблемах или предлагать улучшения (AI-специфические вопросы приветствуются)
- **Обсуждения Discord**: Делитесь идеями и участвуйте в сообществе Microsoft Foundry
- **Pull Requests**: Вносите прямые улучшения в контент, особенно AI-шаблоны и руководства
- **Microsoft Foundry Discord**: Участвуйте в канале #Azure для обсуждений AZD + AI
- **Форумы сообщества**: Участвуйте в более широких дискуссиях Azure-разработчиков

### Категории обратной связи
- **Точность AI-контента**: Исправления по интеграции AI-сервисов и информации о развертывании
- **Опыт обучения**: Предложения по улучшению процесса обучения AI-разработчиков
- **Отсутствующий AI-контент**: Запросы на дополнительные AI-шаблоны, паттерны или примеры
- **Доступность**: Улучшения для различных учебных потребностей
- **Интеграция AI-инструментов**: Предложения по улучшению рабочих процессов AI-разработки
- **Шаблоны продакшен AI**: Запросы на корпоративные шаблоны развертывания AI

### Обязательства по ответам
- **Ответы на проблемы**: В течение 48 часов на зарегистрированные проблемы
- **Запросы функций**: Рассмотрение в течение одной недели
- **Вклад сообщества**: Рассмотрение в течение одной недели
- **Безопасность**: Немедленный приоритет с ускоренным ответом

## График обслуживания

### Регулярные обновления
- **Ежемесячные проверки**: Точность контента и проверка ссылок
- **Квартальные обновления**: Крупные добавления и улучшения контента
- **Полугодовые проверки**: Комплексная реструктуризация и улучшения
- **Годовые релизы**: Основные обновления версий с существенными улучшениями

### Мониторинг и обеспечение качества
- **Автоматизированное тестирование**: Регулярная проверка примеров кода и ссылок
- **Интеграция отзывов сообщества**: Регулярное включение предложений пользователей
- **Обновления технологий**: Соответствие последним сервисам Azure и выпускам azd
- **Аудиты доступности**: Регулярный обзор принципов инклюзивного дизайна

## Политика поддержки версий

### Поддержка текущей версии
- **Последняя основная версия**: Полная поддержка с регулярными обновлениями
- **Предыдущая основная версия**: Обновления безопасности и критические исправления в течение 12 месяцев
- **Устаревшие версии**: Только поддержка сообщества, официальных обновлений нет

### Руководство по миграции
При выпуске основных версий мы предоставляем:
- **Руководства по миграции**: Пошаговые инструкции по переходу
- **Примечания по совместимости**: Подробности о критических изменениях
- **Инструменты поддержки**: Скрипты или утилиты для помощи при миграции
- **Поддержка сообщества**: Специализированные форумы для вопросов о миграции

---

**Навигация**
- **Предыдущий урок**: [Руководство по изучению](resources/study-guide.md)
- **Следующий урок**: Вернуться к [Основному README](README.md)

**Будьте в курсе**: Следите за этим репозиторием, чтобы получать уведомления о новых выпусках и важных обновлениях учебных материалов.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->