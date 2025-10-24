<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:17:57+00:00",
  "source_file": "changelog.md",
  "language_code": "tr"
}
-->
# Değişiklik Günlüğü - AZD Yeni Başlayanlar İçin

## Giriş

Bu değişiklik günlüğü, AZD Yeni Başlayanlar İçin deposundaki tüm önemli değişiklikleri, güncellemeleri ve iyileştirmeleri belgeler. Semantik sürümleme ilkelerini takip ediyoruz ve kullanıcıların sürümler arasındaki değişiklikleri anlamalarına yardımcı olmak için bu günlüğü tutuyoruz.

## Öğrenme Hedefleri

Bu değişiklik günlüğünü inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında bilgi sahibi olabilirsiniz
- Mevcut belgelerde yapılan iyileştirmeleri anlayabilirsiniz
- Hataları ve düzeltmeleri takip ederek doğruluğu sağlayabilirsiniz
- Öğrenme materyallerinin zaman içindeki gelişimini izleyebilirsiniz

## Öğrenme Çıktıları

Değişiklik günlüğü girişlerini inceledikten sonra:
- Öğrenme için mevcut yeni içerik ve kaynakları tanımlayabilirsiniz
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlayabilirsiniz
- En güncel materyallere göre öğrenme yolunuzu planlayabilirsiniz
- Gelecekteki iyileştirmeler için geri bildirim ve önerilerde bulunabilirsiniz

## Sürüm Geçmişi

### [v3.4.0] - 2025-10-24

#### Altyapı Önizleme ve Doğrulama İyileştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve atölye kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Özellik Belgeleri**: Yeni altyapı önizleme yeteneği için kapsamlı içerik
  - Komut referansı ve kullanım örnekleri içeren hızlı rehber
  - Kullanım kılavuzunda detaylı entegrasyon, kullanım senaryoları ve faydalar
  - Daha güvenli dağıtım doğrulaması için ön kontrol entegrasyonu
  - Güvenlik odaklı dağıtım uygulamalarıyla başlangıç rehberi güncellemeleri
- **🚧 Atölye Durum Bannerı**: Atölye geliştirme durumunu belirten profesyonel HTML bannerı
  - Kullanıcı iletişimi için gradient tasarım ve inşaat göstergeleri
  - Şeffaflık için son güncelleme zaman damgası
  - Tüm cihaz türleri için mobil uyumlu tasarım

#### Geliştirildi
- **Altyapı Güvenliği**: Önizleme işlevi dağıtım belgelerine entegre edildi
- **Dağıtım Öncesi Doğrulama**: Otomatik scriptler artık altyapı önizleme testlerini içeriyor
- **Geliştirici İş Akışı**: Önizleme en iyi uygulama olarak komut dizilerine eklendi
- **Atölye Deneyimi**: Kullanıcılara içerik geliştirme durumu hakkında net beklentiler sunuldu

#### Değiştirildi
- **Dağıtım En İyi Uygulamaları**: Önizleme odaklı iş akışı artık önerilen yaklaşım
- **Belge Akışı**: Altyapı doğrulaması öğrenme sürecinde daha erken bir aşamaya taşındı
- **Atölye Sunumu**: Geliştirme zaman çizelgesiyle profesyonel durum iletişimi

#### İyileştirildi
- **Güvenlik Odaklı Yaklaşım**: Altyapı değişiklikleri artık dağıtımdan önce doğrulanabilir
- **Ekip İşbirliği**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Maliyet Farkındalığı**: Kaynak maliyetlerini dağıtımdan önce daha iyi anlama
- **Risk Azaltma**: Önceden doğrulama ile dağıtım hatalarının azaltılması

#### Teknik Uygulama
- **Çoklu Belge Entegrasyonu**: Önizleme özelliği 4 ana dosyada belgelenmiştir
- **Komut Kalıpları**: Belgelerde tutarlı sözdizimi ve örnekler
- **En İyi Uygulama Entegrasyonu**: Önizleme doğrulama iş akışlarına ve scriptlere dahil edildi
- **Görsel Göstergeler**: Keşfedilebilirlik için net YENİ özellik işaretlemeleri

