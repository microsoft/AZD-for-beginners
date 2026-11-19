# Журнал изменений - AZD для начинающих

## Введение

Этот журнал изменений документирует все значимые изменения, обновления и улучшения в репозитории AZD для начинающих. Мы придерживаемся принципов семантического версионирования и ведём этот журнал, чтобы помочь пользователям понять, что изменилось между версиями.

## Цели обучения

Изучая этот журнал изменений, вы будете:
- Оставаться в курсе новых функций и добавления контента
- Понимать улучшения, внесённые в существующую документацию
- Отслеживать исправления ошибок и корректировки для обеспечения точности
- Следить за эволюцией учебных материалов с течением времени

## Результаты обучения

После ознакомления с записями журнала изменений вы сможете:
- Определять новый контент и учебные ресурсы, доступные для изучения
- Понимать, какие разделы были обновлены или улучшены
- Планировать ваш учебный путь, основываясь на самых актуальных материалах
- Предоставлять обратную связь и предложения по будущим улучшениям

## История версий

### [v3.25.0] - 2026-11-09

#### Расширение Microsoft Foundry 1.0 теперь доступно для всех

Пакет `microsoft.foundry` 1.0 **запущен и доступен для всех**, как было объявлено [5 ноября 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Курс теперь обучает выпущенному GA-процессу, а не будущему релизу. Начинайте с AZD **1.37.0 или новее** и `azd ext install microsoft.foundry`.

#### В этом обновлении курса доступно
- Англоязычное руководство использует GA-пакет как стандартный путь установки и объясняет его семь независимых расширений с собственными версиями.
- [Обзор на хост-agent](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) охватывает исходный пример API ответов Python Agent Framework, текущую uv, Python 3.13+, выбор нового/существующего проекта, повторное использование модели и просмотр `azure.yaml`.
- Локальный переход к облачному процессу покрывает тестирование Agent Inspector, расходы на вызовы моделей, поддерживаемых Azure, удалённую сборку кода, развертывание вызовов, облачное трассирование, предварительный просмотр развертывания, логи и диагностику.
- Отдельное руководство по оценке охватывает генерацию и просмотр наборов данных/критериев, конфигурацию именованной оценки, регистрацию ресурсов и проверку результатов. Старые инструкции по оценке/оптимизации остались в истории миграции, не являясь текущим базовым релизом.
- Руководство Foundry CI/CD включает установку расширения runner, аутентифицированное развертывание, доступ к ресурсам оценки и явный quality gate.
- Руководство по очистке различает вновь созданные и повторно используемые проекты Foundry. Мастерская ссылается на отдельное упражнение GA без замены его специфичных тестов.
- Навигация курса, учебные цели, предпосылки установки, шпаргалка, FAQ и учебное руководство отражают процесс GA. Сгенерированные переводы не редактируются вручную.

#### Область обзора
- Основано на объявлении GA, связанной документации Microsoft Learn и конфигурации исходного примера. Живое Azure предоставление, развертывание, вызов модели или оценка не проводились.
- GA пакета не означает GA для каждой дополнительной функции, независимого расширения или SDK, а также не сертифицирует примеры для промышленного использования.

### [v3.24.0]- 2026-11-04

#### Исправлено
- Исправлена навигация курса на английском, перемещённые пути страниц, отсутствующие якоря и устаревшие внешние ссылки, включая ссылку в Главе 2 на руководство по продакшен AI.
- Пересмотрено текущее руководство по сравнению с опубликованными AZD 1.37.2, агентами 1.0.0-beta.23 и оценками 1.0.0-beta.2. Задокументирован отдельный `azd ai eval` процесс работы и миграция конфигурации оптимизации.
- Исправлены неподдерживаемые CLI-флаги, границы аутентификации, руководство по открытым средам/секретам, обновления инфраструктуры, конфигурация модели и примеры разрушительного восстановления.
- Обновлена мастерская в соответствии с текущим примером AI Agents, включая реальные хуки, входные данные конфигурации, тесты оценки, точки входа красного тестирования и наблюдаемости.
- Исправлены заявления об реализации примеров и устранены связанные проблемы с приложением/инфраструктурой/конфигурацией. Материалы по архитектуре розничной торговли чётко отделены от полного рабочего приложения.
- Восстановлена матрица языков CodeQL, выбран поддерживаемый Node.js 24 для dev-контейнера и добавлены валидаторы установки, сообщающие о неудачных командах версий.

#### Добавлено
- Англоязычный офлайн-проверщик ссылок/якорей, регрессионные тесты и документационный процесс, который также строит мастерскую в строгом режиме. Сгенерированные переводы и переведённые изображения исключены.

#### Область валидации
- Проверки исходного кода, синтаксиса, конфигурации, локального поведения и сетевых ссылок не устанавливают возможность живого развёртывания Azure, квоты, RBAC, региональную доступность моделей, биллинг, соблюдение безопасности или готовность к производству.
- Более старые записи ниже являются историческими записями, а не текущими командами или инструкциями релиза.

### [v3.23.0] - 2026-07-13

#### Обновление AZD 1.27.1: Обновление версии
**Эта версия повторно валидирует курс с использованием `azd` `1.27.1` (июль 2026, последний стабильный релиз) и текущего превью-расширения AI агента `azure.ai.agents` `1.0.0-beta.5`, обновляя все баннеры "проверено на" после релизов 1.26.0, 1.27.0 и 1.27.1.**

#### Изменено
- **✅ Обновлена базовая линия валидации** с `azd 1.25.6` (июнь 2026) на `azd 1.27.1` (июль 2026) для корневого README, всех README глав, урока с dev-контейнером в Главе 1 (включая примеры с фиксированными версиями), урока по пользовательским шаблонам в Главе 4, многоагентного урока в Главе 5 и документации мастерской
- **🤖 Обновлена базовая линия Главы 2** с `azd 1.23.12` (март 2026) на `azd 1.27.1` в `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; даты примечаний валидации обновлены на 2026-07-13
- **🧩 Версия AI агентного расширения увеличена** с `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до текущего релиза `1.0.0-beta.5` в README Главы 2 и `agents.md`
- **🧪 Обновлён пример валидации мастерской** (`azd version` вывод) до `1.27.1`

#### Заметки по релизам azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Поддержка Go для Azure Functions на Flex Consumption, фильтры `azd config sub-filter` на уровне арендатора, автономные пакеты расширений (`azd x pack --bundle`), и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделирование проектов/агентов Azure AI Foundry напрямую в `azure.yaml` (инициализация без Bicep/Terraform), поддержка контейнерного развертывания для App Service (`host: appservice` + `language: docker`), прямое `-s/--source` для `azd extension` команд и `azd tool uninstall`
- **1.27.1 (2026-07-09):** Флаг `--no-dependencies` для `azd extension install`, устаревшие модели по умолчанию исключены из каталога/подсказок квоты и несколько исправлений ошибок

#### Обновлённые файлы
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

#### Заполнение пробелов для начинающих #2: Создание шаблонов, Dev Containers, Pulumi, Azure DevOps, учетные записи службы и другое
**Эта версия закрывает оставшиеся промежуточные пробелы, выявленные анализом покрытия azd: как создавать и публиковать собственные шаблоны, воспроизводимые окружения dev-контейнеров/Codespaces, провайдер инфраструктуры Pulumi, обзор CI/CD с Azure DevOps, аутентификация учетных записей службы, руководство по выбору хоста (AKS/Spring Apps), объяснения `azd restore`/`azd package`, обработка ошибок хуков и практики командной/общей среды.**

#### Добавлено
- **🧱 Новый урок в Главе 4** `docs/chapter-04-infrastructure/custom-templates.md` — создание собственного шаблона azd: требуемая структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризация инфраструктуры с помощью `uniqueString()` ресурса и `azd-env-name` тега, локальное тестирование с `azd init --template <local-path>`, публикация на GitHub и подача в галерею Awesome AZD
- **📦 Новый урок в Главе 1** `docs/chapter-01-foundation/dev-containers.md` — воспроизводимые окружения azd с Dev Containers и GitHub Codespaces: минимальный `.devcontainer/devcontainer.json` с использованием официальной функции `ghcr.io/azure/azure-dev/azd`, особенности для конкретных языков, `docker-in-docker` для хостов контейнеров и `azd auth login --use-device-code` для удаленного входа
- **🧩 Раздел Pulumi с azd** в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: pulumi`, структура папок Pulumi, стеки, сопоставленные с окружениями azd, необходимые выходные данные/тегирование и идентичный рабочий процесс `azd up` / `azd down`
- **🎯 Руководство по выбору хоста** в `docs/chapter-04-infrastructure/provisioning.md` — дружественное к начинающим сравнение `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp` с рекомендациями, когда выбирать AKS или Azure Spring Apps
- **🛠️ Обзор CI/CD с Azure DevOps** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, подключение службы с федерацией идентичности нагрузки (OIDC), сгенерированный `azure-dev.yml` и настройка групп переменных
- **🔑 Учетные записи службы (паттерн 4)** добавлены в `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, неинтерактивная `azd auth login` с клиентским секретом vs. федеративными/OIDC учётными данными, когда использовать и безопасное хранение учётных данных
- **🪝 Подраздел обработки ошибок хуков** в `docs/chapter-04-infrastructure/deployment-guide.md` — коды выхода и `set -e`, `continueOnError`, тестирование хуков отдельно с `azd hooks run`, shell-окружения для ОС и `--debug`
- **👥 Раздел командных/общих сред** в `docs/chapter-03-configuration/configuration.md` — что хранить в `.azure/`, что игнорировать git, окружения для каждого разработчика, `azd env list`/`select` и предоставление значений окружения в CI/CD
- **🧰 `azd restore` и расширенные объяснения `azd package`** в `resources/cheat-sheet.md` — восстановление зависимостей и создание развертываемого артефакта без развертывания

#### Изменено
- **🧭 Таблица уроков Главы 4** обновлена для включения нового урока "Создание собственного шаблона" (Урок 3)
- **🧭 Таблица уроков Главы 1** обновлена для включения нового урока "Dev Containers и Codespaces" (Урок 5); навигационные футеры связаны между `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заполнение пробелов для начинающих: Практический урок по многоагентности, "принеси своё приложение", Terraform и обзор CI/CD
**Эта версия закрывает основные пробелы для полного руководства для начинающих, добавляя два новых практических урока (разворачиваемое многоагентное руководство и добавление azd к существующему приложению), дружественное к новичкам введение в хуки, раздел Terraform с azd, пошаговый обзор конвейера GitHub Actions, объяснения новых превью расширений и явный чеклист проверки развертывания.**

#### Добавлено
- **🤝 Новый урок в Главе 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — полностью практическое развертываемое руководство с двумя агентами (оркестратор + специалисты) с использованием реального шаблона (`contoso-creative-writer`), охватывающее когда использовать многоагентность, процесс `azd up`, понимание развернутых ресурсов, межагентное трассирование, кастомизацию и очистку
- **📦 Новый урок в Главе 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как добавить azd к существующему проекту с помощью `azd init` ("использовать код в текущей директории"), понимание `azure.yaml` и `infra/`, `azd infra generate`, обнаружение хоста и развертывание с `azd up`
- **🌐 Раздел Terraform с azd** добавлен в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, структура папок `.tf`, обязательные выходные данные `AZURE_*` и тегирование `azd-env-name`, а также идентичный рабочий процесс `azd up` / `azd down` (закрытие пробела, где поддержка Terraform утверждалась, но показывался только Bicep)
- **⚙️ Пошаговое руководство по GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от репозитория GitHub до автоматизированных развертываний: `azd pipeline config`, федеративные учетные данные OIDC (без хранения секретов), сгенерированный `azure-dev.yml` и рекомендации по секретам и переменным
- **🪝 Введение для новичков "Новые хуки?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — что такое хук, таблица этапов хуков, минимальный первый хук и запуск хуков вручную с помощью `azd hooks run`
- **✅ Чеклист "Проверьте ваше развертывание"** добавлен к Шагу 5 в `docs/chapter-01-foundation/first-project.md` — дымовое тестирование, проверка эндпоинта здоровья и явные критерии успешности
- **🧩 Объяснитель для новых preview-расширений** `azure.ai.skills` и `azure.ai.connections` (что это и когда их использовать) в `docs/chapter-08-production/production-ai-practices.md`

#### Изменено
- **🧭 Исправлена таблица уроков главы 5**: `multi-agent-basics.md` теперь это Урок 1 (единственный полностью практический урок), с точным указанием, что Урок 2 находится в Главе 6, а сценарий Retail — это архитектурный план, а не шаблон одной командой
- **🧭 Таблица уроков главы 1** теперь включает новый урок "Принеси свое приложение" (Урок 4)
- **🔗 Обновлены нижние колонтитулы навигации**: `first-project.md` теперь ссылается вперед на `bring-your-own-app.md`

#### Исправлено
- **🧱 Закрыт "заявленный, но отсутствующий" пробел Terraform** — ранее в курсе упоминалась поддержка Terraform без демонстрации
- **🔀 Исправлены вводящие в заблуждение кросс-ссылки главы 5**, которые создавали впечатление о полном многопользовательском внедрении, когда на самом деле был только архитектурный план

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

#### Обновление AZD 1.25.6, Полный жизненный цикл агентов & Ребрендинг Aspire
**Эта версия перепроверяет курс с версии `azd` `1.25.6` (июнь 2026) и расширением `azure.ai.agents` `0.1.40-preview`, расширяет ИИ-направления от "создания агента" до полного жизненного цикла агента (тест → оценка → оптимизация → инспекция → удаление), показывает новые preview-расширения `azure.ai.skills` и `azure.ai.connections` и отмечает ребрендинг продукта ".NET Aspire" → "Aspire".**

#### Добавлено
- **🔁 Полное покрытие жизненного цикла агента** для новичков и инженеров ИИ по документации:
  - `docs/chapter-01-foundation/azd-basics.md` — Таблица жизненного цикла (создание → тест → измерение → улучшение → инспекция → очистка) добавлена в раздел Расширений и ИИ-команд
  - `docs/chapter-08-production/production-ai-practices.md` — Новый раздел "Управление жизненным циклом агента", охватывающий `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Расширенные ИИ-команды агента с `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Документированы новые preview-расширения**: `azure.ai.skills` (многоразовые навыки агента) и `azure.ai.connections` (связи Foundry) добавлены в таблицу расширений и в шпаргалку
- **⏱️ Руководство по времени отклика** — примеры `azd ai agent invoke` теперь показывают общую задержку и время до первого байта
- **📌 Баннер версии** в корневом README, указывающий обучающимся на `azd version` и `azd upgrade`

#### Изменено
- **✅ Обновлена базовая линия валидации** с `azd 1.23.12` (март 2026) до `azd 1.25.6` (июнь 2026) во всех README глав и документации по мастерской
- **🤖 Обновлена заметка по расширению Главы 2** с `azure.ai.agents` `0.1.18-preview` на `0.1.40-preview`
- **🧪 Обновлен пример валидации мастерской** (вывод `azd version`) до `1.25.6`
- **🧭 Обновлен README "Что нового в azd сегодня"** для выделения полного жизненного цикла агента, новых ИИ-расширений и недавних улучшений качества жизни (`azd init` идемпотентность, `azd auth login` очистка устаревших токенов, `azd tool` приглашение при первом запуске)
- **📖 Глава 2 agents.md (Опция 4)** теперь направляет обучающихся на команды жизненного цикла после развертывания, а не останавливается на `azd up`

#### Исправлено
- **🏷️ Название продукта** — добавлено примечание о ребрендинге Aspire (".NET Aspire" теперь просто "Aspire"); поддержка Aspire в azd не изменилась
- **🔎 Проверка выпуска в реальном времени** подтверждена на основе выпуска Azure Developer CLI: стабильный CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Уточнение начальной настройки для новичков, проверка установки и очистка последних команд AZD
**Эта версия является продолжением проверки AZD 1.23 с акцентом на документацию для новичков: она уточняет рекомендации по аутентификации с AZD как первой точки, добавляет скрипты проверки локальной настройки, проверяет ключевые команды с помощью живого AZD CLI и убирает последние устаревшие ссылки на команды на английском вне файла изменений.**

#### Добавлено
- **🧪 Скрипты проверки настройки для новичков** с `validate-setup.ps1` и `validate-setup.sh`, чтобы обучающиеся могли подтвердить наличие требуемых инструментов перед началом работы с Главой 1
- **✅ Шаги предварительной проверки настройки** в корневом README и README Главы 1, чтобы отсутствующие предпосылки выявлялись до `azd up`

#### Изменено
- **🔐 Рекомендации по аутентификации для новичков** теперь последовательно рассматривают `azd auth login` как основной путь для рабочих процессов AZD, а `az login` выделен как опциональный, если напрямую не используются команды Azure CLI
- **📚 Поток начала работы в Главе 1** теперь направляет обучающихся верифицировать локальную настройку перед этапами установки, аутентификации и первого развертывания
- **🛠️ Сообщения валидатора** теперь ясно разделяют обязательные требования и необязательные предупреждения Azure CLI для пути новичков только с AZD
- **📖 Документация по конфигурации, устранению неполадок и примерам** теперь различает обязательную аутентификацию AZD и опциональный вход в Azure CLI, где ранее оба варианта подавались без контекста

#### Исправлено
- **📋 Оставшиеся ссылки на команды из английского источника** обновлены до актуальных форм AZD, включая `azd config show` в шпаргалке и `azd monitor --overview` там, где была предусмотрена информация по обзору портала Azure
- **🧭 Утверждения для новичков в Главе 1** смягчены, чтобы избежать чрезмерных обещаний гарантированной безошибочности или отката во всех шаблонах и ресурсах Azure
- **🔎 Проверка живого CLI** подтверждает текущую поддержку `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

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

#### Валидация AZD 1.23.12, расширение среды мастерской и обновление ИИ-моделей
**Эта версия выполняет проверку документации на базе `azd` `1.23.12`, обновляет устаревшие примеры команд AZD, обновляет рекомендации по ИИ-моделям до текущих значений по умолчанию и расширяет инструкции мастерской за пределы GitHub Codespaces, добавляя поддержку dev-контейнеров и локальных клонов.**

#### Добавлено
- **✅ Примечания по валидации во всех основных главах и документах мастерской** для явного указания тестируемой базовой линии AZD для обучающихся, использующих более новые или старые сборки CLI
- **⏱️ Руководство по таймаутам развертывания** для длительных развертываний ИИ-приложений с `azd deploy --timeout 1800`
- **🔎 Шаги проверки расширений** с `azd extension show azure.ai.agents` в документации ИИ-рабочих процессов
- **🌐 Расширенные рекомендации по среде мастерской** с охватом GitHub Codespaces, dev-контейнеров и локальных клонов с помощью MkDocs

#### Изменено
- **📚 Вступительные README глав** теперь последовательно указывают проверку на базе `azd 1.23.12` в секциях фундамента, конфигурации, инфраструктуры, многопользовательской среды, предразвертывания, устранения неполадок и продакшена
- **🛠️ Ссылки на команды AZD** обновлены до текущих форм во всех документах:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимости от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` для обзора Application Insights
- **🧪 Примеры provision preview упрощены** до текущей поддерживаемой формы, такой как `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Поток мастерской** обновлен, чтобы обучающиеся могли проходить лаборатории в Codespaces, dev-контейнере или локальном клоне вместо предположения только об исполнении в Codespaces
- **🔐 Рекомендации по аутентификации** теперь предпочитают `azd auth login` для рабочих процессов AZD, а `az login` позиционируется как опция при прямом использовании команд Azure CLI

#### Исправлено
- **🪟 Команды установки Windows** нормализованы с учетом актуальной регистрозависимости пакета `winget` в руководстве по установке
- **🐧 Руководство по установке Linux** исправлено для исключения неподдерживаемых специфичных для дистрибутива инструкций по менеджеру пакетов `azd` и вместо этого указывает на артефакты релиза там, где это уместно
- **📦 Примеры ИИ-моделей** обновлены от старых значений по умолчанию как `gpt-35-turbo` и `text-embedding-ada-002` до текущих примеров, таких как `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Фрагменты кода для развертывания и диагностики** исправлены для использования текущих команд среды и статуса в логах, скриптах и инструкциях по устранению неполадок
- **⚙️ Рекомендации по GitHub Actions** обновлены с `Azure/setup-azd@v1.0.0` на `Azure/setup-azd@v2`
- **🤖 Рекомендации по согласию MCP/Copilot** обновлены с `azd mcp consent` на `azd copilot consent list`

#### Улучшено
- **🧠 Рекомендации по ИИ главе** теперь лучше объясняют чувствительное к preview поведение `azd ai`, вход с конкретным тенантом, текущее использование расширений и обновленные рекомендации по развертыванию моделей
- **🧪 Инструкции мастерской** теперь используют более реалистичные примеры версий и более четкие формулировки настройки среды для практических лабораторий
- **📈 Документы по продакшену и устранению неполадок** теперь лучше соответствуют текущим примерам мониторинга, резервной модели и уровней затрат

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

#### Команды AZD AI CLI, проверка содержания и расширение шаблонов
**В этой версии добавлено покрытие команд `azd ai`, `azd extension` и `azd mcp` во всех главах, связанных с ИИ, исправлены битые ссылки и устаревший код в agents.md, обновлен шпаргалка и полностью переработан раздел Примеров Шаблонов с проверенными описаниями и новыми шаблонами Azure AI AZD.**

#### Добавлено
- **🤖 Покрытие AZD AI CLI** в 7 файлах (ранее только в Главе 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Новый раздел "Расширения и команды ИИ" с введением `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Опция 4: `azd ai agent init` с таблицей сравнения (шаблон vs подход манифеста)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Подразделы "AZD расширения для Foundry" и "Развертывание с приоритетом агента"
  - `docs/chapter-05-multi-agent/README.md` — Быстрый старт теперь показывает оба пути развертывания: на основе шаблона и на основе манифеста
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Раздел развертывания теперь включает опцию `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подраздел "Команды диагностики AZD AI расширения"
  - `resources/cheat-sheet.md` — Новый раздел "Команды ИИ и расширений" с `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Новые примерные шаблоны AZD AI** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG чат с Blazor WebAssembly, Semantic Kernel и поддержкой голосового чата
  - **azure-search-openai-demo-java** — Java RAG чат с использованием Langchain4J с вариантами развертывания ACA/AKS
  - **contoso-creative-writer** — Мультиагентское приложение для креативного письма с использованием Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — Безсерверный RAG с использованием Azure Functions + LangChain.js + Cosmos DB с поддержкой локальной разработки Ollama
  - **chat-with-your-data-solution-accelerator** — Корпоративный ускоритель RAG с админ-порталом, интеграцией Teams и вариантами PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Мультиагентское справочное приложение MCP оркестрации с серверами на .NET, Python, Java и TypeScript
  - **azd-ai-starter** — Минимальный стартовый шаблон инфраструктуры Azure AI Bicep
  - **🔗 Ссылка на потрясающую галерею AZD AI** — Ссылка на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (более 80 шаблонов)

#### Исправлено
- **🔗 Навигация в agents.md**: ссылки "Предыдущая/Следующая" теперь соответствуют порядку уроков в Главе 2 README (Интеграция Microsoft Foundry → Агенты → Развертывание AI-моделей)
- **🔗 Битые ссылки в agents.md**: `production-ai-practices.md` исправлена на `../chapter-08-production/production-ai-practices.md` (3 случая)
- **📦 Устаревший код в agents.md**: Заменён `opencensus` на `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Неверное API в agents.md**: `max_tokens` перемещён из `create_agent()` в `create_run()` как `max_completion_tokens`
- **🔢 Подсчёт токенов в agents.md**: Грубую оценку `len//4` заменили на `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Исправлены сервисы с "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (хост по умолчанию изменён в октябре 2024)
- **contoso-chat**: Обновлено описание для ссылки на Azure AI Foundry + Prompty, соответствующее фактическому названию и технологическому стеку репозитория

#### Удалено
- **ai-document-processing**: Удалена ссылка на нефункциональный шаблон (репозиторий не доступен публично как шаблон AZD)

#### Улучшено
- **📝 Упражнения в agents.md**: Упражнение 1 теперь показывает ожидаемый результат и шаг `azd monitor`; Упражнение 2 включает полный код регистрации `FunctionTool`; Упражнение 3 заменило расплывчатые инструкции на конкретные команды `prepdocs.py`
- **📚 Ресурсы в agents.md**: Обновлены ссылки на документацию Azure AI Agent Service и быстрый старт
- **📋 Таблица Следующих шагов в agents.md**: Добавлена ссылка на лабораторию AI Workshop для полного охвата главы

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
**В этой версии улучшена навигация по главам README.md с расширенным форматом таблицы.**

#### Изменено
- **Таблица карты курса**: Улучшена с добавлением прямых ссылок на уроки, оценками продолжительности и сложности
- **Очистка папок**: Удалены избыточные старые папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Проверка ссылок**: Проверены все 21+ внутренних ссылок в таблице карты курса

### [v3.16.0] - 2026-02-05

#### Обновления названий продуктов
**В этой версии обновлены упоминания продуктов с учётом нынешнего брендинга Microsoft.**

#### Изменено
- **Microsoft Foundry → Microsoft Foundry**: Все упоминания обновлены во всех файлах, кроме переводов
- **Azure AI Agent Service → Foundry Agents**: Имя сервиса обновлено для соответствия текущему брендингу

#### Обновленные файлы
- `README.md` - Главная страница курса
- `changelog.md` - История версий
- `course-outline.md` - Структура курса
- `docs/chapter-02-ai-development/agents.md` - Руководство по AI агентам
- `examples/README.md` - Документация примеров
- `workshop/README.md` - Страница мастерской
- `workshop/docs/index.md` - Индекс мастерской
- `workshop/docs/instructions/*.md` - Все файлы инструкций мастерской

---

### [v3.15.0] - 2026-02-05

#### Крупная реструктуризация репозитория: Папки по главам
**В этой версии документация разделена на отдельные папки глав для улучшения навигации.**

#### Переименование папок
Старые папки заменены на папки с номерами глав:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Добавлена новая: `docs/chapter-05-multi-agent/`

#### Перемещение файлов
| Файл | Из | В |
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
  - Целями обучения и продолжительностью
  - Таблицей уроков с описаниями
  - Быстрыми командами запуска
  - Навигацией по другим главам

#### Изменено
- **🔗 Обновлены все внутренние ссылки**: более 78 путей обновлено во всех файлах документации
- **🗺️ Главный README.md**: Обновлена карта курса с новой структурой глав
- **📝 examples/README.md**: Обновлены перекрестные ссылки на папки глав

#### Удалено
- Старая структура папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризация репозитория: Навигация по главам
**В этой версии добавлены README файлы навигации по главам (заменены v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новое руководство по AI агентам
**В этой версии добавлено полное руководство по развертыванию AI агентов с помощью Azure Developer CLI.**

#### Добавлено
- **🤖 docs/microsoft-foundry/agents.md**: Полное руководство, охватывающее:
  - Что такое AI агенты и чем они отличаются от чат-ботов
  - Три шаблона быстрого старта агентов (Foundry Agents, Prompty, RAG)
  - Паттерны архитектуры агентов (одиночный агент, RAG, мультиагент)
  - Настройка и кастомизация инструментов
  - Мониторинг и отслеживание метрик
  - Учет затрат и оптимизация
  - Частые сценарии устранения неполадок
  - Три практических упражнения с критериями успеха

#### Структура содержания
- **Введение**: Концепции агентов для начинающих
- **Быстрый старт**: Развертывание агентов с `azd init --template get-started-with-ai-agents`
- **Паттерны архитектуры**: Визуальные схемы паттернов агентов
- **Конфигурация**: Настройка инструментов и переменные окружения
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Пошаговое практическое обучение (по 20-45 минут каждое)

---

### [v3.12.0] - 2026-02-05

#### Обновление среды DevContainer
**В этой версии обновлена конфигурация контейнера разработки с современными инструментами и улучшенными настройками по умолчанию для обучения AZD.**

#### Изменено
- **🐳 Базовый образ**: Обновлен с `python:3.12-bullseye` на `python:3.12-bookworm` (последняя стабильная версия Debian)
- **📛 Имя контейнера**: Переименован с "Python 3" на "AZD для начинающих" для ясности

#### Добавлено
- **🔧 Новые возможности контейнера разработки**:
  - `azure-cli` с включенной поддержкой Bicep
  - `node:20` (LTS версия для шаблонов AZD)
  - `github-cli` для управления шаблонами
  - `docker-in-docker` для развертывания контейнерных приложений

- **🔌 Проброс портов**: Преднастроенные порты для распространенной разработки:
  - 8000 (предварительный просмотр MkDocs)
  - 3000 (Веб-приложения)
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
  - `bierner.markdown-mermaid` - Поддержка диаграмм Mermaid
  - `redhat.vscode-yaml` - Поддержка YAML (для azure.yaml)
  - `eamodio.gitlens` - Визуализация Git
  - `mhutchie.git-graph` - История Git

- **⚙️ Настройки VS Code**: Добавлены настройки по умолчанию для интерпретатора Python, форматирования при сохранении и обрезки пробелов

- **📦 Обновлены requirements-dev.txt**:
  - Добавлен плагин minify для MkDocs
  - Добавлен pre-commit для контроля качества кода
  - Добавлены пакеты Azure SDK (azure-identity, azure-mgmt-resource)

#### Исправлено
- **Команда Post-Create**: Теперь проверяет установку AZD и Azure CLI при запуске контейнера

---

### [v3.11.0] - 2026-02-05

#### Редизайн README для новичков
**В этой версии README.md значительно улучшена для лучшей доступности новичкам и добавлены важные ресурсы для разработчиков ИИ.**

#### Добавлено
- **🆚 Сравнение Azure CLI и AZD**: Чёткое объяснение, когда использовать каждый инструмент с практическими примерами
- **🌟 Потрясающие ссылки AZD**: Прямые ссылки на галерею шаблонов сообщества и ресурсы по внесению вкладов:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ готовых к развертыванию шаблонов
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Внесение вкладов от сообщества
- **🎯 Руководство по быстрому старту**: Упрощённый раздел из 3 шагов (Установка → Вход → Развертывание)
- **📊 Таблица навигации по опыту**: Чёткие рекомендации, с чего начать в зависимости от опыта разработчика

#### Изменено
- **Структура README**: Перестроена с акцентом на постепенное раскрытие — сначала ключевая информация
- **Введение**: Переписано для объяснения "Магии `azd up`" для абсолютных новичков
- **Удалён дублирующийся контент**: Устранён повтор раздела по устранению неполадок
- **Команды устранения неполадок**: Исправлена ссылка `azd logs` для использования действительной `azd monitor --logs`

#### Исправлено
- **🔐 Команды аутентификации**: Добавлены `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Недопустимые ссылки на команды**: Удалены оставшиеся `azd logs` из раздела устранения неполадок README

#### Заметки
- **Область применения**: Изменения применены к основному README.md и resources/cheat-sheet.md
- **Целевая аудитория**: Улучшения специально ориентированы на разработчиков, новых в AZD

---

### [v3.10.0] - 2026-02-05

#### Обновление точности команд Azure Developer CLI
**Эта версия исправляет несуществующие команды AZD во всей документации, обеспечивая использование корректного синтаксиса Azure Developer CLI во всех примерах кода.**

#### Исправлено
- **🔧 Удалены несуществующие команды AZD**: Проведен всесторонний аудит и исправление недействительных команд:
  - `azd logs` (не существует) → заменена на `azd monitor --logs` или альтернативы Azure CLI
  - Подкоманды `azd service` (не существуют) → заменены на `azd show` и Azure CLI
  - `azd infra import/export/validate` (не существуют) → удалены или заменены на действительные альтернативы
  - Флаги `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не существуют) → удалены
  - Флаги `azd provision --what-if/--rollback` (не существуют) → обновлены для использования `--preview`
  - `azd config validate` (не существует) → заменена на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не существуют) → удалены

