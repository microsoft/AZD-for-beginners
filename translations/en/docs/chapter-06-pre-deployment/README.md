# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## Overview

This chapter covers essential planning and validation steps before deploying your application. Learn to avoid costly mistakes with proper capacity planning, SKU selection, and preflight checks.

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
| 1 | [Preflight Checks](preflight-checks.md) | Validate configuration before deployment | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimate resource requirements | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choose appropriate pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Quick Start

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview deployment (no resources created)
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
This document has been translated using AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->