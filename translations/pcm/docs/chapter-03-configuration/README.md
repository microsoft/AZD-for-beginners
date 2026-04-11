# Chapta 3: Konfigureshon & Otentikeshon

**📚 Kọs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 45-60 minutes | **⭐ Level**: Mid-level

---

## Overview

Dis chapta go cover environment konfigureshon, autentikeshon patterns, an di beta security practices wey you suppose follow for Azure Developer CLI deployments.

> Dem don validate am wit `azd 1.23.12` for March 2026.

## Wetin you go learn

If you finish dis chapta, you go:
- Master di AZD konfigureshon hierarchy
- Manage plenti environments (dev, staging, prod)
- Implement secure autentikeshon wit managed identities
- Setup settings wey different for each environment

---

## 📚 Lɛson dem

| # | Lɛson | Tok | Taim |
|---|--------|-------------|------|
| 1 | [Konfigureshon Guide](configuration.md) | Environment setup an management | 30 min |
| 2 | [Autentikeshon & Security](authsecurity.md) | Managed identity and RBAC patterns | 30 min |

---

## 🚀 Quick Start

```bash
# Make plenty environment dem
azd env new dev
azd env new staging
azd env new prod

# Change environment dem
azd env select prod

# Set environment variables dem
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# See configuration
azd env get-values
```

---

## 🔧 Konfigureshon Hierarchy

AZD dey apply di settings for dis order (later ones go override earlier ones):

1. **Defolt values** (wey dey build for templates)
2. **azure.yaml** (project konfigureshon)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 Beta security practices

```bash
# Use managed identity (na wetin dem recommend)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Make sure say AZD don authenticate
azd auth status

# Optional: check Azure CLI context if you wan run az commands
az account show

# Authenticate again if e necessary
azd auth login

# Optional: refresh Azure CLI authentication if you wan run az commands
az login
```

---

## 🔗 Navigeishon

| Direction | Chapta |
|-----------|---------|
| **Previous** | [Chapta 2: AI Development](../chapter-02-ai-development/README.md) |
| **Next** | [Chapta 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Related Resources

- [Checks wey you go do before deployment](../chapter-06-pre-deployment/README.md)
- [How to fix common wahala](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tok wey dey warn**:
Dis dokument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am correct, make you sabi say automated translations fit get mistakes or inaccuracies. Di original dokument for im own language suppose remain di authoritative source. For important information, we recommend say you use professional human translation. We no go take blame for any misunderstanding or misinterpretation wey fit come from di use of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->