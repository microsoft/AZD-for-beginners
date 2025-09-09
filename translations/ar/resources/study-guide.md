<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:03:18+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ar"
}
-->
# دليل الدراسة - AZD للمبتدئين

## المقدمة

يوفر هذا الدليل الشامل أهداف تعلم منظمة، مفاهيم رئيسية، تمارين عملية، ومواد تقييم لمساعدتك على إتقان Azure Developer CLI (azd). استخدم هذا الدليل لتتبع تقدمك والتأكد من تغطية جميع المواضيع الأساسية.

## أهداف التعلم

عند إكمال هذا الدليل الدراسي، ستتمكن من:
- إتقان جميع المفاهيم الأساسية والمتقدمة لـ Azure Developer CLI
- تطوير مهارات عملية في نشر وإدارة تطبيقات Azure
- بناء الثقة في استكشاف الأخطاء وإصلاحها وتحسين عمليات النشر
- فهم ممارسات النشر الجاهزة للإنتاج واعتبارات الأمان

## نتائج التعلم

بعد إكمال جميع أقسام هذا الدليل الدراسي، ستتمكن من:
- تصميم، نشر، وإدارة بنى تطبيقات كاملة باستخدام azd
- تنفيذ استراتيجيات شاملة للمراقبة، الأمان، وتحسين التكلفة
- استكشاف مشكلات النشر المعقدة بشكل مستقل
- إنشاء قوالب مخصصة والمساهمة في مجتمع azd

## هيكل الدورة

### الوحدة 1: البداية (الأسبوعان 1-2)

#### أهداف التعلم
- فهم أساسيات ومفاهيم Azure Developer CLI
- تثبيت وتكوين azd بنجاح في بيئة التطوير الخاصة بك
- إكمال أول عملية نشر باستخدام قالب موجود
- التنقل في هيكل مشروع azd وفهم المكونات الرئيسية

#### المفاهيم الرئيسية للإتقان
- القوالب، البيئات، والخدمات
- هيكل تكوين azure.yaml
- أوامر azd الأساسية (init، up، down، deploy)
- مبادئ البنية التحتية ككود
- المصادقة والتفويض في Azure

#### تمارين عملية

**التمرين 1.1: التثبيت والإعداد**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**التمرين 1.2: أول عملية نشر**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**التمرين 1.3: تحليل هيكل المشروع**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### أسئلة التقييم الذاتي
1. ما هي المفاهيم الثلاثة الأساسية لهندسة azd؟
2. ما هو الغرض من ملف azure.yaml؟
3. كيف تساعد البيئات في إدارة أهداف النشر المختلفة؟
4. ما هي طرق المصادقة التي يمكن استخدامها مع azd؟
5. ماذا يحدث عند تشغيل `azd up` لأول مرة؟

### الوحدة 2: التكوين والبيئات (الأسبوع 3)

#### أهداف التعلم
- إتقان إدارة البيئات والتكوين
- فهم تكوينات azure.yaml المتقدمة
- تنفيذ إعدادات ومتغيرات خاصة بالبيئة
- تكوين المصادقة لسيناريوهات مختلفة

#### المفاهيم الرئيسية للإتقان
- التسلسل الهرمي للبيئة وأولوية المتغيرات
- تكوين الخدمة والمعلمات
- الأحداث والعمليات في دورة الحياة
- طرق المصادقة (المستخدم، الخدمة الرئيسية، الهوية المُدارة)
- إدارة ملفات التكوين

#### تمارين عملية

**التمرين 2.1: إعداد متعدد البيئات**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**التمرين 2.2: التكوين المتقدم**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**التمرين 2.3: تكوين الأمان**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### أسئلة التقييم الذاتي
1. كيف يتعامل azd مع أولوية متغيرات البيئة؟
2. ما هي عمليات النشر وكيف يمكن استخدامها؟
3. كيف تقوم بتكوين SKUs مختلفة لبيئات مختلفة؟
4. ما هي الآثار الأمنية لطرق المصادقة المختلفة؟
5. كيف تدير الأسرار والبيانات الحساسة في التكوين؟

### الوحدة 3: النشر والتوفير (الأسبوع 4)

#### أهداف التعلم
- إتقان سير عمل النشر وأفضل الممارسات
- فهم البنية التحتية ككود باستخدام قوالب Bicep
- تنفيذ بنى معقدة متعددة الخدمات
- تحسين أداء النشر وموثوقيته

