# AZD ਫਾਰ AI ਡਿਵੈਲਪਰ ਵਰਕਸ਼ਾਪ

> ਇਸ ਦੀ ਜਾਂਚ `azd 1.25.6` ਦੇ ਖਿਲਾਫ਼ ਜੂਨ 2026 ਵਿੱਚ ਕੀਤੀ ਗਈ ਸੀ।

> [!IMPORTANT]  
> **ਇਹ ਵਰਕਸ਼ਾਪ ਇੱਕ ਵਰਕਸ਼ਾਪ ਗਾਈਡ ਨਾਲ ਸੈੱਟ ਕੀਤੀ ਗਈ ਹੈ, ਜਿਸ ਨੂੰ ਤੁਸੀਂ ਆਪਣੇ ਲੋਕਲ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਪ੍ਰੀਵਿਊ ਕਰ ਸਕਦੇ ਹੋ। ਸ਼ੁਰੂ ਕਰਨ ਲਈ, ਰਿਪੋ ਨੂੰ GitHub Codespaces, ਇੱਕ dev container, ਜਾਂ MkDocs ਇੰਸਟਾਲ ਕੀਤੇ ਹੋਏ ਲੋਕਲ ਕਲੋਨ ਵਿੱਚ ਖੋਲ੍ਹੋ—ਫਿਰ ਉਡੀਕ ਕਰੋ ਜਦੋਂ ਤੱਕ ਤੁਸੀਂ ਇੱਕ ਸਰਗਰਮ VS Code ਟਰਮੀਨਲ ਨਾ ਵੇਖੋ ਅਤੇ ਟਾਈਪ ਕਰੋ:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ਤੁਹਾਨੂੰ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਪ੍ਰੀਵਿਊ ਪੇਜ ਖੋਲ੍ਹਣ ਲਈ ਇਕ ਪਾਪ-ਅਪ ਡਾਇਲਾਗ ਦਿਖਾਈ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ।**

Welcome to the hands-on workshop for learning Azure Developer CLI (AZD) with a focus on AI application deployment. This workshop helps you gain an applied understanding of AZD templates in 3 steps:

1. **ਖੋਜ** - ਆਪਣੇ ਲਈ ਠੀਕ ਟੈਂਪਲੇਟ ਲੱਭੋ.
1. **ਡਿਪਲੋਏਮੈਂਟ** - ਡਿਪਲੋਏ ਕਰੋ ਅਤੇ ਪੁਸ਼ਟੀ ਕਰੋ ਕਿ ਇਹ ਕੰਮ ਕਰਦਾ ਹੈ
1. **ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ** - ਸੋਧੋ ਅਤੇ ਦੁਹਰਾਓ ਤਾਂ ਜੋ ਇਹ ਤੁਹਾਡਾ ਬਣ ਜਾਵੇ!

Over the course of this workshop, you will also be introduced to core developer tools and workflows, to help you streamline your end-to-end development journey.

