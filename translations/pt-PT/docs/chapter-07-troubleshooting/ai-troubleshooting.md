# Guia de Resolução de Problemas Específico para IA

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Resolução de Problemas e Depuração
- **⬅️ Anterior**: [Guia de Depuração](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desenvolvimento com Prioridade em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

Este guia abrangente de resolução de problemas aborda questões comuns ao implementar soluções de IA com AZD, fornecendo soluções e técnicas de depuração específicas para os serviços Azure AI.

> **Âmbito:** Os comandos usam nomes de recursos de exemplo; substitua-os e selecione a subscrição correta. Os blocos Bicep são fragmentos para mesclar num template existente, não implementações autónomas. Os fragmentos Python requerem os SDKs indicados e configuração da aplicação. Nenhuma implementação real no Azure foi executada para esta revisão.

## Índice

- [Problemas com o Serviço Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problemas no Azure AI Search](#azure-ai-search-problems)
- [Problemas na Implementação de Container Apps](#container-apps-deployment-issues)
- [Erros de Autenticação e Permissões](#authentication-and-permission-errors)
- [Falhas na Implementação de Modelos](#model-deployment-failures)
- [Problemas de Performance e Escalabilidade](#performance-and-scaling-issues)
- [Gestão de Custos e Quotas](#cost-and-quota-management)
- [Ferramentas e Técnicas de Depuração](#debugging-tools-and-techniques)

## Problemas no Serviço Microsoft Foundry Models

### Problema: Serviço OpenAI Indisponível na Região

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Microsoft Foundry Models não disponível na região selecionada
- Quota esgotada nas regiões preferidas
- Restrições de capacidade regionais

**Soluções:**

1. **Verificar Disponibilidade da Região:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Atualizar Configuração AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Usar Regiões Alternativas:**
```bicep
// infra/main.bicep - Explicit location selection, NOT automatic fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Problema: Quota de Implementação de Modelo Excedida

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Soluções:**

1. **Verificar Quota Atual:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Solicitar Aumento de Quota:**
Utilize o fluxo de trabalho de gestão de quotas no portal Foundry para a subscrição, região, modelo e tipo de implementação afetados. Veja as [orientações oficiais sobre quotas](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Um pedido de quota para VM não aumenta a quota de modelos.

3. **Otimizar Capacidade do Modelo:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi // Existing account resource declared in your template
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'GlobalStandard' // Verify this model/version/type in the target region
    capacity: 1  // Capacity units are model/deployment-type specific
  }
}
```

### Problema: Versão Inválida da API

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluções:**

1. **Usar Versão de API Suportada:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Verificar Compatibilidade da Versão da API:**
Verifique a [referência do ciclo de vida da API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). As versões da API do fornecedor de recursos ARM **não** listam versões da API do plano de dados/inferência. Os novos clientes v1 usam `/openai/v1/` sem um `api-version` datado; não misture as duas configurações de cliente.

## Problemas no Azure AI Search

### Problema: Camada de Preço do Serviço de Pesquisa Insuficiente

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluções:**

1. **Usar uma Camada de Preço Suportada:**

O rankeador semântico requer Basic ou superior. Mudar de Free/Basic para uma camada diferente pode exigir criar um novo serviço de pesquisa e reconstruir índices; editar um SKU não garante uma atualização no local.
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  location: location
  sku: {
    name: 'basic'  // Minimum for semantic search
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    semanticSearch: 'standard'
  }
}
```

2. **Desativar Pesquisa Semântica (Desenvolvimento):**
```bicep
// For development environments
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  sku: {
    name: 'free'
  }
  properties: {
    semanticSearch: 'disabled'
  }
}
```

### Problema: Falhas na Criação de Índices

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluções:**

1. **Verificar Chaves do Serviço de Pesquisa:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Verificar Esquema do Índice:**
```python
# Validate index schema
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    # These are this application's requirements, not universal Search fields.
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Usar Identidade Gerida:**
```bicep
// Grant index-definition management permissions to the managed identity.
// Search Index Data Contributor manages documents, not index definitions.
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, 'Search Service Contributor')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalType: 'ServicePrincipal'
  }
}
```

## Problemas na Implementação de Container Apps

### Problema: Falhas na Construção do Container

**Sintomas:**
```
Error: Failed to build container image
```

**Soluções:**

1. **Verificar Sintaxe do Dockerfile:**
```dockerfile
# Dockerfile - Python AI app example
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

2. **Validar Dependências:**
```txt
# Dependency names for these snippets. Resolve supported versions in your
# project's environment, test together, then commit a lock/pinned requirements file.
fastapi
uvicorn
openai
azure-identity
azure-keyvault-secrets
azure-search-documents
azure-cosmos
```

3. **Adicionar Verificação de Saúde:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Falhas na Inicialização do Container App

**Sintomas:**
```
Error: Container failed to start within timeout period
```

**Soluções:**

1. **Aumentar Timeout de Inicialização:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          probes: [
            {
              type: 'Startup'
              httpGet: {
                path: '/health'
                port: 8000
              }
              initialDelaySeconds: 30
              periodSeconds: 10
              timeoutSeconds: 5
              failureThreshold: 10  // Allow more time for AI models to load
            }
          ]
        }
      ]
    }
  }
}
```

2. **Otimizar Carregamento do Modelo:**
```python
# Lazy load models to reduce startup time
# Illustrative skeleton: implement _initialize_client and synchronize concurrent
# initialization before using this pattern in an application.
import asyncio
from contextlib import asynccontextmanager
from fastapi import FastAPI

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Initialize AI client here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    app.state.model_manager = ModelManager()
    yield
    # Shutdown
    pass

app = FastAPI(lifespan=lifespan)
```

## Erros de Autenticação e Permissões

### Problema: Permissão Negada à Identidade Gerida

**Sintomas:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluções:**

1. **Verificar Atribuições de Função:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Atribuir Funções Necessárias:**
```bicep
// Required role assignments for AI services
var cognitiveServicesOpenAIUserRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
var searchIndexDataContributorRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAi
  name: guid(openAi.id, containerApp.id, cognitiveServicesOpenAIUserRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: cognitiveServicesOpenAIUserRole
    principalType: 'ServicePrincipal'
  }
}
```

3. **Testar Autenticação:**
```python
# Test managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

def test_authentication():
    try:
        with DefaultAzureCredential() as credential:
            token = credential.get_token("https://cognitiveservices.azure.com/.default")
            print(f"Token acquired; expires at Unix time {token.expires_on}")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")

test_authentication()
```

A aquisição do token comprova autenticação, não permissão para invocar um modelo. Teste a operação pretendida separadamente. Localmente, `DefaultAzureCredential` pode usar credenciais de desenvolvedor; no Azure, verifique se a identidade gerida pretendida está selecionada.

### Problema: Acesso Negado ao Key Vault

**Sintomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluções:**

1. **Conceder Permissões no Key Vault:**

Use o seguinte fragmento de política de acesso apenas para um cofre com `enableRbacAuthorization: false`. Para um cofre habilitado para RBAC, use a opção 2; adicionar uma política de acesso não concede acesso ao plano de dados no modo RBAC.
```bicep
resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: containerApp.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
  }
}
```

2. **Usar RBAC em vez de Políticas de Acesso:**

O cofre deve ter `enableRbacAuthorization: true`; mudar modelos de permissão requer uma migração planeada do acesso existente.
```bicep
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, containerApp.id, 'Key Vault Secrets User')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalType: 'ServicePrincipal'
  }
}
```

## Falhas na Implementação do Modelo

### Problema: Versão do Modelo Não Disponível

**Sintomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluções:**

1. **Verificar Modelos Disponíveis:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Selecionar um Modelo Disponível Explicitamente:**
```bicep
// Example model selection; verify version and deployment type in the catalog.
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2025-04-14'
}

// Bicep does not catch provisioning failures and retry a fallback model.
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: primaryModel.name
      version: primaryModel.version
    }
  }
  sku: {
    name: 'GlobalStandard'
    capacity: 10
  }
}
```

3. **Validar Modelo Antes da Implementação:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problemas de Performance e Escalabilidade

### Problema: Respostas com Alta Latência

**Sintomas:**
- Tempos de resposta > 30 segundos
- Erros de timeout
- Má experiência para o utilizador

**Soluções:**

1. **Implementar Timeouts nas Requisições:**
```python
# Configure proper timeouts
import httpx

client = httpx.AsyncClient(
    timeout=httpx.Timeout(
        connect=5.0,
        read=30.0,
        write=10.0,
        pool=10.0
    )
)
```

2. **Adicionar Cache de Respostas:**
```python
# Redis cache for responses
import redis.asyncio as redis
import json

class ResponseCache:
    def __init__(self, redis_url: str):
        self.redis = redis.from_url(redis_url)
        
    async def get_cached_response(self, query_hash: str) -> str | None:
        """Get cached response if available."""
        cached = await self.redis.get(f"ai_response:{query_hash}")
        return cached.decode() if cached else None
        
    async def cache_response(self, query_hash: str, response: str, ttl: int = 3600):
        """Cache AI response with TTL."""
        await self.redis.setex(f"ai_response:{query_hash}", ttl, response)
```

3. **Configurar Auto-escalonamento:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      scale: {
        minReplicas: 2
        maxReplicas: 20
        rules: [
          {
            name: 'http-requests'
            http: {
              metadata: {
                concurrentRequests: '5'  // Scale aggressively for AI workloads
              }
            }
          }
          {
            name: 'cpu-utilization'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '60'  // Lower threshold for AI apps
              }
            }
          }
        ]
      }
    }
  }
}
```

### Problema: Erros por Falta de Memória

**Sintomas:**
```
Error: Container killed due to memory limit exceeded
```

**Soluções:**

1. **Aumentar Alocação de Memória:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          resources: {
            cpu: json('1.0')
            memory: '2Gi'  // Increase for AI workloads
          }
        }
      ]
    }
  }
}
```

2. **Otimizar Uso de Memória:**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def _process_ai_request(self, request):
        raise NotImplementedError("Supply the application's AI operation")

    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check memory usage before processing
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Force garbage collection
            
        result = await self._process_ai_request(request)
        
        # Clean up after processing
        gc.collect()
        return result
```

## Gestão de Custos e Quotas

### Problema: Custos Elevados Inesperados

**Sintomas:**
- Fatura Azure superior ao esperado
- Utilização de tokens excedendo estimativas
- Alertas de orçamento disparados

**Soluções:**

1. **Implementar Controlo de Custos:**
```python
# Token usage tracking
class TokenTracker:
    def __init__(self, monthly_limit: int = 100000):
        self.monthly_limit = monthly_limit
        self.current_usage = 0
        
    async def track_usage(self, prompt_tokens: int, completion_tokens: int):
        """Track token usage with limits."""
        total_tokens = prompt_tokens + completion_tokens
        self.current_usage += total_tokens
        
        if self.current_usage > self.monthly_limit:
            raise Exception("Monthly token limit exceeded")
            
        return total_tokens
```

Este contador em memória é ilustrativo, não um controlo mensal de gastos: reinicia ao reiniciar, não é partilhado entre réplicas e verifica uso apenas após uma chamada. Um limite real necessita de contabilidade durável, reservas seguras para concorrência antes das requisições e política de reset mensal. Métricas de memória do container também devem contabilizar limites de cgroup; `psutil.virtual_memory()` não é uma medida fiável do limite do container, e a recolha de lixo não impõe um limite de memória.

2. **Configurar Alertas de Custos:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate // Parameter: first day of a supported budget period
      endDate: budgetEndDate     // Parameter: a future date
    }
    timeGrain: 'Monthly'
    amount: 500  // Notification threshold in the subscription's billing currency
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        thresholdType: 'Actual'
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

Declare `budgetStartDate` e `budgetEndDate` no seu template. Os orçamentos notificam; não param recursos nem impõem um limite rígido de gastos.

3. **Otimizar Seleção de Modelos:**
```python
# Cost-aware model selection
MODEL_COST_TIERS = {
  'gpt-4.1-mini': 'low',
  'gpt-4.1': 'high'
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    else:
        return 'gpt-4.1'
```

## Ferramentas e Técnicas de Depuração

### Comandos de Depuração AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View application logs (opens monitoring dashboard)
azd monitor --logs

# View live metrics
azd monitor --live

# Check environment variables
azd env get-values
```

### Comandos da Extensão AI AZD para Diagnósticos

Se implementou agentes usando `azd ai agent init`, estas ferramentas adicionais estão disponíveis:

```bash
# Ensure the agents extension is installed
azd extension install azure.ai.agents

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Dica:** Use `azd infra generate` para gravar IaC no disco para poder inspecionar exatamente que recursos foram provisionados. Isto é inestimável ao depurar problemas de configuração de recursos. Veja a [referência AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalhes completos.

**Diagnósticos conscientes do lançamento (2026-11-04):** Agentes `1.0.0-beta.23` requerem `azd >= 1.37.0`; atualize o CLI principal antes de extensões incompatíveis. Esta versão do agente mantém avisos RBAC de desenvolvedor na saída final da implementação e identifica a versão envolvida em falhas/timeout de ativação. Um timeout não indica que a implementação falhou: inspecione a versão tentada antes de recomeçar. Também corrige invocações A2A 0.3 que mostram mensagens de ciclo de vida em vez de respostas completas. O núcleo `azd 1.37.1` corrige a propagação de cancelamento entre extensões; `1.37.2` melhora confirmações críticas de provisionamento e gestão de cancelamento.

Se o comando de avaliação de um tutorial antigo apenas imprimir orientação de migração, instale `azure.ai.evaluations` (`1.0.0-beta.2` requer `azd >= 1.33.0`) e use `azd ai eval init`, `generate` e `run start`. O `--config` da otimização já não aceita ficheiros de avaliação legados. Veja [migração de avaliação](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migração de otimização](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Depuração de Aplicações

1. **Registo Estruturado:**
```python
import logging
import json

# Configure structured logging for AI applications
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_ai_request(model: str, tokens: int, latency: float, success: bool):
    """Log AI request details."""
    logger.info(json.dumps({
        'event': 'ai_request',
        'model': model,
        'tokens': tokens,
        'latency_ms': latency,
        'success': success
    }))
```

2. **Endpoints de Verificação de Saúde:**
```python
# Integration fragment: add to an existing FastAPI app, protect this diagnostic
# endpoint, and configure AZURE_SEARCH_ENDPOINT. This tests Search index-list
# authorization, not Azure OpenAI inference.
import os
from azure.identity.aio import DefaultAzureCredential
from azure.search.documents.indexes.aio import SearchIndexClient
from fastapi import Response

@app.get("/debug/health")
async def detailed_health_check(response: Response):
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check Search service
    try:
        async with DefaultAzureCredential() as credential:
            async with SearchIndexClient(
                endpoint=os.environ['AZURE_SEARCH_ENDPOINT'],
                credential=credential
            ) as search_client:
                # AsyncItemPaged is iterated asynchronously, not awaited as a list.
                async for _ in search_client.list_index_names():
                    break
        checks['search'] = {'status': 'healthy'}
    except Exception:
        response.status_code = 503
        checks['search'] = {'status': 'unhealthy'}
    
    return checks
```

3. **Monitorização de Performance:**
```python
import time
from functools import wraps

def monitor_performance(func):
    """Decorator to monitor function performance."""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start_time = time.time()
        try:
            result = await func(*args, **kwargs)
            success = True
        except Exception as e:
            result = None
            success = False
            raise
        finally:
            end_time = time.time()
            latency = (end_time - start_time) * 1000
            
            logger.info(json.dumps({
                'function': func.__name__,
                'latency_ms': latency,
                'success': success
            }))
        
        return result
    return wrapper
```

## Códigos de Erro Comuns e Soluções

| Código de Erro | Descrição | Solução |
|------------|-------------|----------|
| 401 | Não Autorizado | Verifique as chaves da API e a configuração da identidade gerida |
| 403 | Proibido | Verifique as atribuições de função RBAC |
| 429 | Limite de Taxa | Implemente lógica de reintento com retrocesso exponencial |
| 500 | Erro Interno do Servidor | Verifique o estado da implementação do modelo e os registos |
| 503 | Serviço Indisponível | Verifique a saúde do serviço e disponibilidade regional |

## Próximos Passos

1. **Revise o [Guia de Implementação de Modelos de IA](../chapter-02-ai-development/ai-model-deployment.md)** para as melhores práticas de implementação
2. **Complete os [Princípios de IA para Produção](../chapter-08-production/production-ai-practices.md)** para soluções empresariais prontas
3. **Junte-se ao [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** para suporte comunitário
4. **Submeta problemas** ao [repositório GitHub do AZD](https://github.com/Azure/azure-dev) para problemas específicos do AZD

## Recursos

- [Resolução de problemas de quota e limitação Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Resolução de problemas em Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Resolução de problemas no Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Habilidade do Agente de Diagnóstico Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instale habilidades de resolução de problemas Azure no seu editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Resolução de Problemas e Depuração
- **⬅️ Anterior**: [Guia de Depuração](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desenvolvimento com Prioridade em IA](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referência**: [Resolução de Problemas Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->