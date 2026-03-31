# Panduan Penyebaran - Menguasai Penyebaran AZD

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penyebaran
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Seterusnya**: [Penyediaan Sumber](provisioning.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian AI Pelbagai Ejen](../../examples/retail-scenario.md)

## Pengenalan

Panduan menyeluruh ini meliputi segala yang anda perlu tahu mengenai penyebaran aplikasi menggunakan Azure Developer CLI, dari penyebaran asas menggunakan satu arahan hingga senario produksi lanjutan dengan kaitan khusus, pelbagai persekitaran, dan integrasi CI/CD. Kuasai kitaran hayat penyebaran sepenuhnya dengan contoh praktikal dan amalan terbaik.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai semua arahan dan aliran kerja penyebaran Azure Developer CLI
- Memahami kitaran hayat penyebaran sepenuhnya dari penyediaan hingga pemantauan
- Melaksanakan kaitan penyebaran khusus untuk automasi sebelum dan selepas penyebaran
- Mengkonfigurasi pelbagai persekitaran dengan parameter khusus persekitaran
- Menyediakan strategi penyebaran lanjutan termasuk penyebaran biru-hijau dan canary
- Mengintegrasi penyebaran azd dengan saluran CI/CD dan aliran kerja DevOps

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Melaksanakan dan menyelesaikan masalah semua aliran kerja penyebaran azd secara berdikari
- Mereka bentuk dan melaksanakan automasi penyebaran khusus menggunakan kaitan
- Mengkonfigurasi penyebaran sedia produksi dengan keselamatan dan pemantauan yang betul
- Menguruskan senario penyebaran pelbagai persekitaran yang kompleks
- Mengoptimumkan prestasi penyebaran dan melaksanakan strategi rollback
- Mengintegrasi penyebaran azd ke dalam amalan DevOps perusahaan

## Gambaran Keseluruhan Penyebaran

Azure Developer CLI menyediakan beberapa arahan penyebaran:
- `azd up` - Aliran kerja lengkap (penyediaan + penyebaran)
- `azd provision` - Membuat/mengemas kini sumber Azure sahaja
- `azd deploy` - Menyebarkan kod aplikasi sahaja
- `azd package` - Membina dan mengepak aplikasi

## Aliran Kerja Penyebaran Asas

### Penyebaran Lengkap (azd up)
Aliran kerja paling biasa untuk projek baru:
```bash
# Sebarkan semuanya dari awal
azd up

# Sebarkan dengan persekitaran tertentu
azd up --environment production

# Sebarkan dengan parameter tersuai
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Penyebaran Infrastruktur Sahaja
Apabila anda hanya perlu mengemas kini sumber Azure:
```bash
# Menyediakan/mengemas kini infrastruktur
azd provision

# Menyediakan dengan dry-run untuk pratonton perubahan
azd provision --preview

# Menyediakan perkhidmatan tertentu
azd provision --service database
```

### Penyebaran Kod Sahaja
Untuk kemas kini aplikasi dengan cepat:
```bash
# Menggerakkan semua perkhidmatan
azd deploy

# Jangkaan output:
# Menggerakkan perkhidmatan (azd deploy)
# - web: Menggerakkan... Selesai
# - api: Menggerakkan... Selesai
# BERJAYA: Penggerakkan anda selesai dalam 2 minit 15 saat

# Menggerakkan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Menggerakkan dengan argumen binaan tersuai
azd deploy --service api --build-arg NODE_ENV=production

# Sahkan penggerakan
azd show --output json | jq '.services'
```

### ✅ Pengesahan Penyebaran

Selepas sebarang penyebaran, sahkan kejayaan:

```bash
# Semak semua perkhidmatan berjalan
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
- ✅ Semua perkhidmatan menunjukkan status "Berjalan"
- ✅ Titik pemeriksaan kesihatan mengembalikan HTTP 200
- ✅ Tiada log ralat dalam 5 minit terakhir
- ✅ Aplikasi bertindak balas terhadap permintaan ujian

## 🏗️ Memahami Proses Penyebaran

### Fasa 1: Kaitan Pra-Penyediaan
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

### Fasa 2: Penyediaan Infrastruktur
- Membaca templat infrastruktur (Bicep/Terraform)
- Membuat atau mengemas kini sumber Azure
- Mengkonfigurasi rangkaian dan keselamatan
- Menyediakan pemantauan dan perekodan

