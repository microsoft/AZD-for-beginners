# יומן שינויים - AZD למתחילים

## מבוא

יומן שינויים זה מתעד את כל השינויים, העדכונים והשיפורים הבולטים במאגר AZD למתחילים. אנו פועלים לפי עקרונות ניהול גרסאות סמנטיות ומחזיקים יומן זה כדי לסייע למשתמשים להבין מה השתנה בין הגרסאות.

## מטרות למידה

על ידי סקירת יומן השינויים, תוכלו:
- להישאר מעודכנים לגבי תכונות חדשות ותוספות תוכן
- להבין שיפורים שנעשו לתיעוד קיים
- לעקוב אחר תיקוני באגים ותיקונים להבטחת דיוק
- לעקוב אחר התפתחות חומרי הלמידה לאורך זמן

## תוצאות למידה

לאחר סקירת רשומות יומן השינויים, תוכלו:
- לזהות תוכן חדש ומשאבים זמינים ללמידה
- להבין אילו חלקים עודכנו או שופרו
- לתכנן את מסלול הלמידה שלכם על בסיס החומרים העדכניים ביותר
- לתרום משוב והצעות לשיפורים עתידיים

## היסטוריית גרסאות

### [v3.24.0]- 2026-11-04

#### תוקן
- תוקנה ניווט הקורס באנגלית, שבילי דפים מועברים, עוגנים חסרים, והפניות חיצוניות מיושנות, כולל קישור פרק 2 למדריך AI להפקה.
- נסקרה ההנחיה הנוכחית נגד AZD 1.37.2 שפורסמה, סוכנים 1.0.0-beta.23, והערכות 1.0.0-beta.2. תועד זרימת העבודה הנפרדת `azd ai eval` והגירת תצורת האופטימיזציה.
- תוקנו דגלים לא נתמכים ב-CLI, גבולות אימות, הנחיות לסביבה/סודות טקסט פשוט, עדכוני תשתיות, הגדרת מודל, ודוגמאות שחזור הרסניות.
- רועננה הסדנה נגד דוגמת סוכני AI הנוכחיים, כולל ווים אמיתיים, קלטי תצורה, בדיקות הערכה, נקודות כניסה לצוות אדום, ותצפית.
- תוקנו טענות יישום לדוגמה ותוקנו בעיות קשורות באפליקציה/תשתית/תצורה. חומר הארכיטקטורה למסחר מובחן במפורש מאפליקציה עובדת מלאה.
- שוחזרה מטריצת שפת CodeQL, נבחר Node.js 24 נתמך למיכל הפיתוח, וגורמי אישור הקמה מדווחים על פקודות גרסאות שנכשלו.

#### נוסף
- בודק קישורים/עוגנים לא מקוונים באנגלית בלבד, בדיקות רגרסיה, וזרימת עבודה לתיעוד שבונה גם את הסדנה במצב מחמיר. אין לכלול תרגומים שנוצרו ותמונות מתורגמות.

#### טווח אימות
- בדיקות מקור, תחביר, תצורה, התנהגות מקומית, וקישור רשת אינן מבהירות את יכולת הפריסה הפעילה של Azure, מכסת שימוש, RBAC, זמינות מודלים אזוריים, חיוב, תאימות אבטחה, או מוכנות להפקה.
- רשומות ישנות למטה הינן רשומות היסטוריות, לא הוראות פקודה או שחרור נוכחיות.

### [v3.23.0] - 2026-07-13

#### ריענון AZD 1.27.1: עדכון עדכניות גרסה
**גרסה זו מאמתת מחדש את הקורס נגד `azd` `1.27.1` (יולי 2026, שחרור יציב אחרון) והרחבת סוכן ה-AI בתצוגה מקדימה הנוכחית `azure.ai.agents` `1.0.0-beta.5`, ומביאה את כל הבאנרים "מאומת נגד" לעדכון לאחר שחרורים 1.26.0, 1.27.0, ו-1.27.1.**

#### שונה
- **✅ עדכון בסיס אימות** מ-`azd 1.25.6` (יוני 2026) ל-`azd 1.27.1` (יולי 2026) בקובץ README ראשי, כל קבצי README של הפרקים, שיעור מיכל הפיתוח בפרק 1 (כולל דוגמאות גרסה נעוצה), שיעור תבניות מותאמות בפרק 4, שיעור רב-סוכן בפרק 5, ותיעוד הסדנה
- **🤖 ריענון בסיס פרק 2** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.27.1` ב-`agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, ו-`microsoft-foundry-integration.md`; תאריכי הערות אימות עודכנו ל-2026-07-13
- **🧩 שדרוג הרחבת סוכן AI** מ-`azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` לשחרור הנוכחי `1.0.0-beta.5` בקובץ README של פרק 2 ו-`agents.md`
- **🧪 דוגמת אימות בסדנה** (פלט `azd version`) עודכנה ל-`1.27.1`

#### הערות על שחרורי azd רלוונטיים (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** תמיכת Go ב-Azure Functions ב-Flex Consumption, מסנני מנוי על פי שוכר `azd config sub-filter`, חבילות הרחבה עצמאיות (`azd x pack --bundle`), ו-`azd tool install azure-skills`
- **1.27.0 (2026-06-30):** יצירת פרויקטים/סוכנים של Model Azure AI Foundry ישירות ב-`azure.yaml` (אתחול ללא Bicep/Terraform), תמיכת פריסת מיכלים ל-App Service (`host: appservice` + `language: docker`), ישירות `-s/--source` לפקודות `azd extension`, ו-`azd tool uninstall`
- **1.27.1 (2026-07-09):** דגל `--no-dependencies` ל-`azd extension install`, דגמים מיושנים שאינם כלולים כברירת מחדל בהנחיות קטלוג/מכסה, וכמה תיקוני באגים

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

#### מילוי פער מתחילים #2: כתיבת תבניות, מיכלי פיתוח, Pulumi, Azure DevOps, שירותי עיקרי, ועוד
**גרסה זו סוגרת את הפערים הבינוניים שנותרו שזוהו על ידי הניתוח azd-coverage: כיצד לכתוב ולפרסם תבנית משלך, סביבות מיכליות/קודספייסים שניתנות לשחזור, ספק תשתית Pulumi, סיור CI/CD ב-Azure DevOps, אימות שירותי עיקרי, הנחיות לבחירת מארח (AKS/Spring Apps), הסברים על `azd restore`/`azd package`, טיפול בשגיאות ווים, ופרקטיקות סביבת צוות/משותפת.**

#### נוסף
- **🧱 שיעור פרק 4 חדש** `docs/chapter-04-infrastructure/custom-templates.md` — כתיבת תבנית azd משלך: מבנה נדרש (`azure.yaml`, `infra/`, `src/`), השדה `metadata.template`, פרמטריזציה של תשתית עם אסימון המשאב `uniqueString()` ותווית `azd-env-name`, בדיקות מקומיות עם `azd init --template <local-path>`, פרסום ל-GitHub, ושליחה לגלריית Awesome AZD
- **📦 שיעור פרק 1 חדש** `docs/chapter-01-foundation/dev-containers.md` — סביבות azd שניתנות לשחזור עם מיכלי פיתוח ו-GitHub Codespaces: מינימום `.devcontainer/devcontainer.json` המשתמש במאפיין הרשמי `ghcr.io/azure/azure-dev/azd`, תכונות ייעודיות לשפה, `docker-in-docker` למארחי מיכל, ו-`azd auth login --use-device-code` להתחברות מרחוק
- **🧩 Pulumi עם azd** בסעיף `docs/chapter-04-infrastructure/provisioning.md` — תיאור `infra.provider: pulumi`, פריסת תיקיית Pulumi, מחסניות שמתאימות לסביבות azd, פלטים/תיוגים נדרשים, וזרימת עבודה זהה של `azd up` / `azd down`
- **🎯 הנחיות לבחירת מארח** ב-`docs/chapter-04-infrastructure/provisioning.md` — השוואה ידידותית למתחילים בין `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, ו-`springapp`, עם הנחיה מתי לבחור AKS או Azure Spring Apps
- **🛠️ סיור CI/CD ב-Azure DevOps** ב-`docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, חיבור שירות עם פדרציית זהות עבודה (OIDC), `azure-dev.yml` שנוצר, והגדרת קבוצת משתנים
- **🔑 שירותי עיקרי (Pattern 4)** נוסף ל-`docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` לא אינטראקטיבי עם סוד לקוח לעומת אישורים פדרטיביים/OIDC, מתי להשתמש, ואחסון מאובטח של האישורים
- **🪝 טיפול בשגיאות ווים** תת-סעיף ב-`docs/chapter-04-infrastructure/deployment-guide.md` — קודי יציאה ו-`set -e`, `continueOnError`, בדיקות ווים בבידוד באמצעות `azd hooks run`, סביבות פקודה מותאמות OS, ו-`--debug`
- **👥 סביבת צוות / משותפת** בסעיף `docs/chapter-03-configuration/configuration.md` — מה נמצא ב-`.azure/`, מה לכלול ב-gitignore, סביבות למפתח יחיד, `azd env list`/`select`, ומתן ערכי סביבה ב-CI/CD
- **🧰 הסברים על `azd restore` ו-`azd package` מורחבים** ב-`resources/cheat-sheet.md` — שיחזור תלות והקמת ארטיפקט ניתן לפריסה ללא פריסה

#### שונה
- **🧭 טבלת שיעורי פרק 4** עודכנה לכלול את שיעור חדש "כתיבת התבנית שלך" (שיעור 3)
- **🧭 טבלת שיעורי פרק 1** עודכנה לכלול את שיעור חדש "מיכלי פיתוח וקודספייסים" (שיעור 5); כתמי ניווט מחוברים בין `bring-your-own-app.md` ו-`dev-containers.md`

### [v3.21.0] - 2026-06-16

#### מילוי פער מתחילים: שיעור מעשי רב-סוכן, "הבא את האפליקציה שלך," Terraform, וסיור CI/CD
**גרסה זו סוגרת את הפערים הגדולים להדרכה מלאה למתחילים על ידי הוספת שני שיעורים מעשיים חדשים (סיור פריסה רב-סוכן והוספת azd לאפליקציה קיימת), הקדמה ידידותית לווים, סעיף Terraform עם azd, סיור צעד אחר צעד בצינור GitHub Actions, הסבר להרחבות התצוגה המקדימה החדשות, ורשימת בדיקה מפורשת לאימות פריסה.**

#### נוסף
- **🤝 שיעור פרק 5 חדש** `docs/chapter-05-multi-agent/multi-agent-basics.md` — סיור פריסה מעשי מלא בשני סוכנים (מנתח + מומחים) עם תבנית אמיתית (`contoso-creative-writer`), כולל מתי להשתמש ברב-סוכן, זרימת העבודה `azd up`, הבנת המשאבים המפורסמים, מעקב רוחבי בין סוכנים, התאמה אישית, וניקוי
- **📦 שיעור פרק 1 חדש** `docs/chapter-01-foundation/bring-your-own-app.md` — כיצד להוסיף azd לפרויקט קיים עם `azd init` ("השתמש בקוד בתיקיה הנוכחית"), הבנת `azure.yaml` ו-`infra/`, `azd infra generate`, זיהוי מארח, ופריסה עם `azd up`
- **🌐 Terraform עם azd** נוסף לסעיף `docs/chapter-04-infrastructure/provisioning.md` — תצורת `infra.provider: terraform`, פריסת תיקיית `.tf`, פלטים דרושים ותיוג `AZURE_*` ו-`azd-env-name`, וזרימת עבודה זהה של `azd up` / `azd down` (מסיים את הפער בו נדרשה תמיכה ב-Terraform אך הוצג רק Bicep)
- **⚙️ סיור GitHub Actions צעד אחר צעד** ב-`docs/chapter-08-production/production-ai-practices.md` — ממרפוזיטורי GitHub לפריסות אוטומטיות: `azd pipeline config`, אישורי OIDC פדרטיביים (ללא סודות מאוחסנים), `azure-dev.yml` שנוצר, והנחיות סודות-לעומת-משתנים
- **🪝 מבוא "חדש לווים?"** ב-`docs/chapter-04-infrastructure/deployment-guide.md` — מהו וו, טבלת שלבי וו, וו ראשון מינימלי, והרצת ווים ידנית באמצעות `azd hooks run`
- **✅ נוספה רשימת בדיקה "אמת את הפריסה שלך"** לשלב 5 של `docs/chapter-01-foundation/first-project.md` — בדיקת עשן, בדיקת נקודת קצה בריאות, וקריטריוני הצלחה מפורשים
- **🧩 הסבר להרחבות תצוגה מוקדמת חדשות** `azure.ai.skills` ו-`azure.ai.connections` (מה הן ומתי להשתמש בהן) ב-`docs/chapter-08-production/production-ai-practices.md`