- **📚 Файлы обновлены с исправлениями команд**:
  - `resources/cheat-sheet.md`: Крупная переработка справочника команд
  - `docs/deployment/deployment-guide.md`: Исправлены стратегии отката и развертывания
  - `docs/troubleshooting/debugging.md`: Исправлены разделы анализа логов
  - `docs/troubleshooting/common-issues.md`: Обновлены команды устранения неполадок
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправлен раздел отладки AZD
  - `docs/getting-started/azd-basics.md`: Исправлены команды мониторинга
  - `docs/getting-started/first-project.md`: Обновлены примеры мониторинга и отладки
  - `docs/getting-started/installation.md`: Исправлены примеры справки и версий
  - `docs/pre-deployment/application-insights.md`: Исправлены команды просмотра логов
  - `docs/pre-deployment/coordination-patterns.md`: Исправлены команды отладки агента

- **📝 Обновлена ссылка на версию**: 
  - `docs/getting-started/installation.md`: Заменена жестко заданная версия `1.5.0` на универсальную `1.x.x` с ссылкой на релизы

#### Изменено
- **Стратегии отката**: Обновлена документация для использования отката через Git (в AZD отсутствует встроенный откат)
- **Просмотр логов**: Заменены ссылки `azd logs` на команды `azd monitor --logs`, `azd monitor --live` и Azure CLI
- **Раздел производительности**: Удалены несуществующие флаги параллельного/инкрементного развертывания, предложены действительные альтернативы

