# AZD Yeni Başlayanlar İçin: Yapılandırılmış Bir Öğrenme Yolculuğu

![AZD-for-beginners](../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub izleyicileri](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızları](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapça](../ar/README.md) | [Bengalce](../bn/README.md) | [Bulgarca](../bg/README.md) | [Burmaca (Myanmar)](../my/README.md) | [Çince (Basitleştirilmiş)](../zh-CN/README.md) | [Çince (Geleneksel, Hong Kong)](../zh-HK/README.md) | [Çince (Geleneksel, Makao)](../zh-MO/README.md) | [Çince (Geleneksel, Tayvan)](../zh-TW/README.md) | [Hırvatça](../hr/README.md) | [Çekçe](../cs/README.md) | [Danca](../da/README.md) | [Flemenkçe](../nl/README.md) | [Estonca](../et/README.md) | [Fince](../fi/README.md) | [Fransızca](../fr/README.md) | [Almanca](../de/README.md) | [Yunanca](../el/README.md) | [İbranice](../he/README.md) | [Hintçe](../hi/README.md) | [Macarca](../hu/README.md) | [Endonezce](../id/README.md) | [İtalyanca](../it/README.md) | [Japonca](../ja/README.md) | [Kannada](../kn/README.md) | [Korece](../ko/README.md) | [Litvanca](../lt/README.md) | [Malayca](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalce](../ne/README.md) | [Nijerya Pidgin](../pcm/README.md) | [Norveççe](../no/README.md) | [Farsça (Farsi)](../fa/README.md) | [Lehçe](../pl/README.md) | [Portekizce (Brezilya)](../pt-BR/README.md) | [Portekizce (Portekiz)](../pt-PT/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Romence](../ro/README.md) | [Rusça](../ru/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Slovakça](../sk/README.md) | [Slovence](../sl/README.md) | [İspanyolca](../es/README.md) | [Svahili](../sw/README.md) | [İsveççe](../sv/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Tamilce](../ta/README.md) | [Telugu](../te/README.md) | [Tayca](../th/README.md) | [Türkçe](./README.md) | [Ukraynaca](../uk/README.md) | [Urduca](../ur/README.md) | [Vietnamca](../vi/README.md)

> **Yerel olarak Klonlamayı Tercih Ediyor musunuz?**

> Bu depo 50+ dil çevirisi içerir ve bu da indirilen dosya boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sparse checkout kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamanız için gereken her şeyi çok daha hızlı bir indirme ile sağlar.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) Nedir?

**Azure Developer CLI (azd)**, uygulamaları Azure'a dağıtmayı basitleştiren geliştirici dostu bir komut satırı aracıdır. Düzineleceki Azure kaynağını manuel olarak oluşturup bağlamak yerine, tek bir komutla tüm uygulamaları dağıtabilirsiniz.

### `azd up` Komutunun Sihri

```bash
# Bu tek komut her şeyi yapar:
# ✅ Tüm Azure kaynaklarını oluşturur
# ✅ Ağ ve güvenliği yapılandırır
# ✅ Uygulama kodunuzu oluşturur
# ✅ Azure'a dağıtır
# ✅ Çalışan bir URL sağlar
azd up
```

**Hepsi bu kadar!** Azure Portal'da tıklama yok, önce öğrenilecek karmaşık ARM şablonları yok, manuel yapılandırma yok - sadece Azure üzerinde çalışan uygulamalar.

---

## ❓ Azure Developer CLI ile Azure CLI Arasındaki Fark Nedir?

Yeni başlayanların en sık sorduğu soru budur. İşte basit cevap:

| Özellik | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Amaç** | Bireysel Azure kaynaklarını yönetmek | Tam uygulamaları dağıtmak |
| **Bakış Açısı** | Altyapı odaklı | Uygulama odaklı |
| **Örnek** | `az webapp create --name myapp...` | `azd up` |
| **Öğrenme Eğrisi** | Azure servislerini bilmek gerekir | Sadece uygulamanızı bilin |
| **En Uygun** | DevOps, Altyapı | Geliştiriciler, Prototipleme |

### Basit Bir Benzetme

