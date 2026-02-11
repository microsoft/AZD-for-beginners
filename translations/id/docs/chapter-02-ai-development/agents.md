# Agen AI dengan Azure Developer CLI

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berorientasi AI
- **⬅️ Sebelumnya**: [Penerapan Model AI](ai-model-deployment.md)
- **➡️ Berikutnya**: [Praktik AI Produksi](production-ai-practices.md)
- **🚀 Lanjutan**: [Solusi Multi-Agen](../../examples/retail-scenario.md)

---

## Pendahuluan

Agen AI adalah program otonom yang dapat memahami lingkungannya, membuat keputusan, dan mengambil tindakan untuk mencapai tujuan tertentu. Berbeda dengan chatbot sederhana yang merespons prompt, agen dapat:

- **Menggunakan alat** - Memanggil API, mencari basis data, mengeksekusi kode
- **Merencanakan dan bernalar** - Memecah tugas kompleks menjadi langkah-langkah
- **Belajar dari konteks** - Mempertahankan memori dan menyesuaikan perilaku
- **Berkolaborasi** - Bekerja dengan agen lain (sistem multi-agen)

Panduan ini menunjukkan cara mendeploy agen AI ke Azure menggunakan Azure Developer CLI (azd).

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Memahami apa itu agen AI dan bagaimana bedanya dengan chatbot
- Mendeploy template agen pra-bangun menggunakan AZD
- Mengonfigurasi Foundry Agents untuk agen kustom
- Mengimplementasikan pola agen dasar (penggunaan alat, RAG, multi-agen)
- Memantau dan men-debug agen yang sudah dideploy

## Hasil Pembelajaran

Setelah selesai, Anda akan dapat:
- Mendeploy aplikasi agen AI ke Azure dengan satu perintah
- Mengonfigurasi alat dan kemampuan agen
- Mengimplementasikan retrieval-augmented generation (RAG) dengan agen
- Merancang arsitektur multi-agen untuk alur kerja kompleks
- Memecahkan masalah umum saat mendeploy agen

---

## 🤖 Apa yang Membuat Agen Berbeda dari Chatbot?

| Fitur | Chatbot | Agen AI |
|---------|---------|----------|
| **Perilaku** | Merespons prompt | Mengambil tindakan secara otonom |
| **Alat** | Tidak ada | Dapat memanggil API, mencari, mengeksekusi kode |
| **Memori** | Hanya berbasis sesi | Memori persisten antar sesi |
| **Perencanaan** | Satu respons | Penalaran multi-langkah |
| **Kolaborasi** | Entitas tunggal | Dapat bekerja dengan agen lain |

### Analogi Sederhana

- **Chatbot** = Seseorang yang membantu menjawab pertanyaan di meja informasi
- **Agen AI** = Asisten pribadi yang dapat melakukan panggilan, memesan janji, dan menyelesaikan tugas untuk Anda

---

## 🚀 Mulai Cepat: Mendeploy Agen Pertama Anda

### Opsi 1: Template Foundry Agents (Direkomendasikan)

```bash
# Inisialisasi templat agen AI
azd init --template get-started-with-ai-agents

# Terapkan ke Azure
azd up
```

**Apa yang dideploy:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (untuk RAG)
- ✅ Azure Container Apps (antarmuka web)
- ✅ Application Insights (pemantauan)

**Waktu:** ~15-20 menit  
**Biaya:** ~ $100-150/bulan (pengembangan)

### Opsi 2: OpenAI Agent dengan Prompty

```bash
# Inisialisasi template agen berbasis Prompty
azd init --template agent-openai-python-prompty

# Terapkan ke Azure
azd up
```

**Apa yang dideploy:**
- ✅ Azure Functions (eksekusi agen serverless)
- ✅ Azure OpenAI
- ✅ Berkas konfigurasi Prompty
- ✅ Contoh implementasi agen

**Waktu:** ~10-15 menit  
**Biaya:** ~ $50-100/bulan (pengembangan)

