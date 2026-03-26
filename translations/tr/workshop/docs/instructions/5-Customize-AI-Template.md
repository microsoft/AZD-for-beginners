# 5. Bir Şablonu Özelleştirme

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] Varsayılan AI Ajan Yeteneklerini incelediniz
    - [ ] Kendi indeksinizle AI Arama eklediniz
    - [ ] İzleme (Tracing) metriklerini etkinleştirdiniz ve analiz ettiniz
    - [ ] Bir değerlendirme çalıştırması gerçekleştirdiniz
    - [ ] Bir red-teaming taraması gerçekleştirdiniz
    - [ ] **Lab 5: Özelleştirme Planı Oluşturdu** 

---

## 5.1 AI Ajan Yetenekleri

!!! success "Bunu Lab 01'de tamamladık"

- **Dosya Araması**: Bilgi edinimi için OpenAI'nin yerleşik dosya araması
- **Atıflar**: Yanıtlarda otomatik kaynak gösterimi
- **Özelleştirilebilir Talimatlar**: Ajan davranışı ve kişiliğini değiştirin
- **Araç Entegrasyonu**: Özelleştirilmiş yetenekler için genişletilebilir araç sistemi

---

## 5.2 Bilgi Getirme Seçenekleri

!!! task "Bunu tamamlamak için değişiklikler yapıp yeniden dağıtım yapmamız gerekiyor"    
    
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

**OpenAI Dosya Araması (Varsayılan):**

- Foundry Ajanlarına entegre
- Otomatik belge işleme ve indeksleme
- Ek yapılandırma gerekmez

**Azure AI Search (İsteğe Bağlı):**

- Hibrit anlamsal ve vektör arama
- Özel indeks yönetimi
- Gelişmiş arama yetenekleri
- Gerektirir `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [İzleme & Monitörleme](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Bunu tamamlamak için değişiklikler yapıp yeniden dağıtım yapmamız gerekiyor"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**İzleme (Tracing):**

- OpenTelemetry entegrasyonu
- İstek/yanıt takibi
- Performans metrikleri
- Microsoft Foundry portalında mevcut

**Günlükleme (Logging):**

- Container Apps'te uygulama günlükleri
- Korelasyon ID'leri ile yapılandırılmış günlükleme
- Gerçek zamanlı ve geçmişe dönük günlük görüntüleme

---

## 5.4 [Ajan Değerlendirmesi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Yerel Değerlendirme:**

- Kalite değerlendirmesi için yerleşik değerlendiriciler
- Özel değerlendirme betikleri
- Performans kıyaslaması

**Sürekli İzleme:**

- Canlı etkileşimlerin otomatik değerlendirilmesi
- Kalite metriklerinin takibi
- Performans gerilemesi tespiti

**CI/CD Entegrasyonu:**

- GitHub Actions iş akışı
- Otomatik test ve değerlendirme
- İstatistiksel karşılaştırma testi

---

## 5.5 [AI Red Teaming Ajanı](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- Otomatik güvenlik taraması
- AI sistemleri için risk değerlendirmesi
- Birden çok kategoride güvenlik değerlendirmesi

**Kimlik Doğrulama:**

- Azure hizmetleri için Yönetilen Kimlik
- İsteğe bağlı Azure App Service kimlik doğrulaması
- Geliştirme için temel kimlik doğrulama (basic auth) yedek seçeneği



!!! quote "BU LABIN SONUNDA ŞUNLARA SAHİP OLMALISINIZ"
    - [ ] Senaryo gereksinimlerinizi tanımladınız
    - [ ] Ortam değişkenlerini (config) özelleştirdiniz
    - [ ] Ajan talimatlarını (görev) özelleştirdiniz
    - [ ] Özelleştirilmiş şablonu dağıttınız (app)
    - [ ] Dağıtım sonrası görevleri tamamladınız (manuel)
    - [ ] Bir test değerlendirmesi çalıştırdınız

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Kendiniz İçin Özelleştirin!

### 5.6.1. Senaryo Gereksinimleri

#### **Ajan Dağıtımları:** 

   - Shopper Agent: Müşterilerin ürünleri bulmasına ve karşılaştırmasına yardımcı olur
   - Loyalty Agent: Müşteri ödüllerini ve promosyonlarını yönetir

#### **Model Dağıtımları:**

   - `gpt-4.1`: Birincil sohbet modeli
   - `o3`: Karmaşık sorgular için akıl yürütme modeli
   - `gpt-4.1-nano`: Basit etkileşimler için hafif model
   - `text-embedding-3-large`: Arama için yüksek kaliteli gömme vektörleri

#### **Özellikler:**

   - İzleme ve monitörleme etkinleştirildi
   - Ürün kataloğu için AI Arama
   - Kalite güvencesi için değerlendirme çerçevesi
   - Güvenlik doğrulaması için red teaming

---

### 5.6.2 Senaryo Uygulaması


#### 5.6.2.1. Dağıtım Öncesi Yapılandırma

Bir kurulum betiği oluşturun (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Ortam adını ayarla
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Bölgeyi yapılandır (modelin kullanılabilirliğine göre seç)
azd env set AZURE_LOCATION "eastus2"

# Tüm isteğe bağlı hizmetleri etkinleştir
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Birincil sohbet modelini yapılandır (gpt-4.1, gpt-4.1'e en yakın mevcut olan)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Geliştirilmiş arama için embedding modelini yapılandır
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Ajan adını ayarla (ilk ajanı oluşturacak)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Arama dizinini yapılandır
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Ajan Talimatları

Oluşturun `custom-agents/shopper-agent-instructions.md`:

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

Oluşturun `custom-agents/loyalty-agent-instructions.md`:

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

Oluşturun `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Ön koşulları doğrulayın
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Ortamı ayarlayın
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Seçilen bölgedeki kotayı kontrol edin
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

# Altyapıyı ve uygulamayı dağıtın
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Dağıtım çıktılarını alın
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Web uygulamasının URL'sini alın
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

#### 5.6.2.4: Dağıtım Sonrası Yapılandırma

Oluşturun `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Dağıtım bilgilerini al
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Manuel yapılandırma için talimatlar
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

### 5.6.3: Test ve Doğrulama

Oluşturun `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Ortam değişkenlerinin ayarlı olduğunu doğrulayın
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Web uygulamasının kullanılabilirliğini test edin
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

# Yapılandırıldıysa değerlendirmeyi çalıştırın
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

### 5.6.4 Beklenen Sonuçlar

Bu uygulama kılavuzunu izledikten sonra şunlara sahip olacaksınız:

1. **Dağıtılmış Altyapı:**

      - Microsoft Foundry projesi ile model dağıtımları
      - Web uygulamasını barındıran Container Apps
      - Ürün kataloğu için AI Search servisi
      - İzleme için Application Insights

2. **İlk Ajan:**

      - Temel talimatlarla yapılandırılmış Shopper Agent
      - Dosya arama yeteneği etkin
      - İzleme ve monitörleme yapılandırıldı

3. **Özelleştirmeye Hazır:**

      - Loyalty Agent eklemek için çerçeve
      - Özel talimat şablonları
      - Test ve doğrulama betikleri
      - İzleme ve değerlendirme kurulumu

4. **Prodüksiyon Hazırlığı:**

      - Red teaming ile güvenlik taraması
      - Performans izleme
      - Kalite değerlendirme çerçevesi
      - Ölçeklenebilir mimari

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkan herhangi bir yanlış anlaşılma veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->