#### المفاهيم الرئيسية للإتقان
- هيكل قوالب Bicep والوحدات
- تبعيات الموارد وترتيبها
- استراتيجيات النشر (blue-green، التحديثات المتدرجة)
- النشر متعدد المناطق
- ترحيل قواعد البيانات وإدارة البيانات

#### تمارين عملية

**التمرين 3.1: البنية التحتية المخصصة**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**التمرين 3.2: تطبيق متعدد الخدمات**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**التمرين 3.3: تكامل قاعدة البيانات**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### أسئلة التقييم الذاتي
1. ما هي مزايا استخدام Bicep مقارنة بـ ARM templates؟
2. كيف تتعامل مع ترحيل قواعد البيانات في عمليات نشر azd؟
3. ما هي الاستراتيجيات الموجودة للنشر بدون توقف؟
4. كيف تدير التبعيات بين الخدمات؟
5. ما هي الاعتبارات للنشر متعدد المناطق؟

### الوحدة 4: التحقق قبل النشر (الأسبوع 5)

#### أهداف التعلم
- تنفيذ فحوصات شاملة قبل النشر
- إتقان تخطيط السعة والتحقق من الموارد
- فهم اختيار SKUs وتحسين التكلفة
- بناء خطوط تحقق آلية

#### المفاهيم الرئيسية للإتقان
- حصص وقيود موارد Azure
- معايير اختيار SKUs وآثار التكلفة
- نصوص وأدوات التحقق الآلية
- منهجيات تخطيط السعة
- اختبار الأداء والتحسين

#### تمارين عملية

**التمرين 4.1: تخطيط السعة**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**التمرين 4.2: التحقق قبل النشر**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**التمرين 4.3: تحسين SKUs**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### أسئلة التقييم الذاتي
1. ما هي العوامل التي يجب أن تؤثر على قرارات اختيار SKUs؟
2. كيف تتحقق من توفر موارد Azure قبل النشر؟
3. ما هي المكونات الرئيسية لنظام التحقق قبل النشر؟
4. كيف تقدر وتتحكم في تكاليف النشر؟
5. ما هي المراقبة الأساسية لتخطيط السعة؟

### الوحدة 5: استكشاف الأخطاء وإصلاحها (الأسبوع 6)

#### أهداف التعلم
- إتقان منهجيات استكشاف الأخطاء وإصلاحها بشكل منهجي
- تطوير الخبرة في تصحيح مشكلات النشر المعقدة
- تنفيذ مراقبة شاملة وتنبيهات
- بناء إجراءات الاستجابة للحوادث والتعافي

#### المفاهيم الرئيسية للإتقان
- أنماط فشل النشر الشائعة
- تقنيات تحليل السجلات والارتباط
- مراقبة الأداء والتحسين
- اكتشاف الحوادث الأمنية والاستجابة لها
- التعافي من الكوارث واستمرارية الأعمال

#### تمارين عملية

**التمرين 5.1: سيناريوهات استكشاف الأخطاء**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**التمرين 5.2: تنفيذ المراقبة**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**التمرين 5.3: الاستجابة للحوادث**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### أسئلة التقييم الذاتي
1. ما هو النهج المنهجي لاستكشاف أخطاء عمليات نشر azd؟
2. كيف تربط السجلات عبر خدمات وموارد متعددة؟
3. ما هي مقاييس المراقبة الأكثر أهمية للكشف المبكر عن المشكلات؟
4. كيف تنفذ إجراءات فعالة للتعافي من الكوارث؟
5. ما هي المكونات الرئيسية لخطة الاستجابة للحوادث؟

### الوحدة 6: المواضيع المتقدمة وأفضل الممارسات (الأسبوعان 7-8)

#### أهداف التعلم
- تنفيذ أنماط نشر على مستوى المؤسسات
- إتقان التكامل والأتمتة مع CI/CD
- تطوير قوالب مخصصة والمساهمة في المجتمع
- فهم متطلبات الأمان والامتثال المتقدمة

#### المفاهيم الرئيسية للإتقان
- أنماط تكامل CI/CD
- تطوير وتوزيع القوالب المخصصة
- حوكمة المؤسسات والامتثال
- تكوينات الشبكات والأمان المتقدمة
- تحسين الأداء وإدارة التكلفة

#### تمارين عملية

