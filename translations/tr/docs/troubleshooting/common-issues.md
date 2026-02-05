# Yaygın Sorunlar ve Çözümleri

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki Bölüm**: [Bölüm 6: Ön Kontroller](../pre-deployment/preflight-checks.md)
- **➡️ Sonraki**: [Hata Ayıklama Kılavuzu](debugging.md)
- **🚀 Sonraki Bölüm**: [Bölüm 8: Üretim ve Kurumsal Kalıplar](../microsoft-foundry/production-ai-practices.md)

## Giriş

Bu kapsamlı sorun giderme kılavuzu, Azure Developer CLI kullanırken en sık karşılaşılan sorunları ele alır. Kimlik doğrulama, dağıtım, altyapı oluşturma ve uygulama yapılandırmasıyla ilgili yaygın sorunları teşhis etmeyi, çözmeyi ve gidermeyi öğrenin. Her sorun için ayrıntılı belirtiler, temel nedenler ve adım adım çözüm prosedürleri sunulmaktadır.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak:
- Azure Developer CLI sorunları için teşhis tekniklerini öğrenin
- Yaygın kimlik doğrulama ve izin sorunlarını ve çözümlerini anlayın
- Dağıtım hatalarını, altyapı oluşturma hatalarını ve yapılandırma sorunlarını çözün
- Proaktif izleme ve hata ayıklama stratejileri uygulayın
- Karmaşık sorunlar için sistematik sorun giderme metodolojilerini uygulayın
- Gelecekteki sorunları önlemek için uygun günlük kaydı ve izleme yapılandırması yapın

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Azure Developer CLI sorunlarını yerleşik teşhis araçlarıyla teşhis edin
- Kimlik doğrulama, abonelik ve izinle ilgili sorunları bağımsız olarak çözün
- Dağıtım hatalarını ve altyapı oluşturma hatalarını etkili bir şekilde giderin
- Uygulama yapılandırma sorunlarını ve ortama özgü problemleri ayıklayın
- Potansiyel sorunları proaktif olarak belirlemek için izleme ve uyarı sistemleri uygulayın
- Günlük kaydı, hata ayıklama ve sorun çözme iş akışları için en iyi uygulamaları uygulayın

## Hızlı Teşhis

Belirli sorunlara dalmadan önce, teşhis bilgilerini toplamak için şu komutları çalıştırın:

```bash
# Azd sürümünü ve sağlığını kontrol et
azd version
azd config list

# Azure kimlik doğrulamasını doğrula
az account show
az account list

# Mevcut ortamı kontrol et
azd env show
azd env get-values

# Hata ayıklama günlüğünü etkinleştir
export AZD_DEBUG=true
azd <command> --debug
```

## Kimlik Doğrulama Sorunları

### Sorun: "Erişim belirteci alınamadı"
**Belirtiler:**
- `azd up` kimlik doğrulama hatalarıyla başarısız oluyor
- Komutlar "yetkisiz" veya "erişim reddedildi" hatası veriyor

**Çözümler:**
```bash
# 1. Azure CLI ile yeniden kimlik doğrulama
az login
az account show

# 2. Önbelleğe alınmış kimlik bilgilerini temizle
az account clear
az login

# 3. Cihaz kodu akışını kullan (başsız sistemler için)
az login --use-device-code

# 4. Açık bir abonelik ayarla
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Sorun: Dağıtım sırasında "Yetersiz ayrıcalıklar"
**Belirtiler:**
- Dağıtım izin hatalarıyla başarısız oluyor
- Belirli Azure kaynaklarını oluşturamıyor

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
# 1. Belirli bir kiracı ile giriş yapın
az login --tenant "your-tenant-id"

# 2. Kiracıyı yapılandırmada ayarlayın
azd config set auth.tenantId "your-tenant-id"

# 3. Kiracıları değiştiriyorsanız kiracı önbelleğini temizleyin
az account clear
```

## 🏗️ Altyapı Oluşturma Hataları

### Sorun: Kaynak adı çakışmaları
**Belirtiler:**
- "Kaynak adı zaten mevcut" hataları
- Kaynak oluşturma sırasında dağıtım başarısız oluyor

**Çözümler:**
```bash
# 1. Benzersiz kaynak adlarını jetonlarla kullanın
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
- "'xyz' konumu kaynak türü için kullanılamıyor" hatası
- Seçilen bölgede belirli SKU'lar mevcut değil

**Çözümler:**
```bash
# 1. Kaynak türleri için mevcut konumları kontrol edin
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Yaygın olarak kullanılan bölgeleri kullanın
azd config set defaults.location eastus2
# veya
azd env set AZURE_LOCATION eastus2

