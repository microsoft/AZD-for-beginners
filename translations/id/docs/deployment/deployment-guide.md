# Panduan Deployment - Menguasai Deployment AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 4 - Infrastruktur sebagai Kode & Deployment
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)
- **➡️ Selanjutnya**: [Penyediaan Sumber Daya](provisioning.md)
- **🚀 Bab Berikutnya**: [Bab 5: Solusi AI Multi-Agent](../../examples/retail-scenario.md)

## Pendahuluan

Panduan komprehensif ini mencakup semua yang perlu Anda ketahui tentang deployment aplikasi menggunakan Azure Developer CLI, mulai dari deployment dengan satu perintah hingga skenario produksi tingkat lanjut dengan custom hooks, beberapa lingkungan, dan integrasi CI/CD. Kuasai seluruh siklus hidup deployment dengan contoh praktis dan praktik terbaik.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai semua perintah dan alur kerja deployment Azure Developer CLI
- Memahami seluruh siklus hidup deployment dari penyediaan hingga pemantauan
- Menerapkan custom hooks untuk otomatisasi sebelum dan sesudah deployment
- Mengonfigurasi beberapa lingkungan dengan parameter spesifik lingkungan
- Menyiapkan strategi deployment tingkat lanjut termasuk blue-green dan canary deployments
- Mengintegrasikan deployment azd dengan pipeline CI/CD dan alur kerja DevOps

## Hasil Pembelajaran

Setelah selesai, Anda akan mampu:
- Menjalankan dan memecahkan masalah semua alur kerja deployment azd secara mandiri
- Merancang dan menerapkan otomatisasi deployment custom menggunakan hooks
- Mengonfigurasi deployment siap produksi dengan keamanan dan pemantauan yang tepat
- Mengelola skenario deployment multi-lingkungan yang kompleks
- Mengoptimalkan kinerja deployment dan menerapkan strategi rollback
- Mengintegrasikan deployment azd ke dalam praktik DevOps perusahaan

## Gambaran Umum Deployment

Azure Developer CLI menyediakan beberapa perintah deployment:
- `azd up` - Alur kerja lengkap (provision + deploy)
- `azd provision` - Membuat/memperbarui sumber daya Azure saja
- `azd deploy` - Mendeploy kode aplikasi saja
- `azd package` - Membangun dan mengemas aplikasi

## Alur Kerja Deployment Dasar

### Deployment Lengkap (azd up)
Alur kerja yang paling umum untuk proyek baru:
```bash
# Terapkan semuanya dari awal
azd up

# Terapkan dengan lingkungan tertentu
azd up --environment production

# Terapkan dengan parameter khusus
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Deployment Infrastruktur Saja
Ketika Anda hanya perlu memperbarui sumber daya Azure:
```bash
# Penyediaan/pembaruan infrastruktur
azd provision

# Penyediaan dengan dry-run untuk melihat pratinjau perubahan
azd provision --preview

# Penyediaan layanan tertentu
azd provision --service database
```

### Deployment Kode Saja
Untuk pembaruan aplikasi yang cepat:
```bash
# Sebarkan semua layanan
azd deploy

# Output yang diharapkan:
# Menyebarkan layanan (azd deploy)
# - web: Menyebarkan... Selesai
# - api: Menyebarkan... Selesai
# BERHASIL: Penyebaran Anda selesai dalam 2 menit 15 detik

# Sebarkan layanan tertentu
azd deploy --service web
azd deploy --service api

# Sebarkan dengan argumen build khusus
azd deploy --service api --build-arg NODE_ENV=production

# Verifikasi penyebaran
azd show --output json | jq '.services'
```

### ✅ Verifikasi Deployment

Setelah setiap deployment, verifikasi keberhasilan:

```bash
# Periksa semua layanan berjalan
azd show

