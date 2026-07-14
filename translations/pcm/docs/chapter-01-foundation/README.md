# Chapter 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

Dis chapter go introduce Azure Developer CLI (azd) fundamentals. You go learn core concepts, install di tools, and deploy your first application for Azure.

> Validated against `azd 1.27.1` in July 2026.

## Learning Objectives

By completing dis chapter, you go:
- Understand wetin Azure Developer CLI be and how e different from Azure CLI
- Install and configure AZD for your platform
- Deploy your first application for Azure with `azd up`
- Clear resources with `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Core concepts, terminology, and project structure | 15 min |
| 2 | [Installation & Setup](installation.md) | Platform-specific installation guides | 10 min |
| 3 | [Your First Project](first-project.md) | Hands-on: Deploy a web app for Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | Add azd to di project wey you get before | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproducible azd environments with dev containers | 15 min |

---

## ✅ Start Here: Validate Your Setup

Before you start, make sure sey your local machine ready for di Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If di script talk sey tools dey miss, fix dem first then continue with di chapter.

---

## 🚀 Quick Start

```bash
# Check di installation
azd version

# Make sure say you authentic for AZD
# Optional: az login if you wan run Azure CLI commands directly
azd auth login

# Deploy your first app
azd init --template todo-nodejs-mongo
azd up

# Clean up after you don finish
azd down --force --purge
```

---

## ✅ Success Criteria

After you finish dis chapter, you suppose fit:

```bash
azd version              # Dey show di version wey don install
azd init --template todo-nodejs-mongo  # E dey start di project
azd up                   # E dey deploy to Azure
azd show                 # E dey show di app URL wey dey run
azd down --force --purge # E dey clear resources
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