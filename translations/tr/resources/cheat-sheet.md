# Command Cheat Sheet - Essential AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Bu kapsamlı cheat sheet, en sık kullanılan Azure Developer CLI komutları için pratik örneklerle kategorilere ayrılmış hızlı başvuru sağlar. azd projeleriyle geliştirme, hata ayıklama ve günlük işlemler sırasında hızlıca bakmak için idealdir.

## Learning Goals

Bu cheat sheet'i kullanarak:
- Temel Azure Developer CLI komutlarına ve sözdizimine anında erişim sahibi olacaksınız
- Komutların fonksiyonel kategorilere ve kullanım durumlarına göre nasıl düzenlendiğini anlayacaksınız
- Yaygın geliştirme ve dağıtım senaryoları için pratik örneklere başvurabileceksiniz
- Hızlı sorun çözümü için tanılama komutlarına erişebileceksiniz
- İleri düzey yapılandırma ve özelleştirme seçeneklerini verimli şekilde bulabileceksiniz
- Ortam yönetimi ve çoklu ortam iş akışları için komutları bulabileceksiniz

## Learning Outcomes

Bu cheat sheet'e düzenli başvurarak şu yeteneklere sahip olacaksınız:
- azd komutlarını tam dokümantasyona başvurmadan güvenle çalıştırmak
- Uygun teşhis komutlarını kullanarak yaygın sorunları hızla çözmek
- Birden fazla ortamı ve dağıtım senaryosunu verimli şekilde yönetmek
- Gerektiğinde azd'nin ileri özelliklerini ve yapılandırma seçeneklerini uygulamak
- Sistematik komut dizileri kullanarak dağıtım problemlerini gidermek
- azd kısayolları ve seçeneklerini etkili kullanarak iş akışlarını optimize etmek

## Getting Started Commands

### Authentication
```bash
# AZD ile Azure'a giriş
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

### Project Initialization
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

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# Her şeyi dağıt (kaynak sağlama + konuşlandırma)
azd up

# Onay istemleri devre dışı iken dağıt
azd up --confirm-with-no-prompt

# Belirli bir ortama dağıt
azd up --environment production

# Özel parametrelerle dağıt
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Azure kaynaklarını sağla
azd provision

# 🧪 Altyapı değişikliklerini önizle
azd provision --preview
# Hangi kaynakların oluşturulacağını/değiştirileceğini/silineceğini gösteren bir deneme (dry-run) görünümü sunar
# 'terraform plan' veya 'bicep what-if' ile benzer - çalıştırılması güvenlidir, hiçbir değişiklik uygulanmaz
```

### Application Only
```bash
# Uygulama kodunu dağıt
azd deploy

# Belirli hizmeti dağıt
azd deploy --service web
azd deploy --service api

# Tüm hizmetleri dağıt
azd deploy --all
```

### Build and Package
```bash
# Uygulama bağımlılıklarını geri yükle (indir)
azd restore

# Belirli bir servisi geri yükle
azd restore --service api

# Dağıtım yapmadan dağıtılabilir bir artefakt oluştur
azd package

# Belirli bir servisi derle
azd package --service api
```

> **`azd restore`** uygulamanızın bağımlılıklarını indirir (npm, pip, NuGet, Maven vb.). `azd package` ve `azd deploy` sırasında otomatik olarak çalışır; bu yüzden nadiren doğrudan çağırırsınız — örneğin bir CI önbelleğini ısıtmak veya daha sonra çevrimdışı çalışmak için bağımlılıkları önceden almak amacıyla elle çalıştırın.

> **`azd package`** dağıtılabilir artifaktı (bir konteyner imajı veya zip) Azure'a göndermeden derler. Bir derlemenin başarılı olduğunu doğrulamak, çıktıyı incelemek veya daha sonra ayrı bir süreç tarafından dağıtılacak bir artifakt üretmek için tek başına kullanın. `azd deploy` otomatik olarak paketler, bu yüzden yalnızca dağıtım yapmadan artifaktı istiyorsanız `azd package` gereklidir.


## 🌍 Environment Management

### Environment Operations
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

### Environment Variables
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

## ⚙️ Configuration Commands

### Global Configuration
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

### Project Configuration
```bash
# azure.yaml dosyasını doğrula
azd config validate

# Proje bilgilerini göster
azd show

# Servis uç noktalarını al
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
```bash
# Azure portalındaki izleme panosunu aç
azd monitor

# Application Insights canlı metriklerini aç
azd monitor --live

# Application Insights günlükler penceresini aç
azd monitor --logs

# Application Insights genel bakışını aç
azd monitor --overview
```

### Viewing Container Logs
```bash
# Azure CLI aracılığıyla günlükleri görüntüleyin (Container Apps için)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Günlükleri gerçek zamanlı olarak takip edin
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal'dan günlükleri görüntüleyin
azd monitor --logs
```

### Log Analytics Queries
```bash
# Azure Portal aracılığıyla Log Analytics'e erişin
azd monitor --logs

# Azure CLI kullanarak günlükleri sorgulayın
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# Tüm Azure kaynaklarını kaldır
azd down

# Onay olmadan zorla sil
azd down --force

# Yumuşak silinmiş kaynakları kalıcı olarak sil
azd down --purge

# Temizliği tamamla
azd down --force --purge
```

### Updates
```bash
# azd güncellemelerini kontrol et
azd version

# Mevcut sürümü al
azd version

