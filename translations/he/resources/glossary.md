# מילון מונחים - Azure וטרמינולוגיית AZD

**התייחסות לכל הפרקים**  
- **📚 דף הבית של הקורס**: [AZD למתחילים](../README.md)  
- **📖 למידת יסודות**: [פרק 1: יסודות AZD](../docs/getting-started/azd-basics.md)  
- **🤖 מונחי AI**: [פרק 2: פיתוח מונחה AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## מבוא

מילון מקיף זה מספק הגדרות למונחים, מושגים וקיצורים המשמשים ב-Azure Developer CLI ובפיתוח בענן של Azure. התייחסות חיונית להבנת תיעוד טכני, פתרון בעיות ותקשורת יעילה לגבי פרויקטים של azd ושירותי Azure.

## מטרות למידה

באמצעות מילון מונחים זה, תלמדו:  
- להבין מונחים ומושגים חיוניים של Azure Developer CLI  
- לשלוט באוצר מילים טכנולוגי לפיתוח בענן Azure  
- להתייחס במיומנות למונחים של תשתית כקוד ופריסות  
- להבין שמות שירותים של Azure, קיצורים ומטרותיהם  
- לגשת להגדרות לפתרון תקלות וניפוי שגיאות  
- ללמוד מושגים מתקדמים בארכיטקטורת Azure ובפיתוח  

## תוצאות למידה

עם שימוש קבוע במילון זה, תוכלו:  
- לתקשר ביעילות באמצעות מונחי Azure Developer CLI נכונים  
- להבין טוב יותר תיעוד טכני והודעות שגיאה  
- לנווט בביטחון בין שירותי Azure ומושגים  
- לפתור בעיות באמצעות אוצר מילים טכני מתאים  
- לתרום לדיונים צוותיים בשפה טכנית מדויקת  
- להרחיב את הידע שלכם בפיתוח בענן Azure בצורה שיטתית  

## A

**ARM Template**  
תבנית Azure Resource Manager. פורמט תשתית כקוד מבוסס JSON המאפשר הגדרה ופריסה דקלרטיבית של משאבי Azure.

**App Service**  
הצעת פלטפורמת שירות (PaaS) של Azure לאחסון יישומי ווב, APIs מסוג REST ו-backends למובייל ללא צורך בניהול התשתית.

**Application Insights**  
שירות ניטור ביצועי אפליקציות (APM) של Azure המספק תובנות מעמיקות על ביצועי האפליקציה, זמינות ושימוש.

**Azure CLI**  
ממשק שורת פקודה לניהול משאבי Azure. בשימוש azd לאימות וכמה פעולות.

**Azure Developer CLI (azd)**  
כלי שורת פקודה מוכוון מפתחים המזרז את תהליך בניית ופריסת אפליקציות ל-Azure באמצעות תבניות ותשתית כקוד.

**azure.yaml**  
קובץ הקונפיגורציה הראשי לפרויקט azd המגדיר שירותים, תשתית וחיבורים לפריסה.

**Azure Resource Manager (ARM)**  
שירות פריסה וניהול של Azure המספק שכבת ניהול ליצירה, עדכון ומחיקה של משאבים.

## B

**Bicep**  
שפת דומיין ספציפית (DSL) שפותחה על ידי מיקרוסופט לפריסת משאבי Azure. מספק תחביר פשוט יותר מתבניות ARM תוך הידור ל-ARM.

**Build**  
תהליך הידור קוד מקור, התקנת תלותים והכנת אפליקציות לפריסה.

**Blue-Green Deployment**  
אסטרטגיית פריסה המשתמשת בשני סביבות ייצור זהות (כחול וירוק) למזעור זמן השבתה וסיכונים.

## C

**Container Apps**  
שירות מכולות חסר שרת של Azure המאפשר הרצת אפליקציות מיכליות ללא ניהול תשתית מורכבת.

**CI/CD**  
אינטגרציה רציפה/פריסה רציפה. פרקטיקות אוטומטיות לאינטגרציה של שינויים בפרויקט ופריסת אפליקציות.

**Cosmos DB**  
שירות מסדי נתונים רב-מודלים, מפוזר גלובלית של Azure, המספק SLA מקיפים לתפוקה, השהייה, זמינות ועקביות.

**Configuration**  
הגדרות ופרמטרים שמבקרים את התנהגות האפליקציה ואפשרויות הפריסה.

## D

**Deployment**  
תהליך התקנה וקונפיגורציה של אפליקציות ותלותיהן בתשתיות היעד.

**Docker**  
פלטפורמה לפיתוח, שיגור והרצת אפליקציות באמצעות טכנולוגיית מכולות.

**Dockerfile**  
קובץ טקסט המכיל הוראות לבניית תמונת מכולה של Docker.

## E

**Environment**  
יעד פריסה שמייצג מופע ספציפי של האפליקציה (למשל, פיתוח, בדיקה, ייצור).

**Environment Variables**  
ערכי קונפיגורציה הנשמרים בזוגות מפתח-ערך שאליהם אפליקציות יכולות לגשת בזמן ריצה.

**Endpoint**  
כתובת URL או כתובת רשת שאליה ניתן לגשת לאפליקציה או שירות.

## F

**Function App**  
שירות חישוב חסר שרת של Azure המאפשר הרצת קוד מונחה אירועים ללא ניהול תשתית.

## G

**GitHub Actions**  
פלטפורמת CI/CD משולבת עם מאגרים ב-GitHub לאוטומציה של זרימות עבודה.

**Git**  
מערכת בקרת גרסאות מבוזרת לניהול שינויים בקוד המקור.

## H

**Hooks**  
סקריפטים מותאמים אישית או פקודות שרצות בנקודות ספציפיות במחזור החיים של הפריסה (לפני/אחרי פרוביזיה, לפני/אחרי פריסה).

**Host**  
סוג שירות Azure שבו תתפרס האפליקציה (למשל, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
פרקטיקה של הגדרה וניהול תשתיות בקוד במקום תהליכים ידניים.

**Init**  
תהליך אתחול פרויקט azd חדש, בדרך כלל באמצעות תבנית.

## J

**JSON**  
JavaScript Object Notation. פורמט חילופי נתונים נפוץ לקבצי קונפיגורציה ותשובות API.

**JWT**  
JSON Web Token. תקן להעברת מידע מאובטח בין צדדים כאובייקט JSON.

## K

**Key Vault**  
שירות Azure לאחסון מנוהל ומאובטח של סודות, מפתחות ותעודות.

**Kusto Query Language (KQL)**  
שפת שאילתות לניתוח נתונים ב-Azure Monitor, Application Insights ושירותי Azure נוספים.

## L

**Load Balancer**  
שירות שמפזר עומסי רשת נכנסים בין מספר שרתים או מופעים.

**Log Analytics**  
שירות Azure לאיסוף, ניתוח ותגובה על נתוני טלמטריה מסביבות ענן ומקומיות.

## M

**Managed Identity**  
תכונה של Azure המעניקה לשירותי Azure זהות מנוהלת אוטומטית לאימות מול שירותים אחרים.

**Microservices**  
גישה ארכיטקטונית שבה אפליקציות נבנות כאוסף של שירותים קטנים ועצמאיים.

**Monitor**  
פתרון ניטור מאוחד של Azure המספק תצפית מלאה על אפליקציות ותשתיות.

## N

**Node.js**  
סביבת ריצה עבור JavaScript המבוססת על מנוע V8 של כרום לבניית אפליקציות צד שרת.

**npm**  
מנהל חבילות ל-Node.js שמנהל תלותים וחבילות.

## O

**Output**  
ערכים המוחזרים מפריסת תשתית שניתן להשתמש בהם על ידי אפליקציות או משאבים אחרים.

## P

**Package**  
תהליך הכנת קוד האפליקציה ותלותיה לפריסה.

**Parameters**  
ערכי קלט הנשלחים לתבניות תשתית להתאמת הפריסה.

**PostgreSQL**  
מערכת מסדי נתונים יחסית קוד פתוח הנתמכת כשירות מנוהל ב-Azure.

**Provisioning**  
תהליך יצירה וקונפיגורציה של משאבי Azure המוגדרים בתבניות תשתית.

## Q

**Quota**  
מגבלות על כמות המשאבים שניתן ליצור במנוי או באזור Azure.

## R

**Resource Group**  
מיכל לוגי למשאבי Azure החולקים מחזור חיים, הרשאות ומדיניות משותפת.

**Resource Token**  
מחרוזת ייחודית שנוצרת על ידי azd כדי להבטיח ששמות משאבים יהיו ייחודיים בפריסות.

**REST API**  
סגנון ארכיטקטוני לתכנון אפליקציות רשת המשתמש בשיטות HTTP.

**Rollback**  
תהליך החזרה לגרסה קודמת של אפליקציה או קונפיגורציית תשתית.

## S

**Service**  
רכיב של האפליקציה שלך המוגדר ב-azure.yaml (למשל, frontend של ווב, backend API, מסד נתונים).

**SKU**  
יחידת אחסון. מייצגת רמות שירות או ביצועים שונות למשאבי Azure.

**SQL Database**  
שירות מסד נתונים יחסיים מנוהל מבוסס Microsoft SQL Server ב-Azure.

**Static Web Apps**  
שירות Azure לבניית ופריסת אפליקציות ווב מלאות ממרחבי קוד מקור.

**Storage Account**  
שירות Azure המספק אחסון ענן לאובייקטים דיגיטליים כולל blobs, קבצים, תורים וטבלאות.

**Subscription**  
מיכל חשבון Azure המכיל Resource Groups ומשאבים, כולל ניהול גיובים וגישה.

## T

**Template**  
מבנה פרויקט מוכן מראש המכיל קוד אפליקציה, הגדרות תשתית וקונפיגורציה לתרחישים נפוצים.

**Terraform**  
כלי תשתית כקוד קוד פתוח התומך בספקי ענן רבים כולל Azure.

**Traffic Manager**  
מאזן עומסי תעבורה מבוסס DNS של Azure המפזר תנועה בין אזורים גלובליים.

## U

**URI**  
מזהה משאבים אחיד. מחרוזת המזהה משאב מסוים.

**URL**  
מאתר משאבים אחיד. סוג של URI המפרט מיקום משאב ואופן הגישה אליו.

## V

**Virtual Network (VNet)**  
יחידת בניין בסיסית לרשתות פרטיות ב-Azure, המספקת בידוד וסגמנטציה.

**VS Code**  
Visual Studio Code. עורך קוד פופולרי עם אינטגרציה מצוינת ל-Azure ו-azd.

## W

**Webhook**  
קריאת HTTP חזרה המופעלת על ידי אירועים ספציפיים, נפוצה בצנרת CI/CD.

**What-if**  
תכונה של Azure המציגה אילו שינויים יבוצעו בפריסה מבלי לבצע אותם בפועל.

## Y

**YAML**  
YAML אינה שפת סימון. תקן סידור נתונים קריא לבני אדם המשמש לקבצי קונפיגורציה כמו azure.yaml.

## Z

**Zone**  
מיקומים פיזיים נפרדים בתוך אזור Azure המספקים שכפול ו-high availability.

---

## קיצורים נפוצים

| קיצור | הצורה המלאה | תיאור |
|---------|-----------|-------------|
| AAD | Azure Active Directory | שירות ניהול זהויות וגישה |
| ACR | Azure Container Registry | שירות רישום תמונות מכולות |
| AKS | Azure Kubernetes Service | שירות Kubernetes מנוהל |
| API | Application Programming Interface | סט פרוטוקולים לבניית תוכנה |
| ARM | Azure Resource Manager | שירות פריסה וניהול של Azure |
| CDN | Content Delivery Network | רשת מפוזרת של שרתים |
| CI/CD | Continuous Integration/Continuous Deployment | פרקטיקות פיתוח אוטומטיות |
| CLI | Command Line Interface | ממשק משתמש מבוסס טקסט |
| DNS | Domain Name System | מערכת לתרגום שמות דומיין לכתובות IP |
| HTTPS | Hypertext Transfer Protocol Secure | גרסה מאובטחת של HTTP |
| IaC | Infrastructure as Code | ניהול תשתית באמצעות קוד |
| JSON | JavaScript Object Notation | פורמט חילופי נתונים |
| JWT | JSON Web Token | פורמט אסימון להעברת מידע מאובטח |
| KQL | Kusto Query Language | שפת שאילתות לשירותי נתונים של Azure |
| RBAC | Role-Based Access Control | שיטת בקרת גישה מבוססת תפקידים |
| REST | Representational State Transfer | סגנון ארכיטקטוני לשירותי ווב |
| SDK | Software Development Kit | אוסף כלי פיתוח תוכנה |
| SLA | Service Level Agreement | התחייבות לזמינות/ביצועי שירות |
| SQL | Structured Query Language | שפה לניהול מסדי נתונים יחסיים |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | פרוטוקולי הצפנה |
| URI | Uniform Resource Identifier | מחרוזת שמזהה משאב |
| URL | Uniform Resource Locator | סוג URI שמאפיין מיקום משאב |
| VM | Virtual Machine | אמולציה של מערכת מחשב |
| VNet | Virtual Network | רשת פרטית ב-Azure |
| YAML | YAML Ain't Markup Language | תקן סידור נתונים |

---

## מיפוי שמות שירותי Azure

| שם נפוץ | שם רשמי של שירות Azure | סוג Host ב-azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## מונחים לפי הקשר

### מונחי פיתוח  
- **Hot Reload**: עדכון אוטומטי של אפליקציות בזמן פיתוח ללא צורך באתחול מחדש  
- **Build Pipeline**: תהליך אוטומטי לבניית ובדיקת קוד  
- **Deployment Slot**: סביבת staging בתוך App Service  
- **Environment Parity**: שמירה על דמיון בין סביבות פיתוח, staging וייצור  

### מונחי אבטחה  
- **Managed Identity**: תכונת Azure המנהלת אישורי גישה אוטומטית  
- **Key Vault**: אחסון מאובטח לסודות, מפתחות ותעודות  
- **RBAC**: בקרת גישה מבוססת תפקידים למשאבי Azure  
- **Network Security Group**: חומת אש וירטואלית לבקרת תעבורת רשת  

### מונחי ניטור  
- **Telemetry**: איסוף אוטומטי של מדידות ונתונים  
- **Application Performance Monitoring (APM)**: ניטור ביצועי תוכנה  
- **Log Analytics**: שירות לאיסוף וניתוח נתוני לוגים  
- **Alert Rules**: התראות אוטומטיות מבוססות מדדים או תנאים  

### מונחי פריסה  
- **Blue-Green Deployment**: אסטרטגיית פריסה ללא השבתה  
- **Canary Deployment**: פריסה מדורגת לקבוצה קטנה של משתמשים  
- **Rolling Update**: החלפה סידרתית של מופעי האפליקציה  
- **Rollback**: החזרה לגרסה קודמת של האפליקציה  

---

**טיפ שימוש**: השתמשו ב-`Ctrl+F` לחיפוש מהיר של מונחים במילון זה. המונחים מופנים בין פרקים כשמתאפשר.  

---

**ניווט**  
- **שיעור קודם**: [גיליון טיפים](cheat-sheet.md)  
- **שיעור הבא**: [שאלות נפוצות](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדייק, יש לקחת בחשבון כי תרגומים ממוחשבים עלולים לכלול שגיאות או אי דיוקים. המסמך המקורי בשפתו הטבעית הוא המקור הסמכותי. למידע קריטי מומלץ להיעזר בתרגום מקצועי אנושי. איננו אחראים לכל אי הבנה או פרשנות שגויה הנובעת מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->