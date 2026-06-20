# ورشة عمل AZD لمطوري الذكاء الاصطناعي

> تم التحقق باستخدام `azd 1.25.6` في يونيو 2026.

> [!IMPORTANT]  
> **تم تجهيز هذه الورشة بدليل يمكنك معاينته في متصفحك المحلي. للبدء، افتح المستودع في GitHub Codespaces، أو في حاوية تطوير، أو استنساخ محلي مع تثبيت MkDocs—ثم انتظر حتى ترى طرفية VS Code نشطة واكتب:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **يجب أن ترى مربع حوار منبثق لفتح صفحة المعاينة في متصفح.**

مرحبًا بك في ورشة العمل العملية لتعلّم Azure Developer CLI (AZD) مع التركيز على نشر تطبيقات الذكاء الاصطناعي. تساعدك هذه الورشة على اكتساب فهم عملي لنماذج AZD في 3 خطوات:

1. **الاكتشاف** - العثور على القالب المناسب لك.
1. **النشر** - نشر والتحقق من أنه يعمل
1. **التخصيص** - التعديل والتكرار لجعله ملكًا لك!

خلال هذه الورشة، سيتم تعريفك أيضًا على أدوات وممارسات العمل الأساسية للمطورين، لمساعدتك في تبسيط رحلتك التطويرية من البداية إلى النهاية.

| | | 
|:---|:---|
| **📚 الصفحة الرئيسية للدورة**| [AZD للمبتدئين](../README.md)|
| **📖 الوثائق** | [البدء مع قوالب الذكاء الاصطناعي](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️قوالب AI** | [قوالب Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 الخطوات التالية** | [شارك في التحدي](#workshop-challenge) |
| | |

## نظرة عامة على الورشة

**المدة:** 3-4 ساعات  
**المستوى:** من المبتدئ إلى المتوسط  
**المتطلبات المسبقة:** الإلمام بـ Azure ومفاهيم الذكاء الاصطناعي و VS Code وأدوات سطر الأوامر.

هذه ورشة عملية تتعلم فيها بالممارسة. بمجرد إكمال التمارين، نوصي بمراجعة منهج AZD للمبتدئين لمواصلة رحلتك التعليمية نحو ممارسات الأمن والإنتاجية الأمثل.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | Set the stage, understand the goals |
| 30 mins | Select AI Template | Explore options and pick starter | 
| 30 mins | Validate AI Template | Deploy default solution to Azure |
| 30 mins | Deconstruct AI Template | Explore structure and configuration |
| 30 mins | Configure AI Template | Activate and try available features |
| 30 mins | Customize AI Template | Adapt the template to your needs |
| 30 mins | Teardown Infrastructure | Cleanup and release resources |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## ما ستتعلمه

فكر في قالب AZD كصندوق رمل تعليمي لاستكشاف القدرات والأدوات المختلفة للتطوير من البداية إلى النهاية على Microsoft Foundry. بنهاية هذه الورشة، يجب أن تكون لديك إحساس حدسي بمختلف الأدوات والمفاهيم في هذا السياق.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Understand tool commands and workflows|
| **AZD Templates**| Understand project structure and config|
| **Azure AI Agent**| Provision & deploy Microsoft Foundry project  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Explore tracing, monitoring and evaluations |
| **Red Teaming**| Explore adversarial testing and mitigations |
| | |

## وحدات الورشة

هل أنت مستعد للبدء؟ تنقل عبر وحدات الورشة:

- [الوحدة 1: اختيار قالب AI](instructions/1-Select-AI-Template.md)
- [الوحدة 2: التحقق من قالب AI](instructions/2-Validate-AI-Template.md) 
- [الوحدة 3: تفكيك قالب AI](instructions/3-Deconstruct-AI-Template.md)
- [الوحدة 4: تهيئة قالب AI](instructions/4-Configure-AI-Template.md)
- [الوحدة 5: تخصيص قالب AI](instructions/5-Customize-AI-Template.md)
- [الوحدة 6: تفكيك البنية التحتية وإزالتها](instructions/6-Teardown-Infrastructure.md)
- [الوحدة 7: الخاتمة والخطوات التالية](instructions/7-Wrap-up.md)

## هل لديك ملاحظات؟

انشر مشكلة في هذا المستودع (وسمها بـ `Workshop`) أو انضم إلينا على [Discord](https://aka.ms/foundry/discord) وانشر في قناة `#get-help`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->