# Sıkça Sorulan Sorular (SSS)

**Bölümlere Göre Yardım Alın**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../README.md)
- **🚆 Kurulum Sorunları**: [Bölüm 1: Kurulum ve Ayarlar](../docs/getting-started/installation.md)
- **🤖 Yapay Zeka Soruları**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Sorun Giderme**: [Bölüm 7: Sorun Giderme ve Hata Ayıklama](../docs/troubleshooting/common-issues.md)

## Giriş

Bu kapsamlı SSS, Azure Developer CLI (azd) ve Azure dağıtımlarıyla ilgili en yaygın soruların yanıtlarını sağlar. Yaygın sorunlara hızlı çözümler bulun, en iyi uygulamaları anlayın ve azd kavramları ile iş akışları hakkında netlik kazanın.

## Öğrenme Hedefleri

Bu SSS'yi gözden geçirerek:
- Azure Developer CLI ile ilgili sık sorulan sorulara ve sorunlara hızlı yanıtlar bulacaksınız
- Pratik Soru-Cevap formatı aracılığıyla temel kavramları ve terminolojiyi anlayacaksınız
- Sık görülen problemler ve hata senaryoları için sorun giderme çözümlerine erişeceksiniz
- Optimizasyon hakkında sık sorulan sorular aracılığıyla en iyi uygulamaları öğreneceksiniz
- Uzman düzeyindeki sorularla gelişmiş özellikleri ve yetenekleri keşfedeceksiniz
- Maliyet, güvenlik ve dağıtım stratejisi rehberliğine hızlı erişim sağlayacaksınız

## Öğrenme Çıktıları

Bu SSS'ye düzenli başvurarak şunları yapabileceksiniz:
- Sağlanan çözümleri kullanarak yaygın Azure Developer CLI sorunlarını bağımsız olarak çözmek
- Dağıtım stratejileri ve yapılandırmalar hakkında bilinçli kararlar almak
- azd ile diğer Azure araçları ve hizmetleri arasındaki ilişkiyi anlamak
- Topluluk deneyimi ve uzman önerilerine dayalı en iyi uygulamaları uygulamak
- Kimlik doğrulama, dağıtım ve yapılandırma sorunlarını etkili şekilde gidermek
- SSS içgörüleri ve önerileri kullanarak maliyetleri ve performansı optimize etmek

## İçindekiler

- [Başlarken](../../../resources)
- [Kimlik Doğrulama ve Erişim](../../../resources)
- [Şablonlar ve Projeler](../../../resources)
- [Dağıtım ve Altyapı](../../../resources)
- [Yapılandırma ve Ortamlar](../../../resources)
- [Sorun Giderme](../../../resources)
- [Maliyet ve Faturalama](../../../resources)
- [En İyi Uygulamalar](../../../resources)
- [Gelişmiş Konular](../../../resources)

---

## Başlarken

### S: Azure Developer CLI (azd) nedir?
**C**: Azure Developer CLI (azd), uygulamanızı yerel geliştirme ortamından Azure'a taşımak için geçen süreyi hızlandıran, geliştirici odaklı bir komut satırı aracıdır. Şablonlar aracılığıyla en iyi uygulamaları sağlar ve tüm dağıtım yaşam döngüsünde yardımcı olur.

### S: azd, Azure CLI'den nasıl farklıdır?
**C**: 
- **Azure CLI**: Azure kaynaklarını yönetmek için genel amaçlı bir araç
- **azd**: Uygulama dağıtım iş akışlarına odaklanan geliştirici aracı
- azd, dahili olarak Azure CLI'yi kullanır ancak yaygın geliştirme senaryoları için daha üst düzey soyutlamalar sağlar
- azd şablonları, ortam yönetimi ve dağıtım otomasyonu içerir

### S: azd kullanmak için Azure CLI kurulu olması gerekiyor mu?
**C**: Evet, azd kimlik doğrulama ve bazı işlemler için Azure CLI gerektirir. Önce Azure CLI'yi, ardından azd'yi kurun.

### S: azd hangi programlama dillerini destekliyor?
**C**: azd dil bağımsızdır. Şunlarla çalışır:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statik web siteleri
- Konteynerlenmiş uygulamalar

### S: azd'yi mevcut projelerle kullanabilir miyim?
**C**: Evet! Aşağıdakilerden birini yapabilirsiniz:
1. Mevcut projelere azd yapılandırması eklemek için `azd init` kullanın
2. Mevcut projeleri azd şablon yapısına uyarlayın
3. Mevcut mimarinize dayalı özel şablonlar oluşturun

---

## Kimlik Doğrulama & Erişim

### S: azd ile Azure'a nasıl kimlik doğrulaması yaparım?
**C**: `azd auth login` komutunu kullanın; bu komut Azure kimlik doğrulaması için bir tarayıcı penceresi açacaktır. CI/CD senaryoları için hizmet ilkeleri (service principals) veya yönetilen kimlikler (managed identities) kullanın.

