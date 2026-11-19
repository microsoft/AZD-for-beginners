# Chapter 8: Production & Enterprise Patterns

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 2-3 hours | **⭐ Complexity**: Advanced

---

## Overview

Dis chapter dey cover enterprise-ready deployment patterns, security hardening, monitoring, and cost optimization for production AI workloads.

Dis na architectural reference, no be complete deployable production template. Examples no put integration details wey you gas supply and test for your own application; to read the checklist no mean say production ready don sure.

> **Foundry GA update (2026-11-09):** Use `azd >= 1.37.0` and the generally available `microsoft.foundry` 1.0 bundle for the Foundry workflow; evaluations dem dey install separately. Make you see [release scope and migration](production-ai-practices.md#recent-release-changes-and-fixes) and the [authenticated pipeline example](production-ai-practices.md#cicd-pipeline-configuration). Na documentation review dis, no be live deployment validation or blanket GA status for optional preview features.

## Learning Objectives

If you finish dis chapter, you go fit:
- Deploy multi-region resilient applications
- Implement enterprise security patterns
- Configure comprehensive monitoring
- Optimize costs at scale
- Set up CI/CD pipelines with AZD

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | Enterprise deployment patterns | 90 min |

---

## 🚀 Production Checklist

- [ ] Multi-region deployment for resilience
- [ ] Managed identity for authentication (no keys)
- [ ] Application Insights for monitoring
- [ ] Cost budgets and alerts configured
- [ ] Security scanning enabled
- [ ] CI/CD pipeline integration
- [ ] Disaster recovery plan

---

## 🏗️ Architecture Patterns

### Pattern 1: Microservices AI

```mermaid
graph LR
    Gateway[API Gateway] --> AI[AI Service] --> Models[Microsoft Foundry Models]
    Gateway --> Auth[Auth Service]
    AI --> Data[Data Store]
```

### Pattern 2: Event-Driven AI

```mermaid
graph LR
    EventGrid[Event Grid] --> Functions[Functions] --> Pipeline[AI Pipeline]
```

---

## 🔐 Security Best Practices

```bicep
// Illustrative properties from different resources, NOT a standalone Bicep file.
// Attach identity to the application host:
identity: {
  type: 'SystemAssigned'
}

// AI account properties (also require private endpoints, DNS and app connectivity):
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Cost Optimization

| Strategy | Main Constraint |
|----------|---------|
| Scale to zero (Container Apps) | Need correct trigger; oda services still dey cost money |
| Use consumption tiers for dev | Check pricing and workload wey you select |
| Scheduled scaling | Scale through supported infrastructure/automation |
| Reservations/provisioned capacity | Only if e dey; commitments fit make una idle cost high |

Use di [complete budget resource pattern](production-ai-practices.md#2-cost-monitoring-and-budgets) wit correct start date, billing scope, recipients, and permissions. Budget go send alerts; e no dey limit how much you fit spend. Savings depend on how you take use am, no be guaranteed percentage.

---

## 📊 Monitoring Setup

```bash
# Open the Application Insights logs view (requires configured monitoring)
azd monitor --logs

# Check Application Insights
azd monitor --overview

# View metrics
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |
| **Course Complete** | [Course Home](../../README.md) |

---

## 📖 Related Resources

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-Agent Solutions](../chapter-05-multi-agent/README.md)
- [Microservices Example](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->