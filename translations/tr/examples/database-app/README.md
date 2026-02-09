# AZD ile Microsoft SQL Veritabanı ve Web Uygulaması Dağıtımı

⏱️ **Tahmini Süre**: 20-30 dakika | 💰 **Tahmini Maliyet**: ~$15-25/ay | ⭐ **Zorluk**: Orta

Bu **tam, çalışan örnek**, bir Python Flask web uygulamasını Microsoft SQL Veritabanı ile birlikte Azure'a dağıtmak için [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) kullanımını gösterir. Tüm kod dahildir ve test edilmiştir—harici bağımlılığa gerek yoktur.

## Öğrenecekleriniz

Bu örneği tamamlayarak:
- Altyapıyı kod olarak (infrastructure-as-code) kullanarak çok katmanlı bir uygulama (web uygulaması + veritabanı) dağıtacaksınız
- Gizli bilgileri sabit kodlamadan güvenli şekilde yapılandıracaksınız
- Uygulama sağlığını Application Insights ile izleyeceksiniz
- AZD CLI ile Azure kaynaklarını verimli yöneteceksiniz
- Güvenlik, maliyet optimizasyonu ve gözlemlenebilirlik için Azure en iyi uygulamalarını takip edeceksiniz

## Senaryo Genel Bakış
- **Web Uygulaması**: Veritabanı bağlantılı Python Flask REST API
- **Veritabanı**: Örnek verilerle Azure SQL Database
- **Altyapı**: Bicep kullanılarak temin edilir (modüler, yeniden kullanılabilir şablonlar)
- **Dağıtım**: `azd` komutları ile tamamen otomatik
- **İzleme**: Loglar ve telemetri için Application Insights

## Önkoşullar

### Gerekli Araçlar

Başlamadan önce bu araçların yüklü olduğundan emin olun:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (sürüm 2.50.0 veya üzeri)
   ```sh
   az --version
   # Beklenen çıktı: azure-cli 2.50.0 veya daha yeni
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

4. **[Docker](https://www.docker.com/get-started)** (isteğe bağlı, yerel konteynerli geliştirme için)
   ```sh
   docker --version
   # Beklenen çıktı: Docker sürümü 20.10 veya daha yüksek
   ```

### Azure Gereksinimleri

- Etkin bir **Azure aboneliği** ([ücretsiz hesap oluştur](https://azure.microsoft.com/free/))
- Aboneliğinizde kaynak oluşturma izinleri
- Abonelikte veya kaynak grubunda **Owner** veya **Contributor** rolü

### Bilgi Önkoşulları

Bu bir **orta düzey** örnektir. Aşağıları bilmeniz beklenir:
- Temel komut satırı işlemleri
- Bulut temel kavramları (kaynaklar, kaynak grupları)
- Web uygulamaları ve veritabanları hakkında temel anlayış

**AZD’ye yeni misiniz?** Önce [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) ile başlayın.

## Mimari

Bu örnek bir web uygulaması ve SQL veritabanından oluşan iki katmanlı bir mimari dağıtır:

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
- **Resource Group**: Tüm kaynakların konteyneri
- **App Service Plan**: Linux tabanlı barındırma (maliyet verimliliği için B1 katmanı)
- **Web App**: Flask uygulaması ile Python 3.11 çalışma zamanı
- **SQL Server**: TLS 1.2 minimum ile yönetilen veritabanı sunucusu
- **SQL Database**: Basic katman (2GB, geliştirme/test için uygun)
- **Application Insights**: İzleme ve loglama
- **Log Analytics Workspace**: Merkezi log depolama

**Benzetme**: Bunu, bir restoran (web uygulaması) ve bir walk-in dondurucu (veritabanı) olarak düşünebilirsiniz. Müşteriler menüden sipariş verir (API uç noktaları) ve mutfak (Flask uygulaması) malzemeleri (veri) dondurucudan alır. Restoran yöneticisi (Application Insights) olan biteni takip eder.

## Klasör Yapısı

Tüm dosyalar bu örnekte dahil—harici bağımlılık gerekmiyor:

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

**Her Dosyanın Ne Yaptığı:**
- **azure.yaml**: AZD’ye neyi, nereye dağıtacağını söyler
- **infra/main.bicep**: Tüm Azure kaynaklarını orkestre eder
- **infra/resources/*.bicep**: Bireysel kaynak tanımları (yeniden kullanım için modüler)
- **src/web/app.py**: Veritabanı mantığı içeren Flask uygulaması
- **requirements.txt**: Python paket bağımlılıkları
- **Dockerfile**: Dağıtım için konteynerleştirme talimatları

## Hızlı Başlangıç (Adım Adım)

### Adım 1: Klonla ve Gezin

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Başarı Kontrolü**: `azure.yaml` ve `infra/` klasörlerini gördüğünüzü doğrulayın:
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

### Adım 3: Ortamı Başlatma

```sh
azd init
```

**Ne olur**: AZD, dağıtımınız için yerel bir yapılandırma oluşturur.

**Görüntüleyeceğiniz istemler**:
- **Environment name**: Kısa bir ad girin (ör. `dev`, `myapp`)
- **Azure subscription**: Listeden aboneliğinizi seçin
- **Azure location**: Bir bölge seçin (ör. `eastus`, `westeurope`)

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: New project initialized!
```

