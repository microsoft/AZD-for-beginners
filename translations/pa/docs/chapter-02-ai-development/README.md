# ਅਧਿਆਇ 2: ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ

**📚 ਕੋਰਸ**: [AZD For Beginners](../../README.md) | **⏱️ ਸਮਾਂ**: 1-2 ਘੰਟੇ | **⭐ ਜਟਿਲਤਾ**: ਮੱਧਮ

---

## ਸਰਵੇਖਣ

ਇਸ ਅਧਿਆਇ ਦਾ ਧਿਆਨ Azure Developer CLI ਅਤੇ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਆਈ-ਸੰਚਾਲਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰਨ 'ਤੇ ਹੈ। ਸਧਾਰਨ ਏਆਈ ਚੈਟ ਐਪ ਤੋਂ ਲੈ ਕੇ ਟੂਲਜ਼ ਵਾਲੇ ਬੁੱਧੀਮਾਨ ਏਜੰਟ ਤੱਕ।

> **ਤਸਦੀਕ ਨੋਟ (2026-03-25):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.23.12` and the current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

By completing this chapter, you will:
- Pre-built AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
- AZD ਨਾਲ Microsoft Foundry ਦੇ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨੂੰ ਸਮਝੋ
- ਟੂਲਜ਼ ਦੇ ਨਾਲ ਏਆਈ ਏਜੰਟਾਂ ਨੂੰ ਸੰਰਚਿਤ ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- RAG (Retrieval-Augmented Generation) ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵਰਣਨ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ਨੂੰ Foundry ਸੇਵਾਵਾਂ ਨਾਲ ਜੋੜੋ | 30 ਮਿੰਟ |
| 2 | [AI Agents Guide](agents.md) | ਟੂਲਜ਼ ਨਾਲ ਬੁੱਧੀਮਾਨ ਏਜੰਟ ਤੈਨਾਤ ਕਰੋ | 45 ਮਿੰਟ |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI ਮਾਡਲਾਂ ਨੂੰ ਤੈਨਾਤ ਅਤੇ ਸੰਰਚਿਤ ਕਰੋ | 30 ਮਿੰਟ |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ਹੈਂਡਸ-ਆਨ: ਆਪਣਾ AI ਹੱਲ AZD-ਤਿਆਰ ਬਣਾਓ | 60 ਮਿੰਟ |

---

## 🚀 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

```bash
# ਵਿਕਲਪ 1: RAG ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ
azd init --template azure-search-openai-demo
azd up

# ਵਿਕਲਪ 2: ਕ੍ਰਿਤ੍ਰਿਮ ਬੁੱਧੀ ਏਜੰਟਾਂ
azd init --template get-started-with-ai-agents
azd up

# ਵਿਕਲਪ 3: ਤੇਜ਼ ਚੈਟ ਐਪ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ਵਿਸ਼ੇਸ਼ AI ਟੈਂਪਲੇਟ

| ਟੈਮਪਲੇਟ | ਵਰਣਨ | ਸੇਵਾਵਾਂ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ਉਲਲੇਖਾਂ ਨਾਲ RAG ਚੈਟ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ਟੂਲਜ਼ ਨਾਲ AI ਏਜੰਟ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਮੁੱਢਲਾ AI ਚੈਟ | OpenAI + Container Apps |

---

## 💰 ਲਾਗਤ ਬਾਰੇ ਜਾਣਕਾਰੀ

| ਵਾਤਾਵਰਣ | ਅੰਦਾਜ਼ਤੀ ਮਹੀਨਾਵਾਰ ਲਾਗਤ |
|-------------|----------------------|
| ਡਿਵੈਲਪਮੈਂਟ | $80-150 |
| ਸਟੇਜਿੰਗ | $150-300 |
| ਉਤਪਾਦਨ | $300-3,500+ |

**ਸਲਾਹ:** ਟੈਸਟ ਕਰਨ ਤੋਂ ਬਾਅਦ ਖਰਚਾਂ ਤੋਂ ਬਚਣ ਲਈ `azd down` ਚਲਾਓ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](../chapter-01-foundation/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/README.md) |
| **ਸਿੱਧਾ ਜਾਓ** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ ਪੈਟਰਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਤ ਸਰੋਤ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤਰੁਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->