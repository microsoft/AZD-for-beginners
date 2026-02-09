# Basit Flask API - Container App Örneği

**Öğrenme Yolu:** Başlangıç ⭐ | **Süre:** 25-35 dakika | **Maliyet:** $0-15/ay

Azure Developer CLI (azd) kullanılarak Azure Container Apps'e dağıtılmış eksiksiz, çalışan bir Python Flask REST API. Bu örnek konteyner dağıtımı, otomatik ölçeklendirme ve izleme temellerini gösterir.

## 🎯 Neler Öğreneceksiniz

- Python konteynerleştirilmiş bir uygulamayı Azure'a dağıtma
- Sıfıra ölçekleme ile otomatik ölçeklendirmeyi yapılandırma
- Sağlık probe'ları ve hazır olma kontrolleri uygulama
- Uygulama günlüklerini ve metrikleri izleme
- Hızlı dağıtım için Azure Developer CLI kullanma

## 📦 Neler Dahil

✅ **Flask Uygulaması** - CRUD işlemleri ile eksiksiz REST API (`src/app.py`)  
✅ **Dockerfile** - Üretime hazır konteyner yapılandırması  
✅ **Bicep Altyapısı** - Container Apps ortamı ve API dağıtımı  
✅ **AZD Yapılandırması** - Tek komutla dağıtım kurulumu  
✅ **Sağlık Probe'ları** - Liveness ve readiness kontrolleri yapılandırıldı  
✅ **Otomatik Ölçeklendirme** - HTTP yüküne göre 0-10 replika  

## Mimari

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Önkoşullar

