<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T20:23:47+00:00",
  "source_file": "resources/faq.md",
  "language_code": "tr"
}
-->
# Sıkça Sorulan Sorular (SSS)

## Giriş

Bu kapsamlı SSS, Azure Developer CLI (azd) ve Azure dağıtımları hakkında en yaygın sorulara yanıtlar sunar. Yaygın sorunlara hızlı çözümler bulun, en iyi uygulamaları anlayın ve azd kavramları ile iş akışları hakkında netlik kazanın.

## Öğrenme Hedefleri

Bu SSS'yi inceleyerek:
- Azure Developer CLI ile ilgili yaygın sorulara ve sorunlara hızlı yanıtlar bulabilirsiniz
- Pratik Soru-Cevap formatıyla temel kavramları ve terminolojiyi anlayabilirsiniz
- Yaygın sorunlar ve hata senaryoları için çözüm yollarına erişebilirsiniz
- Optimizasyonla ilgili sıkça sorulan sorular üzerinden en iyi uygulamaları öğrenebilirsiniz
- Uzman düzeyindeki sorularla gelişmiş özellikleri ve yetenekleri keşfedebilirsiniz
- Maliyet, güvenlik ve dağıtım stratejisi rehberliğine kolayca başvurabilirsiniz

## Öğrenme Çıktıları

Bu SSS'ye düzenli olarak başvurarak:
- Sağlanan çözümleri kullanarak Azure Developer CLI ile ilgili yaygın sorunları bağımsız olarak çözebilirsiniz
- Dağıtım stratejileri ve yapılandırmaları hakkında bilinçli kararlar alabilirsiniz
- azd ile diğer Azure araçları ve hizmetleri arasındaki ilişkiyi anlayabilirsiniz
- Topluluk deneyimlerine ve uzman önerilerine dayalı en iyi uygulamaları uygulayabilirsiniz
- Kimlik doğrulama, dağıtım ve yapılandırma sorunlarını etkili bir şekilde çözebilirsiniz
- Maliyetleri ve performansı SSS içgörüleri ve önerileriyle optimize edebilirsiniz

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
**C**: Azure Developer CLI (azd), uygulamanızı yerel geliştirme ortamından Azure'a taşıma süresini hızlandıran geliştirici odaklı bir komut satırı aracıdır. Şablonlar aracılığıyla en iyi uygulamaları sunar ve tüm dağıtım yaşam döngüsüne yardımcı olur.

### S: azd, Azure CLI'dan nasıl farklıdır?
**C**: 
- **Azure CLI**: Azure kaynaklarını yönetmek için genel amaçlı bir araçtır
- **azd**: Uygulama dağıtım iş akışları için geliştirici odaklı bir araçtır
- azd, Azure CLI'yi dahili olarak kullanır ancak yaygın geliştirme senaryoları için daha yüksek seviyeli soyutlamalar sağlar
- azd, şablonlar, ortam yönetimi ve dağıtım otomasyonu içerir

### S: azd kullanmak için Azure CLI kurulu olmalı mı?
**C**: Evet, azd kimlik doğrulama ve bazı işlemler için Azure CLI gerektirir. Önce Azure CLI'yi kurun, ardından azd'yi yükleyin.

### S: azd hangi programlama dillerini destekler?
**C**: azd dil bağımsızdır. Şunlarla çalışır:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statik web siteleri
- Konteynerleştirilmiş uygulamalar

### S: azd'yi mevcut projelerle kullanabilir miyim?
**C**: Evet! Şunları yapabilirsiniz:
1. `azd init` komutunu kullanarak mevcut projelere azd yapılandırması ekleyin
2. Mevcut projeleri azd şablon yapısına uyacak şekilde uyarlayın
3. Mevcut mimarinize dayalı özel şablonlar oluşturun

---

## Kimlik Doğrulama ve Erişim

### S: azd ile Azure'a nasıl kimlik doğrulama yaparım?
**C**: `azd auth login` komutunu kullanın; bu, Azure kimlik doğrulaması için bir tarayıcı penceresi açar. CI/CD senaryoları için hizmet ilkeleri veya yönetilen kimlikler kullanın.

### S: azd'yi birden fazla Azure aboneliğiyle kullanabilir miyim?
**C**: Evet. Her ortam için hangi aboneliğin kullanılacağını belirtmek için `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` komutunu kullanın.

### S: azd ile dağıtım yapmak için hangi izinlere ihtiyacım var?
**C**: Genellikle şunlara ihtiyacınız olur:
- Kaynak grubu veya abonelikte **Katkıda Bulunan** rolü
- Rol atamaları gerektiren kaynakları dağıtıyorsanız **Kullanıcı Erişim Yöneticisi**
- Şablona ve dağıtılan kaynaklara bağlı olarak özel izinler

