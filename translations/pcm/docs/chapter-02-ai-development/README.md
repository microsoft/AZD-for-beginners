# Chapter 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 4-5 hours including the workshop | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter focus on how to deploy AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps to smart intelligent agents wey get tools dem.

> **Foundry GA update (2026-11-09):** The `microsoft.foundry` 1.0 bundle don [generally available](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Make you use `azd >= 1.37.0`; evaluations still dey as separate installation. The [hosted-agent walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) go show you how to test local Agent Inspector and how to deploy code remote. Na documentation review dis, no be live deployment validation; optional preview features still get dia own status.

## Learning Objectives

As you finish dis chapter, you go fit:
- Deploy AI applications use pre-built AZD templates
- Understand how Microsoft Foundry dey integrate with AZD
- Install the GA bundle and test local hosted agent before you deploy e source for Foundry
- Review `azure.yaml`, evaluation assets, and how to clean new-versus-reused-project
- Configure and customize AI agents with tools dem
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

Choose one option for new empty directory. If your directory get `.` for backnah, e go initialize your current directory; otherwise AZD fit create one subdirectory without changing your shell working directory.

For the **GA hosted-agent code-deployment path**, start with the [guided walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). You need AZD 1.37.0+, current uv, Python 3.13+, Foundry permissions, and model quota. The full application templates wey dey below na alternatives, no be prerequisite for that walkthrough.

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat wey get citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent with tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basic AI chat | OpenAI + Container Apps |

---

## 💰 Cost Awareness

Dis na example cost ranges, no be quotes or caps; model traffic, Search/compute SKUs, region, and optional features fit pass dem. Make you check your chosen sample current pricing before you start provision.

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Cleanup:** Make you check `azd down` before you confirm: for newly created Foundry project e go delete the resource group and everything inside am. For reused Foundry project, e go leave the project and agent resources dey; follow the [walkthrough cleanup guidance](microsoft-foundry-integration.md#7-clean-up-deliberately) to remove unwanted resources one by one.

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