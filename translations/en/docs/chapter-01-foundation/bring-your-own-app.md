# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Command and configuration review target: `azd 1.37.2` (November 2026). Generated files depend on the detected application; Azure deployment was not executed in this review.

## Introduction

In [Your First Project](first-project.md) you deployed an app by starting from a template. But most of the time you already *have* an app—a Node.js API, a Python Flask service, a .NET web app—sitting in a folder on your machine. This lesson shows how to add azd to that existing code so you can deploy it with `azd up`, no template required.

## Learning Goals

By the end of this lesson, you will:
- Understand the three ways to start an azd project
- Run `azd init` inside an existing codebase
- Understand what `azure.yaml` and the `infra/` folder do for your app
- Know when to let azd generate infrastructure vs. write your own
- Deploy your existing app to Azure with `azd up`

## Learning Outcomes

After completing this lesson, you will be able to:
- Initialize azd in a project you already have
- Read and edit a basic `azure.yaml` file
- Generate starter infrastructure with `azd infra generate`
- Choose an appropriate Azure host for your app
- Deploy and clean up your own application

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name> .` (empty directory) | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

You already practiced the first option. This lesson covers the second—the most common real-world scenario.

---

## Step 1: Run `azd init` in Your Project

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pick **"Use code in the current directory."** azd then scans your folder, detects your language and framework, and proposes a host.

### What azd detects

azd looks for application signals such as `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or a `Dockerfile`. The from-code flow is not a general host-selection wizard for every supported deployment target:

| Your app | Likely detected host |
|----------|----------------------|
| Supported Node.js / Python / .NET web app | Typically Azure Container Apps; inspect the generated definition |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app or Static Web Apps project | Use a matching template or author `azure.yaml` and infrastructure if from-code does not support your layout |

Confirm the detected service(s), and azd scaffolds the files you need.

---

## Step 2: Understand What azd Created

After init, inspect `azure.yaml`. The generated-infrastructure flow can keep infrastructure implicit until you run `azd infra generate`; do not assume `infra/` already exists:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

This is the heart of an azd project. The following **illustrative App Service definition** requires matching App Service infrastructure; it is not a reason to change a generated Container Apps host without changing infrastructure:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

The `services` block is the key part: each entry maps a folder of your code to an Azure host. If your app has both a frontend and an API, you'll have two services.

### `infra/` — your Azure resources as code

The `infra/` folder holds Bicep files that define the Azure resources your app needs (the App Service, the database, etc.). You don't have to write these by hand—azd generates a working starting point. You *can* edit them later to add resources or tighten security (covered in [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Want to see or customize the generated infrastructure before deploying? Run `azd infra generate` (also available as `azd infra synth`) to write the IaC to disk so you can review and version-control it.

---

## Step 3: Set Required Configuration

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

This stores a local value only. To affect the app, explicitly consume it in infrastructure parameters, a supported service setting, or a hook; setting an arbitrary variable does not configure the deployed runtime.

For real secrets, store them in Key Vault and reference them from your infrastructure—see [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Configure the app's package scripts or service `prepackage` hook; use `dist` for deployment output, not `buildCommand`/`outputPath` |
| App starts but returns errors | Missing config/secret | Wire values into runtime app settings or a Key Vault reference; `azd env set` alone is not enough |
| Wrong host chosen | Auto-detection does not match your needs | Change both `host:` and the corresponding infrastructure, or choose a matching template |

For more, see [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** adds azd to an app you already have.
- `azure.yaml` maps your code folders to Azure hosts; `infra/` defines the resources as Bicep.
- `azd infra generate` lets you review or customize the generated infrastructure.
- Once initialized, your existing app uses the exact same `azd up` / `azd down` workflow as a template-based app.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Related Resources

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->