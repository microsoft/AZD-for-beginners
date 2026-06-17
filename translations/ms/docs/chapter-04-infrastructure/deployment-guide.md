# Panduan Penggunaan - Menguasai Penempatan AZD

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penempatan
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Seterusnya**: [Penyediaan Sumber](provisioning.md)
- **🧩 Juga dalam bab ini**: [Mencipta Templat Sendiri](custom-templates.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian AI Pelbagai Ejen](../../examples/retail-scenario.md)

## Pengenalan

Panduan komprehensif ini merangkumi segala yang anda perlu tahu tentang melaksanakan aplikasi menggunakan Azure Developer CLI, dari penempatan asas dengan satu arahan hingga senario lanjutan pengeluaran dengan kaitan tersuai, pelbagai persekitaran, dan integrasi CI/CD. Kuasai keseluruhan kitar hayat penempatan dengan contoh praktikal dan amalan terbaik.

## Matlamat Pembelajaran

Dengan menamatkan panduan ini, anda akan:
- Menguasai semua arahan dan aliran kerja penempatan Azure Developer CLI
- Memahami keseluruhan kitar hayat penempatan dari penyediaan hingga pemantauan
- Melaksanakan kaitan penempatan tersuai untuk automasi pra dan pasca penempatan
- Mengkonfigurasi pelbagai persekitaran dengan parameter khusus persekitaran
- Menyediakan strategi penempatan lanjutan termasuk penempatan biru-hijau dan canary
- Mengintegrasi penempatan azd dengan saluran CI/CD dan aliran kerja DevOps

## Hasil Pembelajaran

Selepas menamatkan, anda akan mampu untuk:
- Melaksanakan dan menyelesaikan masalah semua aliran kerja penempatan azd secara berdikari
- Mereka bentuk dan melaksanakan automasi penempatan tersuai menggunakan kaitan
- Mengkonfigurasi penempatan sedia pengeluaran dengan keselamatan dan pemantauan yang betul
- Mengurus senario penempatan pelbagai persekitaran yang kompleks
- Mengoptimumkan prestasi penempatan dan melaksanakan strategi rollback
- Mengintegrasi penempatan azd ke dalam amalan DevOps perusahaan

## Gambaran Keseluruhan Penempatan

Azure Developer CLI menyediakan beberapa arahan penempatan:
- `azd up` - Aliran kerja lengkap (penyediaan + penempatan)
- `azd provision` - Cipta/kemas kini sumber Azure sahaja
- `azd deploy` - Letakkan kod aplikasi sahaja
- `azd package` - Bina dan pek aplikasi

## Aliran Kerja Penempatan Asas

### Penempatan Lengkap (azd up)
Aliran kerja paling biasa untuk projek baru:
```bash
# Menggoda semuanya dari awal
azd up

# Menggoda dengan persekitaran tertentu
azd up --environment production

# Menggoda dengan parameter tersuai
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Penempatan Infrastruktur Sahaja
Apabila anda hanya perlu mengemas kini sumber Azure:
```bash
# Membekal/kemas kini infrastruktur
azd provision

# Membekal dengan dry-run untuk pratonton perubahan
azd provision --preview

# Membekal perkhidmatan tertentu
azd provision --service database
```

### Penempatan Kod Sahaja
Untuk kemas kini aplikasi yang cepat:
```bash
# Hantar semua perkhidmatan
azd deploy

# Jangkaan output:
# Menghantar perkhidmatan (azd hantar)
# - web: Menghantar... Selesai
# - api: Menghantar... Selesai
# BERJAYA: Penghantaran anda selesai dalam 2 minit 15 saat

# Hantar perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Hantar dengan argumen binaan tersuai
azd deploy --service api --build-arg NODE_ENV=production

# Sahkan penghantaran
azd show --output json | jq '.services'
```

### ✅ Pengesahan Penempatan

Selepas sebarang penempatan, sahkan kejayaan:

```bash
# Semak semua perkhidmatan sedang berjalan
azd show

