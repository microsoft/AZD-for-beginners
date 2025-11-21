<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-20T22:34:23+00:00",
  "source_file": "changelog.md",
  "language_code": "tr"
}
-->
# Değişiklik Günlüğü - AZD Yeni Başlayanlar İçin

## Giriş

Bu değişiklik günlüğü, AZD Yeni Başlayanlar İçin deposundaki tüm önemli değişiklikleri, güncellemeleri ve iyileştirmeleri belgelemektedir. Semantik versiyonlama ilkelerini takip ediyoruz ve kullanıcıların versiyonlar arasındaki değişiklikleri anlamalarına yardımcı olmak için bu günlüğü tutuyoruz.

## Öğrenme Hedefleri

Bu değişiklik günlüğünü inceleyerek:
- Yeni özellikler ve içerik eklemeleri hakkında bilgi sahibi olabilirsiniz
- Mevcut belgelerde yapılan iyileştirmeleri anlayabilirsiniz
- Hataların düzeltilmesini ve doğruluğun sağlanmasını takip edebilirsiniz
- Öğrenme materyallerinin zaman içindeki gelişimini izleyebilirsiniz

## Öğrenme Çıktıları

Değişiklik günlüğü girişlerini inceledikten sonra:
- Öğrenme için mevcut yeni içerik ve kaynakları tanımlayabilirsiniz
- Hangi bölümlerin güncellendiğini veya iyileştirildiğini anlayabilirsiniz
- En güncel materyallere göre öğrenme yolunuzu planlayabilirsiniz
- Gelecekteki iyileştirmeler için geri bildirim ve önerilerde bulunabilirsiniz

## Sürüm Geçmişi

### [v3.8.0] - 2025-11-19

#### İleri Düzey Belgeler: İzleme, Güvenlik ve Çoklu Ajan Modelleri
**Bu sürüm, üretim dağıtımları için Application Insights entegrasyonu, kimlik doğrulama modelleri ve çoklu ajan koordinasyonu üzerine kapsamlı A sınıfı dersler ekler.**

#### Eklendi
- **📊 Application Insights Entegrasyonu Dersi**: `docs/pre-deployment/application-insights.md` içinde:
  - AZD odaklı otomatik sağlama ile dağıtım
  - Application Insights + Log Analytics için tam Bicep şablonları
  - Özel telemetri ile çalışan Python uygulamaları (1.200+ satır)
  - AI/LLM izleme modelleri (Azure OpenAI token/maliyet takibi)
  - 6 Mermaid diyagramı (mimari, dağıtılmış izleme, telemetri akışı)
  - 3 uygulamalı alıştırma (uyarılar, panolar, AI izleme)
  - Kusto sorgu örnekleri ve maliyet optimizasyon stratejileri
  - Canlı metrik akışı ve gerçek zamanlı hata ayıklama
  - 40-50 dakikalık öğrenme süresi ile üretime hazır modeller

- **🔐 Kimlik Doğrulama ve Güvenlik Modelleri Dersi**: `docs/getting-started/authsecurity.md` içinde:
  - 3 kimlik doğrulama modeli (bağlantı dizileri, Key Vault, yönetilen kimlik)
  - Güvenli dağıtımlar için tam Bicep altyapı şablonları
  - Azure SDK entegrasyonu ile Node.js uygulama kodu
  - 3 tam alıştırma (yönetilen kimlik etkinleştirme, kullanıcı atanmış kimlik, Key Vault döngüsü)
  - Güvenlik en iyi uygulamaları ve RBAC yapılandırmaları
  - Sorun giderme rehberi ve maliyet analizi
  - Üretime hazır şifresiz kimlik doğrulama modelleri

- **🤖 Çoklu Ajan Koordinasyon Modelleri Dersi**: `docs/pre-deployment/coordination-patterns.md` içinde:
  - 5 koordinasyon modeli (sıralı, paralel, hiyerarşik, olay odaklı, uzlaşma)
  - Tam orkestratör hizmeti uygulaması (Python/Flask, 1.500+ satır)
  - 3 özel ajan uygulaması (Araştırmacı, Yazar, Editör)
  - Mesaj sıralama için Service Bus entegrasyonu
  - Dağıtılmış sistemler için Cosmos DB durum yönetimi
  - Ajan etkileşimlerini gösteren 6 Mermaid diyagramı
  - 3 ileri düzey alıştırma (zaman aşımı yönetimi, yeniden deneme mantığı, devre kesici)
  - Maliyet dökümü ($240-565/ay) ve optimizasyon stratejileri
  - İzleme için Application Insights entegrasyonu

#### Geliştirildi
- **Dağıtım Öncesi Bölüm**: Artık kapsamlı izleme ve koordinasyon modellerini içeriyor
- **Başlangıç Bölümü**: Profesyonel kimlik doğrulama modelleri ile geliştirildi
- **Üretim Hazırlığı**: Güvenlikten gözlemlenebilirliğe kadar tam kapsam
- **Kurs Çizelgesi**: Bölüm 3 ve 6'daki yeni derslere referans olacak şekilde güncellendi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Kurs boyunca güvenlik ve izleme daha iyi entegre edildi
- **Belge Kalitesi**: Yeni derslerde tutarlı A sınıfı standartlar (95-97%)
- **Üretim Modelleri**: Kurumsal dağıtımlar için uçtan uca tam kapsam

#### İyileştirildi
- **Geliştirici Deneyimi**: Geliştirmeden üretim izlemeye net bir yol
- **Güvenlik Standartları**: Kimlik doğrulama ve gizli yönetimi için profesyonel modeller
- **Gözlemlenebilirlik**: AZD ile tam Application Insights entegrasyonu
- **AI İş Yükleri**: Azure OpenAI ve çoklu ajan sistemleri için özel izleme

