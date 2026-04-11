# 5. Customize a Template

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] สำรวจความสามารถของ AI Agent เริ่มต้น
    - [ ] เพิ่ม AI Search ด้วยดัชนีของคุณเอง
    - [ ] เปิดใช้งานและวิเคราะห์เมตริก Tracing
    - [ ] ดำเนินการรันประเมินผล
    - [ ] ดำเนินการสแกน red-teaming
    - [ ] **แลป 5: สร้างแผนการปรับแต่ง** 

---

## 5.1 AI Agent Capabilities

!!! success "เราทำเสร็จเรียบร้อยในแลป 01"

- **File Search**: การค้นหาไฟล์ในตัวของ OpenAI เพื่อดึงความรู้
- **Citations**: การอ้างอิงแหล่งข้อมูลอัตโนมัติในคำตอบ
- **Customizable Instructions**: ปรับแต่งพฤติกรรมและบุคลิกภาพของเอเจนต์
- **Tool Integration**: ระบบเครื่องมือที่ขยายได้สำหรับความสามารถเฉพาะ

---

## 5.2 Knowledge Retrieval Options

!!! task "เพื่อทำให้เสร็จ เราต้องทำการเปลี่ยนแปลงและดีพลอยใหม่"    
    
    ```bash title=""
    # กำหนดตัวแปรสภาพแวดล้อม
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # อัปโหลดข้อมูลและสร้างดัชนีของฉัน

    ```

---

**OpenAI File Search (ค่าเริ่มต้น):**

- ถูกฝังใน Foundry Agents
- การประมวลผลเอกสารและการทำดัชนีอัตโนมัติ
- ไม่ต้องการการตั้งค่าเพิ่มเติม

**Azure AI Search (ตัวเลือกเสริม):**

- การค้นหาผสมผสานระหว่างความหมายและเวกเตอร์
- การจัดการดัชนีแบบกำหนดเอง
- ความสามารถการค้นหาขั้นสูง
- ต้องการ `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Tracing & Monitoring](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "เพื่อทำให้เสร็จ เราต้องทำการเปลี่ยนแปลงและดีพลอยใหม่"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Tracing:**

- การบูรณาการ OpenTelemetry
- การติดตามคำขอ/การตอบสนอง
- เมตริกประสิทธิภาพ
- ใช้งานได้ในพอร์ทัล Microsoft Foundry

**Logging:**

- บันทึกแอปพลิเคชันใน Container Apps
- บันทึกแบบมีโครงสร้างพร้อมรหัสเชื่อมโยง
- ดูบันทึกแบบเรียลไทม์และย้อนหลัง

---

## 5.4 [Agent Evaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Local Evaluation:**

- ตัวประเมินในตัวสำหรับการประเมินคุณภาพ
- สคริปต์ประเมินผลแบบกำหนดเอง
- การวัดเปรียบเทียบประสิทธิภาพ

**Continuous Monitoring:**

- การประเมินอัตโนมัติของการโต้ตอบแบบสด
- การติดตามเมตริกคุณภาพ
- ตรวจจับการถดถอยของประสิทธิภาพ

**CI/CD Integration:**

- workflow ของ GitHub Actions
- การทดสอบและประเมินผลอัตโนมัติ
- การทดสอบเปรียบเทียบทางสถิติ

---

## 5.5 [AI Red Teaming Agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI Red Teaming:**

- การสแกนความปลอดภัยอัตโนมัติ
- การประเมินความเสี่ยงสำหรับระบบ AI
- การประเมินความปลอดภัยในหลายหมวดหมู่

**Authentication:**

- Managed Identity สำหรับบริการ Azure
- การพิสูจน์ตัวตน Azure App Service แบบเลือกใช้ได้
- การยืนยันตัวตนแบบ basic auth สำหรับการพัฒนา



!!! quote "BY THE END OF THIS LAB YOU SHOULD HAVE"
    - [ ] กำหนดความต้องการของสถานการณ์ของคุณ
    - [ ] ปรับแต่งตัวแปรสภาพแวดล้อม (config)
    - [ ] ปรับแต่งคำสั่งเอเจนต์ (task)
    - [ ] ดีพลอยเท็มเพลตที่ปรับแต่งแล้ว (app)
    - [ ] ทำงานหลังการดีพลอยเสร็จ (manual)
    - [ ] รันทดสอบประเมินผล

ตัวอย่างนี้แสดงการปรับแต่งเท็มเพลตสำหรับกรณีใช้งานค้าปลีกองค์กรด้วยเอเจนต์เฉพาะสองตัวและการดีพลอยโมเดลหลายชุด

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: ช่วยลูกค้าค้นหาและเปรียบเทียบสินค้า
   - Loyalty Agent: จัดการรางวัลและโปรโมชั่นลูกค้า

#### **Model Deployments:**

   - `gpt-4.1`: โมเดลแชทหลัก
   - `o3`: โมเดลเหตุผลสำหรับคำถามซับซ้อน
   - `gpt-4.1-nano`: โมเดลน้ำหนักเบาสำหรับการโต้ตอบง่าย ๆ
   - `text-embedding-3-large`: embeddings คุณภาพสูงสำหรับการค้นหา

#### **Features:**

   - เปิดใช้งาน tracing และ monitoring
   - AI Search สำหรับแคตตาล็อกสินค้า
   - กรอบการประเมินคุณภาพ
   - Red teaming สำหรับการตรวจสอบความปลอดภัย

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

สร้างสคริปต์ตั้งค่า (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# ตั้งชื่อสภาพแวดล้อม
azd env set AZURE_ENV_NAME "retail-ai-agents"

# กำหนดภูมิภาค (เลือกตามความพร้อมใช้งานของโมเดล)
azd env set AZURE_LOCATION "eastus2"

# เปิดใช้งานบริการเสริมทั้งหมด
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# กำหนดโมเดลแชทหลัก (gpt-4.1 เป็นรุ่นที่ใกล้เคียงที่สุดกับ gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# กำหนดโมเดลฝังตัวเพื่อการค้นหาที่ดีขึ้น
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# ตั้งชื่อเอเย่นต์ (จะสร้างเอเย่นต์ตัวแรก)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# กำหนดดัชนีการค้นหา
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

สร้าง `custom-agents/shopper-agent-instructions.md`:

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

สร้าง `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: Deployment Script

