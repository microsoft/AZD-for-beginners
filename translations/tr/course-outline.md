# Yeni Başlayanlar için AZD: Kurs İçeriği ve Öğrenme Çerçevesi

## Kurs Genel Bakışı

Azure Developer CLI (azd) hakkında yapılandırılmış bölümler aracılığıyla ilerleyerek uzmanlaşın. **Microsoft Foundry entegrasyonuyla AI uygulama dağıtımına özel odaklanma.**

### Bu Kurs Neden Modern Geliştiriciler İçin Önemlidir

Microsoft Foundry Discord topluluğu içgörülerine dayanarak, **geliştiricilerin %45’i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyorlar:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımı en iyi uygulamaları  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Temel Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerinde Uzmanlaşın**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtımı**: AZD ile Microsoft Foundry hizmetlerini kullanın
- **Kod Olarak Altyapı Uygulaması**: Azure kaynaklarını Bicep şablonlarıyla yönetin
- **Dağıtım Sorunlarını Giderme**: Yaygın sorunları çözüp hata ayıklama yapın
- **Üretim İçin Optimizasyon**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Oluşturma**: Karmaşık AI mimarilerini dağıtın

## 🎓 Atölye Öğrenme Deneyimi

### Esnek Öğrenme Sunum Seçenekleri
Bu kurs, **bireysel kendi hızında öğrenme** ve **yönlendirmeli atölye oturumları** olmak üzere her iki yöntemi de destekleyecek şekilde tasarlanmıştır. Katılımcılar, interaktif egzersizlerle pratik beceriler geliştirirken AZD'yi uygulamalı olarak deneyimlerler.

#### 🚀 Kendi Hızınızda Öğrenme Modu
**Bireysel geliştiriciler ve sürekli öğrenme için mükemmel**

**Özellikler:**
- **Tarayıcı Tabanlı Arayüz**: Herhangi bir web tarayıcısı üzerinden erişilebilen MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Önyapılandırılmış araçlarla tek tıklamayla geliştirme ortamı
- **Etkileşimli DevContainer Ortamı**: Yerel kurulum gerektirmez – hemen kodlamaya başlayın
- **İlerleme Takibi**: Dahili kontrol noktaları ve doğrulama egzersizleri
- **Topluluk Desteği**: Sorular ve iş birliği için Azure Discord kanallarına erişim

**Öğrenme Yapısı:**
- **Esnek Zamanlama**: Bölümleri günler veya haftalar boyunca kendi hızınızda tamamlayın
- **Kontrol Noktası Sistemi**: İleriye geçmeden önce öğrenmeyi doğrulayın
- **Kaynak Kütüphanesi**: Kapsamlı dokümantasyon, örnekler ve sorun giderme rehberleri
- **Portföy Geliştirme**: Profesyonel portföyler için dağıtılabilir projeler oluşturun

**Başlarken (Kendi Hızınızda):**
```bash
# Seçenek 1: GitHub Codespaces (Tavsiye Edilen)
# Depoya gidin ve "Code" → "main üzerinde codespace oluştur" seçeneğine tıklayın

# Seçenek 2: Yerel Geliştirme
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md dosyasındaki kurulum talimatlarını izleyin
```

#### 🏛️ Yönlendirmeli Atölye Oturumları
**Kurumsal eğitim, bootcamp’ler ve eğitim kurumları için ideal**

**Atölye Format Seçenekleri:**

**📚 Akademik Ders Entegrasyonu (8-12 hafta)**
- **Üniversite Programları**: Haftada 2 saatlik oturumlarla bir dönemlik ders
- **Bootcamp Formatı**: Günlük 6-8 saatlik oturumlarla yoğun 3-5 günlük program
- **Kurumsal Eğitim**: Pratik proje uygulamalı aylık ekip oturumları
- **Değerlendirme Çerçevesi**: Puanlı ödevler, akran incelemeleri ve final projeleri

