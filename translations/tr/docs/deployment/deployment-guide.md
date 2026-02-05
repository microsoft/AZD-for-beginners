# Dağıtım Kılavuzu - AZD Dağıtımlarında Ustalaşma

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 4 - Kod Olarak Altyapı ve Dağıtım
- **⬅️ Önceki Bölüm**: [Bölüm 3: Konfigürasyon](../getting-started/configuration.md)
- **➡️ Sonraki**: [Kaynakların Sağlanması](provisioning.md)
- **🚀 Sonraki Bölüm**: [Bölüm 5: Çoklu Ajanlı Yapay Zeka Çözümleri](../../examples/retail-scenario.md)

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI kullanarak uygulamaların nasıl dağıtılacağını öğrenmeniz için gereken her şeyi kapsar. Temel tek komutla dağıtımlardan, özel kancalar, birden fazla ortam ve CI/CD entegrasyonu içeren gelişmiş üretim senaryolarına kadar her şeyi içerir. Pratik örnekler ve en iyi uygulamalarla tam bir dağıtım yaşam döngüsünde ustalaşın.

## Öğrenme Hedefleri

Bu kılavuzu tamamladığınızda:
- Azure Developer CLI dağıtım komutları ve iş akışlarında ustalaşacaksınız
- Sağlamadan izlemeye kadar tam dağıtım yaşam döngüsünü anlayacaksınız
- Dağıtım öncesi ve sonrası otomasyon için özel dağıtım kancaları uygulayacaksınız
- Ortama özgü parametrelerle birden fazla ortam yapılandıracaksınız
- Mavi-yeşil ve kanarya dağıtımları gibi gelişmiş dağıtım stratejileri kuracaksınız
- azd dağıtımlarını CI/CD boru hatları ve DevOps iş akışlarıyla entegre edeceksiniz

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Tüm azd dağıtım iş akışlarını bağımsız olarak çalıştırıp sorun giderebileceksiniz
- Özel dağıtım otomasyonunu kancalar kullanarak tasarlayıp uygulayabileceksiniz
- Güvenlik ve izleme ile üretime hazır dağıtımlar yapılandırabileceksiniz
- Karmaşık çoklu ortam dağıtım senaryolarını yönetebileceksiniz
- Dağıtım performansını optimize edip geri alma stratejileri uygulayabileceksiniz
- azd dağıtımlarını kurumsal DevOps uygulamalarına entegre edebileceksiniz

## Dağıtım Genel Bakış

Azure Developer CLI birkaç dağıtım komutu sağlar:
- `azd up` - Tam iş akışı (sağlama + dağıtım)
- `azd provision` - Sadece Azure kaynaklarını oluştur/güncelle
- `azd deploy` - Sadece uygulama kodunu dağıt
- `azd package` - Uygulamaları oluştur ve paketle

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

# Değişiklikleri önizlemek için dry-run ile sağla
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

Herhangi bir dağıtımdan sonra başarıyı doğrulayın:

```bash
# Tüm hizmetlerin çalıştığını kontrol et
azd show

# Sağlık uç noktalarını test et
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Hatalar için günlükleri kontrol et
azd logs --service api --since 5m | grep -i error
```

**Başarı Kriterleri:**
- ✅ Tüm hizmetler "Çalışıyor" durumunda
- ✅ Sağlık uç noktaları HTTP 200 döndürüyor
- ✅ Son 5 dakikada hata günlüğü yok
- ✅ Uygulama test isteklerine yanıt veriyor

## 🏗️ Dağıtım Sürecini Anlama

### Aşama 1: Sağlama Öncesi Kancalar
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
- İzleme ve günlük kaydını ayarlar

### Aşama 3: Sağlama Sonrası Kancalar
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
- Uygulama kodunu oluşturur
- Dağıtım eserlerini oluşturur
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

### Ortama Özgü Yapılandırmalar
```bash
# Geliştirme ortamı
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Test ortamı
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

### Çok Hizmetli Uygulamalar
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
```bash
# Mavi ortam oluştur
azd env new production-blue
azd up --environment production-blue

# Mavi ortamı test et
./scripts/test-environment.sh production-blue

# Trafiği maviye yönlendir (manuel DNS/yük dengeleyici güncellemesi)
./scripts/switch-traffic.sh production-blue

# Yeşil ortamı temizle
azd env select production-green
azd down --force
```

### Kanarya Dağıtımları
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

### Konteyner Uygulama Dağıtımları
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

### Paralel Dağıtımlar
```bash
# Paralel dağıtımı yapılandır
azd config set deploy.parallelism 5

# Hizmetleri paralel olarak dağıt
azd deploy --parallel
```

### Yapı Önbellekleme
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Artımlı Dağıtımlar
```bash
# Yalnızca değişen hizmetleri dağıt
azd deploy --incremental

# Değişiklik algılama ile dağıt
azd deploy --detect-changes
```

## 🔍 Dağıtım İzleme

### Gerçek Zamanlı Dağıtım İzleme
```bash
# Dağıtım ilerlemesini izleyin
azd deploy --follow

# Dağıtım günlüklerini görüntüleyin
azd logs --follow --service api

# Dağıtım durumunu kontrol edin
azd show --service api
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

## 🔐 Güvenlik Dikkatleri

### Gizlilik Yönetimi
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

## 🚨 Geri Alma Stratejileri

