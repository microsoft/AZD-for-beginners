# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 2-4 hours reading; additional time for adapted labs | **⭐ Complexity**: Intermediate–Advanced

---

## Overview

This chapter covers essential planning and validation steps before deploying your application. Learn to avoid costly mistakes with proper capacity planning, SKU selection, and preflight checks.

> Command guidance reviewed against the released `azd 1.37.2` reference. Cloud deployments were not executed. The longer lessons include illustrative fragments, not complete local deployment projects.

## Learning Objectives

By completing this chapter, you will:
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
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->