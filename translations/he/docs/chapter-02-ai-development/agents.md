# סוכני בינה מלאכותית עם Azure Developer CLI

**ניווט בפרק:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 2 - פיתוח עם חשיבה ראשונה על בינה מלאכותית
- **⬅️ קודם**: [אינטגרציית Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ הבא**: [פריסת מודל בינה מלאכותית](ai-model-deployment.md)
- **🚀 מתקדם**: [פתרונות מרובי סוכנים](../../examples/retail-scenario.md)

---

## מבוא

סוכני בינה מלאכותית הם תוכניות אוטונומיות שיכולות לתפוס את סביבתן, לקבל החלטות ולנקוט פעולות להשגת מטרות ספציפיות. בניגוד לצ'טבוטים פשוטים המגיבים לפקודות, לסוכנים יש יכולות של:

- **שימוש בכלים** - קריאת API, חיפוש בבסיסי נתונים, ביצוע קוד
- **תכנון ונימוקים** - לפרק משימות מורכבות לשלבים
- **למידה מהקשר** - לשמור זיכרון ולהתאים התנהגות
- **שיתוף פעולה** - לעבוד עם סוכנים אחרים (מערכות מרובי סוכנים)

מדריך זה מראה לך כיצד לפרוס סוכני בינה מלאכותית ב-Azure באמצעות Azure Developer CLI (azd).

## מטרות למידה

בסיום מדריך זה תוכל:
- להבין מה הם סוכני בינה מלאכותית ואיך הם שונים מצ'טבוטים
- לפרוס תבניות סוכנים מוכנות מראש באמצעות AZD
- להגדיר סוכני Foundry לסוכנים מותאמים אישית
- ליישם דפוסי סוכנים בסיסיים (שימוש בכלים, RAG, מרובי סוכנים)
- לנטר ולתקן באגים בסוכנים שפורסמו

## תוצאות למידה

בסיום, תוכל:
- לפרוס יישומי סוכני בינה מלאכותית ל-Azure באמצעות פקודה אחת
- להגדיר כלים ויכולות לסוכנים
- ליישם יצירת תוכן משודרג משאילה (RAG) עם סוכנים
- לתכנן ארכיטקטורות מרובות סוכנים עבור תהליכי עבודה מורכבים
- לפתור בעיות נפוצות בפריסת סוכנים

---

## 🤖 מה מייחד סוכן מצ'טבוט?

| תכונה | צ'טבוט | סוכן AI |
|---------|---------|----------|
| **התנהגות** | מגיב לפקודות | נוקט פעולות אוטונומיות |
| **כלים** | אין | יכול לקרוא API, לחפש, להריץ קוד |
| **זיכרון** | מבוסס מפגש בלבד | זיכרון מתמשך בין מפגשים |
| **תכנון** | תגובה בודדת | נימוקים רב-שלביים |
| **שיתוף פעולה** | יחידה אחת | יכול לעבוד עם סוכנים אחרים |

### אנלוגיה פשוטה

- **צ'טבוט** = אדם עוזר שעונה על שאלות בדלפק מידע
- **סוכן AI** = עוזר אישי שיכול לבצע שיחות, לתאם פגישות ולהשלים משימות עבורך

---

## 🚀 התחלה מהירה: פרוס את הסוכן הראשון שלך

### אפשרות 1: תבנית Foundry Agents (מומלץ)

```bash
# אתחול תבנית סוכני הבינה המלאכותית
azd init --template get-started-with-ai-agents

# פריסה ל-Azure
azd up
```

**מה מפורסם:**
- ✅ סוכני Foundry
- ✅ מודלים של Microsoft Foundry (gpt-4.1)
- ✅ Azure AI Search (ל-RAG)
- ✅ Azure Container Apps (ממשק ווב)
- ✅ Application Insights (ניטור)

**זמן:** כ-15-20 דקות  
**עלות:** כ-100-150$ לחודש (פיתוח)

### אפשרות 2: סוכן OpenAI עם Prompty

```bash
# אתחול תבנית הסוכן מבוסס Prompty
azd init --template agent-openai-python-prompty

# פריסה ב-Azure
azd up
```

**מה מפורסם:**
- ✅ Azure Functions (הפעלה ללא שרת לסוכן)
- ✅ מודלים של Microsoft Foundry
- ✅ קבצי תצורה של Prompty
- ✅ יישום סוכן לדוגמה

**זמן:** כ-10-15 דקות  
**עלות:** כ-50-100$ לחודש (פיתוח)

### אפשרות 3: סוכן צ'ט RAG

```bash
# אתחול תבנית שיחת RAG
azd init --template azure-search-openai-demo

# פריסה ל-Azure
azd up
```

**מה מפורסם:**
- ✅ מודלים של Microsoft Foundry
- ✅ Azure AI Search עם נתונים לדוגמה
- ✅ צינור לעיבוד מסמכים
- ✅ ממשק צ'ט עם מקורות

**זמן:** כ-15-25 דקות  
**עלות:** כ-80-150$ לחודש (פיתוח)

### אפשרות 4: אתחול סוכן AI ב-AZD (מבוסס מניפסט)

אם יש לך קובץ מניפסט לסוכן, תוכל להשתמש בפקודה `azd ai` ליצירת פרויקט שירות סוכן Foundry ישירות:

```bash
# התקן את הרחבת סוכני ה-AI
azd extension install azure.ai.agents

# אתחל מתוך מפת סוכן
azd ai agent init -m agent-manifest.yaml

# פרוס ל-Azure
azd up
```

**מתי להשתמש ב-`azd ai agent init` מול `azd init --template`:**

| גישה | מתאים ל-| איך זה פועל |
|----------|----------|------|
| `azd init --template` | התחלה מדוגמה עובדת | משכפל רפוזיטורי תבנית מלאה עם קוד ותשתית |
| `azd ai agent init -m` | בנייה ממניפסט סוכן משלך | יוצר מבנה פרויקט מהגדרת הסוכן שלך |

> **טיפ:** השתמש ב-`azd init --template` ללמידה (אפשרויות 1-3 למעלה). השתמש ב-`azd ai agent init` לבניית סוכנים לפרודקשן עם מניפסטים משלך. ראו [פקודות AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) למדריך מלא.

---

## 🏗️ דפוסי ארכיטקטורת סוכנים

### דפוס 1: סוכן יחיד עם כלים

הדפוס הפשוט ביותר - סוכן אחד המשתמש בכלים רבים.

```mermaid
graph TD
    UI[ממשק משתמש] --> Agent[סוכן בינה מלאכותית<br/>gpt-4.1]
    Agent --> Search[כלי חיפוש]
    Agent --> Database[כלי מסד נתונים]
    Agent --> API[כלי API]
```
**מתאים ל:**
- בוטי תמיכה בלקוחות
- עוזרי מחקר
- סוכני ניתוח נתונים

**תבנית AZD:** `azure-search-openai-demo`

### דפוס 2: סוכן RAG (יצירת תוכן משולבת שאיבה)

סוכן שמושך מסמכים רלוונטיים לפני יצירת תגובות.

```mermaid
graph TD
    Query[שאילתת משתמש] --> RAG[סוכן RAG]
    RAG --> Vector[חיפוש וקטורי]
    RAG --> LLM[LLM<br/>gpt-4.1]
    Vector -- מסמכים --> LLM
    LLM --> Response[תגובה עם ציטוטים]
```
**מתאים ל:**
- מאגרי ידע ארגוניים
- מערכות שאלות ותשובות על מסמכים
- מחקר משפטי וציות

**תבנית AZD:** `azure-search-openai-demo`

### דפוס 3: מערכת מרובי סוכנים

כמה סוכנים מיוחדים העובדים יחד על משימות מורכבות.

```mermaid
graph TD
    Orchestrator[סוכן מאסטר] --> Research[סוכן מחקר<br/>gpt-4.1]
    Orchestrator --> Writer[סוכן כותב<br/>gpt-4.1-mini]
    Orchestrator --> Reviewer[סוכן ביקורת<br/>gpt-4.1]
```
**מתאים ל:**
- יצירת תוכן מורכב
- תהליכי עבודה רב-שלביים
- משימות שדורשות מומחיות שונה

**למידע נוסף:** [דפוסי תיאום מרובי סוכנים](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ הגדרת כלים לסוכן

סוכנים נעשים חזקים כשיכולים להשתמש בכלים. כך מגדירים כלים נפוצים:

### הגדרת כלים בסוכני Foundry

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# הגדר כלים מותאמים אישית
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
    model="gpt-4.1",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### הגדרת סביבה

```bash
# הגדר משתני סביבה ספציפיים לסוכן
azd env set AZURE_OPENAI_MODEL "gpt-4.1"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# פרוס עם תצורה מעודכנת
azd deploy
```

---

## 📊 ניטור סוכנים

### אינטגרציה עם Application Insights

כל תבניות AZD לסוכנים כוללות Application Insights לצורך ניטור:

```bash
# פתיחת לוח בקרה למעקב
azd monitor --overview

# צפייה ביומני זמן אמת
azd monitor --logs

# צפייה במדדים בזמן אמת
azd monitor --live
```

### מדדים עיקריים למעקב

| מדד | תיאור | יעד |
|--------|-------------|--------|
| זמן תגובה | זמן ליצירת תגובה | < 5 שניות |
| שימוש בטוקנים | טוקנים לבקשה | לניטור עלויות |
| שיעור הצלחה של קריאות כלי | % מהפעלת כלים מוצלחת | > 95% |
| שיעור שגיאות | בקשות סוכן שנכשלו | < 1% |
| שביעות רצון משתמש | ציוני משוב | > 4.0/5.0 |

### רישום מותאם אישית לסוכנים

```python
import os
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

# קבע את Azure Monitor עם OpenTelemetry
configure_azure_monitor(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
)

tracer = trace.get_tracer(__name__)

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    with tracer.start_as_current_span("agent_interaction") as span:
        span.set_attributes({
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        })
```

> **הערה:** התקן את החבילות הנדרשות: `pip install azure-monitor-opentelemetry opentelemetry`

---

## 💰 שיקולי עלות

### עלויות חודשיות מוערכות לפי דפוס

| דפוס | סביבת פיתוח | פרודקשן |
|---------|-----------------|------------|
| סוכן יחיד | 50-100$ | 200-500$ |
| סוכן RAG | 80-150$ | 300-800$ |
| מרובי סוכנים (2-3 סוכנים) | 150-300$ | 500-1,500$ |
| מרובי סוכנים ארגוניים | 300-500$ | 1,500-5,000+ $ |

### טיפים לאופטימיזציית עלויות

1. **השתמש ב-gpt-4.1-mini למשימות פשוטות**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
   ```

2. **יישם מטמון לשאילתות חוזרות**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **הגבל את מספר הטוקנים להרצה**
   ```python
   # קבע את max_completion_tokens בעת הפעלת הסוכן, לא במהלך ההכנה
   run = project_client.agents.create_run(
       thread_id=thread.id,
       agent_id=agent.id,
       max_completion_tokens=1000  # הגבל את אורך התגובה
   )
   ```

4. **השע והפעל אפס בעת אי שימוש**
   ```bash
   # אפליקציות מכולה מתרחבות אוטומטית לאפס
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 פתרון בעיות בסוכנים

### בעיות נפוצות ופתרונן

<details>
<summary><strong>❌ הסוכן לא מגיב לקריאות כלי</strong></summary>

```bash
# בדוק אם הכלים רשומים כראוי
azd show

# אשר פריסת OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# בדוק יומני סוכן
azd monitor --logs
```

**סיבות נפוצות:**
- חוסר התאמה של חתימת פונקציה לכלי
- חסרים הרשאות נדרשות
- נקודת קצה של API לא נגישה
</details>

<details>
<summary><strong>❌ זמן תגובה גבוה בתגובות הסוכן</strong></summary>

```bash
# בדוק את Application Insights עבור צווארי בקבוק
azd monitor --live

# שקול להשתמש בדגם מהיר יותר
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd deploy
```

**טיפים לאופטימיזציה:**
- השתמש בתגובות בזרם (streaming)
- יישם מטמון לתגובות
- הקטנת גודל חלון ההקשר
</details>

<details>
<summary><strong>❌ הסוכן מחזיר מידע שגוי או מדומיין</strong></summary>

```python
# שפר עם בקשות מערכת טובות יותר
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# הוסף שליפה להסתמכות
agent = project_client.agents.create_agent(
    model="gpt-4.1",
    instructions=instructions,
    tools=[FileSearchTool()]  # עגן תגובות במסמכים
)
```
</details>

<details>
<summary><strong>❌ שגיאות עקב חריגות מגבלת טוקנים</strong></summary>

```python
# יישם ניהול חלון הקשר
def truncate_context(messages, max_tokens=8000, model="gpt-4.1"):
    """Keep only recent messages within token limit."""
    import tiktoken
    encoding = tiktoken.encoding_for_model(model)
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(encoding.encode(msg.content))
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 תרגילים מעשיים

### תרגיל 1: פרוס סוכן בסיסי (20 דקות)

**מטרה:** לפרוס את סוכן ה-AI הראשון שלך באמצעות AZD

```bash
# שלב 1: אתחול התבנית
azd init --template get-started-with-ai-agents

# שלב 2: התחברות ל-Azure
azd auth login

# שלב 3: פריסה
azd up

# שלב 4: בדיקת הסוכן
# הפלט הצפוי לאחר הפריסה:
#   הפריסה הושלמה!
#   נקודת קצה: https://<app-name>.<region>.azurecontainerapps.io
# פתח את כתובת ה-URL שמופיעה בפלט ונסה לשאול שאלה

# שלב 5: צפייה במעקב
azd monitor --overview

# שלב 6: ניקוי סביבה
azd down --force --purge
```

**קריטריוני הצלחה:**
- [ ] הסוכן מגיב לשאלות
- [ ] גישה ללוח ניטור דרך `azd monitor`
- [ ] ניקוי משאבים בהצלחה

### תרגיל 2: הוסף כלי מותאם אישית (30 דקות)

**מטרה:** להרחיב סוכן עם כלי מותאם חדש

1. פרוס את תבנית הסוכן:
   ```bash
   azd init --template get-started-with-ai-agents
   azd up
   ```
2. צור פונקציית כלי חדשה בקוד הסוכן שלך:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # קריאת API לשירות מזג האוויר
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. רשום את הכלי עם הסוכן:
   ```python
   from azure.ai.projects.models import FunctionTool

   weather_tool = FunctionTool(
       name="get_weather",
       description="Get current weather for a location",
       parameters={
           "type": "object",
           "properties": {
               "location": {"type": "string", "description": "City name"}
           },
           "required": ["location"]
       }
   )

   agent = project_client.agents.create_agent(
       model="gpt-4.1",
       name="Weather Agent",
       tools=[weather_tool]
   )
   ```
4. פרוס מחדש ובדוק:
   ```bash
   azd deploy
   # שאל: "מה מזג האוויר בסיאטל?"
   # צפוי: הסוכן קורא ל-get_weather("Seattle") ומחזיר מידע על מזג האוויר
   ```

**קריטריוני הצלחה:**
- [ ] הסוכן מזהה שאילתות הקשורות למזג אוויר
- [ ] הכלי נקרא כהלכה
- [ ] התגובה כוללת מידע על מזג האוויר

### תרגיל 3: בנה סוכן RAG (45 דקות)

**מטרה:** ליצור סוכן שמשיב על שאלות מתוך המסמכים שלך

```bash
# שלב 1: פרוס את תבנית RAG
azd init --template azure-search-openai-demo
azd up

# שלב 2: העלה את המסמכים שלך
# הנח קבצי PDF/TXT בתיקיית data/, ואז הרץ:
python scripts/prepdocs.py

# שלב 3: בדוק עם שאלות ספציפיות לתחום
# פתח את כתובת האפליקציה מהפלט של azd up
# שאל שאלות על המסמכים שהעלית
# התגובות אמורות לכלול הפניות ציטוט כמו [doc.pdf]
```

**קריטריוני הצלחה:**
- [ ] הסוכן משיב מתוך המסמכים שהועלו
- [ ] תשובות כוללות ציטוטים
- [ ] אין הזיות בשאלות מחוץ לטווח

---

## 📚 צעדים הבאים

עכשיו כשאתה מבין את סוכני הבינה המלאכותית, חקור נושאים מתקדמים אלה:

| נושא | תיאור | קישור |
|-------|-------------|------|
| **מערכות מרובי סוכנים** | בניית מערכות עם סוכנים משותפים | [דוגמה לריבוי סוכנים בקמעונאות](../../examples/retail-scenario.md) |
| **דפוסי תיאום** | למד דפוסים של תזמור ותקשורת | [דפוסי תיאום](../chapter-06-pre-deployment/coordination-patterns.md) |
| **פריסה לפרודקשן** | פריסת סוכנים מוכנה לארגון | [פרקטיקות AI לפרודקשן](../chapter-08-production/production-ai-practices.md) |
| **הערכת סוכנים** | בדיקה והערכת ביצועי סוכן | [פתרון בעיות AI](../chapter-07-troubleshooting/ai-troubleshooting.md) |
| **מעבדת סדנת AI** | עבודה מעשית: הפוך את פתרון ה-AI שלך למוכן AZD | [מעבדת סדנת AI](ai-workshop-lab.md) |

---

## 📖 משאבים נוספים

### תיעוד רשמי
- [שירות סוכני Azure AI](https://learn.microsoft.com/azure/ai-services/agents/)
- [התחלה מהירה עם שירות סוכני Azure AI Foundry](https://learn.microsoft.com/azure/ai-services/agents/quickstart)
- [מסגרת סוכני Semantic Kernel](https://learn.microsoft.com/semantic-kernel/)

### תבניות AZD לסוכנים
- [התחלה עם סוכני AI](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [סוכן OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [הדגמת Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)

### משאבים קהילתיים
- [Awesome AZD - תבניות סוכנים](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

### מיומנויות סוכן לעורך שלך
- [**מיומנויות סוכן Microsoft Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - התקן מיומנויות סוכן AI רב-פעמיות לפיתוח Azure ב-GitHub Copilot, Cursor, או כל סוכן שנתמך. כולל מיומנויות עבור [Azure AI](https://skills.sh/microsoft/github-copilot-for-azure/azure-ai), [Microsoft Foundry](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry), [פריסה](https://skills.sh/microsoft/github-copilot-for-azure/azure-deploy), ו-[אבחון](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics):
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**ניווט**
- **שיעור קודם**: [אינטגרציית Microsoft Foundry](microsoft-foundry-integration.md)
- **שיעור הבא**: [פריסת מודל בינה מלאכותית](ai-model-deployment.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב וויתור**:  
מסמך זה תורגם באמצעות שירות התרגום באמצעות בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). אנו שואפים לדייק, אך יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו הוא המקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי של אדם. אנו לא אחראים על אי-הבנות או פרשנויות מוטעות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->