# Kurulum ve Ayar Rehberi

**Bölüm Gezinmesi:**
- **📚 Kurs Ana Sayfası**: [Yeni Başlayanlar İçin AZD](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md)
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı rehber, Azure Developer CLI (azd)'yi sisteminize kurma ve yapılandırma adımlarında size yol gösterecektir. Farklı işletim sistemleri için birden fazla kurulum yöntemi, kimlik doğrulama kurulumu ve Azure dağıtımları için geliştirme ortamınızı hazırlamak üzere ilk yapılandırma adımlarını öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda şunları yapabileceksiniz:
- İşletim sisteminizde Azure Developer CLI'yi başarıyla kurmak
- Birden çok yöntemle Azure ile kimlik doğrulamayı yapılandırmak
- Gerekli önkoşullarla geliştirme ortamınızı kurmak
- Farklı kurulum seçeneklerini ve hangi durumda hangi seçeneğin kullanılacağını anlamak
- Yaygın kurulum ve yapılandırma sorunlarını gidermek

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- Platformunuza uygun yöntemi kullanarak azd'yi kurmak
- azd auth login kullanarak Azure ile kimlik doğrulaması yapmak
- Kurulumu doğrulamak ve temel azd komutlarını test etmek
- azd kullanımını en iyi hale getirmek için geliştirme ortamınızı yapılandırmak
- Yaygın kurulum problemlerini bağımsız olarak çözmek

Bu rehber, işletim sisteminiz veya geliştirme ortamınız ne olursa olsun Azure Developer CLI'yi sisteminize kurup yapılandırmanıza yardımcı olacaktır.

## Ön Koşullar

