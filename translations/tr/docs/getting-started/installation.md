<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c58e92a5b56ad73610b95518b0eea386",
  "translation_date": "2025-09-17T21:55:38+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "tr"
}
-->
# Kurulum ve Ayar Kılavuzu

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md)
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-First Geliştirme](../ai-foundry/azure-ai-foundry-integration.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI (azd) aracını sisteminize nasıl kuracağınızı ve yapılandıracağınızı adım adım açıklayacaktır. Farklı işletim sistemleri için çeşitli kurulum yöntemlerini, kimlik doğrulama ayarlarını ve Azure dağıtımları için geliştirme ortamınızı hazırlamak üzere başlangıç yapılandırmasını öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda:
- Azure Developer CLI'yi işletim sisteminize başarıyla kurmuş olacaksınız
- Azure ile çeşitli yöntemler kullanarak kimlik doğrulama yapılandırması yapabileceksiniz
- Geliştirme ortamınızı gerekli ön koşullarla hazırlayabileceksiniz
- Farklı kurulum seçeneklerini ve her birinin ne zaman kullanılacağını anlayabileceksiniz
- Yaygın kurulum ve yapılandırma sorunlarını çözebileceksiniz

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra:
- Platformunuz için uygun yöntemi kullanarak azd'yi kurabileceksiniz
- azd auth login komutunu kullanarak Azure ile kimlik doğrulama yapabileceksiniz
- Kurulumunuzu doğrulayıp temel azd komutlarını test edebileceksiniz
- Geliştirme ortamınızı azd'nin en iyi şekilde kullanımı için yapılandırabileceksiniz
- Yaygın kurulum sorunlarını bağımsız olarak çözebileceksiniz

Bu kılavuz, işletim sisteminiz veya geliştirme ortamınız ne olursa olsun Azure Developer CLI'yi sisteminize kurmanıza ve yapılandırmanıza yardımcı olacaktır.

## Ön Koşullar

azd'yi kurmadan önce aşağıdakilere sahip olduğunuzdan emin olun:
- **Azure aboneliği** - [Ücretsiz bir hesap oluşturun](https://azure.microsoft.com/free/)
- **Azure CLI** - Kimlik doğrulama ve kaynak yönetimi için
- **Git** - Şablonları klonlamak ve sürüm kontrolü için
- **Docker** (isteğe bağlı) - Konteyner uygulamaları için

## Kurulum Yöntemleri

### Windows

#### Seçenek 1: PowerShell (Önerilen)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Seçenek 2: Windows Paket Yöneticisi (winget)
```cmd
winget install Microsoft.Azd
```

#### Seçenek 3: Chocolatey
```cmd
choco install azd
```

#### Seçenek 4: Manuel Kurulum
1. [GitHub](https://github.com/Azure/azure-dev/releases) üzerinden en son sürümü indirin
2. `C:\Program Files\azd\` dizinine çıkarın
3. PATH ortam değişkenine ekleyin

### macOS

#### Seçenek 1: Homebrew (Önerilen)
```bash
brew tap azure/azd
brew install azd
```

#### Seçenek 2: Kurulum Scripti
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 3: Manuel Kurulum
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Seçenek 1: Kurulum Scripti (Önerilen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 2: Paket Yöneticileri

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd, GitHub Codespaces içinde önceden kurulu olarak gelir. Bir codespace oluşturun ve azd'yi hemen kullanmaya başlayın.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Kurulumu Doğrulama

Kurulumdan sonra azd'nin doğru çalıştığını doğrulayın:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Beklenen çıktı:
```
azd version 1.5.0 (commit abc123)
```

## Kimlik Doğrulama Ayarları

### Azure CLI Kimlik Doğrulama (Önerilen)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Cihaz Kodu Kimlik Doğrulama
Başsız bir sistemdeyseniz veya tarayıcı sorunları yaşıyorsanız:
```bash
az login --use-device-code
```

### Hizmet Prensibi (CI/CD)
Otomatikleştirilmiş ortamlar için:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Yapılandırma

### Genel Yapılandırma
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Ortam Değişkenleri
Kabuk profilinize ekleyin (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE Entegrasyonu

### Visual Studio Code
Azure Developer CLI uzantısını kurun:
1. VS Code'u açın
2. Uzantılar bölümüne gidin (Ctrl+Shift+X)
3. "Azure Developer CLI" arayın
4. Uzantıyı yükleyin

Özellikler:
- azure.yaml için IntelliSense
- Entegre terminal komutları
- Şablon tarama
- Dağıtım izleme

### GitHub Codespaces
Bir `.devcontainer/devcontainer.json` oluşturun:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Azure eklentisini yükleyin
2. Azure kimlik bilgilerini yapılandırın
3. azd komutları için entegre terminali kullanın

## 🐛 Kurulum Sorunlarını Giderme

### Yaygın Sorunlar

#### İzin Reddedildi (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Sorunları
azd'yi PATH'e manuel olarak ekleyin:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Ağ/Proxy Sorunları
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Sürüm Çakışmaları
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Daha Fazla Yardım Alma
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd Güncelleme

### Otomatik Güncellemeler
azd, güncellemeler mevcut olduğunda sizi bilgilendirir:
```bash
azd version --check-for-updates
```

### Manuel Güncellemeler

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## Sonraki Adımlar

1. **Kimlik doğrulamayı tamamlayın**: Azure aboneliğinize erişebildiğinizden emin olun
2. **İlk dağıtımınızı deneyin**: [İlk Proje Kılavuzu](first-project.md) adımlarını takip edin
3. **Şablonları keşfedin**: `azd template list` komutuyla mevcut şablonlara göz atın
4. **IDE'nizi yapılandırın**: Geliştirme ortamınızı ayarlayın

## Destek

Sorunlarla karşılaşırsanız:
- [Resmi Dokümantasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sorun Bildirin](https://github.com/Azure/azure-dev/issues)
- [Topluluk Tartışmaları](https://github.com/Azure/azure-dev/discussions)
- [Azure Destek](https://azure.microsoft.com/support/)

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md) 
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-First Geliştirme](../ai-foundry/azure-ai-foundry-integration.md)

**✅ Kurulum Tamamlandı!** azd ile proje oluşturmaya başlamak için [İlk Projeniz](first-project.md) bölümüne devam edin.

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.