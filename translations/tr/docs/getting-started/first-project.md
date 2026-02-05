# İlk Projeniz - Uygulamalı Eğitim

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../microsoft-foundry/microsoft-foundry-integration.md)

## Giriş

Azure Developer CLI projenize hoş geldiniz! Bu kapsamlı uygulamalı eğitim, azd kullanarak Azure üzerinde tam yığın bir uygulama oluşturma, dağıtma ve yönetme sürecini adım adım anlatır. React frontend, Node.js API backend ve MongoDB veritabanını içeren gerçek bir yapılacaklar uygulaması üzerinde çalışacaksınız.

## Öğrenme Hedefleri

Bu eğitimi tamamladığınızda:
- Şablonlar kullanarak azd proje başlatma iş akışını öğreneceksiniz
- Azure Developer CLI proje yapısını ve yapılandırma dosyalarını anlayacaksınız
- Altyapı sağlama ile birlikte Azure'a tam bir uygulama dağıtımı gerçekleştireceksiniz
- Uygulama güncellemeleri ve yeniden dağıtım stratejilerini uygulayacaksınız
- Geliştirme ve test için birden fazla ortam yöneteceksiniz
- Kaynak temizleme ve maliyet yönetimi uygulamalarını öğreneceksiniz

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Şablonlardan bağımsız olarak azd projeleri başlatma ve yapılandırma
- azd proje yapılarını etkili bir şekilde gezinme ve değiştirme
- Tek komutlarla Azure'a tam yığın uygulamalar dağıtma
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
# Azd kurulumunu kontrol et
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
# Mevcut şablonlara göz atın
azd template list

# Yapılacaklar uygulaması şablonunu başlatın
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# İstemi takip edin:
# - Bir ortam adı girin: "dev"
# - Bir abonelik seçin (birden fazla varsa)
# - Bir bölge seçin: "East US 2" (veya tercih ettiğiniz bölge)
```

### Ne Oldu?
- Şablon kodu yerel dizininize indirildi
- Hizmet tanımlarıyla bir `azure.yaml` dosyası oluşturuldu
- `infra/` dizininde altyapı kodu ayarlandı
- Bir ortam yapılandırması oluşturuldu

## Adım 2: Proje Yapısını Keşfedin

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

### Anlaşılması Gereken Temel Dosyalar

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

### Frontend'i Değiştirin
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
# Özel ortam değişkenlerini ayarla
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Tüm ortam değişkenlerini görüntüle
azd env get-values
```

## Adım 4: Azure'a Dağıtın

Şimdi heyecan verici kısım - her şeyi Azure'a dağıtın!

```bash
# Altyapı ve uygulamayı dağıt
azd up

# Bu komut şunları yapacak:
# 1. Azure kaynaklarını sağlama (App Service, Cosmos DB, vb.)
# 2. Uygulamanızı oluşturma
# 3. Sağlanan kaynaklara dağıtma
# 4. Uygulama URL'sini gösterme
```

### Dağıtım Sırasında Neler Oluyor?

`azd up` komutu şu adımları gerçekleştirir:
1. **Sağlama** (`azd provision`) - Azure kaynaklarını oluşturur
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
# Uygulama uç noktalarını al
azd show

# Uygulamayı tarayıcınızda aç
azd show --output json | jq -r '.services.web.endpoint'
```

### Yapılacaklar Uygulamasını Test Edin
1. **Bir yapılacak öğesi ekleyin** - "Add Todo"ya tıklayın ve bir görev girin
2. **Tamamlandı olarak işaretleyin** - Tamamlanan öğeleri işaretleyin
3. **Öğeleri silin** - Artık ihtiyacınız olmayan yapılacakları kaldırın

### Uygulamanızı İzleyin
```bash
# Kaynaklarınız için Azure portalını açın
azd monitor

# Uygulama günlüklerini görüntüleyin
azd logs
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
# Yalnızca uygulama kodunu dağıt (altyapıyı atla)
azd deploy

# Altyapı zaten mevcut olduğu için bu, 'azd up' işleminden çok daha hızlıdır
```

## Adım 7: Birden Fazla Ortam Yönetin

Üretim öncesi değişiklikleri test etmek için bir test ortamı oluşturun:

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

# Staging ortamını görüntüle
azd env select staging
azd show
```

## Adım 8: Kaynakları Temizleyin

Denemeyi bitirdiğinizde, devam eden ücretlerden kaçınmak için temizleyin:

```bash
# Mevcut ortam için tüm Azure kaynaklarını sil
azd down

# Onay olmadan zorla sil ve yumuşak silinmiş kaynakları temizle
azd down --force --purge

# Belirli bir ortamı sil
azd env select staging
azd down --force --purge
```

## Neler Öğrendiniz

