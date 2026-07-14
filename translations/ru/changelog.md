# Журнал изменений - AZD для начинающих

## Введение

Этот журнал изменений документирует все заметные изменения, обновления и улучшения репозитория AZD для начинающих. Мы следуем принципам семантического версионирования и ведем этот журнал, чтобы помочь пользователям понять, что изменилось между версиями.

## Цели обучения

Ознакомившись с этим журналом изменений, вы сможете:
- Оставаться в курсе новых функций и добавления контента
- Понимать улучшения существующей документации
- Отслеживать исправления ошибок и корректировки для обеспечения точности
- Следить за эволюцией учебных материалов со временем

## Результаты обучения

После изучения записей журнала изменений вы сможете:
- Определять новый доступный контент и ресурсы для обучения
- Понимать, какие разделы были обновлены или улучшены
- Планировать свой учебный путь на основе самых актуальных материалов
- Вносить отзывы и предложения по будущим улучшениям

## История версий

### [v3.23.0] - 2026-07-13

#### Обновление AZD 1.27.1: Поддержка актуальной версии
**Эта версия повторно проверяет курс с `azd` `1.27.1` (июль 2026, последняя стабильная версия) и текущим предпросмотром расширения AI агента `azure.ai.agents` `1.0.0-beta.5`, обновляя все баннеры "проверено на" после выпусков 1.26.0, 1.27.0 и 1.27.1.**

#### Изменено
- **✅ Базовая версия валидации обновлена** с `azd 1.25.6` (июнь 2026) на `azd 1.27.1` (июль 2026) в основном README, всех глава READMEs, уроке создания dev-контейнера в Главе 1 (включая примеры с закреплёнными версиями), уроках с пользовательскими шаблонами Главы 4, уроке с несколькими агентами Главы 5 и документации по воркшопу
- **🤖 Базовая версия главы 2 обновлена** с `azd 1.23.12` (март 2026) на `azd 1.27.1` в `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` и `microsoft-foundry-integration.md`; даты замечаний о валидации обновлены на 2026-07-13
- **🧩 Расширение AI агента обновлено** с `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` до текущего релиза `1.0.0-beta.5` в README Главы 2 и в `agents.md`
- **🧪 Пример проверки воркшопа** (вывод `azd version`) обновлен до `1.27.1`

#### Примечания по релизам azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Поддержка Go для Azure Functions на Flex Consumption, фильтры подписок `azd config sub-filter` по арендаторам, автономные пакеты расширений (`azd x pack --bundle`), и `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Моделирование проектов/агентов Azure AI Foundry напрямую в `azure.yaml` (инициализация без Bicep/Terraform), поддержка развертывания контейнеров для App Service (`host: appservice` + `language: docker`), прямой `-s/--source` для команд `azd extension`, и `azd tool uninstall`
- **1.27.1 (2026-07-09):** Флаг `--no-dependencies` для `azd extension install`, устаревшие модели по умолчанию исключены из запросов каталога/квоты, и несколько исправлений ошибок

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

#### Заполнение пропусков для начинающих №2: Создание шаблонов, Dev Containers, Pulumi, Azure DevOps, сервисные принципы и многое другое
**Эта версия закрывает оставшиеся промежуточные пробелы, выявленные анализом покрытия azd: как создавать и публиковать собственные шаблоны, воспроизводимые окружения dev-контейнеров/Codespaces, провайдер инфраструктуры Pulumi, пошаговое руководство по Azure DevOps CI/CD, аутентификация сервис-принципалов, рекомендации по выбору хостов (AKS/Spring Apps), объяснения команд `azd restore`/`azd package`, обработка ошибок хуков и практика командной/общей среды.**

#### Добавлено
- **🧱 Новый урок главы 4** `docs/chapter-04-infrastructure/custom-templates.md` — создание собственного шаблона azd: требуемая структура (`azure.yaml`, `infra/`, `src/`), поле `metadata.template`, параметризация инфраструктуры с помощью токена ресурса `uniqueString()` и тега `azd-env-name`, локальное тестирование с `azd init --template <local-path>`, публикация на GitHub и подача в галерею Awesome AZD
- **📦 Новый урок главы 1** `docs/chapter-01-foundation/dev-containers.md` — воспроизводимые azd окружения с Dev Containers и GitHub Codespaces: минимальный `.devcontainer/devcontainer.json` с использованием официальной функции `ghcr.io/azure/azure-dev/azd`, языковые особенности, `docker-in-docker` для хостов контейнеров и `azd auth login --use-device-code` для удаленного входа
- **🧩 Раздел Pulumi с azd** в `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, структура папок Pulumi, стеки, сопоставленные с окружениями azd, необходимые выводы/теги и идентичный рабочий процесс `azd up` / `azd down`
- **🎯 Руководство по выбору хоста** в `docs/chapter-04-infrastructure/provisioning.md` — понятное для начинающих сравнение `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` и `springapp` с рекомендациями, когда выбирать AKS или Azure Spring Apps
- **🛠️ Пошаговое руководство Azure DevOps CI/CD** в `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, соединение службы с федерацией идентичности нагрузки (OIDC), сгенерированный `azure-dev.yml` и настройка групп переменных
- **🔑 Сервисные принципы (паттерн 4)** добавлены в `docs/chapter-03-configuration/authsecurity.md` — создание `az ad sp create-for-rbac`, неинтерактивный вход `azd auth login` с клиентским секретом или федеративными/OIDC учетными данными, когда использовать и безопасное хранение данных
- **🪝 Обработка ошибок хуков** подраздел в `docs/chapter-04-infrastructure/deployment-guide.md` — коды выхода и `set -e`, `continueOnError`, тестирование хуков изолированно с `azd hooks run`, ОС-специфические оболочки и `--debug`
- **👥 Командные/совместные окружения** раздел в `docs/chapter-03-configuration/configuration.md` — что хранится в `.azure/`, что игнорировать в Git, индивидуальные окружения разработчиков, команды `azd env list`/`select` и передача значений окружения в CI/CD
- **🧰 Объяснения `azd restore` и расширенной команды `azd package`** в `resources/cheat-sheet.md` — восстановление зависимостей и создание артефакта для развертывания без фактического развертывания

#### Изменено
- **🧭 Таблица уроков главы 4** обновлена для включения нового урока "Создание собственного шаблона" (Урок 3)
- **🧭 Таблица уроков главы 1** обновлена для включения нового урока "Dev Containers & Codespaces" (Урок 5); добавлена навигация между `bring-your-own-app.md` и `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Заполнение пропусков для начинающих: Практический урок по многопользовательским агентам, "Принеси свое приложение", Terraform и руководство CI/CD
**Эта версия закрывает основные пробелы в полном руководстве для начинающих, добавляя два новых практических урока (пошаговое развертывание нескольких агентов и добавление azd к существующему приложению), введение в хуки для начинающих, раздел Terraform с azd, пошаговое руководство GitHub Actions, объяснение новых расширений предпросмотра и явный чеклист для подтверждения развертывания.**

#### Добавлено
- **🤝 Новый урок главы 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — полностью практическое, развертываемое руководство по двум агентам (оркестратор + специалисты) с использованием реального шаблона (`contoso-creative-writer`), покрывающее случаи использования мультиагентов, рабочий процесс `azd up`, понимание развернутых ресурсов, межагентное трассирование, настройку и очистку
- **📦 Новый урок главы 1** `docs/chapter-01-foundation/bring-your-own-app.md` — как добавить azd к существующему проекту через `azd init` ("использовать код в текущем каталоге"), понимание `azure.yaml` и `infra/`, `azd infra generate`, определение хоста и развертывание с помощью `azd up`
- **🌐 Раздел Terraform с azd** добавлен в `docs/chapter-04-infrastructure/provisioning.md` — конфигурация `infra.provider: terraform`, структура папок `.tf`, обязательные выходные данные `AZURE_*` и тегирование `azd-env-name`, идентичный рабочий процесс `azd up` / `azd down` (закрывает пробел, где поддержка Terraform была заявлена, но показан только Bicep)
- **⚙️ Пошаговое руководство GitHub Actions** в `docs/chapter-08-production/production-ai-practices.md` — от репозитория GitHub до автоматических развертываний: `azd pipeline config`, федеративные учетные данные OIDC (без сохраненных секретов), сгенерированный файл `azure-dev.yml` и рекомендации по секретам и переменным
- **🪝 Введение для начинающих "Новичок в хуках?"** в `docs/chapter-04-infrastructure/deployment-guide.md` — что такое хук, таблица этапов хуков, минимальный первый хук и ручной запуск хуков с `azd hooks run`
- **✅ Чеклист "Проверьте развертывание"** добавлен к шагу 5 в `docs/chapter-01-foundation/first-project.md` — дымовой тест, проверка конечной точки состояния и явные критерии успеха
- **🧩 Объяснение новых расширений предпросмотра** `azure.ai.skills` и `azure.ai.connections` (что это такое и когда их использовать) в `docs/chapter-08-production/production-ai-practices.md`

#### Изменено
- **🧭 Таблица уроков главы 5** исправлена: `multi-agent-basics.md` теперь Урок 1 (единственный полностью практический урок), с честным указанием, что Урок 2 находится в Главе 6, а сценарий Retail — это архитектурный план, а не шаблон с одной командой
- **🧭 Таблица уроков главы 1** теперь включает новый урок "Принеси свое приложение" (Урок 4)
- **🔗 Навигационные футеры** обновлены: `first-project.md` теперь содержит ссылку вперед на `bring-your-own-app.md`

#### Исправлено
- **🧱 Закрыта "заявленная, но отсутствующая" поддержка Terraform** — ранее в курсе упоминалась поддержка Terraform, но не показывалась
- **🔀 Исправлены вводящие в заблуждение перекрестные ссылки в главе 5**, которые создавали впечатление о полном мультиагентном решении, хотя был только архитектурный план

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

#### Обновление AZD 1.25.6, Полные команды жизненного цикла агента и ребрендинг Aspire

**Эта версия повторно проверяет курс на соответствие `azd` `1.25.6` (июнь 2026) и расширению `azure.ai.agents` `0.1.40-preview`, расширяет руководство по ИИ от "создания агента" до полного жизненного цикла агента (тестирование → оценка → оптимизация → проверка → удаление), представляет новые предварительные расширения `azure.ai.skills` и `azure.ai.connections`, а также отмечает ребрендинг продукта ".NET Aspire" в "Aspire".**

#### Добавлено
- **🔁 Полное покрытие жизненного цикла агента** для начинающих и инженеров ИИ во всей документации:
  - `docs/chapter-01-foundation/azd-basics.md` — Добавлена таблица жизненного цикла (создание → тест → измерение → улучшение → проверка → очистка) в раздел Расширения и команды ИИ
  - `docs/chapter-08-production/production-ai-practices.md` — Новый раздел "Управление жизненным циклом агента", охватывающий команды `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
  - `resources/cheat-sheet.md` — Расширенный раздел команд агента ИИ с добавлением `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` и `delete --force`
