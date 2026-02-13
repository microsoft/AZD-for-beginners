# İlk Projeniz - Uygulamalı Öğretici

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zekâ Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

İlk Azure Developer CLI projenize hoş geldiniz! Bu kapsamlı uygulamalı öğretici, azd kullanarak Azure üzerinde tam yığın bir uygulama oluşturma, dağıtma ve yönetme adımlarını eksiksiz bir şekilde açıklar. React ön yüzü, Node.js API arka ucu ve MongoDB veritabanı içeren gerçek bir yapılacaklar uygulaması ile çalışacaksınız.

## Öğrenme Hedefleri

Bu öğreticiyi tamamlayarak:
- Şablonlar kullanarak azd proje başlatma iş akışında ustalaşacaksınız
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Altyapı sağlama ile birlikte uygulamanın tamamını Azure'a dağıtabileceksiniz
- Uygulama güncellemeleri ve yeniden dağıtım stratejilerini uygulayabileceksiniz
- Geliştirme ve hazırlık için birden fazla ortamı yöneteceksiniz
- Kaynak temizleme ve maliyet yönetimi uygulamalarını uygulayacaksınız

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Şablonlardan bağımsız olarak azd projeleri başlatıp yapılandırmak
- azd proje yapılarını etkili bir şekilde gezip değiştirmek
- Tek komutlarla Azure'a tam yığın uygulamalar dağıtmak
- Yaygın dağıtım sorunlarını ve kimlik doğrulama problemlerini gidermek
- Farklı dağıtım aşamaları için birden fazla Azure ortamını yönetmek
- Uygulama güncellemeleri için sürekli dağıtım iş akışları uygulamak

## Başlarken

### Gereksinimler Kontrol Listesi
- ✅ Azure Developer CLI yüklü ([Kurulum Kılavuzu](installation.md))
- ✅ Azure CLI yüklü ve kimlik doğrulaması yapılmış
- ✅ Bilgisayarınızda Git yüklü
- ✅ Node.js 16+ (bu ders için)
- ✅ Visual Studio Code (önerilir)

### Kurulumu Doğrulayın
```bash
# azd kurulumunu kontrol et
azd version
```
### Azure kimlik doğrulamasını doğrulayın

```bash
az account show
```

### Node.js sürümünü kontrol edin
```bash
node --version
```

## Adım 1: Bir Şablon Seçin ve Başlatın

React ön yüzü ve Node.js API arka ucu içeren popüler bir yapılacaklar uygulaması şablonu ile başlayalım.

```bash
# Kullanılabilir şablonlara göz atın
azd template list

# Yapılacaklar uygulaması şablonunu başlatın
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Yönlendirmeleri izleyin:
# - Bir ortam adı girin: "dev"
# - Bir abonelik seçin (birden fazla varsa)
# - Bir bölge seçin: "East US 2" (veya tercih ettiğiniz bölge)
```

### Şimdi Ne Oldu?
- Şablon kodu yerel dizininize indirildi
- Servis tanımlarını içeren `azure.yaml` dosyası oluşturuldu
- Altyapı kodu `infra/` dizininde ayarlandı
- Bir ortam yapılandırması oluşturuldu

## Adım 2: Proje Yapısını Keşfedin

azd'nin bizim için neler oluşturduğunu inceleyelim:

```bash
# Proje yapısını görüntüle
tree /f   # Windows
# veya
find . -type f | head -20   # macOS/Linux
```

Şu öğeleri görmelisiniz:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Anlaşılması Gereken Önemli Dosyalar

**azure.yaml** - azd projenizin kalbi:
```bash
# Proje yapılandırmasını görüntüle
cat azure.yaml
```

**infra/main.bicep** - Altyapı tanımı:
```bash
# Altyapı kodunu görüntüle
head -30 infra/main.bicep
```

## Adım 3: Projenizi Özelleştirin (İsteğe Bağlı)

Dağıtmadan önce uygulamayı özelleştirebilirsiniz:

### Önyüzü Değiştirin
```bash
# React uygulaması bileşenini aç
code src/web/src/App.tsx
```

Basit bir değişiklik yapın:
```typescript
// Başlığı bulun ve değiştirin
<h1>My Awesome Todo App</h1>
```

### Ortam Değişkenlerini Yapılandırın
```bash
# Özel ortam değişkenleri ayarla
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tüm ortam değişkenlerini görüntüle
azd env get-values
```

## Adım 4: Azure'a Dağıtın

