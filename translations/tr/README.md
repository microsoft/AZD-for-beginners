# AZD For Beginners: A Structured Learning Journey

![AZD - Yeni Başlayanlar](../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub izleyicileri](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forklar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızlar](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapça](../ar/README.md) | [Bengalce](../bn/README.md) | [Bulgarca](../bg/README.md) | [Burmaca (Myanmar)](../my/README.md) | [Çince (Basitleştirilmiş)](../zh-CN/README.md) | [Çince (Geleneksel, Hong Kong)](../zh-HK/README.md) | [Çince (Geleneksel, Makao)](../zh-MO/README.md) | [Çince (Geleneksel, Tayvan)](../zh-TW/README.md) | [Hırvatça](../hr/README.md) | [Çekçe](../cs/README.md) | [Danca](../da/README.md) | [Hollandaca](../nl/README.md) | [Estonca](../et/README.md) | [Fince](../fi/README.md) | [Fransızca](../fr/README.md) | [Almanca](../de/README.md) | [Yunanca](../el/README.md) | [İbranice](../he/README.md) | [Hintçe](../hi/README.md) | [Macarca](../hu/README.md) | [Endonezce](../id/README.md) | [İtalyanca](../it/README.md) | [Japonca](../ja/README.md) | [Kannada](../kn/README.md) | [Korece](../ko/README.md) | [Litvanca](../lt/README.md) | [Malayca](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalce](../ne/README.md) | [Nijerya Pidgin](../pcm/README.md) | [Norveççe](../no/README.md) | [Farsça (Farsi)](../fa/README.md) | [Lehçe](../pl/README.md) | [Portekizce (Brezilya)](../pt-BR/README.md) | [Portekizce (Portekiz)](../pt-PT/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Romence](../ro/README.md) | [Rusça](../ru/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Slovakça](../sk/README.md) | [Slovence](../sl/README.md) | [İspanyolca](../es/README.md) | [Svahili](../sw/README.md) | [İsveççe](../sv/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Tamilce](../ta/README.md) | [Telugu](../te/README.md) | [Tayca](../th/README.md) | [Türkçe](./README.md) | [Ukraynaca](../uk/README.md) | [Urduca](../ur/README.md) | [Vietnamca](../vi/README.md)

> **Yerel Olarak Klonlamayı mı Tercih Ediyorsunuz?**
>
> Bu depo, 50'den fazla dil çevirisini içerir ve bu da indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için seyrek çekme (sparse checkout) kullanın:
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
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi sağlar ve çok daha hızlı bir indirme sunar.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Bugün azd'de Yenilikler

Azure Developer CLI, geleneksel web uygulamaları ve API'lerin ötesine büyüdü. Bugün azd, AI destekli uygulamalar ve akıllı ajanlar da dahil olmak üzere Azure'a herhangi bir uygulamayı dağıtmak için tek araçtır.

Bu sizin için ne anlama geliyor:

- **AI ajanları artık azd iş yüklerinde birinci sınıf.** Zaten bildiğiniz `azd init` → `azd up` iş akışıyla AI ajan projelerini başlatabilir, dağıtabilir ve yönetebilirsiniz.
- **Microsoft Foundry entegrasyonu** model dağıtımı, ajan barındırma ve AI hizmet yapılandırmasını doğrudan azd şablon ekosistemine getirir.
- **Temel iş akışı değişmedi.** Bir yapılacaklar uygulaması, bir mikro hizmet veya çok ajanlı bir AI çözümü dağıtıyor olun, komutlar aynıdır.

Daha önce azd kullandıysanız, AI desteği doğal bir uzantıdır—ayrı bir araç ya da gelişmiş bir yol değildir. Yeni başlıyorsanız, her şey için işe yarayan tek bir iş akışı öğreneceksiniz.

---

## 🚀 Azure Developer CLI (azd) Nedir?

**Azure Developer CLI (azd)**, uygulamaları Azure'a dağıtmayı basitleştiren geliştirici dostu bir komut satırı aracıdır. Düzinece Azure kaynağını manuel olarak oluşturup birbirine bağlamak yerine, tüm uygulamaları tek bir komutla dağıtabilirsiniz.

