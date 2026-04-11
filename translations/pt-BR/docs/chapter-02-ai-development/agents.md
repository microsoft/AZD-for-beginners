# Agentes de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento com foco em IA
- **⬅️ Anterior**: [Integração com Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Próximo**: [Implantação de Modelos de IA](ai-model-deployment.md)
- **🚀 Avançado**: [Soluções Multi-Agente](../../examples/retail-scenario.md)

---

## Introdução

Agentes de IA são programas autônomos que podem perceber seu ambiente, tomar decisões e executar ações para alcançar objetivos específicos. Diferente de chatbots simples que respondem a prompts, agentes podem:

- **Usar ferramentas** - Chamar APIs, pesquisar bancos de dados, executar código
- **Planejar e raciocinar** - Dividir tarefas complexas em etapas
- **Aprender com o contexto** - Manter memória e adaptar o comportamento
- **Colaborar** - Trabalhar com outros agentes (sistemas multi-agente)

Este guia mostra como implantar agentes de IA no Azure usando o Azure Developer CLI (azd).

> **Nota de validação (2026-03-25):** Este guia foi revisado contra `azd` `1.23.12` e `azure.ai.agents` `0.1.18-preview`. A experiência `azd ai` ainda está em preview, então verifique a ajuda da extensão se suas flags instaladas diferirem.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Entender o que são agentes de IA e como eles diferem de chatbots
- Implantar templates pré-construídos de agentes de IA usando AZD
- Configurar Foundry Agents para agentes personalizados
- Implementar padrões básicos de agente (uso de ferramentas, RAG, multi-agente)
- Monitorar e depurar agentes implantados

## Resultados de Aprendizagem

Ao concluir, você será capaz de:
- Implantar aplicações de agentes de IA no Azure com um único comando
- Configurar ferramentas e capacidades dos agentes
- Implementar geração aumentada por recuperação (RAG) com agentes
- Projetar arquiteturas multi-agente para fluxos de trabalho complexos
- Solucionar problemas comuns de implantação de agentes

---

## 🤖 O que torna um agente diferente de um chatbot?

| Recurso | Chatbot | Agente de IA |
|---------|---------|----------|
| **Comportamento** | Responde a prompts | Realiza ações autônomas |
| **Ferramentas** | Nenhuma | Pode chamar APIs, pesquisar, executar código |
| **Memória** | Apenas baseada na sessão | Memória persistente entre sessões |
| **Planejamento** | Resposta única | Raciocínio em múltiplas etapas |
| **Colaboração** | Entidade única | Pode trabalhar com outros agentes |

### Analogia Simples

- **Chatbot** = Uma pessoa prestativa respondendo perguntas em um balcão de informações
- **Agente de IA** = Um assistente pessoal que pode fazer ligações, agendar compromissos e concluir tarefas para você

---

## 🚀 Início Rápido: Implante Seu Primeiro Agente

### Opção 1: Modelo Foundry Agents (Recomendado)

```bash
# Inicializar o template dos agentes de IA
azd init --template get-started-with-ai-agents

# Implantar no Azure
azd up
```

**O que é implantado:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (for RAG)
- ✅ Azure Container Apps (web interface)
- ✅ Application Insights (monitoramento)

**Tempo:** ~15-20 minutos
**Custo:** ~$100-150/mês (desenvolvimento)

### Opção 2: Agente OpenAI com Prompty

```bash
# Inicialize o modelo de agente baseado no Prompty
azd init --template agent-openai-python-prompty

# Implante no Azure
azd up
```

**O que é implantado:**
- ✅ Azure Functions (execução serverless do agente)
- ✅ Microsoft Foundry Models
- ✅ Arquivos de configuração do Prompty
- ✅ Implementação de agente de exemplo

**Tempo:** ~10-15 minutos
**Custo:** ~$50-100/mês (desenvolvimento)

### Opção 3: Agente de Chat RAG

```bash
# Inicializar modelo de chat RAG
azd init --template azure-search-openai-demo

# Implantar no Azure
azd up
```

**O que é implantado:**
- ✅ Microsoft Foundry Models
- ✅ Azure AI Search com dados de exemplo
- ✅ Pipeline de processamento de documentos
- ✅ Interface de chat com citações

**Tempo:** ~15-25 minutos
**Custo:** ~$80-150/mês (desenvolvimento)

### Opção 4: AZD AI Agent Init (Visualização baseada em manifesto ou template)

Se você tiver um arquivo de manifesto do agente, pode usar o comando `azd ai` para criar a estrutura de um projeto Foundry Agent Service diretamente. Versões recentes em preview também adicionaram suporte à inicialização baseada em templates, então o fluxo exato de prompts pode variar ligeiramente dependendo da versão da extensão instalada.

```bash
# Instale a extensão de agentes de IA
azd extension install azure.ai.agents

# Opcional: verifique a versão prévia instalada
azd extension show azure.ai.agents

# Inicialize a partir de um manifesto de agente
azd ai agent init -m agent-manifest.yaml

# Implante no Azure
azd up
```

**Quando usar `azd ai agent init` vs `azd init --template`:**

| Abordagem | Melhor Para | Como Funciona |
|----------|----------|------|
| `azd init --template` | Iniciar a partir de um app de exemplo funcional | Clona um repositório de template completo com código + infra |
| `azd ai agent init -m` | Construir a partir do seu próprio manifesto de agente | Gera a estrutura do projeto a partir da definição do agente |

> **Dica:** Use `azd init --template` ao aprender (Opções 1-3 acima). Use `azd ai agent init` ao construir agentes de produção com seus próprios manifestos. Veja [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para referência completa.

---

## 🏗️ Padrões de Arquitetura de Agentes

### Padrão 1: Agente Único com Ferramentas

O padrão de agente mais simples - um agente que pode usar múltiplas ferramentas.

```mermaid
graph TD
    UI[Interface do Usuário] --> Agent[Agente de IA<br/>gpt-4.1]
    Agent --> Search[Ferramenta de Busca]
    Agent --> Database[Ferramenta de Banco de Dados]
    Agent --> API[Ferramenta de API]
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
    Query[Consulta do Usuário] --> RAG[Agente RAG]
    RAG --> Vector[Busca Vetorial]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documentos --> LLM
    LLM --> Response[Resposta com Citações]
```
**Ideal para:**
- Bases de conhecimento empresariais
- Sistemas de Q&A de documentos
- Pesquisa jurídica e de conformidade

**Template AZD:** `azure-search-openai-demo`

### Padrão 3: Sistema Multi-Agente

Múltiplos agentes especializados trabalhando juntos em tarefas complexas.

```mermaid
graph TD
    Orchestrator[Agente Orquestrador] --> Research[Agente de Pesquisa<br/>gpt-4.1]
    Orchestrator --> Writer[Agente Escritor<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Agente Revisor<br/>gpt-4.1]
```
**Ideal para:**
- Geração de conteúdo complexa
- Fluxos de trabalho multi-etapa
- Tarefas que requerem diferentes expertises

**Saiba Mais:** [Padrões de Coordenação Multi-Agente](../chapter-06-pre-deployment/coordination-patterns.md)

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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configuração de Ambiente

```bash
# Configurar variáveis de ambiente específicas do agente
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Implantar com configuração atualizada
azd deploy
```

---

## 📊 Monitoramento de Agentes

### Integração com Application Insights

Todos os templates AZD para agentes incluem Application Insights para monitoramento:

```bash
# Abrir painel de monitoramento
azd monitor --overview

# Visualizar logs em tempo real
azd monitor --logs

# Visualizar métricas em tempo real
azd monitor --live
```

### Métricas Chave a Monitorar

| Métrica | Descrição | Meta |
|--------|-------------|--------|
| Latência de Resposta | Tempo para gerar resposta | < 5 segundos |
| Uso de Tokens | Tokens por requisição | Monitorar por custo |
| Taxa de Sucesso em Chamadas de Ferramentas | % de execuções de ferramenta bem-sucedidas | > 95% |
| Taxa de Erro | Requisições de agente falhadas | < 1% |
| Satisfação do Usuário | Pontuações de feedback | > 4.0/5.0 |

### Logs Personalizados para Agentes

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Configurar o Azure Monitor com o OpenTelemetry
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

## 💰 Considerações de Custo

### Custos Mensais Estimados por Padrão

| Padrão | Ambiente de Dev | Produção |
|---------|-----------------|------------|
| Agente Único | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agentes) | $150-300 | $500-1,500 |
| Multi-Agente Empresarial | $300-500 | $1,500-5,000+ |

### Dicas de Otimização de Custo

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
   # Defina max_completion_tokens ao executar o agente, não durante a criação
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Limite o comprimento da resposta
   )
   ```

4. **Escalar para zero quando não estiver em uso**
   ```bash
   # Os Container Apps escalam automaticamente até zero
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Solução de Problemas de Agentes

