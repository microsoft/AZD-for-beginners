# סוכני AI עם Azure Developer CLI

**ניווט פרקים:**
- **📚 דף הקורס**: [AZD For Beginners](../../README.md)
- **📖 הפרק הנוכחי**: פרק 2 - פיתוח בראשוניות AI
- **⬅️ הקודם**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ הבא**: [Production AI Practices](production-ai-practices.md)
- **🚀 מתקדם**: [Multi-Agent Solutions](../../examples/retail-scenario.md)

---

## מבוא

סוכני AI הם תוכניות אוטונומיות היכולות לתפוס את הסביבה שלהן, לקבל החלטות ולבצע פעולות כדי להשיג מטרות מסוימות. בניגוד לצ'אטבוטים פשוטים המגיבים להנחיות, סוכנים יכולים:

- **להשתמש בכלים** - לקרוא ל-APIs, לחפש בבסיסי נתונים, להריץ קוד
- **לתכנן ולהסיק** - לפרק משימות מורכבות לצעדים
- **ללמוד מהקשר** - לשמור זיכרון ולהתאים התנהגות
- **לשתף פעולה** - לעבוד עם סוכנים אחרים (מערכות רב-סוכניות)

מדריך זה מראה כיצד לפרוס סוכני AI ל-Azure באמצעות Azure Developer CLI (azd).

## מטרות הלמידה

בסיום מדריך זה, תוכלו:
- להבין מה הם סוכני AI וכיצד הם שונים מצ'אטבוטים
- לפרוס תבניות סוכנים מוכנות מראש באמצעות AZD
- להגדיר Foundry Agents לסוכנים מותאמים
- ליישם דפוסי סוכן בסיסיים (שימוש בכלים, RAG, רב-סוכני)
- לנטר ולתקן באגים בסוכנים שהופרחו

## תוצאות למידה

עם השלמת המדריך, תוכלו:
- לפרוס אפליקציות סוכנים ל-Azure באמצעות פקודה אחת
- להגדיר כלים ויכולות סוכן
- ליישם Retrieval-Augmented Generation (RAG) עם סוכנים
- לתכנן ארכיטקטורות רב-סוכניות עבור תהליכים מורכבים
- לטפל בבעיות נפוצות בפריסת סוכנים

---

## 🤖 מה מבדיל סוכן מצ'אטבוט?

| תכונה | צ'אטבוט | סוכן AI |
|---------|---------|----------|
| **התנהגות** | מגיב להנחיות | מבצע פעולות אוטונומיות |
| **כלים** | אין | יכול לקרוא ל-APIs, לחפש, להריץ קוד |
| **זיכרון** | מבוסס מושב בלבד | זיכרון מתמשך בין מושבים |
| **תכנון** | תגובה יחידה | הסקת מסקנות רב-שלבית |
| **שיתוף פעולה** | ישות בודדת | יכול לעבוד עם סוכנים אחרים |

### אנלוגיה פשוטה

- **צ'אטבוט** = אדם מועיל שעונה על שאלות בדלפק מידע
- **סוכן AI** = עוזר אישי שיכול לבצע שיחות טלפון, לקבוע פגישות ולבצע משימות עבורך

---

## 🚀 התחלה מהירה: פרוס את הסוכן הראשון שלך

### אפשרות 1: תבנית Foundry Agents (מומלץ)

```bash
# אתחל את תבנית סוכני הבינה המלאכותית
azd init --template get-started-with-ai-agents

# פרוס ל-Azure
azd up
```

**מה שמותקן:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (ל-RAG)
- ✅ Azure Container Apps (ממשק ווב)
- ✅ Application Insights (ניטור)

**זמן:** ~15-20 דקות
**עלות:** ~$100-150/חודש (פיתוח)

### אפשרות 2: סוכן OpenAI עם Prompty

```bash
# אתחל את תבנית הסוכן המבוססת על Prompty
azd init --template agent-openai-python-prompty

# פרוס ל-Azure
azd up
```

**מה שמותקן:**
- ✅ Azure Functions (הפעלה ללא שרתים של הסוכן)
- ✅ Azure OpenAI
- ✅ קבצי תצורה של Prompty
- ✅ יישום סוכן לדוגמה

**זמן:** ~10-15 דקות
**עלות:** ~$50-100/חודש (פיתוח)

