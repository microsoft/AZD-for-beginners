# Yaygın Sorunlar ve Çözümleri

**Bölüm Gezinmesi:**
- **📚 Course Home**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki Bölüm**: [Bölüm 6: Ön Kontroller](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Hata Ayıklama Rehberi](debugging.md)
- **🚀 Next Chapter**: [Bölüm 8: Üretim ve Kurumsal Desenler](../chapter-08-production/production-ai-practices.md)

## Giriş

Bu kapsamlı sorun giderme rehberi, Azure Developer CLI kullanırken en sık karşılaşılan sorunları kapsar. Kimlik doğrulama, dağıtım, altyapı sağlama ve uygulama yapılandırmasıyla ilgili yaygın sorunları teşhis etmeyi, gidermeyi ve çözmeyi öğrenin. Her sorun için ayrıntılı belirtiler, temel nedenler ve adım adım çözüm prosedürleri yer almaktadır.

## Öğrenme Hedefleri

Bu rehberi tamamlayarak:
- Azure Developer CLI sorunları için tanılama tekniklerinde uzmanlaşacaksınız
- Yaygın kimlik doğrulama ve izin problemlerini ve çözümlerini anlayacaksınız
- Dağıtım hatalarını, altyapı sağlama hatalarını ve yapılandırma problemlerini çözebileceksiniz
- Proaktif izleme ve hata ayıklama stratejileri uygulayacaksınız
- Karmaşık problemler için sistematik sorun giderme yöntemlerini uygulayacaksınız
- Gelecekteki sorunları önlemek için uygun günlükleme ve izleme yapılandıracaksınız

## Öğrenme Çıktıları

Tamamladıktan sonra şunları yapabileceksiniz:
- Dahili tanılama araçlarını kullanarak Azure Developer CLI sorunlarını teşhis etmek
- Kimlik doğrulama, abonelik ve izinlerle ilgili problemleri bağımsız olarak çözmek
- Dağıtım hatalarını ve altyapı sağlama hatalarını etkili şekilde gidermek
- Uygulama yapılandırma sorunlarını ve ortama özgü problemleri hata ayıklamak
- Potansiyel sorunları proaktif olarak belirlemek için izleme ve uyarı uygulamak
- Günlükleme, hata ayıklama ve sorun çözme iş akışları için en iyi uygulamaları uygulamak

## Hızlı Tanılama

Belirli sorunlara girmeden önce tanısal bilgi toplamak için bu komutları çalıştırın:

```bash
# azd sürümünü ve sağlığını kontrol et
azd version
azd config show

# Azure kimlik doğrulamasını doğrula
az account show
az account list

# Mevcut ortamı kontrol et
azd env list
azd env get-values

# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd <command> --debug
```

## Kimlik Doğrulama Sorunları

### Sorun: "Erişim belirteci alınamadı"
**Belirtiler:**
- `azd up` kimlik doğrulama hatalarıyla başarısız olur
- Komutlar 'unauthorized' veya 'access denied' döndürüyor

**Çözümler:**
```bash
# Azure CLI ile yeniden kimlik doğrula
az login
az account show

# Önbellekteki kimlik bilgilerini temizle
az account clear
az login

# Cihaz kodu akışını kullan (başsız sistemler için)
az login --use-device-code

# Belirli aboneliği ayarla
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Sorun: Dağıtım sırasında "Yetersiz ayrıcalıklar"
**Belirtiler:**
- Dağıtım izin hatalarıyla başarısız olur
- Bazı Azure kaynakları oluşturulamıyor

**Çözümler:**
```bash
# 1. Azure rol atamalarınızı kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Gerekli rollere sahip olduğunuzdan emin olun
# - Katkıda Bulunan (kaynak oluşturma için)
# - Kullanıcı Erişim Yöneticisi (rol atamaları için)

# 3. Uygun izinler için Azure yöneticinizle iletişime geçin
```

### Sorun: Çok kiracılı kimlik doğrulama problemleri
**Çözümler:**
```bash
# 1. Belirli bir kiracı ile oturum aç
az login --tenant "your-tenant-id"

