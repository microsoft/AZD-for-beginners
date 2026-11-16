# גיליון פקודות - פקודות AZD חיוניות

**התייחסות מהירה לכל הפרקים**
- **📚 דף הקורס**: [AZD למתחילים](../README.md)
- **📖 התחלה מהירה**: [פרק 1: יסודות והתחלה מהירה](../README.md#-chapter-1-foundation--quick-start)
- **🤖 פקודות AI**: [פרק 2: פיתוח מונחה AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 מתקדם**: [פרק 4: תשתית כקוד](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## מבוא

גיליון פקודות מקיף זה מספק התייחסות מהירה לפקודות ה-Azure Developer CLI הנפוצות ביותר, מאורגנות לפי קטגוריות עם דוגמאות מעשיות. מושלם לחיפוש מהיר במהלך פיתוח, פתרון תקלות ופעולות יומיומיות עם פרויקטים של azd.

## מטרות הלמידה

באמצעות גיליון פקודות זה, תוכל:
- לקבל גישה מיידית לפקודות וסינטקס חיוניים של Azure Developer CLI
- להבין ארגון פקודות לפי קטגוריות פונקציונליות ומקרי שימוש
- להתייחס לדוגמאות מעשיות לתרחישי פיתוח ופריסה נפוצים
- לגשת לפקודות פתרון תקלות לפתרון מהיר של בעיות
- למצוא אפשרויות תצורה וההתאמה מתקדמות ביעילות
- לאתר פקודות ניהול סביבה וזרימות עבודה מרובות-סביבה

## תוצאות הלמידה

עם התייחסות רגילה לגיליון פקודות זה, תוכל:
- להפעיל פקודות azd בביטחון ללא צורך בהתייחסות לתיעוד מלא
- לפתור במהירות בעיות נפוצות באמצעות פקודות אבחון מתאימות
- לנהל ביעילות סביבות ותסריטי פריסה מרובים
- ליישם תכונות ותצורות azd מתקדמות לפי הצורך
- לפתור בעיות פריסה באמצעות רצפים שיטתיים של פקודות
- לייעל זרימות עבודה באמצעות שימוש יעיל בקיצורי דרך ואפשרויות azd

## פקודות התחלה מהירה

### אימות
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### ייזום פרויקט
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## פקודות פריסה מרכזיות

### זרימת עבודה לפריסה מלאה
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### רק תשתית
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### רק אפליקציה
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### בנייה וחבילה
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** מוריד את התלויות של האפליקציה שלך (npm, pip, NuGet, Maven וכו'). הוא מופעל אוטומטית במהלך `azd package` ו-`azd deploy`, ולכן נדיר לקרוא לו ישירות — הפעל אותו ידנית כדי לקרוא מראש תלויות (לדוגמה, לחמם מטמון CI או לעבוד באופליין אחר כך).

> **`azd package`** מכין ארטיפקט לפריסה מבלי לפרוס את שירות האפליקציה. ההתנהגות תלויה בשפה והמארח: אריזת מכולות יכולה להשתמש בבניות מרוחקות ב-Azure ולפרסם תמונות לרג'יסטרי, לכן היא לא תמיד אופליין או ללא פעולות כתיבה ל-Azure. `azd deploy` יכול לארוז אוטומטית; השתמש בשלב אריזה נפרד כשאתה צריך ארטיפקט או בדיקת בנייה.


## 🌍 ניהול סביבה

### פעולות סביבה
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### משתני סביבה
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

קבצי סביבה הם טקסט רגיל. אל תטפל ב-`azd env set` כאחסון סודי; השתמש בהפניות Key Vault או זהות מנוהלת כנדרש.

## ⚙️ פקודות תצורה

### תצורה גלובלית
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### תצורת פרויקט
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 ניטור ואבחון

### לוח ניטור
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

יש להגדיר Application Insights באמצעות התבנית. אפשרות Live Metrics של AZD אינה נתמכת כרגע לאפליקציות Python; השתמש בסקירה, בלוגים או בזרימת עבודה המתועדת לדוגמה במקום.

### צפייה ביומני מכולות
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### שאילתות לניתוח יומנים
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ פקודות תחזוקה

### ניקוי
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### עדכונים
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 פקודות מתקדמות

### Pipeline ו-CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### ניהול תשתית
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### מידע על הפרויקט
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 פקודות AI והרחבות

### הרחבות AZD

הפניה ל-AI CLI תוקנה 2026-11-04: `azd 1.37.2`, סוכנים `1.0.0-beta.23`, הערכות `1.0.0-beta.2`. השתמש ב-`azd >= 1.37.0` לזרימת עבודה משולבת; שדרג את ה-CLI הראשי לפני הרחבות לא תואמות.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### פקודות סוכני AI
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` מחליפים את כתיב `--manifest`/`-m` שלא בשימוש; יש למנף את המניפסטים הישנים. אין כרגע אפשרות סוכן-שלבי `--host containerapp`. תצוגות ניהול מונחות, קול והרצות ארוכות דורשות הרשמה נפרדת לסביבה או לצלחת CI; עיין ב-[AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### הערכות ואופטימיזציה של AI
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

סוכנים beta.22 החליפו פקודות הערכה ישנות ל-`azd ai eval` מ-`azure.ai.evaluations`. תצורת הערכה חדשה משתמשת במפתחות camelCase. אופטימיזציה ב-`--config` דורשת בקשה נפרדת לממשק אופטימיזציה, **לא** ב-`eval.yaml` הישן או ב-`azure.eval.yaml` החדש; השתמש ב-`--eval`/`--eval-config` לשימוש חוזר בהערכה. עיין ב-[הגדרת הערכה](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ו-[הגירת אופטימיזציה](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### שרת MCP (אלפא)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### יצירת תשתית
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 זרימות עבודה מהירות

### זרימת פיתוח
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### זרימת עבודה מולטי-סביבה
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### זרימת פתרון תקלות
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 פקודות דיבוג

### מידע דיבוג
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### דיבוג תבנית
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 פקודות קבצים ותיקיות

### מבנה פרויקט
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 עיצוב פלט

### פלט JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### פלט טבלה
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 שילובי פקודות נפוצים

### סקריפט בדיקת בריאות
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### אימות פריסה
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### השוואת סביבות
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### סקריפט ניקוי משאבים
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 משתני סביבה

### משתני סביבה נפוצים
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 פקודות חירום

### תיקונים מהירים
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### פקודות שחזור
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 טיפים מקצועיים

### כינויים לזרימת עבודה מהירה יותר
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### קיצורי דרך לפונקציות
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 עזרה ותיעוד

### קבלת עזרה
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### קישורי תיעוד
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**טיפ**: שמור את גיליון הפקודות הזה בסימניות והשתמש ב-`Ctrl+F` כדי למצוא במהירות את הפקודות שאתה צריך!

---

**ניווט**
- **שיעור קודם**: [בדיקות מקדימות](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **שיעור הבא**: [מילון מונחים](glossary.md)

---

> **💡 רוצה עזרה לפקודות Azure בעורך שלך?** התקן את [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) עם `npx skills add microsoft/github-copilot-for-azure` — 37 כישורים ל-AI, Foundry, פריסה, אבחון ועוד.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->