# Chapta 1: Foundation & Quick Start

**📚 Kɔrs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 30-45 minutes | **⭐ Level**: Beginner

---

## Wetin Dis Chapta Dey Talk

Dis chapta go introduce Azure Developer CLI (azd) fundamentals. You go learn di main concepts, install di tools, and deploy your first application to Azure.

> Dem don validate this one with `azd 1.25.6` for June 2026.

## Wetin You Go Learn

By completing this chapta, you go:
- Understand wetin Azure Developer CLI be and how e different from Azure CLI
- Install and configure AZD for your platform
- Deploy your first application to Azure with `azd up`
- Clean up resources with `azd down`

---

## 📚 Lekshon

| # | Lekshon | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Di main concepts, terminology, and project structure | 15 min |
| 2 | [Installation & Setup](installation.md) | Installation guide for each platform | 10 min |
| 3 | [Your First Project](first-project.md) | Hands-on: Deploy web app go Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | Add azd to di project wey you don already get | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproducible azd environments with dev containers | 15 min |

---

## ✅ Start Here: Check Your Setup

Before you start, make sure say your local machine ready for the Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script report say tools dey miss, install dem first before you continue with di chapta.

---

## 🚀 Quick Start

```bash
# Make sure say installation don work
azd version

# Make you log in to AZD
# Optional: run "az login" if you dey plan to run Azure CLI commands direct
azd auth login

# Deploy di first app
azd init --template todo-nodejs-mongo
azd up

# Clean up after you don finish
azd down --force --purge
```

---

## ✅ How You Go Know Say You Don Succeed

After you finish dis chapta, you suppose fit do:

```bash
azd version              # Dey show di version wey don install
azd init --template todo-nodejs-mongo  # Dey set up di project
azd up                   # Dey deploy go Azure
azd show                 # Dey show di URL for di app wey dey run
azd down --force --purge # Dey clean up di resources
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Related Resources

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->