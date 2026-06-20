# How to make your own azd template

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Dem don validate am with `azd 1.25.6` for June 2026.

## Introduction

So far you don *consume* templates wit `azd init --template <name>`. But once you get project layout wey your team like — for example, a Container App with a Cosmos DB and the correct monitoring — you go wan turn am into reusable template wey you fit use again. A template na just a Git repository wey get predictable structure wey azd fit read. Dis lesson go show you how to build am from scratch, test am, and (if you want) publish am to the community gallery.

## Learning Goals

By the end of this lesson, you will:
- Understand wetin dey make a folder become an "azd template"
- Know the required files and folder layout
- Add an `azure.yaml` and `infra/` wey other people fit reuse
- Test your template locally before you share am
- Publish am and (optionally) submit am to Awesome AZD

## Learning Outcomes

After completing this lesson, you will be able to:
- Scaffold a new template repository
- Parameterize infrastructure so e go work in any subscription
- Validate a template with `azd init` and `azd up`
- Add the metadata wey the community gallery dey require

---

## What Is a Template, Really?

An azd template na **a Git repository** wey contain, at minimum:

| File / folder | Wetin e dey do | Need am? |
|---------------|----------------|----------|
| `azure.yaml` | E dey describe services, hosts, and infra provider | ✅ Yes |
| `infra/` | Bicep, Terraform, or Pulumi wey dey provision resources | ✅ Yes |
| `src/` (or your code) | The application code wey azd dey deploy | ✅ Yes |
| `README.md` | How to use the template | ✅ Strongly recommended |
| `.azdo/` or `.github/` | CI/CD pipeline definitions | Optional |
| `.devcontainer/` | Reproducible dev environment | Optional |
| `azure.yaml` `metadata` | Gallery + telemetry info | Optional (na required if you wan publish) |

No be magic: when you run `azd init --template you/your-repo`, azd go clone the repo and read `azure.yaml`.

---

## Step 1: Scaffold the Repository

Create the folder structure by hand or start from a minimal template and edit am:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Make di standard layout
mkdir -p src infra
```

A typical finished layout go look like this:

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

This na the heart of the template. E dey tell azd wetin to deploy and how:

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

> The `metadata.template` field na wetin gallery telemetry dey use to count usage. Use the `name@version` convention.

---

## Step 3: Parameterize the Infrastructure

The single most important rule for a *reusable* template: **no ever hardcode names, regions, or subscription-specific values.** Use parameters and the resource token pattern so the same template go work for anybody subscription.

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

Two things wey make this template-friendly:

1. **`azd-env-name` tag** — azd dey use am to track and clean up resources per environment.
2. **`uniqueString(...)` resource token** — e dey produce stable, globally-unique suffix so names no go collide.

Provide matching parameters file wey go read values azd injects from the environment:

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

azd go substitute `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from the current environment automatically.

---

## Step 4: Test Your Template Locally

Before you share, prove say the template dey work from clean state.

**Test from the local folder** (no Git push required):

```bash
# If di directory dey empty, initialize am wit your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Set up and deploy from start reach finish
azd auth login
azd up
```

**Then test the teardown**—good template go clean up everything:

```bash
azd down --force --purge
```

If `azd down` leave resources behind, you probably miss the `azd-env-name` tag on a resource.

> **Tip:** run `azd provision --preview` first. E go perform a what-if and show template errors before any resource dey created.

---

## Step 5: Publish the Template

Push the repository to GitHub (make am public if you want others to use am):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anybody fit now use am:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

The [Awesome AZD gallery](https://azure.github.io/awesome-azd/) dey list community templates. To make dem list your repo, your repo suppose include:

- ✅ Clear `README.md` wey get prerequisites, architecture diagram, and cost notes
- ✅ A working `azure.yaml` with `metadata.template`
- ✅ Infrastructure wey provisions cleanly in a fresh subscription
- ✅ A `LICENSE` file
- ✅ (Recommended) A `.devcontainer/` for one-click Codespaces

Submit by opening a pull request wey add your template to the gallery's data file, and follow the contribution guide at the [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Wahala | How to fix |
|--------|------------|
| Hardcoded resource names | Use the `uniqueString()` resource token |
| `azd down` leaves resources | Tag every resource (or the resource group) with `azd-env-name` |
| Template works for you, fails for others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs not wired into the app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery submission rejected | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## Summary

- Template na just Git repo with `azure.yaml`, `infra/`, and your code.
- Parameterize everything—names, regions, and IDs—so e fit run anywhere.
- Always tag resources with `azd-env-name` so `azd down` go work.
- Test locally with `azd init --template <local-path>` before you publish.
- Add metadata and a README to submit to Awesome AZD.

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