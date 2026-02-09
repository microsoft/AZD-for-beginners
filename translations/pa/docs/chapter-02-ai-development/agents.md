# Azure Developer CLI ਨਾਲ AI ਏਜੰਟ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾਂ**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ਅਗਲਾ**: [Production AI Practices](production-ai-practices.md)
- **🚀 ਐਡਵਾਂਸਡ**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## ਪਰਿਚਯ

AI ਏਜੰਟ ਸੁਤੰਤਰ ਪ੍ਰੋਗਰਾਮ ਹੁੰਦੇ ਹਨ ਜੋ ਆਪਣੇ ਵਾਤਾਵਰਣ ਨੂੰ ਮਹਿਸੂਸ ਕਰ ਸਕਦੇ ਹਨ, ਫੈਸਲੇ ਲੈ ਸਕਦੇ ਹਨ ਅਤੇ ਨਿਰਦਿਸ਼ਟ ਲਕੜਾਂ ਨੂੰ ਹਾਸਲ ਕਰਨ ਲਈ ਕਾਰਵਾਈ ਕਰ ਸਕਦੇ ਹਨ। ਆਮ ਚੈਟਬੋਟਾਂ ਜੋ ਪ੍ਰਾਂਪਟਾਂ ਦਾ ਜਵਾਬ ਦਿੰਦੇ ਹਨ ਦੇ ਮੁਕਾਬਲੇ, ਏਜੰਟ:

- **ਟੂਲ ਵਰਤਣ** - APIs ਕਾਲ ਕਰ ਸਕਦੇ ਹਨ, ਡੇਟਾਬੇਸ ਖੋਜ ਸਕਦੇ ਹਨ, ਕੋਡ ਚਲਾ ਸਕਦੇ ਹਨ
- **ਯੋਜਨਾ ਅਤੇ ਤਰਕ** - ਜਟਿਲ ਕਾਰਜਾਂ ਨੂੰ ਕਦਮਾਂ ਵਿੱਚ ਵੰਡਦੇ ਹਨ
- **ਸੰਦਰਭ ਤੋਂ ਸਿੱਖਦੇ ਹਨ** - ਯਾਦਗਾਰੀ ਰੱਖਦੇ ਹਨ ਅਤੇ ਵਰਤਾਰਾ ਅਨੁਕੂਲ ਕਰਦੇ ਹਨ
- **ਸਹਿਯੋਗ ਕਰਦੇ ਹਨ** - ਹੋਰ ਏਜੰਟਾਂ ਨਾਲ (ਮਲਟੀ-ਏਜੰਟ ਸਿਸਟਮ) ਕੰਮ ਕਰ ਸਕਦੇ ਹਨ

ਇਹ ਗਾਈਡ ਤੁਹਾਨੂੰ ਦਿਖਾਏਗੀ ਕਿ Azure Developer CLI (azd) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਿਸ ਤਰ੍ਹਾਂ AI ਏਜੰਟ Azure 'ਤੇ ਡਿਪਲੋਇ/ਤੈਨਾਤ ਕਰਨੇ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੇ ਬਾਅਦ, ਤੁਸੀਂ:
- ਸਮਝੋਂਗੇ ਕਿ AI ਏਜੰਟ ਕੀ ਹਨ ਅਤੇ ਇਹ ਚੈਟਬੋਟਾਂ ਤੋਂ ਕਿਵੇਂ ਵੱਖਰੇ ਹਨ
- AZD ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਪ੍ਰੀ-ਬਿਲਟ AI ਏਜੰਟ ਟੈਮਪਲੇਟ ਤੈਨਾਤ ਕਰਨਗੇ
- ਕਸਟਮ ਏਜੰਟਾਂ ਲਈ Foundry Agents ਸੰਰਚਨਾConfigure করবেন
- ਬੁਨਿਆਦੀ ਏਜੰਟ ਪੈਟਰਨਾਂ (ਟੂਲ ਵਰਤੋਂ, RAG, ਮਲਟੀ-ਏਜੰਟ) ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਤੈਨਾਤ ਕੀਤੇ ਏਜੰਟਾਂ ਦੀ ਨਿਗਰਾਨੀ ਅਤੇ ਡੀਬੱਗ ਕਰਨਾ ਸਿਖੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਇੱਕ ਹੀ ਕਮਾਂਡ ਨਾਲ Azure 'ਤੇ AI ਏਜੰਟ ਐਪਲਿਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ/ਡਿਪਲੋਇ ਕਰਨ ਲਈ
- ਏਜੰਟ ਟੂਲਾਂ ਅਤੇ ਸਮਰੱਥਾਵਾਂ ਦੀ ਸੰਰਚਨਾ ਕਰਨ ਲਈ
- ਏਜੰਟਾਂ ਨਾਲ retrieval-augmented generation (RAG) ਲਾਗੂ ਕਰਨ ਲਈ
- ਜਟਿਲ ਵర్కਫਲੋਜ਼ ਲਈ ਮਲਟੀ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ ਕਰਨ ਲਈ
- ਆਮ ਏਜੰਟ ਤੈਨਾਤ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰਨ ਲਈ

