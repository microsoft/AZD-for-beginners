# Çalışma Rehberi - Kapsamlı Öğrenme Hedefleri

**Öğrenme Yolu Navigasyonu**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../README.md)
- **📖 Öğrenmeye Başla**: [Bölüm 1: Temel & Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🎯 İlerleme Takibi**: [Kurs Tamamlama](../README.md#-course-completion--certification)

## Giriş

Bu kapsamlı çalışma rehberi, Azure Developer CLI (azd) konusunda ustalaşmanıza yardımcı olacak yapılandırılmış öğrenme hedefleri, ana kavramlar, pratik alıştırmalar ve değerlendirme materyalleri sağlar. Bu rehberi ilerlemenizi takip etmek ve temel konuların tümünü kapsadığınızdan emin olmak için kullanın.

## Öğrenme Hedefleri

Bu çalışma rehberini tamamlayarak:
- Azure Developer CLI'nin tüm temel ve ileri düzey kavramlarında ustalaşacaksınız
- Azure uygulamalarını dağıtma ve yönetmede pratik beceriler geliştireceksiniz
- Dağıtımları sorun giderme ve optimize etme konusunda güven kazanacaksınız
- Üretime hazır dağıtım uygulamalarını ve güvenlik hususlarını anlayacaksınız

## Öğrenme Çıktıları

Bu çalışma rehberinin tüm bölümlerini tamamladıktan sonra:
- azd kullanarak eksiksiz uygulama mimarileri tasarlayacak, dağıtacak ve yöneteceksiniz
- Kapsamlı izleme, güvenlik ve maliyet optimizasyonu stratejileri uygulayacaksınız
- Karmaşık dağıtım sorunlarını bağımsız olarak çözebileceksiniz
- Özel şablonlar oluşturacak ve azd topluluğuna katkıda bulunacaksınız

## 8 Bölümlük Öğrenme Yapısı

### Bölüm 1: Temel & Hızlı Başlangıç (Hafta 1)
**Süre**: 30-45 dakika | **Zorluk**: ⭐

#### Öğrenme Hedefleri
- Azure Developer CLI çekirdek kavramlarını ve terminolojiyi anlayın
- Geliştirme platformunuzda AZD'yi başarıyla yükleyip yapılandırın
- Mevcut bir şablonu kullanarak ilk uygulamanızı dağıtın
- AZD komut satırı arayüzünde etkili şekilde gezinmeyi öğrenin

#### Ustalaşılması Gereken Temel Kavramlar
- AZD proje yapısı ve bileşenleri (azure.yaml, infra/, src/)
- Şablon tabanlı dağıtım iş akışları
- Ortam yapılandırması temelleri
- Kaynak grubu ve abonelik yönetimi

#### Pratik Alıştırmalar
1. **Kurulum Doğrulama**: AZD'yi yükleyin ve `azd version` ile doğrulayın
2. **İlk Dağıtım**: todo-nodejs-mongo şablonunu başarıyla dağıtın
3. **Ortam Kurulumu**: İlk ortam değişkenlerinizi yapılandırın
4. **Kaynak Keşfi**: Azure Portal'da dağıtılan kaynakları keşfedin

#### Değerlendirme Soruları
- Bir AZD projesinin temel bileşenleri nelerdir?
- Bir şablondan yeni bir projeyi nasıl başlatırsınız?
- `azd up` ile `azd deploy` arasındaki fark nedir?
- AZD ile birden fazla ortamı nasıl yönetirsiniz?

---

### Bölüm 2: Yapay Zeka Öncelikli Geliştirme (Hafta 2)
**Süre**: 1-2 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Microsoft Foundry hizmetlerini AZD iş akışlarıyla entegre edin
- Yapay zekâ destekli uygulamaları dağıtın ve yapılandırın
- RAG (Retrieval-Augmented Generation) uygulama desenlerini anlayın
- Yapay zekâ model dağıtımlarını ve ölçeklendirmesini yönetin

#### Ustalaşılması Gereken Temel Kavramlar
- Microsoft Foundry Models hizmet entegrasyonu ve API yönetimi
- AI Search yapılandırması ve vektör indeksleme
- Model dağıtım stratejileri ve kapasite planlama
- AI uygulama izleme ve performans optimizasyonu

#### Pratik Alıştırmalar
1. **AI Sohbet Dağıtımı**: azure-search-openai-demo şablonunu dağıtın
2. **RAG Uygulaması**: Belge indeksleme ve alma yapılandırmasını uygulayın
3. **Model Yapılandırma**: Farklı amaçlar için birden fazla AI modeli kurun
4. **AI İzleme**: AI iş yükleri için Application Insights uygulayın

#### Değerlendirme Soruları
- AZD şablonunda Microsoft Foundry Models hizmetlerini nasıl yapılandırırsınız?
- Bir RAG mimarisinin temel bileşenleri nelerdir?
- AI model kapasitesini ve ölçeklendirmesini nasıl yönetirsiniz?
- AI uygulamaları için hangi izleme metrikleri önemlidir?

---

### Bölüm 3: Yapılandırma & Kimlik Doğrulama (Hafta 3)
**Süre**: 45-60 dakika | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Ortam yapılandırma ve yönetim stratejilerinde ustalaşın
- Güvenli kimlik doğrulama desenleri ve managed identity uygulayın
- Kaynakları uygun adlandırma kurallarıyla organize edin
- Çok ortamlı dağıtımları (dev, staging, prod) yapılandırın

#### Ustalaşılması Gereken Temel Kavramlar
- Ortam hiyerarşisi ve yapılandırma önceliği
- Managed identity ve service principal kimlik doğrulama
- Gizli veriler için Key Vault entegrasyonu
- Ortamlara özgü parametre yönetimi

#### Pratik Alıştırmalar
1. **Çoklu Ortam Kurulumu**: dev, staging ve prod ortamlarını yapılandırın
2. **Güvenlik Yapılandırması**: Managed identity kimlik doğrulamasını uygulayın
3. **Gizli Yönetimi**: Hassas veriler için Azure Key Vault entegrasyonu yapın
4. **Parametre Yönetimi**: Ortamlara özgü yapılandırmalar oluşturun

#### Değerlendirme Soruları
- AZD ile farklı ortamları nasıl yapılandırırsınız?
- Managed identity kullanmanın service principal'a göre faydaları nelerdir?
- Uygulama gizli verilerini nasıl güvenli şekilde yönetirsiniz?
- AZD'de yapılandırma hiyerarşisi nedir?

---

### Bölüm 4: Altyapı Kod Olarak & Dağıtım (Hafta 4-5)
**Süre**: 1-1.5 saat | **Zorluk**: ⭐⭐⭐

#### Öğrenme Hedefleri
- Bicep altyapı şablonları oluşturun ve özelleştirin
- Gelişmiş dağıtım desenleri ve iş akışlarını uygulayın
- Kaynak sağlama stratejilerini anlayın
- Ölçeklenebilir çok hizmetli mimariler tasarlayın

- Azure Container Apps ve AZD kullanarak konteynerleştirilmiş uygulamaları dağıtın


#### Ustalaşılması Gereken Temel Kavramlar
- Bicep şablon yapısı ve en iyi uygulamalar
- Kaynak bağımlılıkları ve dağıtım sıralaması
- Parametre dosyaları ve şablon modülerliği
- Özel hook'lar ve dağıtım otomasyonu
- Container app dağıtım desenleri (hızlı başlangıç, üretim, mikroservisler)

#### Pratik Alıştırmalar
1. **Özel Şablon Oluşturma**: Çok hizmetli bir uygulama şablonu oluşturun
2. **Bicep Ustaca Kullanımı**: Modüler, yeniden kullanılabilir altyapı bileşenleri oluşturun
3. **Dağıtım Otomasyonu**: Ön/son dağıtım hook'larını uygulayın
4. **Mimari Tasarım**: Karmaşık mikroservis mimarisi dağıtın
5. **Container App Dağıtımı**: AZD kullanarak [Basit Flask API](../../../examples/container-app/simple-flask-api) ve [Mikroservis Mimarisi](../../../examples/container-app/microservices) örneklerini dağıtın

#### Değerlendirme Soruları
- AZD için özel Bicep şablonlarını nasıl oluşturursunuz?
- Altyapı kodunu organize etmede en iyi uygulamalar nelerdir?
- Şablonlarda kaynak bağımlılıklarını nasıl yönetirsiniz?
- Hangi dağıtım desenleri kesintisiz güncellemeyi destekler?

---

### Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri (Hafta 6-7)
**Süre**: 2-3 saat | **Zorluk**: ⭐⭐⭐⭐

#### Öğrenme Hedefleri
- Çok ajanlı yapay zeka mimarileri tasarlayın ve uygulayın
- Ajan koordinasyonu ve iletişimini orkestre edin
- İzlemeli üretim hazır AI çözümleri dağıtın
- Ajan uzmanlaşması ve iş akışı desenlerini anlayın
- Çok ajanlı çözümlerin bir parçası olarak konteynerleştirilmiş mikroservisleri entegre edin

#### Ustalaşılması Gereken Temel Kavramlar
- Çok ajanlı mimari desenleri ve tasarım ilkeleri
- Ajan iletişim protokolleri ve veri akışı
- AI ajanları için yük dengeleme ve ölçeklendirme stratejileri
- Çok ajanlı sistemler için üretim izlemesi
- Konteynerleştirilmiş ortamlarda servisler arası iletişim

#### Pratik Alıştırmalar
1. **Perakende Çözümü Dağıtımı**: Tam çok ajanlı perakende senaryosunu dağıtın
2. **Ajan Özelleştirme**: Müşteri ve Envanter ajan davranışlarını değiştirin
3. **Mimari Ölçeklendirme**: Yük dengeleme ve otomatik ölçeklendirme uygulayın
4. **Üretim İzleme**: Kapsamlı izleme ve uyarı kurun
5. **Mikroservis Entegrasyonu**: [Mikroservis Mimarisi](../../../examples/container-app/microservices) örneğini ajan tabanlı iş akışlarını destekleyecek şekilde genişletin

#### Değerlendirme Soruları
- Etkili çok ajanlı iletişim desenlerini nasıl tasarlarsınız?
- AI ajan iş yüklerini ölçeklendirirken dikkat edilmesi gereken başlıca noktalar nelerdir?
- Çok ajanlı AI sistemlerini nasıl izler ve hata ayıklarsınız?
- AI ajanları için güvenilirliği hangi üretim desenleri sağlar?

---

### Bölüm 6: Ön Dağıtım Doğrulama & Planlama (Hafta 8)
**Süre**: 1 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- Kapsamlı kapasite planlaması ve kaynak doğrulaması yapın
- Maliyet etkinliği için optimal Azure SKU'larını seçin
- Otomatik ön koşul kontrolleri ve doğrulamayı uygulayın
- Maliyet optimizasyon stratejileriyle dağıtımları planlayın

#### Ustalaşılması Gereken Temel Kavramlar
- Azure kaynak kota ve kapasite sınırlamaları
- SKU seçim kriterleri ve maliyet optimizasyonu
- Otomatik doğrulama betikleri ve testler
- Dağıtım planlama ve risk değerlendirmesi

#### Pratik Alıştırmalar
1. **Kapasite Analizi**: Uygulamalarınız için kaynak gereksinimlerini analiz edin
2. **SKU Optimizasyonu**: Maliyet-etkin servis katmanlarını karşılaştırıp seçin
3. **Doğrulama Otomasyonu**: Ön dağıtım kontrol betiklerini uygulayın
4. **Maliyet Planlama**: Dağıtım maliyet tahminleri ve bütçeler oluşturun

#### Değerlendirme Soruları
- Dağıtımdan önce Azure kapasitesini nasıl doğrularsınız?
- SKU seçim kararlarını hangi faktörler etkiler?
- Ön dağıtım doğrulamayı nasıl otomatikleştirirsiniz?
- Dağıtım maliyetlerini optimize etmek için hangi stratejiler yardımcı olur?

---

### Bölüm 7: Sorun Giderme & Hata Ayıklama (Hafta 9)
**Süre**: 1-1.5 saat | **Zorluk**: ⭐⭐

#### Öğrenme Hedefleri
- AZD dağıtımları için sistematik hata ayıklama yaklaşımları geliştirin
- Yaygın dağıtım ve yapılandırma sorunlarını çözün
- AI'ya özgü sorunları ve performans problemlerini hata ayıklayın
- Proaktif sorun tespiti için izleme ve uyarı mekanizmaları uygulayın

#### Ustalaşılması Gereken Temel Kavramlar
- Tanı teknikleri ve kayıt (logging) stratejileri
- Yaygın hata desenleri ve çözümleri
- Performans izleme ve optimizasyon
- Olay müdahale ve kurtarma prosedürleri

#### Pratik Alıştırmalar
1. **Tanı Becerileri**: Bilerek bozulmuş dağıtımlarla pratik yapın
2. **Günlük Analizi**: Azure Monitor ve Application Insights'ı etkin kullanın
3. **Performans İyileştirme**: Yavaş çalışan uygulamaları optimize edin
4. **Kurtarma Prosedürleri**: Yedekleme ve felaket kurtarma uygulayın

#### Değerlendirme Soruları
- En yaygın AZD dağıtım hataları nelerdir?
- Kimlik doğrulama ve izin sorunlarını nasıl hata ayıklarsınız?
- Üretim sorunlarını önlemeye yardımcı olacak hangi izleme stratejileri vardır?
- Azure'da uygulama performansını nasıl optimize edersiniz?

---

### Bölüm 8: Üretim & Kurumsal Desenler (Hafta 10-11)
**Süre**: 2-3 saat | **Zorluk**: ⭐⭐⭐⭐

#### Öğrenme Hedefleri
- Kurum düzeyinde dağıtım stratejilerini uygulayın
- Güvenlik desenleri ve uyumluluk çerçeveleri tasarlayın
- İzleme, yönetişim ve maliyet yönetimini oluşturun
- AZD entegrasyonu ile ölçeklenebilir CI/CD boru hatları oluşturun
- Üretim için container app dağıtımları için en iyi uygulamaları uygulayın (güvenlik, izleme, maliyet, CI/CD)

#### Ustalaşılması Gereken Temel Kavramlar
- Kurumsal güvenlik ve uyumluluk gereksinimleri
- Yönetişim çerçeveleri ve politika uygulamaları
- Gelişmiş izleme ve maliyet yönetimi
- CI/CD entegrasyonu ve otomatik dağıtım boru hatları
- Container iş yükleri için blue-green ve canary dağıtım stratejileri

#### Pratik Alıştırmalar
1. **Kurum Güvenliği**: Kapsamlı güvenlik desenleri uygulayın
2. **Yönetişim Çerçevesi**: Azure Policy ve kaynak yönetimini kurun
3. **Gelişmiş İzleme**: Panolar ve otomatik uyarılar oluşturun
4. **CI/CD Entegrasyonu**: Otomatik dağıtım boru hatları oluşturun
5. **Üretim Container Uygulamaları**: [Mikroservis Mimarisi](../../../examples/container-app/microservices) örneğine güvenlik, izleme ve maliyet optimizasyonu uygulayın

#### Değerlendirme Soruları
- AZD dağıtımlarında kurumsal güvenliği nasıl uygularsınız?
- Hangi yönetişim desenleri uyumluluk ve maliyet kontrolünü sağlar?
- Üretim sistemleri için ölçeklenebilir izlemeyi nasıl tasarlarsınız?
- AZD iş akışlarıyla en iyi çalışan CI/CD desenleri hangileridir?

#### Öğrenme Hedefleri
- Azure Developer CLI temellerini ve çekirdek kavramlarını anlayın
- Geliştirme ortamınızda azd'yi başarıyla yükleyip yapılandırın
- Mevcut bir şablonu kullanarak ilk dağıtımınızı tamamlayın
- azd proje yapısını gezin ve temel bileşenleri anlayın

#### Ustalaşılması Gereken Temel Kavramlar
- Şablonlar, ortamlar ve servisler
- azure.yaml yapılandırma yapısı
- Temel azd komutları (init, up, down, deploy)
- Altyapı kodu (Infrastructure as Code) ilkeleri
- Azure kimlik doğrulama ve yetkilendirmesi

#### Pratik Alıştırmalar

**Alıştırma 1.1: Kurulum ve Yapılandırma**
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

#### Öz-Değerlendirme Soruları
1. azd mimarisinin üç temel kavramı nelerdir?
2. azure.yaml dosyasının amacı nedir?
3. Ortamlar farklı dağıtım hedeflerini yönetmeye nasıl yardımcı olur?
4. azd ile hangi kimlik doğrulama yöntemleri kullanılabilir?
5. İlk kez `azd up` çalıştırdığınızda ne olur?

---

## İlerleme Takibi ve Değerlendirme Çerçevesi
```bash
# Birden çok ortam oluşturun ve yapılandırın:
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
# Güvenlik için en iyi uygulamaları uygulayın:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Öz-Değerlendirme Soruları
1. azd ortam değişkeni önceliğini nasıl ele alır?
2. Dağıtım hook'ları nedir ve ne zaman kullanılmalıdır?
3. Farklı ortamlar için farklı SKU'ları nasıl yapılandırırsınız?
4. Farklı kimlik doğrulama yöntemlerinin güvenlik sonuçları nelerdir?
5. Gizli ve hassas yapılandırma verilerini nasıl yönetirsiniz?

### Modül 3: Dağıtım ve Sağlama (Hafta 4)

#### Öğrenme Hedefleri
- Dağıtım iş akışlarında ve en iyi uygulamalarda ustalaşın
- Bicep şablonlarıyla Altyapı Kod Olarak (IaC) anlayışını kazanın
- Karmaşık çok hizmetli mimarileri uygulayın
- Dağıtım performansını ve güvenilirliğini optimize edin

#### Ustalaşılması Gereken Temel Kavramlar
- Bicep şablon yapısı ve modüller
- Kaynak bağımlılıkları ve sıralama
- Dağıtım stratejileri (blue-green, rolling updates)
- Çok bölge dağıtımları
- Veritabanı göçleri ve veri yönetimi

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
# Bir mikroservis mimarisi dağıtın:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Alıştırma 3.3: Veritabanı Entegrasyonu**
```bash
# Veritabanı dağıtım desenlerini uygula:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Öz-Değerlendirme Soruları
1. Bicep'i ARM şablonlarına göre kullanmanın avantajları nelerdir?
2. azd dağıtımlarında veritabanı göçlerini nasıl ele alırsınız?
3. Kesintisiz dağıtımlar için hangi stratejiler vardır?
4. Servisler arasındaki bağımlılıkları nasıl yönetirsiniz?
5. Çok bölge dağıtımları için nelere dikkat edilmelidir?

### Modül 4: Ön Dağıtım Doğrulama (Hafta 5)
- Dağıtımdan önce kapsamlı ön kontrolleri uygulayın
- Kapasite planlaması ve kaynak doğrulamasında uzmanlaşın
- SKU seçimi ve maliyet optimizasyonunu anlayın
- Otomatik doğrulama boru hatları oluşturun

#### Ustalaşılacak Temel Kavramlar
- Azure kaynak kota ve limitleri
- SKU seçim kriterleri ve maliyet etkileri
- Otomatik doğrulama betikleri ve araçları
- Kapasite planlama metodolojileri
- Performans testi ve optimizasyon

#### Uygulama Alıştırmaları

**Alıştırma 4.1: Kapasite Planlaması**
```bash
# Kapasite doğrulamasını uygulayın:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Alıştırma 4.2: Ön Uçuş Doğrulaması**
```powershell
# Kapsamlı doğrulama hattı oluşturun:
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

#### Öz Değerlendirme Soruları
1. SKU seçim kararlarını hangi faktörler etkilemelidir?
2. Dağıtımdan önce Azure kaynak kullanılabilirliğini nasıl doğrularsınız?
3. Bir ön-ucuş (pre-flight) kontrol sisteminin temel bileşenleri nelerdir?
4. Dağıtım maliyetlerini nasıl tahmin eder ve kontrol edersiniz?
5. Kapasite planlaması için hangi izleme bilgilerinin olması gerekir?

### Modül 5: Sorun Giderme ve Hata Ayıklama (Hafta 6)

#### Öğrenme Hedefleri
- Sistematik sorun giderme metodolojilerinde ustalaşın
- Karmaşık dağıtım sorunlarını hata ayıklamada uzmanlaşın
- Kapsamlı izleme ve uyarı mekanizmaları uygulayın
- Olay müdahale ve kurtarma prosedürleri oluşturun

#### Ustalaşılacak Temel Kavramlar
- Yaygın dağıtım hatası kalıpları
- Günlük analiz ve korelasyon teknikleri
- Performans izleme ve optimizasyon
- Güvenlik olayı tespiti ve müdahale
- Felaket kurtarma ve iş sürekliliği

#### Uygulama Alıştırmaları

**Alıştırma 5.1: Sorun Giderme Senaryoları**
```bash
# Yaygın sorunları çözme pratiği:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Alıştırma 5.2: İzleme Uygulaması**
```bash
# Kapsamlı izlemeyi kurun:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Alıştırma 5.3: Olay Müdahalesi**
```bash
# Olay müdahalesi prosedürleri oluşturun:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Öz Değerlendirme Soruları
1. azd dağıtımları için sistematik sorun giderme yaklaşımı nedir?
2. Birden çok hizmet ve kaynak arasında günlükleri nasıl korelâte edersiniz?
3. Erken problem tespiti için hangi izleme metrikleri en kritik olanlardır?
4. Etkili felaket kurtarma prosedürlerini nasıl uygularsınız?
5. Bir olay müdahale planının temel bileşenleri nelerdir?

### Modül 6: İleri Konular ve En İyi Uygulamalar (Hafta 7-8)

#### Öğrenme Hedefleri
- Kurumsal düzeyde dağıtım desenleri uygulayın
- CI/CD entegrasyonu ve otomasyonunda ustalaşın
- Özel şablonlar geliştirin ve topluluğa katkıda bulunun
- İleri güvenlik ve uyumluluk gereksinimlerini anlayın

#### Ustalaşılacak Temel Kavramlar
- CI/CD boru hattı entegrasyon desenleri
- Özel şablon geliştirme ve dağıtımı
- Kurumsal yönetişim ve uyumluluk
- İleri ağ ve güvenlik yapılandırmaları
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
# Özel şablonlar oluşturun ve yayınlayın:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Alıştırma 6.3: Kurumsal Uygulama**
```bash
# Kurumsal sınıf özellikleri uygulayın:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Öz Değerlendirme Soruları
1. azd'yi mevcut CI/CD iş akışlarına nasıl entegre edersiniz?
2. Özel şablon geliştirme için temel hususlar nelerdir?
3. azd dağıtımlarında yönetişim ve uyumluluğu nasıl uygularsınız?
4. Kurumsal ölçekli dağıtımlar için en iyi uygulamalar nelerdir?
5. azd topluluğuna etkili şekilde nasıl katkıda bulunursunuz?

## Pratik Projeler

### Proje 1: Kişisel Portföy Web Sitesi
**Zorluk Seviyesi**: Başlangıç  
**Süre**: 1-2 hafta

Aşağıdakileri kullanarak kişisel portföy web sitesi oluşturun ve dağıtın:
- Azure Storage üzerinde statik web sitesi barındırma
- Özel alan adı yapılandırması
- Küresel performans için CDN entegrasyonu
- Otomatik dağıtım boru hattı

**Teslimatlar**:
- Azure üzerinde çalışan web sitesi
- Portföy dağıtımları için özel azd şablonu
- Dağıtım sürecinin dokümantasyonu
- Maliyet analizi ve optimizasyon önerileri

### Proje 2: Görev Yönetimi Uygulaması
**Zorluk Seviyesi**: Orta  
**Süre**: 2-3 hafta

Tam yığın bir görev yönetimi uygulaması oluşturun:
- App Service'e dağıtılan React ön yüzü
- Kimlik doğrulamalı Node.js API arka ucu
- Göçler ile PostgreSQL veritabanı
- Application Insights ile izleme

**Teslimatlar**:
- Kullanıcı kimlik doğrulamalı eksiksiz uygulama
- Veritabanı şeması ve göç betikleri
- İzleme panoları ve uyarı kuralları
- Çoklu ortam dağıtım yapılandırması

### Proje 3: Mikroservis E-ticaret Platformu
**Zorluk Seviyesi**: İleri  
**Süre**: 4-6 hafta

Mikroservis tabanlı bir e-ticaret platformu tasarlayın ve uygulayın:
- Birden çok API servisi (katalog, siparişler, ödemeler, kullanıcılar)
- Service Bus ile mesaj kuyruğu entegrasyonu
- Performans optimizasyonu için Redis önbelleği
- Kapsamlı günlükleme ve izleme

**Referans Örneği**: Üretime hazır şablon ve dağıtım kılavuzu için bkz. [Microservices Architecture](../../../examples/container-app/microservices)

**Teslimatlar**:
- Tam mikroservis mimarisi
- Hizmetler arası iletişim desenleri
- Performans testi ve optimizasyonu
- Üretime hazır güvenlik uygulaması

## Değerlendirme ve Sertifikasyon

### Bilgi Kontrolleri

Her modülün ardından bu değerlendirmeleri tamamlayın:

**Modül 1 Değerlendirmesi**: Temel kavramlar ve kurulum
- Temel kavramlar hakkında çoktan seçmeli sorular
- Pratik kurulum ve yapılandırma görevleri
- Basit bir dağıtım alıştırması

**Modül 2 Değerlendirmesi**: Yapılandırma ve ortamlar
- Ortam yönetimi senaryoları
- Yapılandırma sorun giderme alıştırmaları
- Güvenlik yapılandırma uygulamaları

**Modül 3 Değerlendirmesi**: Dağıtım ve sağlama
- Altyapı tasarım zorlukları
- Çok hizmetli dağıtım senaryoları
- Performans optimizasyon alıştırmaları

**Modül 4 Değerlendirmesi**: Ön-dağıtım doğrulaması
- Kapasite planlama vaka çalışmaları
- Maliyet optimizasyonu senaryoları
- Doğrulama boru hattı uygulaması

**Modül 5 Değerlendirmesi**: Sorun giderme ve hata ayıklama
- Problem tanı alıştırmaları
- İzleme uygulama görevleri
- Olay müdahale simülasyonları

**Modül 6 Değerlendirmesi**: İleri konular
- CI/CD boru hattı tasarımı
- Özel şablon geliştirme
- Kurumsal mimari senaryoları

### Final Bitirme Projesi

Tüm kavramlarda ustalığınızı gösteren eksiksiz bir çözüm tasarlayın ve uygulayın:

**Gereksinimler**:
- Çok katmanlı uygulama mimarisi
- Birden çok dağıtım ortamı
- Kapsamlı izleme ve uyarı
- Güvenlik ve uyumluluk uygulaması
- Maliyet optimizasyonu ve performans ayarlamaları
- Tam dokümantasyon ve çalışma el kitapları

**Değerlendirme Kriterleri**:
- Teknik uygulama kalitesi
- Dokümantasyonun tamlığı
- Güvenlik ve en iyi uygulamalara uyum
- Performans ve maliyet optimizasyonu
- Sorun giderme ve izleme etkinliği

## Çalışma Kaynakları ve Referanslar

### Resmi Dokümantasyon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Topluluk Kaynakları
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Uygulama Ortamları
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ek Araçlar
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Çalışma Takvimi Önerileri

### Tam Zamanlı Çalışma (8 hafta)
- **Hafta 1-2**: Modül 1-2 (Başlangıç, Yapılandırma)
- **Hafta 3-4**: Modül 3-4 (Dağıtım, Ön-dağıtım)
- **Hafta 5-6**: Modül 5-6 (Sorun Giderme, İleri Konular)
- **Hafta 7-8**: Pratik Projeler ve Final Değerlendirmesi

### Yarı Zamanlı Çalışma (16 hafta)
- **Hafta 1-4**: Modül 1 (Başlangıç)
- **Hafta 5-7**: Modül 2 (Yapılandırma ve Ortamlar)
- **Hafta 8-10**: Modül 3 (Dağıtım ve Sağlama)
- **Hafta 11-12**: Modül 4 (Ön-dağıtım Doğrulaması)
- **Hafta 13-14**: Modül 5 (Sorun Giderme ve Hata Ayıklama)
- **Hafta 15-16**: Modül 6 (İleri Konular ve Değerlendirme)

---

## İlerleme Takibi ve Değerlendirme Çerçevesi

### Bölüm Tamamlama Kontrol Listesi

Her bölümdeki ilerlemenizi bu ölçülebilir çıktılarla takip edin:

#### 📚 Bölüm 1: Temel & Hızlı Başlangıç
- [ ] **Kurulum Tamamlandı**: AZD platformunuza kuruldu ve doğrulandı
- [ ] **İlk Dağıtım**: todo-nodejs-mongo şablonunu başarıyla dağıttınız
- [ ] **Ortam Kurulumu**: İlk ortam değişkenlerini yapılandırdınız
- [ ] **Kaynak Gezinme**: Azure Portal'da dağıtılan kaynakları incelediniz
- [ ] **Komut Ustalığı**: Temel AZD komutlarına hakim oldunuz

#### 🤖 Bölüm 2: Yapay Zeka Odaklı Geliştirme
- [ ] **AI Şablon Dağıtımı**: azure-search-openai-demo'yu başarıyla dağıttınız
- [ ] **RAG Uygulaması**: Belge indeksleme ve getirme yapılandırdınız
- [ ] **Model Yapılandırması**: Farklı amaçlar için birden fazla AI modeli kurdunuz
- [ ] **AI İzleme**: AI iş yükleri için Application Insights uyguladınız
- [ ] **Performans Optimizasyonu**: AI uygulama performansını ayarladınız

#### ⚙️ Bölüm 3: Yapılandırma & Kimlik Doğrulama
- [ ] **Çoklu Ortam Kurulumu**: dev, staging ve prod ortamlarını yapılandırdınız
- [ ] **Güvenlik Uygulaması**: Yönetilen kimlik ile kimlik doğrulamayı kurdunuz
- [ ] **Gizli Yönetimi**: Hassas veriler için Azure Key Vault'u entegre ettiniz
- [ ] **Parametre Yönetimi**: Ortama özel yapılandırmalar oluşturdunuz
- [ ] **Kimlik Doğrulama Ustalığı**: Güvenli erişim desenlerini uyguladınız

#### 🏗️ Bölüm 4: Altyapı Kod Olarak & Dağıtım
- [ ] **Özel Şablon Oluşturma**: Çok hizmetli bir uygulama şablonu oluşturdunuz
- [ ] **Bicep Ustalığı**: Modüler, yeniden kullanılabilir altyapı bileşenleri yarattınız
- [ ] **Dağıtım Otomasyonu**: Ön/son dağıtım kancalarını uyguladınız
- [ ] **Mimari Tasarım**: Karmaşık mikroservis mimarisi dağıttınız
- [ ] **Şablon Optimizasyonu**: Şablonları performans ve maliyet için optimize ettiniz

#### 🎯 Bölüm 5: Çok Ajanlı AI Çözümleri
- [ ] **Perakende Çözümü Dağıtımı**: Tam çok ajanlı perakende senaryosunu dağıttınız
- [ ] **Ajan Özelleştirme**: Müşteri ve Envanter ajan davranışlarını değiştirdiniz
- [ ] **Mimari Ölçeklendirme**: Yük dengeleme ve otomatik ölçeklendirme uyguladınız
- [ ] **Üretim İzleme**: Kapsamlı izleme ve uyarı kurdunuz
- [ ] **Performans Ayarı**: Çok ajanlı sistem performansını optimize ettiniz

#### 🔍 Bölüm 6: Ön-Dağıtım Doğrulama & Planlama
- [ ] **Kapasite Analizi**: Uygulamalar için kaynak gereksinimlerini analiz ettiniz
- [ ] **SKU Optimizasyonu**: Maliyet-etkin hizmet katmanlarını seçtiniz
- [ ] **Doğrulama Otomasyonu**: Ön-dağıtım kontrol betikleri uyguladınız
- [ ] **Maliyet Planlaması**: Dağıtım maliyet tahminleri ve bütçeler oluşturdunuz
- [ ] **Risk Değerlendirmesi**: Dağıtım risklerini belirlediniz ve hafiflettiniz

#### 🚨 Bölüm 7: Sorun Giderme & Hata Ayıklama
- [ ] **Tanısal Beceriler**: Kasten bozulmuş dağıtımları başarıyla hata ayıkladınız
- [ ] **Günlük Analizi**: Azure Monitor ve Application Insights'ı etkili kullandınız
- [ ] **Performans Ayarı**: Yavaş çalışan uygulamaları optimize ettiniz
- [ ] **Kurtarma Prosedürleri**: Yedekleme ve felaket kurtarma uyguladınız
- [ ] **İzleme Kurulumu**: Proaktif izleme ve uyarı mekanizmaları oluşturdunuz

#### 🏢 Bölüm 8: Üretim & Kurumsal Desenler
- [ ] **Kurumsal Güvenlik**: Kapsamlı güvenlik desenleri uyguladınız
- [ ] **Yönetişim Çerçevesi**: Azure Policy ve kaynak yönetimini kurdunuz
- [ ] **İleri İzleme**: Panolar ve otomatik uyarılar oluşturdunuz
- [ ] **CI/CD Entegrasyonu**: Otomatik dağıtım boru hatları kurdunuz
- [ ] **Uyumluluk Uygulaması**: Kurumsal uyumluluk gereksinimlerini karşıladınız

### Öğrenme Zaman Çizelgesi ve Kilometre Taşları

#### Hafta 1-2: Temel Oluşturma
- **Kilometre Taşı**: AZD kullanarak ilk AI uygulamasını dağıtın
- **Doğrulama**: Çalışan uygulama halka açık URL üzerinden erişilebilir
- **Beceriler**: Temel AZD iş akışları ve AI servis entegrasyonu

#### Hafta 3-4: Yapılandırma Ustalığı
- **Kilometre Taşı**: Çok ortamlı dağıtım ve güvenli kimlik doğrulama
- **Doğrulama**: Aynı uygulama dev/staging/prod ortamlarına dağıtıldı
- **Beceriler**: Ortam yönetimi ve güvenlik uygulaması

#### Hafta 5-6: Altyapı Uzmanlığı
- **Kilometre Taşı**: Karmaşık çok hizmetli uygulama için özel şablon
- **Doğrulama**: Yeniden kullanılabilir şablon başka bir ekip üyesi tarafından dağıtıldı
- **Beceriler**: Bicep ustalığı ve altyapı otomasyonu

#### Hafta 7-8: İleri AI Uygulamaları
- **Kilometre Taşı**: Üretime hazır çok ajanlı AI çözümü
- **Doğrulama**: Sistem gerçek dünya yükünü izleme ile karşılayabiliyor
- **Beceriler**: Çok ajanlı orkestrasyon ve performans optimizasyonu

#### Hafta 9-10: Üretim Hazırlığı
- **Kilometre Taşı**: Tam uyumluluk ile kurumsal düzeyde dağıtım
- **Doğrulama**: Güvenlik incelemesini ve maliyet optimizasyonu denetimini geçti
- **Beceriler**: Yönetişim, izleme ve CI/CD entegrasyonu

### Değerlendirme ve Sertifikasyon

#### Bilgi Doğrulama Yöntemleri
1. **Pratik Dağıtımlar**: Her bölüm için çalışan uygulamalar
2. **Kod İncelemeleri**: Şablon ve yapılandırma kalite değerlendirmesi
3. **Problem Çözme**: Sorun giderme senaryoları ve çözümleri
4. **Akrana Öğretme**: Kavramları diğer öğrenenlere açıklayın
5. **Topluluk Katkısı**: Şablonlar veya iyileştirmeler paylaşın

#### Mesleki Gelişim Çıktıları
- **Portföy Projeleri**: 8 üretime hazır dağıtım
- **Teknik Yetenekler**: Endüstri-standardı AZD ve AI dağıtım uzmanlığı
- **Problem Çözme Yetkinlikleri**: Bağımsız sorun giderme ve optimizasyon
- **Topluluk Tanınması**: Azure geliştirici topluluğunda aktif katılım
- **Kariyer İlerlemesi**: Bulut ve AI rollerine doğrudan uygulanabilir beceriler

#### Başarı Ölçütleri
- **Dağıtım Başarı Oranı**: >95% başarılı dağıtımlar
- **Sorun Giderme Süresi**: Yaygın sorunlar için <30 dakika
- **Performans Optimizasyonu**: Maliyet ve performansta kanıtlanabilir iyileşmeler
- **Güvenlik Uyumluluğu**: Tüm dağıtımlar kurumsal güvenlik standartlarına uygundur
- **Bilgi Aktarımı**: Diğer geliştiricilere mentorluk yapabilme

### Sürekli Öğrenme ve Topluluk Katılımı

#### Güncel Kalın
- **Azure Güncellemeleri**: Azure Developer CLI sürüm notlarını takip edin
- **Topluluk Etkinlikleri**: Azure ve AI geliştirici etkinliklerine katılın
- **Dokümantasyon**: Topluluk dokümantasyonuna ve örneklere katkıda bulunun
- **Geri Bildirim Döngüsü**: Ders içeriği ve Azure hizmetleri hakkında geri bildirim sağlayın

#### Kariyer Gelişimi
- **Profesyonel Ağ**: Azure ve AI uzmanlarıyla bağlantı kurun
- **Konuşma Fırsatları**: Öğrendiklerinizi konferanslarda veya buluşmalarda sunun
- **Açık Kaynak Katkısı**: AZD şablonlarına ve araçlarına katkıda bulunun
- **Mentorluk**: Diğer geliştiricilere AZD öğrenim yolculuklarında rehberlik edin

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../README.md)
- **📖 Öğrenmeye Başla**: [Bölüm 1: Temel & Hızlı Başlangıç](../README.md#-chapter-1-foundation--quick-start)
- **🎯 İlerleme Takibi**: Kapsamlı 8-bölümlük öğrenme sistemi aracılığıyla ilerlemenizi takip edin
- **🤝 Topluluk**: Destek ve tartışma için [Azure Discord](https://discord.gg/microsoft-azure)

**Çalışma İlerleme Takibi**: Bu yapılandırılmış rehberi, ölçülebilir sonuçlar ve mesleki gelişim faydalarıyla birlikte kademeli, uygulamalı öğrenme yoluyla Azure Developer CLI'de uzmanlaşmak için kullanın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Sorumluluk Reddi**:
Bu belge, yapay zeka çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kaynak dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlama için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->