#### Doğrulandı
- ✅ Tüm dersler tam çalışan kod içeriyor (kod parçacıkları değil)
- ✅ Görsel öğrenme için Mermaid diyagramları (3 derste toplam 19)
- ✅ Doğrulama adımları ile uygulamalı alıştırmalar (toplam 9)
- ✅ Üretime hazır Bicep şablonları `azd up` ile dağıtılabilir
- ✅ Maliyet analizi ve optimizasyon stratejileri
- ✅ Sorun giderme rehberleri ve en iyi uygulamalar
- ✅ Bilgi kontrol noktaları ve doğrulama komutları

#### Belge Derecelendirme Sonuçları
- **docs/pre-deployment/application-insights.md**: - Kapsamlı izleme rehberi
- **docs/getting-started/authsecurity.md**: - Profesyonel güvenlik modelleri
- **docs/pre-deployment/coordination-patterns.md**: - İleri düzey çoklu ajan mimarileri
- **Yeni İçerik Genel**: - Tutarlı yüksek kalite standartları

#### Teknik Uygulama
- **Application Insights**: Log Analytics + özel telemetri + dağıtılmış izleme
- **Kimlik Doğrulama**: Yönetilen Kimlik + Key Vault + RBAC modelleri
- **Çoklu Ajan**: Service Bus + Cosmos DB + Container Apps + orkestrasyon
- **İzleme**: Canlı metrikler + Kusto sorguları + uyarılar + panolar
- **Maliyet Yönetimi**: Örnekleme stratejileri, saklama politikaları, bütçe kontrolleri

### [v3.7.0] - 2025-11-19

#### Belge Kalitesi İyileştirmeleri ve Yeni Azure OpenAI Örneği
**Bu sürüm, depo genelinde belge kalitesini artırır ve GPT-4 sohbet arayüzü ile tam bir Azure OpenAI dağıtım örneği ekler.**

#### Eklendi
- **🤖 Azure OpenAI Sohbet Örneği**: `examples/azure-openai-chat/` içinde çalışan GPT-4 dağıtımı:
  - Tam Azure OpenAI altyapısı (GPT-4 model dağıtımı)
  - Konuşma geçmişi ile Python komut satırı sohbet arayüzü
  - Güvenli API anahtarı depolama için Key Vault entegrasyonu
  - Token kullanımı takibi ve maliyet tahmini
  - Hız sınırlama ve hata yönetimi
  - 35-45 dakikalık dağıtım rehberi ile kapsamlı README
  - 11 üretime hazır dosya (Bicep şablonları, Python uygulaması, yapılandırma)
- **📚 Belge Alıştırmaları**: Yapılandırma rehberine uygulamalı alıştırmalar eklendi:
  - Alıştırma 1: Çoklu ortam yapılandırması (15 dakika)
  - Alıştırma 2: Gizli yönetimi pratiği (10 dakika)
  - Net başarı kriterleri ve doğrulama adımları
- **✅ Dağıtım Doğrulama**: Dağıtım rehberine doğrulama bölümü eklendi:
  - Sağlık kontrol prosedürleri
  - Başarı kriterleri kontrol listesi
  - Tüm dağıtım komutları için beklenen çıktılar
  - Hızlı referans sorun giderme

#### Geliştirildi
- **examples/README.md**: A sınıfı kaliteye güncellendi (93%):
  - azure-openai-chat tüm ilgili bölümlere eklendi
  - Yerel örnek sayısı 3'ten 4'e güncellendi
  - AI Uygulama Örnekleri tablosuna eklendi
  - Orta Düzey Kullanıcılar için Hızlı Başlangıç'a entegre edildi
  - Azure AI Foundry Şablonları bölümüne eklendi
  - Karşılaştırma Matrisi ve teknoloji bulma bölümleri güncellendi
- **Belge Kalitesi**: B+ (87%) → A- (92%) seviyesine yükseltildi:
  - Kritik komut örneklerine beklenen çıktılar eklendi
  - Yapılandırma değişiklikleri için doğrulama adımları dahil edildi
  - Uygulamalı öğrenme pratik alıştırmalarla geliştirildi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Orta düzey öğreniciler için AI örnekleri daha iyi entegre edildi
- **Belge Yapısı**: Daha net sonuçlarla daha uygulanabilir alıştırmalar
- **Doğrulama Süreci**: Ana iş akışlarına açık başarı kriterleri eklendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Azure OpenAI dağıtımı artık 35-45 dakika sürüyor (karmaşık alternatiflere göre 60-90 dakika)
- **Maliyet Şeffaflığı**: Azure OpenAI örneği için net maliyet tahminleri ($50-200/ay)
- **Öğrenme Yolu**: AI geliştiricileri için azure-openai-chat ile net giriş noktası
- **Belge Standartları**: Tutarlı beklenen çıktılar ve doğrulama adımları

#### Doğrulandı
- ✅ Azure OpenAI örneği `azd up` ile tamamen işlevsel
- ✅ Tüm 11 uygulama dosyası sözdizimsel olarak doğru
- ✅ README talimatları gerçek dağıtım deneyimiyle eşleşiyor
- ✅ Belge bağlantıları 8+ konumda güncellendi
- ✅ Örnekler dizini 4 yerel örneği doğru şekilde yansıtıyor
- ✅ Tablolarda yinelenen harici bağlantı yok
- ✅ Tüm gezinme referansları doğru

#### Teknik Uygulama
- **Azure OpenAI Mimari**: GPT-4 + Key Vault + Container Apps modeli
- **Güvenlik**: Yönetilen Kimlik hazır, gizlilik Key Vault'ta
- **İzleme**: Application Insights entegrasyonu
- **Maliyet Yönetimi**: Token takibi ve kullanım optimizasyonu
- **Dağıtım**: Tam kurulum için tek `azd up` komutu

### [v3.6.0] - 2025-11-19

#### Büyük Güncelleme: Container App Dağıtım Örnekleri
**Bu sürüm, Azure Developer CLI (AZD) kullanarak üretime hazır container uygulama dağıtım örneklerini, tam belgeler ve öğrenme yoluna entegrasyon ile sunar.**