#### Технические детали
- **Действительные команды AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Действительные флаги azd monitor**: `--live`, `--logs`, `--overview`
- **Удалённые функции**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Заметки
- **Проверка**: Команды проверены на Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершение мастерской и улучшение качества документации
**Эта версия завершает интерактивные модули мастерской, исправляет все сломанные ссылки в документации и повышает общее качество контента для разработчиков ИИ, использующих Microsoft AZD.**

#### Добавлено
- **📝 CONTRIBUTING.md**: Новый документ с руководством по внесению вкладов, включающий:
  - Четкие инструкции по сообщению об ошибках и предложениям изменений
  - Стандарты оформления документации для нового контента
  - Руководство по примерам кода и конвенциям сообщений коммитов
  - Информация о взаимодействии с сообществом

#### Завершено
- **🎯 Модуль мастерской 7 (Итоги)**: Полностью завершен итоговый модуль с:
  - Полным обзором достижений мастерской
  - Разделом освоенных ключевых концепций: AZD, шаблоны, Microsoft Foundry
  - Рекомендациями для продолжения обучения
  - Практическими упражнениями с оценкой сложности
  - Обратной связью и ссылками на поддержку сообщества

- **📚 Модуль мастерской 3 (Разбор)**: Обновлены учебные цели с:
  - Руководством по активации GitHub Copilot с серверами MCP
  - Пониманием структуры папок шаблонов AZD
  - Паттернами организации инфраструктуры как кода (Bicep)
  - Инструкциями для практических занятий