#### Atölye Altyapısı
- **Durum İletişimi**: Gradient tasarımlı profesyonel HTML banner
- **Kullanıcı Deneyimi**: Net geliştirme durumu kafa karışıklığını önler
- **Profesyonel Sunum**: Depo güvenilirliğini korurken beklentileri belirler
- **Zaman Çizelgesi Şeffaflığı**: Ekim 2025 son güncelleme zaman damgası ile hesap verebilirlik

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli rehberler ve yapılandırılmış öğrenme yolları ile kapsamlı atölye materyalleri sunar.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme özelliği ile tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye kadar 7 adımlı rehberli öğrenme yolu
  - 0-Giriş: Atölye genel bakışı ve kurulum
  - 1-AI-Şablon-Seçimi: Şablon keşfi ve seçim süreci
  - 2-AI-Şablon-Doğrulama: Dağıtım ve doğrulama prosedürleri
  - 3-AI-Şablon-Parçalama: Şablon mimarisini anlama
  - 4-AI-Şablon-Yapılandırma: Yapılandırma ve özelleştirme
  - 5-AI-Şablon-Özelleştirme: İleri düzey değişiklikler ve iterasyonlar
  - 6-Altyapı-Temizleme: Temizlik ve kaynak yönetimi
  - 7-Kapanış: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Material teması ile MkDocs yapılandırması, öğrenme deneyimini geliştirmek için
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Sorunsuz geliştirme ortamı kurulumu

#### Geliştirildi
- **AI Atölye Laboratuvarı**: 2-3 saatlik yapılandırılmış öğrenme deneyimi ile genişletildi
- **Atölye Belgeleri**: Profesyonel sunum, navigasyon ve görsel yardımlarla
- **Öğrenme İlerlemesi**: Şablon seçiminden üretim dağıtımına kadar net adım adım rehberlik
- **Geliştirici Deneyimi**: Entegre araçlar ile sorunsuz geliştirme iş akışları

#### İyileştirildi
- **Erişilebilirlik**: Arama, kopyalama işlevi ve tema geçişi ile tarayıcı tabanlı arayüz
- **Kendi Hızında Öğrenme**: Farklı öğrenme hızlarına uyum sağlayan esnek atölye yapısı
- **Pratik Uygulama**: Gerçek dünya AI şablon dağıtım senaryoları
- **Topluluk Entegrasyonu**: Atölye desteği ve işbirliği için Discord entegrasyonu

#### Atölye Özellikleri
- **Yerleşik Arama**: Hızlı anahtar kelime ve ders keşfi
- **Kod Bloklarını Kopyala**: Tüm kod örnekleri için üzerine gelince kopyalama işlevi
- **Tema Geçişi**: Farklı tercihler için karanlık/açık mod desteği
- **Görsel Varlıklar**: Gelişmiş anlayış için ekran görüntüleri ve diyagramlar
- **Yardım Entegrasyonu**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Büyük Navigasyon Yeniden Yapılandırması ve Bölüm Tabanlı Öğrenme Sistemi
**Bu sürüm, tüm depo boyunca geliştirilmiş navigasyon ile kapsamlı bir bölüm tabanlı öğrenme yapısı sunar.**

#### Eklendi
- **📚 Bölüm Tabanlı Öğrenme Sistemi**: Kursun tamamı 8 ilerleyici öğrenme bölümüne yeniden yapılandırıldı
  - Bölüm 1: Temel & Hızlı Başlangıç (⭐ - 30-45 dk)
  - Bölüm 2: AI-Öncelikli Geliştirme (⭐⭐ - 1-2 saat)
  - Bölüm 3: Yapılandırma & Kimlik Doğrulama (⭐⭐ - 45-60 dk)
  - Bölüm 4: Kod Olarak Altyapı & Dağıtım (⭐⭐⭐ - 1-1.5 saat)
  - Bölüm 5: Çoklu-Ajan AI Çözümleri (⭐⭐⭐⭐ - 2-3 saat)
  - Bölüm 6: Dağıtım Öncesi Doğrulama & Planlama (⭐⭐ - 1 saat)
  - Bölüm 7: Sorun Giderme & Hata Ayıklama (⭐⭐ - 1-1.5 saat)
  - Bölüm 8: Üretim & Kurumsal Modeller (⭐⭐⭐⭐ - 2-3 saat)