| | | 
|:---|:---|
| **📚 ਕੋਰਸ ਹੋਮ**| [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../README.md)|
| **📖 ਦਸਤਾਵੇਜ਼** | [AI ਟੈਂਪਲੇਟਾਂ ਨਾਲ ਸ਼ੁਰੂਆਤ](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI ਟੈਂਪਲੇਟ** | [Microsoft Foundry ਟੈਂਪਲੇਟ](https://ai.azure.com/templates) |
|**🚀 ਅਗਲੇ ਕਦਮ** | [ਚੈਲੈਂਜ ਲਓ](#workshop-challenge) |
| | |

## ਵਰਕਸ਼ਾਪ ਓਵਰਵਿਊ

**ਸਮਾਂ-ਅਵਧੀ:** 3-4 ਘੰਟੇ  
**ਪੱਧਰ:** ਸ਼ੁਰੂਆਤੀ ਤੋਂ ਦਰਮਿਆਨਾ  
**ਪੂਰਵ-ਸ਼ਰਤਾਂ:** Azure, AI ਧਾਰਣਾਵਾਂ, VS Code ਅਤੇ ਕਮਾਂਡ-ਲਾਈਨ ਟੂਲਾਂ ਨਾਲ ਜਾਣ-ਪਛਾਣ।

ਇਹ ਇੱਕ ਹਥ-ਅਮਲੀ ਵਰਕਸ਼ਾਪ ਹੈ ਜਿੱਥੇ ਤੁਸੀਂ ਕਰਕੇ ਸਿਖਦੇ ਹੋ। ਇਕ ਵਾਰੀ ਤੁਸੀਂ ਅਭਿਆਸ ਪੂਰੇ ਕਰ ਲਏ, ਅਸੀਂ ਸਿਫਾਰਸ਼ ਕਰਦੇ ਹਾਂ ਕਿ AZD For Beginners ਕਰਿਕੁਲਮ ਦੀ ਸਮੀਖਿਆ ਕਰੋ ਤਾਂ ਜੋ ਤੁਸੀਂ ਸੁਰੱਖਿਆ ਅਤੇ ਉਤਪਾਦਕਤਾ ਦੀਆਂ ਸਭ ਤੋਂ ਵਧੀਆ ਪ੍ਰਥਾਵਾਂ ਵਿੱਚ ਆਪਣੀ ਸਿੱਖਿਆ ਜਾਰੀ ਰੱਖ ਸਕੋ।

| ਸਮਾਂ| ਮੋਡੀਊਲ  | ਉਦੇਸ਼ |
|:---|:---|:---|
| 15 ਮਿੰਟ | ਪਰਿਚਯ | ਮੰਚ ਸੈੱਟ ਕਰੋ, ਲਕ਼ਸ਼ਾਂ ਨੂੰ ਸਮਝੋ |
| 30 ਮਿੰਟ | AI ਟੈਂਪਲੇਟ ਚੁਣੋ | ਵਿਕਲਪਾਂ ਦੀ ਜਾਂਚ ਕਰੋ ਅਤੇ ਸਟਾਰਟਰ ਚੁਣੋ | 
| 30 ਮਿੰਟ | AI ਟੈਂਪਲੇਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ | ਡਿਫੌਲਟ ਹੱਲ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੋਏ ਕਰੋ |
| 30 ਮਿੰਟ | AI ਟੈਂਪਲੇਟ ਦੀ ਰਚਨਾ ਦੀ ਸਮਝ | ਢਾਂਚਾ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ |
| 30 ਮਿੰਟ | AI ਟੈਂਪਲੇਟ ਸੰਰਚਨਾ ਕਰੋ | ਉਪਲਬਧ ਫੀਚਰ ਸਰਗਰਮ ਕਰਕੇ ਅਜ਼ਮਾਓ |
| 30 ਮਿੰਟ | AI ਟੈਂਪਲੇਟ ਕਸਟਮਾਈਜ਼ ਕਰੋ | ਟੈਂਪਲੇਟ ਨੂੰ ਆਪਣੇ ਮੁਤਾਬਕ ਅਨੁਕੂਲ ਕਰੋ |
| 30 ਮਿੰਟ | ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਹਟਾਓ | ਰੀਸੋਰਸਾਂ ਦੀ ਸਫਾਈ ਅਤੇ ਰਿਹਾਈ |
| 15 ਮਿੰਟ | ਸੰਖੇਪ ਅਤੇ ਅਗਲੇ ਕਦਮ | ਸਿੱਖਣ ਸਰੋਤ, ਵਰਕਸ਼ਾਪ ਚੈਲੈਂਜ |
| | |

## ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

Think of the AZD Template as a learning sandbox to explore various capabilities and tools for end-to-end development on Microsoft Foundry. By the end of this workshop, you should have an intuitive sense for various tools and concepts in this context.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | ਟੂਲ ਦੇ ਕਮਾਂਡ ਅਤੇ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਸਮਝੋ|
| **AZD Templates**| ਪ੍ਰੋਜੈਕਟ ਸਿਰੰਜਾਮ ਅਤੇ ਕੰਫਿਗ ਨੂੰ ਸਮਝੋ|
| **Azure AI Agent**| Microsoft Foundry ਪ੍ਰੋਜੈਕਟ ਦੀ ਪ੍ਰੋਵੀਜ਼ਨ ਅਤੇ ਡਿਪਲੋਏਮੈਂਟ  |
| **Azure AI Search**| ਏਜੰਟਾਂ ਨਾਲ ਸੰਦਰਭ ਇੰਜੀਨੀਅਰਿੰਗ ਨੂੰ ਯੋਗ ਬਣਾਓ |
| **Observability**| ਟਰੇਸਿੰਗ, ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ ਦੀ ਜਾਂਚ ਕਰੋ |
| **Red Teaming**| ਵਿਰੋਧੀ ਟੈਸਟਿੰਗ ਅਤੇ ਰੋਕਥਾਮ ਦੀ ਜਾਂਚ ਕਰੋ |
| | |

## ਵਰਕਸ਼ਾਪ ਮੋਡੀਊਲ

ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ? ਹੇਠਾਂ ਦਿੱਤੇ ਵਰਕਸ਼ਾਪ ਮੋਡੀਊਲਾਂ ਵਿੱਚ ਜਾਓ:

- [ਮੋਡੀਊਲ 1: AI ਟੈਂਪਲੇਟ ਚੁਣੋ](instructions/1-Select-AI-Template.md)
- [ਮੋਡੀਊਲ 2: AI ਟੈਂਪਲੇਟ ਦੀ ਪੁਸ਼ਟੀ](instructions/2-Validate-AI-Template.md) 
- [ਮੋਡੀਊਲ 3: AI ਟੈਂਪਲੇਟ ਦੀ ਰਚਨਾ ਦੀ ਸਮਝ](instructions/3-Deconstruct-AI-Template.md)
- [ਮੋਡੀਊਲ 4: AI ਟੈਂਪਲੇਟ ਸੰਰਚਨਾ ਕਰੋ](instructions/4-Configure-AI-Template.md)
- [ਮੋਡੀਊਲ 5: AI ਟੈਂਪਲੇਟ ਕਸਟਮਾਈਜ਼ ਕਰੋ](instructions/5-Customize-AI-Template.md)
- [ਮੋਡੀਊਲ 6: ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਹਟਾਓ](instructions/6-Teardown-Infrastructure.md)
- [ਮੋਡੀਊਲ 7: ਸੰਖੇਪ ਅਤੇ ਅਗਲੇ ਕਦਮ](instructions/7-Wrap-up.md)

## ਫੀਡਬੈਕ?

ਇਸ ਰਿਪੋ 'ਤੇ ਇੱਕ issue ਪੋਸਟ ਕਰੋ (ਇਸ ਨੂੰ `Workshop` ਨਾਲ ਟੈਗ ਕਰੋ) ਜਾਂ ਸਾਡੇ [Discord](https://aka.ms/foundry/discord) ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ ਅਤੇ ਸਾਡੇ `#get-help` ਚੈਨਲ 'ਤੇ ਪੋਸਟ ਕਰੋ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->