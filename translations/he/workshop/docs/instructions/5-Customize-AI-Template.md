# 5. להתאים תבנית

!!! tip "בסוף מודול זה תוכל"

    - [ ] לחקור את יכולות סוכני ה-AI ברירת המחדל
    - [ ] להוסיף חיפוש AI עם האינדקס שלך
    - [ ] להפעיל ולנתח מדדי מעקב
    - [ ] לבצע ריצת הערכה
    - [ ] לבצע סריקת red-teaming
    - [ ] **מעבדה 5: בנה תוכנית התאמה אישית**

---

## 5.1 יכולות סוכן ה-AI

!!! success "השלים זאת במעבדה 01"

- **חיפוש קבצים**: חיפוש קבצים מובנה של OpenAI לשחזור ידע
- **אזכורים**: שיוך מקור אוטומטי בתגובות
- **הוראות מותאמות אישית**: שינוי התנהגות ואישיות הסוכן
- **אינטגרציה עם כלים**: מערכת כלים ניתנת להרחבה ליכולות מותאמות אישית

---

## 5.2 אפשרויות שחזור ידע

!!! task "לסיום נדרש לבצע שינויים ולפרוס מחדש"    
    
    ```bash title=""
    # הגדר משתני סביבה
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # העלה נתונים ויצר את האינדקס שלי

    ```

---

**חיפוש קבצים של OpenAI (ברירת מחדל):**

- מובנה בסוכני Foundry
- עיבוד ואינדוקס מסמכים אוטומטי
- לא נדרש קונפיגורציה נוספת

**חיפוש AI של Azure (אופציונלי):**

- חיפוש סמנטי והיברידי וקטורי
- ניהול אינדקסים מותאם
- יכולות חיפוש מתקדמות
- דורש `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [מעקב וניטור](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "לסיום נדרש לבצע שינויים ולפרוס מחדש"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**מעקב:**

- אינטגרציה עם OpenTelemetry
- מעקב אחר בקשות/תגובות
- מדדי ביצועים
- זמינים בפורטל Microsoft Foundry

**רישום:**

- לוגים של אפליקציות ב-Container Apps
- רישום מובנה עם מזהי קורלציה
- צפייה בלוג בזמן אמת ובהיסטוריה

---

## 5.4 [הערכת סוכן](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**הערכה מקומית:**

- מעריכי איכות מובנים
- סקריפטים מותאמים להערכה
- מדידת ביצועים

**ניטור רציף:**

- הערכה אוטומטית של אינטראקציות חיות
- מעקב אחר מדדי איכות
- גילוי רגרסיות ביצועים

**אינטגרציה CI/CD:**

- תהליך עבודה של GitHub Actions
- בדיקות והערכות אוטומטיות
- בדיקות השוואה סטטיסטיות

---

## 5.5 [סוכן Red Teaming של AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming של AI:**

- סריקה אוטומטית לאבטחה
- הערכת סיכונים למערכות AI
- הערכת בטיחות במגוון קטגוריות

**אימות:**

- זהות מנוהלת לשירותי Azure
- אימות אופציונלי ל-Azure App Service
- אפשרות אימות בסיסית לפיתוח

!!! quote "בסוף מעבדה זו אמור להיות לך"
    - [ ] הגדרת את דרישות התרחיש שלך
    - [ ] התאמת משתני סביבה (קונפיגורציה)
    - [ ] התאמת הוראות הסוכן (משימה)
    - [ ] פרסת את התבנית המותאמת (אפליקציה)
    - [ ] השלמת פעולות לאחר פריסה (ידני)
    - [ ] ביצעת ריצת בדיקה והערכה

דוגמה זו ממחישה התאמת תבנית לשימוש ארגוני קמעונאי עם שני סוכנים מתמחים ופריסות רבות של מודלים.

---

## 5.6 להתאים עבורך!

### 5.6.1 דרישות התרחיש

#### **פריסות סוכן:** 

   - סוכן לקוח: עוזר ללקוחות למצוא ולהשוות מוצרים
   - סוכן נאמנות: מנהל תגמולים ומבצעים ללקוחות

#### **פריסות מודלים:**

   - `gpt-4.1`: מודל שיחה ראשי
   - `o3`: מודל הסקה לשאילתות מורכבות
   - `gpt-4.1-nano`: מודל קל לאינטראקציות פשוטות
   - `text-embedding-3-large`: אמבדינג איכותי לחיפוש

#### **תכונות:**

   - מעקב וניטור מופעלים
   - חיפוש AI עבור קטלוג המוצרים
   - מסגרת הערכה לאבטחת איכות
   - Red teaming לאימות אבטחה

---

### 5.6.2 מימוש התרחיש


#### 5.6.2.1. הגדרת קדם-פריסה

צור סקריפט התקנה (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# קבע שם סביבה
azd env set AZURE_ENV_NAME "retail-ai-agents"

# הגדר אזור (בחר בהתבסס על זמינות דגם)
azd env set AZURE_LOCATION "eastus2"

# הפעל את כל השירותים האופציונליים
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# הגדר דגם שיחה ראשי (gpt-4.1 כהדגם הזמין הקרוב ביותר ל-gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# הגדר דגם הטמעה לשיפור החיפוש
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# קבע שם סוכן (ייצור את הסוכן הראשון)
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

# הגדר סביבה
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# בדוק מכסת משאבים באזור הנבחר
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

# פרוס תשתית ויישום
echo "🏗️  Deploying Azure infrastructure..."
azd up

# הקלט פלט פריסה
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# קבל את כתובת ה-URL של אפליקציית האינטרנט
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

# השגת מידע על פריסת המערכת
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# הוראות להגדרה ידנית
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

# אמת שקיימות משתני סביבה
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# בדוק את זמינות יישום האינטרנט
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

# הפעל הערכה אם מוגדר
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

לאחר ביצוע מדריך מימוש זה, יהיו לך:

1. **תשתיות פרוסות:**

      - פרויקט Microsoft Foundry עם פריסות מודל
      - Container Apps לאירוח אפליקציית ווב
      - שירות AI Search לקטלוג המוצרים
      - Application Insights לניטור

2. **סוכן ראשוני:**

      - סוכן קונה מוגדר עם הוראות בסיסיות
      - יכולת חיפוש קבצים מופעלת
      - מעקב וניטור מוגדרים

3. **מוכן להתאמה:**

      - מסגרת להוספת סוכן נאמנות
      - תבניות הוראות מותאמות אישית
      - סקריפטים לבדיקה ואימות
      - הגדרות ניטור והערכה

4. **מוכנות לייצור:**

      - סריקת אבטחה עם red teaming
      - ניטור ביצועים
      - מסגרת הערכת איכות
      - ארכיטקטורה סקאלבילית

דוגמה זו ממחישה כיצד ניתן להרחיב ולהתאים אישית את תבנית AZD לתרחישים ארגוניים ספציפיים תוך שמירה על שיטות עבודה מומלצות לאבטחה, ניטור וסקלאביליות.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתירגומים אוטומטיים עלולים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית נחשב למקור הסמכותי. עבור מידע קריטי מומלץ לבצע תרגום מקצועי על ידי אדם. אנו לא נושאים באחריות לכל אי הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->