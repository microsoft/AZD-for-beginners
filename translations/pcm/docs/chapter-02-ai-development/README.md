# Chapta 2: AI-First Development

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## Overview

Dis chapta dey focus on how to deploy AI-powered applications using Azure Developer CLI and Microsoft Foundry services. E cover from simple AI chat apps reach intelligent agents wey get tools.

> **Validation note (2026-03-25):** Di command flow and extension guidance for dis chapta don review against `azd` `1.23.12` and di current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you dey use older AZD build, update am first before you continue with di exercises.

## Learning Objectives

If you finish dis chapta, you go:
- Deploy AI apps using di pre-built AZD templates
- Understand how Microsoft Foundry dey integrate with AZD
- Set up and customize AI agents make dem fit use tools
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
# Option 1: RAG Chat app
azd init --template azure-search-openai-demo
azd up

# Option 2: AI agents dem
azd init --template get-started-with-ai-agents
azd up

# Option 3: Quick Chat app
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

**Tip:** Run `azd down` after testing make you no dey incur extra charges.

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
Dis document don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg note say automated translations fit get errors or inaccuracies. Di original document for im native language na di authoritative source wey you suppose consider. If na critical information, make professional human translation do am. We no dey liable for any misunderstandings or misinterpretations wey fit arise from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->