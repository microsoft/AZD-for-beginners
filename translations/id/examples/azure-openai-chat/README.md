# Aplikasi Chat Azure OpenAI

**Tingkat Pembelajaran:** Menengah ⭐⭐ | **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan

Aplikasi chat Azure OpenAI lengkap yang dideploy menggunakan Azure Developer CLI (azd). Contoh ini menunjukkan deployment GPT-4, akses API yang aman, dan antarmuka chat sederhana.

## 🎯 Apa yang Akan Anda Pelajari

- Deploy Azure OpenAI Service dengan model GPT-4
- Amankan kunci API OpenAI dengan Key Vault
- Bangun antarmuka chat sederhana dengan Python
- Pantau penggunaan token dan biaya
- Terapkan pembatasan kecepatan dan penanganan kesalahan

## 📦 Apa yang Termasuk

✅ **Azure OpenAI Service** - Deployment model GPT-4  
✅ **Aplikasi Chat Python** - Antarmuka chat berbasis command-line sederhana  
✅ **Integrasi Key Vault** - Penyimpanan kunci API yang aman  
✅ **Template ARM** - Infrastruktur lengkap sebagai kode  
✅ **Pemantauan Biaya** - Pelacakan penggunaan token  
✅ **Pembatasan Kecepatan** - Mencegah kehabisan kuota  

## Arsitektur

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

