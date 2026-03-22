# Panduan Penggunaan - Menguasai Penggunaan AZD Deployments

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penggunaan
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Seterusnya**: [Penyediaan Sumber](provisioning.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian AI Multi-Ejen](../../examples/retail-scenario.md)

## Pengenalan

Panduan komprehensif ini merangkumi segala yang anda perlu tahu tentang menggunakan Azure Developer CLI untuk menggunakan aplikasi, daripada penggunaan satu perintah asas hingga senario lanjutan produksi dengan kaitan tersuai, pelbagai persekitaran, dan integrasi CI/CD. Kuasai kitaran hayat penggunaan penuh dengan contoh praktikal dan amalan terbaik.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai semua arahan dan aliran kerja penggunaan Azure Developer CLI
- Memahami kitaran hayat penggunaan penuh daripada penyediaan hingga pemantauan
- Melaksanakan kaitan penggunaan tersuai untuk automasi sebelum dan selepas penggunaan
- Mengkonfigurasikan pelbagai persekitaran dengan parameter khusus persekitaran
- Menyediakan strategi penggunaan lanjutan termasuk penggunaan biru-hijau dan canary
- Mengintegrasi penggunaan azd dengan saluran CI/CD dan aliran kerja DevOps

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Melaksanakan dan menyelesaikan masalah semua aliran kerja penggunaan azd secara berdikari
- Mereka bentuk dan melaksanakan automasi penggunaan tersuai menggunakan kaitan
- Mengkonfigurasikan penggunaan bersedia produksi dengan keselamatan dan pemantauan yang betul
- Mengurus senario penggunaan berbilang persekitaran yang kompleks
- Mengoptimumkan prestasi penggunaan dan melaksanakan strategi rollback
- Mengintegrasi penggunaan azd ke dalam amalan DevOps perusahaan

## Gambaran Keseluruhan Penggunaan

Azure Developer CLI menyediakan beberapa arahan penggunaan:
- `azd up` - Aliran kerja lengkap (penyediaan + penggunaan)
- `azd provision` - Cipta/kemas kini sumber Azure sahaja
- `azd deploy` - Gunakan kod aplikasi sahaja
- `azd package` - Bina dan bungkus aplikasi

## Aliran Kerja Penggunaan Asas

### Penggunaan Lengkap (azd up)
Aliran kerja yang paling biasa untuk projek baru:
```bash
# Pasang semuanya dari awal
azd up

# Pasang dengan persekitaran spesifik
azd up --environment production

# Pasang dengan parameter tersuai
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Penggunaan Infrastruktur Sahaja
Apabila anda hanya perlu mengemas kini sumber Azure:
```bash
# Menyediakan/memasang infrastruktur
azd provision

# Menyediakan dengan dry-run untuk pratonton perubahan
azd provision --preview

# Menyediakan perkhidmatan tertentu
azd provision --service database
```

### Penggunaan Kod Sahaja
Untuk kemas kini aplikasi dengan pantas:
```bash
# Menggunakan semua perkhidmatan
azd deploy

# Output yang dijangkakan:
# Menggunakan perkhidmatan (azd deploy)
# - web: Menggunakan... Selesai
# - api: Menggunakan... Selesai
# BERJAYA: Penggunaan anda selesai dalam 2 minit 15 saat

# Menggunakan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Menggunakan dengan argumen binaan tersuai
azd deploy --service api --build-arg NODE_ENV=production

