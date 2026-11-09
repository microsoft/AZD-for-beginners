# Chapter 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 4-5 hours including the workshop | **⭐ Complexity**: Intermediate

---

## Overview

This chapter focuses on deploying AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps to intelligent agents with tools.

> **Foundry GA update (2026-11-09):** The `microsoft.foundry` 1.0 bundle is [generally available](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Use `azd >= 1.37.0`; evaluations remain a separate installation. The [hosted-agent walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) covers local Agent Inspector testing and remote code deployment. This is a documentation review, not a live deployment validation; optional preview features retain their own status.

## Learning Objectives

By completing this chapter, you will:
- Deploy AI applications using pre-built AZD templates
- Understand Microsoft Foundry integration with AZD
- Install the GA bundle and test a hosted agent locally before deploying its source to Foundry
- Review `azure.yaml`, evaluation assets, and new-versus-reused-project cleanup
- Configure and customize AI agents with tools
- Deploy RAG (Retrieval-Augmented Generation) applications

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | GA bundle, hosted-agent local-to-cloud workflow, and evaluations | 60 min |
| 2 | [AI Agents Guide](agents.md) | Deploy intelligent agents with tools | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Deploy and configure AI models | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Explore a template and plan your conversion | 2-3 hours |

---

## 🚀 Quick Start

Choose one option in a new empty directory. The trailing `.` initializes the current directory; otherwise AZD can create a subdirectory without changing your shell's working directory.

For the **GA hosted-agent code-deployment path**, start with the [guided walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). It requires AZD 1.37.0+, current uv, Python 3.13+, Foundry permissions, and model quota. The full application templates below are alternatives, not prerequisites for that walkthrough.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Featured AI Templates

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat with citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent with tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basic AI chat | OpenAI + Container Apps |

---

## 💰 Cost Awareness

These are illustrative ranges, not quotes or caps; model traffic, Search/compute SKUs, region, and optional features can exceed them. Review your chosen sample's current pricing guidance before provisioning.

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Cleanup:** Review `azd down` before confirming: for a newly created Foundry project it deletes the resource group and everything in it. For a reused Foundry project, it leaves the project and agent resources in place; follow the [walkthrough cleanup guidance](microsoft-foundry-integration.md#7-clean-up-deliberately) to remove unwanted resources separately.

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Next** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Skip to** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Related Resources

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