# Mevcut yapılandırmayı görüntüle
azd config show
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# GitHub Actions'ı yapılandır
azd pipeline config

# Azure DevOps'u yapılandır
azd pipeline config --provider azdo

# pipeline yapılandırmasını göster
azd pipeline show
```

### Infrastructure Management
```bash
# Altyapı şablonları oluştur
azd infra generate

# 🧪 Altyapı Önizlemesi ve Planlama
azd provision --preview
# Dağıtım yapmadan altyapı sağlama işlemini simüle eder
# Bicep/Terraform şablonlarını analiz eder ve şunları gösterir:
# - Eklenecek kaynaklar (yeşil +)
# - Değiştirilecek kaynaklar (sarı ~)
# - Silinecek kaynaklar (kırmızı -)
# Çalıştırmak güvenlidir - Azure ortamında gerçek değişiklik yapılmaz

# azure.yaml'den altyapıyı sentezle
azd infra synth
```

### Project Information
```bash
# Proje durumunu ve uç noktalarını göster
azd show

# Ayrıntılı proje bilgilerini JSON olarak göster
azd show --output json

# Servis uç noktalarını al
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# Tüm kullanılabilir uzantıları listele (AI dahil)
azd extension list

# Foundry agents uzantısını yükle
azd extension install azure.ai.agents

# agent skills uzantısını yükle (önizleme)
azd extension install azure.ai.skills

# Foundry connections uzantısını yükle (önizleme)
azd extension install azure.ai.connections

# İnce ayar uzantısını yükle
azd extension install azure.ai.finetune

# Özel modeller uzantısını yükle
azd extension install azure.ai.models

# Tüm yüklü uzantıları güncelle
azd extension upgrade --all
```

### AI Agent Commands
```bash
# Bir manifestten bir ajan projesi başlatın
azd ai agent init -m <manifest-path-or-uri>

# Belirli bir Foundry projesini hedefleyin
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ajan kaynak dizinini belirtin
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Barındırma hedefi seçin
azd ai agent init -m agent-manifest.yaml --host containerapp

# Dağıtılmış bir ajanı test edin (gecikme ve ilk bayta ulaşma süresini yazdırır)
azd ai agent invoke

# Canlı uç nokta yapılandırmasını gösterin
azd ai agent endpoint show

# Bir değerlendirme veri kümesi oluşturun, ardından ajanı optimize edin
azd ai agent eval generate
azd ai agent optimize

# Kod tabanlı barındırılan bir ajanın dağıtılmış kaynak kodunu indirin
azd ai agent code download

# Barındırılan bir ajanı ve tüm sürümlerini silin (--force etkin oturumları sonlandırır)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Projeniz için MCP sunucusunu başlatın
azd mcp start

# MCP işlemleri için araç onayını yönetin
azd copilot consent list
```

### Infrastructure Generation
```bash
# Proje tanımınızdan IaC dosyaları oluştur
azd infra generate

# azure.yaml'dan altyapıyı sentezle
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
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

### Multi-Environment Workflow
```bash
# Ortamları ayarla
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

### Troubleshooting Workflow
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

## 🔍 Debugging Commands

### Debug Information
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

### Template Debugging
```bash
# Kullanılabilir şablonları ayrıntılarıyla listele
azd template list --output json

# Şablon bilgilerini göster
azd template show <template-name>

# Başlatmadan önce şablonu doğrula
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# Geçerli dizin yapısını göster
tree /f  # Windows
find . -type f  # Linux/macOS

# azd proje kök dizinine gidin
cd $(azd root)

# azd yapılandırma dizinini göster
echo $AZD_CONFIG_DIR  # Genellikle ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Betikleme için JSON çıktısı alın
azd show --output json
azd env list --output json
azd config show --output json

# jq ile ayrıştırın
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Tablo olarak biçimlendir
azd env list --output table

# Dağıtılan hizmetleri görüntüle
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Hızlı sağlık kontrolü
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Dağıtım öncesi doğrulama
azd show
azd provision --preview  # Dağıtmadan önce değişiklikleri önizleyin
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# Ortamları karşılaştır
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# Eski ortamları temizle
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
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

## 🚨 Emergency Commands

### Quick Fixes
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

### Recovery Commands
```bash
# Başarısız dağıtımdan kurtar - temizle ve yeniden dağıt
azd down --force --purge
azd up

# Yalnızca altyapıyı yeniden sağla
azd provision

# Yalnızca uygulamayı yeniden dağıt
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# .bashrc veya .zshrc dosyanıza ekleyin
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Help and Documentation

### Getting Help
```bash
# Genel yardım
azd --help
azd help

# Komutlara özgü yardım
azd up --help
azd env --help
azd config --help

# Sürüm ve derleme bilgilerini göster
azd version
azd version --output json
```

### Documentation Links
```bash
# Belgeleri tarayıcıda aç
azd docs

# Şablon belgelerini göster
azd template show <template-name> --docs
```

---

**İpucu**: Bu cheat sheet'i yer işaretlerine ekleyin ve ihtiyacınız olan komutları hızlıca bulmak için `Ctrl+F` kullanın!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

> **💡 Editörünüzde Azure komutları yardımı mı istiyorsunuz?** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) eklentisini `npx skills add microsoft/github-copilot-for-azure` ile kurun — Yapay Zeka, Foundry, dağıtım, tanılama ve daha fazlası için 37 beceri.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->