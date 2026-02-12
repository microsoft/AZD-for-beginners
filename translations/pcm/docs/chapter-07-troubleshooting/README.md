# Chapter 7: Troubleshootin & Debuggin

**📚 Kọs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 1-1.5 hours | **⭐ Level**: Intermediate

---

## Overview

Dis chapter go help you diagnose an solve common wahala wey fit show when you dey work wit Azure Developer CLI. E cover from deployment failures reach AI-specific problems.

## Learning Objectives

After you finish dis chapter, you go fit:
- Diagnose common AZD deployment wahala
- Debug authentication an permission wahala
- Solve AI service connectivity wahala
- Use Azure Portal an CLI to troubleshoot

---

## 📚 Lessons

| # | Lekshon | Wetin e cover | Taim |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Problems wey you dey see often | 30 min |
| 2 | [Debugging Guide](debugging.md) | Step-by-step debugging ways | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI-specific wahala | 30 min |

---

## 🚨 Quick Fixes

### Authentication Wahala
```bash
azd auth login
az login
azd auth whoami
```

### Provisioning Wahala
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

### Quota Don Pass
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Error Code Reference

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | You no don log in | `azd auth login` |
| `ResourceNotFound` | Resource no dey | Check the resource names |
| `QuotaExceeded` | Subscription limits don reach | Ask for quota increase |
| `InvalidTemplate` | Bicep syntax wahala | `az bicep build` |
| `Conflict` | Resource don already dey | Use new name or delete am |
| `Forbidden` | Permission no reach | Check RBAC roles |

---

## 🔄 Reset and Recovery

```bash
# Soft reset (no go delete anything, keep di resources, deploy di code again)
azd deploy --force

# Hard reset (go delete everything, start again from scratch)
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
Disclaimer:
Dis dokument don translate with AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automated translations fit get mistakes or no too accurate. The original dokument for im original language na the correct source wey you suppose trust. If na serious or important information, make person wey sabi (professional human translator) do the translation. We no dey responsible for any misunderstanding or wrong meaning wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->