# Kurulum ve Başlangıç Rehberi

**Bölüm Gezinme:**
- **📚 Kurs Anasayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Basics](azd-basics.md)
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-İlk Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI (azd)'yi sisteminize nasıl yükleyip yapılandıracağınızı adım adım gösterecektir. Farklı işletim sistemleri için birden fazla kurulum yöntemi, kimlik doğrulama ayarları ve Azure dağıtımları için geliştirme ortamınızı hazırlamak üzere başlangıç yapılandırmasını öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda şunları yapabileceksiniz:
- Azure Developer CLI'yi işletim sisteminize başarıyla yüklemek
- Azure ile kimlik doğrulamayı birden fazla yöntemle yapılandırmak
- Geliştirme ortamınızı gerekli önkoşullarla kurmak
- Farklı kurulum seçeneklerini ve her birini ne zaman kullanmanız gerektiğini anlamak
- Yaygın kurulum ve yapılandırma sorunlarını gidermek

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- Platformunuz için uygun yöntemi kullanarak azd'yi yüklemek
- azd auth login ile Azure'a kimlik doğrulaması yapmak
- Kurulumu doğrulamak ve temel azd komutlarını test etmek
- azd kullanımını en iyi hale getirecek şekilde geliştirme ortamınızı yapılandırmak
- Yaygın kurulum problemlerini bağımsız olarak çözmek

Bu kılavuz, işletim sisteminiz veya geliştirme ortamınız ne olursa olsun Azure Developer CLI'yi sisteminize yüklemenize ve yapılandırmanıza yardımcı olacaktır.

## Önkoşullar

