# Agentes de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Integração Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Próximo**: [Implantação de Modelo de IA](ai-model-deployment.md)
- **🚀 Avançado**: [Soluções Multi-Agentes](../../examples/retail-scenario.md)

---

## Introdução

Agentes de IA são programas autônomos que podem perceber seu ambiente, tomar decisões e executar ações para alcançar objetivos específicos. Diferente de chatbots simples que respondem a prompts, agentes podem:

- **Usar ferramentas** - Chamar APIs, buscar em bancos de dados, executar código
- **Planejar e raciocinar** - Dividir tarefas complexas em etapas
- **Aprender com o contexto** - Manter memória e adaptar comportamento
- **Colaborar** - Trabalhar com outros agentes (sistemas multi-agentes)

Este guia mostra como implantar agentes de IA no Azure usando Azure Developer CLI (azd).

Usar o contexto da conversa não é treinamento do modelo: memória persistente, controle de acesso e retenção devem ser implementados/configurados pela aplicação.

> **Revisão de lançamento (2026-11-04):** Exemplos CLI foram verificados contra a documentação/fonte `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` e `azure.ai.evaluations` `1.0.0-beta.2`, não em um ambiente Azure ativo. Use `azd >= 1.37.0` para o fluxo de trabalho combinado. Veja [mudanças e correções recentes](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) antes de atualizar projetos antigos.

## Objetivos de Aprendizagem

Ao completar este guia, você irá:
- Entender o que são agentes de IA e como eles diferem de chatbots
- Implantar modelos de agentes de IA pré-construídos usando AZD
- Configurar Agentes Foundry para agentes personalizados
- Implementar padrões básicos de agentes (uso de ferramentas, RAG, multi-agente)
- Monitorar e depurar agentes implantados

## Resultados de Aprendizagem

Após a conclusão, você será capaz de:
- Implantar aplicações de agentes de IA no Azure com um único comando
- Configurar ferramentas e capacidades dos agentes
- Implementar geração aumentada por recuperação (RAG) com agentes
- Projetar arquiteturas multi-agente para fluxos de trabalho complexos
- Solucionar problemas comuns na implantação de agentes

---

## 🤖 O Que Torna um Agente Diferente de um Chatbot?

| Recurso | Chatbot | Agente de IA |
|---------|---------|----------|
| **Comportamento** | Responde a prompts | Toma ações autônomas |
| **Ferramentas** | Pode usar recuperação ou ferramentas | Normalmente usa ferramentas em um ciclo orientado a objetivos |
| **Memória** | Dependente da aplicação | Memória persistente somente se explicitamente implementada |
| **Planejamento** | Resposta única | Raciocínio em múltiplas etapas |
| **Colaboração** | Entidade única | Pode trabalhar com outros agentes |

### Analogia Simples

- **Chatbot** = Uma pessoa prestativa respondendo perguntas em um balcão de informações
- **Agente de IA** = Um assistente pessoal que pode fazer ligações, marcar compromissos e completar tarefas para você

---

## 🚀 Início Rápido: Implante Seu Primeiro Agente

Escolha uma opção em um **novo diretório de trabalho vazio**. O `.` final irá inicializar ali; sem um destino explícito, o AZD atual pode criar um subdiretório nomeado pelo template e não muda o diretório do shell. Mantenha templates/ambientes separados em diretórios diferentes.

Os intervalos de tempo/custo abaixo são ilustrativos, não orçamentos validados. Verifique os pré-requisitos atuais de cada exemplo, preços, cotas de modelo e serviços opcionais antes da implantação.

### Opção 1: Modelo Foundry Agents (Recomendado)

```bash
# Initialize the AI agents template
azd init --template get-started-with-ai-agents .

# Deploy to Azure
azd up
```

**O que é implantado:** A infraestrutura atual e as opções selecionadas do exemplo determinam o modelo, ferramentas, hospedagem e recursos de monitoramento. Revise seu README e `infra/` antes do provisionamento; não presuma que todo template de agente inclui Busca ou interface web.

**Tempo:** ~15-20 minutos
**Custo:** ~$100-150/mês (desenvolvimento)

### Opção 2: Agentes de Escrita Criativa com Prompty

```bash
# Initialize the Prompty-based agent template
azd init --template https://github.com/Azure-Samples/contoso-creative-writer .

# Deploy to Azure
azd up
```

