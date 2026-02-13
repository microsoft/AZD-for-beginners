# Guia de Solução de Problemas Específico para IA

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Anterior**: [Debugging Guide](debugging.md)
- **➡️ Próximo Capítulo**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Anterior:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Próximo:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

Este guia abrangente de solução de problemas aborda problemas comuns ao implantar soluções de IA com o AZD, fornecendo soluções e técnicas de depuração específicas para os serviços Azure AI.

## Sumário

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### Issue: OpenAI Service Unavailable in Region

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Azure OpenAI não disponível na região selecionada
- Cota esgotada nas regiões preferenciais
- Restrições de capacidade regional

**Soluções:**

1. **Verificar Disponibilidade da Região:**
```bash
# Listar regiões disponíveis para a OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Atualizar Configuração do AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Usar Regiões Alternativas:**
```bicep
// infra/main.bicep - Multi-region fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Issue: Model Deployment Quota Exceeded

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Soluções:**

1. **Verificar Cota Atual:**
```bash
# Verificar uso da cota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Solicitar Aumento de Cota:**
```bash
# Enviar solicitação de aumento de cota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Otimizar Capacidade do Modelo:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Issue: Invalid API Version

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluções:**

1. **Usar Versão de API Suportada:**
```python
# Use a versão mais recente suportada
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verificar Compatibilidade da Versão da API:**
```bash
# Listar as versões de API suportadas
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluções:**

1. **Atualizar Camada de Preço:**
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
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

2. **Desabilitar Semantic Search (Desenvolvimento):**
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

### Issue: Index Creation Failures

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluções:**

1. **Verificar Chaves do Serviço de Search:**
```bash
# Obter chave de administrador do serviço de pesquisa
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Verificar Esquema do Índice:**
```python
# Validar o esquema do índice
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Usar Managed Identity:**
```bicep
// Grant search permissions to managed identity
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, searchIndexDataContributorRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
    principalType: 'ServicePrincipal'
  }
}
```

## Container Apps Deployment Issues

### Issue: Container Build Failures

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Adicionar Health Check:**
```python
# main.py - Adicionar endpoint de verificação de integridade
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

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
              type: 'startup'
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
# Carregar modelos sob demanda para reduzir o tempo de inicialização
import asyncio
from contextlib import asynccontextmanager

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Inicializar o cliente de IA aqui
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Inicialização
    app.state.model_manager = ModelManager()
    yield
    # Desligamento
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Sintomas:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Soluções:**

1. **Verificar Atribuições de Função:**
```bash
# Verificar as atribuições de função atuais
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
# Testar autenticação de identidade gerenciada
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### Issue: Key Vault Access Denied

**Sintomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluções:**

1. **Conceder Permissões no Key Vault:**
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

2. **Usar RBAC em vez de Access Policies:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**Sintomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluções:**

1. **Verificar Modelos Disponíveis:**
```bash
# Listar modelos disponíveis
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Usar Fallbacks de Modelo:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4o-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-35-turbo'
  version: '0125'
}

// Try primary model first, fallback if unavailable
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: primaryModel
  }
  sku: {
    name: 'Standard'
    capacity: 10
  }
}
```

3. **Validar Modelo Antes da Implantação:**
```python
# Validação do modelo antes da implantação
import httpx

async def validate_model_availability(model_name: str, version: str) -> bool:
    """Check if model is available before deployment."""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/models",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            models = response.json()
            return any(
                model["id"] == f"{model_name}-{version}"
                for model in models.get("data", [])
            )
    except Exception:
        return False
```

## Performance and Scaling Issues

### Issue: High Latency Responses

**Sintomas:**
- Tempos de resposta > 30 segundos
- Erros de timeout
- Experiência do usuário prejudicada

**Soluções:**

1. **Implementar Timeouts de Requisição:**
```python
# Configure os tempos limite adequados
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

2. **Adicionar Cache de Resposta:**
```python
# Cache do Redis para respostas
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

3. **Configurar Autoescalonamento:**
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

### Issue: Memory Out of Errors

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
# Manipulação de modelos com uso eficiente de memória
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Verificar uso de memória antes do processamento
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forçar coleta de lixo
            
        result = await self._process_ai_request(request)
        
        # Limpar após o processamento
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**Sintomas:**
- Fatura do Azure maior que o esperado
- Uso de tokens excedendo as estimativas
- Alertas de orçamento acionados

**Soluções:**

1. **Implementar Controles de Custo:**
```python
# Rastreamento do uso de tokens
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

2. **Configurar Alertas de Custo:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500  // $500 monthly limit
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

3. **Otimizar Seleção de Modelos:**
```python
# Seleção de modelo consciente de custos
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # por 1K tokens
    'gpt-4': 0.03,          # por 1K tokens
    'gpt-35-turbo': 0.0015  # por 1K tokens
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4o-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4'
```

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# Ativar logs detalhados
azd up --debug

# Verificar status da implantação
azd show

# Visualizar logs do aplicativo (abre o painel de monitoramento)
azd monitor --logs

# Visualizar métricas em tempo real
azd monitor --live

# Verificar variáveis de ambiente
azd env get-values
```

### Application Debugging

1. **Registro Estruturado:**
```python
import logging
import json

# Configure o registro estruturado para aplicações de IA
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
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Verificar a conectividade com a OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Verificar o serviço de pesquisa
    try:
        search_client = SearchIndexClient(
            endpoint=AZURE_SEARCH_ENDPOINT,
            credential=DefaultAzureCredential()
        )
        indexes = await search_client.list_index_names()
        checks['search'] = {'status': 'healthy', 'indexes': list(indexes)}
    except Exception as e:
        checks['search'] = {'status': 'unhealthy', 'error': str(e)}
    
    return checks
```

3. **Monitoramento de Desempenho:**
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

## Common Error Codes and Solutions

| Error Code | Descrição | Solução |
|------------|-------------|----------|
| 401 | Não autorizado | Verifique chaves de API e configuração de identidade gerenciada |
| 403 | Proibido | Verifique atribuições de função RBAC |
| 429 | Limite de taxa | Implemente lógica de repetição com retrocesso exponencial |
| 500 | Erro Interno do Servidor | Verifique o status de implantação do modelo e os logs |
| 503 | Serviço Indisponível | Verifique a integridade do serviço e a disponibilidade regional |

## Próximos Passos

1. **Revise o [Guia de Implantação de Modelos de IA](../chapter-02-ai-development/ai-model-deployment.md)** para melhores práticas de implantação
2. **Conclua as [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)** para soluções prontas para empresas
3. **Participe do [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** para suporte da comunidade
4. **Envie issues** para o [repositório AZD no GitHub](https://github.com/Azure/azure-dev) para problemas específicos do AZD

## Recursos

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Anterior**: [Debugging Guide](debugging.md)
- **➡️ Próximo Capítulo**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Solução de Problemas do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido usando o serviço de tradução por IA Co-op Translator (https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->