# Uji endpoint kesehatan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Periksa log untuk kesalahan
azd logs --service api --since 5m | grep -i error
```

**Kriteria Keberhasilan:**
- ✅ Semua layanan menunjukkan status "Running"
- ✅ Endpoint kesehatan mengembalikan HTTP 200
- ✅ Tidak ada log error dalam 5 menit terakhir
- ✅ Aplikasi merespons permintaan uji

## 🏗️ Memahami Proses Deployment

### Fase 1: Pre-Provision Hooks
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

### Fase 2: Penyediaan Infrastruktur
- Membaca template infrastruktur (Bicep/Terraform)
- Membuat atau memperbarui sumber daya Azure
- Mengonfigurasi jaringan dan keamanan
- Menyiapkan pemantauan dan logging

### Fase 3: Post-Provision Hooks
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

### Fase 4: Pengemasan Aplikasi
- Membangun kode aplikasi
- Membuat artefak deployment
- Mengemas untuk platform target (container, file ZIP, dll.)

### Fase 5: Pre-Deploy Hooks
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

### Fase 6: Deployment Aplikasi
- Mendeploy aplikasi yang telah dikemas ke layanan Azure
- Memperbarui pengaturan konfigurasi
- Memulai/memulai ulang layanan

### Fase 7: Post-Deploy Hooks
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

## 🎛️ Konfigurasi Deployment

### Pengaturan Deployment Spesifik Layanan
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

### Konfigurasi Spesifik Lingkungan
```bash
# Lingkungan pengembangan
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Lingkungan staging
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Lingkungan produksi
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Skenario Deployment Tingkat Lanjut

### Aplikasi Multi-Layanan
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
# Buat lingkungan biru
azd env new production-blue
azd up --environment production-blue

# Uji lingkungan biru
./scripts/test-environment.sh production-blue

# Alihkan lalu lintas ke biru (pembaruan DNS/load balancer manual)
./scripts/switch-traffic.sh production-blue

# Bersihkan lingkungan hijau
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

### Deployment Bertahap
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

## 🐳 Deployment Container

### Deployment Aplikasi Container
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

### Optimasi Multi-Stage Dockerfile
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

## ⚡ Optimasi Kinerja

### Deployment Paralel
```bash
# Konfigurasikan penyebaran paralel
azd config set deploy.parallelism 5

# Sebarkan layanan secara paralel
azd deploy --parallel
```

### Caching Build
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

### Deployment Inkremental
```bash
# Hanya terapkan layanan yang berubah
azd deploy --incremental

# Terapkan dengan deteksi perubahan
azd deploy --detect-changes
```

## 🔍 Pemantauan Deployment

### Pemantauan Deployment Real-Time
```bash
# Pantau kemajuan penerapan
azd deploy --follow

# Lihat log penerapan
azd logs --follow --service api

# Periksa status penerapan
azd show --service api
```

### Pemeriksaan Kesehatan
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

### Validasi Pasca-Deployment
```bash
#!/bin/bash
# skrip/validasi-deployment.sh

echo "Validating deployment..."

# Periksa kesehatan aplikasi
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

## 🔐 Pertimbangan Keamanan

### Manajemen Rahasia
```bash
# Simpan rahasia dengan aman
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Referensi rahasia di azure.yaml
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

### Keamanan Jaringan
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Manajemen Identitas dan Akses
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

## 🚨 Strategi Rollback

### Rollback Cepat
```bash
# Kembali ke penerapan sebelumnya
azd deploy --rollback

# Kembali ke layanan tertentu
azd deploy --service api --rollback

# Kembali ke versi tertentu
azd deploy --service api --version v1.2.3
```

### Rollback Infrastruktur
```bash
# Kembalikan perubahan infrastruktur
azd provision --rollback

# Pratinjau perubahan pengembalian
azd provision --rollback --preview
```

### Rollback Migrasi Database
```bash
#!/bin/bash
# skrip/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrik Deployment

### Melacak Kinerja Deployment
```bash
# Aktifkan metrik penyebaran
azd config set telemetry.deployment.enabled true

# Lihat riwayat penyebaran
azd history

# Dapatkan statistik penyebaran
azd metrics --type deployment
```

### Pengumpulan Metrik Kustom
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

## 🎯 Praktik Terbaik

### 1. Konsistensi Lingkungan
```bash
# Gunakan penamaan yang konsisten
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Pertahankan kesetaraan lingkungan
./scripts/sync-environments.sh
```

### 2. Validasi Infrastruktur
```bash
# Validasi sebelum penerapan
azd provision --preview
azd provision --what-if

# Gunakan linting ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Integrasi Pengujian
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

