# Agentes de IA com Azure Developer CLI

**Chapter Navigation:**
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Previous**: [Implementação de Modelos de IA](ai-model-deployment.md)
- **➡️ Next**: [Práticas de IA em Produção](production-ai-practices.md)
- **🚀 Advanced**: [Soluções Multi-Agente](../../examples/retail-scenario.md)

---

## Introdução

Agentes de IA são programas autónomos que podem perceber o seu ambiente, tomar decisões e executar ações para atingir objetivos específicos. Ao contrário de chatbots simples que respondem a prompts, os agentes podem:

- **Usar ferramentas** - Chamar APIs, pesquisar bases de dados, executar código
- **Planear e raciocinar** - Dividir tarefas complexas em passos
- **Aprender com o contexto** - Manter memória e adaptar comportamento
- **Colaborar** - Trabalhar com outros agentes (sistemas multi-agente)

Este guia mostra como implantar agentes de IA no Azure usando o Azure Developer CLI (azd).

## Objetivos de Aprendizagem

Ao concluir este guia, vai:
- Compreender o que são agentes de IA e como diferem dos chatbots
- Implantar templates de agentes de IA pré-criados usando o AZD
- Configurar Foundry Agents para agentes personalizados
- Implementar padrões básicos de agentes (uso de ferramentas, RAG, multi-agente)
- Monitorizar e depurar agentes implantados

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Implantar aplicações de agentes de IA no Azure com um único comando
- Configurar ferramentas e capacidades dos agentes
- Implementar geração aumentada por recuperação (RAG) com agentes
- Desenhar arquiteturas multi-agente para fluxos de trabalho complexos
- Resolução de problemas comuns na implantação de agentes

---

## 🤖 O que torna um agente diferente de um chatbot?

| Característica | Chatbot | Agente de IA |
|---------|---------|----------|
| **Comportamento** | Responde a pedidos | Toma ações autónomas |
| **Ferramentas** | Nenhuma | Pode chamar APIs, pesquisar, executar código |
| **Memória** | Apenas baseada na sessão | Memória persistente entre sessões |
| **Planeamento** | Resposta única | Raciocínio em vários passos |
| **Colaboração** | Entidade única | Pode trabalhar com outros agentes |

### Analogia Simples

- **Chatbot** = Uma pessoa prestável a responder perguntas num balcão de informação
- **Agente de IA** = Um assistente pessoal que pode fazer chamadas, marcar compromissos e completar tarefas por si

---

## 🚀 Início Rápido: Implante o Seu Primeiro Agente

### Opção 1: Template Foundry Agents (Recomendado)

```bash
# Inicializar o modelo de agentes de IA
azd init --template get-started-with-ai-agents

# Implantar no Azure
azd up
```

**O que é implantado:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (para RAG)
- ✅ Azure Container Apps (interface web)
- ✅ Application Insights (monitorização)

**Tempo:** ~15-20 minutos
**Custo:** ~$100-150/mês (desenvolvimento)

### Opção 2: Agente OpenAI com Prompty

```bash
# Inicializar o modelo de agente baseado em Prompty
azd init --template agent-openai-python-prompty

# Implementar no Azure
azd up
```

**O que é implantado:**
- ✅ Azure Functions (execução serverless do agente)
- ✅ Azure OpenAI
- ✅ Ficheiros de configuração Prompty
- ✅ Implementação de agente de exemplo

**Tempo:** ~10-15 minutos
**Custo:** ~$50-100/mês (desenvolvimento)

### Opção 3: Agente de Chat RAG

```bash
# Inicializar o modelo de chat RAG
azd init --template azure-search-openai-demo

# Implantar no Azure
azd up
```

**O que é implantado:**
- ✅ Azure OpenAI
- ✅ Azure AI Search com dados de exemplo
- ✅ Pipeline de processamento de documentos
- ✅ Interface de chat com citações

**Tempo:** ~15-25 minutos
**Custo:** ~$80-150/mês (desenvolvimento)

---

## 🏗️ Padrões de Arquitetura de Agentes

### Padrão 1: Agente Único com Ferramentas

O padrão de agente mais simples - um agente que pode usar várias ferramentas.

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

**Melhor para:**
- Bots de apoio ao cliente
- Assistentes de investigação
- Agentes de análise de dados

**Template AZD:** `azure-search-openai-demo`

### Padrão 2: Agente RAG (Retrieval-Augmented Generation)

Um agente que recupera documentos relevantes antes de gerar respostas.

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

**Melhor para:**
- Bases de conhecimento empresariais
- Sistemas de perguntas e respostas sobre documentos
- Conformidade e investigação jurídica

**Template AZD:** `azure-search-openai-demo`

### Padrão 3: Sistema Multi-Agente

Múltiplos agentes especializados a trabalhar em conjunto em tarefas complexas.

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

**Melhor para:**
- Geração de conteúdo complexo
- Fluxos de trabalho em vários passos
- Tarefas que exigem diferentes competências

