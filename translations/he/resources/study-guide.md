<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:27:29+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "he"
}
-->
# מדריך לימוד - AZD למתחילים

## הקדמה

מדריך לימוד מקיף זה מספק מטרות לימוד מובנות, מושגים מרכזיים, תרגילי תרגול וחומרי הערכה שיעזרו לך לשלוט ב-Azure Developer CLI (azd). השתמש במדריך זה כדי לעקוב אחר ההתקדמות שלך ולהבטיח שכיסית את כל הנושאים החיוניים.

## מטרות לימוד

עם סיום מדריך הלימוד, תוכל:
- לשלוט בכל המושגים הבסיסיים והמתקדמים של Azure Developer CLI
- לפתח מיומנויות מעשיות בפריסה וניהול של יישומים ב-Azure
- לבנות ביטחון בפתרון בעיות ובאופטימיזציה של פריסות
- להבין שיטות פריסה מוכנות לייצור ושיקולי אבטחה

## תוצאות לימוד

לאחר שתשלים את כל חלקי מדריך הלימוד, תוכל:
- לעצב, לפרוס ולנהל ארכיטקטורות יישומים מלאות באמצעות azd
- ליישם אסטרטגיות מקיפות לניטור, אבטחה ואופטימיזציה של עלויות
- לפתור בעיות פריסה מורכבות באופן עצמאי
- ליצור תבניות מותאמות אישית ולתרום לקהילת azd

## מבנה הקורס

### מודול 1: התחלה (שבועות 1-2)

#### מטרות לימוד
- להבין את יסודות Azure Developer CLI והמושגים המרכזיים
- להתקין ולהגדיר בהצלחה את azd בסביבת הפיתוח שלך
- להשלים את הפריסה הראשונה שלך באמצעות תבנית קיימת
- לנווט במבנה הפרויקט של azd ולהבין רכיבים מרכזיים

#### מושגים מרכזיים לשליטה
- תבניות, סביבות ושירותים
- מבנה קובץ azure.yaml
- פקודות בסיסיות של azd (init, up, down, deploy)
- עקרונות Infrastructure as Code
- אימות והרשאה ב-Azure

#### תרגילי תרגול

**תרגיל 1.1: התקנה והגדרה**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**תרגיל 1.2: פריסה ראשונה**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**תרגיל 1.3: ניתוח מבנה הפרויקט**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### שאלות להערכה עצמית
1. מהם שלושת המושגים המרכזיים בארכיטקטורת azd?
2. מה מטרת קובץ azure.yaml?
3. כיצד סביבות עוזרות לנהל יעדי פריסה שונים?
4. אילו שיטות אימות ניתן להשתמש עם azd?
5. מה קורה כאשר אתה מריץ `azd up` בפעם הראשונה?

### מודול 2: הגדרות וסביבות (שבוע 3)

#### מטרות לימוד
- לשלוט בניהול סביבות והגדרות
- להבין הגדרות מתקדמות של azure.yaml
- ליישם הגדרות ומשתנים ייחודיים לסביבה
- להגדיר אימות לתרחישים שונים

#### מושגים מרכזיים לשליטה
- היררכיית סביבות ועדיפות משתנים
- הגדרות שירות ופרמטרים
- Hooks ואירועי מחזור חיים
- שיטות אימות (משתמש, Service Principal, Managed Identity)
- ניהול קבצי הגדרות

#### תרגילי תרגול

**תרגיל 2.1: הגדרת סביבה מרובת סביבות**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**תרגיל 2.2: הגדרות מתקדמות**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**תרגיל 2.3: הגדרות אבטחה**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### שאלות להערכה עצמית
1. כיצד azd מטפל בעדיפות משתני סביבה?
2. מהם Deployment Hooks ומתי כדאי להשתמש בהם?
3. כיצד ניתן להגדיר SKUs שונים לסביבות שונות?
4. מהן ההשלכות האבטחתיות של שיטות אימות שונות?
5. כיצד מנהלים סודות ונתוני הגדרות רגישים?

### מודול 3: פריסה והקצאה (שבוע 4)

#### מטרות לימוד
- לשלוט בתהליכי פריסה ושיטות עבודה מומלצות
- להבין Infrastructure as Code עם תבניות Bicep
- ליישם ארכיטקטורות מורכבות מרובות שירותים
- לאופטימיזציה של ביצועי פריסה ואמינות

