# AI Ajanları ile Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Current Chapter**: Bölüm 2 - AI-İlk Geliştirme
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Advanced**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## Giriş

AI ajanları, çevrelerini algılayabilen, karar verebilen ve belirli hedeflere ulaşmak için eylemler gerçekleştirebilen otonom programlardır. İstemlere yanıt veren basit sohbet botlarının aksine, ajanlar:

- **Araç kullanır** - API çağırma, veritabanı arama, kod çalıştırma
- **Plan yapar ve muhakeme eder** - Karmaşık görevleri adımlara böler
- **Bağlamdan öğrenir** - Bellek tutar ve davranışı uyarlır
- **İşbirliği yapar** - Diğer ajanlarla birlikte çalışır (çok ajanlı sistemler)

Bu kılavuz, Azure Developer CLI (azd) kullanarak AI ajanlarını Azure'a nasıl dağıtacağınızı gösterir.

> **Doğrulama notu (2026-03-25):** Bu kılavuz `azd` `1.23.12` ve `azure.ai.agents` `0.1.18-preview` ile gözden geçirildi. `azd ai` deneyimi hâlâ önizleme odaklıdır, bu nedenle yüklü uzantı bayraklarınız farklıysa uzantı yardımını kontrol edin.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak şunları yapabileceksiniz:
- AI ajanlarının ne olduğunu ve sohbet botlarından nasıl farklılaştığını anlamak
- AZD kullanarak önceden hazırlanmış AI ajan şablonlarını dağıtmak
- Özel ajanlar için Foundry Ajanlarını yapılandırmak
- Temel ajan desenlerini uygulamak (araç kullanımı, RAG, çok ajanlı)
- Dağıtılan ajanları izlemek ve hata ayıklamak

## Öğrenim Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Tek bir komutla Azure'a AI ajan uygulamaları dağıtmak
- Ajan araçlarını ve yeteneklerini yapılandırmak
- Ajanlarla birlikte retrieval-augmented generation (RAG) uygulamak
- Karmaşık iş akışları için çok ajanlı mimariler tasarlamak
- Yaygın ajan dağıtım sorunlarını gidermek

---

## 🤖 Bir Ajanı Sohbet Botundan Farklı Kılan Nedir?

| Özellik | Sohbet Botu | AI Ajanı |
|---------|-------------|----------|
| **Davranış** | İstemlere yanıt verir | Otonom eylemler gerçekleştirir |
| **Araçlar** | Yok | API çağırabilir, arama yapabilir, kod çalıştırabilir |
| **Bellek** | Sadece oturum bazlı | Oturumlar arasında kalıcı bellek |
| **Planlama** | Tek yanıt | Çok adımlı muhakeme |
| **İşbirliği** | Tek bir varlık | Diğer ajanlarla çalışabilir |

### Basit Benzetme

- **Sohbet Botu** = Bilgi masasında soruları cevaplayan yardımsever bir görevli
- **AI Ajanı** = Sizin için arama yapabilen, randevu ayarlayabilen ve görevleri tamamlayabilen kişisel asistan

---

## 🚀 Hızlı Başlangıç: İlk Ajanınızı Dağıtın

### Seçenek 1: Foundry Agents Şablonu (Önerilir)

```bash
# Yapay zeka ajanları şablonunu başlat
azd init --template get-started-with-ai-agents

# Azure'a dağıt
azd up
```

**Ne dağıtılıyor:**
- ✅ Foundry Agents
- ✅ Microsoft Foundry Models (gpt-4.1)
- ✅ Azure AI Search (RAG için)
- ✅ Azure Container Apps (web arayüzü)
- ✅ Application Insights (izleme)

**Süre:** ~15-20 dakika
**Maliyet:** ~$100-150/ay (geliştirme)

### Seçenek 2: Prompty ile OpenAI Ajanı

```bash
# Prompty tabanlı ajan şablonunu başlatın
azd init --template agent-openai-python-prompty

# Azure'a dağıtın
azd up
```

**Ne dağıtılıyor:**
- ✅ Azure Functions (sunucusuz ajan yürütme)
- ✅ Microsoft Foundry Models
- ✅ Prompty yapılandırma dosyaları
- ✅ Örnek ajan uygulaması

**Süre:** ~10-15 dakika
**Maliyet:** ~$50-100/ay (geliştirme)

### Seçenek 3: RAG Sohbet Ajanı

