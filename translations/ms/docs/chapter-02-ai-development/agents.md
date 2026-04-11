# Ejen AI dengan Azure Developer CLI

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Sebelumnya**: [Integrasi Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Seterusnya**: [Penempatan Model AI](ai-model-deployment.md)
- **🚀 Lanjutan**: [Penyelesaian Multi-Ejen](../../examples/retail-scenario.md)

---

## Pengenalan

Ejen AI ialah program autonomi yang boleh memerhati persekitaran mereka, membuat keputusan, dan mengambil tindakan untuk mencapai matlamat tertentu. Berbeza dengan chatbot mudah yang bertindak balas kepada arahan, ejen boleh:

- **Menggunakan alat** - Memanggil API, mencari pangkalan data, melaksanakan kod
- **Merancang dan berfikir** - Memecah tugas kompleks ke langkah-langkah
- **Belajar dari konteks** - Mengekalkan ingatan dan menyesuaikan tingkah laku
- **Bekerjasama** - Bekerja dengan ejen lain (sistem multi-ejen)

Panduan ini menunjukkan cara anda mengendalikan ejen AI ke Azure menggunakan Azure Developer CLI (azd).

> **Nota pengesahan (2026-03-25):** Panduan ini disemak menggunakan `azd` `1.23.12` dan `azure.ai.agents` `0.1.18-preview`. Pengalaman `azd ai` masih dipandu oleh pratonton, jadi semak bantuan sambungan jika penanda dipasang anda berbeza.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Faham apa itu ejen AI dan bagaimana ia berbeza dengan chatbot
- Menempatkan templat ejen AI yang telah dibina menggunakan AZD
- Mengkonfigurasi Foundry Agents untuk ejen tersuai
- Melaksanakan corak asas ejen (penggunaan alat, RAG, multi-ejen)
- Memantau dan memperbaiki ejen yang ditempatkan

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Menempatkan aplikasi ejen AI ke Azure dengan satu arahan
- Mengkonfigurasi alat dan kebolehan ejen
- Melaksanakan penjanaan dipertingkatkan pengambilan (RAG) dengan ejen
- Merancang seni bina multi-ejen untuk aliran kerja kompleks
- Menyelesaikan isu biasa dalam penempatan ejen

---

## 🤖 Apa Perbezaan Ejen dengan Chatbot?

| Ciri | Chatbot | Ejen AI |
|---------|---------|----------|
| **Tingkah Laku** | Bertindak balas kepada arahan | Mengambil tindakan autonomi |
| **Alat** | Tiada | Boleh memanggil API, mencari, melaksanakan kod |
| **Ingatan** | Berdasarkan sesi sahaja | Ingatan berterusan merentasi sesi |
| **Perancangan** | Respon tunggal | Fikiran berbilang langkah |
| **Kerjasama** | Entiti tunggal | Boleh bekerjasama dengan ejen lain |

### Analogi Mudah

- **Chatbot** = Seorang yang membantu menjawab soalan di kaunter maklumat
- **Ejen AI** = Pembantu peribadi yang boleh membuat panggilan, menempah janji temu, dan menyelesaikan tugas untuk anda

---

## 🚀 Mula Cepat: Tempatkan Ejen Pertama Anda

### Pilihan 1: Templat Foundry Agents (Disyorkan)

```bash
# Inisialisasi templat ejen AI
azd init --template get-started-with-ai-agents

# Menyebarkan ke Azure
azd up
```

**Apa yang ditempatkan:**
- ✅ Foundry Agents
- ✅ Model Microsoft Foundry (gpt-4.1)
- ✅ Azure AI Search (untuk RAG)
- ✅ Azure Container Apps (antara muka web)
- ✅ Application Insights (pemantauan)

**Masa:** ~15-20 minit
**Kos:** ~$100-150/bulan (pembangunan)

### Pilihan 2: Ejen OpenAI dengan Prompty

```bash
# Mulakan templat ejen berasaskan Prompty
azd init --template agent-openai-python-prompty

# Hantar ke Azure
azd up
```

**Apa yang ditempatkan:**
- ✅ Azure Functions (pelaksanaan ejen tanpa pelayan)
- ✅ Model Microsoft Foundry
- ✅ Fail konfigurasi Prompty
- ✅ Pelaksanaan contoh ejen

**Masa:** ~10-15 minit
**Kos:** ~$50-100/bulan (pembangunan)

### Pilihan 3: Ejen Sembang RAG

```bash
# Inisialisasi templat chat RAG
azd init --template azure-search-openai-demo

# Lancarkan ke Azure
azd up
```

**Apa yang ditempatkan:**
- ✅ Model Microsoft Foundry
- ✅ Azure AI Search dengan data contoh
- ✅ Saluran pemprosesan dokumen
- ✅ Antara muka sembang dengan sitasi

**Masa:** ~15-25 minit
**Kos:** ~$80-150/bulan (pembangunan)

### Pilihan 4: AZD AI Agent Init (Pratonton Berdasarkan Manifest atau Templat)

Jika anda mempunyai fail manifest ejen, anda boleh menggunakan arahan `azd ai` untuk membina projek Servis Ejen Foundry terus. Pelepasan pratonton terkini juga menambah sokongan inisialisasi berasaskan templat, jadi aliran arahan tepat mungkin berbeza sedikit bergantung pada versi sambungan yang dipasang anda.

```bash
# Pasang sambungan ejen AI
azd extension install azure.ai.agents

# Pilihan: sahkan versi pratonton yang dipasang
azd extension show azure.ai.agents

# Mulakan dari manifest ejen
azd ai agent init -m agent-manifest.yaml

# Lancarkan ke Azure
azd up
```

**Bila gunakan `azd ai agent init` berbanding `azd init --template`:**

| Pendekatan | Sesuai Untuk | Cara Ia Berfungsi |
|----------|----------|------|
| `azd init --template` | Bermula dari aplikasi contoh yang berfungsi | Klon repositori templat penuh dengan kod + infrastruktur |
| `azd ai agent init -m` | Membina dari manifest ejen anda sendiri | Membina struktur projek dari definisi ejen anda |

> **Petua:** Gunakan `azd init --template` semasa belajar (Pilihan 1-3 di atas). Gunakan `azd ai agent init` semasa membina ejen produksi dengan manifest sendiri. Lihat [Perintah AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk rujukan penuh.

---

## 🏗️ Corak Seni Bina Ejen

### Corak 1: Ejen Tunggal dengan Alat

Corak ejen paling mudah - satu ejen yang boleh menggunakan pelbagai alat.

```mermaid
graph TD
    UI[Antara Muka Pengguna] --> Agent[Ejen AI<br/>gpt-4.1]
    Agent --> Search[Alat Carian]
    Agent --> Database[Alat Pangkalan Data]
    Agent --> API[Alat API]
```
**Sesuai untuk:**
- Bot sokongan pelanggan
- Penolong penyelidikan
- Ejen analisis data

**Templat AZD:** `azure-search-openai-demo`

### Corak 2: Ejen RAG (Penjanaan Dipertingkatkan Pengambilan)

Ejen yang mengambil dokumen relevan sebelum menjana jawapan.

```mermaid
graph TD
    Query[Pertanyaan Pengguna] --> RAG[RAG Ejen]
    RAG --> Vector[Carian Vektor]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Dokumen --> LLM
    LLM --> Response[Respons dengan Petikan]
```
**Sesuai untuk:**
- Pangkalan pengetahuan perusahaan
- Sistem Soal Jawab dokumen
- Penyelidikan pematuhan dan undang-undang

**Templat AZD:** `azure-search-openai-demo`

### Corak 3: Sistem Multi-Ejen

Beberapa ejen khusus bekerja bersama pada tugas kompleks.

```mermaid
graph TD
    Orchestrator[Ejen Orchestrator] --> Research[Ejen Penyelidikan<br/>gpt-4.1]
    Orchestrator --> Writer[Ejen Penulis<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[Ejen Penilai<br/>gpt-4.1]
```
**Sesuai untuk:**
- Penjanaan kandungan kompleks
- Aliran kerja berbilang langkah
- Tugas memerlukan kepakaran berbeza

**Ketahui Lebih Lanjut:** [Corak Penyelaras Multi-Ejen](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Mengkonfigurasi Alat Ejen

Ejen menjadi kuat apabila mereka boleh menggunakan alat. Berikut cara mengkonfigurasi alat biasa:

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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Konfigurasi Persekitaran

```bash
# Tetapkan pembolehubah persekitaran khusus ejen
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Lancarkan dengan konfigurasi terkini
azd deploy
```

---

## 📊 Memantau Ejen

### Integrasi Application Insights

Semua templat ejen AZD termasuk Application Insights untuk pemantauan:

```bash
# Buka papan pemuka pemantauan
azd monitor --overview

# Lihat log langsung
azd monitor --logs

# Lihat metrik langsung
azd monitor --live
```

### Metrik Utama untuk Jejak

| Metrik | Penerangan | Sasaran |
|--------|-------------|--------|
| Kelewatan Respons | Masa menjana respons | < 5 saat |
| Penggunaan Token | Token setiap permintaan | Jejak untuk kos |
| Kadar Kejayaan Panggilan Alat | % kejayaan pelaksanaan alat | > 95% |
| Kadar Ralat | Permintaan ejen gagal | < 1% |
| Kepuasan Pengguna | Skor maklum balas | > 4.0/5.0 |

### Logging Tersuai untuk Ejen

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# Konfigurasi Azure Monitor dengan OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **Nota:** Pasang pakej diperlukan: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Pertimbangan Kos

### Anggaran Kos Bulanan Mengikut Corak

| Corak | Persekitaran Dev | Produksi |
|---------|-----------------|------------|
| Ejen Tunggal | $50-100 | $200-500 |
| Ejen RAG | $80-150 | $300-800 |
| Multi-Ejen (2-3 ejen) | $150-300 | $500-1,500 |
| Multi-Ejen Perusahaan | $300-500 | $1,500-5,000+ |

### Petua Pengoptimuman Kos

1. **Gunakan gpt-4.1-mini untuk tugas mudah**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Laksanakan caching untuk pertanyaan berulang**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Tetapkan had token setiap larian**
   ```python
   # Tetapkan max_completion_tokens apabila menjalankan agen, bukan semasa penciptaan
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Hadkan panjang respons
   )
   ```

4. **Skala ke sifar apabila tidak digunakan**
   ```bash
   # Aplikasi Kontena secara automatik berskala ke sifar
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Menyelesaikan Masalah Ejen

### Isu Biasa dan Penyelesaian

<details>
<summary><strong>❌ Ejen tidak bertindak balas kepada panggilan alat</strong></summary>

```bash
# Semak jika alat didaftarkan dengan betul
azd show

# Sahkan penempatan OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Semak log ejen
azd monitor --logs
```

**Punca biasa:**
- Padanan tandatangan fungsi alat tidak betul
- Kebenaran diperlukan hilang
- Titik akhir API tidak boleh diakses
</details>

<details>
<summary><strong>❌ Kelewatan tinggi dalam respons ejen</strong></summary>

```bash
# Semak Application Insights untuk kesesakan
azd monitor --live

# Pertimbangkan menggunakan model yang lebih pantas
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Petua pengoptimuman:**
- Gunakan respons penstriman
- Laksanakan caching respons
- Kurangkan saiz tetingkap konteks
</details>

<details>
<summary><strong>❌ Ejen memulangkan maklumat salah atau halusinasi</strong></summary>

```python
# Tingkatkan dengan arahan sistem yang lebih baik
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Tambah pengambilan untuk pemupukan
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Pautkan jawapan dalam dokumen
)
```
</details>

<details>
<summary><strong>❌ Ralat had token terlampau</strong></summary>

```python
# Laksanakan pengurusan tetingkap konteks
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Latihan Praktikal

### Latihan 1: Tempatkan Ejen Asas (20 minit)

**Matlamat:** Tempatkan ejen AI pertama anda menggunakan AZD

```bash
# Langkah 1: Inisialisasi templat
azd init --template get-started-with-ai-agents

# Langkah 2: Log masuk ke Azure
azd auth login
# Jika anda bekerja merentasi penyewa, tambah --tenant-id <tenant-id>

# Langkah 3: Terbitkan
azd up

# Langkah 4: Uji ejen
# Jangkaan output selepas penerbitan:
#   Penerbitan Selesai!
#   Titik hujung: https://<app-name>.<region>.azurecontainerapps.io
# Buka URL yang dipaparkan dalam output dan cuba tanya soalan

# Langkah 5: Lihat pemantauan
azd monitor --overview

# Langkah 6: Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Ejen bertindak balas kepada soalan
- [ ] Boleh akses papan pemantauan melalui `azd monitor`
- [ ] Sumber dibersihkan dengan jayanya

### Latihan 2: Tambah Alat Tersuai (30 minit)

**Matlamat:** Kembangkan ejen dengan alat tersuai

1. Tempatkan templat ejen:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Cipta fungsi alat baru dalam kod ejen anda:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Panggilan API ke perkhidmatan cuaca
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Daftarkan alat dengan ejen:
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. Tempatkan semula dan uji:
   ```bash
   azd deploy
   # Tanya: "Apakah cuaca di Seattle?"
   # Dijangka: Ejen memanggil get_weather("Seattle") dan mengembalikan maklumat cuaca
   ```

**Kriteria Kejayaan:**
- [ ] Ejen mengenal pasti pertanyaan berkaitan cuaca
- [ ] Alat dipanggil dengan betul
- [ ] Respons mengandungi maklumat cuaca

### Latihan 3: Bina Ejen RAG (45 minit)

**Matlamat:** Cipta ejen yang menjawab soalan dari dokumen anda

```bash
# Langkah 1: Sebarkan templat RAG
azd init --template azure-search-openai-demo
azd up

# Langkah 2: Muat naik dokumen anda
# Letakkan fail PDF/TXT dalam direktori data/, kemudian jalankan:
python scripts/prepdocs.py

# Langkah 3: Uji dengan soalan khusus domain
# Buka URL aplikasi web dari output azd up
# Tanyakan soalan tentang dokumen yang anda muat naik
# Jawapan harus menyertakan rujukan sitasi seperti [doc.pdf]
```

**Kriteria Kejayaan:**
- [ ] Ejen menjawab dari dokumen yang dimuat naik
- [ ] Respons mengandungi sitasi
- [ ] Tiada halusinasi pada soalan di luar skop

---

## 📚 Langkah Seterusnya

Sekarang anda faham ejen AI, terokai topik lanjutan ini:

| Topik | Penerangan | Pautan |
|-------|-------------|------|
| **Sistem Multi-Ejen** | Bina sistem dengan ejen berkolaborasi banyak | [Contoh Multi-Ejen Runcit](../../examples/retail-scenario.md) |
| **Corak Penyelaras** | Belajar corak orkestrasi dan komunikasi | [Corak Penyelaras](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Penempatan Produksi** | Penempatan ejen sedia perusahaan | [Amalan AI Produksi](../chapter-08-production/production-ai-practices.md) |
| **Penilaian Ejen** | Uji dan nilaikan prestasi ejen | [Penyelesaian Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **Makmal Bengkel AI** | Praktikal: Jadikan penyelesaian AI anda sedia AZD | [Makmal Bengkel AI](ai-workshop-lab.md) |

---

## 📖 Sumber Tambahan

### Dokumentasi Rasmi
- [Perkhidmatan Ejen AI Azure](https://learn.microsoft.com/azure/ai-services/agents/)
- [Pantas Mula Perkhidmatan Ejen Foundry Azure AI](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Rangka Kerja Ejen Semantic Kernel](https://learn.microsoft.com/semantic-kernel/)

### Templat AZD untuk Ejen
- [Mulakan dengan Ejen AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Ejen OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Demo Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### Sumber Komuniti
- [Awesome AZD - Templat Ejen](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Discord Azure AI](https://discord.gg/microsoft-azure)
- [Discord Microsoft Foundry](https://discord.gg/nTYy5BXMWG)

### Kemahiran Ejen untuk Editor Anda
- [**Kemahiran Ejen Microsoft Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Pasang kemahiran ejen AI guna semula untuk pembangunan Azure dalam GitHub Copilot, Cursor, atau mana-mana ejen disokong. Termasuk kemahiran untuk [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [penempatan](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), dan [diagnostik](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Integrasi Microsoft Foundry](microsoft-foundry-integration.md)
- **Pelajaran Seterusnya**: [Penempatan Model AI](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab bagi sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->