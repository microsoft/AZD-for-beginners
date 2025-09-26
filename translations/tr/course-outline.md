<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-09-24T14:50:12+00:00",
  "source_file": "course-outline.md",
  "language_code": "tr"
}
-->
# AZD Yeni Başlayanlar İçin: Kurs İçeriği ve Öğrenme Çerçevesi

## Kurs Genel Bakış

Azure Developer CLI (azd) konusunda uzmanlaşın ve aşamalı öğrenme için tasarlanmış bölümlerle ilerleyin. **Azure AI Foundry entegrasyonu ile AI uygulamalarını dağıtmaya özel bir odaklanma.**

### Modern Geliştiriciler İçin Bu Kurs Neden Önemli?

Azure AI Foundry Discord topluluğu içgörülerine göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmak istiyor** ancak şu zorluklarla karşılaşıyor:
- Karmaşık çok hizmetli AI mimarileri
- Üretim ortamında AI dağıtımı için en iyi uygulamalar  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarını giderme

### Temel Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerini Öğrenin**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtın**: AZD'yi Azure AI Foundry hizmetleriyle kullanın
- **Kod Olarak Altyapı Uygulayın**: Bicep şablonlarıyla Azure kaynaklarını yönetin
- **Dağıtımları Sorunsuz Hale Getirin**: Yaygın sorunları çözün ve problemleri giderin
- **Üretim İçin Optimize Edin**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Geliştirin**: Karmaşık AI mimarilerini dağıtın

## 🎓 Atölye Öğrenme Deneyimi

### Esnek Öğrenme Sunum Seçenekleri
Bu kurs, hem **bireysel öğrenme** hem de **yönetilen atölye oturumları** için tasarlanmıştır. Katılımcılar, AZD ile pratik beceriler geliştirirken etkileşimli alıştırmalarla uygulamalı deneyim kazanabilir.

#### 🚀 Bireysel Öğrenme Modu
**Bireysel geliştiriciler ve sürekli öğrenme için ideal**

**Özellikler:**
- **Tarayıcı Tabanlı Arayüz**: MkDocs destekli atölye, herhangi bir web tarayıcısı üzerinden erişilebilir
- **GitHub Codespaces Entegrasyonu**: Önceden yapılandırılmış araçlarla tek tıkla geliştirme ortamı
- **Etkileşimli DevContainer Ortamı**: Yerel kurulum gerekmez - hemen kodlamaya başlayın
- **İlerleme Takibi**: Dahili kontrol noktaları ve doğrulama alıştırmaları
- **Topluluk Desteği**: Sorular ve iş birliği için Azure Discord kanallarına erişim

**Öğrenme Yapısı:**
- **Esnek Zamanlama**: Bölümleri kendi hızınızda günler veya haftalar içinde tamamlayın
- **Kontrol Noktası Sistemi**: Karmaşık konulara geçmeden önce öğrenmeyi doğrulayın
- **Kaynak Kütüphanesi**: Kapsamlı belgeler, örnekler ve sorun giderme kılavuzları
- **Portföy Geliştirme**: Profesyonel portföyler için dağıtılabilir projeler oluşturun

**Başlangıç (Bireysel Öğrenme):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Yönetilen Atölye Oturumları
**Kurumsal eğitim, bootcamp'ler ve eğitim kurumları için ideal**

**Atölye Formatı Seçenekleri:**

**📚 Akademik Kurs Entegrasyonu (8-12 hafta)**
- **Üniversite Programları**: Haftalık 2 saatlik oturumlarla dönemlik kurs
- **Bootcamp Formatı**: Günlük 6-8 saatlik yoğun 3-5 günlük program
- **Kurumsal Eğitim**: Pratik proje uygulamasıyla aylık ekip oturumları
- **Değerlendirme Çerçevesi**: Notlandırılmış ödevler, akran değerlendirmeleri ve final projeleri

**🚀 Yoğun Atölye (1-3 gün)**
- **1. Gün**: Temel Bilgiler + AI Geliştirme (Bölüm 1-2) - 6 saat
- **2. Gün**: Yapılandırma + Altyapı (Bölüm 3-4) - 6 saat  
- **3. Gün**: İleri Düzey Modeller + Üretim (Bölüm 5-8) - 8 saat
- **Takip**: Proje tamamlaması için isteğe bağlı 2 haftalık mentorluk

