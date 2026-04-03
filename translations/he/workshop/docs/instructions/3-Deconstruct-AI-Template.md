# 3. לפרק תבנית

!!! tip "בסוף המודול הזה תוכל/י"

    - [ ] להפעיל את GitHub Copilot עם שרתי MCP לסיוע באז'ור
    - [ ] להבין את מבנה התיקיות והרכיבים של תבנית AZD
    - [ ] לחקור דפוסי ארגון תשתית-כקוד (Bicep)
    - [ ] **מעבדה 3:** להשתמש ב-GitHub Copilot לחקור ולהבין את ארכיטקטורת המאגר 

---


עם תבניות AZD ו-CLI של מפתחי Azure (`azd`) ניתן להתחיל במהירות את מסע הפיתוח של AI עם מאגרים סטנדרטיים שמספקים קוד דוגמה, תשתית וקבצי קונפיגורציה - בצורה של פרויקט _מתחיל_ מוכן לפריסה.

**אבל עכשיו, אנחנו צריכים להבין את מבנה הפרויקט וקוד המקור - ולהיות מסוגלים להתאים אישית את תבנית AZD - ללא כל ניסיון או הבנה מוקדמת של AZD!**

---

## 1. הפעלת GitHub Copilot

### 1.1 התקנת GitHub Copilot Chat

