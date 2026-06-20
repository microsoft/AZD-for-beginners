# ਅਧਿਆਇ 2: ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ

**📚 Course**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## ਸਾਰ

ਇਹ ਅਧਿਆਇ Azure Developer CLI ਅਤੇ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਆਈ-ਸੰਚਾਲਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ 'ਤੇ ਧਿਆਨ ਕੇਂਦ੍ਰਿਤ ਕਰਦਾ ਹੈ। ਸਾਦੇ ਏਆਈ ਚੈਟ ਐਪਸ ਤੋਂ ਲੈ ਕੇ ਟੂਲਾਂ ਵਾਲੇ ਸਿਆਣੇ ਏਜੰਟਾਂ ਤੱਕ।

> **ਮਨਜ਼ੂਰੀ ਨੋਟ (2026-06-15):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.25.6` and the current preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

By completing this chapter, you will:
- ਪ੍ਰੀ-ਬਿਲਟ AZD ਟੈਮਪਲੇਟਸ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ
- AZD ਨਾਲ Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਨੂੰ ਸਮਝੋ
- ਟੂਲਾਂ ਨਾਲ ਏਆਈ ਏਜੰਟਾਂ ਨੂੰ ਕੰਫਿਗਰ ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- RAG (ਰੀਟਰੀਵਲ-ਅਗਮੈਂਟਡ ਜਨਰੇਸ਼ਨ) ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵਰਣਨ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ](microsoft-foundry-integration.md) | AZD ਨੂੰ Foundry ਸੇਵਾਵਾਂ ਨਾਲ ਜੋੜੋ | 30 ਮਿੰਟ |
| 2 | [ਏਆਈ ਏਜੰਟਾਂ ਗਾਈਡ](agents.md) | ਟੂਲਾਂ ਨਾਲ ਸਿਆਣੇ ਏਜੰਟ ਡਿਪਲੋਇ ਕਰੋ | 45 ਮਿੰਟ |
| 3 | [AI ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ](ai-model-deployment.md) | ਏਆਈ ਮਾਡਲਾਂ ਨੂੰ ਡਿਪਲੋਇ ਅਤੇ ਕੰਫਿਗਰ ਕਰੋ | 30 ਮਿੰਟ |
| 4 | [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](ai-workshop-lab.md) | ਹੱਥ-ਵਰਕ: ਆਪਣੇ ਏਆਈ ਹੱਲ ਨੂੰ AZD-ਤਿਆਰ ਬਣਾਓ | 60 ਮਿੰਟ |

---

## 🚀 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ

```bash
# ਵਿਕਲਪ 1: RAG ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ
azd init --template azure-search-openai-demo
azd up

# ਵਿਕਲਪ 2: AI ਏਜੰਟਸ
azd init --template get-started-with-ai-agents
azd up

# ਵਿਕਲਪ 3: ਤੇਜ਼ ਚੈਟ ਐਪ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ਫੀਚਰਡ AI ਟੈਮਪਲੇਟ

| ਟੈਮਪਲੇਟ | ਵਰਣਨ | ਸੇਵਾਵਾਂ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ਹਵਾਲਿਆਂ ਨਾਲ RAG ਚੈਟ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ਟੂਲਾਂ ਨਾਲ ਏਆਈ ਏਜੰਟ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਬੁਨਿਆਦੀ ਏਆਈ ਚੈਟ | OpenAI + Container Apps |

---

## 💰 ਲਾਗਤ ਸੂਝਬੂਝ

| ਮਾਹੌਲ | ਅਨੁਮਾਨਤ ਮਹੀਨਾਵਾਰ ਲਾਗਤ |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ਸੁਝਾਅ:** ਟੈਸਟ ਕਰਨ ਮਗਰੋਂ ਖਰਚ ਤੋਂ ਬਚਣ ਲਈ `azd down` ਚਲਾਓ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](../chapter-01-foundation/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/README.md) |
| **ਸਿੱਧਾ ਜਾਓ** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ ਪੈਟਰਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [AI ਸਮੱਸਿਆ-ਨਿਵਾਰਣ](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ਪ੍ਰੋਡਕਸ਼ਨ ਏਆਈ ਅਭਿਆਸ](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->