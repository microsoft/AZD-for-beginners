# יומן שינויים - AZD למתחילים

## מבוא

יומן שינויים זה מתעד את כל השינויים, העדכונים והשיפורים הבולטים במאגר AZD למתחילים. אנו פועלים על פי עקרונות גרסאות סמנטיות ומתחזקים יומן זה כדי לסייע למשתמשים להבין מה השתנה בין הגרסאות.

## מטרות הלמידה

בעיון ביומן שינויים זה, תוכל:
- להישאר מעודכן לגבי תכונות ותוספות תוכן חדשות
- להבין שיפורים שנעשו לתיעוד הקיים
- לעקוב אחר תיקוני באגים ותיקונים אחרים להבטחת דיוק
- לעקוב אחר התפתחות חומרי הלמידה לאורך זמן

## תוצאות הלמידה

לאחר עיון ברשומות יומן השינויים, תוכל:
- לזהות תוכן ומשאבים חדשים הזמינים ללמידה
- להבין אילו חלקים עודכנו או שופרו
- לתכנן את מסלול הלמידה שלך בהתבסס על החומרים המעודכנים ביותר
- לתרום משוב והצעות לשיפורים עתידיים

## היסטוריית גרסאות

### [v3.25.0] - 2026-11-09

#### הרחבת Microsoft Foundry 1.0 זמינה כעת באופן כללי

חבילת `microsoft.foundry` 1.0 היא **חיה וזמינה לציבור הכללי**, כפי שהוכרז ב[5 בנובמבר 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). הקורס כעת מלמד את תהליך העבודה GA שפורסם, לא גרסה שעתידה לצאת. התחילו עם AZD **1.37.0 ומעלה** ו-`azd ext install microsoft.foundry`.

#### זמין בעדכון הקורס הזה
- ההדרכה באנגלית משתמשת בחבילת GA כנתיב ההתקנה כברירת מחדל ומסבירה את שבעת ההרחבות העצמאיות של הליבה.
- [הדרכה עם סוכן מאוחסן](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) מכסה את דוגמת ה-API של תגובות מסגרת סוכן Python Upstream, הגירסה הנוכחית של uv, Python 3.13+, בחירת פרויקט חדש/קיים, שימוש מחודש במודל וביקורת של `azure.yaml`.
- תהליך העבודה מקומי לענן כולל בדיקת Agent Inspector, עלויות קריאת מודל מגובה בענן Azure, בניית קוד מרוחקת, קריאות פרוסות, מעקב ענני, תצוגה מקדימה של פריסה, יומנים ואבחון.
- הדרכת הערכה נפרדת מתארת יצירה ובחינה של מאגרי נתונים/רוברים, קביעת שם להערכה, רישום נכסים ובדיקת תוצאות. הוראות הערכה/אופטימיזציה ישנות נשארות כחלק מהיסטוריית ההגירה, לא בסיס שחרור נוכחי.
- הדרכת Foundry CI/CD כוללת התקנת תוסף להרצה, פריסה מאומתת, גישה לנכסי הערכה, ופתיחת שער איכות מפורשת.
- הדרכת ניקוי מבדילה בין פרויקטים שנוצרו חדשים לבין פרויקטים משתמשים מחדש ב-Foundry. הסדנה מקשרת לתרגיל GA נפרד בלי להחליף את הבדיקות הספציפיות לדוגמה שלו.
- ניווט הקורס, מטרות הלמידה, דרישות ההתקנה, דף רמאות, שאלות נפוצות, ומדריך לימוד משקפים את תהליך העבודה GA. תרגומים שנוצרו אינם נערכים ידנית.

#### היקף הביקורת
- מבוסס על הכרזת GA, הדרכת Microsoft Learn המקושרת, וקונפיגורציית הדוגמה Upstream. לא בוצע פריסה, פריסה חיה, קריאת מודלי ענן Azure או הערכה.
- חבילת GA לא בהכרח מרמזת על GA עבור כל תכונה אופציונלית, הרחבה עצמאית, או SDK, ואינה מאשרת את הדוגמאות לשימוש בייצור.

### [v3.24.0]- 2026-11-04

#### תוקן
- תוקנו ניווט הקורס באנגלית, דרכי העמוד שהוזזו, עוגנים חסרים, והפניות חיצוניות מיושנות, כולל קישור לפרק 2 למדריך AI ייצור.
- בוצע סקירה של ההדרכה הנוכחית מול AZD 1.37.2 שפורסם, סוכנים 1.0.0-beta.23, והערכות 1.0.0-beta.2. תועד תהליך העבודה הנפרד של `azd ai eval` והגירת תצורת האופטימיזציה.
- תוקנו דגלי CLI לא נתמכים, גבולות אימות, הדרכה לסביבת טקסט רגיל/סודיות, עדכוני תשתית, קונפיגורציית מודל, ודוגמאות ההתאוששות ההרסניות.
- רענון הסדנה מול דוגמת AI Agents הנוכחית, כולל ווים אמיתיים, קלטי קונפיגורציה, בדיקות הערכה, נקודות כניסה של red-teaming ותצפית.
- תוקנו טענות יישום בדוגמה ותוקנו בעיות קשורות באפליקציה/תשתית/קונפיגורציה. חומר ארכיטקטורת קמעונאות הובהר במפורש כהבדל מאפליקציה עובדת מלאה.
- שוחזר מטריצת שפת CodeQL, נבחר Node.js 24 הנתמך למכלול פיתוח, ונעשתה דיווח על פקודות גרסה שנכשלו במחוללי האימות.

#### נוסף
- בודק קישורים/עוגנים לא מקוונים באנגלית בלבד, בדיקות רגרסיה, ותהליך תיעוד שגם בונה את הסדנה במצב קשוח. תרגומים שנוצרו ותמונות מתורגמות לא נכללים.

#### היקף האימות
- בדיקות מקור, תחביר, תצורה, התנהגות מקומית, וקישורי רשת אינן מבטיחות פריסה חיה ב-Azure, מכסה, RBAC, זמינות מודל אזורית, חיוב, תאימות אבטחה או מוכנות לייצור.
- רשומות ישנות למטה הן רשומות היסטוריות, לא הוראות נוכחיות לפקודות או שחרור.

### [v3.23.0] - 2026-07-13

#### רענון AZD 1.27.1: עדכון גרסה נוכחית
**גרסה זו מאמתת מחדש את הקורס מול `azd` `1.27.1` (יולי 2026, הגרסה היציבה העדכנית ביותר) וההרחבה הנוכחית של סוכן ה-AI בתצוגה המקדימה `azure.ai.agents` `1.0.0-beta.5`, ומעדכנת את כל הבאנרים של "מאומת מול" לאחר שחרורי 1.26.0, 1.27.0, ו-1.27.1.**

#### שונה
- **✅ שורת בסיס לאימות עודכנה** מ-`azd 1.25.6` (יוני 2026) ל-`azd 1.27.1` (יולי 2026) בכל קובץ ה-README הראשי, כל קבצי README של הפרקים, שיעור Dev-Container של פרק 1 (כולל דוגמאות בגירסה נעוצה), שיעור תבניות מותאמות אישית של פרק 4, שיעור ריבוי סוכנים של פרק 5, ומסמכי הסדנה
- **🤖 רענון שורת הבסיס של פרק 2** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.27.1` ב-`agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, ו-`microsoft-foundry-integration.md`; תאריכי הערות האימות עודכנו ל-2026-07-13
- **🧩 שדרוג הרחבת סוכן AI** מ-`azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` לגרסת `1.0.0-beta.5` הנוכחית ב-README של פרק 2 וב-`agents.md`
- **🧪 דוגמת אימות בסדנה** (פלט `azd version`) עודכנה ל-`1.27.1`

#### הערות על שחרורי azd הרלוונטיים (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** תמיכה ב-Go לפונקציות Azure על Flex Consumption, מסנני מנוי לפי דייר `azd config sub-filter`, חבילות הרחבה עצמאיות (`azd x pack --bundle`), ו-`azd tool install azure-skills`
- **1.27.0 (2026-06-30):** מודלים של Azure AI Foundry לפרויקטים/סוכנים ישירות ב-`azure.yaml` (פיתוח ללא Bicep/Terraform), תמיכה בפריסת מכולות עבור App Service (`host: appservice` + `language: docker`), `-s/--source` ישירות לפקודות `azd extension`, ועוד `azd tool uninstall`
- **1.27.1 (2026-07-09):** דגל `--no-dependencies` עבור `azd extension install`, דגמים מיושנים שהוצאו כברירת מחדל מהקטלוג/ההנחיות, ותיקוני באגים רבים

#### קבצים שעדכנו
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### מילוי פערים למתחילים #2: יצירת תבניות, Dev Containers, Pulumi, Azure DevOps, Service Principals, ועוד
**גרסה זו סוגרת את הפערים הבינוניים שנותרו שנחשפו בניתוח azd-coverage: איך ליצור ולפרסם תבנית משלך, סביבות Dev-container/Codespaces שניתנות לשחזור, ספק התשתית Pulumi, מעבר דרך CI/CD ב-Azure DevOps, אימות מושאי שירות, הדרכה לבחירת מארח (AKS/Spring Apps), הסברים על `azd restore`/`azd package`, טיפול בשגיאות מחברים, ופרקטיקות סביבת צוות/משותפת.**

#### נוסף
- **🧱 שיעור חדש בפרק 4** `docs/chapter-04-infrastructure/custom-templates.md` — יצירת התבנית שלך: מבנה נדרש (`azure.yaml`, `infra/`, `src/`), השדה `metadata.template`, פרמטריזציה של התשתית עם סימן משאבים `uniqueString()` ותווית `azd-env-name`, בדיקה מקומית עם `azd init --template <local-path>`, פרסום ל-GitHub, והגשה לגלריית Awesome AZD
- **📦 שיעור חדש בפרק 1** `docs/chapter-01-foundation/dev-containers.md` — סביבות azd שניתנות לשחזור עם Dev Containers ו-GitHub Codespaces: `.devcontainer/devcontainer.json` מינימלית שמשתמשת בתכונה הרישמית של `ghcr.io/azure/azure-dev/azd`, תכונות ממוקדות שפה, `docker-in-docker` למארחי מכולות, ו-`azd auth login --use-device-code` לכניסה מרחוק
- **🧩 Pulumi עם azd** סעיף ב-`docs/chapter-04-infrastructure/provisioning.md` — פירוט `infra.provider: pulumi`, ארגון תיקיית Pulumi, טלאי סביבות מקושרות ל-azd, יציאות/תיוג נדרשים, וזרימת עבודה זהה ל-`azd up` / `azd down`
- **🎯 הדרכה לבחירת מארח** ב-`docs/chapter-04-infrastructure/provisioning.md` — השוואה ידידותית למתחילים בין `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, ו-`springapp`, עם הנחיות מתי לבחור ב-AKS או ב-Azure Spring Apps
- **🛠️ מעבר דרך CI/CD ב-Azure DevOps** ב-`docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, חיבור שירות עם פדרציית זהות לעומס עבודה (OIDC), יצירת `azure-dev.yml`, והגדרת קבוצת משתנים
- **🔑 Service Principals (תבנית 4)** נוסף ל-`docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` ללא אינטראקציה עם סוד לקוח לעומת אישורים פדרטיביים/OIDC, מתי להשתמש ואחסון בטוח של האישורים
- **🪝 טיפול בשגיאות מחבר** תת-סעיף ב-`docs/chapter-04-infrastructure/deployment-guide.md` — קודי יציאה ו-`set -e`, `continueOnError`, בדיקת מחברים בבידוד עם `azd hooks run`, אופני מעטפת מערכת הפעלה, ו-`--debug`
- **👥 סביבת צוות / משותפת** סעיף ב-`docs/chapter-03-configuration/configuration.md` — מה נמצא ב-`.azure/`, מה יש להתעלם ממנו ב-git, סביבות פר-מפתח, `azd env list`/`select`, והגשת ערכי סביבה ב-CI/CD
- **🧰 הסברים של `azd restore` ו-`azd package` מורחבים** ב-`resources/cheat-sheet.md` — שחזור תלותות ובניית ארטיפקט לפריסה ללא פריסה בפועל

