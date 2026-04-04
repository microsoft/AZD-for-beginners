# Guia de Solução de Problemas Específico para IA

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas & Depuração
- **⬅️ Anterior**: [Guia de Depuração](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Padrões de Produção & Empresa](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desenvolvimento Orientado a IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

Este guia abrangente de solução de problemas aborda problemas comuns ao implantar soluções de IA com AZD, fornecendo soluções e técnicas de depuração específicas para os serviços Azure AI.

## Índice

- [Problemas do Serviço Microsoft Foundry Models](#azure-openai-service-issues)
- [Problemas do Azure AI Search](#azure-ai-search-problems)
- [Problemas de Implantação de Container Apps](#container-apps-deployment-issues)
- [Erros de Autenticação e Permissão](#erros-de-autenticação-e-permissão)
- [Falhas na Implantação de Modelos](#falhas-na-implantação-de-modelos)
- [Problemas de Desempenho e Escalonamento](#problemas-de-desempenho-e-escalonamento)
- [Gerenciamento de Custos e Cotas](#gerenciamento-de-custos-e-cotas)
- [Ferramentas e Técnicas de Depuração](#ferramentas-e-técnicas-de-depuração)

## Microsoft Foundry Models Service Issues

### Problema: Serviço OpenAI Indisponível na Região

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Causas:**
- Microsoft Foundry Models não disponíveis na região selecionada
- Cota esgotada nas regiões preferidas
- Restrições de capacidade regionais

**Soluções:**

1. **Verifique a Disponibilidade da Região:**
```bash
# Listar regiões disponíveis para o OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Atualize a Configuração do AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Use Regiões Alternativas:**
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

### Problema: Cota de Implantação do Modelo Excedida

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Soluções:**

1. **Verifique a Cota Atual:**
```bash
# Verificar uso da cota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Solicite Aumento de Cota:**
```bash
# Enviar solicitação de aumento de cota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Otimize a Capacidade do Modelo:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Problema: Versão da API Inválida

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluções:**

1. **Use Versão de API Suportada:**
```python
# Use a versão mais recente suportada
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verifique a Compatibilidade da Versão da API:**
```bash
# Listar as versões de API suportadas
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Problema: Camada de Preço do Serviço de Pesquisa Insuficiente

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluções:**

1. **Atualize a Camada de Preço:**
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

2. **Desative a Pesquisa Semântica (Desenvolvimento):**
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

### Problema: Falhas na Criação de Índice

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Soluções:**

1. **Verifique as Chaves do Serviço de Pesquisa:**
```bash
# Obter a chave de administrador do serviço de pesquisa
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Verifique o Esquema do Índice:**
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

3. **Use Identidade Gerenciada:**
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

### Problema: Falhas na Construção do Container

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Adicione Verificação de Integridade:**
```python
# main.py - Adicionar endpoint de verificação de integridade
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

2. **Otimize o Carregamento do Modelo:**
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

## Erros de Autenticação e Permissão

### Problema: Permissão Negada para Identidade Gerenciada

**Sintomas:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluções:**

1. **Verifique Atribuições de Função:**
```bash
# Verificar atribuições de função atuais
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Atribua Funções Necessárias:**
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

### Problema: Acesso ao Key Vault Negado

**Sintomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluções:**

1. **Conceda Permissões no Key Vault:**
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
# Listar modelos disponíveis
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Use Modelos de Reserva (Fallbacks):**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
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

3. **Valide o Modelo Antes da Implantação:**
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

## Problemas de Desempenho e Escalonamento

### Problema: Respostas com Alta Latência

**Sintomas:**
- Tempos de resposta > 30 segundos
- Erros de timeout
- Experiência do usuário prejudicada

**Soluções:**

1. **Implemente Timeouts de Requisição:**
```python
# Configure timeouts adequados
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

2. **Adicione Cache de Resposta:**
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

3. **Configure Auto-scaling:**
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

### Problema: Erros de Memória Esgotada

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
# Manipulação de modelo eficiente em memória
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Verificar o uso de memória antes do processamento
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forçar coleta de lixo
            
        result = await self._process_ai_request(request)
        
        # Limpar após o processamento
        gc.collect()
        return result
```

## Gerenciamento de Custos e Cotas

### Problema: Custos Altos Inesperados

**Sintomas:**
- Fatura do Azure maior do que o esperado
- Uso de tokens excedendo estimativas
- Alertas de orçamento acionados

**Soluções:**

1. **Implemente Controles de Custo:**
```python
# Monitoramento do uso de tokens
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

2. **Configure Alertas de Custo:**
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

3. **Otimize a Seleção de Modelos:**
```python
# Seleção de modelos sensível ao custo
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

### Comandos de Depuração do AZD

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

### Comandos de Extensão AZD AI para Diagnóstico

Se você implantou agentes usando `azd ai agent init`, estas ferramentas adicionais estão disponíveis:

```bash
# Certifique-se de que a extensão de agentes esteja instalada
azd extension install azure.ai.agents

# Reinicializar ou atualizar um agente a partir de um manifesto
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Use o servidor MCP para permitir que ferramentas de IA consultem o estado do projeto
azd mcp start

# Gerar arquivos de infraestrutura para revisão e auditoria
azd infra generate
```

> **Dica:** Use `azd infra generate` para gravar IaC no disco para que você possa inspecionar exatamente quais recursos foram provisionados. Isso é inestimável ao depurar problemas de configuração de recursos. Consulte a [referência do AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para detalhes completos.

### Depuração de Aplicação

1. **Logs Estruturados:**
```python
import logging
import json

# Configurar o registro estruturado para aplicações de IA
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

2. **Endpoints de Verificação de Integridade:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Verificar conectividade com a OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Verificar serviço de busca
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

## Códigos de Erro Comuns e Soluções

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Não autorizado | Verifique as chaves de API e a configuração da identidade gerenciada |
| 403 | Proibido | Verifique as atribuições de função RBAC |
| 429 | Limite de Taxa | Implemente lógica de repetição com retrocesso exponencial |
| 500 | Erro Interno do Servidor | Verifique o status da implantação do modelo e os logs |
| 503 | Serviço Indisponível | Verifique a integridade do serviço e a disponibilidade regional |

## Próximos Passos

1. **Revise o [Guia de Implantação de Modelos de IA](../chapter-02-ai-development/ai-model-deployment.md)** para melhores práticas de implantação
2. **Conclua [Práticas de IA para Produção](../chapter-08-production/production-ai-practices.md)** para soluções preparadas para empresas
3. **Participe do [Discord do Microsoft Foundry](https://aka.ms/foundry/discord)** para suporte da comunidade
4. **Envie problemas** para o [repositório AZD no GitHub](https://github.com/Azure/azure-dev) para problemas específicos do AZD

## Recursos

- [Solução de Problemas do Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Solução de Problemas do Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Solução de Problemas do Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instale skills de solução de problemas do Azure no seu editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 7 - Solução de Problemas & Depuração
- **⬅️ Anterior**: [Guia de Depuração](debugging.md)
- **➡️ Próximo Capítulo**: [Capítulo 8: Padrões de Produção & Empresa](../chapter-08-production/production-ai-practices.md)
- **🤖 Relacionado**: [Capítulo 2: Desenvolvimento Orientado a IA](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referência**: [Solução de Problemas do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->