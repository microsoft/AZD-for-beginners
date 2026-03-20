# Agentes de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Integração Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Seguinte**: [Implementação de Modelo AI](ai-model-deployment.md)
- **🚀 Avançado**: [Soluções Multi-Agente](../../examples/retail-scenario.md)

---

## Introdução

Agentes de IA são programas autónomos que podem perceber o seu ambiente, tomar decisões e executar ações para atingir objetivos específicos. Ao contrário de chatbots simples que respondem a comandos, os agentes podem:

- **Usar ferramentas** - Chamar APIs, pesquisar bases de dados, executar código
- **Planear e raciocinar** - Dividir tarefas complexas em passos
- **Aprender a partir do contexto** - Manter memória e adaptar comportamento
- **Colaborar** - Trabalhar com outros agentes (sistemas multi-agente)

Este guia mostra como implementar agentes de IA no Azure usando o Azure Developer CLI (azd).

## Objetivos de Aprendizagem

Ao concluir este guia, irá:
- Compreender o que são agentes de IA e como diferem dos chatbots
- Implementar modelos de agentes de IA pré-construídos utilizando AZD
- Configurar Agentes Foundry para agentes personalizados
- Implementar padrões básicos de agentes (uso de ferramentas, RAG, multi-agente)
- Monitorizar e depurar agentes implementados

## Resultados Esperados

Ao terminar, será capaz de:
- Desdobrar aplicações de agentes de IA no Azure com um único comando
- Configurar ferramentas e funcionalidades dos agentes
- Implementar geração aumentada por recuperação (RAG) com agentes
- Projetar arquiteturas multi-agente para fluxos de trabalho complexos
- Resolver problemas comuns em implementações de agentes

---

## 🤖 O Que Diferencia um Agente de um Chatbot?

| Característica | Chatbot | Agente de IA |
|----------------|---------|--------------|
| **Comportamento** | Responde a comandos | Executa ações autónomas |
| **Ferramentas** | Nenhuma | Pode chamar APIs, pesquisar, executar código |
| **Memória** | Só por sessão | Memória persistente entre sessões |
| **Planeamento** | Resposta única | Raciocínio em múltiplas etapas |
| **Colaboração** | Entidade única | Pode trabalhar com outros agentes |

### Analogia Simples

- **Chatbot** = Uma pessoa prestativa que responde a perguntas numa mesa de informação
- **Agente de IA** = Um assistente pessoal que pode fazer chamadas, marcar compromissos e realizar tarefas por si

---

## 🚀 Arranque Rápido: Desdobre o Seu Primeiro Agente

### Opção 1: Template Foundry Agents (Recomendado)

```bash
# Inicializar o modelo dos agentes de IA
azd init --template get-started-with-ai-agents

# Implementar no Azure
azd up
```

**O que é implementado:**
- ✅ Agentes Foundry
- ✅ Modelos Microsoft Foundry (gpt-4.1)
- ✅ Azure AI Search (para RAG)
- ✅ Azure Container Apps (interface web)
- ✅ Application Insights (monitorização)

**Tempo:** ~15-20 minutos  
**Custo:** ~$100-150/mês (desenvolvimento)

### Opção 2: Agente OpenAI com Prompty

```bash
# Iniciar o modelo de agente baseado no Prompty
azd init --template agent-openai-python-prompty

# Implementar no Azure
azd up
```

**O que é implementado:**
- ✅ Azure Functions (execução serverless do agente)
- ✅ Modelos Microsoft Foundry
- ✅ Ficheiros de configuração Prompty
- ✅ Implementação de agente de exemplo

**Tempo:** ~10-15 minutos  
**Custo:** ~$50-100/mês (desenvolvimento)

### Opção 3: Agente Chat RAG

```bash
# Inicializar o modelo de chat RAG
azd init --template azure-search-openai-demo

# Implantar no Azure
azd up
```

**O que é implementado:**
- ✅ Modelos Microsoft Foundry
- ✅ Azure AI Search com dados de amostra
- ✅ Pipeline de processamento de documentos
- ✅ Interface de chat com citações

**Tempo:** ~15-25 minutos  
**Custo:** ~$80-150/mês (desenvolvimento)

### Opção 4: AZD AI Agent Init (Baseado em Manifesto)

Se tiver um ficheiro manifesto de agente, pode usar o comando `azd ai` para criar diretamente um projeto Foundry Agent Service:

```bash
# Instalar a extensão de agentes de IA
azd extension install azure.ai.agents

# Inicializar a partir de um manifesto de agente
azd ai agent init -m agent-manifest.yaml

# Implantar no Azure
azd up
```

**Quando usar `azd ai agent init` vs `azd init --template`:**

| Abordagem | Melhor Para | Como Funciona |
|-----------|-------------|---------------|
| `azd init --template` | Começar a partir de uma app funcional de exemplo | Clona um repositório completo com código + infra |
| `azd ai agent init -m` | Construir a partir do seu próprio manifesto de agente | Cria a estrutura do projeto a partir da definição do agente |

