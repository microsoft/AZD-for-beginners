# Panduan Deployment - Menguasai Deployments AZD

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 4 - Infrastruktur sebagai Kode & Deployment
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Selanjutnya**: [Provisioning Resources](provisioning.md)
- **🧩 Juga di bab ini**: [Membuat Template Anda Sendiri](custom-templates.md)
- **🚀 Bab Berikutnya**: [Bab 5: Solusi AI Multi-Agen](../../examples/retail-scenario.md)

## Pendahuluan

> Ditinjau terhadap `azd 1.37.2` (November 2026). Perintah menggunakan Bash; contoh JSON memerlukan `jq`. Kecuali latihan todo yang secara eksplisit diinisialisasi, contoh lanjutan adalah **fragmen integrasi**: sediakan sumber, infrastruktur, pengujian, dan skrip Anda sendiri. Tidak ada deployment Azure yang dijalankan dalam tinjauan ini.

Panduan komprehensif ini mencakup segala hal yang perlu Anda ketahui tentang melakukan deployment aplikasi menggunakan Azure Developer CLI, dari deployment dasar dengan satu perintah hingga skenario produksi lanjutan dengan hook kustom, beberapa lingkungan, dan integrasi CI/CD. Kuasai siklus hidup deployment lengkap dengan contoh praktis dan praktik terbaik.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai semua perintah dan alur kerja deployment Azure Developer CLI
- Memahami siklus hidup deployment lengkap dari provisioning hingga monitoring
- Menerapkan hook deployment kustom untuk otomasi pra dan pasca deployment
- Mengonfigurasi beberapa lingkungan dengan parameter spesifik lingkungan
- Mengatur strategi deployment lanjutan termasuk blue-green dan canary deployments
- Mengintegrasikan deployment azd dengan pipeline CI/CD dan alur kerja DevOps

## Hasil Pembelajaran

Setelah selesai, Anda akan mampu:
- Menjalankan dan memecahkan masalah semua alur kerja deployment azd secara mandiri
- Merancang dan mengimplementasikan otomasi deployment kustom menggunakan hook
- Mengonfigurasi deployment siap produksi dengan keamanan dan monitoring yang tepat
- Mengelola skenario deployment kompleks multi-lingkungan
- Mengoptimalkan performa deployment dan menerapkan strategi rollback
- Mengintegrasikan deployment azd ke dalam praktik DevOps perusahaan

## Gambaran Deployment

Azure Developer CLI menyediakan beberapa perintah deployment:
- `azd up` - Alur kerja lengkap (provision + deploy)
- `azd provision` - Membuat/memperbarui sumber daya Azure saja
- `azd deploy` - Mendeploy kode aplikasi saja
- `azd package` - Membangun dan mengemas aplikasi

## Alur Kerja Deployment Dasar

### Deployment Lengkap (azd up)
Alur kerja paling umum untuk proyek baru:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Deployment Hanya Infrastruktur
Ketika Anda hanya perlu memperbarui sumber daya Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Deployment Hanya Kode
Untuk pembaruan aplikasi cepat:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Verifikasi Deployment

Setelah deployment, verifikasi keberhasilan:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Kriteria Keberhasilan:**
- ✅ `azd show` mengarahkan ke target/service/URL yang diharapkan
- ✅ Permintaan ke rute aplikasi sebenarnya mengembalikan status dan isi yang diharapkan
- ✅ Tidak ada log error dalam 5 menit terakhir
- ✅ Aplikasi merespons permintaan uji

## 🏗️ Memahami Proses Deployment

### Baru mengenal hook? Mulai di sini

Sebuah **hook** adalah perintah yang dijalankan azd secara otomatis pada momen tertentu dalam proses deploy—sebelum atau sesudah provisioning, dan sebelum atau sesudah mendeploy kode Anda. Mereka memungkinkan Anda mengotomasi tugas-tugas kecil yang selalu ada di sekitar deployment: membuat basis data, menjalankan migrasi, membangun aset, atau melakukan smoke-test aplikasi yang hidup.

| Hook | Dijalankan… | Penggunaan umum |
|------|------------|---------------|
| `preprovision` | Sebelum sumber daya dibuat | Memvalidasi prasyarat, login ke registry |
| `postprovision` | Setelah sumber daya ada | Mengonfigurasi sumber daya, menyiapkan database |
| `predeploy` | Sebelum kode dideploy | Membangun aset front-end, menjalankan unit test |
| `postdeploy` | Setelah kode aktif | Menjalankan migrasi DB, smoke-test endpoint |

Hooks berada dalam `azure.yaml` Anda. Berikut contoh terkecil—hanya mencetak pesan setelah deployment:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Itu saja—lain kali Anda jalankan `azd up`, pesan akan dicetak secara otomatis. Anda juga bisa jalankan hook secara sendiri, tanpa deployment penuh, yang bagus untuk pengujian:

```bash
azd hooks run postdeploy
```

Tahapan di bawah ini menunjukkan hook dunia nyata (migrasi, pengujian, validasi) untuk setiap tahap.

### Tahap 1: Hook Pra-Provision
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

