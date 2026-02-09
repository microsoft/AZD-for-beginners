# Aplicação de Chat Azure OpenAI

**Nível de Aprendizagem:** Intermédio ⭐⭐ | **Tempo:** 35-45 minutos | **Custo:** $50-200/mês

Uma aplicação completa de chat Azure OpenAI implementada utilizando o Azure Developer CLI (azd). Este exemplo demonstra a implementação do GPT-4, acesso seguro à API e uma interface de chat simples.

## 🎯 O Que Vai Aprender

- Implementar o Azure OpenAI Service com o modelo GPT-4
- Proteger as chaves da API OpenAI com o Key Vault
- Construir uma interface de chat simples com Python
- Monitorizar o uso de tokens e custos
- Implementar limitação de taxa e tratamento de erros

## 📦 O Que Está Incluído

✅ **Azure OpenAI Service** - Implementação do modelo GPT-4  
✅ **Aplicação de Chat em Python** - Interface de chat simples em linha de comandos  
✅ **Integração com Key Vault** - Armazenamento seguro de chaves da API  
✅ **Modelos ARM** - Infraestrutura completa como código  
✅ **Monitorização de Custos** - Rastreamento do uso de tokens  
✅ **Limitação de Taxa** - Prevenção de esgotamento de quotas  

## Arquitetura

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Pré-requisitos

### Necessário

