# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Validated against `azd 1.25.6` in June 2026.

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
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
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

azd looks for signals like `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or a `Dockerfile`, and suggests a matching Azure host:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Confirm the detected service(s), and azd scaffolds the files you need.

---

## Step 2: Understand What azd Created

After init, you'll have two new things in your project:

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

This is the heart of an azd project. A minimal one looks like this:

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
# 환경을 생성합니다
azd env new dev

# 비밀이 아닌 값을 설정합니다
azd env set API_VERSION 1.0.0
```

For real secrets, store them in Key Vault and reference them from your infrastructure—see [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# 인증(azd에 필요)
azd auth login

# 생성될 리소스를 미리 확인
azd provision --preview

# 인프라를 프로비저닝하고 코드를 배포
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # 엔드포인트 표시
azd monitor --logs # 필요하면 로그 확인
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
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->