- **Azure CLI**, bir ev inşa etmek için tüm aletlere sahip olmak gibidir - çekiçler, testereler, çiviler. Her şeyi inşa edebilirsiniz, ama inşaatı bilmeniz gerekir.
- **Azure Developer CLI**, bir müteahhit kiralamak gibidir - ne istediğinizi anlatırsınız ve inşayı onlar halleder.

### Hangi Durumda Hangisi Kullanılmalı

| Senaryo | Kullanılacak |
|----------|----------|
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

## 🌟 Awesome AZD'de Şablonlar Bulun

Sıfırdan başlamayın! **Awesome AZD**, tek tıklamayla dağıtılmaya hazır topluluk şablonlarının koleksiyonudur:

| Kaynak | Açıklama |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | 200+ şablonu tek tıkla inceleyin ve dağıtın |
| 🔗 [**Bir Şablon Gönderin**](https://github.com/Azure/awesome-azd/issues) | Kendi şablonunuzu topluluğa katkı olarak gönderin |
| 🔗 [**GitHub Deposu**](https://github.com/Azure/awesome-azd) | Yıldız verin ve kaynağı keşfedin |

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

## 🎯 3 Adımda Başlangıç

### Adım 1: AZD Kurun (2 dakika)

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

**🎉 Hepsi bu kadar!** Uygulamanız şimdi Azure üzerinde canlı.

### Temizlik (Unutmayın!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Bu Kurs Nasıl Kullanılır

Bu kurs, **kademeli öğrenme** için tasarlanmıştır - rahat olduğunuz yerden başlayın ve yukarı doğru ilerleyin:

| Deneyiminiz | Buradan Başlayın |
|-----------------|------------|
| **Azure'a tamamen yeni** | [Bölüm 1: Temel](../..) |
| **Azure biliyorum, AZD'ye yeni** | [Bölüm 1: Temel](../..) |
| **AI uygulamaları dağıtmak istiyorum** | [Bölüm 2: AI-Öncelikli Geliştirme](../..) |
| **Uygulamalı pratik yapmak istiyorum** | [🎓 Etkileşimli Atölye](workshop/README.md) - 3-4 saatlik yönlendirilmiş laboratuvar |
| **Üretim desenlerine ihtiyacım var** | [Bölüm 8: Üretim & Kurumsal](../..) |

### Hızlı Kurulum

1. **Bu Depoyu Forklayın**: [![GitHub forkları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonlayın**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Yardım Alın**: [Azure Discord Topluluğu](https://discord.com/invite/ByRwuEEgH4)

> **Yerel olarak Klonlamayı Tercih Ediyor musunuz?**

> Bu depo 50+ dil çevirisi içerir ve bu da indirilen dosya boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sparse checkout kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamanız için gereken her şeyi çok daha hızlı bir indirme ile sağlar.


## Kurs Genel Bakışı

Azure Developer CLI (azd) üzerinde yapılandırılmış bölümlerle kademeli öğrenmeyi sağlayın. **Microsoft Foundry entegrasyonuyla AI uygulama dağıtımına özel vurgu.**

### Modern Geliştiriciler İçin Bu Kurs Neden Önemli

Microsoft Foundry Discord topluluğu içgörülerine dayanarak, **geliştiricilerin %45'i AZD'yi AI iş yükleri için kullanmak istiyor** ancak şu zorluklarla karşılaşıyor:
- Karmaşık çok servisli AI mimarileri
- Üretim AI dağıtımına ilişkin en iyi uygulamalar  
- Azure AI servis entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ye özgü dağıtım sorunlarını giderme

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerinde Ustalaşın**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry servisleriyle kullanın
- **Altyapıyı Kod Olarak Uygulayın**: Bicep şablonlarıyla Azure kaynaklarını yönetin
- **Dağıtımları Hata Ayıklayın**: Yaygın sorunları çözün ve problemleri debug edin
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çok Ajanlı Çözümler Oluşturun**: Karmaşık AI mimarilerini dağıtın

## 🗺️ Kurs Haritası: Bölümlere Göre Hızlı Gezinme

Her bölümün öğrenme hedefleri, hızlı başlangıçları ve egzersizleri içeren bir README dosyası vardır:

| Bölüm | Konu | Dersler | Süre | Zorluk |
|---------|-------|---------|----------|------------|
| **[Bölüm 1: Temel](docs/chapter-01-foundation/README.md)** | Başlangıç | [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) &#124; [Kurulum](docs/chapter-01-foundation/installation.md) &#124; [İlk Proje](docs/chapter-01-foundation/first-project.md) | 30-45 dk | ⭐ |
| **[Bölüm 2: AI Geliştirme](docs/chapter-02-ai-development/README.md)** | AI-Öncelikli Uygulamalar | [Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Ajanları](docs/chapter-02-ai-development/agents.md) &#124; [Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atölye](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 saat | ⭐⭐ |
| **[Bölüm 3: Yapılandırma](docs/chapter-03-configuration/README.md)** | Kimlik & Güvenlik | [Yapılandırma](docs/chapter-03-configuration/configuration.md) &#124; [Kimlik & Güvenlik](docs/chapter-03-configuration/authsecurity.md) | 45-60 dk | ⭐⭐ |
| **[Bölüm 4: Altyapı](docs/chapter-04-infrastructure/README.md)** | IaC & Dağıtım | [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 saat | ⭐⭐⭐ |
| **[Bölüm 5: Çoklu Ajan](docs/chapter-05-multi-agent/README.md)** | Yapay Zeka Ajan Çözümleri | [Perakende Senaryosu](examples/retail-scenario.md) &#124; [Koordinasyon Desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[Bölüm 6: Dağıtımdan Önce](docs/chapter-06-pre-deployment/README.md)** | Planlama & Doğrulama | [Preflight Kontrolleri](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Uygulama İçgörüleri](docs/chapter-06-pre-deployment/application-insights.md) | 1 saat | ⭐⭐ |
| **[Bölüm 7: Sorun Giderme](docs/chapter-07-troubleshooting/README.md)** | Hata Ayıklama & Düzeltme | [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md) &#124; [Yapay Zeka Sorunları](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 saat | ⭐⭐ |
| **[Bölüm 8: Üretim](docs/chapter-08-production/README.md)** | Kurumsal Desenler | [Üretim Uygulamaları](docs/chapter-08-production/production-ai-practices.md) | 2-3 saat | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Uygulamalı Laboratuvar | [Giriş](workshop/docs/instructions/0-Introduction.md) &#124; [Seçim](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Parçalama](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Kapatma](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Kapanış](workshop/docs/instructions/7-Wrap-up.md) | 3-4 saat | ⭐⭐ |

**Toplam Kurs Süresi:** ~10-14 saat | **Beceri İlerlemesi:** Başlangıç → Üretime Hazır

---

## 📚 Öğrenme Bölümleri

*Deneyim düzeyinize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel & Hızlı Başlangıç
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Karmaşıklık**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temellerini anlama
- Platformunuza AZD kurma
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Başlangıç**: [Azure Developer CLI Nedir?](../..)
- **📖 Kuram**: [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Kurulum & Ayarlar](docs/chapter-01-foundation/installation.md) - Platforma özel rehberler
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Adım adım öğretici
- **📋 Hızlı Referans**: [Komut Hızlı Referansı](resources/cheat-sheet.md)

#### Pratik Egzersizler
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Çıktısı**: AZD kullanarak Azure'a basit bir web uygulaması başarıyla dağıtmak

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
**📈 Sonraki Beceri Seviyesi:** Basit uygulamaları bağımsız olarak dağıtabilir

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
**📈 Sonraki Beceri Seviyesi:** Basit uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: Yapay Zeka-Öncelikli Geliştirme (Yapay Zeka Geliştiricileri için Önerilir)
**Önkoşullar**: Bölüm 1 tamamlanmış olmalı  
**Süre**: 1-2 saat  
**Karmaşıklık**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Microsoft Foundry entegrasyonu
- Yapay zeka destekli uygulamaların dağıtımı
- Yapay zeka servis yapılandırmalarını anlama

#### Öğrenme Kaynakları
- **🎯 Başlangıç**: [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Yapay Zeka Ajanları**: [Yapay Zeka Ajanları Rehberi](docs/chapter-02-ai-development/agents.md) - AZD ile akıllı ajanlar dağıtın
- **📖 Desenler**: [Yapay Zeka Modeli Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md) - Modelleri dağıtma ve yönetme
- **🛠️ Atölye**: [Yapay Zeka Atölye Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - Yapay zeka çözümlerinizi AZD'ye hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - MkDocs * DevContainer Ortamı ile tarayıcı tabanlı öğrenme
- **📋 Şablonlar**: [Öne Çıkan Microsoft Foundry Şablonları](../..)
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

**💡 Bölüm Çıktısı**: RAG yeteneklerine sahip bir yapay zeka sohbet uygulamasını dağıtma ve yapılandırma

**✅ Başarı Doğrulama:**
```bash
# Bölüm 2'den sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test etmek
# Sorular sorun ve kaynaklar içeren yapay zeka destekli yanıtlar alın
# Arama entegrasyonunun çalıştığını doğrulayın
azd monitor  # Application Insights'ın telemetri gösterdiğini kontrol edin
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 Sonraki Beceri Seviyesi:** Üretime hazır yapay zeka uygulamalarını dağıtıp yapılandırabilir  
**💰 Maliyet Farkındalığı:** Geliştirme maliyetleri $80-150/ay, üretim maliyetleri $300-3500/ay arasında anlaşılmalıdır

#### 💰 Yapay Zeka Dağıtımları için Maliyet Dikkate Alınması

**Geliştirme Ortamı (Tahmini $80-150/ay):**
- Azure OpenAI (Kullan-öde): $0-50/ay (token kullanımına bağlı)
- AI Search (Temel seviye): $75/ay
- Container Apps (Tüketim): $0-20/ay
- Depolama (Standart): $1-5/ay

**Prodüksiyon Ortamı (Tahmini $300-3,500+/ay):**
- Azure OpenAI (tutarlı performans için PTU): $3,000+/ay VEYA yüksek hacim için Kullan-öde
- AI Search (Standart seviye): $250/ay
- Container Apps (Adanmış): $50-100/ay
- Application Insights: $5-50/ay
- Depolama (Premium): $10-50/ay

**💡 Maliyet Optimizasyonu İpuçları:**
- Öğrenme için **Azure OpenAI Ücretsiz Katmanını** kullanın (ayda 50.000 token dahil)
- Aktif geliştirme yapmıyorsanız kaynakları serbest bırakmak için `azd down` çalıştırın
- Tüketim tabanlı faturalama ile başlayın, yalnızca üretim için PTU'ya yükseltin
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
**Önkoşullar**: Bölüm 1 tamamlanmış olmalı  
**Süre**: 45-60 dakika  
**Karmaşıklık**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak isimlendirme ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/chapter-03-configuration/configuration.md) - Ortam ayarları
- **🔐 Güvenlik**: [Kimlik doğrulama desenleri ve yönetilen kimlik](docs/chapter-03-configuration/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Egzersizler
- Birden çok ortamı yapılandırın (dev, staging, prod)
- Yönetilen kimlik kimlik doğrulamayı ayarlayın
- Ortama özgü yapılandırmaları uygulayın

**💡 Bölüm Çıktısı**: Birden çok ortamı uygun kimlik doğrulama ve güvenlik ile yönetin

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı & Dağıtım
**Önkoşullar**: Bölümler 1-3 tamamlanmış olmalı  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri düzey dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- **🏗️ Sağlama**: [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Container App Örneği](../../examples/container-app) - Konteynerleştirilmiş dağıtımlar

#### Pratik Egzersizler
- Özel Bicep şablonları oluşturun
- Çok servisli uygulamalar dağıtın
- Blue-green dağıtım stratejilerini uygulayın

**💡 Bölüm Çıktısı**: Özel altyapı şablonları kullanarak karmaşık çok servisli uygulamaları dağıtın

---

### 🎯 Bölüm 5: Çoklu Ajan Yapay Zeka Çözümleri (İleri)
**Önkoşullar**: Bölümler 1-2 tamamlanmış olmalı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır yapay zeka dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- **📖 Mimari**: [Çoklu ajan koordinasyon desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) - Desenler

#### Pratik Egzersizler
```bash
# Tam perakende çok ajanlı çözümü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Çıktısı**: Müşteri ve Envanter ajanları ile üretime hazır çoklu ajan yapay zeka çözümünü dağıtma ve yönetme

---

### 🔍 Bölüm 6: Dağıtımdan Önce Doğrulama & Planlama
**Önkoşullar**: Bölüm 4 tamamlanmış olmalı  
**Süre**: 1 saat  
**Karmaşıklık**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlaması ve kaynak doğrulama
- SKU seçim stratejileri
- Pre-flight kontrolleri ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet etkin seçimler
- **✅ Doğrulama**: [Preflight Kontrolleri](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatikleştirilmiş betikler

#### Pratik Egzersizler
- Kapasite doğrulama betiklerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatikleştirilmiş dağıtımdan önceki kontrolleri uygulayın

**💡 Bölüm Çıktısı**: Dağıtımları yürütmeden önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme & Hata Ayıklama
**Önkoşullar**: Herhangi bir dağıtım bölümü tamamlanmış olmalı  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümler
- Yapay zekaya özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Rehberi](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 Yapay Zeka Sorunları**: [Yapay Zekaya Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Yapay zeka servis problemleri

#### Pratik Egzersizler
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- Yapay zeka servis bağlantılarını hata ayıklayın

**💡 Bölüm Çıktısı**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çözün

---

### 🏢 Bölüm 8: Üretim & Kurumsal Desenler
**Önkoşullar**: Bölümler 1-4 tamamlanmış olmalı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Üretim Yapay Zeka En İyi Uygulamaları](docs/chapter-08-production/production-ai-practices.md) - Kurumsal desenler
- **📝 Örnekler**: [Mikroservisler Örneği](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights entegrasyonu](docs/chapter-06-pre-deployment/application-insights.md) - İzleme

#### Pratik Egzersizler
- Kurumsal güvenlik desenlerini uygulayın
- Kapsamlı izlemeyi kurun
- Uygun yönetişim ile üretime dağıtın

**💡 Bölüm Çıktısı**: Tam üretim yeteneklerine sahip, kurumsal düzeyde uygulamalar dağıtın

---

## 🎓 Atölye Genel Bakışı: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Geliştirme Aşamasında**  
> Atölye materyalleri şu anda geliştiriliyor ve iyileştiriliyor. Temel modüller işlevsel, ancak bazı ileri bölümler eksik. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemesini takip et →](workshop/README.md)

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve yönlendirmeli egzersizlerle kapsamlı uygulamalı öğrenme**
Atölye materyallerimiz, yukarıdaki bölüm tabanlı müfredatı tamamlayan yapılandırılmış, etkileşimli bir öğrenme deneyimi sunar. Atölye, hem kendi hızında öğrenme hem de eğitmen liderliğindeki oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Arama, kopyalama ve tema özelliklerine sahip tam bir MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Tek tıklamayla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 8 modüllü yönlendirmeli egzersizler (toplam 3-4 saat)
- **Aşamalı Metodoloji**: Giriş → Seçim → Doğrulama → Parçalarına Ayırma → Yapılandırma → Özelleştirme → Kaldırma → Kapanış
- **Etkileşimli DevContainer Ortamı**: Önyapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Modül Yapısı
Atölye, sizi keşiften dağıtıma ustalığa taşıyan 8 modüllü bir aşamalı metodolojiyi takip eder:

| Modül | Konu | Yapacaklarınız | Süre |
|--------|-------|----------------|----------|
| **0. Giriş** | Atölye Genel Bakışı | Öğrenme hedeflerini, önkoşulları ve atölye yapısını anlayın | 15 dk |
| **1. Seçim** | Şablon Keşfi | AZD şablonlarını keşfedin ve senaryonuza uygun AI şablonunu seçin | 20 dk |
| **2. Doğrulama** | Dağıtım & Doğrulama | `azd up` ile şablonu dağıtın ve altyapının çalıştığını doğrulayın | 30 dk |
| **3. Parçalarına Ayırma** | Yapıyı Anlama | Şablon mimarisini, Bicep dosyalarını ve kod organizasyonunu keşfetmek için GitHub Copilot'u kullanın | 30 dk |
| **4. Yapılandırma** | azure.yaml Derin İnceleme | `azure.yaml` yapılandırmasında ustalaşın, yaşam döngüsü kancaları ve ortam değişkenleri | 30 dk |
| **5. Özelleştirme** | Kendi İhtiyacınıza Uyarlayın | AI Search, izleme, değerlendirme etkinleştirin ve senaryonuza göre özelleştirin | 45 dk |
| **6. Kaldırma** | Temizleme | `azd down --purge` ile kaynakları güvenli şekilde kaldırın | 15 dk |
| **7. Kapanış** | Sonraki Adımlar | Başarıları, temel kavramları gözden geçirin ve öğrenme yolculuğunuza devam edin | 15 dk |

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
# workshop/README.md içindeki kurulum talimatlarını izleyin
```

#### 🎯 Atölye Öğrenme Çıktıları
Atölyeyi tamamlayarak katılımcılar:
- **Üretim AI Uygulamaları Dağıtın**: Microsoft Foundry servisleri ile AZD kullanın
- **Çok Ajanlı Mimarisinde Uzmanlaşın**: Koordine AI ajan çözümleri uygulayın
- **Güvenlik En İyi Uygulamalarını Uygulayın**: Kimlik doğrulama ve erişim kontrolünü yapılandırın
- **Ölçek İçin Optimize Edin**: Maliyet-etkin, performanslı dağıtımlar tasarlayın
- **Dağıtımları Giderin**: Yaygın sorunları bağımsız olarak çözün

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Kılavuz**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Modül Bazlı Talimatlar**:
  - [0. Giriş](workshop/docs/instructions/0-Introduction.md) - Atölye genel bakışı ve hedefleri
  - [1. Seçim](workshop/docs/instructions/1-Select-AI-Template.md) - AI şablonlarını bulun ve seçin
  - [2. Doğrulama](workshop/docs/instructions/2-Validate-AI-Template.md) - Şablonları dağıtın ve doğrulayın
  - [3. Parçalarına Ayırma](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Şablon mimarisini keşfedin
  - [4. Yapılandırma](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` ustalaşın
  - [5. Özelleştirme](workshop/docs/instructions/5-Customize-AI-Template.md) - Senaryonuza göre özelleştirin
  - [6. Kaldırma](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Kaynakları temizleyin
  - [7. Kapanış](workshop/docs/instructions/7-Wrap-up.md) - Gözden geçirme ve sonraki adımlar
- **🛠️ AI Atölye Laboratuvarı**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı egzersizler
- **💡 Hızlı Başlangıç**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ortam yapılandırması

**Uygun için**: Kurumsal eğitim, üniversite dersleri, kendi hızında öğrenme ve geliştirici kampları.

---

## 📖 Derin İnceleme: AZD Yetenekleri

Temellerin ötesinde, AZD üretim dağıtımları için güçlü özellikler sunar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama kalıpları için önceden oluşturulmuş şablonları kullanın
- **Kod Olarak Altyapı** - Azure kaynaklarını Bicep veya Terraform kullanarak yönetin  
- **Entegre iş akışları** - Uygulamaları sorunsuz şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici üretkenliği ve deneyimi için optimize edilmiş

### **AZD + Microsoft Foundry: AI Dağıtımları İçin İdeal**

**Neden AI Çözümleri İçin AZD?** AZD, AI geliştiricilerinin karşılaştığı başlıca zorlukları ele alır:

- **AI Hazır Şablonlar** - Azure OpenAI, Cognitive Services ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI servisleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Kalıpları** - Ölçeklenebilir, maliyet-etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçekleme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğu ve uç noktalarına sorunsuz bağlantı

---

## 🎯 Şablonlar & Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI kalıplarını gösterir. Bazıları harici Azure Samples örnekleridir, diğerleri yerel uygulamalardır.

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

| Şablon | Öğrenme Bölümü | Karmaşıklık | Temel Öğrenim |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım kalıpları |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Belge Zekâsı entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağırma |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanlarıyla çok ajanlı mimari |

### Örnek Türüne Göre Öğrenme

> **📌 Yerel vs. Harici Örnekler:**  
> **Yerel Örnekler** (bu depoda) = Hemen kullanıma hazır  
> **Harici Örnekler** (Azure Samples) = Bağlı depolardan klonlayın

#### Yerel Örnekler (Kullanıma Hazır)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM şablonlarıyla üretime hazır tam uygulama
  - Çok ajanlı mimari (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonu ile tek tıklamayla dağıtım

#### Yerel Örnekler - Container Uygulamaları (Bölümler 2-5)
**Bu depodaki kapsayıcı dağıtım örnekleri:**
- [**Container App Examples**](examples/container-app/README.md) - Kapsayıcı tabanlı dağıtımlar için tam rehber
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Scale-to-zero özellikli temel REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - Üretime hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve İleri dağıtım kalıpları
  - İzleme, güvenlik ve maliyet optimizasyonu rehberliği

#### Harici Örnekler - Basit Uygulamalar (Bölümler 1-2)
**Başlamak için bu Azure Samples depolarını klonlayın:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım kalıpları
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### Harici Örnekler - Veritabanı Entegrasyonu (Bölümler 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı kalıpları
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### Harici Örnekler - İleri Kalıplar (Bölümler 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çok servisli mimariler
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işlemleri  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML kalıpları

### Harici Şablon Koleksiyonları
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarından seçilmiş koleksiyon
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dokümantasyonu
- [**Examples Directory**](examples/README.md) - Ayrıntılı açıklamalarla yerel öğrenme örnekleri

---

## 📚 Öğrenme Kaynakları & Referanslar

### Hızlı Başvurular
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Glossary**](resources/glossary.md) - Azure ve azd terminolojisi  
- [**FAQ**](resources/faq.md) - Bölümlere göre düzenlenmiş sıkça sorulan sorular
- [**Study Guide**](resources/study-guide.md) - Kapsamlı uygulama egzersizleri

### Uygulamalı Atölyeler
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI çözümlerinizi AZD ile dağıtılabilir hale getirin (2-3 saat)
- [**Interactive Workshop**](workshop/README.md) - MkDocs ve GitHub Codespaces ile 8 modüllü yönlendirmeli egzersizler
  - Takip eder: Giriş → Seçim → Doğrulama → Parçalarına Ayırma → Yapılandırma → Özelleştirme → Kaldırma → Kapanış

### Harici Öğrenme Kaynakları
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların karşılaştığı yaygın sorunlar ve hemen çözümleri:**

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
<summary><strong>❌ "Kimlik doğrulama başarısız" veya "Jeton süresi doldu"</strong></summary>

```bash
# Yeniden kimlik doğrulayın
az logout
az login

azd auth logout
azd auth login

# Kimlik doğrulamasını doğrulayın
az account show
```
</details>

<details>
<summary><strong>❌ "Kaynak zaten var" veya adlandırma çakışmaları</strong></summary>

```bash
# AZD benzersiz adlar üretir, ancak çakışma olması durumunda:
azd down --force --purge

# Ardından yeni bir ortamla yeniden deneyin
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
# İlerlemeyi kontrol edin
azd show

# Eğer 30 dakikadan fazla takılı kalırsanız, Azure Portal'ı kontrol edin:
azd monitor
# Başarısız dağıtımları kontrol edin
```
</details>

<details>
<summary><strong>❌ "İzin reddedildi" veya "Yasak"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En azından "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden vermesini isteyin:
# - Contributor (kaynaklar için)
# - User Access Administrator (rol atamaları için)
```
</details>

<details>
<summary><strong>❌ Dağıtılmış uygulama URL'si bulunamıyor</strong></summary>

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

- **Ortak Sorunlar Kılavuzu:** [Detaylı Çözümler](docs/chapter-07-troubleshooting/common-issues.md)
- **Yapay Zeka'ya Özel Sorunlar:** [Yapay Zeka Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Kılavuzu:** [Adım Adım Hata Ayıklama](docs/chapter-07-troubleshooting/debugging.md)
- **Yardım alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölümde öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI-Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod Olarak Altyapı & Dağıtım ✅
- [ ] **Bölüm 5**: Çok Ajanlı Yapay Zeka Çözümleri ✅
- [ ] **Bölüm 6**: Ön Dağıtım Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim & Kurumsal Desenler ✅

### Öğrenme Doğrulama
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Pratik Alıştırma**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Deneyiminizi Azure Discord'ta paylaşın
4. **Sonraki Bölüm**: Bir sonraki zorluk seviyesine geçin

### Kurs Tamamlama Avantajları
Tüm bölümleri tamamladığınızda şunlara sahip olacaksınız:
- **Üretim Deneyimi**: Gerçek Yapay Zeka uygulamalarını Azure'a dağıtma deneyimi
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım yetenekleri  
- **Topluluk Tanınması**: Azure geliştirici topluluğunun aktif üyesi
- **Kariyer İlerlemesi**: Talep gören AZD ve Yapay Zeka dağıtım uzmanlığı

---

## 🤝 Topluluk ve Destek

### Yardım ve Destek Alın
- **Teknik Sorunlar**: [Hataları raporlayın ve özellik isteğinde bulunun](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Yapay Zeka'ya Özel Yardım**: Katılın [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokümantasyon**: [Resmi Azure Developer CLI dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord'tan Topluluk İçgörüleri

**Son Anket Sonuçları #Azure Kanalı:**
- **45%** of developers want to use AZD for AI workloads
- **Top challenges**: Çok hizmetli dağıtımlar, kimlik bilgisi yönetimi, üretim hazırliği  
- **En çok talep edilenler**: Yapay zeka özel şablonları, sorun giderme kılavuzları, en iyi uygulamalar

**Topluluğumuza katılın ve:**
- AZD + Yapay Zeka deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken önizlemelerine erişin
- Yapay zeka dağıtımı en iyi uygulamalarına katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılara açığız! Ayrıntılar için lütfen [Katkıda Bulunma Kılavuzunu](CONTRIBUTING.md) okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dilli desteği korumaya yardımcı olun
- **Hata Raporları**: Doğruluk ve açıklığı iyileştirin
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimize uyun

---

## 📄 Kurs Bilgileri

### Lisans
Bu proje MIT Lisansı altında lisanslanmıştır - ayrıntılar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz diğer kapsamlı öğrenme kursları hazırlıyor:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j Yeni Başlayanlar İçin](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js Yeni Başlayanlar İçin](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain Yeni Başlayanlar İçin](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Ajanlar
[![AZD Yeni Başlayanlar İçin](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI Yeni Başlayanlar İçin](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP Yeni Başlayanlar İçin](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Ajanları Yeni Başlayanlar İçin](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Üretken AI Serisi
[![Üretken AI Yeni Başlayanlar İçin](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Üretken AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Üretken AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Üretken AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temel Öğrenme
[![Makine Öğrenimi Yeni Başlayanlar İçin](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Veri Bilimi Yeni Başlayanlar İçin](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Yapay Zeka Yeni Başlayanlar İçin](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Siber Güvenlik Yeni Başlayanlar İçin](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Geliştirme Yeni Başlayanlar İçin](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Nesnelerin İnterneti Yeni Başlayanlar İçin](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Geliştirme Yeni Başlayanlar İçin](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serisi
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Başlamaya Hazır mısınız?**

**Yeni Başlayanlar**: Başlamak için [Bölüm 1: Temel & Hızlı Başlangıç](../..)
**Yapay Zeka Geliştiricileri**: Atla [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../..)  
**Deneyimli Geliştiriciler**: [Bölüm 3: Yapılandırma ve Kimlik Doğrulama](../..)

**Sonraki Adımlar**: [Bölüm 1 - AZD Temelleri'ne Başlayın](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti Co-op Translator (https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin kendi dili kesin ve yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->