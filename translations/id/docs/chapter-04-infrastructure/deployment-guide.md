# Panduan Penerapan - Menguasai Penyebaran AZD

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Saat Ini**: Bab 4 - Infrastruktur sebagai Kode & Penerapan
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Berikutnya**: [Penyediaan Sumber Daya](provisioning.md)
- **🚀 Bab Berikutnya**: [Bab 5: Solusi AI Multi-Agen](../../examples/retail-scenario.md)

## Pendahuluan

Ini## Memahami Proses Penerapanpanduan komprehensif ini mencakup semua yang perlu Anda ketahui tentang menerapkan aplikasi menggunakan Azure Developer CLI, dari penyebaran satu-perintah dasar hingga skenario produksi lanjutan dengan hook kustom, banyak lingkungan, dan integrasi CI/CD. Kuasai siklus hidup penerapan lengkap dengan contoh praktis dan praktik terbaik.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai semua perintah dan alur kerja penerapan Azure Developer CLI
- Memahami siklus hidup penerapan lengkap dari penyediaan hingga pemantauan
- Mengimplementasikan hook penerapan kustom untuk otomasi pra- dan pasca-penerapan
- Mengonfigurasi banyak lingkungan dengan parameter khusus lingkungan
- Menyiapkan strategi penerapan lanjutan termasuk blue-green dan canary
- Mengintegrasikan penerapan azd dengan pipeline CI/CD dan alur kerja DevOps

## Hasil Pembelajaran

Setelah selesai, Anda akan dapat:
- Menjalankan dan memecahkan masalah semua alur kerja penerapan azd secara mandiri
- Merancang dan mengimplementasikan otomasi penerapan kustom menggunakan hook
- Mengonfigurasi penerapan siap-produksi dengan keamanan dan pemantauan yang tepat
- Mengelola skenario penerapan multi-lingkungan yang kompleks
- Mengoptimalkan kinerja penerapan dan mengimplementasikan strategi rollback
- Mengintegrasikan penerapan azd ke praktik DevOps perusahaan

## Ikhtisar Penerapan

Azure Developer CLI menyediakan beberapa perintah penerapan:
- `azd up` - Alur lengkap (penyediaan + penerapan)
- `azd provision` - Membuat/memperbarui sumber daya Azure saja
- `azd deploy` - Menerapkan kode aplikasi saja
- `azd package` - Membangun dan mengemas aplikasi

## Alur Kerja Penerapan Dasar

### Penerapan Lengkap (azd up)
Alur kerja paling umum untuk proyek baru:
```bash
# Terapkan semuanya dari awal
azd up

# Terapkan dengan lingkungan tertentu
azd up --environment production

# Terapkan dengan parameter khusus
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Penerapan Hanya Infrastruktur
Saat Anda hanya perlu memperbarui sumber daya Azure:
```bash
# Sediakan/perbarui infrastruktur
azd provision

# Sediakan dengan dry-run untuk melihat pratinjau perubahan
azd provision --preview

# Sediakan layanan tertentu
azd provision --service database
```

### Penerapan Hanya Kode
Untuk pembaruan aplikasi yang cepat:
```bash
# Menerapkan semua layanan
azd deploy

# Keluaran yang diharapkan:
# Menerapkan layanan (azd deploy)
# - web: Menerapkan... Selesai
# - api: Menerapkan... Selesai
# BERHASIL: Penyebaran Anda selesai dalam 2 menit 15 detik

# Menerapkan layanan tertentu
azd deploy --service web
azd deploy --service api

# Menerapkan dengan argumen build khusus
azd deploy --service api --build-arg NODE_ENV=production

# Verifikasi penyebaran
azd show --output json | jq '.services'
```

### ✅ Verifikasi Penerapan

Setelah setiap penerapan, verifikasi keberhasilan:

```bash
# Periksa apakah semua layanan berjalan
azd show

# Uji endpoint kesehatan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pantau kesalahan (terbuka di peramban secara default)
azd monitor --logs
```

**Kriteria Keberhasilan:**
- ✅ Semua layanan menunjukkan status "Running"
- ✅ Endpoint kesehatan mengembalikan HTTP 200
- ✅ Tidak ada log error dalam 5 menit terakhir
- ✅ Aplikasi merespons permintaan uji

## 🏗️ Memahami Proses Penerapan

### Fase 1: Hook Pra-Penyediaan
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
- Menyiapkan pemantauan dan pencatatan

### Fase 3: Hook Pasca-Penyediaan
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
- Membuat artefak penerapan
- Mengemas untuk platform target (kontainer, file ZIP, dll.)

### Fase 5: Hook Pra-Penerapan
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

### Fase 6: Penerapan Aplikasi
- Menerapkan aplikasi yang dikemas ke layanan Azure
- Memperbarui pengaturan konfigurasi
- Memulai/memulai ulang layanan

### Fase 7: Hook Pasca-Penerapan
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

## 🎛️ Konfigurasi Penerapan

### Pengaturan Penerapan Spesifik Layanan
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

# Lingkungan praproduksi
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

## 🔧 Skenario Penerapan Lanjutan

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

### Penerapan Blue-Green
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

### Penerapan Canary
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

### Penerapan Bertahap
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

## 🐳 Penerapan Kontainer

### Penerapan Aplikasi Kontainer
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

### Optimasi Dockerfile Multi-Tahap
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

### Penerapan Spesifik Layanan
```bash
# Terapkan layanan tertentu untuk iterasi yang lebih cepat
azd deploy --service web
azd deploy --service api

# Terapkan semua layanan
azd deploy
```

### Caching Build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Penerapan Kode yang Efisien
```bash
# Gunakan azd deploy (bukan azd up) untuk perubahan kode saja
# Ini melewatkan penyediaan infrastruktur dan jauh lebih cepat
azd deploy

