<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T15:44:39+00:00",
  "source_file": "README.md",
  "language_code": "tr"
}
-->
# AZD Yeni Başlayanlar İçin: Yapılandırılmış Bir Öğrenme Yolculuğu

![AZD-yeni-baslayanlar](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tr.png) 

[![GitHub izleyiciler](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub çatallar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub yıldızlar](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Bu Kursa Başlangıç

AZD öğrenme yolculuğunuza başlamak için şu adımları izleyin:

1. **Depoyu Çatallayın**: [![GitHub çatallar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) bağlantısına tıklayın.
2. **Depoyu Klonlayın**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Topluluğa Katılın**: Uzman desteği için [Azure Discord Toplulukları](https://discord.com/invite/ByRwuEEgH4)
4. **Öğrenme Yolunuzu Seçin**: Aşağıdaki bölümlerden deneyim seviyenize uygun olanı seçin.

### Çok Dilli Destek

#### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](./README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursun Genel Bakışı

Azure Developer CLI (azd) konusunda uzmanlaşın ve ilerlemeli öğrenme için tasarlanmış bölümlerle becerilerinizi geliştirin. **Azure AI Foundry entegrasyonu ile AI uygulama dağıtımına özel odaklanma.**

### Bu Kurs Neden Modern Geliştiriciler İçin Önemli?

Azure AI Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyor:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımında en iyi uygulamalar  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerini Öğrenin**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Azure AI Foundry hizmetleriyle kullanın
- **Kod Olarak Altyapı Uygulayın**: Bicep şablonlarıyla Azure kaynaklarını yönetin
- **Dağıtımları Sorun Giderin**: Yaygın sorunları çözün ve problemleri ayıklayın
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Geliştirin**: Karmaşık AI mimarilerini dağıtın

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve hedeflerinize göre öğrenme yolunuzu seçin*

### 🚀 Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç
**Ön Koşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Zorluk Seviyesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temel bilgilerini anlama
- AZD'nin platformunuza kurulumu
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure Developer CLI Nedir?](../..)
- **📖 Teori**: [AZD Temelleri](docs/getting-started/azd-basics.md) - Temel kavramlar ve terminoloji
- **⚙️ Kurulum**: [Kurulum ve Ayarlar](docs/getting-started/installation.md) - Platforma özel rehberler
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/getting-started/first-project.md) - Adım adım eğitim
- **📋 Hızlı Referans**: [Komut Hile Sayfası](resources/cheat-sheet.md)

#### Pratik Egzersizler
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Sonucu**: AZD kullanarak Azure'a basit bir web uygulaması başarıyla dağıtın

---

### 🤖 Bölüm 2: AI-Öncelikli Geliştirme (AI Geliştiricileri İçin Önerilir)
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Süre**: 1-2 saat  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Azure AI Foundry entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI hizmet yapılandırmalarını anlama

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure AI Foundry Entegrasyonu](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Modeller**: [AI Modeli Dağıtımı](docs/ai-foundry/ai-model-deployment.md) - AI modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [AI Atölye Laboratuvarı](docs/ai-foundry/ai-workshop-lab.md) - AI çözümlerinizi AZD'ye hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme MkDocs * DevContainer Ortamı ile
- **📋 Şablonlar**: [Azure AI Foundry Şablonları](../..)

#### Pratik Egzersizler
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Bölüm Sonucu**: RAG özellikli AI destekli bir sohbet uygulamasını dağıtın ve yapılandırın

---

### ⚙️ Bölüm 3: Yapılandırma ve Kimlik Doğrulama
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Süre**: 45-60 dakika  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyon

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/getting-started/configuration.md) - Ortam ayarları
- **🔐 Güvenlik**: Kimlik doğrulama modelleri ve yönetilen kimlik
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](../../examples/database-app) - Yapılandırma modelleri

#### Pratik Egzersizler
- Birden fazla ortam yapılandırın (geliştirme, test, üretim)
- Yönetilen kimlik kimlik doğrulamasını ayarlayın
- Ortama özel yapılandırmalar uygulayın

