# ಏಐ ಏಜೆಂಟ್ಗಳು Azure Developer CLI ಜೊತೆಗೆ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನದು**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ಮುಂದಿನದು**: [Production AI Practices](production-ai-practices.md)
- **🚀 ಹೆಚ್ಚುವರಿ**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## ಪರಿಚಯ

ಏಐ ಏಜೆಂಟ್ಗಳು ತಮ್ಮ ವಾತಾವರಣವನ್ನು ನೋಡಿಕೊಳ್ಳುವ, ನಿರ್ಣಯಗಳನ್ನು ಕೈಗೊಳ್ಳುವ ಮತ್ತು ನಿರ್ದಿಷ್ಟ ಗುರಿಗಳನ್ನು ಸಾಧಿಸಲು ಕ್ರಿಯೆಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳುವ ಸ್ವಯಂಚಾಲಿತ ಪ್ರೋಗ್ರಾಮ್ಗಳಾಗಿವೆ. ಪ್ರಾಂಪ್ಟ್‌ಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುವ ಸರಳ ಚಾಟ್ಬಾಟ್‌ಗಳಿಗೆ ವಿರುದ್ಧವಾಗಿ, ಏಜೆಂಟ್ಗಳು:

- **ಉಪಕರಣಗಳನ್ನು ಬಳಸಬಹುದು** - APIಗಳನ್ನು ಕರೆ, ಡೇಟಾಬೇಸ್ ಹುಡುಕಲು, ಕೋಡ್ ಚಾಲನೆ
- **ಯೋಜನೆ ಮತ್ತು ತರ್ಕ** - ಸಂಕೀರ್ಣ ಕೆಲಸಗಳನ್ನು ಹಂತಗಳಾಗಿ ವಿಭಜಿಸುವುದು
- **ಸಂದರ್ಭದಿಂದ ನೊಂದಿಕೊಳ್ಳುವುದು** - ಮೆಮರಿ ಕಾಯ್ದುಕೊಟ್ಟು ההת ವರ್ತನೆಯನ್ನು ಹೊಂದಿಸುವುದು
- **ಸಹಕಾರ** - ಇತರ ಏಜೆಂಟ್‌ಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡುವುದು (ಮಲ್ಟಿ-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆಗಳು)

ಈ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI (azd) ಬಳಸಿ ಏಜೆಂಟ್ಗಳನ್ನು Azure ಗೆ ಹೇಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದನ್ನು ತೋರಿಸುತ್ತದೆ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- ಏಐ ಏಜೆಂಟ್‌ಗಳು ಏನನ್ನು ಮತ್ತು ಅವು ಚಾಟ್ಬಾಟ್‌ಗಳಿಂದ ಹೇಗೆ ಭಿನ್ನವಾಗಿವೆ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- AZD ಬಳಸಿ ಪೂರ್ವ-ನಿರ್ಮಿತ ಏಜೆಂಟ್ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದು
- ಕಸ್ಟಮ್ ಏಜೆಂಟ್‌ಗಳಿಗೆ Foundry Agents ಸಂರಚನೆ ಮಾಡುವುದು
- ಮೂಲಭೂತ ಏಜೆಂಟ್ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು (ಉಪಕರಣ ಬಳಕೆ, RAG, ಮಲ್ಟಿ-ಏಜೆಂಟ್)
- ಡಿಪ್ಲಾಯ್ ಮಾಡಿದ ಏಜೆಂಟ್‌ಗಳನ್ನು ಮಾನಿಟರ್ ಮತ್ತು ಡೀಬಗ್ ಮಾಡುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಂಡ ನಂತರ, ನೀವು ಸಮರ್ಥರಾಗಿರುತ್ತೀರಿ:
- ಏಕ ಕಮಾಂಡ್‌ನಿಂದ ಏಐ ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್ಗಳನ್ನು Azure ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದು
- ಏಜೆಂಟ್ ಉಪಕರಣಗಳು ಮತ್ತು ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸಂರಚಿಸುವುದು
- ಏಜೆಂಟ್‌ಗಳೊಂದಿಗೆ retrieval-augmented generation (RAG) ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಸಂಕೀರ್ಣ ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಆರ್ಕಿಟೆಕ್ಚರ್ ವಿನ್ಯಾಸಗೊಳಿಸುವುದು
- ಸಾಮಾನ್ಯ ಏಜೆಂಟ್ ಡಿಪ್ಲಾಯ್ ಸಮಸ್ಯೆಗಳನ್ನು ಟ್ರಬಲ್ಶೂಟ್ ಮಾಡುವುದು

