<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T20:36:23+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "tr"
}
-->
# Sözlük - Azure Developer CLI Terminolojisi

## Giriş

Bu kapsamlı sözlük, Azure Developer CLI ve Azure bulut geliştirme ile ilgili terimlerin, kavramların ve kısaltmaların tanımlarını sağlar. Teknik dokümantasyonu anlamak, sorunları gidermek ve azd projeleri ve Azure hizmetleri hakkında etkili bir şekilde iletişim kurmak için temel bir referanstır.

## Öğrenme Hedefleri

Bu sözlüğü kullanarak:
- Azure Developer CLI'nin temel terminolojisini ve kavramlarını anlayacaksınız
- Azure bulut geliştirme sözlüğünü ve teknik terimleri öğreneceksiniz
- Kod olarak Altyapı ve dağıtım terminolojisini verimli bir şekilde referans alacaksınız
- Azure hizmet adlarını, kısaltmalarını ve amaçlarını kavrayacaksınız
- Sorun giderme ve hata ayıklama terminolojisi için tanımlara erişeceksiniz
- İleri düzey Azure mimarisi ve geliştirme kavramlarını öğreneceksiniz

## Öğrenme Çıktıları

Bu sözlüğe düzenli olarak başvurarak:
- Doğru Azure Developer CLI terminolojisini kullanarak etkili bir şekilde iletişim kurabileceksiniz
- Teknik dokümantasyonu ve hata mesajlarını daha net anlayabileceksiniz
- Azure hizmetlerini ve kavramlarını güvenle gezinebileceksiniz
- Sorunları uygun teknik sözlük kullanarak giderebileceksiniz
- Takım tartışmalarına doğru teknik dil ile katkıda bulunabileceksiniz
- Azure bulut geliştirme bilginizi sistematik olarak genişletebileceksiniz

## A

**ARM Template**  
Azure Resource Manager şablonu. Azure kaynaklarını deklaratif olarak tanımlamak ve dağıtmak için kullanılan JSON tabanlı Kod olarak Altyapı formatı.

**App Service**  
Web uygulamalarını, REST API'lerini ve mobil arka uçlarını altyapıyı yönetmeden barındırmak için Azure'ın platform hizmeti (PaaS).

**Application Insights**  
Uygulama performansı, kullanılabilirlik ve kullanım hakkında derinlemesine bilgi sağlayan Azure'ın uygulama performansı izleme (APM) hizmeti.

**Azure CLI**  
Azure kaynaklarını yönetmek için komut satırı arayüzü. Azd tarafından kimlik doğrulama ve bazı işlemler için kullanılır.

**Azure Developer CLI (azd)**  
Azure'a uygulama oluşturma ve dağıtma sürecini şablonlar ve Kod olarak Altyapı kullanarak hızlandıran geliştirici odaklı komut satırı aracı.

**azure.yaml**  
Bir azd projesi için hizmetleri, altyapıyı ve dağıtım kancalarını tanımlayan ana yapılandırma dosyası.

**Azure Resource Manager (ARM)**  
Azure kaynaklarını oluşturmak, güncellemek ve silmek için bir yönetim katmanı sağlayan Azure'ın dağıtım ve yönetim hizmeti.

## B

**Bicep**  
Microsoft tarafından Azure kaynaklarını dağıtmak için geliştirilen alan özel dili (DSL). ARM şablonlarına kıyasla daha basit bir sözdizimi sağlar ve ARM'a derlenir.

**Build**  
Kaynak kodunu derleme, bağımlılıkları yükleme ve uygulamaları dağıtıma hazırlama süreci.

**Blue-Green Deployment**  
Kesinti süresini ve riski en aza indirmek için iki özdeş üretim ortamı (mavi ve yeşil) kullanan bir dağıtım stratejisi.

## C

**Container Apps**  
Karmaşık altyapıyı yönetmeden konteynerleştirilmiş uygulamaları çalıştırmayı sağlayan Azure'ın sunucusuz konteyner hizmeti.

