# 1. ਟੈਮਪਲੇਟ ਚੁਣੋ

!!! tip "ਇਸ ਮੋਡੀਊਲ ਦੇ ਅੰਤ ਤੱਕ ਤੁਸੀਂ ਇਹ ਕਰ ਸਕੋਗੇ"

    - [ ] AZD ਟੈਮਪਲੇਟ ਕੀ ਹੁੰਦੇ ਹਨ, ਵਰਣਨ ਕਰੋ
    - [ ] AI ਲਈ AZD ਟੈਮਪਲੇਟ ਖੋਜੋ ਅਤੇ ਉਨਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ
    - [ ] AI Agents ਟੈਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
    - [ ] **Lab 1:** Codespaces ਜਾਂ dev container ਵਿੱਚ AZD Quickstart

---

## 1. ਇਕ ਨਿਰਮਾਤਾ ਦੀ ਤੁਲਨਾ

ਨਵਾਂ ਮਾਡਰਨ ਐਂਟਰਪ੍ਰਾਈਜ਼-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ _ਸ਼ੁਰੂ ਤੋਂ_ ਬਣਾਉਣਾ ਡਰਾਉਣਾ ਹੋ ਸਕਦਾ ਹੈ। ਇਹ ਕੁਝ ਇੰਝ ਹੈ ਜਿਵੇਂ ਤੁਸੀਂ ਆਪਣਾ ਨਵਾਂ ਘਰ ਆਪਣੇ ਆਪ, ਇੱਟ-ਇੱਟ ਕਰਕੇ ਬਣਾਉਂਦੇ ਹੋ। ਹਾਂ, ਇਹ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ! ਪਰ ਇਹ ਮਨਚਾਹਾ ਅੰਤਿਮ ਨਤੀਜਾ ਪ੍ਰਾਪਤ ਕਰਨ ਦਾ ਸਭ ਤੋਂ ਪ੍ਰਭਾਵਸ਼ালী ਤਰੀਕਾ ਨਹੀਂ ਹੈ!

ਇਸ ਦੀ ਬਜਾਏ, ਅਸੀਂ ਅਕਸਰ ਮੌਜੂਦਾ _ਡਿਜ਼ਾਈਨ ਬਲੂਪ੍ਰਿੰਟ_ ਨਾਲ ਸ਼ੁਰੂ ਕਰਦੇ ਹਾਂ, ਅਤੇ ਇੱਕ ਆਰਕੀਟੈਕਟ ਨਾਲ ਕੰਮ ਕਰਕੇ ਇਸਨੂੰ ਆਪਣੀਆਂ ਨਿੱਜੀ ਲੋੜਾਂ ਅਨੁਸਾਰ ਅਨੁਕੂਲ ਕਰਵਾਉਂਦੇ ਹਾਂ। ਅਤੇ ਇਹੀ ਤਰੀਕਾ ਹੈ ਜੋ ਅਸੀਂ ਬੁੱਧੀਮਾਨ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਣਾਉਂਦੇ ਸਮੇਂ ਅਪਨਾਉਣੇ ਚਾਹੀਦੇ ਹਾਂ। ਸਭ ਤੋਂ ਪਹਿਲਾਂ, ਇੱਕ ਵਧੀਆ ਡਿਜ਼ਾਈਨ ਆਰਕੀਟੈਕਚਰ ਲੱਭੋ ਜੋ ਤੁਹਾਡੇ ਸਮੱਸਿਆ ਖੇਤਰ ਲਈ موزੂਂ ਹੋਵੇ। ਫਿਰ ਇੱਕ ਸਾਲੂਸ਼ਨ ਆਰਕੀਟੈਕਟ ਨਾਲ ਕੰਮ ਕਰਕੇ ਆਪਣੇ ਵਿਸ਼ੇਸ਼ сценарਿਓ ਲਈ ਹੱਲ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਅਤੇ ਵਿਕਸਤ ਕਰੋ।