---

## 🤖 ಏಜೆಂಟ್ ಅನ್ನು ಚಾಟ್ಬಾಟ್ ಗಾಗಿ ಭಿನ್ನವಾಗಿಸುವುದು ಏನು?

| ವೈಶಿಷ್ಟ್ಯ | ಚಾಟ್ಬಾಟ್ | AI ಏಜೆಂಟ್ |
|---------|---------|----------|
| **ವೆಹೇವಿಯರ್** | ಪ್ರಾಂಪ್ಟ್‌ಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುವುದು | ಸ್ವಯಂಚಾಲಿತ ಕ್ರಮಗಳು ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ |
| **ಉಪಕರಣಗಳು** | ಇಲ್ಲ | APIಗಳನ್ನು ಕರೆ, ಹುಡುಕು, ಕೋಡ್ ಚಾಲನೆ ಮಾಡಬಹುದು |
| **ಮೆಮೊರಿ** | ಕೇವಲ ಸೆಷನ್ ಆಧಾರಿತ | ಸೆಷನ್‌ಗಳ ಅತೀರ್ಥPersistent ಮೆಮೊರಿ |
| **ಯೋಜನೆ** | ಏಕ ಪ್ರತಿಕ್ರಿಯೆ | ಬಹು ಹಂತದ ತರ್ಕ |
| **ಸಹಕಾರ** | ಏಕ ಏಕಕ | ಇತರ ಏಜೆಂಟ್‌ಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡಬಹುದು |

### ಸರಳ ಸಂಭವಮಾನ

- **ಚಾಟ್ಬಾಟ್** = ಮಾಹಿತಿ ಕೌಂಟರ್‌ನಲ್ಲಿ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸುವ ಸಹಾಯಕ ವ್ಯಕ್ತಿ
- **AI ಏಜೆಂಟ್** = ಫೋನ್ ಕರೆ ಮಾಡುವ, ನೇಮಕಾತಿ ಬುಕ್ ಮಾಡುವ ಮತ್ತು ನಿಮ್ಮ ಪರದೆ ಕೆಲಸಗಳನ್ನು ಪೂರ್ಣಗೊಳಿಸಬಲ್ಲ ವೈಯಕ್ತಿಕ ಸಹಾಯಕ

---

## 🚀 ವೇಗದ ಪ್ರಾರಂಭ: ನಿಮ್ಮ ಮೊದಲ ಏಜೆಂಟ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ

### ಆಯ್ಕೆ 1: Foundry Agents ಟೆಂಪ್ಲೇಟು (ಶಿಫಾರಸು)

```bash
# AI ಏಜೆಂಟ್‌ಗಳ ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template get-started-with-ai-agents

# Azure ಗೆ ನಿಯೋಜಿಸಿ
azd up
```

**ಏನು ಡಿಪ್ಲಾಯ್ ಆಗುತ್ತದೆ:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG ಗಾಗಿ)
- ✅ Azure Container Apps (ವೆಬ್ ಇಂಟರ್ಫೇಸ್)
- ✅ Application Insights (ಮಾನಿಟರಿಂಗ್)

**ಸಮಯ:** ~15-20 ನಿಮಿಷಗಳು
**ವೆಚ್ಚ:** ~$100-150/ತಿಂಗಳು (ವಿಕಸನ)

### ಆಯ್ಕೆ 2: Prompty ಜೊತೆಗೆ OpenAI ಏಜೆಂಟ್

```bash
# Prompty ಆಧಾರಿತ ಏಜೆಂಟ್ ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template agent-openai-python-prompty

# Azure ಗೆ ನಿಯೋಜಿಸಿ
azd up
```