#### מושגים מרכזיים לשליטה
- מבנה תבניות Bicep ומודולים
- תלות בין משאבים וסדר פעולות
- אסטרטגיות פריסה (Blue-Green, Rolling Updates)
- פריסות מרובות אזורים
- מיגרציות בסיסי נתונים וניהול נתונים

#### תרגילי תרגול

**תרגיל 3.1: תשתית מותאמת אישית**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**תרגיל 3.2: יישום מרובה שירותים**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**תרגיל 3.3: שילוב בסיסי נתונים**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### שאלות להערכה עצמית
1. מהם היתרונות של שימוש ב-Bicep על פני ARM Templates?
2. כיצד מטפלים במיגרציות בסיסי נתונים בפריסות azd?
3. אילו אסטרטגיות קיימות לפריסות ללא השבתה?
4. כיצד מנהלים תלות בין שירותים?
5. מהם השיקולים לפריסות מרובות אזורים?

### מודול 4: אימות לפני פריסה (שבוע 5)

#### מטרות לימוד
- ליישם בדיקות מקיפות לפני פריסה
- לשלוט בתכנון קיבולת ואימות משאבים
- להבין בחירת SKUs ואופטימיזציה של עלויות
- לבנות צינורות אימות אוטומטיים

#### מושגים מרכזיים לשליטה
- מכסות ומשאבים ב-Azure
- קריטריונים לבחירת SKUs והשלכות עלויות
- סקריפטים וכלים לאימות אוטומטי
- מתודולוגיות תכנון קיבולת
- בדיקות ביצועים ואופטימיזציה

#### תרגילי תרגול

**תרגיל 4.1: תכנון קיבולת**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**תרגיל 4.2: אימות לפני פריסה**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**תרגיל 4.3: אופטימיזציית SKUs**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### שאלות להערכה עצמית
1. אילו גורמים צריכים להשפיע על החלטות בחירת SKUs?
2. כיצד מאמתים זמינות משאבים ב-Azure לפני פריסה?
3. מהם הרכיבים המרכזיים של מערכת בדיקות לפני פריסה?
4. כיצד מעריכים ושולטים בעלויות פריסה?
5. אילו ניטורים חיוניים לתכנון קיבולת?

### מודול 5: פתרון בעיות וניפוי שגיאות (שבוע 6)

#### מטרות לימוד
- לשלוט במתודולוגיות פתרון בעיות שיטתיות
- לפתח מומחיות בניפוי שגיאות בפריסות מורכבות
- ליישם ניטור והתראות מקיפות
- לבנות נהלי תגובה והתאוששות מתקלות

#### מושגים מרכזיים לשליטה
- דפוסי כשל נפוצים בפריסה
- ניתוח לוגים וטכניקות קורלציה
- ניטור ביצועים ואופטימיזציה
- זיהוי ותגובה לאירועי אבטחה
- התאוששות מאסון והמשכיות עסקית

#### תרגילי תרגול

**תרגיל 5.1: תרחישי פתרון בעיות**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**תרגיל 5.2: יישום ניטור**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**תרגיל 5.3: תגובה לאירועים**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### שאלות להערכה עצמית
1. מהי הגישה השיטתית לפתרון בעיות בפריסות azd?
2. כיצד מקשרים לוגים בין שירותים ומשאבים שונים?
3. אילו מדדי ניטור הם הקריטיים ביותר לזיהוי מוקדם של בעיות?
4. כיצד מיישמים נהלי התאוששות מאסון יעילים?
5. מהם הרכיבים המרכזיים של תוכנית תגובה לאירועים?

### מודול 6: נושאים מתקדמים ושיטות עבודה מומלצות (שבועות 7-8)

#### מטרות לימוד
- ליישם דפוסי פריסה ברמת ארגון
- לשלוט באינטגרציה ואוטומציה של CI/CD
- לפתח תבניות מותאמות אישית ולתרום לקהילה
- להבין דרישות אבטחה וציות מתקדמות