### Adım 4: Azure Kaynaklarını Sağlama

```sh
azd provision
```

**Ne olur**: AZD tüm altyapıyı dağıtır (5-8 dakika sürer):
1. Resource group oluşturur
2. SQL Server ve Database oluşturur
3. App Service Plan oluşturur
4. Web App oluşturur
5. Application Insights oluşturur
6. Ağ ve güvenlik yapılandırmasını yapar

**Size sorulacaklar**:
- **SQL admin username**: Bir kullanıcı adı girin (ör. `sqladmin`)
- **SQL admin password**: Güçlü bir parola girin (bunu kaydedin!)

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Süre**: 5-8 dakika

### Adım 5: Uygulamayı Dağıtma

```sh
azd deploy
```

**Ne olur**: AZD Flask uygulamanızı derler ve dağıtır:
1. Python uygulamasını paketler
2. Docker konteynerini oluşturur
3. Azure Web App’e iter
4. Veritabanını örnek verilerle başlatır
5. Uygulamayı başlatır

**✓ Başarı Kontrolü**: Şunu görmelisiniz:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Süre**: 3-5 dakika

### Adım 6: Uygulamayı Tarayıcıda Açma

```sh
azd browse
```

Bu, dağıtılmış web uygulamanızı tarayıcıda `https://app-<unique-id>.azurewebsites.net` adresinde açar.

**✓ Başarı Kontrolü**: JSON çıktısı görmelisiniz:
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

### Adım 7: API Uç Noktalarını Test Etme

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

**Ürünleri Listele** (örnek veriler):
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

**Tek Ürün Getir**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Başarı Kontrolü**: Tüm uç noktalar JSON veri döndürmeli ve hata vermemelidir.

---

**🎉 Tebrikler!** AZD kullanarak bir veritabanıyla birlikte web uygulamasını başarıyla Azure'a dağıttınız.

## Yapılandırma Derinlemesine İnceleme

### Ortam Değişkenleri

Gizli bilgiler Azure App Service yapılandırması aracılığıyla güvenli şekilde yönetilir—**kaynak kodda asla sabit kodlanmaz**.

**AZD TARAFINDAN OTOMATİK OLARAK YAPILANDIRILIR**:
- `SQL_CONNECTION_STRING`: Şifrelenmiş kimlik bilgileriyle veritabanı bağlantısı
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: İzleme telemetri uç noktası
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Otomatik bağımlılık kurulumunu etkinleştirir

**Gizli Bilgiler Nerede Saklanır**:
1. `azd provision` sırasında SQL kimlik bilgilerini güvenli istemlerle sağlarsınız
2. AZD bunları yerel `.azure/<env-name>/.env` dosyanıza kaydeder (git-ignored)
3. AZD bunları Azure App Service yapılandırmasına enjekte eder (dinlenmede şifrelenmiş)
4. Uygulama runtime sırasında bunları `os.getenv()` ile okur

### Yerel Geliştirme

Yerel test için örnekten bir `.env` dosyası oluşturun:

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

**Yerelde test et**:
```sh
curl http://localhost:8000/health
# Beklenen: {"status": "healthy", "database": "connected"}
```

### Kod Olarak Altyapı

Tüm Azure kaynakları **Bicep şablonlarında** tanımlanmıştır (`infra/` klasörü):

