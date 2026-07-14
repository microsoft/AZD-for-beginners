# Di way o take write Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> E don tey we don check am for `azd 1.27.1` for July 2026.

## Introduction

Until now, you don *use* templates with `azd init --template <name>`. But once your team don like di project layout—like Container App wey get Cosmos DB and proper monitoring—you go wan convert am into template wey you fit use yawa yawa. Template na just Git repository wey get correct structure wey azd sabi read. Dis lesson go show you how to build one from scratch, test am, and (if you want) publish am for community gallery.

## Learning Goals

By di time you finish dis lesson, you go:
- Understand wetin make folder be "azd template"
- Know di files and folder layout wey you need
- Add `azure.yaml` and `infra/` wey other pipol fit use
- Test your template locally before you share am
- Publish am and (if you want) send am go Awesome AZD

## Learning Outcomes

After you finish dis lesson, you fit:
- Create new template repository
- Parameterize infrastructure make e fit work for any subscription
- Check template with `azd init` and `azd up`
- Add metadata wey community gallery need

---

## Wetin Template Really Be?

Azd template na **Git repository** wey get, at least:

| File / folder | Wetin E Dey Do | You Need Am? |
|---------------|--------------|--------------|
| `azure.yaml` | E dey talk about services, hosts, and infra provider | ✅ Yes |
| `infra/` | Bicep, Terraform, or Pulumi wey dey provide resources | ✅ Yes |
| `src/` (or your code) | Di application code wey azd dey deploy | ✅ Yes |
| `README.md` | How to use di template | ✅ Strongly recommended |
| `.azdo/` or `.github/` | CI/CD pipeline definitions | Optional |
| `.devcontainer/` | Dev environment wey fit reproduce | Optional |
| `azure.yaml` `metadata` | Gallery + telemetry info | Optional (you need am if you wan publish) |

No magic dey here: when you run `azd init --template you/your-repo`, azd go clone di repo and read `azure.yaml`.

---

## Step 1: Scaffold the Repository

Make di folder structure by hand or start from small template and edit am:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Make di normal layout
mkdir -p src infra
```

Typical finished layout be dis:

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

Na di heart of di template dis one be. E go tell azd wetin and how to deploy:

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

> Di `metadata.template` field na wetin gallery telemetry dey use count how e dey use. Use `name@version` style.

---

## Step 3: Parameterize di Infrastructure

One important rule for *reusable* template: **no hardcode names, regions, or subscription-specific values.** Use parameters and di resource token pattern make di same template fit work for anybody subscription.

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

Two tins wey make dis template friendly be:

1. **`azd-env-name` tag** — azd dey use am track and clean resources for each environment.
2. **`uniqueString(...)` resource token** — e dey produce stable, globally unique suffix make names no clash.

Provide parameter file wey go read values wey azd inject from environment:

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

azd go replace `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from current environment automatically.

---

## Step 4: Test Your Template Locally

Before you share am, prove say template dey work from clean state.

**Test am from local folder** (no need push Git):

```bash
# From one empty folder, begin wit your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Set up + deploy from start to finish
azd auth login
azd up
```

**Then test teardown**—good template go clean up well well:

```bash
azd down --force --purge
```

If `azd down` leave resources, e mean you forget tag `azd-env-name` for some resource.

> **Tip:** run `azd provision --preview` first. E go do what-if check and show template errors before any resource create.

---

## Step 5: Publish di Template

Push di repo go GitHub (make e public if you want other people use am):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anybody fit use am now:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

Di [Awesome AZD gallery](https://azure.github.io/awesome-azd/) dey list community templates. To appear for there, your repo suppose get:

- ✅ Clear `README.md` with prerequisites, architecture diagram, and cost notes
- ✅ Working `azure.yaml` with `metadata.template`
- ✅ Infrastructure wey fit provision cleanly for fresh subscription
- ✅ `LICENSE` file
- ✅ (Recommended) `.devcontainer/` for one-click Codespaces

Submit am by opening pull request wey add your template to gallery data file, follow di contribution guide for [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Wahala | How to Fix Am |
|---------|-------------|
| Hardcoded resource names | Use `uniqueString()` resource token |
| `azd down` don leave resources | Tag all resources (or resource group) with `azd-env-name` |
| Template work for you but fail others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs no connect into app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery reject your submission | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## Summary

- Template na just Git repo with `azure.yaml`, `infra/`, and your code.
- Parameterize everything—names, regions, and IDs—make e fit run anywhere.
- Always tag resources with `azd-env-name` make `azd down` fit work.
- Test am locally with `azd init --template <local-path>` before you publish.
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