### S: azd'yi CI/CD hatlarında kullanabilir miyim?
**C**: Kesinlikle! azd, CI/CD entegrasyonu için tasarlanmıştır. Kimlik doğrulama için hizmet ilkelerini kullanın ve yapılandırma için ortam değişkenlerini ayarlayın.

### S: GitHub Actions'da kimlik doğrulamayı nasıl yönetirim?
**C**: Hizmet ilkesi kimlik bilgileriyle Azure Login eylemini kullanın:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Şablonlar ve Projeler

### S: azd şablonlarını nerede bulabilirim?
**C**: 
- Resmi şablonlar: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Topluluk şablonları: GitHub'da "azd-template" araması yapın
- `azd template list` komutunu kullanarak mevcut şablonlara göz atın

### S: Özel bir şablon nasıl oluşturulur?
**C**: 
1. Mevcut bir şablon yapısıyla başlayın
2. `azure.yaml`, altyapı dosyaları ve uygulama kodunu değiştirin
3. `azd up` ile kapsamlı bir şekilde test edin
4. Uygun etiketlerle GitHub'a yayınlayın

### S: Şablon olmadan azd kullanabilir miyim?
**C**: Evet, mevcut bir projede `azd init` komutunu kullanarak gerekli yapılandırma dosyalarını oluşturabilirsiniz. `azure.yaml` ve altyapı dosyalarını manuel olarak yapılandırmanız gerekir.

### S: Resmi ve topluluk şablonları arasındaki fark nedir?
**C**: 
- **Resmi şablonlar**: Microsoft tarafından bakım yapılır, düzenli olarak güncellenir, kapsamlı belgeler içerir
- **Topluluk şablonları**: Geliştiriciler tarafından oluşturulur, özel kullanım durumlarına sahip olabilir, kalite ve bakım değişkenlik gösterebilir

### S: Projemdeki bir şablonu nasıl güncellerim?
**C**: Şablonlar otomatik olarak güncellenmez. Şunları yapabilirsiniz:
1. Kaynak şablondan değişiklikleri manuel olarak karşılaştırıp birleştirin
2. Güncellenmiş şablonu kullanarak `azd init` ile sıfırdan başlayın
3. Güncellenmiş şablonlardan belirli iyileştirmeleri seçin

---

## Dağıtım ve Altyapı

### S: azd hangi Azure hizmetlerini dağıtabilir?
**C**: azd, Bicep/ARM şablonları aracılığıyla herhangi bir Azure hizmetini dağıtabilir, örneğin:
- App Services, Container Apps, Functions
- Veritabanları (SQL, PostgreSQL, Cosmos DB)
- Depolama, Key Vault, Application Insights
- Ağ, güvenlik ve izleme kaynakları

### S: Birden fazla bölgeye dağıtım yapabilir miyim?
**C**: Evet, Bicep şablonlarınızda birden fazla bölge yapılandırın ve her ortam için konum parametresini uygun şekilde ayarlayın.

### S: Veritabanı şema geçişlerini nasıl yönetirim?
**C**: `azure.yaml` dosyasındaki dağıtım kancalarını kullanın:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Sadece altyapıyı uygulamalar olmadan dağıtabilir miyim?
**C**: Evet, şablonlarınızda tanımlanan yalnızca altyapı bileşenlerini dağıtmak için `azd provision` komutunu kullanın.

### S: Mevcut Azure kaynaklarına nasıl dağıtım yaparım?
**C**: Bu karmaşıktır ve doğrudan desteklenmez. Şunları yapabilirsiniz:
1. Mevcut kaynakları Bicep şablonlarınıza aktarın
2. Şablonlarda mevcut kaynak referanslarını kullanın
3. Kaynakları koşullu olarak oluşturmak veya referans vermek için şablonları değiştirin

### S: Bicep yerine Terraform kullanabilir miyim?
**C**: Şu anda azd, öncelikle Bicep/ARM şablonlarını destekler. Terraform desteği resmi olarak mevcut değildir, ancak topluluk çözümleri bulunabilir.

---

## Yapılandırma ve Ortamlar

### S: Farklı ortamları (geliştirme, test, üretim) nasıl yönetirim?
**C**: `azd env new <environment-name>` komutuyla ayrı ortamlar oluşturun ve her biri için farklı ayarları yapılandırın:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Ortam yapılandırmaları nerede saklanır?
**C**: Proje dizininizdeki `.azure` klasöründe. Her ortamın kendi yapılandırma dosyalarıyla ayrı bir klasörü vardır.

