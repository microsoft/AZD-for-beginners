# Chapter 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapter focus on how to deploy AI-powered applications using Azure Developer CLI and Microsoft Foundry services. From simple AI chat apps go all the way to intelligent agents wey get tools.

> **Validation note (2026-07-13):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.27.1` and the current preview AI agent extension release `azure.ai.agents` `1.0.0-beta.5`. If you are on an older AZD build, update first and then continue with the exercises.

## Learning Objectives

If you finish dis chapter, you go fit:
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
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Make your AI solution AZD-ready | 60 min |

---

## 🚀 Quick Start

```bash
# Option 1: RAG Chat App
azd init --template azure-search-openai-demo
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart
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

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Run `azd down` after testing to avoid charges.

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