**💡 Bölüm Sonucu**: Doğru kimlik doğrulama ve güvenlikle birden fazla ortam yönetin

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı ve Dağıtım
**Ön Koşullar**: Bölüm 1-3 tamamlandı  
**Süre**: 1-1.5 saat  
**Zorluk Seviyesi**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri düzey dağıtım modelleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/deployment/deployment-guide.md) - Tam iş akışları
- **🏗️ Sağlama**: [Kaynak Sağlama](docs/deployment/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Konteyner Uygulama Örneği](../../examples/container-app) - Konteynerli dağıtımlar

#### Pratik Egzersizler
- Özel Bicep şablonları oluşturun
- Çok hizmetli uygulamalar dağıtın
- Mavi-yeşil dağıtım stratejileri uygulayın

**💡 Bölüm Sonucu**: Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamalar dağıtın

---

### 🎯 Bölüm 5: Çoklu Ajan AI Çözümleri (İleri Düzey)
**Ön Koşullar**: Bölüm 1-2 tamamlandı  
**Süre**: 2-3 saat  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari modelleri
- Ajan düzenleme ve koordinasyon
- Üretime hazır AI dağıtımları

#### Öğrenme Kaynakları
- **🤖 Öne Çıkan Proje**: [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- **📖 Mimari**: Çoklu ajan koordinasyon modelleri

#### Pratik Egzersizler
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Bölüm Sonucu**: Müşteri ve Envanter ajanlarıyla üretime hazır bir çoklu ajan AI çözümü dağıtın ve yönetin

---

### 🔍 Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama
**Ön Koşullar**: Bölüm 4 tamamlandı  
**Süre**: 1 saat  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlama ve kaynak doğrulama
- SKU seçim stratejileri
- Ön kontrol ve otomasyon

#### Öğrenme Kaynakları
- **📊 Planlama**: [Kapasite Planlama](docs/pre-deployment/capacity-planning.md) - Kaynak doğrulama
- **💰 Seçim**: [SKU Seçimi](docs/pre-deployment/sku-selection.md) - Maliyet etkin seçimler
- **✅ Doğrulama**: [Ön Kontroller](docs/pre-deployment/preflight-checks.md) - Otomatik scriptler

#### Pratik Egzersizler
- Kapasite doğrulama scriptlerini çalıştırın
- Maliyet için SKU seçimlerini optimize edin
- Otomatik dağıtım öncesi kontroller uygulayın

**💡 Bölüm Sonucu**: Dağıtımları gerçekleştirmeden önce doğrulayın ve optimize edin

---

### 🚨 Bölüm 7: Sorun Giderme ve Hata Ayıklama
**Ön Koşullar**: Herhangi bir dağıtım bölümü tamamlandı  
**Süre**: 1-1.5 saat  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- AI'ya özgü sorun giderme

#### Öğrenme Kaynakları
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/troubleshooting/common-issues.md) - SSS ve çözümler
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Rehberi](docs/troubleshooting/debugging.md) - Adım adım stratejiler
- **🤖 AI Sorunları**: [AI'ya Özgü Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md) - AI hizmet problemleri

#### Pratik Egzersizler
- Dağıtım hatalarını teşhis edin
- Kimlik doğrulama sorunlarını çözün
- AI hizmet bağlantı sorunlarını ayıklayın

**💡 Bölüm Sonucu**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün

---

### 🏢 Bölüm 8: Üretim ve Kurumsal Modeller
**Ön Koşullar**: Bölüm 1-4 tamamlandı  
**Süre**: 2-3 saat  
**Zorluk**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim ortamına dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu

#### Öğrenme Kaynakları
- **🏭 Üretim**: [Üretim AI En İyi Uygulamaları](docs/ai-foundry/production-ai-practices.md) - Kurumsal desenler
- **📝 Örnekler**: [Mikroservisler Örneği](../../examples/microservices) - Karmaşık mimariler
- **📊 İzleme**: Application Insights entegrasyonu

#### Pratik Egzersizler
- Kurumsal güvenlik desenlerini uygulayın
- Kapsamlı izleme kurulumunu gerçekleştirin
- Uygun yönetişimle üretim ortamına dağıtım yapın

**💡 Bölüm Sonucu**: Tam üretim yeteneklerine sahip kurumsal uygulamalar dağıtın

---

## 🎓 Atölye Genel Bakış: Uygulamalı Öğrenme Deneyimi

### Etkileşimli Atölye Materyalleri
**Tarayıcı tabanlı araçlar ve rehberli egzersizlerle kapsamlı uygulamalı öğrenme**

Atölye materyallerimiz, yukarıdaki bölüme dayalı müfredatı tamamlayan yapılandırılmış ve etkileşimli bir öğrenme deneyimi sunar. Atölye, hem kendi hızınızda öğrenme hem de eğitmen eşliğinde oturumlar için tasarlanmıştır.

#### 🛠️ Atölye Özellikleri
- **Tarayıcı Tabanlı Arayüz**: Arama, kopyalama ve tema özellikleriyle MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Tek tıkla geliştirme ortamı kurulumu
- **Yapılandırılmış Öğrenme Yolu**: 7 adımlı rehberli egzersizler (toplam 3,5 saat)
- **Keşif → Dağıtım → Özelleştirme**: İlerlemeli metodoloji
- **Etkileşimli DevContainer Ortamı**: Önceden yapılandırılmış araçlar ve bağımlılıklar

#### 📚 Atölye Yapısı
Atölye, **Keşif → Dağıtım → Özelleştirme** metodolojisini takip eder:

1. **Keşif Aşaması** (45 dakika)
   - Azure AI Foundry şablonlarını ve hizmetlerini keşfedin
   - Çoklu ajan mimarisi desenlerini anlayın
   - Dağıtım gereksinimlerini ve ön koşulları gözden geçirin

2. **Dağıtım Aşaması** (2 saat)
   - AZD ile AI uygulamalarının uygulamalı dağıtımı
   - Azure AI hizmetlerini ve uç noktalarını yapılandırın
   - Güvenlik ve kimlik doğrulama desenlerini uygulayın

3. **Özelleştirme Aşaması** (45 dakika)
   - Uygulamaları belirli kullanım senaryolarına göre değiştirin
   - Üretim ortamı dağıtımı için optimize edin
   - İzleme ve maliyet yönetimini uygulayın

#### 🚀 Atölyeye Başlama
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Atölye Öğrenme Çıktıları
Atölyeyi tamamlayan katılımcılar:
- **Üretim AI Uygulamaları Dağıtımı**: AZD ile Azure AI Foundry hizmetlerini kullanarak
- **Çoklu Ajan Mimarilerini Öğrenme**: Koordineli AI ajan çözümleri uygulama
- **Güvenlik En İyi Uygulamaları**: Kimlik doğrulama ve erişim kontrolü yapılandırma
- **Ölçek için Optimizasyon**: Maliyet etkin, yüksek performanslı dağıtımlar tasarlama
- **Dağıtım Sorunlarını Çözme**: Yaygın sorunları bağımsız olarak çözme

#### 📖 Atölye Kaynakları
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı
- **📋 Adım Adım Talimatlar**: [Rehberli Egzersizler](../../workshop/docs/instructions) - Ayrıntılı açıklamalar
- **🛠️ AI Atölye Laboratuvarı**: [AI Atölye Laboratuvarı](docs/ai-foundry/ai-workshop-lab.md) - AI odaklı egzersizler
- **💡 Hızlı Başlangıç**: [Atölye Kurulum Rehberi](workshop/README.md#quick-start) - Ortam yapılandırması

**Uygunluk**: Kurumsal eğitim, üniversite dersleri, kendi hızında öğrenme ve geliştirici bootcamp'leri için mükemmel.

---

## 📖 Azure Developer CLI Nedir?

Azure Developer CLI (azd), uygulamaları Azure'a oluşturma ve dağıtma sürecini hızlandıran geliştirici odaklı bir komut satırı arayüzüdür. Şunları sağlar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama desenleri için önceden oluşturulmuş şablonlar kullanın
- **Kod olarak Altyapı** - Azure kaynaklarını Bicep veya Terraform ile yönetin  
- **Entegre iş akışları** - Uygulamaları sorunsuz bir şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiştir

### **AZD + Azure AI Foundry: AI Dağıtımları için Mükemmel**

**AI Çözümleri için Neden AZD?** AZD, AI geliştiricilerinin karşılaştığı en büyük zorlukları ele alır:

- **AI Hazır Şablonlar** - Azure OpenAI, Cognitive Services ve ML iş yükleri için önceden yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI hizmetleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden uygun izleme ile üretim dağıtımına kadar
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri
- **Azure AI Foundry Entegrasyonu** - AI Foundry model kataloğu ve uç noktalarına sorunsuz bağlantı

---

## 🎯 Şablonlar ve Örnekler Kütüphanesi

### Öne Çıkan: Azure AI Foundry Şablonları
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

| Şablon | Bölüm | Zorluk | Hizmetler |
|----------|---------|------------|----------|
| [**AI Sohbet ile Başlayın**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI Ajanları ile Başlayın**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Çoklu Ajan İş Akışı Otomasyonu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Verilerinizden Belgeler Oluşturun**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Müşteri Toplantılarını Ajanlarla İyileştirin**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Kodunuzu Ajanlarla Modernize Edin**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Konuşma Ajanınızı Oluşturun**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Konuşma Verilerinden İçgörüler Elde Edin**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Çok Modlu İçerik İşleme**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Öne Çıkan: Tam Öğrenme Senaryoları
**Üretime hazır uygulama şablonları öğrenme bölümleriyle eşleştirilmiştir**

| Şablon | Öğrenme Bölümü | Zorluk | Temel Öğrenme |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | RAG uygulaması ve Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Belge Zekası entegrasyonu |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağrısı |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |
| [**perakende-çoklu-ajan-çözümü**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanları ile çoklu ajan mimarisi |

### Örnek Türüne Göre Öğrenme

#### Basit Uygulamalar (Bölüm 1-2)
- [Basit Web Uygulaması](../../examples/simple-web-app) - Temel dağıtım desenleri
- [Statik Web Sitesi](../../examples/static-site) - Statik içerik dağıtımı
- [Temel API](../../examples/basic-api) - REST API dağıtımı

#### Veritabanı Entegrasyonu (Bölüm 3-4)  
- [Veritabanı Uygulaması](../../examples/database-app) - Veritabanı bağlantı desenleri
- [Veri İşleme](../../examples/data-processing) - ETL iş akışı dağıtımı

#### Gelişmiş Desenler (Bölüm 4-8)
- [Container Apps](../../examples/container-app) - Konteynerleştirilmiş dağıtımlar
- [Mikroservisler](../../examples/microservices) - Çoklu hizmet mimarileri  
- [Kurumsal Çözümler](../../examples/enterprise) - Üretime hazır desenler

### Harici Şablon Koleksiyonları
- [**Resmi AZD Şablon Galerisi**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarının küratörlüğü
- [**Azure Developer CLI Şablonları**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dokümantasyonu
- [**Örnekler Dizini**](examples/README.md) - Ayrıntılı açıklamalarla yerel öğrenme örnekleri

---

## 📚 Öğrenme Kaynakları ve Referanslar

### Hızlı Referanslar
- [**Komut Kılavuzu**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Terimler Sözlüğü**](resources/glossary.md) - Azure ve azd terminolojisi  
- [**SSS**](resources/faq.md) - Öğrenme bölümlerine göre düzenlenmiş sık sorulan sorular
- [**Çalışma Kılavuzu**](resources/study-guide.md) - Kapsamlı pratik egzersizler

### Uygulamalı Atölyeler
- [**AI Atölye Laboratuvarı**](docs/ai-foundry/ai-workshop-lab.md) - AI çözümlerinizi AZD ile dağıtılabilir hale getirin (2-3 saat)
- [**Etkileşimli Atölye Rehberi**](workshop/README.md) - MkDocs ve DevContainer Ortamı ile tarayıcı tabanlı atölye
- [**Yapılandırılmış Öğrenme Yolu**](../../workshop/docs/instructions) - 7 adımlı rehberli egzersizler (Keşif → Dağıtım → Özelleştirme)
- [**AZD Yeni Başlayanlar İçin Atölye**](workshop/README.md) - GitHub Codespaces entegrasyonu ile tam uygulamalı atölye materyalleri

### Harici Öğrenme Kaynakları
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Fiyat Hesaplayıcı](https://azure.microsoft.com/pricing/calculator/)
- [Azure Durumu](https://status.azure.com/)

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölümü tamamlayarak öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temeller ve Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI-Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma ve Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod olarak Altyapı ve Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajan AI Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtım Öncesi Doğrulama ve Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme ve Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim ve Kurumsal Desenler ✅

### Öğrenme Doğrulaması
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Pratik Egzersiz**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüzün SSS bölümünü gözden geçirin
3. **Topluluk Tartışması**: Deneyimlerinizi Azure Discord'da paylaşın
4. **Sonraki Bölüm**: Bir sonraki zorluk seviyesine geçin

### Kurs Tamamlama Faydaları
Tüm bölümleri tamamladıktan sonra:
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure'a dağıttınız
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım yetenekleri  
- **Topluluk Tanınırlığı**: Azure geliştirici topluluğunun aktif bir üyesi olun
- **Kariyer İlerlemesi**: Talep gören AZD ve AI dağıtım uzmanlığı

---

## 🤝 Topluluk ve Destek

### Yardım ve Destek Alın
- **Teknik Sorunlar**: [Hataları bildirin ve özellik talep edin](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure)
- **AI'ye Özel Yardım**: AZD + AI Foundry tartışmaları için [#Azure kanalına katılın](https://discord.gg/microsoft-azure)
- **Dokümantasyon**: [Resmi Azure Developer CLI dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord'dan Topluluk İçgörüleri

**#Azure Kanalından Son Anket Sonuçları:**
- **%45** geliştirici AZD'yi AI iş yükleri için kullanmak istiyor
- **En büyük zorluklar**: Çoklu hizmet dağıtımları, kimlik yönetimi, üretim hazır olma  
- **En çok talep edilenler**: AI'ye özel şablonlar, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılın:**
- AZD + AI deneyimlerinizi paylaşın ve yardım alın
- Yeni AI şablonlarının erken önizlemelerine erişin
- AI dağıtım en iyi uygulamalarına katkıda bulunun
- Gelecekteki AI + AZD özellik geliştirmelerini etkileyin

### Kursa Katkıda Bulunma
Katkılarınızı memnuniyetle karşılıyoruz! Lütfen [Katkı Rehberimizi
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dilli desteği sürdürmeye yardımcı olun  
- **Hata Raporları**: Doğruluk ve netliği artırın  
- **Topluluk Standartları**: Kapsayıcı topluluk yönergelerimize uyun  

---

## 📄 Kurs Bilgileri

### Lisans
Bu proje MIT Lisansı altında lisanslanmıştır - detaylar için [LICENSE](../../LICENSE) dosyasına bakın.

### İlgili Microsoft Öğrenim Kaynakları

Ekibimiz diğer kapsamlı öğrenim kurslarını üretmektedir:

- [Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Hazır mısınız?**

**Yeni Başlayanlar**: [Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç](../..) ile başlayın  
**AI Geliştiricileri**: [Bölüm 2: AI-First Geliştirme](../..) bölümüne geçin  
**Deneyimli Geliştiriciler**: [Bölüm 3: Yapılandırma ve Kimlik Doğrulama](../..) ile başlayın  

**Sonraki Adımlar**: [Bölüm 1'e Başlayın - AZD Temelleri](docs/getting-started/azd-basics.md) →

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.