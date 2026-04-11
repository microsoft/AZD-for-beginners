# Chapter 6: Pre-Deployment Planning & Validation

**📚 Kọs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 1 awa | **⭐ Level**: Intermediit

---

## Overview

Dis chapter dey cover the important planning and validation steps wey you suppose do before you deploy your app. Learn how to avoid expensive mistakes with correct capacity planning, SKU selection, and preflight checks.

> Dem don validate am wit `azd 1.23.12` for March 2026.

## Learning Objectives

If you finish dis chapter, you go:
- Go run preflight checks before you deploy
- Plan capacity and estimate how much resources you need
- Choose appropriate SKUs to optimize cost
- Configure Application Insights for monitoring
- Understand how team go coordinate

---

## 📚 Lessons

| # | Lekshon | Tori | Taim |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Check configuration before you deploy | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate resource requirements | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose appropriate pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Quick Start

```bash
# Check di subscription quotas
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

### Bifo `azd provision`

- [ ] Quota don verify for region
- [ ] SKUs don select appropriately
- [ ] Cost estimate don review
- [ ] Naming convention dey consistent
- [ ] Security/RBAC don configure

### Bifo `azd deploy`

- [ ] Environment variables don set
- [ ] Secrets dey for Key Vault
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
Dis dokument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get mistakes or inaccuracies. Make una consider di original dokument for im native language as di authoritative source. For critical information, we recommend say una use professional human translation. We no dey liable for any misunderstandings or misinterpretations wey fit arise from di use of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->