**O que é implantado:** Um exemplo multi-agente FastAPI/Prompty usando Azure OpenAI, Bing Grounding e Azure AI Search. O antigo repositório `agent-openai-python-prompty` redireciona para aqui; não é um template minimalista Azure Functions para agente meteorológico. Siga seu README atual para hospedagem, cotas de modelo e pré-requisitos Bing Grounding.

**Tempo:** ~10-15 minutos
**Custo:** ~$50-100/mês (desenvolvimento)

### Opção 3: Agente de Chat RAG

```bash
# Initialize RAG chat template
azd init --template azure-search-openai-demo .

# Deploy to Azure
azd up
```

**O que é implantado:**
- ✅ Modelos Microsoft Foundry
- ✅ Azure AI Search com dados de exemplo
- ✅ Pipeline de processamento de documentos
- ✅ Interface de chat com citações

**Tempo:** ~15-25 minutos
**Custo:** ~$80-150/mês (desenvolvimento)

### Opção 4: AZD AI Agent Init (Prévia do Modelo de Projeto)

Use `azd ai agent init` interativamente, ou adote um projeto atual de agente `azure.yaml` com `--template`/`-t`. A antiga opção `--manifest`/`-m` é um alias depreciado, não um conversor para manifests legados.

```bash
# Install the AI agents extension
azd extension install azure.ai.agents

# Optional: verify the installed preview version
azd extension show azure.ai.agents

# Initialize from a current agent project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml

# Deploy to Azure
azd up

# Test the deployed agent (shows latency + time-to-first-byte)
azd ai agent invoke
```

**Quando usar `azd ai agent init` vs `azd init --template`:**

| Abordagem | Melhor Para | Como Funciona |
|----------|----------|------|
| `azd init --template` | Começar a partir de um app exemplo funcional | Clona um repositório de template completo com código + infra |
| `azd ai agent init --template` | Adotar um projeto atual Foundry de agente | Usa um documento de projeto `azure.yaml` e suas definições |