**ಏನು ಡಿಪ್ಲಾಯ್ ಆಗುತ್ತದೆ:**
- ✅ Azure Functions (ಸರ್ವರ್‌ಲೆಸ್ ಏಜೆಂಟ್ ನಿರ್ವಹಣೆ)
- ✅ Azure OpenAI
- ✅ Prompty ಸಂರಚನಾ ಫೈಲ್‌ಗಳು
- ✅ ಉದಾಹರಣಾ ಏಜೆಂಟ್ ಅನುಷ್ಠಾನ

**ಸಮಯ:** ~10-15 ನಿಮಿಷಗಳು
**ವೆಚ್ಚ:** ~$50-100/ತಿಂಗಳು (ವಿಕಸನ)

### ಆಯ್ಕೆ 3: RAG ಚಾಟ್ ಏಜೆಂಟ್

```bash
# RAG ಚಾಟ್ ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
azd init --template azure-search-openai-demo

# Azure ಗೆ ನಿಯೋಜಿಸಿ
azd up
```

**ಏನು ಡಿಪ್ಲಾಯ್ ಆಗುತ್ತದೆ:**
- ✅ Azure OpenAI
- ✅ Azure AI Search ಮಾದರಿ ಡೇಟಾ ಜೊತೆಗೆ
- ✅ ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರೊಸೆಸಿಂಗ್ ಪೈಪ್‌ಲೈನ್
- ✅ ಉಲ್ಲೇಖಗಳೊಂದಿಗೆ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್

**ಸಮಯ:** ~15-25 ನಿಮಿಷಗಳು
**ವೆಚ್ಚ:** ~$80-150/ತಿಂಗಳು (ವಿಕಸನ)

---

## 🏗️ ಏಜೆಂಟ್ ಆರ್ಕಿಟೆಕ್ಷರ್ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಉಪಕರಣಗಳೊಂದಿಗೆ ಏಕ ಏಜೆಂಟ್

ಸಂಕ್ಷಿಪ್ತ ಏಜೆಂಟ್ ಮಾದರಿ - ಒಂದೇ ಏಜೆಂಟ್ ಹಲವಾರು ಉಪಕರಣಗಳನ್ನು ಬಳಸಬಹುದು.

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

**ಶ್ರೇಷ್ಠಕ್ಕಾಗಿ:**
- ಗ್ರಾಹಕ ಬೆಂಬಲ ಬಾಟ್‌ಗಳು
- ಸಂಶೋಧನಾ ಸಹಾಯಕರು
- ಡೇಟಾ ವಿಶ್ಲೇಷಣಾ ಏಜೆಂಟ್‌ಗಳು

**AZD ಟೆಂಪ್ಲೇಟು:** `azure-search-openai-demo`

### ಮಾದರಿ 2: RAG ಏಜೆಂಟ್ (Retrieval-Augmented Generation)

ಪ್ರತಿಕ್ರಿಯೆ ಉತ್ಪಾದಿಸುವ ಮೊದಲು ಸಂಬಂಧಿತ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು ಪಡೆಯುವ ಏಜೆಂಟ್.

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

**ಶ್ರೇಷ್ಠಕ್ಕಾಗಿ:**
- ಎಂಟರ್ಪ್ರೈಸ್ ಜ್ಞಾನ ಭಂಡಾರಗಳು
- ಡಾಕ್ಯುಮೆಂಟ್ Q&A ಸಿಸ್ಟಮ್‌ಗಳು
- ಅನುಪಾಲನೆ ಮತ್ತು ಕಾನೂನು ಸಂಶೋಧನೆ

**AZD ಟೆಂಪ್ಲೇಟು:** `azure-search-openai-demo`

### ಮಾದರಿ 3: ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಸಿಸ್ಟಮ್

ಸಂಕೀರ್ಣ ಕೆಲಸಗಳ ಮೇಲೆ ಒಟ್ಟಿಗೆ ಕೆಲಸ ಮಾಡುವ ವಿವಿಧ ಪರಿಣತಿ ಹೊಂದಿರುವ ಏಜೆಂಟ್‌ಗಳು.

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

