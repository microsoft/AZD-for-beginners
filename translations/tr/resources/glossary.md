# Sözlük - Azure ve AZD Terimleri

**Tüm Bölümler İçin Referans**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Temelleri Öğrenin**: [Chapter 1: AZD Basics](../docs/getting-started/azd-basics.md)
- **🤖 Yapay Zeka Terimleri**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı sözlük, Azure Developer CLI ve Azure bulut geliştirme sırasında kullanılan terimler, kavramlar ve kısaltmalar için tanımları sağlar. azd projeleri ve Azure servisleri hakkında teknik dokümantasyonu anlamak, sorun gidermek ve etkili iletişim kurmak için temel bir başvuru kaynağıdır.

## Öğrenme Hedefleri

Bu sözlüğü kullanarak:
- Azure Developer CLI terimleri ve temel kavramlarını anlayacaksınız
- Azure bulut geliştirme sözlüğü ve teknik terimlerde ustalaşacaksınız
- Altyapı olarak Kod ve dağıtım terminolojisine verimli şekilde başvuracaksınız
- Azure servis adlarını, kısaltmalarını ve amaçlarını kavrayacaksınız
- Sorun giderme ve hata ayıklama terminolojisinin tanımlarına erişeceksiniz
- Gelişmiş Azure mimarisi ve geliştirme kavramlarını öğreneceksiniz

## Öğrenme Çıktıları

Bu sözlüğe düzenli başvuru ile:
- Doğru Azure Developer CLI terminolojisini kullanarak etkili iletişim kurabileceksiniz
- Teknik dokümantasyon ve hata mesajlarını daha net anlayabileceksiniz
- Azure servisleri ve kavramları arasında güvenle gezinebileceksiniz
- Uygun teknik terminoloji kullanarak sorun giderebileceksiniz
- Doğru teknik dil ile ekip tartışmalarına katkıda bulunabileceksiniz
- Azure bulut geliştirme bilginizi sistematik olarak genişletebileceksiniz

## A

**ARM Şablonu**  
Azure Resource Manager şablonu. Azure kaynaklarını deklaratif olarak tanımlamak ve dağıtmak için kullanılan JSON tabanlı Altyapı olarak Kod formatı.

**App Service**  
Web uygulamalarını, REST API'lerini ve mobil backend'leri altyapıyı yönetmeden barındırmak için Azure'ın platform olarak hizmet (PaaS) sunumu.

**Application Insights**  
Uygulama performansı, kullanılabilirlik ve kullanım hakkında derin içgörüler sağlayan Azure uygulama performans izleme (APM) hizmeti.

**Azure CLI**  
Azure kaynaklarını yönetmek için komut satırı arayüzü. azd tarafından kimlik doğrulama ve bazı işlemler için kullanılır.

**Azure Developer CLI (azd)**  
Şablonlar ve Altyapı olarak Kod kullanarak uygulamaların Azure'a hızlıca oluşturulması ve dağıtılmasını hızlandıran geliştirici odaklı komut satırı aracı.

**azure.yaml**  
Hizmetleri, altyapıyı ve dağıtım kancalarını tanımlayan bir azd projesinin ana yapılandırma dosyası.

**Azure Resource Manager (ARM)**  
Kaynak oluşturma, güncelleme ve silme için bir yönetim katmanı sağlayan Azure'un dağıtım ve yönetim hizmeti.

## B

**Bicep**  
Azure kaynaklarını dağıtmak için Microsoft tarafından geliştirilen alan özel dili (DSL). ARM şablonlarına derlenirken daha basit bir sözdizimi sağlar.

**Build**  
Kaynak kodunun derlenmesi, bağımlılıkların yüklenmesi ve uygulamaların dağıtıma hazırlanması süreci.

**Blue-Green Deployment**  
Kesinti ve riski en aza indirmek için iki özdeş üretim ortamı (blue ve green) kullanan dağıtım stratejisi.

## C

**Container Apps**  
Karmaşık altyapıyı yönetmeden konteynerleştirilmiş uygulamaları çalıştırmayı sağlayan Azure'ın sunucusuz konteyner hizmeti.

