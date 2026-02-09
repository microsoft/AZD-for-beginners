# 7. ਸੰਖੇਪ ਅਤੇ ਅਗਲੇ ਕਦਮ

!!! tip "ਮੁੱਖ ਸਿੱਖਣਯੋਗ ਸੰਦੇਸ਼"

    - [ ] AZD ਟੈਂਪਲੇਟ AI ਐਪਲੀਕੇਸ਼ਨ ਵਿਕਾਸ ਨੂੰ ਦਿਨਾਂ ਤੋਂ ਘੰਟਿਆਂ ਵਿੱਚ ਤੇਜ਼ ਕਰਦੇ ਹਨ
    - [ ] ਖੋਜ → ਤੈਨਾਤੀ → ਨਿੱਜੀਕਰਨ ਮੈਥਡੋਲੋਜੀ ਇੱਕ ਰਚਨਾਬੱਧ ਸਿੱਖਣ ਰਾਹ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ
    - [ ] GitHub Copilot MCP ਸਰਵਰਾਂ ਨਾਲ ਜਟਿਲ ਕੋਡਬੇਸ ਦੀ ਕੁਦਰਤੀ ਭਾਸ਼ਾ ਵਿੱਚ ਜਾਂਚ ਕਰਨ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ
    - [ ] Microsoft Foundry ਨਿਰਮਿਤ ਨਿਰੀਖਣਯੋਗਤਾ, ਮੁਲਾਂਕਣ ਅਤੇ ਸੁਰੱਖਿਆ ਟੈਸਟਿੰਗ ਮੁਹੱਈਆ ਕਰਦਾ ਹੈ

---

## 1. ਤੁਸੀਂ ਕੀ ਪ੍ਰਾਪਤ ਕੀਤਾ

ਵਧਾਈ ਹੋਵੇ! ਇਸ ਵਰਕਸ਼ਾਪ ਵਿੱਚ, ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:

| Module | Accomplishment |
|:---|:---|
| **ਮੋਡੀਊਲ 1** | Azure Developer CLI ਦੀ ਖੋਜ ਕੀਤੀ ਅਤੇ ਇੱਕ AI ਟੈਂਪਲੇਟ ਚੁਣਿਆ |
| **ਮੋਡੀਊਲ 2** | ਪੂਰਾ AI ਏਜੰਟਸ ਸੋਲੂਸ਼ਨ ਤੈਨਾਤ ਅਤੇ ਸੱਚਾਈ ਦੀ ਜਾਂਚ ਕੀਤੀ |
| **ਮੋਡੀਊਲ 3** | ਟੈਂਪਲੇਟ ਨੂੰ ਵਿਭਾਜਿਤ ਕੀਤਾ ਤਾਂ ਜੋ ਇਸ ਦੀ ਆਰਕੀਟੈਕਚਰ ਸਮਝੀ ਜਾ ਸਕੇ |
| **ਮੋਡੀਊਲ 4** | `azure.yaml` ਕੰਫਿਗਰੇਸ਼ਨ ਅਤੇ ਲਾਈਫਸਾਈਕਲ ਹੋਕਸ ਦੀ ਜਾਂਚ ਕੀਤੀ |
| **ਮੋਡੀਊਲ 5** | ਆਪਣੇ ਸਿਨਾਰਿਓ ਲਈ ਟੈਂਪਲੇਟ ਨੂੰ ਨਿੱਜੀਕ੍ਰਿਤ ਕੀਤਾ |
| **ਮੋਡੀਊਲ 6** | ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਨੂੰ ਹਟਾਇਆ ਅਤੇ ਰਿਸੋਰਸਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕੀਤਾ |

---

## 2. ਮੁੱਖ ਸੰਕਲਪਾਂ ਵਿੱਚ ਪ੍ਰਾਵੀਣਤਾ

### Azure Developer CLI (azd)
- `azd init` - ਟੈਂਪਲੇਟ ਤੋਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
- `azd up` - ਇੱਕ ਕਮਾਂਡ ਵਿੱਚ ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਤੈਨਾਤ
- `azd env` - ਇਨਵਾਇਰਨਮੈਂਟ ਵੇਰੀਏਬਲ ਪ੍ਰਬੰਧ ਕਰੋ
- `azd down` - ਰਿਸੋਰਸਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਢੰਗ ਨਾਲ ਸਾਫ਼ ਕਰੋ

### AZD Template Structure
- `azure.yaml` - ਕੰਫਿਗਰੇਸ਼ਨ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਹੋਕਸ
- `infra/` - Bicep ਇੰਫ੍ਰਾਸਟਰੈਕਚਰ-ਐਜ਼-ਕੋਡ
- `src/` - ਐਪਲੀਕੇਸ਼ਨ ਸੋর্স ਕੋਡ
- `scripts/` - ਆਟੋਮੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ ਸਕ੍ਰਿਪਟਾਂ

### Microsoft Foundry Capabilities
- ਬੁੱਧੀਮਾਨ ਸਹਾਇਕਾਂ ਲਈ AI ਏਜੰਟ ਸੇਵਾ
- ਜਾਣਕਾਰੀ ਪ੍ਰਾਪਤੀ ਲਈ ਫਾਇਲ ਖੋਜ ਅਤੇ Azure AI Search
- ਬਿਲਟ-ਇਨ ਟ੍ਰੇਸਿੰਗ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ
- AI ਸੁਰੱਖਿਆ ਵੈਰੀਫਿਕੇਸ਼ਨ ਲਈ ਰੈਡ ਟੀਮਿੰਗ

