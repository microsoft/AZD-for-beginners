# 5. টেমপ্লেট কাস্টোমাইজ করুন

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] ডিফল্ট AI এজেন্ট ক্ষমতাসমূহ অন্বেষণ করেছেন
    - [ ] নিজের ইনডেক্স সহ AI Search যোগ করেছেন
    - [ ] ট্রেসিং মেট্রিক্স সক্রিয় ও বিশ্লেষণ করেছেন
    - [ ] একটি মূল্যায়ন রান কার্যকর করেছেন
    - [ ] একটি রেড-টিমিং স্ক্যান কার্যকর করেছেন
    - [ ] **ল্যাব ৫: একটি কাস্টোমাইজেশন পরিকল্পনা তৈরি করেছেন** 

---

## 5.1 AI এজেন্ট ক্ষমতাসমূহ

!!! success "আমরা এটি ল্যাব 01-এ শেষ করেছি"

- **ফাইল সার্চ**: জ্ঞানের পুনরুদ্ধারের জন্য OpenAI-এর ইন-বিল্ট ফাইল সার্চ
- **উত্স উদ্ধৃতি**: উত্তরগুলিতে স্বয়ংক্রিয় উৎস উল্লেখ
- **কাস্টোমাইজযোগ্য নির্দেশাবলী**: এজেন্টের আচরণ এবং ব্যক্তিত্ব পরিবর্তন করুন
- **টুল ইন্টিগ্রেশন**: কাস্টম ক্ষমতার জন্য বিস্তারণযোগ্য টুল সিস্টেম

---

## 5.2 Knowledge Retrieval Options

!!! task "এইটি সম্পন্ন করতে আমাদের পরিবর্তন করে পুনরায় ডেপ্লয় করতে হবে"    
    
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

- Foundry Agents-এ ইন-বিল্ট
- স্বয়ংক্রিয় ডকুমেন্ট প্রক্রিয়াকরণ এবং ইনডেক্সিং
- অতিরিক্ত কনফিগারেশন প্রয়োজন নেই

**Azure AI Search (Optional):**

- হাইব্রিড সেমান্টিক এবং ভেক্টর সার্চ
- কাস্টম ইনডেক্স ব্যবস্থাপনা
- উন্নত সার্চ ক্ষমতা
- এর জন্য প্রয়োজন `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ট্রেসিং ও মনিটরিং](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "এইটি সম্পন্ন করতে আমাদের পরিবর্তন করে পুনরায় ডেপ্লয় করতে হবে"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ট্রেসিং:**

- OpenTelemetry ইন্টিগ্রেশন
- অনুরোধ/প্রতিক্রিয়া ট্র্যাকিং
- পারফরম্যান্স মেট্রিক্স
- Microsoft Foundry পোর্টালে উপলব্ধ

**লগিং:**

- Container Apps-এ অ্যাপ্লিকেশন লগ
- কোরিলেশন ID সহ স্ট্রাকচার্ড লগিং
- রিয়েল-টাইম এবং ঐতিহাসিক লগ দেখার সুবিধা

---

## 5.4 [এজেন্ট মূল্যায়ন](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**লোকাল মূল্যায়ন:**

- গুণমান মূল্যায়নের জন্য ইন-বিল্ট ইভ্যালুয়েটর
- কাস্টম মূল্যায়ন স্ক্রিপ্ট
- পারফরম্যান্স বেঞ্চমার্কিং

**নিরবিচ্ছিন্ন মনিটরিং:**

- লাইভ ইন্টারঅ্যাকশনের স্বয়ংক্রিয় মূল্যায়ন
- গুণমান মেট্রিক্স ট্র্যাকিং
- পারফরম্যান্স রিগ্রেশনের সনাক্তকরণ

**CI/CD ইন্টিগ্রেশন:**

- GitHub Actions ওয়ার্কফ্লো
- স্বয়ংক্রিয় টেস্টিং ও মূল্যায়ন
- পরিসংখ্যানগত তুলনামূলক টেস্টিং

---

## 5.5 [AI রেড-টিমিং এজেন্ট](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI রেড টিমিং:**

- স্বয়ংক্রিয় সিকিউরিটি স্ক্যানিং
- AI সিস্টেমের জন্য ঝুঁকি মূল্যায়ন
- একাধিক শাখায় সুরক্ষা মূল্যায়ন

**প্রমাণীকরণ:**

- Azure সেবার জন্য Managed Identity
- ঐচ্ছিক Azure App Service প্রমাণীকরণ
- ডেভেলপমেন্টের জন্য Basic auth ব্যাকআপ



!!! quote "এই ল্যাবের শেষে আপনার কাছে থাকা উচিত"
    - [ ] আপনার সিনারিওর প্রয়োজনীয়তাগুলি নির্ধারণ করা
    - [ ] কাস্টোমাইজ করা env ভ্যারিয়েবল (config)
    - [ ] কাস্টোমাইজ করা এজেন্ট নির্দেশাবলী (task)
    - [ ] কাস্টোমাইজ করা টেমপ্লেট ডেপ্লয় করা হয়েছে (app)
    - [ ] পোস্ট-ডেপ্লয়মেন্ট টাস্ক সম্পন্ন করা হয়েছে (manual)
    - [ ] একটি টেস্ট মূল্যায়ন চালান

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 এটিকে আপনার জন্য কাস্টোমাইজ করুন!

### 5.6.1. সিনারিও প্রয়োজনীয়তা

#### **এজেন্ট ডেপ্লয়মেন্টস:** 

   - Shopper Agent: গ্রাহকদের পণ্য খুঁজে পেতে এবং তুলনা করতে সাহায্য করে
   - Loyalty Agent: গ্রাহকের রিওয়ার্ড এবং প্রমোশন পরিচালনা করে

#### **মডেল ডেপ্লয়মেন্টস:**

   - `gpt-4.1`: প্রধান চ্যাট মডেল
   - `o3`: জটিল প্রশ্নের জন্য রিজনিং মডেল
   - `gpt-4.1-nano`: সাধারণ ইন্টারঅ্যাকশনের জন্য হালকা মডেল
   - `text-embedding-3-large`: সার্চের জন্য উচ্চ-মানের এমবেডিং

#### **ফিচারসমূহ:**

   - ট্রেসিং এবং মনিটরিং সক্ষম করা হয়েছে
   - পণ্য তালিকার জন্য AI Search
   - গুণমান নিশ্চিতকরণের জন্য মূল্যায়ন ফ্রেমওয়ার্ক
   - সুরক্ষা যাচাইয়ের জন্য রেড টিমিং

---

### 5.6.2 সিনারিও বাস্তবায়ন


#### 5.6.2.1. প্রি-ডেপ্লয়মেন্ট কনফিগ

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# পরিবেশের নাম সেট করুন
azd env set AZURE_ENV_NAME "retail-ai-agents"

# অঞ্চল কনফিগার করুন (মডেল প্রাপ্যতার ভিত্তিতে নির্বাচন করুন)
azd env set AZURE_LOCATION "eastus2"

# সমস্ত ঐচ্ছিক পরিষেবা সক্রিয় করুন
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# প্রাথমিক চ্যাট মডেল কনফিগার করুন (gpt-4.1-এর সবচেয়ে নিকটস্থ উপলব্ধ বিকল্প হিসেবে gpt-4o)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# উন্নত অনুসন্ধানের জন্য এমবেডিং মডেল কনফিগার করুন
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# এজেন্টের নাম সেট করুন (প্রথম এজেন্ট তৈরি করবে)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# অনুসন্ধান সূচক কনফিগার করুন
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: এজেন্ট নির্দেশাবলী

তৈরি করুন `custom-agents/shopper-agent-instructions.md`:

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

তৈরি করুন `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: ডেপ্লয়মেন্ট স্ক্রিপ্ট