```bash
# RAG sohbet şablonunu başlatın
azd init --template azure-search-openai-demo

# Azure'a dağıtın
azd up
```

**Ne dağıtılıyor:**
- ✅ Microsoft Foundry Models
- ✅ Örnek verilerle Azure AI Search
- ✅ Belge işleme hattı
- ✅ Atıflarla sohbet arayüzü

**Süre:** ~15-25 dakika
**Maliyet:** ~$80-150/ay (geliştirme)

### Seçenek 4: AZD AI Agent Init (Manifest- veya Şablon Tabanlı Önizleme)

Ajan manifest dosyanız varsa, `azd ai` komutunu kullanarak doğrudan Foundry Agent Service projesi oluşturabilirsiniz. Son önizleme sürümleri ayrıca şablon tabanlı başlatma desteği ekledi, bu nedenle tam istem akışı yüklü uzantı sürümünüze bağlı olarak biraz farklı olabilir.

```bash
# AI ajanları uzantısını yükleyin
azd extension install azure.ai.agents

# İsteğe bağlı: yüklü önizleme sürümünü doğrulayın
azd extension show azure.ai.agents

# Ajan manifestinden başlatın
azd ai agent init -m agent-manifest.yaml

# Azure'a dağıtın
azd up

# Dağıtılan ajanı test edin (gecikmeyi ve ilk bayta ulaşma süresini gösterir)
azd ai agent invoke
```

**Ne zaman `azd ai agent init` vs `azd init --template` kullanmalı:**

| Yaklaşım | En İyi Kullanım | Nasıl Çalışır |
|----------|-----------------|---------------|
| `azd init --template` | Çalışan bir örnek uygulamadan başlamak | Kod + altyapı ile tam bir şablon deposunu klonlar |
| `azd ai agent init -m` | Kendi ajan manifestinizden oluşturma | Ajan tanımınızdan proje yapısını iskeletler |

> **İpucu:** Öğrenirken (yukarıdaki Seçenekler 1-3) `azd init --template` kullanın. Kendi manifestlerinizle üretim ajanları oluştururken `azd ai agent init` kullanın.