---

## 3. ਆਪਣੀ ਸਿੱਖਣ ਯਾਤਰਾ ਜਾਰੀ ਰੱਖੋ

### ਸੁਝਾਏ ਗਏ ਅਗਲੇ ਕਦਮ

| ਰਸਤਾ | ਸਰੋਤ | ਸਮਾਂ |
|:---|:---|:---|
| **Complete Course** | [AZD ਬਿਗਿਨਰਜ਼ ਪਾਠਕ੍ਰਮ](../../README.md) | 8-12 ਘੰਟੇ |
| **Try Another Template** | [Microsoft Foundry ਟੈਂਪਲੇਟ](https://ai.azure.com/templates) | 1-2 ਘੰਟੇ |
| **Deep Dive** | [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | جاري |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | ਅੱਜ ਹੀ ਜੁੜੋ! |

### ਅਗਲੇ ਲਈ ਸੁਝਾਏ ਗਏ ਟੈਂਪਲੇਟ

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - ਤੁਹਾਡੇ ਡੇਟਾ ਨਾਲ ਬੁਨਿਆਦੀ ਚੈਟ
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - ਉੱਨਤ RAG ਪੈਟਰਨ
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - ਐਂਟਰਪ੍ਰਾਈਜ਼ ਰੀਟੇਲ ਸਿਨਾਰਿਓਜ਼

---

## 4. ਵਰਕਸ਼ਾਪ ਚੈਲੈਂਜ

ਆਪਣੀਆਂ ਕੁਸ਼ਲਤਾ ਦੀ ਜਾਂਚ ਲਈ ਤਿਆਰ ਹੋ? ਇਨ੍ਹਾਂ ਚੈਲੈਂਜਾਂ ਨੂੰ ਅਜ਼ਮਾਓ:

| ਚੈਲੈਂਜ | ਵੇਰਵਾ | ਮੁਸ਼ਕਲਤਾ |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | ਇੱਕ ਵੱਖ-ਵੱਖ ਉਦਯੋਗ ਲਈ ਤੈਨਾਤ ਅਤੇ ਨਿੱਜੀਕਰਨ ਕਰੋ (ਉਦਾਹਰਣ: ਸਿਹਤਸੇਵਾ, ਵਿੱਤੀ) | ⭐⭐ |
| **2. Custom Knowledge Base** | ਆਪਣੇ ਡੇਟਾ ਫਾਇਲਾਂ ਜੋੜੋ ਅਤੇ ਇੱਕ ਨਿੱਜੀ ਖੋਜ ਇੰਡੈਕਸ ਬਣਾਓ | ⭐⭐⭐ |
| **3. Production Deployment** | `azd pipeline config` ਵਰਤਕੇ GitHub Actions ਨਾਲ CI/CD ਸੈੱਟਅੱਪ ਕਰੋ | ⭐⭐⭐⭐ |

---

## 5. ਆਪਣੀ ਪ੍ਰਤਿਕ੍ਰਿਆ ਸਾਂਝੀ ਕਰੋ

ਤੁਹਾਡੀ ਪ੍ਰਤਿਕ੍ਰਿਆ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਸੁਧਾਰਨ ਵਿੱਚ ਸਾਡੀ ਮਦਦ ਕਰਦੀ ਹੈ!

- **GitHub Issues**: [ਪ੍ਰਤਿਕ੍ਰਿਆ ਪੋਸਟ ਕਰੋ](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` ਨਾਲ ਟੈਗ ਕਰੋ
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ - `#get-help` ਵਿੱਚ ਪੋਸਟ ਕਰੋ
- **Contributions**: ਵਰਕਸ਼ਾਪ ਨੂੰ ਸੁਧਾਰਨ ਵਿੱਚ ਮਦਦ ਕਰੋ pull requests ਭੇਜ ਕੇ!

---

## ਧੰਨਵਾਦ! 🎉

AZD for AI Developers ਵਰਕਸ਼ਾਪ ਪੂਰਾ ਕਰਨ ਲਈ ਤੁਹਾਡਾ ਧੰਨਵਾਦ। ਅਸੀਂ ਆਸ ਕਰਦੇ ਹਾਂ ਕਿ ਇਹ ਅਨਭਵ ਤੁਹਾਨੂੰ Azure 'ਤੇ AI ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਤੈਨਾਤ ਕਰਨ ਲਈ ਹੁਨਰ ਅਤੇ ਆਤਮ-ਵਿਸ਼ਵਾਸ ਨਾਲ ਸਜਾਇਆ ਹੈ।

**ਨਿਰੰਤਰ ਬਣਾਉ, ਨਿਰੰਤਰ ਸਿੱਖੋ, ਅਤੇ Azure AI ਡਿਵੈਲਪਰ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ!**

---

| | |
|:---|:---|
| **📚 ਕੋਰਸ ਹੋਮ** | [AZD ਬਿਗਿਨਰਜ਼](../../README.md) |
| **📖 ਦਸਤਾਵੇਜ਼** | [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI ਟੈਂਪਲੇਟ** | [Microsoft Foundry ਟੈਂਪਲੇਟ](https://ai.azure.com/templates) |
| **💬 ਕਮਿਊਨਿਟੀ** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼, ਜੋ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੈ, ਨੂੰ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->