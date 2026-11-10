# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 2-4 hours reading; additional time for adapted labs | **⭐ Complexity**: Intermediate–Advanced

---

## Overview

Dis chapter dey cover di important planning an validation steps wey you for do before you deploy your application. Learn how to sidon avoid costly mistakes wit proper capacity planning, SKU selection, an preflight checks.

> Command guidance wey dem review against di released `azd 1.37.2` reference. Dem no run cloud deployments. Di longer lessons get example fragments, no be complete local deployment projects.

## Learning Objectives

If you finish dis chapter, you go fit:
- Run preflight checks before deployment
- Plan capacity and estimate resource requirements
- Select appropriate SKUs for cost optimization
- Configure Application Insights for monitoring
- Understand multi-agent coordination patterns and their deployment requirements

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Validate configuration before deployment | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate resource requirements | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose appropriate pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Advanced multi-agent orchestration design | 60-75 min |

---

## 🚀 Quick Start

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] Quota verified for region
- [ ] SKUs selected appropriately
- [ ] Cost estimate reviewed
- [ ] Naming convention consistent
- [ ] Security/RBAC configured

### Before `azd deploy`

- [ ] Environment variables set
- [ ] Secrets in Key Vault
- [ ] Connection strings verified
- [ ] Health checks configured

---

## 💰 SKU Selection Guide

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption or dedicated workload profile, based on measured load |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI models | Supported pay-as-you-go deployment type | Pay-as-you-go or provisioned throughput; model/region dependent |
| AI Search | Free/Basic within limits | Basic or Standard tier sized for index, replicas, and query load |

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