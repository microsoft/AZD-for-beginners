# Креирање Власитог azd Шаблона

**Навигација Kњигом:**
- **📚 Почетак курса**: [AZD За Почетнике](../../README.md)
- **📖 Тренутно Поглавље**: Поглавље 4 - Инфраструктура као Код & Деплојмент
- **⬅️ Претходно**: [Водич за деплојмент](deployment-guide.md)
- **🚀 Следеће Поглавље**: [Поглавље 5: Мулти-Агент Решења](../chapter-05-multi-agent/README.md)

> Проверено са `azd 1.27.1` у јулу 2026.

## Увод

До сада сте *користили* шаблоне са `azd init --template <name>`. Али кад ваша екипа буде имала распоред пројекта који им се свиђа — на пример, Контейнер Апликацију са Cosmos DB и одговарајућим мониторингом — желећете да то претворите у сопствени шаблон за поновну употребу. Шаблон је само Git репозиторијум са предвидивом структуром коју azd зна како да чита. Овај час показује како направити један од нуле, тестирати га и (опционално) објавити за заједницу.

## Циљеви учења

На крају овог часа, моћи ћете:
- Да разумете шта чини фасциклу "azd шаблоном"
- Да знате потребне фајлове и распоред фасцикли
- Да додате `azure.yaml` и `infra/` које други могу да користе
- Да тестирате ваш шаблон локално пре него што га поделите
- Да објавите и (опционално) доставите у Awesome AZD

## Очекивани резултати

После завршетка овог часа, моћи ћете:
- Да изграђујете нови репозиторијум за шаблон
- Да параметризујете инфраструктуру тако да ради у било којој претплати
- Да валидирате шаблон са `azd init` и `azd up`
- Да додате метаподатке које захтева галерија заједнице

---

## Шта је заправо шаблон?

azd шаблон је **Git репозиторијум** који садржи, најмање:

| Фајл / фасцикла | Сврха | Обавезно? |
|---------------|---------|-----------|
| `azure.yaml` | Описује сервисе, хостове и провајдера инфраструктуре | ✅ Да |
| `infra/` | Bicep, Terraform или Pulumi који обезбеђује ресурсе | ✅ Да |
| `src/` (или ваш код) | Код апликације коју azd деплојује | ✅ Да |
| `README.md` | Како користити шаблон | ✅ Јако препоручљиво |
| `.azdo/` или `.github/` | Дефиниције CI/CD путање | Опционо |
| `.devcontainer/` | Репродусибилно окружење за развој | Опционо |
| `azure.yaml` `metadata` | Галерија + телеметрија | Опционо (обавезно за објављивање) |

Нема ништа магично: кад покренете `azd init --template you/your-repo`, azd клонира репо и чита `azure.yaml`.

---

## Корак 1: Креирајте Репозиторијум

Ручно направите структуру фасцикли или почните од минималног шаблона и уредите га:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Креирај стандардни изглед
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

Ово је срце шаблона. Каже azd шта и како да деплојује:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Поље `metadata.template` користи телеметрија галерије за бројање употребе. Користите конвенцију `name@version`.

---

## Корак 3: Параметризујте Инфраструктуру

Најважније правило за *шаблон који се може поново користити*: **није дозвољено жаргонско уношење имена, региона или вредности специфичних за претплату.** Користите параметре и ресурсне токене тако да исти шаблон ради у било чијој претплати.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Две ствари чине овај шаблон погодним:

1. **таг `azd-env-name`** — azd га користи да прати и очисти ресурсе по окружењу.
2. **ресурсни токен `uniqueString(...)`** — производи стабилан, глобално јединствен суфикс да имена не колидирају.

Обезбедите одговарајући фајл параметара који чита вредности које azd убацује из окружења:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd аутоматски замењује `${AZURE_ENV_NAME}` и `${AZURE_LOCATION}` из тренутног окружења.

---

## Корак 4: Тестирајте Шаблон Локално

Пре дељења, проверите да шаблон ради из чистог стања.

**Тестирајте из локалне фасцикле** (није потребан Git push):

```bash
# Из празног директоријума, иницијализујте користећи вашу локалну путању шаблона
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Обезбедити и распоредити од почетка до краја
azd auth login
azd up
```

**Онда тестирајте растављање**—добар шаблон у потпуности очисти ресурсе:

```bash
azd down --force --purge
```

Ако `azd down` оставља ресурсе, вероватно сте заборавили таг `azd-env-name` на неком ресурсу.

> **Савет:** прво покрените `azd provision --preview`. Он извршава шта-ако анализу и показује грешке у шаблону пре него што се било који ресурс креира.

---

## Корак 5: Објавите Шаблон

Ставите репозиторијум на GitHub (јаван ако желите да га други користе):

```bash
gh repo create my-azd-template --public --source=. --push
```

Сада га свако може користити:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Корак 6 (Опционо): Пошаљите у Awesome AZD

[Awesome AZD галерија](https://azure.github.io/awesome-azd/) садржи шаблоне заједнице. Да бисте били наведени, ваш репо треба да садржи:

- ✅ Јасан `README.md` са предусловима, дијаграмом архитектуре и напоменама о трошковима
- ✅ Радни `azure.yaml` са `metadata.template`
- ✅ Инфраструктуру која може чисто да се обезбеди у новој претплати
- ✅ Фајл `LICENSE`
- ✅ (Препоручено) `.devcontainer/` за једно-кликом Codespaces

Пошаљите тако што ћете отворити pull request који додаје ваш шаблон у датотеку података галерије, пратећи упутства за допринос у [Awesome AZD репозиторијуму](https://github.com/Azure/awesome-azd).

---

## Чести Заноктице

| Пречица | Решавање |
|---------|-----|
| Задато у коду име ресурса | Користите ресурсни токен `uniqueString()` |
| `azd down` оставља ресурсе | Ознаците сваки ресурс (или ресурсну групу) са `azd-env-name` |
| Шаблон ради за вас, не ради за друге | Уклоните претплатне ИД-ове, ИД-ове станара и претпоставке о регионима |
| Излазне вредности нису повезане у апликацији | Извозите `SERVICE_<NAME>_ENDPOINT_URL` и друге `AZURE_*` излазе |
| Подношење у галерију одбијено | Додајте `README.md`, `LICENSE`, и `metadata.template` |

---

## Резиме

- Шаблон је само Git репо са `azure.yaml`, `infra/` и вашим кодом.
- Параметризујте све — имена, регионе и ИД-ове — да ради било где.
- Увек маркирајте ресурсима са `azd-env-name` да би `azd down` радио.
- Тестирајте локално са `azd init --template <local-path>` пре објављивања.
- Додајте метаподатке и README да бисте доставили у Awesome AZD.

---

## 🔗 Навигација

| Правaц | Ресурс |
|-----------|----------|
| **Претходно** | [Водич за деплојмент](deployment-guide.md) |
| **Почетак Поглавља** | [Поглавље 4: Инфраструктура као Код](README.md) |
| **Следеће Поглавље** | [Поглавље 5: Мулти-Агент Решења](../chapter-05-multi-agent/README.md) |

## 📖 Повезани Ресурси

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Галерија](https://azure.github.io/awesome-azd/)
- [Званична azd документација за шаблоне](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->