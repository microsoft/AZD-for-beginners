# 5. Personalizar um Modelo

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Explorou as capacidades padrão do Agente de IA
    - [ ] Adicionou AI Search com seu próprio índice
    - [ ] Ativou e analisou métricas de rastreamento
    - [ ] Realizou uma execução de avaliação
    - [ ] Executou uma varredura de red teaming
    - [ ] **Lab 5: Elaborou um Plano de Customização** 

---

## 5.1 Capacidades do Agente de IA

!!! success "Concluímos isto no Lab 01"

- **Pesquisa de Arquivos**: Pesquisa de arquivos integrada do OpenAI para recuperação de conhecimento
- **Citações**: Atribuição automática de fontes nas respostas
- **Instruções Personalizáveis**: Modifique o comportamento e a personalidade do agente
- **Integração de Ferramentas**: Sistema de ferramentas extensível para capacidades personalizadas

---

## 5.2 Opções de Recuperação de Conhecimento

!!! task "Para completar isto precisamos fazer alterações e reimplantar"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Padrão):**

- Integrado aos Agentes Foundry
- Processamento automático de documentos e indexação
- Nenhuma configuração adicional necessária

**Azure AI Search (Opcional):**

- Pesquisa híbrida semântica e vetorial
- Gerenciamento de índice personalizado
- Capacidades avançadas de busca
- Requer `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Rastreamento e Monitoramento](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Para completar isto precisamos fazer alterações e reimplantar"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Rastreamento:**

- Integração com OpenTelemetry
- Rastreamento de requisições/respostas
- Métricas de desempenho
- Disponível no portal Microsoft Foundry

**Registro:**

- Logs da aplicação em Container Apps
- Registro estruturado com IDs de correlação
- Visualização de logs em tempo real e históricos

---

## 5.4 [Avaliação de Agentes](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Avaliação Local:**

- Avaliadores integrados para avaliação de qualidade
- Scripts de avaliação personalizados
- Benchmarking de desempenho

**Monitoramento Contínuo:**

- Avaliação automática de interações ao vivo
- Monitoramento de métricas de qualidade
- Detecção de regressões de desempenho

**Integração CI/CD:**

- Fluxo de trabalho do GitHub Actions
- Testes e avaliações automatizados
- Testes de comparação estatística

---

## 5.5 [Agente de Red Teaming de IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming de IA:**

- Escaneamento de segurança automatizado
- Avaliação de risco para sistemas de IA
- Avaliação de segurança em várias categorias

**Autenticação:**

- Managed Identity para serviços Azure
- Autenticação opcional do Azure App Service
- Fallback de autenticação básica para desenvolvimento



!!! quote "AO FINAL DESTE LABORATÓRIO VOCÊ DEVERIA TER"
    - [ ] Defina os requisitos do seu cenário
    - [ ] Variáveis de ambiente personalizadas (config)
    - [ ] Instruções do agente personalizadas (tarefa)
    - [ ] Implantou o template customizado (app)
    - [ ] Concluiu tarefas pós-implantação (manual)
    - [ ] Executou uma avaliação de teste

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Personalize para você!

### 5.6.1. Requisitos do Cenário

#### **Implantações de Agentes:** 

   - Agente de Compras: Ajuda os clientes a encontrar e comparar produtos
   - Agente de Fidelidade: Gerencia recompensas e promoções para clientes

#### **Implantações de Modelos:**

   - `gpt-4.1`: Modelo de chat primário
   - `o3`: Modelo de raciocínio para consultas complexas
   - `gpt-4.1-nano`: Modelo leve para interações simples
   - `text-embedding-3-large`: Embeddings de alta qualidade para busca

#### **Recursos:**

   - Rastreamento e monitoramento habilitados
   - AI Search para catálogo de produtos
   - Estrutura de avaliação para garantia de qualidade
   - Red teaming para validação de segurança

---

### 5.6.2 Implementação do Cenário


#### 5.6.2.1. Configuração Pré-Implantação

Crie um script de configuração (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Definir nome do ambiente
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configurar região (escolha com base na disponibilidade do modelo)
azd env set AZURE_LOCATION "eastus2"

# Ativar todos os serviços opcionais
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configurar modelo de chat primário (gpt-4.1 como o mais próximo disponível do gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configurar modelo de embeddings para pesquisa aprimorada
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Definir nome do agente (isso criará o primeiro agente)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configurar índice de busca
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instruções do Agente

Crie `custom-agents/shopper-agent-instructions.md`:

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

Crie `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Script de Implantação

Crie `deploy-retail.sh`:

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

# Configurar o ambiente
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Verificar cota na região selecionada
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

# Obter a URL do aplicativo web
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

#### 5.6.2.4: Configuração Pós-Implantação

Crie `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Obter informações de implantação
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

Crie `test-retail-deployment.sh`:

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

# Executar a avaliação se estiver configurada
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

Após seguir este guia de implementação, você terá:

1. **Infraestrutura Implantada:**

      - Projeto Microsoft Foundry com implantações de modelos
      - Container Apps hospedando a aplicação web
      - Serviço AI Search para catálogo de produtos
      - Application Insights para monitoramento

2. **Agente Inicial:**

      - Agente de Compras configurado com instruções básicas
      - Capacidade de pesquisa de arquivos habilitada
      - Rastreamento e monitoramento configurados

3. **Pronto para Personalização:**

      - Estrutura para adicionar o Agente de Fidelidade
      - Modelos de instruções personalizados
      - Scripts de teste e validação
      - Configuração de monitoramento e avaliação

4. **Pronto para Produção:**

      - Escaneamento de segurança com red teaming
      - Monitoramento de desempenho
      - Estrutura de avaliação de qualidade
      - Arquitetura escalável

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos empenhemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se uma tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->