**⚡ Yönetici Brifingi (4-6 saat)**
- **Stratejik Genel Bakış**: AZD'nin değer önerisi ve iş etkisi (1 saat)
- **Uygulamalı Demo**: AI uygulamasını baştan sona dağıtma (2 saat)
- **Mimari İnceleme**: Kurumsal modeller ve yönetişim (1 saat)
- **Uygulama Planlaması**: Kurumsal benimseme stratejisi (1-2 saat)

#### 🛠️ Atölye Öğrenme Metodolojisi
**Keşif → Dağıtım → Özelleştirme yaklaşımıyla uygulamalı beceri geliştirme**

**1. Aşama: Keşif (45 dakika)**
- **Şablon İncelemesi**: Azure AI Foundry şablonlarını ve hizmetlerini değerlendirme
- **Mimari Analiz**: Çoklu ajan modellerini ve dağıtım stratejilerini anlama
- **Gereksinim Değerlendirmesi**: Kurumsal ihtiyaçları ve kısıtlamaları belirleme
- **Ortam Kurulumu**: Geliştirme ortamını ve Azure kaynaklarını yapılandırma

**2. Aşama: Dağıtım (2 saat)**
- **Yönlendirilmiş Uygulama**: AZD ile AI uygulamalarını adım adım dağıtma
- **Hizmet Yapılandırması**: Azure AI hizmetlerini, uç noktaları ve kimlik doğrulamayı yapılandırma
- **Güvenlik Uygulaması**: Kurumsal güvenlik modelleri ve erişim kontrolleri uygulama
- **Doğrulama Testi**: Dağıtımları doğrulama ve yaygın sorunları giderme

**3. Aşama: Özelleştirme (45 dakika)**
- **Uygulama Değişikliği**: Belirli kullanım durumları ve gereksinimler için şablonları uyarlama
- **Üretim Optimizasyonu**: İzleme, maliyet yönetimi ve ölçeklendirme stratejileri uygulama
- **İleri Düzey Modeller**: Çoklu ajan koordinasyonu ve karmaşık mimarileri keşfetme
- **Sonraki Adımları Planlama**: Sürekli beceri geliştirme için öğrenme yolunu tanımlama

#### 🎯 Atölye Öğrenme Çıktıları
**Uygulamalı pratikle geliştirilen ölçülebilir beceriler**

**Teknik Yeterlilikler:**
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

#### 📋 Atölye Kaynakları ve Malzemeler
**Eğitmenler ve katılımcılar için kapsamlı araç seti**

**Eğitmenler İçin:**
- **Eğitmen Kılavuzu**: [Atölye Yönetim Kılavuzu](workshop/docs/instructor-guide.md) - Oturum planlama ve sunum ipuçları
- **Sunum Malzemeleri**: Slaytlar, mimari diyagramlar ve demo senaryoları
- **Değerlendirme Araçları**: Pratik alıştırmalar, bilgi kontrolleri ve değerlendirme kriterleri
- **Teknik Kurulum**: Ortam yapılandırması, sorun giderme kılavuzları ve yedek planlar

**Katılımcılar İçin:**
- **Etkileşimli Atölye Ortamı**: [Atölye Malzemeleri](workshop/README.md) - Tarayıcı tabanlı öğrenme platformu
- **Adım Adım Talimatlar**: [Yönlendirilmiş Alıştırmalar](../../workshop/docs/instructions) - Ayrıntılı uygulama kılavuzları  
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
- **Özel Atölye Tasarımı**: Belirli kurumsal ihtiyaçlara yönelik içerik
- **Pilot Program Yönetimi**: Başarı ölçütleri ve geri bildirim döngüleriyle yapılandırılmış uygulama
- **Sürekli Mentorluk**: Proje uygulaması için atölye sonrası destek
- **Topluluk Oluşturma**: Dahili Azure AI geliştirici toplulukları ve bilgi paylaşımı

**Başarı Ölçütleri:**
- **Beceri Kazanımı**: Teknik yeterlilik büyümesini ölçen ön/son değerlendirmeler
- **Dağıtım Başarısı**: Üretim uygulamalarını başarıyla dağıtan katılımcı yüzdesi
- **Verimlilik Süresi**: Yeni Azure AI projeleri için azaltılmış oryantasyon süresi
- **Bilgi Kalıcılığı**: Atölyeden 3-6 ay sonra yapılan takip değerlendirmeleri

