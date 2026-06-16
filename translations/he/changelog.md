# יומן שינויים - AZD למתחילים

## مقدمة

יומן שינויים זה מתעד את כל השינויים, העדכונים וההתקדמות המשמעותיים במחסן AZD למתחילים. אנו פועלים לפי עקרונות ניהול גרסאות סמנטיות ומתחזקים יומן זה כדי לעזור למשתמשים להבין מה השתנה בין הגרסאות.

## מטרות הלמידה

על ידי צפייה ביומן שינויים זה, תוכל:
- להתעדכן בתכונות ותכנים חדשים שהתווספו
- להבין שיפורים שנעשו בתיעוד הקיים
- לעקוב אחר תיקוני באגים ותיקונים לוודא דיוק
- לעקוב אחרי התקדמות חומר הלמידה עם הזמן

## תוצאות הלמידה

לאחר סקירת רשומות יומן השינויים, תוכל:
- לזהות תכנים ומשאבים חדשים הזמינים ללמידה
- להבין אילו חלקים עודכנו או שופרו
- לתכנן את מסלול הלמידה שלך בהתבסס על החומרים המעודכנים ביותר
- לתרום משוב והצעות לשיפורים עתידיים

## היסטוריית גרסאות

### [v3.22.0] - 16-06-2026

#### מילוי הפרצות למתחילים #2: כתיבת תבניות, מכולות פיתוח, Pulumi, Azure DevOps, עקרונות שירות ועוד  
**גרסה זו סוגרת את הפערים הבינוניים שנותרו שזוהו באמצעות ניתוח azd-coverage: כיצד לכתוב ולפרסם תבנית משלך, סביבות מכולות פיתוח / Codespaces הניתנות לשחזור, ספק התשתית Pulumi, מבט כולל על Azure DevOps CI/CD, אימות שירות-עיקרי, הדרכה לבחירת מארח (AKS / Spring Apps), הסברים על `azd restore` / `azd package`, טיפול שגיאות ב-hook, ושיטות עבודה סביבת צוות / שיתוף.**

#### נוסף
- **🧱 שיעור חדש בפרק 4** `docs/chapter-04-infrastructure/custom-templates.md` — כתיבת תבנית azd משלך: מבנה נדרש (`azure.yaml`, `infra/`, `src/`), שדה `metadata.template`, פרמטריזציה של תשתית עם אסימון משאבים `uniqueString()` ותג `azd-env-name`, בדיקות מקומיות עם `azd init --template <local-path>`, פרסום ל-GitHub, והגשה לגלריית Awesome AZD  
- **📦 שיעור חדש בפרק 1** `docs/chapter-01-foundation/dev-containers.md` — סביבות azd הניתנות לשחזור עם מכולות פיתוח ו-GitHub Codespaces: קובץ מינימלי `.devcontainer/devcontainer.json` המשתמש בתכונה הרשמית של `ghcr.io/azure/azure-dev/azd`, תכונות לפי שפה, `docker-in-docker` עבור מארחי מכולות, וכניסה מרוחקת באמצעות `azd auth login --use-device-code`  
- **🧩 Pulumi עם azd** בסעיף `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, תבנית תיקיות Pulumi, מחסניות המקושרות לסביבות azd, דרישות לפלט/תיוג, וזרימת עבודה זהה של `azd up` / `azd down`  
- **🎯 הדרכה לבחירת מארח** ב-`docs/chapter-04-infrastructure/provisioning.md` — השוואה ידידותית למתחילים בין `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, ו-`springapp`, עם הדרכה מתי לבחור AKS או Azure Spring Apps  
- **🛠️ מדריך Azure DevOps CI/CD** ב-`docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, חיבור שירות עם זהות עומס עבודה מבוססת פדרציה (OIDC), הקובץ `azure-dev.yml` שנוצר, וקונפיגורציית קבוצת משתנים  
- **🔑 עקרונות שירות (תבנית 4)** נוסף ל-`docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` שאינו אינטראקטיבי עם סוד לקוח לעומת הרשאות מבוססות פדרציה/OIDC, מתי להשתמש ואחסון מאובטח של אישורים  
- **🪝 טיפול שגיאות ב-hook** ב-`docs/chapter-04-infrastructure/deployment-guide.md` — קודי יציאה ו-`set -e`, `continueOnError`, בדיקת hooks בבידוד עם `azd hooks run`, קונכיות OS ספציפיות, ו-`--debug`  
- **👥 צוות / סביבות משותפות** ב-`docs/chapter-03-configuration/configuration.md` — מה נשמר ב-`.azure/`, מה לכלול ב-gitignore, סביבות פר מפתח, `azd env list`/`select`, והגדרת ערכי סביבה ב-CI/CD  
- **🧰 הסברים על `azd restore` ו-`azd package` מורחבים** ב-`resources/cheat-sheet.md` — שחזור תלות ובניית ארטיפקט פרוסה ללא פריסה  

#### שונה
- **🧭 טבלת השיעורים בפרק 4** עודכנה לכלול את השיעור החדש "כתיבת התבנית שלך" (שיעור 3)  
- **🧭 טבלת השיעורים בפרק 1** עודכנה לכלול את השיעור החדש "מכולות פיתוח ו-Codespaces" (שיעור 5); כותרת תחתונה לניווט מחוברת בין `bring-your-own-app.md` ל-`dev-containers.md`  

### [v3.21.0] - 16-06-2026

#### מילוי הפער למתחילים: שיעור מעשי עם סוכנים מרובים, "הבא את האפליקציה שלך," Terraform, ומדריך CI/CD  
**גרסה זו סוגרת את הפערים הגדולים ביותר למדריך מתחילים מלא על ידי הוספת שני שיעורים מעשיים חדשים (מדריך פריסה עם סוכנים מרובים והוספת azd לאפליקציה קיימת), מבוא ידידותי ל-hooks, סעיף Terraform עם azd, מדריך צעד-אחר-צעד לצינורות GitHub Actions, הסבר על תוספי תצוגה מוקדמת חדשים, ורשימת בדיקה מפורטת לאימות פריסה.**

#### נוסף
- **🤝 שיעור חדש בפרק 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — מדריך פריסה ידני מלא לשני סוכנים (מארגן + מומחים) עם תבנית אמיתית (`contoso-creative-writer`), כולל מתי להשתמש בסוכנים מרובים, זרימת העבודה של `azd up`, הבנת המשאבים המפורסמים, מעקב בין סוכנים, התאמה אישית וניקוי  
- **📦 שיעור חדש בפרק 1** `docs/chapter-01-foundation/bring-your-own-app.md` — כיצד להוסיף azd לפרויקט קיים עם `azd init` ("השתמש בקוד בתיקייה הנוכחית"), הבנת `azure.yaml` ו- `infra/`, יצירת תשתיות עם `azd infra generate`, זיהוי מארח, ופריסה עם `azd up`  
- **🌐 Terraform עם azd** נוסף ל-`docs/chapter-04-infrastructure/provisioning.md` — קונפיגורציית `infra.provider: terraform`, תבנית תיקיות `.tf`, פלטים נדרשים `AZURE_*` ותיוג `azd-env-name`, וזרימת עבודה זהה של `azd up` / `azd down` (סוגר את הפער בו נדרשה תמיכה ב-Terraform אך הוצג רק Bicep)  
- **⚙️ מדריך צעד-אחר-צעד ל-GitHub Actions** ב-`docs/chapter-08-production/production-ai-practices.md` — מהמאגר ב-GitHub לפריסות אוטומטיות: `azd pipeline config`, הרשאות פדרציה OIDC (ללא סודות מאוחסנים), הקובץ `azure-dev.yml` שנוצר, והדרכת הפרדה בין סודות למשתנים  
- **🪝 מבוא ל-"חדש ל-hooks?"** ב-`docs/chapter-04-infrastructure/deployment-guide.md` — מהו hook, טבלת שלבי hook, hook ראשוני מינימלי, והרצת hooks ידנית עם `azd hooks run`  
- **✅ רשימת בדיקה של "אמת את הפריסה שלך"** נוסף לשלב 5 ב-`docs/chapter-01-foundation/first-project.md` — בדיקת עשן, בדיקת נקודת קצה בריאות, וקריטריוני הצלחה מפורשים  
- **🧩 הסבר על תוספים חדשים בתצוגה מוקדמת** `azure.ai.skills` ו-`azure.ai.connections` (מה הם ומתי להשתמש בהם) ב-`docs/chapter-08-production/production-ai-practices.md`  

#### שונה
- **🧭 טבלת שיעורים בפרק 5** תוקנה: `multi-agent-basics.md` הוא כעת שיעור 1 (השיעור המעשי היחיד), עם תיוג נכון ששיעור 2 נמצא בפרק 6 ותסריט קמעונאות הוא טיוטת ארכיטקטורה ולא תבנית פקודה בודדת  
- **🧭 טבלת שיעורים בפרק 1** כוללת כעת את השיעור החדש "הבא את האפליקציה שלך" (שיעור 4)  
- **🔗 כותרות תחתונות לניווט** עודכנו: `first-project.md` כעת מקשר קדימה ל-`bring-your-own-app.md`  

#### תוקן
- **🧱 סגור הפער של Terraform שנטען אך לא היה קיים** — הקורס התייחס לתמיכה ב-Terraform ללא הצגה  
- **🔀 קישורים צולבים מטעה בפרק 5 תוקנו** שאמרו שקיימת מימוש מלא לניהול סוכנים מרובים כשבפועל הייתה טיוטת ארכיטקטורה בלבד  

#### קבצים מעודכנים
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

### [v3.20.0] - 16-06-2026

#### רענון AZD 1.25.6, פקודות מחזור חיים מלאות של סוכן ושינוי מותג Aspire  
**גרסה זו מאמתת שוב את הקורס עם `azd` `1.25.6` (יוני 2026) והתוסף `azure.ai.agents` `0.1.40-preview`, מרחיבה הנחיות AI מ"יצירת סוכן" למחזור חיים מלא של סוכן (בדיקה → הערכה → אופטימיזציה → בדיקה → מחיקה), מציגה את תוספי התצוגה המוקדמת החדשים `azure.ai.skills` ו-`azure.ai.connections`, ומציינת את שינוי המותג מ-".NET Aspire" ל-"Aspire".**

#### נוסף
- **🔁 כיסוי מלא של מחזור חיי הסוכן** למתחילים ולמהנדסי AI במסמכים:  
  - `docs/chapter-01-foundation/azd-basics.md` — טבלת מחזור חיים (יצירה → בדיקה → מדידה → שיפור → בדיקה → ניקוי) הוספה לסעיף תוספים ופקודות AI  
  - `docs/chapter-08-production/production-ai-practices.md` — "ניהול מחזור חיים של סוכן" חדש הכולל `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`  
  - `resources/cheat-sheet.md` — פקודות AI Agent מורחבות עם `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, ו-`delete --force`  
- **🧩 תוספי תצוגה מוקדמת חדשים** מתועדים: `azure.ai.skills` (כישורים חוזרים של סוכן) ו-`azure.ai.connections` (חיבורי Foundry) נוספו לטבלת התוספים ולגליון הטיפים  
- **⏱️ הנחיות לזמני תגובה** — דוגמאות ל-`azd ai agent invoke` מציינות כעת מדידת זמן כולל וזמן לקבלת הבייט הראשון  
- **📌 באנר גרסה** ב-README השורש המכוון ל-`azd version` ו-`azd upgrade`  