**🚀 Yoğun Atölye (1-3 gün)**
- **1. Gün**: Temel + AI Geliştirme (Bölümler 1-2) - 6 saat
- **2. Gün**: Yapılandırma + Altyapı (Bölümler 3-4) - 6 saat  
- **3. Gün**: İleri Desenler + Üretim (Bölümler 5-8) - 8 saat
- **Takip**: Proje tamamlaması için isteğe bağlı 2 haftalık mentorluk

**⚡ Yönetici Brifingi (4-6 saat)**
- **Stratejik Genel Bakış**: AZD değer önerisi ve iş etkisi (1 saat)
- **Etkileşimli Demo**: AI uygulamasını uçtan uca dağıtım (2 saat)
- **Mimari İnceleme**: Kurumsal desenler ve yönetişim (1 saat)
- **Uygulama Planlama**: Organizasyonel benimseme stratejisi (1-2 saat)

#### 🛠️ Atölye Öğrenme Yöntemi
**Keşif → Dağıtım → Özelleştirme yaklaşımı ile uygulamalı beceri gelişimi**

**1. Aşama: Keşif (45 dakika)**
- **Şablon İncelemesi**: Microsoft Foundry şablonları ve hizmetlerini değerlendirin
- **Mimari Analiz**: Çoklu ajan desenleri ve dağıtım stratejilerini anlayın
- **Gereksinim Değerlendirmesi**: Kurumsal ihtiyaçlar ve kısıtlamaları belirleyin
- **Ortam Kurulumu**: Geliştirme ortamı ve Azure kaynaklarını yapılandırın

**2. Aşama: Dağıtım (2 saat)**
- **Adım Adım Uygulama**: AZD ile AI uygulamalarının kılavuzlu dağıtımı
- **Hizmet Yapılandırması**: Azure AI hizmetleri, uç noktalar ve kimlik doğrulaması
- **Güvenlik Uygulaması**: Kurumsal güvenlik desenleri ve erişim kontrolleri
- **Doğrulama Testleri**: Dağıtımları doğrulayın ve yaygın sorunları giderin

**3. Aşama: Özelleştirme (45 dakika)**
- **Uygulama Değişikliği**: Şablonları belirli kullanım durumlarına göre uyarlayın
- **Üretim Optimizasyonu**: İzleme, maliyet yönetimi ve ölçeklendirme stratejileri uygulayın
- **İleri Desenler**: Çoklu ajan koordinasyonu ve karmaşık mimarileri keşfedin
- **Gelecek Planlama**: Sürekli beceri gelişimi için öğrenme rotası belirleyin

#### 🎯 Atölye Öğrenme Sonuçları
**Uygulamalı pratikle geliştirilen ölçülebilir beceriler**

**Teknik Yetkinlikler:**
- **Üretim AI Uygulamaları Dağıtımı**: Başarıyla AI destekli çözümler dağıtın ve yapılandırın
- **Kod Olarak Altyapı Ustalığı**: Özel Bicep şablonları oluşturun ve yönetin
- **Çoklu Ajan Mimarisi**: Koordine AI ajan çözümleri uygulayın
- **Üretim Hazırlığı**: Güvenlik, izleme ve yönetişim desenlerini uygulayın
- **Sorun Giderme Uzmanlığı**: Dağıtım ve yapılandırma sorunlarını bağımsız olarak çözün

**Profesyonel Beceriler:**
- **Proje Liderliği**: Bulut dağıtım girişimlerinde teknik ekipleri yönetin
- **Mimari Tasarım**: Ölçeklenebilir, maliyet-etkin Azure çözümleri tasarlayın
- **Bilgi Transferi**: AZD en iyi uygulamalarında meslektaşları eğitin ve mentorluk yapın
- **Stratejik Planlama**: Kurumsal bulut benimseme stratejilerine etki edin

#### 📋 Atölye Kaynakları ve Materyalleri
**Kolaylaştırıcılar ve öğrenciler için kapsamlı araç seti**

