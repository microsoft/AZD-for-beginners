# Chapta 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

Dis chapta dey introduce Azure Developer CLI (azd) basics. You go learn the main koncepts, how to install the tools, an how to deploy your first application to Azure.

> Validated against `azd 1.23.12` in March 2026.

## Learning Objectives

If you finish dis chapta, you go:
- Understand wetin Azure Developer CLI be an how e different from Azure CLI
- Install an configure AZD for your platform
- Deploy your first application to Azure with `azd up`
- Clean up resources with `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Main concepts, common terms, and how project dey structured | 15 min |
| 2 | [Installation & Setup](installation.md) | How to install for each platform | 10 min |
| 3 | [Your First Project](first-project.md) | Practical: Deploy a web app go Azure | 20 min |

---

## ✅ Start Here: Validate Your Setup

Before you begin, check say your local machine don ready for the Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script show say tools dey missing, install those tools first before you continue the chapta.

---

## 🚀 Quick Start

```bash
# Make sure say installation don finish
azd version

# Make sure say you authenticate for AZD
# Optional: run 'az login' if you wan run Azure CLI commands direct
azd auth login

# Deploy your first app
azd init --template todo-nodejs-mongo
azd up

# Clean up when you don finish
azd down --force --purge
```

---

## ✅ Success Criteria

After you finish dis chapta, you go fit:

```bash
azd version              # E dey show di version wey don install
azd init --template todo-nodejs-mongo  # E dey set up di project
azd up                   # E dey deploy go Azure
azd show                 # E dey show di URL wey di app dey run
azd down --force --purge # E dey clean up di resources
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
Dis document don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg note say automated translations fit get errors or inaccuracies. The original document for im native language suppose be di authoritative source. For critical information, we recommend say una use professional human translation. We no go responsible for any misunderstandings or misinterpretations wey fit arise from the use of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->