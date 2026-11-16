# 4. Конфигурирайте шаблон

!!! tip "В КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ ДА"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Започнете с реалния шаблон

Отворете [`azure.yaml` в Запознайте се с AI агенти](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) в хранилището, което сте инициализирали. Изходният шаблон може да се променя независимо от този уъркшоп. Следният **откъс** е проверен на 4 ноември 2026 г.; той не е заместител на пълния файл:

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

- `name` идентифицира проекта AZD; `metadata.template` записва версията на шаблона.
- `requiredVersions.azd` е минималната версия на шаблона, не препоръка да останете на стара CLI. Използвайте актуална поддържана версия на AZD.
- `services` дефинира цели за разгръщане на приложението. Този шаблон разгръща своя Python API и frontend като една услуга Container Apps.
- `project` е относително към `azure.yaml`.
- `remoteBuild` изисква отдалечено компилиране на контейнер. Вашата идентичност все още се нуждае от необходимите разрешения в Azure.

Bicep файловете на шаблона под `infra/`, а не само списъкът `services`, декларират ресурси като Microsoft Foundry, разгръщания на модели, съхранение и опционално AI Search.

## 2. Разберете lifecycle hooks (проверки в жизнения цикъл)

Прегледайте секцията `hooks` и свързаните с нея скриптове преди да стартирате шаблона. Прегледаната версия съдържа:

| Hook | Цел | Важни поведения |
|------|---------|--------------------|
| `preup` | Валидация на входяща среда на шаблона преди `up` workflow | Платформено-специфични shell скриптове могат да спрат workflow при неуспех |
| `postdeploy` | Стартиране на специфична за шаблона настройка след разгръщане на приложението | Прегледайте `continueOnError` и изхода на скрипта; успешно разгръщане не доказва, че всяка задача за настройка е успяла |

Тази версия **не съдържа** по-стария `postprovision` / `write_env` hook, показан в по-ранен материал на уъркшопа. Не копирайте препратки към скриптове, които вече не съществуват.

Hook ключовете избират жизнени събития; `posix` и `windows` избират платформени реализации. `shell`, `run`, `interactive`, и `continueOnError` контролират изпълнението. Това са изпълними скриптове с вашите разрешения, така че ги прегледайте както бихте проверили код на приложението.

Вижте [документацията за AZD hooks](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) за пълния жизнен цикъл.

## 3. Проследете входовете за среда в инфраструктурата

Изпълнете тези команди от инициализираното пробно хранилище:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Прегледайте `infra/main.parameters.json`, за да видите кои променливи на средата всъщност използва шаблонът. Задаването на произволно име с `azd env set` не променя автоматично Azure ресурс.

Прегледаните по подразбиране включват:

| Вход | По подразбиране / цел |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; единиците квота зависят от модела и типа на разгръщане |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; оставете изключено, освен ако обработката на данни не е прегледана |

Това са специфични за примера входове, а не глобални настройки на AZD. Проверете [документацията за поддръжка на модели и региони](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) и квотата на вашия абонамент преди да изберете модел, SKU, капацитет или локация. Не тълкувайте всяка единица капацитет като 1,000 токена в минута.

За да изберете различен чат модел, актуализирайте съвместимото му **име, версия, формат, SKU и капацитет заедно**, следвайки [ръководството за персонализиране на примера](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Промяната само на името може да остави несъвместима версия или тип разгръщане.

## 4. Лаборатория: активирайте опционално търсене и проследяване

!!! warning "Тези настройки могат да добавят таксувани ресурси"

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

Промените в инфраструктурата изискват провизиране; само `azd deploy` разгръща услуги на приложение. За индексиране на търсене и поддържани опции за извличане следвайте [ръководството за AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). За мониторинг следвайте [ръководството за наблюдение](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Не активирайте улавяне на съдържание на подканване/отговор върху реални клиентски данни без необходимото съгласие, контрол на достъпа, политика за задържане и редактиране.

## 5. Съществуващи ресурси и CI/CD

За повторно използване на Foundry проект следвайте [инструкцията за съществуващи ресурси](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) от примера. Настройването на `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` променя пътя на разгръщане; в този сценарий шаблонът не създава Application Insights или AI Search за вас. Проверявайте експлицитно зависимости, ролеви назначения и разгръщания на модели.

Секцията `pipeline.variables` контролира стойностите, подадени в генериран pipeline; тя не е хранилище за тайни и не създава Azure ресурси. Предпочитайте управлявана идентичност в приложението и OIDC за CI/CD. AZD файловете на средата са в обикновен текст и не трябва да се комитират.

AZD поддържа импортиране на доверен, локално подготвен dotenv файл:

```bash
azd env set --file .env
```

Прегледайте този файл преди да го импортирате и не извеждайте на екрана файлове със секретни стойности в споделени терминали или CI логове.

## 6. Провери разбирането си

- Коя `azure.yaml` услуга разгръща приложението?
- Кой инфраструктурен параметър консумира всяка променена от вас стойност?
- Кои промени изискват провизиране, а не само разгръщане?
- Поддържаха ли избраният регион и абонамент модела и квотата?
- Успешни ли бяха всички hook настройки и може ли да проверите поведението на разгръщаното приложение?

Продължете към [Персонализиране на шаблон](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->