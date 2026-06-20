# Bölüm Gezintisi

**📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 3 - Yapılandırma ve Kimlik Doğrulama
- **⬅️ Önceki**: [İlk Projeniz](first-project.md)
- **➡️ Sonraki**: [Dağıtım Rehberi](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sonraki Bölüm**: [Bölüm 4: Kod Olarak Altyapı](../chapter-04-infrastructure/deployment-guide.md)

## Giriş

Bu kapsamlı rehber, Azure Developer CLI'yi en uygun geliştirme ve dağıtım iş akışları için yapılandırmanın tüm yönlerini kapsar. Yapılandırma hiyerarşisini, ortam yönetimini, kimlik doğrulama yöntemlerini ve güvenli Azure dağıtımlarını sağlayan gelişmiş yapılandırma desenlerini öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda:
- azd yapılandırma hiyerarşisinde ustalaşacak ve ayarların nasıl önceliklendirildiğini anlayacaksınız
- genel ve proje-özel ayarları etkili şekilde yapılandıracaksınız
- farklı yapılandırmalara sahip birden çok ortamı yöneteceksiniz
- güvenli kimlik doğrulama ve yetkilendirme desenlerini uygulayacaksınız
- karmaşık senaryolar için gelişmiş yapılandırma desenlerini anlayacaksınız

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra, şunları yapabileceksiniz:
- azd'yi en iyi geliştirme iş akışları için yapılandırmak
- birden çok dağıtım ortamı kurup yönetmek
- güvenli yapılandırma yönetimi uygulamaları uygulamak
- yapılandırma ile ilgili sorunları gidermek
- belirli kuruluş gereksinimleri için azd davranışını özelleştirmek

Bu kapsamlı rehber, Azure Developer CLI'yi en uygun geliştirme ve dağıtım iş akışları için yapılandırmanın tüm yönlerini kapsar.

## Bir azd Projesinde Yapay Zeka Ajanlarını Anlamak

Eğer AI ajanlarına yeniseniz, azd dünyasında onları düşünmenin basit bir yolu şu şekildedir.

### Ajan Nedir?

Bir ajan, bir isteği alabilen, üzerinde akıl yürütebilen ve genellikle bir AI modeli çağırarak, veri arayarak veya diğer hizmetleri çağırarak eylem gerçekleştiren bir yazılım parçasıdır. Bir azd projesinde, bir ajan web ön yüzünüzün veya API arka ucunuzun yanında başka bir **servis**'tir.

### Ajanlar azd Proje Yapısına Nasıl Uyuyor

Bir azd projesi üç katmandan oluşur: **altyapı**, **kod** ve **yapılandırma**. Ajanlar bu katmanlara diğer servislerin yaptığı şekilde entegre olur:

| Katman | Geleneksel Bir Uygulama İçin Ne Yapar | Bir Ajan İçin Ne Yapar |
|-------|-------------------------------------|---------------------------|
| **Altyapı** (`infra/`) | Bir web uygulaması ve veritabanı sağlar | Bir AI model uç noktası, arama dizini veya ajan barındırıcısı sağlar |
| **Kod** (`src/`) | Ön yüzünüzün ve API kaynak kodunuzu içerir | Ajan mantığınızı ve istem/komut tanımlarınızı içerir |
| **Yapılandırma** (`azure.yaml`) | Servislerinizi ve barındırma hedeflerini listeler | Ajanınızı bir servis olarak listeler, koduna ve barındırma hedefine işaret eder |

### `azure.yaml`'in Rolü

Sözdizimini şu an ezberlemeniz gerekmez. Kavramsal olarak, `azure.yaml` azd'ye şunu söylediğiniz dosyadır: *"İşte uygulamamı oluşturan servisler ve işte kodlarını bulabileceğiniz yerler."*

Projeniz bir AI ajanı içerdiğinde, `azure.yaml` basitçe bu ajanı servislerden biri olarak listeler. azd, doğru altyapıyı (ör. bir Microsoft Foundry Models uç noktası veya ajanı barındırmak için bir Container App gibi) sağlamayı ve ajan kodunuzu dağıtmayı bilir—tıpkı bir web uygulaması veya API için yapacağı gibi.

Bu, öğrenilecek temelde yeni bir şey olmadığı anlamına gelir. azd'nin bir web servisini nasıl yönettiğini anlıyorsanız, bir ajanın nasıl yönetildiğini de zaten anlamışsınızdır.

## Yapılandırma Hiyerarşisi

azd hiyerarşik bir yapılandırma sistemi kullanır:
1. **Komut satırı bayrakları** (en yüksek öncelik)
2. **Ortam değişkenleri**
3. **Yerel proje yapılandırması** (`.azd/config.json`)
4. **Küresel kullanıcı yapılandırması** (`~/.azd/config.json`)
5. **Varsayılan değerler** (en düşük öncelik)

## Genel Yapılandırma

### Küresel Varsayılanları Ayarlama
```bash
# Varsayılan aboneliği ayarla
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Varsayılan konumu ayarla
azd config set defaults.location "eastus2"

# Varsayılan kaynak grubu isimlendirme kuralını ayarla
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tüm genel yapılandırmayı görüntüle
azd config show

# Bir yapılandırmayı kaldır
azd config unset defaults.location
```

### Yaygın Küresel Ayarlar
```bash
# Geliştirme tercihleri
azd config set alpha.enable true                    # Alfa özelliklerini etkinleştir
azd config set telemetry.enabled false             # Telemetriyi devre dışı bırak
azd config set output.format json                  # Çıktı formatını ayarla

# Güvenlik ayarları
azd config set auth.useAzureCliCredential true     # Kimlik doğrulama için Azure CLI kullan
azd config set tls.insecure false                  # TLS doğrulamasını zorunlu kıl

# Performans ayarları
azd config set provision.parallelism 5             # Kaynakların paralel oluşturulması
azd config set deploy.timeout 30m                  # Dağıtım zaman aşımı
```

## 🏗️ Proje Yapılandırması

### azure.yaml Yapısı
`azure.yaml` dosyası azd projenizin kalbidir:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Servis Yapılandırma Seçenekleri

#### Barındırma Türleri
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Dil-Özel Ayarlar
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Ortam Yönetimi

### Ortam Oluşturma
```bash
# Yeni bir ortam oluştur
azd env new development

# Belirli bir konumla oluştur
azd env new staging --location "westus2"

# Şablondan oluştur
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Ortam Yapılandırması
Her ortamın kendi yapılandırması `.azure/<env-name>/config.json` içindedir:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Ortam Değişkenleri
```bash
# Ortam için özel değişkenleri ayarla
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Ortam değişkenlerini görüntüle
azd env get-values

# Beklenen çıktı:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Ortam değişkenini kaldır
azd env unset DEBUG

# Kaldırmayı doğrula
azd env get-values | grep DEBUG
# (hiçbir şey döndürmemeli)
```

### Ortam Şablonları
Tutarlı ortam kurulumu için `.azure/env.template` oluşturun:
```bash
# Gerekli değişkenler
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Uygulama ayarları
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# İsteğe bağlı geliştirme ayarları
DEBUG=false
LOG_LEVEL=info
```

### Ortamları Bir Ekip Arasında Paylaşma

Bir projede birden fazla kişi çalıştığında, **hangi öğelerin repo ile taşındığı ve hangi öğelerin yerel kaldığı** konusunda anlaşmanız gerekir. azd her ortamı `.azure/` klasörü altında tutar ve tamamının commit edilmesi gerekmez.

**`.azure/` içinde neler var:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Neyi gitignore etmelisiniz.** azd'nin varsayılan `.gitignore` dosyası zaten `.azure/`'yı hariç tutar. Böyle kalmasına dikkat edin—`.env` dosyaları gizli bilgileri içerebilir ve kaynak kimlikleri bunları oluşturan kişiye özeldir. Her ekip üyesi **kendi** ortamını yerel olarak oluşturur:

```bash
# Her geliştirici kendi izole ortamını elde etmek için bunu bir kez çalıştırır.
azd env new dev-alice
azd up
```

**Ortamlar arasında geçiş yapma.** Birden çok ortamı yöneten geliştirici, komutları çalıştırmadan önce aktif olanı seçer:

```bash
azd env list                 # tüm yerel ortamları ve hangisinin varsayılan olduğunu gör
azd env select staging       # 'staging' ortamını aktif yap
azd env get-values           # doğru olanı işaret ettiğinden emin ol
```

**Takım için gizli olmayan varsayılanlar sağlama.** Bir şablon (yukarıdaki `.azure/env.template` gibi) commit edin ki herkes hangi değişkenleri ayarlaması gerektiğini bilsin—ama doldurulmuş değerleri asla commit etmeyin. Yeni ekip üyeleri şablonu kopyalar ve kendi değerlerini doldurur.

**CI/CD'deki Ortamlar.** Pipeline'lar yerel `.azure/` klasörünüzü okumaz. Bunun yerine ortam değerlerini pipeline değişkenleri/gizli değerleri olarak sağlayın ve azd bunları süreç ortamından okur:

```bash
# CI'de azd bunları .azure/ yerine ortam değişkenlerinden okur.
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Kural:** altyapı kodu (`infra/`, `azure.yaml`) Git'te paylaşılır; ortam *durumu ve gizli bilgileri* (`.azure/`) geliştirici başına ve pipeline başına özeldir. `azd pipeline config` pipeline değişkenlerini sizin için otomatik olarak ayarlar.

## 🔐 Kimlik Doğrulama Yapılandırması

### Azure CLI Entegrasyonu
```bash
# Azure CLI kimlik bilgilerini kullan (varsayılan)
azd config set auth.useAzureCliCredential true

# Belirli bir kiracıyla oturum aç
az login --tenant <tenant-id>

# Varsayılan aboneliği ayarla
az account set --subscription <subscription-id>
```

### Hizmet Prensibi Kimlik Doğrulaması
CI/CD pipeline'ları için:
```bash
# Ortam değişkenlerini ayarla
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Veya doğrudan yapılandır
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Yönetilen Kimlik
Azure'da barındırılan ortamlar için:
```bash
# Yönetilen kimlik doğrulamasını etkinleştir
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Altyapı Yapılandırması

### Bicep Parametreleri
Altyapı parametrelerini `infra/main.parameters.json` içinde yapılandırın:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform Yapılandırması
Terraform projeleri için, `infra/terraform.tfvars` içinde yapılandırın:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Dağıtım Yapılandırması

### Derleme Yapılandırması
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker Yapılandırması
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Örnek `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Gelişmiş Yapılandırma

### Özel Kaynak Adlandırma
```bash
# Adlandırma kurallarını belirleyin
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Ağ Yapılandırması
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### İzleme Yapılandırması
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Ortama Özel Yapılandırmalar

### Geliştirme Ortamı
```bash
# .azure/geliştirme/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Hazırlık Ortamı
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Üretim Ortamı
```bash
# .azure/üretim/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Yapılandırma Doğrulama

### Yapılandırmayı Doğrulama
```bash
# Yapılandırma sözdizimini kontrol et
azd config validate

# Ortam değişkenlerini test et
azd env get-values

# Altyapıyı doğrula
azd provision --dry-run
```

### Yapılandırma Betikleri
Doğrulama betiklerini `scripts/` içinde oluşturun:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Gerekli ortam değişkenlerini kontrol edin
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml sözdizimini doğrulayın
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 En İyi Uygulamalar

### 1. Ortam Değişkenlerini Kullanın
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Yapılandırma Dosyalarını Düzenleyin
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Sürüm Kontrolü Hususları
```bash
# .gitignore
.azure/*/config.json         # Ortam yapılandırmaları (kaynak kimliklerini içerir)
.azure/*/.env               # Ortam değişkenleri (gizli bilgiler içerebilir)
.env                        # Yerel ortam dosyası
```

### 4. Yapılandırma Dokümantasyonu
Yapılandırmanızı `CONFIG.md` içinde belgeleyin:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Uygulamalı Alıştırmalar

### Alıştırma 1: Çoklu Ortam Yapılandırması (15 dakika)

**Hedef**: Farklı ayarlara sahip üç ortam oluşturun ve yapılandırın

```bash
# Geliştirme ortamı oluştur
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Hazırlık ortamı oluştur
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Üretim ortamı oluştur
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Her ortamı doğrula
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Başarı Kriterleri:**
- [ ] Üç ortam başarıyla oluşturuldu
- [ ] Her ortam benzersiz yapılandırmaya sahip
- [ ] Ortamlar arasında hatasız geçiş yapılabiliyor
- [ ] `azd env list` tüm üç ortamı gösterir

### Alıştırma 2: Gizli Yönetimi (10 dakika)

**Hedef**: Hassas verilerle güvenli yapılandırma uygulamaları yapmak

```bash
# Gizli bilgileri ayarla (çıktıda gösterilmeyecek)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Gizli olmayan yapılandırmayı ayarla
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Ortamı görüntüle (gizli bilgiler gizlenmiş olmalı)
azd env get-values

# Gizli bilgilerin saklandığını doğrula
azd env get DB_PASSWORD  # Gerçek değeri göstermeli
```

**Başarı Kriterleri:**
- [ ] Gizli bilgiler terminalde gösterilmeden saklanır
- [ ] `azd env get-values` gizlenmiş gizli bilgileri gösterir
- [ ] Bireysel `azd env get <SECRET_NAME>` gerçek değeri alır

## Sonraki Adımlar

- [İlk Projeniz](first-project.md) - yapılandırmayı pratiğe uygulayın
- [Dağıtım Rehberi](../chapter-04-infrastructure/deployment-guide.md) - dağıtım için yapılandırmayı kullanın
- [Kaynakları Sağlama](../chapter-04-infrastructure/provisioning.md) - üretim hazır yapılandırmalar

## Kaynaklar

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 3 - Yapılandırma ve Kimlik Doğrulama
- **⬅️ Önceki**: [İlk Projeniz](first-project.md)
- **➡️ Sonraki Bölüm**: [Bölüm 4: Kod Olarak Altyapı](../chapter-04-infrastructure/deployment-guide.md)
- **Sonraki Ders**: [İlk Projeniz](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->