#### שונה
- **🧭 טבלת שיעורי פרק 5** תוקנה: `multi-agent-basics.md` הוא כעת שיעור 1 (השיעור המעשי היחיד במלואו), עם תיוג כן-הגון ששיעור 2 נמצא בפרק 6 ותרחיש הקמעונאות הוא תבנית ארכיטקטורה, לא תבנית פקודה בודדת
- **🧭 טבלת שיעורי פרק 1** כוללת כעת את השיעור החדש "הבא את האפליקציה שלך" (שיעור 4)
- **🔗 כתמי ניווט** עודכנו: `first-project.md` עתה מקושרת קדימה ל-`bring-your-own-app.md`

#### תוקן
- **🧱 סגור פער Terraform שהיה מוקרן אך חסר** — הקורס התייחס קודם לתמיכה ב-Terraform אך לא הציג אותה
- **🔀 תוקנו קישורים שגויים בין פרקים בפרק 5** שהרמזו על מימוש רב-סוכן מלא כאשר בפועל הייתה רק תבנית ארכיטקטורה

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

#### רענון AZD 1.25.6, פקודות מחזור חיים מלא של סוכן ומיתוג Aspire מחדש
**גרסה זו מאמתת מחדש את הקורס מול `azd` `1.25.6` (יוני 2026) ו-`azure.ai.agents` `0.1.40-preview` הרחבה, מרחיבה את ההדרכה של AI מ"לבנות סוכן" למחזור החיים המלא של הסוכן (בדיקה → הערכה → אופטימיזציה → בדיקה → מחיקה), מציגה את ההרחבות החדשות `azure.ai.skills` ו-`azure.ai.connections` במצב תצוגה מוקדמת, ומציינת את המיתוג מחדש של המוצר ".NET Aspire" ל-"Aspire".**

#### נוספו
- **🔁 כיסוי מלא למחזור חיי הסוכן** למתחילים ומהנדסי AI בכל התיעוד:
  - `docs/chapter-01-foundation/azd-basics.md` — טבלת מחזור חיים (scaffold → test → measure → improve → inspect → clean up) נוספה למדור הרחבות ופקודות AI
  - `docs/chapter-08-production/production-ai-practices.md` — מדור חדש "ניהול מחזור חיים של סוכן" המכסה את `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`
  - `resources/cheat-sheet.md` — הרחבת פקודות סוכן AI עם `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`
- **🧩 תיעוד של הרחבות תצוגה מוקדמת חדשות**: `azure.ai.skills` (כישורי סוכן לשימוש חוזר) ו-`azure.ai.connections` (קישורי Foundry) נוספו לטבלת ההרחבות ולעלון העזר
- **⏱️ הדרכת זמני תגובה** — דוגמאות `azd ai agent invoke` כעת מציינות שהן מדפיסות את זמן ההשהיה הכולל וזמן לבייט הראשון
- **📌 באנר גרסה** בקובץ README הראשי שמכוון את הלומדים ל-`azd version` ו-`azd upgrade`

#### שונו
- **✅ עדכון קו בסיס אימות** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.25.6` (יוני 2026) בכל קובצי README של הפרקים ותיעוד הסדנה
- **🤖 עדכון הערת הרחבה בפרק 2** מ-`azure.ai.agents` `0.1.18-preview` ל-`0.1.40-preview`
- **🧪 עדכון דוגמת ולידציה בסדנה** (פלט `azd version`) ל-`1.25.6`
- **🧭 רענון README "מה חדש ב-azd היום"** להדגשת מחזור חיים מלא של הסוכן, הרחבות AI חדשות ותיקוני איכות חיים עדכניים (`azd init` עמידות, `azd auth login` ניקוי אסימון לא בתוקף, `azd tool` פרומפט הרצה ראשונה)
- **📖 agents.md בפרק 2 (אפשרות 4)** כעת מפנה את הלומדים לפקודות מחזור חיים לאחר פריסה במקום לעצור ב-`azd up`

#### תוקנו
- **🏷️ מיתוג מוצר** — נוספה הערה על מיתוג Aspire מחדש (".NET Aspire" הוא כעת פשוט "Aspire"); התמיכה של azd ב-Aspire לא השתנתה
- **🔎 אימות שחרור חי** אושר מול מזין שחרורי Azure Developer CLI: גרסה יציבה של CLI `1.25.6` (2026-06-12) ו-`azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### הבהרה להדרכת מתחילים, אימות הגדרות וניקוי פקודות AZD סופיות
**גרסה זו ממשיכה את סריקת האימות של AZD 1.23 עם מעבר תיעוד ממוקד מתחילים: היא מבהירה הנחיות אימות AZD ראשוניות, מוסיפה סקריפטים לאימות הגדרות מקומיות, מאמתת פקודות מפתח מול ה-AZD CLI החי, ומסירה את כל הפניות לפקודות ישנות במקור האנגלי מחוץ ליומן השינויים.**

#### נוספו
- **🧪 סקריפטים לאימות הגדרת מתחילים** עם `validate-setup.ps1` ו-`validate-setup.sh` כך שיוכלו לוודא את כל הכלים הנדרשים לפני תחילת פרק 1
- **✅ שלבי אימות הגדרות מוקדמים** ב-README הראשי וב-README פרק 1 כדי לתפוס חוסרי דרישות מוקדמות לפני `azd up`

#### שונו
- **🔐 הדרכת אימות למתחילים** כעת מתייחסת בעקביות ל-`azd auth login` כנתיב הראשי לעבודה עם AZD, כאשר `az login` מצוין כאופציונלי אלא אם משתמשים ישירות בפקודות Azure CLI
- **📚 זרם הדרכת פרק 1** כעת מפנה את הלומדים לאמת את הגדרות מקומם לפני שלבי התקנה, אימות והפעלה ראשונה
- **🛠️ הודעות המאמת** מפרידות כעת בבירור בין דרישות שמונעות המשך לדרישות אופציונליות של אזהרות Azure CLI עבור נתיב מתחילים ב-AZD בלבד
- **📖 תיעוד קונפיגורציה, פתרון בעיות ודוגמאות** מבחין בין אימות AZD חובה לבין התחברות Azure CLI אופציונלית כאשר היו מוצגים ללא הקשר קודם לכן

