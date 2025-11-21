<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-20T23:38:31+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "tr"
}
-->
# Microsoft SQL Veritabanı ve Web Uygulamasını AZD ile Dağıtma

⏱️ **Tahmini Süre**: 20-30 dakika | 💰 **Tahmini Maliyet**: ~15-25$/ay | ⭐ **Zorluk Seviyesi**: Orta

Bu **tam, çalışan örnek**, [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) kullanarak bir Python Flask web uygulamasını ve Microsoft SQL Veritabanını Azure'a nasıl dağıtacağınızı gösterir. Tüm kodlar dahil edilmiştir ve test edilmiştir—harici bağımlılık gerekmez.

## Öğrenecekleriniz

Bu örneği tamamlayarak:
- Kod olarak altyapı kullanarak çok katmanlı bir uygulama (web uygulaması + veritabanı) dağıtmayı öğreneceksiniz.
- Şifreleri kodda sabitlemeden güvenli veritabanı bağlantılarını yapılandırmayı öğreneceksiniz.
- Application Insights ile uygulama sağlığını izlemeyi öğreneceksiniz.
- AZD CLI ile Azure kaynaklarını verimli bir şekilde yönetmeyi öğreneceksiniz.
- Güvenlik, maliyet optimizasyonu ve gözlemlenebilirlik için Azure en iyi uygulamalarını takip edeceksiniz.

## Senaryo Özeti
- **Web Uygulaması**: Veritabanı bağlantılı Python Flask REST API
- **Veritabanı**: Örnek veri içeren Azure SQL Veritabanı
- **Altyapı**: Bicep kullanılarak sağlanır (modüler, yeniden kullanılabilir şablonlar)
- **Dağıtım**: `azd` komutları ile tamamen otomatik
- **İzleme**: Günlükler ve telemetri için Application Insights

## Ön Koşullar

### Gerekli Araçlar

Başlamadan önce aşağıdaki araçların yüklü olduğundan emin olun:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (sürüm 2.50.0 veya üzeri)
   ```sh
   az --version
   # Beklenen çıktı: azure-cli 2.50.0 veya daha yüksek
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (sürüm 1.0.0 veya üzeri)
   ```sh
   azd version
   # Beklenen çıktı: azd sürüm 1.0.0 veya daha yüksek
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (yerel geliştirme için)
   ```sh
   python --version
   # Beklenen çıktı: Python 3.8 veya daha yüksek
   ```

