# Ejen AI dengan Azure Developer CLI

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Sebelumnya**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Seterusnya**: [Production AI Practices](production-ai-practices.md)
- **🚀 Lanjutan**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Pengenalan

Ejen AI adalah program autonomi yang boleh melihat persekitaran mereka, membuat keputusan, dan mengambil tindakan untuk mencapai matlamat tertentu. Berbeza dengan chatbot ringkas yang memberi respons kepada arahan, ejen boleh:

- **Menggunakan alat** - Memanggil API, mencari dalam pangkalan data, menjalankan kod
- **Merancang dan berfikir** - Memecahkan tugasan kompleks kepada langkah-langkah
- **Belajar dari konteks** - Mengekalkan memori dan menyesuaikan tingkah laku
- **Berkerjasama** - Bekerja dengan ejen lain (sistem berbilang ejen)

Panduan ini menunjukkan cara untuk melancarkan ejen AI ke Azure menggunakan Azure Developer CLI (azd).

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Memahami apa itu ejen AI dan bagaimana ia berbeza daripada chatbot
- Melancarkan templat ejen pra-bina menggunakan AZD
- Mengkonfigurasi Foundry Agents untuk ejen tersuai
- Melaksanakan corak ejen asas (penggunaan alat, RAG, multi-ejen)
- Memantau dan menyahpepijat ejen yang dilancarkan

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Melancarkan aplikasi ejen AI ke Azure dengan satu arahan
- Mengkonfigurasi alat dan kebolehan ejen
- Melaksanakan retrieval-augmented generation (RAG) dengan ejen
- Mereka bentuk seni bina multi-ejen untuk aliran kerja kompleks
- Menyelesaikan isu biasa semasa pelancaran ejen

---

## 🤖 Apa yang Membezakan Ejen daripada Chatbot?

| Ciri | Chatbot | Ejen AI |
|---------|---------|----------|
| **Tingkah laku** | Memberi respons kepada arahan | Mengambil tindakan secara autonomi |
| **Alat** | Tiada | Boleh memanggil API, mencari, menjalankan kod |
| **Memori** | Hanya berasaskan sesi | Memori berterusan merentas sesi |
| **Perancangan** | Respons tunggal | Penalaran berbilang langkah |
| **Kerjasama** | Entiti tunggal | Boleh bekerjasama dengan ejen lain |

### Analogi Ringkas

- **Chatbot** = Seorang yang membantu menjawab soalan di kaunter maklumat
- **Ejen AI** = Pembantu peribadi yang boleh membuat panggilan, menempah temu janji, dan menyelesaikan tugasan untuk anda

---

## 🚀 Permulaan Pantas: Lancarkan Ejen Pertama Anda

### Pilihan 1: Templat Ejen Foundry (Disyorkan)

```bash
# Inisialisasikan templat ejen AI
azd init --template get-started-with-ai-agents

# Sebarkan ke Azure
azd up
```

**Yang akan dilancarkan:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (untuk RAG)
- ✅ Azure Container Apps (antara muka web)
- ✅ Application Insights (pemantauan)

**Masa:** ~15-20 minit
**Kos:** ~$100-150/bulan (pembangunan)

### Pilihan 2: Ejen OpenAI dengan Prompty

```bash
# Inisialisasikan templat ejen berasaskan Prompty
azd init --template agent-openai-python-prompty

# Sebarkan ke Azure
azd up
```

**Yang akan dilancarkan:**
- ✅ Azure Functions (pelaksanaan ejen tanpa pelayan)
- ✅ Azure OpenAI
- ✅ Fail konfigurasi Prompty
- ✅ Pelaksanaan ejen contoh

**Masa:** ~10-15 minit
**Kos:** ~$50-100/bulan (pembangunan)

### Pilihan 3: Ejen Sembang RAG

```bash
# Inisialisasikan templat sembang RAG
azd init --template azure-search-openai-demo

# Sebarkan ke Azure
azd up
```

