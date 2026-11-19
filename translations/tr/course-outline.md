# AZD Yeni Başlayanlar İçin: Kurs İçeriği ve Öğrenme Çerçevesi

## Kurs Genel Bakışı

Azure Developer CLI (azd) ile ilerleyici öğrenme için yapılandırılmış bölümler aracılığıyla ustalaşın. **Microsoft Foundry entegrasyonu ile AI uygulaması dağıtımına özel odaklanma.**

### Bu Kurs Modern Geliştiriciler İçin Neden Önemlidir

AI iş yüklerini dağıtan geliştiriciler genellikle rehberliğe ihtiyaç duyar:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımında en iyi uygulamalar  
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ye özgü dağıtım sorunlarının giderilmesi

### Temel Öğrenme Hedefleri

Bu yapılandırılmış kursu tamamlayarak:
- **AZD Temellerinde Ustalık**: Temel kavramlar, kurulum ve yapılandırma
- **AI Uygulamaları Dağıtımı**: AZD ile Microsoft Foundry hizmetlerini kullanmak
- **Kod Olarak Altyapı Uygulaması**: Azure kaynaklarını Bicep şablonları ile yönetmek
- **Dağıtım Sorunlarını Giderme**: Yaygın sorunları çözmek ve hataları debug etmek
- **Üretim İçin Optimizasyon**: Güvenlik, ölçeklendirme, izleme ve maliyet yönetimi
- **Çoklu Ajan Çözümleri Oluşturma**: Karmaşık AI mimarilerini dağıtmak

## 🎓 Atölye Çalışması Öğrenme Deneyimi

### Esnek Öğrenme Sunum Seçenekleri
Bu kurs, **kendi hızınızda bireysel öğrenme** ve **yönlendirmeli atölye oturumları** olarak tasarlanmıştır; katılımcıların AZD ile uygulamalı deneyim edinmesini ve etkileşimli alıştırmalarla beceri geliştirmesini sağlar.

#### 🚀 Kendi Hızınızda Öğrenme Modu
**Bireysel geliştiriciler ve sürekli öğrenme için ideal**

**Özellikler:**
- **Tarayıcı Tabanlı Arayüz**: Herhangi bir web tarayıcısı ile erişilebilen MkDocs destekli atölye
- **GitHub Codespaces Entegrasyonu**: Önceden yapılandırılmış araçlarla tek tıklama geliştirme ortamı
- **Etkileşimli DevContainer Ortamı**: Yerel kurulum gerekmez - hemen kodlamaya başlayın
- **İlerleme Takibi**: Dahili kontrol noktaları ve doğrulama alıştırmaları
- **Topluluk Desteği**: Sorular ve iş birliği için Azure Discord kanalları erişimi

**Öğrenme Yapısı:**
- **Esnek Zamanlama**: Bölümleri günler ya da haftalar içinde kendi hızınızda tamamlama
- **Kontrol Noktası Sistemi**: İleri seviyeye geçmeden önce öğrenmeyi doğrulama
- **Kaynak Kütüphanesi**: Kapsamlı dokümantasyon, örnekler ve sorun giderme rehberleri
- **Portföy Geliştirme**: Profesyonel portföyler için dağıtılabilir projeler inşa etme

**Başlarken (Kendi Hızınızda):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Yönlendirmeli Atölye Oturumları
**Kurumsal eğitim, bootcamp'ler ve eğitim kurumları için ideal**

**Atölye Formatı Seçenekleri:**

**📚 Akademik Kurs Entegrasyonu (8-12 hafta)**
- **Üniversite Programları**: Haftalık 2 saatlik oturumlar ile bir dönemlik ders
- **Bootcamp Formatı**: Günlük 6-8 saatlik oturumlar ile yoğun 3-5 günlük program
- **Kurumsal Eğitim**: Pratik proje uygulaması içeren aylık takım oturumları
- **Değerlendirme Çerçevesi**: Puanlı ödevler, akran değerlendirmeleri ve final projeleri

**🚀 Yoğun Atölye (1-3 gün)**
- **1. Gün**: Temel + AI Geliştirme (Bölümler 1-2) - 6 saat
- **2. Gün**: Yapılandırma + Altyapı (Bölümler 3-4) - 6 saat  
- **3. Gün**: İleri Düzey Desenler + Üretim (Bölümler 5-8) - 8 saat
- **Takip**: Proje tamamlaması için isteğe bağlı 2 haftalık mentorluk

