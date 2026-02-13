# AZD Yeni Başlayanlar İçin: Yapılandırılmış Bir Öğrenme Yolculuğu

![AZD-yeni-başlayanlar](../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub izleyicileri](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızlar](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapça](../ar/README.md) | [Bengalce](../bn/README.md) | [Bulgarca](../bg/README.md) | [Burmanca (Myanmar)](../my/README.md) | [Çince (Basitleştirilmiş)](../zh-CN/README.md) | [Çince (Geleneksel, Hong Kong)](../zh-HK/README.md) | [Çince (Geleneksel, Makao)](../zh-MO/README.md) | [Çince (Geleneksel, Tayvan)](../zh-TW/README.md) | [Hırvatça](../hr/README.md) | [Çekçe](../cs/README.md) | [Danca](../da/README.md) | [Hollandaca](../nl/README.md) | [Estonca](../et/README.md) | [Fince](../fi/README.md) | [Fransızca](../fr/README.md) | [Almanca](../de/README.md) | [Yunanca](../el/README.md) | [İbranice](../he/README.md) | [Hintçe](../hi/README.md) | [Macarca](../hu/README.md) | [Endonezce](../id/README.md) | [İtalyanca](../it/README.md) | [Japonca](../ja/README.md) | [Kannadaca](../kn/README.md) | [Korece](../ko/README.md) | [Litvanca](../lt/README.md) | [Malayca](../ms/README.md) | [Malayalamca](../ml/README.md) | [Marathice](../mr/README.md) | [Nepali](../ne/README.md) | [Nijerya Pidgincesi](../pcm/README.md) | [Norveççe](../no/README.md) | [Farsça (Farsi)](../fa/README.md) | [Lehçe](../pl/README.md) | [Portekizce (Brezilya)](../pt-BR/README.md) | [Portekizce (Portekiz)](../pt-PT/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Romence](../ro/README.md) | [Rusça](../ru/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Slovakça](../sk/README.md) | [Slovence](../sl/README.md) | [İspanyolca](../es/README.md) | [Svahili](../sw/README.md) | [İsveççe](../sv/README.md) | [Tagalog (Filipin)](../tl/README.md) | [Tamilce](../ta/README.md) | [Telugu](../te/README.md) | [Tayca](../th/README.md) | [Türkçe](./README.md) | [Ukraynaca](../uk/README.md) | [Urduca](../ur/README.md) | [Vietnamca](../vi/README.md)

> **Yerel Olarak Kopyalamayı Tercih Ediyor musunuz?**
>
> Bu depo, indirme boyutunu önemli ölçüde artıran 50+ dil çevirisi içerir. Çeviriler olmadan klonlamak için sparse checkout kullanın:
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

## 🚀 Azure Developer CLI (azd) Nedir?

**Azure Developer CLI (azd)**, Azure'a uygulama dağıtmayı basitleştiren geliştirici dostu bir komut satırı aracıdır. Manuel olarak onlarca Azure kaynağı oluşturup bağlamak yerine, tek komutla tüm uygulamaları dağıtabilirsiniz.

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

**Hepsi bu!** Azure Portal'da tıklama yok, önce öğrenilecek karmaşık ARM şablonları yok, manuel yapılandırma yok - sadece Azure'da çalışan uygulamalar.

---

## ❓ Azure Developer CLI ve Azure CLI: Fark Nedir?

Bu, yeni başlayanların sorduğu en yaygın sorudur. İşte basit cevap:

| Özellik | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Amaç** | Bireysel Azure kaynaklarını yönetmek | Tam uygulamaları dağıtmak |
| **Zihniyet** | Altyapı odaklı | Uygulama odaklı |
| **Örnek** | `az webapp create --name myapp...` | `azd up` |
| **Öğrenme Eğrisi** | Azure servislerini bilmek gerekir | Sadece uygulamanızı bilmek yeterli |
| **En İyi İçin** | DevOps, Altyapı | Geliştiriciler, Prototipleme |

### Basit Benzetme

