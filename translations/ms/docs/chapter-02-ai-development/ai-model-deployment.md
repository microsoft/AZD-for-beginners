# Penyebaran Model AI dengan Azure Developer CLI

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Utama AI
- **⬅️ Sebelumnya**: [Integrasi Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Seterusnya**: [Makmal Bengkel AI](ai-workshop-lab.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

Panduan ini menyediakan arahan terperinci untuk menyebarkan model AI menggunakan templat AZD, merangkumi segala-galanya daripada pemilihan model hingga corak penyebaran pengeluaran.

> **Nota pengesahan (2026-03-25):** Aliran kerja AZD dalam panduan ini telah disemak dengan `azd` `1.23.12`. Untuk penyebaran AI yang mengambil masa lebih lama daripada tetingkap penyebaran perkhidmatan lalai, keluaran AZD semasa menyokong `azd deploy --timeout <seconds>`.

## Jadual Kandungan

- [Strategi Pemilihan Model](#strategi-pemilihan-model)
- [Konfigurasi AZD untuk Model AI](#konfigurasi-azd-untuk-model-ai)
- [Corak Penyebaran](#corak-penyebaran)
- [Pengurusan Model](#pengurusan-model)
- [Pertimbangan Pengeluaran](#pertimbangan-pengeluaran)
- [Pemantauan dan Kebolehlihatan](#pemantauan-dan-kebolehlihatan)

## Strategi Pemilihan Model

### Model Microsoft Foundry

Pilih model yang tepat untuk kes penggunaan anda:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Perancangan Kapasiti Model

| Jenis Model | Kes Penggunaan | Kapasiti Disyorkan | Pertimbangan Kos |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Sembang, Soal Jawab | 10-50 TPM | Berkesan dari segi kos untuk kebanyakan beban kerja |
| gpt-4.1 | Penaakulan kompleks | 20-100 TPM | Kos lebih tinggi, guna untuk ciri premium |
| text-embedding-3-large | Carian, RAG | 30-120 TPM | Pilihan lalai yang kukuh untuk carian semantik dan pengambilan |
| Whisper | Ucapan-ke-teks | 10-50 TPM | Beban kerja pemprosesan audio |

## Konfigurasi AZD untuk Model AI

### Konfigurasi Templat Bicep

Cipta penyebaran model melalui templat Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

### Pembolehubah Persekitaran

Konfigurasikan persekitaran aplikasi anda:

```bash
# konfigurasi .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Corak Penyebaran

### Corak 1: Penyebaran Satu Wilayah

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Terbaik untuk:
- Pembangunan dan pengujian
- Aplikasi pasaran tunggal
- Pengoptimuman kos

### Corak 2: Penyebaran Pelbagai Wilayah

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Terbaik untuk:
- Aplikasi global
- Keperluan kebolehcapaian tinggi
- Pengagihan beban

### Corak 3: Penyebaran Hibrid

Gabungkan Model Microsoft Foundry dengan perkhidmatan AI lain:

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## Pengurusan Model

### Kawalan Versi

Jejaki versi model dalam konfigurasi AZD anda:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Kemas Kini Model

Gunakan kait AZD untuk kemas kini model:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Jika pelaksanaan mengambil masa lebih lama daripada tamat masa lalai
azd deploy --timeout 1800
```

### Ujian A/B

Sebarkan pelbagai versi model:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Pertimbangan Pengeluaran

### Perancangan Kapasiti

Hitung kapasiti yang diperlukan berdasarkan corak penggunaan:

```python
# Contoh pengiraan kapasiti
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# Contoh penggunaan
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Konfigurasi Penskalakan Auto

Konfigurasikan penskalakan auto untuk Container Apps:

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### Pengoptimuman Kos

Laksanakan kawalan kos:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## Pemantauan dan Kebolehlihatan

### Integrasi Application Insights

Konfigurasikan pemantauan untuk beban kerja AI:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### Metrik Tersuai

Jejaki metrik khusus AI:

```python
# Telemetri tersuai untuk model AI
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### Pemeriksaan Kesihatan

Laksanakan pemantauan kesihatan perkhidmatan AI:

```python
# Titik pemeriksaan kesihatan
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Uji sambungan OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## Langkah Seterusnya

1. **Semak [Panduan Integrasi Microsoft Foundry](microsoft-foundry-integration.md)** untuk corak integrasi perkhidmatan
2. **Lengkapkan [Makmal Bengkel AI](ai-workshop-lab.md)** untuk pengalaman praktikal
3. **Laksanakan [Amalan AI Pengeluaran](production-ai-practices.md)** untuk penyebaran perusahaan
4. **Terokai [Panduan Penyelesaian Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** untuk isu biasa

## Sumber

- [Ketersediaan Model Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Penskalaan Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Pengoptimuman Kos Model AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Utama AI
- **⬅️ Sebelumnya**: [Integrasi Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Seterusnya**: [Makmal Bengkel AI](ai-workshop-lab.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->