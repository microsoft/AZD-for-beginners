# 7. סיכום וצעדיך הבאים

!!! tip "ההודעות המרכזיות שצריך לזכור הן"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. מה שהשגת

מזל טוב! בסדנה זו הצלחת בהצלחה:

| מודול | הישג |
|:---|:---|
| **מודול 1** | גילית את Azure Developer CLI ובחרת תבנית AI |
| **מודול 2** | פרסת ואמת פתרון סוכני AI שלם |
| **מודול 3** | פירקת את התבנית כדי להבין את הארכיטקטורה שלה |
| **מודול 4** | חקרת את קונפיגורציית `azure.yaml` ואת ווּקי מחזור החיים |
| **מודול 5** | התאמת את התבנית לתרחיש שלך |
| **מודול 6** | פירוק בטוח של התשתית וניהול המשאבים |

---

## 2. מושגים מרכזיים שרכשת

### Azure Developer CLI (azd)
- `azd init` - אתחול פרויקטים מתוך תבניות
- `azd up` - פריסה ופרוביזיה בפקודה אחת
- `azd env` - ניהול משתני סביבה
- `azd down` - ניקוי משאבים בבטחה

### מבנה תבנית AZD
- `azure.yaml` - קונפיגורציה ווּקי פריסה
- `infra/` - Bicep תשתית כקוד
- `src/` - קוד מקור של האפליקציה
- `scripts/` - תסריטי אוטומציה והגדרה

### יכולות Microsoft Foundry
- שירות סוכן AI לעוזרים אינטיליגנטיים
- חיפוש קבצים ו-Azure AI Search לשליפת מידע
- ניתוח, מעקב והערכה מובנים
- Red teaming לבדיקת בטיחות AI

---

## 3. המשך מסע הלמידה שלך

### צעדים מומלצים להמשך

| מסלול | משאב | זמן |
|:---|:---|:---|
| **קורס מלא** | [תכנית AZD למתחילים](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | בקצב שלך |
| **נסה תבנית נוספת** | [תבניות Microsoft Foundry](https://ai.azure.com/templates) | שעתיים-שעה |
| **למידה מעמיקה** | [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | מתמשך |
| **קהילה** | [Azure Discord](https://aka.ms/foundry/discord) | הצטרף עוד היום! |

### תבניות מומלצות לנסות בהמשך

1. **[התחל עם צ׳אט AI](https://github.com/Azure-Samples/get-started-with-ai-chat)** - צ׳אט בסיסי עם הנתונים שלך
2. **[Demo חיפוש Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - דפוסי RAG מתקדמים
3. **[צ׳אט Contoso](https://github.com/Azure-Samples/contoso-chat)** - תרחישי קמעונאות ארגוניים

---

## 4. אתגר הסדנה

מוכן לבדוק את היכולות שלך? נסה את האתגרים הבאים:

| אתגר | תיאור | רמת קושי |
|:---|:---|:---|
| **1. תרחיש ריבוי סוכנים** | פרוס והתאם לתעשייה אחרת (לדוגמה, בריאות, פיננסים) | ⭐⭐ |
| **2. בסיס ידע מותאם** | הוסף קבצי נתונים משלך וצור אינדקס חיפוש מותאם | ⭐⭐⭐ |
| **3. פריסה בסביבת ייצור** | הקם CI/CD עם GitHub Actions באמצעות `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. שתף את המשוב שלך

המשוב שלך עוזר לנו לשפר את הסדנה הזו!

- **GitHub Issues**: [פרסם משוב](https://github.com/microsoft/azd-for-beginners/issues) - סמן עם `Workshop`
- **Discord**: הצטרף ל-[Microsoft Foundry Discord](https://aka.ms/foundry/discord) - פרסם ב-`#get-help`
- **תרומות**: עזור לשפר את הסדנה על ידי הגשת pull requests!

---

## תודה! 🎉

תודה שהשלמת את סדנת AZD למפתחי AI. אנחנו מקווים שהחוויה הזאת הצויידה אותך במיומנויות ובביטחון לבנות ולפרוס אפליקציות AI על Azure.

**המשך לבנות, המשך ללמוד, וברוכים הבאים לקהילת מפתחי Azure AI!**

---

| | |
|:---|:---|
| **📚 דף הקורס** | [AZD למתחילים](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 תיעוד** | [תיעוד Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ תבניות AI** | [תבניות Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 קהילה** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->