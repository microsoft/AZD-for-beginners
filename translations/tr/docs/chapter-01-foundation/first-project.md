# İlk Projeniz - Uygulamalı Eğitim

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [Installation & Setup](installation.md)
- **➡️ Sonraki**: [Configuration](configuration.md)
- **🚀 Sonraki Bölüm**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Azure Developer CLI projenize hoş geldiniz! Bu kapsamlı uygulamalı eğitim, azd kullanarak bir full-stack uygulama oluşturma, dağıtma ve yönetme işlemlerini eksiksiz olarak adım adım açıklar. React ön yüz, Node.js API arka uç ve MongoDB veritabanı içeren gerçek bir todo uygulaması ile çalışacaksınız.

## Öğrenme Hedefleri

Bu eğitimi tamamlayarak:
- Şablonları kullanarak azd proje başlatma iş akışında ustalaşacaksınız
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Altyapı sağlama ile birlikte uygulamayı Azure'a eksiksiz şekilde dağıtmayı gerçekleştireceksiniz
- Uygulama güncellemeleri ve yeniden dağıtım stratejilerini uygulayacaksınız
- Geliştirme ve hazırlık (staging) için birden çok ortam yöneteceksiniz
- Kaynak temizleme ve maliyet yönetimi uygulamalarını uygulayacaksınız

## Öğrenme Çıktıları

Tamamlandığında şunları yapabileceksiniz:
- Şablonlardan bağımsız olarak azd projelerini başlatıp yapılandırmak
- azd proje yapılarını etkili şekilde gezip değiştirmek
- Tek komutlarla full-stack uygulamaları Azure'a dağıtmak
- Yaygın dağıtım ve kimlik doğrulama sorunlarını gidermek
- Farklı dağıtım aşamaları için birden çok Azure ortamını yönetmek
- Uygulama güncellemeleri için sürekli dağıtım iş akışları uygulamak

## Başlarken

### Ön Koşullar Kontrol Listesi
- ✅ Azure Developer CLI kurulu ([Installation Guide](installation.md))
- ✅ Azure CLI kurulu ve kimlik doğrulaması yapılmış
- ✅ Sisteminizde Git kurulu
- ✅ Node.js 16+ (bu eğitim için)
- ✅ Visual Studio Code (önerilir)

### Kurulumunuzu Doğrulayın
```bash
# azd kurulumunu kontrol edin
azd version
```
### Azure kimliğini doğrulayın

```bash
az account show
```

### Node.js sürümünü kontrol edin
```bash
node --version
```

## Adım 1: Bir Şablon Seçin ve Başlatın

React ön yüz ve Node.js API arka ucu içeren popüler bir todo uygulaması şablonu ile başlayalım.

```bash
# Mevcut şablonlara göz at
azd template list

# Yapılacaklar uygulaması şablonunu başlat
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Yönergeleri izleyin:
# - Bir ortam adı girin: "dev"
# - Bir abonelik seçin (birden fazlasına sahipseniz)
# - Bir bölge seçin: "East US 2" (veya tercih ettiğiniz bölge)
```

### Az Önce Ne Oldu?
- Şablon kodu yerel dizininize indirildi
- Servis tanımlarıyla bir `azure.yaml` dosyası oluşturuldu
- `infra/` dizininde altyapı kodu ayarlandı
- Bir ortam yapılandırması oluşturuldu

## Adım 2: Proje Yapısını İnceleyin

azd'nin bizim için oluşturduklarını inceleyelim:

```bash
# Proje yapısını görüntüle
tree /f   # Windows
# veya
find . -type f | head -20   # macOS/Linux
```

Görmelisiniz:
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

### Ön Ucu Değiştirin
```bash
# React uygulama bileşenini açın
code src/web/src/App.tsx
```

Basit bir değişiklik yapın:
```typescript
// Başlığı bulun ve değiştirin
<h1>My Awesome Todo App</h1>
```

### Ortam Değişkenlerini Yapılandırın
```bash
# Özel ortam değişkenlerini ayarla
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tüm ortam değişkenlerini görüntüle
azd env get-values
```

## Adım 4: Azure'a Dağıtın

