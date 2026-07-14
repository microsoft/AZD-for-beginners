# Pagsusulat ng Sariling azd Template

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Infrastructure as Code at Deployment
- **⬅️ Nakaraang**: [Deployment Guide](deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Napatunayan gamit ang `azd 1.27.1` noong Hulyo 2026.

## Panimula

Sa ngayon, *ginamit* mo na ang mga template gamit ang `azd init --template <name>`. Ngunit kapag mayroon ka nang layout ng proyekto na gusto ng iyong koponan—halimbawa, isang Container App na may Cosmos DB at tamang monitoring—gusto mong gawing reusable template ang iyong sarili. Ang template ay isang Git repository na may predictable na istruktura na alam ng azd kung paano basahin. Itong aralin ay nagpapakita kung paano gumawa nito mula sa simula, subukan ito, at (opsyonal) ipublish sa community gallery.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng araling ito, malalaman mo:
- Ano ang nagpapagawa sa isang folder na isang "azd template"
- Alam ang mga kailangang file at layout ng folder
- Magdagdag ng `azure.yaml` at `infra/` na maaaring gamitin ng iba
- Subukan ang iyong template sa lokal bago ibahagi
- I-publish ito at (opsyonal) isumite sa Awesome AZD

## Mga Inaasahang Kinalabasan sa Pagkatuto

Pagkatapos matapos ang araling ito, magagawa mo nang:
- Mag-scaffold ng bagong template repository
- I-parameterize ang infrastructure upang gumana sa anumang subscription
- I-validate ang isang template gamit ang `azd init` at `azd up`
- Magdagdag ng metadata na kailangan ng community gallery

---

## Ano ba Talaga ang Template?

Ang azd template ay **isang Git repository** na naglalaman, sa minimum:

| File / folder | Layunin | Kailangan ba? |
|---------------|---------|-----------|
| `azure.yaml` | Naglalarawan ng mga serbisyo, hosts, at infra provider | ✅ Oo |
| `infra/` | Bicep, Terraform, o Pulumi na nagpo-provision ng mga resources | ✅ Oo |
| `src/` (o ang iyong code) | Ang application code na dine-deploy ng azd | ✅ Oo |
| `README.md` | Paano gamitin ang template | ✅ Lubos na inirerekomenda |
| `.azdo/` o `.github/` | Mga definisyon ng CI/CD pipeline | Opsyonal |
| `.devcontainer/` | Reproducible dev environment | Opsyonal |
| `azure.yaml` `metadata` | Gallery + telemetry info | Opsyonal (kailangan para mag-publish) |

Walang kakaiba dito: kapag pinatakbo mo ang `azd init --template you/your-repo`, kinokopya ng azd ang repo at binabasa ang `azure.yaml`.

---

## Hakbang 1: Scaffold ng Repository

Gumawa ng istruktura ng folder nang mano-mano o magsimula mula sa isang minimal na template at i-edit ito:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Gumawa ng karaniwang layout
mkdir -p src infra
```

Ang isang tipikal na tapos na layout ay ganito ang hitsura:

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

> Ang `metadata.template` na field ang ginagamit ng gallery telemetry para bilangin ang paggamit. Gamitin ang `name@version` na konbensyon.

---

## Hakbang 3: Gawing Parameterized ang Infrastructure

Ang pinakamahalagang patakaran para sa *reusable* na template: **huwag kailanman i-hardcode ang mga pangalan, rehiyon, o subscription-specific na mga halaga.** Gamitin ang mga parameter at resource token pattern upang ang parehong template ay gumana sa kahit kaninong subscription.

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
2. **`uniqueString(...)` resource token** — gumagawa ng matatag, globally-unique na suffix para hindi magdikit-dikit ang mga pangalan.

Magbigay ng kaparehong parameters file na bumabasa ng mga halagang ini-inject ng azd mula sa environment:

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

Sa awtomatikong pagpapalit, pinapalitan ng azd ang `${AZURE_ENV_NAME}` at `${AZURE_LOCATION}` mula sa kasalukuyang environment.

---

## Hakbang 4: Subukan ang Iyong Template sa Lokal

Bago magbahagi, patunayan na gumagana ang template mula sa malinis na estado.

**Subukan mula sa lokal na folder** (hindi kailangan mag-push sa Git):

```bash
# Mula sa walang laman na direktoryo, i-initialize gamit ang iyong lokal na template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Mag-provision + mag-deploy mula simula hanggang matapos
azd auth login
azd up
```

**Pagkatapos subukan ang teardown**—ang isang magandang template ay naglilinis nang lubusan:

```bash
azd down --force --purge
```

Kung may natitirang resources ang `azd down`, malamang nakaligtaan mong lagyan ng `azd-env-name` tag ang isang resource.

> **Tip:** patakbuhin muna ang `azd provision --preview`. Ginagawa nito ang isang what-if at ipinapakita ang mga error sa template bago malikha ang anumang resource.

---

## Hakbang 5: I-publish ang Template

I-push ang repository sa GitHub (pampubliko kung gusto mo na magamit ito ng iba):

```bash
gh repo create my-azd-template --public --source=. --push
```

Maaari na ngayong gamitin ito ng kahit sino:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Hakbang 6 (Opsyonal): Isumite sa Awesome AZD

Ang [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ay naglilista ng mga community template. Para mapabilang, dapat kasama sa iyong repo ang:

- ✅ Malinaw na `README.md` na may prerequisites, diagram ng arkitektura, at mga tala sa gastos
- ✅ Gumaganang `azure.yaml` na may `metadata.template`
- ✅ Infrastructure na nagpo-provision nang malinis sa isang bagong subscription
- ✅ May `LICENSE` na file
- ✅ (Inirerekomenda) Isang `.devcontainer/` para sa one-click na Codespaces

Mag-submit sa pamamagitan ng pag-open ng pull request na nagdadagdag ng iyong template sa data file ng gallery, alinsunod sa contribution guide sa [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Mga Karaniwang Pagkakamali

| Pagkakamali | Ayusin |
|---------|-----|
| Hardcoded na mga pangalan ng resource | Gamitin ang `uniqueString()` resource token |
| May natitirang resources pagkatapos ng `azd down` | Lagyan ng tag na `azd-env-name` ang bawat resource (o resource group) |
| Gumagana ang template para sa iyo, pumapalya para sa iba | Alisin ang subscription IDs, tenant IDs, at rehiyon na assumption |
| Outputs hindi naka-wire sa app | I-export ang `SERVICE_<NAME>_ENDPOINT_URL` at iba pang `AZURE_*` outputs |
| Tinanggihan ang submission sa gallery | Magdagdag ng `README.md`, `LICENSE`, at `metadata.template` |

---

## Buod

- Ang template ay isang Git repo lamang na may `azure.yaml`, `infra/`, at iyong code.
- I-parameterize ang lahat—mga pangalan, rehiyon, at IDs—para tumakbo kahit saan.
- Laging lagyan ng tag na `azd-env-name` ang mga resources para gumana ang `azd down`.
- Subukan sa lokal gamit ang `azd init --template <local-path>` bago mag-publish.
- Magdagdag ng metadata at README para isumite sa Awesome AZD.

---

## 🔗 Pag-navigate

| Direksyon | Resource |
|-----------|----------|
| **Nakaraan** | [Deployment Guide](deployment-guide.md) |
| **Tahanan ng Kabanata** | [Kabanata 4: Infrastructure as Code](README.md) |
| **Susunod na Kabanata** | [Kabanata 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Kaugnay na Mga Mapagkukunan

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Opisyal na dokumentasyon ng azd template](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->