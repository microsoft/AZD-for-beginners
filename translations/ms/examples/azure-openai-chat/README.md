# Aplikasi Chat Azure OpenAI

**Laluan Pembelajaran:** Pertengahan ⭐⭐ | **Masa:** 35-45 minit | **Kos:** $50-200/bulan

Satu aplikasi chat Azure OpenAI lengkap yang dikerahkan menggunakan Azure Developer CLI (azd). Contoh ini menunjukkan pengkerahan GPT-4, akses API yang selamat, dan antara muka chat yang ringkas.

## 🎯 Apa Yang Anda Akan Pelajari

- Kerahkan Azure OpenAI Service dengan model GPT-4
- Amankan kunci API OpenAI dengan Key Vault
- Bina antara muka chat ringkas dengan Python
- Pantau penggunaan token dan kos
- Laksanakan had kadar dan pengendalian ralat

## 📦 Apa Yang Disertakan

✅ **Azure OpenAI Service** - Pengkerahan model GPT-4  
✅ **Aplikasi Chat Python** - Antara muka chat baris perintah yang ringkas  
✅ **Integrasi Key Vault** - Penyimpanan kunci API yang selamat  
✅ **Templat ARM** - Infrastruktur lengkap sebagai kod  
✅ **Pemantauan Kos** - Penjejakan penggunaan token  
✅ **Had Kadar** - Cegah kehabisan kuota  

## Seni Bina

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Prasyarat

### Diperlukan