### Problemas Comuns e Soluções

<details>
<summary><strong>❌ Agente não respondendo a chamadas de ferramentas</strong></summary>

```bash
# Verifique se as ferramentas estão registradas corretamente
azd show

# Verifique a implantação do OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Verifique os logs do agente
azd monitor --logs
```

**Causas comuns:**
- Incompatibilidade na assinatura da função da ferramenta
- Permissões necessárias ausentes
- endpoint da API não acessível
</details>

<details>
<summary><strong>❌ Alta latência nas respostas do agente</strong></summary>

```bash
# Verifique o Application Insights em busca de gargalos
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
<summary><strong>❌ Agente retornando informações incorretas ou alucinações</strong></summary>

```python
# Melhorar com prompts de sistema melhores
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
# Implementar o gerenciamento da janela de contexto
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

### Exercício 1: Implante um Agente Básico (20 minutos)

**Objetivo:** Implemente seu primeiro agente de IA usando AZD

```bash
# Etapa 1: Inicializar o modelo
azd init --template get-started-with-ai-agents

# Etapa 2: Fazer login no Azure
azd auth login
# Se você trabalha entre locatários, adicione --tenant-id <tenant-id>

# Etapa 3: Implantar
azd up

# Etapa 4: Testar o agente
# Saída esperada após a implantação:
#   Implantação concluída!
#   Ponto de extremidade: https://<app-name>.<region>.azurecontainerapps.io
# Abra a URL mostrada na saída e tente fazer uma pergunta

# Etapa 5: Visualizar o monitoramento
azd monitor --overview

# Etapa 6: Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Agente responde a perguntas
- [ ] Pode acessar o painel de monitoramento via `azd monitor`
- [ ] Recursos limpos com sucesso

### Exercício 2: Adicione uma Ferramenta Personalizada (30 minutos)

**Objetivo:** Estender um agente com uma ferramenta personalizada

1. Implante o template do agente:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Crie uma nova função de ferramenta no código do seu agente:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Chamada de API para o serviço meteorológico
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registre a ferramenta com o agente:
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
4. Reimplante e teste:
   ```bash
   azd deploy
   # Pergunta: "Como está o tempo em Seattle?"
   # Esperado: O agente chama get_weather("Seattle") e retorna informações do tempo
   ```

**Critérios de Sucesso:**
- [ ] Agente reconhece consultas relacionadas ao clima
- [ ] A ferramenta é chamada corretamente
- [ ] A resposta inclui informações sobre o clima

### Exercício 3: Construa um Agente RAG (45 minutos)

**Objetivo:** Criar um agente que responde a perguntas a partir dos seus documentos

```bash
# Etapa 1: Implantar o template RAG
azd init --template azure-search-openai-demo
azd up

