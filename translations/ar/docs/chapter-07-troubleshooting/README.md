# الفصل 7: استكشاف الأخطاء وإصلاحها وتصحيحها

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 1-1.5 hours | **⭐ التعقيد**: متوسط

---

## نظرة عامة

يساعدك هذا الفصل على تشخيص وحل المشكلات الشائعة عند العمل مع Azure Developer CLI. من فشل النشر إلى المشكلات الخاصة بالذكاء الاصطناعي.

> تم التحقق منه مقابل `azd 1.25.6` في يونيو 2026.

## أهداف التعلم

بإكمال هذا الفصل، سوف:
- تشخيص حالات فشل نشر AZD الشائعة
- تصحيح أخطاء المصادقة ومشكلات الأذونات
- حل مشكلات اتصال خدمات الذكاء الاصطناعي
- استخدام بوابة Azure وCLI لاستكشاف الأخطاء

---

## 📚 الدروس

| # | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [المشكلات الشائعة](common-issues.md) | مشكلات يتم مواجهتها بشكل متكرر | 30 دقيقة |
| 2 | [دليل التصحيح](debugging.md) | استراتيجيات تصحيح الأخطاء خطوة بخطوة | 45 دقيقة |
| 3 | [استكشاف أخطاء الذكاء الاصطناعي](ai-troubleshooting.md) | مشكلات خاصة بالذكاء الاصطناعي | 30 دقيقة |

---

## 🚨 إصلاحات سريعة

### مشكلات المصادقة
```bash
# مطلوب لتدفقات عمل AZD
azd auth login

# اختياري إذا كنت تستخدم أيضًا أوامر Azure CLI مباشرةً
az login

azd auth status
```

### فشل التجهيز
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

## 📋 مرجع رموز الخطأ

| الخطأ | السبب | الحل |
|-------|-------|----------|
| `AuthenticationError` | غير مسجل الدخول | `azd auth login` |
| `ResourceNotFound` | مورد مفقود | تحقق من أسماء الموارد |
| `QuotaExceeded` | حدود الاشتراك | اطلب زيادة الحصة |
| `InvalidTemplate` | خطأ في بناء جملة Bicep | `az bicep build` |
| `Conflict` | المورد موجود | استخدم اسمًا جديدًا أو احذف المورد |
| `Forbidden` | أذونات غير كافية | تحقق من أدوار RBAC |

---

## 🔄 إعادة التعيين والاسترداد

```bash
# إعادة ضبط بسيطة (الاحتفاظ بالموارد، إعادة نشر الكود)
azd deploy --force

# إعادة ضبط كاملة (حذف كل شيء، البدء من جديد)
azd down --force --purge
azd up
```

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 6: ما قبل النشر](../chapter-06-pre-deployment/README.md) |
| **التالي** | [الفصل 8: الإنتاج](../chapter-08-production/README.md) |

---

## 📖 موارد ذات صلة

- [فحوصات ما قبل النشر](../chapter-06-pre-deployment/preflight-checks.md)
- [دليل التكوين](../chapter-03-configuration/configuration.md)
- [مشكلات AZD على GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->