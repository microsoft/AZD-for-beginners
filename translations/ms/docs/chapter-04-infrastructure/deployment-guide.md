# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Current Chapter**: Bab 4 - Infrastruktur sebagai Kod & Penyebaran
- **⬅️ Previous Chapter**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Panduan ini## Memahami Proses Penyebaranpanduan komprehensif ini merangkumi segala yang anda perlu tahu tentang menyebarkan aplikasi menggunakan Azure Developer CLI, dari penyebaran satu-perintah asas hingga senario pengeluaran lanjutan dengan hooks tersuai, berbilang persekitaran, dan integrasi CI/CD. Kuasai kitaran hidup penyebaran lengkap dengan contoh praktikal dan amalan terbaik.

## Learning Goals

Dengan melengkapkan panduan ini, anda akan:
- Menguasai semua arahan dan aliran kerja penyebaran Azure Developer CLI
- Memahami kitaran hidup penyebaran lengkap dari peruntukan hingga pemantauan
- Melaksanakan hooks penyebaran tersuai untuk automasi pra dan pasca-penyebaran
- Mengkonfigurasi berbilang persekitaran dengan parameter khusus persekitaran
- Menyediakan strategi penyebaran lanjutan termasuk blue-green dan canary
- Menggabungkan penyebaran azd dengan saluran CI/CD dan aliran kerja DevOps

## Learning Outcomes

Setelah selesai, anda akan dapat:
- Melaksanakan dan menyelesaikan masalah semua aliran kerja penyebaran azd secara bebas
- Mereka bentuk dan melaksanakan automasi penyebaran tersuai menggunakan hooks
- Mengkonfigurasi penyebaran sedia-produksi dengan keselamatan dan pemantauan yang betul
- Mengurus senario penyebaran berbilang-persekitaran yang kompleks
- Mengoptimumkan prestasi penyebaran dan melaksanakan strategi pembalikan
- Mengintegrasikan penyebaran azd ke dalam amalan DevOps perusahaan

## Deployment Overview

Azure Developer CLI menyediakan beberapa arahan penyebaran:
- `azd up` - Aliran kerja lengkap (peruntukan + penyebaran)
- `azd provision` - Cipta/kemas kini sumber Azure sahaja
- `azd deploy` - Menyebarkan kod aplikasi sahaja
- `azd package` - Bina dan bungkus aplikasi

## Basic Deployment Workflows

### Complete Deployment (azd up)
Aliran kerja yang paling biasa untuk projek baru:
```bash
# Sebarkan semuanya dari awal
azd up

# Sebarkan dengan persekitaran tertentu
azd up --environment production

# Sebarkan dengan parameter tersuai
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Apabila anda hanya perlu mengemas kini sumber Azure:
```bash
# Sediakan/kemas kini infrastruktur
azd provision

# Sediakan dalam mod percubaan untuk pratonton perubahan
azd provision --preview

# Sediakan perkhidmatan tertentu
azd provision --service database
```

### Code-Only Deployment
Untuk kemas kini aplikasi yang cepat:
```bash
# Sebarkan semua perkhidmatan
azd deploy

# Keluaran yang dijangka:
# Menyebarkan perkhidmatan (azd deploy)
# - web: Menyebarkan... Selesai
# - api: Menyebarkan... Selesai
# BERJAYA: Penyebaran anda selesai dalam 2 minit 15 saat

# Sebarkan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Sebarkan dengan argumen binaan tersuai
azd deploy --service api --build-arg NODE_ENV=production

# Sahkan penyebaran
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

Selepas sebarang penyebaran, sahkan kejayaan:

```bash
# Periksa semua perkhidmatan sedang berjalan
azd show

# Uji titik akhir kesihatan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pantau untuk ralat (dibuka dalam pelayar secara lalai)
azd monitor --logs
```

