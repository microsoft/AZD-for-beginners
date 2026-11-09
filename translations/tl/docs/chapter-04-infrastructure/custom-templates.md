# Pagsusulat ng Iyong Sariling azd Template

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Imprastraktura bilang Code at Deployment
- **⬅️ Nakaraan**: [Gabay sa Deployment](deployment-guide.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Mga Solusyon na Multi-Agent](../chapter-05-multi-agent/README.md)

> Sinuri laban sa `azd 1.37.2` (Nobyembre 2026). Ito ay isang **authoring walkthrough na may partial files**, hindi isang kumpletong template: kailangan mo pang ibigay ang code ng aplikasyon at `modules/web.bicep` kasama ang kapaligiran, registry, Container App, at outputs bago i-deploy. Hindi isinagawa ang provisioning ng Azure sa pagsusuring ito.

## Panimula

Sa ngayon ay *gumamit* ka na ng mga template gamit ang `azd init --template <name>`. Ngunit kapag nakabuo ka na ng disenyo ng proyekto na nais ng iyong koponan—halimbawa, isang Container App na may Cosmos DB at tamang monitoring—gusto mong gawing reusable template ito para sa sarili mo. Ang template ay isang Git repository na may predictable na istraktura na alam ng azd kung paano basahin. Ipinapakita sa araling ito kung paano bumuo ng isa mula sa simula, subukan ito, at (opsyonal) i-publish ito sa community gallery.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng araling ito, magagawa mong:
- Maunawaan kung ano ang isang "azd template"
- Malaman ang mga kinakailangang file at layout ng folder
- Magdagdag ng `azure.yaml` at `infra/` na maaaring gamitin muli ng iba
- Subukan ang iyong template nang lokal bago ito ibahagi
- I-publish ito at (opsyonal) isumite ito sa Awesome AZD

## Mga Kinalabasan sa Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- Mag-scaffold ng bagong template repository
- I-parameterize ang imprastraktura upang gumana sa anumang subscription
- I-validate ang template gamit ang `azd init` at `azd up`
- Magdagdag ng metadata na kailangan ng community gallery

---

## Ano nga ba ang Template?

Ang azd template ay **isang Git repository** na naglalaman, sa pinakamaliit, ng:

| File / folder | Layunin | Kinakailangan ba? |
|---------------|---------|-----------|
| `azure.yaml` | Naglalarawan ng mga serbisyo, host, at infra provider | ✅ Oo |
| `infra/` | Mga detalye ng Bicep o Terraform provisioning | Kinakailangan para sa example na ito na explicit-IaC; maaring hindi ito isama sa generated-infrastructure projects |
| `src/` (o ang iyong code) | Ang application code na dine-deploy ng azd | Kinakailangan para sa mga source-based services; hindi lahat ng template ay may application code |
| `README.md` | Paano gamitin ang template | ✅ Lubos na inirerekomenda |
| `.azdo/` o `.github/` | Mga definisyon ng CI/CD pipeline | Opsyonal |
| `.devcontainer/` | Reproducible na dev environment | Opsyonal |
| `azure.yaml` `metadata` | Impormasyon sa identity/telemetri ng template | Inirerekomenda; hindi kailangan kapag nag-publish ng Git repository |

Wala itong mahika dito: kapag pinatakbo mo ang `azd init --template you/your-repo`, kinokopya ng azd ang repo at binabasa ang `azure.yaml`.

---

## Hakbang 1: I-scaffold ang Repository

Gumawa ng istraktura ng folder nang manu-mano o magsimula sa isang minimal na template at i-edit ito:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Ang isang tipikal na tapos na layout ay ganito:

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
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Ang `metadata.template` field ay ginagamit ng gallery telemetry para bilangin ang paggamit. Gamitin ang convention na `name@version`.

---

## Hakbang 3: I-parameterize ang Imprastraktura

Ang pinakamahalagang tuntunin para sa isang *reusable* template: **huwag kailanman i-hardcode ang mga pangalan, rehiyon, o mga halaga na tukoy sa subscription.** Gamitin ang mga parameter at ang resource token pattern para gumana ang parehong template sa subscription ng kahit sino.

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

Dalawang bagay ang nagpapasaya sa template na ito:

1. **`azd-env-name` tag** — ginagamit ito ng azd upang subaybayan at linisin ang mga resources kada kapaligiran.
2. **`uniqueString(...)` resource token** — naglilikha ng stable hash suffix upang mabawasan ang mga collision; hindi ito garantiya ng pangkalahatang pagiging natatangi.