### Opsi 3: Agen Chat RAG

```bash
# Inisialisasi template chat RAG
azd init --template azure-search-openai-demo

# Terapkan ke Azure
azd up
```

**Apa yang dideploy:**
- ✅ Azure OpenAI
- ✅ Azure AI Search dengan data contoh
- ✅ Pipeline pemrosesan dokumen
- ✅ Antarmuka chat dengan kutipan

**Waktu:** ~15-25 menit  
**Biaya:** ~ $80-150/bulan (pengembangan)

---

## 🏗️ Pola Arsitektur Agen

### Pola 1: Agen Tunggal dengan Alat

Pola agen paling sederhana - satu agen yang dapat menggunakan beberapa alat.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Terbaik untuk:**
- Bot dukungan pelanggan
- Asisten riset
- Agen analisis data

**Template AZD:** `azure-search-openai-demo`

### Pola 2: Agen RAG (Retrieval-Augmented Generation)

Agen yang mengambil dokumen relevan sebelum menghasilkan respons.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Terbaik untuk:**
- Basis pengetahuan perusahaan
- Sistem Tanya Jawab dokumen
- Kepatuhan dan riset hukum

**Template AZD:** `azure-search-openai-demo`

### Pola 3: Sistem Multi-Agen

Beberapa agen khusus bekerja sama pada tugas kompleks.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Terbaik untuk:**
- Pembuatan konten kompleks
- Alur kerja multi-langkah
- Tugas yang memerlukan keahlian berbeda

**Pelajari Lebih Lanjut:** [Pola Koordinasi Multi-Agen](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Mengonfigurasi Alat Agen

Agen menjadi kuat ketika mereka dapat menggunakan alat. Berikut cara mengonfigurasi alat umum:

### Konfigurasi Alat di Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definisikan alat-alat kustom
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Buat agen dengan alat-alat
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurasi Lingkungan

```bash
# Siapkan variabel lingkungan khusus agen
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Terapkan dengan konfigurasi yang diperbarui
azd deploy
```

---

## 📊 Memantau Agen

### Integrasi Application Insights

Semua template agen AZD menyertakan Application Insights untuk pemantauan:

```bash
# Buka dasbor pemantauan
azd monitor --overview

# Lihat log langsung
azd monitor --logs

# Lihat metrik langsung
azd monitor --live
```

### Metrik Kunci untuk Dipantau

| Metrik | Deskripsi | Target |
|--------|-------------|--------|
| Latensi Respons | Waktu untuk menghasilkan respons | < 5 detik |
| Penggunaan Token | Token per permintaan | Pantau untuk biaya |
| Tingkat Keberhasilan Panggilan Alat | % eksekusi alat yang berhasil | > 95% |
| Tingkat Error | Permintaan agen yang gagal | < 1% |
| Kepuasan Pengguna | Skor umpan balik | > 4.0/5.0 |

### Logging Kustom untuk Agen

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Pertimbangan Biaya

### Estimasi Biaya Bulanan per Pola

| Pola | Lingkungan Pengembangan | Produksi |
|---------|-----------------|------------|
| Agen Tunggal | $50-100 | $200-500 |
| Agen RAG | $80-150 | $300-800 |
| Multi-Agen (2-3 agen) | $150-300 | $500-1,500 |
| Multi-Agen Perusahaan | $300-500 | $1,500-5,000+ |

### Tips Optimisasi Biaya

1. **Gunakan GPT-4o-mini untuk tugas sederhana**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Terapkan caching untuk kueri berulang**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Tetapkan batas token**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Batasi panjang respons
   )
   ```

4. **Skala ke nol saat tidak digunakan**
   ```bash
   # Container Apps secara otomatis diskalakan ke nol
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Pemecahan Masalah Agen

### Masalah Umum dan Solusi

<details>
<summary><strong>❌ Agen tidak merespons panggilan alat</strong></summary>

```bash
# Periksa apakah alat terdaftar dengan benar
azd show

# Verifikasi penyebaran OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Periksa log agen
azd monitor --logs
```