# Uji hujung kesihatan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Pantau untuk ralat (dibuka dalam pelayar secara lalai)
azd monitor --logs
```

**Kriteria Kejayaan:**
- ✅ Semua perkhidmatan menunjukkan status "Berlaku"
- ✅ Titik akhir kesihatan mengembalikan HTTP 200
- ✅ Tiada log ralat dalam 5 minit terakhir
- ✅ Aplikasi bertindak balas kepada permintaan ujian

## 🏗️ Memahami Proses Penempatan

### Baru dengan kaitan? Mulakan di sini

**Kaitan** adalah arahan yang dijalankan azd secara automatik pada saat tertentu dalam proses penempatan—sebelum atau selepas penyediaan, dan sebelum atau selepas meletakkan kod anda. Ia membolehkan anda mengautomasikan kerja kecil yang sentiasa mengiringi penempatan: menanam pangkalan data, menjalankan migrasi, membina aset, atau melakukan ujian asap aplikasi secara langsung.

| Kaitan | Dijalan… | Kegunaan biasa |
|--------|---------|----------------|
| `preprovision` | Sebelum sumber dicipta | Sahkan keperluan awal, log masuk ke registri |
| `postprovision` | Selepas sumber tersedia | Konfigurasikan sumber, sediakan pangkalan data |
| `predeploy` | Sebelum kod diletakkan | Bina aset hadapan, jalankan ujian unit |
| `postdeploy` | Selepas kod digunakan | Jalankan migrasi DB, ujian asap titik akhir |

Kaitan ditempatkan dalam `azure.yaml` anda. Berikut contoh paling kecil—hanya mencetak mesej selepas penempatan:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Itu sahaja—lain kali anda jalankan `azd up`, mesej itu akan dicetak secara automatik. Anda juga boleh menjalankan kaitan secara sendiri, tanpa penempatan penuh, yang bagus untuk ujian:

```bash
azd hooks run postdeploy
```

Fasa-fasa di bawah menunjukkan kaitan dunia sebenar (migrasi, ujian, pengesahan) untuk setiap tahap.

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
- Mencipta atau mengemas kini sumber Azure
- Mengkonfigurasi rangkaian dan keselamatan
- Menyediakan pemantauan dan logging

### Fasa 3: Kaitan Pasca Penyediaan
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
- Mencipta artifak penempatan
- Membungkus untuk platform sasaran (bekas, fail ZIP, dsb.)

### Fasa 5: Kaitan Pra-Penempatan
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

### Fasa 6: Penempatan Aplikasi
- Meletakkan aplikasi yang dibungkus ke perkhidmatan Azure
- Mengemas kini tetapan konfigurasi
- Memulakan/menyemak semula perkhidmatan

### Fasa 7: Kaitan Pasca Penempatan
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

### Mengendalikan Ralat Kaitan

Secara lalai, **jika arahan kaitan keluar dengan kod bukan sifar, azd menghentikan keseluruhan operasi.** Ini biasanya yang anda mahu—migrasi yang gagal harus menghentikan penempatan, bukan menghantar aplikasi rosak. Tetapi ini bermakna kaitan perlu ditulis dengan berhati-hati.

**1. Jadikan kegagalan jelas dan disengajakan.** Kaitan gagal apabila arahan terakhirnya mengembalikan kod keluar bukan sifar. Dalam skrip shell, tambah `set -e` supaya kaitan berhenti pada arahan yang gagal pertama dan tidak terus secara senyap:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Benarkan kaitan gagal tanpa menghentikan azd.** Untuk langkah tak kritikal (pemanasan cache pilihan, notifikasi usaha terbaik), tetapkan `continueOnError: true`. azd merekod kegagalan tetapi teruskan operasi:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Uji kaitan secara berasingan sebelum menjalankan penuh.** Anda tidak perlu menjalankan `azd up` untuk membaiki kaitan—jalankan secara sendiri dan ulang cepat:

```bash
azd hooks run predeploy          # menjalankan hanya kait pra-penerapan
azd hooks run postdeploy --service api
```

**4. Berhati dengan cangkuk shell spesifik OS.** Kaitan menggunakan `shell: pwsh` perlukan PowerShell dipasang pada mesin yang menjalankan (termasuk ejen CI). Gunakan `shell: sh` untuk portabiliti paling luas, atau sediakan kedua varian `windows` dan `posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Petua penyahpepijatan:** jalankan mana-mana arahan azd dengan `--debug` untuk melihat baris arahan kaitan tepat dan output penuh—amat berguna apabila kaitan berfungsi secara lokal tetapi gagal dalam CI.

## 🎛️ Konfigurasi Penempatan

### Tetapan Penempatan Khusus Perkhidmatan
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

# Persekitaran pentas
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

## 🔧 Senario Penempatan Lanjutan

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

### Penempatan Biru-Hijau
```bash
# Cipta persekitaran biru
azd env new production-blue
azd up --environment production-blue

# Uji persekitaran biru
./scripts/test-environment.sh production-blue

# Tukar trafik ke biru (kemaskini DNS/pengimbangan beban secara manual)
./scripts/switch-traffic.sh production-blue

# Bersihkan persekitaran hijau
azd env select production-green
azd down --force
```

### Penempatan Canary
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

### Penempatan Berperingkat
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

## 🐳 Penempatan Bekas

### Penempatan Aplikasi Bekas
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

### Penempatan Khusus Perkhidmatan
```bash
# Lancarkan perkhidmatan tertentu untuk iterasi lebih pantas
azd deploy --service web
azd deploy --service api

# Lancarkan semua perkhidmatan
azd deploy
```

### Caching Pembangunan
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Penempatan Kod Efisien
```bash
# Gunakan azd deploy (bukan azd up) untuk perubahan hanya kod
# Ini melangkau penyediaan infrastruktur dan adalah lebih pantas
azd deploy

# Lancarkan perkhidmatan tertentu untuk iterasi terpantas
azd deploy --service api
```

## 🔍 Pemantauan Penempatan

### Pemantauan Penempatan Masa Nyata
```bash
# Pantau aplikasi secara masa nyata
azd monitor --live

# Lihat log aplikasi
azd monitor --logs

# Semak status penempatan
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

### Pengesahan Pasca Penempatan
```bash
#!/bin/bash
# skrip/validate-deployment.sh

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

