# الفصل 4: البنية التحتية كرمز والنشر

**📚 المقرر**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 1-1.5 ساعة | **⭐ الصعوبة**: متوسط

---

## نظرة عامة

يغطي هذا الفصل أنماط البنية التحتية كرمز (IaC) باستخدام قوالب Bicep، وتوفير الموارد، واستراتيجيات النشر باستخدام Azure Developer CLI.

> تم التحقق مقابل `azd 1.23.12` في مارس 2026.

## أهداف التعلم

بإكمال هذا الفصل، ستتمكن من:
- فهم بنية قوالب Bicep وصياغتها
- توفير موارد Azure باستخدام `azd provision`
- نشر التطبيقات باستخدام `azd deploy`
- تنفيذ استراتيجيات النشر الأزرق-الأخضر والتدريجي

---

## 📚 الدروس

| # | الدرس | الوصف | المدة |
|---|--------|-------------|------|
| 1 | [توفير الموارد](provisioning.md) | إدارة موارد Azure باستخدام AZD | 45 دقيقة |
| 2 | [دليل النشر](deployment-guide.md) | استراتيجيات نشر التطبيقات | 45 دقيقة |

---

## 🚀 بدء سريع

```bash
# التهيئة من القالب
azd init --template azure-functions-python-v2-http

# معاينة ما سيتم إنشاؤه
azd provision --preview

# توفير البنية التحتية فقط
azd provision

# نشر الشيفرة فقط
azd deploy

# أو كلاهما معًا
azd up
```

---

## 📁 بنية مشروع AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 الأوامر الأساسية

| الأمر | الوصف |
|---------|-------------|
| `azd init` | تهيئة المشروع |
| `azd provision` | إنشاء موارد Azure |
| `azd deploy` | نشر شفرة التطبيق |
| `azd up` | إنشاء + نشر |
| `azd down` | حذف جميع الموارد |

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 3: التكوين](../chapter-03-configuration/README.md) |
| **التالي** | [الفصل 5: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md) |

---

## 📖 موارد ذات صلة

- [فحوصات ما قبل النشر](../chapter-06-pre-deployment/README.md)
- [أمثلة تطبيقات الحاويات](../../examples/container-app/README.md)
- [مثال لتطبيق قاعدة بيانات](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المعتمد. للمعلومات الحساسة أو الحرجة، يُنصح بالحصول على ترجمة مهنية من قبل مترجم بشري. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->