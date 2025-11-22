<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-22T09:37:23+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ms"
}
-->
# Panduan Penggunaan - Menguasai Penerapan AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penerapan
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)
- **➡️ Seterusnya**: [Penyediaan Sumber](provisioning.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian AI Multi-Ejen](../../examples/retail-scenario.md)

## Pengenalan

Panduan komprehensif ini merangkumi segala yang anda perlu tahu tentang menerapkan aplikasi menggunakan Azure Developer CLI, daripada penerapan asas dengan satu arahan kepada senario pengeluaran lanjutan dengan hook tersuai, pelbagai persekitaran, dan integrasi CI/CD. Kuasai keseluruhan kitaran hayat penerapan dengan contoh praktikal dan amalan terbaik.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Menguasai semua arahan dan aliran kerja penerapan Azure Developer CLI
- Memahami keseluruhan kitaran hayat penerapan daripada penyediaan kepada pemantauan
- Melaksanakan hook penerapan tersuai untuk automasi sebelum dan selepas penerapan
- Mengkonfigurasi pelbagai persekitaran dengan parameter khusus persekitaran
- Menyediakan strategi penerapan lanjutan termasuk penerapan biru-hijau dan canary
- Mengintegrasikan penerapan azd dengan pipeline CI/CD dan aliran kerja DevOps

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Melaksanakan dan menyelesaikan masalah semua aliran kerja penerapan azd secara bebas
- Merancang dan melaksanakan automasi penerapan tersuai menggunakan hook
- Mengkonfigurasi penerapan bersedia untuk pengeluaran dengan keselamatan dan pemantauan yang betul
- Menguruskan senario penerapan pelbagai persekitaran yang kompleks
- Mengoptimumkan prestasi penerapan dan melaksanakan strategi rollback
- Mengintegrasikan penerapan azd ke dalam amalan DevOps perusahaan

## Gambaran Keseluruhan Penerapan

Azure Developer CLI menyediakan beberapa arahan penerapan:
- `azd up` - Aliran kerja lengkap (penyediaan + penerapan)
- `azd provision` - Membuat/mengemas kini sumber Azure sahaja
- `azd deploy` - Menerapkan kod aplikasi sahaja
- `azd package` - Membina dan membungkus aplikasi

## Aliran Kerja Penerapan Asas

### Penerapan Lengkap (azd up)
Aliran kerja paling biasa untuk projek baru:
```bash
# Laksanakan semuanya dari awal
azd up

# Laksanakan dengan persekitaran tertentu
azd up --environment production

# Laksanakan dengan parameter tersuai
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Penerapan Infrastruktur Sahaja
Apabila anda hanya perlu mengemas kini sumber Azure:
```bash
# Sediakan/kemas kini infrastruktur
azd provision

# Sediakan dengan dry-run untuk pratonton perubahan
azd provision --preview

# Sediakan perkhidmatan tertentu
azd provision --service database
```

### Penerapan Kod Sahaja
Untuk kemas kini aplikasi yang cepat:
```bash
# Laksanakan semua perkhidmatan
azd deploy

# Output yang dijangka:
# Melaksanakan perkhidmatan (azd deploy)
# - web: Melaksanakan... Selesai
# - api: Melaksanakan... Selesai
# BERJAYA: Pelaksanaan anda selesai dalam 2 minit 15 saat

# Laksanakan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Laksanakan dengan argumen binaan tersuai
azd deploy --service api --build-arg NODE_ENV=production

# Sahkan pelaksanaan
azd show --output json | jq '.services'
```

### ✅ Pengesahan Penerapan

Selepas sebarang penerapan, sahkan kejayaan:

```bash
# Periksa semua perkhidmatan sedang berjalan
azd show

# Uji titik akhir kesihatan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Periksa log untuk kesilapan
azd logs --service api --since 5m | grep -i error
```

**Kriteria Kejayaan:**
- ✅ Semua perkhidmatan menunjukkan status "Running"
- ✅ Endpoint kesihatan mengembalikan HTTP 200
- ✅ Tiada log ralat dalam 5 minit terakhir
- ✅ Aplikasi memberi respons kepada permintaan ujian

## 🏗️ Memahami Proses Penerapan

### Fasa 1: Hook Pra-Penyediaan
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
- Menyediakan pemantauan dan log

### Fasa 3: Hook Pasca-Penyediaan
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

### Fasa 4: Pembungkusan Aplikasi
- Membina kod aplikasi
- Membuat artifak penerapan
- Membungkus untuk platform sasaran (kontena, fail ZIP, dll.)

### Fasa 5: Hook Pra-Penerapan
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

### Fasa 6: Penerapan Aplikasi
- Menerapkan aplikasi yang dibungkus ke perkhidmatan Azure
- Mengemas kini tetapan konfigurasi
- Memulakan/memulakan semula perkhidmatan

### Fasa 7: Hook Pasca-Penerapan
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

### Tetapan Penerapan Khusus Perkhidmatan
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

## 🔧 Senario Penerapan Lanjutan

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

### Penerapan Biru-Hijau
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

### Penerapan Berperingkat
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

## 🐳 Penerapan Kontena

### Penerapan Aplikasi Kontena
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

### Pengoptimuman Dockerfile Pelbagai Peringkat
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

### Penerapan Selari
```bash
# Konfigurasikan penyebaran selari
azd config set deploy.parallelism 5

# Sebarkan perkhidmatan secara selari
azd deploy --parallel
```

### Cache Pembinaan
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

### Penerapan Inkremental
```bash
# Sebarkan hanya perkhidmatan yang berubah
azd deploy --incremental