สร้าง `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# ตรวจสอบข้อกำหนดเบื้องต้น
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# ตั้งค่าสภาพแวดล้อม
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# ตรวจสอบโควต้าในภูมิภาคที่เลือก
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

# ติดตั้งโครงสร้างพื้นฐานและแอปพลิเคชัน
echo "🏗️  Deploying Azure infrastructure..."
azd up

# จับผลลัพธ์การติดตั้ง
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# รับ URL ของเว็บแอป
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')

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

#### 5.6.2.4: Post-Deployment Config

สร้าง `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# รับข้อมูลการปรับใช้
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# คำแนะนำสำหรับการตั้งค่าด้วยตนเอง
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

### 5.6.3: Testing and Validation

สร้าง `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ตรวจสอบว่าตัวแปรแวดล้อมถูกตั้งค่าแล้ว
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ทดสอบการเข้าถึงเว็บแอปพลิเคชัน
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')
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

# รันการประเมินผลหากมีการตั้งค่าไว้
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

### 5.6.4 Expected Outcomes

หลังจากทำตามคำแนะนำนี้ คุณจะมี:

1. **โครงสร้างพื้นฐานที่ดีพลอยแล้ว:**

      - โครงการ Microsoft Foundry พร้อมการดีพลอยโมเดล
      - Container Apps ที่โฮสต์เว็บแอปพลิเคชัน
      - บริการ AI Search สำหรับแคตตาล็อกสินค้า
      - Application Insights สำหรับการมอนิเตอร์

2. **เอเจนต์เริ่มต้น:**

      - Shopper Agent ที่ตั้งค่าด้วยคำสั่งพื้นฐาน
      - ความสามารถการค้นหาไฟล์เปิดใช้งานแล้ว
      - การตั้งค่า tracing และ monitoring

3. **พร้อมสำหรับการปรับแต่ง:**

      - เฟรมเวิร์กสำหรับเพิ่ม Loyalty Agent
      - เท็มเพลตคำสั่งปรับแต่งได้
      - สคริปต์ทดสอบและตรวจสอบ
      - การตั้งค่ามอนิเตอร์และประเมินผล

4. **พร้อมสำหรับการใช้งานจริง:**

      - การสแกนความปลอดภัยด้วย red teaming
      - การมอนิเตอร์ประสิทธิภาพ
      - กรอบการประเมินคุณภาพ
      - สถาปัตยกรรมที่ปรับขนาดได้

ตัวอย่างนี้แสดงให้เห็นว่าการขยายและปรับแต่งเท็มเพลต AZD สำหรับสถานการณ์องค์กรเฉพาะได้อย่างไร ในขณะเดียวกันยังคงรักษาการปฏิบัติที่ดีที่สุดด้านความปลอดภัย การมอนิเตอร์ และความสามารถในการปรับขนาดไว้ได้

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความแม่นยำ โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->