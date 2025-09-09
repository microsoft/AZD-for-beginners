<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:04:00+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ur"
}
-->
# ابتدائی افراد کے لیے AZD - مطالعہ گائیڈ

## تعارف

یہ جامع مطالعہ گائیڈ آپ کو Azure Developer CLI (azd) کو سیکھنے کے لیے منظم اہداف، اہم تصورات، عملی مشقیں، اور جائزہ مواد فراہم کرتا ہے۔ اس گائیڈ کو اپنی پیش رفت کو ٹریک کرنے اور تمام ضروری موضوعات کو مکمل کرنے کے لیے استعمال کریں۔

## سیکھنے کے اہداف

اس مطالعہ گائیڈ کو مکمل کرنے کے بعد آپ:
- Azure Developer CLI کے بنیادی اور اعلیٰ تصورات میں مہارت حاصل کریں گے
- Azure ایپلیکیشنز کو تعینات کرنے اور ان کا انتظام کرنے میں عملی مہارت حاصل کریں گے
- تعیناتی کے مسائل کو حل کرنے اور ان کی اصلاح کرنے میں اعتماد پیدا کریں گے
- پروڈکشن کے لیے تیار تعیناتی کے طریقے اور سیکیورٹی کے پہلوؤں کو سمجھیں گے

## سیکھنے کے نتائج

اس مطالعہ گائیڈ کے تمام حصے مکمل کرنے کے بعد آپ:
- azd کا استعمال کرتے ہوئے مکمل ایپلیکیشن آرکیٹیکچرز کو ڈیزائن، تعینات، اور منظم کر سکیں گے
- جامع مانیٹرنگ، سیکیورٹی، اور لاگت کی اصلاح کی حکمت عملیوں کو نافذ کر سکیں گے
- پیچیدہ تعیناتی کے مسائل کو خود سے حل کر سکیں گے
- کسٹم ٹیمپلیٹس بنا سکیں گے اور azd کمیونٹی میں حصہ لے سکیں گے

## کورس کا ڈھانچہ

### ماڈیول 1: شروعات (ہفتہ 1-2)

#### سیکھنے کے اہداف
- Azure Developer CLI کے بنیادی اصولوں اور تصورات کو سمجھیں
- اپنے ترقیاتی ماحول میں azd کو کامیابی سے انسٹال اور ترتیب دیں
- موجودہ ٹیمپلیٹ کا استعمال کرتے ہوئے اپنی پہلی تعیناتی مکمل کریں
- azd پروجیکٹ کے ڈھانچے کو نیویگیٹ کریں اور اہم اجزاء کو سمجھیں

#### اہم تصورات
- ٹیمپلیٹس، ماحول، اور سروسز
- azure.yaml کنفیگریشن ڈھانچہ
- azd کے بنیادی کمانڈز (init, up, down, deploy)
- کوڈ کے اصول کے طور پر انفراسٹرکچر
- Azure کی تصدیق اور اجازت

#### عملی مشقیں

**مشق 1.1: انسٹالیشن اور سیٹ اپ**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**مشق 1.2: پہلی تعیناتی**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**مشق 1.3: پروجیکٹ ڈھانچے کا تجزیہ**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### خود جائزہ سوالات
1. azd آرکیٹیکچر کے تین بنیادی تصورات کیا ہیں؟
2. azure.yaml فائل کا مقصد کیا ہے؟
3. مختلف تعیناتی کے اہداف کو منظم کرنے میں ماحول کیسے مدد کرتے ہیں؟
4. azd کے ساتھ کون سے تصدیق کے طریقے استعمال کیے جا سکتے ہیں؟
5. جب آپ پہلی بار `azd up` چلاتے ہیں تو کیا ہوتا ہے؟

### ماڈیول 2: کنفیگریشن اور ماحول (ہفتہ 3)

#### سیکھنے کے اہداف
- ماحول کے انتظام اور کنفیگریشن میں مہارت حاصل کریں
- azure.yaml کی اعلیٰ درجے کی کنفیگریشن کو سمجھیں
- ماحول کے مخصوص ترتیبات اور متغیرات کو نافذ کریں
- مختلف منظرناموں کے لیے تصدیق کو ترتیب دیں

