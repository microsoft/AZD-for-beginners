# 5. להתאמה אישית של תבנית

!!! tip "בסוף מודול זה תוכל/י"

    - [ ] לחקור את יכולות הסוכן המובנות
    - [ ] להוסיף חיפוש AI עם האינדקס האישי שלך
    - [ ] להפעלת וניתוח מדדי מעקב
    - [ ] לבצע הרצת הערכה
    - [ ] לבצע סריקת red-teaming
    - [ ] **מענה למעבדה 5: בניית תוכנית התאמה אישית** 

---

## 5.1 יכולות סוכן AI

!!! success "סיימנו זאת במעבדה 01"

- **חיפוש בקבצים**: חיפוש מובנה של OpenAI לשליפת ידע
- **אזכורים**: ייחוס אוטומטי למקורות בתגובות
- **הנחיות הניתנות להתאמה**: שינוי התנהגות ואישיות הסוכן
- **שילוב כלים**: מערכת כלים מתרחבת ליכולות מותאמות

---

## 5.2 אפשרויות שליפת ידע

!!! task "לסיום זה עלינו לבצע שינויים ולפרוס מחדש"    
    
    ```bash title=""
    # הגדרת משתני סביבה
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # העלאת נתונים ויצירת אינדקס שלי

    ```

---

**חיפוש בקבצים של OpenAI (בררת מחדל):**

- מובנה בסוכני Foundry
- עיבוד ואינדוקס אוטומטי של מסמכים
- אין צורך בקונפיגורציה נוספת

**חיפוש Azure AI (אופציונלי):**

- חיפוש סמנטי ווקטורי היברידי
- ניהול אינדקס מותאם אישית
- יכולות חיפוש מתקדמות
- דורש `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [מעקב ופיקוח](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "לסיום זה עלינו לבצע שינויים ולפרוס מחדש"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**מעקב:**

- שילוב OpenTelemetry
- מעקב בקשות/תגובות
- מדדי ביצועים
- זמין בפורטל Microsoft Foundry

**רישום:**

- יומני יישום ב-Container Apps
- רישום מובנה עם מזהי קורלציה
- צפייה ביומנים בזמן אמת והיסטורית

---

## 5.4 [הערכת סוכן](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**הערכה מקומית:**

- מעריכים מובנים להערכת איכות
- סקריפטים מותאמים להערכה
- מדידת ביצועים

**פיקוח מתמשך:**

- הערכה אוטומטית של אינטראקציות חיות
- מעקב אחר מדדי איכות
- זיהוי הידרדרות בביצועים

**שילוב CI/CD:**

- תזרים עבודה ב-GitHub Actions
- בדיקות והערכה אוטומטיות
- השוואת בדיקות סטטיסטית

---

## 5.5 [סוכן Red Teaming AI](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming AI:**

- סריקה אוטומטית לאבטחה
- הערכת סיכונים למערכות AI
- הערכת בטיחות במספר קטגוריות

**אימות:**

- זהות מנוהלת לשירותי Azure
- אימות אופציונלי לשירות האפליקציות של Azure
- אימות בסיסי כמנגנון גיבוי לפיתוח



!!! quote "בסוף מעבדה זו ייתכן שברשותך"
    - [ ] הגדרת דרישות התרחיש שלך
    - [ ] התאמת משתני סביבה (קונפיגורציה)
    - [ ] התאמת הנחיות הסוכן (משימה)
    - [ ] פריסת התבנית המותאמת (אפליקציה)
    - [ ] השלמת משימות לאחר הפריסה (ידני)
    - [ ] ביצוע הערכה לבחינה

דוגמה זו ממחישה התאמת תבנית עבור מקרה שימוש קמעונאי ארגוני עם שני סוכנים מיוחדים ופריסות מודלים מרובות.

---

## 5.6 התאמה אישית עבורך!

### 5.6.1. דרישות תרחיש

#### **פריסות סוכן:** 

   - סוכן קנייה: מסייע ללקוחות למצוא ולהשוות מוצרים
   - סוכן נאמנות: מנהל תגמולים ומבצעים ללקוחות

#### **פריסות מודל:**

   - `gpt-4.1`: מודל צ'אט ראשי
   - `o3`: מודל הסקת מסקנות לשאלות מורכבות
   - `gpt-4.1-nano`: מודל קל ללשוחח בפשטות
   - `text-embedding-3-large`: הטמעות איכותיות לחיפוש

#### **תכונות:**

   - מעקב ופיקוח מופעלים
   - חיפוש AI עבור קטלוג מוצרים
   - מסגרת הערכה לאבטחת איכות
   - Red teaming לאימות אבטחה

---

### 5.6.2 יישום התרחיש


#### 5.6.2.1. קונפיגורציה לפני פריסה

צור סקריפט הגדרה (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# הגדר שם סביבה
azd env set AZURE_ENV_NAME "retail-ai-agents"

# הגדר אזור (בחר לפי זמינות הדגם)
azd env set AZURE_LOCATION "eastus2"

# אפשר את כל השירותים האופציונליים
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# הגדר את דגם הצ'אט הראשי (gpt-4.1 כהכי קרוב ל-gpt-4.1 זמין)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# הגדר את דגם ההטמעה לחיפוש משופר
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

#### 5.6.2.2: הנחיות לסוכן

צור את הקובץ `custom-agents/shopper-agent-instructions.md`:

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

צור את הקובץ `custom-agents/loyalty-agent-instructions.md`:

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

צור את הקובץ `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# אימות דרישות מוקדמות
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# הגדרת הסביבה
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# בדוק את המכסה באזור הנבחר
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

# פריסה של התשתית והאפליקציה
echo "🏗️  Deploying Azure infrastructure..."
azd up

# איסוף פלט הפריסה
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# קבל את כתובת האתר של האפליקציה
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

#### 5.6.2.4: קונפיגורציה לאחר פריסה

צור את הקובץ `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# לקבלת מידע על פריסה
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

### 5.6.3: בדיקה ואימות

צור את הקובץ `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# אמת שהמשתני סביבה מוגדרים
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# בדוק זמינות יישום האינטרנט
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

לאחר ביצוע מדריך זה, יהיו לך:

1. **תשתית פרוסה:**

      - פרויקט Microsoft Foundry עם פריסות מודל
      - Container Apps המארחים את יישום האינטרנט
      - שירות AI Search עבור קטלוג מוצרים
      - Application Insights למעקב ופיקוח

2. **סוכן ראשוני:**

      - סוכן קנייה מוגדר עם הנחיות בסיסיות
      - יכולת חיפוש בקבצים מופעלת
      - מעקב ופיקוח מוגדרים

3. **מוכן להתאמה אישית:**

      - מסגרת להוספת סוכן נאמנות
      - תבניות הנחיות מותאמות
      - סקריפטים לבדיקה ואימות
      - הגדרת מעקב והערכה

4. **מוכנות לייצור:**

      - סריקת אבטחה עם red teaming
      - מעקב ביצועים
      - מסגרת הערכת איכות
      - ארכיטקטורה מתרחבת

דוגמה זו ממחישה כיצד תבנית AZD ניתנת להרחבה ולהתאמה לתרחישים ארגוניים ספציפיים תוך שמירה על שיטות עבודה מומלצות לאבטחה, מעקב והרחבה.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). על אף שאנו שואפים לדיוק, יש לשים לב כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפת המקור שלו הוא המקור המוסמך. למידע קריטי מומלץ שימוש בתרגום מקצועי על ידי אדם. איננו אחראים לכל הבנה שגויה או פרשנויות מוטעות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->