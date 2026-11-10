# Panduan Penggunaan - Menguasai Pengguna AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 4 - Infrastruktur sebagai Kod & Penyebaran
- **⬅️ Bab Sebelumnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)
- **➡️ Seterusnya**: [Penyediaan Sumber](provisioning.md)
- **🧩 Juga dalam bab ini**: [Mencipta Templat Sendiri](custom-templates.md)
- **🚀 Bab Seterusnya**: [Bab 5: Penyelesaian AI Multi-Ejen](../../examples/retail-scenario.md)

## Pengenalan

> Disemak terhadap `azd 1.37.2` (November 2026). Perintah menggunakan Bash; contoh JSON memerlukan `jq`. Kecuali untuk latihan todo yang secara eksplisit diinisialisasi, contoh lanjutan adalah **fragmen integrasi**: sediakan sumber anda sendiri, infrastruktur, ujian, dan skrip. Tiada penyebaran Azure dijalankan dalam semakan ini.

Panduan menyeluruh ini merangkumi segala yang anda perlu tahu tentang penyebaran aplikasi menggunakan Azure Developer CLI, dari penyebaran asas dengan satu perintah hingga senario pengeluaran lanjutan dengan kait tersuai, persekitaran berganda, dan integrasi CI/CD. Kuasai kitar hayat penyebaran lengkap dengan contoh praktikal dan amalan terbaik.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai semua perintah dan aliran kerja penyebaran Azure Developer CLI
- Memahami kitar hayat penyebaran lengkap dari penyediaan hingga pemantauan
- Melaksanakan kait penyebaran tersuai untuk automasi pra dan pasca penyebaran
- Mengkonfigurasi pelbagai persekitaran dengan parameter khusus persekitaran
- Menyediakan strategi penyebaran lanjutan termasuk penyebaran biru-hijau dan canary
- Mengintegrasikan penyebaran azd dengan saluran paip CI/CD dan aliran kerja DevOps

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Melaksanakan dan menyelesaikan masalah semua aliran kerja penyebaran azd secara bebas
- Reka dan laksanakan automasi penyebaran tersuai menggunakan kait
- Mengkonfigurasi penyebaran sedia produksi dengan keselamatan dan pemantauan yang betul
- Menguruskan senario penyebaran multi-persekitaran yang kompleks
- Mengoptimumkan prestasi penyebaran dan melaksanakan strategi rollback
- Mengintegrasikan penyebaran azd ke dalam amalan DevOps perusahaan

## Gambaran Keseluruhan Penyebaran

Azure Developer CLI menyediakan beberapa perintah penyebaran:
- `azd up` - Aliran kerja lengkap (penyediaan + penyebaran)
- `azd provision` - Membuat/mengemas kini sumber Azure sahaja
- `azd deploy` - Menyebarkan kod aplikasi sahaja
- `azd package` - Membina dan membungkus aplikasi

## Aliran Kerja Penyebaran Asas

### Penyebaran Lengkap (azd up)
Aliran kerja paling biasa untuk projek baru:
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

### Penyebaran Infrastruktur Sahaja
Apabila anda hanya perlu mengemas kini sumber Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Penyebaran Kod Sahaja
Untuk kemas kini aplikasi cepat:
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

### ✅ Pengesahan Penyebaran

Selepas apa-apa penyebaran, sahkan kejayaan:

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

**Kriteria Kejayaan:**
- ✅ `azd show` menyesuaikan sasaran/URL perkhidmatan yang dijangka
- ✅ Permintaan pada laluan aplikasi sebenar mengembalikan status dan badan yang dijangka
- ✅ Tiada log ralat dalam 5 minit terakhir
- ✅ Aplikasi bertindak balas kepada permintaan ujian

## 🏗️ Memahami Proses Penyebaran

### Baru dengan kait? Mulakan di sini

**Hook** ialah perintah yang dijalankan secara automatik oleh azd pada saat tertentu dalam proses penyebaran—sebelum atau selepas penyediaan, dan sebelum atau selepas penyebaran kod anda. Ia membolehkan automasi tugasan kecil yang sentiasa mengiringi penyebaran: menanam pangkalan data, menjalankan migrasi, membina aset, atau ujian asap aplikasi yang berjalan.

