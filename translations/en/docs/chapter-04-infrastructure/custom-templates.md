# Authoring Your Own azd Template

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validated against `azd 1.25.6` in June 2026.

## Introduction

So far you've *consumed* templates with `azd init --template <name>`. But once you have a project layout your team likes—say, a Container App with a Cosmos DB and the right monitoring—you'll want to turn it into a reusable template of your own. A template is just a Git repository with a predictable structure that azd knows how to read. This lesson shows you how to build one from scratch, test it, and (optionally) publish it to the community gallery.

## Learning Goals

By the end of this lesson, you will:
- Understand what makes a folder an "azd template"
- Know the required files and folder layout
- Add an `azure.yaml` and `infra/` that other people can reuse
- Test your template locally before sharing it
- Publish it and (optionally) submit it to Awesome AZD

## Learning Outcomes

After completing this lesson, you will be able to:
- Scaffold a new template repository
- Parameterize infrastructure so it works in any subscription
- Validate a template with `azd init` and `azd up`
- Add the metadata the community gallery requires

---

## What Is a Template, Really?

An azd template is **a Git repository** that contains, at minimum:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | Describes services, hosts, and infra provider | ✅ Yes |
| `infra/` | Bicep, Terraform, or Pulumi that provisions resources | ✅ Yes |
| `src/` (or your code) | The application code azd deploys | ✅ Yes |
| `README.md` | How to use the template | ✅ Strongly recommended |
| `.azdo/` or `.github/` | CI/CD pipeline definitions | Optional |
| `.devcontainer/` | Reproducible dev environment | Optional |
| `azure.yaml` `metadata` | Gallery + telemetry info | Optional (required to publish) |

There is nothing magic here: when you run `azd init --template you/your-repo`, azd clones the repo and reads `azure.yaml`.

---

## Step 1: Scaffold the Repository

Create the folder structure by hand or start from a minimal template and edit it:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
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

## Step 2: Write `azure.yaml`

This is the heart of the template. It tells azd what to deploy and how:

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

> The `metadata.template` field is what gallery telemetry uses to count usage. Use the `name@version` convention.

---

## Step 3: Parameterize the Infrastructure

The single most important rule for a *reusable* template: **never hardcode names, regions, or subscription-specific values.** Use parameters and the resource token pattern so the same template works in anyone's subscription.

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

Two things make this template-friendly:

1. **`azd-env-name` tag** — azd uses it to track and clean up resources per environment.
2. **`uniqueString(...)` resource token** — produces a stable, globally-unique suffix so names don't collide.

Provide a matching parameters file that reads values azd injects from the environment:

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

azd substitutes `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from the current environment automatically.

---

## Step 4: Test Your Template Locally

Before sharing, prove the template works from a clean state.

**Test from the local folder** (no Git push required):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provision + deploy end to end
azd auth login
azd up
```

**Then test the teardown**—a good template cleans up completely:

```bash
azd down --force --purge
```

If `azd down` leaves resources behind, you probably missed the `azd-env-name` tag on a resource.

> **Tip:** run `azd provision --preview` first. It performs a what-if and surfaces template errors before any resource is created.

---

## Step 5: Publish the Template

Push the repository to GitHub (public if you want others to use it):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anyone can now use it:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

The [Awesome AZD gallery](https://azure.github.io/awesome-azd/) lists community templates. To be listed your repo should include:

- ✅ A clear `README.md` with prerequisites, an architecture diagram, and cost notes
- ✅ A working `azure.yaml` with `metadata.template`
- ✅ Infrastructure that provisions cleanly in a fresh subscription
- ✅ A `LICENSE` file
- ✅ (Recommended) A `.devcontainer/` for one-click Codespaces

Submit by opening a pull request that adds your template to the gallery's data file, following the contribution guide at the [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | Use the `uniqueString()` resource token |
| `azd down` leaves resources | Tag every resource (or the resource group) with `azd-env-name` |
| Template works for you, fails for others | Remove subscription IDs, tenant IDs, and region assumptions |
| Outputs not wired into the app | Export `SERVICE_<NAME>_ENDPOINT_URL` and other `AZURE_*` outputs |
| Gallery submission rejected | Add `README.md`, `LICENSE`, and `metadata.template` |

---

## Summary

- A template is just a Git repo with `azure.yaml`, `infra/`, and your code.
- Parameterize everything—names, regions, and IDs—so it runs anywhere.
- Always tag resources with `azd-env-name` so `azd down` works.
- Test locally with `azd init --template <local-path>` before publishing.
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
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->