#### اہم تصورات
- ماحول کی درجہ بندی اور متغیر کی ترجیح
- سروس کنفیگریشن اور پیرامیٹرز
- ہکس اور لائف سائیکل ایونٹس
- تصدیق کے طریقے (یوزر، سروس پرنسپل، مینیجڈ آئیڈینٹیٹی)
- کنفیگریشن فائل کا انتظام

#### عملی مشقیں

**مشق 2.1: ملٹی-ماحول سیٹ اپ**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**مشق 2.2: اعلیٰ درجے کی کنفیگریشن**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**مشق 2.3: سیکیورٹی کنفیگریشن**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### خود جائزہ سوالات
1. azd ماحول کے متغیر کی ترجیح کو کیسے ہینڈل کرتا ہے؟
2. تعیناتی ہکس کیا ہیں اور انہیں کب استعمال کرنا چاہیے؟
3. مختلف ماحول کے لیے مختلف SKUs کو کیسے ترتیب دیا جاتا ہے؟
4. مختلف تصدیق کے طریقوں کے سیکیورٹی کے مضمرات کیا ہیں؟
5. راز اور حساس کنفیگریشن ڈیٹا کو کیسے منظم کیا جاتا ہے؟

### ماڈیول 3: تعیناتی اور پروویژننگ (ہفتہ 4)

#### سیکھنے کے اہداف
- تعیناتی کے ورک فلو اور بہترین طریقوں میں مہارت حاصل کریں
- Bicep ٹیمپلیٹس کے ساتھ کوڈ کے اصول کے طور پر انفراسٹرکچر کو سمجھیں
- پیچیدہ ملٹی-سروس آرکیٹیکچرز کو نافذ کریں
- تعیناتی کی کارکردگی اور قابل اعتماد کو بہتر بنائیں

#### اہم تصورات
- Bicep ٹیمپلیٹ کا ڈھانچہ اور ماڈیولز
- وسائل کی انحصار اور ترتیب
- تعیناتی کی حکمت عملی (بلیو-گرین، رولنگ اپڈیٹس)
- ملٹی-ریجن تعیناتی
- ڈیٹا بیس مائیگریشنز اور ڈیٹا کا انتظام

#### عملی مشقیں

**مشق 3.1: کسٹم انفراسٹرکچر**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**مشق 3.2: ملٹی-سروس ایپلیکیشن**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**مشق 3.3: ڈیٹا بیس انٹیگریشن**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### خود جائزہ سوالات
1. ARM ٹیمپلیٹس کے مقابلے میں Bicep کے فوائد کیا ہیں؟
2. azd تعیناتی میں ڈیٹا بیس مائیگریشنز کو کیسے ہینڈل کیا جاتا ہے؟
3. زیرو-ڈاؤن ٹائم تعیناتی کے لیے کون سی حکمت عملی موجود ہیں؟
4. سروسز کے درمیان انحصار کو کیسے منظم کیا جاتا ہے؟
5. ملٹی-ریجن تعیناتی کے لیے کیا غور و فکر ضروری ہیں؟

### ماڈیول 4: تعیناتی سے پہلے کی توثیق (ہفتہ 5)

#### سیکھنے کے اہداف
- جامع تعیناتی سے پہلے کے چیکز کو نافذ کریں
- صلاحیت کی منصوبہ بندی اور وسائل کی توثیق میں مہارت حاصل کریں
- SKU کے انتخاب اور لاگت کی اصلاح کو سمجھیں
- خودکار توثیق کے پائپ لائنز بنائیں

#### اہم تصورات
- Azure وسائل کے کوٹہ اور حدود
- SKU کے انتخاب کے معیار اور لاگت کے مضمرات
- خودکار توثیق کے اسکرپٹس اور ٹولز
- صلاحیت کی منصوبہ بندی کے طریقے
- کارکردگی کی جانچ اور اصلاح

