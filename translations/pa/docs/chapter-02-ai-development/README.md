# ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ

**📚 ਕੋਰਸ**: [AZD For Beginners](../../README.md) | **⏱️ ਅਵਧੀ**: 1-2 ਘੰٹے | **⭐ ਕਠਨਾਈ**: ਮੱਧਮ

---

## ਜਾਇਜ਼ਾ

ਇਹ ਅਧਿਆਇ Azure Developer CLI ਅਤੇ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI-ਸਮਰਥਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ 'ਤੇ ਕੇਂਦ੍ਰਿਤ ਹੈ। ਸਧਾਰਣ AI ਚੈਟ ਐਪ ਤੋਂ ਲੈ ਕੇ ਟੂਲਾਂ ਨਾਲ ਸਮਰਥਿਤ ਬੁੱਧਿਮਾਨ ਏਜੰਟ ਤੱਕ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ مکمل ਕਰਨ 'ਤੇ ਤੁਸੀਂ:
- ਤਿਆਰ AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋਗੇ
- AZD ਨਾਲ Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਨੂੰ ਸਮਝੋਗੇ
- ਟੂਲਾਂ ਨਾਲ AI ਏਜੰਟਾਂ ਨੂੰ ਕਨਫਿਗਰ ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕਰੋਗੇ
- RAG (Retrieval-Augmented Generation) ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋਗੇ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ਨੂੰ Foundry ਸੇਵਾਵਾਂ ਨਾਲ ਜੋੜੋ | 30 ਮਿੰਟ |
| 2 | [AI Agents Guide](agents.md) | ਟੂਲਾਂ ਨਾਲ ਬੁੱਧਿਮਾਨ ਏਜੰਟ ਡਿਪਲੋਇ ਕਰੋ | 45 ਮਿੰਟ |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI ਮਾਡਲਾਂ ਨੂੰ ਡਿਪਲੋਇ ਅਤੇ ਕਨਫਿਗਰ ਕਰੋ | 30 ਮਿੰਟ |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | ਪ੍ਰੈਕਟਿਕਲ: ਆਪਣਾ AI ਹੱਲ AZD-ਤਿਆਰ ਬਣਾਓ | 60 ਮਿੰਟ |

---

## 🚀 ਤੁਰੰਤ ਸ਼ੁਰੂ

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

## 🤖 ਪ੍ਰਮੁੱਖ AI ਟੈਂਪਲੇਟ

| Template | ਵੇਰਵਾ | ਸੇਵਾਵਾਂ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ਸੰਦਰਭਾਂ ਨਾਲ RAG ਚੈਟ | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ਟੂਲਾਂ ਨਾਲ AI ਏਜੰਟ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਮੂਲ AI ਚੈਟ | OpenAI + Container Apps |

---

## 💰 ਲਾਗਤ ਬਾਰੇ ਜਾਣਕਾਰੀ

| Environment | ਅੰਦਾਜ਼ਿਤ ਮਾਸਿਕ ਲਾਗਤ |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ਟਿਪ:** ਟੈਸਟ ਕਰਨ ਤੋਂ ਬਾਅਦ ਚਾਰਜਜ਼ ਤੋਂ ਬਚਣ ਲਈ `azd down` ਚਲਾਓ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](../chapter-01-foundation/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/README.md) |
| **ਸਿੱਧਾ** | [ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ ਪੈਟਰਨਸ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਤ ਸਰੋਤ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰ:

ਇਸ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਪਸ਼ਟਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਹੀ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤ-ਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀ⁦ਂ⁩ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->