### Tahap 2: Provisioning Infrastruktur
- Membaca template infrastruktur (Bicep/Terraform)
- Membuat atau memperbarui sumber daya Azure
- Mengonfigurasi jaringan dan keamanan
- Menyiapkan monitoring dan logging

### Tahap 3: Hook Pasca-Provision
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

### Tahap 4: Pengemasan Aplikasi
- Membangun kode aplikasi
- Membuat artefak deployment
- Mengemas untuk platform target (container, file ZIP, dll.)

### Tahap 5: Hook Pra-Deploy
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

### Tahap 6: Deployment Aplikasi
- Mendeploy aplikasi yang sudah dikemas ke layanan Azure
- Memperbarui pengaturan konfigurasi
- Menyalakan/mulai ulang layanan

### Tahap 7: Hook Pasca-Deploy
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Menangani Kesalahan Hook

Secara default, **jika perintah hook keluar dengan kode selain nol, azd menghentikan seluruh operasi.** Ini biasanya yang Anda inginkan—migrasi gagal harus menghentikan deployment, bukan mengirimkan aplikasi rusak. Tapi itu berarti hook harus ditulis dengan hati-hati.

**1. Buat kegagalan terdengar jelas dan disengaja.** Hook gagal saat perintah terakhir mengembalikan kode keluar bukan nol. Dalam skrip shell, tambahkan `set -e` agar hook berhenti pada perintah gagal pertama daripada terus diam-diam:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Izinkan hook gagal tanpa menghentikan azd.** Untuk langkah non-kritis (pemanasan cache opsional, notifikasi upaya terbaik), setel `continueOnError: true`. azd mencatat kegagalan tapi tetap melanjutkan:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Uji hook secara terpisah sebelum menjalankan penuh.** Anda tidak harus menjalankan `azd up` untuk debug hook—jalankan sendiri dan iterasi cepat:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Waspadai shell spesifik OS.** Hook yang menggunakan `shell: pwsh` memerlukan PowerShell terpasang di mesin yang menjalankan (termasuk agen CI). Gunakan `shell: sh` untuk portabilitas paling luas, atau sediakan varian `windows` dan `posix`:

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

> **Tip debugging:** jalankan perintah azd apapun dengan `--debug` untuk melihat baris perintah hook persis dan output penuh—sangat berguna saat hook berhasil lokal tapi gagal di CI.

## 🎛️ Konfigurasi Deployment

### Pengaturan Deployment Spesifik Layanan
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Konfigurasi Spesifik Lingkungan

Ini nilai lokal azd saja. Harus dipetakan secara eksplisit ke konfigurasi infrastruktur/runtime. `NODE_ENV` biasanya `production` untuk aplikasi Node yang dideploy, termasuk deployment staging; gunakan variabel khusus aplikasi terpisah untuk membedakan tahap deployment.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Skenario Deployment Lanjutan

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

**Sketsa operasional ilustratif:** Anda harus menyediakan kedua lingkungan, lapisan pengaturan lalu lintas bersama, dan dua skrip berikut. azd tidak otomatis mengganti lalu lintas atau memvalidasi kesiapan rollback. Pertahankan green sampai blue lulus pengujian dan rollback tidak diperlukan lagi.

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

### Canary Deployments
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Pembagian lalu lintas adalah konfigurasi Container Apps (Bicep atau Azure CLI), bukan properti `azure.yaml` `trafficSplit`. Preview/provisioning dan deploy berikutnya harus mempertahankan mode revisi dan aturan routing yang Anda pilih.

### Deployment Bertahap
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Deployment Container

### Deployment Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Konfigurasikan rahasia runtime dengan `configuration.secrets`/`secretRef` (atau referensi Key Vault) dan skalabilitas dengan `template.scale` di infrastruktur Container App. Jangan membuat properti service-level `secrets` atau `scale` di `azure.yaml`.

### Optimasi Dockerfile Multi-Tahap
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Optimasi Performa

### Deployment Spesifik Layanan
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache Build
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Alur kerja standar Node menggunakan skrip package; hook layanan `prepackage` bisa menambah langkah yang dibutuhkan. Caching layer Docker terpisah dari definisi perintah build layanan.

### Deployment Kode Efisien
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Monitoring Deployment

### Monitoring Deployment Real-Time
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Pemeriksaan Kesehatan
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Aplikasi Anda harus mengimplementasikan `/health`; ini tidak disediakan otomatis oleh azd. Tidak ada properti layanan generik `azure.yaml` `healthCheck`.