### Gerekli
- **Azure Developer CLI (azd)** - [Kurulum kılavuzu](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure aboneliği** - [Ücretsiz hesap](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (yerel test için)

### Önkoşulları Doğrula

```bash
# azd sürümünü kontrol edin (1.5.0 veya daha yüksek gereklidir)
azd version

# Azure girişini doğrulayın
azd auth login

# Docker'ı kontrol edin (isteğe bağlı, yerel test için)
docker --version
```

## ⏱️ Dağıtım Zaman Çizelgesi

| Aşama | Süre | Ne Olur |
|-------|----------|--------------||
| Ortam kurulumu | 30 seconds | Create azd environment |
| Konteyner oluşturma | 2-3 minutes | Docker build Flask app |
| Altyapıyı sağlama | 3-5 minutes | Create Container Apps, registry, monitoring |
| Uygulamayı dağıtma | 2-3 minutes | Push image and deploy to Container Apps |
| **Toplam** | **8-12 minutes** | Tam dağıtım hazır |

## Hızlı Başlangıç

```bash
# Örneğe gidin
cd examples/container-app/simple-flask-api

# Ortamı başlatın (benzersiz bir ad seçin)
azd env new myflaskapi

# Her şeyi dağıtın (altyapı + uygulama)
azd up
# Sizden şu istenecektir:
# 1. Azure aboneliğini seçin
# 2. Konumu seçin (örn., eastus2)
# 3. Dağıtım için 8-12 dakika bekleyin

# API uç noktanızı alın
azd env get-values

# API'yi test edin
curl $(azd env get-value API_ENDPOINT)/health
```

**Beklenen Çıktı:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Dağıtımı Doğrulayın

### Adım 1: Dağıtım Durumunu Kontrol Et

```bash
# Dağıtılan hizmetleri görüntüle
azd show

# Beklenen çıktı şunları gösterir:
# - Hizmet: api
# - Uç nokta: https://ca-api-[env].xxx.azurecontainerapps.io
# - Durum: Çalışıyor
```

### Adım 2: API Uç Noktalarını Test Edin

```bash
# API uç noktasını al
API_URL=$(azd env get-value API_ENDPOINT)

# Sağlığı test et
curl $API_URL/health

# Kök uç noktasını test et
curl $API_URL/

# Bir öğe oluştur
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Tüm öğeleri al
curl $API_URL/api/items
```

**Başarı Kriterleri:**
- ✅ Sağlık uç noktası HTTP 200 döner
- ✅ Kök uç nokta API bilgilerini gösterir
- ✅ POST yeni öğe oluşturur ve HTTP 201 döner
- ✅ GET oluşturulan öğeleri döner

### Adım 3: Günlükleri Görüntüleyin

```bash
# azd monitor kullanarak canlı günlükleri akıtın
azd monitor --logs

# Ya da Azure CLI kullanın:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Şunları görmelisiniz:
# - Gunicorn başlangıç mesajları
# - HTTP istek günlükleri
# - Uygulama bilgi günlükleri
```

## Proje Yapısı

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API Uç Noktaları

| Uç Nokta | Yöntem | Açıklama |
|----------|--------|-------------|
| `/health` | GET | Sağlık kontrolü |
| `/api/items` | GET | Tüm öğeleri listele |
| `/api/items` | POST | Yeni öğe oluştur |
| `/api/items/{id}` | GET | Belirli öğeyi al |
| `/api/items/{id}` | PUT | Öğeyi güncelle |
| `/api/items/{id}` | DELETE | Öğeyi sil |

## Yapılandırma

### Ortam Değişkenleri

```bash
# Özel yapılandırmayı ayarla
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Ölçeklendirme Yapılandırması

API HTTP trafiğine göre otomatik olarak ölçeklenir:
- **Min Replicas**: 0 (boşta iken sıfıra ölçeklenir)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Geliştirme

### Yerel Olarak Çalıştır

```bash
# Bağımlılıkları yükle
cd src
pip install -r requirements.txt

# Uygulamayı çalıştır
python app.py

# Yerelde test et
curl http://localhost:8000/health
```

### Konteyneri Derle ve Test Et

```bash
# Docker görüntüsü oluştur
docker build -t flask-api:local ./src

# Konteyneri yerel olarak çalıştır
docker run -p 8000:8000 flask-api:local

# Konteyneri test et
curl http://localhost:8000/health
```

## Dağıtım

### Tam Dağıtım

```bash
# Altyapıyı ve uygulamayı dağıtın
azd up
```

### Yalnızca Kod Dağıtımı

```bash
# Sadece uygulama kodunu dağıt (altyapı değişmeden)
azd deploy api
```

### Yapılandırmayı Güncelle

```bash
# Ortam değişkenlerini güncelle
azd env set API_KEY "new-api-key"

# Yeni yapılandırmayla yeniden dağıt
azd deploy api
```

## İzleme

### Günlükleri Görüntüle

```bash
# azd monitor kullanarak canlı günlükleri akıtın
azd monitor --logs

# Veya Container Apps için Azure CLI'yi kullanın:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Son 100 satırı görüntüleyin
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Metrikleri İzle

```bash
# Azure Monitor panosunu aç
azd monitor --overview

# Belirli metrikleri görüntüle
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Test Etme

### Sağlık Kontrolü

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Beklenen yanıt:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Öğe Oluştur

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Tüm Öğeleri Al

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Maliyet Optimizasyonu

Bu dağıtım sıfıra ölçeklemeyi kullanır, bu nedenle yalnızca API istekleri işlerken ödeme yaparsınız:

- **Boşta maliyeti**: ~$0/ay (sıfıra ölçeklenir)
- **Aktif maliyet**: ~$0.000024/saniye başına replika
- **Beklenen aylık maliyet** (hafif kullanım): $5-15

### Maliyetleri Daha Fazla Azaltın

```bash
# Geliştirme ortamı için maksimum replika sayısını azalt
azd env set MAX_REPLICAS 3

# Daha kısa bir boşta kalma zaman aşımı kullan
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 dakika
```

## Sorun Giderme

### Konteyner Başlamıyor

```bash
# Azure CLI kullanarak konteyner günlüklerini kontrol edin
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker görüntüsünün yerel olarak oluşturulduğunu doğrulayın
docker build -t test ./src
```

### API Erişilemiyor

```bash
# Ingress'in harici olduğunu doğrulayın
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Yüksek Yanıt Süreleri

```bash
# CPU/Bellek kullanımını kontrol et
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Gerekirse kaynakları artır
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Temizleme

```bash
# Tüm kaynakları sil
azd down --force --purge
```

## Sonraki Adımlar

### Bu Örneği Genişletin

1. **Veritabanı Ekle** - Azure Cosmos DB veya SQL Database ile entegrasyon
   ```bash
   # infra/main.bicep dosyasına Cosmos DB modülünü ekle
   # app.py dosyasını veritabanı bağlantısıyla güncelle
   ```

2. **Kimlik Doğrulama Ekle** - Azure AD veya API anahtarlarını uygulayın
   ```python
   # app.py'ye kimlik doğrulama ara yazılımı ekle
   from functools import wraps
   ```

3. **CI/CD Kur** - GitHub Actions iş akışı
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Yönetilen Kimlik Ekle** - Azure hizmetlerine güvenli erişim
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### İlgili Örnekler

- **[Veritabanı Uygulaması](../../../../../examples/database-app)** - SQL Database ile tamamlanmış örnek
- **[Mikroservisler](../../../../../examples/container-app/microservices)** - Çok servisli mimari
- **[Container Apps Ana Rehberi](../README.md)** - Tüm konteyner desenleri

### Öğrenme Kaynakları

- 📚 [AZD Yeni Başlayanlar Kursu](../../../README.md) - Kursun ana sayfası
- 📚 [Container Apps Patterns](../README.md) - Daha fazla dağıtım deseni
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Topluluk şablonları

## Ek Kaynaklar

### Dokümantasyon
- **[Flask Dokümantasyonu](https://flask.palletsprojects.com/)** - Flask framework kılavuzu
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Resmi Azure dokümanları
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd komut referansı

### Eğitimler
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - İlk uygulamanızı dağıtın
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python geliştirme rehberi
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Kod olarak altyapı

### Araçlar
- **[Azure Portal](https://portal.azure.com)** - Kaynakları görsel olarak yönetin
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE entegrasyonu

---

**🎉 Tebrikler!** Azure Container Apps'e otomatik ölçekleme ve izleme ile üretim hazır bir Flask API dağıttınız.

**Sorularınız mı var?** [Bir sorun açın](https://github.com/microsoft/AZD-for-beginners/issues) veya [SSS](../../../resources/faq.md) sayfasına bakın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Sorumluluk Reddi**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğa özen gösterilse de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğinin farkında olun. Orijinal belge, kendi dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çeviri nedeniyle ortaya çıkabilecek yanlış anlaşılmalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->