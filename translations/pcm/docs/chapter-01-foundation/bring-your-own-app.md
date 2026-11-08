# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Command and configuration review target: `azd 1.37.2` (November 2026). Generated files depend on the detected application; Azure deployment was not executed in this review.

## Introduction

In [Your First Project](first-project.md) you deploy one app by starting from template. But most time you don already *get* one app—a Node.js API, Python Flask service, .NET web app—wey dey for folder for your machine. This lesson go show how to add azd to that kode wey don dey so you fit deploy am wit `azd up`, no template wey you need.

## Learning Goals

By the end of this lesson, you go:
- Understand the three ways to start an azd project
- Run `azd init` inside an existing codebase
- Understand what `azure.yaml` and the `infra/` folder do for your app
- Know when to let azd generate infrastructure vs. write your own
- Deploy your existing app to Azure with `azd up`

## Learning Outcomes

After you don finish this lesson, you go fit:
- Initialize azd for project wey you already get
- Read and edit basic `azure.yaml` file
- Generate starter infrastructure with `azd infra generate`
- Choose correct Azure host for your app
- Deploy and clean up your own application

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name> .` (empty directory) | Learning, or starting new app from proven sample |
| **From your existing code** | `azd init` (for your project folder) | You already get app and you want deploy am |
| **From a Git repo** | `azd init --from-code` (for cloned repo) | To use azd for app wey dey existing repo |

You don practice first option before. This lesson dey talk about second one—di most common for real life.

---

## Step 1: Run `azd init` for Your Project

Open terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd go ask how you wan initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Choose **"Use code in the current directory."** azd go then scan your folder, go detect your language and framework, and go suggest host.

### Wetin azd go detect

azd dey look for app signs like `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or one `Dockerfile`. Di from-code flow no be general host-selection wizard for every supported deployment target:

| Your app | Likely detected host |
|----------|----------------------|
| Supported Node.js / Python / .NET web app | Normally Azure Container Apps; check the generated definition |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app or Static Web Apps project | Use matching template or author `azure.yaml` and infrastructure if from-code no support your layout |

Confirm the detected service(s), and azd go scaffold the files wey you need.

---

## Step 2: Understand Wetin azd Create

After you initialize, look `azure.yaml`. The infrastructure generated flow fit keep infrastructure implicit until you run `azd infra generate`; no assume say `infra/` don dey already:

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

Na di heart of azd project be this one. The following **illustrative App Service definition** need matching App Service infrastructure; no be reason to change generated Container Apps host without changing infrastructure:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

The `services` block be the key part: every entry dey map folder of your code to Azure host. If your app get frontend and API, you go get two services.

### `infra/` — your Azure resources as code

The `infra/` folder get Bicep files wey define di Azure resources wey your app need (di App Service, di database, etc.). You no need write dem by hand—azd go generate wetin fit start all di work. You *fit* edit dem later to add resources or make security tight pass (wey we go talk for [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** You want see or customize di infrastructure wey dem generate before you deploy am? Run `azd infra generate` (wey still dey as `azd infra synth`) to write di IaC for disk so dat you fit review am and handle am for version-control.

---

## Step 3: Set Required Configuration

If your app need settings or secrets (like connection string, API key), no put dem hard-hard for code. Make you use environment values:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

This one dey store local value only. To make am affect di app, you go need consume am explicitly for infrastructure parameters, supported service setting, or hook; jus set any random variable no go configure di deployed runtime.

For real secrets, put dem for Key Vault and refer am from your infrastructure—check [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use di same workflow wey you sabi already:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

When e finish, azd go print your app URL. Check am same way you take check any azd app:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd no detect my app | Manifest missing (like `package.json`) | Add di manifest, or manually pick di host during `azd init` |
| Build fail during `azd up` | App need build step | Configure di app package scripts or service `prepackage` hook; use `dist` for deployment output, no use `buildCommand`/`outputPath` |
| App start but e dey return error | Config/secret dey missing | Wire values into runtime app settings or Key Vault reference; just `azd env set` no go complete am |
| Wrong host choose | Auto-detection no match your needs | Change both `host:` and di infrastructure wey relate, or choose correct template wey match |

For more, check [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** add azd to app wey you get already.
- `azure.yaml` dey map your code folders to Azure hosts; `infra/` dey define resources as Bicep.
- `azd infra generate` make you fit review or customize di infrastructure wey dem generate.
- Once you don initialize, your existing app dey use di exact same `azd up` / `azd down` workflow like template-based app.

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
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->