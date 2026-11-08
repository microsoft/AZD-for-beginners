# Dağıtım Rehberi - AZD Dağıtımlarında Ustalaşma

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 4 - Kod Olarak Altyapı ve Dağıtım
- **⬅️ Önceki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)
- **➡️ Sonraki**: [Kaynakların Sağlanması](provisioning.md)
- **🧩 Bu bölümde ayrıca**: [Kendi Şablonunuzu Yazma](custom-templates.md)
- **🚀 Sonraki Bölüm**: [Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri](../../examples/retail-scenario.md)

## Giriş

> `azd 1.37.2`'a (Kasım 2026) göre incelendi. Komutlar Bash kullanır; JSON örnekleri için `jq` gereklidir. Açıkça başlatılmış todo alıştırması dışında, gelişmiş örnekler **entegrasyon parçalarıdır**: kendi kaynaklarınızı, altyapınızı, testlerinizi ve komut dosyalarınızı sağlayın. Bu incelemede hiçbir Azure dağıtımı gerçekleştirilmedi.

Bu kapsamlı rehber, Azure Developer CLI kullanarak uygulamaları dağıtmak için bilmeniz gereken her şeyi kapsar; temel tek komutlu dağıtımlardan özel kancalar, çoklu ortamlar ve CI/CD entegrasyonu ile gelişmiş üretim senaryolarına kadar. Pratik örnekler ve en iyi uygulamalarla tam dağıtım yaşam döngüsünde ustalaşın.

## Öğrenme Hedefleri

Bu rehberi tamamlayarak:
- Tüm Azure Developer CLI dağıtım komutları ve iş akışlarında uzmanlaşacaksınız
- Sağlamadan izlemeye kadar tam dağıtım yaşam döngüsünü anlayacaksınız
- Dağıtım öncesi ve sonrası otomasyon için özel dağıtım kancaları uygulayacaksınız
- Ortama özgü parametrelerle çoklu ortamlar yapılandıracaksınız
- Mavi-yeşil ve kanarya dağıtımları dahil gelişmiş dağıtım stratejileri kuracaksınız
- Azd dağıtımlarını CI/CD boru hatları ve DevOps iş akışlarıyla entegre edeceksiniz

## Öğrenme Çıktıları

Tamamladığınızda:
- Tüm azd dağıtım iş akışlarını bağımsız olarak çalıştırabilir ve sorun giderebilirsiniz
- Kancalar kullanarak özel dağıtım otomasyonu tasarlayıp uygulayabilirsiniz
- Doğru güvenlik ve izlemeyle üretim hazır dağıtımlar yapılandırabilirsiniz
- Karmaşık çok ortamlı dağıtım senaryolarını yönetebilirsiniz
- Dağıtım performansını optimize edebilir ve geri alma stratejileri uygulayabilirsiniz
- azd dağıtımlarını kurumsal DevOps uygulamalarına entegre edebilirsiniz

## Dağıtım Genel Bakış

Azure Developer CLI aşağıdaki dağıtım komutlarını sağlar:
- `azd up` - Tam iş akışı (provision + deploy)
- `azd provision` - Sadece Azure kaynakları oluştur/güncelle
- `azd deploy` - Sadece uygulama kodu dağıt
- `azd package` - Uygulamaları derle ve paketle

## Temel Dağıtım İş Akışları

### Tam Dağıtım (azd up)
Yeni projeler için en yaygın iş akışı:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Sadece Altyapı Dağıtımı
Yalnızca Azure kaynaklarını güncellemeniz gerektiğinde:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Sadece Kod Dağıtımı
Hızlı uygulama güncellemeleri için:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Dağıtım Doğrulama

Herhangi bir dağıtımdan sonra başarıyı doğrulayın:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Başarı Kriterleri:**
- ✅ `azd show` beklenen servis hedeflerini/URL'lerini çözümler
- ✅ Gerçek uygulama yollarına yapılan istekler beklenen durum ve gövdeyi döner
- ✅ Son 5 dakikada hata kayıtları yok
- ✅ Uygulama test isteklerine yanıt verir

## 🏗️ Dağıtım Sürecini Anlama

### Kancalara yeni misiniz? Buradan başlayın

**Kanca**, azd'nin dağıtım sürecinde belirli bir anda otomatik olarak çalıştırdığı bir komuttur—sağlama öncesi veya sonrası, kodun dağıtımı öncesi veya sonrası. Dağıtımı çevreleyen küçük işleri otomatik hale getirmenizi sağlar: bir veritabanını tohumlamak, migrasyonları çalıştırmak, varlıkları derlemek veya canlı uygulamayı duman testi yapmak.

