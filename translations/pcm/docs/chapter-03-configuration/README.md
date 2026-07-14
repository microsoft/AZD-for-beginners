# Chapter 3: Configuration & Authentication

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 45-60 minutes | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey cover how to set environment, authentication patten dem, plus security beta way dem for Azure Developer CLI deployment.

> Validate with `azd 1.27.1` for July 2026.

## Learning Objectives

If you finish dis chapter, you go fit:
- Control the AZD configuration order
- Manage plenti different environment dem (dev, staging, prod)
- Use secure authentication wit managed identities
- Setup settings wey base on environment

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | How to set up and manage environment | 30 min |
| 2 | [Authentication & Security](authsecurity.md) | Managed identity plus RBAC patten dem | 30 min |

---

## 🚀 Quick Start

```bash
# Make plenty environments
azd env new dev
azd env new staging
azd env new prod

# Change environments
azd env select prod

# Put environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# See configuration
azd env get-values
```

---

## 🔧 Configuration Hierarchy

AZD dey follow dis kain order for settings (wey later one dey override di previous one):

1. **Default values** (dem put am inside templates)
2. **azure.yaml** (project configuration)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 Security Best Practices

```bash
# Use managed identity (dem recommend am)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Check AZD authentication status
azd auth status

# Optional: make sure say Azure CLI context correct if you wan run az commands
az account show

# Re-authenticate if e need am
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **Next** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->