- **Azure CLI** ev inşa etmek için tüm araçlara sahip olmak gibidir - çekiçler, testereler, çiviler. Her şeyi inşa edebilirsiniz, ancak inşaatı bilmeniz gerekir.
- **Azure Developer CLI** bir yüklenici kiralamak gibidir - ne istediğinizi tarif edersiniz, gerisini onlar halleder.

### Hangi Durumda Hangisini Kullanmalı

| Senaryo | Şunu Kullanın |
|----------|----------|
| "Web uygulamamı hızlıca dağıtmak istiyorum" | `azd up` |
| "Sadece bir depolama hesabı oluşturmam gerekiyor" | `az storage account create` |
| "Tam bir AI uygulaması inşa ediyorum" | `azd init --template azure-search-openai-demo` |
| "Belirli bir Azure kaynağını hata ayıklamam gerekiyor" | `az resource show` |
| "Dakikalar içinde üretime hazır dağıtım istiyorum" | `azd up --environment production` |

### Birlikte Çalışırlar!

AZD, altta Azure CLI'yi kullanır. İkisini birlikte kullanabilirsiniz:
```bash
# Uygulamanızı AZD ile dağıtın
azd up

# Sonra Azure CLI ile belirli kaynakları ince ayar yapın
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD'de Şablonları Bulun

Sıfırdan başlamayın! **Awesome AZD**, dağıtıma hazır şablonlardan oluşan topluluk koleksiyonudur:

| Kaynak | Açıklama |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Tek tıkla dağıtım ile 200+ şablonu keşfedin |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Kendi şablonunuzu topluluğa gönderin |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Kaynağı keşfedin ve yıldız verin |

### Awesome AZD'den Popüler AI Şablonları

```bash
# Azure OpenAI + AI Arama ile RAG Sohbeti
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

**🎉 Hepsi bu!** Uygulamanız artık Azure'da canlı.

### Temizlik (Unutmayın!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Bu Kursu Nasıl Kullanmalısınız

Bu kurs **kademeli öğrenme** için tasarlanmıştır - rahat olduğunuz yerden başlayın ve ilerleyin:

| Deneyiminiz | Buradan Başlayın |
|-----------------|------------|
| **Azure'a tamamen yeni** | [Bölüm 1: Temel](../..) |
| **Azure biliyor, AZD'ye yeni** | [Bölüm 1: Temel](../..) |
| **AI uygulamaları dağıtmak istiyorum** | [Bölüm 2: AI-Öncelikli Geliştirme](../..) |
| **Ellerinizle uygulamalı pratik yapmak istiyorsunuz** | [🎓 Etkileşimli Atölye](workshop/README.md) - 3-4 saatlik rehberli laboratuvar |
| **Üretim desenlerine ihtiyacınız var** | [Bölüm 8: Üretim ve Kurumsal](../..) |

### Hızlı Kurulum

1. **Bu Depoyu Fork'layın**: [![GitHub forkları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonlayın**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Yardım Alın**: [Azure Discord Topluluğu](https://discord.com/invite/ByRwuEEgH4)

> **Yerel Olarak Kopyalamayı Tercih Ediyor musunuz?**
>
> Bu depo, indirme boyutunu önemli ölçüde artıran 50+ dil çevirisi içerir. Çeviriler olmadan klonlamak için sparse checkout kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı bir indirme ile sağlar.


## Kurs Genel Bakış

Kademeli öğrenme için tasarlanmış yapılandırılmış bölümler aracılığıyla Azure Developer CLI (azd)'yi öğrenin. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel odak.**

### Bu Kurs Modern Geliştiriciler İçin Neden Önemli

Microsoft Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyorlar:
- Karmaşık çok-servisli AI mimarileri
- Üretim AI dağıtımı en iyi uygulamaları  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarının giderilmesi

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak şunları yapabileceksiniz:
- **AZD Temellerini Öğrenin**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Altyapıyı Kod olarak Uygulayın**: Bicep şablonlarıyla Azure kaynaklarını yönetin
- **Dağıtımları Giderin**: Yaygın sorunları çözün ve hataları ayıklayın
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çok Ajanlı Çözümler Oluşturun**: Karmaşık AI mimarilerini dağıtın

