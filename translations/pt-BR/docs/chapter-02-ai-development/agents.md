# Agentes de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Página do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com IA em Primeiro Lugar
- **⬅️ Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **➡️ Próximo**: [Práticas de IA para Produção](production-ai-practices.md)
- **🚀 Avançado**: [Soluções Multi-Agente](../../examples/retail-scenario.md)

---

## Introdução

Agentes de IA são programas autônomos que podem perceber seu ambiente, tomar decisões e executar ações para alcançar objetivos específicos. Diferente de chatbots simples que respondem a prompts, agentes podem:

- **Usar ferramentas** - Chamar APIs, pesquisar bancos de dados, executar código
- **Planejar e raciocinar** - Dividir tarefas complexas em etapas
- **Aprender com o contexto** - Manter memória e adaptar o comportamento
- **Colaborar** - Trabalhar com outros agentes (sistemas multi-agente)

Este guia mostra como implantar agentes de IA no Azure usando o Azure Developer CLI (azd).

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Entender o que são agentes de IA e como eles diferem de chatbots
- Implantar templates de agentes pré-construídos usando AZD
- Configurar Foundry Agents para agentes personalizados
- Implementar padrões básicos de agente (uso de ferramentas, RAG, multi-agente)
- Monitorar e depurar agentes implantados

## Resultados de Aprendizagem

Ao final, você será capaz de:
- Implantar aplicações de agentes de IA no Azure com um único comando
- Configurar ferramentas e capacidades dos agentes
- Implementar geração aumentada por recuperação (RAG) com agentes
- Projetar arquiteturas multi-agente para fluxos de trabalho complexos
- Solucionar problemas comuns de implantação de agentes

---

## 🤖 O que torna um agente diferente de um chatbot?

| Recurso | Chatbot | Agente de IA |
|---------|---------|--------------|
| **Comportamento** | Responde a prompts | Executa ações autônomas |
| **Ferramentas** | Nenhuma | Pode chamar APIs, pesquisar, executar código |
| **Memória** | Somente baseada em sessão | Memória persistente entre sessões |
| **Planejamento** | Resposta única | Raciocínio em múltiplas etapas |
| **Colaboração** | Entidade única | Pode trabalhar com outros agentes |

### Analogia Simples

- **Chatbot** = Uma pessoa prestativa respondendo perguntas em um balcão de informação
- **Agente de IA** = Um assistente pessoal que pode fazer chamadas, marcar compromissos e concluir tarefas para você

---

## 🚀 Início Rápido: Implemente seu Primeiro Agente

### Opção 1: Modelo Foundry Agents (Recomendado)

```bash
# Inicializar o template de agentes de IA
azd init --template get-started-with-ai-agents

# Implantar no Azure
azd up
```

**O que é implantado:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (para RAG)
- ✅ Azure Container Apps (interface web)
- ✅ Application Insights (monitoramento)

**Tempo:** ~15-20 minutos
**Custo:** ~$100-150/mês (desenvolvimento)

### Opção 2: Agente OpenAI com Prompty

```bash
# Inicializar o template de agente baseado em Prompty
azd init --template agent-openai-python-prompty

# Implantar no Azure
azd up
```

**O que é implantado:**
- ✅ Azure Functions (execução serverless do agente)
- ✅ Azure OpenAI
- ✅ Arquivos de configuração do Prompty
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

O padrão de agente mais simples - um agente que pode usar múltiplas ferramentas.

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
- Bots de suporte ao cliente
- Assistentes de pesquisa
- Agentes de análise de dados

**AZD Template:** `azure-search-openai-demo`

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
- Sistemas de Q&A de documentos
- Pesquisa de conformidade e jurídica

**AZD Template:** `azure-search-openai-demo`

### Padrão 3: Sistema Multi-Agente

Vários agentes especializados trabalhando juntos em tarefas complexas.

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
- Fluxos de trabalho em múltiplas etapas
- Tarefas que requerem diferentes especialidades

