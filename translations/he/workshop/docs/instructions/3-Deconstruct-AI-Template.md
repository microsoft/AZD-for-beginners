# 3. פירוק תבנית

!!! tip "בסוף מודול זה תוכל/י"

    - [ ] להפעיל את GitHub Copilot עם שרתי MCP לסיוע ב-Azure
    - [ ] להבין את מבנה התיקיות והרכיבים של תבנית AZD
    - [ ] לחקור דפוסי ארגון של תשתית-כקוד (Bicep)
    - [ ] **מעבדה 3:** להשתמש ב-GitHub Copilot לחקור ולהבין את ארכיטקטורת הרפוזיטורי

---

עם תבניות AZD ו-Azure Developer CLI (`azd`) אנו יכולים במהירות להתחיל את מסע הפיתוח של AI עם רפוזיטוריות סטנדרטיות המספקות דוגמאות קוד, תשתית וקבצי קונפיגורציה - בצורת פרויקט _starter_ מוכן לפריסה.

**אבל עכשיו, אנחנו צריכים להבין את מבנה הפרויקט וקוד המקור - ולדעת להתאים אישית את תבנית AZD - ללא כל ניסיון או הבנה מוקדמת של AZD!**

---

## 1. הפעלת GitHub Copilot

### 1.1 התקנת GitHub Copilot Chat