#### מושגים מרכזיים לשליטה
- דפוסי אינטגרציה של צינורות CI/CD
- פיתוח והפצה של תבניות מותאמות אישית
- ניהול וציות ברמת ארגון
- הגדרות רשת ואבטחה מתקדמות
- אופטימיזציה של ביצועים וניהול עלויות

#### תרגילי תרגול

**תרגיל 6.1: אינטגרציית CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**תרגיל 6.2: פיתוח תבניות מותאמות אישית**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**תרגיל 6.3: יישום ברמת ארגון**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### שאלות להערכה עצמית
1. כיצד משלבים azd בצינורות CI/CD קיימים?
2. מהם השיקולים המרכזיים לפיתוח תבניות מותאמות אישית?
3. כיצד מיישמים ניהול וציות בפריסות azd?
4. מהם השיטות המומלצות לפריסות בקנה מידה ארגוני?
5. כיצד תורמים באופן אפקטיבי לקהילת azd?

## פרויקטים מעשיים

### פרויקט 1: אתר תיק עבודות אישי  
**רמת מורכבות**: מתחילים  
**משך**: 1-2 שבועות  

בניית ופריסת אתר תיק עבודות אישי באמצעות:
- אירוח אתר סטטי ב-Azure Storage
- הגדרת דומיין מותאם אישית
- אינטגרציה עם CDN לשיפור ביצועים גלובליים
- צינור פריסה אוטומטי  

**תוצרים**:
- אתר פעיל שפורסם ב-Azure
- תבנית azd מותאמת אישית לפריסות תיק עבודות
- תיעוד תהליך הפריסה
- המלצות לאופטימיזציה של עלויות  

### פרויקט 2: אפליקציית ניהול משימות  
**רמת מורכבות**: בינונית  
**משך**: 2-3 שבועות  

יצירת אפליקציית ניהול משימות מלאה עם:
- ממשק React שפורסם ב-App Service
- API Backend ב-Node.js עם אימות משתמשים
- בסיס נתונים PostgreSQL עם מיגרציות
- ניטור באמצעות Application Insights  

**תוצרים**:
- אפליקציה מלאה עם אימות משתמשים
- סכמת בסיס נתונים וסקריפטים למיגרציה
- לוחות ניטור וכללי התראה
- הגדרות פריסה מרובות סביבות  

### פרויקט 3: פלטפורמת מסחר אלקטרוני מבוססת מיקרו-שירותים  
**רמת מורכבות**: מתקדמת  
**משך**: 4-6 שבועות  

עיצוב ויישום פלטפורמת מסחר אלקטרוני מבוססת מיקרו-שירותים:
- שירותי API מרובים (קטלוג, הזמנות, תשלומים, משתמשים)
- אינטגרציה עם Service Bus לתקשורת בין שירותים
- Redis Cache לאופטימיזציית ביצועים
- לוגים וניטור מקיפים  

**תוצרים**:
- ארכיטקטורת מיקרו-שירותים מלאה
- דפוסי תקשורת בין שירותים
- בדיקות ביצועים ואופטימיזציה
- יישום אבטחה מוכן לייצור  

## הערכה והסמכה

### בדיקות ידע

השלם את ההערכות הללו לאחר כל מודול:

**הערכת מודול 1**: מושגים בסיסיים והתקנה  
- שאלות רב-ברירה על מושגים מרכזיים  
- משימות התקנה והגדרה מעשיות  
- תרגיל פריסה פשוט  

**הערכת מודול 2**: הגדרות וסביבות  
- תרחישי ניהול סביבות  
- תרגילי פתרון בעיות בהגדרות  
- יישום הגדרות אבטחה  

**הערכת מודול 3**: פריסה והקצאה  
- אתגרי עיצוב תשתית  
- תרחישי פריסה מרובי שירותים  
- תרגילי אופטימיזציה של ביצועים  

**הערכת מודול 4**: אימות לפני פריסה  
- מחקרי מקרה בתכנון קיבולת  
- תרחישי אופטימיזציה של עלויות  
- יישום צינור אימות  

**הערכת מודול 5**: פתרון בעיות וניפוי שגיאות  
- תרגילי אבחון בעיות  
- משימות יישום ניטור  
- סימולציות תגובה לאירועים  

**הערכת מודול 6**: נושאים מתקדמים  
- עיצוב צינורות CI/CD  
- פיתוח תבניות מותאמות אישית  
- תרחישי ארכיטקטורה ארגונית  