- **Azure Developer CLI (azd)** - [Guia de instalação](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Subscrição Azure** com acesso ao OpenAI - [Solicitar acesso](https://aka.ms/oai/access)
- **Python 3.9+** - [Instalar Python](https://www.python.org/downloads/)

### Verificar Pré-requisitos

```bash
# Verificar a versão do azd (necessário 1.5.0 ou superior)
azd version

# Verificar login no Azure
azd auth login

# Verificar a versão do Python
python --version  # ou python3 --version

# Verificar acesso ao OpenAI (verificar no Portal do Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Importante:** O Azure OpenAI requer aprovação de aplicação. Se ainda não solicitou, visite [aka.ms/oai/access](https://aka.ms/oai/access). A aprovação geralmente demora 1-2 dias úteis.

## ⏱️ Cronograma de Implementação

| Fase | Duração | O Que Acontece |
|------|---------|----------------|
| Verificação de pré-requisitos | 2-3 minutos | Verificar disponibilidade de quota OpenAI |
| Implementar infraestrutura | 8-12 minutos | Criar OpenAI, Key Vault, implementação do modelo |
| Configurar aplicação | 2-3 minutos | Configurar ambiente e dependências |
| **Total** | **12-18 minutos** | Pronto para conversar com o GPT-4 |

**Nota:** A primeira implementação do OpenAI pode demorar mais devido ao provisionamento do modelo.

## Início Rápido

```bash
# Navegar para o exemplo
cd examples/azure-openai-chat

# Inicializar o ambiente
azd env new myopenai

# Implementar tudo (infraestrutura + configuração)
azd up
# Ser-lhe-á solicitado para:
# 1. Selecionar a subscrição do Azure
# 2. Escolher a localização com disponibilidade do OpenAI (por exemplo, eastus, eastus2, westus)
# 3. Aguardar 12-18 minutos para a implementação

# Instalar dependências do Python
pip install -r requirements.txt

# Começar a conversar!
python chat.py
```

**Saída Esperada:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verificar Implementação

### Passo 1: Verificar Recursos Azure

```bash
# Ver recursos implementados
azd show

# A saída esperada mostra:
# - Serviço OpenAI: (nome do recurso)
# - Key Vault: (nome do recurso)
# - Implementação: gpt-4
# - Localização: eastus (ou a região selecionada)
```

### Passo 2: Testar API OpenAI

```bash
# Obter o endpoint e a chave da OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testar chamada à API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Resposta Esperada:**
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

### Passo 3: Verificar Acesso ao Key Vault

```bash
# Listar segredos no Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Segredos Esperados:**
- `openai-api-key`
- `openai-endpoint`

**Critérios de Sucesso:**
- ✅ Serviço OpenAI implementado com GPT-4
- ✅ Chamada à API retorna uma resposta válida
- ✅ Segredos armazenados no Key Vault
- ✅ Rastreamento do uso de tokens funciona

## Estrutura do Projeto

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

## Funcionalidades da Aplicação

### Interface de Chat (`chat.py`)

A aplicação de chat inclui:

- **Histórico de Conversação** - Mantém o contexto entre mensagens
- **Contagem de Tokens** - Rastreia o uso e estima custos
- **Tratamento de Erros** - Gestão de limites de taxa e erros da API
- **Estimativa de Custos** - Cálculo em tempo real do custo por mensagem
- **Suporte a Streaming** - Respostas em streaming opcionais

### Comandos

Durante o chat, pode usar:
- `quit` ou `exit` - Terminar a sessão
- `clear` - Limpar o histórico de conversação
- `tokens` - Mostrar o total de tokens usados
- `cost` - Mostrar o custo total estimado

### Configuração (`config.py`)

Carrega a configuração a partir de variáveis de ambiente:
```python
AZURE_OPENAI_ENDPOINT  # Do Key Vault
AZURE_OPENAI_API_KEY   # Do Key Vault
AZURE_OPENAI_MODEL     # Predefinição: gpt-4
AZURE_OPENAI_MAX_TOKENS # Predefinição: 800
```

## Exemplos de Utilização

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

### Exemplo de Conversação

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Gestão de Custos

### Preços por Token (GPT-4)

| Modelo | Entrada (por 1K tokens) | Saída (por 1K tokens) |
|--------|--------------------------|-----------------------|
| GPT-4  | $0.03                   | $0.06                |
| GPT-3.5-Turbo | $0.0015          | $0.002               |

### Custos Mensais Estimados

Com base em padrões de uso:

| Nível de Uso | Mensagens/Dia | Tokens/Dia | Custo Mensal |
|--------------|---------------|------------|--------------|
| **Leve**    | 20 mensagens  | 3,000 tokens | $3-5        |
| **Moderado** | 100 mensagens | 15,000 tokens | $15-25     |
| **Intenso**  | 500 mensagens | 75,000 tokens | $75-125    |

**Custo Base de Infraestrutura:** $1-2/mês (Key Vault + computação mínima)

### Dicas para Otimização de Custos

```bash
# 1. Use GPT-3.5-Turbo para tarefas mais simples (20x mais barato)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduzir o número máximo de tokens para respostas mais curtas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitorizar o uso de tokens
python chat.py --show-tokens

# 4. Configurar alertas de orçamento
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorização

### Ver Uso de Tokens

```bash
# No Portal do Azure:
# Recurso OpenAI → Métricas → Selecionar "Transação de Tokens"

# Ou via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Ver Logs da API

```bash
# Transmitir registos de diagnóstico
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Consultar registos
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Resolução de Problemas

### Problema: Erro "Access Denied"

**Sintomas:** 403 Forbidden ao chamar a API

**Soluções:**
```bash
# 1. Verificar se o acesso ao OpenAI está aprovado
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verificar se a chave API está correta
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verificar o formato do URL do endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Deve ser: https://[name].openai.azure.com/
```

### Problema: "Rate Limit Exceeded"

**Sintomas:** 429 Too Many Requests

**Soluções:**
```bash
# 1. Verificar a quota atual
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Solicitar aumento de quota (se necessário)
# Ir para o Portal Azure → Recurso OpenAI → Quotas → Solicitar Aumento

# 3. Implementar lógica de repetição (já em chat.py)
# A aplicação tenta novamente automaticamente com recuo exponencial
```

### Problema: "Model Not Found"

**Sintomas:** Erro 404 na implementação

**Soluções:**
```bash
# 1. Listar implementações disponíveis
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verificar o nome do modelo no ambiente
echo $AZURE_OPENAI_MODEL

# 3. Atualizar para o nome de implementação correto
export AZURE_OPENAI_MODEL=gpt-4  # ou gpt-35-turbo
```

### Problema: Alta Latência

**Sintomas:** Tempos de resposta lentos (>5 segundos)

**Soluções:**
```bash
# 1. Verificar a latência regional
# Implementar na região mais próxima dos utilizadores

# 2. Reduzir max_tokens para respostas mais rápidas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Usar streaming para melhor experiência do utilizador
python chat.py --stream
```

## Melhores Práticas de Segurança

### 1. Proteger Chaves da API

```bash
# Nunca comprometa chaves no controlo de versão
# Use o Key Vault (já configurado)

# Rode as chaves regularmente
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementar Filtros de Conteúdo

```python
# Azure OpenAI inclui filtragem de conteúdo incorporada
# Configurar no Portal Azure:
# Recurso OpenAI → Filtros de Conteúdo → Criar Filtro Personalizado

# Categorias: Ódio, Sexual, Violência, Auto-mutilação
# Níveis: Filtragem Baixa, Média, Alta
```

### 3. Usar Identidade Gerida (Produção)

```bash
# Para implementações de produção, use identidade gerida
# em vez de chaves de API (requer alojamento da aplicação no Azure)

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
export AZURE_OPENAI_MODEL="gpt-4"

# Executar aplicação
python src/chat.py
```

### Executar Testes

```bash
# Instalar dependências de teste
pip install pytest pytest-cov

# Executar testes
pytest tests/ -v

# Com cobertura
pytest tests/ --cov=src --cov-report=html
```

### Atualizar Implementação do Modelo

```bash
# Implementar uma versão diferente do modelo
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
# Eliminar todos os recursos do Azure
azd down --force --purge

# Isto remove:
# - Serviço OpenAI
# - Key Vault (com eliminação suave de 90 dias)
# - Grupo de Recursos
# - Todas as implementações e configurações
```

## Próximos Passos

### Expandir Este Exemplo

1. **Adicionar Interface Web** - Construir frontend em React/Vue
   ```bash
   # Adicionar serviço frontend ao azure.yaml
   # Implementar no Azure Static Web Apps
   ```

2. **Implementar RAG** - Adicionar pesquisa de documentos com Azure AI Search
   ```python
   # Integrar Azure Cognitive Search
   # Carregar documentos e criar índice vetorial
   ```

3. **Adicionar Chamadas de Função** - Ativar uso de ferramentas
   ```python
   # Definir funções em chat.py
   # Permitir que o GPT-4 chame APIs externas
   ```

4. **Suporte a Múltiplos Modelos** - Implementar múltiplos modelos
   ```bash
   # Adicionar gpt-35-turbo, modelos de embeddings
   # Implementar lógica de encaminhamento de modelos
   ```

### Exemplos Relacionados

- **[Cenário Multi-Agente para Retalho](../retail-scenario.md)** - Arquitetura avançada de multi-agentes
- **[Aplicação de Base de Dados](../../../../examples/database-app)** - Adicionar armazenamento persistente
- **[Aplicações em Contentores](../../../../examples/container-app)** - Implementar como serviço em contentores

### Recursos de Aprendizagem

- 📚 [Curso AZD Para Iniciantes](../../README.md) - Página principal do curso
- 📚 [Documentação Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Documentação oficial
- 📚 [Referência da API OpenAI](https://platform.openai.com/docs/api-reference) - Detalhes da API
- 📚 [IA Responsável](https://www.microsoft.com/ai/responsible-ai) - Melhores práticas

## Recursos Adicionais

### Documentação
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Guia completo
- **[Modelos GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacidades dos modelos
- **[Filtros de Conteúdo](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funcionalidades de segurança
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência do azd

### Tutoriais
- **[Início Rápido OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Primeira implementação
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construção de aplicações de chat
- **[Chamadas de Função](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Funcionalidades avançadas

### Ferramentas
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground baseado na web
- **[Guia de Engenharia de Prompts](https://platform.openai.com/docs/guides/prompt-engineering)** - Escrever melhores prompts
- **[Calculadora de Tokens](https://platform.openai.com/tokenizer)** - Estimar uso de tokens

### Comunidade
- **[Discord Azure AI](https://discord.gg/azure)** - Obtenha ajuda da comunidade
- **[Discussões no GitHub](https://github.com/Azure-Samples/openai/discussions)** - Fórum de perguntas e respostas
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Atualizações mais recentes

---

**🎉 Sucesso!** Implementou o Azure OpenAI e construiu uma aplicação de chat funcional. Comece a explorar as capacidades do GPT-4 e experimente diferentes prompts e casos de uso.

**Dúvidas?** [Abra uma questão](https://github.com/microsoft/AZD-for-beginners/issues) ou consulte as [FAQ](../../resources/faq.md)

**Alerta de Custos:** Lembre-se de executar `azd down` ao terminar os testes para evitar custos contínuos (~$50-100/mês para uso ativo).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->