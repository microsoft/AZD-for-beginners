# 4. הגדר תבנית

!!! tip "בסוף מודול זה תוכל"

    - [ ] להבין את המטרה של `azure.yaml`
    - [ ] להבין את המבנה של `azure.yaml`
    - [ ] להבין את הערך של "hooks" במחזור החיים של azd
    - [ ] **מעבדה 4:** לחקור ולערוך משתני סביבה

---

!!! prompt "למה משמש קובץ `azure.yaml`? השתמש בגדר קוד והסבר שורה שורה"

      קובץ `azure.yaml` הוא **קובץ התצורה של Azure Developer CLI (azd)**. הוא מגדיר כיצד האפליקציה שלך צריכה להיות מופעלת ב-Azure, כולל תשתית, שירותים, hooks לפריסה ומשתני סביבה.

---

## 1. מטרה ופונקציונליות

קובץ `azure.yaml` זה משמש כ**תוכנית פריסה** לאפליקציית סוכן AI שמבצעת:

1. **אימות סביבה** לפני הפריסה
2. **הקמת שירותי Azure AI** (AI Hub, AI Project, Search וכו')
3. **פריסת אפליקציית פייתון** ב-Azure Container Apps
4. **הגדרת דגמי AI** לצ'אט ולשימוש בהטמעות (embedding)
5. **הקמת ניטור ומעקב** לאפליקציית ה-AI
6. **ניהול מקרים של פרויקט AI קיים וחדש**

הקובץ מאפשר **פריסה בפקודה אחת** (`azd up`) לפתרון סוכן AI מלא, עם אימות, הקמה וקינפוג לאחר הפריסה.

??? info "הרחבה לתצוגה: `azure.yaml`"

      קובץ `azure.yaml` מגדיר כיצד Azure Developer CLI צריך לפרוס ולנהל את אפליקציית סוכן ה-AI הזו ב-Azure. נפרט שורה שורה.

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

נעבור על הקובץ חלק אחר חלק, כדי להבין מה הוא עושה ולמה.

### 2.1 **כותרת וסכימה (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **שורה 1**: מספק סקימת אימות לשפת YAML עבור IDE ותמיכה באינטליסנס

### 2.2 מטא-דאטה של הפרויקט (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **שורה 5**: מגדיר את שם הפרויקט המשמש את Azure Developer CLI
- **שורות 6-7**: מציין שזה מבוסס על תבנית בגרסה 1.0.2
- **שורות 8-9**: דורש גרסת Azure Developer CLI 1.14.0 ומעלה

### 2.3 hooks לפריסה (11-40)

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

- **שורות 11-20**: **hook לפני פריסה** - רץ לפני `azd up`

      - ב-Unix/Linux: הופך את סקריפט האימות להרצה ומריץ אותו
      - ב-Windows: מריץ סקריפט אימות ב-PowerShell
      - שניהם אינטראקטיביים ועוצרים פריסה במקרה של כישלון

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
- **שורות 21-30**: **hook לאחר הקמה** - רץ לאחר יצירת המשאבים של Azure

  - מריץ סקריפטים לכתיבת משתני סביבה
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
- **שורות 31-40**: **hook לאחר פריסה** - רץ לאחר פריסת האפליקציה

  - מריץ סקריפטים לסידור סופי
  - ממשיך גם אם הסקריפטים נכשלו

### 2.4 קונפיגורציית שירות (41-48)

זו הקונפיגורציה של שירות האפליקציה שאתה מפרוס.

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
- **שורה 43**: מצביע לתיקיית המקור `./src`
- **שורה 44**: מציין שפת פייתון
- **שורה 45**: משתמש בפלטפורמת Azure Container Apps לאירוח
- **שורות 46-48**: קונפיגורציית דוקר

      - שם התמונה הוא "api_and_frontend"
      - בונה את תמונת הדוקר מרחוק ב-Azure (ולא במחשב מקומי)

### 2.5 משתני צינור (49-76)

אלו משתנים שיעזרו לך להריץ את `azd` בצינורות CI/CD לאוטומציה

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

בחלק זה מוגדרים משתני סביבה שמשמשים **במהלך הפריסה**, מאורגנים לפי קטגוריה:

- **שמות משאבי Azure (שורות 51-60)**:
      - שמות משאבי ליבה כמו Resource Group, AI Hub, AI Project וכו'.
- **דגלי תכונות (שורות 61-63)**:
      - משתנים בוליאניים להפעיל/לבטל שירותי Azure ספציפיים
- **קונפיגורציית סוכן AI (שורות 64-71)**:
      - קונפיגורציה עבור סוכן ה-AI הראשי כולל שם, מזהה, הגדרות פריסה, פרטי מודל
- **קונפיגורציית הטמעות AI (שורות 72-79)**:
      - קונפיגורציה למודל ההטמעות המשמש לחיפוש וקטורי
- **חיפוש וניטור (שורות 80-84)**:
      - שם אינדקס החיפוש, מזהי משאבים קיימים, והגדרות ניטור/מעקב

---

## 3. הכר את משתני הסביבה
משתני הסביבה הבאים שולטות בהגדרות ובהתנהגות הפריסה שלך, מאורגנים לפי מטרתם העיקרית. רוב המשתנים מכילים ערכי ברירת מחדל הגיוניים, אך תוכל להתאים אותם לצרכים או למשאבי Azure קיימים שלך.

### 3.1 משתנים נדרשים 

```bash title="" linenums="0"
# תצורת Azure בסיסית
AZURE_ENV_NAME                    # שם הסביבה (משמש בשם המשאב)
AZURE_LOCATION                    # אזור הפריסה
AZURE_SUBSCRIPTION_ID             # מנוי יעד
AZURE_RESOURCE_GROUP              # שם קבוצת המשאבים
AZURE_PRINCIPAL_ID                # משתמש ראשי ל-RBAC

# שמות משאבים (נוצרים אוטומטית אם לא צוין)
AZURE_AIHUB_NAME                  # שם מרכז Microsoft Foundry
AZURE_AIPROJECT_NAME              # שם פרויקט הבינה המלאכותית
AZURE_AISERVICES_NAME             # שם חשבון שירותי הבינה המלאכותית
AZURE_STORAGE_ACCOUNT_NAME        # שם חשבון האחסון
AZURE_CONTAINER_REGISTRY_NAME     # שם רישום מכולות
AZURE_KEYVAULT_NAME               # שם Key Vault (אם בשימוש)
```

### 3.2 קונפיגורציית מודל 
```bash title="" linenums="0"
# תצורת דגם שיחה
AZURE_AI_AGENT_MODEL_NAME         # ברירת מחדל: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # ברירת מחדל: OpenAI (או מיקרוסופט)
AZURE_AI_AGENT_MODEL_VERSION      # ברירת מחדל: העדכני ביותר הזמין
AZURE_AI_AGENT_DEPLOYMENT_NAME    # שם הפצת דגם שיחה
AZURE_AI_AGENT_DEPLOYMENT_SKU     # ברירת מחדל: סטנדרטי
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # ברירת מחדל: 80 (אלפי TPM)

# תצורת דגם הטמעה
AZURE_AI_EMBED_MODEL_NAME         # ברירת מחדל: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # ברירת מחדל: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # ברירת מחדל: העדכני ביותר הזמין
AZURE_AI_EMBED_DEPLOYMENT_NAME    # שם הפצה להטמעות
AZURE_AI_EMBED_DEPLOYMENT_SKU     # ברירת מחדל: סטנדרטי
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # ברירת מחדל: 50 (אלפי TPM)

# תצורת סוכן
AZURE_AI_AGENT_NAME               # שם תצוגה של הסוכן
AZURE_EXISTING_AGENT_ID           # השתמש בסוכן קיים (אופציונלי)
```

### 3.3 הפעלת תכונות (Feature Toggle)
```bash title="" linenums="0"
# שירותים אופציונליים
USE_APPLICATION_INSIGHTS         # ברירת מחדל: אמת
USE_AZURE_AI_SEARCH_SERVICE      # ברירת מחדל: שקר
USE_CONTAINER_REGISTRY           # ברירת מחדל: אמת

# ניטור ומעקב
ENABLE_AZURE_MONITOR_TRACING     # ברירת מחדל: שקר
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # ברירת מחדל: שקר

# תצורת חיפוש
AZURE_AI_SEARCH_INDEX_NAME       # שם אינדקס החיפוש
AZURE_SEARCH_SERVICE_NAME        # שם שירות החיפוש
```

### 3.4 קונפיגורציית פרויקט AI 
```bash title="" linenums="0"
# השתמש במשאבים קיימים
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # מזהה משאב מלא של פרויקט AI קיים
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
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדיוק, נא לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. המסמך המקורי בשפת המקור שלו ייחשב למקור הסמכותי. למידע קריטי מומלץ לבצע תרגום מקצועי על ידי בני אדם. איננו אחראים על הבנות מוטעות או פרשנויות שגויות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->