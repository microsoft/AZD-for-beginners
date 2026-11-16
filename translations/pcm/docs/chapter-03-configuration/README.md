# Chapter 3: Configuration & Authentication

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 90-150 minutes wey include integration practice | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey cover how to arrange environment configuration, authentication patterns, and security best practices for Azure Developer CLI deployments.

> Command and configuration review target: `azd 1.37.2` (November 2026). Live Azure provisioning no run during review.

## Learning Objectives

If you finish dis chapter, you go:
- Master di AZD configuration hierarchy
- Manage plenty environments (dev, staging, prod)
- Implement secure authentication wit managed identities
- Configure environment-specific settings

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | How to setup and manage environment | 30 min |
| 2 | [Authentication & Security](authsecurity.md) | Managed identity and RBAC patterns | 30 min |

---

## 🚀 Quick Start

Run am from di root of an **already initialized azd application**, no di course repository. Use environment names wey nobody dey use if these ones don already dey.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` na just example: e go affect infrastructure only if your template reason am well. Normal `azd env set` values dey save local local in plain text; no be secret for secure storage.

---

## 🔧 Configuration Hierarchy

Make you keep three different configuration surfaces separate: global preferences (`azd config`), project structure (`azure.yaml`), and per-environment values (`azd env`). Flags go override only the settings wey dem really support; no be say any environment variable go just fit do overlay for `azure.yaml` or Bicep anyhow.

---

## 🔐 Security Best Practices

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
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