**Kolaylaştırıcılar için:**
- **Eğitmen Kılavuzu**: [Atölye Genel Bakış](workshop/README.md) - Oturum planlama ve sunum rehberi
- **Sunum Materyalleri**: Slaytlar, mimari diyagramlar ve demo senaryoları
- **Değerlendirme Araçları**: Uygulamalı egzersizler, bilgi kontrolleri ve değerlendirme ölçütleri
- **Teknik Kurulum**: Ortam yapılandırması, sorun giderme rehberleri ve yedek planlar

**Katılımcılar için:**
- **Etkileşimli Atölye Ortamı**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme platformu
- **Adım Adım Talimatlar**: [Kılavuzlu Egzersizler](../../workshop/docs/instructions) - Detaylı uygulama adımları  
- **Referans Dokümantasyonu**: [AI Atölye Laboratuvarı](docs/microsoft-foundry/ai-workshop-lab.md) - AI odaklı kapsamlı çalışmalar
- **Topluluk Kaynakları**: Azure Discord kanalları, GitHub tartışmaları ve uzman desteği

#### 🏢 Kurumsal Atölye Uygulaması
**Organizasyonel dağıtım ve eğitim stratejileri**

**Kurumsal Eğitim Programları:**
- **Geliştirici İşe Alımı**: Yeni çalışan oryantasyonu ve AZD temelleri (2-4 hafta)
- **Ekip Yetkinlik Geliştirme**: Mevcut ekipler için üç ayda bir atölye (1-2 gün)
- **Mimari İnceleme**: Kıdemli mühendisler ve mimarlar için aylık oturumlar (4 saat)
- **Liderlik Brifingleri**: Teknik karar vericiler için yönetici atölyeleri (yarım gün)

**Uygulama Desteği:**
- **Özel Atölye Tasarımı**: Belirli organizasyon ihtiyaçlarına uygun içerik
- **Pilot Program Yönetimi**: Başarı ölçütleri ve geri bildirim döngüleriyle yapılandırılmış uygulama  
- **Sürekli Mentorluk**: Atölye sonrası proje uygulama desteği
- **Topluluk Oluşturma**: Dahili Azure AI geliştirici toplulukları ve bilgi paylaşımı

**Başarı Ölçütleri:**
- **Beceri Kazanımı**: Ön/son değerlendirmeler ile teknik yetkinlik artışı
- **Dağıtım Başarısı**: Üretim uygulamalarını başarıyla dağıtan katılımcı yüzdesi
- **Verimlilik Süresi**: Yeni Azure AI projelerinde işe başlama süresinin kısalması
- **Bilgi Tutma**: Atölye sonrası 3-6 ay takip değerlendirmeleri

## 8 Bölümlü Öğrenme Yapısı

### Bölüm 1: Temel & Hızlı Başlangıç (30-45 dakika) 🌱
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Zorluk Seviyesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temellerinin anlaşılması
- AZD’nin platformunuza kurulması  
- İlk başarılı dağıtımınız
- Temel kavramlar ve terminoloji

#### Öğrenme Kaynakları
- [AZD Temelleri](docs/getting-started/azd-basics.md) - Temel kavramlar
- [Kurulum ve Ayar](docs/getting-started/installation.md) - Platforma özel rehberler
- [İlk Projeniz](docs/getting-started/first-project.md) - Uygulamalı öğretici
- [Komut Hızlı Başvuru](resources/cheat-sheet.md) - Hızlı referans

#### Pratik Sonuç
AZD kullanarak Azure’a basit bir web uygulaması başarıyla dağıtın

---

### Bölüm 2: AI-Öncelikli Geliştirme (1-2 saat) 🤖
**Önkoşullar**: Bölüm 1 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Microsoft Foundry entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI hizmet yapılandırmalarının anlaşılması
- RAG (Retrieval-Augmented Generation) desenleri

