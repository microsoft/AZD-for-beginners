# Yapılandırma Kılavuzu

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 3 - Yapılandırma ve Kimlik Doğrulama
- **⬅️ Önceki**: [İlk Projeniz](first-project.md)
- **➡️ Sonraki**: [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Sonraki Bölüm**: [Bölüm 4: Altyapı olarak Kod](../chapter-04-infrastructure/deployment-guide.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI'nin optimal geliştirme ve dağıtım iş akışları için yapılandırılmasına ilişkin tüm yönleri kapsar. Yapılandırma hiyerarşisini, ortam yönetimini, kimlik doğrulama yöntemlerini ve verimli ve güvenli Azure dağıtımlarını sağlayan gelişmiş yapılandırma desenlerini öğreneceksiniz.

## Öğrenme Hedefleri

Bu dersin sonunda şunları yapabileceksiniz:
- azd yapılandırma hiyerarşisini ustalıkla kullanmak ve ayarların nasıl önceliklendirildiğini anlamak
- küresel ve proje özel ayarları etkili biçimde yapılandırmak
- farklı yapılandırmalara sahip birden çok ortamı yönetmek
- güvenli kimlik doğrulama ve yetkilendirme desenlerini uygulamak
- karmaşık senaryolar için gelişmiş yapılandırma desenlerini anlamak

## Öğrenme Çıktıları

Bu dersi tamamladıktan sonra şunları yapabileceksiniz:
- geliştirme iş akışları için azd'yi yapılandırmak
- birden çok dağıtım ortamını kurmak ve yönetmek
- güvenli yapılandırma yönetimi uygulamalarını hayata geçirmek
- yapılandırma ile ilgili sorunları gidermek
- belirli örgütsel gereksinimler için azd davranışını özelleştirmek

Bu kapsamlı kılavuz, Azure Developer CLI'nin optimal geliştirme ve dağıtım iş akışları için yapılandırılmasına ilişkin tüm yönleri kapsar.

## azd Projesinde Yapay Zeka Ajanlarını Anlamak

Eğer yapay zeka ajanlarına yeniyseniz, azd dünyası içindeki yerlerini düşünmenin basit bir yolu şu şekildedir.

### Ajan Nedir?

Bir ajan, bir isteği alabilen, üzerinde düşünebilen ve eylemler gerçekleştirebilen bir yazılım parçasıdır—çoğu zaman bir yapay zeka modelini çağırarak, veri arayarak veya diğer servisleri tetikleyerek. Bir azd projesinde, bir ajan web ön yüzünüz veya API arka ucunuzla birlikte başka bir **hizmet**tir.

### Ajanlar azd Proje Yapısına Nasıl Uyuyor

Bir azd projesi üç katmandan oluşur: **altyapı**, **kod** ve **yapılandırma**. Ajanlar bu katmanlara diğer herhangi bir hizmet gibi entegre olur:

| Katman | Geleneksel Bir Uygulama İçin Ne Yapar | Bir Ajan İçin Ne Yapar |
|-------|-------------------------------------|---------------------------|
| **Altyapı** (`infra/`) | Bir web uygulaması ve veritabanı sağlar | Bir Yapay Zeka model uç noktası, arama dizini veya ajan barındırıcısı sağlar |
| **Kod** (`src/`) | Ön uç ve API kaynak kodunuzu içerir | Ajan mantığını ve prompt tanımlarını içerir |
| **Yapılandırma** (`azure.yaml`) | Hizmetlerinizi ve barındırma hedeflerini listeler | Ajanınızı bir hizmet olarak listeler; koduna ve barındırma yerine işaret eder |

### `azure.yaml`'in Rolü

Sözdizimini şimdi ezberlemenize gerek yok. Kavramsal olarak, `azure.yaml` azd'ye şöyle söylendiğiniz dosyadır: "İşte uygulamamı oluşturan hizmetler ve bunların kodlarını nerede bulacağınız."

Projeniz bir yapay zeka ajanı içerdiğinde, `azure.yaml` yalnızca o ajanın bir hizmet olarak listelenmesini sağlar. azd daha sonra doğru altyapıyı (örneğin bir Microsoft Foundry Models uç noktası veya ajanı barındırmak için bir Container App gibi) sağlamayı ve ajan kodunuzu dağıtmayı bilir—tıpkı bir web uygulaması veya API için yaptığı gibi.

Bu, temel olarak öğrenilecek yeni bir şey olmadığı anlamına gelir. azd'nin bir web hizmetini nasıl yönettiğini anlıyorsanız, bir ajanı nasıl yöneteceğini zaten anlamışsınızdır.

## Yapılandırma Hiyerarşisi

azd, hiyerarşik bir yapılandırma sistemi kullanır:
1. Komut satırı bayrakları (en yüksek öncelik)
2. Ortam değişkenleri
3. Yerel proje yapılandırması (`.azd/config.json`)
4. Genel kullanıcı yapılandırması (`~/.azd/config.json`)
5. Varsayılan değerler (en düşük öncelik)

## Genel Yapılandırma

### Genel Varsayılanları Ayarlama
```bash
# Varsayılan aboneliği ayarla
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Varsayılan konumu ayarla
azd config set defaults.location "eastus2"

# Varsayılan kaynak grubu adlandırma kuralını ayarla
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Tüm genel yapılandırmayı görüntüle
azd config list

# Bir yapılandırmayı kaldır
azd config unset defaults.location
```

### Yaygın Genel Ayarlar
```bash
# Geliştirme tercihleri
azd config set alpha.enable true                    # Alfa özelliklerini etkinleştir
azd config set telemetry.enabled false             # Telemetriyi devre dışı bırak
azd config set output.format json                  # Çıktı biçimini ayarla

# Güvenlik ayarları
azd config set auth.useAzureCliCredential true     # Kimlik doğrulama için Azure CLI kullan
azd config set tls.insecure false                  # TLS doğrulamasını zorunlu kıl

# Performans ayarları
azd config set provision.parallelism 5             # Kaynakları paralel oluşturma
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

### Hizmet Yapılandırma Seçenekleri

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

#### Dil Özel Ayarları
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
Her ortamın kendi yapılandırması `.azure/<env-name>/config.json` içinde bulunur:

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
# Ortam özgü değişkenleri ayarla
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
Tutarlı bir ortam kurulumu için `.azure/env.template` oluşturun:
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

## 🔐 Kimlik Doğrulama Yapılandırması

### Azure CLI Entegrasyonu
```bash
# Azure CLI kimlik bilgilerini kullan (varsayılan)
azd config set auth.useAzureCliCredential true

# Belirli bir kiracı ile oturum aç
az login --tenant <tenant-id>

# Varsayılan aboneliği ayarla
az account set --subscription <subscription-id>
```

### Servis Prensibi Kimlik Doğrulaması
CI/CD boru hatları için:
```bash
# Ortam değişkenlerini ayarlayın
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Veya doğrudan yapılandırın
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Yönetilen Kimlik
Azure tarafından barındırılan ortamlar için:
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
# Adlandırma kurallarını belirle
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
# .azure/development/.env
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

### Yapılandırmayı Doğrula
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

# Gerekli ortam değişkenlerini kontrol et
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml sözdizimini doğrula
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
.azure/*/config.json         # Ortam yapılandırmaları (kaynak kimlikleri içerir)
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

## 🎯 Uygulamalı Alıştırma Egzersizleri

### Egzersiz 1: Çoklu Ortam Yapılandırması (15 dakika)

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
- [ ] Her ortam benzersiz bir yapılandırmaya sahip
- [ ] Ortamlar arasında hatasız geçiş yapabilme
- [ ] `azd env list` tüm üç ortamı gösterir

### Egzersiz 2: Gizli Yönetimi (10 dakika)

**Hedef**: Hassas verilerle güvenli yapılandırma pratiği yapın

```bash
# Gizli değerleri ayarla (çıktıda gösterilmez)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Gizli olmayan yapılandırmayı ayarla
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Ortamı görüntüle (gizli bilgiler gizlenmeli)
azd env get-values

# Gizli bilgilerin saklandığını doğrula
azd env get DB_PASSWORD  # Gerçek değeri göstermeli
```

**Başarı Kriterleri:**
- [ ] Gizli veriler terminalde görüntülenmeden saklanır
- [ ] `azd env get-values` gizli verileri sansürlenmiş olarak gösterir
- [ ] Bireysel `azd env get <SECRET_NAME>` gerçek değeri getirir

## Sonraki Adımlar

- [İlk Projeniz](first-project.md) - Yapılandırmayı uygulamada kullanın
- [Dağıtım Kılavuzu](../chapter-04-infrastructure/deployment-guide.md) - Dağıtım için yapılandırmayı kullanın
- [Kaynak Sağlama](../chapter-04-infrastructure/provisioning.md) - Üretime hazır yapılandırmalar

## Referanslar

- [azd Yapılandırma Referansı](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Şeması](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Ortam Değişkenleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 3 - Yapılandırma ve Kimlik Doğrulama
- **⬅️ Önceki**: [İlk Projeniz](first-project.md)
- **➡️ Sonraki Bölüm**: [Bölüm 4: Altyapı olarak Kod](../chapter-04-infrastructure/deployment-guide.md)
- **Sonraki Ders**: [İlk Projeniz](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, [Co-op Translator](https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından doğabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->