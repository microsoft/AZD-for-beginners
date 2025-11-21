<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-20T22:45:50+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "tr"
}
-->
# Çalışma Rehberi - Kapsamlı Öğrenme Hedefleri

**Öğrenme Yolu Navigasyonu**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../README.md)
- **📖 Öğrenmeye Başla**: [Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🎯 İlerleme Takibi**: [Kurs Tamamlama](../README.md#-course-completion--certification)

## Giriş

Bu kapsamlı çalışma rehberi, Azure Developer CLI (azd) konusunda ustalaşmanıza yardımcı olmak için yapılandırılmış öğrenme hedefleri, temel kavramlar, pratik alıştırmalar ve değerlendirme materyalleri sunar. İlerlemenizi takip etmek ve tüm temel konuları kapsadığınızdan emin olmak için bu rehberi kullanabilirsiniz.

## Öğrenme Hedefleri

Bu çalışma rehberini tamamladığınızda:
- Azure Developer CLI'nin temel ve ileri düzey tüm kavramlarını öğrenmiş olacaksınız
- Azure uygulamalarını dağıtma ve yönetme konusunda pratik beceriler geliştireceksiniz
- Dağıtımları optimize etme ve sorun giderme konusunda kendinize güven kazanacaksınız
- Üretime hazır dağıtım uygulamaları ve güvenlik konularını anlayacaksınız

## Öğrenme Çıktıları

Bu çalışma rehberinin tüm bölümlerini tamamladıktan sonra:
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

#### Ustalaşılacak Temel Kavramlar
- AZD proje yapısı ve bileşenleri (azure.yaml, infra/, src/)
- Şablon tabanlı dağıtım iş akışları
- Ortam yapılandırma temelleri
- Kaynak grubu ve abonelik yönetimi

#### Pratik Alıştırmalar
1. **Kurulum Doğrulama**: AZD'yi kurun ve `azd version` ile doğrulayın
2. **İlk Dağıtım**: todo-nodejs-mongo şablonunu başarıyla dağıtın
3. **Ortam Ayarı**: İlk ortam değişkenlerinizi yapılandırın
4. **Kaynak Keşfi**: Azure Portal'da dağıtılmış kaynaklarda gezin

#### Değerlendirme Soruları
- AZD projesinin temel bileşenleri nelerdir?
- Bir şablondan yeni bir proje nasıl başlatılır?
- `azd up` ve `azd deploy` arasındaki fark nedir?
- AZD ile birden fazla ortam nasıl yönetilir?

---

### Bölüm 2: AI-Öncelikli Geliştirme (2. Hafta)
**Süre**: 1-2 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Microsoft Foundry hizmetlerini AZD iş akışlarına entegre edin
- AI destekli uygulamaları dağıtın ve yapılandırın
- RAG (Retrieval-Augmented Generation) uygulama desenlerini anlayın
- AI modeli dağıtımlarını ve ölçeklendirmeyi yönetin

#### Ustalaşılacak Temel Kavramlar
- Azure OpenAI hizmet entegrasyonu ve API yönetimi
- AI Arama yapılandırması ve vektör indeksleme
- Model dağıtım stratejileri ve kapasite planlaması
- AI uygulama izleme ve performans optimizasyonu

#### Pratik Alıştırmalar
1. **AI Sohbet Dağıtımı**: azure-search-openai-demo şablonunu dağıtın
2. **RAG Uygulaması**: Belge indeksleme ve geri çağırmayı yapılandırın
3. **Model Yapılandırması**: Farklı amaçlar için birden fazla AI modeli kurun
4. **AI İzleme**: AI iş yükleri için Application Insights'ı uygulayın

#### Değerlendirme Soruları
- AZD şablonunda Azure OpenAI hizmetleri nasıl yapılandırılır?
- RAG mimarisinin temel bileşenleri nelerdir?
- AI modeli kapasitesi ve ölçeklendirme nasıl yönetilir?
- AI uygulamaları için hangi izleme metrikleri önemlidir?

---

### Bölüm 3: Yapılandırma ve Kimlik Doğrulama (3. Hafta)
**Süre**: 45-60 dakika | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Ortam yapılandırma ve yönetim stratejilerinde ustalaşın
- Güvenli kimlik doğrulama desenleri ve yönetilen kimlik uygulayın
- Kaynakları doğru adlandırma kurallarıyla organize edin
- Çoklu ortam dağıtımlarını (geliştirme, test, üretim) yapılandırın

#### Ustalaşılacak Temel Kavramlar
- Ortam hiyerarşisi ve yapılandırma önceliği
- Yönetilen kimlik ve hizmet ilkesi kimlik doğrulama
- Gizli bilgiler yönetimi için Key Vault entegrasyonu
- Ortama özel parametre yönetimi

#### Pratik Alıştırmalar
1. **Çoklu Ortam Ayarı**: Geliştirme, test ve üretim ortamlarını yapılandırın
2. **Güvenlik Yapılandırması**: Yönetilen kimlik kimlik doğrulamasını uygulayın
3. **Gizli Bilgi Yönetimi**: Hassas veriler için Azure Key Vault'u entegre edin
4. **Parametre Yönetimi**: Ortama özel yapılandırmalar oluşturun

#### Değerlendirme Soruları
- AZD ile farklı ortamlar nasıl yapılandırılır?
- Yönetilen kimlik kullanmanın hizmet ilkelerine göre avantajları nelerdir?
- Uygulama gizli bilgileri nasıl güvenli bir şekilde yönetilir?
- AZD'deki yapılandırma hiyerarşisi nedir?

---

### Bölüm 4: Kod Olarak Altyapı ve Dağıtım (4-5. Hafta)
**Süre**: 1-1.5 saat | **Zorluk**: ⭐⭐⭐

#### Öğrenme Hedefleri
- Bicep altyapı şablonları oluşturun ve özelleştirin
- Gelişmiş dağıtım desenleri ve iş akışlarını uygulayın
- Kaynak sağlama stratejilerini anlayın
- Ölçeklenebilir çok hizmetli mimariler tasarlayın

- Azure Container Apps ve AZD kullanarak konteynerleştirilmiş uygulamaları dağıtın

#### Ustalaşılacak Temel Kavramlar
- Bicep şablon yapısı ve en iyi uygulamalar
- Kaynak bağımlılıkları ve dağıtım sıralaması
- Parametre dosyaları ve şablon modülerliği
- Özel kancalar ve dağıtım otomasyonu
- Konteyner uygulama dağıtım desenleri (hızlı başlangıç, üretim, mikro hizmetler)

#### Pratik Alıştırmalar
1. **Özel Şablon Oluşturma**: Çok hizmetli bir uygulama şablonu oluşturun
2. **Bicep Ustalığı**: Modüler, yeniden kullanılabilir altyapı bileşenleri oluşturun
3. **Dağıtım Otomasyonu**: Ön/son dağıtım kancalarını uygulayın
4. **Mimari Tasarım**: Karmaşık mikro hizmet mimarisi dağıtın
5. **Konteyner Uygulama Dağıtımı**: [Simple Flask API](../../../examples/container-app/simple-flask-api) ve [Microservices Architecture](../../../examples/container-app/microservices) örneklerini AZD kullanarak dağıtın

#### Değerlendirme Soruları
- AZD için özel Bicep şablonları nasıl oluşturulur?
- Altyapı kodunu düzenlemek için en iyi uygulamalar nelerdir?
- Şablonlarda kaynak bağımlılıkları nasıl ele alınır?
- Sıfır kesinti süresi güncellemelerini destekleyen dağıtım desenleri nelerdir?

---

### Bölüm 5: Çoklu Ajanlı AI Çözümleri (6-7. Hafta)
**Süre**: 2-3 saat | **Zorluk**: ⭐⭐⭐⭐

#### Öğrenme Hedefleri
- Çoklu ajanlı AI mimarileri tasarlayın ve uygulayın
- Ajan koordinasyonu ve iletişimini düzenleyin
- İzleme ile üretime hazır AI çözümleri dağıtın
- Ajan uzmanlaşması ve iş akışı desenlerini anlayın
- Çoklu ajan çözümlerinin bir parçası olarak konteynerleştirilmiş mikro hizmetleri entegre edin

#### Ustalaşılacak Temel Kavramlar
- Çoklu ajan mimari desenleri ve tasarım ilkeleri
- Ajan iletişim protokolleri ve veri akışı
- AI ajanları için yük dengeleme ve ölçeklendirme stratejileri
- Çoklu ajan sistemleri için üretim izleme
- Konteynerleştirilmiş ortamlarda hizmetler arası iletişim

#### Pratik Alıştırmalar
1. **Perakende Çözümü Dağıtımı**: Tam çoklu ajanlı perakende senaryosunu dağıtın
2. **Ajan Özelleştirme**: Müşteri ve Envanter ajan davranışlarını değiştirin
3. **Mimari Ölçeklendirme**: Yük dengeleme ve otomatik ölçeklendirme uygulayın
4. **Üretim İzleme**: Kapsamlı izleme ve uyarı ayarları yapın
5. **Mikro Hizmet Entegrasyonu**: [Microservices Architecture](../../../examples/container-app/microservices) örneğini ajan tabanlı iş akışlarını destekleyecek şekilde genişletin

#### Değerlendirme Soruları
- Etkili çoklu ajan iletişim desenleri nasıl tasarlanır?
- AI ajan iş yüklerini ölçeklendirmek için temel hususlar nelerdir?
- Çoklu ajanlı AI sistemleri nasıl izlenir ve hata ayıklanır?
- AI ajanları için güvenilirliği sağlayan üretim desenleri nelerdir?

---

### Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama (8. Hafta)
**Süre**: 1 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Kapsamlı kapasite planlaması ve kaynak doğrulama gerçekleştirin
- Maliyet etkinliği için en uygun Azure SKU'larını seçin
- Otomatik ön kontrol ve doğrulama uygulayın
- Maliyet optimizasyon stratejileriyle dağıtımları planlayın

#### Ustalaşılacak Temel Kavramlar
- Azure kaynak kotaları ve kapasite sınırlamaları
- SKU seçim kriterleri ve maliyet optimizasyonu
- Otomatik doğrulama betikleri ve testler
- Dağıtım planlama ve risk değerlendirmesi

#### Pratik Alıştırmalar
1. **Kapasite Analizi**: Uygulamalarınız için kaynak gereksinimlerini analiz edin
2. **SKU Optimizasyonu**: Maliyet etkin hizmet katmanlarını karşılaştırın ve seçin
3. **Doğrulama Otomasyonu**: Dağıtım öncesi kontrol betikleri uygulayın
4. **Maliyet Planlaması**: Dağıtım maliyet tahminleri ve bütçeler oluşturun

#### Değerlendirme Soruları
- Dağıtım öncesi Azure kapasitesi nasıl doğrulanır?
- SKU seçim kararlarını etkileyen faktörler nelerdir?
- Ön dağıtım doğrulaması nasıl otomatikleştirilir?
- Dağıtım maliyetlerini optimize eden stratejiler nelerdir?

---

### Bölüm 7: Sorun Giderme ve Hata Ayıklama (9. Hafta)
**Süre**: 1-1.5 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- AZD dağıtımları için sistematik hata ayıklama yaklaşımları geliştirin
- Yaygın dağıtım ve yapılandırma sorunlarını çözün
- AI'ya özgü sorunları ve performans problemlerini giderin
- Proaktif sorun tespiti için izleme ve uyarı uygulayın

#### Ustalaşılacak Temel Kavramlar
- Tanılama teknikleri ve günlük kaydı stratejileri
- Yaygın hata desenleri ve çözümleri
- Performans izleme ve optimizasyon
- Olay müdahale ve kurtarma prosedürleri

#### Pratik Alıştırmalar
1. **Tanılama Becerileri**: Kasten bozulmuş dağıtımlarla pratik yapın
2. **Günlük Analizi**: Azure Monitor ve Application Insights'ı etkili bir şekilde kullanın
3. **Performans Ayarı**: Yavaş çalışan uygulamaları optimize edin
4. **Kurtarma Prosedürleri**: Yedekleme ve felaket kurtarma uygulayın

#### Değerlendirme Soruları
- En yaygın AZD dağıtım hataları nelerdir?
- Kimlik doğrulama ve izin sorunları nasıl giderilir?
- Üretim sorunlarını önlemeye yardımcı olan izleme stratejileri nelerdir?
- Azure'da uygulama performansı nasıl optimize edilir?

---

### Bölüm 8: Üretim ve Kurumsal Desenler (10-11. Hafta)
**Süre**: 2-3 saat | **Zorluk**: ⭐⭐⭐⭐

#### Öğrenme Hedefleri
- Kurumsal düzeyde dağıtım stratejileri uygulayın
- Güvenlik desenleri ve uyumluluk çerçeveleri tasarlayın
- İzleme, yönetişim ve maliyet yönetimi oluşturun
- AZD entegrasyonu ile ölçeklenebilir CI/CD boru hatları oluşturun
- Üretim konteyner uygulama dağıtımları için en iyi uygulamaları uygulayın (güvenlik, izleme, maliyet, CI/CD)

#### Ustalaşılacak Temel Kavramlar
- Kurumsal güvenlik ve uyumluluk gereksinimleri
- Yönetişim çerçeveleri ve politika uygulamaları
- Gelişmiş izleme ve maliyet yönetimi
- CI/CD entegrasyonu ve otomatik dağıtım boru hatları
- Konteynerleştirilmiş iş yükleri için mavi-yeşil ve kanarya dağıtım stratejileri

#### Pratik Alıştırmalar
1. **Kurumsal Güvenlik**: Kapsamlı güvenlik desenleri uygulayın
2. **Yönetişim Çerçevesi**: Azure Policy ve kaynak yönetimini ayarlayın
3. **Gelişmiş İzleme**: Panolar ve otomatik uyarılar oluşturun
4. **CI/CD Entegrasyonu**: Otomatik dağıtım boru hatları oluşturun
5. **Üretim Konteyner Uygulamaları**: [Microservices Architecture](../../../examples/container-app/microservices) örneğine güvenlik, izleme ve maliyet optimizasyonu uygulayın

#### Değerlendirme Soruları
- AZD dağıtımlarında kurumsal güvenlik nasıl uygulanır?
- Uyumluluk ve maliyet kontrolünü sağlayan yönetişim desenleri nelerdir?
- Üretim sistemleri için ölçeklenebilir izleme nasıl tasarlanır?
- AZD iş akışlarıyla en iyi çalışan CI/CD desenleri nelerdir?

#### Öğrenme Hedefleri
- Azure Developer CLI'nin temel bilgilerini ve ana kavramlarını anlayın
- Geliştirme ortamınıza azd'yi başarıyla kurun ve yapılandırın
- Mevcut bir şablon kullanarak ilk dağıtımınızı tamamlayın
- azd proje yapısını gezin ve temel bileşenleri anlayın

#### Ustalaşılacak Temel Kavramlar
- Şablonlar, ortamlar ve hizmetler
- azure.yaml yapılandırma yapısı
- Temel azd komutları (init, up, down, deploy)
- Kod Olarak Altyapı ilkeleri
- Azure kimlik doğrulama ve yetkilendirme

#### Pratik Alıştırmalar

**Alıştırma 1.1: Kurulum ve Ayar**
```bash
# Bu görevleri tamamlayın:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Alıştırma 1.2: İlk Dağıtım**
```bash
# Basit bir web uygulaması dağıtın:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Alıştırma 1.3: Proje Yapısı Analizi**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Kendi Kendine Değerlendirme Soruları
1. azd mimarisinin üç temel kavramı nelerdir?
2. azure.yaml dosyasının amacı nedir?
3. Ortamlar farklı dağıtım hedeflerini yönetmeye nasıl yardımcı olur?
4. azd ile hangi kimlik doğrulama yöntemleri kullanılabilir?
5. İlk kez `azd up` çalıştırdığınızda ne olur?

---

## İlerleme Takibi ve Değerlendirme Çerçevesi
```bash
# Birden fazla ortam oluştur ve yapılandır:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Alıştırma 2.2: Gelişmiş Yapılandırma**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Alıştırma 2.3: Güvenlik Yapılandırması**
```bash
# Güvenlik en iyi uygulamalarını uygulayın:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Kendi Kendine Değerlendirme Soruları
1. azd ortam değişkeni öncel
5. Çok bölgeli dağıtımlar için hangi hususlar dikkate alınmalıdır?

### Modül 4: Dağıtım Öncesi Doğrulama (5. Hafta)

#### Öğrenme Hedefleri
- Kapsamlı dağıtım öncesi kontrolleri uygulama
- Kapasite planlama ve kaynak doğrulama konusunda uzmanlaşma
- SKU seçimi ve maliyet optimizasyonunu anlama
- Otomatik doğrulama hatları oluşturma

#### Öğrenilmesi Gereken Temel Kavramlar
- Azure kaynak kotaları ve sınırları
- SKU seçim kriterleri ve maliyet etkileri
- Otomatik doğrulama betikleri ve araçları
- Kapasite planlama yöntemleri
- Performans testi ve optimizasyon

#### Uygulama Alıştırmaları

**Alıştırma 4.1: Kapasite Planlama**
```bash
# Kapasite doğrulamasını uygulayın:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Alıştırma 4.2: Dağıtım Öncesi Doğrulama**
```powershell
# Kapsamlı doğrulama hattı oluştur:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Alıştırma 4.3: SKU Optimizasyonu**
```bash
# Servis yapılandırmalarını optimize et:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Kendini Değerlendirme Soruları
1. SKU seçim kararlarını hangi faktörler etkilemelidir?
2. Azure kaynaklarının dağıtımdan önceki uygunluğunu nasıl doğrularsınız?
3. Dağıtım öncesi kontrol sisteminin temel bileşenleri nelerdir?
4. Dağıtım maliyetlerini nasıl tahmin eder ve kontrol edersiniz?
5. Kapasite planlaması için hangi izleme işlemleri gereklidir?

### Modül 5: Sorun Giderme ve Hata Ayıklama (6. Hafta)

#### Öğrenme Hedefleri
- Sistematik sorun giderme yöntemlerinde uzmanlaşma
- Karmaşık dağıtım sorunlarını hata ayıklama konusunda uzmanlık geliştirme
- Kapsamlı izleme ve uyarı sistemleri uygulama
- Olay müdahale ve kurtarma prosedürleri oluşturma

#### Öğrenilmesi Gereken Temel Kavramlar
- Yaygın dağıtım hatası kalıpları
- Günlük analizi ve korelasyon teknikleri
- Performans izleme ve optimizasyon
- Güvenlik olaylarını tespit etme ve müdahale
- Felaket kurtarma ve iş sürekliliği

#### Uygulama Alıştırmaları

**Alıştırma 5.1: Sorun Giderme Senaryoları**
```bash
# Yaygın sorunları çözme pratiği yapın:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Alıştırma 5.2: İzleme Uygulaması**
```bash
# Kapsamlı izleme kurun:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Alıştırma 5.3: Olay Müdahalesi**
```bash
# Olay müdahale prosedürlerini oluşturun:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Kendini Değerlendirme Soruları
1. Azd dağıtımlarında sistematik sorun giderme yaklaşımı nedir?
2. Birden fazla hizmet ve kaynak arasında günlükleri nasıl ilişkilendirirsiniz?
3. Erken problem tespiti için en kritik izleme metrikleri nelerdir?
4. Etkili felaket kurtarma prosedürlerini nasıl uygularsınız?
5. Bir olay müdahale planının temel bileşenleri nelerdir?

### Modül 6: İleri Düzey Konular ve En İyi Uygulamalar (7-8. Hafta)

#### Öğrenme Hedefleri
- Kurumsal düzeyde dağıtım modelleri uygulama
- CI/CD entegrasyonu ve otomasyonunda uzmanlaşma
- Özel şablonlar geliştirme ve topluluğa katkıda bulunma
- İleri düzey güvenlik ve uyumluluk gereksinimlerini anlama

#### Öğrenilmesi Gereken Temel Kavramlar
- CI/CD hattı entegrasyon modelleri
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
# Özel şablonlar oluştur ve yayınla:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Alıştırma 6.3: Kurumsal Uygulama**
```bash
# Kurumsal düzeyde özellikler uygulayın:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Kendini Değerlendirme Soruları
1. Azd'yi mevcut CI/CD iş akışlarına nasıl entegre edersiniz?
2. Özel şablon geliştirme için temel hususlar nelerdir?
3. Azd dağıtımlarında yönetim ve uyumluluğu nasıl uygularsınız?
4. Kurumsal ölçekli dağıtımlar için en iyi uygulamalar nelerdir?
5. Azd topluluğuna etkili bir şekilde nasıl katkıda bulunursunuz?

## Pratik Projeler

### Proje 1: Kişisel Portföy Web Sitesi
**Zorluk Seviyesi**: Başlangıç  
**Süre**: 1-2 hafta

Şunları kullanarak kişisel bir portföy web sitesi oluşturun ve dağıtın:
- Azure Storage üzerinde statik web sitesi barındırma
- Özel alan adı yapılandırması
- Küresel performans için CDN entegrasyonu
- Otomatik dağıtım hattı

**Teslimatlar**:
- Azure'da dağıtılmış çalışan bir web sitesi
- Portföy dağıtımları için özel azd şablonu
- Dağıtım sürecinin belgelenmesi
- Maliyet analizi ve optimizasyon önerileri

### Proje 2: Görev Yönetimi Uygulaması
**Zorluk Seviyesi**: Orta  
**Süre**: 2-3 hafta

Tam yığın bir görev yönetimi uygulaması oluşturun:
- App Service'e dağıtılmış React frontend
- Kimlik doğrulamalı Node.js API backend
- PostgreSQL veritabanı ve geçişler
- Application Insights izleme

**Teslimatlar**:
- Kullanıcı kimlik doğrulaması ile tamamlanmış uygulama
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

**Referans Örneği**: Üretime hazır bir şablon ve dağıtım kılavuzu için [Mikroservis Mimari](../../../examples/container-app/microservices) bölümüne bakın

**Teslimatlar**:
- Tam mikroservis mimarisi
- Hizmetler arası iletişim modelleri
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
- Performans optimizasyonu alıştırmaları

**Modül 4 Değerlendirme**: Dağıtım öncesi doğrulama
- Kapasite planlama vaka çalışmaları
- Maliyet optimizasyon senaryoları
- Doğrulama hattı uygulaması

**Modül 5 Değerlendirme**: Sorun giderme ve hata ayıklama
- Sorun teşhis alıştırmaları
- İzleme uygulama görevleri
- Olay müdahale simülasyonları

**Modül 6 Değerlendirme**: İleri düzey konular
- CI/CD hattı tasarımı
- Özel şablon geliştirme
- Kurumsal mimari senaryolar

### Final Proje

Tüm kavramlarda ustalığı gösteren eksiksiz bir çözüm tasarlayın ve uygulayın:

**Gereksinimler**:
- Çok katmanlı uygulama mimarisi
- Birden fazla dağıtım ortamı
- Kapsamlı izleme ve uyarı sistemleri
- Güvenlik ve uyumluluk uygulaması
- Maliyet optimizasyonu ve performans ayarı
- Tam belgeler ve çalışma kılavuzları

**Değerlendirme Kriterleri**:
- Teknik uygulama kalitesi
- Belgelerin eksiksizliği
- Güvenlik ve en iyi uygulamalara uyum
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
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Çalışma Takvimi Önerileri

### Tam Zamanlı Çalışma (8 hafta)
- **Hafta 1-2**: Modül 1-2 (Başlangıç, Yapılandırma)
- **Hafta 3-4**: Modül 3-4 (Dağıtım, Dağıtım Öncesi)
- **Hafta 5-6**: Modül 5-6 (Sorun Giderme, İleri Düzey Konular)
- **Hafta 7-8**: Pratik Projeler ve Final Değerlendirme

### Yarı Zamanlı Çalışma (16 hafta)
- **Hafta 1-4**: Modül 1 (Başlangıç)
- **Hafta 5-7**: Modül 2 (Yapılandırma ve Ortamlar)
- **Hafta 8-10**: Modül 3 (Dağıtım ve Sağlama)
- **Hafta 11-12**: Modül 4 (Dağıtım Öncesi Doğrulama)
- **Hafta 13-14**: Modül 5 (Sorun Giderme ve Hata Ayıklama)
- **Hafta 15-16**: Modül 6 (İleri Düzey Konular ve Değerlendirme)

---

## İlerleme Takibi ve Değerlendirme Çerçevesi

### Bölüm Tamamlama Kontrol Listesi

Her bölümü aşağıdaki ölçülebilir sonuçlarla takip edin:

#### 📚 Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç
- [ ] **Kurulum Tamamlandı**: AZD platformunuzda kuruldu ve doğrulandı
- [ ] **İlk Dağıtım**: todo-nodejs-mongo şablonu başarıyla dağıtıldı
- [ ] **Ortam Kurulumu**: İlk ortam değişkenleri yapılandırıldı
- [ ] **Kaynak Gezinme**: Azure Portal'da dağıtılmış kaynaklar keşfedildi
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
- [ ] **Parametre Yönetimi**: Ortama özgü yapılandırmalar oluşturuldu
- [ ] **Kimlik Doğrulama Uzmanlığı**: Güvenli erişim modelleri uygulandı

#### 🏗️ Bölüm 4: Kod Olarak Altyapı ve Dağıtım
- [ ] **Özel Şablon Oluşturma**: Çok hizmetli bir uygulama şablonu oluşturuldu
- [ ] **Bicep Uzmanlığı**: Modüler, yeniden kullanılabilir altyapı bileşenleri oluşturuldu
- [ ] **Dağıtım Otomasyonu**: Dağıtım öncesi/sonrası kancalar uygulandı
- [ ] **Mimari Tasarım**: Karmaşık mikroservis mimarisi dağıtıldı
- [ ] **Şablon Optimizasyonu**: Performans ve maliyet için şablonlar optimize edildi

#### 🎯 Bölüm 5: Çoklu Ajanlı AI Çözümleri
- [ ] **Perakende Çözümü Dağıtımı**: Tam çoklu ajanlı perakende senaryosu dağıtıldı
- [ ] **Ajan Özelleştirme**: Müşteri ve Envanter ajan davranışları değiştirildi
- [ ] **Mimari Ölçekleme**: Yük dengeleme ve otomatik ölçekleme uygulandı
- [ ] **Üretim İzleme**: Kapsamlı izleme ve uyarı sistemleri kuruldu
- [ ] **Performans Ayarı**: Çoklu ajan sistem performansı optimize edildi

#### 🔍 Bölüm 6: Dağıtım Öncesi Doğrulama ve Planlama
- [ ] **Kapasite Analizi**: Uygulamalar için kaynak gereksinimleri analiz edildi
- [ ] **SKU Optimizasyonu**: Maliyet açısından etkili hizmet seviyeleri seçildi
- [ ] **Doğrulama Otomasyonu**: Dağıtım öncesi kontrol betikleri uygulandı
- [ ] **Maliyet Planlaması**: Dağıtım maliyet tahminleri ve bütçeler oluşturuldu
- [ ] **Risk Değerlendirmesi**: Dağıtım riskleri belirlendi ve azaltıldı

#### 🚨 Bölüm 7: Sorun Giderme ve Hata Ayıklama
- [ ] **Tanı Becerileri**: Kasıtlı olarak bozulmuş dağıtımları başarıyla hata ayıklandı
- [ ] **Günlük Analizi**: Azure Monitor ve Application Insights etkili bir şekilde kullanıldı
- [ ] **Performans Ayarı**: Yavaş çalışan uygulamalar optimize edildi
- [ ] **Kurtarma Prosedürleri**: Yedekleme ve felaket kurtarma uygulandı
- [ ] **İzleme Kurulumu**: Proaktif izleme ve uyarı sistemleri oluşturuldu

#### 🏢 Bölüm 8: Üretim ve Kurumsal Modeller
- [ ] **Kurumsal Güvenlik**: Kapsamlı güvenlik modelleri uygulandı
- [ ] **Yönetim Çerçevesi**: Azure Policy ve kaynak yönetimi kuruldu
- [ ] **İleri Düzey İzleme**: Panolar ve otomatik uyarılar oluşturuldu
- [ ] **CI/CD Entegrasyonu**: Otomatik dağıtım hatları oluşturuldu
- [ ] **Uyumluluk Uygulaması**: Kurumsal uyumluluk gereksinimleri karşılandı

### Öğrenme Zaman Çizelgesi ve Kilometre Taşları

#### Hafta 1-2: Temel Bilgi Oluşturma
- **Kilometre Taşı**: AZD kullanarak ilk AI uygulamasını dağıtın
- **Doğrulama**: Çalışan uygulama genel URL üzerinden erişilebilir
- **Beceriler**: Temel AZD iş akışları ve AI hizmet entegrasyonu

#### Hafta 3-4: Yapılandırma Uzmanlığı
- **Kilometre Taşı**: Güvenli kimlik doğrulama ile çoklu ortam dağıtımı
- **Doğrulama**: Aynı uygulama geliştirme/test/üretim ortamlarına dağıtıldı
- **Beceriler**: Ortam yönetimi ve güvenlik uygulaması

#### Hafta 5-6: Altyapı Uzmanlığı
- **Kilometre Taşı**: Karmaşık çok hizmetli uygulama için özel şablon
- **
5. **Topluluk Katkısı**: Şablonlar veya iyileştirmeler paylaşın

#### Mesleki Gelişim Sonuçları
- **Portföy Projeleri**: 8 üretime hazır dağıtım
- **Teknik Beceriler**: Endüstri standardı AZD ve AI dağıtım uzmanlığı
- **Problem Çözme Yetkinlikleri**: Bağımsız sorun giderme ve optimizasyon
- **Topluluk Tanınırlığı**: Azure geliştirici topluluğunda aktif katılım
- **Kariyer İlerlemesi**: Bulut ve AI rolleri için doğrudan uygulanabilir beceriler

#### Başarı Ölçütleri
- **Dağıtım Başarı Oranı**: %95'ten fazla başarılı dağıtım
- **Sorun Giderme Süresi**: Yaygın sorunlar için <30 dakika
- **Performans Optimizasyonu**: Maliyet ve performansta gösterilebilir iyileştirmeler
- **Güvenlik Uyumluluğu**: Tüm dağıtımlar kurumsal güvenlik standartlarını karşılar
- **Bilgi Aktarımı**: Diğer geliştiricilere mentorluk yapabilme

### Sürekli Öğrenme ve Topluluk Katılımı

#### Güncel Kalın
- **Azure Güncellemeleri**: Azure Developer CLI sürüm notlarını takip edin
- **Topluluk Etkinlikleri**: Azure ve AI geliştirici etkinliklerine katılın
- **Dokümantasyon**: Topluluk dokümantasyonu ve örneklerine katkıda bulunun
- **Geri Bildirim Döngüsü**: Kurs içeriği ve Azure hizmetleri hakkında geri bildirim sağlayın

#### Kariyer Gelişimi
- **Profesyonel Ağ**: Azure ve AI uzmanlarıyla bağlantı kurun
- **Konuşma Fırsatları**: Konferanslarda veya buluşmalarda öğrenimlerinizi sunun
- **Açık Kaynak Katkısı**: AZD şablonlarına ve araçlarına katkıda bulunun
- **Mentorluk**: Diğer geliştiricilere AZD öğrenme yolculuklarında rehberlik edin

---

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Öğrenmeye Başla**: [Bölüm 1: Temel Bilgiler ve Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🎯 İlerleme Takibi**: Kapsamlı 8 bölümlük öğrenme sistemiyle ilerlemenizi takip edin
- **🤝 Topluluk**: Destek ve tartışma için [Azure Discord](https://discord.gg/microsoft-azure)

**Çalışma İlerleme Takibi**: Azure Developer CLI'yi yapılandırılmış bir rehberle, ölçülebilir sonuçlar ve mesleki gelişim avantajlarıyla aşamalı ve pratik bir şekilde öğrenin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->