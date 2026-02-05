# ৫. একটি টেমপ্লেট কাস্টমাইজ করুন

!!! tip "এই মডিউল শেষে আপনি সক্ষম হবেন"

    - [ ] ডিফল্ট AI এজেন্টের ক্ষমতাগুলি অন্বেষণ করেছেন
    - [ ] আপনার নিজস্ব ইনডেক্স সহ AI সার্চ যোগ করেছেন
    - [ ] ট্রেসিং মেট্রিকস সক্রিয় এবং বিশ্লেষণ করেছেন
    - [ ] একটি মূল্যায়ন রান সম্পন্ন করেছেন
    - [ ] একটি রেড-টিমিং স্ক্যান সম্পন্ন করেছেন
    - [ ] **ল্যাব ৫: একটি কাস্টমাইজেশন পরিকল্পনা তৈরি করেছেন** 

---

## ৫.১ AI এজেন্টের ক্ষমতাসমূহ

!!! success "আমরা এটি ল্যাব ০১-এ সম্পন্ন করেছি"

- **ফাইল সার্চ**: OpenAI-এর অন্তর্নির্মিত ফাইল সার্চ জ্ঞান পুনরুদ্ধারের জন্য
- **উদ্ধৃতি**: প্রতিক্রিয়াগুলিতে স্বয়ংক্রিয় উৎস উল্লেখ
- **কাস্টমাইজযোগ্য নির্দেশাবলী**: এজেন্টের আচরণ এবং ব্যক্তিত্ব পরিবর্তন করুন
- **টুল ইন্টিগ্রেশন**: কাস্টম ক্ষমতার জন্য সম্প্রসারণযোগ্য টুল সিস্টেম

---

## ৫.২ জ্ঞান পুনরুদ্ধারের বিকল্পসমূহ

!!! task "এটি সম্পন্ন করতে আমাদের পরিবর্তন করতে হবে এবং পুনরায় ডিপ্লয় করতে হবে"    
    
    ```bash title=""
    # পরিবেশ ভেরিয়েবল সেট করুন
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # ডেটা আপলোড করুন এবং আমার ইনডেক্স তৈরি করুন

    ```

---

**OpenAI ফাইল সার্চ (ডিফল্ট):**

- Azure AI এজেন্ট পরিষেবাতে অন্তর্ভুক্ত
- স্বয়ংক্রিয় ডকুমেন্ট প্রসেসিং এবং ইনডেক্সিং
- অতিরিক্ত কনফিগারেশন প্রয়োজন নেই

**Azure AI সার্চ (ঐচ্ছিক):**

- হাইব্রিড সেমান্টিক এবং ভেক্টর সার্চ
- কাস্টম ইনডেক্স ম্যানেজমেন্ট
- উন্নত সার্চ ক্ষমতা
- `USE_AZURE_AI_SEARCH_SERVICE=true` প্রয়োজন

---

## ৫.৩ [ট্রেসিং এবং মনিটরিং](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "এটি সম্পন্ন করতে আমাদের পরিবর্তন করতে হবে এবং পুনরায় ডিপ্লয় করতে হবে"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ট্রেসিং:**

- OpenTelemetry ইন্টিগ্রেশন
- অনুরোধ/প্রতিক্রিয়া ট্র্যাকিং
- পারফরম্যান্স মেট্রিকস
- AI Foundry পোর্টালে উপলব্ধ

**লগিং:**

- Container Apps-এ অ্যাপ্লিকেশন লগ
- সম্পর্কিত আইডি সহ কাঠামোগত লগিং
- রিয়েল-টাইম এবং ঐতিহাসিক লগ দেখার সুবিধা

---

## ৫.৪ [এজেন্ট মূল্যায়ন](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**লোকাল মূল্যায়ন:**

- গুণমান মূল্যায়নের জন্য অন্তর্নির্মিত ইভ্যালুয়েটর
- কাস্টম মূল্যায়ন স্ক্রিপ্ট
- পারফরম্যান্স বেঞ্চমার্কিং

**নিরবচ্ছিন্ন মনিটরিং:**

- লাইভ ইন্টারঅ্যাকশনের স্বয়ংক্রিয় মূল্যায়ন
- গুণমান মেট্রিকস ট্র্যাকিং
- পারফরম্যান্স রিগ্রেশন সনাক্তকরণ

**CI/CD ইন্টিগ্রেশন:**

- GitHub Actions ওয়ার্কফ্লো
- স্বয়ংক্রিয় টেস্টিং এবং মূল্যায়ন
- পরিসংখ্যানগত তুলনা পরীক্ষা

---

## ৫.৫ [AI রেড টিমিং এজেন্ট](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI রেড টিমিং:**

- স্বয়ংক্রিয় নিরাপত্তা স্ক্যানিং
- AI সিস্টেমের জন্য ঝুঁকি মূল্যায়ন
- একাধিক ক্যাটাগরিতে নিরাপত্তা মূল্যায়ন

**প্রমাণীকরণ:**

- Azure পরিষেবার জন্য ম্যানেজড আইডেন্টিটি
- ঐচ্ছিক Azure App Service প্রমাণীকরণ
- ডেভেলপমেন্টের জন্য বেসিক অথFallback