---

## 🤖 ਏਜੰਟ ਇੱਕ ਚੈਟਬੋਟ ਤੋਂ ਕਿਵੇਂ ਵੱਖਰਾ ਹੈ?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **ਵਰਤਾਰਾ** | ਪ੍ਰਾਂਪਟਾਂ ਦਾ ਜਵਾਬ ਦਿੰਦਾ ਹੈ | ਸੁਤੰਤਰ ਕਾਰਵਾਈ ਕਰਦਾ ਹੈ |
| **ਟੂਲ** | ਕੋਈ ਨਹੀਂ | APIs ਕਾਲ ਕਰ ਸਕਦਾ ਹੈ, ਖੋਜ ਸਕਦਾ ਹੈ, ਕੋਡ ਚਲਾ ਸਕਦਾ ਹੈ |
| **ਯਾਦ** | ਕੇਵਲ ਸੈਸ਼ਨ-ਆਧਾਰਤ | ਸੈਸ਼ਨਾਂ ਵਿੱਚ ਲਗਾਤਾਰ ਯਾਦਗਾਰੀ |
| **ਯੋਜਨਾ ਬਣਾਉਣਾ** | ਇਕ ਜਵਾਬ | ਬਹੁ-ਕਦਮੀ ਤਰਕ |
| **ਸਹਿਯੋਗ** | ਇੱਕ ਇਕਾਈ | ਹੋਰ ਏਜੰਟਾਂ ਨਾਲ ਕੰਮ ਕਰ ਸਕਦਾ ਹੈ |

### ਸਧਾਰਣ ਤੁਲਨਾ

- **ਚੈਟਬੋਟ** = ਜਾਣਕਾਰੀ ਡੈਸਕ 'ਤੇ ਇੱਕ ਮਦਦਗਾਰ ਵਿਅਕਤੀ ਜੋ ਸਵਾਲਾਂ ਦੇ ਜਵਾਬ ਦਿੰਦਾ ਹੈ
- **AI ਏਜੰਟ** = ਇੱਕ ਨਿੱਜੀ ਮਦਦਗਾਰ ਜੋ ਫੋਨ ਕਾਲ ਕਰ ਸਕਦਾ ਹੈ, ਅਪਾਇੰਟਮੈਂਟ ਬੁੱਕ ਕਰ ਸਕਦਾ ਹੈ ਅਤੇ ਤੁਹਾਡੇ ਲਈ ਕਾਰਜ ਮੁਕੰਮਲ ਕਰ ਸਕਦਾ ਹੈ

---

## 🚀 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ: ਆਪਣਾ ਪਹਿਲਾ ਏਜੰਟ ਤੈਨਾਤ ਕਰੋ

### ਵਿਕਲਪ 1: Foundry Agents ਟੈਮਪਲੇਟ (ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ)

```bash
# AI ਏਜੰਟਾਂ ਦਾ ਟੈਮਪਲੇਟ ਸ਼ੁਰੂ ਕਰੋ
azd init --template get-started-with-ai-agents

# Azure 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up
```

