# الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيح الأخطاء

**📚 Course**: [AZD للمبتدئين](../../README.md) | **⏱️ Duration**: 1-1.5 ساعة | **⭐ Complexity**: متوسط

---

## نظرة عامة

يساعدك هذا الفصل على تشخيص وحل المشكلات الشائعة عند العمل مع Azure Developer CLI. من إخفاقات النشر إلى المشكلات الخاصة بالذكاء الاصطناعي.

> تم التحقق مقابل `azd 1.23.12` في مارس 2026.

## أهداف التعلم

من خلال إكمال هذا الفصل، ستتمكن من:
- تشخيص إخفاقات نشر AZD الشائعة
- تصحيح مشكلات المصادقة والأذونات
- حل مشكلات اتصال خدمات الذكاء الاصطناعي
- استخدام بوابة Azure وCLI لاستكشاف الأخطاء

---

## 📚 الدروس

| # | الدرس | الوصف | المدة |
|---|--------|-------------|------|
| 1 | [مشكلات شائعة](common-issues.md) | مشكلات يتم مواجهتها بشكل متكرر | 30 دقيقة |
| 2 | [دليل تصحيح الأخطاء](debugging.md) | استراتيجيات تصحيح خطوة بخطوة | 45 دقيقة |
| 3 | [استكشاف أخطاء الذكاء الاصطناعي](ai-troubleshooting.md) | مشكلات خاصة بالذكاء الاصطناعي | 30 دقيقة |

---

## 🚨 إصلاحات سريعة

### مشكلات المصادقة
```bash
# مطلوب لتدفقات عمل AZD
azd auth login

# اختياري إذا كنت تستخدم أيضًا أوامر Azure CLI بشكل مباشر
az login

azd auth status
```

### أخفاقات التهيئة
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### تعارضات الموارد
```bash
azd down --force --purge
azd env new different-name
azd up
```

### تجاوز الحصة
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 مرجع رموز الأخطاء

| الخطأ | السبب | الحل |
|-------|-------|----------|
| `AuthenticationError` | لم يتم تسجيل الدخول | `azd auth login` |
| `ResourceNotFound` | المورد مفقود | تحقق من أسماء الموارد |
| `QuotaExceeded` | حدود الاشتراك | طلب زيادة الحصة |
| `InvalidTemplate` | خطأ في بناء جملة Bicep | `az bicep build` |
| `Conflict` | المورد موجود | استخدم اسمًا جديدًا أو احذف المورد |
| `Forbidden` | أذونات غير كافية | تحقق من أدوار RBAC |

---

## 🔄 إعادة الضبط والاسترداد

```bash
# إعادة ضبط ناعمة (الاحتفاظ بالموارد، إعادة نشر الكود)
azd deploy --force

# إعادة ضبط كاملة (حذف كل شيء، البدء من جديد)
azd down --force --purge
azd up
```

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 6: قبل النشر](../chapter-06-pre-deployment/README.md) |
| **التالي** | [الفصل 8: الإنتاج](../chapter-08-production/README.md) |

---

## 📖 موارد ذات صلة

- [فحوصات ما قبل النشر](../chapter-06-pre-deployment/preflight-checks.md)
- [دليل التكوين](../chapter-03-configuration/configuration.md)
- [قضايا AZD على GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للوصول إلى الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. بالنسبة للمعلومات الحرجة، يوصى بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناجمة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->