- **Modüler Tasarım**: Her kaynak türü yeniden kullanılabilirlik için kendi dosyasına sahiptir
- **Parametrelendirilebilir**: SKU'ları, bölgeleri, adlandırma kurallarını özelleştirin
- **En İyi Uygulamalar**: Azure adlandırma standartları ve güvenlik varsayılanlarını takip eder
- **Sürüm Kontrolü**: Altyapı değişiklikleri Git’te izlenir

**Özelleştirme Örneği**:
Veritabanı katmanını değiştirmek için `infra/resources/sql-database.bicep` dosyasını düzenleyin:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Güvenlik En İyi Uygulamaları

Bu örnek Azure güvenlik en iyi uygulamalarını takip eder:

### 1. **Kaynak Kodunda Gizli Bilgi Yok**
- ✅ Kimlik bilgileri Azure App Service yapılandırmasında saklanır (şifrelenmiş)
- ✅ `.env` dosyaları `.gitignore` ile Git dışı bırakılır
- ✅ Gizli bilgiler provisioning sırasında güvenli parametrelerle geçirilebilir

### 2. **Şifrelenmiş Bağlantılar**
- ✅ SQL Server için en az TLS 1.2
- ✅ Web App için sadece HTTPS zorlanır
- ✅ Veritabanı bağlantıları şifreli kanallar kullanır

### 3. **Ağ Güvenliği**
- ✅ SQL Server güvenlik duvarı yalnızca Azure hizmetlerine izin verecek şekilde yapılandırılmıştır
- ✅ Genel ağ erişimi kısıtlanmıştır (Private Endpoints ile daha da sınırlandırılabilir)
- ✅ Web App üzerinde FTPS devre dışı bırakılmıştır

### 4. **Kimlik Doğrulama ve Yetkilendirme**
- ⚠️ **Mevcut**: SQL kimlik doğrulaması (kullanıcı adı/parola)
- ✅ **Üretim Önerisi**: Parolasız kimlik doğrulaması için Azure Managed Identity kullanın

**Yönetilen Kimliğe Geçiş için** (üretim için):
1. Web App üzerinde managed identity’yi etkinleştirin
2. Kimliğe SQL izinleri verin
3. Bağlantı dizesini managed identity kullanacak şekilde güncelleyin
4. Parola tabanlı kimlik doğrulamayı kaldırın

### 5. **Denetim & Uyum**
- ✅ Application Insights tüm istekleri ve hataları loglar
- ✅ SQL Database denetimi etkin (uyumluluk için yapılandırılabilir)
- ✅ Tüm kaynaklar yönetişim için etiketlenir

**Üretim Öncesi Güvenlik Kontrol Listesi**:
- [ ] Azure Defender for SQL etkinleştirin
- [ ] SQL Database için Private Endpoints yapılandırın
- [ ] Web Application Firewall (WAF) etkinleştirin
- [ ] Gizli bilgilerin döngüsel yönetimi için Azure Key Vault uygulayın
- [ ] Azure AD kimlik doğrulamayı yapılandırın
- [ ] Tüm kaynaklar için tanısal loglamayı etkinleştirin

## Maliyet Optimizasyonu

**Tahmini Aylık Maliyetler** (Kasım 2025 itibarıyla):

| Resource | SKU/Tier | Tahmini Maliyet |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/ay |
| SQL Database | Basic (2GB) | ~$5/ay |
| Application Insights | Pay-as-you-go | ~$2/ay (düşük trafik) |
| **Total** | | **~$20/ay** |

**💡 Maliyet Tasarrufu İpuçları**:

1. **Öğrenme İçin Ücretsiz Katmanı Kullanın**:
   - App Service: F1 tier (ücretsiz, sınırlı saat)
   - SQL Database: Azure SQL Database serverless kullanın
   - Application Insights: Aylık 5GB ücretsiz ingestion

