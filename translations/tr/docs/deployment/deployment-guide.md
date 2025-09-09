<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T19:22:08+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "tr"
}
-->
# Dağıtım Kılavuzu - AZD Dağıtımlarını Ustalaştırma

## Giriş

Bu kapsamlı kılavuz, Azure Developer CLI kullanarak uygulamaları dağıtma konusunda bilmeniz gereken her şeyi kapsar. Temel tek komutla dağıtımlardan, özel kancalar, birden fazla ortam ve CI/CD entegrasyonu içeren gelişmiş üretim senaryolarına kadar her şeyi öğrenin. Pratik örnekler ve en iyi uygulamalarla tam dağıtım yaşam döngüsünü ustalaştırın.

## Öğrenme Hedefleri

Bu kılavuzu tamamladığınızda:
- Tüm Azure Developer CLI dağıtım komutlarını ve iş akışlarını ustalaştıracaksınız
- Kaynak oluşturma ve izleme dahil tam dağıtım yaşam döngüsünü anlayacaksınız
- Dağıtım öncesi ve sonrası otomasyon için özel dağıtım kancaları uygulayacaksınız
- Ortama özel parametrelerle birden fazla ortam yapılandıracaksınız
- Blue-green ve canary dağıtımları gibi gelişmiş dağıtım stratejileri kuracaksınız
- Azd dağıtımlarını CI/CD boru hatları ve DevOps iş akışlarıyla entegre edeceksiniz

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Tüm azd dağıtım iş akışlarını bağımsız olarak çalıştırıp sorunlarını giderebileceksiniz
- Özel dağıtım otomasyonunu kancalar kullanarak tasarlayıp uygulayabileceksiniz
- Güvenlik ve izleme ile üretime hazır dağıtımlar yapılandırabileceksiniz
- Karmaşık çok ortamlı dağıtım senaryolarını yönetebileceksiniz
- Dağıtım performansını optimize edip geri alma stratejileri uygulayabileceksiniz
- Azd dağıtımlarını kurumsal DevOps uygulamalarına entegre edebileceksiniz

## Dağıtım Genel Bakış

Azure Developer CLI birkaç dağıtım komutu sağlar:
- `azd up` - Tam iş akışı (kaynak oluşturma + dağıtım)
- `azd provision` - Sadece Azure kaynaklarını oluştur/güncelle
- `azd deploy` - Sadece uygulama kodunu dağıt
- `azd package` - Uygulamaları oluştur ve paketle

## Temel Dağıtım İş Akışları

### Tam Dağıtım (azd up)
Yeni projeler için en yaygın iş akışı:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Sadece Altyapı Dağıtımı
Sadece Azure kaynaklarını güncellemeniz gerektiğinde:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Sadece Kod Dağıtımı
Hızlı uygulama güncellemeleri için:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Dağıtım Sürecini Anlama

### Aşama 1: Kaynak Oluşturma Öncesi Kancalar
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

### Aşama 2: Altyapı Kaynak Oluşturma
- Altyapı şablonlarını (Bicep/Terraform) okur
- Azure kaynaklarını oluşturur veya günceller
- Ağ ve güvenlik yapılandırmalarını yapar
- İzleme ve günlük kaydını kurar

### Aşama 3: Kaynak Oluşturma Sonrası Kancalar
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
- Dağıtım artefaktlarını oluşturur
- Hedef platform için paketler (konteynerler, ZIP dosyaları, vb.)

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

### Hizmete Özel Dağıtım Ayarları
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

### Ortama Özel Yapılandırmalar
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

### Blue-Green Dağıtımları
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Dağıtım İzleme

### Gerçek Zamanlı Dağıtım İzleme
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

# Check application health
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

### Gizli Bilgi Yönetimi
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Altyapı Geri Alma
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Veritabanı Geçişi Geri Alma
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

### Dağıtım Performansını İzleme
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Altyapı Doğrulama
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Sonraki Adımlar

- [Kaynakları Oluşturma](provisioning.md) - Altyapı yönetimine derinlemesine bir bakış
- [Dağıtım Öncesi Planlama](../pre-deployment/capacity-planning.md) - Dağıtım stratejinizi planlayın
- [Yaygın Sorunlar](../troubleshooting/common-issues.md) - Dağıtım sorunlarını çözün
- [En İyi Uygulamalar](../troubleshooting/debugging.md) - Üretime hazır dağıtım stratejileri

## Ek Kaynaklar

- [Azure Developer CLI Dağıtım Referansı](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Dağıtımı](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Dağıtımı](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Dağıtımı](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasyon**
- **Önceki Ders**: [İlk Projeniz](../getting-started/first-project.md)
- **Sonraki Ders**: [Kaynakları Oluşturma](provisioning.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.