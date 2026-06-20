# Chapter 7: How to Fix Wahala & Debug

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Wetin dis chapter dey cover

This chapter go help you diagnose and resolve common wahala wen you dey work wit Azure Developer CLI. E cover wetin to do from deployment failures to AI-specific problems.

> Dem don validate am with `azd 1.25.6` for June 2026.

## Learning Objectives

By completing this chapter, you go:
- Find wetin dey cause common AZD deployment failures
- Debug authentication and permission wahala
- Solve AI service connectivity problems
- Use Azure Portal and CLI to do troubleshooting

---

## 📚 Lekshon dem

| # | Lekshon | Tori | Time |
|---|--------|-------------|------|
| 1 | [Common Wahala](common-issues.md) | Problems wey dey happen often | 30 min |
| 2 | [Debugging Guide](debugging.md) | Step-by-step strategy to debug | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | AI-specific wahala | 30 min |

---

## 🚨 Quick Fixes

### Authentication Issues
```bash
# Dem need am for AZD workflows
azd auth login

# E optional if you dey also use Azure CLI commands direct
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
| `ResourceNotFound` | Resource no dey | Check say resource names correct |
| `QuotaExceeded` | Subscription limits don full | Request make dem increase quota |
| `InvalidTemplate` | Bicep syntax error | `az bicep build` |
| `Conflict` | Resource don already exist | Give am new name or delete the old one |
| `Forbidden` | You no get enough permission | Check your RBAC roles |

---

## 🔄 How to Reset & Recover

```bash
# Soft reset (leave di resources, deploy di code again)
azd deploy --force

# Hard reset (delete everytin, start again from zero)
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