# Komut Hile Sayfası - Temel AZD Komutları

**Tüm Bölümler için Hızlı Referans**
- **📚 Dersin Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Hızlı Başlangıç**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Komutları**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 İleri Seviye**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Giriş

Bu kapsamlı hile sayfası, en sık kullanılan Azure Developer CLI komutları için kategoriye göre düzenlenmiş, pratik örneklerle hızlı referans sağlar. azd projeleriyle geliştirme, sorun giderme ve günlük işlemler sırasında hızlı başvurular için idealdir.

## Öğrenme Hedefleri

Bu hile sayfasını kullanarak:
- Temel Azure Developer CLI komutlarına ve sözdizimine anında erişim elde edeceksiniz
- Komutların fonksiyonel kategorilere ve kullanım senaryolarına göre düzenlenmesini anlayacaksınız
- Yaygın geliştirme ve dağıtım senaryoları için pratik örneklere başvurabileceksiniz
- Hızlı sorun çözümü için tanılama komutlarına erişebileceksiniz
- Gelişmiş yapılandırma ve özelleştirme seçeneklerini verimli şekilde bulabileceksiniz
- Ortam yönetimi ve çoklu ortam iş akışı komutlarını kolaylıkla bulabileceksiniz

## Öğrenme Çıktıları

Bu hile sayfasına düzenli olarak başvurarak:
- azd komutlarını tam dokümantasyona bakmadan güvenle çalıştırabileceksiniz
- Uygun tanılama komutlarını kullanarak yaygın sorunları hızla çözebileceksiniz
- Birden çok ortamı ve dağıtım senaryosunu etkin şekilde yönetebileceksiniz
- Gerekli olduğunda azd'nin gelişmiş özelliklerini ve yapılandırma seçeneklerini uygulayabileceksiniz
- Sistematik komut dizileri kullanarak dağıtım sorunlarını giderebileceksiniz
- azd kısayolları ve seçeneklerini etkili kullanarak iş akışlarını optimize edebileceksiniz

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

# Özel adla başlat
azd init --template todo-nodejs-mongo my-awesome-app
```

## Çekirdek Dağıtım Komutları

### Tam Dağıtım İş Akışı
```bash
# Her şeyi dağıt (sağlama + konuşlandırma)
azd up

# Onay istemleri devre dışı bırakılmış olarak dağıt
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
# Hangi kaynakların oluşturulacağı, değiştirileceği veya silineceğine dair bir deneme çalıştırması görünümünü gösterir
# 'terraform plan' veya 'bicep what-if' ile benzer - çalıştırılması güvenlidir, hiçbir değişiklik uygulanmaz
```

### Sadece Uygulama
```bash
# Uygulama kodunu dağıt
azd deploy

# Belirli hizmeti dağıt
azd deploy --service web
azd deploy --service api

# Tüm hizmetleri dağıt
azd deploy --all
```

### Derleme ve Paketleme
```bash
# Uygulamalar oluştur
azd package

# Belirli bir hizmet oluştur
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

# Ortamı seç
azd env select production

# Mevcut ortamı göster
azd env show

# Ortam durumunu yenile
azd env refresh
```

### Ortam Değişkenleri
```bash
# Ortam değişkenini ayarla
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

## 📊 İzleme ve Tanılama

### İzleme Panosu
```bash
# Azure portalındaki izleme panosunu aç
azd monitor

# Application Insights canlı metriklerini aç
azd monitor --live

# Application Insights günlükler blade'ını aç
azd monitor --logs

# Application Insights genel bakışını aç
azd monitor --overview
```

### Konteyner Kayıtlarını Görüntüleme
```bash
# Azure CLI üzerinden günlükleri görüntüle (Container Apps için)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Günlükleri gerçek zamanlı olarak takip et
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal üzerinden günlükleri görüntüle
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
# Tüm Azure kaynaklarını kaldır
azd down

# Onay olmadan zorla sil
azd down --force

# Geçici olarak silinmiş kaynakları temizle
azd down --purge

# Tam temizlik
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
# Dağıtım yapmadan altyapı sağlanmasını simüle eder
# Bicep/Terraform şablonlarını analiz eder ve gösterir:
# - Eklenecek kaynaklar (yeşil +)
# - Değiştirilecek kaynaklar (sarı ~)
# - Silinecek kaynaklar (kırmızı -)
# Çalıştırmak güvenlidir - Azure ortamında gerçek bir değişiklik yapılmaz

# azure.yaml'den altyapıyı sentezle
azd infra synth
```

