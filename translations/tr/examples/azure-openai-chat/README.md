<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-20T23:59:21+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "tr"
}
-->
# Azure OpenAI Sohbet Uygulaması

**Öğrenme Seviyesi:** Orta ⭐⭐ | **Süre:** 35-45 dakika | **Maliyet:** Aylık $50-200

Azure Developer CLI (azd) kullanılarak dağıtılmış tam bir Azure OpenAI sohbet uygulaması. Bu örnek, GPT-4 dağıtımını, güvenli API erişimini ve basit bir sohbet arayüzünü gösterir.

## 🎯 Öğrenecekleriniz

- GPT-4 modeliyle Azure OpenAI Hizmeti'ni dağıtma  
- OpenAI API anahtarlarını Key Vault ile güvence altına alma  
- Python ile basit bir sohbet arayüzü oluşturma  
- Token kullanımını ve maliyetleri izleme  
- Hız sınırlama ve hata yönetimi uygulama  

## 📦 İçerikler

✅ **Azure OpenAI Hizmeti** - GPT-4 modeli dağıtımı  
✅ **Python Sohbet Uygulaması** - Basit komut satırı sohbet arayüzü  
✅ **Key Vault Entegrasyonu** - Güvenli API anahtarı depolama  
✅ **ARM Şablonları** - Tam altyapı kodu  
✅ **Maliyet İzleme** - Token kullanımı takibi  
✅ **Hız Sınırlama** - Kota tükenmesini önleme  

## Mimari

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

## Ön Koşullar

### Gereklilikler

