# Solução Multi-Agente para Retalho - Modelo de Infraestrutura

**Capítulo 5: Pacote de Implementação em Produção**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Relacionado**: [Capítulo 5: Soluções de IA Multi-Agente](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Guia do Cenário**: [Arquitetura Completa](../retail-scenario.md)
- **🎯 Implementação Rápida**: [Implementação com Um Clique](../../../../examples/retail-multiagent-arm-template)

> **⚠️ APENAS MODELO DE INFRAESTRUTURA**  
> Este modelo ARM implementa **recursos Azure** para um sistema multi-agente.  
>  
> **O que é implementado (15-25 minutos):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings em 3 regiões)
> - ✅ Serviço de Pesquisa de IA (vazio, pronto para criação de índices)
> - ✅ Container Apps (imagens de espaço reservado, pronto para o seu código)
> - ✅ Armazenamento, Cosmos DB, Key Vault, Application Insights
>  
> **O que NÃO está incluído (requer desenvolvimento):**
> - ❌ Código de implementação dos agentes (Agente de Cliente, Agente de Inventário)
> - ❌ Lógica de roteamento e endpoints de API
> - ❌ Interface de chat frontend
> - ❌ Esquemas de índice de pesquisa e pipelines de dados
> - ❌ **Esforço estimado de desenvolvimento: 80-120 horas**
>  
> **Use este modelo se:**
> - ✅ Pretende provisionar infraestrutura Azure para um projeto multi-agente
> - ✅ Planeia desenvolver a implementação dos agentes separadamente
> - ✅ Precisa de uma base de infraestrutura pronta para produção
>  
> **Não use se:**
> - ❌ Espera uma demonstração funcional de multi-agentes imediatamente
> - ❌ Procura exemplos completos de código de aplicação

## Visão Geral

Este diretório contém um modelo abrangente do Azure Resource Manager (ARM) para implementar a **fundação de infraestrutura** de um sistema de suporte ao cliente multi-agente. O modelo provisiona todos os serviços Azure necessários, devidamente configurados e interconectados, prontos para o desenvolvimento da sua aplicação.

**Após a implementação, terá:** Infraestrutura Azure pronta para produção  
**Para completar o sistema, precisará de:** Código dos agentes, interface frontend e configuração de dados (consulte [Guia de Arquitetura](../retail-scenario.md))

## 🎯 O Que é Implementado

### Infraestrutura Principal (Estado Após Implementação)

✅ **Serviços Azure OpenAI** (Prontos para chamadas de API)
  - Região primária: Implementação GPT-4o (capacidade de 20K TPM)
  - Região secundária: Implementação GPT-4o-mini (capacidade de 10K TPM)
  - Região terciária: Modelo de embeddings de texto (capacidade de 30K TPM)
  - Região de avaliação: Modelo avaliador GPT-4o (capacidade de 15K TPM)
  - **Estado:** Totalmente funcional - pode fazer chamadas de API imediatamente

✅ **Azure AI Search** (Vazio - pronto para configuração)
  - Capacidades de pesquisa vetorial ativadas
  - Nível Standard com 1 partição, 1 réplica
  - **Estado:** Serviço em execução, mas requer criação de índice
  - **Ação necessária:** Criar índice de pesquisa com o seu esquema

✅ **Conta de Armazenamento Azure** (Vazia - pronta para uploads)
  - Contêineres Blob: `documents`, `uploads`
  - Configuração segura (apenas HTTPS, sem acesso público)
  - **Estado:** Pronto para receber ficheiros
  - **Ação necessária:** Carregar os seus dados de produtos e documentos

⚠️ **Ambiente de Container Apps** (Imagens de espaço reservado implementadas)
  - Aplicação de roteamento de agentes (imagem padrão nginx)
  - Aplicação frontend (imagem padrão nginx)
  - Configuração de auto-escalonamento (0-10 instâncias)
  - **Estado:** Contêineres de espaço reservado em execução
  - **Ação necessária:** Construir e implementar as suas aplicações de agentes