**ਕੀ ਤੈਨਾਤ ਹੁੰਦਾ ਹੈ:**  
- ✅ Foundry Agents  
- ✅ Azure OpenAI (GPT-4o)  
- ✅ Azure AI Search (RAG ਲਈ)  
- ✅ Azure Container Apps (ਵੈੱਬ ਇੰਟਰਫੇਸ)  
- ✅ Application Insights (ਮਾਨੀਟਰਿੰਗ)

**ਸਮਾਂ:** ~15-20 ਮਿੰਟ  
**ਲਾਗਤ:** ~$100-150/ਮਹੀਨਾ (ਡਿਵੈਲਪਮੈਂਟ)

### ਵਿਕਲਪ 2: OpenAI Agent with Prompty

```bash
# Prompty-ਆਧਾਰਿਤ ਏਜੰਟ ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
azd init --template agent-openai-python-prompty

# Azure ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up
```

**ਕੀ ਤੈਨਾਤ ਹੁੰਦਾ ਹੈ:**  
- ✅ Azure Functions (ਸਰਵਰਲੇਸ ਏਜੰਟ ਐਕਸਿਕਿਊਸ਼ਨ)  
- ✅ Azure OpenAI  
- ✅ Prompty ਸੰਰਚਨਾ ਫਾਇਲਾਂ  
- ✅ ਨਮੂਨਾ ਏਜੰਟ ਇੰਪਲੀਮੇਨਟੇਸ਼ਨ

**ਸਮਾਂ:** ~10-15 ਮਿੰਟ  
**ਲਾਗਤ:** ~$50-100/ਮਹੀਨਾ (ਡਿਵੈਲਪਮੈਂਟ)

### ਵਿਕਲਪ 3: RAG ਚੈਟ ਏਜੰਟ

```bash
# RAG ਚੈਟ ਟੈਂਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
azd init --template azure-search-openai-demo

# Azure ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up
```

**ਕੀ ਤੈਨਾਤ ਹੁੰਦਾ ਹੈ:**  
- ✅ Azure OpenAI  
- ✅ ਨਮੂਨਾ ਡੇਟਾ ਨਾਲ Azure AI Search  
- ✅ ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਪਾਇਪਲਾਈਨ  
- ✅ ਹਵਾਲਿਆਂ ਦੇ ਨਾਲ ਚੈਟ ਇੰਟਰਫੇਸ

**ਸਮਾਂ:** ~15-25 ਮਿੰਟ  
**ਲਾਗਤ:** ~$80-150/ਮਹੀਨਾ (ਡਿਵੈਲਪਮੈਂਟ)

---

## 🏗️ ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: ਟੂਲ-ਸਹਿਤ ਇਕਲ ਏਜੰਟ

ਸਭ ਤੋਂ ਸਧਾਰਣ ਏਜੰਟ ਪੈਟਰਨ - ਇੱਕ ਏਜੰਟ ਜੋ ਕਈ ਟੂਲ ਵਰਤ ਸਕਦਾ ਹੈ।

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**ਉਤਰਦਾਇਤ ਲਈ ਵਧੀਆ:**  
- ਗਾਹਕ ਸਹਾਇਤਾ ਬੋਟ  
- ਰਿਸਰਚ ਸਹਾਇਕ  
- ਡੇਟਾ ਵਿਸ਼ਲੇਸ਼ਣ ਏਜੰਟ

**AZD ਟੈਮਪਲੇਟ:** `azure-search-openai-demo`

### ਪੈਟਰਨ 2: RAG ਏਜੰਟ (Retrieval-Augmented Generation)

ਇੱਕ ਏਜੰਟ ਜੋ ਜਵਾਬ ਬਣਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਸੰਬੰਧਿਤ ਦਸਤਾਵੇਜ਼ਾਂ ਨੂੰ ਰੀਟਰੀਵ ਕਰਦਾ ਹੈ।

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**ਉਤਰਦਾਇਤ ਲਈ ਵਧੀਆ:**  
- ਐਂਟਰਪ੍ਰਾਈਜ਼ ਨੋਲੇਜ ਬੇਸ  
- ਦਸਤਾਵੇਜ਼ Q&A ਸਿਸਟਮ  
- ਅਨੁਕੂਲਤਾ ਅਤੇ ਕਾਨੂੰਨੀ ਰਿਸਰਚ

