# Microsoft Foundry Models Chat Application

**Learning Path:** Intermediate ⭐⭐ | **Time:** 35-45 minutes | **Cost:** $50-200/month

Um aplicativo de chat completo do Microsoft Foundry Models implantado usando o Azure Developer CLI (azd). Este exemplo demonstra a implantação do gpt-4.1, acesso seguro à API e uma interface de chat simples.

## 🎯 O que você vai aprender

- Implantar o Microsoft Foundry Models Service com o modelo gpt-4.1
- Proteger chaves de API OpenAI com o Key Vault
- Construir uma interface de chat simples com Python
- Monitorar uso de tokens e custos
- Implementar limitação de taxa e tratamento de erros

## 📦 O que está incluído

✅ **Microsoft Foundry Models Service** - implantação do modelo gpt-4.1  
✅ **Python Chat App** - Interface de chat simples em linha de comando  
✅ **Key Vault Integration** - Armazenamento seguro de chaves de API  
✅ **ARM Templates** - Infraestrutura como código completa  
✅ **Cost Monitoring** - Rastreamento de uso de tokens  
✅ **Rate Limiting** - Evitar exaustão de cota  

## Architecture

```mermaid
graph TD
    App[Aplicativo de Chat em Python<br/>Local/Nuvem<br/>Interface de linha de comando<br/>Histórico de conversas<br/>Rastreamento de uso de tokens] -- "HTTPS (Chave de API)" --> Foundry[Serviço Microsoft Foundry Models<br/>Modelo gpt-4.1<br/>Capacidade de 20K tokens/min<br/>Failover multirregional]
    Foundry --> KV[Azure Key Vault<br/>Chave de API OpenAI<br/>URL do endpoint]
    Foundry -. Identidade Gerenciada .-> KV
```

## Pré-requisitos

### Obrigatório

- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** com acesso ao OpenAI - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)

### Verificar Pré-requisitos

```bash
# Verifique a versão do azd (precisa ser 1.5.0 ou superior)
azd version

# Verifique o login no Azure
azd auth login

# Verifique a versão do Python
python --version  # ou python3 --version

# Verifique o acesso ao OpenAI (verifique no Portal do Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Important:** Microsoft Foundry Models requires application approval. If you haven't applied, visit [aka.ms/oai/access](https://aka.ms/oai/access). Approval typically takes 1-2 business days.

## ⏱️ Cronograma de Implantação

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Prerequisites check | 2-3 minutes | Verify OpenAI quota availability |
| Deploy infrastructure | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| Configure application | 2-3 minutes | Set up environment and dependencies |
| **Total** | **12-18 minutes** | Ready to chat with gpt-4.1 |

**Note:** First-time OpenAI deployment may take longer due to model provisioning.

## Quick Start

```bash
# Navegue até o exemplo
cd examples/azure-openai-chat

# Inicialize o ambiente
azd env new myopenai

# Implante tudo (infraestrutura + configuração)
azd up
# Você será solicitado a:
# 1. Selecione a assinatura do Azure
# 2. Escolha uma região com disponibilidade do OpenAI (por exemplo: eastus, eastus2, westus)
# 3. Aguarde 12-18 minutos para a implantação

# Instale as dependências do Python
pip install -r requirements.txt

# Comece a conversar!
python chat.py
```

**Expected Output:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verify Deployment

### Step 1: Check Azure Resources

```bash
# Visualizar recursos implantados
azd show

# A saída esperada mostra:
# - Serviço OpenAI: (nome do recurso)
# - Cofre de chaves: (nome do recurso)
# - Implantação: gpt-4.1
# - Localização: eastus (ou sua região selecionada)
```

### Step 2: Test OpenAI API

```bash
# Obter o endpoint e a chave da OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testar chamada de API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Expected Response:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Step 3: Verify Key Vault Access