**ಶ್ರೇಷ್ಠಕ್ಕಾಗಿ:**
- ಸಂಕೀರ್ಣ ವಿಷಯ ನಿರ್ಮಾಣ
- ಬಹು ಹಂತದ ವರ್ಕ್‌ಫ್ಲೋಗಳು
- ವಿಭಿನ್ನ ಪರಿಣತಿಗಳನ್ನು ಅಗತ್ಯವಿರುವ ಕೆಲಸಗಳು

**ಇನ್ನಷ್ಟು ತಿಳಿಯಿರಿ:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ ಏಜೆಂಟ್ ಉಪಕರಣಗಳನ್ನು ಸಂರಚಿಸುವುದು

ಏಜೆಂಟ್‌ಗಳು ಉಪಕರಣಗಳನ್ನು ಬಳಸುವಾಗ ಶಕ್ತಿಶಾಲಿಯಾಗುತ್ತವೆ. ಸಾಮಾನ್ಯ ಉಪಕರಣಗಳನ್ನು ಹೇಗೆ ಸಂರಚಿಸುವುದು ಇಲ್ಲಿ ಇದೆ:

### Foundry Agents ನಲ್ಲಿ ಉಪಕರಣ ಸಂರಚನೆ

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# ಕಸ್ಟಮ್ ಟೂಲ್‌ಗಳನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿ
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

# ಉಪಕರಣಗಳೊಂದಿಗೆ ಏಜೆಂಟ್ ಅನ್ನು ರಚಿಸಿ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### ಪರಿಸರ ಸಂರಚನೆ

```bash
# ಏಜೆಂಟ್-ನಿರ್ದಿಷ್ಟ ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# ನವೀಕರಿಸಿದ ಸಂರಚನೆಯೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd deploy
```

---

## 📊 ಏಜೆಂಟ್‌ಗಳ ಮಾನಿಟರಿಂಗ್

### Application Insights ಏಕೀಕರಣ

ಎಲ್ಲಾ AZD ಏಜೆಂಟ್ ಟೆಂಪ್ಲೇಟ್ಗಳಲ್ಲಿಯೂ ಮಾನಿಟರಿಂಗ್‌ಗಾಗಿ Application Insights ಸೇರಿಸಲಾಗಿದೆ:

```bash
# ಮೋನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ತೆರೆಯಿರಿ
azd monitor --overview

# ಲೈವ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಲೈವ್ ಮೆಟ್ರಿಕ್ಸ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

### ಟ್ರ್ಯಾಕ್ ಮಾಡುವ ಪ್ರಮುಖ ಮೆಟ್ರิก್ಸ್

| ಮೆಟ್ರಿಕ್ | ವಿವರಣೆ | ಗುರಿ |
|--------|-------------|--------|
| ಪ್ರತಿಕ್ರಿಯೆ ವಿಳಂಬ | ಪ್ರತಿಕ್ರಿಯೆ ಉತ್ಪಾದಿಸಲು ತೆಗೆದುಕೊಳ್ಳುವ ಸಮಯ | < 5 ಸೆಕೆಂಡುಗಳು |
| ಟೋಕನ್ ಬಳಕೆ | ಪ್ರತಿ ವಿನಂತಿಗೆ ಟೋಕನ್ಗಳ ಪ್ರಮಾಣ | ವೆಚ್ಚಕ್ಕಾಗಿ ನಿಮಿಷಣ್ ಮಾಡಿ |
| ಉಪಕರಣ ಕರೆ ಯಶಸ್ವಿ ಪ್ರಮಾಣ | ಯಶಸ್ವಿಯಾಗಿ ನಿರ್ವಹಿಸಿದ ಉಪಕರಣ ಕರೆಯಾದ ಶೇಕಡಾವಾರು | > 95% |
| ದೋಷ ಪ್ರಮಾಣ | ವಿಫಲವಾದ ಏಜೆಂಟ್ ವಿನಂತಿಗಳು | < 1% |
| ಬಳಕೆದಾರ ತೃಪ್ತಿ | ಪ್ರತಿಕ್ರಿಯೆ ಅಂಕಗಳು | > 4.0/5.0 |

### ಏಜೆಂಟ್ಗೆ ಕಸ್ಟಮ್ ಲಾಗಿಂಗ್

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

## 💰 ವೆಚ್ಚ ಕುರಿತು ಪರಿಗಣನೆಗಳು

### ಮಾದರಿ ಪ್ರಕಾರ ಅಂದಾಜು ಮಾಸಿಕ ವೆಚ್ಚಗಳು

| ಪ್ಯಾಟರ್ನ್ | ಡೆವ್ ಪರಿಸರ | ಉತ್ಪಾದನೆ |
|---------|-----------------|------------|
| ಏಕ ಏಜೆಂಟ್ | $50-100 | $200-500 |
| RAG ಏಜೆಂಟ್ | $80-150 | $300-800 |
| ಮಲ್ಟಿ-ಏಜೆಂಟ್ (2-3 ಏಜೆಂಟ್) | $150-300 | $500-1,500 |
| ಎಂಟರ್ಪ್ರೈಸ್ ಮಲ್ಟಿ-ಏಜೆಂಟ್ | $300-500 | $1,500-5,000+ |

### ವೆಚ್ಚову್ಯವಸ್ಥೆ ಟಿಪ್ಸ್

1. **ಸರಳ ಕೆಲಸಗಳಿಗಾಗಿ GPT-4o-mini ಬಳಸಿರಿ**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **ಮರುಪ್ರಶ್ನೆಗಳಿಗೆ ಕ್ಯಾಶಿಂಗ್ ಅನುಷ್ಠಾನಗೊಳಿಸಿ**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **ಟೋಕನ್ ಮದ್ಯವ್ಯವಹಾರಗಳ ಗಡಿ ನಿಗದಿಪಡಿಸಿ**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # ಪ್ರತಿಕ್ರಿಯೆಯ ಉದ್ದವನ್ನು ಮಿತಿಗೊಳಿಸಿ
   )
   ```