ਪਰ ਅਸੀ ਇਹ ਡਿਜ਼ਾਈਨ ਬਲੂਪ੍ਰਿੰਟ ਕਿੱਥੇ ਲੱਭਾਂਗੇ? ਅਤੇ ਅਸੀਂ ਐਡਾ ਆਰਕੀਟੈਕਟ ਕਿਵੇਂ ਲੱਭੀਏ ਜੋ ਸਾਨੂੰ ਦਿਖਾਉਣ ਲਈ ਤਿਆਰ ਹੋਵੇ ਕਿ ਇਹ ਬਲੂਪ੍ਰਿੰਟ ਕਿਵੇਂ ਕਸਟਮਾਈਜ਼ ਅਤੇ ਡਿਪਲੋਇ ਕੀਤੇ ਜਾਣਗੇ? ਇਸ ਵਰਕਸ਼ਾਪ ਵਿੱਚ, ਅਸੀਂ ਉਹਨਾਂ ਸਵਾਲਾਂ ਦੇ ਜਵਾਬ ਦਿੰਦੇ ਹਾਂ ਅਤੇ ਤੁਹਾਨੂੰ ਤਿੰਨ ਤਕਨਾਲੋਜੀਆਂ ਨਾਲ ਜਾਣੂ ਕਰਵਾਉਂਦੇ ਹਾਂ:

1. [Azure Developer CLI](https://aka.ms/azd) - ਇੱਕ ਓਪਨ-ਸੋਰਸ ਟੂਲ ਜੋ ਵਿਕਾਸਕਰਤਾ ਦੇ ਰਾਹ ਨੂੰ ਤੇਜ਼ ਕਰਦਾ ਹੈ, ਲੋਕਲ ਵਿਕਾਸ (build) ਤੋਂ ਕਲਾਉਡ ਡਿਪਲੋਇਮੈਂਟ (ship) ਤੱਕ।
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - ਮਿਆਰੀਕ੍ਰਿਤ ਓਪਨ-ਸੋਰਸ ਰਿਪੋਜ਼ਟਰੀਆਂ ਜੋ AI ਸਾਲੂਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨ ਲਈ ਸੈਂਪਲ ਕੋਡ, ਇੰਫ਼ਰਾਸਟਰੱਕਚਰ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਰੱਖਦੀਆਂ ਹਨ।
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure ਗਿਆਨ ਤੇ ਅਧਾਰਿਤ ਇੱਕ ਕੋਡਿੰਗ ਏਜੰਟ, ਜੋ ਸਾਨੂੰ ਕੋਡਬੇਸ ਵਿੱਚ ਰਾਹਦਾਰੀ ਕਰਨ ਅਤੇ ਕਦਮ-ਬਦਲ ਕਰਨ ਵਿੱਚ ਪ੍ਰਦਾਨ ਦੇ ਸਕਦਾ ਹੈ — ਕੁਦਰਤੀ ਭਾਸ਼ਾ ਦੀ ਵਰਤੋਂ ਨਾਲ।

ਇਹ ਟੂਲਾਂ ਨਾਲ, ਅਸੀਂ ਹੁਣ ਸਹੀ ਟੈਮਪਲੇਟ ਨੂੰ _ਖੋਜ_ ਸਕਦੇ ਹਾਂ, ਇਸਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਚਲਾਇਆ ਜਾਂਦਾ ਹੈ ਜਾਂ ਨਹੀਂ ਇਹ ਜाँचਣ ਲਈ _ਡਿਪਲੋਇ_ ਕਰ ਸਕਦੇ ਹਾਂ, ਅਤੇ ਆਪਣੇ ਵਿਸ਼ੇਸ਼ сценਾਰਿਓ ਲਈ ਇਸਨੂੰ _ਕਸਟਮਾਈਜ਼_ ਕਰ ਸਕਦੇ ਹਾਂ। ਆਓ ਡੂੰਘਾਈ ਵਿੱਚ ਜਾਈਏ ਅਤੇ ਇਹ ਸਿੱਖੀਏ ਕਿ ਇਹ ਕਿਵੇਂ ਕੰਮ ਕਰਦੇ ਹਨ।


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) ਇੱਕ ਓਪਨ-ਸੋਰਸ ਕਮਾਂਡ-ਲਾਈਨ ਟੂਲ ਹੈ ਜੋ ਤੁਹਾਡੇ ਕੋਡ-ਟੂ-ਕਲਾਉਡ ਯਾਤਰਾ ਨੂੰ ਤੇਜ਼ ਕਰ ਸਕਦਾ ਹੈ ਇਕ ਐਸੇ ਡੈਵਲਪਰ-ਫ੍ਰੈਂਡਲੀ ਕਮਾਂਡਾਂ ਦੇ ਸੈੱਟ ਨਾਲ ਜੋ ਤੁਹਾਡੇ IDE (development) ਅਤੇ CI/CD (devops) ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਇਕਸਾਰ ਕੰਮ ਕਰਦੀਆਂ ਹਨ।

