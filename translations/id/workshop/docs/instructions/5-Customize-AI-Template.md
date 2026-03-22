# 5. Sesuaikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Menjelajahi kemampuan Agen AI bawaan
    - [ ] Menambahkan Pencarian AI dengan indeks Anda sendiri
    - [ ] Mengaktifkan dan menganalisis metrik Pelacakan
    - [ ] Menjalankan sesi evaluasi
    - [ ] Menjalankan pemindaian red-teaming
    - [ ] **Lab 5: Membangun Rencana Kustomisasi** 

---

## 5.1 Kemampuan Agen AI

!!! success "Kami menyelesaikannya di Lab 01"

- **Pencarian Berkas**: Pencarian berkas bawaan OpenAI untuk pengambilan pengetahuan
- **Sitasi**: Atribusi sumber otomatis dalam respons
- **Instruksi yang Dapat Disesuaikan**: Memodifikasi perilaku dan kepribadian agen
- **Integrasi Alat**: Sistem alat yang dapat diperluas untuk kemampuan kustom

---

## 5.2 Opsi Pengambilan Pengetahuan

!!! task "Untuk menyelesaikan ini kita perlu melakukan perubahan dan menerapkan ulang"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Terintegrasi ke Foundry Agents
- Pemrosesan dan pengindeksan dokumen otomatis
- Tidak diperlukan konfigurasi tambahan

**Azure AI Search (Opsional):**

- Pencarian semantik dan vektor hibrid
- Manajemen indeks kustom
- Kemampuan pencarian lanjutan
- Memerlukan `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Pelacakan & Pemantauan](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Untuk menyelesaikan ini kita perlu melakukan perubahan dan menerapkan ulang"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Pelacakan:**

- Integrasi OpenTelemetry
- Pelacakan permintaan/respons
- Metrik kinerja
- Tersedia di portal Microsoft Foundry

**Pencatatan:**

- Log aplikasi di Container Apps
- Pencatatan terstruktur dengan ID korelasi
- Penayangan log waktu-nyata dan historis

---

## 5.4 [Evaluasi Agen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Evaluasi Lokal:**

- Evaluator bawaan untuk penilaian kualitas
- Skrip evaluasi kustom
- Benchmark kinerja

**Pemantauan Berkelanjutan:**

- Evaluasi otomatis terhadap interaksi langsung
- Pelacakan metrik kualitas
- Deteksi regresi kinerja

**Integrasi CI/CD:**

- Workflow GitHub Actions
- Pengujian dan evaluasi otomatis
- Pengujian perbandingan statistik

---

## 5.5 [Agen Red Teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- Pemindaian keamanan otomatis
- Penilaian risiko untuk sistem AI
- Evaluasi keselamatan di berbagai kategori

**Autentikasi:**

- Managed Identity untuk layanan Azure
- Autentikasi Azure App Service opsional
- Fallback autentikasi dasar untuk pengembangan



!!! quote "PADA AKHIR LAB INI ANDA SEHARUSNYA MEMILIKI"
    - [ ] Menentukan kebutuhan skenario Anda
    - [ ] Menyesuaikan variabel lingkungan (konfigurasi)
    - [ ] Menyesuaikan instruksi agen (tugas)
    - [ ] Menerapkan template yang disesuaikan (aplikasi)
    - [ ] Menyelesaikan tugas pasca-penyebaran (manual)
    - [ ] Menjalankan evaluasi pengujian

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Sesuaikan Untuk Anda!

### 5.6.1. Persyaratan Skenario

#### **Penyebaran Agen:** 

   - Shopper Agent: Membantu pelanggan menemukan dan membandingkan produk
   - Loyalty Agent: Mengelola hadiah dan promosi pelanggan

#### **Penyebaran Model:**

   - `gpt-4.1`: Model chat utama
   - `o3`: Model penalaran untuk kueri kompleks
   - `gpt-4.1-nano`: Model ringan untuk interaksi sederhana
   - `text-embedding-3-large`: Embedding berkualitas tinggi untuk pencarian

#### **Fitur:**

   - Pelacakan dan pemantauan diaktifkan
   - Pencarian AI untuk katalog produk
   - Kerangka evaluasi untuk penjaminan kualitas
   - Red teaming untuk validasi keamanan

---

### 5.6.2 Implementasi Skenario


#### 5.6.2.1. Konfigurasi Pra-Penyebaran

Buat skrip setup (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Tetapkan nama lingkungan
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurasikan wilayah (pilih berdasarkan ketersediaan model)
azd env set AZURE_LOCATION "eastus2"

# Aktifkan semua layanan opsional
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurasikan model chat utama (gpt-4.1 sebagai model yang paling mendekati gpt-4.1 yang tersedia)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurasikan model embedding untuk pencarian yang ditingkatkan
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Tetapkan nama agen (akan membuat agen pertama)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurasikan indeks pencarian
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instruksi Agen

Buat `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Buat `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Skrip Penyebaran

Buat `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validasi prasyarat
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Siapkan lingkungan
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Periksa kuota di wilayah yang dipilih
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Terapkan infrastruktur dan aplikasi
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Ambil keluaran penyebaran
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Dapatkan URL aplikasi web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Konfigurasi Pasca-Penyebaran

Buat `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Dapatkan informasi penyebaran
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instruksi untuk konfigurasi manual
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Pengujian dan Validasi

Buat `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verifikasi variabel lingkungan telah disetel
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Uji ketersediaan aplikasi web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Jalankan evaluasi jika dikonfigurasi
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Hasil yang Diharapkan

Setelah mengikuti panduan implementasi ini, Anda akan memiliki:

1. **Infrastruktur yang Diterapkan:**

      - Proyek Microsoft Foundry dengan penyebaran model
      - Container Apps yang menjadi host aplikasi web
      - Layanan AI Search untuk katalog produk
      - Application Insights untuk pemantauan

2. **Agen Awal:**

      - Shopper Agent dikonfigurasi dengan instruksi dasar
      - Kemampuan pencarian berkas diaktifkan
      - Pelacakan dan pemantauan dikonfigurasi

3. **Siap untuk Kustomisasi:**

      - Kerangka kerja untuk menambahkan Loyalty Agent
      - Template instruksi kustom
      - Skrip pengujian dan validasi
      - Pengaturan pemantauan dan evaluasi

4. **Kesiapan Produksi:**

      - Pemindaian keamanan dengan red teaming
      - Pemantauan kinerja
      - Kerangka evaluasi kualitas
      - Arsitektur yang dapat diskalakan

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi penting, disarankan menggunakan jasa penerjemah profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->