তৈরি করুন `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# প্রয়োজনীয়তা যাচাই করুন
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# পরিবেশ প্রস্তুত করুন
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# নির্বাচিত অঞ্চলে কোটা যাচাই করুন
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

# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন স্থাপন করুন
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ডিপ্লয়মেন্ট আউটপুট সংগ্রহ করুন
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ওয়েব অ্যাপের URL পান
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

#### 5.6.2.4: পোস্ট-ডেপ্লয়মেন্ট কনফিগ

তৈরি করুন `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ডিপ্লয়মেন্ট তথ্য পান
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# ম্যানুয়াল কনফিগারেশনের নির্দেশাবলী
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

### 5.6.3: টেস্টিং এবং ভ্যালিডেশন

তৈরি করুন `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# পরিবেশ ভেরিয়েবলগুলো সেট আছে কিনা যাচাই করুন
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ওয়েব অ্যাপ্লিকেশনের উপলব্ধতা পরীক্ষা করুন
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

# কনফিগার করা থাকলে মূল্যায়ন চালান
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

### 5.6.4 প্রত্যাশিত ফলাফল

এই বাস্তবায়ন গাইড অনুসরণ করার পরে, আপনার কাছে থাকবে:

1. **ডেপ্লয় করা অবকাঠামো:**

      - Microsoft Foundry প্রকল্প মডেল ডেপ্লয়মেন্টসহ
      - Container Apps-এ ওয়েব অ্যাপ্লিকেশন হোস্টিং
      - পণ্য তালিকার জন্য AI Search সার্ভিস
      - মনিটরিং-এর জন্য Application Insights

2. **প্রাথমিক এজেন্ট:**

      - Shopper Agent মৌলিক নির্দেশাবলীর সাথে কনফিগার করা হয়েছে
      - ফাইল সার্চ ক্ষমতা সক্ষম করা হয়েছে
      - ট্রেসিং ও মনিটরিং কনফিগার করা হয়েছে

3. **কাস্টোমাইজেশনের জন্য প্রস্তুত:**

      - Loyalty Agent যোগ করার ফ্রেমওয়ার্ক
      - কাস্টম নির্দেশ টেমপ্লেট
      - টেস্টিং ও ভ্যালিডেশন স্ক্রিপ্ট
      - মনিটরিং ও মূল্যায়ন সেটআপ

4. **প্রোডাকশন প্রস্তুতি:**

      - রেড টিমিং সহ সিকিউরিটি স্ক্যানিং
      - পারফরম্যান্স মনিটরিং
      - গুণমান মূল্যায়ন ফ্রেমওয়ার্ক
      - স্কেলেবল আর্কিটেকচার

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকারোক্তি:
এই দলিলটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অনিশ্চয়তা থাকতে পারে। মূল ভাষায় থাকা নথিকেই কর্তৃপক্ষসম্মত উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->