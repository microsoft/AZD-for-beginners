# الفصل 3: التكوين والمصادقة

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 90-150 دقيقة بما في ذلك ممارسة التكامل | **⭐ الصعوبة**: متوسط

---

## نظرة عامة

يغطي هذا الفصل تكوين البيئة، أنماط المصادقة، وأفضل ممارسات الأمان لنشر Azure Developer CLI.

> هدف مراجعة الأوامر والتكوين: `azd 1.37.2` (نوفمبر 2026). لم يتم تشغيل توفير Azure المباشر أثناء المراجعة.

## أهداف التعلم

بعد إكمال هذا الفصل، ستتمكن من:
- إتقان تسلسل التكوين في AZD
- إدارة بيئات متعددة (تطوير، اختبار، إنتاج)
- تنفيذ مصادقة آمنة باستخدام الهويات المدارَة
- تكوين إعدادات مخصصة لكل بيئة

---

## 📚 الدروس

| # | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [دليل التكوين](configuration.md) | إعداد البيئة وإدارتها | 30 دقيقة |
| 2 | [المصادقة والأمان](authsecurity.md) | نماذج الهوية المدارَة وإدارة الوصول القائمة على الدور | 30 دقيقة |

---

## 🚀 بداية سريعة

شغل من جذر **تطبيق azd مُهيأ مسبقًا**، وليس من مستودع الدورة. استخدم أسماء بيئات غير مستخدمة إذا كانت البيئات موجودة بالفعل.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` توضيحي: يؤثر فقط على البنية التحتية إذا كان نموذجك يستهلكه صراحة. القيم العادية لـ `azd env set` تُحفظ محليًا كنص عادي؛ ليست تخزين أسرار آمن.

---

## 🔧 تسلسل التكوين

احتفظ بثلاث واجهات تكوين مختلفة منفصلة: التفضيلات العالمية (`azd config`)، هيكل المشروع (`azure.yaml`)، والقيم الخاصة بكل بيئة (`azd env`). تتجاوز العلامات الإعدادات التي تدعمها فقط؛ لا يوجد تراكب شامل لمتغيرات البيئة التعسفية على `azure.yaml` أو Bicep.

---

## 🔐 أفضل ممارسات الأمان

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 2: تطوير الذكاء الاصطناعي](../chapter-02-ai-development/README.md) |
| **التالي** | [الفصل 4: البنية التحتية](../chapter-04-infrastructure/README.md) |

---

## 📖 موارد ذات صلة

- [فحوصات ما قبل النشر](../chapter-06-pre-deployment/README.md)
- [استكشاف الأخطاء وإصلاحها](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->