**Kriteria Kejayaan:**
- ✅ Semua perkhidmatan menunjukkan status "Running"
- ✅ Endpoint kesihatan mengembalikan HTTP 200
- ✅ Tiada log ralat dalam 5 minit terakhir
- ✅ Aplikasi memberi respons kepada permintaan ujian

## 🏗️ Understanding the Deployment Process

### Phase 1: Pre-Provision Hooks
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

### Phase 2: Infrastructure Provisioning
- Membaca templat infrastruktur (Bicep/Terraform)
- Mencipta atau mengemas kini sumber Azure
- Mengkonfigurasi rangkaian dan keselamatan
- Menyediakan pemantauan dan logging

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- Membina kod aplikasi
- Mencipta artifak penyebaran
- Membungkus untuk platform sasaran (kontena, fail ZIP, dll.)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- Menyebarkan aplikasi yang dibungkus ke perkhidmatan Azure
- Mengemas kini tetapan konfigurasi
- Memulakan/memulakan semula perkhidmatan

### Phase 7: Post-Deploy Hooks
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

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
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

### Environment-Specific Configurations
```bash
# Persekitaran pembangunan
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Persekitaran pementasan
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Persekitaran pengeluaran
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Advanced Deployment Scenarios

### Multi-Service Applications
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

### Blue-Green Deployments
```bash
# Cipta persekitaran biru
azd env new production-blue
azd up --environment production-blue

# Uji persekitaran biru
./scripts/test-environment.sh production-blue

# Alihkan trafik ke biru (kemas kini DNS/pengimbang beban secara manual)
./scripts/switch-traffic.sh production-blue

# Bersihkan persekitaran hijau
azd env select production-green
azd down --force
```

### Canary Deployments
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

### Staged Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Performance Optimization

### Service-Specific Deployments
```bash
# Sebarkan perkhidmatan tertentu untuk iterasi lebih cepat
azd deploy --service web
azd deploy --service api

# Sebarkan semua perkhidmatan
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efficient Code Deployments
```bash
# Gunakan azd deploy (bukan azd up) untuk perubahan kod sahaja
# Ini mengelakkan penyediaan infrastruktur dan jauh lebih pantas
azd deploy

# Terapkan perkhidmatan tertentu untuk iterasi terpantas
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Pantau aplikasi secara masa nyata
azd monitor --live

# Lihat log aplikasi
azd monitor --logs

# Semak status penyebaran
azd show
```

### Health Checks
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

### Post-Deployment Validation
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Periksa kesihatan aplikasi
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

## 🔐 Security Considerations

### Secrets Management
```bash
# Simpan rahsia dengan selamat
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Rujuk rahsia dalam azure.yaml
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# AZD tidak mempunyai rollback terbina dalam. Pendekatan yang disyorkan:

# Pilihan 1: Deploy semula dari Git (disyorkan)
git revert HEAD  # Kembalikan commit yang bermasalah
git push
azd deploy

# Pilihan 2: Deploy semula commit tertentu
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# Pratonton perubahan infrastruktur sebelum menerapkannya
azd provision --preview

# Untuk pengembalian infrastruktur, gunakan kawalan versi:
git revert HEAD  # Kembalikan perubahan infrastruktur
azd provision    # Terapkan keadaan infrastruktur sebelumnya
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Track Deployment Performance
```bash
# Lihat status penyebaran semasa
azd show

# Pantau aplikasi dengan Application Insights
azd monitor --overview

# Lihat metrik masa nyata
azd monitor --live
```

### Custom Metrics Collection
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

## 🎯 Best Practices

### 1. Environment Consistency
```bash
# Gunakan penamaan yang konsisten
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Kekalkan kesamaan persekitaran
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Pratonton perubahan infrastruktur sebelum penyebaran
azd provision --preview

