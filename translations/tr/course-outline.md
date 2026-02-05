# AZD Yeni Başlayanlar İçin: Kurs İçeriği ve Öğrenme Çerçevesi

## Kurs Genel Bakışı

Azure Developer CLI (azd) konusunda uzmanlaşın; ilerlemeli öğrenme için yapılandırılmış bölümlerle tasarlanmıştır. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel odaklanma.**

### Bu Kurs Neden Modern Geliştiriciler İçin Önemli?

Microsoft Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyor:
- Karmaşık çoklu hizmet AI mimarileri
- Üretim AI dağıtımında en iyi uygulamalar  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Temel Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerini Öğrenin**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Microsoft Foundry hizmetleriyle kullanın
- **Kod Olarak Altyapı Uygulayın**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtımları Sorun Giderin**: Yaygın sorunları çözün ve problemleri ayıklayın
- **Üretim için Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Oluşturun**: Karmaşık AI mimarilerini dağıtın

## 🎓 Atölye Öğrenme Deneyimi

### Esnek Öğrenme Sunum Seçenekleri
Bu kurs, hem **bireysel öğrenme** hem de **kolaylaştırılmış atölye oturumları** için tasarlanmıştır. Öğrencilerin AZD ile pratik beceriler geliştirmelerini sağlayan etkileşimli egzersizlerle uygulamalı deneyim sunar.

#### 🚀 Bireysel Öğrenme Modu
**Bireysel geliştiriciler ve sürekli öğrenme için mükemmel**

**Özellikler:**
- **Tarayıcı Tabanlı Arayüz**: Herhangi bir web tarayıcısı üzerinden erişilebilen MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Önceden yapılandırılmış araçlarla tek tıkla geliştirme ortamı
- **Etkileşimli DevContainer Ortamı**: Yerel kurulum gerekmez - hemen kodlamaya başlayın
- **İlerleme Takibi**: Dahili kontrol noktaları ve doğrulama egzersizleri
- **Topluluk Desteği**: Sorular ve iş birliği için Azure Discord kanallarına erişim

**Öğrenme Yapısı:**
- **Esnek Zamanlama**: Bölümleri günler veya haftalar boyunca kendi hızınızda tamamlayın
- **Kontrol Noktası Sistemi**: Karmaşık konulara geçmeden önce öğrenmeyi doğrulayın
- **Kaynak Kütüphanesi**: Kapsamlı belgeler, örnekler ve sorun giderme kılavuzları
- **Portföy Geliştirme**: Profesyonel portföyler için dağıtılabilir projeler oluşturun

**Başlangıç (Bireysel Öğrenme):**
```bash
# Seçenek 1: GitHub Codespaces (Önerilen)
# Depoya gidin ve "Code" → "Create codespace on main" seçeneğine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md dosyasındaki kurulum talimatlarını takip edin
```

#### 🏛️ Kolaylaştırılmış Atölye Oturumları
**Kurumsal eğitim, bootcamp'ler ve eğitim kurumları için ideal**

**Atölye Formatı Seçenekleri:**

**📚 Akademik Kurs Entegrasyonu (8-12 hafta)**
- **Üniversite Programları**: Haftalık 2 saatlik oturumlarla dönemlik kurs
- **Bootcamp Formatı**: Günlük 6-8 saatlik yoğun 3-5 günlük program
- **Kurumsal Eğitim**: Pratik proje uygulamasıyla aylık ekip oturumları
- **Değerlendirme Çerçevesi**: Derecelendirilmiş ödevler, akran değerlendirmeleri ve final projeleri

**🚀 Yoğun Atölye (1-3 gün)**
- **1. Gün**: Temel + AI Geliştirme (Bölüm 1-2) - 6 saat
- **2. Gün**: Yapılandırma + Altyapı (Bölüm 3-4) - 6 saat  
- **3. Gün**: İleri Düzey Modeller + Üretim (Bölüm 5-8) - 8 saat
- **Takip**: Proje tamamlaması için isteğe bağlı 2 haftalık mentorluk

**⚡ Yönetici Brifingi (4-6 saat)**
- **Stratejik Genel Bakış**: AZD değer önerisi ve iş etkisi (1 saat)
- **Uygulamalı Demo**: AI uygulamasını baştan sona dağıtma (2 saat)
- **Mimari İnceleme**: Kurumsal modeller ve yönetişim (1 saat)
- **Uygulama Planlama**: Kurumsal benimseme stratejisi (1-2 saat)

