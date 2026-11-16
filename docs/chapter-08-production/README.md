# Chapter 8: Production & Enterprise Patterns

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 2-3 hours | **⭐ Complexity**: Advanced

---

## Overview

This chapter covers enterprise-ready deployment patterns, security hardening, monitoring, and cost optimization for production AI workloads.

This is an architectural reference, not a complete deployable production template. Examples omit integration details that must be supplied and tested in your own application; reading the checklist does not certify production readiness.

> **Foundry GA update (2026-11-09):** Use `azd >= 1.37.0` and the generally available `microsoft.foundry` 1.0 bundle for the Foundry workflow; evaluations are installed separately. See [release scope and migration](production-ai-practices.md#recent-release-changes-and-fixes) and the [authenticated pipeline example](production-ai-practices.md#cicd-pipeline-configuration). This is a documentation review, not live deployment validation or blanket GA status for optional preview features.

## Learning Objectives

By completing this chapter, you will:
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
| Scale to zero (Container Apps) | Requires a suitable trigger; other services still incur costs |
| Use consumption tiers for dev | Compare selected service pricing and workload |
| Scheduled scaling | Scale through supported infrastructure/automation |
| Reservations/provisioned capacity | Only when supported; commitments can increase idle costs |

Use the [complete budget resource pattern](production-ai-practices.md#2-cost-monitoring-and-budgets) with a valid start date, billing scope, recipients, and permissions. A budget sends alerts; it does not cap spending. Savings depend on measured utilization and are not guaranteed percentages.

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