# Gunakan linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Sahkan sintaks Bicep
az bicep build --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# Dokumentasikan prosedur penyebaran
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Peruntukan Sumber](provisioning.md) - Pendalaman pengurusan infrastruktur
- [Perancangan Pra-Penyebaran](../chapter-06-pre-deployment/capacity-planning.md) - Rancang strategi penyebaran anda
- [Isu Lazim](../chapter-07-troubleshooting/common-issues.md) - Menyelesaikan isu penyebaran
- [Amalan Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi penyebaran sedia-produksi

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Matlamat**: Menguasai perbezaan antara penyebaran penuh dan inkremen

```bash
# Penyebaran awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Catat masa penyebaran awal
echo "Full deployment: $(date)" > deployment-log.txt

# Buat perubahan kod
echo "// Updated $(date)" >> src/api/src/server.js

# Sebarkan hanya kod (pantas)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Bandingkan masa
cat deployment-log.txt

# Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Penyebaran penuh mengambil masa 5-15 minit
- [ ] Penyebaran kod sahaja mengambil masa 2-5 minit
- [ ] Perubahan kod tercermin dalam aplikasi yang disebarkan
- [ ] Infrastruktur tidak berubah selepas `azd deploy`

**Hasil Pembelajaran**: `azd deploy` adalah 50-70% lebih pantas berbanding `azd up` untuk perubahan kod

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Matlamat**: Laksanakan automasi pra dan pasca-penyebaran

```bash
# Buat skrip pengesahan pra-penerapan
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Periksa sama ada ujian lulus
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Periksa sebarang perubahan yang belum dikomit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Buat ujian ringkas selepas penerapan
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

# Tambah hooks ke azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Uji penerapan dengan hooks
azd deploy
```

**Kriteria Kejayaan:**
- [ ] Skrip pra-penyebaran berjalan sebelum penyebaran
- [ ] Penyebaran dibatalkan jika ujian gagal
- [ ] Ujian smoke pasca-penyebaran mengesahkan kesihatan
- [ ] Hooks dijalankan mengikut susunan yang betul

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Matlamat**: Laksanakan aliran kerja penyebaran bertahap (dev → staging → production)

```bash
# Buat skrip penyebaran
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Langkah 1: Sebarkan ke dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Langkah 2: Sebarkan ke staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Langkah 3: Kelulusan manual untuk pengeluaran
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

# Buat persekitaran
azd env new dev
azd env new staging
azd env new production

# Jalankan penyebaran berperingkat
./deploy-staged.sh
```

**Kriteria Kejayaan:**
- [ ] Persekitaran dev berjaya disebarkan
- [ ] Persekitaran staging berjaya disebarkan
- [ ] Kelulusan manual diperlukan untuk pengeluaran
- [ ] Semua persekitaran mempunyai pemeriksaan kesihatan yang berfungsi
- [ ] Boleh membuat pembalikan jika diperlukan

### Exercise 4: Rollback Strategy (25 minutes)
**Matlamat**: Laksanakan dan uji pembalikan penyebaran menggunakan Git

```bash
# Lancarkan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan hash commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Lancarkan v2 dengan perubahan yang tidak serasi
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Mengesan kegagalan dan melakukan rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Melakukan rollback menggunakan git
    git revert HEAD --no-edit
    
    # Mengembalikan persekitaran
    azd env set APP_VERSION "1.0.0"
    
    # Lancarkan semula v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Kejayaan:**
- [ ] Boleh mengesan kegagalan penyebaran
- [ ] Skrip pembalikan dijalankan secara automatik
- [ ] Aplikasi kembali ke keadaan berfungsi
- [ ] Pemeriksaan kesihatan lulus selepas pembalikan

## 📊 Deployment Metrics Tracking

### Jejaki Prestasi Penyebaran Anda

```bash
# Buat skrip metrik penyebaran
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

# Log ke fail
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gunakan ia
./track-deployment.sh
```

**Analisis metrik anda:**
```bash
# Lihat sejarah penyebaran
cat deployment-metrics.csv

# Kira purata masa penyebaran
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

- [Rujukan Penyebaran Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Penyebaran Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Penyebaran Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Penyebaran Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang muktamad. Untuk maklumat penting, disarankan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->