### Fasa 3: Kaitan Pasca-Penyediaan
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

### Fasa 4: Pengemasan Aplikasi
- Membina kod aplikasi
- Membuat artifak penyebaran
- Mengepak untuk platform sasaran (kontena, fail ZIP, dsb.)

### Fasa 5: Kaitan Pra-Penyebaran
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

### Fasa 6: Penyebaran Aplikasi
- Menyebarkan aplikasi yang telah dikepak ke perkhidmatan Azure
- Mengemas kini tetapan konfigurasi
- Memulakan/memulakan semula perkhidmatan

### Fasa 7: Kaitan Pasca-Penyebaran
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

## 🎛️ Konfigurasi Penyebaran

### Tetapan Penyebaran Khusus Perkhidmatan
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

### Konfigurasi Khusus Persekitaran
```bash
# Persekitaran pembangunan
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Persekitaran persediaan
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

## 🔧 Senario Penyebaran Lanjutan

### Aplikasi Pelbagai Perkhidmatan
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

### Penyebaran Biru-Hijau
```bash
# Cipta persekitaran biru
azd env new production-blue
azd up --environment production-blue

# Uji persekitaran biru
./scripts/test-environment.sh production-blue

# Tukar trafik ke biru (kemas kini DNS/pembahagi beban secara manual)
./scripts/switch-traffic.sh production-blue

# Bersihkan persekitaran hijau
azd env select production-green
azd down --force
```

### Penyebaran Canary
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

### Penyebaran Berperingkat
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

## 🐳 Penyebaran Kontena

### Penyebaran Aplikasi Kontena
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

### Pengoptimuman Dockerfile Berperingkat
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

## ⚡ Pengoptimuman Prestasi

### Penyebaran Khusus Perkhidmatan
```bash
# Lancarkan perkhidmatan tertentu untuk iterasi lebih pantas
azd deploy --service web
azd deploy --service api

# Lancarkan semua perkhidmatan
azd deploy
```

### Penyimpanan Cache Pembinaan
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Penyebaran Kod Berkesan
```bash
# Gunakan azd deploy (bukan azd up) untuk perubahan kod sahaja
# Ini melangkau penyediaan infrastruktur dan jauh lebih cepat
azd deploy

# Lancarkan perkhidmatan tertentu untuk iterasi terpantas
azd deploy --service api
```

## 🔍 Pemantauan Penyebaran

### Pemantauan Penyebaran Masa Nyata
```bash
# Pantau aplikasi secara masa nyata
azd monitor --live

# Lihat log aplikasi
azd monitor --logs

# Semak status penyebaran
azd show
```

### Pemeriksaan Kesihatan
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

### Pengesahan Pasca-Penyebaran
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Semak kesihatan aplikasi
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

## 🔐 Pertimbangan Keselamatan

### Pengurusan Rahsia
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

### Keselamatan Rangkaian
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Pengurusan Identiti dan Akses
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

### Rollback Pantas
```bash
# AZD tidak mempunyai rollback terbina dalam. Pendekatan yang disyorkan:

# Pilihan 1: Penghantaran semula dari Git (disyorkan)
git revert HEAD  # Pulihkan commit yang bermasalah
git push
azd deploy

# Pilihan 2: Penghantaran semula commit tertentu
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback Infrastruktur
```bash
# Pratonton perubahan infrastruktur sebelum menerapkan
azd provision --preview

# Untuk rollback infrastruktur, gunakan kawalan versi:
git revert HEAD  # Kembalikan perubahan infrastruktur
azd provision    # Terapkan keadaan infrastruktur sebelumnya
```

### Rollback Migrasi Pangkalan Data
```bash
#!/bin/bash
# skrip/rollback-pangkalandata.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrik Penyebaran

### Jejaki Prestasi Penyebaran
```bash
# Lihat status penyebaran semasa
azd show

# Pantau aplikasi dengan Application Insights
azd monitor --overview

# Lihat metrik masa nyata
azd monitor --live
```

### Pengumpulan Metrik Tersuai
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

## 🎯 Amalan Terbaik

### 1. Konsistensi Persekitaran
```bash
# Gunakan penamaan yang konsisten
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Kekalkan kesamaan persekitaran
./scripts/sync-environments.sh
```

### 2. Pengesahan Infrastruktur
```bash
# Pratonton perubahan infrastruktur sebelum pelaksanaan
azd provision --preview