- **🔧 Модуль мастерской 6 (Завершение)**: Завершен с:
  - Целями очистки ресурсов и управления затратами
  - Использованием `azd down` для безопасного демонтажа инфраструктуры
  - Руководством по восстановлению мягко удалённых когнитивных сервисов
  - Бонусными задачами для исследования GitHub Copilot и Azure Portal

#### Исправлено
- **🔗 Исправление сломанных ссылок**: Исправлено более 15 сломанных внутренних ссылок документации:
  - `docs/ai-foundry/ai-model-deployment.md`: Исправлены пути к microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправлены пути ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменён несуществующий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Исправлены пути к FAQ и руководству по устранению неполадок
  - `examples/container-app/microservices/README.md`: Исправлены пути домашней страницы курса и руководства по развертыванию
  - `resources/faq.md` и `resources/glossary.md`: Обновлены ссылки на разделы ИИ
  - `course-outline.md`: Исправлены ссылки на руководство инструктора и лабораторные работы ИИ

- **📅 Баннер со статусом мастерской**: Обновлён с "В разработке" на активный статус мастерской с датой февраль 2026 г.

- **🔗 Навигация по мастерской**: Исправлены сломанные ссылки навигации в README.md мастерской, указывающие на несуществующую папку lab-1-azd-basics

#### Изменено
- **Презентация мастерской**: Убрано предупреждение «в разработке», мастерская теперь завершена и готова к использованию
- **Консистентность навигации**: Обеспечена корректная навигация между модулями мастерской
- **Ссылки на учебный путь**: Обновлены перекрестные ссылки глав для использования правильных microsoft-foundry путей

#### Проверено
- ✅ Все английские markdown-файлы содержат действительные внутренние ссылки
- ✅ Модули мастерской 0-7 завершены с учебными целями
- ✅ Навигация между главами и модулями функционирует корректно
- ✅ Контент подходит для разработчиков ИИ, использующих Microsoft AZD
- ✅ Язык и структура ориентированы на начинающих и соблюдаются во всем контенте
- ✅ CONTRIBUTING.md предоставляет ясные рекомендации для участников сообщества

#### Техническая реализация
- **Валидация ссылок**: Автоматический PowerShell скрипт проверил все внутренние ссылки .md
- **Аудит контента**: Ручная проверка полноты мастерской и соответствия для начинающих
- **Система навигации**: Применены согласованные шаблоны навигации глав и модулей

#### Заметки
- **Область применения**: Изменения применены только к английской документации
- **Переводы**: Папки с переводами не обновлялись в этой версии (автоматический перевод синхронизируется позже)
- **Продолжительность мастерской**: Полная мастерская теперь обеспечивает 3-4 часа практического обучения

---

### [v3.8.0] - 2025-11-19

#### Расширенная документация: Мониторинг, безопасность и паттерны мульти-агентов
**В этой версии добавлены всесторонние уроки A-класса по интеграции Application Insights, паттернам аутентификации и координации мульти-агентов для производственных развертываний.**

#### Добавлено
- **📊 Урок по интеграции Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Развертывание с упором на AZD с автоматическим обеспечением ресурсов
  - Полные Bicep шаблоны для Application Insights + Log Analytics
  - Рабочие Python-приложения с настраиваемой телеметрией (более 1200 строк)
  - Паттерны мониторинга AI/LLM (отслеживание токенов/стоимости моделей Microsoft Foundry)
  - 6 диаграмм Mermaid (архитектура, распределенное трассирование, поток телеметрии)
  - 3 практических упражнения (оповещения, панели, мониторинг AI)
  - Примеры запросов Kusto и стратегии оптимизации затрат
  - Потоковые метрики в реальном времени и отладка
  - Время обучения 40-50 минут с паттернами производственного уровня

- **🔐 Урок по паттернам аутентификации и безопасности**: в `docs/getting-started/authsecurity.md`:
  - 3 паттерна аутентификации (строки подключения, Key Vault, управляемый идентификатор)
  - Полные Bicep шаблоны инфраструктуры для безопасных развертываний
  - Код Node.js приложения с интеграцией Azure SDK
  - 3 полноценных упражнения (включение управляемого идентификатора, пользовательский идентификатор, ротация Key Vault)
  - Лучшие практики безопасности и настройки RBAC
  - Руководство по устранению неполадок и анализ затрат
  - Готовые к производству паттерны безпарольной аутентификации