| Kait | Dijalan… | Penggunaan biasa |
|------|-------|------------|
| `preprovision` | Sebelum sumber dibuat | Sahkan prasyarat, daftar masuk ke registri |
| `postprovision` | Selepas sumber wujud | Konfigurasikan sumber, sediakan pangkalan data |
| `predeploy` | Sebelum kod disebarkan | Bina aset depan, jalankan ujian unit |
| `postdeploy` | Selepas kod berfungsi | Jalankan migrasi DB, ujian asap titik akhir |

Kait berada dalam `azure.yaml` anda. Ini contoh paling kecil—hanya mencetak mesej selepas penyebaran:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Itulah sahaja—lain kali anda jalankan `azd up`, mesej dicetak secara automatik. Anda juga boleh menjalankan kait secara tunggal tanpa penyebaran penuh, bagus untuk ujian:

```bash
azd hooks run postdeploy
```

Fasa di bawah menunjukkan kait sebenar (migrasi, ujian, pengesahan) untuk setiap tahap.

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
- Membuat atau mengemas kini sumber Azure
- Mengkonfigurasikan rangkaian dan keselamatan
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

### Fasa 4: Pengbungkusan Aplikasi
- Membina kod aplikasi
- Membuat artifak penyebaran
- Membungkus untuk platform sasaran (kontena, fail ZIP, dll)

### Fasa 5: Kait Pra-Penyebaran
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
- Menyebarkan aplikasi dibungkus ke perkhidmatan Azure
- Mengemas kini tetapan konfigurasi
- Memulakan/memulakan semula perkhidmatan

### Fasa 7: Kait Pasca-Penyebaran
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

### Mengendalikan Ralat Kait

Secara lalai, **jika perintah kait keluar dengan kod bukan sifar, azd menghentikan keseluruhan operasi.** Ini biasanya apa yang anda mahukan—migrasi gagal harus menghentikan penyebaran, bukan menghantar aplikasi yang rosak. Tetapi ini bermakna kait perlu ditulis dengan teliti.

**1. Buat kegagalan menjadi jelas dan disengajakan.** Kait gagal apabila arahan terakhirnya mengembalikan kod keluar bukan sifar. Dalam skrip shell, tambah `set -e` supaya kait berhenti pada arahan pertama yang gagal dan tidak terus diam-diam:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Benarkan kait gagal tanpa menghentikan azd.** Untuk langkah tidak kritikal (pemanasan cache pilihan, notifikasi usaha terbaik), tetapkan `continueOnError: true`. azd merekod kegagalan tetapi terus berjalan:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Uji kait secara terasing sebelum menjalankan penuh.** Anda tidak perlu menjalankan `azd up` untuk menyahpepijat kait—jalankan sendiri dan ulang cepat:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Perhatikan shell khusus OS.** Kait menggunakan `shell: pwsh` memerlukan PowerShell dipasang pada mesin yang menjalankannya (termasuk ejen CI). Gunakan `shell: sh` untuk kebolehportabilan terbaik, atau sediakan kedua-dua varian `windows` dan `posix`:

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

> **Petua menyahpepijat:** jalankan mana-mana perintah azd dengan `--debug` untuk melihat baris arahan kait tepat dan output penuh—tidak ternilai apabila kait berfungsi secara tempatan tetapi gagal di CI.

## 🎛️ Konfigurasi Penyebaran

### Tetapan Penyebaran Khusus Perkhidmatan
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

### Konfigurasi Khusus Persekitaran

Ini adalah nilai azd tempatan sahaja. Peta secara eksplisit ke konfigurasi infrastruktur/runtime. `NODE_ENV` biasanya `production` untuk aplikasi Node yang disebarkan, termasuk penyebaran peringkat percubaan; gunakan pembolehubah khusus aplikasi berasingan untuk membezakan tahap penyebaran.

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

## 🔧 Senario Penyebaran Lanjutan

### Aplikasi Multi-Perkhidmatan
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