**AZD ਟੈਮਪਲੇਟ:** `azure-search-openai-demo`

### ਪੈਟਰਨ 3: ਮਲਟੀ-ਏਜੰਟ ਸਿਸਟਮ

ਕਈ ਵਿਸ਼ੇਸ਼ ਏਜੰਟ ਜੋ ਜਟਿਲ ਕਾਰਜਾਂ 'ਤੇ ਇਕੱਠੇ ਕੰਮ ਕਰਦੇ ਹਨ।

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**ਉਤਰਦਾਇਤ ਲਈ ਵਧੀਆ:**  
- ਜਟਿਲ ਸਮੱਗਰੀ ਤਿਆਰ ਕਰਨ ਲਈ  
- ਬਹੁ-ਕਦਮੀ ਵਰਕਫਲੋਜ਼  
- ਵੱਖ-ਵੱਖ ਮਾਹਰਤਾ ਵਾਲੇ ਕੰਮ

**ਹੋਰ ਜਾਣੋ:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ ਏਜੰਟ ਟੂਲਾਂ ਦੀ ਸੰਰਚਨਾ

ਏਜੰਟ ਐਨ੍ਹਾ ਸਮਰੱਥ ਹੁੰਦੇ ਹਨ ਜਦੋਂ ਉਹ ਟੂਲ ਵਰਤ ਸਕਦੇ ਹਨ। ਹੇਠਾਂ ਆਮ ਟੂਲਾਂ ਨੂੰ ਕਿਵੇਂ ਸੰਰਚਿਤ ਕਰਨਾ ਹੈ:

### Foundry Agents ਵਿੱਚ ਟੂਲ ਸੰਰਚਨਾ

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# ਕਸਟਮ ਟੂਲ ਪਰਿਭਾਸ਼ਿਤ ਕਰੋ
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# ਟੂਲਾਂ ਨਾਲ ਏਜੰਟ ਬਣਾਓ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### ਵਾਤਾਵਰਣ ਸੰਰਚਨਾ

```bash
# ਏਜੰਟ-ਨਿਰਧਾਰਿਤ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# ਅਪਡੇਟ ਕੀਤੀ ਗਈ ਸੰਰਚਨਾ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

---

## 📊 ਏਜੰਟਾਂ ਦੀ ਨਿਗਰਾਨੀ

### Application Insights ਇੰਟੀਗ੍ਰੇਸ਼ਨ

ਸਭ AZD ਏਜੰਟ ਟੈਮਪਲੇਟ Application Insights ਨੂੰ ਨਿਗਰਾਨੀ ਲਈ ਸ਼ਾਮਲ ਕਰਦੇ ਹਨ:

```bash
# ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਖੋਲ੍ਹੋ
azd monitor --overview

# ਲਾਈਵ ਲਾਗਾਂ ਵੇਖੋ
azd monitor --logs

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

### ਟ੍ਰੈਕ ਕਰਨ ਯੋਗ ਮੁੱਖ ਮੈਟਰਿਕਸ

| Metric | Description | Target |
|--------|-------------|--------|
| ਪ੍ਰਤਿਕ੍ਰਿਆ ਦੇਰ (Response Latency) | ਜਵਾਬ ਬਣਾਉਣ ਦਾ ਸਮਾਂ | < 5 ਸਕਿੰਟ |
| ਟੋਕਨ ਉਪਯੋਗ (Token Usage) | ਪ੍ਰਤੀ ਰਹਿਸ਼ਟ ਟੋਕਨ | ਲਾਗਤ ਲਈ ਨਿਗਰਾਨੀ ਕਰੋ |
| ਟੂਲ ਕਾਲ ਸਫਲਤਾ ਦਰ | % ਕਾਮਯਾਬ ਟੂਲ ਐਕਜ਼ਿਕਿਊਸ਼ਨ | > 95% |
| ਐਰਰ ਦਰ | ਫੇਲਡ ਏਜੰਟ ਅਨੁਰੋਧ | < 1% |
| ਉਪਭੋਗਤਾ ਸੰਤੁਸ਼ਟੀ | ਫੀਡਬੈਕ ਸਕੋਰ | > 4.0/5.0 |