**التمرين 6.1: تكامل CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**التمرين 6.2: تطوير القوالب المخصصة**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**التمرين 6.3: تنفيذ المؤسسات**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### أسئلة التقييم الذاتي
1. كيف تدمج azd في سير عمل CI/CD الحالي؟
2. ما هي الاعتبارات الرئيسية لتطوير القوالب المخصصة؟
3. كيف تنفذ الحوكمة والامتثال في عمليات نشر azd؟
4. ما هي أفضل الممارسات للنشر على مستوى المؤسسات؟
5. كيف تساهم بشكل فعال في مجتمع azd؟

## المشاريع العملية

### المشروع 1: موقع ويب شخصي
**التعقيد**: مبتدئ  
**المدة**: 1-2 أسبوع

قم ببناء ونشر موقع ويب شخصي باستخدام:
- استضافة موقع ثابت على Azure Storage
- تكوين نطاق مخصص
- تكامل CDN لتحسين الأداء العالمي
- خط نشر آلي

**المخرجات**:
- موقع ويب يعمل ومُستضاف على Azure
- قالب azd مخصص لنشر المواقع الشخصية
- توثيق عملية النشر
- توصيات لتحليل التكلفة وتحسينها

### المشروع 2: تطبيق إدارة المهام
**التعقيد**: متوسط  
**المدة**: 2-3 أسابيع

قم بإنشاء تطبيق إدارة مهام كامل باستخدام:
- واجهة أمامية React منشورة على App Service
- واجهة خلفية API Node.js مع المصادقة
- قاعدة بيانات PostgreSQL مع عمليات الترحيل
- مراقبة باستخدام Application Insights

**المخرجات**:
- تطبيق كامل مع مصادقة المستخدم
- مخططات قاعدة البيانات ونصوص الترحيل
- لوحات مراقبة وقواعد تنبيه
- تكوين نشر متعدد البيئات

### المشروع 3: منصة تجارة إلكترونية تعتمد على الخدمات المصغرة
**التعقيد**: متقدم  
**المدة**: 4-6 أسابيع

قم بتصميم وتنفيذ منصة تجارة إلكترونية تعتمد على الخدمات المصغرة:
- خدمات API متعددة (الكتالوج، الطلبات، المدفوعات، المستخدمين)
- تكامل قائمة الرسائل باستخدام Service Bus
- ذاكرة تخزين Redis لتحسين الأداء
- تسجيل شامل ومراقبة

**المخرجات**:
- بنية خدمات مصغرة كاملة
- أنماط الاتصال بين الخدمات
- اختبار الأداء وتحسينه
- تنفيذ أمان جاهز للإنتاج

## التقييم والشهادة

### اختبارات المعرفة

أكمل هذه التقييمات بعد كل وحدة:

**تقييم الوحدة 1**: المفاهيم الأساسية والتثبيت
- أسئلة اختيار من متعدد حول المفاهيم الأساسية
- مهام عملية للتثبيت والتكوين
- تمرين نشر بسيط

**تقييم الوحدة 2**: التكوين والبيئات
- سيناريوهات إدارة البيئات
- تمارين استكشاف أخطاء التكوين
- تنفيذ تكوين الأمان

**تقييم الوحدة 3**: النشر والتوفير
- تحديات تصميم البنية التحتية
- سيناريوهات نشر متعددة الخدمات
- تمارين تحسين الأداء

**تقييم الوحدة 4**: التحقق قبل النشر
- دراسات حالة تخطيط السعة
- سيناريوهات تحسين التكلفة
- تنفيذ خط تحقق

**تقييم الوحدة 5**: استكشاف الأخطاء وإصلاحها
- تمارين تشخيص المشكلات
- مهام تنفيذ المراقبة
- محاكاة استجابة للحوادث

**تقييم الوحدة 6**: المواضيع المتقدمة
- تصميم خط CI/CD
- تطوير القوالب المخصصة
- سيناريوهات بنية المؤسسات

### المشروع النهائي

قم بتصميم وتنفيذ حل كامل يثبت إتقانك لجميع المفاهيم:

**المتطلبات**:
- بنية تطبيق متعددة الطبقات
- بيئات نشر متعددة
- مراقبة وتنبيه شاملة
- تنفيذ الأمان والامتثال
- تحسين التكلفة وضبط الأداء
- توثيق كامل ودليل تشغيل