# Etapa 2: Faça upload dos seus documentos
# Coloque arquivos PDF/TXT no diretório data/, em seguida execute:
python scripts/prepdocs.py

# Etapa 3: Teste com perguntas específicas do domínio
# Abra a URL do aplicativo web a partir da saída do azd up
# Faça perguntas sobre os documentos que você enviou
# As respostas devem incluir referências de citação como [doc.pdf]
```

**Critérios de Sucesso:**
- [ ] Agente responde a partir dos documentos carregados
- [ ] Respostas incluem citações
- [ ] Sem alucinação em perguntas fora do escopo

---

## 📚 Próximos Passos

Agora que você entende agentes de IA, explore estes tópicos avançados:

| Tópico | Descrição | Link |
|-------|-------------|------|
| **Sistemas Multi-Agente** | Construa sistemas com múltiplos agentes colaborando | [Exemplo Multi-Agente de Varejo](../../examples/retail-scenario.md) |
| **Padrões de Coordenação** | Aprenda orquestração e padrões de comunicação | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Implantação em Produção** | Implantação de agentes pronta para empresa | [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md) |
| **Avaliação de Agentes** | Teste e avalie o desempenho do agente | [Solução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Laboratório do Workshop de IA** | Mão na massa: Prepare sua solução de IA para AZD | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Recursos Adicionais

### Documentação Oficial
- [Azure AI Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure AI Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### Templates AZD para Agentes
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Recursos da Comunidade
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Skills de Agente para seu Editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Instale skills reutilizáveis de agentes de IA para desenvolvimento no Azure no GitHub Copilot, Cursor ou qualquer agente suportado. Inclui skills para [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), e [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navegação**
- **Lição Anterior**: [Integração com Microsoft Foundry](microsoft-foundry-integration.md)
- **Próxima Lição**: [Implantação de Modelos de IA](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional realizada por tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->