<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-20T23:56:01+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "br"
}
-->
# Aplicativo de Chat Azure OpenAI

**Nível de Aprendizado:** Intermediário ⭐⭐ | **Tempo:** 35-45 minutos | **Custo:** $50-200/mês

Um aplicativo completo de chat Azure OpenAI implantado usando Azure Developer CLI (azd). Este exemplo demonstra a implantação do GPT-4, acesso seguro à API e uma interface de chat simples.

## 🎯 O que você vai aprender

- Implantar o serviço Azure OpenAI com o modelo GPT-4
- Proteger as chaves da API OpenAI com o Key Vault
- Construir uma interface de chat simples com Python
- Monitorar o uso de tokens e custos
- Implementar limitação de taxa e tratamento de erros

## 📦 O que está incluído

✅ **Serviço Azure OpenAI** - Implantação do modelo GPT-4  
✅ **Aplicativo de Chat em Python** - Interface de chat simples via linha de comando  
✅ **Integração com Key Vault** - Armazenamento seguro de chaves da API  
✅ **Templates ARM** - Infraestrutura completa como código  
✅ **Monitoramento de Custos** - Rastreamento do uso de tokens  
✅ **Limitação de Taxa** - Prevenção de esgotamento de cotas  

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
- **Assinatura Azure** com acesso ao OpenAI - [Solicitar acesso](https://aka.ms/oai/access)
- **Python 3.9+** - [Instalar Python](https://www.python.org/downloads/)

### Verificar Pré-requisitos

```bash
# Verifique a versão do azd (necessário 1.5.0 ou superior)
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

> **⚠️ Importante:** O Azure OpenAI requer aprovação de aplicação. Se você ainda não solicitou, visite [aka.ms/oai/access](https://aka.ms/oai/access). A aprovação geralmente leva de 1 a 2 dias úteis.

## ⏱️ Cronograma de Implantação

| Fase | Duração | O que acontece |
|------|---------|----------------|
| Verificação de pré-requisitos | 2-3 minutos | Verificar disponibilidade de cota do OpenAI |
| Implantar infraestrutura | 8-12 minutos | Criar OpenAI, Key Vault, implantação do modelo |
| Configurar aplicativo | 2-3 minutos | Configurar ambiente e dependências |
| **Total** | **12-18 minutos** | Pronto para conversar com o GPT-4 |

**Nota:** A primeira implantação do OpenAI pode levar mais tempo devido ao provisionamento do modelo.

## Início Rápido

```bash
# Navegue para o exemplo
cd examples/azure-openai-chat

# Inicialize o ambiente
azd env new myopenai

# Implante tudo (infraestrutura + configuração)
azd up
# Você será solicitado a:
# 1. Selecionar a assinatura do Azure
# 2. Escolher a localização com disponibilidade do OpenAI (ex.: eastus, eastus2, westus)
# 3. Aguarde 12-18 minutos para a implantação

# Instale as dependências do Python
pip install -r requirements.txt

# Comece a conversar!
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

## ✅ Verificar Implantação

### Etapa 1: Verificar Recursos do Azure

```bash
# Visualizar recursos implantados
azd show

# A saída esperada mostra:
# - Serviço OpenAI: (nome do recurso)
# - Key Vault: (nome do recurso)
# - Implantação: gpt-4
# - Localização: eastus (ou sua região selecionada)
```

### Etapa 2: Testar API OpenAI

```bash
# Obter endpoint e chave do OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testar chamada de API
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

### Etapa 3: Verificar Acesso ao Key Vault

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
- ✅ Serviço OpenAI implantado com GPT-4
- ✅ Chamada de API retorna uma conclusão válida
- ✅ Segredos armazenados no Key Vault
- ✅ Rastreamento de uso de tokens funcionando

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

## Funcionalidades do Aplicativo

### Interface de Chat (`chat.py`)

O aplicativo de chat inclui:

- **Histórico de Conversas** - Mantém o contexto entre mensagens
- **Contagem de Tokens** - Rastreamento de uso e estimativa de custos
- **Tratamento de Erros** - Gerenciamento de limites de taxa e erros da API
- **Estimativa de Custos** - Cálculo de custo em tempo real por mensagem
- **Suporte a Streaming** - Respostas em streaming opcionais

### Comandos

Durante o chat, você pode usar:
- `quit` ou `exit` - Encerrar a sessão
- `clear` - Limpar o histórico de conversas
- `tokens` - Mostrar uso total de tokens
- `cost` - Mostrar custo total estimado

### Configuração (`config.py`)

Carrega configurações de variáveis de ambiente:
```python
AZURE_OPENAI_ENDPOINT  # Do Key Vault
AZURE_OPENAI_API_KEY   # Do Key Vault
AZURE_OPENAI_MODEL     # Padrão: gpt-4
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

### Exemplo de Conversa

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

## Gerenciamento de Custos

### Preços de Tokens (GPT-4)

| Modelo | Entrada (por 1K tokens) | Saída (por 1K tokens) |
|--------|--------------------------|-----------------------|
| GPT-4  | $0.03                   | $0.06                |
| GPT-3.5-Turbo | $0.0015          | $0.002               |

### Custos Mensais Estimados

Baseado em padrões de uso:

| Nível de Uso | Mensagens/Dia | Tokens/Dia | Custo Mensal |
|--------------|---------------|------------|--------------|
| **Leve**    | 20 mensagens  | 3.000 tokens | $3-5         |
| **Moderado** | 100 mensagens | 15.000 tokens | $15-25       |
| **Intenso**  | 500 mensagens | 75.000 tokens | $75-125      |

**Custo Base de Infraestrutura:** $1-2/mês (Key Vault + computação mínima)

### Dicas de Otimização de Custos

```bash
# 1. Use GPT-3.5-Turbo para tarefas mais simples (20x mais barato)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduzir o número máximo de tokens para respostas mais curtas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitorar o uso de tokens
python chat.py --show-tokens

# 4. Configurar alertas de orçamento
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoramento

### Visualizar Uso de Tokens

```bash
# No Portal do Azure:
# Recurso OpenAI → Métricas → Selecionar "Transação de Token"

# Ou via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Visualizar Logs da API

```bash
# Transmitir logs de diagnóstico
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Consultar logs
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Solução de Problemas

### Problema: Erro "Access Denied"

**Sintomas:** 403 Forbidden ao chamar a API

**Soluções:**
```bash
# 1. Verifique se o acesso ao OpenAI está aprovado
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifique se a chave da API está correta
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifique o formato da URL do endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Deve ser: https://[nome].openai.azure.com/
```

### Problema: "Rate Limit Exceeded"

**Sintomas:** 429 Muitas Solicitações

**Soluções:**
```bash
# 1. Verificar a cota atual
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Solicitar aumento de cota (se necessário)
# Vá para o Portal Azure → Recurso OpenAI → Cotas → Solicitar Aumento

# 3. Implementar lógica de tentativa novamente (já em chat.py)
# O aplicativo tenta novamente automaticamente com recuo exponencial
```

### Problema: "Model Not Found"

**Sintomas:** Erro 404 na implantação

**Soluções:**
```bash
# 1. Liste os deployments disponíveis
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifique o nome do modelo no ambiente
echo $AZURE_OPENAI_MODEL

# 3. Atualize para o nome correto do deployment
export AZURE_OPENAI_MODEL=gpt-4  # ou gpt-35-turbo
```

### Problema: Alta Latência

**Sintomas:** Tempos de resposta lentos (>5 segundos)

**Soluções:**
```bash
# 1. Verificar latência regional
# Implantar na região mais próxima dos usuários

# 2. Reduzir max_tokens para respostas mais rápidas
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Usar streaming para melhor experiência do usuário
python chat.py --stream
```

## Melhores Práticas de Segurança

### 1. Proteger Chaves da API

```bash
# Nunca comprometa chaves no controle de versão
# Use o Key Vault (já configurado)

# Gire as chaves regularmente
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementar Filtragem de Conteúdo

```python
# Azure OpenAI inclui filtragem de conteúdo integrada
# Configurar no Portal do Azure:
# Recurso OpenAI → Filtros de Conteúdo → Criar Filtro Personalizado

# Categorias: Ódio, Sexual, Violência, Auto-mutilação
# Níveis: Filtragem Baixa, Média, Alta
```

### 3. Usar Identidade Gerenciada (Produção)

```bash
# Para implantações de produção, use identidade gerenciada
# em vez de chaves de API (requer hospedagem de aplicativo no Azure)

# Atualize infra/openai.bicep para incluir:
# identity: { type: 'SystemAssigned' }
```

## Desenvolvimento

### Executar Localmente

```bash
# Instalar dependências
pip install -r src/requirements.txt

# Configurar variáveis de ambiente
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

### Atualizar Implantação do Modelo

```bash
# Implantar diferentes versões do modelo
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
# - Grupo de Recursos
# - Todas as implantações e configurações
```

## Próximos Passos

### Expandir Este Exemplo

1. **Adicionar Interface Web** - Construir frontend com React/Vue
   ```bash
   # Adicionar serviço de frontend ao azure.yaml
   # Implantar no Azure Static Web Apps
   ```

2. **Implementar RAG** - Adicionar busca de documentos com Azure AI Search
   ```python
   # Integrar Azure Cognitive Search
   # Fazer upload de documentos e criar índice vetorial
   ```

3. **Adicionar Chamadas de Função** - Habilitar uso de ferramentas
   ```python
   # Definir funções em chat.py
   # Permitir que o GPT-4 chame APIs externas
   ```

4. **Suporte a Multi-Modelos** - Implantar múltiplos modelos
   ```bash
   # Adicionar gpt-35-turbo, modelos de embeddings
   # Implementar lógica de roteamento de modelo
   ```

### Exemplos Relacionados

- **[Multi-Agente para Varejo](../retail-scenario.md)** - Arquitetura avançada de multi-agentes
- **[Aplicativo de Banco de Dados](../../../../examples/database-app)** - Adicionar armazenamento persistente
- **[Aplicativos em Contêiner](../../../../examples/container-app)** - Implantar como serviço em contêiner

### Recursos de Aprendizado

- 📚 [Curso AZD Para Iniciantes](../../README.md) - Página principal do curso
- 📚 [Documentação Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Documentação oficial
- 📚 [Referência da API OpenAI](https://platform.openai.com/docs/api-reference) - Detalhes da API
- 📚 [IA Responsável](https://www.microsoft.com/ai/responsible-ai) - Melhores práticas

## Recursos Adicionais

### Documentação
- **[Serviço Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Guia completo
- **[Modelos GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacidades dos modelos
- **[Filtragem de Conteúdo](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Recursos de segurança
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência do azd

### Tutoriais
- **[Introdução ao OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Primeira implantação
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construindo aplicativos de chat
- **[Chamadas de Função](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Recursos avançados

### Ferramentas
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground baseado na web
- **[Guia de Engenharia de Prompt](https://platform.openai.com/docs/guides/prompt-engineering)** - Escrevendo prompts melhores
- **[Calculadora de Tokens](https://platform.openai.com/tokenizer)** - Estimar uso de tokens

### Comunidade
- **[Discord Azure AI](https://discord.gg/azure)** - Obtenha ajuda da comunidade
- **[Discussões no GitHub](https://github.com/Azure-Samples/openai/discussions)** - Fórum de perguntas e respostas
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Últimas atualizações

---

**🎉 Sucesso!** Você implantou o Azure OpenAI e construiu um aplicativo de chat funcional. Comece a explorar as capacidades do GPT-4 e experimente diferentes prompts e casos de uso.

**Dúvidas?** [Abra uma issue](https://github.com/microsoft/AZD-for-beginners/issues) ou confira o [FAQ](../../resources/faq.md)

**Alerta de Custo:** Lembre-se de executar `azd down` ao terminar os testes para evitar cobranças contínuas (~$50-100/mês para uso ativo).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->