<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:12:14+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "tr"
}
-->
# Çalışma Kılavuzu - AZD Başlangıç Seviyesi

## Giriş

Bu kapsamlı çalışma kılavuzu, Azure Developer CLI (azd) konusunda uzmanlaşmanıza yardımcı olmak için yapılandırılmış öğrenme hedefleri, temel kavramlar, pratik alıştırmalar ve değerlendirme materyalleri sunar. İlerleyişinizi takip etmek ve tüm temel konuları kapsadığınızdan emin olmak için bu kılavuzu kullanın.

## Öğrenme Hedefleri

Bu çalışma kılavuzunu tamamlayarak:
- Azure Developer CLI'nin temel ve ileri düzey tüm kavramlarını öğrenin
- Azure uygulamalarını dağıtma ve yönetme konusunda pratik beceriler geliştirin
- Dağıtımları optimize etme ve sorun giderme konusunda güven kazanın
- Üretime hazır dağıtım uygulamaları ve güvenlik hususlarını anlayın

## Öğrenme Çıktıları

Bu çalışma kılavuzunun tüm bölümlerini tamamladıktan sonra:
- azd kullanarak tam uygulama mimarileri tasarlayabilir, dağıtabilir ve yönetebilirsiniz
- Kapsamlı izleme, güvenlik ve maliyet optimizasyon stratejileri uygulayabilirsiniz
- Karmaşık dağıtım sorunlarını bağımsız olarak çözebilirsiniz
- Özel şablonlar oluşturabilir ve azd topluluğuna katkıda bulunabilirsiniz

## Kurs Yapısı

### Modül 1: Başlangıç (1-2. Hafta)

#### Öğrenme Hedefleri
- Azure Developer CLI'nin temel kavramlarını anlayın
- azd'yi geliştirme ortamınıza başarıyla kurun ve yapılandırın
- Mevcut bir şablon kullanarak ilk dağıtımınızı tamamlayın
- azd proje yapısını gezin ve temel bileşenleri anlayın

#### Öğrenilmesi Gereken Temel Kavramlar
- Şablonlar, ortamlar ve hizmetler
- azure.yaml yapılandırma yapısı
- Temel azd komutları (init, up, down, deploy)
- Kod olarak Altyapı prensipleri
- Azure kimlik doğrulama ve yetkilendirme

#### Pratik Alıştırmalar

