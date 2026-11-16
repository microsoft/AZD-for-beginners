# 7. ਸੰਖੇਪ ਅਤੇ ਅਗਲੇ ਕਦਮ

!!! tip "ਮੁੱਖ ਸੰਦੇਸ਼ ਹਨ"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. ਤੁਸੀਂ ਕੀ ਪ੍ਰਾਪਤ ਕੀਤਾ

ਵਧਾਈਆਂ! ਇਸ ਵਰਕਸ਼ਾਪ ਵਿੱਚ, ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ:

| ਮਾਡਿਊਲ | ਪ੍ਰਾਪਤੀ |
|:---|:---|
| **ਮਾਡਿਊਲ 1** | ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI ਦੀ ਖੋਜ ਕੀਤੀ ਅਤੇ ਇੱਕ AI ਟੈਂਪਲੇਟ ਚੁਣਿਆ |
| **ਮਾਡਿਊਲ 2** | ਇਕ ਪੂਰਾ AI ਏਜੰਟ ਹੱਲ ਡਿਪਲੌਇ ਕੀਤਾ ਅਤੇ ਪ੍ਰਮਾਣਿਤ ਕੀਤਾ |
| **ਮਾਡਿਊਲ 3** | ਟੈਂਪਲੇਟ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਕੇ ਇਸ ਦੀ ਸੰਰਚਨਾ ਨੂੰ ਸਮਝਿਆ |
| **ਮਾਡਿਊਲ 4** | `azure.yaml` ਸੰਰਚਨਾ ਅਤੇ ਲਾਈਫਸਾਈਕਲ ਹੁਕਾਂ ਦਾ ਅਧਿਐਨ ਕੀਤਾ |
| **ਮਾਡਿਊਲ 5** | ਆਪਣੇ ਖਾਸ ਮਾਮਲੇ ਲਈ ਟੈਂਪਲੇਟ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕੀਤਾ |
| **ਮਾਡਿਊਲ 6** | ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਢਾਂਚਾ ਹਟਾਇਆ ਅਤੇ ਸਾਧਨਾਂ ਨੂੰ ਮੈਨੇਜ ਕੀਤਾ |

---

## 2. ਮੁੱਖ ਧਾਰਨਾ ਦੀ ਸਮਝ

### ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI (azd)
- `azd init` - ਟੈਂਪਲੇਟ ਤੋਂ ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ
- `azd up` - ਇੱਕ ਹੁਕਮ ਨਾਲ ਪ੍ਰੋਵਿਜਨ ਅਤੇ ਡਿਪਲੌਇ ਕਰੋ
- `azd env` - ਵਾਤਾਵਰਣ ਚਰ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ
- `azd down` - ਸਾਧਨਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਾਫ਼ ਕਰੋ

### AZD ਟੈਂਪਲੇਟ ਸਟ੍ਰਕਚਰ
- `azure.yaml` - ਸੰਰਚਨਾ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਹੁਕਾਂ
- `infra/` - ਬਾਈਸਪ ਨਿਰਮਾਣ-ਆਸ-ਕੋਡ
- `src/` - ਐਪਲੀਕੇਸ਼ਨ ਸਰੋਤ ਕੋਡ
- `scripts/` - ਆਟੋਮੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ ਸਕ੍ਰਿਪਟ

### ਮਾਈਕ੍ਰੋਸੌਫਟ ਫਾਉਂਡਰੀ ਸਮਰੱਥਾਵਾਂ
- ਸੋਝੀਵਾਨ ਸਹਾਇਕਾਂ ਲਈ AI ਏਜੰਟ ਸੇਵਾ
- ਗਿਆਨ ਪ੍ਰਾਪਤੀ ਲਈ ਫਾਇਲ ਖੋਜ ਅਤੇ ਐਜ਼ਰ AI ਸਰਚ
- ਬਿਲਟ-ਇਨ ਟ੍ਰੇਸਿੰਗ, ਮਨੀਟਰਿੰਗ ਅਤੇ ਮੁੱਲਾਂਕਣ
- AI ਸੁਰੱਖਿਆ ਪ੍ਰਮਾਣਿਕਤਾ ਲਈ ਰੈੱਡ ਟੀਮਿੰਗ

---

## 3. ਆਪਣਾ ਸਿਖਿਆ ਯਾਤਰਾ ਜਾਰੀ ਰੱਖੋ

### ਸਿਫਾਰਸ਼ੀ ਅਗਲੇ ਕਦਮ