# 3. Hizmetin bölgeye göre kullanılabilirliğini kontrol edin
# Ziyaret edin: https://azure.microsoft.com/global-infrastructure/services/
```

### Sorun: Kota aşımı hataları
**Belirtiler:**
- "Kaynak türü için kota aşıldı" hatası
- "Maksimum kaynak sayısına ulaşıldı" hatası

**Çözümler:**
```bash
# 1. Mevcut kota kullanımını kontrol et
az vm list-usage --location eastus2 -o table

# 2. Azure portal üzerinden kota artırımı talep et
# Şuraya git: Abonelikler > Kullanım + kotalar

# 3. Geliştirme için daha küçük SKU'lar kullan
# main.parameters.json dosyasında:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Kullanılmayan kaynakları temizle
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

# 2. Bicep linter kullan
az bicep lint --file infra/main.bicep

# 3. Parametre dosyası sözdizimini kontrol et
cat infra/main.parameters.json | jq '.'

# 4. Dağıtım değişikliklerini önizle
azd provision --preview
```

## 🚀 Dağıtım Hataları

### Sorun: Derleme hataları
**Belirtiler:**
- Uygulama dağıtım sırasında derlenemiyor
- Paket yükleme hataları

**Çözümler:**
```bash
# 1. Derleme günlüklerini kontrol et
azd logs --service web
azd deploy --service web --debug

# 2. Derlemeyi yerel olarak test et
cd src/web
npm install
npm run build

# 3. Node.js/Python sürüm uyumluluğunu kontrol et
node --version  # azure.yaml ayarlarıyla eşleşmeli
python --version

# 4. Derleme önbelleğini temizle
rm -rf node_modules package-lock.json
npm install

# 5. Konteyner kullanılıyorsa Dockerfile'ı kontrol et
docker build -t test-image .
docker run --rm test-image
```

### Sorun: Konteyner dağıtım hataları
**Belirtiler:**
- Konteyner uygulamaları başlatılamıyor
- Görüntü çekme hataları

**Çözümler:**
```bash
# 1. Docker yapısını yerel olarak test et
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Konteyner günlüklerini kontrol et
azd logs --service api --follow

# 3. Konteyner kayıt defteri erişimini doğrula
az acr login --name myregistry

# 4. Konteyner uygulama yapılandırmasını kontrol et
az containerapp show --name my-app --resource-group my-rg
```

### Sorun: Veritabanı bağlantı hataları
**Belirtiler:**
- Uygulama veritabanına bağlanamıyor
- Bağlantı zaman aşımı hataları

**Çözümler:**
```bash
# 1. Veritabanı güvenlik duvarı kurallarını kontrol et
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Uygulamadan bağlantıyı test et
# Uygulamanıza geçici olarak ekleyin:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Bağlantı dizesi formatını doğrulayın
azd env get-values | grep DATABASE

# 4. Veritabanı sunucusu durumunu kontrol et
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

# 2. azure.yaml dosyasındaki değişken adlarını kontrol edin
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

# 2. Sadece HTTPS'yi etkinleştir
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Özel alan adı ekle (gerekirse)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Sorun: CORS yapılandırma problemleri
**Belirtiler:**
- Ön uç API'yi çağırmıyor
- Çapraz kaynak isteği engellendi

**Çözümler:**
```bash
# 1. Uygulama Hizmeti için CORS'u yapılandırın
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API'yi CORS'u işlemek için güncelleyin
# Express.js'de:
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
- Yapılandırma düzgün şekilde değişmiyor

**Çözümler:**
```bash
# 1. Tüm ortamları listele
azd env list

# 2. Ortamı açıkça seç
azd env select production

# 3. Mevcut ortamı doğrula
azd env show

# 4. Bozuksa yeni bir ortam oluştur
azd env new production-new
azd env select production-new
```

### Sorun: Ortam bozulması
**Belirtiler:**
- Ortam geçersiz durumda görünüyor
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
# Kaynak kimlikleriyle .azure/production/config.json dosyasını manuel olarak güncelle
```

## 🔍 Performans Sorunları

### Sorun: Yavaş dağıtım süreleri
**Belirtiler:**
- Dağıtımlar çok uzun sürüyor
- Dağıtım sırasında zaman aşımı