### S: Ortama özgü yapılandırmayı nasıl ayarlarım?
**C**: Ortam değişkenlerini yapılandırmak için `azd env set` komutunu kullanın:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Ortam yapılandırmalarını ekip üyeleri arasında nasıl paylaşırım?
**C**: `.azure` klasörü hassas bilgiler içerir ve sürüm kontrolüne eklenmemelidir. Bunun yerine:
1. Gerekli ortam değişkenlerini belgeleyin
2. Ortamları kurmak için dağıtım komut dosyaları kullanın
3. Hassas yapılandırma için Azure Key Vault kullanın

### S: Şablon varsayılanlarını nasıl geçersiz kılarım?
**C**: Şablon parametrelerine karşılık gelen ortam değişkenlerini ayarlayın:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Sorun Giderme

### S: `azd up` neden başarısız oluyor?
**C**: Yaygın nedenler:
1. **Kimlik doğrulama sorunları**: `azd auth login` komutunu çalıştırın
2. **Yetersiz izinler**: Azure rol atamalarınızı kontrol edin
3. **Kaynak adlandırma çakışmaları**: AZURE_ENV_NAME değiştirin
4. **Kota/kapasite sorunları**: Bölgesel kullanılabilirliği kontrol edin
5. **Şablon hataları**: Bicep şablonlarını doğrulayın

### S: Dağıtım hatalarını nasıl ayıklarım?
**C**: 
1. Ayrıntılı çıktı için `azd deploy --debug` komutunu kullanın
2. Azure portalındaki dağıtım geçmişini kontrol edin
3. Azure portalındaki Etkinlik Günlüğü'nü inceleyin
4. Mevcut ortam durumunu görüntülemek için `azd show` komutunu kullanın

### S: Ortam değişkenlerim neden çalışmıyor?
**C**: Kontrol edin:
1. Değişken adları şablon parametreleriyle tam olarak eşleşiyor mu
2. Değerler boşluk içeriyorsa düzgün şekilde tırnak içine alınmış mı
3. Ortam seçilmiş mi: `azd env select <environment>`
4. Değişkenler doğru ortamda ayarlanmış mı

### S: Başarısız dağıtımları nasıl temizlerim?
**C**: 
```bash
azd down --force --purge
```
Bu, tüm kaynakları ve ortam yapılandırmasını kaldırır.

### S: Dağıtımdan sonra uygulamam neden erişilebilir değil?
**C**: Kontrol edin:
1. Dağıtım başarıyla tamamlandı mı
2. Uygulama çalışıyor mu (Azure portalındaki günlükleri kontrol edin)
3. Ağ güvenlik grupları trafiğe izin veriyor mu
4. DNS/özel alan adları doğru şekilde yapılandırılmış mı

---

## Maliyet ve Faturalama

### S: azd dağıtımları ne kadar maliyetli olur?
**C**: Maliyetler şunlara bağlıdır:
- Dağıtılan Azure hizmetleri
- Hizmet katmanları/SKU'lar
- Bölgesel fiyat farklılıkları
- Kullanım kalıpları

