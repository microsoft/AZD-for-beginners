# AZD Yeni Başlayanlar İçin: Yapılandırılmış Bir Öğrenme Yolculuğu

![AZD-for-beginners](../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](./README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Yerel Olarak Klonlamak Tercihiniz Mi?**
>
> Bu depoda 50'den fazla dil çevirisi bulunmaktadır ve bu, indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sınırlandırılmış kontrol kullanın:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı bir indirme ile size sağlar.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Bugün azd'de Neler Yeni

> 📌 Bu kurs **`azd 1.27.1`** (Temmuz 2026) sürümüne göre doğrulanmıştır. Kendi kurulumunuzu kontrol etmek için `azd version`, en güncel sürümü almak için `azd upgrade` çalıştırın.

Azure Developer CLI, geleneksel web uygulamaları ve API'lerin ötesine geçti. Bugün azd, Azure'a **her tür** uygulamayı dağıtmak için tek araçtır—yapay zekâ destekli uygulamalar ve akıllı ajanlar dahil.

İşte sizin için anlamı şu:

- **Yapay zekâ ajanları artık birinci sınıf azd iş yükleridir.** Zaten bildiğiniz aynı `azd init` → `azd up` iş akışıyla AI ajan projeleri başlatabilir, dağıtabilir ve yönetebilirsiniz.
- **CLI'den tam bir ajan yaşam döngüsü.** `azure.ai.agents` uzantısı artık tüm süreci kapsıyor—kafes oluşturmak için `azd ai agent init`, test etmek için `azd ai agent invoke` (yanıt süreleri ile birlikte), kaliteyi ölçmek ve geliştirmek için `azd ai agent eval generate` ve `azd ai agent optimize`, ve temizlemek için `azd ai agent delete`.
- **Daha fazla AI yapı bloğu.** Yeni önizleme uzantıları—`azure.ai.skills` ve `azure.ai.connections`—azd ile yeniden kullanılabilir ajan yeteneklerini ve Foundry bağlantılarını doğrudan yönetmenizi sağlar.
- **Microsoft Foundry entegrasyonu** model dağıtımı, ajan barındırma ve AI servis yapılandırmasını doğrudan azd şablon ekosistemine getiriyor.
- **Günlük temel işlemler daha sorunsuz.** Son sürümler `azd init`'i çok çalıştırılabilir yaptı, `azd auth login` eski belirteçleri otomatik temizleme yeteneği kazandı ve dostane bir `azd tool` ilk çalıştırma kurulumları mesajı eklendi.
- **Temel iş akışı değişmedi.** İster bir todo uygulaması dağıtıyor olun, ister bir mikro servis ya da çok ajanlı AI çözümü, komutlar aynıdır.

> **Aspire kullanıcıları için not:** Microsoft artık ürünü basitçe **Aspire** olarak adlandırıyor (önceden ".NET Aspire"). azd'nin Aspire desteği değişmedi—sadece isim güncellendi.

Azd'yi daha önce kullandıysanız, AI desteği doğal bir uzantıdır—ayrı bir araç ya da ileri seviye bir yol değil. Eğer yeni başlıyorsanız, her şey için çalışan tek bir iş akışı öğreneceksiniz.

---

## 🚀 Azure Developer CLI (azd) Nedir?

**Azure Developer CLI (azd)**, uygulamaları Azure'a dağıtmayı kolaylaştıran geliştirici dostu bir komut satırı aracıdır. Onlarca Azure kaynağını elle oluşturup bağlamak yerine, tek bir komutla tüm uygulamaları dağıtabilirsiniz.

### `azd up` Büyüsü

```bash
# Bu tek komut her şeyi yapar:
# ✅ Tüm Azure kaynaklarını oluşturur
# ✅ Ağ ve güvenliği yapılandırır
# ✅ Uygulama kodunuzu oluşturur
# ✅ Azure'a dağıtır
# ✅ Size çalışan bir URL verir
azd up
```

**Bu kadar!** Azure Portal'da tıklama yok, karmaşık ARM şablonları öğrenmek yok, elle yapılandırma yok - sadece Azure üzerinde çalışan uygulamalar.

---

## ❓ Azure Developer CLI ile Azure CLI Arasındaki Fark Nedir?

Yeni başlayanların en sık sorduğu sorudur. İşte basit cevabı:

| Özellik | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Amaç** | Bireysel Azure kaynaklarını yönetmek | Tam uygulamalar dağıtmak |
| **Zihniyet** | Altyapı odaklı | Uygulama odaklı |
| **Örnek** | `az webapp create --name myapp...` | `azd up` |
| **Öğrenme Eğrisi** | Azure servisleri bilinmeli | Uygulamanı bil |
| **En İyi Kimler İçin** | DevOps, Altyapı | Geliştiriciler, Prototip Oluşturma |

### Basit Bir Benzetme

- **Azure CLI** ev inşa etmek için tüm araçlara sahip olmak gibidir - çekiciler, testereler, çiviler. Her şeyi yapabilirsiniz, ama inşaatı bilmeniz gerekir.
- **Azure Developer CLI** ise bir yüklenici tutmaya benzer - ne istediğinizi anlatırsınız, onlar inşaatı yapar.

### Ne Zaman Hangisini Kullanmalı

| Senaryo | Bu Aracı Kullanın |
|----------|----------|
| "Web uygulamamı hızlıca dağıtmak istiyorum" | `azd up` |
| "Sadece bir depolama hesabı oluşturmalıyım" | `az storage account create` |
| "Tam bir AI uygulaması yapıyorum" | `azd init --template azure-search-openai-demo` |
| "Belirli bir Azure kaynağını hata ayıklamalıyım" | `az resource show` |
| "Dakikalar içinde üretim hazır dağıtım istiyorum" | `azd up --environment production` |

### Birlikte Çalışırlar!

AZD, Azure CLI'yi arka planda kullanır. İkisini birden kullanabilirsiniz:
```bash
# Uygulamanızı AZD ile dağıtın
azd up

# Ardından Azure CLI ile belirli kaynakları ince ayar yapın
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD'de Şablonları Bulun

Baştan başlamayın! **Awesome AZD**, topluluğun kullanıma hazır dağıtım şablonları koleksiyonudur:

| Kaynak | Açıklama |
|----------|-------------|
| 🔗 [**Awesome AZD Galerisi**](https://azure.github.io/awesome-azd/) | Tek tıkla dağıtım için 200+ şablon göz atın |
| 🔗 [**Şablon Gönder**](https://github.com/Azure/awesome-azd/issues) | Kendi şablonunuzu topluluğa katkıda bulunun |
| 🔗 [**GitHub Deposu**](https://github.com/Azure/awesome-azd) | Kaynak kodunu yıldızlayın ve keşfedin |

### Awesome AZD'den Popüler AI Şablonları

```bash
# Microsoft Foundry Modelleri + AI Arama ile RAG Sohbeti
azd init --template azure-search-openai-demo

# Hızlı AI Sohbet Uygulaması
azd init --template openai-chat-app-quickstart

# Foundry Ajanları ile AI Ajanları
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 Adımda Başlangıç

Başlamadan önce, dağıtmak istediğiniz şablon için makinenizin hazır olduğundan emin olun:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Gerekli herhangi bir kontrol başarısız olursa, önce onu düzeltin ve ardından hızlı başlangıca devam edin.

### 1. Adım: AZD'yi Yükleyin (2 dakika)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 2. Adım: AZD için Kimlik Doğrulaması Yapın

```bash
# Bu kursta Azure CLI komutlarını doğrudan kullanmayı planlıyorsanız isteğe bağlıdır
az login

# AZD iş akışları için gereklidir
azd auth login
```

Hangi yöntemi kullanacağınızdan emin değilseniz, [Kurulum & Ayar](docs/chapter-01-foundation/installation.md#authentication-setup) bölümündeki tam kurulum akışını izleyin.

### 3. Adım: İlk Uygulamanızı Dağıtın

```bash
# Bir şablondan başlat
azd init --template todo-nodejs-mongo

# Azure'a dağıt (her şeyi oluşturur!)
azd up
```

**🎉 Hepsi bu kadar!** Uygulamanız artık Azure üzerinde canlı.

### Temizleme (Unutmayın!)

```bash
# Deneme bittikten sonra tüm kaynakları kaldırın
azd down --force --purge
```

---

## 📚 Bu Kurs Nasıl Kullanılır

Bu kurs **ilerleyerek öğrenme** prensibine göre tasarlanmıştır - rahat olduğunuz yerden başlayın ve yukarı doğru ilerleyin:

| Deneyiminiz | Buradan Başlayın |
|-----------------|------------|
| **Azure'a yeniyseniz** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **Azure'ı biliyor, AZD'ye yeniyseniz** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **AI uygulamaları dağıtmak istiyorsanız** | [Bölüm 2: AI-Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Pratik yapmak istiyorsanız** | [🎓 Etkileşimli Atölye](workshop/README.md) - 3-4 saat rehberli laboratuvar |
| **Üretim kalıplarına ihtiyacınız varsa** | [Bölüm 8: Üretim & Kurumsal](#-chapter-8-production--enterprise-patterns) |

### Hızlı Kurulum

1. **Fork Yapın**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonlayın**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Yardım Alın**: [Azure Discord Topluluğu](https://discord.com/invite/ByRwuEEgH4)

> **Yerel Olarak Klonlamayı Tercih Ediyor musunuz?**

> Bu depo 50+ dil çevirisi içerdiğinden, indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sınırlandırılmış kontrol kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı bir indirme ile sağlar.


## Kurs Genel Bakışı

Azure Developer CLI (azd) öğrenimini ilerleyici bölümlerle uzmanlaşın. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel vurgu.**


### Bu Kursun Modern Geliştiriciler İçin Neden Önemli Olduğu

Microsoft Foundry Discord topluluğu içgörülerine dayanarak, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şunlarla karşılaşıyorlar:
- Karmaşık çok servisli AI mimarileri
- Üretim AI dağıtım en iyi uygulamaları  
- Azure AI servisi entegrasyonu ve konfigürasyonu
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarının sorun giderilmesi

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerini Öğrenin**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry servisleri ile kullanın
- **Altyapıyı Kod olarak Uygulayın**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtımları Sorun Giderin**: Yaygın sorunları çözün ve hata ayıklayın
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Oluşturun**: Karmaşık AI mimarilerini dağıtın

## Başlamadan Önce: Hesaplar, Erişim ve Varsayımlar

1. Bölüm'e başlamadan önce aşağıdaki gereksinimlerin hazır olduğundan emin olun. Bu rehberdeki kurulum adımları bu temellerin halihazırda tamamlanmış olduğunu varsayar.

- **Bir Azure aboneliği**: İş yerinizden veya kendi hesabınızdan mevcut bir abonelik kullanabilir veya başlamak için [ücretsiz deneme](https://aka.ms/azurefreetrial) oluşturabilirsiniz.
- **Azure kaynakları oluşturma izni**: Çoğu egzersiz için hedef abonelik veya kaynak grubunda en az **Katkıda Bulunan** erişimine sahip olmalısınız. Bazı bölümler ayrıca kaynak grupları, yönetilen kimlikler ve RBAC atamaları oluşturabileceğinizi varsayabilir.
- [**Bir GitHub hesabı**](https://github.com): Depoyu çatallamak, kendi değişikliklerinizi takip etmek ve atölye için GitHub Codespaces kullanmak için faydalıdır.
- **Şablon çalışma zamanı önkoşulları**: Bazı şablonlar Node.js, Python, Java veya Docker gibi yerel araçlara ihtiyaç duyar. Başlamadan önce kurulum doğrulayıcıyı çalıştırarak eksik araçları erken tespit edin.
- **Temel terminal bilgisi**: Uzman olmanıza gerek yok, ancak `git clone`, `azd auth login` ve `azd up` gibi komutları rahatça çalıştırabilmelisiniz.

> **Kurumsal abonelikte mi çalışıyorsunuz?**
> Azure ortamınız bir yönetici tarafından yönetiliyorsa, kullanmayı planladığınız abonelikte veya kaynak grubunda kaynak oluşturma izninizin olduğundan önceden emin olun. Eğer yoksa, başlamadan önce bir sandbox abonelik veya Katkıda Bulunan erişim talep edin.

> **Azure'a yeni misiniz?**
> Kendi Azure denemeniz veya kullandıkça öde aboneliğiniz ile https://aka.ms/azurefreetrial adresinde başlayın, böylece kiracı seviyesinde onayları beklemeden egzersizleri baştan sona tamamlayabilirsiniz.

## 🗺️ Kurs Haritası: Bölüm Bazında Hızlı Gezinme

Her bölüm, öğrenme hedefleri, hızlı başlangıçlar ve egzersizler içeren özel bir README dosyasına sahiptir:

| Bölüm | Konu | Dersler | Süre | Zorluk |
|---------|-------|---------|----------|------------|
| **[Bölüm 1: Temel](docs/chapter-01-foundation/README.md)** | Başlangıç | [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) &#124; [Kurulum](docs/chapter-01-foundation/installation.md) &#124; [İlk Proje](docs/chapter-01-foundation/first-project.md) | 30-45 dk | ⭐ |
| **[Bölüm 2: AI Geliştirme](docs/chapter-02-ai-development/README.md)** | AI-Öncelikli Uygulamalar | [Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Ajanları](docs/chapter-02-ai-development/agents.md) &#124; [Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atölye](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saat | ⭐⭐ |
| **[Bölüm 3: Konfigürasyon](docs/chapter-03-configuration/README.md)** | Kimlik Doğrulama & Güvenlik | [Konfigürasyon](docs/chapter-03-configuration/configuration.md) &#124; [Kimlik Doğrulama & Güvenlik](docs/chapter-03-configuration/authsecurity.md) | 45-60 dk | ⭐⭐ |
| **[Bölüm 4: Altyapı](docs/chapter-04-infrastructure/README.md)** | Kod Olarak Altyapı & Dağıtım | [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Tahsis](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 saat | ⭐⭐⭐ |
| **[Bölüm 5: Çoklu Ajan](docs/chapter-05-multi-agent/README.md)** | AI Ajan Çözümleri | [Perakende Senaryosu](examples/retail-scenario.md) &#124; [Koordinasyon Kalıpları](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[Bölüm 6: Ön Dağıtım](docs/chapter-06-pre-deployment/README.md)** | Planlama & Doğrulama | [Ön Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasite Planlama](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uygulama İçgörüleri](docs/chapter-06-pre-deployment/application-insights.md) | 1 saat | ⭐⭐ |
| **[Bölüm 7: Sorun Giderme](docs/chapter-07-troubleshooting/README.md)** | Hata Ayıklama & Düzeltme | [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Sorunları](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 saat | ⭐⭐ |
| **[Bölüm 8: Üretim](docs/chapter-08-production/README.md)** | Kurumsal Kalıplar | [Üretim Uygulamaları](docs/chapter-08-production/production-ai-practices.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[🎓 Atölye](workshop/README.md)** | Pratik Laboratuvar | [Giriş](workshop/docs/instructions/0-Introduction.md) &#124; [Seçim](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Analiz](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kapanış](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saat | ⭐⭐ |

**Toplam Kurs Süresi:** ~10-14 saat | **Yetenek Gelişimi:** Başlangıç → Üretim Hazır

---

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel & Hızlı Başlangıç
**Gereksinimler**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Zorluk**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temellerini anlamak
- AZD'yi platformunuza kurmak
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure Developer CLI Nedir?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Kurulum & Ayarlar](docs/chapter-01-foundation/installation.md) - Platforma özel rehberler
- **🛠️ Pratik**: [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Adım adım öğretici
- **📋 Hızlı Referans**: [Komut Kopyası](resources/cheat-sheet.md)

#### Pratik Egzersizler
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Sonucu**: Basit bir web uygulamasını AZD kullanarak Azure'a başarıyla dağıtmak

**✅ Başarı Doğrulaması:**
```bash
# Bölüm 1'i tamamladıktan sonra şunları yapabilmelisiniz:
azd version              # Yüklü sürümü gösterir
azd init --template todo-nodejs-mongo  # Projeyi başlatır
azd up                  # Azure'a dağıtır
azd show                # Çalışan uygulamanın URL'sini gösterir
# Uygulama tarayıcıda açılır ve çalışır
azd down --force --purge  # Kaynakları temizler
```

**📊 Zaman Yatırımı:** 30-45 dakika  
**📈 Sonraki Yetenek Seviyesi:** Temel uygulamaları bağımsız şekilde dağıtabilir
**📈 Sonraki Yetenek Seviyesi:** Temel uygulamaları bağımsız şekilde dağıtabilir

---

### 🤖 Bölüm 2: AI-Öncelikli Geliştirme (AI Geliştiriciler İçin Önerilir)
**Gereksinimler**: Bölüm 1 tamamlandı  
**Süre**: 1-2 saat  
**Zorluk**: ⭐⭐

#### Öğrenecekleriniz
- Microsoft Foundry ile AZD entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI servis yapılandırmalarını anlamak

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Ajanları**: [AI Ajanlar Kılavuzu](docs/chapter-02-ai-development/agents.md) - AZD ile akıllı ajanların dağıtımı
- **📖 Kalıplar**: [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [AI Atölye Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD'ye hazırlayın
- **🎥 Etkileşimli Kılavuz**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme MkDocs ve DevContainer Ortamı ile
- **📋 Şablonlar**: [Microsoft Foundry Şablonları](#atölye-kaynakları)
- **📝 Örnekler**: [AZD Dağıtım Örnekleri](examples/README.md)

#### Pratik Egzersizler
```bash
# İlk yapay zeka uygulamanızı dağıtın
azd init --template azure-search-openai-demo
azd up

# Ek yapay zeka şablonlarını deneyin
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Bölüm Sonucu**: RAG özelliklerine sahip AI destekli bir sohbet uygulamasını dağıtmak ve yapılandırmak

**✅ Başarı Doğrulaması:**
```bash
# 2. Bölümden sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test edin
# Sorular sorun ve kaynaklı yapay zeka destekli yanıtlar alın
# Arama entegrasyonunun çalıştığını doğrulayın
azd monitor  # Application Insights'ın telemetri gösterdiğini kontrol edin
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 Sonraki Yetenek Seviyesi:** Üretim hazır AI uygulamalarını dağıtabilir ve yapılandırabilir  
**💰 Maliyet Bilinci:** Aylık 80-150 $ geliştirme, aylık 300-3500 $ üretim maliyetlerini anlayın

#### 💰 AI Dağıtımları İçin Maliyet Düşünceleri

**Geliştirme Ortamı (Tahmini aylık 80-150 $):**
- Microsoft Foundry Modelleri (Kullandıkça öde): Aylık 0-50 $ (token kullanımına bağlı)
- AI Arama (Temel katman): Aylık 75 $
- Konteyner Uygulamaları (Tüketim): Aylık 0-20 $
- Depolama (Standart): Aylık 1-5 $

**Üretim Ortamı (Tahmini aylık 300-3.500+ $):**
- Microsoft Foundry Modelleri (Tutarlı performans için PTU): Aylık 3.000+ $ YA DA Yüksek hacimli kullandıkça öde
- AI Arama (Standart katman): Aylık 250 $
- Konteyner Uygulamaları (Özel): Aylık 50-100 $
- Uygulama İçgörüsü: Aylık 5-50 $
- Depolama (Premium): Aylık 10-50 $

**💡 Maliyet Optimizasyon İpuçları:**
- Öğrenmek için **Ücretsiz Katman** Microsoft Foundry Modellerini kullanın (Azure OpenAI 50.000 token/ay dahil)
- Aktif geliştirme yoksa kaynakları boşaltmak için `azd down` komutunu çalıştırın
- Tüketim bazlı faturalama ile başlayın, PTU'ya sadece üretim için yükseltin
- Dağıtımdan önce maliyetleri tahmin etmek için `azd provision --preview` komutunu kullanın
- Otomatik ölçeklendirmeyi etkinleştirin: sadece gerçek kullanım için ödeme yapın

**Maliyet İzleme:**
```bash
# Tahmini aylık maliyetleri kontrol edin
azd provision --preview

# Azure Portal'da gerçek maliyetleri izleyin
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bölüm 3: Konfigürasyon & Kimlik Doğrulama
**Gereksinimler**: Bölüm 1 tamamlandı  
**Süre**: 45-60 dakika  
**Zorluk**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak isimlendirme ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Konfigürasyon**: [Konfigürasyon Kılavuzu](docs/chapter-03-configuration/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik Doğrulama desenleri ve yönetilen kimlik](docs/chapter-03-configuration/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulaması Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Egzersizler
- Birden fazla ortamı yapılandırın (geliştirme, hazırlık, üretim)
- Yönetilen kimlik kimlik doğrulamayı ayarlayın
- Ortama özgü yapılandırmaları uygulayın

**💡 Bölüm Sonucu**: Doğru kimlik doğrulama ve güvenlik ile birden çok ortamı yönetin

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı & Dağıtım
**Gereksinimler**: Bölümler 1-3 tamamlandı  
**Süre**: 1-1,5 saat  
**Zorluk**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri düzey dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak tahsis stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Kılavuzu](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- **🏗️ Tahsis**: [Kaynak Tahsisi](docs/chapter-04-infrastructure/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Konteyner Uygulama Örneği](../../examples/container-app) - Konteynerli dağıtımlar

#### Pratik Egzersizler
- Özel Bicep şablonları oluşturun
- Çok servisli uygulamalar dağıtın
- Mavi-yeşil dağıtım stratejilerini uygulayın

**💡 Bölüm Sonucu**: Özel altyapı şablonları kullanarak karmaşık çok servisli uygulamalar dağıtın

---


### 🎯 Bölüm 5: Çoklu Ajan AI Çözümleri (İleri Düzey)
**Önkoşullar**: Bölümler 1-2 tamamlandı  
**Süre**: 2-3 saat  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari kalıpları
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır AI dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- **📖 Mimari**: [Çoklu ajan koordinasyon kalıpları](docs/chapter-06-pre-deployment/coordination-patterns.md) - Kalıplar

#### Pratik Alıştırmalar
```bash
# Tam perakende çoklu ajan çözümünü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Sonucu**: Müşteri ve Envanter ajanları ile üretime hazır çoklu ajan AI çözümü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Dağıtımdan Önce Doğrulama ve Planlama
**Önkoşullar**: Bölüm 4 tamamlandı  
**Süre**: 1 saat  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlaması ve kaynak doğrulaması
- SKU seçimi stratejileri
- Ön kontrol ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlama](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet-etkin seçimler
- **✅ Doğrulama**: [Ön Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatikleştirilmiş komut dosyaları

#### Pratik Alıştırmalar
- Kapasite doğrulama betiklerini çalıştır
- SKU seçimlerini maliyet açısından optimize et
- Otomatikleştirilmiş dağıtımdan önce kontrolleri uygulayın

**💡 Bölüm Sonucu**: Dağıtımları yürütmeden önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme & Hata Ayıklama
**Önkoşullar**: Herhangi bir dağıtım bölümü tamamlandı  
**Süre**: 1-1.5 saat  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama teknikleri
- Yaygın sorunlar ve çözümleri
- AI'ye özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Kılavuzu](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 AI Sorunları**: [AI'ye Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI servis problemleri

#### Pratik Alıştırmalar
- Dağıtım arızalarını teşhis et
- Kimlik doğrulama sorunlarını çöz
- AI servis bağlantısını hata ayıkla

**💡 Bölüm Sonucu**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çöz

---

### 🏢 Bölüm 8: Üretim & Kurumsal Kalıplar
**Önkoşullar**: Bölümler 1-4 tamamlandı  
**Süre**: 2-3 saat  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik kalıpları
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Üretim AI En İyi Uygulamaları](docs/chapter-08-production/production-ai-practices.md) - Kurumsal kalıplar
- **📝 Örnekler**: [Mikroservis Örneği](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights entegrasyonu](docs/chapter-06-pre-deployment/application-insights.md) - İzleme

#### Pratik Alıştırmalar
- Kurumsal güvenlik kalıplarını uygula
- Kapsamlı izleme kur
- Doğru yönetimle üretime dağıt

**💡 Bölüm Sonucu**: Tam üretim yeteneklerine sahip kurumsal uygulamalar dağıt

---

## 🎓 Atölye Genel Bakışı: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Aktif Geliştirme**  
> Atölye materyalleri şu anda geliştiriliyor ve geliştiriliyor. Temel modüller işlevsel ancak bazı ileri bölümler tamamlanmadı. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemeni takip et →](workshop/README.md)

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve rehberli alıştırmalar ile kapsamlı uygulamalı öğrenme**

Atölye materyallerimiz, yukarıdaki bölüm bazlı müfredata destek olan yapılandırılmış, etkileşimli bir öğrenme deneyimi sunar. Atölye hem kendi hızınızda öğrenme hem de eğitmen liderliğinde oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Arama, kopyalama ve tema özelliklerine sahip tam MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Tek tıkla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 8 modüllü rehberli alıştırmalar (toplam 3-4 saat)
- **Kademeli Metodoloji**: Giriş → Seçim → Doğrulama → Ayrıştırma → Konfigürasyon → Özelleştirme → Temizleme → Kapanış
- **Etkileşimli DevContainer Ortamı**: Ön yapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Modül Yapısı
Atölye, keşiften dağıtım ustalığına götüren **8 modüllü kademeli bir metodoloji** izler:

| Modül | Konu | Ne Yapacaksınız | Süre |
|--------|-------|----------------|----------|
| **0. Giriş** | Atölye Genel Bakış | Öğrenme hedeflerini, önkoşulları ve atölye yapısını anla | 15 dk |
| **1. Seçim** | Şablon Keşfi | AZD şablonlarını incele ve senaryona uygun AI şablonunu seç | 20 dk |
| **2. Doğrulama** | Dağıt & Doğrula | `azd up` ile şablonu dağıt ve altyapının çalıştığını doğrula | 30 dk |
| **3. Ayrıştırma** | Yapıyı Anlama | GitHub Copilot ile şablon mimarisini, Bicep dosyalarını ve kod organizasyonunu keşfet | 30 dk |
| **4. Konfigürasyon** | azure.yaml Derinlemesine | `azure.yaml` konfigürasyonunu, yaşam döngüsü kancalarını ve ortam değişkenlerini öğren | 30 dk |
| **5. Özelleştirme** | Kişiselleştir | AI Aramayı etkinleştir, izleme, değerlendirme yap ve senaryona göre özelleştir | 45 dk |
| **6. Temizlik** | Kaynakları Temizle | `azd down --purge` ile kaynakları güvenli şekilde kaldır | 15 dk |
| **7. Kapanış** | Sonraki Adımlar | Kazanımları gözden geçir, önemli kavramları pekiştir ve öğrenme yolculuğuna devam et | 15 dk |

**Atölye Akışı:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Atölyeye Başlarken
```bash
# Seçenek 1: GitHub Codespaces (Önerilen)
# Depoda "Code" → "main üzerinde codespace oluştur" tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md dosyasındaki kurulum talimatlarını izleyin
```

#### 🎯 Atölye Öğrenme Hedefleri
Atölyeyi tamamlayarak katılımcılar:
- **Üretim AI Uygulamaları Dağıtımı**: Microsoft Foundry servisleri ile AZD kullanır
- **Çoklu Ajan Mimarilerinde Ustalaşır**: Koordine AI ajan çözümleri uygular
- **Güvenlik En İyi Uygulamalarını Uygular**: Kimlik doğrulama ve erişim kontrolünü yapılandırır
- **Ölçek için Optimize Eder**: Maliyet-etkin ve performanslı dağıtımlar tasarlar
- **Dağıtım Sorunlarını Giderir**: Yaygın sorunları bağımsız çözümleyebilir

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Modül Modül Talimatlar**:
  - [0. Giriş](workshop/docs/instructions/0-Introduction.md) - Atölye genel bakış ve hedefler
  - [1. Seçim](workshop/docs/instructions/1-Select-AI-Template.md) - AI şablonlarını bul ve seç
  - [2. Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) - Şablonları dağıt ve doğrula
  - [3. Ayrıştırma](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Şablon mimarisini keşfet
  - [4. Konfigürasyon](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml ustalaş
  - [5. Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) - Senaryona göre kişiselleştir
  - [6. Temizlik](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Kaynakları temizle
  - [7. Kapanış](workshop/docs/instructions/7-Wrap-up.md) - Gözden geçirme ve sonraki adımlar
- **🛠️ AI Atölyesi Labı**: [AI Atölyesi Labı](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı alıştırmalar
- **💡 Hızlı Başlangıç**: [Atölye Kurulum Kılavuzu](workshop/README.md#quick-start) - Ortam yapılandırması

**Kullanım için ideal**: Kurumsal eğitim, üniversite dersleri, kendi hızında öğrenme ve geliştirici bootcamp'leri.

---

## 📖 Derinlemesine İnceleme: AZD Yetkinlikleri

Temellerin ötesinde, AZD üretim dağıtımları için güçlü özellikler sunar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama kalıpları için önceden hazırlanmış şablonları kullan
- **Kod olarak altyapı** - Azure kaynaklarını Bicep veya Terraform ile yönet  
- **Entegre iş akışları** - Uygulamaları kesintisiz şekilde sağla, dağıt ve izle
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiş

### **AZD + Microsoft Foundry: AI Dağıtımları için Mükemmel**

**AI Çözümleri için Neden AZD?** AZD, AI geliştiricilerin en büyük zorluklarını çözer:

- **AI-Uyumlu Şablonlar** - Microsoft Foundry Modelleri, Azure AI Servisleri ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI servisleri, API anahtarları ve model uç noktaları için yerleşik güvenlik kalıpları  
- **Üretim AI Kalıpları** - Ölçeklenebilir, maliyet-etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan uca AI İş Akışları** - Model geliştirmeden üretime dağıtıma kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğu ve uç noktalarıyla kesintisiz bağlantı

---

## 🎯 Şablonlar & Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamalarını dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI kalıplarını gösterir. Bazıları dış Azure Örnekleri, bazıları ise yerel uygulamalardır.

| Şablon | Bölüm | Zorluk | Servisler | Tür |
|----------|---------|------------|----------|------|
| [**AI sohbet ile başlayın**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Dış |
| [**AI ajanlarla başlayın**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Dış |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + Uygulama Servisi + Depolama | Dış |
| [**OpenAI Sohbet Uygulaması Hızlı Başlangıç**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Dış |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Dış |
| [**Contoso Sohbet RAG**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Dış |
| [**Perakende Çoklu Ajan Çözümü**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Depolama + Container Apps + Cosmos DB | **Yerel** |

### Öne Çıkan: Tam Öğrenme Senaryoları
**Öğrenme bölümlerine eşlenen üretime hazır uygulama şablonları**

| Şablon | Öğrenme Bölümü | Zorluk | Ana Öğrenme |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım kalıpları |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Belge Zekası entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağırma |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanları ile çoklu ajan mimarisi |

### Örnek Türüne Göre Öğrenme

> **📌 Yerel ve Dış Örnekler:**  
> **Yerel Örnekler** (bu depoda) = Hemen kullanıma hazır  
> **Dış Örnekler** (Azure Örnekleri) = Bağlı repolardan klonlanacak

#### Yerel Örnekler (Kullanıma Hazır)
- [**Perakende Çoklu Ajan Çözümü**](examples/retail-scenario.md) - ARM şablonları ile tam üretime hazır uygulama
  - Çoklu ajan mimarisi (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonuyla tek tıkla dağıtım

#### Yerel Örnekler - Konteyner Uygulamaları (Bölümler 2-5)
**Bu depoda kapsamlı konteyner dağıtım örnekleri:**

- [**Kapsayıcı Uygulama Örnekleri**](examples/container-app/README.md) - Kapsayıcı tabanlı dağıtımlar için tam rehber
  - [Basit Flask API](../../examples/container-app/simple-flask-api) - Ölçeklenebilir temel REST API
  - [Mikroservis Mimarisi](../../examples/container-app/microservices) - Üretim hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve Gelişmiş dağıtım örüntüleri
  - İzleme, güvenlik ve maliyet optimizasyon rehberliği

#### Harici Örnekler - Basit Uygulamalar (Bölümler 1-2)
**Başlamak için bu Azure Örnekleri depolarını klonlayın:**
- [Basit Web Uygulaması - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım örüntüleri
- [Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Kapsayıcı Uygulama - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### Harici Örnekler - Veritabanı Entegrasyonu (Bölümler 3-4)  
- [Veritabanı Uygulaması - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı örüntüleri
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### Harici Örnekler - Gelişmiş Örüntüler (Bölümler 4-8)
- [Java Mikroservisleri](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çok servisli mimariler
- [Kapsayıcı Uygulama İşleri](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işleme  
- [Kurumsal ML Boru Hattı](https://github.com/Azure-Samples/mlops-v2) - Üretim hazır ML örüntüleri

### Harici Şablon Koleksiyonları
- [**Resmi AZD Şablon Galerisi**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarından seçilmiş koleksiyon
- [**Azure Developer CLI Şablonları**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon belgeleri
- [**Örnekler Dizinisi**](examples/README.md) - Detaylı açıklamalı yerel öğrenme örnekleri

---

## 📚 Öğrenme Kaynakları ve Referanslar

### Hızlı Referanslar
- [**Komut Hile Sayfası**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Terimler Sözlüğü**](resources/glossary.md) - Azure ve azd terminolojisi  
- [**SSS**](resources/faq.md) - Öğrenme bölümüne göre organize edilmiş sıkça sorulan sorular
- [**Çalışma Rehberi**](resources/study-guide.md) - Kapsamlı uygulamalı egzersizler

### Uygulamalı Atölye Çalışmaları
- [**Yapay Zeka Atölyesi**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Yapay zeka çözümlerinizi AZD ile dağıtılabilir hale getirin (2-3 saat)
- [**Etkileşimli Atölye**](workshop/README.md) - MkDocs ve GitHub Codespaces ile 8 modüllü rehberli egzersizler
  - Sırasıyla: Giriş → Seçim → Doğrulama → Parçalama → Yapılandırma → Özelleştirme → Kapatma → Özet

### Harici Öğrenme Kaynakları
- [Azure Developer CLI Dökümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Fiyatlandırma Hesaplayıcısı](https://azure.microsoft.com/pricing/calculator/)
- [Azure Durum](https://status.azure.com/)

### Editörünüz için AI Ajan Yetkinlikleri
- [**Microsoft Azure Yetenekleri skills.sh üzerinde**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, dağıtım, tanı, maliyet optimizasyonu ve daha fazlası için 37 açık ajan yeteneği. Bunları GitHub Copilot, Cursor, Claude Code veya desteklenen herhangi bir ajan içinde kurabilirsiniz:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların karşılaştığı yaygın sorunlar ve hızlı çözümleri:**

<details>
<summary><strong>❌ "azd: komut bulunamadı"</strong></summary>

```bash
# Önce AZD'yi yükleyin
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Kurulumu doğrulayın
azd version
```
</details>

<details>
<summary><strong>❌ "Abonelik bulunamadı" veya "Abonelik ayarlanmadı"</strong></summary>

```bash
# Kullanılabilir abonelikleri listele
az account list --output table

# Varsayılan aboneliği ayarla
az account set --subscription "<subscription-id-or-name>"

# AZD ortamı için ayarla
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Doğrula
az account show
```
</details>

<details>
<summary><strong>❌ "Yetersiz Kota" veya "Kota aşımı"</strong></summary>

```bash
# Farklı bir Azure bölgesi deneyin
azd env set AZURE_LOCATION "westus2"
azd up

# Veya geliştirmede daha küçük SKU'lar kullanın
# infra/main.parameters.json dosyasını düzenleyin:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" işlemi yarıda kalıyor</strong></summary>

```bash
# Seçenek 1: Temizle ve tekrar dene
azd down --force --purge
azd up

# Seçenek 2: Sadece altyapıyı düzelt
azd provision

# Seçenek 3: Detaylı durumu kontrol et
azd show

# Seçenek 4: Azure Monitor'deki günlükleri kontrol et
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Kimlik doğrulama başarısız" veya "Token süresi doldu"</strong></summary>

```bash
# AZD için yeniden kimlik doğrulama yap
azd auth logout
azd auth login

# İsteğe bağlı: az komutlarını çalıştırıyorsanız Azure CLI'yi de yenileyin
az logout
az login

# Kimlik doğrulamayı doğrula
az account show
```
</details>

<details>
<summary><strong>❌ "Kaynak zaten mevcut" veya isim çakışmaları</strong></summary>

```bash
# AZD benzersiz isimler oluşturur, ancak çatışma olursa:
azd down --force --purge

# O zaman yeni bir ortam ile yeniden dene
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Şablon dağıtımı çok uzun sürüyor</strong></summary>

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- AI uygulamaları: 15-25 dakika (OpenAI sağlanması yavaş)

```bash
# İlerlemenizi kontrol edin
azd show

# 30 dakikadan fazla takıldıysa, Azure Portal'ı kontrol edin:
azd monitor --overview
# Başarısız dağıtımlara bakın
```
</details>

<details>
<summary><strong>❌ "İzin reddedildi" veya "Yasaklandı"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Katkıda Bulunan" rolüne ihtiyacınız var
# Azure yöneticinizden şunları vermesini isteyin:
# - Katkıda Bulunan (kaynaklar için)
# - Kullanıcı Erişim Yöneticisi (rol atamaları için)
```
</details>

<details>
<summary><strong>❌ Dağıtılan uygulama URL'si bulunamıyor</strong></summary>

```bash
# Tüm hizmet uç noktalarını göster
azd show

# Veya Azure Portal'ı aç
azd monitor

# Belirli hizmeti kontrol et
azd env get-values
# *_URL değişkenlerini ara
```
</details>

### 📚 Tam Sorun Giderme Kaynakları

- **Yaygın Sorunlar Rehberi:** [Detaylı Çözümler](docs/chapter-07-troubleshooting/common-issues.md)
- **AI Özel Sorunları:** [AI Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım adım Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölümü takip ederek öğrenme ilerlemenizi kontrol edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod olarak Altyapı & Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajan AI Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtımdan Önce Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim & Kurumsal Örüntüler ✅

### Öğrenme Doğrulaması
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Uygulamalı Egzersiz**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Azure Discord'da deneyiminizi paylaşın
4. **Sonraki Bölüm**: Bir sonraki karmaşıklık seviyesine geçin

### Kurs Tamamlama Faydaları
Tüm bölümleri tamamladığınızda:
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure'a başarıyla dağıtmış olursunuz
- **Profesyonel Yetenekler**: Kurumsal dağıtım becerileri kazanırsınız  
- **Topluluk Tanınırlığı**: Azure geliştirici topluluğunun aktif bir üyesi olursunuz
- **Kariyer İlerlemesi**: Talep gören AZD ve AI dağıtım uzmanlığı elde edersiniz

---

## 🤝 Topluluk & Destek

### Yardım ve Destek Alın
- **Teknik Sorunlar**: [Hata raporu ve özellik isteği gönderin](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure) ve [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI Özel Yardım**: Katılın [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Belgelendirme**: [Resmi Azure Developer CLI dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord'dan Topluluk Gözlemleri

**#Azure kanalından son anket sonuçları:**
- **%45** geliştirici AI iş yükleri için AZD kullanmak istiyor
- **Başlıca zorluklar**: Çok servisli dağıtımlar, kimlik yönetimi, üretim hazırlığı  
- **En çok istenenler**: AI özel şablonlar, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılın ve:**
- AZD + AI deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken ön gösterimlerine erişin
- AI dağıtım en iyi uygulamalarına katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılara açığız! Detaylar için lütfen [Katkıda Bulunma Rehberi](CONTRIBUTING.md)'ni okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dilli desteğin sürdürülmesine yardımcı olun
- **Hata Raporları**: Doğruluk ve açıklık artırın
- **Topluluk Standartları**: Kapsayıcı topluluk kurallarımızı takip edin

---

## 📄 Kurs Bilgisi

### Lisans
Bu proje MIT Lisansı ile lisanslanmıştır - detaylar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz diğer kapsamlı öğrenme kursları üretmektedir:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ajanlar
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Üretken AI Serisi
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Üretken Yapay Zeka (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temel Öğrenme
[![Yeni Başlayanlar için Makine Öğrenimi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Veri Bilimi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Yapay Zeka](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Siber Güvenlik](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Yeni Başlayanlar için Web Geliştirme](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için XR Geliştirme](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serisi
[![Yapay Zeka Eşliğinde Programlama için Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET İçin](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Macerası](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Hazır mısınız?**

**Yeni Başlayanlar**: [Bölüm 1: Temel & Hızlı Başlangıç](#-chapter-1-foundation--quick-start) ile başlayın  
**Yapay Zeka Geliştiricileri**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers) bölümüne atlayın  
**Deneyimli Geliştiriciler**: [Bölüm 3: Yapılandırma & Kimlik Doğrulama](#️-chapter-3-configuration--authentication) ile başlayın

**Sonraki Adımlar**: [Bölüm 1 - AZD Temelleri'ne Başla](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->