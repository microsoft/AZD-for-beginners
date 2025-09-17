<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T15:16:32+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "pt"
}
-->
# Solução de Vários Agentes para Retalho - Implementação com ARM Template

**Capítulo 5: Pacote de Implementação em Produção**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Relacionado**: [Capítulo 5: Soluções Avançadas de IA com Vários Agentes](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guia do Cenário**: [Implementação Completa](../retail-scenario.md)
- **🎯 Implementação Rápida**: [Implementação com Um Clique](../../../../examples/retail-multiagent-arm-template)

Este diretório contém um template completo do Azure Resource Manager (ARM) para implementar a Solução de Suporte ao Cliente com Vários Agentes para Retalho, fornecendo infraestrutura como código para toda a arquitetura.

## 🎯 O que é Implementado

### Infraestrutura Principal
- **Serviços Azure OpenAI** (Multi-região para alta disponibilidade)
  - Região primária: GPT-4o para agente de clientes
  - Região secundária: GPT-4o-mini para agente de inventário  
  - Região terciária: Modelo de embeddings de texto
  - Região de avaliação: Modelo GPT-4o para avaliação
- **Azure AI Search** com capacidades de pesquisa vetorial
- **Conta de Armazenamento Azure** com containers de blobs para documentos e uploads
- **Ambiente de Aplicações em Contêineres Azure** com escalonamento automático
- **Aplicações em Contêineres** para roteador de agentes e interface frontend
- **Azure Cosmos DB** para armazenamento de histórico de conversas
- **Azure Key Vault** para gestão de segredos (opcional)
- **Application Insights** e Log Analytics para monitorização (opcional)
- **Document Intelligence** para processamento de documentos
- **API de Pesquisa Bing** para informações em tempo real

### Modos de Implementação

| Modo | Descrição | Caso de Uso | Recursos |
|------|-------------|----------|-----------|
| **Minimal** | Implementação básica otimizada para custos | Desenvolvimento, testes | SKUs básicos, única região, capacidade reduzida |
| **Standard** | Implementação equilibrada para cargas de trabalho de produção | Produção, escala moderada | SKUs padrão, multi-região, capacidade padrão |
| **Premium** | Implementação de alto desempenho para empresas | Empresas, alta escala | SKUs premium, multi-região, alta capacidade |

## 📋 Pré-requisitos

1. **Azure CLI** instalado e configurado
2. **Subscrição Azure ativa** com quotas suficientes
3. **Permissões adequadas** para criar recursos na subscrição alvo
4. **Quotas de recursos** para:
   - Azure OpenAI (verificar disponibilidade regional)
   - Aplicações em Contêineres (varia por região)
   - AI Search (recomenda-se o nível padrão ou superior)

## 🚀 Implementação Rápida

### Opção 1: Usando Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opção 2: Usando o Portal Azure

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opção 3: Usando Azure CLI diretamente

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opções de Configuração

### Parâmetros do Template

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefixo para todos os nomes de recursos |
| `location` | string | Localização do grupo de recursos | Região primária de implementação |
| `secondaryLocation` | string | "westus2" | Região secundária para implementação multi-região |
| `tertiaryLocation` | string | "francecentral" | Região para modelo de embeddings |
| `environmentName` | string | "dev" | Designação do ambiente (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuração de implementação (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Ativar implementação multi-região |
| `enableMonitoring` | bool | true | Ativar Application Insights e registos |
| `enableSecurity` | bool | true | Ativar Key Vault e segurança avançada |

### Personalização de Parâmetros

Editar `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Visão Geral da Arquitetura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Uso do Script de Implementação

O script `deploy.sh` fornece uma experiência de implementação interativa:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funcionalidades do Script

- ✅ **Validação de pré-requisitos** (Azure CLI, estado de login, ficheiros de template)
- ✅ **Gestão de grupos de recursos** (cria se não existir)
- ✅ **Validação do template** antes da implementação
- ✅ **Monitorização de progresso** com saída colorida
- ✅ **Exibição de resultados da implementação**
- ✅ **Orientação pós-implementação**

## 📊 Monitorização da Implementação

### Verificar Estado da Implementação

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Resultados da Implementação

Após uma implementação bem-sucedida, os seguintes resultados estarão disponíveis:

- **URL do Frontend**: Endpoint público para a interface web
- **URL do Roteador**: Endpoint API para o roteador de agentes
- **Endpoints OpenAI**: Endpoints primário e secundário do serviço OpenAI
- **Serviço de Pesquisa**: Endpoint do serviço Azure AI Search
- **Conta de Armazenamento**: Nome da conta de armazenamento para documentos
- **Key Vault**: Nome do Key Vault (se ativado)
- **Application Insights**: Nome do serviço de monitorização (se ativado)

## 🔧 Configuração Pós-Implementação

### 1. Configurar Índice de Pesquisa

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Carregar Dados Iniciais

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Testar Endpoints dos Agentes

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Configurar Aplicações em Contêineres

O template ARM implementa imagens de contêineres de placeholder. Para implementar o código real dos agentes:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Resolução de Problemas

### Problemas Comuns

#### 1. Quota do Azure OpenAI Excedida

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Falha na Implementação de Aplicações em Contêineres

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicialização do Serviço de Pesquisa

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validação da Implementação

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considerações de Segurança

### Gestão de Chaves
- Todos os segredos são armazenados no Azure Key Vault (quando ativado)
- Aplicações em contêineres utilizam identidade gerida para autenticação
- Contas de armazenamento têm padrões seguros (apenas HTTPS, sem acesso público a blobs)

### Segurança de Rede
- Aplicações em contêineres utilizam rede interna sempre que possível
- Serviço de pesquisa configurado com opção de endpoints privados
- Cosmos DB configurado com permissões mínimas necessárias

### Configuração de RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Otimização de Custos

### Estimativas de Custos (Mensais, USD)

| Modo | OpenAI | Aplicações em Contêineres | Pesquisa | Armazenamento | Estimativa Total |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Monitorização de Custos

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Atualizações e Manutenção

### Atualizações do Template
- Versionar os ficheiros de template ARM
- Testar alterações no ambiente de desenvolvimento primeiro
- Utilizar modo de implementação incremental para atualizações

### Atualizações de Recursos
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup e Recuperação
- Backup automático do Cosmos DB ativado
- Soft delete do Key Vault ativado
- Revisões de aplicações em contêineres mantidas para rollback

## 📞 Suporte

- **Problemas com o Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suporte Azure**: [Portal de Suporte Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunidade**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Pronto para implementar a sua solução de vários agentes?**

Comece com: `./deploy.sh -g myResourceGroup`

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.