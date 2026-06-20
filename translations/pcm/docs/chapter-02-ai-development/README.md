# Chapter 2: AI-Fust Development

**📚 Kọs**: [AZD For Beginners](../../README.md) | **⏱️ Taim**: 1-2 hours | **⭐ Level**: Intermediate

---

## Wetin dis chapter dey about

Dis chapter dey focus on how to deploy AI-powered applications wit Azure Developer CLI and Microsoft Foundry services. E cover everything from small AI chat apps go reach intelligent agents wey get tools.

> **Validation note (2026-06-15):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.25.6` and the current preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Wetin you go learn

By completing this chapter, you will:
- Deploy AI applications using pre-built AZD templates
- Understand how Microsoft Foundry take integrate with AZD
- Configure and customize AI agents wit tools
- Deploy RAG (Retrieval-Augmented Generation) apps

---

## 📚 Lekshon

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Make AZD connect wit Foundry services | 30 min |
| 2 | [AI Agents Guide](agents.md) | Deploy smart agents wit tools | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Deploy and configure AI models | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Make your AI solution AZD-ready | 60 min |

---

## 🚀 Quick Start

```bash
# Option 1: RAG Chat App
azd init --template azure-search-openai-demo
azd up

# Option 2: AI Agents dem
azd init --template get-started-with-ai-agents
azd up

# Option 3: Sharp-sharp Chat App
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Featured AI Templates

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat wey dey give citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent wit tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basic AI chat | OpenAI + Container Apps |

---

## 💰 How e go cost

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** After you don test, run `azd down` make you no dey incur charges.

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