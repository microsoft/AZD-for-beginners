<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T22:01:12+00:00",
  "source_file": "workshop/README.md",
  "language_code": "he"
}
-->
# סדנת AZD למפתחי AI

**קודם:** [מדריך פתרון בעיות AI](../docs/troubleshooting/ai-troubleshooting.md) | **הבא:** [מודולי מעבדה בסדנה](../../../workshop)

ברוכים הבאים לסדנה מעשית ללימוד Azure Developer CLI (AZD) עם דגש על פריסת יישומי AI. הסדנה נועדה להוביל אתכם מהבסיס של AZD ועד לפריסת פתרונות AI מוכנים לייצור.

## סקירת הסדנה

**משך:** 2-3 שעות  
**רמה:** מתחילים עד בינוניים  
**דרישות מקדימות:** ידע בסיסי ב-Azure, כלי שורת פקודה ומושגים ב-AI

### מה תלמדו

- **יסודות AZD**: הבנת תשתית כקוד עם AZD  
- 🤖 **שילוב שירותי AI**: פריסת Azure OpenAI, AI Search ושירותי AI נוספים  
- **פריסת קונטיינרים**: שימוש ב-Azure Container Apps ליישומי AI  
- **שיטות אבטחה**: יישום Managed Identity וקונפיגורציות מאובטחות  
- **מעקב ותצפיות**: הגדרת Application Insights לעומסי עבודה של AI  
- **תבניות לייצור**: אסטרטגיות פריסה מוכנות לארגונים  

## מבנה הסדנה

### מודול 1: יסודות AZD (30 דקות)
- התקנה והגדרת AZD  
- הבנת מבנה פרויקט AZD  
- הפריסה הראשונה שלכם עם AZD  
- **מעבדה**: פריסת יישום אינטרנט פשוט  

### מודול 2: שילוב Azure OpenAI (45 דקות)
- הגדרת משאבי Azure OpenAI  
- אסטרטגיות לפריסת מודלים  
- הגדרת גישה ל-API ואימות  
- **מעבדה**: פריסת יישום צ'אט עם GPT-4  

### מודול 3: יישומי RAG (45 דקות)
- שילוב AI Search של Azure  
- עיבוד מסמכים עם Azure Document Intelligence  
- הטמעות וקטוריות וחיפוש סמנטי  
- **מעבדה**: בניית מערכת שאלות ותשובות למסמכים  

### מודול 4: פריסה לייצור (30 דקות)
- הגדרת Container Apps  
- אופטימיזציה לביצועים ולסקיילינג  
- מעקב ורישום  
- **מעבדה**: פריסה לייצור עם תצפיות  

### מודול 5: תבניות מתקדמות (15 דקות)
- פריסות רב-סביבתיות  
- שילוב CI/CD  
- אסטרטגיות אופטימיזציה עלויות  
- **סיכום**: רשימת בדיקות מוכנות לייצור  

## דרישות מקדימות

### כלים נדרשים

אנא התקינו את הכלים הבאים לפני הסדנה:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### הגדרת חשבון Azure

