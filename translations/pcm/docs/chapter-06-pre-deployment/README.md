# Chapter 6: Plannin & Validation Before Deployment

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 awa | **⭐ Complexity**: Medium

---

## Overview

Dis chapter dey cover the important plannin an validation steps wey you suppose do before you deploy your app. Learn how to avoid expensive mistakes with proper capacity plannin, SKU selection, an preflight checks.

> Dem don validate am against `azd 1.25.6` for June 2026.

## Learning Objectives

By completing this chapter, you go:
- Run preflight checks before you deploy
- Plan capacity and estimate resource requirements
- Select appropriate SKUs to optimize cost
- Configure Application Insights for monitoring
- Understand how team dey coordinate

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Check configuration before deployment | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate resource requirements | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose appropriate pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Quick Start

```bash
# Check subscription quota dem
az vm list-usage --location eastus --output table

# Preview deployment (no resource dem go be created)
azd provision --preview

# Make sure say Bicep syntax correct
az bicep build --file infra/main.bicep

# Check how environment dey configured
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] Quota don confirm for the region
- [ ] SKUs don select correctly
- [ ] Cost estimate don review
- [ ] Naming convention dey consistent
- [ ] Security/RBAC don configure

### Before `azd deploy`

- [ ] Environment variables don set
- [ ] Secrets dey inside Key Vault
- [ ] Connection strings don verify
- [ ] Health checks don configure

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