# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey explain the important planning and validation steps wey you suppose do before you deploy your application. Learn how to avoid costly mistake by doing proper capacity planning, choosing correct SKUs, and running preflight checks.

## Learning Objectives

By completing this chapter, you go:
- Run preflight checks before you deploy
- Plan capacity and estimate wetin resource dem go need
- Choose appropriate SKUs make cost dey optimized
- Configure Application Insights for monitoring
- Understand how team dem go coordinate

---

## 📚 Lessons

| # | Lekshon | Wetin e mean | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Validate configuration before deployment | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate resource requirements | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose appropriate pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Quick Start

```bash
# Check di subscription quota dem
az vm list-usage --location eastus --output table

# Preview di deployment (no resources go dey created)
azd provision --preview

# Make sure say Bicep syntax correct
az bicep build --file infra/main.bicep

# Check di environment configuration
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] Quota don verify for the region
- [ ] SKUs don choose well
- [ ] Cost estimate don review
- [ ] Naming convention dey consistent
- [ ] Security/RBAC don configure

### Before `azd deploy`

- [ ] Environment variables don set
- [ ] Secrets don put for Key Vault
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
Disclaimer:
Dis document get translated by AI translation service wey dem dey call Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automatic translations fit get mistakes or no too accurate. The original document for im original language na the main authoritative source. If na serious or important information, make you use professional human translator. We no go responsible for any misunderstanding or wrong interpretation wey fit come from this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->