**Lakaran operasi ilustrasi:** anda mesti menyediakan kedua-dua persekitaran, lapisan penghalaan trafik dikongsi, dan dua skrip di bawah. azd tidak secara automatik menukar trafik atau mengesahkan kesiapsiagaan rollback. Kekalkan hijau sehingga biru lulus ujian dan rollback tidak lagi diperlukan.

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

### Penyebaran Canary
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Pembahagian trafik adalah milik konfigurasi Container Apps (Bicep atau Azure CLI), bukan sifat `azure.yaml` `trafficSplit`. Pratonton/penyediaan dan penyebaran kemudian mesti mengekalkan mod semakan dan peraturan penghalaan yang anda pilih.

### Penyebaran Berperingkat
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

## 🐳 Penyebaran Kontena

### Penyebaran Aplikasi Kontena
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

Konfigurasikan rahsia runtime dengan `configuration.secrets`/`secretRef` (atau rujukan Key Vault) dan penskalaan dengan `template.scale` dalam infrastruktur Container App. Jangan cipta sifat perkhidmatan `secrets` atau `scale` pada `azure.yaml`.

### Pengoptimuman Dockerfile Berperingkat
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

## ⚡ Pengoptimuman Prestasi

### Penyebaran Khusus Perkhidmatan
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Penyimpanan Cache Pembinaan
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Aliran kerja Node standard menggunakan skrip pakej; kait perkhidmatan `prepackage` boleh menambah langkah diperlukan. Penyimpanan cache lapisan Docker berasingan daripada mendefinisikan arahan bina perkhidmatan.

### Penyebaran Kod Berkesan
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Pemantauan Penyebaran

### Pemantauan Penyebaran Masa Nyata
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Pemeriksaan Kesihatan
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

Aplikasi anda mesti melaksanakan `/health`; ia tidak disediakan secara automatik oleh azd. Tiada sifat perkhidmatan generik `azure.yaml` `healthCheck`.

### Pengesahan Pasca-Penyebaran
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

## 🔐 Pertimbangan Keselamatan