#### عملی مشقیں

**مشق 4.1: صلاحیت کی منصوبہ بندی**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**مشق 4.2: پری-فلائٹ توثیق**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**مشق 4.3: SKU کی اصلاح**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### خود جائزہ سوالات
1. SKU کے انتخاب کے فیصلوں کو کون سے عوامل متاثر کرتے ہیں؟
2. تعیناتی سے پہلے Azure وسائل کی دستیابی کو کیسے توثیق کیا جاتا ہے؟
3. پری-فلائٹ چیک سسٹم کے کلیدی اجزاء کیا ہیں؟
4. تعیناتی کی لاگت کا اندازہ اور کنٹرول کیسے کیا جاتا ہے؟
5. صلاحیت کی منصوبہ بندی کے لیے کون سی مانیٹرنگ ضروری ہے؟

### ماڈیول 5: خرابیوں کا پتہ لگانا اور ڈیبگنگ (ہفتہ 6)

#### سیکھنے کے اہداف
- منظم خرابیوں کا پتہ لگانے کے طریقے میں مہارت حاصل کریں
- پیچیدہ تعیناتی کے مسائل کو ڈیبگ کرنے میں مہارت حاصل کریں
- جامع مانیٹرنگ اور الرٹنگ کو نافذ کریں
- واقعہ کے ردعمل اور بحالی کے طریقے بنائیں

#### اہم تصورات
- عام تعیناتی کی ناکامی کے نمونے
- لاگ تجزیہ اور تعلق کی تکنیکیں
- کارکردگی کی مانیٹرنگ اور اصلاح
- سیکیورٹی واقعہ کا پتہ لگانا اور ردعمل
- آفت کی بحالی اور کاروباری تسلسل

#### عملی مشقیں

**مشق 5.1: خرابیوں کے منظرنامے**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**مشق 5.2: مانیٹرنگ کا نفاذ**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**مشق 5.3: واقعہ کا ردعمل**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### خود جائزہ سوالات
1. azd تعیناتی کے مسائل کو حل کرنے کے لیے منظم طریقہ کیا ہے؟
2. متعدد سروسز اور وسائل کے درمیان لاگز کو کیسے تعلق دیا جاتا ہے؟
3. ابتدائی مسئلے کے پتہ لگانے کے لیے کون سے مانیٹرنگ میٹرکس سب سے زیادہ اہم ہیں؟
4. مؤثر آفت کی بحالی کے طریقے کیسے نافذ کیے جاتے ہیں؟
5. واقعہ کے ردعمل کے منصوبے کے کلیدی اجزاء کیا ہیں؟

### ماڈیول 6: اعلیٰ درجے کے موضوعات اور بہترین طریقے (ہفتہ 7-8)

#### سیکھنے کے اہداف
- انٹرپرائز گریڈ تعیناتی کے نمونے نافذ کریں
- CI/CD انٹیگریشن اور خودکاریت میں مہارت حاصل کریں
- کسٹم ٹیمپلیٹس تیار کریں اور کمیونٹی میں حصہ ڈالیں
- اعلیٰ درجے کی سیکیورٹی اور تعمیل کی ضروریات کو سمجھیں

#### اہم تصورات
- CI/CD پائپ لائن انٹیگریشن کے نمونے
- کسٹم ٹیمپلیٹ کی ترقی اور تقسیم
- انٹرپرائز گورننس اور تعمیل
- اعلیٰ درجے کی نیٹ ورکنگ اور سیکیورٹی کنفیگریشنز
- کارکردگی کی اصلاح اور لاگت کا انتظام

#### عملی مشقیں

