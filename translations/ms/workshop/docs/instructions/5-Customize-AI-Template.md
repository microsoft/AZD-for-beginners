# 5. Sesuaikan Templet

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Meneroka Kebolehan Ejen AI lalai
    - [ ] Menambah Pencarian AI dengan indek anda sendiri
    - [ ] Mengaktifkan dan menganalisis metrik Penjejakan
    - [ ] Melaksanakan larian penilaian
    - [ ] Melaksanakan imbasan red-teaming
    - [ ] **Makmal 5: Membina Pelan Penyesuaian**

---

## 5.1 Kebolehan Ejen AI

!!! success "Kami telah menyelesaikan ini dalam Makmal 01"

- **Carian Fail**: Carian fail terbina dalam OpenAI untuk pengambilan pengetahuan
- **Sitat**: Atribusi sumber automatik dalam jawapan
- **Arahan Boleh Diubahsuai**: Ubah suai tingkah laku dan personaliti ejen
- **Integrasi Alat**: Sistem alat boleh luaskan untuk kebolehan tersuai

---

## 5.2 Pilihan Pengambilan Pengetahuan

!!! task "Untuk melengkapkan ini kita perlu membuat perubahan dan menyebarkan semula"    
    
    ```bash title=""
    # Tetapkan pembolehubah persekitaran
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Muat naik data dan cipta indek saya

    ```

---

**Carian Fail OpenAI (Lalai):**

- Terbina dalam Foundry Agents
- Pemprosesan dokumen dan pengindeksan automatik
- Tiada konfigurasi tambahan diperlukan

**Pencarian AI Azure (Pilihan):**

- Pencarian semantik dan vektor hibrid
- Pengurusan indek tersuai
- Kebolehan carian maju
- Memerlukan `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Penjejakan & Pemantauan](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Untuk melengkapkan ini kita perlu membuat perubahan dan menyebarkan semula"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Penjejakan:**

- Integrasi OpenTelemetry
- Penjejakan permintaan/respons
- Metrik prestasi
- Tersedia dalam portal Microsoft Foundry

**Pelogging:**

- Log aplikasi dalam Container Apps
- Peloggan berstruktur dengan ID korelasi
- Paparan log masa nyata dan sejarah

---

## 5.4 [Penilaian Ejen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Penilaian Tempatan:**

- Penilai terbina dalam untuk penilaian kualiti
- Skrip penilaian tersuai
- Penandaarasan prestasi

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
- Penilaian keselamatan merentas pelbagai kategori

**Pengesahan:**

- Managed Identity untuk perkhidmatan Azure
- Pilihan pengesahan Azure App Service
- Kaedah fallback auth asas untuk pembangunan

!!! quote "PADA AKHIR MAKAMAL INI ANDA PERLU MEMPUNYAI"
    - [ ] Mentakrifkan keperluan senario anda
    - [ ] Mengubah suai pembolehubah persekitaran (konfig)
    - [ ] Mengubah suai arahan ejen (tugasan)
    - [ ] Menyebarkan templet tersuai (app)
    - [ ] Menyelesaikan tugasan selepas penyebaran (manual)
    - [ ] Menjalankan penilaian ujian

Contoh ini menunjukkan kaedah menyesuaikan templet untuk kes penggunaan runcit perusahaan dengan dua ejen khusus dan pelbagai penyebaran model.

---

## 5.6 Sesuaikan Untuk Anda!

### 5.6.1. Keperluan Senario

#### **Penyebaran Ejen:**

   - Ejen Pembeli: Membantu pelanggan mencari dan membanding produk
   - Ejen Kesetiaan: Mengurus ganjaran dan promosi pelanggan

#### **Penyebaran Model:**

   - `gpt-4.1`: Model chat utama
   - `o3`: Model alasan untuk pertanyaan kompleks
   - `gpt-4.1-nano`: Model ringan untuk interaksi mudah
   - `text-embedding-3-large`: Penjimatan berkualiti tinggi untuk carian

#### **Ciri-ciri:**

   - Penjejakan dan pemantauan diaktifkan
   - Pencarian AI untuk katalog produk
   - Rangka kerja penilaian untuk jaminan kualiti
   - Red teaming untuk pengesahan keselamatan

---

### 5.6.2 Pelaksanaan Senario


#### 5.6.2.1. Konfigurasi Pra-Penyebaran

Cipta skrip persediaan (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Tetapkan nama persekitaran
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Konfigurasikan rantau (pilih berdasarkan ketersediaan model)
azd env set AZURE_LOCATION "eastus2"

# Aktifkan semua perkhidmatan pilihan
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Konfigurasikan model sembang utama (gpt-4o sebagai yang paling hampir dengan gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Konfigurasikan model embedding untuk pencarian yang dipertingkatkan
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Tetapkan nama ejen (akan membuat ejen pertama)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Konfigurasikan indeks carian
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Arahan Ejen

Cipta `custom-agents/shopper-agent-instructions.md`:

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

Cipta `custom-agents/loyalty-agent-instructions.md`:

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

Cipta `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Sahkan prasyarat
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Sediakan persekitaran
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Semak kuota di rantau yang dipilih
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

# Lancarkan infrastruktur dan aplikasi
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Tangkap output pelancaran
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

#### 5.6.2.4: Konfigurasi Pasca Penyebaran

Cipta `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Dapatkan maklumat penempatan
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Arahan untuk konfigurasi manual
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

### 5.6.3: Ujian dan Pengesahan

Cipta `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Sahkan pemboleh ubah persekitaran ditetapkan
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

# Jalankan penilaian jika dikonfigurasikan
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

### 5.6.4 Hasil Yang Dijangka

Selepas mengikuti panduan pelaksanaan ini, anda akan mempunyai:

1. **Infrastruktur Disebarkan:**

      - Projek Microsoft Foundry dengan penyebaran model
      - Container Apps yang menghoskan aplikasi web
      - Perkhidmatan Pencarian AI untuk katalog produk
      - Application Insights untuk pemantauan

2. **Ejen Awal:**

      - Ejen Pembeli yang dikonfigurasikan dengan arahan asas
      - Kebolehan carian fail diaktifkan
      - Penjejakan dan pemantauan dikonfigurasikan

3. **Sedia untuk Penyesuaian:**

      - Rangka kerja untuk menambah Ejen Kesetiaan
      - Templet arahan tersuai
      - Skrip ujian dan pengesahan
      - Persediaan pemantauan dan penilaian

4. **Kesediaan Produksi:**

      - Imbasan keselamatan dengan red teaming
      - Pemantauan prestasi
      - Rangka kerja penilaian kualiti
      - Senibina yang boleh diskala

Contoh ini menunjukkan bagaimana templet AZD boleh diperluas dan disesuaikan untuk senario perusahaan khusus sambil mengekalkan amalan terbaik untuk keselamatan, pemantauan, dan kebolehskalaan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh penterjemah profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->