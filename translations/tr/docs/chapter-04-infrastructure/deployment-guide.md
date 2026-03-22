# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Ders Ana Sayfası**: [AZD Yeni Başlayanlar için](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 4 - Altyapı Kod (IaC) ve Dağıtım
- **⬅️ Önceki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)
- **➡️ Sonraki**: [Provisioning Resources](provisioning.md)
- **🚀 Sonraki Bölüm**: [Bölüm 5: Çok Ajanlı AI Çözümleri](../../examples/retail-scenario.md)

## Giriş

Bu kapsamlı rehber, Azure Developer CLI kullanarak uygulama dağıtımı hakkında bilmeniz gereken her şeyi kapsar; temel tek komutluk dağıtımlardan özel kancalar, çoklu ortamlar ve CI/CD entegrasyonuyla gelişmiş üretim senaryolarına kadar. Pratik örnekler ve en iyi uygulamalarla tam dağıtım yaşam döngüsünde ustalaşın.

## Öğrenme Hedefleri

Bu rehberi tamamlayarak:
- Tüm Azure Developer CLI dağıtım komutları ve iş akışlarında ustalaşacaksınız
- Sağlamadan izlemeye kadar tam dağıtım yaşam döngüsünü anlayacaksınız
- Ön ve son dağıtım otomasyonu için özel dağıtım kancaları uygulayacaksınız
- Ortama özel parametrelerle birden çok ortam yapılandıracaksınız
- Blue-green ve canary dağıtımları dahil gelişmiş dağıtım stratejileri kuracaksınız
- azd dağıtımlarını CI/CD boru hatları ve DevOps iş akışlarıyla entegre edeceksiniz

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Tüm azd dağıtım iş akışlarını bağımsız olarak çalıştırıp hata ayıklamak
- Kancalar kullanarak özel dağıtım otomasyonu tasarlayıp uygulamak
- Uygun güvenlik ve izleme ile üretime hazır dağıtımlar yapılandırmak
- Karmaşık çoklu ortam dağıtım senaryolarını yönetmek
- Dağıtım performansını optimize etmek ve geri alma stratejileri uygulamak
- azd dağıtımlarını kurumsal DevOps uygulamalarına entegre etmek

## Dağıtım Genel Bakışı

Azure Developer CLI birkaç dağıtım komutu sağlar:
- `azd up` - Tam iş akışı (provision + deploy)
- `azd provision` - Yalnızca Azure kaynaklarını oluştur/güncelle
- `azd deploy` - Yalnızca uygulama kodunu dağıt
- `azd package` - Uygulamaları derle ve paketle

## Temel Dağıtım İş Akışları

### Tam Dağıtım (azd up)
Yeni projeler için en yaygın iş akışı:
```bash
# Her şeyi sıfırdan dağıt
azd up

# Belirli bir ortamda dağıt
azd up --environment production

# Özel parametrelerle dağıt
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Yalnızca Altyapı Dağıtımı
Sadece Azure kaynaklarını güncellemeniz gerektiğinde:
```bash
# Altyapıyı sağlama/güncelleme
azd provision

# Değişiklikleri önizlemek için kuru çalıştırma ile sağlama
azd provision --preview

# Belirli hizmetleri sağlama
azd provision --service database
```

### Yalnızca Kod Dağıtımı
Hızlı uygulama güncellemeleri için:
```bash
# Tüm hizmetleri dağıt
azd deploy

# Beklenen çıktı:
# Hizmetler dağıtılıyor (azd deploy)
# - web: Dağıtılıyor... Tamamlandı
# - api: Dağıtılıyor... Tamamlandı
# BAŞARILI: Dağıtımınız 2 dakika 15 saniyede tamamlandı

# Belirli bir hizmeti dağıt
azd deploy --service web
azd deploy --service api

# Özel derleme argümanlarıyla dağıt
azd deploy --service api --build-arg NODE_ENV=production

# Dağıtımı doğrula
azd show --output json | jq '.services'
```

### ✅ Dağıtım Doğrulama

Herhangi bir dağıtımdan sonra başarıyı doğrulayın:

```bash
# Tüm servislerin çalıştığını kontrol edin
azd show