`azd` ਨਾਲ, ਤੁਹਾਡੀ ਡਿਪਲੋਇਮੈਂਟ ਯਾਤਰਾ ਐਨਾ ਸਧਾਰਨ ਹੋ ਸਕਦੀ ਹੈ:

- `azd init` - ਮੌਜੂਦਾ AZD ਟੈਮਪਲੇਟ ਤੋਂ ਇੱਕ ਨਵਾਂ AI ਪਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰਦਾ ਹੈ।
- `azd up` - ਇੱਕ ਹੀ ਕਦਮ ਵਿੱਚ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਅਤੇ ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਡਿਪਲੋਇ ਕਰਦਾ ਹੈ।
- `azd monitor` - ਤੁਹਾਡੇ ਡਿਪਲੋਇ ਕੀਤੇ ਐਪ ਲਈ ਰੀਅਲ-ਟਾਈਮ ਮਾਨੀਟਰਨਿੰਗ ਅਤੇ ਡਾਇਗਨੋਸਟਿਕ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।
- `azd pipeline config` - Azure ਲਈ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਆਟੋਮੇਟ ਕਰਨ ਲਈ CI/CD ਪਾਈਪਲਾਈਨ ਸੈਟਅਪ ਕਰੋ।

**🎯 | EXERCISE**: <br/> ਆਪਣੇ ਮੌਜੂਦਾ ਵਰਕਸ਼ਾਪ ਵਾਤਾਵਰਣ ਵਿੱਚ ਹੁਣ `azd` ਕਮਾਂਡਲਾਈਨ ਟੂਲ ਦਾ ਅਨੁਸন্ধਾਨ ਕਰੋ। ਇਹ GitHub Codespaces, ਇੱਕ dev container, ਜਾਂ prerequisites ਸਥਾਪਿਤ ਇਕ ਲੋਕਲ ਕਲੋਨ ਹੋ ਸਕਦਾ ਹੈ। ਇਹ ਦੇਖਣ ਲਈ ਕਿ ਟੂਲ ਕੀ ਕਰ ਸਕਦਾ ਹੈ, ਇਹ ਕਮਾਂਡ ਟਾਈਪ ਕਰਕੇ ਸ਼ੁਰੂ ਕਰੋ:

```bash title="" linenums="0"
azd help
```

