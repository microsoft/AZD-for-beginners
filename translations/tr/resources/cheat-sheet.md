<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T20:27:20+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "tr"
}
-->
# Komut Kılavuzu - Temel AZD Komutları

## Giriş

Bu kapsamlı kılavuz, en sık kullanılan Azure Developer CLI komutları için hızlı bir referans sağlar. Komutlar kategorilere göre düzenlenmiş ve pratik örneklerle desteklenmiştir. Geliştirme, sorun giderme ve günlük azd projeleriyle çalışma sırasında hızlı başvurular için idealdir.

## Öğrenme Hedefleri

Bu kılavuzu kullanarak:
- Temel Azure Developer CLI komutlarına ve sözdizimine anında erişim sağlayabilirsiniz
- Komutların işlevsel kategorilere ve kullanım senaryolarına göre düzenlenmesini anlayabilirsiniz
- Yaygın geliştirme ve dağıtım senaryoları için pratik örneklere başvurabilirsiniz
- Sorunları hızlı bir şekilde çözmek için sorun giderme komutlarına erişebilirsiniz
- Gelişmiş yapılandırma ve özelleştirme seçeneklerini verimli bir şekilde bulabilirsiniz
- Çevre yönetimi ve çoklu çevre iş akışı komutlarını kolayca bulabilirsiniz

## Öğrenme Çıktıları

Bu kılavuzu düzenli olarak referans alarak:
- Tam belgeleri incelemeden azd komutlarını güvenle çalıştırabilirsiniz
- Uygun tanı komutlarını kullanarak yaygın sorunları hızlı bir şekilde çözebilirsiniz
- Birden fazla çevreyi ve dağıtım senaryolarını verimli bir şekilde yönetebilirsiniz
- Gerekli olduğunda gelişmiş azd özelliklerini ve yapılandırma seçeneklerini uygulayabilirsiniz
- Sistematik komut dizileri kullanarak dağıtım sorunlarını giderebilirsiniz
- azd kısayollarını ve seçeneklerini etkili bir şekilde kullanarak iş akışlarını optimize edebilirsiniz

## Başlangıç Komutları

### Kimlik Doğrulama
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Proje Başlatma
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Temel Dağıtım Komutları

### Tam Dağıtım İş Akışı
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Sadece Altyapı
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Sadece Uygulama
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Derleme ve Paketleme
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Çevre Yönetimi

### Çevre İşlemleri
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Çevre Değişkenleri
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Yapılandırma Komutları

### Genel Yapılandırma
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Proje Yapılandırması
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 İzleme ve Günlükler

### Uygulama Günlükleri
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### İzleme
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Bakım Komutları

### Temizlik
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Güncellemeler
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Gelişmiş Komutlar

### Pipeline ve CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Altyapı Yönetimi
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Hizmet Yönetimi
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Hızlı İş Akışları

### Geliştirme İş Akışı
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Çoklu Çevre İş Akışı
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Sorun Giderme İş Akışı
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Hata Ayıklama Komutları

### Hata Ayıklama Bilgisi
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Şablon Hata Ayıklama
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Dosya ve Dizin Komutları

### Proje Yapısı
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Çıktı Biçimlendirme

### JSON Çıktısı
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tablo Çıktısı
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Yaygın Komut Kombinasyonları

### Sağlık Kontrolü Scripti
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Dağıtım Doğrulama
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Çevre Karşılaştırması
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Kaynak Temizleme Scripti
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Çevre Değişkenleri

### Yaygın Çevre Değişkenleri
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Acil Durum Komutları

### Hızlı Çözümler
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Kurtarma Komutları
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 İpuçları

### Daha Hızlı İş Akışı için Kısayollar
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Fonksiyon Kısayolları
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Yardım ve Belgeler

### Yardım Alma
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Belge Linkleri
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**İpucu**: Bu kılavuzu yer imlerine ekleyin ve ihtiyacınız olan komutları hızlıca bulmak için `Ctrl+F` kullanın!

---

**Navigasyon**
- **Önceki Ders**: [Preflight Kontrolleri](../docs/pre-deployment/preflight-checks.md)
- **Sonraki Ders**: [Sözlük](glossary.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.