azd'yi kurmadan önce şunlara sahip olduğunuzdan emin olun:
- **Azure aboneliği** - [Ücretsiz bir hesap oluşturun](https://azure.microsoft.com/free/)
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
1. En son sürümü [GitHub](https://github.com/Azure/azure-dev/releases) üzerinden indirin
2. `C:\Program Files\azd\` klasörüne çıkarın
3. PATH ortam değişkenine ekleyin

### macOS

#### Seçenek 1: Homebrew (Önerilen)
```bash
brew tap azure/azd
brew install azd
```

#### Seçenek 2: Kurulum Betiği
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 3: Manuel Kurulum
```bash
# İndir ve yükle
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Seçenek 1: Kurulum Betiği (Önerilen)
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

azd, GitHub Codespaces'ta önceden kurulmuş olarak gelir. Sadece bir codespace oluşturun ve hemen azd kullanmaya başlayın.

### Docker

```bash
# azd'yi bir konteynerde çalıştır
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Daha kolay kullanım için bir takma ad oluştur
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Kurulumu Doğrulayın

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
azd version 1.x.x (commit xxxxxx)
```

**Not**: Gerçek sürüm numarası değişecektir. En son sürümü kontrol etmek için [Azure Developer CLI sürümleri](https://github.com/Azure/azure-dev/releases) sayfasına bakın.

**✅ Kurulum Başarı Kontrol Listesi:**
- [ ] `azd version` sürüm numarasını hata olmadan gösterir
- [ ] `azd --help` komut dokümantasyonunu gösterir
- [ ] `azd template list` kullanılabilir şablonları gösterir
- [ ] `az account show` Azure aboneliğinizi gösterir
- [ ] Bir test dizini oluşturup `azd init` komutunu başarıyla çalıştırabilirsiniz

**Tüm kontroller geçerse, [İlk Projeniz](first-project.md)'e devam etmeye hazırsınız!**

## Kimlik Doğrulama Ayarı

### Azure CLI Kimlik Doğrulaması (Önerilen)
```bash
# Zaten yüklü değilse Azure CLI'yi yükleyin
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure'a giriş yapın
az login

# Kimlik doğrulamasını kontrol edin
az account show
```

### Cihaz Kodu ile Kimlik Doğrulama
Eğer başsız bir sistemdeyseniz veya tarayıcı sorunları yaşıyorsanız:
```bash
az login --use-device-code
```

### Servis Principal (CI/CD)
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
# Varsayılan aboneliği ayarla
azd config set defaults.subscription <subscription-id>

# Varsayılan konumu ayarla
azd config set defaults.location eastus2

# Tüm yapılandırmaları görüntüle
azd config list
```

### Ortam Değişkenleri
Shell profilinize ekleyin (`.bashrc`, `.zshrc`, `.profile`):
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
2. Uzantılar bölümüne gidin (Ctrl+Shift+X)
3. "Azure Developer CLI" arayın
4. Uzantıyı yükleyin

Özellikler:
- azure.yaml için IntelliSense
- Entegre terminal komutları
- Şablonlarda gezinme
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

#### İzin Reddedildi (Windows)
```powershell
# PowerShell'i Yönetici olarak çalıştırın
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Sorunları
azd'yi manuel olarak PATH'inize ekleyin:

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
# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd <command> --debug

# Mevcut yapılandırmayı görüntüle
azd config list

# Mevcut dağıtım durumunu görüntüle
azd show
```

## azd Güncelleme

### Otomatik Güncellemeler
Güncellemeler mevcut olduğunda azd sizi bilgilendirir:
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

**Azure CLI (az)**: Bireysel Azure kaynaklarını yönetmek için düşük seviyeli araç
- `az webapp create`, `az storage account create`
- Bir seferde tek bir kaynak
- Altyapı yönetimi odaklı

**Azure Developer CLI (azd)**: Tam uygulama dağıtımları için yüksek seviyeli araç
- `azd up` tüm kaynaklarla birlikte uygulamayı dağıtır
- Şablon tabanlı iş akışları
- Geliştirici verimliliği odaklı

**Her ikisine de ihtiyaç vardır**: azd, kimlik doğrulama için az CLI'yi kullanır
</details>

<details>
<summary><strong>Mevcut Azure kaynaklarıyla azd kullanabilir miyim?</strong></summary>

Evet! Şunları yapabilirsiniz:
1. Mevcut kaynakları azd ortamlarına içe aktarın
2. Mevcut kaynaklara Bicep şablonlarınızda referans verin
3. Mevcut altyapıyla birlikte yeni dağıtımlar için azd kullanın

Detaylar için [Yapılandırma Rehberi](configuration.md)'ne bakın.
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
- Servis principal kimlik doğrulaması
- Etkileşimsiz mod

CI/CD desenleri için [Dağıtım Rehberi](../chapter-04-infrastructure/deployment-guide.md)'ne bakın.
</details>

<details>
<summary><strong>azd kullanmanın maliyeti nedir?</strong></summary>

azd kendisi **tamamen ücretsiz** ve açık kaynaktır. Yalnızca şu ödemeleri yaparsınız:
- Dağıttığınız Azure kaynakları
- Azure tüketim maliyetleri (hesaplama, depolama, vb.)

Dağıtım öncesi maliyet tahmini yapmak için `azd provision --preview` komutunu kullanın.
</details>

## Sonraki Adımlar

1. **Kimlik doğrulamayı tamamlayın**: Azure aboneliğinize erişebildiğinizden emin olun
2. **İlk dağıtımınızı deneyin**: [İlk Proje Rehberi](first-project.md)'i izleyin
3. **Şablonları keşfedin**: Kullanılabilir şablonlara `azd template list` ile göz atın
4. **IDE'nizi yapılandırın**: Geliştirme ortamınızı kurun

## Destek

Sorunla karşılaşırsanız:
- [Resmi Dokümantasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sorun Bildir](https://github.com/Azure/azure-dev/issues)
- [Topluluk Tartışmaları](https://github.com/Azure/azure-dev/discussions)
- [Azure Desteği](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` ile editörünüzde doğrudan Azure komut rehberliği alın

---

**Bölüm Gezinmesi:**
- **📚 Kurs Ana Sayfası**: [Yeni Başlayanlar İçin AZD](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Temelleri](azd-basics.md) 
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Kurulum Tamamlandı!** azd ile geliştirmeye başlamak için [İlk Projeniz](first-project.md)'e devam edin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi ana dilindeki metin, yetkili kaynak olarak kabul edilmelidir. Önemli bilgiler söz konusuysa, profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlaşılma veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->