**Çözümler:**
```bash
# 1. Paralel dağıtımı etkinleştir
azd config set deploy.parallelism 5

# 2. Artımlı dağıtımları kullan
azd deploy --incremental

# 3. Derleme sürecini optimize et
# package.json içinde:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kaynak konumlarını kontrol et (aynı bölgeyi kullan)
azd config set defaults.location eastus2
```

### Sorun: Uygulama performans problemleri
**Belirtiler:**
- Yavaş yanıt süreleri
- Yüksek kaynak kullanımı

**Çözümler:**
```bash
# 1. Kaynakları ölçeklendirin
# Ana.parameters.json dosyasındaki SKU'yu güncelleyin:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights izlemeyi etkinleştirin
azd monitor

# 3. Darboğazlar için uygulama günlüklerini kontrol edin
azd logs --service api --follow

# 4. Önbellek uygulayın
# Altyapınıza Redis önbelleği ekleyin
```

## 🛠️ Sorun Giderme Araçları ve Komutları

### Hata Ayıklama Komutları
```bash
# Kapsamlı hata ayıklama
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Sistem bilgilerini kontrol et
azd info

# Yapılandırmayı doğrula
azd config validate

# Bağlantıyı test et
curl -v https://myapp.azurewebsites.net/health
```

### Günlük Analizi
```bash
# Uygulama günlükleri
azd logs --service web --follow
azd logs --service api --since 1h

# Azure kaynak günlükleri
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Konteyner günlükleri (Konteyner Uygulamaları için)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Kaynak İncelemesi
```bash
# Tüm kaynakları listele
az resource list --resource-group myrg -o table

# Kaynak durumunu kontrol et
az webapp show --name myapp --resource-group myrg --query state

# Ağ teşhisi
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ek Yardım Alma

### Ne Zaman Yükseltmeli
- Tüm çözümleri denedikten sonra kimlik doğrulama sorunları devam ediyorsa
- Azure hizmetleriyle ilgili altyapı problemleri
- Faturalandırma veya abonelikle ilgili sorunlar
- Güvenlik endişeleri veya olaylar

### Destek Kanalları
```bash
# 1. Azure Hizmet Sağlığını Kontrol Et
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure destek bileti oluştur
# Şuraya git: https://portal.azure.com -> Yardım + destek

# 3. Topluluk kaynakları
# - Stack Overflow: azure-developer-cli etiketi
# - GitHub Sorunları: https://github.com/Azure/azure-dev/issues
# - Microsoft Soru-Cevap: https://learn.microsoft.com/en-us/answers/
```

### Toplanacak Bilgiler
Destekle iletişime geçmeden önce şunları toplayın:
- `azd version` çıktısı
- `azd info` çıktısı
- Hata mesajları (tam metin)
- Sorunu yeniden oluşturma adımları
- Ortam detayları (`azd env show`)
- Sorunun başladığı zaman çizelgesi

### Günlük Toplama Komutu
```bash
#!/bin/bash
# hata ayıklama bilgilerini topla.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Sorun Önleme

### Dağıtım Öncesi Kontrol Listesi
```bash
# 1. Kimlik doğrulamayı doğrula
az account show

# 2. Kota ve limitleri kontrol et
az vm list-usage --location eastus2

# 3. Şablonları doğrula
az bicep build --file infra/main.bicep

# 4. Önce yerel olarak test et
npm run build
npm run test

# 5. Kuru çalıştırma dağıtımlarını kullan
azd provision --preview
```

### İzleme Kurulumu
```bash
# Uygulama İçgörülerini Etkinleştir
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

# Aylık maliyet incelemesi
az consumption usage list --billing-period-name 202401

# Üç aylık güvenlik incelemesi
az security assessment list --resource-group myrg
```

## İlgili Kaynaklar

- [Hata Ayıklama Kılavuzu](debugging.md) - Gelişmiş hata ayıklama teknikleri
- [Kaynakları Oluşturma](../deployment/provisioning.md) - Altyapı sorun giderme
- [Kapasite Planlama](../pre-deployment/capacity-planning.md) - Kaynak planlama rehberi
- [SKU Seçimi](../pre-deployment/sku-selection.md) - Hizmet katmanı önerileri

---

**İpucu**: Bu kılavuzu yer imlerine ekleyin ve sorunlarla karşılaştığınızda başvurun. Çoğu sorun daha önce görülmüş ve çözüm yolları belirlenmiştir!

---

**Gezinme**
- **Önceki Ders**: [Kaynakları Oluşturma](../deployment/provisioning.md)
- **Sonraki Ders**: [Hata Ayıklama Kılavuzu](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->