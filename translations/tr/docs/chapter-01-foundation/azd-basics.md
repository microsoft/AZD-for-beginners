# AZD Temelleri - Azure Developer CLI'yi Anlamak

# AZD Temelleri - Temel Kavramlar ve İlkeler

**Bölüm Gezintisi:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç
- **⬅️ Önceki**: [Kurs Genel Bakışı](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Sonraki**: [Yükleme ve Kurulum](installation.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Giriş

Bu ders, yerel geliştiricilikten Azure dağıtımına kadar yolculuğunuzu hızlandıran güçlü bir komut satırı aracı olan Azure Developer CLI (azd) ile tanıştırır. Temel kavramları, çekirdek özellikleri öğrenecek ve azd'nin bulut yerel uygulama dağıtımını nasıl basitleştirdiğini anlayacaksınız.

## Öğrenme Hedefleri

Bu dersin sonunda şunları yapabileceksiniz:
- Azure Developer CLI'nin ne olduğunu ve temel amacını anlamak
- şablonlar, ortamlar ve servisler gibi temel kavramları öğrenmek
- şablon odaklı geliştirme ve Kod olarak Altyapı dahil olmak üzere ana özellikleri keşfetmek
- azd proje yapısını ve iş akışını anlamak
- geliştirme ortamınız için azd'yi yüklemeye ve yapılandırmaya hazır olmak

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- Modern bulut geliştirme iş akışlarındaki azd'nin rolünü açıklamak
- bir azd proje yapısının bileşenlerini tanımlamak
- şablonların, ortamların ve servislerin birlikte nasıl çalıştığını tarif etmek
- azd ile Kod olarak Altyapı'nın faydalarını anlamak
- farklı azd komutlarını ve amaçlarını tanımak

## Azure Developer CLI (azd) Nedir?

Azure Developer CLI (azd), yerel geliştirmeden Azure dağıtımına kadar yolculuğunuzu hızlandırmak için tasarlanmış bir komut satırı aracıdır. Azure'da bulut yerel uygulamaları oluşturma, dağıtma ve yönetme sürecini basitleştirir.

### azd ile Neler Dağıtabilirsiniz?

azd çok çeşitli iş yüklerini destekler—ve liste sürekli genişliyor. Bugün azd ile şu tür dağıtımları yapabilirsiniz:

| İş Yükü Türü | Örnekler | Aynı İş Akışı? |
|---------------|----------|----------------|
| **Geleneksel uygulamalar** | Web uygulamaları, REST API'ler, statik siteler | ✅ `azd up` |
| **Servisler ve mikroservisler** | Container Apps, Function Apps, çok servisli arka uçlar | ✅ `azd up` |
| **Yapay zeka destekli uygulamalar** | Microsoft Foundry Modelleri ile sohbet uygulamaları, AI Search ile RAG çözümleri | ✅ `azd up` |
| **Akıllı ajanlar** | Foundry barındırılan ajanlar, çoklu ajan orkestrasyonları | ✅ `azd up` |

Ana fikir şudur: **azd yaşam döngüsü, ne dağıttığınıza bakılmaksızın aynı kalır**. Bir projeyi başlatır, altyapıyı sağlarsınız, kodunuzu dağıtırsınız, uygulamanızı izlersiniz ve temizlersiniz—ister basit bir web sitesi ister sofistike bir AI ajan olsun.

Bu süreklilik tasarım gereğidir. azd, AI yeteneklerini uygulamanızın kullanabileceği başka bir servis olarak ele alır; temelde farklı bir şey olarak değil. Microsoft Foundry Modelleri ile desteklenen bir sohbet uç noktası, azd'nin perspektifinden yapılandırılması ve dağıtılması gereken başka bir servistir.

### 🎯 Neden AZD Kullanmalı? Gerçek Dünya Karşılaştırması

Basit bir web uygulaması ile veritabanı dağıtımını karşılaştıralım:

#### ❌ AZD OLMADAN: Manuel Azure Dağıtımı (30+ dakika)

```bash
# Adım 1: Kaynak grubu oluşturun
az group create --name myapp-rg --location eastus

# Adım 2: App Service Planı oluşturun
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# Adım 3: Web uygulaması oluşturun
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# Adım 4: Cosmos DB hesabı oluşturun (10-15 dakika)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# Adım 5: Veritabanı oluşturun
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# Adım 6: Koleksiyon oluşturun
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# Adım 7: Bağlantı dizesini alın
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# Adım 8: Uygulama ayarlarını yapılandırın
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# Adım 9: Günlüğü etkinleştirin
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# Adım 10: Application Insights'ı kurun
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# Adım 11: Application Insights'ı Web uygulamasına bağlayın
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# Adım 12: Uygulamayı yerel olarak derleyin
npm install
npm run build

# Adım 13: Dağıtım paketini oluşturun
zip -r app.zip . -x "*.git*" "node_modules/*"

# Adım 14: Uygulamayı dağıtın
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# Adım 15: Bekleyin ve çalışması için dua edin 🙏
# (Otomatik doğrulama yok, manuel test gereklidir)
```

**Sorunlar:**
- ❌ Hatırlanması ve sırayla yürütülmesi gereken 15+ komut
- ❌ 30-45 dakika süren manuel çalışma
- ❌ Hatalar yapmak kolay (yazım hataları, yanlış parametreler)
- ❌ Bağlantı dizeleri terminal geçmişinde ortaya çıkabilir
- ❌ Bir şey ters giderse otomatik geri alma yok
- ❌ Ekip üyeleri için kopyalanması zor
- ❌ Her seferinde farklı (yeniden üretilebilir değil)

#### ✅ AZD İLE: Otomatik Dağıtım (5 komut, 10-15 dakika)

```bash
# Adım 1: Şablondan başlat
azd init --template todo-nodejs-mongo

# Adım 2: Kimlik doğrula
azd auth login

# Adım 3: Ortam oluştur
azd env new dev

# Adım 4: Değişiklikleri önizle (isteğe bağlı ama önerilir)
azd provision --preview

# Adım 5: Her şeyi dağıt
azd up

# ✨ Tamam! Her şey dağıtıldı, yapılandırıldı ve izleniyor
```

**Faydalar:**
- ✅ **5 komut** vs. 15+ manuel adım
- ✅ **10-15 dakika** toplam süre (çoğunlukla Azure bekleme süresi)
- ✅ **Daha az manuel hata** - tutarlı, şablon odaklı iş akışı
- ✅ **Güvenli gizli yönetimi** - birçok şablon Azure tarafından yönetilen gizli depolamayı kullanır
- ✅ **Tekrarlanabilir dağıtımlar** - her seferinde aynı iş akışı
- ✅ **Tamamen yeniden üretilebilir** - her seferinde aynı sonuç
- ✅ **Ekip hazır** - herkes aynı komutlarla dağıtım yapabilir
- ✅ **Kod olarak Altyapı** - sürüm kontrolü altında Bicep şablonları
- ✅ **Yerleşik izleme** - Application Insights otomatik olarak yapılandırılır

### 📊 Zaman ve Hata Azaltma

| Metrik | Manuel Dağıtım | AZD Dağıtımı | İyileşme |
|:-------|:------------------|:---------------|:------------|
| **Komutlar** | 15+ | 5 | %67 daha az |
| **Süre** | 30-45 dk | 10-15 dk | %60 daha hızlı |
| **Hata Oranı** | ~%40 | <%5 | %88 azalma |
| **Tutarlılık** | Düşük (manuel) | %100 (otomatik) | Mükemmel |
| **Ekip Katılımı** | 2-4 saat | 30 dakika | %75 daha hızlı |
| **Geri Alma Süresi** | 30+ dk (manuel) | 2 dk (otomatik) | %93 daha hızlı |

## Temel Kavramlar

### Şablonlar
Şablonlar azd'nin temelidir. Bunlar şunları içerir:
- **Uygulama kodu** - Kaynak kodunuz ve bağımlılıklarınız
- **Altyapı tanımları** - Bicep veya Terraform ile tanımlanmış Azure kaynakları
- **Yapılandırma dosyaları** - Ayarlar ve ortam değişkenleri
- **Dağıtım betikleri** - Otomatikleştirilmiş dağıtım iş akışları

### Ortamlar
Ortamlar farklı dağıtım hedeflerini temsil eder:
- **Development** - Test ve geliştirme için
- **Staging** - Üretim öncesi ortam
- **Production** - Canlı üretim ortamı

Her ortam kendi şunları korur:
- Azure kaynak grubu
- Yapılandırma ayarları
- Dağıtım durumu

### Servisler
Servisler uygulamanızın yapı taşlarıdır:
- **Frontend** - Web uygulamaları, SPA'lar
- **Backend** - API'ler, mikroservisler
- **Database** - Veri depolama çözümleri
- **Storage** - Dosya ve blob depolama

## Temel Özellikler

### 1. Şablon Odaklı Geliştirme
```bash
# Mevcut şablonlara göz at
azd template list

# Bir şablondan başlat
azd init --template <template-name>
```

### 2. Kod Olarak Altyapı
- **Bicep** - Azure'ın alan özel dili
- **Terraform** - Çoklu bulut altyapı aracı
- **ARM Templates** - Azure Resource Manager şablonları

### 3. Entegre İş Akışları
```bash
# Tam dağıtım iş akışı
azd up            # Kaynak sağlama + Dağıtım, ilk kurulum için elle müdahale gerektirmez

# 🧪 YENİ: Dağıtımdan önce altyapı değişikliklerini önizleyin (GÜVENLİ)
azd provision --preview    # Değişiklik yapmadan altyapı dağıtımını simüle edin

azd provision     # Altyapıyı güncellerseniz Azure kaynaklarını oluşturmak için bunu kullanın
azd deploy        # Uygulama kodunu dağıtın veya güncelleme sonrasında yeniden dağıtın
azd down          # Kaynakları temizleyin
```

#### 🛡️ Önizlemeyle Güvenli Altyapı Planlaması
`azd provision --preview` komutu güvenli dağıtımlar için oyunu değiştirir:
- **Kuru çalıştırma analizi** - Ne oluşturulacağını, değiştirileceğini veya silineceğini gösterir
- **Sıfır risk** - Azure ortamınız üzerinde gerçek değişiklikler yapılmaz
- **Ekip iş birliği** - Dağıtımdan önce önizleme sonuçlarını paylaşın
- **Maliyet tahmini** - Taahhüt öncesi kaynak maliyetlerini anlayın

```bash
# Örnek önizleme iş akışı
azd provision --preview           # Nelerin değişeceğini görün
# Çıktıyı gözden geçirin, ekiple tartışın
azd provision                     # Değişiklikleri güvenle uygulayın
```

### 📊 Görsel: AZD Geliştirme İş Akışı

```mermaid
graph LR
    A[azd init] -->|Projeyi başlat| B[azd auth login]
    B -->|Kimlik doğrula| C[azd env new]
    C -->|Ortam oluştur| D{İlk dağıtım mı?}
    D -->|Evet| E[azd up]
    D -->|Hayır| F[azd provision --preview]
    F -->|Değişiklikleri gözden geçir| G[azd provision]
    E -->|Hazırlar ve dağıtır| H[Kaynaklar çalışıyor]
    G -->|Altyapıyı günceller| H
    H -->|İzle| I[azd monitor]
    I -->|Kod değişiklikleri yap| J[azd deploy]
    J -->|Sadece kodu yeniden dağıt| H
    H -->|Temizle| K[azd down]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```
**İş Akışı Açıklaması:**
1. **Init** - Şablon veya yeni projeyle başlatın
2. **Auth** - Azure ile kimlik doğrulaması yapın
3. **Environment** - İzole bir dağıtım ortamı oluşturun
4. **Preview** - 🆕 Altyapı değişikliklerini her zaman önce önizleyin (güvenli uygulama)
5. **Provision** - Azure kaynaklarını oluştur/güncelle
6. **Deploy** - Uygulama kodunuzu gönderin
7. **Monitor** - Uygulama performansını izleyin
8. **Iterate** - Değişiklik yapın ve kodu yeniden dağıtın
9. **Cleanup** - İşiniz bittiğinde kaynakları kaldırın

### 4. Ortam Yönetimi
```bash
# Ortamlar oluşturun ve yönetin
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

### 5. Eklentiler ve Yapay Zeka Komutları

azd, çekirdek CLI'nin ötesinde yetenekler eklemek için bir eklenti sistemi kullanır. Bu, özellikle AI iş yükleri için faydalıdır:

```bash
# Mevcut eklentileri listele
azd extension list

# Foundry ajanları eklentisini yükle
azd extension install azure.ai.agents

# Bir manifestten bir yapay zeka ajanı projesi başlat
azd ai agent init -m agent-manifest.yaml

# Yapay zeka destekli geliştirme için MCP sunucusunu başlat (Alfa)
azd mcp start
```

> Eklentiler, [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/agents.md) ve [AZD AI CLI Komutları](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) referansında ayrıntılı olarak ele alınmıştır.

## 📁 Proje Yapısı

Tipik bir azd proje yapısı:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Yapılandırma Dosyaları

### azure.yaml
Ana proje yapılandırma dosyası:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Ortam özel yapılandırması:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Yaygın İş Akışları ve Uygulamalı Egzersizler

> **💡 Öğrenme İpucu:** Bu egzersizleri sırasıyla takip ederek AZD becerilerinizi kademeli olarak geliştirin.

### 🎯 Alıştırma 1: İlk Projenizi Başlatın

**Amaç:** Bir AZD projesi oluşturup yapısını keşfetmek

**Adımlar:**
```bash
# Kanıtlanmış bir şablon kullanın
azd init --template todo-nodejs-mongo

# Oluşturulan dosyaları keşfedin
ls -la  # Gizli dosyalar da dahil olmak üzere tüm dosyaları görüntüleyin

# Oluşturulan ana dosyalar:
# - azure.yaml (ana yapılandırma)
# - infra/ (altyapı kodu)
# - src/ (uygulama kodu)
```

**✅ Başarı:** azure.yaml, infra/ ve src/ dizinlerine sahipsiniz

---

### 🎯 Alıştırma 2: Azure'a Dağıtım

**Amaç:** Uçtan uca dağıtımı tamamlamak

**Adımlar:**
```bash
# 1. Kimlik doğrula
az login && azd auth login

# 2. Ortam oluştur
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. Değişiklikleri önizle (TAVSİYE EDİLİR)
azd provision --preview

# 4. Her şeyi dağıt
azd up

# 5. Dağıtımı doğrula
azd show    # Uygulamanızın URL'sini görüntüle
```

**Beklenen Süre:** 10-15 dakika  
**✅ Başarı:** Uygulama URL'si tarayıcıda açılır

---

### 🎯 Alıştırma 3: Birden Fazla Ortam

**Amaç:** dev ve staging ortamlarına dağıtım yapmak

**Adımlar:**
```bash
# Dev zaten var, staging oluştur
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# Aralarında geçiş yap
azd env list
azd env select dev
```

**✅ Başarı:** Azure Portal'da iki ayrı kaynak grubu

---

### 🛡️ Temiz Başlangıç: `azd down --force --purge`

Tamamen sıfırlamanız gerektiğinde:

```bash
azd down --force --purge
```

**Ne yapar:**
- `--force`: Onay istemleri yok
- `--purge`: Tüm yerel durumu ve Azure kaynaklarını siler

**Kullanım durumları:**
- Dağıtım yarıda başarısız olduysa
- Projeler arası geçiş yapılıyorsa
- Temiz bir başlangıca ihtiyaç duyuluyorsa

---

## 🎪 Orijinal İş Akışı Referansı

### Yeni Bir Proje Başlatma
```bash
# Yöntem 1: Mevcut şablonu kullan
azd init --template todo-nodejs-mongo

# Yöntem 2: Sıfırdan başla
azd init

# Yöntem 3: Mevcut dizini kullan
azd init .
```

### Geliştirme Döngüsü
```bash
# Geliştirme ortamını kurun
azd auth login
azd env new dev
azd env select dev

# Her şeyi dağıtın
azd up

# Değişiklik yapın ve yeniden dağıtın
azd deploy

# İşiniz bittiğinde temizleyin
azd down --force --purge # Azure Developer CLI'deki komut, ortamınız için bir **tam sıfırlamadır**—özellikle başarısız dağıtımları giderirken, sahipsiz kaynakları temizlerken veya temiz bir yeniden dağıtım için hazırlık yaparken kullanışlıdır.
```

## `azd down --force --purge` Komutunu Anlamak
`azd down --force --purge` komutu, azd ortamınızı ve ilişkili tüm kaynakları tamamen kaldırmak için güçlü bir yoldur. Her bayrağın ne yaptığını aşağıda bulabilirsiniz:
```
--force
```
- Onay istemlerini atlar.
- Otomasyon veya betikleme için, manuel girişin mümkün olmadığı durumlarda kullanışlıdır.
- CLI tutarsızlıkları algılasa bile, temizleme işleminin kesintisiz ilerlemesini sağlar.

```
--purge
```
Tüm ilişkili **meta verilerini** siler, bunlar arasında:
Ortam durumu
Yerel `.azure` klasörü
Önbelleğe alınmış dağıtım bilgileri
azd'nin önceki dağıtımları "hatırlamasını" engeller; bu, eşleşmeyen kaynak grupları veya eski kayıt defteri referansları gibi sorunlara yol açabilir.


### Neden her ikisini kullanmalı?
`azd up` komutuyla kalıcı durum veya kısmi dağıtımlar nedeniyle sorun yaşadığınızda, bu kombinasyon **temiz bir başlangıç** sağlar.

Azure portalında manuel kaynak silme sonrası veya şablonlar, ortamlar ya da kaynak grubu adlandırma kurallarını değiştirirken özellikle yardımcı olur.


### Birden Fazla Ortamı Yönetme
```bash
# Hazırlık ortamı oluştur
azd env new staging
azd env select staging
azd up

# Geliştirme ortamına geri dön
azd env select dev

# Ortamları karşılaştır
azd env list
```

## 🔐 Kimlik Doğrulama ve Kimlik Bilgileri

Kimlik doğrulamayı anlamak, başarılı azd dağıtımları için çok önemlidir. Azure birden çok kimlik doğrulama yöntemi kullanır ve azd, diğer Azure araçlarının kullandığı aynı kimlik bilgisi zincirinden yararlanır.

### Azure CLI Kimlik Doğrulama (`az login`)

azd'yi kullanmadan önce Azure ile kimlik doğrulaması yapmanız gerekir. En yaygın yöntem Azure CLI kullanmaktır:

```bash
# Etkileşimli oturum açma (tarayıcıyı açar)
az login

# Belirli bir kiracı ile oturum açma
az login --tenant <tenant-id>

# Hizmet kimliği ile oturum açma
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# Mevcut oturum açma durumunu kontrol et
az account show

# Kullanılabilir abonelikleri listele
az account list --output table

# Varsayılan aboneliği ayarla
az account set --subscription <subscription-id>
```

### Kimlik Doğrulama Akışı
1. **Etkileşimli Giriş**: Kimlik doğrulama için varsayılan tarayıcınızı açar
2. **Cihaz Kodu Akışı**: Tarayıcı erişimi olmayan ortamlar için
3. **Servis Prensibi**: Otomasyon ve CI/CD senaryoları için
4. **Yönetilen Kimlik**: Azure'da barındırılan uygulamalar için

### DefaultAzureCredential Zinciri

`DefaultAzureCredential`, belirli bir sırayla birden çok kimlik bilgisi kaynağını otomatik olarak deneyerek basitleştirilmiş bir kimlik doğrulama deneyimi sağlayan bir kimlik bilgisi türüdür:

#### Kimlik Bilgisi Zinciri Sıralaması
```mermaid
graph TD
    A[Varsayılan Azure Kimlik Bilgisi] --> B[Ortam Değişkenleri]
    B --> C[İş Yükü Kimliği]
    C --> D[Yönetilen Kimlik]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure Komut Satırı (CLI)]
    G --> H[Azure PowerShell]
    H --> I[İnteraktif Tarayıcı]
```
#### 1. Ortam Değişkenleri
```bash
# Servis ana kimliği için ortam değişkenlerini ayarla
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
Otomatik olarak kullanıldığı yerler:
- Azure Kubernetes Service (AKS) üzerinde Workload Identity ile
- GitHub Actions'ta OIDC federasyonu ile
- Diğer federasyonlu kimlik senaryoları

#### 3. Yönetilen Kimlik
Aşağıdaki Azure kaynakları için:
- Sanal Makineler
- App Service
- Azure Functions
- Container Instances

```bash
# Yönetilen kimlik ile bir Azure kaynağında çalışıp çalışmadığını kontrol et
az account show --query "user.type" --output tsv
# Döndürür: "servicePrincipal" eğer yönetilen kimlik kullanılıyorsa
```

#### 4. Geliştirici Araçları Entegrasyonu
- **Visual Studio**: Otomatik olarak oturum açmış hesabı kullanır
- **VS Code**: Azure Account eklentisi kimlik bilgilerini kullanır
- **Azure CLI**: `az login` kimlik bilgilerini kullanır (yerel geliştirme için en yaygın)

### AZD Kimlik Doğrulama Kurulumu

```bash
# Yöntem 1: Azure CLI kullanın (Geliştirme için önerilir)
az login
azd auth login  # Mevcut Azure CLI kimlik bilgilerini kullanır

# Yöntem 2: Doğrudan azd kimlik doğrulaması
azd auth login --use-device-code  # Başsız ortamlar için

# Yöntem 3: Kimlik doğrulama durumunu kontrol edin
azd auth login --check-status

# Yöntem 4: Oturumdan çıkın ve yeniden kimlik doğrulayın
azd auth logout
azd auth login
```

### Kimlik Doğrulama En İyi Uygulamaları

#### Yerel Geliştirme
```bash
# 1. Azure CLI ile oturum açın
az login

# 2. Doğru aboneliği doğrulayın
az account show
az account set --subscription "Your Subscription Name"

# 3. Mevcut kimlik bilgileriyle azd kullanın
azd auth login
```

#### CI/CD Boru Hatları
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### Üretim Ortamları için
- Azure kaynaklarında çalıştırırken **Managed Identity** kullanın
- Otomasyon senaryoları için **Service Principal** kullanın
- Kimlik bilgilerini kodda veya yapılandırma dosyalarında saklamaktan kaçının
- Hassas yapılandırma için **Azure Key Vault** kullanın

### Yaygın Kimlik Doğrulama Sorunları ve Çözümleri

#### Sorun: "No subscription found"
```bash
# Çözüm: Varsayılan aboneliği ayarlayın
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Sorun: "Insufficient permissions"
```bash
# Çözüm: Gerekli rolleri kontrol edin ve atayın
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Yaygın gerekli roller:
# - Contributor (kaynak yönetimi için)
# - User Access Administrator (rol atamaları için)
```

#### Sorun: "Token expired"
```bash
# Çözüm: Yeniden kimlik doğrulayın
az logout
az login
azd auth logout
azd auth login
```

### Farklı Senaryolarda Kimlik Doğrulama

#### Yerel Geliştirme
```bash
# Kişisel gelişim hesabı
az login
azd auth login
```

#### Ekip Geliştirme
```bash
# Kuruluş için belirli bir kiracı kullanın
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### Çok kiracılı Senaryolar
```bash
# Kiracılar arasında geçiş yap
az login --tenant tenant1.onmicrosoft.com
# Kiracı 1'e dağıt
azd up

az login --tenant tenant2.onmicrosoft.com  
# Kiracı 2'ye dağıt
azd up
```

### Güvenlik Hususları
1. **Kimlik Bilgileri Depolama**: Kimlik bilgilerini kaynak kodda asla saklamayın
2. **Kapsam Sınırlaması**: Servis ilkeleri için en az ayrıcalık ilkesini kullanın
3. **Jeton Yenileme**: Servis ilkesi gizli anahtarlarını düzenli olarak değiştirin
4. **Denetim Kaydı**: Kimlik doğrulama ve dağıtım etkinliklerini izleyin
5. **Ağ Güvenliği**: Mümkün olduğunda özel uç noktalar kullanın

### Kimlik Doğrulama Sorun Giderme

```bash
# Kimlik doğrulama hatalarını ayıkla
azd auth login --check-status
az account show
az account get-access-token

# Yaygın tanılama komutları
whoami                          # Mevcut kullanıcı bağlamı
az ad signed-in-user show      # Azure AD kullanıcı ayrıntıları
az group list                  # Kaynak erişimini test et
```

## `azd down --force --purge` Komutunu Anlama

### Keşif
```bash
azd template list              # Şablonlara göz at
azd template show <template>   # Şablon ayrıntıları
azd init --help               # Başlatma seçenekleri
```

### Proje Yönetimi
```bash
azd show                     # Proje genel bakışı
azd env list                # Mevcut ortamlar ve seçili varsayılan
azd config show            # Yapılandırma ayarları
```

### İzleme
```bash
azd monitor                  # Azure Portal izleme sayfasını aç
azd monitor --logs           # Uygulama günlüklerini görüntüle
azd monitor --live           # Canlı metrikleri görüntüle
azd pipeline config          # CI/CD'yi kur
```

## En İyi Uygulamalar

### 1. Anlamlı İsimler Kullanın
```bash
# İyi
azd env new production-east
azd init --template web-app-secure

# Kaçın
azd env new env1
azd init --template template1
```

### 2. Şablonlardan Yararlanın
- Mevcut şablonlarla başlayın
- İhtiyaçlarınıza göre özelleştirin
- Kurumunuz için yeniden kullanılabilir şablonlar oluşturun

### 3. Ortam İzolasyonu
- dev/staging/prod için ayrı ortamlar kullanın
- Yerel makineden doğrudan üretime dağıtım yapmayın
- Üretim dağıtımları için CI/CD boru hatları kullanın

### 4. Yapılandırma Yönetimi
- Hassas veriler için ortam değişkenleri kullanın
- Yapılandırmayı sürüm kontrolünde tutun
- Ortama özgü ayarları belgelendirin

## Öğrenme İlerlemesi

### Başlangıç (1-2. Hafta)
1. azd'i yükleyin ve kimlik doğrulayın
2. Basit bir şablon dağıtın
3. Proje yapısını anlayın
4. Temel komutları öğrenin (up, down, deploy)

### Orta Düzey (3-4. Hafta)
1. Şablonları özelleştirin
2. Birden fazla ortamı yönetin
3. Altyapı kodunu anlayın
4. CI/CD boru hatları kurun

### İleri Düzey (5+ Hafta)
1. Özel şablonlar oluşturun
2. İleri altyapı desenleri
3. Çok bölgeli dağıtımlar
4. Kurumsal düzeyde yapılandırmalar

## Sonraki Adımlar

**📖 Bölüm 1 Öğrenimine Devam:**
- [Kurulum ve Yapılandırma](installation.md) - azd'nin kurulmasını ve yapılandırılmasını sağlayın
- [İlk Projeniz](first-project.md) - Uygulamalı eğitimi tamamlayın
- [Yapılandırma Kılavuzu](configuration.md) - İleri yapılandırma seçenekleri

**🎯 Sonraki Bölüme Hazır mısınız?**
- [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md) - AI uygulamaları geliştirmeye başlayın

## Ek Kaynaklar

- [Azure Developer CLI Genel Bakış](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Şablon Galerisi](https://azure.github.io/awesome-azd/)
- [Topluluk Örnekleri](https://github.com/Azure-Samples)

---

## 🙋 Sıkça Sorulan Sorular

### Genel Sorular

**S: AZD ile Azure CLI arasındaki fark nedir?**

C: Azure CLI (`az`) tekil Azure kaynaklarını yönetmek içindir. AZD (`azd`) ise tüm uygulamaları yönetmek içindir:

```bash
# Azure CLI - Düşük seviyeli kaynak yönetimi
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...daha birçok komut gerekiyor

# AZD - Uygulama düzeyinde yönetim
azd up  # Uygulamayı tüm kaynaklarıyla birlikte dağıtır
```

**Bunu şöyle düşünebilirsiniz:**
- `az` = Bireysel Lego tuğlaları üzerinde işlem yapmak
- `azd` = Tam Lego setleri ile çalışmak

---

**S: AZD'yi kullanmak için Bicep veya Terraform bilmem gerekiyor mu?**

C: Hayır! Şablonlarla başlayın:
```bash
# Mevcut şablonu kullanın - IaC bilgisine gerek yok
azd init --template todo-nodejs-mongo
azd up
```

Altyapıyı özelleştirmek için Bicep'i sonradan öğrenebilirsiniz. Şablonlar öğrenmek için çalışan örnekler sağlar.

---

**S: AZD şablonlarını çalıştırmanın maliyeti ne kadar?**

C: Maliyet şablona göre değişir. Çoğu geliştirme şablonu aylık $50-150 tutarındadır:

```bash
# Dağıtımdan önce maliyetleri önizle
azd provision --preview

# Kullanılmadığında her zaman temizle
azd down --force --purge  # Tüm kaynakları kaldırır
```

**İpucu:** Mümkün olan yerlerde ücretsiz katmanları kullanın:
- App Service: F1 (Ücretsiz) katman
- Microsoft Foundry Modelleri: Azure OpenAI 50.000 token/ay ücretsiz
- Cosmos DB: 1000 RU/s ücretsiz katman

---

**S: Mevcut Azure kaynaklarıyla AZD kullanabilir miyim?**

C: Evet, ancak sıfırdan başlamak daha kolaydır. AZD, tam yaşam döngüsünü yönettiğinde en iyi şekilde çalışır. Mevcut kaynaklar için:
```bash
# Seçenek 1: Mevcut kaynakları içe aktar (gelişmiş)
azd init
# Sonra infra/ dizinini mevcut kaynaklara referans verecek şekilde değiştirin

# Seçenek 2: Sıfırdan başla (önerilir)
azd init --template matching-your-stack
azd up  # Yeni bir ortam oluşturur
```

---

**S: Projemi ekip arkadaşlarımla nasıl paylaşırım?**

C: AZD projesini Git'e commit edin (ancak .azure klasörünü EKLEMEYİN):
```bash
# Varsayılan olarak zaten .gitignore'da
.azure/        # Sırlar ve ortam verilerini içerir
*.env          # Ortam değişkenleri

# O zamanki takım üyeleri:
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

Herkes aynı şablonlardan aynı altyapıyı alır.

---

### Sorun Giderme Soruları

**S: "azd up" yarıda kaldı. Ne yapmalıyım?**

C: Hata mesajını kontrol edin, düzeltin ve tekrar deneyin:
```bash
# Ayrıntılı günlükleri görüntüle
azd show

# Yaygın düzeltmeler:

# 1. Kota aşıldıysa:
azd env set AZURE_LOCATION "westus2"  # Farklı bir bölge deneyin

# 2. Kaynak adı çakışması varsa:
azd down --force --purge  # Sıfırdan başlatın
azd up  # Tekrar deneyin

# 3. Kimlik doğrulaması süresi dolduysa:
az login
azd auth login
azd up
```

**En yaygın sorun:** Yanlış Azure aboneliği seçilmiş
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**S: Yeniden provision etmeden sadece kod değişikliklerini nasıl dağıtırım?**

C: `azd up` yerine `azd deploy` kullanın:
```bash
azd up          # İlk kez: kaynak sağlama + dağıtım (yavaş)

# Kodda değişiklik yap...

azd deploy      # Sonraki seferler: sadece dağıtım (hızlı)
```

Hız karşılaştırması:
- `azd up`: 10-15 dakika (altyapıyı sağlar)
- `azd deploy`: 2-5 dakika (sadece kod)

---

**S: Altyapı şablonlarını özelleştirebilir miyim?**

C: Evet! `infra/` içindeki Bicep dosyalarını düzenleyin:
```bash
# azd init'ten sonra
cd infra/
code main.bicep  # VS Code'da düzenle

# Değişiklikleri önizle
azd provision --preview

# Değişiklikleri uygula
azd provision
```

**İpucu:** Küçük başlayın - önce SKU'ları değiştirin:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**S: AZD'nin oluşturduklarının tamamını nasıl silerim?**

C: Tek bir komut tüm kaynakları kaldırır:
```bash
azd down --force --purge

# Bu şunları siler:
# - Tüm Azure kaynakları
# - Kaynak grubu
# - Yerel ortam durumu
# - Önbelleğe alınmış dağıtım verileri
```

**Bunu her zaman çalıştırın:**
- Bir şablonun testini tamamladığınızda
- Farklı bir projeye geçerken
- Yeniden başlamak istediğinizde

**Maliyet tasarrufu:** Kullanılmayan kaynakları silmek = $0 ücret

---

**S: Azure Portal'da kaynakları yanlışlıkla sildiysem ne olur?**

C: AZD durumu senkron dışı kalabilir. Temiz başlangıç yaklaşımı:
```bash
# 1. Yerel durumu kaldır
azd down --force --purge

# 2. Sıfırdan başla
azd up

# Alternatif: AZD'nin tespit edip düzeltmesine izin ver
azd provision  # Eksik kaynakları oluşturacak
```

---

### Gelişmiş Sorular

**S: AZD'yi CI/CD boru hatlarında kullanabilir miyim?**

C: Evet! GitHub Actions örneği:
```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**S: Gizli ve hassas verileri nasıl yönetirim?**

C: AZD otomatik olarak Azure Key Vault ile entegre olur:
```bash
# Sırlar kodda değil Key Vault'ta saklanır
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD otomatik olarak:
# 1. Key Vault oluşturur
# 2. Sırrı saklar
# 3. Yönetilen Kimlik aracılığıyla uygulamaya erişim verir
# 4. Çalışma zamanında enjekte eder
```

**Asla commit etmeyin:**
- `.azure/` klasörü (ortam verilerini içerir)
- `.env` dosyaları (yerel gizli veriler)
- Bağlantı dizeleri

---

**S: Birden fazla bölgeye dağıtım yapabilir miyim?**

C: Evet, her bölge için bir ortam oluşturun:
```bash
# Doğu ABD ortamı
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# Batı Avrupa ortamı
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# Her ortam bağımsızdır
azd env list
```

Gerçek çok bölgeli uygulamalar için, Bicep şablonlarını aynı anda birden fazla bölgeye dağıtacak şekilde özelleştirin.

---

**S: Takılırsam nereden yardım alabilirim?**

1. **AZD Belgeleri:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub Sorunları:** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure Discord](https://discord.gg/microsoft-azure) - #azure-developer-cli kanalı
4. **Stack Overflow:** Etiket `azure-developer-cli`
5. **Bu Kurs:** [Sorun Giderme Kılavuzu](../chapter-07-troubleshooting/common-issues.md)

**İpucu:** Sormadan önce şunu çalıştırın:
```bash
azd show       # Mevcut durumu gösterir
azd version    # Sürümünüzü gösterir
```
Bu bilgileri sorunuza ekleyin, daha hızlı yardım almak için.

---

## 🎓 Sırada Ne Var?

Artık AZD temellerini anlıyorsunuz. Yolunuzu seçin:

### 🎯 Yeni Başlayanlar için:
1. **Sonraki:** [Kurulum ve Yapılandırma](installation.md) - Makinenize AZD'yi kurun
2. **Sonra:** [İlk Projeniz](first-project.md) - İlk uygulamanızı dağıtın
3. **Uygulama:** Bu dersteki tüm 3 alıştırmayı tamamlayın

### 🚀 AI Geliştiricileri için:
1. **Atla:** [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **Dağıtın:** `azd init --template get-started-with-ai-chat` ile başlayın
3. **Öğrenin:** Dağıtırken inşa edin

### 🏗️ Deneyimli Geliştiriciler için:
1. **Gözden Geçirin:** [Yapılandırma Kılavuzu](configuration.md) - İleri düzey ayarlar
2. **Keşfedin:** [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md) - Bicep derinlemesine inceleme
3. **Oluşturun:** Yığınınız için özel şablonlar oluşturun

---

**Chapter Navigation:**
- **📚 Kurs Ana Sayfa**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 1 - Temel & Hızlı Başlangıç  
- **⬅️ Önceki**: [Kurs Genel Bakış](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Sonraki**: [Kurulum ve Yapılandırma](installation.md)
- **🚀 Sonraki Bölüm**: [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğinin farkında olun. Orijinal belgenin kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->