- **📚 Kapsamlı Navigasyon Sistemi**: Tüm belgelerde tutarlı navigasyon başlıkları ve altbilgiler
- **🎯 İlerleme Takibi**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Öğrenme Yolu Rehberliği**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Çapraz Referans Navigasyonu**: İlgili bölümler ve ön koşullar açıkça bağlantılı

#### Geliştirildi
- **README Yapısı**: Bölüm tabanlı organizasyon ile yapılandırılmış bir öğrenme platformuna dönüştürüldü
- **Belge Navigasyonu**: Her sayfa artık bölüm bağlamı ve ilerleme rehberliği içeriyor
- **Şablon Organizasyonu**: Örnekler ve şablonlar uygun öğrenme bölümlerine eşlendi
- **Kaynak Entegrasyonu**: Hızlı rehberler, SSS'ler ve çalışma kılavuzları ilgili bölümlere bağlandı
- **Atölye Entegrasyonu**: Uygulamalı laboratuvarlar birden fazla bölüm öğrenme hedeflerine eşlendi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Doğrusal belgelerden esnek bölüm tabanlı öğrenmeye taşındı
- **Yapılandırma Yerleşimi**: Daha iyi öğrenme akışı için yapılandırma rehberi Bölüm 3'e taşındı
- **AI İçerik Entegrasyonu**: Öğrenme yolculuğu boyunca AI'ye özgü içerik daha iyi entegre edildi
- **Üretim İçeriği**: İleri düzey modeller kurumsal öğreniciler için Bölüm 8'de birleştirildi

#### İyileştirildi
- **Kullanıcı Deneyimi**: Net navigasyon izleri ve bölüm ilerleme göstergeleri
- **Erişilebilirlik**: Daha kolay kurs gezintisi için tutarlı navigasyon desenleri
- **Profesyonel Sunum**: Akademik ve kurumsal eğitim için uygun üniversite tarzı kurs yapısı
- **Öğrenme Verimliliği**: Geliştirilmiş organizasyon sayesinde ilgili içeriği bulma süresi azaltıldı

#### Teknik Uygulama
- **Navigasyon Başlıkları**: 40'tan fazla belge dosyasında standartlaştırılmış bölüm navigasyonu
- **Altbilgi Navigasyonu**: Tutarlı ilerleme rehberliği ve bölüm tamamlama göstergeleri
- **Çapraz Bağlantı**: İlgili kavramları bağlayan kapsamlı iç bağlantı sistemi
- **Bölüm Eşlemesi**: Şablonlar ve örnekler açıkça öğrenme hedefleriyle ilişkilendirildi

#### Çalışma Kılavuzu İyileştirmesi
- **📚 Kapsamlı Öğrenme Hedefleri**: Çalışma kılavuzu 8 bölüm sistemine uygun şekilde yeniden yapılandırıldı
- **🎯 Bölüm Tabanlı Değerlendirme**: Her bölüm belirli öğrenme hedefleri ve pratik egzersizler içerir
- **📋 İlerleme Takibi**: Haftalık öğrenme programı ile ölçülebilir sonuçlar ve tamamlama kontrol listeleri
- **❓ Değerlendirme Soruları**: Her bölüm için bilgi doğrulama soruları ve profesyonel sonuçlar
- **🛠️ Pratik Egzersizler**: Gerçek dağıtım senaryoları ve sorun giderme ile uygulamalı aktiviteler
- **📊 Beceri İlerlemesi**: Temel kavramlardan kurumsal modellere net ilerleme ile kariyer gelişimi odaklı
- **🎓 Sertifikasyon Çerçevesi**: Profesyonel gelişim sonuçları ve topluluk tanıma sistemi
- **⏱️ Zaman Yönetimi**: Yapılandırılmış 10 haftalık öğrenme planı ile kilometre taşı doğrulaması

