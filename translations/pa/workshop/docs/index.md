# AZD for AI Developers Workshop

> [!IMPORTANT]  
> **ਇਸ workshop ਵਿੱਚ ਇੱਕ ਵਰਕਸ਼ਾਪ ਗਾਈਡ ਸ਼ਾਮਲ ਹੈ ਜਿਸਨੂੰ ਤੁਸੀਂ ਆਪਣੇ ਲੋਕਲ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਪ੍ਰੀਵਿью ਕਰ ਸਕਦੇ ਹੋ। ਸ਼ੁਰੂ ਕਰਨ ਲਈ, ਤੁਹਾਨੂੰ repo 'ਤੇ GitHub Codespaces ਲਾਂਚ ਕਰਨੇ ਹੋਣਗੇ—ਫਿਰ ਤਦ ਤੱਕ ਠਹਿਰੋ ਜਦ ਤੱਕ ਤੁਸੀਂ ਇੱਕ ਸਰਗਰਮ VS Code ਟਰਮੀਨਲ ਨਹੀਂ ਵੇਖਦੇ ਅਤੇ ਟਾਈਪ ਕਰੋ:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ਤੁਹਾਨੂੰ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਪ੍ਰੀਵਿਊ ਪੇਜ ਖੋਲ੍ਹਣ ਲਈ ਇੱਕ ਪਾਪ-ਅੱਪ ਡਾਇਲਾਗ ਦਿੱਖੇਗਾ।**

Azure Developer CLI (AZD) ਨੂੰ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ 'ਤੇ ਧਿਆਨ ਦੇ ਕੇ ਸਿੱਖਣ ਲਈ ਹੱਥਾਂ-ਉੱਤੇ ਵਾਲੇ ਵਰਕਸ਼ਾਪ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ। ਇਹ ਵਰਕਸ਼ਾਪ ਤੁਹਾਨੂੰ AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਲਾਗੂ ਸਮਝ 3 ਕਦਮਾਂ ਵਿੱਚ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

1. **Discovery** - ਉਹ ਟੈਂਪਲੇਟ ਲੱਭੋ ਜੋ ਤੁਹਾਡੇ ਲਈ ਠੀਕ ਹੈ।  
1. **Deployment** - ਡਿਪਲੌਇ ਕਰੋ ਅਤੇ ਉਸ ਦੀ ਸਵੀਕ੍ਰਤੀ ਕਰੋ ਕਿ ਇਹ ਕੰਮ ਕਰਦਾ ਹੈ  
1. **Customization** - ਸੋਧੋ ਅਤੇ ਦੋਹਰਾਓ ਤਾਂ ਜੋ ਇਹ ਤੁਹਾਡਾ ਬਣ ਜਾਵੇ!

ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਦੌਰਾਨ, ਤੁਹਾਨੂੰ ਕੋਰ ਡਿਵੈਲਪਰ ਟੂਲਜ਼ ਅਤੇ ਵਰਕਫ਼ਲੋਜ਼ ਨਾਲ ਵੀ ਜਾਣੂ ਕਰਵਾਇਆ ਜਾਵੇਗਾ, ਜੋ ਤੁਹਾਡੇ ਐਂਡ-ਟੂ-ਐਂਡ ਵਿਕਾਸ ਯਾਤਰਾ ਨੂੰ ਸਧਾਰਨ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦੇ ਹਨ।

| | | 
|:---|:---|
| **📚 ਕੋਰਸ ਹੋਮ**| [AZD For Beginners](../README.md)|
| **📖 ਦਸਤਾਵੇਜ਼** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI ਟੈਂਪਲੇਟ** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 ਅਗਲੇ ਕਦਮ** | [Take The Challenge](../../../../workshop/docs) |
| | |

## ਵਰਕਸ਼ਾਪ ਦਾ ਝਲਕ

**ਅਵਧੀ:** 3-4 ਘੰਟੇ  
**ਸਤਹ:** Beginner to Intermediate  
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ:** Azure, AI ਸੰਕਲਪਾਂ, VS Code ਅਤੇ ਕਮਾਂਡ-ਲਾਈਨ ਟੂਲਜ਼ ਨਾਲ ਜਾਣੂ ਹੋਣਾ।

ਇਹ ਇੱਕ ਹੱਥ-ਉੱਤੇ ਵਾਲਾ ਵਰਕਸ਼ਾਪ ਹੈ ਜਿੱਥੇ ਤੁਸੀਂ ਕਰਕੇ ਸਿੱਖਦੇ ਹੋ। ਜਦੋਂ ਤੁਸੀਂ ਅਭਿਆਸ ਪੂਰੇ ਕਰ ਲਓਗੇ, ਅਸੀਂ ਸਿਫਾਰਸ਼ ਕਰਦੇ ਹਾਂ ਕਿ ਆਪਣੀ ਸਿੱਖਿਆ ਜਾਰੀ ਰੱਖਣ ਲਈ AZD For Beginners ਪਾਠਕ੍ਰਮ ਨੂੰ ਮੁੜ ਵੇਖੋ ਤਾਂ ਜੋ ਸੁਰੱਖਿਆ ਅਤੇ ਉਤਪਾਦਕਤਾ ਦੀਆਂ ਸਰੋਤੀਆਂ ਬੇਹਤਰੀਆਂ ਉਤੇ ਤੁਸੀਂ ਹੋਰ ਜਾਣ ਸਕੋ।