#### תוקנו
- **📋 עדכון הפניות לפקודות מקוריות באנגלית שנותרו** לצורות AZD עדכניות, כולל `azd config show` בעלון העזר ו-`azd monitor --overview` כאשר כוונה להדרכת סקירת פורטל Azure
- **🧭 טענות למתחילים בפרק 1** הועמדו כדי למנוע התחייבויות מופרזות להתנהגות ללא שגיאות או חזרה על כל התבניות ומשאבי Azure
- **🔎 אימות CLI חי** אושר תמיכה נוכחית ב-`azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, ו-`azd down --force --purge`

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

#### אימות AZD 1.23.12, הרחבת סביבה בסדנה ורענון מודל AI
**גרסה זו מבצעת סריקת אימות תיעוד נגד `azd` `1.23.12`, מעדכנת דוגמאות פקודות AZD מיושנות, מרעננת הנחיית מודל AI לברירות המחדל העדכניות, ומרחיבה את הוראות הסדנה מעבר ל-GitHub Codespaces לתמיכה בכלי פיתוח וקבצים מקומיים.**

#### נוספו
- **✅ הערות אימות בכל פרקי הליבה ותיעוד הסדנה** כדי להבהיר את קו הבסיס של AZD שנבדק ללומדים המשתמשים בבניות CLI חדשות או ישנות
- **⏱️ הדרכת זמן-הפסקה לפריסה** עבור פריסות יישומי AI ארוכות עם `azd deploy --timeout 1800`
- **🔎 שלבי בדיקת הרחבות** עם `azd extension show azure.ai.agents` בתיעוד זרימות AI
- **🌐 הדרכה רחבה יותר לסביבת הסדנה** הכוללת GitHub Codespaces, מכולות פיתוח וקלונים מקומיים עם MkDocs

#### שונו
- **📚 קובצי README לפתיחת פרקים** כעת מציינים בעקביות אימות מול `azd 1.23.12` בכל מדורי הבסיס, קונפיגורציה, תשתית, ריבוי סוכנים, טרום פריסה, פתרון בעיות וייצור
- **🛠️ הפניות לפקודות AZD** עודכנו לצורות נוכחיות בכל התיעוד:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` או `azd env get-value(s)` תלוי בהקשר
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` כאשר כוונה לסקירת Application Insights
- **🧪 דוגמאות פריוויז'ן מופשטות** לפשט את השימוש הנתמך, כגון `azd provision --preview` ו-`azd provision --preview -e production`
- **🧭 זרם הסדנה** עודכן כך שהלומדים יוכלו להשלים את המעבדות ב-Codespaces, מכולת פיתוח, או קלון מקומי במקום להניח הפעלה רק ב-Codespaces
- **🔐 הדרכת אימות** מעדיפה כעת את `azd auth login` עבור זרימות עבודה עם AZD, עם `az login` כאופציונלי כאשר משתמשים ישירות בפקודות Azure CLI

#### תוקנו
- **🪟 פקודות התקנה ל-Windows** נוסחו מחדש בהתאמה לעטיפת החבילה הנוכחית `winget` במדריך ההתקנה
- **🐧 הנחיות התקנה ל-Linux** תוקן כדי להימנע מהוראות מנהל חבילות `azd` ספציפיות להפצות שאינן נתמכות ובמקום זאת להפנות לנכסי השחרור כאשר זה מתאים
- **📦 דוגמאות למודלים של AI** עודכנו מדוגמאות ישנות כמו `gpt-35-turbo` ו-`text-embedding-ada-002` לדוגמאות עדכניות כמו `gpt-4.1-mini`, `gpt-4.1`, ו-`text-embedding-3-large`
- **📋 קטעי פריסה ואבחון** תוקנו לשימוש בפקודות הסביבה והסטטוס הנכונות ביומנים, בסקריפטים ובצעדים לפתרון בעיות
- **⚙️ הנחיות פעולות GitHub** עודכנו מ-`Azure/setup-azd@v1.0.0` ל-`Azure/setup-azd@v2`
- **🤖 הנחיות הסכמת MCP/Copilot** עודכנו מ-`azd mcp consent` ל-`azd copilot consent list`

#### שופר
- **🧠 הדרכת פרק AI** מסבירה עכשיו טוב יותר את התנהגות `azd ai` הרגישה לתצוגה מקדימה, כניסה ספציפית לשוכר, שימוש נוכחי בהרחבה, והמלצות מעודכנות לפריסת מודל
- **🧪 הוראות לסדנה** משתמשות כעת בדוגמאות גרסה מציאותיות יותר ובשפת הגדרת סביבה ברורה יותר למעבדות מעשיות
- **📈 מסמכי הפקה ופתרון בעיות** מתאימים עכשיו טוב יותר לניטור נוכחי, מודל גיבוי ודוגמאות של רמות עלות

#### קבצים שעודכנו
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
**גרסה זו מוסיפה כיסוי לפקודות `azd ai`, `azd extension`, ו-`azd mcp` בכל הפרקים הקשורים ב-AI, מתקנת קישורים שבורים וקוד מיושן ב-agents.md, מעדכנת את דף הרמאויות, ומשנה את מדור דוגמנות התבניות עם תיאורים מאומתים ותבניות Azure AI AZD חדשות.**

#### נוסף
- **🤖 כיסוי AZD AI CLI** ב-7 קבצים (קודם לכן רק בפרק 8):
  - `docs/chapter-01-foundation/azd-basics.md` — מדור חדש "הרחבות ופקודות AI" המציג את `azd extension`, `azd ai agent init`, ו-`azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — אפשרות 4: `azd ai agent init` עם טבלת השוואה (גישה של תבנית לעומת מניפסט)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — תתי-מדורים "הרחבות AZD עבור Foundry" ו-"פריסת סוכנים ראשונית"
  - `docs/chapter-05-multi-agent/README.md` — התחלה מהירה מציגה כעת גם את נתיבי הפריסה מבוססי תבניות ומניפסט
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — סעיף הפריסה כולל כעת את האפשרות `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — תת-סעיף "פקודות הרחבת AZD AI לאבחון"
  - `resources/cheat-sheet.md` — סעיף חדש "פקודות AI והרחבות" עם `azd extension`, `azd ai agent init`, `azd mcp`, ו-`azd infra generate`
- **📦 תבניות דוגמה חדשות ל-AZD AI** ב-`microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — שיחת RAG ב-.NET עם Blazor WebAssembly, Semantic Kernel, ותמיכה בשיחת קול
  - **azure-search-openai-demo-java** — שיחת RAG בג'אווה המשתמשת ב-Langchain4J עם אפשרויות פריסה ACA/AKS
  - **contoso-creative-writer** — אפליקציית כתיבה יצירתית רב-סוכנית המשתמשת ב-Azure AI Agent Service, Bing Grounding, ו-Prompty
  - **serverless-chat-langchainjs** — RAG ללא שרת המשתמש ב-Azure Functions + LangChain.js + Cosmos DB עם תמיכה בפיתוח מקומי ב-Ollama
  - **chat-with-your-data-solution-accelerator** — מאיץ RAG ארגוני עם פורטל ניהול, אינטגרציה עם Teams, ואפשרויות PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — אפליקציית הפניה לארכיטקטורה של MCP מרובת סוכנים עם שרתים ב-.NET, Python, Java, ו-TypeScript
  - **azd-ai-starter** — תבנית התחלה מינימלית בתשתית Azure AI ב-Bicep
  - **🔗 קישור לגלריית AZD AI מדהימה** — הפניה ל-[גלריית AI מדהימה של azd](https://azure.github.io/awesome-azd/?tags=ai) (מעל 80 תבניות)

#### תוקנו
- **🔗 ניווט agents.md**: קישורי הקודם/הבא תואמים כעת לסדר השיעורים בפרק 2 README (אינטגרציית Microsoft Foundry → סוכנים → פריסת מודל AI)
- **🔗 קישורים שבורים ב-agents.md**: `production-ai-practices.md` תוקן ל-`../chapter-08-production/production-ai-practices.md` (3 הופעות)
- **📦 קוד מיושן ב-agents.md**: הוחזר `opencensus` עם `azure-monitor-opentelemetry` + SDK של OpenTelemetry
- **🐛 API לא תקין ב-agents.md**: הועבר `max_tokens` מ-`create_agent()` ל-`create_run()` כ`max_completion_tokens`
- **🔢 ספירת Token ב-agents.md**: הוערכה מחדש מ-`len//4` ל-`tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: תוקנו השירותים מ-"Cognitive Search + App Service" ל-"Azure AI Search + Azure Container Apps" (מארח ברירת מחדל שונה לאוקטובר 2024)
- **contoso-chat**: תיאור עודכן כך שיתייחס ל-Azure AI Foundry + Prompty, בהתאמה לכותרת ואחסון הטכנולוגיה של הרפו

#### הוסר
- **ai-document-processing**: הוסר הפניה לתבנית לא פונקציונלית (הרפו אינו זמין באופן ציבורי כתבנית AZD)

#### שופר
- **📝 תרגילים ב-agents.md**: תרגיל 1 מציג כעת פלט צפוי ו`azd monitor` שלב; תרגיל 2 כולל קוד רישום מלא של `FunctionTool`; תרגיל 3 מחליף הנחיות בלתי מוגדרות בפקודות מוחשיות של `prepdocs.py`
- **📚 משאבים ב-agents.md**: קישורי תיעוד עודכנו למסמכי שרות סוכני Azure AI הנוכחיים והתחלה מהירה
- **📋 טבלת השלבים הבאים ב-agents.md**: נוספה קישור למעבדת סדנת AI לכיסוי מלא של הפרק

#### קבצים עודכנו
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### שיפור ניווט הקורס
**גרסה זו משפרת את ניווט הפרקים ב-README.md עם פורמט טבלה משודרג.**

#### שונה
- **טבלת מפה של הקורס**: משודרגת עם קישורים ישירים לשיעורים, הערכות זמן ומדדי מורכבות
- **ניקוי תיקיות**: הוסרו תיקיות מיותרות ועתיקות (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **אימות קישורים**: אושרו מעל 21 קישורים פנימיים בטבלת מפה של הקורס

### [v3.16.0] - 2026-02-05

#### עדכוני שמות מוצרים
**גרסה זו מעדכנת הפניות למוצר בהתאם למיתוג Microsoft הנוכחי.**

#### שונה
- **Microsoft Foundry → Microsoft Foundry**: כל ההפניות עודכנו בכל המסמכים הלא מתורגמים
- **Azure AI Agent Service → Foundry Agents**: שם השירות עודכן לשקף את המיתוג הנוכחי

#### קבצים עודכנו
- `README.md` - דף כניסה עיקרי לקורס
- `changelog.md` - היסטוריית גרסאות
- `course-outline.md` - מבנה הקורס
- `docs/chapter-02-ai-development/agents.md` - מדריך לסוכני AI
- `examples/README.md` - תיעוד דוגמאות
- `workshop/README.md` - דף כניסה לסדנה
- `workshop/docs/index.md` - אינדקס סדנה
- `workshop/docs/instructions/*.md` - כל קבצי ההדרכה של הסדנה

---

### [v3.15.0] - 2026-02-05

#### ארגון מחדש משמעותי של מאגר: תיקיות מבוססות פרקים
**גרסה זו מארגנת את התיעוד לתוך תיקיות מוקדשות לכל פרק לניווט ברור יותר.**

#### שינוי שמות תיקיות
תיקיות ישנות הוחלפו בתיקיות ממוספרות לפי פרק:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- נוסף חדש: `docs/chapter-05-multi-agent/`

#### העברות קבצים
| קובץ | מ-| ל- |
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
| כל הקבצים של pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| כל הקבצים של troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### נוסף
- **📚 קבצי README של פרקים**: נוצר README.md בכל תיקיית פרק הכולל:
  - מטרות למידה ומשך זמן
  - טבלת שיעורים עם תיאורים
  - פקודות התחלה מהירה
  - ניווט לפרקים אחרים

#### שונה
- **🔗 עדכון כל הקישורים הפנימיים**: מעל 78 נתיבים עודכנו בכל מסמכי התיעוד
- **🗺️ README.md ראשי**: עדכון מפה הקורס עם מבנה פרקי חדש
- **📝 examples/README.md**: עדכון הפניות חוצות לתיקיות הפרקים

#### הוסר
- מבנה תיקיות ישן (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ארגון מחדש של המאגר: ניווט פרקים
**גרסה זו הוסיפה קבצי README לניווט בפרקים (הוחלפה בגרסה v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### מדריך חדש לסוכני AI
**גרסה זו מוסיפה מדריך מקיף לפריסת סוכני AI עם Azure Developer CLI.**

#### נוסף
- **🤖 docs/microsoft-foundry/agents.md**: מדריך שלם המכסה:
  - מהו סוכני AI וכיצד הם שונים מבוטי שיחה
  - שלוש תבניות התחלה מהירה לסוכנים (Foundry Agents, Prompty, RAG)
  - דפוסי ארכיטקטורה של סוכנים (סוכן יחיד, RAG, מרובי סוכנים)
  - הגדרה והתאמה אישית של כלים
  - מעקב ומדידת נתונים
  - שיקולי עלות ואופטימיזציה
  - תרחישי פתרון בעיות נפוצים
  - שלושה תרגילים מעשיים עם קריטריוני הצלחה

#### מבנה תוכן
- **הקדמה**: מושגי סוכנים למתחילים
- **התחלה מהירה**: פריסת סוכנים עם `azd init --template get-started-with-ai-agents`
- **דפוסי ארכיטקטורה**: דיאגרמות ויזואליות של דפוסי סוכנים
- **הגדרה**: התקנת כלים ומשתני סביבה
- **מעקב**: אינטגרציה עם Application Insights
- **תרגילים**: למידה מעשית מדורגת (20-45 דקות כל אחד)

---

### [v3.12.0] - 2026-02-05

#### עדכון סביבת DevContainer
**גרסה זו מעדכנת את קונפיגורציית מכולת הפיתוח עם כלים מודרניים וערכי ברירת מחדל משופרים לחוויית הלמידה ב-AZD.**

#### שונה
- **🐳 תמונת בסיס**: עודכנה מ-`python:3.12-bullseye` ל-`python:3.12-bookworm` (גרסת Debian יציבה עדכנית)
- **📛 שם המכולה**: שונה מ-"Python 3" ל-"AZD למתחילים" לצורך בהירות

#### נוסף
- **🔧 תכונות חדשות במכולת פיתוח**:
  - `azure-cli` עם תמיכה ב-Bicep מופעלת
  - `node:20` (גרסת LTS לתבניות AZD)
  - `github-cli` לניהול תבניות
  - `docker-in-docker` לפריסות אפליקציות מכולה

- **🔌 העברת פורטים**: פורטים מוגדרים מראש לפיתוח שכיח:
  - 8000 (תצוגה מקדימה MkDocs)
  - 3000 (אפליקציות ווב)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 תוספים חדשים ל-VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense משופר בפייתון
  - `ms-azuretools.vscode-azurefunctions` - תמיכה ב-Azure Functions
  - `ms-azuretools.vscode-docker` - תמיכה ב-Docker
  - `ms-azuretools.vscode-bicep` - תמיכה בשפת Bicep
  - `ms-azure-devtools.azure-resource-groups` - ניהול משאבים ב-Azure
  - `yzhang.markdown-all-in-one` - עריכת Markdown
  - `DavidAnson.vscode-markdownlint` - בדיקת Markdown
  - `bierner.markdown-mermaid` - תמיכה בדיאגרמות Mermaid
  - `redhat.vscode-yaml` - תמיכת YAML (עבור azure.yaml)
  - `eamodio.gitlens` - ויזואליזציית Git
  - `mhutchie.git-graph` - היסטוריית Git

- **⚙️ הגדרות VS Code**: נוספו הגדרות ברירת מחדל לפרשן פייתון, פורמט בעת שמירה, וגזירת מרווחים

- **📦 דרישות מעודכנות ב-requirements-dev.txt**:
  - נוסף תוסף לכיווץ MkDocs
  - נוסף pre-commit לאיכות קוד
  - נוספו חבילות Azure SDK (azure-identity, azure-mgmt-resource)

#### תוקן
- **פקודת Post-Create**: כעת בודקת התקנת AZD ו-Azure CLI בהפעלת המכולה

---

### [v3.11.0] - 2026-02-05

#### שדרוג README ידידותי למתחילים
**גרסה זו משפרת משמעותית את README.md להיות נגיש יותר למתחילים ומוסיפה משאבים חיוניים למפתחי AI.**

#### נוסף
- **🆚 השוואת Azure CLI מול AZD**: הסבר ברור מתי להשתמש בכל כלי עם דוגמאות מעשיות
- **🌟 קישורים מדהימים ל-AZD**: קישורים ישירים לגלריית תבניות קהילה ומשאבי תרומה:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - מעל 200 תבניות מוכנות לפריסה
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - תרומת קהילה
- **🎯 מדריך התחלה מהירה**: קטע התחלה פשוט בשלושה שלבים (התקנה → התחברות → פריסה)
- **📊 טבלת ניווט מבוססת ניסיון**: הנחיות ברורות מהיכן להתחיל בהתאם לניסיון המפתח

#### שונה
- **מבנה README**: אורגן מחדש לגילוי הדרגתי - מידע מרכזי תחילה
- **קטע מבוא**: נכתב מחדש כדי להסביר את "הקסם של `azd up`" למתחילים גמורים
- **הסרת תוכן כפול**: הושמט קטע פתרון הבעיות הכפול
- **פקודות פתרון בעיות**: תוקן הפניה ל-`azd logs` לשימוש ב-`azd monitor --logs` תקין

#### תוקן
- **🔐 פקודות אימות**: נוספו `azd auth login` ו-`azd auth logout` ל-cheat-sheet.md
- **הפניות לפקודות לא תקינות**: הוסר `azd logs` הנותר מקטע פתרון הבעיות ב-README

#### הערות
- **תחום**: השינויים הוחלו ב-README.md הראשי וב-resources/cheat-sheet.md
- **קהל יעד**: שיפורים המכוונים במיוחד למפתחים חדשים ל-AZD

---

### [v3.10.0] - 2026-02-05

#### עדכון דיוק פקודות Azure Developer CLI
**גרסה זו מתקנת פקודות AZD שלא קיימות בתיעוד, ומבטיחה שכל דוגמאות הקוד משתמשות בסינטקס תקין של Azure Developer CLI.**

#### תוקן
- **🔧 הסרת פקודות AZD לא קיימות**: בדיקה מקיפה ותיקון פקודות לא תקינות:
  - `azd logs` (לא קיימת) → הוחלפה ב-`azd monitor --logs` או חלופות ב-Azure CLI
  - פקודות משנה `azd service` (לא קיימות) → הוחלפו ב-`azd show` ו-Azure CLI
  - `azd infra import/export/validate` (לא קיימות) → הוסרו או הוחלפו בחלופות תקינות
  - דגלים `azd deploy --rollback/--incremental/--parallel/--detect-changes` (לא קיימים) → הוסרו
  - דגלים `azd provision --what-if/--rollback` (לא קיימים) → עודכנו לשימוש ב-`--preview`
  - `azd config validate` (לא קיימת) → הוחלפה ב-`azd config list`
  - `azd info`, `azd history`, `azd metrics` (לא קיימות) → הוסרו

- **📚 קבצים עודכנו עם תיקוני פקודות**:
  - `resources/cheat-sheet.md`: שדרוג משמעותי של הפניות פקודה
  - `docs/deployment/deployment-guide.md`: תיקון אסטרטגיות Rollback ופריסה
  - `docs/troubleshooting/debugging.md`: תיקון ניתוח לוגים
  - `docs/troubleshooting/common-issues.md`: עדכון פקודות פתרון בעיות
  - `docs/troubleshooting/ai-troubleshooting.md`: תיקון חלק ניפוי שגיאות של AZD
  - `docs/getting-started/azd-basics.md`: תיקוני פקודות ניטור
  - `docs/getting-started/first-project.md`: דוגמאות מעודכנות לניטור ולניפוי שגיאות
  - `docs/getting-started/installation.md`: תיקוני דוגמאות עזרה וגרסה
  - `docs/pre-deployment/application-insights.md`: תיקוני פקודות לצפייה בלוגים
  - `docs/pre-deployment/coordination-patterns.md`: תיקוני פקודות לניפוי שגיאות סוכן

- **📝 עדכון הפניה לגרסה**: 
  - `docs/getting-started/installation.md`: שונה גרסת `1.5.0` קשיחה ל`1.x.x` גנרית עם קישור לגרסאות

#### שונה
- **אסטרטגיות Rollback**: תעודכן להשתמש ב-Git rollback (AZD לא תומך ב-rollback מקור מלידה)
- **צפייה בלוגים**: החלפת הפניות ל`azd logs` ב`azd monitor --logs`, `azd monitor --live` ופקודות Azure CLI
- **מדור ביצועים**: הסרה של דגלים זמינים בלבד לפריסה מקבילה/הדרגתית, עם חלופות תקינות

#### פרטים טכניים
- **פקודות AZD תקינות**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **דגלי azd monitor תקינים**: `--live`, `--logs`, `--overview`
- **תכונות שהוסרו**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### הערות
- **אימות**: פקודות אומתו מול Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### סיום סדנה ועדכון איכות התיעוד
**גרסה זו משלימה את מודולי הסדנה האינטראקטיביים, מתקן כל הקישורים השבורים בתיעוד ומשפר את איכות התוכן הכללית למפתחים AI המשתמשים ב-Microsoft AZD.**

#### נוספו
- **📝 CONTRIBUTING.md**: מסמך הנחיות לתרומות חדש עם:
  - הוראות ברורות לדיווח על בעיות והצעת שינויים
  - תקני תיעוד לתוכן חדש
  - הנחיות לדוגמאות קוד וקונבנציות להודעות התחייבות
  - מידע על מעורבות קהילה

#### הושלם
- **🎯 מודול סדנה 7 (סיכום)**: מודול סיום מלא עם:
  - סיכום מקיף של ההישגים בסדנה
  - מדור מושגים מרכזיים כולל AZD, תבניות ו-Microsoft Foundry
  - המלצות להמשך מסע הלמידה
  - תרגילי אתגר בסדנה עם דירוגי קושי
  - משוב מהקהילה וקישורי תמיכה

- **📚 מודול סדנה 3 (פירוק)**: יעדדי למידה מעודכנים עם:
  - GitHub Copilot עם הדרכה על הפעלת שרתי MCP
  - הבנת מבנה התיקייה של תבניות AZD
  - דפוסי ארגון התשתית כקוד (Bicep)
  - הנחיות למעבדת התנסות מעשית

- **🔧 מודול סדנה 6 (פירוק)**: הושלם עם:
  - ניקוי משאבים ויעדי ניהול עלויות
  - שימוש ב`azd down` לפירוק תשתית בטוח
  - הנחיות לשחזור שירותי קוגניטיב שנמחקו ברישיון רך
  - נקודות חקירה נוספות ל-GitHub Copilot ופורטל Azure

#### תוקן
- **🔗 תיקוני קישורים שבורים**: תוקנו 15+ קישורים פנימיים שבורים בתיעוד:
  - `docs/ai-foundry/ai-model-deployment.md`: תוקנו נתיבי microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: תוקנו נתיבי ai-model-deployment.md ו-production-ai-practices.md
  - `docs/getting-started/first-project.md`: הוחלף cicd-integration.md לא קיים ב-deployment-guide.md
  - `examples/retail-scenario.md`: תוקנו הנתיבים ל-FAQ ומדריך פתרון בעיות
  - `examples/container-app/microservices/README.md`: תוקנו נתיבי דף הבית לקורס ומדריך פריסה
  - `resources/faq.md` ו`resources/glossary.md`: עדכון הפניות לפרק AI
  - `course-outline.md`: תוקנו הפניות למדריך מדריכים ומעבדת סדנה AI

- **📅 כרזה למצב הסדנה**: עודכן מ"בבנייה" למצב סדנה פעילה עם תאריך פברואר 2026

- **🔗 ניווט סדנה**: תיקון קישורי ניווט שבורים ב-README.md של הסדנה המצביעים לתיקיית lab-1-azd-basics שאינה קיימת

#### שונה
- **הצגת סדנה**: הוסר אזהרת "בבנייה", הסדנה כעת שלמה ומוכנה לשימוש
- **עקביות ניווט**: הבטחת כל מודולי הסדנה כוללים ניווט פנימי תקין בין המודולים
- **הפניות למסלול למידה**: עדכון הפניות בין פרקים לשימוש בנתיבים נכונים של microsoft-foundry

#### אומת
- ✅ כל קבצי markdown באנגלית כוללים קישורים פנימיים תקינים
- ✅ מודולי סדנה 0-7 הושלמו עם יעדדי למידה
- ✅ ניווט בין פרקים ומודולים פועל כראוי
- ✅ התוכן מתאים למפתחי AI המשתמשים ב-Microsoft AZD
- ✅ שפה ומבנה ידידותיים למתחילים נשמרים לאורך כל התיעוד
- ✅ CONTRIBUTING.md מספק הנחיות ברורות לתורמי הקהילה

#### מימוש טכני
- **אימות קישורים**: סקריפט PowerShell אוטומטי אימת את כל הקישורים הפנימיים בקבצי .md
- **בדיקת תוכן**: סקירה ידנית של השלמת הסדנה ומתאימות למתחילים
- **מערכת ניווט**: דפוסי ניווט עקביים בין פרקים ומודולים הוחלו

#### הערות
- **היקף**: שינויים חלו רק על תיעוד באנגלית
- **תרגומים**: תיקיות תרגום לא עודכנו בגרסה זו (התרגום האוטומטי יסונכרן מאוחר יותר)
- **משך הסדנה**: סדנה שלמה כעת מספקת 3-4 שעות למידה מעשית

---

### [v3.8.0] - 2025-11-19

#### תיעוד מתקדם: ניטור, אבטחה, ודפוסי ריבוי סוכנים
**גרסה זו מוסיפה שיעורים מקיפים בדרגת A על אינטגרציית Application Insights, דפוסי אימות ותיאום ריבוי סוכנים לפריסות הפקה.**

#### נוספו
- **📊 שיעור אינטגרציית Application Insights**: ב`docs/pre-deployment/application-insights.md`:
  - פריסת AZD ממוקדת עם ספק אוטומטי
  - תבניות Bicep מלאות ל-Application Insights + Log Analytics
  - אפליקציות Python עובדות עם טלמטריה מותאמת (מעל 1,200 שורות)
  - דפוסי ניטור AI/LLM (מעקב על אסימון/עלויות דגמי Microsoft Foundry)
  - 6 דיאגרמות Mermaid (ארכיטקטורה, מעקב מבוזר, זרימת טלמטריה)
  - 3 תרגילים מעשיים (התראות, לוחות מחוונים, ניטור AI)
  - דוגמאות שאילתות Kusto ואסטרטגיות אופטימיזציה של עלויות
  - סטרימינג של מדדים חיים וניפוי שגיאות בזמן אמת
  - זמן למידה של 40-50 דקות עם דפוסים מוכנים לפרודקשן

- **🔐 שיעור דפוסי אימות ואבטחה**: ב`docs/getting-started/authsecurity.md`:
  - 3 דפוסי אימות (מחרוזות חיבור, Key Vault, managed identity)
  - תבניות תשתית Bicep מלאות לפריסות מאובטחות
  - קוד אפליקציית Node.js עם אינטגרציית Azure SDK
  - 3 תרגילים מלאים (הפעלת managed identity, זהות משתמש, סיבוב Key Vault)
  - פרקטיקות אבטחה מיטביות וקונפיגורציות RBAC
  - מדריך פתרון בעיות וניתוח עלויות
  - דפוסי אימות ללא סיסמה מוכנים לייצור

- **🤖 שיעור דפוסי תיאום ריבוי סוכנים**: ב`docs/pre-deployment/coordination-patterns.md`:
  - 5 דפוסי תיאום (רציף, מקביל, היררכי, מונחה אירועים, קונצנזוס)
  - מימוש מלא של שירות אורקסטרציה (Python/Flask, מעל 1,500 שורות)
  - 3 מימושים ספציפיים של סוכנים (מחקר, סופר, עורך)
  - אינטגרציה עם Service Bus לתור הודעות
  - ניהול מצב Cosmos DB למערכות מבוזרות
  - 6 דיאגרמות Mermaid המראות אינטראקציות סוכנים
  - 3 תרגילים מתקדמים (טיפול בתזמון, לוגיקת ניסיונות, מפסק מעגל)
  - פירוט עלויות (240-565$/חודש) עם אסטרטגיות אופטימיזציה
  - אינטגרציית Application Insights לניטור

#### משופר
- **פרק טרום-פריסה**: כעת כולל דפוסי ניטור ותיאום מקיפים
- **פרק התחלה**: משופר עם דפוסי אימות מקצועיים
- **מוכנות לפרודקשן**: כיסוי מלא מאבטחה לניטור
- **מתאר הקורס**: עודכן לפניה לשיעורים חדשים בפרקים 3 ו-6

#### שונה
- **התקדמות למידה**: אינטגרציה טובה יותר של אבטחה וניטור לאורך הקורס
- **איכות תיעוד**: סטנדרטים עקביים ברמה A (95-97%) בשיעורים החדשים
- **דפוסי פרודקשן**: כיסוי מקצה לקצה לפריסות ארגוניות

#### שופרו
- **חוויה למפתחים**: מסלול ברור מהפיתוח לניטור פרודקשן
- **סטנדרטים לאבטחה**: דפוסים מקצועיים לאימות וניהול סודות
- **נראות ומעקב**: אינטגרציית Application Insights מלאה עם AZD
- **עומסי עבודה AI**: ניטור ייעודי לדגמי Microsoft Foundry ולמערכות ריבוי סוכנים

#### אומת
- ✅ כל השיעורים כוללים קוד מלא ופועל (לא מקטעים)
- ✅ דיאגרמות Mermaid ללמידה ויזואלית (19 סה"כ בשלושה שיעורים)
- ✅ תרגילים מעשיים עם שלבי אימות (9 סה"כ)
- ✅ תבניות Bicep מוכנות לייצור לפריסה דרך `azd up`
- ✅ ניתוח עלויות ואסטרטגיות אופטימיזציה
- ✅ מדריכי פתרון בעיות ופרקטיקות מיטביות
- ✅ נקודות עצירה לידע עם פקודות אימות

#### תוצאות דירוג תיעוד
- **docs/pre-deployment/application-insights.md**: - מדריך ניטור מקיף
- **docs/getting-started/authsecurity.md**: - דפוסי אבטחה מקצועיים
- **docs/pre-deployment/coordination-patterns.md**: - ארכיטקטורות ריבוי סוכנים מתקדמות
- **תוכן חדש כללי**: - סטנדרטים עקביים ואיכותיים

#### מימוש טכני
- **Application Insights**: Log Analytics + טלמטריה מותאמת + מעקב מבוזר
- **אימות**: Managed Identity + Key Vault + דפוסי RBAC
- **ריבוי סוכנים**: Service Bus + Cosmos DB + Container Apps + אורקסטרציה
- **ניטור**: מדדים חיים + שאילתות Kusto + התראות + לוחות מחוונים
- **ניהול עלויות**: אסטרטגיות דגימה, מדיניות שמירה, בקרות תקציב

### [v3.7.0] - 2025-11-19

#### שיפור איכות תיעוד ודוגמת Microsoft Foundry Models חדשה
**גרסה זו משפרת את איכות התיעוד במחסן ומוסיפה דוגמת פריסה מלאה של Microsoft Foundry Models עם ממשק שיחה gpt-4.1.**

#### נוספו
- **🤖 דוגמת שיחת Microsoft Foundry Models**: פריסת gpt-4.1 מלאה עם מימוש עובד ב`examples/azure-openai-chat/`:
  - תשתית Microsoft Foundry Models מלאה (פריסת דגם gpt-4.1)
  - ממשק שיחה בקו הפקודה ב-Python עם היסטוריית שיחות
  - אינטגרציה עם Key Vault לאחסון מאובטח של מפתחות API
  - מעקב שימוש באסימון והערכת עלויות
  - הגבלת קצב וטיפול בשגיאות
  - README מקיף עם מדריך פריסה של 35-45 דקות
  - 11 קבצים מוכנים לייצור (תבניות Bicep, אפליקציית Python, קונפיגורציה)
- **📚 תרגילי תיעוד**: נוספו תרגילים מעשיים למדריך ההגדרה:
  - תרגיל 1: קונפיגורציה מרובת סביבות (15 דקות)
  - תרגיל 2: תרגול ניהול סודות (10 דקות)
  - קריטריוני הצלחה והשלבים לאימות ברורים
- **✅ אימות פריסה**: נוספה מדור אימות למדריך הפריסה:
  - נהלי בדיקת בריאות
  - רשימת בדיקת קריטריוני הצלחה
  - תוצאות צפויות לכל פקודות הפריסה
  - הפניות מהירות לפתירת בעיות

#### משופר
- **examples/README.md**: עודכן לאיכות דרגה A (93%):
  - נוסף azure-openai-chat לכל הפרקים הרלוונטיים
  - עדכון מספר הדוגמאות המקומיות מ-3 ל-4
  - נוספה לטבלת דוגמאות יישומי AI
  - הוטמעה בתחילת מהיר למשתמשי ביניים
  - נוספה לסעיף תבניות Microsoft Foundry
  - עדכון מטריצת השוואה וסעיפי מציאת טכנולוגיות
- **איכות התיעוד**: שיפור מ-B+ (87%) ל-A- (92%) בתיקיית docs:
  - נוספו תוצאות צפויות לדוגמאות פקודות קריטיות
  - נכללו שלבי אימות לשינויים בקונפיגורציה
  - שיפור למידה מעשית עם תרגילים פרקטיים

#### שונה
- **התקדמות למידה**: אינטגרציה טובה יותר של דוגמאות AI ללומדים בינוניים
- **מבנה התיעוד**: תרגילים מעשיים ברורים עם תוצאות מוגדרות
- **תהליך אימות**: קריטריוני הצלחה מפורשים בתהליכים מרכזיים

#### משופר
- **חוויה למפתחים**: פריסת Microsoft Foundry Models לוקחת כעת 35-45 דקות (לעומת 60-90 לאלטרנטיבות מורכבות)
- **שקיפות עלויות**: הערכות עלות ברורות (50-200$/חודש) לדוגמת Microsoft Foundry Models
- **מסלול למידה**: מפתחי AI מקבלים נקודת כניסה ברורה עם azure-openai-chat
- **סטנדרטים לתיעוד**: תוצאות צפויות עקביות ושלבי אימות

#### אומת
- ✅ דוגמת Microsoft Foundry Models פועלת במלואה עם `azd up`
- ✅ כל 11 קבצי מימוש תקינים תחבירית
- ✅ הוראות README תואמות את חוויית הפריסה בפועל
- ✅ קישורי תיעוד עודכנו בלמעלה מ-8 מיקומים
- ✅ אינדקס דוגמאות משקף בדיוק 4 דוגמאות מקומיות
- ✅ אין קישורים חיצוניים כפולים בטבלאות
- ✅ כל הפניות הניווט נכונות

#### מימוש טכני
- **ארכיטקטורת Microsoft Foundry Models**: gpt-4.1 + Key Vault + דפוס Container Apps
- **אבטחה**: Managed Identity מוכן, סודות ב-Key Vault
- **ניטור**: אינטגרציית Application Insights
- **ניהול עלויות**: מעקב אסימון ואופטימיזציית שימוש
- **פריסה**: פקודת `azd up` יחידה להגדרה מלאה

### [v3.6.0] - 2025-11-19

#### עדכון ראשי: דוגמאות לפריסת Container App
**גרסה זו מציגה דוגמאות פריסה מקיפות של יישומי container מוכנים לייצור עם Azure Developer CLI (AZD), עם תיעוד מלא ואינטגרציה למסלול הלמידה.**

#### נוספו
- **🚀 דוגמאות Container App**: דוגמאות מקומיות חדשות ב`examples/container-app/`:
  - [מדריך ראשי](examples/container-app/README.md): סקירה מלאה של פריסות מכולות, התחלה מהירה, ייצור ודפוסים מתקדמים  
  - [API פשוט עם Flask](../../examples/container-app/simple-flask-api): REST API ידידותי למתחילים עם סקייל-טרו-זירו, בדיקות בריאות, ניטור וטיפול בבעיות  
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices): פריסה מוכנה לייצור של מספר שירותים (API Gateway, מוצר, הזמנה, משתמש, התראה), הודעות אסינכרוניות, Service Bus, Cosmos DB, Azure SQL, מעקב מבוזר, פריסת blue-green/canary  
- **שיטות עבודה מומלצות**: אבטחה, ניטור, אופטימיזציה של עלויות והנחיות CI/CD לעבודה עם מכולות  
- **דוגמאות קוד**: דוגמאות מלאות של `azure.yaml`, תבניות Bicep ויישומים במגוון שפות שירות (Python, Node.js, C#, Go)  
- **בדיקות וטיפול בבעיות**: תרחישי בדיקה מקצה לקצה, פקודות ניטור והנחיות לטיפול בבעיות  

#### שונו  
- **README.md**: עודכן לכלול תכונות וקישורים לדוגמאות אפליקציות מכולות חדשות תחת "Local Examples - Container Applications"  
- **examples/README.md**: עודכן להדגיש דוגמאות אפליקציות מכולות, להוסיף ערכי מטריצת השוואה ולעדכן הפניות לטכנולוגיה/ארכיטקטורה  
- **מתווה הקורס ומדריך הלימוד**: עודכן לכלול הפניות לדוגמאות אפליקציות מכולות ודפוסי פריסה חדשים בפרקים הרלוונטיים  

#### אומת  
- ✅ כל הדוגמאות החדשות ניתנות לפריסה עם `azd up` ועומדות בשיטות העבודה המומלצות  
- ✅ קישורי מסמכים וניווט עודכנו  
- ✅ דוגמאות מכסות תרחישים ממתחילים למתקדמים, כולל מיקרו-שירותים לייצור  

#### הערות  
- **תחום**: מסמכים ודוגמאות באנגלית בלבד  
- **שלבים הבאים**: הרחבה עם דפוסי מכולות מתקדמים נוספים ואוטומציה ב-CI/CD בשחרורים עתידיים  

### [v3.5.0] - 2025-11-19  

#### מיתוג מחדש של מוצר: Microsoft Foundry  
**גרסה זו מבצעת שינוי מקיף בשם המוצר מ-"Microsoft Foundry" ל-"Microsoft Foundry" בכל המסמכים באנגלית, כתוצאה ממיתוג מחדש רשמי של מיקרוסופט.**  

#### שונו  
- **🔄 עדכון שם המוצר**: מיתוג מחדש מלא מ-"Microsoft Foundry" ל-"Microsoft Foundry"  
  - עודכנו כל ההפניות במסמכי האנגלית בתיקיית `docs/`  
  - שונה שם תיקייה: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - שונה שם קובץ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - סה"כ: 23 הפניות תוכן עודכנו ב-7 קבצי מסמכים  

- **📁 שינויים במבנה התיקיות**:  
  - `docs/ai-foundry/` שונה ל-`docs/microsoft-foundry/`  
  - כל ההפניות הצטלבות עודכנו לשקף את מבנה התיקיות החדש  
  - קישורי ניווט אומתו בכל המסמכים  

- **📄 שינויי שם קבצים**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - כל הקישורים הפנימיים עודכנו לשם הקובץ החדש  

#### קבצים עודכנו  
- **מסמכי פרקים** (7 קבצים):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 עדכוני קישורי ניווט  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 הפניות לשם המוצר עודכנו  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - כבר משתמש ב-Microsoft Foundry (משחרורים קודמים)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 הפניות עודכנו (סקירה, משוב קהילה, מסמכים)  
  - `docs/getting-started/azd-basics.md` - 4 קישורי הפניה צולבת עודכנו  
  - `docs/getting-started/first-project.md` - 2 קישורי ניווט לפרק עודכנו  
  - `docs/getting-started/installation.md` - 2 קישורי פרק הבא עודכנו  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 הפניות עודכנו (ניווט, קהילת Discord)  
  - `docs/troubleshooting/common-issues.md` - 1 קישור ניווט עודכן  
  - `docs/troubleshooting/debugging.md` - 1 קישור ניווט עודכן  

- **קבצי מבנה קורס** (2 קבצים):  
  - `README.md` - 17 הפניות עודכנו (סקירת קורס, כותרות פרקים, מדור תבניות, תובנות קהילה)  
  - `course-outline.md` - 14 הפניות עודכנו (סקירה, מטרות למידה, משאבי פרקים)  

#### אומת  
- ✅ לא נותרו הפניות לתיקיית "ai-foundry" במסמכי האנגלית  
- ✅ לא נותרו הפניות לשם המוצר "Microsoft Foundry" במסמכי האנגלית  
- ✅ כל קישורי הניווט פועלים עם מבנה התיקיות החדש  
- ✅ שינויי שם קבצים ותיקיות הושלמו בהצלחה  
- ✅ קישורים צולבים בין פרקים אומתו  

#### הערות  
- **תחום**: שינויים בוצעו רק במסמכי אנגלית בתיקיית `docs/`  
- **תרגומים**: תיקיות תרגום (`translations/`) לא עודכנו בגרסה זו  
- **סדנה**: חומרי סדנה (`workshop/`) לא עודכנו בגרסה זו  
- **דוגמאות**: קבצי דוגמא עשויים עדיין להכיל הפניות לשמות ישנים (יטופל בעדכון עתידי)  
- **קישורים חיצוניים**: כתובות URL חיצוניות והפניות לרפוזיטורי GitHub נשארו ללא שינוי  

#### מדריך מעבר לתורמים  
אם יש לכם סניפים מקומיים או מסמכים המפנים למבנה הישן:  
1. עדכון הפניות תיקיות: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. עדכון הפניות קבצים: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. החלפת שם מוצר: "Microsoft Foundry" → "Microsoft Foundry"  
4. אמתו שכל קישורי המסמכים הפנימיים עדיין פועלים  

---

### [v3.4.0] - 2025-10-24  

#### שיפורים בתצוגה מוקדמת ואימות תשתיות  
**גרסה זו מציגה תמיכה מקיפה בפיצ'ר התצוגה המוקדמת החדש של Azure Developer CLI ומשפרת את חווית המשתמש בסדנה.**  

#### נוסף  
- **🧪 תיעוד פיצ'ר azd provision --preview**: כיסוי מקיף של יכולת התצוגה המוקדמת החדשה לתשתית  
  - הפניות לפקודות ודוגמאות שימוש בגליון רמאויות  
  - אינטגרציה מפורטת במדריך ההקצאה עם מקרי שימוש ויתרונות  
  - אינטגרציה של בדיקת לפני טיסה לאימות פריסה בטוח יותר  
  - עדכוני מדריך התחלה עם שיטות פריסה לשמירה על בטיחות  
- **🚧 באנר סטטוס סדנה**: באנר HTML מקצועי המציין את מצב פיתוח הסדנה  
  - עיצוב הדרגתי עם אינדיקטורים לבנייה לתקשורת ברורה עם המשתמש  
  - חותמת זמן עדכון אחרונה לשקיפות  
  - עיצוב רספונסיבי לכל סוגי המכשירים  

#### שופר  
- **בטיחות בתשתיות**: פונקציונליות התצוגה המוקדמת משולבת לאורך כל מסמכי הפריסה  
- **אימות לפני פריסה**: סקריפטים אוטומטיים כוללים כעת בדיקות תצוגה מוקדמת  
- **זרימת עבודה למפתח**: רצפי פקודות עודכנו לכלול תצוגה מוקדמת כשיטת עבודה מומלצת  
- **חווית סדנה**: ציפיות ברורות למשתמשים לגבי מצב הפיתוח של התוכן  

#### שונו  
- **שיטות פריסה מומלצות**: זרימת עבודה עם תצוגה מוקדמת מומלצת כגישה ראשית  
- **זרימת תיעוד**: אימות תשתיות הועבר לשלב מוקדם יותר בתהליך הלמידה  
- **הצגת הסדנה**: תקשורת סטטוס מקצועית עם ציר זמן פיתוח ברור  

#### שופר  
- **גישה של בטיחות קודם כל**: שינויים בתשתית ניתן לאמת מראש לפני פריסה  
- **שיתוף פעולה צוותי**: תוצאות תצוגה מוקדמת ניתנות לשיתוף לאישור ולסקירה  
- **מודעות עלויות**: הבנת עלויות עדיפה לפני הקצאת משאבים  
- **הפחתת סיכונים**: פחות כשלי פריסה בזכות אימות מקדים  

#### יישום טכני  
- **אינטגרציה במסמכים מרובים**: תיעוד פיצ'ר התצוגה המוקדמת ב-4 קבצים מרכזיים  
- **דפוסי פקודות**: תחביר ודוגמאות עקביים בכל התיעוד  
- **שילוב בשיטות עבודה מומלצות**: תצוגה מוקדמת משולבת בזרמי אימות ובסקריפטים  
- **אינדיקטורים ויזואליים**: סימוני NEW ברורים לגילוי הקלה  

#### תשתית הסדנה  
- **תקשורת סטטוס**: באנר HTML מקצועי עם עיצוב הדרגתי  
- **חווית משתמש**: מצב פיתוח ברור מונע בלבול  
- **הצגה מקצועית**: שומרת על אמינות המאגר תוך קביעת ציפיות  
- **שקיפות ציר זמן**: חותמת זמן עדכון אחרון באוקטובר 2025 לאחריות  

### [v3.3.0] - 2025-09-24  

#### חומרים משופרים לסדנה וחווית למידה אינטראקטיבית  
**גרסה זו מציגה חומרים מקיפים לסדנה עם מדריכים אינטראקטיביים בדפדפן ונתיבי למידה מובנים.**  

#### נוסף  
- **🎥 מדריך סדנה אינטראקטיבי**: חווית סדנה בדפדפן עם יכולת תצוגה מקדימה של MkDocs  
- **📝 הוראות סדנה מובנות**: מסלול למידה בן 7 שלבים מגלוי ועד התאמה אישית  
  - 0-מבוא: סקירת סדנה והגדרות  
  - 1-בחירת תבנית AI: תהליך גילוי ובחירת תבנית  
  - 2-אימות תבנית AI: נוהלי פריסה ואימות  
  - 3-פירוק תבנית AI: הבנת ארכיטקטורת התבנית  
  - 4-הגדרת תבנית AI: קונפיגורציה והתאמה אישית  
  - 5-התאמת תבנית AI: שינויים מתקדמים ואיטרציות  
  - 6-הריסת תשתית: ניקוי וניהול משאבים  
  - 7-סיכום: סיכום ושלבים הבאים  
- **🛠️ כלי סדנה**: תצורת MkDocs עם ערכת נושא Material לחווית למידה משופרת  
- **🎯 מסלול למידה מעשי**: מתודולוגיה בת 3 שלבים (גילוי → פריסה → התאמה אישית)  
- **📱 אינטגרצית GitHub Codespaces**: הגדרת סביבת פיתוח חלקה  

#### שופר  
- **מעבדת AI בסדנה**: הורחבה עם חווית למידה מובנית בת 2-3 שעות  
- **תיעוד הסדנה**: הצגה מקצועית עם ניווט ועזרים ויזואליים  
- **התקדמות למידה**: הדרכה צעד-אחר-צעד ברורה מבחירת תבנית ועד פריסה לייצור  
- **חווית מפתח**: כלים משולבים לזרימות פיתוח יעילות  

#### שופר  
- **נגישות**: ממשק בדפדפן עם חיפוש, העתקה ומצב נושא כהה-בהיר  
- **למידה בקצב אישי**: מבנה סדנה גמיש המותאם למהירויות למידה שונות  
- **יישום מעשי**: תרחישי פריסת תבניות AI בעולם האמיתי  
- **אינטגרציה קהילתית**: חיבור ל-Discord לתמיכה ושיתוף פעולה בסדנה  

#### תכונות הסדנה  
- **חיפוש מובנה**: גילוי מהיר של מילות מפתח ושיעורים  
- **העתקת קטעי קוד**: פונקציונליות העתקה עם ריחוף על כל דוגמת קוד  
- **מתג מצב נושא**: תמיכה במצב כהה/בהיר להעדפות שונות  
- **נכסים ויזואליים**: צילומי מסך ודיאגרמות להבנה משופרת  
- **אינטגרצית עזרה**: גישה ישירה ל-Discord לתמיכת קהילה  

### [v3.2.0] - 2025-09-17  

#### שיפור ניהול ניווט ומערכת למידה מבוססת פרקים  
**גרסה זו מציגה מבנה למידה מבוסס פרקים מקיף עם ניווט משופר ברחבי כל המאגר.**  

#### נוסף  
- **📚 מערכת למידה מבוססת פרקים**: ארגון מחדש של הקורס כולו ל-8 פרקים מתקדמים  
  - פרק 1: יסודות והתחלה מהירה (⭐ - 30-45 דקות)  
  - פרק 2: פיתוח מונחה AI (⭐⭐ - 1-2 שעות)  
  - פרק 3: קונפיגורציה ואימות (⭐⭐ - 45-60 דקות)  
  - פרק 4: תשתית כקוד ופריסה (⭐⭐⭐ - 1-1.5 שעות)  
  - פרק 5: פתרונות AI רב-סוכנים (⭐⭐⭐⭐ - 2-3 שעות)  
  - פרק 6: אימות ותכנון לפני פריסה (⭐⭐ - שעה)  
  - פרק 7: טיפול בתקלות ודיבוג (⭐⭐ - 1-1.5 שעות)  
  - פרק 8: דפוסי ייצור וארגוניים (⭐⭐⭐⭐ - 2-3 שעות)  
- **📚 מערכת ניווט מקיפה**: כותרות תחתונות וראשונות עקביות בכל המסמכים  
- **🎯 מעקב התקדמות**: רשימת בדיקה להשלמת קורס ומערכת אימות למידה  
- **🗺️ הנחיית נתיבי למידה**: נקודות כניסה ברורות לרמות ניסיון ומטרות שונות  
- **🔗 ניווט הפניות צולבות**: פרקים קשורים ותנאי קדם מקושרים בבירור  

#### שופר  
- **מבנה README**: הוסב לפלטפורמת למידה מובנית עם ארגון מבוסס פרקים  
- **ניווט בתיעוד**: כל דף כולל הקשר פרק והדרכת התקדמות  
- **ארגון תבניות**: דוגמאות ותבניות מוצמדות לפרקי לימוד מתאימים  
- **אינטגרצית משאבים**: דפי עזר, שאלות נפוצות ומדריכי לימוד מקושרים לפרקים הרלוונטיים  
- **אינטגרצית סדנה**: מעבדות מעשיות משולבות למטרות למידה מרובות בפרקים  

#### שונו  
- **התקדמות למידה**: מעבר מתיעוד לינארי ללמידה גמישה מבוססת פרקים  
- **מיקום הקונפיגורציה**: מדריך קונפיגורציה הוזז לפרק 3 לשיפור זרימת הלמידה  
- **שילוב תוכן AI**: שילוב טוב יותר של תוכן AI לאורך מסע הלמידה  
- **תוכן ייצור**: דפוסים מתקדמים מאוגדים בפרק 8 ללומדי ארגונים  

#### שופר  
- **חווית משתמש**: פירורי לחם ניווט ברורים וסימוני התקדמות פרקים  
- **נגישות**: דפוסי ניווט עקביים לניווט קל יותר בקורס  
- **הצגה מקצועית**: מבנה קורס בסגנון אוניברסיטאי מתאים להכשרה אקדמית וארגונית  
- **יעילות למידה**: חיסכון בזמן במציאת תוכן רלוונטי באמצעות ארגון משופר  

#### יישום טכני  
- **כותרות ניווט**: ניווט פרקים סטנדרטי ב-40+ קבצי מסמכים  
- **ניווט תחתון**: הדרכת התקדמות עקבית וסימוני סיום פרק  
- **קישורים צולבים**: מערכת קישורים פנימית מקיפה המחברת מושגים קשורים  
- **מיפוי פרקים**: תבניות ודוגמאות משוייכות בבירור למטרות למידה  

#### שיפור מדריך ללמידה  
- **📚 מטרות למידה מקיפות**: ארגון מחדש של מדריך הלימוד ליישור עם מערכת 8 הפרקים  
- **🎯 הערכת מבוססת פרקים**: כל פרק כולל מטרות למידה ספציפיות ותרגילים מעשיים  
- **📋 מעקב התקדמות**: לוח זמנים שבועי ללמידה עם תוצאות מדידות ורשימות בדיקה להשלמה  
- **❓ שאלות הערכה**: שאלות אימות ידע לכל פרק עם תוצאות מקצועיות  
- **🛠️ תרגילים מעשיים**: פעילויות ידניות עם תרחישי פריסה אמיתיים וטיפול בבעיות  
- **📊 התקדמות מיומנויות**: התקדמות ברורה מרעיונות בסיסיים לדפוסים ארגוניים עם מיקוד בפיתוח קריירה  
- **🎓 מסגרת הסמכה**: תוצאות פיתוח מקצועי ומערכת הכרה קהילתית  
- **⏱️ ניהול ציר זמן**: תוכנית למידה מסודרת בת 10 שבועות עם אימות אבני דרך  

### [v3.1.0] - 2025-09-17  

#### שיפורים בפתרונות AI רב-סוכנים  
**גרסה זו משפרת את פתרון הקמעונאות הרב-סוכני עם שמות סוכנים טובים יותר ותיעוד משופר.**  

#### שונו  
- **טרמינולוגיית סוכנים מרובים**: הוחלף "סוכן קורה" ב"סוכן לקוח" בכל הפתרון הרב-סוכני הקמעונאי להבהרת ההבנה
- **ארכיטקטורת סוכן**: עודכנו כל התיעוד, תבניות ARM, ודוגמאות הקוד לשימוש בשם עקבי "סוכן לקוח"
- **דוגמאות קונפיגורציה**: מודרניזציה של דפוסי הקונפיגורציה של הסוכן עם עיקרי שם מעודכנים
- **עקביות בתיעוד**: הבטחת שכל ההתייחסויות משתמשות בשמות סוכנים מקצועיים ומתארים

#### משופר
- **חבילת תבניות ARM**: עדכון retail-multiagent-arm-template עם הפניות לסוכן הלקוח
- **דיאגרמות ארכיטקטורה**: רענון דיאגרמות Mermaid עם שמות סוכנים מעודכנים
- **דוגמאות קוד**: מחלקות פייתון ודוגמאות יישום כעת משתמשות בשם CustomerAgent
- **משתני סביבה**: עדכון כל סקריפטי הפריסה לשימוש בקונבנציות CUSTOMER_AGENT_NAME

#### משופר
- **חווית מפתח**: תפקידים ואחריות ברורים יותר בסוכנים בתיעוד
- **מוכנות לפרודקשן**: יישור טוב יותר עם קונבנציות שמות ארגוניות
- **חומרי למידה**: שמות סוכנים אינטואיטיביים יותר למטרות חינוכיות
- **שימושיות תבניות**: פישוט הבנת פונקציות הסוכן ודפוסי הפריסה

#### פרטים טכניים
- עדכון דיאגרמות ארכיטקטורת Mermaid עם הפניות ל-CustomerAgent
- החלפת שמות מחלקות CoraAgent ב-CustomerAgent בדוגמאות פייתון
- שינוי קונפיגורציות JSON של תבניות ARM לשימוש בסוג סוכן "customer"
- עדכון משתני סביבה מ-CORA_AGENT_* ל-CUSTOMER_AGENT_*
- רענון כל פקודות הפריסה וקונפיגורציות המכולות

### [v3.0.0] - 2025-09-12

#### שינויים עיקריים - התמקדות במפתחי AI ואינטגרציה עם Microsoft Foundry
**גרסה זו משנה את המאגר למשאב למידה מקיף ממוקד AI עם אינטגרציה ל-Microsoft Foundry.**

#### נוסף
- **🤖 מסלול למידה ממוקד AI**: מבנה מחדש מלא המעדיף מפתחי ומהנדסי AI
- **מדריך אינטגרציה ל-Microsoft Foundry**: תיעוד מקיף לחיבור AZD עם שירותי Microsoft Foundry
- **דפוסי פריסת מודלים AI**: מדריך מפורט לכיסוי בחירת מודלים, קונפיגורציה, ואסטרטגיות פריסה בפרודקשן
- **מעבדה סדנת AI**: סדנת מעשי של 2-3 שעות להמרת יישומי AI לפתרונות פרוסים ב-AZD
- **שיטות עבודה מומלצות לפרודקשן AI**: דפוסי ארגוני מוכנים להרחבה, ניטור ואבטחת עומסי עבודה של AI
- **מדריך פתרון בעיות AI ספציפי**: פתרון תקלות מעמיק למודלים של Microsoft Foundry, Cognitive Services, ובעיות בפריסת AI
- **גלריית תבניות AI**: אוסף בולט של תבניות Microsoft Foundry עם דירוגי מורכבות
- **חומרי סדנה**: מבנה סדנה מלא עם מעבדות מעשיות וחומרי הפניה

#### משופר
- **מבנה README**: ממוקד מפתחי AI עם 45% נתוני עניין מהקהילה מ-Microsoft Foundry Discord
- **מסלולי למידה**: מסלול ייעודי למפתחי AI לצד המסלולים המסורתיים לסטודנטים ומהנדסי DevOps
- **המלצות תבניות**: תבניות AI מובילות כולל azure-search-openai-demo, contoso-chat, ו-openai-chat-app-quickstart
- **אינטגרציה קהילתית**: תמיכה משופרת בקהילת Discord עם ערוצים ודיונים ספציפיים ל-AI

#### אבטחה ומיקוד בפרודקשן
- **תבניות זהות מנוהלת**: קונפיגורציות אימות ואבטחה ספציפיות ל-AI
- **אופטימיזציית עלויות**: מעקב שימוש באסימונים ובקרות תקציב לעומסי עבודה של AI
- **פריסה מרובה-אזורית**: אסטרטגיות לפריסת יישומי AI גלובליים
- **ניטור ביצועים**: מדדים ספציפיים ל-AI ואינטגרציה עם Application Insights

#### איכות התיעוד
- **מבנה קורס ליניארי**: התקדמות לוגית מדפוסי פריסה למתחילים ועד מתקדמים של AI
- **URL-ים מאומתים**: כל קישורי המאגר החיצוניים נבדקו ונגישים
- **הפניה מלאה**: כל קישורי התיעוד הפנימיים מאומתים ופועלים
- **מוכן לפרודקשן**: דפוסי פריסה ארגוניים עם דוגמאות מהחיים האמיתיים

### [v2.0.0] - 2025-09-09

#### שינויים עיקריים - ארגון מחדש של המאגר והעצמת מקצועיות
**גרסה זו מייצגת מהפך משמעותי במבנה המאגר והצגת התוכן.**

#### נוסף
- **מסגרת למידה מובנית**: כל דפי התיעוד כוללים כעת מבוא, מטרות למידה ותוצאות למידה
- **מערכת ניווט**: הוספת קישורים לשיעור הקודם/הבא בכל התיעוד להתקדמות למידה מודרכת
- **מדריך לימוד**: study-guide.md מקיף עם יעדי למידה, תרגולי פרקטיקה, וחומרי הערכה
- **הצגה מקצועית**: הסרת כל אייקוני האימוג'י לשיפור הנגישות והמראה המקצועי
- **שיפור מבנה התוכן**: ארגון וזרימה טובים יותר של חומרי הלמידה

#### שונה
- **פורמט התיעוד**: סטנדרטיזציה של כל התיעוד במבנה למידה עקבי
- **זרימת ניווט**: יישום התקדמות לוגית בכל חומרי הלמידה
- **הצגת תוכן**: הסרת אלמנטים קישוטיים לטובת עיצוב ברור ומקצועי
- **מבנה קישורים**: עדכון כל הקישורים הפנימיים לתמיכה במערכת ניווט חדשה

#### משופר
- **נגישות**: הסרת התלות באימוג'ים להתאמה טובה יותר לקוראי מסך
- **מראה מקצועי**: הצגה נקיה בסגנון אקדמי המתאימה ללמידה ארגונית
- **חווית למידה**: גישה מובנית עם יעדים ותוצאות ברורות לכל שיעור
- **ארגון תוכן**: זרימה לוגית ומשופרת וחיבור בין נושאים קשורים

### [v1.0.0] - 2025-09-09

#### שחרור ראשוני - מאגר למידה מקיף ל-AZD

#### נוסף
- **מבנה תיעוד מרכזי**
  - סדרת מדריכים מלאה למתחילים
  - תיעוד פריסה והקצאה מקיף
  - משאבי פתרון תקלות ומדריכים לניפוי שגיאות
  - כלים ונהלים לאימות טרום פריסה

- **מודול התחלה**
  - יסודות AZD: מושגים וטרמינולוגיה מרכזית
  - מדריך התקנה: הוראות התקנה לפלטפורמות ספציפיות
  - מדריך קונפיגורציה: הקמת סביבה ואימות
  - הדרכת פרויקט ראשון: למידה מעשית שלב אחר שלב

- **מודול פריסה והקצאה**
  - מדריך פריסה: תיעוד זרימת עבודה מלאה
  - מדריך הקצאה: תשתית כקוד עם Bicep
  - שיטות עבודה מומלצות לפריסה בפרודקשן
  - דפוסי ארכיטקטורה רב-שירותית

- **מודול אימות טרום פריסה**
  - תכנון קיבולת: אימות זמינות משאבים ב-Azure
  - בחירת SKU: הנחיות מקיפות לרמות שירות
  - בדיקות טרם טיסה: סקריפטים לאימות אוטומטי (PowerShell ו-Bash)
  - כלים להערכת עלויות ותכנון תקציב

- **מודול פתרון תקלות**
  - בעיות נפוצות: תקלות נפוצות ופתרונות
  - מדריך ניפוי שגיאות: שיטות מובנות לניתוח תקלות
  - טכניקות וכלים מתקדמים לאבחון
  - ניטור ביצועים ואופטימיזציה

- **משאבים והפניות**
  - דף פקודות מהיר: הפניה מהירה לפקודות חיוניות
  - מילון מונחים: הגדרות מושגים וקיצורים מקיפות
  - שאלות נפוצות: תשובות מפורטות לשאלות שכיחות
  - קישורים למשאבים חיצוניים וקשרים קהילתיים

- **דוגמאות ותבניות**
  - דוגמה ליישום ווב פשוט
  - תבנית פריסת אתר סטטי
  - קונפיגורציית יישום מכולות
  - דפוסי אינטגרציה בסיס נתונים
  - דוגמאות ארכיטקטורה מיקרו-שירותית
  - מימוש פונקציות ללא שרת

#### תכונות
- **תמיכה רב-פלטפורמית**: מדריכי התקנה וקונפיגורציה ל-Windows, macOS, ולינוקס
- **רמות מיומנות מרובות**: תוכן המתאים לסטודנטים ולמפתחים מקצועיים
- **מיקוד מעשי**: דוגמאות מעשיות ותסריטים מעולם האמיתי
- **כיסוי מקיף**: ממושגים בסיסיים ועד דפוסי ארגון מתקדמים
- **גישה עם אבטחה בראש**: שיטות אבטחה משולבות לאורך כל התוכן
- **אופטימיזציית עלות**: הנחיות לפריסות חסכוניות ולניהול משאבים

#### איכות תיעוד
- **דוגמאות קוד מפורטות**: דוגמאות קוד מעשיות ונבדקות
- **הוראות שלב-אחר-שלב**: הנחיות ברורות ופועלות
- **טיפול שגיאות מקיף**: פתרון תקלות לשגיאות נפוצות
- **שילוב שיטות מומלצות**: תקנים והמלצות תעשייתיות
- **תאימות גרסאות**: עדכונים תואמים עם שירותי Azure האחרונים ותכונות azd

## שיפורים עתידיים מתוכננים

### גרסה 3.1.0 (מתוכננת)
#### הרחבת פלטפורמת AI
- **תמיכה מרובת מודלים**: דפוסי אינטגרציה ל-Hugging Face, Azure Machine Learning, ומודלים מותאמים
- **מסגרות סוכן AI**: תבניות לפריסות LangChain, Semantic Kernel, ו-AutoGen
- **דפוסי RAG מתקדמים**: אפשרויות בסיס נתונים וקטוריים מעבר ל-Azure AI Search (Pinecone, Weaviate וכו')
- **תצפיתיות AI**: ניטור משופר לביצועי מודלים, שימוש באסימונים ואיכות תגובה

#### חווית מפתח
- **תוסף VS Code**: חווית פיתוח משולבת של AZD + Microsoft Foundry
- **אינטגרציה עם GitHub Copilot**: יצירת תבניות AZD בסיוע AI
- **הדרכות אינטראקטיביות**: תרגולי קוד מעשיים עם אימות אוטומטי לתרחישי AI
- **תוכן וידאו**: הדרכות וידאו משלימות ללומדים חזותיים ממוקדות פריסות AI

### גרסה 4.0.0 (מתוכננת)
#### דפוסי AI ארגוניים
- **מסגרת ממשל**: ממשל מודלים AI, עמידה בתקנות ושבילי ביקורת
- **AI רב-דיירקטוריאלי**: דפוסים למתן שירות ללקוחות מרובים עם שירותי AI מבודדים
- **פריסת AI בקצה**: אינטגרציה עם Azure IoT Edge ומכולות
- **AI ענן היברידי**: דפוסי פריסה רב-ענניים והיברידיים לעומסי AI

#### תכונות מתקדמות
- **אוטומציה של צינורות AI**: אינטגרציה של MLOps עם צינורות Azure Machine Learning
- **אבטחה מתקדמת**: דפוסי אמון אפס, נקודות קצה פרטיות והגנה מפני איומים מתקדמים
- **אופטימיזציית ביצועים**: כיוונון ושיטות קנה מידה מתקדמות ליישומי AI רבי-קצב
- **הפצה גלובלית**: דפוסי הפצת תוכן ו-caching בקצה ליישומי AI

### גרסה 3.0.0 (מתוכננת) - הוחלפה בגרסה הנוכחית
#### תוספות מוצעות - מומשו בגרסה v3.0.0
- ✅ **תוכן ממוקד AI**: אינטגרציה מקיפה של Microsoft Foundry (הושלם)
- ✅ **הדרכות אינטראקטיביות**: סדנת מעשי AI (הושלם)
- ✅ **מודול אבטחה מתקדם**: דפוסי אבטחה ספציפיים ל-AI (הושלם)
- ✅ **אופטימיזציית ביצועים**: שיטות כיוונון לעומסי AI (הושלם)

### גרסה 2.1.0 (מתוכננת) - מומשה חלקית ב-v3.0.0
#### שיפורים קטנים - חלקם הושלמו בגרסה הנוכחית
- ✅ **דוגמאות נוספות**: תרחישי פריסה ממוקדי AI (הושלם)
- ✅ **שאלות נפוצות מורחבות**: שאלות ופתרון תקלות ספציפיים ל-AI (הושלם)
- **אינטגרציית כלים**: מדריכים משופרים לאינטגרציית IDE ועריכה
- ✅ **הרחבת ניטור**: דפוסי ניטור והתראות ספציפיים ל-AI (הושלם)

#### עדיין מתוכנן לגרסה עתידית
- **תיעוד ידידותי למובייל**: עיצוב רספונסיבי ללמידה במכשירים ניידים
- **גישה לא מקוונת**: חבילות תיעוד להורדה
- **אינטגרציה משופרת ב-IDE**: תוסף VS Code לזרימות עבודה של AZD + AI
- **לוח מחוונים קהילתי**: מדדי קהילה בזמן אמת ומעקב אחר תרומות

## תרומה ליומן שינויים

### דיווח שינויים
בעת תרומה למאגר זה, יש לוודא שפרטי יומן השינויים מכילים:

1. **מספר גרסה**: בהתאם לגרסה סמנטית (ראשי.משני.תיקון)
2. **תאריך**: תאריך שחרור או עדכון בפורמט YYYY-MM-DD
3. **קטגוריה**: נוסף, שונה, מומחה, הוסר, תוקן, אבטחה
4. **תיאור ברור**: תיאור תמציתי של השינוי
5. **הערכת השפעה**: כיצד השינויים משפיעים על משתמשים קיימים

### קטגוריות שינויים

#### נוסף
- תכונות חדשות, חלקי תיעוד או יכולות
- דוגמאות, תבניות או משאבי למידה חדשים
- כלים, סקריפטים או שירותים נוספים

#### שונה
- שינויים בפונקציונליות או בתיעוד הקיימים
- עדכונים לשיפור בהירות או דיוק
- ארגון מחדש של תוכן או מבנה

#### מומחה
- תכונות או גישות שנמצאות בתהליך הסרה
- חלקי תיעוד המתוכננים להסרה
- שיטות שיש להן חלופות טובות יותר

#### הוסר
- תכונות, תיעוד או דוגמאות שאינם רלוונטיים יותר
- מידע מיושן או גישות שפגות תוקף
- תוכן מתומצת או משולב

#### תוקן
- תיקונים לשגיאות בתיעוד או בקוד
- פתרון בעיות שדווחו
- שיפורים לדיוק או פונקציונליות

#### אבטחה
- שיפורים או תיקונים הקשורים לאבטחה
- עדכונים לשיטות האבטחה הטובות ביותר
- פתרון פגיעויות אבטחה

### קווי הנחיה לגרסה סמנטית

#### גרסה ראשית (X.0.0)
- שינויים משמעותיים המחייבים פעולה מהמשתמש
- ארגון משמעותי מחדש של תוכן או מבנה
- שינויים שמשנים גישה או מתודולוגיה יסודית

#### גרסה משנית (X.Y.0)
- תוספות של תכונות או תוכן
- שיפורים השומרים על תאימות לאחור
- דוגמאות, כלים, או משאבים נוספים

#### גרסת תיקון (X.Y.Z)
- תיקוני באגים ותיקונים
- שיפורים קטנים בתוכן קיים
- הבהרות ושיפורים קטנים

## משוב והצעות מהקהילה

אנו מעודדים בברכה משוב מהקהילה לשיפור משאב הלמידה הזה:

### כיצד לספק משוב
- **בעיות ב-GitHub**: דווח על בעיות או הצע שיפורים (ברוכים הבאים נושאים ספציפיים ל-AI)
- **דיונים ב-Discord**: שתף רעיונות והשתתף בקהילת Microsoft Foundry
- **בקשות משיכה**: תרום שיפורים ישירים לתוכן, במיוחד תבניות ומדריכים של AI
- **Microsoft Foundry Discord**: השתתף בערוץ #Azure לדיונים על AZD + AI
- **פורומים קהילתיים**: השתתף בדיונים רחבים של מפתחי Azure

### קטגוריות משוב
- **דיוק תוכן AI**: תיקונים לאינטגרציה ופריסת שירותי AI
- **חווית למידה**: הצעות לשיפור זרימת הלמידה למפתחי AI
- **תוכן AI חסר**: בקשות לתבניות, דפוסים או דוגמאות נוספות של AI
- **נגישות**: שיפורים לצרכי למידה מגוונים
- **אינטגרציית כלי AI**: הצעות לאינטגרציה טובה יותר של זרימות עבודה לפיתוח AI
- **דפוסי פריסת AI בפרודקשן**: בקשות לדפוסי פריסה ארגוניים של AI

### התחייבות לתגובה
- **תגובה לבעיות**: בתוך 48 שעות לדיווחים שפורסמו
- **בקשות תכונה**: הערכה בתוך שבוע
- **תרומות קהילתיות**: סקירה בתוך שבוע
- **נושאי אבטחה**: עדיפות מיידית עם תגובה מזורזת

## לוח זמנים לתחזוקה

### עדכונים רגילים
- **סקירות חודשיות**: דיוק תוכן ואימות קישורים
- **עדכונים רבעוניים**: תוספות ושיפורים משמעותיים לתוכן
- **סקירות חצי-שנתיות**: ארגון מחדש ושיפור מקיף
- **שחרורים שנתיים**: עדכוני גרסה עיקריים עם שיפורים ניכרים

### ניטור ואבטחת איכות
- **בדיקות אוטומטיות**: אימות קבוע של דוגמאות קוד וקישורים
- **שילוב משוב מהקהילה**: שילוב קבוע של הצעות משתמשים
- **עדכוני טכנולוגיה**: יישור עם שירותי Azure וגרסאות azd האחרונות
- **בדיקות נגישות**: סקירה קבועה של עקרונות עיצוב מכיל

## מדיניות תמיכה בגרסאות

### תמיכה בגרסה הנוכחית
- **גרסה ראשית אחרונה**: תמיכה מלאה עם עדכונים שוטפים
- **גרסה ראשית קודמת**: עדכוני אבטחה ותיקונים קריטיים למשך 12 חודשים
- **גרסאות ישנות**: תמיכה מהקהילה בלבד, ללא עדכונים רשמיים

### הנחיות הגירה
כאשר יוצאות גרסאות ראשיות, אנו מספקים:
- **מדריכי הגירה**: הוראות שלב אחר שלב למעבר
- **הערות תאימות**: פרטים על שינויים משבשים
- **תמיכת כלי עבודה**: סקריפטים או כלי עזר להקלה על ההגירה
- **תמיכת קהילה**: פורומים ייעודיים לשאלות על הגירה

---

**ניווט**
- **שיעור קודם**: [מדריך לימוד](resources/study-guide.md)
- **שיעור הבא**: חזור אל [README ראשי](README.md)

**הישאר מעודכן**: עקוב אחר מאגר זה לקבלת התראות על גרסאות חדשות ועדכונים חשובים לחומרי הלימוד.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->