#### Eklendi
- **🚀 Container App Örnekleri**: `examples/container-app/` içinde yeni yerel örnekler:
  - [Ana Rehber](examples/container-app/README.md): Containerize edilmiş dağıtımların genel görünümü, hızlı başlangıç, üretim ve ileri düzey modeller
  - [Basit Flask API](../../examples/container-app/simple-flask-api): Ölçeklenebilir, sağlık kontrolleri, izleme ve sorun giderme ile başlangıç dostu REST API
  - [Mikroservis Mimari](../../examples/container-app/microservices): Üretime hazır çok hizmetli dağıtım (API Gateway, Ürün, Sipariş, Kullanıcı, Bildirim), asenkron mesajlaşma, Service Bus, Cosmos DB, Azure SQL, dağıtılmış izleme, mavi-yeşil/kanarya dağıtımı
- **En İyi Uygulamalar**: Güvenlik, izleme, maliyet optimizasyonu ve CI/CD rehberliği için containerize edilmiş iş yükleri
- **Kod Örnekleri**: Tam `azure.yaml`, Bicep şablonları ve çok dilli hizmet uygulamaları (Python, Node.js, C#, Go)
- **Test ve Sorun Giderme**: Uçtan uca test senaryoları, izleme komutları, sorun giderme rehberliği

#### Değiştirildi
- **README.md**: "Yerel Örnekler - Container Uygulamaları" altında yeni container app örneklerini öne çıkarmak ve bağlamak için güncellendi
- **examples/README.md**: Container app örneklerini vurgulamak, karşılaştırma matrisi girişlerini eklemek ve teknoloji/mimari referanslarını güncellemek için güncellendi
- **Kurs Çizelgesi ve Çalışma Rehberi**: İlgili bölümlerde yeni container app örneklerine ve dağıtım modellerine referans olacak şekilde güncellendi

#### Doğrulandı
- ✅ Tüm yeni örnekler `azd up` ile dağıtılabilir ve en iyi uygulamaları takip eder
- ✅ Belge çapraz bağlantıları ve gezinme güncellendi
- ✅ Örnekler başlangıçtan ileri düzeye senaryoları kapsar, üretim mikroservisleri dahil

#### Notlar
- **Kapsam**: Sadece İngilizce belgeler ve örnekler
- **Sonraki Adımlar**: Gelecekteki sürümlerde ek ileri düzey container modelleri ve CI/CD otomasyonu ile genişletme

### [v3.5.0] - 2025-11-19

#### Ürün Yeniden Markalama: Microsoft Foundry
**Bu sürüm, "Azure AI Foundry" ürün adını "Microsoft Foundry" olarak değiştiren kapsamlı bir yeniden markalama uygular ve tüm İngilizce belgelerde Microsoft'un resmi yeniden markalamasını yansıtır.**

#### Değiştirildi
- **🔄 Ürün Adı Güncellemesi**: İngilizce belgelerdeki tüm referanslarda "Azure AI Foundry" ürün adı "Microsoft Foundry" olarak tamamen yeniden markalandı
  - `docs/` klasöründeki tüm referanslar güncellendi
  - Klasör adı değiştirildi: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Dosya adı değiştirildi: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Toplam: 7 belge dosyasında 23 içerik referansı güncellendi

- **📁 Klasör Yapısı Değişiklikleri**:
  - `docs/ai-foundry/` → `docs/microsoft-foundry/` olarak yeniden adlandırıldı
  - Tüm çapraz referanslar yeni klasör yapısını yansıtacak şekilde güncellendi
  - Tüm belgelerde gezinme bağlantıları doğrulandı

- **📄 Dosya Yeniden Adlandırmaları**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tüm dahili bağlantılar yeni dosya adına referans verecek şekilde güncellendi

#### Güncellenen Dosyalar
- **Bölüm Belgeleri** (7 dosya):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 gezinme bağlantısı güncellendi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ürün adı referansı güncellendi
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Zaten Microsoft Foundry kullanıyor (önceki güncellemelerden)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referans güncellendi (genel bakış, topluluk geri bildirimi, belgeler)
  - `docs/getting-started/azd-basics.md` - 4 çapraz referans bağlantısı güncellendi
  - `docs/getting-started/first-project.md` - 2 bölüm gezinme bağlantısı güncellendi
  - `docs/getting-started/installation.md` - 2 sonraki bölüm bağlantısı güncellendi
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referans güncellendi (gezinti, Discord topluluğu)
  - `docs/troubleshooting/common-issues.md` - 1 gezinme bağlantısı güncellendi
  - `docs/troubleshooting/debugging.md` - 1 gezinme bağlantısı güncellendi

- **Kurs Yapısı Dosyaları** (2 dosya):
  - `README.md` - 17 referans güncellendi (kurs genel bakışı, bölüm başlıkları, şablonlar bölümü, topluluk içgörüleri)
  - `course-outline.md` - 14 referans güncellendi (genel bakış, öğrenme hedefleri, bölüm kaynakları)

#### Doğrulandı
- ✅ İngilizce belgelerde "ai-foundry" klasör yolu referansı kalmadı
- ✅ İngilizce belgelerde "Azure AI Foundry" ürün adı referansı kalmadı
- ✅ Yeni
- **Atölye**: Atölye materyalleri (`workshop/`) bu sürümde güncellenmedi
- **Örnekler**: Örnek dosyalar hala eski adlandırmalara referans verebilir (gelecek güncellemede ele alınacak)
- **Harici Bağlantılar**: Harici URL'ler ve GitHub deposu referansları değişmeden kaldı

#### Katkıda Bulunanlar için Geçiş Rehberi
Eğer yerel dallarınız veya eski yapıya referans veren belgeleriniz varsa:
1. Klasör referanslarını güncelleyin: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Dosya referanslarını güncelleyin: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ürün adını değiştirin: "Azure AI Foundry" → "Microsoft Foundry"
4. Tüm dahili dokümantasyon bağlantılarının hala çalıştığını doğrulayın

---

### [v3.4.0] - 2025-10-24

#### Altyapı Önizleme ve Doğrulama Geliştirmeleri
**Bu sürüm, yeni Azure Developer CLI önizleme özelliği için kapsamlı destek sunar ve atölye kullanıcı deneyimini geliştirir.**

#### Eklendi
- **🧪 azd provision --preview Özellik Dokümantasyonu**: Yeni altyapı önizleme yeteneğinin kapsamlı açıklaması
  - Komut referansı ve kullanım örnekleri için hızlı başvuru kılavuzu
  - Kullanım durumları ve faydalarıyla birlikte sağlama kılavuzunda detaylı entegrasyon
  - Daha güvenli dağıtım doğrulaması için ön kontrol entegrasyonu
  - Güvenlik odaklı dağıtım uygulamalarıyla başlangıç kılavuzu güncellemeleri
- **🚧 Atölye Durum Afişi**: Atölye geliştirme durumunu belirten profesyonel HTML afişi
  - Kullanıcı iletişimi için net bir tasarım ve inşaat göstergeleri
  - Şeffaflık için son güncelleme tarihi
  - Tüm cihaz türleri için mobil uyumlu tasarım

#### Geliştirildi
- **Altyapı Güvenliği**: Önizleme işlevselliği, dağıtım dokümantasyonu boyunca entegre edildi
- **Dağıtım Öncesi Doğrulama**: Otomatikleştirilmiş betikler artık altyapı önizleme testlerini içeriyor
- **Geliştirici İş Akışı**: Önizleme, en iyi uygulama olarak komut dizilerine dahil edildi
- **Atölye Deneyimi**: Kullanıcılara içerik geliştirme durumu hakkında net beklentiler sunuldu

#### Değiştirildi
- **Dağıtım En İyi Uygulamaları**: Önizleme odaklı iş akışı artık önerilen yaklaşım
- **Dokümantasyon Akışı**: Altyapı doğrulaması öğrenme sürecinin daha erken bir aşamasına taşındı
- **Atölye Sunumu**: Geliştirme zaman çizelgesiyle net durum iletişimi

#### İyileştirildi
- **Güvenlik Odaklı Yaklaşım**: Altyapı değişiklikleri artık dağıtımdan önce doğrulanabilir
- **Ekip İşbirliği**: Önizleme sonuçları inceleme ve onay için paylaşılabilir
- **Maliyet Farkındalığı**: Sağlama öncesinde kaynak maliyetlerinin daha iyi anlaşılması
- **Risk Azaltma**: İleri doğrulama sayesinde dağıtım hatalarının azaltılması

#### Teknik Uygulama
- **Çoklu Belge Entegrasyonu**: Önizleme özelliği 4 ana dosyada belgelenmiştir
- **Komut Kalıpları**: Dokümantasyon boyunca tutarlı sözdizimi ve örnekler
- **En İyi Uygulama Entegrasyonu**: Önizleme, doğrulama iş akışlarına ve betiklere dahil edildi
- **Görsel Göstergeler**: Keşfedilebilirlik için net YENİ özellik işaretlemeleri

#### Atölye Altyapısı
- **Durum İletişimi**: Gradyan tasarımlı profesyonel HTML afiş
- **Kullanıcı Deneyimi**: Net geliştirme durumu, kafa karışıklığını önler
- **Profesyonel Sunum**: Depo güvenilirliğini korurken beklentileri belirler
- **Zaman Çizelgesi Şeffaflığı**: Hesap verebilirlik için Ekim 2025 son güncelleme tarihi

### [v3.3.0] - 2025-09-24

#### Geliştirilmiş Atölye Materyalleri ve Etkileşimli Öğrenme Deneyimi
**Bu sürüm, tarayıcı tabanlı etkileşimli rehberler ve yapılandırılmış öğrenme yollarıyla kapsamlı atölye materyalleri sunar.**

#### Eklendi
- **🎥 Etkileşimli Atölye Rehberi**: MkDocs önizleme özelliğiyle tarayıcı tabanlı atölye deneyimi
- **📝 Yapılandırılmış Atölye Talimatları**: Keşiften özelleştirmeye kadar 7 adımlı rehberli öğrenme yolu
  - 0-Giriş: Atölye genel bakışı ve kurulum
  - 1-AI-Şablon-Seçimi: Şablon keşfi ve seçim süreci
  - 2-AI-Şablon-Doğrulama: Dağıtım ve doğrulama prosedürleri
  - 3-AI-Şablon-Parçalama: Şablon mimarisini anlama
  - 4-AI-Şablon-Yapılandırma: Yapılandırma ve özelleştirme
  - 5-AI-Şablon-Özelleştirme: İleri düzey değişiklikler ve yinelemeler
  - 6-Altyapı-Temizleme: Temizlik ve kaynak yönetimi
  - 7-Kapanış: Özet ve sonraki adımlar
- **🛠️ Atölye Araçları**: Gelişmiş öğrenme deneyimi için Material temalı MkDocs yapılandırması
- **🎯 Uygulamalı Öğrenme Yolu**: 3 adımlı metodoloji (Keşif → Dağıtım → Özelleştirme)
- **📱 GitHub Codespaces Entegrasyonu**: Sorunsuz geliştirme ortamı kurulumu

#### Geliştirildi
- **AI Atölye Laboratuvarı**: 2-3 saatlik yapılandırılmış öğrenme deneyimiyle genişletildi
- **Atölye Dokümantasyonu**: Navigasyon ve görsel yardımlarla profesyonel sunum
- **Öğrenme İlerlemesi**: Şablon seçiminden üretim dağıtımına kadar net adım adım rehberlik
- **Geliştirici Deneyimi**: Akıcı geliştirme iş akışları için entegre araçlar

#### İyileştirildi
- **Erişilebilirlik**: Arama, kopyalama işlevselliği ve tema geçişiyle tarayıcı tabanlı arayüz
- **Kendi Hızında Öğrenme**: Farklı öğrenme hızlarına uyum sağlayan esnek atölye yapısı
- **Pratik Uygulama**: Gerçek dünya AI şablon dağıtım senaryoları
- **Topluluk Entegrasyonu**: Atölye desteği ve işbirliği için Discord entegrasyonu

#### Atölye Özellikleri
- **Dahili Arama**: Hızlı anahtar kelime ve ders keşfi
- **Kod Bloklarını Kopyala**: Tüm kod örnekleri için üzerine gelince kopyalama işlevi
- **Tema Geçişi**: Farklı tercihler için karanlık/açık mod desteği
- **Görsel Varlıklar**: Anlamayı artırmak için ekran görüntüleri ve diyagramlar
- **Yardım Entegrasyonu**: Topluluk desteği için doğrudan Discord erişimi

### [v3.2.0] - 2025-09-17

#### Büyük Navigasyon Yeniden Yapılandırması ve Bölüm Tabanlı Öğrenme Sistemi
**Bu sürüm, tüm depo boyunca geliştirilmiş navigasyon ile kapsamlı bir bölüm tabanlı öğrenme yapısı sunar.**

#### Eklendi
- **📚 Bölüm Tabanlı Öğrenme Sistemi**: Tüm kurs 8 aşamalı öğrenme bölümlerine yeniden yapılandırıldı
  - Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç (⭐ - 30-45 dk)
  - Bölüm 2: AI-Öncelikli Geliştirme (⭐⭐ - 1-2 saat)
  - Bölüm 3: Yapılandırma ve Kimlik Doğrulama (⭐⭐ - 45-60 dk)
  - Bölüm 4: Kod Olarak Altyapı ve Dağıtım (⭐⭐⭐ - 1-1.5 saat)
  - Bölüm 5: Çoklu-Ajan AI Çözümleri (⭐⭐⭐⭐ - 2-3 saat)
  - Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama (⭐⭐ - 1 saat)
  - Bölüm 7: Sorun Giderme ve Hata Ayıklama (⭐⭐ - 1-1.5 saat)
  - Bölüm 8: Üretim ve Kurumsal Modeller (⭐⭐⭐⭐ - 2-3 saat)
- **📚 Kapsamlı Navigasyon Sistemi**: Tüm belgelerde tutarlı navigasyon başlıkları ve altbilgiler
- **🎯 İlerleme Takibi**: Kurs tamamlama kontrol listesi ve öğrenme doğrulama sistemi
- **🗺️ Öğrenme Yolu Rehberliği**: Farklı deneyim seviyeleri ve hedefler için net giriş noktaları
- **🔗 Çapraz Referans Navigasyonu**: İlgili bölümler ve ön koşullar açıkça bağlantılı

#### Geliştirildi
- **README Yapısı**: Bölüm tabanlı organizasyonla yapılandırılmış bir öğrenme platformuna dönüştürüldü
- **Dokümantasyon Navigasyonu**: Her sayfa artık bölüm bağlamı ve ilerleme rehberliği içeriyor
- **Şablon Organizasyonu**: Örnekler ve şablonlar uygun öğrenme bölümlerine eşlendi
- **Kaynak Entegrasyonu**: İlgili bölümlere bağlı hızlı başvuru kılavuzları, SSS'ler ve çalışma kılavuzları
- **Atölye Entegrasyonu**: Uygulamalı laboratuvarlar, birden fazla bölüm öğrenme hedeflerine eşlendi

#### Değiştirildi
- **Öğrenme İlerlemesi**: Doğrusal dokümantasyondan esnek bölüm tabanlı öğrenmeye geçildi
- **Yapılandırma Konumu**: Daha iyi bir öğrenme akışı için yapılandırma kılavuzu Bölüm 3'e taşındı
- **AI İçerik Entegrasyonu**: Öğrenme yolculuğu boyunca AI'ye özgü içerik daha iyi entegre edildi
- **Üretim İçeriği**: İleri düzey modeller kurumsal öğreniciler için Bölüm 8'de birleştirildi

#### İyileştirildi
- **Kullanıcı Deneyimi**: Net navigasyon izleri ve bölüm ilerleme göstergeleri
- **Erişilebilirlik**: Daha kolay kurs gezintisi için tutarlı navigasyon desenleri
- **Profesyonel Sunum**: Akademik ve kurumsal eğitim için uygun üniversite tarzı kurs yapısı
- **Öğrenme Verimliliği**: Geliştirilmiş organizasyon sayesinde ilgili içeriği bulma süresi azaltıldı

#### Teknik Uygulama
- **Navigasyon Başlıkları**: 40+ dokümantasyon dosyasında standartlaştırılmış bölüm navigasyonu
- **Altbilgi Navigasyonu**: Tutarlı ilerleme rehberliği ve bölüm tamamlama göstergeleri
- **Çapraz Bağlantı**: İlgili kavramları bağlayan kapsamlı dahili bağlantı sistemi
- **Bölüm Eşlemesi**: Şablonlar ve örnekler açıkça öğrenme hedefleriyle ilişkilendirildi

#### Çalışma Kılavuzu Geliştirmesi
- **📚 Kapsamlı Öğrenme Hedefleri**: Çalışma kılavuzu, 8 bölümlü sisteme uygun şekilde yeniden yapılandırıldı
- **🎯 Bölüm Tabanlı Değerlendirme**: Her bölüm, belirli öğrenme hedefleri ve pratik egzersizler içerir
- **📋 İlerleme Takibi**: Ölçülebilir sonuçlar ve tamamlama kontrol listeleriyle haftalık öğrenme programı
- **❓ Değerlendirme Soruları**: Her bölüm için bilgi doğrulama soruları ve profesyonel sonuçlar
- **🛠️ Pratik Egzersizler**: Gerçek dağıtım senaryoları ve sorun giderme ile uygulamalı aktiviteler
- **📊 Beceri İlerlemesi**: Temel kavramlardan kurumsal modellere net ilerleme ile kariyer gelişimi odaklı
- **🎓 Sertifikasyon Çerçevesi**: Profesyonel gelişim sonuçları ve topluluk tanıma sistemi
- **⏱️ Zaman Yönetimi**: Yapılandırılmış 10 haftalık öğrenme planı ve kilometre taşı doğrulaması

### [v3.1.0] - 2025-09-17

#### Geliştirilmiş Çoklu-Ajan AI Çözümleri
**Bu sürüm, daha iyi ajan adlandırma ve geliştirilmiş dokümantasyon ile çoklu-ajan perakende çözümünü iyileştirir.**

#### Değiştirildi
- **Çoklu-Ajan Terminolojisi**: Perakende çoklu-ajan çözümünde "Cora ajanı" yerine "Müşteri ajanı" kullanıldı
- **Ajan Mimarisi**: Tüm dokümantasyon, ARM şablonları ve kod örnekleri "Müşteri ajanı" adlandırmasını kullanacak şekilde güncellendi
- **Yapılandırma Örnekleri**: Güncellenmiş adlandırma kurallarıyla modernize edilmiş ajan yapılandırma desenleri
- **Dokümantasyon Tutarlılığı**: Tüm referanslar profesyonel, açıklayıcı ajan adları kullanacak şekilde düzenlendi

#### Geliştirildi
- **ARM Şablon Paketi**: Müşteri ajanı referanslarıyla güncellenmiş perakende-çoklu-ajan-arm-şablonu
- **Mimari Diyagramlar**: Güncellenmiş ajan adlandırmasıyla yenilenmiş Mermaid diyagramları
- **Kod Örnekleri**: Python sınıfları ve uygulama örnekleri artık CustomerAgent adlandırmasını kullanıyor
- **Ortam Değişkenleri**: Tüm dağıtım betikleri CUSTOMER_AGENT_NAME kurallarını kullanacak şekilde güncellendi

#### İyileştirildi
- **Geliştirici Deneyimi**: Dokümantasyonda daha net ajan rolleri ve sorumlulukları
- **Üretim Hazırlığı**: Kurumsal adlandırma kurallarıyla daha iyi uyum
- **Öğrenme Materyalleri**: Eğitim amaçları için daha sezgisel ajan adlandırması
- **Şablon Kullanılabilirliği**: Ajan işlevlerini ve dağıtım desenlerini anlamayı kolaylaştırdı

#### Teknik Detaylar
- Güncellenmiş Mermaid mimari diyagramları CustomerAgent referanslarıyla
- Python örneklerinde CoraAgent sınıf adları CustomerAgent ile değiştirildi
- ARM şablon JSON yapılandırmaları "müşteri" ajan türünü kullanacak şekilde değiştirildi
- Ortam değişkenleri CORA_AGENT_*'dan CUSTOMER_AGENT_* kurallarına dönüştürüldü
- Tüm dağıtım komutları ve konteyner yapılandırmaları yenilendi

### [v3.0.0] - 2025-09-12

#### Büyük Değişiklikler - AI Geliştirici Odaklılık ve Azure AI Foundry Entegrasyonu
**Bu sürüm, depoyu Azure AI Foundry entegrasyonu ile kapsamlı bir AI odaklı öğrenme kaynağına dönüştürür.**

#### Eklendi
- **🤖 AI-Öncelikli Öğrenme Yolu**: AI geliştiricileri ve mühendislerini önceliklendiren tam yeniden yapılandırma
- **Azure AI Foundry Entegrasyon Rehberi**: AZD ile Azure AI Foundry hizmetlerini bağlamak için kapsamlı dokümantasyon
- **AI Model Dağıtım Desenleri**: Model seçimi, yapılandırma ve üretim dağıtım stratejilerini kapsayan detaylı rehber
- **AI Atölye Laboratuvarı**: AI uygulamalarını AZD ile dağıtılabilir çözümlere dönüştürmek için 2-3 saatlik uygulamalı atölye
- **Üretim AI En İyi Uygulamaları**: AI iş yüklerini ölçeklendirme, izleme ve güvence altına alma için kurumsal düzeyde desenler
- **AI'ye Özgü Sorun Giderme Rehberi**: Azure OpenAI, Cognitive Services ve AI dağıtım sorunları için kapsamlı sorun giderme
- **AI Şablon Galerisi**: Karmaşıklık dereceleriyle öne çıkan Azure AI Foundry şablon koleksiyonu
- **Atölye Materyalleri**: U
- **İçerik Sunumu**: Dekoratif unsurlar kaldırıldı, net ve profesyonel bir format tercih edildi  
- **Bağlantı Yapısı**: Yeni navigasyon sistemine uygun olarak tüm dahili bağlantılar güncellendi  

#### İyileştirmeler  
- **Erişilebilirlik**: Ekran okuyucu uyumluluğunu artırmak için emoji bağımlılıkları kaldırıldı  
- **Profesyonel Görünüm**: Kurumsal öğrenim için uygun, temiz ve akademik tarzda sunum  
- **Öğrenim Deneyimi**: Her ders için net hedefler ve sonuçlarla yapılandırılmış bir yaklaşım  
- **İçerik Organizasyonu**: İlgili konular arasında daha iyi mantıksal akış ve bağlantı  

### [v1.0.0] - 2025-09-09  

#### İlk Yayın - Kapsamlı AZD Öğrenim Deposu  

#### Eklenenler  
- **Temel Dokümantasyon Yapısı**  
  - Tam kapsamlı başlangıç rehberi serisi  
  - Kapsamlı dağıtım ve sağlama dokümantasyonu  
  - Ayrıntılı sorun giderme kaynakları ve hata ayıklama rehberleri  
  - Dağıtım öncesi doğrulama araçları ve prosedürleri  

- **Başlangıç Modülü**  
  - AZD Temelleri: Temel kavramlar ve terminoloji  
  - Kurulum Rehberi: Platforma özel kurulum talimatları  
  - Yapılandırma Rehberi: Ortam kurulumu ve kimlik doğrulama  
  - İlk Proje Eğitimi: Adım adım uygulamalı öğrenim  

- **Dağıtım ve Sağlama Modülü**  
  - Dağıtım Rehberi: Tam iş akışı dokümantasyonu  
  - Sağlama Rehberi: Bicep ile Kod Olarak Altyapı  
  - Üretim dağıtımları için en iyi uygulamalar  
  - Çoklu hizmet mimarisi desenleri  

- **Dağıtım Öncesi Doğrulama Modülü**  
  - Kapasite Planlama: Azure kaynak kullanılabilirliği doğrulaması  
  - SKU Seçimi: Kapsamlı hizmet katmanı rehberi  
  - Ön Kontroller: Otomatik doğrulama betikleri (PowerShell ve Bash)  
  - Maliyet tahmini ve bütçe planlama araçları  

- **Sorun Giderme Modülü**  
  - Yaygın Sorunlar: Sık karşılaşılan problemler ve çözümleri  
  - Hata Ayıklama Rehberi: Sistematik sorun giderme yöntemleri  
  - Gelişmiş teşhis teknikleri ve araçları  
  - Performans izleme ve optimizasyon  

- **Kaynaklar ve Referanslar**  
  - Komut Hızlı Başvuru: Temel komutlar için hızlı rehber  
  - Sözlük: Kapsamlı terim ve kısaltma tanımları  
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
- **Farklı Yetenek Seviyeleri**: Öğrencilerden profesyonel geliştiricilere kadar içerik  
- **Pratik Odaklı**: Uygulamalı örnekler ve gerçek dünya senaryoları  
- **Kapsamlı Kapsama**: Temel kavramlardan ileri düzey kurumsal desenlere kadar  
- **Güvenlik Öncelikli Yaklaşım**: Güvenlik en iyi uygulamaları her yerde entegre  
- **Maliyet Optimizasyonu**: Maliyet etkin dağıtımlar ve kaynak yönetimi için rehberlik  

#### Dokümantasyon Kalitesi  
- **Ayrıntılı Kod Örnekleri**: Pratik, test edilmiş kod örnekleri  
- **Adım Adım Talimatlar**: Net, uygulanabilir rehberlik  
- **Kapsamlı Hata Yönetimi**: Yaygın sorunlar için sorun giderme  
- **En İyi Uygulama Entegrasyonu**: Endüstri standartları ve öneriler  
- **Sürüm Uyumluluğu**: En son Azure hizmetleri ve azd özellikleriyle güncel  

## Planlanan Gelecek Geliştirmeler  

### Sürüm 3.1.0 (Planlanıyor)  
#### AI Platformu Genişletmesi  
- **Çoklu Model Desteği**: Hugging Face, Azure Machine Learning ve özel modeller için entegrasyon desenleri  
- **AI Ajan Çerçeveleri**: LangChain, Semantic Kernel ve AutoGen dağıtımları için şablonlar  
- **Gelişmiş RAG Desenleri**: Azure AI Search dışında vektör veritabanı seçenekleri (Pinecone, Weaviate, vb.)  
- **AI İzlenebilirlik**: Model performansı, token kullanımı ve yanıt kalitesi için gelişmiş izleme  

#### Geliştirici Deneyimi  
- **VS Code Eklentisi**: Entegre AZD + AI Foundry geliştirme deneyimi  
- **GitHub Copilot Entegrasyonu**: AI destekli AZD şablon oluşturma  
- **Etkileşimli Eğitimler**: AI senaryoları için otomatik doğrulamalı uygulamalı kodlama alıştırmaları  
- **Video İçeriği**: AI dağıtımlarına odaklanan görsel öğreniciler için ek video eğitimleri  

### Sürüm 4.0.0 (Planlanıyor)  
#### Kurumsal AI Desenleri  
- **Yönetim Çerçevesi**: AI modeli yönetimi, uyumluluk ve denetim izleri  
- **Çok Kiracılı AI**: İzole AI hizmetleriyle birden fazla müşteri için desenler  
- **Edge AI Dağıtımı**: Azure IoT Edge ve konteyner örnekleriyle entegrasyon  
- **Hibrit Bulut AI**: AI iş yükleri için çoklu bulut ve hibrit dağıtım desenleri  

#### Gelişmiş Özellikler  
- **AI Boru Hattı Otomasyonu**: Azure Machine Learning boru hatlarıyla MLOps entegrasyonu  
- **Gelişmiş Güvenlik**: Sıfır güven desenleri, özel uç noktalar ve gelişmiş tehdit koruması  
- **Performans Optimizasyonu**: Yüksek verimli AI uygulamaları için gelişmiş ayar ve ölçekleme stratejileri  
- **Küresel Dağıtım**: AI uygulamaları için içerik teslimi ve uç önbellekleme desenleri  

### Sürüm 3.0.0 (Planlanıyor) - Mevcut Sürümle Yer Değiştirdi  
#### Önerilen Eklemeler - Şimdi v3.0.0'da Uygulandı  
- ✅ **AI Odaklı İçerik**: Kapsamlı Azure AI Foundry entegrasyonu (Tamamlandı)  
- ✅ **Etkileşimli Eğitimler**: Uygulamalı AI atölye laboratuvarı (Tamamlandı)  
- ✅ **Gelişmiş Güvenlik Modülü**: AI'ye özel güvenlik desenleri (Tamamlandı)  
- ✅ **Performans Optimizasyonu**: AI iş yükü ayar stratejileri (Tamamlandı)  

### Sürüm 2.1.0 (Planlanıyor) - Kısmen v3.0.0'da Uygulandı  
#### Küçük Geliştirmeler - Bazıları Mevcut Sürümde Tamamlandı  
- ✅ **Ek Örnekler**: AI odaklı dağıtım senaryoları (Tamamlandı)  
- ✅ **Genişletilmiş SSS**: AI'ye özel sorular ve sorun giderme (Tamamlandı)  
- **Araç Entegrasyonu**: Geliştirilmiş IDE ve düzenleyici entegrasyon rehberleri  
- ✅ **İzleme Genişletmesi**: AI'ye özel izleme ve uyarı desenleri (Tamamlandı)  

#### Hâlâ Gelecek Sürüm İçin Planlanıyor  
- **Mobil Uyumlu Dokümantasyon**: Mobil öğrenim için duyarlı tasarım  
- **Çevrimdışı Erişim**: İndirilebilir dokümantasyon paketleri  
- **Geliştirilmiş IDE Entegrasyonu**: AZD + AI iş akışları için VS Code eklentisi  
- **Topluluk Panosu**: Gerçek zamanlı topluluk metrikleri ve katkı takibi  

## Değişiklik Günlüğüne Katkıda Bulunma  

### Değişiklikleri Bildirme  
Bu depoya katkıda bulunurken, değişiklik günlüğü girişlerinin şunları içerdiğinden emin olun:  

1. **Sürüm Numarası**: Semantik sürümleme (ana.minor.patch) izlenerek  
2. **Tarih**: Yayın veya güncelleme tarihi (YYYY-AA-GG formatında)  
3. **Kategori**: Eklendi, Değiştirildi, Kullanımdan Kaldırıldı, Kaldırıldı, Düzeltildi, Güvenlik  
4. **Açık Açıklama**: Yapılan değişikliğin kısa açıklaması  
5. **Etkisi Değerlendirmesi**: Değişikliklerin mevcut kullanıcıları nasıl etkilediği  

### Değişiklik Kategorileri  

#### Eklendi  
- Yeni özellikler, dokümantasyon bölümleri veya yetenekler  
- Yeni örnekler, şablonlar veya öğrenim kaynakları  
- Ek araçlar, betikler veya yardımcı programlar  

#### Değiştirildi  
- Mevcut işlevsellik veya dokümantasyonda yapılan değişiklikler  
- Netlik veya doğruluğu artırmak için yapılan güncellemeler  
- İçerik veya organizasyonun yeniden yapılandırılması  

#### Kullanımdan Kaldırıldı  
- Kullanımdan kaldırılmakta olan özellikler veya yaklaşımlar  
- Kaldırılması planlanan dokümantasyon bölümleri  
- Daha iyi alternatifleri olan yöntemler  

#### Kaldırıldı  
- Artık geçerli olmayan özellikler, dokümantasyon veya örnekler  
- Güncelliğini yitirmiş bilgiler veya kullanımdan kaldırılmış yaklaşımlar  
- Gereksiz veya birleştirilmiş içerik  

#### Düzeltildi  
- Dokümantasyon veya koddaki hataların düzeltilmesi  
- Bildirilen sorunların veya problemlerin çözülmesi  
- Doğruluk veya işlevsellikteki iyileştirmeler  

#### Güvenlik  
- Güvenlikle ilgili iyileştirmeler veya düzeltmeler  
- Güvenlik en iyi uygulamalarına yönelik güncellemeler  
- Güvenlik açıklarının çözülmesi  

### Semantik Sürümleme Rehberi  

#### Ana Sürüm (X.0.0)  
- Kullanıcı eylemi gerektiren köklü değişiklikler  
- İçerik veya organizasyonda önemli yeniden yapılandırmalar  
- Temel yaklaşımı veya metodolojiyi değiştiren değişiklikler  

#### Küçük Sürüm (X.Y.0)  
- Yeni özellikler veya içerik eklemeleri  
- Geriye dönük uyumluluğu koruyan iyileştirmeler  
- Ek örnekler, araçlar veya kaynaklar  

#### Yama Sürümü (X.Y.Z)  
- Hata düzeltmeleri ve düzeltmeler  
- Mevcut içerikte küçük iyileştirmeler  
- Açıklamalar ve küçük geliştirmeler  

## Topluluk Geri Bildirimi ve Öneriler  

Bu öğrenim kaynağını geliştirmek için topluluk geri bildirimlerini aktif olarak teşvik ediyoruz:  

### Geri Bildirim Sağlama Yolları  
- **GitHub Sorunları**: Sorunları bildirin veya iyileştirme önerilerinde bulunun (AI'ye özel sorunlar memnuniyetle karşılanır)  
- **Discord Tartışmaları**: Fikirlerinizi paylaşın ve Azure AI Foundry topluluğuyla etkileşimde bulunun  
- **Çekme İstekleri**: Özellikle AI şablonları ve rehberleri için içeriğe doğrudan katkıda bulunun  
- **Azure AI Foundry Discord**: AZD + AI tartışmaları için #Azure kanalına katılın  
- **Topluluk Forumları**: Daha geniş Azure geliştirici tartışmalarına katılın  

### Geri Bildirim Kategorileri  
- **AI İçerik Doğruluğu**: AI hizmet entegrasyonu ve dağıtım bilgileri için düzeltmeler  
- **Öğrenim Deneyimi**: AI geliştirici öğrenim akışını iyileştirme önerileri  
- **Eksik AI İçeriği**: Ek AI şablonları, desenleri veya örnekleri için talepler  
- **Erişilebilirlik**: Çeşitli öğrenim ihtiyaçları için iyileştirmeler  
- **AI Araç Entegrasyonu**: Daha iyi AI geliştirme iş akışı entegrasyonu önerileri  
- **Üretim AI Desenleri**: Kurumsal AI dağıtım deseni talepleri  

### Yanıt Taahhüdü  
- **Sorun Yanıtı**: Bildirilen sorunlar için 48 saat içinde  
- **Özellik Talepleri**: Bir hafta içinde değerlendirme  
- **Topluluk Katkıları**: Bir hafta içinde inceleme  
- **Güvenlik Sorunları**: Hızlandırılmış yanıtla öncelikli  

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
- **Uyumluluk Notları**: Köklü değişikliklerle ilgili ayrıntılar  
- **Araç Desteği**: Geçişe yardımcı olacak betikler veya araçlar  
- **Topluluk Desteği**: Geçiş soruları için özel forumlar  

---

**Navigasyon**  
- **Önceki Ders**: [Çalışma Rehberi](resources/study-guide.md)  
- **Sonraki Ders**: [Ana README'ye Dön](README.md)  

**Güncel Kalın**: Bu depoyu izleyerek yeni sürümler ve öğrenim materyallerindeki önemli güncellemeler hakkında bildirim alın.  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->