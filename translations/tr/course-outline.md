# Başlangıç Seviyesi AZD: Kurs Taslağı ve Öğrenme Çerçevesi

## Kurs Genel Bakışı

Kademeli öğrenme için yapılandırılmış bölümler aracılığıyla Azure Developer CLI (azd) ustalığı kazanın. **Microsoft Foundry entegrasyonu ile AI uygulama dağıtımına özel odaklanma.**

### Modern Geliştiriciler için Bu Kurs Neden Önemlidir

AI yükünü dağıtan geliştiriciler genellikle aşağıdaki konularda rehberliğe ihtiyaç duyar:
- Karmaşık çok servisli AI mimarileri
- Üretim AI dağıtım en iyi uygulamaları  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI’ye özgü dağıtım sorunlarının giderilmesi

### Temel Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerini Öğrenin**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: Microsoft Foundry hizmetleri ile AZD kullanımı
- **Altyapı Kod olarak Uygulayın**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtımları Giderin**: Yaygın sorunları çözün ve hata ayıklayın
- **Üretim için Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Oluşturun**: Karmaşık AI mimarilerini dağıtın

## 🎓 Atölye Öğrenme Deneyimi

### Esnek Öğrenim Sunum Seçenekleri
Bu kurs, **kendi hızınızda bireysel öğrenmeyi** ve **yardımlı atölye oturumlarını** destekleyecek şekilde tasarlanmıştır; katılımcılar etkileşimli egzersizlerle pratik beceriler kazanarak AZD ile uygulamalı deneyim elde ederler.

#### 🚀 Kendi Hızınızda Öğrenme Modu
**Bireysel geliştiriciler ve sürekli öğrenme için ideal**

**Özellikler:**
- **Tarayıcı Tabanlı Arayüz**: Herhangi bir web tarayıcısıyla erişilebilen MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Önden yapılandırılmış araçlarla tek tıklamalı geliştirme ortamı
- **Etkileşimli DevContainer Ortamı**: Yerel kurulum gerektirmez - hemen kodlamaya başlayın
- **İlerleme Takibi**: Yerleşik kontrol noktaları ve doğrulama egzersizleri
- **Topluluk Desteği**: Sorular ve işbirliği için Azure Discord kanalları erişimi

**Öğrenme Yapısı:**
- **Esnek Zamanlama**: Bölümleri günler veya haftalar içinde kendi hızınızda tamamlayın
- **Kontrol Noktası Sistemi**: Karmaşık konulara geçmeden önce öğrenmeyi doğrulayın
- **Kaynak Kütüphanesi**: Kapsamlı dokümantasyon, örnekler ve sorun giderme rehberleri
- **Portföy Geliştirme**: Profesyonel portföyler için dağıtılabilir projeler oluşturun

**Başlangıç (Kendi Hızınızda):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Yardımlı Atölye Oturumları
**Kurumsal eğitim, bootcamp ve eğitim kurumları için ideal**

**Atölye Format Seçenekleri:**

**📚 Akademik Kurs Entegrasyonu (8-12 hafta)**
- **Üniversite Programları**: Haftada 2 saatlik oturumlarla dönemlik kurs
- **Bootcamp Formatı**: Günlük 6-8 saatlik oturumlarla yoğun 3-5 günlük program
- **Kurumsal Eğitim**: Aylık ekip oturumları ve pratik proje uygulaması
- **Değerlendirme Çerçevesi**: Notlandırılmış ödevler, eş değerlendirmeler ve final projeleri

**🚀 Yoğun Atölye (1-3 gün)**
- **1. Gün**: Temel + AI geliştirme (Bölümler 1-2) - 6 saat
- **2. Gün**: Yapılandırma + Altyapı (Bölümler 3-4) - 6 saat  
- **3. Gün**: İleri Desenler + Üretim (Bölümler 5-8) - 8 saat
- **Takip**: Proje tamamlanması için isteğe bağlı 2 haftalık mentorluk