![ਪ੍ਰਵਾਹ](../../../../../translated_images/pa/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD ਟੈਮਪਲੇਟ

ਇਸ ਨੂੰ ਹਾਸਲ ਕਰਨ ਲਈ, `azd` ਨੂੰ ਜਾਣਨਾ ਜਰੂਰੀ ਹੈ ਕਿ ਕਿਹੜੀ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨੀ ਹੈ, ਕਿਹੜੀਆਂ ਕੰਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਜ਼ ਲਗੂ ਕਰਨੀਆਂ ਹਨ, ਅਤੇ ਕਿਹੜੀ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨੀ ਹੈ। ਇੱਥੇ [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) ਕੰਮ ਵਿੱਚ ਆਉਂਦੇ ਹਨ। 

AZD ਟੈਮਪਲੇਟ ਓਪਨ-ਸੋਰਸ ਰਿਪੋਜ਼ਟਰੀਆਂ ਹਨ ਜੋ ਸੈਂਪਲ ਕੋਡ ਨੂੰ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਲੋੜੀਂਦੀ ਕੰਫਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਨਾਲ ਜੋੜਦੀਆਂ ਹਨ।
Infrastructure-as-Code (IaC) ਪੱਧਤੀ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਇਹ ਟੈਮਪਲੇਟ ਰਿਸੋਰਸ ਪਰਿਭਾਸ਼ਾਵਾਂ ਅਤੇ ਕੰਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਜ਼ ਨੂੰ ਵਰਜ਼ਨ-ਕੰਟਰੋਲ ਦੇ ਅਧੀਨ ਰੱਖਣ ਦੀ ਆਗਿਆ ਦਿੰਦੇ ਹਨ (ਬਿਲਕੁਲ ਐਪ ਸੋర్స్ ਕੋਡ ਵਾਂਗ) — ਜਿਸ ਨਾਲ ਉਸ ਪ੍ਰੋਜੈਕਟ ਦੇ ਉਪਭੋਗਤਿਆਂ ਵਿੱਚ ਦੁਹਰਾਏ ਜਾ ਸਕਣ ਵਾਲੇ ਅਤੇ ਸਥਿਰ ਵਾਰਕਫਲੋ ਬਣਦੇ ਹਨ।

ਜਦੋਂ ਤੁਸੀਂ ਆਪਣੇ ਸਕੇਨਾਰੀਓ ਲਈ AZD ਟੈਮਪਲੇਟ ਬਣਾਉਂਦੇ ਜਾਂ ਦੁਬਾਰਾ ਵਰਤਦੇ ਹੋ, ਤਾਂ ਇਹ ਸਵਾਲ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ:

1. What are you building? → ਕੀ ਕੋਈ ਐਸਾ ਟੈਮਪਲੇਟ ਹੈ ਜਿਸ ਵਿੱਚ ਉਸ ਸਕੇਨਾਰੀਓ ਲਈ ਸ਼ੁਰੂਆਤੀ ਕੋਡ ਹੋਵੇ?
1. How is your solution architected? → ਕੀ ਕੋਈ ਟੈਮਪਲੇਟ ਹੈ ਜਿਸ ਵਿੱਚ ਲੋੜੀਂਦੇ ਰਿਸੋਰਸ ਮੌਜੂਦ ਹਨ?
1. How is your solution deployed? → ਸੋਚੋ `azd deploy` ਨਾਲ pre/post-processing hooks!
1. How can you optimize it further? → ਸੋਚੋ ਬਿਲਟ-ਇਨ ਮਾਨੀਟਰਨਿੰਗ ਅਤੇ ਆਟੋਮੇਸ਼ਨ ਪਾਈਪਲਾਈਨਾਂ!

**🎯 | EXERCISE**: <br/> 
Visit the [Awesome AZD](https://azure.github.io/awesome-azd/) ਗੈਲਰੀ ਅਤੇ ਫਿਲਟਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਵਰਤਮਾਨ 250+ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਖੋਜੋ। ਦੇਖੋ ਕੀ ਤੁਹਾਡੇ ਲਈ ਕੋਈ ਐਸਾ ਟੈਮਪਲੇਟ ਮਿਲਦਾ ਹੈ ਜੋ _ਤੁਹਾਡੇ_ ਸਕੇਨਾਰੀਓ ਦੀਆਂ ਲੋੜਾਂ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੋਵੇ।

![ਕੋਡ](../../../../../translated_images/pa/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI ਐਪ ਟੈਮਪਲੇਟ

AI-ਚਲਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ, Microsoft ਵਿਸ਼ੇਸ਼ ਟੈਮਪਲੇਟ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ ਜੋ **Microsoft Foundry** ਅਤੇ **Foundry Agents** ਨੂੰ ਫੀਚਰ ਕਰਦੇ ਹਨ। ਇਹ ਟੈਮਪਲੇਟ ਤੁਹਾਡੇ ਲਈ ਸਮਰੱਥ, ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਐਪਲੀਕੇਸ਼ਨਾਂ ਬਣਾਉਣ ਦੀ ਰਫ਼ਤਾਰ ਵਧਾਉਂਦੇ ਹਨ।

### Microsoft Foundry & Foundry Agents Templates

ਤਹਿਤ ਇੱਕ ਟੈਮਪਲੇਟ ਚੁਣੋ ਤਾਂ ਜੋ ਤੁਸੀਂ ਇਸਨੂੰ ਡਿਪਲੋਇ ਕਰ ਸਕੋ। ਹਰੇਕ ਟੈਮਪਲੇਟ [Awesome AZD](https://azure.github.io/awesome-azd/) 'ਤੇ ਉਪਲਬਧ ਹੈ ਅਤੇ ਇੱਕ ਹੀ ਕਮਾਂਡ ਨਾਲ ਅਰੰਭ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ।

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry ਦੀ ਵਰਤੋਂ ਕਰਕੇ Retrieval Augmented Generation ਵਾਲੀ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Foundry Agents ਨਾਲ ਸਵੈਚਲਿਤ ਕਾਰਜ ਨਿਰਵਾਹ ਲਈ AI ਏਜੰਟ ਬਣਾਉਣ ਦਾ ਸਟਾਰਟਰ | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | ਜਟਿਲ ਵਰਕਫਲੋ ਲਈ ਕਈ Foundry Agents ਦਾ ਤਾਲਮੇਲ | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry ਮਾਡਲਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਦਸਤਾਵੇਜ਼ਾਂ ਨੂੰ ਨਿਕਾਲੋ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਸਮਰੱਥ ਚੈਟਬੋਟ ਬਣਾਓ | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry ਰਾਹੀਂ DALL-E ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਚਿੱਤਰ ਤਿਆਰ ਕਰੋ | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents ਨਾਲ Semantic Kernel ਵਰਤ ਕੇ AI ਏਜੰਟ | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen ਫ੍ਰੇਮਵਰਕ ਵਰਤ ਕੇ ਬਹੁ-ਏਜੰਟ ਸਿਸਟਮ | `azd init -t azure-samples/autogen-multi-agent` |

### ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

1. **ਟੈਮਪਲੇਟ ਬਰਾਉਜ਼ ਕਰੋ**: [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) 'ਤੇ ਜਾ ਕੇ `AI`, `Agents`, ਜਾਂ `Microsoft Foundry` ਨਾਲ ਫਿਲਟਰ ਕਰੋ
2. **ਆਪਣਾ ਟੈਮਪਲੇਟ ਚੁਣੋ**: ਉਹ ਚੁਣੋ ਜੋ ਤੁਹਾਡੇ ਉਪਯੋਗ ਕੇਸ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੋਵੇ
3. **ਸ਼ੁਰੂ ਕਰੋ**: ਆਪਣੇ ਚੁਣੇ ਹੋਏ ਟੈਮਪਲੇਟ ਲਈ `azd init` ਕਮਾਂਡ ਚਲਾਓ
4. **ਡਿਪਲੋਇ ਕਰੋ**: ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਡਿਪਲੋਇ ਕਰਨ ਲਈ `azd up` ਚਲਾਓ

**🎯 | EXERCISE**: <br/>
ਤੁਹਾਡੇ ਸਕੇਨਾਰੀਓ ਦੇ ਆਧਾਰ 'ਤੇ ਉਪਰੋਕਤ ਟੈਮਪਲੇਟਾਂ ਵਿੱਚੋਂ ਇੱਕ ਚੁਣੋ:

- **ਚੈਟਬੋਟ ਬਣਾ ਰਹੇ ਹੋ?** → ਸ਼ੁਰੂ ਕਰੋ **AI Chat with RAG** ਜਾਂ **Conversational AI Bot**
- **ਸਵੈਚਲਿਤ ਏਜੰਟਾਂ ਦੀ ਜ਼ਰੂਰਤ ਹੈ?** → ਕੋਸ਼ਿਸ਼ ਕਰੋ **Foundry Agent Service Starter** ਜਾਂ **Multi-Agent Orchestration**
- **ਦਸਤਾਵੇਜ਼ ਪ੍ਰਕਿਰਿਆ ਕਰ ਰਹੇ ਹੋ?** → ਵਰਤੋ **AI Document Intelligence**
- **AI ਕੋਡਿੰਗ ਸਹਾਇਤਾ ਚਾਹੁੰਦੇ ਹੋ?** → ਖੋਜੋ **Semantic Kernel Agent** ਜਾਂ **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "ਹੋਰ ਟੈਮਪਲੇਟਾਂ ਦੀ ਖੋਜ"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਰਨ**:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਚਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਪਜਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->