**مشق 6.1: CI/CD انٹیگریشن**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**مشق 6.2: کسٹم ٹیمپلیٹ کی ترقی**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**مشق 6.3: انٹرپرائز نفاذ**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### خود جائزہ سوالات
1. azd کو موجودہ CI/CD ورک فلو میں کیسے شامل کیا جاتا ہے؟
2. کسٹم ٹیمپلیٹ کی ترقی کے لیے کلیدی غور و فکر کیا ہیں؟
3. azd تعیناتی میں گورننس اور تعمیل کو کیسے نافذ کیا جاتا ہے؟
4. انٹرپرائز پیمانے پر تعیناتی کے بہترین طریقے کیا ہیں؟
5. azd کمیونٹی میں مؤثر طریقے سے کیسے حصہ لیا جاتا ہے؟

## عملی منصوبے

### منصوبہ 1: ذاتی پورٹ فولیو ویب سائٹ
**پیچیدگی**: ابتدائی  
**مدت**: 1-2 ہفتے

ذاتی پورٹ فولیو ویب سائٹ بنائیں اور تعینات کریں:
- Azure Storage پر جامد ویب سائٹ ہوسٹنگ
- کسٹم ڈومین کنفیگریشن
- عالمی کارکردگی کے لیے CDN انٹیگریشن
- خودکار تعیناتی پائپ لائن

**ڈیلیورایبلز**:
- Azure پر کام کرنے والی ویب سائٹ
- پورٹ فولیو تعیناتی کے لیے کسٹم azd ٹیمپلیٹ
- تعیناتی کے عمل کی دستاویزات
- لاگت کا تجزیہ اور اصلاح کی سفارشات

### منصوبہ 2: ٹاسک مینجمنٹ ایپلیکیشن
**پیچیدگی**: درمیانی  
**مدت**: 2-3 ہفتے

ایک مکمل اسٹیک ٹاسک مینجمنٹ ایپلیکیشن بنائیں:
- React فرنٹ اینڈ App Service پر تعینات
- Node.js API بیک اینڈ کے ساتھ تصدیق
- PostgreSQL ڈیٹا بیس کے ساتھ مائیگریشنز
- Application Insights مانیٹرنگ

**ڈیلیورایبلز**:
- صارف کی تصدیق کے ساتھ مکمل ایپلیکیشن
- ڈیٹا بیس اسکیمہ اور مائیگریشن اسکرپٹس
- مانیٹرنگ ڈیش بورڈز اور الرٹنگ رولز
- ملٹی-ماحول تعیناتی کنفیگریشن

### منصوبہ 3: مائیکرو سروسز ای کامرس پلیٹ فارم
**پیچیدگی**: اعلیٰ  
**مدت**: 4-6 ہفتے

مائیکرو سروسز پر مبنی ای کامرس پلیٹ فارم ڈیزائن اور نافذ کریں:
- متعدد API سروسز (کیٹلاگ، آرڈرز، ادائیگیاں، صارفین)
- Service Bus کے ساتھ میسج کیو انٹیگریشن
- کارکردگی کی اصلاح کے لیے Redis کیش
- جامع لاگنگ اور مانیٹرنگ

**ڈیلیورایبلز**:
- مکمل مائیکرو سروسز آرکیٹیکچر
- انٹر سروس کمیونیکیشن کے نمونے
- کارکردگی کی جانچ اور اصلاح
- پروڈکشن کے لیے تیار سیکیورٹی نفاذ

## جائزہ اور سرٹیفیکیشن

### علم کی جانچ

ہر ماڈیول کے بعد یہ جائزے مکمل کریں:

**ماڈیول 1 جائزہ**: بنیادی تصورات اور انسٹالیشن
- بنیادی تصورات پر متعدد انتخاب کے سوالات
- عملی انسٹالیشن اور کنفیگریشن کے کام
- سادہ تعیناتی کی مشق

**ماڈیول 2 جائزہ**: کنفیگریشن اور ماحول
- ماحول کے انتظام کے منظرنامے
- کنفیگریشن کے مسائل کو حل کرنے کی مشقیں
- سیکیورٹی کنفیگریشن کا نفاذ

**ماڈیول 3 جائزہ**: تعیناتی اور پروویژننگ
- انفراسٹرکچر ڈیزائن کے چیلنجز
- ملٹی-سروس تعیناتی کے منظرنامے
- کارکردگی کی اصلاح کی مشقیں