- **🤖 Урок по паттернам координации мульти-агентов**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 паттернов координации (последовательный, параллельный, иерархический, событийно-управляемый, консенсус)
  - Полная реализация сервиса-оркестратора (Python/Flask, более 1500 строк)
  - 3 специализированных реализации агентов (Исследователь, Писатель, Редактор)
  - Интеграция Service Bus для очередей сообщений
  - Управление состоянием через Cosmos DB для распределённых систем
  - 6 диаграмм Mermaid, показывающих взаимодействия агентов
  - 3 продвинутых упражнения (обработка таймаутов, логика повторов, автоматический выключатель)
  - Анализ затрат ($240-565/месяц) и стратегии оптимизации
  - Интеграция Application Insights для мониторинга

#### Улучшено
- **Глава по предварительному развертыванию**: Теперь включает комплексные паттерны мониторинга и координации
- **Глава по началу работы**: Улучшена профессиональными паттернами аутентификации
- **Готовность к производству**: Полное покрытие от безопасности до наблюдаемости
- **Оглавление курса**: Обновлено для ссылки на новые уроки в главах 3 и 6

#### Изменено
- **Прогресс обучения**: Лучшее интегрирование безопасности и мониторинга по всему курсу
- **Качество документации**: Консистентные стандарты A-класса (95-97%) в новых уроках
- **Паттерны для производственной среды**: Полное сквозное покрытие для корпоративных развертываний

#### Улучшено
- **Опыт разработчика**: Четкий путь от разработки к мониторингу в производстве
- **Стандарты безопасности**: Профессиональные паттерны аутентификации и управления секретами
- **Наблюдаемость**: Полная интеграция Application Insights с AZD
- **Нагрузки ИИ**: Специализированный мониторинг моделей Microsoft Foundry и мультиагентных систем

#### Проверено
- ✅ Все уроки включают полный рабочий код (не отрывки)
- ✅ Диаграммы Mermaid для наглядного обучения (всего 19 в 3 уроках)
- ✅ Практические упражнения с шагами проверки (всего 9)
- ✅ Готовые к производству Bicep шаблоны, развертываемые через `azd up`
- ✅ Анализ затрат и стратегии оптимизации
- ✅ Руководства по устранению неполадок и лучшие практики
- ✅ Точки проверки знаний с командами для проверки

#### Результаты оценки документации
- **docs/pre-deployment/application-insights.md**: - Всеобъемлющее руководство по мониторингу
- **docs/getting-started/authsecurity.md**: - Профессиональные паттерны безопасности
- **docs/pre-deployment/coordination-patterns.md**: - Продвинутые архитектуры мульти-агентов
- **Обновленный общий контент**: - Консистентные высококачественные стандарты

#### Техническая реализация
- **Application Insights**: Log Analytics + кастомная телеметрия + распределенное трассирование
- **Аутентификация**: Управляемый идентификатор + Key Vault + паттерны RBAC
- **Мульти-агенты**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Мониторинг**: Потоковые метрики + запросы Kusto + оповещения + панели
- **Управление затратами**: Стратегии семплирования, политики хранения, контроль бюджета

### [v3.7.0] - 2025-11-19

#### Улучшения качества документации и новый пример Microsoft Foundry Models
**Эта версия повышает качество документации по всему репозиторию и добавляет полный пример развертывания Microsoft Foundry Models с чат-интерфейсом gpt-4.1.**

#### Добавлено
- **🤖 Пример чата Microsoft Foundry Models**: Полное развертывание gpt-4.1 с рабочей реализацией в `examples/azure-openai-chat/`:
  - Полная инфраструктура Microsoft Foundry Models (развертывание модели gpt-4.1)
  - Python CLI чат с историей беседы
  - Интеграция Key Vault для безопасного хранения API-ключей
  - Отслеживание использования токенов и оценка затрат
  - Ограничение скорости и обработка ошибок
  - Полное README с руководством по развертыванию 35-45 минут
  - 11 готовых к производству файлов (шаблоны Bicep, Python-приложение, конфигурация)
- **📚 Практические упражнения по документации**: Добавлены упражнения в руководство по конфигурации:
  - Упражнение 1: Конфигурация для нескольких сред (15 минут)
  - Упражнение 2: Практика управления секретами (10 минут)
  - Четкие критерии успеха и шаги проверки
- **✅ Проверка развертывания**: Добавлен раздел проверки в руководство по развертыванию:
  - Процедуры проверки состояния системы
  - Контрольный список критериев успеха
  - Ожидаемые результаты для всех команд развертывания
  - Быстрая справка по устранению неполадок

#### Улучшено
- **examples/README.md**: Обновлен до качества A-класса (93%):
  - Добавлен azure-openai-chat в все релевантные разделы
  - Увеличено количество локальных примеров с 3 до 4
  - Добавлен в таблицу примеров ИИ приложений
  - Интегрирован в Быстрый старт для пользователей среднего уровня
  - Добавлен в раздел Microsoft Foundry Templates
  - Обновлена матрица сравнения и разделы нахождения технологий
- **Качество документации**: улучшено с B+ (87%) до A- (92%) по всей папке docs:
  - Добавлены ожидаемые результаты для критически важных примеров команд
  - Включены шаги верификации для изменений конфигурации
  - Усилено практическое обучение с помощью упражнений

#### Изменено
- **Прогресс обучения**: Улучшенная интеграция примеров ИИ для учащихся среднего уровня
- **Структура документации**: Больше практических упражнений с чёткими результатами
- **Процесс верификации**: Явно добавлены критерии успеха в ключевые рабочие процессы

#### Улучшено
- **Опыт разработчика**: Развёртывание моделей Microsoft Foundry теперь занимает 35-45 минут (вместо 60-90 для сложных альтернатив)
- **Прозрачность стоимости**: Чёткие оценки стоимости ($50-200/месяц) для примера Microsoft Foundry Models
- **Путь обучения**: Разработчики ИИ имеют ясную точку входа с azure-openai-chat
- **Стандарты документации**: Согласованные ожидаемые результаты и шаги верификации

#### Проверено
- ✅ Пример Microsoft Foundry Models полностью функционален с `azd up`
- ✅ Все 11 файлов реализации синтаксически корректны
- ✅ Инструкции в README соответствуют реальному опыту развертывания
- ✅ Ссылки в документации обновлены более чем в 8 местах
- ✅ Индекс примеров точно отражает 4 локальных примера
- ✅ Нет дублирующихся внешних ссылок в таблицах
- ✅ Все навигационные ссылки корректны

#### Техническая реализация
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps паттерн
- **Безопасность**: Управляемая идентичность готова, секреты в Key Vault
- **Мониторинг**: Интеграция Application Insights
- **Управление стоимостью**: Отслеживание токенов и оптимизация использования
- **Развёртывание**: Одна команда `azd up` для полного настроения

### [v3.6.0] - 2025-11-19

#### Крупное обновление: Примеры развертывания Container App
**В этой версии представлены полные, готовые к производству примеры развертывания контейнерных приложений с использованием Azure Developer CLI (AZD), с полной документацией и интеграцией в учебный путь.**

#### Добавлено
- **🚀 Примеры Container App**: Новые локальные примеры в `examples/container-app/`:
  - [Главное руководство](examples/container-app/README.md): Полный обзор контейнерных развертываний, быстрый старт, продакшн и продвинутые шаблоны
  - [Простой Flask API](../../examples/container-app/simple-flask-api): Дружелюбный для начинающих REST API с масштабированием до нуля, пробами здоровья, мониторингом и устранением неполадок
  - [Микросервисная архитектура](../../examples/container-app/microservices): Готовое к продакшну многосервисное развертывание (API Gateway, Product, Order, User, Notification), асинхронные сообщения, Service Bus, Cosmos DB, Azure SQL, распределённый трейсинг, blue-green/canary deployment
