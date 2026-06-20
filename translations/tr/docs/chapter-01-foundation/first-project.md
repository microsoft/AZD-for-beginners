# İlk Projeniz - Uygulamalı Eğitim

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Güncel Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Yapılandırma](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Azure Developer CLI ile ilk projenize hoş geldiniz! Bu kapsamlı uygulamalı eğitim, azd kullanarak tam yığın bir uygulamayı Azure'da oluşturma, dağıtma ve yönetme sürecini eksiksiz bir şekilde adım adım anlatır. Bir React önyüzü, Node.js API arka ucu ve MongoDB veritabanı içeren gerçek bir todo uygulaması üzerinde çalışacaksınız.

## Öğrenme Hedefleri

Bu eğitimi tamamlayarak:
- Şablonları kullanarak azd proje başlatma iş akışında ustalaşacaksınız
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Altyapı sağlama ile birlikte uygulamayı Azure'a eksiksiz olarak dağıtacaksınız
- Uygulama güncellemeleri ve yeniden dağıtım stratejilerini uygulayacaksınız
- Geliştirme ve staging için birden fazla ortam yöneteceksiniz
- Kaynak temizleme ve maliyet yönetimi uygulamalarını uygulayacaksınız

## Öğrenme Çıktıları

Tamamladıktan sonra şunları yapabileceksiniz:
- Şablonlardan bağımsız olarak azd projelerini başlatıp yapılandırmak
- azd proje yapılarını etkili şekilde gezmek ve değiştirmek
- Tek komutlarla tam yığın uygulamaları Azure'a dağıtmak
- Yaygın dağıtım sorunları ve kimlik doğrulama problemlerini gidermek
- Farklı dağıtım aşamaları için birden çok Azure ortamını yönetmek
- Uygulama güncellemeleri için sürekli dağıtım iş akışları uygulamak

## Başlarken

### Önkoşullar Kontrol Listesi
- ✅ Azure Developer CLI yüklü ([Kurulum Kılavuzu](installation.md))
- ✅ `azd auth login` ile AZD kimlik doğrulaması tamamlandı
- ✅ Sisteminizde Git yüklü
- ✅ Node.js 16+ (bu eğitim için)
- ✅ Visual Studio Code (önerilir)

Devam etmeden önce, depo kökünden kurulum doğrulayıcısını çalıştırın:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Kurulumunuzu Doğrulayın
```bash
# azd kurulumunu kontrol et
azd version

# AZD kimlik doğrulamasını kontrol et
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

Bir React önyüzü ve Node.js API arka ucu içeren popüler bir todo uygulaması şablonuyla başlayalım.

```bash
# Kullanılabilir şablonlara göz at
azd template list

# Yapılacaklar uygulaması şablonunu başlat
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# İstemleri takip edin:
# - Bir ortam adı girin: "dev"
# - Bir abonelik seçin (birden fazlanız varsa)
# - Bir bölge seçin: "East US 2" (veya tercih ettiğiniz bölge)
```

### Ne Oldu?
- Şablon kodu yerel dizininize indirildi
- Servis tanımları içeren bir `azure.yaml` dosyası oluşturuldu
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

### Anlaşılması Gereken Ana Dosyalar

**azure.yaml** - azd projenizin kalbi:
```bash
# Proje yapılandırmasını görüntüle
cat azure.yaml
```

**infra/main.bicep** - Altyapı tanımı:
```bash
# Altyapı kodunu görüntüleyin
head -30 infra/main.bicep
```

## Adım 3: Projenizi Özelleştirin (İsteğe Bağlı)

Dağıtımdan önce uygulamayı özelleştirebilirsiniz:

### Önyüzü Değiştirin
```bash
# React uygulama bileşenini aç
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

Şimdi heyecanlı kısım - her şeyi Azure'a dağıtın!

```bash
# Altyapıyı ve uygulamayı dağıt
azd up

# Bu komut şunları yapacak:
# 1. Azure kaynaklarını oluşturacak (App Service, Cosmos DB vb.)
# 2. Uygulamanızı derleyecek
# 3. Oluşturulan kaynaklara dağıtacak
# 4. Uygulama URL'sini gösterecek
```

### Dağıtım Sırasında Neler Oluyor?

`azd up` komutu şu adımları gerçekleştirir:
1. **Provision** (`azd provision`) - Azure kaynaklarını oluşturur
2. **Package** - Uygulama kodunuzu paketler/derler
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
Dağıtım çıktısında sağlanan URL'ye tıklayın veya istediğiniz zaman alın:
```bash
# Uygulamanın uç noktalarını alın
azd show

# Uygulamayı tarayıcınızda açın
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo Uygulamasını Test Edin
1. **Bir todo öğesi ekleyin** - "Add Todo" düğmesine tıklayın ve bir görev girin
2. **Tamamlandı olarak işaretle** - Tamamlanan öğeleri işaretleyin
3. **Öğeleri silin** - Artık ihtiyacınız olmayan todo'ları kaldırın

### Uygulamanızı İzleyin
```bash
# Kaynaklarınız için Azure portalını aç
azd monitor

# Uygulama günlüklerini görüntüle
azd monitor --logs

# Canlı metrikleri görüntüle
azd monitor --live
```

### ✅ Dağıtımınızı Doğrulayın

Devam etmeden önce, her şeyin gerçekten çalıştığını doğrulamak için bu hızlı kontrol listesini uygulayın — "deploy succeeded" ifadesinin "uygulama çalışıyor" demek olmadığını varsaymayın:

```bash
# 1. Uç noktanın var olduğunu ve erişilebilir olduğunu doğrulayın
azd show

# 2. Uç noktayı hızlıca test edin (HTTP 200 beklenir)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Uygulamanız böyle bir uç nokta sunuyorsa sağlık uç noktasını kontrol edin
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Dağıtım şu durumlarda doğrulanır:**
- ✅ `azd show` erişilebilir bir uç nokta URL'si listeler
- ✅ URL tarayıcınızda hatasız açılır
- ✅ Temel özellikler çalışır (bir todo ekleme/tamamlama/silme)
- ✅ `azd monitor --logs` beklenmeyen hata olmadan gelen istekleri gösterir

Herhangi bir kontrol başarısız olursa, atlayın ve [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/README.md)'ye bakın.

## Adım 6: Değişiklik Yapın ve Yeniden Dağıtın

Hadi bir değişiklik yapalım ve güncellemenin ne kadar kolay olduğunu görelim:

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

### Sadece Kod Değişikliklerini Dağıtın
```bash
# Yalnızca uygulama kodunu dağıt (altyapıyı atla)
azd deploy

# Altyapı zaten mevcut olduğundan 'azd up' işlemine göre bu çok daha hızlıdır.
```

## Adım 7: Birden Fazla Ortamı Yönetin

Değişiklikleri üretime almadan önce test etmek için bir staging (hazırlık) ortamı oluşturun:

```bash
# Yeni bir hazırlık ortamı oluştur
azd env new staging

# Hazırlık ortamına dağıt
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

Denemeyi bitirdiğinizde, sürekli ücretlendirmeyi önlemek için temizlik yapın:

```bash
# Mevcut ortam için tüm Azure kaynaklarını sil
azd down

# Onay olmadan zorla sil ve geçici olarak silinmiş kaynakları kalıcı olarak kaldır
azd down --force --purge

# Belirli bir ortamı sil
azd env select staging
azd down --force --purge
```

## Klasik Uygulama vs. Yapay Zeka Destekli Uygulama: Aynı İş Akışı

Az önce geleneksel bir web uygulaması dağıttınız. Peki ya Microsoft Foundry Modelleri tarafından desteklenen bir sohbet uygulaması gibi bir yapay zeka destekli uygulama dağıtmak isteseydiniz?

İyi haber: **iş akışı aynıdır.**

| Adım | Klasik Todo Uygulaması | Yapay Zeka Sohbet Uygulaması |
|------|-------------------------|-----------------------------|
| Başlat | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Kimlik Doğrulama | `azd auth login` | `azd auth login` |
| Dağıtım | `azd up` | `azd up` |
| İzleme | `azd monitor` | `azd monitor` |
| Temizlik | `azd down --force --purge` | `azd down --force --purge` |

Tek fark başladığınız **şablon**dur. Bir AI şablonu ek altyapı (ör. bir Microsoft Foundry Models kaynağı veya bir AI Search dizini) içerir, ancak azd bunların tümünü sizin için yönetir. Yeni komutlar öğrenmeniz, farklı bir araç benimsemeniz veya dağıtımı düşünme şeklinizi değiştirmeniz gerekmez.

Bu, azd'nin temel prensibidir: **bir iş akışı, her tür iş yükü.** Bu eğitimde uyguladığınız beceriler—başlatma, dağıtma, izleme, yeniden dağıtma ve temizleme—AI uygulamaları ve ajanlar için de eşit şekilde geçerlidir.

---

## Neler Öğrendiniz

Tebrikler! Başarıyla şunları yaptınız:
- ✅ Bir şablondan azd projesi başlattınız
- ✅ Proje yapısını ve ana dosyaları incelediniz
- ✅ Tam yığın bir uygulamayı Azure'a dağıttınız
- ✅ Kod değişiklikleri yapıp yeniden dağıttınız
- ✅ Birden fazla ortam yönettiniz
- ✅ Kaynakları temizlediniz

## 🎯 Yetenek Doğrulama Egzersizleri

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
- [ ] Uygulama hatasız şekilde dağıtılır
- [ ] Tarayıcıda uygulama URL'sine erişilebilir
- [ ] Uygulama doğru çalışır (todo ekleme/kaldırma)
- [ ] Tüm kaynaklar başarıyla temizlendi

### Egzersiz 2: Yapılandırmayı Özelleştirin (20 dakika)
**Hedef**: Ortam değişkenleri yapılandırmasını uygulamak

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

# Özel yapılandırmayla dağıt
azd up
```

**Başarı Kriterleri:**
- [ ] Özel ortam başarıyla oluşturuldu
- [ ] Ortam değişkenleri ayarlandı ve alınabiliyor
- [ ] Uygulama özel yapılandırma ile dağıtıldı
- [ ] Dağıtılan uygulamada özel ayarları doğrulayabilirsiniz

### Egzersiz 3: Çoklu Ortam İş Akışı (25 dakika)
**Hedef**: Ortam yönetimi ve dağıtım stratejilerinde ustalaşmak

```bash
# Geliştirme ortamı oluştur
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Geliştirme URL'sini not et
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Staging ortamı oluştur
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Staging URL'sini not et
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
- [ ] `azd env select` ile ortamlar arasında geçiş yapılabilir
- [ ] Ortam değişkenleri ortamlar arasında farklılık gösterir
- [ ] Her iki ortam da başarıyla temizlendi

## 📊 İlerlemeniz

**Harcanan Süre**: ~60-90 dakika  
**Edinilen Yetenekler**:
- ✅ Şablona dayalı proje başlatma
- ✅ Azure kaynak sağlama
- ✅ Uygulama dağıtım iş akışları
- ✅ Ortam yönetimi
- ✅ Yapılandırma yönetimi
- ✅ Kaynak temizleme ve maliyet yönetimi

**Sonraki Seviye**: İleri yapılandırma kalıplarını öğrenmek için [Yapılandırma Rehberi](configuration.md) ile devam edin!

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
# Hata ayıklama günlük kaydını etkinleştir
export AZD_DEBUG=true
azd up --debug

# Azure'da uygulama günlüklerini görüntüle
azd monitor --logs

# Container Apps için Azure CLI kullanın:
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

İlk projenizi tamamladığınıza göre, bu ileri konuları keşfedin:

### 1. Altyapıyı Özelleştirin
- [Kod Olarak Altyapı](../chapter-04-infrastructure/provisioning.md)
- [Veritabanları, depolama ve diğer hizmetleri ekleyin](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD Kurulumu
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Tam CI/CD iş akışları
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline yapılandırması

### 3. Üretim En İyi Uygulamaları
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Güvenlik, performans ve izleme

### 4. Daha Fazla Şablon Keşfedin
```bash
# Kategorilere göre şablonlara göz at
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
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Çerçevesi](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Topluluğu](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Resmi Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Kurumsal Kalıplar](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tebrikler! İlk azd projenizi tamamladınız.** Artık Azure'da harika uygulamalar oluşturup dağıtmaya güvenle hazırsınız.

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Güncel Bölüm**: Bölüm 1 - Temel ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Yapılandırma](installation.md)
- **➡️ Sonraki**: [Kendi Uygulamanızı Getirin](bring-your-own-app.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->