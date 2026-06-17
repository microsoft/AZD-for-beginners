# Chapta 3: Konfigureshon & Autentikeshon

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 45-60 minutes | **⭐ Complexity**: Intermediate

---

## Wetin Dis Chapter Dey Cover

Dis chapta dey cover how to set up environment konfigureshon, autentikeshon patterns, an beta security practices for Azure Developer CLI deployments.

> Dem don validate am with `azd 1.25.6` for June 2026.

## Wetin You Go Learn

If you finish dis chapta, you go:
- Master the AZD configuration hierarchy
- Manage plenty environments (dev, staging, prod)
- Implement secure autentikeshon with managed identities
- Konfigure environment-specific settings

---

## 📚 Lekshon

| # | Lekshon | Tok Wey E Mean | Taim |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | How to set up an manage environment | 30 min |
| 2 | [Authentication & Security](authsecurity.md) | Managed identity an RBAC patterns | 30 min |

---

## 🚀 Quick Start

```bash
# Make plenty environment dem
azd env new dev
azd env new staging
azd env new prod

# Change environment dem
azd env select prod

# Set environment variable dem
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# See configuration
azd env get-values
```

---

## 🔧 Konfigureshon Hierarchy

AZD dey apply settings for dis order (later ones go override earlier ones):

1. **Default values** (na dem wey dey inside templates)
2. **azure.yaml** (project konfigureshon)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 Security Best Practices

```bash
# Use managed identity (na di one we dem recommend)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Check di AZD authentication status
azd auth status

# Optional: check di Azure CLI context if you wan run az commands
az account show

# Sign in again if e necessary
azd auth login

# Optional: refresh di Azure CLI auth if you wan run az commands
az login
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapta 2: AI Development](../chapter-02-ai-development/README.md) |
| **Next** | [Chapta 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->