| Time| Module  | Objective |
|:---|:---|:---|
| 15 ਮਿੰਟ | Introduction | ਸਥਾਪਨਾ ਕਰੋ, ਲਕ਼ਸ਼ਾਂ ਨੂੰ ਸਮਝੋ |
| 30 ਮਿੰਟ | Select AI Template | ਵਿਕਲਪਾਂ ਦਾ ਪਤਾ ਲਗਾਓ ਅਤੇ ਸ਼ੁਰੂਆਤੀ ਚੁਣੋ | 
| 30 ਮਿੰਟ | Validate AI Template | ਡਿਫਾਲਟ ਸਲੂਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੌਇ ਕਰੋ |
| 30 ਮਿੰਟ | Deconstruct AI Template | ਸੰਰਚਨਾ ਅਤੇ ਕਨਫਿਗ ਨੂੰ ਖੋਜੋ |
| 30 ਮਿੰਟ | Configure AI Template | ਉਪਲਬਧ ਫੀਚਰਾਂ ਨੂੰ ਐਕਟੀਵੇਟ ਅਤੇ ਆਜ਼ਮਾਓ |
| 30 ਮਿੰਟ | Customize AI Template | ਟੈਂਪਲੇਟ ਨੂੰ ਆਪਣੀਆਂ ਲੋੜਾਂ ਅਨੁਸਾਰ ਢਾਲੋ |
| 30 ਮਿੰਟ | Teardown Infrastructure | ਸਾਧਨਾਂ ਦੀ ਸਫਾਈ ਅਤੇ ਰਿਲੀਜ਼ ਕਰੋ |
| 15 ਮਿੰਟ | Wrap-Up & Next Steps | ਸਿੱਖਣ ਦੇ ਸੰਦ, ਵਰਕਸ਼ਾਪ ਚੈਲੇਂਜ |
| | |

## ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

AZD Template ਨੂੰ ਇੱਕ ਸਿੱਖਣ ਵਾਲੇ ਸੈਂਡਬਾਕਸ ਵਜੋਂ ਸੋਚੋ ਤਾਂ ਕਿ Microsoft Foundry 'ਤੇ ਐਂਡ-ਟੂ-ਐਂਡ ਵਿਕਾਸ ਲਈ ਵੱਖ-ਵੱਖ ਸਮਰੱਥਾਵਾਂ ਅਤੇ ਟੂਲਜ਼ ਦੀ ਪੜਚੋਲ ਕੀਤੀ ਜਾ ਸਕੇ। ਇਸ ਵਰਕਸ਼ਾਪ ਦੇ ਅਖੀਰ ਤੱਕ, ਤੁਹਾਨੂੰ ਇਸ ਸੰਦਰਭ ਵਿੱਚ ਵੱਖ-ਵੱਖ ਟੂਲਾਂ ਅਤੇ ਸੰਕਲਪਾਂ ਦੀ ਇਕ ਆਨੁਭਵਿਕ ਸਮਝ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ।

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | ਟੂਲ ਦੇ ਆਦੇਸ਼ ਅਤੇ ਵਰਕਫ਼ਲੋਜ਼ ਨੂੰ ਸਮਝੋ|
| **AZD Templates**| ਪ੍ਰੋਜੈਕਟ ਦੀ ਸੰਰਚਨਾ ਅਤੇ ਕਨਫਿਗ ਨੂੰ ਸਮਝੋ|
| **Azure AI Agent**| Microsoft Foundry ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਡਿਪਲੌਇ ਕਰੋ  |
| **Azure AI Search**| ਏਜੰਟਾਂ ਨਾਲ ਸੰਦਰਭ ਇੰਜੀਨਿਰਿੰਗ ਯੋਗ ਬਣਾਓ |
| **Observability**| ਟ੍ਰੇਸਿੰਗ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ |
| **Red Teaming**| ਵਿਰੋਧੀ ਟੈਸਟਿੰਗ ਅਤੇ ਰੋਕਥਾਮ ਬਾਰੇ ਪੜਚੋਲ ਕਰੋ |
| | |

## ਵਰਕਸ਼ਾਪ ਮੌਡੀਊਲਜ਼

ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ ਹੋ? ਵਰਕਸ਼ਾਪ ਮੌਡੀਊਲਜ਼ ਵਿੱਚ ਨੈਵੀਗੇਟ ਕਰੋ:

- [Module 1: Select AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Validate AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Deconstruct AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Configure AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: Customize AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: Teardown Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## ਕੋਈ ਸੁਝਾਅ?

ਇਸ ਰਿਪੋ 'ਤੇ ਇੱਕ ਇਸ਼ੂ ਪੋਸਟ ਕਰੋ (ਇਸਨੂੰ `Workshop` ਟੈਗ ਕਰੋ) ਜਾਂ ਸਾਡੇ ਨਾਲ [Discord](https://aka.ms/foundry/discord) 'ਤੇ ਜੁੜੋ ਅਤੇ ਸਾਡੇ `#get-help` ਚੈਨਲ 'ਤੇ ਪੋਸਟ ਕਰੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਸਪੱਸ਼ਟੀਕਰਨ:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਸਮਝਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਨਾਜ਼ੁਕ ਜਾਂ ਅਤਿ-ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->