# Penyebaran Model AI dengan Azure Developer CLI

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama
- **⬅️ Sebelumnya**: [Agen AI](agents.md)
- **➡️ Berikutnya**: [Lab Workshop AI](ai-workshop-lab.md)
- **🚀 Bab Selanjutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

Panduan ini memberikan instruksi lengkap untuk menyebarkan model AI menggunakan template AZD, mencakup segala hal mulai dari pemilihan model hingga pola penyebaran produksi.

> **Tinjauan rilis (2026-11-04):** Perubahan CLI terkait telah ditinjau terhadap `azd` `1.37.2`; ketersediaan model, versi, dan kuota tetap bergantung pada wilayah dan langganan. `azd deploy --timeout <seconds>` mengontrol jendela penyebaran layanan, bukan jaminan aktivasi agen. Lihat [catatan rilis saat ini dan panduan migrasi AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Daftar Isi

- [Strategi Pemilihan Model](#model-selection-strategy)
- [Konfigurasi AZD untuk Model AI](#azd-configuration-for-ai-models)
- [Pola Penyebaran](#deployment-patterns)
- [Manajemen Model](#model-management)
- [Pertimbangan Produksi](#production-considerations)
- [Pemantauan dan Observabilitas](#monitoring-and-observability)

## Strategi Pemilihan Model

### Model Azure OpenAI di Microsoft Foundry

Pilih model yang tepat untuk kasus penggunaan Anda:

Deklarasikan penyebaran model dalam Bicep (di bawah), bukan di pengaturan `services.*.config.AZURE_OPENAI_MODELS` sembarangan. AZD tidak menafsirkan pengaturan tersebut sebagai daftar sumber daya model. `project` layanan mengacu pada sumber aplikasi, bukan direktori `infra/`.

Contoh menggunakan versi `gpt-4.1-mini` yang diterbitkan **`2025-04-14`** dan versi embedding **`1`**. Pastikan versi model dan SKU penyebaran didukung di wilayah/akun target sebelum penyediaan.

### Perencanaan Kapasitas Model

| Tipe Model | Kasus Penggunaan | Ilustrasi Permintaan Token | Pertimbangan Biaya |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Obrolan, Tanya Jawab | 10,000-50,000 TPM | Benchmark biaya dan kualitas untuk beban kerja Anda |
| gpt-4.1 | Tugas kompleks | 20,000-100,000 TPM | Evaluasi peningkatan kualitas terhadap biaya token |
| text-embedding-3-large | Pencarian, RAG | 30,000-120,000 TPM | Perhitungkan ingest serta lalu lintas kueri |
| Whisper | Ucapan ke teks | Rencanakan menggunakan durasi audio dan batas permintaan | Jangan gunakan rumus kapasitas TPM model teks |

TPM berarti token per menit. Untuk penyebaran teks Standar ini, ARM `sku.capacity` adalah dalam **unit 1,000-TPM**, bukan TPM individual (kapasitas `10` berarti 10,000 TPM). Rasio RPM-ke-TPM bervariasi menurut tipe model/penyebaran; verifikasi batas keduanya terhadap [dokumentasi kuota](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Rentang ini adalah contoh, bukan rekomendasi ukuran.

## Konfigurasi AZD untuk Model AI

### Konfigurasi Template Bicep

Buat penyebaran model melalui template Bicep:

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

Ini adalah contoh **infrastruktur pengembangan dengan cakupan grup sumber daya**, bukan template aplikasi AZD lengkap. Akun mengizinkan akses jaringan publik dan memerlukan autentikasi Entra ID/RBAC (`Cognitive Services OpenAI User` untuk pemanggil). Produksi memerlukan endpoint privat, DNS, dan konektivitas aplikasi yang dijelaskan di Bab 8. AZD juga memerlukan template/parameter utama dan sumber daya host aplikasi; gunakan contoh kerja untuk penyebaran penuh.

### Variabel Lingkungan

Konfigurasikan lingkungan aplikasi Anda:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ini adalah nama yang ditentukan aplikasi; sambungkan ke konfigurasi host Anda. Endpoint Azure OpenAI v1 yang digunakan oleh pemeriksaan kesehatan di bawah tidak memerlukan parameter kueri `api-version` yang bertanggal; klien `AzureOpenAI` yang lebih lama memerlukannya, jadi ikuti generasi API yang digunakan aplikasi Anda.

## Pola Penyebaran

### Pola 1: Penyebaran Satu Wilayah

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
- Pengembangan dan pengujian
- Aplikasi pasar tunggal
- Optimalisasi biaya

### Pola 2: Penyebaran Multi-Wilayah

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

Properti akun/SKU yang dihilangkan harus disediakan; fragmen ini tidak dapat disebarkan sebagaimana adanya. Sebarkan model di setiap akun dan terapkan pengendalian routing/gagalan dan residensi data secara terpisah.

Terbaik untuk:
- Aplikasi global
- Persyaratan ketersediaan tinggi
- Distribusi beban

### Pola 3: Penyebaran Hybrid

Gabungkan Model Microsoft Foundry dengan layanan AI lainnya:

Fragmen berikut mengasumsikan nama dan `location` disediakan oleh template induk.

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

## Manajemen Model

### Kontrol Versi

Lacak versi model dalam konfigurasi aplikasi atau IaC Anda. JSON ini adalah **contoh yang ditentukan aplikasi**, bukan skema model AZD bawaan; fallback harus diimplementasikan dan disebarkan secara eksplisit:

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

### Pembaruan Model

Gunakan hook AZD untuk pemeriksaan ketersediaan read-only, lalu perbarui IaC dan keluarkan penyediaan:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Jalankan `azd up` **di luar** hook untuk menerapkan infrastruktur model yang berubah dan menyebarkan kode. Jangan pernah panggil `azd deploy` dari hook `predeploy`: itu secara rekursif memicu hook yang sama. `azd deploy --timeout 1800` memperpanjang batas waktu penyebaran aplikasi; itu tidak memperbarui sumber daya Bicep.

### Pengujian A/B

Sumber daya ilustratif di bawah memilih nama penyebaran dan kapasitas; itu membuat **satu** penyebaran, bukan pengujian A/B. Untuk eksperimen nyata, sediakan dua sumber daya penyebaran berbeda, arahkan sebagian terkendali permintaan ke masing-masing, dan bandingkan kualitas, latensi, dan biaya. Ini mengasumsikan `openAi` dari contoh akun:

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

## Pertimbangan Produksi

### Perencanaan Kapasitas

Hitung kapasitas yang diperlukan berdasarkan pola penggunaan:

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

Output yang diharapkan: `Required capacity: 9100 TPM`. Dengan unit kapasitas 1,000-TPM, bulatkan ke atas minimal `10`, kemudian verifikasi estimasi RPM spesifik model dan batas laju layanan (termasuk anggaran output yang diminta). Estimasi permintaan token ini bukan jaminan terhadap throttle.

### Konfigurasi Auto-scaling

Konfigurasikan auto-scaling untuk Container Apps:

**Sumber daya parsial:** gabungkan pengaturan `template.scale` ke dalam Container App lengkap dengan lokasi, lingkungan terkelola, gambar kontainer, sumber daya, dan ingress. Meningkatkan replika tidak menambah kuota model.

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

### Optimalisasi Biaya

Terapkan kontrol biaya:

**Sumber daya anggaran ilustratif:** definisikan `budgetStartDate` sebagai hari pertama bulan berjalan dalam UTC (misalnya `2026-11-01T00:00:00Z` untuk tinjauan ini), dan ganti alamat kontak. Mulai harus memenuhi batasan tanggal layanan saat ini. Anggaran memperingatkan data penagihan tertunda; mereka tidak menghentikan pengeluaran.

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

## Pemantauan dan Observabilitas

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

Fragmen sumber daya mengasumsikan `applicationInsightsName`, `location`, dan `logAnalyticsWorkspace` yang ada. Ini menyediakan pemantauan, tapi tidak menginstrumentasi aplikasi atau membuat metrik khusus.

### Metrik Khusus

Lacak metrik spesifik AI:

Gunakan [distribusi Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) yang didukung, bukan SDK Python `applicationinsights` versi lama. Instal `azure-monitor-opentelemetry`, konfigurasikan `APPLICATIONINSIGHTS_CONNECTION_STRING`, dan inisialisasi sekali saat startup:

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

Ini menggambarkan emisi atribut, bukan instrumentasi panggilan model yang sebenarnya. Bungkus permintaan nyata dalam sebuah span untuk mengukur durasinya; periksa `dependencies`/`traces` di Application Insights. Jangan kirim prompt, respons, kunci, atau pesan pengecualian mentah yang berisi data sensitif.

### Pemeriksaan Kesehatan

Terapkan pemantauan kesehatan layanan AI:

Instal `fastapi`, `uvicorn`, `httpx`, dan `azure-identity`. Tetapkan variabel endpoint/penyebaran di atas dan berikan pemanggil `Cognitive Services OpenAI User`. **Probe kesiapan** ini menggunakan Azure OpenAI v1 data plane dengan Entra ID; ini membuat panggilan model yang dapat ditagih. Jalankan dengan `uvicorn health:app` setelah disimpan sebagai `health.py`. Gunakan pemeriksaan liveness ringan terpisah, batasi tingkat/cache hasil kesiapan, dan jangan buat rute ini publik tanpa kontrol akses.

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

Diharapkan: `GET /health/ai-models` mengembalikan `200 {"status":"healthy"}` saat penyebaran obrolan yang dikonfigurasi dapat digunakan, atau `503` tanpa mengungkapkan detail hulu. Mendaftar penyebaran adalah operasi manajemen plane dan bukan probe kesehatan data plane yang valid.

## Langkah Selanjutnya

1. **Tinjau [Panduan Integrasi Microsoft Foundry](microsoft-foundry-integration.md)** untuk pola integrasi layanan
2. **Selesaikan [Lab Workshop AI](ai-workshop-lab.md)** untuk pengalaman langsung
3. **Terapkan [Praktik AI Produksi](../chapter-08-production/production-ai-practices.md)** untuk penyebaran perusahaan
4. **Jelajahi [Panduan Pemecahan Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** untuk masalah umum

## Sumber Daya

- [Ketersediaan Model Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scaling Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimalisasi Biaya Model AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama
- **⬅️ Sebelumnya**: [Agen AI](agents.md)
- **➡️ Berikutnya**: [Lab Workshop AI](ai-workshop-lab.md)
- **🚀 Bab Selanjutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->