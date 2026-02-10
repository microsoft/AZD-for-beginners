# 5. להתאים תבנית אישית

!!! tip "בסוף המודול הזה תוכל"

    - [ ] לחקור את יכולות סוכן ה-AI המובנות
    - [ ] להוסיף חיפוש AI עם האינדקס שלך
    - [ ] להפעיל ולנתח מדדי מעקב
    - [ ] לבצע ריצת הערכה
    - [ ] להריץ סריקת red-teaming
    - [ ] **מעבדה 5: לבנות תוכנית התאמה אישית**

---

## 5.1 יכולות סוכן AI

!!! success "סיימנו זאת במעבדה 01"

- **חיפוש קבצים**: חיפוש קבצים מובנה של OpenAI לשחזור ידע
- **ציטוטים**: שיוך מקורות אוטומטי בתשובות
- **הוראות להתאמה אישית**: לשנות את התנהגות ואישיות הסוכן
- **אינטגרציה עם כלים**: מערכת כלים ניתנת להרחבה ליכולות מותאמות

---

## 5.2 אפשרויות שחזור ידע

!!! task "לסיום זה יש צורך בביצוע שינויים ופריסה מחדש"    
    
    ```bash title=""
    # הגדרת משתני סביבה
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # העלאת נתונים ויצירת האינדקס שלי

    ```

---

**חיפוש קבצים OpenAI (ברירת מחדל):**

- מובנה בסוכני Foundry
- עיבוד ואינדוקס מסמכים אוטומטי
- אין צורך בקונפיגורציה נוספת

**חיפוש Azure AI (אופציונלי):**

- חיפוש סמנטי והיברידי ומבוסס וקטורים
- ניהול אינדקס מותאם
- יכולות חיפוש מתקדמות
- דורש `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [מעקב וניטור](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "לסיום זה יש צורך בביצוע שינויים ופריסה מחדש"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**מעקב:**

- אינטגרציה עם OpenTelemetry
- מעקב כבקשה/תגובה
- מדדי ביצועים
- זמין בפורטל Microsoft Foundry

**רישום:**

- לוגים של האפליקציה ב-Container Apps
- רישום מובנה עם מזהי קורלציה
- צפייה בזמן אמת ובהיסטוריה

---

## 5.4 [הערכת סוכן](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**הערכה מקומית:**

- מעריכי איכות מובנים
- סקריפטים מותאמים להערכה
- מדידת ביצועים

**ניטור רציף:**

- הערכה אוטומטית של אינטראקציות בזמן אמת
- מעקב אחרי מדדי איכות
- זיהוי רגרסיות בביצועים

**אינטגרציה CI/CD:**

- תהליך ב-GitHub Actions
- בדיקות והערכות אוטומטיות
- בדיקות השוואה סטטיסטיות

---

## 5.5 [סוכן Red Teaming מבוסס AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming מבוסס AI:**

- סריקות אבטחה אוטומטיות
- הערכת סיכונים למערכות AI
- הערכת בטיחות במגוון קטגוריות

**אימות:**

- זהות מנוהלת לשירותי Azure
- אימות אופציונלי של Azure App Service
- אפשרות fallback של אימות בסיסי לפיתוח

!!! quote "בסוף המעבדה הזו עליך להיות"

    - [ ] הגדרת דרישות התסריט שלך
    - [ ] התאמת משתני סביבה (config)
    - [ ] התאמת הוראות הסוכן (task)
    - [ ] פריסת התבנית המותאמת (app)
    - [ ] השלמת משימות לאחר הפריסה (manual)
    - [ ] ריצת הערכה לבחינה

דוגמה זו מדגימה התאמת תבנית לשימוש קמעונאי ארגוני עם שני סוכנים מתמחים ופריסות מרובות של מודלים.

---

## 5.6 התאמה אישית עבורך!

### 5.6.1 דרישות התסריט

#### **פריסות סוכן:** 

   - סוכן קונה: מסייע ללקוחות למצוא ולהשוות מוצרים
   - סוכן נאמנות: מנהל פרסים ומבצעים ללקוחות

#### **פריסות מודל:**

   - `gpt-4.1`: מודל שיחה ראשי
   - `o3`: מודל לוגיקה לשאילתות מורכבות
   - `gpt-4.1-nano`: מודל קל משקל לאינטראקציות פשוטות
   - `text-embedding-3-large`: הטמעות איכותיות לחיפוש

#### **תכונות:**

   - מעקב וניטור מופעלים
   - חיפוש AI לקטלוג המוצרים
   - מסגרת הערכה לאבטחת איכות
   - Red teaming לאימות אבטחה

---

### 5.6.2 יישום התסריט

#### 5.6.2.1. קונפיגורציה לפני פריסה

צור סקריפט הגדרה (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# הגדר שם סביבה
azd env set AZURE_ENV_NAME "retail-ai-agents"

# הגדר אזור (בחר לפי זמינות המודל)
azd env set AZURE_LOCATION "eastus2"

# הפעל את כל השירותים האופציונליים
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# הגדר מודל צ'אט ראשי (gpt-4o כהכי קרוב זמין ל- gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# הגדר מודל הטמעה לשיפור החיפוש
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# הגדר שם סוכן (ייצור את הסוכן הראשון)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# הגדר אינדקס חיפוש
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: הוראות לסוכן

צור `custom-agents/shopper-agent-instructions.md`:

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

צור `custom-agents/loyalty-agent-instructions.md`:

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

#### 5.6.2.3: סקריפט פריסה

צור `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# אמת דרישות מוקדמות
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# הקם סביבה
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# בדוק מכסת משאבים באיזור שנבחר
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

# פרוס תשתית ויישום
echo "🏗️  Deploying Azure infrastructure..."
azd up

# תפוס פלט הפריסה
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# השג את כתובת ה-URL של אפליקציית האינטרנט
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

#### 5.6.2.4: קונפיגורציה לאחר פריסה

צור `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# קבל מידע על פריסות
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# הוראות לתצורה ידנית
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

### 5.6.3: בדיקות ואימות

צור `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# ודא שמשתני סביבה מוגדרים
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# בדוק את זמינות אפליקציית האינטרנט
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

# הרץ הערכה אם מוגדר
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

### 5.6.4 תוצאות צפויות

לאחר ביצוע המדריך הזה, יהיה לך:

1. **תשתית פרוסה:**

      - פרויקט Microsoft Foundry עם פריסות מודל
      - Container Apps המאכסנות את אפליקציית האינטרנט
      - שירות חיפוש AI עבור קטלוג המוצרים
      - Application Insights לניטור

2. **סוכן התחלתי:**

      - סוכן קונה מוגדר עם הוראות בסיסיות
      - יכולת חיפוש קבצים מופעלת
      - מעקב וניטור מוגדרים

3. **מוכן להתאמה אישית:**

      - מסגרת להוספת סוכן נאמנות
      - תבניות הוראות מותאמות אישית
      - סקריפטים לבדיקות ולאימות
      - הגדרת ניטור והערכה

4. **מוכנות לייצור:**

      - סריקות אבטחה עם red teaming
      - ניטור ביצועים
      - מסגרת הערכת איכות
      - אדריכלות מדרגתית

דוגמה זו מדגימה כיצד ניתן להרחיב ולהתאים אישית את תבנית AZD לתסריטים ארגוניים ספציפיים תוך שמירה על שיטות עבודה מומלצות לאבטחה, ניטור והרחבה.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הסכם אי-אחריות**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדייק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפתו המקורית נחשב למקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי של מתרגם אנושי. איננו אחראים לכל הבנה שגויה או פרשנות מוטעית הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->