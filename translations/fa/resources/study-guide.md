<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:44:01+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "fa"
}
-->
# راهنمای مطالعه - AZD برای مبتدیان

## مقدمه

این راهنمای جامع مطالعه اهداف یادگیری ساختاریافته، مفاهیم کلیدی، تمرین‌های عملی و مواد ارزیابی را ارائه می‌دهد تا به شما در تسلط بر Azure Developer CLI (azd) کمک کند. از این راهنما برای پیگیری پیشرفت خود و اطمینان از پوشش تمام موضوعات ضروری استفاده کنید.

## اهداف یادگیری

با تکمیل این راهنمای مطالعه، شما:
- بر تمام مفاهیم پایه و پیشرفته Azure Developer CLI مسلط خواهید شد
- مهارت‌های عملی در استقرار و مدیریت برنامه‌های Azure را توسعه خواهید داد
- اعتماد به نفس در رفع مشکلات و بهینه‌سازی استقرارها را به دست خواهید آورد
- اصول استقرار آماده تولید و ملاحظات امنیتی را درک خواهید کرد

## نتایج یادگیری

پس از تکمیل تمام بخش‌های این راهنمای مطالعه، شما قادر خواهید بود:
- معماری‌های کامل برنامه را با استفاده از azd طراحی، استقرار و مدیریت کنید
- استراتژی‌های جامع نظارت، امنیت و بهینه‌سازی هزینه را اجرا کنید
- مشکلات پیچیده استقرار را به طور مستقل رفع کنید
- قالب‌های سفارشی ایجاد کرده و به جامعه azd کمک کنید

## ساختار دوره

### ماژول 1: شروع کار (هفته‌های 1-2)

#### اهداف یادگیری
- مفاهیم پایه و اصول Azure Developer CLI را درک کنید
- azd را با موفقیت در محیط توسعه خود نصب و پیکربندی کنید
- اولین استقرار خود را با استفاده از یک قالب موجود انجام دهید
- ساختار پروژه azd را مرور کرده و اجزای کلیدی را درک کنید

#### مفاهیم کلیدی برای تسلط
- قالب‌ها، محیط‌ها و خدمات
- ساختار پیکربندی azure.yaml
- دستورات پایه azd (init، up، down، deploy)
- اصول زیرساخت به عنوان کد
- احراز هویت و مجوز Azure

#### تمرین‌های عملی

**تمرین 1.1: نصب و راه‌اندازی**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**تمرین 1.2: اولین استقرار**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**تمرین 1.3: تحلیل ساختار پروژه**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### سوالات ارزیابی خود
1. سه مفهوم اصلی معماری azd چیست؟
2. هدف فایل azure.yaml چیست؟
3. محیط‌ها چگونه به مدیریت اهداف مختلف استقرار کمک می‌کنند؟
4. چه روش‌های احراز هویتی می‌توان با azd استفاده کرد؟
5. وقتی برای اولین بار `azd up` را اجرا می‌کنید چه اتفاقی می‌افتد؟

### ماژول 2: پیکربندی و محیط‌ها (هفته 3)

#### اهداف یادگیری
- مدیریت و پیکربندی محیط‌ها را به طور کامل یاد بگیرید
- پیکربندی‌های پیشرفته azure.yaml را درک کنید
- تنظیمات و متغیرهای خاص محیط را اجرا کنید
- احراز هویت را برای سناریوهای مختلف پیکربندی کنید

#### مفاهیم کلیدی برای تسلط
- سلسله‌مراتب محیط و تقدم متغیرها
- پیکربندی خدمات و پارامترها
- هوک‌ها و رویدادهای چرخه عمر
- روش‌های احراز هویت (کاربر، سرویس پرینسیپل، هویت مدیریت‌شده)
- مدیریت فایل‌های پیکربندی

#### تمرین‌های عملی

**تمرین 2.1: تنظیم چند محیط**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**تمرین 2.2: پیکربندی پیشرفته**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**تمرین 2.3: پیکربندی امنیتی**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### سوالات ارزیابی خود
1. azd چگونه تقدم متغیرهای محیطی را مدیریت می‌کند؟
2. هوک‌های استقرار چیستند و چه زمانی باید از آنها استفاده کرد؟
3. چگونه می‌توان SKU‌های مختلف را برای محیط‌های مختلف پیکربندی کرد؟
4. پیامدهای امنیتی روش‌های مختلف احراز هویت چیست؟
5. چگونه می‌توان اسرار و داده‌های حساس پیکربندی را مدیریت کرد؟

### ماژول 3: استقرار و تهیه منابع (هفته 4)

#### اهداف یادگیری
- جریان‌های کاری استقرار و بهترین شیوه‌ها را به طور کامل یاد بگیرید
- زیرساخت به عنوان کد را با قالب‌های Bicep درک کنید
- معماری‌های پیچیده چند‌خدمتی را اجرا کنید
- عملکرد و قابلیت اطمینان استقرار را بهینه کنید