`azd up` sonrası, aynı uzantı ajan yaşam döngüsünün geri kalanında size rehberlik eder: test için `azd ai agent invoke`, kaliteyi ölçüp geliştirmek için `azd ai agent eval generate` ve `azd ai agent optimize`, ve temizlik için `azd ai agent delete`. Tam referans için bkz. [AZD AI CLI Komutları](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

---

## 🏗️ Ajan Mimari Desenleri

### Desen 1: Araçlara Sahip Tek Ajan

En basit ajan deseni - birden fazla aracı kullanabilen tek bir ajan.

```mermaid
graph TD
    UI[Kullanıcı Arayüzü] --> Agent[Yapay Zeka Ajanı<br/>gpt-4.1]
    Agent --> Search[Arama Aracı]
    Agent --> Database[Veritabanı Aracı]
    Agent --> API[API Aracı]
```

**En uygun kullanım:**
- Müşteri destek botları
- Araştırma asistanları
- Veri analizi ajanları

**AZD Şablonu:** `azure-search-openai-demo`

### Desen 2: RAG Ajanı (Retrieval-Augmented Generation)

Cevap üretmeden önce ilgili belgeleri getiren bir ajan.

```mermaid
graph TD
    Query[Kullanıcı Sorgusu] --> RAG[RAG Ajanı]
    RAG --> Vector[Vektör Arama]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- Belgeler --> LLM
    LLM --> Response[Kaynaklarla Yanıt]
```

**En uygun kullanım:**
- Kurumsal bilgi tabanları
- Belge SSS sistemleri
- Uyumluluk ve hukuk araştırmaları

**AZD Şablonu:** `azure-search-openai-demo`

### Desen 3: Çok Ajanlı Sistem

Karmaşık görevlerde birlikte çalışan birden fazla uzman ajan.

```mermaid
graph TD
    Orchestrator[Orkestratör Ajan] --> Research[Araştırma Ajan<br/>gpt-4.1]
    Orchestrator --> Writer[Yazar Ajan<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[İnceleme Ajan<br/>gpt-4.1]
```

**En uygun kullanım:**
- Karmaşık içerik üretimi
- Çok adımlı iş akışları
- Farklı uzmanlık gerektiren görevler

**Daha Fazla Bilgi:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Ajan Araçlarını Yapılandırma

Ajanlar, araçları kullanabildiklerinde güçlü hale gelir. İşte yaygın araçların nasıl yapılandırılacağı:

### Foundry Agents İçin Araç Yapılandırması

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Özel araçları tanımlayın
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

# Araçlarla ajan oluşturun
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Ortam Yapılandırması

```bash
# Ajanlara özgü ortam değişkenlerini ayarla
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Güncellenmiş yapılandırmayla dağıt
azd deploy
```

---

## 📊 Ajanları İzleme

### Application Insights Entegrasyonu

Tüm AZD ajan şablonları izleme için Application Insights içerir:

```bash
# İzleme panosunu aç
azd monitor --overview

# Canlı günlükleri görüntüle
azd monitor --logs

# Canlı metrikleri görüntüle
azd monitor --live
```

### İzlenecek Ana Metrikler

| Metrik | Açıklama | Hedef |
|--------|----------|-------|
| Yanıt Gecikmesi | Yanıt üretme süresi | < 5 saniye |
| Token Kullanımı | İstek başına token sayısı | Maliyet için izleyin |
| Araç Çağrısı Başarı Oranı | Başarılı araç yürütmeleri yüzdesi | > %95 |
| Hata Oranı | Başarısız ajan istekleri | < %1 |
| Kullanıcı Memnuniyeti | Geri bildirim puanları | > 4.0/5.0 |

### Ajanlar için Özel Günlükleme

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# OpenTelemetry ile Azure Monitor'u yapılandırın
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

> **Not:** Gerekli paketleri yükleyin: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 Maliyet Düşünceleri

### Desene Göre Tahmini Aylık Maliyetler

| Desen | Geliştirme Ortamı | Üretim |
|-------|-------------------|--------|
| Tek Ajan | $50-100 | $200-500 |
| RAG Ajan | $80-150 | $300-800 |
| Çok Ajanlı (2-3 ajan) | $150-300 | $500-1,500 |
| Kurumsal Çok Ajanlı | $300-500 | $1,500-5,000+ |

### Maliyet Optimizasyonu İpuçları

1. **Basit görevler için gpt-4.1-mini kullanın**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **Tekrarlanan sorgular için önbellekleme uygulayın**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Çalışma başına token sınırları belirleyin**
   ```python
   # max_completion_tokens'i ajan çalıştırılırken ayarlayın, oluşturma sırasında değil
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # Yanıt uzunluğunu sınırlayın
   )
   ```

4. **Kullanılmadığında sıfıra ölçekleyin**
   ```bash
   # Container Apps otomatik olarak sıfıra ölçeklenir
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Ajan Sorun Giderme

### Yaygın Sorunlar ve Çözümler

<details>
<summary><strong>❌ Ajan araç çağrılarına yanıt vermiyor</strong></summary>

```bash
# Araçların doğru şekilde kayıtlı olup olmadığını kontrol edin
azd show

# OpenAI dağıtımını doğrulayın
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Ajan günlüklerini kontrol edin
azd monitor --logs
```

**Yaygın nedenler:**
- Araç fonksiyon imza uyuşmazlığı
- Gerekli izinlerin eksik olması
- API uç noktasına erişilemiyor
</details>

<details>
<summary><strong>❌ Ajan yanıtlarında yüksek gecikme</strong></summary>

```bash
# Application Insights'ta darboğazları kontrol edin
azd monitor --live

# Daha hızlı bir model kullanmayı düşünün
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**Optimizasyon ipuçları:**
- Akışlı yanıtları kullanın
- Yanıt önbellekleme uygulayın
- Bağlam pencere boyutunu azaltın
</details>

<details>
<summary><strong>❌ Ajan yanlış veya uydurma bilgi döndürüyor</strong></summary>

```python
# Daha iyi sistem istemleriyle geliştirin
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Yanıtları kaynaklara dayandırmak için alma (retrieval) ekleyin
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # Yanıtları belgelere dayandırın
)
```
</details>

<details>
<summary><strong>❌ Token limiti aşıldı hataları</strong></summary>

```python
# Bağlam penceresi yönetimini uygula
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

## 🎓 Uygulamalı Alıştırmalar

### Alıştırma 1: Temel Bir Ajan Dağıtın (20 dakika)

**Amaç:** AZD kullanarak ilk AI ajanınızı dağıtmak

```bash
# Adım 1: Şablonu başlatın
azd init --template get-started-with-ai-agents

# Adım 2: Azure'a giriş yapın
azd auth login
# Birden fazla kiracıda çalışıyorsanız, --tenant-id <tenant-id> ekleyin

# Adım 3: Dağıtın
azd up

# Adım 4: Ajanı test edin
# Dağıtımdan sonra beklenen çıktı:
#   Dağıtım Tamamlandı!
#   Uç nokta: https://<app-name>.<region>.azurecontainerapps.io
# Çıktıda gösterilen URL'yi açın ve bir soru sormayı deneyin

# Adım 5: İzlemeyi görüntüleyin
azd monitor --overview

# Adım 6: Temizleyin
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Ajan sorulara yanıt veriyor
- [ ] `azd monitor` ile izleme panosuna erişilebiliyor
- [ ] Kaynaklar başarıyla temizlendi

### Alıştırma 2: Özel Bir Araç Ekleyin (30 dakika)

**Amaç:** Bir ajanı özel bir araçla genişletmek

1. Ajan şablonunu dağıtın:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. Ajan kodunuzda yeni bir araç fonksiyonu oluşturun:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API çağrısı hava durumu servisine
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Aracı ajan ile kaydedin:
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
4. Yeniden dağıtın ve test edin:
   ```bash
   azd deploy
   # Sor: "Seattle'da hava nasıl?"
   # Beklenen: Ajan get_weather("Seattle") fonksiyonunu çağırır ve hava bilgisini döndürür
   ```

**Başarı Kriterleri:**
- [ ] Ajan hava durumu ile ilgili sorguları tanıyor
- [ ] Araç doğru şekilde çağrılıyor
- [ ] Yanıt hava durumu bilgisi içeriyor

### Alıştırma 3: Bir RAG Ajanı Oluşturun (45 dakika)

**Amaç:** Belgelerinizden yanıt veren bir ajan oluşturmak

```bash
# Adım 1: RAG şablonunu dağıtın
azd init --template azure-search-openai-demo
azd up

# Adım 2: Belgelerinizi yükleyin
# PDF/TXT dosyalarını data/ dizinine yerleştirin, sonra çalıştırın:
python scripts/prepdocs.py

# Adım 3: Alanına özgü sorularla test edin
# azd up çıktısındaki web uygulama URL'sini açın
# Yüklediğiniz belgelerle ilgili sorular sorun
# Yanıtlar [doc.pdf] gibi kaynak gösterimleri içermelidir
```

**Başarı Kriterleri:**
- [ ] Ajan yüklenen belgelerden yanıt veriyor
- [ ] Yanıtlar atıf içeriyor
- [ ] Kapsam dışı sorularda uydurma yok

---

## 📚 Sonraki Adımlar

Artık AI ajanlarını anladığınıza göre, şu gelişmiş konuları keşfedin:

| Konu | Açıklama | Bağlantı |
|------|---------|----------|
| **Çok Ajanlı Sistemler** | Birden fazla işbirlikçi ajanla sistemler oluşturun | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Koordinasyon Desenleri** | Orkestrasyon ve iletişim desenlerini öğrenin | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Üretim Dağıtımı** | Kurumsal hazır ajan dağıtımı | [Production AI Practices](../chapter-08-production/production-ai-practices.md) |
| **Ajan Değerlendirmesi** | Ajan performansını test ve değerlendirin | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **AI Workshop Lab** | Uygulamalı: AI çözümünüzü AZD-uyumlu hale getirin | [AI Workshop Lab](ai-workshop-lab.md) |

---

## 📖 Ek Kaynaklar

### Resmi Belgeler
- [Microsoft Foundry Agent Service](https://learn.microsoft.com/azure/ai-services/agents/)
- [Microsoft Foundry Agent Service Quickstart](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [Semantic Kernel Agent Framework](https://learn.microsoft.com/semantic-kernel/)

### Ajanlar için AZD Şablonları
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Topluluk Kaynakları
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### Editörünüz için Ajan Becerileri
- [**Microsoft Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure geliştirme için GitHub Copilot, Cursor veya desteklenen herhangi bir ajan için yeniden kullanılabilir AI ajan becerilerini yükleyin. İçerir [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [deployment](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy) ve [diagnostics](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) için beceriler:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navigation**
- **Previous Lesson**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **Next Lesson**: [AI Model Deployment](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->