Tebrikler! Başarıyla:
- ✅ Bir şablondan azd projesi başlattınız
- ✅ Proje yapısını ve temel dosyaları keşfettiniz
- ✅ Tam yığın bir uygulamayı Azure'a dağıttınız
- ✅ Kod değişiklikleri yaptınız ve yeniden dağıttınız
- ✅ Birden fazla ortam yönettiniz
- ✅ Kaynakları temizlediniz

## 🎯 Beceri Doğrulama Egzersizleri

### Egzersiz 1: Farklı Bir Şablon Dağıtın (15 dakika)
**Amaç**: azd başlatma ve dağıtım iş akışında ustalaşmak

```bash
# Python + MongoDB yığını deneyin
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Dağıtımı doğrulayın
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Temizlik yapın
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Uygulama hatasız bir şekilde dağıtılır
- [ ] Uygulama URL'sine tarayıcıdan erişilebilir
- [ ] Uygulama düzgün çalışır (yapılacaklar ekle/sil)
- [ ] Tüm kaynaklar başarıyla temizlenir

### Egzersiz 2: Yapılandırmayı Özelleştirin (20 dakika)
**Amaç**: Ortam değişkeni yapılandırma pratiği yapmak

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
- [ ] Özel bir ortam başarıyla oluşturuldu
- [ ] Ortam değişkenleri ayarlandı ve alınabilir
- [ ] Uygulama özel yapılandırmayla dağıtıldı
- [ ] Dağıtılan uygulamada özel ayarları doğrulayabilirsiniz

### Egzersiz 3: Çoklu Ortam İş Akışı (25 dakika)
**Amaç**: Ortam yönetimi ve dağıtım stratejilerinde ustalaşmak

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

# Her iki ortamı test et
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Her ikisini temizle
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Farklı yapılandırmalara sahip iki ortam oluşturuldu
- [ ] Her iki ortam da başarıyla dağıtıldı
- [ ] `azd env select` kullanarak ortamlar arasında geçiş yapılabilir
- [ ] Ortam değişkenleri ortamlar arasında farklılık gösterir
- [ ] Her iki ortam da başarıyla temizlendi

## 📊 İlerlemeniz

**Harcanan Zaman**: ~60-90 dakika  
**Kazanılan Beceriler**:
- ✅ Şablon tabanlı proje başlatma
- ✅ Azure kaynak sağlama
- ✅ Uygulama dağıtım iş akışları
- ✅ Ortam yönetimi
- ✅ Yapılandırma yönetimi
- ✅ Kaynak temizleme ve maliyet yönetimi

**Sonraki Seviye**: Gelişmiş yapılandırma desenlerini öğrenmek için [Yapılandırma Kılavuzu](configuration.md) hazır!

## Yaygın Sorunları Giderme

### Kimlik Doğrulama Hataları
```bash
# Azure ile yeniden kimlik doğrulama
az login

# Abonelik erişimini doğrula
az account show
```

### Dağıtım Hataları
```bash
# Hata ayıklama kaydını etkinleştir
export AZD_DEBUG=true
azd up --debug

# Ayrıntılı günlükleri görüntüle
azd logs --service api
azd logs --service web
```

### Kaynak Adı Çakışmaları
```bash
# Benzersiz bir ortam adı kullanın
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Ağ Sorunları
```bash
# Bağlantı noktalarının uygun olup olmadığını kontrol et
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sonraki Adımlar

İlk projenizi tamamladığınıza göre, bu gelişmiş konuları keşfedin:

### 1. Altyapıyı Özelleştirin
- [Kod Olarak Altyapı](../deployment/provisioning.md)
- [Veritabanları, depolama ve diğer hizmetleri ekleyin](../deployment/provisioning.md#adding-services)

### 2. CI/CD Kurun
- [GitHub Actions Entegrasyonu](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Üretim İçin En İyi Uygulamalar
- [Güvenlik yapılandırmaları](../deployment/best-practices.md#security)
- [Performans optimizasyonu](../deployment/best-practices.md#performance)
- [İzleme ve günlükleme](../deployment/best-practices.md#monitoring)

### 4. Daha Fazla Şablon Keşfedin
```bash
# Kategorilere göre şablonlara göz atın
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
- [Azure İyi Tasarlanmış Çerçeve](https://learn.microsoft.com/en-us/azure/well-architected/)

### Topluluk ve Destek
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Topluluğu](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Şablonlar ve Örnekler
- [Resmi Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Şablonları](https://github.com/Azure-Samples/azd-templates)
- [Kurumsal Desenler](https://github.com/Azure/azure-dev/tree/main/templates)

---

**İlk azd projenizi tamamladığınız için tebrikler!** Artık Azure üzerinde harika uygulamalar oluşturup dağıtmak için hazırsınız.

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel Bilgiler ve Hızlı Başlangıç
- **⬅️ Önceki**: [Kurulum ve Ayarlar](installation.md)
- **➡️ Sonraki**: [Yapılandırma](configuration.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../microsoft-foundry/microsoft-foundry-integration.md)
- **Sonraki Ders**: [Dağıtım Kılavuzu](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->