- **🧩 Документированы новые предварительные расширения**: `azure.ai.skills` (повторно используемые навыки агента) и `azure.ai.connections` (подключения Foundry), добавлены в таблицу расширений и шпаргалку
- **⏱️ Руководство по времени отклика** — в примерах `azd ai agent invoke` теперь указывается общее время задержки и время до первого байта
- **📌 Баннер версии** в корневом README, указывающий обучающимся на команды `azd version` и `azd upgrade`

#### Изменено
- **✅ Обновлена базовая версия для проверки** с `azd 1.23.12` (март 2026) на `azd 1.25.6` (июнь 2026) во всех README глав и документации мастерской
- **🤖 Обновлено примечание о расширении для главы 2** с `azure.ai.agents` `0.1.18-preview` до `0.1.40-preview`
- **🧪 Обновлен пример проверки в мастерской** (вывод `azd version`) до `1.25.6`
- **🧭 README "Что нового в azd сегодня"** обновлен для акцентирования полного жизненного цикла агента, новых расширений ИИ и недавних улучшений удобства (`azd init` идемпотентность, очистка устаревших токенов в `azd auth login`, подсказка при первом запуске `azd tool`)
- **📖 В главе 2 (agents.md, вариант 4)** теперь обучающимся предложены команды жизненного цикла после развертывания вместо остановки на `azd up`