| Kanca | Ne Zaman Çalışır | Yaygın Kullanım |
|------|-------------------|----------------|
| `preprovision` | Kaynaklar oluşturulmadan önce | Önkoşulları doğrula, kayda giriş yap |
| `postprovision` | Kaynaklar mevcut olduktan sonra | Kaynakları yapılandır, veritabanını ayarla |
| `predeploy` | Kod dağıtılmadan önce | Ön uç varlıkları derle, birim testleri çalıştır |
| `postdeploy` | Kod canlı olduktan sonra | DB migrasyonlarını çalıştır, uç noktayı duman testi yap |

Kancalar `azure.yaml` içinde yaşar. İşte dağıtımdan sonra sadece bir mesaj yazdıran en küçük örnek:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Bu kadar—sonraki sefer `azd up` çalıştırdığınızda mesaj otomatik yazdırılır. Ayrıca tam dağıtım yapmadan bir kancayı tek başına çalıştırabilirsiniz, bu da test için iyidir:

```bash
azd hooks run postdeploy
```

Aşağıdaki aşamalar, her aşama için gerçek dünyadan kancalar (migrasyonlar, testler, doğrulama) gösterir.

### Aşama 1: Ön Sağlama Kancaları
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### Aşama 2: Altyapı Sağlama
- Altyapı şablonlarını (Bicep/Terraform) okur
- Azure kaynaklarını oluşturur veya günceller
- Ağ ve güvenliği yapılandırır
- İzleme ve kayıt tutmayı kurar

### Aşama 3: Sonra Sağlama Kancaları
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### Aşama 4: Uygulama Paketleme
- Uygulama kodunu derler
- Dağıtım artefaktları oluşturur
- Hedef platform için paketler (konteynerler, ZIP dosyaları vb.)

### Aşama 5: Dağıtım Öncesi Kancalar
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### Aşama 6: Uygulama Dağıtımı
- Paketlenmiş uygulamaları Azure hizmetlerine dağıtır
- Yapılandırma ayarlarını günceller
- Hizmetleri başlatır/yeniden başlatır

### Aşama 7: Dağıtım Sonrası Kancalar
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Kanca Hatalarını Ele Alma

Varsayılan olarak, **bir kanca komutu sıfır olmayan bir çıkış kodu ile sonlanırsa azd tüm işlemi durdurur.** Bu genellikle istediğiniz şeydir—başarısız bir migrasyon dağıtımı durdurmalı, hatalı bir uygulama göndermemelidir. Ancak bu durum kancaların dikkatle yazılması gerektiği anlamına gelir.

**1. Hataları yüksek sesle ve kasıtlı yapın.** Bir kanca, son komutu sıfır olmayan çıkış koduyla döndüğünde başarısız olur. Shell betiklerinde, kancanın sessizce devam etmek yerine ilk başarısız komutta durması için `set -e` ekleyin:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Azd'yi durdurmadan bir kancanın başarısız olmasına izin verin.** Kritik olmayan adımlar için (isteğe bağlı bir önbellek ısısı, çabalı bir bildirim), `continueOnError: true` ayarlayın. Azd hatayı kaydeder ancak devam eder:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Tam çalıştırmadan önce kancaları izole olarak test edin.** Bir kancayı hata ayıklamak için `azd up` çalıştırmak zorunda değilsiniz—onu tek başına çalıştırıp hızlıca yineleyin:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. İşletim sistemine özgü kabuklara dikkat edin.** `shell: pwsh` kullanan bir kancanın çalıştırıldığı makinede (CI ajanları dahil) PowerShell yüklü olmalıdır. En geniş taşınabilirlik için `shell: sh` kullanın veya hem `windows` hem de `posix` varyantlarını sağlayın:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Hata ayıklama ipucu:** Herhangi bir azd komutunu `--debug` ile çalıştırarak tam kanca komut satırını ve tam çıktısını görün—bir kanca yerelde çalışır ama CI'da başarısız olursa paha biçilemez.

## 🎛️ Dağıtım Yapılandırması

### Servis Özgü Dağıtım Ayarları
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Ortama Özgü Yapılandırmalar

Bunlar sadece yerel azd değerleridir. Bunları açıkça altyapı/çalışma zamanı yapılandırmasına eşleyin. `NODE_ENV` genellikle dağıtılan bir Node uygulaması için `production`dır, bir staging dağıtımı dahil; dağıtım aşamalarını ayırt etmek için ayrı bir uygulama özgü değişken kullanın.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Gelişmiş Dağıtım Senaryoları