- **Azure Developer CLI (azd)** - [Kurulum rehberi](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **OpenAI erişimi olan Azure aboneliği** - [Erişim talep edin](https://aka.ms/oai/access)  
- **Python 3.9+** - [Python'u indir](https://www.python.org/downloads/)  

### Ön Koşulları Doğrulama

```bash
# Azd sürümünü kontrol et (1.5.0 veya daha yüksek gerekli)
azd version

# Azure girişini doğrula
azd auth login

# Python sürümünü kontrol et
python --version  # veya python3 --version

# OpenAI erişimini doğrula (Azure Portal'da kontrol et)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Önemli:** Azure OpenAI, uygulama onayı gerektirir. Henüz başvurmadıysanız, [aka.ms/oai/access](https://aka.ms/oai/access) adresini ziyaret edin. Onay genellikle 1-2 iş günü sürer.

## ⏱️ Dağıtım Zaman Çizelgesi

| Aşama                | Süre          | Ne Oluyor?                          |
|----------------------|---------------|-------------------------------------|
| Ön koşul kontrolü    | 2-3 dakika    | OpenAI kota uygunluğu doğrulanır    |
| Altyapı dağıtımı     | 8-12 dakika   | OpenAI, Key Vault, model dağıtımı   |
| Uygulama yapılandırma| 2-3 dakika    | Ortam ve bağımlılıklar ayarlanır    |
| **Toplam**           | **12-18 dakika** | GPT-4 ile sohbet etmeye hazır!     |

**Not:** İlk OpenAI dağıtımı, model sağlama nedeniyle daha uzun sürebilir.

## Hızlı Başlangıç

```bash
# Örneğe gidin
cd examples/azure-openai-chat

# Ortamı başlatın
azd env new myopenai

# Her şeyi dağıtın (altyapı + yapılandırma)
azd up
# Şunlar için yönlendirileceksiniz:
# 1. Azure aboneliğini seçin
# 2. OpenAI kullanılabilirliği olan bir konum seçin (ör. eastus, eastus2, westus)
# 3. Dağıtım için 12-18 dakika bekleyin

# Python bağımlılıklarını yükleyin
pip install -r requirements.txt

# Sohbete başlayın!
python chat.py
```

**Beklenen Çıktı:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Dağıtımı Doğrulama

### Adım 1: Azure Kaynaklarını Kontrol Etme

```bash
# Dağıtılan kaynakları görüntüle
azd show

# Beklenen çıktı şunları gösterir:
# - OpenAI Hizmeti: (kaynak adı)
# - Anahtar Kasası: (kaynak adı)
# - Dağıtım: gpt-4
# - Konum: eastus (veya seçtiğiniz bölge)
```

### Adım 2: OpenAI API'sini Test Etme

```bash
# OpenAI uç noktasını ve anahtarını alın
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API çağrısını test et
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Beklenen Yanıt:**
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

### Adım 3: Key Vault Erişimini Doğrulama

```bash
# Anahtar Kasasında sırları listele
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Beklenen Sırlar:**
- `openai-api-key`  
- `openai-endpoint`  

**Başarı Kriterleri:**
- ✅ GPT-4 ile OpenAI hizmeti dağıtıldı  
- ✅ API çağrısı geçerli bir yanıt döndürüyor  
- ✅ Sırlar Key Vault'ta saklandı  
- ✅ Token kullanımı takibi çalışıyor  

## Proje Yapısı

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

## Uygulama Özellikleri

### Sohbet Arayüzü (`chat.py`)

Sohbet uygulaması şunları içerir:  
- **Konuşma Geçmişi** - Mesajlar arasında bağlamı korur  
- **Token Sayımı** - Kullanımı izler ve maliyetleri tahmin eder  
- **Hata Yönetimi** - Hız sınırları ve API hatalarını zarifçe ele alır  
- **Maliyet Tahmini** - Mesaj başına gerçek zamanlı maliyet hesaplama  
- **Akış Desteği** - İsteğe bağlı akış yanıtları  

### Komutlar

Sohbet sırasında şunları kullanabilirsiniz:  
- `quit` veya `exit` - Oturumu sonlandırır  
- `clear` - Konuşma geçmişini temizler  
- `tokens` - Toplam token kullanımını gösterir  
- `cost` - Tahmini toplam maliyeti gösterir  

### Yapılandırma (`config.py`)

Ortam değişkenlerinden yapılandırma yükler:  
```python
AZURE_OPENAI_ENDPOINT  # Anahtar Kasasından
AZURE_OPENAI_API_KEY   # Anahtar Kasasından
AZURE_OPENAI_MODEL     # Varsayılan: gpt-4
AZURE_OPENAI_MAX_TOKENS # Varsayılan: 800
```

## Kullanım Örnekleri

### Temel Sohbet

```bash
python chat.py
```

### Özel Model ile Sohbet

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Akışlı Sohbet

```bash
python chat.py --stream
```

### Örnek Konuşma

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

## Maliyet Yönetimi

### Token Fiyatlandırması (GPT-4)

| Model       | Girdi (1K token başına) | Çıktı (1K token başına) |
|-------------|-------------------------|-------------------------|
| GPT-4       | $0.03                  | $0.06                  |
| GPT-3.5-Turbo| $0.0015               | $0.002                 |

### Tahmini Aylık Maliyetler

Kullanım desenlerine göre:  

| Kullanım Seviyesi | Mesaj/Gün | Token/Gün | Aylık Maliyet |
|-------------------|-----------|-----------|---------------|
| **Hafif**        | 20 mesaj  | 3,000 token | $3-5         |
| **Orta**         | 100 mesaj | 15,000 token| $15-25       |
| **Yoğun**        | 500 mesaj | 75,000 token| $75-125      |

**Temel Altyapı Maliyeti:** $1-2/ay (Key Vault + minimum işlem)  

### Maliyet Optimizasyon İpuçları

```bash
# 1. Daha basit görevler için GPT-3.5-Turbo kullanın (20 kat daha ucuz)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Daha kısa yanıtlar için maksimum token sayısını azaltın
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Token kullanımını izleyin
python chat.py --show-tokens

# 4. Bütçe uyarıları ayarlayın
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## İzleme

### Token Kullanımını Görüntüleme

```bash
# Azure Portal'da:
# OpenAI Kaynağı → Metrikler → "Token İşlemi"ni Seç

# Veya Azure CLI üzerinden:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API Günlüklerini Görüntüleme

```bash
# Tanı günlüklerini akışa al
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Günlükleri sorgula
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Sorun Giderme

### Sorun: "Erişim Reddedildi" Hatası

**Belirtiler:** API çağrısında 403 Yasak hatası  

**Çözümler:**  
```bash
# 1. OpenAI erişiminin onaylandığını doğrulayın
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. API anahtarının doğru olduğunu kontrol edin
azd env get-value AZURE_OPENAI_API_KEY

# 3. Uç nokta URL formatını doğrulayın
azd env get-value AZURE_OPENAI_ENDPOINT
# Şu şekilde olmalı: https://[name].openai.azure.com/
```

### Sorun: "Hız Sınırı Aşıldı"

**Belirtiler:** 429 Çok Fazla İstek hatası  

**Çözümler:**  
```bash
# 1. Mevcut kotayı kontrol et
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Kota artırımı talep et (gerekirse)
# Azure Portal → OpenAI Kaynağı → Kotalar → Artış Talep Et bölümüne git

# 3. Yeniden deneme mantığını uygula (zaten chat.py içinde)
# Uygulama otomatik olarak üstel geri çekilme ile yeniden deniyor
```

### Sorun: "Model Bulunamadı"

**Belirtiler:** Dağıtım için 404 hatası  

**Çözümler:**  
```bash
# 1. Mevcut dağıtımları listele
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Ortamdaki model adını doğrula
echo $AZURE_OPENAI_MODEL

# 3. Doğru dağıtım adını güncelle
export AZURE_OPENAI_MODEL=gpt-4  # veya gpt-35-turbo
```

### Sorun: Yüksek Gecikme

**Belirtiler:** Yavaş yanıt süreleri (>5 saniye)  

**Çözümler:**  
```bash
# 1. Bölgesel gecikmeyi kontrol et
# Kullanıcılara en yakın bölgeye dağıt

# 2. Daha hızlı yanıtlar için max_tokens değerini azalt
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Daha iyi kullanıcı deneyimi için akışı kullan
python chat.py --stream
```

## Güvenlik En İyi Uygulamaları

### 1. API Anahtarlarını Koruyun

```bash
# Anahtarları asla kaynak kontrolüne göndermeyin
# Anahtar Kasası kullanın (zaten yapılandırılmış)

# Anahtarları düzenli olarak döndürün
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. İçerik Filtreleme Uygulayın

```python
# Azure OpenAI, yerleşik içerik filtreleme içerir
# Azure Portal'da yapılandırın:
# OpenAI Kaynağı → İçerik Filtreleri → Özel Filtre Oluştur

# Kategoriler: Nefret, Cinsel, Şiddet, Kendine zarar verme
# Seviyeler: Düşük, Orta, Yüksek filtreleme
```

### 3. Yönetilen Kimlik Kullanın (Üretim)

```bash
# Üretim dağıtımları için yönetilen kimlik kullanın
# API anahtarları yerine (Azure'da uygulama barındırmayı gerektirir)

# infra/openai.bicep dosyasını güncelleyin:
# identity: { type: 'SystemAssigned' }
```

## Geliştirme

### Yerel Olarak Çalıştırma

```bash
# Bağımlılıkları yükle
pip install -r src/requirements.txt

# Ortam değişkenlerini ayarla
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Uygulamayı çalıştır
python src/chat.py
```

### Testleri Çalıştırma

```bash
# Test bağımlılıklarını yükle
pip install pytest pytest-cov

# Testleri çalıştır
pytest tests/ -v

# Kapsama ile
pytest tests/ --cov=src --cov-report=html
```

### Model Dağıtımını Güncelleme

```bash
# Farklı model versiyonunu dağıt
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

## Temizlik

```bash
# Tüm Azure kaynaklarını sil
azd down --force --purge

# Bu şunları kaldırır:
# - OpenAI Hizmeti
# - Key Vault (90 günlük yumuşak silme ile)
# - Kaynak Grubu
# - Tüm dağıtımlar ve yapılandırmalar
```

## Sonraki Adımlar

### Bu Örneği Genişletin

1. **Web Arayüzü Ekleyin** - React/Vue ön yüzü oluşturun  
   ```bash
   # Azure.yaml dosyasına frontend hizmeti ekle
   # Azure Static Web Apps'a dağıt
   ```

2. **RAG Uygulayın** - Azure AI Search ile belge arama ekleyin  
   ```python
   # Azure Cognitive Search'i entegre et
   # Belgeleri yükle ve vektör indeksi oluştur
   ```

3. **Fonksiyon Çağrısı Ekleyin** - Araç kullanımını etkinleştirin  
   ```python
   # chat.py dosyasında fonksiyonları tanımlayın
   # GPT-4'ün harici API'leri çağırmasına izin verin
   ```

4. **Çoklu Model Desteği** - Birden fazla model dağıtın  
   ```bash
   # gpt-35-turbo, gömme modeller ekle
   # Model yönlendirme mantığını uygula
   ```

### İlgili Örnekler

- **[Perakende Çoklu Ajan](../retail-scenario.md)** - Gelişmiş çoklu ajan mimarisi  
- **[Veritabanı Uygulaması](../../../../examples/database-app)** - Kalıcı depolama ekleyin  
- **[Kapsayıcı Uygulamalar](../../../../examples/container-app)** - Kapsayıcılaştırılmış hizmet olarak dağıtın  

### Öğrenme Kaynakları

- 📚 [AZD Başlangıç Kursu](../../README.md) - Ana kurs sayfası  
- 📚 [Azure OpenAI Belgeleri](https://learn.microsoft.com/azure/ai-services/openai/) - Resmi belgeler  
- 📚 [OpenAI API Referansı](https://platform.openai.com/docs/api-reference) - API detayları  
- 📚 [Sorumlu AI](https://www.microsoft.com/ai/responsible-ai) - En iyi uygulamalar  

## Ek Kaynaklar

### Belgeler
- **[Azure OpenAI Hizmeti](https://learn.microsoft.com/azure/ai-services/openai/)** - Tam rehber  
- **[GPT-4 Modelleri](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Model yetenekleri  
- **[İçerik Filtreleme](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Güvenlik özellikleri  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referansı  

### Eğitimler
- **[OpenAI Hızlı Başlangıç](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - İlk dağıtım  
- **[Sohbet Tamamlamaları](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Sohbet uygulamaları oluşturma  
- **[Fonksiyon Çağrısı](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Gelişmiş özellikler  

### Araçlar
- **[Azure OpenAI Stüdyosu](https://oai.azure.com/)** - Web tabanlı oyun alanı  
- **[Prompt Mühendisliği Rehberi](https://platform.openai.com/docs/guides/prompt-engineering)** - Daha iyi istemler yazma  
- **[Token Hesaplayıcı](https://platform.openai.com/tokenizer)** - Token kullanımını tahmin etme  

### Topluluk
- **[Azure AI Discord](https://discord.gg/azure)** - Topluluktan yardım alın  
- **[GitHub Tartışmaları](https://github.com/Azure-Samples/openai/discussions)** - Soru-Cevap forumu  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - En son güncellemeler  

---

**🎉 Tebrikler!** Azure OpenAI'yi dağıttınız ve çalışan bir sohbet uygulaması oluşturdunuz. GPT-4'ün yeteneklerini keşfetmeye başlayın ve farklı istemler ve kullanım durumlarıyla deney yapın.

**Sorularınız mı var?** [Bir sorun açın](https://github.com/microsoft/AZD-for-beginners/issues) veya [SSS](../../resources/faq.md) bölümüne göz atın.

**Maliyet Uyarısı:** Test işlemi tamamlandığında `azd down` komutunu çalıştırmayı unutmayın, aksi takdirde (~$50-100/ay aktif kullanım için) devam eden ücretlerle karşılaşabilirsiniz.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->