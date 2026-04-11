# Tekoälykohtainen vianmääritysohje

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianmääritys & Virheenkorjaus
- **⬅️ Edellinen**: [Virheenkorjausopas](debugging.md)
- **➡️ Seuraava luku**: [Luku 8: Tuotanto- ja yritysmallit](../chapter-08-production/production-ai-practices.md)
- **🤖 Liittyvää**: [Luku 2: AI-ensimmäinen kehittäminen](../chapter-02-ai-development/microsoft-foundry-integration.md)

Tämä kattava vianmääritysopas käsittelee yleisimpiä ongelmia AI-ratkaisujen käyttöönotossa AZD:llä ja tarjoaa ratkaisuja sekä virheenkorjaustekniikoita, jotka ovat erityisiä Azure AI -palveluille.

## Sisällysluettelo

- [Microsoft Foundry -mallipalvelun ongelmat](#azure-openai-service-issues)
- [Azure AI Search -ongelmat](#azure-ai-search-ongelmat)
- [Container Apps -käyttöönotto-ongelmat](#container-apps-käyttöönotto-ongelmat)
- [Todennus- ja käyttöoikeusvirheet](#todennus-ja-käyttöoikeusvirheet)
- [Mallin käyttöönoton epäonnistumiset](#mallin-käyttöönoton-epäonnistumiset)
- [Suorituskyky- ja skaalausongelmat](#suorituskyky-ja-skaalausongelmat)
- [Kustannus- ja kiintiöhallinta](#kustannus-ja-kiintiöhallinta)
- [Virheenkorjaustyökalut ja -menetelmät](#virheenkorjaustyökalut-ja-menetelmät)

## Microsoft Foundry -mallipalvelun ongelmat

### Ongelma: OpenAI-palvelu ei ole käytettävissä alueella

**Oireet:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Syyt:**
- Microsoft Foundry -mallit eivät ole saatavilla valitulla alueella
- Kiintiö on käytetty loppuun suosituissa alueissa
- Alueelliset kapasiteettirajoitteet

**Ratkaisut:**

1. **Tarkista alueen saatavuus:**
```bash
# Listaa OpenAI:n saatavilla olevat alueet
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Päivitä AZD-konfiguraatio:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Käytä vaihtoehtoisia alueita:**
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

### Ongelma: Mallin käyttöönoton kiintiö ylitetty

**Oireet:**
```
Error: Deployment failed due to insufficient quota
```

**Ratkaisut:**

1. **Tarkista nykyinen kiintiö:**
```bash
# Tarkista kiintiön käyttö
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Pyydä kiintiön kasvattamista:**
```bash
# Lähetä pyyntö kiintiön korottamiseksi
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimoi mallin kapasiteetti:**
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

### Ongelma: Virheellinen API-versio

**Oireet:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Ratkaisut:**

1. **Käytä tuettua API-versiota:**
```python
# Käytä uusinta tuettua versiota
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Tarkista API-version yhteensopivuus:**
```bash
# Listaa tuetut API-versiot
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search -ongelmat

### Ongelma: Hakupalvelun hinnoittelutaso riittämätön

**Oireet:**
```
Error: Semantic search requires Basic tier or higher
```

**Ratkaisut:**

1. **Päivitä hinnoittelutaso:**
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

2. **Poista semanttinen haku käytöstä (kehitys):**
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

### Ongelma: Indeksin luomisen epäonnistumiset

**Oireet:**
```
Error: Cannot create index, insufficient permissions
```

**Ratkaisut:**

1. **Varmista hakupalvelun avaimet:**
```bash
# Hae hakupalvelun ylläpitäjän avain
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Tarkista indeksin skeema:**
```python
# Validoi indeksin skeema
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

3. **Käytä hallittua identiteettiä:**
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

## Container Apps -käyttöönotto-ongelmat

### Ongelma: Kontin rakentamisen epäonnistumiset

**Oireet:**
```
Error: Failed to build container image
```

**Ratkaisut:**

1. **Tarkista Dockerfilen syntaksi:**
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

2. **Tarkista riippuvuudet:**
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

3. **Lisää terveystarkastus:**
```python
# main.py - Lisää terveystilan tarkistuspäätepiste
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Ongelma: Container Appin käynnistyksen epäonnistumiset

**Oireet:**
```
Error: Container failed to start within timeout period
```

**Ratkaisut:**

1. **Lisää käynnistyksen aikakatkaisu:**
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

2. **Optimoi mallin lataus:**
```python
# Lataa mallit laiskasti käynnistysajan vähentämiseksi
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
        # Alusta tekoälyasiakas tässä
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Käynnistys
    app.state.model_manager = ModelManager()
    yield
    # Sammutus
    pass

app = FastAPI(lifespan=lifespan)
```

## Todennus- ja käyttöoikeusvirheet

### Ongelma: Hallittu identiteetti – käyttöoikeus evätty

**Oireet:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Ratkaisut:**

1. **Varmista roolimääritykset:**
```bash
# Tarkista nykyiset roolimääritykset
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Määritä vaaditut roolit:**
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

3. **Testaa todennus:**
```python
# Testaa hallinnoidun identiteetin todennus
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

### Ongelma: Key Vault -käyttöoikeus evätty

**Oireet:**
```
Error: The user, group or application does not have secrets get permission
```

**Ratkaisut:**

1. **Myönnä Key Vault -oikeudet:**
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

2. **Käytä RBACia pääsypolitiikkojen sijaan:**
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

## Mallin käyttöönoton epäonnistumiset

### Ongelma: Mallin versio ei ole saatavilla

**Oireet:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Ratkaisut:**

1. **Tarkista saatavilla olevat mallit:**
```bash
# Listaa saatavilla olevat mallit
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Käytä varamalleja:**
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

3. **Vahvista malli ennen käyttöönottoa:**
```python
# Mallin validointi ennen käyttöönottoa
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

## Suorituskyky- ja skaalausongelmat

### Ongelma: Korkea viive vastauksissa

**Oireet:**
- Vastausajat yli 30 sekuntia
- Aikakatkaisuvirheet
- Heikko käyttäjäkokemus

**Ratkaisut:**

1. **Ota pyyntöaikarajat käyttöön:**
```python
# Määritä sopivat aikakatkaisut
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

2. **Lisää vastausten välimuisti:**
```python
# Redis-välimuisti vastauksille
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

3. **Määritä automaattinen skaalaus:**
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

### Ongelma: Muisti loppui -virheet

**Oireet:**
```
Error: Container killed due to memory limit exceeded
```

**Ratkaisut:**

1. **Lisää muistin määrää:**
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

2. **Optimoi muistin käyttö:**
```python
# Muistitehokas mallin käsittely
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Tarkista muistinkäyttö ennen käsittelyä
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Pakota roskien keruu
            
        result = await self._process_ai_request(request)
        
        # Siivoa käsittelyn jälkeen
        gc.collect()
        return result
```

## Kustannus- ja kiintiöhallinta

### Ongelma: Odottamattoman korkeat kustannukset

**Oireet:**
- Azure-lasku korkeampi kuin odotettu
- Token-käyttö ylittää arviot
- Budjettihälytykset laukaistu

**Ratkaisut:**

1. **Ota kustannusvalvonta käyttöön:**
```python
# Tokenien käytön seuranta
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

2. **Määritä kustannushälytykset:**
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

3. **Optimoi mallivalinta:**
```python
# Kustannustietoinen mallivalinta
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

## Virheenkorjaustyökalut ja -menetelmät

### AZD:n virheenkorjauskomennot

```bash
# Ota käyttöön yksityiskohtainen lokitus
azd up --debug

# Tarkista käyttöönoton tila
azd show

# Näytä sovelluksen lokit (avaa valvontapaneelin)
azd monitor --logs

# Näytä reaaliaikaiset mittarit
azd monitor --live

# Tarkista ympäristömuuttujat
azd env get-values
```

### AZD AI -laajennuksen diagnostiset komennot

Jos otit agentteja käyttöön käyttämällä `azd ai agent init`, nämä lisätyökalut ovat käytettävissä:

```bash
# Varmista, että agents-laajennus on asennettu
azd extension install azure.ai.agents

# Alusta uudelleen tai päivitä agentti manifestin perusteella
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Käytä MCP-palvelinta, jotta tekoälytyökalut voivat kysyä projektin tilaa
azd mcp start

# Luo infrastruktuuritiedostot tarkastelua ja auditointia varten
azd infra generate
```

> **Vinkki:** Käytä `azd infra generate` kirjoittaaksesi IaC:n levylle, jotta voit tarkastella tarkasti, mitä resursseja provisionoitiin. Tämä on korvaamatonta, kun virheenkorjaat resurssikonfiguraatio-ongelmia. Katso [AZD AI CLI -viite](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täydellisiä yksityiskohtia varten.

### Sovelluksen virheenkorjaus

1. **Rakenteinen lokitus:**
```python
import logging
import json

# Määritä jäsennelty lokitus tekoälysovelluksille
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

2. **Terveystarkastuksen rajapinnat:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Tarkista OpenAI-yhteys
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Tarkista hakupalvelu
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

3. **Suorituskyvyn valvonta:**
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

## Yleiset virhekoodit ja ratkaisut

| Virhekoodi | Kuvaus | Ratkaisu |
|------------|-------------|----------|
| 401 | Valtuuttamaton | Tarkista API-avaimet ja hallitun identiteetin asetukset |
| 403 | Kielletty | Varmista RBAC-roolimääritykset |
| 429 | Rajoitettu | Ota uudelleenyrittomekanismi käyttöön eksponentiaalisella takaisinviiveellä |
| 500 | Sisäinen palvelinvirhe | Tarkista mallin käyttöönoton tila ja lokit |
| 503 | Palvelu ei käytettävissä | Tarkista palvelun tila ja alueellinen saatavuus |

## Seuraavat askeleet

1. **Käy läpi [AI-mallin käyttöönotto-opas](../chapter-02-ai-development/ai-model-deployment.md)** parhaiden käytäntöjen vuoksi
2. **Suorita [Tuotannon AI-käytännöt](../chapter-08-production/production-ai-practices.md)** yritysvalmiiden ratkaisujen saamiseksi
3. **Liity [Microsoft Foundry Discordiin](https://aka.ms/foundry/discord)** saadaksesi yhteisötukea
4. **Lähetä ongelmat** [AZD:n GitHub-repositorioon](https://github.com/Azure/azure-dev) AZD-kohtaisissa ongelmissa

## Resurssit

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent -taito**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Asenna Azure-vianmääritystaitoja editoriisi: `npx skills add microsoft/github-copilot-for-azure`

---

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 7 - Vianmääritys & Virheenkorjaus
- **⬅️ Edellinen**: [Virheenkorjausopas](debugging.md)
- **➡️ Seuraava luku**: [Luku 8: Tuotanto- ja yritysmallit](../chapter-08-production/production-ai-practices.md)
- **🤖 Liittyvää**: [Luku 2: AI-ensimmäinen kehittäminen](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Viite**: [Azure Developer CLI -vianmääritys](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ole hyvä ja ota huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään väärinymmärryksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->