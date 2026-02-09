# Kurulum ve Kurulum Rehberi

**Bölüm Gezinme:**
- **📚 Dersin Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md)
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı rehber, sisteminize Azure Developer CLI (azd) kurulumunu ve yapılandırmasını nasıl yapacağınızı adım adım gösterecektir. Farklı işletim sistemleri için birden çok kurulum yöntemi, kimlik doğrulama kurulumu ve Azure dağıtımları için geliştirme ortamınızı hazırlamak üzere ilk yapılandırmayı öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda:
- İşletim sisteminizde Azure Developer CLI'yi başarılı bir şekilde kuracaksınız
- Azure ile birden çok yöntem kullanarak kimlik doğrulamasını yapılandıracaksınız
- Geliştirme ortamınızı gerekli önkoşullarla kuracaksınız
- Farklı kurulum seçeneklerini ve her birini ne zaman kullanmanız gerektiğini anlayacaksınız
- Yaygın kurulum ve yapılandırma sorunlarını giderebileceksiniz

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- Platformunuza uygun yöntemle azd'yi kurmak
- azd auth login kullanarak Azure ile kimlik doğrulamak
- Kurulumu doğrulamak ve temel azd komutlarını test etmek
- azd kullanımı için geliştirme ortamınızı en iyi şekilde yapılandırmak
- Yaygın kurulum problemlerini bağımsız olarak çözmek

Bu rehber, işletim sisteminiz veya geliştirme ortamınız ne olursa olsun Azure Developer CLI'yi sisteminize kurmanıza ve yapılandırmanıza yardımcı olacaktır.

## Ön Koşullar

azd'yi yüklemeden önce şunlara sahip olduğunuzdan emin olun:
- **Azure aboneliği** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - Kimlik doğrulama ve kaynak yönetimi için
- **Git** - Şablonları klonlamak ve sürüm kontrolü için
- **Docker** (isteğe bağlı) - Konteyner tabanlı uygulamalar için

## Kurulum Yöntemleri

### Windows