Şimdi heyecanlı kısım - her şeyi Azure'a dağıtalım!

```bash
# Altyapı ve uygulamayı dağıt
azd up

# Bu komut şunları yapacak:
# 1. Azure kaynaklarının sağlanması (App Service, Cosmos DB, vb.)
# 2. Uygulamanızın derlenmesi
# 3. Sağlanan kaynaklara dağıtım
# 4. Uygulama URL'sinin görüntülenmesi
```

### Dağıtım Sırasında Neler Oluyor?

`azd up` komutu şu adımları gerçekleştirir:
1. **Provision** (`azd provision`) - Azure kaynaklarını oluşturur
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

### Uygulamanıza Erişim
Dağıtım çıktısında verilen URL'ye tıklayın veya istediğiniz zaman alın:
```bash
# Uygulama uç noktalarını al
azd show

# Uygulamayı tarayıcınızda açın
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo Uygulamasını Test Edin
1. **Bir todo öğesi ekleyin** - "Todo Ekle" düğmesine tıklayın ve bir görev girin
2. **Tamamlandı olarak işaretleyin** - Tamamlanan öğeleri işaretleyin
3. **Öğeleri silin** - Artık ihtiyaç duymadığınız todo öğelerini kaldırın

### Uygulamanızı İzleyin
```bash
# Kaynaklarınız için Azure portalını açın
azd monitor

# Uygulama günlüklerini görüntüleyin
azd monitor --logs

# Canlı metrikleri görüntüleyin
azd monitor --live
```

## Adım 6: Değişiklik Yapın ve Yeniden Dağıtın

Hadi bir değişiklik yapalım ve güncellemenin ne kadar kolay olduğunu görelim:

### API'yi Değiştirin
```bash
# API kodunu düzenle
code src/api/src/routes/lists.js
```

Özel bir yanıt üstbilgisi ekleyin:
```javascript
// Bir rota işleyicisi bulun ve şunu ekleyin:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sadece Kod Değişikliklerini Dağıtın
```bash
# Sadece uygulama kodunu dağıt (altyapıyı atla)
azd deploy

# Altyapı zaten mevcut olduğundan 'azd up' işleminden çok daha hızlıdır
```

## Adım 7: Birden Çok Ortamı Yönetin

Üretime almadan önce değişiklikleri test etmek için bir hazırlık (staging) ortamı oluşturun:

```bash
# Yeni bir staging ortamı oluştur
azd env new staging

# Staging ortamına dağıt
azd up

# Dev ortamına geri dön
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

Deney yapmayı bitirdiğinizde, sürekli ücretlendirmeyi önlemek için temizleyin:

```bash
# Geçerli ortam için tüm Azure kaynaklarını sil
azd down

# Onay almadan zorla sil ve yumuşak silinmiş kaynakları kalıcı olarak kaldır
azd down --force --purge

