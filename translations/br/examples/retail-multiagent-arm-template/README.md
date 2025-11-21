<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a8d383064bdb1ee923677a145de53ea",
  "translation_date": "2025-11-20T21:25:22+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "br"
}
-->
# Solução de Multi-Agentes para Varejo - Template de Infraestrutura

**Capítulo 5: Pacote de Implantação em Produção**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Relacionado**: [Capítulo 5: Soluções de IA Multi-Agentes](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guia do Cenário**: [Arquitetura Completa](../retail-scenario.md)
- **🎯 Implantação Rápida**: [Implantação com Um Clique](../../../../examples/retail-multiagent-arm-template)

> **⚠️ APENAS TEMPLATE DE INFRAESTRUTURA**  
> Este template ARM implanta **recursos do Azure** para um sistema de multi-agentes.  
>  
> **O que é implantado (15-25 minutos):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings em 3 regiões)
> - ✅ Serviço de Busca com IA (vazio, pronto para criação de índices)
> - ✅ Container Apps (imagens de placeholder, pronto para seu código)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights  
>  
> **O que NÃO está incluído (requer desenvolvimento):**
> - ❌ Código de implementação dos agentes (Agente de Cliente, Agente de Inventário)
> - ❌ Lógica de roteamento e endpoints de API
> - ❌ Interface de chat no frontend
> - ❌ Esquemas de índices de busca e pipelines de dados
> - ❌ **Esforço estimado de desenvolvimento: 80-120 horas**
>  
> **Use este template se:**
> - ✅ Você deseja provisionar infraestrutura do Azure para um projeto de multi-agentes
> - ✅ Você planeja desenvolver a implementação dos agentes separadamente
> - ✅ Você precisa de uma base de infraestrutura pronta para produção  
>  
> **Não use se:**
> - ❌ Você espera um demo funcional de multi-agentes imediatamente
> - ❌ Você está procurando exemplos completos de código de aplicação

## Visão Geral

Este diretório contém um template abrangente do Azure Resource Manager (ARM) para implantar a **fundação de infraestrutura** de um sistema de suporte ao cliente com multi-agentes. O template provisiona todos os serviços necessários do Azure, devidamente configurados e interconectados, prontos para o desenvolvimento da sua aplicação.

**Após a implantação, você terá:** Infraestrutura do Azure pronta para produção  
**Para completar o sistema, você precisa:** Código dos agentes, interface de frontend e configuração de dados (veja [Guia de Arquitetura](../retail-scenario.md))

## 🎯 O que é Implantado

### Infraestrutura Principal (Status Após Implantação)

✅ **Serviços Azure OpenAI** (Pronto para chamadas de API)
  - Região primária: Implantação GPT-4o (capacidade de 20K TPM)
  - Região secundária: Implantação GPT-4o-mini (capacidade de 10K TPM)
  - Região terciária: Modelo de embeddings de texto (capacidade de 30K TPM)
  - Região de avaliação: Modelo GPT-4o grader (capacidade de 15K TPM)
  - **Status:** Totalmente funcional - pode fazer chamadas de API imediatamente

✅ **Azure AI Search** (Vazio - pronto para configuração)
  - Capacidades de busca vetorial habilitadas
  - Nível padrão com 1 partição, 1 réplica
  - **Status:** Serviço em execução, mas requer criação de índice
  - **Ação necessária:** Criar índice de busca com seu esquema

✅ **Azure Storage Account** (Vazio - pronto para uploads)
  - Containers de blob: `documents`, `uploads`
  - Configuração segura (somente HTTPS, sem acesso público)
  - **Status:** Pronto para receber arquivos
  - **Ação necessária:** Fazer upload dos dados de produtos e documentos

⚠️ **Ambiente de Container Apps** (Imagens de placeholder implantadas)
  - Aplicativo de roteador de agentes (imagem padrão nginx)
  - Aplicativo de frontend (imagem padrão nginx)
  - Configuração de autoescalonamento (0-10 instâncias)
  - **Status:** Containers de placeholder em execução
  - **Ação necessária:** Construir e implantar suas aplicações de agentes

