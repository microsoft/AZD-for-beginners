# AI Agents wit Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Practices](production-ai-practices.md)
- **🚀 Advanced**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Intro

AI agents na autonomous programs wey fit sense dia environment, make decisions, an take action to achieve specific goals. No like simple chatbots wey dey respond to prompts, agents fit:

- **Use tools** - Call APIs, search databases, run code
- **Plan and reason** - Break big tasks into steps
- **Learn from context** - Keep memory an adapt behaviour
- **Collaborate** - Work wit oda agents (multi-agent systems)

Dis guide go show you how to deploy AI agents to Azure using Azure Developer CLI (azd).

## Wetin You Go Learn

If you complete dis guide, you go:
- Understand wetin AI agents be an how dem different from chatbots
- Deploy pre-built AI agent templates using AZD
- Configure Foundry Agents for custom agents
- Implement basic agent patterns (tool use, RAG, multi-agent)
- Monitor an debug deployed agents

## Wetin You Go Fit Do After

After you finish, you go fit:
- Deploy AI agent applications to Azure with one command
- Configure agent tools an capabilities
- Implement retrieval-augmented generation (RAG) with agents
- Design multi-agent architectures for complex workflows
- Troubleshoot common agent deployment wahalas

---

## 🤖 Wetin Make Agent Different from Chatbot?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Dey answer prompts | Dey take autonomous actions |
| **Tools** | No get | Fit call APIs, search, run code |
| **Memory** | Na session only | Persistent memory across sessions |
| **Planning** | One response | Reason in many steps |
| **Collaboration** | Single entity | Fit work wit oda agents |

### Simple Analogy

- **Chatbot** = Person wey dey help answer questions for information desk
- **AI Agent** = Personal assistant wey fit make calls, book appointments, an finish tasks for you

---

## 🚀 Quick Start: Deploy Your First Agent

### Option 1: Foundry Agents Template (Recommended)

```bash
# Set up di AI agents template
azd init --template get-started-with-ai-agents

# Deploy am go Azure
azd up
```

**Wetin dey deploy:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoring)

**Time:** ~15-20 minutes
**Cost:** ~$100-150/month (development)

### Option 2: OpenAI Agent with Prompty

```bash
# Set up di Prompty-based agent template
azd init --template agent-openai-python-prompty

# Deploy am go Azure
azd up
```

**Wetin dey deploy:**
- ✅ Azure Functions (serverless agent execution)
- ✅ Azure OpenAI
- ✅ Prompty configuration files
- ✅ Sample agent implementation

**Time:** ~10-15 minutes
**Cost:** ~$50-100/month (development)

### Option 3: RAG Chat Agent

```bash
# Make di RAG chat template ready
azd init --template azure-search-openai-demo

# Put am for Azure
azd up
```

**Wetin dey deploy:**
- ✅ Azure OpenAI
- ✅ Azure AI Search wit sample data
- ✅ Document processing pipeline
- ✅ Chat interface wit citations

**Time:** ~15-25 minutes
**Cost:** ~$80-150/month (development)

---

## 🏗️ Agent Architecture Patterns

### Pattern 1: Single Agent with Tools

The simplest agent pattern - one agent wey fit use multiple tools.

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

**Best for:**
- Customer support bots
- Research assistants
- Data analysis agents

**AZD Template:** `azure-search-openai-demo`

### Pattern 2: RAG Agent (Retrieval-Augmented Generation)

Agent wey go fetch relevant documents before e go generate response.

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

**Best for:**
- Enterprise knowledge bases
- Document Q&A systems
- Compliance an legal research

**AZD Template:** `azure-search-openai-demo`

### Pattern 3: Multi-Agent System

Plenty specialized agents wey dey work together on complex tasks.

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

**Best for:**
- Complex content generation
- Multi-step workflows
- Tasks wey need different expertise

**Learn More:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuring Agent Tools

Agents strong when dem fit use tools. Na so to configure common tools:

### Tool Configuration in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Make custom tools dem
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

# Make agent wey get tools dem
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Environment Configuration

```bash
# Set up environment variables wey dey only for that agent
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Deploy am with di updated configuration
azd deploy
```

---

## 📊 Monitoring Agents

### Application Insights Integration