#### 🛠️ Atölye Öğrenme Metodolojisi
**Keşif → Dağıtım → Özelleştirme yaklaşımıyla uygulamalı beceri geliştirme**

**Faz 1: Keşif (45 dakika)**
- **Şablon Keşfi**: Azure AI Foundry şablonlarını ve hizmetlerini değerlendirme
- **Mimari Analiz**: Çoklu ajan modellerini ve dağıtım stratejilerini anlama
- **Gereksinim Değerlendirme**: Kurumsal ihtiyaçları ve kısıtlamaları belirleme
- **Ortam Kurulumu**: Geliştirme ortamını ve Azure kaynaklarını yapılandırma

**Faz 2: Dağıtım (2 saat)**
- **Yönlendirilmiş Uygulama**: AZD ile AI uygulamalarının adım adım dağıtımı
- **Hizmet Yapılandırması**: Azure AI hizmetlerini, uç noktaları ve kimlik doğrulamayı yapılandırma
- **Güvenlik Uygulaması**: Kurumsal güvenlik modelleri ve erişim kontrolleri uygulama
- **Doğrulama Testi**: Dağıtımları doğrulama ve yaygın sorunları giderme

**Faz 3: Özelleştirme (45 dakika)**
- **Uygulama Değişikliği**: Belirli kullanım durumları ve gereksinimler için şablonları uyarlama
- **Üretim Optimizasyonu**: İzleme, maliyet yönetimi ve ölçeklendirme stratejileri uygulama
- **İleri Düzey Modeller**: Çoklu ajan koordinasyonu ve karmaşık mimarileri keşfetme
- **Sonraki Adımları Planlama**: Sürekli beceri geliştirme için öğrenme yolunu tanımlama

#### 🎯 Atölye Öğrenme Çıktıları
**Uygulamalı pratikle geliştirilen ölçülebilir beceriler**

**Teknik Yetkinlikler:**
- **Üretim AI Uygulamaları Dağıtımı**: AI destekli çözümleri başarıyla dağıtma ve yapılandırma
- **Kod Olarak Altyapı Uzmanlığı**: Özel Bicep şablonları oluşturma ve yönetme
- **Çoklu Ajan Mimarisi**: Koordine AI ajan çözümleri uygulama
- **Üretim Hazırlığı**: Güvenlik, izleme ve yönetişim modelleri uygulama
- **Sorun Giderme Uzmanlığı**: Dağıtım ve yapılandırma sorunlarını bağımsız olarak çözme

**Profesyonel Beceriler:**
- **Proje Liderliği**: Bulut dağıtım girişimlerinde teknik ekipleri yönetme
- **Mimari Tasarım**: Ölçeklenebilir, maliyet etkin Azure çözümleri tasarlama
- **Bilgi Aktarımı**: AZD en iyi uygulamalarında meslektaşları eğitme ve mentorluk yapma
- **Stratejik Planlama**: Kurumsal bulut benimseme stratejilerini etkileme

#### 📋 Atölye Kaynakları ve Malzemeleri
**Kolaylaştırıcılar ve öğrenciler için kapsamlı araç seti**

**Kolaylaştırıcılar İçin:**
- **Eğitmen Kılavuzu**: [Atölye Kolaylaştırma Kılavuzu](workshop/docs/instructor-guide.md) - Oturum planlama ve sunum ipuçları
- **Sunum Malzemeleri**: Slaytlar, mimari diyagramlar ve demo senaryoları
- **Değerlendirme Araçları**: Pratik egzersizler, bilgi kontrolleri ve değerlendirme kriterleri
- **Teknik Kurulum**: Ortam yapılandırması, sorun giderme kılavuzları ve yedek planlar

**Öğrenciler İçin:**
- **Etkileşimli Atölye Ortamı**: [Atölye Malzemeleri](workshop/README.md) - Tarayıcı tabanlı öğrenme platformu
- **Adım Adım Talimatlar**: [Yönlendirilmiş Egzersizler](../../workshop/docs/instructions) - Ayrıntılı uygulama kılavuzları  
- **Referans Belgeleri**: [AI Atölye Laboratuvarı](docs/ai-foundry/ai-workshop-lab.md) - AI odaklı derinlemesine incelemeler
- **Topluluk Kaynakları**: Azure Discord kanalları, GitHub tartışmaları ve uzman desteği