# 2. Yapılandırmada kiracıyı ayarla
azd config set auth.tenantId "your-tenant-id"

# 3. Kiracılar arasında geçiş yapılıyorsa kiracı önbelleğini temizle
az account clear
```

## 🏗️ Altyapı Sağlama Hataları

### Sorun: Kaynak adı çakışmaları
**Belirtiler:**
- "The resource name already exists" hataları
- Kaynak oluşturma sırasında dağıtım başarısız olur

**Çözümler:**
```bash
# 1. Belirteçlerle benzersiz kaynak adları kullanın
# Bicep şablonunuzda:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Ortam adını değiştirin
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Mevcut kaynakları temizleyin
azd down --force --purge
```

### Sorun: Konum/Bölge kullanılamıyor
**Belirtiler:**
- "The location 'xyz' is not available for resource type"
- Bazı SKU'lar seçilen bölgede mevcut değil

**Çözümler:**
```bash
# 1. Kaynak türleri için kullanılabilir konumları kontrol edin
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Yaygın olarak mevcut bölgeleri kullanın
azd config set defaults.location eastus2
# veya
azd env set AZURE_LOCATION eastus2

# 3. Bölgeye göre hizmet kullanılabilirliğini kontrol edin
# Ziyaret edin: https://azure.microsoft.com/global-infrastructure/services/
```

### Sorun: Kota aşıldı hataları
**Belirtiler:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Çözümler:**
```bash
# 1. Mevcut kota kullanımını kontrol edin
az vm list-usage --location eastus2 -o table

# 2. Azure portalı üzerinden kota artışı talep edin
# Şuraya gidin: Abonelikler > Kullanım + kotalar

# 3. Geliştirme için daha küçük SKU'lar kullanın
# main.parameters.json dosyasında:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Kullanılmayan kaynakları temizleyin
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Sorun: Bicep şablon hataları
**Belirtiler:**
- Şablon doğrulama hataları
- Bicep dosyalarında sözdizimi hataları

**Çözümler:**
```bash
# 1. Bicep sözdizimini doğrula
az bicep build --file infra/main.bicep

# 2. Bicep linter'ını kullan
az bicep lint --file infra/main.bicep

# 3. Parametre dosyası sözdizimini kontrol et
cat infra/main.parameters.json | jq '.'

# 4. Dağıtım değişikliklerini önizle
azd provision --preview
```

## 🚀 Dağıtım Hataları

### Sorun: Derleme hataları
**Belirtiler:**
- Dağıtım sırasında uygulama derlenemiyor
- Paket yükleme hataları

**Çözümler:**
```bash
# 1. Derleme çıktısını hata ayıklama bayrağıyla kontrol et
azd deploy --service web --debug

# 2. Dağıtılan hizmetin durumunu görüntüle
azd show

# 3. Derlemeyi yerel olarak test et
cd src/web
npm install
npm run build

# 3. Node.js/Python sürüm uyumluluğunu kontrol et
node --version  # azure.yaml ayarlarıyla eşleşmeli
python --version

# 4. Derleme önbelleğini temizle
rm -rf node_modules package-lock.json
npm install

# 5. Konteyner kullanıyorsanız Dockerfile'ı kontrol et
docker build -t test-image .
docker run --rm test-image
```

### Sorun: Konteyner dağıtımı hataları
**Belirtiler:**
- Konteyner uygulamaları başlatılamıyor
- İmaj çekme hataları

**Çözümler:**
```bash
# 1. Docker derlemesini yerel olarak test edin
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI kullanarak konteyner günlüklerini kontrol edin
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd aracılığıyla uygulamayı izleyin
azd monitor --logs

# 3. Konteyner kayıt defterine erişimi doğrulayın
az acr login --name myregistry

# 4. Konteyner uygulama yapılandırmasını kontrol edin
az containerapp show --name my-app --resource-group my-rg
```

### Sorun: Veritabanı bağlantı hataları
**Belirtiler:**
- Uygulama veritabanına bağlanamıyor
- Bağlantı zaman aşımı hataları

