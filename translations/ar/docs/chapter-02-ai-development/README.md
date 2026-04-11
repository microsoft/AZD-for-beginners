# الفصل 2: التطوير المعتمد على الذكاء الاصطناعي

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 1-2 hours | **⭐ التعقيد**: متوسط

---

## نظرة عامة

يركز هذا الفصل على نشر التطبيقات المدعومة بالذكاء الاصطناعي باستخدام Azure Developer CLI وخدمات Microsoft Foundry. من تطبيقات الدردشة البسيطة إلى الوكلاء الأذكياء المزودين بأدوات.

> **ملاحظة التحقق (2026-03-25):** تم مراجعة تدفق الأوامر وإرشادات الامتداد في هذا الفصل مقابل `azd` `1.23.12` وإصدار امتداد وكيل الذكاء الاصطناعي في المعاينة الحالي `azure.ai.agents` `0.1.18-preview`. إذا كنت تستخدم إصدار AZD أقدم، قم بالتحديث أولاً ثم تابع التمارين.

## أهداف التعلم

عند إكمال هذا الفصل، ستتمكن من:
- نشر تطبيقات الذكاء الاصطناعي باستخدام قوالب AZD الجاهزة
- فهم تكامل Microsoft Foundry مع AZD
- تكوين وتخصيص وكلاء الذكاء الاصطناعي مع الأدوات
- نشر تطبيقات RAG (الإنشاء المعزز بالاسترجاع)

---

## 📚 الدروس

| # | الدرس | الوصف | المدة |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | ربط AZD بخدمات Foundry | 30 دقيقة |
| 2 | [AI Agents Guide](agents.md) | نشر وكلاء ذكيين مزودين بأدوات | 45 دقيقة |
| 3 | [AI Model Deployment](ai-model-deployment.md) | نشر وتكوين نماذج الذكاء الاصطناعي | 30 دقيقة |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | تطبيق عملي: جهز حل الذكاء الاصطناعي الخاص بك ليعمل مع AZD | 60 دقيقة |

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

## 🤖 القوالب المميزة للذكاء الاصطناعي

| القالب | الوصف | الخدمات |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | دردشة RAG مع الاستشهادات | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | وكيل ذكاء اصطناعي مزود بأدوات | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | دردشة ذكاء اصطناعي أساسية | OpenAI + Container Apps |

---

## 💰 الوعي بالتكلفة

| البيئة | التكلفة الشهرية المقدرة |
|-------------|----------------------|
| التطوير | $80-150 |
| الاختبار | $150-300 |
| الإنتاج | $300-3,500+ |

**نصيحة:** نفّذ `azd down` بعد الاختبار لتجنب الرسوم.

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **السابق** | [الفصل 1: الأساس](../chapter-01-foundation/README.md) |
| **التالي** | [الفصل 3: التكوين](../chapter-03-configuration/README.md) |
| **تخطي إلى** | [الفصل 8: أنماط الإنتاج](../chapter-08-production/README.md) |

---

## 📖 موارد ذات صلة

- [استكشاف أخطاء الذكاء الاصطناعي وإصلاحها](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [ممارسات الذكاء الاصطناعي في الإنتاج](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق به. للمعلومات الحساسة أو الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تحريف في التفسير ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->