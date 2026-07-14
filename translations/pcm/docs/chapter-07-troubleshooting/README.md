# Chapter 7: Troubleshooting & Debugging

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter go help you sabi wetin cause wahala plus how to solve common kasala wen you dey work wit Azure Developer CLI. From deployment failure go reach AI kind problem dem.

> Validated against `azd 1.27.1` in July 2026.

## Learning Objectives

If you finish dis chapter, you go fit:
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
# Na wetin dey needed for AZD waka
azd auth login

# No too necessary if you dey also use Azure CLI commands directly
az login

azd auth status
```

### Provisioning Failures
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resource Conflicts
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Quota Exceeded
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

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
azd deploy --force

# Hard reset (delete everytin, start fresh)
azd down --force --purge
azd up
```

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
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->