# Sağlık uç noktalarını test edin
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Hataları izleyin (varsayılan olarak tarayıcıda açılır)
azd monitor --logs
```

**Başarı Kriterleri:**
- ✅ Tüm servisler "Running" durumunu gösteriyor
- ✅ Sağlık uçları HTTP 200 döndürüyor
- ✅ Son 5 dakikada hata günlükleri yok
- ✅ Uygulama test isteklerine yanıt veriyor

## 🏗️ Dağıtım Sürecini Anlamak

### Aşama 1: Ön-Provision Kancaları
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
- İzleme ve günlüklemeyi kurar

### Aşama 3: Post-Provision Kancaları
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

### Aşama 5: Ön-Deploy Kancaları
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
- Paketlenmiş uygulamaları Azure servislerine dağıtır
- Yapılandırma ayarlarını günceller
- Servisleri başlatır/yeniden başlatır

### Aşama 7: Post-Deploy Kancaları
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ Dağıtım Yapılandırması

### Servis-Bazlı Dağıtım Ayarları
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### Ortam-Bazlı Yapılandırmalar
```bash
# Geliştirme ortamı
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Hazırlık ortamı
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Üretim ortamı
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

### Blue-Green Dağıtımları
```bash
# Mavi ortamı oluştur
azd env new production-blue
azd up --environment production-blue

# Mavi ortamı test et
./scripts/test-environment.sh production-blue

# Trafiği mavi ortama yönlendir (manuel DNS/yük dengeleyici güncellemesi)
./scripts/switch-traffic.sh production-blue

# Yeşil ortamı temizle
azd env select production-green
azd down --force
```

### Canary Dağıtımları
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### Aşamalı Dağıtımlar
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
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
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Çok Aşamalı Dockerfile Optimizasyonu
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Performans Optimizasyonu

### Servis-Bazlı Dağıtımlar
```bash
# Daha hızlı yineleme için belirli bir servisi dağıtın
azd deploy --service web
azd deploy --service api

# Tüm servisleri dağıtın
azd deploy
```

### Derleme Önbellekleme
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Verimli Kod Dağıtımları
```bash
# Sadece kod değişiklikleri için azd deploy kullanın (azd up değil)
# Bu, altyapı sağlama işlemini atlar ve çok daha hızlıdır
azd deploy

# En hızlı yineleme için belirli servisi dağıtın
azd deploy --service api
```

## 🔍 Dağıtım İzleme

### Gerçek Zamanlı Dağıtım İzleme
```bash
# Uygulamayı gerçek zamanlı izle
azd monitor --live

# Uygulama günlüklerini görüntüle
azd monitor --logs

# Dağıtım durumunu kontrol et
azd show
```

### Sağlık Kontrolleri
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### Dağıtım Sonrası Doğrulama
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Uygulama sağlığını kontrol et
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Güvenlik Hususları

### Sırlar Yönetimi
```bash
# Gizli bilgileri güvenli bir şekilde depolayın
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml dosyasında gizli bilgileri referans gösterin
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### Ağ Güvenliği
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Kimlik ve Erişim Yönetimi
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 Geri Alma Stratejileri

### Hızlı Geri Alma
```bash
# AZD'nin yerleşik geri alma özelliği yok. Önerilen yaklaşımlar:

# Seçenek 1: Git'ten yeniden dağıt (önerilen)
git revert HEAD  # Sorunlu commit'i geri al
git push
azd deploy

# Seçenek 2: Belirli bir commit'i yeniden dağıt
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Altyapı Geri Alma
```bash
# Uygulamadan önce altyapı değişikliklerini önizleyin
azd provision --preview

# Altyapıyı geri almak için sürüm kontrolü kullanın:
git revert HEAD  # Altyapı değişikliklerini geri alın
azd provision    # Önceki altyapı durumunu uygulayın
```

### Veritabanı Migrasyon Geri Alma
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Dağıtım Metrikleri

### Dağıtım Performansını İzle
```bash
# Mevcut dağıtım durumunu görüntüle
azd show

# Uygulamayı Application Insights ile izle
azd monitor --overview

# Canlı metrikleri görüntüle
azd monitor --live
```

### Özel Metrik Toplama
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
# Tutarlı isimlendirme kullanın
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Ortam tutarlılığını koruyun
./scripts/sync-environments.sh
```

### 2. Altyapı Doğrulama
```bash
# Dağıtım öncesinde altyapı değişikliklerini önizle
azd provision --preview

# ARM/Bicep lint denetimini kullan
az bicep lint --file infra/main.bicep

# Bicep sözdizimini doğrula
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