**Yang akan dilancarkan:**
- ✅ Azure OpenAI
- ✅ Azure AI Search dengan data contoh
- ✅ Rantaian pemprosesan dokumen
- ✅ Antara muka sembang dengan petikan

**Masa:** ~15-25 minit
**Kos:** ~$80-150/bulan (pembangunan)

---

## 🏗️ Corak Seni Bina Ejen

### Corak 1: Ejen Tunggal dengan Alat

Corak ejen paling ringkas - satu ejen yang boleh menggunakan pelbagai alat.

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
- Bot sokongan pelanggan
- Pembantu penyelidikan
- Ejen analisis data

**Templat AZD:** `azure-search-openai-demo`

### Corak 2: Ejen RAG (Retrieval-Augmented Generation)

Ejen yang mengambil dokumen yang berkaitan sebelum menjana respons.

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
- Pangkalan pengetahuan perusahaan
- Sistem Soalan & Jawapan dokumen
- Penyelidikan pematuhan dan undang-undang

**Templat AZD:** `azure-search-openai-demo`

### Corak 3: Sistem Multi-Ejen

Berbilang ejen khusus yang bekerjasama pada tugasan kompleks.

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
- Penjanaan kandungan kompleks
- Aliran kerja berbilang langkah
- Tugasan yang memerlukan kepakaran berbeza

**Ketahui Lebih Lanjut:** [Corak Penyelarasan Multi-Ejen](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Mengkonfigurasi Alat Ejen

Ejen menjadi berkuasa apabila mereka boleh menggunakan alat. Ini cara untuk mengkonfigurasi alat biasa:

### Konfigurasi Alat dalam Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Definisikan alat tersuai
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

# Cipta ejen dengan alat-alat
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurasi Persekitaran

```bash
# Sediakan pembolehubah persekitaran khusus untuk ejen
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Sebarkan dengan konfigurasi yang dikemas kini
azd deploy
```

---

## 📊 Memantau Ejen

### Integrasi Application Insights

Semua templat ejen AZD termasuk Application Insights untuk pemantauan:

```bash
# Buka papan pemantauan
azd monitor --overview

# Lihat log langsung
azd monitor --logs

# Lihat metrik langsung
azd monitor --live
```

### Metrik Utama untuk Jejak

| Metrik | Perihalan | Sasaran |
|--------|-------------|--------|
| Kelewatan Respons | Masa untuk menjana respons | < 5 saat |
| Penggunaan Token | Token setiap permintaan | Pantau untuk kos |
| Kadar Kejayaan Panggilan Alat | % pelaksanaan alat berjaya | > 95% |
| Kadar Ralat | Permintaan ejen gagal | < 1% |
| Kepuasan Pengguna | Skor maklum balas | > 4.0/5.0 |

### Pelogan Tersuai untuk Ejen

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

## 💰 Pertimbangan Kos

### Anggaran Kos Bulanan mengikut Corak

| Corak | Persekitaran Pembangunan | Pengeluaran |
|---------|-----------------|------------|
| Ejen Tunggal | $50-100 | $200-500 |
| Ejen RAG | $80-150 | $300-800 |
| Multi-Ejen (2-3 ejen) | $150-300 | $500-1,500 |
| Multi-Ejen Perusahaan | $300-500 | $1,500-5,000+ |

### Petua Pengoptimuman Kos

1. **Gunakan GPT-4o-mini untuk tugasan ringkas**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Laksanakan caching untuk pertanyaan berulang**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Tetapkan had token**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Hadkan panjang respons
   )
   ```

4. **Skalakan ke sifar apabila tidak digunakan**
   ```bash
   # Aplikasi Kontena secara automatik diskalakan ke sifar
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Menyelesaikan Masalah Ejen

### Isu dan Penyelesaian Biasa

<details>
<summary><strong>❌ Ejen tidak memberi respons kepada panggilan alat</strong></summary>

