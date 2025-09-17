<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T22:02:22+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "tr"
}
-->
# Çalışma Kılavuzu - Kapsamlı Öğrenme Hedefleri

**Öğrenme Yolculuğu Navigasyonu**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../README.md)
- **📖 Öğrenmeye Başla**: [Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🎯 İlerleme Takibi**: [Kurs Tamamlama](../README.md#-course-completion--certification)

## Giriş

Bu kapsamlı çalışma kılavuzu, Azure Developer CLI (azd) konusunda uzmanlaşmanıza yardımcı olmak için yapılandırılmış öğrenme hedefleri, temel kavramlar, pratik alıştırmalar ve değerlendirme materyalleri sunar. İlerlemenizi takip etmek ve tüm önemli konuları kapsadığınızdan emin olmak için bu kılavuzu kullanabilirsiniz.

## Öğrenme Hedefleri

Bu çalışma kılavuzunu tamamlayarak:
- Azure Developer CLI'nin temel ve ileri düzey tüm kavramlarını öğrenin
- Azure uygulamalarını dağıtma ve yönetme konusunda pratik beceriler geliştirin
- Dağıtımları optimize etme ve sorun giderme konusunda güven kazanın
- Üretime hazır dağıtım uygulamaları ve güvenlik konularını anlayın

## Öğrenme Çıktıları

Bu çalışma kılavuzunun tüm bölümlerini tamamladıktan sonra:
- azd kullanarak tam uygulama mimarileri tasarlayabilir, dağıtabilir ve yönetebilirsiniz
- Kapsamlı izleme, güvenlik ve maliyet optimizasyon stratejilerini uygulayabilirsiniz
- Karmaşık dağıtım sorunlarını bağımsız olarak çözebilirsiniz
- Özel şablonlar oluşturabilir ve azd topluluğuna katkıda bulunabilirsiniz

## 8 Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç (1. Hafta)
**Süre**: 30-45 dakika | **Zorluk**: ⭐

#### Öğrenme Hedefleri
- Azure Developer CLI'nin temel kavramlarını ve terminolojisini anlayın
- AZD'yi geliştirme platformunuza başarıyla kurun ve yapılandırın
- Mevcut bir şablon kullanarak ilk uygulamanızı dağıtın
- AZD komut satırı arayüzünde etkili bir şekilde gezinmeyi öğrenin

#### Öğrenilmesi Gereken Temel Kavramlar
- AZD proje yapısı ve bileşenleri (azure.yaml, infra/, src/)
- Şablon tabanlı dağıtım iş akışları
- Ortam yapılandırma temelleri
- Kaynak grubu ve abonelik yönetimi

#### Pratik Alıştırmalar
1. **Kurulum Doğrulama**: AZD'yi kurun ve `azd version` ile doğrulayın
2. **İlk Dağıtım**: todo-nodejs-mongo şablonunu başarıyla dağıtın
3. **Ortam Ayarları**: İlk ortam değişkenlerinizi yapılandırın
4. **Kaynak Keşfi**: Azure Portal'da dağıtılan kaynaklarda gezin

#### Değerlendirme Soruları
- AZD projesinin temel bileşenleri nelerdir?
- Bir şablondan yeni bir proje nasıl başlatılır?
- `azd up` ile `azd deploy` arasındaki fark nedir?
- AZD ile birden fazla ortamı nasıl yönetirsiniz?

---

### Bölüm 2: AI-Öncelikli Geliştirme (2. Hafta)
**Süre**: 1-2 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- AZD iş akışlarıyla Azure AI Foundry hizmetlerini entegre edin
- AI destekli uygulamaları dağıtın ve yapılandırın
- RAG (Retrieval-Augmented Generation) uygulama desenlerini anlayın
- AI model dağıtımlarını ve ölçeklendirmeyi yönetin

#### Öğrenilmesi Gereken Temel Kavramlar
- Azure OpenAI hizmet entegrasyonu ve API yönetimi
- AI Arama yapılandırması ve vektör indeksleme
- Model dağıtım stratejileri ve kapasite planlaması
- AI uygulama izleme ve performans optimizasyonu

#### Pratik Alıştırmalar
1. **AI Sohbet Dağıtımı**: azure-search-openai-demo şablonunu dağıtın
2. **RAG Uygulaması**: Belge indeksleme ve geri çağırmayı yapılandırın
3. **Model Yapılandırması**: Farklı amaçlar için birden fazla AI modeli kurun
4. **AI İzleme**: AI iş yükleri için Application Insights uygulayın

#### Değerlendirme Soruları
- AZD şablonunda Azure OpenAI hizmetlerini nasıl yapılandırırsınız?
- RAG mimarisinin temel bileşenleri nelerdir?
- AI model kapasitesini ve ölçeklendirmeyi nasıl yönetirsiniz?
- AI uygulamaları için hangi izleme metrikleri önemlidir?

---

### Bölüm 3: Yapılandırma ve Kimlik Doğrulama (3. Hafta)
**Süre**: 45-60 dakika | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Ortam yapılandırma ve yönetim stratejilerini öğrenin
- Güvenli kimlik doğrulama desenlerini ve yönetilen kimlikleri uygulayın
- Kaynakları doğru adlandırma kurallarıyla organize edin
- Çoklu ortam dağıtımlarını yapılandırın (geliştirme, test, üretim)

#### Öğrenilmesi Gereken Temel Kavramlar
- Ortam hiyerarşisi ve yapılandırma önceliği
- Yönetilen kimlik ve hizmet sorumlusu kimlik doğrulama
- Gizli bilgiler için Key Vault entegrasyonu
- Ortama özgü parametre yönetimi

#### Pratik Alıştırmalar
1. **Çoklu Ortam Kurulumu**: Geliştirme, test ve üretim ortamlarını yapılandırın
2. **Güvenlik Yapılandırması**: Yönetilen kimlik kimlik doğrulamasını uygulayın
3. **Gizli Bilgi Yönetimi**: Hassas veriler için Azure Key Vault'u entegre edin
4. **Parametre Yönetimi**: Ortama özgü yapılandırmalar oluşturun

#### Değerlendirme Soruları
- AZD ile farklı ortamlar nasıl yapılandırılır?
- Yönetilen kimliklerin hizmet sorumlularına göre avantajları nelerdir?
- Uygulama gizli bilgileri nasıl güvenli bir şekilde yönetilir?
- AZD'deki yapılandırma hiyerarşisi nedir?

---

### Bölüm 4: Kod Olarak Altyapı ve Dağıtım (4-5. Hafta)
**Süre**: 1-1.5 saat | **Zorluk**: ⭐⭐⭐

#### Öğrenme Hedefleri
- Bicep altyapı şablonları oluşturun ve özelleştirin
- İleri düzey dağıtım desenlerini ve iş akışlarını uygulayın
- Kaynak sağlama stratejilerini anlayın
- Ölçeklenebilir çok hizmetli mimariler tasarlayın

#### Öğrenilmesi Gereken Temel Kavramlar
- Bicep şablon yapısı ve en iyi uygulamalar
- Kaynak bağımlılıkları ve dağıtım sıralaması
- Parametre dosyaları ve şablon modülerliği
- Özel kancalar ve dağıtım otomasyonu

#### Pratik Alıştırmalar
1. **Özel Şablon Oluşturma**: Çok hizmetli bir uygulama şablonu oluşturun
2. **Bicep Uzmanlığı**: Modüler, yeniden kullanılabilir altyapı bileşenleri oluşturun
3. **Dağıtım Otomasyonu**: Ön/son dağıtım kancalarını uygulayın
4. **Mimari Tasarım**: Karmaşık mikro hizmet mimarisi dağıtın

#### Değerlendirme Soruları
- AZD için özel Bicep şablonları nasıl oluşturulur?
- Altyapı kodunu organize etmek için en iyi uygulamalar nelerdir?
- Şablonlarda kaynak bağımlılıkları nasıl ele alınır?
- Sıfır kesinti güncellemelerini destekleyen dağıtım desenleri nelerdir?

---

### Bölüm 5: Çoklu Ajanlı AI Çözümleri (6-7. Hafta)
**Süre**: 2-3 saat | **Zorluk**: ⭐⭐⭐⭐

#### Öğrenme Hedefleri
- Çoklu ajanlı AI mimarileri tasarlayın ve uygulayın
- Ajan koordinasyonunu ve iletişimini düzenleyin
- İzleme ile üretime hazır AI çözümleri dağıtın
- Ajan uzmanlaşması ve iş akışı desenlerini anlayın

#### Öğrenilmesi Gereken Temel Kavramlar
- Çoklu ajan mimarisi desenleri ve tasarım ilkeleri
- Ajan iletişim protokolleri ve veri akışı
- AI ajanları için yük dengeleme ve ölçeklendirme stratejileri
- Çoklu ajan sistemleri için üretim izleme

#### Pratik Alıştırmalar
1. **Perakende Çözümü Dağıtımı**: Tam çoklu ajanlı perakende senaryosunu dağıtın
2. **Ajan Özelleştirme**: Müşteri ve Envanter ajan davranışlarını değiştirin
3. **Mimari Ölçeklendirme**: Yük dengeleme ve otomatik ölçeklendirme uygulayın
4. **Üretim İzleme**: Kapsamlı izleme ve uyarı sistemleri kurun

#### Değerlendirme Soruları
- Etkili çoklu ajan iletişim desenleri nasıl tasarlanır?
- AI ajan iş yüklerini ölçeklendirmek için temel hususlar nelerdir?
- Çoklu ajanlı AI sistemlerini nasıl izler ve hata ayıklarsınız?
- AI ajanları için güvenilirlik sağlayan üretim desenleri nelerdir?

---

### Bölüm 6: Ön Dağıtım Doğrulama ve Planlama (8. Hafta)
**Süre**: 1 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Kapsamlı kapasite planlaması ve kaynak doğrulama gerçekleştirin
- Maliyet etkinliği için en uygun Azure SKU'larını seçin
- Otomatik ön kontrol ve doğrulama uygulayın
- Maliyet optimizasyon stratejileriyle dağıtımları planlayın

#### Öğrenilmesi Gereken Temel Kavramlar
- Azure kaynak kotaları ve kapasite sınırlamaları
- SKU seçim kriterleri ve maliyet optimizasyonu
- Otomatik doğrulama komut dosyaları ve testler
- Dağıtım planlama ve risk değerlendirmesi

#### Pratik Alıştırmalar
1. **Kapasite Analizi**: Uygulamalarınız için kaynak gereksinimlerini analiz edin
2. **SKU Optimizasyonu**: Maliyet etkin hizmet seviyelerini karşılaştırın ve seçin
3. **Doğrulama Otomasyonu**: Ön dağıtım kontrol komut dosyalarını uygulayın
4. **Maliyet Planlama**: Dağıtım maliyet tahminleri ve bütçeler oluşturun

#### Değerlendirme Soruları
- Azure kapasitesini dağıtımdan önce nasıl doğrularsınız?
- SKU seçim kararlarını etkileyen faktörler nelerdir?
- Ön dağıtım doğrulamasını nasıl otomatikleştirirsiniz?
- Dağıtım maliyetlerini optimize etmeye yardımcı olan stratejiler nelerdir?
2. Azure kaynaklarının kullanılabilirliğini dağıtımdan önce nasıl doğrularsınız?  
3. Ön kontrol sistemi için temel bileşenler nelerdir?  
4. Dağıtım maliyetlerini nasıl tahmin eder ve kontrol edersiniz?  
5. Kapasite planlaması için hangi izleme yöntemleri gereklidir?

### Modül 5: Sorun Giderme ve Hata Ayıklama (6. Hafta)

#### Öğrenme Hedefleri
- Sistematik sorun giderme metodolojilerini öğrenin  
- Karmaşık dağıtım sorunlarını hata ayıklama konusunda uzmanlaşın  
- Kapsamlı izleme ve uyarı sistemleri uygulayın  
- Olay müdahale ve kurtarma prosedürleri oluşturun  

#### Ustalaşılması Gereken Temel Kavramlar
- Yaygın dağıtım hatası kalıpları  
- Günlük analizi ve korelasyon teknikleri  
- Performans izleme ve optimizasyon  
- Güvenlik olaylarını tespit etme ve müdahale  
- Felaket kurtarma ve iş sürekliliği  

#### Uygulama Alıştırmaları

**Alıştırma 5.1: Sorun Giderme Senaryoları**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Alıştırma 5.2: İzleme Uygulaması**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Alıştırma 5.3: Olay Müdahale**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Öz Değerlendirme Soruları
1. AZD dağıtımlarında sistematik sorun giderme yaklaşımı nedir?  
2. Birden fazla hizmet ve kaynak arasında günlükleri nasıl ilişkilendirirsiniz?  
3. Erken problem tespiti için en kritik izleme metrikleri nelerdir?  
4. Etkili felaket kurtarma prosedürlerini nasıl uygularsınız?  
5. Bir olay müdahale planının temel bileşenleri nelerdir?

### Modül 6: İleri Düzey Konular ve En İyi Uygulamalar (7-8. Hafta)

#### Öğrenme Hedefleri
- Kurumsal düzeyde dağıtım desenlerini uygulayın  
- CI/CD entegrasyonu ve otomasyonunda uzmanlaşın  
- Özel şablonlar geliştirin ve topluluğa katkıda bulunun  
- İleri düzey güvenlik ve uyumluluk gereksinimlerini anlayın  

#### Ustalaşılması Gereken Temel Kavramlar
- CI/CD boru hattı entegrasyon desenleri  
- Özel şablon geliştirme ve dağıtımı  
- Kurumsal yönetim ve uyumluluk  
- İleri düzey ağ ve güvenlik yapılandırmaları  
- Performans optimizasyonu ve maliyet yönetimi  

#### Uygulama Alıştırmaları

**Alıştırma 6.1: CI/CD Entegrasyonu**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Alıştırma 6.2: Özel Şablon Geliştirme**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Alıştırma 6.3: Kurumsal Uygulama**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Öz Değerlendirme Soruları
1. AZD'yi mevcut CI/CD iş akışlarına nasıl entegre edersiniz?  
2. Özel şablon geliştirme için temel hususlar nelerdir?  
3. AZD dağıtımlarında yönetim ve uyumluluğu nasıl uygularsınız?  
4. Kurumsal ölçekli dağıtımlar için en iyi uygulamalar nelerdir?  
5. AZD topluluğuna etkili bir şekilde nasıl katkıda bulunursunuz?

## Uygulamalı Projeler

### Proje 1: Kişisel Portföy Web Sitesi  
**Zorluk Seviyesi**: Başlangıç  
**Süre**: 1-2 hafta  

Şunları kullanarak kişisel bir portföy web sitesi oluşturun ve dağıtın:  
- Azure Storage üzerinde statik web sitesi barındırma  
- Özel alan adı yapılandırması  
- Küresel performans için CDN entegrasyonu  
- Otomatik dağıtım boru hattı  

**Teslimatlar**:  
- Azure üzerinde çalışan web sitesi  
- Portföy dağıtımları için özel AZD şablonu  
- Dağıtım sürecinin belgelenmesi  
- Maliyet analizi ve optimizasyon önerileri  

### Proje 2: Görev Yönetimi Uygulaması  
**Zorluk Seviyesi**: Orta  
**Süre**: 2-3 hafta  

Tam yığın bir görev yönetimi uygulaması oluşturun:  
- App Service'e dağıtılan React frontend  
- Kimlik doğrulamalı Node.js API backend  
- PostgreSQL veritabanı ve geçişler  
- Application Insights izleme  

**Teslimatlar**:  
- Kullanıcı kimlik doğrulamalı tam uygulama  
- Veritabanı şeması ve geçiş betikleri  
- İzleme panoları ve uyarı kuralları  
- Çoklu ortam dağıtım yapılandırması  

### Proje 3: Mikroservis E-ticaret Platformu  
**Zorluk Seviyesi**: İleri  
**Süre**: 4-6 hafta  

Mikroservis tabanlı bir e-ticaret platformu tasarlayın ve uygulayın:  
- Birden fazla API hizmeti (katalog, siparişler, ödemeler, kullanıcılar)  
- Service Bus ile mesaj kuyruğu entegrasyonu  
- Performans optimizasyonu için Redis önbelleği  
- Kapsamlı günlük kaydı ve izleme  

**Teslimatlar**:  
- Tam mikroservis mimarisi  
- Hizmetler arası iletişim desenleri  
- Performans testi ve optimizasyon  
- Üretime hazır güvenlik uygulaması  

## Değerlendirme ve Sertifikasyon

### Bilgi Kontrolleri

Her modülden sonra bu değerlendirmeleri tamamlayın:

**Modül 1 Değerlendirme**: Temel kavramlar ve kurulum  
- Temel kavramlar üzerine çoktan seçmeli sorular  
- Pratik kurulum ve yapılandırma görevleri  
- Basit dağıtım alıştırması  

**Modül 2 Değerlendirme**: Yapılandırma ve ortamlar  
- Ortam yönetimi senaryoları  
- Yapılandırma sorun giderme alıştırmaları  
- Güvenlik yapılandırması uygulaması  

**Modül 3 Değerlendirme**: Dağıtım ve sağlama  
- Altyapı tasarım zorlukları  
- Çoklu hizmet dağıtım senaryoları  
- Performans optimizasyon alıştırmaları  

**Modül 4 Değerlendirme**: Dağıtım öncesi doğrulama  
- Kapasite planlama vaka çalışmaları  
- Maliyet optimizasyon senaryoları  
- Doğrulama boru hattı uygulaması  

**Modül 5 Değerlendirme**: Sorun giderme ve hata ayıklama  
- Sorun teşhis alıştırmaları  
- İzleme uygulama görevleri  
- Olay müdahale simülasyonları  

**Modül 6 Değerlendirme**: İleri düzey konular  
- CI/CD boru hattı tasarımı  
- Özel şablon geliştirme  
- Kurumsal mimari senaryolar  

### Final Proje

Tüm kavramları gösteren eksiksiz bir çözüm tasarlayın ve uygulayın:

**Gereksinimler**:  
- Çok katmanlı uygulama mimarisi  
- Birden fazla dağıtım ortamı  
- Kapsamlı izleme ve uyarı  
- Güvenlik ve uyumluluk uygulaması  
- Maliyet optimizasyonu ve performans ayarı  
- Tam belgeler ve çalışma kılavuzları  

**Değerlendirme Kriterleri**:  
- Teknik uygulama kalitesi  
- Belgelerin eksiksizliği  
- Güvenlik ve en iyi uygulamalara uygunluk  
- Performans ve maliyet optimizasyonu  
- Sorun giderme ve izleme etkinliği  

## Çalışma Kaynakları ve Referanslar

### Resmi Belgeler
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Belgeleri](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)  

### Topluluk Kaynakları
- [AZD Şablon Galerisi](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organizasyonu](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Deposu](https://github.com/Azure/azure-dev)  

### Uygulama Ortamları
- [Azure Ücretsiz Hesap](https://azure.microsoft.com/free/)  
- [Azure DevOps Ücretsiz Katman](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Ek Araçlar
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Araçları Uzantı Paketi](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Çalışma Programı Önerileri

### Tam Zamanlı Çalışma (8 Hafta)
- **1-2. Hafta**: Modül 1-2 (Başlangıç, Yapılandırma)  
- **3-4. Hafta**: Modül 3-4 (Dağıtım, Ön Dağıtım)  
- **5-6. Hafta**: Modül 5-6 (Sorun Giderme, İleri Konular)  
- **7-8. Hafta**: Uygulamalı Projeler ve Final Değerlendirme  

### Yarı Zamanlı Çalışma (16 Hafta)
- **1-4. Hafta**: Modül 1 (Başlangıç)  
- **5-7. Hafta**: Modül 2 (Yapılandırma ve Ortamlar)  
- **8-10. Hafta**: Modül 3 (Dağıtım ve Sağlama)  
- **11-12. Hafta**: Modül 4 (Dağıtım Öncesi Doğrulama)  
- **13-14. Hafta**: Modül 5 (Sorun Giderme ve Hata Ayıklama)  
- **15-16. Hafta**: Modül 6 (İleri Konular ve Değerlendirme)  

---

## İlerleme Takibi ve Değerlendirme Çerçevesi

### Bölüm Tamamlama Kontrol Listesi

Her bölümü aşağıdaki ölçülebilir sonuçlarla takip edin:

#### 📚 Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç  
- [ ] **Kurulum Tamamlandı**: AZD platformunuzda kuruldu ve doğrulandı  
- [ ] **İlk Dağıtım**: todo-nodejs-mongo şablonu başarıyla dağıtıldı  
- [ ] **Ortam Kurulumu**: İlk ortam değişkenleri yapılandırıldı  
- [ ] **Kaynak Gezinme**: Azure Portal'da dağıtılan kaynaklar keşfedildi  
- [ ] **Komut Uzmanlığı**: Temel AZD komutlarına hakim olundu  

#### 🤖 Bölüm 2: AI-Öncelikli Geliştirme  
- [ ] **AI Şablon Dağıtımı**: azure-search-openai-demo başarıyla dağıtıldı  
- [ ] **RAG Uygulaması**: Belge indeksleme ve geri alma yapılandırıldı  
- [ ] **Model Yapılandırması**: Farklı amaçlarla birden fazla AI modeli kuruldu  
- [ ] **AI İzleme**: AI iş yükleri için Application Insights uygulandı  
- [ ] **Performans Optimizasyonu**: AI uygulama performansı ayarlandı  

#### ⚙️ Bölüm 3: Yapılandırma ve Kimlik Doğrulama  
- [ ] **Çoklu Ortam Kurulumu**: Geliştirme, test ve üretim ortamları yapılandırıldı  
- [ ] **Güvenlik Uygulaması**: Yönetilen kimlik doğrulama kuruldu  
- [ ] **Gizli Bilgi Yönetimi**: Hassas veriler için Azure Key Vault entegre edildi  
- [ ] **Parametre Yönetimi**: Ortama özel yapılandırmalar oluşturuldu  
- [ ] **Kimlik Doğrulama Uzmanlığı**: Güvenli erişim desenleri uygulandı  

#### 🏗️ Bölüm 4: Kod Olarak Altyapı ve Dağıtım  
- [ ] **Özel Şablon Oluşturma**: Çoklu hizmet uygulama şablonu oluşturuldu  
- [ ] **Bicep Uzmanlığı**: Modüler, yeniden kullanılabilir altyapı bileşenleri oluşturuldu  
- [ ] **Dağıtım Otomasyonu**: Ön/son dağıtım kancaları uygulandı  
- [ ] **Mimari Tasarım**: Karmaşık mikroservis mimarisi dağıtıldı  
- [ ] **Şablon Optimizasyonu**: Performans ve maliyet için şablonlar optimize edildi  

#### 🎯 Bölüm 5: Çoklu Ajanlı AI Çözümleri  
- [ ] **Perakende Çözümü Dağıtımı**: Tam çoklu ajanlı perakende senaryosu dağıtıldı  
- [ ] **Ajan Özelleştirme**: Müşteri ve Envanter ajan davranışları değiştirildi  
- [ ] **Mimari Ölçekleme**: Yük dengeleme ve otomatik ölçekleme uygulandı  
- [ ] **Üretim İzleme**: Kapsamlı izleme ve uyarı kuruldu  
- [ ] **Performans Ayarı**: Çoklu ajan sistem performansı optimize edildi  

#### 🔍 Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama  
- [ ] **Kapasite Analizi**: Uygulamalar için kaynak gereksinimleri analiz edildi  
- [ ] **SKU Optimizasyonu**: Maliyet etkin hizmet katmanları seçildi  
- [ ] **Doğrulama Otomasyonu**: Dağıtım öncesi kontrol betikleri uygulandı  
- [ ] **Maliyet Planlama**: Dağıtım maliyet tahminleri ve bütçeler oluşturuldu  
- [ ] **Risk Değerlendirme**: Dağıtım riskleri tanımlandı ve azaltıldı  

#### 🚨 Bölüm 7: Sorun Giderme ve Hata Ayıklama  
- [ ] **Tanı Becerileri**: Kasıtlı olarak bozulmuş dağıtımları başarıyla hata ayıklandı  
- [ ] **Günlük Analizi**: Azure Monitor ve Application Insights etkili bir şekilde kullanıldı  
- [ ] **Performans Ayarı**: Yavaş çalışan uygulamalar optimize edildi  
- [ ] **Kurtarma Prosedürleri**: Yedekleme ve felaket kurtarma uygulandı  
- [ ] **İzleme Kurulumu**: Proaktif izleme ve uyarı oluşturuldu  

#### 🏢 Bölüm 8: Üretim ve Kurumsal Desenler  
- [ ] **Kurumsal Güvenlik**: Kapsamlı güvenlik desenleri uygulandı  
- [ ] **Yönetim Çerçevesi**: Azure Policy ve kaynak yönetimi kuruldu  
- [ ] **İleri İzleme**: Panolar ve otomatik uyarılar oluşturuldu  
- [ ] **CI/CD Entegrasyonu**: Otomatik dağıtım boru hatları oluşturuldu  
- [ ] **Uyumluluk Uygulaması**: Kurumsal uyumluluk gereksinimleri karşılandı  

### Öğrenme Zaman Çizelgesi ve Kilometre Taşları

#### 1-2. Hafta: Temel Bilgi Oluşturma  
- **Kilometre Taşı**: AZD kullanarak ilk AI uygulamasını dağıtın  
- **Doğrulama**: Çalışan uygulama, genel URL üzerinden erişilebilir  
- **Beceriler**: Temel AZD iş akışları ve AI hizmet entegrasyonu  

#### 3-4. Hafta: Yapılandırma Uzmanlığı  
- **Kilometre Taşı**: Güvenli kimlik doğrulama ile çoklu ortam dağıtımı  
- **Doğrulama**: Aynı uygulama geliştirme/test/üretim ortamlarına dağıtıldı  
- **Beceriler**: Ortam yönetimi ve güvenlik uygulaması  

#### 5-6. Hafta: Altyapı Uzmanlığı  
- **Kilometre Taşı**: Karmaşık çoklu hizmet uygulaması için özel şablon  
- **Doğrulama**: Yeniden kullanılabilir şablon başka bir ekip üyesi tarafından dağıtıldı  
- **Beceriler**: Bicep uzmanlığı ve altyapı otomasyonu  

#### 7-8. Hafta: İleri Düzey AI Uygulaması  
- **Kilometre Taşı**: Üretime hazır çoklu ajanlı AI çözümü  
- **Doğrulama**: Gerçek dünya yükünü izleme ile sistem işliyor  
- **Beceriler**: Çoklu ajan düzenleme ve performans optimizasyonu  

#### 9-10. Hafta: Üretim Hazırlığı  
- **Kilometre Taşı**: Tam uyumluluk ile kurumsal düzeyde dağıtım  
- **Doğrulama**: Güvenlik incelemesi ve maliyet optimizasyon denetimini geçti  
- **Beceriler**: Yönetim, izleme ve CI/CD entegrasyonu  

### Değerlendirme ve Sertifikasyon

#### Bilgi Doğrulama Yöntemleri  
1. **Pratik Dağıtımlar**: Her bölüm için çalışan uygulamalar  
2. **Kod İncelemeleri**: Şablon ve yapılandırma kalitesi değerlendirmesi  
3. **Problem Çözme**: Sorun giderme senaryoları ve çözümleri  
4
- **Dokümantasyon**: Topluluk dokümantasyonuna ve örneklere katkıda bulunun
- **Geri Bildirim Döngüsü**: Kurs içeriği ve Azure hizmetleri hakkında geri bildirim sağlayın

#### Kariyer Gelişimi
- **Profesyonel Ağ**: Azure ve yapay zeka uzmanlarıyla bağlantı kurun
- **Konuşma Fırsatları**: Konferanslarda veya buluşmalarda öğrendiklerinizi sunun
- **Açık Kaynak Katkısı**: AZD şablonlarına ve araçlarına katkıda bulunun
- **Mentorluk**: Diğer geliştiricilere AZD öğrenme yolculuklarında rehberlik edin

---

**Bölüm Gezinimi:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Öğrenmeye Başla**: [Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🎯 İlerleme Takibi**: Kapsamlı 8 bölümlük öğrenme sistemiyle ilerlemenizi takip edin
- **🤝 Topluluk**: [Azure Discord](https://discord.gg/microsoft-azure) üzerinden destek ve tartışma

**Çalışma İlerleme Takibi**: Azure Developer CLI'yi yapılandırılmış bir rehberle, aşamalı ve pratik öğrenme yoluyla, ölçülebilir sonuçlar ve profesyonel gelişim avantajlarıyla ustalaşmak için kullanın.

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.