### [v3.1.0] - 2025-09-17

#### Geliştirilmiş Çoklu-Ajan AI Çözümleri
**Bu sürüm, daha iyi ajan adlandırma ve geliştirilmiş belgelerle çoklu-ajan perakende çözümünü iyileştirir.**

#### Değiştirildi
- **Çoklu-Ajan Terminolojisi**: Perakende çoklu-ajan çözümünde "Cora ajanı" yerine "Müşteri ajanı" kullanıldı
- **Ajan Mimarisi**: Tüm belgeler, ARM şablonları ve kod örnekleri "Müşteri ajanı" adlandırmasını kullanacak şekilde güncellendi
- **Yapılandırma Örnekleri**: Güncellenmiş adlandırma kurallarıyla ajan yapılandırma desenleri modernize edildi
- **Belge Tutarlılığı**: Tüm referanslar profesyonel, açıklayıcı ajan adlarını kullanacak şekilde düzenlendi

#### Geliştirildi
- **ARM Şablon Paketi**: retail-multiagent-arm-template, Müşteri ajanı referanslarıyla güncellendi
- **Mimari Diyagramlar**: Güncellenmiş ajan adlandırmasıyla Mermaid diyagramları yenilendi
- **Kod Örnekleri**: Python sınıfları ve uygulama örnekleri artık CustomerAgent adlandırmasını kullanıyor
- **Ortam Değişkenleri**: Tüm dağıtım scriptleri CUSTOMER_AGENT_NAME kurallarını kullanacak şekilde güncellendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Belgelerde daha net ajan rolleri ve sorumlulukları
- **Üretim Hazırlığı**: Kurumsal adlandırma kurallarıyla daha iyi uyum
- **Öğrenme Materyalleri**: Eğitim amaçları için daha sezgisel ajan adlandırması
- **Şablon Kullanılabilirliği**: Ajan işlevlerini ve dağıtım desenlerini daha basit anlama

#### Teknik Detaylar
- Güncellenmiş Mermaid mimari diyagramları CustomerAgent referanslarıyla
- Python örneklerinde CoraAgent sınıf adları CustomerAgent ile değiştirildi
- ARM şablon JSON yapılandırmaları "müşteri" ajan türünü kullanacak şekilde değiştirildi
- CORA_AGENT_* ortam değişkenleri CUSTOMER_AGENT_* desenleriyle değiştirildi
- Tüm dağıtım komutları ve konteyner yapılandırmaları yenilendi

### [v3.0.0] - 2025-09-12

#### Büyük Değişiklikler - AI Geliştirici Odaklı ve Azure AI Foundry Entegrasyonu
**Bu sürüm, depoyu Azure AI Foundry entegrasyonu ile kapsamlı bir AI odaklı öğrenme kaynağına dönüştürür.**

#### Eklendi
- **🤖 AI-Öncelikli Öğrenme Yolu**: AI geliştiricileri ve mühendislerini önceliklendiren tam yeniden yapılandırma
- **Azure AI Foundry Entegrasyon Rehberi**: AZD'yi Azure AI Foundry hizmetleriyle bağlamak için kapsamlı belgeler
- **AI Model Dağıtım Desenleri**: Model seçimi, yapılandırma ve üretim dağıtım stratejilerini kapsayan detaylı rehber
- **AI Atölye Laboratuvarı**: AI uygulamalarını AZD dağıtılabilir çözümlere dönüştürmek için 2-3 saatlik uygulamalı atölye
- **Üretim AI En İyi Uygulamaları**: AI iş yüklerini ölçeklendirme, izleme ve güvence altına alma için kurumsal hazır desenler
- **AI'ye Özgü Sorun Giderme Rehberi**: Azure OpenAI, Cognitive Services ve AI dağıtım sorunları için kapsamlı sorun giderme
- **AI Şablon Galerisi**: Karmaşıklık dereceleriyle öne çıkan Azure AI Foundry şablon koleksiyonu
- **Atölye Materyalleri**: Uygulamalı laboratuvarlar ve referans materyaller
- **Dokümantasyon Formatı**: Tüm dokümantasyon, öğrenme odaklı yapı ile standart hale getirildi
- **Navigasyon Akışı**: Tüm öğrenme materyalleri için mantıklı bir ilerleme düzeni uygulandı
- **İçerik Sunumu**: Dekoratif unsurlar kaldırılarak net ve profesyonel bir format tercih edildi
- **Bağlantı Yapısı**: Yeni navigasyon sistemini desteklemek için tüm dahili bağlantılar güncellendi