```bash
# Periksa sama ada alat telah didaftarkan dengan betul
azd show

# Sahkan penyebaran OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Periksa log ejen
azd monitor --logs
```

**Punca biasa:**
- Ketidakpadanan tandatangan fungsi alat
- Kebenaran diperlukan hilang
- Titik akhir API tidak dapat diakses
</details>

<details>
<summary><strong>❌ Kelewatan tinggi dalam respons ejen</strong></summary>

```bash
# Periksa Application Insights untuk mengenal pasti kesesakan
azd monitor --live

# Pertimbangkan menggunakan model yang lebih pantas
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Petua pengoptimuman:**
- Gunakan respons penstriman
- Laksanakan caching respons
- Kurangkan saiz tetingkap konteks
</details>

<details>
<summary><strong>❌ Ejen memulangkan maklumat yang tidak betul atau halusinasi</strong></summary>

```python
# Tingkatkan dengan arahan sistem yang lebih baik
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Tambah pengambilan untuk membumikan
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Asaskan respons pada dokumen
)
```
</details>

<details>
<summary><strong>❌ Ralat had token terlampau</strong></summary>

```python
# Laksanakan pengurusan tetingkap konteks
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Anggaran kasar
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Latihan Amali

### Latihan 1: Lancarkan Ejen Asas (20 minit)

**Matlamat:** Lancarkan ejen AI pertama anda menggunakan AZD

```bash
# Langkah 1: Inisialisasikan templat
azd init --template get-started-with-ai-agents

# Langkah 2: Log masuk ke Azure
azd auth login

# Langkah 3: Sebarkan
azd up

# Langkah 4: Uji ejen
# Buka URL yang ditunjukkan dalam output

# Langkah 5: Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Ejen memberi respons kepada soalan
- [ ] Boleh mengakses papan pemuka pemantauan
- [ ] Sumber dibersihkan dengan jayanya

### Latihan 2: Tambah Alat Tersuai (30 minit)

**Matlamat:** Kembangkan ejen dengan alat tersuai

1. Lancarkan templat ejen
2. Buat fungsi alat baru:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Panggilan API ke perkhidmatan cuaca
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Daftarkan alat dengan ejen
4. Uji bahawa ejen menggunakan alat baru

**Kriteria Kejayaan:**
- [ ] Ejen mengenali pertanyaan berkaitan cuaca
- [ ] Alat dipanggil dengan betul
- [ ] Respons termasuk maklumat cuaca

### Latihan 3: Bina Ejen RAG (45 minit)

**Matlamat:** Cipta ejen yang menjawab soalan dari dokumen anda

```bash
# Laksanakan templat RAG
azd init --template azure-search-openai-demo
azd up

# Muat naik dokumen anda
# (Ikuti panduan pengambilan data templat)

# Uji dengan soalan khusus domain
```

**Kriteria Kejayaan:**
- [ ] Ejen menjawab dari dokumen yang dimuat naik
- [ ] Respons termasuk petikan
- [ ] Tiada halusinasi pada soalan di luar skop

---

## 📚 Langkah Seterusnya

Kini anda memahami ejen AI, terokai topik lanjutan berikut:

| Topik | Perihalan | Pautan |
|-------|-------------|------|
| **Sistem Multi-Ejen** | Bina sistem dengan pelbagai ejen yang bekerjasama | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Corak Penyelarasan** | Pelajari orkestrasi dan corak komunikasi | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Pengeluaran** | Pelaksanaan ejen bersedia perusahaan | [Production AI Practices](production-ai-practices.md) |
| **Penilaian Ejen** | Uji dan nilai prestasi ejen | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Sumber Tambahan

### Dokumentasi Rasmi
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Templat AZD untuk Ejen
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Sumber Komuniti
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [AI Model Deployment](ai-model-deployment.md)
- **Pelajaran Seterusnya**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan penterjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidakakuratan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, disyorkan menggunakan penterjemah profesional manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->