| ਰਸਤਾ | ਸਰੋਤ | ਸਮਾਂ |
|:---|:---|:---|
| **ਪੂਰਾ ਕੋਰਸ** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | ਸਵੈ-ਰਫਤਰ |
| **ਦੂਜਾ ਟੈਂਪਲੇਟ ਅਜ਼ਮਾਓ** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 ਘੰਟੇ |
| **ਵਿਸਤਾਰ ਵਿੱਚ ਸਿੱਖੋ** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | ਚਲ ਰਹਾ ਹੈ |
| **ਕميونਿਟੀ** | [Azure Discord](https://aka.ms/foundry/discord) | ਅੱਜ ਹੀ ਜੁੜੋ! |

### ਅਗਲੇ ਲਈ ਸੁਝਾਏ ਗਏ ਟੈਂਪਲੇਟ

1. **[AI ਚੈਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰਨ ਲਈ](https://github.com/Azure-Samples/get-started-with-ai-chat)** - ਆਪਣੇ ਡੇਟਾ ਨਾਲ ਬੇਸਿਕ ਚੈਟ
2. **[ਐਜ਼ਰ ਸਰਚ ਓਪਨਏਆਈ ਡੈਮੋ](https://github.com/Azure-Samples/azure-search-openai-demo)** - ਉन्नਤ RAG ਪੈਟਰਨ
3. **[ਕਾਂਟੋਸੋ ਚੈਟ](https://github.com/Azure-Samples/contoso-chat)** - ਉੱਦਯੋਗਿਕ ਰਿਟੇਲ ਮਾਮਲੇ

---

## 4. ਵਰਕਸ਼ਾਪ ਚੈਲੇਂਜ

ਆਪਣੀਆਂ ਕੁਸ਼ਲਤਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ? ਇਹ ਚੈਲੇਂਜ ਅਜ਼ਮਾਓ:

| ਚੈਲੇਂਜ | ਵੇਰਵਾ | ਮੁਸ਼ਕਲਤਾ |
|:---|:---|:---|
| **1. ਮਲਟੀ-ਏਜੰਟ ਸਨੈਰੀਓ** | ਵੱਖਰੇ ਉਦਯੋਗ ਲਈ ਡਿਪਲੌਇ ਅਤੇ ਕਸਟਮਾਈਜ਼ ਕਰੋ (ਜਿਵੇਂ ਕਿ, ਸਿਹਤ, ਵਿੱਤ) | ⭐⭐ |
| **2. ਆਪਣਾ ਗਿਆਨ ਬੇਸ** | ਆਪਣੇ ਡੇਟਾ ਫਾਇਲਾਂ ਸ਼ਾਮਿਲ ਕਰੋ ਅਤੇ ਕਸਟਮ ਸਰਚ ਇੰਡੈਕਸ ਬਣਾਓ | ⭐⭐⭐ |
| **3. ਉਤਪਾਦਨ ਡਿਪਲੌਇਮੈਂਟ** | `azd pipeline config` ਨਾਲ GitHub Actions ਦੀ ਵਰਤੋਂ ਕਰਕੇ CI/CD ਸੈਟਅੱਪ ਕਰੋ | ⭐⭐⭐⭐ |

---

## 5. ਆਪਣਾ ਫੀਡਬੈਕ ਸਾਂਝਾ ਕਰੋ

ਤੁਹਾਡਾ ਫੀਡਬੈਕ ਸਾਡੇ ਲਈ ਇਸ ਵਰਕਸ਼ਾਪ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਮਦਦਗਾਰ ਹੈ!

- **GitHub Issues**: [ਫੀਡਬੈਕ ਪੋਸਟ ਕਰੋ](https://github.com/microsoft/azd-for-beginners/issues) - ਨਾਲ ਟੈਗ ਕਰੋ `Workshop`
- **Discord**: ਸ਼ਾਮਲ ਹੋਵੋ [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - ਵਿੱਚ ਪੋਸਟ ਕਰੋ `#get-help`
- **ਯੋਗਦਾਨ**: ਵਰਕਸ਼ਾਪ ਵਿੱਚ ਸੁਧਾਰ ਕਰਨ ਲਈ ਪੁੱਲ ਰਿਕਵੇਸਟ ਭੇਜੋ!

---

## ਧੰਨਵਾਦ! 🎉

AZD ਫੌਰ ਏਆਈ ਡਿਵੈਲਪਰਾਂ ਵਰਕਸ਼ਾਪ ਪੂਰੀ ਕਰਨ ਲਈ ਤੁਹਾਡਾ ਧੰਨਵਾਦ। ਸਾਨੂੰ ਆਸ ਹੈ ਕਿ ਇਹ ਅਨੁਭਵ ਤੁਹਾਨੂੰ ਕੀਮਤੀ ਹُنਰ ਅਤੇ ਆਤਮਵਿਸ਼ਵਾਸ ਦੇਣ ਵਿਚ ਸਫਲ ਰਿਹਾ ਹੈ, যাতে ਤੁਸੀਂ ਅਜ਼ਯੂਰ 'ਤੇ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਅਤੇ ਡਿਪਲੋਇ ਕਰਨ ਸਕੋ।

**ਬਣਾਉਂਦੇ ਰਹੋ, ਸਿੱਖਦੇ ਰਹੋ, ਅਤੇ ਅਜ਼ਯੂਰ ਏਆਈ ਡਿਵੈਲਪਰ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ!**

---

| | |
|:---|:---|
| **📚 ਕੋਰਸ ਘਰ** | [ਨਵੇਂ ਸ਼ੁਰੂਆਤੀ ਲਈ AZD](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 ਦਸਤਾਵੇਜ਼** | [ਅਜ਼ਯੂਰ ਡਿਵੈਲਪਰ CLI ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ ਏਆਈ ਨਮੂਨੇ** | [Microsoft Foundry ਨਮੂਨੇ](https://ai.azure.com/templates) |
| **💬 ਕਮਿਊਨਿਟੀ** | [ਅਜ਼ਯੂਰ Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->