#### İyileştirildi
- **Erişilebilirlik**: Ekran okuyucu uyumluluğunu artırmak için emoji bağımlılıkları kaldırıldı
- **Profesyonel Görünüm**: Kurumsal öğrenim için uygun, temiz ve akademik tarzda sunum
- **Öğrenme Deneyimi**: Her ders için net hedefler ve sonuçlarla yapılandırılmış bir yaklaşım
- **İçerik Organizasyonu**: İlgili konular arasında daha iyi mantıksal akış ve bağlantı

### [v1.0.0] - 2025-09-09

#### İlk Yayın - Kapsamlı AZD Öğrenim Deposu

#### Eklenenler
- **Temel Dokümantasyon Yapısı**
  - Tam başlangıç rehberi serisi
  - Kapsamlı dağıtım ve sağlama dokümantasyonu
  - Ayrıntılı sorun giderme kaynakları ve hata ayıklama rehberleri
  - Dağıtım öncesi doğrulama araçları ve prosedürleri

- **Başlangıç Modülü**
  - AZD Temelleri: Temel kavramlar ve terminoloji
  - Kurulum Rehberi: Platforma özel kurulum talimatları
  - Yapılandırma Rehberi: Ortam ayarları ve kimlik doğrulama
  - İlk Proje Eğitimi: Adım adım uygulamalı öğrenim

- **Dağıtım ve Sağlama Modülü**
  - Dağıtım Rehberi: Tam iş akışı dokümantasyonu
  - Sağlama Rehberi: Bicep ile Kod Olarak Altyapı
  - Üretim dağıtımları için en iyi uygulamalar
  - Çok hizmetli mimari desenler

- **Dağıtım Öncesi Doğrulama Modülü**
  - Kapasite Planlama: Azure kaynak kullanılabilirliği doğrulaması
  - SKU Seçimi: Kapsamlı hizmet seviyesi rehberi
  - Ön Kontroller: Otomatik doğrulama betikleri (PowerShell ve Bash)
  - Maliyet tahmini ve bütçe planlama araçları

- **Sorun Giderme Modülü**
  - Yaygın Sorunlar: Sık karşılaşılan problemler ve çözümleri
  - Hata Ayıklama Rehberi: Sistematik sorun giderme yöntemleri
  - Gelişmiş tanı teknikleri ve araçları
  - Performans izleme ve optimizasyon

- **Kaynaklar ve Referanslar**
  - Komut Hızlı Rehberi: Temel komutlar için hızlı referans
  - Sözlük: Kapsamlı terminoloji ve kısaltma tanımları
  - SSS: Yaygın sorulara ayrıntılı yanıtlar
  - Harici kaynak bağlantıları ve topluluk bağlantıları

- **Örnekler ve Şablonlar**
  - Basit Web Uygulaması örneği
  - Statik Web Sitesi dağıtım şablonu
  - Konteyner Uygulaması yapılandırması
  - Veritabanı entegrasyon desenleri
  - Mikro hizmet mimarisi örnekleri
  - Sunucusuz fonksiyon uygulamaları