### ਏਜੰਟਾਂ ਲਈ ਕਸਟਮ ਲੌਗਿੰਗ

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 ਲਾਗਤ ਸੰਬੰਧੀ ਵਿਚਾਰ

### ਪੈਟਰਨ ਅਨੁਸਾਰ ਅਨੁਮਾਨਤ ਮਾਸਿਕ ਲਾਗਤ

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### ਲਾਗਤ ਘਟਾਉਣ ਦੇ ਸੁਝਾਅ

1. **ਸਧਾਰਨ ਕਾਰਜਾਂ ਲਈ GPT-4o-mini ਵਰਤੋ**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **ਦੋਹਰਾਏ ਪੁੱਛਗਿੱਛਾਂ ਲਈ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **ਟੋਕਨ ਸੀਮਾਵਾਂ ਸੈਟ ਕਰੋ**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # ਜਵਾਬ ਦੀ ਲੰਬਾਈ ਸੀਮਿਤ ਕਰੋ
   )
   ```

4. **ਜਦੋਂ ਵਰਤੋਂ ਵਿੱਚ ਨਾ ਹੋਵੇ ਤਾਂ ਸਕੇਲ-ਟੂ-ਜ਼ੀਰੋ ਕਰੋ**
   ```bash
   # Container Apps ਆਪਣੇ ਆਪ ਜ਼ੀਰੋ ਤੱਕ ਸਕੇਲ ਹੋ ਜਾਂਦੇ ਹਨ
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 ਏਜੰਟਾਂ ਦੀ ਤਰੁੱਟੀ-ਨਿਵਾਰਨ

### ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਸਮਾਧਾਨ

<details>
<summary><strong>❌ ਏਜੰਟ ਟੂਲ ਕਾਲਾਂ ਦਾ ਜਵਾਬ ਨਹੀਂ ਦੇ ਰਿਹਾ</strong></summary>

```bash
# ਜਾਂਚੋ ਕਿ ਟੂਲ ਠੀਕ ਤਰੀਕੇ ਨਾਲ ਰਜਿਸਟਰ ਕੀਤੇ ਗਏ ਹਨ
azd show

# OpenAI ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# ਏਜੰਟ ਲੌਗਜ਼ ਦੀ ਜਾਂਚ ਕਰੋ
azd monitor --logs
```

**ਆਮ ਕਾਰਨ:**  
- ਟੂਲ ਫੰਕਸ਼ਨ ਸਿਗਨੇਚਰ ਮਿਲ ਨਹੀਂ ਰਿਹਾ  
- ਲੋੜੀਂਦੇ ਅਨੁਮਤੀਆਂ ਗ਼ੈਰ-ਮੌਜੂਦ  
- API ਏਂਡਪੋਇੰਟ ਐਕਸੈਸ ਕਰਨ ਯੋਗ ਨਹੀਂ
</details>

<details>
<summary><strong>❌ ਏਜੰਟ ਪ੍ਰਤਿਕ੍ਰਿਆਵਾਂ ਵਿੱਚ ਉੱਚੀ ਦੇਰ</strong></summary>

