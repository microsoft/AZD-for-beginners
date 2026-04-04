# Command Cheat Sheet - Essential AZD Commands

**Tüm Bölümler için Hızlı Başvuru**
- **📚 Ders Ana Sayfası**: [Yeni Başlayanlar için AZD](../README.md)
- **📖 Hızlı Başlangıç**: [Bölüm 1: Temel ve Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Yapay Zeka Komutları**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Gelişmiş**: [Bölüm 4: Kod Olarak Altyapı](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Giriş

Bu kapsamlı hile sayfası, en yaygın kullanılan Azure Developer CLI komutlarına kategori bazında pratik örneklerle hızlı başvuru sağlar. azd projeleriyle geliştirme, hata giderme ve günlük işlemler sırasında hızlıca bakmak için idealdir.

## Öğrenme Hedefleri

Bu hile sayfasını kullanarak:
- Temel Azure Developer CLI komutlarına ve sözdizimine anında erişim sahibi olacaksınız
- Komutların işlevsel kategorilere ve kullanım senaryolarına göre düzenlenmesini anlayacaksınız
- Ortak geliştirme ve dağıtım senaryoları için pratik örneklere başvurabileceksiniz
- Hızlı sorun çözümü için hata giderme komutlarına erişebileceksiniz
- Gelişmiş yapılandırma ve özelleştirme seçeneklerini verimli şekilde bulabileceksiniz
- Ortam yönetimi ve çoklu ortam iş akışı komutlarını kolayca bulabileceksiniz

## Öğrenme Çıktıları

Bu hile sayfasına düzenli başvurarak:
- azd komutlarını tam dokümantasyona bakmadan güvenle çalıştırabileceksiniz
- Uygun tanılama komutlarını kullanarak yaygın sorunları hızlıca çözebileceksiniz
- Birden çok ortamı ve dağıtım senaryosunu verimli şekilde yönetebileceksiniz
- Gerektiğinde gelişmiş azd özelliklerini ve yapılandırma seçeneklerini uygulayabileceksiniz
- Sistematik komut dizileri kullanarak dağıtım sorunlarını giderbileceksiniz
- azd kısayolları ve seçeneklerinin etkili kullanımı ile iş akışlarını optimize edebileceksiniz

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
# Kullanılabilir şablonlara göz at
azd template list

# Şablondan başlat
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Geçerli dizinde başlat
azd init .

# Özel adla başlat
azd init --template todo-nodejs-mongo my-awesome-app
```

## Temel Dağıtım Komutları

### Tam Dağıtım İş Akışı
```bash
# Her şeyi dağıt (kaynak sağlama + dağıtım)
azd up

# Onay istemleri devre dışı bırakılarak dağıt
azd up --confirm-with-no-prompt

# Belirli bir ortama dağıt
azd up --environment production

# Özel parametrelerle dağıt
azd up --parameter location=westus2
```

### Yalnızca Altyapı
```bash
# Azure kaynaklarını sağla
azd provision

# 🧪 Altyapı değişikliklerini önizle
azd provision --preview
# Oluşturulacak/değiştirilecek/silinecek kaynakların kuru çalıştırma görünümünü gösterir
# 'terraform plan' veya 'bicep what-if' ile benzer — çalıştırılması güvenlidir, hiçbir değişiklik uygulanmaz
```

### Yalnızca Uygulama
```bash
# Uygulama kodunu dağıt
azd deploy

# Belirli servisi dağıt
azd deploy --service web
azd deploy --service api

# Tüm servisleri dağıt
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

# Ortam seç
azd env select production

# Kullanılabilir ortamları göster
azd env list

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

### Küresel Yapılandırma
```bash
# Tüm yapılandırmaları listele
azd config show

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
# Azure portalı izleme panosunu aç
azd monitor

# Application Insights canlı metrikleri aç
azd monitor --live

# Application Insights günlükler blade'ini aç
azd monitor --logs

# Application Insights genel bakışını aç
azd monitor --overview
```

### Kapsayıcı Günlüklerini Görüntüleme
```bash
# Azure CLI ile günlükleri görüntüle (Container Apps için)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Günlükleri gerçek zamanlı olarak takip et
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal'dan günlükleri görüntüle
azd monitor --logs
```

### Günlük Analitiği Sorguları
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

# Tam temizleme
azd down --force --purge
```

### Güncellemeler
```bash
# azd güncellemelerini kontrol et
azd version

# Mevcut sürümü al
azd version

# Mevcut yapılandırmayı görüntüle
azd config show
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
# Altyapı şablonları oluşturun
azd infra generate

# 🧪 Altyapı Önizleme ve Planlama
azd provision --preview
# Dağıtım yapmadan altyapı sağlanmasını simüle eder
# Bicep/Terraform şablonlarını analiz eder ve şunları gösterir:
# - Eklenecek kaynaklar (yeşil +)
# - Değiştirilecek kaynaklar (sarı ~)
# - Silinecek kaynaklar (kırmızı -)
# Çalıştırmak güvenlidir - Azure ortamında gerçek değişiklik yapılmaz

# azure.yaml'den altyapıyı sentezleyin
azd infra synth
```

### Proje Bilgileri
```bash
# Proje durumunu ve uç noktalarını göster
azd show

# Ayrıntılı proje bilgisini JSON olarak göster
azd show --output json

# Servis uç noktalarını al
azd show --output json | jq '.services'
```

## 🤖 Yapay Zeka ve Uzantılar Komutları

### AZD Uzantıları
```bash
# Tüm kullanılabilir uzantıları listele (AI dahil)
azd extension list

# Foundry agents uzantısını yükle
azd extension install azure.ai.agents

# İnce ayar uzantısını yükle
azd extension install azure.ai.finetune

# Özel modeller uzantısını yükle
azd extension install azure.ai.models

# Yüklü tüm uzantıları güncelle
azd extension upgrade --all
```

### Yapay Zeka Ajanı Komutları
```bash
# Bir manifestten bir ajan projesi başlat
azd ai agent init -m <manifest-path-or-uri>

# Belirli bir Foundry projesini hedefle
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ajan kaynak dizinini belirt
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Bir barındırma hedefi seç
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Sunucusu (Alfa)
```bash
# Projeniz için MCP sunucusunu başlatın
azd mcp start

# MCP işlemleri için araç onayını yönetin
azd copilot consent list
```

### Altyapı Oluşturma
```bash
# Proje tanımınızdan IaC dosyaları oluşturun
azd infra generate

# azure.yaml dosyasından altyapıyı sentezleyin
azd infra synth
```

---

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

# Test et ve hazırlık ortamına geçir
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
azd config show

# Kayıtlar için izleme panosunu aç
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
azd config show

# Kimlik doğrulama durumunu kontrol et
az account show
```

### Şablon Hata Ayıklama
```bash
# Mevcut şablonları ayrıntılarıyla listele
azd template list --output json

# Şablon bilgilerini göster
azd template show <template-name>

# init'den önce şablonu doğrula
azd template validate <template-name>
```

## 📁 Dosya ve Dizin Komutları

### Proje Yapısı
```bash
# Mevcut dizin yapısını göster
tree /f  # Windows
find . -type f  # Linux/macOS

# azd proje kök dizinine gidin
cd $(azd root)

# azd yapılandırma dizinini gösterin
echo $AZD_CONFIG_DIR  # Genellikle ~/.azd
```

## 🎨 Çıktı Biçimlendirme

### JSON Çıktısı
```bash
# Betikleme için JSON çıktısı alın
azd show --output json
azd env list --output json
azd config show --output json

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

### Sağlık Kontrol Betiği
```bash
#!/bin/bash
# Hızlı sağlık kontrolü
azd show
azd env get-values
azd monitor --logs
```

### Dağıtım Doğrulama
```bash
#!/bin/bash
# Dağıtım öncesi doğrulama
azd show
azd provision --preview  # Dağıtım yapmadan önce değişiklikleri önizle
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

## 💡 İleri Düzey İpuçları

### Daha Hızlı İş Akışı için Kısaltmalar
```bash
# .bashrc veya .zshrc dosyanıza ekleyin
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Fonksiyon Kısayolları
```bash
# Hızlı ortam değiştirme
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
    azd env get-values
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
# Dokümantasyonu tarayıcıda aç
azd docs

# Şablon dokümantasyonunu göster
azd template show <template-name> --docs
```

---

**İpucu**: Bu hile sayfasını yer işaretlerinize ekleyin ve ihtiyacınız olan komutları hızlıca bulmak için `Ctrl+F` kullanın!

---

**Geçmiş Ders**
- **Önceki Ders**: [Dağıtım Öncesi Kontroller](../docs/pre-deployment/preflight-checks.md)
- **Sonraki Ders**: [Sözlük](glossary.md)

---

> **💡 Editörünüzde Azure komut yardımı mı istiyorsunuz?** `npx skills add microsoft/github-copilot-for-azure` ile [Microsoft Azure Agent Becerileri](https://skills.sh/microsoft/github-copilot-for-azure) yükleyin — Yapay Zeka, Foundry, dağıtım, tanılama ve daha fazlası için 37 beceri.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâli yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->