# יישום צ'אט של Azure OpenAI

**מסלול לימוד:** בינוני ⭐⭐ | **זמן:** 35-45 דקות | **עלות:** $50-200 לחודש

יישום צ'אט מלא של Azure OpenAI המופעל באמצעות Azure Developer CLI (azd). דוגמה זו מדגימה פריסת GPT-4, גישה מאובטחת ל-API וממשק צ'אט פשוט.

## 🎯 מה תלמדו

- לפרוס את שירות Azure OpenAI עם מודל GPT-4  
- לאבטח מפתחות API של OpenAI באמצעות Key Vault  
- לבנות ממשק צ'אט פשוט עם Python  
- לנטר שימוש בטוקנים ועלויות  
- ליישם הגבלת קצב וטיפול בשגיאות  

## 📦 מה כלול

✅ **שירות Azure OpenAI** - פריסת מודל GPT-4  
✅ **אפליקציית צ'אט ב-Python** - ממשק צ'אט פשוט בשורת הפקודה  
✅ **אינטגרציה עם Key Vault** - אחסון מאובטח של מפתחות API  
✅ **תבניות ARM** - תשתית מלאה כקוד  
✅ **מעקב עלויות** - ניטור שימוש בטוקנים  
✅ **הגבלת קצב** - מניעת ניצול יתר של מכסה  

## ארכיטקטורה

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## דרישות מקדימות

### נדרש

