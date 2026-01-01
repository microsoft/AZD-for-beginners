<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "068c87cc2641a81ca353ad7064ff326a",
  "translation_date": "2026-01-01T15:22:56+00:00",
  "source_file": "README.md",
  "language_code": "tr"
}
-->
# AZD Yeni Başlayanlar İçin: Yapılandırılmış Bir Öğrenme Yolculuğu

![AZD-yeni-başlayanlar](../../translated_images/azdbeginners.5527441dd9f74068.tr.png) 

[![GitHub izleyicileri](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızları](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Bu Kursa Başlarken

AZD öğrenme yolculuğunuza başlamak için şu adımları izleyin:

1. **Depoyu Forklayın**: Click [![GitHub forkları](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Depoyu klonlayın**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Topluluğa Katılın**: Uzman desteği için [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4)
4. **Öğrenme Yolunuzu Seçin**: Deneyim seviyenize uygun bir bölümü aşağıdan seçin

### Çok Dilli Destek

#### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapça](../ar/README.md) | [Bengalce](../bn/README.md) | [Bulgarca](../bg/README.md) | [Burmaca (Myanmar)](../my/README.md) | [Çince (Basitleştirilmiş)](../zh/README.md) | [Çince (Geleneksel, Hong Kong)](../hk/README.md) | [Çince (Geleneksel, Makao)](../mo/README.md) | [Çince (Geleneksel, Tayvan)](../tw/README.md) | [Hırvatça](../hr/README.md) | [Çekçe](../cs/README.md) | [Danca](../da/README.md) | [Hollandaca](../nl/README.md) | [Estonca](../et/README.md) | [Fince](../fi/README.md) | [Fransızca](../fr/README.md) | [Almanca](../de/README.md) | [Yunanca](../el/README.md) | [İbranice](../he/README.md) | [Hintçe](../hi/README.md) | [Macarca](../hu/README.md) | [Endonezce](../id/README.md) | [İtalyanca](../it/README.md) | [Japonca](../ja/README.md) | [Kannada](../kn/README.md) | [Korece](../ko/README.md) | [Litvanca](../lt/README.md) | [Malayca](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalce](../ne/README.md) | [Nijerya Pidgin](../pcm/README.md) | [Norveççe](../no/README.md) | [Farsça (Farsi)](../fa/README.md) | [Lehçe](../pl/README.md) | [Portekizce (Brezilya)](../br/README.md) | [Portekizce (Portekiz)](../pt/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Romence](../ro/README.md) | [Rusça](../ru/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Slovakça](../sk/README.md) | [Slovence](../sl/README.md) | [İspanyolca](../es/README.md) | [Svahili](../sw/README.md) | [İsveççe](../sv/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Tamilce](../ta/README.md) | [Telugu](../te/README.md) | [Tayca](../th/README.md) | [Türkçe](./README.md) | [Ukraynaca](../uk/README.md) | [Urduca](../ur/README.md) | [Vietnamca](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurs Genel Bakış

Azure Developer CLI (azd) konusunda yapılandırılmış bölümler aracılığıyla ustalaşın. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel vurgu.**

### Bu Kurs Modern Geliştiriciler İçin Neden Önemli

Microsoft Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyor:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımına yönelik en iyi uygulamalar  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak şunları elde edeceksiniz:
- **AZD Temellerinde Ustalaşın**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Altyapıyı Kod Olarak Uygulayın**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtımları Sorun Giderin**: Yaygın sorunları çözün ve hata ayıklayın
- **Üretim için Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çok Ajanlı Çözümler Oluşturun**: Karmaşık AI mimarilerini dağıtın

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel & Hızlı Başlangıç
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Zorluk**: ⭐

#### Neler Öğreneceksiniz
- Azure Developer CLI temellerini anlama
- Platformunuza AZD kurma
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Başlangıç**: [Azure Developer CLI Nedir?](../..)
- **📖 Teori**: [AZD Temelleri](docs/getting-started/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Kurulum & Ayarlar](docs/getting-started/installation.md) - Platforma özel rehberler
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/getting-started/first-project.md) - Adım adım öğretici
- **📋 Hızlı Referans**: [Komut Hızlı Başvurusu](resources/cheat-sheet.md)

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
**📈 Elde Edilecek Yetenek Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir

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
**📈 Elde Edilecek Yetenek Seviyesi:** Temel uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: AI-Öncelikli Geliştirme (AI Geliştiricileri için Önerilir)
**Önkoşullar**: Bölüm 1 tamamlanmış  
**Süre**: 1-2 saat  
**Zorluk**: ⭐⭐

#### Neler Öğreneceksiniz
- Microsoft Foundry'nin AZD ile entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI hizmet yapılandırmalarını anlama

#### Öğrenme Kaynakları
- **🎯 Başlangıç**: [Microsoft Foundry Entegrasyonu](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Desenler**: [AI Model Dağıtımı](docs/microsoft-foundry/ai-model-deployment.md) - AI modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI çözümlerinizi AZD'ye hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - MkDocs ile tarayıcı tabanlı öğrenme * DevContainer Ortamı
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

**💡 Bölüm Sonucu**: RAG yeteneklerine sahip AI destekli bir sohbet uygulamasını dağıtın ve yapılandırın

**✅ Başarı Doğrulama:**
```bash
# Bölüm 2'den sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# Yapay zeka sohbet arayüzünü test etmek
# Soru sormak ve kaynaklarıyla birlikte yapay zeka destekli yanıtlar almak
# Arama entegrasyonunun çalıştığını doğrulamak
azd monitor  # Application Insights'ın telemetri gösterdiğini kontrol etmek
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 Elde Edilecek Yetenek Seviyesi:** Üretim hazır AI uygulamalarını dağıtabilir ve yapılandırabilir  
**💰 Maliyet Bilinci:** Geliştirme maliyetlerinin aylık $80-150 olduğunu, üretim maliyetlerinin aylık $300-3500 arasında olduğunu anlayın

#### 💰 AI Dağıtımları İçin Maliyet Hususları

**Geliştirme Ortamı (Tahmini $80-150/ay):**
- Azure OpenAI (Kullandıkça öde): $0-50/ay (token kullanımına bağlı)
- AI Search (Temel seviye): $75/ay
- Container Apps (Tüketim): $0-20/ay
- Depolama (Standart): $1-5/ay

**Üretim Ortamı (Tahmini $300-3,500+/ay):**
- Azure OpenAI (tutarlı performans için PTU): $3,000+/ay OR Kullandıkça öde yüksek hacim ile
- AI Search (Standart seviye): $250/ay
- Container Apps (Adanmış): $50-100/ay
- Application Insights: $5-50/ay
- Depolama (Premium): $10-50/ay

**💡 Maliyet Optimizasyonu İpuçları:**
- Öğrenme için **Ücretsiz Katmanı** Azure OpenAI kullanın (aylık 50.000 token dahil)
- Aktif geliştirme yapılmadığında kaynakları serbest bırakmak için `azd down` çalıştırın
- Tüketim tabanlı faturalamayla başlayın, yalnızca üretim için PTU'ya yükseltin
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
**Önkoşullar**: Bölüm 1 tamamlanmış  
**Süre**: 45-60 dakika  
**Zorluk**: ⭐⭐

#### Neler Öğreneceksiniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/getting-started/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik doğrulama desenleri ve yönetilen kimlik](docs/getting-started/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Alıştırmalar
- Birden fazla ortam yapılandırın (dev, staging, prod)
- Yönetilen kimlik kimlik doğrulamasını ayarlayın
- Ortama özgü yapılandırmaları uygulayın

**💡 Bölüm Sonucu**: Uygun kimlik doğrulama ve güvenlikle birden fazla ortamı yönetin

---

### 🏗️ Bölüm 4: Altyapı Kod Olarak & Dağıtım
**Önkoşullar**: Bölümler 1-3 tamamlanmış  
**Süre**: 1-1,5 saat  
**Zorluk**: ⭐⭐⭐

#### Neler Öğreneceksiniz
- Gelişmiş dağıtım desenleri
- Bicep ile Altyapı Kod Olarak
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/deployment/deployment-guide.md) - Tam iş akışları
- **🏗️ Sağlama**: [Kaynak Sağlama](docs/deployment/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Container App Örneği](../../examples/container-app) - Konteynerleştirilmiş dağıtımlar

#### Pratik Alıştırmalar
- Özel Bicep şablonları oluşturun
- Çok hizmetli uygulamalar dağıtın
- Mavi-yeşil dağıtım stratejileri uygulayın

**💡 Bölüm Sonucu**: Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamalar dağıtın

---

### 🎯 Bölüm 5: Çok Ajanlı AI Çözümleri (İleri)
**Önkoşullar**: Bölümler 1-2 tamamlanmış  
**Süre**: 2-3 saat  
**Zorluk**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Çok ajanlı mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır AI dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çok Ajanlı Çözüm](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıklamayla dağıtım
- **📖 Mimari**: [Çok ajanlı koordinasyon desenleri](/docs/pre-deployment/coordination-patterns.md) - Desenler

#### Uygulamalı Alıştırmalar
```bash
# Eksiksiz perakende çok ajanlı çözümü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Sonucu**: Müşteri ve Envanter ajanlarıyla üretime hazır çok ajanlı bir AI çözümünü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Dağıtımdan Önce Doğrulama ve Planlama
**Önkoşullar**: Bölüm 4 tamamlandı  
**Süre**: 1 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Kapasite planlaması ve kaynak doğrulama
- SKU seçimi stratejileri
- Dağıtımdan önceki kontroller ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlaması](docs/pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/pre-deployment/sku-selection.md) - Maliyet etkin seçenekler
- **✅ Doğrulama**: [Ön Dağıtım Kontrolleri](docs/pre-deployment/preflight-checks.md) - Otomatikleştirilmiş betikler

#### Uygulamalı Alıştırmalar
- Kapasite doğrulama betiklerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatik ön dağıtım kontrollerini uygulayın

**💡 Bölüm Sonucu**: Dağıtımı uygulamadan önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme ve Hata Ayıklama
**Önkoşullar**: Herhangi bir dağıtım bölümünün tamamlanmış olması  
**Süre**: 1-1.5 saat  
**Karmaşıklık**: ⭐⭐

#### Neler Öğreneceksiniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- AI'ye özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Common Issues](docs/troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Kılavuzu](docs/troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 AI Sorunları**: [AI'ye Özgü Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md) - Yapay zeka servis sorunları

#### Uygulamalı Alıştırmalar
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- AI servis bağlantı sorunlarını hata ayıklayın

**💡 Bölüm Sonucu**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün

---

### 🏢 Bölüm 8: Üretim ve Kurumsal Desenler
**Önkoşullar**: Bölümler 1-4 tamamlandı  
**Süre**: 2-3 saat  
**Karmaşıklık**: ⭐⭐⭐⭐

#### Neler Öğreneceksiniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Üretim AI En İyi Uygulamaları](docs/microsoft-foundry/production-ai-practices.md) - Kurumsal desenler
- **📝 Örnekler**: [Mikroservis Örneği](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: [Application Insights entegrasyonu](docs/pre-deployment/application-insights.md) - İzleme

#### Uygulamalı Alıştırmalar
- Kurumsal güvenlik desenlerini uygulayın
- Kapsamlı izlemeyi kurun
- Uygun yönetişim ile üretime dağıtım yapın

**💡 Bölüm Sonucu**: Tam üretim özelliklerine sahip, kurumsal hazır uygulamaları dağıtın

---

## 🎓 Atölye Genel Bakışı: Uygulamalı Öğrenme Deneyimi

> **⚠️ ATÖLYE DURUMU: Geliştirme Aşamasında**  
> Atölye materyalleri şu anda geliştiriliyor ve iyileştiriliyor. Temel modüller işlevsel, ancak bazı ileri bölümler eksik. Tüm içeriği tamamlamak için aktif olarak çalışıyoruz. [İlerlemesini takip et →](workshop/README.md)

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve rehberli alıştırmalarla kapsamlı uygulamalı öğrenme**

Atölye materyallerimiz, yukarıdaki bölüm tabanlı müfredata tamamlayıcı olacak şekilde yapılandırılmış, etkileşimli bir öğrenme deneyimi sağlar. Atölye, hem kendi hızında öğrenme hem de eğitmen liderliğindeki oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Tam bir MkDocs tabanlı atölye; arama, kopyalama ve tema özellikleri
- **GitHub Codespaces Entegrasyonu**: Tek tıklamayla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 7 adımlı rehberli alıştırma (toplam 3,5 saat)
- **Keşif → Dağıtım → Özelleştirme**: Aşamalı metodoloji
- **Etkileşimli DevContainer Ortamı**: Önceden yapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Yapısı
Atölye, **Keşif → Dağıtım → Özelleştirme** metodolojisini takip eder:

1. **Keşif Aşaması** (45 dk)
   - Microsoft Foundry şablonlarını ve servislerini keşfedin
   - Çok ajanlı mimari desenlerini anlayın
   - Dağıtım gereksinimlerini ve önkoşulları inceleyin

2. **Dağıtım Aşaması** (2 saat)
   - AZD ile AI uygulamalarının uygulamalı dağıtımı
   - Azure AI servislerini ve uç noktalarını yapılandırın
   - Güvenlik ve kimlik doğrulama desenlerini uygulayın

3. **Özelleştirme Aşaması** (45 dk)
   - Uygulamaları belirli kullanım durumları için değiştirin
   - Üretim dağıtımı için optimize edin
   - İzleme ve maliyet yönetimini uygulayın

#### 🚀 Atölye ile Başlarken
```bash
# Seçenek 1: GitHub Codespaces (Önerilen)
# Depoda "Code" → "Create codespace on main" öğesine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md dosyasındaki kurulum talimatlarını izleyin
```

#### 🎯 Atölye Öğrenme Çıktıları
Atölyeyi tamamlayarak katılımcılar şunları yapabilecek:
- **Üretim AI Uygulamalarını Dağıtın**: Microsoft Foundry servisleriyle AZD kullanın
- **Çok Ajanlı Mimarilerde Uzmanlaşın**: Koordine AI ajan çözümleri uygulayın
- **Güvenlik En İyi Uygulamalarını Uygulayın**: Kimlik doğrulama ve erişim kontrolünü yapılandırın
- **Ölçek için Optimize Edin**: Maliyet-etkin, performanslı dağıtımlar tasarlayın
- **Dağıtımları Sorun Giderin**: Yaygın sorunları bağımsız olarak çözün

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Kılavuz**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Adım Adım Talimatlar**: [Rehberli Alıştırmalar](../../workshop/docs/instructions) - Ayrıntılı adım adım rehberler
- **🛠️ AI Atölye Laboratuvarı**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI odaklı alıştırmalar
- **💡 Hızlı Başlangıç**: [Atölye Kurulum Kılavuzu](workshop/README.md#quick-start) - Ortam yapılandırması

**İçin Mükemmel**: Kurumsal eğitim, üniversite dersleri, kendi hızında öğrenme ve geliştirici bootcamp'ları.

---

## 📖 Azure Developer CLI Nedir?

Azure Developer CLI (azd), uygulamaların Azure'a inşa edilmesi ve dağıtılmasını hızlandıran geliştirici odaklı bir komut satırı aracıdır. Sağladıkları:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama desenleri için önceden oluşturulmuş şablonları kullanın
- **Altyapı Kod olarak** - Azure kaynaklarını Bicep veya Terraform kullanarak yönetin  
- **Entegre iş akışları** - Uygulamaları sorunsuz şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiştir

### **AZD + Microsoft Foundry: AI Dağıtımları için İdeal**

**Neden AZD AI Çözümleri için?** AZD, AI geliştiricilerinin karşılaştığı başlıca zorlukları ele alır:

- **AI Hazır Şablonlar** - Azure OpenAI, Cognitive Services ve ML iş yükleri için ön yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI servisleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet-etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçekleme stratejileri
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğu ve uç noktalarına sorunsuz bağlantı

---

## 🎯 Şablonlar ve Örnekler Kütüphanesi

### Öne Çıkan: Microsoft Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

> **Not:** Bu şablonlar çeşitli AI desenlerini gösterir. Bazıları Azure Samples'lara aittir, diğerleri yerel uygulamalardır.

| Şablon | Bölüm | Karmaşıklık | Servisler | Tür |
|----------|---------|------------|----------|------|
| [**AI Sohbetine Başlarken**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Harici |
| [**AI ajanlarıyla Başlarken**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Harici |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Harici |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Harici |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Harici |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Harici |
| [**Perakende Çok-Ajanlı Çözüm**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Yerel** |

### Öne Çıkan: Tam Öğrenme Senaryoları
**Öğrenme bölümlerine eşlenen üretime hazır uygulama şablonları**

| Şablon | Öğrenme Bölümü | Karmaşıklık | Temel Kazanım |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Belge Zekası entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağırma |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanlarıyla çok-ajanslı mimari |

### Örnek Türüne Göre Öğrenme

> **📌 Yerel vs Harici Örnekler:**  
> **Yerel Örnekler** (bu depoda) = Hemen kullanıma hazır  
> **Harici Örnekler** (Azure Samples) = Bağlantılı depolardan klonlayın

#### Yerel Örnekler (Kullanıma Hazır)
- [**Perakende Çok-Ajanlı Çözüm**](examples/retail-scenario.md) - ARM şablonları ile eksiksiz üretime hazır uygulama
  - Çok ajanlı mimari (Müşteri + Envanter ajanları)
  - Kapsamlı izleme ve değerlendirme
  - ARM şablonu ile tek tıklamayla dağıtım

#### Yerel Örnekler - Konteyner Uygulamaları (Bölümler 2-5)
**Bu depoda kapsamlı konteyner dağıtım örnekleri:**
- [**Konteyner Uygulama Örnekleri**](examples/container-app/README.md) - Konteynırlaştırılmış dağıtımlar için eksiksiz kılavuz
  - [Basit Flask API'si](../../examples/container-app/simple-flask-api) - Temel REST API, sıfıra ölçeklenme ile
  - [Mikroservis Örneği](../../examples/container-app/microservices) - Üretime hazır çok servisli dağıtım
  - Hızlı Başlangıç, Üretim ve İleri dağıtım desenleri
  - İzleme, güvenlik ve maliyet optimizasyonu rehberliği

#### Harici Örnekler - Basit Uygulamalar (Bölümler 1-2)
**Başlamak için bu Azure Samples depolarını klonlayın:**
- [Basit Web Uygulaması - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım desenleri
- [Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı
- [Konteyner Uygulama - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı

#### Harici Örnekler - Veritabanı Entegrasyonu (Bölüm 3-4)  
- [Veritabanı Uygulaması - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı desenleri
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı

#### Harici Örnekler - İleri Desenler (Bölümler 4-8)
- [Java Mikroservisleri](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çok hizmetli mimariler
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işleme  
- [Kurumsal ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML desenleri

### Harici Şablon Koleksiyonları
- [**Resmi AZD Şablon Galerisi**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarından seçkin koleksiyon
- [**Azure Developer CLI Şablonları**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dokümantasyonu
- [**Örnekler Dizini**](examples/README.md) - Ayrıntılı açıklamalarla yerel öğrenme örnekleri

---

## 📚 Öğrenme Kaynakları ve Referanslar

### Hızlı Referanslar
- [**Komut Hızlı Başvuru**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Sözlük**](resources/glossary.md) - Azure ve azd terminolojisi  
- [**SSS**](resources/faq.md) - Öğrenme bölümlerine göre düzenlenmiş sık sorulan sorular
- [**Çalışma Rehberi**](resources/study-guide.md) - Kapsamlı uygulama egzersizleri

### Uygulamalı Atölye Çalışmaları
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - AI çözümlerinizi AZD ile dağıtıma hazır hale getirin (2-3 saat)
- [**Etkileşimli Atölye Rehberi**](workshop/README.md) - MkDocs ve DevContainer Ortamı ile tarayıcı tabanlı atölye
- [**Yapılandırılmış Öğrenme Yolu**](../../workshop/docs/instructions) - 7 adımlı rehberli egzersizler (Keşif → Dağıtım → Özelleştirme)
- [**Yeni Başlayanlar için AZD Atölyesi**](workshop/README.md) - GitHub Codespaces entegrasyonlu tam uygulamalı atölye materyalleri

### Dış Öğrenme Kaynakları
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların sık karşılaştığı sorunlar ve hızlı çözümler:**

### ❌ "azd: command not found"

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

### ❌ "No subscription found" or "Subscription not set"

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

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Farklı bir Azure bölgesini deneyin
azd env set AZURE_LOCATION "westus2"
azd up

# Veya geliştirmede daha küçük SKU'ları kullanın
# infra/main.parameters.json dosyasını düzenleyin:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Seçenek 1: Temizle ve tekrar dene
azd down --force --purge
azd up

# Seçenek 2: Sadece altyapıyı düzelt
azd provision

# Seçenek 3: Ayrıntılı günlükleri kontrol et
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Yeniden kimlik doğrula
az logout
az login

azd auth logout
azd auth login

# Kimlik doğrulamasını doğrula
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD benzersiz isimler üretir, ancak bir çakışma olursa:
azd down --force --purge

# Sonra yeni bir ortamla yeniden deneyin
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Normal wait times:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- AI uygulamaları: 15-25 dakika (OpenAI tedariki yavaştır)

```bash
# İlerlemesini kontrol edin
azd show

# 30 dakikadan fazla takıldıysa, Azure Portal'ı kontrol edin:
azd monitor
# Başarısız dağıtımları kontrol edin
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden aşağıdakileri vermesini isteyin:
# - Contributor (kaynaklar için)
# - User Access Administrator (rol atamaları için)
```

### ❌ Can't find deployed application URL

```bash
# Tüm servis uç noktalarını göster
azd show

# Veya Azure Portal'ı aç
azd monitor

# Belirli bir servisi kontrol et
azd env get-values
# *_URL değişkenlerini ara
```

### 📚 Tam Sorun Giderme Kaynakları

- **Yaygın Sorunlar Rehberi:** [Detaylı Çözümler](docs/troubleshooting/common-issues.md)
- **AI'ye Özel Sorunlar:** [AI Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım Adım Hata Ayıklama](docs/troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Yeni başlayanların sık karşılaştığı sorunlar ve hızlı çözümler:**

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

# Seçenek 3: Ayrıntılı günlükleri kontrol et
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Yeniden kimlik doğrulama
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

# O zaman temiz bir ortamla yeniden deneyin
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- AI uygulamaları: 15-25 dakika (OpenAI tedariki yavaştır)

```bash
# İlerlemeyi kontrol et
azd show

# 30 dakikadan fazla takılıp kaldıysa, Azure Portal'ı kontrol et:
azd monitor
# Başarısız dağıtımları ara
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Contributor" rolüne ihtiyacınız var
# Azure yöneticinizden şunu vermesini isteyin:
# - Contributor (kaynaklar için)
# - User Access Administrator (rol atamaları için)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Tüm hizmet uç noktalarını göster
azd show

# Veya Azure Portal'ı açın
azd monitor

# Belirli hizmeti kontrol edin
azd env get-values
# *_URL değişkenlerini arayın
```
</details>

### 📚 Tam Sorun Giderme Kaynakları

- **Yaygın Sorunlar Rehberi:** [Detaylı Çözümler](docs/troubleshooting/common-issues.md)
- **AI'ye Özel Sorunlar:** [AI Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım Adım Hata Ayıklama](docs/troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölümdeki öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI-Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod Olarak Altyapı & Dağıtım ✅
- [ ] **Bölüm 5**: Çok Ajanlı AI Çözümleri ✅
- [ ] **Bölüm 6**: Ön Dağıtım Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Prodüksiyon & Kurumsal Desenler ✅

### Öğrenme Doğrulama
Her bölümü tamamladıktan sonra bilgilerinizi doğrulayın:
1. **Pratik Egzersiz**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Deneyiminizi Azure Discord'da paylaşın
4. **Sonraki Bölüm**: Bir sonraki zorluk seviyesine geçin

### Kurs Tamamlama Faydaları
Tüm bölümleri tamamladığınızda sahip olacaksınız:
- **Prodüksiyon Deneyimi**: Gerçek AI uygulamalarını Azure'a dağıttınız
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım yetkinlikleri  
- **Topluluk Tanınması**: Azure geliştirici topluluğunun aktif bir üyesi
- **Kariyer İlerlemesi**: Talep gören AZD ve AI dağıtım uzmanlığı

---

## 🤝 Topluluk ve Destek

### Yardım ve Destek Alın
- **Teknik Sorunlar**: [Hata bildirin ve özellik isteğinde bulunun](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI'ye Özel Yardım**: Katılın: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokümantasyon**: [Resmi Azure Developer CLI dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord'tan Topluluk İçgörüleri

**#Azure Kanalından Son Anket Sonuçları:**
- **%45** geliştirici AI iş yükleri için AZD kullanmak istiyor
- **En büyük zorluklar**: Çok servisli dağıtımlar, kimlik bilgisi yönetimi, prodüksiyon hazırlığı  
- **En çok talep edilenler**: AI'ye özel şablonlar, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılın ve:**
- AZD + AI deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken önizlemelerine erişin
- AI dağıtımına dair en iyi uygulamalara katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılara açığız! Ayrıntılar için lütfen [Contributing Guide](CONTRIBUTING.md) okuyun:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dilli desteği korumaya yardımcı olun
- **Hata Raporları**: Doğruluk ve açıklık iyileştirmeleri yapın
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimize uyun

---

## 📄 Kurs Bilgileri

### Lisans
Bu proje MIT Lisansı ile lisanslanmıştır - ayrıntılar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz diğer kapsamlı öğrenme kursları da üretiyor:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j Yeni Başlayanlar İçin](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js Yeni Başlayanlar İçin](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD Yeni Başlayanlar İçin](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI Yeni Başlayanlar İçin](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP Yeni Başlayanlar İçin](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Ajanları Yeni Başlayanlar İçin](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Üretken AI Serisi
[![Üretken Yapay Zeka Yeni Başlayanlar İçin](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temel Öğrenme
[![Makine Öğrenimi Yeni Başlayanlar İçin](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Veri Bilimi Yeni Başlayanlar İçin](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
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

**Yeni Başlayanlar**: Başlamak için [Bölüm 1: Temel & Hızlı Başlangıç](../..)  
**Yapay Zeka Geliştiricileri**: Atlamak için [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../..)  
**Deneyimli Geliştiriciler**: Başlamak için [Bölüm 3: Yapılandırma & Kimlik Doğrulama](../..)

**Sonraki Adımlar**: [Bölüm 1'e Başlayın - AZD Temelleri](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->