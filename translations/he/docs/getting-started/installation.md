<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-21T17:41:10+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "he"
}
-->
# מדריך התקנה והגדרה

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [יסודות AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 פרק הבא**: [פרק 2: פיתוח מבוסס AI](../microsoft-foundry/microsoft-foundry-integration.md)

## מבוא

מדריך מקיף זה ילווה אותך בתהליך ההתקנה וההגדרה של Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה שונות למערכות הפעלה שונות, הגדרת אימות והגדרות ראשוניות להכנת סביבת הפיתוח שלך לפריסות ב-Azure.

## מטרות למידה

בסיום השיעור הזה, תוכל:
- להתקין בהצלחה את Azure Developer CLI במערכת ההפעלה שלך
- להגדיר אימות עם Azure באמצעות שיטות שונות
- להגדיר את סביבת הפיתוח שלך עם הדרישות המקדימות הנחוצות
- להבין את אפשרויות ההתקנה השונות ומתי להשתמש בכל אחת
- לפתור בעיות נפוצות בהתקנה ובהגדרה

## תוצאות למידה

לאחר השלמת השיעור, תוכל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לאמת מול Azure באמצעות `azd auth login`
- לוודא את ההתקנה ולבדוק פקודות בסיסיות של azd
- להגדיר את סביבת הפיתוח שלך לשימוש מיטבי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יעזור לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא תלות במערכת ההפעלה או בסביבת הפיתוח שלך.

## דרישות מקדימות

לפני התקנת azd, ודא שיש לך:
- **מנוי Azure** - [צור חשבון חינמי](https://azure.microsoft.com/free/)
- **Azure CLI** - לאימות וניהול משאבים
- **Git** - לשכפול תבניות ובקרת גרסאות
- **Docker** (אופציונלי) - ליישומים מבוססי קונטיינרים

## שיטות התקנה

### Windows

#### אפשרות 1: PowerShell (מומלץ)
```powershell
# הפעל כמנהל מערכת או עם הרשאות מוגברות
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### אפשרות 2: מנהל חבילות Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### אפשרות 3: Chocolatey
```cmd
choco install azd
```

#### אפשרות 4: התקנה ידנית
1. הורד את הגרסה האחרונה מ-[GitHub](https://github.com/Azure/azure-dev/releases)
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
```bash
# הורדה והתקנה
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### אפשרות 1: סקריפט התקנה (מומלץ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אפשרות 2: מנהלי חבילות

**Ubuntu/Debian:**
```bash
# הוסף מאגר חבילות של מיקרוסופט
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# התקן azd
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

azd מותקן מראש ב-GitHub Codespaces. פשוט צור Codespace והתחל להשתמש ב-azd מיד.

### Docker

```bash
# הפעל את azd במיכל
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# צור כינוי לשימוש קל יותר
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ אימות התקנה

לאחר ההתקנה, ודא ש-azd פועל כראוי:

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
azd version 1.5.0 (commit abc123)
```

**✅ רשימת בדיקות להצלחת ההתקנה:**
- [ ] `azd version` מציג מספר גרסה ללא שגיאות
- [ ] `azd --help` מציג תיעוד פקודות
- [ ] `azd template list` מציג תבניות זמינות
- [ ] `az account show` מציג את מנוי Azure שלך
- [ ] תוכל ליצור תיקיית בדיקה ולהריץ `azd init` בהצלחה

**אם כל הבדיקות עוברות, אתה מוכן להמשיך ל-[הפרויקט הראשון שלך](first-project.md)!**

## הגדרת אימות

### אימות Azure CLI (מומלץ)
```bash
# התקן את Azure CLI אם לא מותקן כבר
# Windows: winget התקן Microsoft.AzureCLI
# macOS: brew התקן azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# התחבר ל-Azure
az login

# אמת את האימות
az account show
```

### אימות באמצעות קוד מכשיר
אם אתה במערכת ללא ראש או נתקל בבעיות דפדפן:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
לסביבות אוטומטיות:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## הגדרות

### הגדרות גלובליות
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
export AZD_DEBUG=true  # הפעלת רישום ניפוי שגיאות
```

## אינטגרציה עם IDE

### Visual Studio Code
התקן את התוסף Azure Developer CLI:
1. פתח את VS Code
2. עבור לתוספים (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- IntelliSense עבור azure.yaml
- פקודות טרמינל משולבות
- עיון בתבניות
- מעקב אחר פריסות

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
1. התקן את התוסף Azure
2. הגדר אישורי Azure
3. השתמש בטרמינל המשולב לפקודות azd

## 🐛 פתרון בעיות התקנה

### בעיות נפוצות

#### הרשאה נדחתה (Windows)
```powershell
# הפעל את PowerShell כמנהל מערכת
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### בעיות PATH
הוסף ידנית את azd ל-PATH:

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

# דלג על אימות SSL (לא מומלץ לשימוש בסביבת ייצור)
azd config set http.insecure true
```

#### קונפליקטים בגרסאות
```bash
# הסר התקנות ישנות
# Windows: winget הסר התקנה Microsoft.Azd
# macOS: brew הסר התקנה azd
# Linux: sudo apt הסר azd

# נקה תצורה
rm -rf ~/.azd
```

### קבלת עזרה נוספת
```bash
# הפעל רישום באגים
export AZD_DEBUG=true
azd <command> --debug

# הצג יומנים מפורטים
azd logs

# בדוק מידע מערכת
azd info
```

## עדכון azd

### עדכונים אוטומטיים
azd יודיע לך כאשר יש עדכונים זמינים:
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

**Azure CLI (az)**: כלי ברמה נמוכה לניהול משאבי Azure בודדים
- `az webapp create`, `az storage account create`
- משאב אחד בכל פעם
- מיקוד בניהול תשתית

**Azure Developer CLI (azd)**: כלי ברמה גבוהה לפריסת יישומים שלמה
- `azd up` פורסת יישום שלם עם כל המשאבים
- תהליכי עבודה מבוססי תבניות
- מיקוד בפרודוקטיביות מפתחים

**אתה צריך את שניהם**: azd משתמש ב-az CLI לאימות
</details>

<details>
<summary><strong>האם ניתן להשתמש ב-azd עם משאבי Azure קיימים?</strong></summary>

כן! ניתן:
1. לייבא משאבים קיימים לסביבות azd
2. להתייחס למשאבים קיימים בתבניות Bicep שלך
3. להשתמש ב-azd לפריסות חדשות לצד תשתית קיימת

ראה [מדריך הגדרות](configuration.md) לפרטים.
</details>

<details>
<summary><strong>האם azd עובד עם Azure Government או Azure China?</strong></summary>

כן, הגדר את הענן:
```bash
# אז'ור ממשלתי
az cloud set --name AzureUSGovernment
az login

# אז'ור סין
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>האם ניתן להשתמש ב-azd בצינורות CI/CD?</strong></summary>

בהחלט! azd מיועד לאוטומציה:
- אינטגרציה עם GitHub Actions
- תמיכה ב-Azure DevOps
- אימות באמצעות Service Principal
- מצב לא אינטראקטיבי

ראה [מדריך פריסה](../deployment/deployment-guide.md) לדפוסי CI/CD.
</details>

<details>
<summary><strong>מה העלות של שימוש ב-azd?</strong></summary>

azd עצמו **חינמי לחלוטין** וקוד פתוח. אתה משלם רק עבור:
- משאבי Azure שאתה פורש
- עלויות צריכת Azure (חישוב, אחסון וכו')

השתמש ב-`azd provision --preview` להערכת עלויות לפני פריסה.
</details>

## שלבים הבאים

1. **השלם את האימות**: ודא שאתה יכול לגשת למנוי Azure שלך
2. **נסה את הפריסה הראשונה שלך**: עקוב אחר [מדריך הפרויקט הראשון](first-project.md)
3. **חקור תבניות**: עיין בתבניות הזמינות עם `azd template list`
4. **הגדר את ה-IDE שלך**: הגדר את סביבת הפיתוח שלך

## תמיכה

אם נתקלת בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דווח על בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים קהילתיים](https://github.com/Azure/azure-dev/discussions)
- [תמיכת Azure](https://azure.microsoft.com/support/)

---

**ניווט פרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ קודם**: [יסודות AZD](azd-basics.md) 
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 פרק הבא**: [פרק 2: פיתוח מבוסס AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ ההתקנה הושלמה!** המשך ל-[הפרויקט הראשון שלך](first-project.md) כדי להתחיל לעבוד עם azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי אנושי. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->