**⚡ Yöneticilere Özet (4-6 saat)**
- **Stratejik Genel Bakış**: AZD değer önerisi ve iş etkisi (1 saat)
- **Uygulamalı Demo**: AI uygulamasını baştan sona dağıtım (2 saat)
- **Mimari İnceleme**: Kurumsal desenler ve yönetişim (1 saat)
- **Uygulama Planlaması**: Kurumsal benimseme stratejisi (1-2 saat)

#### 🛠️ Atölye Öğrenme Metodolojisi
**Keşif → Dağıtım → Özelleştirme yaklaşımıyla uygulamalı beceri geliştirme**

**Aşama 1: Keşif (45 dakika)**
- **Şablon İncelemesi**: Microsoft Foundry şablonlarını ve hizmetlerini değerlendirin
- **Mimari Analizi**: Çoklu ajan desenlerini ve dağıtım stratejilerini anlayın
- **Gereksinim Değerlendirmesi**: Kurumsal ihtiyaçları ve kısıtlamaları belirleyin
- **Ortam Kurulumu**: Geliştirme ortamını ve Azure kaynaklarını yapılandırın

**Aşama 2: Dağıtım (2 saat)**
- **Rehberli Uygulama**: AZD ile AI uygulamalarını adım adım dağıtın
- **Hizmet Yapılandırması**: Azure AI hizmetleri, uç noktalar ve kimlik doğrulamayı yapılandırın
- **Güvenlik Uygulaması**: Kurumsal güvenlik desenleri ve erişim denetimleri uygulayın
- **Doğrulama Testi**: Dağıtımları doğrulayın ve yaygın sorunları giderin

**Aşama 3: Özelleştirme (45 dakika)**
- **Uygulama Değişikliği**: Şablonları özel kullanım durumları ve gereksinimlere uyarlayın
- **Üretim Optimizasyonu**: İzleme, maliyet yönetimi ve ölçeklendirme stratejileri uygulayın
- **İleri Desenler**: Çoklu ajan koordinasyonu ve karmaşık mimarileri keşfedin
- **Sonraki Adımlar Planlama**: Sürekli beceri geliştirme için öğrenme yolunu tanımlayın

#### 🎯 Atölye Öğrenme Çıktıları
**Uygulamalı pratikle geliştirilen ölçülebilir beceriler**

**Teknik Yetkinlikler:**
- **Üretim AI Uygulamaları Dağıtımı**: AI destekli çözümleri başarıyla dağıtma ve yapılandırma
- **Altyapıyı Kod Olarak Yönetme Uzmanlığı**: Özel Bicep şablonları oluşturma ve yönetme
- **Çoklu Ajan Mimarisi**: Koordine AI ajan çözümleri uygulama
- **Üretime Hazırlık**: Güvenlik, izleme ve yönetişim desenlerini uygulama
- **Sorun Giderme Uzmanlığı**: Dağıtım ve yapılandırma sorunlarını bağımsız çözme

**Profesyonel Beceriler:**
- **Proje Liderliği**: Bulut dağıtım girişimlerinde teknik ekipleri yönetme
- **Mimari Tasarım**: Ölçeklenebilir, maliyet etkin Azure çözümleri tasarlama
- **Bilgi Transferi**: Meslektaşları AZD en iyi uygulamalarında eğitme ve mentorluk yapma
- **Stratejik Planlama**: Kurumsal bulut benimseme stratejilerini etkileyebilme

#### 📋 Atölye Kaynakları ve Materyalleri
**Kolaylaştırıcılar ve katılımcılar için kapsamlı araç seti**

**Kolaylaştırıcılar için:**
- **Eğitmen Kılavuzu**: [Atölye Genel Bakışı](workshop/README.md) - Oturum planlama ve sunum rehberi
- **Sunum Materyalleri**: Slaytlar, mimari diyagramlar ve demo betikleri
- **Değerlendirme Araçları**: Pratik egzersizler, bilgi kontrolleri ve değerlendirme kriterleri
- **Teknik Kurulum**: Ortam yapılandırması, sorun giderme rehberleri ve yedekleme planları