- **Лучшая практика**: Безопасность, мониторинг, оптимизация затрат и рекомендации по CI/CD для контейнерных нагрузок
- **Примеры кода**: Полная `azure.yaml`, шаблоны Bicep и реализации сервисов на разных языках (Python, Node.js, C#, Go)
- **Тестирование и устранение неполадок**: Полные сценарии end-to-end тестов, команды мониторинга, руководство по устранению неполадок

#### Изменено
- **README.md**: Обновлен для представления и ссылки на новые примеры контейнерных приложений в разделе "Локальные примеры - Контейнерные приложения"
- **examples/README.md**: Обновлен для выделения примеров контейнерных приложений, добавления записей в матрицу сравнения и обновления ссылок на технологии и архитектуру
- **Структура курса и учебное пособие**: Обновлены для ссылок на новые примеры контейнерных приложений и шаблоны развертывания в соответствующих главах

#### Проверено
- ✅ Все новые примеры развёртываются с помощью `azd up` и соответствуют лучшим практикам
- ✅ Обновлены перекрёстные ссылки в документации и навигация
- ✅ Примеры охватывают сценарии от начинающих до продвинутых, включая продакшн микросервисы

#### Примечания
- **Объем**: Только англоязычная документация и примеры
- **Следующие шаги**: Расширение новыми продвинутыми контейнерными паттернами и автоматизацией CI/CD в будущих релизах

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукта: Microsoft Foundry
**В этой версии реализовано комплексное изменение названия продукта с "Microsoft Foundry" на "Microsoft Foundry" во всей английской документации, отражающее официальный ребрендинг Microsoft.**

#### Изменено
- **🔄 Обновление названия продукта**: Полный ребрендинг с "Microsoft Foundry" на "Microsoft Foundry"
  - Обновлены все ссылки в английской документации в папке `docs/`
  - Переименована папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Переименован файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Итого: обновлено 23 упоминания в 7 файлах документации

- **📁 Изменения в структуре папок**:
  - `docs/ai-foundry/` переименована в `docs/microsoft-foundry/`
  - Все перекрестные ссылки обновлены для отражения новой структуры папок
  - Навигационные ссылки проверены во всей документации

- **📄 Переименование файлов**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Все внутренние ссылки обновлены с учётом новых имён файлов

#### Обновлённые файлы
- **Документация глав** (7 файлов):
  - `docs/microsoft-foundry/ai-model-deployment.md` - обновлено 3 навигационных ссылки
  - `docs/microsoft-foundry/ai-workshop-lab.md` - обновлено 4 упоминания названия продукта
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - уже использует Microsoft Foundry (из предыдущих обновлений)
  - `docs/microsoft-foundry/production-ai-practices.md` - обновлено 3 ссылки (обзор, отзывы сообщества, документация)
  - `docs/getting-started/azd-basics.md` - обновлено 4 перекрестные ссылки
  - `docs/getting-started/first-project.md` - обновлено 2 навигационных ссылки главы
  - `docs/getting-started/installation.md` - обновлено 2 ссылки на следующие главы
  - `docs/troubleshooting/ai-troubleshooting.md` - обновлено 3 ссылки (навигация, сообщество Discord)
  - `docs/troubleshooting/common-issues.md` - обновлена 1 навигационная ссылка
  - `docs/troubleshooting/debugging.md` - обновлена 1 навигационная ссылка

- **Файлы структуры курса** (2 файла):
  - `README.md` - обновлено 17 ссылок (обзор курса, заголовки глав, раздел шаблонов, данные сообщества)
  - `course-outline.md` - обновлено 14 ссылок (обзор, цели обучения, ресурсы главы)

#### Проверено
- ✅ Нет оставшихся ссылок на "ai-foundry" в путях папок в английской документации
- ✅ Нет оставшихся упоминаний названия продукта "Microsoft Foundry" в английской документации
- ✅ Все навигационные ссылки работают с новой структурой папок
- ✅ Переименование файлов и папок выполнено успешно
- ✅ Проверены перекрестные ссылки между главами

#### Примечания
- **Объем**: Изменения применены только к английской документации в папке `docs/`
- **Переводы**: Папки перевода (`translations/`) не обновлены в этой версии
- **Материалы мастерской**: Материалы мастерской (`workshop/`) не обновлены в этой версии
- **Примеры**: Файлы примеров могут ещё содержать ссылки на старые наименования (будет исправлено в следующих обновлениях)
- **Внешние ссылки**: Внешние URL и ссылки на репозитории GitHub остались без изменений

#### Руководство по миграции для участников
Если у вас есть локальные ветки или документация, ссылающаяся на старую структуру:
1. Обновите ссылки на папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Обновите ссылки на файлы: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените название продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверьте, что все внутренние ссылки в документации работают корректно

---

### [v3.4.0] - 2025-10-24

#### Улучшения предпросмотра инфраструктуры и валидации
**В этой версии введена полная поддержка новой функции предпросмотра Azure Developer CLI и улучшен пользовательский опыт мастерской.**

#### Добавлено
- **🧪 Документация функции azd provision --preview**: Полное описание новой функциональности предпросмотра инфраструктуры
  - Справочник команд и примеры использования в шпаргалке
  - Подробная интеграция в руководство по обеспечению с кейсами использования и преимуществами
  - Интеграция предпролетной проверки для более безопасного развертывания
  - Обновления руководства для безопасных практик развертывания
- **🚧 Баннер статуса мастерской**: Профессиональный HTML-баннер, указывающий статус развития мастерской
  - Градиентный дизайн с индикаторами состояния для понятной коммуникации с пользователем
  - Метка времени последнего обновления для прозрачности
  - Адаптивный дизайн для всех типов устройств

#### Улучшено
- **Безопасность инфраструктуры**: Функция предпросмотра интегрирована во всю документацию по развертыванию
- **Проверка перед развертыванием**: Автоматизированные скрипты теперь включают тестирование предпросмотра инфраструктуры
- **Рабочий процесс разработчика**: Обновлены последовательности команд с включением предпросмотра как лучшей практики
- **Опыт работы с мастерской**: Пользователям установлены ясные ожидания относительно статуса разработки контента

#### Изменено
- **Лучшие практики развертывания**: Рекомендован новый подход — процесс с приоритетом предпросмотра
- **Поток документации**: Валидация инфраструктуры перенесена на более ранний этап обучения
- **Презентация мастерской**: Профессиональная коммуникация статуса с чётким графиком разработки

#### Улучшено
- **Подход с упором на безопасность**: Изменения инфраструктуры теперь можно проверить до развертывания
- **Командное сотрудничество**: Результаты предпросмотра можно делиться для обзора и утверждения
- **Информированность о затратах**: Лучше понимание расходов ресурсов до их создания
- **Снижение рисков**: Уменьшение числа сбоев развертывания благодаря дополнительной валидации

#### Техническая реализация
- **Интеграция в несколько документов**: Функция предпросмотра описана в 4 ключевых файлах
- **Шаблоны команд**: Последовательный синтаксис и примеры по всей документации
- **Интеграция лучших практик**: Предпросмотр включён в рабочие процессы валидации и скрипты
- **Визуальные индикаторы**: Яркие отметки НОВОЙ функции для удобства обнаружения

#### Инфраструктура мастерской
- **Коммуникация статуса**: Профессиональный HTML-баннер с градиентным оформлением
- **Пользовательский опыт**: Ясный статус разработки предотвращает путаницу
- **Профессиональная презентация**: Поддерживает авторитет репозитория и задаёт ожидаемые сроки
- **Прозрачность сроков**: Метка времени последнего обновления — октябрь 2025 для отчётности

### [v3.3.0] - 2025-09-24

#### Расширенные материалы мастерской и интерактивный учебный опыт
**В этой версии представлены полные материалы мастерской с интерактивными руководствами в браузере и структурированными учебными путями.**

#### Добавлено
- **🎥 Интерактивное руководство по мастерской**: Опыт работы в браузере с функцией предпросмотра MkDocs
- **📝 Структурированные инструкции мастерской**: 7-ступенчатый маршрут обучения от ознакомления до настройки
  - 0-Введение: обзор мастерской и настройка
  - 1-Выбор шаблона ИИ: процесс выбора и открытия шаблона
  - 2-Валидация шаблона ИИ: процедуры развертывания и проверки
  - 3-Декомпозиция шаблона ИИ: понимание архитектуры шаблона
  - 4-Конфигурация шаблона ИИ: настройка и кастомизация
  - 5-Кастомизация шаблона ИИ: продвинутые изменения и итерации
  - 6-Очистка инфраструктуры: управление ресурсами и удаление
  - 7-Завершение: резюме и дальнейшие шаги
- **🛠️ Инструменты мастерской**: Конфигурация MkDocs с темой Material для расширенного опыта обучения
- **🎯 Практический учебный путь**: Методология из 3 шагов (Открытие → Развёртывание → Кастомизация)
- **📱 Интеграция с GitHub Codespaces**: Плавная настройка среды разработки

#### Расширено
- **Лаборатория мастерской ИИ**: Расширена до полноценного 2-3 часового структурированного учебного опыта
- **Документация мастерской**: Профессиональная презентация с навигацией и визуальными материалами
- **Прогресс обучения**: Ясное поэтапное руководство от выбора шаблона до развертывания в продакшн
- **Опыт разработчика**: Интегрированные инструменты для оптимизации рабочих процессов разработки

#### Улучшено
- **Доступность**: Интерфейс в браузере с поиском, функцией копирования и переключением темы
- **Самостоятельное обучение**: Гибкая структура мастерской, учитывающая разные скорости обучения
- **Практическое применение**: Реальные сценарии развертывания AI шаблонов
- **Интеграция сообщества**: Интеграция с Discord для поддержки и сотрудничества в мастерской

#### Особенности мастерской
- **Встроенный поиск**: Быстрый поиск по ключевым словам и урокам
- **Копирование блоков кода**: Функция копирования при наведении для всех примеров кода
- **Переключатель темы**: Поддержка светлого и тёмного режимов для разных предпочтений
- **Визуальные материалы**: Скриншоты и диаграммы для лучшего понимания
- **Интеграция справки**: Прямой доступ к Discord для поддержки сообщества

### [v3.2.0] - 2025-09-17

#### Крупная перестройка навигации и система обучения по главам
**В этой версии реализована комплексная структура обучения по главам с улучшенной навигацией по всему репозиторию.**

#### Добавлено
- **📚 Система обучения по главам**: Переструктурирован весь курс на 8 прогрессивных обучающих глав
  - Глава 1: Основы и быстрый старт (⭐ - 30-45 мин)
  - Глава 2: Разработка с приоритетом ИИ (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и аутентификация (⭐⭐ - 45-60 мин)
  - Глава 4: Инфраструктура как код и развертывание (⭐⭐⭐ - 1-1.5 часа)
  - Глава 5: Мультиагентные ИИ решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Предварительная валидация и планирование (⭐⭐ - 1 час)
  - Глава 7: Устранение неполадок и отладка (⭐⭐ - 1-1.5 часа)
  - Глава 8: Продакшн и корпоративные шаблоны (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Комплексная навигационная система**: Единые заголовки и подвал навигации во всей документации
- **🎯 Отслеживание прогресса**: Чеклист завершения курса и система проверки знаний
- **🗺️ Навигация по учебному пути**: Чёткие точки входа для различных уровней опыта и целей
- **🔗 Перекрёстная навигация**: Связанные главы и предварительные требования ясно связаны ссылками

#### Улучшено
- **Структура README**: Преобразована в структурированную обучающую платформу с организацией по главам
- **Навигация документации**: На каждой странице теперь отображается контекст главы и руководство по прогрессу
- **Организация шаблонов**: Примеры и шаблоны сопоставлены с соответствующими учебными главами
- **Интеграция ресурсов**: Шпаргалки, FAQ и учебные пособия связаны с релевантными главами
- **Интеграция мастерской**: Практические лаборатории прокладывают учебные цели множества глав

#### Изменено
- **Прогресс обучения**: переход от линейной документации к гибкому обучению на основе глав
- **Расположение конфигурации**: руководство по конфигурации перемещено в Главу 3 для улучшения процесса обучения
- **Интеграция AI-контента**: улучшенная интеграция AI-специфического контента на протяжении всего учебного пути
- **Производственный контент**: расширенные шаблоны объединены в Главу 8 для обучающихся в корпоративном сегменте

#### Улучшено
- **Пользовательский опыт**: четкая навигация с хлебными крошками и индикаторами прогресса по главам
- **Доступность**: единообразные шаблоны навигации для облегчения прохождения курса
- **Профессиональная презентация**: структура курса в стиле университета, подходящая для академического и корпоративного обучения
- **Эффективность обучения**: сокращено время поиска релевантного контента за счет улучшенной организации

#### Техническая реализация
- **Заголовки навигации**: стандартизирована навигация по главам в более чем 40 файлах документации
- **Навигация в подвале**: единообразные указания по прогрессу и индикаторы завершения глав
- **Внутренние ссылки**: комплексная система внутренних ссылок, связывающая связанные концепции
- **Отображение глав**: шаблоны и примеры четко связаны с учебными целями

#### Улучшение учебного пособия
- **📚 Комплексные учебные цели**: перепрофилированное учебное руководство в соответствии с системой из 8 глав
- **🎯 Оценка по главам**: каждая глава включает конкретные учебные цели и практические упражнения
- **📋 Отслеживание прогресса**: еженедельный график обучения с измеримыми результатами и контрольными списками завершения
- **❓ Вопросы для оценки**: вопросы для проверки знаний по каждой главе с профессиональными результатами
- **🛠️ Практические упражнения**: практические задания с реальными сценариями развертывания и устранения неполадок
- **📊 Прогресс навыков**: четкое продвижение от базовых концепций к корпоративным шаблонам с акцентом на карьерное развитие
- **🎓 Сертификационная структура**: профессиональные результаты развития и система признания в сообществе
- **⏱️ Управление таймлайном**: структурированный 10-недельный план обучения с валидацией ключевых этапов

### [v3.1.0] - 2025-09-17

#### Улучшенные многоагентные AI-решения
**Эта версия улучшает многоагентное решение для розницы с улучшенным именованием агентов и расширенной документацией.**

#### Изменено
- **Терминология многоагентной системы**: заменено "агент Cora" на "агент клиента" во всем многоагентном решении для розницы для лучшего понимания
- **Архитектура агента**: обновлена вся документация, ARM-шаблоны и примеры кода с единым использованием названия "агент клиента"
- **Примеры конфигурации**: обновлены шаблоны конфигурации агента с актуальными соглашениями по наименованиям
- **Последовательность документации**: обеспечено использование профессиональных описательных имен агентов во всех ссылках

#### Улучшено
- **Пакет ARM-шаблона**: обновлен retail-multiagent-arm-template с ссылками на агента клиента
- **Архитектурные диаграммы**: обновлены диаграммы Mermaid с новыми именами агентов
- **Примеры кода**: классы Python и примеры реализации теперь используют именование CustomerAgent
- **Переменные окружения**: обновлены все скрипты развертывания с использованием CUSTOMER_AGENT_NAME

#### Улучшено
- **Опыт разработчика**: более четкое разграничение ролей и обязанностей агентов в документации
- **Готовность к производству**: лучшее соответствие корпоративным соглашениям по наименованиям
- **Учебные материалы**: более интуитивное наименование агентов для образовательных целей
- **Удобство шаблонов**: упрощено понимание функций агентов и шаблонов развертывания

#### Технические детали
- обновлены архитектурные диаграммы Mermaid с ссылками на CustomerAgent
- заменены имена классов CoraAgent на CustomerAgent в примерах Python
- изменены JSON-конфигурации ARM-шаблонов с использованием типа агента "customer"
- обновлены переменные окружения с CORA_AGENT_* на CUSTOMER_AGENT_*
- обновлены все команды развертывания и конфигурации контейнеров

### [v3.0.0] - 2025-09-12

#### Основные изменения - фокус на разработчиках AI и интеграция Microsoft Foundry
**Эта версия превращает репозиторий в комплексный учебный ресурс, ориентированный на AI, с интеграцией Microsoft Foundry.**

#### Добавлено
- **🤖 Обучающий путь с приоритетом AI**: полная реконструкция с акцентом на разработчиков и инженеров AI
- **Руководство по интеграции Microsoft Foundry**: полная документация по подключению AZD к сервисам Microsoft Foundry
- **Шаблоны развертывания AI-моделей**: подробное руководство по выбору моделей, конфигурации и стратегиям промышленного развертывания
- **Лабораторный AI-воркшоп**: 2-3 часовой практический воркшоп по преобразованию AI-приложений в решения, deployable через AZD
- **Лучшие практики промышленного AI**: корпоративные шаблоны для масштабирования, мониторинга и обеспечения безопасности AI-нагрузок
- **Руководство по устранению неполадок AI**: комплексное руководство по устранению проблем в Microsoft Foundry Models, Cognitive Services и AI-развертываниях
- **Галерея AI-шаблонов**: коллекция шаблонов Microsoft Foundry с рейтингом сложности
- **Материалы воркшопа**: полная структура воркшопа с практическими лабораториями и справочными материалами

#### Улучшено
- **Структура README**: ориентирована на разработчиков AI с 45% интересом сообщества из Discord Microsoft Foundry
- **Обучающие пути**: отдельное направление для разработчиков AI наряду с традиционными путями для студентов и DevOps-инженеров
- **Рекомендации по шаблонам**: выделены AI-шаблоны, включая azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграция с сообществом**: расширенная поддержка Discord сообщества с AI-специфическими каналами и обсуждениями

#### Безопасность и производственная готовность
- **Шаблоны управляемой идентификации**: AI-специфические конфигурации аутентификации и безопасности
- **Оптимизация затрат**: отслеживание использования токенов и контроль бюджета для AI-нагрузок
- **Мульти-региональное развертывание**: стратегии глобального развертывания AI-приложений
- **Мониторинг производительности**: AI-специфические метрики и интеграция с Application Insights

#### Качество документации
- **Линейная структура курса**: логичный переход от начального уровня к продвинутым шаблонам развертывания AI
- **Проверенные URL**: все внешние ссылки на репозитории проверены и доступны
- **Полный справочник**: все внутренние ссылки документации проверены и работают
- **Готовность к производству**: корпоративные шаблоны развертывания с реальными примерами

### [v2.0.0] - 2025-09-09

#### Основные изменения - реструктуризация репозитория и профессиональные улучшения
**Эта версия представляет собой значительную переработку структуры репозитория и презентации контента.**

#### Добавлено
- **Структурированная учебная основа**: все страницы документации теперь содержат введение, цели обучения и ожидаемые результаты
- **Система навигации**: добавлены ссылки "Предыдущий/Следующий урок" по всей документации для направленного прогресса в обучении
- **Учебное пособие**: комплексное study-guide.md с учебными целями, практическими упражнениями и материалами для оценки
- **Профессиональная презентация**: удалены все значки эмодзи для улучшения доступности и профессионального вида
- **Улучшенная структура контента**: улучшена организация и последовательность учебных материалов

#### Изменено
- **Формат документации**: стандартизация всей документации с последовательной структурой, ориентированной на обучение
- **Поток навигации**: реализован логичный прогресс по всем учебным материалам
- **Презентация контента**: убраны декоративные элементы в пользу четкого профессионального форматирования
- **Структура ссылок**: обновлены все внутренние ссылки для поддержки новой системы навигации

#### Улучшено
- **Доступность**: удалена зависимость от эмодзи для лучшей совместимости с программами чтения с экрана
- **Профессиональный вид**: чистая академическая презентация, подходящая для корпоративного обучения
- **Опыт обучения**: структурированный подход с четкими целями и результатами для каждого урока
- **Организация контента**: улучшенный логический поток и связь между смежными темами

### [v1.0.0] - 2025-09-09

#### Первоначальный выпуск - комплексный учебный репозиторий AZD

#### Добавлено
- **Основная структура документации**
  - Полный цикл руководств по быстрому старту
  - Комплексная документация по развертыванию и настройке
  - Детальные ресурсы по устранению неполадок и отладке
  - Инструменты и процедуры проверки перед развертыванием

- **Модуль быстрого старта**
  - Основы AZD: ключевые концепции и терминология
  - Руководство по установке: инструкции для разных платформ
  - Руководство по конфигурации: настройка среды и аутентификация
  - Первое учебное задание: поэтапное практическое обучение

- **Модуль развертывания и настройки**
  - Руководство по развертыванию: полная документация рабочего процесса
  - Руководство по провиженингу: инфраструктура как код с Bicep
  - Лучшие практики производственного развертывания
  - Шаблоны много-сервисной архитектуры

- **Модуль проверки перед развертыванием**
  - Планирование емкости: проверка доступности ресурсов Azure
  - Выбор SKU: подробные рекомендации по уровням обслуживания
  - Предварительные проверки: автоматические сценарии проверки (PowerShell и Bash)
  - Оценка затрат и инструменты планирования бюджета

- **Модуль устранения неполадок**
  - Типичные проблемы: часто встречающиеся проблемы и решения
  - Руководство по отладке: систематические методики устранения неполадок
  - Продвинутые диагностические техники и инструменты
  - Мониторинг производительности и оптимизация

- **Ресурсы и справочники**
  - Шпаргалка по командам: быстрое руководство по основным командам
  - Глоссарий: полный список терминов и определений аббревиатур
  - FAQ: подробные ответы на распространённые вопросы
  - Внешние ссылки на ресурсы и сообщества

- **Примеры и шаблоны**
  - Пример простого веб-приложения
  - Шаблон развертывания статического веб-сайта
  - Конфигурация контейнерных приложений
  - Шаблоны интеграции с базами данных
  - Примеры архитектур микросервисов
  - Реализации серверлесс-функций

#### Особенности
- **Поддержка нескольких платформ**: руководства по установке и настройке для Windows, macOS и Linux
- **Разные уровни навыков**: контент для студентов и профессиональных разработчиков
- **Практическая направленность**: практические примеры и сценарии из реальной жизни
- **Полное покрытие**: от базовых понятий до продвинутых корпоративных шаблонов
- **Безопасность в приоритете**: интеграция лучших практик безопасности во весь процесс
- **Оптимизация затрат**: рекомендации по эффективному управлению ресурсами и затратами

#### Качество документации
- **Подробные примеры кода**: практические, проверенные образцы кода
- **Пошаговые инструкции**: четкие и выполнимые рекомендации
- **Комплексная обработка ошибок**: инструкции по устранению типичных проблем
- **Внедрение лучших практик**: стандарты отрасли и рекомендации
- **Совместимость версий**: актуальность с последними сервисами Azure и функциями azd

## Планируемые будущие улучшения

### Версия 3.1.0 (планируется)
#### Расширение AI-платформы
- **Поддержка нескольких моделей**: паттерны интеграции для Hugging Face, Azure Machine Learning и кастомных моделей
- **Фреймворки для AI-агентов**: шаблоны для развертываний LangChain, Semantic Kernel и AutoGen
- **Продвинутые RAG-паттерны**: векторные базы данных помимо Azure AI Search (Pinecone, Weaviate и др.)
- **Мониторинг AI**: расширенный контроль производительности моделей, использования токенов и качества ответов

#### Опыт разработчика
- **Расширение для VS Code**: интегрированный опыт разработки AZD + Microsoft Foundry
- **Интеграция GitHub Copilot**: AI-помощник для генерации AZD-шаблонов
- **Интерактивные учебники**: практические упражнения с автоматической проверкой для AI-сценариев
- **Видеоконтент**: дополнительные видеоуроки для визуальных обучающихся с акцентом на AI-развертывания

### Версия 4.0.0 (планируется)
#### Корпоративные AI-шаблоны
- **Рамки управления**: управление AI-моделями, комплаенс и аудиторские трассировки
- **Мультиарендный AI**: шаблоны обслуживания нескольких клиентов с изолированными AI-сервисами
- **Развертывание Edge AI**: интеграция с Azure IoT Edge и контейнерными инстансами
- **Гибридный облачный AI**: мультиоблачные и гибридные шаблоны развертывания AI-нагрузок

#### Расширенные функции
- **Автоматизация AI-конвейеров**: интеграция MLOps с пайплайнами Azure Machine Learning
- **Продвинутая безопасность**: шаблоны zero-trust, приватные конечные точки и расширенная защита от угроз
- **Оптимизация производительности**: продвинутые методы настройки и масштабирования высокопроизводительных AI-приложений
- **Глобальная дистрибуция**: шаблоны доставки контента и кэширования на периферии для AI-приложений

### Версия 3.0.0 (планировалась) - заменена текущим выпуском
#### Предлагаемые дополнения - теперь реализованы в v3.0.0
- ✅ **AI-ориентированный контент**: полная интеграция Microsoft Foundry (выполнено)
- ✅ **Интерактивные учебники**: практический AI-воркшоп (выполнено)
- ✅ **Модуль продвинутой безопасности**: AI-специфические шаблоны безопасности (выполнено)
- ✅ **Оптимизация производительности**: стратегии настройки AI-нагрузок (выполнено)

### Версия 2.1.0 (планировалась) - частично реализована в v3.0.0
#### Незначительные улучшения - некоторые реализованы в текущем выпуске
- ✅ **Дополнительные примеры**: AI-ориентированные сценарии развертывания (выполнено)
- ✅ **Расширенное FAQ**: AI-специфические вопросы и устранение неполадок (выполнено)
- **Интеграция инструментов**: улучшенные руководства по интеграции IDE и редакторов
- ✅ **Расширение мониторинга**: AI-специфические шаблоны мониторинга и оповещения (выполнено)

#### Все еще планируется для будущего выпуска
- **Мобильная версия документации**: адаптивный дизайн для мобильного обучения
- **Офлайн-доступ**: пакеты документации для загрузки
- **Улучшенная интеграция IDE**: расширение VS Code для AZD + AI-рабочих процессов
- **Панель сообщества**: метрики сообщества в реальном времени и отслеживание вклада

## Внесение изменений в список изменений

### Сообщение об изменениях
При внесении изменений в этот репозиторий, пожалуйста, обеспечьте включение в список изменений:

1. **Номер версии**: согласно семантическому версионированию (major.minor.patch)
2. **Дата**: дата выпуска или обновления в формате ГГГГ-ММ-ДД
3. **Категория**: Добавлено, Изменено, Устарело, Удалено, Исправлено, Безопасность
4. **Четкое описание**: краткое описание изменений
5. **Оценка влияния**: как изменения повлияют на существующих пользователей

### Категории изменений

#### Добавлено
- Новые функции, разделы документации или возможности
- Новые примеры, шаблоны или обучающие материалы
- Дополнительные инструменты, скрипты или утилиты

#### Изменено
- Изменения существующего функционала или документации
- Обновления для улучшения ясности или точности
- Реструктуризация содержимого или организации

#### Устарело
- Функции или подходы, которые постепенно выводятся из эксплуатации
- Разделы документации, запланированные к удалению
- Методы, для которых есть лучшие альтернативы

#### Удалено
- Функции, документация или примеры, которые больше не актуальны
- Устаревшая информация или устаревшие подходы
- Избыточный или объединенный контент

#### Исправлено
- Исправления ошибок в документации или коде
- Решение выявленных проблем
- Улучшения точности или функциональности

#### Безопасность
- Улучшения или исправления, связанные с безопасностью
- Обновления лучших практик безопасности
- Устранение уязвимостей безопасности

### Руководство по семантическому версионированию

#### Основная версия (X.0.0)
- Значительные изменения, требующие действий от пользователя
- Существенная реструктуризация содержания или организации
- Изменения, изменяющие фундаментальный подход или методологию

#### Минорная версия (X.Y.0)
- Новые функции или дополнения в содержании
- Улучшения с сохранением обратной совместимости
- Дополнительные примеры, инструменты или ресурсы

#### Патч-версия (X.Y.Z)
- Исправления ошибок и коррекции
- Незначительные улучшения существующего содержания
- Уточнения и небольшие улучшения

## Обратная связь и предложения сообщества

Мы активно поощряем обратную связь от сообщества для улучшения этого учебного ресурса:

### Как предоставить обратную связь
- **GitHub Issues**: Сообщайте о проблемах или предлагайте улучшения (приветствуются вопросы, связанные с ИИ)
- **Обсуждения в Discord**: Делитесь идеями и общайтесь с сообществом Microsoft Foundry
- **Pull Requests**: Вносите прямые улучшения в контент, особенно шаблоны и руководства по ИИ
- **Microsoft Foundry Discord**: Участвуйте в канале #Azure для обсуждения AZD + ИИ
- **Форумы сообщества**: Участвуйте в более широких обсуждениях разработчиков Azure

### Категории обратной связи
- **Точность контента ИИ**: Исправления информации об интеграции и развертывании сервисов ИИ
- **Опыт обучения**: Предложения по улучшению процесса обучения разработчиков ИИ
- **Отсутствующий контент по ИИ**: Запросы на дополнительные шаблоны, паттерны или примеры ИИ
- **Доступность**: Улучшения для разнообразных учебных потребностей
- **Интеграция инструментов ИИ**: Предложения по лучшей интеграции рабочих процессов разработки ИИ
- **Паттерны промышленного ИИ**: Запросы на паттерны развертывания корпоративного ИИ

### Обязательство по ответам
- **Реакция на проблемы**: В течение 48 часов после сообщения о проблемах
- **Запросы функций**: Рассмотрение в течение одной недели
- **Вклад сообщества**: Рассмотрение в течение одной недели
- **Проблемы безопасности**: Приоритетное срочное рассмотрение и ответ

## График обслуживания

### Регулярные обновления
- **Ежемесячные проверки**: Точность контента и проверка ссылок
- **Квартальные обновления**: Существенные дополнения и улучшения контента
- **Полугодовые обзоры**: Комплексная реструктуризация и улучшение
- **Ежегодные релизы**: Обновления главных версий с существенными улучшениями

### Мониторинг и обеспечение качества
- **Автоматическое тестирование**: Регулярная проверка примеров кода и ссылок
- **Интеграция обратной связи сообщества**: Регулярное включение предложений пользователей
- **Обновления технологий**: Соответствие последним сервисам Azure и релизам azd
- **Аудиты доступности**: Регулярный обзор принципов инклюзивного дизайна

## Политика поддержки версий

### Поддержка текущих версий
- **Последняя основная версия**: Полная поддержка с регулярными обновлениями
- **Предыдущая основная версия**: Обновления безопасности и критические исправления в течение 12 месяцев
- **Устаревшие версии**: Только поддержка сообщества, официальных обновлений нет

### Руководство по миграции
При выпуске основных версий мы предоставляем:
- **Руководства по миграции**: Пошаговые инструкции по переходу
- **Примечания о совместимости**: Детали о несоответствиях и критических изменениях
- **Поддержка инструментов**: Скрипты или утилиты для помощи при миграции
- **Поддержка сообщества**: Специализированные форумы для вопросов по миграции

---

**Навигация**
- **Предыдущий урок**: [Учебное руководство](resources/study-guide.md)
- **Следующий урок**: Вернуться к [Основному README](README.md)

**Будьте в курсе**: Подпишитесь на репозиторий, чтобы получать уведомления о новых выпусках и важных обновлениях учебных материалов.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->