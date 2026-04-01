# Chapter 7: Find & Fix Wahala (Troubleshooting & Debugging)

**📚 Kɔs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 1-1.5 hours | **⭐ Level**: Medium

---

## Overview

Dis chapter go help you find and resolve common wahala wen you dey work with Azure Developer CLI. E cover things from deployment wey fail reach AI-specific problems.

> Validated against `azd 1.23.12` in March 2026.

## Learning Objectives

By finish dis chapter, you go fit:
- Find common AZD deployment failures
- Debug authentication and permission wahala
- Solve AI service connectivity problems
- Use Azure Portal and CLI for troubleshooting

---

## 📚 Lessons

| # | Lekshon | Tori | Time |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Problems wey people dey meet often | 30 min |
| 2 | [Debugging Guide](debugging.md) | Step-by-step ways to debug | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI-specific problems | 30 min |

---

## 🚨 Quick Fixes

### Authentication Issues
```bash
# E necessary for AZD workflows
azd auth login

# E optional if you sef dey use Azure CLI commands direct
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
| `AuthenticationError` | You never log in | `azd auth login` |
| `ResourceNotFound` | Resource no dey | Check resource names |
| `QuotaExceeded` | Subscription get limit | Request quota increase |
| `InvalidTemplate` | Bicep syntax error | `az bicep build` |
| `Conflict` | Resource don already dey | Use new name or delete |
| `Forbidden` | You no get enough permission | Check RBAC roles |

---

## 🔄 Reset and Recovery

```bash
# Soft reset (resources go still dey, just redeploy di code)
azd deploy --force

# Hard reset (delete everytin, start again from scratch)
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
Dis document don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make everything correct, abeg note say automated translations fit get errors or inaccuracies. Di original document for im native language suppose be di authoritative source. For critical information, make you use professional human translation. We no dey liable for any misunderstandings or misinterpretations wey fit arise from di use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->