### S: azd'yi birden çok Azure aboneliğiyle kullanabilir miyim?
**C**: Evet. Her ortam için hangi aboneliğin kullanılacağını belirtmek için `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` kullanın.

### S: azd ile dağıtım yapmak için hangi izinlere ihtiyacım var?
**C**: Genellikle şunlara ihtiyacınız olur:
- Kaynak grubu veya abonelik üzerinde **Contributor** rolü
- Rol atamaları gerektiren kaynakları dağıtırken **User Access Administrator**
- Belirli izinler, şablona ve dağıtılan kaynaklara göre değişir

### S: azd'yi CI/CD boru hatlarında kullanabilir miyim?
**C**: Kesinlikle! azd, CI/CD entegrasyonu için tasarlanmıştır. Kimlik doğrulama için hizmet ilkeleri kullanın ve yapılandırma için ortam değişkenleri ayarlayın.

### S: GitHub Actions içinde kimlik doğrulamayı nasıl ele alırım?
**C**: Hizmet ilkesi kimlik bilgileri ile Azure Login action'ını kullanın:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Şablonlar & Projeler

### S: azd şablonlarını nerede bulabilirim?
**C**: 
- Resmi şablonlar: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Topluluk şablonları: GitHub'da "azd-template" araması
- Kullanılabilir şablonları görmek için `azd template list` kullanın

### S: Özel bir şablon nasıl oluştururum?
**C**: 
1. Mevcut bir şablon yapısı ile başlayın
2. `azure.yaml`, altyapı dosyaları ve uygulama kodunu değiştirin
3. `azd up` ile kapsamlı şekilde test edin
4. Uygun etiketlerle GitHub'da yayınlayın

### S: Şablonsuz azd kullanabilir miyim?
**C**: Evet, mevcut bir projede gerekli yapılandırma dosyalarını oluşturmak için `azd init` kullanın. `azure.yaml` ve altyapı dosyalarını manuel olarak yapılandırmanız gerekecek.

### S: Resmi ve topluluk şablonları arasındaki fark nedir?
**C**: 
- **Resmi şablonlar**: Microsoft tarafından bakımı yapılır, düzenli güncellenir, kapsamlı dokümantasyona sahiptir
- **Topluluk şablonları**: Geliştiriciler tarafından oluşturulur, özel kullanım durumlarına yönelik olabilir, kalite ve bakım farklılıkları gösterebilir

### S: Projemdeki bir şablonu nasıl güncellerim?
**C**: Şablonlar otomatik olarak güncellenmez. Şunları yapabilirsiniz:
1. Kaynak şablondan değişiklikleri manuel olarak karşılaştırıp birleştirin
2. Güncellenmiş şablonu kullanarak `azd init` ile baştan başlayın
3. Güncellenmiş şablonlardan belirli iyileştirmeleri seçip uygulayın

---

## Dağıtım & Altyapı

### S: azd hangi Azure hizmetlerini dağıtabilir?
**C**: azd, Bicep/ARM şablonları aracılığıyla herhangi bir Azure hizmetini dağıtabilir, bunlar arasında:
- App Services, Container Apps, Functions
- Veritabanları (SQL, PostgreSQL, Cosmos DB)
- Depolama, Key Vault, Application Insights
- Ağ, güvenlik ve izleme kaynakları

### S: Birden çok bölgeye dağıtım yapabilir miyim?
**C**: Evet, Bicep şablonlarınızda birden çok bölge yapılandırın ve her ortam için konum parametresini uygun şekilde ayarlayın.

### S: Veritabanı şema değişikliklerini (migrations) nasıl yönetirim?
**C**: `azure.yaml` içindeki dağıtım kancalarını (deployment hooks) kullanın:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Sadece altyapıyı, uygulamaları dağıtmadan dağıtabilir miyim?
**C**: Evet, şablonlarınızda tanımlı altyapı bileşenlerini yalnızca dağıtmak için `azd provision` kullanın.

### S: Mevcut Azure kaynaklarına nasıl dağıtım yaparım?
**C**: Bu karmaşıktır ve doğrudan desteklenmez. Şunları yapabilirsiniz:
1. Mevcut kaynakları Bicep şablonlarınıza dahil edin
2. Şablonlarda mevcut kaynak referansları kullanın
3. Kaynakları koşullu oluşturacak veya referans verecek şekilde şablonları değiştirin

### S: Terraform yerine Bicep kullanmak zorunda mıyım?
**C**: Şu anda azd öncelikle Bicep/ARM şablonlarını destekler. Terraform desteği resmi olarak mevcut değildir, ancak topluluk çözümleri olabilir.

---

## Yapılandırma & Ortamlar