**CI/CD**  
Sürekli Entegrasyon/Sürekli Dağıtım. Kod değişikliklerini entegre etmek ve uygulamaları dağıtmak için otomatikleştirilmiş uygulamalar.

**Cosmos DB**  
Kapsamlı SLA'lar (verim, gecikme, kullanılabilirlik ve tutarlılık) sağlayan Azure'ın küresel olarak dağıtılmış, çok modelli veritabanı hizmeti.

**Configuration**  
Uygulama davranışını ve dağıtım seçeneklerini kontrol eden ayarlar ve parametreler.

## D

**Deployment**  
Uygulamaları ve bağımlılıklarını hedef altyapıya yükleme ve yapılandırma süreci.

**Docker**  
Konteynerleştirme teknolojisini kullanarak uygulamaları geliştirme, gönderme ve çalıştırma platformu.

**Dockerfile**  
Bir Docker konteyner görüntüsü oluşturmak için talimatlar içeren metin dosyası.

## E

**Environment**  
Uygulamanızın belirli bir örneğini temsil eden bir dağıtım hedefi (ör. geliştirme, test, üretim).

**Environment Variables**  
Uygulamaların çalışma zamanında erişebileceği anahtar-değer çiftleri olarak depolanan yapılandırma değerleri.

**Endpoint**  
Bir uygulama veya hizmetin erişilebileceği URL veya ağ adresi.

## F

**Function App**  
Altyapıyı yönetmeden olay odaklı kod çalıştırmayı sağlayan Azure'ın sunucusuz hesaplama hizmeti.

## G

**GitHub Actions**  
GitHub depolarıyla entegre CI/CD platformu, iş akışlarını otomatikleştirmek için kullanılır.

**Git**  
Kaynak kodundaki değişiklikleri izlemek için kullanılan dağıtılmış sürüm kontrol sistemi.

## H

