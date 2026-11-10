# İlk Projeniz - Uygulamalı Eğitim

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfa**: [Yeni Başlayanlar için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç  
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Kendi Uygulamanı Getir](bring-your-own-app.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

İlk Azure Developer CLI projenize hoş geldiniz! React ön yüz, Node.js API ve Azure Cosmos DB ile bir todo uygulaması dağıtacaksınız. Şablon tarihsel adı olan `todo-nodejs-mongo` ismini koruyor; mevcut altyapısı NoSQL için Cosmos DB kullanıyor, bu yüzden indirilen README ve `infra/` dosyasını inceleyin, veritabanı API’sini adı üzerinden varsaymayın.

> Kasım 2026'da `azd 1.37.2` ve genel şablon ile gözden geçirilmiştir. Aşağıdaki örnekler Bash kullanır; JSON çıkarımı için ayrıca `jq` gereklidir. Azure dağıtımları ücretlendirildiğinden bu incelemede çalıştırılmamıştır.

## Öğrenme Hedefleri

Bu eğitimi tamamlayarak:
- Şablonları kullanarak azd proje başlatma iş akışını öğreneceksiniz
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Altyapı temini ile Azure’a tam uygulama dağıtımı yapacaksınız
- Uygulama güncellemeleri ve yeniden dağıtım stratejileri uygulayacaksınız
- Geliştirme ve ön üretim için birden fazla ortam yöneteceksiniz
- Kaynak temizliği ve maliyet yönetimi uygulayacaksınız

## Öğrenme Kazanımları

Tamamlandığında şunları yapabiliyor olacaksınız:
- Şablonlardan bağımsız olarak azd projelerini başlatmak ve yapılandırmak
- azd proje yapılarını etkili şekilde gezmek ve değiştirmek
- Tek komutlarla Azure’a tam yığın uygulamalar dağıtmak
- Yaygın dağıtım sorunlarını ve kimlik doğrulama sorunlarını çözmek
- Farklı dağıtım aşamaları için birden çok Azure ortamını yönetmek
- Uygulama güncellemeleri için sürekli dağıtım iş akışları uygulamak

## Başlarken

### Gereksinimler Kontrol Listesi
- ✅ Azure Developer CLI yüklü ([Kurulum Kılavuzu](installation.md))
- ✅ `azd auth login` ile AZD kimlik doğrulaması tamamlandı
- ✅ Sisteminizde Git yüklü
- ✅ Node.js 22 LTS (veya indirilen şablonun gerektirdiği desteklenen sürüm)
- ✅ Visual Studio Code (önerilir)

Devam etmeden önce, depo kökünden kurulum doğrulayıcısını çalıştırın:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Kurulumunuzu Doğrulayın
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### İsteğe bağlı Azure CLI kimlik doğrulamasını doğrulayın

```bash
az account show
```

### Node.js sürümünü kontrol edin
```bash
node --version
```

## Adım 1: Bir Şablon Seçin ve Başlatın

React ön yüz ve Node.js API arka uç içeren popüler bir todo uygulaması şablonuyla başlayalım.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Ne Oldu?
- Şablon kodu yerel dizininize indirildi
- Hizmet tanımlarını içeren bir `azure.yaml` dosyası oluşturuldu
- `infra/` dizininde altyapı kodu ayarlandı
- Ortam yapılandırması oluşturuldu

## Adım 2: Proje Yapısını İnceleyin

azd'nin bizim için neler oluşturduğuna bakalım:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Şunları görmelisiniz:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Anlaşılması Gereken Temel Dosyalar

**azure.yaml** - azd projenizin kalbi:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Altyapı tanımı:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Adım 3: Projenizi Özelleştirin (İsteğe Bağlı)

Dağıtımdan önce uygulamayı özelleştirebilirsiniz:

### Ön Yüzü Değiştirin
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Basit bir değişiklik yapın:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Ortam Değişkenlerini Yapılandırın
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Bu iki özel değer sadece yerel depolamayı gösterir. Stok şablon `WEBSITE_TITLE` veya `API_VERSION` kullanımına sahip değildir, bu nedenle uygulamayı değiştirmezler. Yukarıdaki açık kaynak düzenlemesi gösterilen başlığı değiştirir.

## Adım 4: Azure’a Dağıtım Yapın

Şimdi heyecan verici bölüm - her şeyi Azure’a dağıtalım!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Dağıtım Sırasında Neler Oluyor?

İş akışı altyapıyı tesis eder ve kodu paketleyip dağıtır. Kesin sıralama `workflows.up` içinde `azure.yaml` ile özelleştirilebilir; bu şablon önce tesis, sonra dağıtım belirtir. Her şablon için evrensel bir aşama sırasına güvenmeyin.

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
Dağıtım çıktısında verilen URL’ye tıklayın veya istediğiniz zaman edinin:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo Uygulamasını Test Edin
1. **Bir todo öğesi ekleyin** - "Todo Ekle"ye tıklayın ve görev girin  
2. **Tamamlandı olarak işaretleyin** - Bitmiş öğeleri işaretleyin  
3. **Öğeleri silin** - Artık ihtiyacınız olmayan todoları kaldırın  

### Uygulamanızı İzleyin
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Dağıtımınızı Doğrulayın

Devam etmeden önce, her şeyin gerçekten çalıştığını doğrulamak için bu hızlı kontrol listesini geçin—"dağıtım başarıyla tamamlandı" demek "uygulama çalışıyor" demek değildir:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Dağıtım doğrulanırsa:**
- ✅ `azd show` erişilebilir bir uç nokta URL’si listeler
- ✅ URL tarayıcınızda hatasız açılır
- ✅ Temel özellikler çalışır (todo ekle/tamamla/sil)
- ✅ `azd monitor --logs` beklenmeyen hata olmadan istekleri gösterir

Herhangi bir kontrol başarısız olursa, [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md) kısmına atlayın.

## Adım 6: Değişiklik Yapın ve Yeniden Dağıtın

Bir değişiklik yapalım ve güncellemenin ne kadar kolay olduğuna bakalım:

### API’yı Değiştirin
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Özel bir yanıt başlığı ekleyin:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sadece Kod Değişikliklerini Dağıtın
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Adım 7: Birden Fazla Ortam Yönetin

Üretime geçmeden önce değişiklikleri test etmek için ön üretim ortamı oluşturun:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Ortam Karşılaştırması
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Adım 8: Kaynakları Temizleyin

Denemeyi bitirdiğinizde, devam eden ücretlerden kaçınmak için temizleyin:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasik Uygulama vs. Yapay Zeka Destekli Uygulama: Aynı İş Akışı

Az önce geleneksel bir web uygulaması dağıttınız. Peki ya Microsoft Foundry Modelleri destekli bir sohbet uygulaması gibi yapay zeka destekli bir uygulama dağıtmak isteseydiniz?

İyi haber: **iş akışı aynıdır.**

| Adım | Klasik Todo Uygulaması | Yapay Zeka Sohbet Uygulaması |
|------|-----------------|-------------|
| Başlat (boş dizin) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Kimlik Doğrula | `azd auth login` | `azd auth login` |
| Dağıt | `azd up` | `azd up` |
| İzle | `azd monitor` | `azd monitor` |
| Temizle | `azd down --force --purge` | `azd down --force --purge` |

Yaşam döngüsü komutları aynıdır ama ön koşullar farklıdır. Bir yapay zeka şablonu model erişimi, bölgesel kota, veri yükleme ve ek yapılandırma isteyebilir. Dağıtımdan önce README dosyasını okuyun; `azd up` eksik izin veya kota sağlayamaz.

azd'nin temel ilkesi budur: **bir iş akışı, her iş yükü.** Bu eğitimde pratik yaptığınız beceriler—başlatma, dağıtım, izleme, yeniden dağıtım ve temizleme—yapay zeka uygulamaları ve ajanları için de geçerlidir.

---

## Öğrendikleriniz

Tebrikler! Başarıyla:
- ✅ Bir şablondan azd projesi başlattınız
- ✅ Proje yapısını ve temel dosyaları incelediniz
- ✅ Tam yığın uygulamayı Azure’a dağıttınız
- ✅ Kod değişiklikleri yapıp yeniden dağıttınız
- ✅ Birden çok ortamı yönettiniz
- ✅ Kaynakları temizlediniz

## 🎯 Becerileri Doğrulama Egzersizleri

### Egzersiz 1: Farklı Bir Şablon Dağıtın (15 dakika)
**Hedef**: azd init ve dağıtım iş akışında ustalığı gösterin

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Uygulama hatasız dağıtılır
- [ ] Uygulama URL’sine tarayıcıdan erişilebilir
- [ ] Uygulama düzgün çalışır (todo ekle/kaldır)
- [ ] Tüm kaynaklar başarıyla temizlenir

### Egzersiz 2: Yapılandırmayı Özelleştirin (20 dakika)
**Hedef**: Yerel ortam değeri depolamayı ve bunun çalışma zamanı yapılandırması olmadığını anlama pratiği yapın

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Başarı Kriterleri:**
- [ ] Özel bir ortam başarıyla oluşturuldu
- [ ] Ortam değişkenleri ayarlandı ve erişilebilir
- [ ] `azd env get-value APP_TITLE`, `My Custom Todo App` yazdırır
- [ ] Bu değerlerin kod/altyapı tarafından tüketilmediği sürece stok uygulamayı neden değiştirmediğini açıklayabilir

### Egzersiz 3: Çok Ortamlı İş Akışı (25 dakika)
**Hedef**: Ortam yönetimi ve dağıtım stratejilerinde ustalaşın

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Farklı yapılandırmalara sahip iki ortam oluşturuldu
- [ ] Her iki ortam da başarıyla dağıtıldı
- [ ] `azd env select` kullanarak ortamlar arasında geçiş yapılabilir
- [ ] Ortam değişkenleri ortamlar arasında farklıdır
- [ ] Her iki ortam da başarıyla temizlenmiştir

## 📊 İlerleyişiniz

**Harcanan Zaman**: ~60-90 dakika  
**Kazandığınız Beceriler**:
- ✅ Şablon tabanlı proje başlatma
- ✅ Azure kaynak sağlama
- ✅ Uygulama dağıtım iş akışları
- ✅ Ortam yönetimi
- ✅ Yapılandırma yönetimi
- ✅ Kaynak temizliği ve maliyet yönetimi

**Sonraki Seviyeye Hazır**: Gelişmiş yapılandırma desenlerini öğrenmek için [Yapılandırma Rehberi](../chapter-03-configuration/configuration.md)’ne hazırsınız!

## Yaygın Sorunların Çözümü

### Kimlik Doğrulama Hataları
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Dağıtım Başarısızlıkları
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Kaynak Ad Çakışmaları
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Ağ Sorunları
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sonraki Adımlar

İlk projenizi tamamladığınıza göre, şu gelişmiş konuları keşfedin:

### 1. Altyapıyı Özelleştirin
- [Kod Olarak Altyapı](../chapter-04-infrastructure/provisioning.md)
- [Veritabanı altyapısı ekleyin](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD Kurulumu
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Tam CI/CD iş akışları
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline yapılandırması

### 3. Üretim En İyi Uygulamaları
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Güvenlik, performans ve izleme

### 4. Daha Fazla Şablon Keşfedin
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Ek Kaynaklar

### Öğrenme Materyalleri
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure İyi Tasarlanmış Çerçevesi](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Topluluğu](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Resmi Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Şablon Katkıları](https://github.com/Azure/awesome-azd)
- [Todo Şablon Kaynağı](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**İlk azd projenizi tamamladığınız için tebrikler!** Artık Azure’da harika uygulamalar oluşturup dağıtmaya hazır ve kendinizden emin durumdasınız.

---

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfa**: [Yeni Başlayanlar için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç  
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Kendi Uygulamanı Getir](bring-your-own-app.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->