4. **ಬಳಕೆ ಇಲ್ಲದಾಗ سكೇಲ್ ಟು ಸೀಜರೊ (scale to zero) ಮಾಡಿ**
   ```bash
   # Container Apps ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಶೂನ್ಯಕ್ಕೆ ಸ್ಕೇಲ್ ಆಗುತ್ತವೆ
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 ಏಜೆಂಟ್ ಸಮಸ್ಯೆ ಪರಿಹಾರ

### ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು

<details>
<summary><strong>❌ ಉಪಕರಣ ಕರೆಗಳಿಗೆ ಏಜೆಂಟ್ ಪ್ರತಿಕ್ರಿಯಿಸುವುದಿಲ್ಲ</strong></summary>

```bash
# ಉಪಕರಣಗಳು ಸರಿಯಾಗಿ ನೋಂದಾಯಿಸಲ್ಪಟ್ಟಿವೆಯೆಂದು ಪರಿಶೀಲಿಸಿ
azd show

# OpenAI ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# ಏಜೆಂಟ್ ಲಾಗ್‌ಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
azd monitor --logs
```

**ಸಾಮಾನ್ಯ ಕಾರಣಗಳು:**
- ಉಪಕರಣ ಫಂಕ್ಷನ್ ಸಹಿ (signature) ಅಸಮರ್ಪಕತೆ
- ಅಗತ್ಯ ಅನುಮತಿ ಇಲ್ಲದಿರುವುದು
- API ಎಂಡ್‌ಪಾಯಿಂಟ್ ತಲುಪದಿರುವುದು
</details>

<details>
<summary><strong>❌ ಏಜೆಂಟ್ ಪ್ರತಿಕ್ರಿಯೆಗಳಲ್ಲಿ ಉನ್ನತ ವಿಳಂಬ</strong></summary>

```bash
# Application Insights ನಲ್ಲಿ ಬಾಟಲ್‌ನೆಕ್‌ಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
azd monitor --live

# ವೇಗದ ಮಾದರಿಯನ್ನು ಬಳಸುವುದನ್ನು ಪರಿಗಣಿಸಿ
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**ಅಪ್ಟಿಮೈಸೇಶನ್ ಸಲಹೆಗಳು:**
- ಸ್ಟ್ರೀಮಿಂಗ್ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಬಳಸಿ
- ಪ್ರತಿಕ್ರಿಯೆ ಕ್ಯಾಶಿಂಗ್ ಅನುಷ್ಠಾನಗೊಳಿಸಿ
- ಕಾಂಟೆಕ್ಸ್ಟ್ ويندو ಸೈಜ್ ಕಡಿಮೆ ಮಾಡಿ
</details>

