# الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيحها

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 1-1.5 ساعة | **⭐ الصعوبة**: متوسط

---

## نظرة عامة

يساعدك هذا الفصل في تشخيص وحل المشكلات الشائعة عند العمل مع Azure Developer CLI. من فشل النشر إلى المشكلات الخاصة بالذكاء الاصطناعي.

> تم مراجعة إرشادات الأوامر مقابل المرجع `azd 1.37.2` الصادر. لم يتم تنفيذ نشرات السحابة. استبدل أسماء الموارد وأرقام التعريف في الأمثلة قبل استخدام الأوامر.

## أهداف التعلم

من خلال إكمال هذا الفصل، ستتمكن من:
- تشخيص فشل نشر AZD الشائع
- تصحيح مشكلات المصادقة والأذونات
- حل مشكلات الاتصال بخدمات الذكاء الاصطناعي
- استخدام بوابة Azure وCLI لاستكشاف الأخطاء وإصلاحها

---

## 📚 الدروس

| الرقم | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [المشكلات الشائعة](common-issues.md) | المشكلات التي يتم مواجهتها بشكل متكرر | 30 دقيقة |
| 2 | [دليل التصحيح](debugging.md) | استراتيجيات التصحيح خطوة بخطوة | 45 دقيقة |
| 3 | [استكشاف أخطاء الذكاء الاصطناعي](ai-troubleshooting.md) | المشكلات الخاصة بالذكاء الاصطناعي | 30 دقيقة |

---

## 🚨 الإصلاحات السريعة

### مشكلات المصادقة
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### فشل التهيئة
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### تعارضات الموارد
افحص المورد الموجود وأخطاء النشر أولاً. لا تحذف بيئة مشتركة أو بيئة الإنتاج لحل تعارض في التسمية. لبيئة **قابلة للإزالة جديدة**، استخدم اسمًا فريدًا:

```bash
azd env new different-name
azd up
```

### تجاوز الحصة
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

تغيير `AZURE_LOCATION` لا ينقل الموارد القائمة وقد يسبب تعارضات موقع عند إعادة النشر.

---

## 📋 مرجع رموز الخطأ

| الخطأ | السبب | الحل |
|-------|-------|----------|
| `AuthenticationError` | غير مسجل الدخول | `azd auth login` |
| `ResourceNotFound` | مورد مفقود | تحقق من أسماء الموارد |
| `QuotaExceeded` | حدود الاشتراك | طلب زيادة الحصة |
| `InvalidTemplate` | خطأ في بناء جملة Bicep | `az bicep build` |
| `Conflict` | المورد موجود | استخدم اسمًا جديدًا أو احذفه |
| `Forbidden` | أذونات غير كافية | تحقق من أدوار RBAC |

---

## 🔄 إعادة التعيين والاسترداد

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

تحذف إعادة التعيين الصلبة البيانات وقد تغير نقاط النهاية. قم بالنسخ الاحتياطي أولاً وراجع المطالبات التفاعلية للحذف. `--force --purge` مناسب فقط للبيئات القابلة للإزالة عند نية الحذف غير القابل للعكس.

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 6: ما قبل النشر](../chapter-06-pre-deployment/README.md) |
| **التالي** | [الفصل 8: الإنتاج](../chapter-08-production/README.md) |

---

## 📖 الموارد ذات الصلة

- [فحوصات ما قبل النشر](../chapter-06-pre-deployment/preflight-checks.md)
- [دليل التهيئة](../chapter-03-configuration/configuration.md)
- [قضايا AZD على GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->