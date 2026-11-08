# Sözlük - Azure ve AZD Terimleri

**Tüm Bölümler İçin Referans**
- **📚 Kurs Anasayfası**: [Yeni Başlayanlar İçin AZD](../README.md)
- **📖 Temel Öğrenme**: [Bölüm 1: AZD Temelleri](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Yapay Zeka Terimleri**: [Bölüm 2: AI-Öncelikli Geliştirme](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Bu kapsamlı sözlük, Azure Developer CLI ve Azure bulut geliştirmede kullanılan terimlerin, kavramların ve kısaltmaların tanımlarını sunar. Teknik dokümantasyonu anlamak, sorunları gidermek ve azd projeleri ile Azure hizmetleri hakkında etkili iletişim kurmak için temel bir referanstır.

## Öğrenme Hedefleri

Bu sözlüğü kullanarak:
- Temel Azure Developer CLI terminolojisi ve kavramlarını anlayacaksınız
- Azure bulut geliştirme kelime dağarcığı ve teknik terimleri ustaca öğreneceksiniz
- Altyapı Kod Olarak ve dağıtım terimlerine verimli şekilde başvuracaksınız
- Azure hizmet adlarını, kısaltmalarını ve amaçlarını kavrayacaksınız
- Sorun giderme ve hata ayıklama terminolojisinin tanımlarına erişeceksiniz
- Gelişmiş Azure mimarisi ve geliştirme kavramlarını öğreneceksiniz

## Öğrenim Çıktıları

Bu sözlüğe düzenli başvurarak:
- Doğru Azure Developer CLI terminolojisini kullanarak etkili iletişim kurabileceksiniz
- Teknik dokümantasyon ve hata mesajlarını daha net anlayacaksınız
- Azure hizmetleri ve kavramlarında kendinden emin şekilde gezinebileceksiniz
- Sorunları uygun teknik kelime dağarcığı ile çözebileceksiniz
- Takım tartışmalarına doğru teknik dil ile katkıda bulunabileceksiniz
- Azure bulut geliştirme bilginizi sistematik olarak genişletebileceksiniz

## A

**ARM Şablonu**  
Azure Resource Manager şablonu. Azure kaynaklarını bildirgesel olarak tanımlamak ve dağıtmak için kullanılan JSON tabanlı Altyapı Kod formatı.

**Uygulama Hizmeti**  
Altyapır yönetimi olmadan web uygulamaları, REST API'leri ve mobil arka uçları barındırmak için Azure’un platform hizmeti (PaaS) sunumu.

**Application Insights**  
Uygulama performansı, kullanılabilirlik ve kullanımına derinlemesine bakış sağlayan Azure uygulama performans izleme (APM) hizmeti.

**Azure CLI**  
Azure kaynaklarını yönetmek için komut satırı arayüzü. AZD'yi tamamlar ama ayrı bir giriş yapısı vardır; ana AZD kimlik doğrulaması `azd auth login` kullanır.

**Azure Developer CLI (azd)**  
Şablonlar ve Altyapı Kod ile Azure'a uygulama oluşturma ve dağıtma sürecini hızlandıran geliştirici odaklı komut satırı aracı.

**azure.yaml**  
Hizmetleri, altyapıyı ve dağıtım kancalarını tanımlayan bir azd projesinin ana yapılandırma dosyası.

**Azure Resource Manager (ARM)**  
Kaynak oluşturma, güncelleme ve silme işlemleri için yönetim katmanı sağlayan Azure dağıtım ve yönetim hizmeti.

## B

**Bicep**  
Microsoft tarafından Azure kaynaklarını dağıtmak için geliştirilen alan özel dili (DSL). ARM şablonlarından daha basit sözdizimi sunar ancak ARM'a derlenir.

**Derleme**  
Kaynak kodun derlenmesi, bağımlılıkların yüklenmesi ve uygulamaların dağıtıma hazırlanması süreci.

**Mavi-Yeşil Dağıtım**  
Kesinti ve riski en aza indirmek için iki aynı üretim ortamı (mavi ve yeşil) kullanılan dağıtım stratejisi.

## C

**Kapsayıcı Uygulamalar**  
Karmaşık altyapı yönetimi olmadan kapsayıcı uygulamaların çalıştırılmasını sağlayan Azure'un sunucusuz konteyner hizmeti.

**CI/CD**  
Sürekli Entegrasyon/Sürekli Dağıtım. Kod değişikliklerinin entegre edilmesi ve uygulamaların dağıtımı için otomatik uygulamalar.

**Cosmos DB**  
Küresel dağıtımlı, çok modelleri destekleyen, işlem hızı, gecikme, kullanılabilirlik ve tutarlılık için kapsamlı SLA’lar sunan Azure veri tabanı hizmeti.

**Yapılandırma**  
Uygulama davranışı ve dağıtım seçeneklerini kontrol eden ayarlar ve parametreler.

## D

**Dağıtım**  
Uygulamaların ve bağımlılıklarının hedef altyapıya kurulması ve yapılandırılması süreci.

**Docker**  
Kapsayıcı teknolojisi kullanarak uygulamaların geliştirilmesi, gönderilmesi ve çalıştırılması için platform.

**Dockerfile**  
Docker konteyner imajı oluşturmak için talimatlar içeren metin dosyası.

## E

**Ortam**  
Uygulamanızın belirli bir örneğini temsil eden dağıtım hedefi (örneğin, geliştirme, test, üretim).

**Ortam Değişkenleri**  
Uygulamaların çalışma zamanında erişebileceği anahtar-değer çiftleri şeklinde saklanan yapılandırma değerleri.

**Uç Nokta**  
Bir uygulama veya hizmete erişim sağlanan URL ya da ağ adresi.

## F

**Function App**  
Altyapı yönetmeden olay odaklı kod çalıştırmayı sağlayan Azure sunucusuz hesaplama hizmeti.

## G

**GitHub Actions**  
İş akışlarını otomatikleştirmek için GitHub depo entegrasyonlu CI/CD platformu.

**Git**  
Kaynak kod değişikliklerini takip etmek için kullanılan dağıtık sürüm kontrol sistemi.

## H

**Kancalar**  
Dağıtım yaşam döngüsünün belirli aşamalarında (ön sağlama, sonrası sağlama, ön dağıtım, sonrası dağıtım) çalışan özel betikler veya komutlar.

**Barındırıcı**  
Bir uygulamanın dağıtılacağı Azure hizmet türü (örneğin, appservice, containerapp, function).

## I

**Altyapı Kod Olarak (IaC)**  
Altyapıyı elle değil kod yoluyla tanımlama ve yönetme uygulaması.

**Init**  
Genellikle bir şablondan yeni bir azd projesi başlatma işlemi.

## J

**JSON**  
JavaScript Nesne Gösterimi. Yaygın olarak yapılandırma dosyaları ve API yanıtları için kullanılan veri değişim formatı.

**JWT**  
JSON Web Token. Taraflar arasında bilgiyi güvenli şekilde JSON objesi olarak iletmek için standart.

## K

**Anahtar Kasası**  
Sırlar, anahtarlar ve sertifikaları güvenli şekilde depolayıp yöneten Azure hizmeti.

**Kusto Sorgu Dili (KQL)**  
Azure Monitor, Application Insights ve diğer Azure hizmetlerindeki verilere sorgu yazmak için kullanılan dil.

## L

**Yük Dengeleyici**  
Gelen ağ trafiğini birden fazla sunucu veya örnek arasında dağıtan hizmet.

**Log Analytics**  
Bulut ve yerel ortamlardan telemetri verisi toplama, analiz etme ve işlem yapma için Azure hizmeti.

## M

**Yönetilen Kimlik**  
Azure hizmetlerinin diğer Azure hizmetlerine kimlik doğrulama için otomatik olarak yönetilen kimlik sağlaması özelliği.

**Mikroservisler**  
Uygulamaların küçük, bağımsız hizmetler koleksiyonu olarak inşa edildiği mimari yaklaşım.

**Monitor**  
Uygulamalar ve altyapı genelinde tam görünürlük sağlayan Azure’un birleşik izleme çözümü.

## N

**Node.js**  
Chrome'un V8 JavaScript motoru üzerine kurulu, sunucu tarafı uygulama geliştirme için JavaScript çalışma zamanı.

**npm**  
Node.js için bağımlılık ve paket yöneticisi.

## O

**Çıktı**  
Altyapı dağıtımından dönen, uygulamalar veya diğer kaynaklar tarafından kullanılabilen değerler.

## P

**Paket**  
Uygulama kodu ve bağımlılıkların dağıtıma hazırlanması süreci.

**Parametreler**  
Dağıtımları özelleştirmek için altyapı şablonlarına geçirilen giriş değerleri.

**PostgreSQL**  
Azure'da yönetilen hizmet olarak desteklenen açık kaynak ilişkisel veri tabanı sistemi.

**Sağlama**  
Altyapı şablonlarında tanımlanan Azure kaynaklarının oluşturulup yapılandırılması süreci.

## Q

**Kotayı**  
Bir Azure aboneliğinde veya bölgesinde oluşturulabilecek kaynak miktarına getirilen sınırlar.

## R

**Kaynak Grubu**  
Aynı yaşam döngüsü, izinler ve politikaları paylaşan Azure kaynakları için mantıksal konteyner.

**Kaynak Tokenı**  
Dağıtımlar arasında kaynak adlarının benzersiz olmasını sağlamak için azd tarafından oluşturulan benzersiz dize.

**REST API**  
HTTP yöntemleri kullanarak ağ uygulamaları tasarlamak için mimari stil.

**Geri Alma**  
Bir uygulama veya altyapı yapılandırmasının önceki sürümüne dönme süreci.

## S

**Hizmet**  
azure.yaml dosyasında tanımlanan uygulamanızın bir bileşeni (örneğin, web ön yüzü, API arka ucu, veri tabanı).

**SKU**  
Stok Tutma Birimi. Azure kaynakları için farklı hizmet katmanları veya performans seviyelerini temsil eder.

**SQL Veritabanı**  
Microsoft SQL Server'a dayalı Azure'un yönetilen ilişkisel veritabanı hizmeti.

**Statik Web Uygulamaları**  
Kaynak kod depolarından tam yığın web uygulamaları oluşturmak ve dağıtmak için Azure hizmeti.

**Depolama Hesabı**  
Azure’un bloblar, dosyalar, kuyruklar ve tablolar dahil veri nesneleri için bulut depolaması sağlayan hizmeti.

**Abonelik**  
Kaynak gruplarını ve kaynakları içeren, faturalama ve erişim yönetimiyle ilişkili Azure hesap konteyneri.

## T

**Şablon**  
Uygulama kodu, altyapı tanımları ve yaygın senaryolar için yapılandırma içeren önceden oluşturulmuş proje yapısı.

**Terraform**  
Azure dahil birden çok bulut sağlayıcısını destekleyen açık kaynak Altyapı Kod Aracı.

**Trafik Yöneticisi**  
Küresel Azure bölgeleri arasında trafiği dağıtmak için Azure'un DNS tabanlı trafik yük dengeleyicisi.

## U

**URI**  
Tekdüzen Kaynak Tanımlayıcısı. Belirli bir kaynağı tanımlayan dize.

**URL**  
Tekdüzen Kaynak Konumlayıcısı. Bir kaynağın nerede olduğu ve nasıl alınacağı bilgisini belirten URI türü.

## V

**Sanal Ağ (VNet)**  
Azure'daki özel ağlar için temel yapı taşı, izolasyon ve segmentasyon sağlar.

**VS Code**  
Visual Studio Code. Azure ve azd entegrasyonu ile popüler kod editörü.

## W

**Webhook**  
Belirli olaylarla tetiklenen HTTP geri çağrısı, genellikle CI/CD boru hattında kullanılır.

**Ne Olur**  
Bir dağıtımın hangi değişiklikleri yapacağını gerçek çalıştırmadan gösteren Azure özelliği.

## Y

**YAML**  
YAML Bir İşaretleme Dili Değildir. azure.yaml gibi yapılandırma dosyalarında kullanılan insan tarafından okunabilir veri serileştirme standardı.

## Z

**Bölge**  
Azure bölgesinde yedeklilik ve yüksek kullanılabilirlik sağlayan fiziksel olarak ayrılmış konumlar.

---

## Yaygın Kısaltmalar

| Kısaltma | Tam Adı | Açıklama |
|---------|-----------|-------------|
| AAD | Azure Active Directory (şimdi Microsoft Entra ID) | Kimlik ve erişim yönetim hizmeti |
| ACR | Azure Container Registry | Kapsayıcı imajı kayıt hizmeti |
| AKS | Azure Kubernetes Service | Yönetilen Kubernetes hizmeti |
| API | Application Programming Interface | Yazılım oluşturmak için protokoller seti |
| ARM | Azure Resource Manager | Azure’un dağıtım ve yönetim hizmeti |
| CDN | Content Delivery Network | Dağıtık sunucu ağı |
| CI/CD | Sürekli Entegrasyon/Sürekli Dağıtım | Otomatik geliştirme uygulamaları |
| CLI | Komut Satırı Arayüzü | Metin tabanlı kullanıcı arayüzü |
| DNS | Domain Name System | Alan adlarını IP adreslerine çevirme sistemi |
| HTTPS | Hypertext Transfer Protocol Secure | Güvenli HTTP versiyonu |
| IaC | Infrastructure as Code | Altyapıyı kodla yönetme |
| JSON | JavaScript Object Notation | Veri değişim formatı |
| JWT | JSON Web Token | Güvenli bilgi iletimi için token formatı |
| KQL | Kusto Query Language | Azure veri hizmetleri için sorgu dili |
| RBAC | Role-Based Access Control | Kullanıcı rollerine dayalı erişim kontrolü |
| REST | Representational State Transfer | Web servisleri için mimari stil |
| SDK | Software Development Kit | Geliştirme araçları koleksiyonu |
| SLA | Service Level Agreement | Hizmet kullanılabilirlik / performans taahhüdü |
| SQL | Structured Query Language | İlişkisel veritabanları için dil |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kriptografik protokoller |
| URI | Uniform Resource Identifier | Kaynağı tanımlayan dize |
| URL | Uniform Resource Locator | Kaynak konumunu belirten URI türü |
| VM | Sanal Makine | Bilgisayar sistemi emülasyonu |
| VNet | Sanal Ağ | Azure’da özel ağ |
| YAML | YAML Bir İşaretleme Dili Değildir | Veri serileştirme standardı |

---

## Azure Hizmet Adı Eşlemeleri

| Yaygın Ad | Resmi Azure Hizmet Adı | azd Barındırıcı Türü |
|-------------|------------------------------|---------------|
| Web Uygulaması | Azure App Service | `appservice` |
| API Uygulaması | Azure App Service | `appservice` |
| Kapsayıcı Uygulama | Azure Container Apps | `containerapp` |
| Fonksiyon | Azure Functions | `function` |
| Statik Site | Azure Static Web Apps | `staticwebapp` |
| Veritabanı | Azure Database for PostgreSQL | Altyapı kaynağı, uygulama değil `host` |
| NoSQL Veritabanı | Azure Cosmos DB | Altyapı kaynağı, uygulama değil `host` |
| Depolama | Azure Storage Account | Altyapı kaynağı, yerleşik uygulama değil `host` |
| Önbellek | Azure Managed Redis | Altyapı kaynağı, uygulama değil `host` |
| Arama | Azure AI Search | Altyapı kaynağı, uygulama değil `host` |
| Mesajlaşma | Azure Service Bus | Altyapı kaynağı, uygulama değil `host` |

`services.<name>.host`, bir uygulama dağıtım hedefini seçer; herhangi bir Azure kaynak türü için kısaltma değildir. Veritabanları, önbellekler, arama hizmetleri ve kuyruklar genellikle altyapı sağlayıcısı aracılığıyla sağlanır ve çıktılar/yapılandırma yoluyla uygulamaya bağlanır.

---

## Bağlama Özgü Terimler

### Geliştirme Terimleri
- **Sıcak Yeniden Yükleme**: Yeniden başlatmadan geliştirme sırasında uygulamayı otomatik olarak güncelleme
- **Derleme Boru Hattı**: Kodu derleyip test etmek için otomatik süreç
- **Dağıtım Yuvası**: App Service içinde hazırlık ortamı
- **Ortam Paritesi**: Geliştirme, hazırlık ve üretim ortamlarını benzer tutma

### Güvenlik Terimleri
- **Yönetilen Kimlik**: Otomatik kimlik bilgisi yönetimi sağlayan Azure özelliği
- **Anahtar Kasası**: Sırlar, anahtarlar ve sertifikalar için güvenli depolama
- **RBAC**: Azure kaynakları için rol tabanlı erişim kontrolü
- **Ağ Güvenlik Grubu**: Ağ trafiğini kontrol eden sanal güvenlik duvarı

### İzleme Terimleri
- **Telemetri**: Ölçümler ve verilerin otomatik toplanması
- **Uygulama Performans İzleme (APM)**: Yazılım performansını izleme
- **Log Analytics**: Günlük verilerini toplama ve analiz etme hizmeti
- **Alarm Kuralları**: Ölçümler veya koşullara dayalı otomatik bildirimler

### Dağıtım Terimleri
- **Mavi-Yeşil Dağıtım**: Sıfır kesintiyle dağıtım stratejisi
- **Kanarya Dağıtımı**: Kullanıcıların alt kümesine kademeli yayın
- **Döner Güncelleme**: Uygulama örneklerinin sırayla değiştirilmesi
- **Geri Alma**: Önceki uygulama sürümüne dönme

---

**Kullanım İpucu**: Bu sözlükte belirli terimleri hızla aramak için `Ctrl+F` kullanın. Terimler ilgili yerlerde çapraz referanslanmıştır.

---

**Gezinme**
- **Önceki Ders**: [Hızlı Başvuru](cheat-sheet.md)
- **Sonraki Ders**: [SSS](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->