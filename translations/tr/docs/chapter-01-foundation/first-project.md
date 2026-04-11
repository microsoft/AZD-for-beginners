# İlk Projeniz - Uygulamalı Eğitim

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum & Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

İlk Azure Developer CLI projenize hoş geldiniz! Bu kapsamlı uygulamalı eğitim, azd kullanarak tam yığın bir uygulamayı Azure'da oluşturma, dağıtma ve yönetme konusunda tam bir adım adım kılavuz sunar. React ön yüzü, Node.js API arka ucu ve MongoDB veritabanı içeren gerçek bir todo uygulamasıyla çalışacaksınız.

## Öğrenme Hedefleri

Bu eğitimi tamamlayarak:
- Şablonlar kullanarak azd proje başlatma iş akışında ustalaşacaksınız
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Altyapı sağlama ile birlikte uygulamayı Azure'a tam olarak dağıtacaksınız
- Uygulama güncellemeleri ve yeniden dağıtım stratejilerini uygulayacaksınız
- Geliştirme ve staging için birden fazla ortam yöneteceksiniz
- Kaynak temizliği ve maliyet yönetimi uygulamalarını kullanacaksınız

## Öğrenim Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Şablonlardan bağımsız olarak azd projelerini başlatmak ve yapılandırmak
- azd proje yapılarını etkili şekilde gezmek ve değiştirmek
- Tek komutlarla tam yığın uygulamaları Azure'a dağıtmak
- Yaygın dağıtım sorunlarını ve kimlik doğrulama problemlerini gidermek
- Farklı dağıtım aşamaları için birden fazla Azure ortamını yönetmek
- Uygulama güncellemeleri için sürekli dağıtım iş akışları uygulamak

## Başlarken

### Gereksinimler Kontrol Listesi
- ✅ Azure Developer CLI kurulu ([Kurulum Kılavuzu](installation.md))
- ✅ AZD kimlik doğrulaması `azd auth login` ile tamamlandı
- ✅ Sisteminize Git kurulu
- ✅ Node.js 16+ (bu eğitim için)
- ✅ Visual Studio Code (önerilir)

Devam etmeden önce, depo kökünden kurulum doğrulayıcısını çalıştırın:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Kurulumunuzu Doğrulayın
```bash
# azd kurulumunu kontrol edin
azd version

# AZD kimlik doğrulamasını kontrol edin
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

React ön yüzü ve Node.js API arka ucu içeren popüler bir todo uygulaması şablonuyla başlayalım.

```bash
# Kullanılabilir şablonlara göz atın
azd template list

# Yapılacaklar uygulaması şablonunu başlatın
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Yönlendirmeleri takip edin:
# - Bir ortam adı girin: "dev"
# - Bir abonelik seçin (birden fazla aboneliğiniz varsa)
# - Bir bölge seçin: "East US 2" (veya tercih ettiğiniz bölge)
```

### Az önce ne oldu?
- Şablon kodu yerel dizininize indirildi
- Servis tanımları içeren bir `azure.yaml` dosyası oluşturuldu
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

Şunu görmelisiniz:
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

Dağıtımdan önce, uygulamayı özelleştirebilirsiniz:

### Önyüzü (Frontend) Değiştirin
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

Şimdi heyecan verici kısım - her şeyi Azure'a dağıtın!

```bash
# Altyapıyı ve uygulamayı dağıt
azd up

# Bu komut şunları yapacak:
# 1. Azure kaynaklarını sağlayacak (App Service, Cosmos DB, vb.)
# 2. Uygulamanızı derleyecek
# 3. Sağlanan kaynaklara dağıtacak
# 4. Uygulamanın URL'sini gösterecek
```

### Dağıtım Sırasında Neler Oluyor?

`azd up` komutu şu adımları gerçekleştirir:
1. **Provision** (`azd provision`) - Azure kaynakları oluşturur
2. **Package** - Uygulama kodunuzu paketler
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
Dağıtım çıktısında sağlanan URL'ye tıklayın veya her zaman alın:
```bash
# Uygulama uç noktalarını alın
azd show

# Uygulamayı tarayıcınızda açın
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo Uygulamasını Test Edin
1. **Bir todo öğesi ekleyin** - "Add Todo" öğesine tıklayın ve bir görev girin
2. **Tamamlandı olarak işaretleyin** - Tamamlanan öğeleri işaretleyin
3. **Öğeleri silin** - Artık ihtiyacınız olmayan todo öğelerini kaldırın

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

Bir değişiklik yapalım ve güncellemenin ne kadar kolay olduğunu görelim:

### API'yi Değiştirin
```bash
# API kodunu düzenle
code src/api/src/routes/lists.js
```

Özel bir yanıt başlığı ekleyin:
```javascript
// Bir rota işleyicisi bulun ve ekleyin:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sadece Kod Değişikliklerini Dağıtın
```bash
# Sadece uygulama kodunu dağıt (altyapıyı atla)
azd deploy

# Altyapı zaten mevcut olduğundan bu, 'azd up'ten çok daha hızlıdır.
```

## Adım 7: Birden Fazla Ortamı Yönetin

Üretime almadan önce değişiklikleri test etmek için bir staging ortamı oluşturun:

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

Deney yapmayı bitirdiğinizde, sürekli ücretlerden kaçınmak için temizleyin:

```bash
# Mevcut ortam için tüm Azure kaynaklarını sil
azd down

