# Chapta 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

Dis chapta dey introduce Azure Developer CLI (azd) fundamentals. You go learn di main koncepts, how to install di tools, an how to deploy your first application go Azure.

## Learning Objectives

If you finish dis chapta, you go:
- Sabi wetin Azure Developer CLI be an how e different from Azure CLI
- Install an configure AZD for your platform
- Deploy your first application go Azure wit `azd up`
- Clean up resources wit `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Main koncepts, di tok wey dem dey use, an project structure | 15 min |
| 2 | [Installation & Setup](installation.md) | Installation guide wey fit each platform | 10 min |
| 3 | [Your First Project](first-project.md) | Hands-on: Deploy web app go Azure | 20 min |

---

## 🚀 Quick Start

```bash
# Check di installation
azd version

# Login go Azure
azd auth login

# Deploy di first app wey you build
azd init --template todo-nodejs-mongo
azd up

# Clear up wen you don finish
azd down --force --purge
```

---

## ✅ Success Criteria

After you finish dis chapta, you suppose fit:

```bash
azd version              # Dey show di version wey don install
azd init --template todo-nodejs-mongo  # Dey initialize di project
azd up                   # Dey deploy go Azure
azd show                 # Dey show di URL of di app wey dey run
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
Disclaimer:
Dis document don translate with AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get mistakes or wrong parts. Di original document for im original language suppose be di correct source. If na important information, e better make you use professional human translation. We no go responsible for any misunderstanding or wrong interpretation wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->