<details>
<summary><strong>❌ ಏಜೆಂಟ್ ತಪ್ಪು ಅಥವಾ ಹುಲ್ಯೂಸಿನೇಟೆಡ್ ಮಾಹಿತಿ ನೀಡುತ್ತಿದೆ</strong></summary>

```python
# ಉತ್ತಮ ಸಿಸ್ಟಮ್ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಬಳಸಿ ಸುಧಾರಿಸಿ
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# ಆಧಾರಗೊಳಿಸಲು ಮಾಹಿತಿ ಪಡೆಯುವ ವ್ಯವಸ್ಥೆಯನ್ನು ಸೇರಿಸಿ
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ದಸ್ತಾವೇಜುಗಳಲ್ಲಿ ಆಧಾರಗೊಳಿಸಿ
)
```
</details>

<details>
<summary><strong>❌ ಟೋಕನ್ ಮಿತಿExceeded ದೋಷಗಳು</strong></summary>

```python
# ಸಂಧರ್ಭ ಕಿಟಕಿ ನಿರ್ವಹಣೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # ಸುಮಾರು ಅಂದಾಜು
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 ಹ್ಯಾಂಡ್ಸ್-ಆನ್ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಒಂದು ಮೂಲಭೂತ ಏಜೆಂಟ್ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ (20 ನಿಮಿಷ)

**ಗುರಿ:** AZD ಬಳಸಿ ನಿಮ್ಮ ಮೊದಲ ಏಜೆಂಟ್ ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದು

```bash
# ಹೆಜ್ಜೆ 1: ಟೆಂಪ್ಲೇಟ್ ಪ್ರಾರಂಭಿಸಿ
azd init --template get-started-with-ai-agents

# ಹೆಜ್ಜೆ 2: Azure ಗೆ ಲಾಗಿನ್ ಮಾಡಿ
azd auth login

# ಹೆಜ್ಜಿ 3: ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd up

# ಹೆಜ್ಜೆ 4: ಏಜೆಂಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
# ಔಟ್‌ಪುಟ್‌ನಲ್ಲಿ ತೋರಿಸಲಾದ URL ಅನ್ನು ತೆರೆಯಿರಿ

# ಹೆಜ್ಜಿ 5: ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಏಜೆಂಟ್ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸುತ್ತದೆ
- [ ] ಮಾನಿಟರಿಂಗ್ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್‌ಗೆ ಪ್ರವೇಶ ಹೊಂದಬಹುದು
- [ ] ಸಂಪನ್ಮೂಲಗಳು ಯಶಸ್ವಿಯಾಗಿ ಕ್ಲೀನ್ ಅಪ್ ಆಗಿವೆ

### ವ್ಯಾಯಾಮ 2: ಕಸ್ಟಮ್ ಉಪಕರಣವನ್ನು ಸೇರಿಸಿ (30 ನಿಮಿಷ)

**ಗುರಿ:** ಏಜೆಂಟ್ ಅನ್ನು ಕಸ್ಟಮ್ ಉಪಕರಣದಿಂದ ವಿಸ್ತರಿಸಿ

1. ಏಜೆಂಟ್ ಟೆಂಪ್ಲೇಟನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
2. ಹೊಸ ಉಪಕರಣ ಫಂಕ್ಷನ್ ರಚಿಸಿ:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # ಹವಾಮಾನ ಸೇವೆಗೆ API ಕರೆ
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. ಏಜೆಂಟ್‌ಗೆ ಉಪಕರಣವನ್ನು ನೋಂದಣಿ ಮಾಡಿ
4. ಏಜೆಂಟ್ ಹೊಸ ಉಪಕರಣವನ್ನು ಬಳಸುವುದನ್ನು ಪರೀಕ್ಷಿಸಿ

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಏಜೆಂಟ್ ಹವಾಮಾನ ಸಂಬಂಧಿ ಪ್ರಶ್ನೆಗಳನ್ನು ಗುರುತಿಸುತ್ತದೆ
- [ ] ಟೂಲ್ ಸರಿಯಾಗಿ ಕರೆಯಲಾಗುತ್ತದೆ
- [ ] ಪ್ರತಿಕ್ರಿಯೆಯಲ್ಲಿ ಹವಾಮಾನ ಮಾಹಿತಿಯಿದೆ

