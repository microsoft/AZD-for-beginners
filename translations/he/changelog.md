# יומן שינויים - AZD למתחילים

## מבוא

יומן שינויים זה מתעד את כל השינויים, העדכונים, וההשתפרויות הבולטים במאגר AZD למתחילים. אנו עוקבים אחר עקרונות גרסת הסמנטית ומתחזקים יומן זה כדי לעזור למשתמשים להבין מה השתנה בין הגרסאות.

## יעדי למידה

תוך כדי סקירת יומן השינויים הזה, תוכלו:
- להישאר מעודכנים לגבי תכונות חדשות והוספות תוכן
- להבין שיפורים שנעשו בתיעוד הקיים
- לעקוב אחרי תיקוני באגים ותיקונים להבטחת דיוק
- לעקוב אחרי ההתפתחות של חומרי הלימוד לאורך הזמן

## תוצרי למידה

לאחר סקירת פרטי יומן השינויים, תוכלו:
- לזהות תוכן ומשאבים חדשים זמינים ללמידה
- להבין אילו חלקים עודכנו או שופרו
- לתכנן את מסלול הלמידה שלכם על פי החומרים העדכניים ביותר
- לתרום משוב והצעות לשיפורים עתידיים

## היסטוריית גרסאות

### [v3.23.0] - 2026-07-13

#### רענון AZD 1.27.1: עדכון גרסה עדכנית
**גרסה זו מאמתת מחדש את הקורס כנגד `azd` `1.27.1` (יולי 2026, הגרסה היציבה האחרונה) ואת תוסף סוכן ה-AI התצוגתי הנוכחי `azure.ai.agents` `1.0.0-beta.5`, מעדכנת כל באנר "מאומת נגד" לאחר גרסאות 1.26.0, 1.27.0, ו-1.27.1.**

#### שונה
- **✅ בסיס האימות עודכן** מ-`azd 1.25.6` (יוני 2026) ל-`azd 1.27.1` (יולי 2026) בכל קבצי README הראשיים, בכל פרקי הקורס, בשיעור dev-container בפרק 1 (כולל דוגמאות גרסאות נעולות), בשיעור תבניות מותאמות בפרק 4, בשיעור מרובי סוכנים בפרק 5, ובמסמכי הסדנה
- **🤖 בסיס פרק 2 רוענן** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.27.1` ב-`agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, ו-`microsoft-foundry-integration.md`; תאריכי הערות האימות עודכנו ל-2026-07-13
- **🧩 תוסף סוכן AI שודרג** מ-`azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` לגרסת `1.0.0-beta.5` הנוכחית ב-README של פרק 2 וב-`agents.md`
- **🧪 דוגמת אימות סדנה** (`azd version` output) עודכנה ל-`1.27.1`

#### הערות על גרסאות azd רלוונטיות (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** תמיכה ב-Go עבור Azure Functions ב-Flex Consumption, `azd config sub-filter` לסינוני מנויים לפרטנר, חבילות תוספים עצמאיות (`azd x pack --bundle`), ו-`azd tool install azure-skills`
- **1.27.0 (2026-06-30):** מיזוג פרויקטים/סוכני Azure AI Foundry ישירות ב-`azure.yaml` (הפעלה ללא Bicep/Terraform), תמיכה בפריסת מכולות ל-App Service (`host: appservice` + `language: docker`), `-s/--source` ישיר לפקודות `azd extension`, ו-`azd tool uninstall`
- **1.27.1 (2026-07-09):** דגל `--no-dependencies` לפקודת `azd extension install`, דגמים מנותקים מהקטלוג/תזכורות כברירת מחדל, ותיקוני באגים שונים

#### קבצים עודכנו
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

#### מילוי פער למתחילים #2: כתיבת תבניות, דיב-קונטיינרים, Pulumi, Azure DevOps, Service Principals ועוד
**גרסה זו סוגרת את הפערים הבינוניים שנותרו שזוהו בניתוח azd-coverage: כיצד לכתוב ולפרסם תבנית משלכם, סביבות dev-container/Codespaces רב-פעמיות, ספק התשתית Pulumi, סיור CI/CD ב-Azure DevOps, אימות service-principal, הנחיות לבחירת מארח (AKS/Spring Apps), הסברים על `azd restore`/`azd package`, טיפול בשגיאות hook, ושיטות עבודה בצוות/סביבה משותפת.**

#### נוסף
- **🧱 שיעור חדש בפרק 4** `docs/chapter-04-infrastructure/custom-templates.md` — כתיבת תבנית azd משלכם: מבנה נדרש (`azure.yaml`, `infra/`, `src/`), שדה `metadata.template`, פרמטריזציה של התשתית עם אסימון משאב `uniqueString()` ותג `azd-env-name`, בדיקות מקומיות עם `azd init --template <local-path>`, פרסום ל-GitHub, ושליחה לגלריית Awesome AZD
- **📦 שיעור חדש בפרק 1** `docs/chapter-01-foundation/dev-containers.md` — סביבות azd רב-פעמיות עם Dev Containers ו-GitHub Codespaces: קובץ `.devcontainer/devcontainer.json` מינימלי המשתמש בתכונה הרשמית `ghcr.io/azure/azure-dev/azd`, תכונות שפתיות, `docker-in-docker` למארחי מכולות, ו-`azd auth login --use-device-code` להתחברות מרחוק
- **🧩 Pulumi עם azd** בפרק `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, מבנה תיקיית Pulumi, מחסניות שמוקשרות לסביבות azd, צרכי יצוא ותיוג, ואותו תהליך עבודה זהה ל-`azd up` / `azd down`
- **🎯 הנחיות לבחירת מארח** ב-`docs/chapter-04-infrastructure/provisioning.md` — השוואה ידידותית למתחילים בין `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, ו-`springapp`, עם הנחיות מתי לבחור ב-AKS או ב-Azure Spring Apps
- **🛠️ סיור CI/CD ב-Azure DevOps** ב-`docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, חיבור שירות עם federation זהות (OIDC), הקובץ שנוצר `azure-dev.yml`, והגדרת קבוצות משתנים
- **🔑 Service Principals (תבנית 4)** נוסף ל-`docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` ללא אינטראקציה עם סוד לקוח מול אישורי federation/OIDC, מתי להשתמש, ואחסון מידע בטוח
- **🪝 טיפול בשגיאות hook** בקטע ב-`docs/chapter-04-infrastructure/deployment-guide.md` — קודי יציאה ו-`set -e`, `continueOnError`, בדיקות hooks בנפרד עם `azd hooks run`, סביבות הפעלה ספציפיות למערכת הפעלה, ו-`--debug`
- **👥 צוות / סביבות משותפות** ב-`docs/chapter-03-configuration/configuration.md` — מה נמצא ב-`.azure/`, מה יש להתעלם מגיט, סביבות למפתחים, `azd env list`/`select`, ומתן ערכי סביבה ב-CI/CD
- **🧰 הסברים על `azd restore` ו-`azd package` מורחבים** ב-`resources/cheat-sheet.md` — שיחזור תלותיות ויצירת ארטיפקט לפריסה ללא פריסה ממשית

#### שונה
- **🧭 טבלת שיעורי פרק 4** עודכנה לכלול את שיעור "כתיבת תבנית משלכם" החדש (שיעור 3)
- **🧭 טבלת שיעורי פרק 1** עודכנה לכלול את שיעור "Dev Containers & Codespaces" החדש (שיעור 5); כותרות ניווט מקושרות בין `bring-your-own-app.md` ל-`dev-containers.md`

### [v3.21.0] - 2026-06-16

#### מילוי פער למתחילים: שיעור מעשי על מרובי סוכנים, "הבא את האפליקציה שלך", Terraform וסיור CI/CD
**גרסה זו סוגרת את הפערים הגדולים למדריך המתחילים המלא על ידי הוספת שני שיעורים מעשיים חדשים (סיור פרוס מרובי סוכנים והוספת azd לאפליקציה קיימת), מבוא ידידותי ל-hooks, קטע Terraform עם azd, סיור צעד אחר צעד של pipeline ב-GitHub Actions, הסבר לתוספות התצוגה החדשות, ורשימת בדיקה מפורטת לאימות פריסה.**

#### נוסף
- **🤝 שיעור חדש בפרק 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — סיור שני-סוכנים פרוס וידני מלא שימוש (מתזמר + מומחים) עם תבנית אמיתית (`contoso-creative-writer`), כולל מתי להשתמש במרובי סוכנים, תהליך `azd up`, הבנת המשאבים הפרוסים, איתור חוצה-סוכנים, התאמה אישית וניקוי
- **📦 שיעור חדש בפרק 1** `docs/chapter-01-foundation/bring-your-own-app.md` — איך להוסיף azd לפרויקט קיים עם `azd init` ("השתמש בקוד בתיקייה הנוכחית"), הבנת `azure.yaml` ו-`infra/`, `azd infra generate`, זיהוי מארח, ופריסה עם `azd up`
- **🌐 קטע Terraform עם azd** נוסף ל-`docs/chapter-04-infrastructure/provisioning.md` — הגדרת `infra.provider: terraform`, מבנה תיקיית `.tf`, יצוא נדרש `AZURE_*` ותיוג `azd-env-name`, ותהליך עבודה זהה ל-`azd up` / `azd down` (סוגר את הפער בו טען הקורס לתמיכה ב-Terraform אך הוצג רק Bicep)
- **⚙️ סיור צעד אחר צעד ב-GitHub Actions** ב-`docs/chapter-08-production/production-ai-practices.md` — מן מאגר GitHub לפריסות אוטומטיות: `azd pipeline config`, אישורי federation OIDC (ללא סודות מאוחסנים), הקובץ שנוצר `azure-dev.yml`, ומדריך להבדלים בין סודות למשתנים
- **🪝 מבוא למתחילים "חדש ל-hooks?"** ב-`docs/chapter-04-infrastructure/deployment-guide.md` — מהו hook, טבלת שלבי hook, hook ראשון מינימלי, והרצת hooks ידנית עם `azd hooks run`
- **✅ רשימת בדיקת "אמת את הפריסה שלך"** נוספה לשלב 5 ב-`docs/chapter-01-foundation/first-project.md` — בדיקת עשן, בדיקת נקודת קצה בריאות, וקריטריוני הצלחה מפורשים
- **🧩 הסבר לתוספות התצוגה החדשות** `azure.ai.skills` ו-`azure.ai.connections` (מה הן ומתי להשתמש בהן) ב-`docs/chapter-08-production/production-ai-practices.md`

#### שונה
- **🧭 טבלת שיעורי פרק 5** תוקנה: `multi-agent-basics.md` הוא כעת שיעור 1 (השיעור היחיד המלא בידני), עם תיוג אמיתי ששיעור 2 נמצא בפרק 6 ותרחיש Retail הוא תבנית ארכיטקטורה, לא תבנית בפקודה אחת
- **🧭 טבלת שיעורי פרק 1** כוללת כעת את שיעור "הבא את האפליקציה שלך" החדש (שיעור 4)
- **🔗 כותרות ניווט** עודכנו: `first-project.md` מקשר כעת קדימה ל-`bring-your-own-app.md`

#### תוקן
- **🧱 סגור פער Terraform שהוכרז אך נעדר** — הקורס קודם לכן התייחס לתמיכה ב-Terraform ללא הצגה מעשית
- **🔀 תוקנו קישורים בין-פרקיים מטעים בפרק 5** שהרמזו על מימוש מרובי סוכנים מלא כשבפועל הייתה רק תבנית ארכיטקטורה

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

#### רענון AZD 1.25.6, פקודות מחזור חיים מלא לסוכן & מיתוג Aspire מחדש

**גרסה זו מאמתת מחדש את הקורס מול `azd` `1.25.6` (יוני 2026) ועם התוסף `azure.ai.agents` `0.1.40-preview`, מרחיבה את ההנחיות של AI מ"סקלדת סוכן" ועד למחזור החיים המלא של הסוכן (בדיקה → הערכה → אופטימיזציה → בדיקה → מחיקה), מציגה את התוספים החדשים `azure.ai.skills` ו-`azure.ai.connections`, ומציינת את מיתוג המוצר מחדש מ-".NET Aspire" ל-"Aspire".**

#### נוסף
- **🔁 כיסוי מחזור חיים מלא של סוכן** עבור מתחילים ומומחי AI בכל התיעוד:
  - `docs/chapter-01-foundation/azd-basics.md` — טבלת מחזור חיים (סקלדת → בדיקה → מדידה → שיפור → בדיקה → ניקוי) נוספה לסעיף התוספים ופקודות ה-AI
  - `docs/chapter-08-production/production-ai-practices.md` — סעיף חדש "ניהול מחזור חיים של סוכן" הכולל `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`
  - `resources/cheat-sheet.md` — הורחבו פקודות AI Agent עם `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`
- **🧩 תוספי תצוגה מוקדמת חדשים** מתועדים: `azure.ai.skills` (כישורי סוכן לשימוש חוזר) ו-`azure.ai.connections` (קישורים ל-Foundry) נוספו לטבלת התוספים ולדף הטיפים
- **⏱️ הנחיות זמנים לתגובה** — דוגמאות ל-`azd ai agent invoke` מציינות כעת שהן מדפיסות את השהיית התגובה הכוללת ואת זמן לנתיב הנתונים הראשון
- **📌 באנר גרסה** בקובץ README הראשי המפנה את הלומדים ל-`azd version` ו-`azd upgrade`

#### שונה
- **✅ קו בסיס לאימות עודכן** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.25.6` (יוני 2026) בכל קבצי ה-README של הפרקים ותיעוד הסדנא
- **🤖 עדכון הערת התוסף בפרק 2** מ-`azure.ai.agents` `0.1.18-preview` ל-`0.1.40-preview`
- **🧪 עדכון דוגמת אימות בסדנא** (פלט `azd version`) ל-`1.25.6`
- **🧭 רענון סעיף README "מה חדש ב-azd היום"** להדגשת מחזור חיים מלא של הסוכן, תוספי AI חדשים ותיקוני איכות חיים אחרונים (`azd init` איידמפוטנטיות, ניקוי אסימון פג תוקף ב-`azd auth login`, הודעת הרצה ראשונה ב-`azd tool`)
- **📖 בפרק 2 קובץ agents.md (אפשרות 4)** מפנה עתה את הלומדים לפקודות מחזור חיים אחרי פריסה במקום לעצור ב-`azd up`

