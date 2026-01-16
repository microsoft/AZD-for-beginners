<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T11:28:29+00:00",
  "source_file": "README.md",
  "language_code": "tr"
}
-->
# Yeni Başlayanlar için AZD: Yapılandırılmış Bir Öğrenme Yolculuğu

![AZD-for-beginners](../../../../translated_images/tr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Bu Kursa Başlarken

AZD öğrenme yolculuğunuza başlamak için şu adımları izleyin:

1. **Depoyu Forklayın**: Click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Depoyu Klonlayın**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Topluluğa Katılın**: Uzman desteği için [Azure Discord Toplulukları](https://discord.com/invite/ByRwuEEgH4)
4. **Öğrenme Yolunuzu Seçin**: Deneyim seviyenize uygun aşağıdaki bölümlerden birini seçin

### Çoklu Dil Desteği

#### Otomatik Çeviriler (Her Zaman Güncel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](./README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Yerel Klonlama mı Tercih Edersiniz?**

> Bu depo 50+ dil çevirisi içerdiğinden indirme boyutunu önemli ölçüde artırır. Çeviriler olmadan klonlamak için sparse checkout kullanın:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bu, kursu tamamlamak için ihtiyacınız olan her şeyi çok daha hızlı indirmenizi sağlar.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kurs Genel Bakışı

Azure Developer CLI (azd) konusunu, kademeli öğrenme için yapılandırılmış bölümlerle ustalıkla öğrenin. **Özel olarak AI uygulama dağıtımı ve Microsoft Foundry entegrasyonuna odaklanılmıştır.**

### Neden Bu Kurs Modern Geliştiriciler için Çok Önemli?

Microsoft Foundry Discord topluluk girdilerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyorlar:
- Karmaşık çoklu hizmet AI mimarileri
- Üretim AI dağıtım en iyi uygulamaları  
- Azure AI servis entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarının giderilmesi

### Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerinde Uzmanlaşacaksınız**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtacaksınız**: Microsoft Foundry servisleri ile AZD kullanımı
- **Kod Olarak Altyapı Uygulayacaksınız**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtım Sorunlarını Gidereceksiniz**: Yaygın sorunları çözme ve hata ayıklama
- **Üretime Hazırlık için Optimizasyon Yapacaksınız**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Agent Çözümleri İnşa Edeceksiniz**: Karmaşık AI mimarileri dağıtımı

## 📚 Öğrenme Bölümleri

*Deneyim seviyenize ve hedeflerinize göre öğrenme yolunu seçin*

### 🚀 Bölüm 1: Temel ve Hızlı Başlangıç
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Süre**: 30-45 dakika  
**Zorluk**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temellerini anlamak
- Platformunuza AZD kurmak
- İlk başarılı dağıtımınız

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Azure Developer CLI Nedir?](../..)
- **📖 Teori**: [AZD Temelleri](docs/getting-started/azd-basics.md) - Ana kavramlar ve terimler
- **⚙️ Kurulum**: [Kurulum & Ayar](docs/getting-started/installation.md) - Platforma özgü rehberler
- **🛠️ Uygulamalı**: [İlk Projeniz](docs/getting-started/first-project.md) - Adım adım eğitim
- **📋 Hızlı Referans**: [Komutlar Kılavuzu](resources/cheat-sheet.md)

#### Pratik Alıştırmalar
```bash
# Hızlı kurulum kontrolü
azd version

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up
```

**💡 Bölüm Sonucu**: AZD kullanarak basit bir web uygulamasını Azure'a başarıyla dağıtmak

**✅ Başarı Doğrulama:**
```bash
# 1. Bölüm tamamlandıktan sonra şunları yapabilmelisiniz:
azd version              # Yüklü olan sürümü gösterir
azd init --template todo-nodejs-mongo  # Projeyi başlatır
azd up                  # Azure'a dağıtır
azd show                # Çalışan uygulamanın URL'sini gösterir
# Uygulama tarayıcıda açılır ve çalışır
azd down --force --purge  # Kaynakları temizler
```

**📊 Zaman Yatırımı:** 30-45 dakika  
**📈 Beceri Seviyesi Sonunda:** Temel uygulamaları bağımsız olarak dağıtabilir

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
**📈 Beceri Seviyesi Sonunda:** Temel uygulamaları bağımsız olarak dağıtabilir

---

### 🤖 Bölüm 2: AI Öncelikli Geliştirme (AI Geliştiriciler için Tavsiye Edilen)
**Önkoşullar**: Bölüm 1 tamamlandı  
**Süre**: 1-2 saat  
**Zorluk**: ⭐⭐

#### Öğrenecekleriniz
- Microsoft Foundry ile AZD entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI servis yapılandırmalarının anlaşılması

#### Öğrenme Kaynakları
- **🎯 Buradan Başlayın**: [Microsoft Foundry Entegrasyonu](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Kalıplar**: [AI Modeli Dağıtımı](docs/microsoft-foundry/ai-model-deployment.md) - AI modellerini dağıtma ve yönetme
- **🛠️ Atölye**: [AI Atölye Laboratuvarı](docs/microsoft-foundry/ai-workshop-lab.md) - AI çözümlerinizi AZD’ye hazır hale getirin
- **🎥 Etkileşimli Rehber**: [Atölye Materyalleri](workshop/README.md) - MkDocs * DevContainer Ortamıyla tarayıcı tabanlı öğrenme
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

**💡 Bölüm Sonucu**: RAG yetenekleri olan AI destekli bir sohbet uygulaması dağıtmak ve yapılandırmak

**✅ Başarı Doğrulama:**
```bash
# Bölüm 2'den sonra şunları yapabilmelisiniz:
azd init --template azure-search-openai-demo
azd up
# AI sohbet arayüzünü test edin
# Sorular sorun ve kaynaklarla desteklenen AI yanıtları alın
# Arama entegrasyonunun çalıştığını doğrulayın
azd monitor  # Application Insights'ın telemetriyi gösterdiğini kontrol edin
azd down --force --purge
```

**📊 Zaman Yatırımı:** 1-2 saat  
**📈 Beceri Seviyesi Sonunda:** Üretime hazır AI uygulamalarını dağıtabilir ve yapılandırabilir  
**💰 Maliyet Bilinci:** Aylık 80-150 $ geliştirme, aylık 300-3500 $ üretim maliyeti tahmini

#### 💰 AI Dağıtımları için Maliyet Dikkatleri

**Geliştirme Ortamı (Tahmini 80-150 $/ay):**
- Azure OpenAI (kullanıma göre ödeme): 0-50 $/ay (token kullanımına bağlı)
- AI Search (Temel katman): 75 $/ay
- Container Apps (Tüketim): 0-20 $/ay
- Depolama (Standart): 1-5 $/ay

**Üretim Ortamı (Tahmini 300-3.500+ $/ay):**
- Azure OpenAI (Tutarlı performans için PTU): 3.000+ $/ay VEYA yüksek hacim için kullanım bazlı ödeme
- AI Search (Standart katman): 250 $/ay
- Container Apps (Özel): 50-100 $/ay
- Application Insights: 5-50 $/ay
- Depolama (Premium): 10-50 $/ay

**💡 Maliyet Optimizasyon İpuçları:**
- Öğrenme için **Ücretsiz Katman** Azure OpenAI kullanın (ayda 50.000 token dahil)
- Aktif geliştirme olmadığında kaynakları kapatmak için `azd down` komutunu kullanın
- Önce kullanım bazlı faturalandırmaya başlayın, sadece üretim için PTU'ya geçiş yapın
- Dağıtımdan önce maliyet tahmini için `azd provision --preview` komutunu kullanın
- Otomatik ölçeklendirmeyi etkinleştirin: sadece gerçek kullanım için ödeme yapın

**Maliyet İzleme:**
```bash
# Tahmini aylık maliyetleri kontrol edin
azd provision --preview

# Azure Portal'da gerçek maliyetleri izleyin
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Bölüm 3: Yapılandırma ve Kimlik Doğrulama
**Önkoşullar**: Bölüm 1 tamamlandı  
**Süre**: 45-60 dakika  
**Zorluk**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak isimlendirme ve organizasyonu

#### Öğrenme Kaynakları
- **📖 Yapılandırma**: [Yapılandırma Rehberi](docs/getting-started/configuration.md) - Ortam kurulumu
- **🔐 Güvenlik**: [Kimlik doğrulama desenleri ve yönetilen kimlik](docs/getting-started/authsecurity.md) - Kimlik doğrulama desenleri
- **📝 Örnekler**: [Veritabanı Uygulama Örneği](examples/database-app/README.md) - AZD Veritabanı Örnekleri

#### Pratik Alıştırmalar
- Birden fazla ortam yapılandırma (geliştirme, hazırlık, üretim)
- Yönetilen kimlik doğrulamasını ayarlama
- Ortama özgü yapılandırmalar uygulama

**💡 Bölüm Sonucu**: Uygun kimlik doğrulama ve güvenlik ile birden çok ortamı yönetmek

---

### 🏗️ Bölüm 4: Kod Olarak Altyapı ve Dağıtım
**Önkoşullar**: Bölümler 1-3 tamamlandı  
**Süre**: 1-1.5 saat  
**Zorluk**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri düzey dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri

#### Öğrenme Kaynakları
- **📖 Dağıtım**: [Dağıtım Rehberi](docs/deployment/deployment-guide.md) - Tam iş akışları
- **🏗️ Kaynak Sağlama**: [Kaynak Sağlama](docs/deployment/provisioning.md) - Azure kaynak yönetimi
- **📝 Örnekler**: [Container App Örneği](../../examples/container-app) - Container tabanlı dağıtımlar

#### Pratik Alıştırmalar
- Özel Bicep şablonları oluşturma
- Çoklu hizmet uygulamaları dağıtma
- Blue-green dağıtım stratejilerini uygulama

**💡 Bölüm Sonucu**: Özel altyapı şablonları kullanarak karmaşık çoklu hizmet uygulamaları dağıtmak

---

### 🎯 Bölüm 5: Çoklu Agent AI Çözümleri (İleri Seviye)
**Önkoşullar**: Bölümler 1-2 tamamlandı  
**Süre**: 2-3 saat  
**Zorluk**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu agent mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu  
- Üretime hazır AI dağıtımları  

#### Öğrenme Kaynakları  
- **🤖 Öne Çıkan Proje**: [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama  
- **🛠️ ARM Şablonları**: [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıklamayla dağıtım  
- **📖 Mimari**: [Çoklu ajan koordinasyon desenleri](/docs/pre-deployment/coordination-patterns.md) - Desenler  

#### Pratik Egzersizler  
```bash
# Kapsamlı perakende çoklu ajan çözümünü dağıtın
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ajan yapılandırmalarını keşfedin
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Bölüm Sonucu**: Müşteri ve Envanter ajanları ile üretime hazır çoklu ajan AI çözümünü dağıtın ve yönetin  

---  

### 🔍 Bölüm 6: Ön Dağıtım Doğrulama ve Planlama  
**Ön Koşullar**: Bölüm 4 tamamlandı  
**Süre**: 1 saat  
**Zorluk**: ⭐⭐  

#### Öğrenecekleriniz  
- Kapasite planlama ve kaynak doğrulaması  
- SKU seçimi stratejileri  
- Ön kontrol ve otomasyon  

#### Öğrenme Kaynakları  
- **📊 Planlama**: [Kapasite Planlama](docs/pre-deployment/capacity-planning.md) - Kaynak doğrulama  
- **💰 Seçim**: [SKU Seçimi](docs/pre-deployment/sku-selection.md) - Maliyet etkin tercihler  
- **✅ Doğrulama**: [Ön Kontroller](docs/pre-deployment/preflight-checks.md) - Otomatik betikler  

#### Pratik Egzersizler  
- Kapasite doğrulama betiklerini çalıştırın  
- Maliyet için SKU seçimlerini optimize edin  
- Otomatik ön dağıtım kontrollerini uygulayın  

**💡 Bölüm Sonucu**: Dağıtımları çalıştırmadan önce doğrulayın ve optimize edin  

---  

### 🚨 Bölüm 7: Sorun Giderme ve Hata Ayıklama  
**Ön Koşullar**: Herhangi bir dağıtım bölümü tamamlandı  
**Süre**: 1-1.5 saat  
**Zorluk**: ⭐⭐  

#### Öğrenecekleriniz  
- Sistematik hata ayıklama yaklaşımları  
- Yaygın sorunlar ve çözümleri  
- AI’ye özgü sorun giderme  

#### Öğrenme Kaynakları  
- **🔧 Yaygın Sorunlar**: [Yaygın Sorunlar](docs/troubleshooting/common-issues.md) - SSS ve çözümler  
- **🕵️ Hata Ayıklama**: [Hata Ayıklama Kılavuzu](docs/troubleshooting/debugging.md) - Adım adım stratejiler  
- **🤖 AI Sorunları**: [AI’ye Özgü Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md) - AI servis problemleri  

#### Pratik Egzersizler  
- Dağıtım hatalarını teşhis edin  
- Kimlik doğrulama sorunlarını çözün  
- AI servis bağlantısını hata ayıklayın  

**💡 Bölüm Sonucu**: Yaygın dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün  

---  

### 🏢 Bölüm 8: Üretim ve Kurumsal Desenler  
**Ön Koşullar**: Bölümler 1-4 tamamlandı  
**Süre**: 2-3 saat  
**Zorluk**: ⭐⭐⭐⭐  

#### Öğrenecekleriniz  
- Üretim dağıtım stratejileri  
- Kurumsal güvenlik desenleri  
- İzleme ve maliyet optimizasyonu  

#### Öğrenme Kaynakları  
- **🏭 Üretim**: [Üretim AI En İyi Uygulamaları](docs/microsoft-foundry/production-ai-practices.md) - Kurumsal desenler  
- **📝 Örnekler**: [Mikroservis Örneği](../../examples/microservices) - Karmaşık mimariler  
- **📊 İzleme**: [Application Insights entegrasyonu](docs/pre-deployment/application-insights.md) - İzleme  

#### Pratik Egzersizler  
- Kurumsal güvenlik desenlerini uygulayın  
- Kapsamlı izleme kurun  
- Doğru yönetişimle üretime dağıtım yapın  

**💡 Bölüm Sonucu**: Tam üretim özelliklerine sahip kurumsal uygulamaları dağıtın  

---  

## 🎓 Atölye Genel Bakışı: Uygulamalı Öğrenme Deneyimi  

> **⚠️ ATÖLYE DURUMU: Aktif Geliştirme**  
> Atölye materyalleri hâlen geliştirilmekte ve iyileştirilmektedir. Temel modüller işlevseldir, ancak bazı ileri bölümler tamamlanmamıştır. Tüm içeriği tamamlamak için aktif çalışıyoruz. [İlerlemeni takip et →](workshop/README.md)  

### Etkileşimli Atölye Materyalleri  
**Tarayıcı tabanlı araçlar ve rehberli egzersizlerle kapsamlı uygulamalı öğrenme**  

Atölye materyallerimiz, yukarıdaki bölüm tabanlı müfredata tamamlayıcı yapılandırılmış, etkileşimli bir öğrenme deneyimi sunar. Hem kendi hızınızda öğrenme hem de eğitmen liderliğinde oturumlar için uygundur.  

#### 🛠️ Atölye Özellikleri  
- **Tarayıcı Tabanlı Arayüz**: Arama, kopyalama ve tema özelliklerine sahip tam MkDocs destekli atölye  
- **GitHub Codespaces Entegrasyonu**: Tek tıklamayla geliştirme ortamı kurulumu  
- **Yapılandırılmış Öğrenme Yolu**: 7 adımlı rehberli egzersizler (toplam 3.5 saat)  
- **Keşif → Dağıtım → Özelleştirme**: Aşamalı metodoloji  
- **Etkileşimli DevContainer Ortamı**: Ön yapılandırılmış araçlar ve bağımlılıklar  

#### 📚 Atölye Yapısı  
Atölye, **Keşif → Dağıtım → Özelleştirme** metodolojisini izler:  

1. **Keşif Aşaması** (45 dk)  
   - Microsoft Foundry şablonları ve servislerini keşfet  
   - Çoklu ajan mimari desenlerini öğren  
   - Dağıtım gereksinimlerini ve ön koşulları incele  

2. **Dağıtım Aşaması** (2 saat)  
   - AZD ile AI uygulamalarını uygulamalı dağıt  
   - Azure AI servislerini ve uç noktalarını yapılandır  
   - Güvenlik ve kimlik doğrulama desenlerini uygula  

3. **Özelleştirme Aşaması** (45 dk)  
   - Uygulamaları belirli kullanım durumlarına göre değiştir  
   - Üretime dağıtım için optimize et  
   - İzleme ve maliyet yönetimini uygula  

#### 🚀 Atölyeye Başlarken  
```bash
# Seçenek 1: GitHub Codespaces (Önerilen)
# Depoda "Code" → "main üzerinde codespace oluştur" seçeneğine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md içindeki kurulum talimatlarını izleyin
```
  
#### 🎯 Atölye Öğrenme Çıktıları  
Atölyeyi tamamlayan katılımcılar:  
- **Üretim AI Uygulamaları Dağıtır**: Microsoft Foundry servisleriyle AZD kullanır  
- **Çoklu Ajan Mimarisinde Uzmanlaşır**: Koordine AI ajan çözümleri uygular  
- **Güvenlik En İyi Uygulamalarını Uygular**: Kimlik doğrulama ve erişim kontrolü kurar  
- **Ölçek için Optimizasyon Yapar**: Maliyet etkin, performanslı dağıtımlar tasarlar  
- **Dağıtımları Sorunsuz Düzenler**: Yaygın sorunları bağımsızca çözer  

#### 📖 Atölye Kaynakları  
- **🎥 Etkileşimli Kılavuz**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme ortamı  
- **📋 Adım Adım Talimatlar**: [Rehberli Egzersizler](../../workshop/docs/instructions) - Ayrıntılı uygulamalar  
- **🛠️ AI Atölyesi Laboratuvarı**: [AI Atölyesi Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI odaklı egzersizler  
- **💡 Hızlı Başlangıç**: [Atölye Kurulum Kılavuzu](workshop/README.md#quick-start) - Ortam yapılandırması  

**Uygun:** Kurumsal eğitim, üniversite dersleri, kendi hızında öğrenme ve geliştirici bootcamp’leri için.  

---  

## 📖 Azure Developer CLI Nedir?  

Azure Developer CLI (azd), uygulamaların Azure’a hızlıca oluşturulup dağıtım sürecini hızlandıran geliştirici odaklı bir komut satırı aracıdır. Sağladıkları:  

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama desenleri için önceden oluşturulmuş şablonlar  
- **Altyapı Kod Olarak** - Azure kaynaklarını Bicep veya Terraform ile yönetme  
- **Entegre iş akışları** - Uygulamaları sorunsuz şekilde sağlama, dağıtma ve izleme  
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiş  

### **AZD + Microsoft Foundry: AI Dağıtımları için Mükemmel**  

**Neden AZD AI çözümleri için?** AZD, AI geliştiricilerin karşılaştığı başlıca zorlukları giderir:  

- **AI Hazır Şablonlar** - Azure OpenAI, Cognitive Services ve ML iş yükleri için ön yapılandırılmış şablonlar  
- **Güvenli AI Dağıtımları** - AI servisleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri  
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet etkin AI uygulama dağıtımı en iyi uygulamaları  
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar eksiksiz izleme ile  
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri  
- **Microsoft Foundry Entegrasyonu** - Microsoft Foundry model kataloğu ve uç noktalarına kesintisiz bağlantı  

---  

## 🎯 Şablonlar ve Örnekler Kütüphanesi  

### Öne Çıkan: Microsoft Foundry Şablonları  
**AI uygulamaları dağıtıyorsanız buradan başlayın!**  

> **Not:** Bu şablonlar çeşitli AI desenlerini gösterir. Bazıları Azure Örnekleri dış kaynaklı, bazıları yerel uygulamalardır.  

| Şablon | Bölüm | Zorluk | Servisler | Tür |  
|--------|-------|--------|-----------|-----|  
| [**AI sohbet ile başlayın**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Dış Kaynak |  
| [**AI ajanlarla başlayın**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Bölüm 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Dış Kaynak |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Dış Kaynak |  
| [**OpenAI Chat App Hızlı Başlangıç**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Dış Kaynak |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Dış Kaynak |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Dış Kaynak |  
| [**Perakende Çoklu Ajan Çözümü**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Yerel** |  

### Öne Çıkan: Tam Öğrenme Senaryoları  
**Üretime hazır uygulama şablonları öğrenme bölümlerine göre eşlenmiştir**  

| Şablon | Öğrenme Bölümü | Zorluk | Temel Öğrenme |  
|--------|----------------|--------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Bölüm 2 | ⭐ | Temel AI dağıtım desenleri |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Bölüm 2 | ⭐⭐ | Azure AI Search ile RAG uygulaması |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Bölüm 4 | ⭐⭐ | Belge Zekası entegrasyonu |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Bölüm 5 | ⭐⭐⭐ | Ajan çerçevesi ve fonksiyon çağrısı |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Bölüm 8 | ⭐⭐⭐ | Kurumsal AI orkestrasyonu |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Bölüm 5 | ⭐⭐⭐⭐ | Müşteri ve Envanter ajanlı çoklu ajan mimarisi |  

### Örnek Türüne Göre Öğrenme  

> **📌 Yerel vs. Dış Kaynak Örnekleri:**  
> **Yerel Örnekler** (bu depoda) = Hemen kullanıma hazır  
> **Dış Kaynak Örnekler** (Azure Örnekleri) = Bağlantılı repolardan klonlama  

#### Yerel Örnekler (Hemen Kullanıma Hazır)  
- [**Perakende Çoklu Ajan Çözümü**](examples/retail-scenario.md) - Üretime hazır tam uygulama ARM şablonlarıyla  
  - Çoklu ajan mimarisi (Müşteri + Envanter ajanları)  
  - Kapsamlı izleme ve değerlendirme  
  - ARM şablonu ile tek tıklamalı dağıtım  

#### Yerel Örnekler - Konteyner Uygulamaları (Bölümler 2-5)  
**Bu repoda kapsamlı konteyner dağıtım örnekleri:**  
- [**Konteyner Uygulama Örnekleri**](examples/container-app/README.md) - Konteynerleştirilmiş dağıtımlarda tam rehber  
  - [Basit Flask API](../../examples/container-app/simple-flask-api) - Ölçeği sıfıra indirilebilen temel REST API  
  - [Mikroservis Mimari](../../examples/container-app/microservices) - Üretime hazır çoklu servis dağıtımı  
  - Hızlı Başlangıç, Üretim ve İleri dağıtım desenleri  
  - İzleme, güvenlik ve maliyet optimizasyon rehberi  

#### Dış Kaynak Örnekler - Basit Uygulamalar (Bölümler 1-2)  
**Başlamak için bu Azure Örnekleri repolarını klonlayın:**  
- [Basit Web Uygulaması - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Temel dağıtım desenleri  
- [Statik Web Sitesi - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statik içerik dağıtımı  
- [Konteyner Uygulaması - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API dağıtımı  

#### Dış Kaynak Örnekler - Veritabanı Entegrasyonu (Bölümler 3-4)  
- [Veritabanı Uygulaması - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Veritabanı bağlantı desenleri  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Sunucusuz veri iş akışı  

#### Dış Kaynak Örnekler - İleri Desenler (Bölümler 4-8)  
- [Java Mikroservisleri](https://github.com/Azure-Samples/java-microservices-aca-lab) - Çoklu servis mimarileri  
- [Konteyner Uygulamaları İşleri](https://github.com/Azure-Samples/container-apps-jobs) - Arka plan işlemleri  
- [Kurumsal ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Üretime hazır ML desenleri  

### Dış Kaynak Şablon Koleksiyonları  
- [**Resmi AZD Şablon Galerisi**](https://azure.github.io/awesome-azd/) - Resmi ve topluluk şablonlarının küratörlüğü  
- [**Azure Developer CLI Şablonları**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn şablon dokümantasyonu  
- [**Örnekler Dizini**](examples/README.md) - Ayrıntılı açıklamalarla yerel öğrenme örnekleri

---

## 📚 Öğrenme Kaynakları ve Referanslar

### Hızlı Referanslar
- [**Komut Hızlı Başvuru Kartı**](resources/cheat-sheet.md) - Bölümlere göre düzenlenmiş temel azd komutları
- [**Sözlük**](resources/glossary.md) - Azure ve azd terimleri  
- [**SSS**](resources/faq.md) - Öğrenme bölümlerine göre düzenlenmiş sıkça sorulan sorular
- [**Çalışma Rehberi**](resources/study-guide.md) - Kapsamlı uygulama alıştırmaları

### Uygulamalı Atölyeler
- [**Yapay Zeka Atölyesi Laboratuvarı**](docs/microsoft-foundry/ai-workshop-lab.md) - Yapay zeka çözümlerinizi AZD dağıtılabilir hale getirin (2-3 saat)
- [**Etkileşimli Atölye Rehberi**](workshop/README.md) - MkDocs ve DevContainer Ortamı ile tarayıcı tabanlı atölye
- [**Yapılandırılmış Öğrenme Yolu**](../../workshop/docs/instructions) - 7 adımlı rehberli egzersizler (Keşif → Dağıtım → Özelleştirme)
- [**Başlangıç için AZD Atölyesi**](workshop/README.md) - GitHub Codespaces entegrasyonlu eksiksiz uygulamalı atölye malzemeleri

### Dış Öğrenme Kaynakları
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Fiyatlandırma Hesaplayıcısı](https://azure.microsoft.com/pricing/calculator/)
- [Azure Durumu](https://status.azure.com/)

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Başlangıçta karşılaşılan yaygın sorunlar ve hemen uygulanabilecek çözümler:**

### ❌ "azd: komut bulunamadı"

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

### ❌ "Abonelik bulunamadı" veya "Abonelik ayarlanmadı"

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

### ❌ "Yetersiz Kota" veya "Kota aşıldı"

```bash
# Farklı bir Azure bölgesi deneyin
azd env set AZURE_LOCATION "westus2"
azd up

# Ya da geliştirmede daha küçük SKU'lar kullanın
# infra/main.parameters.json dosyasını düzenleyin:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" işlemi yarıda başarısız oluyor

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

### ❌ "Kimlik doğrulama başarısız" veya "Jeton süresi doldu"

```bash
# Yeniden kimlik doğrulama
az logout
az login

azd auth logout
azd auth login

# Kimlik doğrulamayı doğrula
az account show
```

### ❌ "Kaynak zaten mevcut" veya adlandırma çatışmaları

```bash
# AZD benzersiz isimler oluşturur, ancak çakışma olursa:
azd down --force --purge

# O zaman yeni bir ortamla tekrar deneyin
azd env new dev-v2
azd up
```

### ❌ Şablon dağıtımı çok uzun sürüyor

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- Yapay zeka uygulamaları: 15-25 dakika (OpenAI sağlama yavaş)

```bash
# İlerlemeyi kontrol et
azd show

# 30 dakikadan fazla takılı kalındıysa, Azure Portal'ı kontrol et:
azd monitor
# Başarısız dağıtımlara bakın
```

### ❌ "İzin reddedildi" veya "Yasaklandı"

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Katkıda Bulunan" rolüne ihtiyacınız var
# Azure yöneticinizden izin isteyin:
# - Katkıda Bulunan (kaynaklar için)
# - Kullanıcı Erişim Yöneticisi (rol atamaları için)
```

### ❌ Dağıtılmış uygulama URL'si bulunamıyor

```bash
# Tüm hizmet uç noktalarını göster
azd show

# Ya da Azure Portal'ı aç
azd monitor

# Belirli hizmeti kontrol et
azd env get-values
# *_URL değişkenlerini ara
```

### 📚 Tam Sorun Giderme Kaynakları

- **Yaygın Sorunlar Rehberi:** [Detaylı Çözümler](docs/troubleshooting/common-issues.md)
- **Yapay Zeka Özel Sorunları:** [Yapay Zeka Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım adım Hata Ayıklama](docs/troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Hızlı Sorun Giderme Rehberi

**Başlangıçta karşılaşılan yaygın sorunlar ve hemen uygulanabilecek çözümler:**

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
<summary><strong>❌ "Yetersiz Kota" veya "Kota aşıldı"</strong></summary>

```bash
# Farklı bir Azure bölgesi deneyin
azd env set AZURE_LOCATION "westus2"
azd up

# Ya da geliştirmede daha küçük SKU'lar kullanın
# infra/main.parameters.json dosyasını düzenleyin:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" işlemi yarıda başarısız oluyor</strong></summary>

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
<summary><strong>❌ "Kimlik doğrulama başarısız" veya "Jeton süresi doldu"</strong></summary>

```bash
# Yeniden kimlik doğrulama
az logout
az login

azd auth logout
azd auth login

# Kimlik doğrulamayı doğrulayın
az account show
```
</details>

<details>
<summary><strong>❌ "Kaynak zaten mevcut" veya adlandırma çatışmaları</strong></summary>

```bash
# AZD benzersiz isimler oluşturur, ancak çakışma olursa:
azd down --force --purge

# Sonra yeni bir ortamla tekrar dene
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Şablon dağıtımı çok uzun sürüyor</strong></summary>

**Normal bekleme süreleri:**
- Basit web uygulaması: 5-10 dakika
- Veritabanlı uygulama: 10-15 dakika
- Yapay zeka uygulamaları: 15-25 dakika (OpenAI sağlama yavaş)

```bash
# İlerlemesini kontrol et
azd show

# 30 dakikadan fazla takılı kalındıysa, Azure Portalı kontrol et:
azd monitor
# Başarısız dağıtımları kontrol et
```
</details>

<details>
<summary><strong>❌ "İzin reddedildi" veya "Yasaklandı"</strong></summary>

```bash
# Azure rolünüzü kontrol edin
az role assignment list --assignee $(az account show --query user.name -o tsv)

# En az "Katkıda Bulunan" rolüne ihtiyacınız var
# Azure yöneticinizden vermesini isteyin:
# - Katkıda Bulunan (kaynaklar için)
# - Kullanıcı Erişim Yöneticisi (rol atamaları için)
```
</details>

<details>
<summary><strong>❌ Dağıtılmış uygulama URL'si bulunamıyor</strong></summary>

```bash
# Tüm servis uç noktalarını göster
azd show

# Veya Azure Portal'ı aç
azd monitor

# Belirli servisi kontrol et
azd env get-values
# *_URL değişkenlerini ara
```
</details>

### 📚 Tam Sorun Giderme Kaynakları

- **Yaygın Sorunlar Rehberi:** [Detaylı Çözümler](docs/troubleshooting/common-issues.md)
- **Yapay Zeka Özel Sorunları:** [Yapay Zeka Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md)
- **Hata Ayıklama Rehberi:** [Adım adım Hata Ayıklama](docs/troubleshooting/debugging.md)
- **Yardım Alın:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Tamamlama ve Sertifikasyon

### İlerleme Takibi
Her bölümü tamamladıkça öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temel ve Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: Yapay Zeka Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma ve Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Altyapı Kod Olarak & Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajanlı Yapay Zeka Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtımdan Önce Doğrulama ve Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme ve Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim ve Kurumsal Desenler ✅

### Öğrenme Doğrulaması
Her bölümü tamamladıktan sonra bilginizi doğrulayın:
1. **Uygulamalı Egzersiz**: Bölümün uygulamalı dağıtımını tamamlayın
2. **Bilgi Kontrolü**: Bölümünüz için SSS kısmını inceleyin
3. **Topluluk Tartışması**: Deneyiminizi Azure Discord’da paylaşın
4. **Bir Sonraki Bölüm**: Bir sonraki karmaşıklık seviyesine geçin

### Kurs Tamamlama Avantajları
Tüm bölümleri tamamladığınızda:
- **Üretim Deneyimi**: Gerçek yapay zeka uygulamaları Azure’a dağıttınız
- **Profesyonel Yetenekler**: Kurumsal seviyede dağıtım yetenekleri  
- **Topluluk Tanınması**: Azure geliştirici topluluğunda aktif üyelik
- **Kariyer İlerlemesi**: Talep gören AZD ve yapay zeka dağıtım uzmanlığı

---

## 🤝 Topluluk ve Destek

### Yardım ve Destek Alın
- **Teknik Sorunlar**: [Hata bildirin ve özellik talep edin](https://github.com/microsoft/azd-for-beginners/issues)
- **Öğrenme Soruları**: [Microsoft Azure Discord Topluluğu](https://discord.gg/microsoft-azure) ve [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Yapay Zeka Özel Yardım**: Katılın [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokümantasyon**: [Resmi Azure Developer CLI dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord Topluluk Görüşleri

**#Azure Kanalından Güncel Anket Sonuçları:**
- **%45** geliştirici AZD’yi yapay zeka işleri için kullanmak istiyor
- **Başlıca zorluklar**: Çoklu hizmet dağıtımları, kimlik bilgisi yönetimi, üretim hazır hale getirme  
- **En çok istenen**: Yapay zeka şablonları, sorun giderme rehberleri, en iyi uygulamalar

**Topluluğumuza katılarak:**
- AZD + Yapay Zeka deneyimlerinizi paylaşabilir ve yardım alabilirsiniz
- Yeni yapay zeka şablonlarının erken önizlemelerine ulaşabilirsiniz
- Yapay zeka dağıtımı için en iyi uygulamalara katkı sağlayabilirsiniz
- Gelecekteki yapay zeka + AZD özellik geliştirmelerini etkileyebilirsiniz

### Kursa Katkıda Bulunma
Katkılarınızı bekliyoruz! Detaylar için lütfen [Katkıda Bulunma Rehberi](CONTRIBUTING.md) oku:
- **İçerik İyileştirmeleri**: Mevcut bölümleri ve örnekleri geliştirin
- **Yeni Örnekler**: Gerçek dünya senaryoları ve şablonlar ekleyin  
- **Çeviri**: Çok dillilik desteğini sürdürmeye yardımcı olun
- **Hata Bildirimi**: Doğruluk ve netliği artırın
- **Topluluk Standartları**: Kapsayıcı topluluk kurallarımıza uyun

---

## 📄 Kurs Bilgileri

### Lisans
Bu proje MIT Lisansı ile lisanslanmıştır - ayrıntılar için [LICENSE](../../LICENSE) dosyasına bakınız.

### İlgili Microsoft Öğrenme Kaynakları

Ekibimiz diğer kapsamlı öğrenme kurslarını üretmektedir:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j Başlangıç](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js Başlangıç](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Ajanlar
[![Başlangıç İçin AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI Başlangıç](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Başlangıç İçin MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Başlangıç İçin AI Ajanları](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Üretken Yapay Zeka Serisi
[![Başlangıç için Üretken Yapay Zeka](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Üretken Yapay Zeka (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Temel Öğrenme
[![Başlangıç İçin ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Başlangıç İçin Veri Bilimi](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar İçin Yapay Zeka](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar İçin Siber Güvenlik](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Yeni Başlayanlar İçin Web Geliştirme](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar İçin Nesnelerin İnterneti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Yeni Başlayanlar İçin XR Geliştirme](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serisi
[![Yapay Zeka Eşliğinde Programlama için Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET için Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Macerası](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kurs Navigasyonu

**🚀 Öğrenmeye Başlamaya Hazır mısınız?**

**Yeni Başlayanlar**: [Bölüm 1: Temel & Hızlı Başlangıç](../..) ile başlayın  
**Yapay Zeka Geliştiricileri**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../..) bölümüne geçin  
**Deneyimli Geliştiriciler**: [Bölüm 3: Yapılandırma & Kimlik Doğrulama](../..) ile başlayın

**Sonraki Adımlar**: [Bölüm 1’i Başlat - AZD Temelleri](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba gösterilse de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu oluşabilecek yanlış anlamalar veya yorum farklılıkları nedeniyle sorumluluk kabul edilmemektedir.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->