#### שונה
- **✅ קו בסיס אימות עודכן** מ-`azd 1.23.12` (מרץ 2026) ל-`azd 1.25.6` (יוני 2026) בכל קבצי README שלפרקים ובמסמכי הסדנה  
- **🤖 הערת תוסף בפרק 2** עודכנה מ-`azure.ai.agents` `0.1.18-preview` ל-`0.1.40-preview`  
- **🧪 דוגמת אימות לסדנה** (`azd version` פלט) עודכנה ל-`1.25.6`  
- **🧭 README "מה חדש ב-azd היום"** רועננה להדגיש מחזור חיים מלא לסוכן, תוספי AI חדשים, ותיקוני נוחות לאחרונה (`azd init` אידמפוטנטיות, ניקוי אסימון פג תוקף ב-`azd auth login`, קריאת הפעם הראשונה ל-`azd tool`)  
- **📖 agents.md בפרק 2 (אופציה 4)** מכוון כעת ללפקודות מחזור חיים לאחר פריסה במקום עצירה ב-`azd up`  

#### תוקן
- **🏷️ שם מוצר** — נוסף סיפור שינוי מותג Aspire (".NET Aspire" הוא כעת פשוט "Aspire"); תמיכת azd ב-Aspire נשארת ללא שינוי  
- **🔎 אימות שחרור חי** אושר מול פיד שחרור Azure Developer CLI: CLI יציב `1.25.6` (12-06-2026) ו-`azure.ai.agents` `0.1.40-preview` (15-06-2026)  

#### קבצים מעודכנים
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

### [v3.19.1] - 27-03-2026
#### הבהרת התאקלמות למתחילים, אימות התקנה וניקוי פקודת AZD סופית  
**גרסה זו עוקבת אחרי סריקת אימות AZD 1.23 עם מעבר תיעוד ממוקד למתחילים: היא מבהירה את הנחיות האימות ב-AZD ראשית, מוסיפה סקריפטים לאימות התקנה מקומית, מאמתת פקודות מפתח מול CLI של AZD הרץ, ומסירה את הפניות האחרונות לפקודות מיושנות במקור האנגלי מחוץ ליום השינויים.**

#### נוסף  
- **🧪 סקריפטים לאימות התקנה למתחילים** עם `validate-setup.ps1` ו-`validate-setup.sh` כדי שלומדים יוכלו לוודא את הכלים הדרושים לפני תחילת פרק 1  
- **✅ שלבי אימות התקנה מקדימים** בקובץ ה-README הראשי ובקובץ ה-README של פרק 1 כדי לתפוס תנאים מוקדמים חסרים לפני `azd up`  

#### שונה  
- **🔐 הנחיות אימות למתחילים** מטפלות מעתה ב-`azd auth login` כדרך הראשית לעבודה עם AZD, עם ציון `az login` כאופציונלי אלא אם משתמשים בפקודות Azure CLI ישירות  
- **📚 זרימת ההתאקלמות בפרק 1** מצביעה כעת על הדרישה שלומדים יאמתו את ההתקנה המקומית לפני התקנה, אימות, ושלבי הפריסה הראשונים  
- **🛠️ הודעות המוודא** מפרידות כעת בבירור בין דרישות חוסמות לבין אזהרות Azure CLI אופציונליות בשביל נתיב המתחילים ב-AZD בלבד  
- **📖 תיעוד תצורה, פתרון תקלות ודוגמאות** מבדילים כעת בין אימות חובה ב-AZD לבין ההזדהות האופציונלית של Azure CLI במקום שבו שניהם הוצגו קודם ללא הקשר  

#### תוקן  
- **📋 הפניות לפקודות במקור האנגלי שנותרו** עודכנו לצורות הנוכחיות של AZD, כולל `azd config show` בגליון הטיפים ו-`azd monitor --overview` במקום שבו הייתה כוונה להדרכת מבט כולל בפורטל Azure  
- **🧭 טענות למתחילים בפרק 1** הומתנו כדי להימנע מהבטחות מוקדמות להתנהגות מובטחת ללא שגיאות או ביטול בכל התבניות ומשאבי Azure  
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

#### אימות AZD 1.23.12, הרחבת סביבה בסדנה וחדשות למודל AI  
**גרסה זו מבצעת סריקת אימות תיעוד נגד `azd` גרסה `1.23.12`, מעדכנת דוגמאות פקודות AZD מיושנות, מרעננת הנחיות מודל AI לברירות מחדל עדכניות, ומרחיבה את הוראות הסדנה מעבר ל-GitHub Codespaces לתמיכה גם במכולות פיתוח ושכפולים מקומיים.**

#### נוסף  
- **✅ הערות אימות בפרקי הליבה ותיעודי הסדנה** להבהרת בסיס AZD שנבדק עבור לומדים המשתמשים בגרסאות CLI חדשות או ישנות יותר  
- **⏱️ הנחיות לגרסת timeout פריסות AI ארוכות טווח** באמצעות `azd deploy --timeout 1800`  
- **🔎 שלבי בדיקת הרחבות** עם `azd extension show azure.ai.agents` בתיעודי זרימת AI  
- **🌐 הנחיות סביבה רחבות יותר בסדנה** המכסות GitHub Codespaces, מכולות פיתוח ושכפולים מקומיים עם MkDocs  

#### שונה  
- **📚 קובצי README מבוא לפרקים** מציינים כעת באחידות אימות ב-`azd 1.23.12` לאורך יסוד, תצורה, תשתית, רב-סוכנים, טרום-פריסה, פתרון תקלות ופרקי הפקה  
- **🛠️ הפניות פקודות AZD** עודכנו לצורות הנוכחיות לאורך התיעוד:  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` או `azd env get-value(s)` בהתאם להקשר  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview` במקום שבו נועד מבט כולל באפליקציית Insights  
- **🧪 דוגמאות תצוגה מוקדמת לפרוביז'ן** פושטו לשימוש נתמך עדכני כמו `azd provision --preview` ו-`azd provision --preview -e production`  
- **🧭 זרימת הסדנה** עודכנה כדי לאפשר לסגל לסיים את המעבדות בקודספרייס, מכולת פיתוח, או שכפול מקומי במקום להניח הפעלה רק בקודספרייס  
- **🔐 הנחיות אימות** מעדיפות כעת `azd auth login` לעבודה עם AZD, עם `az login` מוצב כאופציונלי כשמשתמשים ישירות בפקודות Azure CLI  

#### תוקן  
- **🪟 פקודות התקנת Windows** הותאמו לכתיב החבילה הנוכחי של `winget` במדריך ההתקנה  
- **🐧 הנחיות התקנת Linux** תוקנו כדי להימנע מהוראות מנהל חבילות `azd` ספציפיות להפצה שלא נתמכות, ובמקום זאת מצביעות לאמצעי הפצה במידת הצורך  
- **📦 דוגמאות למודלי AI** רעננו מברירות מחדל ישנות כמו `gpt-35-turbo` ו-`text-embedding-ada-002` לדוגמאות עדכניות כגון `gpt-4.1-mini`, `gpt-4.1`, ו-`text-embedding-3-large`  
- **📋 קטעי פריסה ואבחון** תוקנו לשימוש בפקודות סביבה ומצב נוכחיות ביומנים, סקריפטים, ושלבי פתרון תקלות  
- **⚙️ הנחיות GitHub Actions** עודכנו מ-`Azure/setup-azd@v1.0.0` ל-`Azure/setup-azd@v2`  
- **🤖 הנחיות הסכמה MCP/Copilot** עודכנו מ-`azd mcp consent` ל-`azd copilot consent list`  

#### שופר  
- **🧠 הנחיות פרק AI** מסבירות טוב יותר את ההתנהגות הרגישה לתצוגה מוקדמת של `azd ai`, כניסה מותאמת לדייר, שימוש נוכחי בהרחבות, והמלצות עדכניות לפריסת מודלים  
- **🧪 הוראות הסדנה** משתמשות כעת בדוגמאות גרסאות יותר מציאותיות ושפה ברורה יותר לאימות סביבה במעבדות מעשיות  
- **📈 תיעוד הפקה ופתרון תקלות** מתואם טוב יותר עם הדוגמאות הנוכחיות לניטור, מודל גיבוי, ורמות עלויות  

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
**גרסה זו מוסיפה כיסוי פקודות `azd ai`, `azd extension` ו-`azd mcp` בכל פרקי AI, מתקן קישורים שבורים וקוד מיושן ב-agents.md, מעדכנת את גליון הטיפים, ומשדרגת את פרק התבניות לדוגמא עם תיאורים מאומתים ותבניות Azure AI AZD חדשות.**

#### נוסף  
- **🤖 כיסוי פקודות AZD AI CLI** ב-7 קבצים (קודם בפרק 8 בלבד):  
  - `docs/chapter-01-foundation/azd-basics.md` — מדור חדש "הרחבות ופקודות AI" המציג `azd extension`, `azd ai agent init`, ו-`azd mcp`  
  - `docs/chapter-02-ai-development/agents.md` — אפשרות 4: `azd ai agent init` עם טבלת השוואה (תבנית מול גישת המניפסט)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — תת-סעיפים "הרחבות AZD לפאונדרי" ו-"פריסת סוכן ראשוני"  
  - `docs/chapter-05-multi-agent/README.md` — התחלה מהירה מראה כעת מסלולי פריסה מבוססי תבנית ומניפסט  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — סעיף פריסה כולל כעת את `azd ai agent init`  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — תת-סעיף "פקודות הרחבת AI של AZD לאבחון"  
  - `resources/cheat-sheet.md` — מדור חדש "פקודות AI והרחבות" עם `azd extension`, `azd ai agent init`, `azd mcp`, ו-`azd infra generate`  
