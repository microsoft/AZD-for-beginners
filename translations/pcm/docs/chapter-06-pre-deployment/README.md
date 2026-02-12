# Chapter 6: Pre-Deployment Plannin & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey cover di important plannin an validation steps wey you suppose do before you deploy your application. E go help you avoid costly mistakes by doing proper capacity plannin, choosing correct SKUs, an running preflight checks.

## Learning Objectives

By completing this chapter, you will:
- Run preflight checks before deployment
- Plan capacity and estimate resource requirements
- Select appropriate SKUs for cost optimization
- Configure Application Insights for monitoring
- Understand team coordination patterns

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Make sure di configuration dey correct before you deploy | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate how much resources you go need | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose di right pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Quick Start

```bash
# Check di subscription quota dem
az vm list-usage --location eastus --output table

# Preview di deployment (no resource dem go create)
azd provision --preview

# Check say Bicep syntax correct
az bicep build --file infra/main.bicep

# Check di environment setup
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] Quota don check for region
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
| Azure OpenAI | Standard | Standard + PTU |
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
Dis document na AI translate (Co-op Translator: https://github.com/Azure/co-op-translator) translate am. Even though we try make am correct, abeg note say automatic translation fit get errors or wrong parts. Di original document for im own language suppose be di correct one. If na important tin, make you use professional human translator. We no go responsible for any misunderstanding or wrong meaning wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->