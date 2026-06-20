# AZD For Beginners: A Structured Learning Journey

![AZD-yeni-başlayanlar](../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub izleyicileri](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub fork'ları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızları](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapça](../ar/README.md) | [Bengalce](../bn/README.md) | [Bulgarca](../bg/README.md) | [Burmaca (Myanmar)](../my/README.md) | [Çince (Basitleştirilmiş)](../zh-CN/README.md) | [Çince (Geleneksel, Hong Kong)](../zh-HK/README.md) | [Çince (Geleneksel, Macau)](../zh-MO/README.md) | [Çince (Geleneksel, Taiwan)](../zh-TW/README.md) | [Hırvatça](../hr/README.md) | [Çekçe](../cs/README.md) | [Danca](../da/README.md) | [Hollandaca](../nl/README.md) | [Estonca](../et/README.md) | [Fince](../fi/README.md) | [Fransızca](../fr/README.md) | [Almanca](../de/README.md) | [Yunanca](../el/README.md) | [İbranice](../he/README.md) | [Hintçe](../hi/README.md) | [Macarca](../hu/README.md) | [Endonezce](../id/README.md) | [İtalyanca](../it/README.md) | [Japonca](../ja/README.md) | [Kannada](../kn/README.md) | [Khmerce](../km/README.md) | [Korece](../ko/README.md) | [Litvanca](../lt/README.md) | [Malayca](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalce](../ne/README.md) | [Nijerya Pidgin](../pcm/README.md) | [Norveççe](../no/README.md) | [Farsça (Farsi)](../fa/README.md) | [Lehçe](../pl/README.md) | [Portekizce (Brezilya)](../pt-BR/README.md) | [Portekizce (Portekiz)](../pt-PT/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Romence](../ro/README.md) | [Rusça](../ru/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Slovakça](../sk/README.md) | [Slovence](../sl/README.md) | [İspanyolca](../es/README.md) | [Svahili](../sw/README.md) | [İsveççe](../sv/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Tamilce](../ta/README.md) | [Telugu](../te/README.md) | [Tayca](../th/README.md) | [Türkçe](./README.md) | [Ukraynaca](../uk/README.md) | [Urduca](../ur/README.md) | [Vietnamca](../vi/README.md)

> **Yerel Olarak Klonlamayı mı Tercih Ediyorsunuz?**
>
> Bu depo 50+ dil çevirisi içerir ve bu da indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sparse checkout kullanın:
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
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı bir indirme ile sağlar.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd'de Bugün Neler Yeni

> 📌 Bu kurs **`azd 1.25.6`** (Haziran 2026) sürümüyle doğrulanmıştır. Yapınızı kontrol etmek için `azd version` çalıştırın ve en son sürümü almak için `azd upgrade` komutunu kullanın.

Azure Developer CLI, geleneksel web uygulamaları ve API'lerin ötesine büyüdü. Bugün azd, AI destekli uygulamalar ve akıllı ajanlar dahil olmak üzere Azure'a herhangi bir uygulamayı dağıtmak için tek araçtır.

Bu sizin için ne anlama geliyor:

- **AI ajanları artık azd için birinci sınıf iş yükleridir.** Aynı `azd init` → `azd up` iş akışını kullanarak AI ajan projelerini başlatabilir, dağıtabilir ve yönetebilirsiniz.
- **CLI üzerinden tam bir ajan yaşam döngüsü.** `azure.ai.agents` eklentisi artık tüm yolculuğu kapsıyor—`azd ai agent init` iskelet oluşturmak için, `azd ai agent invoke` test etmek için (yanıt zamanlama çıktısıyla), `azd ai agent eval generate` ve `azd ai agent optimize` kaliteyi ölçmek ve iyileştirmek için ve `azd ai agent delete` temizlemek için.
- **Daha fazla AI yapı taşı.** Yeni önizleme eklentileri—`azure.ai.skills` ve `azure.ai.connections`—yeniden kullanılabilir ajan yeteneklerini ve Foundry bağlantılarını doğrudan azd ile yönetmenizi sağlar.
- **Microsoft Foundry entegrasyonu** model dağıtımını, ajan barındırmayı ve AI hizmet yapılandırmasını azd şablon ekosistemine doğrudan getirir.
- **Günlük temel işler daha sorunsuz.** Son sürümler `azd init`'i idempotent (tekrar çalıştırılması güvenli) hale getirdi, `azd auth login` eskimiş belirteçleri otomatik temizleme yaptı ve kullanışlı bir `azd tool` ilk çalıştırma kurulum istemi ekledi.
- **Temel iş akışı değişmedi.** İster bir todo uygulaması, bir mikro hizmet, ister çok ajanlı bir AI çözümü dağıtıyor olun, komutlar aynı.

> **Aspire kullanıcıları için not:** Microsoft artık ürünü basitçe **Aspire** olarak adlandırıyor (önceki adı ".NET Aspire"). azd'nin Aspire desteği değişmedi—sadece isim güncellendi.

Eğer daha önce azd kullandıysanız, AI desteği doğal bir uzantıdır—ayrı bir araç veya ileri düzey bir yol değil. Yeni başlıyorsanız, her şey için işe yarayan tek bir iş akışı öğreneceksiniz.

---

## 🚀 Azure Developer CLI (azd) Nedir?

**Azure Developer CLI (azd)**, uygulamaları Azure'a dağıtmayı kolaylaştıran geliştirici dostu bir komut satırı aracıdır. Düzinecece Azure kaynağını elle oluşturup bağlamak yerine, tek bir komutla tüm uygulamaları dağıtabilirsiniz.

### `azd up`'in Sihri

```bash
# Bu tek komut her şeyi yapar:
# ✅ Tüm Azure kaynaklarını oluşturur
# ✅ Ağ ve güvenliği yapılandırır
# ✅ Uygulama kodunuzu derler
# ✅ Azure'a dağıtır
# ✅ Size çalışan bir URL verir
azd up
```

**Hepsi bu kadar!** Azure Portal'da tıklama yok, önce öğrenmeniz gereken karmaşık ARM şablonları yok, manuel yapılandırma yok - sadece Azure'da çalışan uygulamalar.

---

## ❓ Azure Developer CLI ile Azure CLI: Fark Nedir?

Bu, yeni başlayanların en çok sorduğu sorudur. İşte basit cevap:

| Özellik | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Amaç** | Bireysel Azure kaynaklarını yönetmek | Tam uygulamaları dağıtmak |
| **Zihniyet** | Altyapı odaklı | Uygulama odaklı |
| **Örnek** | `az webapp create --name myapp...` | `azd up` |
| **Öğrenme Eğrisi** | Azure hizmetlerini bilmek gerekir | Sadece uygulamanızı bilin |
| **En Uygun** | DevOps, Altyapı | Geliştiriciler, Prototipleme |

### Basit Benzetme

- **Azure CLI**, bir evi inşa etmek için tüm araçlara sahip olmak gibidir - çekiçler, testereler, çiviler. Her şeyi inşa edebilirsiniz, ancak inşaatı bilmeniz gerekir.
- **Azure Developer CLI**, bir müteahhit tutmak gibidir - ne istediğinizi anlatırsınız ve onlar inşayı halleder.

### Hangi Durumda Hangi Aracı Kullanmalısınız

| Senaryo | Kullanılacak |
|----------|--------------|
| "Web uygulamamı hızlıca dağıtmak istiyorum" | `azd up` |
| "Sadece bir depolama hesabı oluşturmam gerekiyor" | `az storage account create` |
| "Tam bir AI uygulaması inşa ediyorum" | `azd init --template azure-search-openai-demo` |
| "Belirli bir Azure kaynağını hata ayıklamam gerekiyor" | `az resource show` |
| "Dakikalar içinde üretim hazır dağıtım istiyorum" | `azd up --environment production` |

### Birlikte Çalışırlar!

AZD, altında Azure CLI'yi kullanır. Her ikisini de kullanabilirsiniz:
```bash
# Uygulamanızı AZD ile dağıtın
azd up

# Ardından belirli kaynakları Azure CLI ile ince ayar yapın
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD'de Şablon Bulun

Sıfırdan başlamayın! **Awesome AZD**, dağıtıma hazır topluluk şablonlarının koleksiyonudur:

| Kaynak | Açıklama |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Tek tıkla dağıtım ile 200+ şablonu göz atın |
| 🔗 [**Bir Şablon Gönderin**](https://github.com/Azure/awesome-azd/issues) | Kendi şablonunuzu topluluğa katkıda bulunun |
| 🔗 [**GitHub Deposu**](https://github.com/Azure/awesome-azd) | Yıldız verin ve kaynağı keşfedin |

### Awesome AZD'den Popüler AI Şablonları

```bash
# Microsoft Foundry Modelleri ile RAG Sohbet + AI Arama
azd init --template azure-search-openai-demo

# Hızlı AI Sohbet Uygulaması
azd init --template openai-chat-app-quickstart

# Foundry Ajanları ile AI Ajanları
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 Adımda Başlarken

Başlamadan önce, dağıtmak istediğiniz şablon için makinenizin hazır olduğundan emin olun:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Eğer gerekli herhangi bir kontrol başarısız olursa, önce onu düzeltin ve sonra hızlı başlangıca devam edin.

### Adım 1: AZD'yi Yükleyin (2 dakika)

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

### Adım 2: AZD için Kimlik Doğrulama

```bash
# Bu derste doğrudan Azure CLI komutlarını kullanmayı planlıyorsanız isteğe bağlı
az login

# AZD iş akışları için gereklidir
azd auth login
```

Hangi kimlik doğrulama yöntemine ihtiyacınız olduğundan emin değilseniz, tam kurulum akışını izleyin: [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Adım 3: İlk Uygulamanızı Dağıtın

```bash
# Bir şablondan başlat
azd init --template todo-nodejs-mongo

# Azure'a dağıt (her şeyi oluşturur!)
azd up
```

**🎉 Hepsi bu kadar!** Uygulamanız şimdi Azure'da yayında.

### Temizleme (Unutmayın!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Bu Kursu Nasıl Kullanmalısınız

Bu kurs **kademeli öğrenme** için tasarlanmıştır - kendinizi rahat hissettiğiniz yerden başlayın ve yukarı doğru ilerleyin:

| Deneyiminiz | Buradan Başlayın |
|-----------------|------------|
| **Azure'da tamamen yeni** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **Azure biliyorsunuz, AZD'ye yeni** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **AI uygulamaları dağıtmak istiyorsunuz** | [Bölüm 2: AI-Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Pratik yapmak istiyorsunuz** | [🎓 İnteraktif Atölye](workshop/README.md) - 3-4 saatlik rehberli laboratuvar |
| **Üretim desenlerine ihtiyacınız var** | [Bölüm 8: Üretim & Kurumsal](#-chapter-8-production--enterprise-patterns) |

### Hızlı Kurulum

1. **Bu Depoyu Forklayın**: [![GitHub fork'ları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonlayın**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Yardım Alın**: [Azure Discord Topluluğu](https://discord.com/invite/ByRwuEEgH4)

> **Yerel Olarak Klonlamayı mı Tercih Ediyorsunuz?**

> Bu depo 50+ dil çevirisi içerir ve bu da indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sparse checkout kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı bir indirme ile sağlar.


## Kurs Genel Bakış

Azure Developer CLI (azd)'yi kademeli bölümler aracılığıyla öğrenin. **Microsoft Foundry entegrasyonuyla AI uygulama dağıtımına özel vurgu.**
### Bu Kurs Modern Geliştiriciler İçin Neden Önemli

Microsoft Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyorlar:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımı en iyi uygulamaları  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ye özgü dağıtım sorunlarının giderilmesi

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak şunları yapabileceksiniz:
- **AZD Temellerinde Uzmanlaşın**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Kod Olarak Altyapı Uygulayın**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtımları Sorun Giderin**: Yaygın sorunları çözün ve hataları ayıklayın
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çok Ajanlı Çözümler Oluşturun**: Karmaşık AI mimarilerini dağıtın

## Başlamadan Önce: Hesaplar, Erişim ve Varsayımlar

Bölüm 1'e başlamadan önce, aşağıdakilerin hazır olduğundan emin olun. Bu kılavuzdaki kurulum adımları daha sonraki bölümlerde bu temel gereksinimlerin zaten karşılandığını varsayar.

- **Bir Azure aboneliği**: İş yerinizden veya kendi hesabınızdan mevcut bir aboneliği kullanabilir veya başlamak için bir [free trial](https://aka.ms/azurefreetrial) oluşturabilirsiniz.
- **Azure kaynakları oluşturma izni**: Çoğu alıştırma için hedef abonelik veya kaynak grubunda en az **Contributor** erişimine sahip olmalısınız. Bazı bölümler ayrıca kaynak grupları, yönetilen kimlikler ve RBAC atamaları oluşturabileceğinizi varsayabilir.
- [**Bir GitHub hesabı**](https://github.com): Depoyu fork etmek, kendi değişikliklerinizi izlemek ve atölye için GitHub Codespaces kullanmak için faydalıdır.
- **Şablon çalışma zamanı önkoşulları**: Bazı şablonlar Node.js, Python, Java veya Docker gibi yerel araçlar gerektirir. Eksik araçları erken tespit etmek için başlamadan önce kurulum doğrulayıcısını çalıştırın.
- **Temel terminal bilgisi**: Uzman olmanıza gerek yok, ancak `git clone`, `azd auth login` ve `azd up` gibi komutları çalıştırmaya rahat olmalısınız.

> **Kurumsal bir abonelikte mi çalışıyorsunuz?**
> Azure ortamınız bir yönetici tarafından yönetiliyorsa, kullanmayı planladığınız abonelik veya kaynak grubunda kaynak dağıtabileceğinizi önceden doğrulayın. Eğer izin yoksa, başlamadan önce bir sandbox aboneliği veya Contributor erişimi talep edin.

> **Azure'a yeni misiniz?**
> Alıştırmaları baştan sona tamamlayabilmek için https://aka.ms/azurefreetrial adresinden kendi Azure denemeniz veya öde-kullandıkça aboneliğinizle başlayın, böylece tenant düzeyindeki onayları beklemek zorunda kalmazsınız.

## 🗺️ Ders Haritası: Bölümlere Göre Hızlı Geçiş

Her bölümün öğrenme hedefleri, hızlı başlangıçlar ve alıştırmalar içeren bir README'i vardır:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Bölüm 1: Temel](docs/chapter-01-foundation/README.md)** | Başlarken | [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) &#124; [Yükleme & Kurulum](docs/chapter-01-foundation/installation.md) &#124; [İlk Projeniz](docs/chapter-01-foundation/first-project.md) | 30-45 dk | ⭐ |
| **[Bölüm 2: AI Geliştirme](docs/chapter-02-ai-development/README.md)** | AI-İlk Uygulamalar | [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Ajanları](docs/chapter-02-ai-development/agents.md) &#124; [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atölye](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saat | ⭐⭐ |
| **[Bölüm 3: Yapılandırma](docs/chapter-03-configuration/README.md)** | Kimlik Doğrulama & Güvenlik | [Yapılandırma Kılavuzu](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Güvenlik](docs/chapter-03-configuration/authsecurity.md) | 45-60 dk | ⭐⭐ |
| **[Bölüm 4: Altyapı](docs/chapter-04-infrastructure/README.md)** | IaC & Dağıtım | [Dağıtım Kılavuzu](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saat | ⭐⭐⭐ |
| **[Bölüm 5: Çoklu Ajan](docs/chapter-05-multi-agent/README.md)** | AI Ajan Çözümleri | [Perakende Senaryosu](examples/retail-scenario.md) &#124; [Koordinasyon Desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[Bölüm 6: Ön Dağıtım](docs/chapter-06-pre-deployment/README.md)** | Planlama & Doğrulama | [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uygulama Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 saat | ⭐⭐ |
| **[Bölüm 7: Sorun Giderme](docs/chapter-07-troubleshooting/README.md)** | Hata Ayıklama & Düzeltme | [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Sorunları](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saat | ⭐⭐ |
| **[Bölüm 8: Üretim](docs/chapter-08-production/README.md)** | Kurumsal Desenler | [Üretim Uygulamaları](docs/chapter-08-production/production-ai-practices.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[🎓 Çalıştay](workshop/README.md)** | Uygulamalı Laboratuvar | [Giriş](workshop/docs/instructions/0-Introduction.md) &#124; [Seçim](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Parçalara Ayırma](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Altyapıyı Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kapanış](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saat | ⭐⭐ |

**Toplam Kurs Süresi:** ~10-14 saat | **Yetenek İlerlemesi:** Başlangıç → Üretime Hazır

---

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve amaçlarınıza göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel ve Hızlı Başlangıç
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Zorluk**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI (AZD) temellerini anlama
- Platformunuzda AZD kurma
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure Developer CLI nedir?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Yükleme & Kurulum](docs/chapter-01-foundation/installation.md) - Platforma özgü kılavuzlar
- **🛠️ Uygulama**: [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Adım adım öğretici
- **📋 Hızlı Başvuru**: [Komut Hızlı Başvuru](resources/cheat-sheet.md)

#### Pratik Alıştırmalar
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Sonucu**: AZD kullanarak basit bir web uygulamasını Azure'a başarıyla dağıtın

**✅ Başarı Doğrulama:**
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
**📈 Sonrasında Beceri Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir
**📈 Sonrasında Beceri Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: AI-İlk Geliştirme (AI Geliştiricileri için Önerilir)
**Önkoşullar**: Bölüm 1 tamamlandı  
**Süre**: 1-2 saat  
**Zorluk**: ⭐⭐

#### Öğrenecekleriniz
- Microsoft Foundry entegrasyonu ile AZD kullanımı
- AI destekli uygulamaların dağıtımı
- AI hizmet yapılandırmalarını anlama

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Ajanları**: [AI Ajanları Rehberi](docs/chapter-02-ai-development/agents.md) - AZD ile akıllı ajanlar dağıtın
- **📖 Desenler**: [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) - AI modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [AI Atölye Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD uyumlu hale getirin
- **🎥 İnteraktif Rehber**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme MkDocs * DevContainer Environment ile
- **📋 Şablonlar**: [Microsoft Foundry Şablonları](#atölye-kaynakları)
- **📝 Örnekler**: [AZD Dağıtım Örnekleri](examples/README.md)

#### Pratik Alıştırmalar
```bash
# İlk yapay zeka uygulamanızı dağıtın
azd init --template azure-search-openai-demo
azd up

# Ek yapay zeka şablonlarını deneyin
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Bölüm Sonucu**: RAG yeteneklerine sahip AI destekli bir sohbet uygulamasını dağıtın ve yapılandırın

**✅ Başarı Doğrulama:**
```bash
# Bölüm 2'den sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test etmek
# Soru sormak ve kaynaklarla desteklenen yapay zeka yanıtları almak
# Arama entegrasyonunun çalıştığını doğrulamak
azd monitor  # Application Insights'ın telemetri verilerini gösterdiğini kontrol etmek
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 Sonrasında Beceri Seviyesi:** Üretime hazır AI uygulamalarını dağıtıp yapılandırabilir  
**💰 Maliyet Farkındalığı:** Geliştirme maliyetlerinin aylık $80-150, üretim maliyetlerinin aylık $300-3500 olduğunu anlayın

#### 💰 AI Dağıtımları için Maliyet Hususları

**Geliştirme Ortamı (Tahmini $80-150/ay):**
- Microsoft Foundry Modelleri (Kullanım başına ödeme): $0-50/ay (token kullanımına göre)
- AI Search (Temel seviye): $75/ay
- Container Apps (Tüketim): $0-20/ay
- Depolama (Standart): $1-5/ay

**Üretim Ortamı (Tahmini $300-3,500+/ay):**
- Microsoft Foundry Modelleri (Tutarlı performans için PTU): $3,000+/ay VEYA yüksek hacim için kullanım başına ödeme
- AI Search (Standart seviye): $250/ay
- Container Apps (Adanmış): $50-100/ay
- Application Insights: $5-50/ay
- Depolama (Premium): $10-50/ay

**💡 Maliyet Optimizasyonu İpuçları:**
- Öğrenme için Microsoft Foundry Modellerinin **Free Tier**'ını kullanın (Azure OpenAI 50.000 token/ay dahil)
- Aktif geliştirme yapmıyorsanız kaynakları boşaltmak için `azd down` çalıştırın
- Tüketim tabanlı faturalama ile başlayın, yalnızca üretim için PTU'ya yükseltin
- Dağıtımdan önce maliyetleri tahmin etmek için `azd provision --preview` kullanın
- Otomatik ölçeklendirmeyi etkinleştirin: yalnızca gerçek kullanım için ödeme yapın

**Maliyet İzleme:**
```bash
# Tahmini aylık maliyetleri kontrol edin
azd provision --preview

# Azure Portal'da gerçek maliyetleri izleyin
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bölüm 3: Yapılandırma & Kimlik Doğrulama
**Önkoşullar**: Bölüm 1 tamamlandı  
**Süre**: 45-60 dakika  
**Zorluk**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Kılavuzu](docs/chapter-03-configuration/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik doğrulama desenleri ve yönetilen kimlik](docs/chapter-03-configuration/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Alıştırmalar
- Birden çok ortamı yapılandırın (dev, staging, prod)
- Yönetilen kimlik kimlik doğrulamasını ayarlayın
- Ortama özgü yapılandırmaları uygulayın

**💡 Bölüm Sonucu**: Uygun kimlik doğrulama ve güvenlikle birden çok ortamı yönetin

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı & Dağıtım
**Önkoşullar**: Bölümler 1-3 tamamlandı  
**Süre**: 1-1.5 saat  
**Zorluk**: ⭐⭐⭐

#### Öğrenecekleriniz
- Gelişmiş dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Kılavuzu](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- **🏗️ Kaynak Sağlama**: [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Konteyner Uygulaması Örneği](../../examples/container-app) - Konteyner tabanlı dağıtımlar

#### Pratik Alıştırmalar
- Özel Bicep şablonları oluşturun
- Çok hizmetli uygulamalar dağıtın
- Mavi-yeşil dağıtım stratejileri uygulayın

**💡 Bölüm Sonucu**: Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamaları dağıtın
### 🎯 Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri (İleri)
**Önkoşullar**: Bölümler 1-2 tamamlandı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Çok ajanlı mimari desenler
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır yapay zeka dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çok Ajanlı Çözüm](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- **📖 Mimari**: [Çok ajan koordinasyon desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) - Desenler

#### Pratik Alıştırmalar
```bash
# Perakende çok ajanlı çözümün tamamını dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Sonucu**: Müşteri ve Envanter ajanlarıyla üretim hazır çok ajanlı bir yapay zeka çözümünü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Dağıtımdan Önce Doğrulama ve Planlama
**Önkoşullar**: Bölüm 4 tamamlandı  
**Süre**: 1 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Kapasite planlaması ve kaynak doğrulaması
- SKU seçimi stratejileri
- Ön kontroller ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulaması
- **💰 Seçim**: [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet-etkin seçimler
- **✅ Doğrulama**: [Ön Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatik betikler

#### Pratik Alıştırmalar
- Kapasite doğrulama betiklerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatik dağıtımdan önce kontrolleri uygulayın

**💡 Bölüm Sonucu**: Dağıtımları yürütmeden önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme ve Hata Ayıklama
**Önkoşullar**: Herhangi bir dağıtım bölümü tamamlandı  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- Yapay zekaya özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Rehberi](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 AI Sorunları**: [Yapay Zekaya Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI servis problemleri

#### Pratik Alıştırmalar
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- AI servis bağlantı sorunlarını hata ayıklayın

**💡 Bölüm Sonucu**: Bağımsız olarak yaygın dağıtım sorunlarını teşhis edip çözün

---

### 🏢 Bölüm 8: Üretim & Kurumsal Desenler
**Önkoşullar**: Bölümler 1-4 tamamlandı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Üretim AI En İyi Uygulamaları](docs/chapter-08-production/production-ai-practices.md) - Kurumsal desenler
- **📝 Örnekler**: [Mikroservis Örneği](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights entegrasyonu](docs/chapter-06-pre-deployment/application-insights.md) - İzleme

#### Pratik Alıştırmalar
- Kurumsal güvenlik desenlerini uygulayın
- Kapsamlı izleme kurun
- Uygun yönetişim ile üretime dağıtım yapın

**💡 Bölüm Sonucu**: Tam üretim yetenekleriyle kuruma hazır uygulamalar dağıtın

---

## 🎓 Atölye Genel Bakışı: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Geliştirme Aşamasında**  
> Atölye materyalleri şu anda geliştiriliyor ve gözden geçiriliyor. Temel modüller işlevsel, ancak bazı ileri bölümler tamamlanmamış olabilir. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemeyi takip et →](workshop/README.md)

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve yönlendirmeli alıştırmalar ile kapsamlı, uygulamalı öğrenme deneyimi**

Atölye materyallerimiz, yukarıdaki bölüm tabanlı müfredatı tamamlayan yapılandırılmış, etkileşimli bir öğrenme deneyimi sağlar. Atölye hem kendi hızında öğrenme hem de eğitmen liderliğinde oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Arama, kopyalama ve tema özelliklerine sahip tam MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Tek tıkla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 8 modüllü rehberli alıştırmalar (toplam 3-4 saat)
- **Aşamalı Metodoloji**: Tanıtım → Seçim → Doğrulama → Parçalama → Yapılandırma → Özelleştirme → Temizlik → Kapanış
- **Etkileşimli DevContainer Ortamı**: Ön yapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Modül Yapısı
Atölye, sizi keşiften dağıtıma ustalığa götüren **8 modüllü aşamalı bir metodoloji** izler:

| Modül | Konu | Ne Yapacaksınız | Süre |
|--------|-------|----------------|----------|
| **0. Giriş** | Atölye Genel Bakışı | Öğrenme hedeflerini, önkoşulları ve atölye yapısını anlayın | 15 dk |
| **1. Seçim** | Şablon Keşfi | AZD şablonlarını keşfedin ve senaryonuza uygun AI şablonunu seçin | 20 dk |
| **2. Doğrulama** | Dağıt ve Doğrula | `azd up` ile şablonu dağıtın ve altyapının çalıştığını doğrulayın | 30 dk |
| **3. Parçalama** | Yapıyı Anlama | GitHub Copilot kullanarak şablon mimarisini, Bicep dosyalarını ve kod organizasyonunu keşfedin | 30 dk |
| **4. Yapılandırma** | azure.yaml Derin İncelemesi | `azure.yaml` yapılandırmasını, yaşam döngüsü kancalarını ve ortam değişkenlerini yönetin | 30 dk |
| **5. Özelleştirme** | Kendi Hale Getirme | AI Search, izleme, değerlendirme etkinleştirin ve senaryonuza göre özelleştirin | 45 dk |
| **6. Temizlik** | Kaynakları Kaldırma | `azd down --purge` ile kaynakları güvenli şekilde kaldırın | 15 dk |
| **7. Kapanış** | Sonraki Adımlar | Başarıları, ana kavramları gözden geçirin ve öğrenme yolunuza devam edin | 15 dk |

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
# Depoda "Code" → "Create codespace on main" seçeneğine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md içindeki kurulum talimatlarını izleyin
```

#### 🎯 Atölye Öğrenme Çıktıları
Atölyeyi tamamlayarak katılımcılar şunları elde edecekler:
- **Üretim AI Uygulamaları Dağıtın**: AZD ile Microsoft Foundry servislerini kullanın
- **Çok Ajanlı Mimarileri Ustalaştırın**: Koordine AI ajan çözümleri uygulayın
- **Güvenlik En İyi Uygulamalarını Uygulayın**: Kimlik doğrulama ve erişim kontrolünü yapılandırın
- **Ölçek İçin Optimizasyon**: Maliyet-etkin, performans odaklı dağıtımlar tasarlayın
- **Dağıtımları Sorun Giderin**: Yaygın sorunları bağımsız olarak çözün

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Modül Modül Talimatlar**:
  - [0. Giriş](workshop/docs/instructions/0-Introduction.md) - Atölye genel bakışı ve hedefler
  - [1. Seçim](workshop/docs/instructions/1-Select-AI-Template.md) - AI şablonlarını bulun ve seçin
  - [2. Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) - Şablonları dağıtın ve doğrulayın
  - [3. Parçalama](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Şablon mimarisini keşfedin
  - [4. Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml ustalaşın
  - [5. Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) - Senaryonuza göre özelleştirin
  - [6. Temizlik](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Kaynakları temizleyin
  - [7. Kapanış](workshop/docs/instructions/7-Wrap-up.md) - Gözden geçirme ve sonraki adımlar
- **🛠️ AI Atölye Laboratuvarı**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı alıştırmalar
- **💡 Hızlı Başlangıç**: [Atölye Kurulum Kılavuzu](workshop/README.md#quick-start) - Ortam yapılandırması

**İçin idealdir**: Kurumsal eğitim, üniversite dersleri, kendi hızında öğrenme ve geliştirici eğitim kampları.

---

## 📖 Derinlemesine: AZD Yetkinlikleri

Temellerin ötesinde, AZD üretim dağıtımları için güçlü özellikler sunar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama modelleri için önceden hazırlanmış şablonları kullanın
- **Altyapı Kod Olarak** - Azure kaynaklarını Bicep veya Terraform kullanarak yönetin  
- **Entegre iş akışları** - Uygulamaları sorunsuz şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici üretkenliği ve deneyimi için optimize edilmiş

### **AZD + Microsoft Foundry: AI Dağıtımları için İdeal**

**Neden AZD AI Çözümleri için?** AZD, yapay zeka geliştiricilerinin karşılaştığı başlıca zorlukları ele alır:

- **AI-Hazır Şablonlar** - Microsoft Foundry Modelleri, Azure AI Servisleri ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI servisleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet-etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden üretime dağıtıma kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model katalogu ve uç noktalarına sorunsuz bağlantı

---

## 🎯 Şablonlar ve Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI desenlerini gösterir. Bazıları dış Azure Örnekleri, diğerleri yerel uygulamalardır.

| Şablon | Bölüm | Karmaşıklık | Servisler | Tür |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Harici |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Harici |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Harici |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Harici |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Harici |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Harici |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Yerel** |

### Öne Çıkan: Tam Öğrenme Senaryoları
**Öğrenme bölümlerine eşlenen üretime hazır uygulama şablonları**

| Şablon | Öğrenme Bölümü | Karmaşıklık | Temel Öğrenim |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Document Intelligence entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağırma |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanları ile çok ajanlı mimari |

### Örnek Türüne Göre Öğrenme

> **📌 Yerel vs. Harici Örnekler:**  
> **Yerel Örnekler** (bu depoda) = Hemen kullanıma hazır  
> **Harici Örnekler** (Azure Samples) = Bağlı depolardan klonlayın

#### Yerel Örnekler (Kullanıma Hazır)
- [**Perakende Çok Ajanlı Çözüm**](examples/retail-scenario.md) - ARM şablonları ile üretime hazır tam uygulama
  - Çok ajanlı mimari (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonu ile tek tıkla dağıtım

#### Yerel Örnekler - Konteyner Uygulamaları (Bölümler 2-5)
**Bu depoda kapsamlı konteyner dağıtım örnekleri:**
- [**Container App Examples**](examples/container-app/README.md) - Konteynerleştirilmiş dağıtımlar için eksiksiz rehber
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Sıfıra ölçeklenme ile temel REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - Üretime hazır çoklu servis dağıtımı
  - Hızlı Başlangıç, Üretim ve Gelişmiş dağıtım desenleri
  - İzleme, güvenlik ve maliyet optimizasyonu rehberliği

#### External Examples - Simple Applications (Chapters 1-2)
**Başlamak için bu Azure Samples depolarını klonlayın:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım desenleri
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı desenleri
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çoklu servis mimarileri
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işleme  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML desenleri

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarından seçilmiş koleksiyon
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dökümantasyonu
- [**Examples Directory**](examples/README.md) - Ayrıntılı açıklamalar içeren yerel öğrenme örnekleri

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Glossary**](resources/glossary.md) - Azure ve azd terminolojisi  
- [**FAQ**](resources/faq.md) - Öğrenme bölümlerine göre düzenlenmiş sık sorulan sorular
- [**Study Guide**](resources/study-guide.md) - Kapsamlı uygulama egzersizleri

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Yapay zeka çözümlerinizi AZD ile dağıtılabilir hale getirin (2-3 saat)
- [**Interactive Workshop**](workshop/README.md) - MkDocs ve GitHub Codespaces ile 8 modüllü kılavuzlu egzersizler
  - İzlenen aşamalar: Giriş → Seçim → Doğrulama → Ayrıştırma → Yapılandırma → Özelleştirme → Kapatma → Kapanış

### External Learning Resources
- https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- https://learn.microsoft.com/en-us/azure/architecture/
- https://azure.microsoft.com/pricing/calculator/
- https://status.azure.com/

### AI Agent Skills for Your Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, dağıtım, tanılama, maliyet optimizasyonu ve daha fazlası için 37 açık ajan yeteneği. Bunları GitHub Copilot, Cursor, Claude Code veya desteklenen herhangi bir ajana yükleyin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Quick Troubleshooting Guide

**Yeni başlayanların karşılaştığı yaygın sorunlar ve hızlı çözümler:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Farklı bir Azure bölgesi deneyin
azd env set AZURE_LOCATION "westus2"
azd up

# Veya geliştirme sırasında daha küçük SKU'lar kullanın
# infra/main.parameters.json dosyasını düzenleyin:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Seçenek 1: Temizle ve yeniden dene
azd down --force --purge
azd up

# Seçenek 2: Sadece altyapıyı düzelt
azd provision

# Seçenek 3: Ayrıntılı durumu kontrol et
azd show

# Seçenek 4: Azure Monitor'daki günlükleri kontrol et
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# AZD için yeniden kimlik doğrulaması yapın
azd auth logout
azd auth login

# İsteğe bağlı: az komutlarını çalıştırıyorsanız Azure CLI'yi de yenileyin
az logout
az login

# Kimlik doğrulamasını doğrulayın
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD benzersiz isimler oluşturur, ancak çakışma olursa:
azd down --force --purge

# Yeni bir ortamla yeniden deneyin
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- Yapay zeka uygulamaları: 15-25 dakika (OpenAI sağlanması yavaştır)

```bash
# İlerlemeyi kontrol edin
azd show

# 30 dakikadan fazla takılı kalırsanız, Azure Portal'ı kontrol edin:
azd monitor --overview
# Başarısız dağıtımları kontrol edin
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden vermesini isteyin:
# - Contributor (kaynaklar için)
# - User Access Administrator (rol atamaları için)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Tüm hizmet uç noktalarını göster
azd show

# Veya Azure Portal'ı aç
azd monitor

# Belirli bir hizmeti kontrol et
azd env get-values
# *_URL değişkenlerini ara
```
</details>

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
İlerlemenizi her bölüm boyunca takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: Yapay Zeka Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Altyapı olarak Kod & Dağıtım ✅
- [ ] **Bölüm 5**: Çok Ajanlı Yapay Zeka Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtımdan Önce Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim & Kurumsal Desenler ✅

### Learning Verification
Her bölümü tamamladıktan sonra bilginizi şu yollarla doğrulayın:
1. **Pratik Egzersiz**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Deneyiminizi Azure Discord'da paylaşın
4. **Sonraki Bölüm**: Bir sonraki karmaşıklık seviyesine geçin

### Course Completion Benefits
Tüm bölümleri tamamladığınızda şunlara sahip olacaksınız:
- **Üretim Deneyimi**: Gerçek yapay zeka uygulamalarını Azure'a dağıtma deneyimi
- **Profesyonel Beceriler**: Kurumsala hazır dağıtım yetenekleri  
- **Topluluk Tanınması**: Azure geliştirici topluluğunun aktif bir üyesi
- **Kariyer İlerleme**: Talep gören AZD ve Yapay Zeka dağıtım uzmanlığı

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) ve [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** of developers want to use AZD for AI workloads
- **Top challenges**: Çok servisli dağıtımlar, kimlik bilgisi yönetimi, üretime hazır olma  
- **Most requested**: Yapay zeka spesifik şablonlar, sorun giderme kılavuzları, en iyi uygulamalar

**Topluluğumuza katılarak:**
- AZD + Yapay Zeka deneyimlerinizi paylaşın ve yardım alın
- Yeni yapay zeka şablonlarının erken önizlemelerine erişin
- Yapay zeka dağıtımı için en iyi uygulamalara katkıda bulunun
- Gelecekteki Yapay Zeka + AZD özelliklerinin geliştirilmesini etkileyin

### Contributing to the Course
Katkılara açığız! Ayrıntılar için lütfen [Katkıda Bulunma Kılavuzumuzu](CONTRIBUTING.md) okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dilli desteğin sürdürülmesine yardımcı olun
- **Hata Raporları**: Doğruluk ve açıklığı artırın
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimize uyun

---

## 📄 Course Information

### License
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![Yeni Başlayanlar için LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![Yeni Başlayanlar için LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![Yeni Başlayanlar için LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![Yeni Başlayanlar için AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için AI Ajanları](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Yeni Başlayanlar için Üretken Yapay Zeka](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatif Yapay Zeka (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temel Öğrenim
[![Yeni Başlayanlar için Makine Öğrenimi](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Veri Bilimi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Yapay Zeka](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Siber Güvenlik](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Yeni Başlayanlar için Web Geliştirme](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için XR Geliştirme](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serisi
[![Yapay Zeka Eşli Programlama için Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET için Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Macerası](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Başlamaya Hazır mısınız?**

**Yeni Başlayanlar**: [Bölüm 1: Temel & Hızlı Başlangıç](#-chapter-1-foundation--quick-start) ile başlayın  
**Yapay Zeka Geliştiricileri**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers) bölümüne atlayın  
**Deneyimli Geliştiriciler**: [Bölüm 3: Yapılandırma & Kimlik Doğrulama](#️-chapter-3-configuration--authentication) ile başlayın

**Sonraki Adımlar**: [Bölüm 1'e Başla - AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->