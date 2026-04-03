# 5. একটি টেম্পলেট কাস্টমাইজ করুন

!!! tip "এই মডিউলের শেষে আপনি সক্ষম হবেন"

    - [ ] ডিফল্ট এআই এজেন্ট সক্ষমতা অন্বেষণ করেছেন
    - [ ] আপনার নিজস্ব ইনডেক্স সহ এআই সার্চ যোগ করেছেন
    - [ ] ট্রেসিং মেট্রিক্স সক্রিয় ও বিশ্লেষণ করেছেন
    - [ ] একটি মূল্যায়ন রান চালিয়েছেন
    - [ ] একটি রেড-টিমিং স্ক্যান সম্পন্ন করেছেন
    - [ ] **ল্যাব 5: একটি কাস্টমাইজেশন পরিকল্পনা তৈরি করেছেন** 

---

## 5.1 AI এজেন্ট সক্ষমতা

!!! success "আমরা এটি ল্যাব ০১ এ সম্পন্ন করেছি"

- **ফাইল সার্চ**: জ্ঞান আহরণে OpenAI এর বিল্ট-ইন ফাইল সার্চ
- **উদ্ধৃতি**: প্রতিক্রিয়ায় স্বয়ংক্রিয় উৎস উল্লেখ
- **কাস্টমাইজেবল নির্দেশাবলী**: এজেন্টের আচরণ এবং ব্যক্তিত্ব পরিবর্তন করুন
- **সরঞ্জাম সংযোজন**: কাস্টম সক্ষমতার জন্য সম্প্রসারিত টুল সিস্টেম

---

## 5.2 জ্ঞান আহরণের বিকল্প

!!! task "এটি সম্পন্ন করতে আমাদের পরিবর্তন করতে হবে এবং পুনঃবিন্যাস করতে হবে"    
    
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

- Foundry এজেন্টগুলোর বিল্ট-ইন
- স্বয়ংক্রিয় ডকুমেন্ট প্রক্রিয়াজাতকরণ এবং ইনডেক্সিং
- অতিরিক্ত কনফিগারেশন প্রয়োজন নেই

**Azure AI সার্চ (ঐচ্ছিক):**

