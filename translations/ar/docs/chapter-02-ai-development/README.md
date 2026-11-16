# الفصل 2: تطوير يركز على الذكاء الاصطناعي

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 4-5 ساعات بما في ذلك ورشة العمل | **⭐ التعقيد**: متوسط

---

## نظرة عامة

يركز هذا الفصل على نشر تطبيقات مدعومة بالذكاء الاصطناعي باستخدام Azure Developer CLI وخدمات Microsoft Foundry. من تطبيقات الدردشة البسيطة إلى الوكلاء الأذكياء المزودين بالأدوات.

> **مراجعة الإصدار (2026-11-04):** تم التحقق من إرشادات AI CLI مقابل الوثائق/المصدر المنشور `azd` `1.37.2`، `azure.ai.agents` `1.0.0-beta.23`، و `azure.ai.evaluations` `1.0.0-beta.2`. استخدم `azd >= 1.37.0` لسير العمل الموحد. تستخدم التقييمات الآن مساحة اسم `azd ai eval` منفصلة؛ راجع [تغييرات الإصدار وإرشادات الترحيل](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). هذا ليس تحققًا من نشر مباشر.

## أهداف التعلم

من خلال إكمال هذا الفصل، ستتمكن من:
- نشر تطبيقات الذكاء الاصطناعي باستخدام قوالب AZD الجاهزة
- فهم تكامل Microsoft Foundry مع AZD
- تكوين وتخصيص وكلاء الذكاء الاصطناعي باستخدام الأدوات
- نشر تطبيقات RAG (التوليد المعزز بالاستخراج)

---

## 📚 الدروس

| الرقم | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [تكامل Microsoft Foundry](microsoft-foundry-integration.md) | ربط AZD بخدمات Foundry | 30 دقيقة |
| 2 | [دليل وكلاء الذكاء الاصطناعي](agents.md) | نشر وكلاء أذكياء مزودين بالأدوات | 45 دقيقة |
| 3 | [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md) | نشر وتكوين نماذج الذكاء الاصطناعي | 30 دقيقة |
| 4 | [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md) | عملي: استكشاف قالب وتخطيط التحويل | 2-3 ساعات |

---

## 🚀 بداية سريعة

اختر خيارًا واحدًا في دليل جديد فارغ. يقوم الأمر `.` اللاحق بتهيئة الدليل الحالي؛ وإلا يمكن لـ AZD إنشاء دليل فرعي دون تغيير دليل العمل في shell الخاص بك.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 قوالب الذكاء الاصطناعي المميزة

| القالب | الوصف | الخدمات |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | دردشة RAG مع الاستشهادات | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | وكيل ذكي مزود بالأدوات | خدمة وكلاء الذكاء الاصطناعي |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | دردشة ذكاء اصطناعي أساسية | OpenAI + تطبيقات الحاويات |

---

## 💰 الوعي بالتكلفة

هذه نطاقات توضيحية وليست عروض أسعار أو حدود؛ يمكن أن يتجاوز حركة النماذج، وحزم Search/الحوسبة، والمنطقة، والميزات الاختيارية هذه النطاقات. راجع توجيهات التسعير الحالية للعينة المختارة قبل التزويد.

| البيئة | التكلفة الشهرية المقدرة |
|-------------|----------------------|
| التطوير | $80-150 |
| الاختبار | $150-300 |
| الإنتاج | $300-3,500+ |

**نصيحة:** قم بتشغيل `azd down` بعد الاختبار لتجنب الرسوم.

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 1: الأساس](../chapter-01-foundation/README.md) |
| **التالي** | [الفصل 3: الإعداد](../chapter-03-configuration/README.md) |
| **تخطي إلى** | [الفصل 8: أنماط الإنتاج](../chapter-08-production/README.md) |

---

## 📖 الموارد ذات الصلة

- [استكشاف أخطاء الذكاء الاصطناعي وإصلاحها](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ممارسات الذكاء الاصطناعي الإنتاجية](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->