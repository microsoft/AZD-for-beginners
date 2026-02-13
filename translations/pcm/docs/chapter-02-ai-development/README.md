# Chapter 2: AI-First Development

**📚 Kọs**: [AZD For Beginners](../../README.md) | **⏱️ Time**: 1-2 hours | **⭐ Level**: Medium

---

## Overview

Dis chapter dey focus on how to deploy AI-powered applications using Azure Developer CLI and Microsoft Foundry services. E cover from simple AI chat apps go reach smart agents wey get tools.

## Learning Objectives

If you finish dis chapter, you go:
- Deploy AI applications using pre-built AZD templates
- Understand how Microsoft Foundry dey integrate with AZD
- Set up and customize AI agents wey get tools
- Deploy RAG (Retrieval-Augmented Generation) applications

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Connect AZD wit Foundry services | 30 min |
| 2 | [AI Agents Guide](agents.md) | Deploy smart agents wey get tools | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Deploy and set up AI models | 30 min |
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

# Option 3: Sharp-sharp Chat app
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Featured AI Templates

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat wey get citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent wey get tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Simple AI chat | OpenAI + Container Apps |

---

## 💰 Cost Awareness

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Make you run `azd down` after you don test to avoid extra charges.

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
Abeg note:
Dis document na AI don translate use [Co-op Translator]. Even though we dey try make am correct, make you sabi say automated translations fit get mistakes or no too correct. The original document for im original language still be de correct source. If na serious information, make you use professional human translator. We no dey responsible for any misunderstandings or wrong interpretations wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->