```bash
# ਬੋਤਲਨੇਕਾਂ ਲਈ Application Insights ਦੀ ਜਾਂਚ ਕਰੋ
azd monitor --live

# ਇੱਕ ਤੇਜ਼ ਮਾਡਲ ਵਰਤਣ ਬਾਰੇ ਸੋਚੋ
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਸੁਝਾਅ:**  
- ਸਟ੍ਰੀਮਿੰਗ ਪ੍ਰਤਿਕ੍ਰਿਆਵਾਂ ਵਰਤੋਂ  
- ਪ੍ਰਤਿਕ੍ਰਿਆ ਕੈਸ਼ਿੰਗ ਲਾਗੂ ਕਰੋ  
- ਸੰਦਰਭ ਵਿੰਡੋ ਸਾਈਜ਼ ਘਟਾਓ
</details>

<details>
<summary><strong>❌ ਏਜੰਟ ਗਲਤ ਜਾਂ ਹਾਲੂਸੀਨਟ ਕੀਤੀ ਜਾਣਕਾਰੀ ਵਾਪਸ ਕਰ ਰਿਹਾ ਹੈ</strong></summary>

```python
# ਵਧੀਆ ਸਿਸਟਮ ਪ੍ਰਾਂਪਟਸ ਨਾਲ ਸੁਧਾਰੋ
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# ਗਰਾਊਂਡਿੰਗ ਲਈ ਰੀਟ੍ਰੀਵਲ ਸ਼ਾਮਲ ਕਰੋ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # ਜਵਾਬਾਂ ਨੂੰ ਦਸਤਾਵੇਜ਼ਾਂ ਵਿੱਚ ਅਧਾਰਤ ਕਰੋ
)
```
</details>

<details>
<summary><strong>❌ ਟੋਕਨ ਸੀਮਾ ਪਾਰ ਹੋਣ ਦੇ ਘਲਤੀਆਂ</strong></summary>

```python
# ਸੰਦਰਭ ਵਿੰਡੋ ਪ੍ਰਬੰਧਨ ਲਾਗੂ ਕਰੋ
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # ਮੋਟਾ ਅੰਦਾਜ਼ਾ
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 ਹੈਂਡਸ-ਆਨ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇਕ ਬੁਨਿਆਦੀ ਏਜੰਟ ਤੈਨਾਤ ਕਰੋ (20 ਮਿੰਟ)

**ਲਕ਼ਸ਼:** AZD ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਪਣਾ ਪਹਿਲਾ AI ਏਜੰਟ ਤੈਨਾਤ ਕਰੋ

```bash
# ਕਦਮ 1: ਟੈਮਪਲੇਟ ਨੂੰ ਆਰੰਭ ਕਰੋ
azd init --template get-started-with-ai-agents

# ਕਦਮ 2: Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ
azd auth login

# ਕਦਮ 3: ਤੈਨਾਤ ਕਰੋ
azd up

# ਕਦਮ 4: ਏਜੰਟ ਦੀ ਜਾਂਚ ਕਰੋ
# ਆਉਟਪੁੱਟ ਵਿੱਚ ਦਿਖਾਇਆ ਗਿਆ URL ਖੋਲ੍ਹੋ

# ਕਦਮ 5: ਸਾਫ਼-ਸਫਾਈ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**  
- [ ] ਏਜੰਟ ਸਵਾਲਾਂ ਦਾ ਜਵਾਬ ਦਿੰਦਾ ਹੈ  
- [ ] ਮਾਨੀਟਰਿੰਗ ਡੈਸ਼ਬੋਰਡ ਤੱਕ ਪਹੁੰਚ ਹੋ ਸਕਦੀ ਹੈ  
- [ ] ਸਰੋਤ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਹੋ ਗਏ

### ਅਭਿਆਸ 2: ਇੱਕ ਕਸਟਮ ਟੂਲ ਸ਼ਾਮਲ ਕਰੋ (30 ਮਿੰਟ)

**ਲਕ਼ਸ਼:** ਏਜੰਟ ਵਿੱਚ ਇੱਕ ਕਸਟਮ ਟੂਲ ਜੋੜੋ

1. ਏਜੰਟ ਟੈਮਪਲੇਟ ਤੈਨਾਤ ਕਰੋ  
2. ਨਵਾਂ ਟੂਲ ਫੰਕਸ਼ਨ ਬਣਾਓ:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # ਮੌਸਮ ਸੇਵਾ ਲਈ API ਕਾਲ
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. ਟੂਲ ਨੂੰ ਏਜੰਟ ਨਾਲ ਰਜਿਸਟਰ ਕਰੋ  
4. ਟੈਸਟ ਕਰੋ ਕਿ ਏਜੰਟ ਨਵਾਂ ਟੂਲ ਵਰਤਦਾ ਹੈ

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**  
- [ ] ਏਜੰਟ ਮੌਸਮ ਸੰਬੰਧੀ ਪ੍ਰਸ਼ਨਾਂ ਨੂੰ ਪਛਾਣਦਾ ਹੈ  
- [ ] ਟੂਲ ਸਹੀ ਤਰ੍ਹਾਂ ਕਾਲ ਹੁੰਦਾ ਹੈ  
- [ ] ਪ੍ਰਤਿਕ੍ਰਿਆ ਵਿੱਚ ਮੌਸਮ ਜਾਣਕਾਰੀ ਸ਼ਾਮਲ ਹੈ

### ਅਭਿਆਸ 3: ਇੱਕ RAG ਏਜੰਟ ਬਣਾਓ (45 ਮਿੰਟ)

**ਲਕ਼ਸ਼:** ਇੱਕ ਐਸਾ ਏਜੰਟ ਬਣਾਓ ਜੋ ਤੁਹਾਡੇ ਦਸਤਾਵੇਜ਼ਾਂ ਤੋਂ ਸਵਾਲਾਂ ਦੇ ਜਵਾਬ ਦੇਵੇ

```bash
# RAG ਟੈਂਪਲੇਟ ਤੈਨਾਤ ਕਰੋ
azd init --template azure-search-openai-demo
azd up