### Validasi Pasca-Deployment
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` tidak valid. Nilai lingkungan biasa adalah plaintext lokal; jangan anggap perintah baca menyuntingnya. Perintah di atas menyimpan referensi Key Vault, tapi infrastruktur/aplikasi Anda harus tetap mengonsumsi rahasia dan memberikan akses identitas runtime.

### Keamanan Jaringan
Deklarasikan dan gunakan parameter jaringan di Bicep, dan petakan di `infra/main.parameters.json`. Tidak ada overlay generik `infra.parameters` di `azure.yaml`. Dokumentasi contoh `203.0.113.0/24` dan `198.51.100.0/24` bukan jaringan kantor/VPN nyata; ganti dengan jangkauan jaringan resmi.

### Manajemen Identitas dan Akses
Aktifkan `identity` Container App di Bicep dan tetapkan peran data-plane Key Vault yang diperlukan pada cakupan vault. Konfigurasikan rahasia dengan nama berbasis Key Vault dan referensi runtime di sumber daya tersebut; `identity` dan `keyVault` bukan properti layanan azd generik. Lihat [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategi Rollback

### Rollback Cepat
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Rollback Infrastruktur
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Rollback Migrasi Database
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrik Deployment

### Melacak Performa Deployment
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Validasi Infrastruktur
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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

### 4. Dokumentasi dan Logging
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Selanjutnya

- [Provisioning Resources](provisioning.md) - Pendalaman manajemen infrastruktur
- [Perencanaan Pra-Deployment](../chapter-06-pre-deployment/capacity-planning.md) - Rencanakan strategi deployment Anda
- [Masalah Umum](../chapter-07-troubleshooting/common-issues.md) - Mengatasi masalah deployment
- [Praktik Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi deployment siap produksi

## 🎯 Latihan Deployment Praktis

### Latihan 1: Alur Kerja Deployment Incremental (20 menit)
**Tujuan**: Kuasai perbedaan antara deployment penuh dan incremental

**Titik awal:** Bash, Node.js 22, Git, azd sign-in, dan langganan Azure dengan izin deployment. Jalankan di direktori baru; harapkan sumber daya App Service/Cosmos DB yang dapat dikenakan biaya. Waktu bergantung wilayah dan template.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Catat waktu yang berlalu untuk kedua perintah (tidak ada durasi yang dijamin)
- [ ] Kedua perintah selesai dengan sukses
- [ ] API tetap berfungsi; suntingan hanya komentar bukan perubahan UI terlihat
- [ ] Infrastruktur tidak berubah setelah `azd deploy`

**Hasil Pembelajaran**: `azd deploy` melewati provisioning infrastruktur. Bandingkan waktu yang diukur, bukan mengasumsikan peningkatan persen tetap.

### Latihan 2: Hook Deployment Kustom (30 menit)
**Tujuan**: Terapkan otomasi pra dan pasca deployment

**Titik awal:** proyek `deployment-practice` yang sudah diinisialisasi di atas. Jika Anda sudah membersihkannya, jalankan `azd up` lagi sebelum menguji deployment kode saja. Validasi berikut menggunakan skrip build API sebenarnya, bukan skrip root `test:unit` yang tidak ada. Tes API template membutuhkan akses database terkonfigurasi; ini bukan unit test terisolasi.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Kriteria Keberhasilan:**
- [ ] Skrip pra-deploy dijalankan sebelum deployment
- [ ] Deployment dibatalkan jika validasi build gagal
- [ ] Smoke test pasca-deploy memvalidasi kesehatan
- [ ] Hook dijalankan dalam urutan yang benar

### Latihan 3: Strategi Deployment Multi-Lingkungan (45 menit)
**Tujuan**: Terapkan alur kerja deployment bertahap (dev → staging → produksi)

**Titik awal:** proyek todo yang sama yang sudah diinisialisasi dengan `jq`. Buat lingkungan berikut ini dengan nilai langganan/lokasi nyata (atau atur `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` di masing-masing) **sebelum** memanggil alur kerja tanpa prompt. Ini sengaja gagal daripada mengarang nilai yang hilang. Gunakan hanya lingkungan pelatihan yang dapat dibuang, bukan langganan produksi yang sebenarnya.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Kriteria keberhasilan:**
- [ ] Lingkungan Dev berhasil dideploy
- [ ] Lingkungan Staging berhasil dideploy
- [ ] Persetujuan manual diperlukan untuk produksi
- [ ] Semua lingkungan memiliki pengecekan kesehatan yang berfungsi
- [ ] Dapat melakukan rollback jika diperlukan

### Latihan 4: Strategi Rollback (25 menit)
**Tujuan**: Menerapkan dan menguji rollback deployment menggunakan Git

**Titik awal:** checkout pelatihan terisolasi dari template todo dengan semua kode dasar telah dikomit, pohon kerja Git bersih, dan lingkungan yang dikonfigurasi dapat dibuang. Jangan pernah memperkenalkan kegagalan sengaja dalam proyek produksi nyata. `APP_VERSION` di bawah hanyalah untuk pembukuan kecuali Anda secara eksplisit menghubungkannya ke aplikasi.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Kriteria keberhasilan:**
- [ ] Dapat mendeteksi kegagalan deployment
- [ ] Skrip rollback berjalan otomatis
- [ ] Aplikasi kembali ke kondisi berfungsi
- [ ] Pengecekan kesehatan lulus setelah rollback

## 📊 Pelacakan Metrik Deployment

### Lacak Kinerja Deployment Anda

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Analisis metrik Anda:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Daya Tambahan

- [Referensi Deployment Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Deployment Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Deployment Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Deployment Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Proyek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Pelajaran Selanjutnya**: [Provisioning Sumber Daya](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->