- হাইব্রিড সেমান্টিক এবং ভেক্টর সার্চ
- কাস্টম ইনডেক্স ব্যবস্থাপনা
- উন্নত সার্চ সক্ষমতা
- প্রয়োজন `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [ট্রেসিং ও মনিটরিং](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "এটি সম্পন্ন করতে আমাদের পরিবর্তন করতে হবে এবং পুনঃবিন্যাস করতে হবে"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**ট্রেসিং:**

- OpenTelemetry সংযুক্তি
- অনুরোধ/প্রতিক্রিয়া ট্র্যাকিং
- কর্মক্ষমতা মেট্রিক্স
- Microsoft Foundry পোর্টালে উপলব্ধ

**লগিং:**

- Container Apps এ অ্যাপ্লিকেশন লগসমূহ
- সম্পর্কযুক্ত আইডি সহ কাঠামোবদ্ধ লগিং
- রিয়েল-টাইম এবং ঐতিহাসিক লগ দেখা

---

## 5.4 [এজেন্ট মূল্যায়ন](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**স্থানীয় মূল্যায়ন:**

- গুণগত মান যাচাইয়ের জন্য বিল্ট-ইন মূল্যায়ক
- কাস্টম মূল্যায়ন স্ক্রিপ্ট
- কর্মক্ষমতা বেঞ্চমার্কিং

**অবিচ্ছিন্ন মনিটরিং:**

- সরাসরি ইন্টারঅ্যাকশনের স্বয়ংক্রিয় মূল্যায়ন
- গুণমান মেট্রিক্স ট্র্যাকিং
- কর্মক্ষমতা হ্রাস সনাক্তকরণ

**CI/CD সংহতি:**

- GitHub Actions ওয়ার্কফ্লো
- স্বয়ংক্রিয় পরীক্ষা ও মূল্যায়ন
- পরিসংখ্যানগত তুলনা পরীক্ষা

---

## 5.5 [এআই রেড টিমিং এজেন্ট](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**এআই রেড টিমিং:**

- স্বয়ংক্রিয় সুরক্ষা স্ক্যানিং
- এআই সিস্টেমের ঝুঁকি মূল্যায়ন
- একাধিক বিভাগে নিরাপত্তা মূল্যায়ন

**প্রমাণীকরণ:**

- Azure সার্ভিসের জন্য ম্যানেজড আইডেন্টিটি
- ঐচ্ছিক Azure App Service প্রমাণীকরণ
- উন্নয়নের জন্য বেসিক অথ ফ্যালব্যাক

!!! quote "এই ল্যাবের শেষে আপনার উচিত হবে"
    - [ ] আপনার পরিস্থিতির প্রয়োজনীয়তা সংজ্ঞায়িত করা
    - [ ] কাস্টমাইজড env ভেরিয়েবল (কনফিগ)
    - [ ] কাস্টমাইজড এজেন্ট নির্দেশাবলী (টাস্ক)
    - [ ] কাস্টমাইজড টেম্পলেট ডিপ্লয় করা (অ্যাপ)
    - [ ] পোস্ট-ডিপ্লয়মেন্ট টাস্ক সম্পন্ন (ম্যানুয়াল)
    - [ ] একটি পরীক্ষা মূল্যায়ন চালানো

এই উদাহরণটিতে একটি এন্টারপ্রাইজ রিটেইল ব্যবহার কেসের জন্য দুটি বিশেষায়িত এজেন্ট এবং একাধিক মডেল ডিপ্লয়মেন্ট সহ টেম্পলেট কাস্টমাইজ করার উপায় দেখানো হয়েছে।

---

## 5.6 আপনার জন্য কাস্টমাইজ করুন!

### 5.6.1. পরিস্থিতির প্রয়োজনীয়তা

#### **এজেন্ট ডিপ্লয়মেন্ট:**

   - শপার এজেন্ট: গ্রাহকদের পণ্য খুঁজে পেতে এবং তুলনা করতে সাহায্য করে
   - লয়্যালটি এজেন্ট: গ্রাহক পুরস্কার ও প্রচারণা পরিচালনা করে

#### **মডেল ডিপ্লয়মেন্ট:**

   - `gpt-4.1`: প্রাথমিক চ্যাট মডেল
   - `o3`: জটিল প্রশ্নের জন্য রিজনিং মডেল
   - `gpt-4.1-nano`: সহজ ইন্টারঅ্যাকশনের জন্য হালকা মডেল
   - `text-embedding-3-large`: সার্চের জন্য উচ্চ-মানের এম্বেডিং

#### **বৈশিষ্ট্য:**

   - ট্রেসিং এবং মনিটরিং সক্রিয়
   - পণ্য ক্যাটালগের জন্য AI সার্চ
   - গুণগত নিশ্চয়তার জন্য মূল্যায়ন ফ্রেমওয়ার্ক
   - সুরক্ষা যাচাইয়ের জন্য রেড টিমিং

---

### 5.6.2 পরিস্থিতি বাস্তবায়ন


#### 5.6.2.1. পূর্ব-ডিপ্লয়মেন্ট কনফিগ

একটি সেটআপ স্ক্রিপ্ট তৈরি করুন (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# পরিবেশের নাম সেট করুন
azd env set AZURE_ENV_NAME "retail-ai-agents"

# অঞ্চল কনফিগার করুন (মডেলের প্রাপ্যতার উপর ভিত্তি করে নির্বাচন করুন)
azd env set AZURE_LOCATION "eastus2"

# সকল ঐচ্ছিক সেবা চালু করুন
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# প্রাথমিক চ্যাট মডেল কনফিগার করুন (gpt-4.1 হিসাবে gpt-4.1 এর সবচেয়ে নিকটবর্তী)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
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

#### 5.6.2.3: ডিপ্লয়মেন্ট স্ক্রিপ্ট

`deploy-retail.sh` তৈরি করুন:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# পূর্বশর্ত যাচাই করুন
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# পরিবেশ সেট আপ করুন
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# নির্বাচিত অঞ্চলে কোটা পরীক্ষা করুন
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

# অবকাঠামো এবং অ্যাপ্লিকেশন ডিপ্লয় করুন
echo "🏗️  Deploying Azure infrastructure..."
azd up

# ডিপ্লয়মেন্ট আউটপুট ক্যাপচার করুন
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# ওয়েব অ্যাপের URL পান
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

#### 5.6.2.4: পোস্ট-ডিপ্লয়মেন্ট কনফিগ

`configure-retail-agents.sh` তৈরি করুন:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# ডিপ্লয়মেন্ট সম্পর্কিত তথ্য পান
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# ম্যানুয়াল কনফিগারেশনের নির্দেশনা
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

### 5.6.3: পরীক্ষা ও যাচাই

`test-retail-deployment.sh` তৈরি করুন:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# পরিবেশ চলকগুলি সেট করা হয়েছে কিনা যাচাই করুন
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# ওয়েব অ্যাপ্লিকেশনটির উপলব্ধতা পরীক্ষা করুন
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

এই বাস্তবায়ন গাইড অনুসরণ করার পর, আপনার কাছে থাকবে:

1. **ডিপ্লয়ড অবকাঠামো:**

      - মডেল ডিপ্লয়মেন্টের সাথে Microsoft Foundry প্রকল্প
      - ওয়েব অ্যাপ্লিকেশন হোস্টিংয়ের জন্য Container Apps
      - পণ্য ক্যাটালগের জন্য AI সার্চ সার্ভিস
      - মনিটরিংয়ের জন্য Application Insights

2. **প্রাথমিক এজেন্ট:**

      - মৌলিক নির্দেশাবলীর সাথে কনফিগার্ড শপার এজেন্ট
      - ফাইল সার্চ সক্ষম করা হয়েছে
      - ট্রেসিং ও মনিটরিং কনফিগার করা হয়েছে

3. **কাস্টমাইজেশনের জন্য প্রস্তুত:**

      - লয়্যালটি এজেন্ট যোগ করার ফ্রেমওয়ার্ক
      - কাস্টম নির্দেশনা টেম্পলেট
      - পরীক্ষা ও যাচাই স্ক্রিপ্ট
      - মনিটরিং এবং মূল্যায়ন সেটআপ

4. **প্রোডাকশন প্রস্তুত:**

      - রেড টিমিং সহ সুরক্ষা স্ক্যানিং
      - কর্মক্ষমতা মনিটরিং
      - গুণগত মূল্যায়ন ফ্রেমওয়ার্ক
      - স্কেলেবল আর্কিটেকচার

এই উদাহরণটি দেখায় কিভাবে AZD টেম্পলেটটি বিশেষ এন্টারপ্রাইজ পরিস্থিতির জন্য বিস্তার ও কাস্টমাইজ করা যেতে পারে যখন সুরক্ষা, মনিটরিং এবং স্কেলেবিলিটির জন্য সেরা অনুশীলনগুলি বজায় থাকে।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকারোক্তি**:  
এই ডকুমেন্টটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতার জন্য চেষ্টা করি, অনুগ্রহ করে জেনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা মূল ডকুমেন্টটিকেই প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদের পরামর্শ দেওয়া হয়। এই অনুবাদের ব্যবহারে যে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->