# Sahkan penggunaan
azd show --output json | jq '.services'
```

### ✅ Pengesahan Penggunaan

Selepas apa-apa penggunaan, sahkan kejayaan:

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
- ✅ Semua perkhidmatan menunjukkan status "Running"
- ✅ Titik kesihatan memulangkan HTTP 200
- ✅ Tiada log ralat dalam 5 minit terakhir
- ✅ Aplikasi memberi respons kepada permintaan ujian

## 🏗️ Memahami Proses Penggunaan

### Fasa 1: Kait Pra-Penyediaan
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
- Mencipta atau mengemas kini sumber Azure
- Mengkonfigurasi rangkaian dan keselamatan
- Menyediakan pemantauan dan log

### Fasa 3: Kait Pasca-Penyediaan
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
- Mencipta artifak penggunaan
- Membungkus untuk platform sasaran (kontena, fail ZIP, dan lain-lain)

### Fasa 5: Kait Pra-Penggunaan
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

### Fasa 6: Penggunaan Aplikasi
- Menggunakan aplikasi yang telah dibungkus ke perkhidmatan Azure
- Mengemas kini tetapan konfigurasi
- Memulakan/menyegarkan semula perkhidmatan

### Fasa 7: Kait Pasca-Penggunaan
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

## 🎛️ Konfigurasi Penggunaan

### Tetapan Penggunaan Khusus Perkhidmatan
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

## 🔧 Senario Penggunaan Lanjutan

### Aplikasi Berbilang Perkhidmatan
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

### Penggunaan Biru-Hijau
```bash
# Cipta persekitaran biru
azd env new production-blue
azd up --environment production-blue

# Uji persekitaran biru
./scripts/test-environment.sh production-blue

# Tukar trafik ke biru (kemas kini DNS/pengimbang beban manual)
./scripts/switch-traffic.sh production-blue

# Bersihkan persekitaran hijau
azd env select production-green
azd down --force
```

### Penggunaan Canary
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

### Penggunaan Bertahap
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

## 🐳 Penggunaan Kontena

### Penggunaan Aplikasi Kontena
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

### Penggunaan Khusus Perkhidmatan
```bash
# Sebarkan perkhidmatan tertentu untuk iterasi lebih cepat
azd deploy --service web
azd deploy --service api

# Sebarkan semua perkhidmatan
azd deploy
```

### Caching Pembinaan
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Penggunaan Kod Efisien
```bash
# Gunakan azd deploy (bukan azd up) untuk perubahan kod sahaja
# Ini melangkau penyediaan infrastruktur dan lebih pantas
azd deploy

# Deploy perkhidmatan tertentu untuk iterasi terpantas
azd deploy --service api
```

## 🔍 Pemantauan Penggunaan

### Pemantauan Penggunaan Masa Nyata
```bash
# Memantau aplikasi secara masa nyata
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

### Pengesahan Pasca-Penggunaan
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

### Rollback Cepat
```bash
# AZD tidak mempunyai rollback terbina dalam. Pendekatan yang disyorkan:

# Pilihan 1: Hantar semula dari Git (disyorkan)
git revert HEAD  # Kembalikan commit yang bermasalah
git push
azd deploy

# Pilihan 2: Hantar semula commit tertentu
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback Infrastruktur
```bash
# Pratonton perubahan infrastruktur sebelum diterapkan
azd provision --preview

# Untuk rollback infrastruktur, gunakan kawalan versi:
git revert HEAD  # Kembalikan perubahan infrastruktur
azd provision    # Terapkan keadaan infrastruktur sebelumnya
```

### Rollback Migrasi Pangkalan Data
```bash
#!/bin/bash
# skrip/rollback-pangkalan-data.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrix Penggunaan

### Jejak Prestasi Penggunaan
```bash
# Lihat status penyebaran semasa
azd show

# Pantau aplikasi dengan Application Insights
azd monitor --overview

# Lihat metrik secara langsung
azd monitor --live
```

### Pengumpulan Metrix Tersuai
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
# Pratonton perubahan infrastruktur sebelum penyebaran
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

