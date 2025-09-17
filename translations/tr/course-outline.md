<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-17T21:52:28+00:00",
  "source_file": "course-outline.md",
  "language_code": "tr"
}
-->
## 8-Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç (30-45 dakika) 🌱
**Gereksinimler**: Azure aboneliği, temel komut satırı bilgisi  
**Zorluk Seviyesi**: ⭐

#### Öğrenecekleriniz
- Azure Developer CLI temel bilgilerini anlama
- AZD'nin platformunuza kurulumu  
- İlk başarılı dağıtımınız
- Temel kavramlar ve terminoloji

#### Öğrenme Kaynakları
- [AZD Temelleri](docs/getting-started/azd-basics.md) - Temel kavramlar
- [Kurulum ve Ayarlar](docs/getting-started/installation.md) - Platforma özel rehberler
- [İlk Projeniz](docs/getting-started/first-project.md) - Uygulamalı eğitim
- [Komut Kılavuzu](resources/cheat-sheet.md) - Hızlı referans

#### Pratik Sonuç
AZD kullanarak Azure'a basit bir web uygulaması başarıyla dağıtın

---

### Bölüm 2: AI-Öncelikli Geliştirme (1-2 saat) 🤖
**Gereksinimler**: Bölüm 1 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- AZD ile Azure AI Foundry entegrasyonu
- AI destekli uygulamaların dağıtımı
- AI hizmet yapılandırmalarını anlama
- RAG (Retrieval-Augmented Generation) desenleri

