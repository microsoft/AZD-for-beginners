# Chapter 3: Configuration & Authentication

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 90-150 minutes including integration practice | **⭐ Complexity**: Intermediate

---

## Overview

This chapter covers environment configuration, authentication patterns, and security best practices for Azure Developer CLI deployments.

> Command and configuration review target: `azd 1.37.2` (November 2026). Live Azure provisioning was not run during review.

## Learning Objectives

By completing this chapter, you will:
- Master the AZD configuration hierarchy
- Manage multiple environments (dev, staging, prod)
- Implement secure authentication with managed identities
- Configure environment-specific settings

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | Environment setup and management | 30 min |
| 2 | [Authentication & Security](authsecurity.md) | Managed identity and RBAC patterns | 30 min |

---

## 🚀 Quick Start

Run from the root of an **already initialized azd application**, not the course repository. Use unused environment names if these already exist.

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

`SKU_NAME` is illustrative: it affects infrastructure only if your template explicitly consumes it. Ordinary `azd env set` values are saved locally in plaintext; they are not secure secret storage.

---

## 🔧 Configuration Hierarchy

Keep three different configuration surfaces separate: global preferences (`azd config`), project structure (`azure.yaml`), and per-environment values (`azd env`). Flags override only the settings they actually support; there is no universal overlay of arbitrary environment variables onto `azure.yaml` or Bicep.

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