**معايير التقييم**:
- جودة التنفيذ الفني
- اكتمال التوثيق
- الالتزام بالأمان وأفضل الممارسات
- تحسين الأداء والتكلفة
- فعالية استكشاف الأخطاء والمراقبة

## موارد الدراسة والمراجع

### الوثائق الرسمية
- [وثائق Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [وثائق Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [مركز بنية Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### موارد المجتمع
- [معرض قوالب AZD](https://azure.github.io/awesome-azd/)
- [منظمة Azure-Samples على GitHub](https://github.com/Azure-Samples)
- [مستودع Azure Developer CLI على GitHub](https://github.com/Azure/azure-dev)

### بيئات التدريب
- [حساب Azure المجاني](https://azure.microsoft.com/free/)
- [الخطة المجانية لـ Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### أدوات إضافية
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [حزمة ملحقات أدوات Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## توصيات جدول الدراسة

### الدراسة بدوام كامل (8 أسابيع)
- **الأسبوعان 1-2**: الوحدتان 1-2 (البداية، التكوين)
- **الأسبوعان 3-4**: الوحدتان 3-4 (النشر، التحقق قبل النشر)
- **الأسبوعان 5-6**: الوحدتان 5-6 (استكشاف الأخطاء، المواضيع المتقدمة)
- **الأسبوعان 7-8**: المشاريع العملية والتقييم النهائي

### الدراسة بدوام جزئي (16 أسبوعًا)
- **الأسبوعان 1-4**: الوحدة 1 (البداية)
- **الأسبوعان 5-7**: الوحدة 2 (التكوين والبيئات)
- **الأسبوعان 8-10**: الوحدة 3 (النشر والتوفير)
- **الأسبوعان 11-12**: الوحدة 4 (التحقق قبل النشر)
- **الأسبوعان 13-14**: الوحدة 5 (استكشاف الأخطاء وإصلاحها)
- **الأسبوعان 15-16**: الوحدة 6 (المواضيع المتقدمة والتقييم)

### الدراسة الذاتية
- أكمل كل وحدة وفقًا لسرعتك الخاصة
- اقضِ وقتًا إضافيًا في المفاهيم الصعبة
- كرر التمارين حتى تحقق الإتقان
- انضم إلى مناقشات المجتمع واطرح الأسئلة

## نصائح للنجاح

### استراتيجيات التعلم الفعالة
1. **الممارسة بانتظام**: قم بنشر التطبيقات بشكل متكرر لبناء ذاكرة عملية
2. **التجربة بلا خوف**: استخدم بيئات التطوير لتجربة تكوينات جديدة
3. **توثيق التعلم**: احتفظ بملاحظات حول الحلول للمشكلات التي تواجهها
4. **الانضمام إلى المجتمع**: شارك في المناقشات وساهم في المشاريع
5. **البقاء على اطلاع**: تابع تحديثات Azure وميزات azd الجديدة

### الأخطاء الشائعة لتجنبها
1. **تجاوز المتطلبات الأساسية**: تأكد من أن لديك معرفة أساسية مناسبة
2. **التسرع في المفاهيم**: خذ وقتك لفهم الأساسيات جيدًا
3. **تجاهل الأمان**: قم دائمًا بتنفيذ أفضل ممارسات الأمان من البداية
4. **عدم الاختبار بشكل كافٍ**: اختبر عمليات النشر في بيئات متعددة
5. **تجنب التوثيق**: التوثيق الجيد ضروري للصيانة

### بناء الخبرة العملية
1. **ابدأ صغيرًا**: ابدأ بتطبيقات بسيطة وزد التعقيد تدريجيًا
2. **التعلم من الفشل**: استخدم تمارين استكشاف الأخطاء كفرص للتعلم
3. **ساهم في المصادر المفتوحة**: شارك قوالبك وحلولك مع المجتمع  
4. **علّم الآخرين**: شرح المفاهيم للآخرين يعزز فهمك الخاص  
5. **ابقَ فضوليًا**: استمر في استكشاف خدمات Azure الجديدة وأنماط التكامل  

---

**التنقل**  
- **الدرس السابق**: [FAQ](faq.md)  
- **الدرس التالي**: [Changelog](../changelog.md)  

**تتبع تقدم الدراسة**: استخدم هذا الدليل لتتبع رحلتك التعليمية وضمان تغطية شاملة لجميع مفاهيم وممارسات Azure Developer CLI.  

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.