### Proje Bilgisi
```bash
# Proje durumunu ve uç noktaları göster
azd show

# Ayrıntılı proje bilgisini JSON olarak göster
azd show --output json

# Hizmet uç noktalarını al
azd show --output json | jq '.services'
```

## 🤖 AI & Uzantılar Komutları

### AZD Uzantıları
```bash
# Tüm kullanılabilir uzantıları listele (yapay zeka dahil)
azd extension list

# Foundry ajanları uzantısını yükle
azd extension install azure.ai.agents

# İnce ayar uzantısını yükle
azd extension install azure.ai.finetune

# Özel modeller uzantısını yükle
azd extension install azure.ai.models

# Tüm yüklü uzantıları güncelle
azd extension upgrade --all
```

### Yapay Zeka Ajan Komutları
```bash
# Manifestten bir ajan projesi başlatın
azd ai agent init -m <manifest-path-or-uri>

# Belirli bir Foundry projesini hedefleyin
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ajan kaynak dizinini belirtin
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Barındırma hedefi seçin
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Sunucusu (Alfa)
```bash
# Projeniz için MCP sunucusunu başlatın
azd mcp start

# MCP işlemleri için araç onayını yönetin
azd mcp consent
```

### Altyapı Oluşturma
```bash
# Proje tanımınızdan IaC dosyaları oluşturun
azd infra generate

# azure.yaml'dan altyapıyı sentezleyin
azd infra synth
```

---

## 🎯 Hızlı İş Akışları

### Geliştirme İş Akışı
```bash
# Yeni bir proje başlat
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

### Çok Ortamlı İş Akışı
```bash
# Ortamları kur
azd env new dev
azd env new staging  
azd env new production

# Geliştirme ortamına dağıt
azd env select dev
azd up

# Test et ve hazırlık ortamına taşı
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

### Hata Ayıklama Bilgileri
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

# Init işleminden önce şablonu doğrula
azd template validate <template-name>
```

## 📁 Dosya ve Dizin Komutları

### Proje Yapısı
```bash
# Mevcut dizin yapısını göster
tree /f  # Windows
find . -type f  # Linux/macOS

# azd proje kök dizinine git
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

# Dağıtılan hizmetleri görüntüle
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

### Kaynak Temizleme Betiği
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

## 🚨 Acil Durum Komutları

### Hızlı Düzeltmeler
```bash
# Kimlik doğrulamasını sıfırla
az account clear
az login

# Ortamı zorla yenile
azd env refresh

# Tüm hizmetleri yeniden dağıt
azd deploy

# Dağıtım durumunu kontrol et
azd show --output json
```

### Kurtarma Komutları
```bash
# Başarısız dağıtımı kurtar - temizle ve yeniden dağıt
azd down --force --purge
azd up

# Sadece altyapıyı yeniden sağla
azd provision

# Sadece uygulamayı yeniden dağıt
azd deploy
```

## 💡 İpuçları

### Daha Hızlı İş Akışı İçin Takma Adlar
```bash
# .bashrc veya .zshrc dosyanıza ekleyin
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

## 📖 Yardım ve Dokümantasyon

### Yardım Alma
```bash
# Genel yardım
azd --help
azd help

# Komuta özgü yardım
azd up --help
azd env --help
azd config --help

# Sürüm ve yapı bilgilerini göster
azd version
azd version --output json
```

### Dokümantasyon Bağlantıları
```bash
# Dokümantasyonu tarayıcıda aç
azd docs

# Şablon dokümantasyonunu göster
azd template show <template-name> --docs
```

---

**İpucu**: Bu hile sayfasını yer imlerine ekleyin ve ihtiyacınız olan komutları hızlıca bulmak için `Ctrl+F` kullanın!

---

**Gezinme**
- **Önceki Ders**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Sonraki Ders**: [Glossary](glossary.md)

---

> **💡 Editörünüzde Azure komut yardımı mı istiyorsunuz?** `npx skills add microsoft/github-copilot-for-azure` ile [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) yükleyin — AI, Foundry, dağıtım, tanılama ve daha fazlası için 37 beceri.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Önemli bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucu oluşabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->