# ਆਪਣੇ ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਕਰੋ
# (ਟੈਂਪਲੇਟ ਦੀ ਡੇਟਾ ਇਨਜੈਸ਼ਨ ਗਾਈਡ ਦੀ ਪਾਲਣਾ ਕਰੋ)

# ਡੋਮੇਨ-ਨਿਰਧਾਰਿਤ ਸਵਾਲਾਂ ਨਾਲ ਟੈਸਟ ਕਰੋ
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**  
- [ ] ਏਜੰਟ ਅੱਪਲੋਡ ਕੀਤੀਆਂ ਦਸਤਾਵੇਜ਼ਾਂ ਵਿੱਚੋਂ ਜਵਾਬ ਦਿੰਦਾ ਹੈ  
- [ ] ਪ੍ਰਤਿਕ੍ਰਿਆਵਾਂ ਵਿੱਚ ਹਵਾਲੇ ਸ਼ਾਮਲ ਹਨ  
- [ ] ਬਾਹਰ-ਦਾਇਰੇ ਦੇ ਸਵਾਲਾਂ 'ਤੇ ਹੈਲੂਸੀਨੇਸ਼ਨ ਨਹੀਂ

---

## 📚 ਅਗਲੇ ਕਦਮ

ਹੁਣ ਜਦੋਂ ਤੁਸੀਂ AI ਏਜੰਟਾਂ ਨੂੰ ਸਮਝ ਲਿਆ ਹੈ, ਇਹ ਉन्नਤ ਵਿਸ਼ਿਆਂ ਦੀ ਖੋਜ ਕਰੋ:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | ਕਈ ਸਹਿਯੋਗੀ ਏਜੰਟਾਂ ਨਾਲ ਸਿਸਟਮ ਬਣਾਓ | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | ਅਰਕੀਸਟ੍ਰੇਸ਼ਨ ਅਤੇ ਸੰਚਾਰ ਪੈਟਰਨ ਸਿੱਖੋ | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | ਐਂਟਰਪ੍ਰਾਈਜ਼-ਤਿਆਰ ਏਜੰਟ ਤੈਨਾਤ | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | ਏਜੰਟ ਦੇ ਕਾਰਗੁਜ਼ਾਰੀ ਦੀ ਜਾਂਚ ਅਤੇ ਮੁਲਾਂਕਣ | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 ਵਾਧੂ ਸਾਧਨ

### ਅਧਿਕਾਰਿਕ ਦਸਤਾਵੇਜ਼
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### ਏਜੰਟਾਂ ਲਈ AZD ਟੈਮਪਲੇਟ
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### ਕਮਿਊਨਟੀ ਸਰੋਤ
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲੇ ਪਾਠ**: [AI Model Deployment](ai-model-deployment.md)
- **ਅਗਲਾ ਪਾਠ**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰਨ:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ Co-op Translator (https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਅਤ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->