**Hooks**  
Dağıtım yaşam döngüsü sırasında belirli noktalarda çalışan özel komut dosyaları veya komutlar (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Bir uygulamanın dağıtılacağı Azure hizmet türü (ör. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Altyapıyı manuel süreçler yerine kod aracılığıyla tanımlama ve yönetme uygulaması.

**Init**  
Genellikle bir şablondan yeni bir azd projesi başlatma süreci.

## J

**JSON**  
JavaScript Object Notation. Yapılandırma dosyaları ve API yanıtları için yaygın olarak kullanılan veri değişim formatı.

**JWT**  
JSON Web Token. Bilgiyi JSON nesnesi olarak güvenli bir şekilde iletmek için standart.

## K

**Key Vault**  
Gizli bilgiler, anahtarlar ve sertifikaları güvenli bir şekilde depolamak ve yönetmek için Azure hizmeti.

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights ve diğer Azure hizmetlerinde veri analiz etmek için kullanılan sorgu dili.

## L

**Load Balancer**  
Gelen ağ trafiğini birden fazla sunucu veya örnek arasında dağıtan hizmet.

**Log Analytics**  
Bulut ve şirket içi ortamlardan telemetri verilerini toplamak, analiz etmek ve bunlara göre hareket etmek için Azure hizmeti.

## M

**Managed Identity**  
Azure hizmetlerinin diğer Azure hizmetlerine kimlik doğrulaması için otomatik olarak yönetilen bir kimlik sağlayan Azure özelliği.

**Microservices**  
Uygulamaların küçük, bağımsız hizmetler koleksiyonu olarak oluşturulduğu mimari yaklaşım.

**Monitor**  
Uygulamalar ve altyapı genelinde tam yığın gözlemlenebilirlik sağlayan Azure'ın birleşik izleme çözümü.

## N

**Node.js**  
Sunucu tarafı uygulamalar oluşturmak için Chrome'un V8 JavaScript motoru üzerine inşa edilmiş JavaScript çalışma zamanı.

**npm**  
Node.js için bağımlılıkları ve paketleri yöneten paket yöneticisi.

## O

**Output**  
Uygulamalar veya diğer kaynaklar tarafından kullanılabilecek altyapı dağıtımından döndürülen değerler.

## P

**Package**  
Uygulama kodunu ve bağımlılıklarını dağıtıma hazırlama süreci.

**Parameters**  
Dağıtımları özelleştirmek için altyapı şablonlarına geçirilen giriş değerleri.

**PostgreSQL**  
Azure'da yönetilen bir hizmet olarak desteklenen açık kaynaklı ilişkisel veritabanı sistemi.

**Provisioning**  
Altyapı şablonlarında tanımlanan Azure kaynaklarını oluşturma ve yapılandırma süreci.

## Q

**Quota**  
Bir Azure aboneliği veya bölgesinde oluşturulabilecek kaynak miktarına ilişkin sınırlar.

## R

**Resource Group**  
Aynı yaşam döngüsünü, izinleri ve politikaları paylaşan Azure kaynakları için mantıksal kapsayıcı.

**Resource Token**  
Kaynak adlarının dağıtımlar arasında benzersiz olmasını sağlamak için azd tarafından oluşturulan benzersiz dize.

**REST API**  
HTTP yöntemlerini kullanarak ağ uygulamaları tasarlamak için mimari stil.

**Rollback**  
Bir uygulamanın veya altyapı yapılandırmasının önceki bir sürümüne geri dönme süreci.

## S

**Service**  
Azure.yaml dosyasında tanımlanan uygulamanızın bir bileşeni (ör. web ön yüzü, API arka ucu, veritabanı).

**SKU**  
Stok Tutma Birimi. Azure kaynakları için farklı hizmet katmanlarını veya performans seviyelerini temsil eder.

**SQL Database**  
Microsoft SQL Server'a dayalı Azure'ın yönetilen ilişkisel veritabanı hizmeti.

**Static Web Apps**  
Kaynak kodu depolarından tam yığın web uygulamaları oluşturmak ve dağıtmak için Azure hizmeti.

**Storage Account**  
Bloblar, dosyalar, kuyruklar ve tablolar dahil olmak üzere veri nesneleri için bulut depolama sağlayan Azure hizmeti.

**Subscription**  
Kaynak gruplarını ve kaynakları tutan, ilgili faturalama ve erişim yönetimi ile Azure hesap kapsayıcısı.

## T

**Template**  
Uygulama kodu, altyapı tanımları ve yaygın senaryolar için yapılandırma içeren önceden oluşturulmuş proje yapısı.

**Terraform**  
Azure dahil olmak üzere birden fazla bulut sağlayıcısını destekleyen açık kaynaklı Kod olarak Altyapı aracı.

**Traffic Manager**  
Küresel Azure bölgeleri arasında trafiği dağıtmak için Azure'ın DNS tabanlı trafik yük dengeleyicisi.

## U

**URI**  
Uniform Resource Identifier. Belirli bir kaynağı tanımlayan dize.

**URL**  
Uniform Resource Locator. Bir kaynağın nerede bulunduğunu ve nasıl alınacağını belirten URI türü.

## V

**Virtual Network (VNet)**  
Azure'da özel ağlar için temel yapı taşı, izolasyon ve segmentasyon sağlar.

**VS Code**  
Visual Studio Code. Azure ve azd ile mükemmel entegrasyona sahip popüler kod editörü.

## W

**Webhook**  
Genellikle CI/CD iş akışlarında kullanılan, belirli olaylar tarafından tetiklenen HTTP geri çağrısı.

**What-if**  
Bir dağıtımın gerçekleştirilmeden önce hangi değişikliklerin yapılacağını gösteren Azure özelliği.

## Y

**YAML**  
YAML Ain't Markup Language. Azure.yaml gibi yapılandırma dosyaları için kullanılan insan tarafından okunabilir veri serileştirme standardı.

## Z

**Zone**  
Yüksek kullanılabilirlik ve yedeklilik sağlayan bir Azure bölgesindeki fiziksel olarak ayrı konumlar.

---

## Yaygın Kısaltmalar

| Kısaltma | Tam Açılım | Açıklama |
|----------|------------|----------|
| AAD | Azure Active Directory | Kimlik ve erişim yönetimi hizmeti |
| ACR | Azure Container Registry | Konteyner görüntü kayıt hizmeti |
| AKS | Azure Kubernetes Service | Yönetilen Kubernetes hizmeti |
| API | Application Programming Interface | Yazılım oluşturma protokolleri |
| ARM | Azure Resource Manager | Azure'ın dağıtım ve yönetim hizmeti |
| CDN | Content Delivery Network | Dağıtılmış sunucu ağı |
| CI/CD | Continuous Integration/Continuous Deployment | Otomatik geliştirme uygulamaları |
| CLI | Command Line Interface | Metin tabanlı kullanıcı arayüzü |
| DNS | Domain Name System | Alan adlarını IP adreslerine çeviren sistem |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP'nin güvenli versiyonu |
| IaC | Infrastructure as Code | Altyapıyı kod aracılığıyla yönetme |
| JSON | JavaScript Object Notation | Veri değişim formatı |
| JWT | JSON Web Token | Güvenli bilgi iletimi için token formatı |
| KQL | Kusto Query Language | Azure veri hizmetleri için sorgu dili |
| RBAC | Role-Based Access Control | Kullanıcı rolleri temelinde erişim kontrol yöntemi |
| REST | Representational State Transfer | Web hizmetleri için mimari stil |
| SDK | Software Development Kit | Geliştirme araçları koleksiyonu |
| SLA | Service Level Agreement | Hizmet kullanılabilirliği/performansı taahhüdü |
| SQL | Structured Query Language | İlişkisel veritabanlarını yönetme dili |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografik protokoller |
| URI | Uniform Resource Identifier | Kaynağı tanımlayan dize |
| URL | Uniform Resource Locator | Kaynak konumunu belirten URI türü |
| VM | Virtual Machine | Bilgisayar sisteminin emülasyonu |
| VNet | Virtual Network | Azure'da özel ağ |
| YAML | YAML Ain't Markup Language | Veri serileştirme standardı |

---

## Azure Hizmet Adı Eşleştirmeleri

| Yaygın Ad | Resmi Azure Hizmet Adı | azd Host Türü |
|-----------|------------------------|---------------|
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
- **Hot Reload**: Uygulamaları geliştirme sırasında yeniden başlatmadan otomatik olarak güncelleme
- **Build Pipeline**: Kod oluşturma ve test etme için otomatik süreç
- **Deployment Slot**: Bir App Service içinde test ortamı
- **Environment Parity**: Geliştirme, test ve üretim ortamlarını benzer tutma

### Güvenlik Terimleri
- **Managed Identity**: Otomatik kimlik bilgisi yönetimi sağlayan Azure özelliği
- **Key Vault**: Gizli bilgiler, anahtarlar ve sertifikalar için güvenli depolama
- **RBAC**: Azure kaynakları için rol tabanlı erişim kontrolü
- **Network Security Group**: Ağ trafiğini kontrol etmek için sanal güvenlik duvarı

### İzleme Terimleri
- **Telemetry**: Ölçümler ve verilerin otomatik olarak toplanması
- **Application Performance Monitoring (APM)**: Yazılım performansını izleme
- **Log Analytics**: Günlük verilerini toplama ve analiz etme hizmeti
- **Alert Rules**: Metriklere veya koşullara dayalı otomatik bildirimler

### Dağıtım Terimleri
- **Blue-Green Deployment**: Kesinti süresi olmadan dağıtım stratejisi
- **Canary Deployment**: Kullanıcıların bir alt kümesine kademeli olarak dağıtım
- **Rolling Update**: Uygulama örneklerinin sırayla değiştirilmesi
- **Rollback**: Önceki uygulama sürümüne geri dönme

---

**Kullanım İpucu**: Bu sözlükte belirli terimleri hızlıca aramak için `Ctrl+F` kullanın. Terimler uygun olduğunda çapraz referanslanmıştır.

---

**Navigasyon**
- **Önceki Ders**: [Cheat Sheet](cheat-sheet.md)
- **Sonraki Ders**: [FAQ](faq.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.