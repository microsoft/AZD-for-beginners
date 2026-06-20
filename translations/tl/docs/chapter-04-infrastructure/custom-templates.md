# Paggawa ng Iyong Sariling azd Template

**Navigasyon ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Imprastruktura bilang Code at Pag-deploy
- **⬅️ Nakaraan**: [Gabay sa Pag-deploy](deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Mga Solusyon na Maramihang Ahente](../chapter-05-multi-agent/README.md)

> Napatunayan laban sa `azd 1.25.6` noong Hunyo 2026.

## Panimula

Sa ngayon ikaw ay *ginamit* ng mga template gamit ang `azd init --template <name>`. Ngunit kapag mayroon kang layout ng proyekto na gusto ng iyong koponan—halimbawa, isang Container App na may Cosmos DB at tamang monitoring—gusto mong gawing isang reusable na template iyon para sa sarili mong paggamit. Ang isang template ay simpleng isang Git repository na may inaasahang istruktura na alam kung paano basahin ng azd. Itong aralin ay nagpapakita kung paano bumuo mula sa simula, subukan ito, at (opsyonal) i-publish sa gallery ng komunidad.

## Mga Layunin sa Pagkatuto

By the end of this lesson, you will:
- Maunawaan kung ano ang nagpapagawa sa isang folder na isang "azd template"
- Alamin ang mga kinakailangang file at layout ng folder
- Magdagdag ng `azure.yaml` at `infra/` na maaaring gamitin muli ng ibang tao
- Subukan ang iyong template nang lokal bago ibahagi ito
- I-publish ito at (opsyonal) isumite sa Awesome AZD

## Mga Kinalabasan ng Pagkatuto

After completing this lesson, you will be able to:
- Mag-scaffold ng bagong template repository
- Gawing parameterized ang imprastruktura para gumana sa anumang subscription
- Balidahin ang isang template gamit ang `azd init` at `azd up`
- Idagdag ang metadata na kailangan ng gallery ng komunidad

---

## Ano nga ba ang Template?

Ang azd template ay **isang Git repository** na naglalaman, sa pinakamaliit, ng:

| File / folder | Layunin | Kinakailangan? |
|---------------|---------|-----------|
| `azure.yaml` | Naglalarawan ng mga serbisyo, host, at provider ng imprastruktura | ✅ Oo |
| `infra/` | Bicep, Terraform, o Pulumi na nagpo-provision ng mga resources | ✅ Oo |
| `src/` (or your code) | Ang application code na dine-deploy ng azd | ✅ Oo |
| `README.md` | Paano gamitin ang template | ✅ Lubos na inirerekomenda |
| `.azdo/` or `.github/` | Mga definisyon ng CI/CD pipeline | Opsyonal |
| `.devcontainer/` | Nare-reproduce na dev environment | Opsyonal |
| `azure.yaml` `metadata` | Impormasyon para sa gallery at telemetry | Opsyonal (kailangan para mag-publish) |

There is nothing magic here: when you run `azd init --template you/your-repo`, azd clones the repo and reads `azure.yaml`.

---

## Hakbang 1: I-scaffold ang Repository

