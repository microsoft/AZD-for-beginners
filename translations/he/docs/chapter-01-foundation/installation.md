# מדריך התקנה והגדרה

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [בסיסי AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מבוסס AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## מבוא

מדריך מקיף זה יספק לך הנחיות להתקנה והגדרת Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה שונות למערכות הפעלה שונות, כיצד להגדיר אימות והגדרות ראשוניות כדי להכין את סביבת הפיתוח שלך לפריסות ב-Azure.

## מטרות הלמידה

בסיום השיעור, תוכל:
- להתקין בהצלחה את Azure Developer CLI על מערכת ההפעלה שלך
- להגדיר אימות עם Azure באמצעות שיטות מגוונות
- להגדיר את סביבת הפיתוח שלך עם כל הדרישות המקדימות
- להבין אפשרויות התקנה שונות ומתי להשתמש בכל אחת מהן
- לפתור תקלות נפוצות בהתקנה ובהגדרה

## תוצאות הלמידה

לאחר סיום השיעור, תוכל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לאמת עם Azure באמצעות הפקודה azd auth login
- לוודא שההתקנה עברה בהצלחה ולבדוק פקודות בסיסיות של azd
- להגדיר את סביבת הפיתוח שלך לשימוש אופטימלי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יסייע לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא קשר למערכת ההפעלה או סביבת הפיתוח שלך.

## דרישות מוקדמות

לפני התקנת azd, ודא שיש לך:
- **מנוי Azure** - [צור חשבון חינמי](https://azure.microsoft.com/free/)
- **Azure CLI** (אופציונלי) - עבור דוגמאות שמריצות במפורש `az`; azd מאמת עצמאי
- **Git** - לשכפול תבניות וניהול גרסאות
- **Docker** (אופציונלי) - עבור אפליקציות מכוליות

## שיטות התקנה

### Windows

#### אפשרות 1: מנהל החבילות של Windows (מומלץ)
```cmd
winget install microsoft.azd
```

#### אפשרות 2: סקריפט התקנה ב-PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### אפשרות 3: Chocolatey
```cmd
choco install azd
```

#### אפשרות 4: התקנה ידנית
1. הורד את הגרסה העדכנית מ-[GitHub](https://github.com/Azure/azure-dev/releases)
2. חלץ ל-`C:\Program Files\azd\`
3. הוסף למשתנה הסביבה PATH

### macOS

#### אפשרות 1: Homebrew (מומלץ)
```bash
brew tap azure/azd
brew install azd
```

#### אפשרות 2: סקריפט התקנה
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אפשרות 3: התקנה ידנית
הורד את הארכיון עבור הארכיטקטורה של macOS שלך מ-[נכסי הגרסה](https://github.com/Azure/azure-dev/releases), חלץ אותו, והוסף את הבינארי `azd` ל-`PATH` שלך.

### Linux

#### אפשרות 1: סקריפט התקנה (מומלץ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אפשרות 2: מנהלי חבילות

**התקנה ידנית מנכסי הגרסה:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

כמה סביבות Codespaces ומכולות פיתוח כבר כוללות את `azd`, אבל כדאי לוודא זאת במקום להניח:

```bash
azd version
```

אם `azd` חסר, התקן אותו עם הסקריפט הסטנדרטי לסביבה.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

מכולה אפמרית זו אינה שומרת מצב התחברות בין הרצות. לפריסות חוזרות, השתמש בהגדרת [מכולת פיתוח](dev-containers.md); בניית מכולות גם דורשת דמון Docker נגיש מתוך המכולה.

## ✅ אימות התקנה

לאחר ההתקנה, ודא ש-azd עובד כראוי:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

פלט צפוי:
```
azd version 1.x.x (commit xxxxxx)
```

**הערה**: מספר הגרסה בפועל ישתנה. בדוק את [גרסאות Azure Developer CLI](https://github.com/Azure/azure-dev/releases) לגרסה העדכנית ביותר.

**✅ רשימת בדיקה להצלחה בהתקנה:**
- [ ] `azd version` מציג מספר גרסה ללא שגיאות
- [ ] `azd --help` מציג תיעוד פקודות
- [ ] `azd template list` מציג תבניות זמינות
- [ ] ניתן ליצור תיקיית בדיקה ולהריץ בהצלחה את `azd init`

**אם כל הבדיקות עברו, אתה מוכן להמשיך ל[הפרויקט הראשון שלך](first-project.md)!**

## הגדרת אימות

### הגדרת מתחילים מומלצת

עבור זרמי עבודה המתחילים עם AZD, היכנס עם `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

השתמש בהתחברות עם Azure CLI רק אם אתה מתכנן להריץ פקודות `az` בעצמך במהלך הקורס.

### אימות באמצעות Azure CLI (אופציונלי)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### איזה מסלול התחברות כדאי להשתמש?

- השתמש ב-`azd auth login` אם אתה עוקב אחר מסלול AZD למתחילים ומריץ בעיקר פקודות `azd`.
- השתמש גם ב-`az login` כשאתה רוצה להריץ פקודות Azure CLI כמו `az account show` או לבדוק משאבים ישירות.
- אם תרגיל כולל גם פקודות `azd` וגם `az`, הרץ את שתי פקודות ההתחברות פעם אחת בתחילת הדרך.

### אימות קוד מכשיר
אם אתה עובד במערכת ללא ממשק משתמש גרפי או נתקל בבעיות בדפדפן:
```bash
azd auth login --use-device-code
```

### שירות פרסונלי (CI/CD)
עבור סביבות אוטומטיות:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### אימות הגדרה מלאה

אם אתה רוצה בדיקת מוכנות מהירה לפני התחלת פרק 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## תצורה

### תצורה גלובלית
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### משתני סביבה
הוסף לפרופיל הטרמינל שלך (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## אינטגרציה עם סביבת פיתוח משולבת (IDE)

### Visual Studio Code
התקן את הרחבת Azure Developer CLI:
1. פתח את VS Code
2. עבור לתוספים (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- IntelliSense עבור azure.yaml
- פקודות טרמינל משולבות
- דפדוף בתבניות
- ניטור פריסות

### GitHub Codespaces
צור `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. התקן את התוסף של Azure
2. הגדר את האישורים של Azure
3. השתמש בטרמינל המשולב לפקודות azd

## 🐛 פתרון תקלות בהתקנה

### בעיות נפוצות

#### הרשאה נדחתה (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### בעיות PATH
הוסף את azd ל-PATH באופן ידני:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### בעיות רשת/פרוקסי
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### קונפליקטים בגרסאות
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### קבלת עזרה נוספת
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## עדכון azd

### בדיקת עדכון
azd מזהיר כשהגרסה החדשה זמינה, ואתה יכול לאשר את הבנייה הנוכחית שלך עם:
```bash
azd version
```

### עדכונים ידניים

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 שאלות נפוצות

<details>
<summary><strong>מה ההבדל בין azd ו-az CLI?</strong></summary>

**Azure CLI (az)**: כלי ברמת נמוכה לניהול משאבי Azure בודדים
- `az webapp create`, `az storage account create`
- משאב אחד בכל פעם
- מיקוד בניהול תשתיות

**Azure Developer CLI (azd)**: כלי ברמת גבוהה לפריסות אפליקציות מלאות
- `azd up` מפריס אפליקציה שלמה עם כל המשאבים
- זרמי עבודה מבוססי תבניות
- מיקוד בפרודוקטיביות מפתח

**הם עצמאים**: azd משתמש באימות משלו כברירת מחדל. התקן והתחבר ל-Azure CLI רק עבור פקודות `az`, או בחר במודע להשתמש ב-`azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd עם משאבי Azure קיימים?</strong></summary>

כן! אתה יכול:
1. לייבא משאבים קיימים לסביבות azd
2. להפנות למשאבים קיימים בתבניות Bicep שלך
3. להשתמש ב-azd לפריסות חדשות לצד תשתית קיימת

ראו [מדריך ההגדרות](../chapter-03-configuration/configuration.md) לפרטים.
</details>

<details>
<summary><strong>האם azd עובד עם Azure Government או Azure China?</strong></summary>

כן, הגדר את הענן:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

אם אתה משתמש גם ב-Azure CLI, הגדר את `az cloud set --name ...` בנפרד. שירותי תבניות וזמינות דגם משתנים לפי הענן.
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd בצנרת CI/CD?</strong></summary>

בהחלט! azd מיועד לאוטומציה:
- אינטגרציה עם GitHub Actions
- תמיכה ב-Azure DevOps
- אימות שירות פרסונלי
- מצב לא אינטראקטיבי

ראו [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) לדפוסי CI/CD.
</details>

<details>
<summary><strong>מה עלות השימוש ב-azd?</strong></summary>

azd עצמו הוא **חינמי לחלוטין** וקוד פתוח. אתה משלם רק עבור:
- משאבי Azure שאתה מפריס
- עלויות צריכת Azure (חישוב, אחסון וכו')

השתמש ב-`azd provision --preview` כדי לבדוק את המשאבים המוצעים, ואז חשב את העלויות שלהם עם [מחשבון מחירי Azure](https://azure.microsoft.com/pricing/calculator/). תצוגה מוקדמת אינה מחשבת מחירים.
</details>

## הצעדים הבאים

1. **השלים אימות**: ודא שאתה יכול לגשת למנוי Azure שלך
2. **נסה את הפריסה הראשונה שלך**: עקוב אחר [מדריך הפרויקט הראשון](first-project.md)
3. **חקור תבניות**: דפדף בתבניות זמינות עם `azd template list`
4. **הגדר את סביבת הפיתוח שלך**: הגדר את סביבת הפיתוח שלך

## תמיכה

אם אתה נתקל בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דווח על בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים בקהילה](https://github.com/Azure/azure-dev/discussions)
- [תמיכה של Azure](https://azure.microsoft.com/support/)
- [**כישורי סוכן Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - קבל הנחיות פקודות Azure ישירות בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [בסיסי AZD](azd-basics.md) 
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מבוסס AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ההתקנה הושלמה!** המשך ל-[הפרויקט הראשון שלך](first-project.md) כדי להתחיל לבנות עם azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->