# AZD For Beginners: A Structured Learning Journey

![AZD-Başlangıç](../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub izleyicileri](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub çatalları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızları](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapça](../ar/README.md) | [Bengalce](../bn/README.md) | [Bulgarca](../bg/README.md) | [Burmaca (Myanmar)](../my/README.md) | [Çince (Basitleştirilmiş)](../zh-CN/README.md) | [Çince (Geleneksel, Hong Kong)](../zh-HK/README.md) | [Çince (Geleneksel, Makao)](../zh-MO/README.md) | [Çince (Geleneksel, Tayvan)](../zh-TW/README.md) | [Hırvatça](../hr/README.md) | [Çekçe](../cs/README.md) | [Danca](../da/README.md) | [Hollandaca](../nl/README.md) | [Estonca](../et/README.md) | [Fince](../fi/README.md) | [Fransızca](../fr/README.md) | [Almanca](../de/README.md) | [Yunanca](../el/README.md) | [İbranice](../he/README.md) | [Hintçe](../hi/README.md) | [Macarca](../hu/README.md) | [Endonezyaca](../id/README.md) | [İtalyanca](../it/README.md) | [Japonca](../ja/README.md) | [Kannada](../kn/README.md) | [Korece](../ko/README.md) | [Litvanca](../lt/README.md) | [Malayca](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nijerya Pidgin](../pcm/README.md) | [Norveççe](../no/README.md) | [Farsça (Farsi)](../fa/README.md) | [Lehçe](../pl/README.md) | [Portekizce (Brezilya)](../pt-BR/README.md) | [Portekizce (Portekiz)](../pt-PT/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Romence](../ro/README.md) | [Rusça](../ru/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Slovakça](../sk/README.md) | [Slovence](../sl/README.md) | [İspanyolca](../es/README.md) | [Svahili](../sw/README.md) | [İsveççe](../sv/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tayca](../th/README.md) | [Türkçe](./README.md) | [Ukraynaca](../uk/README.md) | [Urduca](../ur/README.md) | [Vietnamca](../vi/README.md)

> **Yerel Olarak Klonlamayı Tercih Ediyor musunuz?**
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

## 🆕 Bugün azd'de Neler Yeni

Azure Developer CLI geleneksel web uygulamalarının ve API'lerin ötesine geçti. Bugün azd, AI destekli uygulamalar ve zeki ajanlar dahil olmak üzere Azure'a herhangi bir uygulamayı dağıtmak için tek araçtır.

Bu sizin için ne anlama geliyor:

- **AI ajanları artık birinci sınıf azd iş yükleri.** `azd init` → `azd up` iş akışını kullanarak AI ajan projelerini başlatabilir, dağıtabilir ve yönetebilirsiniz.
- **Microsoft Foundry entegrasyonu**, model dağıtımı, ajan barındırma ve AI hizmet yapılandırmasını doğrudan azd şablon ekosistemine getiriyor.
- **Temel iş akışı değişmedi.** İster bir todo uygulaması, ister bir mikro hizmet, ister çok ajanlı bir AI çözümü dağıtıyor olun, komutlar aynıdır.

Daha önce azd kullandıysanız, AI desteği doğal bir uzantıdır—ayrı bir araç veya gelişmiş bir yol değil. Yeni başlıyorsanız, her şey için işe yarayan tek bir iş akışı öğreneceksiniz.

---

## 🚀 Azure Developer CLI (azd) Nedir?

**Azure Developer CLI (azd)**, uygulamaları Azure'a dağıtmayı kolaylaştıran geliştirici dostu bir komut satırı aracıdır. Onlarca Azure kaynağını manuel olarak oluşturup bağlamak yerine, tek bir komutla tüm uygulamaları dağıtabilirsiniz.

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

**Hepsi bu kadar!** Azure Portal'da tıklama, önce öğrenilecek karmaşık ARM şablonları veya elle yapılandırma yok - sadece Azure'da çalışan uygulamalar.

---

## ❓ Azure Developer CLI ve Azure CLI: Fark Nedir?

Bu, yeni başlayanların en çok sorduğu sorudur. İşte basit cevap:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Bireysel Azure kaynaklarını yönetmek | Tam uygulamaları dağıtmak |
| **Mindset** | Altyapı odaklı | Uygulama odaklı |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Azure hizmetlerini bilmek gerekir | Sadece uygulamanızı bilin |
| **Best For** | DevOps, Altyapı | Geliştiriciler, Prototipleme |