Şimdi heyecan verici kısım - her şeyi Azure'a dağıtın!

```bash
# Altyapıyı ve uygulamayı dağıt
azd up

# Bu komut şunları yapacaktır:
# 1. Azure kaynaklarını sağlar (App Service, Cosmos DB vb.)
# 2. Uygulamanızı der
# 3. Sağlanan kaynaklara uygulamayı dağıtır
# 4. Uygulamanın URL'sini gösterir
```

### Dağıtım Sırasında Neler Oluyor?

`azd up` komutu şu adımları gerçekleştirir:
1. **Provision** (`azd provision`) - Azure kaynakları oluşturur
2. **Package** - Uygulama kodunuzu derler
3. **Deploy** (`azd deploy`) - Kodu Azure kaynaklarına dağıtır

### Beklenen Çıktı
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Adım 5: Uygulamanızı Test Edin

### Uygulamanıza Erişin
Dağıtım çıktısında verilen URL'ye tıklayın ya da istediğiniz zaman alın:
```bash
# Uygulamanın uç noktalarını alın
azd show

# Uygulamayı tarayıcınızda açın
azd show --output json | jq -r '.services.web.endpoint'
```

### Yapılacaklar Uygulamasını Test Edin
1. **Bir yapılacak öğesi ekleyin** - "Add Todo"ya tıklayın ve bir görev girin
2. **Tamamlandı olarak işaretleyin** - Tamamlanan öğeleri işaretleyin
3. **Öğeleri silin** - Artık ihtiyacınız olmayan yapılacakları kaldırın

### Uygulamanızı İzleyin
```bash
# Kaynaklarınız için Azure portalını aç
azd monitor

# Uygulama günlüklerini görüntüle
azd monitor --logs

# Canlı metrikleri görüntüle
azd monitor --live
```

## Adım 6: Değişiklik Yapın ve Yeniden Dağıtın

Bir değişiklik yapalım ve güncellemenin ne kadar kolay olduğunu görelim:

### API'yi Değiştirin
```bash
# API kodunu düzenle
code src/api/src/routes/lists.js
```

Özel bir yanıt başlığı ekleyin:
```javascript
// Bir rota işleyicisi bulun ve şunu ekleyin:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Yalnızca Kod Değişikliklerini Dağıtın
```bash
# Yalnızca uygulama kodunu dağıt (altyapıyı atla)
azd deploy

# Altyapı zaten mevcut olduğu için bu, 'azd up'den çok daha hızlıdır.
```

## Adım 7: Birden Fazla Ortamı Yönetin

Üretime almadan önce değişiklikleri test etmek için bir hazırlık (staging) ortamı oluşturun:

```bash
# Yeni bir hazırlama ortamı oluştur
azd env new staging

# Hazırlama ortamına dağıt
azd up

# Geliştirme ortamına geri dön
azd env select dev

# Tüm ortamları listele
azd env list
```

### Ortam Karşılaştırması
```bash
# Geliştirme ortamını görüntüle
azd env select dev
azd show

# Hazırlık ortamını görüntüle
azd env select staging
azd show
```

## Adım 8: Kaynakları Temizleyin

Denemeyi bitirdiğinizde, sürekli ücretlerden kaçınmak için temizleyin:
```bash
# Geçerli ortam için tüm Azure kaynaklarını sil
azd down

# Onay olmadan zorla sil ve yumuşak silinmiş kaynakları tamamen kaldır
azd down --force --purge

# Belirli bir ortamı sil
azd env select staging
azd down --force --purge
```

## Neler Öğrendiniz

Tebrikler! Başarıyla şunları yaptınız:
- ✅ Bir şablondan azd projesi başlattınız
- ✅ Proje yapısını ve önemli dosyaları incelediniz
- ✅ Tam yığın bir uygulamayı Azure'a dağıttınız
- ✅ Kod değişiklikleri yaptınız ve yeniden dağıttınız
- ✅ Birden fazla ortamı yönettiniz
- ✅ Kaynakları temizlediniz

## 🎯 Beceri Doğrulama Alıştırmaları

### Alıştırma 1: Farklı Bir Şablon Dağıtın (15 dakika)
**Hedef**: azd init ve dağıtım iş akışı konusunda ustalığınızı gösterin

```bash
# Python + MongoDB yığını deneyin
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Dağıtımı doğrulayın
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Temizleyin
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Uygulama hatasız olarak dağıtılır
- [ ] Tarayıcıda uygulama URL'sine erişilebilir
- [ ] Uygulama düzgün çalışır (yapılacakları ekleme/kaldırma)
- [ ] Tüm kaynaklar başarıyla temizlendi

