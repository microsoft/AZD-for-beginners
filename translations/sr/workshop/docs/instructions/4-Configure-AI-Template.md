# 4. Конфигуришите шаблон

!!! tip "НА КРАЈУ ОВОГ МОДУЛА МОЋИ ЋЕТЕ ДА"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Почните са стварним шаблоном

Отворите [`azure.yaml` у Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) у репозиторијуму који сте иницирали. Изворни шаблон може да се мења независно од овог радионице. Следећи **исечак** је проверен 4. новембра 2026; није замена за комплетну датотеку:

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

- `name` идентификује AZD пројекат; `metadata.template` бележи верзију шаблона.
- `requiredVersions.azd` је минимална верзија шаблона, а не препорука да останете на старом CLI-ју. Користите актуелно подржану AZD верзију.
- `services` дефинише циљеве за деплојмен апликације. Овај шаблон деплојује свој Python API и фронтенд као једну услугу Container Apps.
- `project` је релативно у односу на `azure.yaml`.
- `remoteBuild` захтева удаљену изградњу контејнера. Ваш идентитет и даље треба одговарајуће дозволе у Azure-у.

Bicep датотеке шаблона под `infra/`, а не само `services` листа, декларишу ресурсе као што су Microsoft Foundry, модел деплојменти, складиште и опционални AI Search.

## 2. Разумевање хукова животног циклуса

Прегледајте `hooks` секцију и позване скрипте пре покретања шаблона. Прегледана верзија садржи:

| Хук | Сврха | Важна понашања |
|------|---------|--------------------|
| `preup` | Верификује улазне параметре окружења шаблона пре `up` радног тока | Скрипте специфичне за платформу могу зауставити радни ток у случају грешке |
| `postdeploy` | Покреће специфичну подешавање шаблона након деплоја апликације | Прегледајте `continueOnError` и излаз скрипте; успешан деплој не значи да је сваки задатак подешавања успео |

Ова верзија **не** садржи старији `postprovision` / `write_env` хук приказан у ранијем материјалу радионице. Немојте копирати референце хукова ка скриптама које више не постоје.

Кључеви хука бирају догађаје животног циклуса; `posix` и `windows` бирају имплементације платформе. `shell`, `run`, `interactive` и `continueOnError` контролишу извршење. Ово су извршне скрипте са вашим дозволама, па их прегледајте као да је то код апликације.

Погледајте [AZD hooks документацију](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) за комплетан животни циклус.

## 3. Пратите улазне параметре окружења у инфраструктуру

Покрените ове команде из иницијализованог пример репозиторијума:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Прегледајте `infra/main.parameters.json` да видите које улазне променљиве окружења шаблон заправо користи. Подешавање произвољног имена помоћу `azd env set` не мења аутоматски Azure ресурс.

Прегледани подразумевани параметри укључују:

| Улазни параметар | Подразумевано / сврха |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; јединице квоте зависе од модела и типа деплоја |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; оставите ову опцију искљученом осим ако обрада података није прегледана |

Ово су специфични улазни параметри за пример, а не глобална подешавања AZD-а. Проверите [документацију о подршци модела и региона](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) и квоту претплате пре него што изаберете модел, SKU, капацитет или локацију. Немојте тумачити сваки јединични капацитет као 1.000 токена у минути.

Да бисте изабрали други модел за ћаскање, ажурирајте његово компатибилно **име, верзију, формат, SKU и капацитет заједно**, пратећи [водич за прилагођавање примера](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Промена само имена може оставити некомпатибилну верзију или тип деплоја.

## 4. Лабораторија: омогућите опционално претраживање и праћење

!!! warning "Ова подешавања могу додати наплаћиване ресурсе"

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

Промене у инфраструктури захтевају провизију; `azd deploy` сам по себи само деплојује услуге апликације. За индексирање претраге и подржане опције претраживања, пратите [водич за AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). За мониторинг, пратите [водич за опсервабилност](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Немојте омогућавати снимање садржаја упита/одговора на подацима правих корисника без одговарајућег сагласности, контрола приступа, политике задржавања и цртања.

## 5. Постојећи ресурси и CI/CD

Да бисте поново користили Foundry пројекат, пратите упутства за [постојеће ресурсе примера](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Подешавање `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` мења пут деплоја; у том случају шаблон не креира Application Insights или AI Search за вас. Јасно проверите зависности, доделе улога и деплојменте модела.

`pipeline.variables` секција контролише вредности прослеђене у генерисану пајплајн; није складиште тајни и не креира Azure ресурсе. Преферирајте управљани идентитет у апликацији и OIDC за CI/CD. AZD датотеке окружења су у обичном тексту и не треба их комитовати.

AZD подржава увоз поуздане, локално припремљене dotenv датотеке:

```bash
azd env set --file .env
```

Прегледајте ту датотеку пре увоза и немојте штампати датотеке окружења које садрже тајне у заједничким терминалима или CI логовима.

## 6. Проверите своје разумевање

- Која `azure.yaml` услуга деплојује апликацију?
- Који параметар инфраструктуре користи сваку вредност коју сте променили?
- Које промене захтевају провизију, а не само деплој?
- Да ли је изабрани регион и претплата подржала модел и квоту?
- Да ли су сви хукови за подешавање успели, и да ли можете проверити понашање деплојоване апликације?

Наставите на [Прилагодите шаблон](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->