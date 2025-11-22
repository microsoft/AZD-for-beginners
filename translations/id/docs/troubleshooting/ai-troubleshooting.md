<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-22T09:08:27+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "id"
}
-->
# Panduan Pemecahan Masalah Khusus AI

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Sebelumnya**: [Panduan Debugging](debugging.md)
- **➡️ Bab Berikutnya**: [Bab 8: Pola Produksi & Perusahaan](../microsoft-foundry/production-ai-practices.md)
- **🤖 Terkait**: [Bab 2: Pengembangan Berbasis AI](../microsoft-foundry/microsoft-foundry-integration.md)

**Sebelumnya:** [Praktik AI Produksi](../microsoft-foundry/production-ai-practices.md) | **Berikutnya:** [Memulai dengan AZD](../getting-started/README.md)

Panduan pemecahan masalah yang komprehensif ini membahas masalah umum saat menerapkan solusi AI dengan AZD, memberikan solusi dan teknik debugging khusus untuk layanan Azure AI.

## Daftar Isi

- [Masalah Layanan Azure OpenAI](../../../../docs/troubleshooting)
- [Masalah Azure AI Search](../../../../docs/troubleshooting)
- [Masalah Penerapan Container Apps](../../../../docs/troubleshooting)
- [Kesalahan Autentikasi dan Izin](../../../../docs/troubleshooting)
- [Kegagalan Penerapan Model](../../../../docs/troubleshooting)
- [Masalah Kinerja dan Skalabilitas](../../../../docs/troubleshooting)
- [Manajemen Biaya dan Kuota](../../../../docs/troubleshooting)
- [Alat dan Teknik Debugging](../../../../docs/troubleshooting)

## Masalah Layanan Azure OpenAI

### Masalah: Layanan OpenAI Tidak Tersedia di Wilayah

**Gejala:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Penyebab:**
- Azure OpenAI tidak tersedia di wilayah yang dipilih
- Kuota habis di wilayah yang diinginkan
- Kendala kapasitas wilayah

**Solusi:**

1. **Periksa Ketersediaan Wilayah:**
```bash
# Daftar wilayah yang tersedia untuk OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Perbarui Konfigurasi AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Gunakan Wilayah Alternatif:**
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

### Masalah: Kuota Penerapan Model Terlampaui

**Gejala:**
```
Error: Deployment failed due to insufficient quota
```

**Solusi:**

1. **Periksa Kuota Saat Ini:**
```bash
# Periksa penggunaan kuota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Ajukan Peningkatan Kuota:**
```bash
# Ajukan permintaan peningkatan kuota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimalkan Kapasitas Model:**
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

### Masalah: Versi API Tidak Valid

**Gejala:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solusi:**

1. **Gunakan Versi API yang Didukung:**
```python
# Gunakan versi terbaru yang didukung
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Periksa Kompatibilitas Versi API:**
```bash
# Daftar versi API yang didukung
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Masalah Azure AI Search

### Masalah: Tingkat Harga Layanan Pencarian Tidak Memadai

**Gejala:**
```
Error: Semantic search requires Basic tier or higher
```

**Solusi:**

1. **Tingkatkan Tingkat Harga:**
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

2. **Nonaktifkan Semantic Search (Pengembangan):**
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

### Masalah: Kegagalan Pembuatan Indeks

**Gejala:**
```
Error: Cannot create index, insufficient permissions
```

**Solusi:**

1. **Verifikasi Kunci Layanan Pencarian:**
```bash
# Dapatkan kunci admin layanan pencarian
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Periksa Skema Indeks:**
```python
# Validasi skema indeks
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

3. **Gunakan Managed Identity:**
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

## Masalah Penerapan Container Apps

### Masalah: Kegagalan Pembuatan Container

**Gejala:**
```
Error: Failed to build container image
```

**Solusi:**

1. **Periksa Sintaks Dockerfile:**
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

2. **Validasi Ketergantungan:**
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

3. **Tambahkan Pemeriksaan Kesehatan:**
```python
# main.py - Tambahkan endpoint pemeriksaan kesehatan
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Masalah: Kegagalan Startup Container App

**Gejala:**
```
Error: Container failed to start within timeout period
```

**Solusi:**

1. **Tingkatkan Waktu Tunggu Startup:**
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

2. **Optimalkan Pemuatan Model:**
```python
# Muat model secara malas untuk mengurangi waktu startup
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
        # Inisialisasi klien AI di sini
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Mulai
    app.state.model_manager = ModelManager()
    yield
    # Matikan
    pass

app = FastAPI(lifespan=lifespan)
```

## Kesalahan Autentikasi dan Izin

### Masalah: Izin Managed Identity Ditolak

**Gejala:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Solusi:**

