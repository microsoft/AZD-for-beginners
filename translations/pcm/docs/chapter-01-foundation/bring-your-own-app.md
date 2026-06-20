# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Dem don validate am with `azd 1.25.6` for June 2026.

## Introduction

For [Your First Project](first-project.md) you deploy app start from template. But most time you don already *get* app — Node.js API, Python Flask service, .NET web app — wey dey for folder for your machine. Dis lesson go show how to add azd to the code wey don already dey so you fit deploy am with `azd up`, no template needed.

## Learning Goals

By the end of dis lesson, you go:
- Understand the three ways to start an azd project
- Run `azd init` inside an existing codebase
- Understand wetin `azure.yaml` and the `infra/` folder dey do for your app
- Know when to make azd generate infrastructure vs. write your own
- Deploy your existing app to Azure with `azd up`

## Learning Outcomes

After you finish dis lesson, you go fit:
- Initialize azd for project wey you already get
- Read and edit basic `azure.yaml` file
- Generate starter infrastructure with `azd infra generate`
- Choose correct Azure host for your app
- Deploy and clean up your own application

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already get an app and want to deploy am |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | When you wan adopt azd for existing repository |

You don practise the first option before. Dis lesson cover the second — the most common for real-world.

---

## Step 1: Run `azd init` in Your Project

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

Pick **"Use code in the current directory."** azd go scan your folder, detect your language and framework, and go propose one host.

### What azd detects

azd dey look for signals like `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or `Dockerfile`, and e go suggest matching Azure host:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Confirm the service(s) wey dem detect, and azd go scaffold the files wey you need.

---

## Step 2: Understand What azd Created

After init, you go get two new things for your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

Na di heart of azd project be dis. Minimal one fit look like dis:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Di `services` block na di key part: each entry map one folder of your code to an Azure host. If your app get frontend and API, you go get two services.

### `infra/` — your Azure resources as code

`infra/` folder dey hold Bicep files wey define the Azure resources wey your app need (App Service, database, etc.). You no need write these by hand — azd go generate working starting point. You fit edit dem later to add resources or tighten security (we go cover am for [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** You wan see or customize the generated infrastructure before you deploy? Run `azd infra generate` (also available as `azd infra synth`) to write the IaC to disk make you fit review and put am for version control.

---

## Step 3: Set Required Configuration

If your app need settings or secrets (connection string, API key), no hardcode dem. Use environment values:

```bash
# Make one environment
azd env new dev

# Put one value wey no be secret
azd env set API_VERSION 1.0.0
```

For real secrets, store dem for Key Vault and reference dem from your infrastructure — see [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow wey you don sabi:

```bash
# Sign in (e required for azd)
azd auth login

# See di resources wey dem go create
azd provision --preview

# Set up di infrastructure and put your code live
azd up
```

When e finish, azd go print your app URL. Confirm am same way you dey confirm any azd app:

```bash
azd show           # show di endpoints
azd monitor --logs # check di logs if e need am
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

For more, see [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** add azd to app wey you already get.
- `azure.yaml` dey map your code folders to Azure hosts; `infra/` dey define resources as Bicep.
- `azd infra generate` make you fit review or customize the generated infrastructure.
- After initialization, your existing app go use the exact same `azd up` / `azd down` workflow like template-based app.

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