**ماڈیول 4 جائزہ**: تعیناتی سے پہلے کی توثیق
- صلاحیت کی منصوبہ بندی کے کیس اسٹڈیز
- لاگت کی اصلاح کے منظرنامے
- توثیق کے پائپ لائن کا نفاذ

**ماڈیول 5 جائزہ**: خرابیوں کا پتہ لگانا اور ڈیبگنگ
- مسئلے کی تشخیص کی مشقیں
- مانیٹرنگ کے نفاذ کے کام
- واقعہ کے ردعمل کی تخیلاتی مشقیں

**ماڈیول 6 جائزہ**: اعلیٰ درجے کے موضوعات
- CI/CD پائپ لائن ڈیزائن
- کسٹم ٹیمپلیٹ کی ترقی
- انٹرپرائز آرکیٹیکچر کے منظرنامے

### حتمی کیپ اسٹون پروجیکٹ

ایک مکمل حل ڈیزائن کریں اور نافذ کریں جو تمام تصورات میں مہارت کو ظاہر کرے:

**ضروریات**:
- ملٹی-ٹائر ایپلیکیشن آرکیٹیکچر
- متعدد تعیناتی ماحول
- جامع مانیٹرنگ اور الرٹنگ
- سیکیورٹی اور تعمیل کا نفاذ
- لاگت کی اصلاح اور کارکردگی کی ٹیوننگ
- مکمل دستاویزات اور رن بکس

**تشخیص کے معیار**:
- تکنیکی نفاذ کا معیار
- دستاویزات کی مکملیت
- سیکیورٹی اور بہترین طریقوں کی پابندی
- کارکردگی اور لاگت کی اصلاح
- خرابیوں کا پتہ لگانے اور مانیٹرنگ کی مؤثریت

## مطالعہ کے وسائل اور حوالہ جات

### سرکاری دستاویزات
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### کمیونٹی وسائل
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### عملی ماحول
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### اضافی ٹولز
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## مطالعہ کے شیڈول کی سفارشات

### فل ٹائم مطالعہ (8 ہفتے)
- **ہفتہ 1-2**: ماڈیول 1-2 (شروعات، کنفیگریشن)
- **ہفتہ 3-4**: ماڈیول 3-4 (تعیناتی، تعیناتی سے پہلے)
- **ہفتہ 5-6**: ماڈیول 5-6 (خرابیوں کا پتہ لگانا، اعلیٰ درجے کے موضوعات)
- **ہفتہ 7-8**: عملی منصوبے اور حتمی جائزہ

### پارٹ ٹائم مطالعہ (16 ہفتے)
- **ہفتہ 1-4**: ماڈیول 1 (شروعات)
- **ہفتہ 5-7**: ماڈیول 2 (کنفیگریشن اور ماحول)
- **ہفتہ 8-10**: ماڈیول 3 (تعیناتی اور پروویژننگ)
- **ہفتہ 11-12**: ماڈیول 4 (تعیناتی سے پہلے کی توثی
3. **اوپن سورس میں حصہ ڈالیں**: اپنی ٹیمپلیٹس اور حل کمیونٹی کے ساتھ شیئر کریں  
4. **دوسروں کو سکھائیں**: دوسروں کو تصورات سمجھانے سے آپ کی اپنی سمجھ مضبوط ہوتی ہے  
5. **جستجو جاری رکھیں**: نئے Azure سروسز اور انٹیگریشن پیٹرنز کو مسلسل دریافت کریں  

---

**نیویگیشن**  
- **پچھلا سبق**: [FAQ](faq.md)  
- **اگلا سبق**: [Changelog](../changelog.md)  

**مطالعہ کی پیشرفت کی ٹریکنگ**: اس گائیڈ کا استعمال کریں تاکہ آپ اپنی سیکھنے کے سفر کو ٹریک کر سکیں اور Azure Developer CLI کے تمام تصورات اور عملی طریقوں کا مکمل احاطہ یقینی بنائیں۔  

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