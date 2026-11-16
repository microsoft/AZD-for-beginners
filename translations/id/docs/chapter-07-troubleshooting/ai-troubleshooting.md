# Panduan Pemecahan Masalah Khusus AI

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Sebelumnya**: [Panduan Debugging](debugging.md)
- **➡️ Bab Selanjutnya**: [Bab 8: Pola Produksi & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Terkait**: [Bab 2: Pengembangan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

Panduan pemecahan masalah yang komprehensif ini membahas masalah umum saat menerapkan solusi AI dengan AZD, menyediakan solusi dan teknik debugging khusus untuk layanan Azure AI.

> **Ruang Lingkup:** Perintah menggunakan contoh nama sumber daya; gantilah dan pilih langganan yang benar. Blok Bicep adalah potongan untuk digabungkan ke dalam template yang ada, bukan deployment mandiri. Potongan Python memerlukan SDK yang disebutkan dan konfigurasi aplikasi. Tidak ada deployment Azure live yang dijalankan untuk tinjauan ini.

## Daftar Isi

- [Masalah Layanan Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Masalah Azure AI Search](#azure-ai-search-problems)
- [Masalah Deployment Container Apps](#container-apps-deployment-issues)
- [Kesalahan Otentikasi dan Izin](#authentication-and-permission-errors)
- [Kegagalan Deployment Model](#model-deployment-failures)
- [Masalah Performa dan Skalabilitas](#performance-and-scaling-issues)
- [Manajemen Biaya dan Kuota](#cost-and-quota-management)
- [Alat dan Teknik Debugging](#debugging-tools-and-techniques)

## Masalah Layanan Microsoft Foundry Models

### Masalah: Layanan OpenAI Tidak Tersedia di Wilayah

**Gejala:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Penyebab:**
- Microsoft Foundry Models tidak tersedia di wilayah yang dipilih
- Kuota habis di wilayah pilihan
- Keterbatasan kapasitas regional

**Solusi:**

1. **Periksa Ketersediaan Wilayah:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Perbarui Konfigurasi AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Gunakan Wilayah Alternatif:**
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

### Masalah: Kuota Deployment Model Terlampaui

**Gejala:**
```
Error: Deployment failed due to insufficient quota
```

**Solusi:**

1. **Periksa Kuota Saat Ini:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Minta Penambahan Kuota:**
Gunakan alur manajemen kuota portal Foundry untuk langganan, wilayah, model, dan tipe deployment yang terdampak. Lihat [panduan kuota resmi](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Permintaan kuota VM tidak menambah kuota model.

3. **Optimalkan Kapasitas Model:**
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

### Masalah: Versi API Tidak Valid

**Gejala:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Solusi:**

1. **Gunakan Versi API yang Didukung:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Periksa Kompatibilitas Versi API:**
Periksa [referensi siklus hidup API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Versi API penyedia sumber daya ARM **tidak** mencantumkan versi API inference/data-plane. Klien v1 baru menggunakan `/openai/v1/` tanpa tanggal `api-version`; jangan campur dua konfigurasi klien tersebut.

## Masalah Azure AI Search

### Masalah: Tingkat Harga Layanan Search Tidak Memadai

**Gejala:**
```
Error: Semantic search requires Basic tier or higher
```

**Solusi:**

1. **Gunakan Tingkat Harga yang Didukung:**

Semantic ranker memerlukan Basic atau lebih tinggi. Berpindah dari Free/Basic ke tingkat lain mungkin memerlukan pembuatan layanan pencarian baru dan membangun ulang indeks; mengedit SKU tidak menjamin peningkatan di tempat.
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

### Masalah: Gagal Membuat Indeks

**Gejala:**
```
Error: Cannot create index, insufficient permissions
```

**Solusi:**

1. **Verifikasi Kunci Layanan Search:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Periksa Skema Indeks:**
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

3. **Gunakan Managed Identity:**
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

## Masalah Deployment Container Apps

### Masalah: Gagal Build Container

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

2. **Validasi Dependensi:**
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

3. **Tambahkan Pemeriksaan Kesehatan:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Masalah: Gagal Startup Container App

**Gejala:**
```
Error: Container failed to start within timeout period
```

**Solusi:**

1. **Perpanjang Timeout Startup:**
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

2. **Optimalkan Pemanggilan Model:**
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

## Kesalahan Otentikasi dan Izin

### Masalah: Managed Identity Ditolak Izin

**Gejala:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Solusi:**

1. **Verifikasi Penugasan Peran:**
```bash
# Check current role assignments
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

3. **Uji Otentikasi:**
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

Perolehan token membuktikan otentikasi, bukan izin untuk memanggil model. Uji operasi yang dimaksud secara terpisah. Secara lokal, `DefaultAzureCredential` mungkin menggunakan kredensial pengembang; di Azure, verifikasi managed identity yang dipilih sesuai.

### Masalah: Akses Key Vault Ditolak

**Gejala:**
```
Error: The user, group or application does not have secrets get permission
```

**Solusi:**

1. **Berikan Izin Key Vault:**

Gunakan fragmen kebijakan akses berikut hanya untuk vault dengan `enableRbacAuthorization: false`. Untuk vault dengan RBAC diaktifkan, gunakan opsi 2; menambahkan kebijakan akses tidak memberikan akses data-plane dalam mode RBAC.
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

2. **Gunakan RBAC Bukannya Kebijakan Akses:**

Vault harus mempunyai `enableRbacAuthorization: true`; mengubah model izin memerlukan migrasi yang direncanakan dari akses yang ada.
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

## Kegagalan Deployment Model

### Masalah: Versi Model Tidak Tersedia

**Gejala:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Solusi:**

1. **Periksa Model yang Tersedia:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Pilih Model yang Tersedia Secara Eksplisit:**
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

3. **Validasi Model Sebelum Deployment:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Masalah Performa dan Skalabilitas

### Masalah: Respon Latensi Tinggi

**Gejala:**
- Waktu respon > 30 detik
- Kesalahan timeout
- Pengalaman pengguna buruk

**Solusi:**

1. **Terapkan Timeout Permintaan:**
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

2. **Tambahkan Caching Respon:**
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

## Manajemen Biaya dan Kuota

### Masalah: Biaya Tinggi Tak Terduga

**Gejala:**
- Tagihan Azure lebih tinggi dari perkiraan
- Penggunaan token melebihi estimasi
- Peringatan anggaran tercapai

**Solusi:**

1. **Terapkan Kontrol Biaya:**
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

Counter dalam memori ini hanya ilustrasi, bukan kontrol pengeluaran bulanan: akan reset saat restart, tidak dibagi antar replika, dan hanya memeriksa penggunaan setelah panggilan. Batas nyata harus mengandalkan akuntansi tahan lama, reservasi aman konkuren sebelum permintaan, dan kebijakan reset bulanan. Metrik memori container juga harus memperhitungkan batas cgroup; `psutil.virtual_memory()` bukan pengukuran batas container yang andal, dan garbage collection tidak menegakkan batas memori.

2. **Atur Peringatan Biaya:**
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

Deklarasikan `budgetStartDate` dan `budgetEndDate` di template Anda. Anggaran memberitahu; tidak menghentikan sumber daya atau menerapkan batas pengeluaran keras.

3. **Optimalkan Pemilihan Model:**
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

## Alat dan Teknik Debugging

### Perintah Debugging AZD

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

### Perintah Ekstensi AI AZD untuk Diagnostik

Jika Anda menerapkan agen menggunakan `azd ai agent init`, alat tambahan ini tersedia:

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

> **Tip:** Gunakan `azd infra generate` untuk menulis IaC ke disk sehingga Anda dapat memeriksa secara tepat sumber daya apa yang diprovisikan. Ini sangat berharga saat memecahkan masalah konfigurasi sumber daya. Lihat [referensi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk detail lengkap.

**Diagnostik sadar rilis (2026-11-04):** Agen `1.0.0-beta.23` memerlukan `azd >= 1.37.0`; tingkatkan core CLI sebelum ekstensi yang tidak kompatibel. Rilis agen ini mempertahankan peringatan RBAC pengembang dalam output deployment akhir dan mengidentifikasi versi yang terlibat dalam kegagalan aktivasi/timeout. Timeout tidak membuktikan kegagalan deployment: periksa versi yang dicoba sebelum mencoba lagi. Ini juga memperbaiki pemanggilan A2A 0.3 yang menampilkan pesan siklus hidup bukannya jawaban selesai. Core `azd 1.37.1` memperbaiki propagasi pembatalan antar ekstensi; `1.37.2` meningkatkan konfirmasi penyediaan kritis dan penanganan pembatalan.

Jika perintah evaluasi tutorial lama hanya mencetak panduan migrasi, instal `azure.ai.evaluations` (`1.0.0-beta.2` memerlukan `azd >= 1.33.0`) dan gunakan `azd ai eval init`, `generate`, dan `run start`. Optimasi `--config` tidak lagi menerima file evaluasi warisan. Lihat [migrasi evaluasi](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dan [migrasi optimasi](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Debugging Aplikasi

1. **Logging Terstruktur:**
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

2. **Endpoint Pemeriksaan Kesehatan:**
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

3. **Pemantauan Performa:**
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

## Kode Kesalahan Umum dan Solusinya

| Kode Kesalahan | Deskripsi | Solusi |
|------------|-------------|----------|
| 401 | Tidak Sah | Periksa kunci API dan konfigurasi managed identity |
| 403 | Terlarang | Verifikasi penugasan peran RBAC |
| 429 | Terbatas Tingkat | Terapkan logika coba ulang dengan backoff eksponensial |
| 500 | Kesalahan Server Internal | Periksa status deployment model dan log |
| 503 | Layanan Tidak Tersedia | Verifikasi kesehatan layanan dan ketersediaan regional |

## Langkah Berikutnya

1. **Tinjau [Panduan Deployment Model AI](../chapter-02-ai-development/ai-model-deployment.md)** untuk praktik terbaik deployment
2. **Selesaikan [Praktik AI Produksi](../chapter-08-production/production-ai-practices.md)** untuk solusi siap enterprise
3. **Bergabunglah dengan [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** untuk dukungan komunitas
4. **Kirim isu** ke [repositori AZD GitHub](https://github.com/Azure/azure-dev) untuk masalah spesifik AZD

## Sumber Daya

- [Pemecahan Masalah Kuota dan Throttling Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Pemecahan Masalah Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Pemecahan Masalah Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Keterampilan Agen Diagnostik Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Pasang keterampilan pemecahan masalah Azure di editor Anda: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Sebelumnya**: [Panduan Debugging](debugging.md)
- **➡️ Bab Selanjutnya**: [Bab 8: Pola Produksi & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Terkait**: [Bab 2: Pengembangan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referensi**: [Pemecahan Masalah Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->