2. **Kullanılmadığında Kaynakları Durdurun**:
   ```sh
   # Web uygulamasını durdur (veritabanı yine de ücretlendirilmeye devam eder)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Gerektiğinde yeniden başlat
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Testten Sonra Her Şeyi Silin**:
   ```sh
   azd down
   ```
   Bu, TÜM kaynakları kaldırır ve ücretlendirmeyi durdurur.

4. **Geliştirme ve Üretim SKU’ları Arasındaki Fark**:
   - **Geliştirme**: Bu örnekte kullanılan Basic katman
   - **Üretim**: Redundancy ile Standard/Premium katmanlar

**Maliyet İzleme**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) üzerinden maliyetleri görüntüleyin
- Sürprizleri önlemek için maliyet uyarıları kurun
- İzleme için tüm kaynakları `azd-env-name` ile etiketleyin

**Ücretsiz Katman Alternatifi**:
Öğrenme amaçlı `infra/resources/app-service-plan.bicep` dosyasını değiştirebilirsiniz:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Not**: Ücretsiz katmanın sınırlamaları vardır (günlük 60 dk CPU, sürekli açık değil).

## İzleme & Gözlemlenebilirlik

### Application Insights Entegrasyonu

Bu örnek kapsamlı izleme için **Application Insights** içerir:

**Neler İzlenir**:
- ✅ HTTP istekleri (gecikme, durum kodları, uç noktalar)
- ✅ Uygulama hataları ve istisnalar
- ✅ Flask uygulamasından özel loglama
- ✅ Veritabanı bağlantı sağlığı
- ✅ Performans metrikleri (CPU, bellek)

**Application Insights’e Erişim**:
1. [Azure Portal](https://portal.azure.com) açın
2. Resource group'unuza gidin (`rg-<env-name>`)
3. Application Insights kaynağına tıklayın (`appi-<unique-id>`)

**Yararlı Sorgular** (Application Insights → Logs):

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

**SQL Database denetimi etkin** olup şunları izler:
- Veritabanı erişim desenleri
- Başarısız giriş denemeleri
- Şema değişiklikleri
- Veri erişimi (uyumluluk için)

**Denetim Loglarına Erişim**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics workspace’te logları görüntüleyin

### Gerçek Zamanlı İzleme

**Canlı Metrikleri Görüntüle**:
1. Application Insights → Live Metrics
2. Gerçek zamanlı istekleri, hataları ve performansı görün

**Uyarılar Kurun**:
Kritik olaylar için uyarılar oluşturun:
- 5 dakika içinde HTTP 500 hataları > 5
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

#### 1. `azd provision` "Location not available" hatasıyla başarısız olur

**Belirti**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Çözüm**:
Farklı bir Azure bölgesi seçin veya kaynak sağlayıcısını kaydedin:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Dağıtım Sırasında SQL Bağlantısı Başarısız Oluyor

**Belirti**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Çözüm**:
- SQL Server güvenlik duvarının Azure hizmetlerine izin verdiğini doğrulayın (otomatik olarak yapılandırılır)
- SQL yönetici parolasının `azd provision` sırasında doğru girildiğini kontrol edin
- SQL Server'ın tamamen sağlandığından emin olun (2-3 dakika sürebilir)

**Bağlantıyı Doğrulayın**:
```sh
# Azure Portal'dan SQL Database → Sorgu düzenleyicisine gidin
# Kimlik bilgilerinizle bağlanmayı deneyin
```

#### 3. Web Uygulaması "Application Error" Gösteriyor

**Belirti**:
Tarayıcı genel bir hata sayfası gösterir.

**Çözüm**:
Uygulama günlüklerini kontrol edin:
```sh
# Son kayıtları görüntüle
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Yaygın nedenler**:
- Eksik ortam değişkenleri (App Service → Configuration bölümünü kontrol edin)
- Python paket kurulumu başarısız oldu (dağıtım günlüklerini kontrol edin)
- Veritabanı başlatma hatası (SQL bağlantısını kontrol edin)

#### 4. `azd deploy` "Build Error" ile Başarısız Oluyor

**Belirti**:
```
Error: Failed to build project
```

**Çözüm**:
- `requirements.txt` dosyasında sözdizimi hatası olmadığından emin olun
- Python 3.11'in `infra/resources/web-app.bicep` içinde belirtildiğini kontrol edin
- Dockerfile'ın doğru temel imajı içerdiğini doğrulayın

**Yerelde Hata Ayıklama**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD Komutları Çalıştırılırken "Unauthorized" Hatası

**Belirti**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Çözüm**:
Azure ile tekrar kimlik doğrulaması yapın:
```sh
azd auth login
az login
```