#### Seçenek 1: PowerShell (Önerilen)
```powershell
# Yönetici olarak veya yükseltilmiş ayrıcalıklarla çalıştırın
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
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Seçenek 1: Homebrew (Önerilen)
```bash
brew tap azure/azd
brew install azd
```

#### Seçenek 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 3: Manuel Kurulum
```bash
# İndir ve yükle
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Seçenek 1: Install Script (Önerilen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 2: Paket Yöneticileri

**Ubuntu/Debian:**
```bash
# Microsoft paket deposunu ekle
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd'yi yükle
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft paket deposunu ekle
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd, GitHub Codespaces içinde önceden yüklü gelir. Sadece bir codespace oluşturun ve hemen azd kullanmaya başlayın.

### Docker

```bash
# azd'yi bir konteyner içinde çalıştır
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Daha kolay kullanım için bir takma ad oluştur
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Kurulumu Doğrula

Kurulumdan sonra azd'nin düzgün çalıştığını doğrulayın:

```bash
# Sürümü kontrol et
azd version

# Yardımı görüntüle
azd --help

# Mevcut şablonları listele
azd template list
```

Beklenen çıktı:
```
azd version 1.x.x (commit xxxxxx)
```

**Not**: Gerçek sürüm numarası değişecektir. En son sürüm için [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) sayfasını kontrol edin.

**✅ Kurulum Başarı Kontrol Listesi:**
- [ ] `azd version` sürüm numarasını hatasız gösterir
- [ ] `azd --help` komut dökümantasyonunu görüntüler
- [ ] `azd template list` kullanılabilir şablonları gösterir
- [ ] `az account show` Azure aboneliğinizi görüntüler
- [ ] Bir test dizini oluşturup `azd init` komutunu başarılı bir şekilde çalıştırabilirsiniz

**Tüm kontroller geçtiyse, [İlk Projeniz](first-project.md)'e geçmeye hazırsınız!**

## Kimlik Doğrulama Ayarı

### Azure CLI Kimlik Doğrulaması (Önerilen)
```bash
# Henüz yüklü değilse Azure CLI'yi yükleyin
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure'a giriş yapın
az login

# Kimlik doğrulamasını doğrulayın
az account show
```

### Cihaz Kodu ile Kimlik Doğrulama
Başsız bir sistemdeyseniz veya tarayıcı sorunları yaşıyorsanız:
```bash
az login --use-device-code
```

### Servis Prensibi (CI/CD)
Otomatik ortamlarda:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Yapılandırma

### Genel Yapılandırma
```bash
# Varsayılan aboneliği ayarla
azd config set defaults.subscription <subscription-id>

# Varsayılan konumu ayarla
azd config set defaults.location eastus2

# Tüm yapılandırmayı görüntüle
azd config list
```

### Ortam Değişkenleri
Kabuk profilinize ekleyin (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure yapılandırması
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd yapılandırması
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Hata ayıklama günlük kaydını etkinleştir
```

## IDE Entegrasyonu

### Visual Studio Code
Azure Developer CLI uzantısını yükleyin:
1. VS Code'u açın
2. Uzantılar'a gidin (Ctrl+Shift+X)
3. "Azure Developer CLI" için arama yapın
4. Uzantıyı yükleyin

Özellikler:
- azure.yaml için IntelliSense
- Entegre terminal komutları
- Şablon taraması
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

## 🐛 Kurulum Sorun Giderme

### Yaygın Sorunlar

#### İzin Verilmiyor (Windows)
```powershell
# PowerShell'i Yönetici olarak çalıştırın
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Sorunları
azd'yi PATH'inize elle ekleyin:

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
# Proxy'yi yapılandır
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL doğrulamasını atla (üretim ortamı için önerilmez)
azd config set http.insecure true
```

#### Sürüm Çakışmaları
```bash
# Eski kurulumları kaldır
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Yapılandırmayı temizle
rm -rf ~/.azd
```

### Daha Fazla Yardım Alma
```bash
# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd <command> --debug

# Mevcut yapılandırmayı görüntüle
azd config list

# Mevcut dağıtım durumunu görüntüle
azd show
```

## azd'yi Güncelleme

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

## 💡 Sıkça Sorulan Sorular

<details>
<summary><strong>azd ile az CLI arasındaki fark nedir?</strong></summary>

**Azure CLI (az)**: Bireysel Azure kaynaklarını yönetmek için düşük seviyeli bir araç
- `az webapp create`, `az storage account create`
- Bir seferde tek kaynak
- Altyapı yönetimi odaklı

**Azure Developer CLI (azd)**: Tam uygulama dağıtımları için yüksek seviyeli bir araç
- `azd up` tüm uygulamayı ve gerekli kaynakları dağıtır
- Şablon tabanlı iş akışları
- Geliştirici verimliliği odaklı

**Her ikisine de ihtiyacınız var**: azd kimlik doğrulama için az CLI'yi kullanır
</details>

<details>
<summary><strong>Mevcut Azure kaynaklarıyla azd kullanabilir miyim?</strong></summary>

Evet! Şunları yapabilirsiniz:
1. Mevcut kaynakları azd ortamlarına ithal etmek
2. Bicep şablonlarınızda mevcut kaynaklara referans vermek
3. Yeni dağıtımlar için mevcut altyapıyla birlikte azd kullanmak

Detaylar için [Yapılandırma Kılavuzu](configuration.md)'na bakın.
</details>

<details>
<summary><strong>azd Azure Government veya Azure China ile çalışır mı?</strong></summary>

Evet, bulutu yapılandırın:
```bash
# Azure Hükümeti
az cloud set --name AzureUSGovernment
az login

# Azure Çin
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>azd'i CI/CD pipeline'larında kullanabilir miyim?</strong></summary>

Kesinlikle! azd otomasyona uygun olacak şekilde tasarlanmıştır:
- GitHub Actions entegrasyonu
- Azure DevOps desteği
- Servis prensibi ile kimlik doğrulama
- Etkileşimsiz mod

CI/CD kalıpları için [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)'na bakın.
</details>

<details>
<summary><strong>azd kullanmanın maliyeti nedir?</strong></summary>

azd kendisi **tamamen ücretsiz** ve açık kaynaktır. Yalnızca şu konuda ücretlendirirsiniz:
- Dağıttığınız Azure kaynakları
- Azure tüketim maliyetleri (hesaplama, depolama vb.)

Dağıtımdan önce maliyet tahmini için `azd provision --preview` komutunu kullanın.
</details>

## Sonraki Adımlar

1. **Kimlik doğrulamayı tamamlayın**: Azure aboneliğinize erişebildiğinizden emin olun
2. **İlk dağıtımınızı deneyin**: [İlk Proje Kılavuzu](first-project.md)'nu izleyin
3. **Şablonları keşfedin**: `azd template list` ile kullanılabilir şablonlara göz atın
4. **IDE'nizi yapılandırın**: Geliştirme ortamınızı ayarlayın

## Destek

Sorunla karşılaşırsanız:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Bölüm Gezinme:**
- **📚 Dersin Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md) 
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Kurulum Tamamlandı!** azd ile geliştirmeye başlamak için [İlk Projeniz](first-project.md)'e devam edin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanımından kaynaklanan herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->