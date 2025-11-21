<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-20T23:20:13+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "tr"
}
-->
# Mikroservis Mimarisi - Container App Örneği

⏱️ **Tahmini Süre**: 25-35 dakika | 💰 **Tahmini Maliyet**: ~50-100$/ay | ⭐ **Zorluk Seviyesi**: İleri

AZD CLI kullanarak Azure Container Apps'e dağıtılmış **basitleştirilmiş ama işlevsel** bir mikroservis mimarisi. Bu örnek, servisler arası iletişim, konteyner orkestrasyonu ve izleme gibi pratik bir 2-servis yapılandırmasıyla çalışır.

> **📚 Öğrenme Yaklaşımı**: Bu örnek, gerçekten dağıtabileceğiniz ve öğrenebileceğiniz minimal bir 2-servis mimarisi (API Gateway + Backend Servis) ile başlar. Bu temeli öğrendikten sonra, tam bir mikroservis ekosistemine genişletme konusunda rehberlik sağlıyoruz.

## Öğrenecekleriniz

Bu örneği tamamlayarak:
- Birden fazla konteyneri Azure Container Apps'e dağıtmayı,
- Dahili ağ ile servisler arası iletişim kurmayı,
- Ortam tabanlı ölçeklendirme ve sağlık kontrollerini yapılandırmayı,
- Application Insights ile dağıtılmış uygulamaları izlemeyi,
- Mikroservis dağıtım desenlerini ve en iyi uygulamaları anlamayı,
- Basit mimariden karmaşık mimariye kademeli genişlemeyi öğrenmiş olacaksınız.

## Mimari

### Aşama 1: İnşa Ettiğimiz Şey (Bu Örnekte Dahil)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Neden Basit Başlıyoruz?**
- ✅ Hızlıca dağıtın ve anlayın (25-35 dakika)
- ✅ Karmaşıklık olmadan temel mikroservis desenlerini öğrenin
- ✅ Değiştirip deneyebileceğiniz çalışan kod
- ✅ Öğrenme için daha düşük maliyet (~50-100$/ay yerine 300-1400$/ay)
- ✅ Veritabanları ve mesaj kuyrukları eklemeden önce güven kazanın

**Benzerlik**: Bunu araba kullanmayı öğrenmek gibi düşünün. Boş bir otoparkta (2 servis) başlarsınız, temelleri öğrenirsiniz, ardından şehir trafiğine (5+ servis, veritabanları ile) geçersiniz.

### Aşama 2: Gelecekteki Genişleme (Referans Mimari)

2-servis mimarisini öğrendikten sonra genişletebilirsiniz:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Adım adım talimatlar için "Genişleme Rehberi" bölümüne bakın.

## Dahil Edilen Özellikler

✅ **Servis Keşfi**: Konteynerler arasında otomatik DNS tabanlı keşif  
✅ **Yük Dengeleme**: Replikalar arasında yerleşik yük dengeleme  
✅ **Otomatik Ölçeklendirme**: HTTP isteklerine göre her servis için bağımsız ölçeklendirme  
✅ **Sağlık İzleme**: Her iki servis için canlılık ve hazır olma kontrolleri  
✅ **Dağıtılmış Günlükleme**: Application Insights ile merkezi günlükleme  
✅ **Dahili Ağ**: Güvenli servisler arası iletişim  
✅ **Konteyner Orkestrasyonu**: Otomatik dağıtım ve ölçeklendirme  
✅ **Kesintisiz Güncellemeler**: Revizyon yönetimi ile aşamalı güncellemeler  

## Ön Koşullar

### Gerekli Araçlar