### Alıştırma 2: Yapılandırmayı Özelleştirin (20 dakika)
**Hedef**: Ortam değişkenleri yapılandırmasını uygulama

```bash
cd my-first-azd-app

# Özel ortam oluştur
azd env new custom-config

# Özel değişkenleri ayarla
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Değişkenleri doğrula
azd env get-values | grep APP_TITLE

# Özel yapılandırma ile dağıt
azd up
```

**Başarı Kriterleri:**
- [ ] Özel ortam başarıyla oluşturuldu
- [ ] Ortam değişkenleri ayarlandı ve alınabiliyor
- [ ] Uygulama özel yapılandırma ile dağıtılır
- [ ] Dağıtılan uygulamada özel ayarları doğrulayabilirsiniz

### Alıştırma 3: Çok Ortamlı İş Akışı (25 dakika)
**Hedef**: Ortam yönetimi ve dağıtım stratejilerinde ustalaşın

```bash
# Geliştirme ortamı oluştur
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Geliştirme URL'sini not et
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Hazırlık ortamı oluştur
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Hazırlık URL'sini not et
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Ortamları karşılaştır
azd env list

# Her iki ortamı da test et
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Her iki ortamı da temizle
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Farklı yapılandırmalara sahip iki ortam oluşturuldu
- [ ] Her iki ortam da başarıyla dağıtıldı
- [ ] `azd env select` kullanarak ortamlar arasında geçiş yapabilirsiniz
- [ ] Ortam değişkenleri ortamlar arasında farklıdır
- [ ] Her iki ortam da başarıyla temizlendi

## 📊 İlerlemeniz

**Harcanan Süre**: ~60-90 dakika  
**Edinilen Beceriler**:
- ✅ Şablon tabanlı proje başlatma
- ✅ Azure kaynak sağlama
- ✅ Uygulama dağıtım iş akışları
- ✅ Ortam yönetimi
- ✅ Yapılandırma yönetimi
- ✅ Kaynak temizleme ve maliyet yönetimi

**Sonraki Seviye**: Gelişmiş yapılandırma desenlerini öğrenmek için [Yapılandırma Kılavuzu](configuration.md) bölümüne geçin!

## Yaygın Sorun Giderme

### Kimlik Doğrulama Hataları
```bash
# Azure ile yeniden kimlik doğrulaması yapın
az login

# Abonelik erişimini doğrulayın
az account show
```

### Dağıtım Hataları
```bash
# Hata ayıklama günlüklemesini etkinleştir
export AZD_DEBUG=true
azd up --debug

# Azure'da uygulama günlüklerini görüntüleyin
azd monitor --logs

# Container Apps için Azure CLI'yi kullanın:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Kaynak İsim Çakışmaları
```bash
# Benzersiz bir ortam adı kullanın
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Ağ Sorunları
```bash
# Bağlantı noktalarının kullanılabilir olup olmadığını kontrol edin
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sonraki Adımlar

İlk projenizi tamamladığınıza göre, bu gelişmiş konuları keşfedin:

### 1. Altyapıyı Özelleştirin
- [Altyapı olarak Kod](../chapter-04-infrastructure/provisioning.md)
- [Veritabanları, depolama ve diğer hizmetleri ekleyin](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD Kurulumu
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Tam CI/CD iş akışları
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline yapılandırması

### 3. Üretim İçin En İyi Uygulamalar
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Güvenlik, performans ve izleme

### 4. Daha Fazla Şablon Keşfedin
```bash
# Şablonları kategoriye göre göz atın
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Farklı teknoloji yığınlarını deneyin
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ek Kaynaklar

### Öğrenme Materyalleri
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Çerçevesi](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Geliştirici Topluluğu](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Resmi Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Kurumsal Desenler](https://github.com/Azure/azure-dev/tree/main/templates)

---

**İlk azd projenizi tamamladığınız için tebrikler!** Artık Azure'da harika uygulamalar oluşturup güvenle dağıtmaya hazırsınız.

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zekâ Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Sonraki Ders**: [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri hizmeti Co-op Translator (https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğa özen göstermemize rağmen, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge, kaynak dilindeki hâli esas alınmalıdır. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucu ortaya çıkabilecek herhangi bir yanlış anlaşılma veya hatalı yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->