#### Öğrenme Kaynakları
- [Azure AI Foundry Entegrasyonu](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Dağıtımı](docs/ai-foundry/ai-model-deployment.md)
- [AI Atölye Laboratuvarı](docs/ai-foundry/ai-workshop-lab.md) - Uygulamalı laboratuvar
- [Azure AI Foundry Şablonları](README.md#featured-azure-ai-foundry-templates)

#### Pratik Sonuç
RAG özelliklerine sahip AI destekli bir sohbet uygulaması dağıtın ve yapılandırın

---

### Bölüm 3: Yapılandırma ve Kimlik Doğrulama (45-60 dakika) ⚙️
**Gereksinimler**: Bölüm 1 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Ortam yapılandırması ve yönetimi
- Kimlik doğrulama ve güvenlik en iyi uygulamaları
- Kaynak adlandırma ve organizasyonu
- Çoklu ortam dağıtımları

#### Öğrenme Kaynakları
- [Yapılandırma Rehberi](docs/getting-started/configuration.md) - Ortam ayarları
- Güvenlik desenleri ve yönetilen kimlik
- Çoklu ortam örnekleri

#### Pratik Sonuç
Doğru kimlik doğrulama ve güvenlikle birden fazla ortamı yönetin

---

### Bölüm 4: Kod Olarak Altyapı ve Dağıtım (1-1.5 saat) 🏗️
**Gereksinimler**: Bölüm 1-3 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐⭐

#### Öğrenecekleriniz
- İleri düzey dağıtım desenleri
- Bicep ile Kod Olarak Altyapı
- Kaynak sağlama stratejileri
- Özel şablon oluşturma

#### Öğrenme Kaynakları
- [Dağıtım Rehberi](docs/deployment/deployment-guide.md) - Tam iş akışları
- [Kaynak Sağlama](docs/deployment/provisioning.md) - Kaynak yönetimi
- Konteyner ve mikro hizmet örnekleri

#### Pratik Sonuç
Özel altyapı şablonları kullanarak karmaşık çok hizmetli uygulamalar dağıtın

---

### Bölüm 5: Çoklu-Ajanlı AI Çözümleri (2-3 saat) 🤖🤖
**Gereksinimler**: Bölüm 1-2 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Çoklu ajan mimari desenleri
- Ajan orkestrasyonu ve koordinasyonu
- Üretime hazır AI dağıtımları
- Müşteri ve Envanter ajan uygulamaları

#### Öğrenme Kaynakları
- [Perakende Çoklu-Ajan Çözümü](examples/retail-scenario.md) - Tam uygulama
- [ARM Şablon Paketi](../../examples/retail-multiagent-arm-template) - Tek tıkla dağıtım
- Çoklu ajan koordinasyon desenleri

#### Pratik Sonuç
Üretime hazır çoklu ajanlı bir AI çözümü dağıtın ve yönetin

---

### Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama (1 saat) 🔍
**Gereksinimler**: Bölüm 4 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Kapasite planlama ve kaynak doğrulama
- SKU seçim stratejileri
- Ön kontrol ve otomasyon
- Maliyet optimizasyon planlaması

#### Öğrenme Kaynakları
- [Kapasite Planlama](docs/pre-deployment/capacity-planning.md) - Kaynak doğrulama
- [SKU Seçimi](docs/pre-deployment/sku-selection.md) - Maliyet etkin seçimler
- [Ön Kontroller](docs/pre-deployment/preflight-checks.md) - Otomatikleştirilmiş komut dosyaları

#### Pratik Sonuç
Dağıtımları gerçekleştirmeden önce doğrulayın ve optimize edin

---

### Bölüm 7: Sorun Giderme ve Hata Ayıklama (1-1.5 saat) 🔧
**Gereksinimler**: Herhangi bir dağıtım bölümü tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐

#### Öğrenecekleriniz
- Sistematik hata ayıklama yaklaşımları
- Yaygın sorunlar ve çözümleri
- AI'ya özgü sorun giderme
- Performans optimizasyonu

#### Öğrenme Kaynakları
- [Yaygın Sorunlar](docs/troubleshooting/common-issues.md) - SSS ve çözümler
- [Hata Ayıklama Rehberi](docs/troubleshooting/debugging.md) - Adım adım stratejiler
- [AI'ya Özgü Sorun Giderme](docs/troubleshooting/ai-troubleshooting.md) - AI hizmet sorunları

#### Pratik Sonuç
Yaygın dağıtım sorunlarını bağımsız olarak teşhis edin ve çözün

---

### Bölüm 8: Üretim ve Kurumsal Desenler (2-3 saat) 🏢
**Gereksinimler**: Bölüm 1-4 tamamlanmış olmalı  
**Zorluk Seviyesi**: ⭐⭐⭐⭐

#### Öğrenecekleriniz
- Üretim dağıtım stratejileri
- Kurumsal güvenlik desenleri
- İzleme ve maliyet optimizasyonu
- Ölçeklenebilirlik ve yönetişim

#### Öğrenme Kaynakları
- [Üretim AI En İyi Uygulamaları](docs/ai-foundry/production-ai-practices.md) - Kurumsal desenler
- Mikro hizmetler ve kurumsal örnekler
- İzleme ve yönetişim çerçeveleri

#### Pratik Sonuç
Tam üretim yeteneklerine sahip kurumsal düzeyde uygulamalar dağıtın

---

## Öğrenme İlerlemesi ve Zorluk Seviyesi

### Kademeli Beceri Geliştirme

- **🌱 Yeni Başlayanlar**: Bölüm 1 (Temel Bilgiler) → Bölüm 2 (AI Geliştirme)
- **🔧 Orta Seviye**: Bölüm 3-4 (Yapılandırma ve Altyapı) → Bölüm 6 (Doğrulama)
- **🚀 İleri Seviye**: Bölüm 5 (Çoklu-Ajan Çözümleri) → Bölüm 7 (Sorun Giderme)
- **🏢 Kurumsal**: Tüm bölümleri tamamlayın, Bölüm 8'e odaklanın (Üretim Desenleri)

### Zorluk Göstergeleri

- **⭐ Temel**: Tek kavramlar, rehberli eğitimler, 30-60 dakika
- **⭐⭐ Orta Seviye**: Birden fazla kavram, uygulamalı pratik, 1-2 saat  
- **⭐⭐⭐ İleri Seviye**: Karmaşık mimariler, özel çözümler, 1-3 saat
- **⭐⭐⭐⭐ Uzman**: Üretim sistemleri, kurumsal desenler, 2-4 saat

### Esnek Öğrenme Yolları

#### 🎯 AI Geliştirici Hızlı Yol (4-6 saat)
1. **Bölüm 1**: Temel Bilgiler ve Hızlı Başlangıç (45 dakika)
2. **Bölüm 2**: AI-Öncelikli Geliştirme (2 saat)  
3. **Bölüm 5**: Çoklu-Ajanlı AI Çözümleri (3 saat)
4. **Bölüm 8**: Üretim AI En İyi Uygulamaları (1 saat)

#### 🛠️ Altyapı Uzmanı Yolu (5-7 saat)
1. **Bölüm 1**: Temel Bilgiler ve Hızlı Başlangıç (45 dakika)
2. **Bölüm 3**: Yapılandırma ve Kimlik Doğrulama (1 saat)
3. **Bölüm 4**: Kod Olarak Altyapı ve Dağıtım (1.5 saat)
4. **Bölüm 6**: Dağıtım Öncesi Doğrulama ve Planlama (1 saat)
5. **Bölüm 7**: Sorun Giderme ve Hata Ayıklama (1.5 saat)
6. **Bölüm 8**: Üretim ve Kurumsal Desenler (2 saat)

#### 🎓 Tam Öğrenme Yolculuğu (8-12 saat)
Tüm 8 bölümü sırasıyla tamamlayarak uygulamalı pratik ve doğrulama yapın

## Kurs Tamamlama Çerçevesi

### Bilgi Doğrulama
- **Bölüm Kontrol Noktaları**: Ölçülebilir sonuçlarla uygulamalı alıştırmalar
- **Uygulamalı Doğrulama**: Her bölüm için çalışan çözümler dağıtın
- **İlerleme Takibi**: Görsel göstergeler ve tamamlama rozetleri
- **Topluluk Doğrulaması**: Azure Discord kanallarında deneyimlerinizi paylaşın

### Öğrenme Sonuçları Değerlendirmesi

#### Bölüm 1-2 Tamamlama (Temel + AI)
- ✅ AZD kullanarak temel bir web uygulaması dağıtın
- ✅ RAG özellikli AI destekli bir sohbet uygulaması dağıtın
- ✅ AZD temel kavramlarını ve AI entegrasyonunu anlayın

#### Bölüm 3-4 Tamamlama (Yapılandırma + Altyapı)  
- ✅ Çoklu ortam dağıtımlarını yönetin
- ✅ Özel Bicep altyapı şablonları oluşturun
- ✅ Güvenli kimlik doğrulama desenlerini uygulayın

#### Bölüm 5-6 Tamamlama (Çoklu-Ajan + Doğrulama)
- ✅ Karmaşık çoklu ajanlı AI çözümü dağıtın
- ✅ Kapasite planlaması ve maliyet optimizasyonu yapın
- ✅ Otomatik dağıtım öncesi doğrulama uygulayın

#### Bölüm 7-8 Tamamlama (Sorun Giderme + Üretim)
- ✅ Dağıtım sorunlarını bağımsız olarak çözün  
- ✅ Kurumsal düzeyde izleme ve güvenlik uygulayın
- ✅ Yönetişimle üretime hazır uygulamalar dağıtın

### Sertifikasyon ve Tanınma
- **Kurs Tamamlama Rozeti**: Tüm 8 bölümü uygulamalı doğrulama ile tamamlayın
- **Topluluk Tanınması**: Azure AI Foundry Discord'da aktif katılım
- **Profesyonel Gelişim**: Endüstriyle ilgili AZD ve AI dağıtım becerileri
- **Kariyer İlerlemesi**: Kurumsal düzeyde bulut dağıtım yetenekleri

## Modern Geliştiriciler İçin İçerik Uygunluğu

### Teknik Derinlik ve Kapsam
- **Azure OpenAI Entegrasyonu**: GPT-4o, gömme modeller ve çoklu model dağıtımları
- **AI Mimari Desenleri**: RAG uygulamaları, çoklu ajan orkestrasyonu ve üretim AI iş akışları
- **Kod Olarak Altyapı**: Bicep şablonları, ARM dağıtımları ve otomatik kaynak sağlama
- **Üretim Hazırlığı**: Güvenlik, ölçeklenebilirlik, izleme, maliyet optimizasyonu ve yönetişim
- **Kurumsal Desenler**: Çoklu ortam dağıtımları, CI/CD entegrasyonu ve uyumluluk çerçeveleri

### Pratik Öğrenme Odaklı
- **Dağıtım Otomasyonu**: Teorik kavramlar yerine uygulamalı AZD iş akışlarına vurgu
- **Gerçek Dünya Senaryoları**: Müşteri ve Envanter ajanlarıyla tam perakende çoklu ajan çözümü
- **Üretim Örnekleri**: ARM şablon paketleri, tek tıkla dağıtımlar ve kurumsal desenler
- **Sorun Giderme Becerileri**: AI'ya özgü hata ayıklama, çok hizmetli tanılama ve performans optimizasyonu
- **Endüstri İlgisi**: Azure AI Foundry topluluğu geri bildirimlerine ve kurumsal gereksinimlere dayalı

### Topluluk ve Destek Entegrasyonu
- **Discord Entegrasyonu**: Azure AI Foundry ve Microsoft Azure topluluklarında aktif katılım
- **GitHub Tartışmaları**: Akranlar ve uzmanlarla işbirlikçi öğrenme ve sorun çözme
- **Uzman Erişimi**: Microsoft mühendisleri ve AI dağıtım uzmanlarıyla doğrudan bağlantı
- **Sürekli Güncellemeler**: Kurs içeriği Azure platform güncellemeleri ve topluluk geri bildirimleriyle gelişir
- **Kariyer Gelişimi**: Modern bulut ve AI geliştirme rolleri için doğrudan uygulanabilir beceriler

### Öğrenme Sonucu Doğrulama
- **Ölçülebilir Beceriler**: Her bölüm, doğrulanabilir sonuçlarla uygulamalı dağıtım alıştırmaları içerir
- **Portföy Geliştirme**: Profesyonel portföyler ve iş görüşmeleri için uygun projeler tamamlayın
- **Endüstri Tanınması**: AZD ve AI dağıtım uzmanlığı için mevcut iş piyasası talepleriyle uyumlu beceriler
- **Profesyonel Ağ**: Kariyer ilerlemesi ve işbirliği için Azure geliştirici topluluğuna erişim

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.