### ವ್ಯಾಯಾಮ 3: RAG ಏಜೆಂಟ್ ನಿರ್ಮಿಸಿ (45 ನಿಮಿಷ)

**ಗುರಿ:** ನಿಮ್ಮ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳಿಂದ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸುವ ಏಜೆಂಟ್ ಸೃಷ್ಟಿಸು

```bash
# RAG ಟೆಂಪ್ಲೇಟ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
azd init --template azure-search-openai-demo
azd up

# ನಿಮ್ಮ ದಾಖಲೆಗಳನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ
# (ಟೆಂಪ್ಲೇಟ್‌ನ ಡೇಟಾ ಸೇರ್ಪಡೆ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಅನುಸರಿಸಿ)

# ಡೊಮೇನ್-ನಿರ್ದಿಷ್ಟ ಪ್ರಶ್ನೆಗಳೊಂದಿಗೆ ಪರೀಕ್ಷೆ ಮಾಡಿ
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಏಜೆಂಟ್ ಅಪ್‌ಲೋಡ್ ಮಾಡಿದ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳಿಂದ ಉತ್ತರಿಸುತ್ತಾರೆ
- [ ] ಪ್ರತಿಕ್ರಿಯೆಗಳಲ್ಲಿ ಉಲ್ಲೇಖಗಳು ಇರುತ್ತವೆ
- [ ] ಅವಕಾಶದ ಹೊರಗಿನ ಪ್ರಶ್ನೆಗಳಲ್ಲಿ ಹುಲ್ಯೂಸಿನೇಷನ್ ಇಲ್ಲ

---

## 📚 ಮುಂದಿನ ಹಂತಗಳು

ಈಗ ನೀವು ಏಐ ಏಜೆಂಟ್‌ಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡಿರುವುದರಿಂದ, ಈ ಮುಂದುವರಿತ ವಿಷಯಗಳನ್ನು ಅನ್ವೇಷಿಸಿ:

| ವಿಷಯ | ವಿವರಣೆ | ಲಿಂಕ್ |
|-------|-------------|------|
| **ಮಲ್ಟಿ-ಏಜೆಂಟ್ ವ್ಯವಸ್ಥೆಗಳು** | ಬಹು ಸಹಕಾರಿಯ ಏಜೆಂಟ್‌ಗಳೊಂದಿಗೆ ವ್ಯವಸ್ಥೆಗಳನ್ನು ನಿರ್ಮಿಸು | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **ಓರ್ಸ್ಟ್ರೇಷನ್ ಮಾದರಿಗಳು** | ಸಂಘಟನೆ ಮತ್ತು ಸಂವಹನ ಮಾದರಿಗಳನ್ನು ಕಲಿಯಿರಿ | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **ಉತ್ಪಾದನಾ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್** | ಎಂಟರ್ಪ್ರೈಸ್-ಸಿದ್ಧ ಏಜೆಂಟ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ | [Production AI Practices](production-ai-practices.md) |
| **ಏಜೆಂಟ್ ಮೌಲ್ಯಮಾಪನ** | ಏಜೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ ಮತ್ತು ಮೌಲ್ಯಮಾಪನ ಮಾಡಿ | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

### ಅಧಿಕೃತ ದಾಖಲೆ
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### ಏಜೆಂಟ್‌ಗಳಿಗಾಗಿ AZD ಟೆಂಪ್ಲೇಟ್ಗಳು
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### ಸಮುದಾಯ ಸಂಪನ್ಮೂಲಗಳು
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [AI Model Deployment](ai-model-deployment.md)
- **ಮುಂದಿನ ಪಾಠ**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಅಸ್ವೀಕರಣ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ Co‑op Translator (https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸಿದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅನಿಖರತೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಪರಿಣಾಮ ಉಂಟಾಗಬಹುದಾದ ಯಾವುದೇ ಗೊಂದಲಗಳು ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->