### S: Farklı ortamları (dev, staging, prod) nasıl yönetirim?
**C**: `azd env new <environment-name>` ile ayrı ortamlar oluşturun ve her biri için farklı ayarları yapılandırın:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Ortam yapılandırmaları nerede saklanır?
**C**: Proje dizininizdeki `.azure` klasöründe. Her ortamın kendi yapılandırma dosyaları olan bir klasörü vardır.

### S: Ortama özgü yapılandırmayı nasıl ayarlarım?
**C**: Ortam değişkenlerini yapılandırmak için `azd env set` kullanın:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Ortam yapılandırmalarını ekip üyeleriyle paylaşabilir miyim?
**C**: `.azure` klasörü hassas bilgiler içerir ve sürüm kontrolüne eklenmemelidir. Bunun yerine:
1. Gerekli ortam değişkenlerini belgeleyin
2. Ortamları kurmak için dağıtım betikleri kullanın
3. Hassas yapılandırma için Azure Key Vault kullanın

### S: Şablon varsayılan değerlerini nasıl geçersiz kılabilirim?
**C**: Şablon parametrelerine karşılık gelen ortam değişkenlerini ayarlayın:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Sorun Giderme

### S: Neden `azd up` başarısız oluyor?
**C**: Yaygın nedenler:
1. **Kimlik doğrulama sorunları**: `azd auth login` çalıştırın
2. **Yetersiz izinler**: Azure rol atamalarınızı kontrol edin
3. **Kaynak adlandırma çakışmaları**: AZURE_ENV_NAME değerini değiştirin
4. **Kota/kapasite sorunları**: Bölgesel kullanılabilirliği kontrol edin
5. **Şablon hataları**: Bicep şablonlarını doğrulayın

### S: Dağıtım hatalarını nasıl hata ayıklarım?
**C**: 
1. Ayrıntılı çıktı için `azd deploy --debug` kullanın
2. Azure portalında dağıtım geçmişini kontrol edin
3. Azure portalında Etkinlik Günlüğünü (Activity Log) inceleyin
4. Geçerli ortam durumunu göstermek için `azd show` kullanın

### S: Ortam değişkenlerim neden çalışmıyor?
**C**: Kontrol edin:
1. Değişken adları şablon parametreleriyle tam olarak eşleşiyor mu
2. İçlerinde boşluk varsa değerler uygun şekilde tırnak içine alınmış mı
3. Ortam seçili mi: `azd env select <environment>`
4. Değişkenler doğru ortamda ayarlı mı

### S: Başarısız dağıtımları nasıl temizlerim?
**C**: 
```bash
azd down --force --purge
```
Bu, tüm kaynakları ve ortam yapılandırmasını kaldırır.

### S: Dağıtımdan sonra uygulamam neden erişilebilir değil?
**C**: Kontrol edin:
1. Dağıtımın başarıyla tamamlandığından emin olun
2. Uygulamanın çalıştığını kontrol edin (Azure portalındaki günlükleri inceleyin)
3. Ağ güvenlik grupları trafiğe izin veriyor mu
4. DNS/özel alan adları doğru yapılandırılmış mı

---

## Maliyet & Faturalama

### S: azd dağıtımları ne kadar maliyet çıkarır?
**C**: Maliyetler şunlara bağlıdır:
- Dağıtılan Azure hizmetleri
- Seçilen hizmet katmanları/SKU'lar
- Bölgesel fiyat farkları
- Kullanım modelleri