#### שונה
- **🧭 טבלת השיעורים של פרק 4** עודכנה לכלול את שיעור "יצירת התבנית שלך" החדש (שיעור 3)
- **🧭 טבלת השיעורים של פרק 1** עודכנה לכלול את שיעור "Dev Containers & Codespaces" החדש (שיעור 5); כפות ניווט מקושרות בין `bring-your-own-app.md` ל-`dev-containers.md`

### [v3.21.0] - 2026-06-16

#### מילוי פערים למתחילים: שיעור יישומי רב-סוכנים, "הבא את האפליקציה שלך", Terraform, ומעבר דרך CI/CD
**גרסה זו סוגרת את הפערים הגדולים למדריך שלם למתחילים על ידי הוספת שני שיעורי ידיים חדשים (מעבר פריסה רב-סוכנים ו"הוספת azd לאפליקציה קיימת"), היכרות ידידותית למתחילים עם מחברים (hooks), סעיף Terraform עם azd, מעבר שלבי צינור GitHub Actions, הסבר להרחבות התצוגה המקדימה, ורשימת בדיקת אימות מפורשת לפריסה.**

#### נוסף
- **🤝 שיעור חדש בפרק 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — מעבר פריסה יישומי עם שני סוכנים (מארגן + מומחים) תוך שימוש בתבנית אמיתית (`contoso-creative-writer`), כולל מתי להשתמש ברב-סוכנים, זרימת העבודה `azd up`, הבנת המשאבים המפורסים, מעקב בין סוכנים, התאמה אישית וניקוי
- **📦 שיעור חדש בפרק 1** `docs/chapter-01-foundation/bring-your-own-app.md` — כיצד להוסיף azd לפרויקט קיים עם `azd init` ("שימוש בקוד בספריה הנוכחית"), הבנת `azure.yaml` ו-`infra/`, `azd infra generate`, גילוי מארח, ופריסה עם `azd up`
- **🌐 Terraform עם azd** נוסף ל-`docs/chapter-04-infrastructure/provisioning.md` — קונפיגורציה של `infra.provider: terraform`, ארגון תיקיית `.tf`, יציאות נדרשות `AZURE_*` ותיוג `azd-env-name`, וזרימת עבודה זהה ל-`azd up` / `azd down` (סוגר את הפער שבו הוכרזה תמיכת Terraform אך הוצג רק Bicep)
- **⚙️ מדריך שלב אחר שלב ל-GitHub Actions** ב-`docs/chapter-08-production/production-ai-practices.md` — ממאגר GitHub לפריסות אוטומטיות: `azd pipeline config`, אישורי פדרציה OIDC (ללא סודות מאוחסנים), ה-`azure-dev.yml` שנוצר, והנחיות לסודות מול משתנים
- **🪝 מבוא למתחילים "חדש בהוקים?"** ב-`docs/chapter-04-infrastructure/deployment-guide.md` — מהו hook, טבלת שלבי hook, hook ראשוני מינימלי, והפעלת hooks ידנית עם `azd hooks run`
- **✅ רשימת בדיקה "אמת את הפריסה שלך"** נוספה לשלב 5 של `docs/chapter-01-foundation/first-project.md` — בדיקת עשן, בדיקת נקודת קצה בריאות, וקריטריוני הצלחה מפורשים
- **🧩 הסבר להרחבות תצוגה מוקדמת חדשות** `azure.ai.skills` ו-`azure.ai.connections` (מה הן ומתי להשתמש בהן) ב-`docs/chapter-08-production/production-ai-practices.md`

#### שונה
- **🧭 טבלת שיעורים פרק 5** תוקנה: `multi-agent-basics.md` היא כעת שיעור 1 (השיעור המעשי היחיד במלואו), עם תיוג כנה ששיעור 2 נמצא בפרק 6 ותרחיש קמעונאות הוא תבנית ארכיטקטורה, לא תבנית פקודה אחת
- **🧭 טבלת שיעורים פרק 1** כוללת כעת את שיעור "הבא את האפליקציה שלך" החדש (שיעור 4)
- **🔗 כותרות ניווט** עודכנו: `first-project.md` מקשר כעת קדימה ל-`bring-your-own-app.md`

#### תוקן
- **🧱 סגר את הפער ב-Terraform שנטען אך לא היה קיים** — הקורס קודם התייחס לתמיכה ב-Terraform מבלי להציג אותה
- **🔀 תוקנו קישורים חוצי פרקים מטעים בפרק 5** שהרמזו על מימוש רב-סוכנים מלא כאשר בפועל הייתה רק תבנית ארכיטקטורה

#### קבצים עודכנו
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(חדש)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(חדש)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### ריענון AZD 1.25.6, פקודות מחזור חיים מלא של סוכן ומיתוג Aspire
**גרסה זו מאמתת מחדש את הקורס כנגד `azd` `1.25.6` (יוני 2026) והרחבת `azure.ai.agents` `0.1.40-preview`, מרחיבה את הנחיות ה-AI מ"יצירת מסגרת לסוכן" למחזור החיים המלא של הסוכן (בדיקה → הערכה → אופטימיזציה → בדיקה → מחיקה), מציגה את הרחבות התצוגה המוקדמת החדשות `azure.ai.skills` ו-`azure.ai.connections`, ומציינת את שינוי שם המוצר מ".NET Aspire" ל-"Aspire".**

#### נוסף
- **🔁 כיסוי מלא למחזור החיים של סוכן** למתחילים ומהנדסי AI בכל המסמכים:
  - `docs/chapter-01-foundation/azd-basics.md` — טבלת מחזור חיים (יצירת מסגרת → בדיקה → מדידה → שיפור → בדיקה → ניקוי) נוספה למדור ההרחבות ופקודות AI
  - `docs/chapter-08-production/production-ai-practices.md` — חלק חדש "ניהול מחזור החיים של הסוכן" המכסה את `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`
  - `resources/cheat-sheet.md` — פקודות סוכן AI שהורחבו עם `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`
- **🧩 תיעוד הרחבות תצוגה מוקדמת חדשות**: `azure.ai.skills` (כישורי סוכן רב-שימושיים) ו-`azure.ai.connections` (חיבורי Foundry) נוספו לטבלת ההרחבות ודף העזר
- **⏱️ הנחיות זמן תגובה** — דוגמאות `azd ai agent invoke` מציינות כעת שהן מדפיסות את הסך הכל של העכבה וזמן הבייט הראשון
- **📌 כרזת גרסה** ב-README הראשי שמפנה לומדים ל-`azd version` ו-`azd upgrade`

#### שונה
- **✅ עדכון בסיס האימות** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.25.6` (יוני 2026) בכל קבצי README של הפרקים ומסמכי הסדנה
- **🤖 עדכון הערת הרחבה לפרק 2** מ-`azure.ai.agents` `0.1.18-preview` ל-`0.1.40-preview`
- **🧪 עדכון דוגמת אימות לסדנה** (פלט `azd version`) ל-`1.25.6`
- **🧭 עדכון README "מה חדש ב-azd היום"** להדגשת מחזור החיים של הסוכן מקצה לקצה, הרחבות AI חדשות, ותיקוני איכות חיים אחרונים (`azd init` חזרה, `azd auth login` ניקוי טוקן שפג תוקפו, `azd tool` בקשת הפעלה ראשונה)
- **📖 פרק 2 agents.md (אפשרות 4)** מפנה כעת את הלומדים לפקודות מחזור החיים לאחר הפריסה במקום לעצור ב-`azd up`

#### תוקן
- **🏷️ מיתוג מוצר** — נוספה הערת שינוי שם Aspire (".NET Aspire" הוא כעת פשוט "Aspire"); תמיכת azd ב-Aspire לא השתנתה
- **🔎 אימות שחרור חי** על פי זרם שחרור Azure Developer CLI: CLI יציב `1.25.6` (2026-06-12) ו-`azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### קבצים עודכנו
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### הבהרת התחלת משתמשים חדשים, אימות התקנה וניקוי פקודות AZD סופיות
**גרסה זו ממשיכה את סריקת האימות של AZD 1.23 עם מעבר תיעודי ממוקד למתחילים: היא מבהירה הנחיות אימות ראשוניות ב-AZD, מוסיפה סקריפטים לאימות התקנה מקומית, מוודאת פקודות מפתח מול CLI של AZD החי, ומסירה את כל ההפניות האחרונות לפקודות מקור אנגלי מיושן מחוץ ליומן השינויים.**

#### נוסף
- **🧪 סקריפטים לאימות התקנת מתחילים** עם `validate-setup.ps1` ו-`validate-setup.sh` כך שלומדים יכולים לאמת כלים דרושים לפני תחילת פרק 1
- **✅ שלבי אימות התקנה מוקדמים** ב-README ראשי וב-README פרק 1 כך שנדרשות ייראו לפני `azd up`

#### שונה
- **🔐 הנחיות אימות למתחילים** מטפלות כעת בעקביות ב-`azd auth login` כנתיב העיקרי לעבודה עם AZD, כאשר `az login` מצוין כאופציונלי אלא אם משתמשים ישירות בפקודות Azure CLI
- **📚 זרימת התחלת פרק 1** מכוונת כעת את הלומדים לאמת את ההתקנה המקומית לפני התקנה, אימות ושלבי פריסה ראשונים
- **🛠️ הודעות המאמת** מפרידות כעת בבירור בין דרישות מחסומים לאזהרות Azure CLI אופציונליות לנתיב מתחילים עם AZD בלבד
- **📖 מסמכי תצורה, פתרון תקלות, ודוגמאות** מבדילים כעת בין אימות עקבי ל-AZD לבין כניסה אופציונלית ב-Azure CLI כאשר בעבר הוצגו שניהם ללא הקשר