**Saiba Mais:** [Padrões de Coordenação Multi-Agente](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configurar Ferramentas do Agente

Os agentes tornam-se poderosos quando podem usar ferramentas. Eis como configurar ferramentas comuns:

### Configuração de Ferramentas nos Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definir ferramentas personalizadas
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

# Criar agente com ferramentas
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configuração do Ambiente

```bash
# Configurar variáveis de ambiente específicas do agente
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Implantar com a configuração atualizada
azd deploy
```

---

## 📊 Monitorização de Agentes

### Integração com o Application Insights

Todos os templates AZD de agentes incluem o Application Insights para monitorização:

```bash
# Abrir painel de monitorização
azd monitor --overview

# Ver registos em tempo real
azd monitor --logs

# Ver métricas em tempo real
azd monitor --live
```

### Métricas Principais a Acompanhar

| Métrica | Descrição | Objetivo |
|--------|-------------|--------|
| Latência de Resposta | Tempo para gerar resposta | < 5 segundos |
| Utilização de Tokens | Tokens por pedido | Monitorizar para custos |
| Taxa de Sucesso de Chamadas a Ferramentas | % de execuções de ferramentas bem-sucedidas | > 95% |
| Taxa de Erro | Pedidos de agente falhados | < 1% |
| Satisfação do Utilizador | Pontuações de feedback | > 4.0/5.0 |

### Registos Personalizados para Agentes

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

## 💰 Considerações de Custo

### Custos Mensais Estimados por Padrão

| Padrão | Ambiente de Desenvolvimento | Produção |
|---------|-----------------|------------|
| Agente Único | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agentes) | $150-300 | $500-1,500 |
| Multi-Agente Empresarial | $300-500 | $1,500-5,000+ |

### Dicas de Otimização de Custo

1. **Use GPT-4o-mini para tarefas simples**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implemente cache para consultas repetidas**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Defina limites de tokens**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Limitar o comprimento da resposta
   )
   ```

4. **Escale para zero quando não estiver em uso**
   ```bash
   # Os Container Apps escalam automaticamente até zero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Resolução de Problemas com Agentes

### Problemas Comuns e Soluções

<details>
<summary><strong>❌ Agente não responde a chamadas de ferramentas</strong></summary>

```bash
# Verificar se as ferramentas estão devidamente registadas
azd show

# Verificar a implementação do OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Verificar os registos do agente
azd monitor --logs
```

**Causas comuns:**
- Incompatibilidade na assinatura da função da ferramenta
- Falta de permissões necessárias
- Endpoint da API não acessível
</details>

<details>
<summary><strong>❌ Alta latência nas respostas do agente</strong></summary>

```bash
# Verifique o Application Insights para identificar gargalos
azd monitor --live

# Considere usar um modelo mais rápido
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Dicas de otimização:**
- Use respostas em streaming
- Implemente cache de respostas
- Reduza o tamanho da janela de contexto
</details>

<details>
<summary><strong>❌ Agente a devolver informação incorreta ou alucinações</strong></summary>

```python
# Melhorar através de prompts do sistema mais eficazes
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Adicionar recuperação para fundamentação
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Fundamentar as respostas em documentos
)
```
</details>

<details>
<summary><strong>❌ Erros de limite de tokens excedido</strong></summary>

```python
# Implementar gestão da janela de contexto
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Estimativa aproximada
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Exercícios Práticos

### Exercício 1: Implementar um Agente Básico (20 minutos)

**Objetivo:** Implementar o seu primeiro agente de IA usando o AZD

```bash
# Passo 1: Inicializar o modelo
azd init --template get-started-with-ai-agents

# Passo 2: Iniciar sessão no Azure
azd auth login

# Passo 3: Implantar
azd up

# Passo 4: Testar o agente
# Abra a URL mostrada na saída

# Passo 5: Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] O agente responde a perguntas
- [ ] Consegue aceder ao painel de monitorização
- [ ] Recursos limpos com sucesso

### Exercício 2: Adicionar uma Ferramenta Personalizada (30 minutos)

**Objetivo:** Estender um agente com uma ferramenta personalizada

1. Implemente o template do agente
2. Crie uma nova função de ferramenta:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Chamada de API para o serviço meteorológico
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registe a ferramenta com o agente
4. Teste que o agente usa a nova ferramenta

**Critérios de Sucesso:**
- [ ] O agente reconhece consultas relacionadas com o tempo
- [ ] A ferramenta é chamada corretamente
- [ ] A resposta inclui informação meteorológica

### Exercício 3: Construir um Agente RAG (45 minutos)

**Objetivo:** Criar um agente que responda a perguntas a partir dos seus documentos

```bash
# Implantar o template RAG
azd init --template azure-search-openai-demo
azd up

# Carregue os seus documentos
# (Siga o guia de ingestão de dados do template)

# Teste com perguntas específicas do domínio
```

**Critérios de Sucesso:**
- [ ] O agente responde com base em documentos carregados
- [ ] As respostas incluem citações
- [ ] Sem alucinações em perguntas fora do âmbito

---

## 📚 Próximos Passos

Agora que compreende os agentes de IA, explore estes tópicos avançados:

| Tópico | Descrição | Ligação |
|-------|-------------|------|
| **Sistemas Multi-Agente** | Construa sistemas com múltiplos agentes a colaborar | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Padrões de Coordenação** | Aprenda padrões de orquestração e comunicação | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Implementação em Produção** | Implantação de agentes pronta para empresas | [Práticas de IA em Produção](production-ai-practices.md) |
| **Avaliação de Agentes** | Teste e avalie o desempenho dos agentes | [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Recursos Adicionais

### Documentação Oficial
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Templates AZD para Agentes
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Recursos da Comunidade
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navegação**
- **Lição Anterior**: [Implementação de Modelos de IA](ai-model-deployment.md)
- **Próxima Lição**: [Práticas de IA em Produção](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->