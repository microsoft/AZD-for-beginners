# 1. בחר תבנית

!!! tip "בסוף המודול הזה תהיה לך היכולת"

    - [ ] לתאר מהן תבניות AZD
    - [ ] לגלות ולהשתמש בתבניות AZD ל-AI
    - [ ] להתחיל עם תבנית הסוכנים של AI
    - [ ] **מעבדה 1:** התחלה מהירה עם AZD ב-GitHub Codespaces

---

## 1. אנלוגיה של בונה

בניית אפליקציית AI מודרנית מוכנה לארגון _מהתחלה_ יכולה להיות מפחידה. זה מעט כמו לבנות בעצמך את הבית החדש, לבנה אחרי לבנה. כן, זה אפשרי! אבל זו לא הדרך היעילה ביותר להגיע לתוצאה הרצויה! 

במקום זאת, לעיתים קרובות אנו מתחילים מ-_תוכנית עיצוב_ קיימת, ועובדים עם אדריכל כדי להתאים אותה לדרישות האישיות שלנו. וזוהי בדיוק הגישה שיש לנקוט בבניית אפליקציות חכמות. קודם כל, מצא אדריכלות עיצוב טובה שמתאימה למרחב הבעיה שלך. לאחר מכן עבוד עם אדריכל פתרונות כדי להתאים ולפתח את הפתרון לתרחיש הספציפי שלך.

אבל איפה ניתן למצוא את תכניות העיצוב הללו? ואיך נמצא אדריכל שמוכן ללמד אותנו כיצד להתאים ולפרוס את התכניות הללו בעצמנו? בסדנה זו, אנו עונים על שאלות אלו על ידי היכרות עם שלוש טכנולוגיות:

1. [Azure Developer CLI](https://aka.ms/azd) - כלי קוד פתוח שמאיץ את מסלול המפתח מעבודה מקומית (build) לפריסת ענן (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - מאגרי קוד בקוד פתוח סטנדרטיזציוני המכילים דוגמאות קוד, תשתיות וקבצי קונפיגורציה לפריסת ארכיטקטורת פתרון AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - סוכן קוד מונחה ידע Azure, שיכול להנחות אותנו בניווט בקוד וביצוע שינויים - באמצעות שפת טבעית.

עם כלים אלה ביד, אנו יכולים כעת _לגלות_ את התבנית המתאימה, _לפרוס_ אותה כדי לאמת שהיא עובדת, ו-_להתאים_ אותה לתרחישים הספציפיים שלנו. בואו נצלול ונלמד כיצד הם פועלים.


---

## 2. Azure Developer CLI

ה-[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (או `azd`) הוא כלי שורת פקודה בקוד פתוח שיכול להאיץ את מסלול הקוד לענן שלך עם סט פקודות נוחות למפתח שעובדות בעקביות בסביבת IDE (פיתוח) ו-CI/CD (devops).

עם `azd`, מסלול הפריסה שלך יכול להיות פשוט כמו:

- `azd init` - מאתחל פרויקט AI חדש מתבנית AZD קיימת.
- `azd up` - מספק תשתית ומפרוס את האפליקציה שלך בשלב אחד.
- `azd monitor` - מקבל ניטור ודיאגנוסטיקה בזמן אמת עבור האפליקציה המופעלת.
- `azd pipeline config` - מגדיר צינורות CI/CD לאוטומציה של הפריסה לאזור Azure.

**🎯 | תרגיל**: <br/> חקור את כלי שורת הפקודה `azd` כעת בסביבת GitHub Codespaces שלך. התחל בהקלדת הפקודה הזו כדי לראות מה הכלי יכול לעשות:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/he/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. תבנית AZD

כדי ש-`azd` יוכל לעשות זאת, הוא צריך לדעת את התשתית לספק, את הגדרות הקונפיגורציה לאכוף, ואת האפליקציה לפרוס. כאן נכנסות לעניין [תבניות AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

תבניות AZD הן מאגרים בקוד פתוח שמשלבים קוד לדוגמה עם תשתית וקבצי קונפיגורציה הדרושים לפריסת ארכיטקטורת הפתרון.
באמצעות גישת _תשתית כקוד_ (IaC), הן מאפשרות להגדיר משאבים וקונפיגורציות הניתנים לבקרת גירסאות (כמו קוד מקור האפליקציה) - ויוצרות תהליכים חוזרים ועקביים למשתמשים באותו פרויקט.

כאשר יוצרים או משתמשים מחדש בתבנית AZD לתרחיש ה-_שלך_, שקול את השאלות האלה:

1. מה אתה בונה? → האם יש תבנית עם קוד התחלה לתרחיש הזה?
1. כיצד מעוצב הפתרון שלך? → האם יש תבנית עם המשאבים הדרושים?
1. איך הפתרון שלך מפורס? → חשוב על `azd deploy` עם תוספות לפני/אחרי עיבוד!
1. כיצד אפשר לאופטימיזציה נוספת? → חשוב על ניטור מובנה וצינורות אוטומציה!

**🎯 | תרגיל**: <br/> 
בקר בגלריית [Awesome AZD](https://azure.github.io/awesome-azd/) והשתמש במסננים כדי לחקור את 250+ התבניות הזמינות כרגע. בדוק אם תמצא אחת המתאימה לדרישות התרחיש ה-_שלך_.

![Code](../../../../../translated_images/he/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. תבניות אפליקציות AI

לאפליקציות מונעות AI, מייקרוסופט מספקת תבניות מיוחדות הכוללות **Microsoft Foundry** ו-**Foundry Agents**. תבניות אלו מאיצות את המסלול לבניית אפליקציות חכמות, מוכנות לייצור.

### תבניות Microsoft Foundry & Foundry Agents

בחר תבנית למטה לפריסה. כל תבנית זמינה בגלריית [Awesome AZD](https://azure.github.io/awesome-azd/) וניתנת לאתחול באמצעות פקודה אחת.

| תבנית | תיאור | פקודת פריסה |
|----------|-------------|----------------|
| **[AI Chat עם RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | אפליקציית שיחה עם יצירת נתונים מוגברים (Retrieval Augmented Generation) באמצעות Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[התחלת שירות סוכן Foundry](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | בנה סוכני AI עם Foundry Agents לביצוע משימות אוטונומיות | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[תזמור ריבוי-סוכנים](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | תאם מספר סוכני Foundry עבור תהליכים מורכבים | `azd init -t azure-samples/multi-agent-orchestration` |
| **[אינטליגנציה למסמכים AI](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | חילוץ וניתוח מסמכים עם מודלי Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[בוט שיחה AI](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | בנה צ'טבוטים חכמים בשילוב Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[יצירת תמונות AI](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | צור תמונות באמצעות DALL-E דרך Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[סוכן Semantic Kernel](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | סוכני AI המשתמשים ב-Semantic Kernel עם Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[ריבוי סוכנים AutoGen](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | מערכות ריבוי סוכנים באמצעות מסגרת AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### התחלה מהירה

1. **גלוש בתבניות**: בקר ב-[https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) וסנן לפי `AI`, `Agents` או `Microsoft Foundry`
2. **בחר תבנית**: בחר תבנית המתאימה למקרה השימוש שלך
3. **אתחל**: הרץ את הפקודה `azd init` עבור התבנית שבחרת
4. **פרוס**: הרץ `azd up` כדי לספק ולפרוס

**🎯 | תרגיל**: <br/>
בחר אחת מהתבניות למעלה בהתאם לתרחיש שלך:

- **בונה צ'טבוט?** → התחל עם **AI Chat עם RAG** או **בוט שיחה AI**
- **צריך סוכנים אוטונומיים?** → נסה את **Foundry Agent Service Starter** או **תזמור ריבוי-סוכנים**
- **מעבד מסמכים?** → השתמש ב-**אינטליגנציה למסמכים AI**
- **רוצה סיוע בקידוד AI?** → בחן את **סוכן Semantic Kernel** או **ריבוי סוכנים AutoGen**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "גלה תבניות נוספות"
    גלריית [Awesome AZD](https://azure.github.io/awesome-azd/) מכילה 250+ תבניות. השתמש במסננים כדי למצוא תבניות שעונות על דרישות ספציפיות שלך לשפה, מסגרת עבודה ושירותי Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש לראות את המסמך המקורי בשפת המקור כמקור הסמכותי. למידע קריטי מומלץ להיעזר בתרגום מקצועי ואנושי. אנו אינם אחראים לכל אי הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->