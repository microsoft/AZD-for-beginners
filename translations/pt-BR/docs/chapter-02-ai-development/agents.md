# Agentes de IA com Azure Developer CLI

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 2 - Desenvolvimento AI-First
- **⬅️ Anterior**: [Integração do Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Próximo**: [Implantação de Modelo de IA](ai-model-deployment.md)
- **🚀 Avançado**: [Soluções Multi-Agentes](../../examples/retail-scenario.md)

---

## Introdução

Agentes de IA são programas autônomos que podem perceber seu ambiente, tomar decisões e realizar ações para alcançar objetivos específicos. Diferente de chatbots simples que respondem a comandos, agentes podem:

- **Usar ferramentas** - Chamar APIs, pesquisar bancos de dados, executar código
- **Planejar e raciocinar** - Dividir tarefas complexas em etapas
- **Aprender com o contexto** - Manter memória e adaptar comportamento
- **Colaborar** - Trabalhar com outros agentes (sistemas multi-agentes)

Este guia mostra como implantar agentes de IA na Azure usando o Azure Developer CLI (azd).

Usar contexto de conversação não é treinamento de modelo: memória persistente, controle de acesso e retenção devem ser implementados/configurados pelo aplicativo.

> **Atualização Foundry GA (2026-11-09):** Instale o bundle geralmente disponível `microsoft.foundry` 1.0 com `azd >= 1.37.0`. Avaliações são instaladas separadamente; recursos opcionais de pré-visualização e o fragmento clássico do SDK abaixo não são promovidos a GA pelo anúncio do bundle. Esta orientação é baseada no [anúncio GA](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/) e documentação, não em uma implantação ativa Azure.

## Objetivos de Aprendizagem

Ao concluir este guia, você irá:
- Compreender o que são agentes de IA e como eles diferem de chatbots
- Implantar templates pré-construídos de agentes de IA usando AZD
- Configurar Foundry Agents para agentes customizados
- Implementar padrões básicos de agente (uso de ferramentas, RAG, multi-agente)
- Monitorar e depurar agentes implantados

## Resultados de Aprendizagem

Ao final, você será capaz de:
- Implantar aplicações de agentes de IA na Azure com um único comando
- Configurar ferramentas e capacidades do agente
- Implementar geração aumentada por recuperação (RAG) com agentes
- Projetar arquiteturas multi-agentes para fluxos de trabalho complexos
- Solucionar problemas comuns de implantação de agentes

---

## 🤖 O Que Faz um Agente Diferente de um Chatbot?

| Recurso | Chatbot | Agente de IA |
|---------|---------|----------|
| **Comportamento** | Responde a comandos | Realiza ações autônomas |
| **Ferramentas** | Pode usar recuperação ou ferramentas | Normalmente usa ferramentas em um ciclo orientado a objetivos |
| **Memória** | Depende do aplicativo | Memória persistente somente se explicitamente implementada |
| **Planejamento** | Resposta única | Raciocínio em múltiplas etapas |
| **Colaboração** | Entidade única | Pode trabalhar com outros agentes |

### Analogia Simples

- **Chatbot** = Uma pessoa prestativa atendendo perguntas em um balcão de informações
- **Agente de IA** = Um assistente pessoal que pode fazer ligações, agendar compromissos e completar tarefas para você

---

## 🚀 Início Rápido: Implemente Seu Primeiro Agente

Escolha uma opção numa **nova pasta de trabalho vazia**. O comando final `.` inicializa nesse local; sem um destino explícito, o AZD atual pode criar um subdiretório nomeado pelo template e não altera o diretório do seu terminal. Mantenha templates/ambientes separados em diretórios separados.

As faixas de tempo/custo abaixo são ilustrativas, não cotações validadas. Verifique os pré-requisitos, preços, cota de modelo e serviços opcionais de cada exemplo atual antes da implantação.

### Opção 1: Template Foundry Agents (Recomendado)

```bash
# Initialize the AI agents template
azd init --template get-started-with-ai-agents .

# Deploy to Azure
azd up
```

**O que será implantado:** A infraestrutura atual do exemplo e as opções selecionadas determinam o modelo, ferramentas, hospedagem e recursos de monitoramento. Leia o README e `infra/` antes do provisionamento; não assuma que todos os templates de agente incluem Search ou interface web.

**Tempo:** ~15-20 minutos
**Custo:** ~$100-150/mês (desenvolvimento)

### Opção 2: Agentes de Escrita Criativa com Prompty

```bash
# Initialize the Prompty-based agent template
azd init --template https://github.com/Azure-Samples/contoso-creative-writer .

# Deploy to Azure
azd up
```

**O que será implantado:** Um exemplo FastAPI/Prompty multi-agente de escrita usando Azure OpenAI, Bing Grounding e Azure AI Search. O antigo repositório `agent-openai-python-prompty` redireciona para aqui; não é um template mínimo de agente de clima Azure Functions. Siga o README atual para hospedagem, cota de modelo e pré-requisitos do Bing Grounding.

**Tempo:** ~10-15 minutos
**Custo:** ~$50-100/mês (desenvolvimento)

### Opção 3: Agente RAG Chat

```bash
# Initialize RAG chat template
azd init --template azure-search-openai-demo .

# Deploy to Azure
azd up
```

**O que será implantado:**
- ✅ Modelos Microsoft Foundry
- ✅ Azure AI Search com dados de exemplo
- ✅ Pipeline de processamento de documentos
- ✅ Interface de chat com citações

**Tempo:** ~15-25 minutos
**Custo:** ~$80-150/mês (desenvolvimento)

### Opção 4: Agente Hospedado com o Bundle Foundry GA

Use o [tutorial completo do agente hospedado](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) para o exemplo básico da API Python Agent Framework Responses. Este caminho de implantação de código precisa do Python 3.13+, uv atual, permissões Foundry e cota regional do modelo. Autentique chamadas SDK locais separadamente ao usar credenciais Azure CLI.

```bash
azd auth login
azd ext install microsoft.foundry
```

No diretório vazio, inicialize o exemplo:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Escolha um projeto novo ou existente, revise `azure.yaml` e execute `azd provision`. Use `azd ai agent run` para abrir o Agent Inspector e, de outro terminal nesse diretório, `azd ai agent invoke --local "Explain how this agent is hosted."`. Após a verificação local, use `azd deploy` e `azd ai agent invoke "Explain how this agent is hosted."` para comparar a resposta implantada. O Foundry compila o código fonte enviado remotamente; uma compilação local de container não é requerida.

**Quando usar `azd ai agent init` vs `azd init --template`:**

| Abordagem | Melhor Para | Como Funciona |
|----------|------------|--------------|
| `azd init --template` | Começando de um app de exemplo funcional | Clona um repositório completo do template com código + infra |
| `azd ai agent init --template` | Adotando um projeto de agente Foundry atual | Usa um documento de projeto `azure.yaml` e suas definições |

> **Dica:** Opções 1-3 começam com templates de aplicação completos; Opção 4 ensina o fluxo de trabalho GA de agente hospedado. Nenhum comando de inicialização migra manifestos de agentes legados automaticamente. Para adicionar uma definição direta de agente a um projeto existente, veja as [orientações de inicialização e migração](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

Instale `azure.ai.evaluations` separadamente para gerar e revisar dados/rúbricas de teste, configurar uma avaliação e executá-la usando `azd ai eval`. Otimização pode reutilizar uma avaliação compatível; revise candidatos antes de implantar um explicitamente. Siga o [fluxo de avaliação](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migração de otimização](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration) antes de reutilizar exemplos antigos. Para limpeza, recursos de um projeto Foundry reutilizado permanecem após `azd down`; um grupo de recursos de projeto recém-criado é excluído. Veja as [orientações de limpeza do tutorial](microsoft-foundry-integration.md#7-clean-up-deliberately).

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

**Exemplo relacionado:** `azure-search-openai-demo` demonstra RAG, não um loop genérico de agente com ferramentas arbitrárias.

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
- Sistemas de perguntas e respostas documentais
- Pesquisa de conformidade e jurídica

**Template AZD:** `azure-search-openai-demo`

### Padrão 3: Sistema Multi-Agente

Múltiplos agentes especializados trabalhando juntos em tarefas complexas.

```mermaid
graph TD
    Orchestrator[Orchestrator Agent] --> Research[Research Agent<br/>gpt-4.1]
    Orchestrator --> Writer[Writer Agent<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Reviewer Agent<br/>gpt-4.1]
```

**Melhor para:**
- Geração complexa de conteúdo
- Fluxos de trabalho em múltiplas etapas
- Tarefas que requerem diferentes especialidades

**Saiba Mais:** [Padrões de Coordenação Multi-Agente](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configurando Ferramentas do Agente

Agentes se tornam poderosos quando podem usar ferramentas. Veja como configurar ferramentas comuns:

### Configuração de Ferramentas em Foundry Agents

Este **fragmento clássico do SDK Agent Service** mira em `azure-ai-projects==1.0.0` e `azure-ai-agents==1.1.0` com `azure-identity`. Não é a versão mais recente da API versioned-agent/Responses usada por alguns templates atuais Foundry, nem a extensão `azure.ai.agents` AZD (um pacote diferente). Não misture essas gerações de API. Configure `PROJECT_ENDPOINT` para um endpoint classic Foundry e `MODEL_DEPLOYMENT_NAME` para uma implantação de modelo suportada existente; autentique localmente com `az login` e conceda permissões necessárias no projeto.

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

Registrar um esquema de função não executa Python no serviço. Neste SDK, `enable_auto_function_calls` mais `agents.runs.create_and_process(...)` executa callbacks registrados no seu processo cliente. Veja o [exemplo SDK liberado](https://github.com/Azure/azure-sdk-for-python/blob/azure-ai-agents_1.1.0/sdk/ai/azure-ai-agents/samples/agents_tools/sample_agents_auto_function_call.py). Feche o cliente e exclua agentes/threads de demonstração quando terminar.

### Configuração de Ambiente

Os nomes seguintes são **entradas ilustrativas de template customizado**, não opções internas do AZD. Primeiro encadeie cada valor via `infra/main.parameters.json`, infraestrutura e código de aplicação. `azd env set` sozinho não altera ferramentas ou instruções do agente.

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

Se seu template selecionado provisiona Application Insights e configura instrumentação:

```bash
# Open monitoring dashboard
azd monitor --overview

# Open the Application Insights logs view (not a streaming log tail)
azd monitor --logs

# View live metrics
azd monitor --live
```

### Métricas-Chave para Monitorar

| Métrica | Descrição | Meta |
|--------|-----------|------|
| Latência de Resposta | Tempo para gerar resposta | < 5 segundos |
| Uso de Tokens | Tokens por requisição | Monitorar custo |
| Taxa de Sucesso de Chamadas de Ferramentas | % de execuções de ferramentas bem-sucedidas | > 95% |
| Taxa de Erros | Requisições de agente falhadas | < 1% |
| Satisfação do Usuário | Pontuações de feedback | > 4.0/5.0 |

### Logging Customizado para Agentes

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

> **Nota:** Instale o pacote requerido: `pip install azure-monitor-opentelemetry`. Ele inclui as dependências do OpenTelemetry; o namespace de importação não é requisito para instalar um pacote chamado `opentelemetry`.

---

## 💰 Considerações de Custo

### Custos Mensais Estimados por Padrão

Estas são faixas ilustrativas para planejamento, não cotações ou limites de gastos. Região, tokens de modelo, SKUs Search/compute, sessões de ferramenta, armazenamento e tráfego podem ultrapassá-los. Verifique a orientação de custos do exemplo e preços Azure antes de `azd up`.

| Padrão | Ambiente Dev | Produção |
|---------|-------------|------------|
| Agente Único | $50-100 | $200-500 |
| Agente RAG | $80-150 | $300-800 |
| Multi-Agente (2-3 agentes) | $150-300 | $500-1.500 |
| Multi-Agente Empresarial | $300-500 | $1.500-5.000+ |

### Dicas para Otimização de Custo

1. **Use gpt-4.1-mini para tarefas simples** (somente se seu template usar esta entrada)
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Implemente cache com escopo para consultas seguras e repetidas.** Inclua autorização do locatário/usuário, implantação de modelo, instruções e versão de recuperação na chave do cache; defina expiração. Não compartilhe respostas privadas de conversação via cache de apenas consulta amplo. O objeto agente SDK não tem método genérico `agent.run()`.

3. **Defina limites de tokens por execução**
   ```python
   # Set max_completion_tokens when running the agent, not during creation
   run = project_client.agents.runs.create_and_process(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Budget across the run; may finish as incomplete
   )
   ```

4. **Escale Container Apps elegíveis para zero quando não usados**
   ```bash
   # Custom-template input: must map to template.scale.minReplicas
   azd env set MIN_REPLICAS "0"
   ```
   Aplique a mudança de infraestrutura com `azd provision` ou `azd up`. Escalar a zero precisa de gatilho adequado e não para custos de Search, armazenamento ou modelo/ferramenta.

---

## 🔧 Solução de Problemas em Agentes

### Problemas Comuns e Soluções

<details>
<summary><strong>❌ Agente não responde a chamadas de ferramenta</strong></summary>

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
- Assinatura de função de ferramenta incompatível
- Permissões necessárias ausentes
- Endpoint API inacessível
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
- Use respostas em streaming
- Implemente cache de resposta
- Reduza o tamanho da janela de contexto
</details>

<details>
<summary><strong>❌ Agente retornando informação incorreta ou alucinações</strong></summary>

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
Instruções e recuperação reduzem risco; nenhuma garante respostas factuais. Avalie perguntas fundamentadas e fora do escopo contra respostas conhecidas.
</details>

<details>
<summary><strong>❌ Erros de limite de token excedido</strong></summary>

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
Este auxílio exclui esquemas de papel/ferramenta, instruções de sistema, tokens de imagem e overhead do protocolo. Reserve espaço para estes e a conclusão; não divida pares chamada de ferramenta/resultado nem descarte instruções de sistema necessárias. Instale `tiktoken` separadamente. Não é um validador geral de janela de contexto.
</details>

---

## 🎓 Exercícios Práticos

### Exercício 1: Implemente um Agente Básico (20 minutos)

**Objetivo:** Implemente seu primeiro agente de IA usando AZD

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

# Step 6: Review the listed resources and confirm cleanup
azd down
```

**Critérios de Sucesso:**
- [ ] O agente responde às perguntas
- [ ] Pode acessar o painel de monitoramento via `azd monitor`
- [ ] Recursos limpos com sucesso

### Exercício 2: Adicionar uma Ferramenta Personalizada (30 minutos)

**Objetivo:** Estender um agente com uma ferramenta personalizada

**Ponto de partida:** Use o cliente SDK clássico de [Configuração da Ferramenta](#tool-configuration-in-foundry-agents), não um modelo arbitrário com uma geração diferente do SDK.

1. Adicione esta fixture determinística em `agent_config.py`:
   ```python
   def get_weather(location: str) -> str:
       """Return demonstration weather, not live conditions.

       :param location: City name.
       :return: A clearly labelled fixture.
       """
       print(f"TOOL_CALLED: {location}")
       return f"Demo weather in {location}: Sunny, 72°F (fixture, not live)"
   ```
2. Substitua o bloco de registro e criação da search-tool por:
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
3. Execute localmente (isso chama o projeto existente Azure e gera cobranças pelo modelo):
   ```bash
   python agent_config.py
   # Expected: TOOL_CALLED: Seattle, then a completed answer labelled demo data.
   ```

**Critérios de Sucesso:**
- [ ] O agente reconhece consultas relacionadas ao clima
- [ ] A ferramenta é chamada corretamente
- [ ] A resposta inclui informações sobre o clima

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
- [ ] O agente responde a partir dos documentos enviados
- [ ] As respostas incluem citações
- [ ] Perguntas fora do escopo são tratadas sem alegações não suportadas (não é uma garantia para toda pergunta futura)

Se `USE_CLOUD_INGESTION=true`, use o fluxo de trabalho de ingestão/upload na nuvem do exemplo; o wrapper local intencionalmente pula a ingestão. Após testar, execute `azd down` no ambiente RAG e revise os recursos a serem excluídos.

---

## 📚 Próximos Passos

Agora que você entende agentes de IA, explore estes tópicos avançados:

| Tópico | Descrição | Link |
|-------|-------------|------|
| **Sistemas Multi-Agentes** | Construa sistemas com múltiplos agentes colaboradores | [Exemplo de Multi-Agentes no Varejo](../../examples/retail-scenario.md) |
| **Padrões de Coordenação** | Aprenda padrões de orquestração e comunicação | [Padrões de Coordenação](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Implantação em Produção** | Implantação de agentes pronta para empresas | [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md) |
| **Avaliação de Agentes** | Teste e avalie o desempenho do agente | [Resolução de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Laboratório Prático de IA** | Prático: Prepare sua solução de IA para AZD | [Laboratório Prático de IA](ai-workshop-lab.md) |

---

## 📖 Recursos Adicionais

### Documentação Oficial
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### Modelos AZD para Agentes
- [Comece com Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agentes de Escrita Criativa com Prompty](https://github.com/Azure-Samples/contoso-creative-writer)
- [Demonstração Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### Recursos da Comunidade
- [Awesome AZD - Modelos de Agentes](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Skills para Agentes no Seu Editor
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Instale skills reutilizáveis de agentes de IA para desenvolvimento Azure no GitHub Copilot, Cursor ou qualquer agente suportado. Inclui skills para [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [implantação](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) e [diagnósticos](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
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