# Deploy layanan tertentu untuk iterasi tercepat
azd deploy --service api
```

## 🔍 Pemantauan Penerapan

### Pemantauan Penerapan Waktu-nyata
```bash
# Pantau aplikasi secara waktu nyata
azd monitor --live

# Lihat log aplikasi
azd monitor --logs

# Periksa status penerapan
azd show
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

### Validasi Pasca-Penerapan
```bash
#!/bin/bash
# scripts/validate-deployment.sh

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

# Referensikan rahasia di azure.yaml
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
# AZD tidak memiliki rollback bawaan. Pendekatan yang disarankan:

# Opsi 1: Deploy ulang dari Git (disarankan)
git revert HEAD  # Batalkan commit yang bermasalah
git push
azd deploy

# Opsi 2: Deploy ulang commit tertentu
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback Infrastruktur
```bash
# Pratinjau perubahan infrastruktur sebelum menerapkannya
azd provision --preview

# Untuk pengembalian infrastruktur, gunakan sistem kontrol versi:
git revert HEAD  # Kembalikan perubahan infrastruktur
azd provision    # Terapkan keadaan infrastruktur sebelumnya
```

### Rollback Migrasi Basis Data
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrik Penerapan

### Melacak Kinerja Penerapan
```bash
# Lihat status penyebaran saat ini
azd show

# Pantau aplikasi dengan Application Insights
azd monitor --overview

# Lihat metrik secara langsung
azd monitor --live
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

# Pertahankan kesetaraan antar lingkungan
./scripts/sync-environments.sh
```

### 2. Validasi Infrastruktur
```bash
# Pratinjau perubahan infrastruktur sebelum penyebaran
azd provision --preview

# Gunakan linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Validasi sintaks Bicep
az bicep build --file infra/main.bicep
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

### 4. Dokumentasi dan Pencatatan
```bash
# Dokumentasikan prosedur penyebaran
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Selanjutnya

- [Penyediaan Sumber Daya](provisioning.md) - Pembahasan mendalam tentang manajemen infrastruktur
- [Perencanaan Pra-Penerapan](../chapter-06-pre-deployment/capacity-planning.md) - Rencanakan strategi penerapan Anda
- [Masalah Umum](../chapter-07-troubleshooting/common-issues.md) - Menyelesaikan masalah penerapan
- [Praktik Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi penerapan siap-produksi

## 🎯 Latihan Penerapan Praktis

### Latihan 1: Alur Kerja Penerapan Inkremental (20 menit)
**Tujuan**: Menguasai perbedaan antara penerapan penuh dan inkremental

```bash
# Penerapan awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Catat waktu penerapan awal
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
- [ ] Penerapan penuh memakan waktu 5-15 menit
- [ ] Penerapan hanya kode memakan waktu 2-5 menit
- [ ] Perubahan kode tercermin dalam aplikasi yang diterapkan
- [ ] Infrastruktur tidak berubah setelah `azd deploy`

**Hasil Pembelajaran**: `azd deploy` 50-70% lebih cepat daripada `azd up` untuk perubahan kode

### Latihan 2: Hook Penerapan Kustom (30 menit)
**Tujuan**: Mengimplementasikan otomasi pra- dan pasca-penerapan

```bash
# Buat skrip validasi pra-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Periksa apakah pengujian lulus
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Periksa apakah ada perubahan yang belum di-commit
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

# Uji penyebaran dengan hooks
azd deploy
```

**Kriteria Keberhasilan:**
- [ ] Skrip pra-penerapan dijalankan sebelum penerapan
- [ ] Penerapan dibatalkan jika pengujian gagal
- [ ] Smoke test pasca-penerapan memvalidasi kesehatan
- [ ] Hook dijalankan dalam urutan yang benar

### Latihan 3: Strategi Penerapan Multi-Lingkungan (45 menit)
**Tujuan**: Mengimplementasikan alur kerja penerapan bertahap (dev → staging → production)

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
- [ ] Lingkungan dev terdeploy dengan sukses
- [ ] Lingkungan staging terdeploy dengan sukses
- [ ] Persetujuan manual diperlukan untuk produksi
- [ ] Semua lingkungan memiliki pemeriksaan kesehatan yang berfungsi
- [ ] Dapat melakukan rollback jika diperlukan

### Latihan 4: Strategi Rollback (25 menit)
**Tujuan**: Mengimplementasikan dan menguji rollback penerapan menggunakan Git

```bash
# Terapkan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan hash commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Terapkan v2 dengan perubahan yang tidak kompatibel
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Mendeteksi kegagalan dan melakukan rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback menggunakan git
    git revert HEAD --no-edit
    
    # Rollback lingkungan
    azd env set APP_VERSION "1.0.0"
    
    # Terapkan ulang v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Keberhasilan:**
- [ ] Dapat mendeteksi kegagalan penerapan
- [ ] Skrip rollback dijalankan secara otomatis
- [ ] Aplikasi kembali ke kondisi bekerja
- [ ] Pemeriksaan kesehatan lulus setelah rollback

## 📊 Pelacakan Metrik Penerapan

### Lacak Kinerja Penerapan Anda

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

# Catat ke berkas
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gunakan itu
./track-deployment.sh
```

**Analisis metrik Anda:**
```bash
# Lihat riwayat penyebaran
cat deployment-metrics.csv

# Hitung rata-rata waktu penyebaran
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Daya Tambahan

- [Referensi Penyebaran Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Penyebaran Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Penyebaran Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Penyebaran Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Proyek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Pelajaran Berikutnya**: [Penyediaan Sumber Daya](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk menjaga ketepatan, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan penerjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->