### Basit Bir Benzetme

- **Azure CLI**, ev inşa etmek için tüm araçlara sahip olmak gibidir - çekiciler, testereler, çiviler. Her şeyi inşa edebilirsiniz, ancak inşaatı bilmeniz gerekir.
- **Azure Developer CLI**, bir müteahhit tutmak gibidir - ne istediğinizi anlatırsınız ve inşaatı onlar halleder.

### Hangi Durumda Hangi Araç?

| Scenario | Use This |
|----------|----------|
| "Web uygulamamı hızlıca dağıtmak istiyorum" | `azd up` |
| "Sadece bir depolama hesabı oluşturmalıyım" | `az storage account create` |
| "Tam bir AI uygulaması inşa ediyorum" | `azd init --template azure-search-openai-demo` |
| "Belirli bir Azure kaynağını hata ayıklamam gerekiyor" | `az resource show` |
| "Dakikalar içinde üretime hazır dağıtım istiyorum" | `azd up --environment production` |

### Birlikte Çalışırlar!

AZD, altında Azure CLI'yi kullanır. İkisini de kullanabilirsiniz:
```bash
# Uygulamanızı AZD ile dağıtın
azd up

# Ardından belirli kaynakları Azure CLI ile ince ayar yapın
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD'de Şablonlar Bulun

Sıfırdan başlamayın! **Awesome AZD**, hazır dağıtıma uygun şablonların topluluk koleksiyonudur:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Galerisi**](https://azure.github.io/awesome-azd/) | Tek tıkla dağıtma ile 200+ şablona göz atın |
| 🔗 [**Bir Şablon Gönder**](https://github.com/Azure/awesome-azd/issues) | Kendi şablonunuzu topluluğa katkıda bulunun |
| 🔗 [**GitHub Deposu**](https://github.com/Azure/awesome-azd) | Kaynağı yıldızlayın ve keşfedin |

### Awesome AZD'den Popüler AI Şablonları

```bash
# Microsoft Foundry Modelleri + AI Arama ile RAG Sohbet
azd init --template azure-search-openai-demo

# Hızlı AI Sohbet Uygulaması
azd init --template openai-chat-app-quickstart

# Foundry Ajanları ile AI Ajanları
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 Adımda Başlamak

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

### Adım 2: Azure'a Giriş Yapın

```bash
azd auth login
```

### Adım 3: İlk Uygulamanızı Dağıtın

```bash
# Bir şablondan başlat
azd init --template todo-nodejs-mongo

# Azure'a dağıt (her şeyi oluşturur!)
azd up
```

**🎉 Hepsi bu kadar!** Uygulamanız artık Azure'da canlı.

### Temizlik (Unutmayın!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Bu Kursu Nasıl Kullanın

Bu kurs **ilerleyici öğrenme** için tasarlanmıştır - rahat hissettiğiniz yerden başlayın ve yukarı doğru ilerleyin:

| Your Experience | Start Here |
|-----------------|------------|
| **Azure'a tamamen yeni** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **Azure biliyor, AZD'ye yeni** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **AI uygulamaları dağıtmak istiyor** | [Bölüm 2: AI-Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Uygulamalı pratik istiyor** | [🎓 Etkileşimli Atölye](workshop/README.md) - 3-4 saat rehberli laboratuvar |
| **Üretim desenlerine ihtiyaç var** | [Bölüm 8: Üretim & Kurumsal](#-chapter-8-production--enterprise-patterns) |

### Hızlı Kurulum

1. **Bu Depoyu Forklayın**: [![GitHub çatalları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonlayın**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Yardım Alın**: [Azure Discord Topluluğu](https://discord.com/invite/ByRwuEEgH4)

> **Yerel Olarak Klonlamayı Tercih Ediyor musunuz?**

> Bu depo 50+ dil çevirisi içerir ve bu da indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sparse checkout kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı bir indirme ile sağlar.


## Kurs Genel Bakışı

Yapılandırılmış bölümler aracılığıyla Azure Developer CLI (azd) ustalaşın. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel vurgu.**

### Bu Kurs Modern Geliştiriciler İçin Neden Önemli

Microsoft Foundry Discord topluluğu içgörülerine dayanarak, **geliştiricilerin %45'i AZD'yi AI iş yükleri için kullanmak istiyor** ancak şu zorluklarla karşılaşıyorlar:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımının en iyi uygulamaları  
- Azure AI hizmet entegrasyonu ve yapılandırma
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak şunları yapabileceksiniz:
- **AZD Temellerinde Ustalaşın**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Altyapıyı Kod Olarak Uygulayın**: Bicep şablonları ile Azure kaynaklarını yönetin
- **Dağıtımları Hata Ayıklayın**: Yaygın sorunları çözün ve problemleri debug edin
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çok Ajanlı Çözümler İnşa Edin**: Karmaşık AI mimarilerini dağıtın

## 🗺️ Kurs Haritası: Bölümlere Göre Hızlı Gezinme

Her bölümün öğrenme hedefleri, hızlı başlangıçları ve alıştırmaları içeren ayrılmış bir README dosyası vardır:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Bölüm 1: Temel](docs/chapter-01-foundation/README.md)** | Başlarken | [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) &#124; [Kurulum](docs/chapter-01-foundation/installation.md) &#124; [İlk Proje](docs/chapter-01-foundation/first-project.md) | 30-45 dk | ⭐ |
| **[Bölüm 2: Yapay Zeka Geliştirme](docs/chapter-02-ai-development/README.md)** | Yapay Zeka Öncelikli Uygulamalar | [Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Ajanları](docs/chapter-02-ai-development/agents.md) &#124; [Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atölye](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saat | ⭐⭐ |
| **[Bölüm 3: Yapılandırma](docs/chapter-03-configuration/README.md)** | Kimlik Doğrulama ve Güvenlik | [Yapılandırma](docs/chapter-03-configuration/configuration.md) &#124; [Kimlik Doğrulama & Güvenlik](docs/chapter-03-configuration/authsecurity.md) | 45-60 dakika | ⭐⭐ |
| **[Bölüm 4: Altyapı](docs/chapter-04-infrastructure/README.md)** | IaC & Dağıtım | [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saat | ⭐⭐⭐ |
| **[Bölüm 5: Çok Ajanlı](docs/chapter-05-multi-agent/README.md)** | Yapay Zeka Ajan Çözümleri | [Perakende Senaryosu](examples/retail-scenario.md) &#124; [Koordinasyon Kalıpları](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[Bölüm 6: Dağıtım Öncesi](docs/chapter-06-pre-deployment/README.md)** | Planlama & Doğrulama | [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uygulama İçgörüleri](docs/chapter-06-pre-deployment/application-insights.md) | 1 saat | ⭐⭐ |
| **[Bölüm 7: Sorun Giderme](docs/chapter-07-troubleshooting/README.md)** | Hata Ayıklama & Düzeltme | [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md) &#124; [Yapay Zeka Sorunları](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saat | ⭐⭐ |
| **[Bölüm 8: Üretim](docs/chapter-08-production/README.md)** | Kurumsal Kalıplar | [Üretim Uygulamaları](docs/chapter-08-production/production-ai-practices.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[🎓 Atölye](workshop/README.md)** | Uygulamalı Laboratuvar | [Giriş](workshop/docs/instructions/0-Introduction.md) &#124; [Seçim](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Parçalarına Ayırma](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Altyapıyı Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kapanış](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saat | ⭐⭐ |

**Toplam Ders Süresi:** ~10-14 saat | **Yetenek Gelişimi:** Başlangıç → Üretime Hazır

---

## 📚 Öğrenme Bölümleri

*Deneyim düzeyinize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel ve Hızlı Başlangıç
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Karmaşıklık**: ⭐

#### Neler Öğreneceksiniz
- Azure Developer CLI temellerini anlama
- Platformunuzda AZD'nin kurulumu
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure Developer CLI nedir?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Kurulum & Ayarlar](docs/chapter-01-foundation/installation.md) - Platforma özel rehberler
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Adım adım öğretici
- **📋 Hızlı Başvuru**: [Komut Hile Sayfası](resources/cheat-sheet.md)

#### Pratik Alıştırmalar
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Çıktısı**: AZD kullanarak Azure'a basit bir web uygulamasını başarıyla dağıtmak

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
**📈 İşlem Sonrası Yetenek Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir
**📈 İşlem Sonrası Yetenek Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: Yapay Zeka Öncelikli Geliştirme (Yapay Zeka Geliştiricilerine Önerilir)
**Önkoşullar**: Bölüm 1 tamamlanmış  
**Süre**: 1-2 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- AZD ile Microsoft Foundry entegrasyonu
- Yapay zeka destekli uygulamaların dağıtımı
- Yapay zeka servis konfigürasyonlarını anlama

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Ajanları**: [AI Ajanları Kılavuzu](docs/chapter-02-ai-development/agents.md) - AZD ile akıllı ajanları dağıtın
- **📖 Kalıplar**: [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) - Yapay zeka modellerini dağıtın ve yönetin
- **🛠️ Atölye**: [AI Atölye Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - Yapay zeka çözümlerinizi AZD'ye hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - MkDocs * DevContainer Ortamı
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

**💡 Bölüm Çıktısı**: RAG yeteneklerine sahip yapay zeka destekli bir sohbet uygulamasını dağıtmak ve yapılandırmak

**✅ Başarı Doğrulaması:**
```bash
# Bölüm 2'den sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test etmek
# Sorular sormak ve kaynak gösteren yapay zeka destekli yanıtlar almak
# Arama entegrasyonunun çalıştığını doğrulamak
azd monitor  # Application Insights'ın telemetri gösterdiğini kontrol etmek
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 İşlem Sonrası Yetenek Seviyesi:** Üretime hazır yapay zeka uygulamalarını dağıtıp yapılandırabilir  
**💰 Maliyet Bilinci:** Geliştirme maliyetlerinin aylık ~$80-150, üretim maliyetlerinin aylık ~$300-3500 aralığında olduğunu anlayın

#### 💰 Yapay Zeka Dağıtımları İçin Maliyet Hususları

**Geliştirme Ortamı (Tahmini $80-150/ay):**
- Microsoft Foundry Modelleri (Kullandıkça öde): $0-50/ay (token kullanımına bağlı olarak)
- AI Search (Temel seviye): $75/ay
- Container Apps (Tüketim): $0-20/ay
- Depolama (Standart): $1-5/ay

**Üretim Ortamı (Tahmini $300-3,500+/ay):**
- Microsoft Foundry Modelleri (tutarlı performans için PTU): $3,000+/ay VEYA yüksek hacimde kullanımla Kullandıkça Öde
- AI Search (Standart seviye): $250/ay
- Container Apps (Tahsisli): $50-100/ay
- Application Insights: $5-50/ay
- Depolama (Premium): $10-50/ay

**💡 Maliyet Optimizasyonu İpuçları:**
- Öğrenme için **Ücretsiz Katman** Microsoft Foundry Modellerini kullanın (Azure OpenAI 50,000 token/ay dahil)
- Aktif geliştirme yapmadığınızda kaynakları boşaltmak için `azd down` çalıştırın
- Tüketim tabanlı faturalama ile başlayın, yalnızca üretim için PTU'ya yükseltin
- Dağıtım öncesi maliyetleri tahmin etmek için `azd provision --preview` kullanın
- Otomatik ölçeklendirmeyi etkinleştirin: yalnızca gerçek kullanım için ödeme yapın

**Maliyet İzleme:**
```bash
# Tahmini aylık maliyetleri kontrol edin
azd provision --preview

# Gerçek maliyetleri Azure Portal'da izleyin
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bölüm 3: Yapılandırma & Kimlik Doğrulama
**Önkoşullar**: Bölüm 1 tamamlandı  
**Süre**: 45-60 dakika  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/chapter-03-configuration/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik doğrulama kalıpları ve yönetilen kimlik](docs/chapter-03-configuration/authsecurity.md) - Kimlik doğrulama kalıpları
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Alıştırmalar
- Birden fazla ortam yapılandırın (dev, staging, prod)
- Yönetilen kimlik ile kimlik doğrulamasını ayarlayın
- Ortama özgü yapılandırmalar uygulayın

**💡 Bölüm Çıktısı**: Doğru kimlik doğrulama ve güvenlikle birden fazla ortamı yönetin

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı & Dağıtım
**Önkoşullar**: Bölümler 1-3 tamamlandı  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐⭐

#### Neler Öğreneceksiniz
- İleri dağıtım kalıpları
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- **🏗️ Sağlama**: [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Container App Örneği](../../examples/container-app) - Konteyner tabanlı dağıtımlar

#### Pratik Alıştırmalar
- Özel Bicep şablonları oluşturun
- Çok servisli uygulamalar dağıtın
- Blue-green dağıtım stratejileri uygulayın

**💡 Bölüm Çıktısı**: Özel altyapı şablonları kullanarak karmaşık çok servisli uygulamaları dağıtın

---

### 🎯 Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri (İleri)
**Önkoşullar**: Bölümler 1-2 tamamlandı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Çok ajanlı mimari kalıplar
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır yapay zeka dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çok Ajanlı Çözüm](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıklamayla dağıtım
- **📖 Mimari**: [Çok ajanlı koordinasyon kalıpları](docs/chapter-06-pre-deployment/coordination-patterns.md) - Kalıplar

#### Pratik Alıştırmalar
```bash
# Tam perakende çok ajanlı çözümü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Çıktısı**: Müşteri ve Envanter ajanlarına sahip üretime hazır çok ajanlı bir yapay zeka çözümünü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama
**Önkoşullar**: Bölüm 4 tamamlandı  
**Süre**: 1 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Kapasite planlaması ve kaynak doğrulama
- SKU seçimi stratejileri
- Uçuş öncesi kontroller ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet etkin seçenekler
- **✅ Doğrulama**: [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatik scriptler

#### Pratik Alıştırmalar
- Kapasite doğrulama scriptlerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatikleştirilmiş dağıtım öncesi kontrolleri uygulayın

**💡 Bölüm Çıktısı**: Dağıtımları yürütmeden önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme & Hata Ayıklama
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
- **🤖 Yapay Zeka Sorunları**: [Yapay Zekaya Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Yapay zeka servis sorunları

#### Pratik Alıştırmalar
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- Yapay zeka servis bağlantılarını hata ayıklayın

**💡 Bölüm Çıktısı**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün

---

### 🏢 Bölüm 8: Üretim & Kurumsal Kalıplar
**Önkoşullar**: Bölümler 1-4 tamamlandı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik kalıpları
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Kurumsal kalıplar
- **📝 Örnekler**: [Microservices Example](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - İzleme

#### Pratik Egzersizler
- Kurumsal güvenlik desenlerini uygulayın
- Kapsamlı izlemeyi kurun
- Uygun yönetişim ile üretime dağıtın

**💡 Bölüm Çıktısı**: Kurumsal hazır uygulamaları tam üretim yetenekleriyle dağıtın

---

## 🎓 Atölye Genel Bakışı: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Geliştirme Aşamasında**  
> Atölye materyalleri şu anda geliştiriliyor ve iyileştiriliyor. Temel modüller çalışır durumda, ancak bazı ileri bölümler tamamlanmadı. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemeyi takip et →](workshop/README.md)

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve rehberli alıştırmalarla kapsamlı uygulamalı öğrenme**

Atölye materyallerimiz, yukarıdaki bölüm tabanlı müfredata tamamlayıcı, yapılandırılmış ve etkileşimli bir öğrenme deneyimi sunar. Atölye, hem kendi hızınızda öğrenme hem de eğitmen liderliğindeki oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Eksiksiz MkDocs destekli atölye, arama, kopyalama ve tema özellikleri ile
- **GitHub Codespaces Entegrasyonu**: Tek tıklamayla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 8 modüllü rehberli alıştırmalar (toplam 3-4 saat)
- **Aşamalı Metodoloji**: Giriş → Seçim → Doğrulama → Parçalara Ayırma → Yapılandırma → Özelleştirme → Kaldırma → Kapanış
- **Etkileşimli DevContainer Ortamı**: Ön yapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Modül Yapısı
Atölye, sizi keşiften dağıtıma ustalığa taşıyan bir **8 modüllü aşamalı metodoloji** izler:

| Modül | Konu | Yapacaklarınız | Süre |
|--------|-------|----------------|----------|
| **0. Giriş** | Atölye Genel Bakışı | Öğrenme hedeflerini, önkoşulları ve atölye yapısını anlayın | 15 dk |
| **1. Seçim** | Şablon Keşfi | AZD şablonlarını keşfedin ve senaryonuza uygun AI şablonunu seçin | 20 dk |
| **2. Doğrulama** | Dağıtım ve Doğrulama | Şablonu `azd up` ile dağıtın ve altyapının çalıştığını doğrulayın | 30 dk |
| **3. Parçalara Ayırma** | Yapıyı Anlama | Şablon mimarisini, Bicep dosyalarını ve kod organizasyonunu keşfetmek için GitHub Copilot kullanın | 30 dk |
| **4. Yapılandırma** | azure.yaml Derinlemesine İnceleme | `azure.yaml` yapılandırmasını, yaşam döngüsü kancalarını ve ortam değişkenlerini ustalaştırın | 30 dk |
| **5. Özelleştirme** | Size Özel Hale Getirme | AI Search'u, izlemeyi, değerlendirmeyi etkinleştirin ve senaryonuza göre özelleştirin | 45 dk |
| **6. Kaldırma** | Temizleme | Kaynakları güvenli şekilde kaldırmak için `azd down --purge` kullanın | 15 dk |
| **7. Kapanış** | Sonraki Adımlar | Başarıları, ana kavramları gözden geçirin ve öğrenme yolculuğunuza devam edin | 15 dk |

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
# workshop/README.md dosyasındaki kurulum talimatlarını izleyin
```

#### 🎯 Atölye Öğrenme Çıktıları
Atölyeyi tamamlayarak katılımcılar şunları elde edecek:
- **Üretim AI Uygulamalarını Dağıtın**: Microsoft Foundry hizmetleri ile AZD'yi kullanın
- **Çok Ajanlı Mimarilerde Uzmanlaşın**: Koordine AI ajan çözümleri uygulayın
- **Güvenlik En İyi Uygulamalarını Uygulayın**: Kimlik doğrulama ve erişim kontrolünü yapılandırın
- **Ölçek için Optimize Edin**: Maliyet-etkin, performanslı dağıtımlar tasarlayın
- **Dağıtımları Hata Ayıklayın**: Yaygın sorunları bağımsız olarak çözün

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Modül Bazlı Talimatlar**:
  - [0. Giriş](workshop/docs/instructions/0-Introduction.md) - Atölye genel bakışı ve hedefleri
  - [1. Seçim](workshop/docs/instructions/1-Select-AI-Template.md) - AI şablonlarını bulun ve seçin
  - [2. Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) - Şablonları dağıtın ve doğrulayın
  - [3. Parçalara Ayırma](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Şablon mimarisini inceleyin
  - [4. Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml konusunda ustalaşın
  - [5. Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) - Senaryonuza göre özelleştirin
  - [6. Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Kaynakları temizleyin
  - [7. Kapanış](workshop/docs/instructions/7-Wrap-up.md) - Gözden geçirme ve sonraki adımlar
- **🛠️ AI Atölye Laboratuvarı**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı alıştırmalar
- **💡 Hızlı Başlangıç**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ortam yapılandırması

**İçin ideal**: Kurumsal eğitim, üniversite kursları, kendi hızında öğrenme ve geliştirici bootcamp'leri.

---

## 📖 Derinlemesine İnceleme: AZD Özellikleri

Temellerin ötesinde, AZD üretim dağıtımları için güçlü özellikler sunar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama desenleri için önceden oluşturulmuş şablonları kullanın
- **Kod Olarak Altyapı** - Azure kaynaklarını Bicep veya Terraform kullanarak yönetin  
- **Entegre iş akışları** - Uygulamaları kusursuz şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiş

### **AZD + Microsoft Foundry: AI Dağıtımları için İdeal**

**Neden AI Çözümleri için AZD?** AZD, AI geliştiricilerinin karşılaştığı başlıca zorlukları ele alır:

- **AI Hazır Şablonlar** - Microsoft Foundry Modelleri, Cognitive Services ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI hizmetleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet-etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğu ve uç noktalarına kesintisiz bağlantı

---

## 🎯 Şablonlar & Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI desenlerini gösterir. Bazıları harici Azure Samples, diğerleri yerel uygulamalardır.

| Şablon | Bölüm | Karmaşıklık | Hizmetler | Tür |
|----------|---------|------------|----------|------|
| [**AI sohbetine başlama**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Harici |
| [**AI ajanlarına başlama**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Harici |
| [**Azure Search + OpenAI Gösterimi**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Harici |
| [**OpenAI Sohbet Uygulaması Hızlı Başlangıç**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Harici |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Harici |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Harici |
| [**Perakende Çoklu Ajan Çözümü**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Yerel** |

### Öne Çıkan: Tam Öğrenme Senaryoları
**Öğrenme bölümlerine eşleştirilmiş üretime hazır uygulama şablonları**

| Şablon | Öğrenme Bölümü | Karmaşıklık | Temel Öğrenme |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Document Intelligence entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağrısı |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanları ile çoklu-ajan mimarisi |

### Örnek Türlerine Göre Öğrenme

> **📌 Yerel vs. Harici Örnekler:**  
> **Yerel Örnekler** (bu repoda) = Hemen kullanıma hazır  
> **Harici Örnekler** (Azure Samples) = Bağlantılı depolardan klonlayın

#### Yerel Örnekler (Hemen Kullanılabilir)
- [**Perakende Çoklu Ajan Çözümü**](examples/retail-scenario.md) - ARM şablonlarıyla tam üretime hazır uygulama
  - Çoklu-ajan mimarisi (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonu ile tek tıklamayla dağıtım

#### Yerel Örnekler - Konteyner Uygulamaları (Bölümler 2-5)
**Bu depoda kapsamlı konteyner dağıtım örnekleri:**
- [**Konteyner Uygulama Örnekleri**](examples/container-app/README.md) - Konteynerleştirilmiş dağıtımlar için eksiksiz rehber
  - [Basit Flask API](../../examples/container-app/simple-flask-api) - Sıfıra ölçeklenebilirlik ile temel REST API
  - [Mikroservis Mimarisi](../../examples/container-app/microservices) - Üretime hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve İleri düzey dağıtım desenleri
  - İzleme, güvenlik ve maliyet optimizasyonu rehberliği

#### Harici Örnekler - Basit Uygulamalar (Bölümler 1-2)
**Başlamak için bu Azure Samples depolarını klonlayın:**
- [Basit Web Uygulaması - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım desenleri
- [Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Konteyner Uygulaması - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### Harici Örnekler - Veritabanı Entegrasyonu (Bölüm 3-4)  
- [Veritabanı Uygulaması - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı desenleri
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### Harici Örnekler - İleri Düzey Desenler (Bölümler 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çok servisli mimariler
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işleme  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML desenleri

### Harici Şablon Koleksiyonları
- [**Resmi AZD Şablon Galerisi**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarından seçilmiş koleksiyon
- [**Azure Developer CLI Şablonları**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon belgeleri
- [**Örnekler Dizini**](examples/README.md) - Yerel öğrenme örnekleri detaylı açıklamalarla

---

## 📚 Öğrenme Kaynakları ve Referanslar

### Hızlı Referanslar
- [**Komut Hızlı Başvuru**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Sözlük**](resources/glossary.md) - Azure ve azd terminolojisi  
- [**SSS**](resources/faq.md) - Öğrenme bölümlerine göre düzenlenmiş sık sorulan sorular
- [**Çalışma Rehberi**](resources/study-guide.md) - Kapsamlı uygulama alıştırmaları

### Uygulamalı Atölyeler
- [**AI Atölye Laboratuvarı**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD ile dağıtılabilir hale getirin (2-3 saat)
- [**Etkileşimli Atölye**](workshop/README.md) - MkDocs ve GitHub Codespaces ile 8 modüllü rehberli alıştırmalar
  - Aşamalar: Giriş → Seçim → Doğrulama → Parçalara Ayırma → Yapılandırma → Özelleştirme → Kaldırma → Kapanış

### Harici Öğrenme Kaynakları
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Düzenleyiciniz için Yapay Zeka Ajanı Becerileri
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, dağıtım, tanılama, maliyet optimizasyonu ve daha fazlası için 37 açık ajan becerisi. Bunları GitHub Copilot, Cursor, Claude Code veya desteklenen herhangi bir ajana yükleyin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların karşılaştığı yaygın sorunlar ve hemen çözümler:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Önce AZD'yi kurun
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

# Veya geliştirme ortamında daha küçük SKU'lar kullanın
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

# Seçenek 4: Azure Monitor'da günlükleri kontrol et
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Yeniden kimlik doğrula
az logout
az login

azd auth logout
azd auth login

# Kimlik doğrulamasını doğrula
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD benzersiz isimler oluşturur, ancak çakışma olursa:
azd down --force --purge

# Ardından temiz bir ortamla yeniden deneyin
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- Yapay zeka uygulamaları: 15-25 dakika (OpenAI sağlama işlemi yavaştır)

```bash
# İlerlemeyi kontrol edin
azd show

# 30 dakikadan fazla takılıp kaldıysanız, Azure Portal'ı kontrol edin:
azd monitor
# Başarısız dağıtımları kontrol edin
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden talep edin:
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

# Belirli hizmeti kontrol et
azd env get-values
# *_URL değişkenlerini ara
```
</details>

### 📚 Tam Sorun Giderme Kaynakları

- **Common Issues Guide:** [Ayrıntılı Çözümler](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [Yapay Zeka Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Adım Adım Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama & Sertifikasyon

### İlerleme Takibi
Her bölümde öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: Yapay Zeka Odaklı Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Altyapı olarak Kod & Dağıtım ✅
- [ ] **Bölüm 5**: Çok Ajanlı Yapay Zeka Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtımdan Önce Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim & Kurumsal Desenler ✅

### Öğrenme Doğrulaması
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Pratik Egzersiz**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS kısmını gözden geçirin
3. **Topluluk Tartışması**: Azure Discord'da deneyiminizi paylaşın
4. **Sonraki Bölüm**: Bir sonraki zorluk seviyesine geçin

### Kurs Tamamlama Faydaları
Tüm bölümleri tamamladığınızda şunlara sahip olacaksınız:
- **Üretim Deneyimi**: Gerçek yapay zeka uygulamalarını Azure'a dağıttınız
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım yetenekleri  
- **Topluluk Tanınması**: Azure geliştirici topluluğunun aktif bir üyesi
- **Kariyer İlerlemesi**: Talep gören AZD ve yapay zeka dağıtım uzmanlığı

---

## 🤝 Topluluk & Destek

### Yardım & Destek Alın
- **Teknik Sorunlar**: [Hataları bildirin ve özellik isteğinde bulunun](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure) ve [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI'ye Özgü Yardım**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) katılın
- **Dokümantasyon**: [Resmi Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord'dan Topluluk Görüşleri

**#Azure Kanalı'ndaki Son Anket Sonuçları:**
- **%45** geliştirici AZD'yi AI iş yükleri için kullanmak istiyor
- **Başlıca zorluklar**: Çoklu servis dağıtımları, kimlik bilgisi yönetimi, üretime hazır olma  
- **En çok talep edilenler**: Yapay zeka odaklı şablonlar, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılarak:**
- AZD + AI deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken önizlemelerine erişin
- AI dağıtımı en iyi uygulamalarına katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılarınıza açığız! Ayrıntılar için lütfen [Contributing Guide](CONTRIBUTING.md) dosyasını okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çoklu dil desteğinin bakımına yardımcı olun
- **Hata Bildirimleri**: Doğruluk ve netliği iyileştirin
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimize uyun

---

## 📄 Kurs Bilgisi

### Lisans
Bu proje MIT Lisansı altında lisanslanmıştır - ayrıntılar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz diğer kapsamlı öğrenme kurslarını da üretiyor:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![Yeni Başlayanlar için LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![Yeni Başlayanlar için LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![Yeni Başlayanlar için LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ajanlar
[![Yeni Başlayanlar için AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar için AI Agents](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Üretken Yapay Zeka Serisi
[![Yeni Başlayanlar için Üretken Yapay Zeka](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
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
[![Yapay Zeka Eşli Programlama için Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET için Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Macerası](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Başlamaya Hazır mısınız?**

**Yeni Başlayanlar**: Başlayın ile [Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç](#-chapter-1-foundation--quick-start)  
**Yapay Zeka Geliştiricileri**: Atla [Bölüm 2: Yapay Zekâ Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Deneyimli Geliştiriciler**: ile başlayın [Bölüm 3: Yapılandırma ve Kimlik Doğrulama](#️-chapter-3-configuration--authentication)

**Sonraki Adımlar**: [Bölüm 1'e Başla - AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için azami özeni göstermemize rağmen, otomatik çevirilerin hatalar veya doğruluk sorunları içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->