### 4. Dokumentasi dan Log
```bash
# Mendokumentasikan prosedur penghantaran
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Seterusnya

- [Penyediaan Sumber](provisioning.md) - Pekanan mendalam pengurusan infrastruktur
- [Perancangan Pra-Penggunaan](../chapter-06-pre-deployment/capacity-planning.md) - Rancang strategi penggunaan anda
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md) - Selesaikan isu penggunaan
- [Amalan Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi penggunaan bersedia produksi

## 🎯 Latihan Praktikal Penggunaan

### Latihan 1: Aliran Kerja Penggunaan Inkremental (20 minit)
**Matlamat**: Kuasai beza antara penggunaan penuh dan inkremental

```bash
# Penggubahan awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekod masa penggubahan awal
echo "Full deployment: $(date)" > deployment-log.txt

# Buat perubahan kod
echo "// Updated $(date)" >> src/api/src/server.js

# Gubah kod sahaja (pantas)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Bandingkan masa
cat deployment-log.txt

# Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Penggunaan penuh mengambil masa 5-15 minit
- [ ] Penggunaan kod sahaja mengambil masa 2-5 minit
- [ ] Perubahan kod terpamer dalam aplikasi terpasang
- [ ] Infrastruktur tidak berubah selepas `azd deploy`

**Hasil Pembelajaran**: `azd deploy` 50-70% lebih pantas daripada `azd up` untuk perubahan kod

### Latihan 2: Kait Penggunaan Tersuai (30 minit)
**Matlamat**: Laksanakan automasi pra dan pasca penggunaan

```bash
# Buat skrip pengesahan pra-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Semak jika ujian lulus
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Semak perubahan yang belum dibuat komit
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Buat ujian asap selepas deploy
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

# Uji deployment dengan hooks
azd deploy
```

**Kriteria Kejayaan:**
- [ ] Skrip pra-penggunaan dijalankan sebelum penggunaan
- [ ] Penggunaan dibatalkan jika ujian gagal
- [ ] Ujian asap pasca-penggunaan sahkan kesihatan
- [ ] Kait dilaksanakan dalam urutan yang betul

### Latihan 3: Strategi Penggunaan Berbilang Persekitaran (45 minit)
**Matlamat**: Laksanakan aliran kerja penggunaan bertahap (dev → staging → produksi)

```bash
# Buat skrip pengedaran
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Langkah 1: Edar ke dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Langkah 2: Edar ke staging
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

# Jalankan pengedaran berperingkat
./deploy-staged.sh
```

**Kriteria Kejayaan:**
- [ ] Persekitaran dev berjaya digunakan
- [ ] Persekitaran staging berjaya digunakan
- [ ] Kelulusan manual diperlukan untuk produksi
- [ ] Semua persekitaran mempunyai pemeriksaan kesihatan yang berfungsi
- [ ] Boleh rollback jika perlu

### Latihan 4: Strategi Rollback (25 minit)
**Matlamat**: Laksanakan dan uji rollback penggunaan menggunakan Git

```bash
# Lancarkan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan hash komit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Lancarkan v2 dengan perubahan yang merosakkan
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Mengesan kegagalan dan putar balik
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Putar balik menggunakan git
    git revert HEAD --no-edit
    
    # Putar balik persekitaran
    azd env set APP_VERSION "1.0.0"
    
    # Lancarkan semula v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Kejayaan:**
- [ ] Boleh mengesan kegagalan penggunaan
- [ ] Skrip rollback dijalankan secara automatik
- [ ] Aplikasi kembali ke keadaan berfungsi
- [ ] Pemeriksaan kesihatan lulus selepas rollback

## 📊 Jejak Metrix Penggunaan

### Jejak Prestasi Penggunaan Anda

```bash
# Buat skrip metrik penerapan
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

**Analisa metrik anda:**
```bash
# Lihat sejarah penyebaran
cat deployment-metrics.csv

# Kira masa penyebaran purata
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Tambahan

- [Rujukan Penggunaan Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Penggunaan Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Penggunaan Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Penggunaan Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Pelajaran Seterusnya**: [Penyediaan Sumber](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau kekeliruan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat yang kritikal, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->