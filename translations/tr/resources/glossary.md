# Sözlük - Azure ve AZD Terimleri

**Tüm Bölümler İçin Referans**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../README.md)
- **📖 Temel Bilgiler**: [Bölüm 1: AZD Temelleri](../docs/getting-started/azd-basics.md)
- **🤖 Yapay Zeka Terimleri**: [Bölüm 2: Yapay Zeka Odaklı Geliştirme](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı sözlük, Azure Developer CLI ve Azure bulut geliştirme ile ilgili terimler, kavramlar ve kısaltmalar için tanımlar sağlar. azd projeleri ve Azure hizmetleri hakkında teknik belgeleri anlamak, sorun gidermede ve etkili iletişim kurmada temel bir başvuru kaynağıdır.

## Öğrenme Hedefleri

Bu sözlüğü kullanarak:
- Azure Developer CLI ile ilgili temel terimleri ve kavramları anlayacaksınız
- Azure bulut geliştirme sözlüğü ve teknik terimlerinde ustalaşacaksınız
- Altyapı olarak Kod ve dağıtım terimlerine hızlı erişim sağlayacaksınız
- Azure hizmet adlarını, kısaltmalarını ve amaçlarını kavrayacaksınız
- Sorun giderme ve hata ayıklama terimleri için tanımlara erişebileceksiniz
- Gelişmiş Azure mimarisi ve geliştirme kavramlarını öğreneceksiniz

## Öğrenme Çıktıları

Bu sözlüğe düzenli başvuru ile şunları yapabileceksiniz:
- Azure Developer CLI terminolojisini doğru kullanarak etkili iletişim kurmak
- Teknik belgeleri ve hata mesajlarını daha net anlamak
- Azure hizmetleri ve kavramlarında kendinden emin gezinmek
- Uygun teknik dil kullanarak sorunları gidermek
- Doğru teknik dil ile ekip tartışmalarına katkıda bulunmak
- Azure bulut geliştirme bilginizi sistematik olarak genişletmek

## A

**ARM Template**  
Azure Resource Manager şablonu. Azure kaynaklarını bildirimsiz olarak tanımlamak ve dağıtmak için kullanılan JSON tabanlı Infrastructure as Code formatı.

**App Service**  
Web uygulamaları, REST API'leri ve mobil arka uçlarını altyapıyı yönetmeden barındırmak için Azure'ın platform olarak hizmet (PaaS) offering'i.

**Application Insights**  
Uygulama performansı, kullanılabilirlik ve kullanım hakkında derinlemesine içgörüler sağlayan Azure'ın uygulama performansı izleme (APM) hizmeti.

**Azure CLI**  
Azure kaynaklarını yönetmek için komut satırı arayüzü. azd tarafından kimlik doğrulama ve bazı işlemler için kullanılır.

**Azure Developer CLI (azd)**  
Şablonlar ve Infrastructure as Code kullanarak uygulamaları Azure'a hızlıca oluşturup dağıtma sürecini hızlandıran geliştirici odaklı komut satırı aracı.

**azure.yaml**  
Hizmetleri, altyapıyı ve dağıtım kancalarını tanımlayan bir azd projesinin ana yapılandırma dosyası.

**Azure Resource Manager (ARM)**  
Kaynak oluşturma, güncelleme ve silme için yönetim katmanı sağlayan Azure'ın dağıtım ve yönetim hizmeti.

## B

**Bicep**  
Azure kaynaklarını dağıtmak için Microsoft tarafından geliştirilen etki alanına özgü dil (DSL). ARM şablonlarına derlenirken daha basit bir sözdizimi sunar.

**Build**  
Kaynak kodun derlenmesi, bağımlılıkların yüklenmesi ve uygulamaların dağıtıma hazırlanması süreci.

**Blue-Green Deployment**  
Kesinti ve riski minimize etmek için iki özdeş üretim ortamı (blue ve green) kullanan dağıtım stratejisi.

## C

**Container Apps**  
Karmaşık altyapıyı yönetmeden konteynerlenmiş uygulamaları çalıştırmayı sağlayan Azure'ın sunucusuz konteyner hizmeti.

**CI/CD**  
Sürekli Entegrasyon/Sürekli Dağıtım. Kod değişikliklerini entegre etme ve uygulamaları dağıtma için otomatik uygulamalar.

**Cosmos DB**  
Akış hızı, gecikme, kullanılabilirlik ve tutarlılık için kapsamlı SLA'lar sağlayan Azure'ın küresel olarak dağıtılmış, çok modelli veritabanı hizmeti.

**Configuration**  
Uygulama davranışını ve dağıtım seçeneklerini kontrol eden ayarlar ve parametreler.

## D

**Deployment**  
Uygulamaların ve bağımlılıklarının hedef altyapıya kurulması ve yapılandırılması süreci.

**Docker**  
Uygulamaları konteynerleştirme teknolojisi kullanarak geliştirme, gönderme ve çalıştırma platformu.

**Dockerfile**  
Bir Docker konteyner görüntüsü oluşturmak için talimatlar içeren metin dosyası.

## E

**Environment**  
Uygulamanızın belirli bir örneğini temsil eden dağıtım hedefi (ör. geliştirme, test, üretim).

**Environment Variables**  
Uygulamaların çalışma zamanında erişebildiği anahtar-değer çiftleri şeklindeki yapılandırma değerleri.

**Endpoint**  
Bir uygulamaya veya hizmete erişilebilen URL veya ağ adresi.

## F

**Function App**  
Altyapıyı yönetmeden olay odaklı kod çalıştırmayı sağlayan Azure'ın sunucusuz hesaplama hizmeti.

## G

**GitHub Actions**  
Depolara entegre edilmiş, iş akışlarını otomatikleştirmek için kullanılan CI/CD platformu.

**Git**  
Kaynak kod değişikliklerini izlemek için kullanılan dağıtılmış versiyon kontrol sistemi.

## H

**Hooks**  
Dağıtım yaşam döngüsünün belirli noktalarında (preprovision, postprovision, predeploy, postdeploy) çalışan özel betikler veya komutlar.

**Host**  
Bir uygulamanın dağıtılacağı Azure hizmet türü (ör. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Altyapıyı manuel süreçler yerine kod yoluyla tanımlama ve yönetme uygulaması.

**Init**  
Genellikle bir şablondan yeni bir azd projesini başlatma süreci.

## J

**JSON**  
JavaScript Nesne Gösterimi. Yapılandırma dosyaları ve API yanıtları için yaygın olarak kullanılan veri alışveriş formatı.

**JWT**  
JSON Web Token. Taraflar arasında bilgiyi güvenli şekilde JSON nesnesi olarak iletmek için kullanılan standart.

## K

**Key Vault**  
Gizli verileri, anahtarları ve sertifikaları güvenli bir şekilde saklamak ve yönetmek için Azure hizmeti.

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights ve diğer Azure hizmetlerindeki verileri analiz etmek için kullanılan sorgu dili.

## L

**Load Balancer**  
Gelen ağ trafiğini birden çok sunucu veya örnek arasında dağıtan hizmet.

**Log Analytics**  
Bulut ve kurum içi ortamlardan telemetri verilerini toplamak, analiz etmek ve harekete geçmek için Azure hizmeti.

## M

**Managed Identity**  
Azure hizmetlerine diğer Azure hizmetlerine kimlik doğrulama için otomatik olarak yönetilen bir kimlik sağlayan Azure özelliği.

**Microservices**  
Uygulamaların küçük, bağımsız hizmetler koleksiyonu olarak inşa edildiği mimari yaklaşım.

**Monitor**  
Uygulamalar ve altyapı genelinde tam yığın gözlemlenebilirlik sağlayan Azure'ın birleşik izleme çözümü.

## N

**Node.js**  
Sunucu tarafı uygulamalar oluşturmak için Chrome'un V8 JavaScript motoru üzerine inşa edilmiş JavaScript çalışma zamanı.

**npm**  
Bağımlılıkları ve paketleri yöneten Node.js için paket yöneticisi.

## O

**Output**  
Uygulama veya diğer kaynaklar tarafından kullanılabilen altyapı dağıtımından döndürülen değerler.

## P

**Package**  
Uygulama kodunu ve bağımlılıklarını dağıtıma hazırlama süreci.

**Parameters**  
Dağıtımları özelleştirmek için altyapı şablonlarına geçirilen giriş değerleri.

**PostgreSQL**  
Azure'da yönetilen hizmet olarak desteklenen açık kaynaklı ilişkisel veritabanı sistemi.

**Provisioning**  
Altyapı şablonlarında tanımlanan Azure kaynaklarını oluşturma ve yapılandırma süreci.

## Q

**Quota**  
Bir Azure aboneliğinde veya bölgede oluşturulabilecek kaynak miktarına ilişkin sınırlar.

## R

**Resource Group**  
Aynı yaşam döngüsünü, izinleri ve politikaları paylaşan Azure kaynakları için mantıksal kapsayıcı.

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
Stok Tutma Birimi. Azure kaynakları için farklı hizmet katmanlarını veya performans seviyelerini temsil eder.

**SQL Database**  
Microsoft SQL Server tabanlı Azure'ın yönetilen ilişkisel veritabanı hizmeti.

**Static Web Apps**  
Kaynak kod depolarından tam yığın web uygulamaları oluşturmak ve dağıtmak için Azure hizmeti.

**Storage Account**  
Bloblar, dosyalar, kuyruklar ve tablolar dahil veri nesneleri için bulut depolama sağlayan Azure hizmeti.

**Subscription**  
Faturalama ve erişim yönetimi ile ilişkili kaynak grupları ve kaynakları içeren Azure hesap kapsayıcısı.

## T

**Template**  
Uygulama kodu, altyapı tanımları ve yaygın senaryolar için yapılandırma içeren önceden oluşturulmuş proje yapısı.

**Terraform**  
Azure dahil birden çok bulut sağlayıcısını destekleyen açık kaynak Infrastructure as Code aracı.

**Traffic Manager**  
Küresel Azure bölgelerine trafik dağıtmak için DNS tabanlı trafik yük dengeleyicisi.

## U

**URI**  
Uniform Resource Identifier. Belirli bir kaynağı tanımlayan dize.

**URL**  
Uniform Resource Locator. Bir kaynağın nerede bulunduğunu ve nasıl alınacağını belirten URI türü.

## V

**Virtual Network (VNet)**  
Azure'da özel ağlar için temel yapı taşı olup izolasyon ve segmentasyon sağlar.

**VS Code**  
Visual Studio Code. Azure ve azd entegrasyonu için mükemmel desteğe sahip popüler kod düzenleyici.

## W

**Webhook**  
Belirli olaylarla tetiklenen HTTP geri çağırması; genellikle CI/CD boru hatlarında kullanılır.

**What-if**  
Bir dağıtımın gerçekten yürütülmeden hangi değişiklikleri yapacağını gösteren Azure özelliği.

## Y

**YAML**  
YAML Ain't Markup Language. azure.yaml gibi yapılandırma dosyaları için kullanılan insan tarafından okunabilir veri serileştirme standardı.

## Z

**Zone**  
Azure bölgesi içinde fiziksel olarak ayrılmış konumlar olup yedeklilik ve yüksek kullanılabilirlik sağlar.

---

## Yaygın Kısaltmalar

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Kimlik ve erişim yönetimi hizmeti |
| ACR | Azure Container Registry | Konteyner görüntü kayıt hizmeti |
| AKS | Azure Kubernetes Service | Yönetilen Kubernetes hizmeti |
| API | Application Programming Interface | Yazılım geliştirmek için protokoller kümesi |
| ARM | Azure Resource Manager | Azure'ın dağıtım ve yönetim hizmeti |
| CDN | Content Delivery Network | Sunucuların dağıtık ağı |
| CI/CD | Continuous Integration/Continuous Deployment | Otomatik geliştirme uygulamaları |
| CLI | Command Line Interface | Metin tabanlı kullanıcı arayüzü |
| DNS | Domain Name System | Alan adlarını IP adreslerine çevirme sistemi |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP'nin güvenli sürümü |
| IaC | Infrastructure as Code | Altyapıyı kod yoluyla yönetme |
| JSON | JavaScript Object Notation | Veri alışveriş formatı |
| JWT | JSON Web Token | Güvenli bilgi iletimi için token formatı |
| KQL | Kusto Query Language | Azure veri hizmetleri için sorgu dili |
| RBAC | Role-Based Access Control | Kullanıcı rollerine dayalı erişim kontrolü |
| REST | Representational State Transfer | Web servisleri için mimari stil |
| SDK | Software Development Kit | Geliştirme araçları koleksiyonu |
| SLA | Service Level Agreement | Hizmetin kullanılabilirlik/performans taahhüdü |
| SQL | Structured Query Language | İlişkisel veritabanlarını yönetme dili |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografik protokoller |
| URI | Uniform Resource Identifier | Bir kaynağı tanımlayan dize |
| URL | Uniform Resource Locator | Kaynağın konumunu belirten URI türü |
| VM | Virtual Machine | Bir bilgisayar sisteminin öykünmesi |
| VNet | Virtual Network | Azure'da özel ağ |
| YAML | YAML Ain't Markup Language | Veri serileştirme standardı |

---

## Azure Hizmet Adı Eşlemeleri

| Common Name | Official Azure Service Name | azd Host Type |
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
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Bağlama Özgü Terimler

### Geliştirme Terimleri
- **Hot Reload**: Geliştirme sırasında uygulamaları yeniden başlatmadan otomatik olarak güncelleme
- **Build Pipeline**: Kodu derlemek ve test etmek için otomatik süreç
- **Deployment Slot**: App Service içinde bir hazırlama (staging) ortamı
- **Environment Parity**: Geliştirme, hazırlama ve üretim ortamlarını benzer tutma

### Güvenlik Terimleri
- **Managed Identity**: Otomatik kimlik bilgisi yönetimi sağlayan Azure özelliği
- **Key Vault**: Gizli veriler, anahtarlar ve sertifikalar için güvenli depolama
- **RBAC**: Azure kaynakları için role dayalı erişim kontrolü
- **Network Security Group**: Ağ trafiğini kontrol etmek için sanal güvenlik duvarı

### İzleme Terimleri
- **Telemetry**: Ölçümlerin ve verilerin otomatik toplanması
- **Application Performance Monitoring (APM)**: Yazılım performansını izleme
- **Log Analytics**: Günlük verilerini toplamak ve analiz etmek için hizmet
- **Alert Rules**: Metriklere veya koşullara dayalı otomatik bildirimler

### Dağıtım Terimleri
- **Blue-Green Deployment**: Kesintisiz dağıtım stratejisi
- **Canary Deployment**: Kullanıcıların bir alt kümesine kademeli yayılım
- **Rolling Update**: Uygulama örneklerinin sırayla değiştirilmesi
- **Rollback**: Önceki uygulama sürümüne geri dönme

---

**Kullanım İpucu**: Hızlıca belirli terimleri aramak için `Ctrl+F` kullanın. Terimler gerektiğinde çapraz referanslanmıştır.

---

**Gezinme**
- **Önceki Ders**: [Cheat Sheet](cheat-sheet.md)
- **Sonraki Ders**: [SSS](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->