Tahminler için [Azure Fiyatlandırma Hesaplayıcısı](https://azure.microsoft.com/pricing/calculator/) kullanın.

### S: azd dağıtımlarında maliyetleri nasıl kontrol ederim?
**C**: 
1. Geliştirme ortamları için daha düşük katmanlı SKU'lar kullanın
2. Azure bütçeleri ve uyarıları ayarlayın
3. Kaynaklara ihtiyaç duyulmadığında `azd down` komutunu kullanarak kaldırın
4. Uygun bölgeleri seçin (maliyetler konuma göre değişir)
5. Azure Maliyet Yönetimi araçlarını kullanın

### S: azd şablonları için ücretsiz katman seçenekleri var mı?
**C**: Birçok Azure hizmeti ücretsiz katmanlar sunar:
- App Service: Ücretsiz katman mevcut
- Azure Functions: Ayda 1M ücretsiz yürütme
- Cosmos DB: 400 RU/s ile ücretsiz katman
- Application Insights: Ayda ilk 5GB ücretsiz

Şablonları, mevcut olduğu yerlerde ücretsiz katmanları kullanacak şekilde yapılandırın.

### S: Dağıtımdan önce maliyetleri nasıl tahmin ederim?
**C**: 
1. Şablonun `main.bicep` dosyasını inceleyerek hangi kaynakların oluşturulduğunu görün
2. Belirli SKU'larla Azure Fiyatlandırma Hesaplayıcısını kullanın
3. Önce bir geliştirme ortamına dağıtım yaparak gerçek maliyetleri izleyin
4. Ayrıntılı maliyet analizi için Azure Maliyet Yönetimi'ni kullanın

---

## En İyi Uygulamalar

### S: azd proje yapısı için en iyi uygulamalar nelerdir?
**C**: 
1. Uygulama kodunu altyapıdan ayrı tutun
2. `azure.yaml` dosyasında anlamlı hizmet adları kullanın
3. Derleme komut dosyalarında uygun hata işleme uygulayın
4. Ortama özgü yapılandırma kullanın
5. Kapsamlı belgeler ekleyin

### S: azd'de birden fazla hizmeti nasıl organize etmeliyim?
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
**C**: **Hayır!** `.azure` klasörü hassas bilgiler içerir. `.gitignore` dosyasına ekleyin:
```gitignore
.azure/
```

### S: Gizli bilgiler ve hassas yapılandırmayı nasıl yönetirim?
**C**: 
1. Gizli bilgiler için Azure Key Vault kullanın
2. Uygulama yapılandırmasında Key Vault sırlarını referans alın
3. Gizli bilgileri asla sürüm kontrolüne eklemeyin
4. Hizmetler arası kimlik doğrulama için yönetilen kimlikler kullanın

### S: azd ile CI/CD için önerilen yaklaşım nedir?
**C**: 
1. Her aşama için ayrı ortamlar kullanın (geliştirme/test/üretim)
2. Dağıtımdan önce otomatik testler uygulayın
3. Kimlik doğrulama için hizmet ilkelerini kullanın
4. Hassas yapılandırmayı pipeline sırları/değişkenlerinde saklayın
5. Üretim dağıtımları için onay kapıları uygulayın

---

## Gelişmiş Konular

### S: azd'yi özel işlevsellikle genişletebilir miyim?
**C**: Evet, `azure.yaml` dosyasındaki dağıtım kancaları aracılığıyla:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: azd'yi mevcut DevOps süreçleriyle nasıl entegre ederim?
**C**: 
1. Mevcut pipeline komut dosyalarında azd komutlarını kullanın
2. Ekipler arasında azd şablonlarını standartlaştırın
3. Mevcut izleme ve uyarılarla entegre edin
4. Pipeline entegrasyonu için azd'nin JSON çıktısını kullanın

### S: azd'yi Azure DevOps ile kullanabilir miyim?
**C**: Evet, azd herhangi bir CI/CD sistemiyle çalışır. Azure DevOps pipeline'ları oluşturun ve azd komutlarını kullanın.

### S: azd'ye veya topluluk şablonlarına nasıl katkıda bulunabilirim?
**C**: 
1. **azd aracı**: [Azure/azure-dev](https://github.com/Azure/azure-dev) adresine katkıda bulunun
2. **Şablonlar**: [şablon yönergelerini](https://github.com/Azure-Samples/awesome-azd) takip ederek şablonlar oluşturun
3. **Belgeler**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) adresindeki belgelere katkıda bulunun

### S
1. Mevcut dağıtım mimarisini analiz edin  
2. Eşdeğer Bicep şablonları oluşturun  
3. `azure.yaml` dosyasını mevcut hizmetlere uygun şekilde yapılandırın  
4. Geliştirme ortamında kapsamlı testler yapın  
5. Ortamları kademeli olarak taşıyın  

---

## Hâlâ Sorularınız mı Var?

### **Önce Arayın**  
- [Resmi belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) kontrol edin  
- Benzer sorunlar için [GitHub sorunlarını](https://github.com/Azure/azure-dev/issues) arayın  

### **Yardım Alın**  
- [GitHub Tartışmaları](https://github.com/Azure/azure-dev/discussions) - Topluluk desteği  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Teknik sorular  
- [Azure Discord](https://discord.gg/azure) - Gerçek zamanlı topluluk sohbeti  

### **Sorunları Bildirin**  
- [GitHub Sorunları](https://github.com/Azure/azure-dev/issues/new) - Hata raporları ve özellik talepleri  
- İlgili günlükleri, hata mesajlarını ve yeniden oluşturma adımlarını ekleyin  

### **Daha Fazla Bilgi Edinin**  
- [Azure Developer CLI belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure İyi Tasarlanmış Çerçeve](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Bu SSS düzenli olarak güncellenmektedir. Son güncelleme: 9 Eylül 2025*  

---

**Gezinme**  
- **Önceki Ders**: [Sözlük](glossary.md)  
- **Sonraki Ders**: [Çalışma Kılavuzu](study-guide.md)  

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.