**Çözümler:**
```bash
# 1. Veritabanı güvenlik duvarı kurallarını kontrol edin
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Uygulamadan bağlantıyı test edin
# Uygulamanıza geçici olarak ekleyin:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Bağlantı dizesi biçimini doğrulayın
azd env get-values | grep DATABASE

# 4. Veritabanı sunucusu durumunu kontrol edin
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Yapılandırma Sorunları

### Sorun: Ortam değişkenleri çalışmıyor
**Belirtiler:**
- Uygulama yapılandırma değerlerini okuyamıyor
- Ortam değişkenleri boş görünüyor

**Çözümler:**
```bash
# 1. Ortam değişkenlerinin ayarlı olduğunu doğrulayın
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml içindeki değişken adlarını kontrol edin
cat azure.yaml | grep -A 5 env:

# 3. Uygulamayı yeniden başlatın
azd deploy --service web

# 4. app service yapılandırmasını kontrol edin
az webapp config appsettings list --name myapp --resource-group myrg
```

### Sorun: SSL/TLS sertifika problemleri
**Belirtiler:**
- HTTPS çalışmıyor
- Sertifika doğrulama hataları

**Çözümler:**
```bash
# 1. SSL sertifikası durumunu kontrol et
az webapp config ssl list --resource-group myrg

# 2. Sadece HTTPS'i etkinleştir
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Özel alan adı ekle (gerekirse)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Sorun: CORS yapılandırma problemleri
**Belirtiler:**
- Ön uç API'yi çağaramıyor
- Çapraz kaynak isteği engellendi

**Çözümler:**
```bash
# 1. App Service için CORS'u yapılandırın
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS'u ele almak için API'yi güncelleyin
# Express.js'te:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Doğru URL'lerde çalışıp çalışmadığını kontrol edin
azd show
```

## 🌍 Ortam Yönetimi Sorunları

### Sorun: Ortam değiştirme problemleri
**Belirtiler:**
- Yanlış ortam kullanılıyor
- Yapılandırma düzgün değişmiyor

**Çözümler:**
```bash
# 1. Tüm ortamları listele
azd env list

# 2. Ortamı açıkça seç
azd env select production

# 3. Mevcut ortamı doğrula
azd env list

# 4. Bozulduysa yeni ortam oluştur
azd env new production-new
azd env select production-new
```

### Sorun: Ortam bozulması
**Belirtiler:**
- Ortam geçersiz bir durum gösteriyor
- Kaynaklar yapılandırmayla eşleşmiyor

**Çözümler:**
```bash
# 1. Ortam durumunu yenile
azd env refresh

# 2. Ortam yapılandırmasını sıfırla
azd env new production-reset
# Gerekli ortam değişkenlerini kopyala
azd env set DATABASE_URL "your-value"

# 3. Mevcut kaynakları içe aktar (mümkünse)
# Manuel olarak .azure/production/config.json dosyasını kaynak kimlikleriyle güncelle
```

## 🔍 Performans Sorunları

### Sorun: Yavaş dağıtım süreleri
**Belirtiler:**
- Dağıtımlar çok uzun sürüyor
- Dağıtım sırasında zaman aşımı

**Çözümler:**
```bash
# 1. Daha hızlı yineleme için belirli servisleri dağıtın
azd deploy --service web
azd deploy --service api

# 2. Altyapı değişmemişse sadece kod dağıtımını kullanın
azd deploy  # azd up'dan daha hızlı

# 3. Derleme sürecini optimize edin
# package.json içinde:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kaynak konumlarını kontrol edin (aynı bölgeyi kullanın)
azd config set defaults.location eastus2
```

### Sorun: Uygulama performans problemleri
**Belirtiler:**
- Yavaş yanıt süreleri
- Yüksek kaynak kullanımı

**Çözümler:**
```bash
# 1. Kaynakları ölçeklendirin
# main.parameters.json dosyasındaki SKU'yu güncelleyin:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights izlemeyi etkinleştirin
azd monitor --overview

# 3. Azure'da uygulama günlüklerini kontrol edin
az webapp log tail --name myapp --resource-group myrg
# veya Container Apps için:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Önbellekleme uygulayın
# Altyapınıza Redis önbelleği ekleyin
```