#### مفاهیم کلیدی برای تسلط
- ساختار قالب Bicep و ماژول‌ها
- وابستگی‌ها و ترتیب منابع
- استراتژی‌های استقرار (آبی-سبز، به‌روزرسانی‌های چرخشی)
- استقرارهای چند‌منطقه‌ای
- مهاجرت‌های پایگاه داده و مدیریت داده‌ها

#### تمرین‌های عملی

**تمرین 3.1: زیرساخت سفارشی**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**تمرین 3.2: برنامه چند‌خدمتی**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**تمرین 3.3: یکپارچه‌سازی پایگاه داده**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### سوالات ارزیابی خود
1. مزایای استفاده از Bicep نسبت به قالب‌های ARM چیست؟
2. چگونه می‌توان مهاجرت‌های پایگاه داده را در استقرارهای azd مدیریت کرد؟
3. چه استراتژی‌هایی برای استقرار بدون توقف وجود دارد؟
4. چگونه می‌توان وابستگی‌ها بین خدمات را مدیریت کرد؟
5. ملاحظات استقرارهای چند‌منطقه‌ای چیست؟

### ماژول 4: اعتبارسنجی پیش از استقرار (هفته 5)

#### اهداف یادگیری
- بررسی‌های جامع پیش از استقرار را اجرا کنید
- برنامه‌ریزی ظرفیت و اعتبارسنجی منابع را به طور کامل یاد بگیرید
- انتخاب SKU و بهینه‌سازی هزینه را درک کنید
- خطوط لوله اعتبارسنجی خودکار بسازید

#### مفاهیم کلیدی برای تسلط
- سهمیه‌ها و محدودیت‌های منابع Azure
- معیارهای انتخاب SKU و پیامدهای هزینه
- اسکریپت‌ها و ابزارهای اعتبارسنجی خودکار
- روش‌های برنامه‌ریزی ظرفیت
- آزمایش عملکرد و بهینه‌سازی

#### تمرین‌های عملی

**تمرین 4.1: برنامه‌ریزی ظرفیت**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**تمرین 4.2: اعتبارسنجی پیش از پرواز**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**تمرین 4.3: بهینه‌سازی SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### سوالات ارزیابی خود
1. چه عواملی باید تصمیمات انتخاب SKU را تحت تأثیر قرار دهند؟
2. چگونه می‌توان قبل از استقرار، در دسترس بودن منابع Azure را اعتبارسنجی کرد؟
3. اجزای کلیدی یک سیستم بررسی پیش از پرواز چیست؟
4. چگونه می‌توان هزینه‌های استقرار را تخمین و کنترل کرد؟
5. چه نظارتی برای برنامه‌ریزی ظرفیت ضروری است؟

### ماژول 5: رفع اشکال و دیباگ (هفته 6)

#### اهداف یادگیری
- روش‌های رفع اشکال سیستماتیک را به طور کامل یاد بگیرید
- تخصص در دیباگ مشکلات پیچیده استقرار را توسعه دهید
- نظارت و هشدار جامع را اجرا کنید
- روش‌های پاسخ به حادثه و بازیابی را بسازید

#### مفاهیم کلیدی برای تسلط
- الگوهای رایج شکست استقرار
- تکنیک‌های تحلیل و همبستگی لاگ‌ها
- نظارت بر عملکرد و بهینه‌سازی
- تشخیص و پاسخ به حادثه‌های امنیتی
- بازیابی از فاجعه و تداوم کسب‌وکار

#### تمرین‌های عملی

**تمرین 5.1: سناریوهای رفع اشکال**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**تمرین 5.2: اجرای نظارت**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**تمرین 5.3: پاسخ به حادثه**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### سوالات ارزیابی خود
1. رویکرد سیستماتیک برای رفع اشکال استقرارهای azd چیست؟
2. چگونه می‌توان لاگ‌ها را در میان چندین سرویس و منابع همبسته کرد؟
3. چه معیارهای نظارتی برای تشخیص زودهنگام مشکلات حیاتی هستند؟
4. چگونه می‌توان روش‌های بازیابی از فاجعه را به طور مؤثر اجرا کرد؟
5. اجزای کلیدی یک برنامه پاسخ به حادثه چیست؟

### ماژول 6: موضوعات پیشرفته و بهترین شیوه‌ها (هفته‌های 7-8)

#### اهداف یادگیری
- الگوهای استقرار در سطح سازمانی را اجرا کنید
- ادغام و خودکارسازی CI/CD را به طور کامل یاد بگیرید
- قالب‌های سفارشی توسعه داده و به جامعه کمک کنید
- الزامات پیشرفته امنیت و انطباق را درک کنید

