# Basit Flask API - Konteyner Uygulama Örneği

**Öğrenme Seviyesi:** Başlangıç ⭐ | **Süre:** 25-35 dakika | **Maliyet:** $0-15/ay

Azure Developer CLI (azd) kullanarak Azure Container Apps'e dağıtılmış, çalışan bir Python Flask REST API'si. Bu örnek, konteyner dağıtımı, otomatik ölçeklendirme ve izleme temellerini gösterir.

## 🎯 Öğrenecekleriniz

- Konteynerize edilmiş bir Python uygulamasını Azure'a dağıtma
- Sıfıra ölçeklendirme ile otomatik ölçeklendirme yapılandırma
- Sağlık kontrolleri ve hazır olma kontrolleri uygulama
- Uygulama günlüklerini ve metriklerini izleme
- Hızlı dağıtım için Azure Developer CLI kullanma

## 📦 İçerikler

✅ **Flask Uygulaması** - CRUD işlemleri içeren tam bir REST API (`src/app.py`)  
✅ **Dockerfile** - Üretime hazır konteyner yapılandırması  
✅ **Bicep Altyapısı** - Container Apps ortamı ve API dağıtımı  
✅ **AZD Yapılandırması** - Tek komutla dağıtım kurulumu  
✅ **Sağlık Kontrolleri** - Liveness ve hazır olma kontrolleri yapılandırılmış  
✅ **Otomatik Ölçeklendirme** - HTTP yüküne göre 0-10 kopya  

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

## Ön Koşullar