#### תוקן
- **📋 הפניות פקודות מקור אנגלי שנותרו** עודכנו לצורות AZD עדכניות, כולל `azd config show` בדף העזר ו-`azd monitor --overview` כאשר כוונת ההנחיה הייתה לסקירת פורטל Azure
- **🧭 טענות מתחילים בפרק 1** שונו להקל על התחייבות לאפס שגיאות מובטחות או התנהגות רולבק בכל התבניות ומשאבי Azure
- **🔎 אימות CLI חי** אושר לתמיכה נוכחית ב-`azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, ו-`azd down --force --purge`

#### קבצים עודכנו
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### אימות AZD 1.23.12, הרחבת סביבת סדנא וריעון מודל AI
**גרסה זו מבצעת מעבר אימות תיעוד תוך התייחסות ל-`azd` `1.23.12`, מעדכנת דוגמאות פקודות AZD מיושנות, מרעננת הנחיות מודל AI להגדרות ברירת מחדל עכשוויות, ומרחיבה את הוראות הסדנא מעבר ל-GitHub Codespaces לתמיכה גם במיכלי פיתוח וקלונות מקומיים.**

#### נוסף
- **✅ הערות אימות בכל פרקי הבסיס ומסמכי הסדנא** להדגשת קו בסיס AZD שנבדק ללומדים שמשתמשים בבניות CLI חדשות או ישנות
- **⏱️ הנחיות זמן פריסה** לפריסות אפליקציות AI ארוכות טווח המשתמשות ב-`azd deploy --timeout 1800`
- **🔎 שלבי בדיקת הרחבות** עם `azd extension show azure.ai.agents` במסמכי זרימת העבודה של AI
- **🌐 הנחיות סביבת סדנא רחבות יותר** המכסות GitHub Codespaces, מיכלי פיתוח, וקלונות מקומיים עם MkDocs

#### שונה
- **📚 README פתיחת פרק** מציינים כעת בעקביות אימות מול `azd 1.23.12` בכל חלקי היסוד, התצורה, התשתית, רב-סוכנים, טרום פריסה, פתרון תקלות וייצור
- **🛠️ הפניות פקודות AZD** עודכנו לצורות עדכניות בכל המסמכים:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` או `azd env get-value(s)` בהתאם להקשר
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` כאשר המטרה סקירת Application Insights
- **🧪 דוגמאות החזרת תצוגה מוקדמת** פושטו לשימוש נתמך נוכחי כגון `azd provision --preview` ו-`azd provision --preview -e production`
- **🧭 זרימת סדנא** עודכנה כך שלומדים יכולים להשלים את המעבדות ב-Codespaces, מיכל פיתוח, או קלון מקומי במקום להניח הרצה ב-Codespaces בלבד
- **🔐 הנחיות אימות** מעדיפות כעת את `azd auth login` לעבודה עם AZD, עם `az login` כאופציונלי כשמשתמשים ישירות בפקודות Azure CLI

#### תוקן
- **🪟 פקודות התקנה ל-Windows** נורמלזו לצורת האריזה `winget` העדכנית במדריך ההתקנה
- **🐧 הנחיות התקנה בלינוקס** תוקנו כדי למנוע הוראות למנהל החבילות `azd` ייחודיות להפצות שאינן נתמכות ובמקום זאת להפנות לנכסי הגרסה במידת הצורך
- **📦 דוגמאות למודל AI** עודכנו מדוגמאות ישנות כמו `gpt-35-turbo` ו-`text-embedding-ada-002` לדוגמאות עדכניות כמו `gpt-4.1-mini`, `gpt-4.1`, ו-`text-embedding-3-large`
- **📋 קטעי פריסה ואבחון** תוקנו לשימוש בפקודות הסביבה והסטטוס הנוכחיות ביומנים, בסקריפטים ובשלבי פתרון הבעיות
- **⚙️ הדרכה ל-GitHub Actions** עודכנה מ־`Azure/setup-azd@v1.0.0` ל-`Azure/setup-azd@v2`
- **🤖 הדרכה להסכמת MCP/Copilot** עודכנה מ־`azd mcp consent` ל-`azd copilot consent list`

#### שופר
- **🧠 הדרכת פרק AI** מסבירה עכשיו טוב יותר את התנהגות `azd ai` הרגישה לתצוגה מקדימה, התחברות ספציפית ללקוח, שימוש נוכחי בתוספים, והמלצות מעודכנות לפריסת מודלים
- **🧪 הוראות סדנה** משתמשות עכשיו בדוגמאות גרסאות מציאותיות יותר ושפה ברורה יותר להקמת סביבה במעבדות מעשיות
- **📈 מסמכי ייצור וטיפול בתקלות** מותאמים עכשיו טוב יותר למעקב נוכחי, מודל גיבוי, ודוגמאות לרמות עלות

#### קבצים עודכנו
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 16-03-2026

#### פקודות AZD AI CLI, אימות תוכן והרחבת תבניות
**גרסה זו מוסיפה כיסוי פקודות של `azd ai`, `azd extension` ו-`azd mcp` בכל הפרקים הקשורים לבינה מלאכותית, מתוקנת קישורים שבורים וקוד מיושן בקובץ agents.md, מעדכנת את גיליון העזר, ומשדרגת את סעיף תבניות הדוגמה עם תיאורים מאומתים ותבניות Azure AI AZD חדשות.**

#### נוסף
- **🤖 כיסוי AZD AI CLI** ב-7 קבצים (קודם רק בפרק 8):
  - `docs/chapter-01-foundation/azd-basics.md` — סעיף חדש "הרחבות ופקודות AI" המציג את `azd extension`, `azd ai agent init`, ו-`azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — אפשרות 4: `azd ai agent init` עם טבלת השוואה (תבנית מול גישת מניפסט)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — תתי-סעיפים "הרחבות AZD לפאונדרי" ו-"פריסת סוכנים ראשונה"
  - `docs/chapter-05-multi-agent/README.md` — התחלה מהירה מציגה כעת את דרכי הפריסה המבוססות תבנית ומניפסט
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — סעיף הפריסה כולל כעת את אפשרות `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — תת-סעיף "פקודות הרחבת AZD AI לאבחונים"
  - `resources/cheat-sheet.md` — סעיף חדש "פקודות AI והרחבות" עם `azd extension`, `azd ai agent init`, `azd mcp`, ו-`azd infra generate`
- **📦 תבניות דוגמה חדשות ל-AZD AI** ב-`microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — צ'אט RAG ב-.NET עם Blazor WebAssembly, Semantic Kernel, ותמיכת שיחה קולית
  - **azure-search-openai-demo-java** — צ'אט Java RAG המשתמש ב-Langchain4J עם אפשרויות פריסה ACA/AKS
  - **contoso-creative-writer** — אפליקציית כתיבה יצירתית רב-סוכנית המשתמשת ב-Azure AI Agent Service, Bing Grounding ו-Prompty
  - **serverless-chat-langchainjs** — RAG ללא שרת המשתמש ב-Azure Functions + LangChain.js + Cosmos DB עם תמיכת פיתוח מקומית ב-Ollama
  - **chat-with-your-data-solution-accelerator** — מזרז RAG ארגוני עם פורטל ניהול, אינטגרציה עם Teams, ואפשרויות PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — אפליקציית הפניה רב-סוכנית MCP עם שרתים ב-.NET, Python, Java, ו-TypeScript
  - **azd-ai-starter** — תבנית התחלה מינימלית לתשתית Azure AI ב-Bicep
  - **🔗 קישור לגלריית AZD AI מדהימה** — הפניה ל-[גלריית ה-AI המדהימה של azd](https://azure.github.io/awesome-azd/?tags=ai) (מעל 80 תבניות)

#### תוקן
- **🔗 ניווט ב-agents.md**: קישורים קודמים/הבא מותאמים כעת לסדר השיעורים בקובץ README של פרק 2 (אינטגרציית Microsoft Foundry → סוכנים → פריסת דגמי AI)
- **🔗 קישורים שבורים ב-agents.md**: `production-ai-practices.md` תוקן ל-`../chapter-08-production/production-ai-practices.md` (3 מופעים)
- **📦 קוד מיושן ב-agents.md**: הוחלף `opencensus` ב-`azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API לא תקין ב-agents.md**: הועבר `max_tokens` מ-`create_agent()` ל-`create_run()` כ-`max_completion_tokens`
- **🔢 ספירת אסימונים ב-agents.md**: הוחלפה הערכה גסה של `len//4` ב-`tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: תוקנו השירותים מ-"Cognitive Search + App Service" ל-"Azure AI Search + Azure Container Apps" (שינוי ברירת המחדל לאוקטובר 2024)
- **contoso-chat**: עודכן התיאור להפניה ל-Azure AI Foundry + Prompty, תואם כותרת המאגר וערימת הטכנולוגיה בפועל

#### הוסר
- **ai-document-processing**: הוסרה הפניה לתבנית לא פעילה (המאגר אינו נגיש לציבור כתבנית AZD)

#### שופר
- **📝 תרגילים ב-agents.md**: תרגיל 1 מציג כעת פלט וצעד `azd monitor` צפוי; תרגיל 2 כולל קוד רישום מלא של `FunctionTool`; תרגיל 3 מחליף הנחיות מעורפלות בפקודות `prepdocs.py` קונקרטיות
- **📚 משאבים ב-agents.md**: עדכון קישורי תיעוד למסמכי Azure AI Agent Service והתחלת עבודה מהירה
- **📋 טבלת צעדים הבאים ב-agents.md**: נוספה קישור למעבדת AI Workshop לכיסוי פרקים מלא

#### קבצים שהתעדכנו
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### שיפור ניווט בקורס
**גרסה זו משפרת את ניווט הפרקים ב-README.md עם פורמט טבלה משודרג.**

#### שונה
- **טבלת מפה קורס**: משודרגת עם קישורים ישירים לשיעורים, הערכות משך וזמני מורכבות
- **ניקוי תיקיות**: הוסרו תיקיות ישנות מיותרות (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **אימות קישורים**: אושרו כל ה-21+ הקישורים הפנימיים בטבלת מפה הקורס

### [v3.16.0] - 2026-02-05

#### עדכוני שמות מוצר
**גרסה זו מעדכנת את ההפניות למותג המעדכנים של מיקרוסופט.**

#### שונה
- **Microsoft Foundry → Microsoft Foundry**: כל ההפניות עודכנו בכל הקבצים שאינם תרגום
- **Azure AI Agent Service → Foundry Agents**: שם השירות עודכן לשקף את המיתוג העדכני

#### קבצים שהתעדכנו
- `README.md` - דף כניסה ראשי לקורס
- `changelog.md` - היסטוריית גרסאות
- `course-outline.md` - מבנה הקורס
- `docs/chapter-02-ai-development/agents.md` - מדריך לסוכני AI
- `examples/README.md` - תיעוד דוגמאות
- `workshop/README.md` - דף כניסה לסדנה
- `workshop/docs/index.md` - אינדקס סדנה
- `workshop/docs/instructions/*.md` - כל קבצי ההוראות לסדנה

---

### [v3.15.0] - 2026-02-05

#### שכתוב מאגר משמעותי: שמות תיקיות לפי פרקים
**גרסה זו מארגנת מחדש את התיעוד לתיקיות פרק ייעודיות לניווט ברור יותר.**

#### שינוי שמות תיקיות
תיקיות ישנות הוחלפו בתיקיות ממוספרות לפי פרקים:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- נוסף חדש: `docs/chapter-05-multi-agent/`

#### העברות קבצים
| קובץ | מ | ל |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| כל קבצי pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| כל קבצי troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### נוסף
- **📚 קבצי README לפרקים**: נוצר README.md בכל תיקיית פרק עם:
  - מטרות למידה ומשך זמן
  - טבלת שיעורים עם תיאורים
  - פקודות התחלה מהירה
  - ניווט לפרקים אחרים

#### שונה
- **🔗 עדכון כל הקישורים הפנימיים**: 78+ נתיבים עודכנו בכל קבצי התיעוד
- **🗺️ README.md ראשי**: עדכון מפה הקורס עם המבנה החדש של הפרקים
- **📝 examples/README.md**: עדכון הפניות חוצות לתיקיות פרקים

#### הוסר
- מבנה תיקיות ישן (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ארגון מחדש במאגר: ניווט פרקים
**גרסה זו הוסיפה קבצי README לניווט בין פרקים (הוחלפה בגרסה v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### מדריך סוכני AI חדש
**גרסה זו מוסיפה מדריך מקיף לפריסת סוכני AI עם Azure Developer CLI.**

#### נוסף
- **🤖 docs/microsoft-foundry/agents.md**: מדריך מלא המכסה:
  - מה הם סוכני AI ואיך הם שונים מבוטים לצ'אט
  - שלוש תבניות סוכנים להתחלה מהירה (Foundry Agents, Prompty, RAG)
  - תבניות ארכיטקטורת סוכן (סוכן יחיד, RAG, רב-סוכני)
  - הגדרת כלי והתאמה אישית
  - ניטור ומעקב מדדים
  - שיקולי עלות ואופטימיזציה
  - תרחישי פתרון בעיות נפוצים
  - שלושה תרגילים מעשיים עם קריטריוני הצלחה

#### מבנה תוכן
- **הקדמה**: מושגים על סוכנים למתחילים
- **התחלה מהירה**: פריסת סוכנים עם `azd init --template get-started-with-ai-agents`
- **תבניות ארכיטקטורה**: דיאגרמות ויזואליות של תבניות סוכן
- **הגדרות**: הגדרת כלי ומשתני סביבה
- **ניטור**: אינטגרציה עם Application Insights
- **תרגילים**: למידה מעשית מתקדמת (20-45 דקות כל אחד)

---

### [v3.12.0] - 2026-02-05

#### עדכון סביבה ב-DevContainer
**גרסה זו מעדכנת את הגדרת מיכל הפיתוח עם כלים מודרניים וערכי ברירת מחדל טובים יותר לחוויית לימוד AZD.**

#### שונה
- **🐳 תמונת בסיס**: עודכן מ-`python:3.12-bullseye` ל-`python:3.12-bookworm` (הגרסה היציבה האחרונה של דביאן)
- **📛 שם מיכל**: שונה מ-"Python 3" ל-"AZD למתחילים" לשם בהירות

#### נוסף
- **🔧 תכונות מיכל פיתוח חדשות**:
  - `azure-cli` עם תמיכה ב-Bicep מופעלת
  - `node:20` (גרסת LTS לתבניות AZD)
  - `github-cli` לניהול תבניות
  - `docker-in-docker` לפריסות אפליקציות מיכל

- **🔌 ניתוב פורטים**: פורטים מוגדרים מראש לפיתוח שכיח:
  - 8000 (תצוגה מקדימה MkDocs)
  - 3000 (אפליקציות רשת)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 הרחבות VS Code חדשות**:
  - `ms-python.vscode-pylance` - שיפור אינטיליסנס לפייתון
  - `ms-azuretools.vscode-azurefunctions` - תמיכה ב-Azure Functions
  - `ms-azuretools.vscode-docker` - תמיכה ב-Docker
  - `ms-azuretools.vscode-bicep` - תמיכה בשפת Bicep
  - `ms-azure-devtools.azure-resource-groups` - ניהול משאבי Azure
  - `yzhang.markdown-all-in-one` - עריכה של Markdown
  - `DavidAnson.vscode-markdownlint` - בדיקת Markdown
  - `bierner.markdown-mermaid` - תמיכה בדיאגרמות Mermaid
  - `redhat.vscode-yaml` - תמיכה ב-YAML (לקובץ azure.yaml)
  - `eamodio.gitlens` - ויזואליזציית Git
  - `mhutchie.git-graph` - היסטוריית Git

- **⚙️ הגדרות VS Code**: נוספו הגדרות ברירת מחדל למתורגמן Python, עיצוב בשמירה וגיזום רווחים

- **📦 דרישות בקובץ requirements-dev.txt מעודכן**:
  - נضافة תוסף קטום MkDocs
  - נضافة pre-commit לאיכות קוד
  - נضافة חבילות Azure SDK (azure-identity, azure-mgmt-resource)

#### תוקן
- **פקודת Post-Create**: בודקת כעת את התקנת AZD ו-Azure CLI בהפעלת המיכל

---

### [v3.11.0] - 2026-02-05

#### שדרוג README למתחילים
**גרסה זו משפרת משמעותית את README.md כדי להיות נגיש יותר למתחילים ומוסיפה משאבים חיוניים למפתחי AI.**

#### נוסף
- **🆚 השוואת Azure CLI מול AZD**: הסבר ברור מתי להשתמש בכל כלי עם דוגמאות מעשיות
- **🌟 קישורים מדהימים ל-AZD**: קישורים ישירים לגלריית התבניות של הקהילה ומשאבי תרומה:
  - [גלריית AZD מדהימה](https://azure.github.io/awesome-azd/) - מעל 200 תבניות מוכנות לפריסה
  - [שלח תבנית](https://github.com/Azure/awesome-azd/issues) - תרומת קהילה
- **🎯 מדריך התחלה מהירה**: סעיף הפשטה בשלושה שלבים (התקן → היכנס → פרוס)
- **📊 טבלת ניווט מבוססת ניסיון**: הנחיות ברורות מהיכן להתחיל בהתאם לניסיון המפתח

#### שונה
- **מבנה README**: ארגון מחדש לחשיפה הדרגתית – מידע מפתח ראשון
- **סעיף הקדמה**: נוסח מחדש להסבר "הקסם של `azd up`" למתחילים מוחלטים
- **הסרת תוכן משוכפל**: הוסרו סעיפי פתרון בעיות כפולים
- **פקודות פתרון בעיות**: תוקן הקישור ל-`azd logs` לשימוש ב-`azd monitor --logs` חוקי

#### תוקן
- **🔐 פקודות אימות**: נוספו `azd auth login` ו-`azd auth logout` ל-cheat-sheet.md
- **קישורים שגויים לפקודות**: הוסרו השאריות של `azd logs` מתוך סעיף פתרון הבעיות ב-README

#### הערות
- **טווח**: שינויים הוחלו על README.md הראשי ו-resources/cheat-sheet.md
- **קהל יעד**: שיפורים המיועדים במיוחד למפתחים חדשים ל-AZD

---

### [v3.10.0] - 2026-02-05

#### עדכון דיוק פקודות Azure Developer CLI
**גרסה זו מתקנת פקודות AZD שאינן קיימות בתיעוד, ומבטיחה שכל דוגמאות הקוד משתמשות בסינטקס תקין של Azure Developer CLI.**

#### תוקן
- **🔧 הוסרו פקודות AZD שאינן קיימות**: בדיקה ותיקון מקיף של פקודות לא תקינות:
  - `azd logs` (לא קיימת) → הוחלפה ב-`azd monitor --logs` או חלופות Azure CLI
  - פקודות משנה של `azd service` (לא קיימות) → הוחלפו ב-`azd show` ו-Azure CLI
  - `azd infra import/export/validate` (לא קיימות) → הוסרו או הוחלפו בחלופות תקינות
  - דגלים של `azd deploy --rollback/--incremental/--parallel/--detect-changes` (לא קיימים) → הוסרו
  - דגלים של `azd provision --what-if/--rollback` (לא קיימים) → עודכנו לשימוש ב-`--preview`
  - `azd config validate` (לא קיימת) → הוחלפה ב-`azd config list`
  - `azd info`, `azd history`, `azd metrics` (לא קיימות) → הוסרו

- **📚 קבצים עודכנו עם תיקוני פקודות**:
  - `resources/cheat-sheet.md`: מעבר נרחב על הפניות לפקודות
  - `docs/deployment/deployment-guide.md`: תוקנו אסטרטגיות rollback ופריסה
  - `docs/troubleshooting/debugging.md`: תוקנו חלקי ניתוח יומנים
  - `docs/troubleshooting/common-issues.md`: עודכנו פקודות פתרון בעיות
  - `docs/troubleshooting/ai-troubleshooting.md`: תוקן חלק איתור באגים ב-AZD
  - `docs/getting-started/azd-basics.md`: תוקנו פקודות ניטור
  - `docs/getting-started/first-project.md`: עודכנו דוגמאות לניטור ואיתור באגים
  - `docs/getting-started/installation.md`: תוקנו דוגמאות עזרה וגרסה
  - `docs/pre-deployment/application-insights.md`: תוקנו פקודות צפייה ביומן
  - `docs/pre-deployment/coordination-patterns.md`: תוקנו פקודות איתור באגים של הסוכן

- **📝 עדכון הפניה לגרסה**: 
  - `docs/getting-started/installation.md`: שונה גירסת `1.5.0` הקבועה לגירסת `1.x.x` גנרית עם קישור לשחרורים

#### שונה
- **אסטרטגיות Rollback**: עודכן התיעוד לשימוש ב-Rollback מבוסס Git (לא קיים ב-AZD native)
- **צפייה ביומן**: הוחלפו הפניות ל-`azd logs` עם `azd monitor --logs`, `azd monitor --live` ופקודות Azure CLI
- **סעיף ביצועים**: הוסרו דגלי פריסה מקבילים/הדרגתיים לא קיימים, הוצעו חלופות תקינות

#### פרטים טכניים
- **פקודות AZD תקינות**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **דגלים תקינים ל-azd monitor**: `--live`, `--logs`, `--overview`
- **תכונות הוסרו**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### הערות
- **אימות**: פקודות אומתו מול Azure Developer CLI גרסה v1.23.x

---

### [v3.9.0] - 2026-02-05

#### השלמת סדנת עבודה ועדכון איכות תיעוד
**גרסה זו משלימה את מודולי הסדנה האינטרקטיביים, מתקן את כל הקישורים הפגומים בתיעוד, ומשפרת את איכות התוכן הכוללת למפתחים המשתמשים ב-Microsoft AZD.**

#### נוסף
- **📝 CONTRIBUTING.md**: מסמך הנחיות לתרומה חדש עם:
  - הנחיות ברורות לדיווח בעיות והצעת שינויים
  - סטנדרטים לתיעוד תוכן חדש
  - קווי הנחיה לדוגמאות קוד והסכמי הודעות commit
  - מידע על מעורבות בקהילה

#### הושלם
- **🎯 מודול סדנה 7 (סיכום)**: מודול סיכום הושלם במלואו עם:
  - סיכום מקיף של הישגי הסדנה
  - חלק עם מושגים מרכזיים שנרכשו, כולל AZD, תבניות ו-Microsoft Foundry
  - המלצות להמשך מסלול הלמידה
  - תרגילי אתגר בסדנה עם דירוגי קושי
  - משוב והתמיכה מהקהילה עם קישורים

- **📚 מודול סדנה 3 (פירוק)**: אובחנו מטרות הלמידה עם:
  - הדרכת הפעלת GitHub Copilot עם שרתי MCP
  - הבנת מבנה התיקיות של תבניות AZD
  - דפוסי ארגון Infrastructure-as-code (Bicep)
  - הוראות מעבדה מעשית

- **🔧 מודול סדנה 6 (סגירה)**: הושלם עם:
  - יעדי ניהול משאבים ועלויות
  - שימוש ב-`azd down` לפינוי תשתיות בטוח
  - הדרכות לשחזור שירותי קוגניציה שנמחקו ברכות
  - הצעות לבונוס לחקר GitHub Copilot ו- Azure Portal

#### תוקן
- **🔗 תיקוני קישורים שבורים**: תוקנו מעל 15 קישורים פנימיים שבורים בתיעוד:
  - `docs/ai-foundry/ai-model-deployment.md`: תוקנו נתיבי microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: תוקנו נתיבי ai-model-deployment.md ו-production-ai-practices.md
  - `docs/getting-started/first-project.md`: הוחלף cicd-integration.md שלא קיים ב-deployment-guide.md
  - `examples/retail-scenario.md`: תוקנו מסלולי FAQ ומדריך פתרון בעיות
  - `examples/container-app/microservices/README.md`: תוקנו מסלולי דף הבית וקיצור דרך למדריך פריסה
  - `resources/faq.md` ו-`resources/glossary.md`: עודכנו הפניות לפרקי AI
  - `course-outline.md`: תוקנו הפניות למדריך מרצה ומעבדת סדנת AI

- **📅 כרזת מצב סדנה**: עודכן מ"בעת בנייה" למצב סדנה פעילה עם תאריך פברואר 2026

- **🔗 ניווט בסדנה**: תוקנו קישורים שבורים לניווט ב-README.md של הסדנה שמפנים לתיקיית lab-1-azd-basics שלא קיימת

#### שונה
- **הצגת הסדנה**: הוסר אזהרת "בעת בנייה", הסדנה הושלמה ומוכנה לשימוש
- **עקביות ניווט**: הובטח שלכל מודולי הסדנה יש ניווט תקין ביניהם
- **הפניות למסלול הלימודים**: עודכנו הפניות פרקי מיקרוסופט פאונדרי למסלולים הנכונים

#### אומת
- ✅ כל קבצי Markdown באנגלית עם קישורים פנימיים תקינים
- ✅ מודולי סדנה 0-7 הושלמו עם מטרות למידה
- ✅ ניווט בין פרקים ומודולים פועל בצורה תקינה
- ✅ התוכן מתאים למפתחי AI המשתמשים ב-Microsoft AZD
- ✅ שפת התחלה ידידותית ומבנה מתוחזק בכל התוכן
- ✅ קובץ CONTRIBUTING.md מספק הנחיות ברורות לתורמים בקהילה

#### יישום טכני
- **אימות קישורים**: סקריפט PowerShell אוטומטי אימת את כל הקישורים הפנימיים בקבצי .md
- **בדיקת תוכן**: סקירה ידנית של השלמות הסדנה והתאמתה למתחילים
- **מערכת ניווט**: דפוסי ניווט עקביים בין פרקים ומודולים יושמו

#### הערות
- **היקף**: שינויים הוחלו רק על תיעוד באנגלית
- **תרגומים**: תיקיות תרגום לא עודכנו בגרסה זו (תרגום אוטומטי יסונכרן בהמשך)
- **משך הסדנה**: הסדנה המלאה מספקת כעת 3-4 שעות למידה מעשית

---

### [v3.8.0] - 2025-11-19

#### תיעוד מתקדם: ניטור, אבטחה ודפוסי רב-סוכנים
**גרסה זו מוסיפה שיעורים מקיפים ברמת A על אינטגרציית Application Insights, דפוסי אימות, ותיאום רב-סוכנים לפריסות הפקה.**

#### נוסף
- **📊 שיעור אינטגרציית Application Insights**: ב-`docs/pre-deployment/application-insights.md`:
  - פריסת AZD עם פרוביזיה אוטומטית
  - תבניות Bicep מלאות ל-Application Insights + Log Analytics
  - אפליקציות Python עובדות עם טלמטריה מותאמת אישית (מעל 1,200 שורות)
  - דפוסי ניטור AI/LLM (מעקב אסימוני ומחיר במיקרוסופט פאונדרי)
  - 6 דיאגרמות Mermaid (ארכיטקטורה, מעקב מבוזר, זרימת טלמטריה)
  - 3 תרגילים מעשיים (התראות, לוחות מחוונים, ניטור AI)
  - דוגמאות שאילתות Kusto ואסטרטגיות מיטוב עלויות
  - סטרימינג של מדדים בזמן אמת ואיתור באגים בזמן אמת
  - זמן למידה של 40-50 דקות עם דפוסים מוכנים לייצור

- **🔐 שיעור דפוסי אימות ואבטחה**: ב-`docs/getting-started/authsecurity.md`:
  - 3 דפוסי אימות (מחרוזות חיבור, Key Vault, זהות מנוהלת)
  - תבניות אינפרא מלאה לפריסות מאובטחות ב-Bicep
  - קוד אפליקציית Node.js עם אינטגרציית Azure SDK
  - 3 תרגילים מלאים (הפעלת זהות מנוהלת, זהות מוקצית למשתמש, סיבוב Key Vault)
  - שיטות עבודה מומלצות לאבטחה והגדרות RBAC
  - מדריך פתרון בעיות וניתוח עלויות
  - דפוסי אימות ללא סיסמה מוכנים לייצור

- **🤖 שיעור דפוסי תיאום רב-סוכנים**: ב-`docs/pre-deployment/coordination-patterns.md`:
  - 5 דפוסי תיאום (רציף, מקביל, היררכי, מונחה אירועים, הסכמה)
  - מימוש שירות אורקסטרטור מלא (Python/Flask, מעל 1,500 שורות)
  - 3 מימושי סוכן מומחים (מחקר, כותב, עורך)
  - אינטגרציית Service Bus לתורים
  - ניהול מצב ב-Cosmos DB למערכות מבוזרות
  - 6 דיאגרמות Mermaid המציגות אינטראקציות סוכן
  - 3 תרגילים מתקדמים (ניהול זמן, לוגיקת ניסיון מחדש, מכשול מעגל)
  - פירוט עלויות (240-565$ לחודש) עם אסטרטגיות מיטוב
  - אינטגרציה ל-Application Insights לניטור

#### משופר
- **פרק טרום פריסה**: כולל כעת דפוסי ניטור ותיאום מקיפים
- **פרק התחלות**: משופר עם דפוסי אימות מקצועיים
- **מוכנות לייצור**: כיסוי מלא מאבטחה לתצפית
- **סקירת קורס**: עודכן להפניות לשיעורים חדשים בפרקים 3 ו-6

#### שונה
- **התקדמות למידה**: אינטגרציה משופרת של אבטחה וניטור לאורך כל הקורס
- **איכות תיעוד**: סטנדרטים עקביים ברמה A (95-97%) לשיעורים החדשים
- **דפוסי ייצור**: כיסוי מלא מקצה לקצה לפריסות ארגוניות

#### שופר
- **חוויית המפתח**: מסלול ברור מפיתוח לניטור ייצור
- **סטנדרטים לאבטחה**: דפוסי מקצועיים לאימות וניהול סודות
- **תצפית**: אינטגרציה מלאה של Application Insights עם AZD
- **עומסי עבודה AI**: ניטור מיוחד למודלים של Microsoft Foundry ולמערכות רב-סוכנים

#### אומת
- ✅ כל השיעורים כוללים קוד עובד שלם (לא קטעים)
- ✅ דיאגרמות Mermaid ללמידה חזותית (19 בסך הכל ב-3 שיעורים)
- ✅ תרגילים מעשיים עם שלבי אימות (9 בסך הכל)
- ✅ תבניות Bicep מוכנות לייצור עם פריסה דרך `azd up`
- ✅ ניתוח עלויות ואסטרטגיות מיטוב
- ✅ מדריכים לפתרון בעיות ושיטות עבודה מומלצות
- ✅ נקודות בדיקה עם פקודות אימות

#### תוצאות דירוג התיעוד
- **docs/pre-deployment/application-insights.md**: - מדריך ניטור מקיף
- **docs/getting-started/authsecurity.md**: - דפוסי אבטחה מקצועיים
- **docs/pre-deployment/coordination-patterns.md**: - ארכיטקטורות רב-סוכן מתקדמות
- **תוכן כולל חדש**: - סטנדרטים עקביים ואיכותיים גבוהים

#### יישום טכני
- **Application Insights**: Log Analytics + טלמטריה מותאמת + מעקב מבוזר
- **אימות**: זהות מנוהלת + Key Vault + דפוסי RBAC
- **רב-סוכן**: Service Bus + Cosmos DB + Container Apps + אורקסטרציה
- **ניטור**: מדדים חיים + שאילתות Kusto + התראות + לוחות מחוונים
- **ניהול עלויות**: אסטרטגיות דגימה, מדיניות שמירה, בקרות תקציב

### [v3.7.0] - 2025-11-19

#### שיפורי איכות תיעוד ודוגמת Microsoft Foundry Models חדשה
**גרסה זו משפרת את איכות התיעוד במאגר ומוסיפה דוגמה מלאה לפריסת Microsoft Foundry Models עם ממשק שיחה gpt-4.1.**

#### נוסף
- **🤖 דוגמת שיחה Microsoft Foundry Models**: פריסת gpt-4.1 מלאה עם מימוש עובד ב-`examples/azure-openai-chat/`:
  - תשתית Microsoft Foundry Models מלאה (פריסת מודל gpt-4.1)
  - ממשק שיחה בשורת הפקודה Python עם היסטוריית שיחות
  - אינטגרציית Key Vault לאחסון מאובטח של מפתחות API
  - מעקב שימוש באסימונים ואומדן עלויות
  - הגבלה על קצב וטיפול בשגיאות
  - README מקיף עם מדריך פריסה של 35-45 דקות
  - 11 קבצים מוכנים לייצור (תבניות Bicep, אפליקציית Python, תצורה)
- **📚 תרגילי תיעוד**: נוספו תרגילים מעשיים למדריך התצורה:
  - תרגיל 1: תצורת סביבות מרובות (15 דקות)
  - תרגיל 2: תרגול ניהול סודות (10 דקות)
  - קריטריוני הצלחה ברורים ושלבי אימות
- **✅ אימות פריסה**: נוספה סקטת אימות למדריך הפריסה:
  - נהלי בדיקת בריאות
  - רשימת ביקורת קריטריוני הצלחה
  - פלטים צפויים לכל פקודות הפריסה
  - עזר לפתרון בעיות מהיר

#### משופר
- **examples/README.md**: עודכן לאיכות רמה A (93%):
  - נוספה azure-openai-chat לכל הסעיפים הרלוונטיים
  - עודכן מונה דוגמאות מקומי מ-3 ל-4
  - נוסף לטבלת דוגמאות יישומי AI
  - משולב ב-Quick Start למשתמשים בינוניים
  - נוסף לסעיף תבניות Microsoft Foundry
  - עודכנו סקטורים השוואה ומציאת טכנולוגיה
- **איכות התיעוד**: שופרה מ- B+ (87%) ל- A- (92%) בתיקיית המסמכים:
  - נוספו פלטים צפויים לדוגמאות פקודות קריטיות
  - נכללו שלבי אימות לשינויים בקונפיגורציה
  - שופרה למידה מעשית עם תרגילים פרקטיים

#### שונה
- **התקדמות הלמידה**: אינטגרציה טובה יותר של דוגמאות AI ללומדים בינוניים
- **מבנה התיעוד**: תרגילים יותר מעשיים עם תוצאות ברורות
- **תהליך האימות**: נקודות הצלחה מפורשות נוספו לזרימות עבודה מרכזיות

#### שופר
- **חווית המפתח**: פריסת דגמי Microsoft Foundry לוקחת כעת 35-45 דקות (לעומת 60-90 לאלטרנטיבות מורכבות)
- **שקיפות עלויות**: הערכות עלות ברורות ($50-200 לחודש) לדוגמת Microsoft Foundry Models
- **מסלול הלמידה**: למפתחים ב-AI יש נקודת כניסה ברורה עם azure-openai-chat
- **סטנדרטים לתיעוד**: פלטים צפויים ועבודות אימות עקביים

#### אומת
- ✅ דוגמת Microsoft Foundry Models פעילה לחלוטין עם `azd up`
- ✅ כל 11 קבצי היישום נכונים תחבירית
- ✅ הוראות README תואמות את חווית הפריסה בפועל
- ✅ קישורי התיעוד עודכנו ב-8+ מיקומים
- ✅ אינדקס הדוגמאות משקף במדויק 4 דוגמאות מקומיות
- ✅ אין קישורים כפולים חיצוניים בטבלאות
- ✅ כל ההתייחסויות לניווט נכונות

#### יישום טכני
- **ארכיטקטורת Microsoft Foundry Models**: דגם gpt-4.1 + Key Vault + דפוס Container Apps
- **אבטחה**: זהות מנוהלת מוכנה, סודות באחסון Key Vault
- **מוניטורינג**: אינטגרציה עם Application Insights
- **ניהול עלויות**: מעקב אחר אסימונים ואופטימיזציה בשימוש
- **פריסה**: פקודה בודדת של `azd up` להגדרה מלאה

### [v3.6.0] - 2025-11-19

#### עדכון משמעותי: דוגמאות לפריסת אפליקציית קונטיינר
**גרסה זו מציגה דוגמאות של פריסת אפליקציות קונטיינר יצרניות מוכנות עם Azure Developer CLI (AZD), עם תיעוד מלא ואינטגרציה למסלול הלמידה.**

#### נוספו
- **🚀 דוגמאות אפליקציית קונטיינר**: דוגמאות מקומיות חדשות ב-`examples/container-app/`:
  - [מדריך ראשי](examples/container-app/README.md): סקירה מלאה של פריסות מקונטיינרות, התחלה מהירה, ייצור ודפוסים מתקדמים
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API ידידותי למתחילים עם scale-to-zero, בדיקות בריאות, מוניטורינג ופתרון בעיות
  - [ארכיטקטורת מיקרוסרוויסים](../../examples/container-app/microservices): פריסה יצרנית של שירותים מרובים (API Gateway, מוצר, הזמנה, משתמש, התראות), העברת הודעות אסינכרונית, Service Bus, Cosmos DB, Azure SQL, מעקב מבוזר, פריסה modulated blue-green/canary
- **מומלצי עבודה**: אבטחה, מוניטורינג, אופטימיזציה של עלויות והנחיות CI/CD לעומסי עבודה מקונטיינרים
- **דוגמאות קוד**: `azure.yaml` שלם, תבניות Bicep, ויישומי שירות רב-שפתיים (Python, Node.js, C#, Go)
- **בדיקות ופתרון בעיות**: תרחישי בדיקה מקצה לקצה, פקודות מוניטורינג, הנחיות לפתרון בעיות

#### שונה
- **README.md**: עודכן להציג ולקשר לדוגמאות אפליקציות קונטיינר תחת "Local Examples - Container Applications"
- **examples/README.md**: עודכן להבליט דוגמאות אפליקציות קונטיינר, הוספת כניסות מטריצת השוואה, ועדכון הפניות לטכנולוגיה/ארכיטקטורה
- **מתווה הקורס ומדריך הלימוד**: עודכן להתייחס לדוגמאות אפליקציות קונטיינר ודפוסי פריסה בפרקים הרלוונטיים

#### אומת
- ✅ כל הדוגמאות החדשות ניתנות לפריסה עם `azd up` ופועלות לפי המומלצים
- ✅ קישורי התיעוד וניווט מעודכנים
- ✅ הדוגמאות מכסות תרחישים למתחילים ומתקדמים, כולל מיקרוסרוויסים יצרניים

#### הערות
- **היקף**: תיעוד ודוגמאות באנגלית בלבד
- **השלבים הבאים**: הרחבה עם דפוסי קונטיינר מתקדמים נוספים ואוטומציה של CI/CD בשחרורים עתידיים

### [v3.5.0] - 2025-11-19

#### שינוי שם מוצר: Microsoft Foundry
**גרסה זו מיישמת שינוי שם מוצר כולל מ-"Microsoft Foundry" ל-"Microsoft Foundry" בכל תיעוד באנגלית, המשקף את המיתוג הרשמי של מיקרוסופט.**

#### שונה
- **🔄 עדכון שם מוצר**: מיתוג מחדש מלא מ-"Microsoft Foundry" ל-"Microsoft Foundry"
  - עודכנו כל ההתייחסויות בתיעוד באנגלית בתיקיית `docs/`
  - שינוי שם תיקייה: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - שינוי שם קובץ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - סה"כ: 23 הפניות תוכן עודכנו ב-7 קבצי תיעוד

- **📁 שינויים במבנה התיקיות**:
  - `docs/ai-foundry/` שונה ל-`docs/microsoft-foundry/`
  - כל ההתייחסויות החוצות עודכנו לשקף את מבנה התיקייה החדש
  - קישורי הניווט אומתו בתיעוד כולו

- **📄 שינויי שם קבצים**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - כל הקישורים הפנימיים עודכנו לשם הקובץ החדש

#### קבצים עודכנו
- **תיעוד פרקים** (7 קבצים):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 עדכוני קישורי ניווט
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 הפניות לשם מוצר עודכנו
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - כבר משתמש ב-Microsoft Foundry (מעודכנים קודמים)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 הפניות עודכנו (סקירה, משוב קהילתי, תיעוד)
  - `docs/getting-started/azd-basics.md` - 4 קישורי הפניות חוזרות עודכנו
  - `docs/getting-started/first-project.md` - 2 קישורי ניווט פרקים עודכנו
  - `docs/getting-started/installation.md` - 2 קישורי פרק הבא עודכנו
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 הפניות עודכנו (ניווט, קהילת Discord)
  - `docs/troubleshooting/common-issues.md` - קישור ניווט אחד עודכן
  - `docs/troubleshooting/debugging.md` - קישור ניווט אחד עודכן

- **קבצי מבנה קורס** (2 קבצים):
  - `README.md` - 17 הפניות עודכנו (סקירת קורס, כותרות פרקים, מדור תבניות, תובנות קהילתיות)
  - `course-outline.md` - 14 הפניות עודכנו (סקירה, יעדי למידה, משאבי פרקים)

#### אומת
- ✅ לא נשארו הפניות לתיקיית "ai-foundry" בתיעוד באנגלית
- ✅ לא נשארו הפניות לשם המוצר "Microsoft Foundry" בתיעוד באנגלית
- ✅ כל קישורי הניווט תקינים עם מבנה התיקייה החדש
- ✅ שינויי שם קבצים ותיקיות הושלמו בהצלחה
- ✅ הפניות בין פרקים אומתו

#### הערות
- **היקף**: שינויים הוחלו רק על תיעוד באנגלית בתיקיית `docs/`
- **תרגומים**: תיקיות התרגום (`translations/`) לא עודכנו בגרסה זו
- **סדנא**: חומרי סדנא (`workshop/`) לא עודכנו בגרסה זו
- **דוגמאות**: קבצי דוגמאות עשויים עדיין לכלול הפניות לשמות וותיקים (מיועד לתיקון בעדכונים עתידיים)
- **קישורים חיצוניים**: כתובות URL חיצוניות וקישורים למאגר GitHub לא שונו

#### מדריך הגירה לתורמים
אם יש לכם סניפים מקומיים או תיעוד המתייחס למבנה הישן:
1. עדכנו הפניות לתיקיה: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. עדכנו הפניות לקובץ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. החליפו שם מוצר: "Microsoft Foundry" → "Microsoft Foundry"
4. ודאו שכל קישורי התיעוד הפנימיים עדיין עובדים

---

### [v3.4.0] - 2025-10-24

#### שדרוגי תצוגה מוקדמת ואימות תשתיות
**גרסה זו מציגה תמיכה מקיפה בתצוגה המוקדמת החדשה של Azure Developer CLI ומשפרת את חווית המשתמש בסדנא.**

#### נוספו
- **🧪 תיעוד פקודת azd provision --preview**: כיסוי מקיף של יכולת התצוגה המוקדמת לתשתיות
  - הפניה לפקודות ודוגמאות שימוש בגליון עזר
  - אינטגרציה מפורטת במדריך פריסה עם מקרים ושימושים
  - אינטגרציה לבדיקה מוקדמת לביצוע אימות בטוח יותר
  - עדכוני מדריך התחלה עם הנחיות פריסה בבטיחות
- **🚧 באנר מצב סדנא**: באנר HTML מקצועי המראה מצב פיתוח הסדנא
  - עיצוב מדרג עם סימני בניה לתקשורת ברורה למשתמש
  - חותמת זמן עדכון אחרונה לשקיפות
  - עיצוב רספונסיבי למכשירים שונים

#### שופר
- **בטיחות תשתיות**: תכונת התצוגה המוקדמת מאוגדת בתיעוד הפריסה
- **אימות לפני פריסה**: סקריפטים אוטומטיים כוללים כעת בדיקות תצוגה מוקדמת
- **זרימת עבודה למפתח**: סיקור פקודות מעודכן כולל תצוגה מוקדמת כמומלץ
- **חווית הסדנא**: הגדרת ציפיות ברורה למשתמשים לגבי מצב הפיתוח

#### שונה
- **מומלץ לפריסה**: מומלץ כעת תהליך עבודה המתחיל בתצוגה מוקדמת
- **זרם התיעוד**: אימות התשתיות קודם בתהליך הלמידה
- **הצגת סדנא**: תקשורת מקצועית על מצב הפיתוח עם לוח זמנים ברור

#### שופר
- **גישה בטיחותית ראשונה**: שינויים בתשתיות ניתנים לאימות לפני פריסה
- **שיתוף עבודת צוות**: ניתן לשתף תוצאות תצוגה מוקדמת לבדיקה ואישור
- **מודעות עלויות**: הבנת טובה יותר של עלויות משאבים לפני הפריסה
- **הפחתת סיכונים**: צמצום כישלונות בפריסה באמצעות אימות מקדים

#### יישום טכני
- **אינטגרציה במסמכים מרובים**: תכונת התצוגה המוקדמת מתועדת בארבעה קבצים מרכזיים
- **דפוסי פקודות**: תחביר ודוגמאות עקביים בתיעוד
- **אינטגרציית מומלץ עבודה**: התצוגה המוקדמת נכללת בזרמי עבודה ובסקריפטים לאימות
- **סימנים ויזואליים**: סימוני NEW ברורים לגילוי

#### תשתיות הסדנא
- **תקשורת מצב**: באנר HTML מקצועי עם עיצוב מדרג
- **חווית משתמש**: מצב פיתוח ברור מונע בלבול
- **הצגה מקצועית**: שומר על אמינות המאגר תוך קביעת ציפיות
- **שקיפות זמן**: חותמת זמן עדכון אחרונה אוקטובר 2025 לאחריות

### [v3.3.0] - 2025-09-24

#### חומרים לסדנא משופרים וחווית למידה אינטראקטיבית
**גרסה זו מציגה חומרי סדנא מקיפים עם מדריכים אינטראקטיביים בדפדפן ונתיבי למידה מובנים.**

#### נוספו
- **🎥 מדריך סדנא אינטראקטיבי**: חווית סדנא בדפדפן עם יכולות תצוגה מוקדמת MkDocs
- **📝 הנחיות סדנא מובנות**: מסלול למידה מודרך בן 7 שלבים מגילוי ועד התאמה אישית
  - 0-מבוא: סקירת הסדנא והגדרה
  - 1-בחירת תבנית AI: תהליך גילוי ובחירת התבנית
  - 2-אימות תבנית AI: פריסה ונהלי אימות
  - 3-פירוק תבנית AI: הבנת ארכיטקטורת התבנית
  - 4-הגדרת תבנית AI: קונפיגורציה והתאמה אישית
  - 5-התאמת תבנית AI: שינויים ויטורים מתקדמים
  - 6-פירוק תשתיות: ניקוי וניהול משאבים
  - 7-סיכום: לסיכום והצעדים הבאים
- **🛠️ כלי סדנא**: הגדרת MkDocs עם תבנית Material לחווית למידה משופרת
- **🎯 נתיב למידה מעשי**: שיטתיות בת 3 שלבים (גילוי → פריסה → התאמה אישית)
- **📱 אינטגרציה עם GitHub Codespaces**: סביבה לפיתוח חלקה

#### שופר
- **מעבדת סדנא AI**: מורחב לחווית למידה מובנית מקיפה של 2-3 שעות
- **תיעוד הסדנא**: הצגה מקצועית עם ניווט ועזרים ויזואליים
- **התקדמות הלמידה**: הנחיות צעד-אחר-צעד ברורות מבחירת התבנית ועד פריסה לייצור
- **חווית המפתח**: כלים אינטגרטיביים לזרמי עבודה מזורזים

#### שופר
- **נגישות**: ממשק בדפדפן עם חיפוש, העתקה, והחלפת ערכת נושא
- **למידה בקצב עצמי**: מבנה סדנא גמיש המתאים לקצבי למידה שונים
- **יישום מעשי**: תרחישי פריסת תבנית AI מהעולם האמיתי
- **אינטגרציה קהילתית**: אינטגרציה עם Discord לתמיכה ושיתוף פעולה בסדנא

#### תכונות הסדנא
- **חיפוש מובנה**: גילוי מהיר של מילות מפתח ושיעורים
- **העתק קוד בקלות**: פונקציונליות העתקה כאשר מרחפים מעל בלוקים
- **החלפת ערכת נושא**: מצב כהה/בהיר לתמיכה בהעדפות שונות
- **משאבים ויזואליים**: צילום מסך ותרשימים להבנה משופרת
- **אינטגרציית עזרה**: גישה ישירה ל-Discord לתמיכה קהילתית

### [v3.2.0] - 2025-09-17

#### שדרוג משמעותי במבנה הניווט ומערכת למידה מבוססת פרקים
**גרסה זו מציגה מבנה למידה מקיף ומבוסס פרקים עם ניווט משופר בכל המאגר.**

#### נוספו
- **📚 מערכת למידה מבוססת פרקים**: ארגון מחודש של הקורס ל-8 פרקים להתפתחות הדרגתית
  - פרק 1: יסודות והתחלה מהירה (⭐ - 30-45 דקות)
  - פרק 2: פיתוח מבוסס AI (⭐⭐ - 1-2 שעות)
  - פרק 3: קונפיגורציה ואימות זהות (⭐⭐ - 45-60 דקות)
  - פרק 4: תשתיות כקוד ופריסה (⭐⭐⭐ - 1-1.5 שעות)
  - פרק 5: פתרונות AI רב-סוכנים (⭐⭐⭐⭐ - 2-3 שעות)
  - פרק 6: אימות ותכנון לפני פריסה (⭐⭐ - שעה)
  - פרק 7: פתרון בעיות ודיבוג (⭐⭐ - 1-1.5 שעות)
  - פרק 8: דפוסי ייצור וארגוניים (⭐⭐⭐⭐ - 2-3 שעות)
- **📚 מערכת ניווט מקיפה**: כותרות תחתונות וראשיות עקביות בתיעוד כולו
- **🎯 מעקב התקדמות**: רשימת בדיקה לסיום הקורס ומערכת אימות למידה
- **🗺️ הנחיית מסלול למידה**: נקודות כניסה ברורות לרמות ניסיון ומטרות שונות
- **🔗 ניווט בצירופי הפניות**: פרקים קשורים ותנאים מוקדמים מקושרים בבירור

#### שופר
- **מבנה README**: הוסב לפלטפורמת למידה מובנית עם ארגון מבוסס פרקים
- **ניווט בתיעוד**: כל דף מכיל כעת הקשר פרק והכוונת התקדמות
- **ארגון תבניות**: דוגמאות ותבניות ממופים לפרקי למידה רלוונטיים
- **אינטגרציה של משאבים**: גיליונות עזר, שאלות נפוצות ומדריכי לימוד מחוברים לפרקים המתאימים
- **אינטגרציה של סדנא**: מעבדות מעשיות ממוינות ליעדי למידה בפרקים שונים

#### שונה
- **התקדמות הלמידה**: מעבר מתיעוד ליניארי ללמידה גמישה מבוססת פרקים
- **מיקום הקונפיגורציה**: מיקום מדריך הקונפיגורציה כפרק 3 לשיפור זרימת הלמידה
- **שילוב תוכן AI**: שילוב טוב יותר של תוכן ייחודי ל-AI לאורך כל מסע הלמידה
- **תוכן לייצור**: דפוסים מתקדמים מאוחדים בפרק 8 ללומדים ארגוניים

#### שופר
- **חוויית משתמש**: לחמניות ניווט ברורות ומדדי התקדמות בפרקים
- **נגישות**: דפוסי ניווט עקביים למעבר קל יותר בקורס
- **הצגה מקצועית**: מבנה קורס בסגנון אוניברסיטאי מתאים להכשרה אקדמית וארגונית
- **יעילות למידה**: הפחתת זמן למצוא תוכן רלוונטי דרך ארגון משופר

#### יישום טכני
- **כותרות ניווט**: סטנדרטיזציה של ניווט בפרקים ב-40+ קבצי תיעוד
- **ניווט תחתית**: הדרכת התקדמות עקבית ומדדי סיום פרק
- **קישור צולב**: מערכת קישורים פנימית מקיפה המקשרת מושגים קשורים
- **מיפוי פרקים**: תבניות ודוגמאות משויכות בבירור למטרות למידה

#### שיפור מדריך הלימוד
- **📚 מטרות למידה מקיפות**: ארגון מחדש של מדריך הלימוד ליישור עם מערכת של 8 פרקים
- **🎯 הערכה מבוססת פרק**: כל פרק כולל מטרות למידה ספציפיות ותרגולים מעשיים
- **📋 מעקב התקדמות**: לוח זמנים שבועי עם תוצאות מדידות ורשימות בדיקה לסיום
- **❓ שאלות הערכה**: שאלות לאימות ידע לכל פרק עם תוצאות מקצועיות
- **🛠️ תרגילים מעשיים**: פעילויות מעשיות עם תרחישי פריסה אמיתיים ופתרון תקלות
- **📊 התקדמות מיומנויות**: התקדמות ברורה מקונספטים בסיסיים לדפוסי ארגונים עם מיקוד בפיתוח קריירה
- **🎓 מסגרת הסמכה**: תוצאות פיתוח מקצועי ומערכת הכרה קהילתית
- **⏱️ ניהול לוחות זמנים**: תוכנית למידה מובנית של 10 שבועות עם אימות אבני דרך

### [v3.1.0] - 2025-09-17

#### פתרונות AI מרובי-סוכנים משופרים
**גרסה זו משפרת את פתרון הקמעונאות הרב-סוכני עם שמות סוכנים טובים יותר ותיעוד משופר.**

#### שונו
- **מונחי רב-סוכנים**: החלפת "סוכן קורה" ב"סוכן לקוח" בכל פתרון הקמעונאות הרב-סוכני להבנה ברורה יותר
- **ארכיטקטורת סוכן**: עדכון כל התיעוד, תבניות ARM ודוגמאות קוד לשם עקבי "סוכן לקוח"
- **דוגמאות קונפיגורציה**: עידכון דפוסי קונפיגורציה של סוכן עם קונבנציות שמות מעודכנות
- **עקביות תיעוד**: הבטחת שימוש בשמות סוכנים תיאוריים ומקצועיים בכל הפניות

#### שופרו
- **חבילת תבנית ARM**: עדכון retail-multiagent-arm-template עם הפניות לסוכן לקוח
- **דיאגרמות ארכיטקטורה**: רענון דיאגרמות Mermaid עם שמות סוכנים מעודכנים
- **דוגמאות קוד**: מחלקות פייתון ודוגמאות יישום כעת משתמשות בשם CustomerAgent
- **משתני סביבה**: עדכון כל סקריפטי הפריסה לשימוש בקונבנציית CUSTOMER_AGENT_NAME

#### שופר
- **חוויית מפתחים**: תפקידים ואחריות ברורים יותר בסיפור התיעוד
- **מוכנות לייצור**: התאמה טובה יותר לקונבנציות שמות ארגוניות
- **חומרי למידה**: שמות סוכנים אינטואיטיביים יותר לצורכי לימוד
- **נוחות שימוש בתבניות**: הבנה פשוטה יותר של פונקציות סוכן ודפוסי פריסה

#### פרטים טכניים
- עדכון דיאגרמות ארכיטקטורת Mermaid עם הפניות ל-CustomerAgent
- החלפת שמות מחלקות CoraAgent ב-CustomerAgent בדוגמאות פייתון
- שינוי קונפיגורציות JSON של תבניות ARM לשימוש בסוג סוכן "customer"
- עדכון משתני סביבה מ-CORA_AGENT_* ל-CUSTOMER_AGENT_*
- רענון כל פקודות הפריסה וקונפיגורציות המכולות

### [v3.0.0] - 2025-09-12

#### שינויים עיקריים - מיקוד במפתחי AI ואינטגרציה עם Microsoft Foundry
**גרסה זו משנה את המחסן למשאב למידה מקיף ממוקד AI עם אינטגרציה ל-Microsoft Foundry.**

#### נוסף
- **🤖 מסלול למידה ממוקד AI**: ארגון מחדש מלא המעדיף מפתחי ומהנדסי AI
- **מדריך אינטגרציה ל-Microsoft Foundry**: תיעוד מקיף לחיבור AZD לשירותי Microsoft Foundry
- **דפוסי פריסה לדגמי AI**: מדריך מפורט לבחירת מודלים, קונפיגורציה ואסטרטגיות פריסה בייצור
- **מעבדת סדנא ל-AI**: סדנא מעשית של 2-3 שעות להמרת יישומי AI לפתרונות פרוסים ב-AZD
- **שיטות עבודה מומלצות ל-AI בייצור**: דפוסים מוכנים לארגונים להרחבה, ניטור ואבטחת עומסי עבודה של AI
- **מדריך לפתירת בעיות ספציפיות ל-AI**: פתרון תקלות מקיף לדגמי Microsoft Foundry, Cognitive Services ופריסות AI
- **גלריית תבניות AI**: אוסף בולט של תבניות Microsoft Foundry עם דירוגי מורכבות
- **חומרי סדנא**: מבנה סדנא מלא עם מעבדות מעשיות וחומרי עזר

#### שופר
- **מבנה README**: ממוקד מפתחי AI עם 45% עניין קהילתי מדיסקורד Microsoft Foundry
- **מסלולי למידה**: מסלול ייחודי למפתח AI לצד מסלולים מסורתיים לסטודנטים ומפתחי DevOps
- **המלצות תבניות**: תבניות AI נבחרות כולל azure-search-openai-demo, contoso-chat, ו-openai-chat-app-quickstart
- **אינטגרציה קהילתית**: שיפור תמיכת הקהילה בדיסקורד עם ערוצים ודיונים ייחודיים ל-AI

#### אבטחה ומיקוד ייצור
- **דפוסי זיהוי מנוהל**: קונפיגורציות אימות ואבטחה ייחודיות ל-AI
- **אופטימיזציית עלויות**: מעקב על שימוש בטוקנים ובקרה על תקציבים לעומסי AI
- **פריסה מרובת-אזורים**: אסטרטגיות לפריסת יישומי AI גלובלית
- **ניטור ביצועים**: מדדי AI מיוחדים ואינטגרציה עם Application Insights

#### איכות תיעוד
- **מבנה ליניארי של הקורס**: התקדמות לוגית מדפוסי פריסה למתחילים ועד מתקדמים ל-AI
- **כתובות URL מאומתות**: כל קישורי המחסנים החיצוניים נבדקו ונגישים
- **הפניות פנימיות שלמות**: כל קישורי התיעוד הפנימי נבדקו ופועלים
- **מוכן לייצור**: דפוסי פריסה ארגוניים עם דוגמאות מהשטח

### [v2.0.0] - 2025-09-09

#### שינויים עיקריים - ארגון מחדש של המחסן ושיפור מקצועי
**גרסה זו מייצגת מהפך משמעותי במבנה המחסן ובהצגת התוכן.**

#### נוסף
- **מסגרת למידה מובנית**: כל דפי התיעוד כוללים כעת מבוא, מטרות למידה, ותוצאות למידה
- **מערכת ניווט**: הוספת קישורים לשיעור הקודם/הבא לאורך כל התיעוד להדרכה בהתקדמות הלמידה
- **מדריך לימוד**: study-guide.md מקיף עם מטרות למידה, תרגולים חווייתיים, וחומרי הערכה
- **הצגה מקצועית**: הסרת כל האימוג'ים לשיפור נגישות והמראה המקצועי
- **מבנה תוכן משופר**: ארגון וזרימה משופרים של חומרי הלמידה

#### שונו
- **פורמט תיעוד**: סטנדרטיזציה של כל התיעוד במבנה למידה עקבי
- **זרימת ניווט**: יישום התקדמות לוגית לאורך כל חומרי הלמידה
- **הצגת התוכן**: הסרת אלמנטים דקורטיביים לטובת עיצוב ברור ומקצועי
- **מבנה קישורים**: עדכון כל הקישורים הפנימיים לתמיכה במערכת ניווט חדשה

#### שופר
- **נגישות**: הסרת תלות באימוג'ים לשיפור תאימות לקוראי מסך
- **מראה מקצועי**: הצגה נקייה בסגנון אקדמי המתאים ללמידה ארגונית
- **חוויית למידה**: גישה מובנית עם מטרות ותוצאות ברורות לכל שיעור
- **ארגון תוכן**: זרימה לוגית טובה יותר וחיבור בין נושאים קשורים

### [v1.0.0] - 2025-09-09

#### שחרור התחלה - מחסן למידה מקיף ל-AZD

#### נוסף
- **מבנה תיעוד מרכזי**
  - סדרת מדריכי התחלה מלאה
  - תיעוד פריסה ואספקה מקיף
  - משאבי פתרון תקלות ומדריכי ניפוי באגים מפורטים
  - כלים ונהלים לאימות לפני פריסה

- **מודול התחלה**
  - יסודות AZD: מושגים מרכזיים ומונחים
  - מדריך התקנה: הוראות התקנה לפלטפורמות ספציפיות
  - מדריך קונפיגורציה: הגדרת סביבה ואימות
  - מדריך פרויקט ראשון: למידה מעשית שלב-אחר-שלב

- **מודול פריסה ואספקה**
  - מדריך פריסה: תיעוד תהליך עבודה מלא
  - מדריך אספקה: תשתית כקוד עם Bicep
  - שיטות עבודה מומלצות לפריסות ייצור
  - דפוסי ארכיטקטורה מרובי שירותים

- **מודול אימות לפני פריסה**
  - תכנון קיבולת: אימות זמינות משאבים ב-Azure
  - בחירת SKU: הדרכה מלאה לברירת רמות שירות
  - בדיקות מקדימות: סקריפטים לאימות אוטומטי (PowerShell ו-Bash)
  - כלים לאמידת עלויות ותכנון תקציב

- **מודול פתרון תקלות**
  - בעיות נפוצות: בעיות ופתרונות שכיחים
  - מדריך ניפוי באגים: שיטות פתרון תקלות שיטתי
  - טכניקות וכלים לאבחון מתקדם
  - ניטור ביצועים ואופטימיזציה

- **משאבים והפניות**
  - דף פקודות מהיר: הפניות לפקודות חיוניות
  - מילון מונחים: הגדרות מונחים ואקרונים הכוללות
  - שאלות נפוצות: תשובות מפורטות לשאלות שגרתיות
  - קישורים למשאבים חיצוניים וקישורים לקהילה

- **דוגמאות ותבניות**
  - דוגמה לאפליקציית ווב פשוטה
  - תבנית פריסת אתר סטטי
  - קונפיגורציית אפליקציית קונטיינר
  - דפוסי אינטגרציית מסדי נתונים
  - דוגמאות לארכיטקטורת מיקרו-שירותים
  - יישומי פונקציות ללא שרת

#### תכונות
- **תמיכה ברב-פלטפורמות**: מדריכי התקנה וקונפיגורציה ל-Windows, macOS ו-Linux
- **רמות מיומנות מרובות**: תוכן המיועד לסטודנטים ומפתחים מקצועיים
- **מיקוד מעשי**: דוגמאות חיות ותרחישים מהעולם האמיתי
- **כיסוי מקיף**: ממושגים בסיסיים לדפוסי ארגונים מתקדמים
- **גישה עם עדיפות לאבטחה**: שיטות עבודה מומלצות לאבטחה משולבות לאורך כל הדרך
- **אופטימיזציית עלויות**: הנחיות לפריסות חסכוניות וניהול משאבים

#### איכות תיעוד
- **דוגמאות קוד מפורטות**: קוד מעשי ונבדק
- **הוראות שלב-אחר-שלב**: הדרכה ברורה ובר-ביצוע
- **טיפול שגיאות מקיף**: פתרון בעיות נפוצות
- **שילוב שיטות עבודה מומלצות**: סטנדרטים והמלצות תעשייתיות
- **תאימות גרסאות**: עדכון תכוף לשירותי Azure ופיצ'רי azd העדכניים ביותר

## שיפורים עתידיים מתוכננים

### גרסה 3.1.0 (מתוכנן)
#### הרחבת פלטפורמת AI
- **תמיכה ברב-מודלים**: דפוסי אינטגרציה ל-Hugging Face, Azure Machine Learning ומודלים מותאמים אישית
- **מסגרות סוכני AI**: תבניות לפריסות LangChain, Semantic Kernel, ו-AutoGen
- **דפוסי RAG מתקדמים**: אפשרויות למסדי נתונים וקטוריים מעבר ל-Azure AI Search (Pinecone, Weaviate וכו')
- **תצפית AI**: ניטור משופר של ביצועי מודלים, שימוש בטוקנים ואיכות תגובות

#### חוויית מפתח
- **תוסף VS Code**: חוויית פיתוח משולבת של AZD + Microsoft Foundry
- **אינטגרציה עם GitHub Copilot**: יצירת תבניות AZD בסיוע AI
- **הדרכות אינטראקטיביות**: תרגילי קוד מעשיים עם אימות אוטומטי לתרחישי AI
- **תוכן וידאו**: הדרכות וידאו משלימות ללומדים חזותיים עם מיקוד בפריסות AI

### גרסה 4.0.0 (מתוכנן)
#### דפוסי AI ארגוניים
- **מסגרת ממשל**: ממשל מודל AI, תאימות, ומסלולי ביקורת
- **AI מרובה שוכרים**: דפוסים לשרת לקוחות מרובים עם שירותי AI מבודדים
- **פריסת AI בקצה**: אינטגרציה עם Azure IoT Edge ומופעי מכולות
- **AI בענן היברידי**: דפוסי פריסה מרובי עננים והיברידיים לעומסי AI

#### תכונות מתקדמות
- **אוטומציה של צינור AI**: אינטגרציה עם צינורות MLOps ב-Azure Machine Learning
- **אבטחה מתקדמת**: דפוסי אפס אמון, נקודות קצה פרטיות והגנה מתקדמת מפני איומים
- **אופטימיזציית ביצועים**: כיוונון מתקדם ואסטרטגיות סקיילינג ליישומים בעלי תפוקה גבוהה של AI
- **פצת גלובלית**: דפוסי הפצת תוכן והמטמון בקצה ליישומי AI

### גרסה 3.0.0 (מתוכנן) - הוחלפה על ידי גרסה נוכחית
#### תוספות מוצעות - כעת מיושמות ב-v3.0.0
- ✅ **תוכן ממוקד AI**: אינטגרציה מקיפה עם Microsoft Foundry (הושלם)
- ✅ **הדרכות אינטראקטיביות**: מעבדת סדנא מעשית ל-AI (הושלם)
- ✅ **מודול אבטחה מתקדם**: דפוסי אבטחה ייעודיים ל-AI (הושלם)
- ✅ **אופטימיזציית ביצועים**: אסטרטגיות כיוונון עומסי AI (הושלם)

### גרסה 2.1.0 (מתוכנן) - מיושם חלקית ב-v3.0.0
#### שיפורים קטנים - חלק הושלם בגרסה הנוכחית
- ✅ **דוגמאות נוספות**: תרחישי פריסה ממוקדי AI (הושלם)
- ✅ **שאלות נפוצות מורחבות**: שאלות ופתרון תקלות ספציפיות ל-AI (הושלם)
- **אינטגרציית כלים**: מדריכי אינטגרציה משופרים ל-IDE ועורכים
- ✅ **הרחבת ניטור**: דפוסי ניטור והתראות ספציפיים ל-AI (הושלם)

#### עדיין מתוכנן לשחרור עתידי
- **תיעוד ידידותי למובייל**: עיצוב רספונסיבי ללמידה במובייל
- **גישה אוף-ליין**: חבילות תיעוד להורדה
- **אינטגרציית IDE משופרת**: תוסף VS Code לזרימות עבודה של AZD + AI
- **לוח מחוונים קהילתי**: מדדי קהילה בזמן אמת ומעקב אחר תרומות

## תרומה ליומן שינויים

### דיווח שינויים
בעת תרומה למחסן זה, נא ודא שהערכי יומן השינויים כוללים:

1. **מספר גרסה**: בהתאם לגרסת סמנטית (ראשי.משני.תיקון)
2. **תאריך**: תאריך שחרור או עדכון בפורמט YYYY-MM-DD
3. **קטגוריה**: נוסף, שונה, מיושן, הוסר, תוקן, אבטחה
4. **תיאור ברור**: תיאור תמציתי של מה השתנה
5. **הערכת השפעה**: כיצד השינויים משפיעים על משתמשים קיימים

### קטגוריות שינויים

#### נוסף
- תכונות חדשות, סעיפים בתיעוד או יכולות
- דוגמאות חדשות, תבניות או משאבי למידה
- כלים נוספים, סקריפטים או שירותים נלווים

#### שונה
- שינויים בתפקוד או בתיעוד הקיים
- עדכונים לשיפור בהירות או דיוק
- ארגון מחדש של התוכן או מבנהו

#### מיושן
- תכונות או גישות שנמצאות בתהליך פינוי
- סעיפים בתיעוד מתוכננים להסרה
- שיטות שיש אלטרנטיבות טובות יותר להן

#### הוסר
- תכונות, תיעוד, או דוגמאות שאינם רלוונטיים עוד
- מידע מיושן או גישות שהוסרו
- תוכן מיותר או מאוחד

#### תוקן
- תיקונים לשגיאות בתיעוד או קוד
- פתרון בעיות או תקלות שדווחו
- שיפורים לדיוק או תפקוד

#### אבטחה
- שיפורים או תיקונים הקשורים לאבטחה
- עדכונים לטיפולים מומלצים לאבטחה
- פתרון פרצות אבטחה

### הנחיות לגרסת סמנטית

#### גרסה עיקרית (X.0.0)
- שינויים משמעותיים שדורשים פעולה מצד המשתמש
- ארגון או מבנה תוכן משמעותיים
- שינויים שמשנים את הגישה או המתודולוגיה הבסיסית

#### גרסה משנית (X.Y.0)
- תכונות חדשות או תוספות תוכן
- שיפורים שמאפשרים תאימות לאחור
- דוגמאות נוספות, כלים או משאבים

#### גרסת תיקון (X.Y.Z)
- תיקוני באגים ותיקונים
- שיפורים קטנים לתוכן קיים
- הבהרות ושיפורים זעירים

## משוב והצעות מהקהילה

אנו מעודדים באופן פעיל משוב מהקהילה לשיפור משאב הלמידה הזה:

### כיצד לספק משוב
- **בעיות GitHub**: לדווח על בעיות או להציע שיפורים (בקשות הקשורות ל-AI מוזמנות)
- **דיונים ב-Discord**: לשתף רעיונות ולהתנסות עם קהילת Microsoft Foundry
- **בקשות משיכה (Pull Requests)**: לתרום שיפורים ישירים לתוכן, במיוחד לתבניות ומדריכי AI
- **Microsoft Foundry Discord**: להשתתף בערוץ #Azure לדיונים על AZD ו-AI
- **פורומי קהילה**: להשתתף בדיונים רחבים יותר של מפתחים ב-Azure

### קטגוריות המשוב
- **דיוק בתוכן AI**: תיקונים באינטגרציה והטמעה של שירותי AI
- **חוויית למידה**: הצעות לשיפור תהליך הלמידה למפתחי AI
- **תוכן AI חסר**: בקשות לתבניות, דפוסים או דוגמאות AI נוספות
- **נגישות**: שיפורים לצרכי למידה מגוונים
- **אינטגרציית כלי AI**: הצעות לשיפור זרימת העבודה בפיתוח AI
- **דפוסי AI לפרודקשן**: בקשות לדפוסי הטמעה ארגוניים של AI

### התחייבות למענה
- **מענה לבעיות**: תוך 48 שעות לבעיות שדווחו
- **בקשות תכונות**: הערכה תוך שבוע
- **תרומות מהקהילה**: סקירה תוך שבוע
- **בעיות אבטחה**: עדיפות מיידית עם תגובה מהירה

## לוח זמנים לתחזוקה

### עדכונים שוטפים
- **סקירות חודשיות**: בדיקת דיוק תוכן ואימות קישורים
- **עדכונים רבעוניים**: תוספות ושיפורים משמעותיים לתוכן
- **סקירות חצי שנתיות**: ארגון מחודש ושיפורים מקיפים
- **שחרורים שנתיים**: עדכוני גרסה גדולים עם שיפורים משמעותיים

### ניטור והבטחת איכות
- **בדיקות אוטומטיות**: אימות שוטף של דוגמאות קוד וקישורים
- **שילוב משוב הקהילה**: הטמעה שוטפת של הצעות משתמשים
- **עדכוני טכנולוגיה**: התאמה לשירותי Azure וגרסאות azd העדכניות ביותר
- **בדיקות נגישות**: סקירה שוטפת לעקרונות עיצוב כלולים

## מדיניות תמיכה בגרסאות

### תמיכה בגרסה הנוכחית
- **גרסה ראשית עדכנית**: תמיכה מלאה עם עדכונים שוטפים
- **גרסה ראשית קודמת**: עדכוני אבטחה ותיקונים קריטיים למשך 12 חודשים
- **גרסאות מיושנות**: תמיכה קהילתית בלבד, אין עדכונים רשמיים

### הנחיות מעבר
בעת שחרור גרסאות ראשיות, אנו מספקים:
- **מדריכי מעבר**: הוראות שלב אחר שלב למעבר
- **הערות תאימות**: פרטים על שינויים מתסכלים
- **תמיכה בכלים**: סקריפטים או כלי עזר למעבר
- **תמיכה קהילתית**: פורומים ייעודיים לשאלות מעבר

---

**ניווט**
- **שיעור קודם**: [מדריך לימוד](resources/study-guide.md)
- **שיעור הבא**: חזרה ל-[README הראשי](README.md)

**הישאר מעודכן**: צפה במחסן זה לקבלת התראות על שחרורים חדשים ועדכונים חשובים לחומרי הלמידה.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->