!!! quote "এই ল্যাব শেষে আপনার যা সম্পন্ন হবে"
    - [ ] আপনার দৃশ্যপটের প্রয়োজনীয়তা সংজ্ঞায়িত করেছেন
    - [ ] পরিবেশ ভেরিয়েবল কাস্টমাইজ করেছেন (কনফিগ)
    - [ ] এজেন্ট নির্দেশাবলী কাস্টমাইজ করেছেন (টাস্ক)
    - [ ] কাস্টমাইজড টেমপ্লেট ডিপ্লয় করেছেন (অ্যাপ)
    - [ ] ডিপ্লয়মেন্ট-পরবর্তী কাজ সম্পন্ন করেছেন (ম্যানুয়াল)
    - [ ] একটি টেস্ট মূল্যায়ন চালিয়েছেন

এই উদাহরণটি একটি এন্টারপ্রাইজ রিটেইল ব্যবহারের ক্ষেত্রে দুটি বিশেষায়িত এজেন্ট এবং একাধিক মডেল ডিপ্লয়মেন্ট সহ টেমপ্লেট কাস্টমাইজ করার প্রক্রিয়া প্রদর্শন করে।

---

## ৫.৬ এটি আপনার জন্য কাস্টমাইজ করুন!

### ৫.৬.১. দৃশ্যপটের প্রয়োজনীয়তা

#### **এজেন্ট ডিপ্লয়মেন্টস:** 

   - শপার এজেন্ট: গ্রাহকদের পণ্য খুঁজে পেতে এবং তুলনা করতে সাহায্য করে
   - লয়্যালটি এজেন্ট: গ্রাহকের পুরস্কার এবং প্রচার পরিচালনা করে

#### **মডেল ডিপ্লয়মেন্টস:**

   - `gpt-4.1`: প্রাথমিক চ্যাট মডেল
   - `o3`: জটিল প্রশ্নের জন্য রিজনিং মডেল
   - `gpt-4.1-nano`: সাধারণ ইন্টারঅ্যাকশনের জন্য হালকা মডেল
   - `text-embedding-3-large`: সার্চের জন্য উচ্চ-গুণমানের এমবেডিং

#### **বৈশিষ্ট্যসমূহ:**

   - ট্রেসিং এবং মনিটরিং সক্রিয়
   - পণ্য ক্যাটালগের জন্য AI সার্চ
   - গুণমান নিশ্চিতকরণের জন্য মূল্যায়ন কাঠামো
   - নিরাপত্তা যাচাইয়ের জন্য রেড টিমিং

---

### ৫.৬.২ দৃশ্যপট বাস্তবায়ন

#### ৫.৬.২.১. প্রি-ডিপ্লয়মেন্ট কনফিগ

`setup-retail.sh` নামে একটি সেটআপ স্ক্রিপ্ট তৈরি করুন

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

#### ৫.৬.২.২: এজেন্ট নির্দেশাবলী

`custom-agents/shopper-agent-instructions.md` তৈরি করুন:

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

`custom-agents/loyalty-agent-instructions.md` তৈরি করুন:

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

#### ৫.৬.২.৩: ডিপ্লয়মেন্ট স্ক্রিপ্ট

`deploy-retail.sh` তৈরি করুন:

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

#### ৫.৬.২.৪: পোস্ট-ডিপ্লয়মেন্ট কনফিগ

`configure-retail-agents.sh` তৈরি করুন:

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

### ৫.৬.৩: টেস্টিং এবং যাচাই

`test-retail-deployment.sh` তৈরি করুন:

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

### ৫.৬.৪ প্রত্যাশিত ফলাফল

এই বাস্তবায়ন নির্দেশিকা অনুসরণ করার পরে, আপনার থাকবে:

1. **ডিপ্লয়ড অবকাঠামো:**

      - মডেল ডিপ্লয়মেন্ট সহ AI Foundry প্রকল্প
      - ওয়েব অ্যাপ্লিকেশন হোস্ট করার জন্য Container Apps
      - পণ্য ক্যাটালগের জন্য AI সার্চ পরিষেবা
      - মনিটরিংয়ের জন্য Application Insights

2. **প্রাথমিক এজেন্ট:**

      - শপার এজেন্ট প্রাথমিক নির্দেশাবলী সহ কনফিগার করা
      - ফাইল সার্চ ক্ষমতা সক্রিয়
      - ট্রেসিং এবং মনিটরিং কনফিগার করা

3. **কাস্টমাইজেশনের জন্য প্রস্তুত:**

      - লয়্যালটি এজেন্ট যোগ করার কাঠামো
      - কাস্টম নির্দেশাবলীর টেমপ্লেট
      - টেস্টিং এবং যাচাই স্ক্রিপ্ট
      - মনিটরিং এবং মূল্যায়ন সেটআপ

4. **প্রোডাকশন প্রস্তুতি:**

      - রেড টিমিং সহ নিরাপত্তা স্ক্যানিং
      - পারফরম্যান্স মনিটরিং
      - গুণমান মূল্যায়ন কাঠামো
      - স্কেলযোগ্য আর্কিটেকচার

এই উদাহরণটি দেখায় কিভাবে AZD টেমপ্লেট নির্দিষ্ট এন্টারপ্রাইজ দৃশ্যপটের জন্য প্রসারিত এবং কাস্টমাইজ করা যায়, নিরাপত্তা, মনিটরিং এবং স্কেলেবিলিটির জন্য সেরা অনুশীলন বজায় রেখে।

---