1. **Verifikasi Penugasan Peran:**
```bash
# Periksa penugasan peran saat ini
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tetapkan Peran yang Diperlukan:**
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

3. **Uji Autentikasi:**
```python
# Uji autentikasi identitas terkelola
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

### Masalah: Akses Key Vault Ditolak

**Gejala:**
```
Error: The user, group or application does not have secrets get permission
```

**Solusi:**

1. **Berikan Izin Key Vault:**
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

2. **Gunakan RBAC Sebagai Pengganti Kebijakan Akses:**
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

## Kegagalan Penerapan Model

### Masalah: Versi Model Tidak Tersedia

**Gejala:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solusi:**

1. **Periksa Model yang Tersedia:**
```bash
# Daftar model yang tersedia
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Gunakan Model Alternatif:**
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

3. **Validasi Model Sebelum Penerapan:**
```python
# Validasi model sebelum penerapan
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

## Masalah Kinerja dan Skalabilitas

### Masalah: Respons dengan Latensi Tinggi

**Gejala:**
- Waktu respons > 30 detik
- Kesalahan waktu habis
- Pengalaman pengguna buruk

**Solusi:**

1. **Terapkan Waktu Tunggu Permintaan:**
```python
# Konfigurasikan batas waktu yang tepat
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

2. **Tambahkan Caching Respons:**
```python
# Cache Redis untuk respons
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

3. **Konfigurasikan Auto-scaling:**
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

### Masalah: Kesalahan Memori Habis

**Gejala:**
```
Error: Container killed due to memory limit exceeded
```

**Solusi:**

1. **Tingkatkan Alokasi Memori:**
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

2. **Optimalkan Penggunaan Memori:**
```python
# Penanganan model yang efisien memori
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Periksa penggunaan memori sebelum memproses
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Paksa pengumpulan sampah
            
        result = await self._process_ai_request(request)
        
        # Bersihkan setelah pemrosesan
        gc.collect()
        return result
```

## Manajemen Biaya dan Kuota

### Masalah: Biaya Tinggi yang Tidak Terduga

**Gejala:**
- Tagihan Azure lebih tinggi dari yang diharapkan
- Penggunaan token melebihi perkiraan
- Peringatan anggaran terpicu

**Solusi:**

1. **Terapkan Kontrol Biaya:**
```python
# Pelacakan penggunaan token
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

2. **Atur Peringatan Biaya:**
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

3. **Optimalkan Pemilihan Model:**
```python
# Pemilihan model yang memperhatikan biaya
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K token
    'gpt-4': 0.03,          # per 1K token
    'gpt-35-turbo': 0.0015  # per 1K token
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

## Alat dan Teknik Debugging

### Perintah Debugging AZD

```bash
# Aktifkan logging rinci
azd up --debug

# Periksa status penyebaran
azd show

# Lihat log penyebaran
azd logs --follow

# Periksa variabel lingkungan
azd env get-values
```

### Debugging Aplikasi

1. **Logging Terstruktur:**
```python
import logging
import json

# Konfigurasikan pencatatan terstruktur untuk aplikasi AI
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

2. **Endpoint Pemeriksaan Kesehatan:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Periksa konektivitas OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Periksa layanan Pencarian
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

3. **Pemantauan Kinerja:**
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

## Kode Kesalahan Umum dan Solusi

| Kode Kesalahan | Deskripsi | Solusi |
|----------------|-----------|--------|
| 401 | Tidak Terotorisasi | Periksa kunci API dan konfigurasi managed identity |
| 403 | Dilarang | Verifikasi penugasan peran RBAC |
| 429 | Terbatas | Terapkan logika retry dengan backoff eksponensial |
| 500 | Kesalahan Server Internal | Periksa status penerapan model dan log |
| 503 | Layanan Tidak Tersedia | Verifikasi kesehatan layanan dan ketersediaan wilayah |

## Langkah Berikutnya

1. **Tinjau [Panduan Penerapan Model AI](ai-model-deployment.md)** untuk praktik terbaik penerapan
2. **Selesaikan [Praktik AI Produksi](production-ai-practices.md)** untuk solusi siap perusahaan
3. **Bergabunglah dengan [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** untuk dukungan komunitas
4. **Kirim masalah** ke [repositori GitHub AZD](https://github.com/Azure/azure-dev) untuk masalah spesifik AZD

## Sumber Daya

- [Pemecahan Masalah Layanan Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Pemecahan Masalah Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Pemecahan Masalah Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Sebelumnya**: [Panduan Debugging](debugging.md)
- **➡️ Bab Berikutnya**: [Bab 8: Pola Produksi & Perusahaan](../microsoft-foundry/production-ai-practices.md)
- **🤖 Terkait**: [Bab 2: Pengembangan Berbasis AI](../microsoft-foundry/microsoft-foundry-integration.md)
- [Pemecahan Masalah Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->