# Onay olmadan zorla sil ve geçici olarak silinmiş kaynakları kalıcı olarak temizle
azd down --force --purge

# Belirli ortamı sil
azd env select staging
azd down --force --purge
```

## Klasik Uygulama vs. Yapay Zeka Destekli Uygulama: Aynı İş Akışı

Az önce geleneksel bir web uygulaması dağıttınız. Peki ya bunun yerine Microsoft Foundry Modelleri ile desteklenen bir sohbet uygulaması gibi bir yapay zeka destekli uygulama dağıtmak isteseydiniz?

İyi haber: **iş akışı aynı.**

| Adım | Klasik Todo Uygulaması | Yapay Zeka Sohbet Uygulaması |
|------|------------------------|------------------------------|
| Başlat | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Kimlik Doğrulama | `azd auth login` | `azd auth login` |
| Dağıt | `azd up` | `azd up` |
| İzle | `azd monitor` | `azd monitor` |
| Temizle | `azd down --force --purge` | `azd down --force --purge` |

Tek fark, başladığınız **şablon**dur. Bir AI şablonu ek altyapı içerir (ör. bir Microsoft Foundry Models kaynağı veya bir AI Search indeksi), ancak azd bunların tümünü sizin için halleder. Yeni komutlar öğrenmenize, farklı bir araç benimsemenize veya dağıtım hakkında düşünme biçiminizi değiştirmenize gerek yok.

Bu azd'nin temel prensibidir: **bir iş akışı, her türlü iş yükü.** Bu eğitimde uyguladığınız beceriler—başlatma, dağıtma, izleme, yeniden dağıtma ve temizleme—AI uygulamalarına ve ajanlarına da eşit şekilde uygulanır.

---

## Öğrendikleriniz

Tebrikler! Başarıyla şunları yaptınız:
- ✅ Bir şablondan azd projesi başlattınız
- ✅ Proje yapısını ve önemli dosyaları incelediniz
- ✅ Tam yığın bir uygulamayı Azure'a dağıttınız
- ✅ Kod değişiklikleri yaptınız ve yeniden dağıttınız
- ✅ Birden fazla ortam yönettiniz
- ✅ Kaynakları temizlediniz

## 🎯 Beceri Doğrulama Alıştırmaları

### Alıştırma 1: Farklı Bir Şablonu Dağıtın (15 dakika)
**Hedef**: azd init ve dağıtım iş akışında ustalığı gösterin

```bash
# Python + MongoDB yığınını dene
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Dağıtımı doğrula
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Temizle
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Uygulama hatasız dağıtılır
- [ ] Tarayıcıda uygulama URL'sine erişilebilir
- [ ] Uygulama doğru çalışır (todo ekleme/çıkarma)
- [ ] Tüm kaynaklar başarıyla temizlenir

### Alıştırma 2: Yapılandırmayı Özelleştirin (20 dakika)
**Hedef**: Ortam değişkeni yapılandırmasını uygulama

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
- [ ] Dağıtılan uygulamada özel ayarlar doğrulanabiliyor

### Alıştırma 3: Çoklu Ortam İş Akışı (25 dakika)
**Hedef**: Ortam yönetimi ve dağıtım stratejilerinde ustalaşma

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
- [ ] `azd env select` kullanarak ortamlar arasında geçiş yapılabiliyor
- [ ] Ortam değişkenleri ortamlar arasında farklılık gösteriyor
- [ ] Her iki ortam da başarıyla temizlendi

## 📊 İlerleme Durumunuz

**Harcanan Süre**: ~60-90 dakika  
**Edinilen Beceriler**:
- ✅ Şablon tabanlı proje başlatma
- ✅ Azure kaynak sağlama
- ✅ Uygulama dağıtım iş akışları
- ✅ Ortam yönetimi
- ✅ Yapılandırma yönetimi
- ✅ Kaynak temizleme ve maliyet yönetimi

**Bir Sonraki Adım**: İleri düzey yapılandırma desenlerini öğrenmek için [Yapılandırma Kılavuzu](configuration.md) hazır durumdasınız!

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
# Hata ayıklama günlüklemesini etkinleştir
export AZD_DEBUG=true
azd up --debug

# Azure'da uygulama günlüklerini görüntüle
azd monitor --logs

# Container Apps için Azure CLI'yi kullan:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Kaynak İsim Çakışmaları
```bash
# Benzersiz bir ortam adı kullanın
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Ağ Sorunları
```bash
# Portların kullanılabilir olup olmadığını kontrol edin
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sonraki Adımlar

İlk projenizi tamamladığınıza göre, bu ileri konuları inceleyin:

### 1. Altyapıyı Özelleştirin
- [Kod Olarak Altyapı](../chapter-04-infrastructure/provisioning.md)
- [Veritabanları, depolama ve diğer hizmetleri ekleyin](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD Kurun
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Tam CI/CD iş akışları
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline yapılandırması

### 3. Üretim En İyi Uygulamaları
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Güvenlik, performans ve izleme

### 4. Daha Fazla Şablonu Keşfedin
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
- [Azure İyi Mimarili Çerçeve](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Geliştirici Topluluğu](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Resmi Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Kurumsal Desenler](https://github.com/Azure/azure-dev/tree/main/templates)

---

**İlk azd projenizi tamamladığınız için tebrikler!** Artık güvenle Azure'da harika uygulamalar oluşturup dağıtmaya hazırsınız.

---

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum & Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Sonraki Ders**: [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı YZ çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->