## 🗺️ Kurs Haritası: Bölümlere Hızlı Geçiş

Her bölüm, öğrenme hedefleri, hızlı başlangıçlar ve alıştırmalar içeren bir README'e sahiptir:

| Bölüm | Konu | Dersler | Süre | Zorluk |
|---------|-------|---------|----------|------------|
| **[Bölüm 1: Temel](docs/chapter-01-foundation/README.md)** | Başlarken | [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) &#124; [Kurulum](docs/chapter-01-foundation/installation.md) &#124; [İlk Proje](docs/chapter-01-foundation/first-project.md) | 30-45 dk | ⭐ |
| **[Bölüm 2: AI Geliştirme](docs/chapter-02-ai-development/README.md)** | AI-Öncelikli Uygulamalar | [Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Ajanları](docs/chapter-02-ai-development/agents.md) &#124; [Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atölye](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saat | ⭐⭐ |
| **[Bölüm 3: Yapılandırma](docs/chapter-03-configuration/README.md)** | Kimlik Doğrulama ve Güvenlik | [Yapılandırma](docs/chapter-03-configuration/configuration.md) &#124; [Kimlik Doğrulama ve Güvenlik](docs/chapter-03-configuration/authsecurity.md) | 45-60 dk | ⭐⭐ |
| **[Bölüm 4: Altyapı](docs/chapter-04-infrastructure/README.md)** | IaC & Dağıtım | [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saat | ⭐⭐⭐ |
| **[Bölüm 5: Çok Ajan](docs/chapter-05-multi-agent/README.md)** | Yapay Zeka Ajan Çözümleri | [Perakende Senaryosu](examples/retail-scenario.md) &#124; [Koordinasyon Desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[Bölüm 6: Ön Dağıtım](docs/chapter-06-pre-deployment/README.md)** | Planlama & Doğrulama | [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uygulama Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 saat | ⭐⭐ |
| **[Bölüm 7: Sorun Giderme](docs/chapter-07-troubleshooting/README.md)** | Hata Ayıklama & Düzeltme | [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md) &#124; [Yapay Zeka Sorunları](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saat | ⭐⭐ |
| **[Bölüm 8: Üretim](docs/chapter-08-production/README.md)** | Kurumsal Desenler | [Üretim Uygulamaları](docs/chapter-08-production/production-ai-practices.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[🎓 Atölye](workshop/README.md)** | Uygulamalı Laboratuvar | [Giriş](workshop/docs/instructions/0-Introduction.md) &#124; [Seçim](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Çözümleme](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Altyapıyı Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kapanış](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saat | ⭐⭐ |

**Toplam Ders Süresi:** ~10-14 saat | **Yetenek İlerlemesi:** Başlangıç → Üretime Hazır

---

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel & Hızlı Başlangıç
**Gereksinimler**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Karmaşıklık**: ⭐

#### Neler Öğreneceksiniz
- Azure Developer CLI temellerini anlama
- Platformunuzda AZD kurma
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure Developer CLI nedir?](../..)
- **📖 Teori**: [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Kurulum & Yapılandırma](docs/chapter-01-foundation/installation.md) - Platforma özgü kılavuzlar
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Adım adım öğretici
- **📋 Hızlı Başvuru**: [Komut Hızlı Başvuru](resources/cheat-sheet.md)

#### Pratik Alıştırmalar
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Sonucu**: AZD kullanarak Azure'a basit bir web uygulaması başarıyla dağıtın

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

**📊 Süre Yatırımı:** 30-45 dakika  
**📈 Sonraki Yetenek Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir

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

**📊 Süre Yatırımı:** 30-45 dakika  
**📈 Sonraki Yetenek Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: Yapay Zeka-Öncelikli Geliştirme (Yapay Zeka Geliştiricileri için Önerilir)
**Gereksinimler**: Bölüm 1 tamamlanmış  
**Süre**: 1-2 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Microsoft Foundry entegrasyonu ile AZD kullanımı
- Yapay zeka destekli uygulamaların dağıtımı
- Yapay zeka hizmet yapılandırmalarını anlama

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Yapay Zeka Ajanları**: [Yapay Zeka Ajanları Rehberi](docs/chapter-02-ai-development/agents.md) - AZD ile akıllı ajanlar dağıtın
- **📖 Desenler**: [Yapay Zeka Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) - Yapay zeka modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [Yapay Zeka Atölyesi Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - Yapay zeka çözümlerinizi AZD için hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - MkDocs * DevContainer Ortamı ile tarayıcı tabanlı öğrenme
- **📋 Şablonlar**: [Microsoft Foundry Şablonları](../..)
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

**💡 Bölüm Sonucu**: RAG yeteneklerine sahip yapay zeka destekli bir sohbet uygulamasını dağıtıp yapılandırın

**✅ Başarı Doğrulaması:**
```bash
# Bölüm 2'den sonra şunları yapabiliyor olmalısınız:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test etmek
# Soru sormak ve kaynak gösteren yapay zeka destekli yanıtlar almak
# Arama entegrasyonunun çalıştığını doğrulamak
azd monitor  # Application Insights'ın telemetri gösterdiğini kontrol etmek
azd down --force --purge
```

**📊 Süre Yatırımı:** 1-2 saat  
**📈 Sonraki Yetenek Seviyesi:** Üretime hazır yapay zeka uygulamalarını dağıtıp yapılandırabilir  
**💰 Maliyet Bilinci:** Geliştirme maliyetlerini ayda $80-150, üretim maliyetlerini ayda $300-3500 arası olarak anlayın

#### 💰 Yapay Zeka Dağıtımları için Maliyet Hususları

**Geliştirme Ortamı (Tahmini $80-150/ay):**
- Azure OpenAI (Kullandıkça Öde): $0-50/ay (token kullanımına bağlı)
- AI Search (Temel katman): $75/ay
- Container Apps (Tüketim): $0-20/ay
- Depolama (Standart): $1-5/ay

**Üretim Ortamı (Tahmini $300-3,500+/ay):**
- Azure OpenAI (Tutarlı performans için PTU): $3,000+/ay VEYA yüksek hacim için Kullandıkça Öde
- AI Search (Standart katman): $250/ay
- Container Apps (Ayrılmış): $50-100/ay
- Application Insights: $5-50/ay
- Depolama (Premium): $10-50/ay

**💡 Maliyet Optimizasyon İpuçları:**
- Öğrenme için **Ücretsiz Katman** Azure OpenAI kullanın (ayda 50,000 token dahil)
- Aktif geliştirme yapılmadığında kaynakları serbest bırakmak için `azd down` çalıştırın
- Tüketim bazlı faturalamayla başlayın, PTU'ya yalnızca üretim için yükseltin
- Dağıtımdan önce maliyetleri tahmin etmek için `azd provision --preview` kullanın
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
**Gereksinimler**: Bölüm 1 tamamlanmış  
**Süre**: 45-60 dakika  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/chapter-03-configuration/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik doğrulama desenleri ve yönetilen kimlik](docs/chapter-03-configuration/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Alıştırmalar
- Birden fazla ortamı yapılandırın (dev, staging, prod)
- Yönetilen kimlik kimlik doğrulamasını kurun
- Ortama özgü yapılandırmaları uygulayın

**💡 Bölüm Sonucu**: Doğru kimlik doğrulama ve güvenlikle birden fazla ortamı yönetin

---

### 🏗️ Bölüm 4: Altyapı Kodu ve Dağıtım
**Gereksinimler**: Bölümler 1-3 tamamlanmış  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐⭐

#### Neler Öğreneceksiniz
- İleri düzey dağıtım desenleri
- Bicep ile Altyapı Kodu
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- **🏗️ Sağlama**: [Kaynakların Sağlanması](docs/chapter-04-infrastructure/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Container App Örneği](../../examples/container-app) - Container tabanlı dağıtımlar

#### Pratik Alıştırmalar
- Özel Bicep şablonları oluşturun
- Çok servisli uygulamalar dağıtın
- Blue-green dağıtım stratejileri uygulayın

**💡 Bölüm Sonucu**: Özel altyapı şablonları kullanarak karmaşık çok servisli uygulamaları dağıtın

---

### 🎯 Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri (Gelişmiş)
**Gereksinimler**: Bölümler 1-2 tamamlanmış  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Çok ajanlı mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır yapay zeka dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çok Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- **📖 Mimari**: [Çok ajanlı koordinasyon desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) - Desenler

#### Pratik Alıştırmalar
```bash
# Tam perakende çok ajanlı çözümü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Sonucu**: Müşteri ve Envanter ajanlarına sahip üretime hazır bir çok ajanlı yapay zeka çözümünü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Dağıtımdan Önce Doğrulama & Planlama
**Gereksinimler**: Bölüm 4 tamamlanmış  
**Süre**: 1 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Kapasite planlaması ve kaynak doğrulaması
- SKU seçimi stratejileri
- Ön kontroller ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet-etkin seçimler
- **✅ Doğrulama**: [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatik betikler

#### Pratik Alıştırmalar
- Kapasite doğrulama betiklerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatik ön dağıtım kontrollerini uygulayın

**💡 Bölüm Sonucu**: Dağıtımdan önce dağıtımları doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme & Hata Ayıklama
**Gereksinimler**: Herhangi bir dağıtım bölümü tamamlanmış olabilir  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- Yapay zekaya özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Rehberi](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 Yapay Zeka Sorunları**: [Yapay Zeka'ya Özel Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Yapay zeka hizmet sorunları

#### Pratik Alıştırmalar
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- Yapay zeka hizmet bağlantı sorunlarını hata ayıklayın

**💡 Bölüm Sonucu**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çözün

---

### 🏢 Bölüm 8: Üretim & Kurumsal Desenler
**Gereksinimler**: Bölümler 1-4 tamamlanmış  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Üretimde Yapay Zeka İçin En İyi Uygulamalar](docs/chapter-08-production/production-ai-practices.md) - Kurumsal desenler
- **📝 Örnekler**: [Mikroservis Örneği](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights entegrasyonu](docs/chapter-06-pre-deployment/application-insights.md) - İzleme

#### Pratik Alıştırmalar
- Kurumsal güvenlik desenlerini uygulayın
- Kapsamlı izlemeyi kurun
- Uygun yönetişim ile üretime dağıtım yapın

**💡 Bölüm Sonucu**: Tam üretim yetenekleriyle kurumsala hazır uygulamalar dağıtın

---

## 🎓 Atölye Genel Bakış: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Aktif Geliştirme**
> Çalıştay materyalleri şu anda geliştiriliyor ve iyileştiriliyor. Çekirdek modüller işlevsel, ancak bazı ileri bölümler tamamlanmamış durumda. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemeni takip et →](workshop/README.md)

### Etkileşimli Çalıştay Materyalleri
**Tarayıcı tabanlı araçlar ve yönlendirilmiş alıştırmalarla kapsamlı uygulamalı öğrenme**

Çalıştay materyallerimiz, yukarıdaki bölüm tabanlı müfredatı tamamlayan yapılandırılmış, etkileşimli bir öğrenme deneyimi sunar. Çalıştay hem kendi hızında öğrenme hem de eğitmen liderliğinde oturumlar için tasarlanmıştır.

#### 🛠️ Çalıştay Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Arama, kopyalama ve tema özelliklerine sahip tam MkDocs destekli çalıştay
- **GitHub Codespaces Entegrasyonu**: Tek tıklamayla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 8 modüllü yönlendirilmiş alıştırmalar (toplam 3-4 saat)
- **Gelişimsel Metodoloji**: Giriş → Seçim → Doğrulama → Parçalama → Yapılandırma → Özelleştirme → Kapatma → Özet
- **Etkileşimli DevContainer Ortamı**: Önyapılandırılmış araçlar ve bağımlılıklar

#### 📚 Çalıştay Modül Yapısı
Çalıştay, sizi keşiften dağıtıma hakimiyete taşıyan **8 modüllü gelişimsel bir metodolojiyi** izler:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Giriş** | Çalıştay Genel Bakış | Öğrenme hedeflerini, ön koşulları ve çalıştay yapısını anlayın | 15 min |
| **1. Seçim** | Şablon Keşfi | AZD şablonlarını keşfedin ve senaryonuz için doğru AI şablonunu seçin | 20 min |
| **2. Doğrulama** | Dağıt ve Doğrula | Şablonu `azd up` ile dağıtın ve altyapının çalıştığını doğrulayın | 30 min |
| **3. Parçalama** | Yapıyı Anlayın | Şablon mimarisini, Bicep dosyalarını ve kod düzenini keşfetmek için GitHub Copilot'u kullanın | 30 min |
| **4. Yapılandırma** | azure.yaml Derinlemesine İnceleme | `azure.yaml` yapılandırmasını, yaşam döngüsü kancalarını ve ortam değişkenlerini ustalıkla yönetin | 30 min |
| **5. Özelleştirme** | Kendinize Uyarlayın | AI Search, izleme, değerlendirme etkinleştirin ve senaryonuza göre özelleştirin | 45 min |
| **6. Kapatma** | Temizleme | Kaynakları `azd down --purge` ile güvenli şekilde serbest bırakın | 15 min |
| **7. Özet** | Sonraki Adımlar | Başarıları, temel kavramları gözden geçirin ve öğrenme yolculuğunuza devam edin | 15 min |

**Çalıştay Akışı:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Çalıştaya Başlarken
```bash
# Seçenek 1: GitHub Codespaces (Önerilen)
# Depoda "Code" → "Create codespace on main" seçeneğine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md içindeki kurulum talimatlarını izleyin
```

#### 🎯 Çalıştay Öğrenme Çıktıları
Çalıştayı tamamlayarak katılımcılar şunları kazanacak:
- **Üretim Düzeyinde AI Uygulamaları Dağıtın**: Microsoft Foundry hizmetleri ile AZD kullanın
- **Çok Ajanlı Mimarilerde Ustalaşın**: Koordine AI ajan çözümleri uygulayın
- **Güvenlik En İyi Uygulamalarını Uygulayın**: Kimlik doğrulama ve erişim denetimini yapılandırın
- **Ölçek İçin Optimize Edin**: Maliyet-etkin, yüksek performanslı dağıtımlar tasarlayın
- **Dağıtımları Sorun Giderin**: Yaygın sorunları bağımsız olarak çözün

#### 📖 Çalıştay Kaynakları
- **🎥 Etkileşimli Rehber**: [Çalıştay Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Modül Bazında Talimatlar**:
  - [0. Giriş](workshop/docs/instructions/0-Introduction.md) - Çalıştay genel bakışı ve hedefler
  - [1. Seçim](workshop/docs/instructions/1-Select-AI-Template.md) - AI şablonlarını bulma ve seçme
  - [2. Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) - Şablonları dağıtma ve doğrulama
  - [3. Parçalama](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Şablon mimarisini keşfetme
  - [4. Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml ustalığı
  - [5. Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) - Senaryonuza göre özelleştirme
  - [6. Kapatma](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Kaynakları temizleme
  - [7. Özet](workshop/docs/instructions/7-Wrap-up.md) - Gözden geçirme ve sonraki adımlar
- **🛠️ AI Çalıştay Laboratuvarı**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı alıştırmalar
- **💡 Hızlı Başlangıç**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ortam yapılandırması

**İçin ideal**: Kurumsal eğitimler, üniversite dersleri, kendi hızında öğrenme ve geliştirici bootcamp'leri.

---

## 📖 Derinlemesine: AZD Yetenekleri

Temellerin ötesinde, AZD üretim dağıtımları için güçlü özellikler sunar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama desenleri için önceden hazırlanmış şablonları kullanın
- **Kod Olarak Altyapı** - Azure kaynaklarını Bicep veya Terraform kullanarak yönetin  
- **Entegre iş akışları** - Uygulamaları sorunsuz şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiş

### **AZD + Microsoft Foundry: AI Dağıtımları İçin İdeal**

**Neden AI Çözümleri için AZD?** AZD, AI geliştiricilerinin karşılaştığı başlıca zorlukları ele alır:

- **AI-Hazır Şablonlar** - Azure OpenAI, Cognitive Services ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI hizmetleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet-etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğuna ve uç noktalarına sorunsuz bağlantı

---

## 🎯 Şablonlar ve Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI desenlerini gösterir. Bazıları harici Azure Samples, bazıları yerel uygulamalardır.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Harici |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Harici |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Harici |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Harici |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Harici |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Harici |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Yerel** |

### Öne Çıkan: Tam Öğrenme Senaryoları
**Üretime hazır uygulama şablonları öğrenme bölümlerine eşlenmiştir**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Belge Zekâsı entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağırma |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanlarıyla çok-ajanslı mimari |

### Örnek Türüne Göre Öğrenme

> **📌 Yerel vs Harici Örnekler:**  
> **Yerel Örnekler** (bu repo içinde) = Hemen kullanıma hazır  
> **Harici Örnekler** (Azure Samples) = Bağlantılı depolardan klonlayın

#### Yerel Örnekler (Kullanıma Hazır)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM şablonlarıyla tam üretim hazır uygulama
  - Çok-ajanslı mimari (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonu ile tek tıklamayla dağıtım

#### Yerel Örnekler - Konteyner Uygulamaları (Bölümler 2-5)
**Bu depoda kapsamlı konteyner dağıtım örnekleri:**
- [**Container App Examples**](examples/container-app/README.md) - Konteynerleştirilmiş dağıtımlar için tam rehber
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Scale-to-zero özellikli temel REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - Üretime hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve İleri dağıtım desenleri
  - İzleme, güvenlik ve maliyet optimizasyonu rehberliği

#### Harici Örnekler - Basit Uygulamalar (Bölümler 1-2)
**Başlamak için bu Azure Samples depolarını klonlayın:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım desenleri
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### Harici Örnekler - Veritabanı Entegrasyonu (Bölümler 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı desenleri
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### Harici Örnekler - İleri Desenler (Bölümler 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çok servisli mimariler
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işlemleri  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML desenleri

### Harici Şablon Koleksiyonları
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarından seçkiler
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dokümantasyonu
- [**Examples Directory**](examples/README.md) - Ayrıntılı açıklamalarla yerel öğrenme örnekleri

---

## 📚 Öğrenme Kaynakları ve Referanslar

### Hızlı Referanslar
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Glossary**](resources/glossary.md) - Azure ve azd terim sözlüğü  
- [**FAQ**](resources/faq.md) - Öğrenme bölümlerine göre sık sorulan sorular
- [**Study Guide**](resources/study-guide.md) - Kapsamlı uygulama egzersizleri

### Uygulamalı Çalıştaylar
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD ile dağıtılabilir hale getirin (2-3 saat)
- [**Interactive Workshop**](workshop/README.md) - MkDocs ve GitHub Codespaces ile 8 modüllü yönlendirilmiş alıştırmalar
  - İzlenen yol: Giriş → Seçim → Doğrulama → Parçalama → Yapılandırma → Özelleştirme → Kapatma → Özet

### Harici Öğrenme Kaynakları
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların karşılaştığı yaygın sorunlar ve hemen uygulanabilecek çözümler:**

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

# Yüklemeyi doğrulayın
azd version
```
</details>

<details>
<summary><strong>❌ "Abonelik bulunamadı" veya "Abonelik ayarlı değil"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" veya "Kota aşıldı"</strong></summary>

```bash
# Farklı bir Azure bölgesini deneyin
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
<summary><strong>❌ "azd up" yarıda başarısız oluyor</strong></summary>

```bash
# Seçenek 1: Temizle ve yeniden dene
azd down --force --purge
azd up

# Seçenek 2: Sadece altyapıyı düzelt
azd provision

# Seçenek 3: Detaylı durumu kontrol et
azd show

# Seçenek 4: Azure Monitor'daki günlükleri kontrol et
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Kimlik doğrulama başarısız" veya "Jeton süresi doldu"</strong></summary>

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
<summary><strong>❌ "Kaynak zaten mevcut" veya adlandırma çakışmaları</strong></summary>

```bash
# AZD benzersiz isimler üretir, ancak çakışma olursa:
azd down --force --purge

# Ardından yeni bir ortamla yeniden deneyin
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Şablon dağıtımı çok uzun sürüyor"</strong></summary>

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- AI uygulamaları: 15-25 dakika (OpenAI sağlama yavaş)

```bash
# İlerlemeyi kontrol edin
azd show

# 30 dakikadan fazla takılı kalırsanız, Azure Portal'ı kontrol edin:
azd monitor
# Başarısız dağıtımları kontrol edin
```
</details>

<details>
<summary><strong>❌ "İzin reddedildi" veya "Erişim yasak"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden aşağıdakileri vermesini isteyin:
# - Contributor (kaynaklar için)
# - User Access Administrator (rol atamaları için)
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
- **AI'ye Özgü Sorunlar:** [AI Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım Adım Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölümdeki öğrenme ilerlemenizi takip edin:

- [ ] **Chapter 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Chapter 2**: AI-İlk Geliştirme ✅  
- [ ] **Chapter 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Chapter 4**: Altyapı olarak Kod & Dağıtım ✅
- [ ] **Chapter 5**: Çok Ajanlı AI Çözümleri ✅
- [ ] **Chapter 6**: Dağıtımdan Önce Doğrulama & Planlama ✅
- [ ] **Chapter 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Chapter 8**: Üretim & Kurumsal Desenler ✅

### Öğrenme Doğrulama
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Uygulamalı Alıştırma**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Deneyiminizi Azure Discord'da paylaşın
4. **Sonraki Bölüm**: Bir sonraki zorluk seviyesine geçin

### Kurs Tamamlama Avantajları
Tüm bölümleri tamamladıktan sonra şunlara sahip olacaksınız:
- **Prodüksiyon Deneyimi**: Gerçek AI uygulamalarını Azure'a dağıtma deneyimi
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım yetenekleri  
- **Topluluk Tanınması**: Azure geliştirici topluluğunun aktif bir üyesi
- **Kariyer İlerlemesi**: Talep gören AZD ve AI dağıtımı uzmanlığı

---

## 🤝 Topluluk & Destek

### Yardım & Destek
- **Teknik Sorunlar**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI'ye Özgü Yardım**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokümantasyon**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord'dan Topluluk İçgörüleri

**#Azure Kanalından Son Anket Sonuçları:**
- **45%** of developers want to use AZD for AI workloads
- **En büyük zorluklar**: Çoklu servis dağıtımları, kimlik bilgisi yönetimi, üretime hazırlık  
- **En çok talep edilenler**: AI'ye özel şablonlar, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılarak:**
- AZD + AI deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken önizlemelerine erişin
- AI dağıtımı en iyi uygulamalarına katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılara açığız! Ayrıntılar için lütfen [Contributing Guide](CONTRIBUTING.md) bölümünü okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çokdilli desteği sürdürmeye yardımcı olun
- **Hata Raporları**: Doğruluk ve açıklığı artırın
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimizi izleyin

---

## 📄 Kurs Bilgileri

### Lisans
Bu proje MIT Lisansı altında lisanslanmıştır - detaylar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz başka kapsamlı öğrenme kursları da üretiyor:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
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
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Başlamaya Hazır mısınız?**

**Yeni Başlayanlar**: Şununla başlayın [Bölüm 1: Temel & Hızlı Başlangıç](../..)  
**Yapay Zeka Geliştiricileri**: Şuna atlayın [Bölüm 2: Yapay Zeka Odaklı Geliştirme](../..)  
**Deneyimli Geliştiriciler**: Şununla başlayın [Bölüm 3: Yapılandırma & Kimlik Doğrulama](../..)

**Sonraki Adımlar**: [Bölüm 1'e Başla - AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğa özen göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kaynak dilindeki metin yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu tutulamayız.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->