### Pengurusan Rahsia
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` tidak sah. Nilai persekitaran biasa adalah teks biasa tempatan; jangan anggap perintah baca mengedit mereka. Perintah di atas menyimpan rujukan Key Vault, tetapi infrastruktur/aplikasi anda masih perlu menggunakan rahsia dan memberikan akses identiti runtime.

### Keselamatan Rangkaian
Isytiharkan dan gunakan parameter rangkaian dalam Bicep, dan peta dalam `infra/main.parameters.json`. Tiada lapisan generik `infra.parameters` dalam `azure.yaml`. Contoh julat dokumentasi `203.0.113.0/24` dan `198.51.100.0/24` bukan rangkaian pejabat/VPN sebenar; gantikan dengan julat rangkaian yang diberi kuasa.

### Pengurusan Identiti dan Akses
Dayakan `identity` Container App dalam Bicep dan tetapkan peranan data-plan Key Vault yang diperlukan pada skop vault. Konfigurasikan rahsia disokong Key Vault dan rujukan runtime dalam sumber itu; `identity` dan `keyVault` bukan sifat perkhidmatan azd generik. Lihat [Pengesahan & Identiti Terurus](../chapter-03-configuration/authsecurity.md).

## 🚨 Strategi Rollback

### Rollback Pantas
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

### Rollback Migrasi Pangkalan Data
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Metrix Penyebaran

### Jejaki Prestasi Penyebaran
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Pengesahan Infrastruktur
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Langkah Seterusnya

- [Penyediaan Sumber](provisioning.md) - Menyelami pengurusan infrastruktur
- [Perancangan Pra-Penyebaran](../chapter-06-pre-deployment/capacity-planning.md) - Rancang strategi penyebaran anda
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md) - Selesaikan isu penyebaran
- [Amalan Terbaik](../chapter-07-troubleshooting/debugging.md) - Strategi penyebaran siap produksi

## 🎯 Latihan Penyebaran Amali

### Latihan 1: Aliran Kerja Penyebaran Inkremental (20 minit)
**Matlamat**: Kuasai perbezaan antara penyebaran penuh dan inkremental

**Titik mula:** Bash, Node.js 22, Git, azd masuk, dan langganan Azure dengan kebenaran penyebaran. Jalankan dalam direktori baru; jangka sumber App Service/Cosmos DB boleh dikenakan caj. Masa bergantung pada wilayah dan templat.

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

**Kriteria Kejayaan:**
- [ ] Rekodkan masa yang diambil untuk kedua-dua perintah (tiada jaminan tempoh)
- [ ] Kedua-dua perintah berjaya dilaksanakan
- [ ] API tetap berfungsi; sunting komen sahaja bukan perubahan UI yang kelihatan
- [ ] Infrastruktur tidak berubah selepas `azd deploy`

**Hasil Pembelajaran**: `azd deploy` melangkau penyediaan infrastruktur. Bandingkan masa yang diukur dan jangan anggap kelajuan peratusan tetap.

### Latihan 2: Kait Penyebaran Tersuai (30 minit)
**Matlamat**: Melaksanakan automasi pra dan pasca penyebaran

**Titik mula:** projek `deployment-practice` yang diinisialisasi di atas. Jika anda telah membersihkannya, jalankan `azd up` sekali lagi sebelum menguji penyebaran kod sahaja. Pengesahan di bawah menggunakan skrip bina API sebenar, bukan skrip root `test:unit` yang tidak wujud. Ujian API templat memerlukan akses pangkalan data dikonfigurasikan; mereka bukan ujian unit terasing.

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

**Kriteria Kejayaan:**
- [ ] Skrip pra-sebaran dijalankan sebelum penyebaran
- [ ] Penyebaran dibatalkan jika pengesahan bina gagal
- [ ] Ujian asap pasca-sebaran mengesahkan kesihatan
- [ ] Kait dijalankan mengikut susunan betul

### Latihan 3: Strategi Penyebaran Multi-Persekitaran (45 minit)
**Matlamat**: Melaksanakan aliran kerja penyebaran berperingkat (dev → staging → production)

**Titik permulaan:** projek todo yang diinisialisasi yang sama dengan `jq`. Cipta persekitaran di bawah dengan nilai langganan/ lokasi sebenar (atau tetapkan `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` dalam setiap satu) **sebelum** memanggil aliran kerja tanpa prompt. Ia sengaja gagal daripada mereka nilai yang hilang. Gunakan hanya persekitaran latihan pakai buang, bukan langganan produksi sebenar.

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

**Kriteria Kejayaan:**
- [ ] Persekitaran Dev berjaya dideploy
- [ ] Persekitaran Staging berjaya dideploy
- [ ] Kelulusan manual diperlukan untuk produksi
- [ ] Semua persekitaran mempunyai pemeriksaan kesihatan yang berfungsi
- [ ] Boleh menggulung kembali jika perlu

### Latihan 4: Strategi Rollback (25 minit)
**Matlamat**: Melaksanakan dan menguji rollback deployment menggunakan Git

**Titik permulaan:** checkout latihan terpencil bagi template todo dengan semua sumber asas yang telah dikomit, pokok kerja Git yang bersih, dan persekitaran yang dikonfigurasikan pakai buang. Jangan pernah memperkenalkan kegagalan sengaja dalam projek produksi sebenar. `APP_VERSION` di bawah adalah untuk pencatatan sahaja melainkan anda secara eksplisit menyambungkannya ke dalam aplikasi.

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

**Kriteria Kejayaan:**
- [ ] Boleh mengesan kegagalan deployment
- [ ] Skrip rollback berjalan secara automatik
- [ ] Aplikasi kembali ke keadaan berfungsi
- [ ] Pemeriksaan kesihatan lulus selepas rollback

## 📊 Penjejakan Metrik Deployment

### Jejak Prestasi Deployment Anda

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

**Analisis metrik anda:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Sumber Tambahan

- [Rujukan Deployment Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Deployment Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Deployment Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Deployment Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **Pelajaran Seterusnya**: [Penyediaan Sumber](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->