הגיע הזמן לחקור את [GitHub Copilot במצב Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). כעת, ניתן להשתמש בשפה טבעית כדי לתאר את המשימה ברמה גבוהה, ולקבל סיוע בביצוע. עבור מעבדה זו, נשתמש ב-[תוכנית חינמית של Copilot](https://github.com/github-copilot/signup) שיש לה הגבלה חודשית על השלמות ואינטראקציות צ'אט.

ניתן להתקין את ההרחבה ממארקטפלייס, אך היא כבר צריכה להיות זמינה בסביבת Codespaces שלך. _לחץ על `Open Chat` בתפריט הנפתח של האייקון של Copilot - והקלד פקודה כמו `What can you do?`_ - ייתכן שתתבקש להיכנס לחשבון. **GitHub Copilot Chat מוכן לשימוש**.

### 1.2 התקנת שרתי MCP

כדי שמצב Agent יהיה יעיל, הוא צריך גישה לכלים הנכונים כדי לעזור באחזור ידע או ביצוע פעולות. כאן שרתי MCP יכולים לסייע. נגדיר את השרתים הבאים:

1. [שרת Azure MCP](../../../../../workshop/docs/instructions)
1. [שרת Microsoft Docs MCP](../../../../../workshop/docs/instructions)

להפעלתם:

1. צור קובץ בשם `.vscode/mcp.json` אם הוא אינו קיים
1. העתק את התוכן הבא לתוך קובץ זה - והפעל את השרתים!
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

??? warning "יתכן שתקבל שגיאה ש-`npx` אינו מותקן (לחץ להרחבה עם תיקון)"

      לתיקון זה, פתח את הקובץ `.devcontainer/devcontainer.json` והוסף שורה זו לקטע התכונות. לאחר מכן בנא מחדש את הקונטיינר. כעת אמור להיות מותקן `npx`.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3 בדיקת GitHub Copilot Chat

**השתמש תחילה ב-`az login` לאימות עם Azure משורת הפקודה ב-VS Code.**

כעת תוכל לשאול על סטטוס המנוי שלך ב-Azure, ולשאול שאלות לגבי משאבים מפורסמים או קונפיגורציה. נסה את הפקודות הללו:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

ניתן גם לשאול שאלות לגבי תיעוד Azure ולקבל תשובות מבוססות על שרת Microsoft Docs MCP. נסה את הפקודות:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

או לבקש קטעי קוד להשלמת משימה. נסה את הפקודה הזו:

1. `Give me a Python code example that uses AAD for an interactive chat client`

במצב `Ask`, תקבל קוד שתוכל להעתיק ולהריץ. במצב `Agent`, ייתכן ותינתן לך תמיכה נוספת שתיצור את המשאבים הנדרשים - כולל סקריפטים ומסמכים - כדי לסייע בביצוע המשימה.

**כעת אתה מצויד להתחיל לחקור את רפוזיטורית התבנית**

---

## 2. פירוק ארכיטקטורה

??? prompt "שאל: הסבר את ארכיטקטורת היישום ב- docs/images/architecture.png בפסקה אחת"

      יישום זה הוא יישום צ'אט מבוסס AI מבוסס Azure המדגים ארכיטקטורה מודרנית מבוססת סוכן. הפתרון מתמקד באפליקציית מכולות Azure (Azure Container App) שמארחת את קוד היישום הראשי, אשר מעבד את הקלט מהמשתמש ומייצר תגובות חכמות דרך סוכן AI.
      
      הארכיטקטורה נשענת על פרויקט Microsoft Foundry כבסיס ליכולות AI, ומחוברת לשירותי Azure AI המספקים את דגמי השפה הבסיסיים (כגון gpt-4.1-mini) ותפקוד הסוכן.
      
      האינטראקציות עם המשתמש זורמות דרך ממשק React אל backend מבוסס FastAPI שמתקשר עם שירות הסוכן AI ליצירת תגובות תוך הבנה הקשרית.
      
      המערכת כוללת יכולות אחזור ידע באמצעות חיפוש בקבצים או שירות Azure AI Search, המאפשר לסוכן לגשת לצטט מידע מתוך מסמכים שהועלו.
      
      לשם מצוינות תפעולית, הארכיטקטורה כוללת ניטור מקיף דרך Application Insights ו-Log Analytics Workspace למעקב, רישום ואופטימיזציית ביצועים.
      
      Azure Storage מספק אחסון בלוב (blob storage) לנתוני יישום והעלאת קבצים, בעוד Managed Identity מבטיחה גישה מאובטחת בין משאבי Azure ללא אחסון אישורי גישה. כל הפתרון מתוכנן להרחבה ולתחזוקה נוחה, כאשר אפליקציית המכולות מתרוממת אוטומטית בהתאם לביקוש ומספקת אבטחה, ניטור ויכולות CI/CD מובנות במסגרת אקוסיסטם השירותים המנוהלים של Azure.

![Architecture](../../../../../translated_images/he/architecture.48d94861e6e6cdc0.webp)

---

## 3. מבנה הרפוזיטורי

!!! prompt "שאל: הסבר את מבנה תיקיית התבנית. התחל עם דיאגרמה היררכית ויזואלית."

??? info "תשובה: דיאגרמה היררכית ויזואלית"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # קונפיגורציית Azure Developer CLI
      │   ├── docker-compose.yaml           # מכולות לפיתוח מקומי
      │   ├── pyproject.toml                # קונפיגורציית פרויקט Python
      │   ├── requirements-dev.txt          # תלויות לפיתוח
      │   └── .devcontainer/                # הגדרת קונטיינר VS Code לפיתוח
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # תבנית תשתית ראשית
      │   ├── api.bicep                     # משאבים ספציפיים ל-API
      │   ├── main.parameters.json          # פרמטרים לתשתית
      │   └── core/                         # רכיבי תשתית מודולריים
      │       ├── ai/                       # קונפיגורציות שירותי AI
      │       ├── host/                     # תשתית אירוח
      │       ├── monitor/                  # ניטור ורישום
      │       ├── search/                   # הגדרת Azure AI Search
      │       ├── security/                 # אבטחה וזהויות
      │       └── storage/                  # קונפיגורציות חשבון אחסון
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # כניסת אפליקציית FastAPI
      │   │   ├── routes.py                 # הגדרות מסלולי API
      │   │   ├── search_index_manager.py   # פונקציונליות חיפוש
      │   │   ├── data/                     # טיפול בנתוני API
      │   │   ├── static/                   # נכסים סטטיים לאינטרנט
      │   │   └── templates/                # תבניות HTML
      │   ├── frontend/                     # Frontend ב-React/TypeScript
      │   │   ├── package.json              # תלויות Node.js
      │   │   ├── vite.config.ts            # קונפיגורציית הבנייה של Vite
      │   │   └── src/                      # קוד מקור של Frontend
      │   ├── data/                         # קבצי דוגמאות לנתונים
      │   │   └── embeddings.csv            # אמבדינגים מחושבים מראש
      │   ├── files/                        # קבצי בסיס ידע
      │   │   ├── customer_info_*.json      # דוגמאות לנתוני לקוחות
      │   │   └── product_info_*.md         # תיעוד מוצר
      │   ├── Dockerfile                    # קונפיגורציית מכולה
      │   └── requirements.txt              # תלויות Python
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # הגדרת פוסט פריסה
      │   ├── setup_credential.sh/.ps1     # קונפיגורציית הרשאות
      │   ├── validate_env_vars.sh/.ps1    # אימות משתני סביבה
      │   └── resolve_model_quota.sh/.ps1  # ניהול מכסת מודל
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # בדיקות יחידה ואינטגרציה
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # מסגרת הערכת סוכן
      │   │   ├── evaluate.py               # מנהל הערכות
      │   │   ├── eval-queries.json         # שאילתות לבדיקה
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # סביבת פיתוח ניסיונית
      │   │   ├── 1-quickstart.py           # דוגמאות התחלה מהירה
      │   │   └── aad-interactive-chat.py   # דוגמאות אימות
      │   └── airedteaming/                 # הערכת בטיחות AI
      │       └── ai_redteaming.py          # בדיקת צוות אדום
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # מדריך פריסה
      │   ├── local_development.md          # הוראות התקנה מקומית
      │   ├── troubleshooting.md           # בעיות ותיקוני שגיאות
      │   ├── azure_account_setup.md        # דרישות מוקדמות ל-Azure
      │   └── images/                       # משאבי תיעוד
      │
      └── 📄 Project Metadata
         ├── README.md                     # סקירת הפרויקט
         ├── CODE_OF_CONDUCT.md            # הנחיות קהילתיות
         ├── CONTRIBUTING.md               # מדריך לתרומה
         ├── LICENSE                      # תנאי רישיון
         └── next-steps.md                # הנחיות לאחר פריסה
      ```

### 3.1 ארכיטקטורת ליבת האפליקציה

תבנית זו עוקבת אחרי דפוס של **אפליקציית ווב Full-stack** עם:

- **Backend**: Python FastAPI משולב עם Azure AI
- **Frontend**: TypeScript/React עם מערכת בניית Vite
- **תשתית**: תבניות Azure Bicep למשאבי ענן
- **מכולות**: Docker לפריסה עקבית

### 3.2 תשתית כקוד (bicep)

שכבת התשתית משתמשת בתבניות **Azure Bicep** הממוינות במודולים:

   - **`main.bicep`**: מארגן את כל משאבי Azure
   - **מודולי `core/`**: רכיבים ניתנים לשימוש חוזר לשירותים שונים
      - שירותי AI (Microsoft Foundry Models, AI Search)
      - אירוח מכולות (Azure Container Apps)
      - ניטור (Application Insights, Log Analytics)
      - אבטחה (Key Vault, Managed Identity)

### 3.3 מקור האפליקציה (`src/`)

**Backend API (`src/api/`)**:

- API מבוסס FastAPI
- אינטגרציה עם סוכני Foundry
- ניהול אינדקסי חיפוש לאחזור ידע
- יכולות העלאת ועיבוד קבצים

**Frontend (`src/frontend/`)**:

- SPA מודרנית מבוססת React/TypeScript
- Vite לפיתוח מהיר ובניית קוד אופטימלית
- ממשק צ'אט לאינטראקציה עם הסוכן

**בסיס ידע (`src/files/`)**:

- דוגמאות לנתוני לקוח ומוצר
- מדגים אחזור ידע מבוסס קבצים
- דוגמאות בפורמט JSON ו-Markdown


### 3.4 DevOps ואוטומציה

**סקריפטים (`scripts/`)**:

- סקריפטים רב-פלטפורמיים ב-PowerShell ו-Bash
- אימות סביבת הפיתוח וקונפיגורציה
- הגדרות פוסט פריסה
- ניהול מכסת מודל

**אינטגרציה עם Azure Developer CLI**:

- קונפיגורציית `azure.yaml` עבור זרימות עבודה ב-`azd`
- פרוביזיה ופריסה אוטומטית
- ניהול משתני סביבה

### 3.5 בדיקות ואבטחת איכות

**מסגרת הערכה (`evals/`)**:

- הערכת ביצועי הסוכן
- בדיקות איכות תשובה-שאילתה
- פייפליין הערכה אוטומטית

**בטיחות AI (`airedteaming/`)**:

- בדיקות צוות אדום לבטיחות AI
- סריקות פגיעות אבטחה
- פרקטיקות AI אחראיות

---

## 4. ברכות 🏆

הצלחת להשתמש ב-GitHub Copilot Chat עם שרתי MCP, כדי לחקור את הרפוזיטורי.

- [X] הפעלת GitHub Copilot עבור Azure
- [X] הבנת ארכיטקטורת היישום
- [X] חקר מבנה תבנית AZD

זה נותן לך תחושה של נכסי _תשתית כקוד_ לתבנית זו. בהמשך, נבחן את קובץ הקונפיגורציה של AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**הצהרת אחריות**:  
מסמך זה תורגם באמצעות שירות תרגום בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים לכלול שגיאות או אי-דיוקים. המסמך המקורי בשפתו המקורית יש להיחשב כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי של אדם. אנו לא אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->