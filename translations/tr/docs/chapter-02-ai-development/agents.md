# Azure Developer CLI ile AI Ajanları

**Bölüm Gezintisi:**
- **📚 Ders Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - AI-Öncelikli Geliştirme
- **⬅️ Önceki**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Sonraki**: [Production AI Practices](production-ai-practices.md)
- **🚀 Gelişmiş**: [Çok Ajanlı Çözümler](../../examples/retail-scenario.md)

---

## Giriş

AI ajanları, çevrelerini algılayabilen, karar verebilen ve belirli hedeflere ulaşmak için eylemler gerçekleştirebilen özerk programlardır. İstemlere yanıt veren basit sohbet botlarının aksine, ajanlar şunları yapabilir:

- **Araçları kullanma** - API çağırma, veritabanı arama, kod yürütme
- **Planlama ve akıl yürütme** - Karmaşık görevleri adımlara ayırma
- **Bağlamdan öğrenme** - Hafızayı koruma ve davranışı uyarlama
- **İş birliği yapma** - Diğer ajanlarla çalışma (çok ajanlı sistemler)

Bu kılavuz, Azure Developer CLI (azd) kullanarak AI ajanlarını Azure'a nasıl dağıtacağınızı gösterir.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak:
- AI ajanlarının ne olduğunu ve sohbet botlarından nasıl farklılaştığını anlayacaksınız
- AZD kullanarak önceden oluşturulmuş AI ajan şablonlarını dağıtabileceksiniz
- Özel ajanlar için Foundry Agents yapılandırmasını yapabileceksiniz
- Temel ajan desenlerini (araç kullanımı, RAG, çok ajanlı) uygulayabileceksiniz
- Dağıtılan ajanları izleyip hata ayıklayabileceksiniz

## Öğrenme Çıktıları

Tamamladıktan sonra şunları yapabileceksiniz:
- Tek bir komutla AI ajan uygulamalarını Azure'a dağıtmak
- Ajan araçlarını ve yeteneklerini yapılandırmak
- Ajanlarla retrieval-augmented generation (RAG) uygulamak
- Karmaşık iş akışları için çok ajanlı mimariler tasarlamak
- Yaygın ajan dağıtım sorunlarını gidermek

---

## 🤖 Bir Ajanı Sohbet Botundan Farklı Kılan Nedir?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Responds to prompts | Takes autonomous actions |
| **Tools** | None | Can call APIs, search, execute code |
| **Memory** | Session-based only | Persistent memory across sessions |
| **Planning** | Single response | Multi-step reasoning |
| **Collaboration** | Single entity | Can work with other agents |

### Basit Bir Benzetme

- **Sohbet Botu** = Bilgi masasında soruları yanıtlayan yardımsever bir kişi
- **AI Ajanı** = Telefon açabilen, randevu ayarlayabilen ve görevleri sizin için tamamlayabilen bir kişisel asistan

---

## 🚀 Hızlı Başlangıç: İlk Ajanınızı Dağıtın

### Seçenek 1: Foundry Agents Şablonu (Önerilen)

```bash
# Yapay zeka ajanları şablonunu başlat
azd init --template get-started-with-ai-agents

# Azure'a dağıt
azd up
```

**Dağıtılanlar:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
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

**Dağıtılanlar:**
- ✅ Azure Functions (sunucusuz ajan yürütme)
- ✅ Azure OpenAI
- ✅ Prompty yapılandırma dosyaları
- ✅ Örnek ajan uygulaması

**Süre:** ~10-15 dakika
**Maliyet:** ~$50-100/ay (geliştirme)

### Seçenek 3: RAG Sohbet Ajanı

```bash
# RAG sohbet şablonunu başlat
azd init --template azure-search-openai-demo

# Azure'a dağıt
azd up
```

**Dağıtılanlar:**
- ✅ Azure OpenAI
- ✅ Örnek veri ile Azure AI Search
- ✅ Belge işleme hattı
- ✅ Alıntılarla sohbet arayüzü

**Süre:** ~15-25 dakika
**Maliyet:** ~$80-150/ay (geliştirme)

---

## 🏗️ Ajan Mimari Desenleri

### Desen 1: Araçlara Sahip Tek Ajan

En basit ajan deseni - birden fazla aracı kullanabilen tek bir ajan.

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

**En uygun olanlar:**
- Müşteri destek botları
- Araştırma asistanları
- Veri analizi ajanları

**AZD Şablonu:** `azure-search-openai-demo`

### Desen 2: RAG Ajanı (Retrieval-Augmented Generation)

Yanıt üretmeden önce ilgili belgeleri getiren bir ajan.

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

**En uygun olanlar:**
- Kurumsal bilgi tabanları
- Belge SSS sistemleri
- Uyumluluk ve hukuki araştırma

**AZD Şablonu:** `azure-search-openai-demo`

### Desen 3: Çok Ajanlı Sistem

Karmaşık görevlerde birlikte çalışan birden fazla uzmanlaşmış ajan.

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

**En uygun olanlar:**
- Karmaşık içerik üretimi
- Çok adımlı iş akışları
- Farklı uzmanlık gerektiren görevler

