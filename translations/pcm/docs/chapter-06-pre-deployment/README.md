# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey cover di important steps for planning and validation wey you gats do before you deploy your application. Learn how to avoid expensive mistakes with correct capacity planning, SKU selection, and preflight checks.

> Validated against `azd 1.27.1` in July 2026.

## Learning Objectives

By finishing dis chapter, you go:
- Run preflight checks before deployment
- Plan capacity and guess how much resource go need
- Choose correct SKUs to save money
- Set up Application Insights to monitor things well
- Understand how team go coordinate work

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Check configuration before deployment | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Guess how much resource you go need | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Pick correct price tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Set up monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Quick Start

```bash
# Check di subscription quota dem
az vm list-usage --location eastus --output table

# Preview di deployment (no resources go create)
azd provision --preview

# Validate Bicep sintax
az bicep build --file infra/main.bicep

# Check environment konfiguration
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] Quota check for region
- [ ] SKUs pick correct
- [ ] Money estimate review
- [ ] Naming style consistent
- [ ] Security/RBAC set up

### Before `azd deploy`

- [ ] Environment variables set
- [ ] Secrets for Key Vault
- [ ] Connection strings check
- [ ] Health checks set up

---

## 💰 SKU Selection Guide

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Related Resources

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->