> **Dica:** Use `azd init --template` ao aprender (Opções 1-3 acima). Use `azd ai agent init` para o fluxo de trabalho de agente Foundry. Para adicionar uma definição direta de agente a um projeto existente, veja as [orientações de inicialização e migração](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

Após `azd up`, use `azd ai agent invoke` para testar, a extensão `azure.ai.evaluations` separada (`azd ai eval init`, `generate` e `run start`) para medir a qualidade e `azd ai agent optimize` para melhorá-la usando a nova configuração de avaliação. Agents beta.22 substituiu o fluxo de trabalho de avaliação legado e alterou o formato `--config` da otimização. Veja [migração da avaliação](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migração da otimização](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration) antes de reutilizar exemplos mais antigos.

---

## 🏗️ Padrões de Arquitetura de Agentes

### Padrão 1: Agente Único com Ferramentas

O padrão de agente mais simples - um agente que pode usar múltiplas ferramentas.

```mermaid
graph TD
    UI[User Interface] --> Agent[AI Agent<br/>gpt-4.1]
    Agent --> Search[Search Tool]
    Agent --> Database[Database Tool]
    Agent --> API[API Tool]
```

**Melhor para:**
- Bots de suporte ao cliente
- Assistentes de pesquisa
- Agentes de análise de dados

**Exemplo de aplicação relacionada:** `azure-search-openai-demo` demonstra RAG, não um loop genérico de agente com ferramentas arbitrárias.

### Padrão 2: Agente RAG (Geração Aumentada por Recuperação)

Um agente que recupera documentos relevantes antes de gerar respostas.

```mermaid
graph TD
    Query[User Query] --> RAG[RAG Agent]
    RAG --> Vector[Vector Search]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Documents --> LLM
    LLM --> Response[Response with Citations]
```

**Melhor para:**
- Bases de conhecimento empresariais
- Sistemas de perguntas e respostas baseados em documentos
- Pesquisa de conformidade e jurídica

**Modelo AZD:** `azure-search-openai-demo`

### Padrão 3: Sistema Multi-Agentes

Múltiplos agentes especializados trabalhando juntos em tarefas complexas.

```mermaid
graph TD
    Orchestrator[Orchestrator Agent] --> Research[Research Agent<br/>gpt-4.1]
    Orchestrator --> Writer[Writer Agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Reviewer Agent<br/>gpt-4.1]
```

**Melhor para:**
- Geração complexa de conteúdo
- Fluxos de trabalho de múltiplas etapas
- Tarefas que requerem diferentes especializações

**Saiba Mais:** [Padrões de Coordenação Multi-Agentes](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configurando Ferramentas do Agente

Agentes se tornam poderosos quando podem usar ferramentas. Aqui está como configurar ferramentas comuns:

### Configuração de Ferramentas em Agentes Foundry

Este **fragmento clássico do SDK de Serviço do Agente** tem como alvo `azure-ai-projects==1.0.0` e `azure-ai-agents==1.1.0` com `azure-identity`. Ele não é a versão mais recente da API versioned-agent/Responses usada por alguns modelos atuais do Foundry, nem a extensão `azure.ai.agents` AZD (um pacote diferente). Não misture essas gerações de API. Defina `PROJECT_ENDPOINT` para um endpoint clássico de projeto Foundry e `MODEL_DEPLOYMENT_NAME` para uma implantação de modelo suportada existente; autentique com `az login` localmente e conceda as permissões necessárias ao projeto.

```python
# agent_config.py
import os
from azure.ai.projects import AIProjectClient
from azure.ai.agents.models import FunctionTool
from azure.identity import DefaultAzureCredential

def search_knowledge_base(query: str) -> str:
    """Search the demonstration knowledge base.

    :param query: Search text.
    :return: Matching demonstration information.
    """
    # Local fixture only, not a production search implementation.
    return "Demo policy: returns are accepted within 30 days."

project_client = AIProjectClient(
    endpoint=os.environ["PROJECT_ENDPOINT"],
    credential=DefaultAzureCredential(),
)
search_tool = FunctionTool(functions={search_knowledge_base})
project_client.agents.enable_auto_function_calls(search_tool)
agent = project_client.agents.create_agent(
    model=os.environ["MODEL_DEPLOYMENT_NAME"],
    name="Support Agent",
    instructions="Use search_knowledge_base for policy questions. Label results as demo data.",
    tools=search_tool.definitions,
)
```

Registrar um esquema de função não executa Python no serviço. Neste SDK, `enable_auto_function_calls` mais `agents.runs.create_and_process(...)` executa os callbacks registrados no seu processo cliente. Veja o [exemplo lançado do SDK](https://github.com/Azure/azure-sdk-for-python/blob/azure-ai-agents_1.1.0/sdk/ai/azure-ai-agents/samples/agents_tools/sample_agents_auto_function_call.py). Feche o cliente e exclua agentes/threads de demonstração quando terminar.

### Configuração do Ambiente

Os seguintes nomes são **entradas ilustrativas de modelos personalizados**, não switches embutidos do AZD. Primeiro canalize cada valor através de `infra/main.parameters.json`, infraestrutura e código da aplicação. `azd env set` sozinho não altera as ferramentas ou instruções do agente.

```bash
# Set up agent-specific environment variables
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Apply wired infrastructure and application changes
azd up
```

---

## 📊 Monitoramento de Agentes

### Integração com Application Insights

Se o modelo selecionado provisiona o Application Insights e configura a instrumentação:

```bash
# Open monitoring dashboard
azd monitor --overview

# Open the Application Insights logs view (not a streaming log tail)
azd monitor --logs

# View live metrics
azd monitor --live
```

### Métricas Principais para Monitorar

| Métrica | Descrição | Meta |
|--------|-------------|--------|
| Latência da Resposta | Tempo para gerar a resposta | < 5 segundos |
| Uso de Tokens | Tokens por solicitação | Monitorar para custo |
| Taxa de Sucesso na Chamada de Ferramentas | % de execuções de ferramentas bem-sucedidas | > 95% |
| Taxa de Erro | Solicitações de agente falhadas | < 1% |
| Satisfação do Usuário | Pontuação de feedback | > 4.0/5.0 |

### Registro Personalizado para Agentes

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Configure Azure Monitor with OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "query_length": len(user_query),  # Do not log raw prompts or personal data
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **Nota:** Instale o pacote necessário: `pip install azure-monitor-opentelemetry`. Ele traz as dependências do OpenTelemetry; o namespace de importação não é um requisito para instalar um pacote chamado `opentelemetry`.

---

## 💰 Considerações de Custo

### Custos Mensais Estimados por Padrão

Estes são intervalos ilustrativos para planejamento, não cotações ou limites de gastos. Região, tokens de modelo, SKUs de Pesquisa/cálculo, sessões de ferramentas, armazenamento e tráfego podem ultrapassá-los. Verifique a orientação de custos do exemplo e preços do Azure antes de `azd up`.

| Padrão | Ambiente de Desenvolvimento | Produção |
|---------|-----------------|------------|
| Agente Único | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agentes) | $150-300 | $500-1,500 |
| Multi-Agente Empresarial | $300-500 | $1,500-5,000+ |

### Dicas de Otimização de Custo

1. **Use gpt-4.1-mini para tarefas simples** (apenas se seu modelo consumir esta entrada)
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implemente cache com escopo para consultas seguras e repetidas.** Inclua autorização de locatário/usuário, implantação de modelo, instruções e versão de recuperação na chave do cache; defina um tempo de expiração. Não compartilhe respostas de conversa privada através de um cache somente de consulta de processo amplo. O objeto do agente SDK não possui método genérico `agent.run()`.

3. **Defina limites de tokens por execução**
   ```python
   # Set max_completion_tokens when running the agent, not during creation
   run = project_client.agents.runs.create_and_process(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Budget across the run; may finish as incomplete
   )
   ```

4. **Escale os Container Apps elegíveis para zero quando não estiverem em uso**
   ```bash
   # Custom-template input: must map to template.scale.minReplicas
   azd env set MIN_REPLICAS "0"
   ```
   Aplique a alteração de infraestrutura com `azd provision` ou `azd up`. Escalar para zero requer um gatilho adequado e não para cobranças de Pesquisa, armazenamento ou modelo/ferramenta.

---

## 🔧 Solução de Problemas com Agentes

### Problemas Comuns e Soluções

<details>
<summary><strong>❌ Agente não respondendo às chamadas de ferramentas</strong></summary>

```bash
# Inspect the application deployment (not the agent's registered tools)
azd show

# Verify OpenAI deployment
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Check agent logs
azd monitor --logs
```

**Causas comuns:**
- Assinatura da função da ferramenta incompatível
- Permissões necessárias ausentes
- Endpoint da API não acessível
</details>

<details>
<summary><strong>❌ Alta latência nas respostas do agente</strong></summary>

```bash
# Check Application Insights for bottlenecks
azd monitor --live

# Consider using a faster model
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd up
```

**Dicas de otimização:**
- Use respostas por streaming
- Implemente cache de respostas
- Reduza o tamanho da janela de contexto
</details>

<details>
<summary><strong>❌ Agente retornando informações incorretas ou alucinações</strong></summary>

```python
# Improve with better system prompts
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Use these instructions in the agent definition.
# For classic file search, first upload/index documents in a vector store,
# then use FileSearchTool(vector_store_ids=[...]) and pass both its
# .definitions and .resources when creating the agent.
```
Instruções e recuperação reduzem riscos; nenhuma garante respostas factuais. Avalie perguntas fundamentadas e fora do escopo contra respostas conhecidas.
</details>

<details>
<summary><strong>❌ Erros de limite de tokens excedidos</strong></summary>

```python
# Implement context window management
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Approximate content-only budget for objects with .content strings."""
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
Este auxiliar exclui esquemas de função/ferramenta, instruções do sistema, tokens de imagem e overhead do protocolo. Reserve espaço para esses e para a conclusão; não divida pares de chamada de ferramenta/resultado nem descarte as instruções necessárias do sistema. Instale `tiktoken` separadamente. Não é um validador geral da janela de contexto.
</details>

---

## 🎓 Exercícios Práticos

### Exercício 1: Implantar um Agente Básico (20 minutos)

**Objetivo:** Implante seu primeiro agente de IA usando AZD

```bash
# Step 1: Initialize template
azd init --template get-started-with-ai-agents .

# Step 2: Login to Azure
azd auth login
# If you work across tenants, add --tenant-id <tenant-id>

# Step 3: Deploy
azd up

# Step 4: Test the agent
# Expected output after deployment:
#   Deployment Complete!
#   Endpoint: https://<app-name>.<region>.azurecontainerapps.io
# Open the URL shown in the output and try asking a question

# Step 5: View monitoring
azd monitor --overview

# Step 6: Clean up
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] O agente responde a perguntas
- [ ] Pode acessar o painel de monitoramento via `azd monitor`
- [ ] Recursos limpos com sucesso

### Exercício 2: Adicionar uma Ferramenta Personalizada (30 minutos)

**Objetivo:** Estender um agente com uma ferramenta personalizada

**Ponto de partida:** Use o cliente SDK clássico da [Configuração de Ferramenta](#tool-configuration-in-foundry-agents), não um modelo arbitrário com uma geração SDK diferente.

1. Adicione esta fixture determinística a `agent_config.py`:
   ```python
   def get_weather(location: str) -> str:
       """Return demonstration weather, not live conditions.

       :param location: City name.
       :return: A clearly labelled fixture.
       """
       print(f"TOOL_CALLED: {location}")
       return f"Demo weather in {location}: Sunny, 72°F (fixture, not live)"
   ```
2. Substitua o bloco de registro e criação da ferramenta de busca por:
   ```python
   weather_tool = FunctionTool(functions={get_weather})
   project_client.agents.enable_auto_function_calls(weather_tool)
   agent = project_client.agents.create_agent(
       model=os.environ["MODEL_DEPLOYMENT_NAME"],
       name="Weather Agent",
       instructions="Call get_weather for weather questions; explain that it returns demo data.",
       tools=weather_tool.definitions,
   )
   thread = project_client.agents.threads.create()
   try:
       project_client.agents.messages.create(
           thread_id=thread.id, role="user", content="Use get_weather for Seattle."
       )
       run = project_client.agents.runs.create_and_process(
           thread_id=thread.id, agent_id=agent.id
       )
       if run.status != "completed":
           raise RuntimeError(f"Run status: {run.status}; error: {run.last_error}")
       for message in project_client.agents.messages.list(thread_id=thread.id):
           for text in message.text_messages:
               print(text.text.value)
   finally:
       project_client.agents.threads.delete(thread.id)
       project_client.agents.delete_agent(agent.id)
       project_client.close()
   ```
3. Execute localmente (isso chama o projeto do Azure existente e gera custos de modelo):
   ```bash
   python agent_config.py
   # Expected: TOOL_CALLED: Seattle, then a completed answer labelled demo data.
   ```

**Critérios de Sucesso:**
- [ ] O agente reconhece consultas relacionadas ao tempo
- [ ] A ferramenta é chamada corretamente
- [ ] A resposta inclui informações meteorológicas

### Exercício 3: Construir um Agente RAG (45 minutos)

**Objetivo:** Criar um agente que responda perguntas a partir dos seus documentos

```bash
# Step 1: Deploy RAG template
azd init --template azure-search-openai-demo .
azd up

# Step 2: Upload your documents
# For the sample's local ingestion path, place supported files in data/.
# Run from the sample root after following its Python environment setup:
./scripts/prepdocs.sh
# Windows PowerShell equivalent: .\\scripts\\prepdocs.ps1

# Step 3: Test with domain-specific questions
# Open the web app URL from the azd up output
# Ask questions about your uploaded documents
# Responses should include citation references like [doc.pdf]
```

**Critérios de Sucesso:**
- [ ] O agente responde a partir dos documentos carregados
- [ ] As respostas incluem citações
- [ ] Perguntas fora do escopo são tratadas sem afirmações não suportadas (não é garantia para todas as perguntas futuras)

Se `USE_CLOUD_INGESTION=true`, use o fluxo de ingestão/carregamento na nuvem do exemplo; o wrapper local intencionalmente ignora a ingestão. Após os testes, execute `azd down` no ambiente RAG e revise os recursos a serem excluídos.

---

## 📚 Próximos Passos

Agora que você entende agentes de IA, explore estes tópicos avançados:

| Tópico | Descrição | Link |
|-------|-------------|------|
| **Sistemas Multiagentes** | Construa sistemas com múltiplos agentes colaborativos | [Exemplo Multiagente de Varejo](../../examples/retail-scenario.md) |
| **Padrões de Coordenação** | Aprenda padrões de orquestração e comunicação | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Implantação em Produção** | Implantação de agentes pronta para empresas | [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md) |
| **Avaliação de Agentes** | Teste e avalie o desempenho do agente | [Solução de Problemas em IA](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Laboratório Workshop de IA** | Prática: Prepare sua solução de IA para AZD | [Laboratório Workshop de IA](ai-workshop-lab.md) |

---

## 📖 Recursos Adicionais

### Documentação Oficial
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### Modelos AZD para Agentes
- [Introdução aos Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agentes de Escrita Criativa com Prompty](https://github.com/Azure-Samples/contoso-creative-writer)
- [Demonstração Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### Recursos da Comunidade
- [Awesome AZD - Modelos de Agentes](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Habilidades de Agentes para Seu Editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Instale habilidades reutilizáveis para agentes de IA no desenvolvimento Azure em GitHub Copilot, Cursor ou qualquer agente suportado. Inclui habilidades para [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [implantação](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) e [diagnósticos](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navegação**
- **Lição Anterior**: [Integração Microsoft Foundry](microsoft-foundry-integration.md)
- **Próxima Lição**: [Implantação de Modelo de IA](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->