Başlamadan önce, aşağıdaki araçların yüklü olduğundan emin olun:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (sürüm 1.0.0 veya üzeri)
   ```bash
   azd version
   # Beklenen çıktı: azd sürüm 1.0.0 veya daha yüksek
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (sürüm 2.50.0 veya üzeri)
   ```bash
   az --version
   # Beklenen çıktı: azure-cli 2.50.0 veya daha yüksek
   ```

3. **[Docker](https://www.docker.com/get-started)** (yerel geliştirme/test için - isteğe bağlı)
   ```bash
   docker --version
   # Beklenen çıktı: Docker sürümü 20.10 veya daha yüksek
   ```

### Azure Gereksinimleri

- Aktif bir **Azure aboneliği** ([ücretsiz hesap oluşturun](https://azure.microsoft.com/free/))
- Aboneliğinizde kaynak oluşturma izinleri
- Abonelik veya kaynak grubunda **Katkıda Bulunan** rolü

### Bilgi Ön Koşulları

Bu **ileri seviye** bir örnektir. Şunları bilmelisiniz:
- [Basit Flask API örneğini](../../../../../examples/container-app/simple-flask-api) tamamlamış olmak
- Mikroservis mimarisini temel düzeyde anlamak
- REST API'ler ve HTTP hakkında bilgi sahibi olmak
- Konteyner kavramlarını anlamak

**Container Apps'e yeni mi?** Önce [Basit Flask API örneği](../../../../../examples/container-app/simple-flask-api) ile başlayarak temelleri öğrenin.

## Hızlı Başlangıç (Adım Adım)

### Adım 1: Klonlayın ve Gezin

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Başarı Kontrolü**: `azure.yaml` dosyasını gördüğünüzden emin olun:
```bash
ls
# Beklenen: README.md, azure.yaml, infra/, src/
```

### Adım 2: Azure ile Kimlik Doğrulama

```bash
azd auth login
```

Bu, Azure kimlik doğrulaması için tarayıcınızı açar. Azure kimlik bilgilerinizle oturum açın.

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
Logged in to Azure.
```

### Adım 3: Ortamı Başlatın

```bash
azd init
```

**Göreceğiniz İstemler**:
- **Ortam adı**: Kısa bir ad girin (ör. `microservices-dev`)
- **Azure aboneliği**: Aboneliğinizi seçin
- **Azure konumu**: Bir bölge seçin (ör. `eastus`, `westeurope`)

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: New project initialized!
```

### Adım 4: Altyapı ve Servisleri Dağıtın

```bash
azd up
```

**Ne olur** (8-12 dakika sürer):
1. Container Apps ortamı oluşturulur
2. İzleme için Application Insights oluşturulur
3. API Gateway konteyneri (Node.js) oluşturulur
4. Ürün Servisi konteyneri (Python) oluşturulur
5. Her iki konteyner Azure'a dağıtılır
6. Ağ ve sağlık kontrolleri yapılandırılır
7. İzleme ve günlükleme ayarlanır

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Süre**: 8-12 dakika

### Adım 5: Dağıtımı Test Edin

```bash
# Ağ geçidi uç noktasını al
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API Gateway sağlığını test et
curl $GATEWAY_URL/health

# Beklenen çıktı:
# {"durum":"sağlıklı","hizmet":"api-gateway","zaman damgası":"2025-11-19T10:30:00Z"}
```

**Ürün servisini geçit üzerinden test edin**:
```bash
# Ürünleri listele
curl $GATEWAY_URL/api/products