4. **[Docker](https://www.docker.com/get-started)** (isteğe bağlı, yerel konteyner geliştirme için)
   ```sh
   docker --version
   # Beklenen çıktı: Docker sürümü 20.10 veya daha yüksek
   ```

### Azure Gereksinimleri

- Aktif bir **Azure aboneliği** ([ücretsiz hesap oluşturun](https://azure.microsoft.com/free/))
- Aboneliğinizde kaynak oluşturma izinleri
- Abonelik veya kaynak grubunda **Sahip** veya **Katkıda Bulunan** rolü

### Bilgi Ön Koşulları

Bu **orta seviye** bir örnektir. Aşina olmanız gerekenler:
- Temel komut satırı işlemleri
- Temel bulut kavramları (kaynaklar, kaynak grupları)
- Web uygulamaları ve veritabanları hakkında temel bilgi

**AZD'ye yeni mi?** Önce [Başlangıç Kılavuzu](../../docs/getting-started/azd-basics.md) ile başlayın.

## Mimari

Bu örnek, bir web uygulaması ve SQL veritabanı içeren iki katmanlı bir mimariyi dağıtır:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Kaynak Dağıtımı:**
- **Kaynak Grubu**: Tüm kaynaklar için konteyner
- **App Service Planı**: Linux tabanlı barındırma (B1 maliyet verimliliği için)
- **Web Uygulaması**: Flask uygulamalı Python 3.11 çalışma zamanı
- **SQL Sunucusu**: TLS 1.2 minimum ile yönetilen veritabanı sunucusu
- **SQL Veritabanı**: Temel seviye (2GB, geliştirme/test için uygun)
- **Application Insights**: İzleme ve günlükleme
- **Log Analytics Workspace**: Merkezi günlük depolama

**Benzetme**: Bunu bir restoran (web uygulaması) ve bir soğuk hava deposu (veritabanı) gibi düşünün. Müşteriler menüden sipariş verir (API uç noktaları) ve mutfak (Flask uygulaması) malzemeleri (veriler) soğuk hava deposundan alır. Restoran yöneticisi (Application Insights) olan biteni takip eder.

## Klasör Yapısı

Tüm dosyalar bu örnekte dahil edilmiştir—harici bağımlılık gerekmez:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Her Dosyanın İşlevi:**
- **azure.yaml**: AZD'ye neyin nerede dağıtılacağını söyler
- **infra/main.bicep**: Tüm Azure kaynaklarını düzenler
- **infra/resources/*.bicep**: Bireysel kaynak tanımları (yeniden kullanılabilir modüler)
- **src/web/app.py**: Veritabanı mantığı içeren Flask uygulaması
- **requirements.txt**: Python paket bağımlılıkları
- **Dockerfile**: Dağıtım için konteynerleştirme talimatları

## Hızlı Başlangıç (Adım Adım)

### Adım 1: Klonlayın ve Gezin

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Başarı Kontrolü**: `azure.yaml` ve `infra/` klasörünü gördüğünüzden emin olun:
```sh
ls
# Beklenen: README.md, azure.yaml, infra/, src/
```

### Adım 2: Azure ile Kimlik Doğrulama

```sh
azd auth login
```

Bu, Azure kimlik doğrulaması için tarayıcınızı açar. Azure kimlik bilgilerinizi kullanarak oturum açın.

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
Logged in to Azure.
```

### Adım 3: Ortamı Başlatın

```sh
azd init
```

**Ne olur**: AZD, dağıtımınız için yerel bir yapılandırma oluşturur.

**Göreceğiniz İstemler**:
- **Ortam adı**: Kısa bir ad girin (ör. `dev`, `myapp`)
- **Azure aboneliği**: Listeden aboneliğinizi seçin
- **Azure konumu**: Bir bölge seçin (ör. `eastus`, `westeurope`)

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: New project initialized!
```

### Adım 4: Azure Kaynaklarını Sağlayın

```sh
azd provision
```

**Ne olur**: AZD tüm altyapıyı dağıtır (5-8 dakika sürer):
1. Kaynak grubu oluşturur
2. SQL Sunucusu ve Veritabanı oluşturur
3. App Service Planı oluşturur
4. Web Uygulaması oluşturur
5. Application Insights oluşturur
6. Ağ ve güvenliği yapılandırır

**İstenecek Bilgiler**:
- **SQL yönetici kullanıcı adı**: Bir kullanıcı adı girin (ör. `sqladmin`)
- **SQL yönetici şifresi**: Güçlü bir şifre girin (bunu kaydedin!)

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Süre**: 5-8 dakika

### Adım 5: Uygulamayı Dağıtın

```sh
azd deploy
```

**Ne olur**: AZD Flask uygulamanızı oluşturur ve dağıtır:
1. Python uygulamasını paketler
2. Docker konteynerini oluşturur
3. Azure Web Uygulamasına gönderir
4. Örnek veri ile veritabanını başlatır
5. Uygulamayı başlatır

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Süre**: 3-5 dakika

### Adım 6: Uygulamayı Tarayıcıda Açın

```sh
azd browse
```

Bu, tarayıcıda `https://app-<benzersiz-id>.azurewebsites.net` adresinde dağıtılmış web uygulamanızı açar.

**✓ Başarı Kontrolü**: JSON çıktısını görmelisiniz:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Adım 7: API Uç Noktalarını Test Edin

**Sağlık Kontrolü** (veritabanı bağlantısını doğrulayın):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Beklenen Yanıt**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Ürünleri Listele** (örnek veri):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Beklenen Yanıt**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Tek Bir Ürünü Al**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Başarı Kontrolü**: Tüm uç noktalar hatasız JSON verisi döndürür.

---

**🎉 Tebrikler!** AZD kullanarak bir veritabanı ile web uygulamasını Azure'a başarıyla dağıttınız.

## Yapılandırma Derinlemesine

### Ortam Değişkenleri

Gizli bilgiler, Azure App Service yapılandırması aracılığıyla güvenli bir şekilde yönetilir—**asla kaynak kodda sabitlenmez**.

**AZD Tarafından Otomatik Olarak Yapılandırılır**:
- `SQL_CONNECTION_STRING`: Şifrelenmiş kimlik bilgileri ile veritabanı bağlantısı
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: İzleme telemetri uç noktası
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Otomatik bağımlılık yüklemeyi etkinleştirir

**Gizli Bilgilerin Saklandığı Yer**:
1. `azd provision` sırasında SQL kimlik bilgilerini güvenli istemler aracılığıyla sağlarsınız.
2. AZD bunları yerel `.azure/<env-name>/.env` dosyanıza kaydeder (git tarafından yok sayılır).
3. AZD bunları Azure App Service yapılandırmasına enjekte eder (dinlenme sırasında şifrelenir).
4. Uygulama bunları çalışma zamanında `os.getenv()` ile okur.

### Yerel Geliştirme

Yerel test için, örnekten bir `.env` dosyası oluşturun:

```sh
cp .env.sample .env
# .env dosyasını yerel veritabanı bağlantınızla düzenleyin
```

**Yerel Geliştirme İş Akışı**:
```sh
# Bağımlılıkları yükle
cd src/web
pip install -r requirements.txt

# Ortam değişkenlerini ayarla
export SQL_CONNECTION_STRING="your-local-connection-string"

# Uygulamayı çalıştır
python app.py
```

**Yerel Test**:
```sh
curl http://localhost:8000/health
# Beklenen: {"durum": "sağlıklı", "veritabanı": "bağlı"}
```

### Kod Olarak Altyapı

Tüm Azure kaynakları **Bicep şablonlarında** tanımlanmıştır (`infra/` klasörü):

- **Modüler Tasarım**: Her kaynak türü yeniden kullanılabilirlik için kendi dosyasına sahiptir.
- **Parametreli**: SKU'lar, bölgeler, adlandırma kuralları özelleştirilebilir.
- **En İyi Uygulamalar**: Azure adlandırma standartlarını ve güvenlik varsayılanlarını takip eder.
- **Sürüm Kontrolü**: Altyapı değişiklikleri Git'te izlenir.

**Özelleştirme Örneği**:
Veritabanı seviyesini değiştirmek için `infra/resources/sql-database.bicep` dosyasını düzenleyin:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Güvenlik En İyi Uygulamaları

Bu örnek, Azure güvenlik en iyi uygulamalarını takip eder:

### 1. **Kaynak Kodda Gizli Bilgi Yok**
- ✅ Kimlik bilgileri Azure App Service yapılandırmasında saklanır (şifrelenmiş)
- ✅ `.env` dosyaları `.gitignore` ile Git'ten hariç tutulur
- ✅ Gizli bilgiler sağlama sırasında güvenli parametreler aracılığıyla iletilir

### 2. **Şifrelenmiş Bağlantılar**
- ✅ SQL Sunucusu için minimum TLS 1.2
- ✅ Web Uygulaması için yalnızca HTTPS zorunlu
- ✅ Veritabanı bağlantıları şifreli kanallar kullanır

### 3. **Ağ Güvenliği**
- ✅ SQL Sunucusu güvenlik duvarı yalnızca Azure hizmetlerine izin verir
- ✅ Genel ağ erişimi kısıtlanmıştır (Özel Uç Noktalar ile daha fazla kilitlenebilir)
- ✅ Web Uygulamasında FTPS devre dışı

### 4. **Kimlik Doğrulama ve Yetkilendirme**
- ⚠️ **Mevcut**: SQL kimlik doğrulama (kullanıcı adı/şifre)
- ✅ **Üretim Önerisi**: Şifresiz kimlik doğrulama için Azure Yönetilen Kimlik kullanın

**Yönetilen Kimliğe Yükseltme** (üretim için):
1. Web Uygulamasında yönetilen kimliği etkinleştirin.
2. Kimliğe SQL izinleri verin.
3. Bağlantı dizesini yönetilen kimlik kullanacak şekilde güncelleyin.
4. Şifre tabanlı kimlik doğrulamayı kaldırın.

### 5. **Denetim ve Uyumluluk**
- ✅ Application Insights tüm istekleri ve hataları kaydeder.
- ✅ SQL Veritabanı denetimi etkinleştirilmiştir (uyumluluk için yapılandırılabilir).
- ✅ Tüm kaynaklar yönetişim için etiketlenmiştir.

**Üretim Öncesi Güvenlik Kontrol Listesi**:
- [ ] Azure Defender for SQL'i etkinleştirin.
- [ ] SQL Veritabanı için Özel Uç Noktalar yapılandırın.
- [ ] Web Uygulama Güvenlik Duvarı (WAF) etkinleştirin.
- [ ] Gizli bilgi döndürme için Azure Key Vault'u uygulayın.
- [ ] Azure AD kimlik doğrulamasını yapılandırın.
- [ ] Tüm kaynaklar için tanılama günlüklerini etkinleştirin.

## Maliyet Optimizasyonu

**Tahmini Aylık Maliyetler** (Kasım 2025 itibarıyla):

| Kaynak | SKU/Seviye | Tahmini Maliyet |
|--------|------------|-----------------|
| App Service Planı | B1 (Temel) | ~13$/ay |
| SQL Veritabanı | Temel (2GB) | ~5$/ay |
| Application Insights | Kullanıma göre ödeme | ~2$/ay (düşük trafik) |
| **Toplam** | | **~20$/ay** |

**💡 Maliyet Tasarruf İpuçları**:

1. **Öğrenme için Ücretsiz Seviye Kullanın**:
   - App Service: F1 seviyesi (ücretsiz, sınırlı saatler)
   - SQL Veritabanı: Azure SQL Veritabanı sunucusuz kullanın
   - Application Insights: 5GB/ay ücretsiz veri alımı

2. **Kaynakları Kullanılmadığında Durdurun**:
   ```sh
   # Web uygulamasını durdur (veritabanı hala ücret alıyor)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Gerektiğinde yeniden başlat
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Testten Sonra Her Şeyi Silin**:
   ```sh
   azd down
   ```
   Bu, TÜM kaynakları kaldırır ve ücretleri durdurur.

4. **Geliştirme ve Üretim SKU'ları**:
   - **Geliştirme**: Temel seviye (bu örnekte kullanılmıştır)
   - **Üretim**: Yedeklilik ile Standart/Premium seviye

**Maliyet İzleme**:
- Maliyetleri [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) üzerinden görüntüleyin.
- Sürprizlerden kaçınmak için maliyet uyarıları ayarlayın.
- Tüm kaynakları `azd-env-name` etiketi ile takip edin.

**Ücretsiz Seviye Alternatifi**:
Öğrenme amaçlı olarak `infra/resources/app-service-plan.bicep` dosyasını değiştirebilirsiniz:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Not**: Ücretsiz seviye sınırlamalara sahiptir (günde 60 dakika CPU, her zaman açık değil).

## İzleme ve Gözlemlenebilirlik

### Application Insights Entegrasyonu

Bu örnek, kapsamlı izleme için **Application Insights** içerir:

**İzlenenler**:
- ✅ HTTP istekleri (gecikme, durum kodları, uç noktalar)
- ✅ Uygulama hataları ve istisnalar
- ✅ Flask uygulamasından özel günlükleme
- ✅ Veritabanı bağlantı sağlığı
- ✅ Performans metrikleri (CPU, bellek)

**Application Insights'a Erişim**:
1. [Azure Portal](https://portal.azure.com) açın.
2. Kaynak grubunuza gidin (`rg-<env-name>`).
3. Application Insights kaynağına tıklayın (`appi-<benzersiz-id>`).

**Faydalı Sorgular** (Application Insights → Günlükler):

**Tüm İstekleri Görüntüle**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Hataları Bul**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Sağlık Uç Noktasını Kontrol Et**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Veritabanı Denetimi

**SQL Veritabanı denetimi etkinleştirilmiştir** ve şunları izler:
- Veritabanı erişim desenleri
- Başarısız oturum açma girişimleri
- Şema değişiklikleri
- Veri erişimi (uyumluluk için)

**Denetim Günlüklerine Erişim**:
1. Azure Portal → SQL Veritabanı → Denetim
2. Günlükleri Log Analytics çalışma alanında görüntüleyin.

### Gerçek Zamanlı İzleme

**Canlı Metrikleri Görüntüle**:
1. Application Insights → Canlı Metrikler
2. İstekleri, hataları ve performansı gerçek zamanlı olarak görün.

**Uyarılar Ayarlayın**:
Kritik olaylar için uyarılar oluşturun:
- 5 dakika içinde >5 HTTP 500 hatası
- Veritabanı bağlantı hataları
- Yüksek yanıt süreleri (>2 saniye)

**Örnek Uyarı Oluşturma**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Sorun Giderme

### Yaygın Sorunlar ve Çözümleri

#### 1. `azd provision` "Konum mevcut değil" hatasıyla başarısız oluyor

**Belirti**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Çözüm**:
Farklı bir Azure bölgesi seçin veya kaynak sağlayıcısını kaydedin:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Dağıtım sırasında SQL bağlantısı başarısız oluyor

**Belirti**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Çözüm**:
- SQL Server güvenlik duvarının Azure hizmetlerine izin verdiğinden emin olun (otomatik olarak yapılandırılır)
- `azd provision` sırasında SQL yönetici şifresinin doğru girildiğini kontrol edin
- SQL Server'ın tamamen sağlandığından emin olun (2-3 dakika sürebilir)

**Bağlantıyı Doğrula**:
```sh
# Azure Portal'dan SQL Veritabanı → Sorgu düzenleyicisine gidin
# Kimlik bilgilerinizi kullanarak bağlanmayı deneyin
```

#### 3. Web Uygulaması "Uygulama Hatası" Gösteriyor

**Belirti**:
Tarayıcı genel bir hata sayfası gösteriyor.

**Çözüm**:
Uygulama günlüklerini kontrol edin:
```sh
# Son günlükleri görüntüle
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Yaygın nedenler**:
- Eksik ortam değişkenleri (App Service → Yapılandırma bölümünü kontrol edin)
- Python paket yüklemesi başarısız oldu (dağıtım günlüklerini kontrol edin)
- Veritabanı başlatma hatası (SQL bağlantısını kontrol edin)

#### 4. `azd deploy` "Derleme Hatası" ile başarısız oluyor

**Belirti**:
```
Error: Failed to build project
```

**Çözüm**:
- `requirements.txt` dosyasında sözdizimi hatası olmadığından emin olun
- `infra/resources/web-app.bicep` dosyasında Python 3.11'in belirtildiğini kontrol edin
- Dockerfile'ın doğru temel imajı içerdiğini doğrulayın

**Yerel olarak hata ayıkla**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD Komutlarını Çalıştırırken "Yetkisiz" Hatası

**Belirti**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Çözüm**:
Azure ile yeniden kimlik doğrulaması yapın:
```sh
azd auth login
az login
```

Abonelikte doğru izinlere (Katkıda Bulunan rolü) sahip olduğunuzu doğrulayın.

#### 6. Yüksek Veritabanı Maliyetleri

**Belirti**:
Beklenmedik Azure faturası.

**Çözüm**:
- Testten sonra `azd down` komutunu çalıştırmayı unuttuğunuzu kontrol edin
- SQL Veritabanının Temel katman (Premium değil) kullandığını doğrulayın
- Azure Maliyet Yönetimi'nde maliyetleri gözden geçirin
- Maliyet uyarıları ayarlayın

### Yardım Alma

**Tüm AZD Ortam Değişkenlerini Görüntüle**:
```sh
azd env get-values
```

**Dağıtım Durumunu Kontrol Et**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Uygulama Günlüklerine Erişin**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Daha Fazla Yardım mı Gerekli?**
- [AZD Sorun Giderme Kılavuzu](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Sorun Giderme](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Sorun Giderme](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Pratik Alıştırmalar

### Alıştırma 1: Dağıtımınızı Doğrulayın (Başlangıç)

**Hedef**: Tüm kaynakların dağıtıldığını ve uygulamanın çalıştığını doğrulayın.

**Adımlar**:
1. Kaynak grubunuzdaki tüm kaynakları listeleyin:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Beklenen**: 6-7 kaynak (Web Uygulaması, SQL Server, SQL Veritabanı, App Service Planı, Application Insights, Log Analytics)

2. Tüm API uç noktalarını test edin:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Beklenen**: Hepsi hatasız geçerli JSON döndürür

3. Application Insights'ı kontrol edin:
   - Azure Portal'da Application Insights'a gidin
   - "Canlı Metrikler"e gidin
   - Web uygulamasında tarayıcınızı yenileyin
   **Beklenen**: Gerçek zamanlı olarak isteklerin göründüğünü görün

**Başarı Kriterleri**: Tüm 6-7 kaynak mevcut, tüm uç noktalar veri döndürüyor, Canlı Metrikler etkinlik gösteriyor.

---

### Alıştırma 2: Yeni Bir API Uç Noktası Ekleyin (Orta Seviye)

**Hedef**: Flask uygulamasına yeni bir uç nokta ekleyin.

**Başlangıç Kodu**: `src/web/app.py` içindeki mevcut uç noktalar

**Adımlar**:
1. `src/web/app.py` dosyasını düzenleyin ve `get_product()` fonksiyonundan sonra yeni bir uç nokta ekleyin:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Güncellenmiş uygulamayı dağıtın:
   ```sh
   azd deploy
   ```

3. Yeni uç noktayı test edin:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Beklenen**: "laptop" ile eşleşen ürünleri döndürür

**Başarı Kriterleri**: Yeni uç nokta çalışıyor, filtrelenmiş sonuçlar döndürüyor, Application Insights günlüklerinde görünüyor.

---

### Alıştırma 3: İzleme ve Uyarılar Ekleyin (İleri Seviye)

**Hedef**: Uyarılarla proaktif izleme ayarlayın.

**Adımlar**:
1. HTTP 500 hataları için bir uyarı oluşturun:
   ```sh
   # Uygulama İçgörüleri kaynak kimliğini alın
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Uyarı oluştur
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Hatalar oluşturarak uyarıyı tetikleyin:
   ```sh
   # Mevcut olmayan bir ürün isteyin
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Uyarının tetiklenip tetiklenmediğini kontrol edin:
   - Azure Portal → Uyarılar → Uyarı Kuralları
   - E-postanızı kontrol edin (eğer yapılandırıldıysa)

**Başarı Kriterleri**: Uyarı kuralı oluşturuldu, hatalarda tetikleniyor, bildirimler alınıyor.

---

### Alıştırma 4: Veritabanı Şeması Değişiklikleri (İleri Seviye)

**Hedef**: Yeni bir tablo ekleyin ve uygulamayı bunu kullanacak şekilde değiştirin.

**Adımlar**:
1. Azure Portal Sorgu Editörü aracılığıyla SQL Veritabanına bağlanın

2. Yeni bir `categories` tablosu oluşturun:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. `src/web/app.py` dosyasını güncelleyerek yanıtların kategori bilgisini içermesini sağlayın

4. Dağıtın ve test edin

**Başarı Kriterleri**: Yeni tablo mevcut, ürünler kategori bilgisi gösteriyor, uygulama hala çalışıyor.

---

### Alıştırma 5: Önbellekleme Uygulayın (Uzman)

**Hedef**: Performansı artırmak için Azure Redis Cache ekleyin.

**Adımlar**:
1. `infra/main.bicep` dosyasına Redis Cache ekleyin
2. `src/web/app.py` dosyasını ürün sorgularını önbelleğe alacak şekilde güncelleyin
3. Application Insights ile performans iyileştirmesini ölçün
4. Önbellekleme öncesi/sonrası yanıt sürelerini karşılaştırın

**Başarı Kriterleri**: Redis dağıtıldı, önbellekleme çalışıyor, yanıt süreleri %50'den fazla iyileşti.

**İpucu**: [Azure Cache for Redis belgeleri](https://learn.microsoft.com/azure/azure-cache-for-redis/) ile başlayın.

---

## Temizlik

Devam eden ücretlerden kaçınmak için işiniz bittiğinde tüm kaynakları silin:

```sh
azd down
```

**Onay istemi**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` yazın ve onaylayın.

**✓ Başarı Kontrolü**: 
- Tüm kaynaklar Azure Portal'dan silindi
- Devam eden ücret yok
- Yerel `.azure/<env-name>` klasörü silinebilir

**Alternatif** (altyapıyı koruyun, verileri silin):
```sh
# Yalnızca kaynak grubunu sil (AZD yapılandırmasını koru)
az group delete --name rg-<env-name> --yes
```
## Daha Fazla Bilgi Edinin

### İlgili Belgeler
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Veritabanı Belgeleri](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Belgeleri](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Belgeleri](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Dil Referansı](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Bu Kursta Sonraki Adımlar
- **[Container Apps Örneği](../../../../examples/container-app)**: Azure Container Apps ile mikro hizmetler dağıtın
- **[AI Entegrasyon Kılavuzu](../../../../docs/ai-foundry)**: Uygulamanıza yapay zeka yetenekleri ekleyin
- **[Dağıtım En İyi Uygulamaları](../../docs/deployment/deployment-guide.md)**: Üretim dağıtım desenleri

### İleri Konular
- **Yönetilen Kimlik**: Şifreleri kaldırın ve Azure AD kimlik doğrulamasını kullanın
- **Özel Uç Noktalar**: Sanal ağ içinde güvenli veritabanı bağlantıları
- **CI/CD Entegrasyonu**: GitHub Actions veya Azure DevOps ile dağıtımları otomatikleştirin
- **Çoklu Ortam**: Geliştirme, test ve üretim ortamlarını ayarlayın
- **Veritabanı Geçişleri**: Şema sürümlendirme için Alembic veya Entity Framework kullanın

### Diğer Yaklaşımlarla Karşılaştırma

**AZD vs. ARM Şablonları**:
- ✅ AZD: Daha yüksek seviyeli soyutlama, daha basit komutlar
- ⚠️ ARM: Daha ayrıntılı, daha ince kontrol

**AZD vs. Terraform**:
- ✅ AZD: Azure'a özgü, Azure hizmetleriyle entegre
- ⚠️ Terraform: Çoklu bulut desteği, daha geniş ekosistem

**AZD vs. Azure Portal**:
- ✅ AZD: Tekrarlanabilir, sürüm kontrollü, otomatikleştirilebilir
- ⚠️ Portal: Manuel tıklamalar, yeniden üretmek zor

**AZD'yi şu şekilde düşünün**: Azure için Docker Compose—karmaşık dağıtımlar için basitleştirilmiş yapılandırma.

---

## Sıkça Sorulan Sorular

**S: Farklı bir programlama dili kullanabilir miyim?**  
C: Evet! `src/web/` dizinini Node.js, C#, Go veya herhangi bir dille değiştirin. `azure.yaml` ve Bicep dosyalarını buna göre güncelleyin.

**S: Daha fazla veritabanı nasıl eklerim?**  
C: `infra/main.bicep` dosyasına başka bir SQL Veritabanı modülü ekleyin veya Azure Veritabanı hizmetlerinden PostgreSQL/MySQL kullanın.

**S: Bunu üretimde kullanabilir miyim?**  
C: Bu bir başlangıç noktasıdır. Üretim için: yönetilen kimlik, özel uç noktalar, yedeklilik, yedekleme stratejisi, WAF ve gelişmiş izleme ekleyin.

**S: Kod dağıtımı yerine konteyner kullanmak istersem ne yapmalıyım?**  
C: [Container Apps Örneği](../../../../examples/container-app) bölümüne göz atın; baştan sona Docker konteynerleri kullanır.

**S: Veritabanına yerel makinemden nasıl bağlanırım?**  
C: IP adresinizi SQL Server güvenlik duvarına ekleyin:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**S: Yeni bir veritabanı oluşturmak yerine mevcut bir veritabanını kullanabilir miyim?**  
C: Evet, `infra/main.bicep` dosyasını mevcut bir SQL Server'ı referans alacak şekilde değiştirin ve bağlantı dizesi parametrelerini güncelleyin.

---

> **Not:** Bu örnek, bir veritabanı ile bir web uygulaması dağıtımı için en iyi uygulamaları göstermektedir. Çalışan kod, kapsamlı belgeler ve öğrenmeyi pekiştirmek için pratik alıştırmalar içerir. Üretim dağıtımları için, kuruluşunuza özgü güvenlik, ölçeklendirme, uyumluluk ve maliyet gereksinimlerini gözden geçirin.

**📚 Kurs Navigasyonu:**
- ← Önceki: [Container Apps Örneği](../../../../examples/container-app)
- → Sonraki: [AI Entegrasyon Kılavuzu](../../../../docs/ai-foundry)
- 🏠 [Kurs Ana Sayfası](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->