✅ **Azure Cosmos DB** (Vazio - pronto para dados)
  - Base de dados e contêiner pré-configurados
  - Otimizado para operações de baixa latência
  - TTL ativado para limpeza automática
  - **Estado:** Pronto para armazenar histórico de chat

✅ **Azure Key Vault** (Opcional - pronto para segredos)
  - Eliminação suave ativada
  - RBAC configurado para identidades geridas
  - **Estado:** Pronto para armazenar chaves de API e strings de conexão

✅ **Application Insights** (Opcional - monitorização ativa)
  - Conectado ao espaço de trabalho Log Analytics
  - Métricas personalizadas e alertas configurados
  - **Estado:** Pronto para receber telemetria das suas aplicações

✅ **Document Intelligence** (Pronto para chamadas de API)
  - Nível S0 para cargas de trabalho de produção
  - **Estado:** Pronto para processar documentos carregados

✅ **Bing Search API** (Pronto para chamadas de API)
  - Nível S1 para pesquisas em tempo real
  - **Estado:** Pronto para consultas de pesquisa na web

### Modos de Implementação

| Modo | Capacidade OpenAI | Instâncias de Contêiner | Nível de Pesquisa | Redundância de Armazenamento | Ideal Para |
|------|-------------------|-------------------------|-------------------|-----------------------------|------------|
| **Minimal** | 10K-20K TPM | 0-2 réplicas | Básico | LRS (Local) | Dev/teste, aprendizagem, prova de conceito |
| **Standard** | 30K-60K TPM | 2-5 réplicas | Standard | ZRS (Zona) | Produção, tráfego moderado (<10K utilizadores) |
| **Premium** | 80K-150K TPM | 5-10 réplicas, redundância zonal | Premium | GRS (Geo) | Empresarial, tráfego elevado (>10K utilizadores), SLA de 99,99% |

**Impacto nos Custos:**
- **Minimal → Standard:** ~4x aumento de custo ($100-370/mês → $420-1.450/mês)
- **Standard → Premium:** ~3x aumento de custo ($420-1.450/mês → $1.150-3.500/mês)
- **Escolha com base em:** Carga esperada, requisitos de SLA, restrições orçamentais

**Planeamento de Capacidade:**
- **TPM (Tokens Por Minuto):** Total em todas as implementações de modelo
- **Instâncias de Contêiner:** Intervalo de auto-escalonamento (mín-máx réplicas)
- **Nível de Pesquisa:** Afeta o desempenho das consultas e os limites de tamanho do índice

## 📋 Pré-requisitos

### Ferramentas Necessárias
1. **Azure CLI** (versão 2.50.0 ou superior)
   ```bash
   az --version  # Verificar versão
   az login      # Autenticar
   ```

2. **Subscrição Azure ativa** com acesso de Proprietário ou Contribuidor
   ```bash
   az account show  # Verificar subscrição
   ```

### Quotas Azure Necessárias

Antes da implementação, verifique se há quotas suficientes nas suas regiões-alvo:

```bash
# Verifique a disponibilidade do Azure OpenAI na sua região
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifique a quota do OpenAI (exemplo para gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Verifique a quota de Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Quotas Mínimas Necessárias:**
- **Azure OpenAI:** 3-4 implementações de modelo em várias regiões
  - GPT-4o: 20K TPM (Tokens Por Minuto)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Nota:** GPT-4o pode ter lista de espera em algumas regiões - verifique [disponibilidade do modelo](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Ambiente gerido + 2-10 instâncias de contêiner
- **AI Search:** Nível Standard (Básico insuficiente para pesquisa vetorial)
- **Cosmos DB:** Throughput provisionado padrão

**Se a quota for insuficiente:**
1. Aceda ao Portal Azure → Quotas → Solicitar aumento
2. Ou use o Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Considere regiões alternativas com disponibilidade

## 🚀 Implementação Rápida

### Opção 1: Usando Azure CLI

```bash
# Clonar ou descarregar os ficheiros do modelo
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Tornar o script de implementação executável
chmod +x deploy.sh