#### 🏢 Kurumsal Atölye Uygulaması
**Kurumsal dağıtım ve eğitim stratejileri**

**Kurumsal Eğitim Programları:**
- **Geliştirici Oryantasyonu**: AZD temelleriyle yeni işe alım eğitimi (2-4 hafta)
- **Ekip Becerilerini Geliştirme**: Mevcut geliştirme ekipleri için üç aylık atölyeler (1-2 gün)
- **Mimari İnceleme**: Kıdemli mühendisler ve mimarlar için aylık oturumlar (4 saat)
- **Liderlik Brifingleri**: Teknik karar vericiler için yönetici atölyeleri (yarım gün)

**Uygulama Desteği:**
- **Özel Atölye Tasarımı**: Belirli kurumsal ihtiyaçlar için özelleştirilmiş içerik
- **Pilot Program Yönetimi**: Başarı ölçütleri ve geri bildirim döngüleriyle yapılandırılmış uygulama
- **Sürekli Mentorluk**: Proje uygulaması için atölye sonrası destek
- **Topluluk Oluşturma**: Dahili Azure AI geliştirici toplulukları ve bilgi paylaşımı

**Başarı Ölçütleri:**
- **Beceri Kazanımı**: Teknik yeterlilik büyümesini ölçen ön/son değerlendirmeler
- **Dağıtım Başarısı**: Üretim uygulamalarını başarıyla dağıtan katılımcı yüzdesi
- **Verimlilik Süresi**: Yeni Azure AI projeleri için azaltılmış oryantasyon süresi
- **Bilgi Tutma**: Atölyeden 3-6 ay sonra yapılan takip değerlendirmeleri

## 8 Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel ve Hızlı Başlangıç (30-45 dakika) 🌱
**Ön Koşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Zorluk Seviyesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temel kavramlarını anlama
- AZD'yi platformunuza kurma  
- İlk başarılı dağıtımınız
- Temel kavramlar ve terminoloji

#### Öğrenme Kaynakları
- [AZD Temelleri](docs/getting-started/azd-basics.md) - Temel kavramlar
- [Kurulum ve Ayar](docs/getting-started/installation.md) - Platforma özel kılavuzlar
- [İlk Projeniz](docs/getting-started/first-project.md) - Uygulamalı eğitim
- [Komut Hızlı Referansı](resources/cheat-sheet.md) - Hızlı başvuru

#### Pratik Sonuç
AZD kullanarak Azure'a basit bir web uygulaması başarıyla dağıtın

---

### Bölüm 2: AI-Öncelikli Geliştirme (1-2 saat) 🤖
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Microsoft Foundry entegrasyonu
- AI destekli uygulamaları dağıtma
- AI hizmet yapılandırmalarını anlama
- RAG (Retrieval-Augmented Generation) modelleri