### 4. Dokumentasi dan Logging
```bash
# Dokumentasikan prosedur penerapan
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Selanjutnya

- [Penyediaan Sumber Daya](provisioning.md) - Penjelasan mendalam tentang manajemen infrastruktur
- [Perencanaan Pra-Deployment](../pre-deployment/capacity-planning.md) - Rencanakan strategi deployment Anda
- [Masalah Umum](../troubleshooting/common-issues.md) - Selesaikan masalah deployment
- [Praktik Terbaik](../troubleshooting/debugging.md) - Strategi deployment siap produksi

## 🎯 Latihan Deployment Praktis

### Latihan 1: Alur Kerja Deployment Inkremental (20 menit)
**Tujuan**: Kuasai perbedaan antara deployment penuh dan inkremental

```bash
# Penempatan awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Catat waktu penempatan awal
echo "Full deployment: $(date)" > deployment-log.txt

# Lakukan perubahan kode
echo "// Updated $(date)" >> src/api/src/server.js

# Terapkan hanya kode (cepat)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Bandingkan waktu
cat deployment-log.txt

# Bersihkan
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Deployment penuh memakan waktu 5-15 menit
- [ ] Deployment kode saja memakan waktu 2-5 menit
- [ ] Perubahan kode tercermin dalam aplikasi yang dideploy
- [ ] Infrastruktur tidak berubah setelah `azd deploy`

**Hasil Pembelajaran**: `azd deploy` 50-70% lebih cepat daripada `azd up` untuk perubahan kode

### Latihan 2: Custom Deployment Hooks (30 menit)
**Tujuan**: Menerapkan otomatisasi sebelum dan sesudah deployment

```bash
# Buat skrip validasi pra-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Periksa apakah tes lulus
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Periksa perubahan yang belum dikomit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Buat tes smoke pasca-deploy
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

# Tambahkan hooks ke azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Uji deployment dengan hooks
azd deploy
```

**Kriteria Keberhasilan:**
- [ ] Skrip pre-deploy berjalan sebelum deployment
- [ ] Deployment dibatalkan jika pengujian gagal
- [ ] Pengujian smoke post-deploy memvalidasi kesehatan
- [ ] Hooks berjalan dalam urutan yang benar

### Latihan 3: Strategi Deployment Multi-Lingkungan (45 menit)
**Tujuan**: Menerapkan alur kerja deployment bertahap (dev → staging → produksi)

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

# Langkah 3: Persetujuan manual untuk produksi
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

# Buat lingkungan
azd env new dev
azd env new staging
azd env new production

# Jalankan penyebaran bertahap
./deploy-staged.sh
```

**Kriteria Keberhasilan:**
- [ ] Lingkungan dev berhasil dideploy
- [ ] Lingkungan staging berhasil dideploy
- [ ] Persetujuan manual diperlukan untuk produksi
- [ ] Semua lingkungan memiliki pemeriksaan kesehatan yang berfungsi
- [ ] Dapat melakukan rollback jika diperlukan

### Latihan 4: Strategi Rollback (25 menit)
**Tujuan**: Menerapkan dan menguji rollback deployment

```bash
# Terapkan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan konfigurasi v1
cp -r .azure/production .azure/production-v1-backup

# Terapkan v2 dengan perubahan yang merusak
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Deteksi kegagalan
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Kembalikan kode
    git checkout src/api/src/server.js
    
    # Kembalikan lingkungan
    azd env set APP_VERSION "1.0.0"
    
    # Terapkan ulang v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Keberhasilan:**
- [ ] Dapat mendeteksi kegagalan deployment
- [ ] Skrip rollback berjalan secara otomatis
- [ ] Aplikasi kembali ke keadaan yang berfungsi
- [ ] Pemeriksaan kesehatan berhasil setelah rollback

## 📊 Pelacakan Metrik Deployment

### Lacak Kinerja Deployment Anda

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

# Catat ke file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gunakan ini
./track-deployment.sh
```

**Analisis metrik Anda:**
```bash
# Lihat riwayat penerapan
cat deployment-metrics.csv

# Hitung rata-rata waktu penerapan
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Daya Tambahan

- [Referensi Deployment Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Deployment Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Deployment Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Deployment Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Proyek Pertama Anda](../getting-started/first-project.md)
- **Pelajaran Selanjutnya**: [Penyediaan Sumber Daya](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->