- **📦 תבניות דוגמא חדשות ל-AZD AI** ב-`microsoft-foundry-integration.md`:  
  - **azure-search-openai-demo-csharp** — שיחת RAG ב-.NET עם Blazor WebAssembly, Semantic Kernel, ותמיכה בשיחת קול  
  - **azure-search-openai-demo-java** — שיחת RAG ב-Java באמצעות Langchain4J עם אפשרויות פריסה ל-ACA/AKS  
  - **contoso-creative-writer** — אפליקציית כתיבה יצירתית רב-סוכנית המשתמשת ב-Azure AI Agent Service, Bing Grounding, ו-Prompty  
  - **serverless-chat-langchainjs** — RAG ללא שרת באמצעות Azure Functions + LangChain.js + Cosmos DB עם תמיכה בפיתוח מקומי Ollama  
  - **chat-with-your-data-solution-accelerator** — מאיץ RAG ארגוני עם פורטל ניהול, אינטגרציית Teams ואפשרויות PostgreSQL/Cosmos DB  
  - **azure-ai-travel-agents** — אפליקציית הפניה (orchestration) של MCP רב-סוכנים עם שרתים ב-.NET, Python, Java, ו-TypeScript  
  - **azd-ai-starter** — תבנית התחלה מינימלית לתשתית Azure AI ב-Bicep  
  - **🔗 קישור לגלריית AZD AI מדהימה** — הפניה ל[גלריית awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (מעל 80 תבניות)  

#### תוקן  
- **🔗 ניווט agents.md**: קישורי הקודם/הבא מתאימים כעת לסדר השיעורים ב-README של פרק 2 (שילוב פאונדרי → סוכנים → פריסת מודל AI)  
- **🔗 קישורים שבורים ב-agents.md**: `production-ai-practices.md` תוקנה ל-`../chapter-08-production/production-ai-practices.md` (3 הופעות)  
- **📦 קוד מיושן ב-agents.md**: הוחלף `opencensus` ב-`azure-monitor-opentelemetry` + OpenTelemetry SDK  
- **🐛 API לא חוקי ב-agents.md**: `max_tokens` הועבר מ-`create_agent()` ל-`create_run()` בתור `max_completion_tokens`  
- **🔢 ספירת תוקנים ב-agents.md**: הוחלפה הערכה גסה `len//4` ב- `tiktoken.encoding_for_model()`  
- **azure-search-openai-demo**: שירותים תוקנו מ-"Cognitive Search + App Service" ל-"Azure AI Search + Azure Container Apps" (מארח ברירת המחדל השתנה לאוקטובר 2024)  
- **contoso-chat**: תיאור עודכן להפנות ל-Azure AI Foundry + Prompty, תואם לכותרת המאגרים הערכתית ולטכנולוגיה  

#### הוסר  
- **ai-document-processing**: הוסרה הפנייה לתבנית לא פעילה (מאגר לא נגיש כציבור כתבנית AZD)  

#### שופר  
- **📝 תרגילים ב-agents.md**: תרגיל 1 מראה כעת את התוצאה הצפויה ושלב `azd monitor`; תרגיל 2 כולל קוד רישום מלא ל-`FunctionTool`; תרגיל 3 מחליף הנחיות לא ברורות בפקודות ממוקדות של `prepdocs.py`  
- **📚 משאבים ב-agents.md**: קישורי תיעוד עודכנו לדוקומנטציה נוכחית של Azure AI Agent Service והתחלה מהירה  
- **📋 טבלת צעדים הבאים ב-agents.md**: נוספה קישור למעבדה בסדנת AI לכיסוי פרקי מלא  

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

#### שיפור ניווט בקורס  
**גרסה זו משפרת את הניווט בפרקי README.md עם פורמט טבלה משודרג.**

#### שונתה  
- **טבלת מפת הקורס**: משודרגת עם קישורים ישירים לשיעורים, הערכות משך זמן ודירוגי מורכבות  
- **ניקוי תיקיות**: הוסרו תיקיות ישנות מיותרות (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **אימות קישורים**: כל 21+ הקישורים הפנימיים בטבלת מפת הקורס אומתו  

### [v3.16.0] - 2026-02-05

#### עדכוני שם מוצר  
**גרסה זו מעדכנת אזכורים למותגי מיקרוסופט הנוכחיים.**

#### שונתה  
- **Microsoft Foundry → Microsoft Foundry**: כל האזכורים עודכנו בכל הקבצים שאינם תרגום  
- **Azure AI Agent Service → Foundry Agents**: שם השירות עודכן לשקף את המיתוג הנוכחי  

#### קבצים עודכנו  
- `README.md` - דף נחיתה ראשי של הקורס  
- `changelog.md` - היסטוריית גרסאות  
- `course-outline.md` - מבנה הקורס  
- `docs/chapter-02-ai-development/agents.md` - מדריך סוכני AI  
- `examples/README.md` - תיעוד דוגמאות  
- `workshop/README.md` - דף נחיתה לסדנה  
- `workshop/docs/index.md` - אינדקס סדנה  
- `workshop/docs/instructions/*.md` - כל קבצי ההוראות בסדנה  

---

### [v3.15.0] - 2026-02-05

#### ארגון מחודש של המאגר: שמות תיקיות מבוססי פרקים  
**גרסה זו מארגנת מחדש את התיעוד לתיקיות פרקים ייעודיות לניווט ברור יותר.**

#### שינויים בשמות התיקיות  
התיקיות הישנות הוחלפו בתיקיות ממוספרות לפי פרקים:  
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

#### נוספו  
- **📚 קבצי README לפרקים**: נוצר README.md בכל תיקיית פרק עם:  
  - יעדי לימוד ומשך זמן  
  - טבלת שיעורים עם תיאורים  
  - פקודות התחלה מהירה  
  - ניווט לפרקים אחרים  

#### שונתה  
- **🔗 עדכון כל הקישורים הפנימיים**: 78+ נתיבים עודכנו בכל קבצי התיעוד  
- **🗺️ README.md ראשי**: מעודכנת מפת הקורס במבנה הפרקים החדש  
- **📝 examples/README.md**: עדכון אזכורים שבתיקיות הפרקים  

#### הוסרו  
- מבנה תיקיות ישן (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05

#### ארגון מחודש של המאגר: ניווט בפרקים  
**גרסה זו הוסיפה קבצי README לניווט בפרקים (הוחלפה ב-v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### מדריך חדש לסוכני AI  
**גרסה זו מוסיפה מדריך מקיף לפריסת סוכני AI באמצעות Azure Developer CLI.**

#### נוספה  
- **🤖 docs/microsoft-foundry/agents.md**: מדריך מלא הכולל:  
  - מה הם סוכני AI ואיך הם שונים מצ׳אטבוטים  
  - שלושה תבניות סוכנים להתחלה מהירה (Foundry Agents, Prompty, RAG)  
  - דפוסי ארכיטקטורת סוכנים (סוכן יחיד, RAG, רב-סוכני)  
  - תצורת כלים והתאמה אישית  
  - ניטור ומעקב מדדים  
  - שיקולי עלות ואופטימיזציה  
  - תרחישי פתרון בעיות נפוצים  
  - שלושה תרגילים מעשיים עם קריטריוני הצלחה  

#### מבנה התוכן  
- **הקדמה**: מושגי סוכנים למתחילים  
- **התחלה מהירה**: פריסת סוכנים עם `azd init --template get-started-with-ai-agents`  
- **דפוסי ארכיטקטורה**: דיאגרמות חזותיות של דפוסי סוכנים  
- **תצורה**: הגדרת כלים ומשתני סביבה  
- **ניטור**: אינטגרציה עם Application Insights  
- **תרגילים**: לימוד הדרגתי מעשי (20-45 דקות כל אחד)  

---

### [v3.12.0] - 2026-02-05

#### עדכון סביבת DevContainer  
**גרסה זו מעדכנת את קונפיגורציית מיכל הפיתוח עם כלים מודרניים וערכי ברירת מחדל משופרים לחוויית הלמידה של AZD.**

#### שונתה  
- **🐳 תמונת בסיס**: שודרגה מ- `python:3.12-bullseye` ל- `python:3.12-bookworm` (דביאן יציבה עדכנית)  
- **📛 שם המיכל**: שונה מ-"Python 3" ל-"AZD for Beginners" למען בהירות  

#### נוספו  
- **🔧 תכונות חדשות במיכל פיתוח**:  
  - `azure-cli` עם תמיכה ב-Bicep מופעלת  
  - `node:20` (גרסת LTS עבור תבניות AZD)  
  - `github-cli` לניהול תבניות  
  - `docker-in-docker` לפריסת אפליקציות מיכל  

- **🔌 העברת פורטים**: פורטים מוגדרים מראש לפיתוח נפוץ:  
  - 8000 (תצוגה מקדימה של MkDocs)  
  - 3000 (אפליקציות ווב)  
  - 5000 (Python Flask)  
  - 8080 (APIs)  

- **🧩 הרחבות VS Code חדשות**:  
  - `ms-python.vscode-pylance` - IntelliSense משופר לפייתון  
  - `ms-azuretools.vscode-azurefunctions` - תמיכה ב-Azure Functions  
  - `ms-azuretools.vscode-docker` - תמיכה בדוקר  
  - `ms-azuretools.vscode-bicep` - תמיכה בשפת Bicep  
  - `ms-azure-devtools.azure-resource-groups` - ניהול משאבי Azure  
  - `yzhang.markdown-all-in-one` - עריכת Markdown כוללת  
  - `DavidAnson.vscode-markdownlint` - בדיקת Markdown  
  - `bierner.markdown-mermaid` - תמיכה בדיאגרמות Mermaid  
  - `redhat.vscode-yaml` - תמיכה ב-YAML (ל-azure.yaml)  
  - `eamodio.gitlens` - הצגת מידע על גיט  
  - `mhutchie.git-graph` - היסטוריית גיט  

- **⚙️ הגדרות VS Code**: נוספו הגדרות ברירת מחדל לפרשן Python, עיצוב שמירה וגזירת רווחים  

- **📦 עדכון requirements-dev.txt**:  
  - נוסף תוסף minify ל-MkDocs  
  - נוסף pre-commit לאיכות קוד  
  - נוספו חבילות Azure SDK (azure-identity, azure-mgmt-resource)  

#### תוקן  
- **פקודת Post-Create**: כעת מאמתת התקנת AZD ו-Azure CLI בעת הפעלת המיכל  

---

### [v3.11.0] - 2026-02-05

#### שדרוג README למתחילים  
**גרסה זו משפרת משמעותית את README.md כדי להיות נגיש יותר למתחילים ומוסיפה משאבים חיוניים למפתחי AI.**

#### נוספו  
- **🆚 השוואה בין Azure CLI ל-AZD**: הסבר ברור מתי להשתמש בכל כלי עם דוגמאות מעשיות  
- **🌟 קישורים מעולים ל-AZD**: קישורים ישירים לגלריית תבניות קהילה ומשאבי תרומה:  
  - [גלריית Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ תבניות מוכנות לפריסה  
  - [הגשת תבנית](https://github.com/Azure/awesome-azd/issues) - תרומה מהקהילה  
- **🎯 מדריך התחלה מהירה**: חלק התחלה פשוט ב-3 שלבים (התקן → התחבר → פרוס)  
- **📊 טבלת ניווט לפי ניסיון**: הדרכה ברורה על נקודות התחלה לפי רמת ניסיון המפתח  

#### שונתה  
- **מבנה README**: מארגן מחדש לחשיפת מידע הדרגתית - מידע מרכזי ראשון  
- **מדור הקדמה**: נוסח מחדש להסבר "הקסם של `azd up`" למתחילים מוחלטים  
- **הסרת תוכן כפול**: בוטלה סקשן פתרון בעיות משוכפל  
- **פקודות פתרון בעיות**: תיקון הפניות ל-`azd logs` לשימוש ב-`azd monitor --logs`  

#### תוקן  
- **🔐 פקודות אימות**: הוספו `azd auth login` ו-`azd auth logout` ל-cheat-sheet.md  
- **הסרת הפניות לפקודות לא קיימות**: הוסר `azd logs` שנותר בפתרון בעיות ב-README  

#### הערות  
- **טווח שינוי**: שינויים בוצעו ב-README.md הראשי וב-resources/cheat-sheet.md  
- **קהל יעד**: שדרוגים מוכוונים במיוחד למפתחים חדשים ל-AZD  

---

### [v3.10.0] - 2026-02-05

#### עדכון דיוק פקודות Azure Developer CLI  
**גרסה זו מתקנת פקודות AZD שאינן קיימות בתיעוד, ומבטיחה שכל דוגמאות הקוד משתמשות בתחביר תקין של Azure Developer CLI.**

#### תוקן  
- **🔧 הסרת פקודות AZD לא קיימות**: בידוד ותיקון מקיף של פקודות שגויות:  
  - `azd logs` (לא קיים) → הוחלף ב- `azd monitor --logs` או חלופות ב-Azure CLI  
  - תת-הפקודות של `azd service` (לא קיימות) → הוחלפו ב- `azd show` ו-Azure CLI  
  - `azd infra import/export/validate` (לא קיימות) → הוסרו או הוחלפו חלופות תקינות  
  - דגלי `azd deploy --rollback/--incremental/--parallel/--detect-changes` (לא קיימים) → הוסרו  
  - דגלי `azd provision --what-if/--rollback` (לא קיימים) → עודכנו לשימוש ב- `--preview`  
  - `azd config validate` (לא קיימת) → הוחלפה ב- `azd config list`  
  - `azd info`, `azd history`, `azd metrics` (לא קיימים) → הוסרו  

- **📚 קבצים עודכנו עם תיקוני פקודות**:  
  - `resources/cheat-sheet.md`: שדרוג משמעותי ברפרנס פקודות  
  - `docs/deployment/deployment-guide.md`: תיקון אסטרטגיות rollback ופריסה  
  - `docs/troubleshooting/debugging.md`: תיקון סעיפי ניתוח לוגים  
  - `docs/troubleshooting/common-issues.md`: עדכון פקודות פתרון בעיות  
  - `docs/troubleshooting/ai-troubleshooting.md`: תיקון מדור ניפוי שגיאות AZD  
  - `docs/getting-started/azd-basics.md`: תיקון פקודות ניטור  
  - `docs/getting-started/first-project.md`: עדכון דוגמאות ניטור וניפוי שגיאות  
  - `docs/getting-started/installation.md`: תיקון פקודות עזרה וגרסאות  
  - `docs/pre-deployment/application-insights.md`: תיקון פקודות צפייה בלוגים  
  - `docs/pre-deployment/coordination-patterns.md`: תיקון פקודות ניפוי שגיאות סוכן  

- **📝 עדכון הפניה לגרסה**:  
  - `docs/getting-started/installation.md`: שינוי גרסת `1.5.0` מקודדת לגרסה כללית `1.x.x` עם קישור לגרסאות  

#### שונתה  
- **אסטרטגיות Rollback**: תיעוד עודכן לשימוש ב-Git rollback (AZD אינו תומך ב-rollback מובנה)  
- **צפייה בלוגים**: הוחלפו הפניות ל-`azd logs` ב- `azd monitor --logs`, `azd monitor --live` ופקודות Azure CLI  
- **סעיף ביצועים**: הוסרו דגלים לא קיימים לפריסה מקבילה/אינקרמנטלית, הוצעו חלופות תקינות  

#### פרטים טכניים  
- **פקודות AZD תקינות**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`  
- **דגלים תקינים ל-azd monitor**: `--live`, `--logs`, `--overview`  
- **תכונות שהוסרו**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`  

#### הערות  
- **אימות**: הפקודות אומתו מול Azure Developer CLI v1.23.x  

---

### [v3.9.0] - 2026-02-05

#### השלמת סדנת עבודה ושיפור איכות תיעוד  
**גרסה זו משלימה את מודולי הסדנה האינטרקטיביים, מתקנת את כל הקישורים השבורים בתיעוד, ומשפרת את איכות התוכן עבור מפתחי AI המשתמשים ב-Microsoft AZD.**

#### נוספו  
- **📝 CONTRIBUTING.md**: מסמך הנחיות תרומה חדש הכולל:  
  - הוראות ברורות לדיווח בעיות והצעת שינויים  
  - סטנדרטים לתיעוד לתוכן חדש  
  - הנחיות לדוגמת קוד וקונבנציות הודעות commit
  - מידע על מעורבות הקהילה

#### הושלם
- **🎯 מודול סדנה 7 (סיכום)**: מודול סיכום מלא הושלם עם:
  - סיכום מקיף של הישגי הסדנה
  - קטע מושגי מפתח שנלמדו הכולל AZD, תבניות ו-Microsoft Foundry
  - המלצות להמשך מסע הלמידה
  - תרגילי אתגר הסדנה עם דירוגי קושי
  - משוב מהקהילה וקישורי תמיכה

- **📚 מודול סדנה 3 (פירוק)**: היעדים הלימודיים עודכנו עם:
  - הדרכה להפעלת GitHub Copilot עם שרתי MCP
  - הבנת מבנה תיקיית תבניות AZD
  - דפוסי ארגון Infrastructure-as-code (Bicep)
  - הוראות מעבדה מעשית

- **🔧 מודול סדנה 6 (פירוק סופי)**: הושלם עם:
  - מטרות ניקוי משאבים וניהול עלויות
  - שימוש ב-`azd down` להסרת תשתית בטוחה
  - הדרכה לשחזור שירותים קוגניטיביים שנמחקו ברכות
  - שאלות חקר נוספות עבור GitHub Copilot ופורטל Azure

#### תוקן
- **🔗 תיקוני קישורים שבורים**: נפתרו מעל 15 קישורים פנימיים שבורים בתיעוד:
  - `docs/ai-foundry/ai-model-deployment.md`: תוקנו נתיבי microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: תוקנו נתיבי ai-model-deployment.md ו-production-ai-practices.md
  - `docs/getting-started/first-project.md`: הוחלף cicd-integration.md שאינו קיים עם deployment-guide.md
  - `examples/retail-scenario.md`: תוקנו נתיבי שאלות נפוצות ומדריך פתרון בעיות
  - `examples/container-app/microservices/README.md`: תוקנו נתיבי מדריך הקורס ומדריך הפריסה
  - `resources/faq.md` ו-`resources/glossary.md`: עודכנו הפניות לפרק AI
  - `course-outline.md`: תוקנו הפניות למדריך מדריך ולמעבדת הסדנה AI

- **📅 באנר סטטוס הסדנה**: עודכן מ"בתהליך בנייה" למצב סדנה פעילה עם תאריך פברואר 2026

- **🔗 ניווט הסדנה**: תוקנו קישורי ניווט שבורים בקובץ README.md של הסדנה שהפנו לתיקיית lab-1-azd-basics שלא קיימת

#### שונה
- **הצגת הסדנה**: הוסר האזהרה "בתהליך בנייה", הסדנה הושלמה ומוכנה לשימוש
- **עקביות בינהוט**: וודא שכל מודולי הסדנה כוללים ניווט בין-מודולי תקין
- **הפניות למסלול למידה**: עודכנו הפניות בין פרקים לכדי שימוש מתאים בנתיבי microsoft-foundry

#### ואומת
- ✅ כל קבצי Markdown באנגלית כוללים קישורים פנימיים תקינים
- ✅ מודולי סדנה 0-7 שלמים עם יעדי למידה
- ✅ ניווט בין פרקים ומודולים פועל כראוי
- ✅ התוכן מתאים למפתחי AI המשתמשים ב-Microsoft AZD
- ✅ שפה ומבנה ידידותיים למתחילים נשמרו
- ✅ קובץ CONTRIBUTING.md מספק הנחיות ברורות לתורמים מהקהילה

#### יישום טכני
- **אימות קישורים**: סקריפט PowerShell אוטומטי אימת את כל הקישורים הפנימיים בקבצי .md
- **בדיקת תוכן**: סקירה ידנית של השלמת הסדנה והתאמה למתחילים
- **מערכת ניווט**: דפוסי ניווט עקביים לפרקים ומודולים יושמו

#### הערות
- **טווח יישום**: שינויים חלו על התיעוד באנגלית בלבד
- **תרגומים**: תיקיות תרגום לא עודכנו בגרסה זו (תרגום אוטומטי יסתנכרן מאוחר יותר)
- **משך הסדנה**: הסדנה המלאה מספקת כיום 3-4 שעות למידה מעשית

---

### [v3.8.0] - 2025-11-19

#### תיעוד מתקדם: ניטור, אבטחה ודפוסי תיאום מרובי-סוכנים
**גרסה זו מוסיפה שיעורים מקיפים ברמת A על אינטגרציית Application Insights, דפוסי אימות ותיאום מרובי סוכנים עבור פריסות ייצור.**

#### נוסף
- **📊 שיעור אינטגרציית Application Insights**: בקובץ `docs/pre-deployment/application-insights.md`:
  - פריסת AZD ממוקדת עם אספקה אוטומטית
  - תבניות Bicep שלמות ל-Application Insights + Log Analytics
  - יישומי Python פועלים עם טלמטריה מותאמת (מעל 1,200 שורות)
  - דפוסי ניטור AI/LLM (מעקב אחרי אסימון/עלות של Microsoft Foundry Models)
  - 6 דיאגרמות Mermaid (ארכיטקטורה, איתור מופץ, זרם טלמטריה)
  - 3 תרגילים מעשיים (התראות, לוחות בקרה, ניטור AI)
  - דוגמאות שאילתות Kusto ואסטרטגיות אופטימיזציה של עלויות
  - שידור מדדים בזמן אמת ופיענוח בזמן אמת
  - 40-50 דקות זמן למידה עם דפוסי ייצור מוכנים

- **🔐 שיעור דפוסי אימות ואבטחה**: ב-`docs/getting-started/authsecurity.md`:
  - 3 דפוסי אימות (מחרוזות חיבור, Key Vault, זהות מנוהלת)
  - תבניות Bicep שלמות לפריסות מאובטחות
  - קוד אפליקציית Node.js עם אינטגרציה ל-SDK של Azure
  - 3 תרגילים שלמים (הפעלת זהות מנוהלת, זהות מוקצה למשתמש, סיבוב Key Vault)
  - שיטות עבודה מומלצות לאבטחה ותצורות RBAC
  - מדריך פתרון בעיות וניתוח עלויות
  - דפוסי אימות ללא סיסמה מוכנים לייצור

- **🤖 שיעור דפוסי תיאום מרובי-סוכנים**: ב-`docs/pre-deployment/coordination-patterns.md`:
  - 5 דפוסי תיאום (רציף, מקביל, היררכי, מופעל אירועים, קונצנזוס)
  - מימוש שירות אורקסטרציה שלם (Python/Flask, מעל 1,500 שורות)
  - 3 מימושים מיוחדים לסוכנים (מחקר, כותב, עורך)
  - אינטגרציה ל-Service Bus לתור הודעות
  - ניהול מצבים עם Cosmos DB למערכות מבוזרות
  - 6 דיאגרמות Mermaid המציגות אינטראקציות בין סוכנים
  - 3 תרגילים מתקדמים (ניהול זמן סיום, לוגיקת ניסיון מחודשת, מתג מעגל)
  - ניתוח עלויות (240-565 דולר לחודש) עם אסטרטגיות אופטימיזציה
  - אינטגרציית Application Insights לניטור

#### שופר
- **פרק טרום פריסה**: כולל כעת דפוסי ניטור ותיאום מקיפים
- **פרק התחלה**: שופר עם דפוסי אימות מקצועיים
- **מוכנות לייצור**: כיסוי מלא מאבטחה לתצפיתיות
- **מתווה קורס**: עודכן להפניות לשיעורים החדשים בפרקים 3 ו-6

#### שונה
- **התקדמות הלמידה**: אינטגרציה טובה יותר של אבטחה וניטור לאורך הקורס
- **איכות התיעוד**: סטנדרטים עקביים ברמה A (95-97%) בשיעורים החדשים
- **דפוסי ייצור**: כיסוי מקצה-לקצה לפריסות ארגוניות

#### שופר
- **חוויה למפתח**: מסלול ברור מפיתוח לניטור ייצור
- **סטנדרטים לאבטחה**: דפוסי אימות וניהול סודות מקצועיים
- **תצפיתיות**: אינטגרציית Application Insights מלאה עם AZD
- **עומסי עבודה של AI**: ניטור מיוחד ל-Microsoft Foundry Models ומערכות מרובי-סוכנים

#### ואומת
- ✅ כל השיעורים כוללים קוד עובד שלם (לא קטעי קוד)
- ✅ דיאגרמות Mermaid ללמידה ויזואלית (סה"כ 19 בשלושה שיעורים)
- ✅ תרגילי מעשה עם שלבי אימות (סה"כ 9)
- ✅ תבניות Bicep מוכנות ייצור לפריסה עם `azd up`
- ✅ ניתוח עלויות ואסטרטגיות אופטימיזציה
- ✅ מדריכי פתרון בעיות ושיטות עבודה מומלצות
- ✅ נקודות בדיקת ידע עם פקודות אימות

#### תוצאות דירוג התיעוד
- **docs/pre-deployment/application-insights.md**: - מדריך ניטור מקיף
- **docs/getting-started/authsecurity.md**: - דפוסי אבטחה מקצועיים
- **docs/pre-deployment/coordination-patterns.md**: - ארכיטקטורות מתקדמות למרובי סוכנים
- **תוכן כולל חדש**: - סטנדרטים עקביים באיכות גבוהה

#### יישום טכני
- **Application Insights**: Log Analytics + טלמטריה מותאמת + איתור מופץ
- **אימות**: זהות מנוהלת + Key Vault + דפוסי RBAC
- **מרובי סוכנים**: Service Bus + Cosmos DB + Container Apps + אורקסטרציה
- **ניטור**: מדדים חיים + שאילתות Kusto + התראות + לוחות בקרה
- **ניהול עלויות**: דגימה, מדיניות שימור, בקרה תקציבית

### [v3.7.0] - 2025-11-19

#### שיפורי איכות תיעוד ודוגמת Microsoft Foundry Models חדשה
**גרסה זו משפרת איכות תיעוד ברחבי המאגר ומוסיפה דוגמת פריסת Microsoft Foundry Models מלאה עם ממשק שיחה gpt-4.1.**

#### נוסף
- **🤖 דוגמת שיחת Microsoft Foundry Models**: פריסת gpt-4.1 מלאה עם יישום עובד ב-`examples/azure-openai-chat/`:
  - תשתית מלאה של Microsoft Foundry Models (פריסת דגם gpt-4.1)
  - ממשק שיחה בקו הפקודה בפייתון עם היסטוריית שיחות
  - אינטגרציה ל-Key Vault לאחסון מאובטח של מפתחות API
  - מעקב שימוש באסימונים והערכת עלויות
  - הגבלת קצב וטיפול בחריגות
  - README מקיף עם מדריך פריסה של 35-45 דקות
  - 11 קבצים מוכנים לייצור (תבניות Bicep, אפליקציית Python, קונפיגורציה)
- **📚 תרגילי תיעוד**: נוספו תרגילים מעשיים למדריך קונפיגורציה:
  - תרגיל 1: קונפיגורציה מרובת סביבות (15 דקות)
  - תרגיל 2: אימון בניהול סודות (10 דקות)
  - קריטריונים ברורים להצלחה ושלבי אימות
- **✅ אימות פריסה**: נוספה סעיף אימות למדריך פריסה:
  - נהלי בדיקת בריאות
  - רשימת קריטריוני הצלחה
  - פלטים צפויים לכל פקודות הפריסה
  - התייחסות מהירה לפתרון בעיות

#### שופר
- **examples/README.md**: עודכן לאיכות ברמה A (93%):
  - נוסף azure-openai-chat לכל החלקים הרלוונטיים
  - עדכון כמות דוגמאות מקומיות מ-3 ל-4
  - נוסף לטבלת דוגמאות יישומי AI
  - משולב ב-Quick Start למשתמשים בינוניים
  - נוסף לחלק תבניות Microsoft Foundry
  - עדכון מטריצת השוואה וחלקי מציאת טכנולוגיה
- **איכות תיעוד**: שופר מ-B+ (87%) ל-A- (92%) בתיקיית docs:
  - נוספו פלטים צפויים לדוגמאות פקודות קריטיות
  - כללו שלבי אימות לשינויים בקונפיגורציה
  - שיפור הלמידה המעשית עם תרגילים פרקטיים

#### שונה
- **התקדמות למידה**: אינטגרציה טובה יותר של דוגמאות AI ללומדים בינוניים
- **מבנה התיעוד**: תרגילים יותר מעשיים עם תוצאות ברורות
- **תהליך אימות**: נוספו קריטריוני הצלחה מפורשים לזרמי עבודה מרכזיים

#### שופר
- **חוויה למפתח**: פריסת Microsoft Foundry Models אורכת כעת 35-45 דקות (לעומת 60-90 לאלטרנטיבות מורכבות)
- **שקיפות עלויות**: הערכות עלות ברורות (50-200 דולר לחודש) לדוגמת Microsoft Foundry Models
- **מסלול למידה**: למפתחי AI יש נקודת כניסה ברורה עם azure-openai-chat
- **סטנדרטים לתיעוד**: פלטים צפויים ושלבי אימות עקביים

#### ואומת
- ✅ דוגמת Microsoft Foundry Models פועלת במלואה עם `azd up`
- ✅ כל 11 קבצי מימוש נכונים בתחביר
- ✅ הוראות README מתאימות לחוויית פריסה בפועל
- ✅ קישורים בתיעוד מעודכנים בלמעלה מ-8 מיקומים
- ✅ אינדקס דוגמאות משקף במדויק 4 דוגמאות מקומיות
- ✅ אין קישורים חיצוניים כפולים בטבלאות
- ✅ כל הפניות ניווט נכונות

#### יישום טכני
- **ארכיטקטורת Microsoft Foundry Models**: gpt-4.1 + Key Vault + דפוס Container Apps
- **אבטחה**: זהות מנוהלת מוכנה, סודות ב-Key Vault
- **ניטור**: אינטגרציית Application Insights
- **ניהול עלויות**: מעקב אסימונים ואופטימיזציית שימוש
- **פריסה**: פקודת `azd up` בודדת להגדרה מלאה

### [v3.6.0] - 2025-11-19

#### עדכון משמעותי: דוגמאות פריסת אפליקציית מכולות
**גרסה זו מציגה דוגמאות פריסה מלאות ייצור של אפליקציות מכולות המשתמשות ב-Azure Developer CLI (AZD), עם תיעוד מלא ואינטגרציה למסלול הלמידה.**

#### נוסף
- **🚀 דוגמאות אפליקציית מכולות**: דוגמאות מקומיות חדשות ב-`examples/container-app/`:
  - [מדריך ראשי](examples/container-app/README.md): סקירה מלאה של פריסות מכולות, התחלה מהירה, ייצור ודפוסים מתקדמים
  - [API פשוט ב-Flask](../../examples/container-app/simple-flask-api): REST API ידידותי למתחילים עם scale-to-zero, בדיקות בריאות, ניטור ופתרון בעיות
  - [ארכיטקטורת מיקרו-שירותים](../../examples/container-app/microservices): פריסה מוכנה ייצור של שירותים מרובים (API Gateway, מוצר, הזמנה, משתמש, התראה), הודעות אסינכרוניות, Service Bus, Cosmos DB, Azure SQL, איתור מופץ, פריסת blue-green/canary
- **שיטות עבודה מומלצות**: אבטחה, ניטור, אופטימיזציית עלויות והנחיות CI/CD לעומסי עבודה ממכולות
- **דוגמאות קוד**: `azure.yaml` מלא, תבניות Bicep ומימושי שירות בשפות מרובות (Python, Node.js, C#, Go)
- **בדיקות ופתרון בעיות**: תרחישי בדיקה מקצה-לקצה, פקודות ניטור והנחיות פתרון בעיות

#### שונה
- **README.md**: עודכן להצגת קישורים לדוגמאות אפליקציית מכולות תחת "דוגמאות מקומיות - אפליקציות מכולות"
- **examples/README.md**: עודכן להדגשת דוגמאות אפליקציית מכולות, הוספת כניסות מטריצת השוואה, ועדכון הפניות טכנולוגיה וארכיטקטורה
- **מתווה קורס ומדריך לימוד**: עודכנו להפניות לדוגמאות אפליקציית מכולות ודפוסי פריסה בפרקים הרלוונטיים

#### ואומת
- ✅ כל הדוגמאות החדשות ניתן לפרוס עם `azd up` ועומדות בשיטות הטובות
- ✅ קישורים חוצי-תיעוד וניווט עודכנו
- ✅ הדוגמאות מכסות תרחישים למתחילים ועד מתקדמים, כולל מיקרו-שירותים בייצור

#### הערות
- **טווח**: תיעוד ודוגמאות באנגלית בלבד
- **שלבים הבאים**: הרחבה עם דפוסי מכולות מתקדמים נוספים ואוטומציה של CI/CD בגרסאות עתידיות

### [v3.5.0] - 2025-11-19

#### מיתוג מחדש של המוצר: Microsoft Foundry  
**גרסה זו מבצעת שינוי שם מוצר מקיף מ"Microsoft Foundry" ל-"Microsoft Foundry" בכל התיעוד באנגלית, המשקף את המיתוג הרשמי של Microsoft.**

#### שונה
- **🔄 עדכון שם מוצר**: מיתוג מחדש מלא מ-"Microsoft Foundry" ל-"Microsoft Foundry"
  - עודכנו כל ההפניות בתיעוד באנגלית בתיקיית `docs/`
  - תיקיית `docs/ai-foundry/` שונתה ל-`docs/microsoft-foundry/`
- שונה שם הקובץ: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
- סך הכל: 23 הפניות תוכן עודכנו ב-7 קבצי תיעוד

- **📁 שינויים במבנה התיקיות**:
  - `docs/ai-foundry/` שונה ל-`docs/microsoft-foundry/`
  - כל ההפניות החוצות עודכנו כדי לשקף את המבנה החדש של התיקיות
  - קישורי ניווט אומתו בכל התיעוד

- **📄 שינויי שמות קבצים**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - כל הקישורים הפנימיים עודכנו כדי להתייחס לשם הקובץ החדש

#### קבצים מעודכנים
- **תיעוד פרקים** (7 קבצים):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 עדכוני קישורי ניווט
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 הפניות לשמות מוצרים עודכנו
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - כבר משתמש במיקרוסופט Foundry (מעודכנים מהעדכונים הקודמים)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 הפניות עודכנו (סקירה כללית, משוב מהקהילה, תיעוד)
  - `docs/getting-started/azd-basics.md` - 4 קישורי הפניות חוצות עודכנו
  - `docs/getting-started/first-project.md` - 2 קישורי ניווט פרק עודכנו
  - `docs/getting-started/installation.md` - 2 קישורי פרק הבא עודכנו
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 הפניות עודכנו (ניווט, קהילת Discord)
  - `docs/troubleshooting/common-issues.md` - קישור ניווט אחד עודכן
  - `docs/troubleshooting/debugging.md` - קישור ניווט אחד עודכן

- **קבצי מבנה הקורס** (2 קבצים):
  - `README.md` - 17 הפניות עודכנו (סקירת הקורס, כותרות פרקים, מדור תבניות, תובנות קהילתיות)
  - `course-outline.md` - 14 הפניות עודכנו (סקירה, יעדי למידה, מקורות פרקים)

#### אומתו
- ✅ אין הפניות שנותרו לנתיב תיקייה "ai-foundry" בתיעוד האנגלי
- ✅ אין הפניות שנותרו לשם המוצר "Microsoft Foundry" בתיעוד האנגלי
- ✅ כל קישורי הניווט פועלים עם מבנה התיקיות החדש
- ✅ שינוי שמות הקבצים והתיקיות הושלם בהצלחה
- ✅ הפניות חוצות בין הפרקים אומתו

#### הערות
- **תחום**: שינויים הוחלו רק בתיעוד האנגלי בתיקיית `docs/`
- **תרגומים**: תיקיות תרגום (`translations/`) לא עודכנו בגרסה זו
- **סדנה**: חומרי סדנה (`workshop/`) לא עודכנו בגרסה זו
- **דוגמאות**: קבצי דוגמה עשויים עדיין להכיל שמות ישנים (לטיפול בעדכון עתידי)
- **קישורים חיצוניים**: כתובות ו-URL מאגר GitHub נשארו ללא שינוי

#### מדריך הגירה לתורמים
אם יש לכם ענפים מקומיים או תיעוד שמפנה למבנה הישן:
1. עדכנו הפניות לתיקייה: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. עדכנו הפניות לקבצים: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. החליפו את שם המוצר: "Microsoft Foundry" → "Microsoft Foundry"
4. ודאו שכל קישורי התיעוד הפנימיים עדיין פועלים

---

### [v3.4.0] - 2025-10-24

#### שיפורים בתצוגה מקדימה של תשתית ואימות
**גרסה זו מציגה תמיכה מקיפה בתכונת התצוגה המקדימה החדשה של Azure Developer CLI ומשפרת את חווית המשתמש בסדנה.**

#### נוסף
- **🧪 תיעוד פקודת azd provision --preview**: סקירה מלאה של יכולת התצוגה המקדימה החדשה של התשתית
  - הפניות פקודות ודוגמאות שימוש בגליון רמאות
  - שילוב מפורט במדריך הפרוביזיה עם מקרי שימוש ויתרונות
  - שילוב בקרת בדיקה לפני פריסה לאימות בטוח יותר
  - עדכוני מדריך התחלה עם שיטות פריסה בטוחות
- **🚧 באנר סטטוס סדנה**: באנר HTML מקצועי המצביע על סטטוס פיתוח הסדנה
  - עיצוב גרדיאנט עם סימני בנייה לתקשורת ברורה עם המשתמש
  - תאריך עדכון אחרון לשקיפות
  - עיצוב רספונסיבי לכל סוגי המכשירים

#### שופר
- **בטיחות התשתית**: פונקציונליות התצוגה המקדימה משולבת בכל תיעוד הפריסה
- **אימות לפני פריסה**: סקריפטים אוטומטיים כוללים כעת בדיקות תצוגה מקדימה
- **זרימת עבודה למפתחים**: רצפי פקודות מעודכנים כדי לכלול תצוגה מקדימה כפרקטיקה מיטבית
- **חווית הסדנה**: הגדרת ציפיות ברורה למשתמשים בנוגע לסטטוס פיתוח התוכן

#### שונה
- **שיטות פריסה מיטביות**: זרימת עבודה שמעדיפה תצוגה מקדימה כעת מומלצת
- **זרימת תיעוד**: אימות התשתית הוזז מוקדם יותר בתהליך הלמידה
- **הצגת הסדנה**: תקשורת סטטוס מקצועית עם ציר זמן פיתוח ברור

#### שופר
- **גישת בטיחות תחילה**: שינויים בתשתית ניתנים לאימות לפני הפריסה
- **שיתוף פעולה צוותי**: תוצאות התצוגה המקדימה ניתנות לשיתוף לסקירה ואישור
- **מודעות לעלויות**: הבנה טובה יותר של עלויות המשאבים לפני הפרוביזיה
- **הפחתת סיכונים**: הפחתת כישלונות פריסה באמצעות אימות מראש

#### יישום טכני
- **שילוב רב-מסמכי**: תיעוד תכונת התצוגה המקדימה בפנים 4 קבצים מרכזיים
- **פטרני פקודות**: תחביר עקבי ודוגמאות בכל התיעוד
- **שילוב פרקטיקות מיטביות**: תצוגה מקדימה משולבת בזרימות אימות וסקריפטים
- **סימני ויזואליים**: סימוני NEW ברורים לגילוי התכונה

#### תשתית הסדנה
- **תקשורת סטטוס**: באנר HTML מקצועי עם עיצוב גרדיאנט
- **חווית משתמש**: הגדרת סטטוס פיתוח ברורה למניעת בלבול
- **הצגה מקצועית**: שומר על אמינות המאגר ויצירת ציפיות
- **שקיפות ציר זמן**: תאריך עדכון אחרון באוקטובר 2025 לאחריות

### [v3.3.0] - 2025-09-24

#### שיפור חומרי סדנה וחווית למידה אינטראקטיבית
**גרסה זו מציגה חומרי סדנה מקיפים עם מדריכים אינטראקטיביים בדפדפן ונתיבי למידה מובנים.**

#### נוסף
- **🎥 מדריך סדנה אינטראקטיבי**: חווית סדנה בדפדפן עם יכולות תצוגה מקדימה של MkDocs
- **📝 הוראות סדנה מובנות**: נתיב למידה בן 7 שלבים מגלוי ועד התאמה אישית
  - 0-הקדמה: סקירה והגדרת הסדנה
  - 1-בחירת תבנית AI: תהליך גילוי ובחירת תבנית
  - 2-אימות תבנית AI: פריסה וק procedures לאימות
  - 3-פירוק תבנית AI: הבנת מבנה התבנית
  - 4-הגדרת תבנית AI: תצורה והתאמה אישית
  - 5-התאמת תבנית AI: שינויים מתקדמים ואיטרציות
  - 6-פירוק תשתית: ניקוי וניהול משאבים
  - 7-סיכום: סיכום ושלבים הבאים
- **🛠️ כלים לסדנה**: קונפיגורצית MkDocs עם ערכת נושא Material לשיפור הלמידה
- **🎯 נתיב למידה מעשי**: מתודולוגיה בשלושה שלבים (גילוי → פריסה → התאמה אישית)
- **📱 שילוב GitHub Codespaces**: התקנת סביבת פיתוח חלקה

#### שופר
- **מעבדת סדנה AI**: מורחבת עם חווית למידה מובנית של 2-3 שעות
- **תיעוד סדנה**: הצגה מקצועית עם ניווט ועזרים חזותיים
- **התקדמות למידה**: הנחיות שלב-אחר-שלב ברורות מבחירת תבנית ועד פריסה
- **חווית מפתח**: כלי משולבים לזרימות עבודה מואצות

#### שופר
- **נגישות**: ממשק בדפדפן עם חיפוש, יכולת העתקה ומתג ערכות נושא
- **למידה בקצב אישי**: מבנה סדנה גמיש המאפשר התאמה לקצב שונה
- **יישום מעשי**: תרחישי פריסת תבניות AI בעולם האמיתי
- **שילוב קהילתי**: אינטגרציה עם Discord לתמיכה ושיתוף בסדנה

#### תכונות סדנה
- **חיפוש מובנה**: גילוי מהיר של מילות מפתח ושיעורים
- **העתקת קוד**: אפשרות העתקה בהרחפה לכל דוגמאות הקוד
- **מתג ערכה**: תמיכה במצב כהה/בהיר להעדפות שונות
- **נכסי ויזואליזציה**: צילומי מסך ודיאגרמות להבנה משופרת
- **שילוב עזרה**: גישה ישירה ל-Discord לתמיכה קהילתית

### [v3.2.0] - 2025-09-17

#### ארגון ניווט מחודש ומערכת למידה מבוססת פרקים
**גרסה זו מציגה מבנה למידה מקיף מבוסס פרקים עם ניווט משופר בכל המאגר.**

#### נוסף
- **📚 מערכת למידה מבוססת פרקים**: ארגון מאגר כולו ל-8 פרקים הלכה למעשה
  - פרק 1: יסודות והתחלה מהירה (⭐ - 30-45 דקות)
  - פרק 2: פיתוח AI-First (⭐⭐ - 1-2 שעות)
  - פרק 3: תצורה ואימות (⭐⭐ - 45-60 דקות)
  - פרק 4: תשתית כקוד ופריסה (⭐⭐⭐ - 1-1.5 שעות)
  - פרק 5: פתרונות AI עם סוכנים מרובים (⭐⭐⭐⭐ - 2-3 שעות)
  - פרק 6: אימות ותכנון לפני פריסה (⭐⭐ - שעה)
  - פרק 7: פתרון בעיות וניפוי שגיאות (⭐⭐ - 1-1.5 שעות)
  - פרק 8: דפוסים בייצור וארגוניים (⭐⭐⭐⭐ - 2-3 שעות)
- **📚 מערכת ניווט מקיפה**: כותרות ו"רגליות" ניווט עקביות בכל התיעוד
- **🎯 מעקב התקדמות**: רשימת בדיקה להשלמת הקורס ומערכת אימות למידה
- **🗺️ הדרכת נתיבי למידה**: נקודות כניסה ברורות לרמות ניסיון ויעדים שונים
- **🔗 ניווט הפניות חוצות**: פרקים קשורים ותנאים מוקדמים מקושרים בבירור

#### שופר
- **מבנה README**: הוסב לפלטפורמת למידה מובנית המבוססת פרקים
- **ניווט התיעוד**: בכל הדפים נוספה הקשר הפרק והכוונת התקדמות
- **ארגון תבניות**: דוגמאות ותבניות מוצמדות לפרקי למידה מתאימים
- **שילוב משאבים**: גיליונות רמאות, שאלות נפוצות ומדריכי לימוד מחוברים לפרקים המתאימים
- **שילוב סדנאות**: מעבדות מעשיות מותאמות ליעדי למידה בפרקים רבים

#### שונה
- **התקדמות למידה**: מעבר מתיעוד ליניארי ללמידה גמישה מבוססת פרקים
- **מיקום תצורה**: מדריך התצורה מוקם כפרק 3 לזרימת למידה משופרת
- **שילוב תוכן AI**: אינטגרציה משופרת של תוכן AI במסלול הלמידה
- **תוכן ייצור**: דפוסים מתקדמים מרוכזים בפרק 8 ללומדי ארגונים

#### שופר
- **חווית משתמש**: נתיבי ניווט ברורים ומדדי התקדמות בפרקים
- **נגישות**: דפוסי ניווט עקביים להקלת התמצאות בקורס
- **הצגה מקצועית**: מבנה קורס בסגנון אקדמי מתאים להכשרה מקצועית ועסקית
- **יעילות למידה**: קיצור זמן מציאת תוכן רלוונטי באמצעות ארגון משופר

#### יישום טכני
- **כותרות ניווט**: ניווט פרקי אחיד ב-40+ קבצי תיעוד
- **ניווט רגלית**: הנחיית התקדמות עקבית ומדדי השלמת פרקים
- **קישורים פנימיים**: מערכת קישורים פנימיים מקיפה לקישור בין מושגים רלוונטיים
- **מיפוי פרקים**: תבניות ודוגמאות משויכות בבירור ליעדי למידה

#### שיפור מדריך לימוד
- **📚 יעדי למידה מקיפים**: ארגון מחדש של מדריך הלימוד למבנה 8 פרקים
- **🎯 הערכת פרקים**: כל פרק כולל יעדי לימוד ספציפיים ותרגילים מעשיים
- **📋 מעקב התקדמות**: לוח זמנים שבועי ללמידה עם יעדים מדידים ורשימות בדיקה
- **❓ שאלות הערכה**: שאלות לאימות ידע עבור כל פרק עם תוצאות מקצועיות
- **🛠️ תרגילים מעשיים**: פעילויות ידניות עם תרחישי פריסה ומענה לבעיות
- **📊 התקדמות מיומנויות**: התקדמות ברורה מיסודות לדפוסי ארגונים עם דגש על התפתחות קריירה
- **🎓 מסגרת הסמכה**: תוצאות פיתוח מקצועי והכרה קהילתית
- **⏱️ ניהול ציר זמן**: תוכנית למידה מסודרת ל-10 שבועות עם אימות אבני דרך

### [v3.1.0] - 2025-09-17

#### שיפורים בפתרונות AI מרובי סוכנים
**גרסה זו משפרת את פתרון הקמעונאות עם סוכנים מרובים באמצעות שמות סוכנים ברורים ותיעוד משופר.**

#### שונה
- **מונחי סוכנים מרובים**: הוחלף השם "Cora agent" ל-"Customer agent" בכל פתרון הקמעונאות לסוכנים מרובים להבנה ברורה יותר
- **ארכיטקטורת סוכנים**: כל התיעוד, תבניות ARM ודוגמאות הקוד עודכנו לשם "Customer agent" עקבי
- **דוגמאות תצורה**: דפוסי תצורת הסוכן עודכנו לשמות מודרניים
- **עקביות בתיעוד**: כלל ההפניות משתמשות כעת בשמות סוכנים מקצועיים ותיאוריים

#### שופר
- **חבילת תבניות ARM**: עדכון retail-multiagent-arm-template עם הפניות ל-Customer agent
- **דיאגרמות ארכיטקטורה**: רענון דיאגרמות Mermaid עם שמות סוכנים מעודכנים
- **דוגמאות קוד**: מחלקות Python ודוגמאות היישום משתמשות כעת ב-CustomerAgent
- **משתני סביבה**: סקריפטים לפריסה עודכנו להשתמש ב-CUSTOMER_AGENT_NAME

#### משופר
- **חווית מפתח**: תפקידי סוכן ברורים יותר בתיעוד
- **מוכנות לייצור**: התאמה משופרת לדפוסי שמות ארגוניים
- **חומרי לימוד**: שמות סוכנים אינטואיטיביים יותר למטרות חינוכיות
- **שימושיות תבנית**: הבנת תפקודי הסוכן ודפוסי הפריסה הפשוטים יותר

#### פרטים טכניים
- עדכון דיאגרמות ארכיטקטורת Mermaid עם הפניות ל-CustomerAgent
- החלפת מחלקות CoraAgent ב-Python במחלקות CustomerAgent
- שינוי קונפיגורציות JSON בתבנית ARM לסוג סוכן "customer"
- עדכון משתני סביבה מ-CORA_AGENT_* ל-CUSTOMER_AGENT_*
- רענון כל פקודות הפריסה והגדרות הקונטיינר

### [v3.0.0] - 2025-09-12

#### שינויים משמעותיים - מיקוד במפתחי AI ושילוב Microsoft Foundry
**גרסה זו משנה את המאגר למשאב למידה מקיף הממוקד ב-AI עם שילוב של Microsoft Foundry.**

#### נוסף
- **🤖 נתיב למידה AI-First**: ארגון מחדש מלא שמעדיף מפתחי ומהנדסי AI
- **מדריך שילוב Microsoft Foundry**: תיעוד מקיף לחיבור AZD לשירותי Microsoft Foundry
- **דפוסי פריסת דגמי AI**: מדריך מפורט לכיסוי בחירת מודל, תצורה ואסטרטגיות פריסה בייצור
- **מעבדת סדנת AI**: סדנה מעשית של שעתיים-שלוש להמרת יישומי AI לפתרונות הניתנים לפריסה עם AZD  
- **שיטות עבודה מומלצות ל-AI בייצור**: תבניות מוכנות לארגון להרחבה, ניטור ואבטחת עומסי עבודה של AI  
- **מדריך פתרון תקלות ייחודי ל-AI**: פתרון תקלות מקיף לדגמי Microsoft Foundry, שירותי קוגניציה ובעיות פריסת AI  
- **גלריית תבניות AI**: אוסף נבחר של תבניות Microsoft Foundry עם דירוגי מורכבות  
- **חומרי סדנה**: מבנה סדנה מלא עם מעבדות מעשיות וחומרי ייחוס  

#### משופר  
- **מבנה README**: מיועד למפתחי AI עם נתוני עניין של הקהילה בשיעור 45% מ-Microsoft Foundry Discord  
- **מסלולי למידה**: מסלול מפתח AI ייעודי לצד מסלולים מסורתיים לסטודנטים ומהנדסי DevOps  
- **המלצות לתבניות**: תבניות AI מובחרות כולל azure-search-openai-demo, contoso-chat ו-openai-chat-app-quickstart  
- **אינטגרציה קהילתית**: תמיכה משופרת בקהילה בדיסקורד עם ערוצים ודיונים ייעודיים ל-AI  

#### מיקוד באבטחה ובייצור  
- **תבניות זהות מנוהלת**: תצורות אימות ואבטחה ייחודיות ל-AI  
- **אופטימיזציית עלויות**: מעקב שימוש בטוקנים ובקרות תקציב לעומסי עבודה של AI  
- **פריסה מולטי-אזורית**: אסטרטגיות לפריסה גלובלית של יישומי AI  
- **ניטור ביצועים**: מדדים ייעודיים ל-AI ואינטגרציה עם Application Insights  

#### איכות תיעוד  
- **מבנה קורס לינארי**: התקדמות לוגית מדפוסי פריסה למתחילים לדפוסים מתקדמים של AI  
- **כתובות URL מאומתות**: כל קישורי המאגר החיצוניים נבדקו ונגישים  
- **ייחוס מלא**: כל קישורי התיעוד הפנימיים מאומתים ומתפקדים  
- **מוכנות לייצור**: דפוסי פריסה ארגוניים עם דוגמאות מהעולם האמיתי  

### [v2.0.0] - 2025-09-09  

#### שינויים מרכזיים - ארגון מחודש של המאגר ושיפור מקצועי  
**גרסה זו מייצגת מהפכה משמעותית במבנה המאגר ובהצגת התוכן.**  

#### נוסף  
- **מסגרת למידה מובנית**: כל דפי התיעוד כוללים כעת מבוא, יעדי למידה ותוצאות למידה  
- **מערכת ניווט**: קישורי שיעורים הקודמים/הבאיים נוספו בכל התיעוד להתפתחות משולבת בלמידה  
- **מדריך לימוד**: study-guide.md מקיף עם מטרות למידה, תרגולים וחומרי הערכה  
- **הצגה מקצועית**: הוסרו כל אייקוני האימוג'י לשיפור הנגישות והמראה המקצועי  
- **מבנה תוכן משופר**: ארגון וזרימה משופרים של חומרי הלמידה  

#### שונה  
- **פורמט התיעוד**: סטנדרטיזציה של כל התיעוד עם מבנה ממוקד למידה אחיד  
- **זרימת ניווט**: יישום התקדמות לוגית דרך כל חומרי הלמידה  
- **הצגת תוכן**: הסרת אלמנטים דקורטיביים לטובת עיצוב ברור ומקצועי  
- **מבנה קישורים**: עדכון כל הקישורים הפנימיים לתמיכה במערכת ניווט חדשה  

#### שופר  
- **נגישות**: הוסרו תלות באימוג'ים לשיפור תאימות לקוראי מסך  
- **מראה מקצועי**: הצגה נקייה בסגנון אקדמי המתאימה ללמידה ארגונית  
- **חווית למידה**: גישה מובנית עם יעדים ברורים ותוצאות לכל שיעור  
- **ארגון תוכן**: זרימה לוגית טובה יותר וקשר בין נושאים קשורים  

### [v1.0.0] - 2025-09-09  

#### השקה ראשונית - מאגר למידה מקיף ל-AZD  

#### נוסף  
- **מבנה תיעוד בסיסי**  
  - סדרת מדריכים להתחלה מהירה מלאה  
  - תיעוד פריסה ופרוביזינינג מקיף  
  - משאבי פתרון תקלות ומדריכי ניפוי שגיאות מפורטים  
  - כלי ולידציה לפני פריסה  

- **מודול התחלה**  
  - יסודות AZD: מושגים ומונחים מרכזיים  
  - מדריך התקנה: הנחיות פלטפורמה ספציפיות  
  - מדריך תצורה: הגדרת סביבה ואימות  
  - מדריך פרויקט ראשון: לימוד מעשי שלב-אחר-שלב  

- **מודול פריסה ופרוביזינינג**  
  - מדריך פריסה: תיעוד תהליך שלם  
  - מדריך פרוביזינינג: תשתית כקוד באמצעות Bicep  
  - שיטות עבודה מומלצות לפריסות ייצור  
  - דפוסי ארכיטקטורה למולטי-שירות  

- **מודול ולידציה לפני פריסה**  
  - תכנון קיבולת: אימות זמינות משאבי Azure  
  - בחירת SKU: מדריך מפורט לרמות שירות  
  - בדיקות טרום טיסה: סקריפטים אוטומטיים לולידציה (PowerShell ו-Bash)  
  - כלים לאומדן עלויות ותכנון תקציב  

- **מודול פתרון תקלות**  
  - בעיות נפוצות: בעיות ופתרונות שכיחים  
  - מדריך ניפוי שגיאות: שיטות שיטתיות לפתירת תקלות  
  - טכניקות וכלים מתקדמים לאבחון  
  - ניטור ביצועים ואופטימיזציה  

- **משאבים וייחוסים**  
  - גיליון פקודות: הפניות מהירות לפקודות חיוניות  
  - מילון מונחים: הגדרות מונחים ואקרונימים מקיפות  
  - שאלות נפוצות: תשובות מפורטות לשאלות שכיחות  
  - קישורים למשאבים חיצוניים וחיבורי קהילה  

- **דוגמאות ותבניות**  
  - דוגמה לאפליקציית רשת פשוטה  
  - תבנית פריסת אתר סטטי  
  - תצורת אפליקציית מכולות  
  - דפוסי אינטגרציה למסדי נתונים  
  - דוגמאות לארכיטקטורת מיקרו-שירותים  
  - יישומי פונקציות ללא שרת  

#### תכונות  
- **תמיכה ברב-פלטפורמות**: מדריכים להתקנה ותצורה עבור Windows, macOS ולינוקס  
- **רמות מיומנויות מרובות**: תוכן המיועד לסטודנטים ומפתחי מקצוע  
- **מיקוד מעשי**: דוגמאות מעשיות ותרחישים מהמציאות  
- **כיסוי מקיף**: מהיסודות ועד דפוסי ארגון מתקדמים  
- **גישה ראשונה לאבטחה**: הטמעת שיטות עבודה מומלצות לאבטחה  
- **אופטימיזציית עלויות**: הנחיות לפריסות חסכוניות וניהול משאבים  

#### איכות תיעוד  
- **דוגמאות קוד מפורטות**: דוגמאות קוד מעשיות ונבדקות  
- **הנחיות שלב אחר שלב**: הדרכה ברורה ויישומית  
- **טיפול שגיאות מקיף**: פתרון תקלות לבעיות נפוצות  
- **הטמעת שיטות עבודה מומלצות**: סטנדרטים והמלצות בתעשייה  
- **תאימות גרסה**: עדכון עם שירותי Azure ויכולות azd האחרונות  

## שיפורים מתוכננים בעתיד  

### גרסה 3.1.0 (מתוכננת)  
#### הרחבת פלטפורמת AI  
- **תמיכת רב-דגמים**: דפוסי אינטגרציה ל-Hugging Face, Azure Machine Learning ודגמים מותאמים  
- **מסגרות סוכני AI**: תבניות לפריסות LangChain, Semantic Kernel ו-AutoGen  
- **דפוסי RAG מתקדמים**: אפשרויות בסיסי נתונים וקטוריים מעבר ל-Azure AI Search (Pinecone, Weaviate ועוד)  
- **תצפית AI**: ניטור משופר לביצועי דגמים, שימוש בטוקנים ואיכות תגובה  

#### חווית מפתח  
- **הרחבת VS Code**: חווית פיתוח משולבת של AZD + Microsoft Foundry  
- **אינטגרציה עם GitHub Copilot**: יצירת תבניות AZD בסיוע AI  
- **מדריכים אינטראקטיביים**: תרגילי קוד מעשיים עם ולידציה אוטומטית לתרחישי AI  
- **תוכן וידאו**: מדריכים וידאו משלימים ללומדים ויזואליים המתמקדים בפריסות AI  

### גרסה 4.0.0 (מתוכננת)  
#### דפוסי AI ארגוניים  
- **מסגרת ממשל**: ממשל, עמידה בדרישות ונתיבי ביקורת לדגמי AI  
- **AI רב-דיירים**: דפוסים למתן שירות למספר לקוחות בשירותי AI מבודדים  
- **פריסת AI בקצה (Edge)**: אינטגרציה עם Azure IoT Edge ומכולות  
- **AI ענן היברידי**: דפוסי פריסה רב-ענניים והיברידיים לעומסי עבודה של AI  

#### תכונות מתקדמות  
- **אוטומציה של צינור AI**: אינטגרציית MLOps עם צינורות עבודה של Azure Machine Learning  
- **אבטחה מתקדמת**: דפוסי zero-trust, נקודות קצה פרטיות והגנת איומים מתקדמת  
- **אופטימיזציית ביצועים**: טיוב והקצאה חכמה לעומסי AI גבוהים  
- **הפצה גלובלית**: דפוסי אספקת תוכן ו-cache בקצה ליישומי AI  

### גרסה 3.0.0 (מתוכננת) - הוחלפה על ידי גרסה נוכחית  
#### תוספות מוצעות - מיושמות כעת ב-v3.0.0  
- ✅ **תוכן ממוקד AI**: אינטגרציה מקיפה עם Microsoft Foundry (הושלם)  
- ✅ **סדנת AI אינטראקטיבית**: מעבדת סדנה מעשית (הושלם)  
- ✅ **מודול אבטחה מתקדם**: דפוסי אבטחה ייעודיים ל-AI (הושלם)  
- ✅ **אופטימיזציית ביצועים**: אסטרטגיות כוונון עומסי AI (הושלם)  

### גרסה 2.1.0 (מתוכננת) - מיושמת חלקית ב-v3.0.0  
#### שיפורים משניים - חלקם הושלמו בגרסה הנוכחית  
- ✅ **דוגמאות נוספות**: תרחישי פריסה ממוקדי AI (הושלם)  
- ✅ **שאלות נפוצות מורחבות**: שאלות ופתרון תקלות ייחודיות ל-AI (הושלם)  
- **אינטגרציית כלים**: מדריכים משופרים לאינטגרציה עם IDE ועורכים  
- ✅ **הרחבת ניטור**: דפוסי ניטור והתראות ל-AI (הושלם)  

#### עדיין מתוכנן לשחרור עתידי  
- **תיעוד מותאם למובייל**: עיצוב רספונסיבי ללמידה במובייל  
- **גישה לא מקוונת**: חבילות תיעוד להורדה  
- **הרחבת אינטגרציה ב-IDE**: תוסף VS Code לזרימות עבודה AZD + AI  
- **לוח מחוונים קהילתי**: מדדי קהילה בזמן אמת ומעקב תרומות  

## תרומה לרשימת השינויים  

### דיווח שינויים  
בעת תרומה למאגר זה, יש לוודא שרשומות השינויים כוללות:  

1. **מספר גרסה**: בהתאם לנומרציה סמנטית (ראשית.משנית.טלאי)  
2. **תאריך**: תאריך שחרור או עדכון בפורמט YYYY-MM-DD  
3. **קטגוריה**: נוסף, שונה, מודר, הוסר, תוקן, אבטחה  
4. **תיאור ברור**: תיאור תמציתי של השינוי  
5. **הערכת השפעה**: כיצד השינויים משפיעים על משתמשים קיימים  

### קטגוריות שינויים  

#### נוסף  
- תכונות חדשות, סעיפי תיעוד או יכולות  
- דוגמאות חדשות, תבניות או משאבי למידה  
- כלים, סקריפטים או שירותים נוספים  

#### שונה  
- שינויים בתפקוד או בתיעוד קיים  
- עדכונים לשיפור בהירות או דיוק  
- ארגון מחדש של תוכן או מבנה  

#### מודר  
- תכונות או גישות שנמצאות בהפסקה ושיוסרו בקרוב  
- חלקי תיעוד מתוכננים להסרה  
- שיטות שניתנו להחלפה באלטרנטיבות טובות יותר  

#### הוסר  
- תכונות, תיעוד או דוגמאות שאינן רלוונטיות יותר  
- מידע מיושן או גישות שהומודרו  
- תוכן מיותר או מאוחד  

#### תוקן  
- תיקוני שגיאות בתיעוד או בקוד  
- פתרון בעיות שדווחו  
- שיפורים בדיוק או בתפקוד  

#### אבטחה  
- שיפורים או תיקונים הקשורים לאבטחה  
- עדכונים לשיטות עבודה מומלצות בתחום האבטחה  
- פתרון פגיעויות אבטחה  

### הנחיות לנומרציה סמנטית  

#### גרסת ראשית (X.0.0)  
- שינויים שדורשים פעולה מצד המשתמש  
- ארגון מחדש משמעותי של תכנים או מבנה  
- שינויים שמחליפים את הגישה או המתודולוגיה הבסיסית  

#### גרסה משנית (X.Y.0)  
- תוספות תכונות או תוכן  
- שיפורים שמשאירים תאימות אחורית  
- דוגמאות, כלים או משאבים נוספים  

#### גרסת טלאי (X.Y.Z)  
- תיקוני באגים ותיקונים  
- שיפורים קטנים בתוכן קיים  
- הבהרות ושיפורים מינוריים  

## משוב והצעות מהקהילה  

אנו מעודדים משוב מהקהילה לשיפור משאב הלמידה הזה:  

### כיצד לספק משוב  
- **GitHub Issues**: דיווח על בעיות או הצעות שיפור (ברוכים הבאים לציוני בעיות ייחודיות ל-AI)  
- **דיונים בדיסקורד**: שיתוף רעיונות והשתתפות בקהילת Microsoft Foundry  
- **Pull Requests**: תרומה ישירה לשיפור התוכן, במיוחד תבניות ומדריכי AI  
- **Microsoft Foundry Discord**: הצטרפות לערוץ #Azure לדיונים על AZD ו-AI  
- **פורומים קהילתיים**: השתתפות בדיונים רחבים יותר של מפתחי Azure  

### קטגוריות משוב  
- **דיוק תוכן AI**: תיקונים לאינטגרציית שירותי AI ומידע פריסה  
- **חוויית למידה**: הצעות לשיפור זרימת הלמידה למפתחי AI  
- **תוכן חסר ל-AI**: בקשות לתבניות, דפוסים או דוגמאות נוספות  
- **נגישות**: שיפורים לצרכי למידה מגוונים  
- **אינטגרציית כלי AI**: הצעות לשיפור תהליך פיתוח AI  
- **דפוסי ייצור AI**: בקשות לדפוסי פריסה ארגוניים ל-AI  

### התחייבות לתגובה  
- **תגובה לבעיות**: תוך 48 שעות לדיווחים  
- **בקשות תכונות**: הערכה תוך שבוע  
- **תרומות קהילה**: סקירה תוך שבוע  
- **נושאי אבטחה**: עדיפות מיידית עם תגובה מואצת  

## לוח זמנים לתחזוקה  

### עדכונים שוטפים  
- **סקירות חודשיות**: בדיקת דיוק תוכן ואימות קישורים  
- **עדכונים רבעוניים**: תוספת תכנים ושיפורים  
- **סקירות חצי שנתיות**: ארגון מחדש ושדרוג מקיף  
- **שחרורים שנתיים**: עדכוני גרסה מרכזיים עם שיפורים משמעותיים  

### ניטור ובקרת איכות  
- **בדיקות אוטומטיות**: ולידציה שוטפת של דוגמאות קוד וקישורים  
- **שילוב משוב קהילתי**: הכללה שוטפת של הצעות משתמשים  
- **עדכוני טכנולוגיה**: התאמה לשירותי Azure ויכולות azd העדכניות  
- **בדיקות נגישות**: סקירה תקופתית של עקרונות עיצוב כוללני  

## מדיניות תמיכה בגרסאות  

### תמיכת גרסה נוכחית  
- **גרסה ראשית עדכנית**: תמיכה מלאה עם עדכונים שוטפים  
- **גרסה ראשית קודמת**: עדכוני אבטחה ותיקונים קריטיים למשך 12 חודשים  
- **גרסאות ישנות**: תמיכת קהילה בלבד, ללא עדכונים רשמיים  

### הנחיות מעבר  
בעת שחרור גרסאות ראשיות, אנו מספקים:  
- **מדריכי מעבר**: הוראות שלב-אחר-שלב למעבר  
- **הערות תאימות**: פירוט שינויים המשבשים תאימות  
- **תמיכת כלי**: סקריפטים או שירותים לסיוע במעבר  
- **תמיכה קהילתית**: פורומים ייעודיים לשאלות מעבר  

---  

**ניווט**  
- **שיעור קודם**: [מדריך לימוד](resources/study-guide.md)  
- **שיעור הבא**: חזרה ל-[README ראשי](README.md)  

**השאר מעודכן**: הצטרף לעקיבה אחר מאגר זה לקבלת התראות על שחרורים חדשים ועדכונים חשובים לחומרי הלמידה.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->