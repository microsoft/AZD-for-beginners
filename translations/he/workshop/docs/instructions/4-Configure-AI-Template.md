# 4. הגדרת תבנית

!!! tip "בסיום המודול הזה תוכל"

    - [ ] להבין את מטרת הקובץ `azure.yaml`
    - [ ] להבין את מבנה הקובץ `azure.yaml`
    - [ ] להבין את הערך של `hooks` במחזור החיים של azd
    - [ ] **מעבדה 3:** 

---

!!! prompt "מה עושה קובץ `azure.yaml`? השתמש בקוד והסבר שורה אחר שורה"

      קובץ `azure.yaml` הוא **קובץ ההגדרות עבור Azure Developer CLI (azd)**. הוא מגדיר כיצד יש לפרוס את האפליקציה שלך ל-Azure, כולל תשתיות, שירותים, hooks לפריסה ומשתני סביבה.

---

## 1. מטרה ופונקציונליות

קובץ `azure.yaml` משמש כ**תוכנית פריסה** עבור אפליקציית סוכן AI שמבצעת:

1. **אימות סביבה** לפני הפריסה
2. **הקצאת שירותי Azure AI** (AI Hub, AI Project, Search ועוד)
3. **פריסת אפליקציית Python** ל-Azure Container Apps
4. **הגדרת מודלי AI** עבור פונקציונליות שיחה והטמעה
5. **הגדרת ניטור ומעקב** עבור אפליקציית ה-AI
6. **טיפול בתרחישים של פרויקטים חדשים וקיימים** ב-Azure AI

הקובץ מאפשר **פריסה בלחיצה אחת** (`azd up`) של פתרון סוכן AI מלא עם אימות נכון, הקצאה והגדרות לאחר הפריסה.

??? info "הרחב לצפייה: `azure.yaml`"

      קובץ `azure.yaml` מגדיר כיצד Azure Developer CLI צריך לפרוס ולנהל את אפליקציית סוכן ה-AI הזו ב-Azure. בואו נפרק אותו שורה אחר שורה.

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

בואו נעבור על הקובץ חלק אחר חלק, כדי להבין מה הוא עושה - ולמה.

### 2.1 **כותרת וסכימה (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **שורה 1**: מספקת אימות סכימה של שרת שפת YAML לתמיכה ב-IDE ואינטליסנס

### 2.2 מטא-נתונים של הפרויקט (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **שורה 5**: מגדירה את שם הפרויקט המשמש את Azure Developer CLI
- **שורות 6-7**: מציינת שהתבנית מבוססת על גרסה 1.0.2
- **שורות 8-9**: דורשת גרסה 1.14.0 או גבוהה יותר של Azure Developer CLI

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

      - ב-Unix/Linux: הופך את סקריפט האימות לביצוע ורץ אותו
      - ב-Windows: מריץ סקריפט אימות ב-PowerShell
      - שניהם אינטראקטיביים ויעצרו את הפריסה אם ייכשלו

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
- **שורות 21-30**: **Hook לאחר הקצאה** - רץ לאחר יצירת משאבי Azure

  - מבצע סקריפטים לכתיבת משתני סביבה
  - ממשיך בפריסה גם אם הסקריפטים נכשלים (`continueOnError: true`)

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
- **שורות 31-40**: **Hook לאחר פריסה** - רץ לאחר פריסת האפליקציה

  - מבצע סקריפטים להגדרות סופיות
  - ממשיך גם אם הסקריפטים נכשלים

### 2.4 הגדרת שירות (41-48)

הגדרה זו מגדירה את שירות האפליקציה שאתה מפריס.

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

- **שורה 42**: מגדירה שירות בשם "api_and_frontend"
- **שורה 43**: מציינת את ספריית `./src` עבור קוד המקור
- **שורה 44**: מציינת את Python כשפת התכנות
- **שורה 45**: משתמשת ב-Azure Container Apps כפלטפורמת אירוח
- **שורות 46-48**: הגדרות Docker

      - משתמשת ב-"api_and_frontend" כשם התמונה
      - בונה את תמונת Docker מרחוק ב-Azure (לא מקומית)

### 2.5 משתני Pipeline (49-76)

אלו משתנים שמסייעים לך להריץ `azd` ב-CI/CD עבור אוטומציה

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

החלק הזה מגדיר משתני סביבה המשמשים **במהלך הפריסה**, מאורגנים לפי קטגוריה:

- **שמות משאבי Azure (שורות 51-60)**:
      - שמות משאבי שירותי Azure מרכזיים, לדוגמה, Resource Group, AI Hub, AI Project ועוד
- **דגלי תכונות (שורות 61-63)**:
      - משתנים בוליאניים להפעלה/השבתה של שירותי Azure ספציפיים
- **הגדרת סוכן AI (שורות 64-71)**:
      - הגדרות עבור סוכן ה-AI הראשי כולל שם, מזהה, הגדרות פריסה, פרטי מודל
- **הגדרת הטמעה של AI (שורות 72-79)**:
      - הגדרות עבור מודל ההטמעה המשמש לחיפוש וקטורי
- **חיפוש וניטור (שורות 80-84)**:
      - שם אינדקס חיפוש, מזהי משאבים קיימים והגדרות ניטור/מעקב

---

## 3. הכרת משתני סביבה
משתני הסביבה הבאים שולטים בתצורת הפריסה שלך ובהתנהגותה, מאורגנים לפי מטרתם העיקרית. לרוב המשתנים יש ערכים ברירת מחדל הגיוניים, אך ניתן להתאים אותם לצרכים הספציפיים שלך או למשאבי Azure קיימים.

### 3.1 משתנים נדרשים 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 הגדרת מודל 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 הפעלת תכונות
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 הגדרת פרויקט AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 בדוק את המשתנים שלך

השתמש ב-Azure Developer CLI כדי לצפות ולנהל את משתני הסביבה שלך:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