**CI/CD**  
Sürekli Entegrasyon/Sürekli Dağıtım. Kod değişikliklerini entegre etmek ve uygulamaları dağıtmak için otomatik uygulamalar.

**Cosmos DB**  
Azure'ın küresel olarak dağıtılmış, çoklu model destekli veritabanı hizmeti; throughput, gecikme, kullanılabilirlik ve tutarlılık için kapsamlı SLA'lar sağlar.

**Konfigürasyon**  
Uygulama davranışını ve dağıtım seçeneklerini kontrol eden ayarlar ve parametreler.

## D

**Deployment**  
Uygulamaların ve bağımlılıklarınızın hedef altyapıda kurulması ve yapılandırılması süreci.

**Docker**  
Konteynerleştirme teknolojisi kullanarak uygulamaları geliştirme, paketleme ve çalıştırma platformu.

**Dockerfile**  
Bir Docker konteyner imajı oluşturmak için talimatları içeren metin dosyası.

## E

**Environment**  
Uygulamanızın belirli bir örneğini temsil eden dağıtım hedefi (ör. geliştirme, hazırlık, üretim).

**Ortam Değişkenleri**  
Uygulamaların çalışma zamanında erişebileceği anahtar-değer çiftleri olarak saklanan yapılandırma değerleri.

**Endpoint**  
Bir uygulamaya veya servise erişilebilen URL veya ağ adresi.

## F

**Function App**  
Altyapıyı yönetmeden olay odaklı kod çalıştırmayı sağlayan Azure'ın sunucusuz hesaplama hizmeti.

## G

**GitHub Actions**  
Depolarla entegre olan ve iş akışlarını otomatikleştiren CI/CD platformu.

**Git**  
Kaynak kodundaki değişiklikleri izlemek için kullanılan dağıtık sürüm kontrol sistemi.

## H

**Hooks**  
Dağıtım yaşam döngüsünün belirli noktalarında (preprovision, postprovision, predeploy, postdeploy) çalışan özel betikler veya komutlar.

