# AI'ye Özel Sorun Giderme Rehberi

**Bölüm Navigasyonu:**
- **📚 Dersin Anasayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki**: [Hata Ayıklama Rehberi](debugging.md)
- **➡️ Sonraki Bölüm**: [Bölüm 8: Üretim ve Kurumsal Kalıplar](../chapter-08-production/production-ai-practices.md)
- **🤖 İlişkili**: [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

Bu kapsamlı sorun giderme rehberi, AZD ile AI çözümleri dağıtırken karşılaşılan yaygın sorunları ele alır ve Azure AI hizmetlerine özgü çözümler ve hata ayıklama teknikleri sunar.

## İçindekiler

- [Microsoft Foundry Modeller Hizmet Sorunları](#azure-openai-service-issues)
- [Azure AI Arama Sorunları](#azure-ai-arama-sorunları)
- [Container Apps Dağıtım Sorunları](#container-apps-dağıtım-sorunları)
- [Kimlik Doğrulama ve İzin Hataları](#kimlik-doğrulama-ve-i̇zin-hataları)
- [Model Dağıtım Hataları](#model-dağıtım-hataları)
- [Performans ve Ölçeklendirme Sorunları](#performans-ve-ölçeklendirme-sorunları)
- [Maliyet ve Kota Yönetimi](#maliyet-ve-kota-yönetimi)
- [Hata Ayıklama Araçları ve Teknikleri](#hata-ayıklama-araçları-ve-teknikleri)

## Microsoft Foundry Modeller Hizmet Sorunları

### Sorun: Bölgedeki OpenAI Hizmeti Kullanılamıyor

**Belirtiler:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Nedenleri:**
- Seçilen bölgede Microsoft Foundry Modelleri mevcut değil
- Tercih edilen bölgelerde kota tükenmiş
- Bölgesel kapasite kısıtlamaları

**Çözümler:**

1. **Bölge Kullanılabilirliğini Kontrol Edin:**
```bash
# OpenAI için mevcut bölgeleri listele
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD Yapılandırmasını Güncelleyin:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Alternatif Bölgeler Kullanın:**
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

### Sorun: Model Dağıtım Kotası Aşıldı

**Belirtiler:**
```
Error: Deployment failed due to insufficient quota
```

**Çözümler:**

1. **Mevcut Kotayı Kontrol Edin:**
```bash
# Kota kullanımını kontrol et
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Kota Artışı Talep Edin:**
```bash
# Kota artışı talebi gönder
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Model Kapasitesini Optimize Edin:**
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

### Sorun: Geçersiz API Sürümü

**Belirtiler:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Çözümler:**

1. **Desteklenen API Sürümünü Kullanın:**
```python
# En son desteklenen sürümü kullan
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API Sürümü Uyumluluğunu Kontrol Edin:**
```bash
# Desteklenen API sürümlerini listele
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Arama Sorunları

### Sorun: Arama Hizmeti Fiyatlandırma Katmanı Yetersiz

**Belirtiler:**
```
Error: Semantic search requires Basic tier or higher
```

**Çözümler:**

1. **Fiyatlandırma Katmanını Yükseltin:**
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

2. **Semantik Aramayı Devre Dışı Bırakın (Geliştirme):**
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

### Sorun: İndeks Oluşturma Başarısızlıkları

**Belirtiler:**
```
Error: Cannot create index, insufficient permissions
```

**Çözümler:**

1. **Arama Hizmeti Anahtarlarını Doğrulayın:**
```bash
# Arama hizmetinin yönetici anahtarını al
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **İndeks Şemasını Kontrol Edin:**
```python
# İndeks şemasını doğrula
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

3. **Yönetilen Kimlik Kullanın:**
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

## Container Apps Dağıtım Sorunları

### Sorun: Konteyner Derleme Hataları

**Belirtiler:**
```
Error: Failed to build container image
```

**Çözümler:**

1. **Dockerfile Sözdizimini Kontrol Edin:**
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

2. **Bağımlılıkları Doğrulayın:**
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

3. **Sağlık Kontrolü Ekleyin:**
```python
# main.py - Sağlık kontrolü uç noktası ekle
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Sorun: Konteyner Uygulama Başlatma Hataları

**Belirtiler:**
```
Error: Container failed to start within timeout period
```

**Çözümler:**

1. **Başlangıç Zaman Aşımını Artırın:**
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

2. **Model Yüklemeyi Optimize Edin:**
```python
# Başlangıç süresini azaltmak için modelleri tembel yükleyin
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
        # AI istemcisini burada başlatın
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Başlangıç
    app.state.model_manager = ModelManager()
    yield
    # Kapatma
    pass

app = FastAPI(lifespan=lifespan)
```

## Kimlik Doğrulama ve İzin Hataları

### Sorun: Yönetilen Kimlik İzinleri Reddedildi

**Belirtiler:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Çözümler:**

1. **Rol Atamalarını Doğrulayın:**
```bash
# Mevcut rol atamalarını kontrol et
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Gerekli Rolleri Atayın:**
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

3. **Kimlik Doğrulamayı Test Edin:**
```python
# Yönetilen kimlik doğrulamasını test et
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

### Sorun: Key Vault Erişimi Reddedildi

**Belirtiler:**
```
Error: The user, group or application does not have secrets get permission
```

**Çözümler:**

1. **Key Vault İzinleri Verin:**
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

2. **Erişim Politikaları Yerine RBAC Kullanın:**
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

## Model Dağıtım Hataları

### Sorun: Model Sürümü Kullanılamıyor

**Belirtiler:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Çözümler:**

1. **Mevcut Modelleri Kontrol Edin:**
```bash
# Kullanılabilir modelleri listele
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Model Yedekleri Kullanın:**
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

3. **Dağıtımdan Önce Modeli Doğrulayın:**
```python
# Dağıtımdan önce model doğrulaması
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

## Performans ve Ölçeklendirme Sorunları

### Sorun: Yüksek Gecikmeli Yanıtlar

**Belirtiler:**
- Yanıt süreleri > 30 saniye
- Zaman aşımı hataları
- Kötü kullanıcı deneyimi

**Çözümler:**

1. **İstek Zaman Aşımı Uygulayın:**
```python
# Uygun zaman aşımı sürelerini yapılandırın
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

2. **Yanıt Önbellekleme Ekleyin:**
```python
# Yanıtlar için Redis önbelleği
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

3. **Otomatik ölçeklendirmeyi yapılandırın:**
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

### Sorun: Bellek Yetersizliği (Out of Memory) Hataları

**Belirtiler:**
```
Error: Container killed due to memory limit exceeded
```

**Çözümler:**

1. **Bellek Tahsisini Artırın:**
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

2. **Bellek Kullanımını Optimize Edin:**
```python
# Bellek dostu model yönetimi
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # İşleme başlamadan önce bellek kullanımını kontrol edin
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Çöp toplama işlemini zorlayın
            
        result = await self._process_ai_request(request)
        
        # İşlemden sonra temizleyin
        gc.collect()
        return result
```

## Maliyet ve Kota Yönetimi

### Sorun: Beklenmeyen Yüksek Maliyetler

**Belirtiler:**
- Azure faturası beklenenden yüksek
- Token kullanımı tahminleri aşıyor
- Bütçe uyarıları tetiklendi

**Çözümler:**

1. **Maliyet Kontrolleri Uygulayın:**
```python
# Token kullanım takibi
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

2. **Maliyet Uyarıları Kurun:**
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

3. **Model Seçimini Optimize Edin:**
```python
# Maliyet duyarlı model seçimi
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

## Hata Ayıklama Araçları ve Teknikleri

### AZD Hata Ayıklama Komutları

```bash
# Ayrıntılı günlüklemeyi etkinleştir
azd up --debug

# Dağıtım durumunu kontrol et
azd show

# Uygulama günlüklerini görüntüle (izleme panosunu açar)
azd monitor --logs

# Canlı metrikleri görüntüle
azd monitor --live

# Ortam değişkenlerini kontrol et
azd env get-values
```

### Teşhis için AZD AI Uzantı Komutları

Eğer ajanları `azd ai agent init` kullanarak dağıttıysanız, bu ek araçlar kullanılabilir:

```bash
# Agents eklentisinin yüklü olduğundan emin olun
azd extension install azure.ai.agents

# Bir manifestten bir ajanı yeniden başlatın veya güncelleyin
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# MCP sunucusunu kullanarak yapay zeka araçlarının proje durumunu sorgulamasını sağlayın
azd mcp start

# İnceleme ve denetim için altyapı dosyaları oluşturun
azd infra generate
```

> **İpucu:** IaC'yi diske yazmak için `azd infra generate` komutunu kullanın, böylece hangi kaynakların sağlandığını tam olarak inceleyebilirsiniz. Bu, kaynak yapılandırma sorunlarını hata ayıklarken çok değerlidir. Tam ayrıntılar için [AZD AI CLI başvurusu](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) bölümüne bakın.

### Uygulama Hata Ayıklama

1. **Yapılandırılmış Günlükleme:**
```python
import logging
import json

# Yapay zeka uygulamaları için yapılandırılmış günlüklemeyi ayarlayın
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

2. **Sağlık Kontrol Uç Noktaları:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # OpenAI bağlantısını kontrol et
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Arama hizmetini kontrol et
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

3. **Performans İzleme:**
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

## Yaygın Hata Kodları ve Çözümleri

| Hata Kodu | Açıklama | Çözüm |
|------------|-------------|----------|
| 401 | Yetkisiz | API anahtarlarını ve yönetilen kimlik yapılandırmasını kontrol edin |
| 403 | Erişim Reddedildi | RBAC rol atamalarını doğrulayın |
| 429 | Oran Sınırı Aşıldı | Üstel geri çekilme ile yeniden deneme mantığı uygulayın |
| 500 | Dahili Sunucu Hatası | Model dağıtım durumunu ve günlükleri kontrol edin |
| 503 | Hizmet Kullanılamıyor | Hizmet durumunu ve bölgesel kullanılabilirliği doğrulayın |

## Sonraki Adımlar

1. **Gözden Geçirin [AI Model Dağıtım Rehberi](../chapter-02-ai-development/ai-model-deployment.md)** dağıtım en iyi uygulamaları için
2. **Tamamlayın [Üretim AI Uygulamaları](../chapter-08-production/production-ai-practices.md)** kurumsal hazır çözümler için
3. **Katılın [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** topluluk desteği için
4. **Sorun bildirin** [AZD GitHub deposuna](https://github.com/Azure/azure-dev) AZD'ye özgü sorunlar için

## Kaynaklar

- [Microsoft Foundry Modeller Hizmeti Sorun Giderme](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Sorun Giderme](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Arama Sorun Giderme](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Tanılama Aracı Becerisi**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Editörünüze Azure sorun giderme becerilerini yükleyin: `npx skills add microsoft/github-copilot-for-azure`

---

**Bölüm Navigasyonu:**
- **📚 Dersin Anasayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki**: [Hata Ayıklama Rehberi](debugging.md)
- **➡️ Sonraki Bölüm**: [Bölüm 8: Üretim ve Kurumsal Kalıplar](../chapter-08-production/production-ai-practices.md)
- **🤖 İlişkili**: [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referans**: [Azure Developer CLI Sorun Giderme](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->