**⚡ Yönetici Brifingi (4-6 saat)**
- **Stratejik Genel Bakış**: AZD'nin değer önerisi ve iş etkisi (1 saat)
- **Uygulamalı Demo**: AI uygulamasının baştan sona dağıtımı (2 saat)
- **Mimari İnceleme**: Kurumsal desenler ve yönetişim (1 saat)
- **Uygulama Planlaması**: Organizasyonel benimseme stratejisi (1-2 saat)

#### 🛠️ Atölye Öğrenme Metodolojisi
**Keşif → Dağıtım → Özelleştirme yaklaşımı ile uygulamalı beceri geliştirme**

**1. Aşama: Keşif (45 dakika)**
- **Şablon İncelemesi**: Microsoft Foundry şablonları ve hizmetlerini değerlendirme
- **Mimari Analizi**: Çok ajanlı desenleri ve dağıtım stratejilerini anlama
- **Gereksinim Değerlendirmesi**: Kurumsal ihtiyaçları ve kısıtları belirleme
- **Ortam Kurulumu**: Geliştirme ortamını ve Azure kaynaklarını yapılandırma

**2. Aşama: Dağıtım (2 saat)**
- **Rehberli Uygulama**: AZD ile AI uygulamalarını adım adım dağıtma
- **Hizmet Yapılandırması**: Azure AI hizmetleri, uç noktalar ve kimlik doğrulama ayarları
- **Güvenlik Uygulaması**: Kurumsal güvenlik desenleri ve erişim kontrolleri uygulama
- **Doğrulama Testleri**: Dağıtımları doğrulama ve yaygın sorunları giderme

**3. Aşama: Özelleştirme (45 dakika)**
- **Uygulama Değişiklikleri**: Şablonları belirli kullanım senaryolarına ve gereksinimlere uyarlama
- **Üretim Optimizasyonu**: İzleme, maliyet yönetimi ve ölçeklendirme stratejileri uygulama
- **İleri Düzey Desenler**: Çok ajanlı koordinasyon ve karmaşık mimarileri keşfetme
- **Sonraki Adımlar Planlama**: Sürekli beceri geliştirme için öğrenme yolunu belirleme

#### 🎯 Atölye Öğrenme Çıktıları
**Uygulamalı pratikle ölçülebilir beceri kazanımı**

**Teknik Yeterlilikler:**
- **Üretim AI Uygulamaları Dağıtımı**: AI destekli çözümleri başarıyla dağıtma ve yapılandırma
- **Kod Olarak Altyapı Ustalığı**: Özel Bicep şablonları oluşturma ve yönetme
- **Çoklu Ajan Mimarisi**: Koordine AI ajan çözümleri uygulama
- **Üretim Hazırlığı**: Güvenlik, izleme ve yönetişim desenleri uygulama
- **Sorun Giderme Uzmanlığı**: Dağıtım ve yapılandırma sorunlarını bağımsız çözme

**Profesyonel Beceriler:**
- **Proje Liderliği**: Bulut dağıtım girişimlerinde teknik ekipleri yönlendirme
- **Mimari Tasarım**: Ölçeklenebilir, maliyet etkin Azure çözümleri tasarlama
- **Bilgi Transferi**: AZD en iyi uygulamaları konusunda meslektaşları eğitme ve mentorluk yapma
- **Stratejik Planlama**: Kurumsal bulut benimseme stratejilerini etkileme

#### 📋 Atölye Kaynakları ve Materyalleri
**Kolaylaştırıcılar ve öğrenenler için kapsamlı araç seti**

**Kolaylaştırıcılar İçin:**
- **Eğitmen Rehberi**: [Atölye Genel Bakış](workshop/README.md) - Oturum planlama ve sunum rehberi
- **Sunum Materyalleri**: Slayt desteleri, mimari diyagramlar ve demo betikleri
- **Değerlendirme Araçları**: Pratik alıştırmalar, bilgi kontrolleri ve değerlendirme kriterleri
- **Teknik Kurulum**: Ortam yapılandırması, sorun giderme rehberleri ve yedek planlar

