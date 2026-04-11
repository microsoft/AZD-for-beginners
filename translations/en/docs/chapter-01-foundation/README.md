# Chapter 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

This chapter introduces Azure Developer CLI (azd) fundamentals. You'll learn core concepts, install the tools, and deploy your first application to Azure.

> Validated against `azd 1.23.12` in March 2026.

## Learning Objectives

By completing this chapter, you will:
- Understand what Azure Developer CLI is and how it differs from Azure CLI
- Install and configure AZD on your platform
- Deploy your first application to Azure with `azd up`
- Clean up resources with `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Core concepts, terminology, and project structure | 15 min |
| 2 | [Installation & Setup](installation.md) | Platform-specific installation guides | 10 min |
| 3 | [Your First Project](first-project.md) | Hands-on: Deploy a web app to Azure | 20 min |

---

## ✅ Start Here: Validate Your Setup

Before you begin, confirm that your local machine is ready for the Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Quick Start

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
azd init --template todo-nodejs-mongo
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Success Criteria

After completing this chapter, you should be able to:

```bash
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
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
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->