#### Öğrenme Kaynakları
- [Microsoft Foundry Entegrasyonu](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Dağıtımı](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Atölye Laboratuvarı](docs/microsoft-foundry/ai-workshop-lab.md) - **YENİ**: Kapsamlı 2-3 saatlik uygulamalı laboratuvar
- [Etkileşimli Atölye Kılavuzu](workshop/README.md) - **YENİ**: MkDocs önizlemesiyle tarayıcı tabanlı atölye
- [Microsoft Foundry Şablonları](README.md#featured-microsoft-foundry-templates)
- [Atölye Talimatları](../../workshop/docs/instructions) - **YENİ**: Adım adım yönlendirilmiş egzersizler

#### Pratik Sonuç
RAG özelliklerine sahip AI destekli bir sohbet uygulaması dağıtın ve yapılandırın

#### Atölye Öğrenme Yolu (İsteğe Bağlı Geliştirme)
**YENİ Etkileşimli Deneyim**: [Tam Atölye Kılavuzu](workshop/README.md)
1. **Keşif** (30 dk): Şablon seçimi ve değerlendirme
2. **Dağıtım** (45 dk): AI şablon işlevselliğini dağıtma ve doğrulama  
3. **Ayrıştırma** (30 dk): Şablon mimarisini ve bileşenlerini anlama
4. **Yapılandırma** (30 dk): Ayarları ve parametreleri özelleştirme
5. **Özelleştirme** (45 dk): Değiştirin ve kendinize göre uyarlayın
6. **Temizleme** (15 dk): Kaynakları temizleme ve yaşam döngüsünü anlama
7. **Kapanış** (15 dk): Sonraki adımlar ve ileri düzey öğrenme yolları

---

### Bölüm 3: Yapılandırma ve Kimlik Doğrulama (45-60 dakika) ⚙️
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu
- Çoklu ortam dağıtımları

#### Öğrenme Kaynakları
- [Yapılandırma Kılavuzu](docs/getting-started/configuration.md) - Ortam kurulumu
- [Kimlik Doğrulama ve Güvenlik Modelleri](docs/getting-started/authsecurity.md) - Yönetilen kimlik ve Key Vault entegrasyonu
- Çoklu ortam örnekleri

#### Pratik Sonuç
Doğru kimlik doğrulama ve güvenlikle birden fazla ortamı yönetin

---

### Bölüm 4: Kod Olarak Altyapı ve Dağıtım (1-1.5 saat) 🏗️
**Ön Koşullar**: Bölüm 1-3 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri düzey dağıtım modelleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri
- Özel şablon oluşturma

- AZD ile Azure Container Apps kullanarak konteynerli uygulama dağıtımı

#### Öğrenme Kaynakları
- [Dağıtım Kılavuzu](docs/deployment/deployment-guide.md) - Tam iş akışları
- [Kaynak Sağlama](docs/deployment/provisioning.md) - Kaynak yönetimi
- Konteyner ve mikro hizmet örnekleri
- [Konteyner Uygulama Örnekleri](examples/container-app/README.md) - Hızlı başlangıç, üretim ve ileri düzey dağıtım modelleri

#### Pratik Sonuç
Özel altyapı şablonları kullanarak karmaşık çoklu hizmet uygulamaları dağıtın

---

### Bölüm 5: Çoklu Ajan AI Çözümleri (2-3 saat) 🤖🤖
**Ön Koşullar**: Bölüm 1-2 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari modelleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır AI dağıtımları
- Müşteri ve Envanter ajan uygulamaları

- Ajan tabanlı çözümlerin bir parçası olarak konteynerli mikro hizmetleri entegre etme

#### Öğrenme Kaynakları
- [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- [ARM
Dağıtımları gerçekleştirmeden önce doğrulayın ve optimize edin

---

### Bölüm 7: Sorun Giderme ve Hata Ayıklama (1-1.5 saat) 🔧
**Ön Koşullar**: Herhangi bir dağıtım bölümü tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yöntemleri
- Yaygın sorunlar ve çözümleri
- AI'ye özgü sorun giderme
- Performans optimizasyonu

#### Öğrenme Kaynakları
- [Yaygın Sorunlar](docs/troubleshooting/common-issues.md) - SSS ve çözümler
- [Hata Ayıklama Kılavuzu](docs/troubleshooting/debugging.md) - Adım adım stratejiler
- [AI'ye Özgü Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md) - AI hizmeti problemleri

#### Pratik Sonuç
Yaygın dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün

---

### Bölüm 8: Üretim ve Kurumsal Kalıplar (2-3 saat) 🏢
**Ön Koşullar**: Bölüm 1-4 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik kalıpları
- İzleme ve maliyet optimizasyonu
- Ölçeklenebilirlik ve yönetişim

- Üretim ortamında konteyner uygulama dağıtımı için en iyi uygulamalar (güvenlik, izleme, maliyet, CI/CD)

#### Öğrenme Kaynakları
- [Üretim AI En İyi Uygulamalar](docs/microsoft-foundry/production-ai-practices.md) - Kurumsal kalıplar
- Mikro hizmetler ve kurumsal örnekler
- İzleme ve yönetişim çerçeveleri
- [Mikro Hizmetler Mimari Örneği](../../examples/container-app/microservices) - Blue-green/canary dağıtımı, dağıtılmış izleme ve maliyet optimizasyonu

#### Pratik Sonuç
Tam üretim yeteneklerine sahip kurumsal uygulamalar dağıtın

---

## Öğrenme İlerlemesi ve Zorluk Seviyesi

### Kademeli Beceri Geliştirme

- **🌱 Başlangıç Seviyesi**: Bölüm 1 (Temel) → Bölüm 2 (AI Geliştirme)
- **🔧 Orta Seviye**: Bölüm 3-4 (Konfigürasyon ve Altyapı) → Bölüm 6 (Doğrulama)
- **🚀 İleri Seviye**: Bölüm 5 (Çoklu Ajan Çözümleri) → Bölüm 7 (Sorun Giderme)
- **🏢 Kurumsal**: Tüm bölümleri tamamlayın, Bölüm 8'e odaklanın (Üretim Kalıpları)

- **Konteyner Uygulama Yolu**: Bölüm 4 (Konteynerleştirilmiş dağıtım), Bölüm 5 (Mikro hizmet entegrasyonu), Bölüm 8 (Üretim en iyi uygulamaları)

### Zorluk Göstergeleri

- **⭐ Temel**: Tek kavramlar, rehberli eğitimler, 30-60 dakika
- **⭐⭐ Orta**: Birden fazla kavram, uygulamalı pratik, 1-2 saat  
- **⭐⭐⭐ İleri**: Karmaşık mimariler, özel çözümler, 1-3 saat
- **⭐⭐⭐⭐ Uzman**: Üretim sistemleri, kurumsal kalıplar, 2-4 saat

### Esnek Öğrenme Yolları

#### 🎯 AI Geliştirici Hızlı Yol (4-6 saat)
1. **Bölüm 1**: Temel ve Hızlı Başlangıç (45 dakika)
2. **Bölüm 2**: AI-Öncelikli Geliştirme (2 saat)  
3. **Bölüm 5**: Çoklu Ajan AI Çözümleri (3 saat)
4. **Bölüm 8**: Üretim AI En İyi Uygulamalar (1 saat)

#### 🛠️ Altyapı Uzmanı Yolu (5-7 saat)
1. **Bölüm 1**: Temel ve Hızlı Başlangıç (45 dakika)
2. **Bölüm 3**: Konfigürasyon ve Kimlik Doğrulama (1 saat)
3. **Bölüm 4**: Kod Olarak Altyapı ve Dağıtım (1.5 saat)
4. **Bölüm 6**: Dağıtım Öncesi Doğrulama ve Planlama (1 saat)
5. **Bölüm 7**: Sorun Giderme ve Hata Ayıklama (1.5 saat)
6. **Bölüm 8**: Üretim ve Kurumsal Kalıplar (2 saat)

#### 🎓 Tam Öğrenme Yolculuğu (8-12 saat)
Tüm 8 bölümü sırasıyla tamamlayarak uygulamalı pratik ve doğrulama

## Kurs Tamamlama Çerçevesi

### Bilgi Doğrulama
- **Bölüm Kontrol Noktaları**: Ölçülebilir sonuçlarla pratik egzersizler
- **Uygulamalı Doğrulama**: Her bölüm için çalışan çözümler dağıtın
- **İlerleme Takibi**: Görsel göstergeler ve tamamlama rozetleri
- **Topluluk Doğrulaması**: Azure Discord kanallarında deneyimlerinizi paylaşın

### Öğrenme Sonuçları Değerlendirmesi

#### Bölüm 1-2 Tamamlama (Temel + AI)
- ✅ AZD kullanarak temel web uygulaması dağıtımı
- ✅ RAG ile AI destekli sohbet uygulaması dağıtımı
- ✅ AZD temel kavramlarını ve AI entegrasyonunu anlama

#### Bölüm 3-4 Tamamlama (Konfigürasyon + Altyapı)  
- ✅ Çoklu ortam dağıtımlarını yönetme
- ✅ Özel Bicep altyapı şablonları oluşturma
- ✅ Güvenli kimlik doğrulama kalıplarını uygulama

#### Bölüm 5-6 Tamamlama (Çoklu Ajan + Doğrulama)
- ✅ Karmaşık çoklu ajan AI çözümü dağıtımı
- ✅ Kapasite planlama ve maliyet optimizasyonu gerçekleştirme
- ✅ Otomatik dağıtım öncesi doğrulama uygulama

#### Bölüm 7-8 Tamamlama (Sorun Giderme + Üretim)
- ✅ Dağıtım sorunlarını bağımsız olarak hata ayıklama ve çözme  
- ✅ Kurumsal düzeyde izleme ve güvenlik uygulama
- ✅ Yönetişim ile üretim hazır uygulamalar dağıtımı

### Sertifikasyon ve Tanınma
- **Kurs Tamamlama Rozeti**: Tüm 8 bölümü pratik doğrulama ile tamamlayın
- **Topluluk Tanınması**: Microsoft Foundry Discord'da aktif katılım
- **Profesyonel Gelişim**: Endüstriyle ilgili AZD ve AI dağıtım becerileri
- **Kariyer İlerlemesi**: Kurumsal düzeyde bulut dağıtım yetenekleri

## 🎓 Kapsamlı Öğrenme Sonuçları

### Temel Seviye (Bölüm 1-2)
Temel bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- AZD komutlarını kullanarak Azure'a basit web uygulamaları dağıtma
- RAG özellikleriyle AI destekli sohbet uygulamaları yapılandırma ve dağıtma
- AZD temel kavramlarını anlama: şablonlar, ortamlar, sağlama iş akışları
- Microsoft Foundry hizmetlerini AZD dağıtımlarıyla entegre etme
- Azure AI hizmet yapılandırmalarını ve API uç noktalarını gezinme

**Profesyonel Beceriler:**
- Tutarlı sonuçlar için yapılandırılmış dağıtım iş akışlarını takip etme
- Günlükler ve belgeler kullanarak temel dağıtım sorunlarını giderme
- Bulut dağıtım süreçleri hakkında etkili iletişim kurma
- Güvenli AI hizmet entegrasyonu için en iyi uygulamaları uygulama

**Öğrenme Doğrulaması:**
- ✅ `todo-nodejs-mongo` şablonunu başarıyla dağıtma
- ✅ `azure-search-openai-demo` ile RAG yapılandırma ve dağıtma
- ✅ Etkileşimli atölye çalışması egzersizlerini tamamlama (Keşif aşaması)
- ✅ Azure Discord topluluğu tartışmalarına katılma

### Orta Seviye (Bölüm 3-4)
Orta seviye bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- Çoklu ortam dağıtımlarını yönetme (geliştirme, test, üretim)
- Kod olarak altyapı için özel Bicep şablonları oluşturma
- Yönetilen kimlik ile güvenli kimlik doğrulama kalıplarını uygulama
- Özel yapılandırmalarla karmaşık çoklu hizmet uygulamaları dağıtma
- Maliyet ve performans için kaynak sağlama stratejilerini optimize etme

**Profesyonel Beceriler:**
- Ölçeklenebilir altyapı mimarileri tasarlama
- Bulut dağıtımları için güvenlik en iyi uygulamalarını uygulama
- Takım iş birliği için altyapı kalıplarını belgeleme
- Gereksinimler için uygun Azure hizmetlerini değerlendirme ve seçme

**Öğrenme Doğrulaması:**
- ✅ Ortama özgü ayarlarla ayrı ortamlar yapılandırma
- ✅ Çoklu hizmet uygulaması için özel Bicep şablonu oluşturma ve dağıtma
- ✅ Güvenli erişim için yönetilen kimlik kimlik doğrulaması uygulama
- ✅ Gerçek senaryolarla yapılandırma yönetimi egzersizlerini tamamlama

### İleri Seviye (Bölüm 5-6)
İleri seviye bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- Koordine iş akışlarıyla çoklu ajan AI çözümleri dağıtma ve düzenleme
- Perakende senaryoları için Müşteri ve Envanter ajan mimarilerini uygulama
- Kapsamlı kapasite planlama ve kaynak doğrulama gerçekleştirme
- Otomatik dağıtım öncesi doğrulama ve optimizasyon gerçekleştirme
- İş yükü gereksinimlerine dayalı maliyet etkin SKU seçimleri tasarlama

**Profesyonel Beceriler:**
- Üretim ortamları için karmaşık AI çözümleri tasarlama
- AI dağıtım stratejileri hakkında teknik tartışmalara liderlik etme
- AZD ve AI dağıtım en iyi uygulamalarında genç geliştiricilere mentorluk yapma
- İş gereksinimleri için AI mimari kalıplarını değerlendirme ve önerme

**Öğrenme Doğrulaması:**
- ✅ ARM şablonlarıyla tam perakende çoklu ajan çözümü dağıtma
- ✅ Ajan koordinasyonu ve iş akışı düzenlemesini gösterme
- ✅ Gerçek kaynak kısıtlamalarıyla kapasite planlama egzersizlerini tamamlama
- ✅ Otomatik ön kontrol doğrulama ile dağıtım hazırlığını doğrulama

### Uzman Seviye (Bölüm 7-8)
Uzman bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- Karmaşık dağıtım sorunlarını bağımsız olarak teşhis etme ve çözme
- Kurumsal düzeyde güvenlik kalıpları ve yönetişim çerçeveleri uygulama
- Kapsamlı izleme ve uyarı stratejileri tasarlama
- Ölçek, maliyet ve performans için üretim dağıtımlarını optimize etme
- Uygun test ve doğrulama ile CI/CD boru hatları oluşturma

**Profesyonel Beceriler:**
- Kurumsal bulut dönüşüm girişimlerine liderlik etme
- Kurumsal dağıtım standartlarını tasarlama ve uygulama
- Geliştirme ekiplerini ileri düzey AZD uygulamalarında eğitme ve mentorluk yapma
- Kurumsal AI dağıtımları için teknik karar alma süreçlerini etkileme

**Öğrenme Doğrulaması:**
- ✅ Karmaşık çoklu hizmet dağıtım hatalarını çözme
- ✅ Uyumluluk gereksinimleriyle kurumsal güvenlik kalıplarını uygulama
- ✅ Application Insights ile üretim izleme tasarlama ve dağıtma
- ✅ Kurumsal yönetişim çerçevesi uygulamasını tamamlama

## 🎯 Kurs Tamamlama Sertifikası

### İlerleme Takibi Çerçevesi
Öğrenme ilerlemenizi yapılandırılmış kontrol noktalarıyla takip edin:

- [ ] **Bölüm 1**: Temel ve Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI-Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Konfigürasyon ve Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod Olarak Altyapı ve Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajan AI Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtım Öncesi Doğrulama ve Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme ve Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim ve Kurumsal Kalıplar ✅

### Doğrulama Süreci
Her bölümü tamamladıktan sonra bilginizi şu şekilde doğrulayın:

1. **Pratik Egzersiz Tamamlama**: Her bölüm için çalışan çözümler dağıtın
2. **Bilgi Değerlendirme**: SSS bölümlerini gözden geçirin ve öz değerlendirmeleri tamamlayın
3. **Topluluk Katılımı**: Deneyimlerinizi paylaşın ve Azure Discord'da geri bildirim alın
4. **Portföy Geliştirme**: Dağıtımlarınızı ve öğrendiklerinizi belgeleyin
5. **Eş Değerlendirme**: Karmaşık senaryolar üzerinde diğer katılımcılarla iş birliği yapın

### Kurs Tamamlama Faydaları
Tüm bölümleri doğrulama ile tamamlayan mezunlar şunlara sahip olacak:

**Teknik Uzmanlık:**
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure ortamlarına dağıttı
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım ve sorun giderme yetenekleri  
- **Mimari Bilgi**: Çoklu ajan AI çözümleri ve karmaşık altyapı kalıpları
- **Sorun Giderme Uzmanlığı**: Dağıtım ve yapılandırma sorunlarını bağımsız olarak çözme

**Profesyonel Gelişim:**
- **Endüstri Tanınması**: Yüksek talep gören AZD ve AI dağıtım alanlarında doğrulanabilir beceriler
- **Kariyer İlerlemesi**: Bulut mimarı ve AI dağıtım uzmanı rolleri için nitelikler
- **Topluluk Liderliği**: Azure geliştirici ve AI topluluklarında aktif üyelik
- **Sürekli Öğrenme**: Microsoft Foundry uzmanlaşması için temel

**Portföy Varlıkları:**
- **Dağıtılmış Çözümler**: AI uygulamaları ve altyapı kalıplarının çalışan örnekleri
- **Dokümantasyon**: Kapsamlı dağıtım kılavuzları ve sorun giderme prosedürleri  
- **Topluluk Katkıları**: Azure topluluğu ile paylaşılan tartışmalar, örnekler ve iyileştirmeler
- **Profesyonel Ağ**: Azure uzmanları ve AI dağıtım uygulayıcıları ile bağlantılar

### Kurs Sonrası Öğrenme Yolu
Mezunlar şu alanlarda ileri düzey uzmanlaşmaya hazırdır:
- **Microsoft Foundry Uzmanı**: AI model dağıtımı ve düzenlemesinde derin uzmanlaşma
- **Bulut Mimari Liderliği**: Kurumsal ölçekli dağıtım tasarımı ve yönetişim
- **Geliştirici Topluluğu Liderliği**: Azure örneklerine ve topluluk kaynaklarına katkı sağlama
- **Kurumsal Eğitim**: AZD ve AI dağıtım becerilerini organizasyonlarda öğretme

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->