- **Azure Developer CLI (azd)** - [Panduan pemasangan](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Langganan Azure** dengan akses OpenAI - [Mohon akses](https://aka.ms/oai/access)
- **Python 3.9+** - [Pasang Python](https://www.python.org/downloads/)

### Sahkan Prasyarat

```bash
# Periksa versi azd (perlu 1.5.0 atau lebih tinggi)
azd version

# Sahkan log masuk Azure
azd auth login

# Periksa versi Python
python --version  # atau python3 --version

# Sahkan akses OpenAI (periksa di Portal Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Penting:** Azure OpenAI memerlukan kelulusan permohonan. Jika anda belum memohon, lawati [aka.ms/oai/access](https://aka.ms/oai/access). Kelulusan biasanya mengambil masa 1-2 hari bekerja.

## ⏱️ Garis Masa Pengkerahan

| Fasa | Tempoh | Apa Yang Berlaku |
|------|--------|------------------|
| Semakan prasyarat | 2-3 minit | Sahkan ketersediaan kuota OpenAI |
| Kerahkan infrastruktur | 8-12 minit | Cipta OpenAI, Key Vault, pengkerahan model |
| Konfigurasi aplikasi | 2-3 minit | Sediakan persekitaran dan kebergantungan |
| **Jumlah** | **12-18 minit** | Sedia untuk berbual dengan GPT-4 |

**Nota:** Pengkerahan OpenAI kali pertama mungkin mengambil masa lebih lama kerana penyediaan model.

## Permulaan Pantas

```bash
# Navigasi ke contoh
cd examples/azure-openai-chat

# Inisialisasi persekitaran
azd env new myopenai

# Laksanakan semuanya (infrastruktur + konfigurasi)
azd up
# Anda akan diminta untuk:
# 1. Pilih langganan Azure
# 2. Pilih lokasi dengan ketersediaan OpenAI (contohnya, eastus, eastus2, westus)
# 3. Tunggu 12-18 minit untuk pelaksanaan

# Pasang kebergantungan Python
pip install -r requirements.txt

# Mula berbual!
python chat.py
```

**Output Dijangka:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Sahkan Pengkerahan

### Langkah 1: Semak Sumber Azure

```bash
# Lihat sumber yang dikerahkan
azd show

# Output yang dijangka menunjukkan:
# - Perkhidmatan OpenAI: (nama sumber)
# - Key Vault: (nama sumber)
# - Pengerahan: gpt-4
# - Lokasi: eastus (atau wilayah yang anda pilih)
```

### Langkah 2: Uji API OpenAI

```bash
# Dapatkan titik akhir OpenAI dan kunci
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Uji panggilan API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Respons Dijangka:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Langkah 3: Sahkan Akses Key Vault

```bash
# Senaraikan rahsia dalam Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Rahsia Dijangka:**
- `openai-api-key`
- `openai-endpoint`

**Kriteria Kejayaan:**
- ✅ Perkhidmatan OpenAI dikerahkan dengan GPT-4
- ✅ Panggilan API mengembalikan hasil yang sah
- ✅ Rahsia disimpan dalam Key Vault
- ✅ Penjejakan penggunaan token berfungsi

## Struktur Projek

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Ciri Aplikasi

### Antara Muka Chat (`chat.py`)

Aplikasi chat ini termasuk:

- **Sejarah Perbualan** - Mengekalkan konteks antara mesej
- **Pengiraan Token** - Menjejaki penggunaan dan menganggarkan kos
- **Pengendalian Ralat** - Pengendalian kadar had dan ralat API dengan baik
- **Anggaran Kos** - Pengiraan kos masa nyata untuk setiap mesej
- **Sokongan Penstriman** - Respons penstriman pilihan

### Perintah

Semasa berbual, anda boleh gunakan:
- `quit` atau `exit` - Tamatkan sesi
- `clear` - Kosongkan sejarah perbualan
- `tokens` - Tunjukkan jumlah penggunaan token
- `cost` - Tunjukkan anggaran kos keseluruhan

### Konfigurasi (`config.py`)

Memuatkan konfigurasi daripada pembolehubah persekitaran:
```python
AZURE_OPENAI_ENDPOINT  # Dari Key Vault
AZURE_OPENAI_API_KEY   # Dari Key Vault
AZURE_OPENAI_MODEL     # Lalai: gpt-4
AZURE_OPENAI_MAX_TOKENS # Lalai: 800
```

## Contoh Penggunaan

### Chat Asas

```bash
python chat.py
```

### Chat dengan Model Tersuai

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat dengan Penstriman

```bash
python chat.py --stream
```

### Contoh Perbualan

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Pengurusan Kos

### Harga Token (GPT-4)

| Model | Input (per 1K token) | Output (per 1K token) |
|-------|----------------------|-----------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Anggaran Kos Bulanan

Berdasarkan corak penggunaan:

| Tahap Penggunaan | Mesej/Hari | Token/Hari | Kos Bulanan |
|-------------------|------------|------------|-------------|
| **Ringan** | 20 mesej | 3,000 token | $3-5 |
| **Sederhana** | 100 mesej | 15,000 token | $15-25 |
| **Berat** | 500 mesej | 75,000 token | $75-125 |

**Kos Infrastruktur Asas:** $1-2/bulan (Key Vault + pengiraan minimum)

### Petua Pengoptimuman Kos

```bash
# 1. Gunakan GPT-3.5-Turbo untuk tugas yang lebih mudah (20x lebih murah)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Kurangkan token maksimum untuk respons yang lebih pendek
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Pantau penggunaan token
python chat.py --show-tokens

# 4. Tetapkan amaran bajet
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Pemantauan

### Lihat Penggunaan Token

```bash
# Dalam Portal Azure:
# Sumber OpenAI → Metrik → Pilih "Transaksi Token"

# Atau melalui Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Lihat Log API

```bash
# Alirkan log diagnostik
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Log pertanyaan
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Penyelesaian Masalah

### Isu: Ralat "Access Denied"

**Gejala:** 403 Forbidden semasa memanggil API

**Penyelesaian:**
```bash
# 1. Sahkan akses OpenAI telah diluluskan
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Periksa kunci API adalah betul
azd env get-value AZURE_OPENAI_API_KEY

# 3. Sahkan format URL titik akhir
azd env get-value AZURE_OPENAI_ENDPOINT
# Sepatutnya: https://[name].openai.azure.com/
```

### Isu: "Rate Limit Exceeded"

**Gejala:** 429 Too Many Requests

**Penyelesaian:**
```bash
# 1. Semak kuota semasa
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Mohon peningkatan kuota (jika perlu)
# Pergi ke Portal Azure → Sumber OpenAI → Kuota → Mohon Peningkatan

# 3. Laksanakan logik cubaan semula (sudah ada dalam chat.py)
# Aplikasi secara automatik mencuba semula dengan backoff eksponen
```

### Isu: "Model Not Found"

**Gejala:** Ralat 404 untuk pengkerahan

**Penyelesaian:**
```bash
# 1. Senaraikan pengedaran yang tersedia
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Sahkan nama model dalam persekitaran
echo $AZURE_OPENAI_MODEL

# 3. Kemas kini kepada nama pengedaran yang betul
export AZURE_OPENAI_MODEL=gpt-4  # atau gpt-35-turbo
```

### Isu: Kelewatan Tinggi

**Gejala:** Masa respons perlahan (>5 saat)

**Penyelesaian:**
```bash
# 1. Periksa kependaman serantau
# Sebarkan ke rantau yang paling dekat dengan pengguna

# 2. Kurangkan max_tokens untuk respons yang lebih cepat
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Gunakan penstriman untuk UX yang lebih baik
python chat.py --stream
```

## Amalan Terbaik Keselamatan

### 1. Lindungi Kunci API

```bash
# Jangan komit kunci ke kawalan sumber
# Gunakan Key Vault (sudah dikonfigurasi)

# Putar kunci secara berkala
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Laksanakan Penapisan Kandungan

```python
# Azure OpenAI termasuk penapisan kandungan terbina dalam
# Konfigurasikan di Portal Azure:
# Sumber OpenAI → Penapis Kandungan → Cipta Penapis Tersuai

# Kategori: Kebencian, Seksual, Keganasan, Mencederakan diri sendiri
# Tahap: Penapisan Rendah, Sederhana, Tinggi
```

### 3. Gunakan Identiti Terurus (Pengeluaran)

```bash
# Untuk pengeluaran pengeluaran, gunakan identiti terurus
# daripada kunci API (memerlukan pengehosan aplikasi di Azure)

# Kemas kini infra/openai.bicep untuk memasukkan:
# identity: { type: 'SystemAssigned' }
```

## Pembangunan

### Jalankan Secara Tempatan

```bash
# Pasang kebergantungan
pip install -r src/requirements.txt

# Tetapkan pembolehubah persekitaran
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Jalankan aplikasi
python src/chat.py
```

### Jalankan Ujian

```bash
# Pasang kebergantungan ujian
pip install pytest pytest-cov

# Jalankan ujian
pytest tests/ -v

# Dengan liputan
pytest tests/ --cov=src --cov-report=html
```

### Kemas Kini Pengkerahan Model

```bash
# Sebarkan versi model yang berbeza
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Pembersihan

```bash
# Padam semua sumber Azure
azd down --force --purge

# Ini akan memadam:
# - Perkhidmatan OpenAI
# - Key Vault (dengan pemadaman lembut 90 hari)
# - Kumpulan Sumber
# - Semua pelaksanaan dan konfigurasi
```

## Langkah Seterusnya

### Kembangkan Contoh Ini

1. **Tambah Antara Muka Web** - Bina frontend React/Vue
   ```bash
   # Tambah perkhidmatan frontend ke azure.yaml
   # Sebarkan ke Azure Static Web Apps
   ```

2. **Laksanakan RAG** - Tambah carian dokumen dengan Azure AI Search
   ```python
   # Integrasikan Azure Cognitive Search
   # Muat naik dokumen dan buat indeks vektor
   ```

3. **Tambah Pemanggilan Fungsi** - Aktifkan penggunaan alat
   ```python
   # Takrifkan fungsi dalam chat.py
   # Benarkan GPT-4 memanggil API luaran
   ```

4. **Sokongan Multi-Model** - Kerahkan pelbagai model
   ```bash
   # Tambah gpt-35-turbo, model embedding
   # Laksanakan logik penghalaan model
   ```

### Contoh Berkaitan

- **[Retail Multi-Agent](../retail-scenario.md)** - Seni bina multi-agent lanjutan
- **[Aplikasi Pangkalan Data](../../../../examples/database-app)** - Tambah storan berterusan
- **[Aplikasi Kontena](../../../../examples/container-app)** - Kerahkan sebagai perkhidmatan kontena

### Sumber Pembelajaran

- 📚 [Kursus AZD Untuk Pemula](../../README.md) - Halaman utama kursus
- 📚 [Dokumentasi Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Dokumentasi rasmi
- 📚 [Rujukan API OpenAI](https://platform.openai.com/docs/api-reference) - Butiran API
- 📚 [AI Bertanggungjawab](https://www.microsoft.com/ai/responsible-ai) - Amalan terbaik

## Sumber Tambahan

### Dokumentasi
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Panduan lengkap
- **[Model GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Keupayaan model
- **[Penapisan Kandungan](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Ciri keselamatan
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Rujukan azd

### Tutorial
- **[Permulaan Cepat OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Pengkerahan pertama
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Membina aplikasi chat
- **[Pemanggilan Fungsi](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Ciri lanjutan

### Alat
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground berasaskan web
- **[Panduan Prompt Engineering](https://platform.openai.com/docs/guides/prompt-engineering)** - Menulis prompt yang lebih baik
- **[Kalkulator Token](https://platform.openai.com/tokenizer)** - Anggarkan penggunaan token

### Komuniti
- **[Discord Azure AI](https://discord.gg/azure)** - Dapatkan bantuan daripada komuniti
- **[Perbincangan GitHub](https://github.com/Azure-Samples/openai/discussions)** - Forum Q&A
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Kemas kini terkini

---

**🎉 Tahniah!** Anda telah mengerahkan Azure OpenAI dan membina aplikasi chat yang berfungsi. Mulakan meneroka keupayaan GPT-4 dan bereksperimen dengan pelbagai prompt dan kes penggunaan.

**Ada soalan?** [Buka isu](https://github.com/microsoft/AZD-for-beginners/issues) atau semak [FAQ](../../resources/faq.md)

**Amaran Kos:** Ingat untuk menjalankan `azd down` apabila selesai menguji untuk mengelakkan caj berterusan (~$50-100/bulan untuk penggunaan aktif).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->