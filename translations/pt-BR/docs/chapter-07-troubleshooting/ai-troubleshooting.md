# Guia de Solução de Problemas Específico para IA

**Navegação pelo Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Anterior**: [Guia de Depuração](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Este guia abrangente de solução de problemas aborda problemas comuns ao implantar soluções de IA com AZD, fornecendo soluções e técnicas de depuração específicas para serviços Azure AI.

> **Escopo:** Os comandos usam nomes de recursos de exemplo; substitua-os e selecione a assinatura correta. Blocos Bicep são fragmentos para mesclar em um template existente, não implantações independentes. Trechos em Python requerem os SDKs e configurações de aplicação indicados. Nenhuma implantação Azure ao vivo foi executada para esta revisão.

## Sumário

- [Problemas do Serviço Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problemas com Azure AI Search](#azure-ai-search-problems)
- [Problemas na Implantação de Container Apps](#container-apps-deployment-issues)
- [Erros de Autenticação e Permissão](#authentication-and-permission-errors)
- [Falhas na Implantação de Modelos](#model-deployment-failures)
- [Problemas de Desempenho e Escalabilidade](#performance-and-scaling-issues)
- [Gerenciamento de Custos e Quotas](#cost-and-quota-management)
- [Ferramentas e Técnicas de Depuração](#debugging-tools-and-techniques)

## Problemas do Serviço Microsoft Foundry Models

### Problema: Serviço OpenAI Indisponível na Região

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Microsoft Foundry Models não disponível na região selecionada
- Quota esgotada nas regiões preferidas
- Restrições de capacidade regional

**Soluções:**

1. **Verifique a Disponibilidade da Região:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Atualize a Configuração do AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Use Regiões Alternativas:**
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

### Problema: Quota de Implantação de Modelo Excedida

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Soluções:**

1. **Verifique a Quota Atual:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Solicite Aumento de Quota:**
Use o fluxo de trabalho de gerenciamento de quota no portal Foundry para a assinatura, região, modelo e tipo de implantação afetados. Veja a [orientação oficial sobre quota](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Solicitar quota para uma VM não aumenta a quota do modelo.

3. **Otimize a Capacidade do Modelo:**
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

### Problema: Versão de API Inválida

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluções:**

1. **Use Versão de API Suportada:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Verifique a Compatibilidade da Versão da API:**
Verifique a [referência do ciclo de vida da Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Versões da API do provedor de recursos ARM **não** listam versões API para inferência/plano de dados. Novos clientes v1 usam `/openai/v1/` sem um `api-version` datado; não misture as duas configurações de clientes.

## Problemas com Azure AI Search

### Problema: Nível de Preço do Serviço de Busca Insuficiente

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluções:**

1. **Use um Nível de Preço Suportado:**

O rankeador semântico requer Basic ou superior. Mudar de Free/Basic para outro nível pode demandar criar um novo serviço de busca e reconstruir índices; editar um SKU não garante atualização no local.
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

2. **Desative a Busca Semântica (Desenvolvimento):**
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

### Problema: Falha na Criação do Índice

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluções:**

1. **Verifique as Chaves do Serviço de Busca:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Cheque o Esquema do Índice:**
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

3. **Use Identidade Gerenciada:**
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

## Problemas na Implantação de Container Apps

### Problema: Falha na Construção do Container

**Sintomas:**
```
Error: Failed to build container image
```

**Soluções:**

1. **Verifique a Sintaxe do Dockerfile:**
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

2. **Valide Dependências:**
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

3. **Adicione Verificação de Saúde:**
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

1. **Aumente o Timeout de Inicialização:**
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

2. **Otimize o Carregamento do Modelo:**
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

## Erros de Autenticação e Permissão

### Problema: Permissão Negada para Identidade Gerenciada

**Sintomas:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluções:**

1. **Verifique as Atribuições de Papel:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Atribua Papéis Necessários:**
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

3. **Teste a Autenticação:**
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

A aquisição do token comprova autenticação, não permissão para invocar um modelo. Teste a operação pretendida separadamente. Localmente, `DefaultAzureCredential` pode usar credenciais de desenvolvedor; no Azure, verifique se a identidade gerenciada pretendida está selecionada.

### Problema: Acesso ao Key Vault Negado

**Sintomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluções:**

1. **Conceda Permissões no Key Vault:**

Use o fragmento de política de acesso abaixo apenas para um cofre com `enableRbacAuthorization: false`. Para um cofre habilitado para RBAC, use a opção 2; adicionar uma política de acesso não concede acesso no plano de dados no modo RBAC.
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

2. **Use RBAC em vez de Políticas de Acesso:**

O cofre deve ter `enableRbacAuthorization: true`; mudar o modelo de permissão requer migração planejada dos acessos existentes.
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

## Falhas na Implantação de Modelos

### Problema: Versão do Modelo Não Disponível

**Sintomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluções:**

1. **Verifique Modelos Disponíveis:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Selecione Explicitamente um Modelo Disponível:**
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

3. **Valide o Modelo Antes da Implantação:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problemas de Desempenho e Escalabilidade

### Problema: Respostas com Alta Latência

**Sintomas:**
- Tempos de resposta > 30 segundos
- Erros de timeout
- Experiência do usuário ruim

**Soluções:**

1. **Implemente Timeouts para Requisições:**
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

2. **Adicione Cache para Respostas:**
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

3. **Configure Autoescalonamento:**
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

1. **Aumente a Alocação de Memória:**
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

2. **Otimize o Uso de Memória:**
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

## Gerenciamento de Custos e Quotas

### Problema: Custos Altos Inesperados

**Sintomas:**
- Conta Azure maior que o esperado
- Uso de token excedendo estimativas
- Alertas de orçamento disparados

**Soluções:**

1. **Implemente Controles de Custos:**
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

Este contador em memória é ilustrativo, não um controle mensal de gastos: ele reseta ao reiniciar, não é compartilhado entre réplicas e checa uso apenas após uma chamada. Um limite real precisa de contabilidade durável, reservas concorrência-seguras antes das requisições e política de reinício mensal. Métricas de memória em container precisam considerar limites de cgroup; `psutil.virtual_memory()` não mede limite de container confiavelmente e coleta de lixo não impõe teto de memória.

2. **Configure Alertas de Custos:**
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

Declare `budgetStartDate` e `budgetEndDate` no seu template. Orçamentos notificam; eles não param recursos nem impõem limite de gastos rígido.

3. **Otimize a Seleção do Modelo:**
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

### Comandos da Extensão AZD AI para Diagnósticos

Se você implantou agentes usando `azd ai agent init`, estas ferramentas adicionais estão disponíveis:

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

> **Dica:** Use `azd infra generate` para escrever IaC no disco para inspecionar exatamente quais recursos foram provisionados. Isto é inestimável ao depurar problemas de configuração de recursos. Veja a [referência da CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalhes completos.

**Diagnósticos conscientes de versão (2026-11-04):** Agentes `1.0.0-beta.23` requer `azd >= 1.37.0`; atualize o CLI principal antes de extensões incompatíveis. Esta versão do agente mantém avisos RBAC para desenvolvedor na saída final e identifica a versão envolvida em falhas/tempo esgotado na ativação. Timeout não indica falha na implantação: inspecione a versão tentada antes de tentar novamente. Também corrige invocações A2A 0.3 exibindo mensagens de ciclo de vida em vez de respostas completas. Core `azd 1.37.1` corrige propagação de cancelamento entre extensões; `1.37.2` melhora confirmações críticas de provisionamento e gerenciamento de cancelamento.

Se comando de avaliação de tutorial antigo só imprime orientação de migração, instale `azure.ai.evaluations` (`1.0.0-beta.2` requer `azd >= 1.33.0`) e use `azd ai eval init`, `generate` e `run start`. Otimização `--config` não aceita mais arquivos de avaliação legados. Veja [migração de avaliação](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migração de otimização](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Depuração de Aplicações

1. **Logging Estruturado:**
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

2. **Endpoints para Verificação de Saúde:**
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

## Códigos de Erro Comuns e Soluções

| Código do Erro | Descrição | Solução |
|------------|-------------|----------|
| 401 | Não autorizado | Verifique as chaves API e configuração da identidade gerenciada |
| 403 | Proibido | Verifique atribuições de função RBAC |
| 429 | Limite de Taxa | Implemente lógica de repetição com retrocesso exponencial |
| 500 | Erro Interno do Servidor | Verifique status da implantação do modelo e logs |
| 503 | Serviço Indisponível | Verifique a saúde do serviço e disponibilidade regional |

## Próximos Passos

1. **Revise o [Guia de Implantação de Modelos de IA](../chapter-02-ai-development/ai-model-deployment.md)** para práticas recomendadas de implantação
2. **Complete [Práticas de IA em Produção](../chapter-08-production/production-ai-practices.md)** para soluções prontas para empresas
3. **Participe do [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** para suporte comunitário
4. **Envie issues** ao [repositório AZD GitHub](https://github.com/Azure/azure-dev) para problemas específicos do AZD

## Recursos

- [Solução de problemas de quota e limitação do Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Solução de Problemas de Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Solução de Problemas do Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Skill do Agente de Diagnóstico Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instale skills de solução de problemas Azure no seu editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação pelo Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas e Depuração
- **⬅️ Anterior**: [Guia de Depuração](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Padrões de Produção e Empresariais](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referência**: [Solução de Problemas do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->