Abonelikte doğru izinlere sahip olduğunuzu doğrulayın (Contributor rolü).

#### 6. Yüksek Veritabanı Maliyetleri

**Belirti**:
Beklenmeyen Azure faturası.

**Çözüm**:
- Testten sonra `azd down` komutunu çalıştırmayı unuttuğunuzu kontrol edin
- SQL Database'in Basic katmanı kullandığını doğrulayın (Premium değil)
- Azure Cost Management'ta maliyetleri gözden geçirin
- Maliyet uyarıları kurun

### Yardım Alma

**Tüm AZD Ortam Değişkenlerini Görüntüle**:
```sh
azd env get-values
```

**Dağıtım Durumunu Kontrol Et**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Uygulama Günlüklerine Erişim**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Daha Fazla Yardıma mı ihtiyacınız var?**
- [AZD Sorun Giderme Rehberi](../../docs/chapter-07-troubleshooting/common-issues.md)
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
   **Beklenen**: 6-7 kaynak (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

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
   - "Live Metrics" bölümüne gidin
   - Web uygulamasında tarayıcınızı yenileyin
   **Beklenen**: İsteklerin gerçek zamanlı olarak göründüğünü görün

**Başarı Kriterleri**: Tüm 6-7 kaynak mevcut, tüm uç noktalar veri döndürüyor, Live Metrics etkinlik gösteriyor.

---

### Alıştırma 2: Yeni Bir API Uç Noktası Ekle (Orta Seviye)

**Hedef**: Flask uygulamasını yeni bir uç noktayla genişletin.

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

**Başarı Kriterleri**: Yeni uç nokta çalışıyor, filtrelenmiş sonuçlar döndürüyor, Application Insights günlüklerinde görünür.

---

### Alıştırma 3: İzleme ve Uyarılar Ekle (İleri Seviye)

**Hedef**: Uyarılarla proaktif izleme kurun.

**Adımlar**:
1. HTTP 500 hataları için bir uyarı oluşturun:
   ```sh
   # Application Insights kaynak kimliğini al
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
   # Mevcut olmayan bir ürünü talep et
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Uyarının tetiklenip tetiklenmediğini kontrol edin:
   - Azure Portal → Alerts → Alert Kuralları
   - E-postanızı kontrol edin (eğer yapılandırıldıysa)

**Başarı Kriterleri**: Uyarı kuralı oluşturuldu, hatalarda tetikleniyor, bildirimler alınıyor.

---

### Alıştırma 4: Veritabanı Şema Değişiklikleri (İleri Seviye)

**Hedef**: Yeni bir tablo ekleyin ve uygulamayı kullanacak şekilde değiştirin.

**Adımlar**:
1. Azure Portal Query Editor üzerinden SQL Veritabanına bağlanın

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

3. Yanıtlara kategori bilgisi eklemek için `src/web/app.py`'yi güncelleyin

4. Dağıtın ve test edin

**Başarı Kriterleri**: Yeni tablo mevcut, ürünler kategori bilgisi gösteriyor, uygulama hâlâ çalışıyor.

---

### Alıştırma 5: Önbellekleme Uygulayın (Uzman)

**Hedef**: Performansı artırmak için Azure Redis Cache ekleyin.

**Adımlar**:
1. `infra/main.bicep` dosyasına Redis Cache ekleyin
2. Ürün sorgularını önbelleğe almak için `src/web/app.py`'yi güncelleyin
3. Application Insights ile performans iyileşmesini ölçün
4. Önbellekleme öncesi/sonrası yanıt sürelerini karşılaştırın

**Başarı Kriterleri**: Redis dağıtıldı, önbellekleme çalışıyor, yanıt süreleri %50'den fazla iyileşti.

**İpucu**: [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/) ile başlayın.

---

## Temizlik

Süregelen ücretlerden kaçınmak için işiniz bittiğinde tüm kaynakları silin:

```sh
azd down
```

**Onay istemi**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Onaylamak için `y` tuşunu girin.

**✓ Başarı Kontrolü**: 
- Tüm kaynaklar Azure Portal'dan silindi
- Süregelen ücret yok
- Yerel `.azure/<env-name>` klasörü silinebilir

**Alternatif** (altyapıyı koru, verileri sil):
```sh
# Sadece kaynak grubunu sil (AZD yapılandırmasını koru)
az group delete --name rg-<env-name> --yes
```
## Daha Fazla Bilgi

### İlgili Dokümantasyon
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Dokümantasyonu](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Dokümantasyonu](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Dokümantasyonu](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Dil Referansı](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Bu Kursta Sonraki Adımlar
- **[Container Apps Örneği](../../../../examples/container-app)**: Azure Container Apps ile mikroservisleri dağıtın
- **[AI Entegrasyon Rehberi](../../../../docs/ai-foundry)**: Uygulamanıza yapay zeka yetenekleri ekleyin
- **[Dağıtım En İyi Uygulamaları](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Üretim dağıtımı kalıpları

### İleri Konular
- **Managed Identity**: Parolaları kaldırın ve Azure AD kimlik doğrulaması kullanın
- **Private Endpoints**: Veritabanı bağlantılarını sanal ağ içinde güvence altına alın
- **CI/CD Entegrasyonu**: Dağıtımları GitHub Actions veya Azure DevOps ile otomatikleştirin
- **Çoklu Ortam**: geliştirme, hazırlık ve üretim ortamlarını kurun
- **Veritabanı Göçleri**: Şema versiyonlaması için Alembic veya Entity Framework kullanın

### Diğer Yaklaşımlarla Karşılaştırma

**AZD vs. ARM Şablonları**:
- ✅ AZD: Daha yüksek seviyeli soyutlama, daha basit komutlar
- ⚠️ ARM: Daha ayrıntılıdır, daha ince kontrol sağlar

**AZD vs. Terraform**:
- ✅ AZD: Azure'e özgü, Azure hizmetleriyle entegre
- ⚠️ Terraform: Çoklu bulut desteği, daha geniş ekosistem

**AZD vs. Azure Portal**:
- ✅ AZD: Tekrarlanabilir, sürüm kontrollü, otomatikleştirilebilir
- ⚠️ Portal: Manuel tıklamalar, yeniden üretmesi zor

**AZD'yi şunun gibi düşünün**: Azure için Docker Compose — karmaşık dağıtımlar için basitleştirilmiş yapılandırma.

---

## Sıkça Sorulan Sorular

**Q: Farklı bir programlama dili kullanabilir miyim?**  
A: Evet! `src/web/`'i Node.js, C#, Go veya herhangi bir dille değiştirin. `azure.yaml` ve Bicep'i buna göre güncelleyin.

**Q: Nasıl daha fazla veritabanı ekleyebilirim?**  
A: `infra/main.bicep`'e başka bir SQL Database modülü ekleyin veya Azure Database hizmetlerinden PostgreSQL/MySQL kullanın.

**Q: Bunu üretim için kullanabilir miyim?**  
A: Bu bir başlangıç noktasıdır. Üretim için: managed identity, private endpoints, yedeklilik, yedekleme stratejisi, WAF ve gelişmiş izleme ekleyin.

**Q: Kod dağıtımı yerine konteyner kullanmak istersem ne olur?**  
A: Docker konteynerlerini kullanan [Container Apps Örneği](../../../../examples/container-app)'a göz atın.

**Q: Yerel makinemden veritabanına nasıl bağlanırım?**  
A: IP'nizi SQL Server güvenlik duvarına ekleyin:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Yeni bir tane oluşturmak yerine mevcut bir veritabanı kullanabilir miyim?**  
A: Evet, mevcut bir SQL Server'ı referans almak için `infra/main.bicep`'i değiştirin ve bağlantı dizesi parametrelerini güncelleyin.

---

> **Not:** Bu örnek, AZD kullanarak veritabanlı bir web uygulamasını dağıtmak için en iyi uygulamaları gösterir. Çalışır kod, kapsamlı dokümantasyon ve öğrenmeyi pekiştiren pratik alıştırmalar içerir. Üretim dağıtımları için, kuruluşunuza özgü güvenlik, ölçeklendirme, uyumluluk ve maliyet gereksinimlerini gözden geçirin.

**📚 Kurs Gezinme:**
- ← Önceki: [Container Apps Örneği](../../../../examples/container-app)
- → Sonraki: [AI Entegrasyon Rehberi](../../../../docs/ai-foundry)
- 🏠 [Kurs Anasayfa](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba gösterilse de otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hali yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu tutulamayız.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->