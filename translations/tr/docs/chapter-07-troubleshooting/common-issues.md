# Yaygın Sorunlar ve Çözümler

**Bölüm Gezinme:**
- **📚 Kurs Anasayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Güncel Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki Bölüm**: [Bölüm 6: Uçuş Öncesi Kontroller](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Sonraki**: [Hata Ayıklama Rehberi](debugging.md)
- **🚀 Sonraki Bölüm**: [Bölüm 8: Üretim ve Kurumsal Desenler](../chapter-08-production/production-ai-practices.md)

## Giriş

Bu kapsamlı sorun giderme rehberi, Azure Developer CLI kullanırken en sık karşılaşılan sorunları kapsar. Kimlik doğrulama, dağıtım, altyapı sağlama ve uygulama yapılandırması ile ilgili yaygın sorunları teşhis etmeyi, gidermeyi ve çözmeyi öğrenin. Her sorun için belirtiler, temel nedenler ve adım adım çözüm prosedürleri yer almaktadır.

## Öğrenme Hedefleri

Bu rehberi tamamlayarak:
- Azure Developer CLI sorunları için teşhis tekniklerinde ustalaşacaksınız
- Yaygın kimlik doğrulama ve izin problemlerini ve çözümlerini anlayacaksınız
- Dağıtım hatalarını, altyapı sağlama hatalarını ve yapılandırma sorunlarını çözeceksiniz
- Proaktif izleme ve hata ayıklama stratejileri uygulayacaksınız
- Karmaşık sorunlar için sistematik sorun giderme metodolojileri uygulayacaksınız
- Gelecekteki sorunları önlemek için uygun günlükleme ve izleme yapılandıracaksınız

## Öğrenme Çıktıları

Tamamladıktan sonra şunları yapabileceksiniz:
- Yerleşik tanılama araçlarını kullanarak Azure Developer CLI sorunlarını teşhis etmek
- Kimlik doğrulama, abonelik ve izinle ilgili problemleri bağımsız olarak çözmek
- Dağıtım hatalarını ve altyapı sağlama hatalarını etkili bir şekilde gidermek
- Uygulama yapılandırma sorunlarını ve ortama özgü problemleri hata ayıklamak
- Potansiyel sorunları proaktif olarak tespit etmek için izleme ve uyarı uygulamak
- Günlükleme, hata ayıklama ve sorun çözme iş akışları için en iyi uygulamaları uygulamak

## Hızlı Teşhis

Spesifik sorunlara dalmadan önce, tanılama bilgilerini toplamak için bu komutları çalıştırın:

```bash
# azd sürümünü ve sağlığını kontrol et
azd version
azd config list

# Azure kimlik doğrulamasını doğrula
az account show
az account list

# Geçerli ortamı kontrol et
azd env show
azd env get-values

# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd <command> --debug
```

## Kimlik Doğrulama Sorunları

### Sorun: "Erişim belirteci alınamadı"
**Belirtiler:**
- `azd up` kimlik doğrulama hataları ile başarısız oluyor
- Komutlar "unauthorized" veya "access denied" döndürüyor

**Çözümler:**
```bash
# 1. Azure CLI ile yeniden kimlik doğrulaması yapın
az login
az account show

# 2. Önbelleğe alınmış kimlik bilgilerini temizleyin
az account clear
az login

# 3. Cihaz kodu akışını kullanın (başsız sistemler için)
az login --use-device-code

# 4. Belirli aboneliği ayarlayın
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Sorun: Dağıtım sırasında "Yetersiz ayrıcalıklar"
**Belirtiler:**
- Dağıtım izin hatalarıyla başarısız oluyor
- Belirli Azure kaynaklarını oluşturulamıyor

**Çözümler:**
```bash
# 1. Azure rol atamalarınızı kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Gerekli rollere sahip olduğunuzdan emin olun
# - Katkıda Bulunan (kaynak oluşturma için)
# - Kullanıcı Erişim Yöneticisi (rol atamaları için)

# 3. Doğru izinler için Azure yöneticinizle iletişime geçin
```

### Sorun: Çok kiracılı kimlik doğrulama problemleri
**Çözümler:**
```bash
# 1. Belirli bir kiracı ile giriş yapın
az login --tenant "your-tenant-id"

# 2. Yapılandırmada kiracıyı ayarlayın
azd config set auth.tenantId "your-tenant-id"

# 3. Kiracı değiştiriliyorsa kiracı önbelleğini temizleyin
az account clear
```

## 🏗️ Altyapı Sağlama Hataları

### Sorun: Kaynak adı çakışmaları
**Belirtiler:**
- "The resource name already exists" hataları
- Kaynak oluşturma sırasında dağıtım başarısız oluyor

**Çözümler:**
```bash
# 1. Tokenlerle benzersiz kaynak adları kullanın
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
- Seçilen bölgede bazı SKU'lar mevcut değil

**Çözümler:**
```bash
# 1. Kaynak türleri için kullanılabilir konumları kontrol edin
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Yaygın olarak kullanılabilen bölgeleri kullanın
azd config set defaults.location eastus2
# veya
azd env set AZURE_LOCATION eastus2

# 3. Hizmet kullanılabilirliğini bölgeye göre kontrol edin
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
# Şuraya gidin: Abonelikler > Kullanım + kotlar

# 3. Geliştirme için daha küçük SKU'lar kullanın
# main.parameters.json içinde:
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
# 1. Bicep sözdizimini doğrulayın
az bicep build --file infra/main.bicep

# 2. Bicep linter'ını kullanın
az bicep lint --file infra/main.bicep

# 3. Parametre dosyası sözdizimini kontrol edin
cat infra/main.parameters.json | jq '.'

# 4. Dağıtım değişikliklerini önizleyin
azd provision --preview
```

## 🚀 Dağıtım Hataları

### Sorun: Derleme hataları
**Belirtiler:**
- Dağıtım sırasında uygulama derlenemiyor
- Paket yükleme hataları

**Çözümler:**
```bash
# 1. Hata ayıklama bayrağı ile derleme çıktısını kontrol edin
azd deploy --service web --debug

# 2. Dağıtılan hizmet durumunu görüntüleyin
azd show

# 3. Derlemeyi yerel olarak test edin
cd src/web
npm install
npm run build

# 3. Node.js/Python sürüm uyumluluğunu kontrol edin
node --version  # azure.yaml ayarlarıyla eşleşmelidir
python --version

# 4. Build önbelleğini temizleyin
rm -rf node_modules package-lock.json
npm install

# 5. Konteyner kullanılıyorsa Dockerfile'ı kontrol edin
docker build -t test-image .
docker run --rm test-image
```

### Sorun: Konteyner dağıtım hataları
**Belirtiler:**
- Konteyner uygulamaları başlatılamıyor
- Görüntü çekme hataları

**Çözümler:**
```bash
# 1. Docker derlemesini yerel olarak test et
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI kullanarak kapsayıcı günlüklerini kontrol et
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd aracılığıyla uygulamayı izle
azd monitor --logs

# 3. Kapsayıcı kayıt defteri erişimini doğrula
az acr login --name myregistry

# 4. Kapsayıcı uygulama yapılandırmasını kontrol et
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

# 3. Bağlantı dizesi formatını doğrulayın
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
# 1. Ortam değişkenlerinin ayarlandığını doğrulayın
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml içindeki değişken adlarını kontrol edin
cat azure.yaml | grep -A 5 env:

# 3. Uygulamayı yeniden başlatın
azd deploy --service web

# 4. Uygulama hizmeti yapılandırmasını kontrol edin
az webapp config appsettings list --name myapp --resource-group myrg
```

### Sorun: SSL/TLS sertifika problemleri
**Belirtiler:**
- HTTPS çalışmıyor
- Sertifika doğrulama hataları

**Çözümler:**
```bash
# 1. SSL sertifika durumunu kontrol et
az webapp config ssl list --resource-group myrg

# 2. Yalnızca HTTPS'i etkinleştir
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Özel alan adı ekle (gerekirse)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Sorun: CORS yapılandırma problemleri
**Belirtiler:**
- Frontend API'yi çağrıyamıyor
- Çapraz kaynak isteği engelleniyor

**Çözümler:**
```bash
# 1. App Service için CORS'u yapılandırın
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API'yi CORS'u ele alacak şekilde güncelleyin
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

# 3. Geçerli ortamı doğrula
azd env show

# 4. Bozulmuşsa yeni bir ortam oluştur
azd env new production-new
azd env select production-new
```

### Sorun: Ortam bozulması
**Belirtiler:**
- Ortam geçersiz bir durum gösteriyor
- Kaynaklar yapılandırmayla uyuşmuyor

**Çözümler:**
```bash
# 1. Ortam durumunu yenile
azd env refresh

# 2. Ortam yapılandırmasını sıfırla
azd env new production-reset
# Gerekli ortam değişkenlerini kopyala
azd env set DATABASE_URL "your-value"

# 3. Mevcut kaynakları içe aktar (mümkünse)
# Kaynak kimlikleriyle .azure/production/config.json dosyasını elle güncelle
```

## 🔍 Performans Sorunları

### Sorun: Yavaş dağıtım süreleri
**Belirtiler:**
- Dağıtımlar çok uzun sürüyor
- Dağıtım sırasında zaman aşımı

**Çözümler:**
```bash
# 1. Daha hızlı yineleme için belirli hizmetleri dağıtın
azd deploy --service web
azd deploy --service api

# 2. Altyapı değişmediğinde yalnızca kod dağıtımı kullanın
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
# main.parameters.json içindeki SKU'yu güncelle:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights izlemeyi etkinleştirin
azd monitor --overview

# 3. Azure'daki uygulama günlüklerini kontrol edin
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
azd config list

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

# Ağ teşhisleri
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ek Yardım Alma

### Ne Zaman Yükseltmelisiniz
- Tüm çözümleri denedikten sonra kimlik doğrulama sorunları devam ediyorsa
- Azure hizmetleriyle ilgili altyapı sorunları varsa
- Faturalama veya abonelikle ilgili problemler varsa
- Güvenlik endişeleri veya olayları varsa

### Destek Kanalları
```bash
# 1. Azure Service Health'i kontrol edin
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure destek talebi oluşturun
# Şuraya gidin: https://portal.azure.com -> Yardım + destek

# 3. Topluluk kaynakları
# - Stack Overflow: azure-developer-cli etiketi
# - GitHub Sorunları: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Toplamanız Gereken Bilgiler
Destekle iletişime geçmeden önce şu bilgileri toplayın:
- `azd version` çıktı
- `azd config list` çıktı
- `azd show` çıktı (mevcut dağıtım durumu)
- Hata mesajları (tam metin)
- Sorunu yeniden oluşturma adımları
- Ortam detayları (`azd env show`)
- Sorunun ne zaman başladığının zaman çizelgesi

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
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Sorun Önleme

### Dağıtım Öncesi Kontrol Listesi
```bash
# 1. Kimlik doğrulamasını doğrulayın
az account show

# 2. Kotaları ve sınırları kontrol edin
az vm list-usage --location eastus2

# 3. Şablonları doğrulayın
az bicep build --file infra/main.bicep

# 4. Önce yerel olarak test edin
npm run build
npm run test

# 5. Deneme dağıtımlarını kullanın
azd provision --preview
```

### İzleme Kurulumu
```bash
# Application Insights'i etkinleştir
# main.bicep'e ekle:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Uyarıları ayarla
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

# Aylık maliyet gözden geçirme
az consumption usage list --billing-period-name 202401

# Üç aylık güvenlik incelemesi
az security assessment list --resource-group myrg
```

## İlgili Kaynaklar

- [Hata Ayıklama Rehberi](debugging.md) - Gelişmiş hata ayıklama teknikleri
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Altyapı sorun giderme
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Kaynak planlama rehberi
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Servis katmanı önerileri

---

**İpucu**: Bu rehberi yer işaretlerinize ekleyin ve bir sorunla karşılaştığınızda başvurun. Çoğu problem daha önce görülmüştür ve yerleşik çözümleri vardır!

---

**Gezinme**
- **Önceki Ders**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **Sonraki Ders**: [Hata Ayıklama Rehberi](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Önemli bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlaşılma veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->