```bash
# Listar segredos no Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Expected Secrets:**
- `openai-api-key`
- `openai-endpoint`

**Success Criteria:**
- ✅ OpenAI service deployed with gpt-4.1
- ✅ API call returns valid completion
- ✅ Secrets stored in Key Vault
- ✅ Token usage tracking works

## Project Structure

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Application Features

### Chat Interface (`chat.py`)

O aplicativo de chat inclui:

- **Conversation History** - Mantém o contexto entre mensagens
- **Token Counting** - Rastreia uso e estima custos
- **Error Handling** - Tratamento elegante de limites de taxa e erros de API
- **Cost Estimation** - Cálculo de custo em tempo real por mensagem
- **Streaming Support** - Respostas em streaming opcionais

### Commands

Enquanto estiver no chat, você pode usar:
- `quit` or `exit` - Encerrar a sessão
- `clear` - Limpar histórico de conversa
- `tokens` - Mostrar uso total de tokens
- `cost` - Mostrar custo total estimado

### Configuration (`config.py`)

Carrega configurações a partir de variáveis de ambiente:
```python
AZURE_OPENAI_ENDPOINT  # Do Cofre de Chaves
AZURE_OPENAI_API_KEY   # Do Cofre de Chaves
AZURE_OPENAI_MODEL     # Padrão: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Padrão: 800
```

## Exemplos de Uso

### Chat Básico

```bash
python chat.py
```

### Chat com Modelo Personalizado

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat com Streaming

```bash
python chat.py --stream
```

### Conversa de Exemplo

```
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Gerenciamento de Custos

### Preço por Token (gpt-4.1)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Custos Mensais Estimados

Baseado em padrões de uso:

| Usage Level | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **Light** | 20 messages | 3,000 tokens | $3-5 |
| **Moderate** | 100 messages | 15,000 tokens | $15-25 |
| **Heavy** | 500 messages | 75,000 tokens | $75-125 |

**Base Infrastructure Cost:** $1-2/month (Key Vault + minimal compute)

### Dicas de Otimização de Custos

```bash
# 1. Use GPT-3.5-Turbo para tarefas mais simples (20x mais barato)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduza o número máximo de tokens para respostas mais curtas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitore o uso de tokens
python chat.py --show-tokens

# 4. Configure alertas de orçamento
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoramento

### Ver Uso de Tokens

```bash
# No portal do Azure:
# Recurso OpenAI → Métricas → Selecione "Token Transaction"

# Ou via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Ver Logs da API

```bash
# Transmitir logs de diagnóstico
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Logs de consulta
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Solução de Problemas

### Problema: Erro "Access Denied"

**Sintomas:** 403 Forbidden ao chamar a API

**Soluções:**
```bash
# 1. Verifique se o acesso ao OpenAI foi aprovado
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifique se a chave da API está correta
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifique o formato da URL do endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Deve ser: https://[name].openai.azure.com/
```

### Problema: "Rate Limit Exceeded"

**Sintomas:** 429 Too Many Requests

**Soluções:**
```bash
# 1. Verificar a cota atual
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. Solicitar aumento de cota (se necessário)
# Acesse o Portal do Azure → Recurso OpenAI → Cotas → Solicitar aumento

# 3. Implementar lógica de retentativa (já em chat.py)
# A aplicação tenta novamente automaticamente com backoff exponencial
```

### Problema: "Model Not Found"

**Sintomas:** Erro 404 para a implantação

**Soluções:**
```bash
# 1. Liste as implantações disponíveis
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifique o nome do modelo no ambiente
echo $AZURE_OPENAI_MODEL

# 3. Atualize para o nome correto da implantação
export AZURE_OPENAI_MODEL=gpt-4.1  # ou gpt-35-turbo
```

### Problema: Alta Latência

**Sintomas:** Tempos de resposta lentos (>5 segundos)

**Soluções:**
```bash
# 1. Verifique a latência regional
# Implantar na região mais próxima dos usuários