### 4. Dokümantasyon ve Günlükleme
```bash
# Dağıtım prosedürlerini belgeleyin
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sonraki Adımlar

- [Provisioning Resources](provisioning.md) - Altyapı yönetimine derin dalış
- [Dağıtım Öncesi Planlama](../chapter-06-pre-deployment/capacity-planning.md) - Dağıtım stratejinizi planlayın
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md) - Dağıtım sorunlarını çözün
- [En İyi Uygulamalar](../chapter-07-troubleshooting/debugging.md) - Üretime hazır dağıtım stratejileri

## 🎯 Uygulamalı Dağıtım Alıştırmaları

### Alıştırma 1: Artımlı Dağıtım İş Akışı (20 dakika)
**Hedef**: Tam ve artımlı dağıtımlar arasındaki farkı kavrayın

```bash
# İlk dağıtım
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# İlk dağıtım zamanını kaydet
echo "Full deployment: $(date)" > deployment-log.txt

# Kodda değişiklik yap
echo "// Updated $(date)" >> src/api/src/server.js

# Sadece kodu dağıt (hızlı)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Zamanları karşılaştır
cat deployment-log.txt

# Temizle
azd down --force --purge
```

**Başarı Kriterleri:**
- [ ] Tam dağıtım 5-15 dakika sürer
- [ ] Yalnızca kod dağıtımı 2-5 dakika sürer
- [ ] Kod değişiklikleri dağıtılan uygulamada yansır
- [ ] `azd deploy` sonrası altyapı değişmemiş olur

**Öğrenme Çıktısı**: `azd deploy`, kod değişiklikleri için `azd up`'a göre %50-70 daha hızlıdır

### Alıştırma 2: Özel Dağıtım Kancaları (30 dakika)
**Hedef**: Ön ve son dağıtım otomasyonunu uygulayın

```bash
# Dağıtımdan önce doğrulama betiği oluştur
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Testlerin geçtiğini kontrol et
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Henüz commit yapılmamış değişiklikleri kontrol et
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Dağıtımdan sonra smoke testi oluştur
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml dosyasına hook'lar ekle
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hook'larla dağıtımı test et
azd deploy
```

**Başarı Kriterleri:**
- [ ] Ön-deploy betiği dağıtımdan önce çalışır
- [ ] Testler başarısızsa dağıtım iptal edilir
- [ ] Post-deploy basit test sağlık durumunu doğrular
- [ ] Kancalar doğru sırayla çalışır

### Alıştırma 3: Çok Ortamlı Dağıtım Stratejisi (45 dakika)
**Hedef**: Aşamalı dağıtım iş akışını uygulayın (dev → staging → production)

```bash
# Dağıtım betiği oluşturun
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Adım 1: Geliştirme ortamına dağıtın
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Adım 2: Hazırlık ortamına dağıtın
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Adım 3: Üretim için manuel onay
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Ortamları oluşturun
azd env new dev
azd env new staging
azd env new production

# Kademeli dağıtımı çalıştırın
./deploy-staged.sh
```

**Başarı Kriterleri:**
- [ ] Dev ortamı başarıyla dağıtılır
- [ ] Staging ortamı başarıyla dağıtılır
- [ ] Production için manuel onay gereklidir
- [ ] Tüm ortamların çalışan sağlık kontrolleri vardır
- [ ] Gerekirse geri alabilirsiniz

### Alıştırma 4: Geri Alma Stratejisi (25 dakika)
**Hedef**: Git kullanarak dağıtım geri almayı uygulayın ve test edin

```bash
# v1'i dağıt
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash'ini kaydet
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Kırıcı değişiklik içeren v2'yi dağıt
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Hata tespit et ve geri al
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Git kullanarak geri al
    git revert HEAD --no-edit
    
    # Ortamı geri döndür
    azd env set APP_VERSION "1.0.0"
    
    # v1'i yeniden dağıt
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Başarı Kriterleri:**
- [ ] Dağıtım hatalarını tespit edebilir
- [ ] Geri alma betiği otomatik olarak çalışır
- [ ] Uygulama çalışır duruma geri döner
- [ ] Geri alma sonrası sağlık kontrolleri geçer

## 📊 Dağıtım Metrik Takibi

### Dağıtım Performansınızı İzleyin

```bash
# Dağıtım metrikleri betiği oluşturun
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Dosyaya kaydedin
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Kullanın
./track-deployment.sh
```

**Metriklerinizi analiz edin:**
```bash
# Dağıtım geçmişini görüntüle
cat deployment-metrics.csv

# Ortalama dağıtım süresini hesapla
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Ek Kaynaklar

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Gezinti**
- **Önceki Ders**: [İlk Projeniz](../chapter-01-foundation/first-project.md)
- **Sonraki Ders**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->