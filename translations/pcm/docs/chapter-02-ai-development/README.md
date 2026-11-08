# Chapter 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 4-5 hours including the workshop | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter dey focus for how to deploy AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps to smart agents wey get tools dem.

> **Release review (2026-11-04):** AI CLI guidance bin check against di published `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, and `azure.ai.evaluations` `1.0.0-beta.2` documentation/source. Make you use `azd >= 1.37.0` for di combined workflow. Evaluations now dey use di separate `azd ai eval` namespace; see [release changes and migration guidance](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Dis no be live deployment validation.

## Learning Objectives

As you finish dis chapter, you go fit:
- Deploy AI applications using pre-built AZD templates
- Understand Microsoft Foundry integration with AZD
- Configure and customize AI agents with tools
- Deploy RAG (Retrieval-Augmented Generation) applications

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Connect AZD with Foundry services | 30 min |
| 2 | [AI Agents Guide](agents.md) | Deploy intelligent agents with tools | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Deploy and configure AI models | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Explore a template and plan your conversion | 2-3 hours |

---

## 🚀 Quick Start

Choose one option inside new empty directory. The trailing `.` go initialize di current directory; otherwise AZD fit create subdirectory without change your shell work directory.

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

Dis na sample estimates, no be quotes or caps; model traffic, Search/compute SKUs, region, and optional features fit pass dem. Make you check di pricing guide of your sample before you start.

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Run `azd down` after you do your testing to avoid extra charges.

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

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->