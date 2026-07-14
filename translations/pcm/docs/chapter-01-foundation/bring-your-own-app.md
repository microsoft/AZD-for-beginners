# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Validated against `azd 1.27.1` in July 2026.

## Introduction

For [Your First Project](first-project.md) you deploy one app by starting from template. Bot most times, you don already *get* one app — Node.js API, Python Flask service, .NET web app — wey dey for one folder for your machine. Dis lesson go show how you go take add azd to dat existing code so you fit deploy am wit `azd up`, no template needed.

## Learning Goals

By di end of dis lesson, you go:
- Understand di three ways to start one azd project
- Run `azd init` inside already existing code
- Understand how `azure.yaml` and di `infra/` folder dey work for your app
- Know when to make azd generate infrastructure and when to write your own
- Deploy your existing app for Azure using `azd up`

## Learning Outcomes

After you finish dis lesson, you go sabi:
- Init azd for one project wey you don already get
- Read and edit one simple `azure.yaml` file
- Generate starter infrastructure wit `azd infra generate`
- Choose di right Azure host for your app
- Deploy and take down your own application

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | If you dey learn or you wan start new app from beta sample |
| **From your existing code** | `azd init` (inside your project folder) | When you don already get one app and you wan deploy am |
| **From a Git repo** | `azd init --from-code` (inside cloned repo) | When you wan start azd for existing repository |

You don already try di first option. Dis lesson na di second case - di most normal one for real life.

---

## Step 1: Run `azd init` for Your Project

Open terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd go ask how you wan init. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pick **"Use code for di current directory."** azd go check your folder, find your language and framework, den suggest host.

### Wetin azd go detect

azd dey find signs like `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or `Dockerfile`, den e go suggest matching Azure host:

| Your app | Host wey e fit detect |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Confirm di service(s) wey e detect, azd go build the files you need.

---

## Step 2: Understand Wetin azd Create

After init finish, you go get two new tins for your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — project definition

Dis one na di heart of azd project. One small one dey look like dis:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Di `services` block na di main part: each entry na folder for your code wey map to one Azure host. If your app get both frontend and API, you go get two services.

### `infra/` — your Azure resources as code

Di `infra/` folder get Bicep files wey define Azure resources your app need (like App Service, database, etc). You no need write dem yourself — azd go generate starting point wey dey work. You fit still edit dem later to add resources or make security stronger (we cover am inside [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** If you wan see or customize di generated infrastructure before you deploy, run `azd infra generate` (you fit use `azd infra synth` too) so e go write IaC to disk and you fit check am well and control version.

---

## Step 3: Set Wetin You Need for Config

If your app need settings or secrets (connection string, API key), no hardcode dem. Use environment values:

```bash
# Create one environment
azd env new dev

# Put one value wey no be secret
azd env set API_VERSION 1.0.0
```

For real secrets, put dem for Key Vault and reference dem from your infrastructure — see [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow wey you sabi:

```bash
# Make sure say e be you (e dey needed for azd)
azd auth login

# See di tins wey dem go create before
azd provision --preview

# Set up di infrastructure and put your code live
azd up
```

When e finish, azd go show your app URL. Check am same way like any azd app:

```bash
azd show           # show di endpoints
azd monitor --logs # check di logs if e necessary
```

---

## Common First-Time Problems

| Problem | Likely Cause | How to fix am |
|---------|--------------|---------------|
| azd no detect my app | Manifest like `package.json` dey miss | Add di manifest or select host manually during `azd init` |
| Build fail during `azd up` | Your app need build step | Add `buildCommand`/`outputPath` under service inside `azure.yaml` |
| App start but e dey return errors | Config or secret dey miss | Set correct values wit `azd env set` or key am to Key Vault |
| Wrong host pick | Auto-detect no correct | Change `host:` for `azure.yaml` then run `azd up` again |

For more info, see [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code for di current directory"** dey add azd to app wey you don already get.
- `azure.yaml` dey map your code folder to Azure hosts; `infra/` dey define resources like Bicep.
- `azd infra generate` dey allow you check or customize di generated infrastructure.
- After init, your existing app go use di exact same `azd up` / `azd down` workflow as template-based app.

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