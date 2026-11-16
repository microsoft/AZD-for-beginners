# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Reviewed against `azd 1.37.2` (November 2026). This is an **authoring walkthrough with partial files**, not a complete template: you must supply application code and `modules/web.bicep` with its environment, registry, Container App, and outputs before deployment. Azure provisioning was not executed in this review.

## Introduction

So far you don don *use* templates wit `azd init --template <name>`. But when you get project setup wey your team like—like, Container App wit Cosmos DB and the proper monitoring—you go wan turn am into your own reusable template. Template be Git repository wey get structure wey azd fit sabi. Dis lesson go show you how to build am from scratch, test am, and (if you want) publish am for community gallery.

## Learning Goals

By di end of dis lesson, you go:
- Understand wetin make folder be "azd template"
- Know di files and folder layout wey you need
- Add `azure.yaml` and `infra/` wey other pipu fit use again
- Test your template for your own machine before you share am
- Publish am and (if you want) submit am to Awesome AZD

## Learning Outcomes

After you finish dis lesson, you fit:
- Scaffold new template repository
- Parameterize infrastructure so e go fit work for any subscription
- Validate template wit `azd init` and `azd up`
- Add metadata wey community gallery need

---

## What Is a Template, Really?

Azd template na **Git repository** wey get at least:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Describes services, hosts, and infra provider | ✅ Yes |
| `infra/` | Bicep or Terraform provisioning definitions | Required for this explicit-IaC example; generated-infrastructure projects can omit it |
| `src/` (or your code) | The application code azd deploys | Required for source-based services; not all templates contain application code |
| `README.md` | How to use the template | ✅ Strongly recommended |
| `.azdo/` or `.github/` | CI/CD pipeline definitions | Optional |
| `.devcontainer/` | Reproducible dev environment | Optional |
| `azure.yaml` `metadata` | Template identity/telemetry info | Recommended; publishing a Git repository does not require it |

Nothing special dey here: wen you run `azd init --template you/your-repo`, azd dey clone di repo and dey read `azure.yaml`.

---

## Step 1: Scaffold the Repository

Make di folder structure by hand or start from small template and edit am:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Dis na typical finished layout wey e go be like:

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

## Step 2: Write `azure.yaml`

Na dis heart of di template. E go tell azd wetin to deploy and how e go do am:

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

> Di `metadata.template` field na wetin di gallery telemetry use count how dem dey use am. Use di `name@version` style.

---

## Step 3: Parameterize the Infrastructure

Di most important rule for *reusable* template be: **no put hardcoded names, regions, or subscription-specific values.** Use parameters and resource token pattern so same template fit work for anybody subscription.

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

Two tins make dis template better:

1. **`azd-env-name` tag** — azd dey use am track and clear resources by environment.
2. **`uniqueString(...)` resource token** — e dey make stable hash suffix to reduce clash; but no be guarantee say e unique everywhere.

Di missing `modules/web.bicep` suppose accept `name`, `location`, and `tags`, make Container Apps environment/registry and app, tag app wit `azd-service-name: web`, and export `uri`. E sef suppose expose registry values wey di chosen build/deploy fit need (like `AZURE_CONTAINER_REGISTRY_ENDPOINT` from root module). Output endpoint alone no connect service discovery, app settings, or registry authentication.

Provide matching parameters file wey go read di values wey azd put from environment:

Save am as `infra/main.parameters.json`:

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

Azd go replace `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from current environment automatically.

---

## Step 4: Test Your Template Locally

Before you share am, make sure say di template work clean from fresh start.

**Test am from your local folder** (no need Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Then test di teardown** — good template go clear everything well:

```bash
azd down --force --purge
```

If `azd down` leave resources behind, check environment/resource-group discovery, external/shared resources, permissions, locks, and purge protection. `--purge` no dey delete local `.azure/` state.

> **Tip:** after you supply all di missing files, run `azd provision --preview` first. Check hooks before preview because fit run commands wey get side-effects. Preview no be price estimate or guarantee say provisioning go succeed.

---

## Step 5: Publish the Template

Push di repository go GitHub (public if you want make others use am):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Anybody fit use am now:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Step 6 (Optional): Submit to Awesome AZD

Di [Awesome AZD gallery](https://azure.github.io/awesome-azd/) dey list community templates. To add your repo for the list, e suppose get:

- ✅ Clear `README.md` wit prerequisites, architecture diagram, and cost info
- ✅ Working `azure.yaml` wit `metadata.template`
- ✅ Infrastructure wey fit provision well for fresh subscription
- ✅ `LICENSE` file
- ✅ (Recommended) `.devcontainer/` for one-click Codespaces

Submit am by opening pull request wey go add your template to gallery data file, follow di contribution guide for [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Wahala | How to fix am |
|---------|-----|
| Hardcoded resource names | Use `uniqueString()` resource token |
| `azd down` leave resources | Tag every resource (or resource group) wit `azd-env-name` |
| Template work for you, no work for others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs no connect enter app | Match `azd-service-name`/`resourceName` for deployment and map outputs to app settings clearly |
| Gallery submission reject | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## Summary

- Template na just Git repo with `azure.yaml`, `infra/`, and your code.
- Parameterize everything—names, regions, and IDs—so e fit run anywhere.
- Always tag resources wit `azd-env-name` so `azd down` fit work.
- Test am locally wit `azd init --template <local-path>` before you publish am.
- Add metadata and README to submit to Awesome AZD.

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [Deployment Guide](deployment-guide.md) |
| **Chapter Home** | [Chapter 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->