# Beklenen çıktı:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Klavye","price":79.99,"stock":150}
# ]
```

**✓ Başarı Kontrolü**: Her iki uç nokta JSON verilerini hatasız döndürür.

---

**🎉 Tebrikler!** Azure'a bir mikroservis mimarisi dağıttınız!

## Proje Yapısı

Tüm uygulama dosyaları dahil—bu, eksiksiz ve çalışan bir örnektir:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Her Bileşenin İşlevi:**

**Altyapı (infra/)**:
- `main.bicep`: Tüm Azure kaynaklarını ve bağımlılıklarını düzenler
- `core/container-apps-environment.bicep`: Container Apps ortamını ve Azure Container Registry'yi oluşturur
- `core/monitor.bicep`: Dağıtılmış günlükleme için Application Insights'ı ayarlar
- `app/*.bicep`: Ölçeklendirme ve sağlık kontrolleri ile bireysel konteyner uygulama tanımları

**API Gateway (src/api-gateway/)**:
- Arka uç servislerine istekleri yönlendiren halka açık servis
- Günlükleme, hata yönetimi ve istek yönlendirme uygular
- Servisler arası HTTP iletişimini gösterir

**Ürün Servisi (src/product-service/)**:
- Ürün kataloğu ile dahili servis (basitlik için bellek içi)
- Sağlık kontrolleri ile REST API
- Arka uç mikroservis desenine örnek

## Servisler Genel Bakış

### API Gateway (Node.js/Express)

**Port**: 8080  
**Erişim**: Halka açık (harici giriş)  
**Amaç**: Gelen istekleri uygun arka uç servislere yönlendirir  

**Uç Noktalar**:
- `GET /` - Servis bilgisi
- `GET /health` - Sağlık kontrol uç noktası
- `GET /api/products` - Ürün servisine yönlendirme (tümünü listele)
- `GET /api/products/:id` - Ürün servisine yönlendirme (ID ile al)

**Temel Özellikler**:
- Axios ile istek yönlendirme
- Merkezi günlükleme
- Hata yönetimi ve zaman aşımı yönetimi
- Ortam değişkenleri ile servis keşfi
- Application Insights entegrasyonu

**Kod Vurgusu** (`src/api-gateway/app.js`):
```javascript
// Dahili hizmet iletişimi
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Ürün Servisi (Python/Flask)

**Port**: 8000  
**Erişim**: Sadece dahili (harici giriş yok)  
**Amaç**: Bellek içi veri ile ürün kataloğunu yönetir  

**Uç Noktalar**:
- `GET /` - Servis bilgisi
- `GET /health` - Sağlık kontrol uç noktası
- `GET /products` - Tüm ürünleri listele
- `GET /products/<id>` - ID ile ürün al

**Temel Özellikler**:
- Flask ile RESTful API
- Basit, veritabanı gerektirmeyen bellek içi ürün deposu
- Problarla sağlık izleme
- Yapılandırılmış günlükleme
- Application Insights entegrasyonu

**Veri Modeli**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Neden Sadece Dahili?**
Ürün servisi halka açık değildir. Tüm istekler API Gateway üzerinden geçmelidir, bu da:
- Güvenlik: Kontrollü erişim noktası
- Esneklik: Arka ucu değiştirme imkanı, istemcileri etkilemeden
- İzleme: Merkezi istek günlükleme sağlar

## Servis İletişimini Anlama

### Servisler Birbirleriyle Nasıl İletişim Kurar

Bu örnekte, API Gateway, Ürün Servisi ile **dahili HTTP çağrıları** kullanarak iletişim kurar:

```javascript
// API Geçidi (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Dahili HTTP isteği yap
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Temel Noktalar**:

1. **DNS Tabanlı Keşif**: Container Apps, dahili servisler için otomatik DNS sağlar
   - Ürün Servisi FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Basitleştirilmiş hali: `http://product-service` (Container Apps bunu çözümler)

2. **Halka Açık Olmama**: Ürün Servisi Bicep'te `external: false` olarak ayarlanmıştır
   - Sadece Container Apps ortamı içinde erişilebilir
   - İnternetten erişilemez

3. **Ortam Değişkenleri**: Servis URL'leri dağıtım sırasında enjekte edilir
   - Bicep, dahili FQDN'yi geçide iletir
   - Uygulama kodunda sabit URL'ler yoktur

**Benzerlik**: Bunu ofis odaları gibi düşünün. API Gateway resepsiyon (halka açık), Ürün Servisi ise bir ofis odasıdır (sadece dahili). Ziyaretçiler herhangi bir ofise ulaşmak için resepsiyondan geçmelidir.

## Dağıtım Seçenekleri

### Tam Dağıtım (Önerilen)

```bash
# Altyapıyı ve her iki hizmeti dağıt
azd up
```

Bu şunları dağıtır:
1. Container Apps ortamı
2. Application Insights
3. Container Registry
4. API Gateway konteyneri
5. Ürün Servisi konteyneri

**Süre**: 8-12 dakika

### Bireysel Servis Dağıtımı

```bash
# Yalnızca bir hizmet dağıtın (ilk azd up işleminden sonra)
azd deploy api-gateway

# Veya ürün hizmetini dağıtın
azd deploy product-service
```

**Kullanım Durumu**: Kodda bir serviste güncelleme yaptığınızda sadece o servisi yeniden dağıtmak istediğinizde.

### Yapılandırmayı Güncelleme

```bash
# Ölçeklendirme parametrelerini değiştir
azd env set GATEWAY_MAX_REPLICAS 30

# Yeni yapılandırma ile yeniden dağıt
azd up
```

## Yapılandırma

### Ölçeklendirme Yapılandırması

Her iki servis, Bicep dosyalarında HTTP tabanlı otomatik ölçeklendirme ile yapılandırılmıştır:

**API Gateway**:
- Minimum replikalar: 2 (her zaman en az 2, kullanılabilirlik için)
- Maksimum replikalar: 20
- Ölçek tetikleyici: Replika başına 50 eşzamanlı istek

**Ürün Servisi**:
- Minimum replikalar: 1 (gerekirse sıfıra ölçeklenebilir)
- Maksimum replikalar: 10
- Ölçek tetikleyici: Replika başına 100 eşzamanlı istek

**Ölçeklendirmeyi Özelleştirme** (`infra/app/*.bicep` içinde):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Kaynak Tahsisi

**API Gateway**:
- CPU: 1.0 vCPU
- Bellek: 2 GiB
- Sebep: Tüm harici trafiği işler

**Ürün Servisi**:
- CPU: 0.5 vCPU
- Bellek: 1 GiB
- Sebep: Hafif bellek içi işlemler

### Sağlık Kontrolleri

Her iki servis, canlılık ve hazır olma problarını içerir:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Bu Ne Anlama Geliyor**:
- **Canlılık**: Sağlık kontrolü başarısız olursa, Container Apps konteyneri yeniden başlatır
- **Hazır Olma**: Hazır değilse, Container Apps o replikaya trafik yönlendirmeyi durdurur

## İzleme ve Görünürlük

### Servis Günlüklerini Görüntüleme

```bash
# API Gateway'den günlükleri akıt
azd logs api-gateway --follow

# Son ürün hizmeti günlüklerini görüntüle
azd logs product-service --tail 100

# Her iki hizmetten tüm günlükleri görüntüle
azd logs --follow
```

**Beklenen Çıktı**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Sorguları

Azure Portal'da Application Insights'a erişin, ardından şu sorguları çalıştırın:

**Yavaş İstekleri Bul**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Servisler Arası Çağrıları İzle**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Servis Başına Hata Oranı**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Zaman İçinde İstek Hacmi**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### İzleme Panosuna Erişim

```bash
# Uygulama İçgörüleri ayrıntılarını alın
azd env get-values | grep APPLICATIONINSIGHTS

# Azure Portal izlemeyi açın
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Canlı Metrikler

1. Azure Portal'da Application Insights'a gidin
2. "Canlı Metrikler"e tıklayın
3. Gerçek zamanlı istekleri, hataları ve performansı görün
4. Test etmek için şunu çalıştırın: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Pratik Egzersizler

[Not: Dağıtım doğrulama, veri değiştirme, otomatik ölçeklendirme testleri, hata yönetimi ve üçüncü bir servis ekleme dahil olmak üzere ayrıntılı adım adım egzersizler için yukarıdaki "Pratik Egzersizler" bölümüne bakın.]

## Maliyet Analizi

### Tahmini Aylık Maliyetler (Bu 2-Servis Örneği İçin)

| Kaynak | Yapılandırma | Tahmini Maliyet |
|--------|--------------|-----------------|
| API Gateway | 2-20 replikalar, 1 vCPU, 2GB RAM | $30-150 |
| Ürün Servisi | 1-10 replikalar, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Temel seviye | $5 |
| Application Insights | 1-2 GB/ay | $5-10 |
| Log Analytics | 1 GB/ay | $3 |
| **Toplam** | | **$58-243/ay** |

**Kullanıma Göre Maliyet Dağılımı**:
- **Hafif trafik** (test/öğrenme): ~60$/ay
- **Orta trafik** (küçük üretim): ~120$/ay
- **Yoğun trafik** (yoğun dönemler): ~240$/ay

### Maliyet Optimizasyon İpuçları

1. **Geliştirme İçin Sıfıra Ölçeklendirme**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB için Tüketim Planı Kullanma** (eklediğinizde):
   - Sadece kullandığınız kadar ödeyin
   - Minimum ücret yok

3. **Application Insights Örnekleme Ayarı**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Taleplerin %50'sini örnekle
   ```

4. **Gereksiz Olduğunda Temizleme**:
   ```bash
   azd down
   ```

### Ücretsiz Katman Seçenekleri
Öğrenme/test için düşünün:
- Azure ücretsiz kredilerini kullanın (ilk 30 gün)
- Minimum replikalarla sınırlı kalın
- Testten sonra silin (devam eden ücretler yok)

---

## Temizlik

Devam eden ücretlerden kaçınmak için tüm kaynakları silin:

```bash
azd down --force --purge
```

**Onay İstemi**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Onaylamak için `y` yazın.

**Silinecekler**:
- Container Apps Ortamı
- Her iki Container App (gateway ve ürün servisi)
- Container Registry
- Application Insights
- Log Analytics Çalışma Alanı
- Kaynak Grubu

**✓ Temizliği Doğrulayın**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Boş döndürmelidir.

---

## Genişleme Rehberi: 2'den 5+ Servise

Bu 2 servisli mimariyi öğrendikten sonra, işte nasıl genişleteceğiniz:

### Aşama 1: Veritabanı Kalıcılığı Ekleme (Sonraki Adım)

**Ürün Servisi için Cosmos DB ekleyin**:

1. `infra/core/cosmos.bicep` oluşturun:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Ürün servisini, bellek içi veri yerine Cosmos DB kullanacak şekilde güncelleyin.

3. Tahmini ek maliyet: ~25$/ay (sunucusuz)

### Aşama 2: Üçüncü Servisi Ekleme (Sipariş Yönetimi)

**Sipariş Servisi Oluşturun**:

1. Yeni klasör: `src/order-service/` (Python/Node.js/C#)
2. Yeni Bicep: `infra/app/order-service.bicep`
3. API Gateway'i `/api/orders` yönlendirecek şekilde güncelleyin.
4. Sipariş kalıcılığı için Azure SQL Veritabanı ekleyin.

**Mimari şu hale gelir**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Aşama 3: Asenkron İletişim Ekleme (Service Bus)

**Olay Tabanlı Mimariyi Uygulayın**:

1. Azure Service Bus ekleyin: `infra/core/servicebus.bicep`
2. Ürün Servisi "ProductCreated" olaylarını yayınlar.
3. Sipariş Servisi ürün olaylarına abone olur.
4. Olayları işlemek için Bildirim Servisi ekleyin.

**Desen**: İstek/Cevap (HTTP) + Olay Tabanlı (Service Bus)

### Aşama 4: Kullanıcı Kimlik Doğrulama Ekleme

**Kullanıcı Servisini Uygulayın**:

1. `src/user-service/` oluşturun (Go/Node.js)
2. Azure AD B2C veya özel JWT kimlik doğrulama ekleyin.
3. API Gateway tokenları doğrular.
4. Servisler kullanıcı izinlerini kontrol eder.

### Aşama 5: Üretim Hazırlığı

**Bu Bileşenleri Ekleyin**:
- Azure Front Door (küresel yük dengeleme)
- Azure Key Vault (gizli yönetimi)
- Azure Monitor Workbooks (özel panolar)
- CI/CD Pipeline (GitHub Actions)
- Mavi-Yeşil Dağıtımlar
- Tüm servisler için Yönetilen Kimlik

**Tam Üretim Mimarisi Maliyeti**: ~300-1.400$/ay

---

## Daha Fazla Bilgi Edinin

### İlgili Belgeler
- [Azure Container Apps Belgeleri](https://learn.microsoft.com/azure/container-apps/)
- [Mikroservisler Mimari Rehberi](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Dağıtılmış İzleme için Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Bu Kursta Sonraki Adımlar
- ← Önceki: [Basit Flask API](../../../../../examples/container-app/simple-flask-api) - Başlangıç seviyesi tek konteyner örneği
- → Sonraki: [AI Entegrasyon Rehberi](../../../../../examples/docs/ai-foundry) - AI yetenekleri ekleyin
- 🏠 [Kurs Ana Sayfası](../../README.md)

### Karşılaştırma: Ne Zaman Ne Kullanılır

**Tek Container App** (Basit Flask API örneği):
- ✅ Basit uygulamalar
- ✅ Monolitik mimari
- ✅ Hızlı dağıtım
- ❌ Sınırlı ölçeklenebilirlik
- **Maliyet**: ~15-50$/ay

**Mikroservisler** (Bu örnek):
- ✅ Karmaşık uygulamalar
- ✅ Her servis için bağımsız ölçeklenebilirlik
- ✅ Takım özerkliği (farklı servisler, farklı takımlar)
- ❌ Yönetmesi daha karmaşık
- **Maliyet**: ~60-250$/ay

**Kubernetes (AKS)**:
- ✅ Maksimum kontrol ve esneklik
- ✅ Çoklu bulut taşınabilirliği
- ✅ Gelişmiş ağ oluşturma
- ❌ Kubernetes uzmanlığı gerektirir
- **Maliyet**: ~150-500$/ay minimum

**Öneri**: Container Apps ile başlayın (bu örnek), yalnızca Kubernetes'e özgü özelliklere ihtiyacınız varsa AKS'ye geçin.

---

## Sıkça Sorulan Sorular

**S: Neden sadece 2 servis, 5+ değil?**  
C: Eğitimsel ilerleme. Temel bilgileri (servis iletişimi, izleme, ölçekleme) basit bir örnekle öğrenin, ardından karmaşıklık ekleyin. Burada öğrendiğiniz desenler, 100 servisli mimarilere uygulanabilir.

**S: Daha fazla servis ekleyebilir miyim?**  
C: Kesinlikle! Yukarıdaki genişleme rehberini izleyin. Her yeni servis aynı deseni takip eder: src klasörü oluşturun, Bicep dosyası oluşturun, azure.yaml dosyasını güncelleyin, dağıtın.

**S: Bu üretime hazır mı?**  
C: Sağlam bir temel. Üretim için şunları ekleyin: yönetilen kimlik, Key Vault, kalıcı veritabanları, CI/CD pipeline, izleme uyarıları ve yedekleme stratejisi.

**S: Neden Dapr veya başka bir servis mesh kullanmıyoruz?**  
C: Öğrenme için basit tutun. Yerel Container Apps ağ oluşturmayı anladıktan sonra, gelişmiş senaryolar için Dapr ekleyebilirsiniz.

**S: Yerel olarak nasıl hata ayıklayabilirim?**  
C: Servisleri Docker ile yerel olarak çalıştırın:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**S: Farklı programlama dilleri kullanabilir miyim?**  
C: Evet! Bu örnek Node.js (gateway) + Python (ürün servisi) gösteriyor. Konteynerlerde çalışan herhangi bir dili karıştırabilirsiniz.

**S: Azure kredim yoksa ne yapmalıyım?**  
C: Azure ücretsiz katmanını kullanın (yeni hesaplarla ilk 30 gün) veya kısa test süreleri için dağıtın ve hemen silin.

---

> **🎓 Öğrenme Yolu Özeti**: Otomatik ölçekleme, dahili ağ oluşturma, merkezi izleme ve üretime hazır desenlerle çok servisli bir mimari dağıtmayı öğrendiniz. Bu temel, karmaşık dağıtık sistemler ve kurumsal mikroservis mimarileri için sizi hazırlar.

**📚 Kurs Navigasyonu:**
- ← Önceki: [Basit Flask API](../../../../../examples/container-app/simple-flask-api)
- → Sonraki: [Veritabanı Entegrasyon Örneği](../../../../../examples/database-app)
- 🏠 [Kurs Ana Sayfası](../../README.md)
- 📖 [Container Apps En İyi Uygulamalar](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->