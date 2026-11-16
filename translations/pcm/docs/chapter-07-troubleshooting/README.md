# Chapter 7: Troubleshooting & Debugging

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey help you sabi and solve common wahala wen you dey use Azure Developer CLI. From deployment failure dem go AI-specific problem dem.

> Command guidance wey dem check well well with the released `azd 1.37.2` reference. Dem no run cloud deployments. Before you run command, change example resource names and IDs.

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
| 1 | [Common Issues](common-issues.md) | Problems wey dey happen often | 30 min |
| 2 | [Debugging Guide](debugging.md) | Step-by-step way to debug | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI specific problem dem | 30 min |

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
First, look the resource wey dey and the deployment wahala dem. No delete shared or production environment to fix naming wahala. If na **new disposable environment**, give am unique name:

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

Changing `AZURE_LOCATION` no go carry the current resource dem, e fit cause location wahala when you redeploy.

---

## 📋 Error Code Reference

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | No log in | `azd auth login` |
| `ResourceNotFound` | Resource no dey | Check resource names |
| `QuotaExceeded` | Subscription limits reach | Request for quota increase |
| `InvalidTemplate` | Bicep syntax error | `az bicep build` |
| `Conflict` | Resource don dey | Use new name or delete am |
| `Forbidden` | No get enough permission | Check RBAC roles |

---

## 🔄 Reset and Recovery

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Hard reset go delete data and e fit change endpoints. Make you back up before and check the interactive deletion prompts. `--force --purge` good pass for disposable environment wen you want delete things wey no fit bring back.

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