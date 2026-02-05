# 5. Bir Şablonu Özelleştirin

!!! tip "BU MODÜLÜ TAMAMLADIĞINIZDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Varsayılan AI Agent Yetkinliklerini keşfettiniz
    - [ ] Kendi indeksinizle AI Arama eklediniz
    - [ ] İzleme metriklerini etkinleştirdiniz ve analiz ettiniz
    - [ ] Bir değerlendirme çalışması gerçekleştirdiniz
    - [ ] Bir güvenlik taraması gerçekleştirdiniz
    - [ ] **Lab 5: Özelleştirme Planı Oluşturdunuz** 

---

## 5.1 AI Agent Yetkinlikleri

!!! success "Bunu Lab 01'de tamamladık"

- **Dosya Arama**: OpenAI'nin bilgi erişimi için yerleşik dosya arama özelliği
- **Atıflar**: Yanıtlarda otomatik kaynak gösterimi
- **Özelleştirilebilir Talimatlar**: Agent davranışını ve kişiliğini değiştirme
- **Araç Entegrasyonu**: Özel yetkinlikler için genişletilebilir araç sistemi

---

## 5.2 Bilgi Erişim Seçenekleri

!!! task "Bunu tamamlamak için değişiklik yapmamız ve yeniden dağıtmamız gerekiyor"    
    
    ```bash title=""
    # Ortam değişkenlerini ayarla
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Verileri yükle ve indeksimi oluştur

    ```

---

**OpenAI Dosya Arama (Varsayılan):**

- Azure AI Agent hizmetine entegre
- Otomatik belge işleme ve indeksleme
- Ek yapılandırma gerektirmez

**Azure AI Arama (Opsiyonel):**

- Hibrit semantik ve vektör arama
- Özel indeks yönetimi
- Gelişmiş arama yetkinlikleri
- `USE_AZURE_AI_SEARCH_SERVICE=true` gerektirir

---

## 5.3 [İzleme ve Takip](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Bunu tamamlamak için değişiklik yapmamız ve yeniden dağıtmamız gerekiyor"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**İzleme:**

- OpenTelemetry entegrasyonu
- İstek/yanıt takibi
- Performans metrikleri
- AI Foundry portalında mevcut

**Günlük Kaydı:**

- Container Apps'te uygulama günlükleri
- Korelasyon kimlikleri ile yapılandırılmış günlük kaydı
- Gerçek zamanlı ve geçmiş günlük görüntüleme

---

## 5.4 [Agent Değerlendirme](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Yerel Değerlendirme:**

- Kalite değerlendirmesi için yerleşik değerlendiriciler
- Özel değerlendirme betikleri
- Performans karşılaştırması

**Sürekli İzleme:**

- Canlı etkileşimlerin otomatik değerlendirmesi
- Kalite metriklerinin takibi
- Performans gerileme tespiti

**CI/CD Entegrasyonu:**

- GitHub Actions iş akışı
- Otomatik test ve değerlendirme
- İstatistiksel karşılaştırma testleri

---

## 5.5 [AI Güvenlik Tarama Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Güvenlik Tarama:**

- Otomatik güvenlik taraması
- AI sistemleri için risk değerlendirmesi
- Birden fazla kategori için güvenlik değerlendirmesi

**Kimlik Doğrulama:**

- Azure hizmetleri için Yönetilen Kimlik
- Opsiyonel Azure App Service kimlik doğrulaması
- Geliştirme için temel kimlik doğrulama yedekleme

!!! quote "BU LAB SONUNDA ŞUNLARI YAPMIŞ OLMALISINIZ"
    - [ ] Senaryo gereksinimlerinizi tanımladınız
    - [ ] Ortam değişkenlerini özelleştirdiniz (yapılandırma)
    - [ ] Agent talimatlarını özelleştirdiniz (görev)
    - [ ] Özelleştirilmiş şablonu dağıttınız (uygulama)
    - [ ] Dağıtım sonrası görevleri tamamladınız (manuel)
    - [ ] Bir test değerlendirmesi çalıştırdınız

Bu örnek, iki özel agent ve birden fazla model dağıtımı ile kurumsal perakende kullanım senaryosu için şablonun nasıl özelleştirileceğini göstermektedir.

---

## 5.6 Kendinize Göre Özelleştirin!

### 5.6.1. Senaryo Gereksinimleri

#### **Agent Dağıtımları:** 

   - Alışveriş Agent: Müşterilerin ürün bulmasına ve karşılaştırmasına yardımcı olur
   - Sadakat Agent: Müşteri ödüllerini ve promosyonları yönetir

#### **Model Dağıtımları:**

   - `gpt-4.1`: Ana sohbet modeli
   - `o3`: Karmaşık sorgular için akıl yürütme modeli
   - `gpt-4.1-nano`: Basit etkileşimler için hafif model
   - `text-embedding-3-large`: Arama için yüksek kaliteli gömme modeller

#### **Özellikler:**

   - İzleme ve takip etkinleştirildi
   - Ürün kataloğu için AI Arama
   - Kalite güvencesi için değerlendirme çerçevesi
   - Güvenlik doğrulaması için güvenlik taraması

---

### 5.6.2 Senaryo Uygulaması


#### 5.6.2.1. Dağıtım Öncesi Yapılandırma

Bir kurulum betiği oluşturun (`setup-retail.sh`)

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

#### 5.6.2.2: Agent Talimatları

`custom-agents/shopper-agent-instructions.md` oluşturun:

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

`custom-agents/loyalty-agent-instructions.md` oluşturun:

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

#### 5.6.2.3: Dağıtım Betiği

`deploy-retail.sh` oluşturun:

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

#### 5.6.2.4: Dağıtım Sonrası Yapılandırma

`configure-retail-agents.sh` oluşturun:

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

### 5.6.3: Test ve Doğrulama

`test-retail-deployment.sh` oluşturun:

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

### 5.6.4 Beklenen Sonuçlar

Bu uygulama kılavuzunu takip ettikten sonra şunlara sahip olacaksınız:

1. **Dağıtılmış Altyapı:**

      - Model dağıtımları ile AI Foundry projesi
      - Web uygulamasını barındıran Container Apps
      - Ürün kataloğu için AI Arama hizmeti
      - İzleme için Application Insights

2. **İlk Agent:**

      - Temel talimatlarla yapılandırılmış Alışveriş Agent
      - Dosya arama yetkinliği etkinleştirildi
      - İzleme ve takip yapılandırıldı

3. **Özelleştirmeye Hazır:**

      - Sadakat Agent eklemek için çerçeve
      - Özel talimat şablonları
      - Test ve doğrulama betikleri
      - İzleme ve değerlendirme kurulumu

4. **Üretim Hazırlığı:**

      - Güvenlik taraması ile güvenlik doğrulaması
      - Performans izleme
      - Kalite değerlendirme çerçevesi
      - Ölçeklenebilir mimari

Bu örnek, AZD şablonunun belirli kurumsal senaryolar için nasıl genişletilebileceğini ve özelleştirilebileceğini, güvenlik, izleme ve ölçeklenebilirlik için en iyi uygulamaları koruyarak göstermektedir.

---