- **Azure Developer CLI (azd)** - [Panduan instalasi](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Langganan Azure** dengan akses OpenAI - [Ajukan akses](https://aka.ms/oai/access)
- **Python 3.9+** - [Unduh Python](https://www.python.org/downloads/)

### Verifikasi Prasyarat

```bash
# Periksa versi azd (membutuhkan 1.5.0 atau lebih tinggi)
azd version

# Verifikasi login Azure
azd auth login

# Periksa versi Python
python --version  # atau python3 --version

# Verifikasi akses OpenAI (periksa di Portal Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Penting:** Azure OpenAI memerlukan persetujuan aplikasi. Jika Anda belum mengajukan, kunjungi [aka.ms/oai/access](https://aka.ms/oai/access). Persetujuan biasanya memakan waktu 1-2 hari kerja.

## ⏱️ Garis Waktu Deployment

| Tahap | Durasi | Apa yang Terjadi |
|-------|--------|------------------|
| Pemeriksaan prasyarat | 2-3 menit | Verifikasi ketersediaan kuota OpenAI |
| Deploy infrastruktur | 8-12 menit | Membuat OpenAI, Key Vault, deployment model |
| Konfigurasi aplikasi | 2-3 menit | Menyiapkan lingkungan dan dependensi |
| **Total** | **12-18 menit** | Siap untuk chat dengan GPT-4 |

**Catatan:** Deployment OpenAI pertama kali mungkin memakan waktu lebih lama karena provisioning model.

## Mulai Cepat

```bash
# Navigasikan ke contoh
cd examples/azure-openai-chat

# Inisialisasi lingkungan
azd env new myopenai

# Terapkan semuanya (infrastruktur + konfigurasi)
azd up
# Anda akan diminta untuk:
# 1. Pilih langganan Azure
# 2. Pilih lokasi dengan ketersediaan OpenAI (misalnya, eastus, eastus2, westus)
# 3. Tunggu 12-18 menit untuk penerapan

# Instal dependensi Python
pip install -r requirements.txt

# Mulai mengobrol!
python chat.py
```

**Output yang Diharapkan:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verifikasi Deployment

### Langkah 1: Periksa Sumber Daya Azure

```bash
# Lihat sumber daya yang diterapkan
azd show

# Output yang diharapkan menunjukkan:
# - Layanan OpenAI: (nama sumber daya)
# - Key Vault: (nama sumber daya)
# - Penerapan: gpt-4
# - Lokasi: eastus (atau wilayah yang Anda pilih)
```

### Langkah 2: Uji API OpenAI

```bash
# Dapatkan endpoint dan kunci OpenAI
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

**Respons yang Diharapkan:**
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

### Langkah 3: Verifikasi Akses Key Vault

```bash
# Daftar rahasia di Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Rahasia yang Diharapkan:**
- `openai-api-key`
- `openai-endpoint`

**Kriteria Keberhasilan:**
- ✅ Layanan OpenAI dideploy dengan GPT-4
- ✅ Panggilan API mengembalikan hasil yang valid
- ✅ Rahasia disimpan di Key Vault
- ✅ Pelacakan penggunaan token berfungsi

## Struktur Proyek

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

## Fitur Aplikasi

### Antarmuka Chat (`chat.py`)

Aplikasi chat mencakup:

- **Riwayat Percakapan** - Mempertahankan konteks antar pesan
- **Penghitungan Token** - Melacak penggunaan dan memperkirakan biaya
- **Penanganan Kesalahan** - Penanganan pembatasan kecepatan dan kesalahan API secara elegan
- **Estimasi Biaya** - Perhitungan biaya real-time per pesan
- **Dukungan Streaming** - Respons streaming opsional

### Perintah

Saat chatting, Anda dapat menggunakan:
- `quit` atau `exit` - Mengakhiri sesi
- `clear` - Menghapus riwayat percakapan
- `tokens` - Menampilkan total penggunaan token
- `cost` - Menampilkan estimasi total biaya

### Konfigurasi (`config.py`)

Memuat konfigurasi dari variabel lingkungan:
```python
AZURE_OPENAI_ENDPOINT  # Dari Key Vault
AZURE_OPENAI_API_KEY   # Dari Key Vault
AZURE_OPENAI_MODEL     # Default: gpt-4
AZURE_OPENAI_MAX_TOKENS # Default: 800
```

## Contoh Penggunaan

### Chat Dasar

```bash
python chat.py
```

### Chat dengan Model Kustom

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat dengan Streaming

```bash
python chat.py --stream
```

### Contoh Percakapan

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

## Manajemen Biaya

### Harga Token (GPT-4)

| Model | Input (per 1K token) | Output (per 1K token) |
|-------|----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Estimasi Biaya Bulanan

Berdasarkan pola penggunaan:

| Tingkat Penggunaan | Pesan/Hari | Token/Hari | Biaya Bulanan |
|---------------------|------------|------------|---------------|
| **Ringan** | 20 pesan | 3,000 token | $3-5 |
| **Sedang** | 100 pesan | 15,000 token | $15-25 |
| **Berat** | 500 pesan | 75,000 token | $75-125 |

**Biaya Infrastruktur Dasar:** $1-2/bulan (Key Vault + komputasi minimal)

### Tips Optimasi Biaya

```bash
# 1. Gunakan GPT-3.5-Turbo untuk tugas yang lebih sederhana (20x lebih murah)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Kurangi jumlah token maksimum untuk respons yang lebih pendek
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Pantau penggunaan token
python chat.py --show-tokens

# 4. Atur peringatan anggaran
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Pemantauan

### Lihat Penggunaan Token

```bash
# Di Portal Azure:
# Sumber Daya OpenAI → Metrik → Pilih "Token Transaction"

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

# Log kueri
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Pemecahan Masalah

### Masalah: Kesalahan "Access Denied"

**Gejala:** 403 Forbidden saat memanggil API

**Solusi:**
```bash
# 1. Verifikasi akses OpenAI disetujui
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Periksa apakah kunci API benar
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifikasi format URL endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Harus: https://[name].openai.azure.com/
```

### Masalah: "Rate Limit Exceeded"

**Gejala:** 429 Too Many Requests

**Solusi:**
```bash
# 1. Periksa kuota saat ini
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Minta peningkatan kuota (jika diperlukan)
# Buka Azure Portal → Sumber Daya OpenAI → Kuota → Minta Peningkatan

# 3. Terapkan logika percobaan ulang (sudah ada di chat.py)
# Aplikasi secara otomatis mencoba ulang dengan backoff eksponensial
```

### Masalah: "Model Not Found"

**Gejala:** Kesalahan 404 untuk deployment

**Solusi:**
```bash
# 1. Daftar penyebaran yang tersedia
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifikasi nama model di lingkungan
echo $AZURE_OPENAI_MODEL

# 3. Perbarui ke nama penyebaran yang benar
export AZURE_OPENAI_MODEL=gpt-4  # atau gpt-35-turbo
```

### Masalah: Latensi Tinggi

**Gejala:** Waktu respons lambat (>5 detik)

**Solusi:**
```bash
# 1. Periksa latensi regional
# Sebarkan ke wilayah terdekat dengan pengguna

# 2. Kurangi max_tokens untuk respons yang lebih cepat
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Gunakan streaming untuk UX yang lebih baik
python chat.py --stream
```

## Praktik Keamanan Terbaik

### 1. Lindungi Kunci API

```bash
# Jangan pernah menyimpan kunci di kontrol sumber
# Gunakan Key Vault (sudah dikonfigurasi)

# Putar kunci secara teratur
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Terapkan Penyaringan Konten

```python
# Azure OpenAI mencakup penyaringan konten bawaan
# Konfigurasikan di Azure Portal:
# Sumber Daya OpenAI → Penyaring Konten → Buat Penyaring Kustom

# Kategori: Kebencian, Seksual, Kekerasan, Melukai Diri Sendiri
# Tingkat: Penyaringan Rendah, Sedang, Tinggi
```

### 3. Gunakan Managed Identity (Produksi)

```bash
# Untuk penerapan produksi, gunakan identitas terkelola
# daripada kunci API (memerlukan hosting aplikasi di Azure)

# Perbarui infra/openai.bicep untuk menyertakan:
# identity: { type: 'SystemAssigned' }
```

## Pengembangan

### Jalankan Secara Lokal

```bash
# Pasang dependensi
pip install -r src/requirements.txt

# Atur variabel lingkungan
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Jalankan aplikasi
python src/chat.py
```

### Jalankan Tes

```bash
# Instal dependensi pengujian
pip install pytest pytest-cov

# Jalankan pengujian
pytest tests/ -v

# Dengan cakupan
pytest tests/ --cov=src --cov-report=html
```

### Perbarui Deployment Model

```bash
# Terapkan versi model yang berbeda
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

## Bersihkan

```bash
# Hapus semua sumber daya Azure
azd down --force --purge

# Ini menghapus:
# - Layanan OpenAI
# - Key Vault (dengan penghapusan lunak 90 hari)
# - Grup Sumber Daya
# - Semua penerapan dan konfigurasi
```

## Langkah Selanjutnya

### Kembangkan Contoh Ini

1. **Tambahkan Antarmuka Web** - Bangun frontend React/Vue
   ```bash
   # Tambahkan layanan frontend ke azure.yaml
   # Terapkan ke Azure Static Web Apps
   ```

2. **Terapkan RAG** - Tambahkan pencarian dokumen dengan Azure AI Search
   ```python
   # Integrasikan Azure Cognitive Search
   # Unggah dokumen dan buat indeks vektor
   ```

3. **Tambahkan Function Calling** - Aktifkan penggunaan alat
   ```python
   # Definisikan fungsi dalam chat.py
   # Biarkan GPT-4 memanggil API eksternal
   ```

4. **Dukungan Multi-Model** - Deploy beberapa model
   ```bash
   # Tambahkan gpt-35-turbo, model embedding
   # Implementasikan logika perutean model
   ```

### Contoh Terkait

- **[Retail Multi-Agent](../retail-scenario.md)** - Arsitektur multi-agent tingkat lanjut
- **[Database App](../../../../examples/database-app)** - Tambahkan penyimpanan persisten
- **[Container Apps](../../../../examples/container-app)** - Deploy sebagai layanan terkontainerisasi

### Sumber Belajar

- 📚 [Kursus AZD untuk Pemula](../../README.md) - Halaman utama kursus
- 📚 [Dokumentasi Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Dokumentasi resmi
- 📚 [Referensi API OpenAI](https://platform.openai.com/docs/api-reference) - Detail API
- 📚 [AI yang Bertanggung Jawab](https://www.microsoft.com/ai/responsible-ai) - Praktik terbaik

## Sumber Daya Tambahan

### Dokumentasi
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Panduan lengkap
- **[Model GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Kemampuan model
- **[Penyaringan Konten](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Fitur keamanan
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referensi azd

### Tutorial
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Deployment pertama
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Membangun aplikasi chat
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Fitur lanjutan

### Alat
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground berbasis web
- **[Panduan Prompt Engineering](https://platform.openai.com/docs/guides/prompt-engineering)** - Menulis prompt yang lebih baik
- **[Kalkulator Token](https://platform.openai.com/tokenizer)** - Perkirakan penggunaan token

### Komunitas
- **[Azure AI Discord](https://discord.gg/azure)** - Dapatkan bantuan dari komunitas
- **[Diskusi GitHub](https://github.com/Azure-Samples/openai/discussions)** - Forum tanya jawab
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Pembaruan terbaru

---

**🎉 Sukses!** Anda telah mendeply Azure OpenAI dan membangun aplikasi chat yang berfungsi. Mulailah menjelajahi kemampuan GPT-4 dan bereksperimen dengan berbagai prompt dan kasus penggunaan.

**Ada Pertanyaan?** [Buka masalah](https://github.com/microsoft/AZD-for-beginners/issues) atau periksa [FAQ](../../resources/faq.md)

**Peringatan Biaya:** Ingat untuk menjalankan `azd down` setelah selesai menguji untuk menghindari biaya berkelanjutan (~$50-100/bulan untuk penggunaan aktif).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->