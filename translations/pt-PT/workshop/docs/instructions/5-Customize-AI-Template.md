# 5. Personalizar um Modelo

!!! tip "NO FINAL DESTE MÓDULO SERÁ CAPAZ DE"

    - [ ] Explorar as Capacidades padrão do Agente de IA
    - [ ] Adicionar a Pesquisa de IA com o seu próprio índice
    - [ ] Ativar e analisar métricas de Rastreamento
    - [ ] Executar uma avaliação
    - [ ] Executar uma varredura red teaming
    - [ ] **Laboratório 5: Construir um Plano de Personalização** 

---

## 5.1 Capacidades do Agente de IA

!!! success "Concluímos isto no Laboratório 01"

- **Pesquisa de Ficheiros**: Pesquisa de ficheiros integrada da OpenAI para recuperação de conhecimento
- **Citações**: Atribuição automática de fontes nas respostas
- **Instruções Personalizáveis**: Modifique o comportamento e a personalidade do agente
- **Integração de Ferramentas**: Sistema de ferramentas extensível para capacidades personalizadas

---

## 5.2 Opções de Recuperação de Conhecimento

!!! task "Para completar isto precisamos de fazer alterações e redeploy"    
    
    ```bash title=""
    # Definir variáveis de ambiente
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Carregar dados e criar o meu índice

    ```

---

**Pesquisa de Ficheiros OpenAI (Padrão):**

- Integrado nos Agentes Foundry
- Processamento e indexação automática de documentos
- Nenhuma configuração adicional necessária

**Pesquisa de IA Azure (Opcional):**

- Pesquisa híbrida semântica e vetorial
- Gestão personalizada de índices
- Capacidades avançadas de pesquisa
- Requer `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Rastreamento & Monitorização](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Para completar isto precisamos de fazer alterações e redeploy"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Rastreamento:**

- Integração OpenTelemetry
- Rastreamento de pedido/resposta
- Métricas de desempenho
- Disponível no portal Microsoft Foundry

**Logs:**

- Logs de aplicação em Container Apps
- Logging estruturado com IDs de correlação
- Visualização de logs em tempo real e histórico

---

## 5.4 [Avaliação do Agente](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Avaliação Local:**

- Avaliadores integrados para avaliação de qualidade
- Scripts de avaliação personalizados
- Benchmarking de desempenho

**Monitorização Contínua:**

- Avaliação automática de interações ao vivo
- Monitorização de métricas de qualidade
- Detecção de regressões de desempenho

**Integração CI/CD:**

- Workflow GitHub Actions
- Testes e avaliações automatizadas
- Testes de comparação estatística

---

## 5.5 [Agente AI Red Teaming](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Scanner de segurança automatizado
- Avaliação de riscos para sistemas de IA
- Avaliação de segurança em várias categorias

**Autenticação:**

- Identidade Gerida para serviços Azure
- Autenticação opcional Azure App Service
- Autenticação básica fallback para desenvolvimento

!!! quote "NO FINAL DESTE LABORATÓRIO DEVE TER"
    - [ ] Definido os requisitos do seu cenário
    - [ ] Personalizado variáveis de ambiente (config)
    - [ ] Personalizado instruções do agente (tarefa)
    - [ ] Desplegado o modelo personalizado (app)
    - [ ] Completado tarefas pós-deploy (manual)
    - [ ] Executado uma avaliação de teste

Este exemplo demonstra a personalização do modelo para um caso de uso empresarial no retalho com dois agentes especializados e múltiplos deployments de modelos.

---

## 5.6 Personalize Para si!

### 5.6.1 Requisitos do Cenário

#### **Deployments do Agente:**

   - Agente Shopper: Ajuda clientes a encontrar e comparar produtos
   - Agente Loyalty: Gere recompensas e promoções para clientes

#### **Deployments do Modelo:**

   - `gpt-4.1`: Modelo de chat principal
   - `o3`: Modelo de raciocínio para consultas complexas
   - `gpt-4.1-nano`: Modelo leve para interações simples
   - `text-embedding-3-large`: Embeddings de alta qualidade para pesquisa

#### **Funcionalidades:**

   - Rastreamento e monitorização ativados
   - Pesquisa IA para catálogo de produtos
   - Framework de avaliação para garantia de qualidade
   - Red teaming para validação de segurança

---

### 5.6.2 Implementação do Cenário


#### 5.6.2.1. Configuração Pré-Deployment

Criar um script de configuração (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Definir o nome do ambiente
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configurar região (escolher com base na disponibilidade do modelo)
azd env set AZURE_LOCATION "eastus2"

# Ativar todos os serviços opcionais
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configurar modelo principal de chat (gpt-4.1 como o mais próximo disponível do gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configurar modelo de incorporação para pesquisa melhorada
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Definir nome do agente (vai criar o primeiro agente)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configurar índice de pesquisa
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instruções do Agente

Criar `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Criar `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Script de Deployment

Criar `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validar pré-requisitos
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Configurar ambiente
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Verificar a quota na região selecionada
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Implantar infraestrutura e aplicação
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capturar saídas da implantação
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Obter a URL da aplicação web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Configuração Pós-Deployment

Criar `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Obter informações da implantação
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instruções para configuração manual
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Testes e Validação

Criar `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verificar se as variáveis de ambiente estão definidas
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Testar a disponibilidade da aplicação web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Executar avaliação se configurado
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Resultados Esperados

Após seguir este guia de implementação, terá:

1. **Infraestrutura Desplegada:**

      - Projeto Microsoft Foundry com deployments de modelos
      - Container Apps a hospedar a aplicação web
      - Serviço AI Search para catálogo de produtos
      - Application Insights para monitorização

2. **Agente Inicial:**

      - Agente Shopper configurado com instruções básicas
      - Capacidade de pesquisa de ficheiros ativada
      - Rastreamento e monitorização configurados

3. **Pronto para Personalização:**

      - Framework para adicionar Agente Loyalty
      - Modelos de instrução personalizados
      - Scripts de teste e validação
      - Configuração de monitorização e avaliação

4. **Pronto para Produção:**

      - Scanner de segurança com red teaming
      - Monitorização de desempenho
      - Framework de avaliação de qualidade
      - Arquitetura escalável

Este exemplo demonstra como o modelo AZD pode ser estendido e personalizado para cenários empresariais específicos mantendo as melhores práticas de segurança, monitorização e escalabilidade.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos empenhemos em garantir a precisão, por favor tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->