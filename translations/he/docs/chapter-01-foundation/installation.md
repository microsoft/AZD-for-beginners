# מדריך התקנה והגדרה

**ניווט בפרקים:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתנעה מהירה
- **⬅️ הקודם**: [יסודות AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מבוסס AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

מדריך מקיף זה ילווה אותך במהלך התקנה והגדרת Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה שונות למערכות הפעלה שונות, הגדרת אימות וקונפיגורציה ראשונית להכנת סביבת הפיתוח שלך לפריסות ב-Azure.

## מטרות למידה

בסיום השיעור הזה, תוכל:
- להתקין בהצלחה את Azure Developer CLI על מערכת ההפעלה שלך
- להגדיר אימות עם Azure באמצעות שיטות שונות
- להקים את סביבת הפיתוח שלך עם התלויות הנדרשות
- להבין את אפשרויות ההתקנה השונות ומתי להשתמש בכל אחת מהן
- לפתור בעיות נפוצות בהתקנה ובהגדרה

## תוצאות למידה

לאחר סיום השיעור, תוכל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לבצע אימות עם Azure באמצעות הפקודה azd auth login
- לאשר שההתקנה בוצעה בהצלחה ולבדוק פקודות בסיסיות של azd
- להגדיר את סביבת הפיתוח לשימוש מיטבי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יסייע לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא תלות במערכת ההפעלה או סביבת הפיתוח.

## דרישות מוקדמות

לפני ההתקנה של azd, ודא שיש לך:
- **מנוי ל-Azure** - [צור חשבון חינמי](https://azure.microsoft.com/free/)
- **Azure CLI** - עבור אימות וניהול משאבים
- **Git** - לשיבוט תבניות ובקרת גרסאות
- **Docker** (אופציונלי) - עבור יישומים מוכללים במכולות

## שיטות התקנה

### Windows

#### אופציה 1: PowerShell (מומלץ)
```powershell
# הפעל כמנהל או בהרשאות מורמות
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### אופציה 2: מנהל החבילות של Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### אופציה 3: Chocolatey
```cmd
choco install azd
```

#### אופציה 4: התקנה ידנית
1. הורד את הגרסה האחרונה מ-[GitHub](https://github.com/Azure/azure-dev/releases)
2. חלץ ל-`C:\Program Files\azd\`
3. הוסף למשתנה הסביבה PATH

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
# הוסף מאגר חבילות של מיקרוסופט
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# התקן את azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# הוסף מאגר חבילות של מיקרוסופט
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd מותקן מראש ב-GitHub Codespaces. פשוט צור codespace והתחל להשתמש ב-azd מיד.

### Docker

```bash
# הפעל את azd במכולה
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# צור כינוי לשימוש קל יותר
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ אימות התקנה

לאחר ההתקנה, אשר ש-azd עובד כראוי:

```bash
# בדוק גרסה
azd version

# הצג עזרה
azd --help

# רשום תבניות זמינות
azd template list
```

פלט צפוי:
```
azd version 1.x.x (commit xxxxxx)
```

**הערה**: מספר הגרסה בפועל עשוי להשתנות. בדוק [גרסאות Azure Developer CLI](https://github.com/Azure/azure-dev/releases) עבור הגרסה האחרונה.

**✅ רשימת בדיקות הצלחת ההתקנה:**
- [ ] `azd version` מציג את מספר הגרסה ללא שגיאות
- [ ] `azd --help` מציג תיעוד פקודות
- [ ] `azd template list` מציג תבניות זמינות
- [ ] `az account show` מציג את מנוי ה-Azure שלך
- [ ] ניתן ליצור תיקיית בדיקה ולהריץ `azd init` בהצלחה

**אם כל הבדיקות עברו, אתה מוכן להמשיך ל-[הפרויקט הראשון שלך](first-project.md)!**

## הגדרת אימות

### אימות עם Azure CLI (מומלץ)
```bash
# התקן את Azure CLI אם לא מותקן כבר
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# התחבר ל-Azure
az login

# אמת את האימות
az account show
```

### אימות באמצעות Device Code
אם אתה עובד במערכת ללא ממשק גרפי או שיש לך בעיות בדפדפן:
```bash
az login --use-device-code
```

### אישור באמצעות Service Principal (CI/CD)
לסביבות אוטומטיות:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## קונפיגורציה

### קונפיגורציה גלובלית
```bash
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription <subscription-id>

# הגדר מיקום ברירת מחדל
azd config set defaults.location eastus2

# הצג את כל ההגדרות
azd config list
```

### משתני סביבה
הוסף לפרופיל ה-shell שלך (`.bashrc`, `.zshrc`, `.profile`):
```bash
# תצורת Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# תצורת azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # הפעלת רישום באגים
```

## אינטגרציה עם IDE

### Visual Studio Code
התקן את תוסף Azure Developer CLI:
1. פתח את VS Code
2. עבור ל-Extensions (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- IntelliSense עבור azure.yaml
- פקודות טרמינל משולבות
- דפדוף בתבניות
- מעקב פריסה

### GitHub Codespaces
צור קובץ `.devcontainer/devcontainer.json`:
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
1. התקן את תוסף Azure
2. הגדר אישורי Azure
3. השתמש בטרמינל המשולב לפקודות azd

## 🐛 פתרון בעיות התקנה

### בעיות נפוצות

#### הרשאות נדחות (Windows)
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

# דלג על אימות SSL (לא מומלץ לסביבות ייצור)
azd config set http.insecure true
```

#### ניגודי גרסאות
```bash
# הסר התקנות ישנות
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# נקה תצורה
rm -rf ~/.azd
```

### לקבלת עזרה נוספת
```bash
# הפעל רישום איתור תקלות
export AZD_DEBUG=true
azd <command> --debug

# הצג את התצורה הנוכחית
azd config list

# הצג את מצב הפריסה הנוכחי
azd show
```

## עדכון azd

### עדכונים אוטומטיים
azd תודיע לך כאשר קיימים עדכונים זמינים:
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

**Azure CLI (az)**: כלי ברמה נמוכה לניהול משאבים בודדים של Azure
- `az webapp create`, `az storage account create`
- משאב אחד בכל פעם
- דגש על ניהול תשתיות

**Azure Developer CLI (azd)**: כלי ברמה גבוהה לפריסות יישומים מלאות
- `azd up` מפריס אפליקציה שלמה עם כל המשאבים
- זרימות עבודה מבוססות תבניות
- דגש על פרודוקטיביות מתכנתים

**צריך את שניהם**: azd משתמש ב-az CLI לאימות
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd עם משאבי Azure קיימים?</strong></summary>

כן! אפשר:
1. לייבא משאבים קיימים לסביבות azd
2. להפנות למשאבים קיימים בתבניות Bicep שלך
3. להשתמש ב-azd לפריסות חדשות לצד התשתית הקיימת

ראה את [מדריך ההגדרה](configuration.md) לפרטים.
</details>

<details>
<summary><strong>האם azd עובד עם Azure Government או Azure China?</strong></summary>

כן, תגדיר את הענן:
```bash
# ממשלת אזור
az cloud set --name AzureUSGovernment
az login

# אזור סין
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd בשרשראות CI/CD?</strong></summary>

כמובן! azd מיועד לאוטומציה:
- אינטגרציה עם GitHub Actions
- תמיכה ב-Azure DevOps
- אימות באמצעות Service Principal
- מצב ללא צורך באינטראקציה

ראה את [מדריך הפריסה](../chapter-04-infrastructure/deployment-guide.md) לדפוסי CI/CD.
</details>

<details>
<summary><strong>כמה עולה השימוש ב-azd?</strong></summary>

azd הוא **חינמי לחלוטין** וקוד פתוח. אתה משלם רק עבור:
- משאבי Azure שאתה מפריס
- עלויות צריכה של Azure (מחשוב, אחסון וכו׳)

השתמש ב-`azd provision --preview` כדי להעריך עלויות לפני פריסה.
</details>

## צעדים הבאים

1. **סיים את האימות**: ודא שיש לך גישה למנוי Azure שלך
2. **נסה את הפריסה הראשונה שלך**: פעל לפי [מדריך הפרויקט הראשון](first-project.md)
3. **חקור תבניות**: גלוש בתבניות זמינות עם `azd template list`
4. **הגדר את ה-IDE שלך**: הקם את סביבת הפיתוח שלך

## תמיכה

אם נתקלת בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דיווח בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים בקהילה](https://github.com/Azure/azure-dev/discussions)
- [תמיכת Azure](https://azure.microsoft.com/support/)
- [**כישורים של Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - קבל הנחיות פקודות Azure ישירות בעורך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתנעה מהירה
- **⬅️ הקודם**: [יסודות AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מבוסס AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ההתקנה הושלמה!** המשך ל-[הפרויקט הראשון שלך](first-project.md) כדי להתחיל לבנות עם azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). על אף שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי דיוקים. יש להתייחס למסמך המקורי בשפת המקור כמקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי אנושי. איננו אחראים לכל טעויות או אי הבנות הנובעות מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->