### `azd up`'un Sihri

```bash
# Bu tek komut her şeyi yapar:
# ✅ Tüm Azure kaynaklarını oluşturur
# ✅ Ağ ve güvenliği yapılandırır
# ✅ Uygulama kodunuzu oluşturur
# ✅ Azure'a dağıtır
# ✅ Size çalışan bir URL verir
azd up
```

**Hepsi bu kadar!** Azure Portal'da tıklama yok, önce öğrenmeniz gereken karmaşık ARM şablonları yok, manuel yapılandırma yok - sadece Azure üzerinde çalışan uygulamalar.

---

## ❓ Azure Developer CLI ile Azure CLI: Fark Nedir?

Bu, yeni başlayanların en sık sorduğu sorudur. İşte basit cevap:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Amaç** | Bireysel Azure kaynaklarını yönetmek | Tüm uygulamaları dağıtmak |
| **Zihniyet** | Altyapı odaklı | Uygulama odaklı |
| **Örnek** | `az webapp create --name myapp...` | `azd up` |
| **Öğrenme Eğrisi** | Azure hizmetlerini bilmeniz gerekir | Sadece uygulamanızı bilin |
| **En Uygun** | DevOps, Altyapı | Geliştiriciler, Prototipleme |

### Basit Bir Benzetme

- **Azure CLI**, ev inşa etmek için tüm aletlere sahip olmak gibidir - çekiçler, testereler, çiviler. Her şeyi inşa edebilirsiniz, ancak inşaatı bilmeniz gerekir.
- **Azure Developer CLI**, bir müteahhit kiralamak gibidir - ne istediğinizi anlatırsınız ve onlar inşa eder.

### Hangi Durumda Hangisini Kullanmalı

| Senaryo | Kullanılacak |
|----------|--------------|
| "Web uygulamamı hızlıca dağıtmak istiyorum" | `azd up` |
| "Sadece bir depolama hesabı oluşturmam gerekiyor" | `az storage account create` |
| "Tam bir AI uygulaması inşa ediyorum" | `azd init --template azure-search-openai-demo` |
| "Belirli bir Azure kaynağını hata ayıklamam gerekiyor" | `az resource show` |
| "Dakikalar içinde üretime hazır dağıtım istiyorum" | `azd up --environment production` |

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

Sıfırdan başlamayın! **Awesome AZD**, tek tıkla dağıtıma hazır topluluk şablonlarının koleksiyonudur:

| Kaynak | Açıklama |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Tek tıkla dağıtım özelliğiyle 200+ şablonu inceleyin |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Kendi şablonunuzu topluluğa gönderin |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Yıldızlayın ve kaynağı keşfedin |

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

## 🎯 3 Adımda Başlarken

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

**🎉 Hepsi bu kadar!** Uygulamanız artık Azure'da yayında.

### Temizlik (Unutmayın!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Bu Kurs Nasıl Kullanılır

Bu kurs **kademeli öğrenme** için tasarlanmıştır - rahat olduğunuz yerden başlayın ve aşama aşama ilerleyin:

| Deneyiminiz | Buradan Başlayın |
|-----------------|------------|
| **Azure'a yeni başlayanlar** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **Azure'ı biliyor, AZD'ye yeni** | [Bölüm 1: Temel](#-chapter-1-foundation--quick-start) |
| **AI uygulamaları dağıtmak istiyorsanız** | [Bölüm 2: AI-Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Pratik uygulama yapmak istiyorsanız** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 saatlik rehberli laboratuvar |
| **Üretim desenlerine ihtiyaç duyuyorsanız** | [Bölüm 8: Üretim & Kurumsal](#-chapter-8-production--enterprise-patterns) |

### Hızlı Kurulum

1. **Bu Depoyu Fork'layın**: [![GitHub forklar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonlayın**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Yardım Alın**: [Azure Discord Topluluğu](https://discord.com/invite/ByRwuEEgH4)

> **Yerel Olarak Klonlamayı mı Tercih Ediyorsunuz?**

> Bu depo, 50'den fazla dil çevirisini içerir ve bu da indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için seyrek çekme (sparse checkout) kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> This gives you everything you need to complete the course with a much faster download.


## Kurs Genel Bakışı

Azure Developer CLI (azd) öğrenimini, kademeli öğrenme için tasarlanmış bölümler aracılığıyla ustalaşın. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel vurgu.**

### Neden Bu Kurs Modern Geliştiriciler İçin Önemli

Microsoft Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AZD'yi AI iş yükleri için kullanmak istiyor** ancak şu zorluklarla karşılaşıyorlar:
- Karmaşık çok-hizmetli AI mimarileri
- Üretim AI dağıtım en iyi uygulamaları  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerinde Ustalaşın**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Altyapıyı Kod Olarak Uygulayın**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtımları Hata Ayıklayın**: Yaygın sorunları çözün ve problemleri giderin
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çok-Ajanlı Çözümler Oluşturun**: Karmaşık AI mimarilerini dağıtın

## 🗺️ Kurs Haritası: Bölümlere Hızlı Gezinme

Her bölümün öğrenme hedefleri, hızlı başlangıçlar ve egzersizler içeren ayrı bir README dosyası vardır:

| Bölüm | Konu | Dersler | Süre | Zorluk |
|---------|-------|---------|----------|------------|
| **[Bölüm 1: Temel](docs/chapter-01-foundation/README.md)** | Başlarken | [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) &#124; [Kurulum](docs/chapter-01-foundation/installation.md) &#124; [İlk Proje](docs/chapter-01-foundation/first-project.md) | 30-45 dk | ⭐
| **[Bölüm 2: Yapay Zeka Geliştirme](docs/chapter-02-ai-development/README.md)** | AI-Öncelikli Uygulamalar | [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Yapay Zeka Ajanları](docs/chapter-02-ai-development/agents.md) &#124; [Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atölye](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saat | ⭐⭐ |
| **[Bölüm 3: Yapılandırma](docs/chapter-03-configuration/README.md)** | Kimlik Doğrulama ve Güvenlik | [Yapılandırma](docs/chapter-03-configuration/configuration.md) &#124; [Kimlik Doğrulama ve Güvenlik](docs/chapter-03-configuration/authsecurity.md) | 45-60 dakika | ⭐⭐ |
| **[Bölüm 4: Altyapı](docs/chapter-04-infrastructure/README.md)** | IaC ve Dağıtım | [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saat | ⭐⭐⭐ |
| **[Bölüm 5: Çok Ajanlı](docs/chapter-05-multi-agent/README.md)** | Yapay Zeka Ajanı Çözümleri | [Perakende Senaryosu](examples/retail-scenario.md) &#124; [Koordinasyon Desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[Bölüm 6: Yayına Hazırlık](docs/chapter-06-pre-deployment/README.md)** | Planlama ve Doğrulama | [Ön Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uygulama Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 saat | ⭐⭐ |
| **[Bölüm 7: Sorun Giderme](docs/chapter-07-troubleshooting/README.md)** | Hata Ayıklama ve Düzeltme | [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md) &#124; [Yapay Zeka Sorunları](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saat | ⭐⭐ |
| **[Bölüm 8: Üretim](docs/chapter-08-production/README.md)** | Kurumsal Desenler | [Üretim Uygulamaları](docs/chapter-08-production/production-ai-practices.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[🎓 Atölye](workshop/README.md)** | Uygulamalı Laboratuvar | [Giriş](workshop/docs/instructions/0-Introduction.md) &#124; [Seçim](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Çözümleme](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kapanış](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saat | ⭐⭐ |

**Toplam Kurs Süresi:** ~10-14 saat | **Beceri İlerlemesi:** Başlangıç → Üretime Hazır

---

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel ve Hızlı Başlangıç
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Zorluk**: ⭐

#### Neler Öğreneceksiniz
- Azure Developer CLI temellerini anlama
- Platformunuza AZD kurma
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Başlangıç**: [Azure Developer CLI nedir?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Yükleme & Kurulum](docs/chapter-01-foundation/installation.md) - Platforma özel kılavuzlar
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Adım adım öğretici
- **📋 Hızlı Başvuru**: [Komut Kısa Başvuru](resources/cheat-sheet.md)

#### Uygulamalı Alıştırmalar
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Çıktısı**: AZD kullanarak basit bir web uygulamasını Azure'a başarıyla dağıtmak

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
**📈 Bölüm Sonrası Beceri Düzeyi:** Temel uygulamaları bağımsız olarak dağıtabilir
**📈 Bölüm Sonrası Beceri Düzeyi:** Temel uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: Yapay Zeka Öncelikli Geliştirme (Yapay Zeka Geliştiricileri için Önerilir)
**Önkoşullar**: Bölüm 1 tamamlanmış olmalı  
**Süre**: 1-2 saat  
**Zorluk**: ⭐⭐

#### Neler Öğreneceksiniz
- Microsoft Foundry'in AZD ile entegrasyonu
- Yapay zeka destekli uygulamaların dağıtımı
- Yapay zeka hizmet yapılandırmalarını anlama

#### Öğrenme Kaynakları
- **🎯 Başlangıç**: [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Ajanları**: [AI Ajanları Rehberi](docs/chapter-02-ai-development/agents.md) - AZD ile akıllı ajanlar dağıtın
- **📖 Desenler**: [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) - Yapay zeka modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [AI Atölye Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD'ye hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - MkDocs ile tarayıcı tabanlı öğrenme * DevContainer Ortamı
- **📋 Şablonlar**: [Microsoft Foundry Şablonları](#atölye-kaynakları)
- **📝 Örnekler**: [AZD Dağıtım Örnekleri](examples/README.md)

#### Uygulamalı Alıştırmalar
```bash
# İlk yapay zeka uygulamanızı dağıtın
azd init --template azure-search-openai-demo
azd up

# Ek yapay zeka şablonlarını deneyin
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Bölüm Çıktısı**: RAG yeteneklerine sahip yapay zeka destekli bir sohbet uygulamasını dağıtmak ve yapılandırmak

**✅ Başarı Doğrulama:**
```bash
# Bölüm 2'den sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test etmek
# Soru sormak ve kaynaklarla birlikte yapay zeka destekli yanıtlar almak
# Arama entegrasyonunun çalıştığını doğrulamak
azd monitor  # Application Insights'ın telemetri gösterdiğini kontrol etmek
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 Bölüm Sonrası Beceri Düzeyi:** Üretime hazır AI uygulamalarını dağıtıp yapılandırabilir  
**💰 Maliyet Farkındalığı:** Geliştirme maliyetlerini ayda $80-150, üretim maliyetlerini ayda $300-3500 olarak anlayın

#### 💰 AI Dağıtımları için Maliyet Hususları

**Geliştirme Ortamı (Tahmini $80-150/ay):**
- Microsoft Foundry Modelleri (Kullandıkça öde): $0-50/ay (token kullanımına bağlı)
- AI Search (Temel seviye): $75/ay
- Container Apps (Tüketim): $0-20/ay
- Depolama (Standart): $1-5/ay

**Üretim Ortamı (Tahmini $300-3,500+/ay):**
- Microsoft Foundry Modelleri (Tutarlı performans için PTU): $3,000+/ay OR Kullandıkça öde yüksek hacimle
- AI Search (Standart seviye): $250/ay
- Container Apps (Ayrılmış): $50-100/ay
- Application Insights: $5-50/ay
- Depolama (Premium): $10-50/ay

**💡 Maliyet Optimizasyon İpuçları:**
- Öğrenme için **Ücretsiz Katman** Microsoft Foundry Modellerini kullanın (Azure OpenAI dahil 50.000 token/ay)
- Aktif geliştirme yapılmadığında kaynakları serbest bırakmak için `azd down` çalıştırın
- Tüketim tabanlı faturalama ile başlayın, PTU'ya yalnızca üretim için yükseltin
- Dağıtımdan önce maliyetleri tahmin etmek için `azd provision --preview` kullanın
- Otomatik ölçeklendirmeyi etkinleştirin: sadece gerçek kullanım için ödeme yapın

**Maliyet İzleme:**
```bash
# Tahmini aylık maliyetleri kontrol edin
azd provision --preview

# Azure Portal'da gerçek maliyetleri izleyin
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bölüm 3: Yapılandırma & Kimlik Doğrulama
**Önkoşullar**: Bölüm 1 tamamlanmış olmalı  
**Süre**: 45-60 dakika  
**Zorluk**: ⭐⭐

#### Neler Öğreneceksiniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/chapter-03-configuration/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik doğrulama desenleri ve yönetilen kimlik](docs/chapter-03-configuration/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Uygulamalı Alıştırmalar
- Birden fazla ortam yapılandırın (dev, staging, prod)
- Yönetilen kimlik ile kimlik doğrulamayı ayarlayın
- Ortamlara özgü yapılandırmaları uygulayın

**💡 Bölüm Çıktısı**: Birden fazla ortamı uygun kimlik doğrulama ve güvenlikle yönetin

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı & Dağıtım
**Önkoşullar**: Bölümler 1-3 tamamlanmış olmalı  
**Süre**: 1-1.5 saat  
**Zorluk**: ⭐⭐⭐

#### Neler Öğreneceksiniz
- İleri dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- **🏗️ Sağlama**: [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Container Uygulama Örneği](../../examples/container-app) - Konteynerleştirilmiş dağıtımlar

#### Uygulamalı Alıştırmalar
- Özel Bicep şablonları oluşturun
- Çok hizmetli uygulamaları dağıtın
- Blue-green dağıtım stratejilerini uygulayın

**💡 Bölüm Çıktısı**: Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamaları dağıtın

---

### 🎯 Bölüm 5: Çok Ajanlı AI Çözümleri (İleri Seviye)
**Önkoşullar**: Bölümler 1-2 tamamlanmış olmalı  
**Süre**: 2-3 saat  
**Zorluk**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Çok ajanlı mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır AI dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çok Ajanlı Çözüm](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- **📖 Mimari**: [Çok ajanlı koordinasyon desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) - Desenler

#### Uygulamalı Alıştırmalar
```bash
# Tam perakende çoklu ajan çözümünü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Çıktısı**: Müşteri ve Envanter ajanlarına sahip üretime hazır bir çok ajanlı AI çözümünü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Yayına Hazırlık Doğrulama & Planlama
**Önkoşullar**: Bölüm 4 tamamlanmış olmalı  
**Süre**: 1 saat  
**Zorluk**: ⭐⭐

#### Neler Öğreneceksiniz
- Kapasite planlaması ve kaynak doğrulama
- SKU seçimi stratejileri
- Ön kontrol (preflight) süreçleri ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet etkin seçimler
- **✅ Doğrulama**: [Ön Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatik betikler

#### Uygulamalı Alıştırmalar
- Kapasite doğrulama betiklerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatik ön dağıtım kontrollerini uygulayın

**💡 Bölüm Çıktısı**: Dağıtımları yürütmeden önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme & Hata Ayıklama
**Önkoşullar**: Herhangi bir dağıtım bölümü tamamlanmış olmalı  
**Süre**: 1-1.5 saat  
**Zorluk**: ⭐⭐

#### Neler Öğreneceksiniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- AI'ye özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Rehberi](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 AI Sorunları**: [AI'ye Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI hizmet sorunları

#### Uygulamalı Alıştırmalar
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- AI hizmeti bağlantısını hata ayıklayın

**💡 Bölüm Çıktısı**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çözün

---

### 🏢 Bölüm 8: Üretim & Kurumsal Desenler
**Önkoşullar**: Bölümler 1-4 tamamlanmış olmalı  
**Süre**: 2-3 saat  
**Zorluk**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Kurumsal desenler
- **📝 Örnekler**: [Microservices Example](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - İzleme

#### Pratik Egzersizler
- Kurumsal güvenlik kalıplarını uygulayın
- Kapsamlı izlemeyi kurun
- Uygun yönetişim ile üretime dağıtın

**💡 Bölüm Çıktısı**: Kurumsal hazır uygulamaları tam üretim yetenekleriyle dağıtın

---

## 🎓 Atölye Genel Bakış: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Geliştirme Aşamasında**  
> Atölye materyalleri şu anda geliştiriliyor ve iyileştiriliyor. Temel modüller çalışır durumda, ancak bazı ileri seviye bölümler tamamlanmamış. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemesini takip et →](workshop/README.md)

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve rehberli alıştırmalar ile kapsamlı uygulamalı öğrenme**

Atölye materyallerimiz, bölüm tabanlı müfredatı tamamlayıcı, yapılandırılmış ve etkileşimli bir öğrenme deneyimi sunar. Atölye hem kendi hızınızda öğrenme hem de eğitmen liderliğindeki oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Tamamen MkDocs destekli atölye; arama, kopyalama ve tema özellikleriyle
- **GitHub Codespaces Entegrasyonu**: Tek tıklamayla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 8 modüllü rehberli alıştırmalar (toplam 3-4 saat)
- **Kademeli Metodoloji**: Giriş → Seçim → Doğrulama → Ayrıştırma → Yapılandırma → Özelleştirme → Kapatma → Kapanış
- **Etkileşimli DevContainer Ortamı**: Ön yapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Modül Yapısı
Atölye, keşiften dağıtıma kadar sizi götüren **8 modüllü kademeli bir metodoloji** izler:

| Modül | Konu | Yapacaklarınız | Süre |
|--------|-------|----------------|----------|
| **0. Giriş** | Atölye Genel Bakışı | Öğrenme hedeflerini, ön koşulları ve atölye yapısını anlayın | 15 dk |
| **1. Seçim** | Şablon Keşfi | AZD şablonlarını keşfedin ve senaryonuza uygun AI şablonunu seçin | 20 dk |
| **2. Doğrulama** | Dağıt & Doğrula | Şablonu `azd up` ile dağıtın ve altyapının çalıştığını doğrulayın | 30 dk |
| **3. Ayrıştırma** | Yapıyı Anlayın | GitHub Copilot kullanarak şablon mimarisini, Bicep dosyalarını ve kod organizasyonunu keşfedin | 30 dk |
| **4. Yapılandırma** | azure.yaml Derinlemesine İnceleme | `azure.yaml` yapılandırmasını, yaşam döngüsü kancalarını ve ortam değişkenlerini tam olarak öğrenin | 30 dk |
| **5. Özelleştirme** | Kendinize Uyarlayın | AI Search, izleme, değerlendirmeyi etkinleştirin ve senaryonuza göre özelleştirin | 45 dk |
| **6. Kapatma** | Temizleme | `azd down --purge` ile kaynakları güvenli bir şekilde temizleyin | 15 dk |
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
# Depoda "Code" → "Create codespace on main" öğesine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md dosyasındaki kurulum talimatlarını izleyin
```

#### 🎯 Atölye Öğrenme Çıktıları
Atölyeyi tamamlayan katılımcılar:
- **Üretim Yapay Zeka Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Çok Ajanlı Mimarilerde Uzmanlaşın**: Koordine AI ajan çözümlerini uygulayın
- **Güvenlik En İyi Uygulamalarını Uygulayın**: Kimlik doğrulama ve erişim denetimini yapılandırın
- **Ölçek için Optimize Edin**: Maliyet-etkin, performanslı dağıtımlar tasarlayın
- **Dağıtımları Sorun Giderin**: Yaygın sorunları bağımsız olarak çözün

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Rehber**: [Workshop Materials](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Modül Modül Talimatlar**:
  - [0. Giriş](workshop/docs/instructions/0-Introduction.md) - Atölye genel bakışı ve hedefleri
  - [1. Seçim](workshop/docs/instructions/1-Select-AI-Template.md) - AI şablonlarını bulun ve seçin
  - [2. Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) - Şablonları dağıtın ve doğrulayın
  - [3. Ayrıştırma](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Şablon mimarisini keşfedin
  - [4. Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` konusunda uzmanlaşın
  - [5. Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) - Senaryonuza göre özelleştirin
  - [6. Kapatma](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Kaynakları temizleyin
  - [7. Kapanış](workshop/docs/instructions/7-Wrap-up.md) - Gözden geçirme ve sonraki adımlar
- **🛠️ AI Atölye Laboratuvarı**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı alıştırmalar
- **💡 Hızlı Başlangıç**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ortam yapılandırması

Perfect for: Kurum içi eğitimler, üniversite dersleri, kendi hızında öğrenme ve geliştirici bootcamp'leri için idealdir.

---

## 📖 Derinlemesine İnceleme: AZD Yetenekleri

Temellerin ötesinde, AZD üretim dağıtımları için güçlü özellikler sunar:

- **Şablon Tabanlı Dağıtımlar** - Yaygın uygulama desenleri için önceden oluşturulmuş şablonları kullanın
- **Altyapı Kod Olarak** - Bicep veya Terraform kullanarak Azure kaynaklarını yönetin  
- **Entegre iş akışları** - Uygulamaları sorunsuz bir şekilde oluşturun, dağıtın ve izleyin
- **Geliştirici Dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiştir

### **AZD + Microsoft Foundry: AI Dağıtımları için İdeal**

**Neden AI Çözümleri için AZD?** AZD, AI geliştiricilerinin karşılaştığı başlıca zorlukları ele alır:

- **AI Hazır Şablonlar** - Microsoft Foundry Models, Cognitive Services ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI hizmetleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçekleme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğu ve uç noktalarına sorunsuz bağlantı

---

## 🎯 Şablonlar ve Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI desenlerini gösterir. Bazıları harici Azure Samples, bazıları ise yerel uygulamalardır.

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
**Öğrenme bölümlerine eşlenmiş üretime hazır uygulama şablonları**

| Template | Öğrenme Bölümü | Karmaşıklık | Ana Öğrenim |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Document Intelligence entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağrısı |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanları ile çok-ajan mimarisi |

### Örnek Türüne Göre Öğrenme

> **📌 Yerel ve Harici Örnekler:**  
> **Yerel Örnekler** (bu repo içinde) = Hemen kullanılmaya hazır  
> **Harici Örnekler** (Azure Samples) = Bağlantılı depolardan klonlayın

#### Yerel Örnekler (Kullanıma Hazır)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM şablonları ile eksiksiz üretime hazır uygulama
  - Çok ajanlı mimari (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonu ile tek tıkla dağıtım

#### Yerel Örnekler - Container Uygulamaları (Bölümler 2-5)
**Bu depodaki kapsamlı container dağıtım örnekleri:**
- [**Container App Examples**](examples/container-app/README.md) - Container tabanlı dağıtımlar için eksiksiz kılavuz
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Ölçeğe sıfıra inebilen temel REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - Üretime hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve İleri dağıtım desenleri
  - İzleme, güvenlik ve maliyet optimizasyonu rehberi

#### Harici Örnekler - Basit Uygulamalar (Bölümler 1-2)
**Başlamak için bu Azure Samples depolarını klonlayın:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım desenleri
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### Harici Örnekler - Veritabanı Entegrasyonu (Bölüm 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı desenleri
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### Harici Örnekler - İleri Düzey Desenler (Bölümler 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çok servisli mimariler
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işleme  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML desenleri

### Harici Şablon Koleksiyonları
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarının seçkisi
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dokümantasyonu
- [**Examples Directory**](examples/README.md) - Yerel öğrenme örnekleri ve detaylı açıklamalar

---

## 📚 Öğrenme Kaynakları & Referanslar

### Hızlı Referanslar
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Glossary**](resources/glossary.md) - Azure ve azd terimleri  
- [**FAQ**](resources/faq.md) - Bölümlere göre düzenlenmiş sıkça sorulan sorular
- [**Study Guide**](resources/study-guide.md) - Kapsamlı pratik egzersizler

### Uygulamalı Atölyeler
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD ile dağıtıma hazır hale getirin (2-3 saat)
- [**Interactive Workshop**](workshop/README.md) - MkDocs ve GitHub Codespaces ile 8 modüllü rehberli alıştırmalar
  - İzler: Giriş → Seçim → Doğrulama → Ayrıştırma → Yapılandırma → Özelleştirme → Kapatma → Kapanış

### Harici Öğrenme Kaynakları
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Fiyatlandırma Hesaplayıcısı](https://azure.microsoft.com/pricing/calculator/)
- [Azure Durumu](https://status.azure.com/)

### Düzenleyiciniz için Yapay Zeka Ajanı Becerileri
- [**skills.sh üzerindeki Microsoft Azure Becerileri**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, dağıtım, tanılama, maliyet optimizasyonu ve daha fazlası için 37 açık ajan becerisi. Bunları GitHub Copilot, Cursor, Claude Code veya desteklenen herhangi bir ajana yükleyin:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların sık karşılaştığı sorunlar ve hemen uygulanabilecek çözümler:**

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
# Mevcut abonelikleri listele
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

# Veya geliştirmede daha küçük SKU'lar kullanın
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
# Tekrar kimlik doğrula
az logout
az login

azd auth logout
azd auth login

# Kimlik doğrulamasını onayla
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
<summary><strong>❌ Şablon dağıtımı çok uzun sürüyor</strong></summary>

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- Yapay zeka uygulamaları: 15-25 dakika (OpenAI sağlanması yavaş)

```bash
# İlerlemeyi kontrol et
azd show

# 30 dakikadan fazla takılı kaldıysanız, Azure Portal'ı kontrol edin:
azd monitor
# Başarısız dağıtımları arayın
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden şu rolleri vermesini isteyin:
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

### 📚 Tam Sorun Giderme Kaynakları

- **Yaygın Sorunlar Rehberi:** [Ayrıntılı Çözümler](docs/chapter-07-troubleshooting/common-issues.md)
- **Yapay Zeka Özelinde Sorunlar:** [Yapay Zeka Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım Adım Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölüm boyunca öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: Öncelikli Yapay Zeka Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma ve Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod Olarak Altyapı ve Dağıtım ✅
- [ ] **Bölüm 5**: Çok Ajanlı Yapay Zeka Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtımdan Önce Doğrulama ve Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme ve Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim ve Kurumsal Desenler ✅

### Öğrenme Doğrulama
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Pratik Alıştırma**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Deneyiminizi Azure Discord'da paylaşın
4. **Sonraki Bölüm**: Bir sonraki karmaşıklık düzeyine geçin

### Kurs Tamamlama Avantajları
Tüm bölümleri tamamladığınızda sahip olacaklarınız:
- **Üretim Deneyimi**: Azure'a gerçek yapay zeka uygulamaları dağıtmış olma
- **Profesyonel Beceriler**: Kurumsal hazır dağıtım yetenekleri  
- **Topluluk Tanınırlığı**: Azure geliştirici topluluğunun aktif bir üyesi
- **Kariyer Gelişimi**: Talep gören AZD ve yapay zeka dağıtım uzmanlığı

---

## 🤝 Topluluk ve Destek

### Yardım ve Destek Alın
- **Teknik Sorunlar:** [Hata bildirin ve özellik isteyin](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları:** [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Yapay Zeka Özelinde Yardım:** Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokümantasyon:** [Resmi Azure Developer CLI dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord'dan Topluluk İçgörüleri

**Son Anket Sonuçları (#Azure Kanalı):**
- **%45** geliştirici AI iş yükleri için AZD kullanmak istiyor
- **En büyük zorluklar**: Çoklu servis dağıtımları, kimlik bilgileri yönetimi, üretime hazır olma  
- **En çok talep edilenler**: Yapay zekaya özel şablonlar, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılın ve:**
- AZD + AI deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken önizlemelerine erişin
- AI dağıtım en iyi uygulamalarına katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılara açığız! Ayrıntılar için lütfen [Katkıda Bulunma Rehberi](CONTRIBUTING.md) okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dilli desteğin sürdürülmesine yardım edin
- **Hata Bildirimleri**: Doğruluk ve açıklığı iyileştirin
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimize uyun

---

## 📄 Kurs Bilgileri

### Lisans
Bu proje MIT Lisansı ile lisanslanmıştır - ayrıntılar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz diğer kapsamlı öğrenme kursları da üretiyor:

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
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temel Öğrenme
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serisi
[![Yapay Zeka Eşli Programlama için Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET için Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Macerası](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Başlamaya Hazır mısınız?**

**Yeni Başlayanlar**: Başlamak için [Bölüm 1: Temel & Hızlı Başlangıç](#-chapter-1-foundation--quick-start)  
**Yapay Zeka Geliştiricileri**: Şuna atlayın [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Deneyimli Geliştiriciler**: ile başlayın [Bölüm 3: Yapılandırma & Kimlik Doğrulama](#️-chapter-3-configuration--authentication)

**Sonraki Adımlar**: [Bölüm 1'e Başlayın - AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->