1. **מנוי Azure**: [הירשמו בחינם](https://azure.microsoft.com/free/)  
2. **גישה ל-Azure OpenAI**: [בקשו גישה](https://aka.ms/oai/access)  
3. **הרשאות נדרשות**:  
   - תפקיד Contributor במנוי או בקבוצת משאבים  
   - User Access Administrator (למשימות RBAC)  

### אימות דרישות מקדימות

הריצו את הסקריפט הבא כדי לאמת את ההגדרות שלכם:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## חומרי הסדנה

### תרגילי מעבדה

כל מודול כולל מעבדות מעשיות עם קוד התחלתי והוראות שלב-אחר-שלב:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - הפריסה הראשונה שלכם עם AZD  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - יישום צ'אט עם Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - יישום RAG עם AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - תבניות פריסה לייצור  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - תרחישי פריסה מתקדמים  

### חומרי עזר

- **[מדריך שילוב AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - תבניות שילוב מקיפות  
- **[מדריך פריסת מודלים AI](../docs/ai-foundry/ai-model-deployment.md)** - שיטות עבודה מומלצות לפריסת מודלים  
- **[שיטות עבודה ל-AI בייצור](../docs/ai-foundry/production-ai-practices.md)** - תבניות פריסה ארגוניות  
- **[מדריך פתרון בעיות AI](../docs/troubleshooting/ai-troubleshooting.md)** - בעיות נפוצות ופתרונות  

### תבניות לדוגמה

תבניות התחלה מהירה לתרחישי AI נפוצים:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## תחילת העבודה

### אפשרות 1: GitHub Codespaces (מומלץ)

הדרך המהירה ביותר להתחיל את הסדנה:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### אפשרות 2: פיתוח מקומי

1. **שכפלו את מאגר הסדנה:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **התחברו ל-Azure:**
```bash
az login
azd auth login
```

3. **התחילו עם מעבדה 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### אפשרות 3: סדנה בהנחיית מדריך

אם אתם משתתפים במפגש בהנחיית מדריך:

- 🎥 **הקלטת הסדנה**: [זמינה לפי דרישה](https://aka.ms/azd-ai-workshop)  
- 💬 **קהילת Discord**: [הצטרפו לתמיכה בזמן אמת](https://aka.ms/foundry/discord)  
- **משוב על הסדנה**: [שתפו את החוויה שלכם](https://aka.ms/azd-workshop-feedback)  

## לוח זמנים של הסדנה

### למידה עצמאית (3 שעות)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### מפגש בהנחיית מדריך (2.5 שעות)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## קריטריונים להצלחה

בסיום הסדנה, תוכלו:

✅ **לפרוס יישומי AI** באמצעות תבניות AZD  
✅ **להגדיר שירותי Azure OpenAI** עם אבטחה מתאימה  
✅ **לבנות יישומי RAG** עם שילוב AI Search של Azure  
✅ **ליישם תבניות ייצור** לעומסי עבודה ארגוניים של AI  
✅ **לעקוב ולפתור בעיות** בפריסות יישומי AI  
✅ **ליישם אסטרטגיות אופטימיזציה עלויות** לעומסי עבודה של AI  

## קהילה ותמיכה

### במהלך הסדנה

- 🙋 **שאלות**: השתמשו בצ'אט הסדנה או הרימו יד  
- 🐛 **בעיות**: עיינו ב-[מדריך פתרון בעיות](../docs/troubleshooting/ai-troubleshooting.md)  
- **טיפים**: שתפו תגליות עם משתתפים אחרים  

### לאחר הסדנה

- 💬 **Discord**: [קהילת Azure AI Foundry](https://aka.ms/foundry/discord)  
- **בעיות GitHub**: [דווחו על בעיות בתבניות](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **משוב**: [טופס הערכת הסדנה](https://aka.ms/azd-workshop-feedback)  

## צעדים הבאים

### המשך הלמידה

1. **תרחישים מתקדמים**: חקרו [פריסות רב-אזוריות](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **שילוב CI/CD**: הגדירו [תהליכי עבודה של GitHub Actions](../docs/deployment/github-actions.md)  
3. **תבניות מותאמות אישית**: צרו [תבניות AZD משלכם](../docs/getting-started/custom-templates.md)  

### יישום בפרויקטים שלכם

1. **הערכה**: השתמשו ב-[רשימת הבדיקות שלנו](./production-readiness-checklist.md)  
2. **תבניות**: התחילו עם [תבניות ספציפיות ל-AI](../../../workshop/templates)  
3. **תמיכה**: הצטרפו ל-[Discord של Azure AI Foundry](https://aka.ms/foundry/discord)  

### שתפו את ההצלחה שלכם

- ⭐ **דרגו את המאגר** אם הסדנה עזרה לכם  
- 🐦 **שתפו ברשתות חברתיות** עם #AzureDeveloperCLI #AzureAI  
- 📝 **כתבו פוסט בבלוג** על מסע הפריסה שלכם עם AI  

---

## משוב על הסדנה

המשוב שלכם עוזר לנו לשפר את חוויית הסדנה:

| היבט | דירוג (1-5) | הערות |
|------|-------------|-------|
| איכות התוכן | ⭐⭐⭐⭐⭐ | |
| מעבדות מעשיות | ⭐⭐⭐⭐⭐ | |
| תיעוד | ⭐⭐⭐⭐⭐ | |
| רמת קושי | ⭐⭐⭐⭐⭐ | |
| חוויה כללית | ⭐⭐⭐⭐⭐ | |

**שלחו משוב**: [טופס הערכת הסדנה](https://aka.ms/azd-workshop-feedback)

---

**קודם:** [מדריך פתרון בעיות AI](../docs/troubleshooting/ai-troubleshooting.md) | **הבא:** התחילו עם [מעבדה 1: יסודות AZD](../../../workshop/lab-1-azd-basics)

**מוכנים להתחיל לבנות יישומי AI עם AZD?**

[התחילו מעבדה 1: יסודות AZD →](./lab-1-azd-basics/README.md)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.