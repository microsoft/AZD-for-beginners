# Komut Hızlı Referansı - Temel AZD Komutları

**Tüm Bölümler İçin Hızlı Başvuru**
- **📚 Kurs Ana Sayfası**: [Yeni Başlayanlar İçin AZD](../README.md)
- **📖 Hızlı Başlangıç**: [Bölüm 1: Temel ve Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Komutları**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Gelişmiş**: [Bölüm 4: Altyapı Kod Olarak](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Giriş

Bu kapsamlı kısa başvuru, en yaygın kullanılan Azure Developer CLI komutları için kategoriye göre düzenlenmiş pratik örneklerle hızlı bir referans sağlar. azd projeleriyle geliştirme yaparken, sorun giderirken ve günlük işlemler sırasında hızlıca bakmak için idealdir.

## Öğrenme Hedefleri

Bu kısa başvuru sayfasını kullanarak:
- Temel Azure Developer CLI komutlarına ve sözdizimine anında erişim sahibi olun
- Komutların işlevsel kategorilere ve kullanım senaryolarına göre nasıl organize edildiğini anlayın
- Yaygın geliştirme ve dağıtım senaryoları için pratik örneklere başvurun
- Hızlı sorun çözümü için teşhis komutlarına erişin
- Gelişmiş yapılandırma ve özelleştirme seçeneklerini verimli şekilde bulun
- Ortam yönetimi ve çoklu ortam iş akışı komutlarını hızlıca bulun

## Öğrenme Çıktıları

Bu kısa başvuruyu düzenli olarak kullanarak şunları yapabileceksiniz:
- azd komutlarını tam belgelere bakmadan güvenle çalıştırın
- Uygun teşhis komutlarını kullanarak yaygın sorunları hızlıca çözün
- Birden çok ortamı ve dağıtım senaryosunu verimli şekilde yönetin
- Gerektiğinde gelişmiş azd özelliklerini ve yapılandırma seçeneklerini uygulayın
- Dağıtım sorunlarını sistematik komut dizileriyle giderin
- azd kısayol ve seçeneklerini etkili kullanarak iş akışlarını optimize edin

## Başlarken Komutları

### Kimlik Doğrulama
```bash
# AZD aracılığıyla Azure'a giriş
azd auth login

# Azure CLI'ye giriş (AZD bunu arka planda kullanır)
az login

# Mevcut hesabı kontrol et
az account show

# Varsayılan aboneliği ayarla
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD'den çıkış yap
azd auth logout

# Azure CLI'den çıkış yap
az logout
```

### Proje Başlatma
```bash
# Mevcut şablonlara göz at
azd template list

# Şablondan başlat
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Geçerli dizinde başlat
azd init .

# Özel isimle başlat
azd init --template todo-nodejs-mongo my-awesome-app
```

## Çekirdek Dağıtım Komutları

### Tam Dağıtım İş Akışı
```bash
# Her şeyi dağıt (kaynak sağlama + dağıtım)
azd up

# Onay istemleri devre dışı bırakılmış şekilde dağıt
azd up --confirm-with-no-prompt

# Belirli bir ortama dağıt
azd up --environment production

# Özel parametrelerle dağıt
azd up --parameter location=westus2
```

### Sadece Altyapı
```bash
# Azure kaynaklarını sağla
azd provision

# 🧪 Altyapı değişikliklerini önizle
azd provision --preview
# Hangi kaynakların oluşturulacağını/değiştirileceğini/silineceğini gösteren bir kuru çalıştırma görünümü sunar
# 'terraform plan' veya 'bicep what-if' ile benzer — çalıştırmak güvenlidir, hiçbir değişiklik uygulanmaz
```

### Sadece Uygulama
```bash
# Uygulama kodunu dağıt
azd deploy

# Belirli bir servisi dağıt
azd deploy --service web
azd deploy --service api

# Tüm servisleri dağıt
azd deploy --all
```

### Derleme ve Paketleme
```bash
# Uygulamaları oluşturun
azd package

# Belirli bir servisi oluşturun
azd package --service api
```

## 🌍 Ortam Yönetimi

### Ortam İşlemleri
```bash
# Tüm ortamları listele
azd env list

# Yeni ortam oluştur
azd env new development
azd env new staging --location westus2

# Ortam seç
azd env select production

# Mevcut ortamı göster
azd env show

# Ortam durumunu yenile
azd env refresh
```

### Ortam Değişkenleri
```bash
# Ortam değişkeni ayarla
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Ortam değişkenini al
azd env get API_KEY

# Tüm ortam değişkenlerini listele
azd env get-values

# Ortam değişkenini kaldır
azd env unset DEBUG
```

## ⚙️ Yapılandırma Komutları

### Genel Yapılandırma
```bash
# Tüm yapılandırmaları listele
azd config list

# Küresel varsayılanları ayarla
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Yapılandırmayı kaldır
azd config unset defaults.location

# Tüm yapılandırmaları sıfırla
azd config reset
```

### Proje Yapılandırması
```bash
# azure.yaml dosyasını doğrula
azd config validate

# Proje bilgilerini göster
azd show

# Servis uç noktalarını al
azd show --output json
```

## 📊 İzleme ve Teşhis

### İzleme Panosu
```bash
# Azure portalındaki izleme panosunu aç
azd monitor

# Application Insights canlı metriklerini aç
azd monitor --live

# Application Insights günlükler bölümünü aç
azd monitor --logs

# Application Insights genel bakışını aç
azd monitor --overview
```

### Konteyner Günlüklerini Görüntüleme
```bash
# Azure CLI aracılığıyla günlükleri görüntüle (Container Apps için)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Günlükleri gerçek zamanlı olarak takip et
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal'dan günlükleri görüntüle
azd monitor --logs
```

### Log Analytics Sorguları
```bash
# Azure Portal üzerinden Log Analytics'e erişin
azd monitor --logs

# Azure CLI kullanarak günlükleri sorgulayın
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Bakım Komutları

### Temizlik
```bash
# Tüm Azure kaynaklarını sil
azd down

# Onay olmadan zorla sil
azd down --force

# Geçici olarak silinmiş kaynakları kalıcı olarak sil
azd down --purge

# Temizliği tamamla
azd down --force --purge
```

### Güncellemeler
```bash
# azd güncellemelerini kontrol et
azd version

# Mevcut sürümü al
azd version

# Mevcut yapılandırmayı görüntüle
azd config list
```

## 🔧 Gelişmiş Komutlar

### Pipeline ve CI/CD
```bash
# GitHub Actions'ı yapılandır
azd pipeline config

# Azure DevOps'u yapılandır
azd pipeline config --provider azdo

# Pipeline yapılandırmasını göster
azd pipeline show
```

### Altyapı Yönetimi
```bash
# Altyapı şablonları oluştur
azd infra generate

# 🧪 Altyapı Önizleme ve Planlama
azd provision --preview
# Dağıtım yapmadan altyapı sağlamayı simüle eder
# Bicep/Terraform şablonlarını analiz eder ve şunları gösterir:
# - Eklenecek kaynaklar (yeşil +)
# - Değiştirilecek kaynaklar (sarı ~)
# - Silinecek kaynaklar (kırmızı -)
# Çalıştırmak güvenlidir - Azure ortamında gerçek değişiklik yapılmaz

# azure.yaml'den altyapıyı sentezle
azd infra synth
```

### Proje Bilgisi
```bash
# Proje durumunu ve uç noktalarını göster
azd show

# Ayrıntılı proje bilgisini JSON olarak göster
azd show --output json

# Hizmet uç noktalarını al
azd show --output json | jq '.services'
```

## 🎯 Hızlı İş Akışları

### Geliştirme İş Akışı
```bash
# Yeni proje başlat
azd init --template todo-nodejs-mongo
cd my-project

# Geliştirme ortamına dağıt
azd env new dev
azd up

# Değişiklik yap ve yeniden dağıt
azd deploy

# İzleme panosunu aç
azd monitor --live
```

### Çoklu Ortam İş Akışı
```bash
# Ortamları kur
azd env new dev
azd env new staging  
azd env new production

# Geliştirme ortamına dağıt
azd env select dev
azd up

# Test et ve hazırlık ortamına aktar
azd env select staging
azd up

# Üretim ortamına dağıt
azd env select production
azd up
```

### Sorun Giderme İş Akışı
```bash
# Hata ayıklama modunu etkinleştir
export AZD_DEBUG=true

# Dağıtım durumunu kontrol et
azd show

# Yapılandırmayı doğrula
azd config list

# Günlükler için izleme panosunu aç
azd monitor --logs

# Kaynak durumunu kontrol et
azd show --output json
```

## 🔍 Hata Ayıklama Komutları

### Hata Ayıklama Bilgisi
```bash
# Hata ayıklama çıktısını etkinleştir
export AZD_DEBUG=true
azd <command> --debug

# Daha temiz çıktı için telemetriyi devre dışı bırak
export AZD_DISABLE_TELEMETRY=true

# Mevcut yapılandırmayı kontrol et
azd config list

# Kimlik doğrulama durumunu kontrol et
az account show
```

### Şablon Hata Ayıklama
```bash
# Kullanılabilir şablonları ayrıntılarıyla listele
azd template list --output json

# Şablon bilgilerini göster
azd template show <template-name>

# init'ten önce şablonu doğrula
azd template validate <template-name>
```

## 📁 Dosya ve Dizin Komutları

### Proje Yapısı
```bash
# Geçerli dizin yapısını göster
tree /f  # Windows
find . -type f  # Linux/macOS

# azd proje köküne git
cd $(azd root)

# azd yapılandırma dizinini göster
echo $AZD_CONFIG_DIR  # Genellikle ~/.azd
```

## 🎨 Çıktı Biçimlendirme

### JSON Çıktısı
```bash
# Betikleme için JSON çıktısı alın
azd show --output json
azd env list --output json
azd config list --output json

# jq ile ayrıştırın
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tablo Çıktısı
```bash
# Tablo olarak biçimlendir
azd env list --output table

# Dağıtılmış hizmetleri görüntüle
azd show --output json | jq '.services | keys'
```

## 🔧 Yaygın Komut Kombinasyonları

### Sağlık Kontrolü Betiği
```bash
#!/bin/bash
# Hızlı sağlık kontrolü
azd show
azd env show
azd monitor --logs
```

### Dağıtım Doğrulama
```bash
#!/bin/bash
# Dağıtım öncesi doğrulama
azd show
azd provision --preview  # Dağıtmadan önce değişiklikleri önizleyin
az account show
```

### Ortam Karşılaştırması
```bash
#!/bin/bash
# Ortamları karşılaştır
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Kaynak Temizlik Betiği
```bash
#!/bin/bash
# Eski ortamları temizle
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Ortam Değişkenleri

### Yaygın Ortam Değişkenleri
```bash
# Azure yapılandırması
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD yapılandırması
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Uygulama yapılandırması
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Acil Komutlar

### Hızlı Düzeltmeler
```bash
# Kimlik doğrulamasını sıfırla
az account clear
az login

# Ortamı zorla yenile
azd env refresh

# Tüm servisleri yeniden dağıt
azd deploy

# Dağıtım durumunu kontrol et
azd show --output json
```

### Kurtarma Komutları
```bash
# Başarısız dağıtımdan kurtar - temizle ve yeniden dağıt
azd down --force --purge
azd up

# Yalnızca altyapıyı yeniden sağla
azd provision

# Yalnızca uygulamayı yeniden dağıt
azd deploy
```

## 💡 Uzman İpuçları

### Daha Hızlı İş Akışı İçin Takma Adlar
```bash
# Bunu .bashrc veya .zshrc dosyanıza ekleyin
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Fonksiyon Kısayolları
```bash
# Hızlı ortam geçişi
azd-env() {
    azd env select $1 && azd show
}

# İzleme ile hızlı dağıtım
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Ortam durumu
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Yardım ve Belgeler

### Yardım Alma
```bash
# Genel yardım
azd --help
azd help

# Komutlara özel yardım
azd up --help
azd env --help
azd config --help

# Sürüm ve derleme bilgilerini göster
azd version
azd version --output json
```

### Dokümantasyon Bağlantıları
```bash
# Belgeleri tarayıcıda aç
azd docs

# Şablon belgelerini göster
azd template show <template-name> --docs
```

---

**İpucu**: Bu kısa başvuru sayfasını yer imlerine ekleyin ve ihtiyacınız olan komutları hızlıca bulmak için `Ctrl+F` kullanın!

---

**Gezinme**
- **Önceki Ders**: [Ön Kontroller](../docs/pre-deployment/preflight-checks.md)
- **Sonraki Ders**: [Sözlük](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zekâ çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dilindeki versiyonu otoritatif kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu tutulamayız.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->