azd'yi yüklemeden önce şunlara sahip olduğunuzdan emin olun:
- **Azure subscription** - [Ücretsiz hesap oluşturun](https://azure.microsoft.com/free/)
- **Azure CLI** - Kimlik doğrulama ve kaynak yönetimi için
- **Git** - Şablonları klonlama ve sürüm kontrolü için
- **Docker** (isteğe bağlı) - Konteyner tabanlı uygulamalar için

## Kurulum Yöntemleri

### Windows

#### Seçenek 1: Windows Paket Yöneticisi (Önerilen)
```cmd
winget install microsoft.azd
```

#### Seçenek 2: PowerShell Yükleme Betiği
```powershell
# winget kullanılamadığında faydalıdır
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Seçenek 3: Chocolatey
```cmd
choco install azd
```

#### Seçenek 4: Manuel Kurulum
1. En son sürümü [GitHub](https://github.com/Azure/azure-dev/releases)'den indirin
2. `C:\Program Files\azd\` dizinine çıkarın
3. PATH ortam değişkenine ekleyin

### macOS

#### Seçenek 1: Homebrew (Önerilen)
```bash
brew tap azure/azd
brew install azd
```

#### Seçenek 2: Yükleme Betiği
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 3: Manuel Kurulum
```bash
# İndir ve yükle
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Seçenek 1: Yükleme Betiği (Önerilen)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Seçenek 2: Paket Yöneticileri

**Sürüm varlıklarından manuel kurulum:**
```bash
# Linux mimariniz için en son arşivi şu adresten indirin:
# https://github.com/Azure/azure-dev/releases
# Ardından arşivi çıkarın ve azd ikili dosyasını PATH'ınıza ekleyin.
```

### GitHub Codespaces

Bazı Codespaces ve geliştirme kapsayıcı (dev container) ortamları zaten `azd` içerir, ancak varsaymak yerine bunu doğrulamalısınız:

```bash
azd version
```

Eğer `azd` eksikse, ortam için standart betikle yükleyin.

### Docker

```bash
# azd'yi bir konteyner içinde çalıştır
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Daha kolay kullanım için bir takma ad oluştur
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Kurulumu Doğrulayın

Kurulumdan sonra azd'nin düzgün çalıştığını doğrulayın:

```bash
# Sürümü kontrol et
azd version

# Yardımı görüntüle
azd --help

# Kullanılabilir şablonları listele
azd template list
```

Beklenen çıktı:
```
azd version 1.x.x (commit xxxxxx)
```

**Not**: Gerçek sürüm numarası değişebilir. En son sürüm için [Azure Developer CLI sürümleri](https://github.com/Azure/azure-dev/releases) sayfasına bakın.

**✅ Kurulum Başarısı Kontrol Listesi:**
- [ ] `azd version` hata vermeden sürüm numarasını gösterir
- [ ] `azd --help` komut belgelerini gösterir
- [ ] `azd template list` kullanılabilir şablonları gösterir
- [ ] Bir test dizini oluşturup `azd init`'i başarıyla çalıştırabilirsiniz

**Eğer tüm kontroller geçerse, [İlk Projeniz](first-project.md)'e geçmeye hazırsınız!**

## Kimlik Doğrulama Ayarı

### Yeni Başlayanlar için Önerilen Kurulum

AZD-öncelikli iş akışları için `azd auth login` ile oturum açın.

```bash
# azd up gibi AZD komutları için gereklidir
azd auth login

# AZD kimlik doğrulama durumunu doğrulayın
azd auth login --check-status
```

Azure CLI ile oturum açmayı yalnızca kurs sırasında kendiniz `az` komutları çalıştırmayı planlıyorsanız kullanın.

### Azure CLI Kimlik Doğrulaması (İsteğe Bağlı)
```bash
# Azure CLI yüklü değilse yükleyin
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: dağıtımınız için Azure CLI kurulum belgelerine bakın

# Azure'a giriş yapın
az login

# Kimlik doğrulamasını doğrulayın
az account show
```

### Hangi Oturum Açma Akışını Kullanmalısınız?

- Başlangıç AZD yolunu takip ediyor ve ağırlıklı olarak `azd` komutları çalıştırıyorsanız `azd auth login` kullanın.
- Doğrudan kaynakları incelemek veya `az account show` gibi Azure CLI komutları çalıştırmak istediğinizde ayrıca `az login` kullanın.
- Bir egzersiz hem `azd` hem `az` komutlarını içeriyorsa, başta her iki oturum açma komutunu bir kez çalıştırın.

### Cihaz Kodu ile Kimlik Doğrulama
Başsız bir sistemdeyseniz veya tarayıcı sorunları yaşıyorsanız:
```bash
azd auth login --use-device-code
```

### Servis Prensibi (CI/CD)
Otomatik ortamlarda:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Tam Kurulumunuzu Doğrulayın

Bölüm 1'e başlamadan önce hızlı bir hazır olma kontrolü yapmak istiyorsanız:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Yapılandırma

### Genel Yapılandırma
```bash
# Varsayılan aboneliği ayarla
azd config set defaults.subscription <subscription-id>

# Varsayılan konumu ayarla
azd config set defaults.location eastus2

# Tüm yapılandırmayı görüntüle
azd config show
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
2. Uzantılar bölümüne gidin (Ctrl+Shift+X)
3. "Azure Developer CLI" arayın
4. Uzantıyı yükleyin

Özellikler:
- azure.yaml için IntelliSense
- Entegre terminal komutları
- Şablon gezintisi
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
3. Entegre terminali `azd` komutları için kullanın

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
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: yeniden yüklemeden önce önceki azd ikili dosyasını veya sembolik bağlantısını kaldırın

# Yapılandırmayı temizle
rm -rf ~/.azd
```

### Daha Fazla Yardım Alma
```bash
# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd <command> --debug

# Geçerli yapılandırmayı görüntüle
azd config show

# Geçerli dağıtım durumunu görüntüle
azd show
```

## azd'yi Güncelleme

### Güncelleme Kontrolü
azd daha yeni bir sürüm olduğunda uyarır ve mevcut build'inizi doğrulayabilirsiniz:
```bash
azd version
```

### Manuel Güncellemeler

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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
- Her seferinde tek bir kaynak
- Altyapı yönetimi odaklı

**Azure Developer CLI (azd)**: Tam uygulama dağıtımları için yüksek seviyeli araç
- `azd up` tüm uygulamayı ve tüm kaynakları dağıtır
- Şablon tabanlı iş akışları
- Geliştirici verimliliği odaklı

**Her ikisine de ihtiyacınız var**: azd kimlik doğrulama için az CLI'yi kullanır
</details>

<details>
<summary><strong>Mevcut Azure kaynaklarıyla azd kullanabilir miyim?</strong></summary>

Evet! Şunları yapabilirsiniz:
1. Mevcut kaynakları azd ortamlarına içe aktarın
2. Bicep şablonlarınızda mevcut kaynaklara referans verin
3. Yeni dağıtımlarda azd'yi mevcut altyapıyla birlikte kullanın

Detaylar için [Yapılandırma Kılavuzu](configuration.md)'na bakın.
</details>

<details>
<summary><strong>azd Azure Government veya Azure China ile çalışıyor mu?</strong></summary>

Evet, bulut ortamını yapılandırın:
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
- Servis prensibi kimlik doğrulaması
- Etkileşimsiz mod

CI/CD kalıpları için [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)'na bakın.
</details>

<details>
<summary><strong>azd kullanmanın maliyeti nedir?</strong></summary>

azd kendisi **tamamen ücretsiz** ve açık kaynaklıdır. Sadece şunlar için ödeme yaparsınız:
- Dağıttığınız Azure kaynakları
- Azure tüketim maliyetleri (hesaplama, depolama vb.)

Dağıtımdan önce maliyetleri tahmin etmek için `azd provision --preview` kullanın.
</details>

## Sonraki Adımlar

1. **Kimlik doğrulamayı tamamlayın**: Azure aboneliğinize erişebildiğinizden emin olun
2. **İlk dağıtımınızı deneyin**: [İlk Proje Kılavuzu](first-project.md)'nu izleyin
3. **Şablonları keşfedin**: `azd template list` ile kullanılabilir şablonlara göz atın
4. **IDE'nizi yapılandırın**: Geliştirme ortamınızı kurun

## Destek

Sorunla karşılaşırsanız:
- [Resmi Belgeler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sorun Bildir](https://github.com/Azure/azure-dev/issues)
- [Topluluk Tartışmaları](https://github.com/Azure/azure-dev/discussions)
- [Azure Destek](https://azure.microsoft.com/support/)
- [**Azure Agent Becerileri**](https://skills.sh/microsoft/github-copilot-for-azure) - Editörünüzde doğrudan Azure komut rehberliği almak için `npx skills add microsoft/github-copilot-for-azure` kullanın

---

**Bölüm Gezinme:**
- **📚 Kurs Anasayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [AZD Basics](azd-basics.md) 
- **➡️ Sonraki**: [İlk Projeniz](first-project.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-İlk Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Kurulum Tamamlandı!** azd ile üretmeye başlamak için [İlk Projeniz](first-project.md)'e devam edin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Sorumluluk Reddi**:
Bu belge, yapay zekâ çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi ana dilindeki hâli yetkili kaynak olarak kabul edilmelidir. Kritik bilgi gerektiren durumlarda profesyonel insan çevirisi önerilir. Bu çevirinin kullanımıyla ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->