#### Özellikler
- **Çoklu Platform Desteği**: Windows, macOS ve Linux için kurulum ve yapılandırma rehberleri
- **Farklı Beceri Seviyeleri**: Öğrencilerden profesyonel geliştiricilere kadar tasarlanmış içerik
- **Pratik Odaklı**: Uygulamalı örnekler ve gerçek dünya senaryoları
- **Kapsamlı Kapsama**: Temel kavramlardan ileri düzey kurumsal desenlere kadar
- **Güvenlik Önceliği**: Güvenlik en iyi uygulamaları her yerde entegre edildi
- **Maliyet Optimizasyonu**: Maliyet etkin dağıtımlar ve kaynak yönetimi için rehberlik

#### Dokümantasyon Kalitesi
- **Ayrıntılı Kod Örnekleri**: Pratik, test edilmiş kod örnekleri
- **Adım Adım Talimatlar**: Net, uygulanabilir rehberlik
- **Kapsamlı Hata Yönetimi**: Yaygın sorunlar için sorun giderme
- **En İyi Uygulama Entegrasyonu**: Endüstri standartları ve öneriler
- **Sürüm Uyumluluğu**: En son Azure hizmetleri ve azd özellikleriyle güncel

## Planlanan Gelecek Geliştirmeler

### Sürüm 3.1.0 (Planlandı)
#### AI Platformu Genişletmesi
- **Çoklu Model Desteği**: Hugging Face, Azure Machine Learning ve özel modeller için entegrasyon desenleri
- **AI Agent Çerçeveleri**: LangChain, Semantic Kernel ve AutoGen dağıtımları için şablonlar
- **Gelişmiş RAG Desenleri**: Azure AI Search dışında vektör veritabanı seçenekleri (Pinecone, Weaviate vb.)
- **AI İzlenebilirlik**: Model performansı, token kullanımı ve yanıt kalitesi için gelişmiş izleme

#### Geliştirici Deneyimi
- **VS Code Uzantısı**: AZD + AI Foundry geliştirme deneyimi entegrasyonu
- **GitHub Copilot Entegrasyonu**: AI destekli AZD şablon oluşturma
- **Etkileşimli Eğitimler**: AI senaryoları için otomatik doğrulama ile uygulamalı kodlama alıştırmaları
- **Video İçeriği**: AI dağıtımlarına odaklanan görsel öğreniciler için ek video eğitimleri

### Sürüm 4.0.0 (Planlandı)
#### Kurumsal AI Desenleri
- **Yönetim Çerçevesi**: AI model yönetimi, uyumluluk ve denetim izleri
- **Çok Kiracılı AI**: İzole AI hizmetleriyle birden fazla müşteriye hizmet verme desenleri
- **Edge AI Dağıtımı**: Azure IoT Edge ve konteyner örnekleri ile entegrasyon
- **Hibrit Bulut AI**: AI iş yükleri için çoklu bulut ve hibrit dağıtım desenleri

#### Gelişmiş Özellikler
- **AI Pipeline Otomasyonu**: Azure Machine Learning boru hatları ile MLOps entegrasyonu
- **Gelişmiş Güvenlik**: Sıfır güven desenleri, özel uç noktalar ve gelişmiş tehdit koruması
- **Performans Optimizasyonu**: Yüksek verimli AI uygulamaları için gelişmiş ayar ve ölçekleme stratejileri
- **Global Dağıtım**: AI uygulamaları için içerik teslimi ve uç önbellekleme desenleri

### Sürüm 3.0.0 (Planlandı) - Mevcut Yayın Tarafından Geçersiz Kılındı
#### Önerilen Eklemeler - Şimdi v3.0.0'da Uygulandı
- ✅ **AI Odaklı İçerik**: Kapsamlı Azure AI Foundry entegrasyonu (Tamamlandı)
- ✅ **Etkileşimli Eğitimler**: Uygulamalı AI atölye laboratuvarı (Tamamlandı)
- ✅ **Gelişmiş Güvenlik Modülü**: AI'ya özel güvenlik desenleri (Tamamlandı)
- ✅ **Performans Optimizasyonu**: AI iş yükü ayar stratejileri (Tamamlandı)

