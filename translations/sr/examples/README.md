# Примери — Извор на енглеском и Azure примерци

Ово су примери за учење, а не апликације сертификоване за продукцију. Прочитајте сваки
неопходни услов, ограничења, трошкове и упутства за чишћење пре
покретања наредби. Доступност и квоте Azure-а треба проверити у вашој претплати.

- [Почетак курса](../README.md)
- [Инсталација](../docs/chapter-01-foundation/installation.md)
- [Решавање проблема](../docs/chapter-07-troubleshooting/common-issues.md)

## Шта заправо постоји локално

Постоје **четири примерка апликација** и **једна скелетна инфраструктура**:

| Пример | Локална имплементација | Фокус учења | Ниво |
|---|---|---|---|
| [Једноставан Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Деплојмент контејнера, probes, лога | Почетник |
| [Двосервизни микросервиси](../../../examples/container-app/microservices) | Node.js gateway и read-only Python product service, Dockerfiles, Bicep, `azure.yaml` | Интерна HTTPS комуникација, независно скалирање | Средњи |
| [Апликација база података](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL конекција, иницијализација, лога | Средњи |
| [Azure OpenAI чет](../../../examples/azure-openai-chat) | Локални Python CLI, Azure OpenAI и Key Vault Bicep, само инфраструктура `azure.yaml` | Провизија модела, историја чета, процене токена | Средњи |
| [Малопродајна инфраструктура](../../../examples/retail-multiagent-arm-template) | ARM шаблон, параметри, Баш скрипта за имплементацију; **само hello-world контејнери** | Инфраструктура за будућу мулти-агент апликацију | Напредно |

Сценарио [малопродаје](retail-scenario.md) је **архитектонски план**, а не
комплетна мултиагентна имплементација. Не укључује се код малопродајног агента, фронтенд за ћаскање, API рутера,
pipeline за претраживање података, CLI за евалуацију, аутоматски прекид рада нити
производно ојачавање. Ово морају бити дизајнирани, изграђени и тестирани одвојено.

Преглед [микросервиса](microservices/README.md) упућује на пример са два сервиса који се може покренути;
то није још један директоријум за деплојмент.

## Препоручени пут учења

1. Деплојујте Flask API и проверите `/health` и CRUD операције.
2. Деплојујте апликацију базе података и проверите пет унета производа.
3. Деплојујте пример са два сервиса и проверите захтеве са gateway-а ка производу.
4. Обезбедите ресурсе за ћаскање и покрените интерактивни CLI **локално**.
5. Проучите план малопродаје након што завршите радне примере.

Одвојите око 30–60 минута по апликационом примеру укључујући предуслове и
проверу. Имплементација малопродаје је одвојени развојни пројекат, а не
радионица од 30 минута. Читање њене архитектуре траје око 2–3 сата; имплементација
и спремност за производњу могу потрајати знатно дуже од илустративних
80–120 развојних сати у водичу.

## Брзи почетак

Из корена репозиторијума, за први пример контејнера:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Очекује се: HTTP 200 и JSON који садржи `"status": "healthy"`.
Потребно је да Docker ради за локалну изградњу контејнера.

За ћаскање, пратите [chat README](azure-openai-chat/README.md): користите
`azd provision`, учитајте API кључ из Key Vault-а у тренутни shell, инсталирајте
`src/requirements.txt`, и покрените `python src/chat.py`. Нема услуге хостованог ћаскања.

За малопродају, користите [ARM водич](retail-multiagent-arm-template/README.md).
Нема `azure.yaml` и **није** распоређен или уклоњен помоћу `azd up`/`azd down`.

## Трошкови и ограничења

- Све распоређивања креирају наплативе Azure ресурсе. Scale-to-zero важи само за
  апликацијски израчунавање; не укида трошкове регистарa, базе података, складишта, претраге или логова.
- Тачне цене зависе од региона, валуте, саобраћаја, модела/SKU и задржавања.
  Користите [Azure калкулатор цена](https://azure.microsoft.com/pricing/calculator/)
  пре распоређивања и подесите буџет у Azure Cost Management.
- Flask CRUD подаци су у меморији, ограничени на једног радника и највише једну реплику по
  подразумеваној вредности. Нестају приликом рестарта или скалирања на нулу. Ово није трајно складиште.
- Микросервис производа излаже само GET крајње тачке. Нема услуге наруџбина, корисничке
  услуге, базе података, Service Bus, C# или Go имплементације.
- Application Insights ресурси не инструментују аутоматски сваки апликацију.
  Погледајте сваки пример за телеметрију која се заправо емитује.
- Примери не имплементирају аутентификацију апликације. Додати идентитет, ауторизацију,
  трајно складиште, мрежне контроле, тестове и оперативне процедуре пре продукције.

## Спољни Azure примери — клонирајте одвојено

Ове везе су референце на одвојене репозиторијуме, **не локални примери**.
Њихови одржаваоци поседују упутства за подешавање, имплементацију, зависности и трошкове.

| Пример | Фокус |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js апликација са базом података |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# и Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Статички фронтенд са C# функцијама и SQL-ом |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python серверлес апликација |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Контейнеризован backend продавнице |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI чат апликација |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Апликација агента |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG са претрагом и цитатима |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Пример конверзацијског AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java микросервиси |

Откријте више пројеката у [AZD template gallery](https://azure.github.io/awesome-azd/).
Немојте претпостављати да спољни пројекат подржава `azd` без провере његовог тренутног README-а.

## Структура репозиторијума

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Не постоји заједнички `configurations/`, `scripts/`, или директоријум за тестове обећан овим индексом.
Стварни фајлови и опционе идеје за екстензију су идентификовани у сваком водичу.

## Чишћење

За четири AZD примера, покрените ово **из изабраног директоријума примера**:

```bash
azd down
```

Прегледајте упит за брисање. За малопродају, обришите само посебну resource групу
коју сте креирали, користећи упутства у његовом ARM водичу. Проверите Azure Cost Management
након чишћења; подаци о наплати могу стићи касније.

## Допринос

Укључите извор, инфраструктуру, конфигурацију деплоја, извршне кораке поставке и
проверу, ограничења, и упутства за чишћење уз сваки узорак апликације.
Јасно означите материјал који је искључиво архитектонски и непотпуне исечке.
Не тврите спремност за продукцију без тестова деплоја, функционалности и оперативности.

[FAQ](../resources/faq.md) · [Study guide](../resources/study-guide.md) ·
[Report an issue](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->