All AZD agent templates dey include Application Insights for monitoring:

```bash
# Open di monitoring dashboard
azd monitor --overview

# See di live logs
azd monitor --logs

# See di live metrics
azd monitor --live
```

### Key Metrics to Track

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Time to generate response | < 5 seconds |
| Token Usage | Tokens per request | Monitor for cost |
| Tool Call Success Rate | % of successful tool executions | > 95% |
| Error Rate | Failed agent requests | < 1% |
| User Satisfaction | Feedback scores | > 4.0/5.0 |

### Custom Logging for Agents

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

## 💰 Cost Considerations

### Estimated Monthly Costs by Pattern

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Cost Optimization Tips

1. **Use GPT-4o-mini for simple tasks**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implement caching for repeated queries**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Set token limits**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Make di response short
   )
   ```

4. **Scale to zero when not in use**
   ```bash
   # Container Apps dey scale go zero by demself
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Troubleshooting Agents

### Common Issues and Solutions

<details>
<summary><strong>❌ Agent no dey respond to tool calls</strong></summary>

```bash
# Check if tools dem don register proper
azd show

# Confirm say OpenAI don deploy proper
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Check di agent logs
azd monitor --logs
```

**Common causes:**
- Tool function signature no match
- Missing required permissions
- API endpoint no dey accessible
</details>

<details>
<summary><strong>❌ High latency for agent responses</strong></summary>

```bash
# Abeg check Application Insights make you see where e dey jam
azd monitor --live

# Try use faster model
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimization tips:**
- Use streaming responses
- Implement response caching
- Reduce context window size
</details>

<details>
<summary><strong>❌ Agent dey return incorrect or hallucinated information</strong></summary>

```python
# Make am beta wit beta system prompts
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Add retrieval make e fit ground
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Make responses dey grounded inside documents
)
```
</details>

<details>
<summary><strong>❌ Token limit exceeded errors</strong></summary>

```python
# Arrange how we go take manage the context window
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Na rough estimate
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Hands-On Exercises

### Exercise 1: Deploy a Basic Agent (20 minutes)

**Goal:** Deploy your first AI agent using AZD

```bash
# Step 1: Make di template ready
azd init --template get-started-with-ai-agents

# Step 2: Login go Azure
azd auth login

# Step 3: Deploy am
azd up

# Step 4: Test di agent
# Open di URL wey dey for di output

# Step 5: Clear everytin
azd down --force --purge
```

**Success Criteria:**
- [ ] Agent dey answer questions
- [ ] Fit access monitoring dashboard
- [ ] Resources don clean up properly

### Exercise 2: Add a Custom Tool (30 minutes)

**Goal:** Extend an agent wit a custom tool

1. Deploy the agent template
2. Create a new tool function:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API call to di weather service
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Register the tool wit the agent
4. Test say the agent dey use the new tool

**Success Criteria:**
- [ ] Agent sabi recognise weather-related queries
- [ ] Tool dey get called correct
- [ ] Response get weather information

### Exercise 3: Build a RAG Agent (45 minutes)

**Goal:** Create an agent wey go answer questions from your documents

```bash
# Deploy di RAG template
azd init --template azure-search-openai-demo
azd up

# Upload ya documents
# (Follow di template guide wey show how to put data)

# Test am wit questions wey relate to di domain
```

**Success Criteria:**
- [ ] Agent dey answer from uploaded documents
- [ ] Responses get citations
- [ ] No hallucination for out-of-scope questions

---

## 📚 Next Steps

Now wey you don sabi AI agents, check these advanced topics:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Build systems wit multiple collaborating agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Learn orchestration an communication patterns | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Enterprise-ready agent deployment | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Test an evaluate agent performance | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Additional Resources

### Official Documentation
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD Templates for Agents
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Community Resources
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Previous Lesson**: [AI Model Deployment](ai-model-deployment.md)
- **Next Lesson**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:

Dis document don translate by AI translation service wey dem dey call Co‑op Translator (https://github.com/Azure/co-op-translator). We dey try make everything correct, but make you sabi say automatic translations fit get mistakes or no too correct. The original document for im original language na the authoritative source. If na important matter, e better make professional human translator do am. We no go responsible for any misunderstanding or wrong interpretation wey fit come from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->