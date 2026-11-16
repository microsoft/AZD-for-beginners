# Chapter 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 75-120 minutes including di first deployment; additional exercises go take more time | **⭐ Complexity**: Beginner

---

## Overview

Dis chapter go introduce Azure Developer CLI (azd) basics. You go learn core concepts, how to install di tools, and deploy your first app for Azure.

> Command and configuration review target: `azd 1.37.2` (November 2026). Dem never run live Azure provisioning during di review.

## Learning Objectives

After you don finish dis chapter, you go sabi:
- Wetin Azure Developer CLI be and how e different from Azure CLI
- How to install and configure AZD for your platform
- How to deploy your first app to Azure with `azd up`
- How to clean up resources with `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Core concepts, terminology, and how project dey structured | 15 min |
| 2 | [Installation & Setup](installation.md) | Platform-specific installation guides | 10 min |
| 3 | [Your First Project](first-project.md) | Hands-on: Deploy web app to Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | How to add azd to project wey you don get before | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | How to get reproducible azd environments wit dev containers | 15 min |

---

## ✅ Start Here: Validate Your Setup

Before you start, make sure your local machine ready for di Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If di script talk say some tools dey miss, fix am first before you continue with di chapter.

---

## 🚀 Quick Start

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Success Criteria

After you don finish dis chapter, you suppose fit:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
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