**Saiba mais:** [Padrões de Coordenação Multi-Agente](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configurando Ferramentas do Agente

Agentes se tornam poderosos quando podem usar ferramentas. Aqui está como configurar ferramentas comuns:

### Configuração de Ferramentas em Foundry Agents

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

### Configuração de Ambiente

```bash
# Configurar variáveis de ambiente específicas do agente
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Implantar com configuração atualizada
azd deploy
```

---

## 📊 Monitoramento de Agentes

### Integração com Application Insights

Todos os templates de agente AZD incluem Application Insights para monitoramento:

```bash
# Abrir painel de monitoramento
azd monitor --overview

# Ver logs em tempo real
azd monitor --logs

# Ver métricas em tempo real
azd monitor --live
```

### Métricas Principais para Monitorar

| Métrica | Descrição | Meta |
|--------|-----------|------|
| Latência de Resposta | Tempo para gerar a resposta | < 5 segundos |
| Uso de Tokens | Tokens por requisição | Monitorar por custo |
| Taxa de Sucesso de Chamadas de Ferramenta | % de execuções de ferramenta bem-sucedidas | > 95% |
| Taxa de Erro | Requisições de agente com falha | < 1% |
| Satisfação do Usuário | Pontuações de feedback | > 4.0/5.0 |

### Logs Personalizados para Agentes

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

| Padrão | Ambiente de Dev | Produção |
|---------|-----------------|----------|
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
       max_tokens=1000  # Limitar o tamanho da resposta
   )
   ```

4. **Escale para zero quando não estiver em uso**
   ```bash
   # Container Apps escalam automaticamente até zero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Solução de Problemas de Agentes

### Problemas Comuns e Soluções

<details>
<summary><strong>❌ Agente não está respondendo às chamadas de ferramentas</strong></summary>

```bash
# Verifique se as ferramentas estão registradas corretamente
azd show

# Verifique a implantação da OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Verifique os logs do agente
azd monitor --logs
```

**Causas comuns:**
- Assinatura da função da ferramenta incompatível
- Permissões necessárias ausentes
- Endpoint da API inacessível
</details>

<details>
<summary><strong>❌ Alta latência nas respostas do agente</strong></summary>

```bash
# Verifique o Application Insights para gargalos
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
<summary><strong>❌ Agente retornando informações incorretas ou alucinações</strong></summary>

```python
# Aprimorar com prompts de sistema mais eficazes
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
    tools=[FileSearchTool()]  # Ancorar respostas em documentos
)
```
</details>

<details>
<summary><strong>❌ Erros de limite de tokens excedido</strong></summary>

```python
# Implementar gerenciamento da janela de contexto
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

### Exercício 1: Implemente um Agente Básico (20 minutos)

**Objetivo:** Implemente seu primeiro agente de IA usando AZD

```bash
# Etapa 1: Inicializar o modelo
azd init --template get-started-with-ai-agents

# Etapa 2: Fazer login no Azure
azd auth login

# Etapa 3: Implantar
azd up

# Etapa 4: Testar o agente
# Abra a URL mostrada na saída

# Etapa 5: Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Agente responde a perguntas
- [ ] Consegue acessar o painel de monitoramento
- [ ] Recursos limpos com sucesso

### Exercício 2: Adicione uma Ferramenta Personalizada (30 minutos)

**Objetivo:** Estenda um agente com uma ferramenta personalizada

1. Implemente o template do agente
2. Crie uma nova função de ferramenta:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Chamada de API para o serviço meteorológico
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registre a ferramenta no agente
4. Teste se o agente usa a nova ferramenta

**Critérios de Sucesso:**
- [ ] Agente reconhece consultas relacionadas ao clima
- [ ] Ferramenta é chamada corretamente
- [ ] Resposta inclui informações sobre o clima

### Exercício 3: Construa um Agente RAG (45 minutos)

**Objetivo:** Crie um agente que responda perguntas a partir dos seus documentos

```bash
# Implantar o template RAG
azd init --template azure-search-openai-demo
azd up

# Faça upload dos seus documentos
# (Siga o guia de ingestão de dados do template)

# Teste com perguntas específicas do domínio
```

**Critérios de Sucesso:**
- [ ] Agente responde a partir de documentos enviados
- [ ] Respostas incluem citações
- [ ] Sem alucinações em perguntas fora do escopo

---

## 📚 Próximos Passos

Agora que você entende agentes de IA, explore estes tópicos avançados:

| Tópico | Descrição | Link |
|-------|-----------|------|
| **Sistemas Multi-Agente** | Construa sistemas com múltiplos agentes colaborando | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Padrões de Coordenação** | Aprenda padrões de orquestração e comunicação | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Implantação em Produção** | Implantação de agentes pronta para empresa | [Production AI Practices](production-ai-practices.md) |
| **Avaliação de Agentes** | Teste e avalie o desempenho do agente | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

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
- **Lição Anterior**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **Próxima Lição**: [Práticas de IA para Produção](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->