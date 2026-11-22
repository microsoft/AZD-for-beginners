# מדריך התקנה והגדרה

**ניווט בפרקים:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [יסודות AZD](azd-basics.md)
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מבוסס AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## הקדמה

מדריך מקיף זה ידריך אותך בהתקנה ובהגדרת Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה שונות עבור מערכות הפעלה שונות, הגדרת אימות, והגדרה ראשונית להכנת סביבת הפיתוח שלך לפריסות Azure.

## יעדי למידה

בסיום השיעור הזה, תוכל:
- להתקין בהצלחה את Azure Developer CLI במערכת ההפעלה שלך
- להגדיר אימות עם Azure באמצעות מספר שיטות
- להגדיר את סביבת הפיתוח שלך עם הדרישות הנחוצות
- להבין אפשרויות התקנה שונות ומתי להשתמש בכל אחת מהן
- לפתור בעיות נפוצות בהתקנה ובהגדרה

## תוצאות למידה

לאחר השלמת השיעור תוכל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לאמת עם Azure באמצעות azd auth login
- לוודא את ההתקנה שלך ולבדוק פקודות בסיסיות של azd
- להגדיר את סביבת הפיתוח שלך לשימוש אופטימלי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יסייע לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא קשר למערכת ההפעלה או סביבת הפיתוח.

## דרישות מוקדמות