### אפשרות 3: סוכן צ'אט RAG

```bash
# אתחול תבנית שיחה של RAG
azd init --template azure-search-openai-demo

# פריסה ל-Azure
azd up
```

**מה שמותקן:**
- ✅ Azure OpenAI
- ✅ Azure AI Search עם נתוני דוגמה
- ✅ צינור עיבוד מסמכים
- ✅ ממשק צ'אט עם ציטוטים

**זמן:** ~15-25 דקות
**עלות:** ~$80-150/חודש (פיתוח)

---

## 🏗️ דפוסי ארכיטקטורת סוכנים

### תבנית 1: סוכן יחיד עם כלים

הדפוס הפשוט ביותר של סוכן - סוכן אחד שיכול להשתמש במספר כלים.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**מתאים במיוחד עבור:**
- בוטים לתמיכת לקוחות
- עוזרי מחקר
- סוכני ניתוח נתונים

**תבנית AZD:** `azure-search-openai-demo`

### תבנית 2: סוכן RAG (Retrieval-Augmented Generation)

סוכן שמבצע שליפת מסמכים רלוונטיים לפני יצירת תגובות.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**מתאים במיוחד עבור:**
- מאגרי ידע ארגוניים
- מערכות שאלות ותשובות למסמכים
- ציות ומחקר משפטי

**תבנית AZD:** `azure-search-openai-demo`

### תבנית 3: מערכת רב-סוכנית

מספר סוכנים ממוקדים שעובדים יחד על משימות מורכבות.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**מתאים במיוחד עבור:**
- יצירת תוכן מורכבת
- תהליכי עבודה רב-שלביים
- משימות המחייבות מומחיות שונה

**למידע נוסף:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ הגדרת כלים לסוכנים

סוכנים נהיים רבי-עוצמה כאשר הם יכולים להשתמש בכלים. הנה כיצד להגדיר כלים נפוצים:

### הגדרת כלים ב-Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# הגדר כלים מותאמים
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# צור סוכן עם כלים
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### הגדרת סביבה

```bash
# הגדר משתני סביבה ספציפיים לסוכן
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# פרוס עם תצורה מעודכנת
azd deploy
```

---

## 📊 ניטור סוכנים

### אינטגרציה עם Application Insights

כל תבניות ה-AZD לסוכנים כוללות Application Insights לניטור:

```bash
# פתח לוח בקרה לניטור
azd monitor --overview

# הצג לוגים בזמן אמת
azd monitor --logs

# הצג מדדים בזמן אמת
azd monitor --live
```

### מדדים מרכזיים למעקב

| מדד | תיאור | יעד |
|--------|-------------|--------|
| השהיית תגובה | זמן ליצירת תגובה | < 5 שניות |
| שימוש בטוקנים | טוקנים לכל בקשה | לניטור עבור עלות |
| אחוז הצלחת קריאות כלי | % של ביצועי כלי מוצלחים | > 95% |
| שיעור שגיאות | בקשות סוכן שנכשלו | < 1% |
| סיפוק משתמשים | ציוני משוב | > 4.0/5.0 |

### רישום מותאם אישית לסוכנים

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 שיקולי עלות

### עלויות חודשיות משוערות לפי דפוס

| תבנית | סביבה לפיתוח | ייצור |
|---------|-----------------|------------|
| סוכן יחיד | $50-100 | $200-500 |
| סוכן RAG | $80-150 | $300-800 |
| רב-סוכני (2-3 סוכנים) | $150-300 | $500-1,500 |
| רב-סוכני ארגוני | $300-500 | $1,500-5,000+ |

### טיפים לאופטימיזציה של עלויות

1. **השתמש ב-GPT-4o-mini למשימות פשוטות**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **יישם מטמון עבור שאילתות חוזרות**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **הגבל מגבלות טוקנים**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # הגבל את אורך התגובה
   )
   ```

4. **הרחב לאפס כאשר לא בשימוש**
   ```bash
   # Container Apps מדרגות בקנה מידה עד לאפס באופן אוטומטי
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 פתרון בעיות בסוכנים

### בעיות נפוצות ופתרונות

<details>
<summary><strong>❌ הסוכן אינו מגיב לקריאות לכלים</strong></summary>