Tahminler için [Azure Fiyatlandırma Hesaplayıcısı](https://azure.microsoft.com/pricing/calculator/)nı kullanın.

### S: azd dağıtımlarında maliyetleri nasıl kontrol ederim?
**C**: 
1. Geliştirme ortamları için alt seviye SKU'ları kullanın
2. Azure bütçeleri ve uyarıları kurun
3. İhtiyaç olmadığında kaynakları kaldırmak için `azd down` kullanın
4. Uygun bölgeleri seçin (maliyetler konuma göre değişir)
5. Azure Cost Management araçlarını kullanın

### S: azd şablonları için ücretsiz katman seçenekleri var mı?
**C**: Birçok Azure hizmeti ücretsiz katmanlar sunar:
- App Service: Ücretsiz katman mevcut
- Azure Functions: Ayda 1M ücretsiz çalıştırma
- Cosmos DB: 400 RU/s ile ücretsiz katman
- Application Insights: İlk 5GB/ay ücretsiz

Mevcut yerlerde şablonları ücretsiz katmanları kullanacak şekilde yapılandırın.

### S: Dağıtımdan önce maliyeti nasıl tahmin ederim?
**C**: 
1. Şablonun `main.bicep` dosyasını gözden geçirerek hangi kaynakların oluşturulduğunu görün
2. Belirli SKU'larla Azure Fiyatlandırma Hesaplayıcısı'nı kullanın
3. Gerçek maliyetleri izlemek için önce geliştirme ortamına dağıtın
4. Ayrıntılı maliyet analizi için Azure Cost Management'i kullanın

---

## En İyi Uygulamalar

### S: azd proje yapısı için en iyi uygulamalar nelerdir?
**C**: 
1. Uygulama kodunu altyapıdan ayrı tutun
2. `azure.yaml` içinde anlamlı servis adları kullanın
3. Yapı betiklerinde uygun hata yakalama uygulayın
4. Ortama özgü yapılandırma kullanın
5. Kapsamlı dokümantasyon ekleyin

### S: Birden çok servisi azd içinde nasıl organize etmeliyim?
**C**: Önerilen yapıyı kullanın:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### S: `.azure` klasörünü sürüm kontrolüne eklemeli miyim?
**C**: **Hayır!** `.azure` klasörü hassas bilgiler içerir. `.gitignore` dosyanıza ekleyin:
```gitignore
.azure/
```

### S: Gizli bilgileri ve hassas yapılandırmayı nasıl yönetirim?
**C**: 
1. Gizli bilgiler için Azure Key Vault kullanın
2. Uygulama yapılandırmasında Key Vault gizli anahtarlarına referans verin
3. Asla gizli bilgileri sürüm kontrolüne commit etmeyin
4. Hizmetler arası kimlik doğrulama için yönetilen kimlikleri kullanın

### S: azd ile CI/CD için önerilen yaklaşım nedir?
**C**: 
1. Her aşama için ayrı ortamlar kullanın (dev/staging/prod)
2. Dağıtımdan önce otomatik testler uygulayın
3. Kimlik doğrulama için hizmet ilkeleri kullanın
4. Hassas yapılandırmayı pipeline gizli değişkenlerinde saklayın
5. Üretim dağıtımları için onay kapıları (approval gates) uygulayın

---

## Gelişmiş Konular

### S: azd'yi özel işlevsellikle genişletebilir miyim?
**C**: Evet, `azure.yaml` içindeki dağıtım kancaları (deployment hooks) aracılığıyla:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: azd'yi mevcut DevOps süreçlerimle nasıl entegre ederim?
**C**: 
1. Mevcut pipeline betiklerinde azd komutlarını kullanın
2. Takımlar arasında azd şablonlarında standartlaşın
3. Mevcut izleme ve uyarı sistemleri ile entegre edin
4. Pipeline entegrasyonu için azd'nin JSON çıktısını kullanın

### S: azd'yi Azure DevOps ile kullanabilir miyim?
**C**: Evet, azd herhangi bir CI/CD sistemiyle çalışır. azd komutlarını kullanan Azure DevOps pipeline'ları oluşturun.

### S: azd'ye katkıda bulunmak veya topluluk şablonları oluşturmak için nasıl bir yol izlemeliyim?
**C**:
1. **azd aracı**: [Azure/azure-dev](https://github.com/Azure/azure-dev) deposuna katkıda bulunun
2. **Şablonlar**: [template guidelines](https://github.com/Azure-Samples/awesome-azd) yönergelerini izleyerek şablonlar oluşturun
3. **Belgeler**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) deposundaki belgelere katkıda bulunun

### S: azd için yol haritası nedir?
**C**: Planlanan özellikler ve iyileştirmeler için resmi yol haritasına bakın: [official roadmap](https://github.com/Azure/azure-dev/projects)

### S: Diğer dağıtım araçlarından azd'ye nasıl geçiş yaparım?
**C**: 
1. Mevcut dağıtım mimarisini analiz edin
2. Eşdeğer Bicep şablonları oluşturun
3. Mevcut servislerle eşleşecek şekilde `azure.yaml` dosyasını yapılandırın
4. Geliştirme ortamında kapsamlı şekilde test edin
5. Ortamları kademeli olarak taşıyın

---

## Hâlâ Sorularınız mı var?

### **Önce Araştırın**
- [Resmi dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) kontrol edin
- Benzer sorunlar için [GitHub issues](https://github.com/Azure/azure-dev/issues) içinde arama yapın

### **Yardım Alın**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Topluluk desteği
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Teknik sorular
- [Azure Discord](https://discord.gg/azure) - Gerçek zamanlı topluluk sohbeti

### **Sorun Bildirin**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Hata bildirimleri ve özellik istekleri
- İlgili günlükleri, hata mesajlarını ve yeniden üretme adımlarını ekleyin

### **Daha Fazla Bilgi Edinin**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Bu SSS düzenli olarak güncellenir. Son güncelleme: 9 Eylül 2025*

---

**Gezinme**
- **Önceki Ders**: [Sözlük](glossary.md)
- **Sonraki Ders**: [Çalışma Rehberi](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için özen göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal diliyle hazırlanmış metni yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->