Create the folder structure by hand or start from a minimal template and edit it:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Gumawa ng karaniwang layout
mkdir -p src infra
```

A typical finished layout looks like this:

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

## Hakbang 2: Isulat ang `azure.yaml`

Ito ang puso ng template. Sinasabi nito sa azd kung ano ang ide-deploy at paano:

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

> Ang field na `metadata.template` ang ginagamit ng telemetry ng gallery para bilangin ang paggamit. Gamitin ang konbensiyon na `name@version`.

---

## Hakbang 3: Gawing Parameterized ang Imprastruktura

Ang isang pinakamahalagang alituntunin para sa isang *reusable* na template: **huwag kailanman i-hardcode ang mga pangalan, rehiyon, o mga value na partikular sa subscription.** Gumamit ng mga parameter at ang resource token pattern para gumana ang parehong template sa subscription ng sinuman.

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

Dalawang bagay ang nagpapadali sa template na ito:

1. **`azd-env-name` tag** — ginagamit ito ng azd para subaybayan at linisin ang mga resources kada environment.
2. **`uniqueString(...)` resource token** — gumagawa ng matatag, natatanging suffix sa buong mundo para hindi magbanggaan ang mga pangalan.

Magbigay ng katugmang parameters file na bumabasa ng mga value na ini-inject ng azd mula sa environment:

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

Awtomatikong pinalitan ng azd ang `${AZURE_ENV_NAME}` at `${AZURE_LOCATION}` mula sa kasalukuyang environment.

---

## Hakbang 4: Subukan ang Iyong Template nang Lokal

Bago magbahagi, patunayan na gumagana ang template mula sa isang malinis na estado.

**Subukan mula sa lokal na folder** (hindi kailangan mag-push sa Git):

```bash
# Mula sa walang laman na direktoryo, i-initialize gamit ang lokal na path ng template
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Magsagawa ng provisioning at deployment mula simula hanggang matapos
azd auth login
azd up
```

**Pagkatapos, subukan ang teardown**—ang isang magandang template ay naglilinis nang kumpleto:

```bash
azd down --force --purge
```

Kung ang `azd down` ay nag-iiwan ng mga resource, malamang na nakaligtaan mong lagyan ng `azd-env-name` tag ang isang resource.

> **Tip:** patakbuhin muna ang `azd provision --preview`. Gumagawa ito ng what-if at ipinapakita ang mga error sa template bago malikha ang anumang resource.

---

## Hakbang 5: I-publish ang Template

I-push ang repository sa GitHub (public kung gusto mong magamit ito ng iba):

```bash
gh repo create my-azd-template --public --source=. --push
```

Maari na ngayong gamitin ng sinuman:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Hakbang 6 (Opsyonal): Isumite sa Awesome AZD

Ang [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ay naglilista ng mga template mula sa komunidad. Para mailista, ang iyong repo ay dapat maglaman ng:

- ✅ Isang malinaw na `README.md` na may mga prerequisites, diagram ng arkitektura, at mga tala tungkol sa gastos
- ✅ Isang gumaganang `azure.yaml` na may `metadata.template`
- ✅ Imprastruktura na nagpo-provision nang maayos sa isang bagong subscription
- ✅ Isang `LICENSE` file
- ✅ (Inirerekomenda) Isang `.devcontainer/` para sa one-click Codespaces

Isumite sa pamamagitan ng pagbukas ng pull request na nagdaragdag ng iyong template sa data file ng gallery, pagsunod sa contribution guide sa [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Mga Karaniwang Sagabal

| Sagabal | Ayos |
|---------|-----|
| Nakahardcode na mga pangalan ng resource | Gamitin ang `uniqueString()` resource token |
| `azd down` leaves resources | Lagyan ng tag ang bawat resource (o ang resource group) ng `azd-env-name` |
| Gumagana ang template para sa iyo, pumapalya para sa iba | Alisin ang subscription IDs, tenant IDs, at mga palagay tungkol sa rehiyon |
| Hindi nakakabit ang mga outputs sa app | I-export ang `SERVICE_<NAME>_ENDPOINT_URL` at iba pang `AZURE_*` outputs |
| Tinanggihan ang pagsusumite sa gallery | Magdagdag ng `README.md`, `LICENSE`, at `metadata.template` |

---

## Buod

- Ang template ay simpleng isang Git repo na may `azure.yaml`, `infra/`, at iyong code.
- Gawing parameterized ang lahat—mga pangalan, rehiyon, at mga ID—upang tumakbo ito kahit saan.
- Laging lagyan ng tag ang mga resource gamit ang `azd-env-name` para gumana ang `azd down`.
- Subukan lokal gamit ang `azd init --template <local-path>` bago mag-publish.
- Magdagdag ng metadata at README para isumite sa Awesome AZD.

---

## 🔗 Navigasyon

| Direksyon | Mapagkukunan |
|-----------|----------|
| **Nakaraan** | [Gabay sa Pag-deploy](deployment-guide.md) |
| **Tahanan ng Kabanata** | [Kabanata 4: Imprastruktura bilang Code](README.md) |
| **Susunod na Kabanata** | [Kabanata 5: Mga Solusyon na Maramihang Ahente](../chapter-05-multi-agent/README.md) |

## 📖 Mga Kaugnay na Mapagkukunan

- [Pagpo-provision ng mga Resource](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Opisyal na dokumentasyon ng azd template](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->