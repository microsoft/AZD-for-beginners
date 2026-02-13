# Chapter 3: Configuration & Authentication

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 45-60 minutes | **⭐ Complexity**: Intermediate

---

## Overview

This chapter covers environment configuration, authentication patterns, and security best practices for Azure Developer CLI deployments.

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

---

## 🔧 Configuration Hierarchy

AZD applies settings in this order (later overrides earlier):

1. **Default values** (built into templates)
2. **azure.yaml** (project configuration)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 Security Best Practices

```bash
# Use managed identity (recommended)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Check authentication status
azd auth whoami
az account show

# Re-authenticate if needed
azd auth login
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
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->