# Sebarkan dengan pengesanan perubahan
azd deploy --detect-changes
```

## 🔍 Pemantauan Penerapan

### Pemantauan Penerapan Masa Nyata
```bash
# Pantau kemajuan penyebaran
azd deploy --follow

# Lihat log penyebaran
azd logs --follow --service api

# Periksa status penyebaran
azd show --service api
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

### Pengesahan Pasca-Penerapan
```bash
#!/bin/bash
# skrip/semak-sah-deployment.sh

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

### Rollback Cepat
```bash
# Kembali ke pengeluaran sebelumnya
azd deploy --rollback

# Kembali perkhidmatan tertentu
azd deploy --service api --rollback

# Kembali ke versi tertentu
azd deploy --service api --version v1.2.3
```

### Rollback Infrastruktur
```bash
# Kembalikan perubahan infrastruktur
azd provision --rollback

# Pratonton perubahan pengembalian
azd provision --rollback --preview
```

### Rollback Migrasi Pangkalan Data
```bash
#!/bin/bash
# skrip/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrik Penerapan

### Jejak Prestasi Penerapan
```bash
# Aktifkan metrik pengedaran
azd config set telemetry.deployment.enabled true

# Lihat sejarah pengedaran
azd history

# Dapatkan statistik pengedaran
azd metrics --type deployment
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

# Kekalkan keseragaman persekitaran
./scripts/sync-environments.sh
```

### 2. Pengesahan Infrastruktur
```bash
# Sahkan sebelum penyebaran
azd provision --preview
azd provision --what-if

# Gunakan lintasan ARM/Bicep
az bicep lint --file infra/main.bicep
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

### 4. Dokumentasi dan Log
```bash
# Dokumentasikan prosedur pengedaran
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Seterusnya

- [Penyediaan Sumber](provisioning.md) - Penjelasan mendalam tentang pengurusan infrastruktur
- [Perancangan Pra-Penerapan](../pre-deployment/capacity-planning.md) - Rancang strategi penerapan anda
- [Isu Biasa](../troubleshooting/common-issues.md) - Selesaikan masalah penerapan
- [Amalan Terbaik](../troubleshooting/debugging.md) - Strategi penerapan bersedia untuk pengeluaran

## 🎯 Latihan Penerapan Praktikal

### Latihan 1: Aliran Kerja Penerapan Inkremental (20 minit)
**Matlamat**: Kuasai perbezaan antara penerapan penuh dan inkremental

```bash
# Pelancaran awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Catat masa pelancaran awal
echo "Full deployment: $(date)" > deployment-log.txt

# Buat perubahan kod
echo "// Updated $(date)" >> src/api/src/server.js

# Lancarkan hanya kod (cepat)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Bandingkan masa
cat deployment-log.txt

# Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Penerapan penuh mengambil masa 5-15 minit
- [ ] Penerapan kod sahaja mengambil masa 2-5 minit
- [ ] Perubahan kod tercermin dalam aplikasi yang diterapkan
- [ ] Infrastruktur tidak berubah selepas `azd deploy`

**Hasil Pembelajaran**: `azd deploy` adalah 50-70% lebih pantas daripada `azd up` untuk perubahan kod

### Latihan 2: Hook Penerapan Tersuai (30 minit)
**Matlamat**: Melaksanakan automasi sebelum dan selepas penerapan

```bash
# Cipta skrip pengesahan pra-pelaksanaan
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Periksa jika ujian lulus
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

# Cipta ujian asap pasca-pelaksanaan
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

# Tambah cangkuk ke azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Uji pelaksanaan dengan cangkuk
azd deploy
```

**Kriteria Kejayaan:**
- [ ] Skrip pra-penerapan berjalan sebelum penerapan
- [ ] Penerapan dibatalkan jika ujian gagal
- [ ] Ujian smoke pasca-penerapan mengesahkan kesihatan
- [ ] Hook dilaksanakan dalam urutan yang betul

### Latihan 3: Strategi Penerapan Pelbagai Persekitaran (45 minit)
**Matlamat**: Melaksanakan aliran kerja penerapan berperingkat (dev → staging → production)

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
- [ ] Persekitaran dev diterapkan dengan berjaya
- [ ] Persekitaran staging diterapkan dengan berjaya
- [ ] Kelulusan manual diperlukan untuk pengeluaran
- [ ] Semua persekitaran mempunyai pemeriksaan kesihatan yang berfungsi
- [ ] Boleh rollback jika diperlukan

### Latihan 4: Strategi Rollback (25 minit)
**Matlamat**: Melaksanakan dan menguji rollback penerapan

```bash
# Laksanakan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan konfigurasi v1
cp -r .azure/production .azure/production-v1-backup

# Laksanakan v2 dengan perubahan besar
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Kesan kegagalan
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Kembalikan kod
    git checkout src/api/src/server.js
    
    # Kembalikan persekitaran
    azd env set APP_VERSION "1.0.0"
    
    # Laksanakan semula v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Kejayaan:**
- [ ] Boleh mengesan kegagalan penerapan
- [ ] Skrip rollback dilaksanakan secara automatik
- [ ] Aplikasi kembali ke keadaan berfungsi
- [ ] Pemeriksaan kesihatan lulus selepas rollback

## 📊 Penjejakan Metrik Penerapan

### Jejak Prestasi Penerapan Anda

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

- [Rujukan Penerapan Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Penerapan Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Penerapan Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Penerapan Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Projek Pertama Anda](../getting-started/first-project.md)
- **Pelajaran Seterusnya**: [Penyediaan Sumber](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->