# Belirli bir ortamı sil
azd env select staging
azd down --force --purge
```

## Klasik Uygulama vs. AI Destekli Uygulama: Aynı İş Akışı

Az önce klasik bir web uygulaması dağıttınız. Peki ya Microsoft Foundry Modelleri ile desteklenen bir sohbet uygulaması gibi AI destekli bir uygulama dağıtmak isteseydiniz?

İyi haber: **iş akışı aynıdır.**

| Adım | Klasik Todo Uygulaması | AI Sohbet Uygulaması |
|------|------------------------|----------------------|
| Başlat | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Kimlik Doğrulama | `azd auth login` | `azd auth login` |
| Dağıtım | `azd up` | `azd up` |
| İzleme | `azd monitor` | `azd monitor` |
| Temizleme | `azd down --force --purge` | `azd down --force --purge` |

Tek fark, başladığınız **şablon**dur. Bir AI şablonu ek altyapı içerir (ör. Microsoft Foundry Models kaynağı veya bir AI Search dizini gibi), ancak azd bunların tümünü sizin için yönetir. Yeni komutlar öğrenmenize, farklı bir araç benimsemenize veya dağıtım düşüncenizi değiştirmenize gerek yok.

Bu, azd'nin temel ilkesi: **bir iş akışı, her türlü iş yükü.** Bu eğitimde uyguladığınız beceriler — başlatma, dağıtma, izleme, yeniden dağıtma ve temizleme — AI uygulamaları ve ajanlar için de eşit şekilde geçerlidir.

---

## Neler Öğrendiniz

Tebrikler! Başarıyla:
- ✅ Bir şablondan azd projesi başlattınız
- ✅ Proje yapısını ve önemli dosyaları incelediniz
- ✅ Full-stack bir uygulamayı Azure'a dağıttınız
- ✅ Kod değişiklikleri yapıp yeniden dağıttınız
- ✅ Birden çok ortam yönettiniz
- ✅ Kaynakları temizlediniz

## 🎯 Yetkinlik Doğrulama Egzersizleri

### Egzersiz 1: Farklı Bir Şablon Dağıtın (15 dakika)
**Hedef**: azd init ve dağıtım iş akışında ustalığınızı gösterin

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
- [ ] Uygulama hatasız dağıtılıyor
- [ ] Tarayıcıda uygulama URL'sine erişilebiliyor
- [ ] Uygulama düzgün çalışıyor (todo ekleme/silme)
- [ ] Tüm kaynaklar başarıyla temizlendi

### Egzersiz 2: Yapılandırmayı Özelleştir (20 dakika)
**Hedef**: Ortam değişkeni yapılandırması pratiği yapın

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
- [ ] Uygulama özel yapılandırma ile dağıtıldı
- [ ] Dağıtılmış uygulamada özel ayarları doğrulayabiliyorsunuz

### Egzersiz 3: Çoklu Ortam İş Akışı (25 dakika)
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
- [ ] Farklı yapılandırmalarla iki ortam oluşturuldu
- [ ] Her iki ortam da başarıyla dağıtıldı
- [ ] `azd env select` ile ortamlar arasında geçiş yapabiliyorsunuz
- [ ] Ortam değişkenleri ortamlar arasında farklılık gösteriyor
- [ ] Her iki ortam da başarıyla temizlendi

## 📊 İlerlemeniz

**Harcanan Zaman**: ~60-90 dakika  
**Edinilen Beceriler**:
- ✅ Şablon tabanlı proje başlatma
- ✅ Azure kaynak sağlama
- ✅ Uygulama dağıtım iş akışları
- ✅ Ortam yönetimi
- ✅ Yapılandırma yönetimi
- ✅ Kaynak temizleme ve maliyet yönetimi

**Sonraki Seviye**: Gelişmiş yapılandırma desenlerini öğrenmek için [Yapılandırma Kılavuzu](configuration.md) sayfasına hazırsınız!

## Yaygın Sorun Giderme

### Kimlik Doğrulama Hataları
```bash
# Azure ile yeniden kimlik doğrulaması yap
az login

# Abonelik erişimini doğrula
az account show
```

### Dağıtım Hataları
```bash
# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd up --debug

# Azure'da uygulama günlüklerini görüntüle
azd monitor --logs

# Container Apps için Azure CLI'yi kullan:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Kaynak Adı Çakışmaları
```bash
# Benzersiz bir ortam adı kullanın
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Ağ Sorunları
```bash
# Portların kullanılabilir olup olmadığını kontrol et
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sonraki Adımlar

İlk projenizi tamamladıktan sonra bu gelişmiş konuları keşfedin:

### 1. Altyapıyı Özelleştirin
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Veritabanları, depolama ve diğer servisleri ekleyin](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD Kurulumu
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Tam CI/CD iş akışları
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline yapılandırması

### 3. Üretim İçin En İyi Uygulamalar
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Güvenlik, performans ve izleme

### 4. Daha Fazla Şablonu Keşfedin
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
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tebrikler, ilk azd projenizi tamamladınız!** Artık Azure'da harika uygulamalar oluşturup dağıtmak için hazırsınız.

---

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [Installation & Setup](installation.md)
- **➡️ Sonraki**: [Configuration](configuration.md)
- **🚀 Sonraki Bölüm**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Sonraki Ders**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk konusunda özen göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, ana dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->