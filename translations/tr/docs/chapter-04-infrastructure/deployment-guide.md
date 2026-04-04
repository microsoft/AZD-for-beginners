# Dağıtım Kılavuzu - AZD Dağıtımlarında Uzmanlaşma

**Bölüm Gezinme:**
- **📚 Kurs Anasayfa**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Geçerli Bölüm**: Bölüm 4 - Altyapı Kod Olarak (IaC) ve Dağıtım
- **⬅️ Önceki Bölüm**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)
- **➡️ Sonraki**: [Kaynakların Sağlanması](provisioning.md)
- **🚀 Sonraki Bölüm**: [Bölüm 5: Çok Ajanlı Yapay Zeka Çözümleri](../../examples/retail-scenario.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI kullanarak uygulamaların dağıtımıyla ilgili bilmeniz gereken her şeyi kapsar; temel tek komutla dağıtımdan özelleştirilmiş kancalar, birden fazla ortam ve CI/CD entegrasyonu ile gelişmiş üretim senaryolarına kadar. Pratik örnekler ve en iyi uygulamalar ile eksiksiz dağıtım yaşam döngüsünü öğrenin.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak şunları yapabileceksiniz:
- Azure Developer CLI dağıtım komutları ve iş akışlarında ustalaşmak
- Provisioning'den izlemeye kadar eksiksiz dağıtım yaşam döngüsünü anlamak
- Ön ve sonrası dağıtım otomasyonu için özel dağıtım kancaları uygulamak
- Ortama özgü parametrelerle birden fazla ortam yapılandırmak
- Blue-green ve canary dağıtımları dahil gelişmiş dağıtım stratejileri ayarlamak
- azd dağıtımlarını CI/CD boru hatlarına ve DevOps iş akışlarına entegre etmek

## Öğrenme Çıktıları

Tamamlandığında şunları yapabileceksiniz:
- Tüm azd dağıtım iş akışlarını bağımsız olarak çalıştırmak ve hata ayıklamak
- Kancalar kullanarak özel dağıtım otomasyonu tasarlamak ve uygulamak
- Uygun güvenlik ve izleme ile üretime hazır dağıtımlar yapılandırmak
- Karmaşık çok ortamlı dağıtım senaryolarını yönetmek
- Dağıtım performansını optimize etmek ve geri alma stratejileri uygulamak
- azd dağıtımlarını kurumsal DevOps uygulamalarına entegre etmek

## Dağıtım Genel Bakış

Azure Developer CLI birkaç dağıtım komutu sağlar:
- `azd up` - Tam iş akışı (provision + deploy)
- `azd provision` - Sadece Azure kaynaklarını oluştur/güncelle
- `azd deploy` - Sadece uygulama kodunu dağıt
- `azd package` - Uygulamaları derle ve paketle

## Temel Dağıtım İş Akışları

### Tam Dağıtım (azd up)
Yeni projeler için en yaygın iş akışı:
```bash
# Her şeyi sıfırdan dağıt
azd up

# Belirli bir ortamla dağıt
azd up --environment production

# Özel parametrelerle dağıt
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Sadece Altyapı Dağıtımı
Sadece Azure kaynaklarını güncellemeniz gerektiğinde:
```bash
# Altyapıyı sağla/güncelle
azd provision

# Değişiklikleri önizlemek için kuru çalıştırma ile sağlama
azd provision --preview

# Belirli hizmetleri sağla
azd provision --service database
```

### Sadece Kod Dağıtımı
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

Herhangi bir dağıtımdan sonra, başarıyı doğrulayın:

```bash
# Tüm servislerin çalıştığını kontrol et
azd show

# Sağlık uç noktalarını test et
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Hataları izle (varsayılan olarak tarayıcıda açılır)
azd monitor --logs
```

**Başarı Kriterleri:**
- ✅ Tüm servisler "Çalışıyor" durumunu gösteriyor
- ✅ Sağlık uç noktaları HTTP 200 döndürüyor
- ✅ Son 5 dakikada hata günlükleri yok
- ✅ Uygulama test isteklerine yanıt veriyor

## 🏗️ Dağıtım Sürecini Anlama

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
- Altyapı şablonlarını okur (Bicep/Terraform)
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
- Dağıtım artefaktlarını oluşturur
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

### Hizmete Özgü Dağıtım Ayarları
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

### Ortam Bazlı Yapılandırmalar
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

### Çoklu Servis Uygulamaları
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
# Mavi ortam oluştur
azd env new production-blue
azd up --environment production-blue

# Mavi ortamı test et
./scripts/test-environment.sh production-blue

# Trafiği maviye geçir (manuel DNS/yük dengeleyici güncellemesi)
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

### Hizmete Özgü Dağıtımlar
```bash
# Daha hızlı yineleme için belirli bir hizmeti dağıtın
azd deploy --service web
azd deploy --service api

# Tüm hizmetleri dağıtın
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
# Sadece kod değişiklikleri için azd deploy (azd up değil) kullanın
# Bu altyapı sağlama işlemini atlar ve çok daha hızlıdır
azd deploy

# En hızlı yineleme için belirli bir servisi dağıtın
azd deploy --service api
```

## 🔍 Dağıtım İzleme

### Gerçek Zamanlı Dağıtım İzleme
```bash
# Uygulamayı gerçek zamanlı izleyin
azd monitor --live

# Uygulama günlüklerini görüntüleyin
azd monitor --logs

# Dağıtım durumunu kontrol edin
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

### Dağıtımdan Sonra Doğrulama
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
# Gizli bilgileri güvenli bir şekilde saklayın
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml dosyasında gizli bilgilere referans verin
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

## 🚨 Geri Alma (Rollback) Stratejileri

### Hızlı Geri Alma
```bash
# AZD'nin yerleşik geri alma özelliği yok. Önerilen yaklaşımlar:

# Seçenek 1: Git'ten yeniden dağıtım (önerilen)
git revert HEAD  # Sorunlu commit'i geri al
git push
azd deploy

# Seçenek 2: Belirli bir commit'i yeniden dağıt
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Altyapı Geri Alımı
```bash
# Uygulamadan önce altyapı değişikliklerini önizleyin
azd provision --preview

# Altyapıyı geri almak için sürüm kontrolünü kullanın:
git revert HEAD  # Altyapı değişikliklerini geri alın
azd provision    # Önceki altyapı durumunu uygulayın
```

### Veritabanı Göç Geri Alımı
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

### Dağıtım Performansını İzleyin
```bash
# Mevcut dağıtım durumunu görüntüle
azd show

# Application Insights ile uygulamayı izle
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

# Ortamlar arasındaki uyumu koruyun
./scripts/sync-environments.sh
```

### 2. Altyapı Doğrulaması
```bash
# Dağıtımdan önce altyapı değişikliklerini önizleyin
azd provision --preview

# ARM/Bicep linting kullanın
az bicep lint --file infra/main.bicep

# Bicep sözdizimini doğrulayın
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

### 4. Belgelendirme ve Kayıt Tutma
```bash
# Dağıtım prosedürlerini belgelendirin
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sonraki Adımlar

- [Kaynakların Sağlanması](provisioning.md) - Altyapı yönetimine derin dalış
- [Dağıtımdan Önce Planlama](../chapter-06-pre-deployment/capacity-planning.md) - Dağıtım stratejinizi planlayın
- [Yaygın Sorunlar](../chapter-07-troubleshooting/common-issues.md) - Dağıtım sorunlarını çözün
- [En İyi Uygulamalar](../chapter-07-troubleshooting/debugging.md) - Üretime hazır dağıtım stratejileri

## 🎯 Uygulamalı Dağıtım Alıştırmaları

### Alıştırma 1: Artımlı Dağıtım İş Akışı (20 dakika)
**Hedef**: Tam ve artımlı dağıtımlar arasındaki farkı öğrenmek

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
- [ ] Tam dağıtım 5-15 dakika sürüyor
- [ ] Sadece kod dağıtımı 2-5 dakika sürüyor
- [ ] Kod değişiklikleri dağıtılmış uygulamada yansıyor
- [ ] `azd deploy` sonrası altyapı değişmedi

**Öğrenme Çıktısı**: `azd deploy`, kod değişiklikleri için `azd up`'a göre %50-70 daha hızlıdır

### Alıştırma 2: Özel Dağıtım Kancaları (30 dakika)
**Hedef**: Ön ve sonrası dağıtım otomasyonunu uygulamak

```bash
# Dağıtımdan önce doğrulama betiği oluştur
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Testlerin geçip geçmediğini kontrol et
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Commitlenmemiş değişiklikleri kontrol et
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

# azure.yaml dosyasına hook'ları ekle
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Hook'larla dağıtımı test et
azd deploy
```

**Başarı Kriterleri:**
- [ ] Ön-deploy betiği dağıtımdan önce çalışıyor
- [ ] Testler başarısız olursa dağıtım iptal ediliyor
- [ ] Post-deploy smoke testi sağlık durumunu doğruluyor
- [ ] Kancalar doğru sırada çalışıyor

### Alıştırma 3: Çok Ortamlı Dağıtım Stratejisi (45 dakika)
**Hedef**: Aşamalı dağıtım iş akışını uygulamak (dev → staging → production)

```bash
# Dağıtım betiği oluştur
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Adım 1: geliştirme ortamına dağıt
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Adım 2: hazırlık ortamına dağıt
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Adım 3: üretim için manuel onay
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

# Ortamları oluştur
azd env new dev
azd env new staging
azd env new production

# Aşamalı dağıtımı çalıştır
./deploy-staged.sh
```

**Başarı Kriterleri:**
- [ ] Dev ortamı başarıyla dağıtıldı
- [ ] Staging ortamı başarıyla dağıtıldı
- [ ] Production için manuel onay gerekiyor
- [ ] Tüm ortamlarda çalışan sağlık kontrolleri var
- [ ] Gerekirse geri alabilme

### Alıştırma 4: Geri Alma Stratejisi (25 dakika)
**Hedef**: Git kullanarak dağıtım geri almasını uygulamak ve test etmek

```bash
# v1'i dağıt
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash'ini kaydet
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Geri uyumsuz değişiklik içeren v2'yi dağıt
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Hata tespit et ve geri al
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git kullanarak geri al
    git revert HEAD --no-edit
    
    # Ortamı geri al
    azd env set APP_VERSION "1.0.0"
    
    # v1'i yeniden dağıt
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Başarı Kriterleri:**
- [ ] Dağıtım hatalarını tespit edebiliyor
- [ ] Geri alma betiği otomatik olarak çalışıyor
- [ ] Uygulama çalışır duruma geri dönüyor
- [ ] Geri alma sonrası sağlık kontrolleri geçiyor

## 📊 Dağıtım Metriklerini İzleme

### Dağıtım Performansınızı İzleyin

```bash
# Dağıtım metrikleri betiği oluştur
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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Dosyaya kaydet
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Kullan
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
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Orijinal belge, ana dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi tavsiye edilir. Bu çevirinin kullanımından kaynaklanan herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->