## 🛠️ Sorun Giderme Araçları ve Komutları

### Hata Ayıklama Komutları
```bash
# Kapsamlı hata ayıklama
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd sürümünü kontrol et
azd version

# Mevcut yapılandırmayı görüntüle
azd config show

# Bağlantıyı test et
curl -v https://myapp.azurewebsites.net/health
```

### Günlük Analizi
```bash
# Azure CLI aracılığıyla uygulama günlükleri
az webapp log tail --name myapp --resource-group myrg

# azd ile uygulamayı izleyin
azd monitor --logs
azd monitor --live

# Azure kaynak günlükleri
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteyner günlükleri (Container Apps için)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Kaynak İncelemesi
```bash
# Tüm kaynakları listele
az resource list --resource-group myrg -o table

# Kaynak durumunu kontrol et
az webapp show --name myapp --resource-group myrg --query state

# Ağ tanılama
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ek Yardım Alma

### Ne Zaman Eskalasyon Yapılmalı
- Tüm çözümleri denedikten sonra kimlik doğrulama sorunları devam ediyorsa
- Azure hizmetleriyle ilgili altyapı problemleri
- Faturalama veya abonelikle ilgili sorunlar
- Güvenlik endişeleri veya olayları

### Destek Kanalları
```bash
# 1. Azure Hizmet Sağlığını Kontrol Edin
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure destek bileti oluşturun
# Şuraya gidin: https://portal.azure.com -> Yardım + destek

# 3. Topluluk kaynakları
# - Stack Overflow: azure-developer-cli etiketi
# - GitHub Sorunları: https://github.com/Azure/azure-dev/issues
# - Microsoft Soru-Cevap: https://learn.microsoft.com/en-us/answers/
```

### Toplanacak Bilgiler
Desteğe başvurmadan önce aşağıdakileri toplayın:
- `azd version` çıktısı
- `azd config show` çıktısı
- `azd show` çıktısı (mevcut dağıtım durumu)
- Hata mesajları (tam metin)
- Sorunu yeniden oluşturma adımları
- Ortam detayları (`azd env get-values`)
- Sorunun başladığı zaman çizelgesi

### Günlük Toplama Betiği
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Sorun Önleme

### Dağıtımdan Önce Kontrol Listesi
```bash
# 1. Kimlik doğrulamasını doğrulayın
az account show

# 2. Kotaları ve limitleri kontrol edin
az vm list-usage --location eastus2

# 3. Şablonları doğrulayın
az bicep build --file infra/main.bicep

# 4. Önce yerelde test edin
npm run build
npm run test

# 5. Deneme dağıtımlarını kullanın
azd provision --preview
```

### İzleme Kurulumu
```bash
# Application Insights'ı etkinleştir
# main.bicep'e ekle:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Uyarıları yapılandır
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Düzenli Bakım
```bash
# Haftalık sağlık kontrolleri
./scripts/health-check.sh

# Aylık maliyet incelemesi
az consumption usage list --billing-period-name 202401

# Üç aylık güvenlik incelemesi
az security assessment list --resource-group myrg
```

## İlgili Kaynaklar

- [Hata Ayıklama Rehberi](debugging.md) - İleri seviye hata ayıklama teknikleri
- [Kaynak Sağlama](../chapter-04-infrastructure/provisioning.md) - Altyapı sorun giderme
- [Kapasite Planlaması](../chapter-06-pre-deployment/capacity-planning.md) - Kaynak planlama rehberi
- [SKU Seçimi](../chapter-06-pre-deployment/sku-selection.md) - Hizmet katmanı önerileri

---

**İpucu**: Bu rehberi yer işaretlerine ekleyin ve sorunla karşılaştığınızda başvurun. Çoğu problem daha önce görülmüştür ve belirlenmiş çözümleri vardır!

---

**Gezinme**
- **Önceki Ders**: [Kaynak Sağlama](../chapter-04-infrastructure/provisioning.md)
- **Sonraki Ders**: [Hata Ayıklama Rehberi](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanımı sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->