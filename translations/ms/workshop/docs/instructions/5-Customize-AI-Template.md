<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T23:33:08+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "ms"
}
-->
# 5. Sesuaikan Templat

!!! tip "PADA AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Meneroka Keupayaan Ejen AI lalai
    - [ ] Menambah Carian AI dengan indeks anda sendiri
    - [ ] Mengaktifkan dan menganalisis metrik Penjejakan
    - [ ] Melaksanakan ujian penilaian
    - [ ] Melaksanakan imbasan red-teaming
    - [ ] **Lab 5: Membina Pelan Penyesuaian**

---

## 5.1 Keupayaan Ejen AI

!!! success "Kita telah melengkapkan ini dalam Lab 01"

- **Carian Fail**: Carian fail terbina dalam OpenAI untuk pengambilan pengetahuan
- **Petikan**: Atribusi sumber automatik dalam respons
- **Arahan Boleh Disesuaikan**: Ubah tingkah laku dan personaliti ejen
- **Integrasi Alat**: Sistem alat yang boleh diperluaskan untuk keupayaan tersuai

---

## 5.2 Pilihan Pengambilan Pengetahuan

!!! task "Untuk melengkapkan ini kita perlu membuat perubahan dan melaksanakan semula"    
    
    ```bash title=""
    # Tetapkan pembolehubah persekitaran
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Muat naik data dan buat indeks saya

    ```

---

**Carian Fail OpenAI (Lalai):**

- Terbina dalam perkhidmatan Ejen AI Azure
- Pemprosesan dokumen dan pengindeksan automatik
- Tidak memerlukan konfigurasi tambahan

**Carian AI Azure (Pilihan):**

- Carian semantik dan vektor hibrid
- Pengurusan indeks tersuai
- Keupayaan carian lanjutan
- Memerlukan `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Penjejakan & Pemantauan](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Untuk melengkapkan ini kita perlu membuat perubahan dan melaksanakan semula"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Penjejakan:**

- Integrasi OpenTelemetry
- Penjejakan permintaan/respons
- Metrik prestasi
- Tersedia di portal AI Foundry

**Log:**

- Log aplikasi dalam Container Apps
- Log berstruktur dengan ID korelasi
- Paparan log masa nyata dan sejarah

---

## 5.4 [Penilaian Ejen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Penilaian Tempatan:**

- Penilai terbina dalam untuk penilaian kualiti
- Skrip penilaian tersuai
- Penanda aras prestasi

**Pemantauan Berterusan:**

- Penilaian automatik interaksi langsung
- Penjejakan metrik kualiti
- Pengesanan regresi prestasi

**Integrasi CI/CD:**

- Aliran kerja GitHub Actions
- Ujian dan penilaian automatik
- Ujian perbandingan statistik

---

## 5.5 [Ejen Red Teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- Imbasan keselamatan automatik
- Penilaian risiko untuk sistem AI
- Penilaian keselamatan merentasi pelbagai kategori

**Pengesahan:**

- Identiti Terurus untuk perkhidmatan Azure
- Pengesahan Perkhidmatan Aplikasi Azure pilihan
- Pengesahan asas untuk pembangunan

!!! quote "PADA AKHIR LAB INI ANDA SEPATUTNYA TELAH"
    - [ ] Menentukan keperluan senario anda
    - [ ] Menyesuaikan pembolehubah persekitaran (konfigurasi)
    - [ ] Menyesuaikan arahan ejen (tugas)
    - [ ] Melaksanakan templat yang disesuaikan (aplikasi)
    - [ ] Melengkapkan tugas pasca pelaksanaan (manual)
    - [ ] Menjalankan ujian penilaian

Contoh ini menunjukkan cara menyesuaikan templat untuk kes penggunaan runcit perusahaan dengan dua ejen khusus dan pelbagai pelaksanaan model.

---

## 5.6 Sesuaikan Untuk Anda!

### 5.6.1. Keperluan Senario

#### **Pelaksanaan Ejen:** 

   - Ejen Pembeli: Membantu pelanggan mencari dan membandingkan produk
   - Ejen Kesetiaan: Menguruskan ganjaran dan promosi pelanggan

#### **Pelaksanaan Model:**

   - `gpt-4.1`: Model sembang utama
   - `o3`: Model penaakulan untuk pertanyaan kompleks
   - `gpt-4.1-nano`: Model ringan untuk interaksi mudah
   - `text-embedding-3-large`: Penyisipan berkualiti tinggi untuk carian

#### **Ciri-ciri:**

   - Penjejakan dan pemantauan diaktifkan
   - Carian AI untuk katalog produk
   - Rangka kerja penilaian untuk jaminan kualiti
   - Red teaming untuk pengesahan keselamatan

---

### 5.6.2 Pelaksanaan Senario

#### 5.6.2.1. Konfigurasi Pra-Pelaksanaan

Buat skrip persediaan (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Arahan Ejen

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

#### 5.6.2.3: Skrip Pelaksanaan

Buat `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Konfigurasi Pasca-Pelaksanaan

Buat `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
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
- Tracing: Available in AI Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Ujian dan Pengesahan

Buat `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
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

# Run evaluation if configured
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
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Hasil Yang Dijangkakan

Selepas mengikuti panduan pelaksanaan ini, anda akan mempunyai:

1. **Infrastruktur Dilaksanakan:**

      - Projek AI Foundry dengan pelaksanaan model
      - Container Apps yang menjadi hos aplikasi web
      - Perkhidmatan Carian AI untuk katalog produk
      - Application Insights untuk pemantauan

2. **Ejen Awal:**

      - Ejen Pembeli dikonfigurasi dengan arahan asas
      - Keupayaan carian fail diaktifkan
      - Penjejakan dan pemantauan dikonfigurasi

3. **Sedia untuk Penyesuaian:**

      - Rangka kerja untuk menambah Ejen Kesetiaan
      - Templat arahan tersuai
      - Skrip ujian dan pengesahan
      - Persediaan pemantauan dan penilaian

4. **Kesediaan Pengeluaran:**

      - Imbasan keselamatan dengan red teaming
      - Pemantauan prestasi
      - Rangka kerja penilaian kualiti
      - Seni bina yang boleh diskalakan

Contoh ini menunjukkan bagaimana templat AZD boleh diperluaskan dan disesuaikan untuk senario perusahaan tertentu sambil mengekalkan amalan terbaik untuk keselamatan, pemantauan, dan kebolehskalaan.

---