**Öğrenenler İçin:**
- **Etkileşimli Atölye Ortamı**: [Atölye Materyalleri](workshop/README.md) - Tarayıcı tabanlı öğrenme platformu
- **Adım Adım Talimatlar**: [Yönlendirmeli Egzersizler](../../workshop/docs/instructions) - Detaylı uygulama kılavuzları  
- **Referans Dokümantasyon**: [AI Atölye Labı](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI odaklı derinlemesine kaynaklar
- **Topluluk Kaynakları**: Azure Discord kanalları, GitHub tartışmaları ve uzman desteği

#### 🏢 Kurumsal Atölye Uygulaması
**Kurumsal dağıtım ve eğitim stratejileri**

**Kurumsal Eğitim Programları:**
- **Geliştirici İşe Alımı**: AZD temelleri ile yeni çalışan oryantasyonu (2-4 hafta)
- **Takım Yetkinliği Geliştirme**: Var olan geliştirme ekipleri için üç aylık atölyeler (1-2 gün)
- **Mimari İnceleme**: Kıdemli mühendisler ve mimarlar için aylık oturumlar (4 saat)
- **Liderlik Brifingleri**: Teknik karar vericiler için yarım günlük yönetici atölyeleri

**Uygulama Desteği:**
- **Özel Atölye Tasarımı**: Belirli kurumsal ihtiyaçlara yönelik uyarlanmış içerik
- **Pilot Program Yönetimi**: Başarı ölçütleri ve geri bildirim döngüleri ile yapılandırılmış uygulama  
- **Sürekli Mentorluk**: Atölye sonrası proje uygulama desteği
- **Topluluk Oluşturma**: İç Azure AI geliştirici toplulukları ve bilgi paylaşımı

**Başarı Ölçütleri:**
- **Beceri Edinimi**: Teknik yeterlilik gelişimini ölçen ön/son değerlendirmeler
- **Dağıtım Başarısı**: Katılımcıların üretim uygulamalarını başarılı dağıtım yüzdesi
- **Verimliliğe Geçiş Süresi**: Yeni Azure AI projeleri için işe alım süresinin kısalması
- **Bilgi Tutma**: Atölye sonrası 3-6 aylık takip değerlendirmeleri

## 8 Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel ve Hızlı Başlangıç (30-45 dakika) 🌱
**Önkoşullar**: Azure aboneliği, temel komut satırı bilgisi  
**Zorluk Seviyesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temellerini anlama
- AZD'yi platformunuza kurma  
- İlk başarılı dağıtımınız
- Temel kavramlar ve terminoloji

#### Öğrenme Kaynakları
- [AZD Temelleri](docs/chapter-01-foundation/azd-basics.md) - Temel kavramlar
- [Kurulum ve Yapılandırma](docs/chapter-01-foundation/installation.md) - Platforma özgü rehberler
- [İlk Projeniz](docs/chapter-01-foundation/first-project.md) - Uygulamalı eğitim
- [Komut Hızlı Referansı](resources/cheat-sheet.md) - Hızlı başvuru

#### Pratik Sonuç
AZD kullanarak basit bir web uygulamasını Azure’a başarılı bir şekilde dağıtmak

---

### Bölüm 2: AI-Öncelikli Geliştirme (Atölye dahil 4-5 saat) 🤖
**Önkoşullar**: Bölüm 1 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Microsoft Foundry entegrasyonu ile AZD kullanımı
- GA `microsoft.foundry` paket kurulumu ve hosted-agent kod dağıtımı
- Yerel Ajan Denetleyici testi ve ayrı değerlendirme veri setleri/kriterleri
- AI destekli uygulamaların dağıtımı
- AI hizmet yapılandırmalarını anlama
- RAG (Retrieval-Augmented Generation) desenleri

#### Öğrenme Kaynakları
- [Microsoft Foundry Entegrasyonu](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Hosted-Agent Adım Adım (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Başlatma, inceleme `azure.yaml`, sağlama, yerel test, dağıtım, değerlendirme ve temizleme
- [AI Ajanlar Kılavuzu](docs/chapter-02-ai-development/agents.md)
- [AI Model Dağıtımı](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI Atölye Labı](docs/chapter-02-ai-development/ai-workshop-lab.md) - **YENİ**: Kapsamlı 2-3 saatlik uygulamalı laboratuvar
- [Etkileşimli Atölye Kılavuzu](workshop/README.md) - **YENİ**: MkDocs önizlemeli tarayıcı tabanlı atölye
- [Microsoft Foundry Şablonları](README.md#featured-microsoft-foundry-templates)
- [Atölye Talimatları](../../workshop/docs/instructions) - **YENİ**: Adım adım yönlendirmeli egzersizler

#### Pratik Sonuç
GA paketi kullanarak yerel ve Foundry’de bir hosted agent testi yapmak, bir değerlendirme sonucunu incelemek ve yeni ile yeniden kullanılan projelerin temizliğini ayırmak. Ayrı RAG/atölye yolu AI destekli sohbet uygulaması yapılandırmasını kapsar.

#### Atölye Öğrenme Yolu (Opsiyonel Geliştirme)
**YENİ Etkileşimli Deneyim**: [Tam Atölye Kılavuzu](workshop/README.md)
1. **Keşif** (30 dk): Şablon seçimi ve değerlendirme
2. **Dağıtım** (45 dk): AI şablon işlevselliğini dağıtma ve doğrulama  
3. **Parçalarına Ayırma** (30 dk): Şablon mimarisi ve bileşenlerini anlama
4. **Yapılandırma** (30 dk): Ayarları ve parametreleri özelleştirme
5. **Özelleştirme** (45 dk): Şablonu kişiselleştirme ve yineleme yapma
6. **Kapatma** (15 dk): Kaynakları temizleme ve yaşam döngüsünü anlama
7. **Özet** (15 dk): Sonraki adımlar ve ileri öğrenme yolları

---

### Bölüm 3: Yapılandırma ve Kimlik Doğrulama (45-60 dakika) ⚙️
**Önkoşullar**: Bölüm 1 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak isimlendirme ve organizasyonu
- Çok ortamlı dağıtımlar

#### Öğrenme Kaynakları
- [Yapılandırma Kılavuzu](docs/chapter-03-configuration/configuration.md) - Ortam kurulumu
- [Kimlik Doğrulama ve Güvenlik Desenleri](docs/chapter-03-configuration/authsecurity.md) - Yönetilen kimlik ve Key Vault entegrasyonu
- Çok ortamlı örnekler

#### Pratik Sonuç
Çoklu ortamları uygun kimlik doğrulama ve güvenlik ile yönetmek

---

### Bölüm 4: Kod Olarak Altyapı ve Dağıtım (1-1.5 saat) 🏗️
**Önkoşullar**: Bölümler 1-3 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri dağıtım desenleri
- Bicep ile kod olarak altyapı
- Kaynak sağlama stratejileri
- Özel şablon oluşturma

- Azure Container Apps ve AZD ile kapsayıcı tabanlı uygulama dağıtımı

#### Öğrenme Kaynakları
- [Dağıtım Kılavuzu](docs/chapter-04-infrastructure/deployment-guide.md) - Tam iş akışları
- [Kaynak Sağlama](docs/chapter-04-infrastructure/provisioning.md) - Kaynak yönetimi
- Kapsayıcı ve mikro hizmet örnekleri
- [Kapsayıcı Uygulama Örnekleri](examples/container-app/README.md) - Hızlı başlangıç, üretim ve ileri dağıtım desenleri

#### Pratik Sonuç
Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamalar dağıtmak

---

### Bölüm 5: Çoklu Ajan AI Çözümleri (2-3 saat) 🤖🤖
**Önkoşullar**: Bölümler 1-2 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretim hazır AI dağıtımları
- Müşteri ve Envanter ajanı uygulamaları

- Ajan tabanlı çözümlerde kapsayıcılaştırılmış mikro hizmetlerin entegrasyonu

#### Öğrenme Kaynakları
- [Perakende Çoklu Ajan Çözümü](examples/retail-scenario.md) - Mimari taslak, tam uygulama değil
- [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Uygulama önkoşulları ile altyapı iskeleti
- Çoklu ajan koordinasyon desenleri
- [Mikroservis Mimarisi Örneği](../../examples/container-app/microservices) - Servisler arası iletişim, asenkron mesajlaşma ve üretim dağıtımı

#### Pratik Sonuç
Çoklu ajan AI çözümü tasarlamak ve uygulama dağıtımı, doğrulaması ve operasyonel işlerin altyapı sağlanmasının ötesindeki gereksinimlerini belirlemek

---

### Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama (1 saat) 🔍
**Önkoşullar**: Bölüm 4 tamamlandı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlaması ve kaynak doğrulama
- SKU seçim stratejileri
- Ön kontrol ve otomasyon
- Maliyet optimizasyonu planlaması

#### Öğrenme Kaynakları
- [Kapasite Planlama](docs/chapter-06-pre-deployment/capacity-planning.md) - Kaynak doğrulama
- [SKU Seçimi](docs/chapter-06-pre-deployment/sku-selection.md) - Maliyet-etkin seçimler
- [Uçuş Öncesi Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Otomatik betikler
- [Application Insights Entegrasyonu](docs/chapter-06-pre-deployment/application-insights.md) - İzleme ve gözlemlenebilirlik
- [Çoklu Ajan Koordinasyon Desenleri](docs/chapter-06-pre-deployment/coordination-patterns.md) - Ajan orkestrasyon stratejileri

#### Pratik Sonuç
Dağıtımları yürütmeden önce doğrulayın ve optimize edin

---

### Bölüm 7: Sorun Giderme ve Hata Ayıklama (1-1.5 saat) 🔧
**Önkoşullar**: Herhangi bir dağıtım bölümü tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- Yapay zekaya özgü sorun giderme
- Performans optimizasyonu

#### Öğrenme Kaynakları
- [Yaygın Sorunlar](docs/chapter-07-troubleshooting/common-issues.md) - SSS ve çözümler
- [Hata Ayıklama Rehberi](docs/chapter-07-troubleshooting/debugging.md) - Adım adım stratejiler
- [Yapay Zekaya Özgü Sorun Giderme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI servis problemleri

#### Pratik Sonuç
Yaygın dağıtım sorunlarını bağımsız olarak teşhis edip çözün

---

### Bölüm 8: Üretim ve Kurumsal Desenler (2-3 saat) 🏢
**Önkoşullar**: Bölüm 1-4 tamamlanmış  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu
- Ölçeklenebilirlik ve yönetişim

- Üretim konteyner uygulaması dağıtımları için en iyi uygulamalar (güvenlik, izleme, maliyet, CI/CD)

#### Öğrenme Kaynakları
- [Üretim AI En İyi Uygulamaları](docs/chapter-08-production/production-ai-practices.md) - Kurumsal desenler
- Mikroservisler ve kurumsal örnekler
- İzleme ve yönetişim çerçeveleri
- [Mikroservis Mimarisi Örneği](../../examples/container-app/microservices) - Mavi-yeşil/canary dağıtımı, dağıtılmış izleme ve maliyet optimizasyonu

#### Pratik Sonuç
Tam üretim özelliklerine sahip kurumsal hazır uygulamaları dağıtın

---

## Öğrenme İlerleyişi ve Zorluk Düzeyi

### Aşamalı Beceri Geliştirme

- **🌱 Başlangıç**: Bölüm 1 (Temel) → Bölüm 2 (Yapay Zeka Geliştirme)
- **🔧 Orta Seviye**: Bölüm 3-4 (Yapılandırma & Altyapı) → Bölüm 6 (Doğrulama)
- **🚀 İleri Seviye**: Bölüm 5 (Çoklu Ajan Çözümleri) → Bölüm 7 (Sorun Giderme)
- **🏢 Kurumsal**: Tüm bölümleri tamamlayın, Bölüm 8 (Üretim Desenleri) odaklanın

- **Konteyner Uygulama Yolu**: Bölüm 4 (Konteynerli dağıtım), 5 (Mikroservis entegrasyonu), 8 (Üretim en iyi uygulamaları)

### Zorluk Göstergeleri

- **⭐ Temel**: Tek kavramlar, rehberli eğitimler, 30-60 dakika
- **⭐⭐ Orta**: Çoklu kavramlar, uygulamalı pratik, 1-2 saat  
- **⭐⭐⭐ İleri**: Karmaşık mimariler, özel çözümler, 1-3 saat
- **⭐⭐⭐⭐ Uzman**: Üretim sistemleri, kurumsal desenler, 2-4 saat

### Esnek Öğrenme Yolları

#### 🎯 Yapay Zeka Geliştirici Hızlı Yol (4-6 saat)
1. **Bölüm 1**: Temel & Hızlı Başlangıç (45 dk)
2. **Bölüm 2**: Yapay Zeka Öncelikli Geliştirme (2 saat)  
3. **Bölüm 5**: Çoklu Ajan Yapay Zeka Çözümleri (3 saat)
4. **Bölüm 8**: Üretim AI En İyi Uygulamaları (1 saat)

#### 🛠️ Altyapı Uzmanı Yolu (5-7 saat)
1. **Bölüm 1**: Temel & Hızlı Başlangıç (45 dk)
2. **Bölüm 3**: Yapılandırma & Kimlik Doğrulama (1 saat)
3. **Bölüm 4**: Altyapı Kod Olarak & Dağıtım (1.5 saat)
4. **Bölüm 6**: Dağıtım Öncesi Doğrulama & Planlama (1 saat)
5. **Bölüm 7**: Sorun Giderme & Hata Ayıklama (1.5 saat)
6. **Bölüm 8**: Üretim & Kurumsal Desenler (2 saat)

#### 🎓 Tam Öğrenme Yolculuğu (8-12 saat)
Tüm 8 bölümü sırasıyla tamamlama, uygulamalı pratik ve doğrulama ile

## Kurs Tamamlama Çerçevesi

### Bilgi Doğrulama
- **Bölüm Kontrolleri**: Ölçülebilir sonuçlarla pratik alıştırmalar
- **Uygulamalı Doğrulama**: Her bölüm için çalışan çözümler dağıtın
- **İlerleme Takibi**: Görsel göstergeler ve tamamlama rozetleri
- **Topluluk Doğrulaması**: Deneyimleri Azure Discord kanallarında paylaşın

### Öğrenme Sonuçları Değerlendirmesi

#### Bölüm 1-2 Tamamlama (Temel + AI)
- ✅ AZD kullanarak temel web uygulaması dağıtın
- ✅ RAG destekli yapay zeka sohbet uygulaması dağıtın
- ✅ AZD temel kavramları ve AI entegrasyonunu anlayın

#### Bölüm 3-4 Tamamlama (Yapılandırma + Altyapı)  
- ✅ Çoklu ortam dağıtımlarını yönetin
- ✅ Özel Bicep altyapı şablonları oluşturun
- ✅ Güvenli kimlik doğrulama desenlerini uygulayın

#### Bölüm 5-6 Tamamlama (Çoklu Ajan + Doğrulama)
- ✅ Karmaşık çoklu ajan yapay zeka çözümü dağıtın
- ✅ Kapasite planlaması ve maliyet optimizasyonu yapın
- ✅ Otomatik dağıtım öncesi doğrulama uygulayın

#### Bölüm 7-8 Tamamlama (Sorun Giderme + Üretim)
- ✅ Dağıtım sorunlarını bağımsız şekilde hata ayıkla ve çöz
- ✅ Kurumsal düzeyde izleme ve güvenliği uygulayın
- ✅ Yönetişimle üretim hazır uygulamaları dağıtın

### Sertifikasyon ve Tanınırlık
- **Kurs Tamamlama Rozeti**: Tüm 8 bölümü pratik doğrulama ile tamamlayın
- **Topluluk Tanınırlığı**: Microsoft Foundry Discord etkin katılımı
- **Mesleki Gelişim**: Sektöre uygun AZD ve AI dağıtım becerileri
- **Kariyer İlerlemesi**: Kurumsal hazır bulut dağıtım yetenekleri

## 🎓 Kapsamlı Öğrenme Sonuçları

### Temel Seviye (Bölüm 1-2)
Temel bölümler tamamlandığında, öğrenenler:

**Teknik Yetenekler:**
- AZD komutları ile Azure'a basit web uygulamaları dağıtın
- RAG özellikli AI sohbet uygulamalarını yapılandırıp dağıtın
- AZD temel kavramlarını anlayın: şablonlar, ortamlar, sağlama iş akışları
- Microsoft Foundry servislerini AZD dağıtımlarıyla entegre edin
- Azure AI servis yapılandırmaları ve API uç noktalarında gezinme

**Profesyonel Beceriler:**
- Tutarlı sonuçlar için yapılandırılmış dağıtım iş akışlarını takip edin
- Loglar ve dokümantasyon kullanarak temel dağıtım sorunlarını giderin
- Bulut dağıtım süreçleri hakkında etkin iletişim kurun
- Güvenli AI servis entegrasyonu için en iyi uygulamaları uygulayın

**Öğrenme Doğrulaması:**
- ✅ `todo-nodejs-mongo` şablonunu başarıyla dağıtın
- ✅ RAG ile `azure-search-openai-demo` yapılandırıp dağıtın
- ✅ Etkileşimli atölye çalışması alıştırmalarını tamamlayın (Keşif aşaması)
- ✅ Azure Discord topluluk tartışmalarına katılın

### Orta Seviye (Bölüm 3-4)
Tamamlandığında, öğrenenler şunları gösterecek:

**Teknik Yetenekler:**
- Çoklu ortam dağıtımlarını yönetin (geliştirme, test, üretim)
- Kod olarak altyapı için özel Bicep şablonları oluşturun
- Yönetilen kimlik ile güvenli kimlik doğrulama desenleri uygulayın
- Özel yapılandırmalarla karmaşık çok servisli uygulamalar dağıtın
- Maliyet ve performans için kaynak sağlama stratejilerini optimize edin

**Profesyonel Beceriler:**
- Ölçeklenebilir altyapı mimarileri tasarlayın
- Bulut dağıtımları için güvenlik en iyi uygulamalarını uygulayın
- Ekip iş birliği için altyapı desenlerini belgeleyin
- Gereksinimler için uygun Azure servislerini değerlendirin ve seçin

**Öğrenme Doğrulaması:**
- ✅ Ortama özgü ayarlarla ayrı ortamlar yapılandırın
- ✅ Çok servisli uygulama için özel Bicep şablonu oluşturup dağıtın
- ✅ Güvenli erişim için yönetilen kimlik kimlik doğrulamayı uygulayın
- ✅ Gerçek senaryolarla yapılandırma yönetimi alıştırmalarını tamamlayın

### İleri Seviye (Bölüm 5-6)
Tamamlandığında, öğrenenler:

**Teknik Yetenekler:**
- Koordine iş akışlı çoklu ajan AI çözümlerini dağıtın ve yönetin
- Perakende senaryoları için Müşteri ve Envanter ajan mimarilerini uygulayın
- Kapsamlı kapasite planlaması ve kaynak doğrulaması yapın
- Otomatik dağıtım öncesi doğrulama ve optimizasyonu yürütün
- İş yükü gereksinimlerine göre maliyet etkin SKU seçimi tasarlayın

**Profesyonel Beceriler:**
- Üretim ortamları için karmaşık AI çözümleri tasarlayın
- AI dağıtım stratejileri hakkında teknik tartışmalara liderlik edin
- Junior geliştiricilere AZD ve AI dağıtım en iyi uygulamalarında rehberlik edin
- İş gereksinimleri için AI mimari desenlerini değerlendirin ve önerin

**Öğrenme Doğrulaması:**
- ✅ Perakende çoklu ajan kılavuzunu inceleyin ve sağlanan altyapı ile eksik uygulamayı ayırt edin
- ✅ Ajan koordinasyonu ve iş akışı orkestrasyonunu gösterin
- ✅ Gerçek kaynak kısıtlarıyla kapasite planlama alıştırmalarını tamamlayın
- ✅ Otomatik uçuş öncesi kontrollerle dağıtım hazırlığını doğrulayın

### Uzman Seviyesi (Bölüm 7-8)
Tamamlandığında, öğrenenler:

**Teknik Yetenekler:**
- Karmaşık dağıtım sorunlarını bağımsız olarak teşhis edip çözün
- Kurumsal düzeyde güvenlik desenleri ve yönetişim çerçeveleri uygulayın
- Kapsamlı izleme ve uyarı stratejileri tasarlayın
- Ölçek, maliyet ve performans için üretim dağıtımlarını optimize edin
- Doğru test ve doğrulama ile CI/CD boru hatları oluşturun

**Profesyonel Beceriler:**
- Kurumsal bulut dönüşümü girişimlerine liderlik edin
- Kurumsal dağıtım standartlarını tasarlayıp uygulayın
- Geliştirme ekiplerini ileri AZD uygulamalarında eğitin ve rehberlik edin
- Kurumsal AI dağıtımları için teknik karar alma süreçlerini etkileyin

**Öğrenme Doğrulaması:**
- ✅ Karmaşık çok servisli dağıtım hatalarını çözün
- ✅ Uyum gereksinimleriyle kurumsal güvenlik desenlerini uygulayın
- ✅ Application Insights ile üretim izleme tasarlayıp konuşlandırın
- ✅ Kurumsal yönetişim çerçevesi uygulamasını tamamlayın

## 🎯 Kurs Tamamlama Sertifikası

### İlerleme Takip Çerçevesi
Yapılandırılmış kontrol noktaları ile öğrenme ilerlemenizi takip edin:

- [ ] **Bölüm 1**: Temel & Hızlı Başlangıç ✅
- [ ] **Bölüm 2**: Yapay Zeka Öncelikli Geliştirme ✅  
- [ ] **Bölüm 3**: Yapılandırma & Kimlik Doğrulama ✅
- [ ] **Bölüm 4**: Altyapı Kod Olarak & Dağıtım ✅
- [ ] **Bölüm 5**: Çoklu Ajan AI Çözümleri ✅
- [ ] **Bölüm 6**: Dağıtım Öncesi Doğrulama & Planlama ✅
- [ ] **Bölüm 7**: Sorun Giderme & Hata Ayıklama ✅
- [ ] **Bölüm 8**: Üretim & Kurumsal Desenler ✅

### Doğrulama Süreci
Her bölümü tamamladıktan sonra bilginizi şu yollarla doğrulayın:

1. **Pratik Alıştırma Tamamlama**: Her bölüm için çalışan çözümler dağıtın
2. **Bilgi Değerlendirmesi**: SSS bölümlerini gözden geçirin ve kendinizi değerlendirin
3. **Topluluk Katılımı**: Deneyimlerinizi paylaşın ve Azure Discord’da geri bildirim alın
4. **Portföy Geliştirme**: Dağıtımlarınızı ve öğrenilen dersleri belgeleyin
5. **Akran Değerlendirmesi**: Karmaşık senaryolarda diğer öğrenenlerle iş birliği yapın

### Kurs Tamamlamanın Faydaları
Tüm bölümler ve doğrulamalar tamamlandığında mezunlar:

**Teknik Uzmanlık:**
- **Üretim Deneyimi**: Gerçek AI uygulamalarını Azure ortamlarına dağıttı
- **Mesleki Beceriler**: Kurumsal hazır dağıtım ve sorun giderme yetenekleri  
- **Mimari Bilgi**: Çoklu ajan AI çözümleri ve karmaşık altyapı desenleri
- **Sorun Giderme Ustalığı**: Dağıtım ve yapılandırma sorunlarını bağımsız çözümledi

**Mesleki Gelişim:**
- **Sektör Tanınırlığı**: Yüksek talep gören AZD ve AI dağıtım alanlarında doğrulanabilir beceriler
- **Kariyer İlerlemesi**: Bulut mimarı ve AI dağıtım uzmanı rolleri için nitelikler
- **Topluluk Liderliği**: Azure geliştirici ve AI topluluklarında aktif üyelik
- **Sürekli Öğrenme**: İleri Microsoft Foundry uzmanlığı için temel

**Portföy Varlıkları:**
- **Dağıtılmış Çözümler**: AI uygulamaları ve altyapı desenlerinin çalışan örnekleri
- **Dokümantasyon**: Kapsamlı dağıtım kılavuzları ve sorun giderme prosedürleri  
- **Topluluk Katkıları**: Azure topluluğu ile paylaşılan tartışmalar, örnekler ve geliştirmeler
- **Profesyonel Ağ**: Azure uzmanları ve AI dağıtım uygulayıcılarıyla bağlantılar

### Kurs Sonrası Öğrenme Yolu
Mezunlar ileri uzmanlık için hazırlanır:
- **Microsoft Foundry Uzmanı**: AI model dağıtımı ve orkestrasyonda derin uzmanlık
- **Bulut Mimarlık Liderliği**: Kurumsal ölçek dağıtım tasarımı ve yönetişimi
- **Geliştirici Topluluğu Liderliği**: Azure örnekleri ve topluluk kaynaklarına katkı
- **Kurumsal Eğitim**: Organizasyonlarda AZD ve AI dağıtım becerilerinin öğretilmesi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->