### Çok Servisli Uygulamalar
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Mavi-Yeşil Dağıtımlar

**Örnek operasyon taslağı:** her iki ortamı, paylaşılan bir trafik yönlendirme katmanını ve aşağıdaki iki betiği sağlamalısınız. azd trafiği otomatik değiştirmez veya geri alma hazırlığını doğrulamaz. Yeşil ortamı, mavi testlerden geçip geri alım gerekli olmadan tutun.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Kanarya Dağıtımları
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Trafik bölme Container Apps yapılandırmasına (Bicep veya Azure CLI) aittir, `azure.yaml` `trafficSplit` özelliğine değil. Önizleme/sağlama ve sonraki dağıtımlar seçtiğiniz revizyon modu ve yönlendirme kurallarını korumalıdır.

### Aşamalı Dağıtımlar
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Konteyner Dağıtımları

### Container App Dağıtımları
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Çalışma zamanı sırlarını Container App altyapısında `configuration.secrets`/`secretRef` (veya Key Vault referansları) ile yapılandırın ve ölçeklendirmeyi `template.scale` ile yapın. Hizmet seviyesinde `secrets` veya `scale` özellikleri `azure.yaml` içinde uydurmayın.

### Çok Aşamalı Dockerfile Optimizasyonu
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Performans Optimizasyonu

### Servis Özgü Dağıtımlar
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Derleme Önbellekleme
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Standart Node iş akışı paket komut dosyaları kullanır; servis `prepackage` kancaları gereken adımları ekleyebilir. Docker katman önbelleği bir servis derleme komutu tanımlamadan ayrıdır.

### Verimli Kod Dağıtımları
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Dağıtım İzleme

### Gerçek Zamanlı Dağıtım İzleme
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Sağlık Kontrolleri
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Uygulamanız `/health` uygulamalıdır; bu azd tarafından otomatik sağlanmaz. Genel bir `azure.yaml` `healthCheck` servis özelliği yoktur.

### Dağıtım Sonrası Doğrulama
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Güvenlik Dikkatleri

