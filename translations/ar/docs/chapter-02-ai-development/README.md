# الفصل 2: التطوير المعتمد على الذكاء الاصطناعي

**📚 الدورة**: [AZD For Beginners](../../README.md) | **⏱️ المدة**: 1-2 ساعة | **⭐ مستوى الصعوبة**: متوسط

---

## نظرة عامة

يركز هذا الفصل على نشر التطبيقات المدعومة بالذكاء الاصطناعي باستخدام Azure Developer CLI وخدمات Microsoft Foundry. من تطبيقات الدردشة البسيطة إلى الوكلاء الأذكياء المزوَّدين بالأدوات.

> **ملاحظة التحقق (2026-06-15):** تمّت مراجعة تدفق الأوامر وإرشادات الامتداد في هذا الفصل مقابل `azd` `1.25.6` وإصدار معاينة امتداد وكيل الذكاء الاصطناعي الحالي `azure.ai.agents` `0.1.40-preview`. إذا كنت تستخدم إصدار AZD أقدم، فقم بالتحديث أولًا ثم تابع التمارين.

## الأهداف التعليمية

من خلال إكمال هذا الفصل، ستتمكن من:
- نشر تطبيقات الذكاء الاصطناعي باستخدام قوالب AZD المُحضّرة مسبقًا
- فهم تكامل Microsoft Foundry مع AZD
- تهيئة وتخصيص الوكلاء الذكيين مع الأدوات
- نشر تطبيقات RAG (التوليد المعزز بالاسترجاع)

---

## 📚 الدروس

| # | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [تكامل Microsoft Foundry](microsoft-foundry-integration.md) | ربط AZD بخدمات Foundry | 30 دقيقة |
| 2 | [دليل وكلاء الذكاء الاصطناعي](agents.md) | نشر وكلاء ذكيين مزودين بالأدوات | 45 دقيقة |
| 3 | [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md) | نشر وتكوين نماذج الذكاء الاصطناعي | 30 دقيقة |
| 4 | [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md) | تطبيقي: اجعل حلّك الخاص بالذكاء الاصطناعي جاهزًا لـ AZD | 60 دقيقة |

---

## 🚀 البدء السريع

```bash
# الخيار 1: تطبيق دردشة RAG
azd init --template azure-search-openai-demo
azd up

# الخيار 2: وكلاء الذكاء الاصطناعي
azd init --template get-started-with-ai-agents
azd up

# الخيار 3: تطبيق دردشة سريع
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 قوالب الذكاء الاصطناعي المميزة

| القالب | الوصف | الخدمات |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | دردشة RAG مع استشهادات | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | وكيل ذكاء اصطناعي مزود بأدوات | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | دردشة ذكية أساسية | OpenAI + Container Apps |

---

## 💰 الوعي بالتكاليف

| البيئة | التكلفة الشهرية المقدرة |
|-------------|----------------------|
| التطوير | $80-150 |
| التجهيز | $150-300 |
| الإنتاج | $300-3,500+ |

**نصيحة:** شغّل `azd down` بعد الاختبار لتجنب التكاليف.

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 1: الأساس](../chapter-01-foundation/README.md) |
| **التالي** | [الفصل 3: التهيئة](../chapter-03-configuration/README.md) |
| **تخطي إلى** | [الفصل 8: أنماط الإنتاج](../chapter-08-production/README.md) |

---

## 📖 موارد ذات صلة

- [استكشاف أخطاء الذكاء الاصطناعي وإصلاحها](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ممارسات الذكاء الاصطناعي في الإنتاج](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->