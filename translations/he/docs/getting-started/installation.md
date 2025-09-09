<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T21:28:34+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "he"
}
-->
# מדריך התקנה והגדרה

## הקדמה

מדריך מקיף זה ילווה אותך בתהליך ההתקנה וההגדרה של Azure Developer CLI (azd) במערכת שלך. תלמד שיטות התקנה שונות למערכות הפעלה שונות, הגדרת אימות, והגדרות ראשוניות להכנת סביבת הפיתוח שלך לפריסות ב-Azure.

## מטרות למידה

בסיום השיעור הזה, תוכל:
- להתקין בהצלחה את Azure Developer CLI במערכת ההפעלה שלך
- להגדיר אימות עם Azure באמצעות שיטות שונות
- להקים את סביבת הפיתוח שלך עם הדרישות הנחוצות
- להבין את אפשרויות ההתקנה השונות ומתי להשתמש בכל אחת
- לפתור בעיות נפוצות בתהליך ההתקנה וההגדרה

## תוצאות למידה

לאחר השלמת השיעור, תוכל:
- להתקין את azd באמצעות השיטה המתאימה לפלטפורמה שלך
- לבצע אימות עם Azure באמצעות הפקודה azd auth login
- לוודא את ההתקנה ולבדוק פקודות בסיסיות של azd
- להגדיר את סביבת הפיתוח שלך לשימוש מיטבי ב-azd
- לפתור בעיות התקנה נפוצות באופן עצמאי

מדריך זה יעזור לך להתקין ולהגדיר את Azure Developer CLI במערכת שלך, ללא קשר למערכת ההפעלה או סביבת הפיתוח שלך.

## דרישות מוקדמות

לפני התקנת azd, ודא שיש לך:
- **מנוי Azure** - [צור חשבון חינמי](https://azure.microsoft.com/free/)
- **Azure CLI** - לצורך אימות וניהול משאבים
- **Git** - לשכפול תבניות ובקרת גרסאות
- **Docker** (אופציונלי) - ליישומים מבוססי קונטיינרים

## שיטות התקנה

### Windows

#### אפשרות 1: PowerShell (מומלץ)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### אפשרות 2: מנהל החבילות של Windows (winget)
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
3. הוסף למשתנה PATH של הסביבה

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
# Download and install
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
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd מותקן מראש ב-GitHub Codespaces. פשוט צור Codespace והתחל להשתמש ב-azd מיד.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ אימות התקנה

לאחר ההתקנה, ודא ש-azd פועל כראוי:

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
azd version 1.5.0 (commit abc123)
```

## 🔐 הגדרת אימות

### אימות באמצעות Azure CLI (מומלץ)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### אימות באמצעות קוד מכשיר
אם אתה עובד על מערכת ללא ממשק גרפי או נתקל בבעיות בדפדפן:
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

## 🛠️ הגדרה

### הגדרה גלובלית
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### משתני סביבה
הוסף לפרופיל של ה-shell שלך (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 אינטגרציה עם IDE

### Visual Studio Code
התקן את התוסף Azure Developer CLI:
1. פתח את VS Code
2. עבור לתוספים (Ctrl+Shift+X)
3. חפש "Azure Developer CLI"
4. התקן את התוסף

תכונות:
- IntelliSense עבור azure.yaml
- פקודות משולבות בטרמינל
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
# Run PowerShell as Administrator
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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### קונפליקטים בגרסאות
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### קבלת עזרה נוספת
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## עדכון azd

### עדכונים אוטומטיים
azd יידע אותך כאשר יש עדכונים זמינים:
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

## צעדים הבאים

1. **השלם את האימות**: ודא שאתה יכול לגשת למנוי Azure שלך
2. **נסה את הפריסה הראשונה שלך**: עקוב אחר [מדריך הפרויקט הראשון](first-project.md)
3. **חקור תבניות**: עיין בתבניות זמינות באמצעות `azd template list`
4. **הגדר את ה-IDE שלך**: הקם את סביבת הפיתוח שלך

## תמיכה

אם נתקלת בבעיות:
- [תיעוד רשמי](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [דיווח על בעיות](https://github.com/Azure/azure-dev/issues)
- [דיונים בקהילה](https://github.com/Azure/azure-dev/discussions)
- [תמיכה ב-Azure](https://azure.microsoft.com/support/)

---

**ניווט**
- **שיעור קודם**: [יסודות AZD](azd-basics.md)
- **שיעור הבא**: [הגדרה](configuration.md)

**ההתקנה הושלמה!** המשך ל-[הפרויקט הראשון שלך](first-project.md) כדי להתחיל לעבוד עם azd.

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.