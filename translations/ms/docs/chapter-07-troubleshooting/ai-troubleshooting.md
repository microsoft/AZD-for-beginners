# Panduan Penyelesaian Masalah Khusus AI

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Debugging
- **⬅️ Sebelumnya**: [Panduan Debugging](debugging.md)
- **➡️ Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Berkaitan**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

Panduan penyelesaian masalah yang komprehensif ini menangani isu biasa apabila melaksanakan penyelesaian AI dengan AZD, memberikan penyelesaian dan teknik debugging khusus untuk perkhidmatan Azure AI.

> **Skop:** Perintah menggunakan nama sumber contoh; gantikan dan pilih langganan yang betul. Blok Bicep adalah serpihan untuk digabung ke dalam templat sedia ada, bukan pelaksanaan bersendirian. Potongan Python memerlukan SDK dan konfigurasi aplikasi yang dinyatakan. Tiada pelaksanaan Azure langsung dilakukan untuk tinjauan ini.

## Jadual Kandungan

- [Isu Perkhidmatan Model Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [Masalah Carian Azure AI](#azure-ai-search-problems)
- [Isu Pelaksanaan Container Apps](#container-apps-deployment-issues)
- [Ralat Pengesahan dan Kebenaran](#authentication-and-permission-errors)
- [Kegagalan Pelaksanaan Model](#model-deployment-failures)
- [Isu Prestasi dan Skala](#performance-and-scaling-issues)
- [Pengurusan Kos dan Kuota](#cost-and-quota-management)
- [Alat dan Teknik Debugging](#debugging-tools-and-techniques)

## Isu Perkhidmatan Model Microsoft Foundry

### Isu: Perkhidmatan OpenAI Tidak Tersedia di Wilayah

**Gejala:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Punca:**
- Model Microsoft Foundry tidak tersedia di wilayah yang dipilih
- Kuota telah habis di wilayah pilihan
- Kekangan kapasiti wilayah

**Penyelesaian:**

1. **Semak Ketersediaan Wilayah:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Kemas Kini Konfigurasi AZD:**
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

### Isu: Kuota Pelaksanaan Model Melebihi Had

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

2. **Mohon Peningkatan Kuota:**
Gunakan aliran kerja pengurusan kuota portal Foundry untuk langganan, wilayah, model, dan jenis pelaksanaan yang terjejas. Lihat [panduan kuota rasmi](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Permintaan kuota VM tidak meningkatkan kuota model.

3. **Optimumkan Kapasiti Model:**
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

1. **Gunakan Versi API yang Disokong:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Semak Keserasian Versi API:**
Semak [rujukan kitar hidup API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Versi API penyedia sumber ARM **tidak** menyenaraikan versi API inferens/data-plane. Pelanggan v1 baru menggunakan `/openai/v1/` tanpa `api-version` bertarikh; jangan campur konfigurasi dua klien ini.

## Masalah Carian Azure AI

### Isu: Tahap Harga Perkhidmatan Carian Tidak Mencukupi

**Gejala:**
```
Error: Semantic search requires Basic tier or higher
```

**Penyelesaian:**

1. **Gunakan Tahap Harga yang Disokong:**

Peringkat semantik memerlukan Basic atau lebih tinggi. Berpindah dari Free/Basic ke tahap lain mungkin memerlukan membuat perkhidmatan carian baru dan membina semula indeks; suntingan SKU tidak menjamin naik taraf dalam tempat.
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

1. **Sahkan Kunci Perkhidmatan Carian:**
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

3. **Gunakan Identiti Terkelola:**
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

## Isu Pelaksanaan Container Apps

### Isu: Kegagalan Pembinaan Container

**Gejala:**
```
Error: Failed to build container image
```

**Penyelesaian:**

1. **Semak Sintaks Dockerfile:**
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

### Isu: Kegagalan Permulaan Aplikasi Container

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

### Isu: Kebenaran Identiti Terkelola Ditolak

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

2. **Tetapkan Peranan Diperlukan:**
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

Pemerolehan token membuktikan pengesahan, bukan kebenaran untuk memanggil model. Uji operasi yang dikehendaki secara berasingan. Secara tempatan, `DefaultAzureCredential` mungkin menggunakan kelayakan pembangun; di Azure, sahkan identiti terkelola yang dimaksudkan dipilih.

### Isu: Akses Key Vault Ditolak

**Gejala:**
```
Error: The user, group or application does not have secrets get permission
```

**Penyelesaian:**

1. **Berikan Kebenaran Key Vault:**

Gunakan serpihan dasar akses berikut hanya untuk vault dengan `enableRbacAuthorization: false`. Untuk vault yang didayakan RBAC, gunakan pilihan 2; menambah dasar akses tidak memberi akses data-plane dalam mod RBAC.
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

2. **Gunakan RBAC Gantikan Dasar Akses:**

Vault mesti mempunyai `enableRbacAuthorization: true`; menukar model kebenaran memerlukan migrasi rancangan akses sedia ada.
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

## Kegagalan Pelaksanaan Model

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

2. **Pilih Model Tersedia Secara Eksplisit:**
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

3. **Sahkan Model Sebelum Pelaksanaan:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Isu Prestasi dan Skala

### Isu: Respons Latensi Tinggi

**Gejala:**
- Masa respons > 30 saat
- Ralat tamat masa
- Pengalaman pengguna yang buruk

**Penyelesaian:**

1. **Laksanakan Had Masa Permintaan:**
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

### Isu: Ralat Memori Habis

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
- Amaran belanjawan dipicu

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

Kaunter dalam memori ini adalah ilustratif, bukan kawalan perbelanjaan bulanan: ia diset semula semasa mula semula, tidak dikongsi antara replika, dan memeriksa penggunaan hanya selepas panggilan. Had sebenar memerlukan perakaunan tahan lama, tempahan selamat-kerohanian sebelum permintaan, dan dasar set semula bulanan. Metrik memori kontena juga mesti mengambil kira had cgroup; `psutil.virtual_memory()` bukan ukuran had kontena yang boleh dipercayai, dan pengumpulan sampah tidak menguatkuasakan had memori.

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

Nyatakan `budgetStartDate` dan `budgetEndDate` dalam templat anda. Bajet memberitahu; ia tidak menghentikan sumber atau mengenakan had perbelanjaan keras.

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

## Alat dan Teknik Debugging

### Perintah Debug AZD

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

Jika anda melaksanakan agen menggunakan `azd ai agent init`, alat tambahan ini tersedia:

```bash
# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Stream hosted-agent logs
azd ai agent monitor --follow

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Petua:** Gunakan `azd infra generate` untuk menulis IaC ke cakera supaya anda boleh memeriksa dengan tepat apa sumber yang telah disediakan. Ini sangat membantu ketika menyelesaikan masalah konfigurasi sumber. Lihat [rujukan AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk maklumat lengkap.

**Diagnostik aliran kerja GA (2026-11-09):** Sahkan `azd version` sekurang-kurangnya 1.37.0 dan periksa `azd ext list --installed`. Kemas kini CLI teras dahulu dengan `azd update` atau pemasangnya, kemudian kemas kini bundel dengan `azd ext upgrade microsoft.foundry`. Untuk kegagalan tempatan, periksa uv semasa, Python 3.13+ untuk contoh asas, `PYTHONNOUSERSITE: "1"` dalam konfigurasi perkhidmatannya, dan kelayakan Azure yang digunakan oleh `DefaultAzureCredential`. Biarkan `azd ai agent run` berjalan semasa memanggil `--local` dari terminal kedua dalam direktori projek.

Kejayaan penyediaan tidak membuktikan pembangun mempunyai akses data-plane. Semak amaran RBAC dan [matrik kebenaran agen-host](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Tamat masa tidak mengesahkan kegagalan pelaksanaan: periksa versi yang dicuba dan log sebelum mencuba semula. Agen awal beta.23 memperbaiki amaran dan output A2A; pembaikan tersebut diterangkan dalam [nota pelepasan](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), bukan keperluan memasang beta itu.

Jika `azd ai eval` tidak tersedia, pasang `azure.ai.evaluations` secara berasingan; bundel GA tidak menyertakannya. Jika arahan agent-evaluation tutorial lama hanya mencetak panduan migrasi, gunakan aliran kerja `azd ai eval` yang berasingan. Evaluasi pengoptimuman `--config` tidak lagi menerima fail penilaian lama. Lihat [migrasi evaluasi](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dan [migrasi pengoptimuman](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Debug Aplikasi

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

2. **Titik Akhir Pemeriksaan Kesihatan:**
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

## Kod Ralat dan Penyelesaian Biasa

| Kod Ralat | Penerangan | Penyelesaian |
|------------|-------------|----------|
| 401 | Tidak Sah | Semak kunci API dan konfigurasi identiti terkelola |
| 403 | Dilarang | Sahkan penugasan peranan RBAC |
| 429 | Hadkan Kadar | Laksanakan logik cuba semula dengan pemantulan eksponen |
| 500 | Ralat Pelayan Dalaman | Semak status pelaksanaan model dan log |
| 503 | Perkhidmatan Tidak Tersedia | Sahkan kesihatan perkhidmatan dan ketersediaan wilayah |

## Langkah Seterusnya

1. **Semak [Panduan Pelaksanaan Model AI](../chapter-02-ai-development/ai-model-deployment.md)** untuk amalan terbaik pelaksanaan
2. **Lengkapkan [Amalan AI Pengeluaran](../chapter-08-production/production-ai-practices.md)** untuk penyelesaian bersedia perusahaan
3. **Sertai [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** untuk sokongan komuniti
4. **Hantar isu** ke [repositori AZD GitHub](https://github.com/Azure/azure-dev) untuk masalah khusus AZD

## Sumber

- [Penyelesaian masalah kuota dan throttling Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Penyelesaian masalah Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Penyelesaian masalah Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Kemahiran Agen Diagnostik Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Pasang kemahiran penyelesaian masalah Azure dalam penyunting anda: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Debugging
- **⬅️ Sebelumnya**: [Panduan Debugging](debugging.md)
- **➡️ Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Berkaitan**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Rujukan**: [Penyelesaian Masalah Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->