הגיע הזמן לחקור את [GitHub Copilot במצב סוכן](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). עכשיו, אפשר להשתמש בשפה טבעית כדי לתאר את המשימה ברמה גבוהה, ולקבל סיוע בביצוע. עבור מעבדה זו נשתמש ב[תכנית החינמית של Copilot](https://github.com/github-copilot/signup) שיש לה הגבלה חודשית על השלמות ואינטראקציות בצ'אט.

ניתן להתקין את התוסף מהמרקטפלייס, ולעיתים הוא כבר זמין ב-Codespaces או בסביבת מיכלים לפיתוח. _לחץ `Open Chat` מתוך תפריט הנפתח של סמל Copilot - והקלד הנחייה כמו `What can you do?`_ - ייתכן שתתבקש להתחבר. **GitHub Copilot Chat מוכן.**

### 1.2. התקנת שרתי MCP

כדי שמצב סוכן יהיה יעיל, הוא צריך גישה לכלים הנכונים שיעזרו לו לשאוב ידע או לבצע פעולות. כאן שרתי MCP יכולים לעזור. נגדיר את השרתים הבאים:

1. [שרת Azure MCP](../../../../../workshop/docs/instructions)
1. [שרת Microsoft Docs MCP](../../../../../workshop/docs/instructions)

כדי להפעיל אותם:

1. צור קובץ בשם `.vscode/mcp.json` אם אינו קיים
1. העתק לתוכו את התוכן הבא - והפעל את השרתים!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "יתכן שתקבל שגיאה ש־`npx` לא מותקן (לחץ להרחבה עבור תיקון)"

      לתיקון, פתח את הקובץ `.devcontainer/devcontainer.json` והוסף שורה זו למדור התכונות. לאחר מכן בנה מחדש את המיכל. כעת אמור להיות מותקן `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. בדיקת GitHub Copilot Chat

**השתמש תחילה ב־`azd auth login` לאימות כניסה ל-Azure משורת הפקודה של VS Code. השתמש גם ב־`az login` רק אם אתה מתכנן להריץ פקודות Azure CLI ישירות.**

כעת תוכל לשאול על מצב המנוי שלך ל-Azure, ולהציג שאלות על משאבים שהופעלו או הגדרות. נסה את ההנחיות הבאות:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

תוכל גם לשאול שאלות על תיעוד Azure ולקבל תשובות מבוססות על שרת MCP של Microsoft Docs. נסה את ההנחיות הבאות:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

או לבקש קטעי קוד להשלמת משימה. נסה את ההנחיה הבאה:

1. `Give me a Python code example that uses AAD for an interactive chat client`

במצב `Ask`, זה יספק קוד שניתן להעתיק ולהריץ. במצב `Agent`, זה עשוי להמשיך וליצור את המשאבים הרלוונטיים עבורך - כולל תסריטי הגדרה ותיעוד - כדי לעזור לבצע את המשימה.

**כעת אתה מצויד להתחיל לחקור את מאגר התבנית**

---

## 2. פיצוח ארכיטקטורה

??? prompt "שאל: הסבר את ארכיטקטורת היישום ב־docs/images/architecture.png בפסקה אחת"

      יישום זה הוא אפליקציית צ'אט מבוססת AI שמנוהלת על Azure ומדגים ארכיטקטורת סוכן מודרנית. הפתרון מתרכז באפליקציית מכולות Azure שמאחסנת את קוד האפליקציה הראשי, שמעבדת קלט משתמש ומייצרת תגובות חכמות דרך סוכן AI.
      
      הארכיטקטורה משתמשת בפרויקט Microsoft Foundry כבסיס ליכולות AI, ומתחברת לשירותי Azure AI שמספקים את מודלי השפה הבסיסיים (כגון gpt-4.1-mini) ואת פונקציונליות הסוכן.
      
      האינטראקציות עם המשתמש זורמות דרך ממשק חזיתי React ל־backend של FastAPI שמתקשר עם שירות סוכן AI ליצירת תגובות בהקשר.
      
      המערכת כוללת יכולות של שאיבת ידע דרך חיפוש קבצים או שירות Azure AI Search, שמאפשרות לסוכן לגשת ולצטט מידע מהמסמכים שהועלו.
      
      למען מצוינות תפעולית, הארכיטקטורה כוללת ניטור מלא באמצעות Application Insights ו-Log Analytics Workspace למעקב, רישום ואופטימיזציית ביצועים.
      
      Azure Storage מספק אחסון blob לנתוני האפליקציה והעלאות קבצים, בעוד Managed Identity מוודא גישה מאובטחת בין משאבי Azure ללא אחסון פרטי גישה.
      
      כל הפתרון מעוצב למידותיות ולתחזוקה, עם אפליקציה מכולית שמתמקדת בקנה מידה אוטומטי בהתאם לביקוש ומציעה אבטחה מובנית, ניטור ויכולות CI/CD באמצעות אקוסיסטם השירותים המנוהל של Azure.

![Architecture](../../../../../translated_images/he/architecture.48d94861e6e6cdc0.webp)

---

## 3. מבנה המאגר

!!! prompt "שאל: הסבר את מבנה תיקיית התבנית. התחל בדיאגרמת היררכיה ויזואלית."

??? info "תשובה: דיאגרמת היררכיה ויזואלית"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 קונפיגורציה והגדרות
      │   ├── azure.yaml                    # קונפיגורציית Azure Developer CLI
      │   ├── docker-compose.yaml           # מיכלים לפיתוח מקומי
      │   ├── pyproject.toml                # קונפיגורציית פרויקט Python
      │   ├── requirements-dev.txt          # תלות לפיתוח
      │   └── .devcontainer/                # הגדרת מיכל פיתוח VS Code
      │
      ├── 🏗️ תשתית (infra/)
      │   ├── main.bicep                    # תבנית תשתית ראשית
      │   ├── api.bicep                     # משאבים ספציפיים ל-API
      │   ├── main.parameters.json          # פרמטרים לתשתית
      │   └── core/                         # רכיבי תשתית מודולריים
      │       ├── ai/                       # הגדרות שירותי AI
      │       ├── host/                     # תשתית אירוח
      │       ├── monitor/                  # ניטור ורישום
      │       ├── search/                   # הגדרת Azure AI Search
      │       ├── security/                 # אבטחה וזהות
      │       └── storage/                  # הגדרות חשבון אחסון
      │
      ├── 💻 קוד מקור אפליקציה (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # כניסה לאפליקציית FastAPI
      │   │   ├── routes.py                 # הגדרות נתיבי API
      │   │   ├── search_index_manager.py   # פונקציית חיפוש
      │   │   ├── data/                     # ניהול נתוני API
      │   │   ├── static/                   # נכסים סטטיים לאתר
      │   │   └── templates/                # תבניות HTML
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # תלות Node.js
      │   │   ├── vite.config.ts            # קונפיגורציית בניית Vite
      │   │   └── src/                      # קוד מקור frontend
      │   ├── data/                         # קבצי דוגמת נתונים
      │   │   └── embeddings.csv            # הטמעות מחושבות מראש
      │   ├── files/                        # קבצי ידע
      │   │   ├── customer_info_*.json      # דוגמאות נתוני לקוחות
      │   │   └── product_info_*.md         # תיעוד מוצר
      │   ├── Dockerfile                    # הגדרת מיכל
      │   └── requirements.txt              # תלות Python
      │
      ├── 🔧 אוטומציה וסקריפטים (scripts/)
      │   ├── postdeploy.sh/.ps1           # הגדרות לאחר פריסה
      │   ├── setup_credential.sh/.ps1     # הגדרת הרשאות
      │   ├── validate_env_vars.sh/.ps1    # בדיקת משתני סביבה
      │   └── resolve_model_quota.sh/.ps1  # ניהול מכסת מודלים
      │
      ├── 🧪 בדיקות והערכה
      │   ├── tests/                        # בדיקות יחידה ואינטגרציה
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # מסגרת הערכת סוכן
      │   │   ├── evaluate.py               # מנגנון הערכה
      │   │   ├── eval-queries.json         # שאילתות בדיקה
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # סביבת פיתוח
      │   │   ├── 1-quickstart.py           # דוגמאות התחלה מהירה
      │   │   └── aad-interactive-chat.py   # דוגמאות אימות
      │   └── airedteaming/                 # הערכת בטיחות AI
      │       └── ai_redteaming.py          # בדיקות צוות אדום
      │
      ├── 📚 תיעוד (docs/)
      │   ├── deployment.md                 # מדריך פריסה
      │   ├── local_development.md          # הוראות התקנה מקומית
      │   ├── troubleshooting.md            # בעיות נפוצות ופתרונות
      │   ├── azure_account_setup.md        # דרישות מוקדמות לאז'ור
      │   └── images/                       # נכסי תיעוד
      │
      └── 📄 מטה-נתוני פרויקט
         ├── README.md                     # סקירת הפרויקט
         ├── CODE_OF_CONDUCT.md           # קוד התנהגות קהילה
         ├── CONTRIBUTING.md              # מדריך תרומה
         ├── LICENSE                      # תנאי רישיון
         └── next-steps.md                # הנחיות לאחר פריסה
      ```

### 3.1. ארכיטקטורת האפליקציה הליבה

תבנית זו פועלת לפי דפוס **אפליקציית ווב מלאה** עם:

- **Backend**: FastAPI ב־Python עם אינטגרציה ל-AI של Azure
- **Frontend**: TypeScript/React עם מערכת בניית Vite
- **תשתית**: תבניות Azure Bicep למשאבי ענן
- **מיכליות**: Docker לפריסה עקבית

### 3.2 תשתית כקוד (bicep)

שכבת התשתית משתמשת בתבניות **Azure Bicep** המאורגנות באופן מודולרי:

   - **`main.bicep`**: מנחה את כל משאבי Azure
   - **מודולים ב־`core/`**: רכיבים לשימוש חוזר לשירותים שונים
      - שירותי AI (Microsoft Foundry Models, AI Search)
      - אירוח מכולות (Azure Container Apps)
      - ניטור (Application Insights, Log Analytics)
      - אבטחה (Key Vault, Managed Identity)

### 3.3 קוד מקור אפליקציה (`src/`)

**Backend API (`src/api/`)**:

- REST API מבוסס FastAPI
- אינטגרציה עם Foundry Agents
- ניהול אינדקס חיפוש לשאיבת ידע
- יכולות העלאת קבצים ועיבודם

**Frontend (`src/frontend/`)**:

- SPA מודרני מבוסס React/TypeScript
- Vite לפיתוח מהיר ובניה מותאמת
- ממשק צ'אט לאינטראקציות סוכן

**בסיס ידע (`src/files/`)**:

- נתוני לקוחות ומוצרים לדוגמה
- מציג שאיבת ידע מבוססת קבצים
- דוגמאות בפורמט JSON ו-Markdown


### 3.4 DevOps ואוטומציה

**סקריפטים (`scripts/`)**:

- סקריפטים חוצי פלטפורמה ב-PowerShell וב-Bash
- אימות והגדרת סביבה
- קונפיגורציה לאחר פריסה
- ניהול מכסת מודלים

**אינטגרציה עם Azure Developer CLI**:

- קובץ kונפיגורציה `azure.yaml` לזרימות עבודה של `azd`
- פרוביזיונינג ופריסה אוטומטית
- ניהול משתני סביבה

### 3.5 בדיקות ואבטחת איכות

**מסגרת הערכה (`evals/`)**:

- הערכת ביצועי סוכן
- בדיקות איכות תשובות לשאילתות
- צינור הערכה אוטומטי

**בטיחות AI (`airedteaming/`)**:

- בדיקות צוות אדום לבטיחות AI
- סריקת פרצות אבטחה
- פרקטיקות AI אחראיות

---

## 4. מזל טוב 🏆

הצלחת להשתמש ב-GitHub Copilot Chat עם שרתי MCP כדי לחקור את המאגר.

- [X] הפעלת GitHub Copilot לאז'ור
- [X] הבנת ארכיטקטורת היישום
- [X] חקר מבנה תבנית AZD

זה נותן לך תחושה של נכסי _תשתית כקוד_ לתבנית זו. בהמשך נבחן את קובץ הקונפיגורציה של AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להעדיף את המסמך המקורי בשפת המקור כמקור סמכותי. למידע קריטי מומלץ לשכור תרגום מקצועי אנושי. איננו אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->