# Implementar com configurações padrão
./deploy.sh -g myResourceGroup

# Implementar para produção com funcionalidades premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opção 2: Usando o Portal Azure

[![Implementar no Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opção 3: Usando diretamente o Azure CLI

```bash
# Criar grupo de recursos
az group create --name myResourceGroup --location eastus2

# Implementar modelo
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Cronograma de Implementação

### O Que Esperar

| Fase | Duração | O Que Acontece |
|------|---------|----------------||
| **Validação do Modelo** | 30-60 segundos | Azure valida a sintaxe e os parâmetros do modelo ARM |
| **Configuração do Grupo de Recursos** | 10-20 segundos | Cria o grupo de recursos (se necessário) |
| **Provisionamento OpenAI** | 5-8 minutos | Cria 3-4 contas OpenAI e implementa modelos |
| **Container Apps** | 3-5 minutos | Cria ambiente e implementa contêineres de espaço reservado |
| **Pesquisa & Armazenamento** | 2-4 minutos | Provisiona serviço de Pesquisa de IA e contas de armazenamento |
| **Cosmos DB** | 2-3 minutos | Cria base de dados e configura contêineres |
| **Configuração de Monitorização** | 2-3 minutos | Configura Application Insights e Log Analytics |
| **Configuração de RBAC** | 1-2 minutos | Configura identidades geridas e permissões |
| **Implementação Total** | **15-25 minutos** | Infraestrutura completa e pronta |

**Após a Implementação:**
- ✅ **Infraestrutura Pronta:** Todos os serviços Azure provisionados e em execução
- ⏱️ **Desenvolvimento de Aplicação:** 80-120 horas (sua responsabilidade)
- ⏱️ **Configuração de Índice:** 15-30 minutos (requer o seu esquema)
- ⏱️ **Carregamento de Dados:** Varia conforme o tamanho do conjunto de dados
- ⏱️ **Testes & Validação:** 2-4 horas

---

## ✅ Verificar Sucesso da Implementação

### Passo 1: Verificar Provisionamento de Recursos (2 minutos)

```bash
# Verificar se todos os recursos foram implementados com sucesso
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Esperado:** Tabela vazia (todos os recursos mostram estado "Succeeded")

### Passo 2: Verificar Implementações OpenAI no Azure (3 minutos)

```bash
# Listar todas as contas OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Verificar implementações de modelos para a região principal
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
- 1-2 implementações de modelo por conta (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Passo 3: Testar Endpoints da Infraestrutura (5 minutos)

```bash
# Obter URLs da Aplicação de Contêiner
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Testar endpoint do router (uma imagem de marcador de posição irá responder)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Esperado:** 
- Container Apps mostram estado "Running"
- Nginx de espaço reservado responde com HTTP 200 ou 404 (ainda sem código de aplicação)

### Passo 4: Verificar Acesso à API OpenAI no Azure (3 minutos)

```bash
# Obter o endpoint e a chave da OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Testar a implementação do GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Esperado:** Resposta JSON com conclusão de chat (confirma que OpenAI está funcional)

### O Que Está a Funcionar vs. O Que Não Está

**✅ Funcional Após Implementação:**
- Modelos OpenAI no Azure implementados e aceitando chamadas de API
- Serviço de Pesquisa de IA em execução (vazio, sem índices ainda)
- Container Apps em execução (imagens nginx de espaço reservado)
- Contas de armazenamento acessíveis e prontas para uploads
- Cosmos DB pronto para operações de dados
- Application Insights a recolher telemetria da infraestrutura
- Key Vault pronto para armazenamento de segredos

**❌ Ainda Não Funcional (Requer Desenvolvimento):**
- Endpoints dos agentes (nenhum código de aplicação implementado)
- Funcionalidade de chat (requer implementação frontend + backend)
- Consultas de pesquisa (nenhum índice de pesquisa criado ainda)
- Pipeline de processamento de documentos (nenhum dado carregado)
- Telemetria personalizada (requer instrumentação da aplicação)

**Próximos Passos:** Consulte [Configuração Pós-Implementação](../../../../examples/retail-multiagent-arm-template) para desenvolver e implementar a sua aplicação

---

## ⚙️ Opções de Configuração

### Parâmetros do Modelo

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `projectName` | string | "retail" | Prefixo para todos os nomes de recursos |
| `location` | string | Localização do grupo de recursos | Região primária de implementação |
| `secondaryLocation` | string | "westus2" | Região secundária para implementação multi-região |
| `tertiaryLocation` | string | "francecentral" | Região para modelo de embeddings |
| `environmentName` | string | "dev" | Designação do ambiente (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Configuração de implementação (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Ativar implementação multi-região |
| `enableMonitoring` | bool | true | Ativar Application Insights e registo |
| `enableSecurity` | bool | true | Ativar Key Vault e segurança avançada |

### Personalizar Parâmetros

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

## 📖 Utilização do Script de Implementação

O script `deploy.sh` oferece uma experiência de implementação interativa:

```bash
# Mostrar ajuda
./deploy.sh --help

# Implementação básica
./deploy.sh -g myResourceGroup

# Implementação avançada com configurações personalizadas
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Implementação de desenvolvimento sem multi-região
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Funcionalidades do Script

- ✅ **Validação de pré-requisitos** (Azure CLI, estado de login, ficheiros de modelo)
- ✅ **Gestão de grupo de recursos** (cria se não existir)
- ✅ **Validação do modelo** antes da implementação
- ✅ **Monitorização de progresso** com saída colorida
- ✅ **Exibição de outputs da implementação**
- ✅ **Orientação pós-implementação**

## 📊 Monitorizar Implementação

### Verificar Estado da Implementação

```bash
# Listar implementações
az deployment group list --resource-group myResourceGroup --output table

# Obter detalhes da implementação
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Monitorizar o progresso da implementação
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Outputs da Implementação

Após implementação bem-sucedida, os seguintes outputs estarão disponíveis:

- **URL do Frontend**: Endpoint público para a interface web
- **URL do Router**: Endpoint da API para o roteador de agentes
- **Endpoints OpenAI**: Endpoints primário e secundário do serviço OpenAI
- **Serviço de Pesquisa**: Endpoint do serviço Azure AI Search
- **Conta de Armazenamento**: Nome da conta de armazenamento para documentos
- **Key Vault**: Nome do Key Vault (se ativado)
- **Application Insights**: Nome do serviço de monitorização (se ativado)

## 🔧 Pós-Implementação: Próximos Passos
> **📝 Importante:** A infraestrutura está implementada, mas é necessário desenvolver e implementar o código da aplicação.

### Fase 1: Desenvolver Aplicações de Agentes (Sua Responsabilidade)

O template ARM cria **Container Apps vazios** com imagens nginx de exemplo. Você deve:

**Desenvolvimento Necessário:**
1. **Implementação de Agentes** (30-40 horas)
   - Agente de atendimento ao cliente com integração GPT-4o
   - Agente de inventário com integração GPT-4o-mini
   - Lógica de roteamento de agentes

2. **Desenvolvimento Frontend** (20-30 horas)
   - Interface de chat (React/Vue/Angular)
   - Funcionalidade de upload de ficheiros
   - Renderização e formatação de respostas

3. **Serviços Backend** (12-16 horas)
   - Router FastAPI ou Express
   - Middleware de autenticação
   - Integração de telemetria

**Veja:** [Guia de Arquitetura](../retail-scenario.md) para padrões de implementação detalhados e exemplos de código

### Fase 2: Configurar o Índice de Pesquisa de IA (15-30 minutos)

Crie um índice de pesquisa que corresponda ao seu modelo de dados:

```bash
# Obter detalhes do serviço de pesquisa
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Criar índice com o seu esquema (exemplo)
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
- [Design de Esquema de Índice de Pesquisa de IA](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Configuração de Pesquisa Vetorial](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Carregar os Seus Dados (Tempo variável)

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

# Carregar os seus documentos
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Exemplo: Carregar ficheiro único
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Construir e Implementar as Suas Aplicações (8-12 horas)

Depois de desenvolver o código dos seus agentes:

```bash
# 1. Criar o Azure Container Registry (se necessário)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Construir e enviar a imagem do router do agente
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Construir e enviar a imagem do frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Atualizar os Container Apps com as suas imagens
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

### Fase 5: Testar a Sua Aplicação (2-4 horas)

```bash
# Obtenha o URL da sua aplicação
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Teste o endpoint do agente (uma vez que o seu código esteja implementado)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Verifique os registos da aplicação
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
- 🔗 [Exemplo de Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Padrão RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Framework de agentes (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orquestração de agentes (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Conversas multi-agentes

**Esforço Total Estimado:**
- Implementação da infraestrutura: 15-25 minutos (✅ Completo)
- Desenvolvimento de aplicações: 80-120 horas (🔨 Seu trabalho)
- Testes e otimização: 15-25 horas (🔨 Seu trabalho)

## 🛠️ Resolução de Problemas

### Problemas Comuns

#### 1. Limite de Quota do Azure OpenAI Excedido

```bash
# Verificar utilização atual da quota
az cognitiveservices usage list --location eastus2

# Solicitar aumento de quota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Falha na Implementação de Container Apps

```bash
# Verificar os registos da aplicação do contentor
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Reiniciar a aplicação do contentor
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inicialização do Serviço de Pesquisa

```bash
# Verificar o estado do serviço de pesquisa
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Testar a conectividade do serviço de pesquisa
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validação da Implementação

```bash
# Validar se todos os recursos foram criados
az resource list \
  --resource-group myResourceGroup \
  --output table

# Verificar a integridade dos recursos
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Considerações de Segurança

### Gestão de Chaves
- Todos os segredos são armazenados no Azure Key Vault (quando ativado)
- Container apps utilizam identidade gerida para autenticação
- Contas de armazenamento têm padrões seguros (apenas HTTPS, sem acesso público a blobs)

### Segurança de Rede
- Container apps utilizam rede interna sempre que possível
- Serviço de pesquisa configurado com opção de endpoints privados
- Cosmos DB configurado com permissões mínimas necessárias

### Configuração RBAC
```bash
# Atribuir funções necessárias para identidade gerida
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Otimização de Custos

### Estimativas de Custos (Mensal, USD)

| Modo     | OpenAI   | Container Apps | Pesquisa | Armazenamento | Total Estimado |
|----------|----------|----------------|----------|---------------|----------------|
| Mínimo   | $50-200  | $20-50         | $25-100  | $5-20         | $100-370       |
| Padrão   | $200-800 | $100-300       | $100-300 | $20-50        | $420-1450      |
| Premium  | $500-2000| $300-800       | $300-600 | $50-100       | $1150-3500     |

### Monitorização de Custos

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
- Controle de versão dos ficheiros de template ARM
- Teste alterações primeiro no ambiente de desenvolvimento
- Utilize o modo de implementação incremental para atualizações

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
- Backup automático do Cosmos DB ativado
- Soft delete do Key Vault ativado
- Revisões de Container Apps mantidas para rollback

## 📞 Suporte

- **Problemas com Templates**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Suporte Azure**: [Portal de Suporte Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Comunidade**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Pronto para implementar a sua solução multi-agente?**

Comece com: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->