**Katılımcılar için:**
- **Etkileşimli Atölye Ortamı**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme platformu
- **Adım Adım Talimatlar**: [Rehberli Egzersizler](../../workshop/docs/instructions) - Ayrıntılı uygulama adımları  
- **Referans Dokümantasyonu**: [AI Atölyesi Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı derinlemesine incelemeler
- **Topluluk Kaynakları**: Azure Discord kanalları, GitHub tartışmaları ve uzman desteği

#### 🏢 Kurumsal Atölye Uygulaması
**Kurumsal dağıtım ve eğitim stratejileri**

**Kurumsal Eğitim Programları:**
- **Geliştirici Oryantasyonu**: Yeni çalışanlara AZD temelleri eğitimi (2-4 hafta)
- **Ekip Beceri Geliştirme**: Mevcut geliştirme ekipleri için üç aylık atölyeler (1-2 gün)
- **Mimari İnceleme**: Kıdemli mühendis ve mimar oturumları (ayda 4 saat)
- **Liderlik Bilgilendirmeleri**: Teknik karar vericiler için yarım günlük yöneticilere atölye

**Uygulama Desteği:**
- **Özel Atölye Tasarımı**: Belirli kurumsal ihtiyaçlara özel içerikler
- **Pilot Program Yönetimi**: Başarı ölçütleri ve geri bildirim döngüleri ile yapılandırılmış uygulama  
- **Sürekli Mentorluk**: Atölye sonrası proje uygulama desteği
- **Topluluk Oluşturma**: Kurumsal Azure AI geliştirici toplulukları ve bilgi paylaşımı

**Başarı Ölçütleri:**
- **Beceri Edinimi**: Teknik yetkinlik artışını ölçmek için ön/son değerlendirmeler
- **Dağıtım Başarısı**: Katılımcıların üretim uygulamalarını başarıyla dağıtma oranı
- **Verimlilik Süresi**: Yeni Azure AI projeleri için oryantasyon süresinin kısaltılması
- **Bilgi Tutma**: Atölye sonrası 3-6 aylık takip değerlendirmeleri

## 8 Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel ve Hızlı Başlangıç (30-45 dakika) 🌱
**Ön Koşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Zorluk Derecesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temellerini anlama
- AZD'nin platformunuza kurulumu  
- İlk başarılı dağıtımınız
- Temel kavramlar ve terimler

#### Öğrenme Kaynakları
- [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar
- [Kurulum ve Ayar](docs/chapter-01-foundation/installation.md) - Platforma özgü rehberler
- [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Pratik atölye
- [Komut Hızlı Başvuru](resources/cheat-sheet.md) - Hızlı referans

#### Pratik Sonuç
Basit bir web uygulamasını AZD kullanarak Azure’a başarılı şekilde dağıtın

---

### Bölüm 2: AI-Öncelikli Geliştirme (1-2 saat) 🤖
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Zorluk Derecesi**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Microsoft Foundry entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI hizmeti yapılandırmalarını anlama
- RAG (Retrieval-Augmented Generation) desenleri

#### Öğrenme Kaynakları
- [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI Atölyesi Laboratuvarı](docs/chapter-02-ai-development/ai-workshop-lab.md) - **YENİ**: Kapsamlı 2-3 saatlik uygulamalı lab
- [Etkileşimli Atölye Kılavuzu](workshop/README.md) - **YENİ**: MkDocs önizlemeli tarayıcı tabanlı atölye
- [Microsoft Foundry Şablonları](README.md#featured-microsoft-foundry-templates)
- [Atölye Talimatları](../../workshop/docs/instructions) - **YENİ**: Adım adım rehberli egzersizler

#### Pratik Sonuç
RAG özellikli AI destekli sohbet uygulamasını dağıtın ve yapılandırın

#### Atölye Öğrenme Yolu (İsteğe Bağlı Geliştirme)
**YENİ Etkileşimli Deneyim**: [Tam Atölye Kılavuzu](workshop/README.md)
1. **Keşif** (30 dk): Şablon seçimi ve değerlendirme
2. **Dağıtım** (45 dk): AI şablon işlevselliğini dağıtıp doğrulama  
3. **Analiz** (30 dk): Şablon mimarisi ve bileşenlerini anlama
4. **Yapılandırma** (30 dk): Ayar ve parametreleri özelleştirme
5. **Özelleştirme** (45 dk): Şablonu değiştirip kendinize göre uyarlama
6. **Temizlik** (15 dk): Kaynakları temizleyip yaşam döngüsünü anlama
7. **Özet** (15 dk): Sonraki adımlar ve ileri öğrenme yolları

---

### Bölüm 3: Yapılandırma ve Kimlik Doğrulama (45-60 dakika) ⚙️
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Zorluk Derecesi**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyon
- Çoklu ortam dağıtımları

#### Öğrenme Kaynakları
- [Yapılandırma Kılavuzu](docs/chapter-03-configuration/configuration.md) - Ortam ayarı
- [Kimlik Doğrulama & Güvenlik Desenleri](docs/chapter-03-configuration/authsecurity.md) - Yönetilen kimlik ve Key Vault entegrasyonu
- Çoklu ortam örnekleri

#### Pratik Sonuç
Doğru kimlik doğrulama ve güvenlik ile birden çok ortamı yönetin

---

### Bölüm 4: Altyapı Kod olarak & Dağıtım (1-1.5 saat) 🏗️
**Ön Koşullar**: Bölümler 1-3 tamamlandı  
**Zorluk Derecesi**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri dağıtım desenleri
- Bicep ile altyapı kodu
- Kaynak sağlama stratejileri
- Özel şablon oluşturma

- Azure Container Apps ve AZD ile konteyner uygulama dağıtımı

#### Öğrenme Kaynakları
- [Dağıtım Kılavuzu](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) - Kaynak yönetimi
- Konteyner ve mikroservis örnekleri
- [Container App Örnekleri](examples/container-app/README.md) - Hızlı başlangıç, üretim ve ileri dağıtım desenleri

#### Pratik Sonuç
Özel altyapı şablonları kullanarak karmaşık çok servisli uygulamalar dağıtın

---

### Bölüm 5: Çoklu Ajan AI Çözümleri (2-3 saat) 🤖🤖
**Ön Koşullar**: Bölümler 1-2 tamamlandı  
**Zorluk Derecesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır AI dağıtımları
- Müşteri ve Envanter ajan uygulamaları

- Ajan tabanlı çözümlerde konteynerleştirilmiş mikroservislerin entegrasyonu

#### Öğrenme Kaynakları
- [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Mimari taslak, tam uygulama değil
- [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Uygulama önkoşulları ile altyapı iskeleti
- Çoklu ajan koordinasyon desenleri
- [Mikroservis Mimari Örneği](../../examples/container-app/microservices) - Servisten servise iletişim, asenkron mesajlaşma ve üretim dağıtımı

#### Pratik Sonuç
Çoklu ajan AI çözümü tasarlayın ve uygulama, doğrulama ve operasyonel işleri belirleyin; altyapı sağlamanın ötesinde gereklilikleri kavrayın

---

### Bölüm 6: Dağıtımdan Önce Doğrulama ve Planlama (1 saat) 🔍
**Ön Koşullar**: Bölüm 4 tamamlandı  
**Zorluk Derecesi**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlaması ve kaynak doğrulaması
- SKU seçim stratejileri
- Uçuş öncesi kontroller ve otomasyon
- Maliyet optimizasyonu planlaması

#### Öğrenme Kaynakları
- [Kapasite Planlaması](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulaması
- [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet etkin seçimler
- [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatik betikler
- [Application Insights Entegrasyonu](docs/chapter-06-pre-deployment/application-insights.md) - İzleme ve gözlemlenebilirlik
- [Çoklu Ajan Koordinasyon Desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) - Ajan orkestrasyon stratejileri

#### Pratik Sonuç
Dağıtımı uygulamadan önce doğrulayın ve optimize edin

---

### Bölüm 7: Sorun Giderme ve Hata Ayıklama (1-1.5 saat) 🔧
**Ön Koşullar**: Herhangi bir dağıtım bölümü tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- AI'ya özgü sorun giderme
- Performans optimizasyonu

#### Öğrenme Kaynakları
- [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- [Hata Ayıklama Rehberi](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- [AI'ya Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI servis problemleri

#### Pratik Sonuç
Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çözüme kavuşturmak

---

### Bölüm 8: Üretim ve Kurumsal Modeler (2-3 saat) 🏢
**Ön Koşullar**: Bölümler 1-4 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik kalıpları
- İzleme ve maliyet optimizasyonu
- Ölçeklenebilirlik ve yönetişim

- Üretim konteyner uygulaması dağıtımları için en iyi uygulamalar (güvenlik, izleme, maliyet, CI/CD)

#### Öğrenme Kaynakları
- [Üretim AI En İyi Uygulamaları](docs/chapter-08-production/production-ai-practices.md) - Kurumsal modeller
- Mikroservisler ve kurumsal örnekler
- İzleme ve yönetişim çerçeveleri
- [Mikroservis Mimari Örneği](../../examples/container-app/microservices) - Mavi-yeşil/canary dağıtımı, dağıtık izleme ve maliyet optimizasyonu

#### Pratik Sonuç
Tam üretim yeteneklerine sahip kurumsal hazır uygulamalar dağıtmak

---

## Öğrenme İlerlemesi ve Zorluk Seviyesi

### Kademeli Beceri Gelişimi

- **🌱 Yeni Başlayanlar**: 1. Bölüm (Temel) ile başlayın → 2. Bölüm (AI Geliştirme)
- **🔧 Orta Düzey**: Bölümler 3-4 (Yapılandırma & Altyapı) → 6. Bölüm (Doğrulama)
- **🚀 İleri Düzey**: 5. Bölüm (Çoklu Ajan Çözümleri) → 7. Bölüm (Sorun Giderme)
- **🏢 Kurumsal**: Tüm bölümleri tamamlayın, 8. Bölüme (Üretim Modelleri) odaklanın

- **Konteyner Uygulama Yolu**: Bölümler 4 (Konteynerli dağıtım), 5 (Mikroservis entegrasyonu), 8 (Üretim en iyi uygulamaları)

### Zorluk Seviyesi Göstergeleri

- **⭐ Temel**: Tek kavramlar, rehberli öğreticiler, 30-60 dakika
- **⭐⭐ Orta**: Birden çok kavram, uygulamalı pratik, 1-2 saat  
- **⭐⭐⭐ İleri**: Karmaşık mimariler, özel çözümler, 1-3 saat
- **⭐⭐⭐⭐ Uzman**: Üretim sistemleri, kurumsal kalıplar, 2-4 saat

### Esnek Öğrenme Yolları

#### 🎯 AI Geliştirici Hızlandırılmış Programı (4-6 saat)
1. **1. Bölüm**: Temel ve Hızlı Başlangıç (45 dk)
2. **2. Bölüm**: AI-Öncelikli Geliştirme (2 saat)  
3. **5. Bölüm**: Çoklu Ajan AI Çözümleri (3 saat)
4. **8. Bölüm**: Üretim AI En İyi Uygulamaları (1 saat)

#### 🛠️ Altyapı Uzmanı Yolu (5-7 saat)
1. **1. Bölüm**: Temel ve Hızlı Başlangıç (45 dk)
2. **3. Bölüm**: Yapılandırma ve Kimlik Doğrulama (1 saat)
3. **4. Bölüm**: Kod Olarak Altyapı ve Dağıtım (1.5 saat)
4. **6. Bölüm**: Dağıtımdan Önce Doğrulama ve Planlama (1 saat)
5. **7. Bölüm**: Sorun Giderme ve Hata Ayıklama (1.5 saat)
6. **8. Bölüm**: Üretim ve Kurumsal Modeler (2 saat)

#### 🎓 Tam Öğrenme Yolculuğu (8-12 saat)
Tüm 8 bölümün sırasıyla tamamlanması, uygulamalı pratik ve doğrulama ile

## Ders Tamamlama Çerçevesi

### Bilgi Doğrulama
- **Bölüm Kontrol Noktaları**: Ölçülebilir sonuçlu pratik egzersizler
- **Uygulamalı Doğrulama**: Her bölüm için çalışan çözümler dağıtmak
- **İlerleme Takibi**: Görsel göstergeler ve tamamlama rozetleri
- **Topluluk Doğrulaması**: Azure Discord kanallarında deneyim paylaşımı

### Öğrenme Çıktıları Değerlendirmesi

#### Bölüm 1-2 Tamamlama (Temel + AI)
- ✅ AZD kullanarak temel web uygulaması dağıtımı
- ✅ RAG destekli AI sohbet uygulaması dağıtımı
- ✅ AZD temel kavramları ve AI entegrasyonunu anlama

#### Bölüm 3-4 Tamamlama (Yapılandırma + Altyapı)  
- ✅ Çok ortamlı dağıtımları yönetme
- ✅ Özel Bicep altyapı şablonları oluşturma
- ✅ Güvenli kimlik doğrulama kalıplarını uygulama

#### Bölüm 5-6 Tamamlama (Çoklu Ajan + Doğrulama)
- ✅ Karmaşık çoklu ajan AI çözümünü dağıtma
- ✅ Kapasite planlaması ve maliyet optimizasyonu yapma
- ✅ Otomatik ön dağıtım doğrulaması uygulama

#### Bölüm 7-8 Tamamlama (Sorun Giderme + Üretim)
- ✅ Dağıtım sorunlarını bağımsız olarak hata ayıklama ve çözme  
- ✅ Kurumsal düzeyde izleme ve güvenlik uygulama
- ✅ Yönetişimle üretim hazır uygulamalar dağıtma

### Sertifikasyon ve Tanınırlık
- **Ders Tamamlama Rozeti**: Tüm 8 bölümü pratik doğrulama ile tamamlamak
- **Topluluk Tanınırlığı**: Microsoft Foundry Discord’da aktif katılım
- **Profesyonel Gelişim**: Sektöre uygun AZD ve AI dağıtım becerileri
- **Kariyer İlerlemesi**: Kurumsal düzey bulut dağıtım yetenekleri

## 🎓 Kapsamlı Öğrenme Çıktıları

### Temel Seviye (Bölümler 1-2)
Temel bölümler tamamlandığında, öğrenenler gösterir:

**Teknik Yetenekler:**
- AZD komutlarıyla basit web uygulamalarını Azure’a dağıtmak
- RAG özellikli AI destekli sohbet uygulamalarını yapılandırmak ve dağıtmak
- AZD temel kavramlarını anlamak: şablonlar, ortamlar, sağlama iş akışları
- Microsoft Foundry servislerini AZD dağıtımlarıyla entegre etmek
- Azure AI servis yapılandırmalarını ve API uç noktalarını gezinmek

**Profesyonel Beceriler:**
- Tutarlı sonuçlar için yapılandırılmış dağıtım iş akışlarını takip etmek
- Temel dağıtım sorunlarını günlükler ve dokümantasyon ile gidermek
- Bulut dağıtım süreçleri hakkında etkin iletişim kurmak
- Güvenli AI servis entegrasyonu için en iyi uygulamaları uygulamak

**Öğrenme Doğrulaması:**
- ✅ `todo-nodejs-mongo` şablonunu başarıyla dağıtmak
- ✅ RAG ile `azure-search-openai-demo`’i dağıtmak ve yapılandırmak
- ✅ Etkileşimli atölye egzersizlerini tamamlamak (Keşif aşaması)
- ✅ Azure Discord topluluk tartışmalarına katılmak

### Orta Düzey (Bölümler 3-4)
Orta düzey bölümler tamamlandığında, öğrenenler gösterir:

**Teknik Yetenekler:**
- Çok ortamlı dağıtımları yönetmek (geliştirme, önizleme, üretim)
- Kod olarak altyapı için özel Bicep şablonları oluşturmak
- Yönetilen kimlik ile güvenli kimlik doğrulama kalıplarını uygulamak
- Özel yapılandırmalarla karmaşık çok servisli uygulamalar dağıtmak
- Maliyet ve performans için kaynak sağlama stratejilerini optimize etmek

**Profesyonel Beceriler:**
- Ölçeklenebilir altyapı mimarileri tasarlamak
- Bulut dağıtımları için güvenlik en iyi uygulamalarını uygulamak
- Takım işbirliği için altyapı modellerini dokümante etmek
- Gereksinimler için uygun Azure servislerini değerlendirmek ve seçmek

**Öğrenme Doğrulaması:**
- ✅ Ortama özel ayarlarla ayrı ortamlar yapılandırmak
- ✅ Çok servisli uygulama için özel Bicep şablonu oluşturup dağıtmak
- ✅ Güvenli erişim için yönetilen kimlik kimlik doğrulaması uygulamak
- ✅ Gerçek senaryolarla yapılandırma yönetimi egzersizlerini tamamlamak

### İleri Düzey (Bölümler 5-6)
İleri düzey bölümler tamamlandığında, öğrenenler gösterir:

**Teknik Yetenekler:**
- Koordine iş akışlarıyla çoklu ajan AI çözümleri dağıtmak ve düzenlemek
- Perakende senaryoları için Müşteri ve Envanter ajan mimarileri uygulamak
- Kapsamlı kapasite planlaması ve kaynak doğrulaması yapmak
- Otomatik ön dağıtım doğrulaması ve optimizasyonu gerçekleştirmek
- İş yükü gereksinimlerine göre maliyet etkin SKU seçimi tasarlamak

**Profesyonel Beceriler:**
- Üretim ortamları için karmaşık AI çözümleri mimarisi oluşturmak
- AI dağıtım stratejileri hakkında teknik tartışmalara öncülük etmek
- AZD ve AI dağıtım en iyi uygulamalarında genç geliştiricilere mentörlük yapmak
- İş gereksinimleri için AI mimari kalıplarını değerlendirmek ve önermek

**Öğrenme Doğrulaması:**
- ✅ Perakende çoklu ajan şablonunu incelemek ve sağlanan altyapıyı eksik uygulamadan ayırt etmek
- ✅ Ajan koordinasyonu ve iş akışı düzenlemesini göstermek
- ✅ Gerçek kaynak kısıtlamalarıyla kapasite planlama egzersizlerini tamamlamak
- ✅ Otomatik ön kontrol ile dağıtım hazırlığını doğrulamak

### Uzman Seviyesi (Bölümler 7-8)
Uzman bölümler tamamlandığında, öğrenenler gösterir:

**Teknik Yetenekler:**
- Karmaşık dağıtım sorunlarını bağımsız olarak teşhis ve çözmek
- Kurumsal güvenlik kalıpları ve yönetişim çerçeveleri uygulamak
- Kapsamlı izleme ve uyarı stratejileri tasarlamak
- Üretim dağıtımlarını ölçek, maliyet ve performans için optimize etmek
- Doğru test ve doğrulama ile CI/CD boru hatları kurmak

**Profesyonel Beceriler:**
- Kurumsal bulut dönüşüm girişimlerine liderlik etmek
- Kurum içi dağıtım standartlarını tasarlamak ve uygulamak
- Geliştirme ekiplerine ileri AZD uygulamalarında eğitim ve mentörlük sağlamak
- Kurumsal AI dağıtımları için teknik karar almayı etkilemek

**Öğrenme Doğrulaması:**
- ✅ Karmaşık çok servisli dağıtım hatalarını çözmek
- ✅ Uyumluluk gereksinimlerine uygun kurumsal güvenlik kalıplarını uygulamak
- ✅ Application Insights ile üretim izlemesini tasarlamak ve dağıtmak
- ✅ Kurumsal yönetişim çerçevesi uygulamasını tamamlamak

## 🎯 Ders Tamamlama Sertifikası

### İlerleme Takip Çerçevesi
Yapılandırılmış kontrol noktaları ile öğrenme ilerlemenizi takip edin:

- [ ] **1. Bölüm**: Temel ve Hızlı Başlangıç ✅
- [ ] **2. Bölüm**: AI-Öncelikli Geliştirme ✅  
- [ ] **3. Bölüm**: Yapılandırma ve Kimlik Doğrulama ✅
- [ ] **4. Bölüm**: Kod Olarak Altyapı ve Dağıtım ✅
- [ ] **5. Bölüm**: Çoklu Ajan AI Çözümleri ✅
- [ ] **6. Bölüm**: Dağıtımdan Önce Doğrulama ve Planlama ✅
- [ ] **7. Bölüm**: Sorun Giderme ve Hata Ayıklama ✅
- [ ] **8. Bölüm**: Üretim ve Kurumsal Modeler ✅

### Doğrulama Süreci
Her bölümü tamamladıktan sonra bilginizi şu yollarla doğrulayın:

1. **Pratik Egzersiz Tamamlama**: Her bölüm için çalışan çözümler dağıtmak
2. **Bilgi Değerlendirmesi**: SSS bölümlerini gözden geçirmek ve öz değerlendirmeler yapmak
3. **Topluluk Katılımı**: Deneyimleri paylaşmak ve Azure Discord’da geri bildirim almak
4. **Portföy Geliştirme**: Dağıtımlarınızı ve edinilen dersleri belgelemek
5. **Eş Değerlendirme**: Karmaşık senaryolarda diğer öğrenenlerle işbirliği yapmak

### Ders Tamamlama Avantajları
Tüm bölümler doğrulama ile tamamlandığında, mezunlar kazanır:

**Teknik Uzmanlık:**
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure ortamlarına dağıttı
- **Profesyonel Beceriler**: Kurumsal hazır dağıtım ve sorun giderme yetenekleri  
- **Mimari Bilgi**: Çoklu ajan AI çözümleri ve karmaşık altyapı kalıpları
- **Sorun Giderme Ustalığı**: Dağıtım ve yapılandırma sorunlarını bağımsız çözme

**Profesyonel Gelişim:**
- **Sektör Tanınırlığı**: Talep gören AZD ve AI dağıtım alanlarında doğrulanabilir beceriler
- **Kariyer İlerlemesi**: Bulut mimarı ve AI dağıtım uzmanı rolleri için nitelikler
- **Topluluk Liderliği**: Azure geliştirici ve AI topluluklarında aktif üyelik
- **Sürekli Öğrenme**: İleri Microsoft Foundry uzmanlığı için temel

**Portföy Varlıkları:**
- **Dağıtılan Çözümler**: AI uygulamaları ve altyapı kalıplarının çalışan örnekleri
- **Dokümantasyon**: Kapsamlı dağıtım rehberleri ve sorun giderme prosedürleri  
- **Topluluk Katkıları**: Azure topluluğuyla paylaşılan tartışmalar, örnekler ve geliştirmeler
- **Profesyonel Ağ**: Azure uzmanları ve AI dağıtım uygulayıcıları ile bağlantılar

### Kurs Sonrası Öğrenme Yolu
Mezunlar ileri uzmanlık için hazırlanmıştır:
- **Microsoft Foundry Uzmanı**: AI model dağıtımı ve orkestrasyonda derin uzmanlık
- **Bulut Mimarlığı Liderliği**: Kurumsal ölçek dağıtım tasarımı ve yönetişim
- **Geliştirici Topluluğu Liderliği**: Azure örnekleri ve topluluk kaynaklarına katkı sağlama
- **Kurumsal Eğitim**: Kurumlarda AZD ve AI dağıtım becerileri öğretme

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->