## 8 Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç (30-45 dakika) 🌱
**Ön Koşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Zorluk Seviyesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temel bilgilerini anlama
- AZD'yi platformunuza kurma  
- İlk başarılı dağıtımınızı gerçekleştirme
- Temel kavramlar ve terminoloji

#### Öğrenme Kaynakları
- [AZD Temelleri](docs/getting-started/azd-basics.md) - Temel kavramlar
- [Kurulum ve Yapılandırma](docs/getting-started/installation.md) - Platforma özel kılavuzlar
- [İlk Projeniz](docs/getting-started/first-project.md) - Uygulamalı eğitim
- [Komut Hızlı Referansı](resources/cheat-sheet.md) - Hızlı başvuru

#### Pratik Sonuç
AZD kullanarak Azure'a basit bir web uygulaması başarıyla dağıtın

---

### Bölüm 2: AI-Öncelikli Geliştirme (1-2 saat) 🤖
**Ön Koşullar**: Bölüm 1 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Azure AI Foundry entegrasyonu
- AI destekli uygulamaları dağıtma
- AI hizmet yapılandırmalarını anlama
- RAG (Retrieval-Augmented Generation) modelleri

#### Öğrenme Kaynakları
- [Azure AI Foundry Entegrasyonu](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Dağıtımı](docs/ai-foundry/ai-model-deployment.md)
- [AI Atölye Laboratuvarı](docs/ai-foundry/ai-workshop-lab.md) - **YENİ**: Kapsamlı 2-3 saatlik uygulamalı laboratuvar
- [Etkileşimli Atölye Kılavuzu](workshop/README.md) - **YENİ**: MkDocs önizlemesiyle tarayıcı tabanlı atölye
- [Azure AI Foundry Şablonları](README.md#featured-azure-ai-foundry-templates)
- [Atölye Talimatları](../../workshop/docs/instructions) - **YENİ**: Adım adım yönlendirilmiş alıştırmalar

#### Pratik Sonuç
RAG özelliklerine sahip AI destekli bir sohbet uygulaması dağıtın ve yapılandırın

#### Atölye Öğrenme Yolu (İsteğe Bağlı Geliştirme)
**YENİ Etkileşimli Deneyim**: [Tam Atölye Kılavuzu](workshop/README.md)
1. **Keşif** (30 dk): Şablon seçimi ve değerlendirme
2. **Dağıtım** (45 dk): AI şablon işlevselliğini dağıtma ve doğrulama  
3. **Ayrıştırma** (30 dk): Şablon mimarisini ve bileşenlerini anlama
4. **Yapılandırma** (30 dk): Ayarları ve parametreleri özelleştirme
5. **Özelleştirme** (45 dk): Değiştirin ve kendi ihtiyaçlarınıza göre uyarlayın
6. **Temizlik** (15 dk): Kaynakları temizleme ve yaşam döngüsünü anlama
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
- Güvenlik modelleri ve yönetilen kimlik
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

#### Öğrenme Kaynakları
- [Dağıtım Kılavuzu](docs/deployment/deployment-guide.md) - Tam iş akışları
- [Kaynak Sağlama](docs/deployment/provisioning.md) - Kaynak yönetimi
- Konteyner ve mikro hizmet örnekleri

#### Pratik Sonuç
Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamalar dağıtın

---

### Bölüm 5: Çoklu Ajan AI Çözümleri (2-3 saat) 🤖🤖
**Ön Koşullar**: Bölüm 1-2 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari modelleri
- Ajan düzenleme ve koordinasyon
- Üretime hazır AI dağıtımları
- Müşteri ve Envanter ajan uygulamaları

#### Öğrenme Kaynakları
- [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- Çoklu ajan koordinasyon modelleri

#### Pratik Sonuç
Üretime hazır bir çoklu ajan AI çözümü dağıtın ve yönetin

---

### Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama (1 saat) 🔍
**Ön Koşullar**: Bölüm 4 tamamlandı  
**Zorluk Sev
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI hizmeti sorunları

#### Pratik Sonuç
Bağımsız olarak yaygın dağıtım sorunlarını teşhis etme ve çözme

---

### Bölüm 8: Üretim ve Kurumsal Kalıplar (2-3 saat) 🏢
**Ön Koşullar**: Bölüm 1-4 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik kalıpları
- İzleme ve maliyet optimizasyonu
- Ölçeklenebilirlik ve yönetişim

#### Öğrenme Kaynakları
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Kurumsal kalıplar
- Mikro hizmetler ve kurumsal örnekler
- İzleme ve yönetişim çerçeveleri

#### Pratik Sonuç
Tam üretim yeteneklerine sahip kurumsal uygulamalar dağıtın

---

## Öğrenme İlerlemesi ve Zorluk Seviyesi

### Kademeli Beceri Geliştirme

- **🌱 Başlangıç Seviyesi**: Bölüm 1 (Temel) → Bölüm 2 (AI Geliştirme)
- **🔧 Orta Seviye**: Bölüm 3-4 (Konfigürasyon ve Altyapı) → Bölüm 6 (Doğrulama)
- **🚀 İleri Seviye**: Bölüm 5 (Çoklu Ajan Çözümleri) → Bölüm 7 (Sorun Giderme)
- **🏢 Kurumsal**: Tüm bölümleri tamamlayın, Bölüm 8'e odaklanın (Üretim Kalıpları)

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
4. **Bölüm 8**: Üretim AI En İyi Uygulamaları (1 saat)

#### 🛠️ Altyapı Uzmanı Yolu (5-7 saat)
1. **Bölüm 1**: Temel ve Hızlı Başlangıç (45 dakika)
2. **Bölüm 3**: Konfigürasyon ve Kimlik Doğrulama (1 saat)
3. **Bölüm 4**: Kod Olarak Altyapı ve Dağıtım (1.5 saat)
4. **Bölüm 6**: Ön Dağıtım Doğrulama ve Planlama (1 saat)
5. **Bölüm 7**: Sorun Giderme ve Hata Ayıklama (1.5 saat)
6. **Bölüm 8**: Üretim ve Kurumsal Kalıplar (2 saat)

#### 🎓 Tam Öğrenme Yolculuğu (8-12 saat)
Tüm 8 bölümü sıralı olarak tamamlayın, uygulamalı pratik ve doğrulama ile

## Kurs Tamamlama Çerçevesi

### Bilgi Doğrulama
- **Bölüm Kontrol Noktaları**: Ölçülebilir sonuçlarla pratik egzersizler
- **Uygulamalı Doğrulama**: Her bölüm için çalışan çözümler dağıtın
- **İlerleme Takibi**: Görsel göstergeler ve tamamlama rozetleri
- **Topluluk Doğrulaması**: Azure Discord kanallarında deneyimlerinizi paylaşın

### Öğrenme Sonuçları Değerlendirmesi

#### Bölüm 1-2 Tamamlama (Temel + AI)
- ✅ AZD kullanarak temel bir web uygulaması dağıtın
- ✅ RAG ile AI destekli bir sohbet uygulaması dağıtın
- ✅ AZD temel kavramlarını ve AI entegrasyonunu anlayın

#### Bölüm 3-4 Tamamlama (Konfigürasyon + Altyapı)  
- ✅ Çoklu ortam dağıtımlarını yönetin
- ✅ Özel Bicep altyapı şablonları oluşturun
- ✅ Güvenli kimlik doğrulama kalıplarını uygulayın

#### Bölüm 5-6 Tamamlama (Çoklu Ajan + Doğrulama)
- ✅ Karmaşık çoklu ajan AI çözümü dağıtın
- ✅ Kapasite planlaması ve maliyet optimizasyonu yapın
- ✅ Otomatik ön dağıtım doğrulama uygulayın

#### Bölüm 7-8 Tamamlama (Sorun Giderme + Üretim)
- ✅ Dağıtım sorunlarını bağımsız olarak çözün  
- ✅ Kurumsal düzeyde izleme ve güvenlik uygulayın
- ✅ Yönetişim ile üretime hazır uygulamalar dağıtın

### Sertifikasyon ve Tanınma
- **Kurs Tamamlama Rozeti**: Tüm 8 bölümü pratik doğrulama ile tamamlayın
- **Topluluk Tanınması**: Azure AI Foundry Discord'da aktif katılım
- **Profesyonel Gelişim**: Endüstriyle ilgili AZD ve AI dağıtım becerileri
- **Kariyer İlerlemesi**: Kurumsal düzeyde bulut dağıtım yetenekleri

## 🎓 Kapsamlı Öğrenme Sonuçları

### Temel Seviye (Bölüm 1-2)
Temel bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- AZD komutlarını kullanarak Azure'a basit web uygulamaları dağıtın
- RAG özellikleriyle AI destekli sohbet uygulamaları yapılandırın ve dağıtın
- AZD temel kavramlarını anlayın: şablonlar, ortamlar, sağlama iş akışları
- Azure AI Foundry hizmetlerini AZD dağıtımlarıyla entegre edin
- Azure AI hizmet yapılandırmalarını ve API uç noktalarını gezin

**Profesyonel Beceriler:**
- Tutarlı sonuçlar için yapılandırılmış dağıtım iş akışlarını takip edin
- Günlükler ve belgeler kullanarak temel dağıtım sorunlarını giderin
- Bulut dağıtım süreçleri hakkında etkili iletişim kurun
- Güvenli AI hizmet entegrasyonu için en iyi uygulamaları uygulayın

**Öğrenme Doğrulaması:**
- ✅ `todo-nodejs-mongo` şablonunu başarıyla dağıtın
- ✅ `azure-search-openai-demo` uygulamasını RAG ile dağıtın ve yapılandırın
- ✅ Etkileşimli atölye egzersizlerini tamamlayın (Keşif aşaması)
- ✅ Azure Discord topluluğu tartışmalarına katılın

### Orta Seviye (Bölüm 3-4)
Orta seviye bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- Çoklu ortam dağıtımlarını yönetin (geliştirme, test, üretim)
- Kod olarak altyapı için özel Bicep şablonları oluşturun
- Yönetilen kimlik ile güvenli kimlik doğrulama kalıplarını uygulayın
- Özel yapılandırmalarla karmaşık çoklu hizmet uygulamaları dağıtın
- Maliyet ve performans için kaynak sağlama stratejilerini optimize edin

**Profesyonel Beceriler:**
- Ölçeklenebilir altyapı mimarileri tasarlayın
- Bulut dağıtımları için güvenlik en iyi uygulamalarını uygulayın
- Takım iş birliği için altyapı kalıplarını belgeleyin
- Gereksinimler için uygun Azure hizmetlerini değerlendirin ve seçin

**Öğrenme Doğrulaması:**
- ✅ Ortama özgü ayarlarla ayrı ortamlar yapılandırın
- ✅ Çoklu hizmet uygulaması için özel Bicep şablonu oluşturun ve dağıtın
- ✅ Güvenli erişim için yönetilen kimlik kimlik doğrulamasını uygulayın
- ✅ Gerçek senaryolarla yapılandırma yönetimi egzersizlerini tamamlayın

### İleri Seviye (Bölüm 5-6)
İleri seviye bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- Koordine iş akışlarıyla çoklu ajan AI çözümleri dağıtın ve yönetin
- Perakende senaryoları için Müşteri ve Envanter ajan mimarilerini uygulayın
- Kapsamlı kapasite planlaması ve kaynak doğrulaması yapın
- Otomatik ön dağıtım doğrulama ve optimizasyon gerçekleştirin
- İş yükü gereksinimlerine dayalı maliyet etkin SKU seçimleri tasarlayın

**Profesyonel Beceriler:**
- Üretim ortamları için karmaşık AI çözümleri tasarlayın
- AI dağıtım stratejileri hakkında teknik tartışmalara liderlik edin
- AZD ve AI dağıtım en iyi uygulamalarında genç geliştiricilere mentorluk yapın
- İş gereksinimleri için AI mimari kalıplarını değerlendirin ve önerin

**Öğrenme Doğrulaması:**
- ✅ ARM şablonlarıyla tam perakende çoklu ajan çözümü dağıtın
- ✅ Ajan koordinasyonu ve iş akışı düzenlemesini gösterin
- ✅ Gerçek kaynak kısıtlamalarıyla kapasite planlama egzersizlerini tamamlayın
- ✅ Otomatik ön uç kontrollerle dağıtım hazırlığını doğrulayın

### Uzman Seviye (Bölüm 7-8)
Uzman bölümleri tamamladıktan sonra, katılımcılar şunları gösterecek:

**Teknik Yetenekler:**
- Karmaşık dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün
- Kurumsal düzeyde güvenlik kalıpları ve yönetişim çerçeveleri uygulayın
- Kapsamlı izleme ve uyarı stratejileri tasarlayın
- Ölçek, maliyet ve performans için üretim dağıtımlarını optimize edin
- Uygun test ve doğrulama ile CI/CD boru hatları oluşturun

**Profesyonel Beceriler:**
- Kurumsal bulut dönüşüm girişimlerine liderlik edin
- Kurumsal dağıtım standartlarını tasarlayın ve uygulayın
- Geliştirme ekiplerini ileri düzey AZD uygulamalarında eğitin ve mentorluk yapın
- Kurumsal AI dağıtımları için teknik karar alma süreçlerini etkileyin

**Öğrenme Doğrulaması:**
- ✅ Karmaşık çoklu hizmet dağıtım hatalarını çözün
- ✅ Uyumluluk gereksinimleriyle kurumsal güvenlik kalıplarını uygulayın
- ✅ Application Insights ile üretim izleme tasarlayın ve dağıtın
- ✅ Kurumsal yönetişim çerçevesi uygulamasını tamamlayın

## 🎯 Kurs Tamamlama Sertifikası

### İlerleme Takibi Çerçevesi
Öğrenme ilerlemenizi yapılandırılmış kontrol noktalarıyla takip edin:

- [ ] **Bölüm 1**: Temel ve Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: AI-Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Konfigürasyon ve Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Kod Olarak Altyapı ve Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajan AI Çözümleri ✅
- [ ] **Bölüm 6**: Ön Dağıtım Doğrulama ve Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme ve Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim ve Kurumsal Kalıplar ✅

### Doğrulama Süreci
Her bölümü tamamladıktan sonra bilginizi şu şekilde doğrulayın:

1. **Pratik Egzersiz Tamamlama**: Her bölüm için çalışan çözümler dağıtın
2. **Bilgi Değerlendirme**: SSS bölümlerini gözden geçirin ve öz değerlendirmeleri tamamlayın
3. **Topluluk Katılımı**: Deneyimlerinizi paylaşın ve Azure Discord'da geri bildirim alın
4. **Portföy Geliştirme**: Dağıtımlarınızı ve öğrendiklerinizi belgeleyin
5. **Eş Değerlendirme**: Karmaşık senaryolarda diğer katılımcılarla iş birliği yapın

### Kurs Tamamlama Faydaları
Tüm bölümleri doğrulama ile tamamlayan mezunlar şunlara sahip olacak:

**Teknik Uzmanlık:**
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure ortamlarına dağıttı
- **Profesyonel Beceriler**: Kurumsal düzeyde dağıtım ve sorun giderme yetenekleri  
- **Mimari Bilgi**: Çoklu ajan AI çözümleri ve karmaşık altyapı kalıpları
- **Sorun Giderme Yetkinliği**: Dağıtım ve yapılandırma sorunlarını bağımsız olarak çözme

**Profesyonel Gelişim:**
- **Endüstri Tanınması**: Yüksek talep gören AZD ve AI dağıtım alanlarında doğrulanabilir beceriler
- **Kariyer İlerlemesi**: Bulut mimarı ve AI dağıtım uzmanı rolleri için nitelikler
- **Topluluk Liderliği**: Azure geliştirici ve AI topluluklarında aktif üyelik
- **Sürekli Öğrenme**: İleri düzey Azure AI Foundry uzmanlığı için temel

**Portföy Varlıkları:**
- **Dağıtılmış Çözümler**: AI uygulamaları ve altyapı kalıplarının çalışan örnekleri
- **Dokümantasyon**: Kapsamlı dağıtım kılavuzları ve sorun giderme prosedürleri  
- **Topluluk Katkıları**: Azure topluluğu ile paylaşılan tartışmalar, örnekler ve iyileştirmeler
- **Profesyonel Ağ**: Azure uzmanları ve AI dağıtım uygulayıcıları ile bağlantılar

### Kurs Sonrası Öğrenme Yolu
Mezunlar şu alanlarda ileri düzey uzmanlık için hazırlanmıştır:
- **Azure AI Foundry Uzmanı**: AI model dağıtımı ve orkestrasyonunda derin uzmanlık
- **Bulut Mimari Liderliği**: Kurumsal ölçekli dağıtım tasarımı ve yönetişim
- **Geliştirici Topluluğu Liderliği**: Azure örneklerine ve topluluk kaynaklarına katkı sağlama
- **Kurumsal Eğitim**: Kuruluşlarda AZD ve AI dağıtım becerilerini öğretme

---