> **Dica:** Use `azd init --template` para aprender (Opções 1-3 acima). Use `azd ai agent init` para construir agentes de produção com os seus próprios manifestos. Veja [Comandos AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para referência completa.

---

## 🏗️ Padrões de Arquitetura de Agentes

### Padrão 1: Agente Único com Ferramentas

O padrão mais simples de agente – um agente que pode usar múltiplas ferramentas.

```mermaid
graph TD
    UI[Interface do Utilizador] --> Agent[Agente de IA<br/>gpt-4.1]
    Agent --> Search[Ferramenta de Pesquisa]
    Agent --> Database[Ferramenta de Base de Dados]
    Agent --> API[Ferramenta API]
```
**Ideal para:**
- Bots de suporte ao cliente
- Assistentes de pesquisa
- Agentes de análise de dados

**Template AZD:** `azure-search-openai-demo`

### Padrão 2: Agente RAG (Geração Aumentada por Recuperação)

Um agente que recupera documentos relevantes antes de gerar respostas.

```mermaid
graph TD
    Query[Consulta do Utilizador] --> RAG[Agente RAG]
    RAG --> Vector[Pesquisa Vetorial]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documentos --> LLM
    LLM --> Response[Resposta com Citações]
```
**Ideal para:**
- Bases de conhecimento empresariais
- Sistemas de perguntas e respostas sobre documentos
- Pesquisa de conformidade e jurídica

**Template AZD:** `azure-search-openai-demo`

### Padrão 3: Sistema Multi-Agente

Múltiplos agentes especializados que trabalham em conjunto em tarefas complexas.

```mermaid
graph TD
    Orchestrator[Agente Orquestrador] --> Research[Agente de Investigação<br/>gpt-4.1]
    Orchestrator --> Writer[Agente Escritor<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Agente Revisor<br/>gpt-4.1]
```
**Ideal para:**
- Geração de conteúdo complexo
- Fluxos de trabalho em múltiplas etapas
- Tarefas que exigem diferentes especializações

**Saiba Mais:** [Padrões de Coordenação Multi-Agente](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuração de Ferramentas para Agentes

Os agentes tornam-se poderosos quando podem usar ferramentas. Eis como configurar as ferramentas mais comuns:

### Configuração de Ferramentas em Agentes Foundry

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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configuração do Ambiente

```bash
# Definir variáveis de ambiente específicas do agente
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Implantar com configuração atualizada
azd deploy
```

---

## 📊 Monitorização de Agentes

### Integração com Application Insights

Todos os templates AZD para agentes incluem Application Insights para monitorização:

```bash
# Abrir painel de monitorização
azd monitor --overview

# Ver registos ao vivo
azd monitor --logs

# Ver métricas ao vivo
azd monitor --live
```

### Métricas-Chave a Acompanhar

| Métrica | Descrição | Objetivo |
|---------|-----------|----------|
| Latência de Resposta | Tempo para gerar resposta | < 5 segundos |
| Utilização de Tokens | Tokens por pedido | Monitorizar para custo |
| Taxa de Sucesso em Chamadas de Ferramentas | % de execuções bem-sucedidas | > 95% |
| Taxa de Erro | Pedidos falhados do agente | < 1% |
| Satisfação do Utilizador | Pontuações de feedback | > 4.0/5.0 |

### Logging Personalizado para Agentes

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Configurar o Azure Monitor com OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **Nota:** Instale os pacotes necessários: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Considerações sobre Custo

### Custos Mensais Estimados por Padrão

| Padrão | Ambiente de Desenvolvimento | Produção |
|--------|-----------------------------|----------|
| Agente Único | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agentes) | $150-300 | $500-1,500 |
| Multi-Agente Empresarial | $300-500 | $1,500-5,000+ |

### Dicas para Otimizar Custos

1. **Use gpt-4.1-mini para tarefas simples**  
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```
  
2. **Implemente cache para consultas repetidas**  
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```
  
3. **Defina limites de tokens por execução**  
   ```python
   # Definir max_completion_tokens ao executar o agente, não durante a criação
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Limitar o comprimento da resposta
   )
   ```
  
4. **Escale para zero quando não estiver a usar**  
   ```bash
   # As aplicações de contentores escalam automaticamente para zero
   azd env set MIN_REPLICAS "0"
   ```
  
---

## 🔧 Resolução de Problemas com Agentes

### Problemas Comuns e Soluções

<details>
<summary><strong>❌ Agente não responde a chamadas de ferramentas</strong></summary>

```bash
# Verifique se as ferramentas estão devidamente registadas
azd show

# Verificar a implementação do OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Verifique os registos do agente
azd monitor --logs
```
  
**Causas comuns:**  
- Incompatibilidade na assinatura da função da ferramenta  
- Permissões necessárias em falta  
- Endpoint da API inacessível  
</details>

<details>
<summary><strong>❌ Latência elevada nas respostas do agente</strong></summary>

```bash
# Verifique o Application Insights para gargalos
azd monitor --live

# Considere usar um modelo mais rápido
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```
  
**Dicas de otimização:**  
- Use respostas em streaming  
- Implemente cache de respostas  
- Reduza o tamanho da janela de contexto  
</details>

<details>
<summary><strong>❌ Agente retorna informação incorreta ou “alucinada”</strong></summary>

```python
# Melhorar com prompts de sistema mais eficazes
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Adicionar recuperação para fundamentação
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Fundamentar respostas em documentos
)
```
</details>

<details>
<summary><strong>❌ Erros de limite de tokens excedido</strong></summary>

```python
# Implementar gestão da janela de contexto
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Exercícios Práticos

### Exercício 1: Desdobre um Agente Básico (20 minutos)

**Objetivo:** Desdobrar o seu primeiro agente de IA usando AZD

```bash
# Passo 1: Inicializar o modelo
azd init --template get-started-with-ai-agents

# Passo 2: Iniciar sessão no Azure
azd auth login

# Passo 3: Implantar
azd up

# Passo 4: Testar o agente
# Saída esperada após a implantação:
#   Implantação concluída!
#   Endpoint: https://<app-name>.<region>.azurecontainerapps.io
# Abra o URL mostrado na saída e tente fazer uma pergunta

# Passo 5: Ver monitorização
azd monitor --overview

# Passo 6: Limpar espaços
azd down --force --purge
```
  
**Critérios de Sucesso:**  
- [ ] Agente responde a perguntas  
- [ ] Pode aceder ao painel de monitorização via `azd monitor`  
- [ ] Recursos limpos com sucesso  

### Exercício 2: Adicionar uma Ferramenta Personalizada (30 minutos)

**Objetivo:** Estender um agente com uma ferramenta personalizada

1. Implemente o template do agente:  
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Crie uma nova função de ferramenta no código do agente:  
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Chamada API para serviço de meteorologia
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registe a ferramenta no agente:  
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. Reimplemente e teste:  
   ```bash
   azd deploy
   # Perguntar: "Qual é o tempo em Seattle?"
   # Esperado: Agente chama get_weather("Seattle") e retorna informação sobre o tempo
   ```
  
**Critérios de Sucesso:**  
- [ ] Agente reconhece perguntas relacionadas com o tempo  
- [ ] Ferramenta é chamada corretamente  
- [ ] Resposta inclui informação meteorológica  

### Exercício 3: Construir um Agente RAG (45 minutos)

**Objetivo:** Criar um agente que responda a perguntas a partir dos seus documentos

```bash
# Passo 1: Implantar o modelo RAG
azd init --template azure-search-openai-demo
azd up

# Passo 2: Carregar os seus documentos
# Coloque os ficheiros PDF/TXT na diretoria data/, depois execute:
python scripts/prepdocs.py

# Passo 3: Testar com perguntas específicas do domínio
# Abra a URL da aplicação web a partir da saída do azd up
# Faça perguntas sobre os seus documentos carregados
# As respostas devem incluir referências de citação como [doc.pdf]
```
  
**Critérios de Sucesso:**  
- [ ] Agente responde a partir dos documentos carregados  
- [ ] Respostas incluem citações  
- [ ] Sem alucinações em perguntas fora do âmbito  

---

## 📚 Próximos Passos

Agora que compreende os agentes de IA, explore estes tópicos avançados:

| Tópico | Descrição | Link |
|--------|-----------|------|
| **Sistemas Multi-Agente** | Construir sistemas com múltiplos agentes a colaborar | [Exemplo Multi-Agente no Retalho](../../examples/retail-scenario.md) |
| **Padrões de Coordenação** | Aprenda orquestração e padrões de comunicação | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Implementação em Produção** | Desdobramento preparado para a empresa | [Práticas AI para Produção](../chapter-08-production/production-ai-practices.md) |
| **Avaliação de Agentes** | Testar e avaliar desempenho dos agentes | [Resolução de Problemas AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Laboratório de Workshop AI** | Prático: Prepare a sua solução AI para AZD | [Laboratório de Workshop AI](ai-workshop-lab.md) |

---

## 📖 Recursos Adicionais

### Documentação Oficial
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Início Rápido Azure AI Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Framework Semantic Kernel Agent](https://learn.microsoft.com/semantic-kernel/)

### Templates AZD para Agentes
- [Começar com Agentes AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Recursos Comunitários
- [Awesome AZD - Templates de Agentes](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Discord Azure AI](https://discord.gg/microsoft-azure)
- [Discord Microsoft Foundry](https://discord.gg/nTYy5BXMWG)

### Skills de Agente para o Seu Editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Instale skills de agentes AI reutilizáveis para desenvolvimento Azure no GitHub Copilot, Cursor ou qualquer agente suportado. Inclui skills para [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deploy](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), e [diagnóstico](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navegação**
- **Lição Anterior**: [Integração Microsoft Foundry](microsoft-foundry-integration.md)
- **Lição Seguinte**: [Implementação de Modelo AI](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em conta que traduções automatizadas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional efetuada por um humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->