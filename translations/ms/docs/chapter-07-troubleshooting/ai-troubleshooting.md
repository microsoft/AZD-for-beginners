# Panduan Penyelesaian Masalah Khusus AI

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Penguraian Ralat
- **⬅️ Sebelum Ini**: [Panduan Penguraian Ralat](debugging.md)
- **➡️ Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Perusahaan](../chapter-08-production/production-ai-practices.md)
- **🤖 Berkaitan**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

Panduan penyelesaian masalah menyeluruh ini menangani isu biasa semasa menyebarkan penyelesaian AI dengan AZD, menyediakan penyelesaian dan teknik penguraian ralat khusus untuk perkhidmatan Azure AI.

> **Skop:** Perintah menggunakan nama sumber contoh; gantikan dan pilih langganan yang betul. Blok Bicep adalah serpihan untuk digabungkan ke dalam templat yang sedia ada, bukan penyebaran berdiri sendiri. Potongan Python memerlukan SDK dan konfigurasi aplikasi yang dinyatakan. Tiada penyebaran Azure langsung dijalankan untuk semakan ini.

## Jadual Kandungan

- [Isu Perkhidmatan Model Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [Masalah Carian Azure AI](#azure-ai-search-problems)
- [Isu Penyebaran Aplikasi Kontena](#container-apps-deployment-issues)
- [Ralat Pengesahan dan Kebenaran](#authentication-and-permission-errors)
- [Kegagalan Penyebaran Model](#model-deployment-failures)
- [Isu Prestasi dan Pengembangan](#performance-and-scaling-issues)
- [Pengurusan Kos dan Kuota](#cost-and-quota-management)
- [Alat dan Teknik Penguraian Ralat](#debugging-tools-and-techniques)

## Isu Perkhidmatan Model Microsoft Foundry  

### Isu: Perkhidmatan OpenAI Tidak Tersedia di Wilayah

**Gejala:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Punca:**
- Model Microsoft Foundry tidak tersedia di wilayah terpilih
- Kuota habis di wilayah pilihan
- Kekangan kapasiti wilayah

**Penyelesaian:**

1. **Semak Ketersediaan Wilayah:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Kemaskini Konfigurasi AZD:**
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

### Isu: Kuota Penyebaran Model Melebihi Had

**Gejala:**
```
Error: Deployment failed due to insufficient quota
```

**Penyelesaian:**

1. **Semak Kuota Semasa:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Mohon Kenaikan Kuota:**
Gunakan aliran kerja pengurusan kuota portal Foundry untuk langganan, wilayah, model, dan jenis penyebaran yang terjejas. Lihat [panduan kuota rasmi](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Permohonan kuota VM tidak meningkatkan kuota model.

3. **Optimalkan Kapasiti Model:**
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

### Isu: Versi API Tidak Sah

**Gejala:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Penyelesaian:**

1. **Gunakan Versi API Yang Disokong:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Semak Keserasian Versi API:**
Semak [rujukan kitar hayat API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Versi API penyedia sumber ARM **tidak** menyenaraikan versi API inferens/data-plane. Pelanggan v1 baru menggunakan `/openai/v1/` tanpa `api-version` yang bertarikh; jangan campurkan dua konfigurasi pelanggan ini.

## Masalah Carian Azure AI

### Isu: Tingkat Harga Perkhidmatan Carian Tidak Mencukupi

**Gejala:**
```
Error: Semantic search requires Basic tier or higher
```

**Penyelesaian:**

1. **Gunakan Tingkat Harga Yang Disokong:**

Pengatur semantik memerlukan Basic atau lebih tinggi. Berpindah dari Free/Basic ke tingkat lain mungkin memerlukan pembuatan perkhidmatan carian baru dan membina semula indeks; mengedit SKU tidak menjamin peningkatan tempat.
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

2. **Lumpuhkan Carian Semantik (Pembangunan):**
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

### Isu: Kegagalan Penciptaan Indeks

**Gejala:**
```
Error: Cannot create index, insufficient permissions
```

**Penyelesaian:**

1. **Sahkan Kekunci Perkhidmatan Carian:**
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

3. **Gunakan Identiti Terurus:**
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

## Isu Penyebaran Aplikasi Kontena

### Isu: Kegagalan Pembinaan Kontena

**Gejala:**
```
Error: Failed to build container image
```

**Penyelesaian:**

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

2. **Sahkan Kebergantungan:**
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

3. **Tambah Pemeriksaan Kesihatan:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Isu: Kegagalan Permulaan Aplikasi Kontena

**Gejala:**
```
Error: Container failed to start within timeout period
```

**Penyelesaian:**

1. **Tingkatkan Masa Tamat Permulaan:**
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

2. **Optimumkan Pemuatan Model:**
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

## Ralat Pengesahan dan Kebenaran

### Isu: Kebenaran Identiti Terurus Ditolak

**Gejala:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Penyelesaian:**

1. **Sahkan Penugasan Peranan:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tugaskan Peranan Diperlukan:**
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

3. **Uji Pengesahan:**
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

Pemerolehan token membuktikan pengesahan, bukan kebenaran untuk memanggil model. Uji operasi yang dimaksudkan secara berasingan. Secara tempatan, `DefaultAzureCredential` mungkin menggunakan kelayakan pembangun; di Azure, sahkan identiti terurus yang dipilih betul.

### Isu: Akses Key Vault Ditolak

**Gejala:**
```
Error: The user, group or application does not have secrets get permission
```

**Penyelesaian:**

1. **Berikan Kebenaran Key Vault:**

Gunakan serpihan dasar akses berikut hanya untuk vault dengan `enableRbacAuthorization: false`. Untuk vault yang diaktifkan RBAC, gunakan pilihan 2; menambah dasar akses tidak memberi akses data-plane dalam mod RBAC.
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

2. **Gunakan RBAC Daripada Dasar Akses:**

Vault mesti mempunyai `enableRbacAuthorization: true`; menukar model kebenaran memerlukan migrasi berancang akses sedia ada.
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

## Kegagalan Penyebaran Model

### Isu: Versi Model Tidak Tersedia

**Gejala:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Penyelesaian:**

1. **Semak Model Tersedia:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Pilih Model Tersedia Dengan Jelas:**
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

3. **Sahkan Model Sebelum Penyebaran:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Isu Prestasi dan Pengembangan

### Isu: Respons Latensi Tinggi

**Gejala:**
- Masa respons > 30 saat
- Ralat masa tamat
- Pengalaman pengguna yang buruk

**Penyelesaian:**

1. **Laksana Masa Tamat Permintaan:**
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

2. **Tambah Cache Respons:**
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

### Isu: Kegagalan Memori

**Gejala:**
```
Error: Container killed due to memory limit exceeded
```

**Penyelesaian:**

1. **Tingkatkan Peruntukan Memori:**
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

2. **Optimumkan Penggunaan Memori:**
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

## Pengurusan Kos dan Kuota

### Isu: Kos Tinggi Tidak Dijangka

**Gejala:**
- Bil Azure lebih tinggi dari jangkaan
- Penggunaan token melebihi anggaran
- Amaran bajet dicetuskan

**Penyelesaian:**

1. **Laksanakan Kawalan Kos:**
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

Pengira ingatan ini adalah ilustrasi, bukan kawalan perbelanjaan bulanan: ia reset semula pada mulakan semula, tidak dikongsi antara replikasi, dan memeriksa penggunaan hanya selepas panggilan. Had sebenar memerlukan perakaunan tahan lama, tempahan selamat keserentakan sebelum permintaan, dan polisi reset bulanan. Metrik memori kontena juga mesti mengambil kira had cgroup; `psutil.virtual_memory()` bukan pengukuran had kontena yang boleh dipercayai, dan pengutipan sampah tidak menguatkuasakan had memori.

2. **Sediakan Amaran Kos:**
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

Deklarasikan `budgetStartDate` dan `budgetEndDate` dalam templat anda. Bajet memaklumkan; ia tidak menghentikan sumber atau mengenakan had perbelanjaan keras.

3. **Optimumkan Pemilihan Model:**
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

## Alat dan Teknik Penguraian Ralat

### Perintah Penguraian Ralat AZD

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

### Perintah Sambungan AZD AI untuk Diagnostik

Jika anda menyebarkan ejen menggunakan `azd ai agent init`, alat tambahan ini tersedia:

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

> **Petua:** Gunakan `azd infra generate` untuk menulis IaC ke cakera supaya anda boleh memeriksa dengan tepat sumber apa yang disediakan. Ini sangat berguna semasa menguraikan masalah konfigurasi sumber. Lihat [rujukan CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk maklumat penuh.

**Diagnostik sedar pelepasan (2026-11-04):** Ejen `1.0.0-beta.23` memerlukan `azd >= 1.37.0`; naik taraf CLI teras sebelum sambungan yang tidak serasi. Pelepasan ejen ini mengekalkan amaran RBAC pembangun dalam output penyebaran akhir dan mengenal pasti versi yang terlibat dalam kegagalan pengaktifan/masa tamat. Masa tamat tidak mengesahkan kegagalan penyebaran: periksa versi yang dicuba sebelum cuba semula. Ia juga membetulkan panggilan A2A 0.3 yang memaparkan mesej kitar hayat daripada jawapan lengkap. Teras `azd 1.37.1` membaiki propagasi pembatalan merentasi sambungan; `1.37.2` memperbaiki pengesahan pembekalan kritikal dan pengendalian pembatalan.

Jika perintah penilaian tutorial lama hanya mencetak panduan migrasi, pasang `azure.ai.evaluations` (`1.0.0-beta.2` memerlukan `azd >= 1.33.0`) dan gunakan `azd ai eval init`, `generate`, dan `run start`. `--config` pengoptimuman tidak lagi menerima fail penilaian warisan. Lihat [migrasi penilaian](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dan [migrasi pengoptimuman](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Penguraian Aplikasi

1. **Log Berstruktur:**
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

2. **Titik Pemeriksaan Kesihatan:**
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

3. **Pemantauan Prestasi:**
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

## Kod Ralat Biasa dan Penyelesaian

| Kod Ralat | Penerangan | Penyelesaian |
|------------|-------------|----------|
| 401 | Tidak Sah | Semak kekunci API dan konfigurasi identiti terurus |
| 403 | Dilarang | Sahkan penugasan peranan RBAC |
| 429 | Had Kadar | Laksanakan logik cuba semula dengan backoff eksponen |
| 500 | Ralat Pelayan Dalaman | Semak status penyebaran model dan log |
| 503 | Perkhidmatan Tidak Tersedia | Sahkan kesihatan perkhidmatan dan ketersediaan wilayah |

## Langkah Seterusnya

1. **Tinjau [Panduan Penyebaran Model AI](../chapter-02-ai-development/ai-model-deployment.md)** untuk amalan terbaik penyebaran
2. **Selesaikan [Amalan AI Pengeluaran](../chapter-08-production/production-ai-practices.md)** untuk penyelesaian sedia perusahaan
3. **Sertai [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** untuk sokongan komuniti
4. **Serahkan isu** ke [repositori GitHub AZD](https://github.com/Azure/azure-dev) untuk masalah khusus AZD

## Sumber

- [Penyelesaian Masalah Kuota dan Perlahanan Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Penyelesaian Masalah Aplikasi Kontena](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Penyelesaian Masalah Carian Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Kemahiran Ejen Diagnostik Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Pasang kemahiran penyelesaian masalah Azure dalam editor anda: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Penguraian Ralat
- **⬅️ Sebelum Ini**: [Panduan Penguraian Ralat](debugging.md)
- **➡️ Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Perusahaan](../chapter-08-production/production-ai-practices.md)
- **🤖 Berkaitan**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Rujukan**: [Penyelesaian Masalah CLI Pembangun Azure](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->