#### תוקן
- **🏷️ מיתוג מוצר** — נוספה הערת מיתוג מחדש ל-Aspire (".NET Aspire" הוא כעת פשוט "Aspire"); התמיכה של azd ב-Aspire לא השתנתה
- **🔎 אימות שחרור חי** אושר מול ערוץ השחרור של Azure Developer CLI: גירסת CLI יציבה `1.25.6` (2026-06-12) ו-`azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### הבהרת התחלת משתמש, אימות הגדרה וניקוי פקודות AZD סופי
**גרסה זו ממשיכה את סבב האימות של AZD 1.23 עם מסמך ממוקד למתחילים: היא מבהירה הנחיות אימות ראשוניות ב-AZD, מוסיפה סקריפטים לאימות הגדרה מקומית, מאמתת פקודות מפתח מול ה-AZD CLI החי, ומסירה את הפניות האחרונות לפקודות מקור באנגלית מחוץ ל-changelog.**

#### נוספו
- **🧪 סקריפטים לאימות הגדרת מתחילים** עם `validate-setup.ps1` ו-`validate-setup.sh` כדי שהלומדים יאמתו את הכלים הנדרשים לפני תחילת פרק 1
- **✅ שלבי אימות ההגדרה מראש** ב-README הראשי וב-README פרק 1 כדי לתפוס דרישות חסרות לפני `azd up`

#### שונו
- **🔐 הנחיות אימות למתחילים** מטפלות כעת ב-`azd auth login` כנתיב הראשי לזרמי עבודה ב-AZD, עם זימון אופציונלי ל-`az login` אלא אם משתמשים בפקודות Azure CLI ישירות
- **📚 זרימת התחלה בפרק 1** מפנה עתה את הלומדים לאמת את ההגדרה המקומית לפני התקנה, אימות ושלבי פריסה ראשונים
- **🛠️ הודעות מאמת** מפרידות כעת בבירור דרישות מחסומים מאזהרות אופציונליות של Azure CLI למסלול המתחילים רק עם AZD
- **📖 קונפיגורציה, פתרון תקלות ותיעוד דוגמאות** מבחינים כעת בין אימות נדרש של AZD לבין התחברות אופציונלית ל-Azure CLI כאשר לשניהם הוצגו בעבר ללא הקשר

#### תוקן
- **📋 הפניות פקודות מקור באנגלית נשארות** עודכנו לצורות AZD הנוכחיות, כולל `azd config show` בדף הטיפים ו-`azd monitor --overview` בפלטפורמות המיועדות להדגמת תצוגה ב-Azure Portal
- **🧭 טענות למתחילים בפרק 1** המועברות לטון מרוכך כדי למנוע הבטחות מיותרות לאפס שגיאות או התגלגלות על כל התבניות ומשאבי Azure
- **🔎 אימות CLI חי** אושר תמיכה נוכחית בפקודות `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, ו-`azd down --force --purge`

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

#### אימות AZD 1.23.12, הרחבת סביבת סדנא ורענון מודל AI
**גרסה זו מבצעת סבב אימות תיעוד מול `azd` `1.23.12`, מעדכנת דוגמאות פקודות ישנות של AZD, מרעננת את הנחיות מודל ה-AI לברירות מחדל נוכחיות, ומרחיבה את ההוראות בסדנא מעבר ל-GitHub Codespaces גם לתמיכה בקונטיינרים לפיתוח והעתקים מקומיים.**

#### נוסף
- **✅ הערות אימות בפרקים המרכזיים ותיעוד הסדנא** כדי להבהיר את קו הבסיס של AZD שנבדק עבור לומדים המשתמשים בבניינים חדשים או ישנים של CLI
- **⏱️ הנחיות למועד סיום פריסה** עבור פריסות אפליקציות AI ארוכות זמן עם `azd deploy --timeout 1800`
- **🔎 שלבי בדיקת תוסף** עם `azd extension show azure.ai.agents` בתיעוד זרם העבודה של AI
- **🌐 הנחיות סביבת סדנא רחבות יותר** המכסות GitHub Codespaces, קונטיינרים לפיתוח, והעתקים מקומיים עם MkDocs

#### שונה
- **📚קריאות README מבוא לפרקים** מציינות כעת בעקביות אימות מול `azd 1.23.12` בפרקים הבסיסיים, הקונפיגורציה, התשתית, ריבוי סוכנים, לפני פריסה, פתרון תקלות ופרודקשן
- **🛠️ הפניות פקודות AZD** עודכנו לצורות נוכחיות בכל התיעוד:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` או `azd env get-value(s)` בהתאם להקשר
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` כאשר הכוונה היא להציג סקירה ב-Application Insights
- **🧪 דוגמאות פריסה בתצוגה מוקדמת** מופשטות לשימוש הנתמך הנוכחי כמו `azd provision --preview` ו-`azd provision --preview -e production`
- **🧭 זרם סדנא** עודכן כך שהלומדים יוכלו להשלים את המעבדות בקודספייס, קונטיינר לפיתוח או העתק מקומי במקום להניח הרצה רק בקודספייס
- **🔐 הנחיות אימות** מעדיפות כעת את `azd auth login` לזרמי העבודה של AZD, עם `az login` כאופציונלי כאשר משתמשים ישירות בפקודות Azure CLI

#### תוקן
- **🪟 פקודות התקנת Windows** תוקנו לאיות מקרה נכון של חבילות `winget` במדריך ההתקנה
- **🐧 הנחיות התקנת לינוקס** תוקנו כדי להימנע מהוראות לא נתמכות למנהל החבילות הספציפי להפצה של `azd` והפנייה נכונה לנכסי שחרור כאשר מתאים
- **📦 דוגמאות למודל AI** רועננו מברירות ישנות כמו `gpt-35-turbo` ו-`text-embedding-ada-002` לדוגמאות נוכחיות כגון `gpt-4.1-mini`, `gpt-4.1`, ו-`text-embedding-3-large`
- **📋 קטעי פריסה ואבחון** תוקנו לשימוש בפקודות סביבה ומצב עדכניות בלוגים, סקריפטים ושלבי פתרון תקלות
- **⚙️ הנחיות GitHub Actions** עודכנו מ-`Azure/setup-azd@v1.0.0` ל-`Azure/setup-azd@v2`
- **🤖 הנחיות הסכמת MCP/Copilot** עודכנו מ-`azd mcp consent` ל-`azd copilot consent list`

#### שופר
- **🧠 הנחיות פרק AI** מסבירות עתה טוב יותר את ההתנהגות הרגישה לתצוגה מוקדמת ב-`azd ai`, כניסה לפי דייר, שימוש בתוספים נוכחיים והמלצות עדכניות לפריסת מודלים
- **🧪 הוראות הסדנא** משתמשות כעת בדוגמאות גירסה מציאותיות יותר ושפה ברורה יותר לאימות סביבת מעבדות מעשיות
- **📈 תיעוד פרודקשן ופתרון תקלות** מתואם כעת טוב יותר עם דוגמאות נוכחיות למעקב, מודל גיבוי, ודוגמאות לרמות עלות

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

### [v3.18.0] - 2026-03-16

#### פקודות AZD AI CLI, אימות תוכן והרחבת תבניות
**גרסה זו מוסיפה כיסוי של הפקודות `azd ai`, `azd extension`, ו-`azd mcp` בכל פרקי ה-AI, מתקנת קישורים שבורים וקוד מיושן ב-agents.md, מעדכנת את דף הטיפים, ומשדרגת את סעיף תבניות הדוגמה עם תיאורים מאומתים ותבניות Azure AI AZD חדשות.**

#### נוסף
- **🤖 כיסוי AZD AI CLI** ב-7 קבצים (בעבר רק בפרק 8):
  - `docs/chapter-01-foundation/azd-basics.md` — סעיף חדש "תוספים ופקודות AI" הכולל `azd extension`, `azd ai agent init`, ו-`azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — אפשרות 4: `azd ai agent init` עם טבלת השוואה (תבנית לעומת גישת מניפסט)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — תת-סעיפים "תוספי AZD ל-Foundry" ו-"פריסת סוכן ראשונה"

  - `docs/chapter-05-multi-agent/README.md` — התחלה מהירה מציגה כעת גם מסלולי פריסה מבוססי תבנית ומניפסט
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — חלק הפריסה כולל כעת את אפשרות `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — תת-סעיף "פקודות הרחבת AZD AI לאבחון"
  - `resources/cheat-sheet.md` — חלק חדש "פקודות AI והרחבות" עם `azd extension`, `azd ai agent init`, `azd mcp`, ו-`azd infra generate`
