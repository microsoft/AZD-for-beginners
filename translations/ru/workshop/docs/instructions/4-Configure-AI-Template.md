# 4. Настройка шаблона

!!! tip "К КОНЦУ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Начните с фактического шаблона

Откройте [`azure.yaml` в разделе Начало работы с AI Агентами](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) в репозитории, который вы инициализировали. Исходный шаблон может изменяться независимо от этого воркшопа. Следующий **фрагмент** был проверен 4 ноября 2026 года; он не заменяет полный файл:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` идентифицирует проект AZD; `metadata.template` фиксирует версию шаблона.
- `requiredVersions.azd` задает минимальную версию шаблона, а не рекомендацию использовать старую CLI. Используйте текущий поддерживаемый выпуск AZD.
- `services` определяет цели развертывания приложения. Этот шаблон развертывает свой Python API и фронтенд как одну службу Container Apps.
- `project` является относительным к `azure.yaml`.
- `remoteBuild` запрашивает удаленную сборку контейнера. Ваша учетная запись все еще должна иметь необходимые разрешения Azure.

Bicep-файлы шаблона в каталоге `infra/`, а не один лишь список `services`, объявляют такие ресурсы, как Microsoft Foundry, развертывания моделей, хранилище и опциональный AI Search.

## 2. Поймите хуки жизненного цикла

Изучите секцию `hooks` и связанные с ней скрипты перед запуском шаблона. Рецензированная версия содержит:

| Хук | Назначение | Важное поведение |
|------|---------|--------------------|
| `preup` | Проверяет входные параметры шаблона перед `up` workflow | Скрипты для конкретной платформы могут остановить workflow при ошибке |
| `postdeploy` | Запускает специфическую настройку шаблона после развертывания приложения | Изучите `continueOnError` и вывод скрипта; успешное развертывание не гарантирует, что все задачи настройки выполнены |

Эта версия **не содержит** старый хук `postprovision` / `write_env`, показанный в ранее используемых материалах воркшопа. Не копируйте ссылки на скрипты хука, которых больше не существует.

Ключи хуков выбирают события жизненного цикла; `posix` и `windows` выбирают реализации платформы. `shell`, `run`, `interactive` и `continueOnError` контролируют выполнение. Это исполняемые скрипты с вашими правами доступа, поэтому изучите их, как и исходный код приложения.

См. [документацию по AZD хукам](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) для полного жизненного цикла.

## 3. Проследите входные параметры окружения в инфраструктуру

Выполните эти команды из инициализированного примера репозитория:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Изучите `infra/main.parameters.json`, чтобы узнать, какие переменные окружения шаблон реально использует. Установка произвольного имени через `azd env set` не приводит к автоматическому изменению ресурса Azure.

Проверенные значения по умолчанию включают:

| Входные данные | Значение по умолчанию / назначение |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; единицы квоты зависят от модели и типа развертывания |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; оставьте отключенным, если не был проверен процесс обработки данных |

Это параметры, специфичные для примера, а не глобальные настройки AZD. Перед выбором модели, SKU, вместимости или региона проверьте [документацию о поддержке моделей и регионов](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) и квоту вашей подписки. Не воспринимайте каждую единицу вместимости как 1000 токенов в минуту.

Чтобы выбрать другую модель чата, обновите ее совместимые **имя, версию, формат, SKU и вместимость вместе**, следуя [руководству по настройке примера](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Изменение только имени может оставить несовместимую версию или тип развертывания.

## 4. Лабораторная работа: включите дополнительный поиск и трассировку

!!! warning "Эти настройки могут добавить платные ресурсы"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Изменения инфраструктуры требуют провиженинга; только `azd deploy` развертывает сервисы приложения. Для индексирования поиска и поддерживаемых опций поиска следуйте [руководству AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Для мониторинга следуйте [руководству по обозримости](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Не включайте захват содержимого запросов и ответов при работе с реальными данными клиентов без необходимых согласий, контроля доступа, политики хранения и редактирования.

## 5. Существующие ресурсы и CI/CD

Чтобы повторно использовать проект Foundry, следуйте [инструкциям по существующим ресурсам](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) примера. Установка `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` изменяет путь развертывания; в этом случае шаблон не создает Application Insights или AI Search за вас. Явно проверяйте зависимости, назначение ролей и развертывания моделей.

Раздел `pipeline.variables` управляет значениями, передаваемыми в сгенерированный pipeline; он не является хранилищем секретов и не создает ресурсы Azure. Предпочитайте управляемые удостоверения в приложении и OIDC для CI/CD. Файлы окружения AZD — это открытый текст, их не следует коммитить.

AZD поддерживает импорт доверенного локально подготовленного dotenv-файла:

```bash
azd env set --file .env
```

Перед импортом изучите этот файл, и не выводите в общий терминал или логи CI файлы окружения, содержащие секреты.

## 6. Проверьте понимание

- Какая служба `azure.yaml` развертывает приложение?
- Какой параметр инфраструктуры использует каждое измененное значение?
- Какие изменения требуют провиженинга, а не только развертывания?
- Поддерживали ли выбранный регион и подписка модель и квоту?
- Выполнились ли все хуки настройки, и можете ли вы проверить поведение развернутого приложения?

Продолжите к [Настройке шаблона](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->