לפני התקנת azd, וודא שיש לך:
- **מנוי Azure** - [צור חשבון חינמי](https://azure.microsoft.com/free/)
- **Azure CLI** (אופציונלי) - לדוגמאות שמריצות במפורש `az`; azd מבצע אימות בצורה עצמאית
- **Git** - לשיבוט תבניות וניהול גרסאות
- **Docker** (אופציונלי) - עבור אפליקציות מואכלסות במכולות

**נתיב Foundry GA פרק 2:** השתמש ב-AZD **1.37.0 ומעלה**, התקן את החבילה עם `azd ext install microsoft.foundry`, והשתמש ב-Python **3.13+** וב-**uv** הנוכחי לדוגמת הסוכן המארח. מצב פריסת הקוד שלו מתבצע מרחוק, כך שאין צורך בבניית Docker מקומית. עדיין נדרשות הרשאות Foundry, זמינות מודלים אזורית, ומכסת שימוש; ראו את [הגדרת הסוכן המארח](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## שיטות התקנה

### Windows

#### אפשרות 1: מנהל החבילות של Windows (מומלץ)
```cmd
winget install microsoft.azd
```

#### אפשרות 2: סקריפט התקנה PowerShell
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
הורד את הארכיון עבור הארכיטקטורה של macOS שלך מ-[משאבי הגרסה](https://github.com/Azure/azure-dev/releases), חלץ אותו, והוסף את הבינארי `azd` ל-`PATH` שלך.

### Linux

#### אפשרות 1: סקריפט התקנה (מומלץ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### אפשרות 2: מנהלי חבילות

**התקנה ידנית ממשאבי הגרסה:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

חלק מסביבות Codespaces ומיכלי הפיתוח כבר כוללות את `azd`, אבל כדאי לוודא זאת במקום להניח:

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

מיכל זמני זה אינו שומר מצב התחברות בין הרצות. לפריסות חוזרות יש להשתמש ב-[הגדרת מיכל הפיתוח](dev-containers.md); בניית מיכלים דורשת גם דמון Docker זמין ממחוץ המיכל.

## ✅ אימות התקנה

לאחר ההתקנה, אמת ש-azd פועל כהלכה:

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

**הערה**: מספר הגרסה בפועל יכול להשתנות. בדוק את [גרסאות Azure Developer CLI](https://github.com/Azure/azure-dev/releases) לקבלת הגרסה העדכנית ביותר.

**✅ רשימת בדיקת הצלחת התקנה:**
- [ ] `azd version` מציג מספר גרסה ללא שגיאות
- [ ] `azd --help` מציג תיעוד לפקודות
- [ ] `azd template list` מציג תבניות זמינות
- [ ] ניתן ליצור תיקיית בדיקה ולהריץ את `azd init` בהצלחה

**אם כל הבדיקות עוברות, אתה מוכן להמשיך אל [הפרויקט הראשון שלך](first-project.md)!**

## הגדרת אימות זהות

### הגדרת מתחילים מומלצת

עבור זרימות עבודה שמתחילות מ-AZD, היכנס עם `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

השתמש בכניסה דרך Azure CLI רק אם אתה מתכנן להריץ פקודות `az` בעצמך במהלך הקורס.

### אימות Azure CLI (אופציונלי)
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

### איזו שיטת כניסה יש להשתמש?

- השתמש ב-`azd auth login` אם אתה עוקב אחרי נתיב AZD למתחילים ומריץ בעיקר פקודות `azd`.
- השתמש גם ב-`az login` כאשר ברצונך להריץ פקודות Azure CLI כגון `az account show` או לבדוק משאבים ישירות.
- אם התרגיל כולל גם פקודות `azd` וגם `az`, הרץ את שתי פקודות הכניסה בתחילת העבודה.

### אימות קוד מכשיר
אם אתה עובד במערכת חסרת ממשק גרפי או שיש לך בעיות בדפדפן:
```bash
azd auth login --use-device-code
```

### שירות מורשה (CI/CD)
עבור סביבות אוטומטיות:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### אמת את ההגדרה המלאה שלך

אם ברצונך לבדוק מוכנות מהירה לפני התחלת פרק 1:

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
הוסף לפרופיל השตรง שלך (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## אינטגרציה עם IDE

### Visual Studio Code
התקן את תוסף Azure Developer CLI:
1. פתח את VS Code
2. עבור לתוספים (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- IntelliSense עבור azure.yaml
- פקודות טרמינל משולבות
- גלישה בתבניות
- ניטור פריסה

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
2. הגדר אישורי Azure
3. השתמש בטרמינל המשולב לפקודות azd

## 🐛 פתרון תקלות בהתקנה

### בעיות נפוצות

#### הרשאה נדחתה (Windows)
```powershell
# Run PowerShell as Administrator
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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### קונפליקטים בגרסה
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### לקבלת עזרה נוספת
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
azd מזהיר כאשר קיימת גרסה חדשה יותר, ותוכל לאמת את הבנייה הנוכחית עם:
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

**Azure CLI (az)**: כלי ברמה נמוכה לניהול משאבים בודדים ב-Azure
- `az webapp create`, `az storage account create`
- משאב אחד בכל פעם
- מיקוד בניהול תשתיות

**Azure Developer CLI (azd)**: כלי ברמה גבוהה לפריסות אפליקציות שלמות
- `azd up` מפריס אפליקציה שלמה עם כל המשאבים
- זרימות עבודה מבוססות תבניות
- מיקוד בפרודוקטיביות מפתחים

**שניים עצמאיים**: azd משתמש באימות משלו כברירת מחדל. התקן והיכנס ל-Azure CLI רק עבור פקודות `az`, או בחר במפורש להצטרף ל-`azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd עם משאבי Azure קיימים?</strong></summary>

כן! ניתן:
1. לייבא משאבים קיימים לסביבות azd
2. להפנות למשאבים קיימים בתבניות Bicep שלך
3. להשתמש ב-azd לפריסות חדשות לצד התשתית הקיימת

ראה את [מדריך התצורה](../chapter-03-configuration/configuration.md) לפרטים.
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

אם אתה משתמש גם ב-Azure CLI, הגדר `az cloud set --name ...` בנפרד. שירותי תבניות וזמינות מודלים משתנים בין עננים.
</details>

<details>
<summary><strong>האם אפשר להשתמש ב-azd בצינורות CI/CD?</strong></summary>

בהחלט! azd מיועד לאוטומציה:
- אינטגרציה עם GitHub Actions
- תמיכה ב-Azure DevOps
- אימות שירות ממורשה
- מצב לא אינטראקטיבי

ראה את [מדריך הפריסה](../chapter-04-infrastructure/deployment-guide.md) לתבניות CI/CD.
</details>

<details>
<summary><strong>מה עלות השימוש ב-azd?</strong></summary>

azd עצמו הוא **בחינם לחלוטין** וקוד פתוח. אתה משלם רק עבור:
- משאבי Azure שאתה מפריס
- הוצאות צריכת Azure (חישוב, אחסון וכו')

השתמש ב-`azd provision --preview` כדי לבדוק משאבים מוצעים, ולאחר מכן הערך את העלויות שלהם עם [מחשבון המחירון של Azure](https://azure.microsoft.com/pricing/calculator/). Preview אינו מחשב מחירים.
</details>

## השלבים הבאים

1. **השלם אימות זהות**: ודא שיש לך גישה למנוי Azure שלך
2. **נסה את הפריסה הראשונה שלך**: עקוב אחרי [מדריך הפרויקט הראשון](first-project.md)
3. **סייר בתבניות**: עיין בתבניות זמינות עם `azd template list`
4. **הגדר את ה-IDE שלך**: הגדר את סביבת הפיתוח שלך

## תמיכה

אם אתה נתקל בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דווח על בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים בקהילה](https://github.com/Azure/azure-dev/discussions)
- [תמיכת Azure](https://azure.microsoft.com/support/)
- [**מיומנויות סוכני Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - קבל הנחיות לפקודות Azure ישירות בעורך שלך עם `npx skills add microsoft/github-copilot-for-azure`

---

**ניווט בפרקים:**
- **📚 דף הקורס הראשי**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 1 - יסודות והתחלה מהירה
- **⬅️ הקודם**: [יסודות AZD](azd-basics.md) 
- **➡️ הבא**: [הפרויקט הראשון שלך](first-project.md)
- **🚀 הפרק הבא**: [פרק 2: פיתוח מונחה AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ התקנה הושלמה!** המשך אל [הפרויקט הראשון שלך](first-project.md) כדי להתחיל לבנות עם azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->