```bash
# בדוק אם הכלים רשומים כראוי
azd show

# אמת את הפריסה של OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# בדוק יומני הסוכן
azd monitor --logs
```

**גורמים נפוצים:**
- אי-התאמה בין חתימת פונקציית הכלי
- חסרות הרשאות נדרשות
- נקודת הקצה של ה-API אינה נגישה
</details>

<details>
<summary><strong>❌ השהיה גבוהה בתגובות הסוכן</strong></summary>

```bash
# בדוק את Application Insights עבור צווארי בקבוק
azd monitor --live

# שקול להשתמש במודל מהיר יותר
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**טיפים לאופטימיזציה:**
- השתמש בתגובות בזרימה
- מימוש מטמון תגובות
- הקטנת גודל חלון ההקשר
</details>

<details>
<summary><strong>❌ הסוכן מחזיר מידע שגוי או מהולוסינציות</strong></summary>

```python
# לשפר באמצעות הוראות מערכת טובות יותר
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# הוסף שליפה לצורך עיגון
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # עגן תגובות במסמכים
)
```
</details>

<details>
<summary><strong>❌ חריגות ממגבלות טוקנים</strong></summary>

```python
# יישם ניהול חלון ההקשר
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # הערכה גסה
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 תרגולים מעשיים

### תרגיל 1: פרוס סוכן בסיסי (20 דקות)

**מטרה:** פרוס את סוכן ה-AI הראשון שלך באמצעות AZD

```bash
# שלב 1: אתחל את התבנית
azd init --template get-started-with-ai-agents

# שלב 2: התחבר ל-Azure
azd auth login

# שלב 3: פרוס
azd up

# שלב 4: בדוק את הסוכן
# פתח את ה-URL שמופיע בפלט

# שלב 5: נקה
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הסוכן מגיב על שאלות
- [ ] גישה ללוח הניטור זמינה
- [ ] המשאבים נקו בהצלחה

### תרגיל 2: הוסף כלי מותאם אישית (30 דקות)

**מטרה:** הרחב סוכן עם כלי מותאם אישית

1. פרוס את תבנית הסוכן
2. צור פונקציית כלי חדשה:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # קריאה ל-API של שירות מזג האוויר
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. רשם את הכלי עם הסוכן
4. בדוק שהסוכן משתמש בכלי החדש

**קריטריוני הצלחה:**
- [ ] הסוכן מזהה שאילתות הקשורות למזג אוויר
- [ ] הכלי נקרא כראוי
- [ ] התשובה כוללת מידע על מזג האוויר

### תרגיל 3: בנה סוכן RAG (45 דקות)

**מטרה:** צור סוכן שעונה על שאלות מהמסמכים שלך

```bash
# פרוס תבנית RAG
azd init --template azure-search-openai-demo
azd up

# העלה את המסמכים שלך
# (עקוב אחר מדריך קליטת הנתונים של התבנית)

# בדוק עם שאלות ספציפיות לתחום
```

**קריטריוני הצלחה:**
- [ ] הסוכן עונה ממסמכים שהועלו
- [ ] התשובות כוללות ציטוטים
- [ ] אין הזיות בשאלות מחוץ להיקף

---

## 📚 צעדים הבאים

כעת כשאתה מבין סוכני AI, חקור את הנושאים המתקדמים הללו:

| נושא | תיאור | קישור |
|-------|-------------|------|
| **מערכות רב-סוכניות** | בניית מערכות עם מספר סוכנים משתפי פעולה | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **דפוסי תיאום** | למד דפוסי תזמור ותקשורת | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **פריסה לייצור** | פריסת סוכן המותאמת לארגון | [Production AI Practices](production-ai-practices.md) |
| **הערכת סוכנים** | בדיקה והערכת ביצועי סוכן | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 משאבים נוספים

### תיעוד רשמי
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### תבניות AZD לסוכנים
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### משאבי קהילה
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**ניווט**
- **השיעור הקודם**: [AI Model Deployment](ai-model-deployment.md)
- **השיעור הבא**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אי-אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לשים לב שתרגומים אוטומטיים עלולים להכיל שגיאות או אי־דיוקים. יש לראות במסמך המקורי בשפתו את המקור הסמכותי. עבור מידע קריטי, מומלץ להיעזר בתרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי־הבנה או פרשנות מוטעית הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->