Ang nawawalang `modules/web.bicep` ay dapat tumanggap ng `name`, `location`, at `tags`, mag-provision ng Container Apps environment/registry at app, i-tag ang app gamit ang `azd-service-name: web`, at i-export ang `uri`. Dapat din nitong ipakita ang mga registry values na kailangan ng napiling build/deploy flow (halimbawa ang `AZURE_CONTAINER_REGISTRY_ENDPOINT` mula sa root module). Ang isang endpoint output lamang ay hindi nagkakabit ng service discovery, application settings, o registry authentication.

Magbigay ng katugmang parameters file na bumabasa ng mga halaga na ini-inject ng azd mula sa kapaligiran:

I-save ang sumusunod bilang `infra/main.parameters.json`:

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

Awtomatikong pinapalitan ng azd ang `${AZURE_ENV_NAME}` at `${AZURE_LOCATION}` mula sa kasalukuyang kapaligiran.

---

## Hakbang 4: Subukan ang Iyong Template nang Lokal

Bago ibahagi, patunayan na gumagana ang template mula sa malinis na estado.

**Subukan mula sa lokal na folder** (hindi kailangan ng Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Pagkatapos subukan ang teardown**—ang magandang template ay naglilinis nang lubusan:

```bash
azd down --force --purge
```

Kung nag-iiwan ng mga resources ang `azd down`, suriin ang environment/resource-group discovery, mga panlabas/ibinabahaging resources, mga permiso, mga lock, at purge protection. Hindi binubura ng `--purge` ang lokal na estado ng `.azure/`.

> **Tip:** pagkatapos maibigay ang lahat ng mga nawawalang file, patakbuhin muna ang `azd provision --preview`. Suriin ang mga hook bago mag-preview dahil maaaring magpatupad sila ng mga utos na may side effect. Ang preview ay hindi presyo o garantiya na magtatagumpay ang provisioning.

---

## Hakbang 5: I-publish ang Template

I-push ang repository sa GitHub (publiko kung gusto mong magamit ito ng iba):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Maaari na itong gamitin ng kahit sino:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Hakbang 6 (Opsyonal): Isumite sa Awesome AZD

Ang [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ay naglilista ng mga community template. Para malista, ang iyong repo ay dapat may kasamang:

- ✅ Isang malinaw na `README.md` na may mga prerequisites, diagram ng arkitektura, at tala tungkol sa gastos
- ✅ Isang gumaganang `azure.yaml` na may `metadata.template`
- ✅ Imprastraktura na malinis na naipoprovision sa isang bagong subscription
- ✅ Isang `LICENSE` file
- ✅ (Inirerekomenda) Isang `.devcontainer/` para sa one-click Codespaces

Isumite sa pamamagitan ng pagbukas ng pull request na nagdadagdag ng iyong template sa data file ng gallery, na sumusunod sa gabay ng kontribusyon sa [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Mga Karaniwang Pagkakamali

| Pagkakamali | Solusyon |
|---------|-----|
| Mga hardcoded na pangalan ng resource | Gamitin ang `uniqueString()` resource token |
| Nag-iiwan ng mga resource ang `azd down` | I-tag ang bawat resource (o ang resource group) gamit ang `azd-env-name` |
| Gumagana ang template para sa iyo, hindi para sa iba | Alisin ang mga subscription ID, tenant ID, at mga hinala sa rehiyon |
| Hindi nakakabit ang mga output sa app | Itugma ang `azd-service-name`/`resourceName` para sa deployment at hayagang i-map ang mga output sa app settings |
| Tinanggihan ang submission sa gallery | Magdagdag ng `README.md`, `LICENSE`, at `metadata.template` |

---

## Buod

- Ang template ay isang Git repo na may `azure.yaml`, `infra/`, at ang iyong code.
- I-parameterize ang lahat—mga pangalan, rehiyon, at ID—para tumakbo ito kahit saan.
- Laging i-tag ang mga resource gamit ang `azd-env-name` para gumana ang `azd down`.
- Subukan lokal gamit ang `azd init --template <local-path>` bago mag-publish.
- Magdagdag ng metadata at README para makapag-submit sa Awesome AZD.

---

## 🔗 Pag-navigate

| Direksyon | Pinagkukunan |
|-----------|----------|
| **Nakaraan** | [Gabay sa Deployment](deployment-guide.md) |
| **Tahanan ng Kabanata** | [Kabanata 4: Infrastructure as Code](README.md) |
| **Susunod na Kabanata** | [Kabanata 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Mga Kaugnay na Pinagkukunan

- [Pagprovision ng mga Resource](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Opisyal na dokumentasyon ng azd template](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->