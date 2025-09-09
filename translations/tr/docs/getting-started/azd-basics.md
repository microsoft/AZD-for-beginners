<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T19:17:56+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "tr"
}
-->
# AZD Temelleri - Azure Developer CLI'yi Anlamak

## Giriş

Bu ders, sizi Azure Developer CLI (azd) ile tanıştırıyor. Azd, yerel geliştirmeden Azure'a dağıtıma kadar olan yolculuğunuzu hızlandıran güçlü bir komut satırı aracıdır. Temel kavramları, ana özellikleri öğrenecek ve azd'nin bulut tabanlı uygulama dağıtımını nasıl basitleştirdiğini anlayacaksınız.

## Öğrenme Hedefleri

Bu dersin sonunda:
- Azure Developer CLI'nin ne olduğunu ve ana amacını anlayacaksınız
- Şablonlar, ortamlar ve hizmetler gibi temel kavramları öğreneceksiniz
- Şablon tabanlı geliştirme ve Kod Olarak Altyapı gibi ana özellikleri keşfedeceksiniz
- Azd proje yapısını ve iş akışını anlayacaksınız
- Geliştirme ortamınız için azd'yi kurmaya ve yapılandırmaya hazır olacaksınız

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra:
- Azd'nin modern bulut geliştirme iş akışlarındaki rolünü açıklayabileceksiniz
- Azd proje yapısının bileşenlerini tanımlayabileceksiniz
- Şablonların, ortamların ve hizmetlerin nasıl birlikte çalıştığını açıklayabileceksiniz
- Azd ile Kod Olarak Altyapının faydalarını anlayabileceksiniz
- Farklı azd komutlarını ve amaçlarını tanıyabileceksiniz

## Azure Developer CLI (azd) Nedir?

Azure Developer CLI (azd), yerel geliştirmeden Azure'a dağıtıma kadar olan yolculuğunuzu hızlandırmak için tasarlanmış bir komut satırı aracıdır. Bulut tabanlı uygulamaları Azure üzerinde oluşturma, dağıtma ve yönetme sürecini basitleştirir.

## Temel Kavramlar

### Şablonlar
Şablonlar, azd'nin temelini oluşturur. Şunları içerir:
- **Uygulama kodu** - Kaynak kodunuz ve bağımlılıklarınız
- **Altyapı tanımları** - Azure kaynakları Bicep veya Terraform ile tanımlanır
- **Yapılandırma dosyaları** - Ayarlar ve ortam değişkenleri
- **Dağıtım betikleri** - Otomatik dağıtım iş akışları

### Ortamlar
Ortamlar, farklı dağıtım hedeflerini temsil eder:
- **Geliştirme** - Test ve geliştirme için
- **Staging** - Ön üretim ortamı
- **Üretim** - Canlı üretim ortamı

Her ortam kendi:
- Azure kaynak grubunu
- Yapılandırma ayarlarını
- Dağıtım durumunu korur

### Hizmetler
Hizmetler, uygulamanızın yapı taşlarıdır:
- **Frontend** - Web uygulamaları, SPAlar
- **Backend** - API'ler, mikro hizmetler
- **Veritabanı** - Veri depolama çözümleri
- **Depolama** - Dosya ve blob depolama

## Ana Özellikler

### 1. Şablon Tabanlı Geliştirme
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Kod Olarak Altyapı
- **Bicep** - Azure'ın alanına özgü dili
- **Terraform** - Çoklu bulut altyapı aracı
- **ARM Şablonları** - Azure Resource Manager şablonları

### 3. Entegre İş Akışları
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Ortam Yönetimi
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Proje Yapısı

Tipik bir azd proje yapısı:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Yapılandırma Dosyaları

### azure.yaml
Ana proje yapılandırma dosyası:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Ortam özelinde yapılandırma:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Yaygın İş Akışları

### Yeni Bir Projeye Başlama
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Geliştirme Döngüsü
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Birden Fazla Ortamı Yönetme
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigasyon Komutları

### Keşif
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Proje Yönetimi
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### İzleme
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## En İyi Uygulamalar

### 1. Anlamlı İsimler Kullanın
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Şablonlardan Yararlanın
- Mevcut şablonlarla başlayın
- İhtiyaçlarınıza göre özelleştirin
- Kuruluşunuz için yeniden kullanılabilir şablonlar oluşturun

### 3. Ortam İzolasyonu
- Geliştirme/staging/üretim için ayrı ortamlar kullanın
- Yerel makineden doğrudan üretime dağıtım yapmayın
- Üretim dağıtımları için CI/CD hatlarını kullanın

### 4. Yapılandırma Yönetimi
- Hassas veriler için ortam değişkenlerini kullanın
- Yapılandırmayı sürüm kontrolünde tutun
- Ortama özel ayarları belgeleyin

## Öğrenme İlerlemesi

### Başlangıç (Hafta 1-2)
1. Azd'yi kurun ve kimlik doğrulaması yapın
2. Basit bir şablon dağıtın
3. Proje yapısını anlayın
4. Temel komutları öğrenin (up, down, deploy)

### Orta Seviye (Hafta 3-4)
1. Şablonları özelleştirin
2. Birden fazla ortam yönetin
3. Altyapı kodunu anlayın
4. CI/CD hatlarını kurun

### İleri Seviye (Hafta 5+)
1. Özel şablonlar oluşturun
2. Gelişmiş altyapı desenleri
3. Çok bölgeli dağıtımlar
4. Kurumsal düzeyde yapılandırmalar

## Sonraki Adımlar

- [Kurulum ve Yapılandırma](installation.md) - Azd'yi kurun ve yapılandırın
- [İlk Projeniz](first-project.md) - Uygulamalı eğitim
- [Yapılandırma Kılavuzu](configuration.md) - Gelişmiş yapılandırma seçenekleri

## Ek Kaynaklar

- [Azure Developer CLI Genel Bakış](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Örnekleri](https://github.com/Azure-Samples)

---

**Navigasyon**
- **Önceki Ders**: [README](../../README.md)
- **Sonraki Ders**: [Kurulum ve Yapılandırma](installation.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.