### Sürüm 2.1.0 (Planlandı) - Kısmen Mevcut Yayında Uygulandı
#### Küçük İyileştirmeler - Bazıları Mevcut Yayında Tamamlandı
- ✅ **Ek Örnekler**: AI odaklı dağıtım senaryoları (Tamamlandı)
- ✅ **Genişletilmiş SSS**: AI'ya özel sorular ve sorun giderme (Tamamlandı)
- **Araç Entegrasyonu**: Geliştirilmiş IDE ve düzenleyici entegrasyon rehberleri
- ✅ **İzleme Genişletmesi**: AI'ya özel izleme ve uyarı desenleri (Tamamlandı)

#### Hâlâ Gelecek Yayın İçin Planlandı
- **Mobil Dostu Dokümantasyon**: Mobil öğrenim için duyarlı tasarım
- **Çevrimdışı Erişim**: İndirilebilir dokümantasyon paketleri
- **Gelişmiş IDE Entegrasyonu**: AZD + AI iş akışları için VS Code uzantısı
- **Topluluk Panosu**: Gerçek zamanlı topluluk metrikleri ve katkı takibi

## Değişiklik Günlüğüne Katkıda Bulunma

### Değişiklikleri Bildirme
Bu depoya katkıda bulunurken, değişiklik günlüğü girişlerinin şunları içerdiğinden emin olun:

1. **Sürüm Numarası**: Semantik sürümleme (ana.minor.patch) takip edilerek
2. **Tarih**: Yayın veya güncelleme tarihi YYYY-MM-DD formatında
3. **Kategori**: Eklenen, Değiştirilen, Kullanımdan Kaldırılan, Kaldırılan, Düzeltildi, Güvenlik
4. **Net Açıklama**: Yapılan değişikliklerin kısa açıklaması
5. **Etkisi**: Değişikliklerin mevcut kullanıcıları nasıl etkilediği

### Değişiklik Kategorileri

#### Eklenen
- Yeni özellikler, dokümantasyon bölümleri veya yetenekler
- Yeni örnekler, şablonlar veya öğrenim kaynakları
- Ek araçlar, betikler veya yardımcı programlar

#### Değiştirilen
- Mevcut işlevsellik veya dokümantasyonda yapılan değişiklikler
- Netlik veya doğruluğu artırmak için yapılan güncellemeler
- İçerik veya organizasyonun yeniden yapılandırılması

#### Kullanımdan Kaldırılan
- Kullanımdan kaldırılmakta olan özellikler veya yaklaşımlar
- Kaldırılması planlanan dokümantasyon bölümleri
- Daha iyi alternatifleri olan yöntemler

#### Kaldırılan
- Artık geçerli olmayan özellikler, dokümantasyon veya örnekler
- Güncelliğini yitirmiş bilgiler veya kullanımdan kaldırılmış yaklaşımlar
- Gereksiz veya birleştirilmiş içerik

#### Düzeltildi
- Dokümantasyon veya koddaki hataların düzeltilmesi
- Bildirilen sorunların veya problemlerin çözümü
- Doğruluk veya işlevsellikte iyileştirmeler

#### Güvenlik
- Güvenlikle ilgili iyileştirmeler veya düzeltmeler
- Güvenlik en iyi uygulamalarına yönelik güncellemeler
- Güvenlik açıklarının çözümü

### Semantik Sürümleme Rehberi

#### Ana Sürüm (X.0.0)
- Kullanıcı eylemi gerektiren büyük değişiklikler
- İçerik veya organizasyonun önemli ölçüde yeniden yapılandırılması
- Temel yaklaşımı veya metodolojiyi değiştiren değişiklikler

#### Küçük Sürüm (X.Y.0)
- Yeni özellikler veya içerik eklemeleri
- Geriye dönük uyumluluğu koruyan iyileştirmeler
- Ek örnekler, araçlar veya kaynaklar

#### Yama Sürümü (X.Y.Z)
- Hata düzeltmeleri ve iyileştirmeler
- Mevcut içerikte küçük iyileştirmeler
- Açıklamalar ve küçük geliştirmeler

## Topluluk Geri Bildirimi ve Öneriler