### פרויקט גמר

עצב ויישם פתרון מלא שמדגים שליטה בכל המושגים:

**דרישות**:
- ארכיטקטורת יישום מרובת שכבות  
- סביבות פריסה מרובות  
- ניטור והתראות מקיפים  
- יישום אבטחה וציות  
- אופטימיזציה של עלויות ושיפור ביצועים  
- תיעוד מלא ומדריכי הפעלה  

**קריטריוני הערכה**:
- איכות היישום הטכני  
- שלמות התיעוד  
- עמידה בשיטות עבודה מומלצות לאבטחה  
- אופטימיזציה של ביצועים ועלויות  
- יעילות פתרון בעיות וניטור  

## משאבי לימוד והפניות

### תיעוד רשמי
- [תיעוד Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [תיעוד Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### משאבי קהילה
- [גלריית תבניות AZD](https://azure.github.io/awesome-azd/)  
- [ארגון GitHub של Azure-Samples](https://github.com/Azure-Samples)  
- [מאגר GitHub של Azure Developer CLI](https://github.com/Azure/azure-dev)  

### סביבות תרגול
- [חשבון Azure חינם](https://azure.microsoft.com/free/)  
- [תוכנית חינם של Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### כלים נוספים
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [חבילת הרחבות Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## המלצות ללוח זמנים ללימוד

### לימוד במשרה מלאה (8 שבועות)
- **שבועות 1-2**: מודולים 1-2 (התחלה, הגדרות)  
- **שבועות 3-4**: מודולים 3-4 (פריסה, אימות לפני פריסה)  
- **שבועות 5-6**: מודולים 5-6 (פתרון בעיות, נושאים מתקדמים)  
- **שבועות 7-8**: פרויקטים מעשיים והערכה סופית  

### לימוד במשרה חלקית (16 שבועות)
- **שבועות 1-4**: מודול 1 (התחלה)  
- **שבועות 5-7**: מודול 2 (הגדרות וסביבות)  
- **שבועות 8-10**: מודול 3 (פריסה והקצאה)  
- **שבועות 11-12**: מודול 4 (אימות לפני פריסה)  
- **שבועות 13-14**: מודול 5 (פתרון בעיות וניפוי שגיאות)  
- **שבועות 15-16**: מודול 6 (נושאים מתקדמים והערכה)  

### לימוד בקצב אישי
- השלם כל מודול בקצב שלך  
- הקדש זמן נוסף למושגים מאתגרים  
- חזור על תרגילים עד שתשיג שליטה  
- הצטרף לדיוני קהילה ושאל שאלות  

## טיפים להצלחה

### אסטרטגיות לימוד אפקטיביות
1. **תרגל באופן קבוע**: פרוס יישומים לעיתים קרובות כדי לבנות זיכרון שריר  
2. **התנסה ללא פחד**: השתמש בסביבות פיתוח כדי לנסות הגדרות חדשות  
3. **תעד את הלמידה שלך**: שמור הערות על פתרונות לבעיות שנתקלת בהן  
4. **הצטרף לקהילה**: השתתף בדיונים ותרום לפרויקטים  
5. **הישאר מעודכן**: עקוב אחר עדכוני Azure ותכונות חדשות של azd  

### טעויות נפוצות שיש להימנע מהן
1. **דילוג על דרישות מקדימות**: ודא שיש לך ידע בסיסי מתאים  
2. **חיפ
3. **תרמו לקוד פתוח**: שתפו את התבניות והפתרונות שלכם עם הקהילה  
4. **למדו אחרים**: הסבר מושגים לאחרים מחזק את ההבנה שלכם  
5. **שמרו על סקרנות**: חקרו באופן מתמיד שירותי Azure חדשים ודפוסי אינטגרציה  

---

**ניווט**  
- **שיעור קודם**: [FAQ](faq.md)  
- **שיעור הבא**: [Changelog](../changelog.md)  

**מעקב אחר התקדמות בלמידה**: השתמשו במדריך זה כדי לעקוב אחר מסע הלמידה שלכם ולהבטיח כיסוי מקיף של כל מושגי ופרקטיקות Azure Developer CLI.  

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור הסמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.