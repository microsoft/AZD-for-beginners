# Penyebaran Model AI dengan Azure Developer CLI

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-First
- **⬅️ Sebelum**: [Ejen AI](agents.md)
- **➡️ Selepas**: [Makmal Bengkel AI](ai-workshop-lab.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

Panduan ini menyediakan arahan menyeluruh untuk menyebarkan model AI menggunakan templat AZD, meliputi segala-galanya dari pemilihan model hingga corak penyebaran produksi.

> **Ulasan pelepasan (2026-11-04):** Perubahan CLI yang berkaitan telah dikaji berbanding `azd` `1.37.2`; ketersediaan model, versi, dan kuota masih bergantung pada wilayah dan langganan. `azd deploy --timeout <seconds>` mengawal tingkap penyebaran perkhidmatan, bukan jaminan pengaktifan ejen. Lihat [nota pelepasan semasa dan panduan migrasi AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Jadual Kandungan

- [Strategi Pemilihan Model](#model-selection-strategy)
- [Konfigurasi AZD untuk Model AI](#azd-configuration-for-ai-models)
- [Corak Penyebaran](#deployment-patterns)
- [Pengurusan Model](#model-management)
- [Pertimbangan Produksi](#production-considerations)
- [Pemantauan dan Kebolehlihatan](#monitoring-and-observability)

## Strategi Pemilihan Model

### Model Azure OpenAI dalam Microsoft Foundry

Pilih model yang sesuai untuk kes penggunaan anda:

Isytiharkan penyebaran model dalam Bicep (di bawah), bukan dalam tetapan `services.*.config.AZURE_OPENAI_MODELS` secara sewenang-wenangnya. AZD tidak mentafsir tetapan sedemikian sebagai senarai sumber model. `project` perkhidmatan merujuk kepada sumber aplikasi, bukan direktori `infra/`.

Contoh menggunakan versi `gpt-4.1-mini` yang diterbitkan **`2025-04-14`** dan versi embedding **`1`**. Sahkan bahawa versi model dan SKU penyebaran disokong di wilayah/akaun sasaran anda sebelum penempatan.

### Perancangan Kapasiti Model

| Jenis Model | Kes Penggunaan | Permintaan Token Contoh | Pertimbangan Kos |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Sembang, Soal Jawab | 10,000-50,000 TPM | Uji kos dan kualiti untuk beban kerja anda |
| gpt-4.1 | Tugas kompleks | 20,000-100,000 TPM | Nilai peningkatan kualiti berbanding kos token |
| text-embedding-3-large | Carian, RAG | 30,000-120,000 TPM | Ambil kira pengambilan serta trafik pertanyaan |
| Whisper | Ucapan ke teks | Rancang menggunakan tempoh audio dan had permintaan | Jangan guna formula kapasiti TPM model teks |

TPM bermaksud token per minit. Untuk penyebaran teks Standard ini, ARM `sku.capacity` adalah dalam unit **1,000-TPM**, bukan TPM individu (kapasiti `10` bermaksud 10,000 TPM). Nisbah RPM-ke-TPM berbeza mengikut jenis model/penyebaran; sahkan kedua-dua had itu terhadap [dokumentasi kuota](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Julat ini adalah contoh, bukan cadangan saiz.

## Konfigurasi AZD untuk Model AI

### Konfigurasi Templat Bicep

Cipta penyebaran model melalui templat Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
    disableLocalAuth: true
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

Ini adalah contoh **infrastruktur pembangunan bertaraf kumpulan sumber**, bukan templat aplikasi AZD lengkap. Akaun membenarkan akses rangkaian awam dan memerlukan pengesahan Entra ID/RBAC (`Cognitive Services OpenAI User` untuk pemanggil). Pengeluaran memerlukan titik akhir persendirian, DNS, dan sambungan aplikasi yang diterangkan dalam Bab 8. AZD juga memerlukan templat utama/pemetaan parameter dan sumber hos aplikasi; gunakan sampel yang berfungsi untuk penyebaran penuh.

### Pembolehubah Persekitaran

Konfigurasi persekitaran aplikasi anda:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ini adalah nama yang ditakrifkan oleh aplikasi; sambungkan mereka ke konfigurasi hos anda. Titik akhir Azure OpenAI v1 yang digunakan oleh pemeriksaan kesihatan di bawah tidak memerlukan parameter pertanyaan `api-version` yang usang; klien `AzureOpenAI` lama memerlukannya, jadi ikut penjanaan API yang digunakan oleh aplikasi anda.

## Corak Penyebaran

### Corak 1: Penyebaran Satu Wilayah

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Terbaik untuk:
- Pembangunan dan pengujian  
- Aplikasi pasaran tunggal  
- Pengoptimuman kos  

### Corak 2: Penyebaran Pelbagai Wilayah

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Sifat akaun/SKU yang diabaikan mesti disediakan; serpihan ini tidak boleh disebarkan sebagaimana ditulis. Sebarkan model di setiap akaun dan laksanakan kawalan penghalaan/gagal-atas dan pemastautin data secara berasingan.

Terbaik untuk:
- Aplikasi global  
- Keperluan ketersediaan tinggi  
- Pengedaran beban  

### Corak 3: Penyebaran Hibrid

Gabungkan Microsoft Foundry Models dengan perkhidmatan AI lain:

Serpihan berikut mengandaikan nama dan `location` disediakan oleh templat yang mengandungi.

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

Jejaki versi model dalam konfigurasi aplikasi anda atau IaC. JSON ini adalah **contoh yang ditakrifkan oleh aplikasi**, bukan skema model terbina dalam AZD; fallback mesti dilaksanakan dan disebarkan secara eksplisit:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
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

Gunakan hook AZD untuk pemeriksaan ketersediaan baca sahaja, kemudian kemas kini IaC dan sediakan:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Jalankan `azd up` **luar** hook untuk menerapkan infrastruktur model yang diubah dan menyebarkan kod. Jangan sesekali memanggil `azd deploy` dari hook `predeploy`: ia akan mencetuskan hook yang sama secara rekursif. `azd deploy --timeout 1800` memperluaskan waktu tamat penyebaran aplikasi; ia tidak mengemas kini sumber Bicep.

### Ujian A/B

Sumber ilustrasi di bawah memilih nama penyebaran dan kapasiti; ia mencipta **satu** penyebaran, bukan ujian A/B. Untuk eksperimen sebenar, sediakan dua sumber penyebaran yang berbeza, lalukan sebahagian kawalan permintaan ke setiap satu, dan bandingkan kualiti, latensi, dan kos. Ia menganggap `openAi` dari contoh akaun:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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

Kira kapasiti yang diperlukan berdasarkan corak penggunaan:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Output dijangka: `Required capacity: 9100 TPM`. Dengan 1,000 unit kapasiti TPM, bulatkan ke atas sekurang-kurangnya `10`, kemudian sahkan RPM khusus model dan anggaran had kadar perkhidmatan (termasuk bajet output yang diminta). Anggaran permintaan token ini bukan jaminan terhadap pemadaman.

### Konfigurasi Skala Automatik

Konfigurasikan skala automatik untuk Container Apps:

**Sumber separa:** gabungkan tetapan `template.scale` ke dalam Container App lengkap dengan lokasi, persekitaran terurus, imej bekas, sumber, dan ingress. Menambah bilangan replika tidak meningkatkan kuota model.

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

**Sumber bajet ilustrasi:** takrifkan `budgetStartDate` sebagai hari pertama bulan semasa dalam UTC (contohnya `2026-11-01T00:00:00Z` untuk ulasan ini), dan gantikan alamat kontak. Permulaan mesti memenuhi kekangan tarikh semasa perkhidmatan. Bajet memberi amaran mengenai data bil tertangguh; ia tidak menghentikan perbelanjaan.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

## Pemantauan dan Kebolehperhhatian

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

```

Serpihan sumber mengandaikan `applicationInsightsName`, `location`, dan `logAnalyticsWorkspace` yang sedia ada. Ia menyediakan pemantauan, tetapi tidak menyediakan instrumen aplikasi atau mencipta metrik tersuai.

### Metrik Tersuai

Jejaki metrik khusus AI:

Gunakan [Pengedaran OpenTelemetry Azure Monitor](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) yang disokong, bukan SDK Python`applicationinsights` lama. Pasang `azure-monitor-opentelemetry`, konfigurasikan `APPLICATIONINSIGHTS_CONNECTION_STRING`, dan mulakan sekali semasa permulaan:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

Ini menggambarkan penghantaran atribut, bukan instrumentasi panggilan model sebenar. Balut permintaan sebenar dalam span untuk mengukur tempohnya; periksa `dependencies`/`traces` dalam Application Insights. Jangan hantar arahan, respons, kunci, atau mesej pengecualian mentah yang mengandungi data sensitif.

### Pemeriksaan Kesihatan

Laksanakan pemantauan kesihatan perkhidmatan AI:

Pasang `fastapi`, `uvicorn`, `httpx`, dan `azure-identity`. Tetapkan pembolehubah titik akhir/penyebaran di atas dan berikan pemanggil `Cognitive Services OpenAI User`. **Probe kesiapsiagaan** ini menggunakan pesawat data Azure OpenAI v1 dengan Entra ID; ia membuat panggilan model berbayar. Jalankan dengan `uvicorn health:app` selepas menyimpan sebagai `health.py`. Gunakan pemeriksaan hidup ringan berasingan, had kadar/cache keputusan kesiapsiagaan, dan jangan dedahkan laluan ini secara awam tanpa kawalan akses.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Dijangka: `GET /health/ai-models` mengembalikan `200 {"status":"healthy"}` apabila penyebaran chat yang dikonfigurasi boleh digunakan, atau `503` tanpa mendedahkan butiran hulu. Menyenaraikan penyebaran adalah operasi pesawat pengurusan dan bukan probe kesihatan pesawat data yang sah.

## Langkah Seterusnya

1. **Kajilah [Panduan Integrasi Microsoft Foundry](microsoft-foundry-integration.md)** untuk corak integrasi perkhidmatan  
2. **Lengkapkan [Makmal Bengkel AI](ai-workshop-lab.md)** untuk pengalaman praktikal  
3. **Laksanakan [Amalan AI Pengeluaran](../chapter-08-production/production-ai-practices.md)** untuk penyebaran perusahaan  
4. **Terokai [Panduan Penyelesaian Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** untuk isu biasa  

## Sumber

- [Ketersediaan Model Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Skala Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)  
- [Pengoptimuman Kos Model AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)  

---

**Navigasi Bab:**  
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)  
- **📖 Bab Semasa**: Bab 2 - Pembangunan Utama AI  
- **⬅️ Sebelumnya**: [Ejen AI](agents.md)  
- **➡️ Seterusnya**: [Makmal Bengkel AI](ai-workshop-lab.md)  
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->