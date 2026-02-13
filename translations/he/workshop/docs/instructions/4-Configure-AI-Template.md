# 4. קבע תבנית

!!! tip "בסוף מודול זה תוכל ל"

    - [ ] להבין את מטרת הקובץ `azure.yaml`
    - [ ] להבין את המבנה של `azure.yaml`
    - [ ] להבין את הערך של azd lifecycle `hooks`
    - [ ] **מעבדה 4:** חקור ושנה משתני סביבה

---

!!! prompt "מה עושה הקובץ `azure.yaml`? השתמש בגדר קוד והסבר שורה אחרי שורה"

      הקובץ `azure.yaml` הוא **קובץ התצורה עבור Azure Developer CLI (azd)**. הוא מגדיר כיצד יש לפרוס את היישום שלך לאזור Azure, כולל תשתית, שירותים, hooks לפריסה ומשתני סביבה.

---

## 1. מטרה ופונקציונליות

קובץ ה-`azure.yaml` משמש כ-**מפת פריסה** עבור יישום סוכן AI ש:

1. **מאמת את הסביבה** לפני הפריסה
2. **מספק שירותי AI של Azure** (AI Hub, AI Project, Search וכו')
3. **מפרסם יישום Python** ל-Azure Container Apps
4. **מגדיר מודלי AI** עבור הן שיחות והן פונקציונליות הטמעה
5. **מגדיר ניטור ומעקב** עבור יישום ה-AI
6. **מטפל בתרחישי פרויקט AI חדשים וקיימים** ב-Azure

הקובץ מאפשר **פריסה בפקודה אחת** (`azd up`) של פתרון סוכן AI מלא עם אימות, אספקה, ותצורה לאחר הפריסה.

??? info "הרחב לצפייה: `azure.yaml`"

      הקובץ `azure.yaml` מגדיר כיצד Azure Developer CLI צריך לפרוס ולנהל את יישום סוכן ה-AI הזה ב-Azure. בואו נעבור עליו שורה אחר שורה.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: האם אנחנו צריכים hooks?
      # TODO: האם אנחנו צריכים את כל המשתנים?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. פירוק הקובץ

בואו נעבור על הקובץ חלק חלק, כדי להבין מה הוא עושה - ולמה.

### 2.1 **כותרת וסכמה (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **שורה 1**: מספק אימות סכמה עבור שרת שפת YAML לתמיכה ב-IDE ו-IntelliSense

### 2.2 מטא-נתוני הפרויקט (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **שורה 5**: מגדיר את שם הפרויקט המשמש על ידי Azure Developer CLI  
- **שורות 6-7**: מציין שזה מבוסס על תבנית בגרסה 1.0.2  
- **שורות 8-9**: דורש גרסת Azure Developer CLI 1.14.0 ומעלה

### 2.3 Hooks לפריסה (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **שורות 11-20**: **Hook לפני פריסה** - רץ לפני `azd up`

      - בלינוקס/יוניקס: הופך את סקריפט האימות להרצה ומריץ אותו  
      - ב-Windows: מריץ סקריפט אימות ב-PowerShell  
      - שניהם אינטראקטיביים ועוצרים פריסה אם הם נכשלו

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **שורות 21-30**: **Hook לאחר אספקה** - רץ אחרי יצירת משאבים ב-Azure  

  - מריץ סקריפטי כתיבה של משתני סביבה  
  - ממשיך בפריסה גם אם הסקריפטים נכשלו (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **שורות 31-40**: **Hook לאחר פריסה** - רץ אחרי פריסת היישום

  - מריץ סקריפטים סופיים להגדרות  
  - ממשיך גם אם סקריפטים נכשלו

### 2.4 תצורת שירות (41-48)

זה מגדיר את שירות היישום שאתה מפרסם.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **שורה 42**: מגדיר שירות בשם "api_and_frontend"  
- **שורה 43**: מצביע לתיקיית `./src` לקוד המקור  
- **שורה 44**: מציין שפת תכנות Python  
- **שורה 45**: משתמש בפלטפורמת Azure Container Apps לאירוח  
- **שורות 46-48**: תצורת Docker

      - משתמש בשם התמונה "api_and_frontend"  
      - בונה את תמונת הדוקר מרחוק ב-Azure (ולא מקומית)

### 2.5 משתני Pipeline (49-76)

אלה משתנים שיעזרו לך להפעיל `azd` בצינורות CI/CD לאוטומציה

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

החלק הזה מגדיר משתני סביבה הנמצאים בשימוש **בעת הפריסה**, מאורגנים לפי קטגוריה:

- **שמות משאבי Azure (שורות 51-60)**:  
      - שמות משאבים מרכזיים ב-Azure כגון Resource Group, AI Hub, AI Project, וכו'  
- **דגלי תכונות (שורות 61-63)**:  
      - משתני בוליאן להפעלה/כיבוי של שירותי Azure ספציפיים  
- **תצורת סוכן AI (שורות 64-71)**:  
      - תצורה עבור סוכן ה-AI הראשי כולל שם, מזהה, הגדרות פריסה, פרטי מודל  
- **תצורת הטמעת AI (שורות 72-79)**:  
      - תצורה עבור מודל ההטמעה המשמש לחיפוש וקטורי  
- **חיפוש וניטור (שורות 80-84)**:  
      - שם אינדקס החיפוש, מזהי משאבים קיימים, והגדרות ניטור/מעקב

---

## 3. הכירו את משתני הסביבה
משתני הסביבה הבאים שולטים בתצורה ובהתנהגות של הפריסה שלך, מאורגנים לפי מטרתם העיקרית. רוב המשתנים מוגדרים עם ערכי ברירת מחדל סבירים, אך ניתן להתאים אותם כדי להתאים לדרישותיך הספציפיות או למשאבי Azure קיימים.

### 3.1 משתנים דרושים

```bash title="" linenums="0"
# תצורת Azure בסיסית
AZURE_ENV_NAME                    # שם סביבה (משמש בשם המשאב)
AZURE_LOCATION                    # אזור הפריסה
AZURE_SUBSCRIPTION_ID             # מנוי יעד
AZURE_RESOURCE_GROUP              # שם קבוצת המשאבים
AZURE_PRINCIPAL_ID                # משתמש עיקרי עבור RBAC

# שמות משאבים (נוצרים אוטומטית אם לא צוינו)
AZURE_AIHUB_NAME                  # שם מרכז Microsoft Foundry
AZURE_AIPROJECT_NAME              # שם פרויקט ה-AI
AZURE_AISERVICES_NAME             # שם חשבון שירותי ה-AI
AZURE_STORAGE_ACCOUNT_NAME        # שם חשבון האחסון
AZURE_CONTAINER_REGISTRY_NAME     # שם רשם המכולות
AZURE_KEYVAULT_NAME               # שם Key Vault (אם בשימוש)
```

### 3.2 תצורת מודל

```bash title="" linenums="0"
# תצורת מודל הצ'אט
AZURE_AI_AGENT_MODEL_NAME         # ברירת מחדל: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ברירת מחדל: OpenAI (או Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # ברירת מחדל: האחרונה הזמינה
AZURE_AI_AGENT_DEPLOYMENT_NAME    # שם פריסה למודל הצ'אט
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ברירת מחדל: סטנדרט
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ברירת מחדל: 80 (אלפי TPM)

# תצורת מודל ההטמעות
AZURE_AI_EMBED_MODEL_NAME         # ברירת מחדל: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ברירת מחדל: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ברירת מחדל: האחרונה הזמינה
AZURE_AI_EMBED_DEPLOYMENT_NAME    # שם פריסה להטמעות
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ברירת מחדל: סטנדרט
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ברירת מחדל: 50 (אלפי TPM)

# תצורת סוכן
AZURE_AI_AGENT_NAME               # שם תצוגת הסוכן
AZURE_EXISTING_AGENT_ID           # השתמש בסוכן קיים (אופציונלי)
```

### 3.3 הפעלת תכונה

```bash title="" linenums="0"
# שירותים אופציונליים
USE_APPLICATION_INSIGHTS         # ברירת מחדל: נכון
USE_AZURE_AI_SEARCH_SERVICE      # ברירת מחדל: שקר
USE_CONTAINER_REGISTRY           # ברירת מחדל: נכון

# מעקב ואיתור
ENABLE_AZURE_MONITOR_TRACING     # ברירת מחדל: שקר
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ברירת מחדל: שקר

# תצורת חיפוש
AZURE_AI_SEARCH_INDEX_NAME       # שם אינדקס החיפוש
AZURE_SEARCH_SERVICE_NAME        # שם שירות החיפוש
```

### 3.4 תצורת פרויקט AI

```bash title="" linenums="0"
# השתמש במשאבים קיימים
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # מזהה משאב מלא של פרויקט בינה מלאכותית קיים
AZURE_EXISTING_AIPROJECT_ENDPOINT       # כתובת נקודת הקצה של הפרויקט הקיים
```

### 3.5 בדוק את המשתנים שלך

השתמש ב-Azure Developer CLI כדי לצפות ולנהל את משתני הסביבה שלך:

```bash title="" linenums="0"
# הצג את כל משתני הסביבה עבור הסביבה הנוכחית
azd env get-values

# קבל משתנה סביבה ספציפי
azd env get-value AZURE_ENV_NAME

# הגדר משתנה סביבה
azd env set AZURE_LOCATION eastus

# הגדר משתנים מרובים מקובץ .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, יש להיות מודעים לכך שתירגומים אוטומטיים עלולים להכיל טעויות או אי-דיוקים. המסמך המקורי בשפת המקור שלו צריך להיחשב כמקור הסמכותי. עבור מידע קריטי מומלץ להיעזר בתרגום מקצועי על ידי אנשים. לא נושא באחריות על אי-הבנות או פרשנויות שגויות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->