# Pilihan 1: Melakukan deploy semula dari Git (disyorkan)
git revert HEAD  # Kembalikan commit yang bermasalah
git push
azd deploy

# Pilihan 2: Melakukan deploy semula commit khusus
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback Infrastruktur
```bash
# Pratonton perubahan infrastruktur sebelum menerapkan
azd provision --preview

# Untuk rollback infrastruktur, gunakan kawalan versi:
git revert HEAD  # Batalkan perubahan infrastruktur
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

## 📊 Metik Penempatan

### Jejak Prestasi Penempatan
```bash
# Lihat status penghantaran semasa
azd show

# Pantau aplikasi dengan Application Insights
azd monitor --overview

# Lihat metrik langsung
azd monitor --live
```

### Pengumpulan Metik Tersuai
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

### 4. Dokumentasi dan Logging
```bash
# Dokumenkan prosedur penyebaran
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Seterusnya

- [Penyediaan Sumber](provisioning.md) - Pembelajaran mendalam pengurusan infrastruktur
- [Perancangan Pra-Penempatan](../chapter-06-pre-deployment/capacity-planning.md) - Rancang strategi penempatan anda
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md) - Selesaikan isu penempatan
- [Amalan Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi penempatan sesuai pengeluaran

## 🎯 Latihan Penempatan Praktikal

### Latihan 1: Aliran Kerja Penempatan Inkremental (20 minit)
**Matlamat**: Menguasai beza antara penempatan penuh dan penempatan inkremental

```bash
# Penempatan awal
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rakam masa penempatan awal
echo "Full deployment: $(date)" > deployment-log.txt

# Buat perubahan kod
echo "// Updated $(date)" >> src/api/src/server.js

# Hantar hanya kod (cepat)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Bandingkan masa
cat deployment-log.txt

# Bersihkan diri
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Penempatan penuh mengambil masa 5-15 minit
- [ ] Penempatan kod sahaja mengambil 2-5 minit
- [ ] Perubahan kod tercermin dalam aplikasi yang diletakkan
- [ ] Infrastruktur tidak berubah selepas `azd deploy`

**Hasil Pembelajaran**: `azd deploy` 50-70% lebih pantas daripada `azd up` untuk perubahan kod

### Latihan 2: Kait Penempatan Tersuai (30 minit)
**Matlamat**: Melaksanakan automasi pra dan pasca penempatan

```bash
# Buat skrip pengesahan sebelum penyebaran
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Semak jika ujian lulus
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Semak perubahan yang belum disahkan
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Buat ujian asap selepas penyebaran
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

# Tambah hook ke azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Uji penyebaran dengan hook
azd deploy
```

**Kriteria Kejayaan:**
- [ ] Skrip pra-penempatan dijalankan sebelum penempatan
- [ ] Penempatan dibatalkan jika ujian gagal
- [ ] Ujian asap pasca penempatan mengesahkan kesihatan
- [ ] Kaitan dijalankan dalam urutan betul

### Latihan 3: Strategi Penempatan Berbilang Persekitaran (45 minit)
**Matlamat**: Melaksanakan aliran kerja penempatan berperingkat (dev → staging → pengeluaran)

```bash
# Buat skrip penghantaran
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Langkah 1: Hantar ke dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Langkah 2: Hantar ke staging
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

# Jalankan penghantaran berperingkat
./deploy-staged.sh
```

**Kriteria Kejayaan:**
- [ ] Persekitaran dev berjaya diletakkan
- [ ] Persekitaran staging berjaya diletakkan
- [ ] Kelulusan manual diperlukan untuk pengeluaran
- [ ] Semua persekitaran mempunyai pemeriksaan kesihatan berfungsi
- [ ] Boleh melakukan rollback jika perlu

### Latihan 4: Strategi Rollback (25 minit)
**Matlamat**: Melaksanakan dan menguji rollback penempatan menggunakan Git

```bash
# Lancarkan v1
azd env set APP_VERSION "1.0.0"
azd up

# Simpan hash komit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Lancarkan v2 dengan perubahan kritikal
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Sahkan kegagalan dan buat rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback menggunakan git
    git revert HEAD --no-edit
    
    # Rollback persekitaran
    azd env set APP_VERSION "1.0.0"
    
    # Lancarkan semula v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Kriteria Kejayaan:**
- [ ] Boleh mengesan kegagalan penempatan
- [ ] Skrip rollback dijalankan secara automatik
- [ ] Aplikasi kembali ke keadaan berfungsi
- [ ] Pemeriksaan kesihatan lulus selepas rollback

## 📊 Jejak Metik Penempatan

### Jejak Prestasi Penempatan Anda

```bash
# Cipta skrip metrik penyebaran
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

**Analisa metrik anda:**
```bash
# Lihat sejarah penghantaran
cat deployment-metrics.csv

# Kira masa penghantaran purata
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Tambahan

- [Rujukan Penempatan Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Penempatan Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Penempatan Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Penempatan Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Pelajaran Seterusnya**: [Penyediaan Sumber](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->