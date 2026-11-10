# الفصل ٤: البنية التحتية ككود والنشر

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: ٢-٣ ساعات قراءة؛ السماح بوقت إضافي لتمارين النشر | **⭐ التعقيد**: متوسط

---

## نظرة عامة

يغطي هذا الفصل أنماط البنية التحتية ككود (IaC) باستخدام قوالب Bicep، توفير الموارد، واستراتيجيات النشر باستخدام Azure Developer CLI.

> هدف مراجعة الأوامر والتكوين: `azd 1.37.2` (نوفمبر ٢٠٢٦). لم يتم تشغيل توفير Azure المباشر خلال المراجعة.

## أهداف التعلم

عند إكمال هذا الفصل، ستتمكن من:
- فهم بنية وصياغة قالب Bicep
- توفير موارد Azure باستخدام `azd provision`
- نشر التطبيقات باستخدام `azd deploy`
- تنفيذ استراتيجيات النشر الأزرق-الأخضر والدوراني

---

## 📚 الدروس

| # | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [توفير الموارد](provisioning.md) | إدارة موارد Azure باستخدام AZD | ٤٥ دقيقة |
| 2 | [دليل النشر](deployment-guide.md) | استراتيجيات نشر التطبيقات | ٤٥ دقيقة |
| 3 | [كتابة قالبك الخاص](custom-templates.md) | بناء ونشر قوالب azd قابلة لإعادة الاستخدام | ٣٠ دقيقة |

---

## 🚀 بداية سريعة

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd deploy` | نشر كود التطبيق |
| `azd up` | توفير + نشر |
| `azd down` | حذف جميع الموارد |

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل ٣: التكوين](../chapter-03-configuration/README.md) |
| **التالي** | [الفصل ٥: حلول متعددة الوكلاء](../chapter-05-multi-agent/README.md) |

---

## 📖 الموارد ذات الصلة

- [التحقق قبل النشر](../chapter-06-pre-deployment/README.md)
- [أمثلة تطبيق الحاويات](../../examples/container-app/README.md)
- [مثال تطبيق قاعدة بيانات](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->