**Host**  
Uygulamanın dağıtılacağı Azure servis türü (ör. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Altyapıyı manuel süreçler yerine kod yoluyla tanımlama ve yönetme uygulaması.

**Init**  
Genellikle bir şablondan yeni bir azd projesinin başlatılması süreci.

## J

**JSON**  
JavaScript Object Notation. Yapılandırma dosyaları ve API yanıtları için yaygın olarak kullanılan veri alışveriş formatı.

**JWT**  
JSON Web Token. Taraflar arasında bilgiyi güvenli bir şekilde JSON nesnesi olarak iletmek için standart.

## K

**Key Vault**  
Sırlar, anahtarlar ve sertifikaları güvenli bir şekilde saklama ve yönetme hizmeti.

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights ve diğer Azure servislerindeki verileri analiz etmek için kullanılan sorgu dili.

## L

**Load Balancer**  
Gelen ağ trafiğini birden çok sunucu veya örnek arasında dağıtan hizmet.

**Log Analytics**  
Bulut ve yerel ortamlardan telemetri verilerini toplamak, analiz etmek ve bu verilere göre işlem yapmak için Azure hizmeti.

## M

**Managed Identity**  
Azure servislerine diğer Azure servislerine kimlik doğrulama için otomatik yönetilen bir kimlik sağlayan Azure özelliği.

**Mikroservisler**  
Uygulamaların küçük, bağımsız hizmetlerden oluşan bir koleksiyon olarak inşa edildiği mimari yaklaşım.

**Monitor**  
Uygulamalar ve altyapı genelinde tam yığın gözlemlenebilirlik sağlayan Azure'un birleşik izleme çözümü.

## N

**Node.js**  
Sunucu tarafı uygulamalar oluşturmak için Chrome'un V8 JavaScript motoru üzerine inşa edilmiş JavaScript çalışma zamanı.

**npm**  
Node.js için bağımlılıkları ve paketleri yöneten paket yöneticisi.

## O

**Output**  
Altyapı dağıtımından döndürülen ve uygulamalar veya diğer kaynaklar tarafından kullanılabilecek değerler.

## P

**Package**  
Uygulama kodu ve bağımlılıklarının dağıtıma hazırlanması süreci.

**Parameters**  
Dağıtımları özelleştirmek için altyapı şablonlarına geçirilen giriş değerleri.

**PostgreSQL**  
Azure tarafından yönetilen hizmet olarak desteklenen açık kaynaklı ilişkisel veritabanı sistemi.

**Provisioning**  
Altyapı şablonlarında tanımlanan Azure kaynaklarının oluşturulması ve yapılandırılması süreci.

## Q

**Quota**  
Bir Azure aboneliğinde veya bölgede oluşturulabilecek kaynak miktarına konulan sınırlamalar.

## R

**Resource Group**  
Aynı yaşam döngüsünü, izinlerini ve politikalarını paylaşan Azure kaynakları için mantıksal kapsayıcı.

**Resource Token**  
Kaynak adlarının dağıtımlar arasında benzersiz olmasını sağlamak için azd tarafından oluşturulan benzersiz dize.

**REST API**  
HTTP yöntemlerini kullanarak ağ uygulamaları tasarlamak için kullanılan mimari stil.

**Rollback**  
Bir uygulamanın veya altyapı yapılandırmasının önceki bir sürümüne geri dönme süreci.

## S

**Service**  
azure.yaml içinde tanımlanan uygulamanızın bir bileşeni (ör. web ön yüzü, API arka ucu, veritabanı).

**SKU**  
Stok Tutma Birimi. Azure kaynakları için farklı hizmet katmanları veya performans düzeylerini temsil eder.

**SQL Database**  
Microsoft SQL Server tabanlı Azure'ın yönetilen ilişkisel veritabanı hizmeti.

**Static Web Apps**  
Kaynak kod havuzlarından tam yığın web uygulamaları oluşturup dağıtmak için Azure hizmeti.

**Storage Account**  
Bloblar, dosyalar, kuyruklar ve tablolar dahil veri nesneleri için bulut depolama sağlayan Azure hizmeti.

**Subscription**  
Faturalama ve erişim yönetimi ile ilişkili olarak kaynak gruplarını ve kaynakları barındıran Azure hesap kapsayıcısı.

## T

**Template**  
Uygulama kodu, altyapı tanımları ve yaygın senaryolar için yapılandırma içeren önceden oluşturulmuş proje yapısı.

**Terraform**  
Azure dahil olmak üzere birden çok bulut sağlayıcısını destekleyen açık kaynak Altyapı olarak Kod aracı.

**Traffic Manager**  
Küresel Azure bölgeleri arasında trafiği dağıtmak için Azure'un DNS tabanlı trafik yük dengeleyicisi.

## U

**URI**  
Uniform Resource Identifier. Belirli bir kaynağı tanımlayan dize.

**URL**  
Uniform Resource Locator. Bir kaynağın nerede olduğunu ve nasıl alınacağını belirten bir URI türü.

## V

**Virtual Network (VNet)**  
Azure'da özel ağlar için temel yapı taşı; izolasyon ve segmentasyon sağlar.

**VS Code**  
Visual Studio Code. Azure ve azd entegrasyonu ile popüler kod düzenleyici.

## W

**Webhook**  
Belirli olaylarla tetiklenen HTTP geri araması; genellikle CI/CD boru hatlarında kullanılır.

**What-if**  
Bir dağıtımın gerçekten yürütülmeden hangi değişiklikleri yapacağını gösteren Azure özelliği.

## Y

**YAML**  
YAML Ain't Markup Language. azure.yaml gibi yapılandırma dosyaları için kullanılan insan tarafından okunabilir veri serileştirme standardı.

## Z

**Zone**  
Yüksek kullanılabilirlik ve yedeklilik sağlayan bir Azure bölgesi içindeki fiziksel olarak ayrı konumlar.

---

## Yaygın Kısaltmalar

| Kısaltma | Açılım | Açıklama |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Kimlik ve erişim yönetimi hizmeti |
| ACR | Azure Container Registry | Konteyner imaj kayıt hizmeti |
| AKS | Azure Kubernetes Service | Yönetilen Kubernetes hizmeti |
| API | Application Programming Interface | Yazılım oluşturmak için protokoller kümesi |
| ARM | Azure Resource Manager | Azure'un dağıtım ve yönetim hizmeti |
| CDN | Content Delivery Network | Sunucuların dağıtılmış ağı |
| CI/CD | Continuous Integration/Continuous Deployment | Otomatikleştirilmiş geliştirme uygulamaları |
| CLI | Command Line Interface | Metin tabanlı kullanıcı arayüzü |
| DNS | Domain Name System | Alan adlarını IP adreslerine çevirme sistemi |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP'nin güvenli sürümü |
| IaC | Infrastructure as Code | Altyapıyı kod yoluyla yönetme |
| JSON | JavaScript Object Notation | Veri alışveriş formatı |
| JWT | JSON Web Token | Güvenli bilgi iletimi için token formatı |
| KQL | Kusto Query Language | Azure veri servisleri için sorgu dili |
| RBAC | Role-Based Access Control | Kullanıcı rollerine dayalı erişim kontrolü yöntemi |
| REST | Representational State Transfer | Web servisleri için mimari stil |
| SDK | Software Development Kit | Geliştirme araçları koleksiyonu |
| SLA | Service Level Agreement | Hizmet kullanılabilirliği/performans taahhüdü |
| SQL | Structured Query Language | İlişkisel veritabanlarını yönetme dili |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografik protokoller |
| URI | Uniform Resource Identifier | Bir kaynağı tanımlayan dize |
| URL | Uniform Resource Locator | Kaynak konumunu belirten URI türü |
| VM | Virtual Machine | Bir bilgisayar sisteminin emülasyonu |
| VNet | Virtual Network | Azure'da özel ağ |
| YAML | YAML Ain't Markup Language | Veri serileştirme standardı |

---

## Azure Servis Adı Eşlemeleri

| Yaygın İsim | Resmi Azure Servis Adı | azd Host Türü |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Bağlama Özgü Terimler

### Geliştirme Terimleri
- **Hot Reload**: Geliştirme sırasında yeniden başlatma yapmadan uygulamaları otomatik olarak güncelleme
- **Build Pipeline**: Kodu derlemek ve test etmek için otomatik süreç
- **Deployment Slot**: App Service içinde bir hazırlık ortamı
- **Environment Parity**: Geliştirme, hazırlık ve üretim ortamlarını benzer tutma

### Güvenlik Terimleri
- **Managed Identity**: Otomatik kimlik bilgisi yönetimi sağlayan Azure özelliği
- **Key Vault**: Sırlar, anahtarlar ve sertifikalar için güvenli depolama
- **RBAC**: Azure kaynakları için rol tabanlı erişim kontrolü
- **Network Security Group**: Ağ trafiğini kontrol etmek için sanal güvenlik duvarı

### İzleme Terimleri
- **Telemetry**: Ölçümlerin ve verilerin otomatik toplanması
- **Application Performance Monitoring (APM)**: Yazılım performansının izlenmesi
- **Log Analytics**: Günlük verilerini toplamak ve analiz etmek için hizmet
- **Alert Rules**: Metriklere veya koşullara dayalı otomatik bildirimler

### Dağıtım Terimleri
- **Blue-Green Deployment**: Kesintisiz dağıtım stratejisi
- **Canary Deployment**: Kullanıcıların bir alt kümesine kademeli açılım
- **Rolling Update**: Uygulama örneklerinin sıralı olarak değiştirilmesi
- **Rollback**: Önceki uygulama sürümüne geri dönme

---

**Kullanım İpucu**: Bu sözlükte belirli terimleri hızlıca aramak için `Ctrl+F` kullanın. Terimler gerektiğinde çapraz referanslandırılmıştır.

---

**Navigasyon**
- **Önceki Ders**: [Cheat Sheet](cheat-sheet.md)
- **Sonraki Ders**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belgenin ana dilindeki versiyonu yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->