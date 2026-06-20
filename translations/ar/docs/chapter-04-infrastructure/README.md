# الفصل 4: البنية التحتية ككود والنشر

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 1-1.5 ساعة | **⭐ التعقيد**: متوسط

---

## نظرة عامة

يغطي هذا الفصل أنماط البنية التحتية ككود (IaC) باستخدام قوالب Bicep، وتجهيز الموارد، واستراتيجيات النشر باستخدام Azure Developer CLI.

> تم التحقق باستخدام `azd 1.25.6` في يونيو 2026.

## أهداف التعلم

بإكمال هذا الفصل، ستتمكن من:
- فهم بنية وصياغة قوالب Bicep
- توفير موارد Azure باستخدام `azd provision`
- نشر التطبيقات باستخدام `azd deploy`
- تنفيذ استراتيجيات النشر الأزرق-الأخضر والنشر التدريجي

---

## 📚 الدروس

| # | الدرس | الوصف | المدة |
|---|--------|-------------|------|
| 1 | [توفير الموارد](provisioning.md) | إدارة موارد Azure باستخدام AZD | 45 دقيقة |
| 2 | [دليل النشر](deployment-guide.md) | استراتيجيات نشر التطبيقات | 45 دقيقة |
| 3 | [كتابة قالبك الخاص](custom-templates.md) | بناء ونشر قوالب azd قابلة لإعادة الاستخدام | 30 دقيقة |

---

## 🚀 البدء السريع

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

## 📁 هيكل مشروع AZD

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
| `azd deploy` | نشر كود التطبيق |
| `azd up` | provision + deploy |
| `azd down` | حذف كل الموارد |

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 3: التكوين](../chapter-03-configuration/README.md) |
| **التالي** | [الفصل 5: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md) |

---

## 📖 موارد ذات صلة

- [الفحوصات قبل النشر](../chapter-06-pre-deployment/README.md)
- [أمثلة تطبيقات الحاويات](../../examples/container-app/README.md)
- [مثال تطبيق قاعدة بيانات](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->