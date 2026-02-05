# Kurulum ve Ayar Kılavuzu

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md)
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../microsoft-foundry/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI (azd) aracını sisteminize nasıl kuracağınızı ve yapılandıracağınızı adım adım açıklayacaktır. Farklı işletim sistemleri için çeşitli kurulum yöntemlerini, kimlik doğrulama ayarlarını ve Azure dağıtımları için geliştirme ortamınızı hazırlamak üzere başlangıç yapılandırmasını öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda:
- Azure Developer CLI'yi işletim sisteminize başarıyla kurmuş olacaksınız
- Azure ile çeşitli yöntemlerle kimlik doğrulama yapmayı öğreneceksiniz
- Geliştirme ortamınızı gerekli ön koşullarla kurmuş olacaksınız
- Farklı kurulum seçeneklerini ve her birinin ne zaman kullanılacağını anlayacaksınız
- Yaygın kurulum ve ayar sorunlarını çözebileceksiniz

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra:
- Platformunuz için uygun yöntemi kullanarak azd'yi kurabileceksiniz
- azd auth login ile Azure'da kimlik doğrulama yapabileceksiniz
- Kurulumunuzu doğrulayıp temel azd komutlarını test edebileceksiniz
- Geliştirme ortamınızı azd'yi en iyi şekilde kullanmak için yapılandırabileceksiniz
- Yaygın kurulum sorunlarını bağımsız olarak çözebileceksiniz

Bu kılavuz, işletim sisteminiz veya geliştirme ortamınız ne olursa olsun Azure Developer CLI'yi sisteminize kurmanıza ve yapılandırmanıza yardımcı olacaktır.

## Ön Koşullar

azd'yi kurmadan önce şunlara sahip olduğunuzdan emin olun:
- **Azure aboneliği** - [Ücretsiz bir hesap oluşturun](https://azure.microsoft.com/free/)
- **Azure CLI** - Kimlik doğrulama ve kaynak yönetimi için
- **Git** - Şablonları klonlamak ve sürüm kontrolü için
- **Docker** (isteğe bağlı) - Konteyner uygulamaları için

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
# İndir ve yükle
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

azd, GitHub Codespaces içinde önceden kurulu olarak gelir. Sadece bir codespace oluşturun ve azd'yi hemen kullanmaya başlayın.

### Docker

```bash
# Bir konteynerde azd çalıştır
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Daha kolay kullanım için bir takma ad oluştur
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Kurulumu Doğrulama

Kurulumdan sonra azd'nin doğru çalıştığını doğrulayın:

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
azd version 1.5.0 (commit abc123)
```

**✅ Kurulum Başarı Kontrol Listesi:**
- [ ] `azd version` hata olmadan sürüm numarasını gösteriyor
- [ ] `azd --help` komut belgelerini gösteriyor
- [ ] `azd template list` mevcut şablonları gösteriyor
- [ ] `az account show` Azure aboneliğinizi gösteriyor
- [ ] Test dizini oluşturup `azd init` komutunu başarıyla çalıştırabiliyorsunuz

**Tüm kontroller geçerse, [İlk Projeniz](first-project.md) bölümüne geçmeye hazırsınız!**

## Kimlik Doğrulama Ayarları

### Azure CLI Kimlik Doğrulama (Önerilen)
```bash
# Azure CLI'yi henüz yüklü değilse yükleyin
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure'a giriş yapın
az login

# Kimlik doğrulamayı doğrulayın
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

### Global Yapılandırma
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
export AZD_DEBUG=true  # Hata ayıklama günlüğünü etkinleştir
```

## IDE Entegrasyonu

### Visual Studio Code
Azure Developer CLI uzantısını yükleyin:
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
# PowerShell'i Yönetici olarak çalıştırın
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
# Proxy yapılandır
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL doğrulamasını atla (üretim için önerilmez)
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
# Hata ayıklama kaydını etkinleştir
export AZD_DEBUG=true
azd <command> --debug

# Ayrıntılı günlükleri görüntüle
azd logs

# Sistem bilgilerini kontrol et
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

## 💡 Sıkça Sorulan Sorular

<details>
<summary><strong>azd ile az CLI arasındaki fark nedir?</strong></summary>

**Azure CLI (az)**: Bireysel Azure kaynaklarını yönetmek için düşük seviyeli bir araç
- `az webapp create`, `az storage account create`
- Bir seferde bir kaynak
- Altyapı yönetimi odaklı

**Azure Developer CLI (azd)**: Tam uygulama dağıtımları için yüksek seviyeli bir araç
- `azd up` tüm uygulamayı tüm kaynaklarla birlikte dağıtır
- Şablon tabanlı iş akışları
- Geliştirici verimliliği odaklı

**Her ikisine de ihtiyacınız var**: azd, kimlik doğrulama için az CLI kullanır
</details>

<details>
<summary><strong>azd'yi mevcut Azure kaynaklarıyla kullanabilir miyim?</strong></summary>

Evet! Şunları yapabilirsiniz:
1. Mevcut kaynakları azd ortamlarına aktarabilirsiniz
2. Bicep şablonlarınızda mevcut kaynaklara referans verebilirsiniz
3. Mevcut altyapının yanında yeni dağıtımlar için azd'yi kullanabilirsiniz

Detaylar için [Yapılandırma Kılavuzu](configuration.md) bölümüne bakın.
</details>

<details>
<summary><strong>azd, Azure Government veya Azure China ile çalışır mı?</strong></summary>

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
<summary><strong>azd'yi CI/CD boru hatlarında kullanabilir miyim?</strong></summary>

Kesinlikle! azd otomasyon için tasarlanmıştır:
- GitHub Actions entegrasyonu
- Azure DevOps desteği
- Hizmet prensibi kimlik doğrulama
- Etkileşimsiz mod

CI/CD desenleri için [Dağıtım Kılavuzu](../deployment/deployment-guide.md) bölümüne bakın.
</details>

<details>
<summary><strong>azd kullanmanın maliyeti nedir?</strong></summary>

azd'nin kendisi **tamamen ücretsiz** ve açık kaynaklıdır. Sadece şunlar için ödeme yaparsınız:
- Dağıttığınız Azure kaynakları
- Azure tüketim maliyetleri (hesaplama, depolama vb.)

Dağıtımdan önce maliyetleri tahmin etmek için `azd provision --preview` komutunu kullanın.
</details>

## Sonraki Adımlar

1. **Kimlik doğrulamayı tamamlayın**: Azure aboneliğinize erişebildiğinizden emin olun
2. **İlk dağıtımınızı deneyin**: [İlk Proje Kılavuzu](first-project.md) bölümünü takip edin
3. **Şablonları keşfedin**: `azd template list` ile mevcut şablonlara göz atın
4. **IDE'nizi yapılandırın**: Geliştirme ortamınızı ayarlayın

## Destek

Sorunlarla karşılaşırsanız:
- [Resmi Belgeler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sorun Bildirin](https://github.com/Azure/azure-dev/issues)
- [Topluluk Tartışmaları](https://github.com/Azure/azure-dev/discussions)
- [Azure Destek](https://azure.microsoft.com/support/)

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md) 
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Kurulum Tamamlandı!** azd ile çalışmaya başlamak için [İlk Projeniz](first-project.md) bölümüne devam edin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->