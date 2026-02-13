# מדריך התקנה והגדרה

**ניווט בפרק:**
- **📚 דף הקורס**: [AZD For Beginners](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [AZD Basics](azd-basics.md)
- **➡️ הבא**: [Your First Project](first-project.md)
- **🚀 הפרק הבא**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## מבוא

המדריך המקיף הזה יוביל אותך בהתקנה ובהגדרה של Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה מרובות עבור מערכות הפעלה שונות, הגדרת אימות ואתחול ראשוני כדי להכין את סביבת הפיתוח שלך לפריסות ב-Azure.

## מטרות למידה

בסוף השיעור הזה, תוכל:
- להתקין בהצלחה את Azure Developer CLI על מערכת ההפעלה שלך
- להגדיר אימות מול Azure בעזרת שיטות שונות
- להגדיר את סביבת הפיתוח עם הדרישות המקדימות הנחוצות
- להבין אפשרויות התקנה שונות ומתי להשתמש בכל אחת מהן
- לתקן בעיות נפוצות בהתקנה ובהגדרה

## תוצאות למידה

לאחר השלמת השיעור, תהיה מסוגל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לאמת מול Azure בעזרת azd auth login
- לאמת את ההתקנה ולבדוק פקודות azd בסיסיות
- להגדיר את סביבת הפיתוח לשימוש אופטימלי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יעזור לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא קשר למערכת ההפעלה או סביבת הפיתוח שלך.

## דרישות מוקדמות

לפני התקנת azd, וודא שיש לך:
- **מנוי Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - לאימות וניהול משאבים
- **Git** - לשכפול תבניות ולבקרת גרסאות
- **Docker** (אופציונלי) - עבור יישומים מכולתיים

## שיטות התקנה

### Windows

#### אופציה 1: PowerShell (מומלץ)
```powershell
# הפעל כמנהל או בהרשאות מוגברות
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### אופציה 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### אופציה 3: Chocolatey
```cmd
choco install azd
```

#### אופציה 4: התקנה ידנית
1. הורד את הגרסה העדכנית מ-[GitHub](https://github.com/Azure/azure-dev/releases)
2. חלץ אל `C:\Program Files\azd\`
3. הוסף ל-PATH של משתני הסביבה

### macOS

#### אופציה 1: Homebrew (מומלץ)
```bash
brew tap azure/azd
brew install azd
```

#### אופציה 2: סקריפט התקנה
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אופציה 3: התקנה ידנית
```bash
# הורד והתקן
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### אופציה 1: סקריפט התקנה (מומלץ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אופציה 2: מנהלי חבילות

**Ubuntu/Debian:**
```bash
# הוסף מאגר חבילות של Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# התקן את azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# הוסף מאגר חבילות של Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd מותקן מראש ב-GitHub Codespaces. פשוט צור codespace והתחל להשתמש ב-azd מיד.

### Docker

```bash
# הרץ את azd בתוך קונטיינר
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# צור כינוי לשימוש נוח יותר
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ אימות התקנה

לאחר ההתקנה, אמת ש-azd פועל כהלכה:

```bash
# בדוק גרסה
azd version

# הצג עזרה
azd --help

# הצג תבניות זמינות
azd template list
```

פלט צפוי:
```
azd version 1.x.x (commit xxxxxx)
```

**הערה**: מספר הגרסה בפועל ישתנה. בדוק את [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) עבור הגרסה העדכנית ביותר.

**✅ רשימת בדיקה להשלמת התקנה:**
- [ ] `azd version` מציג מספר גרסה ללא שגיאות
- [ ] `azd --help` מציג את תיעוד הפקודות
- [ ] `azd template list` מציג תבניות זמינות
- [ ] `az account show` מציג את מנוי ה-Azure שלך
- [ ] אתה יכול ליצור תיקיית בדיקה ולהריץ `azd init` בהצלחה

**אם כל הבדיקות עוברות, אתה מוכן להמשיך ל-[Your First Project](first-project.md)!**

## הגדרת אימות

### אימות עם Azure CLI (מומלץ)
```bash
# התקן את Azure CLI אם אינו מותקן כבר
# Windows: השתמש ב-'winget install Microsoft.AzureCLI'
# macOS: השתמש ב-'brew install azure-cli'
# Linux: השתמש ב-'curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'

# התחבר ל-Azure
az login

# וודא את ההזדהות
az account show
```

### אימות בקוד מכשיר (Device Code)
אם אתה על מערכת ללא ממשק גרפי או נתקל בבעיות בדפדפן:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
עבור סביבות אוטומטיות:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## תצורה

### תצורה גלובלית
```bash
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription <subscription-id>

# הגדר מיקום ברירת מחדל
azd config set defaults.location eastus2

# הצג את כל ההגדרות
azd config list
```

### משתני סביבה
הוסף לפרופיל השיל שלך (`.bashrc`, `.zshrc`, `.profile`):
```bash
# תצורת Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# תצורת azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # הפעל רישום ניפוי שגיאות
```

## אינטגרציה עם IDE

### Visual Studio Code
התקן את תוסף Azure Developer CLI:
1. פתח את VS Code
2. עבור להרחבות (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- IntelliSense עבור azure.yaml
- פקודות משולבות במסוף
- גלישה בתבניות
- ניטור פריסות

### GitHub Codespaces
צור את `.devcontainer/devcontainer.json`:
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
2. הגדר אישורי Azure
3. השתמש בטרמינל המשולב עבור פקודות azd

## 🐛 פתרון תקלות בהתקנה

### בעיות נפוצות

#### הרשאה נדחתה (Windows)
```powershell
# הפעל את PowerShell כמנהל מערכת
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### בעיות PATH
הוסף ידנית את azd ל-PATH שלך:

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
# הגדר פרוקסי
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# דלג על אימות SSL (לא מומלץ בסביבת ייצור)
azd config set http.insecure true
```

#### קונפליקטים בגרסאות
```bash
# הסר התקנות ישנות
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# נקה את התצורה
rm -rf ~/.azd
```

### קבלת עזרה נוספת
```bash
# הפעל רישום לניפוי שגיאות
export AZD_DEBUG=true
azd <command> --debug

# הצג תצורה נוכחית
azd config list

# הצג מצב הפריסה הנוכחי
azd show
```

## עדכון azd

### עדכונים אוטומטיים
azd יודיע כאשר יש עדכונים זמינים:
```bash
azd version --check-for-updates
```

### עדכונים ידניים

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
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
<summary><strong>מה ההבדל בין azd ל-az CLI?</strong></summary>

**Azure CLI (az)**: כלי ברמת נמוכה לניהול משאבים בודדים ב-Azure
- `az webapp create`, `az storage account create`
- משאבים אחד-אחד
- מתמקד בניהול תשתיות

**Azure Developer CLI (azd)**: כלי ברמת גבוהה לפריסות יישומים שלמות
- `azd up` מפריס אפליקציה שלמה עם כל המשאבים
- זרימות עבודה מבוססות תבניות
- מתמקד בפרודוקטיביות המפתחים

**אתה צריך את שניהם**: azd משתמש ב-az CLI לאימות
</details>

<details>
<summary><strong>האם ניתן להשתמש ב-azd עם משאבי Azure קיימים?</strong></summary>

כן! אתה יכול:
1. לייבא משאבים קיימים לסביבות azd
2. להתייחס למשאבים קיימים בתבניות Bicep שלך
3. להשתמש ב-azd לפריסות חדשות לצד תשתית קיימת

עיין ב-[מדריך תצורה](configuration.md) לפרטים.
</details>

<details>
<summary><strong>האם azd עובד עם Azure Government או Azure China?</strong></summary>

כן, הגדר את הענן:
```bash
# אז׳ור ממשלתי
az cloud set --name AzureUSGovernment
az login

# אז׳ור סין
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>האם ניתן להשתמש ב-azd בצנרות CI/CD?</strong></summary>

בהחלט! azd תוכנן לאוטומציה:
- אינטגרציה עם GitHub Actions
- תמיכה ב-Azure DevOps
- אימות עם Service Principal
- מצב לאאינטראקטיבי

עיין ב-[Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) עבור תבניות CI/CD.
</details>

<details>
<summary><strong>מה עלות השימוש ב-azd?</strong></summary>

azd עצמו הוא **חינמי לחלוטין** וקוד פתוח. התשלום יתקבל רק על:
- משאבי Azure שתפרוס
- עלויות צריכה של Azure (חישוב, אחסון וכו')

השתמש ב-`azd provision --preview` כדי לאמוד עלויות לפני פריסה.
</details>

## הצעדים הבאים

1. **השלם את האימות**: ודא שיש לך גישה למנוי ה-Azure שלך
2. **נסה את הפריסה הראשונה שלך**: פעל לפי ה-[First Project Guide](first-project.md)
3. **חקור תבניות**: עיין בתבניות זמינות עם `azd template list`
4. **הגדר את ה-IDE שלך**: הקם את סביבת הפיתוח שלך

## תמיכה

אם נתקלים בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דווח על בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים בקהילה](https://github.com/Azure/azure-dev/discussions)
- [תמיכת Azure](https://azure.microsoft.com/support/)

---

**ניווט בפרק:**
- **📚 דף הקורס**: [AZD For Beginners](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [AZD Basics](azd-basics.md) 
- **➡️ הבא**: [Your First Project](first-project.md)
- **🚀 הפרק הבא**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ההתקנה הושלמה!** המשך אל [Your First Project](first-project.md) כדי להתחיל לבנות עם azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
הצהרת אחריות:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית Co-op Translator (https://github.com/Azure/co-op-translator). אף שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס לגרסה המקורית של המסמך בשפת המקור כמקור הסמכותי. למידע קריטי מומלץ לבצע תרגום מקצועי על ידי מתרגם אנושי. איננו אחראים לכל אי-הבנה או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->