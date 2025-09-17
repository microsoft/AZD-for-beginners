<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T21:55:06+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "tr"
}
-->
# İlk Projeniz - Uygulamalı Eğitim

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../ai-foundry/azure-ai-foundry-integration.md)

## Giriş

Azure Developer CLI projenize hoş geldiniz! Bu kapsamlı uygulamalı eğitim, azd kullanarak Azure üzerinde tam yığın bir uygulama oluşturma, dağıtma ve yönetme sürecini adım adım anlatır. React frontend, Node.js API backend ve MongoDB veritabanını içeren gerçek bir yapılacaklar uygulaması üzerinde çalışacaksınız.

## Öğrenme Hedefleri

Bu eğitimi tamamladığınızda:
- azd proje başlatma iş akışını şablonlar kullanarak öğrenmiş olacaksınız
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Azure üzerinde altyapı oluşturma ile birlikte tam bir uygulama dağıtımı gerçekleştireceksiniz
- Uygulama güncellemeleri ve yeniden dağıtım stratejilerini uygulayacaksınız
- Geliştirme ve test için birden fazla ortam yöneteceksiniz
- Kaynak temizleme ve maliyet yönetimi uygulamalarını hayata geçireceksiniz

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Şablonlardan bağımsız olarak azd projeleri başlatma ve yapılandırma
- azd proje yapısını etkili bir şekilde gezinme ve değiştirme
- Tek komutlarla Azure üzerinde tam yığın uygulamalar dağıtma
- Yaygın dağıtım sorunlarını ve kimlik doğrulama problemlerini çözme
- Farklı dağıtım aşamaları için birden fazla Azure ortamı yönetme
- Uygulama güncellemeleri için sürekli dağıtım iş akışlarını uygulama

## Başlarken

### Ön Koşullar Kontrol Listesi
- ✅ Azure Developer CLI yüklü ([Kurulum Kılavuzu](installation.md))
- ✅ Azure CLI yüklü ve kimlik doğrulaması yapılmış
- ✅ Git sisteminizde yüklü
- ✅ Node.js 16+ (bu eğitim için)
- ✅ Visual Studio Code (önerilir)

### Kurulumunuzu Doğrulayın
```bash
# Check azd installation
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

React frontend ve Node.js API backend içeren popüler bir yapılacaklar uygulaması şablonuyla başlayalım.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Ne Oldu?
- Şablon kodu yerel dizininize indirildi
- Hizmet tanımları içeren bir `azure.yaml` dosyası oluşturuldu
- `infra/` dizininde altyapı kodu ayarlandı
- Bir ortam yapılandırması oluşturuldu

## Adım 2: Proje Yapısını Keşfedin

azd'nin bizim için oluşturduğu yapıyı inceleyelim:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Şunları görmelisiniz:
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

### Anlaşılması Gereken Temel Dosyalar

**azure.yaml** - azd projenizin merkezi:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Altyapı tanımı:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Adım 3: Projenizi Özelleştirin (Opsiyonel)

Dağıtımdan önce uygulamayı özelleştirebilirsiniz:

### Frontend'i Değiştirin
```bash
# Open the React app component
code src/web/src/App.tsx
```

Basit bir değişiklik yapın:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Ortam Değişkenlerini Yapılandırın
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Adım 4: Azure'a Dağıtım Yapın

Şimdi heyecan verici kısım - her şeyi Azure'a dağıtın!

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

`azd up` komutu şu adımları gerçekleştirir:
1. **Altyapı Sağlama** (`azd provision`) - Azure kaynaklarını oluşturur
2. **Paketleme** - Uygulama kodunuzu derler
3. **Dağıtım** (`azd deploy`) - Kodu Azure kaynaklarına dağıtır

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
Dağıtım çıktısında sağlanan URL'ye tıklayın veya istediğiniz zaman alın:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Yapılacaklar Uygulamasını Test Edin
1. **Bir yapılacak öğesi ekleyin** - "Add Todo"ya tıklayın ve bir görev girin
2. **Tamamlandı olarak işaretleyin** - Tamamlanan öğeleri işaretleyin
3. **Öğeleri silin** - Artık ihtiyacınız olmayan yapılacakları kaldırın

### Uygulamanızı İzleyin
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Adım 6: Değişiklik Yapın ve Yeniden Dağıtın

Bir değişiklik yapalım ve güncellemenin ne kadar kolay olduğunu görelim:

### API'yi Değiştirin
```bash
# Edit the API code
code src/api/src/routes/lists.js
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

Üretimden önce değişiklikleri test etmek için bir test ortamı oluşturun:

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

Deneyleriniz bittiğinde, devam eden ücretlerden kaçınmak için temizleme yapın:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Neler Öğrendiniz

Tebrikler! Başarıyla:
- Bir şablondan azd projesi başlattınız
- Proje yapısını ve temel dosyaları keşfettiniz
- Azure üzerinde tam yığın bir uygulama dağıttınız
- Kod değişiklikleri yaptınız ve yeniden dağıttınız
- Birden fazla ortam yönettiniz
- Kaynakları temizlediniz

## Yaygın Sorunları Giderme

### Kimlik Doğrulama Hataları
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Dağıtım Başarısızlıkları
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Kaynak Adı Çakışmaları
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

İlk projenizi tamamladığınıza göre, bu ileri düzey konuları keşfedin:

### 1. Altyapıyı Özelleştirin
- [Kod Olarak Altyapı](../deployment/provisioning.md)
- [Veritabanları, depolama ve diğer hizmetleri ekleyin](../deployment/provisioning.md#adding-services)

### 2. CI/CD Kurulumu Yapın
- [GitHub Actions Entegrasyonu](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Üretim İçin En İyi Uygulamalar
- [Güvenlik yapılandırmaları](../deployment/best-practices.md#security)
- [Performans optimizasyonu](../deployment/best-practices.md#performance)
- [İzleme ve günlükleme](../deployment/best-practices.md#monitoring)

### 4. Daha Fazla Şablon Keşfedin
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ek Kaynaklar

### Öğrenme Materyalleri
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure İyi Tasarlanmış Çerçeve](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Topluluğu](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Resmi Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Kurumsal Modeller](https://github.com/Azure/azure-dev/tree/main/templates)

---

**İlk azd projenizi tamamladığınız için tebrikler!** Artık Azure üzerinde harika uygulamalar oluşturup dağıtmaya hazırsınız.

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../ai-foundry/azure-ai-foundry-integration.md)
- **Sonraki Ders**: [Dağıtım Kılavuzu](../deployment/deployment-guide.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.