#### Исправлено
- **🏷️ Название продукта** — добавлена заметка о ребрендинге Aspire (".NET Aspire" теперь просто "Aspire"); поддержка Aspire в azd без изменений
- **🔎 Проверка выпуска вживую** подтверждена на основе каналов выпуска Azure Developer CLI: стабильный CLI `1.25.6` (2026-06-12) и `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Уточнение при вводе для начинающих, проверка настройки и очистка команд AZD
**Эта версия следует за проверкой AZD 1.23, с упором на документацию для начинающих: уточняет руководство по аутентификации через AZD, добавляет локальные сценарии проверки настройки, проверяет ключевые команды на живом CLI AZD и удаляет последние устаревшие ссылки на команды на английском вне файла изменений.**

#### Добавлено
- **🧪 Сценарии проверки настройки для начинающих** с `validate-setup.ps1` и `validate-setup.sh`, чтобы обучающиеся могли подтвердить наличие необходимых инструментов перед началом Главы 1
- **✅ Этапы проверки настройки в корневом README и README Главы 1**, чтобы отсутствующие требования были выявлены до выполнения `azd up`

#### Изменено
- **🔐 Руководство по аутентификации для начинающих** теперь последовательно рассматривает `azd auth login` как основной путь для рабочих процессов AZD, а `az login` отмечается как дополнительный, если используются команды Azure CLI напрямую
- **📚 Поток вступления в Главу 1** теперь направляет обучающихся проверить локальную настройку перед установкой, аутентификацией и первыми шагами развертывания
- **🛠️ Сообщения валидатора** теперь четко отделяют блокирующие требования от необязательных предупреждений Azure CLI для пути начинающего только через AZD
- **📖 Документация по конфигурации, устранению неполадок и примерам** теперь различает обязательную аутентификацию через AZD и необязательный вход через Azure CLI, где ранее оба варианта были представлены без контекста

#### Исправлено
- **📋 Оставшиеся ссылки на команды из английского исходника** обновлены до текущих форм AZD, включая `azd config show` в шпаргалке и `azd monitor --overview` там, где предполагалась обзорная информация по Azure Portal
- **🧭 Заявления для начинающих в Главе 1** смягчены, чтобы не обещать гарантированное отсутствие ошибок или откат по всем шаблонам и ресурсам Azure
- **🔎 Проверка CLI вживую** подтверждает текущую поддержку команд `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` и `azd down --force --purge`

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

#### Проверка версии AZD 1.23.12, расширение среды мастерской и обновление модели ИИ
**Эта версия выполняет проверку документации на соответствие `azd` `1.23.12`, обновляет устаревшие примеры команд AZD, обновляет руководство по моделям ИИ до текущих настроек по умолчанию и расширяет инструкции мастерской за пределы GitHub Codespaces, добавляя поддержку dev-контейнеров и локальных копий.**

#### Добавлено
- **✅ Заметки о проверке по основным главам и документации мастерской** для явного указания тестируемой базовой версии AZD пользователям с новыми или старыми сборками CLI
- **⏱️ Руководство по таймауту развертывания** длительных развертываний приложений ИИ с использованием `azd deploy --timeout 1800`
- **🔎 Шаги проверки расширений** с командой `azd extension show azure.ai.agents` в документации по рабочему процессу ИИ
- **🌐 Расширенные рекомендации по среде мастерской**, охватывающие GitHub Codespaces, dev-контейнеры и локальные копии с MkDocs

#### Изменено
- **📚 Вступительные README глав** теперь последовательно указывают проверку на `azd 1.23.12` по разделам: основы, конфигурация, инфраструктура, мультиагенты, предразвертывание, устранение неполадок и производство
- **🛠️ Ссылки на команды AZD** обновлены до текущих форм во всей документации:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` или `azd env get-value(s)` в зависимости от контекста
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` там, где предполагается обзор Application Insights
- **🧪 Упрощённые примеры preview-предоставления** до поддерживаемого синтаксиса, например `azd provision --preview` и `azd provision --preview -e production`
- **🧭 Поток мастерской** обновлён, чтобы обучающиеся могли выполнять лабораторные работы в Codespaces, dev-контейнере или локальной копии, а не только в Codespaces
- **🔐 Руководство по аутентификации** теперь отдаёт предпочтение `azd auth login` для рабочих процессов AZD, а `az login` позиционируется как дополнительный при прямом использовании Azure CLI

#### Исправлено
- **🪟 Команды установки для Windows** нормализованы с учётом текущего регистра пакетов `winget` в руководстве по установке
- **🐧 Руководство по установке для Linux** исправлено для исключения неподдерживаемых инструкций по пакетному менеджеру `azd` для конкретных дистрибутивов и предлагает использовать релизные артефакты по необходимости
- **📦 Примеры моделей ИИ** обновлены с устаревших по умолчанию (`gpt-35-turbo`, `text-embedding-ada-002`) до текущих, таких как `gpt-4.1-mini`, `gpt-4.1` и `text-embedding-3-large`
- **📋 Фрагменты развертывания и диагностики** исправлены для использования актуальных команд работы с окружением и статусом в логах, скриптах и шагах устранения неполадок
- **⚙️ Руководство GitHub Actions** обновлено с `Azure/setup-azd@v1.0.0` до `Azure/setup-azd@v2`
- **🤖 Руководство по согласиям MCP/Copilot** обновлено с `azd mcp consent` до `azd copilot consent list`

#### Улучшено
- **🧠 Руководство по главе ИИ** теперь лучше объясняет поведение предварительного просмотра `azd ai`, особенности входа для арендаторов, текущие методы использования расширений и обновлённые рекомендации по развертыванию моделей
- **🧪 Инструкции мастерской** теперь используют более реалистичные версии примеров и ясный язык настройки окружения для практических лабораторных
- **📈 Документация по производству и устранению неполадок** теперь лучше согласована с текущими примерами мониторинга, запасных моделей и уровней стоимости

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
**Эта версия добавляет покрытие команд `azd ai`, `azd extension` и `azd mcp` во всех главах, связанных с ИИ, исправляет сломанные ссылки и устаревший код в agents.md, обновляет шпаргалку и полностью перерабатывает раздел Примеров шаблонов с проверенными описаниями и новыми Azure AI AZD шаблонами.**

#### Добавлено
- **🤖 Покрытие AZD AI CLI** в 7 файлах (ранее только в главе 8):
  - `docs/chapter-01-foundation/azd-basics.md` — новый раздел "Расширения и команды ИИ", вводящий `azd extension`, `azd ai agent init` и `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — вариант 4: `azd ai agent init` с таблицей сравнения (шаблон против манифеста)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — подразделы "Расширения AZD для Foundry" и "Развертывание с акцентом на агента"

  - `docs/chapter-05-multi-agent/README.md` — Быстрый старт теперь показывает оба пути развертывания: на основе шаблона и манифеста
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — В разделе развертывания теперь доступна опция `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Подраздел "Команды расширения AZD AI для диагностики"
  - `resources/cheat-sheet.md` — Новый раздел "Команды AI и расширений" с командами `azd extension`, `azd ai agent init`, `azd mcp` и `azd infra generate`
- **📦 Новые примерные шаблоны AZD AI** в `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — чат RAG на .NET с Blazor WebAssembly, Semantic Kernel и поддержкой голосового чата
  - **azure-search-openai-demo-java** — чат RAG на Java с использованием Langchain4J и вариантами развертывания на ACA/AKS
  - **contoso-creative-writer** — многопользовательское приложение для творческого письма с использованием Azure AI Agent Service, Bing Grounding и Prompty
  - **serverless-chat-langchainjs** — серверлесс RAG с Azure Functions + LangChain.js + Cosmos DB с поддержкой локальной разработки Ollama
  - **chat-with-your-data-solution-accelerator** — корпоративный акселератор RAG с административным порталом, интеграцией Teams и вариантами на PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — эталонное приложение для оркестрации многопользовательского MCP с серверами на .NET, Python, Java и TypeScript
  - **azd-ai-starter** — минимальный стартовый шаблон инфраструктуры Azure AI на Bicep
  - **🔗 Ссылка на галерею Awesome AZD AI** — ссылка на [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (более 80 шаблонов)

#### Исправлено
- **🔗 навигация в agents.md**: ссылки "Предыдущая/Следующая" теперь соответствуют порядку уроков в README главы 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 битые ссылки в agents.md**: исправлено `production-ai-practices.md` на `../chapter-08-production/production-ai-practices.md` (3 вхождения)
- **📦 устаревший код в agents.md**: заменён `opencensus` на `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 неверный API в agents.md**: параметр `max_tokens` перенесён из `create_agent()` в `create_run()` как `max_completion_tokens`
- **🔢 подсчёт токенов в agents.md**: грубая оценка `len//4` заменена на `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: исправлены сервисы с "Cognitive Search + App Service" на "Azure AI Search + Azure Container Apps" (дефолтный хост изменён в октябре 2024)
- **contoso-chat**: обновлено описание с ссылкой на Azure AI Foundry + Prompty, соответствующее реальному названию и технологическому стеку репозитория

#### Удалено
- **ai-document-processing**: удалена неработающая ссылка на шаблон (репозиторий не доступен публично как шаблон AZD)

#### Улучшено
- **📝 упражнения в agents.md**: упражнение 1 теперь показывает ожидаемый вывод и шаг `azd monitor`; упражнение 2 включает полный код регистрации `FunctionTool`; упражнение 3 заменяет размытые указания конкретными командами `prepdocs.py`
- **📚 ресурсы в agents.md**: обновлены ссылки на документацию по Azure AI Agent Service и быстрый старт
- **📋 таблица Следующие шаги в agents.md**: добавлена ссылка на AI Workshop Lab для полного покрытия главы

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
**В этой версии улучшена навигация по главам README.md с помощью улучшенного формата таблицы.**

#### Изменено
- **Таблица карты курса**: улучшена с прямыми ссылками на уроки, оценкой длительности и уровнем сложности
- **Очистка папок**: удалены избыточные старые папки (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Проверка ссылок**: проверены все 21+ внутренних ссылок в таблице карты курса

### [v3.16.0] - 2026-02-05

#### Обновления названий продуктов
**В этой версии обновлены упоминания продуктов согласно текущему брендингу Microsoft.**

#### Изменено
- **Microsoft Foundry → Microsoft Foundry**: все упоминания обновлены в непереводимых файлах
- **Azure AI Agent Service → Foundry Agents**: обновлено название сервиса согласно текущему брендингу

#### Обновлённые файлы
- `README.md` - главная страница курса
- `changelog.md` - история версий
- `course-outline.md` - структура курса
- `docs/chapter-02-ai-development/agents.md` - руководство по агентам AI
- `examples/README.md` - документация с примерами
- `workshop/README.md` - главная страница воркшопа
- `workshop/docs/index.md` - индекс воркшопа
- `workshop/docs/instructions/*.md` - все файлы с инструкциями воркшопа

---

### [v3.15.0] - 2026-02-05

#### Крупное изменение структуры репозитория: папки по главам
**В этой версии документация реорганизована в выделенные папки по главам для удобства навигации.**

#### Переименование папок
Старые папки заменены на папки с номерами глав:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Добавлена новая: `docs/chapter-05-multi-agent/`

#### Перемещение файлов
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
| Все файлы предразвертывания | pre-deployment/ | chapter-06-pre-deployment/ |
| Все файлы устранения неполадок | troubleshooting/ | chapter-07-troubleshooting/ |

#### Добавлено
- **📚 Файлы README глав**: Создан README.md в каждой папке главы с:
  - Целями обучения и продолжительностью
  - Таблицей уроков с описаниями
  - Командами быстрого старта
  - Навигацией к другим главам

#### Изменено
- **🔗 Обновлены все внутренние ссылки**: Обновлено более 78 путей во всех документационных файлах
- **🗺️ Главный README.md**: Обновлена карта курса с новой структурой глав
- **📝 examples/README.md**: Обновлены перекрестные ссылки на папки глав

#### Удалено
- Старая структура папок (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Реструктуризация репозитория: навигация по главам
**В этой версии добавлены файлы README для навигации по главам (заменены версией v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Новый гид по агентам ИИ
**Эта версия добавляет полный гид по развертыванию агентов ИИ с помощью Azure Developer CLI.**

#### Добавлено
- **🤖 docs/microsoft-foundry/agents.md**: Полный гид, охватывающий:
  - Что такое агенты ИИ и чем они отличаются от чатботов
  - Три шаблона агентов для быстрого старта (Foundry Agents, Prompty, RAG)
  - Паттерны архитектуры агентов (одиночный агент, RAG, мультиагент)
  - Конфигурация и настройка инструментов
  - Мониторинг и отслеживание метрик
  - Вопросы стоимости и оптимизации
  - Общие сценарии устранения неполадок
  - Три практических упражнения с критериями успеха

#### Структура контента
- **Введение**: Концепции агентов для начинающих
- **Быстрый старт**: Развертывание агентов с помощью `azd init --template get-started-with-ai-agents`
- **Паттерны архитектуры**: Визуальные диаграммы паттернов агентов
- **Конфигурация**: Настройка инструментов и переменные окружения
- **Мониторинг**: Интеграция с Application Insights
- **Упражнения**: Пошаговое практическое обучение (20-45 минут каждое)

---

### [v3.12.0] - 2026-02-05

#### Обновление среды DevContainer
**Эта версия обновляет конфигурацию контейнера для разработки современными инструментами и лучшими настройками по умолчанию для опыта обучения AZD.**

#### Изменено
- **🐳 Базовый образ**: Обновлен с `python:3.12-bullseye` на `python:3.12-bookworm` (последний стабильный Debian)
- **📛 Имя контейнера**: Переименован с "Python 3" в "AZD для начинающих" для ясности

#### Добавлено
- **🔧 Новые функции контейнера разработки**:
  - `azure-cli` с поддержкой Bicep
  - `node:20` (LTS версия для шаблонов AZD)
  - `github-cli` для управления шаблонами
  - `docker-in-docker` для развертывания контейнерных приложений

- **🔌 Проброс портов**: Преднастроенные порты для распространенной разработки:
  - 8000 (предпросмотр MkDocs)
  - 3000 (веб-приложения)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Новые расширения VS Code**:
  - `ms-python.vscode-pylance` - Расширенный IntelliSense для Python
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

- **📦 Обновлен requirements-dev.txt**:
  - Добавлен плагин минификации MkDocs
  - Добавлен pre-commit для качества кода
  - Добавлены пакеты Azure SDK (azure-identity, azure-mgmt-resource)

#### Исправлено
- **Команда Post-Create**: Теперь проверяет установку AZD и Azure CLI при запуске контейнера

---

### [v3.11.0] - 2026-02-05

#### Переработка README для начинающих
**В этой версии README.md значительно улучшен для доступности новичкам и добавлены важные ресурсы для разработчиков ИИ.**

#### Добавлено
- **🆚 Сравнение Azure CLI и AZD**: Четкое объяснение, когда использовать каждый инструмент с практическими примерами
- **🌟 Ссылки Awesome AZD**: Прямые ссылки на галерею шаблонов сообщества и ресурсы для вкладов:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Более 200 готовых к развертыванию шаблонов
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Вклад сообщества
- **🎯 Руководство быстрого старта**: Упрощенный трехшаговый раздел начала работы (Установка → Вход → Развертывание)
- **📊 Таблица навигации на основе опыта**: Четкие рекомендации, с чего начать в зависимости от опыта разработчика

#### Изменено
- **Структура README**: Реорганизована для постепенного раскрытия - ключевая информация первой
- **Раздел введения**: Переписан для объяснения «Магии `azd up`» для абсолютных новичков
- **Удалено дублирующееся содержимое**: Удален дублирующий раздел по устранению неполадок

- **Команды устранения неполадок**: Исправлена ссылка `azd logs` на корректное использование `azd monitor --logs`

#### Исправлено

- **🔐 Команды аутентификации**: Добавлены `azd auth login` и `azd auth logout` в cheat-sheet.md
- **Неверные ссылки на команды**: Удалены оставшиеся `azd logs` в разделе устранения неполадок README

#### Заметки
- **Область применения**: Изменения применены к основному README.md и resources/cheat-sheet.md
- **Целевая аудитория**: Улучшения ориентированы на разработчиков, начинающих работу с AZD

---

### [v3.10.0] - 2026-02-05

#### Обновление точности команд Azure Developer CLI
**В этой версии исправлены несуществующие команды AZD во всей документации, гарантируя, что все примеры кода используют корректный синтаксис Azure Developer CLI.**

#### Исправлено
- **🔧 Удалены несуществующие команды AZD**: Полный аудит и исправление недействительных команд:
  - `azd logs` (не существует) → заменён на `azd monitor --logs` или альтернативы Azure CLI
  - подкоманды `azd service` (не существуют) → заменены на `azd show` и Azure CLI
  - `azd infra import/export/validate` (не существуют) → удалены или заменены валидными альтернативами
  - флаги `azd deploy --rollback/--incremental/--parallel/--detect-changes` (не существуют) → удалены
  - флаги `azd provision --what-if/--rollback` (не существуют) → обновлены на использование `--preview`
  - `azd config validate` (не существует) → заменён на `azd config list`
  - `azd info`, `azd history`, `azd metrics` (не существуют) → удалены

- **📚 Файлы обновлены с исправлениями команд**:
  - `resources/cheat-sheet.md`: Крупное обновление справочника команд
  - `docs/deployment/deployment-guide.md`: Исправлены стратегии отката и развертывания
  - `docs/troubleshooting/debugging.md`: Исправлены разделы анализа логов
  - `docs/troubleshooting/common-issues.md`: Обновлены команды для устранения неполадок
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправлен раздел отладки AZD
  - `docs/getting-started/azd-basics.md`: Исправлены команды мониторинга
  - `docs/getting-started/first-project.md`: Обновлены примеры мониторинга и отладки
  - `docs/getting-started/installation.md`: Исправлены примеры помощи и версии
  - `docs/pre-deployment/application-insights.md`: Исправлены команды просмотра логов
  - `docs/pre-deployment/coordination-patterns.md`: Исправлены команды отладки агента

- **📝 Обновлена версия ссылки**:
  - `docs/getting-started/installation.md`: Заменена жестко заданная версия `1.5.0` на универсальную `1.x.x` с ссылкой на релизы

#### Изменено
- **Стратегии отката**: Обновлена документация с использованием Git-отката (в AZD нет нативного отката)
- **Просмотр логов**: Заменены ссылки `azd logs` на `azd monitor --logs`, `azd monitor --live` и команды Azure CLI
- **Секция производительности**: Удалены несуществующие флаги параллельного/инкрементного развертывания, предоставлены допустимые альтернативы

#### Технические детали
- **Действительные команды AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Действительные флаги azd monitor**: `--live`, `--logs`, `--overview`
- **Удалённый функционал**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Заметки
- **Проверка**: Команды проверены на соответствие Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Завершение мастерской и обновление качества документации
**В этой версии завершены интерактивные модули мастерской, исправлены все сломанные ссылки в документации и улучшено общее качество контента для разработчиков ИИ с использованием Microsoft AZD.**

#### Добавлено
- **📝 CONTRIBUTING.md**: Новый документ с руководством по внесению вклада:
  - Чёткие инструкции по отчету об ошибках и предложениям изменений
  - Стандарты документации для нового контента
  - Руководство по примерам кода и соглашениям сообщений коммитов
  - Информация о вовлечении сообщества

#### Завершено
- **🎯 Модуль мастерской 7 (Заключение)**: Полностью завершённый завершающий модуль с:
  - Подробным резюме достижений мастерской
  - Разделом ключевых изученных концепций AZD, шаблонов и Microsoft Foundry
  - Рекомендациями для продолжения обучения
  - Упражнениями по вызовам мастерской с оценкой сложности
  - Ссылками на отзывы и поддержку сообщества

- **📚 Модуль мастерской 3 (Декомпозиция)**: Обновлены цели обучения с:
  - Руководством по активации GitHub Copilot с серверами MCP
  - Пониманием структуры папок шаблонов AZD
  - Паттернами организации инфраструктуры как кода (Bicep)
  - Инструкциями по практическим занятиям

- **🔧 Модуль мастерской 6 (Разбор)**: Завершённый с:
  - Целями по очистке ресурсов и управлению затратами
  - Использованием `azd down` для безопасного снятия инфраструктуры
  - Руководством по восстановлению мягко удалённых когнитивных сервисов
  - Бонусными заданиями по GitHub Copilot и Azure Portal

#### Исправлено
- **🔗 Исправление сломанных ссылок**: Устранены 15+ сломанных внутренних ссылок в документации:
  - `docs/ai-foundry/ai-model-deployment.md`: Исправлены пути к microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Исправлены пути ai-model-deployment.md и production-ai-practices.md
  - `docs/getting-started/first-project.md`: Заменён несуществующий cicd-integration.md на deployment-guide.md
  - `examples/retail-scenario.md`: Исправлены пути FAQ и руководства по устранению неполадок
  - `examples/container-app/microservices/README.md`: Исправлены пути к главной странице курса и руководству по развертыванию
  - `resources/faq.md` и `resources/glossary.md`: Обновлены ссылки на разделы ИИ
  - `course-outline.md`: Исправлены ссылки на руководство преподавателя и лабораторные работы ИИ

- **📅 Баннер статуса мастерской**: Обновлён с "В разработке" на активный статус на февраль 2026

- **🔗 Навигация по мастерской**: Исправлены сломанные навигационные ссылки в README мастерской, указывающие на несуществующую папку lab-1-azd-basics

#### Изменено
- **Презентация мастерской**: Удалено предупреждение "в разработке", мастерская теперь завершена и готова к использованию
- **Согласованность навигации**: Обеспечена правильная межмодульная навигация во всех модулях мастерской
- **Ссылки на учебный путь**: Обновлены перекрёстные ссылки на главы с использованием правильных путей microsoft-foundry

#### Проверено
- ✅ Все английские markdown-файлы содержат правильные внутренние ссылки
- ✅ Модули мастерской 0-7 завершены с учётом целей обучения
- ✅ Навигация между главами и модулями работает корректно
- ✅ Контент подходит для разработчиков ИИ, использующих Microsoft AZD
- ✅ Поддерживается дружелюбный для начинающих язык и структура
- ✅ CONTRIBUTING.md содержит чёткие указания для участников сообщества

#### Техническая реализация
- **Проверка ссылок**: Автоматизированный скрипт PowerShell проверил все внутренние ссылки .md
- **Аудит контента**: Ручной обзор полноты мастерской и пригодности для начинающих
- **Навигационная система**: Применены единые шаблоны навигации между главами и модулями

#### Заметки
- **Область применения**: Изменения применены только к английской документации
- **Переводы**: Папки с переводами в этой версии не обновлялись (автоматический перевод будет синхронизирован позже)
- **Длительность мастерской**: Полная мастерская теперь предоставляет 3-4 часа практического обучения

---

### [v3.8.0] - 2025-11-19

#### Продвинутая документация: мониторинг, безопасность и паттерны мультиагента
**В этой версии добавлены полные уроки A-уровня по интеграции Application Insights, паттернам аутентификации и координации мультиагентов для производственных развертываний.**

#### Добавлено
- **📊 Урок по интеграции Application Insights**: в `docs/pre-deployment/application-insights.md`:
  - Развёртывание с фокусом на AZD с автоматическим провижинингом
  - Полные Bicep-шаблоны для Application Insights + Log Analytics
  - Рабочие Python-приложения с кастомной телеметрией (более 1200 строк)
  - Паттерны мониторинга AI/LLM (учёт токенов/стоимости моделей Microsoft Foundry)
  - 6 диаграмм Mermaid (архитектура, распределённое трассирование, поток телеметрии)
  - 3 практических упражнения (уведомления, информационные панели, мониторинг ИИ)
  - Примеры запросов Kusto и стратегии оптимизации затрат
  - Потоковая трансляция метрик в реальном времени и отладка
  - Время изучения 40-50 минут с производственными паттернами

- **🔐 Урок по аутентификации и паттернам безопасности**: в `docs/getting-started/authsecurity.md`:
  - 3 паттерна аутентификации (строки подключения, Key Vault, управляемый идентификатор)
  - Полные Bicep-шаблоны инфраструктуры для безопасных развертываний
  - Код приложения на Node.js с интеграцией Azure SDK
  - 3 полноценных упражнения (включение управляемого идентификатора, идентификатор пользователя, ротация Key Vault)
  - Лучшие практики безопасности и конфигурация RBAC
  - Руководство по устранению неполадок и анализ затрат
  - Паттерны аутентификации без пароля, готовые к производству

- **🤖 Урок по паттернам координации мультиагентов**: в `docs/pre-deployment/coordination-patterns.md`:
  - 5 паттернов координации (последовательный, параллельный, иерархический, событийно-ориентированный, консенсус)
  - Полная реализация сервиса оркестратора (Python/Flask, более 1500 строк)
  - 3 специализированные реализации агентов (исследователь, писатель, редактор)
  - Интеграция с Service Bus для очередей сообщений
  - Управление состоянием с Cosmos DB для распределённых систем
  - 6 диаграмм Mermaid, показывающих взаимодействия агентов
  - 3 продвинутых упражнения (обработка таймаутов, логика повторов, предохранитель)
  - Разбивка затрат ($240-565/месяц) и стратегии оптимизации
  - Интеграция с Application Insights для мониторинга

#### Расширено
- **Глава перед развертыванием**: Теперь включает полный мониторинг и паттерны координации
- **Глава "Начало работы"**: Улучшена профессиональными паттернами аутентификации
- **Готовность к производству**: Полное покрытие от безопасности до наблюдаемости
- **Учебный план**: Обновлён с ссылками на новые уроки в главах 3 и 6

#### Изменено
- **Порядок изучения**: Лучшая интеграция безопасности и мониторинга по всему курсу
- **Качество документации**: Единые стандарты уровня A (95-97%) в новых уроках
- **Производственные паттерны**: Полное сквозное покрытие для корпоративных развертываний

#### Улучшено
- **Опыт разработчика**: Чёткий путь от разработки к мониторингу в производстве
- **Стандарты безопасности**: Профессиональные паттерны для аутентификации и управления секретами
- **Наблюдаемость**: Полная интеграция Application Insights с AZD
- **Нагрузки ИИ**: Специализированный мониторинг моделей Microsoft Foundry и мультиагентов

#### Проверено
- ✅ Все уроки содержат полный рабочий код (не фрагменты)
- ✅ Диаграммы Mermaid для визуального обучения (всего 19 в 3 уроках)
- ✅ Практические упражнения с этапами проверки (всего 9)
- ✅ Готовые к производству Bicep-шаблоны развертываются через `azd up`
- ✅ Анализ затрат и стратегии оптимизации
- ✅ Руководства по устранению неполадок и лучшие практики
- ✅ Контрольные точки знаний с командами проверки

#### Результаты оценки документации
- **docs/pre-deployment/application-insights.md**: - Полное руководство по мониторингу
- **docs/getting-started/authsecurity.md**: - Профессиональные паттерны безопасности
- **docs/pre-deployment/coordination-patterns.md**: - Продвинутые архитектуры мультиагентов
- **Новый общий контент**: - Единые высококачественные стандарты

#### Техническая реализация
- **Application Insights**: Log Analytics + кастомная телеметрия + распределённое трассирование
- **Аутентификация**: Управляемый идентификатор + Key Vault + паттерны RBAC
- **Мультиагент**: Service Bus + Cosmos DB + Container Apps + оркестрация
- **Мониторинг**: Потоковые метрики + запросы Kusto + оповещения + панели
- **Управление затратами**: Стратегии выборки, политики хранения, контроль бюджета

### [v3.7.0] - 2025-11-19

#### Улучшения качества документации и новый пример Microsoft Foundry Models
**В этой версии улучшено качество документации по всему репозиторию и добавлен полный пример развертывания Microsoft Foundry Models с чат-интерфейсом gpt-4.1.**

#### Добавлено
- **🤖 Пример чата Microsoft Foundry Models**: Полное развертывание gpt-4.1 с рабочей реализацией в `examples/azure-openai-chat/`:
  - Полная инфраструктура Microsoft Foundry Models (развёртывание модели gpt-4.1)
  - Python-интерфейс чата в командной строке с историей разговоров
  - Интеграция с Key Vault для безопасного хранения ключей API
  - Отслеживание использования токенов и оценка затрат
  - Ограничение скорости и обработка ошибок
  - Подробный README с руководством по развертыванию на 35-45 минут
  - 11 файлов, готовых к производству (Bicep-шаблоны, Python-приложение, конфигурация)
- **📚 Упражнения по документации**: Добавлены практические упражнения в руководство по конфигурации:
  - Упражнение 1: Конфигурация для нескольких сред (15 минут)
  - Упражнение 2: Практика управления секретами (10 минут)
  - Чёткие критерии успеха и этапы проверки
- **✅ Проверка развертывания**: Добавлен раздел проверки в руководство по развертыванию:
  - Процедуры проверки состояния
  - Контрольный список критериев успеха
  - Ожидаемые результаты всех команд развертывания
  - Быстрые ссылки по устранению неполадок

#### Обновлено
- **examples/README.md**: Обновлено до качества A-уровня (93%):
  - Добавлен azure-openai-chat во все соответствующие разделы
  - Обновлено количество локальных примеров с 3 до 4
  - Добавлено в таблицу примеров AI-приложений
  - Интегрировано в Быстрый старт для пользователей среднего уровня
  - Добавлено в раздел шаблонов Microsoft Foundry
  - Обновлены таблица сравнения и разделы поиска технологий
- **Качество документации**: Улучшено с B+ (87%) до A- (92%) по всей папке docs:

  - Добавлены ожидаемые результаты к примерам критических команд
  - Включены шаги проверки изменений конфигурации
  - Улучшено практическое обучение с помощью практических упражнений

#### Изменено
- **Прогресс обучения**: Лучше интегрированы примеры ИИ для учеников среднего уровня
- **Структура документации**: Больше практических упражнений с четкими результатами
- **Процесс проверки**: Добавлены явные критерии успеха к ключевым рабочим процессам

#### Улучшено
- **Опыт разработчика**: Развертывание Microsoft Foundry Models теперь занимает 35-45 минут (вместо 60-90 для сложных альтернатив)
- **Прозрачность затрат**: Четкие оценки стоимости ($50-200/месяц) для примера Microsoft Foundry Models
- **Путь обучения**: У разработчиков ИИ есть четкая точка входа с azure-openai-chat
- **Стандарты документации**: Последовательные ожидаемые результаты и шаги проверки

#### Проверено
- ✅ Пример Microsoft Foundry Models полностью работает с `azd up`
- ✅ Все 11 файлов реализации синтаксически корректны
- ✅ Инструкции в README соответствуют реальному опыту развертывания
- ✅ Ссылки в документации обновлены в более чем 8 местах
- ✅ Индекс примеров точно отражает 4 локальных примера
- ✅ В таблицах нет дублирующихся внешних ссылок
- ✅ Все ссылки навигации корректны

#### Техническая реализация
- **Архитектура Microsoft Foundry Models**: gpt-4.1 + Key Vault + контейнерные приложения
- **Безопасность**: Готовность Managed Identity, секреты в Key Vault
- **Мониторинг**: Интеграция Application Insights
- **Управление затратами**: Отслеживание токенов и оптимизация использования
- **Развертывание**: Одна команда `azd up` для полного настроя

### [v3.6.0] - 2025-11-19

#### Крупное обновление: Примеры развертывания контейнерных приложений
**В этой версии представлены комплексные примеры развертывания контейнерных приложений готовых к производству с использованием Azure Developer CLI (AZD), полная документация и интеграция в учебный курс.**

#### Добавлено
- **🚀 Примеры контейнерных приложений**: Новые локальные примеры в `examples/container-app/`:
  - [Основное руководство](examples/container-app/README.md): Полный обзор контейнеризованных развертываний, быстрый старт, производство и продвинутые шаблоны
  - [Простой Flask API](../../examples/container-app/simple-flask-api): REST API для начинающих с масштабированием до нуля, проверками состояния, мониторингом и устранением неисправностей
  - [Архитектура микросервисов](../../examples/container-app/microservices): Готовое к производству многосервисное развертывание (API Gateway, Product, Order, User, Notification), асинхронные сообщения, Service Bus, Cosmos DB, Azure SQL, распределенный трейсинг, синие-зеленые и канареечные деплои
- **Лучшие практики**: Руководства по безопасности, мониторингу, оптимизации затрат и CI/CD для контейнерных рабочих нагрузок
- **Примеры кода**: Полный `azure.yaml`, шаблоны Bicep и реализации сервисов на нескольких языках (Python, Node.js, C#, Go)
- **Тестирование и устранение неполадок**: Сценарии сквозного тестирования, команды мониторинга, руководство по устранению неполадок

#### Изменено
- **README.md**: Обновлен для отображения и связи с новыми примерами контейнерных приложений в разделе "Локальные примеры - Контейнерные приложения"
- **examples/README.md**: Обновлен для выделения примеров контейнерных приложений, добавления записей в сравнительную матрицу и обновления ссылок на технологии/архитектуру
- **Структура курса и учебное пособие**: Обновлены для ссылки на новые примеры контейнерных приложений и шаблоны развертывания в соответствующих главах

#### Проверено
- ✅ Все новые примеры можно развернуть с помощью `azd up` и они следуют лучшим практикам
- ✅ Обновлены перекрестные ссылки в документации и навигация
- ✅ Примеры охватывают от начального до продвинутого уровня, включая производственные микросервисы

#### Примечания
- **Область применения**: Только английская документация и примеры
- **Следующие шаги**: Расширение дополнительными продвинутыми шаблонами контейнеров и автоматизацией CI/CD в будущих релизах

### [v3.5.0] - 2025-11-19

#### Ребрендинг продукта: Microsoft Foundry
**В этой версии реализовано полное изменение названия продукта с "Microsoft Foundry" на "Microsoft Foundry" во всей английской документации, отражая официальный ребрендинг Microsoft.**

#### Изменено
- **🔄 Обновление названия продукта**: Полный ребрендинг с "Microsoft Foundry" на "Microsoft Foundry"
  - Обновлены все ссылки во всей английской документации в папке `docs/`
  - Переименована папка: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Переименован файл: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Всего: 23 обновления контента в 7 файлах документации

- **📁 Изменения структуры папок**:
  - `docs/ai-foundry/` переименована в `docs/microsoft-foundry/`
  - Все перекрестные ссылки обновлены для новой структуры папок
  - Навигационные ссылки проверены во всей документации

- **📄 Переименование файлов**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Все внутренние ссылки обновлены на новое имя файла

#### Обновленные файлы
- **Документация глав** (7 файлов):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 обновления навигационных ссылок
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 обновления упоминаний названия продукта
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Уже использует Microsoft Foundry (из предыдущих обновлений)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 обновления ссылок (обзор, отзывы сообщества, документация)
  - `docs/getting-started/azd-basics.md` - 4 обновления перекрестных ссылок
  - `docs/getting-started/first-project.md` - 2 обновления навигационных ссылок главы
  - `docs/getting-started/installation.md` - 2 обновления ссылок на следующие главы
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 обновления ссылок (навигация, сообщество Discord)
  - `docs/troubleshooting/common-issues.md` - 1 обновление навигационной ссылки
  - `docs/troubleshooting/debugging.md` - 1 обновление навигационной ссылки

- **Файлы структуры курса** (2 файла):
  - `README.md` - 17 обновлений ссылок (обзор курса, заголовки глав, раздел шаблонов, идеи сообщества)
  - `course-outline.md` - 14 обновлений ссылок (обзор, цели обучения, ресурсы глав)

#### Проверено
- ✅ Нет оставшихся ссылок на папку "ai-foundry" в английской документации
- ✅ Нет оставшихся упоминаний названия продукта "Microsoft Foundry" в английской документации
- ✅ Все навигационные ссылки работают с новой структурой папок
- ✅ Переименования файлов и папок выполнены успешно
- ✅ Перекрестные ссылки между главами проверены

#### Примечания
- **Область применения**: Изменения применены только к английской документации в папке `docs/`
- **Переводы**: Папки с переводами (`translations/`) в этой версии не обновлялись
- **Материалы для воркшопа**: Материалы воркшопа (`workshop/`) в этой версии не обновлялись
- **Примеры**: Файлы примеров могут по-прежнему содержать устаревшие названия (будет исправлено в будущем обновлении)
- **Внешние ссылки**: Внешние URL и ссылки на репозитории GitHub остаются без изменений

#### Руководство по миграции для контрибьюторов
Если у вас есть локальные ветки или документация с ссылками на старую структуру:
1. Обновите ссылки на папки: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Обновите ссылки на файлы: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Замените название продукта: "Microsoft Foundry" → "Microsoft Foundry"
4. Проверьте, что все внутренние ссылки в документации работают

---

### [v3.4.0] - 2025-10-24

#### Улучшения предпросмотра и проверки инфраструктуры
**В этой версии представлен комплексный обзор новой возможности предпросмотра в Azure Developer CLI и улучшен опыт пользователей воркшопа.**

#### Добавлено
- **🧪 Документация по функции azd provision --preview**: Полное покрытие новой функции предпросмотра инфраструктуры
  - Справочник команд и примеры использования в шпаргалке
  - Детальная интеграция в руководство по развертыванию с кейсами и преимуществами
  - Интеграция предвыполнения проверки для безопасной валидации развертывания
  - Обновления руководства для начала работы с приоритетом безопасности развертывания
- **🚧 Баннер статуса воркшопа**: Профессиональный HTML-баннер, указывающий статус разработки воркшопа
  - Градиентный дизайн с индикаторами строительства для понятной коммуникации с пользователем
  - Отметка времени последнего обновления для прозрачности
  - Адаптивный дизайн для мобильных устройств

#### Улучшено
- **Безопасность инфраструктуры**: Функция предпросмотра интегрирована во всю документацию по развертыванию
- **Проверка перед развертыванием**: Автоматизированные скрипты теперь включают тестирование предпросмотра инфраструктуры
- **Рабочий процесс разработчика**: Обновлены последовательности команд для включения предпросмотра как лучшей практики
- **Опыт воркшопа**: Четкое изложение ожиданий пользователей о статусе разработки контента

#### Изменено
- **Лучшие практики развертывания**: Рекомендован рабочий процесс с приоритетом предпросмотра
- **Поток документации**: Валидация инфраструктуры перенесена на более ранний этап обучения
- **Презентация воркшопа**: Профессиональное информирование о статусе с четким графиком разработки

#### Улучшено
- **Подход с приоритетом безопасности**: Изменения инфраструктуры теперь можно проверять перед развертыванием
- **Командное сотрудничество**: Результаты предпросмотра можно делиться для обзора и утверждения
- **Осведомленность о затратах**: Лучшее понимание стоимости ресурсов до провизии
- **Снижение рисков**: Меньше сбоев развертывания благодаря предварительной валидации

#### Техническая реализация
- **Интеграция нескольких документов**: Функция предпросмотра описана в 4 ключевых файлах
- **Образцы команд**: Единый синтаксис и примеры во всей документации
- **Включение лучших практик**: Предпросмотр включён в рабочие процессы и скрипты проверки
- **Визуальные индикаторы**: Яркое обозначение НОВЫХ функций для лучшей обнаруживаемости

#### Инфраструктура воркшопа
- **Информирование о статусе**: Профессиональный HTML-баннер с градиентным стилем
- **Опыт пользователя**: Четкое указание статуса разработки предотвращает путаницу
- **Профессиональная презентация**: Поддерживает репутацию репозитория и задаёт ожидания
- **Прозрачность сроков**: Отметка времени последнего обновления октябрь 2025 для ответственности

### [v3.3.0] - 2025-09-24

#### Улучшенные материалы воркшопа и интерактивный учебный опыт
**В этой версии представлены расширенные материалы воркшопа с интерактивными руководствами в браузере и структурированными учебными путями.**

#### Добавлено
- **🎥 Интерактивное руководство воркшопа**: Опыт воркшопа в браузере с возможностью предпросмотра MkDocs
- **📝 Структурированные инструкции воркшопа**: 7-шаговый путь обучения от знакомства до настройки
  - 0-Введение: Обзор и настройка воркшопа
  - 1-Выбор шаблона ИИ: Процесс обнаружения и выбора шаблона
  - 2-Проверка шаблона ИИ: Процедуры развертывания и проверки
  - 3-Декомпозиция шаблона ИИ: Понимание архитектуры шаблона
  - 4-Настройка шаблона ИИ: Конфигурация и кастомизация
  - 5-Кастомизация шаблона ИИ: Продвинутые модификации и итерации
  - 6-Удаление инфраструктуры: Очистка и управление ресурсами
  - 7-Завершение: Итоги и следующие шаги
- **🛠️ Инструменты воркшопа**: Конфигурация MkDocs с темой Material для улучшенного опыта обучения
- **🎯 Практический путь обучения**: Методология из 3 шагов (Обнаружение → Развертывание → Кастомизация)
- **📱 Интеграция GitHub Codespaces**: Плавная настройка среды разработки

#### Улучшено
- **Лаборатория ИИ воркшопа**: Расширена с полным 2-3 часовым структурированным учебным опытом
- **Документация воркшопа**: Профессиональная презентация с навигацией и визуальными средствами
- **Прогресс обучения**: Чёткое пошаговое руководство от выбора шаблона до развертывания в продакшн
- **Опыт разработчика**: Интегрированные инструменты для оптимизации рабочих процессов разработки

#### Улучшено
- **Доступность**: Интерфейс в браузере с поиском, функцией копирования и переключением темы
- **Самостоятельное обучение**: Гибкая структура воркшопа, подходящая для разной скорости обучения
- **Практическое применение**: Реальные сценарии развертывания шаблонов ИИ
- **Интеграция сообщества**: Интеграция с Discord для поддержки и сотрудничества на воркшопе

#### Особенности воркшопа
- **Встроенный поиск**: Быстрый поиск по ключевым словам и урокам
- **Копирование блоков кода**: Функция копирования при наведении для всех примеров кода
- **Переключатель тем**: Поддержка тёмного/светлого режимов для разных предпочтений
- **Визуальные ресурсы**: Скриншоты и диаграммы для улучшенного понимания
- **Интеграция помощи**: Прямой доступ к Discord для поддержки сообщества

### [v3.2.0] - 2025-09-17

#### Крупная реструктуризация навигации и система обучения по главам
**В этой версии представлена комплексная структура обучения по главам с улучшенной навигацией по всему репозиторию.**

#### Добавлено
- **📚 Система обучения по главам**: Перестроен весь курс на 8 последовательных учебных глав
  - Глава 1: Основа и быстрый старт (⭐ - 30-45 минут)
  - Глава 2: Разработка с приоритетом ИИ (⭐⭐ - 1-2 часа)
  - Глава 3: Конфигурация и аутентификация (⭐⭐ - 45-60 минут)
  - Глава 4: Инфраструктура как код и развертывание (⭐⭐⭐ - 1-1.5 часа)
  - Глава 5: Многоагентные ИИ решения (⭐⭐⭐⭐ - 2-3 часа)
  - Глава 6: Предварительная проверка и планирование развертывания (⭐⭐ - 1 час)
  - Глава 7: Устранение проблем и отладка (⭐⭐ - 1-1.5 часа)
  - Глава 8: Производственные и корпоративные шаблоны (⭐⭐⭐⭐ - 2-3 часа)
- **📚 Полная навигационная система**: Единые заголовки и нижние колонтитулы навигации по всей документации
- **🎯 Отслеживание прогресса**: Чеклист выполнения курса и система проверки обучения
- **🗺️ Руководство по учебному пути**: Четкие точки входа для разных уровней опыта и целей
- **🔗 Навигация с перекрестными ссылками**: Связанные главы и необходимые предварительные знания четко указаны

#### Улучшено
- **Структура README**: Преобразована в структурированную образовательную платформу с организацией по главам
- **Навигация документации**: Каждая страница теперь содержит контекст главы и руководство по прогрессу
- **Организация шаблонов**: Примеры и шаблоны соотнесены с соответствующими учебными главами

- **Интеграция ресурсов**: Шпаргалки, часто задаваемые вопросы и учебные руководства, связанные с соответствующими главами
- **Интеграция мастер-классов**: Практические лабораторные работы, связанные с несколькими учебными целями главы

#### Изменено
- **Прогресс обучения**: Перешли от линейной документации к гибкому обучению по главам
- **Расположение конфигурации**: Руководство по конфигурации перемещено в главу 3 для лучшего учебного потока
- **Интеграция AI-контента**: Улучшенная интеграция контента, специфичного для ИИ, на протяжении всего учебного пути
- **Производственный контент**: Расширенные шаблоны собраны в главе 8 для корпоративных учеников

#### Улучшено
- **Пользовательский опыт**: Четкие хлебные крошки навигации и индикаторы прогресса по главам
- **Доступность**: Постоянные навигационные схемы для удобства прохождения курса
- **Профессиональная презентация**: Структура курса в университетском стиле, подходящая для академического и корпоративного обучения
- **Эффективность обучения**: Сокращено время на поиск нужного контента благодаря улучшенной организации

#### Техническая реализация
- **Заголовки навигации**: Стандартизирована навигация по главам в более чем 40 файлах документации
- **Навигация в подвале**: Постоянное руководство по прогрессу и индикаторы завершения главы
- **Внутренние ссылки**: Комплексная система внутренних связей, соединяющая связанные концепции
- **Соотношение с главами**: Шаблоны и примеры четко связаны с учебными целями

#### Улучшение учебного руководства
- **📚 Комплексные учебные цели**: Перестроено учебное руководство в соответствии с системой из 8 глав
- **🎯 Оценка по главам**: В каждой главе указаны конкретные учебные цели и практические упражнения
- **📋 Отслеживание прогресса**: Еженедельное расписание с измеримыми результатами и контрольными списками завершения
- **❓ Вопросы для оценки**: Вопросы для проверки знаний по каждой главе с профессиональным результатом
- **🛠️ Практические упражнения**: Практические задания с реальными сценариями развертывания и устранения неполадок
- **📊 Прогресс навыков**: Ясное продвижение от базовых понятий к корпоративным шаблонам с акцентом на развитие карьеры
- **🎓 Сертификационная структура**: Профессиональное развитие и система признания в сообществе
- **⏱️ Управление сроками**: Структурированный 10-недельный план обучения с проверкой ключевых этапов

### [v3.1.0] - 2025-09-17

#### Улучшенные мультиагентные AI-решения
**Эта версия улучшает мультиагентное розничное решение с лучшим именованием агентов и улучшенной документацией.**

#### Изменено
- **Терминология мультиагентов**: Заменено "агент Cora" на "агент клиента" во всем мультиагентном розничном решении для ясности
- **Архитектура агента**: Обновлена вся документация, шаблоны ARM и примеры кода с единообразным именованием "агент клиента"
- **Примеры конфигурации**: Современные шаблоны конфигурации агентов с обновленными правилами именования
- **Согласованность документации**: Все ссылки теперь используют профессиональные, описательные имена агентов

#### Улучшено
- **Пакет шаблонов ARM**: Обновлен retail-multiagent-arm-template с ссылками на агента клиента
- **Диаграммы архитектуры**: Обновлены диаграммы Mermaid с новым именованием агентов
- **Примеры кода**: Python классы и примеры реализации теперь используют именование CustomerAgent
- **Переменные окружения**: Все скрипты развертывания обновлены для использования конвенций CUSTOMER_AGENT_NAME

#### Улучшено
- **Опыт разработчика**: Более четкие роли и обязанности агентов в документации
- **Готовность к производству**: Лучшее согласование с корпоративными правилами именования
- **Учебные материалы**: Более интуитивное именование агентов для образовательных целей
- **Удобство шаблонов**: Облегчено понимание функций агентов и шаблонов развертывания

#### Технические детали
- Обновлены диаграммы архитектуры Mermaid с ссылками на CustomerAgent
- Заменены классы CoraAgent на CustomerAgent в примерах Python
- Изменены JSON-конфигурации шаблонов ARM для использования типа агента "customer"
- Обновлены переменные окружения с CORA_AGENT_* на CUSTOMER_AGENT_*
- Обновлены все команды развертывания и конфигурации контейнеров

### [v3.0.0] - 2025-09-12

#### Крупные изменения - Фокус на AI-разработчиков и интеграция Microsoft Foundry
**Эта версия преобразует репозиторий в комплексный учебный ресурс, ориентированный на ИИ, с интеграцией Microsoft Foundry.**

#### Добавлено
- **🤖 AI-первый учебный путь**: Полная перестройка с приоритетом для разработчиков и инженеров по ИИ
- **Руководство по интеграции Microsoft Foundry**: Полная документация по подключению AZD к сервисам Microsoft Foundry
- **Шаблоны развертывания AI-моделей**: Подробное руководство по выбору моделей, конфигурации и стратегиям промышленного развертывания
- **Лаборатория AI-мастерской**: 2-3 часа практической работы по преобразованию AI-приложений в решения для AZD
- **Лучшие практики производства AI**: Шаблоны для корпоративного масштабирования, мониторинга и безопасности AI-нагрузок
- **Руководство по устранению неполадок AI**: Комплексное устранение проблем с моделями Microsoft Foundry, Cognitive Services и развертыванием AI
- **Галерея шаблонов AI**: Избранная коллекция шаблонов Microsoft Foundry с рейтингами сложности
- **Материалы мастер-классов**: Полная структура мастер-класса с практическими лабораторными и справочными материалами

#### Улучшено
- **Структура README**: Ориентирована на AI-разработчиков с 45% данных об интересах сообщества из Discord Microsoft Foundry
- **Обучающие пути**: Специализированный путь разработчика AI наряду с традиционными для студентов и DevOps-инженеров
- **Рекомендации по шаблонам**: Избранные AI-шаблоны, включая azure-search-openai-demo, contoso-chat и openai-chat-app-quickstart
- **Интеграция сообщества**: Улучшенная поддержка сообщества Discord с AI-специфическими каналами и обсуждениями

#### Безопасность и производственный фокус
- **Паттерны управляемой идентичности**: Аутентификация и конфигурации безопасности, специфичные для AI
- **Оптимизация затрат**: Отслеживание использования токенов и контроль бюджета для AI-нагрузок
- **Мульти-региональное развертывание**: Стратегии глобального развертывания AI-приложений
- **Мониторинг производительности**: Метрики для AI и интеграция с Application Insights

#### Качество документации
- **Линейная структура курса**: Логичное продвижение от новичка к расширенным паттернам развертывания AI
- **Проверенные URL**: Все внешние ссылки на репозитории проверены и доступны
- **Полная справочная информация**: Все внутренние ссылки проверены и работают
- **Готово к производству**: Корпоративные шаблоны развертывания с примерами из реального мира

### [v2.0.0] - 2025-09-09

#### Крупные изменения - Реструктуризация репозитория и профессиональное улучшение
**Эта версия представляет значительную переработку структуры репозитория и представления контента.**

#### Добавлено
- **Структурированная учебная рамка**: Все страницы документации теперь включают разделы Введение, Цели обучения и Результаты обучения
- **Система навигации**: Добавлены ссылки на предыдущий/следующий урок на всей документации для направленного прогресса обучения
- **Учебное руководство**: Подробное study-guide.md с учебными целями, практическими упражнениями и материалами для оценки
- **Профессиональная презентация**: Убраны все эмодзи для улучшения доступности и профессионального вида
- **Улучшенная структура контента**: Улучшенная организация и поток учебных материалов

#### Изменено
- **Формат документации**: Стандартизирован весь контент с последовательной структурой, ориентированной на обучение
- **Навигационный поток**: Реализован логический прогресс по всем учебным материалам
- **Презентация контента**: Убраны декоративные элементы в пользу четкого профессионального форматирования
- **Структура ссылок**: Обновлены все внутренние ссылки для поддержки новой навигационной системы

#### Улучшено
- **Доступность**: Убрана зависимость от эмодзи для лучшей совместимости с экранными читалками
- **Профессиональный внешний вид**: Чистая, академическая презентация, подходящая для корпоративного обучения
- **Опыт обучения**: Структурированный подход с четкими целями и результатами для каждого урока
- **Организация контента**: Улучшенный логический поток и связь между связанными темами

### [v1.0.0] - 2025-09-09

#### Первая версия - Комплексный репозиторий для обучения AZD

#### Добавлено
- **Основная структура документации**
  - Полная серия руководств по началу работы
  - Полная документация по развертыванию и обеспечению инфраструктуры
  - Подробные ресурсы по устранению неполадок и отладке
  - Инструменты и процедуры предварительной проверки перед развертыванием

- **Модуль начала работы**
  - Основы AZD: ключевые концепции и терминология
  - Руководство по установке: инструкции по настройке для разных платформ
  - Руководство по конфигурации: настройка окружения и аутентификация
  - Первое учебное руководство: пошаговое практическое обучение

- **Модуль развертывания и обеспечения инфраструктуры**
  - Руководство по развертыванию: полная документация процесса
  - Руководство по обеспечению: инфраструктура как код с использованием Bicep
  - Лучшие практики для производственного развертывания
  - Шаблоны архитектуры с несколькими сервисами

- **Модуль предварительной проверки**
  - Планирование емкости: проверка доступности ресурсов Azure
  - Выбор SKU: подробное руководство по уровням сервиса
  - Предварительные проверки: автоматизированные скрипты проверки (PowerShell и Bash)
  - Оценка затрат и планирование бюджета

- **Модуль устранения неполадок**
  - Распространенные проблемы: частые проблемы и решения
  - Руководство по отладке: системные методики устранения неполадок
  - Продвинутые методы диагностики и инструменты
  - Мониторинг производительности и оптимизация

- **Ресурсы и ссылки**
  - Шпаргалка команд: быстрый справочник по основным командам
  - Глоссарий: подробные определения терминов и аббревиатур
  - FAQ: подробные ответы на распространённые вопросы
  - Внешние ссылки на ресурсы и связи с сообществом

- **Примеры и шаблоны**
  - Пример простого веб-приложения
  - Шаблон развертывания статического сайта
  - Конфигурация контейнерного приложения
  - Шаблоны интеграции баз данных
  - Примеры архитектуры микросервисов
  - Реализации серверлесс-функций

#### Особенности
- **Мультиплатформенная поддержка**: Руководства по установке и настройке для Windows, macOS и Linux
- **Разные уровни навыков**: Контент рассчитан на студентов и профессиональных разработчиков
- **Практическая направленность**: Практические примеры и сценарии из реального мира
- **Полное покрытие**: От базовых понятий до продвинутых корпоративных шаблонов
- **Подход с приоритетом безопасности**: Рекомендации по безопасности интегрированы повсюду
- **Оптимизация затрат**: Руководства по экономичному развертыванию и управлению ресурсами

#### Качество документации
- **Подробные примеры кода**: Практические, проверенные образцы кода
- **Пошаговые инструкции**: Четкое, практическое руководство
- **Полное управление ошибками**: Устранение распространенных проблем
- **Интеграция лучших практик**: Промышленные стандарты и рекомендации
- **Совместимость версий**: Актуальность с последними сервисами Azure и функциями azd

## Запланированные будущие улучшения

### Версия 3.1.0 (Запланировано)
#### Расширение AI-платформы
- **Поддержка нескольких моделей**: Паттерны интеграции для Hugging Face, Azure Machine Learning и пользовательских моделей
- **Фреймворки AI-агентов**: Шаблоны для развертывания LangChain, Semantic Kernel и AutoGen
- **Продвинутые паттерны RAG**: Варианты векторных баз данных, помимо Azure AI Search (Pinecone, Weaviate и др.)
- **Наблюдаемость AI**: Улучшенный мониторинг производительности моделей, использования токенов и качества ответов

#### Опыт разработчика
- **Расширение VS Code**: Интегрированный опыт разработки AZD + Microsoft Foundry
- **Интеграция GitHub Copilot**: Генерация шаблонов AZD с помощью ИИ
- **Интерактивные учебники**: Практические упражнения программирования с автоматической проверкой для AI-сценариев
- **Видео-контент**: Дополнительные видеоуроки для визуальных учеников, ориентированных на развертывание ИИ

### Версия 4.0.0 (Запланировано)
#### Корпоративные AI-паттерны
- **Рамки управления**: Управление моделями AI, соответствие требованиям и аудит
- **Мультиарендный AI**: Паттерны обслуживания нескольких клиентов изолированными AI-сервисами
- **Развертывание AI на периферии**: Интеграция с Azure IoT Edge и контейнерными инстанциями
- **Гибридный облачный AI**: Мультиоблачные и гибридные паттерны развертывания AI-нагрузок

#### Продвинутые возможности
- **Автоматизация AI-конвейеров**: Интеграция MLOps с пайплайнами Azure Machine Learning
- **Продвинутая безопасность**: Паттерны с нулевым доверием, приватные конечные точки и защита от угроз
- **Оптимизация производительности**: Продвинутая настройка и масштабирование для AI-приложений с высокой пропускной способностью
- **Глобальное распространение**: Паттерны доставки контента и кэширования на периферии для AI-приложений

### Версия 3.0.0 (Запланировано) - Заменена текущим выпуском
#### Предлагаемые дополнения - Сейчас реализованы в v3.0.0
- ✅ **AI-ориентированный контент**: Комплексная интеграция Microsoft Foundry (завершено)
- ✅ **Интерактивные учебники**: Практическая AI-лаборатория (завершено)
- ✅ **Модуль продвинутой безопасности**: Специфические для AI паттерны безопасности (завершено)
- ✅ **Оптимизация производительности**: Стратегии настройки AI-нагрузок (завершено)

### Версия 2.1.0 (Запланировано) - Частично реализовано в v3.0.0
#### Незначительные улучшения - Некоторые реализованы в текущем выпуске
- ✅ **Дополнительные примеры**: AI-ориентированные сценарии развертывания (завершено)
- ✅ **Расширенный FAQ**: Вопросы и устранение неполадок, специфичные для AI (завершено)
- **Интеграция инструментов**: Улучшенные руководства по интеграции IDE и редакторов
- ✅ **Расширение мониторинга**: AI-специфичные паттерны мониторинга и оповещений (завершено)

#### Все еще планируются к будущему выпуску
- **Мобильная документация**: Адаптивный дизайн для мобильного обучения
- **Офлайн-доступ**: Загружаемые пакеты документации
- **Расширенная интеграция IDE**: Расширение VS Code для AZD + AI-рабочих процессов
- **Панель сообщества**: Метрики сообщества и отслеживание вклада в режиме реального времени

## Внесение изменений в журнал изменений

### Сообщение об изменениях
При внесении изменений в этот репозиторий убедитесь, что записи в журнале изменений включают:

1. **Номер версии**: Согласно семантическому версионированию (major.minor.patch)
2. **Дата**: Дата выпуска или обновления в формате ГГГГ-ММ-ДД
3. **Категория**: Добавлено, Изменено, Устарело, Удалено, Исправлено, Безопасность
4. **Четкое описание**: Краткое описание изменений
5. **Оценка влияния**: Как изменения повлияют на текущих пользователей

### Категории изменений

#### Добавлено
- Новые функции, разделы документации или возможности
- Новые примеры, шаблоны или учебные ресурсы
- Дополнительные инструменты, скрипты или утилиты

#### Изменено
- Изменения существующего функционала или документации
- Обновления для улучшения ясности или точности
- Реструктуризация контента или организации

#### Устарело
- Функции или подходы, которые постепенно отменяются
- Разделы документации, запланированные к удалению
- Методы с лучшими альтернативами

#### Удалено
- Функции, документация или примеры, которые более не актуальны
- Устаревшая информация или устаревшие подходы
- Избыточный или объединённый контент

#### Исправлено
- Исправления ошибок в документации или коде
- Решение заявленных проблем или ошибок
- Улучшения точности или функциональности


#### Безопасность
- Улучшения или исправления, связанные с безопасностью
- Обновления лучших практик безопасности
- Устранение уязвимостей в безопасности

### Руководство по семантическому версионированию

#### Мажорная версия (X.0.0)
- Несовместимые изменения, требующие действий пользователя
- Значительное перестроение содержания или организации
- Изменения, которые меняют фундаментальный подход или методологию

#### Минорная версия (X.Y.0)
- Новые функции или добавления контента
- Улучшения с сохранением обратной совместимости
- Дополнительные примеры, инструменты или ресурсы

#### Патч-версия (X.Y.Z)
- Исправления ошибок и правки
- Незначительные улучшения существующего контента
- Уточнения и небольшие улучшения

## Отзывы и предложения сообщества

Мы активно поощряем отзывы сообщества для улучшения этого учебного ресурса:

### Как оставить отзыв
- **GitHub Issues**: Сообщайте о проблемах или предлагайте улучшения (особенно по ИИ)
- **Обсуждения в Discord**: Делитесь идеями и взаимодействуйте с сообществом Microsoft Foundry
- **Pull Requests**: Вносите прямые улучшения в контент, особенно в шаблоны и руководства по ИИ
- **Microsoft Foundry Discord**: Участвуйте в канале #Azure для обсуждений AZD + AI
- **Форумы сообщества**: Участвуйте в более широких обсуждениях разработчиков Azure

### Категории отзывов
- **Точность контента ИИ**: Исправления по интеграции и развертыванию сервисов ИИ
- **Опыт обучения**: Предложения для улучшения процесса обучения разработчиков ИИ
- **Отсутствующий контент по ИИ**: Запросы дополнительных шаблонов, паттернов или примеров ИИ
- **Доступность**: Улучшения для разных потребностей в обучении
- **Интеграция инструментов ИИ**: Предложения по лучшей интеграции в рабочие процессы разработки ИИ
- **Паттерны промышленного ИИ**: Запросы паттернов развертывания корпоративного ИИ

### Обязательства по ответам
- **Ответ на проблемы**: В течение 48 часов на сообщенные проблемы
- **Запросы функций**: Рассмотрение в течение одной недели
- **Вклад сообщества**: Проверка в течение одной недели
- **Вопросы безопасности**: Немедленный приоритет с ускоренным ответом

## График технического обслуживания

### Регулярные обновления
- **Ежемесячные проверки**: Точность контента и проверка ссылок
- **Квартальные обновления**: Основные добавления и улучшения контента
- **Полугодовые обзоры**: Комплексное перестроение и улучшение
- **Ежегодные релизы**: Основные обновления версий с существенными улучшениями

### Мониторинг и обеспечение качества
- **Автоматическое тестирование**: Регулярная проверка примеров кода и ссылок
- **Интеграция отзывов сообщества**: Регулярное включение предложений пользователей
- **Обновления технологий**: Соответствие последним Azure сервисам и выпускам azd
- **Аудит доступности**: Регулярный обзор принципов инклюзивного дизайна

## Политика поддержки версий

### Поддержка текущих версий
- **Последняя мажорная версия**: Полная поддержка с регулярными обновлениями
- **Предыдущая мажорная версия**: Обновления безопасности и критические исправления в течение 12 месяцев
- **Устаревшие версии**: Поддержка сообщества, без официальных обновлений

### Руководство по миграции
При выпуске мажорных версий мы предоставляем:
- **Руководства по миграции**: Пошаговые инструкции перехода
- **Примечания о совместимости**: Детали о несовместимых изменениях
- **Поддержка инструментов**: Скрипты или утилиты для помощи в миграции
- **Поддержка сообщества**: Специализированные форумы для вопросов по миграции

---

**Навигация**
- **Предыдущий урок**: [Study Guide](resources/study-guide.md)
- **Следующий урок**: Вернуться к [Main README](README.md)

**Будьте в курсе**: Подпишитесь на этот репозиторий, чтобы получать уведомления о новых выпусках и важных обновлениях учебных материалов.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->