- **Azure Developer CLI (azd)** - [מדריך התקנה](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **מנוי Azure** עם גישה ל-OpenAI - [בקשת גישה](https://aka.ms/oai/access)  
- **Python 3.9+** - [התקנת Python](https://www.python.org/downloads/)  

### אימות דרישות מקדימות

```bash
# בדוק גרסת azd (צריך 1.5.0 או גבוה יותר)
azd version

# אמת כניסה ל-Azure
azd auth login

# בדוק גרסת Python
python --version  # או python3 --version

# אמת גישה ל-OpenAI (בדוק בפורטל Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ חשוב:** שירות Azure OpenAI דורש אישור יישום. אם לא הגשתם בקשה, בקרו ב-[aka.ms/oai/access](https://aka.ms/oai/access). אישור בדרך כלל לוקח 1-2 ימי עסקים.

## ⏱️ ציר זמן לפריסה

| שלב | משך זמן | מה קורה |
|-----|----------|---------|
| בדיקת דרישות מקדימות | 2-3 דקות | אימות זמינות מכסת OpenAI |
| פריסת תשתית | 8-12 דקות | יצירת OpenAI, Key Vault, פריסת מודל |
| הגדרת יישום | 2-3 דקות | הגדרת סביבה ותלויות |
| **סה"כ** | **12-18 דקות** | מוכן לצ'אט עם GPT-4 |

**הערה:** פריסת OpenAI ראשונה עשויה לקחת זמן רב יותר עקב הקצאת מודל.

## התחלה מהירה

```bash
# נווט לדוגמה
cd examples/azure-openai-chat

# אתחל את הסביבה
azd env new myopenai

# פרוס הכל (תשתית + תצורה)
azd up
# תתבקש:
# 1. לבחור מנוי Azure
# 2. לבחור מיקום עם זמינות OpenAI (לדוגמה, eastus, eastus2, westus)
# 3. להמתין 12-18 דקות לפריסה

# התקן תלותים של Python
pip install -r requirements.txt

# התחל לשוחח!
python chat.py
```

**פלט צפוי:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ אימות פריסה

### שלב 1: בדיקת משאבי Azure

```bash
# הצג משאבים שהופעלו
azd show

# הפלט הצפוי מציג:
# - שירות OpenAI: (שם המשאב)
# - Key Vault: (שם המשאב)
# - פריסה: gpt-4
# - מיקום: eastus (או האזור שנבחר)
```

### שלב 2: בדיקת API של OpenAI

```bash
# קבל נקודת קצה ומפתח של OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# בדוק קריאת API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**תגובה צפויה:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### שלב 3: אימות גישה ל-Key Vault

```bash
# רשימת סודות בכספת מפתחות
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**סודות צפויים:**
- `openai-api-key`  
- `openai-endpoint`  

**קריטריוני הצלחה:**
- ✅ שירות OpenAI נפרס עם GPT-4  
- ✅ קריאת API מחזירה השלמה תקינה  
- ✅ סודות נשמרים ב-Key Vault  
- ✅ מעקב שימוש בטוקנים עובד  

## מבנה הפרויקט

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## תכונות יישום

### ממשק צ'אט (`chat.py`)

אפליקציית הצ'אט כוללת:

- **היסטוריית שיחה** - שומרת הקשר בין הודעות  
- **ספירת טוקנים** - מנטרת שימוש ומעריכה עלויות  
- **טיפול בשגיאות** - טיפול אלגנטי במגבלות קצב ושגיאות API  
- **הערכת עלויות** - חישוב עלויות בזמן אמת לכל הודעה  
- **תמיכה בזרימה** - תגובות זורמות אופציונליות  

### פקודות

בזמן הצ'אט, ניתן להשתמש ב:
- `quit` או `exit` - סיום השיחה  
- `clear` - ניקוי היסטוריית השיחה  
- `tokens` - הצגת סך הטוקנים שנעשה בהם שימוש  
- `cost` - הצגת הערכת עלות כוללת  

### הגדרות (`config.py`)

טוען הגדרות מתוך משתני סביבה:
```python
AZURE_OPENAI_ENDPOINT  # מ-Key Vault
AZURE_OPENAI_API_KEY   # מ-Key Vault
AZURE_OPENAI_MODEL     # ברירת מחדל: gpt-4
AZURE_OPENAI_MAX_TOKENS # ברירת מחדל: 800
```

## דוגמאות שימוש

### צ'אט בסיסי

```bash
python chat.py
```

### צ'אט עם מודל מותאם אישית

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### צ'אט עם זרימה

```bash
python chat.py --stream
```

### שיחה לדוגמה

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## ניהול עלויות

### תמחור טוקנים (GPT-4)

| מודל | קלט (ל-1K טוקנים) | פלט (ל-1K טוקנים) |
|------|--------------------|--------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### עלויות חודשיות משוערות

בהתבסס על דפוסי שימוש:

| רמת שימוש | הודעות/יום | טוקנים/יום | עלות חודשית |
|-----------|------------|------------|-------------|
| **קל** | 20 הודעות | 3,000 טוקנים | $3-5 |
| **בינוני** | 100 הודעות | 15,000 טוקנים | $15-25 |
| **כבד** | 500 הודעות | 75,000 טוקנים | $75-125 |

**עלות תשתית בסיסית:** $1-2 לחודש (Key Vault + מחשוב מינימלי)

### טיפים לאופטימיזציה עלויות

```bash
# 1. השתמש ב-GPT-3.5-Turbo למשימות פשוטות (זול פי 20)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. צמצם את מספר הטוקנים המרבי לתגובות קצרות יותר
export AZURE_OPENAI_MAX_TOKENS=400

# 3. עקוב אחר שימוש בטוקנים
python chat.py --show-tokens

# 4. הגדר התראות תקציב
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## ניטור

### צפייה בשימוש בטוקנים

```bash
# בפורטל Azure:
# משאב OpenAI → מדדים → בחר "עסקת אסימונים"

# או דרך Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### צפייה ביומני API

```bash
# זרם יומני אבחון
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# יומני שאילתה
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## פתרון בעיות

### בעיה: שגיאת "Access Denied"

**תסמינים:** 403 Forbidden בעת קריאת API

**פתרונות:**
```bash
# 1. ודא שהגישה ל-OpenAI מאושרת
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. בדוק שהמפתח API נכון
azd env get-value AZURE_OPENAI_API_KEY

# 3. ודא את פורמט כתובת ה-URL של נקודת הקצה
azd env get-value AZURE_OPENAI_ENDPOINT
# צריך להיות: https://[name].openai.azure.com/
```

### בעיה: "Rate Limit Exceeded"

**תסמינים:** 429 Too Many Requests

**פתרונות:**
```bash
# 1. בדוק את המכסה הנוכחית
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. בקש הגדלת מכסה (אם נדרש)
# עבור לפורטל Azure → משאב OpenAI → מכסות → בקש הגדלה

# 3. יישם לוגיקת ניסיון חוזר (כבר ב-chat.py)
# היישום מנסה שוב באופן אוטומטי עם backoff אקספוננציאלי
```

### בעיה: "Model Not Found"

**תסמינים:** שגיאת 404 עבור פריסה

**פתרונות:**
```bash
# 1. רשימת פריסות זמינות
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. אימות שם המודל בסביבה
echo $AZURE_OPENAI_MODEL

# 3. עדכון לשם הפריסה הנכון
export AZURE_OPENAI_MODEL=gpt-4  # או gpt-35-turbo
```

### בעיה: זמן תגובה גבוה

**תסמינים:** זמני תגובה איטיים (>5 שניות)

**פתרונות:**
```bash
# בדוק את זמן ההשהיה האזורי
# פרוס לאזור הקרוב ביותר למשתמשים

# צמצם את max_tokens לתגובות מהירות יותר
export AZURE_OPENAI_MAX_TOKENS=400

# השתמש בסטרימינג לחוויית משתמש טובה יותר
python chat.py --stream
```

## שיטות אבטחה מומלצות

### 1. הגנה על מפתחות API

```bash
# לעולם אל תתחייב מפתחות לבקרת גרסאות
# השתמש בכספת מפתחות (כבר מוגדר)

# סובב מפתחות באופן קבוע
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. יישום סינון תוכן

```python
# Azure OpenAI כולל סינון תוכן מובנה
# הגדר בפורטל Azure:
# משאב OpenAI → מסנני תוכן → צור מסנן מותאם אישית

# קטגוריות: שנאה, מיני, אלימות, פגיעה עצמית
# רמות: סינון נמוך, בינוני, גבוה
```

### 3. שימוש בזהות מנוהלת (Production)

```bash
# לפריסות ייצור, השתמש בזהות מנוהלת
# במקום מפתחות API (דורש אירוח אפליקציה ב-Azure)

# עדכן infra/openai.bicep לכלול:
# identity: { type: 'SystemAssigned' }
```

## פיתוח

### הפעלה מקומית

```bash
# התקן תלותים
pip install -r src/requirements.txt

# הגדר משתני סביבה
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# הפעל את היישום
python src/chat.py
```

### הרצת בדיקות

```bash
# התקן תלותים לבדיקות
pip install pytest pytest-cov

# הפעל בדיקות
pytest tests/ -v

# עם כיסוי
pytest tests/ --cov=src --cov-report=html
```

### עדכון פריסת מודל

```bash
# פרוס גרסה שונה של מודל
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## ניקוי

```bash
# מחק את כל משאבי Azure
azd down --force --purge

# זה מסיר:
# - שירות OpenAI
# - Key Vault (עם מחיקה רכה ל-90 יום)
# - קבוצת משאבים
# - כל הפריסות וההגדרות
```

## צעדים הבאים

### הרחבת דוגמה זו

1. **הוספת ממשק אינטרנט** - בניית ממשק קדמי ב-React/Vue  
   ```bash
   # הוסף שירות חזיתי ל-azure.yaml
   # פרוס ל-Azure Static Web Apps
   ```

2. **יישום RAG** - הוספת חיפוש מסמכים עם Azure AI Search  
   ```python
   # לשלב את Azure Cognitive Search
   # להעלות מסמכים וליצור אינדקס וקטורי
   ```

3. **הוספת קריאת פונקציות** - הפעלת שימוש בכלים  
   ```python
   # להגדיר פונקציות ב-chat.py
   # לאפשר ל-GPT-4 לקרוא APIs חיצוניים
   ```

4. **תמיכה בריבוי מודלים** - פריסת מספר מודלים  
   ```bash
   # הוסף gpt-35-turbo, מודלים של הטמעות
   # יישם לוגיקת ניתוב מודלים
   ```

### דוגמאות קשורות

- **[Multi-Agent Retail](../retail-scenario.md)** - ארכיטקטורת סוכנים מתקדמת  
- **[Database App](../../../../examples/database-app)** - הוספת אחסון מתמשך  
- **[Container Apps](../../../../examples/container-app)** - פריסה כשירות מבוסס קונטיינרים  

### משאבי לימוד

- 📚 [קורס AZD למתחילים](../../README.md) - דף הבית של הקורס  
- 📚 [תיעוד Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - תיעוד רשמי  
- 📚 [תיעוד API של OpenAI](https://platform.openai.com/docs/api-reference) - פרטי API  
- 📚 [AI אחראי](https://www.microsoft.com/ai/responsible-ai) - שיטות עבודה מומלצות  

## משאבים נוספים

### תיעוד
- **[שירות Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - מדריך מלא  
- **[מודלים GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - יכולות מודל  
- **[סינון תוכן](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - תכונות בטיחות  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - עזרי azd  

### מדריכים
- **[התחלה מהירה עם OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - פריסה ראשונה  
- **[השלמות צ'אט](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - בניית אפליקציות צ'אט  
- **[קריאת פונקציות](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - תכונות מתקדמות  

### כלים
- **[Azure OpenAI Studio](https://oai.azure.com/)** - סביבת עבודה מבוססת אינטרנט  
- **[מדריך הנדסת פרומפטים](https://platform.openai.com/docs/guides/prompt-engineering)** - כתיבת פרומפטים טובים יותר  
- **[מחשבון טוקנים](https://platform.openai.com/tokenizer)** - הערכת שימוש בטוקנים  

### קהילה
- **[Azure AI Discord](https://discord.gg/azure)** - קבלת עזרה מהקהילה  
- **[דיונים ב-GitHub](https://github.com/Azure-Samples/openai/discussions)** - פורום שאלות ותשובות  
- **[בלוג Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - עדכונים אחרונים  

---

**🎉 הצלחה!** פרסתם את Azure OpenAI ובניתם אפליקציית צ'אט עובדת. התחילו לחקור את יכולות GPT-4 והתנסו בפרומפטים ושימושים שונים.

**שאלות?** [פתחו בעיה](https://github.com/microsoft/AZD-for-beginners/issues) או בדקו את [שאלות נפוצות](../../resources/faq.md)

**התראה על עלויות:** זכרו להריץ `azd down` בסיום הבדיקות כדי להימנע מחיובים מתמשכים (~$50-100 לחודש עבור שימוש פעיל).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->