#### Öğrenme Kaynakları
- [Microsoft Foundry Entegrasyonu](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Dağıtımı](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Atölye Laboratuvarı](docs/microsoft-foundry/ai-workshop-lab.md) - **YENİ**: Kapsamlı 2-3 saatlik uygulamalı laboratuvar
- [Etkileşimli Atölye Kılavuzu](workshop/README.md) - **YENİ**: MkDocs önizlemeli tarayıcı tabanlı atölye
- [Microsoft Foundry Şablonları](README.md#featured-microsoft-foundry-templates)
- [Atölye Talimatları](../../workshop/docs/instructions) - **YENİ**: Adım adım rehberli egzersizler

#### Pratik Sonuç
RAG özellikli AI destekli sohbet uygulaması dağıtın ve yapılandırın

#### Atölye Öğrenme Yolu (İsteğe Bağlı Gelişme)
**YENİ Etkileşimli Deneyim**: [Tam Atölye Kılavuzu](workshop/README.md)
1. **Keşif** (30 dk): Şablon seçimi ve değerlendirme
2. **Dağıtım** (45 dk): AI şablon fonksiyonelliğini dağıtım ve doğrulama  
3. **Parçalara Ayırma** (30 dk): Şablon mimarisi ve bileşenlerini anlama
4. **Yapılandırma** (30 dk): Ayarları ve parametreleri özelleştirme
5. **Özelleştirme** (45 dk): Şablonları değiştirip kendi yapınıza uygun hale getirme
6. **Temizlik** (15 dk): Kaynakları temizleyin ve yaşam döngüsünü anlayın
7. **Kapanış** (15 dk): Sonraki adımlar ve ileri öğrenme yolları

---

### Bölüm 3: Yapılandırma & Kimlik Doğrulama (45-60 dakika) ⚙️
**Önkoşullar**: Bölüm 1 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak isimlendirme ve organizasyonu
- Çoklu ortam dağıtımları

#### Öğrenme Kaynakları
- [Yapılandırma Rehberi](docs/getting-started/configuration.md) - Ortam kurulumu
- [Kimlik Doğrulama & Güvenlik Desenleri](docs/getting-started/authsecurity.md) - Yönetilen kimlik ve Key Vault entegrasyonu
- Çoklu ortam örnekleri

#### Pratik Sonuç
Doğru kimlik doğrulama ve güvenlik ile birden fazla ortam yönetin

---

### Bölüm 4: Kod Olarak Altyapı & Dağıtım (1-1.5 saat) 🏗️
**Önkoşullar**: Bölümler 1-3 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri
- Özel şablon oluşturma

- Azure Container Apps ve AZD ile konteyner tabanlı uygulama dağıtımı

#### Öğrenme Kaynakları
- [Dağıtım Rehberi](docs/deployment/deployment-guide.md) - Tam iş akışları
- [Kaynak Sağlama](docs/deployment/provisioning.md) - Kaynak yönetimi
- Konteyner ve mikroservis örnekleri
- [Container App Örnekleri](examples/container-app/README.md) - Hızlı başlangıç, üretim ve ileri dağıtım desenleri

#### Pratik Sonuç
Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamalar dağıtın

---

### Bölüm 5: Çoklu Ajan AI Çözümleri (2-3 saat) 🤖🤖
**Önkoşullar**: Bölümler 1-2 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretim hazır AI dağıtımları
- Müşteri ve Envanter ajan uygulamaları

- Ajan tabanlı çözümler kapsamında konteynerleştirilmiş mikroservis entegrasyonu

#### Öğrenme Kaynakları
- [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- Çoklu ajan koordinasyon desenleri
- [Mikroservis Mimari Örneği](../../examples/container-app/microservices) - Hizmetler arası iletişim, asenkron mesajlaşma ve üretim dağıtımı

#### Pratik Sonuç
Üretim hazır çoklu ajan AI çözümünü dağıtın ve yönetin

---

### Bölüm 6: Dağıtımdan Önce Doğrulama & Planlama (1 saat) 🔍
**Önkoşullar**: Bölüm 4 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlama ve kaynak doğrulama
- SKU seçimi stratejileri
- Ön kontrol listeleri ve otomasyon
- Maliyet optimizasyon planlaması

#### Öğrenme Kaynakları
- [Kapasite Planlama](docs/pre-deployment/capacity-planning.md) - Kaynak doğrulama
- [SKU Seçimi](docs/pre-deployment/sku-selection.md) - Maliyet etkin tercihler
- [Ön Kontroller](docs/pre-deployment/preflight-checks.md) - Otomatik betikler
- [Application Insights Entegrasyonu](docs/pre-deployment/application-insights.md) - İzleme ve gözlemlenebilirlik
- [Çoklu Ajan Koordinasyon Desenleri](docs/pre-deployment/coordination-patterns.md) - Ajan orkestrasyon stratejileri

#### Pratik Sonuç
Dağıtımları uygulamadan önce doğrulayın ve optimize edin
---

### Bölüm 7: Sorun Giderme ve Hata Ayıklama (1-1.5 saat) 🔧
**Önkoşullar**: Herhangi bir dağıtım bölümü tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- AI’ye özgü hata giderme
- Performans optimizasyonu

#### Öğrenim Kaynakları
- [Yaygın Sorunlar](docs/troubleshooting/common-issues.md) - SSS ve çözümler
- [Hata Ayıklama Rehberi](docs/troubleshooting/debugging.md) - Adım adım stratejiler
- [AI’ye Özgü Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md) - AI hizmeti problemleri

#### Pratik Sonuç
Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çözme

---

### Bölüm 8: Üretim ve Kurumsal Desenler (2-3 saat) 🏢
**Önkoşullar**: Bölümler 1-4 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu
- Ölçeklenebilirlik ve yönetişim

- Üretim konteyner uygulaması dağıtımları için en iyi uygulamalar (güvenlik, izleme, maliyet, CI/CD)

#### Öğrenim Kaynakları
- [Üretim AI En İyi Uygulamaları](docs/microsoft-foundry/production-ai-practices.md) - Kurumsal desenler
- Mikroservisler ve kurumsal örnekler
- İzleme ve yönetişim çerçeveleri
- [Mikroservis Mimarisi Örneği](../../examples/container-app/microservices) - Mavi-yeşil/canary dağıtımı, dağıtık izleme ve maliyet optimizasyonu

#### Pratik Sonuç
Tam üretim yeteneklerine sahip kurumsal uygulamalar dağıtma

---

## Öğrenme İlerleyişi ve Zorluk

### İlerleyici Beceri Gelişimi

- **🌱 Başlangıç**: Bölüm 1 (Temel) → Bölüm 2 (AI Geliştirme)
- **🔧 Orta Düzey**: Bölümler 3-4 (Yapılandırma & Altyapı) → Bölüm 6 (Doğrulama)
- **🚀 İleri Düzey**: Bölüm 5 (Çoklu Ajan Çözümleri) → Bölüm 7 (Sorun Giderme)
- **🏢 Kurumsal**: Tüm bölümleri tamamla, Bölüm 8’e (Üretim Desenleri) odaklan

- **Konteyner Uygulama Yolu**: Bölümler 4 (Konteynerleştirilmiş dağıtım), 5 (Mikroservis entegrasyonu), 8 (Üretim en iyi uygulamaları)

### Zorluk Göstergeleri

- **⭐ Temel**: Tek kavram, rehberli eğitimler, 30-60 dakika
- **⭐⭐ Orta**: Çoklu kavramlar, uygulamalı pratik, 1-2 saat  
- **⭐⭐⭐ İleri**: Karmaşık mimariler, özel çözümler, 1-3 saat
- **⭐⭐⭐⭐ Uzman**: Üretim sistemleri, kurumsal desenler, 2-4 saat

### Esnek Öğrenme Yolları

#### 🎯 AI Geliştirici Hızlı Yol (4-6 saat)
1. **Bölüm 1**: Temel & Hızlı Başlangıç (45 dk)
2. **Bölüm 2**: AI-Öncelikli Geliştirme (2 saat)  
3. **Bölüm 5**: Çoklu Ajan AI Çözümleri (3 saat)
4. **Bölüm 8**: Üretim AI En İyi Uygulamaları (1 saat)

#### 🛠️ Altyapı Uzmanı Yolu (5-7 saat)
1. **Bölüm 1**: Temel & Hızlı Başlangıç (45 dk)
2. **Bölüm 3**: Yapılandırma & Kimlik Doğrulama (1 saat)
3. **Bölüm 4**: Kod Olarak Altyapı & Dağıtım (1.5 saat)
4. **Bölüm 6**: Dağıtımdan Önce Doğrulama & Planlama (1 saat)
5. **Bölüm 7**: Sorun Giderme & Hata Ayıklama (1.5 saat)
6. **Bölüm 8**: Üretim & Kurumsal Desenler (2 saat)

#### 🎓 Tam Öğrenme Yolculuğu (8-12 saat)
Tüm 8 bölümün sırasıyla tamamlanması, uygulamalı pratik ve doğrulama ile

## Kurs Tamamlama Çerçevesi

### Bilgi Doğrulaması
- **Bölüm Kontrol Noktaları**: Ölçülebilir sonuçlarla pratik egzersizler
- **Uygulamalı Doğrulama**: Her bölüm için çalışan çözümler dağıtımı
- **İlerleme Takibi**: Görsel göstergeler ve tamamlama rozetleri
- **Topluluk Doğrulaması**: Deneyim paylaşımları Azure Discord kanallarında

### Öğrenme Sonuçları Değerlendirmesi

#### Bölüm 1-2 Tamamlama (Temel + AI)
- ✅ AZD ile temel web uygulaması dağıtımı
- ✅ RAG özellikli AI destekli sohbet uygulaması dağıtımı
- ✅ AZD temel kavramları ve AI entegrasyonunu anlama

#### Bölüm 3-4 Tamamlama (Yapılandırma + Altyapı)  
- ✅ Çoklu ortam dağıtımlarını yönetme
- ✅ Özel Bicep altyapı şablonları oluşturma
- ✅ Güvenli kimlik doğrulama desenleri uygulama

#### Bölüm 5-6 Tamamlama (Çoklu Ajan + Doğrulama)
- ✅ Karmaşık çoklu ajan AI çözümü dağıtımı
- ✅ Kapasite planlaması ve maliyet optimizasyonu yapma
- ✅ Otomatik dağıtımdan önce doğrulama uygulama

#### Bölüm 7-8 Tamamlama (Sorun Giderme + Üretim)
- ✅ Dağıtım sorunlarını bağımsız olarak hata ayıklayıp çözme
- ✅ Kurumsal seviye izleme ve güvenlik uygulama
- ✅ Yönetişim ile üretime hazır uygulamalar dağıtma

### Sertifikasyon ve Tanınma
- **Kurs Tamamlama Rozeti**: Tüm 8 bölümü pratik doğrulama ile tamamla
- **Topluluk Tanıma**: Microsoft Foundry Discord aktif katılımı
- **Mesleki Gelişim**: Sektöre uygun AZD ve AI dağıtım becerileri
- **Kariyer İlerlemesi**: Kurumsal bulut dağıtım yetkinlikleri

## 🎓 Kapsamlı Öğrenme Sonuçları

### Temel Seviye (Bölümler 1-2)
Temel bölümler tamamlandığında, öğrenenler şunları gösterecek:

**Teknik Yetkinlikler:**
- AZD komutları ile basit web uygulamalarını Azure’a dağıtma
- RAG özellikleri ile AI sohbet uygulamalarını yapılandırma ve dağıtma
- AZD çekirdek kavramlarını anlama: şablonlar, ortamlar, sağlama iş akışları
- Microsoft Foundry hizmetlerini AZD dağıtımlarıyla entegre etme
- Azure AI hizmetleri yapılandırmaları ve API uç noktalarında gezinme

**Profesyonel Beceriler:**
- Tutarlı sonuçlar için yapılandırılmış dağıtım iş akışlarını takip etme
- Temel dağıtım sorunlarını loglar ve dokümantasyonla çözme
- Bulut dağıtım süreçleri hakkında etkili iletişim kurma
- Güvenli AI hizmet entegrasyonu için en iyi uygulamaları uygulama

**Öğrenme Doğrulaması:**
- ✅ `todo-nodejs-mongo` şablonunu başarılı şekilde dağıtma
- ✅ `azure-search-openai-demo`'yu RAG ile yapılandırıp dağıtma
- ✅ Etkileşimli atölye egzersizlerini tamamlama (Keşif aşaması)
- ✅ Azure Discord topluluğu tartışmalarına katılma

### Orta Seviye (Bölümler 3-4)
Orta seviye bölümler tamamlandığında, öğrenenler şunları gösterecek:

**Teknik Yetkinlikler:**
- Çoklu ortam (dev, staging, prod) dağıtımlarını yönetme
- Altyapı kodu için özel Bicep şablonları oluşturma
- Yönetilen kimlik ile güvenli kimlik doğrulama desenleri uygulama
- Özel yapılandırmalarla karmaşık çoklu hizmet uygulamaları dağıtma
- Maliyet ve performans için kaynak sağlama stratejileri optimize etme

**Profesyonel Beceriler:**
- Ölçeklenebilir altyapı mimarileri tasarlama
- Bulut dağıtımları için güvenlik en iyi uygulamalarını uygulama
- Takım işbirliği için altyapı desenlerini dokümante etme
- Gereksinimler için uygun Azure hizmetlerini değerlendirme ve seçme

**Öğrenme Doğrulaması:**
- ✅ Ortama özel ayarlarla ayrı ortamlar yapılandırma
- ✅ Çoklu hizmet uygulaması için özel Bicep şablonu oluşturma ve dağıtma
- ✅ Güvenli erişim için yönetilen kimlik kimlik doğrulaması uygulama
- ✅ Gerçek senaryolarla yapılandırma yönetimi egzersizlerini tamamlama

### İleri Seviye (Bölümler 5-6)
İleri seviye bölümler tamamlandığında, öğrenenler şunları gösterecek:

**Teknik Yetkinlikler:**
- Koordine iş akışlarıyla çoklu ajan AI çözümleri dağıtma ve düzenleme
- Perakende senaryoları için Müşteri ve Envanter ajan mimarileri uygulama
- Kapsamlı kapasite planlama ve kaynak doğrulaması yapma
- Otomatik dağıtımdan önce doğrulama ve optimizasyon yürütme
- İş yükü gereksinimlerine göre maliyet etkili SKU seçimleri tasarlama

**Profesyonel Beceriler:**
- Üretim ortamları için karmaşık AI çözümleri mimarisi oluşturma
- AI dağıtım stratejileri hakkında teknik tartışmalara liderlik etme
- Junior geliştiricilere AZD ve AI dağıtım en iyi uygulamalarında mentorluk yapma
- İş ihtiyacı için AI mimari desenlerini değerlendirme ve önerme

**Öğrenme Doğrulaması:**
- ✅ ARM şablonları ile tam perakende çoklu ajan çözümü dağıtımı
- ✅ Ajan koordinasyonu ve iş akışı düzenlemesini gösterme
- ✅ Gerçek kaynak kısıtlamaları ile kapasite planlama egzersizlerini tamamlama
- ✅ Otomatik ön kontrol doğrulamaları ile dağıtım hazır hale getirme

### Uzman Seviye (Bölümler 7-8)
Uzman seviye bölümler tamamlandığında, öğrenenler şunları gösterecek:

**Teknik Yetkinlikler:**
- Karmaşık dağıtım sorunlarını bağımsız teşhis ve çözme
- Kurumsal güvenlik desenleri ve yönetişim çerçeveleri uygulama
- Kapsamlı izleme ve uyarı stratejileri tasarlama
- Üretim dağıtımlarını ölçek, maliyet ve performans açısından optimize etme
- Uygun test ve doğrulama ile CI/CD hatları kurma

**Profesyonel Beceriler:**
- Kurumsal bulut dönüşüm girişimlerine liderlik etme
- Kurumsal dağıtım standartlarını tasarlama ve uygulama
- Geliştirme ekiplerine ileri AZD uygulamalarında eğitim ve mentorluk verme
- Kurumsal AI dağıtımları için teknik karar alma süreçlerine etki etme

**Öğrenme Doğrulaması:**
- ✅ Karmaşık çoklu hizmet dağıtım hatalarını çözme
- ✅ Uyum gereksinimleriyle kurumsal güvenlik desenlerini uygulama
- ✅ Application Insights ile üretim izleme tasarlama ve dağıtma
- ✅ Kurumsal yönetişim çerçevesi uygulamasını tamamlama

## 🎯 Kurs Tamamlama Sertifikası

### İlerleme Takip Çerçevesi
Öğrenme ilerlemenizi yapılandırılmış kontrol noktalarıyla takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI-Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod Olarak Altyapı & Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajan AI Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtımdan Önce Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim & Kurumsal Desenler ✅

### Doğrulama Süreci
Her bölümü tamamladıktan sonra bilgilerinizi doğrulayın:

1. **Pratik Egzersiz Tamamlama**: Her bölüm için çalışan çözümler dağıtma
2. **Bilgi Değerlendirmesi**: SSS bölümlerini inceleme ve öz-değerlendirmeleri tamamlama
3. **Topluluk Katılımı**: Azure Discord’da deneyimleri paylaşma ve geri bildirim alma
4. **Portföy Geliştirme**: Dağıtımlarınızı ve öğrenilen dersleri dokümante etme
5. **Eş Değerlendirme**: Diğer öğrenenlerle karmaşık senaryolar üzerinde işbirliği yapma

### Kurs Tamamlama Faydaları
Tüm bölümleri doğrulama ile tamamlayanlar şunlara sahip olacak:

**Teknik Uzmanlık:**
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure ortamlarına dağıtma
- **Profesyonel Beceriler**: Kurumsal hazır dağıtım ve sorun giderme yetkinlikleri  
- **Mimari Bilgi**: Çoklu ajan AI çözümleri ve karmaşık altyapı desenleri
- **Hata Ayıklama Ustası**: Dağıtım ve yapılandırma sorunlarını bağımsız çözme

**Mesleki Gelişim:**
- **Sektör Tanınırlığı**: Yüksek talep gören AZD ve AI dağıtım alanlarında doğrulanabilir beceriler
- **Kariyer İlerlemesi**: Bulut mimarı ve AI dağıtım uzmanı rolleri için yeterlilik
- **Topluluk Liderliği**: Azure geliştirici ve AI topluluklarında aktif üyelik
- **Sürekli Öğrenme**: İleri Microsoft Foundry uzmanlığı için temel

**Portföy Varlıkları:**
- **Dağıtılan Çözümler**: AI uygulamaları ve altyapı desenlerinin çalışan örnekleri
- **Dokümantasyon**: Kapsamlı dağıtım rehberleri ve sorun giderme prosedürleri  
- **Topluluk Katkıları**: Azure topluluğuna yapılan tartışmalar, örnekler ve geliştirmeler
- **Profesyonel Ağ**: Azure uzmanları ve AI dağıtım uygulayıcıları ile bağlantılar

### Kurs Sonrası Öğrenme Yolu  
Mezunlar gelişmiş uzmanlık için hazırdır:
- **Microsoft Foundry Uzmanı**: AI model dağıtımı ve orkestrasyonunda derin uzmanlık
- **Bulut Mimari Liderliği**: Kurumsal ölçek dağıtım tasarımı ve yönetişim
- **Geliştirici Topluluğu Liderliği**: Azure örnekleri ve topluluk kaynaklarına katkı
- **Kurumsal Eğitim**: Organizasyonlarda AZD ve AI dağıtım becerilerinin öğretilmesi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, yazıldığı dildeki kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı nedeniyle oluşabilecek yanlış anlamalar veya yorum farklılıklarından dolayı sorumluluk kabul edilmemektedir.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->