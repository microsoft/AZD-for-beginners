# Chapter 7: Troubleshooting & Debugging

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

This chapter helps you diagnose and resolve common issues when working with Azure Developer CLI. From deployment failures to AI-specific problems.

> Command guidance reviewed against the released `azd 1.37.2` reference. Cloud deployments were not executed. Replace example resource names and IDs before using commands.

## Learning Objectives

By completing this chapter, you will:
- Diagnose common AZD deployment failures
- Debug authentication and permission issues
- Resolve AI service connectivity problems
- Use Azure Portal and CLI for troubleshooting

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Frequently encountered problems | 30 min |
| 2 | [Debugging Guide](debugging.md) | Step-by-step debugging strategies | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI-specific issues | 30 min |

---

## 🚨 Quick Fixes

### Authentication Issues
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Provisioning Failures
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resource Conflicts
Inspect the existing resource and deployment errors first. Do not delete a shared or production environment to resolve a naming conflict. For a **new disposable environment**, use a unique name:

```bash
azd env new different-name
azd up
```

### Quota Exceeded
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Changing `AZURE_LOCATION` does not move existing resources and can cause location conflicts on redeployment.

---

## 📋 Error Code Reference

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Not logged in | `azd auth login` |
| `ResourceNotFound` | Missing resource | Check resource names |
| `QuotaExceeded` | Subscription limits | Request quota increase |
| `InvalidTemplate` | Bicep syntax error | `az bicep build` |
| `Conflict` | Resource exists | Use new name or delete |
| `Forbidden` | Insufficient permissions | Check RBAC roles |

---

## 🔄 Reset and Recovery

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

The hard reset deletes data and may change endpoints. Back up first and review the interactive deletion prompts. `--force --purge` is only appropriate for disposable environments when irreversible deletion is intended.

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |
| **Next** | [Chapter 8: Production](../chapter-08-production/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->