**Daha Fazla Bilgi:** [Çok Ajanlı Koordinasyon Desenleri](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Ajan Araçlarını Yapılandırma

Ajanlar araçları kullanabildiklerinde güçlü hale gelir. İşte yaygın araçları nasıl yapılandıracağınız:

### Foundry Agents'ta Araç Yapılandırması

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Özel araçları tanımla
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

# Araçlarla ajan oluştur
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Ortam Yapılandırması

```bash
# Ajana özgü ortam değişkenlerini ayarlayın
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Güncellenmiş yapılandırmayla dağıtın
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

### İzlenecek Temel Metrikler

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Time to generate response | < 5 seconds |
| Token Usage | Tokens per request | Monitor for cost |
| Tool Call Success Rate | % of successful tool executions | > 95% |
| Error Rate | Failed agent requests | < 1% |
| User Satisfaction | Feedback scores | > 4.0/5.0 |

### Ajanlar için Özel Günlükleme

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

## 💰 Maliyet Hususları

### Desene Göre Tahmini Aylık Maliyetler

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Maliyet Optimizasyonu İpuçları

1. **Basit görevler için GPT-4o-mini kullanın**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Tekrarlanan sorgular için önbellekleme uygulayın**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Token sınırları belirleyin**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Yanıt uzunluğunu sınırlayın
   )
   ```

4. **Kullanılmadığında sıfıra ölçeklendirin**
   ```bash
   # Container Apps otomatik olarak sıfıra ölçeklenir
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Ajan Sorun Giderme

### Yaygın Sorunlar ve Çözümleri

<details>
<summary><strong>❌ Ajan araç çağrılarına yanıt vermiyor</strong></summary>

```bash
# Araçların düzgün şekilde kayıtlı olup olmadığını kontrol edin
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
- API uç noktası erişilebilir değil
</details>

<details>
<summary><strong>❌ Ajan yanıtlarında yüksek gecikme</strong></summary>

```bash
# Dar boğazlar için Application Insights'ı kontrol edin
azd monitor --live

# Daha hızlı bir model kullanmayı düşünün
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**İyileştirme ipuçları:**
- Akışlı yanıtları kullanın
- Yanıt önbellekleme uygulayın
- Bağlam penceresi boyutunu azaltın
</details>

<details>
<summary><strong>❌ Ajan yanlış veya halüsinasyonlu bilgi döndürüyor</strong></summary>

```python
# Daha iyi sistem istemleriyle geliştirin
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Temellendirme için veri alma ekleyin
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Yanıtları belgelere dayandırın
)
```
</details>

<details>
<summary><strong>❌ Token limiti aşıldı hataları</strong></summary>

```python
# Bağlam penceresi yönetimini uygulayın
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Yaklaşık tahmin
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

**Hedef:** İlk AI ajanınızı AZD kullanarak dağıtın

```bash
# Adım 1: Şablonu başlatın
azd init --template get-started-with-ai-agents

# Adım 2: Azure'a giriş yapın
azd auth login

# Adım 3: Dağıtın
azd up

# Adım 4: Ajanı test edin
# Çıktıda gösterilen URL'yi açın

# Adım 5: Temizleyin
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Ajan sorulara yanıt veriyor
- [ ] İzleme panosuna erişebiliyor
- [ ] Kaynaklar başarıyla temizlendi

### Alıştırma 2: Özel Bir Araç Ekle (30 dakika)

**Hedef:** Ajanı özel bir araçla genişletin

1. Ajan şablonunu dağıtın
2. Yeni bir araç fonksiyonu oluşturun:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Hava servisine API çağrısı
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Aracı ajanla kaydedin
4. Ajanın yeni aracı kullandığını test edin

**Başarı Kriterleri:**
- [ ] Ajan hava durumu ile ilgili sorguları tanır
- [ ] Araç doğru şekilde çağrılır
- [ ] Yanıt hava bilgilerini içerir

### Alıştırma 3: Bir RAG Ajanı Oluşturun (45 dakika)

**Hedef:** Belgelerinizden gelen soruları yanıtlayan bir ajan oluşturun

```bash
# RAG şablonunu dağıtın
azd init --template azure-search-openai-demo
azd up

# Belgelerinizi yükleyin
# (Şablonun veri alma kılavuzunu izleyin)

# Alanına özgü sorularla test edin
```

**Başarı Kriterleri:**
- [ ] Ajan yüklenen belgelere göre yanıt verir
- [ ] Yanıtlarda atıflar bulunur
- [ ] Kapsam dışı sorularda yanlış bilgi olmaz

---

## 📚 Sonraki Adımlar

Artık AI ajanlarını anladığınıza göre, bu gelişmiş konuları keşfedin:

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Build systems with multiple collaborating agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Learn orchestration and communication patterns | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Enterprise-ready agent deployment | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Test and evaluate agent performance | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Ek Kaynaklar

### Resmi Belgeler
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Ajanlar için AZD Şablonları
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Topluluk Kaynakları
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Gezinti**
- **Önceki Ders**: [AI Model Deployment](ai-model-deployment.md)
- **Sonraki Ders**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için özen göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki versiyonu ile yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->