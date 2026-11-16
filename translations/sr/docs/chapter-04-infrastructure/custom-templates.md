# Креирање Власитог azd Шаблона

**Навигација кроз поглавље:**
- **📚 Почетна курсa**: [AZD За Почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и примена
- **⬅️ Претходно**: [Водич за примену](deployment-guide.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Мулти-Агент решења](../chapter-05-multi-agent/README.md)

> Прегледано у складу са `azd 1.37.2` (новембар 2026). Ово је **водич за креирање са делимичним фајловима**, а не комплетан шаблон: морате обезбедити апликациони код и `modules/web.bicep` са његовим окружењем, регистром, Container App и излазима пре примене. Провизија Azure није извршена у овом прегледу.

## Увод

До сада сте *користили* шаблоне са `azd init --template <name>`. Али када имате пројектну структуру која ваш тим воли — на пример, Container App са Cosmos DB и правим мониторингом — желећете да га претворите у ваш сопствени поновљиви шаблон. Шаблон је само Git репозиторијум са предвидивом структуром коју azd зна како да прочита. Ова лекција вам показује како да направите један од почетка, тестирате га и (опционо) објавите у заједничку галерију.

## Циљеви учења

До краја ове лекције ћете:
- Разумети шта чини фасциклу "azd шаблоном"
- Познавати потребне фајлове и распоред фасцикли
- Додати `azure.yaml` и `infra/` које други могу поново користити
- Тестирати ваш шаблон локално пре него што га поделите
- Објавити га и (опционо) послати у Awesome AZD

## Резултати учења

Након ове лекције, моћи ћете да:
- Креирате нови шаблонски репозиторијум
- Параметризујете инфраструктуру тако да ради у било ком претплатничком оквиру
- Валидација шаблона уз помоћ `azd init` и `azd up`
- Додате метаподатке које захтева заједничка галерија

---

## Шта је заправо шаблон?

azd шаблон је **Git репозиторијум** који садржи, најмање:

| Фајл / фасцикла | Сврха | Потребно? |
|---------------|---------|-----------|
| `azure.yaml` | Описује сервисе, хостове и провајдера инфраструктуре | ✅ Да |
| `infra/` | Дефиниције провизије у Bicep или Terraform | Потребно за овај пример експлицитне IaC; пројекти са генерисаном инфраструктуром могу да га изоставе |
| `src/` (или ваш код) | Апликациони код који azd примењује | Потребно за сервисе засноване на коду; неки шаблони не садрже апликациони код |
| `README.md` | Како користити шаблон | ✅ Јако препоручено |
| `.azdo/` или `.github/` | Дефиниције CI/CD pipeline | Опционо |
| `.devcontainer/` | Репродуктивно окружење за развој | Опционо |
| `azure.yaml` `metadata` | Идентификација/телеметријске информације шаблона | Препоручено; објављивање Git репозиторијума не захтева |

Нема ту магије: када покренете `azd init --template you/your-repo`, azd клонира репозиторијум и чита `azure.yaml`.

---

## Корак 1: Креирајте Репозиторијум

Направите структуру фасцикли ручно или почните од минималног шаблона и уредите га:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Типичан завршни распоред изгледа овако:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Корак 2: Напишите `azure.yaml`

Ово је срж шаблона. Он говори azd шта и како да примени:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Поље `metadata.template` се користи за телеметрију галерије да би се рачунала употреба. Користите конвенцију `name@version`.

---

## Корак 3: Параметризујте Инфраструктуру

Најважније правило за *поновљиви* шаблон: **никад не користите унапред дефинисана имена, регионе или вредности специфичне за претплату.** Користите параметре и образац ресурса токена тако да исти шаблон ради у било чијој претплати.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Две ствари чине овај шаблон пријатељским:

1. **`azd-env-name` ознака** — azd je користи за праћење и чишћење ресурса по окружењу.
2. **`uniqueString(...)` ресурсни токен** — производи стабилан хеш суфикс за смањење судара; није гаранција глобалне јединствености.

Недостајући `modules/web.bicep` мора прихватити `name`, `location` и `tags`, провизирати окружење/регистар и апликацију Container Apps, означити апликацију са `azd-service-name: web` и извозити `uri`. Мора такође изложити вредности регистра потребне за изабрани ток изградње/примене (на пример `AZURE_CONTAINER_REGISTRY_ENDPOINT` из коренског модула). Само излазна тачка не повезује сервис за откривање, подешавања апликације или аутентификацију регистра.

Обезбедите одговарајући фајл са параметрима који чита вредности које azd аутоматски убризгава из окружења:

Сачувајте следеће као `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd аутоматски замењује `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` из текућег окружења.

---

## Корак 4: Тестирајте Ваш Шаблон Локално

Пре него што поделите, уверите се да шаблон ради из почетног стања.

**Тестирајте из локалне фасцикле** (није потребан Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Затим тестирајте чишћење** — добар шаблон се потпуно очисти:

```bash
azd down --force --purge
```

Ако `azd down` оставља ресурсе, проверите откривање окружења/групе ресурса, спољне/заједничке ресурсе, дозволе, закључавања и заштиту од брисања. `--purge` не брише локалну `.azure/` стање.

> **Савет:** након што обезбедите све недостајуће фајлове, прво покрените `azd provision --preview`. Прегледајте hooks пре прегледа јер могу извршавати команде са споредним ефектима. Преглед није процена цене или гаранција да ће провизија успети.

---

## Корак 5: Објавите Шаблон

Пошаљите репозиторијум на GitHub (јавно ако желите да га други користе):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Сада га може користити било ко:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Корак 6 (Опционо): Поšаљите у Awesome AZD

Галерија [Awesome AZD](https://azure.github.io/awesome-azd/) приказује шаблоне заједнице. Да бисте били наведени, ваш репо треба да садржи:

- ✅ Јасан `README.md` са предусловима, дијаграмом архитектуре и напоменама о ценама
- ✅ Радни `azure.yaml` са `metadata.template`
- ✅ Инфраструктуру која се чисто провизира у свежој претплати
- ✅ `LICENSE` фајл
- ✅ (Препоручено) `.devcontainer/` за једнокликове Codespaces

Поšаљите отварајући pull request који додаје ваш шаблон у датотеку са подацима галерије, пратећи смернице за допринос у [Awesome AZD репозиторијуму](https://github.com/Azure/awesome-azd).

---

## Уобичајене Замке

| Замка | Решење |
|---------|-----|
| Унапред дефинисана имена ресурса | Користите `uniqueString()` ресурсни токен |
| `azd down` оставља ресурсе | Ознаците сваки ресурс (или групу ресурса) са `azd-env-name` |
| Шаблон ради за вас, али не и за друге | Уклоните претплатничке ИД-ове, тенант ИД-ове и претпоставке о регионима |
| Излази нису повезани са апликацијом | Поклапајте `azd-service-name`/`resourceName` за примену и експлицитно мапирајте излазе у подешавања апликације |
| Одбијен пријем у галерију | Додајте `README.md`, `LICENSE` и `metadata.template` |

---

## Резиме

- Шаблон је само Git репо са `azure.yaml`, `infra/` и вашим кодом.
- Параметризујте све – имена, регионе и ИД-ове – да би радио било где.
- Увек означите ресурсе са `azd-env-name` да би `azd down` функционисао.
- Тестирајте локално помоћу `azd init --template <local-path>` пре објављивања.
- Додајте метаподатке и README за пријаву у Awesome AZD.

---

## 🔗 Навигација

| Смер | Ресурс |
|-----------|----------|
| **Претходно** | [Водич за примену](deployment-guide.md) |
| **Почетак поглавља** | [Поглавље 4: Инфраструктура као код](README.md) |
| **Следеће поглавље** | [Поглавље 5: Мулти-Агент решења](../chapter-05-multi-agent/README.md) |

## 📖 Повезани ресурси

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->