# Gunakan linting ARM/Bicep
az bicep lint --file infra/main.bicep

# Sahkan sintaks Bicep
az bicep build --file infra/main.bicep
```

### 3. Integrasi Ujian
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

### 4. Dokumentasi dan Perekodan
```bash
# Dokumenkan prosedur pengedaran
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Seterusnya

- [Penyediaan Sumber](provisioning.md) - Pendalaman pengurusan infrastruktur
- [Perancangan Pra-Penyebaran](../chapter-06-pre-deployment/capacity-planning.md) - Rancang strategi penyebaran anda
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md) - Selesaikan isu penyebaran
- [Amalan Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi penyebaran sedia produksi

## 🎯 Latihan Penyebaran Praktikal

### Latihan 1: Aliran Kerja Penyebaran Inkremental (20 minit)
**Matlamat**: Kuasai perbezaan antara penyebaran penuh dan inkremental

```bash
# Pengeluaran awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekod masa pengeluaran awal
echo "Full deployment: $(date)" > deployment-log.txt

# Buat perubahan kod
echo "// Updated $(date)" >> src/api/src/server.js

# Hantar kod sahaja (cepat)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Bandingkan masa
cat deployment-log.txt

# Bersihkan kembali
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Penyebaran penuh mengambil masa 5-15 minit
- [ ] Penyebaran kod sahaja mengambil masa 2-5 minit
- [ ] Perubahan kod dipaparkan dalam aplikasi yang disebarkan
- [ ] Infrastruktur tidak berubah selepas `azd deploy`

**Hasil Pembelajaran**: `azd deploy` adalah 50-70% lebih pantas daripada `azd up` untuk perubahan kod

### Latihan 2: Kaitan Penyebaran Khusus (30 minit)
**Matlamat**: Melaksanakan automasi pra dan pasca penyebaran

```bash
# Buat skrip pengesahan sebelum pelaksanaan
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Semak jika ujian lulus
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Semak perubahan yang belum dikomit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Buat ujian asap selepas pelaksanaan
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

# Uji pelaksanaan dengan hooks
azd deploy
```

**Kriteria Kejayaan:**
- [ ] Skrip pra-penyebaran berjalan sebelum penyebaran
- [ ] Penyebaran dibatalkan jika ujian gagal
- [ ] Ujian ringkas pasca penyebaran mengesahkan kesihatan
- [ ] Kaitan dijalankan dalam urutan yang betul

### Latihan 3: Strategi Penyebaran Pelbagai Persekitaran (45 minit)
**Matlamat**: Melaksanakan aliran kerja penyebaran berperingkat (dev → staging → produksi)

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

# Langkah 3: Kelulusan manual untuk produksi
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
- [ ] Kelulusan manual diperlukan untuk produksi
- [ ] Semua persekitaran mempunyai pemeriksaan kesihatan yang berfungsi
- [ ] Boleh melakukan rollback jika perlu

### Latihan 4: Strategi Rollback (25 minit)
**Matlamat**: Melaksanakan dan menguji rollback penyebaran menggunakan Git

```bash
# Menggunakan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan hash commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Menggunakan v2 dengan perubahan besar
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Mengesan kegagalan dan pulihkan
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Pulihkan menggunakan git
    git revert HEAD --no-edit
    
    # Pulihkan persekitaran
    azd env set APP_VERSION "1.0.0"
    
    # Menggunakan semula v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Kejayaan:**
- [ ] Boleh mengesan kegagalan penyebaran
- [ ] Skrip rollback dijalankan secara automatik
- [ ] Aplikasi kembali ke keadaan berfungsi
- [ ] Pemeriksaan kesihatan lulus selepas rollback

## 📊 Jejak Metrik Penyebaran

### Jejaki Prestasi Penyebaran Anda

```bash
# Buat skrip metrik penempatan
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

# Log ke fail
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gunakannya
./track-deployment.sh
```

**Analisis metrik anda:**
```bash
# Lihat sejarah penyebaran
cat deployment-metrics.csv

# Kira purata masa penyebaran
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Tambahan

- [Rujukan Penyebaran Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Penyebaran Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Penyebaran Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Penyebaran Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Pelajaran Seterusnya**: [Penyediaan Sumber](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->