Bu öğrenim kaynağını geliştirmek için topluluk geri bildirimlerini aktif olarak teşvik ediyoruz:

### Geri Bildirim Nasıl Sağlanır
- **GitHub Sorunları**: Problemleri bildirin veya iyileştirme önerilerinde bulunun (AI'ya özel sorunlar memnuniyetle karşılanır)
- **Discord Tartışmaları**: Fikirlerinizi paylaşın ve Azure AI Foundry topluluğu ile etkileşimde bulunun
- **Pull Request'ler**: Özellikle AI şablonları ve rehberleri için içeriğe doğrudan iyileştirmeler yapın
- **Azure AI Foundry Discord**: AZD + AI tartışmaları için #Azure kanalına katılın
- **Topluluk Forumları**: Daha geniş Azure geliştirici tartışmalarına katılın

### Geri Bildirim Kategorileri
- **AI İçerik Doğruluğu**: AI hizmet entegrasyonu ve dağıtım bilgileri için düzeltmeler
- **Öğrenme Deneyimi**: AI geliştirici öğrenme akışını iyileştirme önerileri
- **Eksik AI İçeriği**: Ek AI şablonları, desenleri veya örnekleri talepleri
- **Erişilebilirlik**: Çeşitli öğrenme ihtiyaçları için iyileştirmeler
- **AI Araç Entegrasyonu**: Daha iyi AI geliştirme iş akışı entegrasyonu önerileri
- **Üretim AI Desenleri**: Kurumsal AI dağıtım deseni talepleri

### Yanıt Taahhüdü
- **Sorun Yanıtı**: Bildirilen sorunlar için 48 saat içinde yanıt
- **Özellik Talepleri**: Bir hafta içinde değerlendirme
- **Topluluk Katkıları**: Bir hafta içinde inceleme
- **Güvenlik Sorunları**: Hızlandırılmış yanıt ile öncelikli değerlendirme

## Bakım Takvimi

### Düzenli Güncellemeler
- **Aylık İncelemeler**: İçerik doğruluğu ve bağlantı doğrulaması
- **Üç Aylık Güncellemeler**: Büyük içerik eklemeleri ve iyileştirmeler
- **Altı Aylık İncelemeler**: Kapsamlı yeniden yapılandırma ve geliştirme
- **Yıllık Yayınlar**: Önemli iyileştirmelerle büyük sürüm güncellemeleri

### İzleme ve Kalite Güvencesi
- **Otomatik Testler**: Kod örnekleri ve bağlantıların düzenli doğrulaması
- **Topluluk Geri Bildirimi Entegrasyonu**: Kullanıcı önerilerinin düzenli olarak dahil edilmesi
- **Teknoloji Güncellemeleri**: En son Azure hizmetleri ve azd sürümleriyle uyum
- **Erişilebilirlik Denetimleri**: Kapsayıcı tasarım ilkeleri için düzenli inceleme

## Sürüm Destek Politikası

### Mevcut Sürüm Desteği
- **En Son Ana Sürüm**: Düzenli güncellemelerle tam destek
- **Önceki Ana Sürüm**: 12 ay boyunca güvenlik güncellemeleri ve kritik düzeltmeler
- **Eski Sürümler**: Sadece topluluk desteği, resmi güncelleme yok

### Geçiş Rehberliği
Ana sürümler yayınlandığında, şunları sağlıyoruz:
- **Geçiş Rehberleri**: Adım adım geçiş talimatları
- **Uyumluluk Notları**: Önemli değişiklikler hakkında ayrıntılar
- **Araç Desteği**: Geçişe yardımcı olacak betikler veya araçlar
- **Topluluk Desteği**: Geçiş soruları için özel forumlar

---

**Navigasyon**
- **Önceki Ders**: [Çalışma Rehberi](resources/study-guide.md)
- **Sonraki Ders**: [Ana README'ye Dön](README.md)

**Güncel Kalın**: Bu depoyu izleyerek yeni sürümler ve öğrenim materyallerindeki önemli güncellemeler hakkında bildirim alın.

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.