**Penyebab umum:**
- Ketidakcocokan tanda tangan fungsi alat
- Izin yang diperlukan hilang
- Endpoint API tidak dapat diakses
</details>

<details>
<summary><strong>❌ Latensi tinggi pada respons agen</strong></summary>

```bash
# Periksa Application Insights untuk menemukan hambatan
azd monitor --live

# Pertimbangkan menggunakan model yang lebih cepat
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Tips optimisasi:**
- Gunakan respons streaming
- Terapkan caching respons
- Kurangi ukuran jendela konteks
</details>

<details>
<summary><strong>❌ Agen mengembalikan informasi yang salah atau berhalusinasi</strong></summary>

```python
# Tingkatkan dengan prompt sistem yang lebih baik
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Tambahkan pengambilan informasi untuk mendasari
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Dasarkan respons pada dokumen
)
```
</details>

<details>
<summary><strong>❌ Kesalahan batas token terlampaui</strong></summary>

```python
# Implementasikan manajemen jendela konteks
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Perkiraan kasar
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Latihan Praktis

### Latihan 1: Mendeploy Agen Dasar (20 menit)

**Tujuan:** Mendeploy agen AI pertama Anda menggunakan AZD

```bash
# Langkah 1: Inisialisasi template
azd init --template get-started-with-ai-agents

# Langkah 2: Masuk ke Azure
azd auth login

# Langkah 3: Terapkan
azd up

# Langkah 4: Uji agen
# Buka URL yang ditampilkan di keluaran

# Langkah 5: Bersihkan
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Agen merespons pertanyaan
- [ ] Dapat mengakses dasbor pemantauan
- [ ] Sumber daya dibersihkan dengan sukses

### Latihan 2: Tambahkan Alat Kustom (30 menit)

**Tujuan:** Memperluas agen dengan alat kustom

1. Mendeploy template agen
2. Buat fungsi alat baru:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Panggilan API ke layanan cuaca
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Daftarkan alat ke agen
4. Uji bahwa agen menggunakan alat baru

**Kriteria Keberhasilan:**
- [ ] Agen mengenali kueri terkait cuaca
- [ ] Alat dipanggil dengan benar
- [ ] Respons menyertakan informasi cuaca

### Latihan 3: Bangun Agen RAG (45 menit)

**Tujuan:** Buat agen yang menjawab pertanyaan dari dokumen Anda

```bash
# Terapkan template RAG
azd init --template azure-search-openai-demo
azd up

# Unggah dokumen Anda
# (Ikuti panduan pemasukan data template)

# Uji dengan pertanyaan spesifik domain
```

**Kriteria Keberhasilan:**
- [ ] Agen menjawab dari dokumen yang diunggah
- [ ] Respons menyertakan kutipan
- [ ] Tidak ada halusinasi pada pertanyaan di luar cakupan

---

## 📚 Langkah Selanjutnya

Sekarang setelah Anda memahami agen AI, jelajahi topik lanjutan ini:

| Topik | Deskripsi | Tautan |
|-------|-------------|------|
| **Sistem Multi-Agen** | Bangun sistem dengan beberapa agen yang berkolaborasi | [Contoh Multi-Agen Ritel](../../examples/retail-scenario.md) |
| **Pola Koordinasi** | Pelajari pola orkestrasi dan komunikasi | [Pola Koordinasi](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Penerapan Produksi** | Penerapan agen siap perusahaan | [Praktik AI Produksi](production-ai-practices.md) |
| **Evaluasi Agen** | Uji dan evaluasi performa agen | [Pemecahan Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Sumber Daya Tambahan

### Dokumentasi Resmi
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Template AZD untuk Agen
- [Mulai dengan Agen AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Sumber Daya Komunitas
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penerapan Model AI](ai-model-deployment.md)
- **Pelajaran Berikutnya**: [Praktik AI Produksi](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai tingkat akurasi, harap diingat bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasanya yang asli harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->