✅ **Azure Cosmos DB** (Vazio - pronto para dados)
  - Banco de dados e container pré-configurados
  - Otimizado para operações de baixa latência
  - TTL habilitado para limpeza automática
  - **Status:** Pronto para armazenar histórico de chat

✅ **Azure Key Vault** (Opcional - pronto para segredos)
  - Soft delete habilitado
  - RBAC configurado para identidades gerenciadas
  - **Status:** Pronto para armazenar chaves de API e strings de conexão

✅ **Application Insights** (Opcional - monitoramento ativo)
  - Conectado ao workspace do Log Analytics
  - Métricas personalizadas e alertas configurados
  - **Status:** Pronto para receber telemetria das suas aplicações

✅ **Document Intelligence** (Pronto para chamadas de API)
  - Nível S0 para cargas de trabalho de produção
  - **Status:** Pronto para processar documentos enviados

✅ **Bing Search API** (Pronto para chamadas de API)
  - Nível S1 para buscas em tempo real
  - **Status:** Pronto para consultas de busca na web

### Modos de Implantação

| Modo | Capacidade OpenAI | Instâncias de Container | Nível de Busca | Redundância de Storage | Melhor Para |
|------|-------------------|-------------------------|----------------|------------------------|-------------|
| **Minimal** | 10K-20K TPM | 0-2 réplicas | Básico | LRS (Local) | Dev/teste, aprendizado, prova de conceito |
| **Standard** | 30K-60K TPM | 2-5 réplicas | Padrão | ZRS (Zona) | Produção, tráfego moderado (<10K usuários) |
| **Premium** | 80K-150K TPM | 5-10 réplicas, redundância zonal | Premium | GRS (Geo) | Corporativo, alto tráfego (>10K usuários), SLA de 99,99% |

**Impacto de Custo:**
- **Minimal → Standard:** ~4x aumento de custo ($100-370/mês → $420-1.450/mês)
- **Standard → Premium:** ~3x aumento de custo ($420-1.450/mês → $1.150-3.500/mês)
- **Escolha com base em:** Carga esperada, requisitos de SLA, restrições de orçamento

**Planejamento de Capacidade:**
- **TPM (Tokens Por Minuto):** Total em todas as implantações de modelo
- **Instâncias de Container:** Faixa de autoescalonamento (mínimo-máximo de réplicas)
- **Nível de Busca:** Afeta desempenho de consulta e limites de tamanho de índice

## 📋 Pré-requisitos

### Ferramentas Necessárias
1. **Azure CLI** (versão 2.50.0 ou superior)
   ```bash
   az --version  # Verificar versão
   az login      # Autenticar
   ```

2. **Assinatura ativa do Azure** com acesso de Proprietário ou Colaborador
   ```bash
   az account show  # Verificar assinatura
   ```

### Quotas Necessárias no Azure

Antes da implantação, verifique se há quotas suficientes nas regiões alvo:

```bash
# Verifique a disponibilidade do Azure OpenAI na sua região
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifique a cota do OpenAI (exemplo para gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Verifique a cota de Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Quotas Mínimas Necessárias:**
- **Azure OpenAI:** 3-4 implantações de modelo em várias regiões
  - GPT-4o: 20K TPM (Tokens Por Minuto)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Nota:** GPT-4o pode ter lista de espera em algumas regiões - verifique [disponibilidade de modelos](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Ambiente gerenciado + 2-10 instâncias de container
- **AI Search:** Nível padrão (Básico insuficiente para busca vetorial)
- **Cosmos DB:** Throughput provisionado padrão

**Se a quota for insuficiente:**
1. Acesse o Portal do Azure → Quotas → Solicitar aumento
2. Ou use o Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Considere regiões alternativas com disponibilidade

## 🚀 Implantação Rápida

### Opção 1: Usando Azure CLI

```bash
# Clone ou baixe os arquivos do modelo
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Torne o script de implantação executável
chmod +x deploy.sh