- **📦 תבניות דוגמה חדשות ל-AZD AI** ב-`microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — שיחת RAG ב-.NET עם Blazor WebAssembly, Semantic Kernel, ותמיכה בשיחת קול
  - **azure-search-openai-demo-java** — שיחת RAG בג'אווה באמצעות Langchain4J עם אפשרויות פריסה ACA/AKS
  - **contoso-creative-writer** — אפליקציית כתיבה יצירתית עם סוכנים מרובים המשתמשת בשירות Azure AI Agent, Bing Grounding, ו-Prompty
  - **serverless-chat-langchainjs** — RAG ללא שרתים המשתמש ב-Azure Functions + LangChain.js + Cosmos DB עם תמיכה בפיתוח מקומי של Ollama
  - **chat-with-your-data-solution-accelerator** — מאיץ RAG ארגוני עם פורטל ניהול, אינטגרציה עם Teams, ואפשרויות PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — אפליקציה לדוגמה לתזמון MCP רב-סוכני עם שרתים ב-.NET, Python, Java, ו-TypeScript
  - **azd-ai-starter** — תבנית התחלתית מינימלית לתשתית Azure AI ב-Bicep
  - **🔗 קישור לגלריית AZD AI נהדרת** — הפניה ל[גלריית awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (מעל 80 תבניות)

#### תוקן
- **🔗 ניווט agents.md**: קישורים קודם/הבא תואמים כעת את סדר השיעורים ב-README פרק 2 (Microsoft Foundry Integration → סוכנים → פריסת דגם AI)
- **🔗 קישורים שבורים ב-agents.md**: `production-ai-practices.md` תוקן ל-`../chapter-08-production/production-ai-practices.md` (3 מקרים)
- **📦 קוד מיושן ב-agents.md**: הוחלף `opencensus` ב-`azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API לא חוקי ב-agents.md**: `max_tokens` הועבר מ-`create_agent()` ל-`create_run()` כ-`max_completion_tokens`
- **🔢 ספירת טוקנים ב-agents.md**: הוחלף האומדן הגס `len//4` ב-`tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: תוקנו שירותים מ"חיפוש קוגניטיבי + App Service" ל"חיפוש Azure AI + Azure Container Apps" (מארח ברירת מחדל שונה לאוקטובר 2024)
- **contoso-chat**: תיאור מעודכן עם הפניה ל-Azure AI Foundry + Prompty, התואם את הכותרת וערמת הטכנולוגיה האמיתית של הריפו

#### הוסר
- **ai-document-processing**: הוסר הפניה לתבנית לא פונקציונלית (ריפו שאינו זמין לציבור כתבנית AZD)

#### שופר
- **📝 תרגילי agents.md**: תרגיל 1 מציג כעת פלט צפוי ושלב `azd monitor`; תרגיל 2 כולל את קוד הרישום המלא של `FunctionTool`; תרגיל 3 מחליף הנחיות מעורפלות בפקודות קונקרטיות `prepdocs.py`
- **📚 משאבי agents.md**: קישורי תיעוד מעודכנים למסמכי Azure AI Agent Service הנוכחיים והתחלת מהירה
- **📋 טבלת השלבים הבאים ב-agents.md**: נוספה קישור למעבדת סדנת AI לכיסוי מלא של הפרק

#### קבצים מעודכנים
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
**גרסה זו משפרת את הניווט ב-README.md עם פורמט טבלה משודרג.**

#### שונה
- **טבלת מפת הקורס**: הועשרה בקישורים ישירים לשיעורים, הערכות זמן ודרגות מורכבות
- **ניקוי תיקיות**: הוסרו תיקיות ישנות חוזרות מיותר (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **אימות קישורים**: כל 21+ הקישורים הפנימיים בטבלת מפת הקורס אומתו

### [v3.16.0] - 2026-02-05

#### עדכוני שמות מוצר
**גרסה זו מעדכנת הפניות למותג Microsoft הנוכחי.**

#### שונה
- **Microsoft Foundry → Microsoft Foundry**: כל ההפניות עודכנו בקבצים שאינם תרגום
- **Azure AI Agent Service → Foundry Agents**: שם השירות עודכן לשקף את המיתוג הנוכחי

#### קבצים מעודכנים
- `README.md` - דף הנחיתה הראשי של הקורס
- `changelog.md` - היסטוריית גרסאות
- `course-outline.md` - מבנה הקורס
- `docs/chapter-02-ai-development/agents.md` - מדריך סוכני AI
- `examples/README.md` - תיעוד דוגמאות
- `workshop/README.md` - דף הנחיתה של הסדנה
- `workshop/docs/index.md` - אינדקס הסדנה
- `workshop/docs/instructions/*.md` - כל קבצי ההוראות של הסדנה

---

### [v3.15.0] - 2026-02-05

#### ארגון מחדש משמעותי של המאגר: תיקיות מבוססות פרקים
**גרסה זו מארגנת מחדש את התיעוד לתיקיות ייעודיות לפי פרקים לשם ניווט ברור יותר.**

#### שינוי שמות תיקיות
תיקיות ישנות הוחלפו בתיקיות ממוספרות לפי פרקים:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- נוספה חדשה: `docs/chapter-05-multi-agent/`

#### העברות קבצים
| קובץ | מ- | ל- |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### נוסף
- **📚 קבצי README של פרקים**: נוצר README.md בכל תיקיית פרק עם:
  - מטרות הלמידה ומשך הזמן
  - טבלת שיעורים עם תיאורים
  - פקודות התחלה מהירה
  - ניווט לפרקים אחרים

#### שונה
- **🔗 עדכון כל הקישורים הפנימיים**: עודכנו 78+ נתיבים בכל קבצי התיעוד
- **🗺️ קובץ README.md ראשי**: עודכנה מפת הקורס עם מבנה פרקים חדש
- **📝 examples/README.md**: עודכנו הפניות לצלמיות הפרקים

#### הוסר
- מבנה תיקיות ישן (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ארגון מחדש של המאגר: ניווט פרקים
**גרסה זו הוסיפה קבצי README לניווט בין הפרקים (הוחלפה על ידי v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### מדריך סוכני AI חדש
**גרסה זו מוסיפה מדריך מקיף לפריסת סוכני AI עם Azure Developer CLI.**

#### נוסף
- **🤖 docs/microsoft-foundry/agents.md**: מדריך מפורט הכולל:
  - מה הם סוכני AI וכיצד הם שונים מצ'אטבוטים
  - שלושה תבניות התחלה מהירה לסוכנים (Foundry Agents, Prompty, RAG)
  - דפוסי ארכיטקטורת סוכנים (סוכן יחיד, RAG, רב-סוכני)
  - תצורה והתאמה אישית של כלים
  - ניטור ומעקב אחרי מדדים
  - שיקולי עלות ואופטימיזציה
  - תרחישי פתרון בעיות נפוצים
  - שלושה תרגילים מעשיים עם קריטריוני הצלחה

#### מבנה תוכן
- **הקדמה**: מושגי סוכן למתחילים
- **התחלה מהירה**: פריסת סוכנים עם `azd init --template get-started-with-ai-agents`
- **דפוסי ארכיטקטורה**: דיאגרמות ויזואליות של דפוסי סוכנים
- **תצורה**: הגדרת כלים ומשתני סביבה
- **ניטור**: אינטגרציה עם Application Insights
- **תרגילים**: לימוד מעשי מתקדם (20-45 דקות כל אחד)

---

### [v3.12.0] - 2026-02-05

#### עדכון סביבת DevContainer
**גרסה זו מעדכנת את תצורת מכולת הפיתוח עם כלים מודרניים וערכי ברירת מחדל טובים יותר לחוויית הלמידה של AZD.**

#### שונה
- **🐳 תמונת בסיס**: עודכן מ-`python:3.12-bullseye` ל-`python:3.12-bookworm` (דביאן יציב עדכני)
- **📛 שם המכולה**: שונה מ"Python 3" ל"AZD למתחילים" לשם בהירות

#### נוסף
- **🔧 תכונות חדשות למכולת פיתוח**:
  - `azure-cli` עם תמיכה ב-Bicep מופעלת
  - `node:20` (גרסת LTS לתבניות AZD)
  - `github-cli` לניהול תבניות
  - `docker-in-docker` לפריסות אפליקציות מכולה

- **🔌 העברת פורטים**: פורטים מראש מוגדרים לפיתוח נפוץ:
  - 8000 (תצוגה מקדימה ב-MkDocs)
  - 3000 (אפליקציות רשת)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 תוספות חדשות ל-VS Code**:
  - `ms-python.vscode-pylance` - אינטיליסנס לפייתון משודרג
  - `ms-azuretools.vscode-azurefunctions` - תמיכה ב-Azure Functions
  - `ms-azuretools.vscode-docker` - תמיכה בדוקר
  - `ms-azuretools.vscode-bicep` - תמיכה בשפת Bicep
  - `ms-azure-devtools.azure-resource-groups` - ניהול משאבי Azure
  - `yzhang.markdown-all-in-one` - עריכת Markdown
  - `DavidAnson.vscode-markdownlint` - בדיקת ניקוד Markdown
  - `bierner.markdown-mermaid` - תמיכה בדיאגרמות Mermaid
  - `redhat.vscode-yaml` - תמיכת YAML (עבור azure.yaml)
  - `eamodio.gitlens` - ויזואליזציה של Git
  - `mhutchie.git-graph` - היסטוריית Git

- **⚙️ הגדרות VS Code**: נוספו הגדרות ברירת מחדל למפרש פייתון, עיצוב בעת שמירה, והסרת רווחים מיותרים

- **📦 דרישות מעודכנות בקובץ requirements-dev.txt**:
  - נוספה תוספת מיני ל-MkDocs
  - נוספה pre-commit לאיכות קוד
  - נוספו חבילות SDK של Azure (azure-identity, azure-mgmt-resource)

#### תוקן
- **פקודת התהליך לאחר יצירה**: כעת מאמתת את התקנת AZD ו-Azure CLI בהפעלת המכולה

---

### [v3.11.0] - 2026-02-05

#### שדרוג README למתחילים
**גרסה זו משפרת משמעותית את README.md להיות נגיש יותר למתחילים ומוסיפה משאבים חיוניים למפתחים ב-AI.**

#### נוסף
- **🆚 השוואת Azure CLI ו-AZD**: הסבר ברור מתי להשתמש בכל כלי עם דוגמאות מעשיות
- **🌟 קישורי AZD מעולים**: קישורים ישירים לגלריית תבניות קהילתית ומשאבי תרומה:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - מעל 200 תבניות מוכנות לפריסה
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - תרומה מקהילתית
- **🎯 מדריך התחלה מהירה**: סעיף התחלה בפשטות בשלושה שלבים (התקנה → התחברות → פריסה)
- **📊 טבלת ניווט מבוססת ניסיון**: הנחיות ברורות איפה להתחיל בהתבסס על ניסיון המפתח

#### שונה
- **מבנה README**: מארגן מחדש להדרכה מתקדמת - מידע מפתח ראשון
- **סעיף הקדמה**: נוסח מחדש להסבר "הקסם של `azd up`" למתחילים מוחלטים
- **הסרת תוכן כפול**: הוסר סעיף פתרון בעיות כפול

- **פקודות פתרון בעיות**: תוקן הפנייה ב- `azd logs` לשימוש ב- `azd monitor --logs` תקין

#### תוקן

- **🔐 פקודות אימות**: נוספו `azd auth login` ו-`azd auth logout` ל-cheat-sheet.md
- **הסרת הפניות לפקודות שגויות**: הוסר `azd logs` שנותר מקטע פתרון הבעיות ב-README

#### הערות
- **תחום**: שינויים הוחלו על README.md הראשי ו-resources/cheat-sheet.md
- **קהל יעד**: שיפורים מכוונים במיוחד למפתחים חדשים ל-AZD

---

### [v3.10.0] - 2026-02-05

#### עדכון דיוק פקודות Azure Developer CLI
**גרסה זו מתקנת פקודות AZD שלא קיימות במסמכים, ומבטיחה שכל דוגמאות הקוד משתמשות בתחביר חוקי של Azure Developer CLI.**

#### תוקן
- **🔧 הסרת פקודות AZD שלא קיימות**: ביקורת מקיפה ותיקון פקודות לא תקינות:
  - `azd logs` (לא קיים) → הוחלף ב-`azd monitor --logs` או חלופות של Azure CLI
  - תת-פקודות `azd service` (לא קיימות) → הוחלפו ב-`azd show` ו-Azure CLI
  - `azd infra import/export/validate` (לא קיימות) → הוסרו או הוחלפו באלטרנטיבות תקינות
  - דגלים `azd deploy --rollback/--incremental/--parallel/--detect-changes` (לא קיימים) → הוסרו
  - דגלים `azd provision --what-if/--rollback` (לא קיימים) → עודכנו לשימוש ב-`--preview`
  - `azd config validate` (לא קיים) → הוחלף ב-`azd config list`
  - `azd info`, `azd history`, `azd metrics` (לא קיימים) → הוסרו

- **📚 קבצים עודכנו עם תיקוני פקודות**:
  - `resources/cheat-sheet.md`: שדרוג משמעותי של הפניות לפקודות
  - `docs/deployment/deployment-guide.md`: תוקנו אסטרטגיות סיבוב לאחור ופריסה
  - `docs/troubleshooting/debugging.md`: תוקנו קטעי ניתוח לוגים
  - `docs/troubleshooting/common-issues.md`: פקודות פתרון בעיות עודכנו
  - `docs/troubleshooting/ai-troubleshooting.md`: תוקנה קטע דיבוג AZD
  - `docs/getting-started/azd-basics.md`: תוקנו פקודות ניטור
  - `docs/getting-started/first-project.md`: עדכון דוגמאות ניטור ודיבוג
  - `docs/getting-started/installation.md`: תוקנו דוגמאות עזרה וגרסה
  - `docs/pre-deployment/application-insights.md`: תיקון פקודות צפייה בפקודות יומן
  - `docs/pre-deployment/coordination-patterns.md`: תוקנו פקודות דיבוג סוכן

- **📝 עדכון הפניה לגרסה**: 
  - `docs/getting-started/installation.md`: שונה גרסה קבועה `1.5.0` לגרסה גנרית `1.x.x` עם קישור ל-releases

#### שונה
- **אסטרטגיות סיבוב לאחור**: תיעוד עודכן לשימוש בסיבוב לאחור מבוסס Git (ל-AZD אין סיבוב לאחור מובנה)
- **צפייה בלוגים**: הוחלפו אזכורים ל-`azd logs` ב-`azd monitor --logs`, `azd monitor --live` ופקודות Azure CLI
- **קטע ביצועים**: הוסרו דגלים לפריסה מקבילה/הדרגתית שלא קיימים, הוצעו חלופות תקפות

#### פרטים טכניים
- **פקודות AZD תקינות**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **דגלים תקינים ל-azd monitor**: `--live`, `--logs`, `--overview`
- **תכונות שהוסרו**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### הערות
- **אימות**: פקודות אומתו כנגד Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### השלמת סדנה ועדכון איכות התיעוד
**גרסה זו משלימה את מודולי הסדנה האינטראקטיביים, מתקנת את כל הקישורים השבורה בתיעוד ומשפרת את איכות התוכן למפתחי AI המשתמשים ב-Microsoft AZD.**

#### נוסף
- **📝 CONTRIBUTING.md**: מסמך קווים מנחים חדש לתרומה עם:
  - הוראות ברורות לדיווח בעיות והצעת שינויים
  - תקני תיעוד לתוכן חדש
  - קווי מובייל לדוגמאות קוד וקונבנציות הודעות התחייבות
  - מידע על השתתפות הקהילה

#### הושלם
- **🎯 מודול סדנה 7 (סיום)**: מודול מקיף ומושלם הכולל:
  - סיכום מקיף של הישגי הסדנה
  - מדור מושגים מרכזיים הכולל AZD, תבניות, ו-Microsoft Foundry
  - המלצות להמשך מסע הלמידה
  - תרגילי אתגר בסדנה עם דירוגי קושי
  - משובים מהקהילה וקישורי תמיכה

- **📚 מודול סדנה 3 (פירוק)**: יעד למידה מעודכן הכולל:
  - הנחיות להפעלת GitHub Copilot עם שרתי MCP
  - הבנת מבנה תיקיית תבניות AZD
  - דפוסי ארגון Infrastructure-as-code (Bicep)
  - הוראות מעבדת עבודה

- **🔧 מודול סדנה 6 (פירוק)**: הושלם עם:
  - מטרות ניקוי משאבים וניהול עלויות
  - שימוש ב-`azd down` לסילוק תשתית בטוחה
  - הנחיות לשחזור שירותי קוגניטיב שנמחקו באופן רך
  - הנחיות בחינה בונוס ל-GitHub Copilot ו-Azure Portal

#### תוקן
- **🔗 תיקוני קישורים שבורים**: תוקנו 15+ קישורים שבורים בתיעוד פנימי:
  - `docs/ai-foundry/ai-model-deployment.md`: תוקנו מסלולים ל-microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: תוקנו מסלולים ל-ai-model-deployment.md ו-production-ai-practices.md
  - `docs/getting-started/first-project.md`: הוחלף cicd-integration.md שלא קיים ב-deployment-guide.md
  - `examples/retail-scenario.md`: תוקנו מסלולים לשאלות נפוצות ומדריך פתרון בעיות
  - `examples/container-app/microservices/README.md`: תוקנו מסלולים לבית הקורס ומדריך הפריסה
  - `resources/faq.md` ו-`resources/glossary.md`: עודכנו הפניות לפרק AI
  - `course-outline.md`: תוקנו הפניות למדריך מרצה ולמעבדת סדנת AI

- **📅 כרזת מצב הסדנה**: עודכנה מ"בתהליך בנייה" למצב סדנה פעילה עם תאריך פברואר 2026

- **🔗 ניווט בסדנה**: תוקנו קישורי ניווט שבורים ב-README.md של הסדנה המצביעים לתיקיית lab-1-azd-basics שלא קיימת

#### שונה
- **הצגת הסדנה**: הוסר אזהרת "בתהליך בנייה", הסדנה כעת מוכנה לשימוש
- **עקביות ניווט**: וודא שכל מודולי הסדנה כוללים ניווט בין-מודול תקין
- **הפניות לנתיבי למידה**: עודכן הפרסום לחום microsoft-foundry נכון

#### אומת
- ✅ כל קבצי Markdown באנגלית כוללים קישורים פנימיים תקינים
- ✅ מודולי הסדנה 0-7 הושלמו עם יעדי למידה
- ✅ הניווט בין פרקים ומודולים פועל כראוי
- ✅ התוכן מתאים למפתחי AI המשתמשים ב-Microsoft AZD
- ✅ שפה ומבנה ידידותיים למתחילים נשמרים לאורך כל התוכן
- ✅ CONTRIBUTING.md מספק הנחיות ברורות לתורמים מהקהילה

#### יישום טכני
- **אימות קישורים**: סקריפט PowerShell אוטומטי אימת את כל הקישורים הפנימיים בקבצי md
- **סקירת תוכן**: ביקורת ידנית של השלמת הסדנה והתאמתה למתחילים
- **מערכת ניווט**: יישום דפוסי ניווט עקביים בין פרקים ומודולים

#### הערות
- **תחום**: שינויים הוחלו רק על תיעוד באנגלית
- **תרגומים**: תיקיות תרגום לא עודכנו בגרסה זו (תרגום אוטומטי יסונכרן מאוחר יותר)
- **משך הסדנה**: הסדנה המלאה מספקת עכשיו 3-4 שעות למידה מעשית

---

### [v3.8.0] - 2025-11-19

#### תיעוד מתקדם: ניטור, אבטחה ודפוסי תיאום סוכנים מרובים
**גרסה זו מוסיפה שיעורים מקיפים בדרגת A על שילוב Application Insights, דפוסי אימות ותיאום רב-סוכני לפריסות ייצור.**

#### נוסף
- **📊 שיעור שילוב Application Insights**: ב-`docs/pre-deployment/application-insights.md`:
  - פריסת AZD ממוקדת עם פרוביזיה אוטומטית
  - תבניות Bicep מלאות ל-Application Insights + Log Analytics
  - אפליקציות Python עובדות עם טלמטריה מותאמת אישית (מעל 1,200 שורות)
  - דפוסי ניטור AI/LLM (מעקב אסימוני עלויות דגמי Microsoft Foundry)
  - 6 דיאגרמות Mermaid (ארכיטקטורה, מעקב מבוזר, זרימת טלמטריה)
  - 3 תרגילים מעשיים (התראות, לוחות מחוונים, ניטור AI)
  - דוגמאות שאילתות Kusto ואסטרטגיות אופטימיזציה של עלויות
  - זרם מדדים חי ודיבוג בזמן אמת
  - 40-50 דקות למידה עם דפוסים מוכנים לייצור

- **🔐 שיעור דפוסי אימות ואבטחה**: ב-`docs/getting-started/authsecurity.md`:
  - 3 דפוסי אימות (מחרוזות חיבור, Key Vault, זהות מנוהלת)
  - תבניות תשתית Bicep מלאות לפריסות מאובטחות
  - קוד אפליקציית Node.js עם אינטגרציית Azure SDK
  - 3 תרגילים מלאים (הפעלת זהות מנוהלת, זהות מיוחדת למשתמש, סיבוב Key Vault)
  - שיטות אבטחה מומלצות ותצורות RBAC
  - מדריך פתרון בעיות וניתוח עלויות
  - דפוסי אימות ללא סיסמה מוכנים לייצור

- **🤖 שיעור דפוסי תיאום רב-סוכני**: ב-`docs/pre-deployment/coordination-patterns.md`:
  - 5 דפוסי תיאום (רצף, במקביל, היררכי, מונע אירועים, קונצנזוס)
  - מימוש שירות אורקסטרטור מלא (Python/Flask, מעל 1,500 שורות)
  - 3 מימושים מיוחדים לסוכנים (מחקר, כותב, עורך)
  - אינטגרציה עם Service Bus לתור הודעות
  - ניהול מצב ב-Cosmos DB למערכות מבוזרות
  - 6 דיאגרמות Mermaid המציגות אינטראקציות בין סוכנים
  - 3 תרגילים מתקדמים (ניהול timeout, לוגיקת retry, מפסק מעגל)
  - פירוט עלויות (240-565$ לחודש) עם אסטרטגיות אופטימיזציה
  - אינטגרציה עם Application Insights לניטור

#### שופרו
- **פרק לפני הפריסה**: כעת כולל דפוסי ניטור ותיאום מקיפים
- **פרק התחלה**: שופר עם דפוסי אימות מקצועיים
- **מוכנות לייצור**: כיסוי מלא מאבטחה ועד ניתור
- **מפת הקורס**: עודכן להפנות לשיעורים חדשים בפרקים 3 ו-6

#### שונה
- **התקדמות בלמידה**: שיפור אינטגרציה של אבטחה וניטור לאורך הקורס
- **איכות התיעוד**: סטנדרטים עקביים בדרגת A (95-97%) בשיעורים החדשים
- **דפוסי ייצור**: כיסוי מלא מקצה לקצה לפריסות ארגוניות

#### השתפר
- **חווית מפתח**: נתיב ברור מפיתוח לניטור בייצור
- **תקני אבטחה**: דפוסים מקצועיים לאימות וניהול סודות
- **תצפיתיות**: אינטגרציה מלאה של Application Insights עם AZD
- **עומסי AI**: ניטור מיוחד לדגמי Microsoft Foundry ומערכות רב-סוכניות

#### אומת
- ✅ כל השיעורים כוללים קוד עובד מלא (לא קטעים)
- ✅ דיאגרמות Mermaid ללמידה ויזואלית (19 סה"כ בשלושה שיעורים)
- ✅ תרגילים מעשיים עם שלבי אימות (9 סה"כ)
- ✅ תבניות Bicep מוכנות לייצור לפריסה בעזרת `azd up`
- ✅ ניתוח עלויות ואסטרטגיות אופטימיזציה
- ✅ מדריכי פתרון בעיות ושיטות עבודה מומלצות
- ✅ נקודות בדיקה ידע עם פקודות אימות

#### תוצאות דירוג התיעוד
- **docs/pre-deployment/application-insights.md**: - מדריך ניטור מקיף
- **docs/getting-started/authsecurity.md**: - דפוסי אבטחה מקצועיים
- **docs/pre-deployment/coordination-patterns.md**: - ארכיטקטורות רב-סוכניות מתקדמות
- **תוכן חדש כולל**: - סטנדרטים גבוהים ועקביים

#### יישום טכני
- **Application Insights**: Log Analytics + טלמטריה מותאמת + מעקב מבוזר
- **אימות**: Managed Identity + Key Vault + דפוסי RBAC
- **רב-סוכני**: Service Bus + Cosmos DB + Container Apps + אורקסטרציה
- **ניטור**: מדדים חיים + שאילתות Kusto + התראות + לוחות מחוונים
- **ניהול עלויות**: אסטרטגיות דגימה, מדיניות אחסון, בקרות תקציב

### [v3.7.0] - 2025-11-19

#### שיפורים באיכות התיעוד ודוגמת Microsoft Foundry Models חדשה
**גרסה זו משפרת את איכות התיעוד במחסן ומוסיפה דוגמת פריסת Microsoft Foundry Models מלאה עם ממשק שיחה gpt-4.1.**

#### נוסף
- **🤖 דוגמת שיחה Microsoft Foundry Models**: פריסה מלאה של gpt-4.1 עם מימוש עובד ב-`examples/azure-openai-chat/`:
  - תשתית Microsoft Foundry Models מלאה (פריסת מודל gpt-4.1)
  - ממשק שיחה דרך שורת הפקודה בפייתון עם היסטוריית שיחה
  - אינטגרציה עם Key Vault לאחסון מאובטח של מפתחות API
  - מעקב שימוש באסימונים והערכת עלויות
  - הגבלת קצב וטיפול בשגיאות
  - README מקיף עם מדריך פריסה של 35-45 דקות
  - 11 קבצים מוכנים לייצור (תבניות Bicep, אפליקציית Python, הגדרות)
- **📚 תרגילי תיעוד**: נוספו תרגולים מעשיים למדריך הגדרות:
  - תרגיל 1: קונפיגורציה מרובת סביבות (15 דקות)
  - תרגיל 2: תרגול ניהול סודות (10 דקות)
  - קריטריוני הצלחה ברורים ושלבי אימות
- **✅ אימות פריסה**: נוספה סעיף אימות למדריך הפריסה:
  - נהלי בדיקת בריאות
  - רשימת קריטריוני הצלחה
  - פלט צפוי לכל הפקודות פריסה
  - הפניות מהירות לפתרון בעיות

#### שופר
- **examples/README.md**: עודכן לאיכות דרגת A (93%):
  - נוספו azure-openai-chat לכל הקטעים הרלוונטיים
  - נספרו דוגמאות מקומיות מ-3 ל-4
  - נוספה לטבלת דוגמאות אפליקציות AI
  - שולבה ב"התחלה מהירה" למשתמשים בינוניים
  - נוספה לסעיף תבניות Microsoft Foundry
  - עודכן מטריצת השוואות וקטעי חיפוש טכנולוגיה
- **איכות התיעוד**: שופר מ-B+ (87%) ל-A- (92%) בתיקיית docs:

  - נוספו תוצאות צפויות לדוגמאות פקודות קריטיות
  - נכללו שלבים לאימות שינויים בתצורה
  - שופר הלמידה המעשית עם תרגילים פרקטיים

#### שונה
- **התקדמות הלמידה**: שיפור אינטגרציה של דוגמאות בינה מלאכותית ללומדים בינוניים
- **מבנה התיעוד**: תרגילים מעשיים יותר עם תוצאות ברורות
- **תהליך האימות**: נוספו קריטריוני הצלחה מפורשים לזרימות עבודה מרכזיות

#### שופר
- **חווית המפתח**: פריסת Microsoft Foundry Models כעת לוקחת 35-45 דקות (לעומת 60-90 עבור חלופות מורכבות)
- **שקיפות עלויות**: הערכות עלות ברורות (50-200$ לחודש) בדוגמא של Microsoft Foundry Models
- **מסלול הלמידה**: למפתחי בינה מלאכותית יש נקודת כניסה ברורה עם azure-openai-chat
- **תקני תיעוד**: תוצאות צפויות ואימות עקביים

#### אומת
- ✅ דוגמת Microsoft Foundry Models פעילה לחלוטין עם `azd up`
- ✅ כל 11 קבצי המימוש תקינים תחבירית
- ✅ הוראות README תואמות את חוויית הפריסה בפועל
- ✅ קישורי התיעוד עודכנו ב-8+ מיקומים
- ✅ אינדקס הדוגמאות משקף במדויק 4 דוגמאות מקומיות
- ✅ אין קישורים חיצוניים כפולים בטבלאות
- ✅ כל הפניות הניווט נכונות

#### מימוש טכני
- **ארכיטקטורת Microsoft Foundry Models**: דגם gpt-4.1 + Key Vault + תבנית Container Apps
- **אבטחה**: זהות מנוהלת מוכן, סודות ב-Key Vault
- **ניטור**: אינטגרציית Application Insights
- **ניהול עלויות**: מעקב אחרי אסימונים ואופטימיזציה של שימוש
- **פריסה**: פקודת `azd up` בודדת להגדרה מלאה

### [v3.6.0] - 2025-11-19

#### עדכון עיקרי: דוגמאות לפריסת אפליקציית מכולות
**הגרסה הזו מציגה דוגמאות פריסה מקיפות ומוכנות לייצור של אפליקציות מכולות באמצעות Azure Developer CLI (AZD), עם תיעוד מלא ואינטגרציה למסלול הלמידה.**

#### נוספו
- **🚀 דוגמאות אפליקציות מכולות**: דוגמאות מקומיות חדשות ב-`examples/container-app/`:
  - [מדריך ראשי](examples/container-app/README.md): סקירה מלאה של פריסות מכולות, הפעלה מהירה, ייצור ותבניות מתקדמות
  - [API Flask פשוט](../../examples/container-app/simple-flask-api): REST API ידידותי למתחילים עם scale-to-zero, בדיקות בריאות, ניטור ופתרון תקלות
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices): פריסה מוכנה לייצור עם מספר שירותים (API Gateway, מוצר, הזמנה, משתמש, התראה), הודעות אסינכרוניות, Service Bus, Cosmos DB, Azure SQL, מעקב מפוזר, פריסה כחולה-ירוקה/קנרית
- **שיטות עבודה מומלצות**: אבטחה, ניטור, אופטימיזציית עלויות והנחיות CI/CD לעומסי עבודה במכולות
- **דוגמאות קוד**: `azure.yaml` מלא, תבניות Bicep ומימוש שירותים בריבוי שפות (Python, Node.js, C#, Go)
- **בדיקות ופתרון תקלות**: תרחישי מבחן מקצה לקצה, פקודות ניטור, הדרכות לפתרון תקלות

#### שונה
- **README.md**: עודכן להציג ולקשר לדוגמאות אפליקציות מכולות חדשות תחת "דוגמאות מקומיות - אפליקציות מכולה"
- **examples/README.md**: עודכן להדגיש דוגמאות אפליקציות מכולות, להוסיף פריטי מטריצת השוואה ולעדכן הפניות לטכנולוגיה/ארכיטקטורה
- **מתווה הקורס ומדריך הלימוד**: עודכן להפנות לדוגמאות אפליקציות מכולות חדשות ולתבניות פריסה בפרקים הרלוונטיים

#### אומת
- ✅ כל הדוגמאות החדשות ניתנות לפריסה עם `azd up` ועוקבות אחר שיטות עבודה מומלצות
- ✅ קישורי התיעוד והמיפוי עודכנו
- ✅ דוגמאות מכסות תרחישים למתחילים ומתקדמים, כולל מיקרו-שירותים בייצור

#### הערות
- **תחום**: תיעוד ודוגמאות באנגלית בלבד
- **צעדים הבאים**: הרחבה עם תבניות מכולות מתקדמות ואוטומציה של CI/CD במהדורות עתידיות

### [v3.5.0] - 2025-11-19

#### מיתוג מוצר מחדש: Microsoft Foundry
**הגרסה הזו מיישמת שינוי שם מוצר כולל מ-"Microsoft Foundry" ל-"Microsoft Foundry" בכל תיעוד האנגלית, שמשקף את שינוי המיתוג הרשמי של מיקרוסופט.**

#### שונה
- **🔄 עדכון שם מוצר**: מיתוג מחדש מלא מ-"Microsoft Foundry" ל-"Microsoft Foundry"
  - הועדכנו כל ההפניות בתיעוד האנגלי בתיקיית `docs/`
  - שונה שם תיקייה: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - שונה שם קובץ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - סה"כ: 23 הפניות תוכן עודכנו ב-7 קבצי תיעוד

- **📁 שינויים במבנה תיקייה**:
  - `docs/ai-foundry/` שונה ל-`docs/microsoft-foundry/`
  - כל ההפניות הצולבות עודכנו לשקף את מבנה התיקיות החדש
  - קישורי ניווט אומתו בכל התיעוד

- **📄 שינוי שמות קבצים**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - כל הקישורים הפנימיים עודכנו לשם הקובץ החדש

#### קבצים עודכנו
- **תיעוד פרקים** (7 קבצים):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 עדכוני קישורי ניווט
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 הפניות לשם מוצר עודכנו
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - כבר משתמש ב-Microsoft Foundry (מעודכנים קודמים)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 הפניות עודכנו (סקירה, משוב קהילה, תיעוד)
  - `docs/getting-started/azd-basics.md` - 4 קישורי הפניה חוצת-מסמכים עודכנו
  - `docs/getting-started/first-project.md` - 2 קישורי ניווט פרקים עודכנו
  - `docs/getting-started/installation.md` - 2 קישורי פרק הבא עודכנו
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 הפניות עודכנו (ניווט, קהילת Discord)
  - `docs/troubleshooting/common-issues.md` - 1 קישור ניווט עודכן
  - `docs/troubleshooting/debugging.md` - 1 קישור ניווט עודכן

- **קבצי מבנה קורס** (2 קבצים):
  - `README.md` - 17 הפניות עודכנו (סקירת קורס, כותרות פרקים, קטע תבניות, תובנות קהילה)
  - `course-outline.md` - 14 הפניות עודכנו (סקירה, מטרות הלמידה, משאבי פרקים)

#### אומת
- ✅ אין הפניות שנותרו לנתיב תיקייה "ai-foundry" בתיעוד האנגלי
- ✅ אין הפניות שנותרו לשם מוצר "Microsoft Foundry" בתיעוד האנגלי
- ✅ כל קישורי הניווט תקינים עם מבנה התיקיות החדש
- ✅ שינויי שמות קבצים ותיקיות הושלמו בהצלחה
- ✅ הפניות צולבות בין פרקים אומתו

#### הערות
- **תחום**: השינויים הוחלו רק בתיעוד האנגלי בתיקיית `docs/`
- **תרגומים**: תיקיות תרגום (`translations/`) לא עודכנו בגרסה זו
- **סדנה**: חומרי סדנה (`workshop/`) לא עודכנו בגרסה זו
- **דוגמאות**: ייתכן שקבצי דוגמא כוללים עדיין שמות ישנים (לטיפול בעדכון עתידי)
- **קישורים חיצוניים**: כתובות URL חיצוניות והפניות למאגר GitHub נשארות ללא שינוי

#### מדריך מעבר לתורמים
אם יש לכם סניפים מקומיים או תיעוד המפנה למבנה הישן:
1. עדכנו הפניות תיקיה: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. עדכנו הפניות קובץ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. החליפו שם מוצר: "Microsoft Foundry" → "Microsoft Foundry"
4. ודאו שכל הקישורים הפנימיים לתיעוד עדיין תקינים

---

### [v3.4.0] - 2025-10-24

#### שיפורים בתצוגה מקדימה ואימות תשתית
**הגרסה הזו מציגה תמיכה מקיפה בתצוגה המקדימה החדשה של Azure Developer CLI ומשפרת את חווית המשתמש בסדנה.**

#### נוספו
- **🧪 תיעוד אפשרות azd provision --preview**: כיסוי מקיף של יכולת התצוגה המקדימה החדשה לתשתית
  - הפניות פקודה ודוגמאות שימוש בגליון רמאות
  - אינטגרציה מפורטת במדריך הפריסה עם מקרי שימוש ויתרונות
  - אינטגרציה של בדיקת קדם-טיסה לאימות פריסה בטוח יותר
  - עדכונים במדריך התחלה עם שיטות פריסה שמעדיפות בטיחות
- **🚧 באנר סטטוס סדנה**: באנר HTML מקצועי שמצביע על מצב פיתוח הסדנה
  - עיצוב גרדיאנט עם אינדיקטורים לבניית המצב לתקשורת מסודרת עם המשתמש
  - חותמת זמן עדכנית לשקיפות
  - עיצוב רספונסיבי למכשירים ניידים

#### שופר
- **בטיחות תשתית**: פונקציונליות התצוגה המקדימה משולבת בכל התיעוד של הפריסה
- **אימות קדם-פריסה**: סקריפטים אוטומטיים כוללים כעת בדיקות תצוגה מקדימה
- **זרימת עבודה למפתח**: רצפי פקודות עודכנו לכלול תצוגה מקדימה כשיטה מומלצת
- **חווית סדנה**: ציפיות ברורות למשתמשים לגבי מצב פיתוח התוכן

#### שונה
- **שיטות פריסה מומלצות**: זרימת עבודה שמדגישה תצוגה מקדימה מומלצת כגישה ראשונית
- **זרימת תיעוד**: אימות התשתית הועבר לשלב מוקדם יותר בתהליך הלמידה
- **הצגת סדנה**: תקשורת סטטוס מקצועית עם קו זמן פיתוח ברור

#### שופר
- **גישת בטיחות ראשונה**: שינויים בתשתית ניתנים לאימות לפני הפריסה
- **שיתוף פעולה בצוות**: ניתן לשתף תוצאות תצוגה מקדימה לסקירה ואישור
- **מודעות עלויות**: הבנה טובה יותר של עלויות משאבים לפני הפריסה
- **הפחתת סיכונים**: הפחתת כשלונות פריסה באמצעות אימות מראש

#### מימוש טכני
- **אינטגרציה במסמכים מרובים**: תיעוד אפשרות התצוגה המקדימה ב-4 קבצים מרכזיים
- **תבניות פקודות**: תחביר ודוגמאות עקביים בכל התיעוד
- **אינטגרציית שיטות עבודה מומלצות**: תצוגה מקדימה נכללת בזרימות אימות וסקריפטים
- **מחוות ויזואליות**: סימוני תכונה חדשה ברורים לזיהוי קל

#### תשתית הסדנה
- **תקשורת סטטוס**: באנר HTML מקצועי עם סגנון גרדיאנט
- **חווית משתמש**: מצבי פיתוח ברורים למניעת בלבול
- **הצגה מקצועית**: שומרת על אמינות המאגר תוך קביעת ציפיות
- **שקיפות קו זמן**: חותמת זמן עדכון אחרונה לאוקטובר 2025 לאחריות

### [v3.3.0] - 2025-09-24

#### שיפור חומרי סדנה וחוויית למידה אינטראקטיבית
**הגרסה הזו מציגה חומרי סדנה מקיפים עם מדריכים אינטראקטיביים לדפדפן ומסלולי למידה מובנים.**

#### נוספו
- **🎥 מדריך סדנה אינטראקטיבי**: חווית סדנה בדפדפן עם יכולת תצוגה מקדימה MkDocs
- **📝 הוראות סדנה מובנות**: מסלול למידה בן 7 שלבים מגלוי ועד התאמה אישית
  - 0-הקדמה: סקירה והגדרת הסדנה
  - 1-בחירת תבנית AI: תהליך גילוי ובחירת תבנית
  - 2-אימות תבנית AI: נהלי פריסה ואימות
  - 3-פירוק תבנית AI: הבנת ארכיטקטורת התבנית
  - 4-הגדרת תבנית AI: תצורה והתאמה אישית
  - 5-הסתת תבנית AI: שינויים מתקדמים ואיטרציות
  - 6-הריסת תשתית: ניקוי וניהול משאבים
  - 7-סיכום: סיכום ושלבים הבאים
- **🛠️ כלים לסדנה**: תצורת MkDocs עם נושא Material לחווית למידה משופרת
- **🎯 מסלול למידה פרקטי**: מתודולוגיית 3 שלבים (גילוי → פריסה → התאמה אישית)
- **📱 אינטגרציה עם GitHub Codespaces**: הקמת סביבת פיתוח חלקה

#### שופר
- **מעבדה לסדנת AI**: הורחבה עם חוויית למידה מובנית למשך 2-3 שעות
- **תיעוד הסדנה**: הצגה מקצועית עם ניווט ועזרים חזותיים
- **התקדמות הלמידה**: הנחיות שלב אחר שלב לבחירת תבנית ועד לפריסת ייצור
- **חווית מפתח**: כלים משולבים לזרימות עבודה יעילות בפיתוח

#### שופר
- **נגישות**: ממשק מבוסס דפדפן עם חיפוש, פונקציית העתק, והחלפת ערכת נושא
- **למידה בקצב עצמי**: מבנה סדנה גמיש שמתאים לקצבי למידה שונים
- **יישום מעשי**: תרחישי פריסת תבניות AI בעולם האמיתי
- **אינטגרציה קהילתית**: אינטגרציה עם Discord לתמיכה ושיתוף פעולה בסדנה

#### תכונות הסדנה
- **חיפוש מובנה**: גילוי מהיר של מילות מפתח ולקחים
- **העתקת קטעי קוד**: פונקציית העתק בלחיצה מעל כל דוגמת קוד
- **החלפת ערכת נושא**: תמיכה במצב כהה/בהיר בהתאם להעדפות שונות
- **רכיבי חזותיים**: צילומי מסך ודיאגרמות לשיפור ההבנה
- **אינטגרציית עזרה**: גישה ישירה ל-Discord לתמיכה קהילתית

### [v3.2.0] - 2025-09-17

#### שינויי ניווט משמעותיים ומערכת למידה מבוססת פרקים
**הגרסה הזו מציגה מערכת למידה מקיפה מבוססת פרקים עם שיפור בכותרות וניווט לאורך כל המאגר.**

#### נוספו
- **📚 מערכת למידה מבוססת פרקים**: ארגון מחודש של הקורס כולו ל-8 פרקי למידה מתקדמים
  - פרק 1: יסודות והפעלה מהירה (⭐ - 30-45 דקות)
  - פרק 2: פיתוח מוכוון AI (⭐⭐ - 1-2 שעות)
  - פרק 3: תצורה ואימות (⭐⭐ - 45-60 דקות)
  - פרק 4: תשתית כקוד ופריסה (⭐⭐⭐ - 1-1.5 שעות)
  - פרק 5: פתרונות AI מרובי סוכנים (⭐⭐⭐⭐ - 2-3 שעות)
  - פרק 6: אימות ותכנון קדם-פריסה (⭐⭐ - שעה)
  - פרק 7: פתרון תקלות ודיבוג (⭐⭐ - 1-1.5 שעות)
  - פרק 8: תבניות ייצור וארגוניות (⭐⭐⭐⭐ - 2-3 שעות)
- **📚 מערכת ניווט מקיפה**: כותרות עליונות ותחתונות עקביות בכל התיעוד
- **🎯 מעקב התקדמות**: רשימת בדיקה להשלמת הקורס ומערכת אימות למידה
- **🗺️ הנחיית מסלול למידה**: נקודות כניסה ברורות לרמות ונקודות מטרה שונות
- **🔗 ניווט הפניות צולבות**: פרקים קשורים ותנאי קדם מקושרים בבירור

#### שופר
- **מבנה README**: הוסב לפלטפורמת למידה מובנית עם ארגון מבוסס פרקים
- **ניווט בתיעוד**: לכל דף נוספה הקשר של פרק והנחיות התקדמות
- **ארגון תבניות**: דוגמאות ותבניות ממופים לפרקי הלמידה המתאימים

- **אינטגרציית משאבים**: דפי עובדות, שאלות נפוצות, ומדריכי לימוד מחוברים לפרקים הרלוונטיים
- **אינטגרציית סדנאות**: מעבדות מעשיות שמותאמות למטרות הלמידה של מספר פרקים

#### שונה
- **התפתחות למידה**: מעבר מתיעוד לינארי ללמידה גמישה מבוססת פרקים
- **מיקום ההגדרות**: העברת מדריך ההגדרות לפרק 3 לשיפור רצף הלמידה
- **אינטגרציית תוכן AI**: אינטגרציה משופרת של תוכן ייחודי ל-AI לאורך המסע הלימודי
- **תוכן פרודקשן**: דפוסים מתקדמים מוכנסים בפרק 8 ללומדים במגזר הארגוני

#### שופר
- **חוויית משתמש**: פירורי לחם ברורים ומדדי התקדמות פרקים
- **נגישות**: דפוסי ניווט עקביים להקלת המעבר בקורס
- **הצגה מקצועית**: מבנה קורס בסגנון אוניברסיטאי המתאים להכשרה אקדמית וארגונית
- **יעילות למידה**: הקטנת הזמן למציאת התוכן הרלוונטי בזכות ארגון משופר

#### מימוש טכני
- **כותרות ניווט**: ניווט פרקים סטנדרטי בכ-40 קבצי תיעוד
- **ניווט בכותרת תחתונה**: הנחיות התקדמות עקביות ומדדי סיום פרקים
- **קישוריות חוצה**: מערכת קישורים פנימיים מקיפה שמחברת מושגים קשורים
- **מיפוי פרקים**: תבניות ודוגמאות מקושרות בבירור למטרות הלמידה

#### שיפור מדריך לימוד
- **📚 מטרות למידה מקיפות**: ארגון מחדש של מדריך הלימוד להתאמה למערכת עם 8 פרקים
- **🎯 הערכה מבוססת פרקים**: לכל פרק יש מטרות למידה ספציפיות ותרגולים מעשיים
- **📋 מעקב התקדמות**: לוח זמנים שבועי ללמידה עם תוצאות מדידות ורשימות בדיקה לסיום
- **❓ שאלות הערכה**: שאלות לאימות ידע עבור כל פרק עם תוצאות מקצועיות
- **🛠️ תרגולים מעשיים**: פעילויות מעשיות הכוללות תרחישי פריסה אמיתיים ופתרון תקלות
- **📊 התקדמות מיומנויות**: התקדמות ברורה מהרעיונות הבסיסיים לדפוסי ארגון מתקדמים עם דגש על פיתוח קריירה
- **🎓 מסגרת הסמכה**: תוצאות לפיתוח מקצועי ומערכת הכרה קהילתית
- **⏱️ ניהול זמנים**: תכנית למידה מסודרת לעשר שבועות עם ולידציה של אבני דרך

### [v3.1.0] - 2025-09-17

#### שיפורים בפתרונות AI רב-סוכניים
**גרסה זו משפרת את פתרון הקמעונאות הרב-סוכני עם שמות סוכנים ברורים יותר ותיעוד משופר.**

#### שונה
- **טרמינולוגיה רב-סוכנית**: החלפת "קורה סוכן" ב-"סוכן לקוח" בכל פתרון הקמעונאות הרב-סוכני להבנה בהירה יותר
- **ארכיטקטורת סוכן**: עדכון כל התיעוד, תבניות ARM ודוגמאות קוד לשימוש בשם "סוכן לקוח" עקבי
- **דוגמאות הגדרות**: מודרניזציה של דפוסי הגדרת הסוכן עם קונבנציות שמות מעודכנות
- **עקביות תיעוד**: הבטחת שימוש בשמות סוכנים מקצועיים ותיאוריים בכל ההתייחסויות

#### משופר
- **חבילת תבניות ARM**: עדכון retail-multiagent-arm-template עם התייחסויות לסוכן לקוח
- **דיאגרמות ארכיטקטורה**: רענון דיאגרמות Mermaid עם שמות סוכנים מעודכנים
- **דוגמאות קוד**: מחלקות פייתון ודוגמאות יישום משתמשות כעת בשם CustomerAgent
- **משתני סביבה**: עדכון כל סקריפטי הפריסה לשימוש בקונבנציית CUSTOMER_AGENT_NAME

#### שופר
- **חויית מפתח**: הבהרת תפקידי הסוכן ואחריותם בתיעוד
- **מוכנות פרודקשן**: התאמה טובה יותר לקונבנציות שמות ארגוניות
- **חומרי למידה**: שימוש בשם סוכן אינטואיטיבי יותר למטרות חינוכיות
- **שימושיות התבנית**: פישוט ההבנה של תפקידי הסוכן ודפוסי הפריסה

#### פרטים טכניים
- עדכון דיאגרמות ארכיטקטורה Mermaid עם התייחסויות CustomerAgent
- החלפת שמות מחלקות CoraAgent ל-CustomerAgent בדוגמאות פייתון
- שינוי תבניות JSON של ARM לשימוש בטייפ "customer" לסוכן
- עדכון משתני סביבה מ-CORA_AGENT_* ל-CUSTOMER_AGENT_*
- רענון כל פקודות הפריסה וקונפיגורציות המכולות

### [v3.0.0] - 2025-09-12

#### שינויים גדולים - מיקוד במפתחי AI ואינטגרציית Microsoft Foundry
**גרסה זו הופכת את המאגר למשאב למידה מקיף ממוקד AI עם אינטגרציה ל-Microsoft Foundry.**

#### הוסף
- **🤖 מסלול למידה AI-ראשון**: ארגון מחדש מלא המעדיף מפתחי ומהנדסי AI
- **מדריך אינטגרציית Microsoft Foundry**: תיעוד מקיף לחיבור AZד עם שירותי Microsoft Foundry
- **דפוסי פריסת מודלי AI**: מדריך מפורט לבחירה, הגדרה ואסטרטגיות פריסה בפרודקשן
- **סדנת AI מעשית**: סדנא מעשית של 2-3 שעות להמרת אפליקציות AI לפתרונות שניתנים לפריסה ב-AZD
- **שיטות עבודה מיטביות לפרודקשן AI**: דפוסים מוכנים לעסקים להרחבה, ניטור ואבטחה של עומסי AI
- **מדריך פתרון בעיות AI**: פתרון תקלות מקיף למודלים של Microsoft Foundry, Cognitive Services ובעיות פריסה ב-AI
- **גלריית תבניות AI**: אוסף מובלט של תבניות Microsoft Foundry עם דירוגי מורכבות
- **חומרי סדנא**: מבנה סדנא שלם עם מעבדות מעשיות וחומרי עזר

#### שופר
- **מבנה README**: ממוקד מפתחי AI עם 45% נתוני עניין מהקהילה ב-Discord של Microsoft Foundry
- **מסלולי למידה**: מסע מפתח AI ייעודי לצד מסלולים מסורתיים לתלמידים ומהנדסי DevOps
- **המלצות תבניות**: תבניות AI מובילות כולל azure-search-openai-demo, contoso-chat ו-openai-chat-app-quickstart
- **אינטגרציית קהילה**: תמיכה משופרת בקהילת Discord עם ערוצים ודיונים ייעודיים ל-AI

#### אבטחה ומיקוד בפרודקשן
- **דפוסי זהות מנוהלת**: אימות ואבטחה ייעודיים ל-AI
- **אופטימיזציה לעלות**: מעקב שימוש בטוקנים ובקרות תקציב לעומסי AI
- **פריסות רב-אזוריות**: אסטרטגיות פריסה גלובלית לאפליקציות AI
- **ניטור ביצועים**: מדדי AI ייחודיים ואינטגרציית Application Insights

#### איכות תיעוד
- **מבנה קורס לינארי**: התקדמות לוגית מהבסיס לדפוסי פריסה מתקדמים ב-AI
- **כתובות URL וולידיות**: כל הקישורים החיצוניים נבדקו ונגישים
- **מלא רפרנס**: כל הקישורים הפנימיים בתיעוד מאומתים ופועלים
- **מוכנות לפרודקשן**: דפוסי פריסה עסקיים עם דוגמאות מהעולם האמיתי

### [v2.0.0] - 2025-09-09

#### שינויים גדולים - ארגון מחדש של המאגר ושיפור מקצועי
**גרסה זו מייצגת מהפכה משמעותית במבנה המאגר ובהצגת התוכן.**

#### נוסף
- **מסגרת למידה מובנית**: כל דפי התיעוד כוללים כעת מבוא, יעדי למידה ותוצאות למידה
- **מערכת ניווט**: הוספת קישורי שיעור קודם/אחר הבא בכל התיעוד להנחיית התקדמות הלימוד
- **מדריך לימוד**: study-guide.md מקיף המכיל מטרות למידה, תרגולים וחומרי הערכה
- **הצגה מקצועית**: הסרת אייקוני אימוג׳י לשיפור הנגישות והמראה המקצועי
- **שיפור מבנה התוכן**: ארגון וזרימה משופרים של חומרי הלמידה

#### שונה
- **פורמט התיעוד**: סטנדרטיזציה של כל התיעוד עם מבנה ממוקד למידה עקבי
- **זרימת ניווט**: יישום התקדמות הגיונית בין כל חומרי הלמידה
- **הצגת תוכן**: הסרת אלמנטים דקורטיביים לטובת עיצוב ברור ומקצועי
- **מבנה קישורים**: עדכון כל הקישורים הפנימיים לתמיכה במערכת הניווט החדשה

#### שופר
- **נגישות**: הסרת תלות באימוג׳ים להתאמה טובה יותר לקוראי מסך
- **מראה מקצועי**: הצגה נקייה בסגנון אקדמי המתאים ללמידה ארגונית
- **חוויית למידה**: גישה מובנית עם מטרות ותוצאות ברורות לכל שיעור
- **ארגון תוכן**: זרימה לוגית טובה יותר וקישורים בין נושאים קשורים

### [v1.0.0] - 2025-09-09

#### שחרור ראשוני - מאגר למידה מקיף ל-AZD

#### נוסף
- **מבנה תיעוד ליבת**
  - סדרת מדריכי התחלה מלאה
  - תיעוד פריסה והספקה מקיף
  - משאבי פתרון תקלות מפורטים ומדריכי דיבוג
  - כלי ולידציה לפעולות לפני פריסה

- **מודול התחלה**
  - יסודות AZD: מושגים וטרמינולוגיה מרכזיים
  - מדריך התקנה: הוראות הגדרה לפי פלטפורמה
  - מדריך הגדרות: הקמת סביבה ואימות
  - הדרכה לפרויקט ראשון: למידה מעשית שלב אחרי שלב

- **מודול פריסה והספקה**
  - מדריך פריסה: תיעוד תהליך מלא
  - מדריך הספקה: תשתית כקוד עם Bicep
  - שיטות עבודה מיטביות לפריסות בפרודקשן
  - דפוסי ארכיטקטורה רב-שירותית

- **מודול ולידציה לפני פריסה**
  - תכנון קיבולת: אימות זמינות משאבי Azure
  - בחירת SKU: הנחיות מפורטות לרמות שירות
  - בדיקות טרום-טיסה: סקריפטים לאימות אוטומטי (PowerShell ובאש)
  - כלים לאומדן עלויות ותכנון תקציב

- **מודול פתרון תקלות**
  - בעיות נפוצות: בעיות ופתרונות שכיחים
  - מדריך דיבוג: שיטות פתרון תקלות שיטתי
  - טכניקות ואמצעים אבחוניים מתקדמים
  - ניטור ביצועים ואופטימיזציה

- **משאבים והפניות**
  - דף פקודות מעקב: הפניה מהירה לפקודות חיוניות
  - מילון מונחים: הגדרות ומונחים מפורטים
  - שאלות נפוצות: תשובות מפורטות לשאלות נפוצות
  - קישורים למשאבים חיצוניים וחיבורים קהילתיים

- **דוגמאות ותבניות**
  - דוגמת אפליקציית ווב פשוטה
  - תבנית פריסת אתר סטטי
  - קונפיגורציית אפליקציית מכולות
  - דפוסי אינטגרציית בסיסי נתונים
  - דוגמאות ארכיטקטורת מיקרו-שירותים
  - יישומי פונקציות ללא שרת

#### תכונות
- **תמיכה מולטי-פלטפורמית**: מדריכי התקנה והגדרה ל-Windows, macOS ולינוקס
- **רמות מיומנות מרובות**: תוכן המיועד מתלמידים ועד מפתחים מקצועיים
- **מיקוד מעשי**: דוגמאות מעשיות ותרחישים מהעולם האמיתי
- **כיסוי מקיף**: מרעיונות בסיסיים ועד דפוסי ארגון עסקיים מתקדמים
- **גישה ממוקדת אבטחה**: שיטות עבודה מיטביות לאבטחה משולבות לאורך כל התוכן
- **אופטימיזציה לעלות**: הנחיות לפריסות וכלכלת משאבים אפקטיבית

#### איכות תיעוד
- **דוגמאות קוד מפורטות**: דוגמאות קוד מעשיות ונבדקות
- **הוראות שלב-אחר-שלב**: הנחיות ברורות וברי-ביצוע
- **התמודדות עם שגיאות מקיפה**: פתרון תקלות לבעיות שכיחות
- **שילוב שיטות עבודה מיטביות**: סטנדרטים והמלצות תעשייתיות
- **תאימות גרסה**: מעודכן עם שירותי Azure האחרונים ותכונות azd

## שיפורים עתידיים מתוכננים

### גרסה 3.1.0 (מתוכנן)
#### הרחבת פלטפורמת AI
- **תמיכה בריבוי מודלים**: דפוסי אינטגרציה ל-Hugging Face, Azure Machine Learning ומודלים מותאמים אישית
- **מסגרות סוכני AI**: תבניות לפריסות LangChain, Semantic Kernel ו-AutoGen
- **דפוסי RAG מתקדמים**: אפשרויות למסדי וקטורים מעבר ל-Azure AI Search (Pinecone, Weaviate וכו')
- **תצפית AI**: ניטור משופר לביצועי המודל, שימוש בטוקנים ואיכות התגובות

#### חוויית מפתח
- **הרחבת VS Code**: חווית פיתוח משולבת של AZD + Microsoft Foundry
- **אינטגרציית GitHub Copilot**: יצירת תבניות AZD בעזרת AI
- **הדרכות אינטראקטיביות**: תרגולי קוד מעשיים עם אימות אוטומטי לתרחישי AI
- **תוכן וידאו**: מדריכי וידאו נוספים ללומדים חזותיים עם דגש על פריסות AI

### גרסה 4.0.0 (מתוכנן)
#### דפוסי AI ארגוניים
- **מסגרת ממשל**: ממשל מודלי AI, תאימות, ורשומות ביקורת
- **AI מרובה שוכרים**: דפוסים למתן שירות ללקוחות מרובים עם שירותי AI מבודדים
- **פריסת AI בשוליים**: אינטגרציה עם Azure IoT Edge ומקרי מכולות
- **AI ענן היברידי**: דפוסי פריסת רב-ענניים והיברידיים לעומסי AI

#### תכונות מתקדמות
- **אוטומציה של פייפליין AI**: אינטגרציית MLOps עם פייפליינים של Azure Machine Learning
- **אבטחה מתקדמת**: דפוסים של אמון אפס, נקודות קצה פרטיות והגנה מפני איומים מתקדמים
- **אופטימיזציית ביצועים**: כוונון והרחבות מתקדמות לאפליקציות AI עם תפוקה גבוהה
- **הפצה גלובלית**: דפוסי הפצת תוכן ומטמון שוליים לאפליקציות AI

### גרסה 3.0.0 (מתוכנן) - הוחלפה על ידי השחרור הנוכחי
#### תוספות מוצעות - מיושמות כעת ב-v3.0.0
- ✅ **תוכן ממוקד AI**: אינטגרציית Microsoft Foundry מקיפה (הושלם)
- ✅ **סדנאות אינטראקטיביות**: סדנת מעבדה ל-AI (הושלם)
- ✅ **מודול אבטחה מתקדם**: דפוסי אבטחה ספציפיים ל-AI (הושלם)
- ✅ **אופטימיזציית ביצועים**: אסטרטגיות כוונון עומסי AI (הושלם)

### גרסה 2.1.0 (מתוכנן) - חלקית מיושמת ב-v3.0.0
#### שיפורים קטנים - חלקם הושלם בשחרור הנוכחי
- ✅ **דוגמאות נוספות**: תרחישי פריסת AI (הושלם)
- ✅ **הרחבת שאלות נפוצות**: שאלות ופתרונות ייעודיים ל-AI (הושלם)
- **אינטגרציית כלים**: מדריכים משופרים לאינטגרציה עם IDE ועורכי קוד
- ✅ **הרחבת ניטור**: דפוסי ניטור והתראות ל-AI (הושלם)

#### עדיין מתוכנן לשחרור עתידי
- **תיעוד מותאם למובייל**: עיצוב רספונסיבי ללמידה בנייד
- **גישה אופליין**: חבילות תיעוד להורדה
- **אינטגרציית IDE משופרת**: תוספת VS Code לזרימות עבודה של AZD + AI
- **לוח מחוונים קהילתי**: מדדי קהילה בזמן אמת ומעקב אחר תרומות

## תרומה ליומן השינויים

### דיווח שינויים
בעת תרומה למאגר זה, יש לוודא כי הרשומות ביומן השינויים כוללות:

1. **מספר גרסה**: בהתאם לגרסאות סמנטיות (עיקרי.משני.תיקון)
2. **תאריך**: תאריך שחרור או עדכון בפורמט YYYY-MM-DD
3. **קטגוריה**: נוסף, שונה, מיושן, הוסר, תוקן, אבטחה
4. **תיאור ברור**: תיאור תמציתי של השינוי
5. **הערכת השפעה**: כיצד השינויים משפיעים על המשתמשים הקיימים

### קטגוריות שינויים

#### נוסף
- תכונות חדשות, קטעי תיעוד או יכולות
- דוגמאות חדשות, תבניות או משאבי למידה
- כלים, סקריפטים או יישומונים נוספים

#### שונה
- שינויים בפונקציונליות או בתיעוד קיים
- עדכונים לשיפור בהירות או דיוק
- ארגון מחדש של תוכן או מבנה

#### מיושן
- תכונות או גישות שמופסקות בהדרגה
- קטעי תיעוד המתוכננים להסרה
- שיטות בעלות חלופות משופרות

#### הוסר
- תכונות, תיעוד או דוגמאות שאינם רלוונטיים עוד
- מידע מיושן או גישות שהוסרו
- תוכן מיותר או מאוחד

#### תוקן
- תיקונים שגיאות בתיעוד או בקוד
- פתרון בעיות מדווחות
- שיפורים בדיוק או בפונקציונליות


#### אבטחה
- שיפורים או תיקונים הקשורים לאבטחה
- עדכונים לשיטות העבודה המומלצות לאבטחה
- פתרון חולשות אבטחה

### קווי הנחיה לגרסאות סמנטיות

#### גרסה ראשית (X.0.0)
- שינויים שבורים שדורשים פעולה מצד המשתמש
- מיתאר משמעותי של התוכן או הארגון
- שינויים שמשנים את הגישה או המתודולוגיה הבסיסית

#### גרסה משנית (X.Y.0)
- תכונות חדשות או הוספת תוכן
- שיפורים השומרים על תאימות לאחור
- דוגמאות, כלים או משאבים נוספים

#### גרסת תיקון (X.Y.Z)
- תיקוני באגים ותיקונים
- שיפורים קטנים לתוכן קיים
- הבהרות ושיפורים קטנים

## משוב והצעות מהקהילה

אנו מעודדים באופן פעיל משוב מהקהילה לשיפור מקור הלמידה הזה:

### כיצד לספק משוב
- **בעיות GitHub**: דיווח על בעיות או הצעות לשיפור (בעיות ספציפיות ל-AI מתקבלות בברכה)
- **שיחות ב-Discord**: שיתוף רעיונות והשתלבות עם קהילת Microsoft Foundry
- **בקשות משיכה**: תרומה לשיפורים ישירים בתוכן, במיוחד תבניות ומדריכים ל-AI
- **Microsoft Foundry Discord**: השתתפות בערוץ #Azure לדיונים על AZD + AI
- **פורומים קהילתיים**: השתתפות בדיונים רחבים יותר למפתחים ב-Azure

### קטגוריות משוב
- **דיוק תוכן AI**: תיקונים למידע על אינטגרציה ופריסה של שירותי AI
- **חוויית למידה**: הצעות לשיפור זרימת למידת מפתחים ב-AI
- **תוכן AI חסר**: בקשות לתבניות, דפוסים או דוגמאות AI נוספות
- **נגישות**: שיפורים לצרכי למידה מגוונים
- **אינטגרציית כלי AI**: הצעות לשיפור אינטגרציה בזרימות עבודה לפיתוח AI
- **דפוסי AI לפרודקשן**: בקשות לדפוסי פריסת AI ארגוניים

### התחייבות למענה
- **מענה על בעיות**: תוך 48 שעות לבעיות שדווחו
- **בקשות תכונה**: הערכה בתוך שבוע
- **תרומות קהילתיות**: סקירה בתוך שבוע
- **בעיות אבטחה**: עדיפות מיידית עם מענה מזורז

## לוח זמנים לתחזוקה

### עדכונים שוטפים
- **סקירות חודשיות**: בדיקת דיוק תוכן ואימות קישורים
- **עדכונים רבעוניים**: הוספות ושיפורים משמעותיים לתוכן
- **סקירות חצי-שנתיות**: מיתאר מחודש ושיפור מקיף
- **שחרורים שנתיים**: עדכוני גרסה משמעותיים עם שיפורים מהותיים

### ניטור ואבטחת איכות
- **בדיקות אוטומטיות**: אימות שוטף של דוגמאות קוד וקישורים
- **שילוב משוב מהקהילה**: הכללה שוטפת של הצעות משתמשים
- **עדכוני טכנולוגיה**: התאמה לשירותי Azure והגרסאות האחרונות של azd
- **בדיקות נגישות**: סקירה שוטפת לעקרונות עיצוב כוללניים

## מדיניות תמיכה בגרסאות

### תמיכה בגרסה נוכחית
- **הגרסה הראשית האחרונה**: תמיכה מלאה עם עדכונים שוטפים
- **הגרסה הראשית הקודמת**: עדכוני אבטחה ותיקונים קריטיים במשך 12 חודשים
- **גרסאות ישנות**: תמיכה קהילתית בלבד, ללא עדכונים רשמיים

### הנחיות למעבר
כאשר משחררים גרסאות ראשיות, אנו מספקים:
- **מדריכי מעבר**: הוראות שלב-אחר-שלב למעבר
- **הערות תאימות**: פרטים על שינויים שבורים
- **תמיכה בכלים**: סקריפטים או כלים המסייעים במעבר
- **תמיכה קהילתית**: פורומים ייעודיים לשאלות מעבר

---

**ניווט**
- **שיעור קודם**: [Study Guide](resources/study-guide.md)
- **שיעור הבא**: חזרה לקובץ [Main README](README.md)

**השאר מעודכן**: עקוב אחרי מאגר זה לקבלת התראות על שחרורים חדשים ועדכונים חשובים לחומרי הלמידה.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->