# 2. Reduza max_tokens para respostas mais rápidas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Use streaming para melhor experiência do usuário
python chat.py --stream
```

## Melhores Práticas de Segurança

### 1. Proteger Chaves de API

```bash
# Nunca inclua chaves no controle de versão
# Use o Key Vault (já configurado)

# Rotacione as chaves regularmente
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementar Filtragem de Conteúdo

```python
# Microsoft Foundry Models inclui filtragem de conteúdo integrada
# Configure no Portal do Azure:
# Recurso OpenAI → Filtros de Conteúdo → Criar Filtro Personalizado

# Categorias: Ódio, Sexual, Violência, Autolesão
# Níveis: Filtragem baixa, média e alta
```

### 3. Usar Managed Identity (Produção)

```bash
# Para implantações em produção, use identidade gerenciada
# em vez de chaves de API (requer hospedagem do aplicativo no Azure)

# Atualize infra/openai.bicep para incluir:
# identity: { type: 'SystemAssigned' }
```

## Desenvolvimento

### Executar Localmente

```bash
# Instalar dependências
pip install -r src/requirements.txt

# Definir variáveis de ambiente
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Executar aplicação
python src/chat.py
```

### Executar Testes

```bash
# Instalar dependências de testes
pip install pytest pytest-cov

# Executar testes
pytest tests/ -v

# Com cobertura
pytest tests/ --cov=src --cov-report=html
```

### Atualizar Implantação do Modelo

```bash
# Implantar uma versão diferente do modelo
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Limpeza

```bash
# Excluir todos os recursos do Azure
azd down --force --purge

# Isso remove:
# - Serviço OpenAI
# - Key Vault (com exclusão suave de 90 dias)
# - Grupo de recursos
# - Todas as implantações e configurações
```

## Próximos Passos

### Expanda este exemplo

1. **Add Web Interface** - Build React/Vue frontend
   ```bash
   # Adicionar serviço de frontend ao azure.yaml
   # Implantar no Azure Static Web Apps
   ```

2. **Implement RAG** - Add document search with Azure AI Search
   ```python
   # Integrar o Azure AI Search
   # Fazer upload de documentos e criar índice vetorial
   ```

3. **Add Function Calling** - Enable tool use
   ```python
   # Defina funções em chat.py
   # Permitir que gpt-4.1 chame APIs externas
   ```

4. **Multi-Model Support** - Deploy multiple models
   ```bash
   # Adicionar gpt-35-turbo e modelos de embeddings
   # Implementar lógica de roteamento de modelos
   ```

### Exemplos Relacionados

- **[Retail Multi-Agent](../retail-scenario.md)** - Advanced multi-agent architecture
- **[Database App](../../../../examples/database-app)** - Add persistent storage
- **[Container Apps](../../../../examples/container-app)** - Deploy as containerized service

### Recursos de Aprendizado

- 📚 [AZD For Beginners Course](../../README.md) - Main course home
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Official docs
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API details
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Best practices

## Recursos Adicionais

### Documentação
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Guia completo
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacidades do modelo
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Recursos de segurança
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência do azd

### Tutoriais
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Primeira implantação
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construindo aplicativos de chat
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Recursos avançados

### Ferramentas
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Playground baseado na web
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Escrevendo prompts melhores
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Estimar uso de tokens

### Comunidade
- **[Azure AI Discord](https://discord.gg/azure)** - Obtenha ajuda da comunidade
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Fórum de perguntas e respostas
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Últimas atualizações

---

**🎉 Sucesso!** Você implantou o Microsoft Foundry Models e construiu um aplicativo de chat funcional. Comece a explorar as capacidades do gpt-4.1 e experimente diferentes prompts e casos de uso.

**Perguntas?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) ou confira o [FAQ](../../resources/faq.md)

**Alerta de Custo:** Lembre-se de executar `azd down` quando terminar os testes para evitar cobranças contínuas (~$50-100/month for active usage).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->