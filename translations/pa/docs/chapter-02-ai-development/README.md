# ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ

**📚 ਕੋਰਸ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md) | **⏱️ ਸਮਾਂ**: ਵਰਕਸ਼ਾਪ ਸਮੇਤ 4-5 ਘੰਟੇ | **⭐ ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ

---

## ਸਾਰ

ਇਹ ਅਧਿਆਇ Azure Developer CLI ਅਤੇ Microsoft Foundry ਸੇਵਾਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI-ਸੰਚਾਲਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਤੈਨਾਤੀ 'ਤੇ ਕੇਂਦਰਤ ਹੈ। ਸਧਾਰਣ AI ਚੈਟ ਐਪਸ ਤੋਂ ਲੈ ਕੇ ਸੰਦਾਂ ਵਾਲੇ ਬੁੱਧੀਮਾਨ ਏਜੰਟਾਂ ਤੱਕ।

> **ਰਿਲੀਜ਼ ਸਮੀਖਿਆ (2026-11-04):** AI CLI ਗਾਈਡ ਨੂੰ ਪ੍ਰਕਾਸ਼ਿਤ `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, ਅਤੇ `azure.ai.evaluations` `1.0.0-beta.2` ਦਸਤਾਵੇਜ਼/ਸਰੋਤ ਖਿਲਾਫ ਚੈੱਕ ਕੀਤਾ ਗਿਆ ਸੀ। ਮਿਲੀ-ਜੁਲੀ ਵਰਕਫਲੋ ਲਈ `azd >= 1.37.0` ਦੀ ਵਰਤੋਂ ਕਰੋ। ਮੁਲਾਂਕਣ ਅਜੇ ਵੱਖ-ਵੱਖ `azd ai eval` ਨਾਮ-ਸਥਾਨ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ; ਵੇਖੋ [ਰਿਲੀਜ਼ ਬਦਲਾਅ ਅਤੇ ਮਾਈਗ੍ਰੇਸ਼ਨ ਗਾਈਡ](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)। ਇਹ ਲਾਈਵ ਤੈਨਾਤੀ ਮਾਨਤਾ ਨਹੀਂ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਪਹਿਲਾਂ ਤਿਆਰ ਕੀਤੇ AZD ਟੈਂਪਲੇਟਾਂ ਨਾਲ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
- AZD ਨਾਲ Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਨੂੰ ਸਮਝੋ
- ਸੰਦਾਂ ਨਾਲ AI ਏਜੰਟਾਂ ਨੂੰ ਸੰਰਚਿਤ ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕਰੋ
- RAG (Retrieval-Augmented Generation) ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ਇੰਟਿਗ੍ਰੇਸ਼ਨ](microsoft-foundry-integration.md) | AZD ਨੂੰ Foundry ਸੇਵਾਵਾਂ ਨਾਲ ਸੰਬੰਧਿਤ ਕਰੋ | 30 ਮਿੰਟ |
| 2 | [AI ਏਜੰਟ ਮਾਰਗਦਰਸ਼ਨ](agents.md) | ਸੰਦਾਂ ਨਾਲ ਬੁੱਧੀਮਾਨ ਏਜੰਟਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋ | 45 ਮਿੰਟ |
| 3 | [AI ਮਾਡਲ ਤੈਨਾਤੀ](ai-model-deployment.md) | AI ਮਾਡਲਾਂ ਨੂੰ ਤੈਨਾਤ ਅਤੇ ਸੰਰਚਿਤ ਕਰੋ | 30 ਮਿੰਟ |
| 4 | [AI ਵਰਕਸ਼ਾਪ ਲੈੱਬ](ai-workshop-lab.md) | ਹੱਥ-ਵਰਕ: ਇੱਕ ਟੈਂਪਲੇਟ ਨੂੰ ਖੋਜੋ ਅਤੇ ਆਪਣੇ ਕੇਂਦਰਨੀਤੀ ਦੀ ਯੋਜਨਾ ਬਣਾਓ | 2-3 ਘੰਟੇ |

---

## 🚀 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ

ਨਵੀਂ ਖਾਲੀ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇਕ ਵਿਕਲਪ ਚੁਣੋ। ਅੰਤ ਵਿੱਚ ਦਿੱਤਾ ਗਿਆ `.` ਮੌਜੂਦਾ ਡਾਇਰੈਕਟਰੀ ਨੂੰ ਸ਼ੁਰੂ ਕਰਦਾ ਹੈ; ਨਹੀਂ ਤਾਂ AZD ਤੁਹਾਡੇ ਸ਼ੈੱਲ ਦੀ ਵਰਕਿੰਗ ਡਾਇਰੈਕਟਰੀ ਬਦਲੇ ਬਿਨਾਂ ਇੱਕ ਸਬਡਾਇਰੈਕਟਰੀ ਬਣਾ ਸਕਦਾ ਹੈ।

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

## 🤖 ਚੋਣੀਦਾ AI ਟੈਂਪਲੇਟ

| ਟੈਂਪਲੇਟ | ਵੇਰਵਾ | ਸੇਵਾਵਾਂ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ਉਦਾਹਰਣਾਂ ਨਾਲ RAG ਚੈਟ | OpenAI + AI ਖੋਜ |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ਸੰਦਾਂ ਵਾਲਾ AI ਏਜੰਟ | AI ਏਜੰਟ ਸੇਵਾ |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਬੁਨਿਆਦੀ AI ਚੈਟ | OpenAI + ਕੰਟੇਨਰ ਐਪਸ |

---

## 💰 ਲਾਗਤ ਦਾ ਗਿਆਨ

ਇਹ ਦਰਸਾਏ ਗਏ ਪੱਧਰ ਹਨ, ਨਾਂ ਕਿ ਕੀਮਤਾਂ ਜਾਂ ਸੀਮਾਵਾਂ; ਮਾਡਲ ਟਰੈਫਿਕ, ਖੋਜ/ਕੰਪਿਊਟ SKUs, ਖੇਤਰ ਅਤੇ ਵਿਕਲਪਿਕ ਫੀਚਰ ਇਨ੍ਹਾਂ ਤੋਂ ਵੱਧ ਹੋ ਸਕਦੇ ਹਨ। ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਤੋਂ ਪਹਿਲਾਂ ਆਪਣੇ ਚੁਣੇ ਨਮੂਨੇ ਦੀ ਮੌਜੂਦਾ ਕੀਮਤਾਂ ਦੀ ਰਾਹ-ਦਿੱਖ ਚੈੱਕ ਕਰੋ।

| ਵਾਤਾਵਰਣ | ਅੰਦਾਜ਼ਾ ਮਾਸਿਕ ਲਾਗਤ |
|-------------|----------------------|
| ਵਿਕਾਸ | $80-150 |
| ਸਟੇਜਿੰਗ | $150-300 |
| ਉਤਪਾਦਨ | $300-3,500+ |

**ਸਲਾਹ:** ਚਾਰਜਾਂ ਤੋਂ ਬਚਣ ਲਈ ਟੈਸਟ ਕਰਨ ਤੋਂ ਬਾਅਦ `azd down` ਚਲਾਓ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](../chapter-01-foundation/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/README.md) |
| **ਛੱਡੋ** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ ਪੈਟਰਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [AI ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ਉਤਪਾਦਨ AI ਅਭਿਆਸ](../chapter-08-production/production-ai-practices.md)
- [ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->