### Sırlar Yönetimi
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` geçersizdir. Normal ortam değerleri yerel düz metindir; okuma komutlarının onları gizlediğini varsaymayın. Yukarıdaki komutlar Key Vault referanslarını kaydeder, ancak altyapınız/uygulamanız hala sırları tüketmeli ve çalışma zamanı kimliği erişimi sağlamalıdır.

### Ağ Güvenliği
Ağ parametrelerini Bicep içinde belirtin ve `infra/main.parameters.json` içinde eşleyin. `azure.yaml` içinde genel bir `infra.parameters` katmanı yoktur. Örnek dokümantasyonda verilen `203.0.113.0/24` ve `198.51.100.0/24` aralıkları gerçek ofis/VPN ağları değildir; bunları yetkili ağ aralıkları ile değiştirin.

### Kimlik ve Erişim Yönetimi
Container App'in `identity` Bicep içinde etkinleştirilir ve vault kapsamda gerekli Key Vault veri düzlemi rolü atanır. Bu kaynakta adlandırılmış Key Vault destekli sırlar ve çalışma zamanı referanslarını yapılandırın; `identity` ve `keyVault` genel azd servis özellikleri değildir. Bkz. [Kimlik Doğrulama ve Yönetilen Kimlik](../chapter-03-configuration/authsecurity.md).

## 🚨 Geri Alma Stratejileri

### Hızlı Geri Alma
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Altyapı Geri Alma
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Veritabanı Migrasyonu Geri Alma
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Dağıtım Ölçümleri

### Dağıtım Performansını İzleme
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Özel Ölçümler Toplama
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 En İyi Uygulamalar

### 1. Ortam Tutarlılığı
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Altyapı Doğrulama
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Test Entegrasyonu
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. Dokümantasyon ve Kayıt Tutma
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sonraki Adımlar

- [Kaynakların Sağlanması](provisioning.md) - Altyapı yönetimine derin dalış
- [Dağıtım Öncesi Planlama](../chapter-06-pre-deployment/capacity-planning.md) - Dağıtım stratejinizi planlayın
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md) - Dağıtım sorunlarını çözün
- [En İyi Uygulamalar](../chapter-07-troubleshooting/debugging.md) - Üretim hazır dağıtım stratejileri

## 🎯 Uygulamalı Dağıtım Alıştırmaları

### Alıştırma 1: Artan Dağıtım İş Akışı (20 dakika)
**Amaç**: Tam ve artan dağıtımlar arasındaki farklarda ustalaşmak

**Başlangıç noktası:** Bash, Node.js 22, Git, azd oturumu açılmış ve dağıtım izinleri olan bir Azure aboneliği. Yeni bir dizinde çalıştırın; ücretlendirmeye tabi App Service/Cosmos DB kaynakları bekleyin. Süreler bölge ve şablona bağlıdır.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Her iki komut için geçen süreyi kaydedin (süre garantili değildir)
- [ ] Her iki komut da başarıyla tamamlanır
- [ ] API işlevselliği korunur; sadece yorum düzenlemesi görünür bir UI değişikliği değildir
- [ ] `azd deploy` sonrası altyapı değişmedi

**Öğrenme Çıktısı**: `azd deploy` altyapı sağlamayı atlar. Sabit bir yüzde hızlanma varsaymak yerine ölçülen süreleri karşılaştırın.

### Alıştırma 2: Özel Dağıtım Kancaları (30 dakika)
**Amaç**: Dağıtım öncesi ve sonrası otomasyonu uygulamak

**Başlangıç noktası:** yukarıda başlatılmış `deployment-practice` projesi. Temizlediyseniz, kodla sadece dağıtımı test etmeden önce `azd up`'yi yeniden çalıştırın. Aşağıdaki doğrulama, şablonun API testi için gerçek derleme betiğini kullanır, varolmayan kök `test:unit` betiğini değil. Şablon API testleri yapılandırılmış veritabanı erişimi gerektirir; bunlar izole birim testleri değildir.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Başarı Kriterleri:**
- [ ] Dağıtım öncesi betik dağıtımdan önce çalışır
- [ ] Derleme doğrulaması başarısızsa dağıtım iptal edilir
- [ ] Dağıtım sonrası duman testi sağlığı doğrular
- [ ] Kancalar doğru sırayla çalışır

### Alıştırma 3: Çok Ortamlı Dağıtım Stratejisi (45 dakika)
**Amaç**: Aşamalı dağıtım iş akışını uygulamak (geliştirme → staging → üretim)

**Başlangıç noktası:** `jq` ile aynı başlatılmış todo projesi. Aşağıdaki ortamları gerçek abonelik/konum değerleriyle (veya her birinde `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` olarak ayarlayın) **kullanıcı istemi olmadan** iş akışını çalıştırmadan önce oluşturun. Eksik değerleri uydurmak yerine kasten başarısız olur. Gerçek bir üretim aboneliği değil, yalnızca kullan-at eğitim ortamları kullanın.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Başarı Kriterleri:**
- [ ] Geliştirme ortamı başarıyla dağıtılır
- [ ] Hazırlık ortamı başarıyla dağıtılır
- [ ] Üretim için manuel onay gereklidir
- [ ] Tüm ortamlarda çalışan sağlık kontrolleri vardır
- [ ] Gerekirse geri alma yapılabilir

### Egzersiz 4: Geri Alma Stratejisi (25 dakika)
**Amaç**: Git kullanarak dağıtım geri almayı uygulamak ve test etmek

**Başlangıç noktası:** todo şablonunun izole edilmiş bir eğitim çekişi ile tüm temel kaynakların işlenmiş olduğu, temiz bir Git çalışma alanı ve yapılandırılmış kullan-at bir ortam. Gerçek bir üretim projesinde kasıtlı hatalar asla eklemeyin. Aşağıdaki `APP_VERSION` sadece kayıt tutmak içindir; açıkça uygulamaya bağlamadığınız sürece.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Başarı Kriterleri:**
- [ ] Dağıtım hatalarını algılayabilir
- [ ] Geri alma betiği otomatik olarak çalışır
- [ ] Uygulama çalışır duruma döner
- [ ] Geri alma sonrası sağlık kontrolleri geçer

## 📊 Dağıtım Ölçümlerini Takip Etme

### Dağıtım Performansınızı Takip Edin

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Ölçümlerinizi analiz edin:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ek Kaynaklar

- [Azure Developer CLI Dağıtım Referansı](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Dağıtımı](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Dağıtımı](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Dağıtımı](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Gezinme**
- **Önceki Ders**: [İlk Projeniz](../chapter-01-foundation/first-project.md)
- **Sonraki Ders**: [Kaynakların Sağlanması](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->