**Alıştırma 1.1: Kurulum ve Ayar**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Alıştırma 1.2: İlk Dağıtım**
```bash
# Deploy a simple web application:
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

#### Öz Değerlendirme Soruları
1. azd mimarisinin üç temel kavramı nelerdir?
2. azure.yaml dosyasının amacı nedir?
3. Ortamlar farklı dağıtım hedeflerini yönetmeye nasıl yardımcı olur?
4. azd ile hangi kimlik doğrulama yöntemleri kullanılabilir?
5. İlk kez `azd up` çalıştırdığınızda ne olur?

### Modül 2: Yapılandırma ve Ortamlar (3. Hafta)

#### Öğrenme Hedefleri
- Ortam yönetimi ve yapılandırmasını öğrenin
- İleri düzey azure.yaml yapılandırmalarını anlayın
- Ortama özgü ayarları ve değişkenleri uygulayın
- Farklı senaryolar için kimlik doğrulama yapılandırması yapın

#### Öğrenilmesi Gereken Temel Kavramlar
- Ortam hiyerarşisi ve değişken önceliği
- Hizmet yapılandırması ve parametreler
- Kancalar ve yaşam döngüsü olayları
- Kimlik doğrulama yöntemleri (kullanıcı, hizmet ilkesi, yönetilen kimlik)
- Yapılandırma dosyası yönetimi

#### Pratik Alıştırmalar

**Alıştırma 2.1: Çoklu Ortam Kurulumu**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Alıştırma 2.2: İleri Düzey Yapılandırma**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Alıştırma 2.3: Güvenlik Yapılandırması**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Öz Değerlendirme Soruları
1. azd ortam değişken önceliğini nasıl yönetir?
2. Dağıtım kancaları nedir ve ne zaman kullanılmalıdır?
3. Farklı ortamlar için farklı SKU'lar nasıl yapılandırılır?
4. Farklı kimlik doğrulama yöntemlerinin güvenlik etkileri nelerdir?
5. Gizli bilgiler ve hassas yapılandırma verileri nasıl yönetilir?

### Modül 3: Dağıtım ve Sağlama (4. Hafta)

#### Öğrenme Hedefleri
- Dağıtım iş akışlarını ve en iyi uygulamaları öğrenin
- Bicep şablonları ile Kod olarak Altyapıyı anlayın
- Karmaşık çok hizmetli mimariler uygulayın
- Dağıtım performansını ve güvenilirliğini optimize edin

#### Öğrenilmesi Gereken Temel Kavramlar
- Bicep şablon yapısı ve modüller
- Kaynak bağımlılıkları ve sıralama
- Dağıtım stratejileri (mavi-yeşil, aşamalı güncellemeler)
- Çok bölgeli dağıtımlar
- Veritabanı geçişleri ve veri yönetimi

#### Pratik Alıştırmalar

**Alıştırma 3.1: Özel Altyapı**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Alıştırma 3.2: Çok Hizmetli Uygulama**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Alıştırma 3.3: Veritabanı Entegrasyonu**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Öz Değerlendirme Soruları
1. Bicep kullanmanın ARM şablonlarına göre avantajları nelerdir?
2. azd dağıtımlarında veritabanı geçişleri nasıl ele alınır?
3. Kesintisiz dağıtım için hangi stratejiler mevcuttur?
4. Hizmetler arasındaki bağımlılıklar nasıl yönetilir?
5. Çok bölgeli dağıtımlar için hangi hususlar dikkate alınmalıdır?

### Modül 4: Dağıtım Öncesi Doğrulama (5. Hafta)

#### Öğrenme Hedefleri
- Kapsamlı dağıtım öncesi kontroller uygulayın
- Kapasite planlaması ve kaynak doğrulama konusunda uzmanlaşın
- SKU seçimi ve maliyet optimizasyonunu anlayın
- Otomatik doğrulama hatları oluşturun

#### Öğrenilmesi Gereken Temel Kavramlar
- Azure kaynak kotaları ve sınırları
- SKU seçim kriterleri ve maliyet etkileri
- Otomatik doğrulama komut dosyaları ve araçları
- Kapasite planlama metodolojileri
- Performans testi ve optimizasyon

#### Pratik Alıştırmalar

**Alıştırma 4.1: Kapasite Planlama**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Alıştırma 4.2: Uçuş Öncesi Doğrulama**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Alıştırma 4.3: SKU Optimizasyonu**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Öz Değerlendirme Soruları
1. SKU seçim kararlarını etkileyen faktörler nelerdir?
2. Dağıtım öncesinde Azure kaynak kullanılabilirliği nasıl doğrulanır?
3. Uçuş öncesi kontrol sisteminin temel bileşenleri nelerdir?
4. Dağıtım maliyetlerini nasıl tahmin eder ve kontrol edersiniz?
5. Kapasite planlaması için hangi izleme önemlidir?

### Modül 5: Sorun Giderme ve Hata Ayıklama (6. Hafta)

#### Öğrenme Hedefleri
- Sistematik sorun giderme metodolojilerini öğrenin
- Karmaşık dağıtım sorunlarını çözme konusunda uzmanlaşın
- Kapsamlı izleme ve uyarı sistemleri uygulayın
- Olay müdahale ve kurtarma prosedürleri oluşturun

#### Öğrenilmesi Gereken Temel Kavramlar
- Yaygın dağıtım hatası modelleri
- Günlük analizi ve korelasyon teknikleri
- Performans izleme ve optimizasyon
- Güvenlik olaylarını tespit etme ve müdahale
- Felaket kurtarma ve iş sürekliliği

#### Pratik Alıştırmalar

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

**Alıştırma 5.3: Olay Müdahalesi**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Öz Değerlendirme Soruları
1. azd dağıtımlarında sistematik sorun giderme yaklaşımı nedir?
2. Birden fazla hizmet ve kaynak arasında günlükler nasıl ilişkilendirilir?
3. Erken problem tespiti için en kritik izleme metrikleri nelerdir?
4. Etkili felaket kurtarma prosedürleri nasıl uygulanır?
5. Bir olay müdahale planının temel bileşenleri nelerdir?

### Modül 6: İleri Düzey Konular ve En İyi Uygulamalar (7-8. Hafta)

#### Öğrenme Hedefleri
- Kurumsal düzeyde dağıtım modelleri uygulayın
- CI/CD entegrasyonu ve otomasyonu konusunda uzmanlaşın
- Özel şablonlar geliştirin ve topluluğa katkıda bulunun
- İleri düzey güvenlik ve uyumluluk gereksinimlerini anlayın

#### Öğrenilmesi Gereken Temel Kavramlar
- CI/CD hat entegrasyon modelleri
- Özel şablon geliştirme ve dağıtımı
- Kurumsal yönetim ve uyumluluk
- İleri düzey ağ ve güvenlik yapılandırmaları
- Performans optimizasyonu ve maliyet yönetimi

#### Pratik Alıştırmalar

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
1. azd'yi mevcut CI/CD iş akışlarına nasıl entegre edersiniz?
2. Özel şablon geliştirme için temel hususlar nelerdir?
3. azd dağıtımlarında yönetim ve uyumluluk nasıl uygulanır?
4. Kurumsal ölçekli dağıtımlar için en iyi uygulamalar nelerdir?
5. azd topluluğuna etkili bir şekilde nasıl katkıda bulunursunuz?

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
- Azure üzerinde çalışan web sitesi
- Portföy dağıtımları için özel azd şablonu
- Dağıtım sürecinin belgelenmesi
- Maliyet analizi ve optimizasyon önerileri

### Proje 2: Görev Yönetimi Uygulaması
**Zorluk Seviyesi**: Orta  
**Süre**: 2-3 hafta

Tam yığın bir görev yönetimi uygulaması oluşturun:
- App Service'e dağıtılan React frontend
- Kimlik doğrulamalı Node.js API backend
- Geçişlerle PostgreSQL veritabanı
- Application Insights izleme

**Teslimatlar**:
- Kullanıcı kimlik doğrulamalı tam uygulama
- Veritabanı şeması ve geçiş komut dosyaları
- İzleme panoları ve uyarı kuralları
- Çoklu ortam dağıtım yapılandırması

### Proje 3: Mikro Hizmetler E-ticaret Platformu
**Zorluk Seviyesi**: İleri  
**Süre**: 4-6 hafta

Mikro hizmetler tabanlı bir e-ticaret platformu tasarlayın ve uygulayın:
- Birden fazla API hizmeti (katalog, siparişler, ödemeler, kullanıcılar)
- Service Bus ile mesaj kuyruğu entegrasyonu
- Performans optimizasyonu için Redis önbelleği
- Kapsamlı günlük kaydı ve izleme

**Teslimatlar**:
- Tam mikro hizmet mimarisi
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
- Çok hizmetli dağıtım senaryoları
- Performans optimizasyonu alıştırmaları

**Modül 4 Değerlendirme**: Dağıtım öncesi doğrulama
- Kapasite planlama vaka çalışmaları
- Maliyet optimizasyon senaryoları
- Doğrulama hattı uygulaması

**Modül 5 Değerlendirme**: Sorun giderme ve hata ayıklama
- Problem teşhis alıştırmaları
- İzleme uygulama görevleri
- Olay müdahale simülasyonları

**Modül 6 Değerlendirme**: İleri düzey konular
- CI/CD hattı tasarımı
- Özel şablon geliştirme
- Kurumsal mimari senaryolar

### Final Proje

Tüm kavramlarda ustalığınızı gösteren eksiksiz bir çözüm tasarlayın ve uygulayın:

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

### Pratik Ortamlar
- [Azure Ücretsiz Hesap](https://azure.microsoft.com/free/)
- [Azure DevOps Ücretsiz Katman](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ek Araçlar
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Çalışma Programı Önerileri

### Tam Zamanlı Çalışma (8 hafta)
- **1-2. Hafta**: Modül 1-2 (Başlangıç, Yapılandırma)
- **3-4. Hafta**: Modül 3-4 (Dağıtım, Dağıtım Öncesi)
- **5-6. Hafta**: Modül 5-6 (Sorun Giderme, İleri Düzey Konular)
- **7-8. Hafta**: Pratik Projeler ve Final Değerlendirme

### Yarı Zamanlı Çalışma (16 hafta)
- **1-4. Hafta**: Modül 1 (Başlangıç)
- **5-7. Hafta**: Modül 2 (Yapılandırma ve Ortamlar)
- **8-10. Hafta**: Modül 3 (Dağıtım ve Sağlama)
- **11-12. Hafta**: Modül 4 (Dağıtım Öncesi Doğrulama)
- **13-14. Hafta**: Modül 5 (Sorun Giderme ve Hata Ayıklama)
- **15-16. Hafta**: Modül 6 (İleri Düzey Konular ve Değerlendirme)

### Kendi Hızınızda Çalışma
- Her modülü kendi hızınızda tamamlayın
- Zorlayıcı kavramlara ek zaman ayırın
- Ustalaşana kadar alıştırmaları tekrarlayın
- Topluluk tartışmalarına katılın ve sorular sorun

## Başarı İpuçları

### Etkili Öğrenme Stratejileri
1. **Düzenli Pratik Yapın**: Uygulamaları sık sık dağıtarak alışkanlık kazanın
2. **Cesurca Deneyin**: Yeni yapılandırmaları denemek için geliştirme ortamlarını kullanın
3. **Öğreniminizi Belgeleyin**: Karşılaştığınız sorunlara çözü
3. **Açık Kaynağa Katkıda Bulunun**: Şablonlarınızı ve çözümlerinizi toplulukla paylaşın  
4. **Başkalarına Öğretin**: Kavramları başkalarına açıklamak, kendi anlayışınızı pekiştirir  
5. **Meraklı Kalın**: Yeni Azure hizmetlerini ve entegrasyon modellerini sürekli olarak keşfedin  

---

**Gezinme**  
- **Önceki Ders**: [SSS](faq.md)  
- **Sonraki Ders**: [Değişiklik Günlüğü](../changelog.md)  

**Çalışma İlerleme Takibi**: Bu kılavuzu öğrenme yolculuğunuzu takip etmek ve Azure Developer CLI kavramları ve uygulamalarının kapsamlı bir şekilde ele alındığından emin olmak için kullanın.  

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.