### Gerekenler
- **Azure Developer CLI (azd)** - [Kurulum rehberi](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure aboneliği** - [Ücretsiz hesap](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker'ı yükleyin](https://www.docker.com/products/docker-desktop/) (yerel test için)

### Ön Koşulları Doğrulama

```bash
# Azd sürümünü kontrol et (1.5.0 veya daha yüksek gerekli)
azd version

# Azure girişini doğrula
azd auth login

# Docker'ı kontrol et (isteğe bağlı, yerel test için)
docker --version
```

## ⏱️ Dağıtım Zaman Çizelgesi

| Aşama | Süre | Ne Oluyor? |
|-------|------|------------|
| Ortam kurulumu | 30 saniye | azd ortamı oluşturulur |
| Konteyner oluşturma | 2-3 dakika | Flask uygulaması Docker ile oluşturulur |
| Altyapı sağlama | 3-5 dakika | Container Apps, kayıt defteri, izleme oluşturulur |
| Uygulama dağıtımı | 2-3 dakika | Görüntü yüklenir ve Container Apps'e dağıtılır |
| **Toplam** | **8-12 dakika** | Tamamlanmış dağıtım hazır |

## Hızlı Başlangıç

```bash
# Örneğe gidin
cd examples/container-app/simple-flask-api

# Ortamı başlatın (benzersiz bir ad seçin)
azd env new myflaskapi

# Her şeyi dağıtın (altyapı + uygulama)
azd up
# Şunlar için yönlendirileceksiniz:
# 1. Azure aboneliğini seçin
# 2. Konumu seçin (ör. eastus2)
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

## ✅ Dağıtımı Doğrulama

### Adım 1: Dağıtım Durumunu Kontrol Etme

```bash
# Dağıtılmış hizmetleri görüntüle
azd show

# Beklenen çıktı şunları gösterir:
# - Hizmet: api
# - Uç Nokta: https://ca-api-[env].xxx.azurecontainerapps.io
# - Durum: Çalışıyor
```

### Adım 2: API Uç Noktalarını Test Etme

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
- ✅ Ana uç nokta API bilgilerini gösterir
- ✅ POST öğe oluşturur ve HTTP 201 döner
- ✅ GET oluşturulan öğeleri döner

### Adım 3: Günlükleri Görüntüleme

```bash
# Canlı günlükleri akışa al
azd logs api --follow

# Şunu görmelisiniz:
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
|----------|--------|----------|
| `/health` | GET | Sağlık kontrolü |
| `/api/items` | GET | Tüm öğeleri listele |
| `/api/items` | POST | Yeni öğe oluştur |
| `/api/items/{id}` | GET | Belirli bir öğeyi al |
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

API, HTTP trafiğine göre otomatik olarak ölçeklenir:
- **Minimum Kopya Sayısı**: 0 (boşta olduğunda sıfıra ölçeklenir)
- **Maksimum Kopya Sayısı**: 10
- **Kopya Başına Eşzamanlı İstek**: 50

## Geliştirme

### Yerel Olarak Çalıştırma

```bash
# Bağımlılıkları yükle
cd src
pip install -r requirements.txt

# Uygulamayı çalıştır
python app.py

# Yerel olarak test et
curl http://localhost:8000/health
```

### Konteyneri Oluşturma ve Test Etme

```bash
# Docker görüntüsünü oluştur
docker build -t flask-api:local ./src

# Konteyneri yerel olarak çalıştır
docker run -p 8000:8000 flask-api:local

# Konteyneri test et
curl http://localhost:8000/health
```

## Dağıtım

### Tam Dağıtım

```bash
# Altyapı ve uygulamayı dağıt
azd up
```

### Sadece Kod Dağıtımı

```bash
# Yalnızca uygulama kodunu dağıtın (altyapı değişmeden)
azd deploy api
```

### Yapılandırmayı Güncelleme

```bash
# Ortam değişkenlerini güncelle
azd env set API_KEY "new-api-key"

# Yeni yapılandırma ile yeniden dağıt
azd deploy api
```

## İzleme

### Günlükleri Görüntüleme

```bash
# Canlı günlükleri akışa al
azd logs api --follow

# Son 100 satırı görüntüle
azd logs api --tail 100
```

### Metrikleri İzleme

```bash
# Azure Monitor panosunu açın
azd monitor --overview

# Belirli metrikleri görüntüleyin
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

### Öğe Oluşturma

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Tüm Öğeleri Alma

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Maliyet Optimizasyonu

Bu dağıtım sıfıra ölçeklendirme kullanır, bu nedenle yalnızca API istekleri işlenirken ödeme yaparsınız:

- **Boşta maliyet**: ~$0/ay (sıfıra ölçeklenmiş)
- **Aktif maliyet**: ~$0.000024/saniye başına kopya
- **Beklenen aylık maliyet** (hafif kullanım): $5-15

### Maliyetleri Daha Fazla Azaltma

```bash
# Geliştirme için maksimum kopyaları azalt
azd env set MAX_REPLICAS 3

# Daha kısa boşta kalma zaman aşımı kullan
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 dakika
```

## Sorun Giderme

### Konteyner Başlamıyor

```bash
# Konteyner günlüklerini kontrol et
azd logs api --tail 100

# Docker imajının yerel olarak oluşturulduğunu doğrula
docker build -t test ./src
```

### API Erişilemiyor

```bash
# Girişin harici olduğunu doğrula
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

## Temizlik

```bash
# Tüm kaynakları sil
azd down --force --purge
```

## Sonraki Adımlar

### Bu Örneği Genişletin

1. **Veritabanı Ekleyin** - Azure Cosmos DB veya SQL Database entegrasyonu
   ```bash
   # Cosmos DB modülünü infra/main.bicep dosyasına ekle
   # app.py dosyasını veritabanı bağlantısı ile güncelle
   ```

2. **Kimlik Doğrulama Ekleyin** - Azure AD veya API anahtarları uygulayın
   ```python
   # app.py dosyasına kimlik doğrulama ara yazılımı ekle
   from functools import wraps
   ```

3. **CI/CD Kurun** - GitHub Actions iş akışı
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Yönetilen Kimlik Ekleyin** - Azure hizmetlerine güvenli erişim
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### İlgili Örnekler

- **[Veritabanı Uygulaması](../../../../../examples/database-app)** - SQL Database ile tam örnek
- **[Mikroservisler](../../../../../examples/container-app/microservices)** - Çoklu hizmet mimarisi
- **[Container Apps Ana Rehberi](../README.md)** - Tüm konteyner desenleri

### Öğrenme Kaynakları

- 📚 [AZD Başlangıç Kursu](../../../README.md) - Ana kurs sayfası
- 📚 [Container Apps Desenleri](../README.md) - Daha fazla dağıtım deseni
- 📚 [AZD Şablon Galerisi](https://azure.github.io/awesome-azd/) - Topluluk şablonları

## Ek Kaynaklar

### Belgeler
- **[Flask Belgeleri](https://flask.palletsprojects.com/)** - Flask çerçeve rehberi
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Resmi Azure belgeleri
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd komut referansı

### Eğitimler
- **[Container Apps Hızlı Başlangıç](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - İlk uygulamanızı dağıtın
- **[Azure'da Python](https://learn.microsoft.com/azure/developer/python/)** - Python geliştirme rehberi
- **[Bicep Dili](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Kod olarak altyapı

### Araçlar
- **[Azure Portal](https://portal.azure.com)** - Kaynakları görsel olarak yönetin
- **[VS Code Azure Eklentisi](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE entegrasyonu

---

**🎉 Tebrikler!** Otomatik ölçeklendirme ve izleme ile Azure Container Apps'e üretime hazır bir Flask API dağıttınız.

**Sorularınız mı var?** [Bir sorun açın](https://github.com/microsoft/AZD-for-beginners/issues) veya [SSS'ye göz atın](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->