#### مفاهیم کلیدی برای تسلط
- الگوهای ادغام CI/CD
- توسعه و توزیع قالب‌های سفارشی
- حاکمیت و انطباق سازمانی
- پیکربندی‌های پیشرفته شبکه و امنیت
- بهینه‌سازی عملکرد و مدیریت هزینه

#### تمرین‌های عملی

**تمرین 6.1: ادغام CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**تمرین 6.2: توسعه قالب سفارشی**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**تمرین 6.3: اجرای سازمانی**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### سوالات ارزیابی خود
1. چگونه می‌توان azd را در جریان‌های کاری CI/CD موجود ادغام کرد؟
2. ملاحظات کلیدی برای توسعه قالب‌های سفارشی چیست؟
3. چگونه می‌توان حاکمیت و انطباق را در استقرارهای azd اجرا کرد؟
4. بهترین شیوه‌ها برای استقرار در مقیاس سازمانی چیست؟
5. چگونه می‌توان به طور مؤثر به جامعه azd کمک کرد؟

## پروژه‌های عملی

### پروژه 1: وب‌سایت نمونه کار شخصی
**پیچیدگی**: مبتدی  
**مدت زمان**: 1-2 هفته

ساخت و استقرار یک وب‌سایت نمونه کار شخصی با استفاده از:
- میزبانی وب‌سایت استاتیک در Azure Storage
- پیکربندی دامنه سفارشی
- ادغام CDN برای عملکرد جهانی
- خط لوله استقرار خودکار

**تحویل‌ها**:
- وب‌سایت کاری مستقر در Azure
- قالب azd سفارشی برای استقرار نمونه کارها
- مستندسازی فرآیند استقرار
- توصیه‌های بهینه‌سازی هزینه

### پروژه 2: برنامه مدیریت وظایف
**پیچیدگی**: متوسط  
**مدت زمان**: 2-3 هفته

ایجاد یک برنامه مدیریت وظایف فول‌استک با:
- فرانت‌اند React مستقر در App Service
- بک‌اند API Node.js با احراز هویت
- پایگاه داده PostgreSQL با مهاجرت‌ها
- نظارت Application Insights

**تحویل‌ها**:
- برنامه کامل با احراز هویت کاربر
- اسکریپت‌های طرح پایگاه داده و مهاجرت
- داشبوردهای نظارت و قوانین هشدار
- پیکربندی استقرار چند‌محیطی

### پروژه 3: پلتفرم تجارت الکترونیک مبتنی بر میکروسرویس
**پیچیدگی**: پیشرفته  
**مدت زمان**: 4-6 هفته

طراحی و اجرای یک پلتفرم تجارت الکترونیک مبتنی بر میکروسرویس با:
- چندین سرویس API (کاتالوگ، سفارشات، پرداخت‌ها، کاربران)
- ادغام صف پیام با Service Bus
- کش Redis برای بهینه‌سازی عملکرد
- لاگ‌گیری و نظارت جامع

**تحویل‌ها**:
- معماری کامل میکروسرویس
- الگوهای ارتباط بین سرویس‌ها
- آزمایش عملکرد و بهینه‌سازی
- اجرای امنیت آماده تولید

## ارزیابی و گواهینامه

### بررسی‌های دانش

این ارزیابی‌ها را پس از هر ماژول تکمیل کنید:

**ارزیابی ماژول 1**: مفاهیم پایه و نصب
- سوالات چندگزینه‌ای درباره مفاهیم اصلی
- وظایف عملی نصب و پیکربندی
- تمرین ساده استقرار

**ارزیابی ماژول 2**: پیکربندی و محیط‌ها
- سناریوهای مدیریت محیط
- تمرین‌های رفع اشکال پیکربندی
- اجرای پیکربندی امنیتی

**ارزیابی ماژول 3**: استقرار و تهیه منابع
- چالش‌های طراحی زیرساخت
- سناریوهای استقرار چند‌خدمتی
- تمرین‌های بهینه‌سازی عملکرد

**ارزیابی ماژول 4**: اعتبارسنجی پیش از استقرار
- مطالعات موردی برنامه‌ریزی ظرفیت
- سناریوهای بهینه‌سازی هزینه
- اجرای خط لوله اعتبارسنجی

**ارزیابی ماژول 5**: رفع اشکال و دیباگ
- تمرین‌های تشخیص مشکل
- وظایف اجرای نظارت
- شبیه‌سازی‌های پاسخ به حادثه

**ارزیابی ماژول 6**: موضوعات پیشرفته
- طراحی خط لوله CI/CD
- توسعه قالب سفارشی
- سناریوهای معماری سازمانی

### پروژه نهایی

طراحی و اجرای یک راه‌حل کامل که نشان‌دهنده تسلط بر تمام مفاهیم باشد:

**الزامات**:
- معماری برنامه چند‌لایه
- چندین محیط استقرار
- نظارت و هشدار جامع
- اجرای امنیت و انطباق
- بهینه‌سازی هزینه و تنظیم عملکرد
- مستندسازی کامل و راهنماها

**معیارهای ارزیابی**:
- کیفیت اجرای فنی
- کامل بودن مستندسازی
- رعایت امنیت و بهترین شیوه‌ها
- بهینه‌سازی عملکرد و هزینه
- اثربخشی رفع اشکال و نظارت

## منابع مطالعه و مراجع

### مستندات رسمی
- [مستندات Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [مستندات Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### منابع جامعه
- [گالری قالب AZD](https://azure.github.io/awesome-azd/)
- [سازمان GitHub نمونه‌های Azure](https://github.com/Azure-Samples)
- [مخزن GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### محیط‌های تمرینی
- [حساب رایگان Azure](https://azure.microsoft.com/free/)
- [سطح رایگان Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### ابزارهای اضافی
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [بسته افزونه ابزارهای Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## توصیه‌های برنامه مطالعه

### مطالعه تمام‌وقت (8 هفته)
- **هفته‌های 1-2**: ماژول‌های 1-2 (شروع کار، پیکربندی)
- **هفته‌های 3-4**: ماژول‌های 3-4 (استقرار، پیش از استقرار)
- **هفته‌های 5-6**: ماژول‌های 5-6 (رفع اشکال، موضوعات پیشرفته)
- **هفته‌های 7-8**: پروژه‌های عملی و ارزیابی نهایی

### مطالعه پاره‌وقت (16 هفته)
- **هفته‌های 1-4**: ماژول 1 (شروع کار)
- **هفته‌های 5-7**: ماژول 2 (پیکربندی و محیط‌ها)
- **هفته‌های 8-10**: ماژول 3 (استقرار و تهیه منابع)
- **هفته‌های 11-12**: ماژول 4 (اعتبارسنجی پیش از استقرار)
- **هفته‌های 13-14**: ماژول 5 (رفع اشکال و دیباگ)
- **هفته‌های 15-16**: ماژول 6 (موضوعات پیشرفته و ارزیابی)

### مطالعه خودمحور
- هر ماژول را با سرعت خود تکمیل کنید
- زمان بیشتری را برای مفاهیم چالش‌برانگیز صرف کنید
- تمرین‌ها را تا زمانی که به تسلط برسید تکرار کنید
- در بحث‌های جامعه شرکت کنید و سوال بپرسید

## نکات موفقیت

### استراتژی‌های یادگیری مؤثر
1. **تمرین منظم**: برنامه‌ها را به طور مکرر مستقر کنید تا حافظه عملی ایجاد کنید
2. **آزمایش بی‌پروا**: از محیط‌های توسعه برای امتحان پیکربندی‌های جدید استفاده کنید
3. **مستندسازی یادگیری خود**: یادداشت‌هایی درباره راه‌حل‌های مشکلاتی که با آنها مواجه می‌شوید نگه دارید
4. **به جامعه بپیوندید**: در بحث‌ها شرکت کنید و به پروژه‌ها کمک کنید
5. **به‌روز بمانید**: به‌روزرسانی‌های Azure و ویژگی‌های جدید azd را دنبال کنید

### اشتباهات رایج برای اجتناب
1. **رد کردن پیش‌نیازها**: اطمینان حاصل کنید که دانش پایه مناسب دارید
2. **عجله در مفاهیم**: زمان کافی برای درک کامل اصول صرف کنید
3. **نادیده گرفتن امنیت**: همیشه از ابتدا بهترین شیوه‌های امنیتی را اجرا کنید
4. **عدم آزمایش کامل**: استقرارها را در محیط‌های مختلف آزمایش کنید
5. **اجتناب از مستندسازی**: مستندسازی خوب برای نگهداری ضروری است

### ایجاد تجربه عملی
1. **کوچک شروع کنید**: با برنامه‌های ساده شروع کنید و به تدریج پیچیدگی را افزایش دهید
2. **از شکست یاد بگی
3. **مشارکت در متن‌باز**: قالب‌ها و راه‌حل‌های خود را با جامعه به اشتراک بگذارید  
4. **آموزش به دیگران**: توضیح مفاهیم به دیگران درک شما را تقویت می‌کند  
5. **کنجکاو بمانید**: به طور مداوم خدمات جدید Azure و الگوهای یکپارچه‌سازی را کشف کنید  

---

**ناوبری**  
- **درس قبلی**: [FAQ](faq.md)  
- **درس بعدی**: [Changelog](../changelog.md)  

**ردیابی پیشرفت مطالعه**: از این راهنما برای پیگیری مسیر یادگیری خود استفاده کنید و مطمئن شوید که تمام مفاهیم و تمرین‌های Azure Developer CLI را به طور کامل پوشش داده‌اید.  

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.