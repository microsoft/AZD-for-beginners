# מדריך התקנה והגדרה

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [יסודות AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## מבוא

מדריך מקיף זה ילווה אותך בהתקנה ובהגדרת Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה מרובות עבור מערכות הפעלה שונות, הגדרת אימות ותצורה ראשונית להכנת סביבת הפיתוח שלך לפריסות Azure.

## מטרות למידה

בסיום השיעור הזה, תוכל:
- להתקין בהצלחה את Azure Developer CLI על מערכת ההפעלה שלך
- להגדיר אימות עם Azure באמצעות שיטות שונות
- להגדיר את סביבת הפיתוח שלך עם הדרישות המקדימות הנחוצות
- להבין אפשרויות התקנה שונות ומתי להשתמש בכל אחת מהן
- לפתור בעיות נפוצות בהתקנה ובהגדרה

## תוצאות למידה

לאחר סיום השיעור, תוכל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לאמת עם Azure באמצעות azd auth login
- לוודא את ההתקנה ולבדוק פקודות azd בסיסיות
- להגדיר את סביבת הפיתוח שלך לשימוש מיטבי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יסייע לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא קשר למערכת ההפעלה או סביבת הפיתוח.

## דרישות מוקדמות

לפני התקנת azd, ודא שיש לך:
- **מנוי Azure** - [צור חשבון חינמי](https://azure.microsoft.com/free/)
- **Azure CLI** - לאימות וניהול משאבים
- **Git** - לשכפול תבניות וניהול גרסאות
- **Docker** (אופציונלי) - לאפליקציות במכלים

## שיטות התקנה

### Windows

#### אפשרות 1: מנהל החבילות של Windows (מומלץ)
```cmd
winget install microsoft.azd
```

#### אפשרות 2: סקריפט התקנה ב-PowerShell
```powershell
# שימושי כאשר winget אינו זמין
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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
# הורד והתקן
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### אפשרות 1: סקריפט התקנה (מומלץ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אפשרות 2: מנהלי חבילות

**התקנה ידנית מתוך נכסי הגרסה:**
```bash
# הורד את הארכיון העדכני ביותר עבור הארכיטקטורה של הלינוקס שלך מ:
# https://github.com/Azure/azure-dev/releases
# לאחר מכן חלץ אותו והוסף את הקובץ הבינארי azd ל-PATH שלך.
```

### GitHub Codespaces

כמה סביבות Codespaces ומכלי פיתוח כוללים כבר את `azd`, אך עליך לוודא זאת במקום להניח:

```bash
azd version
```

אם `azd` חסר, התקן אותו באמצעות הסקריפט הסטנדרטי לאותה סביבה.

### Docker

```bash
# להריץ azd במיכל
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# ליצור כינוי לשימוש קל יותר
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ אימות התקנה

לאחר ההתקנה, וודא ש-azd פועל כראוי:

```bash
# לבדוק גרסה
azd version

# הצגת עזרה
azd --help

# רשימת תבניות זמינות
azd template list
```

פלט צפוי:
```
azd version 1.x.x (commit xxxxxx)
```

**הערה**: מספר הגרסה בפועל ישתנה. בדוק [גרסאות Azure Developer CLI](https://github.com/Azure/azure-dev/releases) כדי לראות את הגרסה העדכנית ביותר.

**✅ רשימת בדיקה להצלחה בהתקנה:**
- [ ] `azd version` מציג את מספר הגרסה ללא שגיאות
- [ ] `azd --help` מציג תיעוד לפקודות
- [ ] `azd template list` מציג תבניות זמינות
- [ ] תוכל ליצור תיקיית בדיקה ולהריץ בהצלחה `azd init`

**אם כל הבדיקות עוברות, אתה מוכן להמשיך ל-[הפרויקט הראשון שלך](first-project.md)!**

## הגדרת אימות

### הגדרת מתחילים מומלצת

לזרימות עבודה מונחות AZD, היכנס עם `azd auth login`.

```bash
# נדרש לפקודות AZD כגון azd up
azd auth login

# אמת את מצב האימות של AZD
azd auth login --check-status
```

השתמש בכניסת Azure CLI רק כשאתה מתכוון להריץ פקודות `az` בעצמך במהלך הקורס.

### אימות Azure CLI (אופציונלי)
```bash
# התקן את Azure CLI אם עדיין לא מותקן
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: ראה את תיעוד ההתקנה של Azure CLI עבור ההפצה שלך

# היכנס ל-Azure
az login

# אמת את האימות
az account show
```

### איזה זרם כניסה כדאי להשתמש?

- השתמש ב-`azd auth login` אם אתה עוקב אחרי נתיב המתחילים של AZD ומריץ בעיקר פקודות `azd`.
- השתמש גם ב-`az login` כאשר אתה רוצה להריץ פקודות Azure CLI כגון `az account show` או לבדוק משאבים ישירות.
- אם התרגיל כולל גם פקודות `azd` וגם `az`, הרץ את שתי פקודות הכניסה פעם אחת בתחילת הדרך.

### אימות קוד מכשיר
אם אתה במערכת ללא ממשק משתמש או נתקל בבעיות דפדפן:
```bash
azd auth login --use-device-code
```

### שירות פרינסיפל (CI/CD)
לסביבות אוטומציה:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### וידוא התצורה המלאה שלך

אם ברצונך לבדוק מהירות לפני תחילת פרק 1:

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
# הגדר מנוי ברירת מחדל
azd config set defaults.subscription <subscription-id>

# הגדר מיקום ברירת מחדל
azd config set defaults.location eastus2

# הצג את כל התצורה
azd config show
```

### משתני סביבה
הוסף לפרופיל ה-shell שלך (`.bashrc`, `.zshrc`, `.profile`):
```bash
# תצורת Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# תצורת azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # אפשר רישום ניפוי שגיאות
```

## אינטגרציה עם IDE

### Visual Studio Code
התקן את תוסף Azure Developer CLI:
1. פתח את VS Code
2. עבור ל-Extensions (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- אינטיליסנס עבור azure.yaml
- פקודות טרמינל משולבות
- גלישה בתבניות
- ניטור פריסות

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
# קבע פרוקסי
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# דלג על אימות SSL (לא מומלץ לסביבת ייצור)
azd config set http.insecure true
```

#### קונפליקטים בין גרסאות
```bash
# להסיר התקנות ישנות
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: הסר את הקובץ הבינארי של azd הקודם או את הקישור הסימבולי לפני התקנה מחדש

# לנקות תצורה
rm -rf ~/.azd
```

### לקבלת עזרה נוספת
```bash
# הפעלת רישום דיבוג
export AZD_DEBUG=true
azd <command> --debug

# הצג תצורה נוכחית
azd config show

# הצג סטטוס פריסה נוכחי
azd show
```

## עדכון azd

### בדיקת עדכון
azd מזהיר כשהגרסה החדשה זמינה, ותוכל לוודא את הגרסה הנוכחית שלך עם:
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
<summary><strong>מה ההבדל בין azd ל-az CLI?</strong></summary>

**Azure CLI (az)**: כלי ברמת נמוכה לניהול משאבים בודדים ב-Azure
- `az webapp create`, `az storage account create`
- משאב אחד בכל פעם
- התמקדות בניהול תשתיות

**Azure Developer CLI (azd)**: כלי ברמת גבוה לפריסת אפליקציות שלמות
- `azd up` מפרסם אפליקציה שלמה עם כל המשאבים
- זרימות עבודה מבוססות תבניות
- התמקדות בפרודוקטיביות המפתח

**צריך את שניהם**: azd משתמש ב-az CLI לאימות
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd עם משאבים קיימים ב-Azure?</strong></summary>

כן! אפשר:
1. לייבא משאבים קיימים לסביבות azd
2. להפנות למשאבים קיימים בתוך תבניות Bicep שלך
3. להשתמש ב-azd לפריסות חדשות לצד התשתית הקיימת

ראה [מדריך התצורה](configuration.md) לפרטים.
</details>

<details>
<summary><strong>האם azd עובד עם Azure Government או Azure China?</strong></summary>

כן, הגדר את הענן:
```bash
# מיקרוסופט אזור ממשלתי
az cloud set --name AzureUSGovernment
az login

# אזור מיקרוסופט סין
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd בצינורות CI/CD?</strong></summary>

בהחלט! azd מיועד לאוטומציה:
- אינטגרציה עם GitHub Actions
- תמיכה ב-Azure DevOps
- אימות באמצעות שירות פרינסיפל
- מצב לא אינטראקטיבי

ראה [מדריך פריסה](../chapter-04-infrastructure/deployment-guide.md) לדוגמאות CI/CD.
</details>

<details>
<summary><strong>כמה עולה השימוש ב-azd?</strong></summary>

azd עצמו הוא **חינמי לחלוטין** וקוד פתוח. אתה משלם רק עבור:
- משאבי Azure שאתה מפרסם
- עלויות צריכה של Azure (חישוב, אחסון וכו')

השתמש ב-`azd provision --preview` להערכת עלויות לפני הפריסה.
</details>

## צעדים הבאים

1. **השלים אימות**: ודא שיש לך גישה למנוי Azure שלך
2. **נסה את הפריסה הראשונה שלך**: עקוב אחרי [מדריך הפרויקט הראשון](first-project.md)
3. **חקור תבניות**: גלוש בתבניות זמינות עם `azd template list`
4. **הגדר את סביבת הפיתוח שלך**: התאם אישית את הסביבה שלך

## תמיכה

אם נתקלת בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דיווח על בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים בקהילה](https://github.com/Azure/azure-dev/discussions)
- [תמיכה ב-Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - קבל עזרה בפקודות Azure ישירות בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הבית של הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [יסודות AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ההתקנה הושלמה!** המשך אל [הפרויקט הראשון שלך](first-project.md) כדי להתחיל לבנות עם azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להתייחס למסמך המקורי בשפתו המקורית כמקור המוסמך. למידע קריטי, מומלץ תרגום מקצועי על ידי אדם. אנו לא אחראים לכל אי-הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->