### Hızlı Geri Alma
```bash
# Önceki dağıtıma geri dön
azd deploy --rollback

# Belirli hizmeti geri al
azd deploy --service api --rollback

# Belirli sürüme geri dön
azd deploy --service api --version v1.2.3
```

### Altyapı Geri Alma
```bash
# Altyapı değişikliklerini geri al
azd provision --rollback

# Geri alma değişikliklerini önizle
azd provision --rollback --preview
```

### Veritabanı Geçiş Geri Alma
```bash
#!/bin/bash
# scripts/veritabanını-geri-al.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Dağıtım Metrikleri

### Dağıtım Performansını İzleme
```bash
# Dağıtım metriklerini etkinleştir
azd config set telemetry.deployment.enabled true

# Dağıtım geçmişini görüntüle
azd history

# Dağıtım istatistiklerini al
azd metrics --type deployment
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
# Tutarlı adlandırma kullanın
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Çevre eşitliğini koruyun
./scripts/sync-environments.sh
```

### 2. Altyapı Doğrulaması
```bash
# Dağıtımdan önce doğrulayın
azd provision --preview
azd provision --what-if

# ARM/Bicep linting kullanın
az bicep lint --file infra/main.bicep
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

### 4. Dokümantasyon ve Günlük Kaydı
```bash
# Dağıtım prosedürlerini belgeleyin
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sonraki Adımlar

- [Kaynakların Sağlanması](provisioning.md) - Altyapı yönetimine derinlemesine dalış
- [Dağıtım Öncesi Planlama](../pre-deployment/capacity-planning.md) - Dağıtım stratejinizi planlayın
- [Yaygın Sorunlar](../troubleshooting/common-issues.md) - Dağıtım sorunlarını çözün
- [En İyi Uygulamalar](../troubleshooting/debugging.md) - Üretime hazır dağıtım stratejileri

## 🎯 Uygulamalı Dağıtım Egzersizleri

### Egzersiz 1: Artımlı Dağıtım İş Akışı (20 dakika)
**Hedef**: Tam ve artımlı dağıtımlar arasındaki farkı öğrenin

```bash
# İlk dağıtım
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# İlk dağıtım zamanını kaydet
echo "Full deployment: $(date)" > deployment-log.txt

# Kod değişikliği yap
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
- [ ] Sadece kod dağıtımı 2-5 dakika sürer
- [ ] Kod değişiklikleri dağıtılan uygulamada yansır
- [ ] Altyapı `azd deploy` sonrası değişmeden kalır

**Öğrenme Çıktısı**: Kod değişiklikleri için `azd deploy`, `azd up`'dan %50-70 daha hızlıdır

### Egzersiz 2: Özel Dağıtım Kancaları (30 dakika)
**Hedef**: Dağıtım öncesi ve sonrası otomasyon uygulayın

```bash
# Ön dağıtım doğrulama betiği oluştur
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Testlerin geçtiğini kontrol et
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Kaydedilmemiş değişiklikleri kontrol et
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Dağıtım sonrası duman testi oluştur
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

# azure.yaml dosyasına kancalar ekle
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Kancalarla dağıtımı test et
azd deploy
```

**Başarı Kriterleri:**
- [ ] Dağıtım öncesi komut dosyası dağıtımdan önce çalışır
- [ ] Testler başarısız olursa dağıtım iptal edilir
- [ ] Dağıtım sonrası duman testi sağlığı doğrular
- [ ] Kancalar doğru sırada çalışır

### Egzersiz 3: Çoklu Ortam Dağıtım Stratejisi (45 dakika)
**Hedef**: Aşamalı dağıtım iş akışını uygulayın (geliştirme → test → üretim)

```bash
# Dağıtım betiği oluştur
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Adım 1: Geliştirme ortamına dağıtım yap
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Adım 2: Staging ortamına dağıtım yap
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

# Ortamları oluştur
azd env new dev
azd env new staging
azd env new production

# Aşamalı dağıtımı çalıştır
./deploy-staged.sh
```

**Başarı Kriterleri:**
- [ ] Geliştirme ortamı başarıyla dağıtılır
- [ ] Test ortamı başarıyla dağıtılır
- [ ] Üretim için manuel onay gereklidir
- [ ] Tüm ortamlar çalışan sağlık kontrollerine sahiptir
- [ ] Gerekirse geri alınabilir

### Egzersiz 4: Geri Alma Stratejisi (25 dakika)
**Hedef**: Dağıtım geri alma işlemini uygulayın ve test edin

```bash
# v1'i dağıt
azd env set APP_VERSION "1.0.0"
azd up

# v1 yapılandırmasını kaydet
cp -r .azure/production .azure/production-v1-backup

# Kırıcı değişiklikle v2'yi dağıt
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Hata algıla
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Kodu geri al
    git checkout src/api/src/server.js
    
    # Ortamı geri al
    azd env set APP_VERSION "1.0.0"
    
    # v1'i yeniden dağıt
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Başarı Kriterleri:**
- [ ] Dağıtım hatalarını algılayabilir
- [ ] Geri alma komut dosyası otomatik olarak çalışır
- [ ] Uygulama çalışır duruma geri döner
- [ ] Geri alma sonrası sağlık kontrolleri geçer

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Dosyaya kaydet
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
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

**Navigasyon**
- **Önceki Ders**: [İlk Projeniz](../getting-started/first-project.md)
- **Sonraki Ders**: [Kaynakların Sağlanması](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->