# Implante com configurações padrão
./deploy.sh -g myResourceGroup

# Implante para produção com recursos premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opção 2: Usando o Portal do Azure

[![Implantar no Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opção 3: Usando Azure CLI diretamente

```bash
# Criar grupo de recursos
az group create --name myResourceGroup --location eastus2

# Implantar modelo
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Cronograma de Implantação

### O que Esperar

| Fase | Duração | O que Acontece |
|------|---------|----------------||
| **Validação do Template** | 30-60 segundos | O Azure valida a sintaxe e os parâmetros do template ARM |
| **Configuração do Grupo de Recursos** | 10-20 segundos | Cria o grupo de recursos (se necessário) |
| **Provisionamento do OpenAI** | 5-8 minutos | Cria 3-4 contas OpenAI e implanta modelos |
| **Container Apps** | 3-5 minutos | Cria o ambiente e implanta containers de placeholder |
| **Busca e Storage** | 2-4 minutos | Provisiona o serviço de Busca com IA e contas de armazenamento |
| **Cosmos DB** | 2-3 minutos | Cria banco de dados e configura containers |
| **Configuração de Monitoramento** | 2-3 minutos | Configura Application Insights e Log Analytics |
| **Configuração de RBAC** | 1-2 minutos | Configura identidades gerenciadas e permissões |
| **Implantação Total** | **15-25 minutos** | Infraestrutura completa pronta |

**Após a Implantação:**
- ✅ **Infraestrutura Pronta:** Todos os serviços do Azure provisionados e em execução
- ⏱️ **Desenvolvimento de Aplicação:** 80-120 horas (sua responsabilidade)
- ⏱️ **Configuração de Índices:** 15-30 minutos (requer seu esquema)
- ⏱️ **Upload de Dados:** Varia conforme o tamanho do conjunto de dados
- ⏱️ **Teste e Validação:** 2-4 horas

---

## ✅ Verificar Sucesso da Implantação

### Etapa 1: Verificar Provisionamento de Recursos (2 minutos)

```bash
# Verifique se todos os recursos foram implantados com sucesso
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Esperado:** Tabela vazia (todos os recursos mostram status "Succeeded")

### Etapa 2: Verificar Implantações do Azure OpenAI (3 minutos)

```bash
# Liste todas as contas OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Verifique as implantações de modelo para a região primária
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Esperado:** 
- 3-4 contas OpenAI (regiões primária, secundária, terciária, de avaliação)
- 1-2 implantações de modelo por conta (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Etapa 3: Testar Endpoints da Infraestrutura (5 minutos)

```bash
# Obter URLs do aplicativo de contêiner
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testar endpoint do roteador (uma imagem de espaço reservado responderá)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Esperado:** 
- Container Apps mostram status "Running"
- Placeholder nginx responde com HTTP 200 ou 404 (sem código de aplicação ainda)

### Etapa 4: Verificar Acesso à API do Azure OpenAI (3 minutos)

```bash
# Obter endpoint e chave do OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testar implantação do GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Esperado:** Resposta JSON com conclusão de chat (confirma que OpenAI está funcional)

### O que Está Funcionando vs. O que Não Está

**✅ Funcionando Após Implantação:**
- Modelos Azure OpenAI implantados e aceitando chamadas de API
- Serviço de Busca com IA em execução (vazio, sem índices ainda)
- Container Apps em execução (imagens de placeholder nginx)
- Contas de armazenamento acessíveis e prontas para uploads
- Cosmos DB pronto para operações de dados
- Application Insights coletando telemetria de infraestrutura
- Key Vault pronto para armazenamento de segredos

**❌ Ainda Não Funcionando (Requer Desenvolvimento):**
- Endpoints dos agentes (nenhum código de aplicação implantado)
- Funcionalidade de chat (requer implementação de frontend + backend)
- Consultas de busca (nenhum índice de busca criado ainda)
- Pipeline de processamento de documentos (nenhum dado enviado)
- Telemetria personalizada (requer instrumentação de aplicação)

**Próximos Passos:** Veja [Configuração Pós-Implantação](../../../../examples/retail-multiagent-arm-template) para desenvolver e implantar sua aplicação

---

## ⚙️ Opções de Configuração

### Parâmetros do Template

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `projectName` | string | "retail" | Prefixo para todos os nomes de recursos |
| `location` | string | Localização do grupo de recursos | Região primária de implantação |
| `secondaryLocation` | string | "westus2" | Região secundária para implantação multi-regional |
| `tertiaryLocation` | string | "francecentral" | Região para modelo de embeddings |
| `environmentName` | string | "dev" | Designação do ambiente (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuração de implantação (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Habilitar implantação multi-regional |
| `enableMonitoring` | bool | true | Habilitar Application Insights e logging |
| `enableSecurity` | bool | true | Habilitar Key Vault e segurança aprimorada |

### Personalizando Parâmetros

Edite `azuredeploy.parameters.json`:

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

## 📖 Uso do Script de Implantação

O script `deploy.sh` oferece uma experiência de implantação interativa:

```bash
# Mostrar ajuda
./deploy.sh --help

# Implantação básica
./deploy.sh -g myResourceGroup

# Implantação avançada com configurações personalizadas
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Implantação de desenvolvimento sem multi-região
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Recursos do Script

- ✅ **Validação de pré-requisitos** (Azure CLI, status de login, arquivos de template)
- ✅ **Gerenciamento de grupo de recursos** (cria se não existir)
- ✅ **Validação do template** antes da implantação
- ✅ **Monitoramento de progresso** com saída colorida
- ✅ **Exibição de outputs da implantação**
- ✅ **Orientação pós-implantação**

## 📊 Monitorando a Implantação

### Verificar Status da Implantação

```bash
# Listar implantações
az deployment group list --resource-group myResourceGroup --output table

# Obter detalhes da implantação
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Monitorar progresso da implantação
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Outputs da Implantação

Após a implantação bem-sucedida, os seguintes outputs estarão disponíveis:

- **URL do Frontend**: Endpoint público para a interface web
- **URL do Roteador**: Endpoint de API para o roteador de agentes
- **Endpoints do OpenAI**: Endpoints primário e secundário do serviço OpenAI
- **Serviço de Busca**: Endpoint do serviço Azure AI Search
- **Conta de Storage**: Nome da conta de armazenamento para documentos
- **Key Vault**: Nome do Key Vault (se habilitado)
- **Application Insights**: Nome do serviço de monitoramento (se habilitado)

## 🔧 Pós-Implantação: Próximos Passos
> **📝 Importante:** A infraestrutura está implantada, mas você precisa desenvolver e implantar o código do aplicativo.

### Fase 1: Desenvolver Aplicativos de Agentes (Sua Responsabilidade)

O template ARM cria **Container Apps vazios** com imagens nginx de exemplo. Você deve:

**Desenvolvimento Necessário:**
1. **Implementação de Agentes** (30-40 horas)
   - Agente de atendimento ao cliente com integração GPT-4o
   - Agente de inventário com integração GPT-4o-mini
   - Lógica de roteamento de agentes

2. **Desenvolvimento Frontend** (20-30 horas)
   - Interface de chat (React/Vue/Angular)
   - Funcionalidade de upload de arquivos
   - Renderização e formatação de respostas

3. **Serviços Backend** (12-16 horas)
   - Roteador FastAPI ou Express
   - Middleware de autenticação
   - Integração de telemetria

**Veja:** [Guia de Arquitetura](../retail-scenario.md) para padrões de implementação detalhados e exemplos de código

### Fase 2: Configurar o Índice de Busca com IA (15-30 minutos)

Crie um índice de busca que corresponda ao seu modelo de dados:

```bash
# Obter detalhes do serviço de busca
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Criar índice com seu esquema (exemplo)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Recursos:**
- [Design de Esquema de Índice de Busca com IA](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Configuração de Busca Vetorial](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Fazer Upload dos Seus Dados (Tempo variável)

Depois de ter os dados de produtos e documentos:

```bash
# Obter detalhes da conta de armazenamento
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Enviar seus documentos
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Exemplo: Enviar arquivo único
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Construir e Implantar Seus Aplicativos (8-12 horas)

Depois de desenvolver o código dos agentes:

```bash
# 1. Criar Azure Container Registry (se necessário)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Construir e enviar a imagem do roteador de agente
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Construir e enviar a imagem do frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Atualizar Container Apps com suas imagens
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Configurar variáveis de ambiente
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fase 5: Testar Seu Aplicativo (2-4 horas)

```bash
# Obtenha a URL do seu aplicativo
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Teste o endpoint do agente (uma vez que seu código esteja implantado)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Verifique os logs do aplicativo
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Recursos de Implementação

**Arquitetura e Design:**
- 📖 [Guia Completo de Arquitetura](../retail-scenario.md) - Padrões de implementação detalhados
- 📖 [Padrões de Design Multi-Agente](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Exemplos de Código:**
- 🔗 [Exemplo de Chat com Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Padrão RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework de agentes (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orquestração de agentes (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Conversas multi-agentes

**Esforço Total Estimado:**
- Implantação de infraestrutura: 15-25 minutos (✅ Completo)
- Desenvolvimento de aplicativos: 80-120 horas (🔨 Seu trabalho)
- Testes e otimização: 15-25 horas (🔨 Seu trabalho)

## 🛠️ Solução de Problemas

### Problemas Comuns

#### 1. Cota do Azure OpenAI Excedida

```bash
# Verificar uso atual de cota
az cognitiveservices usage list --location eastus2

# Solicitar aumento de cota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Falha na Implantação de Container Apps

```bash
# Verificar os logs do aplicativo do contêiner
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Reiniciar o aplicativo do contêiner
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicialização do Serviço de Busca

```bash
# Verificar o status do serviço de busca
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testar a conectividade do serviço de busca
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validação da Implantação

```bash
# Validar se todos os recursos foram criados
az resource list \
  --resource-group myResourceGroup \
  --output table

# Verificar a saúde dos recursos
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considerações de Segurança

### Gerenciamento de Chaves
- Todos os segredos são armazenados no Azure Key Vault (quando habilitado)
- Container apps utilizam identidade gerenciada para autenticação
- Contas de armazenamento possuem padrões seguros (apenas HTTPS, sem acesso público a blobs)

### Segurança de Rede
- Container apps utilizam rede interna sempre que possível
- Serviço de busca configurado com opção de endpoints privados
- Cosmos DB configurado com permissões mínimas necessárias

### Configuração de RBAC
```bash
# Atribuir funções necessárias para identidade gerenciada
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Otimização de Custos

### Estimativas de Custo (Mensal, USD)

| Modo     | OpenAI   | Container Apps | Busca   | Armazenamento | Estimativa Total |
|----------|----------|----------------|---------|---------------|------------------|
| Mínimo   | $50-200  | $20-50         | $25-100 | $5-20         | $100-370         |
| Padrão   | $200-800 | $100-300       | $100-300| $20-50        | $420-1450        |
| Premium  | $500-2000| $300-800       | $300-600| $50-100       | $1150-3500       |

### Monitoramento de Custos

```bash
# Configurar alertas de orçamento
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Atualizações e Manutenção

### Atualizações de Template
- Controle de versão dos arquivos de template ARM
- Teste alterações primeiro no ambiente de desenvolvimento
- Use o modo de implantação incremental para atualizações

### Atualizações de Recursos
```bash
# Atualizar com novos parâmetros
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup e Recuperação
- Backup automático do Cosmos DB habilitado
- Soft delete habilitado no Key Vault
- Revisões de Container Apps mantidas para rollback

## 📞 Suporte

- **Problemas com Templates**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suporte Azure**: [Portal de Suporte Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunidade**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Pronto para implantar sua solução multi-agente?**

Comece com: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->